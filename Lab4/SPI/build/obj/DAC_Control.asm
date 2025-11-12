;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module DAC_Control
	.optsdcc -mmcs51 --model-large
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _print_menu
	.globl _manual_dac_control
	.globl _get_number
	.globl _test_dc_levels
	.globl _generate_sin_wave
	.globl _dac_write
	.globl _spi_transfer_bitbang
	.globl __nop_
	.globl _spi_transfer
	.globl _spi_deinit
	.globl _spi_init
	.globl _putstr
	.globl _generate_sin_table
	.globl _simple_sin
	.globl _atoi
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
	.globl _SPDAT
	.globl _SPSTA
	.globl _SPCON
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
	.globl _bit_bang_mode
	.globl _wave_frequency
	.globl _sin_index
	.globl _generate_sin_table_PARM_2
	.globl _sin_table
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
G$SPCON$0_0$0 == 0x00c3
_SPCON	=	0x00c3
G$SPSTA$0_0$0 == 0x00c4
_SPSTA	=	0x00c4
G$SPDAT$0_0$0 == 0x00c5
_SPDAT	=	0x00c5
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
LDAC_Control.simple_sin$sloc0$0_1$0==.
_simple_sin_sloc0_1_0:
	.ds 4
LDAC_Control.simple_sin$sloc1$0_1$0==.
_simple_sin_sloc1_1_0:
	.ds 4
LDAC_Control.generate_sin_table$sloc0$0_1$0==.
_generate_sin_table_sloc0_1_0:
	.ds 3
LDAC_Control.generate_sin_table$sloc1$0_1$0==.
_generate_sin_table_sloc1_1_0:
	.ds 4
LDAC_Control.generate_sin_table$sloc2$0_1$0==.
_generate_sin_table_sloc2_1_0:
	.ds 3
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
G$sin_table$0_0$0==.
_sin_table::
	.ds 256
LDAC_Control.simple_sin$x$1_0$67==.
_simple_sin_x_65536_67:
	.ds 4
LDAC_Control.generate_sin_table$size$1_0$70==.
_generate_sin_table_PARM_2:
	.ds 2
LDAC_Control.generate_sin_table$table$1_0$70==.
_generate_sin_table_table_65536_70:
	.ds 3
LDAC_Control.putchar$c$1_0$74==.
_putchar_c_65536_74:
	.ds 2
LDAC_Control.putstr$s$1_0$78==.
_putstr_s_65536_78:
	.ds 3
LDAC_Control.spi_transfer$data$1_0$85==.
_spi_transfer_data_65536_85:
	.ds 1
LDAC_Control.spi_transfer_bitbang$data$1_0$89==.
_spi_transfer_bitbang_data_65536_89:
	.ds 1
LDAC_Control.spi_transfer_bitbang$received$1_0$90==.
_spi_transfer_bitbang_received_65536_90:
	.ds 1
LDAC_Control.dac_write$value$1_0$94==.
_dac_write_value_65536_94:
	.ds 1
LDAC_Control.test_dc_levels$test_values$1_1$102==.
_test_dc_levels_test_values_65537_102:
	.ds 5
LDAC_Control.test_dc_levels$labels$1_1$102==.
_test_dc_levels_labels_65537_102:
	.ds 15
LDAC_Control.get_number$buffer$1_0$106==.
_get_number_buffer_65536_106:
	.ds 4
LDAC_Control.main$i$5_0$121==.
_main_i_327680_121:
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
G$sin_index$0_0$0==.
_sin_index::
	.ds 1
G$wave_frequency$0_0$0==.
_wave_frequency::
	.ds 2
G$bit_bang_mode$0_0$0==.
_bit_bang_mode::
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
;Allocation info for local variables in function 'simple_sin'
;------------------------------------------------------------
;sloc0                     Allocated with name '_simple_sin_sloc0_1_0'
;sloc1                     Allocated with name '_simple_sin_sloc1_1_0'
;x                         Allocated with name '_simple_sin_x_65536_67'
;x2                        Allocated with name '_simple_sin_x2_65537_69'
;x3                        Allocated with name '_simple_sin_x3_65537_69'
;x5                        Allocated with name '_simple_sin_x5_65537_69'
;------------------------------------------------------------
	G$simple_sin$0$0 ==.
	C$DAC_Control.c$37$0_0$68 ==.
;	DAC_Control.c:37: float simple_sin(float x) {
;	-----------------------------------------
;	 function simple_sin
;	-----------------------------------------
_simple_sin:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7,dpl
	mov	r6,dph
	mov	r5,b
	mov	r4,a
	mov	dptr,#_simple_sin_x_65536_67
	mov	a,r7
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r5
	inc	dptr
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
	C$DAC_Control.c$39$1_0$68 ==.
;	DAC_Control.c:39: while (x > PI) x -= 2.0f * PI;
00101$:
	mov	dptr,#_simple_sin_x_65536_67
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0fdb
	mov	b,#0x49
	mov	a,#0x40
	lcall	___fslt
	mov	r3,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,r3
	jz	00104$
	mov	a,#0xdb
	push	acc
	mov	a,#0x0f
	push	acc
	mov	a,#0xc9
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fssub
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dptr,#_simple_sin_x_65536_67
	mov	a,r4
	movx	@dptr,a
	mov	a,r5
	inc	dptr
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$DAC_Control.c$40$1_0$68 ==.
;	DAC_Control.c:40: while (x < -PI) x += 2.0f * PI;
	sjmp	00101$
00104$:
	mov	dptr,#_simple_sin_x_65536_67
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	mov	a,#0xdb
	push	acc
	mov	a,#0x0f
	push	acc
	mov	a,#0x49
	push	acc
	mov	a,#0xc0
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fslt
	mov	r3,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	mov	a,r3
	jz	00106$
	mov	a,#0xdb
	push	acc
	mov	a,#0x0f
	push	acc
	mov	a,#0xc9
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsadd
	mov	r0,dpl
	mov	r1,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dptr,#_simple_sin_x_65536_67
	mov	a,r0
	movx	@dptr,a
	mov	a,r1
	inc	dptr
	movx	@dptr,a
	mov	a,r2
	inc	dptr
	movx	@dptr,a
	mov	a,r3
	inc	dptr
	movx	@dptr,a
	sjmp	00104$
00106$:
	C$DAC_Control.c$43$1_1$68 ==.
;	DAC_Control.c:43: float x2 = x * x;
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	C$DAC_Control.c$44$1_1$68 ==.
;	DAC_Control.c:44: float x3 = x2 * x;
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsmul
	mov	_simple_sin_sloc0_1_0,dpl
	mov	(_simple_sin_sloc0_1_0 + 1),dph
	mov	(_simple_sin_sloc0_1_0 + 2),b
	mov	(_simple_sin_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	C$DAC_Control.c$45$1_1$68 ==.
;	DAC_Control.c:45: float x5 = x3 * x2;
	mov	dpl,_simple_sin_sloc0_1_0
	mov	dph,(_simple_sin_sloc0_1_0 + 1)
	mov	b,(_simple_sin_sloc0_1_0 + 2)
	mov	a,(_simple_sin_sloc0_1_0 + 3)
	lcall	___fsmul
	mov	_simple_sin_sloc1_1_0,dpl
	mov	(_simple_sin_sloc1_1_0 + 1),dph
	mov	(_simple_sin_sloc1_1_0 + 2),b
	mov	(_simple_sin_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_simple_sin_sloc0_1_0
	push	(_simple_sin_sloc0_1_0 + 1)
	push	(_simple_sin_sloc0_1_0 + 2)
	push	(_simple_sin_sloc0_1_0 + 3)
	C$DAC_Control.c$47$1_1$68 ==.
;	DAC_Control.c:47: return x - (x3 / 6.0f) + (x5 / 120.0f);
	mov	dpl,_simple_sin_sloc1_1_0
	mov	dph,(_simple_sin_sloc1_1_0 + 1)
	mov	b,(_simple_sin_sloc1_1_0 + 2)
	mov	a,(_simple_sin_sloc1_1_0 + 3)
	lcall	___fsmul
	mov	_simple_sin_sloc0_1_0,dpl
	mov	(_simple_sin_sloc0_1_0 + 1),dph
	mov	(_simple_sin_sloc0_1_0 + 2),b
	mov	(_simple_sin_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	push	acc
	mov	a,#0xc0
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,_simple_sin_sloc1_1_0
	mov	dph,(_simple_sin_sloc1_1_0 + 1)
	mov	b,(_simple_sin_sloc1_1_0 + 2)
	mov	a,(_simple_sin_sloc1_1_0 + 3)
	lcall	___fsdiv
	mov	r0,dpl
	mov	r1,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	push	ar0
	push	ar1
	push	ar2
	push	ar3
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fssub
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	clr	a
	push	acc
	push	acc
	mov	a,#0xf0
	push	acc
	mov	a,#0x42
	push	acc
	mov	dpl,_simple_sin_sloc0_1_0
	mov	dph,(_simple_sin_sloc0_1_0 + 1)
	mov	b,(_simple_sin_sloc0_1_0 + 2)
	mov	a,(_simple_sin_sloc0_1_0 + 3)
	lcall	___fsdiv
	mov	r0,dpl
	mov	r1,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	push	ar0
	push	ar1
	push	ar2
	push	ar3
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsadd
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	C$DAC_Control.c$48$1_1$68 ==.
;	DAC_Control.c:48: }
	C$DAC_Control.c$48$1_1$68 ==.
	XG$simple_sin$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'generate_sin_table'
;------------------------------------------------------------
;sloc0                     Allocated with name '_generate_sin_table_sloc0_1_0'
;sloc1                     Allocated with name '_generate_sin_table_sloc1_1_0'
;sloc2                     Allocated with name '_generate_sin_table_sloc2_1_0'
;size                      Allocated with name '_generate_sin_table_PARM_2'
;table                     Allocated with name '_generate_sin_table_table_65536_70'
;i                         Allocated with name '_generate_sin_table_i_131072_72'
;angle                     Allocated with name '_generate_sin_table_angle_196608_73'
;sin_val                   Allocated with name '_generate_sin_table_sin_val_196608_73'
;scaled                    Allocated with name '_generate_sin_table_scaled_196608_73'
;------------------------------------------------------------
	G$generate_sin_table$0$0 ==.
	C$DAC_Control.c$49$1_1$72 ==.
;	DAC_Control.c:49: void generate_sin_table(uint8_t *table, uint16_t size) {
;	-----------------------------------------
;	 function generate_sin_table
;	-----------------------------------------
_generate_sin_table:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_generate_sin_table_table_65536_70
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$DAC_Control.c$50$3_0$73 ==.
;	DAC_Control.c:50: for (uint16_t i = 0; i < size; i++) {
	mov	dptr,#_generate_sin_table_table_65536_70
	movx	a,@dptr
	mov	_generate_sin_table_sloc0_1_0,a
	inc	dptr
	movx	a,@dptr
	mov	(_generate_sin_table_sloc0_1_0 + 1),a
	inc	dptr
	movx	a,@dptr
	mov	(_generate_sin_table_sloc0_1_0 + 2),a
	mov	dptr,#_generate_sin_table_PARM_2
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	r1,#0x00
	mov	r2,#0x00
00103$:
	clr	c
	mov	a,r1
	subb	a,r3
	mov	a,r2
	subb	a,r4
	jc	00116$
	ljmp	00105$
00116$:
	C$DAC_Control.c$53$2_0$72 ==.
;	DAC_Control.c:53: float angle = 2.0 * PI * i / size;
	mov	dpl,r1
	mov	dph,r2
	push	ar4
	push	ar3
	push	ar2
	push	ar1
	lcall	___uint2fs
	mov	r0,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar0
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x0fdb
	mov	b,#0xc9
	mov	a,#0x40
	lcall	___fsmul
	mov	_generate_sin_table_sloc1_1_0,dpl
	mov	(_generate_sin_table_sloc1_1_0 + 1),dph
	mov	(_generate_sin_table_sloc1_1_0 + 2),b
	mov	(_generate_sin_table_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
	pop	ar2
	pop	ar3
	pop	ar4
	mov	dpl,r3
	mov	dph,r4
	push	ar4
	push	ar3
	push	ar2
	push	ar1
	lcall	___uint2fs
	mov	r0,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar0
	push	ar5
	push	ar6
	push	ar7
	C$DAC_Control.c$54$2_0$72 ==.
;	DAC_Control.c:54: float sin_val = simple_sin(angle);
	mov	dpl,_generate_sin_table_sloc1_1_0
	mov	dph,(_generate_sin_table_sloc1_1_0 + 1)
	mov	b,(_generate_sin_table_sloc1_1_0 + 2)
	mov	a,(_generate_sin_table_sloc1_1_0 + 3)
	lcall	___fsdiv
	mov	r0,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r0
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	_simple_sin
	mov	r0,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	C$DAC_Control.c$55$2_0$72 ==.
;	DAC_Control.c:55: float scaled = (sin_val + 1.0f) * 127.5f;
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3f
	push	acc
	mov	dpl,r0
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fsadd
	mov	r0,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar0
	push	ar5
	push	ar6
	push	ar7
	C$DAC_Control.c$56$2_0$72 ==.
;	DAC_Control.c:56: table[i] = (uint8_t)(scaled + 0.5); // so it rounds to nearest int
	mov	dptr,#0x0000
	mov	b,#0xff
	mov	a,#0x42
	lcall	___fsmul
	mov	_generate_sin_table_sloc1_1_0,dpl
	mov	(_generate_sin_table_sloc1_1_0 + 1),dph
	mov	(_generate_sin_table_sloc1_1_0 + 2),b
	mov	(_generate_sin_table_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
	pop	ar2
	pop	ar3
	pop	ar4
	push	ar3
	push	ar4
	mov	a,r1
	add	a,_generate_sin_table_sloc0_1_0
	mov	_generate_sin_table_sloc2_1_0,a
	mov	a,r2
	addc	a,(_generate_sin_table_sloc0_1_0 + 1)
	mov	(_generate_sin_table_sloc2_1_0 + 1),a
	mov	(_generate_sin_table_sloc2_1_0 + 2),(_generate_sin_table_sloc0_1_0 + 2)
	push	ar4
	push	ar3
	push	ar2
	push	ar1
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x3f
	push	acc
	mov	dpl,_generate_sin_table_sloc1_1_0
	mov	dph,(_generate_sin_table_sloc1_1_0 + 1)
	mov	b,(_generate_sin_table_sloc1_1_0 + 2)
	mov	a,(_generate_sin_table_sloc1_1_0 + 3)
	lcall	___fsadd
	mov	r0,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r0
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fs2uchar
	mov	r7,dpl
	pop	ar1
	pop	ar2
	pop	ar3
	pop	ar4
	mov	dpl,_generate_sin_table_sloc2_1_0
	mov	dph,(_generate_sin_table_sloc2_1_0 + 1)
	mov	b,(_generate_sin_table_sloc2_1_0 + 2)
	mov	a,r7
	lcall	__gptrput
	C$DAC_Control.c$50$2_0$72 ==.
;	DAC_Control.c:50: for (uint16_t i = 0; i < size; i++) {
	inc	r1
	cjne	r1,#0x00,00117$
	inc	r2
00117$:
	pop	ar4
	pop	ar3
	ljmp	00103$
00105$:
	C$DAC_Control.c$58$2_0$72 ==.
;	DAC_Control.c:58: }
	C$DAC_Control.c$58$2_0$72 ==.
	XG$generate_sin_table$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putchar'
;------------------------------------------------------------
;c                         Allocated with name '_putchar_c_65536_74'
;------------------------------------------------------------
	G$putchar$0$0 ==.
	C$DAC_Control.c$66$2_0$75 ==.
;	DAC_Control.c:66: int putchar(int c) {
;	-----------------------------------------
;	 function putchar
;	-----------------------------------------
_putchar:
	mov	r7,dph
	mov	a,dpl
	mov	dptr,#_putchar_c_65536_74
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$DAC_Control.c$67$1_0$75 ==.
;	DAC_Control.c:67: while (!TI);
00101$:
	jnb	_TI,00101$
	C$DAC_Control.c$68$1_0$75 ==.
;	DAC_Control.c:68: SBUF = c;
	mov	dptr,#_putchar_c_65536_74
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	_SBUF,r6
	C$DAC_Control.c$69$1_0$75 ==.
;	DAC_Control.c:69: TI = 0;
;	assignBit
	clr	_TI
	C$DAC_Control.c$70$1_0$75 ==.
;	DAC_Control.c:70: return c;
	mov	dpl,r6
	mov	dph,r7
	C$DAC_Control.c$71$1_0$75 ==.
;	DAC_Control.c:71: }
	C$DAC_Control.c$71$1_0$75 ==.
	XG$putchar$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar'
;------------------------------------------------------------
	G$getchar$0$0 ==.
	C$DAC_Control.c$73$1_0$77 ==.
;	DAC_Control.c:73: int getchar(void) {
;	-----------------------------------------
;	 function getchar
;	-----------------------------------------
_getchar:
	C$DAC_Control.c$74$1_0$77 ==.
;	DAC_Control.c:74: while (!RI);
00101$:
	C$DAC_Control.c$75$1_0$77 ==.
;	DAC_Control.c:75: RI = 0;
;	assignBit
	jbc	_RI,00114$
	sjmp	00101$
00114$:
	C$DAC_Control.c$76$1_0$77 ==.
;	DAC_Control.c:76: return SBUF;
	mov	r6,_SBUF
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	C$DAC_Control.c$77$1_0$77 ==.
;	DAC_Control.c:77: }
	C$DAC_Control.c$77$1_0$77 ==.
	XG$getchar$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putstr'
;------------------------------------------------------------
;s                         Allocated with name '_putstr_s_65536_78'
;------------------------------------------------------------
	G$putstr$0$0 ==.
	C$DAC_Control.c$79$1_0$79 ==.
;	DAC_Control.c:79: void putstr(char *s) {
;	-----------------------------------------
;	 function putstr
;	-----------------------------------------
_putstr:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_putstr_s_65536_78
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$DAC_Control.c$80$1_0$79 ==.
;	DAC_Control.c:80: while (*s) {
	mov	dptr,#_putstr_s_65536_78
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
00101$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	jz	00108$
	C$DAC_Control.c$81$2_0$80 ==.
;	DAC_Control.c:81: putchar(*s++);
	inc	r5
	cjne	r5,#0x00,00116$
	inc	r6
00116$:
	mov	dptr,#_putstr_s_65536_78
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	mov	r3,#0x00
	mov	dpl,r4
	mov	dph,r3
	push	ar7
	push	ar6
	push	ar5
	lcall	_putchar
	pop	ar5
	pop	ar6
	pop	ar7
	sjmp	00101$
00108$:
	mov	dptr,#_putstr_s_65536_78
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	C$DAC_Control.c$83$1_0$79 ==.
;	DAC_Control.c:83: }
	C$DAC_Control.c$83$1_0$79 ==.
	XG$putstr$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'spi_init'
;------------------------------------------------------------
	G$spi_init$0$0 ==.
	C$DAC_Control.c$86$1_0$82 ==.
;	DAC_Control.c:86: void spi_init(void) {
;	-----------------------------------------
;	 function spi_init
;	-----------------------------------------
_spi_init:
	C$DAC_Control.c$88$1_0$82 ==.
;	DAC_Control.c:88: SPI_CS = 1; // CS inactive (high)
;	assignBit
	setb	_P1_2
	C$DAC_Control.c$89$1_0$82 ==.
;	DAC_Control.c:89: SPI_SCK = 0;
;	assignBit
	clr	_P1_6
	C$DAC_Control.c$90$1_0$82 ==.
;	DAC_Control.c:90: SPI_MOSI = 0;
;	assignBit
	clr	_P1_7
	C$DAC_Control.c$101$1_0$82 ==.
;	DAC_Control.c:101: SPCON = 0x71;
	mov	_SPCON,#0x71
	C$DAC_Control.c$103$1_0$82 ==.
;	DAC_Control.c:103: SPSTA = 0x00;   // SPI status register, start empty
	mov	_SPSTA,#0x00
	C$DAC_Control.c$105$1_0$82 ==.
;	DAC_Control.c:105: putstr("SPI Controller Initialized\n\r");
	mov	dptr,#___str_0
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$106$1_0$82 ==.
;	DAC_Control.c:106: }
	C$DAC_Control.c$106$1_0$82 ==.
	XG$spi_init$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'spi_deinit'
;------------------------------------------------------------
	G$spi_deinit$0$0 ==.
	C$DAC_Control.c$108$1_0$84 ==.
;	DAC_Control.c:108: void spi_deinit(void) { // for bit bang mode
;	-----------------------------------------
;	 function spi_deinit
;	-----------------------------------------
_spi_deinit:
	C$DAC_Control.c$109$1_0$84 ==.
;	DAC_Control.c:109: SPCON = 0x00; // Disable SPI
	mov	_SPCON,#0x00
	C$DAC_Control.c$110$1_0$84 ==.
;	DAC_Control.c:110: }
	C$DAC_Control.c$110$1_0$84 ==.
	XG$spi_deinit$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'spi_transfer'
;------------------------------------------------------------
;data                      Allocated with name '_spi_transfer_data_65536_85'
;------------------------------------------------------------
	G$spi_transfer$0$0 ==.
	C$DAC_Control.c$113$1_0$86 ==.
;	DAC_Control.c:113: uint8_t spi_transfer(uint8_t data) {
;	-----------------------------------------
;	 function spi_transfer
;	-----------------------------------------
_spi_transfer:
	mov	a,dpl
	mov	dptr,#_spi_transfer_data_65536_85
	movx	@dptr,a
	C$DAC_Control.c$115$1_0$86 ==.
;	DAC_Control.c:115: SPDAT = data; // Load data into SPI Data Register
	movx	a,@dptr
	mov	_SPDAT,a
	C$DAC_Control.c$116$1_0$86 ==.
;	DAC_Control.c:116: while (!(SPSTA & 0x80)); // Wait for SPIF (SPI Interrupt Flag)
00101$:
	mov	a,_SPSTA
	jnb	acc.7,00101$
	C$DAC_Control.c$117$1_0$86 ==.
;	DAC_Control.c:117: SPSTA &= ~0x80; // Clear flag
	anl	_SPSTA,#0x7f
	C$DAC_Control.c$118$1_0$86 ==.
;	DAC_Control.c:118: return SPDAT;  // data recieved is not in the same register, not gonna use for this but returning anyway
	mov	dpl,_SPDAT
	C$DAC_Control.c$120$1_0$86 ==.
;	DAC_Control.c:120: }
	C$DAC_Control.c$120$1_0$86 ==.
	XG$spi_transfer$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_nop_'
;------------------------------------------------------------
	G$_nop_$0$0 ==.
	C$DAC_Control.c$123$1_0$88 ==.
;	DAC_Control.c:123: void _nop_(void) {
;	-----------------------------------------
;	 function _nop_
;	-----------------------------------------
__nop_:
	C$DAC_Control.c$126$1_0$88 ==.
;	DAC_Control.c:126: __endasm;
	nop
	C$DAC_Control.c$127$1_0$88 ==.
;	DAC_Control.c:127: }
	C$DAC_Control.c$127$1_0$88 ==.
	XG$_nop_$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'spi_transfer_bitbang'
;------------------------------------------------------------
;data                      Allocated with name '_spi_transfer_bitbang_data_65536_89'
;received                  Allocated with name '_spi_transfer_bitbang_received_65536_90'
;i                         Allocated with name '_spi_transfer_bitbang_i_65536_90'
;------------------------------------------------------------
	G$spi_transfer_bitbang$0$0 ==.
	C$DAC_Control.c$128$1_0$90 ==.
;	DAC_Control.c:128: uint8_t spi_transfer_bitbang(uint8_t data) {
;	-----------------------------------------
;	 function spi_transfer_bitbang
;	-----------------------------------------
_spi_transfer_bitbang:
	mov	a,dpl
	mov	dptr,#_spi_transfer_bitbang_data_65536_89
	movx	@dptr,a
	C$DAC_Control.c$129$2_0$90 ==.
;	DAC_Control.c:129: uint8_t received = 0;
	mov	dptr,#_spi_transfer_bitbang_received_65536_90
	clr	a
	movx	@dptr,a
	C$DAC_Control.c$132$1_0$90 ==.
;	DAC_Control.c:132: for (i = 0; i < 8; i++) {
	mov	r7,#0x00
00104$:
	C$DAC_Control.c$134$3_0$92 ==.
;	DAC_Control.c:134: SPI_MOSI = (data & 0x80) ? 1 : 0;
	mov	dptr,#_spi_transfer_bitbang_data_65536_89
	movx	a,@dptr
	mov	r6,a
	mov	r4,a
	anl	ar4,#0x80
	mov	r5,#0x00
;	assignBit
	mov	a,r4
	orl	a,r5
	add	a,#0xff
	mov	_P1_7,c
	C$DAC_Control.c$135$3_0$92 ==.
;	DAC_Control.c:135: data <<= 1;
	mov	a,r6
	add	a,r6
	mov	dptr,#_spi_transfer_bitbang_data_65536_89
	movx	@dptr,a
	C$DAC_Control.c$138$3_0$92 ==.
;	DAC_Control.c:138: _nop_();
	push	ar7
	lcall	__nop_
	pop	ar7
	C$DAC_Control.c$141$3_0$92 ==.
;	DAC_Control.c:141: SPI_SCK = 1;
;	assignBit
	setb	_P1_6
	C$DAC_Control.c$144$3_0$92 ==.
;	DAC_Control.c:144: received <<= 1;
	mov	dptr,#_spi_transfer_bitbang_received_65536_90
	movx	a,@dptr
	add	a,acc
	movx	@dptr,a
	C$DAC_Control.c$145$3_0$92 ==.
;	DAC_Control.c:145: if (SPI_MISO) {
	jnb	_P1_5,00102$
	C$DAC_Control.c$146$4_0$93 ==.
;	DAC_Control.c:146: received |= 1;
	mov	dptr,#_spi_transfer_bitbang_received_65536_90
	movx	a,@dptr
	orl	acc,#0x01
	movx	@dptr,a
00102$:
	C$DAC_Control.c$150$3_0$92 ==.
;	DAC_Control.c:150: _nop_();
	push	ar7
	lcall	__nop_
	C$DAC_Control.c$153$3_0$92 ==.
;	DAC_Control.c:153: SPI_SCK = 0;
;	assignBit
	clr	_P1_6
	C$DAC_Control.c$156$3_0$92 ==.
;	DAC_Control.c:156: _nop_();
	lcall	__nop_
	pop	ar7
	C$DAC_Control.c$132$2_0$91 ==.
;	DAC_Control.c:132: for (i = 0; i < 8; i++) {
	inc	r7
	cjne	r7,#0x08,00122$
00122$:
	jc	00104$
	C$DAC_Control.c$159$1_0$90 ==.
;	DAC_Control.c:159: return received;
	mov	dptr,#_spi_transfer_bitbang_received_65536_90
	movx	a,@dptr
	C$DAC_Control.c$160$1_0$90 ==.
;	DAC_Control.c:160: }
	C$DAC_Control.c$160$1_0$90 ==.
	XG$spi_transfer_bitbang$0$0 ==.
	mov	dpl,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'dac_write'
;------------------------------------------------------------
;value                     Allocated with name '_dac_write_value_65536_94'
;command                   Allocated with name '_dac_write_command_65536_95'
;------------------------------------------------------------
	G$dac_write$0$0 ==.
	C$DAC_Control.c$163$1_0$95 ==.
;	DAC_Control.c:163: void dac_write(uint8_t value) {
;	-----------------------------------------
;	 function dac_write
;	-----------------------------------------
_dac_write:
	mov	a,dpl
	mov	dptr,#_dac_write_value_65536_94
	movx	@dptr,a
	C$DAC_Control.c$167$1_0$95 ==.
;	DAC_Control.c:167: SPI_CS = 0;  // Chip Select low
;	assignBit
	clr	_P1_2
	C$DAC_Control.c$171$1_0$95 ==.
;	DAC_Control.c:171: if (bit_bang_mode) {
	mov	dptr,#_bit_bang_mode
	movx	a,@dptr
	jz	00102$
	C$DAC_Control.c$172$2_0$96 ==.
;	DAC_Control.c:172: spi_transfer_bitbang(command | ((value >> 4) & 0x0F)); // Command + upper 4 bits of data
	mov	dptr,#_dac_write_value_65536_94
	movx	a,@dptr
	mov	r7,a
	swap	a
	anl	a,#0x0f
	orl	a,#0x30
	mov	dpl,a
	push	ar7
	lcall	_spi_transfer_bitbang
	pop	ar7
	C$DAC_Control.c$173$2_0$96 ==.
;	DAC_Control.c:173: spi_transfer_bitbang((value << 4) & 0xF0); // Lower 4 bits + padding
	mov	a,r7
	swap	a
	anl	a,#0xf0
	mov	r7,a
	anl	ar7,#0xf0
	mov	dpl,r7
	lcall	_spi_transfer_bitbang
	sjmp	00103$
00102$:
	C$DAC_Control.c$175$2_0$97 ==.
;	DAC_Control.c:175: spi_transfer(command | ((value >> 4) & 0x0F)); // Command + upper 4 bits of data
	mov	dptr,#_dac_write_value_65536_94
	movx	a,@dptr
	mov	r7,a
	swap	a
	anl	a,#0x0f
	orl	a,#0x30
	mov	dpl,a
	push	ar7
	lcall	_spi_transfer
	pop	ar7
	C$DAC_Control.c$176$2_0$97 ==.
;	DAC_Control.c:176: spi_transfer((value << 4) & 0xF0); // Lower 4 bits + padding
	mov	a,r7
	swap	a
	anl	a,#0xf0
	mov	r7,a
	anl	ar7,#0xf0
	mov	dpl,r7
	lcall	_spi_transfer
00103$:
	C$DAC_Control.c$179$1_0$95 ==.
;	DAC_Control.c:179: SPI_CS = 1;  // Chip Select high
;	assignBit
	setb	_P1_2
	C$DAC_Control.c$180$1_0$95 ==.
;	DAC_Control.c:180: }
	C$DAC_Control.c$180$1_0$95 ==.
	XG$dac_write$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'generate_sin_wave'
;------------------------------------------------------------
;sin_value                 Allocated with name '_generate_sin_wave_sin_value_65536_98'
;------------------------------------------------------------
	G$generate_sin_wave$0$0 ==.
	C$DAC_Control.c$183$1_0$98 ==.
;	DAC_Control.c:183: void generate_sin_wave() {
;	-----------------------------------------
;	 function generate_sin_wave
;	-----------------------------------------
_generate_sin_wave:
	C$DAC_Control.c$184$1_0$98 ==.
;	DAC_Control.c:184: uint8_t sin_value = sin_table[sin_index];
	mov	dptr,#_sin_index
	movx	a,@dptr
	add	a,#_sin_table
	mov	dpl,a
	clr	a
	addc	a,#(_sin_table >> 8)
	mov	dph,a
	movx	a,@dptr
	C$DAC_Control.c$185$1_0$98 ==.
;	DAC_Control.c:185: dac_write(sin_value);
	mov	dpl,a
	lcall	_dac_write
	C$DAC_Control.c$188$1_0$98 ==.
;	DAC_Control.c:188: sin_index++;
	mov	dptr,#_sin_index
	movx	a,@dptr
	inc	a
	movx	@dptr,a
	C$DAC_Control.c$190$1_0$98 ==.
;	DAC_Control.c:190: sin_index = 0;
	C$DAC_Control.c$192$1_0$98 ==.
;	DAC_Control.c:192: }
	C$DAC_Control.c$192$1_0$98 ==.
	XG$generate_sin_wave$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'test_dc_levels'
;------------------------------------------------------------
;test_values               Allocated with name '_test_dc_levels_test_values_65537_102'
;labels                    Allocated with name '_test_dc_levels_labels_65537_102'
;i                         Allocated with name '_test_dc_levels_i_131073_103'
;------------------------------------------------------------
	G$test_dc_levels$0$0 ==.
	C$DAC_Control.c$195$1_0$101 ==.
;	DAC_Control.c:195: void test_dc_levels(void) {
;	-----------------------------------------
;	 function test_dc_levels
;	-----------------------------------------
_test_dc_levels:
	C$DAC_Control.c$196$1_0$101 ==.
;	DAC_Control.c:196: putstr("\n\r----- DC Level Test ----\n\r");
	mov	dptr,#___str_6
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$199$2_0$103 ==.
;	DAC_Control.c:199: uint8_t test_values[] = {0, 64, 128, 192, 255};
	mov	dptr,#_test_dc_levels_test_values_65537_102
	clr	a
	movx	@dptr,a
	mov	dptr,#(_test_dc_levels_test_values_65537_102 + 0x0001)
	mov	a,#0x40
	movx	@dptr,a
	mov	dptr,#(_test_dc_levels_test_values_65537_102 + 0x0002)
	rl	a
	movx	@dptr,a
	mov	dptr,#(_test_dc_levels_test_values_65537_102 + 0x0003)
	mov	a,#0xc0
	movx	@dptr,a
	mov	dptr,#(_test_dc_levels_test_values_65537_102 + 0x0004)
	mov	a,#0xff
	movx	@dptr,a
	C$DAC_Control.c$200$2_0$103 ==.
;	DAC_Control.c:200: char *labels[] = {"0V (0)", "1.25V (64)", "2.5V (128)", "3.75V (192)", "5V (255)"};
	mov	dptr,#_test_dc_levels_labels_65537_102
	mov	a,#___str_1
	movx	@dptr,a
	mov	a,#(___str_1 >> 8)
	inc	dptr
	movx	@dptr,a
	mov	a,#0x80
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_test_dc_levels_labels_65537_102 + 0x0003)
	mov	a,#___str_2
	movx	@dptr,a
	mov	a,#(___str_2 >> 8)
	inc	dptr
	movx	@dptr,a
	mov	a,#0x80
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_test_dc_levels_labels_65537_102 + 0x0006)
	mov	a,#___str_3
	movx	@dptr,a
	mov	a,#(___str_3 >> 8)
	inc	dptr
	movx	@dptr,a
	mov	a,#0x80
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_test_dc_levels_labels_65537_102 + 0x0009)
	mov	a,#___str_4
	movx	@dptr,a
	mov	a,#(___str_4 >> 8)
	inc	dptr
	movx	@dptr,a
	mov	a,#0x80
	inc	dptr
	movx	@dptr,a
	mov	dptr,#(_test_dc_levels_labels_65537_102 + 0x000c)
	mov	a,#___str_5
	movx	@dptr,a
	mov	a,#(___str_5 >> 8)
	inc	dptr
	movx	@dptr,a
	mov	a,#0x80
	inc	dptr
	movx	@dptr,a
	C$DAC_Control.c$202$3_1$104 ==.
;	DAC_Control.c:202: for (uint8_t i = 0; i < 5; i++) {
	mov	r7,#0x00
00103$:
	cjne	r7,#0x05,00116$
00116$:
	jnc	00105$
	C$DAC_Control.c$203$3_1$104 ==.
;	DAC_Control.c:203: printf("Setting Channel A to %s\n\r", labels[i]);
	mov	a,r7
	mov	b,#0x03
	mul	ab
	add	a,#_test_dc_levels_labels_65537_102
	mov	dpl,a
	mov	a,#(_test_dc_levels_labels_65537_102 >> 8)
	addc	a,b
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	push	ar7
	push	ar4
	push	ar5
	push	ar6
	mov	a,#___str_7
	push	acc
	mov	a,#(___str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	pop	ar7
	C$DAC_Control.c$204$3_1$104 ==.
;	DAC_Control.c:204: dac_write(test_values[i]);
	mov	a,r7
	add	a,#_test_dc_levels_test_values_65537_102
	mov	dpl,a
	clr	a
	addc	a,#(_test_dc_levels_test_values_65537_102 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	dpl,a
	push	ar7
	lcall	_dac_write
	C$DAC_Control.c$206$3_1$104 ==.
;	DAC_Control.c:206: putstr("Press a key to do the next value\n\r");
	mov	dptr,#___str_8
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$207$3_1$104 ==.
;	DAC_Control.c:207: getchar();
	lcall	_getchar
	pop	ar7
	C$DAC_Control.c$202$2_1$103 ==.
;	DAC_Control.c:202: for (uint8_t i = 0; i < 5; i++) {
	inc	r7
	sjmp	00103$
00105$:
	C$DAC_Control.c$209$2_1$101 ==.
;	DAC_Control.c:209: }
	C$DAC_Control.c$209$2_1$101 ==.
	XG$test_dc_levels$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'get_number'
;------------------------------------------------------------
;buffer                    Allocated with name '_get_number_buffer_65536_106'
;idx                       Allocated with name '_get_number_idx_65536_106'
;c                         Allocated with name '_get_number_c_65536_106'
;------------------------------------------------------------
	G$get_number$0$0 ==.
	C$DAC_Control.c$211$2_1$106 ==.
;	DAC_Control.c:211: uint16_t get_number(void) {
;	-----------------------------------------
;	 function get_number
;	-----------------------------------------
_get_number:
	C$DAC_Control.c$216$3_0$109 ==.
;	DAC_Control.c:216: while(1) {
	mov	r7,#0x00
00110$:
	C$DAC_Control.c$217$2_0$107 ==.
;	DAC_Control.c:217: c = getchar();
	push	ar7
	lcall	_getchar
	mov	r5,dpl
	mov	r6,dph
	pop	ar7
	C$DAC_Control.c$219$2_0$107 ==.
;	DAC_Control.c:219: if (c == '\r' || c == '\n') {
	cjne	r5,#0x0d,00135$
	sjmp	00105$
00135$:
	cjne	r5,#0x0a,00106$
00105$:
	C$DAC_Control.c$220$3_0$108 ==.
;	DAC_Control.c:220: buffer[idx] = '\0';
	mov	a,r7
	add	a,#_get_number_buffer_65536_106
	mov	dpl,a
	clr	a
	addc	a,#(_get_number_buffer_65536_106 >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
	C$DAC_Control.c$221$3_0$108 ==.
;	DAC_Control.c:221: putstr("\n\r");
	mov	dptr,#___str_9
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$222$3_0$108 ==.
;	DAC_Control.c:222: break;
	sjmp	00111$
00106$:
	C$DAC_Control.c$224$2_0$107 ==.
;	DAC_Control.c:224: else if (c >= '0' && c <= '9' && idx < 3) {
	cjne	r5,#0x30,00138$
00138$:
	jc	00110$
	mov	a,r5
	add	a,#0xff - 0x39
	jc	00110$
	cjne	r7,#0x03,00141$
00141$:
	jnc	00110$
	C$DAC_Control.c$225$3_0$109 ==.
;	DAC_Control.c:225: buffer[idx++] = c;
	mov	a,r7
	add	a,#_get_number_buffer_65536_106
	mov	dpl,a
	clr	a
	addc	a,#(_get_number_buffer_65536_106 >> 8)
	mov	dph,a
	inc	r7
	mov	a,r5
	movx	@dptr,a
	C$DAC_Control.c$226$3_0$109 ==.
;	DAC_Control.c:226: putchar(c);
	mov	r6,#0x00
	mov	dpl,r5
	mov	dph,r6
	push	ar7
	lcall	_putchar
	pop	ar7
	sjmp	00110$
00111$:
	C$DAC_Control.c$230$1_0$106 ==.
;	DAC_Control.c:230: return atoi(buffer);
	mov	dptr,#_get_number_buffer_65536_106
	mov	b,#0x00
	lcall	_atoi
	C$DAC_Control.c$231$1_0$106 ==.
;	DAC_Control.c:231: }
	C$DAC_Control.c$231$1_0$106 ==.
	XG$get_number$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'manual_dac_control'
;------------------------------------------------------------
;value                     Allocated with name '_manual_dac_control_value_65537_112'
;------------------------------------------------------------
	G$manual_dac_control$0$0 ==.
	C$DAC_Control.c$233$1_0$111 ==.
;	DAC_Control.c:233: void manual_dac_control(void) {
;	-----------------------------------------
;	 function manual_dac_control
;	-----------------------------------------
_manual_dac_control:
	C$DAC_Control.c$235$1_0$111 ==.
;	DAC_Control.c:235: putstr("Enter DAC value (0-255): ");
	mov	dptr,#___str_10
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$236$1_1$112 ==.
;	DAC_Control.c:236: uint16_t value = get_number();
	lcall	_get_number
	mov	r6,dpl
	mov	r7,dph
	C$DAC_Control.c$238$1_1$112 ==.
;	DAC_Control.c:238: if (value > 255) {
	mov	ar4,r6
	mov	ar5,r7
	clr	c
	mov	a,#0xff
	subb	a,r4
	clr	a
	subb	a,r5
	jnc	00102$
	C$DAC_Control.c$239$2_1$113 ==.
;	DAC_Control.c:239: putstr("Error: Value must be 0-255\n\r");
	mov	dptr,#___str_11
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$240$2_1$113 ==.
;	DAC_Control.c:240: return;
	sjmp	00103$
00102$:
	C$DAC_Control.c$243$1_1$112 ==.
;	DAC_Control.c:243: dac_write((uint8_t)value);
	mov	dpl,r6
	push	ar6
	lcall	_dac_write
	C$DAC_Control.c$245$1_1$112 ==.
;	DAC_Control.c:245: (uint8_t)value);
	mov	r7,#0x00
	C$DAC_Control.c$244$1_1$112 ==.
;	DAC_Control.c:244: printf("Channel A set to %d\n\r", 
	push	ar7
	mov	a,#___str_12
	push	acc
	mov	a,#(___str_12 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
00103$:
	C$DAC_Control.c$246$1_1$111 ==.
;	DAC_Control.c:246: }
	C$DAC_Control.c$246$1_1$111 ==.
	XG$manual_dac_control$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'print_menu'
;------------------------------------------------------------
	G$print_menu$0$0 ==.
	C$DAC_Control.c$249$1_1$115 ==.
;	DAC_Control.c:249: void print_menu(void) {
;	-----------------------------------------
;	 function print_menu
;	-----------------------------------------
_print_menu:
	C$DAC_Control.c$250$1_0$115 ==.
;	DAC_Control.c:250: putstr("\n\r");
	mov	dptr,#___str_9
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$251$1_0$115 ==.
;	DAC_Control.c:251: putstr("Here's everything you can do: \n\r");
	mov	dptr,#___str_13
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$252$1_0$115 ==.
;	DAC_Control.c:252: putstr("1. Test DC Levels\n\r");
	mov	dptr,#___str_14
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$253$1_0$115 ==.
;	DAC_Control.c:253: putstr("2. sin Wave\n\r");
	mov	dptr,#___str_15
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$254$1_0$115 ==.
;	DAC_Control.c:254: putstr("3. Manual DAC Value\n\r");
	mov	dptr,#___str_16
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$255$1_0$115 ==.
;	DAC_Control.c:255: putstr("4. Toggle Bit-Bang Mode\n\r");
	mov	dptr,#___str_17
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$256$1_0$115 ==.
;	DAC_Control.c:256: putstr("h. Help (show this menu)\n\r");
	mov	dptr,#___str_18
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$257$1_0$115 ==.
;	DAC_Control.c:257: putstr("----------------------------------------\n\r");
	mov	dptr,#___str_19
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$258$1_0$115 ==.
;	DAC_Control.c:258: }
	C$DAC_Control.c$258$1_0$115 ==.
	XG$print_menu$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;choice                    Allocated with name '_main_choice_65536_117'
;i                         Allocated with name '_main_i_327680_121'
;------------------------------------------------------------
	G$main$0$0 ==.
	C$DAC_Control.c$261$1_0$117 ==.
;	DAC_Control.c:261: int main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	C$DAC_Control.c$264$1_0$117 ==.
;	DAC_Control.c:264: spi_init();
	lcall	_spi_init
	C$DAC_Control.c$265$1_0$117 ==.
;	DAC_Control.c:265: generate_sin_table(sin_table, 256);
	mov	dptr,#_generate_sin_table_PARM_2
	clr	a
	movx	@dptr,a
	inc	a
	inc	dptr
	movx	@dptr,a
	mov	dptr,#_sin_table
	mov	b,#0x00
	lcall	_generate_sin_table
	C$DAC_Control.c$266$1_0$117 ==.
;	DAC_Control.c:266: print_menu();
	lcall	_print_menu
	C$DAC_Control.c$268$1_0$117 ==.
;	DAC_Control.c:268: while (1) {
00117$:
	C$DAC_Control.c$269$2_0$118 ==.
;	DAC_Control.c:269: putstr("\nEnter choice: ");
	mov	dptr,#___str_20
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$270$2_0$118 ==.
;	DAC_Control.c:270: choice = getchar();
	lcall	_getchar
	mov	r6,dpl
	C$DAC_Control.c$271$2_0$118 ==.
;	DAC_Control.c:271: putchar(choice);
	mov	ar5,r6
	mov	r7,#0x00
	mov	dpl,r5
	mov	dph,r7
	push	ar6
	lcall	_putchar
	C$DAC_Control.c$272$2_0$118 ==.
;	DAC_Control.c:272: putstr("\n\r");
	mov	dptr,#___str_9
	mov	b,#0x80
	lcall	_putstr
	pop	ar6
	C$DAC_Control.c$274$2_0$118 ==.
;	DAC_Control.c:274: switch (choice) {
	cjne	r6,#0x31,00178$
	sjmp	00101$
00178$:
	cjne	r6,#0x32,00179$
	sjmp	00102$
00179$:
	cjne	r6,#0x33,00180$
	ljmp	00107$
00180$:
	cjne	r6,#0x34,00181$
	ljmp	00108$
00181$:
	cjne	r6,#0x48,00182$
	ljmp	00113$
00182$:
	cjne	r6,#0x68,00183$
	ljmp	00113$
00183$:
	ljmp	00114$
	C$DAC_Control.c$275$3_0$119 ==.
;	DAC_Control.c:275: case '1':
00101$:
	C$DAC_Control.c$276$3_0$119 ==.
;	DAC_Control.c:276: test_dc_levels();
	lcall	_test_dc_levels
	C$DAC_Control.c$277$3_0$119 ==.
;	DAC_Control.c:277: break;
	C$DAC_Control.c$279$3_0$119 ==.
;	DAC_Control.c:279: case '2':
	sjmp	00117$
00102$:
	C$DAC_Control.c$280$3_0$119 ==.
;	DAC_Control.c:280: putstr("Put any char to stop the sin wave \n\r");
	mov	dptr,#___str_21
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$281$3_0$119 ==.
;	DAC_Control.c:281: while (!RI) {
00104$:
	jb	_RI,00106$
	C$DAC_Control.c$282$4_0$120 ==.
;	DAC_Control.c:282: generate_sin_wave();
	lcall	_generate_sin_wave
	C$DAC_Control.c$284$6_0$121 ==.
;	DAC_Control.c:284: for (volatile uint16_t i = 0; i < (1200 / wave_frequency); i++);
	mov	dptr,#_main_i_327680_121
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
00120$:
	mov	dptr,#_wave_frequency
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#__divuint_PARM_2
	mov	a,r6
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	mov	dptr,#0x04b0
	lcall	__divuint
	mov	r6,dpl
	mov	r7,dph
	mov	dptr,#_main_i_327680_121
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	clr	c
	mov	a,r4
	subb	a,r6
	mov	a,r5
	subb	a,r7
	jnc	00104$
	mov	dptr,#_main_i_327680_121
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_main_i_327680_121
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
	sjmp	00120$
00106$:
	C$DAC_Control.c$286$3_0$119 ==.
;	DAC_Control.c:286: getchar(); // Clear the input buffer
	lcall	_getchar
	C$DAC_Control.c$287$3_0$119 ==.
;	DAC_Control.c:287: putstr("sin wave stopped\n\r");
	mov	dptr,#___str_22
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$288$3_0$119 ==.
;	DAC_Control.c:288: break;
	ljmp	00117$
	C$DAC_Control.c$290$3_0$119 ==.
;	DAC_Control.c:290: case '3':
00107$:
	C$DAC_Control.c$291$3_0$119 ==.
;	DAC_Control.c:291: manual_dac_control();
	lcall	_manual_dac_control
	C$DAC_Control.c$292$3_0$119 ==.
;	DAC_Control.c:292: break;
	ljmp	00117$
	C$DAC_Control.c$294$3_0$119 ==.
;	DAC_Control.c:294: case '4':
00108$:
	C$DAC_Control.c$295$3_0$119 ==.
;	DAC_Control.c:295: bit_bang_mode = !bit_bang_mode;
	mov	dptr,#_bit_bang_mode
	movx	a,@dptr
	cjne	a,#0x01,00186$
00186$:
	clr	a
	rlc	a
	movx	@dptr,a
	C$DAC_Control.c$296$3_0$119 ==.
;	DAC_Control.c:296: if (bit_bang_mode) {
	mov	dptr,#_bit_bang_mode
	movx	a,@dptr
	jz	00110$
	C$DAC_Control.c$297$4_0$122 ==.
;	DAC_Control.c:297: spi_deinit(); // Disable hardware SPI
	lcall	_spi_deinit
	sjmp	00111$
00110$:
	C$DAC_Control.c$299$4_0$123 ==.
;	DAC_Control.c:299: spi_init(); // Re-enable hardware SPI
	lcall	_spi_init
00111$:
	C$DAC_Control.c$301$3_0$119 ==.
;	DAC_Control.c:301: printf("Bit-Bang Mode %s\n\r", bit_bang_mode ? "Enabled" : "Disabled");
	mov	dptr,#_bit_bang_mode
	movx	a,@dptr
	jz	00124$
	mov	r6,#___str_24
	mov	r7,#(___str_24 >> 8)
	sjmp	00125$
00124$:
	mov	r6,#___str_25
	mov	r7,#(___str_25 >> 8)
00125$:
	mov	r5,#0x80
	push	ar6
	push	ar7
	push	ar5
	mov	a,#___str_23
	push	acc
	mov	a,#(___str_23 >> 8)
	push	acc
	mov	a,r5
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	C$DAC_Control.c$302$3_0$119 ==.
;	DAC_Control.c:302: break;
	ljmp	00117$
	C$DAC_Control.c$305$3_0$119 ==.
;	DAC_Control.c:305: case 'H':
00113$:
	C$DAC_Control.c$306$3_0$119 ==.
;	DAC_Control.c:306: print_menu();
	lcall	_print_menu
	C$DAC_Control.c$307$3_0$119 ==.
;	DAC_Control.c:307: break;
	ljmp	00117$
	C$DAC_Control.c$309$3_0$119 ==.
;	DAC_Control.c:309: default:
00114$:
	C$DAC_Control.c$310$3_0$119 ==.
;	DAC_Control.c:310: putstr("Invalid choice. Press 'h' for help.\n\r");
	mov	dptr,#___str_26
	mov	b,#0x80
	lcall	_putstr
	C$DAC_Control.c$312$1_0$117 ==.
;	DAC_Control.c:312: }
	ljmp	00117$
	C$DAC_Control.c$315$1_0$117 ==.
;	DAC_Control.c:315: return 0;
	C$DAC_Control.c$316$1_0$117 ==.
;	DAC_Control.c:316: }
	C$DAC_Control.c$316$1_0$117 ==.
	XG$main$0$0 ==.
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
FDAC_Control$__str_0$0_0$0 == .
	.area CONST   (CODE)
___str_0:
	.ascii "SPI Controller Initialized"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_1$0_0$0 == .
	.area CONST   (CODE)
___str_1:
	.ascii "0V (0)"
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_2$0_0$0 == .
	.area CONST   (CODE)
___str_2:
	.ascii "1.25V (64)"
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_3$0_0$0 == .
	.area CONST   (CODE)
___str_3:
	.ascii "2.5V (128)"
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_4$0_0$0 == .
	.area CONST   (CODE)
___str_4:
	.ascii "3.75V (192)"
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_5$0_0$0 == .
	.area CONST   (CODE)
___str_5:
	.ascii "5V (255)"
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_6$0_0$0 == .
	.area CONST   (CODE)
___str_6:
	.db 0x0a
	.db 0x0d
	.ascii "----- DC Level Test ----"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_7$0_0$0 == .
	.area CONST   (CODE)
___str_7:
	.ascii "Setting Channel A to %s"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_8$0_0$0 == .
	.area CONST   (CODE)
___str_8:
	.ascii "Press a key to do the next value"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_9$0_0$0 == .
	.area CONST   (CODE)
___str_9:
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_10$0_0$0 == .
	.area CONST   (CODE)
___str_10:
	.ascii "Enter DAC value (0-255): "
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_11$0_0$0 == .
	.area CONST   (CODE)
___str_11:
	.ascii "Error: Value must be 0-255"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_12$0_0$0 == .
	.area CONST   (CODE)
___str_12:
	.ascii "Channel A set to %d"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_13$0_0$0 == .
	.area CONST   (CODE)
___str_13:
	.ascii "Here's everything you can do: "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_14$0_0$0 == .
	.area CONST   (CODE)
___str_14:
	.ascii "1. Test DC Levels"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_15$0_0$0 == .
	.area CONST   (CODE)
___str_15:
	.ascii "2. sin Wave"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_16$0_0$0 == .
	.area CONST   (CODE)
___str_16:
	.ascii "3. Manual DAC Value"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_17$0_0$0 == .
	.area CONST   (CODE)
___str_17:
	.ascii "4. Toggle Bit-Bang Mode"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_18$0_0$0 == .
	.area CONST   (CODE)
___str_18:
	.ascii "h. Help (show this menu)"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_19$0_0$0 == .
	.area CONST   (CODE)
___str_19:
	.ascii "----------------------------------------"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_20$0_0$0 == .
	.area CONST   (CODE)
___str_20:
	.db 0x0a
	.ascii "Enter choice: "
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_21$0_0$0 == .
	.area CONST   (CODE)
___str_21:
	.ascii "Put any char to stop the sin wave "
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_22$0_0$0 == .
	.area CONST   (CODE)
___str_22:
	.ascii "sin wave stopped"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_23$0_0$0 == .
	.area CONST   (CODE)
___str_23:
	.ascii "Bit-Bang Mode %s"
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_24$0_0$0 == .
	.area CONST   (CODE)
___str_24:
	.ascii "Enabled"
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_25$0_0$0 == .
	.area CONST   (CODE)
___str_25:
	.ascii "Disabled"
	.db 0x00
	.area CSEG    (CODE)
FDAC_Control$__str_26$0_0$0 == .
	.area CONST   (CODE)
___str_26:
	.ascii "Invalid choice. Press 'h' for help."
	.db 0x0a
	.db 0x0d
	.db 0x00
	.area CSEG    (CODE)
	.area XINIT   (CODE)
FDAC_Control$__xinit_sin_index$0_0$0 == .
__xinit__sin_index:
	.db #0x00	; 0
FDAC_Control$__xinit_wave_frequency$0_0$0 == .
__xinit__wave_frequency:
	.byte #0x64, #0x00	; 100
FDAC_Control$__xinit_bit_bang_mode$0_0$0 == .
__xinit__bit_bang_mode:
	.db #0x00	;  0
	.area CABS    (ABS,CODE)
