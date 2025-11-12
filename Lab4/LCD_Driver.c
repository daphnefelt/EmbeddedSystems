/* ---------------------------------------------------------------------------------
 * Daphne Felt
 * ECEN 5613 - Fall 2025 - Prof. McClure
 * University of Colorado Boulder
 * Edited 11/4/25
 *  --------------------------------------------------------------------------------
 * LAB 4 Pt 2
 * Driving an LCD Screen
*/

// PINS
// RS - Register Select (0 = Command, 1 = Data) - AT A0 AFTER LATCH
// RW - Read/Write (0 = Write, 1 = Read) - AT A1 AFTER LATCH
// EN - Enable - USING MY SPLD: (A15 & (!_WR || !_RD))
// D0-D7 - Data Lines - AT A0-A7

#include <mcs51/8051.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

// Memory addresses for LCD access -- ALL HAVE A15 HIGH
#define LCD_CMD_ADDR     0x8000  // RS=0, RW=0 (write command)
#define lcdputch_ADDR    0x8001  // RS=1, RW=0 (write data)
#define LCD_STATUS_ADDR  0x8002  // RS=0, RW=1 (read status/busy flag)
#define LCD_READ_ADDR    0x8003  // RS=1, RW=1 (read data)

// DDRAM addresses for each row (XxY display)
#define MAX_COLS 16
#define MAX_ROWS 4
const unsigned char row_addresses[4] = {0x00, 0x40, 0x10, 0x50};

// Clock display position (bottom right of LCD)
#define CLOCK_ROW (MAX_ROWS-1)
#define CLOCK_COL (MAX_COLS-8)    // "MM:SS.S" = 7 chars

// Clock state variables
typedef struct {
    uint16_t tenths;        // Tenths of seconds (0-9)
    uint16_t seconds;       // Seconds (0-59)
    uint16_t minutes;       // Minutes (0-99)
    uint8_t  running;       // Clock running flag
    uint8_t  update_flag;   // update needed flag
} clock_t;

volatile clock_t system_clock = {0, 0, 0, 1, 0}; // init clock at 0 and running
volatile bool timer_do_something = 0;

// Cursor position tracking for ISR save/restore
typedef struct {
    uint8_t saved_row;
    uint8_t saved_col;
    uint8_t valid;
} cursor_state_t;

volatile cursor_state_t cursor_backup = {0, 0, 0};

// Current cursor tracking
volatile uint8_t current_row = 0;
volatile uint8_t current_col = 0;

// Data pointers
volatile uint8_t __xdata *lcd_cmd_ptr = (volatile uint8_t __xdata *)LCD_CMD_ADDR;
volatile uint8_t __xdata *lcdputch_ptr = (volatile uint8_t __xdata *)lcdputch_ADDR;
volatile uint8_t __xdata *lcd_status_ptr = (volatile uint8_t __xdata *)LCD_STATUS_ADDR;
volatile uint8_t __xdata *lcd_read_ptr = (volatile uint8_t __xdata *)LCD_READ_ADDR;

// premade custom chars
unsigned char custom_char_checker[8] = {0x15,0x0A,0x15,0x0A,0x15,0x0A,0x15,0x0A}; // Checker board
unsigned char custom_char_heart[8] = {0x00,0x0A,0x15,0x11,0x0A,0x04,0x00,0x00}; // Heart
unsigned char custom_char_face[8] = {0x00,0x0A,0x00,0x04,0x0A,0x04,0x11,0x1F}; // Face w/ big nose
unsigned char custom_char_alpaca[8] = {0x02,0x03,0x02,0x12,0x0E,0x0A,0x0A,0x00}; // Alpaca
unsigned char custom_char_giraffe[8] = {0x18,0x08,0x08,0x09,0x0E,0x0A,0x0A,0x00}; // Giraffe

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

// Wait for LCD to be ready (busy flag clear)
void lcdbusywait(void)
{
    uint8_t status;
    uint16_t timeout = 50000; // Timeout counter to avoid infinite loop

    do {
        status = *lcd_status_ptr;  // Read status register (RS=0, RW=1)
        timeout--;

        // Prevent infinite loop - fallback
        if(timeout == 0) break;

    } while(status & 0x80);  // Wait while busy flag (bit 7) is set
}

// command function with busy flag polling
void lcd_cmd(uint8_t cmd)
{
    lcdbusywait();    // wait for LCD to be ready
    *lcd_cmd_ptr = cmd;  // Send command
}

// data function with busy flag polling
void lcdputch(char cc)
{
    lcdbusywait();     // Wait for LCD to be ready
    *lcdputch_ptr = cc; // Send data

    // Update cursor tracking
    current_col++;
    if(current_col >= MAX_COLS) {
        current_col = 0;
        current_row++;
        if(current_row >= MAX_ROWS) current_row = 0;
    }
}

uint8_t lcd_read_address(void)
{
    uint8_t addr;
    lcdbusywait();               // Wait for LCD to be ready
    addr = *lcd_status_ptr & 0x7F; // Read address (mask out busy flag)
    return addr;
}

void lcdgotoaddr(unsigned char address)
{
    lcd_cmd(0x80 | address);    // Set DDRAM address command
    lcdbusywait(); // this cmd takes longer
}

// put cursor at specific row and column
void lcdgotoxy(unsigned char row, unsigned char col)
{
    unsigned char address;
    current_row = row;
    current_col = col;

    // Cap at max rows and cols
    if(row > (MAX_ROWS-1)) row = (MAX_ROWS-1);
    if(col > (MAX_COLS-1)) col = (MAX_COLS-1);

    address = row_addresses[row] + col;
    lcdgotoaddr(address);
}

// string output with automatic line wrapping
void lcdputstr(char *ss)
{
    uint8_t current_row_local = 0;
    uint8_t current_col_local = 0;

    // Get current cursor position by reading DDRAM address
    uint8_t ddram_addr = lcd_read_address();

    // Convert DDRAM address back to row/column
    for(uint8_t i = 0; i < MAX_ROWS; i++) {
        if(ddram_addr >= row_addresses[i] &&
           ddram_addr < (row_addresses[i] + MAX_COLS)) {
            current_row_local = i;
            current_col_local = ddram_addr - row_addresses[i];
            break;
        }
    }

    while(*ss) {
        // Check if we need to wrap to next line
        if(current_col_local >= MAX_COLS) {
            current_col_local = 0;
            current_row_local++;

            // Wrap to first line if we go past the last row
            if(current_row_local >= MAX_ROWS) {
                current_row_local = 0;
            }

            // Move cursor to beginning of next line
            lcdgotoxy(current_row_local, current_col_local);
        }

        // Output the character
        lcdputch(*ss++);
        current_col_local++;
    }
}

void lcdputstr_wordwrap(char *ss)
{
    uint8_t current_row_local = 0;
    uint8_t current_col_local = 0;

    // Get current cursor position by reading DDRAM address
    uint8_t ddram_addr = lcd_read_address();

    // Convert DDRAM address back to row/column
    for(uint8_t i = 0; i < MAX_ROWS; i++) {
        if(ddram_addr >= row_addresses[i] &&
           ddram_addr < (row_addresses[i] + MAX_COLS)) {
            current_row_local = i;
            current_col_local = ddram_addr - row_addresses[i];
            break;
        }
    }

    char *word_start = ss;

    while(*ss) {
        // If we hit a space or end of string, check word length
        if(*ss == ' ' || *(ss + 1) == '\0') {
            uint8_t word_length = ss - word_start + ((*ss == ' ') ? 0 : 1);

            // If word doesn't fit, move to next line
            if(current_col_local + word_length > MAX_COLS) {
                current_col_local = 0;
                current_row_local++;

                // Wrap to first line if we go past the last row
                if(current_row_local >= MAX_ROWS) {
                    current_row_local = 0;
                }

                // Move cursor to beginning of next line
                lcdgotoxy(current_row_local, current_col_local);
            }

            // Output the word
            for(char *p = word_start; p <= ss; p++) {
                lcdputch(*p);
                current_col_local++;
            }

            word_start = ss + 1; // Move to start of next word
        }

        ss++;
    }
}

// Write character at specific position
void lcd_putchar_at(uint8_t row, uint8_t col, char c)
{
    lcdgotoxy(row, col);
    lcdputch(c);
}

// Write string starting at specific position
void lcd_string_at(uint8_t row, uint8_t col, const char *str)
{
    lcdgotoxy(row, col);
    lcdputstr((char *)str);
}

// Clear entire display
void lcdclear(void)
{
    lcd_cmd(0x01);  // Clear display command (slow)
    current_row = 0;
    current_col = 0;
    lcdbusywait(); // wait for it to complete
}

// Return cursor to home position
void lcd_home(void)
{
    lcd_cmd(0x02);  // Cursor home command
    current_row = 0;
    current_col = 0;
    lcdbusywait(); // wait for it to complete
}

// delay for initial power-up only
void lcd_delay_ms(uint8_t ms)
{
    volatile uint16_t i;
    while(ms--) {
        for(i = 0; i < 1000; i++);  // ~1ms at 11MHz
    }
}

void lcdinit(void)
{
    lcd_delay_ms(50);  // Wait >15ms after VDD reaches 4.5V
    *lcd_cmd_ptr = 0x30; // UNLOCK
    lcd_delay_ms(15);      // Wait >4.1ms
    *lcd_cmd_ptr = 0x30;  // UNLOCK
    lcd_delay_ms(5);      // Wait >100μs
    *lcd_cmd_ptr = 0x30;  // Unlock Third time for reliability

    // Now that BF is working, can use my normal cmds
    // These all Poll for BF = 0 first
    lcd_cmd(0x38);  // Function Set
    lcd_cmd(0x08);  // Display OFF
    lcd_cmd(0x0C);  // Display ON
    lcd_cmd(0x06);  // Entry Mode Set: Increment cursor, no shift
    lcdclear();
    lcd_home();

    current_row = 0;
    current_col = 0;
}

// Function to get some number input from user
uint16_t get_number(void){
    int max_digits = 2; // 0-19

    char buffer[3]; // adding in Null char
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

// Get user input with echo
uint8_t get_user_input(char *buffer, uint8_t max_len) {
    uint8_t count = 0;
    char c;

    while (count < (max_len - 1)) {
        // Wait for character from serial port
        c = getchar();

        if (c == '\r' || c == '\n') {
            break;  // End of line
        } else if (c == '\b' || c == 0x7F) {  // Backspace or DEL
            if (count > 0) {
                count--;
                // Send backspace-space-backspace to erase the character
                putchar('\b');
                putchar(' ');
                putchar('\b');
            }
        } else if ((c >= ' ' && c <= 'z')) {  // Only valid characters
            buffer[count++] = c;
            putchar(c);  // Echo the character
        }
        // Ignore all other characters (no echo, no storage)
    }

    buffer[count] = '\0';  // Null terminate
    putstr("\n\r");
    return count;
}

////////////// CLOCK FUNCTIONS //////////////
// cursor position save/restore for ISR use
void save_cursor_position(void)
{
    cursor_backup.saved_row = current_row;
    cursor_backup.saved_col = current_col;
    cursor_backup.valid = 1;
}

void restore_cursor_position(void)
{
    if(cursor_backup.valid) {
        lcdgotoxy(cursor_backup.saved_row, cursor_backup.saved_col);
        cursor_backup.valid = 0;
    }
}

// Display
void display_clock(void)
{
    char time_str[9];  // "MM:SS.S" + null terminator

    // make time string
    time_str[0] = ' '; // diff clock from rest of text
    time_str[1] = '0' + (system_clock.minutes / 10);
    time_str[2] = '0' + (system_clock.minutes % 10);
    time_str[3] = ':';
    time_str[4] = '0' + (system_clock.seconds / 10);
    time_str[5] = '0' + (system_clock.seconds % 10);
    time_str[6] = '.';
    time_str[7] = '0' + system_clock.tenths;
    time_str[8] = '\0';

    // Save current cursor position
    save_cursor_position();

    // Display clock at bottom right
    lcdgotoxy(CLOCK_ROW, CLOCK_COL);
    lcdputstr(time_str);

    // Restore cursor position
    restore_cursor_position();
}

void clock_stop(void)
{
    system_clock.running = 0;
}

void clock_start(void)
{
    system_clock.running = 1;
}

void clock_reset(void)
{
    EA = 0;  // Disable interrupts during reset
    system_clock.tenths = 0;
    system_clock.seconds = 0;
    system_clock.minutes = 0;
    system_clock.update_flag = 1;  // Force display update
    EA = 1;  // Re-enable interrupts
}

// Timer and ISR
// My preload value calculations: want 100ms
// Frequency is 11.0592 MHz so time for one clock cycle is 1/11.0592MHz = 0.0904us
// And one machine cycle is 12 clock cycles = 1.0848 us
// 100ms / 1.0848 us = 92,182 machine cycles

// Timer0 in mode 1 (16-bit timer) so it overflows at 2^16 = 65536 - or every 71 ms
// 100 ms / 71 ms = 1.4 overflows - so I'm just gonna do 2 overflows
// 92182 cycles / 2 = 46091 cycles per overflow
// Preloading the timer makes it start at a later value so it overflows sooner
// So need to load timer with 65536 - 46091 = 19445

// Needs to be split into high and low bytes
// 19445 = 0x4BF5
// High byte = 0x4B
// Low byte = 0xF5

void timer_init(void)
{
    ET0 = 1;
    EA = 1;

    TMOD |= 0x01;
    TH0 = 0x4B;
    TL0 = 0xF5;

    TR0 = 1;
}

// Timer 0 ISR - Called every 50ms
void timer0_isr(void) __interrupt (TF0_VECTOR)
{
    timer_do_something = !timer_do_something; // only want to actually execute half the time, every 100ms

    // Reload timer for next 50ms interval
    TH0 = 0x4B;
    TL0 = 0xF5;

    if (!timer_do_something){
        return; // if not supposed to do something this time, don't
    }

    // Toggle test pin for accuracy measurement
    P1_3 = !P1_3;

    // Update clock if running
    if(system_clock.running) {
        system_clock.tenths++;

        if(system_clock.tenths >= 10) {
            system_clock.tenths = 0;
            system_clock.seconds++;

            if(system_clock.seconds >= 60) {
                system_clock.seconds = 0;
                system_clock.minutes++;

                if(system_clock.minutes >= 100) {
                    system_clock.minutes = 0;  // Wrap at 99:59.9
                }
            }
        }

        // Set flag for main loop to update display
        system_clock.update_flag = 1;
    }
}

// Function to get 5 binary digits from user. Showing # for 1 and space for 0
unsigned char get_binary_row(void) {
    char bits[6]; // 5 bits + null terminator
    uint8_t count = 0;
    char c;
    unsigned char result = 0;
    
    while (count < 5) {
        c = getchar();
        
        if (c == '0') {
            bits[count] = c;
            putchar(' '); // Show space for 0
            count++;
        }
        else if (c == '1') {
            bits[count] = c;
            putchar('#'); // Show # for 1. Most filled in char I could find
            count++;
        }
        else if (c == '\b' || c == 0x7F) { // Backspace
            if (count > 0) {
                count--;

                putchar('\b');
                putchar(' ');
                putchar('\b');
            }
        }
    }
    
    // Convert binary string to byte value
    for (uint8_t i = 0; i < 5; i++) {
        if (bits[i] == '1') {
            result |= (1 << (4 - i)); // MSB first (leftmost bit = bit 4)
        }
    }
    
    return result;
}

void lcdcreatechar(unsigned char ccode, unsigned char row_vals[]) {

    save_cursor_position();

    uint8_t i;
    for(i = 0; i < 8; i++) {
        lcd_cmd(0x40 | (ccode << 3) | i); // bits: 0 + 1 + ccode + row number
        lcdputch(row_vals[i]); // Send row data
    }
    
    restore_cursor_position();
}

void let_user_create_char(void) {
    // Get the char code they want to use
    putstr("Enter custom character code (0-7): ");
    uint8_t ccode = (uint8_t)get_number();
    
    if (ccode > 7) {
        putstr("Error: Custom character code must be between 0 and 7.\n\r");
        return;
    }

    // Get the 8 rows of data (5 bits each)
    unsigned char row_vals[8];
    putstr("Enter 5 bits per row (0 or 1), press Enter after each row:\n\r");
    
    for (uint8_t i = 0; i < 8; i++) {
        char prompt[30];
        sprintf(prompt, "Row %d: ", i);
        putstr(prompt);
        
        row_vals[i] = get_binary_row(); // this also shows visual preview as you type
        putstr("\n\r");
    }
    
    // Send the custom character
    lcdcreatechar(ccode, row_vals);
    putstr("Custom character made :) \n\r");
}

void hex_dump_ddram(void) {
    putstr("\n\rLCD DDRAM HEX DUMP\n\r");
    putstr("[Row] [Address]: Data (16 bytes per row)\n\r");
    putstr("------------------------------------------------\n\r");
    
    save_cursor_position();
    
    for(uint8_t row = 0; row < MAX_ROWS; row++) {
        // Move to start of this row
        lcdgotoaddr(row_addresses[row]);
        
        char header[20];
        sprintf(header, "Row %d [0x%02X]:\n\r", row, row_addresses[row]);
        putstr(header);
        
        // Read 16 bytes from this row
        for(uint8_t col = 0; col < MAX_COLS; col++) {
            lcdgotoaddr(row_addresses[row] + col);
            lcdbusywait();
            uint8_t data = *lcd_read_ptr;
            
            // Format and print hex value
            char buf[8];
            sprintf(buf, "0x%02X ", data);
            putstr(buf);
        }
        putstr("\n\r\n\r");
    }
        
    restore_cursor_position();
}

void hex_dump_cgram(void) {
    putstr("LCD CGRAM HEX DUMP\n\r");
    putstr("[Char] [Row]: Data (8 characters x 8 rows each)\n\r");
    putstr("--------------------------------------------------\n\r");
    
    save_cursor_position();
    
    // Read all 8 custom characters (0-7)
    for(uint8_t char_code = 0; char_code < 8; char_code++) {
        putstr("Character ");
        putchar('0' + char_code);
        putstr(":\n\r");
        
        for(uint8_t row = 0; row < 8; row++) {
            // Set CGRAM address: 0x40 | (char_code << 3) | row
            uint8_t cgram_addr = 0x40 | (char_code << 3) | row;
            lcd_cmd(cgram_addr);
            lcdbusywait();
            uint8_t pattern = *lcd_read_ptr;
            
            // Print formatted output
            char buf[30];
            sprintf(buf, "  Row %d [0x%02X]: 0x%02X = ", row, cgram_addr, pattern);
            putstr(buf);
            
            // Show binary visual preview
            for(int8_t bit = 4; bit >= 0; bit--) {
                if(pattern & (1 << bit)) {
                    putchar('#');
                } else {
                    putchar(' ');
                }
            }
            putstr("\n\r");
        }
        putstr("\n\r");
    }
    
    // put back cursor
    restore_cursor_position();
}

void hex_dump_complete(void) {
    putstr("\n\r");

    // Dump DDRAM first
    hex_dump_ddram();
    putstr("\n\r");
    // Then dump CGRAM
    hex_dump_cgram();
}

void menu_print(void){
    // MENU
    putstr("\n\r");
    putstr("Here is everything you can do:\n\r");
    putstr("--------------------------------------\n\r");
    putstr("0. Put a character at wherever the cursor is \n\r");
    putstr("a. Put a character somewhere \n\r");
    putstr("b. Put a string somewhere (letter wrap) \n\r");
    putstr("c. Put a string somewhere (word wrap) \n\r");
    putstr("d. Clear screen \n\r");
    putstr("e. Re-init screen \n\r");
    putstr("--------------------------------------\n\r");
    putstr("f. Create Custom Character \n\r");
    putstr("g. Put Custom Character somewhere \n\r");
    putstr("h. Help Menu \n\r");
    putstr("i. Hex Dump \n\r");
    putstr("--------------------------------------\n\r");
    putstr("Clock Menu: \n\r");
    putstr("s. Start Clock\n\r");
    putstr("t. Stop Clock\n\r");
    putstr("r. Reset Clock\n\r");
    putstr("--------------------------------------\n\r");
}

int main(void)
{
    lcdinit();
    putstr("LCD Initialized \n\r");
    timer_init();
    putstr("Timer Initialized \n\r");
    P1_3 = 0; // Initialize test pin
    display_clock(); // Initial clock display
    putstr("Clock Display Started \n\r");

    // Write at specific positions
    lcd_putchar_at(1, 1, 'H');     // Row 0, Col 5: 'H'
    lcd_putchar_at(1, 2, 'i');     // Row 0, Col 6: 'i'

    // special chars!
    // Make them first
    lcdcreatechar(0, custom_char_checker);
    lcdcreatechar(1, custom_char_heart);
    lcdcreatechar(2, custom_char_face);
    lcdcreatechar(3, custom_char_alpaca);
    lcdcreatechar(4, custom_char_giraffe);
    // now add to board
    lcd_putchar_at(1, 13, 1);
    lcd_putchar_at(1, 4, 2);
    // some animals chilling
    lcd_putchar_at(1, 7, 3);
    lcd_putchar_at(1, 8, 3);
    lcd_putchar_at(1, 9, 4);
    lcd_putchar_at(1, 10, 3);
    lcd_putchar_at(1, 11, 4);

    // Write strings at specific positions
    // lcd_string_at(1, 0, "aAbBcCdDeEfFgGhHiIjJlLkKmMnNoOpP"); // Row 1, Col 0 (should go into row 2)

    menu_print();

    char choice;

    // Buffer for user input
    static char input_buffer[64]; // 4 * 16
    static char char_buffer[1];
    static uint16_t row;
    static uint16_t col;

    while(1){

        while (!RI){
            // update clock display if needed
            if(system_clock.update_flag) {
                system_clock.update_flag = 0;
                display_clock();
            }
        }; // Wait for character from serial port
        choice = getchar();
        printf("%c\n\r", choice);

        switch(choice) {
            case '0':
                putstr("Enter the character: ");
                get_user_input(char_buffer, 2);
                // send command
                lcdputch(*char_buffer);
                break;

            case 'a':
                putstr("Enter the character: ");
                get_user_input(char_buffer, 2);
                putstr("What row?:");
                row = get_number();
                putstr("And what col?:");
                col = get_number();
                // send command
                lcd_putchar_at(row, col, *char_buffer);
                break;

            case 'b':
                putstr("Enter the string: ");
                get_user_input(input_buffer, 65);
                putstr("What row?:");
                row = get_number();
                putstr("And what col?:");
                col = get_number();
                // send command
                lcd_string_at(row, col, input_buffer);
                break;

            case 'c':
                putstr("Enter the string: ");
                get_user_input(input_buffer, 64);
                putstr("What row?:");
                row = get_number();
                putstr("And what col?:");
                col = get_number();
                // send command
                lcdgotoxy(row, col);
                lcdputstr_wordwrap(input_buffer);
                break;

            case 'd':
                lcdclear();
                break;

            case 'e':
                lcdinit();
                break;

            case 'f':
                let_user_create_char();
                break;

            case 'g':
                putstr("Enter the custom character number: ");
                get_user_input(char_buffer, 2);

                if ((*char_buffer < '0') || (*char_buffer > '7')) {
                    putstr("Error: Custom character code must be between 0 and 7.\n\r");
                    break;
                }

                putstr("What row?:");
                row = get_number();
                putstr("And what col?:");
                col = get_number();
                // send command
                lcd_putchar_at(row, col, *char_buffer - '0'); // Convert char to number
                break;

            case 'h':
                menu_print();
                break;

            case 'i':
                hex_dump_complete();
                break;

            case 's':
                clock_start();
                break;

            case 't':
                clock_stop();
                break;

            case 'r':
                clock_reset();
                break;

            default:
                printf("Invalid option\n\r");
                menu_print();
                break;
        }

        putstr("DONE\r\n\r\n");
    };
}