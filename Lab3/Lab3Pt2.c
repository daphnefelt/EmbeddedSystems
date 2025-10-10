// Includes
#include <mcs51/8051.h>
#include <at89c51ed2.h>
#include <mcs51reg.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#define HEAP_SIZE 8192

// Global heap space in XRAM
extern __xdata unsigned char _sdcc_heap[HEAP_SIZE];

unsigned char __sdcc_external_startup(void)
{
    // Enabling internal RAM
    // 1KB IRAM (0x000-0x3FF) + 31KB XRAM (0x400-0x7FFF)
    AUXR |= 0x02; // Enable EXTRAM bit - allows access to internal XRAM
    AUXR |= 0x0C; // Set XRS1:XRS0 to 11b - maximum internal XRAM
    return 0;
}

// putchar takes a char and TX's it. Blocking.
int putchar (int c)
{
    while (!TI); // Wait till ready to transmit, TI = 1
    SBUF = c;    // load serial port with transmit value
    TI = 0;      // clear TI flag
    return c;
}

// getchar gets a char from RX. Blocking. Returns char.
int getchar (void)
{
    while (!RI);     // Wait till ready to receive, RI = 1
    RI = 0;          // clear RI flag
    return SBUF;     // return character from SBUF
}

// putstr takes a string (char array) and prints till it finds a NULL.
int putstr (char *s)
{
    int i = 0;
    while (*s) {     // output characters until NULL found
        putchar(*s++);
        i++;
    }
    return i+1;
}

// Function to get some number input from user
uint16_t get_number(void)
{
    int max_digits = 4; // max 4 digits for 0-9999, which covers student num and buffer size

    char buffer[max_digits + 1]; // adding in Null char
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
    
    return atoi(buffer); // so this func just converts anything i have in the buffer, even with white space, to an int
}

uint16_t get_student_number(void)
{
    // get student number
    uint8_t student_number;
    putstr("Enter the last two digits of your CU student ID (00-99): ");
    student_number = (uint8_t)get_number();
    
    // and validate it
    while(student_number > 99 || student_number < 0) {
        putstr("Invalid input. Please enter a number between 00 and 99: ");
        student_number = (uint8_t)get_number();
    }
    
    printf("Student number: %u\n\r\n\r", (uint16_t)student_number);
    return student_number;
}

uint16_t get_buffer_size(void)
{
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

// Structure to hold all buffer information
typedef struct {
    __xdata void *buffer_0;
    __xdata void *buffer_1;
    __xdata void *buffer_2;  // Will be NULL after freeing
    __xdata void *buffer_3;
    __xdata void *buffer_4;
    __xdata void *buffer_5;
    uint16_t user_buffer_size;
    uint16_t buffer_4_size;
    uint16_t buffer_5_size;
} BufferSet;

// Function to allocate buffers, returns 1 on success, 0 on failure
uint8_t allocate_buffers(BufferSet *buffers, uint8_t student_number)
{
    while(1) {
        putstr("\nAllocating buffers...\n\r");
        
        buffers->user_buffer_size = get_buffer_size();
        
        buffers->buffer_0 = malloc(buffers->user_buffer_size);
        if (buffers->buffer_0 == NULL) {
            putstr("Error: Failed to allocate buffer_0\n\r");
            putstr("Please choose a smaller buffer size.\n\r\n\r");
            continue;
        }
        printf("buffer_0 allocated at 0x%04X\n\r", (uint16_t)buffers->buffer_0);
        
        buffers->buffer_1 = malloc(buffers->user_buffer_size);
        if (buffers->buffer_1 == NULL) {
            putstr("Error: Failed to allocate buffer_1\n\r");
            free(buffers->buffer_0);
            buffers->buffer_0 = NULL;
            putstr("Freed buffer_0. Please choose a smaller buffer size.\n\r\n\r");
            continue;
        }
        printf("buffer_1 allocated at 0x%04X\n\r", (uint16_t)buffers->buffer_1);
        
        buffers->buffer_2 = malloc(buffers->user_buffer_size);
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
        
        buffers->buffer_3 = malloc(buffers->user_buffer_size);
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
        
        buffers->buffer_4_size = 10 * (student_number + 1);
        printf("Allocating buffer_4 (size: %u bytes)...\n\r", buffers->buffer_4_size);
        buffers->buffer_4 = malloc(buffers->buffer_4_size);
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
        buffers->buffer_5 = malloc(buffers->buffer_5_size);
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
        break;
    }
    
    return 1;  // Success!!
}

// Function to print buffer information
void print_buffer_info(const char *name, __xdata void *ptr, uint16_t size)
{
    uint16_t start_addr = (uint16_t)ptr;
    uint16_t end_addr = start_addr + size - 1;
    
    printf("%s:\n\r", name);
    printf("  Start Address: 0x%04X\n\r", start_addr);
    printf("  End Address:   0x%04X\n\r", end_addr);
    printf("  Size:          %u bytes\n\r", size);
}

void print_phase_one_info(uint8_t student_number, BufferSet *buffers)
{
    putstr("=== MEMORY ALLOCATION SUMMARY ===\n\r\n\r");
    printf("Student Number: %u\n\r", (uint16_t)student_number);
    printf("User Buffer Size: %u bytes\n\r\n\r", buffers->user_buffer_size);

    // Print heap information
    printf("HEAP:\n\r");
    printf("  Start Address: 0x%04X\n\r", (uint16_t)_sdcc_heap);
    printf("  End Address:   0x%04X\n\r", (uint16_t)_sdcc_heap + HEAP_SIZE - 1);
    printf("  Size:          %u bytes\n\r\n\r", HEAP_SIZE);
    
    // Print buffer information
    if (buffers->buffer_0) print_buffer_info("buffer_0", buffers->buffer_0, buffers->user_buffer_size);
    if (buffers->buffer_1) print_buffer_info("buffer_1", buffers->buffer_1, buffers->user_buffer_size);
    if (buffers->buffer_2) print_buffer_info("buffer_2", buffers->buffer_2, buffers->user_buffer_size);
    if (buffers->buffer_3) print_buffer_info("buffer_3", buffers->buffer_3, buffers->user_buffer_size);
    if (buffers->buffer_4) print_buffer_info("buffer_4", buffers->buffer_4, buffers->buffer_4_size);
    if (buffers->buffer_5) print_buffer_info("buffer_5", buffers->buffer_5, buffers->buffer_5_size);
}

void main(void)
{
    uint8_t student_number;
    // Init ALL the diff buffers i'm gonna use to null so i can check later if they were allocated
    BufferSet buffers = {0};
    
    putstr("\n\r=== Running Heap Memory Management Program ===\n\r");
    
    // allocating the heap - NEED TO DO THIS
    /* 
    sdcc -c _heap.c -D HEAP_SIZE=8192 -mmcs51 --model-large
    sdcc -c main.c -mmcs51 --model-large --xram-loc 0x400 --xram-size 0x7C00
    sdcc main.rel _heap.rel -mmcs51 --model-large --xram-loc 0x400 --xram-size 0x7C00 --code-loc 0x3000 --code-size 0x5000 -o main.ihx
    */

    // get student number and buffer size
    student_number = get_student_number();
        
    // allocate buffers in a loop until successful
    allocate_buffers(&buffers, student_number);
    
    // OK IF WE GOT HERE, WE WERE SUCCESSFUL
    print_phase_one_info(student_number, &buffers);

    putstr("\n\r=== Program Complete ===\n\r");
    
    while(1) {
        // Program ends here, stay in loop
    }
}