/* ---------------------------------------------------------------------------------
 * Daphne Felt
 * ECEN 5613 - Fall 2025 - Prof. McClure
 * University of Colorado Boulder
 * Edited 10/15/19
 *  --------------------------------------------------------------------------------
 * LAB 3 Pt 2
 * Creating buffers, adding characters to buffers, and freeing/modifying them
 * Also takes user input like the last 2 of your ID and a buffer size
 *  ---------------------------------------------------------------------------------
 * MY LINKER FLAGS (bc it was losing them for some reason):
    --code-loc 0x3000 --code-size 0x5000 --xram-loc 0x400 --xram-size 31744 --iram-size 1024
*/

// Includes
#include <mcs51/8051.h>
#include <at89c51ed2.h>
#include <mcs51reg.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

// my debugging port. Just comment out the define when I don't want to use it
#define DEBUG
#include "debug_port.h"

#define HEAP_SIZE 8192 // have heap.c compiled to this size, is global in xram
extern __xdata unsigned char _sdcc_heap[HEAP_SIZE];

// macro to check if character is alphabet (A-Z, a-z). lowkey didn't know you could do this
// where you make a define that takes an argument but it's super useful
#define IS_ALPHA(c) (((c) >= 'A' && (c) <= 'Z') || ((c) >= 'a' && (c) <= 'z'))

// I/O pin for timing (using P1.0, gonna probe w oscilloscope)
#define TIMING_PIN P1_0
#define TIMING_PIN_HIGH() (P1 |= 0x01)
#define TIMING_PIN_LOW()  (P1 &= ~0x01)

// adding in the dynamic buffer. Had to name it in both places so I could reference it inside of it
typedef struct DynamicBuffer {
    void __xdata *ptr;
    uint16_t size;
    uint8_t buffer_number;
    struct DynamicBuffer __xdata *next;  // node lives in XDATA
} DynamicBuffer;

// struct to hold all buffer info
typedef struct {
    void __xdata *buffer_0;
    void __xdata *buffer_1;
    void __xdata *buffer_2;  // Will be NULL after freeing
    void __xdata *buffer_3;
    void __xdata *buffer_4;
    void __xdata *buffer_5;
    uint16_t user_buffer_size;
    uint16_t buffer_4_size; // bc this is defined by student number
    uint16_t buffer_5_size;

    DynamicBuffer __xdata *dynamic_buffers_head; // linked list of the nodes above
    uint8_t next_buffer_number; // Next number to assign to a new dynamic buffer
} BufferSet;

// count tracking structure. Wanted it all in one place
typedef struct {
    uint16_t alphabet_count;  // Characters in buffer_0
    uint16_t command_count;   // Characters in buffer_1
    uint16_t total_count;     // Total characters since last '?'
    uint16_t buffer_3_count;  // Characters in buffer_3
} CharCounts;

/// STARTUP AND I/O FUNCTIONS ///
unsigned char __sdcc_external_startup(void){
    // Enabling internal RAM
    // 1KB IRAM (0x000-0x3FF) + 31KB XRAM (0x400-0x7FFF)
    AUXR |= 0x02; // Enable EXTRAM bit - allows access to internal XRAM
    AUXR |= 0x0C; // Set XRS1:XRS0 to 11b - maximum internal XRAM
    return 0;
}

// putchar takes a char and TX's it. Blocking.
int putchar (int c){
    while (!TI); // Wait till ready to transmit, TI = 1
    SBUF = c;    // load serial port with transmit value
    TI = 0;      // clear TI flag
    return c;
}

// getchar gets a char from RX. Blocking. Returns char.
int getchar (void){
    while (!RI);     // Wait till ready to receive, RI = 1
    RI = 0;          // clear RI flag
    return SBUF;     // return character from SBUF
}

// putstr takes a string (char array) and prints till it finds a NULL.
int putstr (char *s){
    int i = 0;
    while (*s) {     // output characters until NULL found
        putchar(*s++);
        i++;
    }
    return i+1;
}

//////////// PHASE ONEEEE ////////////

// Function to get some number input from user
uint16_t get_number(void){
    int max_digits = 4; // max 4 digits for 0-9999, which covers student num and buffer size

    char buffer[5]; // adding in Null char
    uint8_t idx = 0;
    char c;

    while(1) {
        c = getchar();

        if (c == '\r' || c == '\n') {
            buffer[idx] = '\0';
            putstr("\n\r");
            break; // only exit once they're done entering the number
        }
        else if (c >= '0' && c <= '9' && idx < max_digits) { // is a number and also space in buffer
            buffer[idx++] = c; // adding the char and then moving the buffer up
            putchar(c);  // Echo the character onto the terminal
        }
    }

    return atoi(buffer);
}

uint16_t get_student_number(void){
    // get student number
    uint8_t student_number;
    putstr("Enter the last two digits of your CU student ID (00-99): ");
    student_number = (uint8_t)get_number();

    // and validate it
    while(student_number > 99) { // don't really need to check lower bound bc uint8_t
        putstr("Invalid input. Please enter a number between 00 and 99: ");
        student_number = (uint8_t)get_number();
    }

    printf("Student number: %u\n\r\n\r", (uint16_t)student_number);
    return student_number;
}

uint16_t get_buffer_size(void){
    uint16_t size;
    putstr("Enter buffer size (48-1024 bytes, must be divisible by 16): ");
    size = get_number();

    // Validate buffer size
    while(size < 48 || size > 1024 || size % 16 != 0) {
        if (size < 48 || size > 1024) {
            putstr("Error: Buffer size must be between 48 and 1024 bytes.\n\r");
        } else if (size % 16 != 0) {
            putstr("Error: Buffer size must be evenly divisible by 16.\n\r");
        }
        putstr("Please enter a valid buffer size: ");
        size = get_number();
    }

    printf("Buffer size: %u bytes\n\r\n\r", size);
    return size;
}

// Function to allocate buffers, returns 1 on success, 0 on failure
uint8_t allocate_buffers(BufferSet *buffers, uint8_t student_number){
    while(1) {
        putstr("\nAllocating buffers...\n\r");

        buffers->user_buffer_size = get_buffer_size(); // prompting the user

        // OK so I do this over and over and over again:
        // creat new buffer w malloc
        // check if NULL
        // if NULL, free all previous buffers and restart
        // if not NULL, print address and move on

        // buffer 0
        buffers->buffer_0 = (void __xdata *)malloc(buffers->user_buffer_size);
        if (buffers->buffer_0 == NULL) {
            putstr("Error: Failed to allocate buffer_0\n\r");
            putstr("Please choose a smaller buffer size.\n\r\n\r");
            continue;
        }
        printf("buffer_0 allocated at 0x%04X\n\r", (uint16_t)buffers->buffer_0);
        // buffer 1 
        buffers->buffer_1 = (void __xdata *)malloc(buffers->user_buffer_size);
        if (buffers->buffer_1 == NULL) {
            putstr("Error: Failed to allocate buffer_1\n\r");
            free(buffers->buffer_0);
            buffers->buffer_0 = NULL;
            putstr("Freed buffer_0. Please choose a smaller buffer size.\n\r\n\r");
            continue;
        }
        printf("buffer_1 allocated at 0x%04X\n\r", (uint16_t)buffers->buffer_1);
        // buffer 2
        buffers->buffer_2 = (void __xdata *)malloc(buffers->user_buffer_size);
        if (buffers->buffer_2 == NULL) {
            putstr("Error: Failed to allocate buffer_2\n\r");
            free(buffers->buffer_0);
            free(buffers->buffer_1);
            buffers->buffer_0 = NULL;
            buffers->buffer_1 = NULL;
            putstr("Freed buffers. Please choose a smaller buffer size.\n\r\n\r");
            continue;
        }
        printf("buffer_2 allocated at 0x%04X\n\r", (uint16_t)buffers->buffer_2);
        // buffer 3
        buffers->buffer_3 = (void __xdata *)malloc(buffers->user_buffer_size);
        if (buffers->buffer_3 == NULL) {
            putstr("Error: Failed to allocate buffer_3\n\r");
            free(buffers->buffer_0);
            free(buffers->buffer_1);
            free(buffers->buffer_2);
            buffers->buffer_0 = NULL;
            buffers->buffer_1 = NULL;
            buffers->buffer_2 = NULL;
            putstr("Freed buffers. Please choose a smaller buffer size.\n\r\n\r");
            continue;
        }
        printf("buffer_3 allocated at 0x%04X\n\r", (uint16_t)buffers->buffer_3);

        // free buffer_2
        putstr("Freeing buffer_2...\n\r");
        free(buffers->buffer_2);
        buffers->buffer_2 = NULL;
        putstr("buffer_2 freed.\n\r\n\r");
        // buffer 4 - size based on student number
        buffers->buffer_4_size = 10 * (student_number + 1);
        printf("Allocating buffer_4 (size: %u bytes)...\n\r", buffers->buffer_4_size);
        buffers->buffer_4 = (void __xdata *)malloc(buffers->buffer_4_size);
        if (buffers->buffer_4 == NULL) {
            putstr("Error: Failed to allocate buffer_4\n\r");
            free(buffers->buffer_0);
            free(buffers->buffer_1);
            free(buffers->buffer_3);
            buffers->buffer_0 = NULL;
            buffers->buffer_1 = NULL;
            buffers->buffer_3 = NULL;
            putstr("Freed buffers. Please choose a smaller buffer size.\n\r\n\r");
            continue;
        }
        printf("buffer_4 allocated at 0x%04X\n\r", (uint16_t)buffers->buffer_4);

        // last one, buffer_5
        buffers->buffer_5_size = 2 * buffers->user_buffer_size;
        printf("Allocating buffer_5 (size: %u bytes)...\n\r", buffers->buffer_5_size);
        buffers->buffer_5 = (void __xdata *)malloc(buffers->buffer_5_size);
        if (buffers->buffer_5 == NULL) {
            putstr("Error: Failed to allocate buffer_5\n\r");
            free(buffers->buffer_0);
            free(buffers->buffer_1);
            free(buffers->buffer_3);
            free(buffers->buffer_4);
            buffers->buffer_0 = NULL;
            buffers->buffer_1 = NULL;
            buffers->buffer_3 = NULL;
            buffers->buffer_4 = NULL;
            putstr("Freed buffers. Please choose a smaller buffer size.\n\r\n\r");
            continue;
        }
        printf("buffer_5 allocated at 0x%04X\n\r", (uint16_t)buffers->buffer_5);

        // All buffers allocated successfully
        putstr("All buffers allocated successfully!\n\r\n\r");

        // initialize dynamic buffer list (for phase 3)
        buffers->dynamic_buffers_head = NULL;
        buffers->next_buffer_number = 6; // bc already did buffers 0-5

        break;
    }

    return 1;  // Success!!
}

// Function to print buffer information
void print_buffer_info(const char *name, void __xdata *ptr, uint16_t size){
    uint16_t start_addr = (uint16_t)ptr;
    uint16_t end_addr = start_addr + size - 1;

    printf("%s:\n\r", name);
    printf("Start Address: 0x%04X\n\r", start_addr);
    printf("End Address: 0x%04X\n\r", end_addr);
    printf("Size: %u bytes\n\r", size);
}

void print_phase_one_info(uint8_t student_number, BufferSet *buffers){
    putstr("---MEMORY ALLOCATION SUMMARY-------\n\r\n\r");
    printf("Student Number: %u\n\r", (uint16_t)student_number);
    printf("User Buffer Size: %u bytes\n\r\n\r", buffers->user_buffer_size);

    // Print heap information
    printf("HEAP:\n\r");
    printf("  Start Address: 0x%04X\n\r", (uint16_t)_sdcc_heap);
    printf("  End Address: 0x%04X\n\r", (uint16_t)_sdcc_heap + HEAP_SIZE - 1);
    printf("  Size: %u bytes\n\r\n\r", HEAP_SIZE);

    // Print buffer information for EVERYTHING
    if (buffers->buffer_0) print_buffer_info("buffer_0", buffers->buffer_0, buffers->user_buffer_size);
    if (buffers->buffer_1) print_buffer_info("buffer_1", buffers->buffer_1, buffers->user_buffer_size);
    if (buffers->buffer_2) print_buffer_info("buffer_2", buffers->buffer_2, buffers->user_buffer_size);
    if (buffers->buffer_3) print_buffer_info("buffer_3", buffers->buffer_3, buffers->user_buffer_size);
    if (buffers->buffer_4) print_buffer_info("buffer_4", buffers->buffer_4, buffers->buffer_4_size);
    if (buffers->buffer_5) print_buffer_info("buffer_5", buffers->buffer_5, buffers->buffer_5_size);
}

//////////// PHASE TWOOOOO ////////////

// convert buffer to lowercase for chars up to count
void to_lowercase(__xdata uint8_t *buffer, uint16_t count){
    uint16_t i;
    for (i = 0; i < count; i++) {
        if (buffer[i] >= 'A' && buffer[i] <= 'Z') {
            buffer[i] = buffer[i] + 32;  // Convert to lowercase, can do this because ASCII
        }
    }
}

// display buffer contents in hex format (16 bytes per line)
void display_hex_buffer(const char *name, __xdata uint8_t *buffer, uint16_t count){
    uint16_t i, j;
    uint16_t addr;

    printf("\n\r%s (Hex Dump):\n\r", name);
    if (count == 0) {
        putstr("  Buffer is empty\n\r");
        return;
    }
    for (i = 0; i < count; i += 16) { // jummp 16 bytes at a time
        addr = (uint16_t)buffer + i;
        printf("%04X: ", addr);

        // Print all 16 bytes
        for (j = 0; j < 16 && (i + j) < count; j++) {
            printf("%02X ", buffer[i + j]);
        }
        putstr("\n\r");
    }
}

// Display buffer contents as ASCII (48 chars per line)
void display_ascii_buffer(__xdata uint8_t *buffer, uint16_t count){
    uint16_t i;
    uint8_t line_count = 0;

    for (i = 0; i < count; i++) {
        putchar(buffer[i]);
        line_count++;
        if (line_count >= 48) { // make new line after 48 chars and restart
            putstr("\n\r");
            line_count = 0;
        }
    }
    if (line_count > 0) {
        putstr("\n\r"); // hit final newline
    }
}

// Generate heap report
void generate_heap_report(BufferSet *buffers, CharCounts *counts){
    putstr("\n\r");
    putstr("----------HEAP STATUS REPORT----------\n\r");

    printf("Total characters received: %u\n\r", counts->total_count);
    printf("Alphabet characters: %u\n\r", counts->alphabet_count);
    printf("Command characters: %u\n\r\n\r", counts->command_count);

    // Heap info
    printf("HEAP:\n\r");
    printf("  Start: 0x%04X  End: 0x%04X  Size: %u bytes\n\r\n\r",
           (uint16_t)_sdcc_heap,
           (uint16_t)_sdcc_heap + HEAP_SIZE - 1,
           HEAP_SIZE);

    // Buffer 0
    if (buffers->buffer_0) {
        printf("buffer_0:\n\r");
        printf("  Start: 0x%04X  End: 0x%04X  Size: %u bytes\n\r",
               (uint16_t)buffers->buffer_0,
               (uint16_t)buffers->buffer_0 + buffers->user_buffer_size - 1,
               buffers->user_buffer_size);
        printf("  Alphabet chars: %u  Free: %u\n\r\n\r",
               counts->alphabet_count,
               buffers->user_buffer_size - counts->alphabet_count);
    }

    // Buffer 1
    if (buffers->buffer_1) {
        printf("buffer_1:\n\r");
        printf("  Start: 0x%04X  End: 0x%04X  Size: %u bytes\n\r",
               (uint16_t)buffers->buffer_1,
               (uint16_t)buffers->buffer_1 + buffers->user_buffer_size - 1,
               buffers->user_buffer_size);
        printf("  Command chars: %u  Free: %u\n\r\n\r",
               counts->command_count,
               buffers->user_buffer_size - counts->command_count);
    }

    // Buffer 3
    if (buffers->buffer_3) {
        printf("buffer_3:\n\r");
        printf("  Start: 0x%04X  End: 0x%04X  Size: %u bytes\n\r",
               (uint16_t)buffers->buffer_3,
               (uint16_t)buffers->buffer_3 + buffers->user_buffer_size - 1,
               buffers->user_buffer_size);
        printf("  Characters: %u  Free: %u\n\r\n\r",
               counts->buffer_3_count,
               buffers->user_buffer_size - counts->buffer_3_count);
    }

    // Buffer 4
    if (buffers->buffer_4) {
        printf("buffer_4:\n\r");
        printf("  Start: 0x%04X  End: 0x%04X  Size: %u bytes\n\r\n\r",
               (uint16_t)buffers->buffer_4,
               (uint16_t)buffers->buffer_4 + buffers->buffer_4_size - 1,
               buffers->buffer_4_size);
    }

    // Buffer 5
    if (buffers->buffer_5) {
        printf("buffer_5:\n\r");
        printf("  Start: 0x%04X  End: 0x%04X  Size: %u bytes\n\r\n\r",
               (uint16_t)buffers->buffer_5,
               (uint16_t)buffers->buffer_5 + buffers->buffer_5_size - 1,
               buffers->buffer_5_size);
    }

    { // These brackets are just to scope the node variable so I can reuse the name later
    // and I don't have to define it at the top of the function
        DynamicBuffer __xdata *node = buffers->dynamic_buffers_head;
        if (node) putstr("Dynamic buffers:\n\r");
        while (node) {
            printf("  buffer_%u: Start: 0x%04X  End: 0x%04X  Size: %u bytes\n\r",
                (uint16_t)node->buffer_number,
                (uint16_t)node->ptr,
                (uint16_t)node->ptr + node->size - 1,
                node->size);
            node = node->next; // step through the list
        }
        if (buffers->dynamic_buffers_head) putstr("\n\r");
    }

    putstr("---------------------\n\r\n\r");
}

// Clear all buffers (set to 0x00)
void clear_all_buffers(BufferSet *buffers, CharCounts *counts){
    uint16_t i;

    putstr("\n\rClearing all buffers...\n\r");

    // One at a time, checking and clearing if not NULL
    if (buffers->buffer_0) {
        for (i = 0; i < buffers->user_buffer_size; i++) {
            ((__xdata uint8_t *)buffers->buffer_0)[i] = 0x00;
        }
    }
    if (buffers->buffer_1) {
        for (i = 0; i < buffers->user_buffer_size; i++) {
            ((__xdata uint8_t *)buffers->buffer_1)[i] = 0x00;
        }
    }
    if (buffers->buffer_3) {
        for (i = 0; i < buffers->user_buffer_size; i++) {
            ((__xdata uint8_t *)buffers->buffer_3)[i] = 0x00;
        }
    }
    if (buffers->buffer_4) {
        for (i = 0; i < buffers->buffer_4_size; i++) {
            ((__xdata uint8_t *)buffers->buffer_4)[i] = 0x00;
        }
    }
    if (buffers->buffer_5) {
        for (i = 0; i < buffers->buffer_5_size; i++) {
            ((__xdata uint8_t *)buffers->buffer_5)[i] = 0x00;
        }
    }

    // Also clear any dynamic buffers (linked list)
    { // doing the scope thing again
        DynamicBuffer __xdata *node = buffers->dynamic_buffers_head;
        while (node) {
            if (node->ptr) {
                __xdata uint8_t *p = (__xdata uint8_t *)node->ptr;
                uint16_t k;
                for (k = 0; k < node->size; k++) {
                    p[k] = 0x00;
                }
            }
            node = node->next;
        }
    }

    // Reset counts
    counts->alphabet_count = 0;
    counts->command_count = 0;
    counts->buffer_3_count = 0;

    putstr("All buffers cleared!\n\r\n\r");
}

// Free all buffers
void free_all_buffers(BufferSet *buffers){
    putstr("\n\rFreeing all buffers...\n\r");

    if (buffers->buffer_0) { free(buffers->buffer_0); buffers->buffer_0 = NULL; }
    if (buffers->buffer_1) { free(buffers->buffer_1); buffers->buffer_1 = NULL; }
    if (buffers->buffer_3) { free(buffers->buffer_3); buffers->buffer_3 = NULL; }
    if (buffers->buffer_4) { free(buffers->buffer_4); buffers->buffer_4 = NULL; }
    if (buffers->buffer_5) { free(buffers->buffer_5); buffers->buffer_5 = NULL; }

    // Free dynamic buffer list
    {
        DynamicBuffer __xdata *curr = buffers->dynamic_buffers_head;
        while (curr != NULL) {
            DynamicBuffer __xdata *next = curr->next;
            if (curr->ptr) {
                free(curr->ptr);
            }
            free(curr);
            curr = next;
        }
        buffers->dynamic_buffers_head = NULL;
        buffers->next_buffer_number = 6;
    }

    putstr("All buffers freed!\n\r\n\r");
}

//////////// PHASE THREEEEE ////////////

// Allocate a new dynamic buffer
void allocate_dynamic_buffer(BufferSet *buffers)
{
    uint16_t size;
    void __xdata *data_ptr;
    DynamicBuffer __xdata *node;

    putstr("\n\rEnter buffer size (200-600 bytes): ");
    size = get_number();

    if (size < 200 || size > 600) {
        putstr("Error: Buffer size must be between 200 and 600 bytes.\n\r\n\r");
        return;
    }
    // Allocate payload first - which is going to store the actual data about the buffer
    data_ptr = malloc(size);
    if (data_ptr == NULL) {
        printf("Error: Failed to allocate buffer_%u (%u bytes)\n\r",
               (uint16_t)buffers->next_buffer_number, size);
        putstr("Insufficient heap space.\n\r\n\r");
        return;
    }
    // Allocate node
    node = (DynamicBuffer __xdata *)malloc(sizeof(DynamicBuffer));
    if (node == NULL) {
        // rollback payload allocation
        free(data_ptr);
        printf("Error: Failed to allocate control block for buffer_%u\n\r",
               (uint16_t)buffers->next_buffer_number);
        putstr("Insufficient heap space.\n\r\n\r");
        return;
    }

    // Initialize and push
    node->ptr = data_ptr;
    node->size = size;
    node->buffer_number = buffers->next_buffer_number;
    node->next = buffers->dynamic_buffers_head;
    buffers->dynamic_buffers_head = node;

    printf("Success: buffer_%u allocated at 0x%04X (%u bytes)\n\r\n\r",
        (uint16_t)node->buffer_number,
        (uint16_t)node->ptr,
        node->size);

    buffers->next_buffer_number++;
}

// Delete a dynamic buffer
void delete_dynamic_buffer(BufferSet *buffers)
{
    uint16_t buffer_num;

    putstr("\n\rEnter buffer number to delete: ");
    buffer_num = get_number();

    // block 0 and 1
    if (buffer_num == 0 || buffer_num == 1) {
        putstr("Error: Cannot delete buffer_0 or buffer_1.\n\r\n\r");
        return;
    }
    // Allow deletion of fixed buffers 3/4/5 - so not doing dynamic lookup yet
    if (buffer_num == 3 && buffers->buffer_3 != NULL) {
        printf("Deleting buffer_3 at 0x%04X\n\r", (uint16_t)buffers->buffer_3);
        free(buffers->buffer_3);
        buffers->buffer_3 = NULL;
        putstr("buffer_3 deleted successfully.\n\r\n\r");
        return;
    }
    if (buffer_num == 4 && buffers->buffer_4 != NULL) {
        printf("Deleting buffer_4 at 0x%04X\n\r", (uint16_t)buffers->buffer_4);
        free(buffers->buffer_4);
        buffers->buffer_4 = NULL;
        putstr("buffer_4 deleted successfully.\n\r\n\r");
        return;
    }
    if (buffer_num == 5 && buffers->buffer_5 != NULL) {
        printf("Deleting buffer_5 at 0x%04X\n\r", (uint16_t)buffers->buffer_5);
        free(buffers->buffer_5);
        buffers->buffer_5 = NULL;
        putstr("buffer_5 deleted successfully.\n\r\n\r");
        return;
    }

    // Look for a dynamic buffer with that number
    {
        DynamicBuffer __xdata *prev = NULL;
        DynamicBuffer __xdata *curr = buffers->dynamic_buffers_head;

        while (curr != NULL) {
            if (curr->buffer_number == buffer_num) {
                printf("Deleting buffer_%u at 0x%04X\n\r",
                       (uint16_t)buffer_num, (uint16_t)curr->ptr);
                // unlink
                if (prev == NULL) {
                    buffers->dynamic_buffers_head = curr->next;
                } else {
                    prev->next = curr->next;
                }
                // free payload and node
                free(curr->ptr);
                free(curr);
                printf("buffer_%u deleted successfully.\n\r\n\r", (uint16_t)buffer_num);
                return;
            }
            prev = curr;
            curr = curr->next;
        }
    }

    // Not found
    printf("Error: buffer_%u does not exist or is already deleted.\n\r\n\r",
           (uint16_t)buffer_num);
}

// character processing loop
void phase_two(BufferSet *buffers){
    char c;
    CharCounts counts = {0, 0, 0, 0};

    //  just save these as their own bc gonna use them so much
    __xdata uint8_t *buf0 = (__xdata uint8_t *)buffers->buffer_0;
    __xdata uint8_t *buf1 = (__xdata uint8_t *)buffers->buffer_1;
    __xdata uint8_t *buf3 = (__xdata uint8_t *)buffers->buffer_3;

    putstr("\n\r---- starting character processing ----\n\r");
    putstr("COMMANDS:\n\r");
    putstr("?: Heap report and empty buffers\n\r");
    putstr("=: Display hex dump (no empty)\n\r");
    putstr("%: Clear all buffers to 0x00\n\r");
    putstr("@: Free all and restart\n\r");
    putstr("$: Copy buffer_0 to buffer_3\n\r");
    putstr("#: Convert buffer_3 to lowercase\n\r");
    putstr("+: Allocate new dynamic buffer\n\r");
    putstr("-: Delete a buffer by number\n\r");
    putstr("\nGO FOR IT!\n\r\n\r");

    while(1) {
        c = getchar();

        // echo characters immediately, w special case for newline
        if (c == '\r' || c == '\n') {
            putstr("\n\r");  // Proper newline
        } else {
            putchar(c);  // Echo other characters normally
        }

        counts.total_count++;

        // check for special commands
        if (c == '?') { // Generate report and empty buffers
            generate_heap_report(buffers, &counts);

            putstr("Buffer contents:\n\r");
            if (counts.alphabet_count > 0) {
                putstr("Alphabet characters:\n\r");
                display_ascii_buffer(buf0, counts.alphabet_count);
            }
            if (counts.command_count > 0) {
                putstr("Command characters:\n\r");
                display_ascii_buffer(buf1, counts.command_count);
            }
            putstr("showing buffer 3 just for fun:\n\r");
            if (counts.buffer_3_count > 0) {
                display_ascii_buffer(buf3, counts.buffer_3_count);
            }

            // empty buffers
            counts.alphabet_count = 0;
            counts.command_count = 0;
            counts.total_count = 0;
        }
        else if (c == '=') {
            // Just show hex dump and dont empty
            putstr("\n\r");
            display_hex_buffer("buffer_0", buf0, counts.alphabet_count);
            display_hex_buffer("buffer_1", buf1, counts.command_count);
            putstr("\n\r");
        }
        else if (c == '%') {
            // Clear all buffers
            clear_all_buffers(buffers, &counts);
            counts.total_count = 0;
        }
        else if (c == '@') {
            // Free all and restart
            free_all_buffers(buffers);
            return;  // Return to main to restart
        }
        else if (c == '$') {
            // Copy buffer_0 to buffer_3
            putstr("\n\rCopying buffer_0 to buffer_3...\n\r");
            TIMING_PIN_HIGH();
            memcpy(buf3, buf0, counts.alphabet_count); // built in function that goes real fast
            TIMING_PIN_LOW();
            counts.buffer_3_count = counts.alphabet_count;
            putstr("Copy complete!\n\r\n\r");
        }
        else if (c == '#') {
            // Convert buffer_3 to lowercase
            putstr("\n\rConverting buffer_3 to lowercase...\n\r");
            TIMING_PIN_HIGH();
            to_lowercase(buf3, counts.buffer_3_count);
            TIMING_PIN_LOW();
            putstr("Conversion complete!\n\r\n\r");
        }
        else if (c == '+') {
            allocate_dynamic_buffer(buffers);
        }
        else if (c == '-') {
            delete_dynamic_buffer(buffers);
        }
        else if (IS_ALPHA(c)) {
            // Store alphabet character in buffer_0
            if (counts.alphabet_count < buffers->user_buffer_size) {
                buf0[counts.alphabet_count++] = c;
            }
            // Otherwise discard (buffer full)
        }
        else {
            // Store command character in buffer_1
            if (counts.command_count < buffers->user_buffer_size) {
                buf1[counts.command_count++] = c;
            }
            // Otherwise discard (buffer full)
        }
    }
}

// ========== MAIN ==========

void main(void)
{
    uint8_t student_number;
    BufferSet buffers = {0};

    // init timing pin as output (P1.0)
    P1 = 0x00;

    while(1){
        putstr("\n\r -------- Heap Memory Management Program ---------------\n\r");

        DEBUGPORT(DEBUG_1); // starting phase 1

        // get student number and allocate buffers
        student_number = get_student_number();
        allocate_buffers(&buffers, student_number);
        print_phase_one_info(student_number, &buffers);

        // now do the whole character processing buffer thing in phase two
        DEBUGPORT(DEBUG_2); // starting phase 2
        phase_two(&buffers); // only returns if user pressed '@', which means free all and restart
    }
}