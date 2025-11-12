/* ---------------------------------------------------------------------------------
 * Daphne Felt
 * ECEN 5613 - Fall 2025 - Prof. McClure
 * University of Colorado Boulder
 * Edited 11/11/25
 *  --------------------------------------------------------------------------------
 * LAB 4 
 * 24LC16B EEPROM interface using i2c + PCF8574A I/O Expander
 *  ---------------------------------------------------------------------------------
 * CREDITS:
 * Used concepts from AN709 and the assembly code from AN614 to generate this code. 
 * Huge thanks to the writers Mike Rosenfield and Rick Stoneking
*/

#include <mcs51/8051.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include "EEPROM_Interface.h"

///// PCF8574A DEFINITIONS
#define PCF8574A_ADDR    0x70    // PCF8574A I2C address (A2=A1=A0=0) // 01110000 (device id 1110 + A2,A1,A0 + r/w)
#define PCF8574A_WRITE   (PCF8574A_ADDR)
#define PCF8574A_READ    (PCF8574A_ADDR | 1) // read has the last bit set high

// Pin config. Using P0 as output, P7 as input
#define OUTPUT_PIN_MASK 0x01 // bit 0
#define INPUT_PIN_MASK  0x80 // bit 7 
#define DEFAULT_CONFIG  0xFE // if I set P0 low (output), others high (inputs)

// PCF8574A global vars
volatile uint8_t IO_Expander_port_state = DEFAULT_CONFIG;
volatile uint8_t PCF8574A_input_state = 0x00;
volatile bool io_link = true; // link between input and output

// I2C assem interface vars (both EEPROM and PCF8574A are using these)
static volatile __data uint8_t ret_byte;
static volatile __data char device_addr;
static volatile __data char addr_low;
static volatile __data char asm_data;
static volatile __data char asm_result;

///// UTILITY FUNCS

// ansi color codes
#define ANSI_RESET          "\x1b[0m"
#define ANSI_BLUE_BOLD     "\x1b[1;96m"
#define ANSI_GREEN_BOLD    "\x1b[1;92m"

// putchar takes a char and TX's it. Blocking.
int putchar(int c){
    while (!TI); // Wait till ready to transmit, TI = 1
    SBUF = c;    // load serial port with transmit value
    TI = 0;      // clear TI flag
    return c;
}

// getchar gets a char from RX. Blocking. Returns char.
int getchar(void){
    while (!RI);     // Wait till ready to receive, RI = 1
    RI = 0;          // clear RI flag
    return SBUF;     // return character from SBUF
}

// putstr takes a string (char array) and prints till it finds a NULL.
int putstr(char *s){
    int i = 0;
    while (*s) {     // output characters until NULL found
        putchar(*s++);
        i++;
    }
    return i+1;
}

void putchar_blue(int c){
    putstr(ANSI_BLUE_BOLD);
    putchar(c);
    putstr(ANSI_RESET);
}

void putstr_blue(char *s){
    putstr(ANSI_BLUE_BOLD);
    putstr(s);
    putstr(ANSI_RESET);
}

void putstr_green(char *s){
    putstr(ANSI_GREEN_BOLD);
    putstr(s);
    putstr(ANSI_RESET);
}

// Print newline
void print_newline(void) {
    putchar('\r');
    putchar('\n');
}

uint16_t simple_hex_to_int(const char *hex_str) {
    uint16_t result = 0;
    char c;

    while ((c = *hex_str++) != '\0') {
        result <<= 4;
        if (c >= '0' && c <= '9') {
            result |= (c - '0');
        } else if (c >= 'A' && c <= 'F') {
            result |= (c - 'A' + 10);
        } else if (c >= 'a' && c <= 'f') {
            result |= (c - 'a' + 10);
        } else {
            return 0xFFFF;  // Error
        }
    }
    return result;
}

void print_hex_dump_line(uint16_t address, const uint8_t *data, uint8_t count) {
    uint8_t i;

    // Print address in your format
    printf("%03X: ", address);

    // Print data bytes
    for (i = 0; i < count && i < 16; i++) {
        printf("%02X ", data[i]);
    }

    printf("\r\n");
}

// Get user input with echo - only allows hex characters (0-9, A-F, a-f)
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
        } else if ((c >= '0' && c <= '9') ||
                   (c >= 'A' && c <= 'F') ||
                   (c >= 'a' && c <= 'f')) {  // Only hex characters
            buffer[count++] = c;
            putchar_blue(c);  // Echo the character
        }
        // Ignore all other characters (no echo, no storage)
    }

    buffer[count] = '\0';  // Null terminate
    print_newline();
    return count;
}

///// I/O EXPANDER FUNCTIONS

// Write to peripheral I/O
bool PCF8574A_write(uint8_t data) {
    device_addr = PCF8574A_WRITE;
    asm_data = data;
    
    // same assembly function as eeprom but without address byte
    __asm
        mov      A, _device_addr ; Load write address
        lcall   _OUTS           ; Send it with start condition
        mov     a, _asm_data     ; Get data byte
        lcall   _OUT            ; Send it
        lcall   _STOP           ; Send stop condition
    __endasm;
    
    IO_Expander_port_state = data;
    return true;
}

// PCF8574A Read using existing I2C assembly functions
bool PCF8574A_read(uint8_t *data) {
    device_addr = PCF8574A_READ;
    
    __asm
        mov     A, _device_addr        ; Load PCF8574A read address  
        lcall   _OUTS           ; Send it with start condition
        lcall   _IN             ; Read data byte
        mov     _asm_result, A         ; Store result
        lcall   _STOP           ; Send stop condition
    __endasm;
    
    *data = asm_result;
    return true;
}

void PCF8574A_init(void) {    
    // Set initial configuration: P0=output(low), P7=input(high), others=input(high)
    PCF8574A_write(DEFAULT_CONFIG);
}

// Set output pin state
bool set_P0_out(bool state) {
    uint8_t new_state;
    
    // Update port state
    new_state = IO_Expander_port_state;
    if (state) {
        new_state |= (1 << 0); // Set bit on bit 0
    } else {
        new_state &= ~(1 << 0); // Clear bit on bit 0
    }
    
    return PCF8574A_write(new_state);
}

// Initialize INT0
void init_INT0_interrupt(void) {
    // doing falling edge trigger bc active low
    IT0 = 1; // INT0 triggered on falling edge
    EX0 = 1; // Enable INT0
    EA = 1; // Enable global interrupts
}

// INT0 ISR
void int0_isr(void) __interrupt (IE0_VECTOR) {
    uint8_t port_data;
    PCF8574A_read(&port_data); // read new val
    
    // Process input change
    bool pin7 = (port_data & INPUT_PIN_MASK);
    if (io_link) {
        // Link output to input
        set_P0_out(pin7);
    } else {
        // Invert output from input
        set_P0_out(!pin7);
    }
}

//////// MAIN FUNCS

// Function prototypes
void show_menu(void);
void write_byte_menu(void);
void read_byte_menu(void);
void hex_dump_menu(void);
void reset_eeprom_menu(void);

// asm
void TEST(void) __naked;
void OUTS(void) __naked;
void OUT(void) __naked;
void STOP(void) __naked;
void CREAD(void) __naked;
void IN(void) __naked;

// Buffer for user input
#define INPUT_BUFFER_SIZE 20
static char input_buffer[INPUT_BUFFER_SIZE];

int main(void) {
    char choice;

    // Initialize hardware
    eeprom_init();      // also initializes I2C
    PCF8574A_init();
    init_INT0_interrupt(); // interrupts on input change
    set_P0_out(1); // initial output high

    // Main program loop
    while (1) {
        show_menu();
        choice = getchar();
        putchar(choice); // echo choice

        switch (choice) {
            case '1':
                write_byte_menu();
                break;
            case '2':
                read_byte_menu();
                break;
            case '3':
                hex_dump_menu();
                break;
            case '4':
                reset_eeprom_menu();
                break;
            case '5':
                io_link = true;
                // update output to match input immediately
                {
                    uint8_t port_data;
                    PCF8574A_read(&port_data);
                    bool pin7 = (port_data & INPUT_PIN_MASK);
                    set_P0_out(pin7);
                }
                break;
            case '6':
                io_link = false;
                // update output to inverse of input immediately
                {
                    uint8_t port_data;
                    PCF8574A_read(&port_data);
                    bool pin7 = (port_data & INPUT_PIN_MASK);
                    set_P0_out(!pin7);
                }
                break;

            default:
                putstr("Not a choice we have. Please try again.\r\n\r\n");
                break;
        }
    }
}

// Display main menu (updated with PCF8574A options)
void show_menu(void) {
    putstr("\r\n");
    putstr(" --------- I2C Interface Menu --------- \r\n");
    putstr_blue("EEPROM Functions:\r\n");
    putstr("1. Write Byte to EEPROM\r\n");
    putstr("2. Read Byte from EEPROM\r\n");
    putstr("3. Hex Dump EEPROM\r\n");
    putstr("4. Reset EEPROM\r\n");
    putstr_green("PCF8574A I/O Expander Functions:\r\n");
    putstr("5. Make Output = Input\r\n");
    putstr("6. Make Output = !Input \r\n");
    puts("----------------------------------------\r\n");
    putstr("Put what you want to do: ");
}

void write_byte_menu(void) {
    uint16_t address, data;

    putstr_blue("\r\n--- Write Byte to EEPROM ---\r\n");

    // Get address
    putstr("Enter EEPROM address (0-7FF hex): ");
    get_user_input(input_buffer, INPUT_BUFFER_SIZE);
    address = simple_hex_to_int(input_buffer);

    if (address > EEPROM_MAX_ADDR) {
        putstr("Error: Address out of range (max 7FF)\r\n");
        return;
    }

    // Get data
    putstr("Enter data byte (0-FF hex): ");
    get_user_input(input_buffer, INPUT_BUFFER_SIZE);
    data = simple_hex_to_int(input_buffer);

    if (data > 0xFF) {
        putstr("Error: Data out of range (max FF)\r\n");
        return;
    }

    // Write to EEPROM
    putstr("Writing");
    device_addr = 0xA0 | ((address >> 7) & 0x0E); 
    addr_low = address & 0xFF; 
    printf("\r\ndevice addr: 0x%02X, lower addr: 0x%02X\r\n", device_addr, addr_low);
    asm_data = data;
    BYTEW();

    putstr_blue("Success!\r\n");
    printf("%03X: ", address);
    printf("%02X\r\n", asm_data);
}

void read_byte_menu(void) {
    uint16_t address;

    putstr_blue("\r\n--- Read Byte from EEPROM ---\r\n");

    // Get address
    putstr("Enter EEPROM address (0-7FF hex): ");
    get_user_input(input_buffer, INPUT_BUFFER_SIZE);
    address = simple_hex_to_int(input_buffer);  

    if (address > EEPROM_MAX_ADDR) {
        putstr("Error: Address out of range (max 7FF)\r\n");
        return;
    }

    // Read from EEPROM
    putstr("Reading");
    device_addr = 0xA0 | ((address >> 7) & 0x0E);
    addr_low = address & 0xFF; 
    printf("\r\ndevice addr: 0x%02X, lower addr: 0x%02X\r\n", device_addr, addr_low);
    BYTERD(); 

    putstr_blue("Success!\r\n");
    printf("%03X: ", address);
    printf("%02X\r\n", asm_result);
}

void hex_dump_menu(void) {
    uint16_t start_addr, end_addr, current_addr;
    uint8_t data_buffer[16];
    uint16_t bytes_to_read, bytes_in_line;

    putstr_blue("\r\n--- Hex Dump EEPROM ---\r\n");

    // Get start address
    putstr("Enter start address (0-7FF hex): ");
    get_user_input(input_buffer, INPUT_BUFFER_SIZE);
    start_addr = simple_hex_to_int(input_buffer);  

    if (start_addr > EEPROM_MAX_ADDR) {
        putstr("Error: Start address out of range (max 7FF)\r\n");
        return;
    }

    // Get end address
    putstr("Enter end address (0-7FF hex): ");
    get_user_input(input_buffer, INPUT_BUFFER_SIZE);
    end_addr = simple_hex_to_int(input_buffer);  

    if (end_addr > EEPROM_MAX_ADDR) {
        putstr("Error: End address out of range (max 7FF)\r\n");
        return;
    }

    if (start_addr > end_addr) {
        putstr("Error: Start address must be <= end address\r\n");
        return;
    }

    putstr("Reading EEPROM");
    print_newline();
    
    current_addr = start_addr;
    
    while (current_addr <= end_addr) {
        bytes_to_read = end_addr - current_addr + 1;
        if (bytes_to_read > 16) {
            bytes_in_line = 16;
        } else {
            bytes_in_line = bytes_to_read;
        }

        // Read bytes for this line
        for (uint8_t i = 0; i < bytes_in_line; i++) {
            device_addr = 0xA0 | (((current_addr + i) >> 7) & 0x0E);
            addr_low = (current_addr + i) & 0xFF;
            BYTERD();
            data_buffer[i] = asm_result;
        }

        // Print the line
        print_hex_dump_line(current_addr, data_buffer, bytes_in_line);
        
        current_addr += bytes_in_line;
    }

    putstr_blue("Hex dump complete!\r\n");
}

void reset_eeprom_menu(void) {
    putstr_blue("\r\n--- Reset EEPROM ---\r\n");
    putstr("This will reset the I2C bus and EEPROM. Continue? (y/n): ");
    
    char confirm = getchar();
    putchar(confirm);
    print_newline();
    
    if (confirm == 'y' || confirm == 'Y') {
        putstr("Resetting I2C bus and EEPROM");
        eereset();
        putstr_blue(" Complete!\r\n");
        putstr("The I2C EEPROM has been reset.\r\n");
        
        // Re-initialize PCF8574A after I2C reset
        putstr("Re-initializing PCF8574A...\r\n");
        PCF8574A_init();
    } else {
        putstr("Reset cancelled.\r\n");
    }
}

//////// ASSEMBLY FUNCS

// init EEPROM interface
void eeprom_init(void) {
    P1 = 0xFF;  // Set both pins high (idle state)
}

void TEST(void) __naked {
    __asm
        mov      _ret_byte, #0x05
    __endasm;
}

void BYTEW(void) __naked {
    __asm
        mov      A, _device_addr        
        lcall   _OUTS           
        mov     a, _addr_low           
        lcall   _OUT            
        mov     a, _asm_data           
        lcall   _OUT            
        lcall   _STOP           
        ret
    __endasm;
}

void BYTERD(void) __naked {
    __asm
        mov     a, _device_addr        
        lcall   _OUTS           
        mov     a, _addr_low           
        lcall   _OUT            
        lcall   _CREAD          
        ret
    __endasm;
}

void ACKTST(void) __naked {
    __asm
        MOV     A, _device_addr        
        MOV     R2,#8           
        CLR     P1.0            
        NOP                     
        NOP
        NOP
        NOP                     
        NOP
        CLR     P1.1            
    AKTLP:
        RLC     A               
        JNC     AKTLS
        SETB    P1.0            
        LJMP     AKTL1           
    AKTLS:
        CLR     P1.0            
    AKTL1:
        SETB    P1.1            
        NOP                     
        NOP
        NOP
        NOP                     
        NOP
        CLR     P1.1            
        DJNZ    R2,AKTLP        
        SETB    P1.0            
        NOP                     
        NOP                     
        SETB    P1.1            
        NOP                     
        NOP
        NOP
        NOP                     
        NOP
        JNB     P1.0,EXIT       
        LJMP     _ACKTST          
    EXIT:
        CLR     P1.1            
        CLR     P1.0            
        NOP                     
        NOP
        NOP
        NOP                     
        NOP
        SETB    P1.1            
        NOP
        NOP
        SETB    P1.0            
        RET
    __endasm;
}

void OUTS(void) __naked {
    __asm
        mov     r2, #8          
        setb    P1.0            
        setb    P1.1            
        nop
        nop
        nop
        nop
        nop
        clr     P1.0            
        nop
        nop
        nop
        nop
        nop
        clr     P1.1            
    otslp:
        rlc     a               
        jnc     bitls
        setb    P1.0            
        sjmp    otsl1           
    bitls:
        clr     P1.0            
    otsl1:
        setb    P1.1            
        nop
        nop
        nop
        nop
        nop
        clr     P1.1            
        djnz    r2, otslp       
        setb    P1.0            
        nop
        nop
        nop
        setb    P1.1            
        nop
        nop
        nop
        nop
        nop
        clr     P1.1
        ret
    __endasm;
}

void OUT(void) __naked {
    __asm
        mov     r2, #8          
    otlp:
        rlc     a               
        jnc     bitl
        setb    P1.0            
        sjmp    otl1            
    bitl:
        clr     P1.0            
    otl1:
        setb    P1.1            
        nop
        nop
        nop
        nop
        nop
        clr     P1.1            
        djnz    r2, otlp        
        setb    P1.0            
        nop
        nop
        nop
        setb    P1.1            
        nop
        nop
        nop
        nop
        nop
        clr     P1.1
        ret
    __endasm;
}

void STOP(void) __naked {
    __asm
        clr     P1.0            
        nop
        nop
        nop
        nop
        nop
        setb    P1.1            
        nop
        nop
        nop
        nop
        nop
        setb    P1.0            
        ret
    __endasm;
}

void CREAD(void) __naked {
    __asm
        mov     A, _device_addr        
        inc     A
        lcall    _OUTS            
        lcall    _IN              
        mov     _asm_result,A            
        lcall    _STOP            
        ret
    __endasm;
}

void IN(void) __naked {
    __asm
        mov     R2,#8           
        setb    P1.0            
    inlp:
        clr     P1.1            
        nop                     
        nop
        nop
        nop
        nop                     
        nop
        setb    P1.1            
        clr     C               
        jnb     P1.0,inl1       
        cpl     C               
    inl1:
        rlc     A               
        djnz    R2,inlp         
        clr     P1.1            
        ret
    __endasm;
}

// Software reset - based on AN709
void eereset(void) {
    volatile uint8_t i;

    P1_0 = 1;  // SDA high
    P1_1 = 1;  // SCL high

    for (i = 0; i < 10; i++);

    // START condition
    P1_0 = 0;
    for (i = 0; i < 5; i++);

    P1_1 = 0;
    for (i = 0; i < 5; i++);

    // 9 clock pulses with SDA high
    P1_0 = 1;

    for (i = 0; i < 9; i++) {
        P1_1 = 1;
        for (uint8_t j = 0; j < 10; j++);

        P1_1 = 0;
        for (uint8_t j = 0; j < 10; j++);
    }

    // START condition again
    P1_0 = 1;
    P1_1 = 1;
    for (i = 0; i < 5; i++);

    P1_0 = 0;
    for (i = 0; i < 5; i++);

    // STOP condition
    P1_1 = 1;
    for (i = 0; i < 5; i++);

    P1_0 = 1;
    for (i = 0; i < 10; i++);
}