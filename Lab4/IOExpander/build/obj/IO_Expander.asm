;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module IO_Expander
	.optsdcc -mmcs51 --model-large
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _int0_isr
	.globl _init_INT0_interrupt
	.globl _set_P0_out
	.globl _PCF8574A_init
	.globl _PCF8574A_read
	.globl _PCF8574A_write
	.globl _get_user_input
	.globl _print_hex_dump_line
	.globl _simple_hex_to_int
	.globl _print_newline
	.globl _putstr_green
	.globl _putstr_blue
	.globl _putchar_blue
	.globl _putstr
	.globl _puts
	.globl _printf
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _io_link
	.globl _PCF8574A_input_state
	.globl _IO_Expander_port_state
	.globl _get_user_input_PARM_2
	.globl _print_hex_dump_line_PARM_3
	.globl _print_hex_dump_line_PARM_2
	.globl _putchar
	.globl _getchar
	.globl _show_menu
	.globl _write_byte_menu
	.globl _read_byte_menu
	.globl _hex_dump_menu
	.globl _reset_eeprom_menu
	.globl _eeprom_init
	.globl _TEST
	.globl _BYTEW
	.globl _BYTERD
	.globl _ACKTST
	.globl _OUTS
	.globl _OUT
	.globl _STOP
	.globl _CREAD
	.globl _IN
	.globl _eereset
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
G$P0$0_0$0 == 0x0080
_P0	=	0x0080
G$SP$0_0$0 == 0x0081
_SP	=	0x0081
G$DPL$0_0$0 == 0x0082
_DPL	=	0x0082
G$DPH$0_0$0 == 0x0083
_DPH	=	0x0083
G$PCON$0_0$0 == 0x0087
_PCON	=	0x0087
G$TCON$0_0$0 == 0x0088
_TCON	=	0x0088
G$TMOD$0_0$0 == 0x0089
_TMOD	=	0x0089
G$TL0$0_0$0 == 0x008a
_TL0	=	0x008a
G$TL1$0_0$0 == 0x008b
_TL1	=	0x008b
G$TH0$0_0$0 == 0x008c
_TH0	=	0x008c
G$TH1$0_0$0 == 0x008d
_TH1	=	0x008d
G$P1$0_0$0 == 0x0090
_P1	=	0x0090
G$SCON$0_0$0 == 0x0098
_SCON	=	0x0098
G$SBUF$0_0$0 == 0x0099
_SBUF	=	0x0099
G$P2$0_0$0 == 0x00a0
_P2	=	0x00a0
G$IE$0_0$0 == 0x00a8
_IE	=	0x00a8
G$P3$0_0$0 == 0x00b0
_P3	=	0x00b0
G$IP$0_0$0 == 0x00b8
_IP	=	0x00b8
G$PSW$0_0$0 == 0x00d0
_PSW	=	0x00d0
G$ACC$0_0$0 == 0x00e0
_ACC	=	0x00e0
G$B$0_0$0 == 0x00f0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
G$P0_0$0_0$0 == 0x0080
_P0_0	=	0x0080
G$P0_1$0_0$0 == 0x0081
_P0_1	=	0x0081
G$P0_2$0_0$0 == 0x0082
_P0_2	=	0x0082
G$P0_3$0_0$0 == 0x0083
_P0_3	=	0x0083
G$P0_4$0_0$0 == 0x0084
_P0_4	=	0x0084
G$P0_5$0_0$0 == 0x0085
_P0_5	=	0x0085
G$P0_6$0_0$0 == 0x0086
_P0_6	=	0x0086
G$P0_7$0_0$0 == 0x0087
_P0_7	=	0x0087
G$IT0$0_0$0 == 0x0088
_IT0	=	0x0088
G$IE0$0_0$0 == 0x0089
_IE0	=	0x0089
G$IT1$0_0$0 == 0x008a
_IT1	=	0x008a
G$IE1$0_0$0 == 0x008b
_IE1	=	0x008b
G$TR0$0_0$0 == 0x008c
_TR0	=	0x008c
G$TF0$0_0$0 == 0x008d
_TF0	=	0x008d
G$TR1$0_0$0 == 0x008e
_TR1	=	0x008e
G$TF1$0_0$0 == 0x008f
_TF1	=	0x008f
G$P1_0$0_0$0 == 0x0090
_P1_0	=	0x0090
G$P1_1$0_0$0 == 0x0091
_P1_1	=	0x0091
G$P1_2$0_0$0 == 0x0092
_P1_2	=	0x0092
G$P1_3$0_0$0 == 0x0093
_P1_3	=	0x0093
G$P1_4$0_0$0 == 0x0094
_P1_4	=	0x0094
G$P1_5$0_0$0 == 0x0095
_P1_5	=	0x0095
G$P1_6$0_0$0 == 0x0096
_P1_6	=	0x0096
G$P1_7$0_0$0 == 0x0097
_P1_7	=	0x0097
G$RI$0_0$0 == 0x0098
_RI	=	0x0098
G$TI$0_0$0 == 0x0099
_TI	=	0x0099
G$RB8$0_0$0 == 0x009a
_RB8	=	0x009a
G$TB8$0_0$0 == 0x009b
_TB8	=	0x009b
G$REN$0_0$0 == 0x009c
_REN	=	0x009c
G$SM2$0_0$0 == 0x009d
_SM2	=	0x009d
G$SM1$0_0$0 == 0x009e
_SM1	=	0x009e
G$SM0$0_0$0 == 0x009f
_SM0	=	0x009f
G$P2_0$0_0$0 == 0x00a0
_P2_0	=	0x00a0
G$P2_1$0_0$0 == 0x00a1
_P2_1	=	0x00a1
G$P2_2$0_0$0 == 0x00a2
_P2_2	=	0x00a2
G$P2_3$0_0$0 == 0x00a3
_P2_3	=	0x00a3
G$P2_4$0_0$0 == 0x00a4
_P2_4	=	0x00a4
G$P2_5$0_0$0 == 0x00a5
_P2_5	=	0x00a5
G$P2_6$0_0$0 == 0x00a6
_P2_6	=	0x00a6
G$P2_7$0_0$0 == 0x00a7
_P2_7	=	0x00a7
G$EX0$0_0$0 == 0x00a8
_EX0	=	0x00a8
G$ET0$0_0$0 == 0x00a9
_ET0	=	0x00a9
G$EX1$0_0$0 == 0x00aa
_EX1	=	0x00aa
G$ET1$0_0$0 == 0x00ab
_ET1	=	0x00ab
G$ES$0_0$0 == 0x00ac
_ES	=	0x00ac
G$EA$0_0$0 == 0x00af
_EA	=	0x00af
G$P3_0$0_0$0 == 0x00b0
_P3_0	=	0x00b0
G$P3_1$0_0$0 == 0x00b1
_P3_1	=	0x00b1
G$P3_2$0_0$0 == 0x00b2
_P3_2	=	0x00b2
G$P3_3$0_0$0 == 0x00b3
_P3_3	=	0x00b3
G$P3_4$0_0$0 == 0x00b4
_P3_4	=	0x00b4
G$P3_5$0_0$0 == 0x00b5
_P3_5	=	0x00b5
G$P3_6$0_0$0 == 0x00b6
_P3_6	=	0x00b6
G$P3_7$0_0$0 == 0x00b7
_P3_7	=	0x00b7
G$RXD$0_0$0 == 0x00b0
_RXD	=	0x00b0
G$TXD$0_0$0 == 0x00b1
_TXD	=	0x00b1
G$INT0$0_0$0 == 0x00b2
_INT0	=	0x00b2
G$INT1$0_0$0 == 0x00b3
_INT1	=	0x00b3
G$T0$0_0$0 == 0x00b4
_T0	=	0x00b4
G$T1$0_0$0 == 0x00b5
_T1	=	0x00b5
G$WR$0_0$0 == 0x00b6
_WR	=	0x00b6
G$RD$0_0$0 == 0x00b7
_RD	=	0x00b7
G$PX0$0_0$0 == 0x00b8
_PX0	=	0x00b8
G$PT0$0_0$0 == 0x00b9
_PT0	=	0x00b9
G$PX1$0_0$0 == 0x00ba
_PX1	=	0x00ba
G$PT1$0_0$0 == 0x00bb
_PT1	=	0x00bb
G$PS$0_0$0 == 0x00bc
_PS	=	0x00bc
G$P$0_0$0 == 0x00d0
_P	=	0x00d0
G$F1$0_0$0 == 0x00d1
_F1	=	0x00d1
G$OV$0_0$0 == 0x00d2
_OV	=	0x00d2
G$RS0$0_0$0 == 0x00d3
_RS0	=	0x00d3
G$RS1$0_0$0 == 0x00d4
_RS1	=	0x00d4
G$F0$0_0$0 == 0x00d5
_F0	=	0x00d5
G$AC$0_0$0 == 0x00d6
_AC	=	0x00d6
G$CY$0_0$0 == 0x00d7
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
FIO_Expander$ret_byte$0_0$0==.
_ret_byte:
	.ds 1
FIO_Expander$device_addr$0_0$0==.
_device_addr:
	.ds 1
FIO_Expander$addr_low$0_0$0==.
_addr_low:
	.ds 1
FIO_Expander$asm_data$0_0$0==.
_asm_data:
	.ds 1
FIO_Expander$asm_result$0_0$0==.
_asm_result:
	.ds 1
LIO_Expander.hex_dump_menu$sloc0$0_1$0==.
_hex_dump_menu_sloc0_1_0:
	.ds 2
LIO_Expander.hex_dump_menu$sloc1$0_1$0==.
_hex_dump_menu_sloc1_1_0:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
LIO_Expander.int0_isr$sloc0$0_1$0==.
_int0_isr_sloc0_1_0:
	.ds 1
LIO_Expander.main$sloc0$0_1$0==.
_main_sloc0_1_0:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
LIO_Expander.putchar$c$1_0$71==.
_putchar_c_65536_71:
	.ds 2
LIO_Expander.putstr$s$1_0$75==.
_putstr_s_65536_75:
	.ds 3
LIO_Expander.putchar_blue$c$1_0$78==.
_putchar_blue_c_65536_78:
	.ds 2
LIO_Expander.putstr_blue$s$1_0$80==.
_putstr_blue_s_65536_80:
	.ds 3
LIO_Expander.putstr_green$s$1_0$82==.
_putstr_green_s_65536_82:
	.ds 3
LIO_Expander.simple_hex_to_int$hex_str$1_0$86==.
_simple_hex_to_int_hex_str_65536_86:
	.ds 3
LIO_Expander.simple_hex_to_int$result$1_0$87==.
_simple_hex_to_int_result_65536_87:
	.ds 2
LIO_Expander.print_hex_dump_line$data$1_0$93==.
_print_hex_dump_line_PARM_2:
	.ds 3
LIO_Expander.print_hex_dump_line$count$1_0$93==.
_print_hex_dump_line_PARM_3:
	.ds 1
LIO_Expander.print_hex_dump_line$address$1_0$93==.
_print_hex_dump_line_address_65536_93:
	.ds 2
LIO_Expander.get_user_input$max_len$1_0$97==.
_get_user_input_PARM_2:
	.ds 1
LIO_Expander.get_user_input$buffer$1_0$97==.
_get_user_input_buffer_65536_97:
	.ds 3
LIO_Expander.get_user_input$count$1_0$98==.
_get_user_input_count_65536_98:
	.ds 1
LIO_Expander.PCF8574A_write$data$1_0$104==.
_PCF8574A_write_data_65536_104:
	.ds 1
LIO_Expander.PCF8574A_read$data$1_0$106==.
_PCF8574A_read_data_65536_106:
	.ds 3
LIO_Expander.set_P0_out$state$1_0$110==.
_set_P0_out_state_65536_110:
	.ds 1
LIO_Expander.set_P0_out$new_state$1_0$111==.
_set_P0_out_new_state_65536_111:
	.ds 1
LIO_Expander.int0_isr$port_data$1_0$117==.
_int0_isr_port_data_65536_117:
	.ds 1
FIO_Expander$input_buffer$0_0$0==.
_input_buffer:
	.ds 20
LIO_Expander.main$port_data$4_0$136==.
_main_port_data_262144_136:
	.ds 1
LIO_Expander.main$port_data$4_0$138==.
_main_port_data_262144_138:
	.ds 1
LIO_Expander.hex_dump_menu$current_addr$1_0$150==.
_hex_dump_menu_current_addr_65536_150:
	.ds 2
LIO_Expander.hex_dump_menu$data_buffer$1_0$150==.
_hex_dump_menu_data_buffer_65536_150:
	.ds 16
LIO_Expander.hex_dump_menu$bytes_in_line$1_0$150==.
_hex_dump_menu_bytes_in_line_65536_150:
	.ds 2
LIO_Expander.eereset$i$1_0$185==.
_eereset_i_65536_185:
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
G$IO_Expander_port_state$0_0$0==.
_IO_Expander_port_state::
	.ds 1
G$PCF8574A_input_state$0_0$0==.
_PCF8574A_input_state::
	.ds 1
G$io_link$0_0$0==.
_io_link::
	.ds 1
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	ljmp	_int0_isr
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'putchar'
;------------------------------------------------------------
;c                         Allocated with name '_putchar_c_65536_71'
;------------------------------------------------------------
	G$putchar$0$0 ==.
	C$IO_Expander.c$52$0_0$72 ==.
;	IO_Expander.c:52: int putchar(int c){
;	-----------------------------------------
;	 function putchar
;	-----------------------------------------
_putchar:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_putchar_c_65536_71
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$IO_Expander.c$53$1_0$72 ==.
;	IO_Expander.c:53: while (!TI); // Wait till ready to transmit, TI = 1
00101$:
	jnb	_TI,00101$
	C$IO_Expander.c$54$1_0$72 ==.
;	IO_Expander.c:54: SBUF = c;    // load serial port with transmit value
	mov	dptr,#_putchar_c_65536_71
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	_SBUF,r6
	C$IO_Expander.c$55$1_0$72 ==.
;	IO_Expander.c:55: TI = 0;      // clear TI flag
;	assignBit
	clr	_TI
	C$IO_Expander.c$56$1_0$72 ==.
;	IO_Expander.c:56: return c;
	mov	dpl,r6
	mov	dph,r7
	C$IO_Expander.c$57$1_0$72 ==.
;	IO_Expander.c:57: }
	C$IO_Expander.c$57$1_0$72 ==.
	XG$putchar$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar'
;------------------------------------------------------------
	G$getchar$0$0 ==.
	C$IO_Expander.c$60$1_0$74 ==.
;	IO_Expander.c:60: int getchar(void){
;	-----------------------------------------
;	 function getchar
;	-----------------------------------------
_getchar:
	C$IO_Expander.c$61$1_0$74 ==.
;	IO_Expander.c:61: while (!RI);     // Wait till ready to receive, RI = 1
00101$:
	C$IO_Expander.c$62$1_0$74 ==.
;	IO_Expander.c:62: RI = 0;          // clear RI flag
;	assignBit
	jbc	_RI,00114$
	sjmp	00101$
00114$:
	C$IO_Expander.c$63$1_0$74 ==.
;	IO_Expander.c:63: return SBUF;     // return character from SBUF
	mov	r6,_SBUF
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	C$IO_Expander.c$64$1_0$74 ==.
;	IO_Expander.c:64: }
	C$IO_Expander.c$64$1_0$74 ==.
	XG$getchar$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putstr'
;------------------------------------------------------------
;s                         Allocated with name '_putstr_s_65536_75'
;i                         Allocated with name '_putstr_i_65536_76'
;------------------------------------------------------------
	G$putstr$0$0 ==.
	C$IO_Expander.c$67$1_0$76 ==.
;	IO_Expander.c:67: int putstr(char *s){
;	-----------------------------------------
;	 function putstr
;	-----------------------------------------
_putstr:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_putstr_s_65536_75
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$IO_Expander.c$69$1_0$76 ==.
;	IO_Expander.c:69: while (*s) {     // output characters until NULL found
	mov	dptr,#_putstr_s_65536_75
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	r3,#0x00
	mov	r4,#0x00
00101$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r2,a
	jz	00108$
	C$IO_Expander.c$70$2_0$77 ==.
;	IO_Expander.c:70: putchar(*s++);
	inc	r5
	cjne	r5,#0x00,00116$
	inc	r6
00116$:
	mov	dptr,#_putstr_s_65536_75
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	mov	ar1,r2
	mov	r2,#0x00
	mov	dpl,r1
	mov	dph,r2
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_putchar
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	C$IO_Expander.c$71$2_0$77 ==.
;	IO_Expander.c:71: i++;
	inc	r3
	cjne	r3,#0x00,00101$
	inc	r4
	sjmp	00101$
00108$:
	mov	dptr,#_putstr_s_65536_75
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$IO_Expander.c$73$1_0$76 ==.
;	IO_Expander.c:73: return i+1;
	inc	r3
	cjne	r3,#0x00,00118$
	inc	r4
00118$:
	mov	dpl,r3
	mov	dph,r4
	C$IO_Expander.c$74$1_0$76 ==.
;	IO_Expander.c:74: }
	C$IO_Expander.c$74$1_0$76 ==.
	XG$putstr$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putchar_blue'
;------------------------------------------------------------
;c                         Allocated with name '_putchar_blue_c_65536_78'
;------------------------------------------------------------
	G$putchar_blue$0$0 ==.
	C$IO_Expander.c$76$1_0$79 ==.
;	IO_Expander.c:76: void putchar_blue(int c){
;	-----------------------------------------
;	 function putchar_blue
;	-----------------------------------------
_putchar_blue:
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_putchar_blue_c_65536_78
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$IO_Expander.c$77$1_0$79 ==.
;	IO_Expander.c:77: putstr(ANSI_BLUE_BOLD);
	mov	dptr,#___str_0
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$78$1_0$79 ==.
;	IO_Expander.c:78: putchar(c);
	mov	dptr,#_putchar_blue_c_65536_78
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	lcall	_putchar
	C$IO_Expander.c$79$1_0$79 ==.
;	IO_Expander.c:79: putstr(ANSI_RESET);
	mov	dptr,#___str_1
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$80$1_0$79 ==.
;	IO_Expander.c:80: }
	C$IO_Expander.c$80$1_0$79 ==.
	XG$putchar_blue$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putstr_blue'
;------------------------------------------------------------
;s                         Allocated with name '_putstr_blue_s_65536_80'
;------------------------------------------------------------
	G$putstr_blue$0$0 ==.
	C$IO_Expander.c$82$1_0$81 ==.
;	IO_Expander.c:82: void putstr_blue(char *s){
;	-----------------------------------------
;	 function putstr_blue
;	-----------------------------------------
_putstr_blue:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_putstr_blue_s_65536_80
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$IO_Expander.c$83$1_0$81 ==.
;	IO_Expander.c:83: putstr(ANSI_BLUE_BOLD);
	mov	dptr,#___str_0
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$84$1_0$81 ==.
;	IO_Expander.c:84: putstr(s);
	mov	dptr,#_putstr_blue_s_65536_80
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	_putstr
	C$IO_Expander.c$85$1_0$81 ==.
;	IO_Expander.c:85: putstr(ANSI_RESET);
	mov	dptr,#___str_1
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$86$1_0$81 ==.
;	IO_Expander.c:86: }
	C$IO_Expander.c$86$1_0$81 ==.
	XG$putstr_blue$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putstr_green'
;------------------------------------------------------------
;s                         Allocated with name '_putstr_green_s_65536_82'
;------------------------------------------------------------
	G$putstr_green$0$0 ==.
	C$IO_Expander.c$88$1_0$83 ==.
;	IO_Expander.c:88: void putstr_green(char *s){
;	-----------------------------------------
;	 function putstr_green
;	-----------------------------------------
_putstr_green:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_putstr_green_s_65536_82
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$IO_Expander.c$89$1_0$83 ==.
;	IO_Expander.c:89: putstr(ANSI_GREEN_BOLD);
	mov	dptr,#___str_2
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$90$1_0$83 ==.
;	IO_Expander.c:90: putstr(s);
	mov	dptr,#_putstr_green_s_65536_82
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	_putstr
	C$IO_Expander.c$91$1_0$83 ==.
;	IO_Expander.c:91: putstr(ANSI_RESET);
	mov	dptr,#___str_1
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$92$1_0$83 ==.
;	IO_Expander.c:92: }
	C$IO_Expander.c$92$1_0$83 ==.
	XG$putstr_green$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'print_newline'
;------------------------------------------------------------
	G$print_newline$0$0 ==.
	C$IO_Expander.c$95$1_0$85 ==.
;	IO_Expander.c:95: void print_newline(void) {
;	-----------------------------------------
;	 function print_newline
;	-----------------------------------------
_print_newline:
	C$IO_Expander.c$96$1_0$85 ==.
;	IO_Expander.c:96: putchar('\r');
	mov	dptr,#0x000d
	lcall	_putchar
	C$IO_Expander.c$97$1_0$85 ==.
;	IO_Expander.c:97: putchar('\n');
	mov	dptr,#0x000a
	lcall	_putchar
	C$IO_Expander.c$98$1_0$85 ==.
;	IO_Expander.c:98: }
	C$IO_Expander.c$98$1_0$85 ==.
	XG$print_newline$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'simple_hex_to_int'
;------------------------------------------------------------
;hex_str                   Allocated with name '_simple_hex_to_int_hex_str_65536_86'
;result                    Allocated with name '_simple_hex_to_int_result_65536_87'
;c                         Allocated with name '_simple_hex_to_int_c_65536_87'
;------------------------------------------------------------
	G$simple_hex_to_int$0$0 ==.
	C$IO_Expander.c$100$1_0$87 ==.
;	IO_Expander.c:100: uint16_t simple_hex_to_int(const char *hex_str) {
;	-----------------------------------------
;	 function simple_hex_to_int
;	-----------------------------------------
_simple_hex_to_int:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_simple_hex_to_int_hex_str_65536_86
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$IO_Expander.c$101$2_0$87 ==.
;	IO_Expander.c:101: uint16_t result = 0;
	mov	dptr,#_simple_hex_to_int_result_65536_87
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	C$IO_Expander.c$104$1_0$87 ==.
;	IO_Expander.c:104: while ((c = *hex_str++) != '\0') {
	mov	dptr,#_simple_hex_to_int_hex_str_65536_86
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
00113$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	mov	r5,dpl
	mov	r6,dph
	mov	dptr,#_simple_hex_to_int_hex_str_65536_86
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	mov	a,r4
	jnz	00150$
	ljmp	00115$
00150$:
	C$IO_Expander.c$105$2_0$88 ==.
;	IO_Expander.c:105: result <<= 4;
	mov	dptr,#_simple_hex_to_int_result_65536_87
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	swap	a
	anl	a,#0xf0
	xch	a,r2
	swap	a
	xch	a,r2
	xrl	a,r2
	xch	a,r2
	anl	a,#0xf0
	xch	a,r2
	xrl	a,r2
	mov	r3,a
	mov	dptr,#_simple_hex_to_int_result_65536_87
	mov	a,r2
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	C$IO_Expander.c$106$2_0$88 ==.
;	IO_Expander.c:106: if (c >= '0' && c <= '9') {
	cjne	r4,#0x30,00151$
00151$:
	jc	00110$
	mov	a,r4
	add	a,#0xff - 0x39
	jc	00110$
	C$IO_Expander.c$107$3_0$89 ==.
;	IO_Expander.c:107: result |= (c - '0');
	mov	ar2,r4
	mov	r3,#0x00
	mov	a,r2
	add	a,#0xd0
	mov	r2,a
	mov	a,r3
	addc	a,#0xff
	mov	r3,a
	mov	dptr,#_simple_hex_to_int_result_65536_87
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	mov	a,r0
	orl	ar2,a
	mov	a,r1
	orl	ar3,a
	mov	dptr,#_simple_hex_to_int_result_65536_87
	mov	a,r2
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	sjmp	00113$
00110$:
	C$IO_Expander.c$108$2_0$88 ==.
;	IO_Expander.c:108: } else if (c >= 'A' && c <= 'F') {
	cjne	r4,#0x41,00154$
00154$:
	jc	00106$
	mov	a,r4
	add	a,#0xff - 0x46
	jc	00106$
	C$IO_Expander.c$109$3_0$90 ==.
;	IO_Expander.c:109: result |= (c - 'A' + 10);
	mov	ar2,r4
	mov	r3,#0x00
	mov	a,#0xc9
	add	a,r2
	mov	r2,a
	mov	a,#0xff
	addc	a,r3
	mov	r3,a
	mov	dptr,#_simple_hex_to_int_result_65536_87
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	mov	a,r0
	orl	ar2,a
	mov	a,r1
	orl	ar3,a
	mov	dptr,#_simple_hex_to_int_result_65536_87
	mov	a,r2
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	ljmp	00113$
00106$:
	C$IO_Expander.c$110$2_0$88 ==.
;	IO_Expander.c:110: } else if (c >= 'a' && c <= 'f') {
	cjne	r4,#0x61,00157$
00157$:
	jc	00102$
	mov	a,r4
	add	a,#0xff - 0x66
	jc	00102$
	C$IO_Expander.c$111$3_0$91 ==.
;	IO_Expander.c:111: result |= (c - 'a' + 10);
	mov	r3,#0x00
	mov	a,#0xa9
	add	a,r4
	mov	r4,a
	mov	a,#0xff
	addc	a,r3
	mov	r3,a
	mov	dptr,#_simple_hex_to_int_result_65536_87
	movx	a,@dptr
	mov	r1,a
	inc	dptr
	movx	a,@dptr
	mov	r2,a
	mov	a,r1
	orl	ar4,a
	mov	a,r2
	orl	ar3,a
	mov	dptr,#_simple_hex_to_int_result_65536_87
	mov	a,r4
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	ljmp	00113$
00102$:
	C$IO_Expander.c$113$3_0$92 ==.
;	IO_Expander.c:113: return 0xFFFF;  // Error
	mov	dptr,#0xffff
	sjmp	00116$
00115$:
	C$IO_Expander.c$116$1_0$87 ==.
;	IO_Expander.c:116: return result;
	mov	dptr,#_simple_hex_to_int_result_65536_87
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	C$IO_Expander.c$117$1_0$87 ==.
;	IO_Expander.c:117: }
	C$IO_Expander.c$117$1_0$87 ==.
	XG$simple_hex_to_int$0$0 ==.
	mov	dpl,r6
	mov	dph,a
00116$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'print_hex_dump_line'
;------------------------------------------------------------
;data                      Allocated with name '_print_hex_dump_line_PARM_2'
;count                     Allocated with name '_print_hex_dump_line_PARM_3'
;address                   Allocated with name '_print_hex_dump_line_address_65536_93'
;i                         Allocated with name '_print_hex_dump_line_i_65536_94'
;------------------------------------------------------------
	G$print_hex_dump_line$0$0 ==.
	C$IO_Expander.c$119$1_0$94 ==.
;	IO_Expander.c:119: void print_hex_dump_line(uint16_t address, const uint8_t *data, uint8_t count) {
;	-----------------------------------------
;	 function print_hex_dump_line
;	-----------------------------------------
_print_hex_dump_line:
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_print_hex_dump_line_address_65536_93
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$IO_Expander.c$123$1_0$94 ==.
;	IO_Expander.c:123: printf("%03X: ", address);
	mov	dptr,#_print_hex_dump_line_address_65536_93
	movx	a,@dptr
	push	acc
	inc	dptr
	movx	a,@dptr
	push	acc
	mov	a,#___str_3
	push	acc
	mov	a,#(___str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	C$IO_Expander.c$126$3_0$96 ==.
;	IO_Expander.c:126: for (i = 0; i < count && i < 16; i++) {
	mov	dptr,#_print_hex_dump_line_PARM_2
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_print_hex_dump_line_PARM_3
	movx	a,@dptr
	mov	r4,a
	mov	r3,#0x00
00104$:
	clr	c
	mov	a,r3
	subb	a,r4
	jnc	00101$
	cjne	r3,#0x10,00122$
00122$:
	jnc	00101$
	C$IO_Expander.c$127$3_0$96 ==.
;	IO_Expander.c:127: printf("%02X ", data[i]);
	mov	a,r3
	add	a,r5
	mov	r0,a
	clr	a
	addc	a,r6
	mov	r1,a
	mov	ar2,r7
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	lcall	__gptrget
	mov	r0,a
	mov	r2,#0x00
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar0
	push	ar2
	mov	a,#___str_4
	push	acc
	mov	a,#(___str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	C$IO_Expander.c$126$2_0$95 ==.
;	IO_Expander.c:126: for (i = 0; i < count && i < 16; i++) {
	inc	r3
	sjmp	00104$
00101$:
	C$IO_Expander.c$130$1_0$94 ==.
;	IO_Expander.c:130: printf("\r\n");
	mov	a,#___str_5
	push	acc
	mov	a,#(___str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	C$IO_Expander.c$131$1_0$94 ==.
;	IO_Expander.c:131: }
	C$IO_Expander.c$131$1_0$94 ==.
	XG$print_hex_dump_line$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'get_user_input'
;------------------------------------------------------------
;max_len                   Allocated with name '_get_user_input_PARM_2'
;buffer                    Allocated with name '_get_user_input_buffer_65536_97'
;count                     Allocated with name '_get_user_input_count_65536_98'
;c                         Allocated with name '_get_user_input_c_65536_98'
;------------------------------------------------------------
	G$get_user_input$0$0 ==.
	C$IO_Expander.c$134$1_0$98 ==.
;	IO_Expander.c:134: uint8_t get_user_input(char *buffer, uint8_t max_len) {
;	-----------------------------------------
;	 function get_user_input
;	-----------------------------------------
_get_user_input:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_get_user_input_buffer_65536_97
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$IO_Expander.c$135$2_0$98 ==.
;	IO_Expander.c:135: uint8_t count = 0;
	mov	dptr,#_get_user_input_count_65536_98
	clr	a
	movx	@dptr,a
	C$IO_Expander.c$138$1_0$98 ==.
;	IO_Expander.c:138: while (count < (max_len - 1)) {
	mov	dptr,#_get_user_input_PARM_2
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_get_user_input_buffer_65536_97
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
00118$:
	mov	ar2,r7
	mov	r3,#0x00
	dec	r2
	cjne	r2,#0xff,00159$
	dec	r3
00159$:
	mov	dptr,#_get_user_input_count_65536_98
	movx	a,@dptr
	mov	r0,a
	mov	r1,#0x00
	clr	c
	mov	a,r0
	subb	a,r2
	mov	a,r1
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jc	00160$
	ljmp	00120$
00160$:
	C$IO_Expander.c$140$2_0$99 ==.
;	IO_Expander.c:140: c = getchar();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_getchar
	mov	r2,dpl
	mov	r3,dph
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	C$IO_Expander.c$142$2_0$99 ==.
;	IO_Expander.c:142: if (c == '\r' || c == '\n') {
	cjne	r2,#0x0d,00161$
	ljmp	00120$
00161$:
	cjne	r2,#0x0a,00162$
	ljmp	00120$
00162$:
	C$IO_Expander.c$144$2_0$99 ==.
;	IO_Expander.c:144: } else if (c == '\b' || c == 0x7F) {  // Backspace or DEL
	cjne	r2,#0x08,00163$
	sjmp	00110$
00163$:
	cjne	r2,#0x7f,00111$
00110$:
	C$IO_Expander.c$145$3_0$101 ==.
;	IO_Expander.c:145: if (count > 0) {
	mov	dptr,#_get_user_input_count_65536_98
	movx	a,@dptr
	mov	r3,a
	movx	a,@dptr
	jz	00118$
	C$IO_Expander.c$146$4_0$102 ==.
;	IO_Expander.c:146: count--;
	mov	a,r3
	dec	a
	mov	dptr,#_get_user_input_count_65536_98
	movx	@dptr,a
	C$IO_Expander.c$148$4_0$102 ==.
;	IO_Expander.c:148: putchar('\b');
	mov	dptr,#0x0008
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_putchar
	C$IO_Expander.c$149$4_0$102 ==.
;	IO_Expander.c:149: putchar(' ');
	mov	dptr,#0x0020
	lcall	_putchar
	C$IO_Expander.c$150$4_0$102 ==.
;	IO_Expander.c:150: putchar('\b');
	mov	dptr,#0x0008
	lcall	_putchar
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	ljmp	00118$
00111$:
	C$IO_Expander.c$152$2_0$99 ==.
;	IO_Expander.c:152: } else if ((c >= '0' && c <= '9') ||
	cjne	r2,#0x30,00167$
00167$:
	jc	00107$
	mov	a,r2
	add	a,#0xff - 0x39
	jnc	00103$
00107$:
	C$IO_Expander.c$153$2_0$99 ==.
;	IO_Expander.c:153: (c >= 'A' && c <= 'F') ||
	cjne	r2,#0x41,00170$
00170$:
	jc	00109$
	mov	a,r2
	add	a,#0xff - 0x46
	jnc	00103$
00109$:
	C$IO_Expander.c$154$2_0$99 ==.
;	IO_Expander.c:154: (c >= 'a' && c <= 'f')) {  // Only hex characters
	cjne	r2,#0x61,00173$
00173$:
	jnc	00174$
	ljmp	00118$
00174$:
	mov	a,r2
	add	a,#0xff - 0x66
	jnc	00175$
	ljmp	00118$
00175$:
00103$:
	C$IO_Expander.c$155$3_0$103 ==.
;	IO_Expander.c:155: buffer[count++] = c;
	mov	dptr,#_get_user_input_count_65536_98
	movx	a,@dptr
	mov	r3,a
	inc	a
	movx	@dptr,a
	mov	a,r3
	add	a,r4
	mov	r0,a
	clr	a
	addc	a,r5
	mov	r1,a
	mov	ar3,r6
	mov	dpl,r0
	mov	dph,r1
	mov	b,r3
	mov	a,r2
	lcall	__gptrput
	C$IO_Expander.c$156$3_0$103 ==.
;	IO_Expander.c:156: putchar_blue(c);  // Echo the character
	mov	r3,#0x00
	mov	dpl,r2
	mov	dph,r3
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_putchar_blue
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	ljmp	00118$
00120$:
	C$IO_Expander.c$161$1_0$98 ==.
;	IO_Expander.c:161: buffer[count] = '\0';  // Null terminate
	mov	dptr,#_get_user_input_buffer_65536_97
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_get_user_input_count_65536_98
	movx	a,@dptr
	mov	r4,a
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
	C$IO_Expander.c$162$1_0$98 ==.
;	IO_Expander.c:162: print_newline();
	push	ar4
	lcall	_print_newline
	pop	ar4
	C$IO_Expander.c$163$1_0$98 ==.
;	IO_Expander.c:163: return count;
	mov	dpl,r4
	C$IO_Expander.c$164$1_0$98 ==.
;	IO_Expander.c:164: }
	C$IO_Expander.c$164$1_0$98 ==.
	XG$get_user_input$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PCF8574A_write'
;------------------------------------------------------------
;data                      Allocated with name '_PCF8574A_write_data_65536_104'
;------------------------------------------------------------
	G$PCF8574A_write$0$0 ==.
	C$IO_Expander.c$169$1_0$105 ==.
;	IO_Expander.c:169: bool PCF8574A_write(uint8_t data) {
;	-----------------------------------------
;	 function PCF8574A_write
;	-----------------------------------------
_PCF8574A_write:
	mov	a,dpl
	mov	dptr,#_PCF8574A_write_data_65536_104
	movx	@dptr,a
	C$IO_Expander.c$170$1_0$105 ==.
;	IO_Expander.c:170: device_addr = PCF8574A_WRITE;
	mov	_device_addr,#0x70
	C$IO_Expander.c$171$1_0$105 ==.
;	IO_Expander.c:171: asm_data = data;
	movx	a,@dptr
	mov	r7,a
	mov	_asm_data,r7
	C$IO_Expander.c$180$1_0$105 ==.
;	IO_Expander.c:180: __endasm;
	mov	A, _device_addr ; Load write address
	lcall	_OUTS ; Send it with start condition
	mov	a, _asm_data ; Get data byte
	lcall	_OUT ; Send it
	lcall	_STOP ; Send stop condition
	C$IO_Expander.c$182$1_0$105 ==.
;	IO_Expander.c:182: IO_Expander_port_state = data;
	mov	dptr,#_IO_Expander_port_state
	mov	a,r7
	movx	@dptr,a
	C$IO_Expander.c$183$1_0$105 ==.
;	IO_Expander.c:183: return true;
	mov	dpl,#0x01
	C$IO_Expander.c$184$1_0$105 ==.
;	IO_Expander.c:184: }
	C$IO_Expander.c$184$1_0$105 ==.
	XG$PCF8574A_write$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PCF8574A_read'
;------------------------------------------------------------
;data                      Allocated with name '_PCF8574A_read_data_65536_106'
;------------------------------------------------------------
	G$PCF8574A_read$0$0 ==.
	C$IO_Expander.c$187$1_0$107 ==.
;	IO_Expander.c:187: bool PCF8574A_read(uint8_t *data) {
;	-----------------------------------------
;	 function PCF8574A_read
;	-----------------------------------------
_PCF8574A_read:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_PCF8574A_read_data_65536_106
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$IO_Expander.c$188$1_0$107 ==.
;	IO_Expander.c:188: device_addr = PCF8574A_READ;
	mov	_device_addr,#0x71
	C$IO_Expander.c$196$1_0$107 ==.
;	IO_Expander.c:196: __endasm;
	mov	A, _device_addr ; Load PCF8574A read address
	lcall	_OUTS ; Send it with start condition
	lcall	_IN ; Read data byte
	mov	_asm_result, A ; Store result
	lcall	_STOP ; Send stop condition
	C$IO_Expander.c$198$1_0$107 ==.
;	IO_Expander.c:198: *data = asm_result;
	mov	dptr,#_PCF8574A_read_data_65536_106
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,_asm_result
	lcall	__gptrput
	C$IO_Expander.c$199$1_0$107 ==.
;	IO_Expander.c:199: return true;
	mov	dpl,#0x01
	C$IO_Expander.c$200$1_0$107 ==.
;	IO_Expander.c:200: }
	C$IO_Expander.c$200$1_0$107 ==.
	XG$PCF8574A_read$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PCF8574A_init'
;------------------------------------------------------------
	G$PCF8574A_init$0$0 ==.
	C$IO_Expander.c$202$1_0$109 ==.
;	IO_Expander.c:202: void PCF8574A_init(void) {    
;	-----------------------------------------
;	 function PCF8574A_init
;	-----------------------------------------
_PCF8574A_init:
	C$IO_Expander.c$204$1_0$109 ==.
;	IO_Expander.c:204: PCF8574A_write(DEFAULT_CONFIG);
	mov	dpl,#0xfe
	lcall	_PCF8574A_write
	C$IO_Expander.c$205$1_0$109 ==.
;	IO_Expander.c:205: }
	C$IO_Expander.c$205$1_0$109 ==.
	XG$PCF8574A_init$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'set_P0_out'
;------------------------------------------------------------
;state                     Allocated with name '_set_P0_out_state_65536_110'
;new_state                 Allocated with name '_set_P0_out_new_state_65536_111'
;------------------------------------------------------------
	G$set_P0_out$0$0 ==.
	C$IO_Expander.c$208$1_0$111 ==.
;	IO_Expander.c:208: bool set_P0_out(bool state) {
;	-----------------------------------------
;	 function set_P0_out
;	-----------------------------------------
_set_P0_out:
	mov	a,dpl
	mov	dptr,#_set_P0_out_state_65536_110
	movx	@dptr,a
	C$IO_Expander.c$212$1_0$111 ==.
;	IO_Expander.c:212: new_state = IO_Expander_port_state;
	mov	dptr,#_IO_Expander_port_state
	movx	a,@dptr
	mov	r7,a
	C$IO_Expander.c$213$1_0$111 ==.
;	IO_Expander.c:213: if (state) {
	mov	dptr,#_set_P0_out_state_65536_110
	movx	a,@dptr
	jz	00102$
	C$IO_Expander.c$214$2_0$112 ==.
;	IO_Expander.c:214: new_state |= (1 << 0); // Set bit on bit 0
	mov	dptr,#_set_P0_out_new_state_65536_111
	mov	a,#0x01
	orl	a,r7
	movx	@dptr,a
	sjmp	00103$
00102$:
	C$IO_Expander.c$216$2_0$113 ==.
;	IO_Expander.c:216: new_state &= ~(1 << 0); // Clear bit on bit 0
	mov	dptr,#_set_P0_out_new_state_65536_111
	mov	a,#0xfe
	anl	a,r7
	movx	@dptr,a
00103$:
	C$IO_Expander.c$219$1_0$111 ==.
;	IO_Expander.c:219: return PCF8574A_write(new_state);
	mov	dptr,#_set_P0_out_new_state_65536_111
	movx	a,@dptr
	mov	dpl,a
	lcall	_PCF8574A_write
	C$IO_Expander.c$220$1_0$111 ==.
;	IO_Expander.c:220: }
	C$IO_Expander.c$220$1_0$111 ==.
	XG$set_P0_out$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'init_INT0_interrupt'
;------------------------------------------------------------
	G$init_INT0_interrupt$0$0 ==.
	C$IO_Expander.c$223$1_0$115 ==.
;	IO_Expander.c:223: void init_INT0_interrupt(void) {
;	-----------------------------------------
;	 function init_INT0_interrupt
;	-----------------------------------------
_init_INT0_interrupt:
	C$IO_Expander.c$225$1_0$115 ==.
;	IO_Expander.c:225: IT0 = 1; // INT0 triggered on falling edge
;	assignBit
	setb	_IT0
	C$IO_Expander.c$226$1_0$115 ==.
;	IO_Expander.c:226: EX0 = 1; // Enable INT0
;	assignBit
	setb	_EX0
	C$IO_Expander.c$227$1_0$115 ==.
;	IO_Expander.c:227: EA = 1; // Enable global interrupts
;	assignBit
	setb	_EA
	C$IO_Expander.c$228$1_0$115 ==.
;	IO_Expander.c:228: }
	C$IO_Expander.c$228$1_0$115 ==.
	XG$init_INT0_interrupt$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'int0_isr'
;------------------------------------------------------------
;port_data                 Allocated with name '_int0_isr_port_data_65536_117'
;pin7                      Allocated with name '_int0_isr_pin7_65537_118'
;------------------------------------------------------------
	G$int0_isr$0$0 ==.
	C$IO_Expander.c$231$1_0$117 ==.
;	IO_Expander.c:231: void int0_isr(void) __interrupt (IE0_VECTOR) {
;	-----------------------------------------
;	 function int0_isr
;	-----------------------------------------
_int0_isr:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+7)
	push	(0+6)
	push	(0+5)
	push	(0+4)
	push	(0+3)
	push	(0+2)
	push	(0+1)
	push	(0+0)
	push	psw
	mov	psw,#0x00
	C$IO_Expander.c$233$1_0$117 ==.
;	IO_Expander.c:233: PCF8574A_read(&port_data); // read new val
	mov	dptr,#_int0_isr_port_data_65536_117
	mov	b,#0x00
	lcall	_PCF8574A_read
	C$IO_Expander.c$236$2_0$118 ==.
;	IO_Expander.c:236: bool pin7 = (port_data & INPUT_PIN_MASK);
	mov	dptr,#_int0_isr_port_data_65536_117
	movx	a,@dptr
	rl	a
	anl	a,#0x01
	mov	r7,a
	C$IO_Expander.c$237$1_1$118 ==.
;	IO_Expander.c:237: if (io_link) {
	mov	dptr,#_io_link
	movx	a,@dptr
	jz	00102$
	C$IO_Expander.c$239$2_1$119 ==.
;	IO_Expander.c:239: set_P0_out(pin7);
	mov	dpl,r7
	lcall	_set_P0_out
	sjmp	00104$
00102$:
	C$IO_Expander.c$242$2_1$120 ==.
;	IO_Expander.c:242: set_P0_out(!pin7);
	mov	a,r7
	cjne	a,#0x01,00111$
00111$:
	mov  _int0_isr_sloc0_1_0,c
	clr	a
	rlc	a
	mov	dpl,a
	lcall	_set_P0_out
00104$:
	C$IO_Expander.c$244$1_1$117 ==.
;	IO_Expander.c:244: }
	pop	psw
	pop	(0+0)
	pop	(0+1)
	pop	(0+2)
	pop	(0+3)
	pop	(0+4)
	pop	(0+5)
	pop	(0+6)
	pop	(0+7)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	C$IO_Expander.c$244$1_1$117 ==.
	XG$int0_isr$0$0 ==.
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;choice                    Allocated with name '_main_choice_65536_133'
;port_data                 Allocated with name '_main_port_data_262144_136'
;pin7                      Allocated with name '_main_pin7_262145_137'
;port_data                 Allocated with name '_main_port_data_262144_138'
;pin7                      Allocated with name '_main_pin7_262145_139'
;------------------------------------------------------------
	G$main$0$0 ==.
	C$IO_Expander.c$267$1_1$133 ==.
;	IO_Expander.c:267: int main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	C$IO_Expander.c$271$1_0$133 ==.
;	IO_Expander.c:271: eeprom_init();      // also initializes I2C
	lcall	_eeprom_init
	C$IO_Expander.c$272$1_0$133 ==.
;	IO_Expander.c:272: PCF8574A_init();
	lcall	_PCF8574A_init
	C$IO_Expander.c$273$1_0$133 ==.
;	IO_Expander.c:273: init_INT0_interrupt(); // interrupts on input change
	lcall	_init_INT0_interrupt
	C$IO_Expander.c$274$1_0$133 ==.
;	IO_Expander.c:274: set_P0_out(1); // initial output high
	mov	dpl,#0x01
	lcall	_set_P0_out
	C$IO_Expander.c$277$1_0$133 ==.
;	IO_Expander.c:277: while (1) {
00110$:
	C$IO_Expander.c$278$2_0$134 ==.
;	IO_Expander.c:278: show_menu();
	lcall	_show_menu
	C$IO_Expander.c$279$2_0$134 ==.
;	IO_Expander.c:279: choice = getchar();
	lcall	_getchar
	mov	r6,dpl
	C$IO_Expander.c$280$2_0$134 ==.
;	IO_Expander.c:280: putchar(choice); // echo choice
	mov	ar5,r6
	mov	r7,#0x00
	mov	dpl,r5
	mov	dph,r7
	push	ar6
	lcall	_putchar
	pop	ar6
	C$IO_Expander.c$282$2_0$134 ==.
;	IO_Expander.c:282: switch (choice) {
	cjne	r6,#0x31,00142$
	sjmp	00101$
00142$:
	cjne	r6,#0x32,00143$
	sjmp	00102$
00143$:
	cjne	r6,#0x33,00144$
	sjmp	00103$
00144$:
	cjne	r6,#0x34,00145$
	sjmp	00104$
00145$:
	cjne	r6,#0x35,00146$
	sjmp	00105$
00146$:
	C$IO_Expander.c$283$3_0$135 ==.
;	IO_Expander.c:283: case '1':
	cjne	r6,#0x36,00107$
	sjmp	00106$
00101$:
	C$IO_Expander.c$284$3_0$135 ==.
;	IO_Expander.c:284: write_byte_menu();
	lcall	_write_byte_menu
	C$IO_Expander.c$285$3_0$135 ==.
;	IO_Expander.c:285: break;
	C$IO_Expander.c$286$3_0$135 ==.
;	IO_Expander.c:286: case '2':
	sjmp	00110$
00102$:
	C$IO_Expander.c$287$3_0$135 ==.
;	IO_Expander.c:287: read_byte_menu();
	lcall	_read_byte_menu
	C$IO_Expander.c$288$3_0$135 ==.
;	IO_Expander.c:288: break;
	C$IO_Expander.c$289$3_0$135 ==.
;	IO_Expander.c:289: case '3':
	sjmp	00110$
00103$:
	C$IO_Expander.c$290$3_0$135 ==.
;	IO_Expander.c:290: hex_dump_menu();
	lcall	_hex_dump_menu
	C$IO_Expander.c$291$3_0$135 ==.
;	IO_Expander.c:291: break;
	C$IO_Expander.c$292$3_0$135 ==.
;	IO_Expander.c:292: case '4':
	sjmp	00110$
00104$:
	C$IO_Expander.c$293$3_0$135 ==.
;	IO_Expander.c:293: reset_eeprom_menu();
	lcall	_reset_eeprom_menu
	C$IO_Expander.c$294$3_0$135 ==.
;	IO_Expander.c:294: break;
	C$IO_Expander.c$295$3_0$135 ==.
;	IO_Expander.c:295: case '5':
	sjmp	00110$
00105$:
	C$IO_Expander.c$296$3_0$135 ==.
;	IO_Expander.c:296: io_link = true;
	mov	dptr,#_io_link
	mov	a,#0x01
	movx	@dptr,a
	C$IO_Expander.c$300$4_0$136 ==.
;	IO_Expander.c:300: PCF8574A_read(&port_data);
	mov	dptr,#_main_port_data_262144_136
	mov	b,#0x00
	lcall	_PCF8574A_read
	C$IO_Expander.c$301$5_0$137 ==.
;	IO_Expander.c:301: bool pin7 = (port_data & INPUT_PIN_MASK);
	mov	dptr,#_main_port_data_262144_136
	movx	a,@dptr
	rl	a
	anl	a,#0x01
	C$IO_Expander.c$302$4_1$137 ==.
;	IO_Expander.c:302: set_P0_out(pin7);
	mov	dpl,a
	lcall	_set_P0_out
	C$IO_Expander.c$304$3_0$135 ==.
;	IO_Expander.c:304: break;
	C$IO_Expander.c$305$3_0$135 ==.
;	IO_Expander.c:305: case '6':
	sjmp	00110$
00106$:
	C$IO_Expander.c$306$3_0$135 ==.
;	IO_Expander.c:306: io_link = false;
	mov	dptr,#_io_link
	clr	a
	movx	@dptr,a
	C$IO_Expander.c$310$4_0$138 ==.
;	IO_Expander.c:310: PCF8574A_read(&port_data);
	mov	dptr,#_main_port_data_262144_138
	mov	b,#0x00
	lcall	_PCF8574A_read
	C$IO_Expander.c$311$5_0$139 ==.
;	IO_Expander.c:311: bool pin7 = (port_data & INPUT_PIN_MASK);
	mov	dptr,#_main_port_data_262144_138
	movx	a,@dptr
	rl	a
	anl	a,#0x01
	C$IO_Expander.c$312$4_1$139 ==.
;	IO_Expander.c:312: set_P0_out(!pin7);
	cjne	a,#0x01,00148$
00148$:
	mov  _main_sloc0_1_0,c
	clr	a
	rlc	a
	mov	dpl,a
	lcall	_set_P0_out
	C$IO_Expander.c$314$3_0$135 ==.
;	IO_Expander.c:314: break;
	ljmp	00110$
	C$IO_Expander.c$316$3_0$135 ==.
;	IO_Expander.c:316: default:
00107$:
	C$IO_Expander.c$317$3_0$135 ==.
;	IO_Expander.c:317: putstr("Not a choice we have. Please try again.\r\n\r\n");
	mov	dptr,#___str_6
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$319$1_0$133 ==.
;	IO_Expander.c:319: }
	ljmp	00110$
	C$IO_Expander.c$321$1_0$133 ==.
;	IO_Expander.c:321: }
	C$IO_Expander.c$321$1_0$133 ==.
	XG$main$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'show_menu'
;------------------------------------------------------------
	G$show_menu$0$0 ==.
	C$IO_Expander.c$324$1_0$141 ==.
;	IO_Expander.c:324: void show_menu(void) {
;	-----------------------------------------
;	 function show_menu
;	-----------------------------------------
_show_menu:
	C$IO_Expander.c$325$1_0$141 ==.
;	IO_Expander.c:325: putstr("\r\n");
	mov	dptr,#___str_5
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$326$1_0$141 ==.
;	IO_Expander.c:326: putstr(" --------- I2C Interface Menu --------- \r\n");
	mov	dptr,#___str_7
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$327$1_0$141 ==.
;	IO_Expander.c:327: putstr_blue("EEPROM Functions:\r\n");
	mov	dptr,#___str_8
	mov	b,#0x80
	lcall	_putstr_blue
	C$IO_Expander.c$328$1_0$141 ==.
;	IO_Expander.c:328: putstr("1. Write Byte to EEPROM\r\n");
	mov	dptr,#___str_9
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$329$1_0$141 ==.
;	IO_Expander.c:329: putstr("2. Read Byte from EEPROM\r\n");
	mov	dptr,#___str_10
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$330$1_0$141 ==.
;	IO_Expander.c:330: putstr("3. Hex Dump EEPROM\r\n");
	mov	dptr,#___str_11
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$331$1_0$141 ==.
;	IO_Expander.c:331: putstr("4. Reset EEPROM\r\n");
	mov	dptr,#___str_12
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$332$1_0$141 ==.
;	IO_Expander.c:332: putstr_green("PCF8574A I/O Expander Functions:\r\n");
	mov	dptr,#___str_13
	mov	b,#0x80
	lcall	_putstr_green
	C$IO_Expander.c$333$1_0$141 ==.
;	IO_Expander.c:333: putstr("5. Make Output = Input\r\n");
	mov	dptr,#___str_14
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$334$1_0$141 ==.
;	IO_Expander.c:334: putstr("6. Make Output = !Input \r\n");
	mov	dptr,#___str_15
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$335$1_0$141 ==.
;	IO_Expander.c:335: puts("----------------------------------------\r\n");
	mov	dptr,#___str_16
	mov	b,#0x80
	lcall	_puts
	C$IO_Expander.c$336$1_0$141 ==.
;	IO_Expander.c:336: putstr("Put what you want to do: ");
	mov	dptr,#___str_17
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$337$1_0$141 ==.
;	IO_Expander.c:337: }
	C$IO_Expander.c$337$1_0$141 ==.
	XG$show_menu$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'write_byte_menu'
;------------------------------------------------------------
;address                   Allocated with name '_write_byte_menu_address_65536_143'
;data                      Allocated with name '_write_byte_menu_data_65536_143'
;------------------------------------------------------------
	G$write_byte_menu$0$0 ==.
	C$IO_Expander.c$339$1_0$143 ==.
;	IO_Expander.c:339: void write_byte_menu(void) {
;	-----------------------------------------
;	 function write_byte_menu
;	-----------------------------------------
_write_byte_menu:
	C$IO_Expander.c$342$1_0$143 ==.
;	IO_Expander.c:342: putstr_blue("\r\n--- Write Byte to EEPROM ---\r\n");
	mov	dptr,#___str_18
	mov	b,#0x80
	lcall	_putstr_blue
	C$IO_Expander.c$345$1_0$143 ==.
;	IO_Expander.c:345: putstr("Enter EEPROM address (0-7FF hex): ");
	mov	dptr,#___str_19
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$346$1_0$143 ==.
;	IO_Expander.c:346: get_user_input(input_buffer, INPUT_BUFFER_SIZE);
	mov	dptr,#_get_user_input_PARM_2
	mov	a,#0x14
	movx	@dptr,a
	mov	dptr,#_input_buffer
	mov	b,#0x00
	lcall	_get_user_input
	C$IO_Expander.c$347$1_0$143 ==.
;	IO_Expander.c:347: address = simple_hex_to_int(input_buffer);
	mov	dptr,#_input_buffer
	mov	b,#0x00
	lcall	_simple_hex_to_int
	mov	r6,dpl
	mov	r7,dph
	C$IO_Expander.c$349$1_0$143 ==.
;	IO_Expander.c:349: if (address > EEPROM_MAX_ADDR) {
	mov	ar4,r6
	mov	ar5,r7
	clr	c
	mov	a,#0xff
	subb	a,r4
	mov	a,#0x07
	subb	a,r5
	jnc	00102$
	C$IO_Expander.c$350$2_0$144 ==.
;	IO_Expander.c:350: putstr("Error: Address out of range (max 7FF)\r\n");
	mov	dptr,#___str_20
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$351$2_0$144 ==.
;	IO_Expander.c:351: return;
	ljmp	00105$
00102$:
	C$IO_Expander.c$355$1_0$143 ==.
;	IO_Expander.c:355: putstr("Enter data byte (0-FF hex): ");
	mov	dptr,#___str_21
	mov	b,#0x80
	push	ar7
	push	ar6
	lcall	_putstr
	C$IO_Expander.c$356$1_0$143 ==.
;	IO_Expander.c:356: get_user_input(input_buffer, INPUT_BUFFER_SIZE);
	mov	dptr,#_get_user_input_PARM_2
	mov	a,#0x14
	movx	@dptr,a
	mov	dptr,#_input_buffer
	mov	b,#0x00
	lcall	_get_user_input
	C$IO_Expander.c$357$1_0$143 ==.
;	IO_Expander.c:357: data = simple_hex_to_int(input_buffer);
	mov	dptr,#_input_buffer
	mov	b,#0x00
	lcall	_simple_hex_to_int
	mov	r4,dpl
	mov	r5,dph
	pop	ar6
	pop	ar7
	C$IO_Expander.c$359$1_0$143 ==.
;	IO_Expander.c:359: if (data > 0xFF) {
	mov	ar2,r4
	mov	ar3,r5
	clr	c
	mov	a,#0xff
	subb	a,r2
	clr	a
	subb	a,r3
	jnc	00104$
	C$IO_Expander.c$360$2_0$145 ==.
;	IO_Expander.c:360: putstr("Error: Data out of range (max FF)\r\n");
	mov	dptr,#___str_22
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$361$2_0$145 ==.
;	IO_Expander.c:361: return;
	ljmp	00105$
00104$:
	C$IO_Expander.c$365$1_0$143 ==.
;	IO_Expander.c:365: putstr("Writing");
	mov	dptr,#___str_23
	mov	b,#0x80
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_putstr
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	C$IO_Expander.c$366$1_0$143 ==.
;	IO_Expander.c:366: device_addr = 0xA0 | ((address >> 7) & 0x0E); 
	mov	ar2,r6
	mov	a,r7
	mov	c,acc.7
	xch	a,r2
	rlc	a
	xch	a,r2
	rlc	a
	xch	a,r2
	anl	a,#0x01
	mov	a,#0x0e
	anl	a,r2
	orl	a,#0xa0
	mov	_device_addr,a
	C$IO_Expander.c$367$1_0$143 ==.
;	IO_Expander.c:367: addr_low = address & 0xFF; 
	mov	_addr_low,r6
	C$IO_Expander.c$368$1_0$143 ==.
;	IO_Expander.c:368: printf("\r\ndevice addr: 0x%02X, lower addr: 0x%02X\r\n", device_addr, addr_low);
	mov	r2,_addr_low
	mov	r3,#0x00
	mov	r0,_device_addr
	mov	r1,#0x00
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	mov	a,#___str_24
	push	acc
	mov	a,#(___str_24 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	pop	ar4
	pop	ar5
	C$IO_Expander.c$369$1_0$143 ==.
;	IO_Expander.c:369: asm_data = data;
	mov	_asm_data,r4
	C$IO_Expander.c$370$1_0$143 ==.
;	IO_Expander.c:370: BYTEW();
	lcall	_BYTEW
	C$IO_Expander.c$372$1_0$143 ==.
;	IO_Expander.c:372: putstr_blue("Success!\r\n");
	mov	dptr,#___str_25
	mov	b,#0x80
	lcall	_putstr_blue
	pop	ar6
	pop	ar7
	C$IO_Expander.c$373$1_0$143 ==.
;	IO_Expander.c:373: printf("%03X: ", address);
	push	ar6
	push	ar7
	mov	a,#___str_3
	push	acc
	mov	a,#(___str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	C$IO_Expander.c$374$1_0$143 ==.
;	IO_Expander.c:374: printf("%02X\r\n", asm_data);
	mov	r6,_asm_data
	mov	r7,#0x00
	push	ar6
	push	ar7
	mov	a,#___str_26
	push	acc
	mov	a,#(___str_26 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
00105$:
	C$IO_Expander.c$375$1_0$143 ==.
;	IO_Expander.c:375: }
	C$IO_Expander.c$375$1_0$143 ==.
	XG$write_byte_menu$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'read_byte_menu'
;------------------------------------------------------------
;address                   Allocated with name '_read_byte_menu_address_65536_147'
;------------------------------------------------------------
	G$read_byte_menu$0$0 ==.
	C$IO_Expander.c$377$1_0$147 ==.
;	IO_Expander.c:377: void read_byte_menu(void) {
;	-----------------------------------------
;	 function read_byte_menu
;	-----------------------------------------
_read_byte_menu:
	C$IO_Expander.c$380$1_0$147 ==.
;	IO_Expander.c:380: putstr_blue("\r\n--- Read Byte from EEPROM ---\r\n");
	mov	dptr,#___str_27
	mov	b,#0x80
	lcall	_putstr_blue
	C$IO_Expander.c$383$1_0$147 ==.
;	IO_Expander.c:383: putstr("Enter EEPROM address (0-7FF hex): ");
	mov	dptr,#___str_19
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$384$1_0$147 ==.
;	IO_Expander.c:384: get_user_input(input_buffer, INPUT_BUFFER_SIZE);
	mov	dptr,#_get_user_input_PARM_2
	mov	a,#0x14
	movx	@dptr,a
	mov	dptr,#_input_buffer
	mov	b,#0x00
	lcall	_get_user_input
	C$IO_Expander.c$385$1_0$147 ==.
;	IO_Expander.c:385: address = simple_hex_to_int(input_buffer);  
	mov	dptr,#_input_buffer
	mov	b,#0x00
	lcall	_simple_hex_to_int
	mov	r6,dpl
	mov	r7,dph
	C$IO_Expander.c$387$1_0$147 ==.
;	IO_Expander.c:387: if (address > EEPROM_MAX_ADDR) {
	mov	ar4,r6
	mov	ar5,r7
	clr	c
	mov	a,#0xff
	subb	a,r4
	mov	a,#0x07
	subb	a,r5
	jnc	00102$
	C$IO_Expander.c$388$2_0$148 ==.
;	IO_Expander.c:388: putstr("Error: Address out of range (max 7FF)\r\n");
	mov	dptr,#___str_20
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$389$2_0$148 ==.
;	IO_Expander.c:389: return;
	ljmp	00103$
00102$:
	C$IO_Expander.c$393$1_0$147 ==.
;	IO_Expander.c:393: putstr("Reading");
	mov	dptr,#___str_28
	mov	b,#0x80
	push	ar7
	push	ar6
	lcall	_putstr
	pop	ar6
	pop	ar7
	C$IO_Expander.c$394$1_0$147 ==.
;	IO_Expander.c:394: device_addr = 0xA0 | ((address >> 7) & 0x0E);
	mov	ar4,r6
	mov	a,r7
	mov	c,acc.7
	xch	a,r4
	rlc	a
	xch	a,r4
	rlc	a
	xch	a,r4
	anl	a,#0x01
	mov	a,#0x0e
	anl	a,r4
	orl	a,#0xa0
	mov	_device_addr,a
	C$IO_Expander.c$395$1_0$147 ==.
;	IO_Expander.c:395: addr_low = address & 0xFF; 
	mov	_addr_low,r6
	C$IO_Expander.c$396$1_0$147 ==.
;	IO_Expander.c:396: printf("\r\ndevice addr: 0x%02X, lower addr: 0x%02X\r\n", device_addr, addr_low);
	mov	r4,_addr_low
	mov	r5,#0x00
	mov	r2,_device_addr
	mov	r3,#0x00
	push	ar7
	push	ar6
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	mov	a,#___str_24
	push	acc
	mov	a,#(___str_24 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	C$IO_Expander.c$397$1_0$147 ==.
;	IO_Expander.c:397: BYTERD(); 
	lcall	_BYTERD
	C$IO_Expander.c$399$1_0$147 ==.
;	IO_Expander.c:399: putstr_blue("Success!\r\n");
	mov	dptr,#___str_25
	mov	b,#0x80
	lcall	_putstr_blue
	pop	ar6
	pop	ar7
	C$IO_Expander.c$400$1_0$147 ==.
;	IO_Expander.c:400: printf("%03X: ", address);
	push	ar6
	push	ar7
	mov	a,#___str_3
	push	acc
	mov	a,#(___str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	C$IO_Expander.c$401$1_0$147 ==.
;	IO_Expander.c:401: printf("%02X\r\n", asm_result);
	mov	r6,_asm_result
	mov	r7,#0x00
	push	ar6
	push	ar7
	mov	a,#___str_26
	push	acc
	mov	a,#(___str_26 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
00103$:
	C$IO_Expander.c$402$1_0$147 ==.
;	IO_Expander.c:402: }
	C$IO_Expander.c$402$1_0$147 ==.
	XG$read_byte_menu$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'hex_dump_menu'
;------------------------------------------------------------
;sloc0                     Allocated with name '_hex_dump_menu_sloc0_1_0'
;sloc1                     Allocated with name '_hex_dump_menu_sloc1_1_0'
;start_addr                Allocated with name '_hex_dump_menu_start_addr_65536_150'
;end_addr                  Allocated with name '_hex_dump_menu_end_addr_65536_150'
;current_addr              Allocated with name '_hex_dump_menu_current_addr_65536_150'
;data_buffer               Allocated with name '_hex_dump_menu_data_buffer_65536_150'
;bytes_to_read             Allocated with name '_hex_dump_menu_bytes_to_read_65536_150'
;bytes_in_line             Allocated with name '_hex_dump_menu_bytes_in_line_65536_150'
;i                         Allocated with name '_hex_dump_menu_i_196608_157'
;------------------------------------------------------------
	G$hex_dump_menu$0$0 ==.
	C$IO_Expander.c$404$1_0$150 ==.
;	IO_Expander.c:404: void hex_dump_menu(void) {
;	-----------------------------------------
;	 function hex_dump_menu
;	-----------------------------------------
_hex_dump_menu:
	C$IO_Expander.c$409$1_0$150 ==.
;	IO_Expander.c:409: putstr_blue("\r\n--- Hex Dump EEPROM ---\r\n");
	mov	dptr,#___str_29
	mov	b,#0x80
	lcall	_putstr_blue
	C$IO_Expander.c$412$1_0$150 ==.
;	IO_Expander.c:412: putstr("Enter start address (0-7FF hex): ");
	mov	dptr,#___str_30
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$413$1_0$150 ==.
;	IO_Expander.c:413: get_user_input(input_buffer, INPUT_BUFFER_SIZE);
	mov	dptr,#_get_user_input_PARM_2
	mov	a,#0x14
	movx	@dptr,a
	mov	dptr,#_input_buffer
	mov	b,#0x00
	lcall	_get_user_input
	C$IO_Expander.c$414$1_0$150 ==.
;	IO_Expander.c:414: start_addr = simple_hex_to_int(input_buffer);  
	mov	dptr,#_input_buffer
	mov	b,#0x00
	lcall	_simple_hex_to_int
	mov	r6,dpl
	mov	r7,dph
	C$IO_Expander.c$416$1_0$150 ==.
;	IO_Expander.c:416: if (start_addr > EEPROM_MAX_ADDR) {
	mov	ar4,r6
	mov	ar5,r7
	clr	c
	mov	a,#0xff
	subb	a,r4
	mov	a,#0x07
	subb	a,r5
	jnc	00102$
	C$IO_Expander.c$417$2_0$151 ==.
;	IO_Expander.c:417: putstr("Error: Start address out of range (max 7FF)\r\n");
	mov	dptr,#___str_31
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$418$2_0$151 ==.
;	IO_Expander.c:418: return;
	ljmp	00117$
00102$:
	C$IO_Expander.c$422$1_0$150 ==.
;	IO_Expander.c:422: putstr("Enter end address (0-7FF hex): ");
	mov	dptr,#___str_32
	mov	b,#0x80
	push	ar7
	push	ar6
	lcall	_putstr
	C$IO_Expander.c$423$1_0$150 ==.
;	IO_Expander.c:423: get_user_input(input_buffer, INPUT_BUFFER_SIZE);
	mov	dptr,#_get_user_input_PARM_2
	mov	a,#0x14
	movx	@dptr,a
	mov	dptr,#_input_buffer
	mov	b,#0x00
	lcall	_get_user_input
	C$IO_Expander.c$424$1_0$150 ==.
;	IO_Expander.c:424: end_addr = simple_hex_to_int(input_buffer);  
	mov	dptr,#_input_buffer
	mov	b,#0x00
	lcall	_simple_hex_to_int
	mov	r4,dpl
	mov	r5,dph
	pop	ar6
	pop	ar7
	C$IO_Expander.c$426$1_0$150 ==.
;	IO_Expander.c:426: if (end_addr > EEPROM_MAX_ADDR) {
	mov	ar2,r4
	mov	ar3,r5
	clr	c
	mov	a,#0xff
	subb	a,r2
	mov	a,#0x07
	subb	a,r3
	jnc	00104$
	C$IO_Expander.c$427$2_0$152 ==.
;	IO_Expander.c:427: putstr("Error: End address out of range (max 7FF)\r\n");
	mov	dptr,#___str_33
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$428$2_0$152 ==.
;	IO_Expander.c:428: return;
	ljmp	00117$
00104$:
	C$IO_Expander.c$431$1_0$150 ==.
;	IO_Expander.c:431: if (start_addr > end_addr) {
	clr	c
	mov	a,r4
	subb	a,r6
	mov	a,r5
	subb	a,r7
	jnc	00106$
	C$IO_Expander.c$432$2_0$153 ==.
;	IO_Expander.c:432: putstr("Error: Start address must be <= end address\r\n");
	mov	dptr,#___str_34
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$433$2_0$153 ==.
;	IO_Expander.c:433: return;
	ljmp	00117$
00106$:
	C$IO_Expander.c$436$1_0$150 ==.
;	IO_Expander.c:436: putstr("Reading EEPROM");
	mov	dptr,#___str_35
	mov	b,#0x80
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_putstr
	C$IO_Expander.c$437$1_0$150 ==.
;	IO_Expander.c:437: print_newline();
	lcall	_print_newline
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	C$IO_Expander.c$439$1_0$150 ==.
;	IO_Expander.c:439: current_addr = start_addr;
	mov	dptr,#_hex_dump_menu_current_addr_65536_150
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$IO_Expander.c$441$4_0$158 ==.
;	IO_Expander.c:441: while (current_addr <= end_addr) {
00111$:
	mov	dptr,#_hex_dump_menu_current_addr_65536_150
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	clr	c
	mov	a,r4
	subb	a,r6
	mov	a,r5
	subb	a,r7
	jnc	00155$
	ljmp	00113$
00155$:
	C$IO_Expander.c$442$2_0$154 ==.
;	IO_Expander.c:442: bytes_to_read = end_addr - current_addr + 1;
	mov	a,r4
	clr	c
	subb	a,r6
	mov	r6,a
	mov	a,r5
	subb	a,r7
	mov	r7,a
	inc	r6
	cjne	r6,#0x00,00156$
	inc	r7
00156$:
	C$IO_Expander.c$443$2_0$154 ==.
;	IO_Expander.c:443: if (bytes_to_read > 16) {
	mov	ar2,r6
	mov	ar3,r7
	clr	c
	mov	a,#0x10
	subb	a,r2
	clr	a
	subb	a,r3
	jnc	00108$
	C$IO_Expander.c$444$3_0$155 ==.
;	IO_Expander.c:444: bytes_in_line = 16;
	mov	dptr,#_hex_dump_menu_bytes_in_line_65536_150
	mov	a,#0x10
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	sjmp	00125$
00108$:
	C$IO_Expander.c$446$3_0$156 ==.
;	IO_Expander.c:446: bytes_in_line = bytes_to_read;
	mov	dptr,#_hex_dump_menu_bytes_in_line_65536_150
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$IO_Expander.c$450$1_0$150 ==.
;	IO_Expander.c:450: for (uint8_t i = 0; i < bytes_in_line; i++) {
00125$:
	mov	dptr,#_hex_dump_menu_current_addr_65536_150
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_hex_dump_menu_bytes_in_line_65536_150
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	r1,#0x00
00115$:
	push	ar4
	push	ar5
	mov	ar0,r1
	mov	r5,#0x00
	clr	c
	mov	a,r0
	subb	a,r2
	mov	a,r5
	subb	a,r3
	pop	ar5
	pop	ar4
	jnc	00110$
	C$IO_Expander.c$451$1_0$150 ==.
;	IO_Expander.c:451: device_addr = 0xA0 | (((current_addr + i) >> 7) & 0x0E);
	push	ar4
	push	ar5
	mov	_hex_dump_menu_sloc0_1_0,r1
	mov	(_hex_dump_menu_sloc0_1_0 + 1),#0x00
	mov	_hex_dump_menu_sloc1_1_0,r6
	mov	(_hex_dump_menu_sloc1_1_0 + 1),r7
	mov	r0,_hex_dump_menu_sloc0_1_0
	mov	r5,(_hex_dump_menu_sloc0_1_0 + 1)
	mov	a,r0
	add	a,_hex_dump_menu_sloc1_1_0
	mov	r0,a
	mov	a,r5
	addc	a,(_hex_dump_menu_sloc1_1_0 + 1)
	mov	c,acc.7
	xch	a,r0
	rlc	a
	xch	a,r0
	rlc	a
	xch	a,r0
	anl	a,#0x01
	mov	a,#0x0e
	anl	a,r0
	orl	a,#0xa0
	mov	_device_addr,a
	C$IO_Expander.c$452$4_0$158 ==.
;	IO_Expander.c:452: addr_low = (current_addr + i) & 0xFF;
	mov	ar5,r6
	mov	a,r1
	add	a,r5
	mov	_addr_low,a
	C$IO_Expander.c$453$4_0$158 ==.
;	IO_Expander.c:453: BYTERD();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	push	ar1
	lcall	_BYTERD
	pop	ar1
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	C$IO_Expander.c$454$4_0$158 ==.
;	IO_Expander.c:454: data_buffer[i] = asm_result;
	mov	a,r1
	add	a,#_hex_dump_menu_data_buffer_65536_150
	mov	dpl,a
	clr	a
	addc	a,#(_hex_dump_menu_data_buffer_65536_150 >> 8)
	mov	dph,a
	mov	a,_asm_result
	movx	@dptr,a
	C$IO_Expander.c$450$3_0$157 ==.
;	IO_Expander.c:450: for (uint8_t i = 0; i < bytes_in_line; i++) {
	inc	r1
	pop	ar5
	pop	ar4
	sjmp	00115$
00110$:
	C$IO_Expander.c$458$2_0$154 ==.
;	IO_Expander.c:458: print_hex_dump_line(current_addr, data_buffer, bytes_in_line);
	mov	dptr,#_hex_dump_menu_current_addr_65536_150
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_print_hex_dump_line_PARM_2
	mov	a,#_hex_dump_menu_data_buffer_65536_150
	movx	@dptr,a
	mov	a,#(_hex_dump_menu_data_buffer_65536_150 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_print_hex_dump_line_PARM_3
	mov	a,r2
	movx	@dptr,a
	mov	dpl,r6
	mov	dph,r7
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	lcall	_print_hex_dump_line
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	C$IO_Expander.c$460$2_0$154 ==.
;	IO_Expander.c:460: current_addr += bytes_in_line;
	mov	dptr,#_hex_dump_menu_current_addr_65536_150
	mov	a,r2
	add	a,r6
	movx	@dptr,a
	mov	a,r3
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	ljmp	00111$
00113$:
	C$IO_Expander.c$463$1_0$150 ==.
;	IO_Expander.c:463: putstr_blue("Hex dump complete!\r\n");
	mov	dptr,#___str_36
	mov	b,#0x80
	lcall	_putstr_blue
00117$:
	C$IO_Expander.c$464$1_0$150 ==.
;	IO_Expander.c:464: }
	C$IO_Expander.c$464$1_0$150 ==.
	XG$hex_dump_menu$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'reset_eeprom_menu'
;------------------------------------------------------------
;confirm                   Allocated with name '_reset_eeprom_menu_confirm_65537_161'
;------------------------------------------------------------
	G$reset_eeprom_menu$0$0 ==.
	C$IO_Expander.c$466$1_0$160 ==.
;	IO_Expander.c:466: void reset_eeprom_menu(void) {
;	-----------------------------------------
;	 function reset_eeprom_menu
;	-----------------------------------------
_reset_eeprom_menu:
	C$IO_Expander.c$467$1_0$160 ==.
;	IO_Expander.c:467: putstr_blue("\r\n--- Reset EEPROM ---\r\n");
	mov	dptr,#___str_37
	mov	b,#0x80
	lcall	_putstr_blue
	C$IO_Expander.c$468$1_0$160 ==.
;	IO_Expander.c:468: putstr("This will reset the I2C bus and EEPROM. Continue? (y/n): ");
	mov	dptr,#___str_38
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$470$1_1$161 ==.
;	IO_Expander.c:470: char confirm = getchar();
	lcall	_getchar
	mov	r6,dpl
	C$IO_Expander.c$471$1_1$161 ==.
;	IO_Expander.c:471: putchar(confirm);
	mov	ar5,r6
	mov	r7,#0x00
	mov	dpl,r5
	mov	dph,r7
	push	ar6
	lcall	_putchar
	C$IO_Expander.c$472$1_1$161 ==.
;	IO_Expander.c:472: print_newline();
	lcall	_print_newline
	pop	ar6
	C$IO_Expander.c$474$1_1$161 ==.
;	IO_Expander.c:474: if (confirm == 'y' || confirm == 'Y') {
	cjne	r6,#0x79,00111$
	sjmp	00101$
00111$:
	cjne	r6,#0x59,00102$
00101$:
	C$IO_Expander.c$475$2_1$162 ==.
;	IO_Expander.c:475: putstr("Resetting I2C bus and EEPROM");
	mov	dptr,#___str_39
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$476$2_1$162 ==.
;	IO_Expander.c:476: eereset();
	lcall	_eereset
	C$IO_Expander.c$477$2_1$162 ==.
;	IO_Expander.c:477: putstr_blue(" Complete!\r\n");
	mov	dptr,#___str_40
	mov	b,#0x80
	lcall	_putstr_blue
	C$IO_Expander.c$478$2_1$162 ==.
;	IO_Expander.c:478: putstr("The I2C EEPROM has been reset.\r\n");
	mov	dptr,#___str_41
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$481$2_1$162 ==.
;	IO_Expander.c:481: putstr("Re-initializing PCF8574A...\r\n");
	mov	dptr,#___str_42
	mov	b,#0x80
	lcall	_putstr
	C$IO_Expander.c$482$2_1$162 ==.
;	IO_Expander.c:482: PCF8574A_init();
	lcall	_PCF8574A_init
	sjmp	00105$
00102$:
	C$IO_Expander.c$484$2_1$163 ==.
;	IO_Expander.c:484: putstr("Reset cancelled.\r\n");
	mov	dptr,#___str_43
	mov	b,#0x80
	lcall	_putstr
00105$:
	C$IO_Expander.c$486$1_1$160 ==.
;	IO_Expander.c:486: }
	C$IO_Expander.c$486$1_1$160 ==.
	XG$reset_eeprom_menu$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'eeprom_init'
;------------------------------------------------------------
	G$eeprom_init$0$0 ==.
	C$IO_Expander.c$491$1_1$165 ==.
;	IO_Expander.c:491: void eeprom_init(void) {
;	-----------------------------------------
;	 function eeprom_init
;	-----------------------------------------
_eeprom_init:
	C$IO_Expander.c$492$1_0$165 ==.
;	IO_Expander.c:492: P1 = 0xFF;  // Set both pins high (idle state)
	mov	_P1,#0xff
	C$IO_Expander.c$493$1_0$165 ==.
;	IO_Expander.c:493: }
	C$IO_Expander.c$493$1_0$165 ==.
	XG$eeprom_init$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TEST'
;------------------------------------------------------------
	G$TEST$0$0 ==.
	C$IO_Expander.c$495$1_0$167 ==.
;	IO_Expander.c:495: void TEST(void) __naked {
;	-----------------------------------------
;	 function TEST
;	-----------------------------------------
_TEST:
;	naked function: no prologue.
	C$IO_Expander.c$498$1_0$167 ==.
;	IO_Expander.c:498: __endasm;
	mov	_ret_byte, #0x05
	C$IO_Expander.c$499$1_0$167 ==.
;	IO_Expander.c:499: }
;	naked function: no epilogue.
	C$IO_Expander.c$499$1_0$167 ==.
	XG$TEST$0$0 ==.
;------------------------------------------------------------
;Allocation info for local variables in function 'BYTEW'
;------------------------------------------------------------
	G$BYTEW$0$0 ==.
	C$IO_Expander.c$501$1_0$169 ==.
;	IO_Expander.c:501: void BYTEW(void) __naked {
;	-----------------------------------------
;	 function BYTEW
;	-----------------------------------------
_BYTEW:
;	naked function: no prologue.
	C$IO_Expander.c$511$1_0$169 ==.
;	IO_Expander.c:511: __endasm;
	mov	A, _device_addr
	lcall	_OUTS
	mov	a, _addr_low
	lcall	_OUT
	mov	a, _asm_data
	lcall	_OUT
	lcall	_STOP
	ret
	C$IO_Expander.c$512$1_0$169 ==.
;	IO_Expander.c:512: }
;	naked function: no epilogue.
	C$IO_Expander.c$512$1_0$169 ==.
	XG$BYTEW$0$0 ==.
;------------------------------------------------------------
;Allocation info for local variables in function 'BYTERD'
;------------------------------------------------------------
	G$BYTERD$0$0 ==.
	C$IO_Expander.c$514$1_0$171 ==.
;	IO_Expander.c:514: void BYTERD(void) __naked {
;	-----------------------------------------
;	 function BYTERD
;	-----------------------------------------
_BYTERD:
;	naked function: no prologue.
	C$IO_Expander.c$522$1_0$171 ==.
;	IO_Expander.c:522: __endasm;
	mov	a, _device_addr
	lcall	_OUTS
	mov	a, _addr_low
	lcall	_OUT
	lcall	_CREAD
	ret
	C$IO_Expander.c$523$1_0$171 ==.
;	IO_Expander.c:523: }
;	naked function: no epilogue.
	C$IO_Expander.c$523$1_0$171 ==.
	XG$BYTERD$0$0 ==.
;------------------------------------------------------------
;Allocation info for local variables in function 'ACKTST'
;------------------------------------------------------------
	G$ACKTST$0$0 ==.
	C$IO_Expander.c$525$1_0$173 ==.
;	IO_Expander.c:525: void ACKTST(void) __naked {
;	-----------------------------------------
;	 function ACKTST
;	-----------------------------------------
_ACKTST:
;	naked function: no prologue.
	C$IO_Expander.c$576$1_0$173 ==.
;	IO_Expander.c:576: __endasm;
	MOV	A, _device_addr
	MOV	R2,#8
	CLR	P1.0
	NOP
	NOP
	NOP
	NOP
	NOP
	CLR	P1.1
	    AKTLP:
	RLC	A
	JNC	AKTLS
	SETB	P1.0
	LJMP	AKTL1
	    AKTLS:
	CLR	P1.0
	    AKTL1:
	SETB	P1.1
	NOP
	NOP
	NOP
	NOP
	NOP
	CLR	P1.1
	DJNZ	R2,AKTLP
	SETB	P1.0
	NOP
	NOP
	SETB	P1.1
	NOP
	NOP
	NOP
	NOP
	NOP
	JNB	P1.0,EXIT
	LJMP	_ACKTST
	    EXIT:
	CLR	P1.1
	CLR	P1.0
	NOP
	NOP
	NOP
	NOP
	NOP
	SETB	P1.1
	NOP
	NOP
	SETB	P1.0
	RET
	C$IO_Expander.c$577$1_0$173 ==.
;	IO_Expander.c:577: }
;	naked function: no epilogue.
	C$IO_Expander.c$577$1_0$173 ==.
	XG$ACKTST$0$0 ==.
;------------------------------------------------------------
;Allocation info for local variables in function 'OUTS'
;------------------------------------------------------------
	G$OUTS$0$0 ==.
	C$IO_Expander.c$579$1_0$175 ==.
;	IO_Expander.c:579: void OUTS(void) __naked {
;	-----------------------------------------
;	 function OUTS
;	-----------------------------------------
_OUTS:
;	naked function: no prologue.
	C$IO_Expander.c$624$1_0$175 ==.
;	IO_Expander.c:624: __endasm;
	mov	r2, #8
	setb	P1.0
	setb	P1.1
	nop
	nop
	nop
	nop
	nop
	clr	P1.0
	nop
	nop
	nop
	nop
	nop
	clr	P1.1
	    otslp:
	rlc	a
	jnc	bitls
	setb	P1.0
	sjmp	otsl1
	    bitls:
	clr	P1.0
	    otsl1:
	setb	P1.1
	nop
	nop
	nop
	nop
	nop
	clr	P1.1
	djnz	r2, otslp
	setb	P1.0
	nop
	nop
	nop
	setb	P1.1
	nop
	nop
	nop
	nop
	nop
	clr	P1.1
	ret
	C$IO_Expander.c$625$1_0$175 ==.
;	IO_Expander.c:625: }
;	naked function: no epilogue.
	C$IO_Expander.c$625$1_0$175 ==.
	XG$OUTS$0$0 ==.
;------------------------------------------------------------
;Allocation info for local variables in function 'OUT'
;------------------------------------------------------------
	G$OUT$0$0 ==.
	C$IO_Expander.c$627$1_0$177 ==.
;	IO_Expander.c:627: void OUT(void) __naked {
;	-----------------------------------------
;	 function OUT
;	-----------------------------------------
_OUT:
;	naked function: no prologue.
	C$IO_Expander.c$658$1_0$177 ==.
;	IO_Expander.c:658: __endasm;
	mov	r2, #8
	    otlp:
	rlc	a
	jnc	bitl
	setb	P1.0
	sjmp	otl1
	    bitl:
	clr	P1.0
	    otl1:
	setb	P1.1
	nop
	nop
	nop
	nop
	nop
	clr	P1.1
	djnz	r2, otlp
	setb	P1.0
	nop
	nop
	nop
	setb	P1.1
	nop
	nop
	nop
	nop
	nop
	clr	P1.1
	ret
	C$IO_Expander.c$659$1_0$177 ==.
;	IO_Expander.c:659: }
;	naked function: no epilogue.
	C$IO_Expander.c$659$1_0$177 ==.
	XG$OUT$0$0 ==.
;------------------------------------------------------------
;Allocation info for local variables in function 'STOP'
;------------------------------------------------------------
	G$STOP$0$0 ==.
	C$IO_Expander.c$661$1_0$179 ==.
;	IO_Expander.c:661: void STOP(void) __naked {
;	-----------------------------------------
;	 function STOP
;	-----------------------------------------
_STOP:
;	naked function: no prologue.
	C$IO_Expander.c$677$1_0$179 ==.
;	IO_Expander.c:677: __endasm;
	clr	P1.0
	nop
	nop
	nop
	nop
	nop
	setb	P1.1
	nop
	nop
	nop
	nop
	nop
	setb	P1.0
	ret
	C$IO_Expander.c$678$1_0$179 ==.
;	IO_Expander.c:678: }
;	naked function: no epilogue.
	C$IO_Expander.c$678$1_0$179 ==.
	XG$STOP$0$0 ==.
;------------------------------------------------------------
;Allocation info for local variables in function 'CREAD'
;------------------------------------------------------------
	G$CREAD$0$0 ==.
	C$IO_Expander.c$680$1_0$181 ==.
;	IO_Expander.c:680: void CREAD(void) __naked {
;	-----------------------------------------
;	 function CREAD
;	-----------------------------------------
_CREAD:
;	naked function: no prologue.
	C$IO_Expander.c$689$1_0$181 ==.
;	IO_Expander.c:689: __endasm;
	mov	A, _device_addr
	inc	A
	lcall	_OUTS
	lcall	_IN
	mov	_asm_result,A
	lcall	_STOP
	ret
	C$IO_Expander.c$690$1_0$181 ==.
;	IO_Expander.c:690: }
;	naked function: no epilogue.
	C$IO_Expander.c$690$1_0$181 ==.
	XG$CREAD$0$0 ==.
;------------------------------------------------------------
;Allocation info for local variables in function 'IN'
;------------------------------------------------------------
	G$IN$0$0 ==.
	C$IO_Expander.c$692$1_0$183 ==.
;	IO_Expander.c:692: void IN(void) __naked {
;	-----------------------------------------
;	 function IN
;	-----------------------------------------
_IN:
;	naked function: no prologue.
	C$IO_Expander.c$713$1_0$183 ==.
;	IO_Expander.c:713: __endasm;
	mov	R2,#8
	setb	P1.0
	    inlp:
	clr	P1.1
	nop
	nop
	nop
	nop
	nop
	nop
	setb	P1.1
	clr	C
	jnb	P1.0,inl1
	cpl	C
	    inl1:
	rlc	A
	djnz	R2,inlp
	clr	P1.1
	ret
	C$IO_Expander.c$714$1_0$183 ==.
;	IO_Expander.c:714: }
;	naked function: no epilogue.
	C$IO_Expander.c$714$1_0$183 ==.
	XG$IN$0$0 ==.
;------------------------------------------------------------
;Allocation info for local variables in function 'eereset'
;------------------------------------------------------------
;i                         Allocated with name '_eereset_i_65536_185'
;j                         Allocated with name '_eereset_j_262144_191'
;j                         Allocated with name '_eereset_j_262144_192'
;------------------------------------------------------------
	G$eereset$0$0 ==.
	C$IO_Expander.c$717$1_0$185 ==.
;	IO_Expander.c:717: void eereset(void) {
;	-----------------------------------------
;	 function eereset
;	-----------------------------------------
_eereset:
	C$IO_Expander.c$720$1_0$185 ==.
;	IO_Expander.c:720: P1_0 = 1;  // SDA high
;	assignBit
	setb	_P1_0
	C$IO_Expander.c$721$1_0$185 ==.
;	IO_Expander.c:721: P1_1 = 1;  // SCL high
;	assignBit
	setb	_P1_1
	C$IO_Expander.c$723$2_0$186 ==.
;	IO_Expander.c:723: for (i = 0; i < 10; i++);
	mov	dptr,#_eereset_i_65536_185
	clr	a
	movx	@dptr,a
00112$:
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x0a,00225$
00225$:
	jnc	00101$
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	inc	a
	movx	@dptr,a
	sjmp	00112$
00101$:
	C$IO_Expander.c$726$1_0$185 ==.
;	IO_Expander.c:726: P1_0 = 0;
;	assignBit
	clr	_P1_0
	C$IO_Expander.c$727$2_0$187 ==.
;	IO_Expander.c:727: for (i = 0; i < 5; i++);
	mov	dptr,#_eereset_i_65536_185
	clr	a
	movx	@dptr,a
00115$:
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x05,00227$
00227$:
	jnc	00102$
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	inc	a
	movx	@dptr,a
	sjmp	00115$
00102$:
	C$IO_Expander.c$729$1_0$185 ==.
;	IO_Expander.c:729: P1_1 = 0;
;	assignBit
	clr	_P1_1
	C$IO_Expander.c$730$2_0$188 ==.
;	IO_Expander.c:730: for (i = 0; i < 5; i++);
	mov	dptr,#_eereset_i_65536_185
	clr	a
	movx	@dptr,a
00118$:
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x05,00229$
00229$:
	jnc	00103$
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	inc	a
	movx	@dptr,a
	sjmp	00118$
00103$:
	C$IO_Expander.c$733$1_0$185 ==.
;	IO_Expander.c:733: P1_0 = 1;
;	assignBit
	setb	_P1_0
	C$IO_Expander.c$735$2_0$189 ==.
;	IO_Expander.c:735: for (i = 0; i < 9; i++) {
	mov	dptr,#_eereset_i_65536_185
	clr	a
	movx	@dptr,a
00127$:
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x09,00231$
00231$:
	jnc	00106$
	C$IO_Expander.c$736$3_0$190 ==.
;	IO_Expander.c:736: P1_1 = 1;
;	assignBit
	setb	_P1_1
	C$IO_Expander.c$737$2_0$185 ==.
;	IO_Expander.c:737: for (uint8_t j = 0; j < 10; j++);
	mov	r7,#0x00
00121$:
	cjne	r7,#0x0a,00233$
00233$:
	jnc	00104$
	inc	r7
	sjmp	00121$
00104$:
	C$IO_Expander.c$739$3_0$190 ==.
;	IO_Expander.c:739: P1_1 = 0;
;	assignBit
	clr	_P1_1
	C$IO_Expander.c$740$2_0$185 ==.
;	IO_Expander.c:740: for (uint8_t j = 0; j < 10; j++);
	mov	r7,#0x00
00124$:
	cjne	r7,#0x0a,00235$
00235$:
	jnc	00128$
	inc	r7
	sjmp	00124$
00128$:
	C$IO_Expander.c$735$2_0$189 ==.
;	IO_Expander.c:735: for (i = 0; i < 9; i++) {
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	inc	a
	movx	@dptr,a
	sjmp	00127$
00106$:
	C$IO_Expander.c$744$1_0$185 ==.
;	IO_Expander.c:744: P1_0 = 1;
;	assignBit
	setb	_P1_0
	C$IO_Expander.c$745$1_0$185 ==.
;	IO_Expander.c:745: P1_1 = 1;
;	assignBit
	setb	_P1_1
	C$IO_Expander.c$746$2_0$193 ==.
;	IO_Expander.c:746: for (i = 0; i < 5; i++);
	mov	dptr,#_eereset_i_65536_185
	clr	a
	movx	@dptr,a
00130$:
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x05,00237$
00237$:
	jnc	00107$
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	inc	a
	movx	@dptr,a
	sjmp	00130$
00107$:
	C$IO_Expander.c$748$1_0$185 ==.
;	IO_Expander.c:748: P1_0 = 0;
;	assignBit
	clr	_P1_0
	C$IO_Expander.c$749$2_0$194 ==.
;	IO_Expander.c:749: for (i = 0; i < 5; i++);
	mov	dptr,#_eereset_i_65536_185
	clr	a
	movx	@dptr,a
00133$:
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x05,00239$
00239$:
	jnc	00108$
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	inc	a
	movx	@dptr,a
	sjmp	00133$
00108$:
	C$IO_Expander.c$752$1_0$185 ==.
;	IO_Expander.c:752: P1_1 = 1;
;	assignBit
	setb	_P1_1
	C$IO_Expander.c$753$2_0$195 ==.
;	IO_Expander.c:753: for (i = 0; i < 5; i++);
	mov	dptr,#_eereset_i_65536_185
	clr	a
	movx	@dptr,a
00136$:
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x05,00241$
00241$:
	jnc	00109$
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	inc	a
	movx	@dptr,a
	sjmp	00136$
00109$:
	C$IO_Expander.c$755$1_0$185 ==.
;	IO_Expander.c:755: P1_0 = 1;
;	assignBit
	setb	_P1_0
	C$IO_Expander.c$756$2_0$196 ==.
;	IO_Expander.c:756: for (i = 0; i < 10; i++);
	mov	dptr,#_eereset_i_65536_185
	clr	a
	movx	@dptr,a
00139$:
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x0a,00243$
00243$:
	jnc	00141$
	mov	dptr,#_eereset_i_65536_185
	movx	a,@dptr
	inc	a
	movx	@dptr,a
	sjmp	00139$
00141$:
	C$IO_Expander.c$757$2_0$185 ==.
;	IO_Expander.c:757: }
	C$IO_Expander.c$757$2_0$185 ==.
	XG$eereset$0$0 ==.
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
FIO_Expander$__str_0$0_0$0 == .
	.area CONST   (CODE)
___str_0:
	.db 0x1b
	.ascii "[1;96m"
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_1$0_0$0 == .
	.area CONST   (CODE)
___str_1:
	.db 0x1b
	.ascii "[0m"
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_2$0_0$0 == .
	.area CONST   (CODE)
___str_2:
	.db 0x1b
	.ascii "[1;92m"
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_3$0_0$0 == .
	.area CONST   (CODE)
___str_3:
	.ascii "%03X: "
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_4$0_0$0 == .
	.area CONST   (CODE)
___str_4:
	.ascii "%02X "
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_5$0_0$0 == .
	.area CONST   (CODE)
___str_5:
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_6$0_0$0 == .
	.area CONST   (CODE)
___str_6:
	.ascii "Not a choice we have. Please try again."
	.db 0x0d
	.db 0x0a
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_7$0_0$0 == .
	.area CONST   (CODE)
___str_7:
	.ascii " --------- I2C Interface Menu --------- "
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_8$0_0$0 == .
	.area CONST   (CODE)
___str_8:
	.ascii "EEPROM Functions:"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_9$0_0$0 == .
	.area CONST   (CODE)
___str_9:
	.ascii "1. Write Byte to EEPROM"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_10$0_0$0 == .
	.area CONST   (CODE)
___str_10:
	.ascii "2. Read Byte from EEPROM"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_11$0_0$0 == .
	.area CONST   (CODE)
___str_11:
	.ascii "3. Hex Dump EEPROM"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_12$0_0$0 == .
	.area CONST   (CODE)
___str_12:
	.ascii "4. Reset EEPROM"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_13$0_0$0 == .
	.area CONST   (CODE)
___str_13:
	.ascii "PCF8574A I/O Expander Functions:"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_14$0_0$0 == .
	.area CONST   (CODE)
___str_14:
	.ascii "5. Make Output = Input"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_15$0_0$0 == .
	.area CONST   (CODE)
___str_15:
	.ascii "6. Make Output = !Input "
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_16$0_0$0 == .
	.area CONST   (CODE)
___str_16:
	.ascii "----------------------------------------"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_17$0_0$0 == .
	.area CONST   (CODE)
___str_17:
	.ascii "Put what you want to do: "
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_18$0_0$0 == .
	.area CONST   (CODE)
___str_18:
	.db 0x0d
	.db 0x0a
	.ascii "--- Write Byte to EEPROM ---"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_19$0_0$0 == .
	.area CONST   (CODE)
___str_19:
	.ascii "Enter EEPROM address (0-7FF hex): "
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_20$0_0$0 == .
	.area CONST   (CODE)
___str_20:
	.ascii "Error: Address out of range (max 7FF)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_21$0_0$0 == .
	.area CONST   (CODE)
___str_21:
	.ascii "Enter data byte (0-FF hex): "
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_22$0_0$0 == .
	.area CONST   (CODE)
___str_22:
	.ascii "Error: Data out of range (max FF)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_23$0_0$0 == .
	.area CONST   (CODE)
___str_23:
	.ascii "Writing"
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_24$0_0$0 == .
	.area CONST   (CODE)
___str_24:
	.db 0x0d
	.db 0x0a
	.ascii "device addr: 0x%02X, lower addr: 0x%02X"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_25$0_0$0 == .
	.area CONST   (CODE)
___str_25:
	.ascii "Success!"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_26$0_0$0 == .
	.area CONST   (CODE)
___str_26:
	.ascii "%02X"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_27$0_0$0 == .
	.area CONST   (CODE)
___str_27:
	.db 0x0d
	.db 0x0a
	.ascii "--- Read Byte from EEPROM ---"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_28$0_0$0 == .
	.area CONST   (CODE)
___str_28:
	.ascii "Reading"
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_29$0_0$0 == .
	.area CONST   (CODE)
___str_29:
	.db 0x0d
	.db 0x0a
	.ascii "--- Hex Dump EEPROM ---"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_30$0_0$0 == .
	.area CONST   (CODE)
___str_30:
	.ascii "Enter start address (0-7FF hex): "
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_31$0_0$0 == .
	.area CONST   (CODE)
___str_31:
	.ascii "Error: Start address out of range (max 7FF)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_32$0_0$0 == .
	.area CONST   (CODE)
___str_32:
	.ascii "Enter end address (0-7FF hex): "
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_33$0_0$0 == .
	.area CONST   (CODE)
___str_33:
	.ascii "Error: End address out of range (max 7FF)"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_34$0_0$0 == .
	.area CONST   (CODE)
___str_34:
	.ascii "Error: Start address must be <= end address"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_35$0_0$0 == .
	.area CONST   (CODE)
___str_35:
	.ascii "Reading EEPROM"
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_36$0_0$0 == .
	.area CONST   (CODE)
___str_36:
	.ascii "Hex dump complete!"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_37$0_0$0 == .
	.area CONST   (CODE)
___str_37:
	.db 0x0d
	.db 0x0a
	.ascii "--- Reset EEPROM ---"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_38$0_0$0 == .
	.area CONST   (CODE)
___str_38:
	.ascii "This will reset the I2C bus and EEPROM. Continue? (y/n): "
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_39$0_0$0 == .
	.area CONST   (CODE)
___str_39:
	.ascii "Resetting I2C bus and EEPROM"
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_40$0_0$0 == .
	.area CONST   (CODE)
___str_40:
	.ascii " Complete!"
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_41$0_0$0 == .
	.area CONST   (CODE)
___str_41:
	.ascii "The I2C EEPROM has been reset."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_42$0_0$0 == .
	.area CONST   (CODE)
___str_42:
	.ascii "Re-initializing PCF8574A..."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
FIO_Expander$__str_43$0_0$0 == .
	.area CONST   (CODE)
___str_43:
	.ascii "Reset cancelled."
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area XINIT   (CODE)
FIO_Expander$__xinit_IO_Expander_port_state$0_0$0 == .
__xinit__IO_Expander_port_state:
	.db #0xfe	; 254
FIO_Expander$__xinit_PCF8574A_input_state$0_0$0 == .
__xinit__PCF8574A_input_state:
	.db #0x00	; 0
FIO_Expander$__xinit_io_link$0_0$0 == .
__xinit__io_link:
	.db #0x01	;  1
	.area CABS    (ABS,CODE)
