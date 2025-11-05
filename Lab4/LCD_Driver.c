/* ---------------------------------------------------------------------------------
 * Daphne Felt
 * ECEN 5613 - Fall 2025 - Prof. McClure
 * University of Colorado Boulder
 * Edited 11/4/19
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
// Accuracy test pin toggle
sbit test_pin = P1^7;  // P1.7

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

// UART FUNCS
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
    // Get current cursor position by reading DDRAM address
    uint8_t ddram_addr = lcd_read_address();

    // Convert DDRAM address back to row/column
    for(uint8_t i = 0; i < MAX_ROWS; i++) {
        if(ddram_addr >= row_addresses[i] &&
           ddram_addr < (row_addresses[i] + MAX_COLS)) {
            current_row = i;
            current_col = ddram_addr - row_addresses[i];
            break;
        }
    }

    while(*ss) {
        // Check if we need to wrap to next line
        if(current_col >= MAX_COLS) {
            current_col = 0;
            current_row++;

            // Wrap to first line if we go past the last row
            if(current_row >= MAX_ROWS) {
                current_row = 0;
            }

            // Move cursor to beginning of next line
            lcdgotoxy(current_row, current_col);
        }

        // Output the character
        lcdputch(*ss++); // will inc current_col
    }
}

void lcdputstr_wordwrap(char *ss)
{
    // Get current cursor position by reading DDRAM address
    uint8_t ddram_addr = lcd_read_address();

    // Convert DDRAM address back to row/column
    for(uint8_t i = 0; i < MAX_ROWS; i++) {
        if(ddram_addr >= row_addresses[i] &&
           ddram_addr < (row_addresses[i] + MAX_COLS)) {
            current_row = i;
            current_col = ddram_addr - row_addresses[i];
            break;
        }
    }

    char *word_start = ss;

    while(*ss) {
        // If we hit a space or end of string, check word length
        if(*ss == ' ' || *(ss + 1) == '\0') {
            uint8_t word_length = ss - word_start + ((*ss == ' ') ? 0 : 1);

            // If word doesn't fit, move to next line
            if(current_col + word_length > MAX_COLS) {
                current_col = 0;
                current_row++;

                // Wrap to first line if we go past the last row
                if(current_row >= MAX_ROWS) {
                    current_row = 0;
                }

                // Move cursor to beginning of next line
                lcdgotoxy(current_row, current_col);
            }

            // Output the word
            for(char *p = word_start; p <= ss; p++) {
                lcdputch(*p); // will inc current_col
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
    time_str[0] = '0' + (system_clock.minutes / 10);
    time_str[1] = '0' + (system_clock.minutes % 10);
    time_str[2] = ':';
    time_str[3] = '0' + (system_clock.seconds / 10);
    time_str[4] = '0' + (system_clock.seconds % 10);
    time_str[5] = '.';
    time_str[6] = '0' + system_clock.tenths;
    time_str[7] = '\0';
    
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
void timer_init(void)
{
    // Configure Timer 1 for 100ms (0.1 second) intervals
    // 11.0592MHz crystal
    
    TMOD &= 0x0F;   // Clear Timer 1 bits
    TMOD |= 0x10;   // Timer 1, Mode 1 (16-bit timer)
    
    // Calculate reload value for 100ms at 11.0592MHz
    // Timer frequency = 11.0592MHz / 12 = 921.6kHz
    // For 100ms: Count = 0.1 * 921.6kHz = 92160 cycles
    // Reload = 65536 - 92160 = -26624 = 0xD800
    TH1 = 0xD8;
    TL1 = 0x00;
    
    ET1 = 1;        // Enable Timer 1 interrupt
    TR1 = 1;        // Start Timer 1
    EA = 1;         // Enable global interrupts
}

// Timer 1 ISR - Called every 100ms (0.1 second)
void timer1_isr(void) __interrupt (3)
{
    // Reload timer for next 100ms interval
    TH1 = 0xD8;
    TL1 = 0x00;
    
    // Toggle test pin for accuracy measurement
    test_pin = ~test_pin;
    
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

int main(void)
{
    lcdinit();
    timer_init();
    test_pin = 0; // Initialize test pin
    display_clock(); // Initial clock display

    // Write at specific positions
    lcd_putchar_at(0, 5, 'H');     // Row 0, Col 5: 'H'
    lcd_putchar_at(0, 6, 'i');     // Row 0, Col 6: 'i'

    // Write strings at specific positions
    lcd_string_at(1, 0, "aAbBcCdDeEfFgGhHiIjJlLkKmMnNoOpP"); // Row 1, Col 0 (should go into row 2)

    // MENU
    putstr("\n\r");
    putstr("Here is everything you can do:\n\r");
    putstr("0. Put a character at wherever the cursor is \n\r");
    putstr("a. Put a character somewhere \n\r");
    putstr("b. Put a string somewhere (letter wrap) \n\r");
    putstr("c. Put a string somewhere (word wrap) \n\r");
    putstr("d. Clear screen \n\r");
    putstr("e. Re-init screen \n\r");
    putstr("--------------------------------------\n\r");
    putstr("Clock Menu: \n\r");
    putstr("s. Start Clock\n\r");
    putstr("t. Stop Clock\n\r");
    putstr("r. Reset Clock\n\r");
    putstr("--------------------------------------\n\r");

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
                break;
        }

        putstr("DONE\r\n\r\n");
    };
}