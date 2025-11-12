;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module LCD_Driver
	.optsdcc -mmcs51 --model-large
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _row_addresses
	.globl _main
	.globl _menu_print
	.globl _hex_dump_complete
	.globl _hex_dump_cgram
	.globl _hex_dump_ddram
	.globl _let_user_create_char
	.globl _lcdcreatechar
	.globl _get_binary_row
	.globl _timer0_isr
	.globl _timer_init
	.globl _clock_reset
	.globl _clock_start
	.globl _clock_stop
	.globl _display_clock
	.globl _restore_cursor_position
	.globl _save_cursor_position
	.globl _get_user_input
	.globl _get_number
	.globl _lcdinit
	.globl _lcd_delay_ms
	.globl _lcd_home
	.globl _lcdclear
	.globl _lcd_string_at
	.globl _lcd_putchar_at
	.globl _lcdputstr_wordwrap
	.globl _lcdputstr
	.globl _lcdgotoxy
	.globl _lcdgotoaddr
	.globl _lcd_read_address
	.globl _lcdputch
	.globl _lcd_cmd
	.globl _lcdbusywait
	.globl _putstr
	.globl _atoi
	.globl _sprintf
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
	.globl _custom_char_giraffe
	.globl _custom_char_alpaca
	.globl _custom_char_face
	.globl _custom_char_heart
	.globl _custom_char_checker
	.globl _lcd_read_ptr
	.globl _lcd_status_ptr
	.globl _lcdputch_ptr
	.globl _lcd_cmd_ptr
	.globl _current_col
	.globl _current_row
	.globl _cursor_backup
	.globl _timer_do_something
	.globl _system_clock
	.globl _lcdcreatechar_PARM_2
	.globl _get_user_input_PARM_2
	.globl _lcd_string_at_PARM_3
	.globl _lcd_string_at_PARM_2
	.globl _lcd_putchar_at_PARM_3
	.globl _lcd_putchar_at_PARM_2
	.globl _lcdgotoxy_PARM_2
	.globl _putchar
	.globl _getchar
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
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
LLCD_Driver.lcdputstr_wordwrap$sloc0$0_1$0==.
_lcdputstr_wordwrap_sloc0_1_0:
	.ds 3
LLCD_Driver.lcdputstr_wordwrap$sloc1$0_1$0==.
_lcdputstr_wordwrap_sloc1_1_0:
	.ds 3
LLCD_Driver.hex_dump_cgram$sloc0$0_1$0==.
_hex_dump_cgram_sloc0_1_0:
	.ds 1
LLCD_Driver.hex_dump_cgram$sloc1$0_1$0==.
_hex_dump_cgram_sloc1_1_0:
	.ds 1
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
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
LLCD_Driver.putchar$c$1_0$67==.
_putchar_c_65536_67:
	.ds 2
LLCD_Driver.putstr$s$1_0$71==.
_putstr_s_65536_71:
	.ds 3
LLCD_Driver.lcd_cmd$cmd$1_0$77==.
_lcd_cmd_cmd_65536_77:
	.ds 1
LLCD_Driver.lcdputch$cc$1_0$79==.
_lcdputch_cc_65536_79:
	.ds 1
LLCD_Driver.lcdgotoaddr$address$1_0$84==.
_lcdgotoaddr_address_65536_84:
	.ds 1
LLCD_Driver.lcdgotoxy$col$1_0$86==.
_lcdgotoxy_PARM_2:
	.ds 1
LLCD_Driver.lcdgotoxy$row$1_0$86==.
_lcdgotoxy_row_65536_86:
	.ds 1
LLCD_Driver.lcdputstr$ss$1_0$88==.
_lcdputstr_ss_65536_88:
	.ds 3
LLCD_Driver.lcdputstr$current_row_local$1_0$89==.
_lcdputstr_current_row_local_65536_89:
	.ds 1
LLCD_Driver.lcdputstr$current_col_local$1_0$89==.
_lcdputstr_current_col_local_65536_89:
	.ds 1
LLCD_Driver.lcdputstr_wordwrap$ss$1_0$96==.
_lcdputstr_wordwrap_ss_65536_96:
	.ds 3
LLCD_Driver.lcdputstr_wordwrap$current_row_local$1_0$97==.
_lcdputstr_wordwrap_current_row_local_65536_97:
	.ds 1
LLCD_Driver.lcdputstr_wordwrap$current_col_local$1_0$97==.
_lcdputstr_wordwrap_current_col_local_65536_97:
	.ds 1
LLCD_Driver.lcdputstr_wordwrap$word_start$1_1$101==.
_lcdputstr_wordwrap_word_start_65537_101:
	.ds 3
LLCD_Driver.lcd_putchar_at$col$1_0$108==.
_lcd_putchar_at_PARM_2:
	.ds 1
LLCD_Driver.lcd_putchar_at$c$1_0$108==.
_lcd_putchar_at_PARM_3:
	.ds 1
LLCD_Driver.lcd_putchar_at$row$1_0$108==.
_lcd_putchar_at_row_65536_108:
	.ds 1
LLCD_Driver.lcd_string_at$col$1_0$110==.
_lcd_string_at_PARM_2:
	.ds 1
LLCD_Driver.lcd_string_at$str$1_0$110==.
_lcd_string_at_PARM_3:
	.ds 3
LLCD_Driver.lcd_string_at$row$1_0$110==.
_lcd_string_at_row_65536_110:
	.ds 1
LLCD_Driver.lcd_delay_ms$ms$1_0$116==.
_lcd_delay_ms_ms_65536_116:
	.ds 1
LLCD_Driver.lcd_delay_ms$i$1_0$117==.
_lcd_delay_ms_i_65536_117:
	.ds 2
LLCD_Driver.get_number$buffer$1_0$123==.
_get_number_buffer_65536_123:
	.ds 3
LLCD_Driver.get_user_input$max_len$1_0$127==.
_get_user_input_PARM_2:
	.ds 1
LLCD_Driver.get_user_input$buffer$1_0$127==.
_get_user_input_buffer_65536_127:
	.ds 3
LLCD_Driver.get_user_input$count$1_0$128==.
_get_user_input_count_65536_128:
	.ds 1
LLCD_Driver.display_clock$time_str$1_0$140==.
_display_clock_time_str_65536_140:
	.ds 9
LLCD_Driver.get_binary_row$bits$1_0$157==.
_get_binary_row_bits_65536_157:
	.ds 6
LLCD_Driver.get_binary_row$count$1_0$157==.
_get_binary_row_count_65536_157:
	.ds 1
LLCD_Driver.get_binary_row$result$1_0$157==.
_get_binary_row_result_65536_157:
	.ds 1
LLCD_Driver.lcdcreatechar$row_vals$1_0$166==.
_lcdcreatechar_PARM_2:
	.ds 3
LLCD_Driver.lcdcreatechar$ccode$1_0$166==.
_lcdcreatechar_ccode_65536_166:
	.ds 1
LLCD_Driver.let_user_create_char$row_vals$1_2$175==.
_let_user_create_char_row_vals_65538_175:
	.ds 8
LLCD_Driver.let_user_create_char$prompt$3_2$177==.
_let_user_create_char_prompt_196610_177:
	.ds 30
LLCD_Driver.hex_dump_ddram$header$3_1$182==.
_hex_dump_ddram_header_196609_182:
	.ds 20
LLCD_Driver.hex_dump_ddram$buf$5_2$185==.
_hex_dump_ddram_buf_327682_185:
	.ds 8
LLCD_Driver.hex_dump_cgram$pattern$5_1$192==.
_hex_dump_cgram_pattern_327681_192:
	.ds 1
LLCD_Driver.hex_dump_cgram$buf$5_1$192==.
_hex_dump_cgram_buf_327681_192:
	.ds 30
LLCD_Driver.main$input_buffer$1_1$203==.
_main_input_buffer_65537_203:
	.ds 64
LLCD_Driver.main$char_buffer$1_1$203==.
_main_char_buffer_65537_203:
	.ds 1
LLCD_Driver.main$row$1_1$203==.
_main_row_65537_203:
	.ds 2
LLCD_Driver.main$col$1_1$203==.
_main_col_65537_203:
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
G$system_clock$0_0$0==.
_system_clock::
	.ds 8
G$timer_do_something$0_0$0==.
_timer_do_something::
	.ds 1
G$cursor_backup$0_0$0==.
_cursor_backup::
	.ds 3
G$current_row$0_0$0==.
_current_row::
	.ds 1
G$current_col$0_0$0==.
_current_col::
	.ds 1
G$lcd_cmd_ptr$0_0$0==.
_lcd_cmd_ptr::
	.ds 2
G$lcdputch_ptr$0_0$0==.
_lcdputch_ptr::
	.ds 2
G$lcd_status_ptr$0_0$0==.
_lcd_status_ptr::
	.ds 2
G$lcd_read_ptr$0_0$0==.
_lcd_read_ptr::
	.ds 2
G$custom_char_checker$0_0$0==.
_custom_char_checker::
	.ds 8
G$custom_char_heart$0_0$0==.
_custom_char_heart::
	.ds 8
G$custom_char_face$0_0$0==.
_custom_char_face::
	.ds 8
G$custom_char_alpaca$0_0$0==.
_custom_char_alpaca::
	.ds 8
G$custom_char_giraffe$0_0$0==.
_custom_char_giraffe::
	.ds 8
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
	reti
	.ds	7
	ljmp	_timer0_isr
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
;c                         Allocated with name '_putchar_c_65536_67'
;------------------------------------------------------------
	G$putchar$0$0 ==.
	C$LCD_Driver.c$78$0_0$68 ==.
;	LCD_Driver.c:78: int putchar (int c){
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
	mov	dptr,#_putchar_c_65536_67
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$79$1_0$68 ==.
;	LCD_Driver.c:79: while (!TI); // Wait till ready to transmit, TI = 1
00101$:
	jnb	_TI,00101$
	C$LCD_Driver.c$80$1_0$68 ==.
;	LCD_Driver.c:80: SBUF = c;    // load serial port with transmit value
	mov	dptr,#_putchar_c_65536_67
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	_SBUF,r6
	C$LCD_Driver.c$81$1_0$68 ==.
;	LCD_Driver.c:81: TI = 0;      // clear TI flag
;	assignBit
	clr	_TI
	C$LCD_Driver.c$82$1_0$68 ==.
;	LCD_Driver.c:82: return c;
	mov	dpl,r6
	mov	dph,r7
	C$LCD_Driver.c$83$1_0$68 ==.
;	LCD_Driver.c:83: }
	C$LCD_Driver.c$83$1_0$68 ==.
	XG$putchar$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar'
;------------------------------------------------------------
	G$getchar$0$0 ==.
	C$LCD_Driver.c$86$1_0$70 ==.
;	LCD_Driver.c:86: int getchar (void){
;	-----------------------------------------
;	 function getchar
;	-----------------------------------------
_getchar:
	C$LCD_Driver.c$87$1_0$70 ==.
;	LCD_Driver.c:87: while (!RI);     // Wait till ready to receive, RI = 1
00101$:
	C$LCD_Driver.c$88$1_0$70 ==.
;	LCD_Driver.c:88: RI = 0;          // clear RI flag
;	assignBit
	jbc	_RI,00114$
	sjmp	00101$
00114$:
	C$LCD_Driver.c$89$1_0$70 ==.
;	LCD_Driver.c:89: return SBUF;     // return character from SBUF
	mov	r6,_SBUF
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	C$LCD_Driver.c$90$1_0$70 ==.
;	LCD_Driver.c:90: }
	C$LCD_Driver.c$90$1_0$70 ==.
	XG$getchar$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putstr'
;------------------------------------------------------------
;s                         Allocated with name '_putstr_s_65536_71'
;i                         Allocated with name '_putstr_i_65536_72'
;------------------------------------------------------------
	G$putstr$0$0 ==.
	C$LCD_Driver.c$93$1_0$72 ==.
;	LCD_Driver.c:93: int putstr (char *s){
;	-----------------------------------------
;	 function putstr
;	-----------------------------------------
_putstr:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_putstr_s_65536_71
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$95$1_0$72 ==.
;	LCD_Driver.c:95: while (*s) {     // output characters until NULL found
	mov	dptr,#_putstr_s_65536_71
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
	C$LCD_Driver.c$96$2_0$73 ==.
;	LCD_Driver.c:96: putchar(*s++);
	inc	r5
	cjne	r5,#0x00,00116$
	inc	r6
00116$:
	mov	dptr,#_putstr_s_65536_71
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
	C$LCD_Driver.c$97$2_0$73 ==.
;	LCD_Driver.c:97: i++;
	inc	r3
	cjne	r3,#0x00,00101$
	inc	r4
	sjmp	00101$
00108$:
	mov	dptr,#_putstr_s_65536_71
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$99$1_0$72 ==.
;	LCD_Driver.c:99: return i+1;
	inc	r3
	cjne	r3,#0x00,00118$
	inc	r4
00118$:
	mov	dpl,r3
	mov	dph,r4
	C$LCD_Driver.c$100$1_0$72 ==.
;	LCD_Driver.c:100: }
	C$LCD_Driver.c$100$1_0$72 ==.
	XG$putstr$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcdbusywait'
;------------------------------------------------------------
;status                    Allocated with name '_lcdbusywait_status_65536_75'
;timeout                   Allocated with name '_lcdbusywait_timeout_65536_75'
;------------------------------------------------------------
	G$lcdbusywait$0$0 ==.
	C$LCD_Driver.c$103$1_0$75 ==.
;	LCD_Driver.c:103: void lcdbusywait(void)
;	-----------------------------------------
;	 function lcdbusywait
;	-----------------------------------------
_lcdbusywait:
	C$LCD_Driver.c$108$1_0$75 ==.
;	LCD_Driver.c:108: do {
	mov	r6,#0x50
	mov	r7,#0xc3
00103$:
	C$LCD_Driver.c$109$2_0$76 ==.
;	LCD_Driver.c:109: status = *lcd_status_ptr;  // Read status register (RS=0, RW=1)
	mov	dptr,#_lcd_status_ptr
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	dpl,r4
	mov	dph,r5
	movx	a,@dptr
	mov	r5,a
	C$LCD_Driver.c$110$2_0$76 ==.
;	LCD_Driver.c:110: timeout--;
	dec	r6
	cjne	r6,#0xff,00117$
	dec	r7
00117$:
	C$LCD_Driver.c$113$2_0$76 ==.
;	LCD_Driver.c:113: if(timeout == 0) break;
	mov	a,r6
	orl	a,r7
	jz	00106$
	C$LCD_Driver.c$115$1_0$75 ==.
;	LCD_Driver.c:115: } while(status & 0x80);  // Wait while busy flag (bit 7) is set
	mov	a,r5
	jb	acc.7,00103$
00106$:
	C$LCD_Driver.c$116$1_0$75 ==.
;	LCD_Driver.c:116: }
	C$LCD_Driver.c$116$1_0$75 ==.
	XG$lcdbusywait$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcd_cmd'
;------------------------------------------------------------
;cmd                       Allocated with name '_lcd_cmd_cmd_65536_77'
;------------------------------------------------------------
	G$lcd_cmd$0$0 ==.
	C$LCD_Driver.c$119$1_0$78 ==.
;	LCD_Driver.c:119: void lcd_cmd(uint8_t cmd)
;	-----------------------------------------
;	 function lcd_cmd
;	-----------------------------------------
_lcd_cmd:
	mov	a,dpl
	mov	dptr,#_lcd_cmd_cmd_65536_77
	movx	@dptr,a
	C$LCD_Driver.c$121$1_0$78 ==.
;	LCD_Driver.c:121: lcdbusywait();    // wait for LCD to be ready
	lcall	_lcdbusywait
	C$LCD_Driver.c$122$1_0$78 ==.
;	LCD_Driver.c:122: *lcd_cmd_ptr = cmd;  // Send command
	mov	dptr,#_lcd_cmd_ptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_lcd_cmd_cmd_65536_77
	movx	a,@dptr
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
	C$LCD_Driver.c$123$1_0$78 ==.
;	LCD_Driver.c:123: }
	C$LCD_Driver.c$123$1_0$78 ==.
	XG$lcd_cmd$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcdputch'
;------------------------------------------------------------
;cc                        Allocated with name '_lcdputch_cc_65536_79'
;------------------------------------------------------------
	G$lcdputch$0$0 ==.
	C$LCD_Driver.c$126$1_0$80 ==.
;	LCD_Driver.c:126: void lcdputch(char cc)
;	-----------------------------------------
;	 function lcdputch
;	-----------------------------------------
_lcdputch:
	mov	a,dpl
	mov	dptr,#_lcdputch_cc_65536_79
	movx	@dptr,a
	C$LCD_Driver.c$128$1_0$80 ==.
;	LCD_Driver.c:128: lcdbusywait();     // Wait for LCD to be ready
	lcall	_lcdbusywait
	C$LCD_Driver.c$129$1_0$80 ==.
;	LCD_Driver.c:129: *lcdputch_ptr = cc; // Send data
	mov	dptr,#_lcdputch_ptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_lcdputch_cc_65536_79
	movx	a,@dptr
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
	C$LCD_Driver.c$132$1_0$80 ==.
;	LCD_Driver.c:132: current_col++;
	mov	dptr,#_current_col
	movx	a,@dptr
	inc	a
	movx	@dptr,a
	C$LCD_Driver.c$133$1_0$80 ==.
;	LCD_Driver.c:133: if(current_col >= MAX_COLS) {
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x10,00115$
00115$:
	jc	00105$
	C$LCD_Driver.c$134$2_0$81 ==.
;	LCD_Driver.c:134: current_col = 0;
	mov	dptr,#_current_col
	clr	a
	movx	@dptr,a
	C$LCD_Driver.c$135$2_0$81 ==.
;	LCD_Driver.c:135: current_row++;
	mov	dptr,#_current_row
	movx	a,@dptr
	inc	a
	movx	@dptr,a
	C$LCD_Driver.c$136$2_0$81 ==.
;	LCD_Driver.c:136: if(current_row >= MAX_ROWS) current_row = 0;
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x04,00117$
00117$:
	jc	00105$
	mov	dptr,#_current_row
	clr	a
	movx	@dptr,a
00105$:
	C$LCD_Driver.c$138$1_0$80 ==.
;	LCD_Driver.c:138: }
	C$LCD_Driver.c$138$1_0$80 ==.
	XG$lcdputch$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcd_read_address'
;------------------------------------------------------------
;addr                      Allocated with name '_lcd_read_address_addr_65536_83'
;------------------------------------------------------------
	G$lcd_read_address$0$0 ==.
	C$LCD_Driver.c$140$1_0$83 ==.
;	LCD_Driver.c:140: uint8_t lcd_read_address(void)
;	-----------------------------------------
;	 function lcd_read_address
;	-----------------------------------------
_lcd_read_address:
	C$LCD_Driver.c$143$1_0$83 ==.
;	LCD_Driver.c:143: lcdbusywait();               // Wait for LCD to be ready
	lcall	_lcdbusywait
	C$LCD_Driver.c$144$1_0$83 ==.
;	LCD_Driver.c:144: addr = *lcd_status_ptr & 0x7F; // Read address (mask out busy flag)
	mov	dptr,#_lcd_status_ptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	mov	r6,a
	anl	ar6,#0x7f
	C$LCD_Driver.c$145$1_0$83 ==.
;	LCD_Driver.c:145: return addr;
	mov	dpl,r6
	C$LCD_Driver.c$146$1_0$83 ==.
;	LCD_Driver.c:146: }
	C$LCD_Driver.c$146$1_0$83 ==.
	XG$lcd_read_address$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcdgotoaddr'
;------------------------------------------------------------
;address                   Allocated with name '_lcdgotoaddr_address_65536_84'
;------------------------------------------------------------
	G$lcdgotoaddr$0$0 ==.
	C$LCD_Driver.c$148$1_0$85 ==.
;	LCD_Driver.c:148: void lcdgotoaddr(unsigned char address)
;	-----------------------------------------
;	 function lcdgotoaddr
;	-----------------------------------------
_lcdgotoaddr:
	mov	a,dpl
	mov	dptr,#_lcdgotoaddr_address_65536_84
	movx	@dptr,a
	C$LCD_Driver.c$150$1_0$85 ==.
;	LCD_Driver.c:150: lcd_cmd(0x80 | address);    // Set DDRAM address command
	movx	a,@dptr
	orl	a,#0x80
	mov	dpl,a
	lcall	_lcd_cmd
	C$LCD_Driver.c$151$1_0$85 ==.
;	LCD_Driver.c:151: lcdbusywait(); // this cmd takes longer
	lcall	_lcdbusywait
	C$LCD_Driver.c$152$1_0$85 ==.
;	LCD_Driver.c:152: }
	C$LCD_Driver.c$152$1_0$85 ==.
	XG$lcdgotoaddr$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcdgotoxy'
;------------------------------------------------------------
;col                       Allocated with name '_lcdgotoxy_PARM_2'
;row                       Allocated with name '_lcdgotoxy_row_65536_86'
;address                   Allocated with name '_lcdgotoxy_address_65536_87'
;------------------------------------------------------------
	G$lcdgotoxy$0$0 ==.
	C$LCD_Driver.c$155$1_0$87 ==.
;	LCD_Driver.c:155: void lcdgotoxy(unsigned char row, unsigned char col)
;	-----------------------------------------
;	 function lcdgotoxy
;	-----------------------------------------
_lcdgotoxy:
	mov	a,dpl
	mov	dptr,#_lcdgotoxy_row_65536_86
	movx	@dptr,a
	C$LCD_Driver.c$158$1_0$87 ==.
;	LCD_Driver.c:158: current_row = row;
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_current_row
	movx	@dptr,a
	C$LCD_Driver.c$159$1_0$87 ==.
;	LCD_Driver.c:159: current_col = col;
	mov	dptr,#_lcdgotoxy_PARM_2
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#_current_col
	movx	@dptr,a
	C$LCD_Driver.c$162$1_0$87 ==.
;	LCD_Driver.c:162: if(row > (MAX_ROWS-1)) row = (MAX_ROWS-1);
	mov	a,r7
	add	a,#0xff - 0x03
	jnc	00102$
	mov	dptr,#_lcdgotoxy_row_65536_86
	mov	a,#0x03
	movx	@dptr,a
00102$:
	C$LCD_Driver.c$163$1_0$87 ==.
;	LCD_Driver.c:163: if(col > (MAX_COLS-1)) col = (MAX_COLS-1);
	mov	a,r6
	add	a,#0xff - 0x0f
	jnc	00104$
	mov	dptr,#_lcdgotoxy_PARM_2
	mov	a,#0x0f
	movx	@dptr,a
00104$:
	C$LCD_Driver.c$165$1_0$87 ==.
;	LCD_Driver.c:165: address = row_addresses[row] + col;
	mov	dptr,#_lcdgotoxy_row_65536_86
	movx	a,@dptr
	mov	dptr,#_row_addresses
	movc	a,@a+dptr
	mov	r7,a
	mov	dptr,#_lcdgotoxy_PARM_2
	movx	a,@dptr
	add	a,r7
	C$LCD_Driver.c$166$1_0$87 ==.
;	LCD_Driver.c:166: lcdgotoaddr(address);
	mov	dpl,a
	lcall	_lcdgotoaddr
	C$LCD_Driver.c$167$1_0$87 ==.
;	LCD_Driver.c:167: }
	C$LCD_Driver.c$167$1_0$87 ==.
	XG$lcdgotoxy$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcdputstr'
;------------------------------------------------------------
;ss                        Allocated with name '_lcdputstr_ss_65536_88'
;current_row_local         Allocated with name '_lcdputstr_current_row_local_65536_89'
;current_col_local         Allocated with name '_lcdputstr_current_col_local_65536_89'
;ddram_addr                Allocated with name '_lcdputstr_ddram_addr_65536_89'
;i                         Allocated with name '_lcdputstr_i_131072_90'
;------------------------------------------------------------
	G$lcdputstr$0$0 ==.
	C$LCD_Driver.c$170$1_0$89 ==.
;	LCD_Driver.c:170: void lcdputstr(char *ss)
;	-----------------------------------------
;	 function lcdputstr
;	-----------------------------------------
_lcdputstr:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_lcdputstr_ss_65536_88
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$172$2_0$89 ==.
;	LCD_Driver.c:172: uint8_t current_row_local = 0;
	mov	dptr,#_lcdputstr_current_row_local_65536_89
	clr	a
	movx	@dptr,a
	C$LCD_Driver.c$173$2_0$89 ==.
;	LCD_Driver.c:173: uint8_t current_col_local = 0;
	mov	dptr,#_lcdputstr_current_col_local_65536_89
	movx	@dptr,a
	C$LCD_Driver.c$176$1_0$89 ==.
;	LCD_Driver.c:176: uint8_t ddram_addr = lcd_read_address();
	lcall	_lcd_read_address
	mov	r7,dpl
	C$LCD_Driver.c$179$1_0$89 ==.
;	LCD_Driver.c:179: for(uint8_t i = 0; i < MAX_ROWS; i++) {
	mov	r6,#0x00
00113$:
	cjne	r6,#0x04,00150$
00150$:
	jnc	00124$
	C$LCD_Driver.c$180$3_0$91 ==.
;	LCD_Driver.c:180: if(ddram_addr >= row_addresses[i] &&
	mov	a,r6
	mov	dptr,#_row_addresses
	movc	a,@a+dptr
	mov	r5,a
	clr	c
	mov	a,r7
	subb	a,r5
	jc	00114$
	C$LCD_Driver.c$181$3_0$91 ==.
;	LCD_Driver.c:181: ddram_addr < (row_addresses[i] + MAX_COLS)) {
	mov	ar3,r5
	mov	r4,#0x00
	mov	a,#0x10
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	ar1,r7
	mov	r2,#0x00
	clr	c
	mov	a,r1
	subb	a,r3
	mov	a,r2
	xrl	a,#0x80
	mov	b,r4
	xrl	b,#0x80
	subb	a,b
	jnc	00114$
	C$LCD_Driver.c$182$4_0$92 ==.
;	LCD_Driver.c:182: current_row_local = i;
	mov	dptr,#_lcdputstr_current_row_local_65536_89
	mov	a,r6
	movx	@dptr,a
	C$LCD_Driver.c$183$4_0$92 ==.
;	LCD_Driver.c:183: current_col_local = ddram_addr - row_addresses[i];
	mov	dptr,#_lcdputstr_current_col_local_65536_89
	mov	a,r7
	clr	c
	subb	a,r5
	movx	@dptr,a
	C$LCD_Driver.c$184$4_0$92 ==.
;	LCD_Driver.c:184: break;
	sjmp	00124$
00114$:
	C$LCD_Driver.c$179$2_0$90 ==.
;	LCD_Driver.c:179: for(uint8_t i = 0; i < MAX_ROWS; i++) {
	inc	r6
	C$LCD_Driver.c$188$1_0$89 ==.
;	LCD_Driver.c:188: while(*ss) {
	sjmp	00113$
00124$:
	mov	dptr,#_lcdputstr_ss_65536_88
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
00109$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	jz	00125$
	C$LCD_Driver.c$190$2_0$93 ==.
;	LCD_Driver.c:190: if(current_col_local >= MAX_COLS) {
	mov	dptr,#_lcdputstr_current_col_local_65536_89
	movx	a,@dptr
	mov	r4,a
	cjne	r4,#0x10,00155$
00155$:
	jc	00108$
	C$LCD_Driver.c$191$3_0$94 ==.
;	LCD_Driver.c:191: current_col_local = 0;
	mov	dptr,#_lcdputstr_current_col_local_65536_89
	clr	a
	movx	@dptr,a
	C$LCD_Driver.c$192$3_0$94 ==.
;	LCD_Driver.c:192: current_row_local++;
	mov	dptr,#_lcdputstr_current_row_local_65536_89
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	C$LCD_Driver.c$195$3_0$94 ==.
;	LCD_Driver.c:195: if(current_row_local >= MAX_ROWS) {
	movx	a,@dptr
	mov	r4,a
	cjne	r4,#0x04,00157$
00157$:
	jc	00106$
	C$LCD_Driver.c$196$4_0$95 ==.
;	LCD_Driver.c:196: current_row_local = 0;
	mov	dptr,#_lcdputstr_current_row_local_65536_89
	clr	a
	movx	@dptr,a
00106$:
	C$LCD_Driver.c$200$3_0$94 ==.
;	LCD_Driver.c:200: lcdgotoxy(current_row_local, current_col_local);
	mov	dptr,#_lcdputstr_current_row_local_65536_89
	movx	a,@dptr
	mov	r4,a
	mov	dptr,#_lcdgotoxy_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,r4
	push	ar7
	push	ar6
	push	ar5
	lcall	_lcdgotoxy
	pop	ar5
	pop	ar6
	pop	ar7
00108$:
	C$LCD_Driver.c$204$2_0$93 ==.
;	LCD_Driver.c:204: lcdputch(*ss++);
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	mov	r5,dpl
	mov	r6,dph
	mov	dptr,#_lcdputstr_ss_65536_88
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	mov	dpl,r4
	push	ar7
	push	ar6
	push	ar5
	lcall	_lcdputch
	pop	ar5
	pop	ar6
	pop	ar7
	C$LCD_Driver.c$205$2_0$93 ==.
;	LCD_Driver.c:205: current_col_local++;
	mov	dptr,#_lcdputstr_current_col_local_65536_89
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	ljmp	00109$
00125$:
	mov	dptr,#_lcdputstr_ss_65536_88
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$207$1_0$89 ==.
;	LCD_Driver.c:207: }
	C$LCD_Driver.c$207$1_0$89 ==.
	XG$lcdputstr$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcdputstr_wordwrap'
;------------------------------------------------------------
;sloc0                     Allocated with name '_lcdputstr_wordwrap_sloc0_1_0'
;sloc1                     Allocated with name '_lcdputstr_wordwrap_sloc1_1_0'
;ss                        Allocated with name '_lcdputstr_wordwrap_ss_65536_96'
;current_row_local         Allocated with name '_lcdputstr_wordwrap_current_row_local_65536_97'
;current_col_local         Allocated with name '_lcdputstr_wordwrap_current_col_local_65536_97'
;ddram_addr                Allocated with name '_lcdputstr_wordwrap_ddram_addr_65536_97'
;i                         Allocated with name '_lcdputstr_wordwrap_i_131072_98'
;word_start                Allocated with name '_lcdputstr_wordwrap_word_start_65537_101'
;word_length               Allocated with name '_lcdputstr_wordwrap_word_length_196609_103'
;p                         Allocated with name '_lcdputstr_wordwrap_p_262145_106'
;------------------------------------------------------------
	G$lcdputstr_wordwrap$0$0 ==.
	C$LCD_Driver.c$209$1_0$97 ==.
;	LCD_Driver.c:209: void lcdputstr_wordwrap(char *ss)
;	-----------------------------------------
;	 function lcdputstr_wordwrap
;	-----------------------------------------
_lcdputstr_wordwrap:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_lcdputstr_wordwrap_ss_65536_96
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$211$2_0$97 ==.
;	LCD_Driver.c:211: uint8_t current_row_local = 0;
	mov	dptr,#_lcdputstr_wordwrap_current_row_local_65536_97
	clr	a
	movx	@dptr,a
	C$LCD_Driver.c$212$2_0$97 ==.
;	LCD_Driver.c:212: uint8_t current_col_local = 0;
	mov	dptr,#_lcdputstr_wordwrap_current_col_local_65536_97
	movx	@dptr,a
	C$LCD_Driver.c$215$1_0$97 ==.
;	LCD_Driver.c:215: uint8_t ddram_addr = lcd_read_address();
	lcall	_lcd_read_address
	mov	r7,dpl
	C$LCD_Driver.c$218$1_1$97 ==.
;	LCD_Driver.c:218: for(uint8_t i = 0; i < MAX_ROWS; i++) {
	mov	r6,#0x00
00117$:
	cjne	r6,#0x04,00176$
00176$:
	jnc	00104$
	C$LCD_Driver.c$219$3_0$99 ==.
;	LCD_Driver.c:219: if(ddram_addr >= row_addresses[i] &&
	mov	a,r6
	mov	dptr,#_row_addresses
	movc	a,@a+dptr
	mov	r5,a
	clr	c
	mov	a,r7
	subb	a,r5
	jc	00118$
	C$LCD_Driver.c$220$3_0$99 ==.
;	LCD_Driver.c:220: ddram_addr < (row_addresses[i] + MAX_COLS)) {
	mov	ar3,r5
	mov	r4,#0x00
	mov	a,#0x10
	add	a,r3
	mov	r3,a
	clr	a
	addc	a,r4
	mov	r4,a
	mov	ar1,r7
	mov	r2,#0x00
	clr	c
	mov	a,r1
	subb	a,r3
	mov	a,r2
	xrl	a,#0x80
	mov	b,r4
	xrl	b,#0x80
	subb	a,b
	jnc	00118$
	C$LCD_Driver.c$221$4_0$100 ==.
;	LCD_Driver.c:221: current_row_local = i;
	mov	dptr,#_lcdputstr_wordwrap_current_row_local_65536_97
	mov	a,r6
	movx	@dptr,a
	C$LCD_Driver.c$222$4_0$100 ==.
;	LCD_Driver.c:222: current_col_local = ddram_addr - row_addresses[i];
	mov	dptr,#_lcdputstr_wordwrap_current_col_local_65536_97
	mov	a,r7
	clr	c
	subb	a,r5
	movx	@dptr,a
	C$LCD_Driver.c$223$4_0$100 ==.
;	LCD_Driver.c:223: break;
	sjmp	00104$
00118$:
	C$LCD_Driver.c$218$2_0$98 ==.
;	LCD_Driver.c:218: for(uint8_t i = 0; i < MAX_ROWS; i++) {
	inc	r6
	sjmp	00117$
00104$:
	C$LCD_Driver.c$227$2_0$101 ==.
;	LCD_Driver.c:227: char *word_start = ss;
	mov	dptr,#_lcdputstr_wordwrap_ss_65536_96
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_lcdputstr_wordwrap_word_start_65537_101
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$229$1_1$97 ==.
;	LCD_Driver.c:229: while(*ss) {
00113$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	jnz	00180$
	ljmp	00139$
00180$:
	C$LCD_Driver.c$231$2_1$102 ==.
;	LCD_Driver.c:231: if(*ss == ' ' || *(ss + 1) == '\0') {
	cjne	r4,#0x20,00181$
	sjmp	00110$
00181$:
	mov	a,#0x01
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	jz	00182$
	ljmp	00111$
00182$:
00110$:
	C$LCD_Driver.c$232$3_1$103 ==.
;	LCD_Driver.c:232: uint8_t word_length = ss - word_start + ((*ss == ' ') ? 0 : 1);
	mov	dptr,#_lcdputstr_wordwrap_word_start_65537_101
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	inc	dptr
	movx	a,@dptr
	mov	ar1,r5
	mov	a,r1
	clr	c
	subb	a,r2
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r3,a
	cjne	r3,#0x20,00124$
	mov	r2,#0x00
	mov	r3,#0x00
	sjmp	00125$
00124$:
	mov	r2,#0x01
	mov	r3,#0x00
00125$:
	mov	a,r2
	add	a,r4
	mov	r4,a
	C$LCD_Driver.c$235$3_1$103 ==.
;	LCD_Driver.c:235: if(current_col_local + word_length > MAX_COLS) {
	mov	dptr,#_lcdputstr_wordwrap_current_col_local_65536_97
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	mov	ar1,r4
	mov	r4,#0x00
	mov	a,r1
	add	a,r3
	mov	r3,a
	mov	a,r4
	addc	a,r2
	mov	r2,a
	clr	c
	mov	a,#0x10
	subb	a,r3
	mov	a,#(0x00 ^ 0x80)
	mov	b,r2
	xrl	b,#0x80
	subb	a,b
	jnc	00108$
	C$LCD_Driver.c$236$4_1$104 ==.
;	LCD_Driver.c:236: current_col_local = 0;
	mov	dptr,#_lcdputstr_wordwrap_current_col_local_65536_97
	clr	a
	movx	@dptr,a
	C$LCD_Driver.c$237$4_1$104 ==.
;	LCD_Driver.c:237: current_row_local++;
	mov	dptr,#_lcdputstr_wordwrap_current_row_local_65536_97
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
	C$LCD_Driver.c$240$4_1$104 ==.
;	LCD_Driver.c:240: if(current_row_local >= MAX_ROWS) {
	movx	a,@dptr
	mov	r4,a
	cjne	r4,#0x04,00186$
00186$:
	jc	00106$
	C$LCD_Driver.c$241$5_1$105 ==.
;	LCD_Driver.c:241: current_row_local = 0;
	mov	dptr,#_lcdputstr_wordwrap_current_row_local_65536_97
	clr	a
	movx	@dptr,a
00106$:
	C$LCD_Driver.c$245$4_1$104 ==.
;	LCD_Driver.c:245: lcdgotoxy(current_row_local, current_col_local);
	mov	dptr,#_lcdputstr_wordwrap_current_row_local_65536_97
	movx	a,@dptr
	mov	r4,a
	mov	dptr,#_lcdgotoxy_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,r4
	push	ar7
	push	ar6
	push	ar5
	lcall	_lcdgotoxy
	pop	ar5
	pop	ar6
	pop	ar7
00108$:
	C$LCD_Driver.c$249$5_1$106 ==.
;	LCD_Driver.c:249: for(char *p = word_start; p <= ss; p++) {
	mov	dptr,#_lcdputstr_wordwrap_word_start_65537_101
	movx	a,@dptr
	mov	_lcdputstr_wordwrap_sloc1_1_0,a
	inc	dptr
	movx	a,@dptr
	mov	(_lcdputstr_wordwrap_sloc1_1_0 + 1),a
	inc	dptr
	movx	a,@dptr
	mov	(_lcdputstr_wordwrap_sloc1_1_0 + 2),a
	mov	_lcdputstr_wordwrap_sloc0_1_0,r5
	mov	(_lcdputstr_wordwrap_sloc0_1_0 + 1),r6
	mov	(_lcdputstr_wordwrap_sloc0_1_0 + 2),r7
	mov	dptr,#_lcdputstr_wordwrap_current_col_local_65536_97
	movx	a,@dptr
	mov	r1,a
00120$:
	push	ar1
	mov	r0,_lcdputstr_wordwrap_sloc1_1_0
	mov	r1,(_lcdputstr_wordwrap_sloc1_1_0 + 1)
	mov	r4,(_lcdputstr_wordwrap_sloc1_1_0 + 2)
	push	ar0
	push	ar1
	push	ar4
	mov	dpl,_lcdputstr_wordwrap_sloc0_1_0
	mov	dph,(_lcdputstr_wordwrap_sloc0_1_0 + 1)
	mov	b,(_lcdputstr_wordwrap_sloc0_1_0 + 2)
	lcall	___gptr_cmp
	dec	sp
	dec	sp
	dec	sp
	pop	ar1
	jc	00138$
	C$LCD_Driver.c$250$5_1$107 ==.
;	LCD_Driver.c:250: lcdputch(*p);
	mov	dpl,_lcdputstr_wordwrap_sloc1_1_0
	mov	dph,(_lcdputstr_wordwrap_sloc1_1_0 + 1)
	mov	b,(_lcdputstr_wordwrap_sloc1_1_0 + 2)
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	mov	_lcdputstr_wordwrap_sloc1_1_0,dpl
	mov	(_lcdputstr_wordwrap_sloc1_1_0 + 1),dph
	mov	dpl,r4
	push	ar7
	push	ar6
	push	ar5
	push	ar1
	lcall	_lcdputch
	pop	ar1
	pop	ar5
	pop	ar6
	pop	ar7
	C$LCD_Driver.c$251$5_1$107 ==.
;	LCD_Driver.c:251: current_col_local++;
	inc	r1
	C$LCD_Driver.c$249$4_1$106 ==.
;	LCD_Driver.c:249: for(char *p = word_start; p <= ss; p++) {
	sjmp	00120$
00138$:
	mov	dptr,#_lcdputstr_wordwrap_current_col_local_65536_97
	mov	a,r1
	movx	@dptr,a
	C$LCD_Driver.c$254$3_1$103 ==.
;	LCD_Driver.c:254: word_start = ss + 1; // Move to start of next word
	mov	dptr,#_lcdputstr_wordwrap_word_start_65537_101
	mov	a,#0x01
	add	a,_lcdputstr_wordwrap_sloc0_1_0
	movx	@dptr,a
	clr	a
	addc	a,(_lcdputstr_wordwrap_sloc0_1_0 + 1)
	inc	dptr
	movx	@dptr,a
	mov	a,(_lcdputstr_wordwrap_sloc0_1_0 + 2)
	inc	dptr
	movx	@dptr,a
00111$:
	C$LCD_Driver.c$257$2_1$102 ==.
;	LCD_Driver.c:257: ss++;
	inc	r5
	cjne	r5,#0x00,00189$
	inc	r6
00189$:
	mov	dptr,#_lcdputstr_wordwrap_ss_65536_96
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	ljmp	00113$
00139$:
	mov	dptr,#_lcdputstr_wordwrap_ss_65536_96
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$259$1_1$97 ==.
;	LCD_Driver.c:259: }
	C$LCD_Driver.c$259$1_1$97 ==.
	XG$lcdputstr_wordwrap$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcd_putchar_at'
;------------------------------------------------------------
;col                       Allocated with name '_lcd_putchar_at_PARM_2'
;c                         Allocated with name '_lcd_putchar_at_PARM_3'
;row                       Allocated with name '_lcd_putchar_at_row_65536_108'
;------------------------------------------------------------
	G$lcd_putchar_at$0$0 ==.
	C$LCD_Driver.c$262$1_1$109 ==.
;	LCD_Driver.c:262: void lcd_putchar_at(uint8_t row, uint8_t col, char c)
;	-----------------------------------------
;	 function lcd_putchar_at
;	-----------------------------------------
_lcd_putchar_at:
	mov	a,dpl
	mov	dptr,#_lcd_putchar_at_row_65536_108
	movx	@dptr,a
	C$LCD_Driver.c$264$1_0$109 ==.
;	LCD_Driver.c:264: lcdgotoxy(row, col);
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_lcd_putchar_at_PARM_2
	movx	a,@dptr
	mov	dptr,#_lcdgotoxy_PARM_2
	movx	@dptr,a
	mov	dpl,r7
	lcall	_lcdgotoxy
	C$LCD_Driver.c$265$1_0$109 ==.
;	LCD_Driver.c:265: lcdputch(c);
	mov	dptr,#_lcd_putchar_at_PARM_3
	movx	a,@dptr
	mov	dpl,a
	lcall	_lcdputch
	C$LCD_Driver.c$266$1_0$109 ==.
;	LCD_Driver.c:266: }
	C$LCD_Driver.c$266$1_0$109 ==.
	XG$lcd_putchar_at$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcd_string_at'
;------------------------------------------------------------
;col                       Allocated with name '_lcd_string_at_PARM_2'
;str                       Allocated with name '_lcd_string_at_PARM_3'
;row                       Allocated with name '_lcd_string_at_row_65536_110'
;------------------------------------------------------------
	G$lcd_string_at$0$0 ==.
	C$LCD_Driver.c$269$1_0$111 ==.
;	LCD_Driver.c:269: void lcd_string_at(uint8_t row, uint8_t col, const char *str)
;	-----------------------------------------
;	 function lcd_string_at
;	-----------------------------------------
_lcd_string_at:
	mov	a,dpl
	mov	dptr,#_lcd_string_at_row_65536_110
	movx	@dptr,a
	C$LCD_Driver.c$271$1_0$111 ==.
;	LCD_Driver.c:271: lcdgotoxy(row, col);
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_lcd_string_at_PARM_2
	movx	a,@dptr
	mov	dptr,#_lcdgotoxy_PARM_2
	movx	@dptr,a
	mov	dpl,r7
	lcall	_lcdgotoxy
	C$LCD_Driver.c$272$1_0$111 ==.
;	LCD_Driver.c:272: lcdputstr((char *)str);
	mov	dptr,#_lcd_string_at_PARM_3
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
	lcall	_lcdputstr
	C$LCD_Driver.c$273$1_0$111 ==.
;	LCD_Driver.c:273: }
	C$LCD_Driver.c$273$1_0$111 ==.
	XG$lcd_string_at$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcdclear'
;------------------------------------------------------------
	G$lcdclear$0$0 ==.
	C$LCD_Driver.c$276$1_0$113 ==.
;	LCD_Driver.c:276: void lcdclear(void)
;	-----------------------------------------
;	 function lcdclear
;	-----------------------------------------
_lcdclear:
	C$LCD_Driver.c$278$1_0$113 ==.
;	LCD_Driver.c:278: lcd_cmd(0x01);  // Clear display command (slow)
	mov	dpl,#0x01
	lcall	_lcd_cmd
	C$LCD_Driver.c$279$1_0$113 ==.
;	LCD_Driver.c:279: current_row = 0;
	mov	dptr,#_current_row
	clr	a
	movx	@dptr,a
	C$LCD_Driver.c$280$1_0$113 ==.
;	LCD_Driver.c:280: current_col = 0;
	mov	dptr,#_current_col
	movx	@dptr,a
	C$LCD_Driver.c$281$1_0$113 ==.
;	LCD_Driver.c:281: lcdbusywait(); // wait for it to complete
	lcall	_lcdbusywait
	C$LCD_Driver.c$282$1_0$113 ==.
;	LCD_Driver.c:282: }
	C$LCD_Driver.c$282$1_0$113 ==.
	XG$lcdclear$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcd_home'
;------------------------------------------------------------
	G$lcd_home$0$0 ==.
	C$LCD_Driver.c$285$1_0$115 ==.
;	LCD_Driver.c:285: void lcd_home(void)
;	-----------------------------------------
;	 function lcd_home
;	-----------------------------------------
_lcd_home:
	C$LCD_Driver.c$287$1_0$115 ==.
;	LCD_Driver.c:287: lcd_cmd(0x02);  // Cursor home command
	mov	dpl,#0x02
	lcall	_lcd_cmd
	C$LCD_Driver.c$288$1_0$115 ==.
;	LCD_Driver.c:288: current_row = 0;
	mov	dptr,#_current_row
	clr	a
	movx	@dptr,a
	C$LCD_Driver.c$289$1_0$115 ==.
;	LCD_Driver.c:289: current_col = 0;
	mov	dptr,#_current_col
	movx	@dptr,a
	C$LCD_Driver.c$290$1_0$115 ==.
;	LCD_Driver.c:290: lcdbusywait(); // wait for it to complete
	lcall	_lcdbusywait
	C$LCD_Driver.c$291$1_0$115 ==.
;	LCD_Driver.c:291: }
	C$LCD_Driver.c$291$1_0$115 ==.
	XG$lcd_home$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcd_delay_ms'
;------------------------------------------------------------
;ms                        Allocated with name '_lcd_delay_ms_ms_65536_116'
;i                         Allocated with name '_lcd_delay_ms_i_65536_117'
;------------------------------------------------------------
	G$lcd_delay_ms$0$0 ==.
	C$LCD_Driver.c$294$1_0$117 ==.
;	LCD_Driver.c:294: void lcd_delay_ms(uint8_t ms)
;	-----------------------------------------
;	 function lcd_delay_ms
;	-----------------------------------------
_lcd_delay_ms:
	mov	a,dpl
	mov	dptr,#_lcd_delay_ms_ms_65536_116
	movx	@dptr,a
	C$LCD_Driver.c$297$1_0$117 ==.
;	LCD_Driver.c:297: while(ms--) {
	movx	a,@dptr
	mov	r7,a
00102$:
	mov	ar6,r7
	dec	r7
	mov	dptr,#_lcd_delay_ms_ms_65536_116
	mov	a,r7
	movx	@dptr,a
	mov	a,r6
	jz	00114$
	C$LCD_Driver.c$298$3_0$119 ==.
;	LCD_Driver.c:298: for(i = 0; i < 1000; i++);  // ~1ms at 11MHz
	mov	dptr,#_lcd_delay_ms_i_65536_117
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
00106$:
	mov	dptr,#_lcd_delay_ms_i_65536_117
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	clr	c
	mov	a,r5
	subb	a,#0xe8
	mov	a,r6
	subb	a,#0x03
	jnc	00102$
	mov	dptr,#_lcd_delay_ms_i_65536_117
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#_lcd_delay_ms_i_65536_117
	mov	a,#0x01
	add	a,r5
	movx	@dptr,a
	clr	a
	addc	a,r6
	inc	dptr
	movx	@dptr,a
	sjmp	00106$
00114$:
	mov	dptr,#_lcd_delay_ms_ms_65536_116
	mov	a,r7
	movx	@dptr,a
	C$LCD_Driver.c$300$1_0$117 ==.
;	LCD_Driver.c:300: }
	C$LCD_Driver.c$300$1_0$117 ==.
	XG$lcd_delay_ms$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcdinit'
;------------------------------------------------------------
	G$lcdinit$0$0 ==.
	C$LCD_Driver.c$302$1_0$121 ==.
;	LCD_Driver.c:302: void lcdinit(void)
;	-----------------------------------------
;	 function lcdinit
;	-----------------------------------------
_lcdinit:
	C$LCD_Driver.c$304$1_0$121 ==.
;	LCD_Driver.c:304: lcd_delay_ms(50);  // Wait >15ms after VDD reaches 4.5V
	mov	dpl,#0x32
	lcall	_lcd_delay_ms
	C$LCD_Driver.c$305$1_0$121 ==.
;	LCD_Driver.c:305: *lcd_cmd_ptr = 0x30; // UNLOCK
	mov	dptr,#_lcd_cmd_ptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	mov	a,#0x30
	movx	@dptr,a
	C$LCD_Driver.c$306$1_0$121 ==.
;	LCD_Driver.c:306: lcd_delay_ms(15);      // Wait >4.1ms
	mov	dpl,#0x0f
	lcall	_lcd_delay_ms
	C$LCD_Driver.c$307$1_0$121 ==.
;	LCD_Driver.c:307: *lcd_cmd_ptr = 0x30;  // UNLOCK
	mov	dptr,#_lcd_cmd_ptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	mov	a,#0x30
	movx	@dptr,a
	C$LCD_Driver.c$308$1_0$121 ==.
;	LCD_Driver.c:308: lcd_delay_ms(5);      // Wait >100μs
	mov	dpl,#0x05
	lcall	_lcd_delay_ms
	C$LCD_Driver.c$309$1_0$121 ==.
;	LCD_Driver.c:309: *lcd_cmd_ptr = 0x30;  // Unlock Third time for reliability
	mov	dptr,#_lcd_cmd_ptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	mov	a,#0x30
	movx	@dptr,a
	C$LCD_Driver.c$313$1_0$121 ==.
;	LCD_Driver.c:313: lcd_cmd(0x38);  // Function Set
	mov	dpl,#0x38
	lcall	_lcd_cmd
	C$LCD_Driver.c$314$1_0$121 ==.
;	LCD_Driver.c:314: lcd_cmd(0x08);  // Display OFF
	mov	dpl,#0x08
	lcall	_lcd_cmd
	C$LCD_Driver.c$315$1_0$121 ==.
;	LCD_Driver.c:315: lcd_cmd(0x0C);  // Display ON
	mov	dpl,#0x0c
	lcall	_lcd_cmd
	C$LCD_Driver.c$316$1_0$121 ==.
;	LCD_Driver.c:316: lcd_cmd(0x06);  // Entry Mode Set: Increment cursor, no shift
	mov	dpl,#0x06
	lcall	_lcd_cmd
	C$LCD_Driver.c$317$1_0$121 ==.
;	LCD_Driver.c:317: lcdclear();
	lcall	_lcdclear
	C$LCD_Driver.c$318$1_0$121 ==.
;	LCD_Driver.c:318: lcd_home();
	lcall	_lcd_home
	C$LCD_Driver.c$320$1_0$121 ==.
;	LCD_Driver.c:320: current_row = 0;
	mov	dptr,#_current_row
	clr	a
	movx	@dptr,a
	C$LCD_Driver.c$321$1_0$121 ==.
;	LCD_Driver.c:321: current_col = 0;
	mov	dptr,#_current_col
	movx	@dptr,a
	C$LCD_Driver.c$322$1_0$121 ==.
;	LCD_Driver.c:322: }
	C$LCD_Driver.c$322$1_0$121 ==.
	XG$lcdinit$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'get_number'
;------------------------------------------------------------
;max_digits                Allocated with name '_get_number_max_digits_65536_123'
;buffer                    Allocated with name '_get_number_buffer_65536_123'
;idx                       Allocated with name '_get_number_idx_65536_123'
;c                         Allocated with name '_get_number_c_65536_123'
;------------------------------------------------------------
	G$get_number$0$0 ==.
	C$LCD_Driver.c$325$1_0$123 ==.
;	LCD_Driver.c:325: uint16_t get_number(void){
;	-----------------------------------------
;	 function get_number
;	-----------------------------------------
_get_number:
	C$LCD_Driver.c$332$3_0$126 ==.
;	LCD_Driver.c:332: while(1) {
	mov	r7,#0x00
00110$:
	C$LCD_Driver.c$333$2_0$124 ==.
;	LCD_Driver.c:333: c = getchar();
	push	ar7
	lcall	_getchar
	mov	r5,dpl
	mov	r6,dph
	pop	ar7
	C$LCD_Driver.c$335$2_0$124 ==.
;	LCD_Driver.c:335: if (c == '\r' || c == '\n') {
	cjne	r5,#0x0d,00135$
	sjmp	00105$
00135$:
	cjne	r5,#0x0a,00106$
00105$:
	C$LCD_Driver.c$336$3_0$125 ==.
;	LCD_Driver.c:336: buffer[idx] = '\0';
	mov	a,r7
	add	a,#_get_number_buffer_65536_123
	mov	dpl,a
	clr	a
	addc	a,#(_get_number_buffer_65536_123 >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
	C$LCD_Driver.c$337$3_0$125 ==.
;	LCD_Driver.c:337: putstr("\n\r");
	mov	dptr,#___str_0
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$338$3_0$125 ==.
;	LCD_Driver.c:338: break; // only exit once they're done entering the number
	sjmp	00111$
00106$:
	C$LCD_Driver.c$340$2_0$124 ==.
;	LCD_Driver.c:340: else if (c >= '0' && c <= '9' && idx < max_digits) { // is a number and also space in buffer
	cjne	r5,#0x30,00138$
00138$:
	jc	00110$
	mov	a,r5
	add	a,#0xff - 0x39
	jc	00110$
	mov	ar4,r7
	mov	r6,#0x00
	clr	c
	mov	a,r4
	subb	a,#0x02
	mov	a,r6
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00110$
	C$LCD_Driver.c$341$3_0$126 ==.
;	LCD_Driver.c:341: buffer[idx++] = c; // adding the char and then moving the buffer up
	mov	a,r7
	add	a,#_get_number_buffer_65536_123
	mov	dpl,a
	clr	a
	addc	a,#(_get_number_buffer_65536_123 >> 8)
	mov	dph,a
	inc	r7
	mov	a,r5
	movx	@dptr,a
	C$LCD_Driver.c$342$3_0$126 ==.
;	LCD_Driver.c:342: putchar(c);  // Echo the character onto the terminal
	mov	r6,#0x00
	mov	dpl,r5
	mov	dph,r6
	push	ar7
	lcall	_putchar
	pop	ar7
	sjmp	00110$
00111$:
	C$LCD_Driver.c$346$1_0$123 ==.
;	LCD_Driver.c:346: return atoi(buffer);
	mov	dptr,#_get_number_buffer_65536_123
	mov	b,#0x00
	lcall	_atoi
	C$LCD_Driver.c$347$1_0$123 ==.
;	LCD_Driver.c:347: }
	C$LCD_Driver.c$347$1_0$123 ==.
	XG$get_number$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'get_user_input'
;------------------------------------------------------------
;max_len                   Allocated with name '_get_user_input_PARM_2'
;buffer                    Allocated with name '_get_user_input_buffer_65536_127'
;count                     Allocated with name '_get_user_input_count_65536_128'
;c                         Allocated with name '_get_user_input_c_65536_128'
;------------------------------------------------------------
	G$get_user_input$0$0 ==.
	C$LCD_Driver.c$350$1_0$128 ==.
;	LCD_Driver.c:350: uint8_t get_user_input(char *buffer, uint8_t max_len) {
;	-----------------------------------------
;	 function get_user_input
;	-----------------------------------------
_get_user_input:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_get_user_input_buffer_65536_127
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$351$2_0$128 ==.
;	LCD_Driver.c:351: uint8_t count = 0;
	mov	dptr,#_get_user_input_count_65536_128
	clr	a
	movx	@dptr,a
	C$LCD_Driver.c$354$1_0$128 ==.
;	LCD_Driver.c:354: while (count < (max_len - 1)) {
	mov	dptr,#_get_user_input_PARM_2
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_get_user_input_buffer_65536_127
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
00114$:
	push	ar4
	push	ar5
	push	ar6
	mov	ar2,r7
	mov	r3,#0x00
	dec	r2
	cjne	r2,#0xff,00151$
	dec	r3
00151$:
	mov	dptr,#_get_user_input_count_65536_128
	movx	a,@dptr
	mov	r1,a
	mov	r0,a
	mov	r6,#0x00
	clr	c
	mov	a,r0
	subb	a,r2
	mov	a,r6
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	pop	ar6
	pop	ar5
	pop	ar4
	jc	00152$
	ljmp	00116$
00152$:
	C$LCD_Driver.c$356$2_0$129 ==.
;	LCD_Driver.c:356: c = getchar();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar1
	lcall	_getchar
	mov	r2,dpl
	mov	r3,dph
	pop	ar1
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	C$LCD_Driver.c$358$2_0$129 ==.
;	LCD_Driver.c:358: if (c == '\r' || c == '\n') {
	cjne	r2,#0x0d,00153$
	ljmp	00116$
00153$:
	cjne	r2,#0x0a,00154$
	ljmp	00116$
00154$:
	C$LCD_Driver.c$360$2_0$129 ==.
;	LCD_Driver.c:360: } else if (c == '\b' || c == 0x7F) {  // Backspace or DEL
	cjne	r2,#0x08,00155$
	sjmp	00106$
00155$:
	cjne	r2,#0x7f,00107$
00106$:
	C$LCD_Driver.c$361$3_0$131 ==.
;	LCD_Driver.c:361: if (count > 0) {
	mov	dptr,#_get_user_input_count_65536_128
	movx	a,@dptr
	mov	r3,a
	movx	a,@dptr
	jz	00114$
	C$LCD_Driver.c$362$4_0$132 ==.
;	LCD_Driver.c:362: count--;
	mov	a,r3
	dec	a
	mov	dptr,#_get_user_input_count_65536_128
	movx	@dptr,a
	C$LCD_Driver.c$364$4_0$132 ==.
;	LCD_Driver.c:364: putchar('\b');
	mov	dptr,#0x0008
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_putchar
	C$LCD_Driver.c$365$4_0$132 ==.
;	LCD_Driver.c:365: putchar(' ');
	mov	dptr,#0x0020
	lcall	_putchar
	C$LCD_Driver.c$366$4_0$132 ==.
;	LCD_Driver.c:366: putchar('\b');
	mov	dptr,#0x0008
	lcall	_putchar
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	ljmp	00114$
00107$:
	C$LCD_Driver.c$368$2_0$129 ==.
;	LCD_Driver.c:368: } else if ((c >= ' ' && c <= 'z')) {  // Only valid characters
	cjne	r2,#0x20,00159$
00159$:
	jnc	00160$
	ljmp	00114$
00160$:
	mov	a,r2
	add	a,#0xff - 0x7a
	jnc	00161$
	ljmp	00114$
00161$:
	C$LCD_Driver.c$369$3_0$133 ==.
;	LCD_Driver.c:369: buffer[count++] = c;
	mov	dptr,#_get_user_input_count_65536_128
	mov	a,r1
	inc	a
	movx	@dptr,a
	mov	a,r1
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
	C$LCD_Driver.c$370$3_0$133 ==.
;	LCD_Driver.c:370: putchar(c);  // Echo the character
	mov	r3,#0x00
	mov	dpl,r2
	mov	dph,r3
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_putchar
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	ljmp	00114$
00116$:
	C$LCD_Driver.c$375$1_0$128 ==.
;	LCD_Driver.c:375: buffer[count] = '\0';  // Null terminate
	mov	dptr,#_get_user_input_buffer_65536_127
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_get_user_input_count_65536_128
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
	C$LCD_Driver.c$376$1_0$128 ==.
;	LCD_Driver.c:376: putstr("\n\r");
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar4
	lcall	_putstr
	pop	ar4
	C$LCD_Driver.c$377$1_0$128 ==.
;	LCD_Driver.c:377: return count;
	mov	dpl,r4
	C$LCD_Driver.c$378$1_0$128 ==.
;	LCD_Driver.c:378: }
	C$LCD_Driver.c$378$1_0$128 ==.
	XG$get_user_input$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'save_cursor_position'
;------------------------------------------------------------
	G$save_cursor_position$0$0 ==.
	C$LCD_Driver.c$382$1_0$135 ==.
;	LCD_Driver.c:382: void save_cursor_position(void)
;	-----------------------------------------
;	 function save_cursor_position
;	-----------------------------------------
_save_cursor_position:
	C$LCD_Driver.c$384$1_0$135 ==.
;	LCD_Driver.c:384: cursor_backup.saved_row = current_row;
	mov	dptr,#_current_row
	movx	a,@dptr
	mov	dptr,#_cursor_backup
	movx	@dptr,a
	C$LCD_Driver.c$385$1_0$135 ==.
;	LCD_Driver.c:385: cursor_backup.saved_col = current_col;
	mov	dptr,#_current_col
	movx	a,@dptr
	mov	dptr,#(_cursor_backup + 0x0001)
	movx	@dptr,a
	C$LCD_Driver.c$386$1_0$135 ==.
;	LCD_Driver.c:386: cursor_backup.valid = 1;
	mov	dptr,#(_cursor_backup + 0x0002)
	mov	a,#0x01
	movx	@dptr,a
	C$LCD_Driver.c$387$1_0$135 ==.
;	LCD_Driver.c:387: }
	C$LCD_Driver.c$387$1_0$135 ==.
	XG$save_cursor_position$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'restore_cursor_position'
;------------------------------------------------------------
	G$restore_cursor_position$0$0 ==.
	C$LCD_Driver.c$389$1_0$137 ==.
;	LCD_Driver.c:389: void restore_cursor_position(void)
;	-----------------------------------------
;	 function restore_cursor_position
;	-----------------------------------------
_restore_cursor_position:
	C$LCD_Driver.c$391$1_0$137 ==.
;	LCD_Driver.c:391: if(cursor_backup.valid) {
	mov	dptr,#(_cursor_backup + 0x0002)
	movx	a,@dptr
	jz	00103$
	C$LCD_Driver.c$392$2_0$138 ==.
;	LCD_Driver.c:392: lcdgotoxy(cursor_backup.saved_row, cursor_backup.saved_col);
	mov	dptr,#_cursor_backup
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#(_cursor_backup + 0x0001)
	movx	a,@dptr
	mov	dptr,#_lcdgotoxy_PARM_2
	movx	@dptr,a
	mov	dpl,r7
	lcall	_lcdgotoxy
	C$LCD_Driver.c$393$2_0$138 ==.
;	LCD_Driver.c:393: cursor_backup.valid = 0;
	mov	dptr,#(_cursor_backup + 0x0002)
	clr	a
	movx	@dptr,a
00103$:
	C$LCD_Driver.c$395$1_0$137 ==.
;	LCD_Driver.c:395: }
	C$LCD_Driver.c$395$1_0$137 ==.
	XG$restore_cursor_position$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'display_clock'
;------------------------------------------------------------
;time_str                  Allocated with name '_display_clock_time_str_65536_140'
;------------------------------------------------------------
	G$display_clock$0$0 ==.
	C$LCD_Driver.c$398$1_0$140 ==.
;	LCD_Driver.c:398: void display_clock(void)
;	-----------------------------------------
;	 function display_clock
;	-----------------------------------------
_display_clock:
	C$LCD_Driver.c$403$1_0$140 ==.
;	LCD_Driver.c:403: time_str[0] = ' '; // diff clock from rest of text
	mov	dptr,#_display_clock_time_str_65536_140
	mov	a,#0x20
	movx	@dptr,a
	C$LCD_Driver.c$404$1_0$140 ==.
;	LCD_Driver.c:404: time_str[1] = '0' + (system_clock.minutes / 10);
	mov	dptr,#(_system_clock + 0x0004)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#__divuint_PARM_2
	mov	a,#0x0a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl,r6
	mov	dph,r7
	lcall	__divuint
	mov	r6,dpl
	mov	a,#0x30
	add	a,r6
	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0001)
	movx	@dptr,a
	C$LCD_Driver.c$405$1_0$140 ==.
;	LCD_Driver.c:405: time_str[2] = '0' + (system_clock.minutes % 10);
	mov	dptr,#(_system_clock + 0x0004)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#__moduint_PARM_2
	mov	a,#0x0a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl,r6
	mov	dph,r7
	lcall	__moduint
	mov	r6,dpl
	mov	a,#0x30
	add	a,r6
	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0002)
	movx	@dptr,a
	C$LCD_Driver.c$406$1_0$140 ==.
;	LCD_Driver.c:406: time_str[3] = ':';
	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0003)
	mov	a,#0x3a
	movx	@dptr,a
	C$LCD_Driver.c$407$1_0$140 ==.
;	LCD_Driver.c:407: time_str[4] = '0' + (system_clock.seconds / 10);
	mov	dptr,#(_system_clock + 0x0002)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#__divuint_PARM_2
	mov	a,#0x0a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl,r6
	mov	dph,r7
	lcall	__divuint
	mov	r6,dpl
	mov	a,#0x30
	add	a,r6
	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0004)
	movx	@dptr,a
	C$LCD_Driver.c$408$1_0$140 ==.
;	LCD_Driver.c:408: time_str[5] = '0' + (system_clock.seconds % 10);
	mov	dptr,#(_system_clock + 0x0002)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#__moduint_PARM_2
	mov	a,#0x0a
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl,r6
	mov	dph,r7
	lcall	__moduint
	mov	r6,dpl
	mov	a,#0x30
	add	a,r6
	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0005)
	movx	@dptr,a
	C$LCD_Driver.c$409$1_0$140 ==.
;	LCD_Driver.c:409: time_str[6] = '.';
	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0006)
	mov	a,#0x2e
	movx	@dptr,a
	C$LCD_Driver.c$410$1_0$140 ==.
;	LCD_Driver.c:410: time_str[7] = '0' + system_clock.tenths;
	mov	dptr,#_system_clock
	movx	a,@dptr
	add	a,#0x30
	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0007)
	movx	@dptr,a
	C$LCD_Driver.c$411$1_0$140 ==.
;	LCD_Driver.c:411: time_str[8] = '\0';
	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0008)
	clr	a
	movx	@dptr,a
	C$LCD_Driver.c$414$1_0$140 ==.
;	LCD_Driver.c:414: save_cursor_position();
	lcall	_save_cursor_position
	C$LCD_Driver.c$417$1_0$140 ==.
;	LCD_Driver.c:417: lcdgotoxy(CLOCK_ROW, CLOCK_COL);
	mov	dptr,#_lcdgotoxy_PARM_2
	mov	a,#0x08
	movx	@dptr,a
	mov	dpl,#0x03
	lcall	_lcdgotoxy
	C$LCD_Driver.c$418$1_0$140 ==.
;	LCD_Driver.c:418: lcdputstr(time_str);
	mov	dptr,#_display_clock_time_str_65536_140
	mov	b,#0x00
	lcall	_lcdputstr
	C$LCD_Driver.c$421$1_0$140 ==.
;	LCD_Driver.c:421: restore_cursor_position();
	lcall	_restore_cursor_position
	C$LCD_Driver.c$422$1_0$140 ==.
;	LCD_Driver.c:422: }
	C$LCD_Driver.c$422$1_0$140 ==.
	XG$display_clock$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'clock_stop'
;------------------------------------------------------------
	G$clock_stop$0$0 ==.
	C$LCD_Driver.c$424$1_0$142 ==.
;	LCD_Driver.c:424: void clock_stop(void)
;	-----------------------------------------
;	 function clock_stop
;	-----------------------------------------
_clock_stop:
	C$LCD_Driver.c$426$1_0$142 ==.
;	LCD_Driver.c:426: system_clock.running = 0;
	mov	dptr,#(_system_clock + 0x0006)
	clr	a
	movx	@dptr,a
	C$LCD_Driver.c$427$1_0$142 ==.
;	LCD_Driver.c:427: }
	C$LCD_Driver.c$427$1_0$142 ==.
	XG$clock_stop$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'clock_start'
;------------------------------------------------------------
	G$clock_start$0$0 ==.
	C$LCD_Driver.c$429$1_0$144 ==.
;	LCD_Driver.c:429: void clock_start(void)
;	-----------------------------------------
;	 function clock_start
;	-----------------------------------------
_clock_start:
	C$LCD_Driver.c$431$1_0$144 ==.
;	LCD_Driver.c:431: system_clock.running = 1;
	mov	dptr,#(_system_clock + 0x0006)
	mov	a,#0x01
	movx	@dptr,a
	C$LCD_Driver.c$432$1_0$144 ==.
;	LCD_Driver.c:432: }
	C$LCD_Driver.c$432$1_0$144 ==.
	XG$clock_start$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'clock_reset'
;------------------------------------------------------------
	G$clock_reset$0$0 ==.
	C$LCD_Driver.c$434$1_0$146 ==.
;	LCD_Driver.c:434: void clock_reset(void)
;	-----------------------------------------
;	 function clock_reset
;	-----------------------------------------
_clock_reset:
	C$LCD_Driver.c$436$1_0$146 ==.
;	LCD_Driver.c:436: EA = 0;  // Disable interrupts during reset
;	assignBit
	clr	_EA
	C$LCD_Driver.c$437$1_0$146 ==.
;	LCD_Driver.c:437: system_clock.tenths = 0;
	mov	dptr,#_system_clock
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$438$1_0$146 ==.
;	LCD_Driver.c:438: system_clock.seconds = 0;
	mov	dptr,#(_system_clock + 0x0002)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$439$1_0$146 ==.
;	LCD_Driver.c:439: system_clock.minutes = 0;
	mov	dptr,#(_system_clock + 0x0004)
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$440$1_0$146 ==.
;	LCD_Driver.c:440: system_clock.update_flag = 1;  // Force display update
	mov	dptr,#(_system_clock + 0x0007)
	inc	a
	movx	@dptr,a
	C$LCD_Driver.c$441$1_0$146 ==.
;	LCD_Driver.c:441: EA = 1;  // Re-enable interrupts
;	assignBit
	setb	_EA
	C$LCD_Driver.c$442$1_0$146 ==.
;	LCD_Driver.c:442: }
	C$LCD_Driver.c$442$1_0$146 ==.
	XG$clock_reset$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer_init'
;------------------------------------------------------------
	G$timer_init$0$0 ==.
	C$LCD_Driver.c$461$1_0$148 ==.
;	LCD_Driver.c:461: void timer_init(void)
;	-----------------------------------------
;	 function timer_init
;	-----------------------------------------
_timer_init:
	C$LCD_Driver.c$463$1_0$148 ==.
;	LCD_Driver.c:463: ET0 = 1;
;	assignBit
	setb	_ET0
	C$LCD_Driver.c$464$1_0$148 ==.
;	LCD_Driver.c:464: EA = 1;
;	assignBit
	setb	_EA
	C$LCD_Driver.c$466$1_0$148 ==.
;	LCD_Driver.c:466: TMOD |= 0x01;
	orl	_TMOD,#0x01
	C$LCD_Driver.c$467$1_0$148 ==.
;	LCD_Driver.c:467: TH0 = 0x4B;
	mov	_TH0,#0x4b
	C$LCD_Driver.c$468$1_0$148 ==.
;	LCD_Driver.c:468: TL0 = 0xF5;
	mov	_TL0,#0xf5
	C$LCD_Driver.c$470$1_0$148 ==.
;	LCD_Driver.c:470: TR0 = 1;
;	assignBit
	setb	_TR0
	C$LCD_Driver.c$471$1_0$148 ==.
;	LCD_Driver.c:471: }
	C$LCD_Driver.c$471$1_0$148 ==.
	XG$timer_init$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_isr'
;------------------------------------------------------------
	G$timer0_isr$0$0 ==.
	C$LCD_Driver.c$474$1_0$150 ==.
;	LCD_Driver.c:474: void timer0_isr(void) __interrupt (TF0_VECTOR)
;	-----------------------------------------
;	 function timer0_isr
;	-----------------------------------------
_timer0_isr:
	push	acc
	push	dpl
	push	dph
	push	ar7
	push	ar6
	push	psw
	mov	psw,#0x00
	C$LCD_Driver.c$476$1_0$150 ==.
;	LCD_Driver.c:476: timer_do_something = !timer_do_something; // only want to actually execute half the time, every 100ms
	mov	dptr,#_timer_do_something
	movx	a,@dptr
	mov	r7,a
	cjne	a,#0x01,00133$
00133$:
	clr	a
	rlc	a
	movx	@dptr,a
	C$LCD_Driver.c$479$1_0$150 ==.
;	LCD_Driver.c:479: TH0 = 0x4B;
	mov	_TH0,#0x4b
	C$LCD_Driver.c$480$1_0$150 ==.
;	LCD_Driver.c:480: TL0 = 0xF5;
	mov	_TL0,#0xf5
	C$LCD_Driver.c$482$1_0$150 ==.
;	LCD_Driver.c:482: if (!timer_do_something){
	mov	dptr,#_timer_do_something
	movx	a,@dptr
	jnz	00102$
	C$LCD_Driver.c$483$2_0$151 ==.
;	LCD_Driver.c:483: return; // if not supposed to do something this time, don't
	ljmp	00111$
00102$:
	C$LCD_Driver.c$487$1_0$150 ==.
;	LCD_Driver.c:487: P1_3 = !P1_3;
	cpl	_P1_3
	C$LCD_Driver.c$490$1_0$150 ==.
;	LCD_Driver.c:490: if(system_clock.running) {
	mov	dptr,#(_system_clock + 0x0006)
	movx	a,@dptr
	jnz	00135$
	ljmp	00111$
00135$:
	C$LCD_Driver.c$491$2_0$152 ==.
;	LCD_Driver.c:491: system_clock.tenths++;
	mov	dptr,#_system_clock
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	inc	r6
	cjne	r6,#0x00,00136$
	inc	r7
00136$:
	mov	dptr,#_system_clock
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$493$2_0$152 ==.
;	LCD_Driver.c:493: if(system_clock.tenths >= 10) {
	mov	dptr,#_system_clock
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	clr	c
	mov	a,r6
	subb	a,#0x0a
	mov	a,r7
	subb	a,#0x00
	jc	00108$
	C$LCD_Driver.c$494$3_0$153 ==.
;	LCD_Driver.c:494: system_clock.tenths = 0;
	mov	dptr,#_system_clock
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$495$3_0$153 ==.
;	LCD_Driver.c:495: system_clock.seconds++;
	mov	dptr,#(_system_clock + 0x0002)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	inc	r6
	cjne	r6,#0x00,00138$
	inc	r7
00138$:
	mov	dptr,#(_system_clock + 0x0002)
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$497$3_0$153 ==.
;	LCD_Driver.c:497: if(system_clock.seconds >= 60) {
	mov	dptr,#(_system_clock + 0x0002)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	clr	c
	mov	a,r6
	subb	a,#0x3c
	mov	a,r7
	subb	a,#0x00
	jc	00108$
	C$LCD_Driver.c$498$4_0$154 ==.
;	LCD_Driver.c:498: system_clock.seconds = 0;
	mov	dptr,#(_system_clock + 0x0002)
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$499$4_0$154 ==.
;	LCD_Driver.c:499: system_clock.minutes++;
	mov	dptr,#(_system_clock + 0x0004)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	inc	r6
	cjne	r6,#0x00,00140$
	inc	r7
00140$:
	mov	dptr,#(_system_clock + 0x0004)
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$501$4_0$154 ==.
;	LCD_Driver.c:501: if(system_clock.minutes >= 100) {
	mov	dptr,#(_system_clock + 0x0004)
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	clr	c
	mov	a,r6
	subb	a,#0x64
	mov	a,r7
	subb	a,#0x00
	jc	00108$
	C$LCD_Driver.c$502$5_0$155 ==.
;	LCD_Driver.c:502: system_clock.minutes = 0;  // Wrap at 99:59.9
	mov	dptr,#(_system_clock + 0x0004)
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
00108$:
	C$LCD_Driver.c$508$2_0$152 ==.
;	LCD_Driver.c:508: system_clock.update_flag = 1;
	mov	dptr,#(_system_clock + 0x0007)
	mov	a,#0x01
	movx	@dptr,a
00111$:
	C$LCD_Driver.c$510$1_0$150 ==.
;	LCD_Driver.c:510: }
	pop	psw
	pop	ar6
	pop	ar7
	pop	dph
	pop	dpl
	pop	acc
	C$LCD_Driver.c$510$1_0$150 ==.
	XG$timer0_isr$0$0 ==.
	reti
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'get_binary_row'
;------------------------------------------------------------
;bits                      Allocated with name '_get_binary_row_bits_65536_157'
;count                     Allocated with name '_get_binary_row_count_65536_157'
;c                         Allocated with name '_get_binary_row_c_65536_157'
;result                    Allocated with name '_get_binary_row_result_65536_157'
;i                         Allocated with name '_get_binary_row_i_131072_163'
;------------------------------------------------------------
	G$get_binary_row$0$0 ==.
	C$LCD_Driver.c$513$1_0$157 ==.
;	LCD_Driver.c:513: unsigned char get_binary_row(void) {
;	-----------------------------------------
;	 function get_binary_row
;	-----------------------------------------
_get_binary_row:
	C$LCD_Driver.c$515$2_0$157 ==.
;	LCD_Driver.c:515: uint8_t count = 0;
	mov	dptr,#_get_binary_row_count_65536_157
	clr	a
	movx	@dptr,a
	C$LCD_Driver.c$517$2_0$157 ==.
;	LCD_Driver.c:517: unsigned char result = 0;
	mov	dptr,#_get_binary_row_result_65536_157
	movx	@dptr,a
	C$LCD_Driver.c$519$3_0$159 ==.
;	LCD_Driver.c:519: while (count < 5) {
00112$:
	mov	dptr,#_get_binary_row_count_65536_157
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x05,00160$
00160$:
	jc	00161$
	ljmp	00131$
00161$:
	C$LCD_Driver.c$520$2_0$158 ==.
;	LCD_Driver.c:520: c = getchar();
	push	ar7
	lcall	_getchar
	mov	r5,dpl
	mov	r6,dph
	pop	ar7
	C$LCD_Driver.c$522$2_0$158 ==.
;	LCD_Driver.c:522: if (c == '0') {
	cjne	r5,#0x30,00110$
	C$LCD_Driver.c$523$3_0$159 ==.
;	LCD_Driver.c:523: bits[count] = c;
	mov	a,r7
	add	a,#_get_binary_row_bits_65536_157
	mov	dpl,a
	clr	a
	addc	a,#(_get_binary_row_bits_65536_157 >> 8)
	mov	dph,a
	mov	a,r5
	movx	@dptr,a
	C$LCD_Driver.c$524$3_0$159 ==.
;	LCD_Driver.c:524: putchar(' '); // Show space for 0
	mov	dptr,#0x0020
	push	ar7
	lcall	_putchar
	pop	ar7
	C$LCD_Driver.c$525$3_0$159 ==.
;	LCD_Driver.c:525: count++;
	mov	dptr,#_get_binary_row_count_65536_157
	mov	a,r7
	inc	a
	movx	@dptr,a
	sjmp	00112$
00110$:
	C$LCD_Driver.c$527$2_0$158 ==.
;	LCD_Driver.c:527: else if (c == '1') {
	cjne	r5,#0x31,00107$
	C$LCD_Driver.c$528$3_0$160 ==.
;	LCD_Driver.c:528: bits[count] = c;
	mov	a,r7
	add	a,#_get_binary_row_bits_65536_157
	mov	dpl,a
	clr	a
	addc	a,#(_get_binary_row_bits_65536_157 >> 8)
	mov	dph,a
	mov	a,r5
	movx	@dptr,a
	C$LCD_Driver.c$529$3_0$160 ==.
;	LCD_Driver.c:529: putchar('#'); // Show # for 1. Most filled in char I could find
	mov	dptr,#0x0023
	push	ar7
	lcall	_putchar
	pop	ar7
	C$LCD_Driver.c$530$3_0$160 ==.
;	LCD_Driver.c:530: count++;
	mov	dptr,#_get_binary_row_count_65536_157
	mov	a,r7
	inc	a
	movx	@dptr,a
	sjmp	00112$
00107$:
	C$LCD_Driver.c$532$2_0$158 ==.
;	LCD_Driver.c:532: else if (c == '\b' || c == 0x7F) { // Backspace
	cjne	r5,#0x08,00166$
	sjmp	00103$
00166$:
	cjne	r5,#0x7f,00112$
00103$:
	C$LCD_Driver.c$533$3_0$161 ==.
;	LCD_Driver.c:533: if (count > 0) {
	mov	dptr,#_get_binary_row_count_65536_157
	movx	a,@dptr
	mov	r7,a
	movx	a,@dptr
	jnz	00169$
	ljmp	00112$
00169$:
	C$LCD_Driver.c$534$4_0$162 ==.
;	LCD_Driver.c:534: count--;
	mov	a,r7
	dec	a
	mov	dptr,#_get_binary_row_count_65536_157
	movx	@dptr,a
	C$LCD_Driver.c$536$4_0$162 ==.
;	LCD_Driver.c:536: putchar('\b');
	mov	dptr,#0x0008
	lcall	_putchar
	C$LCD_Driver.c$537$4_0$162 ==.
;	LCD_Driver.c:537: putchar(' ');
	mov	dptr,#0x0020
	lcall	_putchar
	C$LCD_Driver.c$538$4_0$162 ==.
;	LCD_Driver.c:538: putchar('\b');
	mov	dptr,#0x0008
	lcall	_putchar
	ljmp	00112$
	C$LCD_Driver.c$544$1_0$157 ==.
;	LCD_Driver.c:544: for (uint8_t i = 0; i < 5; i++) {
00131$:
	mov	r7,#0x00
00119$:
	cjne	r7,#0x05,00170$
00170$:
	jnc	00117$
	C$LCD_Driver.c$545$3_0$164 ==.
;	LCD_Driver.c:545: if (bits[i] == '1') {
	mov	a,r7
	add	a,#_get_binary_row_bits_65536_157
	mov	dpl,a
	clr	a
	addc	a,#(_get_binary_row_bits_65536_157 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r6,a
	cjne	r6,#0x31,00120$
	C$LCD_Driver.c$546$4_0$165 ==.
;	LCD_Driver.c:546: result |= (1 << (4 - i)); // MSB first (leftmost bit = bit 4)
	mov	ar6,r7
	mov	a,#0x04
	clr	c
	subb	a,r6
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	00176$
00174$:
	add	a,acc
00176$:
	djnz	b,00174$
	mov	r6,a
	mov	dptr,#_get_binary_row_result_65536_157
	movx	a,@dptr
	orl	a,r6
	movx	@dptr,a
00120$:
	C$LCD_Driver.c$544$2_0$163 ==.
;	LCD_Driver.c:544: for (uint8_t i = 0; i < 5; i++) {
	inc	r7
	sjmp	00119$
00117$:
	C$LCD_Driver.c$550$1_0$157 ==.
;	LCD_Driver.c:550: return result;
	mov	dptr,#_get_binary_row_result_65536_157
	movx	a,@dptr
	C$LCD_Driver.c$551$1_0$157 ==.
;	LCD_Driver.c:551: }
	C$LCD_Driver.c$551$1_0$157 ==.
	XG$get_binary_row$0$0 ==.
	mov	dpl,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcdcreatechar'
;------------------------------------------------------------
;row_vals                  Allocated with name '_lcdcreatechar_PARM_2'
;ccode                     Allocated with name '_lcdcreatechar_ccode_65536_166'
;i                         Allocated with name '_lcdcreatechar_i_65537_168'
;------------------------------------------------------------
	G$lcdcreatechar$0$0 ==.
	C$LCD_Driver.c$553$1_0$167 ==.
;	LCD_Driver.c:553: void lcdcreatechar(unsigned char ccode, unsigned char row_vals[]) {
;	-----------------------------------------
;	 function lcdcreatechar
;	-----------------------------------------
_lcdcreatechar:
	mov	a,dpl
	mov	dptr,#_lcdcreatechar_ccode_65536_166
	movx	@dptr,a
	C$LCD_Driver.c$555$1_0$167 ==.
;	LCD_Driver.c:555: save_cursor_position();
	lcall	_save_cursor_position
	C$LCD_Driver.c$558$3_1$170 ==.
;	LCD_Driver.c:558: for(i = 0; i < 8; i++) {
	mov	dptr,#_lcdcreatechar_ccode_65536_166
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_lcdcreatechar_PARM_2
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	r3,#0x00
00102$:
	C$LCD_Driver.c$559$3_1$170 ==.
;	LCD_Driver.c:559: lcd_cmd(0x40 | (ccode << 3) | i); // bits: 0 + 1 + ccode + row number
	mov	ar2,r7
	mov	a,r2
	swap	a
	rr	a
	anl	a,#0xf8
	mov	r2,a
	mov	a,#0x40
	orl	a,r2
	orl	a,r3
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_lcd_cmd
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	C$LCD_Driver.c$560$3_1$170 ==.
;	LCD_Driver.c:560: lcdputch(row_vals[i]); // Send row data
	mov	a,r3
	add	a,r4
	mov	r0,a
	clr	a
	addc	a,r5
	mov	r1,a
	mov	ar2,r6
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	lcall	__gptrget
	mov	dpl,a
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_lcdputch
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	C$LCD_Driver.c$558$2_1$169 ==.
;	LCD_Driver.c:558: for(i = 0; i < 8; i++) {
	inc	r3
	cjne	r3,#0x08,00115$
00115$:
	jc	00102$
	C$LCD_Driver.c$563$1_1$168 ==.
;	LCD_Driver.c:563: restore_cursor_position();
	lcall	_restore_cursor_position
	C$LCD_Driver.c$564$1_1$167 ==.
;	LCD_Driver.c:564: }
	C$LCD_Driver.c$564$1_1$167 ==.
	XG$lcdcreatechar$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'let_user_create_char'
;------------------------------------------------------------
;ccode                     Allocated with name '_let_user_create_char_ccode_65537_173'
;row_vals                  Allocated with name '_let_user_create_char_row_vals_65538_175'
;i                         Allocated with name '_let_user_create_char_i_131074_176'
;prompt                    Allocated with name '_let_user_create_char_prompt_196610_177'
;------------------------------------------------------------
	G$let_user_create_char$0$0 ==.
	C$LCD_Driver.c$566$1_1$172 ==.
;	LCD_Driver.c:566: void let_user_create_char(void) {
;	-----------------------------------------
;	 function let_user_create_char
;	-----------------------------------------
_let_user_create_char:
	C$LCD_Driver.c$568$1_0$172 ==.
;	LCD_Driver.c:568: putstr("Enter custom character code (0-7): ");
	mov	dptr,#___str_1
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$569$1_1$173 ==.
;	LCD_Driver.c:569: uint8_t ccode = (uint8_t)get_number();
	lcall	_get_number
	C$LCD_Driver.c$571$1_1$173 ==.
;	LCD_Driver.c:571: if (ccode > 7) {
	mov	a,dpl
	mov	r6,a
	add	a,#0xff - 0x07
	jnc	00102$
	C$LCD_Driver.c$572$2_1$174 ==.
;	LCD_Driver.c:572: putstr("Error: Custom character code must be between 0 and 7.\n\r");
	mov	dptr,#___str_2
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$573$2_1$174 ==.
;	LCD_Driver.c:573: return;
	ljmp	00107$
00102$:
	C$LCD_Driver.c$578$1_2$175 ==.
;	LCD_Driver.c:578: putstr("Enter 5 bits per row (0 or 1), press Enter after each row:\n\r");
	mov	dptr,#___str_3
	mov	b,#0x80
	push	ar6
	lcall	_putstr
	pop	ar6
	C$LCD_Driver.c$580$3_2$177 ==.
;	LCD_Driver.c:580: for (uint8_t i = 0; i < 8; i++) {
	mov	r7,#0x00
00105$:
	cjne	r7,#0x08,00123$
00123$:
	jnc	00103$
	C$LCD_Driver.c$582$3_2$177 ==.
;	LCD_Driver.c:582: sprintf(prompt, "Row %d: ", i);
	mov	ar4,r7
	mov	r5,#0x00
	push	ar7
	push	ar6
	push	ar4
	push	ar5
	mov	a,#___str_4
	push	acc
	mov	a,#(___str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_let_user_create_char_prompt_196610_177
	push	acc
	mov	a,#(_let_user_create_char_prompt_196610_177 >> 8)
	push	acc
	clr	a
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf8
	mov	sp,a
	C$LCD_Driver.c$583$3_2$177 ==.
;	LCD_Driver.c:583: putstr(prompt);
	mov	dptr,#_let_user_create_char_prompt_196610_177
	mov	b,#0x00
	lcall	_putstr
	pop	ar6
	pop	ar7
	C$LCD_Driver.c$585$3_2$177 ==.
;	LCD_Driver.c:585: row_vals[i] = get_binary_row(); // this also shows visual preview as you type
	mov	a,r7
	add	a,#_let_user_create_char_row_vals_65538_175
	mov	r4,a
	clr	a
	addc	a,#(_let_user_create_char_row_vals_65538_175 >> 8)
	mov	r5,a
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_get_binary_row
	mov	r3,dpl
	pop	ar4
	pop	ar5
	mov	dpl,r4
	mov	dph,r5
	mov	a,r3
	movx	@dptr,a
	C$LCD_Driver.c$586$3_2$177 ==.
;	LCD_Driver.c:586: putstr("\n\r");
	mov	dptr,#___str_0
	mov	b,#0x80
	lcall	_putstr
	pop	ar6
	pop	ar7
	C$LCD_Driver.c$580$2_2$176 ==.
;	LCD_Driver.c:580: for (uint8_t i = 0; i < 8; i++) {
	inc	r7
	sjmp	00105$
00103$:
	C$LCD_Driver.c$590$1_2$175 ==.
;	LCD_Driver.c:590: lcdcreatechar(ccode, row_vals);
	mov	dptr,#_lcdcreatechar_PARM_2
	mov	a,#_let_user_create_char_row_vals_65538_175
	movx	@dptr,a
	mov	a,#(_let_user_create_char_row_vals_65538_175 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl,r6
	lcall	_lcdcreatechar
	C$LCD_Driver.c$591$1_2$175 ==.
;	LCD_Driver.c:591: putstr("Custom character made :) \n\r");
	mov	dptr,#___str_5
	mov	b,#0x80
	lcall	_putstr
00107$:
	C$LCD_Driver.c$592$1_2$172 ==.
;	LCD_Driver.c:592: }
	C$LCD_Driver.c$592$1_2$172 ==.
	XG$let_user_create_char$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'hex_dump_ddram'
;------------------------------------------------------------
;row                       Allocated with name '_hex_dump_ddram_row_131072_180'
;header                    Allocated with name '_hex_dump_ddram_header_196609_182'
;col                       Allocated with name '_hex_dump_ddram_col_262145_183'
;data                      Allocated with name '_hex_dump_ddram_data_327682_185'
;buf                       Allocated with name '_hex_dump_ddram_buf_327682_185'
;------------------------------------------------------------
	G$hex_dump_ddram$0$0 ==.
	C$LCD_Driver.c$594$1_2$179 ==.
;	LCD_Driver.c:594: void hex_dump_ddram(void) {
;	-----------------------------------------
;	 function hex_dump_ddram
;	-----------------------------------------
_hex_dump_ddram:
	C$LCD_Driver.c$595$1_0$179 ==.
;	LCD_Driver.c:595: putstr("\n\rLCD DDRAM HEX DUMP\n\r");
	mov	dptr,#___str_6
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$596$1_0$179 ==.
;	LCD_Driver.c:596: putstr("[Row] [Address]: Data (16 bytes per row)\n\r");
	mov	dptr,#___str_7
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$597$1_0$179 ==.
;	LCD_Driver.c:597: putstr("------------------------------------------------\n\r");
	mov	dptr,#___str_8
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$599$1_0$179 ==.
;	LCD_Driver.c:599: save_cursor_position();
	lcall	_save_cursor_position
	C$LCD_Driver.c$601$3_0$181 ==.
;	LCD_Driver.c:601: for(uint8_t row = 0; row < MAX_ROWS; row++) {
	mov	r7,#0x00
00107$:
	cjne	r7,#0x04,00129$
00129$:
	jc	00130$
	ljmp	00102$
00130$:
	C$LCD_Driver.c$603$3_0$181 ==.
;	LCD_Driver.c:603: lcdgotoaddr(row_addresses[row]);
	mov	a,r7
	add	a,#_row_addresses
	mov	r5,a
	clr	a
	addc	a,#(_row_addresses >> 8)
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_lcdgotoaddr
	pop	ar5
	pop	ar6
	pop	ar7
	C$LCD_Driver.c$606$3_1$182 ==.
;	LCD_Driver.c:606: sprintf(header, "Row %d [0x%02X]:\n\r", row, row_addresses[row]);
	mov	dpl,r5
	mov	dph,r6
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	mov	r3,#0x00
	mov	ar1,r7
	mov	r2,#0x00
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar1
	push	ar2
	mov	a,#___str_9
	push	acc
	mov	a,#(___str_9 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_hex_dump_ddram_header_196609_182
	push	acc
	mov	a,#(_hex_dump_ddram_header_196609_182 >> 8)
	push	acc
	clr	a
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
	C$LCD_Driver.c$607$3_1$182 ==.
;	LCD_Driver.c:607: putstr(header);
	mov	dptr,#_hex_dump_ddram_header_196609_182
	mov	b,#0x00
	lcall	_putstr
	pop	ar5
	pop	ar6
	pop	ar7
	C$LCD_Driver.c$610$5_1$184 ==.
;	LCD_Driver.c:610: for(uint8_t col = 0; col < MAX_COLS; col++) {
	mov	r4,#0x00
00104$:
	cjne	r4,#0x10,00131$
00131$:
	jnc	00101$
	C$LCD_Driver.c$611$5_1$184 ==.
;	LCD_Driver.c:611: lcdgotoaddr(row_addresses[row] + col);
	mov	dpl,r5
	mov	dph,r6
	clr	a
	movc	a,@a+dptr
	add	a,r4
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_lcdgotoaddr
	C$LCD_Driver.c$612$5_1$184 ==.
;	LCD_Driver.c:612: lcdbusywait();
	lcall	_lcdbusywait
	C$LCD_Driver.c$613$5_2$185 ==.
;	LCD_Driver.c:613: uint8_t data = *lcd_read_ptr;
	mov	dptr,#_lcd_read_ptr
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	movx	a,@dptr
	mov	r2,a
	C$LCD_Driver.c$617$5_2$185 ==.
;	LCD_Driver.c:617: sprintf(buf, "0x%02X ", data);
	mov	r3,#0x00
	push	ar2
	push	ar3
	mov	a,#___str_10
	push	acc
	mov	a,#(___str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_hex_dump_ddram_buf_327682_185
	push	acc
	mov	a,#(_hex_dump_ddram_buf_327682_185 >> 8)
	push	acc
	clr	a
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf8
	mov	sp,a
	C$LCD_Driver.c$618$5_2$185 ==.
;	LCD_Driver.c:618: putstr(buf);
	mov	dptr,#_hex_dump_ddram_buf_327682_185
	mov	b,#0x00
	lcall	_putstr
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	C$LCD_Driver.c$610$4_1$183 ==.
;	LCD_Driver.c:610: for(uint8_t col = 0; col < MAX_COLS; col++) {
	inc	r4
	sjmp	00104$
00101$:
	C$LCD_Driver.c$620$3_1$182 ==.
;	LCD_Driver.c:620: putstr("\n\r\n\r");
	mov	dptr,#___str_11
	mov	b,#0x80
	push	ar7
	lcall	_putstr
	pop	ar7
	C$LCD_Driver.c$601$2_0$180 ==.
;	LCD_Driver.c:601: for(uint8_t row = 0; row < MAX_ROWS; row++) {
	inc	r7
	ljmp	00107$
00102$:
	C$LCD_Driver.c$623$1_0$179 ==.
;	LCD_Driver.c:623: restore_cursor_position();
	lcall	_restore_cursor_position
	C$LCD_Driver.c$624$1_0$179 ==.
;	LCD_Driver.c:624: }
	C$LCD_Driver.c$624$1_0$179 ==.
	XG$hex_dump_ddram$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'hex_dump_cgram'
;------------------------------------------------------------
;sloc0                     Allocated with name '_hex_dump_cgram_sloc0_1_0'
;sloc1                     Allocated with name '_hex_dump_cgram_sloc1_1_0'
;char_code                 Allocated with name '_hex_dump_cgram_char_code_131072_188'
;row                       Allocated with name '_hex_dump_cgram_row_262144_190'
;cgram_addr                Allocated with name '_hex_dump_cgram_cgram_addr_327680_191'
;pattern                   Allocated with name '_hex_dump_cgram_pattern_327681_192'
;buf                       Allocated with name '_hex_dump_cgram_buf_327681_192'
;bit                       Allocated with name '_hex_dump_cgram_bit_393217_193'
;------------------------------------------------------------
	G$hex_dump_cgram$0$0 ==.
	C$LCD_Driver.c$626$1_0$187 ==.
;	LCD_Driver.c:626: void hex_dump_cgram(void) {
;	-----------------------------------------
;	 function hex_dump_cgram
;	-----------------------------------------
_hex_dump_cgram:
	C$LCD_Driver.c$627$1_0$187 ==.
;	LCD_Driver.c:627: putstr("LCD CGRAM HEX DUMP\n\r");
	mov	dptr,#___str_12
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$628$1_0$187 ==.
;	LCD_Driver.c:628: putstr("[Char] [Row]: Data (8 characters x 8 rows each)\n\r");
	mov	dptr,#___str_13
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$629$1_0$187 ==.
;	LCD_Driver.c:629: putstr("--------------------------------------------------\n\r");
	mov	dptr,#___str_14
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$631$1_0$187 ==.
;	LCD_Driver.c:631: save_cursor_position();
	lcall	_save_cursor_position
	C$LCD_Driver.c$634$3_0$189 ==.
;	LCD_Driver.c:634: for(uint8_t char_code = 0; char_code < 8; char_code++) {
	mov	r7,#0x00
00114$:
	cjne	r7,#0x08,00149$
00149$:
	jc	00150$
	ljmp	00106$
00150$:
	C$LCD_Driver.c$635$3_0$189 ==.
;	LCD_Driver.c:635: putstr("Character ");
	mov	dptr,#___str_15
	mov	b,#0x80
	push	ar7
	lcall	_putstr
	pop	ar7
	C$LCD_Driver.c$636$3_0$189 ==.
;	LCD_Driver.c:636: putchar('0' + char_code);
	mov	ar5,r7
	mov	r6,#0x00
	mov	a,#0x30
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	push	ar7
	lcall	_putchar
	C$LCD_Driver.c$637$3_0$189 ==.
;	LCD_Driver.c:637: putstr(":\n\r");
	mov	dptr,#___str_16
	mov	b,#0x80
	lcall	_putstr
	pop	ar7
	C$LCD_Driver.c$639$5_0$191 ==.
;	LCD_Driver.c:639: for(uint8_t row = 0; row < 8; row++) {
	mov	ar6,r7
	mov	r5,#0x00
00111$:
	cjne	r5,#0x08,00151$
00151$:
	jc	00152$
	ljmp	00105$
00152$:
	C$LCD_Driver.c$641$1_0$187 ==.
;	LCD_Driver.c:641: uint8_t cgram_addr = 0x40 | (char_code << 3) | row;
	push	ar7
	mov	ar4,r6
	mov	a,r4
	swap	a
	rr	a
	anl	a,#0xf8
	mov	r4,a
	mov	a,#0x40
	orl	a,r4
	orl	a,r5
	C$LCD_Driver.c$642$5_0$191 ==.
;	LCD_Driver.c:642: lcd_cmd(cgram_addr);
	mov	r4,a
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_lcd_cmd
	C$LCD_Driver.c$643$5_0$191 ==.
;	LCD_Driver.c:643: lcdbusywait();
	lcall	_lcdbusywait
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	C$LCD_Driver.c$644$5_1$192 ==.
;	LCD_Driver.c:644: uint8_t pattern = *lcd_read_ptr;
	mov	dptr,#_lcd_read_ptr
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#_hex_dump_cgram_pattern_327681_192
	movx	@dptr,a
	C$LCD_Driver.c$648$5_1$192 ==.
;	LCD_Driver.c:648: sprintf(buf, "  Row %d [0x%02X]: 0x%02X = ", row, cgram_addr, pattern);
	mov	r3,#0x00
	mov	ar1,r4
	mov	r4,#0x00
	mov	ar0,r5
	mov	r7,#0x00
	push	ar7
	push	ar6
	push	ar5
	push	ar2
	push	ar3
	push	ar1
	push	ar4
	push	ar0
	push	ar7
	mov	a,#___str_17
	push	acc
	mov	a,#(___str_17 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_hex_dump_cgram_buf_327681_192
	push	acc
	mov	a,#(_hex_dump_cgram_buf_327681_192 >> 8)
	push	acc
	clr	a
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
	C$LCD_Driver.c$649$5_1$192 ==.
;	LCD_Driver.c:649: putstr(buf);
	mov	dptr,#_hex_dump_cgram_buf_327681_192
	mov	b,#0x00
	lcall	_putstr
	pop	ar5
	pop	ar6
	pop	ar7
	C$LCD_Driver.c$652$7_1$194 ==.
;	LCD_Driver.c:652: for(int8_t bit = 4; bit >= 0; bit--) {
	mov	dptr,#_hex_dump_cgram_pattern_327681_192
	movx	a,@dptr
	mov	_hex_dump_cgram_sloc0_1_0,a
	mov	_hex_dump_cgram_sloc1_1_0,#0x04
	C$LCD_Driver.c$665$1_0$187 ==.
;	LCD_Driver.c:665: restore_cursor_position();
	pop	ar7
	C$LCD_Driver.c$652$6_1$193 ==.
;	LCD_Driver.c:652: for(int8_t bit = 4; bit >= 0; bit--) {
00108$:
	mov	a,_hex_dump_cgram_sloc1_1_0
	jb	acc.7,00104$
	C$LCD_Driver.c$653$7_1$194 ==.
;	LCD_Driver.c:653: if(pattern & (1 << bit)) {
	mov	r4,_hex_dump_cgram_sloc1_1_0
	mov	b,r4
	inc	b
	mov	r4,#0x01
	mov	r3,#0x00
	sjmp	00155$
00154$:
	mov	a,r4
	add	a,r4
	mov	r4,a
	mov	a,r3
	rlc	a
	mov	r3,a
00155$:
	djnz	b,00154$
	mov	r1,_hex_dump_cgram_sloc0_1_0
	mov	r2,#0x00
	mov	a,r1
	anl	ar4,a
	mov	a,r2
	anl	ar3,a
	mov	a,r4
	orl	a,r3
	jz	00102$
	C$LCD_Driver.c$654$8_1$195 ==.
;	LCD_Driver.c:654: putchar('#');
	mov	dptr,#0x0023
	push	ar7
	push	ar6
	push	ar5
	lcall	_putchar
	pop	ar5
	pop	ar6
	pop	ar7
	sjmp	00109$
00102$:
	C$LCD_Driver.c$656$8_1$196 ==.
;	LCD_Driver.c:656: putchar(' ');
	mov	dptr,#0x0020
	push	ar7
	push	ar6
	push	ar5
	lcall	_putchar
	pop	ar5
	pop	ar6
	pop	ar7
00109$:
	C$LCD_Driver.c$652$6_1$193 ==.
;	LCD_Driver.c:652: for(int8_t bit = 4; bit >= 0; bit--) {
	dec	_hex_dump_cgram_sloc1_1_0
	sjmp	00108$
00104$:
	C$LCD_Driver.c$659$5_1$192 ==.
;	LCD_Driver.c:659: putstr("\n\r");
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	push	ar6
	push	ar5
	lcall	_putstr
	pop	ar5
	pop	ar6
	pop	ar7
	C$LCD_Driver.c$639$4_0$190 ==.
;	LCD_Driver.c:639: for(uint8_t row = 0; row < 8; row++) {
	inc	r5
	ljmp	00111$
00105$:
	C$LCD_Driver.c$661$3_0$189 ==.
;	LCD_Driver.c:661: putstr("\n\r");
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_putstr
	pop	ar7
	C$LCD_Driver.c$634$2_0$188 ==.
;	LCD_Driver.c:634: for(uint8_t char_code = 0; char_code < 8; char_code++) {
	inc	r7
	ljmp	00114$
00106$:
	C$LCD_Driver.c$665$1_0$187 ==.
;	LCD_Driver.c:665: restore_cursor_position();
	lcall	_restore_cursor_position
	C$LCD_Driver.c$666$1_0$187 ==.
;	LCD_Driver.c:666: }
	C$LCD_Driver.c$666$1_0$187 ==.
	XG$hex_dump_cgram$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'hex_dump_complete'
;------------------------------------------------------------
	G$hex_dump_complete$0$0 ==.
	C$LCD_Driver.c$668$1_0$198 ==.
;	LCD_Driver.c:668: void hex_dump_complete(void) {
;	-----------------------------------------
;	 function hex_dump_complete
;	-----------------------------------------
_hex_dump_complete:
	C$LCD_Driver.c$669$1_0$198 ==.
;	LCD_Driver.c:669: putstr("\n\r");
	mov	dptr,#___str_0
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$672$1_0$198 ==.
;	LCD_Driver.c:672: hex_dump_ddram();
	lcall	_hex_dump_ddram
	C$LCD_Driver.c$673$1_0$198 ==.
;	LCD_Driver.c:673: putstr("\n\r");
	mov	dptr,#___str_0
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$675$1_0$198 ==.
;	LCD_Driver.c:675: hex_dump_cgram();
	lcall	_hex_dump_cgram
	C$LCD_Driver.c$676$1_0$198 ==.
;	LCD_Driver.c:676: }
	C$LCD_Driver.c$676$1_0$198 ==.
	XG$hex_dump_complete$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'menu_print'
;------------------------------------------------------------
	G$menu_print$0$0 ==.
	C$LCD_Driver.c$678$1_0$200 ==.
;	LCD_Driver.c:678: void menu_print(void){
;	-----------------------------------------
;	 function menu_print
;	-----------------------------------------
_menu_print:
	C$LCD_Driver.c$680$1_0$200 ==.
;	LCD_Driver.c:680: putstr("\n\r");
	mov	dptr,#___str_0
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$681$1_0$200 ==.
;	LCD_Driver.c:681: putstr("Here is everything you can do:\n\r");
	mov	dptr,#___str_18
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$682$1_0$200 ==.
;	LCD_Driver.c:682: putstr("--------------------------------------\n\r");
	mov	dptr,#___str_19
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$683$1_0$200 ==.
;	LCD_Driver.c:683: putstr("0. Put a character at wherever the cursor is \n\r");
	mov	dptr,#___str_20
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$684$1_0$200 ==.
;	LCD_Driver.c:684: putstr("a. Put a character somewhere \n\r");
	mov	dptr,#___str_21
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$685$1_0$200 ==.
;	LCD_Driver.c:685: putstr("b. Put a string somewhere (letter wrap) \n\r");
	mov	dptr,#___str_22
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$686$1_0$200 ==.
;	LCD_Driver.c:686: putstr("c. Put a string somewhere (word wrap) \n\r");
	mov	dptr,#___str_23
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$687$1_0$200 ==.
;	LCD_Driver.c:687: putstr("d. Clear screen \n\r");
	mov	dptr,#___str_24
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$688$1_0$200 ==.
;	LCD_Driver.c:688: putstr("e. Re-init screen \n\r");
	mov	dptr,#___str_25
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$689$1_0$200 ==.
;	LCD_Driver.c:689: putstr("--------------------------------------\n\r");
	mov	dptr,#___str_19
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$690$1_0$200 ==.
;	LCD_Driver.c:690: putstr("f. Create Custom Character \n\r");
	mov	dptr,#___str_26
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$691$1_0$200 ==.
;	LCD_Driver.c:691: putstr("g. Put Custom Character somewhere \n\r");
	mov	dptr,#___str_27
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$692$1_0$200 ==.
;	LCD_Driver.c:692: putstr("h. Help Menu \n\r");
	mov	dptr,#___str_28
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$693$1_0$200 ==.
;	LCD_Driver.c:693: putstr("i. Hex Dump \n\r");
	mov	dptr,#___str_29
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$694$1_0$200 ==.
;	LCD_Driver.c:694: putstr("--------------------------------------\n\r");
	mov	dptr,#___str_19
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$695$1_0$200 ==.
;	LCD_Driver.c:695: putstr("Clock Menu: \n\r");
	mov	dptr,#___str_30
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$696$1_0$200 ==.
;	LCD_Driver.c:696: putstr("s. Start Clock\n\r");
	mov	dptr,#___str_31
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$697$1_0$200 ==.
;	LCD_Driver.c:697: putstr("t. Stop Clock\n\r");
	mov	dptr,#___str_32
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$698$1_0$200 ==.
;	LCD_Driver.c:698: putstr("r. Reset Clock\n\r");
	mov	dptr,#___str_33
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$699$1_0$200 ==.
;	LCD_Driver.c:699: putstr("--------------------------------------\n\r");
	mov	dptr,#___str_19
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$700$1_0$200 ==.
;	LCD_Driver.c:700: }
	C$LCD_Driver.c$700$1_0$200 ==.
	XG$menu_print$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;choice                    Allocated with name '_main_choice_65537_203'
;input_buffer              Allocated with name '_main_input_buffer_65537_203'
;char_buffer               Allocated with name '_main_char_buffer_65537_203'
;row                       Allocated with name '_main_row_65537_203'
;col                       Allocated with name '_main_col_65537_203'
;------------------------------------------------------------
	G$main$0$0 ==.
	C$LCD_Driver.c$702$1_0$202 ==.
;	LCD_Driver.c:702: int main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	C$LCD_Driver.c$704$1_0$202 ==.
;	LCD_Driver.c:704: lcdinit();
	lcall	_lcdinit
	C$LCD_Driver.c$705$1_0$202 ==.
;	LCD_Driver.c:705: putstr("LCD Initialized \n\r");
	mov	dptr,#___str_34
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$706$1_0$202 ==.
;	LCD_Driver.c:706: timer_init();
	lcall	_timer_init
	C$LCD_Driver.c$707$1_0$202 ==.
;	LCD_Driver.c:707: putstr("Timer Initialized \n\r");
	mov	dptr,#___str_35
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$708$1_0$202 ==.
;	LCD_Driver.c:708: P1_3 = 0; // Initialize test pin
;	assignBit
	clr	_P1_3
	C$LCD_Driver.c$709$1_0$202 ==.
;	LCD_Driver.c:709: display_clock(); // Initial clock display
	lcall	_display_clock
	C$LCD_Driver.c$710$1_0$202 ==.
;	LCD_Driver.c:710: putstr("Clock Display Started \n\r");
	mov	dptr,#___str_36
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$713$1_0$202 ==.
;	LCD_Driver.c:713: lcd_putchar_at(1, 1, 'H');     // Row 0, Col 5: 'H'
	mov	dptr,#_lcd_putchar_at_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_lcd_putchar_at_PARM_3
	mov	a,#0x48
	movx	@dptr,a
	mov	dpl,#0x01
	lcall	_lcd_putchar_at
	C$LCD_Driver.c$714$1_0$202 ==.
;	LCD_Driver.c:714: lcd_putchar_at(1, 2, 'i');     // Row 0, Col 6: 'i'
	mov	dptr,#_lcd_putchar_at_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dptr,#_lcd_putchar_at_PARM_3
	mov	a,#0x69
	movx	@dptr,a
	mov	dpl,#0x01
	lcall	_lcd_putchar_at
	C$LCD_Driver.c$718$1_0$202 ==.
;	LCD_Driver.c:718: lcdcreatechar(0, custom_char_checker);
	mov	dptr,#_lcdcreatechar_PARM_2
	mov	a,#_custom_char_checker
	movx	@dptr,a
	mov	a,#(_custom_char_checker >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl,#0x00
	lcall	_lcdcreatechar
	C$LCD_Driver.c$719$1_0$202 ==.
;	LCD_Driver.c:719: lcdcreatechar(1, custom_char_heart);
	mov	dptr,#_lcdcreatechar_PARM_2
	mov	a,#_custom_char_heart
	movx	@dptr,a
	mov	a,#(_custom_char_heart >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl,#0x01
	lcall	_lcdcreatechar
	C$LCD_Driver.c$720$1_0$202 ==.
;	LCD_Driver.c:720: lcdcreatechar(2, custom_char_face);
	mov	dptr,#_lcdcreatechar_PARM_2
	mov	a,#_custom_char_face
	movx	@dptr,a
	mov	a,#(_custom_char_face >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl,#0x02
	lcall	_lcdcreatechar
	C$LCD_Driver.c$721$1_0$202 ==.
;	LCD_Driver.c:721: lcdcreatechar(3, custom_char_alpaca);
	mov	dptr,#_lcdcreatechar_PARM_2
	mov	a,#_custom_char_alpaca
	movx	@dptr,a
	mov	a,#(_custom_char_alpaca >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl,#0x03
	lcall	_lcdcreatechar
	C$LCD_Driver.c$722$1_0$202 ==.
;	LCD_Driver.c:722: lcdcreatechar(4, custom_char_giraffe);
	mov	dptr,#_lcdcreatechar_PARM_2
	mov	a,#_custom_char_giraffe
	movx	@dptr,a
	mov	a,#(_custom_char_giraffe >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl,#0x04
	lcall	_lcdcreatechar
	C$LCD_Driver.c$724$1_0$202 ==.
;	LCD_Driver.c:724: lcd_putchar_at(1, 13, 1);
	mov	dptr,#_lcd_putchar_at_PARM_2
	mov	a,#0x0d
	movx	@dptr,a
	mov	dptr,#_lcd_putchar_at_PARM_3
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x01
	lcall	_lcd_putchar_at
	C$LCD_Driver.c$725$1_0$202 ==.
;	LCD_Driver.c:725: lcd_putchar_at(1, 4, 2);
	mov	dptr,#_lcd_putchar_at_PARM_2
	mov	a,#0x04
	movx	@dptr,a
	mov	dptr,#_lcd_putchar_at_PARM_3
	rr	a
	movx	@dptr,a
	mov	dpl,#0x01
	lcall	_lcd_putchar_at
	C$LCD_Driver.c$727$1_0$202 ==.
;	LCD_Driver.c:727: lcd_putchar_at(1, 7, 3);
	mov	dptr,#_lcd_putchar_at_PARM_2
	mov	a,#0x07
	movx	@dptr,a
	mov	dptr,#_lcd_putchar_at_PARM_3
	mov	a,#0x03
	movx	@dptr,a
	mov	dpl,#0x01
	lcall	_lcd_putchar_at
	C$LCD_Driver.c$728$1_0$202 ==.
;	LCD_Driver.c:728: lcd_putchar_at(1, 8, 3);
	mov	dptr,#_lcd_putchar_at_PARM_2
	mov	a,#0x08
	movx	@dptr,a
	mov	dptr,#_lcd_putchar_at_PARM_3
	mov	a,#0x03
	movx	@dptr,a
	mov	dpl,#0x01
	lcall	_lcd_putchar_at
	C$LCD_Driver.c$729$1_0$202 ==.
;	LCD_Driver.c:729: lcd_putchar_at(1, 9, 4);
	mov	dptr,#_lcd_putchar_at_PARM_2
	mov	a,#0x09
	movx	@dptr,a
	mov	dptr,#_lcd_putchar_at_PARM_3
	mov	a,#0x04
	movx	@dptr,a
	mov	dpl,#0x01
	lcall	_lcd_putchar_at
	C$LCD_Driver.c$730$1_0$202 ==.
;	LCD_Driver.c:730: lcd_putchar_at(1, 10, 3);
	mov	dptr,#_lcd_putchar_at_PARM_2
	mov	a,#0x0a
	movx	@dptr,a
	mov	dptr,#_lcd_putchar_at_PARM_3
	mov	a,#0x03
	movx	@dptr,a
	mov	dpl,#0x01
	lcall	_lcd_putchar_at
	C$LCD_Driver.c$731$1_0$202 ==.
;	LCD_Driver.c:731: lcd_putchar_at(1, 11, 4);
	mov	dptr,#_lcd_putchar_at_PARM_2
	mov	a,#0x0b
	movx	@dptr,a
	mov	dptr,#_lcd_putchar_at_PARM_3
	mov	a,#0x04
	movx	@dptr,a
	mov	dpl,#0x01
	lcall	_lcd_putchar_at
	C$LCD_Driver.c$736$1_0$202 ==.
;	LCD_Driver.c:736: menu_print();
	lcall	_menu_print
	C$LCD_Driver.c$748$2_1$204 ==.
;	LCD_Driver.c:748: while (!RI){
00103$:
	jb	_RI,00105$
	C$LCD_Driver.c$750$3_1$205 ==.
;	LCD_Driver.c:750: if(system_clock.update_flag) {
	mov	dptr,#(_system_clock + 0x0007)
	movx	a,@dptr
	jz	00103$
	C$LCD_Driver.c$751$4_1$206 ==.
;	LCD_Driver.c:751: system_clock.update_flag = 0;
	mov	dptr,#(_system_clock + 0x0007)
	clr	a
	movx	@dptr,a
	C$LCD_Driver.c$752$4_1$206 ==.
;	LCD_Driver.c:752: display_clock();
	lcall	_display_clock
	sjmp	00103$
00105$:
	C$LCD_Driver.c$755$2_1$204 ==.
;	LCD_Driver.c:755: choice = getchar();
	lcall	_getchar
	mov	r6,dpl
	C$LCD_Driver.c$756$2_1$204 ==.
;	LCD_Driver.c:756: printf("%c\n\r", choice);
	mov	ar5,r6
	mov	r7,#0x00
	push	ar6
	push	ar5
	push	ar7
	mov	a,#___str_37
	push	acc
	mov	a,#(___str_37 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar6
	C$LCD_Driver.c$758$2_1$204 ==.
;	LCD_Driver.c:758: switch(choice) {
	cjne	r6,#0x30,00199$
	sjmp	00106$
00199$:
	cjne	r6,#0x61,00200$
	sjmp	00107$
00200$:
	cjne	r6,#0x62,00201$
	ljmp	00108$
00201$:
	cjne	r6,#0x63,00202$
	ljmp	00109$
00202$:
	cjne	r6,#0x64,00203$
	ljmp	00110$
00203$:
	cjne	r6,#0x65,00204$
	ljmp	00111$
00204$:
	cjne	r6,#0x66,00205$
	ljmp	00112$
00205$:
	cjne	r6,#0x67,00206$
	ljmp	00113$
00206$:
	cjne	r6,#0x68,00207$
	ljmp	00117$
00207$:
	cjne	r6,#0x69,00208$
	ljmp	00118$
00208$:
	cjne	r6,#0x72,00209$
	ljmp	00121$
00209$:
	cjne	r6,#0x73,00210$
	ljmp	00119$
00210$:
	cjne	r6,#0x74,00211$
	ljmp	00120$
00211$:
	ljmp	00122$
	C$LCD_Driver.c$759$3_1$207 ==.
;	LCD_Driver.c:759: case '0':
00106$:
	C$LCD_Driver.c$760$3_1$207 ==.
;	LCD_Driver.c:760: putstr("Enter the character: ");
	mov	dptr,#___str_38
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$761$3_1$207 ==.
;	LCD_Driver.c:761: get_user_input(char_buffer, 2);
	mov	dptr,#_get_user_input_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dptr,#_main_char_buffer_65537_203
	mov	b,#0x00
	lcall	_get_user_input
	C$LCD_Driver.c$763$3_1$207 ==.
;	LCD_Driver.c:763: lcdputch(*char_buffer);
	mov	dptr,#_main_char_buffer_65537_203
	movx	a,@dptr
	mov	dpl,a
	lcall	_lcdputch
	C$LCD_Driver.c$764$3_1$207 ==.
;	LCD_Driver.c:764: break;
	ljmp	00123$
	C$LCD_Driver.c$766$3_1$207 ==.
;	LCD_Driver.c:766: case 'a':
00107$:
	C$LCD_Driver.c$767$3_1$207 ==.
;	LCD_Driver.c:767: putstr("Enter the character: ");
	mov	dptr,#___str_38
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$768$3_1$207 ==.
;	LCD_Driver.c:768: get_user_input(char_buffer, 2);
	mov	dptr,#_get_user_input_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dptr,#_main_char_buffer_65537_203
	mov	b,#0x00
	lcall	_get_user_input
	C$LCD_Driver.c$769$3_1$207 ==.
;	LCD_Driver.c:769: putstr("What row?:");
	mov	dptr,#___str_39
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$770$3_1$207 ==.
;	LCD_Driver.c:770: row = get_number();
	lcall	_get_number
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_main_row_65537_203
	movx	@dptr,a
	mov	a,b
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$771$3_1$207 ==.
;	LCD_Driver.c:771: putstr("And what col?:");
	mov	dptr,#___str_40
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$772$3_1$207 ==.
;	LCD_Driver.c:772: col = get_number();
	lcall	_get_number
	mov	r6,dpl
	mov	r7,dph
	mov	dptr,#_main_col_65537_203
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$774$3_1$207 ==.
;	LCD_Driver.c:774: lcd_putchar_at(row, col, *char_buffer);
	mov	dptr,#_main_row_65537_203
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	dptr,#_main_char_buffer_65537_203
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_lcd_putchar_at_PARM_2
	mov	a,r6
	movx	@dptr,a
	mov	dptr,#_lcd_putchar_at_PARM_3
	mov	a,r7
	movx	@dptr,a
	mov	dpl,r4
	lcall	_lcd_putchar_at
	C$LCD_Driver.c$775$3_1$207 ==.
;	LCD_Driver.c:775: break;
	ljmp	00123$
	C$LCD_Driver.c$777$3_1$207 ==.
;	LCD_Driver.c:777: case 'b':
00108$:
	C$LCD_Driver.c$778$3_1$207 ==.
;	LCD_Driver.c:778: putstr("Enter the string: ");
	mov	dptr,#___str_41
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$779$3_1$207 ==.
;	LCD_Driver.c:779: get_user_input(input_buffer, 65);
	mov	dptr,#_get_user_input_PARM_2
	mov	a,#0x41
	movx	@dptr,a
	mov	dptr,#_main_input_buffer_65537_203
	mov	b,#0x00
	lcall	_get_user_input
	C$LCD_Driver.c$780$3_1$207 ==.
;	LCD_Driver.c:780: putstr("What row?:");
	mov	dptr,#___str_39
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$781$3_1$207 ==.
;	LCD_Driver.c:781: row = get_number();
	lcall	_get_number
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_main_row_65537_203
	movx	@dptr,a
	mov	a,b
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$782$3_1$207 ==.
;	LCD_Driver.c:782: putstr("And what col?:");
	mov	dptr,#___str_40
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$783$3_1$207 ==.
;	LCD_Driver.c:783: col = get_number();
	lcall	_get_number
	mov	r6,dpl
	mov	r7,dph
	mov	dptr,#_main_col_65537_203
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$785$3_1$207 ==.
;	LCD_Driver.c:785: lcd_string_at(row, col, input_buffer);
	mov	dptr,#_main_row_65537_203
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	dptr,#_lcd_string_at_PARM_2
	mov	a,r6
	movx	@dptr,a
	mov	dptr,#_lcd_string_at_PARM_3
	mov	a,#_main_input_buffer_65537_203
	movx	@dptr,a
	mov	a,#(_main_input_buffer_65537_203 >> 8)
	inc	dptr
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
	mov	dpl,r4
	lcall	_lcd_string_at
	C$LCD_Driver.c$786$3_1$207 ==.
;	LCD_Driver.c:786: break;
	ljmp	00123$
	C$LCD_Driver.c$788$3_1$207 ==.
;	LCD_Driver.c:788: case 'c':
00109$:
	C$LCD_Driver.c$789$3_1$207 ==.
;	LCD_Driver.c:789: putstr("Enter the string: ");
	mov	dptr,#___str_41
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$790$3_1$207 ==.
;	LCD_Driver.c:790: get_user_input(input_buffer, 64);
	mov	dptr,#_get_user_input_PARM_2
	mov	a,#0x40
	movx	@dptr,a
	mov	dptr,#_main_input_buffer_65537_203
	mov	b,#0x00
	lcall	_get_user_input
	C$LCD_Driver.c$791$3_1$207 ==.
;	LCD_Driver.c:791: putstr("What row?:");
	mov	dptr,#___str_39
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$792$3_1$207 ==.
;	LCD_Driver.c:792: row = get_number();
	lcall	_get_number
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_main_row_65537_203
	movx	@dptr,a
	mov	a,b
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$793$3_1$207 ==.
;	LCD_Driver.c:793: putstr("And what col?:");
	mov	dptr,#___str_40
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$794$3_1$207 ==.
;	LCD_Driver.c:794: col = get_number();
	lcall	_get_number
	mov	r6,dpl
	mov	r7,dph
	mov	dptr,#_main_col_65537_203
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$796$3_1$207 ==.
;	LCD_Driver.c:796: lcdgotoxy(row, col);
	mov	dptr,#_main_row_65537_203
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	dptr,#_lcdgotoxy_PARM_2
	mov	a,r6
	movx	@dptr,a
	mov	dpl,r4
	lcall	_lcdgotoxy
	C$LCD_Driver.c$797$3_1$207 ==.
;	LCD_Driver.c:797: lcdputstr_wordwrap(input_buffer);
	mov	dptr,#_main_input_buffer_65537_203
	mov	b,#0x00
	lcall	_lcdputstr_wordwrap
	C$LCD_Driver.c$798$3_1$207 ==.
;	LCD_Driver.c:798: break;
	ljmp	00123$
	C$LCD_Driver.c$800$3_1$207 ==.
;	LCD_Driver.c:800: case 'd':
00110$:
	C$LCD_Driver.c$801$3_1$207 ==.
;	LCD_Driver.c:801: lcdclear();
	lcall	_lcdclear
	C$LCD_Driver.c$802$3_1$207 ==.
;	LCD_Driver.c:802: break;
	ljmp	00123$
	C$LCD_Driver.c$804$3_1$207 ==.
;	LCD_Driver.c:804: case 'e':
00111$:
	C$LCD_Driver.c$805$3_1$207 ==.
;	LCD_Driver.c:805: lcdinit();
	lcall	_lcdinit
	C$LCD_Driver.c$806$3_1$207 ==.
;	LCD_Driver.c:806: break;
	ljmp	00123$
	C$LCD_Driver.c$808$3_1$207 ==.
;	LCD_Driver.c:808: case 'f':
00112$:
	C$LCD_Driver.c$809$3_1$207 ==.
;	LCD_Driver.c:809: let_user_create_char();
	lcall	_let_user_create_char
	C$LCD_Driver.c$810$3_1$207 ==.
;	LCD_Driver.c:810: break;
	ljmp	00123$
	C$LCD_Driver.c$812$3_1$207 ==.
;	LCD_Driver.c:812: case 'g':
00113$:
	C$LCD_Driver.c$813$3_1$207 ==.
;	LCD_Driver.c:813: putstr("Enter the custom character number: ");
	mov	dptr,#___str_42
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$814$3_1$207 ==.
;	LCD_Driver.c:814: get_user_input(char_buffer, 2);
	mov	dptr,#_get_user_input_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dptr,#_main_char_buffer_65537_203
	mov	b,#0x00
	lcall	_get_user_input
	C$LCD_Driver.c$816$3_1$207 ==.
;	LCD_Driver.c:816: if ((*char_buffer < '0') || (*char_buffer > '7')) {
	mov	dptr,#_main_char_buffer_65537_203
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x30,00212$
00212$:
	jc	00114$
	mov	a,r7
	add	a,#0xff - 0x37
	jnc	00115$
00114$:
	C$LCD_Driver.c$817$4_1$208 ==.
;	LCD_Driver.c:817: putstr("Error: Custom character code must be between 0 and 7.\n\r");
	mov	dptr,#___str_2
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$818$4_1$208 ==.
;	LCD_Driver.c:818: break;
	ljmp	00123$
00115$:
	C$LCD_Driver.c$821$3_1$207 ==.
;	LCD_Driver.c:821: putstr("What row?:");
	mov	dptr,#___str_39
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$822$3_1$207 ==.
;	LCD_Driver.c:822: row = get_number();
	lcall	_get_number
	mov	a,dpl
	mov	b,dph
	mov	dptr,#_main_row_65537_203
	movx	@dptr,a
	mov	a,b
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$823$3_1$207 ==.
;	LCD_Driver.c:823: putstr("And what col?:");
	mov	dptr,#___str_40
	mov	b,#0x80
	lcall	_putstr
	C$LCD_Driver.c$824$3_1$207 ==.
;	LCD_Driver.c:824: col = get_number();
	lcall	_get_number
	mov	r6,dpl
	mov	r7,dph
	mov	dptr,#_main_col_65537_203
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$LCD_Driver.c$826$3_1$207 ==.
;	LCD_Driver.c:826: lcd_putchar_at(row, col, *char_buffer - '0'); // Convert char to number
	mov	dptr,#_main_row_65537_203
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	dptr,#_main_char_buffer_65537_203
	movx	a,@dptr
	add	a,#0xd0
	mov	r7,a
	mov	dptr,#_lcd_putchar_at_PARM_2
	mov	a,r6
	movx	@dptr,a
	mov	dptr,#_lcd_putchar_at_PARM_3
	mov	a,r7
	movx	@dptr,a
	mov	dpl,r4
	lcall	_lcd_putchar_at
	C$LCD_Driver.c$827$3_1$207 ==.
;	LCD_Driver.c:827: break;
	C$LCD_Driver.c$829$3_1$207 ==.
;	LCD_Driver.c:829: case 'h':
	sjmp	00123$
00117$:
	C$LCD_Driver.c$830$3_1$207 ==.
;	LCD_Driver.c:830: menu_print();
	lcall	_menu_print
	C$LCD_Driver.c$831$3_1$207 ==.
;	LCD_Driver.c:831: break;
	C$LCD_Driver.c$833$3_1$207 ==.
;	LCD_Driver.c:833: case 'i':
	sjmp	00123$
00118$:
	C$LCD_Driver.c$834$3_1$207 ==.
;	LCD_Driver.c:834: hex_dump_complete();
	lcall	_hex_dump_complete
	C$LCD_Driver.c$835$3_1$207 ==.
;	LCD_Driver.c:835: break;
	C$LCD_Driver.c$837$3_1$207 ==.
;	LCD_Driver.c:837: case 's':
	sjmp	00123$
00119$:
	C$LCD_Driver.c$838$3_1$207 ==.
;	LCD_Driver.c:838: clock_start();
	lcall	_clock_start
	C$LCD_Driver.c$839$3_1$207 ==.
;	LCD_Driver.c:839: break;
	C$LCD_Driver.c$841$3_1$207 ==.
;	LCD_Driver.c:841: case 't':
	sjmp	00123$
00120$:
	C$LCD_Driver.c$842$3_1$207 ==.
;	LCD_Driver.c:842: clock_stop();
	lcall	_clock_stop
	C$LCD_Driver.c$843$3_1$207 ==.
;	LCD_Driver.c:843: break;
	C$LCD_Driver.c$845$3_1$207 ==.
;	LCD_Driver.c:845: case 'r':
	sjmp	00123$
00121$:
	C$LCD_Driver.c$846$3_1$207 ==.
;	LCD_Driver.c:846: clock_reset();
	lcall	_clock_reset
	C$LCD_Driver.c$847$3_1$207 ==.
;	LCD_Driver.c:847: break;
	C$LCD_Driver.c$849$3_1$207 ==.
;	LCD_Driver.c:849: default:
	sjmp	00123$
00122$:
	C$LCD_Driver.c$850$3_1$207 ==.
;	LCD_Driver.c:850: printf("Invalid option\n\r");
	mov	a,#___str_43
	push	acc
	mov	a,#(___str_43 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	C$LCD_Driver.c$851$3_1$207 ==.
;	LCD_Driver.c:851: menu_print();
	lcall	_menu_print
	C$LCD_Driver.c$853$2_1$204 ==.
;	LCD_Driver.c:853: }
00123$:
	C$LCD_Driver.c$855$2_1$204 ==.
;	LCD_Driver.c:855: putstr("DONE\r\n\r\n");
	mov	dptr,#___str_44
	mov	b,#0x80
	lcall	_putstr
	ljmp	00103$
	C$LCD_Driver.c$857$1_1$202 ==.
;	LCD_Driver.c:857: }
	C$LCD_Driver.c$857$1_1$202 ==.
	XG$main$0$0 ==.
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
G$row_addresses$0_0$0 == .
_row_addresses:
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x10	; 16
	.db #0x50	; 80	'P'
FLCD_Driver$__str_0$0_0$0 == .
	.area CONST   (CODE)
___str_0:
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_1$0_0$0 == .
	.area CONST   (CODE)
___str_1:
	.ascii "Enter custom character code (0-7): "
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_2$0_0$0 == .
	.area CONST   (CODE)
___str_2:
	.ascii "Error: Custom character code must be between 0 and 7."
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_3$0_0$0 == .
	.area CONST   (CODE)
___str_3:
	.ascii "Enter 5 bits per row (0 or 1), press Enter after each row:"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_4$0_0$0 == .
	.area CONST   (CODE)
___str_4:
	.ascii "Row %d: "
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_5$0_0$0 == .
	.area CONST   (CODE)
___str_5:
	.ascii "Custom character made :) "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_6$0_0$0 == .
	.area CONST   (CODE)
___str_6:
	.db 0x0a
	.db 0x0d
	.ascii "LCD DDRAM HEX DUMP"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_7$0_0$0 == .
	.area CONST   (CODE)
___str_7:
	.ascii "[Row] [Address]: Data (16 bytes per row)"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_8$0_0$0 == .
	.area CONST   (CODE)
___str_8:
	.ascii "------------------------------------------------"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_9$0_0$0 == .
	.area CONST   (CODE)
___str_9:
	.ascii "Row %d [0x%02X]:"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_10$0_0$0 == .
	.area CONST   (CODE)
___str_10:
	.ascii "0x%02X "
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_11$0_0$0 == .
	.area CONST   (CODE)
___str_11:
	.db 0x0a
	.db 0x0d
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_12$0_0$0 == .
	.area CONST   (CODE)
___str_12:
	.ascii "LCD CGRAM HEX DUMP"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_13$0_0$0 == .
	.area CONST   (CODE)
___str_13:
	.ascii "[Char] [Row]: Data (8 characters x 8 rows each)"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_14$0_0$0 == .
	.area CONST   (CODE)
___str_14:
	.ascii "--------------------------------------------------"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_15$0_0$0 == .
	.area CONST   (CODE)
___str_15:
	.ascii "Character "
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_16$0_0$0 == .
	.area CONST   (CODE)
___str_16:
	.ascii ":"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_17$0_0$0 == .
	.area CONST   (CODE)
___str_17:
	.ascii "  Row %d [0x%02X]: 0x%02X = "
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_18$0_0$0 == .
	.area CONST   (CODE)
___str_18:
	.ascii "Here is everything you can do:"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_19$0_0$0 == .
	.area CONST   (CODE)
___str_19:
	.ascii "--------------------------------------"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_20$0_0$0 == .
	.area CONST   (CODE)
___str_20:
	.ascii "0. Put a character at wherever the cursor is "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_21$0_0$0 == .
	.area CONST   (CODE)
___str_21:
	.ascii "a. Put a character somewhere "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_22$0_0$0 == .
	.area CONST   (CODE)
___str_22:
	.ascii "b. Put a string somewhere (letter wrap) "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_23$0_0$0 == .
	.area CONST   (CODE)
___str_23:
	.ascii "c. Put a string somewhere (word wrap) "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_24$0_0$0 == .
	.area CONST   (CODE)
___str_24:
	.ascii "d. Clear screen "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_25$0_0$0 == .
	.area CONST   (CODE)
___str_25:
	.ascii "e. Re-init screen "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_26$0_0$0 == .
	.area CONST   (CODE)
___str_26:
	.ascii "f. Create Custom Character "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_27$0_0$0 == .
	.area CONST   (CODE)
___str_27:
	.ascii "g. Put Custom Character somewhere "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_28$0_0$0 == .
	.area CONST   (CODE)
___str_28:
	.ascii "h. Help Menu "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_29$0_0$0 == .
	.area CONST   (CODE)
___str_29:
	.ascii "i. Hex Dump "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_30$0_0$0 == .
	.area CONST   (CODE)
___str_30:
	.ascii "Clock Menu: "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_31$0_0$0 == .
	.area CONST   (CODE)
___str_31:
	.ascii "s. Start Clock"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_32$0_0$0 == .
	.area CONST   (CODE)
___str_32:
	.ascii "t. Stop Clock"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_33$0_0$0 == .
	.area CONST   (CODE)
___str_33:
	.ascii "r. Reset Clock"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_34$0_0$0 == .
	.area CONST   (CODE)
___str_34:
	.ascii "LCD Initialized "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_35$0_0$0 == .
	.area CONST   (CODE)
___str_35:
	.ascii "Timer Initialized "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_36$0_0$0 == .
	.area CONST   (CODE)
___str_36:
	.ascii "Clock Display Started "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_37$0_0$0 == .
	.area CONST   (CODE)
___str_37:
	.ascii "%c"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_38$0_0$0 == .
	.area CONST   (CODE)
___str_38:
	.ascii "Enter the character: "
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_39$0_0$0 == .
	.area CONST   (CODE)
___str_39:
	.ascii "What row?:"
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_40$0_0$0 == .
	.area CONST   (CODE)
___str_40:
	.ascii "And what col?:"
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_41$0_0$0 == .
	.area CONST   (CODE)
___str_41:
	.ascii "Enter the string: "
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_42$0_0$0 == .
	.area CONST   (CODE)
___str_42:
	.ascii "Enter the custom character number: "
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_43$0_0$0 == .
	.area CONST   (CODE)
___str_43:
	.ascii "Invalid option"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FLCD_Driver$__str_44$0_0$0 == .
	.area CONST   (CODE)
___str_44:
	.ascii "DONE"
	.db 0x0d
	.db 0x0a
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area XINIT   (CODE)
FLCD_Driver$__xinit_system_clock$0_0$0 == .
__xinit__system_clock:
	.byte #0x00, #0x00	; 0
	.byte #0x00, #0x00	; 0
	.byte #0x00, #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
FLCD_Driver$__xinit_timer_do_something$0_0$0 == .
__xinit__timer_do_something:
	.db #0x00	;  0
FLCD_Driver$__xinit_cursor_backup$0_0$0 == .
__xinit__cursor_backup:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
FLCD_Driver$__xinit_current_row$0_0$0 == .
__xinit__current_row:
	.db #0x00	; 0
FLCD_Driver$__xinit_current_col$0_0$0 == .
__xinit__current_col:
	.db #0x00	; 0
FLCD_Driver$__xinit_lcd_cmd_ptr$0_0$0 == .
__xinit__lcd_cmd_ptr:
	.byte #0x00,#0x80
FLCD_Driver$__xinit_lcdputch_ptr$0_0$0 == .
__xinit__lcdputch_ptr:
	.byte #0x01,#0x80
FLCD_Driver$__xinit_lcd_status_ptr$0_0$0 == .
__xinit__lcd_status_ptr:
	.byte #0x02,#0x80
FLCD_Driver$__xinit_lcd_read_ptr$0_0$0 == .
__xinit__lcd_read_ptr:
	.byte #0x03,#0x80
FLCD_Driver$__xinit_custom_char_checker$0_0$0 == .
__xinit__custom_char_checker:
	.db #0x15	; 21
	.db #0x0a	; 10
	.db #0x15	; 21
	.db #0x0a	; 10
	.db #0x15	; 21
	.db #0x0a	; 10
	.db #0x15	; 21
	.db #0x0a	; 10
FLCD_Driver$__xinit_custom_char_heart$0_0$0 == .
__xinit__custom_char_heart:
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x15	; 21
	.db #0x11	; 17
	.db #0x0a	; 10
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
FLCD_Driver$__xinit_custom_char_face$0_0$0 == .
__xinit__custom_char_face:
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0a	; 10
	.db #0x04	; 4
	.db #0x11	; 17
	.db #0x1f	; 31
FLCD_Driver$__xinit_custom_char_alpaca$0_0$0 == .
__xinit__custom_char_alpaca:
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x12	; 18
	.db #0x0e	; 14
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x00	; 0
FLCD_Driver$__xinit_custom_char_giraffe$0_0$0 == .
__xinit__custom_char_giraffe:
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0e	; 14
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x00	; 0
	.area CABS    (ABS,CODE)
