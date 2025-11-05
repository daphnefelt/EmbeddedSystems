// CREDIT: https://embetronicx.com/tutorials/microcontrollers/8051/lcd-interfacing-with-8051-microcontroller/
// Modified for memory-mapped LCD at address 0x8000+ using MOVX instructions
// Enhanced LCD driver with cursor positioning

// PINS
// RS - Register Select (0 = Command, 1 = Data) - AT A0 AFTER LATCH
// RW - Read/Write (0 = Write, 1 = Read) - AT A1 AFTER LATCH
// EN - Enable - USING MY SPLD: (A15 & (!_WR || !_RD))
// D0-D7 - Data Lines - AT A0-A7

// Enhanced busy flag polling version
#include <reg51.h>
#include <stdint.h>

// Memory addresses for LCD access
#define LCD_CMD_ADDR     0x8000  // RS=0, RW=0 (write command)
#define lcdputch_ADDR    0x8001  // RS=1, RW=0 (write data) 
#define LCD_STATUS_ADDR  0x8002  // RS=0, RW=1 (read status/busy flag)
#define LCD_READ_ADDR    0x8003  // RS=1, RW=1 (read data)

// DDRAM addresses for each row (XxY display)
#define MAX_COLS 20
#define MAX_ROWS 4
const unsigned char row_addresses[4] = {0x00, 0x40, 0x14, 0x54};

// Data pointers
volatile uint8_t __xdata *lcd_cmd_ptr = (volatile uint8_t __xdata *)LCD_CMD_ADDR;
volatile uint8_t __xdata *lcdputch_ptr = (volatile uint8_t __xdata *)lcdputch_ADDR;
volatile uint8_t __xdata *lcd_status_ptr = (volatile uint8_t __xdata *)LCD_STATUS_ADDR;
volatile uint8_t __xdata *lcd_read_ptr = (volatile uint8_t __xdata *)LCD_READ_ADDR;

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
}

uint8_t lcd_read_address(void)
{
    uint8_t addr;
    lcdbusywait();               // Wait for LCD to be ready
    addr = *lcd_status_ptr & 0x7F; // Read address (mask out busy flag)
    return addr;
}

// string output with automatic line wrapping
void lcdputstr(char *ss)
{
    uint8_t current_row = 0;
    uint8_t current_col = 0;
    
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
        lcdputch(*ss++);
        current_col++;
    }
}

void lcdputstr_wordwrap(char *ss)
{
    uint8_t current_row = 0;
    uint8_t current_col = 0;
    
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
                lcdputch(*p);
                current_col++;
            }
            
            word_start = ss + 1; // Move to start of next word
        }
        
        ss++;
    }
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

    // Cap at max rows and cols
    if(row > (MAX_ROWS-1)) row = (MAX_ROWS-1);
    if(col > (MAX_COLS-1)) col = (MAX_COLS-1);

    address = row_addresses[row] + col;
    lcdgotoaddr(address);
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
    lcdbusywait(); // wait for it to complete
}

// Return cursor to home position
void lcd_home(void)
{
    lcd_cmd(0x02);  // Cursor home command
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

void lcd_init(void)
{
    // Power-up delay (required by HD44780 spec)
    lcd_delay_ms(50);  // Wait >40ms after VDD reaches 4.5V
    
    // Initial function set (before busy flag is valid)
    *lcd_cmd_ptr = 0x38;  // 8-bit, 2 lines, 5x7 dots
    lcd_delay_ms(5);      // Wait >4.1ms
    
    *lcd_cmd_ptr = 0x38;  // Repeat function set  
    lcd_delay_ms(1);      // Wait >100μs
    
    *lcd_cmd_ptr = 0x38;  // Third time for reliability
    lcd_delay_ms(1);
    
    // Now busy flag is valid - use normal commands
    lcd_cmd(0x38);  // Function Set: 8-bit interface, 2 lines, 5x7 dots
    lcd_cmd(0x08);  // Display OFF
    lcd_cmd(0x01);  // Clear Display  
    lcd_cmd(0x06);  // Entry Mode Set: Increment cursor, no shift
    lcd_cmd(0x0C);  // Display ON, Cursor OFF, Blink OFF
    lcd_cmd(0x80);  // Set cursor to home position
}

int main(void)
{
    lcd_init();
    
    // Write at specific positions
    lcd_putchar_at(0, 5, 'H');     // Row 0, Col 5: 'H'
    lcd_putchar_at(0, 6, 'i');     // Row 0, Col 6: 'i'
    
    // Write strings at specific positions
    lcd_string_at(1, 0, "Line 2 start");      // Row 1, Col 0
    lcd_string_at(2, 10, "Middle");           // Row 2, Col 10
    lcd_string_at(3, 15, "End");              // Row 3, Col 15
    
    // Create a pattern
    for(uint8_t i = 0; i < 20; i++) {
        lcd_putchar_at(0, i, '0' + (i % 10));  // Numbers 0-9 repeating
    }
    
    while(1);
}