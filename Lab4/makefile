# Makefile for AT89C51RC2
# Author: Daphne Felt
# Course: ECEN 5613 - Fall 2025 - Prof. McClure
# University of Colorado Boulder

# OPTIONS

# make build    # Test compilation
# make flash    # Program your device  
# make terminal # Open PuTTY
# make all      # Do everything

# Project Configuration
PROJECT_NAME = LCD_Driver
TARGET_MCU = at89c51rc2
CRYSTAL_FREQ = 11059200

# Source and Build Directories
SRC_DIR = .
BUILD_DIR = build
BIN_DIR = .
OBJ_DIR = $(BUILD_DIR)/obj

# Source Files
C_SOURCES = $(wildcard $(SRC_DIR)/*.c)
ASM_SOURCES = $(wildcard $(SRC_DIR)/*.asm)

# Output Files
TARGET = $(PROJECT_NAME)
HEX_FILE = $(BIN_DIR)/$(TARGET).hex
IHX_FILE = $(BIN_DIR)/$(TARGET).ihx
MAP_FILE = $(BIN_DIR)/$(TARGET).map
LST_FILE = $(BIN_DIR)/$(TARGET).lst

# Object Files
C_OBJECTS = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.rel,$(C_SOURCES))
ASM_OBJECTS = $(patsubst $(SRC_DIR)/%.asm,$(OBJ_DIR)/%.rel,$(ASM_SOURCES))
OBJECTS = $(C_OBJECTS) $(ASM_OBJECTS)

# Compiler and Tools
CC = sdcc
AS = sdas8051
PACKIHX = packihx
FLIP = batchisp
TERMINAL = putty

# Hardware Configuration
SERIAL_PORT = COM5
BAUD_RATE = 19200
FLIP_HARDWARE = RS232

# Compiler Flags
CFLAGS = --model-large \
		 --std-c99 \
		 --opt-code-speed \
		 --verbose \
		 --debug \
		 -I$(SRC_DIR) \
		 -DCRYSTAL_FREQ=$(CRYSTAL_FREQ)

# Linker Flags  
LDFLAGS = --model-large \
		  --out-fmt-ihx \
		  --verbose \
		  --print-search-dirs \
		  --xram-loc 0x0400 \
		  --xram-size 31744 \
		  --iram-size 1024 \
		  --code-loc 0x2000 \
		  --code-size 0x6000

# Assembly Flags
# does .lst, .rel, .sym
ASFLAGS = -plosgff

# Default Target

.PHONY: all build flash terminal

# Default target
all: build flash terminal

# Build only
build: directories $(HEX_FILE)

# Build Rules

# Create output directories
directories:
	@echo "Creating build directories..."
	@if not exist "$(BUILD_DIR)" mkdir "$(BUILD_DIR)"
	@if not exist "$(OBJ_DIR)" mkdir "$(OBJ_DIR)"
	@if not exist "$(BIN_DIR)" mkdir "$(BIN_DIR)"

# Link object files to create IHX
$(IHX_FILE): $(OBJECTS) | directories
	@echo "Linking $(TARGET)..."
	$(CC) $(LDFLAGS) -o $@ $(OBJECTS)
	@echo "Linking complete: $@"

# Convert IHX to HEX format for FLIP
$(HEX_FILE): $(IHX_FILE)
	@echo "Converting to Intel HEX format..."
	$(PACKIHX) $< > $@
	@echo "HEX file created: $@"

# Compile C source files
$(OBJ_DIR)/%.rel: $(SRC_DIR)/%.c | directories
	@echo "Compiling $<..."
	$(CC) $(CFLAGS) -c $< -o $@

# Assemble ASM source files
$(OBJ_DIR)/%.rel: $(SRC_DIR)/%.asm | directories
	@echo "Assembling $<..."
	$(AS) $(ASFLAGS) $@ $<

# Hardware Programming and Communication
	
# Flash firmware to AT89C51RC2
flash: build
	@echo "Programming $(TARGET_MCU) via FLIP..."
	@echo "Make sure your device is connected via RS232 on $(SERIAL_PORT)"
	@pause
	$(FLIP) -device $(TARGET_MCU) \
			-hardware $(FLIP_HARDWARE) \
			-port $(SERIAL_PORT) \
			-baudrate 115200 \
			-operation memory flash \
			loadbuffer $(HEX_FILE) \
			program verify
	@if %ERRORLEVEL% == 0 (echo "Programming successful!") else (echo "Programming failed!")

# Open serial terminal on putty
terminal:
	@echo "Opening PuTTY terminal on $(SERIAL_PORT) at $(BAUD_RATE) baud..."
	start "" "C:\Program Files\PuTTY\putty.exe" -serial $(SERIAL_PORT) -sercfg $(BAUD_RATE),8,n,1,N