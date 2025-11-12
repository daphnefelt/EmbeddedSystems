/* ---------------------------------------------------------------------------------
 * Daphne Felt
 * ECEN 5613 - Fall 2025 - Prof. McClure
 * University of Colorado Boulder
 * Edited 11/11/19
 * ---------------------------------------------------------------------------------
 * Lab 4 Pt 3
 * Using MCP4802 DAC to generate sin wave using SPI on 8051
 * ---------------------------------------------------------------------------------
 */

#include <mcs51/8051.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>

// SPI Pin definitions (Based on 8051 SPI pins)
#define SPI_MOSI    P1_7 // Master Out Slave In
#define SPI_MISO    P1_5 // Master In Slave Out (not used for DAC so it's not even wired)
#define SPI_SCK     P1_6 // Serial Clock
#define SPI_CS      P1_2 // Chip Select (active low) - picked my first unused I/O pin. AM DISABLING SS, so can use whatever pin I want and do it manually

// register definitions. from datasheet
__sfr __at (0xC3) SPCON;  // SPI Control Register
__sfr __at (0xC4) SPSTA;  // SPI Status Register  
__sfr __at (0xC5) SPDAT;  // SPI Data Register

// MCP4802 Command bits
#define MCP4802_WRITE_A     0x30    // write to channel A, gain of 1x

// Making the sin table
uint8_t sin_table[256];
#define PI 3.14159265359f
// Simple sin approx using Taylor series bc apparently no sin function I can use
float simple_sin(float x) {
    // Normalize x to [-PI, PI]
    while (x > PI) x -= 2.0f * PI;
    while (x < -PI) x += 2.0f * PI;
    
    // Taylor series: sin(x) ≈ x - x³/6 + x⁵/120 - x⁷/5040
    float x2 = x * x;
    float x3 = x2 * x;
    float x5 = x3 * x2;
    
    return x - (x3 / 6.0f) + (x5 / 120.0f);
}
void generate_sin_table(uint8_t *table, uint16_t size) {
    for (uint16_t i = 0; i < size; i++) {
        // Calculate sin value: sin(2π * i / size)
        // Then scale from [-1,1] to [0,255]
        float angle = 2.0 * PI * i / size;
        float sin_val = simple_sin(angle);
        float scaled = (sin_val + 1.0f) * 127.5f;
        table[i] = (uint8_t)(scaled + 0.5); // so it rounds to nearest int
    }
}

// Global vars
volatile uint8_t sin_index = 0;
volatile uint16_t wave_frequency = 100;  // Hz
volatile bool bit_bang_mode = false; // start in hardware SPI mode

// Serial comms funcs, same as usual
int putchar(int c) {
    while (!TI);
    SBUF = c;
    TI = 0;
    return c;
}

int getchar(void) {
    while (!RI);
    RI = 0;
    return SBUF;
}

void putstr(char *s) {
    while (*s) {
        putchar(*s++);
    }
}

// SPI hardware init
void spi_init(void) {
    // Set up the idle states
    SPI_CS = 1; // CS inactive (high)
    SPI_SCK = 0;
    SPI_MOSI = 0;
    
    // Init 8051 SPI controller
    // Bit 7 (SPR2) = 0: Clock rate bit 2
    // Bit 6 (SPEN) = 1: SPI enable
    // Bit 5 (SSDIS) = 1: Slave Select Disable
    // Bit 4 (MSTR) = 1: Master mode
    // Bit 3 (CPOL) = 0: Clock polarity (idle low)
    // Bit 2 (CPHA) = 0: Clock phase (sample on first edge)
    // Bit 1 (SPR1) = 0: Clock rate bit 1
    // Bit 0 (SPR0) = 1: fosc/4 clock rate
    SPCON = 0x71;
                    
    SPSTA = 0x00;   // SPI status register, start empty
    
    putstr("SPI Controller Initialized\n\r");
}

void spi_deinit(void) { // for bit bang mode
    SPCON = 0x00; // Disable SPI
}

// SPI Byte transmission
uint8_t spi_transfer(uint8_t data) {
    
    SPDAT = data; // Load data into SPI Data Register
    while (!(SPSTA & 0x80)); // Wait for SPIF (SPI Interrupt Flag)
    SPSTA &= ~0x80; // Clear flag
    return SPDAT;  // data recieved is not in the same register, not gonna use for this but returning anyway
    
}

// Bit-banged SPI byte transmission
void _nop_(void) {
    __asm
        nop
    __endasm;
}
uint8_t spi_transfer_bitbang(uint8_t data) {
    uint8_t received = 0;
    uint8_t i;
    
    for (i = 0; i < 8; i++) {
        // Set data bit (MSB first)
        SPI_MOSI = (data & 0x80) ? 1 : 0;
        data <<= 1;
        
        // setup time
        _nop_();
        
        // Clock high (data sampled on rising edge for CPHA=0)
        SPI_SCK = 1;
        
        // Read MISO (not needed but whatever)
        received <<= 1;
        if (SPI_MISO) {
            received |= 1;
        }
        
        // hold time
        _nop_();
        
        // Clock low
        SPI_SCK = 0;
        
        // delay between bits
        _nop_();
    }
    
    return received;
}
 
// writing a val to the channel 1 of dac
void dac_write(uint8_t value) {
    uint8_t command;
    command = MCP4802_WRITE_A;  // Channel A
    
    SPI_CS = 0;  // Chip Select low
    
    // Send 12-bit command + data (MSB first)
    // MCP4802 expects: [A/B][BUF][GA][SHDN][D7][D6][D5][D4] [D3][D2][D1][D0][X][X][X][X]
    if (bit_bang_mode) {
        spi_transfer_bitbang(command | ((value >> 4) & 0x0F)); // Command + upper 4 bits of data
        spi_transfer_bitbang((value << 4) & 0xF0); // Lower 4 bits + padding
    } else {
        spi_transfer(command | ((value >> 4) & 0x0F)); // Command + upper 4 bits of data
        spi_transfer((value << 4) & 0xF0); // Lower 4 bits + padding
    }
    
    SPI_CS = 1;  // Chip Select high
}

// Generate sin wave on channel 1
void generate_sin_wave() {
    uint8_t sin_value = sin_table[sin_index];
    dac_write(sin_value);
    
    // inc sin table index for next iteration
    sin_index++;
    if (sin_index >= 256) {
        sin_index = 0;
    }
}

// Test functions
void test_dc_levels(void) {
    putstr("\n\r----- DC Level Test ----\n\r");
    
    // Test a bunch of DC levels
    uint8_t test_values[] = {0, 64, 128, 192, 255};
    char *labels[] = {"0V (0)", "1.25V (64)", "2.5V (128)", "3.75V (192)", "5V (255)"};
    
    for (uint8_t i = 0; i < 5; i++) {
        printf("Setting Channel A to %s\n\r", labels[i]);
        dac_write(test_values[i]);
        
        putstr("Press a key to do the next value\n\r");
        getchar();
    }
}

uint16_t get_number(void) {
    char buffer[4];
    uint8_t idx = 0;
    char c;

    while(1) {
        c = getchar();

        if (c == '\r' || c == '\n') {
            buffer[idx] = '\0';
            putstr("\n\r");
            break;
        }
        else if (c >= '0' && c <= '9' && idx < 3) {
            buffer[idx++] = c;
            putchar(c);
        }
    }

    return atoi(buffer);
}

void manual_dac_control(void) {
    
    putstr("Enter DAC value (0-255): ");
    uint16_t value = get_number();
    
    if (value > 255) {
        putstr("Error: Value must be 0-255\n\r");
        return;
    }
    
    dac_write((uint8_t)value);
    printf("Channel A set to %d\n\r", 
           (uint8_t)value);
}

// Menu system
void print_menu(void) {
    putstr("\n\r");
    putstr("Here's everything you can do: \n\r");
    putstr("1. Test DC Levels\n\r");
    putstr("2. sin Wave\n\r");
    putstr("3. Manual DAC Value\n\r");
    putstr("4. Toggle Bit-Bang Mode\n\r");
    putstr("h. Help (show this menu)\n\r");
    putstr("----------------------------------------\n\r");
}

// Main
int main(void) {
    char choice;
    
    spi_init();
    generate_sin_table(sin_table, 256);
    print_menu();
    
    while (1) {
        putstr("\nEnter choice: ");
        choice = getchar();
        putchar(choice);
        putstr("\n\r");
        
        switch (choice) {
            case '1':
                test_dc_levels();
                break;
                
            case '2':
                putstr("Put any char to stop the sin wave \n\r");
                while (!RI) {
                    generate_sin_wave();
                    // Delay to set frequency
                    for (volatile uint16_t i = 0; i < (1200 / wave_frequency); i++);
                }
                getchar(); // Clear the input buffer
                putstr("sin wave stopped\n\r");
                break;
                
            case '3':
                manual_dac_control();
                break;

            case '4':
                bit_bang_mode = !bit_bang_mode;
                if (bit_bang_mode) {
                    spi_deinit(); // Disable hardware SPI
                } else {
                    spi_init(); // Re-enable hardware SPI
                }
                printf("Bit-Bang Mode %s\n\r", bit_bang_mode ? "Enabled" : "Disabled");
                break;
                
            case 'h':
            case 'H':
                print_menu();
                break;
                
            default:
                putstr("Invalid choice. Press 'h' for help.\n\r");
                break;
        }
    }
    
    return 0;
}