;; DAPHNE FELT

; Pins
LED_PIN  EQU P1.1  ; Pin for LED
ISR_PIN  EQU P1.2  ; Pin for when I'm inside the ISR

; MY TIMER CALCULATIONS
; Frequency is 11.0592 MHz so time for one clock cycle is 1/11.0592MHz = 0.0904us
; And one machine cycle is 12 clock cycles = 1.0848 us
; Want to toggle LED fully (twice) every 1/.71Hz = 1.408s -- err is 0.4% = 5.6 ms allowed
; 1.408s / 1.0848us = 1297935 machine cycles

; Timer0 in mode 1 (16-bit timer) so it overflows at 2^16 = 65536 - or every 71 ms
; 1408 ms / 71 ms = 19.8 overflows - so I'm just gonna do 20 overflows
; 1297935 cycles / 20 = 64897 cycles per overflow (err of 5 cycles, or 5.4 us so we're good)
; Preloading the timer makes it start at a later value so it overflows sooner
; So need to load timer with 65536 - 64897 = 639

; 639 needs to be split into high and low bytes
; 639 = 0x027F
; High byte = 0x02
; Low byte = 0x7F

Timer0_High EQU 0x02
Timer0_Low  EQU 0x7F
;; REMEMBER I HAVE TO TOGGLE TWICE IN THE TIME I CALCULATED (so every 20/2 = 10 overflows)
Count_Max   EQU 10 ; am doing 10 iterations of the overflow

;;;; Actual start of my code ;;;;

ORG 0000h
LJMP BEGIN

ORG 000Bh ; When the timer overflows, it jumps here so I wanna execute
LJMP ISR_TIMER0

BEGIN: 
    MOV SP, #70h      ; Initialize stack pointer

    MOV P1, #00h      ; Set Port 1 as output (LEDs)

    ;; TIMER0 SETUP
	SETB ET0          ; Enable Timer0 interrupt
    SETB EA           ; Enable global interrupts
	
    MOV TMOD, #0x01     ; Timer0 in mode 1 bc I want 16-bits

    ; preload!
    MOV TH0, #Timer0_High  ; 0x02 - from my calculations earlier
    MOV TL0, #Timer0_Low   ; 0x7F

    ;; also want to staart a counter to count how many times I've overflowed
    MOV R0, #Count_Max

	SETB TR0          ; Start Timer0

    AJMP LOOP
	
LOOP:
	AJMP LOOP		; Infinite loop to the same address until the interrupt changes the address

ISR_TIMER0:
    ; Timer0 interrupt service routine

    SETB ISR_PIN         ; Set P1.2 high to show ISR entry

    ; Reload timer values bc it just overflowed
    MOV TH0, #Timer0_High
    MOV TL0, #Timer0_Low

    DJNZ R0, SKIP_TOGGLE ; subrtract 1 from R0 and if it's not zero, skip the toggle. Only want to toggle after 20 overflows
    
    ;; Toggling and resetting counter
    MOV R0, #Count_Max ; reset counter
    CPL LED_PIN          ; Complement Port 1.1 (TOGGLE IT)
    ;; Then i'll still go into the skip toggle to exit the ISR

SKIP_TOGGLE:
    CLR ISR_PIN          ; Clear P1.2 to indicate ISR exit
    RETI              ; Return from interrupt (also clears my overflow flag)
    END
