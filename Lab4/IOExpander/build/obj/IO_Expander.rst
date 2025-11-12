                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module IO_Expander
                                      6 	.optsdcc -mmcs51 --model-large
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _int0_isr
                                     13 	.globl _init_INT0_interrupt
                                     14 	.globl _set_P0_out
                                     15 	.globl _PCF8574A_init
                                     16 	.globl _PCF8574A_read
                                     17 	.globl _PCF8574A_write
                                     18 	.globl _get_user_input
                                     19 	.globl _print_hex_dump_line
                                     20 	.globl _simple_hex_to_int
                                     21 	.globl _print_newline
                                     22 	.globl _putstr_green
                                     23 	.globl _putstr_blue
                                     24 	.globl _putchar_blue
                                     25 	.globl _putstr
                                     26 	.globl _puts
                                     27 	.globl _printf
                                     28 	.globl _CY
                                     29 	.globl _AC
                                     30 	.globl _F0
                                     31 	.globl _RS1
                                     32 	.globl _RS0
                                     33 	.globl _OV
                                     34 	.globl _F1
                                     35 	.globl _P
                                     36 	.globl _PS
                                     37 	.globl _PT1
                                     38 	.globl _PX1
                                     39 	.globl _PT0
                                     40 	.globl _PX0
                                     41 	.globl _RD
                                     42 	.globl _WR
                                     43 	.globl _T1
                                     44 	.globl _T0
                                     45 	.globl _INT1
                                     46 	.globl _INT0
                                     47 	.globl _TXD
                                     48 	.globl _RXD
                                     49 	.globl _P3_7
                                     50 	.globl _P3_6
                                     51 	.globl _P3_5
                                     52 	.globl _P3_4
                                     53 	.globl _P3_3
                                     54 	.globl _P3_2
                                     55 	.globl _P3_1
                                     56 	.globl _P3_0
                                     57 	.globl _EA
                                     58 	.globl _ES
                                     59 	.globl _ET1
                                     60 	.globl _EX1
                                     61 	.globl _ET0
                                     62 	.globl _EX0
                                     63 	.globl _P2_7
                                     64 	.globl _P2_6
                                     65 	.globl _P2_5
                                     66 	.globl _P2_4
                                     67 	.globl _P2_3
                                     68 	.globl _P2_2
                                     69 	.globl _P2_1
                                     70 	.globl _P2_0
                                     71 	.globl _SM0
                                     72 	.globl _SM1
                                     73 	.globl _SM2
                                     74 	.globl _REN
                                     75 	.globl _TB8
                                     76 	.globl _RB8
                                     77 	.globl _TI
                                     78 	.globl _RI
                                     79 	.globl _P1_7
                                     80 	.globl _P1_6
                                     81 	.globl _P1_5
                                     82 	.globl _P1_4
                                     83 	.globl _P1_3
                                     84 	.globl _P1_2
                                     85 	.globl _P1_1
                                     86 	.globl _P1_0
                                     87 	.globl _TF1
                                     88 	.globl _TR1
                                     89 	.globl _TF0
                                     90 	.globl _TR0
                                     91 	.globl _IE1
                                     92 	.globl _IT1
                                     93 	.globl _IE0
                                     94 	.globl _IT0
                                     95 	.globl _P0_7
                                     96 	.globl _P0_6
                                     97 	.globl _P0_5
                                     98 	.globl _P0_4
                                     99 	.globl _P0_3
                                    100 	.globl _P0_2
                                    101 	.globl _P0_1
                                    102 	.globl _P0_0
                                    103 	.globl _B
                                    104 	.globl _ACC
                                    105 	.globl _PSW
                                    106 	.globl _IP
                                    107 	.globl _P3
                                    108 	.globl _IE
                                    109 	.globl _P2
                                    110 	.globl _SBUF
                                    111 	.globl _SCON
                                    112 	.globl _P1
                                    113 	.globl _TH1
                                    114 	.globl _TH0
                                    115 	.globl _TL1
                                    116 	.globl _TL0
                                    117 	.globl _TMOD
                                    118 	.globl _TCON
                                    119 	.globl _PCON
                                    120 	.globl _DPH
                                    121 	.globl _DPL
                                    122 	.globl _SP
                                    123 	.globl _P0
                                    124 	.globl _io_link
                                    125 	.globl _PCF8574A_input_state
                                    126 	.globl _IO_Expander_port_state
                                    127 	.globl _get_user_input_PARM_2
                                    128 	.globl _print_hex_dump_line_PARM_3
                                    129 	.globl _print_hex_dump_line_PARM_2
                                    130 	.globl _putchar
                                    131 	.globl _getchar
                                    132 	.globl _show_menu
                                    133 	.globl _write_byte_menu
                                    134 	.globl _read_byte_menu
                                    135 	.globl _hex_dump_menu
                                    136 	.globl _reset_eeprom_menu
                                    137 	.globl _eeprom_init
                                    138 	.globl _TEST
                                    139 	.globl _BYTEW
                                    140 	.globl _BYTERD
                                    141 	.globl _ACKTST
                                    142 	.globl _OUTS
                                    143 	.globl _OUT
                                    144 	.globl _STOP
                                    145 	.globl _CREAD
                                    146 	.globl _IN
                                    147 	.globl _eereset
                                    148 ;--------------------------------------------------------
                                    149 ; special function registers
                                    150 ;--------------------------------------------------------
                                    151 	.area RSEG    (ABS,DATA)
      000000                        152 	.org 0x0000
                           000080   153 G$P0$0_0$0 == 0x0080
                           000080   154 _P0	=	0x0080
                           000081   155 G$SP$0_0$0 == 0x0081
                           000081   156 _SP	=	0x0081
                           000082   157 G$DPL$0_0$0 == 0x0082
                           000082   158 _DPL	=	0x0082
                           000083   159 G$DPH$0_0$0 == 0x0083
                           000083   160 _DPH	=	0x0083
                           000087   161 G$PCON$0_0$0 == 0x0087
                           000087   162 _PCON	=	0x0087
                           000088   163 G$TCON$0_0$0 == 0x0088
                           000088   164 _TCON	=	0x0088
                           000089   165 G$TMOD$0_0$0 == 0x0089
                           000089   166 _TMOD	=	0x0089
                           00008A   167 G$TL0$0_0$0 == 0x008a
                           00008A   168 _TL0	=	0x008a
                           00008B   169 G$TL1$0_0$0 == 0x008b
                           00008B   170 _TL1	=	0x008b
                           00008C   171 G$TH0$0_0$0 == 0x008c
                           00008C   172 _TH0	=	0x008c
                           00008D   173 G$TH1$0_0$0 == 0x008d
                           00008D   174 _TH1	=	0x008d
                           000090   175 G$P1$0_0$0 == 0x0090
                           000090   176 _P1	=	0x0090
                           000098   177 G$SCON$0_0$0 == 0x0098
                           000098   178 _SCON	=	0x0098
                           000099   179 G$SBUF$0_0$0 == 0x0099
                           000099   180 _SBUF	=	0x0099
                           0000A0   181 G$P2$0_0$0 == 0x00a0
                           0000A0   182 _P2	=	0x00a0
                           0000A8   183 G$IE$0_0$0 == 0x00a8
                           0000A8   184 _IE	=	0x00a8
                           0000B0   185 G$P3$0_0$0 == 0x00b0
                           0000B0   186 _P3	=	0x00b0
                           0000B8   187 G$IP$0_0$0 == 0x00b8
                           0000B8   188 _IP	=	0x00b8
                           0000D0   189 G$PSW$0_0$0 == 0x00d0
                           0000D0   190 _PSW	=	0x00d0
                           0000E0   191 G$ACC$0_0$0 == 0x00e0
                           0000E0   192 _ACC	=	0x00e0
                           0000F0   193 G$B$0_0$0 == 0x00f0
                           0000F0   194 _B	=	0x00f0
                                    195 ;--------------------------------------------------------
                                    196 ; special function bits
                                    197 ;--------------------------------------------------------
                                    198 	.area RSEG    (ABS,DATA)
      000000                        199 	.org 0x0000
                           000080   200 G$P0_0$0_0$0 == 0x0080
                           000080   201 _P0_0	=	0x0080
                           000081   202 G$P0_1$0_0$0 == 0x0081
                           000081   203 _P0_1	=	0x0081
                           000082   204 G$P0_2$0_0$0 == 0x0082
                           000082   205 _P0_2	=	0x0082
                           000083   206 G$P0_3$0_0$0 == 0x0083
                           000083   207 _P0_3	=	0x0083
                           000084   208 G$P0_4$0_0$0 == 0x0084
                           000084   209 _P0_4	=	0x0084
                           000085   210 G$P0_5$0_0$0 == 0x0085
                           000085   211 _P0_5	=	0x0085
                           000086   212 G$P0_6$0_0$0 == 0x0086
                           000086   213 _P0_6	=	0x0086
                           000087   214 G$P0_7$0_0$0 == 0x0087
                           000087   215 _P0_7	=	0x0087
                           000088   216 G$IT0$0_0$0 == 0x0088
                           000088   217 _IT0	=	0x0088
                           000089   218 G$IE0$0_0$0 == 0x0089
                           000089   219 _IE0	=	0x0089
                           00008A   220 G$IT1$0_0$0 == 0x008a
                           00008A   221 _IT1	=	0x008a
                           00008B   222 G$IE1$0_0$0 == 0x008b
                           00008B   223 _IE1	=	0x008b
                           00008C   224 G$TR0$0_0$0 == 0x008c
                           00008C   225 _TR0	=	0x008c
                           00008D   226 G$TF0$0_0$0 == 0x008d
                           00008D   227 _TF0	=	0x008d
                           00008E   228 G$TR1$0_0$0 == 0x008e
                           00008E   229 _TR1	=	0x008e
                           00008F   230 G$TF1$0_0$0 == 0x008f
                           00008F   231 _TF1	=	0x008f
                           000090   232 G$P1_0$0_0$0 == 0x0090
                           000090   233 _P1_0	=	0x0090
                           000091   234 G$P1_1$0_0$0 == 0x0091
                           000091   235 _P1_1	=	0x0091
                           000092   236 G$P1_2$0_0$0 == 0x0092
                           000092   237 _P1_2	=	0x0092
                           000093   238 G$P1_3$0_0$0 == 0x0093
                           000093   239 _P1_3	=	0x0093
                           000094   240 G$P1_4$0_0$0 == 0x0094
                           000094   241 _P1_4	=	0x0094
                           000095   242 G$P1_5$0_0$0 == 0x0095
                           000095   243 _P1_5	=	0x0095
                           000096   244 G$P1_6$0_0$0 == 0x0096
                           000096   245 _P1_6	=	0x0096
                           000097   246 G$P1_7$0_0$0 == 0x0097
                           000097   247 _P1_7	=	0x0097
                           000098   248 G$RI$0_0$0 == 0x0098
                           000098   249 _RI	=	0x0098
                           000099   250 G$TI$0_0$0 == 0x0099
                           000099   251 _TI	=	0x0099
                           00009A   252 G$RB8$0_0$0 == 0x009a
                           00009A   253 _RB8	=	0x009a
                           00009B   254 G$TB8$0_0$0 == 0x009b
                           00009B   255 _TB8	=	0x009b
                           00009C   256 G$REN$0_0$0 == 0x009c
                           00009C   257 _REN	=	0x009c
                           00009D   258 G$SM2$0_0$0 == 0x009d
                           00009D   259 _SM2	=	0x009d
                           00009E   260 G$SM1$0_0$0 == 0x009e
                           00009E   261 _SM1	=	0x009e
                           00009F   262 G$SM0$0_0$0 == 0x009f
                           00009F   263 _SM0	=	0x009f
                           0000A0   264 G$P2_0$0_0$0 == 0x00a0
                           0000A0   265 _P2_0	=	0x00a0
                           0000A1   266 G$P2_1$0_0$0 == 0x00a1
                           0000A1   267 _P2_1	=	0x00a1
                           0000A2   268 G$P2_2$0_0$0 == 0x00a2
                           0000A2   269 _P2_2	=	0x00a2
                           0000A3   270 G$P2_3$0_0$0 == 0x00a3
                           0000A3   271 _P2_3	=	0x00a3
                           0000A4   272 G$P2_4$0_0$0 == 0x00a4
                           0000A4   273 _P2_4	=	0x00a4
                           0000A5   274 G$P2_5$0_0$0 == 0x00a5
                           0000A5   275 _P2_5	=	0x00a5
                           0000A6   276 G$P2_6$0_0$0 == 0x00a6
                           0000A6   277 _P2_6	=	0x00a6
                           0000A7   278 G$P2_7$0_0$0 == 0x00a7
                           0000A7   279 _P2_7	=	0x00a7
                           0000A8   280 G$EX0$0_0$0 == 0x00a8
                           0000A8   281 _EX0	=	0x00a8
                           0000A9   282 G$ET0$0_0$0 == 0x00a9
                           0000A9   283 _ET0	=	0x00a9
                           0000AA   284 G$EX1$0_0$0 == 0x00aa
                           0000AA   285 _EX1	=	0x00aa
                           0000AB   286 G$ET1$0_0$0 == 0x00ab
                           0000AB   287 _ET1	=	0x00ab
                           0000AC   288 G$ES$0_0$0 == 0x00ac
                           0000AC   289 _ES	=	0x00ac
                           0000AF   290 G$EA$0_0$0 == 0x00af
                           0000AF   291 _EA	=	0x00af
                           0000B0   292 G$P3_0$0_0$0 == 0x00b0
                           0000B0   293 _P3_0	=	0x00b0
                           0000B1   294 G$P3_1$0_0$0 == 0x00b1
                           0000B1   295 _P3_1	=	0x00b1
                           0000B2   296 G$P3_2$0_0$0 == 0x00b2
                           0000B2   297 _P3_2	=	0x00b2
                           0000B3   298 G$P3_3$0_0$0 == 0x00b3
                           0000B3   299 _P3_3	=	0x00b3
                           0000B4   300 G$P3_4$0_0$0 == 0x00b4
                           0000B4   301 _P3_4	=	0x00b4
                           0000B5   302 G$P3_5$0_0$0 == 0x00b5
                           0000B5   303 _P3_5	=	0x00b5
                           0000B6   304 G$P3_6$0_0$0 == 0x00b6
                           0000B6   305 _P3_6	=	0x00b6
                           0000B7   306 G$P3_7$0_0$0 == 0x00b7
                           0000B7   307 _P3_7	=	0x00b7
                           0000B0   308 G$RXD$0_0$0 == 0x00b0
                           0000B0   309 _RXD	=	0x00b0
                           0000B1   310 G$TXD$0_0$0 == 0x00b1
                           0000B1   311 _TXD	=	0x00b1
                           0000B2   312 G$INT0$0_0$0 == 0x00b2
                           0000B2   313 _INT0	=	0x00b2
                           0000B3   314 G$INT1$0_0$0 == 0x00b3
                           0000B3   315 _INT1	=	0x00b3
                           0000B4   316 G$T0$0_0$0 == 0x00b4
                           0000B4   317 _T0	=	0x00b4
                           0000B5   318 G$T1$0_0$0 == 0x00b5
                           0000B5   319 _T1	=	0x00b5
                           0000B6   320 G$WR$0_0$0 == 0x00b6
                           0000B6   321 _WR	=	0x00b6
                           0000B7   322 G$RD$0_0$0 == 0x00b7
                           0000B7   323 _RD	=	0x00b7
                           0000B8   324 G$PX0$0_0$0 == 0x00b8
                           0000B8   325 _PX0	=	0x00b8
                           0000B9   326 G$PT0$0_0$0 == 0x00b9
                           0000B9   327 _PT0	=	0x00b9
                           0000BA   328 G$PX1$0_0$0 == 0x00ba
                           0000BA   329 _PX1	=	0x00ba
                           0000BB   330 G$PT1$0_0$0 == 0x00bb
                           0000BB   331 _PT1	=	0x00bb
                           0000BC   332 G$PS$0_0$0 == 0x00bc
                           0000BC   333 _PS	=	0x00bc
                           0000D0   334 G$P$0_0$0 == 0x00d0
                           0000D0   335 _P	=	0x00d0
                           0000D1   336 G$F1$0_0$0 == 0x00d1
                           0000D1   337 _F1	=	0x00d1
                           0000D2   338 G$OV$0_0$0 == 0x00d2
                           0000D2   339 _OV	=	0x00d2
                           0000D3   340 G$RS0$0_0$0 == 0x00d3
                           0000D3   341 _RS0	=	0x00d3
                           0000D4   342 G$RS1$0_0$0 == 0x00d4
                           0000D4   343 _RS1	=	0x00d4
                           0000D5   344 G$F0$0_0$0 == 0x00d5
                           0000D5   345 _F0	=	0x00d5
                           0000D6   346 G$AC$0_0$0 == 0x00d6
                           0000D6   347 _AC	=	0x00d6
                           0000D7   348 G$CY$0_0$0 == 0x00d7
                           0000D7   349 _CY	=	0x00d7
                                    350 ;--------------------------------------------------------
                                    351 ; overlayable register banks
                                    352 ;--------------------------------------------------------
                                    353 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        354 	.ds 8
                                    355 ;--------------------------------------------------------
                                    356 ; overlayable bit register bank
                                    357 ;--------------------------------------------------------
                                    358 	.area BIT_BANK	(REL,OVR,DATA)
      000021                        359 bits:
      000021                        360 	.ds 1
                           008000   361 	b0 = bits[0]
                           008100   362 	b1 = bits[1]
                           008200   363 	b2 = bits[2]
                           008300   364 	b3 = bits[3]
                           008400   365 	b4 = bits[4]
                           008500   366 	b5 = bits[5]
                           008600   367 	b6 = bits[6]
                           008700   368 	b7 = bits[7]
                                    369 ;--------------------------------------------------------
                                    370 ; internal ram data
                                    371 ;--------------------------------------------------------
                                    372 	.area DSEG    (DATA)
                           000000   373 FIO_Expander$ret_byte$0_0$0==.
      000008                        374 _ret_byte:
      000008                        375 	.ds 1
                           000001   376 FIO_Expander$device_addr$0_0$0==.
      000009                        377 _device_addr:
      000009                        378 	.ds 1
                           000002   379 FIO_Expander$addr_low$0_0$0==.
      00000A                        380 _addr_low:
      00000A                        381 	.ds 1
                           000003   382 FIO_Expander$asm_data$0_0$0==.
      00000B                        383 _asm_data:
      00000B                        384 	.ds 1
                           000004   385 FIO_Expander$asm_result$0_0$0==.
      00000C                        386 _asm_result:
      00000C                        387 	.ds 1
                           000005   388 LIO_Expander.hex_dump_menu$sloc0$0_1$0==.
      00000D                        389 _hex_dump_menu_sloc0_1_0:
      00000D                        390 	.ds 2
                           000007   391 LIO_Expander.hex_dump_menu$sloc1$0_1$0==.
      00000F                        392 _hex_dump_menu_sloc1_1_0:
      00000F                        393 	.ds 2
                                    394 ;--------------------------------------------------------
                                    395 ; overlayable items in internal ram
                                    396 ;--------------------------------------------------------
                                    397 ;--------------------------------------------------------
                                    398 ; Stack segment in internal ram
                                    399 ;--------------------------------------------------------
                                    400 	.area	SSEG
      000022                        401 __start__stack:
      000022                        402 	.ds	1
                                    403 
                                    404 ;--------------------------------------------------------
                                    405 ; indirectly addressable internal ram data
                                    406 ;--------------------------------------------------------
                                    407 	.area ISEG    (DATA)
                                    408 ;--------------------------------------------------------
                                    409 ; absolute internal ram data
                                    410 ;--------------------------------------------------------
                                    411 	.area IABS    (ABS,DATA)
                                    412 	.area IABS    (ABS,DATA)
                                    413 ;--------------------------------------------------------
                                    414 ; bit data
                                    415 ;--------------------------------------------------------
                                    416 	.area BSEG    (BIT)
                           000000   417 LIO_Expander.int0_isr$sloc0$0_1$0==.
      000000                        418 _int0_isr_sloc0_1_0:
      000000                        419 	.ds 1
                           000001   420 LIO_Expander.main$sloc0$0_1$0==.
      000001                        421 _main_sloc0_1_0:
      000001                        422 	.ds 1
                                    423 ;--------------------------------------------------------
                                    424 ; paged external ram data
                                    425 ;--------------------------------------------------------
                                    426 	.area PSEG    (PAG,XDATA)
                                    427 ;--------------------------------------------------------
                                    428 ; external ram data
                                    429 ;--------------------------------------------------------
                                    430 	.area XSEG    (XDATA)
                           000000   431 LIO_Expander.putchar$c$1_0$71==.
      000400                        432 _putchar_c_65536_71:
      000400                        433 	.ds 2
                           000002   434 LIO_Expander.putstr$s$1_0$75==.
      000402                        435 _putstr_s_65536_75:
      000402                        436 	.ds 3
                           000005   437 LIO_Expander.putchar_blue$c$1_0$78==.
      000405                        438 _putchar_blue_c_65536_78:
      000405                        439 	.ds 2
                           000007   440 LIO_Expander.putstr_blue$s$1_0$80==.
      000407                        441 _putstr_blue_s_65536_80:
      000407                        442 	.ds 3
                           00000A   443 LIO_Expander.putstr_green$s$1_0$82==.
      00040A                        444 _putstr_green_s_65536_82:
      00040A                        445 	.ds 3
                           00000D   446 LIO_Expander.simple_hex_to_int$hex_str$1_0$86==.
      00040D                        447 _simple_hex_to_int_hex_str_65536_86:
      00040D                        448 	.ds 3
                           000010   449 LIO_Expander.simple_hex_to_int$result$1_0$87==.
      000410                        450 _simple_hex_to_int_result_65536_87:
      000410                        451 	.ds 2
                           000012   452 LIO_Expander.print_hex_dump_line$data$1_0$93==.
      000412                        453 _print_hex_dump_line_PARM_2:
      000412                        454 	.ds 3
                           000015   455 LIO_Expander.print_hex_dump_line$count$1_0$93==.
      000415                        456 _print_hex_dump_line_PARM_3:
      000415                        457 	.ds 1
                           000016   458 LIO_Expander.print_hex_dump_line$address$1_0$93==.
      000416                        459 _print_hex_dump_line_address_65536_93:
      000416                        460 	.ds 2
                           000018   461 LIO_Expander.get_user_input$max_len$1_0$97==.
      000418                        462 _get_user_input_PARM_2:
      000418                        463 	.ds 1
                           000019   464 LIO_Expander.get_user_input$buffer$1_0$97==.
      000419                        465 _get_user_input_buffer_65536_97:
      000419                        466 	.ds 3
                           00001C   467 LIO_Expander.get_user_input$count$1_0$98==.
      00041C                        468 _get_user_input_count_65536_98:
      00041C                        469 	.ds 1
                           00001D   470 LIO_Expander.PCF8574A_write$data$1_0$104==.
      00041D                        471 _PCF8574A_write_data_65536_104:
      00041D                        472 	.ds 1
                           00001E   473 LIO_Expander.PCF8574A_read$data$1_0$106==.
      00041E                        474 _PCF8574A_read_data_65536_106:
      00041E                        475 	.ds 3
                           000021   476 LIO_Expander.set_P0_out$state$1_0$110==.
      000421                        477 _set_P0_out_state_65536_110:
      000421                        478 	.ds 1
                           000022   479 LIO_Expander.set_P0_out$new_state$1_0$111==.
      000422                        480 _set_P0_out_new_state_65536_111:
      000422                        481 	.ds 1
                           000023   482 LIO_Expander.int0_isr$port_data$1_0$117==.
      000423                        483 _int0_isr_port_data_65536_117:
      000423                        484 	.ds 1
                           000024   485 FIO_Expander$input_buffer$0_0$0==.
      000424                        486 _input_buffer:
      000424                        487 	.ds 20
                           000038   488 LIO_Expander.main$port_data$4_0$136==.
      000438                        489 _main_port_data_262144_136:
      000438                        490 	.ds 1
                           000039   491 LIO_Expander.main$port_data$4_0$138==.
      000439                        492 _main_port_data_262144_138:
      000439                        493 	.ds 1
                           00003A   494 LIO_Expander.hex_dump_menu$current_addr$1_0$150==.
      00043A                        495 _hex_dump_menu_current_addr_65536_150:
      00043A                        496 	.ds 2
                           00003C   497 LIO_Expander.hex_dump_menu$data_buffer$1_0$150==.
      00043C                        498 _hex_dump_menu_data_buffer_65536_150:
      00043C                        499 	.ds 16
                           00004C   500 LIO_Expander.hex_dump_menu$bytes_in_line$1_0$150==.
      00044C                        501 _hex_dump_menu_bytes_in_line_65536_150:
      00044C                        502 	.ds 2
                           00004E   503 LIO_Expander.eereset$i$1_0$185==.
      00044E                        504 _eereset_i_65536_185:
      00044E                        505 	.ds 1
                                    506 ;--------------------------------------------------------
                                    507 ; absolute external ram data
                                    508 ;--------------------------------------------------------
                                    509 	.area XABS    (ABS,XDATA)
                                    510 ;--------------------------------------------------------
                                    511 ; external initialized ram data
                                    512 ;--------------------------------------------------------
                                    513 	.area XISEG   (XDATA)
                           000000   514 G$IO_Expander_port_state$0_0$0==.
      00048C                        515 _IO_Expander_port_state::
      00048C                        516 	.ds 1
                           000001   517 G$PCF8574A_input_state$0_0$0==.
      00048D                        518 _PCF8574A_input_state::
      00048D                        519 	.ds 1
                           000002   520 G$io_link$0_0$0==.
      00048E                        521 _io_link::
      00048E                        522 	.ds 1
                                    523 	.area HOME    (CODE)
                                    524 	.area GSINIT0 (CODE)
                                    525 	.area GSINIT1 (CODE)
                                    526 	.area GSINIT2 (CODE)
                                    527 	.area GSINIT3 (CODE)
                                    528 	.area GSINIT4 (CODE)
                                    529 	.area GSINIT5 (CODE)
                                    530 	.area GSINIT  (CODE)
                                    531 	.area GSFINAL (CODE)
                                    532 	.area CSEG    (CODE)
                                    533 ;--------------------------------------------------------
                                    534 ; interrupt vector
                                    535 ;--------------------------------------------------------
                                    536 	.area HOME    (CODE)
      002000                        537 __interrupt_vect:
      002000 02 20 09         [24]  538 	ljmp	__sdcc_gsinit_startup
      002003 02 25 06         [24]  539 	ljmp	_int0_isr
                                    540 ;--------------------------------------------------------
                                    541 ; global & static initialisations
                                    542 ;--------------------------------------------------------
                                    543 	.area HOME    (CODE)
                                    544 	.area GSINIT  (CODE)
                                    545 	.area GSFINAL (CODE)
                                    546 	.area GSINIT  (CODE)
                                    547 	.globl __sdcc_gsinit_startup
                                    548 	.globl __sdcc_program_startup
                                    549 	.globl __start__stack
                                    550 	.globl __mcs51_genXINIT
                                    551 	.globl __mcs51_genXRAMCLEAR
                                    552 	.globl __mcs51_genRAMCLEAR
                                    553 	.area GSFINAL (CODE)
      002062 02 20 06         [24]  554 	ljmp	__sdcc_program_startup
                                    555 ;--------------------------------------------------------
                                    556 ; Home
                                    557 ;--------------------------------------------------------
                                    558 	.area HOME    (CODE)
                                    559 	.area HOME    (CODE)
      002006                        560 __sdcc_program_startup:
      002006 02 25 6D         [24]  561 	ljmp	_main
                                    562 ;	return from main will return to caller
                                    563 ;--------------------------------------------------------
                                    564 ; code
                                    565 ;--------------------------------------------------------
                                    566 	.area CSEG    (CODE)
                                    567 ;------------------------------------------------------------
                                    568 ;Allocation info for local variables in function 'putchar'
                                    569 ;------------------------------------------------------------
                                    570 ;c                         Allocated with name '_putchar_c_65536_71'
                                    571 ;------------------------------------------------------------
                           000000   572 	G$putchar$0$0 ==.
                           000000   573 	C$IO_Expander.c$52$0_0$72 ==.
                                    574 ;	IO_Expander.c:52: int putchar(int c){
                                    575 ;	-----------------------------------------
                                    576 ;	 function putchar
                                    577 ;	-----------------------------------------
      002065                        578 _putchar:
                           000007   579 	ar7 = 0x07
                           000006   580 	ar6 = 0x06
                           000005   581 	ar5 = 0x05
                           000004   582 	ar4 = 0x04
                           000003   583 	ar3 = 0x03
                           000002   584 	ar2 = 0x02
                           000001   585 	ar1 = 0x01
                           000000   586 	ar0 = 0x00
      002065 AF 83            [24]  587 	mov	r7,dph
      002067 E5 82            [12]  588 	mov	a,dpl
      002069 90 04 00         [24]  589 	mov	dptr,#_putchar_c_65536_71
      00206C F0               [24]  590 	movx	@dptr,a
      00206D EF               [12]  591 	mov	a,r7
      00206E A3               [24]  592 	inc	dptr
      00206F F0               [24]  593 	movx	@dptr,a
                           00000B   594 	C$IO_Expander.c$53$1_0$72 ==.
                                    595 ;	IO_Expander.c:53: while (!TI); // Wait till ready to transmit, TI = 1
      002070                        596 00101$:
      002070 30 99 FD         [24]  597 	jnb	_TI,00101$
                           00000E   598 	C$IO_Expander.c$54$1_0$72 ==.
                                    599 ;	IO_Expander.c:54: SBUF = c;    // load serial port with transmit value
      002073 90 04 00         [24]  600 	mov	dptr,#_putchar_c_65536_71
      002076 E0               [24]  601 	movx	a,@dptr
      002077 FE               [12]  602 	mov	r6,a
      002078 A3               [24]  603 	inc	dptr
      002079 E0               [24]  604 	movx	a,@dptr
      00207A FF               [12]  605 	mov	r7,a
      00207B 8E 99            [24]  606 	mov	_SBUF,r6
                           000018   607 	C$IO_Expander.c$55$1_0$72 ==.
                                    608 ;	IO_Expander.c:55: TI = 0;      // clear TI flag
                                    609 ;	assignBit
      00207D C2 99            [12]  610 	clr	_TI
                           00001A   611 	C$IO_Expander.c$56$1_0$72 ==.
                                    612 ;	IO_Expander.c:56: return c;
      00207F 8E 82            [24]  613 	mov	dpl,r6
      002081 8F 83            [24]  614 	mov	dph,r7
                           00001E   615 	C$IO_Expander.c$57$1_0$72 ==.
                                    616 ;	IO_Expander.c:57: }
                           00001E   617 	C$IO_Expander.c$57$1_0$72 ==.
                           00001E   618 	XG$putchar$0$0 ==.
      002083 22               [24]  619 	ret
                                    620 ;------------------------------------------------------------
                                    621 ;Allocation info for local variables in function 'getchar'
                                    622 ;------------------------------------------------------------
                           00001F   623 	G$getchar$0$0 ==.
                           00001F   624 	C$IO_Expander.c$60$1_0$74 ==.
                                    625 ;	IO_Expander.c:60: int getchar(void){
                                    626 ;	-----------------------------------------
                                    627 ;	 function getchar
                                    628 ;	-----------------------------------------
      002084                        629 _getchar:
                           00001F   630 	C$IO_Expander.c$61$1_0$74 ==.
                                    631 ;	IO_Expander.c:61: while (!RI);     // Wait till ready to receive, RI = 1
      002084                        632 00101$:
                           00001F   633 	C$IO_Expander.c$62$1_0$74 ==.
                                    634 ;	IO_Expander.c:62: RI = 0;          // clear RI flag
                                    635 ;	assignBit
      002084 10 98 02         [24]  636 	jbc	_RI,00114$
      002087 80 FB            [24]  637 	sjmp	00101$
      002089                        638 00114$:
                           000024   639 	C$IO_Expander.c$63$1_0$74 ==.
                                    640 ;	IO_Expander.c:63: return SBUF;     // return character from SBUF
      002089 AE 99            [24]  641 	mov	r6,_SBUF
      00208B 7F 00            [12]  642 	mov	r7,#0x00
      00208D 8E 82            [24]  643 	mov	dpl,r6
      00208F 8F 83            [24]  644 	mov	dph,r7
                           00002C   645 	C$IO_Expander.c$64$1_0$74 ==.
                                    646 ;	IO_Expander.c:64: }
                           00002C   647 	C$IO_Expander.c$64$1_0$74 ==.
                           00002C   648 	XG$getchar$0$0 ==.
      002091 22               [24]  649 	ret
                                    650 ;------------------------------------------------------------
                                    651 ;Allocation info for local variables in function 'putstr'
                                    652 ;------------------------------------------------------------
                                    653 ;s                         Allocated with name '_putstr_s_65536_75'
                                    654 ;i                         Allocated with name '_putstr_i_65536_76'
                                    655 ;------------------------------------------------------------
                           00002D   656 	G$putstr$0$0 ==.
                           00002D   657 	C$IO_Expander.c$67$1_0$76 ==.
                                    658 ;	IO_Expander.c:67: int putstr(char *s){
                                    659 ;	-----------------------------------------
                                    660 ;	 function putstr
                                    661 ;	-----------------------------------------
      002092                        662 _putstr:
      002092 AF F0            [24]  663 	mov	r7,b
      002094 AE 83            [24]  664 	mov	r6,dph
      002096 E5 82            [12]  665 	mov	a,dpl
      002098 90 04 02         [24]  666 	mov	dptr,#_putstr_s_65536_75
      00209B F0               [24]  667 	movx	@dptr,a
      00209C EE               [12]  668 	mov	a,r6
      00209D A3               [24]  669 	inc	dptr
      00209E F0               [24]  670 	movx	@dptr,a
      00209F EF               [12]  671 	mov	a,r7
      0020A0 A3               [24]  672 	inc	dptr
      0020A1 F0               [24]  673 	movx	@dptr,a
                           00003D   674 	C$IO_Expander.c$69$1_0$76 ==.
                                    675 ;	IO_Expander.c:69: while (*s) {     // output characters until NULL found
      0020A2 90 04 02         [24]  676 	mov	dptr,#_putstr_s_65536_75
      0020A5 E0               [24]  677 	movx	a,@dptr
      0020A6 FD               [12]  678 	mov	r5,a
      0020A7 A3               [24]  679 	inc	dptr
      0020A8 E0               [24]  680 	movx	a,@dptr
      0020A9 FE               [12]  681 	mov	r6,a
      0020AA A3               [24]  682 	inc	dptr
      0020AB E0               [24]  683 	movx	a,@dptr
      0020AC FF               [12]  684 	mov	r7,a
      0020AD 7B 00            [12]  685 	mov	r3,#0x00
      0020AF 7C 00            [12]  686 	mov	r4,#0x00
      0020B1                        687 00101$:
      0020B1 8D 82            [24]  688 	mov	dpl,r5
      0020B3 8E 83            [24]  689 	mov	dph,r6
      0020B5 8F F0            [24]  690 	mov	b,r7
      0020B7 12 37 C9         [24]  691 	lcall	__gptrget
      0020BA FA               [12]  692 	mov	r2,a
      0020BB 60 36            [24]  693 	jz	00108$
                           000058   694 	C$IO_Expander.c$70$2_0$77 ==.
                                    695 ;	IO_Expander.c:70: putchar(*s++);
      0020BD 0D               [12]  696 	inc	r5
      0020BE BD 00 01         [24]  697 	cjne	r5,#0x00,00116$
      0020C1 0E               [12]  698 	inc	r6
      0020C2                        699 00116$:
      0020C2 90 04 02         [24]  700 	mov	dptr,#_putstr_s_65536_75
      0020C5 ED               [12]  701 	mov	a,r5
      0020C6 F0               [24]  702 	movx	@dptr,a
      0020C7 EE               [12]  703 	mov	a,r6
      0020C8 A3               [24]  704 	inc	dptr
      0020C9 F0               [24]  705 	movx	@dptr,a
      0020CA EF               [12]  706 	mov	a,r7
      0020CB A3               [24]  707 	inc	dptr
      0020CC F0               [24]  708 	movx	@dptr,a
      0020CD 8A 01            [24]  709 	mov	ar1,r2
      0020CF 7A 00            [12]  710 	mov	r2,#0x00
      0020D1 89 82            [24]  711 	mov	dpl,r1
      0020D3 8A 83            [24]  712 	mov	dph,r2
      0020D5 C0 07            [24]  713 	push	ar7
      0020D7 C0 06            [24]  714 	push	ar6
      0020D9 C0 05            [24]  715 	push	ar5
      0020DB C0 04            [24]  716 	push	ar4
      0020DD C0 03            [24]  717 	push	ar3
      0020DF 12 20 65         [24]  718 	lcall	_putchar
      0020E2 D0 03            [24]  719 	pop	ar3
      0020E4 D0 04            [24]  720 	pop	ar4
      0020E6 D0 05            [24]  721 	pop	ar5
      0020E8 D0 06            [24]  722 	pop	ar6
      0020EA D0 07            [24]  723 	pop	ar7
                           000087   724 	C$IO_Expander.c$71$2_0$77 ==.
                                    725 ;	IO_Expander.c:71: i++;
      0020EC 0B               [12]  726 	inc	r3
      0020ED BB 00 C1         [24]  727 	cjne	r3,#0x00,00101$
      0020F0 0C               [12]  728 	inc	r4
      0020F1 80 BE            [24]  729 	sjmp	00101$
      0020F3                        730 00108$:
      0020F3 90 04 02         [24]  731 	mov	dptr,#_putstr_s_65536_75
      0020F6 ED               [12]  732 	mov	a,r5
      0020F7 F0               [24]  733 	movx	@dptr,a
      0020F8 EE               [12]  734 	mov	a,r6
      0020F9 A3               [24]  735 	inc	dptr
      0020FA F0               [24]  736 	movx	@dptr,a
      0020FB EF               [12]  737 	mov	a,r7
      0020FC A3               [24]  738 	inc	dptr
      0020FD F0               [24]  739 	movx	@dptr,a
                           000099   740 	C$IO_Expander.c$73$1_0$76 ==.
                                    741 ;	IO_Expander.c:73: return i+1;
      0020FE 0B               [12]  742 	inc	r3
      0020FF BB 00 01         [24]  743 	cjne	r3,#0x00,00118$
      002102 0C               [12]  744 	inc	r4
      002103                        745 00118$:
      002103 8B 82            [24]  746 	mov	dpl,r3
      002105 8C 83            [24]  747 	mov	dph,r4
                           0000A2   748 	C$IO_Expander.c$74$1_0$76 ==.
                                    749 ;	IO_Expander.c:74: }
                           0000A2   750 	C$IO_Expander.c$74$1_0$76 ==.
                           0000A2   751 	XG$putstr$0$0 ==.
      002107 22               [24]  752 	ret
                                    753 ;------------------------------------------------------------
                                    754 ;Allocation info for local variables in function 'putchar_blue'
                                    755 ;------------------------------------------------------------
                                    756 ;c                         Allocated with name '_putchar_blue_c_65536_78'
                                    757 ;------------------------------------------------------------
                           0000A3   758 	G$putchar_blue$0$0 ==.
                           0000A3   759 	C$IO_Expander.c$76$1_0$79 ==.
                                    760 ;	IO_Expander.c:76: void putchar_blue(int c){
                                    761 ;	-----------------------------------------
                                    762 ;	 function putchar_blue
                                    763 ;	-----------------------------------------
      002108                        764 _putchar_blue:
      002108 AF 83            [24]  765 	mov	r7,dph
      00210A E5 82            [12]  766 	mov	a,dpl
      00210C 90 04 05         [24]  767 	mov	dptr,#_putchar_blue_c_65536_78
      00210F F0               [24]  768 	movx	@dptr,a
      002110 EF               [12]  769 	mov	a,r7
      002111 A3               [24]  770 	inc	dptr
      002112 F0               [24]  771 	movx	@dptr,a
                           0000AE   772 	C$IO_Expander.c$77$1_0$79 ==.
                                    773 ;	IO_Expander.c:77: putstr(ANSI_BLUE_BOLD);
      002113 90 37 E9         [24]  774 	mov	dptr,#___str_0
      002116 75 F0 80         [24]  775 	mov	b,#0x80
      002119 12 20 92         [24]  776 	lcall	_putstr
                           0000B7   777 	C$IO_Expander.c$78$1_0$79 ==.
                                    778 ;	IO_Expander.c:78: putchar(c);
      00211C 90 04 05         [24]  779 	mov	dptr,#_putchar_blue_c_65536_78
      00211F E0               [24]  780 	movx	a,@dptr
      002120 FE               [12]  781 	mov	r6,a
      002121 A3               [24]  782 	inc	dptr
      002122 E0               [24]  783 	movx	a,@dptr
      002123 FF               [12]  784 	mov	r7,a
      002124 8E 82            [24]  785 	mov	dpl,r6
      002126 8F 83            [24]  786 	mov	dph,r7
      002128 12 20 65         [24]  787 	lcall	_putchar
                           0000C6   788 	C$IO_Expander.c$79$1_0$79 ==.
                                    789 ;	IO_Expander.c:79: putstr(ANSI_RESET);
      00212B 90 37 F1         [24]  790 	mov	dptr,#___str_1
      00212E 75 F0 80         [24]  791 	mov	b,#0x80
      002131 12 20 92         [24]  792 	lcall	_putstr
                           0000CF   793 	C$IO_Expander.c$80$1_0$79 ==.
                                    794 ;	IO_Expander.c:80: }
                           0000CF   795 	C$IO_Expander.c$80$1_0$79 ==.
                           0000CF   796 	XG$putchar_blue$0$0 ==.
      002134 22               [24]  797 	ret
                                    798 ;------------------------------------------------------------
                                    799 ;Allocation info for local variables in function 'putstr_blue'
                                    800 ;------------------------------------------------------------
                                    801 ;s                         Allocated with name '_putstr_blue_s_65536_80'
                                    802 ;------------------------------------------------------------
                           0000D0   803 	G$putstr_blue$0$0 ==.
                           0000D0   804 	C$IO_Expander.c$82$1_0$81 ==.
                                    805 ;	IO_Expander.c:82: void putstr_blue(char *s){
                                    806 ;	-----------------------------------------
                                    807 ;	 function putstr_blue
                                    808 ;	-----------------------------------------
      002135                        809 _putstr_blue:
      002135 AF F0            [24]  810 	mov	r7,b
      002137 AE 83            [24]  811 	mov	r6,dph
      002139 E5 82            [12]  812 	mov	a,dpl
      00213B 90 04 07         [24]  813 	mov	dptr,#_putstr_blue_s_65536_80
      00213E F0               [24]  814 	movx	@dptr,a
      00213F EE               [12]  815 	mov	a,r6
      002140 A3               [24]  816 	inc	dptr
      002141 F0               [24]  817 	movx	@dptr,a
      002142 EF               [12]  818 	mov	a,r7
      002143 A3               [24]  819 	inc	dptr
      002144 F0               [24]  820 	movx	@dptr,a
                           0000E0   821 	C$IO_Expander.c$83$1_0$81 ==.
                                    822 ;	IO_Expander.c:83: putstr(ANSI_BLUE_BOLD);
      002145 90 37 E9         [24]  823 	mov	dptr,#___str_0
      002148 75 F0 80         [24]  824 	mov	b,#0x80
      00214B 12 20 92         [24]  825 	lcall	_putstr
                           0000E9   826 	C$IO_Expander.c$84$1_0$81 ==.
                                    827 ;	IO_Expander.c:84: putstr(s);
      00214E 90 04 07         [24]  828 	mov	dptr,#_putstr_blue_s_65536_80
      002151 E0               [24]  829 	movx	a,@dptr
      002152 FD               [12]  830 	mov	r5,a
      002153 A3               [24]  831 	inc	dptr
      002154 E0               [24]  832 	movx	a,@dptr
      002155 FE               [12]  833 	mov	r6,a
      002156 A3               [24]  834 	inc	dptr
      002157 E0               [24]  835 	movx	a,@dptr
      002158 FF               [12]  836 	mov	r7,a
      002159 8D 82            [24]  837 	mov	dpl,r5
      00215B 8E 83            [24]  838 	mov	dph,r6
      00215D 8F F0            [24]  839 	mov	b,r7
      00215F 12 20 92         [24]  840 	lcall	_putstr
                           0000FD   841 	C$IO_Expander.c$85$1_0$81 ==.
                                    842 ;	IO_Expander.c:85: putstr(ANSI_RESET);
      002162 90 37 F1         [24]  843 	mov	dptr,#___str_1
      002165 75 F0 80         [24]  844 	mov	b,#0x80
      002168 12 20 92         [24]  845 	lcall	_putstr
                           000106   846 	C$IO_Expander.c$86$1_0$81 ==.
                                    847 ;	IO_Expander.c:86: }
                           000106   848 	C$IO_Expander.c$86$1_0$81 ==.
                           000106   849 	XG$putstr_blue$0$0 ==.
      00216B 22               [24]  850 	ret
                                    851 ;------------------------------------------------------------
                                    852 ;Allocation info for local variables in function 'putstr_green'
                                    853 ;------------------------------------------------------------
                                    854 ;s                         Allocated with name '_putstr_green_s_65536_82'
                                    855 ;------------------------------------------------------------
                           000107   856 	G$putstr_green$0$0 ==.
                           000107   857 	C$IO_Expander.c$88$1_0$83 ==.
                                    858 ;	IO_Expander.c:88: void putstr_green(char *s){
                                    859 ;	-----------------------------------------
                                    860 ;	 function putstr_green
                                    861 ;	-----------------------------------------
      00216C                        862 _putstr_green:
      00216C AF F0            [24]  863 	mov	r7,b
      00216E AE 83            [24]  864 	mov	r6,dph
      002170 E5 82            [12]  865 	mov	a,dpl
      002172 90 04 0A         [24]  866 	mov	dptr,#_putstr_green_s_65536_82
      002175 F0               [24]  867 	movx	@dptr,a
      002176 EE               [12]  868 	mov	a,r6
      002177 A3               [24]  869 	inc	dptr
      002178 F0               [24]  870 	movx	@dptr,a
      002179 EF               [12]  871 	mov	a,r7
      00217A A3               [24]  872 	inc	dptr
      00217B F0               [24]  873 	movx	@dptr,a
                           000117   874 	C$IO_Expander.c$89$1_0$83 ==.
                                    875 ;	IO_Expander.c:89: putstr(ANSI_GREEN_BOLD);
      00217C 90 37 F6         [24]  876 	mov	dptr,#___str_2
      00217F 75 F0 80         [24]  877 	mov	b,#0x80
      002182 12 20 92         [24]  878 	lcall	_putstr
                           000120   879 	C$IO_Expander.c$90$1_0$83 ==.
                                    880 ;	IO_Expander.c:90: putstr(s);
      002185 90 04 0A         [24]  881 	mov	dptr,#_putstr_green_s_65536_82
      002188 E0               [24]  882 	movx	a,@dptr
      002189 FD               [12]  883 	mov	r5,a
      00218A A3               [24]  884 	inc	dptr
      00218B E0               [24]  885 	movx	a,@dptr
      00218C FE               [12]  886 	mov	r6,a
      00218D A3               [24]  887 	inc	dptr
      00218E E0               [24]  888 	movx	a,@dptr
      00218F FF               [12]  889 	mov	r7,a
      002190 8D 82            [24]  890 	mov	dpl,r5
      002192 8E 83            [24]  891 	mov	dph,r6
      002194 8F F0            [24]  892 	mov	b,r7
      002196 12 20 92         [24]  893 	lcall	_putstr
                           000134   894 	C$IO_Expander.c$91$1_0$83 ==.
                                    895 ;	IO_Expander.c:91: putstr(ANSI_RESET);
      002199 90 37 F1         [24]  896 	mov	dptr,#___str_1
      00219C 75 F0 80         [24]  897 	mov	b,#0x80
      00219F 12 20 92         [24]  898 	lcall	_putstr
                           00013D   899 	C$IO_Expander.c$92$1_0$83 ==.
                                    900 ;	IO_Expander.c:92: }
                           00013D   901 	C$IO_Expander.c$92$1_0$83 ==.
                           00013D   902 	XG$putstr_green$0$0 ==.
      0021A2 22               [24]  903 	ret
                                    904 ;------------------------------------------------------------
                                    905 ;Allocation info for local variables in function 'print_newline'
                                    906 ;------------------------------------------------------------
                           00013E   907 	G$print_newline$0$0 ==.
                           00013E   908 	C$IO_Expander.c$95$1_0$85 ==.
                                    909 ;	IO_Expander.c:95: void print_newline(void) {
                                    910 ;	-----------------------------------------
                                    911 ;	 function print_newline
                                    912 ;	-----------------------------------------
      0021A3                        913 _print_newline:
                           00013E   914 	C$IO_Expander.c$96$1_0$85 ==.
                                    915 ;	IO_Expander.c:96: putchar('\r');
      0021A3 90 00 0D         [24]  916 	mov	dptr,#0x000d
      0021A6 12 20 65         [24]  917 	lcall	_putchar
                           000144   918 	C$IO_Expander.c$97$1_0$85 ==.
                                    919 ;	IO_Expander.c:97: putchar('\n');
      0021A9 90 00 0A         [24]  920 	mov	dptr,#0x000a
      0021AC 12 20 65         [24]  921 	lcall	_putchar
                           00014A   922 	C$IO_Expander.c$98$1_0$85 ==.
                                    923 ;	IO_Expander.c:98: }
                           00014A   924 	C$IO_Expander.c$98$1_0$85 ==.
                           00014A   925 	XG$print_newline$0$0 ==.
      0021AF 22               [24]  926 	ret
                                    927 ;------------------------------------------------------------
                                    928 ;Allocation info for local variables in function 'simple_hex_to_int'
                                    929 ;------------------------------------------------------------
                                    930 ;hex_str                   Allocated with name '_simple_hex_to_int_hex_str_65536_86'
                                    931 ;result                    Allocated with name '_simple_hex_to_int_result_65536_87'
                                    932 ;c                         Allocated with name '_simple_hex_to_int_c_65536_87'
                                    933 ;------------------------------------------------------------
                           00014B   934 	G$simple_hex_to_int$0$0 ==.
                           00014B   935 	C$IO_Expander.c$100$1_0$87 ==.
                                    936 ;	IO_Expander.c:100: uint16_t simple_hex_to_int(const char *hex_str) {
                                    937 ;	-----------------------------------------
                                    938 ;	 function simple_hex_to_int
                                    939 ;	-----------------------------------------
      0021B0                        940 _simple_hex_to_int:
      0021B0 AF F0            [24]  941 	mov	r7,b
      0021B2 AE 83            [24]  942 	mov	r6,dph
      0021B4 E5 82            [12]  943 	mov	a,dpl
      0021B6 90 04 0D         [24]  944 	mov	dptr,#_simple_hex_to_int_hex_str_65536_86
      0021B9 F0               [24]  945 	movx	@dptr,a
      0021BA EE               [12]  946 	mov	a,r6
      0021BB A3               [24]  947 	inc	dptr
      0021BC F0               [24]  948 	movx	@dptr,a
      0021BD EF               [12]  949 	mov	a,r7
      0021BE A3               [24]  950 	inc	dptr
      0021BF F0               [24]  951 	movx	@dptr,a
                           00015B   952 	C$IO_Expander.c$101$2_0$87 ==.
                                    953 ;	IO_Expander.c:101: uint16_t result = 0;
      0021C0 90 04 10         [24]  954 	mov	dptr,#_simple_hex_to_int_result_65536_87
      0021C3 E4               [12]  955 	clr	a
      0021C4 F0               [24]  956 	movx	@dptr,a
      0021C5 A3               [24]  957 	inc	dptr
      0021C6 F0               [24]  958 	movx	@dptr,a
                           000162   959 	C$IO_Expander.c$104$1_0$87 ==.
                                    960 ;	IO_Expander.c:104: while ((c = *hex_str++) != '\0') {
      0021C7 90 04 0D         [24]  961 	mov	dptr,#_simple_hex_to_int_hex_str_65536_86
      0021CA E0               [24]  962 	movx	a,@dptr
      0021CB FD               [12]  963 	mov	r5,a
      0021CC A3               [24]  964 	inc	dptr
      0021CD E0               [24]  965 	movx	a,@dptr
      0021CE FE               [12]  966 	mov	r6,a
      0021CF A3               [24]  967 	inc	dptr
      0021D0 E0               [24]  968 	movx	a,@dptr
      0021D1 FF               [12]  969 	mov	r7,a
      0021D2                        970 00113$:
      0021D2 8D 82            [24]  971 	mov	dpl,r5
      0021D4 8E 83            [24]  972 	mov	dph,r6
      0021D6 8F F0            [24]  973 	mov	b,r7
      0021D8 12 37 C9         [24]  974 	lcall	__gptrget
      0021DB FC               [12]  975 	mov	r4,a
      0021DC A3               [24]  976 	inc	dptr
      0021DD AD 82            [24]  977 	mov	r5,dpl
      0021DF AE 83            [24]  978 	mov	r6,dph
      0021E1 90 04 0D         [24]  979 	mov	dptr,#_simple_hex_to_int_hex_str_65536_86
      0021E4 ED               [12]  980 	mov	a,r5
      0021E5 F0               [24]  981 	movx	@dptr,a
      0021E6 EE               [12]  982 	mov	a,r6
      0021E7 A3               [24]  983 	inc	dptr
      0021E8 F0               [24]  984 	movx	@dptr,a
      0021E9 EF               [12]  985 	mov	a,r7
      0021EA A3               [24]  986 	inc	dptr
      0021EB F0               [24]  987 	movx	@dptr,a
      0021EC EC               [12]  988 	mov	a,r4
      0021ED 70 03            [24]  989 	jnz	00150$
      0021EF 02 22 9D         [24]  990 	ljmp	00115$
      0021F2                        991 00150$:
                           00018D   992 	C$IO_Expander.c$105$2_0$88 ==.
                                    993 ;	IO_Expander.c:105: result <<= 4;
      0021F2 90 04 10         [24]  994 	mov	dptr,#_simple_hex_to_int_result_65536_87
      0021F5 E0               [24]  995 	movx	a,@dptr
      0021F6 FA               [12]  996 	mov	r2,a
      0021F7 A3               [24]  997 	inc	dptr
      0021F8 E0               [24]  998 	movx	a,@dptr
      0021F9 C4               [12]  999 	swap	a
      0021FA 54 F0            [12] 1000 	anl	a,#0xf0
      0021FC CA               [12] 1001 	xch	a,r2
      0021FD C4               [12] 1002 	swap	a
      0021FE CA               [12] 1003 	xch	a,r2
      0021FF 6A               [12] 1004 	xrl	a,r2
      002200 CA               [12] 1005 	xch	a,r2
      002201 54 F0            [12] 1006 	anl	a,#0xf0
      002203 CA               [12] 1007 	xch	a,r2
      002204 6A               [12] 1008 	xrl	a,r2
      002205 FB               [12] 1009 	mov	r3,a
      002206 90 04 10         [24] 1010 	mov	dptr,#_simple_hex_to_int_result_65536_87
      002209 EA               [12] 1011 	mov	a,r2
      00220A F0               [24] 1012 	movx	@dptr,a
      00220B EB               [12] 1013 	mov	a,r3
      00220C A3               [24] 1014 	inc	dptr
      00220D F0               [24] 1015 	movx	@dptr,a
                           0001A9  1016 	C$IO_Expander.c$106$2_0$88 ==.
                                   1017 ;	IO_Expander.c:106: if (c >= '0' && c <= '9') {
      00220E BC 30 00         [24] 1018 	cjne	r4,#0x30,00151$
      002211                       1019 00151$:
      002211 40 29            [24] 1020 	jc	00110$
      002213 EC               [12] 1021 	mov	a,r4
      002214 24 C6            [12] 1022 	add	a,#0xff - 0x39
      002216 40 24            [24] 1023 	jc	00110$
                           0001B3  1024 	C$IO_Expander.c$107$3_0$89 ==.
                                   1025 ;	IO_Expander.c:107: result |= (c - '0');
      002218 8C 02            [24] 1026 	mov	ar2,r4
      00221A 7B 00            [12] 1027 	mov	r3,#0x00
      00221C EA               [12] 1028 	mov	a,r2
      00221D 24 D0            [12] 1029 	add	a,#0xd0
      00221F FA               [12] 1030 	mov	r2,a
      002220 EB               [12] 1031 	mov	a,r3
      002221 34 FF            [12] 1032 	addc	a,#0xff
      002223 FB               [12] 1033 	mov	r3,a
      002224 90 04 10         [24] 1034 	mov	dptr,#_simple_hex_to_int_result_65536_87
      002227 E0               [24] 1035 	movx	a,@dptr
      002228 F8               [12] 1036 	mov	r0,a
      002229 A3               [24] 1037 	inc	dptr
      00222A E0               [24] 1038 	movx	a,@dptr
      00222B F9               [12] 1039 	mov	r1,a
      00222C E8               [12] 1040 	mov	a,r0
      00222D 42 02            [12] 1041 	orl	ar2,a
      00222F E9               [12] 1042 	mov	a,r1
      002230 42 03            [12] 1043 	orl	ar3,a
      002232 90 04 10         [24] 1044 	mov	dptr,#_simple_hex_to_int_result_65536_87
      002235 EA               [12] 1045 	mov	a,r2
      002236 F0               [24] 1046 	movx	@dptr,a
      002237 EB               [12] 1047 	mov	a,r3
      002238 A3               [24] 1048 	inc	dptr
      002239 F0               [24] 1049 	movx	@dptr,a
      00223A 80 96            [24] 1050 	sjmp	00113$
      00223C                       1051 00110$:
                           0001D7  1052 	C$IO_Expander.c$108$2_0$88 ==.
                                   1053 ;	IO_Expander.c:108: } else if (c >= 'A' && c <= 'F') {
      00223C BC 41 00         [24] 1054 	cjne	r4,#0x41,00154$
      00223F                       1055 00154$:
      00223F 40 2A            [24] 1056 	jc	00106$
      002241 EC               [12] 1057 	mov	a,r4
      002242 24 B9            [12] 1058 	add	a,#0xff - 0x46
      002244 40 25            [24] 1059 	jc	00106$
                           0001E1  1060 	C$IO_Expander.c$109$3_0$90 ==.
                                   1061 ;	IO_Expander.c:109: result |= (c - 'A' + 10);
      002246 8C 02            [24] 1062 	mov	ar2,r4
      002248 7B 00            [12] 1063 	mov	r3,#0x00
      00224A 74 C9            [12] 1064 	mov	a,#0xc9
      00224C 2A               [12] 1065 	add	a,r2
      00224D FA               [12] 1066 	mov	r2,a
      00224E 74 FF            [12] 1067 	mov	a,#0xff
      002250 3B               [12] 1068 	addc	a,r3
      002251 FB               [12] 1069 	mov	r3,a
      002252 90 04 10         [24] 1070 	mov	dptr,#_simple_hex_to_int_result_65536_87
      002255 E0               [24] 1071 	movx	a,@dptr
      002256 F8               [12] 1072 	mov	r0,a
      002257 A3               [24] 1073 	inc	dptr
      002258 E0               [24] 1074 	movx	a,@dptr
      002259 F9               [12] 1075 	mov	r1,a
      00225A E8               [12] 1076 	mov	a,r0
      00225B 42 02            [12] 1077 	orl	ar2,a
      00225D E9               [12] 1078 	mov	a,r1
      00225E 42 03            [12] 1079 	orl	ar3,a
      002260 90 04 10         [24] 1080 	mov	dptr,#_simple_hex_to_int_result_65536_87
      002263 EA               [12] 1081 	mov	a,r2
      002264 F0               [24] 1082 	movx	@dptr,a
      002265 EB               [12] 1083 	mov	a,r3
      002266 A3               [24] 1084 	inc	dptr
      002267 F0               [24] 1085 	movx	@dptr,a
      002268 02 21 D2         [24] 1086 	ljmp	00113$
      00226B                       1087 00106$:
                           000206  1088 	C$IO_Expander.c$110$2_0$88 ==.
                                   1089 ;	IO_Expander.c:110: } else if (c >= 'a' && c <= 'f') {
      00226B BC 61 00         [24] 1090 	cjne	r4,#0x61,00157$
      00226E                       1091 00157$:
      00226E 40 28            [24] 1092 	jc	00102$
      002270 EC               [12] 1093 	mov	a,r4
      002271 24 99            [12] 1094 	add	a,#0xff - 0x66
      002273 40 23            [24] 1095 	jc	00102$
                           000210  1096 	C$IO_Expander.c$111$3_0$91 ==.
                                   1097 ;	IO_Expander.c:111: result |= (c - 'a' + 10);
      002275 7B 00            [12] 1098 	mov	r3,#0x00
      002277 74 A9            [12] 1099 	mov	a,#0xa9
      002279 2C               [12] 1100 	add	a,r4
      00227A FC               [12] 1101 	mov	r4,a
      00227B 74 FF            [12] 1102 	mov	a,#0xff
      00227D 3B               [12] 1103 	addc	a,r3
      00227E FB               [12] 1104 	mov	r3,a
      00227F 90 04 10         [24] 1105 	mov	dptr,#_simple_hex_to_int_result_65536_87
      002282 E0               [24] 1106 	movx	a,@dptr
      002283 F9               [12] 1107 	mov	r1,a
      002284 A3               [24] 1108 	inc	dptr
      002285 E0               [24] 1109 	movx	a,@dptr
      002286 FA               [12] 1110 	mov	r2,a
      002287 E9               [12] 1111 	mov	a,r1
      002288 42 04            [12] 1112 	orl	ar4,a
      00228A EA               [12] 1113 	mov	a,r2
      00228B 42 03            [12] 1114 	orl	ar3,a
      00228D 90 04 10         [24] 1115 	mov	dptr,#_simple_hex_to_int_result_65536_87
      002290 EC               [12] 1116 	mov	a,r4
      002291 F0               [24] 1117 	movx	@dptr,a
      002292 EB               [12] 1118 	mov	a,r3
      002293 A3               [24] 1119 	inc	dptr
      002294 F0               [24] 1120 	movx	@dptr,a
      002295 02 21 D2         [24] 1121 	ljmp	00113$
      002298                       1122 00102$:
                           000233  1123 	C$IO_Expander.c$113$3_0$92 ==.
                                   1124 ;	IO_Expander.c:113: return 0xFFFF;  // Error
      002298 90 FF FF         [24] 1125 	mov	dptr,#0xffff
      00229B 80 0B            [24] 1126 	sjmp	00116$
      00229D                       1127 00115$:
                           000238  1128 	C$IO_Expander.c$116$1_0$87 ==.
                                   1129 ;	IO_Expander.c:116: return result;
      00229D 90 04 10         [24] 1130 	mov	dptr,#_simple_hex_to_int_result_65536_87
      0022A0 E0               [24] 1131 	movx	a,@dptr
      0022A1 FE               [12] 1132 	mov	r6,a
      0022A2 A3               [24] 1133 	inc	dptr
      0022A3 E0               [24] 1134 	movx	a,@dptr
                           00023F  1135 	C$IO_Expander.c$117$1_0$87 ==.
                                   1136 ;	IO_Expander.c:117: }
                           00023F  1137 	C$IO_Expander.c$117$1_0$87 ==.
                           00023F  1138 	XG$simple_hex_to_int$0$0 ==.
      0022A4 8E 82            [24] 1139 	mov	dpl,r6
      0022A6 F5 83            [12] 1140 	mov	dph,a
      0022A8                       1141 00116$:
      0022A8 22               [24] 1142 	ret
                                   1143 ;------------------------------------------------------------
                                   1144 ;Allocation info for local variables in function 'print_hex_dump_line'
                                   1145 ;------------------------------------------------------------
                                   1146 ;data                      Allocated with name '_print_hex_dump_line_PARM_2'
                                   1147 ;count                     Allocated with name '_print_hex_dump_line_PARM_3'
                                   1148 ;address                   Allocated with name '_print_hex_dump_line_address_65536_93'
                                   1149 ;i                         Allocated with name '_print_hex_dump_line_i_65536_94'
                                   1150 ;------------------------------------------------------------
                           000244  1151 	G$print_hex_dump_line$0$0 ==.
                           000244  1152 	C$IO_Expander.c$119$1_0$94 ==.
                                   1153 ;	IO_Expander.c:119: void print_hex_dump_line(uint16_t address, const uint8_t *data, uint8_t count) {
                                   1154 ;	-----------------------------------------
                                   1155 ;	 function print_hex_dump_line
                                   1156 ;	-----------------------------------------
      0022A9                       1157 _print_hex_dump_line:
      0022A9 AF 83            [24] 1158 	mov	r7,dph
      0022AB E5 82            [12] 1159 	mov	a,dpl
      0022AD 90 04 16         [24] 1160 	mov	dptr,#_print_hex_dump_line_address_65536_93
      0022B0 F0               [24] 1161 	movx	@dptr,a
      0022B1 EF               [12] 1162 	mov	a,r7
      0022B2 A3               [24] 1163 	inc	dptr
      0022B3 F0               [24] 1164 	movx	@dptr,a
                           00024F  1165 	C$IO_Expander.c$123$1_0$94 ==.
                                   1166 ;	IO_Expander.c:123: printf("%03X: ", address);
      0022B4 90 04 16         [24] 1167 	mov	dptr,#_print_hex_dump_line_address_65536_93
      0022B7 E0               [24] 1168 	movx	a,@dptr
      0022B8 C0 E0            [24] 1169 	push	acc
      0022BA A3               [24] 1170 	inc	dptr
      0022BB E0               [24] 1171 	movx	a,@dptr
      0022BC C0 E0            [24] 1172 	push	acc
      0022BE 74 FE            [12] 1173 	mov	a,#___str_3
      0022C0 C0 E0            [24] 1174 	push	acc
      0022C2 74 37            [12] 1175 	mov	a,#(___str_3 >> 8)
      0022C4 C0 E0            [24] 1176 	push	acc
      0022C6 74 80            [12] 1177 	mov	a,#0x80
      0022C8 C0 E0            [24] 1178 	push	acc
      0022CA 12 2D 7D         [24] 1179 	lcall	_printf
      0022CD E5 81            [12] 1180 	mov	a,sp
      0022CF 24 FB            [12] 1181 	add	a,#0xfb
      0022D1 F5 81            [12] 1182 	mov	sp,a
                           00026E  1183 	C$IO_Expander.c$126$3_0$96 ==.
                                   1184 ;	IO_Expander.c:126: for (i = 0; i < count && i < 16; i++) {
      0022D3 90 04 12         [24] 1185 	mov	dptr,#_print_hex_dump_line_PARM_2
      0022D6 E0               [24] 1186 	movx	a,@dptr
      0022D7 FD               [12] 1187 	mov	r5,a
      0022D8 A3               [24] 1188 	inc	dptr
      0022D9 E0               [24] 1189 	movx	a,@dptr
      0022DA FE               [12] 1190 	mov	r6,a
      0022DB A3               [24] 1191 	inc	dptr
      0022DC E0               [24] 1192 	movx	a,@dptr
      0022DD FF               [12] 1193 	mov	r7,a
      0022DE 90 04 15         [24] 1194 	mov	dptr,#_print_hex_dump_line_PARM_3
      0022E1 E0               [24] 1195 	movx	a,@dptr
      0022E2 FC               [12] 1196 	mov	r4,a
      0022E3 7B 00            [12] 1197 	mov	r3,#0x00
      0022E5                       1198 00104$:
      0022E5 C3               [12] 1199 	clr	c
      0022E6 EB               [12] 1200 	mov	a,r3
      0022E7 9C               [12] 1201 	subb	a,r4
      0022E8 50 49            [24] 1202 	jnc	00101$
      0022EA BB 10 00         [24] 1203 	cjne	r3,#0x10,00122$
      0022ED                       1204 00122$:
      0022ED 50 44            [24] 1205 	jnc	00101$
                           00028A  1206 	C$IO_Expander.c$127$3_0$96 ==.
                                   1207 ;	IO_Expander.c:127: printf("%02X ", data[i]);
      0022EF EB               [12] 1208 	mov	a,r3
      0022F0 2D               [12] 1209 	add	a,r5
      0022F1 F8               [12] 1210 	mov	r0,a
      0022F2 E4               [12] 1211 	clr	a
      0022F3 3E               [12] 1212 	addc	a,r6
      0022F4 F9               [12] 1213 	mov	r1,a
      0022F5 8F 02            [24] 1214 	mov	ar2,r7
      0022F7 88 82            [24] 1215 	mov	dpl,r0
      0022F9 89 83            [24] 1216 	mov	dph,r1
      0022FB 8A F0            [24] 1217 	mov	b,r2
      0022FD 12 37 C9         [24] 1218 	lcall	__gptrget
      002300 F8               [12] 1219 	mov	r0,a
      002301 7A 00            [12] 1220 	mov	r2,#0x00
      002303 C0 07            [24] 1221 	push	ar7
      002305 C0 06            [24] 1222 	push	ar6
      002307 C0 05            [24] 1223 	push	ar5
      002309 C0 04            [24] 1224 	push	ar4
      00230B C0 03            [24] 1225 	push	ar3
      00230D C0 00            [24] 1226 	push	ar0
      00230F C0 02            [24] 1227 	push	ar2
      002311 74 05            [12] 1228 	mov	a,#___str_4
      002313 C0 E0            [24] 1229 	push	acc
      002315 74 38            [12] 1230 	mov	a,#(___str_4 >> 8)
      002317 C0 E0            [24] 1231 	push	acc
      002319 74 80            [12] 1232 	mov	a,#0x80
      00231B C0 E0            [24] 1233 	push	acc
      00231D 12 2D 7D         [24] 1234 	lcall	_printf
      002320 E5 81            [12] 1235 	mov	a,sp
      002322 24 FB            [12] 1236 	add	a,#0xfb
      002324 F5 81            [12] 1237 	mov	sp,a
      002326 D0 03            [24] 1238 	pop	ar3
      002328 D0 04            [24] 1239 	pop	ar4
      00232A D0 05            [24] 1240 	pop	ar5
      00232C D0 06            [24] 1241 	pop	ar6
      00232E D0 07            [24] 1242 	pop	ar7
                           0002CB  1243 	C$IO_Expander.c$126$2_0$95 ==.
                                   1244 ;	IO_Expander.c:126: for (i = 0; i < count && i < 16; i++) {
      002330 0B               [12] 1245 	inc	r3
      002331 80 B2            [24] 1246 	sjmp	00104$
      002333                       1247 00101$:
                           0002CE  1248 	C$IO_Expander.c$130$1_0$94 ==.
                                   1249 ;	IO_Expander.c:130: printf("\r\n");
      002333 74 0B            [12] 1250 	mov	a,#___str_5
      002335 C0 E0            [24] 1251 	push	acc
      002337 74 38            [12] 1252 	mov	a,#(___str_5 >> 8)
      002339 C0 E0            [24] 1253 	push	acc
      00233B 74 80            [12] 1254 	mov	a,#0x80
      00233D C0 E0            [24] 1255 	push	acc
      00233F 12 2D 7D         [24] 1256 	lcall	_printf
      002342 15 81            [12] 1257 	dec	sp
      002344 15 81            [12] 1258 	dec	sp
      002346 15 81            [12] 1259 	dec	sp
                           0002E3  1260 	C$IO_Expander.c$131$1_0$94 ==.
                                   1261 ;	IO_Expander.c:131: }
                           0002E3  1262 	C$IO_Expander.c$131$1_0$94 ==.
                           0002E3  1263 	XG$print_hex_dump_line$0$0 ==.
      002348 22               [24] 1264 	ret
                                   1265 ;------------------------------------------------------------
                                   1266 ;Allocation info for local variables in function 'get_user_input'
                                   1267 ;------------------------------------------------------------
                                   1268 ;max_len                   Allocated with name '_get_user_input_PARM_2'
                                   1269 ;buffer                    Allocated with name '_get_user_input_buffer_65536_97'
                                   1270 ;count                     Allocated with name '_get_user_input_count_65536_98'
                                   1271 ;c                         Allocated with name '_get_user_input_c_65536_98'
                                   1272 ;------------------------------------------------------------
                           0002E4  1273 	G$get_user_input$0$0 ==.
                           0002E4  1274 	C$IO_Expander.c$134$1_0$98 ==.
                                   1275 ;	IO_Expander.c:134: uint8_t get_user_input(char *buffer, uint8_t max_len) {
                                   1276 ;	-----------------------------------------
                                   1277 ;	 function get_user_input
                                   1278 ;	-----------------------------------------
      002349                       1279 _get_user_input:
      002349 AF F0            [24] 1280 	mov	r7,b
      00234B AE 83            [24] 1281 	mov	r6,dph
      00234D E5 82            [12] 1282 	mov	a,dpl
      00234F 90 04 19         [24] 1283 	mov	dptr,#_get_user_input_buffer_65536_97
      002352 F0               [24] 1284 	movx	@dptr,a
      002353 EE               [12] 1285 	mov	a,r6
      002354 A3               [24] 1286 	inc	dptr
      002355 F0               [24] 1287 	movx	@dptr,a
      002356 EF               [12] 1288 	mov	a,r7
      002357 A3               [24] 1289 	inc	dptr
      002358 F0               [24] 1290 	movx	@dptr,a
                           0002F4  1291 	C$IO_Expander.c$135$2_0$98 ==.
                                   1292 ;	IO_Expander.c:135: uint8_t count = 0;
      002359 90 04 1C         [24] 1293 	mov	dptr,#_get_user_input_count_65536_98
      00235C E4               [12] 1294 	clr	a
      00235D F0               [24] 1295 	movx	@dptr,a
                           0002F9  1296 	C$IO_Expander.c$138$1_0$98 ==.
                                   1297 ;	IO_Expander.c:138: while (count < (max_len - 1)) {
      00235E 90 04 18         [24] 1298 	mov	dptr,#_get_user_input_PARM_2
      002361 E0               [24] 1299 	movx	a,@dptr
      002362 FF               [12] 1300 	mov	r7,a
      002363 90 04 19         [24] 1301 	mov	dptr,#_get_user_input_buffer_65536_97
      002366 E0               [24] 1302 	movx	a,@dptr
      002367 FC               [12] 1303 	mov	r4,a
      002368 A3               [24] 1304 	inc	dptr
      002369 E0               [24] 1305 	movx	a,@dptr
      00236A FD               [12] 1306 	mov	r5,a
      00236B A3               [24] 1307 	inc	dptr
      00236C E0               [24] 1308 	movx	a,@dptr
      00236D FE               [12] 1309 	mov	r6,a
      00236E                       1310 00118$:
      00236E 8F 02            [24] 1311 	mov	ar2,r7
      002370 7B 00            [12] 1312 	mov	r3,#0x00
      002372 1A               [12] 1313 	dec	r2
      002373 BA FF 01         [24] 1314 	cjne	r2,#0xff,00159$
      002376 1B               [12] 1315 	dec	r3
      002377                       1316 00159$:
      002377 90 04 1C         [24] 1317 	mov	dptr,#_get_user_input_count_65536_98
      00237A E0               [24] 1318 	movx	a,@dptr
      00237B F8               [12] 1319 	mov	r0,a
      00237C 79 00            [12] 1320 	mov	r1,#0x00
      00237E C3               [12] 1321 	clr	c
      00237F E8               [12] 1322 	mov	a,r0
      002380 9A               [12] 1323 	subb	a,r2
      002381 E9               [12] 1324 	mov	a,r1
      002382 64 80            [12] 1325 	xrl	a,#0x80
      002384 8B F0            [24] 1326 	mov	b,r3
      002386 63 F0 80         [24] 1327 	xrl	b,#0x80
      002389 95 F0            [12] 1328 	subb	a,b
      00238B 40 03            [24] 1329 	jc	00160$
      00238D 02 24 47         [24] 1330 	ljmp	00120$
      002390                       1331 00160$:
                           00032B  1332 	C$IO_Expander.c$140$2_0$99 ==.
                                   1333 ;	IO_Expander.c:140: c = getchar();
      002390 C0 07            [24] 1334 	push	ar7
      002392 C0 06            [24] 1335 	push	ar6
      002394 C0 05            [24] 1336 	push	ar5
      002396 C0 04            [24] 1337 	push	ar4
      002398 12 20 84         [24] 1338 	lcall	_getchar
      00239B AA 82            [24] 1339 	mov	r2,dpl
      00239D AB 83            [24] 1340 	mov	r3,dph
      00239F D0 04            [24] 1341 	pop	ar4
      0023A1 D0 05            [24] 1342 	pop	ar5
      0023A3 D0 06            [24] 1343 	pop	ar6
      0023A5 D0 07            [24] 1344 	pop	ar7
                           000342  1345 	C$IO_Expander.c$142$2_0$99 ==.
                                   1346 ;	IO_Expander.c:142: if (c == '\r' || c == '\n') {
      0023A7 BA 0D 03         [24] 1347 	cjne	r2,#0x0d,00161$
      0023AA 02 24 47         [24] 1348 	ljmp	00120$
      0023AD                       1349 00161$:
      0023AD BA 0A 03         [24] 1350 	cjne	r2,#0x0a,00162$
      0023B0 02 24 47         [24] 1351 	ljmp	00120$
      0023B3                       1352 00162$:
                           00034E  1353 	C$IO_Expander.c$144$2_0$99 ==.
                                   1354 ;	IO_Expander.c:144: } else if (c == '\b' || c == 0x7F) {  // Backspace or DEL
      0023B3 BA 08 02         [24] 1355 	cjne	r2,#0x08,00163$
      0023B6 80 03            [24] 1356 	sjmp	00110$
      0023B8                       1357 00163$:
      0023B8 BA 7F 33         [24] 1358 	cjne	r2,#0x7f,00111$
      0023BB                       1359 00110$:
                           000356  1360 	C$IO_Expander.c$145$3_0$101 ==.
                                   1361 ;	IO_Expander.c:145: if (count > 0) {
      0023BB 90 04 1C         [24] 1362 	mov	dptr,#_get_user_input_count_65536_98
      0023BE E0               [24] 1363 	movx	a,@dptr
      0023BF FB               [12] 1364 	mov	r3,a
      0023C0 E0               [24] 1365 	movx	a,@dptr
      0023C1 60 AB            [24] 1366 	jz	00118$
                           00035E  1367 	C$IO_Expander.c$146$4_0$102 ==.
                                   1368 ;	IO_Expander.c:146: count--;
      0023C3 EB               [12] 1369 	mov	a,r3
      0023C4 14               [12] 1370 	dec	a
      0023C5 90 04 1C         [24] 1371 	mov	dptr,#_get_user_input_count_65536_98
      0023C8 F0               [24] 1372 	movx	@dptr,a
                           000364  1373 	C$IO_Expander.c$148$4_0$102 ==.
                                   1374 ;	IO_Expander.c:148: putchar('\b');
      0023C9 90 00 08         [24] 1375 	mov	dptr,#0x0008
      0023CC C0 07            [24] 1376 	push	ar7
      0023CE C0 06            [24] 1377 	push	ar6
      0023D0 C0 05            [24] 1378 	push	ar5
      0023D2 C0 04            [24] 1379 	push	ar4
      0023D4 12 20 65         [24] 1380 	lcall	_putchar
                           000372  1381 	C$IO_Expander.c$149$4_0$102 ==.
                                   1382 ;	IO_Expander.c:149: putchar(' ');
      0023D7 90 00 20         [24] 1383 	mov	dptr,#0x0020
      0023DA 12 20 65         [24] 1384 	lcall	_putchar
                           000378  1385 	C$IO_Expander.c$150$4_0$102 ==.
                                   1386 ;	IO_Expander.c:150: putchar('\b');
      0023DD 90 00 08         [24] 1387 	mov	dptr,#0x0008
      0023E0 12 20 65         [24] 1388 	lcall	_putchar
      0023E3 D0 04            [24] 1389 	pop	ar4
      0023E5 D0 05            [24] 1390 	pop	ar5
      0023E7 D0 06            [24] 1391 	pop	ar6
      0023E9 D0 07            [24] 1392 	pop	ar7
      0023EB 02 23 6E         [24] 1393 	ljmp	00118$
      0023EE                       1394 00111$:
                           000389  1395 	C$IO_Expander.c$152$2_0$99 ==.
                                   1396 ;	IO_Expander.c:152: } else if ((c >= '0' && c <= '9') ||
      0023EE BA 30 00         [24] 1397 	cjne	r2,#0x30,00167$
      0023F1                       1398 00167$:
      0023F1 40 05            [24] 1399 	jc	00107$
      0023F3 EA               [12] 1400 	mov	a,r2
      0023F4 24 C6            [12] 1401 	add	a,#0xff - 0x39
      0023F6 50 1A            [24] 1402 	jnc	00103$
      0023F8                       1403 00107$:
                           000393  1404 	C$IO_Expander.c$153$2_0$99 ==.
                                   1405 ;	IO_Expander.c:153: (c >= 'A' && c <= 'F') ||
      0023F8 BA 41 00         [24] 1406 	cjne	r2,#0x41,00170$
      0023FB                       1407 00170$:
      0023FB 40 05            [24] 1408 	jc	00109$
      0023FD EA               [12] 1409 	mov	a,r2
      0023FE 24 B9            [12] 1410 	add	a,#0xff - 0x46
      002400 50 10            [24] 1411 	jnc	00103$
      002402                       1412 00109$:
                           00039D  1413 	C$IO_Expander.c$154$2_0$99 ==.
                                   1414 ;	IO_Expander.c:154: (c >= 'a' && c <= 'f')) {  // Only hex characters
      002402 BA 61 00         [24] 1415 	cjne	r2,#0x61,00173$
      002405                       1416 00173$:
      002405 50 03            [24] 1417 	jnc	00174$
      002407 02 23 6E         [24] 1418 	ljmp	00118$
      00240A                       1419 00174$:
      00240A EA               [12] 1420 	mov	a,r2
      00240B 24 99            [12] 1421 	add	a,#0xff - 0x66
      00240D 50 03            [24] 1422 	jnc	00175$
      00240F 02 23 6E         [24] 1423 	ljmp	00118$
      002412                       1424 00175$:
      002412                       1425 00103$:
                           0003AD  1426 	C$IO_Expander.c$155$3_0$103 ==.
                                   1427 ;	IO_Expander.c:155: buffer[count++] = c;
      002412 90 04 1C         [24] 1428 	mov	dptr,#_get_user_input_count_65536_98
      002415 E0               [24] 1429 	movx	a,@dptr
      002416 FB               [12] 1430 	mov	r3,a
      002417 04               [12] 1431 	inc	a
      002418 F0               [24] 1432 	movx	@dptr,a
      002419 EB               [12] 1433 	mov	a,r3
      00241A 2C               [12] 1434 	add	a,r4
      00241B F8               [12] 1435 	mov	r0,a
      00241C E4               [12] 1436 	clr	a
      00241D 3D               [12] 1437 	addc	a,r5
      00241E F9               [12] 1438 	mov	r1,a
      00241F 8E 03            [24] 1439 	mov	ar3,r6
      002421 88 82            [24] 1440 	mov	dpl,r0
      002423 89 83            [24] 1441 	mov	dph,r1
      002425 8B F0            [24] 1442 	mov	b,r3
      002427 EA               [12] 1443 	mov	a,r2
      002428 12 2C B4         [24] 1444 	lcall	__gptrput
                           0003C6  1445 	C$IO_Expander.c$156$3_0$103 ==.
                                   1446 ;	IO_Expander.c:156: putchar_blue(c);  // Echo the character
      00242B 7B 00            [12] 1447 	mov	r3,#0x00
      00242D 8A 82            [24] 1448 	mov	dpl,r2
      00242F 8B 83            [24] 1449 	mov	dph,r3
      002431 C0 07            [24] 1450 	push	ar7
      002433 C0 06            [24] 1451 	push	ar6
      002435 C0 05            [24] 1452 	push	ar5
      002437 C0 04            [24] 1453 	push	ar4
      002439 12 21 08         [24] 1454 	lcall	_putchar_blue
      00243C D0 04            [24] 1455 	pop	ar4
      00243E D0 05            [24] 1456 	pop	ar5
      002440 D0 06            [24] 1457 	pop	ar6
      002442 D0 07            [24] 1458 	pop	ar7
      002444 02 23 6E         [24] 1459 	ljmp	00118$
      002447                       1460 00120$:
                           0003E2  1461 	C$IO_Expander.c$161$1_0$98 ==.
                                   1462 ;	IO_Expander.c:161: buffer[count] = '\0';  // Null terminate
      002447 90 04 19         [24] 1463 	mov	dptr,#_get_user_input_buffer_65536_97
      00244A E0               [24] 1464 	movx	a,@dptr
      00244B FD               [12] 1465 	mov	r5,a
      00244C A3               [24] 1466 	inc	dptr
      00244D E0               [24] 1467 	movx	a,@dptr
      00244E FE               [12] 1468 	mov	r6,a
      00244F A3               [24] 1469 	inc	dptr
      002450 E0               [24] 1470 	movx	a,@dptr
      002451 FF               [12] 1471 	mov	r7,a
      002452 90 04 1C         [24] 1472 	mov	dptr,#_get_user_input_count_65536_98
      002455 E0               [24] 1473 	movx	a,@dptr
      002456 FC               [12] 1474 	mov	r4,a
      002457 2D               [12] 1475 	add	a,r5
      002458 FD               [12] 1476 	mov	r5,a
      002459 E4               [12] 1477 	clr	a
      00245A 3E               [12] 1478 	addc	a,r6
      00245B FE               [12] 1479 	mov	r6,a
      00245C 8D 82            [24] 1480 	mov	dpl,r5
      00245E 8E 83            [24] 1481 	mov	dph,r6
      002460 8F F0            [24] 1482 	mov	b,r7
      002462 E4               [12] 1483 	clr	a
      002463 12 2C B4         [24] 1484 	lcall	__gptrput
                           000401  1485 	C$IO_Expander.c$162$1_0$98 ==.
                                   1486 ;	IO_Expander.c:162: print_newline();
      002466 C0 04            [24] 1487 	push	ar4
      002468 12 21 A3         [24] 1488 	lcall	_print_newline
      00246B D0 04            [24] 1489 	pop	ar4
                           000408  1490 	C$IO_Expander.c$163$1_0$98 ==.
                                   1491 ;	IO_Expander.c:163: return count;
      00246D 8C 82            [24] 1492 	mov	dpl,r4
                           00040A  1493 	C$IO_Expander.c$164$1_0$98 ==.
                                   1494 ;	IO_Expander.c:164: }
                           00040A  1495 	C$IO_Expander.c$164$1_0$98 ==.
                           00040A  1496 	XG$get_user_input$0$0 ==.
      00246F 22               [24] 1497 	ret
                                   1498 ;------------------------------------------------------------
                                   1499 ;Allocation info for local variables in function 'PCF8574A_write'
                                   1500 ;------------------------------------------------------------
                                   1501 ;data                      Allocated with name '_PCF8574A_write_data_65536_104'
                                   1502 ;------------------------------------------------------------
                           00040B  1503 	G$PCF8574A_write$0$0 ==.
                           00040B  1504 	C$IO_Expander.c$169$1_0$105 ==.
                                   1505 ;	IO_Expander.c:169: bool PCF8574A_write(uint8_t data) {
                                   1506 ;	-----------------------------------------
                                   1507 ;	 function PCF8574A_write
                                   1508 ;	-----------------------------------------
      002470                       1509 _PCF8574A_write:
      002470 E5 82            [12] 1510 	mov	a,dpl
      002472 90 04 1D         [24] 1511 	mov	dptr,#_PCF8574A_write_data_65536_104
      002475 F0               [24] 1512 	movx	@dptr,a
                           000411  1513 	C$IO_Expander.c$170$1_0$105 ==.
                                   1514 ;	IO_Expander.c:170: device_addr = PCF8574A_WRITE;
      002476 75 09 70         [24] 1515 	mov	_device_addr,#0x70
                           000414  1516 	C$IO_Expander.c$171$1_0$105 ==.
                                   1517 ;	IO_Expander.c:171: asm_data = data;
      002479 E0               [24] 1518 	movx	a,@dptr
      00247A FF               [12] 1519 	mov	r7,a
      00247B 8F 0B            [24] 1520 	mov	_asm_data,r7
                           000418  1521 	C$IO_Expander.c$180$1_0$105 ==.
                                   1522 ;	IO_Expander.c:180: __endasm;
      00247D E5 09            [12] 1523 	mov	A, _device_addr ; Load write address
      00247F 12 2B 3A         [24] 1524 	lcall	_OUTS ; Send it with start condition
      002482 E5 0B            [12] 1525 	mov	a, _asm_data ; Get data byte
      002484 12 2B 71         [24] 1526 	lcall	_OUT ; Send it
      002487 12 2B 96         [24] 1527 	lcall	_STOP ; Send stop condition
                           000425  1528 	C$IO_Expander.c$182$1_0$105 ==.
                                   1529 ;	IO_Expander.c:182: IO_Expander_port_state = data;
      00248A 90 04 8C         [24] 1530 	mov	dptr,#_IO_Expander_port_state
      00248D EF               [12] 1531 	mov	a,r7
      00248E F0               [24] 1532 	movx	@dptr,a
                           00042A  1533 	C$IO_Expander.c$183$1_0$105 ==.
                                   1534 ;	IO_Expander.c:183: return true;
      00248F 75 82 01         [24] 1535 	mov	dpl,#0x01
                           00042D  1536 	C$IO_Expander.c$184$1_0$105 ==.
                                   1537 ;	IO_Expander.c:184: }
                           00042D  1538 	C$IO_Expander.c$184$1_0$105 ==.
                           00042D  1539 	XG$PCF8574A_write$0$0 ==.
      002492 22               [24] 1540 	ret
                                   1541 ;------------------------------------------------------------
                                   1542 ;Allocation info for local variables in function 'PCF8574A_read'
                                   1543 ;------------------------------------------------------------
                                   1544 ;data                      Allocated with name '_PCF8574A_read_data_65536_106'
                                   1545 ;------------------------------------------------------------
                           00042E  1546 	G$PCF8574A_read$0$0 ==.
                           00042E  1547 	C$IO_Expander.c$187$1_0$107 ==.
                                   1548 ;	IO_Expander.c:187: bool PCF8574A_read(uint8_t *data) {
                                   1549 ;	-----------------------------------------
                                   1550 ;	 function PCF8574A_read
                                   1551 ;	-----------------------------------------
      002493                       1552 _PCF8574A_read:
      002493 AF F0            [24] 1553 	mov	r7,b
      002495 AE 83            [24] 1554 	mov	r6,dph
      002497 E5 82            [12] 1555 	mov	a,dpl
      002499 90 04 1E         [24] 1556 	mov	dptr,#_PCF8574A_read_data_65536_106
      00249C F0               [24] 1557 	movx	@dptr,a
      00249D EE               [12] 1558 	mov	a,r6
      00249E A3               [24] 1559 	inc	dptr
      00249F F0               [24] 1560 	movx	@dptr,a
      0024A0 EF               [12] 1561 	mov	a,r7
      0024A1 A3               [24] 1562 	inc	dptr
      0024A2 F0               [24] 1563 	movx	@dptr,a
                           00043E  1564 	C$IO_Expander.c$188$1_0$107 ==.
                                   1565 ;	IO_Expander.c:188: device_addr = PCF8574A_READ;
      0024A3 75 09 71         [24] 1566 	mov	_device_addr,#0x71
                           000441  1567 	C$IO_Expander.c$196$1_0$107 ==.
                                   1568 ;	IO_Expander.c:196: __endasm;
      0024A6 E5 09            [12] 1569 	mov	A, _device_addr ; Load PCF8574A read address
      0024A8 12 2B 3A         [24] 1570 	lcall	_OUTS ; Send it with start condition
      0024AB 12 2B B6         [24] 1571 	lcall	_IN ; Read data byte
      0024AE F5 0C            [12] 1572 	mov	_asm_result, A ; Store result
      0024B0 12 2B 96         [24] 1573 	lcall	_STOP ; Send stop condition
                           00044E  1574 	C$IO_Expander.c$198$1_0$107 ==.
                                   1575 ;	IO_Expander.c:198: *data = asm_result;
      0024B3 90 04 1E         [24] 1576 	mov	dptr,#_PCF8574A_read_data_65536_106
      0024B6 E0               [24] 1577 	movx	a,@dptr
      0024B7 FD               [12] 1578 	mov	r5,a
      0024B8 A3               [24] 1579 	inc	dptr
      0024B9 E0               [24] 1580 	movx	a,@dptr
      0024BA FE               [12] 1581 	mov	r6,a
      0024BB A3               [24] 1582 	inc	dptr
      0024BC E0               [24] 1583 	movx	a,@dptr
      0024BD FF               [12] 1584 	mov	r7,a
      0024BE 8D 82            [24] 1585 	mov	dpl,r5
      0024C0 8E 83            [24] 1586 	mov	dph,r6
      0024C2 8F F0            [24] 1587 	mov	b,r7
      0024C4 E5 0C            [12] 1588 	mov	a,_asm_result
      0024C6 12 2C B4         [24] 1589 	lcall	__gptrput
                           000464  1590 	C$IO_Expander.c$199$1_0$107 ==.
                                   1591 ;	IO_Expander.c:199: return true;
      0024C9 75 82 01         [24] 1592 	mov	dpl,#0x01
                           000467  1593 	C$IO_Expander.c$200$1_0$107 ==.
                                   1594 ;	IO_Expander.c:200: }
                           000467  1595 	C$IO_Expander.c$200$1_0$107 ==.
                           000467  1596 	XG$PCF8574A_read$0$0 ==.
      0024CC 22               [24] 1597 	ret
                                   1598 ;------------------------------------------------------------
                                   1599 ;Allocation info for local variables in function 'PCF8574A_init'
                                   1600 ;------------------------------------------------------------
                           000468  1601 	G$PCF8574A_init$0$0 ==.
                           000468  1602 	C$IO_Expander.c$202$1_0$109 ==.
                                   1603 ;	IO_Expander.c:202: void PCF8574A_init(void) {    
                                   1604 ;	-----------------------------------------
                                   1605 ;	 function PCF8574A_init
                                   1606 ;	-----------------------------------------
      0024CD                       1607 _PCF8574A_init:
                           000468  1608 	C$IO_Expander.c$204$1_0$109 ==.
                                   1609 ;	IO_Expander.c:204: PCF8574A_write(DEFAULT_CONFIG);
      0024CD 75 82 FE         [24] 1610 	mov	dpl,#0xfe
      0024D0 12 24 70         [24] 1611 	lcall	_PCF8574A_write
                           00046E  1612 	C$IO_Expander.c$205$1_0$109 ==.
                                   1613 ;	IO_Expander.c:205: }
                           00046E  1614 	C$IO_Expander.c$205$1_0$109 ==.
                           00046E  1615 	XG$PCF8574A_init$0$0 ==.
      0024D3 22               [24] 1616 	ret
                                   1617 ;------------------------------------------------------------
                                   1618 ;Allocation info for local variables in function 'set_P0_out'
                                   1619 ;------------------------------------------------------------
                                   1620 ;state                     Allocated with name '_set_P0_out_state_65536_110'
                                   1621 ;new_state                 Allocated with name '_set_P0_out_new_state_65536_111'
                                   1622 ;------------------------------------------------------------
                           00046F  1623 	G$set_P0_out$0$0 ==.
                           00046F  1624 	C$IO_Expander.c$208$1_0$111 ==.
                                   1625 ;	IO_Expander.c:208: bool set_P0_out(bool state) {
                                   1626 ;	-----------------------------------------
                                   1627 ;	 function set_P0_out
                                   1628 ;	-----------------------------------------
      0024D4                       1629 _set_P0_out:
      0024D4 E5 82            [12] 1630 	mov	a,dpl
      0024D6 90 04 21         [24] 1631 	mov	dptr,#_set_P0_out_state_65536_110
      0024D9 F0               [24] 1632 	movx	@dptr,a
                           000475  1633 	C$IO_Expander.c$212$1_0$111 ==.
                                   1634 ;	IO_Expander.c:212: new_state = IO_Expander_port_state;
      0024DA 90 04 8C         [24] 1635 	mov	dptr,#_IO_Expander_port_state
      0024DD E0               [24] 1636 	movx	a,@dptr
      0024DE FF               [12] 1637 	mov	r7,a
                           00047A  1638 	C$IO_Expander.c$213$1_0$111 ==.
                                   1639 ;	IO_Expander.c:213: if (state) {
      0024DF 90 04 21         [24] 1640 	mov	dptr,#_set_P0_out_state_65536_110
      0024E2 E0               [24] 1641 	movx	a,@dptr
      0024E3 60 09            [24] 1642 	jz	00102$
                           000480  1643 	C$IO_Expander.c$214$2_0$112 ==.
                                   1644 ;	IO_Expander.c:214: new_state |= (1 << 0); // Set bit on bit 0
      0024E5 90 04 22         [24] 1645 	mov	dptr,#_set_P0_out_new_state_65536_111
      0024E8 74 01            [12] 1646 	mov	a,#0x01
      0024EA 4F               [12] 1647 	orl	a,r7
      0024EB F0               [24] 1648 	movx	@dptr,a
      0024EC 80 07            [24] 1649 	sjmp	00103$
      0024EE                       1650 00102$:
                           000489  1651 	C$IO_Expander.c$216$2_0$113 ==.
                                   1652 ;	IO_Expander.c:216: new_state &= ~(1 << 0); // Clear bit on bit 0
      0024EE 90 04 22         [24] 1653 	mov	dptr,#_set_P0_out_new_state_65536_111
      0024F1 74 FE            [12] 1654 	mov	a,#0xfe
      0024F3 5F               [12] 1655 	anl	a,r7
      0024F4 F0               [24] 1656 	movx	@dptr,a
      0024F5                       1657 00103$:
                           000490  1658 	C$IO_Expander.c$219$1_0$111 ==.
                                   1659 ;	IO_Expander.c:219: return PCF8574A_write(new_state);
      0024F5 90 04 22         [24] 1660 	mov	dptr,#_set_P0_out_new_state_65536_111
      0024F8 E0               [24] 1661 	movx	a,@dptr
      0024F9 F5 82            [12] 1662 	mov	dpl,a
      0024FB 12 24 70         [24] 1663 	lcall	_PCF8574A_write
                           000499  1664 	C$IO_Expander.c$220$1_0$111 ==.
                                   1665 ;	IO_Expander.c:220: }
                           000499  1666 	C$IO_Expander.c$220$1_0$111 ==.
                           000499  1667 	XG$set_P0_out$0$0 ==.
      0024FE 22               [24] 1668 	ret
                                   1669 ;------------------------------------------------------------
                                   1670 ;Allocation info for local variables in function 'init_INT0_interrupt'
                                   1671 ;------------------------------------------------------------
                           00049A  1672 	G$init_INT0_interrupt$0$0 ==.
                           00049A  1673 	C$IO_Expander.c$223$1_0$115 ==.
                                   1674 ;	IO_Expander.c:223: void init_INT0_interrupt(void) {
                                   1675 ;	-----------------------------------------
                                   1676 ;	 function init_INT0_interrupt
                                   1677 ;	-----------------------------------------
      0024FF                       1678 _init_INT0_interrupt:
                           00049A  1679 	C$IO_Expander.c$225$1_0$115 ==.
                                   1680 ;	IO_Expander.c:225: IT0 = 1; // INT0 triggered on falling edge
                                   1681 ;	assignBit
      0024FF D2 88            [12] 1682 	setb	_IT0
                           00049C  1683 	C$IO_Expander.c$226$1_0$115 ==.
                                   1684 ;	IO_Expander.c:226: EX0 = 1; // Enable INT0
                                   1685 ;	assignBit
      002501 D2 A8            [12] 1686 	setb	_EX0
                           00049E  1687 	C$IO_Expander.c$227$1_0$115 ==.
                                   1688 ;	IO_Expander.c:227: EA = 1; // Enable global interrupts
                                   1689 ;	assignBit
      002503 D2 AF            [12] 1690 	setb	_EA
                           0004A0  1691 	C$IO_Expander.c$228$1_0$115 ==.
                                   1692 ;	IO_Expander.c:228: }
                           0004A0  1693 	C$IO_Expander.c$228$1_0$115 ==.
                           0004A0  1694 	XG$init_INT0_interrupt$0$0 ==.
      002505 22               [24] 1695 	ret
                                   1696 ;------------------------------------------------------------
                                   1697 ;Allocation info for local variables in function 'int0_isr'
                                   1698 ;------------------------------------------------------------
                                   1699 ;port_data                 Allocated with name '_int0_isr_port_data_65536_117'
                                   1700 ;pin7                      Allocated with name '_int0_isr_pin7_65537_118'
                                   1701 ;------------------------------------------------------------
                           0004A1  1702 	G$int0_isr$0$0 ==.
                           0004A1  1703 	C$IO_Expander.c$231$1_0$117 ==.
                                   1704 ;	IO_Expander.c:231: void int0_isr(void) __interrupt (IE0_VECTOR) {
                                   1705 ;	-----------------------------------------
                                   1706 ;	 function int0_isr
                                   1707 ;	-----------------------------------------
      002506                       1708 _int0_isr:
      002506 C0 21            [24] 1709 	push	bits
      002508 C0 E0            [24] 1710 	push	acc
      00250A C0 F0            [24] 1711 	push	b
      00250C C0 82            [24] 1712 	push	dpl
      00250E C0 83            [24] 1713 	push	dph
      002510 C0 07            [24] 1714 	push	(0+7)
      002512 C0 06            [24] 1715 	push	(0+6)
      002514 C0 05            [24] 1716 	push	(0+5)
      002516 C0 04            [24] 1717 	push	(0+4)
      002518 C0 03            [24] 1718 	push	(0+3)
      00251A C0 02            [24] 1719 	push	(0+2)
      00251C C0 01            [24] 1720 	push	(0+1)
      00251E C0 00            [24] 1721 	push	(0+0)
      002520 C0 D0            [24] 1722 	push	psw
      002522 75 D0 00         [24] 1723 	mov	psw,#0x00
                           0004C0  1724 	C$IO_Expander.c$233$1_0$117 ==.
                                   1725 ;	IO_Expander.c:233: PCF8574A_read(&port_data); // read new val
      002525 90 04 23         [24] 1726 	mov	dptr,#_int0_isr_port_data_65536_117
      002528 75 F0 00         [24] 1727 	mov	b,#0x00
      00252B 12 24 93         [24] 1728 	lcall	_PCF8574A_read
                           0004C9  1729 	C$IO_Expander.c$236$2_0$118 ==.
                                   1730 ;	IO_Expander.c:236: bool pin7 = (port_data & INPUT_PIN_MASK);
      00252E 90 04 23         [24] 1731 	mov	dptr,#_int0_isr_port_data_65536_117
      002531 E0               [24] 1732 	movx	a,@dptr
      002532 23               [12] 1733 	rl	a
      002533 54 01            [12] 1734 	anl	a,#0x01
      002535 FF               [12] 1735 	mov	r7,a
                           0004D1  1736 	C$IO_Expander.c$237$1_1$118 ==.
                                   1737 ;	IO_Expander.c:237: if (io_link) {
      002536 90 04 8E         [24] 1738 	mov	dptr,#_io_link
      002539 E0               [24] 1739 	movx	a,@dptr
      00253A 60 07            [24] 1740 	jz	00102$
                           0004D7  1741 	C$IO_Expander.c$239$2_1$119 ==.
                                   1742 ;	IO_Expander.c:239: set_P0_out(pin7);
      00253C 8F 82            [24] 1743 	mov	dpl,r7
      00253E 12 24 D4         [24] 1744 	lcall	_set_P0_out
      002541 80 0D            [24] 1745 	sjmp	00104$
      002543                       1746 00102$:
                           0004DE  1747 	C$IO_Expander.c$242$2_1$120 ==.
                                   1748 ;	IO_Expander.c:242: set_P0_out(!pin7);
      002543 EF               [12] 1749 	mov	a,r7
      002544 B4 01 00         [24] 1750 	cjne	a,#0x01,00111$
      002547                       1751 00111$:
      002547 92 00            [24] 1752 	mov  _int0_isr_sloc0_1_0,c
      002549 E4               [12] 1753 	clr	a
      00254A 33               [12] 1754 	rlc	a
      00254B F5 82            [12] 1755 	mov	dpl,a
      00254D 12 24 D4         [24] 1756 	lcall	_set_P0_out
      002550                       1757 00104$:
                           0004EB  1758 	C$IO_Expander.c$244$1_1$117 ==.
                                   1759 ;	IO_Expander.c:244: }
      002550 D0 D0            [24] 1760 	pop	psw
      002552 D0 00            [24] 1761 	pop	(0+0)
      002554 D0 01            [24] 1762 	pop	(0+1)
      002556 D0 02            [24] 1763 	pop	(0+2)
      002558 D0 03            [24] 1764 	pop	(0+3)
      00255A D0 04            [24] 1765 	pop	(0+4)
      00255C D0 05            [24] 1766 	pop	(0+5)
      00255E D0 06            [24] 1767 	pop	(0+6)
      002560 D0 07            [24] 1768 	pop	(0+7)
      002562 D0 83            [24] 1769 	pop	dph
      002564 D0 82            [24] 1770 	pop	dpl
      002566 D0 F0            [24] 1771 	pop	b
      002568 D0 E0            [24] 1772 	pop	acc
      00256A D0 21            [24] 1773 	pop	bits
                           000507  1774 	C$IO_Expander.c$244$1_1$117 ==.
                           000507  1775 	XG$int0_isr$0$0 ==.
      00256C 32               [24] 1776 	reti
                                   1777 ;------------------------------------------------------------
                                   1778 ;Allocation info for local variables in function 'main'
                                   1779 ;------------------------------------------------------------
                                   1780 ;choice                    Allocated with name '_main_choice_65536_133'
                                   1781 ;port_data                 Allocated with name '_main_port_data_262144_136'
                                   1782 ;pin7                      Allocated with name '_main_pin7_262145_137'
                                   1783 ;port_data                 Allocated with name '_main_port_data_262144_138'
                                   1784 ;pin7                      Allocated with name '_main_pin7_262145_139'
                                   1785 ;------------------------------------------------------------
                           000508  1786 	G$main$0$0 ==.
                           000508  1787 	C$IO_Expander.c$267$1_1$133 ==.
                                   1788 ;	IO_Expander.c:267: int main(void) {
                                   1789 ;	-----------------------------------------
                                   1790 ;	 function main
                                   1791 ;	-----------------------------------------
      00256D                       1792 _main:
                           000508  1793 	C$IO_Expander.c$271$1_0$133 ==.
                                   1794 ;	IO_Expander.c:271: eeprom_init();      // also initializes I2C
      00256D 12 2A CF         [24] 1795 	lcall	_eeprom_init
                           00050B  1796 	C$IO_Expander.c$272$1_0$133 ==.
                                   1797 ;	IO_Expander.c:272: PCF8574A_init();
      002570 12 24 CD         [24] 1798 	lcall	_PCF8574A_init
                           00050E  1799 	C$IO_Expander.c$273$1_0$133 ==.
                                   1800 ;	IO_Expander.c:273: init_INT0_interrupt(); // interrupts on input change
      002573 12 24 FF         [24] 1801 	lcall	_init_INT0_interrupt
                           000511  1802 	C$IO_Expander.c$274$1_0$133 ==.
                                   1803 ;	IO_Expander.c:274: set_P0_out(1); // initial output high
      002576 75 82 01         [24] 1804 	mov	dpl,#0x01
      002579 12 24 D4         [24] 1805 	lcall	_set_P0_out
                           000517  1806 	C$IO_Expander.c$277$1_0$133 ==.
                                   1807 ;	IO_Expander.c:277: while (1) {
      00257C                       1808 00110$:
                           000517  1809 	C$IO_Expander.c$278$2_0$134 ==.
                                   1810 ;	IO_Expander.c:278: show_menu();
      00257C 12 26 13         [24] 1811 	lcall	_show_menu
                           00051A  1812 	C$IO_Expander.c$279$2_0$134 ==.
                                   1813 ;	IO_Expander.c:279: choice = getchar();
      00257F 12 20 84         [24] 1814 	lcall	_getchar
      002582 AE 82            [24] 1815 	mov	r6,dpl
                           00051F  1816 	C$IO_Expander.c$280$2_0$134 ==.
                                   1817 ;	IO_Expander.c:280: putchar(choice); // echo choice
      002584 8E 05            [24] 1818 	mov	ar5,r6
      002586 7F 00            [12] 1819 	mov	r7,#0x00
      002588 8D 82            [24] 1820 	mov	dpl,r5
      00258A 8F 83            [24] 1821 	mov	dph,r7
      00258C C0 06            [24] 1822 	push	ar6
      00258E 12 20 65         [24] 1823 	lcall	_putchar
      002591 D0 06            [24] 1824 	pop	ar6
                           00052E  1825 	C$IO_Expander.c$282$2_0$134 ==.
                                   1826 ;	IO_Expander.c:282: switch (choice) {
      002593 BE 31 02         [24] 1827 	cjne	r6,#0x31,00142$
      002596 80 19            [24] 1828 	sjmp	00101$
      002598                       1829 00142$:
      002598 BE 32 02         [24] 1830 	cjne	r6,#0x32,00143$
      00259B 80 19            [24] 1831 	sjmp	00102$
      00259D                       1832 00143$:
      00259D BE 33 02         [24] 1833 	cjne	r6,#0x33,00144$
      0025A0 80 19            [24] 1834 	sjmp	00103$
      0025A2                       1835 00144$:
      0025A2 BE 34 02         [24] 1836 	cjne	r6,#0x34,00145$
      0025A5 80 19            [24] 1837 	sjmp	00104$
      0025A7                       1838 00145$:
      0025A7 BE 35 02         [24] 1839 	cjne	r6,#0x35,00146$
      0025AA 80 19            [24] 1840 	sjmp	00105$
      0025AC                       1841 00146$:
                           000547  1842 	C$IO_Expander.c$283$3_0$135 ==.
                                   1843 ;	IO_Expander.c:283: case '1':
      0025AC BE 36 57         [24] 1844 	cjne	r6,#0x36,00107$
      0025AF 80 31            [24] 1845 	sjmp	00106$
      0025B1                       1846 00101$:
                           00054C  1847 	C$IO_Expander.c$284$3_0$135 ==.
                                   1848 ;	IO_Expander.c:284: write_byte_menu();
      0025B1 12 26 80         [24] 1849 	lcall	_write_byte_menu
                           00054F  1850 	C$IO_Expander.c$285$3_0$135 ==.
                                   1851 ;	IO_Expander.c:285: break;
                           00054F  1852 	C$IO_Expander.c$286$3_0$135 ==.
                                   1853 ;	IO_Expander.c:286: case '2':
      0025B4 80 C6            [24] 1854 	sjmp	00110$
      0025B6                       1855 00102$:
                           000551  1856 	C$IO_Expander.c$287$3_0$135 ==.
                                   1857 ;	IO_Expander.c:287: read_byte_menu();
      0025B6 12 27 B4         [24] 1858 	lcall	_read_byte_menu
                           000554  1859 	C$IO_Expander.c$288$3_0$135 ==.
                                   1860 ;	IO_Expander.c:288: break;
                           000554  1861 	C$IO_Expander.c$289$3_0$135 ==.
                                   1862 ;	IO_Expander.c:289: case '3':
      0025B9 80 C1            [24] 1863 	sjmp	00110$
      0025BB                       1864 00103$:
                           000556  1865 	C$IO_Expander.c$290$3_0$135 ==.
                                   1866 ;	IO_Expander.c:290: hex_dump_menu();
      0025BB 12 28 91         [24] 1867 	lcall	_hex_dump_menu
                           000559  1868 	C$IO_Expander.c$291$3_0$135 ==.
                                   1869 ;	IO_Expander.c:291: break;
                           000559  1870 	C$IO_Expander.c$292$3_0$135 ==.
                                   1871 ;	IO_Expander.c:292: case '4':
      0025BE 80 BC            [24] 1872 	sjmp	00110$
      0025C0                       1873 00104$:
                           00055B  1874 	C$IO_Expander.c$293$3_0$135 ==.
                                   1875 ;	IO_Expander.c:293: reset_eeprom_menu();
      0025C0 12 2A 68         [24] 1876 	lcall	_reset_eeprom_menu
                           00055E  1877 	C$IO_Expander.c$294$3_0$135 ==.
                                   1878 ;	IO_Expander.c:294: break;
                           00055E  1879 	C$IO_Expander.c$295$3_0$135 ==.
                                   1880 ;	IO_Expander.c:295: case '5':
      0025C3 80 B7            [24] 1881 	sjmp	00110$
      0025C5                       1882 00105$:
                           000560  1883 	C$IO_Expander.c$296$3_0$135 ==.
                                   1884 ;	IO_Expander.c:296: io_link = true;
      0025C5 90 04 8E         [24] 1885 	mov	dptr,#_io_link
      0025C8 74 01            [12] 1886 	mov	a,#0x01
      0025CA F0               [24] 1887 	movx	@dptr,a
                           000566  1888 	C$IO_Expander.c$300$4_0$136 ==.
                                   1889 ;	IO_Expander.c:300: PCF8574A_read(&port_data);
      0025CB 90 04 38         [24] 1890 	mov	dptr,#_main_port_data_262144_136
      0025CE 75 F0 00         [24] 1891 	mov	b,#0x00
      0025D1 12 24 93         [24] 1892 	lcall	_PCF8574A_read
                           00056F  1893 	C$IO_Expander.c$301$5_0$137 ==.
                                   1894 ;	IO_Expander.c:301: bool pin7 = (port_data & INPUT_PIN_MASK);
      0025D4 90 04 38         [24] 1895 	mov	dptr,#_main_port_data_262144_136
      0025D7 E0               [24] 1896 	movx	a,@dptr
      0025D8 23               [12] 1897 	rl	a
      0025D9 54 01            [12] 1898 	anl	a,#0x01
                           000576  1899 	C$IO_Expander.c$302$4_1$137 ==.
                                   1900 ;	IO_Expander.c:302: set_P0_out(pin7);
      0025DB F5 82            [12] 1901 	mov	dpl,a
      0025DD 12 24 D4         [24] 1902 	lcall	_set_P0_out
                           00057B  1903 	C$IO_Expander.c$304$3_0$135 ==.
                                   1904 ;	IO_Expander.c:304: break;
                           00057B  1905 	C$IO_Expander.c$305$3_0$135 ==.
                                   1906 ;	IO_Expander.c:305: case '6':
      0025E0 80 9A            [24] 1907 	sjmp	00110$
      0025E2                       1908 00106$:
                           00057D  1909 	C$IO_Expander.c$306$3_0$135 ==.
                                   1910 ;	IO_Expander.c:306: io_link = false;
      0025E2 90 04 8E         [24] 1911 	mov	dptr,#_io_link
      0025E5 E4               [12] 1912 	clr	a
      0025E6 F0               [24] 1913 	movx	@dptr,a
                           000582  1914 	C$IO_Expander.c$310$4_0$138 ==.
                                   1915 ;	IO_Expander.c:310: PCF8574A_read(&port_data);
      0025E7 90 04 39         [24] 1916 	mov	dptr,#_main_port_data_262144_138
      0025EA 75 F0 00         [24] 1917 	mov	b,#0x00
      0025ED 12 24 93         [24] 1918 	lcall	_PCF8574A_read
                           00058B  1919 	C$IO_Expander.c$311$5_0$139 ==.
                                   1920 ;	IO_Expander.c:311: bool pin7 = (port_data & INPUT_PIN_MASK);
      0025F0 90 04 39         [24] 1921 	mov	dptr,#_main_port_data_262144_138
      0025F3 E0               [24] 1922 	movx	a,@dptr
      0025F4 23               [12] 1923 	rl	a
      0025F5 54 01            [12] 1924 	anl	a,#0x01
                           000592  1925 	C$IO_Expander.c$312$4_1$139 ==.
                                   1926 ;	IO_Expander.c:312: set_P0_out(!pin7);
      0025F7 B4 01 00         [24] 1927 	cjne	a,#0x01,00148$
      0025FA                       1928 00148$:
      0025FA 92 01            [24] 1929 	mov  _main_sloc0_1_0,c
      0025FC E4               [12] 1930 	clr	a
      0025FD 33               [12] 1931 	rlc	a
      0025FE F5 82            [12] 1932 	mov	dpl,a
      002600 12 24 D4         [24] 1933 	lcall	_set_P0_out
                           00059E  1934 	C$IO_Expander.c$314$3_0$135 ==.
                                   1935 ;	IO_Expander.c:314: break;
      002603 02 25 7C         [24] 1936 	ljmp	00110$
                           0005A1  1937 	C$IO_Expander.c$316$3_0$135 ==.
                                   1938 ;	IO_Expander.c:316: default:
      002606                       1939 00107$:
                           0005A1  1940 	C$IO_Expander.c$317$3_0$135 ==.
                                   1941 ;	IO_Expander.c:317: putstr("Not a choice we have. Please try again.\r\n\r\n");
      002606 90 38 0E         [24] 1942 	mov	dptr,#___str_6
      002609 75 F0 80         [24] 1943 	mov	b,#0x80
      00260C 12 20 92         [24] 1944 	lcall	_putstr
                           0005AA  1945 	C$IO_Expander.c$319$1_0$133 ==.
                                   1946 ;	IO_Expander.c:319: }
      00260F 02 25 7C         [24] 1947 	ljmp	00110$
                           0005AD  1948 	C$IO_Expander.c$321$1_0$133 ==.
                                   1949 ;	IO_Expander.c:321: }
                           0005AD  1950 	C$IO_Expander.c$321$1_0$133 ==.
                           0005AD  1951 	XG$main$0$0 ==.
      002612 22               [24] 1952 	ret
                                   1953 ;------------------------------------------------------------
                                   1954 ;Allocation info for local variables in function 'show_menu'
                                   1955 ;------------------------------------------------------------
                           0005AE  1956 	G$show_menu$0$0 ==.
                           0005AE  1957 	C$IO_Expander.c$324$1_0$141 ==.
                                   1958 ;	IO_Expander.c:324: void show_menu(void) {
                                   1959 ;	-----------------------------------------
                                   1960 ;	 function show_menu
                                   1961 ;	-----------------------------------------
      002613                       1962 _show_menu:
                           0005AE  1963 	C$IO_Expander.c$325$1_0$141 ==.
                                   1964 ;	IO_Expander.c:325: putstr("\r\n");
      002613 90 38 0B         [24] 1965 	mov	dptr,#___str_5
      002616 75 F0 80         [24] 1966 	mov	b,#0x80
      002619 12 20 92         [24] 1967 	lcall	_putstr
                           0005B7  1968 	C$IO_Expander.c$326$1_0$141 ==.
                                   1969 ;	IO_Expander.c:326: putstr(" --------- I2C Interface Menu --------- \r\n");
      00261C 90 38 3A         [24] 1970 	mov	dptr,#___str_7
      00261F 75 F0 80         [24] 1971 	mov	b,#0x80
      002622 12 20 92         [24] 1972 	lcall	_putstr
                           0005C0  1973 	C$IO_Expander.c$327$1_0$141 ==.
                                   1974 ;	IO_Expander.c:327: putstr_blue("EEPROM Functions:\r\n");
      002625 90 38 65         [24] 1975 	mov	dptr,#___str_8
      002628 75 F0 80         [24] 1976 	mov	b,#0x80
      00262B 12 21 35         [24] 1977 	lcall	_putstr_blue
                           0005C9  1978 	C$IO_Expander.c$328$1_0$141 ==.
                                   1979 ;	IO_Expander.c:328: putstr("1. Write Byte to EEPROM\r\n");
      00262E 90 38 79         [24] 1980 	mov	dptr,#___str_9
      002631 75 F0 80         [24] 1981 	mov	b,#0x80
      002634 12 20 92         [24] 1982 	lcall	_putstr
                           0005D2  1983 	C$IO_Expander.c$329$1_0$141 ==.
                                   1984 ;	IO_Expander.c:329: putstr("2. Read Byte from EEPROM\r\n");
      002637 90 38 93         [24] 1985 	mov	dptr,#___str_10
      00263A 75 F0 80         [24] 1986 	mov	b,#0x80
      00263D 12 20 92         [24] 1987 	lcall	_putstr
                           0005DB  1988 	C$IO_Expander.c$330$1_0$141 ==.
                                   1989 ;	IO_Expander.c:330: putstr("3. Hex Dump EEPROM\r\n");
      002640 90 38 AE         [24] 1990 	mov	dptr,#___str_11
      002643 75 F0 80         [24] 1991 	mov	b,#0x80
      002646 12 20 92         [24] 1992 	lcall	_putstr
                           0005E4  1993 	C$IO_Expander.c$331$1_0$141 ==.
                                   1994 ;	IO_Expander.c:331: putstr("4. Reset EEPROM\r\n");
      002649 90 38 C3         [24] 1995 	mov	dptr,#___str_12
      00264C 75 F0 80         [24] 1996 	mov	b,#0x80
      00264F 12 20 92         [24] 1997 	lcall	_putstr
                           0005ED  1998 	C$IO_Expander.c$332$1_0$141 ==.
                                   1999 ;	IO_Expander.c:332: putstr_green("PCF8574A I/O Expander Functions:\r\n");
      002652 90 38 D5         [24] 2000 	mov	dptr,#___str_13
      002655 75 F0 80         [24] 2001 	mov	b,#0x80
      002658 12 21 6C         [24] 2002 	lcall	_putstr_green
                           0005F6  2003 	C$IO_Expander.c$333$1_0$141 ==.
                                   2004 ;	IO_Expander.c:333: putstr("5. Make Output = Input\r\n");
      00265B 90 38 F8         [24] 2005 	mov	dptr,#___str_14
      00265E 75 F0 80         [24] 2006 	mov	b,#0x80
      002661 12 20 92         [24] 2007 	lcall	_putstr
                           0005FF  2008 	C$IO_Expander.c$334$1_0$141 ==.
                                   2009 ;	IO_Expander.c:334: putstr("6. Make Output = !Input \r\n");
      002664 90 39 11         [24] 2010 	mov	dptr,#___str_15
      002667 75 F0 80         [24] 2011 	mov	b,#0x80
      00266A 12 20 92         [24] 2012 	lcall	_putstr
                           000608  2013 	C$IO_Expander.c$335$1_0$141 ==.
                                   2014 ;	IO_Expander.c:335: puts("----------------------------------------\r\n");
      00266D 90 39 2C         [24] 2015 	mov	dptr,#___str_16
      002670 75 F0 80         [24] 2016 	mov	b,#0x80
      002673 12 2C CF         [24] 2017 	lcall	_puts
                           000611  2018 	C$IO_Expander.c$336$1_0$141 ==.
                                   2019 ;	IO_Expander.c:336: putstr("Put what you want to do: ");
      002676 90 39 57         [24] 2020 	mov	dptr,#___str_17
      002679 75 F0 80         [24] 2021 	mov	b,#0x80
      00267C 12 20 92         [24] 2022 	lcall	_putstr
                           00061A  2023 	C$IO_Expander.c$337$1_0$141 ==.
                                   2024 ;	IO_Expander.c:337: }
                           00061A  2025 	C$IO_Expander.c$337$1_0$141 ==.
                           00061A  2026 	XG$show_menu$0$0 ==.
      00267F 22               [24] 2027 	ret
                                   2028 ;------------------------------------------------------------
                                   2029 ;Allocation info for local variables in function 'write_byte_menu'
                                   2030 ;------------------------------------------------------------
                                   2031 ;address                   Allocated with name '_write_byte_menu_address_65536_143'
                                   2032 ;data                      Allocated with name '_write_byte_menu_data_65536_143'
                                   2033 ;------------------------------------------------------------
                           00061B  2034 	G$write_byte_menu$0$0 ==.
                           00061B  2035 	C$IO_Expander.c$339$1_0$143 ==.
                                   2036 ;	IO_Expander.c:339: void write_byte_menu(void) {
                                   2037 ;	-----------------------------------------
                                   2038 ;	 function write_byte_menu
                                   2039 ;	-----------------------------------------
      002680                       2040 _write_byte_menu:
                           00061B  2041 	C$IO_Expander.c$342$1_0$143 ==.
                                   2042 ;	IO_Expander.c:342: putstr_blue("\r\n--- Write Byte to EEPROM ---\r\n");
      002680 90 39 71         [24] 2043 	mov	dptr,#___str_18
      002683 75 F0 80         [24] 2044 	mov	b,#0x80
      002686 12 21 35         [24] 2045 	lcall	_putstr_blue
                           000624  2046 	C$IO_Expander.c$345$1_0$143 ==.
                                   2047 ;	IO_Expander.c:345: putstr("Enter EEPROM address (0-7FF hex): ");
      002689 90 39 92         [24] 2048 	mov	dptr,#___str_19
      00268C 75 F0 80         [24] 2049 	mov	b,#0x80
      00268F 12 20 92         [24] 2050 	lcall	_putstr
                           00062D  2051 	C$IO_Expander.c$346$1_0$143 ==.
                                   2052 ;	IO_Expander.c:346: get_user_input(input_buffer, INPUT_BUFFER_SIZE);
      002692 90 04 18         [24] 2053 	mov	dptr,#_get_user_input_PARM_2
      002695 74 14            [12] 2054 	mov	a,#0x14
      002697 F0               [24] 2055 	movx	@dptr,a
      002698 90 04 24         [24] 2056 	mov	dptr,#_input_buffer
      00269B 75 F0 00         [24] 2057 	mov	b,#0x00
      00269E 12 23 49         [24] 2058 	lcall	_get_user_input
                           00063C  2059 	C$IO_Expander.c$347$1_0$143 ==.
                                   2060 ;	IO_Expander.c:347: address = simple_hex_to_int(input_buffer);
      0026A1 90 04 24         [24] 2061 	mov	dptr,#_input_buffer
      0026A4 75 F0 00         [24] 2062 	mov	b,#0x00
      0026A7 12 21 B0         [24] 2063 	lcall	_simple_hex_to_int
      0026AA AE 82            [24] 2064 	mov	r6,dpl
      0026AC AF 83            [24] 2065 	mov	r7,dph
                           000649  2066 	C$IO_Expander.c$349$1_0$143 ==.
                                   2067 ;	IO_Expander.c:349: if (address > EEPROM_MAX_ADDR) {
      0026AE 8E 04            [24] 2068 	mov	ar4,r6
      0026B0 8F 05            [24] 2069 	mov	ar5,r7
      0026B2 C3               [12] 2070 	clr	c
      0026B3 74 FF            [12] 2071 	mov	a,#0xff
      0026B5 9C               [12] 2072 	subb	a,r4
      0026B6 74 07            [12] 2073 	mov	a,#0x07
      0026B8 9D               [12] 2074 	subb	a,r5
      0026B9 50 0C            [24] 2075 	jnc	00102$
                           000656  2076 	C$IO_Expander.c$350$2_0$144 ==.
                                   2077 ;	IO_Expander.c:350: putstr("Error: Address out of range (max 7FF)\r\n");
      0026BB 90 39 B5         [24] 2078 	mov	dptr,#___str_20
      0026BE 75 F0 80         [24] 2079 	mov	b,#0x80
      0026C1 12 20 92         [24] 2080 	lcall	_putstr
                           00065F  2081 	C$IO_Expander.c$351$2_0$144 ==.
                                   2082 ;	IO_Expander.c:351: return;
      0026C4 02 27 B3         [24] 2083 	ljmp	00105$
      0026C7                       2084 00102$:
                           000662  2085 	C$IO_Expander.c$355$1_0$143 ==.
                                   2086 ;	IO_Expander.c:355: putstr("Enter data byte (0-FF hex): ");
      0026C7 90 39 DD         [24] 2087 	mov	dptr,#___str_21
      0026CA 75 F0 80         [24] 2088 	mov	b,#0x80
      0026CD C0 07            [24] 2089 	push	ar7
      0026CF C0 06            [24] 2090 	push	ar6
      0026D1 12 20 92         [24] 2091 	lcall	_putstr
                           00066F  2092 	C$IO_Expander.c$356$1_0$143 ==.
                                   2093 ;	IO_Expander.c:356: get_user_input(input_buffer, INPUT_BUFFER_SIZE);
      0026D4 90 04 18         [24] 2094 	mov	dptr,#_get_user_input_PARM_2
      0026D7 74 14            [12] 2095 	mov	a,#0x14
      0026D9 F0               [24] 2096 	movx	@dptr,a
      0026DA 90 04 24         [24] 2097 	mov	dptr,#_input_buffer
      0026DD 75 F0 00         [24] 2098 	mov	b,#0x00
      0026E0 12 23 49         [24] 2099 	lcall	_get_user_input
                           00067E  2100 	C$IO_Expander.c$357$1_0$143 ==.
                                   2101 ;	IO_Expander.c:357: data = simple_hex_to_int(input_buffer);
      0026E3 90 04 24         [24] 2102 	mov	dptr,#_input_buffer
      0026E6 75 F0 00         [24] 2103 	mov	b,#0x00
      0026E9 12 21 B0         [24] 2104 	lcall	_simple_hex_to_int
      0026EC AC 82            [24] 2105 	mov	r4,dpl
      0026EE AD 83            [24] 2106 	mov	r5,dph
      0026F0 D0 06            [24] 2107 	pop	ar6
      0026F2 D0 07            [24] 2108 	pop	ar7
                           00068F  2109 	C$IO_Expander.c$359$1_0$143 ==.
                                   2110 ;	IO_Expander.c:359: if (data > 0xFF) {
      0026F4 8C 02            [24] 2111 	mov	ar2,r4
      0026F6 8D 03            [24] 2112 	mov	ar3,r5
      0026F8 C3               [12] 2113 	clr	c
      0026F9 74 FF            [12] 2114 	mov	a,#0xff
      0026FB 9A               [12] 2115 	subb	a,r2
      0026FC E4               [12] 2116 	clr	a
      0026FD 9B               [12] 2117 	subb	a,r3
      0026FE 50 0C            [24] 2118 	jnc	00104$
                           00069B  2119 	C$IO_Expander.c$360$2_0$145 ==.
                                   2120 ;	IO_Expander.c:360: putstr("Error: Data out of range (max FF)\r\n");
      002700 90 39 FA         [24] 2121 	mov	dptr,#___str_22
      002703 75 F0 80         [24] 2122 	mov	b,#0x80
      002706 12 20 92         [24] 2123 	lcall	_putstr
                           0006A4  2124 	C$IO_Expander.c$361$2_0$145 ==.
                                   2125 ;	IO_Expander.c:361: return;
      002709 02 27 B3         [24] 2126 	ljmp	00105$
      00270C                       2127 00104$:
                           0006A7  2128 	C$IO_Expander.c$365$1_0$143 ==.
                                   2129 ;	IO_Expander.c:365: putstr("Writing");
      00270C 90 3A 1E         [24] 2130 	mov	dptr,#___str_23
      00270F 75 F0 80         [24] 2131 	mov	b,#0x80
      002712 C0 07            [24] 2132 	push	ar7
      002714 C0 06            [24] 2133 	push	ar6
      002716 C0 05            [24] 2134 	push	ar5
      002718 C0 04            [24] 2135 	push	ar4
      00271A 12 20 92         [24] 2136 	lcall	_putstr
      00271D D0 04            [24] 2137 	pop	ar4
      00271F D0 05            [24] 2138 	pop	ar5
      002721 D0 06            [24] 2139 	pop	ar6
      002723 D0 07            [24] 2140 	pop	ar7
                           0006C0  2141 	C$IO_Expander.c$366$1_0$143 ==.
                                   2142 ;	IO_Expander.c:366: device_addr = 0xA0 | ((address >> 7) & 0x0E); 
      002725 8E 02            [24] 2143 	mov	ar2,r6
      002727 EF               [12] 2144 	mov	a,r7
      002728 A2 E7            [12] 2145 	mov	c,acc.7
      00272A CA               [12] 2146 	xch	a,r2
      00272B 33               [12] 2147 	rlc	a
      00272C CA               [12] 2148 	xch	a,r2
      00272D 33               [12] 2149 	rlc	a
      00272E CA               [12] 2150 	xch	a,r2
      00272F 54 01            [12] 2151 	anl	a,#0x01
      002731 74 0E            [12] 2152 	mov	a,#0x0e
      002733 5A               [12] 2153 	anl	a,r2
      002734 44 A0            [12] 2154 	orl	a,#0xa0
      002736 F5 09            [12] 2155 	mov	_device_addr,a
                           0006D3  2156 	C$IO_Expander.c$367$1_0$143 ==.
                                   2157 ;	IO_Expander.c:367: addr_low = address & 0xFF; 
      002738 8E 0A            [24] 2158 	mov	_addr_low,r6
                           0006D5  2159 	C$IO_Expander.c$368$1_0$143 ==.
                                   2160 ;	IO_Expander.c:368: printf("\r\ndevice addr: 0x%02X, lower addr: 0x%02X\r\n", device_addr, addr_low);
      00273A AA 0A            [24] 2161 	mov	r2,_addr_low
      00273C 7B 00            [12] 2162 	mov	r3,#0x00
      00273E A8 09            [24] 2163 	mov	r0,_device_addr
      002740 79 00            [12] 2164 	mov	r1,#0x00
      002742 C0 07            [24] 2165 	push	ar7
      002744 C0 06            [24] 2166 	push	ar6
      002746 C0 05            [24] 2167 	push	ar5
      002748 C0 04            [24] 2168 	push	ar4
      00274A C0 02            [24] 2169 	push	ar2
      00274C C0 03            [24] 2170 	push	ar3
      00274E C0 00            [24] 2171 	push	ar0
      002750 C0 01            [24] 2172 	push	ar1
      002752 74 26            [12] 2173 	mov	a,#___str_24
      002754 C0 E0            [24] 2174 	push	acc
      002756 74 3A            [12] 2175 	mov	a,#(___str_24 >> 8)
      002758 C0 E0            [24] 2176 	push	acc
      00275A 74 80            [12] 2177 	mov	a,#0x80
      00275C C0 E0            [24] 2178 	push	acc
      00275E 12 2D 7D         [24] 2179 	lcall	_printf
      002761 E5 81            [12] 2180 	mov	a,sp
      002763 24 F9            [12] 2181 	add	a,#0xf9
      002765 F5 81            [12] 2182 	mov	sp,a
      002767 D0 04            [24] 2183 	pop	ar4
      002769 D0 05            [24] 2184 	pop	ar5
                           000706  2185 	C$IO_Expander.c$369$1_0$143 ==.
                                   2186 ;	IO_Expander.c:369: asm_data = data;
      00276B 8C 0B            [24] 2187 	mov	_asm_data,r4
                           000708  2188 	C$IO_Expander.c$370$1_0$143 ==.
                                   2189 ;	IO_Expander.c:370: BYTEW();
      00276D 12 2A D6         [24] 2190 	lcall	_BYTEW
                           00070B  2191 	C$IO_Expander.c$372$1_0$143 ==.
                                   2192 ;	IO_Expander.c:372: putstr_blue("Success!\r\n");
      002770 90 3A 52         [24] 2193 	mov	dptr,#___str_25
      002773 75 F0 80         [24] 2194 	mov	b,#0x80
      002776 12 21 35         [24] 2195 	lcall	_putstr_blue
      002779 D0 06            [24] 2196 	pop	ar6
      00277B D0 07            [24] 2197 	pop	ar7
                           000718  2198 	C$IO_Expander.c$373$1_0$143 ==.
                                   2199 ;	IO_Expander.c:373: printf("%03X: ", address);
      00277D C0 06            [24] 2200 	push	ar6
      00277F C0 07            [24] 2201 	push	ar7
      002781 74 FE            [12] 2202 	mov	a,#___str_3
      002783 C0 E0            [24] 2203 	push	acc
      002785 74 37            [12] 2204 	mov	a,#(___str_3 >> 8)
      002787 C0 E0            [24] 2205 	push	acc
      002789 74 80            [12] 2206 	mov	a,#0x80
      00278B C0 E0            [24] 2207 	push	acc
      00278D 12 2D 7D         [24] 2208 	lcall	_printf
      002790 E5 81            [12] 2209 	mov	a,sp
      002792 24 FB            [12] 2210 	add	a,#0xfb
      002794 F5 81            [12] 2211 	mov	sp,a
                           000731  2212 	C$IO_Expander.c$374$1_0$143 ==.
                                   2213 ;	IO_Expander.c:374: printf("%02X\r\n", asm_data);
      002796 AE 0B            [24] 2214 	mov	r6,_asm_data
      002798 7F 00            [12] 2215 	mov	r7,#0x00
      00279A C0 06            [24] 2216 	push	ar6
      00279C C0 07            [24] 2217 	push	ar7
      00279E 74 5D            [12] 2218 	mov	a,#___str_26
      0027A0 C0 E0            [24] 2219 	push	acc
      0027A2 74 3A            [12] 2220 	mov	a,#(___str_26 >> 8)
      0027A4 C0 E0            [24] 2221 	push	acc
      0027A6 74 80            [12] 2222 	mov	a,#0x80
      0027A8 C0 E0            [24] 2223 	push	acc
      0027AA 12 2D 7D         [24] 2224 	lcall	_printf
      0027AD E5 81            [12] 2225 	mov	a,sp
      0027AF 24 FB            [12] 2226 	add	a,#0xfb
      0027B1 F5 81            [12] 2227 	mov	sp,a
      0027B3                       2228 00105$:
                           00074E  2229 	C$IO_Expander.c$375$1_0$143 ==.
                                   2230 ;	IO_Expander.c:375: }
                           00074E  2231 	C$IO_Expander.c$375$1_0$143 ==.
                           00074E  2232 	XG$write_byte_menu$0$0 ==.
      0027B3 22               [24] 2233 	ret
                                   2234 ;------------------------------------------------------------
                                   2235 ;Allocation info for local variables in function 'read_byte_menu'
                                   2236 ;------------------------------------------------------------
                                   2237 ;address                   Allocated with name '_read_byte_menu_address_65536_147'
                                   2238 ;------------------------------------------------------------
                           00074F  2239 	G$read_byte_menu$0$0 ==.
                           00074F  2240 	C$IO_Expander.c$377$1_0$147 ==.
                                   2241 ;	IO_Expander.c:377: void read_byte_menu(void) {
                                   2242 ;	-----------------------------------------
                                   2243 ;	 function read_byte_menu
                                   2244 ;	-----------------------------------------
      0027B4                       2245 _read_byte_menu:
                           00074F  2246 	C$IO_Expander.c$380$1_0$147 ==.
                                   2247 ;	IO_Expander.c:380: putstr_blue("\r\n--- Read Byte from EEPROM ---\r\n");
      0027B4 90 3A 64         [24] 2248 	mov	dptr,#___str_27
      0027B7 75 F0 80         [24] 2249 	mov	b,#0x80
      0027BA 12 21 35         [24] 2250 	lcall	_putstr_blue
                           000758  2251 	C$IO_Expander.c$383$1_0$147 ==.
                                   2252 ;	IO_Expander.c:383: putstr("Enter EEPROM address (0-7FF hex): ");
      0027BD 90 39 92         [24] 2253 	mov	dptr,#___str_19
      0027C0 75 F0 80         [24] 2254 	mov	b,#0x80
      0027C3 12 20 92         [24] 2255 	lcall	_putstr
                           000761  2256 	C$IO_Expander.c$384$1_0$147 ==.
                                   2257 ;	IO_Expander.c:384: get_user_input(input_buffer, INPUT_BUFFER_SIZE);
      0027C6 90 04 18         [24] 2258 	mov	dptr,#_get_user_input_PARM_2
      0027C9 74 14            [12] 2259 	mov	a,#0x14
      0027CB F0               [24] 2260 	movx	@dptr,a
      0027CC 90 04 24         [24] 2261 	mov	dptr,#_input_buffer
      0027CF 75 F0 00         [24] 2262 	mov	b,#0x00
      0027D2 12 23 49         [24] 2263 	lcall	_get_user_input
                           000770  2264 	C$IO_Expander.c$385$1_0$147 ==.
                                   2265 ;	IO_Expander.c:385: address = simple_hex_to_int(input_buffer);  
      0027D5 90 04 24         [24] 2266 	mov	dptr,#_input_buffer
      0027D8 75 F0 00         [24] 2267 	mov	b,#0x00
      0027DB 12 21 B0         [24] 2268 	lcall	_simple_hex_to_int
      0027DE AE 82            [24] 2269 	mov	r6,dpl
      0027E0 AF 83            [24] 2270 	mov	r7,dph
                           00077D  2271 	C$IO_Expander.c$387$1_0$147 ==.
                                   2272 ;	IO_Expander.c:387: if (address > EEPROM_MAX_ADDR) {
      0027E2 8E 04            [24] 2273 	mov	ar4,r6
      0027E4 8F 05            [24] 2274 	mov	ar5,r7
      0027E6 C3               [12] 2275 	clr	c
      0027E7 74 FF            [12] 2276 	mov	a,#0xff
      0027E9 9C               [12] 2277 	subb	a,r4
      0027EA 74 07            [12] 2278 	mov	a,#0x07
      0027EC 9D               [12] 2279 	subb	a,r5
      0027ED 50 0C            [24] 2280 	jnc	00102$
                           00078A  2281 	C$IO_Expander.c$388$2_0$148 ==.
                                   2282 ;	IO_Expander.c:388: putstr("Error: Address out of range (max 7FF)\r\n");
      0027EF 90 39 B5         [24] 2283 	mov	dptr,#___str_20
      0027F2 75 F0 80         [24] 2284 	mov	b,#0x80
      0027F5 12 20 92         [24] 2285 	lcall	_putstr
                           000793  2286 	C$IO_Expander.c$389$2_0$148 ==.
                                   2287 ;	IO_Expander.c:389: return;
      0027F8 02 28 90         [24] 2288 	ljmp	00103$
      0027FB                       2289 00102$:
                           000796  2290 	C$IO_Expander.c$393$1_0$147 ==.
                                   2291 ;	IO_Expander.c:393: putstr("Reading");
      0027FB 90 3A 86         [24] 2292 	mov	dptr,#___str_28
      0027FE 75 F0 80         [24] 2293 	mov	b,#0x80
      002801 C0 07            [24] 2294 	push	ar7
      002803 C0 06            [24] 2295 	push	ar6
      002805 12 20 92         [24] 2296 	lcall	_putstr
      002808 D0 06            [24] 2297 	pop	ar6
      00280A D0 07            [24] 2298 	pop	ar7
                           0007A7  2299 	C$IO_Expander.c$394$1_0$147 ==.
                                   2300 ;	IO_Expander.c:394: device_addr = 0xA0 | ((address >> 7) & 0x0E);
      00280C 8E 04            [24] 2301 	mov	ar4,r6
      00280E EF               [12] 2302 	mov	a,r7
      00280F A2 E7            [12] 2303 	mov	c,acc.7
      002811 CC               [12] 2304 	xch	a,r4
      002812 33               [12] 2305 	rlc	a
      002813 CC               [12] 2306 	xch	a,r4
      002814 33               [12] 2307 	rlc	a
      002815 CC               [12] 2308 	xch	a,r4
      002816 54 01            [12] 2309 	anl	a,#0x01
      002818 74 0E            [12] 2310 	mov	a,#0x0e
      00281A 5C               [12] 2311 	anl	a,r4
      00281B 44 A0            [12] 2312 	orl	a,#0xa0
      00281D F5 09            [12] 2313 	mov	_device_addr,a
                           0007BA  2314 	C$IO_Expander.c$395$1_0$147 ==.
                                   2315 ;	IO_Expander.c:395: addr_low = address & 0xFF; 
      00281F 8E 0A            [24] 2316 	mov	_addr_low,r6
                           0007BC  2317 	C$IO_Expander.c$396$1_0$147 ==.
                                   2318 ;	IO_Expander.c:396: printf("\r\ndevice addr: 0x%02X, lower addr: 0x%02X\r\n", device_addr, addr_low);
      002821 AC 0A            [24] 2319 	mov	r4,_addr_low
      002823 7D 00            [12] 2320 	mov	r5,#0x00
      002825 AA 09            [24] 2321 	mov	r2,_device_addr
      002827 7B 00            [12] 2322 	mov	r3,#0x00
      002829 C0 07            [24] 2323 	push	ar7
      00282B C0 06            [24] 2324 	push	ar6
      00282D C0 04            [24] 2325 	push	ar4
      00282F C0 05            [24] 2326 	push	ar5
      002831 C0 02            [24] 2327 	push	ar2
      002833 C0 03            [24] 2328 	push	ar3
      002835 74 26            [12] 2329 	mov	a,#___str_24
      002837 C0 E0            [24] 2330 	push	acc
      002839 74 3A            [12] 2331 	mov	a,#(___str_24 >> 8)
      00283B C0 E0            [24] 2332 	push	acc
      00283D 74 80            [12] 2333 	mov	a,#0x80
      00283F C0 E0            [24] 2334 	push	acc
      002841 12 2D 7D         [24] 2335 	lcall	_printf
      002844 E5 81            [12] 2336 	mov	a,sp
      002846 24 F9            [12] 2337 	add	a,#0xf9
      002848 F5 81            [12] 2338 	mov	sp,a
                           0007E5  2339 	C$IO_Expander.c$397$1_0$147 ==.
                                   2340 ;	IO_Expander.c:397: BYTERD(); 
      00284A 12 2A E9         [24] 2341 	lcall	_BYTERD
                           0007E8  2342 	C$IO_Expander.c$399$1_0$147 ==.
                                   2343 ;	IO_Expander.c:399: putstr_blue("Success!\r\n");
      00284D 90 3A 52         [24] 2344 	mov	dptr,#___str_25
      002850 75 F0 80         [24] 2345 	mov	b,#0x80
      002853 12 21 35         [24] 2346 	lcall	_putstr_blue
      002856 D0 06            [24] 2347 	pop	ar6
      002858 D0 07            [24] 2348 	pop	ar7
                           0007F5  2349 	C$IO_Expander.c$400$1_0$147 ==.
                                   2350 ;	IO_Expander.c:400: printf("%03X: ", address);
      00285A C0 06            [24] 2351 	push	ar6
      00285C C0 07            [24] 2352 	push	ar7
      00285E 74 FE            [12] 2353 	mov	a,#___str_3
      002860 C0 E0            [24] 2354 	push	acc
      002862 74 37            [12] 2355 	mov	a,#(___str_3 >> 8)
      002864 C0 E0            [24] 2356 	push	acc
      002866 74 80            [12] 2357 	mov	a,#0x80
      002868 C0 E0            [24] 2358 	push	acc
      00286A 12 2D 7D         [24] 2359 	lcall	_printf
      00286D E5 81            [12] 2360 	mov	a,sp
      00286F 24 FB            [12] 2361 	add	a,#0xfb
      002871 F5 81            [12] 2362 	mov	sp,a
                           00080E  2363 	C$IO_Expander.c$401$1_0$147 ==.
                                   2364 ;	IO_Expander.c:401: printf("%02X\r\n", asm_result);
      002873 AE 0C            [24] 2365 	mov	r6,_asm_result
      002875 7F 00            [12] 2366 	mov	r7,#0x00
      002877 C0 06            [24] 2367 	push	ar6
      002879 C0 07            [24] 2368 	push	ar7
      00287B 74 5D            [12] 2369 	mov	a,#___str_26
      00287D C0 E0            [24] 2370 	push	acc
      00287F 74 3A            [12] 2371 	mov	a,#(___str_26 >> 8)
      002881 C0 E0            [24] 2372 	push	acc
      002883 74 80            [12] 2373 	mov	a,#0x80
      002885 C0 E0            [24] 2374 	push	acc
      002887 12 2D 7D         [24] 2375 	lcall	_printf
      00288A E5 81            [12] 2376 	mov	a,sp
      00288C 24 FB            [12] 2377 	add	a,#0xfb
      00288E F5 81            [12] 2378 	mov	sp,a
      002890                       2379 00103$:
                           00082B  2380 	C$IO_Expander.c$402$1_0$147 ==.
                                   2381 ;	IO_Expander.c:402: }
                           00082B  2382 	C$IO_Expander.c$402$1_0$147 ==.
                           00082B  2383 	XG$read_byte_menu$0$0 ==.
      002890 22               [24] 2384 	ret
                                   2385 ;------------------------------------------------------------
                                   2386 ;Allocation info for local variables in function 'hex_dump_menu'
                                   2387 ;------------------------------------------------------------
                                   2388 ;sloc0                     Allocated with name '_hex_dump_menu_sloc0_1_0'
                                   2389 ;sloc1                     Allocated with name '_hex_dump_menu_sloc1_1_0'
                                   2390 ;start_addr                Allocated with name '_hex_dump_menu_start_addr_65536_150'
                                   2391 ;end_addr                  Allocated with name '_hex_dump_menu_end_addr_65536_150'
                                   2392 ;current_addr              Allocated with name '_hex_dump_menu_current_addr_65536_150'
                                   2393 ;data_buffer               Allocated with name '_hex_dump_menu_data_buffer_65536_150'
                                   2394 ;bytes_to_read             Allocated with name '_hex_dump_menu_bytes_to_read_65536_150'
                                   2395 ;bytes_in_line             Allocated with name '_hex_dump_menu_bytes_in_line_65536_150'
                                   2396 ;i                         Allocated with name '_hex_dump_menu_i_196608_157'
                                   2397 ;------------------------------------------------------------
                           00082C  2398 	G$hex_dump_menu$0$0 ==.
                           00082C  2399 	C$IO_Expander.c$404$1_0$150 ==.
                                   2400 ;	IO_Expander.c:404: void hex_dump_menu(void) {
                                   2401 ;	-----------------------------------------
                                   2402 ;	 function hex_dump_menu
                                   2403 ;	-----------------------------------------
      002891                       2404 _hex_dump_menu:
                           00082C  2405 	C$IO_Expander.c$409$1_0$150 ==.
                                   2406 ;	IO_Expander.c:409: putstr_blue("\r\n--- Hex Dump EEPROM ---\r\n");
      002891 90 3A 8E         [24] 2407 	mov	dptr,#___str_29
      002894 75 F0 80         [24] 2408 	mov	b,#0x80
      002897 12 21 35         [24] 2409 	lcall	_putstr_blue
                           000835  2410 	C$IO_Expander.c$412$1_0$150 ==.
                                   2411 ;	IO_Expander.c:412: putstr("Enter start address (0-7FF hex): ");
      00289A 90 3A AA         [24] 2412 	mov	dptr,#___str_30
      00289D 75 F0 80         [24] 2413 	mov	b,#0x80
      0028A0 12 20 92         [24] 2414 	lcall	_putstr
                           00083E  2415 	C$IO_Expander.c$413$1_0$150 ==.
                                   2416 ;	IO_Expander.c:413: get_user_input(input_buffer, INPUT_BUFFER_SIZE);
      0028A3 90 04 18         [24] 2417 	mov	dptr,#_get_user_input_PARM_2
      0028A6 74 14            [12] 2418 	mov	a,#0x14
      0028A8 F0               [24] 2419 	movx	@dptr,a
      0028A9 90 04 24         [24] 2420 	mov	dptr,#_input_buffer
      0028AC 75 F0 00         [24] 2421 	mov	b,#0x00
      0028AF 12 23 49         [24] 2422 	lcall	_get_user_input
                           00084D  2423 	C$IO_Expander.c$414$1_0$150 ==.
                                   2424 ;	IO_Expander.c:414: start_addr = simple_hex_to_int(input_buffer);  
      0028B2 90 04 24         [24] 2425 	mov	dptr,#_input_buffer
      0028B5 75 F0 00         [24] 2426 	mov	b,#0x00
      0028B8 12 21 B0         [24] 2427 	lcall	_simple_hex_to_int
      0028BB AE 82            [24] 2428 	mov	r6,dpl
      0028BD AF 83            [24] 2429 	mov	r7,dph
                           00085A  2430 	C$IO_Expander.c$416$1_0$150 ==.
                                   2431 ;	IO_Expander.c:416: if (start_addr > EEPROM_MAX_ADDR) {
      0028BF 8E 04            [24] 2432 	mov	ar4,r6
      0028C1 8F 05            [24] 2433 	mov	ar5,r7
      0028C3 C3               [12] 2434 	clr	c
      0028C4 74 FF            [12] 2435 	mov	a,#0xff
      0028C6 9C               [12] 2436 	subb	a,r4
      0028C7 74 07            [12] 2437 	mov	a,#0x07
      0028C9 9D               [12] 2438 	subb	a,r5
      0028CA 50 0C            [24] 2439 	jnc	00102$
                           000867  2440 	C$IO_Expander.c$417$2_0$151 ==.
                                   2441 ;	IO_Expander.c:417: putstr("Error: Start address out of range (max 7FF)\r\n");
      0028CC 90 3A CC         [24] 2442 	mov	dptr,#___str_31
      0028CF 75 F0 80         [24] 2443 	mov	b,#0x80
      0028D2 12 20 92         [24] 2444 	lcall	_putstr
                           000870  2445 	C$IO_Expander.c$418$2_0$151 ==.
                                   2446 ;	IO_Expander.c:418: return;
      0028D5 02 2A 67         [24] 2447 	ljmp	00117$
      0028D8                       2448 00102$:
                           000873  2449 	C$IO_Expander.c$422$1_0$150 ==.
                                   2450 ;	IO_Expander.c:422: putstr("Enter end address (0-7FF hex): ");
      0028D8 90 3A FA         [24] 2451 	mov	dptr,#___str_32
      0028DB 75 F0 80         [24] 2452 	mov	b,#0x80
      0028DE C0 07            [24] 2453 	push	ar7
      0028E0 C0 06            [24] 2454 	push	ar6
      0028E2 12 20 92         [24] 2455 	lcall	_putstr
                           000880  2456 	C$IO_Expander.c$423$1_0$150 ==.
                                   2457 ;	IO_Expander.c:423: get_user_input(input_buffer, INPUT_BUFFER_SIZE);
      0028E5 90 04 18         [24] 2458 	mov	dptr,#_get_user_input_PARM_2
      0028E8 74 14            [12] 2459 	mov	a,#0x14
      0028EA F0               [24] 2460 	movx	@dptr,a
      0028EB 90 04 24         [24] 2461 	mov	dptr,#_input_buffer
      0028EE 75 F0 00         [24] 2462 	mov	b,#0x00
      0028F1 12 23 49         [24] 2463 	lcall	_get_user_input
                           00088F  2464 	C$IO_Expander.c$424$1_0$150 ==.
                                   2465 ;	IO_Expander.c:424: end_addr = simple_hex_to_int(input_buffer);  
      0028F4 90 04 24         [24] 2466 	mov	dptr,#_input_buffer
      0028F7 75 F0 00         [24] 2467 	mov	b,#0x00
      0028FA 12 21 B0         [24] 2468 	lcall	_simple_hex_to_int
      0028FD AC 82            [24] 2469 	mov	r4,dpl
      0028FF AD 83            [24] 2470 	mov	r5,dph
      002901 D0 06            [24] 2471 	pop	ar6
      002903 D0 07            [24] 2472 	pop	ar7
                           0008A0  2473 	C$IO_Expander.c$426$1_0$150 ==.
                                   2474 ;	IO_Expander.c:426: if (end_addr > EEPROM_MAX_ADDR) {
      002905 8C 02            [24] 2475 	mov	ar2,r4
      002907 8D 03            [24] 2476 	mov	ar3,r5
      002909 C3               [12] 2477 	clr	c
      00290A 74 FF            [12] 2478 	mov	a,#0xff
      00290C 9A               [12] 2479 	subb	a,r2
      00290D 74 07            [12] 2480 	mov	a,#0x07
      00290F 9B               [12] 2481 	subb	a,r3
      002910 50 0C            [24] 2482 	jnc	00104$
                           0008AD  2483 	C$IO_Expander.c$427$2_0$152 ==.
                                   2484 ;	IO_Expander.c:427: putstr("Error: End address out of range (max 7FF)\r\n");
      002912 90 3B 1A         [24] 2485 	mov	dptr,#___str_33
      002915 75 F0 80         [24] 2486 	mov	b,#0x80
      002918 12 20 92         [24] 2487 	lcall	_putstr
                           0008B6  2488 	C$IO_Expander.c$428$2_0$152 ==.
                                   2489 ;	IO_Expander.c:428: return;
      00291B 02 2A 67         [24] 2490 	ljmp	00117$
      00291E                       2491 00104$:
                           0008B9  2492 	C$IO_Expander.c$431$1_0$150 ==.
                                   2493 ;	IO_Expander.c:431: if (start_addr > end_addr) {
      00291E C3               [12] 2494 	clr	c
      00291F EC               [12] 2495 	mov	a,r4
      002920 9E               [12] 2496 	subb	a,r6
      002921 ED               [12] 2497 	mov	a,r5
      002922 9F               [12] 2498 	subb	a,r7
      002923 50 0C            [24] 2499 	jnc	00106$
                           0008C0  2500 	C$IO_Expander.c$432$2_0$153 ==.
                                   2501 ;	IO_Expander.c:432: putstr("Error: Start address must be <= end address\r\n");
      002925 90 3B 46         [24] 2502 	mov	dptr,#___str_34
      002928 75 F0 80         [24] 2503 	mov	b,#0x80
      00292B 12 20 92         [24] 2504 	lcall	_putstr
                           0008C9  2505 	C$IO_Expander.c$433$2_0$153 ==.
                                   2506 ;	IO_Expander.c:433: return;
      00292E 02 2A 67         [24] 2507 	ljmp	00117$
      002931                       2508 00106$:
                           0008CC  2509 	C$IO_Expander.c$436$1_0$150 ==.
                                   2510 ;	IO_Expander.c:436: putstr("Reading EEPROM");
      002931 90 3B 74         [24] 2511 	mov	dptr,#___str_35
      002934 75 F0 80         [24] 2512 	mov	b,#0x80
      002937 C0 07            [24] 2513 	push	ar7
      002939 C0 06            [24] 2514 	push	ar6
      00293B C0 05            [24] 2515 	push	ar5
      00293D C0 04            [24] 2516 	push	ar4
      00293F 12 20 92         [24] 2517 	lcall	_putstr
                           0008DD  2518 	C$IO_Expander.c$437$1_0$150 ==.
                                   2519 ;	IO_Expander.c:437: print_newline();
      002942 12 21 A3         [24] 2520 	lcall	_print_newline
      002945 D0 04            [24] 2521 	pop	ar4
      002947 D0 05            [24] 2522 	pop	ar5
      002949 D0 06            [24] 2523 	pop	ar6
      00294B D0 07            [24] 2524 	pop	ar7
                           0008E8  2525 	C$IO_Expander.c$439$1_0$150 ==.
                                   2526 ;	IO_Expander.c:439: current_addr = start_addr;
      00294D 90 04 3A         [24] 2527 	mov	dptr,#_hex_dump_menu_current_addr_65536_150
      002950 EE               [12] 2528 	mov	a,r6
      002951 F0               [24] 2529 	movx	@dptr,a
      002952 EF               [12] 2530 	mov	a,r7
      002953 A3               [24] 2531 	inc	dptr
      002954 F0               [24] 2532 	movx	@dptr,a
                           0008F0  2533 	C$IO_Expander.c$441$4_0$158 ==.
                                   2534 ;	IO_Expander.c:441: while (current_addr <= end_addr) {
      002955                       2535 00111$:
      002955 90 04 3A         [24] 2536 	mov	dptr,#_hex_dump_menu_current_addr_65536_150
      002958 E0               [24] 2537 	movx	a,@dptr
      002959 FE               [12] 2538 	mov	r6,a
      00295A A3               [24] 2539 	inc	dptr
      00295B E0               [24] 2540 	movx	a,@dptr
      00295C FF               [12] 2541 	mov	r7,a
      00295D C3               [12] 2542 	clr	c
      00295E EC               [12] 2543 	mov	a,r4
      00295F 9E               [12] 2544 	subb	a,r6
      002960 ED               [12] 2545 	mov	a,r5
      002961 9F               [12] 2546 	subb	a,r7
      002962 50 03            [24] 2547 	jnc	00155$
      002964 02 2A 5E         [24] 2548 	ljmp	00113$
      002967                       2549 00155$:
                           000902  2550 	C$IO_Expander.c$442$2_0$154 ==.
                                   2551 ;	IO_Expander.c:442: bytes_to_read = end_addr - current_addr + 1;
      002967 EC               [12] 2552 	mov	a,r4
      002968 C3               [12] 2553 	clr	c
      002969 9E               [12] 2554 	subb	a,r6
      00296A FE               [12] 2555 	mov	r6,a
      00296B ED               [12] 2556 	mov	a,r5
      00296C 9F               [12] 2557 	subb	a,r7
      00296D FF               [12] 2558 	mov	r7,a
      00296E 0E               [12] 2559 	inc	r6
      00296F BE 00 01         [24] 2560 	cjne	r6,#0x00,00156$
      002972 0F               [12] 2561 	inc	r7
      002973                       2562 00156$:
                           00090E  2563 	C$IO_Expander.c$443$2_0$154 ==.
                                   2564 ;	IO_Expander.c:443: if (bytes_to_read > 16) {
      002973 8E 02            [24] 2565 	mov	ar2,r6
      002975 8F 03            [24] 2566 	mov	ar3,r7
      002977 C3               [12] 2567 	clr	c
      002978 74 10            [12] 2568 	mov	a,#0x10
      00297A 9A               [12] 2569 	subb	a,r2
      00297B E4               [12] 2570 	clr	a
      00297C 9B               [12] 2571 	subb	a,r3
      00297D 50 0B            [24] 2572 	jnc	00108$
                           00091A  2573 	C$IO_Expander.c$444$3_0$155 ==.
                                   2574 ;	IO_Expander.c:444: bytes_in_line = 16;
      00297F 90 04 4C         [24] 2575 	mov	dptr,#_hex_dump_menu_bytes_in_line_65536_150
      002982 74 10            [12] 2576 	mov	a,#0x10
      002984 F0               [24] 2577 	movx	@dptr,a
      002985 E4               [12] 2578 	clr	a
      002986 A3               [24] 2579 	inc	dptr
      002987 F0               [24] 2580 	movx	@dptr,a
      002988 80 08            [24] 2581 	sjmp	00125$
      00298A                       2582 00108$:
                           000925  2583 	C$IO_Expander.c$446$3_0$156 ==.
                                   2584 ;	IO_Expander.c:446: bytes_in_line = bytes_to_read;
      00298A 90 04 4C         [24] 2585 	mov	dptr,#_hex_dump_menu_bytes_in_line_65536_150
      00298D EE               [12] 2586 	mov	a,r6
      00298E F0               [24] 2587 	movx	@dptr,a
      00298F EF               [12] 2588 	mov	a,r7
      002990 A3               [24] 2589 	inc	dptr
      002991 F0               [24] 2590 	movx	@dptr,a
                           00092D  2591 	C$IO_Expander.c$450$1_0$150 ==.
                                   2592 ;	IO_Expander.c:450: for (uint8_t i = 0; i < bytes_in_line; i++) {
      002992                       2593 00125$:
      002992 90 04 3A         [24] 2594 	mov	dptr,#_hex_dump_menu_current_addr_65536_150
      002995 E0               [24] 2595 	movx	a,@dptr
      002996 FE               [12] 2596 	mov	r6,a
      002997 A3               [24] 2597 	inc	dptr
      002998 E0               [24] 2598 	movx	a,@dptr
      002999 FF               [12] 2599 	mov	r7,a
      00299A 90 04 4C         [24] 2600 	mov	dptr,#_hex_dump_menu_bytes_in_line_65536_150
      00299D E0               [24] 2601 	movx	a,@dptr
      00299E FA               [12] 2602 	mov	r2,a
      00299F A3               [24] 2603 	inc	dptr
      0029A0 E0               [24] 2604 	movx	a,@dptr
      0029A1 FB               [12] 2605 	mov	r3,a
      0029A2 79 00            [12] 2606 	mov	r1,#0x00
      0029A4                       2607 00115$:
      0029A4 C0 04            [24] 2608 	push	ar4
      0029A6 C0 05            [24] 2609 	push	ar5
      0029A8 89 00            [24] 2610 	mov	ar0,r1
      0029AA 7D 00            [12] 2611 	mov	r5,#0x00
      0029AC C3               [12] 2612 	clr	c
      0029AD E8               [12] 2613 	mov	a,r0
      0029AE 9A               [12] 2614 	subb	a,r2
      0029AF ED               [12] 2615 	mov	a,r5
      0029B0 9B               [12] 2616 	subb	a,r3
      0029B1 D0 05            [24] 2617 	pop	ar5
      0029B3 D0 04            [24] 2618 	pop	ar4
      0029B5 50 61            [24] 2619 	jnc	00110$
                           000952  2620 	C$IO_Expander.c$451$1_0$150 ==.
                                   2621 ;	IO_Expander.c:451: device_addr = 0xA0 | (((current_addr + i) >> 7) & 0x0E);
      0029B7 C0 04            [24] 2622 	push	ar4
      0029B9 C0 05            [24] 2623 	push	ar5
      0029BB 89 0D            [24] 2624 	mov	_hex_dump_menu_sloc0_1_0,r1
      0029BD 75 0E 00         [24] 2625 	mov	(_hex_dump_menu_sloc0_1_0 + 1),#0x00
      0029C0 8E 0F            [24] 2626 	mov	_hex_dump_menu_sloc1_1_0,r6
      0029C2 8F 10            [24] 2627 	mov	(_hex_dump_menu_sloc1_1_0 + 1),r7
      0029C4 A8 0D            [24] 2628 	mov	r0,_hex_dump_menu_sloc0_1_0
      0029C6 AD 0E            [24] 2629 	mov	r5,(_hex_dump_menu_sloc0_1_0 + 1)
      0029C8 E8               [12] 2630 	mov	a,r0
      0029C9 25 0F            [12] 2631 	add	a,_hex_dump_menu_sloc1_1_0
      0029CB F8               [12] 2632 	mov	r0,a
      0029CC ED               [12] 2633 	mov	a,r5
      0029CD 35 10            [12] 2634 	addc	a,(_hex_dump_menu_sloc1_1_0 + 1)
      0029CF A2 E7            [12] 2635 	mov	c,acc.7
      0029D1 C8               [12] 2636 	xch	a,r0
      0029D2 33               [12] 2637 	rlc	a
      0029D3 C8               [12] 2638 	xch	a,r0
      0029D4 33               [12] 2639 	rlc	a
      0029D5 C8               [12] 2640 	xch	a,r0
      0029D6 54 01            [12] 2641 	anl	a,#0x01
      0029D8 74 0E            [12] 2642 	mov	a,#0x0e
      0029DA 58               [12] 2643 	anl	a,r0
      0029DB 44 A0            [12] 2644 	orl	a,#0xa0
      0029DD F5 09            [12] 2645 	mov	_device_addr,a
                           00097A  2646 	C$IO_Expander.c$452$4_0$158 ==.
                                   2647 ;	IO_Expander.c:452: addr_low = (current_addr + i) & 0xFF;
      0029DF 8E 05            [24] 2648 	mov	ar5,r6
      0029E1 E9               [12] 2649 	mov	a,r1
      0029E2 2D               [12] 2650 	add	a,r5
      0029E3 F5 0A            [12] 2651 	mov	_addr_low,a
                           000980  2652 	C$IO_Expander.c$453$4_0$158 ==.
                                   2653 ;	IO_Expander.c:453: BYTERD();
      0029E5 C0 07            [24] 2654 	push	ar7
      0029E7 C0 06            [24] 2655 	push	ar6
      0029E9 C0 05            [24] 2656 	push	ar5
      0029EB C0 04            [24] 2657 	push	ar4
      0029ED C0 03            [24] 2658 	push	ar3
      0029EF C0 02            [24] 2659 	push	ar2
      0029F1 C0 01            [24] 2660 	push	ar1
      0029F3 12 2A E9         [24] 2661 	lcall	_BYTERD
      0029F6 D0 01            [24] 2662 	pop	ar1
      0029F8 D0 02            [24] 2663 	pop	ar2
      0029FA D0 03            [24] 2664 	pop	ar3
      0029FC D0 04            [24] 2665 	pop	ar4
      0029FE D0 05            [24] 2666 	pop	ar5
      002A00 D0 06            [24] 2667 	pop	ar6
      002A02 D0 07            [24] 2668 	pop	ar7
                           00099F  2669 	C$IO_Expander.c$454$4_0$158 ==.
                                   2670 ;	IO_Expander.c:454: data_buffer[i] = asm_result;
      002A04 E9               [12] 2671 	mov	a,r1
      002A05 24 3C            [12] 2672 	add	a,#_hex_dump_menu_data_buffer_65536_150
      002A07 F5 82            [12] 2673 	mov	dpl,a
      002A09 E4               [12] 2674 	clr	a
      002A0A 34 04            [12] 2675 	addc	a,#(_hex_dump_menu_data_buffer_65536_150 >> 8)
      002A0C F5 83            [12] 2676 	mov	dph,a
      002A0E E5 0C            [12] 2677 	mov	a,_asm_result
      002A10 F0               [24] 2678 	movx	@dptr,a
                           0009AC  2679 	C$IO_Expander.c$450$3_0$157 ==.
                                   2680 ;	IO_Expander.c:450: for (uint8_t i = 0; i < bytes_in_line; i++) {
      002A11 09               [12] 2681 	inc	r1
      002A12 D0 05            [24] 2682 	pop	ar5
      002A14 D0 04            [24] 2683 	pop	ar4
      002A16 80 8C            [24] 2684 	sjmp	00115$
      002A18                       2685 00110$:
                           0009B3  2686 	C$IO_Expander.c$458$2_0$154 ==.
                                   2687 ;	IO_Expander.c:458: print_hex_dump_line(current_addr, data_buffer, bytes_in_line);
      002A18 90 04 3A         [24] 2688 	mov	dptr,#_hex_dump_menu_current_addr_65536_150
      002A1B E0               [24] 2689 	movx	a,@dptr
      002A1C FE               [12] 2690 	mov	r6,a
      002A1D A3               [24] 2691 	inc	dptr
      002A1E E0               [24] 2692 	movx	a,@dptr
      002A1F FF               [12] 2693 	mov	r7,a
      002A20 90 04 12         [24] 2694 	mov	dptr,#_print_hex_dump_line_PARM_2
      002A23 74 3C            [12] 2695 	mov	a,#_hex_dump_menu_data_buffer_65536_150
      002A25 F0               [24] 2696 	movx	@dptr,a
      002A26 74 04            [12] 2697 	mov	a,#(_hex_dump_menu_data_buffer_65536_150 >> 8)
      002A28 A3               [24] 2698 	inc	dptr
      002A29 F0               [24] 2699 	movx	@dptr,a
      002A2A E4               [12] 2700 	clr	a
      002A2B A3               [24] 2701 	inc	dptr
      002A2C F0               [24] 2702 	movx	@dptr,a
      002A2D 90 04 15         [24] 2703 	mov	dptr,#_print_hex_dump_line_PARM_3
      002A30 EA               [12] 2704 	mov	a,r2
      002A31 F0               [24] 2705 	movx	@dptr,a
      002A32 8E 82            [24] 2706 	mov	dpl,r6
      002A34 8F 83            [24] 2707 	mov	dph,r7
      002A36 C0 07            [24] 2708 	push	ar7
      002A38 C0 06            [24] 2709 	push	ar6
      002A3A C0 05            [24] 2710 	push	ar5
      002A3C C0 04            [24] 2711 	push	ar4
      002A3E C0 03            [24] 2712 	push	ar3
      002A40 C0 02            [24] 2713 	push	ar2
      002A42 12 22 A9         [24] 2714 	lcall	_print_hex_dump_line
      002A45 D0 02            [24] 2715 	pop	ar2
      002A47 D0 03            [24] 2716 	pop	ar3
      002A49 D0 04            [24] 2717 	pop	ar4
      002A4B D0 05            [24] 2718 	pop	ar5
      002A4D D0 06            [24] 2719 	pop	ar6
      002A4F D0 07            [24] 2720 	pop	ar7
                           0009EC  2721 	C$IO_Expander.c$460$2_0$154 ==.
                                   2722 ;	IO_Expander.c:460: current_addr += bytes_in_line;
      002A51 90 04 3A         [24] 2723 	mov	dptr,#_hex_dump_menu_current_addr_65536_150
      002A54 EA               [12] 2724 	mov	a,r2
      002A55 2E               [12] 2725 	add	a,r6
      002A56 F0               [24] 2726 	movx	@dptr,a
      002A57 EB               [12] 2727 	mov	a,r3
      002A58 3F               [12] 2728 	addc	a,r7
      002A59 A3               [24] 2729 	inc	dptr
      002A5A F0               [24] 2730 	movx	@dptr,a
      002A5B 02 29 55         [24] 2731 	ljmp	00111$
      002A5E                       2732 00113$:
                           0009F9  2733 	C$IO_Expander.c$463$1_0$150 ==.
                                   2734 ;	IO_Expander.c:463: putstr_blue("Hex dump complete!\r\n");
      002A5E 90 3B 83         [24] 2735 	mov	dptr,#___str_36
      002A61 75 F0 80         [24] 2736 	mov	b,#0x80
      002A64 12 21 35         [24] 2737 	lcall	_putstr_blue
      002A67                       2738 00117$:
                           000A02  2739 	C$IO_Expander.c$464$1_0$150 ==.
                                   2740 ;	IO_Expander.c:464: }
                           000A02  2741 	C$IO_Expander.c$464$1_0$150 ==.
                           000A02  2742 	XG$hex_dump_menu$0$0 ==.
      002A67 22               [24] 2743 	ret
                                   2744 ;------------------------------------------------------------
                                   2745 ;Allocation info for local variables in function 'reset_eeprom_menu'
                                   2746 ;------------------------------------------------------------
                                   2747 ;confirm                   Allocated with name '_reset_eeprom_menu_confirm_65537_161'
                                   2748 ;------------------------------------------------------------
                           000A03  2749 	G$reset_eeprom_menu$0$0 ==.
                           000A03  2750 	C$IO_Expander.c$466$1_0$160 ==.
                                   2751 ;	IO_Expander.c:466: void reset_eeprom_menu(void) {
                                   2752 ;	-----------------------------------------
                                   2753 ;	 function reset_eeprom_menu
                                   2754 ;	-----------------------------------------
      002A68                       2755 _reset_eeprom_menu:
                           000A03  2756 	C$IO_Expander.c$467$1_0$160 ==.
                                   2757 ;	IO_Expander.c:467: putstr_blue("\r\n--- Reset EEPROM ---\r\n");
      002A68 90 3B 98         [24] 2758 	mov	dptr,#___str_37
      002A6B 75 F0 80         [24] 2759 	mov	b,#0x80
      002A6E 12 21 35         [24] 2760 	lcall	_putstr_blue
                           000A0C  2761 	C$IO_Expander.c$468$1_0$160 ==.
                                   2762 ;	IO_Expander.c:468: putstr("This will reset the I2C bus and EEPROM. Continue? (y/n): ");
      002A71 90 3B B1         [24] 2763 	mov	dptr,#___str_38
      002A74 75 F0 80         [24] 2764 	mov	b,#0x80
      002A77 12 20 92         [24] 2765 	lcall	_putstr
                           000A15  2766 	C$IO_Expander.c$470$1_1$161 ==.
                                   2767 ;	IO_Expander.c:470: char confirm = getchar();
      002A7A 12 20 84         [24] 2768 	lcall	_getchar
      002A7D AE 82            [24] 2769 	mov	r6,dpl
                           000A1A  2770 	C$IO_Expander.c$471$1_1$161 ==.
                                   2771 ;	IO_Expander.c:471: putchar(confirm);
      002A7F 8E 05            [24] 2772 	mov	ar5,r6
      002A81 7F 00            [12] 2773 	mov	r7,#0x00
      002A83 8D 82            [24] 2774 	mov	dpl,r5
      002A85 8F 83            [24] 2775 	mov	dph,r7
      002A87 C0 06            [24] 2776 	push	ar6
      002A89 12 20 65         [24] 2777 	lcall	_putchar
                           000A27  2778 	C$IO_Expander.c$472$1_1$161 ==.
                                   2779 ;	IO_Expander.c:472: print_newline();
      002A8C 12 21 A3         [24] 2780 	lcall	_print_newline
      002A8F D0 06            [24] 2781 	pop	ar6
                           000A2C  2782 	C$IO_Expander.c$474$1_1$161 ==.
                                   2783 ;	IO_Expander.c:474: if (confirm == 'y' || confirm == 'Y') {
      002A91 BE 79 02         [24] 2784 	cjne	r6,#0x79,00111$
      002A94 80 03            [24] 2785 	sjmp	00101$
      002A96                       2786 00111$:
      002A96 BE 59 2C         [24] 2787 	cjne	r6,#0x59,00102$
      002A99                       2788 00101$:
                           000A34  2789 	C$IO_Expander.c$475$2_1$162 ==.
                                   2790 ;	IO_Expander.c:475: putstr("Resetting I2C bus and EEPROM");
      002A99 90 3B EB         [24] 2791 	mov	dptr,#___str_39
      002A9C 75 F0 80         [24] 2792 	mov	b,#0x80
      002A9F 12 20 92         [24] 2793 	lcall	_putstr
                           000A3D  2794 	C$IO_Expander.c$476$2_1$162 ==.
                                   2795 ;	IO_Expander.c:476: eereset();
      002AA2 12 2B CF         [24] 2796 	lcall	_eereset
                           000A40  2797 	C$IO_Expander.c$477$2_1$162 ==.
                                   2798 ;	IO_Expander.c:477: putstr_blue(" Complete!\r\n");
      002AA5 90 3C 08         [24] 2799 	mov	dptr,#___str_40
      002AA8 75 F0 80         [24] 2800 	mov	b,#0x80
      002AAB 12 21 35         [24] 2801 	lcall	_putstr_blue
                           000A49  2802 	C$IO_Expander.c$478$2_1$162 ==.
                                   2803 ;	IO_Expander.c:478: putstr("The I2C EEPROM has been reset.\r\n");
      002AAE 90 3C 15         [24] 2804 	mov	dptr,#___str_41
      002AB1 75 F0 80         [24] 2805 	mov	b,#0x80
      002AB4 12 20 92         [24] 2806 	lcall	_putstr
                           000A52  2807 	C$IO_Expander.c$481$2_1$162 ==.
                                   2808 ;	IO_Expander.c:481: putstr("Re-initializing PCF8574A...\r\n");
      002AB7 90 3C 36         [24] 2809 	mov	dptr,#___str_42
      002ABA 75 F0 80         [24] 2810 	mov	b,#0x80
      002ABD 12 20 92         [24] 2811 	lcall	_putstr
                           000A5B  2812 	C$IO_Expander.c$482$2_1$162 ==.
                                   2813 ;	IO_Expander.c:482: PCF8574A_init();
      002AC0 12 24 CD         [24] 2814 	lcall	_PCF8574A_init
      002AC3 80 09            [24] 2815 	sjmp	00105$
      002AC5                       2816 00102$:
                           000A60  2817 	C$IO_Expander.c$484$2_1$163 ==.
                                   2818 ;	IO_Expander.c:484: putstr("Reset cancelled.\r\n");
      002AC5 90 3C 54         [24] 2819 	mov	dptr,#___str_43
      002AC8 75 F0 80         [24] 2820 	mov	b,#0x80
      002ACB 12 20 92         [24] 2821 	lcall	_putstr
      002ACE                       2822 00105$:
                           000A69  2823 	C$IO_Expander.c$486$1_1$160 ==.
                                   2824 ;	IO_Expander.c:486: }
                           000A69  2825 	C$IO_Expander.c$486$1_1$160 ==.
                           000A69  2826 	XG$reset_eeprom_menu$0$0 ==.
      002ACE 22               [24] 2827 	ret
                                   2828 ;------------------------------------------------------------
                                   2829 ;Allocation info for local variables in function 'eeprom_init'
                                   2830 ;------------------------------------------------------------
                           000A6A  2831 	G$eeprom_init$0$0 ==.
                           000A6A  2832 	C$IO_Expander.c$491$1_1$165 ==.
                                   2833 ;	IO_Expander.c:491: void eeprom_init(void) {
                                   2834 ;	-----------------------------------------
                                   2835 ;	 function eeprom_init
                                   2836 ;	-----------------------------------------
      002ACF                       2837 _eeprom_init:
                           000A6A  2838 	C$IO_Expander.c$492$1_0$165 ==.
                                   2839 ;	IO_Expander.c:492: P1 = 0xFF;  // Set both pins high (idle state)
      002ACF 75 90 FF         [24] 2840 	mov	_P1,#0xff
                           000A6D  2841 	C$IO_Expander.c$493$1_0$165 ==.
                                   2842 ;	IO_Expander.c:493: }
                           000A6D  2843 	C$IO_Expander.c$493$1_0$165 ==.
                           000A6D  2844 	XG$eeprom_init$0$0 ==.
      002AD2 22               [24] 2845 	ret
                                   2846 ;------------------------------------------------------------
                                   2847 ;Allocation info for local variables in function 'TEST'
                                   2848 ;------------------------------------------------------------
                           000A6E  2849 	G$TEST$0$0 ==.
                           000A6E  2850 	C$IO_Expander.c$495$1_0$167 ==.
                                   2851 ;	IO_Expander.c:495: void TEST(void) __naked {
                                   2852 ;	-----------------------------------------
                                   2853 ;	 function TEST
                                   2854 ;	-----------------------------------------
      002AD3                       2855 _TEST:
                                   2856 ;	naked function: no prologue.
                           000A6E  2857 	C$IO_Expander.c$498$1_0$167 ==.
                                   2858 ;	IO_Expander.c:498: __endasm;
      002AD3 75 08 05         [24] 2859 	mov	_ret_byte, #0x05
                           000A71  2860 	C$IO_Expander.c$499$1_0$167 ==.
                                   2861 ;	IO_Expander.c:499: }
                                   2862 ;	naked function: no epilogue.
                           000A71  2863 	C$IO_Expander.c$499$1_0$167 ==.
                           000A71  2864 	XG$TEST$0$0 ==.
                                   2865 ;------------------------------------------------------------
                                   2866 ;Allocation info for local variables in function 'BYTEW'
                                   2867 ;------------------------------------------------------------
                           000A71  2868 	G$BYTEW$0$0 ==.
                           000A71  2869 	C$IO_Expander.c$501$1_0$169 ==.
                                   2870 ;	IO_Expander.c:501: void BYTEW(void) __naked {
                                   2871 ;	-----------------------------------------
                                   2872 ;	 function BYTEW
                                   2873 ;	-----------------------------------------
      002AD6                       2874 _BYTEW:
                                   2875 ;	naked function: no prologue.
                           000A71  2876 	C$IO_Expander.c$511$1_0$169 ==.
                                   2877 ;	IO_Expander.c:511: __endasm;
      002AD6 E5 09            [12] 2878 	mov	A, _device_addr
      002AD8 12 2B 3A         [24] 2879 	lcall	_OUTS
      002ADB E5 0A            [12] 2880 	mov	a, _addr_low
      002ADD 12 2B 71         [24] 2881 	lcall	_OUT
      002AE0 E5 0B            [12] 2882 	mov	a, _asm_data
      002AE2 12 2B 71         [24] 2883 	lcall	_OUT
      002AE5 12 2B 96         [24] 2884 	lcall	_STOP
      002AE8 22               [24] 2885 	ret
                           000A84  2886 	C$IO_Expander.c$512$1_0$169 ==.
                                   2887 ;	IO_Expander.c:512: }
                                   2888 ;	naked function: no epilogue.
                           000A84  2889 	C$IO_Expander.c$512$1_0$169 ==.
                           000A84  2890 	XG$BYTEW$0$0 ==.
                                   2891 ;------------------------------------------------------------
                                   2892 ;Allocation info for local variables in function 'BYTERD'
                                   2893 ;------------------------------------------------------------
                           000A84  2894 	G$BYTERD$0$0 ==.
                           000A84  2895 	C$IO_Expander.c$514$1_0$171 ==.
                                   2896 ;	IO_Expander.c:514: void BYTERD(void) __naked {
                                   2897 ;	-----------------------------------------
                                   2898 ;	 function BYTERD
                                   2899 ;	-----------------------------------------
      002AE9                       2900 _BYTERD:
                                   2901 ;	naked function: no prologue.
                           000A84  2902 	C$IO_Expander.c$522$1_0$171 ==.
                                   2903 ;	IO_Expander.c:522: __endasm;
      002AE9 E5 09            [12] 2904 	mov	a, _device_addr
      002AEB 12 2B 3A         [24] 2905 	lcall	_OUTS
      002AEE E5 0A            [12] 2906 	mov	a, _addr_low
      002AF0 12 2B 71         [24] 2907 	lcall	_OUT
      002AF3 12 2B A7         [24] 2908 	lcall	_CREAD
      002AF6 22               [24] 2909 	ret
                           000A92  2910 	C$IO_Expander.c$523$1_0$171 ==.
                                   2911 ;	IO_Expander.c:523: }
                                   2912 ;	naked function: no epilogue.
                           000A92  2913 	C$IO_Expander.c$523$1_0$171 ==.
                           000A92  2914 	XG$BYTERD$0$0 ==.
                                   2915 ;------------------------------------------------------------
                                   2916 ;Allocation info for local variables in function 'ACKTST'
                                   2917 ;------------------------------------------------------------
                           000A92  2918 	G$ACKTST$0$0 ==.
                           000A92  2919 	C$IO_Expander.c$525$1_0$173 ==.
                                   2920 ;	IO_Expander.c:525: void ACKTST(void) __naked {
                                   2921 ;	-----------------------------------------
                                   2922 ;	 function ACKTST
                                   2923 ;	-----------------------------------------
      002AF7                       2924 _ACKTST:
                                   2925 ;	naked function: no prologue.
                           000A92  2926 	C$IO_Expander.c$576$1_0$173 ==.
                                   2927 ;	IO_Expander.c:576: __endasm;
      002AF7 E5 09            [12] 2928 	MOV	A, _device_addr
      002AF9 7A 08            [12] 2929 	MOV	R2,#8
      002AFB C2 90            [12] 2930 	CLR	P1.0
      002AFD 00               [12] 2931 	NOP
      002AFE 00               [12] 2932 	NOP
      002AFF 00               [12] 2933 	NOP
      002B00 00               [12] 2934 	NOP
      002B01 00               [12] 2935 	NOP
      002B02 C2 91            [12] 2936 	CLR	P1.1
      002B04                       2937 	    AKTLP:
      002B04 33               [12] 2938 	RLC	A
      002B05 50 05            [24] 2939 	JNC	AKTLS
      002B07 D2 90            [12] 2940 	SETB	P1.0
      002B09 02 2B 0E         [24] 2941 	LJMP	AKTL1
      002B0C                       2942 	    AKTLS:
      002B0C C2 90            [12] 2943 	CLR	P1.0
      002B0E                       2944 	    AKTL1:
      002B0E D2 91            [12] 2945 	SETB	P1.1
      002B10 00               [12] 2946 	NOP
      002B11 00               [12] 2947 	NOP
      002B12 00               [12] 2948 	NOP
      002B13 00               [12] 2949 	NOP
      002B14 00               [12] 2950 	NOP
      002B15 C2 91            [12] 2951 	CLR	P1.1
      002B17 DA EB            [24] 2952 	DJNZ	R2,AKTLP
      002B19 D2 90            [12] 2953 	SETB	P1.0
      002B1B 00               [12] 2954 	NOP
      002B1C 00               [12] 2955 	NOP
      002B1D D2 91            [12] 2956 	SETB	P1.1
      002B1F 00               [12] 2957 	NOP
      002B20 00               [12] 2958 	NOP
      002B21 00               [12] 2959 	NOP
      002B22 00               [12] 2960 	NOP
      002B23 00               [12] 2961 	NOP
      002B24 30 90 03         [24] 2962 	JNB	P1.0,EXIT
      002B27 02 2A F7         [24] 2963 	LJMP	_ACKTST
      002B2A                       2964 	    EXIT:
      002B2A C2 91            [12] 2965 	CLR	P1.1
      002B2C C2 90            [12] 2966 	CLR	P1.0
      002B2E 00               [12] 2967 	NOP
      002B2F 00               [12] 2968 	NOP
      002B30 00               [12] 2969 	NOP
      002B31 00               [12] 2970 	NOP
      002B32 00               [12] 2971 	NOP
      002B33 D2 91            [12] 2972 	SETB	P1.1
      002B35 00               [12] 2973 	NOP
      002B36 00               [12] 2974 	NOP
      002B37 D2 90            [12] 2975 	SETB	P1.0
      002B39 22               [24] 2976 	RET
                           000AD5  2977 	C$IO_Expander.c$577$1_0$173 ==.
                                   2978 ;	IO_Expander.c:577: }
                                   2979 ;	naked function: no epilogue.
                           000AD5  2980 	C$IO_Expander.c$577$1_0$173 ==.
                           000AD5  2981 	XG$ACKTST$0$0 ==.
                                   2982 ;------------------------------------------------------------
                                   2983 ;Allocation info for local variables in function 'OUTS'
                                   2984 ;------------------------------------------------------------
                           000AD5  2985 	G$OUTS$0$0 ==.
                           000AD5  2986 	C$IO_Expander.c$579$1_0$175 ==.
                                   2987 ;	IO_Expander.c:579: void OUTS(void) __naked {
                                   2988 ;	-----------------------------------------
                                   2989 ;	 function OUTS
                                   2990 ;	-----------------------------------------
      002B3A                       2991 _OUTS:
                                   2992 ;	naked function: no prologue.
                           000AD5  2993 	C$IO_Expander.c$624$1_0$175 ==.
                                   2994 ;	IO_Expander.c:624: __endasm;
      002B3A 7A 08            [12] 2995 	mov	r2, #8
      002B3C D2 90            [12] 2996 	setb	P1.0
      002B3E D2 91            [12] 2997 	setb	P1.1
      002B40 00               [12] 2998 	nop
      002B41 00               [12] 2999 	nop
      002B42 00               [12] 3000 	nop
      002B43 00               [12] 3001 	nop
      002B44 00               [12] 3002 	nop
      002B45 C2 90            [12] 3003 	clr	P1.0
      002B47 00               [12] 3004 	nop
      002B48 00               [12] 3005 	nop
      002B49 00               [12] 3006 	nop
      002B4A 00               [12] 3007 	nop
      002B4B 00               [12] 3008 	nop
      002B4C C2 91            [12] 3009 	clr	P1.1
      002B4E                       3010 	    otslp:
      002B4E 33               [12] 3011 	rlc	a
      002B4F 50 04            [24] 3012 	jnc	bitls
      002B51 D2 90            [12] 3013 	setb	P1.0
      002B53 80 02            [24] 3014 	sjmp	otsl1
      002B55                       3015 	    bitls:
      002B55 C2 90            [12] 3016 	clr	P1.0
      002B57                       3017 	    otsl1:
      002B57 D2 91            [12] 3018 	setb	P1.1
      002B59 00               [12] 3019 	nop
      002B5A 00               [12] 3020 	nop
      002B5B 00               [12] 3021 	nop
      002B5C 00               [12] 3022 	nop
      002B5D 00               [12] 3023 	nop
      002B5E C2 91            [12] 3024 	clr	P1.1
      002B60 DA EC            [24] 3025 	djnz	r2, otslp
      002B62 D2 90            [12] 3026 	setb	P1.0
      002B64 00               [12] 3027 	nop
      002B65 00               [12] 3028 	nop
      002B66 00               [12] 3029 	nop
      002B67 D2 91            [12] 3030 	setb	P1.1
      002B69 00               [12] 3031 	nop
      002B6A 00               [12] 3032 	nop
      002B6B 00               [12] 3033 	nop
      002B6C 00               [12] 3034 	nop
      002B6D 00               [12] 3035 	nop
      002B6E C2 91            [12] 3036 	clr	P1.1
      002B70 22               [24] 3037 	ret
                           000B0C  3038 	C$IO_Expander.c$625$1_0$175 ==.
                                   3039 ;	IO_Expander.c:625: }
                                   3040 ;	naked function: no epilogue.
                           000B0C  3041 	C$IO_Expander.c$625$1_0$175 ==.
                           000B0C  3042 	XG$OUTS$0$0 ==.
                                   3043 ;------------------------------------------------------------
                                   3044 ;Allocation info for local variables in function 'OUT'
                                   3045 ;------------------------------------------------------------
                           000B0C  3046 	G$OUT$0$0 ==.
                           000B0C  3047 	C$IO_Expander.c$627$1_0$177 ==.
                                   3048 ;	IO_Expander.c:627: void OUT(void) __naked {
                                   3049 ;	-----------------------------------------
                                   3050 ;	 function OUT
                                   3051 ;	-----------------------------------------
      002B71                       3052 _OUT:
                                   3053 ;	naked function: no prologue.
                           000B0C  3054 	C$IO_Expander.c$658$1_0$177 ==.
                                   3055 ;	IO_Expander.c:658: __endasm;
      002B71 7A 08            [12] 3056 	mov	r2, #8
      002B73                       3057 	    otlp:
      002B73 33               [12] 3058 	rlc	a
      002B74 50 04            [24] 3059 	jnc	bitl
      002B76 D2 90            [12] 3060 	setb	P1.0
      002B78 80 02            [24] 3061 	sjmp	otl1
      002B7A                       3062 	    bitl:
      002B7A C2 90            [12] 3063 	clr	P1.0
      002B7C                       3064 	    otl1:
      002B7C D2 91            [12] 3065 	setb	P1.1
      002B7E 00               [12] 3066 	nop
      002B7F 00               [12] 3067 	nop
      002B80 00               [12] 3068 	nop
      002B81 00               [12] 3069 	nop
      002B82 00               [12] 3070 	nop
      002B83 C2 91            [12] 3071 	clr	P1.1
      002B85 DA EC            [24] 3072 	djnz	r2, otlp
      002B87 D2 90            [12] 3073 	setb	P1.0
      002B89 00               [12] 3074 	nop
      002B8A 00               [12] 3075 	nop
      002B8B 00               [12] 3076 	nop
      002B8C D2 91            [12] 3077 	setb	P1.1
      002B8E 00               [12] 3078 	nop
      002B8F 00               [12] 3079 	nop
      002B90 00               [12] 3080 	nop
      002B91 00               [12] 3081 	nop
      002B92 00               [12] 3082 	nop
      002B93 C2 91            [12] 3083 	clr	P1.1
      002B95 22               [24] 3084 	ret
                           000B31  3085 	C$IO_Expander.c$659$1_0$177 ==.
                                   3086 ;	IO_Expander.c:659: }
                                   3087 ;	naked function: no epilogue.
                           000B31  3088 	C$IO_Expander.c$659$1_0$177 ==.
                           000B31  3089 	XG$OUT$0$0 ==.
                                   3090 ;------------------------------------------------------------
                                   3091 ;Allocation info for local variables in function 'STOP'
                                   3092 ;------------------------------------------------------------
                           000B31  3093 	G$STOP$0$0 ==.
                           000B31  3094 	C$IO_Expander.c$661$1_0$179 ==.
                                   3095 ;	IO_Expander.c:661: void STOP(void) __naked {
                                   3096 ;	-----------------------------------------
                                   3097 ;	 function STOP
                                   3098 ;	-----------------------------------------
      002B96                       3099 _STOP:
                                   3100 ;	naked function: no prologue.
                           000B31  3101 	C$IO_Expander.c$677$1_0$179 ==.
                                   3102 ;	IO_Expander.c:677: __endasm;
      002B96 C2 90            [12] 3103 	clr	P1.0
      002B98 00               [12] 3104 	nop
      002B99 00               [12] 3105 	nop
      002B9A 00               [12] 3106 	nop
      002B9B 00               [12] 3107 	nop
      002B9C 00               [12] 3108 	nop
      002B9D D2 91            [12] 3109 	setb	P1.1
      002B9F 00               [12] 3110 	nop
      002BA0 00               [12] 3111 	nop
      002BA1 00               [12] 3112 	nop
      002BA2 00               [12] 3113 	nop
      002BA3 00               [12] 3114 	nop
      002BA4 D2 90            [12] 3115 	setb	P1.0
      002BA6 22               [24] 3116 	ret
                           000B42  3117 	C$IO_Expander.c$678$1_0$179 ==.
                                   3118 ;	IO_Expander.c:678: }
                                   3119 ;	naked function: no epilogue.
                           000B42  3120 	C$IO_Expander.c$678$1_0$179 ==.
                           000B42  3121 	XG$STOP$0$0 ==.
                                   3122 ;------------------------------------------------------------
                                   3123 ;Allocation info for local variables in function 'CREAD'
                                   3124 ;------------------------------------------------------------
                           000B42  3125 	G$CREAD$0$0 ==.
                           000B42  3126 	C$IO_Expander.c$680$1_0$181 ==.
                                   3127 ;	IO_Expander.c:680: void CREAD(void) __naked {
                                   3128 ;	-----------------------------------------
                                   3129 ;	 function CREAD
                                   3130 ;	-----------------------------------------
      002BA7                       3131 _CREAD:
                                   3132 ;	naked function: no prologue.
                           000B42  3133 	C$IO_Expander.c$689$1_0$181 ==.
                                   3134 ;	IO_Expander.c:689: __endasm;
      002BA7 E5 09            [12] 3135 	mov	A, _device_addr
      002BA9 04               [12] 3136 	inc	A
      002BAA 12 2B 3A         [24] 3137 	lcall	_OUTS
      002BAD 12 2B B6         [24] 3138 	lcall	_IN
      002BB0 F5 0C            [12] 3139 	mov	_asm_result,A
      002BB2 12 2B 96         [24] 3140 	lcall	_STOP
      002BB5 22               [24] 3141 	ret
                           000B51  3142 	C$IO_Expander.c$690$1_0$181 ==.
                                   3143 ;	IO_Expander.c:690: }
                                   3144 ;	naked function: no epilogue.
                           000B51  3145 	C$IO_Expander.c$690$1_0$181 ==.
                           000B51  3146 	XG$CREAD$0$0 ==.
                                   3147 ;------------------------------------------------------------
                                   3148 ;Allocation info for local variables in function 'IN'
                                   3149 ;------------------------------------------------------------
                           000B51  3150 	G$IN$0$0 ==.
                           000B51  3151 	C$IO_Expander.c$692$1_0$183 ==.
                                   3152 ;	IO_Expander.c:692: void IN(void) __naked {
                                   3153 ;	-----------------------------------------
                                   3154 ;	 function IN
                                   3155 ;	-----------------------------------------
      002BB6                       3156 _IN:
                                   3157 ;	naked function: no prologue.
                           000B51  3158 	C$IO_Expander.c$713$1_0$183 ==.
                                   3159 ;	IO_Expander.c:713: __endasm;
      002BB6 7A 08            [12] 3160 	mov	R2,#8
      002BB8 D2 90            [12] 3161 	setb	P1.0
      002BBA                       3162 	    inlp:
      002BBA C2 91            [12] 3163 	clr	P1.1
      002BBC 00               [12] 3164 	nop
      002BBD 00               [12] 3165 	nop
      002BBE 00               [12] 3166 	nop
      002BBF 00               [12] 3167 	nop
      002BC0 00               [12] 3168 	nop
      002BC1 00               [12] 3169 	nop
      002BC2 D2 91            [12] 3170 	setb	P1.1
      002BC4 C3               [12] 3171 	clr	C
      002BC5 30 90 01         [24] 3172 	jnb	P1.0,inl1
      002BC8 B3               [12] 3173 	cpl	C
      002BC9                       3174 	    inl1:
      002BC9 33               [12] 3175 	rlc	A
      002BCA DA EE            [24] 3176 	djnz	R2,inlp
      002BCC C2 91            [12] 3177 	clr	P1.1
      002BCE 22               [24] 3178 	ret
                           000B6A  3179 	C$IO_Expander.c$714$1_0$183 ==.
                                   3180 ;	IO_Expander.c:714: }
                                   3181 ;	naked function: no epilogue.
                           000B6A  3182 	C$IO_Expander.c$714$1_0$183 ==.
                           000B6A  3183 	XG$IN$0$0 ==.
                                   3184 ;------------------------------------------------------------
                                   3185 ;Allocation info for local variables in function 'eereset'
                                   3186 ;------------------------------------------------------------
                                   3187 ;i                         Allocated with name '_eereset_i_65536_185'
                                   3188 ;j                         Allocated with name '_eereset_j_262144_191'
                                   3189 ;j                         Allocated with name '_eereset_j_262144_192'
                                   3190 ;------------------------------------------------------------
                           000B6A  3191 	G$eereset$0$0 ==.
                           000B6A  3192 	C$IO_Expander.c$717$1_0$185 ==.
                                   3193 ;	IO_Expander.c:717: void eereset(void) {
                                   3194 ;	-----------------------------------------
                                   3195 ;	 function eereset
                                   3196 ;	-----------------------------------------
      002BCF                       3197 _eereset:
                           000B6A  3198 	C$IO_Expander.c$720$1_0$185 ==.
                                   3199 ;	IO_Expander.c:720: P1_0 = 1;  // SDA high
                                   3200 ;	assignBit
      002BCF D2 90            [12] 3201 	setb	_P1_0
                           000B6C  3202 	C$IO_Expander.c$721$1_0$185 ==.
                                   3203 ;	IO_Expander.c:721: P1_1 = 1;  // SCL high
                                   3204 ;	assignBit
      002BD1 D2 91            [12] 3205 	setb	_P1_1
                           000B6E  3206 	C$IO_Expander.c$723$2_0$186 ==.
                                   3207 ;	IO_Expander.c:723: for (i = 0; i < 10; i++);
      002BD3 90 04 4E         [24] 3208 	mov	dptr,#_eereset_i_65536_185
      002BD6 E4               [12] 3209 	clr	a
      002BD7 F0               [24] 3210 	movx	@dptr,a
      002BD8                       3211 00112$:
      002BD8 90 04 4E         [24] 3212 	mov	dptr,#_eereset_i_65536_185
      002BDB E0               [24] 3213 	movx	a,@dptr
      002BDC FF               [12] 3214 	mov	r7,a
      002BDD BF 0A 00         [24] 3215 	cjne	r7,#0x0a,00225$
      002BE0                       3216 00225$:
      002BE0 50 08            [24] 3217 	jnc	00101$
      002BE2 90 04 4E         [24] 3218 	mov	dptr,#_eereset_i_65536_185
      002BE5 E0               [24] 3219 	movx	a,@dptr
      002BE6 04               [12] 3220 	inc	a
      002BE7 F0               [24] 3221 	movx	@dptr,a
      002BE8 80 EE            [24] 3222 	sjmp	00112$
      002BEA                       3223 00101$:
                           000B85  3224 	C$IO_Expander.c$726$1_0$185 ==.
                                   3225 ;	IO_Expander.c:726: P1_0 = 0;
                                   3226 ;	assignBit
      002BEA C2 90            [12] 3227 	clr	_P1_0
                           000B87  3228 	C$IO_Expander.c$727$2_0$187 ==.
                                   3229 ;	IO_Expander.c:727: for (i = 0; i < 5; i++);
      002BEC 90 04 4E         [24] 3230 	mov	dptr,#_eereset_i_65536_185
      002BEF E4               [12] 3231 	clr	a
      002BF0 F0               [24] 3232 	movx	@dptr,a
      002BF1                       3233 00115$:
      002BF1 90 04 4E         [24] 3234 	mov	dptr,#_eereset_i_65536_185
      002BF4 E0               [24] 3235 	movx	a,@dptr
      002BF5 FF               [12] 3236 	mov	r7,a
      002BF6 BF 05 00         [24] 3237 	cjne	r7,#0x05,00227$
      002BF9                       3238 00227$:
      002BF9 50 08            [24] 3239 	jnc	00102$
      002BFB 90 04 4E         [24] 3240 	mov	dptr,#_eereset_i_65536_185
      002BFE E0               [24] 3241 	movx	a,@dptr
      002BFF 04               [12] 3242 	inc	a
      002C00 F0               [24] 3243 	movx	@dptr,a
      002C01 80 EE            [24] 3244 	sjmp	00115$
      002C03                       3245 00102$:
                           000B9E  3246 	C$IO_Expander.c$729$1_0$185 ==.
                                   3247 ;	IO_Expander.c:729: P1_1 = 0;
                                   3248 ;	assignBit
      002C03 C2 91            [12] 3249 	clr	_P1_1
                           000BA0  3250 	C$IO_Expander.c$730$2_0$188 ==.
                                   3251 ;	IO_Expander.c:730: for (i = 0; i < 5; i++);
      002C05 90 04 4E         [24] 3252 	mov	dptr,#_eereset_i_65536_185
      002C08 E4               [12] 3253 	clr	a
      002C09 F0               [24] 3254 	movx	@dptr,a
      002C0A                       3255 00118$:
      002C0A 90 04 4E         [24] 3256 	mov	dptr,#_eereset_i_65536_185
      002C0D E0               [24] 3257 	movx	a,@dptr
      002C0E FF               [12] 3258 	mov	r7,a
      002C0F BF 05 00         [24] 3259 	cjne	r7,#0x05,00229$
      002C12                       3260 00229$:
      002C12 50 08            [24] 3261 	jnc	00103$
      002C14 90 04 4E         [24] 3262 	mov	dptr,#_eereset_i_65536_185
      002C17 E0               [24] 3263 	movx	a,@dptr
      002C18 04               [12] 3264 	inc	a
      002C19 F0               [24] 3265 	movx	@dptr,a
      002C1A 80 EE            [24] 3266 	sjmp	00118$
      002C1C                       3267 00103$:
                           000BB7  3268 	C$IO_Expander.c$733$1_0$185 ==.
                                   3269 ;	IO_Expander.c:733: P1_0 = 1;
                                   3270 ;	assignBit
      002C1C D2 90            [12] 3271 	setb	_P1_0
                           000BB9  3272 	C$IO_Expander.c$735$2_0$189 ==.
                                   3273 ;	IO_Expander.c:735: for (i = 0; i < 9; i++) {
      002C1E 90 04 4E         [24] 3274 	mov	dptr,#_eereset_i_65536_185
      002C21 E4               [12] 3275 	clr	a
      002C22 F0               [24] 3276 	movx	@dptr,a
      002C23                       3277 00127$:
      002C23 90 04 4E         [24] 3278 	mov	dptr,#_eereset_i_65536_185
      002C26 E0               [24] 3279 	movx	a,@dptr
      002C27 FF               [12] 3280 	mov	r7,a
      002C28 BF 09 00         [24] 3281 	cjne	r7,#0x09,00231$
      002C2B                       3282 00231$:
      002C2B 50 20            [24] 3283 	jnc	00106$
                           000BC8  3284 	C$IO_Expander.c$736$3_0$190 ==.
                                   3285 ;	IO_Expander.c:736: P1_1 = 1;
                                   3286 ;	assignBit
      002C2D D2 91            [12] 3287 	setb	_P1_1
                           000BCA  3288 	C$IO_Expander.c$737$2_0$185 ==.
                                   3289 ;	IO_Expander.c:737: for (uint8_t j = 0; j < 10; j++);
      002C2F 7F 00            [12] 3290 	mov	r7,#0x00
      002C31                       3291 00121$:
      002C31 BF 0A 00         [24] 3292 	cjne	r7,#0x0a,00233$
      002C34                       3293 00233$:
      002C34 50 03            [24] 3294 	jnc	00104$
      002C36 0F               [12] 3295 	inc	r7
      002C37 80 F8            [24] 3296 	sjmp	00121$
      002C39                       3297 00104$:
                           000BD4  3298 	C$IO_Expander.c$739$3_0$190 ==.
                                   3299 ;	IO_Expander.c:739: P1_1 = 0;
                                   3300 ;	assignBit
      002C39 C2 91            [12] 3301 	clr	_P1_1
                           000BD6  3302 	C$IO_Expander.c$740$2_0$185 ==.
                                   3303 ;	IO_Expander.c:740: for (uint8_t j = 0; j < 10; j++);
      002C3B 7F 00            [12] 3304 	mov	r7,#0x00
      002C3D                       3305 00124$:
      002C3D BF 0A 00         [24] 3306 	cjne	r7,#0x0a,00235$
      002C40                       3307 00235$:
      002C40 50 03            [24] 3308 	jnc	00128$
      002C42 0F               [12] 3309 	inc	r7
      002C43 80 F8            [24] 3310 	sjmp	00124$
      002C45                       3311 00128$:
                           000BE0  3312 	C$IO_Expander.c$735$2_0$189 ==.
                                   3313 ;	IO_Expander.c:735: for (i = 0; i < 9; i++) {
      002C45 90 04 4E         [24] 3314 	mov	dptr,#_eereset_i_65536_185
      002C48 E0               [24] 3315 	movx	a,@dptr
      002C49 04               [12] 3316 	inc	a
      002C4A F0               [24] 3317 	movx	@dptr,a
      002C4B 80 D6            [24] 3318 	sjmp	00127$
      002C4D                       3319 00106$:
                           000BE8  3320 	C$IO_Expander.c$744$1_0$185 ==.
                                   3321 ;	IO_Expander.c:744: P1_0 = 1;
                                   3322 ;	assignBit
      002C4D D2 90            [12] 3323 	setb	_P1_0
                           000BEA  3324 	C$IO_Expander.c$745$1_0$185 ==.
                                   3325 ;	IO_Expander.c:745: P1_1 = 1;
                                   3326 ;	assignBit
      002C4F D2 91            [12] 3327 	setb	_P1_1
                           000BEC  3328 	C$IO_Expander.c$746$2_0$193 ==.
                                   3329 ;	IO_Expander.c:746: for (i = 0; i < 5; i++);
      002C51 90 04 4E         [24] 3330 	mov	dptr,#_eereset_i_65536_185
      002C54 E4               [12] 3331 	clr	a
      002C55 F0               [24] 3332 	movx	@dptr,a
      002C56                       3333 00130$:
      002C56 90 04 4E         [24] 3334 	mov	dptr,#_eereset_i_65536_185
      002C59 E0               [24] 3335 	movx	a,@dptr
      002C5A FF               [12] 3336 	mov	r7,a
      002C5B BF 05 00         [24] 3337 	cjne	r7,#0x05,00237$
      002C5E                       3338 00237$:
      002C5E 50 08            [24] 3339 	jnc	00107$
      002C60 90 04 4E         [24] 3340 	mov	dptr,#_eereset_i_65536_185
      002C63 E0               [24] 3341 	movx	a,@dptr
      002C64 04               [12] 3342 	inc	a
      002C65 F0               [24] 3343 	movx	@dptr,a
      002C66 80 EE            [24] 3344 	sjmp	00130$
      002C68                       3345 00107$:
                           000C03  3346 	C$IO_Expander.c$748$1_0$185 ==.
                                   3347 ;	IO_Expander.c:748: P1_0 = 0;
                                   3348 ;	assignBit
      002C68 C2 90            [12] 3349 	clr	_P1_0
                           000C05  3350 	C$IO_Expander.c$749$2_0$194 ==.
                                   3351 ;	IO_Expander.c:749: for (i = 0; i < 5; i++);
      002C6A 90 04 4E         [24] 3352 	mov	dptr,#_eereset_i_65536_185
      002C6D E4               [12] 3353 	clr	a
      002C6E F0               [24] 3354 	movx	@dptr,a
      002C6F                       3355 00133$:
      002C6F 90 04 4E         [24] 3356 	mov	dptr,#_eereset_i_65536_185
      002C72 E0               [24] 3357 	movx	a,@dptr
      002C73 FF               [12] 3358 	mov	r7,a
      002C74 BF 05 00         [24] 3359 	cjne	r7,#0x05,00239$
      002C77                       3360 00239$:
      002C77 50 08            [24] 3361 	jnc	00108$
      002C79 90 04 4E         [24] 3362 	mov	dptr,#_eereset_i_65536_185
      002C7C E0               [24] 3363 	movx	a,@dptr
      002C7D 04               [12] 3364 	inc	a
      002C7E F0               [24] 3365 	movx	@dptr,a
      002C7F 80 EE            [24] 3366 	sjmp	00133$
      002C81                       3367 00108$:
                           000C1C  3368 	C$IO_Expander.c$752$1_0$185 ==.
                                   3369 ;	IO_Expander.c:752: P1_1 = 1;
                                   3370 ;	assignBit
      002C81 D2 91            [12] 3371 	setb	_P1_1
                           000C1E  3372 	C$IO_Expander.c$753$2_0$195 ==.
                                   3373 ;	IO_Expander.c:753: for (i = 0; i < 5; i++);
      002C83 90 04 4E         [24] 3374 	mov	dptr,#_eereset_i_65536_185
      002C86 E4               [12] 3375 	clr	a
      002C87 F0               [24] 3376 	movx	@dptr,a
      002C88                       3377 00136$:
      002C88 90 04 4E         [24] 3378 	mov	dptr,#_eereset_i_65536_185
      002C8B E0               [24] 3379 	movx	a,@dptr
      002C8C FF               [12] 3380 	mov	r7,a
      002C8D BF 05 00         [24] 3381 	cjne	r7,#0x05,00241$
      002C90                       3382 00241$:
      002C90 50 08            [24] 3383 	jnc	00109$
      002C92 90 04 4E         [24] 3384 	mov	dptr,#_eereset_i_65536_185
      002C95 E0               [24] 3385 	movx	a,@dptr
      002C96 04               [12] 3386 	inc	a
      002C97 F0               [24] 3387 	movx	@dptr,a
      002C98 80 EE            [24] 3388 	sjmp	00136$
      002C9A                       3389 00109$:
                           000C35  3390 	C$IO_Expander.c$755$1_0$185 ==.
                                   3391 ;	IO_Expander.c:755: P1_0 = 1;
                                   3392 ;	assignBit
      002C9A D2 90            [12] 3393 	setb	_P1_0
                           000C37  3394 	C$IO_Expander.c$756$2_0$196 ==.
                                   3395 ;	IO_Expander.c:756: for (i = 0; i < 10; i++);
      002C9C 90 04 4E         [24] 3396 	mov	dptr,#_eereset_i_65536_185
      002C9F E4               [12] 3397 	clr	a
      002CA0 F0               [24] 3398 	movx	@dptr,a
      002CA1                       3399 00139$:
      002CA1 90 04 4E         [24] 3400 	mov	dptr,#_eereset_i_65536_185
      002CA4 E0               [24] 3401 	movx	a,@dptr
      002CA5 FF               [12] 3402 	mov	r7,a
      002CA6 BF 0A 00         [24] 3403 	cjne	r7,#0x0a,00243$
      002CA9                       3404 00243$:
      002CA9 50 08            [24] 3405 	jnc	00141$
      002CAB 90 04 4E         [24] 3406 	mov	dptr,#_eereset_i_65536_185
      002CAE E0               [24] 3407 	movx	a,@dptr
      002CAF 04               [12] 3408 	inc	a
      002CB0 F0               [24] 3409 	movx	@dptr,a
      002CB1 80 EE            [24] 3410 	sjmp	00139$
      002CB3                       3411 00141$:
                           000C4E  3412 	C$IO_Expander.c$757$2_0$185 ==.
                                   3413 ;	IO_Expander.c:757: }
                           000C4E  3414 	C$IO_Expander.c$757$2_0$185 ==.
                           000C4E  3415 	XG$eereset$0$0 ==.
      002CB3 22               [24] 3416 	ret
                                   3417 	.area CSEG    (CODE)
                                   3418 	.area CONST   (CODE)
                           000000  3419 FIO_Expander$__str_0$0_0$0 == .
                                   3420 	.area CONST   (CODE)
      0037E9                       3421 ___str_0:
      0037E9 1B                    3422 	.db 0x1b
      0037EA 5B 31 3B 39 36 6D     3423 	.ascii "[1;96m"
      0037F0 00                    3424 	.db 0x00
                                   3425 	.area CSEG    (CODE)
                           000C4F  3426 FIO_Expander$__str_1$0_0$0 == .
                                   3427 	.area CONST   (CODE)
      0037F1                       3428 ___str_1:
      0037F1 1B                    3429 	.db 0x1b
      0037F2 5B 30 6D              3430 	.ascii "[0m"
      0037F5 00                    3431 	.db 0x00
                                   3432 	.area CSEG    (CODE)
                           000C4F  3433 FIO_Expander$__str_2$0_0$0 == .
                                   3434 	.area CONST   (CODE)
      0037F6                       3435 ___str_2:
      0037F6 1B                    3436 	.db 0x1b
      0037F7 5B 31 3B 39 32 6D     3437 	.ascii "[1;92m"
      0037FD 00                    3438 	.db 0x00
                                   3439 	.area CSEG    (CODE)
                           000C4F  3440 FIO_Expander$__str_3$0_0$0 == .
                                   3441 	.area CONST   (CODE)
      0037FE                       3442 ___str_3:
      0037FE 25 30 33 58 3A 20     3443 	.ascii "%03X: "
      003804 00                    3444 	.db 0x00
                                   3445 	.area CSEG    (CODE)
                           000C4F  3446 FIO_Expander$__str_4$0_0$0 == .
                                   3447 	.area CONST   (CODE)
      003805                       3448 ___str_4:
      003805 25 30 32 58 20        3449 	.ascii "%02X "
      00380A 00                    3450 	.db 0x00
                                   3451 	.area CSEG    (CODE)
                           000C4F  3452 FIO_Expander$__str_5$0_0$0 == .
                                   3453 	.area CONST   (CODE)
      00380B                       3454 ___str_5:
      00380B 0D                    3455 	.db 0x0d
      00380C 0A                    3456 	.db 0x0a
      00380D 00                    3457 	.db 0x00
                                   3458 	.area CSEG    (CODE)
                           000C4F  3459 FIO_Expander$__str_6$0_0$0 == .
                                   3460 	.area CONST   (CODE)
      00380E                       3461 ___str_6:
      00380E 4E 6F 74 20 61 20 63  3462 	.ascii "Not a choice we have. Please try again."
             68 6F 69 63 65 20 77
             65 20 68 61 76 65 2E
             20 50 6C 65 61 73 65
             20 74 72 79 20 61 67
             61 69 6E 2E
      003835 0D                    3463 	.db 0x0d
      003836 0A                    3464 	.db 0x0a
      003837 0D                    3465 	.db 0x0d
      003838 0A                    3466 	.db 0x0a
      003839 00                    3467 	.db 0x00
                                   3468 	.area CSEG    (CODE)
                           000C4F  3469 FIO_Expander$__str_7$0_0$0 == .
                                   3470 	.area CONST   (CODE)
      00383A                       3471 ___str_7:
      00383A 20 2D 2D 2D 2D 2D 2D  3472 	.ascii " --------- I2C Interface Menu --------- "
             2D 2D 2D 20 49 32 43
             20 49 6E 74 65 72 66
             61 63 65 20 4D 65 6E
             75 20 2D 2D 2D 2D 2D
             2D 2D 2D 2D 20
      003862 0D                    3473 	.db 0x0d
      003863 0A                    3474 	.db 0x0a
      003864 00                    3475 	.db 0x00
                                   3476 	.area CSEG    (CODE)
                           000C4F  3477 FIO_Expander$__str_8$0_0$0 == .
                                   3478 	.area CONST   (CODE)
      003865                       3479 ___str_8:
      003865 45 45 50 52 4F 4D 20  3480 	.ascii "EEPROM Functions:"
             46 75 6E 63 74 69 6F
             6E 73 3A
      003876 0D                    3481 	.db 0x0d
      003877 0A                    3482 	.db 0x0a
      003878 00                    3483 	.db 0x00
                                   3484 	.area CSEG    (CODE)
                           000C4F  3485 FIO_Expander$__str_9$0_0$0 == .
                                   3486 	.area CONST   (CODE)
      003879                       3487 ___str_9:
      003879 31 2E 20 57 72 69 74  3488 	.ascii "1. Write Byte to EEPROM"
             65 20 42 79 74 65 20
             74 6F 20 45 45 50 52
             4F 4D
      003890 0D                    3489 	.db 0x0d
      003891 0A                    3490 	.db 0x0a
      003892 00                    3491 	.db 0x00
                                   3492 	.area CSEG    (CODE)
                           000C4F  3493 FIO_Expander$__str_10$0_0$0 == .
                                   3494 	.area CONST   (CODE)
      003893                       3495 ___str_10:
      003893 32 2E 20 52 65 61 64  3496 	.ascii "2. Read Byte from EEPROM"
             20 42 79 74 65 20 66
             72 6F 6D 20 45 45 50
             52 4F 4D
      0038AB 0D                    3497 	.db 0x0d
      0038AC 0A                    3498 	.db 0x0a
      0038AD 00                    3499 	.db 0x00
                                   3500 	.area CSEG    (CODE)
                           000C4F  3501 FIO_Expander$__str_11$0_0$0 == .
                                   3502 	.area CONST   (CODE)
      0038AE                       3503 ___str_11:
      0038AE 33 2E 20 48 65 78 20  3504 	.ascii "3. Hex Dump EEPROM"
             44 75 6D 70 20 45 45
             50 52 4F 4D
      0038C0 0D                    3505 	.db 0x0d
      0038C1 0A                    3506 	.db 0x0a
      0038C2 00                    3507 	.db 0x00
                                   3508 	.area CSEG    (CODE)
                           000C4F  3509 FIO_Expander$__str_12$0_0$0 == .
                                   3510 	.area CONST   (CODE)
      0038C3                       3511 ___str_12:
      0038C3 34 2E 20 52 65 73 65  3512 	.ascii "4. Reset EEPROM"
             74 20 45 45 50 52 4F
             4D
      0038D2 0D                    3513 	.db 0x0d
      0038D3 0A                    3514 	.db 0x0a
      0038D4 00                    3515 	.db 0x00
                                   3516 	.area CSEG    (CODE)
                           000C4F  3517 FIO_Expander$__str_13$0_0$0 == .
                                   3518 	.area CONST   (CODE)
      0038D5                       3519 ___str_13:
      0038D5 50 43 46 38 35 37 34  3520 	.ascii "PCF8574A I/O Expander Functions:"
             41 20 49 2F 4F 20 45
             78 70 61 6E 64 65 72
             20 46 75 6E 63 74 69
             6F 6E 73 3A
      0038F5 0D                    3521 	.db 0x0d
      0038F6 0A                    3522 	.db 0x0a
      0038F7 00                    3523 	.db 0x00
                                   3524 	.area CSEG    (CODE)
                           000C4F  3525 FIO_Expander$__str_14$0_0$0 == .
                                   3526 	.area CONST   (CODE)
      0038F8                       3527 ___str_14:
      0038F8 35 2E 20 4D 61 6B 65  3528 	.ascii "5. Make Output = Input"
             20 4F 75 74 70 75 74
             20 3D 20 49 6E 70 75
             74
      00390E 0D                    3529 	.db 0x0d
      00390F 0A                    3530 	.db 0x0a
      003910 00                    3531 	.db 0x00
                                   3532 	.area CSEG    (CODE)
                           000C4F  3533 FIO_Expander$__str_15$0_0$0 == .
                                   3534 	.area CONST   (CODE)
      003911                       3535 ___str_15:
      003911 36 2E 20 4D 61 6B 65  3536 	.ascii "6. Make Output = !Input "
             20 4F 75 74 70 75 74
             20 3D 20 21 49 6E 70
             75 74 20
      003929 0D                    3537 	.db 0x0d
      00392A 0A                    3538 	.db 0x0a
      00392B 00                    3539 	.db 0x00
                                   3540 	.area CSEG    (CODE)
                           000C4F  3541 FIO_Expander$__str_16$0_0$0 == .
                                   3542 	.area CONST   (CODE)
      00392C                       3543 ___str_16:
      00392C 2D 2D 2D 2D 2D 2D 2D  3544 	.ascii "----------------------------------------"
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D
      003954 0D                    3545 	.db 0x0d
      003955 0A                    3546 	.db 0x0a
      003956 00                    3547 	.db 0x00
                                   3548 	.area CSEG    (CODE)
                           000C4F  3549 FIO_Expander$__str_17$0_0$0 == .
                                   3550 	.area CONST   (CODE)
      003957                       3551 ___str_17:
      003957 50 75 74 20 77 68 61  3552 	.ascii "Put what you want to do: "
             74 20 79 6F 75 20 77
             61 6E 74 20 74 6F 20
             64 6F 3A 20
      003970 00                    3553 	.db 0x00
                                   3554 	.area CSEG    (CODE)
                           000C4F  3555 FIO_Expander$__str_18$0_0$0 == .
                                   3556 	.area CONST   (CODE)
      003971                       3557 ___str_18:
      003971 0D                    3558 	.db 0x0d
      003972 0A                    3559 	.db 0x0a
      003973 2D 2D 2D 20 57 72 69  3560 	.ascii "--- Write Byte to EEPROM ---"
             74 65 20 42 79 74 65
             20 74 6F 20 45 45 50
             52 4F 4D 20 2D 2D 2D
      00398F 0D                    3561 	.db 0x0d
      003990 0A                    3562 	.db 0x0a
      003991 00                    3563 	.db 0x00
                                   3564 	.area CSEG    (CODE)
                           000C4F  3565 FIO_Expander$__str_19$0_0$0 == .
                                   3566 	.area CONST   (CODE)
      003992                       3567 ___str_19:
      003992 45 6E 74 65 72 20 45  3568 	.ascii "Enter EEPROM address (0-7FF hex): "
             45 50 52 4F 4D 20 61
             64 64 72 65 73 73 20
             28 30 2D 37 46 46 20
             68 65 78 29 3A 20
      0039B4 00                    3569 	.db 0x00
                                   3570 	.area CSEG    (CODE)
                           000C4F  3571 FIO_Expander$__str_20$0_0$0 == .
                                   3572 	.area CONST   (CODE)
      0039B5                       3573 ___str_20:
      0039B5 45 72 72 6F 72 3A 20  3574 	.ascii "Error: Address out of range (max 7FF)"
             41 64 64 72 65 73 73
             20 6F 75 74 20 6F 66
             20 72 61 6E 67 65 20
             28 6D 61 78 20 37 46
             46 29
      0039DA 0D                    3575 	.db 0x0d
      0039DB 0A                    3576 	.db 0x0a
      0039DC 00                    3577 	.db 0x00
                                   3578 	.area CSEG    (CODE)
                           000C4F  3579 FIO_Expander$__str_21$0_0$0 == .
                                   3580 	.area CONST   (CODE)
      0039DD                       3581 ___str_21:
      0039DD 45 6E 74 65 72 20 64  3582 	.ascii "Enter data byte (0-FF hex): "
             61 74 61 20 62 79 74
             65 20 28 30 2D 46 46
             20 68 65 78 29 3A 20
      0039F9 00                    3583 	.db 0x00
                                   3584 	.area CSEG    (CODE)
                           000C4F  3585 FIO_Expander$__str_22$0_0$0 == .
                                   3586 	.area CONST   (CODE)
      0039FA                       3587 ___str_22:
      0039FA 45 72 72 6F 72 3A 20  3588 	.ascii "Error: Data out of range (max FF)"
             44 61 74 61 20 6F 75
             74 20 6F 66 20 72 61
             6E 67 65 20 28 6D 61
             78 20 46 46 29
      003A1B 0D                    3589 	.db 0x0d
      003A1C 0A                    3590 	.db 0x0a
      003A1D 00                    3591 	.db 0x00
                                   3592 	.area CSEG    (CODE)
                           000C4F  3593 FIO_Expander$__str_23$0_0$0 == .
                                   3594 	.area CONST   (CODE)
      003A1E                       3595 ___str_23:
      003A1E 57 72 69 74 69 6E 67  3596 	.ascii "Writing"
      003A25 00                    3597 	.db 0x00
                                   3598 	.area CSEG    (CODE)
                           000C4F  3599 FIO_Expander$__str_24$0_0$0 == .
                                   3600 	.area CONST   (CODE)
      003A26                       3601 ___str_24:
      003A26 0D                    3602 	.db 0x0d
      003A27 0A                    3603 	.db 0x0a
      003A28 64 65 76 69 63 65 20  3604 	.ascii "device addr: 0x%02X, lower addr: 0x%02X"
             61 64 64 72 3A 20 30
             78 25 30 32 58 2C 20
             6C 6F 77 65 72 20 61
             64 64 72 3A 20 30 78
             25 30 32 58
      003A4F 0D                    3605 	.db 0x0d
      003A50 0A                    3606 	.db 0x0a
      003A51 00                    3607 	.db 0x00
                                   3608 	.area CSEG    (CODE)
                           000C4F  3609 FIO_Expander$__str_25$0_0$0 == .
                                   3610 	.area CONST   (CODE)
      003A52                       3611 ___str_25:
      003A52 53 75 63 63 65 73 73  3612 	.ascii "Success!"
             21
      003A5A 0D                    3613 	.db 0x0d
      003A5B 0A                    3614 	.db 0x0a
      003A5C 00                    3615 	.db 0x00
                                   3616 	.area CSEG    (CODE)
                           000C4F  3617 FIO_Expander$__str_26$0_0$0 == .
                                   3618 	.area CONST   (CODE)
      003A5D                       3619 ___str_26:
      003A5D 25 30 32 58           3620 	.ascii "%02X"
      003A61 0D                    3621 	.db 0x0d
      003A62 0A                    3622 	.db 0x0a
      003A63 00                    3623 	.db 0x00
                                   3624 	.area CSEG    (CODE)
                           000C4F  3625 FIO_Expander$__str_27$0_0$0 == .
                                   3626 	.area CONST   (CODE)
      003A64                       3627 ___str_27:
      003A64 0D                    3628 	.db 0x0d
      003A65 0A                    3629 	.db 0x0a
      003A66 2D 2D 2D 20 52 65 61  3630 	.ascii "--- Read Byte from EEPROM ---"
             64 20 42 79 74 65 20
             66 72 6F 6D 20 45 45
             50 52 4F 4D 20 2D 2D
             2D
      003A83 0D                    3631 	.db 0x0d
      003A84 0A                    3632 	.db 0x0a
      003A85 00                    3633 	.db 0x00
                                   3634 	.area CSEG    (CODE)
                           000C4F  3635 FIO_Expander$__str_28$0_0$0 == .
                                   3636 	.area CONST   (CODE)
      003A86                       3637 ___str_28:
      003A86 52 65 61 64 69 6E 67  3638 	.ascii "Reading"
      003A8D 00                    3639 	.db 0x00
                                   3640 	.area CSEG    (CODE)
                           000C4F  3641 FIO_Expander$__str_29$0_0$0 == .
                                   3642 	.area CONST   (CODE)
      003A8E                       3643 ___str_29:
      003A8E 0D                    3644 	.db 0x0d
      003A8F 0A                    3645 	.db 0x0a
      003A90 2D 2D 2D 20 48 65 78  3646 	.ascii "--- Hex Dump EEPROM ---"
             20 44 75 6D 70 20 45
             45 50 52 4F 4D 20 2D
             2D 2D
      003AA7 0D                    3647 	.db 0x0d
      003AA8 0A                    3648 	.db 0x0a
      003AA9 00                    3649 	.db 0x00
                                   3650 	.area CSEG    (CODE)
                           000C4F  3651 FIO_Expander$__str_30$0_0$0 == .
                                   3652 	.area CONST   (CODE)
      003AAA                       3653 ___str_30:
      003AAA 45 6E 74 65 72 20 73  3654 	.ascii "Enter start address (0-7FF hex): "
             74 61 72 74 20 61 64
             64 72 65 73 73 20 28
             30 2D 37 46 46 20 68
             65 78 29 3A 20
      003ACB 00                    3655 	.db 0x00
                                   3656 	.area CSEG    (CODE)
                           000C4F  3657 FIO_Expander$__str_31$0_0$0 == .
                                   3658 	.area CONST   (CODE)
      003ACC                       3659 ___str_31:
      003ACC 45 72 72 6F 72 3A 20  3660 	.ascii "Error: Start address out of range (max 7FF)"
             53 74 61 72 74 20 61
             64 64 72 65 73 73 20
             6F 75 74 20 6F 66 20
             72 61 6E 67 65 20 28
             6D 61 78 20 37 46 46
             29
      003AF7 0D                    3661 	.db 0x0d
      003AF8 0A                    3662 	.db 0x0a
      003AF9 00                    3663 	.db 0x00
                                   3664 	.area CSEG    (CODE)
                           000C4F  3665 FIO_Expander$__str_32$0_0$0 == .
                                   3666 	.area CONST   (CODE)
      003AFA                       3667 ___str_32:
      003AFA 45 6E 74 65 72 20 65  3668 	.ascii "Enter end address (0-7FF hex): "
             6E 64 20 61 64 64 72
             65 73 73 20 28 30 2D
             37 46 46 20 68 65 78
             29 3A 20
      003B19 00                    3669 	.db 0x00
                                   3670 	.area CSEG    (CODE)
                           000C4F  3671 FIO_Expander$__str_33$0_0$0 == .
                                   3672 	.area CONST   (CODE)
      003B1A                       3673 ___str_33:
      003B1A 45 72 72 6F 72 3A 20  3674 	.ascii "Error: End address out of range (max 7FF)"
             45 6E 64 20 61 64 64
             72 65 73 73 20 6F 75
             74 20 6F 66 20 72 61
             6E 67 65 20 28 6D 61
             78 20 37 46 46 29
      003B43 0D                    3675 	.db 0x0d
      003B44 0A                    3676 	.db 0x0a
      003B45 00                    3677 	.db 0x00
                                   3678 	.area CSEG    (CODE)
                           000C4F  3679 FIO_Expander$__str_34$0_0$0 == .
                                   3680 	.area CONST   (CODE)
      003B46                       3681 ___str_34:
      003B46 45 72 72 6F 72 3A 20  3682 	.ascii "Error: Start address must be <= end address"
             53 74 61 72 74 20 61
             64 64 72 65 73 73 20
             6D 75 73 74 20 62 65
             20 3C 3D 20 65 6E 64
             20 61 64 64 72 65 73
             73
      003B71 0D                    3683 	.db 0x0d
      003B72 0A                    3684 	.db 0x0a
      003B73 00                    3685 	.db 0x00
                                   3686 	.area CSEG    (CODE)
                           000C4F  3687 FIO_Expander$__str_35$0_0$0 == .
                                   3688 	.area CONST   (CODE)
      003B74                       3689 ___str_35:
      003B74 52 65 61 64 69 6E 67  3690 	.ascii "Reading EEPROM"
             20 45 45 50 52 4F 4D
      003B82 00                    3691 	.db 0x00
                                   3692 	.area CSEG    (CODE)
                           000C4F  3693 FIO_Expander$__str_36$0_0$0 == .
                                   3694 	.area CONST   (CODE)
      003B83                       3695 ___str_36:
      003B83 48 65 78 20 64 75 6D  3696 	.ascii "Hex dump complete!"
             70 20 63 6F 6D 70 6C
             65 74 65 21
      003B95 0D                    3697 	.db 0x0d
      003B96 0A                    3698 	.db 0x0a
      003B97 00                    3699 	.db 0x00
                                   3700 	.area CSEG    (CODE)
                           000C4F  3701 FIO_Expander$__str_37$0_0$0 == .
                                   3702 	.area CONST   (CODE)
      003B98                       3703 ___str_37:
      003B98 0D                    3704 	.db 0x0d
      003B99 0A                    3705 	.db 0x0a
      003B9A 2D 2D 2D 20 52 65 73  3706 	.ascii "--- Reset EEPROM ---"
             65 74 20 45 45 50 52
             4F 4D 20 2D 2D 2D
      003BAE 0D                    3707 	.db 0x0d
      003BAF 0A                    3708 	.db 0x0a
      003BB0 00                    3709 	.db 0x00
                                   3710 	.area CSEG    (CODE)
                           000C4F  3711 FIO_Expander$__str_38$0_0$0 == .
                                   3712 	.area CONST   (CODE)
      003BB1                       3713 ___str_38:
      003BB1 54 68 69 73 20 77 69  3714 	.ascii "This will reset the I2C bus and EEPROM. Continue? (y/n): "
             6C 6C 20 72 65 73 65
             74 20 74 68 65 20 49
             32 43 20 62 75 73 20
             61 6E 64 20 45 45 50
             52 4F 4D 2E 20 43 6F
             6E 74 69 6E 75 65 3F
             20 28 79 2F 6E 29 3A
             20
      003BEA 00                    3715 	.db 0x00
                                   3716 	.area CSEG    (CODE)
                           000C4F  3717 FIO_Expander$__str_39$0_0$0 == .
                                   3718 	.area CONST   (CODE)
      003BEB                       3719 ___str_39:
      003BEB 52 65 73 65 74 74 69  3720 	.ascii "Resetting I2C bus and EEPROM"
             6E 67 20 49 32 43 20
             62 75 73 20 61 6E 64
             20 45 45 50 52 4F 4D
      003C07 00                    3721 	.db 0x00
                                   3722 	.area CSEG    (CODE)
                           000C4F  3723 FIO_Expander$__str_40$0_0$0 == .
                                   3724 	.area CONST   (CODE)
      003C08                       3725 ___str_40:
      003C08 20 43 6F 6D 70 6C 65  3726 	.ascii " Complete!"
             74 65 21
      003C12 0D                    3727 	.db 0x0d
      003C13 0A                    3728 	.db 0x0a
      003C14 00                    3729 	.db 0x00
                                   3730 	.area CSEG    (CODE)
                           000C4F  3731 FIO_Expander$__str_41$0_0$0 == .
                                   3732 	.area CONST   (CODE)
      003C15                       3733 ___str_41:
      003C15 54 68 65 20 49 32 43  3734 	.ascii "The I2C EEPROM has been reset."
             20 45 45 50 52 4F 4D
             20 68 61 73 20 62 65
             65 6E 20 72 65 73 65
             74 2E
      003C33 0D                    3735 	.db 0x0d
      003C34 0A                    3736 	.db 0x0a
      003C35 00                    3737 	.db 0x00
                                   3738 	.area CSEG    (CODE)
                           000C4F  3739 FIO_Expander$__str_42$0_0$0 == .
                                   3740 	.area CONST   (CODE)
      003C36                       3741 ___str_42:
      003C36 52 65 2D 69 6E 69 74  3742 	.ascii "Re-initializing PCF8574A..."
             69 61 6C 69 7A 69 6E
             67 20 50 43 46 38 35
             37 34 41 2E 2E 2E
      003C51 0D                    3743 	.db 0x0d
      003C52 0A                    3744 	.db 0x0a
      003C53 00                    3745 	.db 0x00
                                   3746 	.area CSEG    (CODE)
                           000C4F  3747 FIO_Expander$__str_43$0_0$0 == .
                                   3748 	.area CONST   (CODE)
      003C54                       3749 ___str_43:
      003C54 52 65 73 65 74 20 63  3750 	.ascii "Reset cancelled."
             61 6E 63 65 6C 6C 65
             64 2E
      003C64 0D                    3751 	.db 0x0d
      003C65 0A                    3752 	.db 0x0a
      003C66 00                    3753 	.db 0x00
                                   3754 	.area CSEG    (CODE)
                                   3755 	.area XINIT   (CODE)
                           000000  3756 FIO_Expander$__xinit_IO_Expander_port_state$0_0$0 == .
      003C72                       3757 __xinit__IO_Expander_port_state:
      003C72 FE                    3758 	.db #0xfe	; 254
                           000001  3759 FIO_Expander$__xinit_PCF8574A_input_state$0_0$0 == .
      003C73                       3760 __xinit__PCF8574A_input_state:
      003C73 00                    3761 	.db #0x00	; 0
                           000002  3762 FIO_Expander$__xinit_io_link$0_0$0 == .
      003C74                       3763 __xinit__io_link:
      003C74 01                    3764 	.db #0x01	;  1
                                   3765 	.area CABS    (ABS,CODE)
