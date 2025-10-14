/*******************************************************************************
 * Daphne Felt
 * 10-14-2025
 * 
 * Debug Port Implementation for AT89C51RC2 MCU
 * Provides a virtual debug port at address 0xFFFF for use with
 * a logic analyzer
 * 
 * Memory Map:
 * - Internal XRAM: 0x0000 - 0x03FF (1KB, no external bus activity)
 * - External/Peripheral: 0x0400+ (generates bus activity)
 * - Debug Port: 0xFFFF (unused peripheral address)
 ******************************************************************************/

#define DEBUG_PORT_ADDR 0xFFFF

// Do: DEBUGPORT(value)
// value: 8-bit data value (0x00 - 0xFF) to write to debug port
#ifdef DEBUG
    // Helper macro to write to external data memory
    #define DEBUGPORT(x) do { \
        unsigned char __debug_val = (x); \
        (*((volatile unsigned char __xdata *) DEBUG_PORT_ADDR)) = __debug_val; \
    } while(0)
#else
    // Debug disabled - macro does nothing
    #define DEBUGPORT(x)
#endif

// PREDEFINED DEBUG VALUES
#define DEBUG_1      0x00
#define DEBUG_2      0x01
#define DEBUG_3      0x02
#define DEBUG_4      0x03