/* ---------------------------------------------------------------------------------
 * Daphne Felt
 * ECEN 5613 - Fall 2025 - Prof. McClure
 * University of Colorado Boulder
 * Edited 11/02/25
 *  --------------------------------------------------------------------------------
 * LAB 4 Pt 1
 * Simple declarations of some constants and some functions for the i2c interface
*/

#ifndef EEPROM_INTERFACE_H
#define EEPROM_INTERFACE_H

#include <mcs51/8051.h>
#include <stdint.h>

// EEPROM specifications for 24LC16B
#define EEPROM_SIZE         2048    // 2K bytes (16 Kbits)
#define EEPROM_MAX_ADDR     0x7FF   // Maximum valid address (0-2047)
#define EEPROM_PAGE_SIZE    16      // 16-byte page write buffer

// Function prototypes for C interface functions

void eeprom_init(void);
void eereset(void);

// Assembly function prototypes (implemented in eeprom_asm.c)
// These are called internally by the C interface functions above
extern void BYTEW(void);    // Write byte: R4=addr, R1=data
extern void BYTERD(void);   // Read byte: R4=addr, returns in A
extern void ACKTST(void);   // Test for write completion

#endif // EEPROM_INTERFACE_H