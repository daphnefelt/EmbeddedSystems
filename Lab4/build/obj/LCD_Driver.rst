                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module LCD_Driver
                                      6 	.optsdcc -mmcs51 --model-large
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _row_addresses
                                     12 	.globl _main
                                     13 	.globl _menu_print
                                     14 	.globl _hex_dump_complete
                                     15 	.globl _hex_dump_cgram
                                     16 	.globl _hex_dump_ddram
                                     17 	.globl _let_user_create_char
                                     18 	.globl _lcdcreatechar
                                     19 	.globl _get_binary_row
                                     20 	.globl _timer0_isr
                                     21 	.globl _timer_init
                                     22 	.globl _clock_reset
                                     23 	.globl _clock_start
                                     24 	.globl _clock_stop
                                     25 	.globl _display_clock
                                     26 	.globl _restore_cursor_position
                                     27 	.globl _save_cursor_position
                                     28 	.globl _get_user_input
                                     29 	.globl _get_number
                                     30 	.globl _lcdinit
                                     31 	.globl _lcd_delay_ms
                                     32 	.globl _lcd_home
                                     33 	.globl _lcdclear
                                     34 	.globl _lcd_string_at
                                     35 	.globl _lcd_putchar_at
                                     36 	.globl _lcdputstr_wordwrap
                                     37 	.globl _lcdputstr
                                     38 	.globl _lcdgotoxy
                                     39 	.globl _lcdgotoaddr
                                     40 	.globl _lcd_read_address
                                     41 	.globl _lcdputch
                                     42 	.globl _lcd_cmd
                                     43 	.globl _lcdbusywait
                                     44 	.globl _putstr
                                     45 	.globl _atoi
                                     46 	.globl _sprintf
                                     47 	.globl _printf
                                     48 	.globl _CY
                                     49 	.globl _AC
                                     50 	.globl _F0
                                     51 	.globl _RS1
                                     52 	.globl _RS0
                                     53 	.globl _OV
                                     54 	.globl _F1
                                     55 	.globl _P
                                     56 	.globl _PS
                                     57 	.globl _PT1
                                     58 	.globl _PX1
                                     59 	.globl _PT0
                                     60 	.globl _PX0
                                     61 	.globl _RD
                                     62 	.globl _WR
                                     63 	.globl _T1
                                     64 	.globl _T0
                                     65 	.globl _INT1
                                     66 	.globl _INT0
                                     67 	.globl _TXD
                                     68 	.globl _RXD
                                     69 	.globl _P3_7
                                     70 	.globl _P3_6
                                     71 	.globl _P3_5
                                     72 	.globl _P3_4
                                     73 	.globl _P3_3
                                     74 	.globl _P3_2
                                     75 	.globl _P3_1
                                     76 	.globl _P3_0
                                     77 	.globl _EA
                                     78 	.globl _ES
                                     79 	.globl _ET1
                                     80 	.globl _EX1
                                     81 	.globl _ET0
                                     82 	.globl _EX0
                                     83 	.globl _P2_7
                                     84 	.globl _P2_6
                                     85 	.globl _P2_5
                                     86 	.globl _P2_4
                                     87 	.globl _P2_3
                                     88 	.globl _P2_2
                                     89 	.globl _P2_1
                                     90 	.globl _P2_0
                                     91 	.globl _SM0
                                     92 	.globl _SM1
                                     93 	.globl _SM2
                                     94 	.globl _REN
                                     95 	.globl _TB8
                                     96 	.globl _RB8
                                     97 	.globl _TI
                                     98 	.globl _RI
                                     99 	.globl _P1_7
                                    100 	.globl _P1_6
                                    101 	.globl _P1_5
                                    102 	.globl _P1_4
                                    103 	.globl _P1_3
                                    104 	.globl _P1_2
                                    105 	.globl _P1_1
                                    106 	.globl _P1_0
                                    107 	.globl _TF1
                                    108 	.globl _TR1
                                    109 	.globl _TF0
                                    110 	.globl _TR0
                                    111 	.globl _IE1
                                    112 	.globl _IT1
                                    113 	.globl _IE0
                                    114 	.globl _IT0
                                    115 	.globl _P0_7
                                    116 	.globl _P0_6
                                    117 	.globl _P0_5
                                    118 	.globl _P0_4
                                    119 	.globl _P0_3
                                    120 	.globl _P0_2
                                    121 	.globl _P0_1
                                    122 	.globl _P0_0
                                    123 	.globl _B
                                    124 	.globl _ACC
                                    125 	.globl _PSW
                                    126 	.globl _IP
                                    127 	.globl _P3
                                    128 	.globl _IE
                                    129 	.globl _P2
                                    130 	.globl _SBUF
                                    131 	.globl _SCON
                                    132 	.globl _P1
                                    133 	.globl _TH1
                                    134 	.globl _TH0
                                    135 	.globl _TL1
                                    136 	.globl _TL0
                                    137 	.globl _TMOD
                                    138 	.globl _TCON
                                    139 	.globl _PCON
                                    140 	.globl _DPH
                                    141 	.globl _DPL
                                    142 	.globl _SP
                                    143 	.globl _P0
                                    144 	.globl _custom_char_giraffe
                                    145 	.globl _custom_char_alpaca
                                    146 	.globl _custom_char_face
                                    147 	.globl _custom_char_heart
                                    148 	.globl _custom_char_checker
                                    149 	.globl _lcd_read_ptr
                                    150 	.globl _lcd_status_ptr
                                    151 	.globl _lcdputch_ptr
                                    152 	.globl _lcd_cmd_ptr
                                    153 	.globl _current_col
                                    154 	.globl _current_row
                                    155 	.globl _cursor_backup
                                    156 	.globl _timer_do_something
                                    157 	.globl _system_clock
                                    158 	.globl _lcdcreatechar_PARM_2
                                    159 	.globl _get_user_input_PARM_2
                                    160 	.globl _lcd_string_at_PARM_3
                                    161 	.globl _lcd_string_at_PARM_2
                                    162 	.globl _lcd_putchar_at_PARM_3
                                    163 	.globl _lcd_putchar_at_PARM_2
                                    164 	.globl _lcdgotoxy_PARM_2
                                    165 	.globl _putchar
                                    166 	.globl _getchar
                                    167 ;--------------------------------------------------------
                                    168 ; special function registers
                                    169 ;--------------------------------------------------------
                                    170 	.area RSEG    (ABS,DATA)
      000000                        171 	.org 0x0000
                           000080   172 G$P0$0_0$0 == 0x0080
                           000080   173 _P0	=	0x0080
                           000081   174 G$SP$0_0$0 == 0x0081
                           000081   175 _SP	=	0x0081
                           000082   176 G$DPL$0_0$0 == 0x0082
                           000082   177 _DPL	=	0x0082
                           000083   178 G$DPH$0_0$0 == 0x0083
                           000083   179 _DPH	=	0x0083
                           000087   180 G$PCON$0_0$0 == 0x0087
                           000087   181 _PCON	=	0x0087
                           000088   182 G$TCON$0_0$0 == 0x0088
                           000088   183 _TCON	=	0x0088
                           000089   184 G$TMOD$0_0$0 == 0x0089
                           000089   185 _TMOD	=	0x0089
                           00008A   186 G$TL0$0_0$0 == 0x008a
                           00008A   187 _TL0	=	0x008a
                           00008B   188 G$TL1$0_0$0 == 0x008b
                           00008B   189 _TL1	=	0x008b
                           00008C   190 G$TH0$0_0$0 == 0x008c
                           00008C   191 _TH0	=	0x008c
                           00008D   192 G$TH1$0_0$0 == 0x008d
                           00008D   193 _TH1	=	0x008d
                           000090   194 G$P1$0_0$0 == 0x0090
                           000090   195 _P1	=	0x0090
                           000098   196 G$SCON$0_0$0 == 0x0098
                           000098   197 _SCON	=	0x0098
                           000099   198 G$SBUF$0_0$0 == 0x0099
                           000099   199 _SBUF	=	0x0099
                           0000A0   200 G$P2$0_0$0 == 0x00a0
                           0000A0   201 _P2	=	0x00a0
                           0000A8   202 G$IE$0_0$0 == 0x00a8
                           0000A8   203 _IE	=	0x00a8
                           0000B0   204 G$P3$0_0$0 == 0x00b0
                           0000B0   205 _P3	=	0x00b0
                           0000B8   206 G$IP$0_0$0 == 0x00b8
                           0000B8   207 _IP	=	0x00b8
                           0000D0   208 G$PSW$0_0$0 == 0x00d0
                           0000D0   209 _PSW	=	0x00d0
                           0000E0   210 G$ACC$0_0$0 == 0x00e0
                           0000E0   211 _ACC	=	0x00e0
                           0000F0   212 G$B$0_0$0 == 0x00f0
                           0000F0   213 _B	=	0x00f0
                                    214 ;--------------------------------------------------------
                                    215 ; special function bits
                                    216 ;--------------------------------------------------------
                                    217 	.area RSEG    (ABS,DATA)
      000000                        218 	.org 0x0000
                           000080   219 G$P0_0$0_0$0 == 0x0080
                           000080   220 _P0_0	=	0x0080
                           000081   221 G$P0_1$0_0$0 == 0x0081
                           000081   222 _P0_1	=	0x0081
                           000082   223 G$P0_2$0_0$0 == 0x0082
                           000082   224 _P0_2	=	0x0082
                           000083   225 G$P0_3$0_0$0 == 0x0083
                           000083   226 _P0_3	=	0x0083
                           000084   227 G$P0_4$0_0$0 == 0x0084
                           000084   228 _P0_4	=	0x0084
                           000085   229 G$P0_5$0_0$0 == 0x0085
                           000085   230 _P0_5	=	0x0085
                           000086   231 G$P0_6$0_0$0 == 0x0086
                           000086   232 _P0_6	=	0x0086
                           000087   233 G$P0_7$0_0$0 == 0x0087
                           000087   234 _P0_7	=	0x0087
                           000088   235 G$IT0$0_0$0 == 0x0088
                           000088   236 _IT0	=	0x0088
                           000089   237 G$IE0$0_0$0 == 0x0089
                           000089   238 _IE0	=	0x0089
                           00008A   239 G$IT1$0_0$0 == 0x008a
                           00008A   240 _IT1	=	0x008a
                           00008B   241 G$IE1$0_0$0 == 0x008b
                           00008B   242 _IE1	=	0x008b
                           00008C   243 G$TR0$0_0$0 == 0x008c
                           00008C   244 _TR0	=	0x008c
                           00008D   245 G$TF0$0_0$0 == 0x008d
                           00008D   246 _TF0	=	0x008d
                           00008E   247 G$TR1$0_0$0 == 0x008e
                           00008E   248 _TR1	=	0x008e
                           00008F   249 G$TF1$0_0$0 == 0x008f
                           00008F   250 _TF1	=	0x008f
                           000090   251 G$P1_0$0_0$0 == 0x0090
                           000090   252 _P1_0	=	0x0090
                           000091   253 G$P1_1$0_0$0 == 0x0091
                           000091   254 _P1_1	=	0x0091
                           000092   255 G$P1_2$0_0$0 == 0x0092
                           000092   256 _P1_2	=	0x0092
                           000093   257 G$P1_3$0_0$0 == 0x0093
                           000093   258 _P1_3	=	0x0093
                           000094   259 G$P1_4$0_0$0 == 0x0094
                           000094   260 _P1_4	=	0x0094
                           000095   261 G$P1_5$0_0$0 == 0x0095
                           000095   262 _P1_5	=	0x0095
                           000096   263 G$P1_6$0_0$0 == 0x0096
                           000096   264 _P1_6	=	0x0096
                           000097   265 G$P1_7$0_0$0 == 0x0097
                           000097   266 _P1_7	=	0x0097
                           000098   267 G$RI$0_0$0 == 0x0098
                           000098   268 _RI	=	0x0098
                           000099   269 G$TI$0_0$0 == 0x0099
                           000099   270 _TI	=	0x0099
                           00009A   271 G$RB8$0_0$0 == 0x009a
                           00009A   272 _RB8	=	0x009a
                           00009B   273 G$TB8$0_0$0 == 0x009b
                           00009B   274 _TB8	=	0x009b
                           00009C   275 G$REN$0_0$0 == 0x009c
                           00009C   276 _REN	=	0x009c
                           00009D   277 G$SM2$0_0$0 == 0x009d
                           00009D   278 _SM2	=	0x009d
                           00009E   279 G$SM1$0_0$0 == 0x009e
                           00009E   280 _SM1	=	0x009e
                           00009F   281 G$SM0$0_0$0 == 0x009f
                           00009F   282 _SM0	=	0x009f
                           0000A0   283 G$P2_0$0_0$0 == 0x00a0
                           0000A0   284 _P2_0	=	0x00a0
                           0000A1   285 G$P2_1$0_0$0 == 0x00a1
                           0000A1   286 _P2_1	=	0x00a1
                           0000A2   287 G$P2_2$0_0$0 == 0x00a2
                           0000A2   288 _P2_2	=	0x00a2
                           0000A3   289 G$P2_3$0_0$0 == 0x00a3
                           0000A3   290 _P2_3	=	0x00a3
                           0000A4   291 G$P2_4$0_0$0 == 0x00a4
                           0000A4   292 _P2_4	=	0x00a4
                           0000A5   293 G$P2_5$0_0$0 == 0x00a5
                           0000A5   294 _P2_5	=	0x00a5
                           0000A6   295 G$P2_6$0_0$0 == 0x00a6
                           0000A6   296 _P2_6	=	0x00a6
                           0000A7   297 G$P2_7$0_0$0 == 0x00a7
                           0000A7   298 _P2_7	=	0x00a7
                           0000A8   299 G$EX0$0_0$0 == 0x00a8
                           0000A8   300 _EX0	=	0x00a8
                           0000A9   301 G$ET0$0_0$0 == 0x00a9
                           0000A9   302 _ET0	=	0x00a9
                           0000AA   303 G$EX1$0_0$0 == 0x00aa
                           0000AA   304 _EX1	=	0x00aa
                           0000AB   305 G$ET1$0_0$0 == 0x00ab
                           0000AB   306 _ET1	=	0x00ab
                           0000AC   307 G$ES$0_0$0 == 0x00ac
                           0000AC   308 _ES	=	0x00ac
                           0000AF   309 G$EA$0_0$0 == 0x00af
                           0000AF   310 _EA	=	0x00af
                           0000B0   311 G$P3_0$0_0$0 == 0x00b0
                           0000B0   312 _P3_0	=	0x00b0
                           0000B1   313 G$P3_1$0_0$0 == 0x00b1
                           0000B1   314 _P3_1	=	0x00b1
                           0000B2   315 G$P3_2$0_0$0 == 0x00b2
                           0000B2   316 _P3_2	=	0x00b2
                           0000B3   317 G$P3_3$0_0$0 == 0x00b3
                           0000B3   318 _P3_3	=	0x00b3
                           0000B4   319 G$P3_4$0_0$0 == 0x00b4
                           0000B4   320 _P3_4	=	0x00b4
                           0000B5   321 G$P3_5$0_0$0 == 0x00b5
                           0000B5   322 _P3_5	=	0x00b5
                           0000B6   323 G$P3_6$0_0$0 == 0x00b6
                           0000B6   324 _P3_6	=	0x00b6
                           0000B7   325 G$P3_7$0_0$0 == 0x00b7
                           0000B7   326 _P3_7	=	0x00b7
                           0000B0   327 G$RXD$0_0$0 == 0x00b0
                           0000B0   328 _RXD	=	0x00b0
                           0000B1   329 G$TXD$0_0$0 == 0x00b1
                           0000B1   330 _TXD	=	0x00b1
                           0000B2   331 G$INT0$0_0$0 == 0x00b2
                           0000B2   332 _INT0	=	0x00b2
                           0000B3   333 G$INT1$0_0$0 == 0x00b3
                           0000B3   334 _INT1	=	0x00b3
                           0000B4   335 G$T0$0_0$0 == 0x00b4
                           0000B4   336 _T0	=	0x00b4
                           0000B5   337 G$T1$0_0$0 == 0x00b5
                           0000B5   338 _T1	=	0x00b5
                           0000B6   339 G$WR$0_0$0 == 0x00b6
                           0000B6   340 _WR	=	0x00b6
                           0000B7   341 G$RD$0_0$0 == 0x00b7
                           0000B7   342 _RD	=	0x00b7
                           0000B8   343 G$PX0$0_0$0 == 0x00b8
                           0000B8   344 _PX0	=	0x00b8
                           0000B9   345 G$PT0$0_0$0 == 0x00b9
                           0000B9   346 _PT0	=	0x00b9
                           0000BA   347 G$PX1$0_0$0 == 0x00ba
                           0000BA   348 _PX1	=	0x00ba
                           0000BB   349 G$PT1$0_0$0 == 0x00bb
                           0000BB   350 _PT1	=	0x00bb
                           0000BC   351 G$PS$0_0$0 == 0x00bc
                           0000BC   352 _PS	=	0x00bc
                           0000D0   353 G$P$0_0$0 == 0x00d0
                           0000D0   354 _P	=	0x00d0
                           0000D1   355 G$F1$0_0$0 == 0x00d1
                           0000D1   356 _F1	=	0x00d1
                           0000D2   357 G$OV$0_0$0 == 0x00d2
                           0000D2   358 _OV	=	0x00d2
                           0000D3   359 G$RS0$0_0$0 == 0x00d3
                           0000D3   360 _RS0	=	0x00d3
                           0000D4   361 G$RS1$0_0$0 == 0x00d4
                           0000D4   362 _RS1	=	0x00d4
                           0000D5   363 G$F0$0_0$0 == 0x00d5
                           0000D5   364 _F0	=	0x00d5
                           0000D6   365 G$AC$0_0$0 == 0x00d6
                           0000D6   366 _AC	=	0x00d6
                           0000D7   367 G$CY$0_0$0 == 0x00d7
                           0000D7   368 _CY	=	0x00d7
                                    369 ;--------------------------------------------------------
                                    370 ; overlayable register banks
                                    371 ;--------------------------------------------------------
                                    372 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        373 	.ds 8
                                    374 ;--------------------------------------------------------
                                    375 ; internal ram data
                                    376 ;--------------------------------------------------------
                                    377 	.area DSEG    (DATA)
                           000000   378 LLCD_Driver.lcdputstr_wordwrap$sloc0$0_1$0==.
      000008                        379 _lcdputstr_wordwrap_sloc0_1_0:
      000008                        380 	.ds 3
                           000003   381 LLCD_Driver.lcdputstr_wordwrap$sloc1$0_1$0==.
      00000B                        382 _lcdputstr_wordwrap_sloc1_1_0:
      00000B                        383 	.ds 3
                           000006   384 LLCD_Driver.hex_dump_cgram$sloc0$0_1$0==.
      00000E                        385 _hex_dump_cgram_sloc0_1_0:
      00000E                        386 	.ds 1
                           000007   387 LLCD_Driver.hex_dump_cgram$sloc1$0_1$0==.
      00000F                        388 _hex_dump_cgram_sloc1_1_0:
      00000F                        389 	.ds 1
                                    390 ;--------------------------------------------------------
                                    391 ; overlayable items in internal ram
                                    392 ;--------------------------------------------------------
                                    393 ;--------------------------------------------------------
                                    394 ; Stack segment in internal ram
                                    395 ;--------------------------------------------------------
                                    396 	.area	SSEG
      000021                        397 __start__stack:
      000021                        398 	.ds	1
                                    399 
                                    400 ;--------------------------------------------------------
                                    401 ; indirectly addressable internal ram data
                                    402 ;--------------------------------------------------------
                                    403 	.area ISEG    (DATA)
                                    404 ;--------------------------------------------------------
                                    405 ; absolute internal ram data
                                    406 ;--------------------------------------------------------
                                    407 	.area IABS    (ABS,DATA)
                                    408 	.area IABS    (ABS,DATA)
                                    409 ;--------------------------------------------------------
                                    410 ; bit data
                                    411 ;--------------------------------------------------------
                                    412 	.area BSEG    (BIT)
                                    413 ;--------------------------------------------------------
                                    414 ; paged external ram data
                                    415 ;--------------------------------------------------------
                                    416 	.area PSEG    (PAG,XDATA)
                                    417 ;--------------------------------------------------------
                                    418 ; external ram data
                                    419 ;--------------------------------------------------------
                                    420 	.area XSEG    (XDATA)
                           000000   421 LLCD_Driver.putchar$c$1_0$67==.
      000400                        422 _putchar_c_65536_67:
      000400                        423 	.ds 2
                           000002   424 LLCD_Driver.putstr$s$1_0$71==.
      000402                        425 _putstr_s_65536_71:
      000402                        426 	.ds 3
                           000005   427 LLCD_Driver.lcd_cmd$cmd$1_0$77==.
      000405                        428 _lcd_cmd_cmd_65536_77:
      000405                        429 	.ds 1
                           000006   430 LLCD_Driver.lcdputch$cc$1_0$79==.
      000406                        431 _lcdputch_cc_65536_79:
      000406                        432 	.ds 1
                           000007   433 LLCD_Driver.lcdgotoaddr$address$1_0$84==.
      000407                        434 _lcdgotoaddr_address_65536_84:
      000407                        435 	.ds 1
                           000008   436 LLCD_Driver.lcdgotoxy$col$1_0$86==.
      000408                        437 _lcdgotoxy_PARM_2:
      000408                        438 	.ds 1
                           000009   439 LLCD_Driver.lcdgotoxy$row$1_0$86==.
      000409                        440 _lcdgotoxy_row_65536_86:
      000409                        441 	.ds 1
                           00000A   442 LLCD_Driver.lcdputstr$ss$1_0$88==.
      00040A                        443 _lcdputstr_ss_65536_88:
      00040A                        444 	.ds 3
                           00000D   445 LLCD_Driver.lcdputstr$current_row_local$1_0$89==.
      00040D                        446 _lcdputstr_current_row_local_65536_89:
      00040D                        447 	.ds 1
                           00000E   448 LLCD_Driver.lcdputstr$current_col_local$1_0$89==.
      00040E                        449 _lcdputstr_current_col_local_65536_89:
      00040E                        450 	.ds 1
                           00000F   451 LLCD_Driver.lcdputstr_wordwrap$ss$1_0$96==.
      00040F                        452 _lcdputstr_wordwrap_ss_65536_96:
      00040F                        453 	.ds 3
                           000012   454 LLCD_Driver.lcdputstr_wordwrap$current_row_local$1_0$97==.
      000412                        455 _lcdputstr_wordwrap_current_row_local_65536_97:
      000412                        456 	.ds 1
                           000013   457 LLCD_Driver.lcdputstr_wordwrap$current_col_local$1_0$97==.
      000413                        458 _lcdputstr_wordwrap_current_col_local_65536_97:
      000413                        459 	.ds 1
                           000014   460 LLCD_Driver.lcdputstr_wordwrap$word_start$1_1$101==.
      000414                        461 _lcdputstr_wordwrap_word_start_65537_101:
      000414                        462 	.ds 3
                           000017   463 LLCD_Driver.lcd_putchar_at$col$1_0$108==.
      000417                        464 _lcd_putchar_at_PARM_2:
      000417                        465 	.ds 1
                           000018   466 LLCD_Driver.lcd_putchar_at$c$1_0$108==.
      000418                        467 _lcd_putchar_at_PARM_3:
      000418                        468 	.ds 1
                           000019   469 LLCD_Driver.lcd_putchar_at$row$1_0$108==.
      000419                        470 _lcd_putchar_at_row_65536_108:
      000419                        471 	.ds 1
                           00001A   472 LLCD_Driver.lcd_string_at$col$1_0$110==.
      00041A                        473 _lcd_string_at_PARM_2:
      00041A                        474 	.ds 1
                           00001B   475 LLCD_Driver.lcd_string_at$str$1_0$110==.
      00041B                        476 _lcd_string_at_PARM_3:
      00041B                        477 	.ds 3
                           00001E   478 LLCD_Driver.lcd_string_at$row$1_0$110==.
      00041E                        479 _lcd_string_at_row_65536_110:
      00041E                        480 	.ds 1
                           00001F   481 LLCD_Driver.lcd_delay_ms$ms$1_0$116==.
      00041F                        482 _lcd_delay_ms_ms_65536_116:
      00041F                        483 	.ds 1
                           000020   484 LLCD_Driver.lcd_delay_ms$i$1_0$117==.
      000420                        485 _lcd_delay_ms_i_65536_117:
      000420                        486 	.ds 2
                           000022   487 LLCD_Driver.get_number$buffer$1_0$123==.
      000422                        488 _get_number_buffer_65536_123:
      000422                        489 	.ds 3
                           000025   490 LLCD_Driver.get_user_input$max_len$1_0$127==.
      000425                        491 _get_user_input_PARM_2:
      000425                        492 	.ds 1
                           000026   493 LLCD_Driver.get_user_input$buffer$1_0$127==.
      000426                        494 _get_user_input_buffer_65536_127:
      000426                        495 	.ds 3
                           000029   496 LLCD_Driver.get_user_input$count$1_0$128==.
      000429                        497 _get_user_input_count_65536_128:
      000429                        498 	.ds 1
                           00002A   499 LLCD_Driver.display_clock$time_str$1_0$140==.
      00042A                        500 _display_clock_time_str_65536_140:
      00042A                        501 	.ds 9
                           000033   502 LLCD_Driver.get_binary_row$bits$1_0$157==.
      000433                        503 _get_binary_row_bits_65536_157:
      000433                        504 	.ds 6
                           000039   505 LLCD_Driver.get_binary_row$count$1_0$157==.
      000439                        506 _get_binary_row_count_65536_157:
      000439                        507 	.ds 1
                           00003A   508 LLCD_Driver.get_binary_row$result$1_0$157==.
      00043A                        509 _get_binary_row_result_65536_157:
      00043A                        510 	.ds 1
                           00003B   511 LLCD_Driver.lcdcreatechar$row_vals$1_0$166==.
      00043B                        512 _lcdcreatechar_PARM_2:
      00043B                        513 	.ds 3
                           00003E   514 LLCD_Driver.lcdcreatechar$ccode$1_0$166==.
      00043E                        515 _lcdcreatechar_ccode_65536_166:
      00043E                        516 	.ds 1
                           00003F   517 LLCD_Driver.let_user_create_char$row_vals$1_2$175==.
      00043F                        518 _let_user_create_char_row_vals_65538_175:
      00043F                        519 	.ds 8
                           000047   520 LLCD_Driver.let_user_create_char$prompt$3_2$177==.
      000447                        521 _let_user_create_char_prompt_196610_177:
      000447                        522 	.ds 30
                           000065   523 LLCD_Driver.hex_dump_ddram$header$3_1$182==.
      000465                        524 _hex_dump_ddram_header_196609_182:
      000465                        525 	.ds 20
                           000079   526 LLCD_Driver.hex_dump_ddram$buf$5_2$185==.
      000479                        527 _hex_dump_ddram_buf_327682_185:
      000479                        528 	.ds 8
                           000081   529 LLCD_Driver.hex_dump_cgram$pattern$5_1$192==.
      000481                        530 _hex_dump_cgram_pattern_327681_192:
      000481                        531 	.ds 1
                           000082   532 LLCD_Driver.hex_dump_cgram$buf$5_1$192==.
      000482                        533 _hex_dump_cgram_buf_327681_192:
      000482                        534 	.ds 30
                           0000A0   535 LLCD_Driver.main$input_buffer$1_1$203==.
      0004A0                        536 _main_input_buffer_65537_203:
      0004A0                        537 	.ds 64
                           0000E0   538 LLCD_Driver.main$char_buffer$1_1$203==.
      0004E0                        539 _main_char_buffer_65537_203:
      0004E0                        540 	.ds 1
                           0000E1   541 LLCD_Driver.main$row$1_1$203==.
      0004E1                        542 _main_row_65537_203:
      0004E1                        543 	.ds 2
                           0000E3   544 LLCD_Driver.main$col$1_1$203==.
      0004E3                        545 _main_col_65537_203:
      0004E3                        546 	.ds 2
                                    547 ;--------------------------------------------------------
                                    548 ; absolute external ram data
                                    549 ;--------------------------------------------------------
                                    550 	.area XABS    (ABS,XDATA)
                                    551 ;--------------------------------------------------------
                                    552 ; external initialized ram data
                                    553 ;--------------------------------------------------------
                                    554 	.area XISEG   (XDATA)
                           000000   555 G$system_clock$0_0$0==.
      000538                        556 _system_clock::
      000538                        557 	.ds 8
                           000008   558 G$timer_do_something$0_0$0==.
      000540                        559 _timer_do_something::
      000540                        560 	.ds 1
                           000009   561 G$cursor_backup$0_0$0==.
      000541                        562 _cursor_backup::
      000541                        563 	.ds 3
                           00000C   564 G$current_row$0_0$0==.
      000544                        565 _current_row::
      000544                        566 	.ds 1
                           00000D   567 G$current_col$0_0$0==.
      000545                        568 _current_col::
      000545                        569 	.ds 1
                           00000E   570 G$lcd_cmd_ptr$0_0$0==.
      000546                        571 _lcd_cmd_ptr::
      000546                        572 	.ds 2
                           000010   573 G$lcdputch_ptr$0_0$0==.
      000548                        574 _lcdputch_ptr::
      000548                        575 	.ds 2
                           000012   576 G$lcd_status_ptr$0_0$0==.
      00054A                        577 _lcd_status_ptr::
      00054A                        578 	.ds 2
                           000014   579 G$lcd_read_ptr$0_0$0==.
      00054C                        580 _lcd_read_ptr::
      00054C                        581 	.ds 2
                           000016   582 G$custom_char_checker$0_0$0==.
      00054E                        583 _custom_char_checker::
      00054E                        584 	.ds 8
                           00001E   585 G$custom_char_heart$0_0$0==.
      000556                        586 _custom_char_heart::
      000556                        587 	.ds 8
                           000026   588 G$custom_char_face$0_0$0==.
      00055E                        589 _custom_char_face::
      00055E                        590 	.ds 8
                           00002E   591 G$custom_char_alpaca$0_0$0==.
      000566                        592 _custom_char_alpaca::
      000566                        593 	.ds 8
                           000036   594 G$custom_char_giraffe$0_0$0==.
      00056E                        595 _custom_char_giraffe::
      00056E                        596 	.ds 8
                                    597 	.area HOME    (CODE)
                                    598 	.area GSINIT0 (CODE)
                                    599 	.area GSINIT1 (CODE)
                                    600 	.area GSINIT2 (CODE)
                                    601 	.area GSINIT3 (CODE)
                                    602 	.area GSINIT4 (CODE)
                                    603 	.area GSINIT5 (CODE)
                                    604 	.area GSINIT  (CODE)
                                    605 	.area GSFINAL (CODE)
                                    606 	.area CSEG    (CODE)
                                    607 ;--------------------------------------------------------
                                    608 ; interrupt vector
                                    609 ;--------------------------------------------------------
                                    610 	.area HOME    (CODE)
      002000                        611 __interrupt_vect:
      002000 02 20 3F         [24]  612 	ljmp	__sdcc_gsinit_startup
      002003 32               [24]  613 	reti
      002004                        614 	.ds	7
      00200B 02 28 AD         [24]  615 	ljmp	_timer0_isr
                                    616 ;--------------------------------------------------------
                                    617 ; global & static initialisations
                                    618 ;--------------------------------------------------------
                                    619 	.area HOME    (CODE)
                                    620 	.area GSINIT  (CODE)
                                    621 	.area GSFINAL (CODE)
                                    622 	.area GSINIT  (CODE)
                                    623 	.globl __sdcc_gsinit_startup
                                    624 	.globl __sdcc_program_startup
                                    625 	.globl __start__stack
                                    626 	.globl __mcs51_genXINIT
                                    627 	.globl __mcs51_genXRAMCLEAR
                                    628 	.globl __mcs51_genRAMCLEAR
                                    629 	.area GSFINAL (CODE)
      002098 02 20 0E         [24]  630 	ljmp	__sdcc_program_startup
                                    631 ;--------------------------------------------------------
                                    632 ; Home
                                    633 ;--------------------------------------------------------
                                    634 	.area HOME    (CODE)
                                    635 	.area HOME    (CODE)
      00200E                        636 __sdcc_program_startup:
      00200E 02 2E B6         [24]  637 	ljmp	_main
                                    638 ;	return from main will return to caller
                                    639 ;--------------------------------------------------------
                                    640 ; code
                                    641 ;--------------------------------------------------------
                                    642 	.area CSEG    (CODE)
                                    643 ;------------------------------------------------------------
                                    644 ;Allocation info for local variables in function 'putchar'
                                    645 ;------------------------------------------------------------
                                    646 ;c                         Allocated with name '_putchar_c_65536_67'
                                    647 ;------------------------------------------------------------
                           000000   648 	G$putchar$0$0 ==.
                           000000   649 	C$LCD_Driver.c$78$0_0$68 ==.
                                    650 ;	LCD_Driver.c:78: int putchar (int c){
                                    651 ;	-----------------------------------------
                                    652 ;	 function putchar
                                    653 ;	-----------------------------------------
      00209B                        654 _putchar:
                           000007   655 	ar7 = 0x07
                           000006   656 	ar6 = 0x06
                           000005   657 	ar5 = 0x05
                           000004   658 	ar4 = 0x04
                           000003   659 	ar3 = 0x03
                           000002   660 	ar2 = 0x02
                           000001   661 	ar1 = 0x01
                           000000   662 	ar0 = 0x00
      00209B AF 83            [24]  663 	mov	r7,dph
      00209D E5 82            [12]  664 	mov	a,dpl
      00209F 90 04 00         [24]  665 	mov	dptr,#_putchar_c_65536_67
      0020A2 F0               [24]  666 	movx	@dptr,a
      0020A3 EF               [12]  667 	mov	a,r7
      0020A4 A3               [24]  668 	inc	dptr
      0020A5 F0               [24]  669 	movx	@dptr,a
                           00000B   670 	C$LCD_Driver.c$79$1_0$68 ==.
                                    671 ;	LCD_Driver.c:79: while (!TI); // Wait till ready to transmit, TI = 1
      0020A6                        672 00101$:
      0020A6 30 99 FD         [24]  673 	jnb	_TI,00101$
                           00000E   674 	C$LCD_Driver.c$80$1_0$68 ==.
                                    675 ;	LCD_Driver.c:80: SBUF = c;    // load serial port with transmit value
      0020A9 90 04 00         [24]  676 	mov	dptr,#_putchar_c_65536_67
      0020AC E0               [24]  677 	movx	a,@dptr
      0020AD FE               [12]  678 	mov	r6,a
      0020AE A3               [24]  679 	inc	dptr
      0020AF E0               [24]  680 	movx	a,@dptr
      0020B0 FF               [12]  681 	mov	r7,a
      0020B1 8E 99            [24]  682 	mov	_SBUF,r6
                           000018   683 	C$LCD_Driver.c$81$1_0$68 ==.
                                    684 ;	LCD_Driver.c:81: TI = 0;      // clear TI flag
                                    685 ;	assignBit
      0020B3 C2 99            [12]  686 	clr	_TI
                           00001A   687 	C$LCD_Driver.c$82$1_0$68 ==.
                                    688 ;	LCD_Driver.c:82: return c;
      0020B5 8E 82            [24]  689 	mov	dpl,r6
      0020B7 8F 83            [24]  690 	mov	dph,r7
                           00001E   691 	C$LCD_Driver.c$83$1_0$68 ==.
                                    692 ;	LCD_Driver.c:83: }
                           00001E   693 	C$LCD_Driver.c$83$1_0$68 ==.
                           00001E   694 	XG$putchar$0$0 ==.
      0020B9 22               [24]  695 	ret
                                    696 ;------------------------------------------------------------
                                    697 ;Allocation info for local variables in function 'getchar'
                                    698 ;------------------------------------------------------------
                           00001F   699 	G$getchar$0$0 ==.
                           00001F   700 	C$LCD_Driver.c$86$1_0$70 ==.
                                    701 ;	LCD_Driver.c:86: int getchar (void){
                                    702 ;	-----------------------------------------
                                    703 ;	 function getchar
                                    704 ;	-----------------------------------------
      0020BA                        705 _getchar:
                           00001F   706 	C$LCD_Driver.c$87$1_0$70 ==.
                                    707 ;	LCD_Driver.c:87: while (!RI);     // Wait till ready to receive, RI = 1
      0020BA                        708 00101$:
                           00001F   709 	C$LCD_Driver.c$88$1_0$70 ==.
                                    710 ;	LCD_Driver.c:88: RI = 0;          // clear RI flag
                                    711 ;	assignBit
      0020BA 10 98 02         [24]  712 	jbc	_RI,00114$
      0020BD 80 FB            [24]  713 	sjmp	00101$
      0020BF                        714 00114$:
                           000024   715 	C$LCD_Driver.c$89$1_0$70 ==.
                                    716 ;	LCD_Driver.c:89: return SBUF;     // return character from SBUF
      0020BF AE 99            [24]  717 	mov	r6,_SBUF
      0020C1 7F 00            [12]  718 	mov	r7,#0x00
      0020C3 8E 82            [24]  719 	mov	dpl,r6
      0020C5 8F 83            [24]  720 	mov	dph,r7
                           00002C   721 	C$LCD_Driver.c$90$1_0$70 ==.
                                    722 ;	LCD_Driver.c:90: }
                           00002C   723 	C$LCD_Driver.c$90$1_0$70 ==.
                           00002C   724 	XG$getchar$0$0 ==.
      0020C7 22               [24]  725 	ret
                                    726 ;------------------------------------------------------------
                                    727 ;Allocation info for local variables in function 'putstr'
                                    728 ;------------------------------------------------------------
                                    729 ;s                         Allocated with name '_putstr_s_65536_71'
                                    730 ;i                         Allocated with name '_putstr_i_65536_72'
                                    731 ;------------------------------------------------------------
                           00002D   732 	G$putstr$0$0 ==.
                           00002D   733 	C$LCD_Driver.c$93$1_0$72 ==.
                                    734 ;	LCD_Driver.c:93: int putstr (char *s){
                                    735 ;	-----------------------------------------
                                    736 ;	 function putstr
                                    737 ;	-----------------------------------------
      0020C8                        738 _putstr:
      0020C8 AF F0            [24]  739 	mov	r7,b
      0020CA AE 83            [24]  740 	mov	r6,dph
      0020CC E5 82            [12]  741 	mov	a,dpl
      0020CE 90 04 02         [24]  742 	mov	dptr,#_putstr_s_65536_71
      0020D1 F0               [24]  743 	movx	@dptr,a
      0020D2 EE               [12]  744 	mov	a,r6
      0020D3 A3               [24]  745 	inc	dptr
      0020D4 F0               [24]  746 	movx	@dptr,a
      0020D5 EF               [12]  747 	mov	a,r7
      0020D6 A3               [24]  748 	inc	dptr
      0020D7 F0               [24]  749 	movx	@dptr,a
                           00003D   750 	C$LCD_Driver.c$95$1_0$72 ==.
                                    751 ;	LCD_Driver.c:95: while (*s) {     // output characters until NULL found
      0020D8 90 04 02         [24]  752 	mov	dptr,#_putstr_s_65536_71
      0020DB E0               [24]  753 	movx	a,@dptr
      0020DC FD               [12]  754 	mov	r5,a
      0020DD A3               [24]  755 	inc	dptr
      0020DE E0               [24]  756 	movx	a,@dptr
      0020DF FE               [12]  757 	mov	r6,a
      0020E0 A3               [24]  758 	inc	dptr
      0020E1 E0               [24]  759 	movx	a,@dptr
      0020E2 FF               [12]  760 	mov	r7,a
      0020E3 7B 00            [12]  761 	mov	r3,#0x00
      0020E5 7C 00            [12]  762 	mov	r4,#0x00
      0020E7                        763 00101$:
      0020E7 8D 82            [24]  764 	mov	dpl,r5
      0020E9 8E 83            [24]  765 	mov	dph,r6
      0020EB 8F F0            [24]  766 	mov	b,r7
      0020ED 12 40 D4         [24]  767 	lcall	__gptrget
      0020F0 FA               [12]  768 	mov	r2,a
      0020F1 60 36            [24]  769 	jz	00108$
                           000058   770 	C$LCD_Driver.c$96$2_0$73 ==.
                                    771 ;	LCD_Driver.c:96: putchar(*s++);
      0020F3 0D               [12]  772 	inc	r5
      0020F4 BD 00 01         [24]  773 	cjne	r5,#0x00,00116$
      0020F7 0E               [12]  774 	inc	r6
      0020F8                        775 00116$:
      0020F8 90 04 02         [24]  776 	mov	dptr,#_putstr_s_65536_71
      0020FB ED               [12]  777 	mov	a,r5
      0020FC F0               [24]  778 	movx	@dptr,a
      0020FD EE               [12]  779 	mov	a,r6
      0020FE A3               [24]  780 	inc	dptr
      0020FF F0               [24]  781 	movx	@dptr,a
      002100 EF               [12]  782 	mov	a,r7
      002101 A3               [24]  783 	inc	dptr
      002102 F0               [24]  784 	movx	@dptr,a
      002103 8A 01            [24]  785 	mov	ar1,r2
      002105 7A 00            [12]  786 	mov	r2,#0x00
      002107 89 82            [24]  787 	mov	dpl,r1
      002109 8A 83            [24]  788 	mov	dph,r2
      00210B C0 07            [24]  789 	push	ar7
      00210D C0 06            [24]  790 	push	ar6
      00210F C0 05            [24]  791 	push	ar5
      002111 C0 04            [24]  792 	push	ar4
      002113 C0 03            [24]  793 	push	ar3
      002115 12 20 9B         [24]  794 	lcall	_putchar
      002118 D0 03            [24]  795 	pop	ar3
      00211A D0 04            [24]  796 	pop	ar4
      00211C D0 05            [24]  797 	pop	ar5
      00211E D0 06            [24]  798 	pop	ar6
      002120 D0 07            [24]  799 	pop	ar7
                           000087   800 	C$LCD_Driver.c$97$2_0$73 ==.
                                    801 ;	LCD_Driver.c:97: i++;
      002122 0B               [12]  802 	inc	r3
      002123 BB 00 C1         [24]  803 	cjne	r3,#0x00,00101$
      002126 0C               [12]  804 	inc	r4
      002127 80 BE            [24]  805 	sjmp	00101$
      002129                        806 00108$:
      002129 90 04 02         [24]  807 	mov	dptr,#_putstr_s_65536_71
      00212C ED               [12]  808 	mov	a,r5
      00212D F0               [24]  809 	movx	@dptr,a
      00212E EE               [12]  810 	mov	a,r6
      00212F A3               [24]  811 	inc	dptr
      002130 F0               [24]  812 	movx	@dptr,a
      002131 EF               [12]  813 	mov	a,r7
      002132 A3               [24]  814 	inc	dptr
      002133 F0               [24]  815 	movx	@dptr,a
                           000099   816 	C$LCD_Driver.c$99$1_0$72 ==.
                                    817 ;	LCD_Driver.c:99: return i+1;
      002134 0B               [12]  818 	inc	r3
      002135 BB 00 01         [24]  819 	cjne	r3,#0x00,00118$
      002138 0C               [12]  820 	inc	r4
      002139                        821 00118$:
      002139 8B 82            [24]  822 	mov	dpl,r3
      00213B 8C 83            [24]  823 	mov	dph,r4
                           0000A2   824 	C$LCD_Driver.c$100$1_0$72 ==.
                                    825 ;	LCD_Driver.c:100: }
                           0000A2   826 	C$LCD_Driver.c$100$1_0$72 ==.
                           0000A2   827 	XG$putstr$0$0 ==.
      00213D 22               [24]  828 	ret
                                    829 ;------------------------------------------------------------
                                    830 ;Allocation info for local variables in function 'lcdbusywait'
                                    831 ;------------------------------------------------------------
                                    832 ;status                    Allocated with name '_lcdbusywait_status_65536_75'
                                    833 ;timeout                   Allocated with name '_lcdbusywait_timeout_65536_75'
                                    834 ;------------------------------------------------------------
                           0000A3   835 	G$lcdbusywait$0$0 ==.
                           0000A3   836 	C$LCD_Driver.c$103$1_0$75 ==.
                                    837 ;	LCD_Driver.c:103: void lcdbusywait(void)
                                    838 ;	-----------------------------------------
                                    839 ;	 function lcdbusywait
                                    840 ;	-----------------------------------------
      00213E                        841 _lcdbusywait:
                           0000A3   842 	C$LCD_Driver.c$108$1_0$75 ==.
                                    843 ;	LCD_Driver.c:108: do {
      00213E 7E 50            [12]  844 	mov	r6,#0x50
      002140 7F C3            [12]  845 	mov	r7,#0xc3
      002142                        846 00103$:
                           0000A7   847 	C$LCD_Driver.c$109$2_0$76 ==.
                                    848 ;	LCD_Driver.c:109: status = *lcd_status_ptr;  // Read status register (RS=0, RW=1)
      002142 90 05 4A         [24]  849 	mov	dptr,#_lcd_status_ptr
      002145 E0               [24]  850 	movx	a,@dptr
      002146 FC               [12]  851 	mov	r4,a
      002147 A3               [24]  852 	inc	dptr
      002148 E0               [24]  853 	movx	a,@dptr
      002149 FD               [12]  854 	mov	r5,a
      00214A 8C 82            [24]  855 	mov	dpl,r4
      00214C 8D 83            [24]  856 	mov	dph,r5
      00214E E0               [24]  857 	movx	a,@dptr
      00214F FD               [12]  858 	mov	r5,a
                           0000B5   859 	C$LCD_Driver.c$110$2_0$76 ==.
                                    860 ;	LCD_Driver.c:110: timeout--;
      002150 1E               [12]  861 	dec	r6
      002151 BE FF 01         [24]  862 	cjne	r6,#0xff,00117$
      002154 1F               [12]  863 	dec	r7
      002155                        864 00117$:
                           0000BA   865 	C$LCD_Driver.c$113$2_0$76 ==.
                                    866 ;	LCD_Driver.c:113: if(timeout == 0) break;
      002155 EE               [12]  867 	mov	a,r6
      002156 4F               [12]  868 	orl	a,r7
      002157 60 04            [24]  869 	jz	00106$
                           0000BE   870 	C$LCD_Driver.c$115$1_0$75 ==.
                                    871 ;	LCD_Driver.c:115: } while(status & 0x80);  // Wait while busy flag (bit 7) is set
      002159 ED               [12]  872 	mov	a,r5
      00215A 20 E7 E5         [24]  873 	jb	acc.7,00103$
      00215D                        874 00106$:
                           0000C2   875 	C$LCD_Driver.c$116$1_0$75 ==.
                                    876 ;	LCD_Driver.c:116: }
                           0000C2   877 	C$LCD_Driver.c$116$1_0$75 ==.
                           0000C2   878 	XG$lcdbusywait$0$0 ==.
      00215D 22               [24]  879 	ret
                                    880 ;------------------------------------------------------------
                                    881 ;Allocation info for local variables in function 'lcd_cmd'
                                    882 ;------------------------------------------------------------
                                    883 ;cmd                       Allocated with name '_lcd_cmd_cmd_65536_77'
                                    884 ;------------------------------------------------------------
                           0000C3   885 	G$lcd_cmd$0$0 ==.
                           0000C3   886 	C$LCD_Driver.c$119$1_0$78 ==.
                                    887 ;	LCD_Driver.c:119: void lcd_cmd(uint8_t cmd)
                                    888 ;	-----------------------------------------
                                    889 ;	 function lcd_cmd
                                    890 ;	-----------------------------------------
      00215E                        891 _lcd_cmd:
      00215E E5 82            [12]  892 	mov	a,dpl
      002160 90 04 05         [24]  893 	mov	dptr,#_lcd_cmd_cmd_65536_77
      002163 F0               [24]  894 	movx	@dptr,a
                           0000C9   895 	C$LCD_Driver.c$121$1_0$78 ==.
                                    896 ;	LCD_Driver.c:121: lcdbusywait();    // wait for LCD to be ready
      002164 12 21 3E         [24]  897 	lcall	_lcdbusywait
                           0000CC   898 	C$LCD_Driver.c$122$1_0$78 ==.
                                    899 ;	LCD_Driver.c:122: *lcd_cmd_ptr = cmd;  // Send command
      002167 90 05 46         [24]  900 	mov	dptr,#_lcd_cmd_ptr
      00216A E0               [24]  901 	movx	a,@dptr
      00216B FE               [12]  902 	mov	r6,a
      00216C A3               [24]  903 	inc	dptr
      00216D E0               [24]  904 	movx	a,@dptr
      00216E FF               [12]  905 	mov	r7,a
      00216F 90 04 05         [24]  906 	mov	dptr,#_lcd_cmd_cmd_65536_77
      002172 E0               [24]  907 	movx	a,@dptr
      002173 8E 82            [24]  908 	mov	dpl,r6
      002175 8F 83            [24]  909 	mov	dph,r7
      002177 F0               [24]  910 	movx	@dptr,a
                           0000DD   911 	C$LCD_Driver.c$123$1_0$78 ==.
                                    912 ;	LCD_Driver.c:123: }
                           0000DD   913 	C$LCD_Driver.c$123$1_0$78 ==.
                           0000DD   914 	XG$lcd_cmd$0$0 ==.
      002178 22               [24]  915 	ret
                                    916 ;------------------------------------------------------------
                                    917 ;Allocation info for local variables in function 'lcdputch'
                                    918 ;------------------------------------------------------------
                                    919 ;cc                        Allocated with name '_lcdputch_cc_65536_79'
                                    920 ;------------------------------------------------------------
                           0000DE   921 	G$lcdputch$0$0 ==.
                           0000DE   922 	C$LCD_Driver.c$126$1_0$80 ==.
                                    923 ;	LCD_Driver.c:126: void lcdputch(char cc)
                                    924 ;	-----------------------------------------
                                    925 ;	 function lcdputch
                                    926 ;	-----------------------------------------
      002179                        927 _lcdputch:
      002179 E5 82            [12]  928 	mov	a,dpl
      00217B 90 04 06         [24]  929 	mov	dptr,#_lcdputch_cc_65536_79
      00217E F0               [24]  930 	movx	@dptr,a
                           0000E4   931 	C$LCD_Driver.c$128$1_0$80 ==.
                                    932 ;	LCD_Driver.c:128: lcdbusywait();     // Wait for LCD to be ready
      00217F 12 21 3E         [24]  933 	lcall	_lcdbusywait
                           0000E7   934 	C$LCD_Driver.c$129$1_0$80 ==.
                                    935 ;	LCD_Driver.c:129: *lcdputch_ptr = cc; // Send data
      002182 90 05 48         [24]  936 	mov	dptr,#_lcdputch_ptr
      002185 E0               [24]  937 	movx	a,@dptr
      002186 FE               [12]  938 	mov	r6,a
      002187 A3               [24]  939 	inc	dptr
      002188 E0               [24]  940 	movx	a,@dptr
      002189 FF               [12]  941 	mov	r7,a
      00218A 90 04 06         [24]  942 	mov	dptr,#_lcdputch_cc_65536_79
      00218D E0               [24]  943 	movx	a,@dptr
      00218E 8E 82            [24]  944 	mov	dpl,r6
      002190 8F 83            [24]  945 	mov	dph,r7
      002192 F0               [24]  946 	movx	@dptr,a
                           0000F8   947 	C$LCD_Driver.c$132$1_0$80 ==.
                                    948 ;	LCD_Driver.c:132: current_col++;
      002193 90 05 45         [24]  949 	mov	dptr,#_current_col
      002196 E0               [24]  950 	movx	a,@dptr
      002197 04               [12]  951 	inc	a
      002198 F0               [24]  952 	movx	@dptr,a
                           0000FE   953 	C$LCD_Driver.c$133$1_0$80 ==.
                                    954 ;	LCD_Driver.c:133: if(current_col >= MAX_COLS) {
      002199 E0               [24]  955 	movx	a,@dptr
      00219A FF               [12]  956 	mov	r7,a
      00219B BF 10 00         [24]  957 	cjne	r7,#0x10,00115$
      00219E                        958 00115$:
      00219E 40 17            [24]  959 	jc	00105$
                           000105   960 	C$LCD_Driver.c$134$2_0$81 ==.
                                    961 ;	LCD_Driver.c:134: current_col = 0;
      0021A0 90 05 45         [24]  962 	mov	dptr,#_current_col
      0021A3 E4               [12]  963 	clr	a
      0021A4 F0               [24]  964 	movx	@dptr,a
                           00010A   965 	C$LCD_Driver.c$135$2_0$81 ==.
                                    966 ;	LCD_Driver.c:135: current_row++;
      0021A5 90 05 44         [24]  967 	mov	dptr,#_current_row
      0021A8 E0               [24]  968 	movx	a,@dptr
      0021A9 04               [12]  969 	inc	a
      0021AA F0               [24]  970 	movx	@dptr,a
                           000110   971 	C$LCD_Driver.c$136$2_0$81 ==.
                                    972 ;	LCD_Driver.c:136: if(current_row >= MAX_ROWS) current_row = 0;
      0021AB E0               [24]  973 	movx	a,@dptr
      0021AC FF               [12]  974 	mov	r7,a
      0021AD BF 04 00         [24]  975 	cjne	r7,#0x04,00117$
      0021B0                        976 00117$:
      0021B0 40 05            [24]  977 	jc	00105$
      0021B2 90 05 44         [24]  978 	mov	dptr,#_current_row
      0021B5 E4               [12]  979 	clr	a
      0021B6 F0               [24]  980 	movx	@dptr,a
      0021B7                        981 00105$:
                           00011C   982 	C$LCD_Driver.c$138$1_0$80 ==.
                                    983 ;	LCD_Driver.c:138: }
                           00011C   984 	C$LCD_Driver.c$138$1_0$80 ==.
                           00011C   985 	XG$lcdputch$0$0 ==.
      0021B7 22               [24]  986 	ret
                                    987 ;------------------------------------------------------------
                                    988 ;Allocation info for local variables in function 'lcd_read_address'
                                    989 ;------------------------------------------------------------
                                    990 ;addr                      Allocated with name '_lcd_read_address_addr_65536_83'
                                    991 ;------------------------------------------------------------
                           00011D   992 	G$lcd_read_address$0$0 ==.
                           00011D   993 	C$LCD_Driver.c$140$1_0$83 ==.
                                    994 ;	LCD_Driver.c:140: uint8_t lcd_read_address(void)
                                    995 ;	-----------------------------------------
                                    996 ;	 function lcd_read_address
                                    997 ;	-----------------------------------------
      0021B8                        998 _lcd_read_address:
                           00011D   999 	C$LCD_Driver.c$143$1_0$83 ==.
                                   1000 ;	LCD_Driver.c:143: lcdbusywait();               // Wait for LCD to be ready
      0021B8 12 21 3E         [24] 1001 	lcall	_lcdbusywait
                           000120  1002 	C$LCD_Driver.c$144$1_0$83 ==.
                                   1003 ;	LCD_Driver.c:144: addr = *lcd_status_ptr & 0x7F; // Read address (mask out busy flag)
      0021BB 90 05 4A         [24] 1004 	mov	dptr,#_lcd_status_ptr
      0021BE E0               [24] 1005 	movx	a,@dptr
      0021BF FE               [12] 1006 	mov	r6,a
      0021C0 A3               [24] 1007 	inc	dptr
      0021C1 E0               [24] 1008 	movx	a,@dptr
      0021C2 FF               [12] 1009 	mov	r7,a
      0021C3 8E 82            [24] 1010 	mov	dpl,r6
      0021C5 8F 83            [24] 1011 	mov	dph,r7
      0021C7 E0               [24] 1012 	movx	a,@dptr
      0021C8 FE               [12] 1013 	mov	r6,a
      0021C9 53 06 7F         [24] 1014 	anl	ar6,#0x7f
                           000131  1015 	C$LCD_Driver.c$145$1_0$83 ==.
                                   1016 ;	LCD_Driver.c:145: return addr;
      0021CC 8E 82            [24] 1017 	mov	dpl,r6
                           000133  1018 	C$LCD_Driver.c$146$1_0$83 ==.
                                   1019 ;	LCD_Driver.c:146: }
                           000133  1020 	C$LCD_Driver.c$146$1_0$83 ==.
                           000133  1021 	XG$lcd_read_address$0$0 ==.
      0021CE 22               [24] 1022 	ret
                                   1023 ;------------------------------------------------------------
                                   1024 ;Allocation info for local variables in function 'lcdgotoaddr'
                                   1025 ;------------------------------------------------------------
                                   1026 ;address                   Allocated with name '_lcdgotoaddr_address_65536_84'
                                   1027 ;------------------------------------------------------------
                           000134  1028 	G$lcdgotoaddr$0$0 ==.
                           000134  1029 	C$LCD_Driver.c$148$1_0$85 ==.
                                   1030 ;	LCD_Driver.c:148: void lcdgotoaddr(unsigned char address)
                                   1031 ;	-----------------------------------------
                                   1032 ;	 function lcdgotoaddr
                                   1033 ;	-----------------------------------------
      0021CF                       1034 _lcdgotoaddr:
      0021CF E5 82            [12] 1035 	mov	a,dpl
      0021D1 90 04 07         [24] 1036 	mov	dptr,#_lcdgotoaddr_address_65536_84
      0021D4 F0               [24] 1037 	movx	@dptr,a
                           00013A  1038 	C$LCD_Driver.c$150$1_0$85 ==.
                                   1039 ;	LCD_Driver.c:150: lcd_cmd(0x80 | address);    // Set DDRAM address command
      0021D5 E0               [24] 1040 	movx	a,@dptr
      0021D6 44 80            [12] 1041 	orl	a,#0x80
      0021D8 F5 82            [12] 1042 	mov	dpl,a
      0021DA 12 21 5E         [24] 1043 	lcall	_lcd_cmd
                           000142  1044 	C$LCD_Driver.c$151$1_0$85 ==.
                                   1045 ;	LCD_Driver.c:151: lcdbusywait(); // this cmd takes longer
      0021DD 12 21 3E         [24] 1046 	lcall	_lcdbusywait
                           000145  1047 	C$LCD_Driver.c$152$1_0$85 ==.
                                   1048 ;	LCD_Driver.c:152: }
                           000145  1049 	C$LCD_Driver.c$152$1_0$85 ==.
                           000145  1050 	XG$lcdgotoaddr$0$0 ==.
      0021E0 22               [24] 1051 	ret
                                   1052 ;------------------------------------------------------------
                                   1053 ;Allocation info for local variables in function 'lcdgotoxy'
                                   1054 ;------------------------------------------------------------
                                   1055 ;col                       Allocated with name '_lcdgotoxy_PARM_2'
                                   1056 ;row                       Allocated with name '_lcdgotoxy_row_65536_86'
                                   1057 ;address                   Allocated with name '_lcdgotoxy_address_65536_87'
                                   1058 ;------------------------------------------------------------
                           000146  1059 	G$lcdgotoxy$0$0 ==.
                           000146  1060 	C$LCD_Driver.c$155$1_0$87 ==.
                                   1061 ;	LCD_Driver.c:155: void lcdgotoxy(unsigned char row, unsigned char col)
                                   1062 ;	-----------------------------------------
                                   1063 ;	 function lcdgotoxy
                                   1064 ;	-----------------------------------------
      0021E1                       1065 _lcdgotoxy:
      0021E1 E5 82            [12] 1066 	mov	a,dpl
      0021E3 90 04 09         [24] 1067 	mov	dptr,#_lcdgotoxy_row_65536_86
      0021E6 F0               [24] 1068 	movx	@dptr,a
                           00014C  1069 	C$LCD_Driver.c$158$1_0$87 ==.
                                   1070 ;	LCD_Driver.c:158: current_row = row;
      0021E7 E0               [24] 1071 	movx	a,@dptr
      0021E8 FF               [12] 1072 	mov	r7,a
      0021E9 90 05 44         [24] 1073 	mov	dptr,#_current_row
      0021EC F0               [24] 1074 	movx	@dptr,a
                           000152  1075 	C$LCD_Driver.c$159$1_0$87 ==.
                                   1076 ;	LCD_Driver.c:159: current_col = col;
      0021ED 90 04 08         [24] 1077 	mov	dptr,#_lcdgotoxy_PARM_2
      0021F0 E0               [24] 1078 	movx	a,@dptr
      0021F1 FE               [12] 1079 	mov	r6,a
      0021F2 90 05 45         [24] 1080 	mov	dptr,#_current_col
      0021F5 F0               [24] 1081 	movx	@dptr,a
                           00015B  1082 	C$LCD_Driver.c$162$1_0$87 ==.
                                   1083 ;	LCD_Driver.c:162: if(row > (MAX_ROWS-1)) row = (MAX_ROWS-1);
      0021F6 EF               [12] 1084 	mov	a,r7
      0021F7 24 FC            [12] 1085 	add	a,#0xff - 0x03
      0021F9 50 06            [24] 1086 	jnc	00102$
      0021FB 90 04 09         [24] 1087 	mov	dptr,#_lcdgotoxy_row_65536_86
      0021FE 74 03            [12] 1088 	mov	a,#0x03
      002200 F0               [24] 1089 	movx	@dptr,a
      002201                       1090 00102$:
                           000166  1091 	C$LCD_Driver.c$163$1_0$87 ==.
                                   1092 ;	LCD_Driver.c:163: if(col > (MAX_COLS-1)) col = (MAX_COLS-1);
      002201 EE               [12] 1093 	mov	a,r6
      002202 24 F0            [12] 1094 	add	a,#0xff - 0x0f
      002204 50 06            [24] 1095 	jnc	00104$
      002206 90 04 08         [24] 1096 	mov	dptr,#_lcdgotoxy_PARM_2
      002209 74 0F            [12] 1097 	mov	a,#0x0f
      00220B F0               [24] 1098 	movx	@dptr,a
      00220C                       1099 00104$:
                           000171  1100 	C$LCD_Driver.c$165$1_0$87 ==.
                                   1101 ;	LCD_Driver.c:165: address = row_addresses[row] + col;
      00220C 90 04 09         [24] 1102 	mov	dptr,#_lcdgotoxy_row_65536_86
      00220F E0               [24] 1103 	movx	a,@dptr
      002210 90 40 F4         [24] 1104 	mov	dptr,#_row_addresses
      002213 93               [24] 1105 	movc	a,@a+dptr
      002214 FF               [12] 1106 	mov	r7,a
      002215 90 04 08         [24] 1107 	mov	dptr,#_lcdgotoxy_PARM_2
      002218 E0               [24] 1108 	movx	a,@dptr
      002219 2F               [12] 1109 	add	a,r7
                           00017F  1110 	C$LCD_Driver.c$166$1_0$87 ==.
                                   1111 ;	LCD_Driver.c:166: lcdgotoaddr(address);
      00221A F5 82            [12] 1112 	mov	dpl,a
      00221C 12 21 CF         [24] 1113 	lcall	_lcdgotoaddr
                           000184  1114 	C$LCD_Driver.c$167$1_0$87 ==.
                                   1115 ;	LCD_Driver.c:167: }
                           000184  1116 	C$LCD_Driver.c$167$1_0$87 ==.
                           000184  1117 	XG$lcdgotoxy$0$0 ==.
      00221F 22               [24] 1118 	ret
                                   1119 ;------------------------------------------------------------
                                   1120 ;Allocation info for local variables in function 'lcdputstr'
                                   1121 ;------------------------------------------------------------
                                   1122 ;ss                        Allocated with name '_lcdputstr_ss_65536_88'
                                   1123 ;current_row_local         Allocated with name '_lcdputstr_current_row_local_65536_89'
                                   1124 ;current_col_local         Allocated with name '_lcdputstr_current_col_local_65536_89'
                                   1125 ;ddram_addr                Allocated with name '_lcdputstr_ddram_addr_65536_89'
                                   1126 ;i                         Allocated with name '_lcdputstr_i_131072_90'
                                   1127 ;------------------------------------------------------------
                           000185  1128 	G$lcdputstr$0$0 ==.
                           000185  1129 	C$LCD_Driver.c$170$1_0$89 ==.
                                   1130 ;	LCD_Driver.c:170: void lcdputstr(char *ss)
                                   1131 ;	-----------------------------------------
                                   1132 ;	 function lcdputstr
                                   1133 ;	-----------------------------------------
      002220                       1134 _lcdputstr:
      002220 AF F0            [24] 1135 	mov	r7,b
      002222 AE 83            [24] 1136 	mov	r6,dph
      002224 E5 82            [12] 1137 	mov	a,dpl
      002226 90 04 0A         [24] 1138 	mov	dptr,#_lcdputstr_ss_65536_88
      002229 F0               [24] 1139 	movx	@dptr,a
      00222A EE               [12] 1140 	mov	a,r6
      00222B A3               [24] 1141 	inc	dptr
      00222C F0               [24] 1142 	movx	@dptr,a
      00222D EF               [12] 1143 	mov	a,r7
      00222E A3               [24] 1144 	inc	dptr
      00222F F0               [24] 1145 	movx	@dptr,a
                           000195  1146 	C$LCD_Driver.c$172$2_0$89 ==.
                                   1147 ;	LCD_Driver.c:172: uint8_t current_row_local = 0;
      002230 90 04 0D         [24] 1148 	mov	dptr,#_lcdputstr_current_row_local_65536_89
      002233 E4               [12] 1149 	clr	a
      002234 F0               [24] 1150 	movx	@dptr,a
                           00019A  1151 	C$LCD_Driver.c$173$2_0$89 ==.
                                   1152 ;	LCD_Driver.c:173: uint8_t current_col_local = 0;
      002235 90 04 0E         [24] 1153 	mov	dptr,#_lcdputstr_current_col_local_65536_89
      002238 F0               [24] 1154 	movx	@dptr,a
                           00019E  1155 	C$LCD_Driver.c$176$1_0$89 ==.
                                   1156 ;	LCD_Driver.c:176: uint8_t ddram_addr = lcd_read_address();
      002239 12 21 B8         [24] 1157 	lcall	_lcd_read_address
      00223C AF 82            [24] 1158 	mov	r7,dpl
                           0001A3  1159 	C$LCD_Driver.c$179$1_0$89 ==.
                                   1160 ;	LCD_Driver.c:179: for(uint8_t i = 0; i < MAX_ROWS; i++) {
      00223E 7E 00            [12] 1161 	mov	r6,#0x00
      002240                       1162 00113$:
      002240 BE 04 00         [24] 1163 	cjne	r6,#0x04,00150$
      002243                       1164 00150$:
      002243 50 3A            [24] 1165 	jnc	00124$
                           0001AA  1166 	C$LCD_Driver.c$180$3_0$91 ==.
                                   1167 ;	LCD_Driver.c:180: if(ddram_addr >= row_addresses[i] &&
      002245 EE               [12] 1168 	mov	a,r6
      002246 90 40 F4         [24] 1169 	mov	dptr,#_row_addresses
      002249 93               [24] 1170 	movc	a,@a+dptr
      00224A FD               [12] 1171 	mov	r5,a
      00224B C3               [12] 1172 	clr	c
      00224C EF               [12] 1173 	mov	a,r7
      00224D 9D               [12] 1174 	subb	a,r5
      00224E 40 2C            [24] 1175 	jc	00114$
                           0001B5  1176 	C$LCD_Driver.c$181$3_0$91 ==.
                                   1177 ;	LCD_Driver.c:181: ddram_addr < (row_addresses[i] + MAX_COLS)) {
      002250 8D 03            [24] 1178 	mov	ar3,r5
      002252 7C 00            [12] 1179 	mov	r4,#0x00
      002254 74 10            [12] 1180 	mov	a,#0x10
      002256 2B               [12] 1181 	add	a,r3
      002257 FB               [12] 1182 	mov	r3,a
      002258 E4               [12] 1183 	clr	a
      002259 3C               [12] 1184 	addc	a,r4
      00225A FC               [12] 1185 	mov	r4,a
      00225B 8F 01            [24] 1186 	mov	ar1,r7
      00225D 7A 00            [12] 1187 	mov	r2,#0x00
      00225F C3               [12] 1188 	clr	c
      002260 E9               [12] 1189 	mov	a,r1
      002261 9B               [12] 1190 	subb	a,r3
      002262 EA               [12] 1191 	mov	a,r2
      002263 64 80            [12] 1192 	xrl	a,#0x80
      002265 8C F0            [24] 1193 	mov	b,r4
      002267 63 F0 80         [24] 1194 	xrl	b,#0x80
      00226A 95 F0            [12] 1195 	subb	a,b
      00226C 50 0E            [24] 1196 	jnc	00114$
                           0001D3  1197 	C$LCD_Driver.c$182$4_0$92 ==.
                                   1198 ;	LCD_Driver.c:182: current_row_local = i;
      00226E 90 04 0D         [24] 1199 	mov	dptr,#_lcdputstr_current_row_local_65536_89
      002271 EE               [12] 1200 	mov	a,r6
      002272 F0               [24] 1201 	movx	@dptr,a
                           0001D8  1202 	C$LCD_Driver.c$183$4_0$92 ==.
                                   1203 ;	LCD_Driver.c:183: current_col_local = ddram_addr - row_addresses[i];
      002273 90 04 0E         [24] 1204 	mov	dptr,#_lcdputstr_current_col_local_65536_89
      002276 EF               [12] 1205 	mov	a,r7
      002277 C3               [12] 1206 	clr	c
      002278 9D               [12] 1207 	subb	a,r5
      002279 F0               [24] 1208 	movx	@dptr,a
                           0001DF  1209 	C$LCD_Driver.c$184$4_0$92 ==.
                                   1210 ;	LCD_Driver.c:184: break;
      00227A 80 03            [24] 1211 	sjmp	00124$
      00227C                       1212 00114$:
                           0001E1  1213 	C$LCD_Driver.c$179$2_0$90 ==.
                                   1214 ;	LCD_Driver.c:179: for(uint8_t i = 0; i < MAX_ROWS; i++) {
      00227C 0E               [12] 1215 	inc	r6
                           0001E2  1216 	C$LCD_Driver.c$188$1_0$89 ==.
                                   1217 ;	LCD_Driver.c:188: while(*ss) {
      00227D 80 C1            [24] 1218 	sjmp	00113$
      00227F                       1219 00124$:
      00227F 90 04 0A         [24] 1220 	mov	dptr,#_lcdputstr_ss_65536_88
      002282 E0               [24] 1221 	movx	a,@dptr
      002283 FD               [12] 1222 	mov	r5,a
      002284 A3               [24] 1223 	inc	dptr
      002285 E0               [24] 1224 	movx	a,@dptr
      002286 FE               [12] 1225 	mov	r6,a
      002287 A3               [24] 1226 	inc	dptr
      002288 E0               [24] 1227 	movx	a,@dptr
      002289 FF               [12] 1228 	mov	r7,a
      00228A                       1229 00109$:
      00228A 8D 82            [24] 1230 	mov	dpl,r5
      00228C 8E 83            [24] 1231 	mov	dph,r6
      00228E 8F F0            [24] 1232 	mov	b,r7
      002290 12 40 D4         [24] 1233 	lcall	__gptrget
      002293 60 72            [24] 1234 	jz	00125$
                           0001FA  1235 	C$LCD_Driver.c$190$2_0$93 ==.
                                   1236 ;	LCD_Driver.c:190: if(current_col_local >= MAX_COLS) {
      002295 90 04 0E         [24] 1237 	mov	dptr,#_lcdputstr_current_col_local_65536_89
      002298 E0               [24] 1238 	movx	a,@dptr
      002299 FC               [12] 1239 	mov	r4,a
      00229A BC 10 00         [24] 1240 	cjne	r4,#0x10,00155$
      00229D                       1241 00155$:
      00229D 40 33            [24] 1242 	jc	00108$
                           000204  1243 	C$LCD_Driver.c$191$3_0$94 ==.
                                   1244 ;	LCD_Driver.c:191: current_col_local = 0;
      00229F 90 04 0E         [24] 1245 	mov	dptr,#_lcdputstr_current_col_local_65536_89
      0022A2 E4               [12] 1246 	clr	a
      0022A3 F0               [24] 1247 	movx	@dptr,a
                           000209  1248 	C$LCD_Driver.c$192$3_0$94 ==.
                                   1249 ;	LCD_Driver.c:192: current_row_local++;
      0022A4 90 04 0D         [24] 1250 	mov	dptr,#_lcdputstr_current_row_local_65536_89
      0022A7 E0               [24] 1251 	movx	a,@dptr
      0022A8 24 01            [12] 1252 	add	a,#0x01
      0022AA F0               [24] 1253 	movx	@dptr,a
                           000210  1254 	C$LCD_Driver.c$195$3_0$94 ==.
                                   1255 ;	LCD_Driver.c:195: if(current_row_local >= MAX_ROWS) {
      0022AB E0               [24] 1256 	movx	a,@dptr
      0022AC FC               [12] 1257 	mov	r4,a
      0022AD BC 04 00         [24] 1258 	cjne	r4,#0x04,00157$
      0022B0                       1259 00157$:
      0022B0 40 05            [24] 1260 	jc	00106$
                           000217  1261 	C$LCD_Driver.c$196$4_0$95 ==.
                                   1262 ;	LCD_Driver.c:196: current_row_local = 0;
      0022B2 90 04 0D         [24] 1263 	mov	dptr,#_lcdputstr_current_row_local_65536_89
      0022B5 E4               [12] 1264 	clr	a
      0022B6 F0               [24] 1265 	movx	@dptr,a
      0022B7                       1266 00106$:
                           00021C  1267 	C$LCD_Driver.c$200$3_0$94 ==.
                                   1268 ;	LCD_Driver.c:200: lcdgotoxy(current_row_local, current_col_local);
      0022B7 90 04 0D         [24] 1269 	mov	dptr,#_lcdputstr_current_row_local_65536_89
      0022BA E0               [24] 1270 	movx	a,@dptr
      0022BB FC               [12] 1271 	mov	r4,a
      0022BC 90 04 08         [24] 1272 	mov	dptr,#_lcdgotoxy_PARM_2
      0022BF E4               [12] 1273 	clr	a
      0022C0 F0               [24] 1274 	movx	@dptr,a
      0022C1 8C 82            [24] 1275 	mov	dpl,r4
      0022C3 C0 07            [24] 1276 	push	ar7
      0022C5 C0 06            [24] 1277 	push	ar6
      0022C7 C0 05            [24] 1278 	push	ar5
      0022C9 12 21 E1         [24] 1279 	lcall	_lcdgotoxy
      0022CC D0 05            [24] 1280 	pop	ar5
      0022CE D0 06            [24] 1281 	pop	ar6
      0022D0 D0 07            [24] 1282 	pop	ar7
      0022D2                       1283 00108$:
                           000237  1284 	C$LCD_Driver.c$204$2_0$93 ==.
                                   1285 ;	LCD_Driver.c:204: lcdputch(*ss++);
      0022D2 8D 82            [24] 1286 	mov	dpl,r5
      0022D4 8E 83            [24] 1287 	mov	dph,r6
      0022D6 8F F0            [24] 1288 	mov	b,r7
      0022D8 12 40 D4         [24] 1289 	lcall	__gptrget
      0022DB FC               [12] 1290 	mov	r4,a
      0022DC A3               [24] 1291 	inc	dptr
      0022DD AD 82            [24] 1292 	mov	r5,dpl
      0022DF AE 83            [24] 1293 	mov	r6,dph
      0022E1 90 04 0A         [24] 1294 	mov	dptr,#_lcdputstr_ss_65536_88
      0022E4 ED               [12] 1295 	mov	a,r5
      0022E5 F0               [24] 1296 	movx	@dptr,a
      0022E6 EE               [12] 1297 	mov	a,r6
      0022E7 A3               [24] 1298 	inc	dptr
      0022E8 F0               [24] 1299 	movx	@dptr,a
      0022E9 EF               [12] 1300 	mov	a,r7
      0022EA A3               [24] 1301 	inc	dptr
      0022EB F0               [24] 1302 	movx	@dptr,a
      0022EC 8C 82            [24] 1303 	mov	dpl,r4
      0022EE C0 07            [24] 1304 	push	ar7
      0022F0 C0 06            [24] 1305 	push	ar6
      0022F2 C0 05            [24] 1306 	push	ar5
      0022F4 12 21 79         [24] 1307 	lcall	_lcdputch
      0022F7 D0 05            [24] 1308 	pop	ar5
      0022F9 D0 06            [24] 1309 	pop	ar6
      0022FB D0 07            [24] 1310 	pop	ar7
                           000262  1311 	C$LCD_Driver.c$205$2_0$93 ==.
                                   1312 ;	LCD_Driver.c:205: current_col_local++;
      0022FD 90 04 0E         [24] 1313 	mov	dptr,#_lcdputstr_current_col_local_65536_89
      002300 E0               [24] 1314 	movx	a,@dptr
      002301 24 01            [12] 1315 	add	a,#0x01
      002303 F0               [24] 1316 	movx	@dptr,a
      002304 02 22 8A         [24] 1317 	ljmp	00109$
      002307                       1318 00125$:
      002307 90 04 0A         [24] 1319 	mov	dptr,#_lcdputstr_ss_65536_88
      00230A ED               [12] 1320 	mov	a,r5
      00230B F0               [24] 1321 	movx	@dptr,a
      00230C EE               [12] 1322 	mov	a,r6
      00230D A3               [24] 1323 	inc	dptr
      00230E F0               [24] 1324 	movx	@dptr,a
      00230F EF               [12] 1325 	mov	a,r7
      002310 A3               [24] 1326 	inc	dptr
      002311 F0               [24] 1327 	movx	@dptr,a
                           000277  1328 	C$LCD_Driver.c$207$1_0$89 ==.
                                   1329 ;	LCD_Driver.c:207: }
                           000277  1330 	C$LCD_Driver.c$207$1_0$89 ==.
                           000277  1331 	XG$lcdputstr$0$0 ==.
      002312 22               [24] 1332 	ret
                                   1333 ;------------------------------------------------------------
                                   1334 ;Allocation info for local variables in function 'lcdputstr_wordwrap'
                                   1335 ;------------------------------------------------------------
                                   1336 ;sloc0                     Allocated with name '_lcdputstr_wordwrap_sloc0_1_0'
                                   1337 ;sloc1                     Allocated with name '_lcdputstr_wordwrap_sloc1_1_0'
                                   1338 ;ss                        Allocated with name '_lcdputstr_wordwrap_ss_65536_96'
                                   1339 ;current_row_local         Allocated with name '_lcdputstr_wordwrap_current_row_local_65536_97'
                                   1340 ;current_col_local         Allocated with name '_lcdputstr_wordwrap_current_col_local_65536_97'
                                   1341 ;ddram_addr                Allocated with name '_lcdputstr_wordwrap_ddram_addr_65536_97'
                                   1342 ;i                         Allocated with name '_lcdputstr_wordwrap_i_131072_98'
                                   1343 ;word_start                Allocated with name '_lcdputstr_wordwrap_word_start_65537_101'
                                   1344 ;word_length               Allocated with name '_lcdputstr_wordwrap_word_length_196609_103'
                                   1345 ;p                         Allocated with name '_lcdputstr_wordwrap_p_262145_106'
                                   1346 ;------------------------------------------------------------
                           000278  1347 	G$lcdputstr_wordwrap$0$0 ==.
                           000278  1348 	C$LCD_Driver.c$209$1_0$97 ==.
                                   1349 ;	LCD_Driver.c:209: void lcdputstr_wordwrap(char *ss)
                                   1350 ;	-----------------------------------------
                                   1351 ;	 function lcdputstr_wordwrap
                                   1352 ;	-----------------------------------------
      002313                       1353 _lcdputstr_wordwrap:
      002313 AF F0            [24] 1354 	mov	r7,b
      002315 AE 83            [24] 1355 	mov	r6,dph
      002317 E5 82            [12] 1356 	mov	a,dpl
      002319 90 04 0F         [24] 1357 	mov	dptr,#_lcdputstr_wordwrap_ss_65536_96
      00231C F0               [24] 1358 	movx	@dptr,a
      00231D EE               [12] 1359 	mov	a,r6
      00231E A3               [24] 1360 	inc	dptr
      00231F F0               [24] 1361 	movx	@dptr,a
      002320 EF               [12] 1362 	mov	a,r7
      002321 A3               [24] 1363 	inc	dptr
      002322 F0               [24] 1364 	movx	@dptr,a
                           000288  1365 	C$LCD_Driver.c$211$2_0$97 ==.
                                   1366 ;	LCD_Driver.c:211: uint8_t current_row_local = 0;
      002323 90 04 12         [24] 1367 	mov	dptr,#_lcdputstr_wordwrap_current_row_local_65536_97
      002326 E4               [12] 1368 	clr	a
      002327 F0               [24] 1369 	movx	@dptr,a
                           00028D  1370 	C$LCD_Driver.c$212$2_0$97 ==.
                                   1371 ;	LCD_Driver.c:212: uint8_t current_col_local = 0;
      002328 90 04 13         [24] 1372 	mov	dptr,#_lcdputstr_wordwrap_current_col_local_65536_97
      00232B F0               [24] 1373 	movx	@dptr,a
                           000291  1374 	C$LCD_Driver.c$215$1_0$97 ==.
                                   1375 ;	LCD_Driver.c:215: uint8_t ddram_addr = lcd_read_address();
      00232C 12 21 B8         [24] 1376 	lcall	_lcd_read_address
      00232F AF 82            [24] 1377 	mov	r7,dpl
                           000296  1378 	C$LCD_Driver.c$218$1_1$97 ==.
                                   1379 ;	LCD_Driver.c:218: for(uint8_t i = 0; i < MAX_ROWS; i++) {
      002331 7E 00            [12] 1380 	mov	r6,#0x00
      002333                       1381 00117$:
      002333 BE 04 00         [24] 1382 	cjne	r6,#0x04,00176$
      002336                       1383 00176$:
      002336 50 3A            [24] 1384 	jnc	00104$
                           00029D  1385 	C$LCD_Driver.c$219$3_0$99 ==.
                                   1386 ;	LCD_Driver.c:219: if(ddram_addr >= row_addresses[i] &&
      002338 EE               [12] 1387 	mov	a,r6
      002339 90 40 F4         [24] 1388 	mov	dptr,#_row_addresses
      00233C 93               [24] 1389 	movc	a,@a+dptr
      00233D FD               [12] 1390 	mov	r5,a
      00233E C3               [12] 1391 	clr	c
      00233F EF               [12] 1392 	mov	a,r7
      002340 9D               [12] 1393 	subb	a,r5
      002341 40 2C            [24] 1394 	jc	00118$
                           0002A8  1395 	C$LCD_Driver.c$220$3_0$99 ==.
                                   1396 ;	LCD_Driver.c:220: ddram_addr < (row_addresses[i] + MAX_COLS)) {
      002343 8D 03            [24] 1397 	mov	ar3,r5
      002345 7C 00            [12] 1398 	mov	r4,#0x00
      002347 74 10            [12] 1399 	mov	a,#0x10
      002349 2B               [12] 1400 	add	a,r3
      00234A FB               [12] 1401 	mov	r3,a
      00234B E4               [12] 1402 	clr	a
      00234C 3C               [12] 1403 	addc	a,r4
      00234D FC               [12] 1404 	mov	r4,a
      00234E 8F 01            [24] 1405 	mov	ar1,r7
      002350 7A 00            [12] 1406 	mov	r2,#0x00
      002352 C3               [12] 1407 	clr	c
      002353 E9               [12] 1408 	mov	a,r1
      002354 9B               [12] 1409 	subb	a,r3
      002355 EA               [12] 1410 	mov	a,r2
      002356 64 80            [12] 1411 	xrl	a,#0x80
      002358 8C F0            [24] 1412 	mov	b,r4
      00235A 63 F0 80         [24] 1413 	xrl	b,#0x80
      00235D 95 F0            [12] 1414 	subb	a,b
      00235F 50 0E            [24] 1415 	jnc	00118$
                           0002C6  1416 	C$LCD_Driver.c$221$4_0$100 ==.
                                   1417 ;	LCD_Driver.c:221: current_row_local = i;
      002361 90 04 12         [24] 1418 	mov	dptr,#_lcdputstr_wordwrap_current_row_local_65536_97
      002364 EE               [12] 1419 	mov	a,r6
      002365 F0               [24] 1420 	movx	@dptr,a
                           0002CB  1421 	C$LCD_Driver.c$222$4_0$100 ==.
                                   1422 ;	LCD_Driver.c:222: current_col_local = ddram_addr - row_addresses[i];
      002366 90 04 13         [24] 1423 	mov	dptr,#_lcdputstr_wordwrap_current_col_local_65536_97
      002369 EF               [12] 1424 	mov	a,r7
      00236A C3               [12] 1425 	clr	c
      00236B 9D               [12] 1426 	subb	a,r5
      00236C F0               [24] 1427 	movx	@dptr,a
                           0002D2  1428 	C$LCD_Driver.c$223$4_0$100 ==.
                                   1429 ;	LCD_Driver.c:223: break;
      00236D 80 03            [24] 1430 	sjmp	00104$
      00236F                       1431 00118$:
                           0002D4  1432 	C$LCD_Driver.c$218$2_0$98 ==.
                                   1433 ;	LCD_Driver.c:218: for(uint8_t i = 0; i < MAX_ROWS; i++) {
      00236F 0E               [12] 1434 	inc	r6
      002370 80 C1            [24] 1435 	sjmp	00117$
      002372                       1436 00104$:
                           0002D7  1437 	C$LCD_Driver.c$227$2_0$101 ==.
                                   1438 ;	LCD_Driver.c:227: char *word_start = ss;
      002372 90 04 0F         [24] 1439 	mov	dptr,#_lcdputstr_wordwrap_ss_65536_96
      002375 E0               [24] 1440 	movx	a,@dptr
      002376 FD               [12] 1441 	mov	r5,a
      002377 A3               [24] 1442 	inc	dptr
      002378 E0               [24] 1443 	movx	a,@dptr
      002379 FE               [12] 1444 	mov	r6,a
      00237A A3               [24] 1445 	inc	dptr
      00237B E0               [24] 1446 	movx	a,@dptr
      00237C FF               [12] 1447 	mov	r7,a
      00237D 90 04 14         [24] 1448 	mov	dptr,#_lcdputstr_wordwrap_word_start_65537_101
      002380 ED               [12] 1449 	mov	a,r5
      002381 F0               [24] 1450 	movx	@dptr,a
      002382 EE               [12] 1451 	mov	a,r6
      002383 A3               [24] 1452 	inc	dptr
      002384 F0               [24] 1453 	movx	@dptr,a
      002385 EF               [12] 1454 	mov	a,r7
      002386 A3               [24] 1455 	inc	dptr
      002387 F0               [24] 1456 	movx	@dptr,a
                           0002ED  1457 	C$LCD_Driver.c$229$1_1$97 ==.
                                   1458 ;	LCD_Driver.c:229: while(*ss) {
      002388                       1459 00113$:
      002388 8D 82            [24] 1460 	mov	dpl,r5
      00238A 8E 83            [24] 1461 	mov	dph,r6
      00238C 8F F0            [24] 1462 	mov	b,r7
      00238E 12 40 D4         [24] 1463 	lcall	__gptrget
      002391 FC               [12] 1464 	mov	r4,a
      002392 70 03            [24] 1465 	jnz	00180$
      002394 02 24 C1         [24] 1466 	ljmp	00139$
      002397                       1467 00180$:
                           0002FC  1468 	C$LCD_Driver.c$231$2_1$102 ==.
                                   1469 ;	LCD_Driver.c:231: if(*ss == ' ' || *(ss + 1) == '\0') {
      002397 BC 20 02         [24] 1470 	cjne	r4,#0x20,00181$
      00239A 80 17            [24] 1471 	sjmp	00110$
      00239C                       1472 00181$:
      00239C 74 01            [12] 1473 	mov	a,#0x01
      00239E 2D               [12] 1474 	add	a,r5
      00239F FA               [12] 1475 	mov	r2,a
      0023A0 E4               [12] 1476 	clr	a
      0023A1 3E               [12] 1477 	addc	a,r6
      0023A2 FB               [12] 1478 	mov	r3,a
      0023A3 8F 04            [24] 1479 	mov	ar4,r7
      0023A5 8A 82            [24] 1480 	mov	dpl,r2
      0023A7 8B 83            [24] 1481 	mov	dph,r3
      0023A9 8C F0            [24] 1482 	mov	b,r4
      0023AB 12 40 D4         [24] 1483 	lcall	__gptrget
      0023AE 60 03            [24] 1484 	jz	00182$
      0023B0 02 24 AE         [24] 1485 	ljmp	00111$
      0023B3                       1486 00182$:
      0023B3                       1487 00110$:
                           000318  1488 	C$LCD_Driver.c$232$3_1$103 ==.
                                   1489 ;	LCD_Driver.c:232: uint8_t word_length = ss - word_start + ((*ss == ' ') ? 0 : 1);
      0023B3 90 04 14         [24] 1490 	mov	dptr,#_lcdputstr_wordwrap_word_start_65537_101
      0023B6 E0               [24] 1491 	movx	a,@dptr
      0023B7 FA               [12] 1492 	mov	r2,a
      0023B8 A3               [24] 1493 	inc	dptr
      0023B9 E0               [24] 1494 	movx	a,@dptr
      0023BA A3               [24] 1495 	inc	dptr
      0023BB E0               [24] 1496 	movx	a,@dptr
      0023BC 8D 01            [24] 1497 	mov	ar1,r5
      0023BE E9               [12] 1498 	mov	a,r1
      0023BF C3               [12] 1499 	clr	c
      0023C0 9A               [12] 1500 	subb	a,r2
      0023C1 FC               [12] 1501 	mov	r4,a
      0023C2 8D 82            [24] 1502 	mov	dpl,r5
      0023C4 8E 83            [24] 1503 	mov	dph,r6
      0023C6 8F F0            [24] 1504 	mov	b,r7
      0023C8 12 40 D4         [24] 1505 	lcall	__gptrget
      0023CB FB               [12] 1506 	mov	r3,a
      0023CC BB 20 06         [24] 1507 	cjne	r3,#0x20,00124$
      0023CF 7A 00            [12] 1508 	mov	r2,#0x00
      0023D1 7B 00            [12] 1509 	mov	r3,#0x00
      0023D3 80 04            [24] 1510 	sjmp	00125$
      0023D5                       1511 00124$:
      0023D5 7A 01            [12] 1512 	mov	r2,#0x01
      0023D7 7B 00            [12] 1513 	mov	r3,#0x00
      0023D9                       1514 00125$:
      0023D9 EA               [12] 1515 	mov	a,r2
      0023DA 2C               [12] 1516 	add	a,r4
      0023DB FC               [12] 1517 	mov	r4,a
                           000341  1518 	C$LCD_Driver.c$235$3_1$103 ==.
                                   1519 ;	LCD_Driver.c:235: if(current_col_local + word_length > MAX_COLS) {
      0023DC 90 04 13         [24] 1520 	mov	dptr,#_lcdputstr_wordwrap_current_col_local_65536_97
      0023DF E0               [24] 1521 	movx	a,@dptr
      0023E0 FB               [12] 1522 	mov	r3,a
      0023E1 7A 00            [12] 1523 	mov	r2,#0x00
      0023E3 8C 01            [24] 1524 	mov	ar1,r4
      0023E5 7C 00            [12] 1525 	mov	r4,#0x00
      0023E7 E9               [12] 1526 	mov	a,r1
      0023E8 2B               [12] 1527 	add	a,r3
      0023E9 FB               [12] 1528 	mov	r3,a
      0023EA EC               [12] 1529 	mov	a,r4
      0023EB 3A               [12] 1530 	addc	a,r2
      0023EC FA               [12] 1531 	mov	r2,a
      0023ED C3               [12] 1532 	clr	c
      0023EE 74 10            [12] 1533 	mov	a,#0x10
      0023F0 9B               [12] 1534 	subb	a,r3
      0023F1 74 80            [12] 1535 	mov	a,#(0x00 ^ 0x80)
      0023F3 8A F0            [24] 1536 	mov	b,r2
      0023F5 63 F0 80         [24] 1537 	xrl	b,#0x80
      0023F8 95 F0            [12] 1538 	subb	a,b
      0023FA 50 33            [24] 1539 	jnc	00108$
                           000361  1540 	C$LCD_Driver.c$236$4_1$104 ==.
                                   1541 ;	LCD_Driver.c:236: current_col_local = 0;
      0023FC 90 04 13         [24] 1542 	mov	dptr,#_lcdputstr_wordwrap_current_col_local_65536_97
      0023FF E4               [12] 1543 	clr	a
      002400 F0               [24] 1544 	movx	@dptr,a
                           000366  1545 	C$LCD_Driver.c$237$4_1$104 ==.
                                   1546 ;	LCD_Driver.c:237: current_row_local++;
      002401 90 04 12         [24] 1547 	mov	dptr,#_lcdputstr_wordwrap_current_row_local_65536_97
      002404 E0               [24] 1548 	movx	a,@dptr
      002405 24 01            [12] 1549 	add	a,#0x01
      002407 F0               [24] 1550 	movx	@dptr,a
                           00036D  1551 	C$LCD_Driver.c$240$4_1$104 ==.
                                   1552 ;	LCD_Driver.c:240: if(current_row_local >= MAX_ROWS) {
      002408 E0               [24] 1553 	movx	a,@dptr
      002409 FC               [12] 1554 	mov	r4,a
      00240A BC 04 00         [24] 1555 	cjne	r4,#0x04,00186$
      00240D                       1556 00186$:
      00240D 40 05            [24] 1557 	jc	00106$
                           000374  1558 	C$LCD_Driver.c$241$5_1$105 ==.
                                   1559 ;	LCD_Driver.c:241: current_row_local = 0;
      00240F 90 04 12         [24] 1560 	mov	dptr,#_lcdputstr_wordwrap_current_row_local_65536_97
      002412 E4               [12] 1561 	clr	a
      002413 F0               [24] 1562 	movx	@dptr,a
      002414                       1563 00106$:
                           000379  1564 	C$LCD_Driver.c$245$4_1$104 ==.
                                   1565 ;	LCD_Driver.c:245: lcdgotoxy(current_row_local, current_col_local);
      002414 90 04 12         [24] 1566 	mov	dptr,#_lcdputstr_wordwrap_current_row_local_65536_97
      002417 E0               [24] 1567 	movx	a,@dptr
      002418 FC               [12] 1568 	mov	r4,a
      002419 90 04 08         [24] 1569 	mov	dptr,#_lcdgotoxy_PARM_2
      00241C E4               [12] 1570 	clr	a
      00241D F0               [24] 1571 	movx	@dptr,a
      00241E 8C 82            [24] 1572 	mov	dpl,r4
      002420 C0 07            [24] 1573 	push	ar7
      002422 C0 06            [24] 1574 	push	ar6
      002424 C0 05            [24] 1575 	push	ar5
      002426 12 21 E1         [24] 1576 	lcall	_lcdgotoxy
      002429 D0 05            [24] 1577 	pop	ar5
      00242B D0 06            [24] 1578 	pop	ar6
      00242D D0 07            [24] 1579 	pop	ar7
      00242F                       1580 00108$:
                           000394  1581 	C$LCD_Driver.c$249$5_1$106 ==.
                                   1582 ;	LCD_Driver.c:249: for(char *p = word_start; p <= ss; p++) {
      00242F 90 04 14         [24] 1583 	mov	dptr,#_lcdputstr_wordwrap_word_start_65537_101
      002432 E0               [24] 1584 	movx	a,@dptr
      002433 F5 0B            [12] 1585 	mov	_lcdputstr_wordwrap_sloc1_1_0,a
      002435 A3               [24] 1586 	inc	dptr
      002436 E0               [24] 1587 	movx	a,@dptr
      002437 F5 0C            [12] 1588 	mov	(_lcdputstr_wordwrap_sloc1_1_0 + 1),a
      002439 A3               [24] 1589 	inc	dptr
      00243A E0               [24] 1590 	movx	a,@dptr
      00243B F5 0D            [12] 1591 	mov	(_lcdputstr_wordwrap_sloc1_1_0 + 2),a
      00243D 8D 08            [24] 1592 	mov	_lcdputstr_wordwrap_sloc0_1_0,r5
      00243F 8E 09            [24] 1593 	mov	(_lcdputstr_wordwrap_sloc0_1_0 + 1),r6
      002441 8F 0A            [24] 1594 	mov	(_lcdputstr_wordwrap_sloc0_1_0 + 2),r7
      002443 90 04 13         [24] 1595 	mov	dptr,#_lcdputstr_wordwrap_current_col_local_65536_97
      002446 E0               [24] 1596 	movx	a,@dptr
      002447 F9               [12] 1597 	mov	r1,a
      002448                       1598 00120$:
      002448 C0 01            [24] 1599 	push	ar1
      00244A A8 0B            [24] 1600 	mov	r0,_lcdputstr_wordwrap_sloc1_1_0
      00244C A9 0C            [24] 1601 	mov	r1,(_lcdputstr_wordwrap_sloc1_1_0 + 1)
      00244E AC 0D            [24] 1602 	mov	r4,(_lcdputstr_wordwrap_sloc1_1_0 + 2)
      002450 C0 00            [24] 1603 	push	ar0
      002452 C0 01            [24] 1604 	push	ar1
      002454 C0 04            [24] 1605 	push	ar4
      002456 85 08 82         [24] 1606 	mov	dpl,_lcdputstr_wordwrap_sloc0_1_0
      002459 85 09 83         [24] 1607 	mov	dph,(_lcdputstr_wordwrap_sloc0_1_0 + 1)
      00245C 85 0A F0         [24] 1608 	mov	b,(_lcdputstr_wordwrap_sloc0_1_0 + 2)
      00245F 12 20 11         [24] 1609 	lcall	___gptr_cmp
      002462 15 81            [12] 1610 	dec	sp
      002464 15 81            [12] 1611 	dec	sp
      002466 15 81            [12] 1612 	dec	sp
      002468 D0 01            [24] 1613 	pop	ar1
      00246A 40 2C            [24] 1614 	jc	00138$
                           0003D1  1615 	C$LCD_Driver.c$250$5_1$107 ==.
                                   1616 ;	LCD_Driver.c:250: lcdputch(*p);
      00246C 85 0B 82         [24] 1617 	mov	dpl,_lcdputstr_wordwrap_sloc1_1_0
      00246F 85 0C 83         [24] 1618 	mov	dph,(_lcdputstr_wordwrap_sloc1_1_0 + 1)
      002472 85 0D F0         [24] 1619 	mov	b,(_lcdputstr_wordwrap_sloc1_1_0 + 2)
      002475 12 40 D4         [24] 1620 	lcall	__gptrget
      002478 FC               [12] 1621 	mov	r4,a
      002479 A3               [24] 1622 	inc	dptr
      00247A 85 82 0B         [24] 1623 	mov	_lcdputstr_wordwrap_sloc1_1_0,dpl
      00247D 85 83 0C         [24] 1624 	mov	(_lcdputstr_wordwrap_sloc1_1_0 + 1),dph
      002480 8C 82            [24] 1625 	mov	dpl,r4
      002482 C0 07            [24] 1626 	push	ar7
      002484 C0 06            [24] 1627 	push	ar6
      002486 C0 05            [24] 1628 	push	ar5
      002488 C0 01            [24] 1629 	push	ar1
      00248A 12 21 79         [24] 1630 	lcall	_lcdputch
      00248D D0 01            [24] 1631 	pop	ar1
      00248F D0 05            [24] 1632 	pop	ar5
      002491 D0 06            [24] 1633 	pop	ar6
      002493 D0 07            [24] 1634 	pop	ar7
                           0003FA  1635 	C$LCD_Driver.c$251$5_1$107 ==.
                                   1636 ;	LCD_Driver.c:251: current_col_local++;
      002495 09               [12] 1637 	inc	r1
                           0003FB  1638 	C$LCD_Driver.c$249$4_1$106 ==.
                                   1639 ;	LCD_Driver.c:249: for(char *p = word_start; p <= ss; p++) {
      002496 80 B0            [24] 1640 	sjmp	00120$
      002498                       1641 00138$:
      002498 90 04 13         [24] 1642 	mov	dptr,#_lcdputstr_wordwrap_current_col_local_65536_97
      00249B E9               [12] 1643 	mov	a,r1
      00249C F0               [24] 1644 	movx	@dptr,a
                           000402  1645 	C$LCD_Driver.c$254$3_1$103 ==.
                                   1646 ;	LCD_Driver.c:254: word_start = ss + 1; // Move to start of next word
      00249D 90 04 14         [24] 1647 	mov	dptr,#_lcdputstr_wordwrap_word_start_65537_101
      0024A0 74 01            [12] 1648 	mov	a,#0x01
      0024A2 25 08            [12] 1649 	add	a,_lcdputstr_wordwrap_sloc0_1_0
      0024A4 F0               [24] 1650 	movx	@dptr,a
      0024A5 E4               [12] 1651 	clr	a
      0024A6 35 09            [12] 1652 	addc	a,(_lcdputstr_wordwrap_sloc0_1_0 + 1)
      0024A8 A3               [24] 1653 	inc	dptr
      0024A9 F0               [24] 1654 	movx	@dptr,a
      0024AA E5 0A            [12] 1655 	mov	a,(_lcdputstr_wordwrap_sloc0_1_0 + 2)
      0024AC A3               [24] 1656 	inc	dptr
      0024AD F0               [24] 1657 	movx	@dptr,a
      0024AE                       1658 00111$:
                           000413  1659 	C$LCD_Driver.c$257$2_1$102 ==.
                                   1660 ;	LCD_Driver.c:257: ss++;
      0024AE 0D               [12] 1661 	inc	r5
      0024AF BD 00 01         [24] 1662 	cjne	r5,#0x00,00189$
      0024B2 0E               [12] 1663 	inc	r6
      0024B3                       1664 00189$:
      0024B3 90 04 0F         [24] 1665 	mov	dptr,#_lcdputstr_wordwrap_ss_65536_96
      0024B6 ED               [12] 1666 	mov	a,r5
      0024B7 F0               [24] 1667 	movx	@dptr,a
      0024B8 EE               [12] 1668 	mov	a,r6
      0024B9 A3               [24] 1669 	inc	dptr
      0024BA F0               [24] 1670 	movx	@dptr,a
      0024BB EF               [12] 1671 	mov	a,r7
      0024BC A3               [24] 1672 	inc	dptr
      0024BD F0               [24] 1673 	movx	@dptr,a
      0024BE 02 23 88         [24] 1674 	ljmp	00113$
      0024C1                       1675 00139$:
      0024C1 90 04 0F         [24] 1676 	mov	dptr,#_lcdputstr_wordwrap_ss_65536_96
      0024C4 ED               [12] 1677 	mov	a,r5
      0024C5 F0               [24] 1678 	movx	@dptr,a
      0024C6 EE               [12] 1679 	mov	a,r6
      0024C7 A3               [24] 1680 	inc	dptr
      0024C8 F0               [24] 1681 	movx	@dptr,a
      0024C9 EF               [12] 1682 	mov	a,r7
      0024CA A3               [24] 1683 	inc	dptr
      0024CB F0               [24] 1684 	movx	@dptr,a
                           000431  1685 	C$LCD_Driver.c$259$1_1$97 ==.
                                   1686 ;	LCD_Driver.c:259: }
                           000431  1687 	C$LCD_Driver.c$259$1_1$97 ==.
                           000431  1688 	XG$lcdputstr_wordwrap$0$0 ==.
      0024CC 22               [24] 1689 	ret
                                   1690 ;------------------------------------------------------------
                                   1691 ;Allocation info for local variables in function 'lcd_putchar_at'
                                   1692 ;------------------------------------------------------------
                                   1693 ;col                       Allocated with name '_lcd_putchar_at_PARM_2'
                                   1694 ;c                         Allocated with name '_lcd_putchar_at_PARM_3'
                                   1695 ;row                       Allocated with name '_lcd_putchar_at_row_65536_108'
                                   1696 ;------------------------------------------------------------
                           000432  1697 	G$lcd_putchar_at$0$0 ==.
                           000432  1698 	C$LCD_Driver.c$262$1_1$109 ==.
                                   1699 ;	LCD_Driver.c:262: void lcd_putchar_at(uint8_t row, uint8_t col, char c)
                                   1700 ;	-----------------------------------------
                                   1701 ;	 function lcd_putchar_at
                                   1702 ;	-----------------------------------------
      0024CD                       1703 _lcd_putchar_at:
      0024CD E5 82            [12] 1704 	mov	a,dpl
      0024CF 90 04 19         [24] 1705 	mov	dptr,#_lcd_putchar_at_row_65536_108
      0024D2 F0               [24] 1706 	movx	@dptr,a
                           000438  1707 	C$LCD_Driver.c$264$1_0$109 ==.
                                   1708 ;	LCD_Driver.c:264: lcdgotoxy(row, col);
      0024D3 E0               [24] 1709 	movx	a,@dptr
      0024D4 FF               [12] 1710 	mov	r7,a
      0024D5 90 04 17         [24] 1711 	mov	dptr,#_lcd_putchar_at_PARM_2
      0024D8 E0               [24] 1712 	movx	a,@dptr
      0024D9 90 04 08         [24] 1713 	mov	dptr,#_lcdgotoxy_PARM_2
      0024DC F0               [24] 1714 	movx	@dptr,a
      0024DD 8F 82            [24] 1715 	mov	dpl,r7
      0024DF 12 21 E1         [24] 1716 	lcall	_lcdgotoxy
                           000447  1717 	C$LCD_Driver.c$265$1_0$109 ==.
                                   1718 ;	LCD_Driver.c:265: lcdputch(c);
      0024E2 90 04 18         [24] 1719 	mov	dptr,#_lcd_putchar_at_PARM_3
      0024E5 E0               [24] 1720 	movx	a,@dptr
      0024E6 F5 82            [12] 1721 	mov	dpl,a
      0024E8 12 21 79         [24] 1722 	lcall	_lcdputch
                           000450  1723 	C$LCD_Driver.c$266$1_0$109 ==.
                                   1724 ;	LCD_Driver.c:266: }
                           000450  1725 	C$LCD_Driver.c$266$1_0$109 ==.
                           000450  1726 	XG$lcd_putchar_at$0$0 ==.
      0024EB 22               [24] 1727 	ret
                                   1728 ;------------------------------------------------------------
                                   1729 ;Allocation info for local variables in function 'lcd_string_at'
                                   1730 ;------------------------------------------------------------
                                   1731 ;col                       Allocated with name '_lcd_string_at_PARM_2'
                                   1732 ;str                       Allocated with name '_lcd_string_at_PARM_3'
                                   1733 ;row                       Allocated with name '_lcd_string_at_row_65536_110'
                                   1734 ;------------------------------------------------------------
                           000451  1735 	G$lcd_string_at$0$0 ==.
                           000451  1736 	C$LCD_Driver.c$269$1_0$111 ==.
                                   1737 ;	LCD_Driver.c:269: void lcd_string_at(uint8_t row, uint8_t col, const char *str)
                                   1738 ;	-----------------------------------------
                                   1739 ;	 function lcd_string_at
                                   1740 ;	-----------------------------------------
      0024EC                       1741 _lcd_string_at:
      0024EC E5 82            [12] 1742 	mov	a,dpl
      0024EE 90 04 1E         [24] 1743 	mov	dptr,#_lcd_string_at_row_65536_110
      0024F1 F0               [24] 1744 	movx	@dptr,a
                           000457  1745 	C$LCD_Driver.c$271$1_0$111 ==.
                                   1746 ;	LCD_Driver.c:271: lcdgotoxy(row, col);
      0024F2 E0               [24] 1747 	movx	a,@dptr
      0024F3 FF               [12] 1748 	mov	r7,a
      0024F4 90 04 1A         [24] 1749 	mov	dptr,#_lcd_string_at_PARM_2
      0024F7 E0               [24] 1750 	movx	a,@dptr
      0024F8 90 04 08         [24] 1751 	mov	dptr,#_lcdgotoxy_PARM_2
      0024FB F0               [24] 1752 	movx	@dptr,a
      0024FC 8F 82            [24] 1753 	mov	dpl,r7
      0024FE 12 21 E1         [24] 1754 	lcall	_lcdgotoxy
                           000466  1755 	C$LCD_Driver.c$272$1_0$111 ==.
                                   1756 ;	LCD_Driver.c:272: lcdputstr((char *)str);
      002501 90 04 1B         [24] 1757 	mov	dptr,#_lcd_string_at_PARM_3
      002504 E0               [24] 1758 	movx	a,@dptr
      002505 FD               [12] 1759 	mov	r5,a
      002506 A3               [24] 1760 	inc	dptr
      002507 E0               [24] 1761 	movx	a,@dptr
      002508 FE               [12] 1762 	mov	r6,a
      002509 A3               [24] 1763 	inc	dptr
      00250A E0               [24] 1764 	movx	a,@dptr
      00250B FF               [12] 1765 	mov	r7,a
      00250C 8D 82            [24] 1766 	mov	dpl,r5
      00250E 8E 83            [24] 1767 	mov	dph,r6
      002510 8F F0            [24] 1768 	mov	b,r7
      002512 12 22 20         [24] 1769 	lcall	_lcdputstr
                           00047A  1770 	C$LCD_Driver.c$273$1_0$111 ==.
                                   1771 ;	LCD_Driver.c:273: }
                           00047A  1772 	C$LCD_Driver.c$273$1_0$111 ==.
                           00047A  1773 	XG$lcd_string_at$0$0 ==.
      002515 22               [24] 1774 	ret
                                   1775 ;------------------------------------------------------------
                                   1776 ;Allocation info for local variables in function 'lcdclear'
                                   1777 ;------------------------------------------------------------
                           00047B  1778 	G$lcdclear$0$0 ==.
                           00047B  1779 	C$LCD_Driver.c$276$1_0$113 ==.
                                   1780 ;	LCD_Driver.c:276: void lcdclear(void)
                                   1781 ;	-----------------------------------------
                                   1782 ;	 function lcdclear
                                   1783 ;	-----------------------------------------
      002516                       1784 _lcdclear:
                           00047B  1785 	C$LCD_Driver.c$278$1_0$113 ==.
                                   1786 ;	LCD_Driver.c:278: lcd_cmd(0x01);  // Clear display command (slow)
      002516 75 82 01         [24] 1787 	mov	dpl,#0x01
      002519 12 21 5E         [24] 1788 	lcall	_lcd_cmd
                           000481  1789 	C$LCD_Driver.c$279$1_0$113 ==.
                                   1790 ;	LCD_Driver.c:279: current_row = 0;
      00251C 90 05 44         [24] 1791 	mov	dptr,#_current_row
      00251F E4               [12] 1792 	clr	a
      002520 F0               [24] 1793 	movx	@dptr,a
                           000486  1794 	C$LCD_Driver.c$280$1_0$113 ==.
                                   1795 ;	LCD_Driver.c:280: current_col = 0;
      002521 90 05 45         [24] 1796 	mov	dptr,#_current_col
      002524 F0               [24] 1797 	movx	@dptr,a
                           00048A  1798 	C$LCD_Driver.c$281$1_0$113 ==.
                                   1799 ;	LCD_Driver.c:281: lcdbusywait(); // wait for it to complete
      002525 12 21 3E         [24] 1800 	lcall	_lcdbusywait
                           00048D  1801 	C$LCD_Driver.c$282$1_0$113 ==.
                                   1802 ;	LCD_Driver.c:282: }
                           00048D  1803 	C$LCD_Driver.c$282$1_0$113 ==.
                           00048D  1804 	XG$lcdclear$0$0 ==.
      002528 22               [24] 1805 	ret
                                   1806 ;------------------------------------------------------------
                                   1807 ;Allocation info for local variables in function 'lcd_home'
                                   1808 ;------------------------------------------------------------
                           00048E  1809 	G$lcd_home$0$0 ==.
                           00048E  1810 	C$LCD_Driver.c$285$1_0$115 ==.
                                   1811 ;	LCD_Driver.c:285: void lcd_home(void)
                                   1812 ;	-----------------------------------------
                                   1813 ;	 function lcd_home
                                   1814 ;	-----------------------------------------
      002529                       1815 _lcd_home:
                           00048E  1816 	C$LCD_Driver.c$287$1_0$115 ==.
                                   1817 ;	LCD_Driver.c:287: lcd_cmd(0x02);  // Cursor home command
      002529 75 82 02         [24] 1818 	mov	dpl,#0x02
      00252C 12 21 5E         [24] 1819 	lcall	_lcd_cmd
                           000494  1820 	C$LCD_Driver.c$288$1_0$115 ==.
                                   1821 ;	LCD_Driver.c:288: current_row = 0;
      00252F 90 05 44         [24] 1822 	mov	dptr,#_current_row
      002532 E4               [12] 1823 	clr	a
      002533 F0               [24] 1824 	movx	@dptr,a
                           000499  1825 	C$LCD_Driver.c$289$1_0$115 ==.
                                   1826 ;	LCD_Driver.c:289: current_col = 0;
      002534 90 05 45         [24] 1827 	mov	dptr,#_current_col
      002537 F0               [24] 1828 	movx	@dptr,a
                           00049D  1829 	C$LCD_Driver.c$290$1_0$115 ==.
                                   1830 ;	LCD_Driver.c:290: lcdbusywait(); // wait for it to complete
      002538 12 21 3E         [24] 1831 	lcall	_lcdbusywait
                           0004A0  1832 	C$LCD_Driver.c$291$1_0$115 ==.
                                   1833 ;	LCD_Driver.c:291: }
                           0004A0  1834 	C$LCD_Driver.c$291$1_0$115 ==.
                           0004A0  1835 	XG$lcd_home$0$0 ==.
      00253B 22               [24] 1836 	ret
                                   1837 ;------------------------------------------------------------
                                   1838 ;Allocation info for local variables in function 'lcd_delay_ms'
                                   1839 ;------------------------------------------------------------
                                   1840 ;ms                        Allocated with name '_lcd_delay_ms_ms_65536_116'
                                   1841 ;i                         Allocated with name '_lcd_delay_ms_i_65536_117'
                                   1842 ;------------------------------------------------------------
                           0004A1  1843 	G$lcd_delay_ms$0$0 ==.
                           0004A1  1844 	C$LCD_Driver.c$294$1_0$117 ==.
                                   1845 ;	LCD_Driver.c:294: void lcd_delay_ms(uint8_t ms)
                                   1846 ;	-----------------------------------------
                                   1847 ;	 function lcd_delay_ms
                                   1848 ;	-----------------------------------------
      00253C                       1849 _lcd_delay_ms:
      00253C E5 82            [12] 1850 	mov	a,dpl
      00253E 90 04 1F         [24] 1851 	mov	dptr,#_lcd_delay_ms_ms_65536_116
      002541 F0               [24] 1852 	movx	@dptr,a
                           0004A7  1853 	C$LCD_Driver.c$297$1_0$117 ==.
                                   1854 ;	LCD_Driver.c:297: while(ms--) {
      002542 E0               [24] 1855 	movx	a,@dptr
      002543 FF               [12] 1856 	mov	r7,a
      002544                       1857 00102$:
      002544 8F 06            [24] 1858 	mov	ar6,r7
      002546 1F               [12] 1859 	dec	r7
      002547 90 04 1F         [24] 1860 	mov	dptr,#_lcd_delay_ms_ms_65536_116
      00254A EF               [12] 1861 	mov	a,r7
      00254B F0               [24] 1862 	movx	@dptr,a
      00254C EE               [12] 1863 	mov	a,r6
      00254D 60 2D            [24] 1864 	jz	00114$
                           0004B4  1865 	C$LCD_Driver.c$298$3_0$119 ==.
                                   1866 ;	LCD_Driver.c:298: for(i = 0; i < 1000; i++);  // ~1ms at 11MHz
      00254F 90 04 20         [24] 1867 	mov	dptr,#_lcd_delay_ms_i_65536_117
      002552 E4               [12] 1868 	clr	a
      002553 F0               [24] 1869 	movx	@dptr,a
      002554 A3               [24] 1870 	inc	dptr
      002555 F0               [24] 1871 	movx	@dptr,a
      002556                       1872 00106$:
      002556 90 04 20         [24] 1873 	mov	dptr,#_lcd_delay_ms_i_65536_117
      002559 E0               [24] 1874 	movx	a,@dptr
      00255A FD               [12] 1875 	mov	r5,a
      00255B A3               [24] 1876 	inc	dptr
      00255C E0               [24] 1877 	movx	a,@dptr
      00255D FE               [12] 1878 	mov	r6,a
      00255E C3               [12] 1879 	clr	c
      00255F ED               [12] 1880 	mov	a,r5
      002560 94 E8            [12] 1881 	subb	a,#0xe8
      002562 EE               [12] 1882 	mov	a,r6
      002563 94 03            [12] 1883 	subb	a,#0x03
      002565 50 DD            [24] 1884 	jnc	00102$
      002567 90 04 20         [24] 1885 	mov	dptr,#_lcd_delay_ms_i_65536_117
      00256A E0               [24] 1886 	movx	a,@dptr
      00256B FD               [12] 1887 	mov	r5,a
      00256C A3               [24] 1888 	inc	dptr
      00256D E0               [24] 1889 	movx	a,@dptr
      00256E FE               [12] 1890 	mov	r6,a
      00256F 90 04 20         [24] 1891 	mov	dptr,#_lcd_delay_ms_i_65536_117
      002572 74 01            [12] 1892 	mov	a,#0x01
      002574 2D               [12] 1893 	add	a,r5
      002575 F0               [24] 1894 	movx	@dptr,a
      002576 E4               [12] 1895 	clr	a
      002577 3E               [12] 1896 	addc	a,r6
      002578 A3               [24] 1897 	inc	dptr
      002579 F0               [24] 1898 	movx	@dptr,a
      00257A 80 DA            [24] 1899 	sjmp	00106$
      00257C                       1900 00114$:
      00257C 90 04 1F         [24] 1901 	mov	dptr,#_lcd_delay_ms_ms_65536_116
      00257F EF               [12] 1902 	mov	a,r7
      002580 F0               [24] 1903 	movx	@dptr,a
                           0004E6  1904 	C$LCD_Driver.c$300$1_0$117 ==.
                                   1905 ;	LCD_Driver.c:300: }
                           0004E6  1906 	C$LCD_Driver.c$300$1_0$117 ==.
                           0004E6  1907 	XG$lcd_delay_ms$0$0 ==.
      002581 22               [24] 1908 	ret
                                   1909 ;------------------------------------------------------------
                                   1910 ;Allocation info for local variables in function 'lcdinit'
                                   1911 ;------------------------------------------------------------
                           0004E7  1912 	G$lcdinit$0$0 ==.
                           0004E7  1913 	C$LCD_Driver.c$302$1_0$121 ==.
                                   1914 ;	LCD_Driver.c:302: void lcdinit(void)
                                   1915 ;	-----------------------------------------
                                   1916 ;	 function lcdinit
                                   1917 ;	-----------------------------------------
      002582                       1918 _lcdinit:
                           0004E7  1919 	C$LCD_Driver.c$304$1_0$121 ==.
                                   1920 ;	LCD_Driver.c:304: lcd_delay_ms(50);  // Wait >15ms after VDD reaches 4.5V
      002582 75 82 32         [24] 1921 	mov	dpl,#0x32
      002585 12 25 3C         [24] 1922 	lcall	_lcd_delay_ms
                           0004ED  1923 	C$LCD_Driver.c$305$1_0$121 ==.
                                   1924 ;	LCD_Driver.c:305: *lcd_cmd_ptr = 0x30; // UNLOCK
      002588 90 05 46         [24] 1925 	mov	dptr,#_lcd_cmd_ptr
      00258B E0               [24] 1926 	movx	a,@dptr
      00258C FE               [12] 1927 	mov	r6,a
      00258D A3               [24] 1928 	inc	dptr
      00258E E0               [24] 1929 	movx	a,@dptr
      00258F FF               [12] 1930 	mov	r7,a
      002590 8E 82            [24] 1931 	mov	dpl,r6
      002592 8F 83            [24] 1932 	mov	dph,r7
      002594 74 30            [12] 1933 	mov	a,#0x30
      002596 F0               [24] 1934 	movx	@dptr,a
                           0004FC  1935 	C$LCD_Driver.c$306$1_0$121 ==.
                                   1936 ;	LCD_Driver.c:306: lcd_delay_ms(15);      // Wait >4.1ms
      002597 75 82 0F         [24] 1937 	mov	dpl,#0x0f
      00259A 12 25 3C         [24] 1938 	lcall	_lcd_delay_ms
                           000502  1939 	C$LCD_Driver.c$307$1_0$121 ==.
                                   1940 ;	LCD_Driver.c:307: *lcd_cmd_ptr = 0x30;  // UNLOCK
      00259D 90 05 46         [24] 1941 	mov	dptr,#_lcd_cmd_ptr
      0025A0 E0               [24] 1942 	movx	a,@dptr
      0025A1 FE               [12] 1943 	mov	r6,a
      0025A2 A3               [24] 1944 	inc	dptr
      0025A3 E0               [24] 1945 	movx	a,@dptr
      0025A4 FF               [12] 1946 	mov	r7,a
      0025A5 8E 82            [24] 1947 	mov	dpl,r6
      0025A7 8F 83            [24] 1948 	mov	dph,r7
      0025A9 74 30            [12] 1949 	mov	a,#0x30
      0025AB F0               [24] 1950 	movx	@dptr,a
                           000511  1951 	C$LCD_Driver.c$308$1_0$121 ==.
                                   1952 ;	LCD_Driver.c:308: lcd_delay_ms(5);      // Wait >100μs
      0025AC 75 82 05         [24] 1953 	mov	dpl,#0x05
      0025AF 12 25 3C         [24] 1954 	lcall	_lcd_delay_ms
                           000517  1955 	C$LCD_Driver.c$309$1_0$121 ==.
                                   1956 ;	LCD_Driver.c:309: *lcd_cmd_ptr = 0x30;  // Unlock Third time for reliability
      0025B2 90 05 46         [24] 1957 	mov	dptr,#_lcd_cmd_ptr
      0025B5 E0               [24] 1958 	movx	a,@dptr
      0025B6 FE               [12] 1959 	mov	r6,a
      0025B7 A3               [24] 1960 	inc	dptr
      0025B8 E0               [24] 1961 	movx	a,@dptr
      0025B9 FF               [12] 1962 	mov	r7,a
      0025BA 8E 82            [24] 1963 	mov	dpl,r6
      0025BC 8F 83            [24] 1964 	mov	dph,r7
      0025BE 74 30            [12] 1965 	mov	a,#0x30
      0025C0 F0               [24] 1966 	movx	@dptr,a
                           000526  1967 	C$LCD_Driver.c$313$1_0$121 ==.
                                   1968 ;	LCD_Driver.c:313: lcd_cmd(0x38);  // Function Set
      0025C1 75 82 38         [24] 1969 	mov	dpl,#0x38
      0025C4 12 21 5E         [24] 1970 	lcall	_lcd_cmd
                           00052C  1971 	C$LCD_Driver.c$314$1_0$121 ==.
                                   1972 ;	LCD_Driver.c:314: lcd_cmd(0x08);  // Display OFF
      0025C7 75 82 08         [24] 1973 	mov	dpl,#0x08
      0025CA 12 21 5E         [24] 1974 	lcall	_lcd_cmd
                           000532  1975 	C$LCD_Driver.c$315$1_0$121 ==.
                                   1976 ;	LCD_Driver.c:315: lcd_cmd(0x0C);  // Display ON
      0025CD 75 82 0C         [24] 1977 	mov	dpl,#0x0c
      0025D0 12 21 5E         [24] 1978 	lcall	_lcd_cmd
                           000538  1979 	C$LCD_Driver.c$316$1_0$121 ==.
                                   1980 ;	LCD_Driver.c:316: lcd_cmd(0x06);  // Entry Mode Set: Increment cursor, no shift
      0025D3 75 82 06         [24] 1981 	mov	dpl,#0x06
      0025D6 12 21 5E         [24] 1982 	lcall	_lcd_cmd
                           00053E  1983 	C$LCD_Driver.c$317$1_0$121 ==.
                                   1984 ;	LCD_Driver.c:317: lcdclear();
      0025D9 12 25 16         [24] 1985 	lcall	_lcdclear
                           000541  1986 	C$LCD_Driver.c$318$1_0$121 ==.
                                   1987 ;	LCD_Driver.c:318: lcd_home();
      0025DC 12 25 29         [24] 1988 	lcall	_lcd_home
                           000544  1989 	C$LCD_Driver.c$320$1_0$121 ==.
                                   1990 ;	LCD_Driver.c:320: current_row = 0;
      0025DF 90 05 44         [24] 1991 	mov	dptr,#_current_row
      0025E2 E4               [12] 1992 	clr	a
      0025E3 F0               [24] 1993 	movx	@dptr,a
                           000549  1994 	C$LCD_Driver.c$321$1_0$121 ==.
                                   1995 ;	LCD_Driver.c:321: current_col = 0;
      0025E4 90 05 45         [24] 1996 	mov	dptr,#_current_col
      0025E7 F0               [24] 1997 	movx	@dptr,a
                           00054D  1998 	C$LCD_Driver.c$322$1_0$121 ==.
                                   1999 ;	LCD_Driver.c:322: }
                           00054D  2000 	C$LCD_Driver.c$322$1_0$121 ==.
                           00054D  2001 	XG$lcdinit$0$0 ==.
      0025E8 22               [24] 2002 	ret
                                   2003 ;------------------------------------------------------------
                                   2004 ;Allocation info for local variables in function 'get_number'
                                   2005 ;------------------------------------------------------------
                                   2006 ;max_digits                Allocated with name '_get_number_max_digits_65536_123'
                                   2007 ;buffer                    Allocated with name '_get_number_buffer_65536_123'
                                   2008 ;idx                       Allocated with name '_get_number_idx_65536_123'
                                   2009 ;c                         Allocated with name '_get_number_c_65536_123'
                                   2010 ;------------------------------------------------------------
                           00054E  2011 	G$get_number$0$0 ==.
                           00054E  2012 	C$LCD_Driver.c$325$1_0$123 ==.
                                   2013 ;	LCD_Driver.c:325: uint16_t get_number(void){
                                   2014 ;	-----------------------------------------
                                   2015 ;	 function get_number
                                   2016 ;	-----------------------------------------
      0025E9                       2017 _get_number:
                           00054E  2018 	C$LCD_Driver.c$332$3_0$126 ==.
                                   2019 ;	LCD_Driver.c:332: while(1) {
      0025E9 7F 00            [12] 2020 	mov	r7,#0x00
      0025EB                       2021 00110$:
                           000550  2022 	C$LCD_Driver.c$333$2_0$124 ==.
                                   2023 ;	LCD_Driver.c:333: c = getchar();
      0025EB C0 07            [24] 2024 	push	ar7
      0025ED 12 20 BA         [24] 2025 	lcall	_getchar
      0025F0 AD 82            [24] 2026 	mov	r5,dpl
      0025F2 AE 83            [24] 2027 	mov	r6,dph
      0025F4 D0 07            [24] 2028 	pop	ar7
                           00055B  2029 	C$LCD_Driver.c$335$2_0$124 ==.
                                   2030 ;	LCD_Driver.c:335: if (c == '\r' || c == '\n') {
      0025F6 BD 0D 02         [24] 2031 	cjne	r5,#0x0d,00135$
      0025F9 80 03            [24] 2032 	sjmp	00105$
      0025FB                       2033 00135$:
      0025FB BD 0A 17         [24] 2034 	cjne	r5,#0x0a,00106$
      0025FE                       2035 00105$:
                           000563  2036 	C$LCD_Driver.c$336$3_0$125 ==.
                                   2037 ;	LCD_Driver.c:336: buffer[idx] = '\0';
      0025FE EF               [12] 2038 	mov	a,r7
      0025FF 24 22            [12] 2039 	add	a,#_get_number_buffer_65536_123
      002601 F5 82            [12] 2040 	mov	dpl,a
      002603 E4               [12] 2041 	clr	a
      002604 34 04            [12] 2042 	addc	a,#(_get_number_buffer_65536_123 >> 8)
      002606 F5 83            [12] 2043 	mov	dph,a
      002608 E4               [12] 2044 	clr	a
      002609 F0               [24] 2045 	movx	@dptr,a
                           00056F  2046 	C$LCD_Driver.c$337$3_0$125 ==.
                                   2047 ;	LCD_Driver.c:337: putstr("\n\r");
      00260A 90 40 F8         [24] 2048 	mov	dptr,#___str_0
      00260D 75 F0 80         [24] 2049 	mov	b,#0x80
      002610 12 20 C8         [24] 2050 	lcall	_putstr
                           000578  2051 	C$LCD_Driver.c$338$3_0$125 ==.
                                   2052 ;	LCD_Driver.c:338: break; // only exit once they're done entering the number
      002613 80 35            [24] 2053 	sjmp	00111$
      002615                       2054 00106$:
                           00057A  2055 	C$LCD_Driver.c$340$2_0$124 ==.
                                   2056 ;	LCD_Driver.c:340: else if (c >= '0' && c <= '9' && idx < max_digits) { // is a number and also space in buffer
      002615 BD 30 00         [24] 2057 	cjne	r5,#0x30,00138$
      002618                       2058 00138$:
      002618 40 D1            [24] 2059 	jc	00110$
      00261A ED               [12] 2060 	mov	a,r5
      00261B 24 C6            [12] 2061 	add	a,#0xff - 0x39
      00261D 40 CC            [24] 2062 	jc	00110$
      00261F 8F 04            [24] 2063 	mov	ar4,r7
      002621 7E 00            [12] 2064 	mov	r6,#0x00
      002623 C3               [12] 2065 	clr	c
      002624 EC               [12] 2066 	mov	a,r4
      002625 94 02            [12] 2067 	subb	a,#0x02
      002627 EE               [12] 2068 	mov	a,r6
      002628 64 80            [12] 2069 	xrl	a,#0x80
      00262A 94 80            [12] 2070 	subb	a,#0x80
      00262C 50 BD            [24] 2071 	jnc	00110$
                           000593  2072 	C$LCD_Driver.c$341$3_0$126 ==.
                                   2073 ;	LCD_Driver.c:341: buffer[idx++] = c; // adding the char and then moving the buffer up
      00262E EF               [12] 2074 	mov	a,r7
      00262F 24 22            [12] 2075 	add	a,#_get_number_buffer_65536_123
      002631 F5 82            [12] 2076 	mov	dpl,a
      002633 E4               [12] 2077 	clr	a
      002634 34 04            [12] 2078 	addc	a,#(_get_number_buffer_65536_123 >> 8)
      002636 F5 83            [12] 2079 	mov	dph,a
      002638 0F               [12] 2080 	inc	r7
      002639 ED               [12] 2081 	mov	a,r5
      00263A F0               [24] 2082 	movx	@dptr,a
                           0005A0  2083 	C$LCD_Driver.c$342$3_0$126 ==.
                                   2084 ;	LCD_Driver.c:342: putchar(c);  // Echo the character onto the terminal
      00263B 7E 00            [12] 2085 	mov	r6,#0x00
      00263D 8D 82            [24] 2086 	mov	dpl,r5
      00263F 8E 83            [24] 2087 	mov	dph,r6
      002641 C0 07            [24] 2088 	push	ar7
      002643 12 20 9B         [24] 2089 	lcall	_putchar
      002646 D0 07            [24] 2090 	pop	ar7
      002648 80 A1            [24] 2091 	sjmp	00110$
      00264A                       2092 00111$:
                           0005AF  2093 	C$LCD_Driver.c$346$1_0$123 ==.
                                   2094 ;	LCD_Driver.c:346: return atoi(buffer);
      00264A 90 04 22         [24] 2095 	mov	dptr,#_get_number_buffer_65536_123
      00264D 75 F0 00         [24] 2096 	mov	b,#0x00
      002650 12 33 22         [24] 2097 	lcall	_atoi
                           0005B8  2098 	C$LCD_Driver.c$347$1_0$123 ==.
                                   2099 ;	LCD_Driver.c:347: }
                           0005B8  2100 	C$LCD_Driver.c$347$1_0$123 ==.
                           0005B8  2101 	XG$get_number$0$0 ==.
      002653 22               [24] 2102 	ret
                                   2103 ;------------------------------------------------------------
                                   2104 ;Allocation info for local variables in function 'get_user_input'
                                   2105 ;------------------------------------------------------------
                                   2106 ;max_len                   Allocated with name '_get_user_input_PARM_2'
                                   2107 ;buffer                    Allocated with name '_get_user_input_buffer_65536_127'
                                   2108 ;count                     Allocated with name '_get_user_input_count_65536_128'
                                   2109 ;c                         Allocated with name '_get_user_input_c_65536_128'
                                   2110 ;------------------------------------------------------------
                           0005B9  2111 	G$get_user_input$0$0 ==.
                           0005B9  2112 	C$LCD_Driver.c$350$1_0$128 ==.
                                   2113 ;	LCD_Driver.c:350: uint8_t get_user_input(char *buffer, uint8_t max_len) {
                                   2114 ;	-----------------------------------------
                                   2115 ;	 function get_user_input
                                   2116 ;	-----------------------------------------
      002654                       2117 _get_user_input:
      002654 AF F0            [24] 2118 	mov	r7,b
      002656 AE 83            [24] 2119 	mov	r6,dph
      002658 E5 82            [12] 2120 	mov	a,dpl
      00265A 90 04 26         [24] 2121 	mov	dptr,#_get_user_input_buffer_65536_127
      00265D F0               [24] 2122 	movx	@dptr,a
      00265E EE               [12] 2123 	mov	a,r6
      00265F A3               [24] 2124 	inc	dptr
      002660 F0               [24] 2125 	movx	@dptr,a
      002661 EF               [12] 2126 	mov	a,r7
      002662 A3               [24] 2127 	inc	dptr
      002663 F0               [24] 2128 	movx	@dptr,a
                           0005C9  2129 	C$LCD_Driver.c$351$2_0$128 ==.
                                   2130 ;	LCD_Driver.c:351: uint8_t count = 0;
      002664 90 04 29         [24] 2131 	mov	dptr,#_get_user_input_count_65536_128
      002667 E4               [12] 2132 	clr	a
      002668 F0               [24] 2133 	movx	@dptr,a
                           0005CE  2134 	C$LCD_Driver.c$354$1_0$128 ==.
                                   2135 ;	LCD_Driver.c:354: while (count < (max_len - 1)) {
      002669 90 04 25         [24] 2136 	mov	dptr,#_get_user_input_PARM_2
      00266C E0               [24] 2137 	movx	a,@dptr
      00266D FF               [12] 2138 	mov	r7,a
      00266E 90 04 26         [24] 2139 	mov	dptr,#_get_user_input_buffer_65536_127
      002671 E0               [24] 2140 	movx	a,@dptr
      002672 FC               [12] 2141 	mov	r4,a
      002673 A3               [24] 2142 	inc	dptr
      002674 E0               [24] 2143 	movx	a,@dptr
      002675 FD               [12] 2144 	mov	r5,a
      002676 A3               [24] 2145 	inc	dptr
      002677 E0               [24] 2146 	movx	a,@dptr
      002678 FE               [12] 2147 	mov	r6,a
      002679                       2148 00114$:
      002679 C0 04            [24] 2149 	push	ar4
      00267B C0 05            [24] 2150 	push	ar5
      00267D C0 06            [24] 2151 	push	ar6
      00267F 8F 02            [24] 2152 	mov	ar2,r7
      002681 7B 00            [12] 2153 	mov	r3,#0x00
      002683 1A               [12] 2154 	dec	r2
      002684 BA FF 01         [24] 2155 	cjne	r2,#0xff,00151$
      002687 1B               [12] 2156 	dec	r3
      002688                       2157 00151$:
      002688 90 04 29         [24] 2158 	mov	dptr,#_get_user_input_count_65536_128
      00268B E0               [24] 2159 	movx	a,@dptr
      00268C F9               [12] 2160 	mov	r1,a
      00268D F8               [12] 2161 	mov	r0,a
      00268E 7E 00            [12] 2162 	mov	r6,#0x00
      002690 C3               [12] 2163 	clr	c
      002691 E8               [12] 2164 	mov	a,r0
      002692 9A               [12] 2165 	subb	a,r2
      002693 EE               [12] 2166 	mov	a,r6
      002694 64 80            [12] 2167 	xrl	a,#0x80
      002696 8B F0            [24] 2168 	mov	b,r3
      002698 63 F0 80         [24] 2169 	xrl	b,#0x80
      00269B 95 F0            [12] 2170 	subb	a,b
      00269D D0 06            [24] 2171 	pop	ar6
      00269F D0 05            [24] 2172 	pop	ar5
      0026A1 D0 04            [24] 2173 	pop	ar4
      0026A3 40 03            [24] 2174 	jc	00152$
      0026A5 02 27 4E         [24] 2175 	ljmp	00116$
      0026A8                       2176 00152$:
                           00060D  2177 	C$LCD_Driver.c$356$2_0$129 ==.
                                   2178 ;	LCD_Driver.c:356: c = getchar();
      0026A8 C0 07            [24] 2179 	push	ar7
      0026AA C0 06            [24] 2180 	push	ar6
      0026AC C0 05            [24] 2181 	push	ar5
      0026AE C0 04            [24] 2182 	push	ar4
      0026B0 C0 01            [24] 2183 	push	ar1
      0026B2 12 20 BA         [24] 2184 	lcall	_getchar
      0026B5 AA 82            [24] 2185 	mov	r2,dpl
      0026B7 AB 83            [24] 2186 	mov	r3,dph
      0026B9 D0 01            [24] 2187 	pop	ar1
      0026BB D0 04            [24] 2188 	pop	ar4
      0026BD D0 05            [24] 2189 	pop	ar5
      0026BF D0 06            [24] 2190 	pop	ar6
      0026C1 D0 07            [24] 2191 	pop	ar7
                           000628  2192 	C$LCD_Driver.c$358$2_0$129 ==.
                                   2193 ;	LCD_Driver.c:358: if (c == '\r' || c == '\n') {
      0026C3 BA 0D 03         [24] 2194 	cjne	r2,#0x0d,00153$
      0026C6 02 27 4E         [24] 2195 	ljmp	00116$
      0026C9                       2196 00153$:
      0026C9 BA 0A 03         [24] 2197 	cjne	r2,#0x0a,00154$
      0026CC 02 27 4E         [24] 2198 	ljmp	00116$
      0026CF                       2199 00154$:
                           000634  2200 	C$LCD_Driver.c$360$2_0$129 ==.
                                   2201 ;	LCD_Driver.c:360: } else if (c == '\b' || c == 0x7F) {  // Backspace or DEL
      0026CF BA 08 02         [24] 2202 	cjne	r2,#0x08,00155$
      0026D2 80 03            [24] 2203 	sjmp	00106$
      0026D4                       2204 00155$:
      0026D4 BA 7F 33         [24] 2205 	cjne	r2,#0x7f,00107$
      0026D7                       2206 00106$:
                           00063C  2207 	C$LCD_Driver.c$361$3_0$131 ==.
                                   2208 ;	LCD_Driver.c:361: if (count > 0) {
      0026D7 90 04 29         [24] 2209 	mov	dptr,#_get_user_input_count_65536_128
      0026DA E0               [24] 2210 	movx	a,@dptr
      0026DB FB               [12] 2211 	mov	r3,a
      0026DC E0               [24] 2212 	movx	a,@dptr
      0026DD 60 9A            [24] 2213 	jz	00114$
                           000644  2214 	C$LCD_Driver.c$362$4_0$132 ==.
                                   2215 ;	LCD_Driver.c:362: count--;
      0026DF EB               [12] 2216 	mov	a,r3
      0026E0 14               [12] 2217 	dec	a
      0026E1 90 04 29         [24] 2218 	mov	dptr,#_get_user_input_count_65536_128
      0026E4 F0               [24] 2219 	movx	@dptr,a
                           00064A  2220 	C$LCD_Driver.c$364$4_0$132 ==.
                                   2221 ;	LCD_Driver.c:364: putchar('\b');
      0026E5 90 00 08         [24] 2222 	mov	dptr,#0x0008
      0026E8 C0 07            [24] 2223 	push	ar7
      0026EA C0 06            [24] 2224 	push	ar6
      0026EC C0 05            [24] 2225 	push	ar5
      0026EE C0 04            [24] 2226 	push	ar4
      0026F0 12 20 9B         [24] 2227 	lcall	_putchar
                           000658  2228 	C$LCD_Driver.c$365$4_0$132 ==.
                                   2229 ;	LCD_Driver.c:365: putchar(' ');
      0026F3 90 00 20         [24] 2230 	mov	dptr,#0x0020
      0026F6 12 20 9B         [24] 2231 	lcall	_putchar
                           00065E  2232 	C$LCD_Driver.c$366$4_0$132 ==.
                                   2233 ;	LCD_Driver.c:366: putchar('\b');
      0026F9 90 00 08         [24] 2234 	mov	dptr,#0x0008
      0026FC 12 20 9B         [24] 2235 	lcall	_putchar
      0026FF D0 04            [24] 2236 	pop	ar4
      002701 D0 05            [24] 2237 	pop	ar5
      002703 D0 06            [24] 2238 	pop	ar6
      002705 D0 07            [24] 2239 	pop	ar7
      002707 02 26 79         [24] 2240 	ljmp	00114$
      00270A                       2241 00107$:
                           00066F  2242 	C$LCD_Driver.c$368$2_0$129 ==.
                                   2243 ;	LCD_Driver.c:368: } else if ((c >= ' ' && c <= 'z')) {  // Only valid characters
      00270A BA 20 00         [24] 2244 	cjne	r2,#0x20,00159$
      00270D                       2245 00159$:
      00270D 50 03            [24] 2246 	jnc	00160$
      00270F 02 26 79         [24] 2247 	ljmp	00114$
      002712                       2248 00160$:
      002712 EA               [12] 2249 	mov	a,r2
      002713 24 85            [12] 2250 	add	a,#0xff - 0x7a
      002715 50 03            [24] 2251 	jnc	00161$
      002717 02 26 79         [24] 2252 	ljmp	00114$
      00271A                       2253 00161$:
                           00067F  2254 	C$LCD_Driver.c$369$3_0$133 ==.
                                   2255 ;	LCD_Driver.c:369: buffer[count++] = c;
      00271A 90 04 29         [24] 2256 	mov	dptr,#_get_user_input_count_65536_128
      00271D E9               [12] 2257 	mov	a,r1
      00271E 04               [12] 2258 	inc	a
      00271F F0               [24] 2259 	movx	@dptr,a
      002720 E9               [12] 2260 	mov	a,r1
      002721 2C               [12] 2261 	add	a,r4
      002722 F8               [12] 2262 	mov	r0,a
      002723 E4               [12] 2263 	clr	a
      002724 3D               [12] 2264 	addc	a,r5
      002725 F9               [12] 2265 	mov	r1,a
      002726 8E 03            [24] 2266 	mov	ar3,r6
      002728 88 82            [24] 2267 	mov	dpl,r0
      00272A 89 83            [24] 2268 	mov	dph,r1
      00272C 8B F0            [24] 2269 	mov	b,r3
      00272E EA               [12] 2270 	mov	a,r2
      00272F 12 34 46         [24] 2271 	lcall	__gptrput
                           000697  2272 	C$LCD_Driver.c$370$3_0$133 ==.
                                   2273 ;	LCD_Driver.c:370: putchar(c);  // Echo the character
      002732 7B 00            [12] 2274 	mov	r3,#0x00
      002734 8A 82            [24] 2275 	mov	dpl,r2
      002736 8B 83            [24] 2276 	mov	dph,r3
      002738 C0 07            [24] 2277 	push	ar7
      00273A C0 06            [24] 2278 	push	ar6
      00273C C0 05            [24] 2279 	push	ar5
      00273E C0 04            [24] 2280 	push	ar4
      002740 12 20 9B         [24] 2281 	lcall	_putchar
      002743 D0 04            [24] 2282 	pop	ar4
      002745 D0 05            [24] 2283 	pop	ar5
      002747 D0 06            [24] 2284 	pop	ar6
      002749 D0 07            [24] 2285 	pop	ar7
      00274B 02 26 79         [24] 2286 	ljmp	00114$
      00274E                       2287 00116$:
                           0006B3  2288 	C$LCD_Driver.c$375$1_0$128 ==.
                                   2289 ;	LCD_Driver.c:375: buffer[count] = '\0';  // Null terminate
      00274E 90 04 26         [24] 2290 	mov	dptr,#_get_user_input_buffer_65536_127
      002751 E0               [24] 2291 	movx	a,@dptr
      002752 FD               [12] 2292 	mov	r5,a
      002753 A3               [24] 2293 	inc	dptr
      002754 E0               [24] 2294 	movx	a,@dptr
      002755 FE               [12] 2295 	mov	r6,a
      002756 A3               [24] 2296 	inc	dptr
      002757 E0               [24] 2297 	movx	a,@dptr
      002758 FF               [12] 2298 	mov	r7,a
      002759 90 04 29         [24] 2299 	mov	dptr,#_get_user_input_count_65536_128
      00275C E0               [24] 2300 	movx	a,@dptr
      00275D FC               [12] 2301 	mov	r4,a
      00275E 2D               [12] 2302 	add	a,r5
      00275F FD               [12] 2303 	mov	r5,a
      002760 E4               [12] 2304 	clr	a
      002761 3E               [12] 2305 	addc	a,r6
      002762 FE               [12] 2306 	mov	r6,a
      002763 8D 82            [24] 2307 	mov	dpl,r5
      002765 8E 83            [24] 2308 	mov	dph,r6
      002767 8F F0            [24] 2309 	mov	b,r7
      002769 E4               [12] 2310 	clr	a
      00276A 12 34 46         [24] 2311 	lcall	__gptrput
                           0006D2  2312 	C$LCD_Driver.c$376$1_0$128 ==.
                                   2313 ;	LCD_Driver.c:376: putstr("\n\r");
      00276D 90 40 F8         [24] 2314 	mov	dptr,#___str_0
      002770 75 F0 80         [24] 2315 	mov	b,#0x80
      002773 C0 04            [24] 2316 	push	ar4
      002775 12 20 C8         [24] 2317 	lcall	_putstr
      002778 D0 04            [24] 2318 	pop	ar4
                           0006DF  2319 	C$LCD_Driver.c$377$1_0$128 ==.
                                   2320 ;	LCD_Driver.c:377: return count;
      00277A 8C 82            [24] 2321 	mov	dpl,r4
                           0006E1  2322 	C$LCD_Driver.c$378$1_0$128 ==.
                                   2323 ;	LCD_Driver.c:378: }
                           0006E1  2324 	C$LCD_Driver.c$378$1_0$128 ==.
                           0006E1  2325 	XG$get_user_input$0$0 ==.
      00277C 22               [24] 2326 	ret
                                   2327 ;------------------------------------------------------------
                                   2328 ;Allocation info for local variables in function 'save_cursor_position'
                                   2329 ;------------------------------------------------------------
                           0006E2  2330 	G$save_cursor_position$0$0 ==.
                           0006E2  2331 	C$LCD_Driver.c$382$1_0$135 ==.
                                   2332 ;	LCD_Driver.c:382: void save_cursor_position(void)
                                   2333 ;	-----------------------------------------
                                   2334 ;	 function save_cursor_position
                                   2335 ;	-----------------------------------------
      00277D                       2336 _save_cursor_position:
                           0006E2  2337 	C$LCD_Driver.c$384$1_0$135 ==.
                                   2338 ;	LCD_Driver.c:384: cursor_backup.saved_row = current_row;
      00277D 90 05 44         [24] 2339 	mov	dptr,#_current_row
      002780 E0               [24] 2340 	movx	a,@dptr
      002781 90 05 41         [24] 2341 	mov	dptr,#_cursor_backup
      002784 F0               [24] 2342 	movx	@dptr,a
                           0006EA  2343 	C$LCD_Driver.c$385$1_0$135 ==.
                                   2344 ;	LCD_Driver.c:385: cursor_backup.saved_col = current_col;
      002785 90 05 45         [24] 2345 	mov	dptr,#_current_col
      002788 E0               [24] 2346 	movx	a,@dptr
      002789 90 05 42         [24] 2347 	mov	dptr,#(_cursor_backup + 0x0001)
      00278C F0               [24] 2348 	movx	@dptr,a
                           0006F2  2349 	C$LCD_Driver.c$386$1_0$135 ==.
                                   2350 ;	LCD_Driver.c:386: cursor_backup.valid = 1;
      00278D 90 05 43         [24] 2351 	mov	dptr,#(_cursor_backup + 0x0002)
      002790 74 01            [12] 2352 	mov	a,#0x01
      002792 F0               [24] 2353 	movx	@dptr,a
                           0006F8  2354 	C$LCD_Driver.c$387$1_0$135 ==.
                                   2355 ;	LCD_Driver.c:387: }
                           0006F8  2356 	C$LCD_Driver.c$387$1_0$135 ==.
                           0006F8  2357 	XG$save_cursor_position$0$0 ==.
      002793 22               [24] 2358 	ret
                                   2359 ;------------------------------------------------------------
                                   2360 ;Allocation info for local variables in function 'restore_cursor_position'
                                   2361 ;------------------------------------------------------------
                           0006F9  2362 	G$restore_cursor_position$0$0 ==.
                           0006F9  2363 	C$LCD_Driver.c$389$1_0$137 ==.
                                   2364 ;	LCD_Driver.c:389: void restore_cursor_position(void)
                                   2365 ;	-----------------------------------------
                                   2366 ;	 function restore_cursor_position
                                   2367 ;	-----------------------------------------
      002794                       2368 _restore_cursor_position:
                           0006F9  2369 	C$LCD_Driver.c$391$1_0$137 ==.
                                   2370 ;	LCD_Driver.c:391: if(cursor_backup.valid) {
      002794 90 05 43         [24] 2371 	mov	dptr,#(_cursor_backup + 0x0002)
      002797 E0               [24] 2372 	movx	a,@dptr
      002798 60 17            [24] 2373 	jz	00103$
                           0006FF  2374 	C$LCD_Driver.c$392$2_0$138 ==.
                                   2375 ;	LCD_Driver.c:392: lcdgotoxy(cursor_backup.saved_row, cursor_backup.saved_col);
      00279A 90 05 41         [24] 2376 	mov	dptr,#_cursor_backup
      00279D E0               [24] 2377 	movx	a,@dptr
      00279E FF               [12] 2378 	mov	r7,a
      00279F 90 05 42         [24] 2379 	mov	dptr,#(_cursor_backup + 0x0001)
      0027A2 E0               [24] 2380 	movx	a,@dptr
      0027A3 90 04 08         [24] 2381 	mov	dptr,#_lcdgotoxy_PARM_2
      0027A6 F0               [24] 2382 	movx	@dptr,a
      0027A7 8F 82            [24] 2383 	mov	dpl,r7
      0027A9 12 21 E1         [24] 2384 	lcall	_lcdgotoxy
                           000711  2385 	C$LCD_Driver.c$393$2_0$138 ==.
                                   2386 ;	LCD_Driver.c:393: cursor_backup.valid = 0;
      0027AC 90 05 43         [24] 2387 	mov	dptr,#(_cursor_backup + 0x0002)
      0027AF E4               [12] 2388 	clr	a
      0027B0 F0               [24] 2389 	movx	@dptr,a
      0027B1                       2390 00103$:
                           000716  2391 	C$LCD_Driver.c$395$1_0$137 ==.
                                   2392 ;	LCD_Driver.c:395: }
                           000716  2393 	C$LCD_Driver.c$395$1_0$137 ==.
                           000716  2394 	XG$restore_cursor_position$0$0 ==.
      0027B1 22               [24] 2395 	ret
                                   2396 ;------------------------------------------------------------
                                   2397 ;Allocation info for local variables in function 'display_clock'
                                   2398 ;------------------------------------------------------------
                                   2399 ;time_str                  Allocated with name '_display_clock_time_str_65536_140'
                                   2400 ;------------------------------------------------------------
                           000717  2401 	G$display_clock$0$0 ==.
                           000717  2402 	C$LCD_Driver.c$398$1_0$140 ==.
                                   2403 ;	LCD_Driver.c:398: void display_clock(void)
                                   2404 ;	-----------------------------------------
                                   2405 ;	 function display_clock
                                   2406 ;	-----------------------------------------
      0027B2                       2407 _display_clock:
                           000717  2408 	C$LCD_Driver.c$403$1_0$140 ==.
                                   2409 ;	LCD_Driver.c:403: time_str[0] = ' '; // diff clock from rest of text
      0027B2 90 04 2A         [24] 2410 	mov	dptr,#_display_clock_time_str_65536_140
      0027B5 74 20            [12] 2411 	mov	a,#0x20
      0027B7 F0               [24] 2412 	movx	@dptr,a
                           00071D  2413 	C$LCD_Driver.c$404$1_0$140 ==.
                                   2414 ;	LCD_Driver.c:404: time_str[1] = '0' + (system_clock.minutes / 10);
      0027B8 90 05 3C         [24] 2415 	mov	dptr,#(_system_clock + 0x0004)
      0027BB E0               [24] 2416 	movx	a,@dptr
      0027BC FE               [12] 2417 	mov	r6,a
      0027BD A3               [24] 2418 	inc	dptr
      0027BE E0               [24] 2419 	movx	a,@dptr
      0027BF FF               [12] 2420 	mov	r7,a
      0027C0 90 04 E5         [24] 2421 	mov	dptr,#__divuint_PARM_2
      0027C3 74 0A            [12] 2422 	mov	a,#0x0a
      0027C5 F0               [24] 2423 	movx	@dptr,a
      0027C6 E4               [12] 2424 	clr	a
      0027C7 A3               [24] 2425 	inc	dptr
      0027C8 F0               [24] 2426 	movx	@dptr,a
      0027C9 8E 82            [24] 2427 	mov	dpl,r6
      0027CB 8F 83            [24] 2428 	mov	dph,r7
      0027CD 12 32 95         [24] 2429 	lcall	__divuint
      0027D0 AE 82            [24] 2430 	mov	r6,dpl
      0027D2 74 30            [12] 2431 	mov	a,#0x30
      0027D4 2E               [12] 2432 	add	a,r6
      0027D5 90 04 2B         [24] 2433 	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0001)
      0027D8 F0               [24] 2434 	movx	@dptr,a
                           00073E  2435 	C$LCD_Driver.c$405$1_0$140 ==.
                                   2436 ;	LCD_Driver.c:405: time_str[2] = '0' + (system_clock.minutes % 10);
      0027D9 90 05 3C         [24] 2437 	mov	dptr,#(_system_clock + 0x0004)
      0027DC E0               [24] 2438 	movx	a,@dptr
      0027DD FE               [12] 2439 	mov	r6,a
      0027DE A3               [24] 2440 	inc	dptr
      0027DF E0               [24] 2441 	movx	a,@dptr
      0027E0 FF               [12] 2442 	mov	r7,a
      0027E1 90 04 F5         [24] 2443 	mov	dptr,#__moduint_PARM_2
      0027E4 74 0A            [12] 2444 	mov	a,#0x0a
      0027E6 F0               [24] 2445 	movx	@dptr,a
      0027E7 E4               [12] 2446 	clr	a
      0027E8 A3               [24] 2447 	inc	dptr
      0027E9 F0               [24] 2448 	movx	@dptr,a
      0027EA 8E 82            [24] 2449 	mov	dpl,r6
      0027EC 8F 83            [24] 2450 	mov	dph,r7
      0027EE 12 34 81         [24] 2451 	lcall	__moduint
      0027F1 AE 82            [24] 2452 	mov	r6,dpl
      0027F3 74 30            [12] 2453 	mov	a,#0x30
      0027F5 2E               [12] 2454 	add	a,r6
      0027F6 90 04 2C         [24] 2455 	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0002)
      0027F9 F0               [24] 2456 	movx	@dptr,a
                           00075F  2457 	C$LCD_Driver.c$406$1_0$140 ==.
                                   2458 ;	LCD_Driver.c:406: time_str[3] = ':';
      0027FA 90 04 2D         [24] 2459 	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0003)
      0027FD 74 3A            [12] 2460 	mov	a,#0x3a
      0027FF F0               [24] 2461 	movx	@dptr,a
                           000765  2462 	C$LCD_Driver.c$407$1_0$140 ==.
                                   2463 ;	LCD_Driver.c:407: time_str[4] = '0' + (system_clock.seconds / 10);
      002800 90 05 3A         [24] 2464 	mov	dptr,#(_system_clock + 0x0002)
      002803 E0               [24] 2465 	movx	a,@dptr
      002804 FE               [12] 2466 	mov	r6,a
      002805 A3               [24] 2467 	inc	dptr
      002806 E0               [24] 2468 	movx	a,@dptr
      002807 FF               [12] 2469 	mov	r7,a
      002808 90 04 E5         [24] 2470 	mov	dptr,#__divuint_PARM_2
      00280B 74 0A            [12] 2471 	mov	a,#0x0a
      00280D F0               [24] 2472 	movx	@dptr,a
      00280E E4               [12] 2473 	clr	a
      00280F A3               [24] 2474 	inc	dptr
      002810 F0               [24] 2475 	movx	@dptr,a
      002811 8E 82            [24] 2476 	mov	dpl,r6
      002813 8F 83            [24] 2477 	mov	dph,r7
      002815 12 32 95         [24] 2478 	lcall	__divuint
      002818 AE 82            [24] 2479 	mov	r6,dpl
      00281A 74 30            [12] 2480 	mov	a,#0x30
      00281C 2E               [12] 2481 	add	a,r6
      00281D 90 04 2E         [24] 2482 	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0004)
      002820 F0               [24] 2483 	movx	@dptr,a
                           000786  2484 	C$LCD_Driver.c$408$1_0$140 ==.
                                   2485 ;	LCD_Driver.c:408: time_str[5] = '0' + (system_clock.seconds % 10);
      002821 90 05 3A         [24] 2486 	mov	dptr,#(_system_clock + 0x0002)
      002824 E0               [24] 2487 	movx	a,@dptr
      002825 FE               [12] 2488 	mov	r6,a
      002826 A3               [24] 2489 	inc	dptr
      002827 E0               [24] 2490 	movx	a,@dptr
      002828 FF               [12] 2491 	mov	r7,a
      002829 90 04 F5         [24] 2492 	mov	dptr,#__moduint_PARM_2
      00282C 74 0A            [12] 2493 	mov	a,#0x0a
      00282E F0               [24] 2494 	movx	@dptr,a
      00282F E4               [12] 2495 	clr	a
      002830 A3               [24] 2496 	inc	dptr
      002831 F0               [24] 2497 	movx	@dptr,a
      002832 8E 82            [24] 2498 	mov	dpl,r6
      002834 8F 83            [24] 2499 	mov	dph,r7
      002836 12 34 81         [24] 2500 	lcall	__moduint
      002839 AE 82            [24] 2501 	mov	r6,dpl
      00283B 74 30            [12] 2502 	mov	a,#0x30
      00283D 2E               [12] 2503 	add	a,r6
      00283E 90 04 2F         [24] 2504 	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0005)
      002841 F0               [24] 2505 	movx	@dptr,a
                           0007A7  2506 	C$LCD_Driver.c$409$1_0$140 ==.
                                   2507 ;	LCD_Driver.c:409: time_str[6] = '.';
      002842 90 04 30         [24] 2508 	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0006)
      002845 74 2E            [12] 2509 	mov	a,#0x2e
      002847 F0               [24] 2510 	movx	@dptr,a
                           0007AD  2511 	C$LCD_Driver.c$410$1_0$140 ==.
                                   2512 ;	LCD_Driver.c:410: time_str[7] = '0' + system_clock.tenths;
      002848 90 05 38         [24] 2513 	mov	dptr,#_system_clock
      00284B E0               [24] 2514 	movx	a,@dptr
      00284C 24 30            [12] 2515 	add	a,#0x30
      00284E 90 04 31         [24] 2516 	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0007)
      002851 F0               [24] 2517 	movx	@dptr,a
                           0007B7  2518 	C$LCD_Driver.c$411$1_0$140 ==.
                                   2519 ;	LCD_Driver.c:411: time_str[8] = '\0';
      002852 90 04 32         [24] 2520 	mov	dptr,#(_display_clock_time_str_65536_140 + 0x0008)
      002855 E4               [12] 2521 	clr	a
      002856 F0               [24] 2522 	movx	@dptr,a
                           0007BC  2523 	C$LCD_Driver.c$414$1_0$140 ==.
                                   2524 ;	LCD_Driver.c:414: save_cursor_position();
      002857 12 27 7D         [24] 2525 	lcall	_save_cursor_position
                           0007BF  2526 	C$LCD_Driver.c$417$1_0$140 ==.
                                   2527 ;	LCD_Driver.c:417: lcdgotoxy(CLOCK_ROW, CLOCK_COL);
      00285A 90 04 08         [24] 2528 	mov	dptr,#_lcdgotoxy_PARM_2
      00285D 74 08            [12] 2529 	mov	a,#0x08
      00285F F0               [24] 2530 	movx	@dptr,a
      002860 75 82 03         [24] 2531 	mov	dpl,#0x03
      002863 12 21 E1         [24] 2532 	lcall	_lcdgotoxy
                           0007CB  2533 	C$LCD_Driver.c$418$1_0$140 ==.
                                   2534 ;	LCD_Driver.c:418: lcdputstr(time_str);
      002866 90 04 2A         [24] 2535 	mov	dptr,#_display_clock_time_str_65536_140
      002869 75 F0 00         [24] 2536 	mov	b,#0x00
      00286C 12 22 20         [24] 2537 	lcall	_lcdputstr
                           0007D4  2538 	C$LCD_Driver.c$421$1_0$140 ==.
                                   2539 ;	LCD_Driver.c:421: restore_cursor_position();
      00286F 12 27 94         [24] 2540 	lcall	_restore_cursor_position
                           0007D7  2541 	C$LCD_Driver.c$422$1_0$140 ==.
                                   2542 ;	LCD_Driver.c:422: }
                           0007D7  2543 	C$LCD_Driver.c$422$1_0$140 ==.
                           0007D7  2544 	XG$display_clock$0$0 ==.
      002872 22               [24] 2545 	ret
                                   2546 ;------------------------------------------------------------
                                   2547 ;Allocation info for local variables in function 'clock_stop'
                                   2548 ;------------------------------------------------------------
                           0007D8  2549 	G$clock_stop$0$0 ==.
                           0007D8  2550 	C$LCD_Driver.c$424$1_0$142 ==.
                                   2551 ;	LCD_Driver.c:424: void clock_stop(void)
                                   2552 ;	-----------------------------------------
                                   2553 ;	 function clock_stop
                                   2554 ;	-----------------------------------------
      002873                       2555 _clock_stop:
                           0007D8  2556 	C$LCD_Driver.c$426$1_0$142 ==.
                                   2557 ;	LCD_Driver.c:426: system_clock.running = 0;
      002873 90 05 3E         [24] 2558 	mov	dptr,#(_system_clock + 0x0006)
      002876 E4               [12] 2559 	clr	a
      002877 F0               [24] 2560 	movx	@dptr,a
                           0007DD  2561 	C$LCD_Driver.c$427$1_0$142 ==.
                                   2562 ;	LCD_Driver.c:427: }
                           0007DD  2563 	C$LCD_Driver.c$427$1_0$142 ==.
                           0007DD  2564 	XG$clock_stop$0$0 ==.
      002878 22               [24] 2565 	ret
                                   2566 ;------------------------------------------------------------
                                   2567 ;Allocation info for local variables in function 'clock_start'
                                   2568 ;------------------------------------------------------------
                           0007DE  2569 	G$clock_start$0$0 ==.
                           0007DE  2570 	C$LCD_Driver.c$429$1_0$144 ==.
                                   2571 ;	LCD_Driver.c:429: void clock_start(void)
                                   2572 ;	-----------------------------------------
                                   2573 ;	 function clock_start
                                   2574 ;	-----------------------------------------
      002879                       2575 _clock_start:
                           0007DE  2576 	C$LCD_Driver.c$431$1_0$144 ==.
                                   2577 ;	LCD_Driver.c:431: system_clock.running = 1;
      002879 90 05 3E         [24] 2578 	mov	dptr,#(_system_clock + 0x0006)
      00287C 74 01            [12] 2579 	mov	a,#0x01
      00287E F0               [24] 2580 	movx	@dptr,a
                           0007E4  2581 	C$LCD_Driver.c$432$1_0$144 ==.
                                   2582 ;	LCD_Driver.c:432: }
                           0007E4  2583 	C$LCD_Driver.c$432$1_0$144 ==.
                           0007E4  2584 	XG$clock_start$0$0 ==.
      00287F 22               [24] 2585 	ret
                                   2586 ;------------------------------------------------------------
                                   2587 ;Allocation info for local variables in function 'clock_reset'
                                   2588 ;------------------------------------------------------------
                           0007E5  2589 	G$clock_reset$0$0 ==.
                           0007E5  2590 	C$LCD_Driver.c$434$1_0$146 ==.
                                   2591 ;	LCD_Driver.c:434: void clock_reset(void)
                                   2592 ;	-----------------------------------------
                                   2593 ;	 function clock_reset
                                   2594 ;	-----------------------------------------
      002880                       2595 _clock_reset:
                           0007E5  2596 	C$LCD_Driver.c$436$1_0$146 ==.
                                   2597 ;	LCD_Driver.c:436: EA = 0;  // Disable interrupts during reset
                                   2598 ;	assignBit
      002880 C2 AF            [12] 2599 	clr	_EA
                           0007E7  2600 	C$LCD_Driver.c$437$1_0$146 ==.
                                   2601 ;	LCD_Driver.c:437: system_clock.tenths = 0;
      002882 90 05 38         [24] 2602 	mov	dptr,#_system_clock
      002885 E4               [12] 2603 	clr	a
      002886 F0               [24] 2604 	movx	@dptr,a
      002887 A3               [24] 2605 	inc	dptr
      002888 F0               [24] 2606 	movx	@dptr,a
                           0007EE  2607 	C$LCD_Driver.c$438$1_0$146 ==.
                                   2608 ;	LCD_Driver.c:438: system_clock.seconds = 0;
      002889 90 05 3A         [24] 2609 	mov	dptr,#(_system_clock + 0x0002)
      00288C F0               [24] 2610 	movx	@dptr,a
      00288D A3               [24] 2611 	inc	dptr
      00288E F0               [24] 2612 	movx	@dptr,a
                           0007F4  2613 	C$LCD_Driver.c$439$1_0$146 ==.
                                   2614 ;	LCD_Driver.c:439: system_clock.minutes = 0;
      00288F 90 05 3C         [24] 2615 	mov	dptr,#(_system_clock + 0x0004)
      002892 F0               [24] 2616 	movx	@dptr,a
      002893 A3               [24] 2617 	inc	dptr
      002894 F0               [24] 2618 	movx	@dptr,a
                           0007FA  2619 	C$LCD_Driver.c$440$1_0$146 ==.
                                   2620 ;	LCD_Driver.c:440: system_clock.update_flag = 1;  // Force display update
      002895 90 05 3F         [24] 2621 	mov	dptr,#(_system_clock + 0x0007)
      002898 04               [12] 2622 	inc	a
      002899 F0               [24] 2623 	movx	@dptr,a
                           0007FF  2624 	C$LCD_Driver.c$441$1_0$146 ==.
                                   2625 ;	LCD_Driver.c:441: EA = 1;  // Re-enable interrupts
                                   2626 ;	assignBit
      00289A D2 AF            [12] 2627 	setb	_EA
                           000801  2628 	C$LCD_Driver.c$442$1_0$146 ==.
                                   2629 ;	LCD_Driver.c:442: }
                           000801  2630 	C$LCD_Driver.c$442$1_0$146 ==.
                           000801  2631 	XG$clock_reset$0$0 ==.
      00289C 22               [24] 2632 	ret
                                   2633 ;------------------------------------------------------------
                                   2634 ;Allocation info for local variables in function 'timer_init'
                                   2635 ;------------------------------------------------------------
                           000802  2636 	G$timer_init$0$0 ==.
                           000802  2637 	C$LCD_Driver.c$461$1_0$148 ==.
                                   2638 ;	LCD_Driver.c:461: void timer_init(void)
                                   2639 ;	-----------------------------------------
                                   2640 ;	 function timer_init
                                   2641 ;	-----------------------------------------
      00289D                       2642 _timer_init:
                           000802  2643 	C$LCD_Driver.c$463$1_0$148 ==.
                                   2644 ;	LCD_Driver.c:463: ET0 = 1;
                                   2645 ;	assignBit
      00289D D2 A9            [12] 2646 	setb	_ET0
                           000804  2647 	C$LCD_Driver.c$464$1_0$148 ==.
                                   2648 ;	LCD_Driver.c:464: EA = 1;
                                   2649 ;	assignBit
      00289F D2 AF            [12] 2650 	setb	_EA
                           000806  2651 	C$LCD_Driver.c$466$1_0$148 ==.
                                   2652 ;	LCD_Driver.c:466: TMOD |= 0x01;
      0028A1 43 89 01         [24] 2653 	orl	_TMOD,#0x01
                           000809  2654 	C$LCD_Driver.c$467$1_0$148 ==.
                                   2655 ;	LCD_Driver.c:467: TH0 = 0x4B;
      0028A4 75 8C 4B         [24] 2656 	mov	_TH0,#0x4b
                           00080C  2657 	C$LCD_Driver.c$468$1_0$148 ==.
                                   2658 ;	LCD_Driver.c:468: TL0 = 0xF5;
      0028A7 75 8A F5         [24] 2659 	mov	_TL0,#0xf5
                           00080F  2660 	C$LCD_Driver.c$470$1_0$148 ==.
                                   2661 ;	LCD_Driver.c:470: TR0 = 1;
                                   2662 ;	assignBit
      0028AA D2 8C            [12] 2663 	setb	_TR0
                           000811  2664 	C$LCD_Driver.c$471$1_0$148 ==.
                                   2665 ;	LCD_Driver.c:471: }
                           000811  2666 	C$LCD_Driver.c$471$1_0$148 ==.
                           000811  2667 	XG$timer_init$0$0 ==.
      0028AC 22               [24] 2668 	ret
                                   2669 ;------------------------------------------------------------
                                   2670 ;Allocation info for local variables in function 'timer0_isr'
                                   2671 ;------------------------------------------------------------
                           000812  2672 	G$timer0_isr$0$0 ==.
                           000812  2673 	C$LCD_Driver.c$474$1_0$150 ==.
                                   2674 ;	LCD_Driver.c:474: void timer0_isr(void) __interrupt (TF0_VECTOR)
                                   2675 ;	-----------------------------------------
                                   2676 ;	 function timer0_isr
                                   2677 ;	-----------------------------------------
      0028AD                       2678 _timer0_isr:
      0028AD C0 E0            [24] 2679 	push	acc
      0028AF C0 82            [24] 2680 	push	dpl
      0028B1 C0 83            [24] 2681 	push	dph
      0028B3 C0 07            [24] 2682 	push	ar7
      0028B5 C0 06            [24] 2683 	push	ar6
      0028B7 C0 D0            [24] 2684 	push	psw
      0028B9 75 D0 00         [24] 2685 	mov	psw,#0x00
                           000821  2686 	C$LCD_Driver.c$476$1_0$150 ==.
                                   2687 ;	LCD_Driver.c:476: timer_do_something = !timer_do_something; // only want to actually execute half the time, every 100ms
      0028BC 90 05 40         [24] 2688 	mov	dptr,#_timer_do_something
      0028BF E0               [24] 2689 	movx	a,@dptr
      0028C0 FF               [12] 2690 	mov	r7,a
      0028C1 B4 01 00         [24] 2691 	cjne	a,#0x01,00133$
      0028C4                       2692 00133$:
      0028C4 E4               [12] 2693 	clr	a
      0028C5 33               [12] 2694 	rlc	a
      0028C6 F0               [24] 2695 	movx	@dptr,a
                           00082C  2696 	C$LCD_Driver.c$479$1_0$150 ==.
                                   2697 ;	LCD_Driver.c:479: TH0 = 0x4B;
      0028C7 75 8C 4B         [24] 2698 	mov	_TH0,#0x4b
                           00082F  2699 	C$LCD_Driver.c$480$1_0$150 ==.
                                   2700 ;	LCD_Driver.c:480: TL0 = 0xF5;
      0028CA 75 8A F5         [24] 2701 	mov	_TL0,#0xf5
                           000832  2702 	C$LCD_Driver.c$482$1_0$150 ==.
                                   2703 ;	LCD_Driver.c:482: if (!timer_do_something){
      0028CD 90 05 40         [24] 2704 	mov	dptr,#_timer_do_something
      0028D0 E0               [24] 2705 	movx	a,@dptr
      0028D1 70 03            [24] 2706 	jnz	00102$
                           000838  2707 	C$LCD_Driver.c$483$2_0$151 ==.
                                   2708 ;	LCD_Driver.c:483: return; // if not supposed to do something this time, don't
      0028D3 02 29 6E         [24] 2709 	ljmp	00111$
      0028D6                       2710 00102$:
                           00083B  2711 	C$LCD_Driver.c$487$1_0$150 ==.
                                   2712 ;	LCD_Driver.c:487: P1_3 = !P1_3;
      0028D6 B2 93            [12] 2713 	cpl	_P1_3
                           00083D  2714 	C$LCD_Driver.c$490$1_0$150 ==.
                                   2715 ;	LCD_Driver.c:490: if(system_clock.running) {
      0028D8 90 05 3E         [24] 2716 	mov	dptr,#(_system_clock + 0x0006)
      0028DB E0               [24] 2717 	movx	a,@dptr
      0028DC 70 03            [24] 2718 	jnz	00135$
      0028DE 02 29 6E         [24] 2719 	ljmp	00111$
      0028E1                       2720 00135$:
                           000846  2721 	C$LCD_Driver.c$491$2_0$152 ==.
                                   2722 ;	LCD_Driver.c:491: system_clock.tenths++;
      0028E1 90 05 38         [24] 2723 	mov	dptr,#_system_clock
      0028E4 E0               [24] 2724 	movx	a,@dptr
      0028E5 FE               [12] 2725 	mov	r6,a
      0028E6 A3               [24] 2726 	inc	dptr
      0028E7 E0               [24] 2727 	movx	a,@dptr
      0028E8 FF               [12] 2728 	mov	r7,a
      0028E9 0E               [12] 2729 	inc	r6
      0028EA BE 00 01         [24] 2730 	cjne	r6,#0x00,00136$
      0028ED 0F               [12] 2731 	inc	r7
      0028EE                       2732 00136$:
      0028EE 90 05 38         [24] 2733 	mov	dptr,#_system_clock
      0028F1 EE               [12] 2734 	mov	a,r6
      0028F2 F0               [24] 2735 	movx	@dptr,a
      0028F3 EF               [12] 2736 	mov	a,r7
      0028F4 A3               [24] 2737 	inc	dptr
      0028F5 F0               [24] 2738 	movx	@dptr,a
                           00085B  2739 	C$LCD_Driver.c$493$2_0$152 ==.
                                   2740 ;	LCD_Driver.c:493: if(system_clock.tenths >= 10) {
      0028F6 90 05 38         [24] 2741 	mov	dptr,#_system_clock
      0028F9 E0               [24] 2742 	movx	a,@dptr
      0028FA FE               [12] 2743 	mov	r6,a
      0028FB A3               [24] 2744 	inc	dptr
      0028FC E0               [24] 2745 	movx	a,@dptr
      0028FD FF               [12] 2746 	mov	r7,a
      0028FE C3               [12] 2747 	clr	c
      0028FF EE               [12] 2748 	mov	a,r6
      002900 94 0A            [12] 2749 	subb	a,#0x0a
      002902 EF               [12] 2750 	mov	a,r7
      002903 94 00            [12] 2751 	subb	a,#0x00
      002905 40 61            [24] 2752 	jc	00108$
                           00086C  2753 	C$LCD_Driver.c$494$3_0$153 ==.
                                   2754 ;	LCD_Driver.c:494: system_clock.tenths = 0;
      002907 90 05 38         [24] 2755 	mov	dptr,#_system_clock
      00290A E4               [12] 2756 	clr	a
      00290B F0               [24] 2757 	movx	@dptr,a
      00290C A3               [24] 2758 	inc	dptr
      00290D F0               [24] 2759 	movx	@dptr,a
                           000873  2760 	C$LCD_Driver.c$495$3_0$153 ==.
                                   2761 ;	LCD_Driver.c:495: system_clock.seconds++;
      00290E 90 05 3A         [24] 2762 	mov	dptr,#(_system_clock + 0x0002)
      002911 E0               [24] 2763 	movx	a,@dptr
      002912 FE               [12] 2764 	mov	r6,a
      002913 A3               [24] 2765 	inc	dptr
      002914 E0               [24] 2766 	movx	a,@dptr
      002915 FF               [12] 2767 	mov	r7,a
      002916 0E               [12] 2768 	inc	r6
      002917 BE 00 01         [24] 2769 	cjne	r6,#0x00,00138$
      00291A 0F               [12] 2770 	inc	r7
      00291B                       2771 00138$:
      00291B 90 05 3A         [24] 2772 	mov	dptr,#(_system_clock + 0x0002)
      00291E EE               [12] 2773 	mov	a,r6
      00291F F0               [24] 2774 	movx	@dptr,a
      002920 EF               [12] 2775 	mov	a,r7
      002921 A3               [24] 2776 	inc	dptr
      002922 F0               [24] 2777 	movx	@dptr,a
                           000888  2778 	C$LCD_Driver.c$497$3_0$153 ==.
                                   2779 ;	LCD_Driver.c:497: if(system_clock.seconds >= 60) {
      002923 90 05 3A         [24] 2780 	mov	dptr,#(_system_clock + 0x0002)
      002926 E0               [24] 2781 	movx	a,@dptr
      002927 FE               [12] 2782 	mov	r6,a
      002928 A3               [24] 2783 	inc	dptr
      002929 E0               [24] 2784 	movx	a,@dptr
      00292A FF               [12] 2785 	mov	r7,a
      00292B C3               [12] 2786 	clr	c
      00292C EE               [12] 2787 	mov	a,r6
      00292D 94 3C            [12] 2788 	subb	a,#0x3c
      00292F EF               [12] 2789 	mov	a,r7
      002930 94 00            [12] 2790 	subb	a,#0x00
      002932 40 34            [24] 2791 	jc	00108$
                           000899  2792 	C$LCD_Driver.c$498$4_0$154 ==.
                                   2793 ;	LCD_Driver.c:498: system_clock.seconds = 0;
      002934 90 05 3A         [24] 2794 	mov	dptr,#(_system_clock + 0x0002)
      002937 E4               [12] 2795 	clr	a
      002938 F0               [24] 2796 	movx	@dptr,a
      002939 A3               [24] 2797 	inc	dptr
      00293A F0               [24] 2798 	movx	@dptr,a
                           0008A0  2799 	C$LCD_Driver.c$499$4_0$154 ==.
                                   2800 ;	LCD_Driver.c:499: system_clock.minutes++;
      00293B 90 05 3C         [24] 2801 	mov	dptr,#(_system_clock + 0x0004)
      00293E E0               [24] 2802 	movx	a,@dptr
      00293F FE               [12] 2803 	mov	r6,a
      002940 A3               [24] 2804 	inc	dptr
      002941 E0               [24] 2805 	movx	a,@dptr
      002942 FF               [12] 2806 	mov	r7,a
      002943 0E               [12] 2807 	inc	r6
      002944 BE 00 01         [24] 2808 	cjne	r6,#0x00,00140$
      002947 0F               [12] 2809 	inc	r7
      002948                       2810 00140$:
      002948 90 05 3C         [24] 2811 	mov	dptr,#(_system_clock + 0x0004)
      00294B EE               [12] 2812 	mov	a,r6
      00294C F0               [24] 2813 	movx	@dptr,a
      00294D EF               [12] 2814 	mov	a,r7
      00294E A3               [24] 2815 	inc	dptr
      00294F F0               [24] 2816 	movx	@dptr,a
                           0008B5  2817 	C$LCD_Driver.c$501$4_0$154 ==.
                                   2818 ;	LCD_Driver.c:501: if(system_clock.minutes >= 100) {
      002950 90 05 3C         [24] 2819 	mov	dptr,#(_system_clock + 0x0004)
      002953 E0               [24] 2820 	movx	a,@dptr
      002954 FE               [12] 2821 	mov	r6,a
      002955 A3               [24] 2822 	inc	dptr
      002956 E0               [24] 2823 	movx	a,@dptr
      002957 FF               [12] 2824 	mov	r7,a
      002958 C3               [12] 2825 	clr	c
      002959 EE               [12] 2826 	mov	a,r6
      00295A 94 64            [12] 2827 	subb	a,#0x64
      00295C EF               [12] 2828 	mov	a,r7
      00295D 94 00            [12] 2829 	subb	a,#0x00
      00295F 40 07            [24] 2830 	jc	00108$
                           0008C6  2831 	C$LCD_Driver.c$502$5_0$155 ==.
                                   2832 ;	LCD_Driver.c:502: system_clock.minutes = 0;  // Wrap at 99:59.9
      002961 90 05 3C         [24] 2833 	mov	dptr,#(_system_clock + 0x0004)
      002964 E4               [12] 2834 	clr	a
      002965 F0               [24] 2835 	movx	@dptr,a
      002966 A3               [24] 2836 	inc	dptr
      002967 F0               [24] 2837 	movx	@dptr,a
      002968                       2838 00108$:
                           0008CD  2839 	C$LCD_Driver.c$508$2_0$152 ==.
                                   2840 ;	LCD_Driver.c:508: system_clock.update_flag = 1;
      002968 90 05 3F         [24] 2841 	mov	dptr,#(_system_clock + 0x0007)
      00296B 74 01            [12] 2842 	mov	a,#0x01
      00296D F0               [24] 2843 	movx	@dptr,a
      00296E                       2844 00111$:
                           0008D3  2845 	C$LCD_Driver.c$510$1_0$150 ==.
                                   2846 ;	LCD_Driver.c:510: }
      00296E D0 D0            [24] 2847 	pop	psw
      002970 D0 06            [24] 2848 	pop	ar6
      002972 D0 07            [24] 2849 	pop	ar7
      002974 D0 83            [24] 2850 	pop	dph
      002976 D0 82            [24] 2851 	pop	dpl
      002978 D0 E0            [24] 2852 	pop	acc
                           0008DF  2853 	C$LCD_Driver.c$510$1_0$150 ==.
                           0008DF  2854 	XG$timer0_isr$0$0 ==.
      00297A 32               [24] 2855 	reti
                                   2856 ;	eliminated unneeded push/pop b
                                   2857 ;------------------------------------------------------------
                                   2858 ;Allocation info for local variables in function 'get_binary_row'
                                   2859 ;------------------------------------------------------------
                                   2860 ;bits                      Allocated with name '_get_binary_row_bits_65536_157'
                                   2861 ;count                     Allocated with name '_get_binary_row_count_65536_157'
                                   2862 ;c                         Allocated with name '_get_binary_row_c_65536_157'
                                   2863 ;result                    Allocated with name '_get_binary_row_result_65536_157'
                                   2864 ;i                         Allocated with name '_get_binary_row_i_131072_163'
                                   2865 ;------------------------------------------------------------
                           0008E0  2866 	G$get_binary_row$0$0 ==.
                           0008E0  2867 	C$LCD_Driver.c$513$1_0$157 ==.
                                   2868 ;	LCD_Driver.c:513: unsigned char get_binary_row(void) {
                                   2869 ;	-----------------------------------------
                                   2870 ;	 function get_binary_row
                                   2871 ;	-----------------------------------------
      00297B                       2872 _get_binary_row:
                           0008E0  2873 	C$LCD_Driver.c$515$2_0$157 ==.
                                   2874 ;	LCD_Driver.c:515: uint8_t count = 0;
      00297B 90 04 39         [24] 2875 	mov	dptr,#_get_binary_row_count_65536_157
      00297E E4               [12] 2876 	clr	a
      00297F F0               [24] 2877 	movx	@dptr,a
                           0008E5  2878 	C$LCD_Driver.c$517$2_0$157 ==.
                                   2879 ;	LCD_Driver.c:517: unsigned char result = 0;
      002980 90 04 3A         [24] 2880 	mov	dptr,#_get_binary_row_result_65536_157
      002983 F0               [24] 2881 	movx	@dptr,a
                           0008E9  2882 	C$LCD_Driver.c$519$3_0$159 ==.
                                   2883 ;	LCD_Driver.c:519: while (count < 5) {
      002984                       2884 00112$:
      002984 90 04 39         [24] 2885 	mov	dptr,#_get_binary_row_count_65536_157
      002987 E0               [24] 2886 	movx	a,@dptr
      002988 FF               [12] 2887 	mov	r7,a
      002989 BF 05 00         [24] 2888 	cjne	r7,#0x05,00160$
      00298C                       2889 00160$:
      00298C 40 03            [24] 2890 	jc	00161$
      00298E 02 2A 0C         [24] 2891 	ljmp	00131$
      002991                       2892 00161$:
                           0008F6  2893 	C$LCD_Driver.c$520$2_0$158 ==.
                                   2894 ;	LCD_Driver.c:520: c = getchar();
      002991 C0 07            [24] 2895 	push	ar7
      002993 12 20 BA         [24] 2896 	lcall	_getchar
      002996 AD 82            [24] 2897 	mov	r5,dpl
      002998 AE 83            [24] 2898 	mov	r6,dph
      00299A D0 07            [24] 2899 	pop	ar7
                           000901  2900 	C$LCD_Driver.c$522$2_0$158 ==.
                                   2901 ;	LCD_Driver.c:522: if (c == '0') {
      00299C BD 30 1E         [24] 2902 	cjne	r5,#0x30,00110$
                           000904  2903 	C$LCD_Driver.c$523$3_0$159 ==.
                                   2904 ;	LCD_Driver.c:523: bits[count] = c;
      00299F EF               [12] 2905 	mov	a,r7
      0029A0 24 33            [12] 2906 	add	a,#_get_binary_row_bits_65536_157
      0029A2 F5 82            [12] 2907 	mov	dpl,a
      0029A4 E4               [12] 2908 	clr	a
      0029A5 34 04            [12] 2909 	addc	a,#(_get_binary_row_bits_65536_157 >> 8)
      0029A7 F5 83            [12] 2910 	mov	dph,a
      0029A9 ED               [12] 2911 	mov	a,r5
      0029AA F0               [24] 2912 	movx	@dptr,a
                           000910  2913 	C$LCD_Driver.c$524$3_0$159 ==.
                                   2914 ;	LCD_Driver.c:524: putchar(' '); // Show space for 0
      0029AB 90 00 20         [24] 2915 	mov	dptr,#0x0020
      0029AE C0 07            [24] 2916 	push	ar7
      0029B0 12 20 9B         [24] 2917 	lcall	_putchar
      0029B3 D0 07            [24] 2918 	pop	ar7
                           00091A  2919 	C$LCD_Driver.c$525$3_0$159 ==.
                                   2920 ;	LCD_Driver.c:525: count++;
      0029B5 90 04 39         [24] 2921 	mov	dptr,#_get_binary_row_count_65536_157
      0029B8 EF               [12] 2922 	mov	a,r7
      0029B9 04               [12] 2923 	inc	a
      0029BA F0               [24] 2924 	movx	@dptr,a
      0029BB 80 C7            [24] 2925 	sjmp	00112$
      0029BD                       2926 00110$:
                           000922  2927 	C$LCD_Driver.c$527$2_0$158 ==.
                                   2928 ;	LCD_Driver.c:527: else if (c == '1') {
      0029BD BD 31 1E         [24] 2929 	cjne	r5,#0x31,00107$
                           000925  2930 	C$LCD_Driver.c$528$3_0$160 ==.
                                   2931 ;	LCD_Driver.c:528: bits[count] = c;
      0029C0 EF               [12] 2932 	mov	a,r7
      0029C1 24 33            [12] 2933 	add	a,#_get_binary_row_bits_65536_157
      0029C3 F5 82            [12] 2934 	mov	dpl,a
      0029C5 E4               [12] 2935 	clr	a
      0029C6 34 04            [12] 2936 	addc	a,#(_get_binary_row_bits_65536_157 >> 8)
      0029C8 F5 83            [12] 2937 	mov	dph,a
      0029CA ED               [12] 2938 	mov	a,r5
      0029CB F0               [24] 2939 	movx	@dptr,a
                           000931  2940 	C$LCD_Driver.c$529$3_0$160 ==.
                                   2941 ;	LCD_Driver.c:529: putchar('#'); // Show # for 1. Most filled in char I could find
      0029CC 90 00 23         [24] 2942 	mov	dptr,#0x0023
      0029CF C0 07            [24] 2943 	push	ar7
      0029D1 12 20 9B         [24] 2944 	lcall	_putchar
      0029D4 D0 07            [24] 2945 	pop	ar7
                           00093B  2946 	C$LCD_Driver.c$530$3_0$160 ==.
                                   2947 ;	LCD_Driver.c:530: count++;
      0029D6 90 04 39         [24] 2948 	mov	dptr,#_get_binary_row_count_65536_157
      0029D9 EF               [12] 2949 	mov	a,r7
      0029DA 04               [12] 2950 	inc	a
      0029DB F0               [24] 2951 	movx	@dptr,a
      0029DC 80 A6            [24] 2952 	sjmp	00112$
      0029DE                       2953 00107$:
                           000943  2954 	C$LCD_Driver.c$532$2_0$158 ==.
                                   2955 ;	LCD_Driver.c:532: else if (c == '\b' || c == 0x7F) { // Backspace
      0029DE BD 08 02         [24] 2956 	cjne	r5,#0x08,00166$
      0029E1 80 03            [24] 2957 	sjmp	00103$
      0029E3                       2958 00166$:
      0029E3 BD 7F 9E         [24] 2959 	cjne	r5,#0x7f,00112$
      0029E6                       2960 00103$:
                           00094B  2961 	C$LCD_Driver.c$533$3_0$161 ==.
                                   2962 ;	LCD_Driver.c:533: if (count > 0) {
      0029E6 90 04 39         [24] 2963 	mov	dptr,#_get_binary_row_count_65536_157
      0029E9 E0               [24] 2964 	movx	a,@dptr
      0029EA FF               [12] 2965 	mov	r7,a
      0029EB E0               [24] 2966 	movx	a,@dptr
      0029EC 70 03            [24] 2967 	jnz	00169$
      0029EE 02 29 84         [24] 2968 	ljmp	00112$
      0029F1                       2969 00169$:
                           000956  2970 	C$LCD_Driver.c$534$4_0$162 ==.
                                   2971 ;	LCD_Driver.c:534: count--;
      0029F1 EF               [12] 2972 	mov	a,r7
      0029F2 14               [12] 2973 	dec	a
      0029F3 90 04 39         [24] 2974 	mov	dptr,#_get_binary_row_count_65536_157
      0029F6 F0               [24] 2975 	movx	@dptr,a
                           00095C  2976 	C$LCD_Driver.c$536$4_0$162 ==.
                                   2977 ;	LCD_Driver.c:536: putchar('\b');
      0029F7 90 00 08         [24] 2978 	mov	dptr,#0x0008
      0029FA 12 20 9B         [24] 2979 	lcall	_putchar
                           000962  2980 	C$LCD_Driver.c$537$4_0$162 ==.
                                   2981 ;	LCD_Driver.c:537: putchar(' ');
      0029FD 90 00 20         [24] 2982 	mov	dptr,#0x0020
      002A00 12 20 9B         [24] 2983 	lcall	_putchar
                           000968  2984 	C$LCD_Driver.c$538$4_0$162 ==.
                                   2985 ;	LCD_Driver.c:538: putchar('\b');
      002A03 90 00 08         [24] 2986 	mov	dptr,#0x0008
      002A06 12 20 9B         [24] 2987 	lcall	_putchar
      002A09 02 29 84         [24] 2988 	ljmp	00112$
                           000971  2989 	C$LCD_Driver.c$544$1_0$157 ==.
                                   2990 ;	LCD_Driver.c:544: for (uint8_t i = 0; i < 5; i++) {
      002A0C                       2991 00131$:
      002A0C 7F 00            [12] 2992 	mov	r7,#0x00
      002A0E                       2993 00119$:
      002A0E BF 05 00         [24] 2994 	cjne	r7,#0x05,00170$
      002A11                       2995 00170$:
      002A11 50 2C            [24] 2996 	jnc	00117$
                           000978  2997 	C$LCD_Driver.c$545$3_0$164 ==.
                                   2998 ;	LCD_Driver.c:545: if (bits[i] == '1') {
      002A13 EF               [12] 2999 	mov	a,r7
      002A14 24 33            [12] 3000 	add	a,#_get_binary_row_bits_65536_157
      002A16 F5 82            [12] 3001 	mov	dpl,a
      002A18 E4               [12] 3002 	clr	a
      002A19 34 04            [12] 3003 	addc	a,#(_get_binary_row_bits_65536_157 >> 8)
      002A1B F5 83            [12] 3004 	mov	dph,a
      002A1D E0               [24] 3005 	movx	a,@dptr
      002A1E FE               [12] 3006 	mov	r6,a
      002A1F BE 31 1A         [24] 3007 	cjne	r6,#0x31,00120$
                           000987  3008 	C$LCD_Driver.c$546$4_0$165 ==.
                                   3009 ;	LCD_Driver.c:546: result |= (1 << (4 - i)); // MSB first (leftmost bit = bit 4)
      002A22 8F 06            [24] 3010 	mov	ar6,r7
      002A24 74 04            [12] 3011 	mov	a,#0x04
      002A26 C3               [12] 3012 	clr	c
      002A27 9E               [12] 3013 	subb	a,r6
      002A28 F5 F0            [12] 3014 	mov	b,a
      002A2A 05 F0            [12] 3015 	inc	b
      002A2C 74 01            [12] 3016 	mov	a,#0x01
      002A2E 80 02            [24] 3017 	sjmp	00176$
      002A30                       3018 00174$:
      002A30 25 E0            [12] 3019 	add	a,acc
      002A32                       3020 00176$:
      002A32 D5 F0 FB         [24] 3021 	djnz	b,00174$
      002A35 FE               [12] 3022 	mov	r6,a
      002A36 90 04 3A         [24] 3023 	mov	dptr,#_get_binary_row_result_65536_157
      002A39 E0               [24] 3024 	movx	a,@dptr
      002A3A 4E               [12] 3025 	orl	a,r6
      002A3B F0               [24] 3026 	movx	@dptr,a
      002A3C                       3027 00120$:
                           0009A1  3028 	C$LCD_Driver.c$544$2_0$163 ==.
                                   3029 ;	LCD_Driver.c:544: for (uint8_t i = 0; i < 5; i++) {
      002A3C 0F               [12] 3030 	inc	r7
      002A3D 80 CF            [24] 3031 	sjmp	00119$
      002A3F                       3032 00117$:
                           0009A4  3033 	C$LCD_Driver.c$550$1_0$157 ==.
                                   3034 ;	LCD_Driver.c:550: return result;
      002A3F 90 04 3A         [24] 3035 	mov	dptr,#_get_binary_row_result_65536_157
      002A42 E0               [24] 3036 	movx	a,@dptr
                           0009A8  3037 	C$LCD_Driver.c$551$1_0$157 ==.
                                   3038 ;	LCD_Driver.c:551: }
                           0009A8  3039 	C$LCD_Driver.c$551$1_0$157 ==.
                           0009A8  3040 	XG$get_binary_row$0$0 ==.
      002A43 F5 82            [12] 3041 	mov	dpl,a
      002A45 22               [24] 3042 	ret
                                   3043 ;------------------------------------------------------------
                                   3044 ;Allocation info for local variables in function 'lcdcreatechar'
                                   3045 ;------------------------------------------------------------
                                   3046 ;row_vals                  Allocated with name '_lcdcreatechar_PARM_2'
                                   3047 ;ccode                     Allocated with name '_lcdcreatechar_ccode_65536_166'
                                   3048 ;i                         Allocated with name '_lcdcreatechar_i_65537_168'
                                   3049 ;------------------------------------------------------------
                           0009AB  3050 	G$lcdcreatechar$0$0 ==.
                           0009AB  3051 	C$LCD_Driver.c$553$1_0$167 ==.
                                   3052 ;	LCD_Driver.c:553: void lcdcreatechar(unsigned char ccode, unsigned char row_vals[]) {
                                   3053 ;	-----------------------------------------
                                   3054 ;	 function lcdcreatechar
                                   3055 ;	-----------------------------------------
      002A46                       3056 _lcdcreatechar:
      002A46 E5 82            [12] 3057 	mov	a,dpl
      002A48 90 04 3E         [24] 3058 	mov	dptr,#_lcdcreatechar_ccode_65536_166
      002A4B F0               [24] 3059 	movx	@dptr,a
                           0009B1  3060 	C$LCD_Driver.c$555$1_0$167 ==.
                                   3061 ;	LCD_Driver.c:555: save_cursor_position();
      002A4C 12 27 7D         [24] 3062 	lcall	_save_cursor_position
                           0009B4  3063 	C$LCD_Driver.c$558$3_1$170 ==.
                                   3064 ;	LCD_Driver.c:558: for(i = 0; i < 8; i++) {
      002A4F 90 04 3E         [24] 3065 	mov	dptr,#_lcdcreatechar_ccode_65536_166
      002A52 E0               [24] 3066 	movx	a,@dptr
      002A53 FF               [12] 3067 	mov	r7,a
      002A54 90 04 3B         [24] 3068 	mov	dptr,#_lcdcreatechar_PARM_2
      002A57 E0               [24] 3069 	movx	a,@dptr
      002A58 FC               [12] 3070 	mov	r4,a
      002A59 A3               [24] 3071 	inc	dptr
      002A5A E0               [24] 3072 	movx	a,@dptr
      002A5B FD               [12] 3073 	mov	r5,a
      002A5C A3               [24] 3074 	inc	dptr
      002A5D E0               [24] 3075 	movx	a,@dptr
      002A5E FE               [12] 3076 	mov	r6,a
      002A5F 7B 00            [12] 3077 	mov	r3,#0x00
      002A61                       3078 00102$:
                           0009C6  3079 	C$LCD_Driver.c$559$3_1$170 ==.
                                   3080 ;	LCD_Driver.c:559: lcd_cmd(0x40 | (ccode << 3) | i); // bits: 0 + 1 + ccode + row number
      002A61 8F 02            [24] 3081 	mov	ar2,r7
      002A63 EA               [12] 3082 	mov	a,r2
      002A64 C4               [12] 3083 	swap	a
      002A65 03               [12] 3084 	rr	a
      002A66 54 F8            [12] 3085 	anl	a,#0xf8
      002A68 FA               [12] 3086 	mov	r2,a
      002A69 74 40            [12] 3087 	mov	a,#0x40
      002A6B 4A               [12] 3088 	orl	a,r2
      002A6C 4B               [12] 3089 	orl	a,r3
      002A6D F5 82            [12] 3090 	mov	dpl,a
      002A6F C0 07            [24] 3091 	push	ar7
      002A71 C0 06            [24] 3092 	push	ar6
      002A73 C0 05            [24] 3093 	push	ar5
      002A75 C0 04            [24] 3094 	push	ar4
      002A77 C0 03            [24] 3095 	push	ar3
      002A79 12 21 5E         [24] 3096 	lcall	_lcd_cmd
      002A7C D0 03            [24] 3097 	pop	ar3
      002A7E D0 04            [24] 3098 	pop	ar4
      002A80 D0 05            [24] 3099 	pop	ar5
      002A82 D0 06            [24] 3100 	pop	ar6
                           0009E9  3101 	C$LCD_Driver.c$560$3_1$170 ==.
                                   3102 ;	LCD_Driver.c:560: lcdputch(row_vals[i]); // Send row data
      002A84 EB               [12] 3103 	mov	a,r3
      002A85 2C               [12] 3104 	add	a,r4
      002A86 F8               [12] 3105 	mov	r0,a
      002A87 E4               [12] 3106 	clr	a
      002A88 3D               [12] 3107 	addc	a,r5
      002A89 F9               [12] 3108 	mov	r1,a
      002A8A 8E 02            [24] 3109 	mov	ar2,r6
      002A8C 88 82            [24] 3110 	mov	dpl,r0
      002A8E 89 83            [24] 3111 	mov	dph,r1
      002A90 8A F0            [24] 3112 	mov	b,r2
      002A92 12 40 D4         [24] 3113 	lcall	__gptrget
      002A95 F5 82            [12] 3114 	mov	dpl,a
      002A97 C0 06            [24] 3115 	push	ar6
      002A99 C0 05            [24] 3116 	push	ar5
      002A9B C0 04            [24] 3117 	push	ar4
      002A9D C0 03            [24] 3118 	push	ar3
      002A9F 12 21 79         [24] 3119 	lcall	_lcdputch
      002AA2 D0 03            [24] 3120 	pop	ar3
      002AA4 D0 04            [24] 3121 	pop	ar4
      002AA6 D0 05            [24] 3122 	pop	ar5
      002AA8 D0 06            [24] 3123 	pop	ar6
      002AAA D0 07            [24] 3124 	pop	ar7
                           000A11  3125 	C$LCD_Driver.c$558$2_1$169 ==.
                                   3126 ;	LCD_Driver.c:558: for(i = 0; i < 8; i++) {
      002AAC 0B               [12] 3127 	inc	r3
      002AAD BB 08 00         [24] 3128 	cjne	r3,#0x08,00115$
      002AB0                       3129 00115$:
      002AB0 40 AF            [24] 3130 	jc	00102$
                           000A17  3131 	C$LCD_Driver.c$563$1_1$168 ==.
                                   3132 ;	LCD_Driver.c:563: restore_cursor_position();
      002AB2 12 27 94         [24] 3133 	lcall	_restore_cursor_position
                           000A1A  3134 	C$LCD_Driver.c$564$1_1$167 ==.
                                   3135 ;	LCD_Driver.c:564: }
                           000A1A  3136 	C$LCD_Driver.c$564$1_1$167 ==.
                           000A1A  3137 	XG$lcdcreatechar$0$0 ==.
      002AB5 22               [24] 3138 	ret
                                   3139 ;------------------------------------------------------------
                                   3140 ;Allocation info for local variables in function 'let_user_create_char'
                                   3141 ;------------------------------------------------------------
                                   3142 ;ccode                     Allocated with name '_let_user_create_char_ccode_65537_173'
                                   3143 ;row_vals                  Allocated with name '_let_user_create_char_row_vals_65538_175'
                                   3144 ;i                         Allocated with name '_let_user_create_char_i_131074_176'
                                   3145 ;prompt                    Allocated with name '_let_user_create_char_prompt_196610_177'
                                   3146 ;------------------------------------------------------------
                           000A1B  3147 	G$let_user_create_char$0$0 ==.
                           000A1B  3148 	C$LCD_Driver.c$566$1_1$172 ==.
                                   3149 ;	LCD_Driver.c:566: void let_user_create_char(void) {
                                   3150 ;	-----------------------------------------
                                   3151 ;	 function let_user_create_char
                                   3152 ;	-----------------------------------------
      002AB6                       3153 _let_user_create_char:
                           000A1B  3154 	C$LCD_Driver.c$568$1_0$172 ==.
                                   3155 ;	LCD_Driver.c:568: putstr("Enter custom character code (0-7): ");
      002AB6 90 40 FB         [24] 3156 	mov	dptr,#___str_1
      002AB9 75 F0 80         [24] 3157 	mov	b,#0x80
      002ABC 12 20 C8         [24] 3158 	lcall	_putstr
                           000A24  3159 	C$LCD_Driver.c$569$1_1$173 ==.
                                   3160 ;	LCD_Driver.c:569: uint8_t ccode = (uint8_t)get_number();
      002ABF 12 25 E9         [24] 3161 	lcall	_get_number
                           000A27  3162 	C$LCD_Driver.c$571$1_1$173 ==.
                                   3163 ;	LCD_Driver.c:571: if (ccode > 7) {
      002AC2 E5 82            [12] 3164 	mov	a,dpl
      002AC4 FE               [12] 3165 	mov	r6,a
      002AC5 24 F8            [12] 3166 	add	a,#0xff - 0x07
      002AC7 50 0C            [24] 3167 	jnc	00102$
                           000A2E  3168 	C$LCD_Driver.c$572$2_1$174 ==.
                                   3169 ;	LCD_Driver.c:572: putstr("Error: Custom character code must be between 0 and 7.\n\r");
      002AC9 90 41 1F         [24] 3170 	mov	dptr,#___str_2
      002ACC 75 F0 80         [24] 3171 	mov	b,#0x80
      002ACF 12 20 C8         [24] 3172 	lcall	_putstr
                           000A37  3173 	C$LCD_Driver.c$573$2_1$174 ==.
                                   3174 ;	LCD_Driver.c:573: return;
      002AD2 02 2B 6C         [24] 3175 	ljmp	00107$
      002AD5                       3176 00102$:
                           000A3A  3177 	C$LCD_Driver.c$578$1_2$175 ==.
                                   3178 ;	LCD_Driver.c:578: putstr("Enter 5 bits per row (0 or 1), press Enter after each row:\n\r");
      002AD5 90 41 57         [24] 3179 	mov	dptr,#___str_3
      002AD8 75 F0 80         [24] 3180 	mov	b,#0x80
      002ADB C0 06            [24] 3181 	push	ar6
      002ADD 12 20 C8         [24] 3182 	lcall	_putstr
      002AE0 D0 06            [24] 3183 	pop	ar6
                           000A47  3184 	C$LCD_Driver.c$580$3_2$177 ==.
                                   3185 ;	LCD_Driver.c:580: for (uint8_t i = 0; i < 8; i++) {
      002AE2 7F 00            [12] 3186 	mov	r7,#0x00
      002AE4                       3187 00105$:
      002AE4 BF 08 00         [24] 3188 	cjne	r7,#0x08,00123$
      002AE7                       3189 00123$:
      002AE7 50 68            [24] 3190 	jnc	00103$
                           000A4E  3191 	C$LCD_Driver.c$582$3_2$177 ==.
                                   3192 ;	LCD_Driver.c:582: sprintf(prompt, "Row %d: ", i);
      002AE9 8F 04            [24] 3193 	mov	ar4,r7
      002AEB 7D 00            [12] 3194 	mov	r5,#0x00
      002AED C0 07            [24] 3195 	push	ar7
      002AEF C0 06            [24] 3196 	push	ar6
      002AF1 C0 04            [24] 3197 	push	ar4
      002AF3 C0 05            [24] 3198 	push	ar5
      002AF5 74 94            [12] 3199 	mov	a,#___str_4
      002AF7 C0 E0            [24] 3200 	push	acc
      002AF9 74 41            [12] 3201 	mov	a,#(___str_4 >> 8)
      002AFB C0 E0            [24] 3202 	push	acc
      002AFD 74 80            [12] 3203 	mov	a,#0x80
      002AFF C0 E0            [24] 3204 	push	acc
      002B01 74 47            [12] 3205 	mov	a,#_let_user_create_char_prompt_196610_177
      002B03 C0 E0            [24] 3206 	push	acc
      002B05 74 04            [12] 3207 	mov	a,#(_let_user_create_char_prompt_196610_177 >> 8)
      002B07 C0 E0            [24] 3208 	push	acc
      002B09 E4               [12] 3209 	clr	a
      002B0A C0 E0            [24] 3210 	push	acc
      002B0C 12 35 FE         [24] 3211 	lcall	_sprintf
      002B0F E5 81            [12] 3212 	mov	a,sp
      002B11 24 F8            [12] 3213 	add	a,#0xf8
      002B13 F5 81            [12] 3214 	mov	sp,a
                           000A7A  3215 	C$LCD_Driver.c$583$3_2$177 ==.
                                   3216 ;	LCD_Driver.c:583: putstr(prompt);
      002B15 90 04 47         [24] 3217 	mov	dptr,#_let_user_create_char_prompt_196610_177
      002B18 75 F0 00         [24] 3218 	mov	b,#0x00
      002B1B 12 20 C8         [24] 3219 	lcall	_putstr
      002B1E D0 06            [24] 3220 	pop	ar6
      002B20 D0 07            [24] 3221 	pop	ar7
                           000A87  3222 	C$LCD_Driver.c$585$3_2$177 ==.
                                   3223 ;	LCD_Driver.c:585: row_vals[i] = get_binary_row(); // this also shows visual preview as you type
      002B22 EF               [12] 3224 	mov	a,r7
      002B23 24 3F            [12] 3225 	add	a,#_let_user_create_char_row_vals_65538_175
      002B25 FC               [12] 3226 	mov	r4,a
      002B26 E4               [12] 3227 	clr	a
      002B27 34 04            [12] 3228 	addc	a,#(_let_user_create_char_row_vals_65538_175 >> 8)
      002B29 FD               [12] 3229 	mov	r5,a
      002B2A C0 07            [24] 3230 	push	ar7
      002B2C C0 06            [24] 3231 	push	ar6
      002B2E C0 05            [24] 3232 	push	ar5
      002B30 C0 04            [24] 3233 	push	ar4
      002B32 12 29 7B         [24] 3234 	lcall	_get_binary_row
      002B35 AB 82            [24] 3235 	mov	r3,dpl
      002B37 D0 04            [24] 3236 	pop	ar4
      002B39 D0 05            [24] 3237 	pop	ar5
      002B3B 8C 82            [24] 3238 	mov	dpl,r4
      002B3D 8D 83            [24] 3239 	mov	dph,r5
      002B3F EB               [12] 3240 	mov	a,r3
      002B40 F0               [24] 3241 	movx	@dptr,a
                           000AA6  3242 	C$LCD_Driver.c$586$3_2$177 ==.
                                   3243 ;	LCD_Driver.c:586: putstr("\n\r");
      002B41 90 40 F8         [24] 3244 	mov	dptr,#___str_0
      002B44 75 F0 80         [24] 3245 	mov	b,#0x80
      002B47 12 20 C8         [24] 3246 	lcall	_putstr
      002B4A D0 06            [24] 3247 	pop	ar6
      002B4C D0 07            [24] 3248 	pop	ar7
                           000AB3  3249 	C$LCD_Driver.c$580$2_2$176 ==.
                                   3250 ;	LCD_Driver.c:580: for (uint8_t i = 0; i < 8; i++) {
      002B4E 0F               [12] 3251 	inc	r7
      002B4F 80 93            [24] 3252 	sjmp	00105$
      002B51                       3253 00103$:
                           000AB6  3254 	C$LCD_Driver.c$590$1_2$175 ==.
                                   3255 ;	LCD_Driver.c:590: lcdcreatechar(ccode, row_vals);
      002B51 90 04 3B         [24] 3256 	mov	dptr,#_lcdcreatechar_PARM_2
      002B54 74 3F            [12] 3257 	mov	a,#_let_user_create_char_row_vals_65538_175
      002B56 F0               [24] 3258 	movx	@dptr,a
      002B57 74 04            [12] 3259 	mov	a,#(_let_user_create_char_row_vals_65538_175 >> 8)
      002B59 A3               [24] 3260 	inc	dptr
      002B5A F0               [24] 3261 	movx	@dptr,a
      002B5B E4               [12] 3262 	clr	a
      002B5C A3               [24] 3263 	inc	dptr
      002B5D F0               [24] 3264 	movx	@dptr,a
      002B5E 8E 82            [24] 3265 	mov	dpl,r6
      002B60 12 2A 46         [24] 3266 	lcall	_lcdcreatechar
                           000AC8  3267 	C$LCD_Driver.c$591$1_2$175 ==.
                                   3268 ;	LCD_Driver.c:591: putstr("Custom character made :) \n\r");
      002B63 90 41 9D         [24] 3269 	mov	dptr,#___str_5
      002B66 75 F0 80         [24] 3270 	mov	b,#0x80
      002B69 12 20 C8         [24] 3271 	lcall	_putstr
      002B6C                       3272 00107$:
                           000AD1  3273 	C$LCD_Driver.c$592$1_2$172 ==.
                                   3274 ;	LCD_Driver.c:592: }
                           000AD1  3275 	C$LCD_Driver.c$592$1_2$172 ==.
                           000AD1  3276 	XG$let_user_create_char$0$0 ==.
      002B6C 22               [24] 3277 	ret
                                   3278 ;------------------------------------------------------------
                                   3279 ;Allocation info for local variables in function 'hex_dump_ddram'
                                   3280 ;------------------------------------------------------------
                                   3281 ;row                       Allocated with name '_hex_dump_ddram_row_131072_180'
                                   3282 ;header                    Allocated with name '_hex_dump_ddram_header_196609_182'
                                   3283 ;col                       Allocated with name '_hex_dump_ddram_col_262145_183'
                                   3284 ;data                      Allocated with name '_hex_dump_ddram_data_327682_185'
                                   3285 ;buf                       Allocated with name '_hex_dump_ddram_buf_327682_185'
                                   3286 ;------------------------------------------------------------
                           000AD2  3287 	G$hex_dump_ddram$0$0 ==.
                           000AD2  3288 	C$LCD_Driver.c$594$1_2$179 ==.
                                   3289 ;	LCD_Driver.c:594: void hex_dump_ddram(void) {
                                   3290 ;	-----------------------------------------
                                   3291 ;	 function hex_dump_ddram
                                   3292 ;	-----------------------------------------
      002B6D                       3293 _hex_dump_ddram:
                           000AD2  3294 	C$LCD_Driver.c$595$1_0$179 ==.
                                   3295 ;	LCD_Driver.c:595: putstr("\n\rLCD DDRAM HEX DUMP\n\r");
      002B6D 90 41 B9         [24] 3296 	mov	dptr,#___str_6
      002B70 75 F0 80         [24] 3297 	mov	b,#0x80
      002B73 12 20 C8         [24] 3298 	lcall	_putstr
                           000ADB  3299 	C$LCD_Driver.c$596$1_0$179 ==.
                                   3300 ;	LCD_Driver.c:596: putstr("[Row] [Address]: Data (16 bytes per row)\n\r");
      002B76 90 41 D0         [24] 3301 	mov	dptr,#___str_7
      002B79 75 F0 80         [24] 3302 	mov	b,#0x80
      002B7C 12 20 C8         [24] 3303 	lcall	_putstr
                           000AE4  3304 	C$LCD_Driver.c$597$1_0$179 ==.
                                   3305 ;	LCD_Driver.c:597: putstr("------------------------------------------------\n\r");
      002B7F 90 41 FB         [24] 3306 	mov	dptr,#___str_8
      002B82 75 F0 80         [24] 3307 	mov	b,#0x80
      002B85 12 20 C8         [24] 3308 	lcall	_putstr
                           000AED  3309 	C$LCD_Driver.c$599$1_0$179 ==.
                                   3310 ;	LCD_Driver.c:599: save_cursor_position();
      002B88 12 27 7D         [24] 3311 	lcall	_save_cursor_position
                           000AF0  3312 	C$LCD_Driver.c$601$3_0$181 ==.
                                   3313 ;	LCD_Driver.c:601: for(uint8_t row = 0; row < MAX_ROWS; row++) {
      002B8B 7F 00            [12] 3314 	mov	r7,#0x00
      002B8D                       3315 00107$:
      002B8D BF 04 00         [24] 3316 	cjne	r7,#0x04,00129$
      002B90                       3317 00129$:
      002B90 40 03            [24] 3318 	jc	00130$
      002B92 02 2C 75         [24] 3319 	ljmp	00102$
      002B95                       3320 00130$:
                           000AFA  3321 	C$LCD_Driver.c$603$3_0$181 ==.
                                   3322 ;	LCD_Driver.c:603: lcdgotoaddr(row_addresses[row]);
      002B95 EF               [12] 3323 	mov	a,r7
      002B96 24 F4            [12] 3324 	add	a,#_row_addresses
      002B98 FD               [12] 3325 	mov	r5,a
      002B99 E4               [12] 3326 	clr	a
      002B9A 34 40            [12] 3327 	addc	a,#(_row_addresses >> 8)
      002B9C FE               [12] 3328 	mov	r6,a
      002B9D 8D 82            [24] 3329 	mov	dpl,r5
      002B9F 8E 83            [24] 3330 	mov	dph,r6
      002BA1 E4               [12] 3331 	clr	a
      002BA2 93               [24] 3332 	movc	a,@a+dptr
      002BA3 F5 82            [12] 3333 	mov	dpl,a
      002BA5 C0 07            [24] 3334 	push	ar7
      002BA7 C0 06            [24] 3335 	push	ar6
      002BA9 C0 05            [24] 3336 	push	ar5
      002BAB 12 21 CF         [24] 3337 	lcall	_lcdgotoaddr
      002BAE D0 05            [24] 3338 	pop	ar5
      002BB0 D0 06            [24] 3339 	pop	ar6
      002BB2 D0 07            [24] 3340 	pop	ar7
                           000B19  3341 	C$LCD_Driver.c$606$3_1$182 ==.
                                   3342 ;	LCD_Driver.c:606: sprintf(header, "Row %d [0x%02X]:\n\r", row, row_addresses[row]);
      002BB4 8D 82            [24] 3343 	mov	dpl,r5
      002BB6 8E 83            [24] 3344 	mov	dph,r6
      002BB8 E4               [12] 3345 	clr	a
      002BB9 93               [24] 3346 	movc	a,@a+dptr
      002BBA FC               [12] 3347 	mov	r4,a
      002BBB 7B 00            [12] 3348 	mov	r3,#0x00
      002BBD 8F 01            [24] 3349 	mov	ar1,r7
      002BBF 7A 00            [12] 3350 	mov	r2,#0x00
      002BC1 C0 07            [24] 3351 	push	ar7
      002BC3 C0 06            [24] 3352 	push	ar6
      002BC5 C0 05            [24] 3353 	push	ar5
      002BC7 C0 04            [24] 3354 	push	ar4
      002BC9 C0 03            [24] 3355 	push	ar3
      002BCB C0 01            [24] 3356 	push	ar1
      002BCD C0 02            [24] 3357 	push	ar2
      002BCF 74 2E            [12] 3358 	mov	a,#___str_9
      002BD1 C0 E0            [24] 3359 	push	acc
      002BD3 74 42            [12] 3360 	mov	a,#(___str_9 >> 8)
      002BD5 C0 E0            [24] 3361 	push	acc
      002BD7 74 80            [12] 3362 	mov	a,#0x80
      002BD9 C0 E0            [24] 3363 	push	acc
      002BDB 74 65            [12] 3364 	mov	a,#_hex_dump_ddram_header_196609_182
      002BDD C0 E0            [24] 3365 	push	acc
      002BDF 74 04            [12] 3366 	mov	a,#(_hex_dump_ddram_header_196609_182 >> 8)
      002BE1 C0 E0            [24] 3367 	push	acc
      002BE3 E4               [12] 3368 	clr	a
      002BE4 C0 E0            [24] 3369 	push	acc
      002BE6 12 35 FE         [24] 3370 	lcall	_sprintf
      002BE9 E5 81            [12] 3371 	mov	a,sp
      002BEB 24 F6            [12] 3372 	add	a,#0xf6
      002BED F5 81            [12] 3373 	mov	sp,a
                           000B54  3374 	C$LCD_Driver.c$607$3_1$182 ==.
                                   3375 ;	LCD_Driver.c:607: putstr(header);
      002BEF 90 04 65         [24] 3376 	mov	dptr,#_hex_dump_ddram_header_196609_182
      002BF2 75 F0 00         [24] 3377 	mov	b,#0x00
      002BF5 12 20 C8         [24] 3378 	lcall	_putstr
      002BF8 D0 05            [24] 3379 	pop	ar5
      002BFA D0 06            [24] 3380 	pop	ar6
      002BFC D0 07            [24] 3381 	pop	ar7
                           000B63  3382 	C$LCD_Driver.c$610$5_1$184 ==.
                                   3383 ;	LCD_Driver.c:610: for(uint8_t col = 0; col < MAX_COLS; col++) {
      002BFE 7C 00            [12] 3384 	mov	r4,#0x00
      002C00                       3385 00104$:
      002C00 BC 10 00         [24] 3386 	cjne	r4,#0x10,00131$
      002C03                       3387 00131$:
      002C03 50 5F            [24] 3388 	jnc	00101$
                           000B6A  3389 	C$LCD_Driver.c$611$5_1$184 ==.
                                   3390 ;	LCD_Driver.c:611: lcdgotoaddr(row_addresses[row] + col);
      002C05 8D 82            [24] 3391 	mov	dpl,r5
      002C07 8E 83            [24] 3392 	mov	dph,r6
      002C09 E4               [12] 3393 	clr	a
      002C0A 93               [24] 3394 	movc	a,@a+dptr
      002C0B 2C               [12] 3395 	add	a,r4
      002C0C F5 82            [12] 3396 	mov	dpl,a
      002C0E C0 07            [24] 3397 	push	ar7
      002C10 C0 06            [24] 3398 	push	ar6
      002C12 C0 05            [24] 3399 	push	ar5
      002C14 C0 04            [24] 3400 	push	ar4
      002C16 12 21 CF         [24] 3401 	lcall	_lcdgotoaddr
                           000B7E  3402 	C$LCD_Driver.c$612$5_1$184 ==.
                                   3403 ;	LCD_Driver.c:612: lcdbusywait();
      002C19 12 21 3E         [24] 3404 	lcall	_lcdbusywait
                           000B81  3405 	C$LCD_Driver.c$613$5_2$185 ==.
                                   3406 ;	LCD_Driver.c:613: uint8_t data = *lcd_read_ptr;
      002C1C 90 05 4C         [24] 3407 	mov	dptr,#_lcd_read_ptr
      002C1F E0               [24] 3408 	movx	a,@dptr
      002C20 FA               [12] 3409 	mov	r2,a
      002C21 A3               [24] 3410 	inc	dptr
      002C22 E0               [24] 3411 	movx	a,@dptr
      002C23 FB               [12] 3412 	mov	r3,a
      002C24 8A 82            [24] 3413 	mov	dpl,r2
      002C26 8B 83            [24] 3414 	mov	dph,r3
      002C28 E0               [24] 3415 	movx	a,@dptr
      002C29 FA               [12] 3416 	mov	r2,a
                           000B8F  3417 	C$LCD_Driver.c$617$5_2$185 ==.
                                   3418 ;	LCD_Driver.c:617: sprintf(buf, "0x%02X ", data);
      002C2A 7B 00            [12] 3419 	mov	r3,#0x00
      002C2C C0 02            [24] 3420 	push	ar2
      002C2E C0 03            [24] 3421 	push	ar3
      002C30 74 41            [12] 3422 	mov	a,#___str_10
      002C32 C0 E0            [24] 3423 	push	acc
      002C34 74 42            [12] 3424 	mov	a,#(___str_10 >> 8)
      002C36 C0 E0            [24] 3425 	push	acc
      002C38 74 80            [12] 3426 	mov	a,#0x80
      002C3A C0 E0            [24] 3427 	push	acc
      002C3C 74 79            [12] 3428 	mov	a,#_hex_dump_ddram_buf_327682_185
      002C3E C0 E0            [24] 3429 	push	acc
      002C40 74 04            [12] 3430 	mov	a,#(_hex_dump_ddram_buf_327682_185 >> 8)
      002C42 C0 E0            [24] 3431 	push	acc
      002C44 E4               [12] 3432 	clr	a
      002C45 C0 E0            [24] 3433 	push	acc
      002C47 12 35 FE         [24] 3434 	lcall	_sprintf
      002C4A E5 81            [12] 3435 	mov	a,sp
      002C4C 24 F8            [12] 3436 	add	a,#0xf8
      002C4E F5 81            [12] 3437 	mov	sp,a
                           000BB5  3438 	C$LCD_Driver.c$618$5_2$185 ==.
                                   3439 ;	LCD_Driver.c:618: putstr(buf);
      002C50 90 04 79         [24] 3440 	mov	dptr,#_hex_dump_ddram_buf_327682_185
      002C53 75 F0 00         [24] 3441 	mov	b,#0x00
      002C56 12 20 C8         [24] 3442 	lcall	_putstr
      002C59 D0 04            [24] 3443 	pop	ar4
      002C5B D0 05            [24] 3444 	pop	ar5
      002C5D D0 06            [24] 3445 	pop	ar6
      002C5F D0 07            [24] 3446 	pop	ar7
                           000BC6  3447 	C$LCD_Driver.c$610$4_1$183 ==.
                                   3448 ;	LCD_Driver.c:610: for(uint8_t col = 0; col < MAX_COLS; col++) {
      002C61 0C               [12] 3449 	inc	r4
      002C62 80 9C            [24] 3450 	sjmp	00104$
      002C64                       3451 00101$:
                           000BC9  3452 	C$LCD_Driver.c$620$3_1$182 ==.
                                   3453 ;	LCD_Driver.c:620: putstr("\n\r\n\r");
      002C64 90 42 49         [24] 3454 	mov	dptr,#___str_11
      002C67 75 F0 80         [24] 3455 	mov	b,#0x80
      002C6A C0 07            [24] 3456 	push	ar7
      002C6C 12 20 C8         [24] 3457 	lcall	_putstr
      002C6F D0 07            [24] 3458 	pop	ar7
                           000BD6  3459 	C$LCD_Driver.c$601$2_0$180 ==.
                                   3460 ;	LCD_Driver.c:601: for(uint8_t row = 0; row < MAX_ROWS; row++) {
      002C71 0F               [12] 3461 	inc	r7
      002C72 02 2B 8D         [24] 3462 	ljmp	00107$
      002C75                       3463 00102$:
                           000BDA  3464 	C$LCD_Driver.c$623$1_0$179 ==.
                                   3465 ;	LCD_Driver.c:623: restore_cursor_position();
      002C75 12 27 94         [24] 3466 	lcall	_restore_cursor_position
                           000BDD  3467 	C$LCD_Driver.c$624$1_0$179 ==.
                                   3468 ;	LCD_Driver.c:624: }
                           000BDD  3469 	C$LCD_Driver.c$624$1_0$179 ==.
                           000BDD  3470 	XG$hex_dump_ddram$0$0 ==.
      002C78 22               [24] 3471 	ret
                                   3472 ;------------------------------------------------------------
                                   3473 ;Allocation info for local variables in function 'hex_dump_cgram'
                                   3474 ;------------------------------------------------------------
                                   3475 ;sloc0                     Allocated with name '_hex_dump_cgram_sloc0_1_0'
                                   3476 ;sloc1                     Allocated with name '_hex_dump_cgram_sloc1_1_0'
                                   3477 ;char_code                 Allocated with name '_hex_dump_cgram_char_code_131072_188'
                                   3478 ;row                       Allocated with name '_hex_dump_cgram_row_262144_190'
                                   3479 ;cgram_addr                Allocated with name '_hex_dump_cgram_cgram_addr_327680_191'
                                   3480 ;pattern                   Allocated with name '_hex_dump_cgram_pattern_327681_192'
                                   3481 ;buf                       Allocated with name '_hex_dump_cgram_buf_327681_192'
                                   3482 ;bit                       Allocated with name '_hex_dump_cgram_bit_393217_193'
                                   3483 ;------------------------------------------------------------
                           000BDE  3484 	G$hex_dump_cgram$0$0 ==.
                           000BDE  3485 	C$LCD_Driver.c$626$1_0$187 ==.
                                   3486 ;	LCD_Driver.c:626: void hex_dump_cgram(void) {
                                   3487 ;	-----------------------------------------
                                   3488 ;	 function hex_dump_cgram
                                   3489 ;	-----------------------------------------
      002C79                       3490 _hex_dump_cgram:
                           000BDE  3491 	C$LCD_Driver.c$627$1_0$187 ==.
                                   3492 ;	LCD_Driver.c:627: putstr("LCD CGRAM HEX DUMP\n\r");
      002C79 90 42 4E         [24] 3493 	mov	dptr,#___str_12
      002C7C 75 F0 80         [24] 3494 	mov	b,#0x80
      002C7F 12 20 C8         [24] 3495 	lcall	_putstr
                           000BE7  3496 	C$LCD_Driver.c$628$1_0$187 ==.
                                   3497 ;	LCD_Driver.c:628: putstr("[Char] [Row]: Data (8 characters x 8 rows each)\n\r");
      002C82 90 42 63         [24] 3498 	mov	dptr,#___str_13
      002C85 75 F0 80         [24] 3499 	mov	b,#0x80
      002C88 12 20 C8         [24] 3500 	lcall	_putstr
                           000BF0  3501 	C$LCD_Driver.c$629$1_0$187 ==.
                                   3502 ;	LCD_Driver.c:629: putstr("--------------------------------------------------\n\r");
      002C8B 90 42 95         [24] 3503 	mov	dptr,#___str_14
      002C8E 75 F0 80         [24] 3504 	mov	b,#0x80
      002C91 12 20 C8         [24] 3505 	lcall	_putstr
                           000BF9  3506 	C$LCD_Driver.c$631$1_0$187 ==.
                                   3507 ;	LCD_Driver.c:631: save_cursor_position();
      002C94 12 27 7D         [24] 3508 	lcall	_save_cursor_position
                           000BFC  3509 	C$LCD_Driver.c$634$3_0$189 ==.
                                   3510 ;	LCD_Driver.c:634: for(uint8_t char_code = 0; char_code < 8; char_code++) {
      002C97 7F 00            [12] 3511 	mov	r7,#0x00
      002C99                       3512 00114$:
      002C99 BF 08 00         [24] 3513 	cjne	r7,#0x08,00149$
      002C9C                       3514 00149$:
      002C9C 40 03            [24] 3515 	jc	00150$
      002C9E 02 2D E4         [24] 3516 	ljmp	00106$
      002CA1                       3517 00150$:
                           000C06  3518 	C$LCD_Driver.c$635$3_0$189 ==.
                                   3519 ;	LCD_Driver.c:635: putstr("Character ");
      002CA1 90 42 CA         [24] 3520 	mov	dptr,#___str_15
      002CA4 75 F0 80         [24] 3521 	mov	b,#0x80
      002CA7 C0 07            [24] 3522 	push	ar7
      002CA9 12 20 C8         [24] 3523 	lcall	_putstr
      002CAC D0 07            [24] 3524 	pop	ar7
                           000C13  3525 	C$LCD_Driver.c$636$3_0$189 ==.
                                   3526 ;	LCD_Driver.c:636: putchar('0' + char_code);
      002CAE 8F 05            [24] 3527 	mov	ar5,r7
      002CB0 7E 00            [12] 3528 	mov	r6,#0x00
      002CB2 74 30            [12] 3529 	mov	a,#0x30
      002CB4 2D               [12] 3530 	add	a,r5
      002CB5 FD               [12] 3531 	mov	r5,a
      002CB6 E4               [12] 3532 	clr	a
      002CB7 3E               [12] 3533 	addc	a,r6
      002CB8 FE               [12] 3534 	mov	r6,a
      002CB9 8D 82            [24] 3535 	mov	dpl,r5
      002CBB 8E 83            [24] 3536 	mov	dph,r6
      002CBD C0 07            [24] 3537 	push	ar7
      002CBF 12 20 9B         [24] 3538 	lcall	_putchar
                           000C27  3539 	C$LCD_Driver.c$637$3_0$189 ==.
                                   3540 ;	LCD_Driver.c:637: putstr(":\n\r");
      002CC2 90 42 D5         [24] 3541 	mov	dptr,#___str_16
      002CC5 75 F0 80         [24] 3542 	mov	b,#0x80
      002CC8 12 20 C8         [24] 3543 	lcall	_putstr
      002CCB D0 07            [24] 3544 	pop	ar7
                           000C32  3545 	C$LCD_Driver.c$639$5_0$191 ==.
                                   3546 ;	LCD_Driver.c:639: for(uint8_t row = 0; row < 8; row++) {
      002CCD 8F 06            [24] 3547 	mov	ar6,r7
      002CCF 7D 00            [12] 3548 	mov	r5,#0x00
      002CD1                       3549 00111$:
      002CD1 BD 08 00         [24] 3550 	cjne	r5,#0x08,00151$
      002CD4                       3551 00151$:
      002CD4 40 03            [24] 3552 	jc	00152$
      002CD6 02 2D D3         [24] 3553 	ljmp	00105$
      002CD9                       3554 00152$:
                           000C3E  3555 	C$LCD_Driver.c$641$1_0$187 ==.
                                   3556 ;	LCD_Driver.c:641: uint8_t cgram_addr = 0x40 | (char_code << 3) | row;
      002CD9 C0 07            [24] 3557 	push	ar7
      002CDB 8E 04            [24] 3558 	mov	ar4,r6
      002CDD EC               [12] 3559 	mov	a,r4
      002CDE C4               [12] 3560 	swap	a
      002CDF 03               [12] 3561 	rr	a
      002CE0 54 F8            [12] 3562 	anl	a,#0xf8
      002CE2 FC               [12] 3563 	mov	r4,a
      002CE3 74 40            [12] 3564 	mov	a,#0x40
      002CE5 4C               [12] 3565 	orl	a,r4
      002CE6 4D               [12] 3566 	orl	a,r5
                           000C4C  3567 	C$LCD_Driver.c$642$5_0$191 ==.
                                   3568 ;	LCD_Driver.c:642: lcd_cmd(cgram_addr);
      002CE7 FC               [12] 3569 	mov	r4,a
      002CE8 F5 82            [12] 3570 	mov	dpl,a
      002CEA C0 07            [24] 3571 	push	ar7
      002CEC C0 06            [24] 3572 	push	ar6
      002CEE C0 05            [24] 3573 	push	ar5
      002CF0 C0 04            [24] 3574 	push	ar4
      002CF2 12 21 5E         [24] 3575 	lcall	_lcd_cmd
                           000C5A  3576 	C$LCD_Driver.c$643$5_0$191 ==.
                                   3577 ;	LCD_Driver.c:643: lcdbusywait();
      002CF5 12 21 3E         [24] 3578 	lcall	_lcdbusywait
      002CF8 D0 04            [24] 3579 	pop	ar4
      002CFA D0 05            [24] 3580 	pop	ar5
      002CFC D0 06            [24] 3581 	pop	ar6
      002CFE D0 07            [24] 3582 	pop	ar7
                           000C65  3583 	C$LCD_Driver.c$644$5_1$192 ==.
                                   3584 ;	LCD_Driver.c:644: uint8_t pattern = *lcd_read_ptr;
      002D00 90 05 4C         [24] 3585 	mov	dptr,#_lcd_read_ptr
      002D03 E0               [24] 3586 	movx	a,@dptr
      002D04 FA               [12] 3587 	mov	r2,a
      002D05 A3               [24] 3588 	inc	dptr
      002D06 E0               [24] 3589 	movx	a,@dptr
      002D07 FB               [12] 3590 	mov	r3,a
      002D08 8A 82            [24] 3591 	mov	dpl,r2
      002D0A 8B 83            [24] 3592 	mov	dph,r3
      002D0C E0               [24] 3593 	movx	a,@dptr
      002D0D FA               [12] 3594 	mov	r2,a
      002D0E 90 04 81         [24] 3595 	mov	dptr,#_hex_dump_cgram_pattern_327681_192
      002D11 F0               [24] 3596 	movx	@dptr,a
                           000C77  3597 	C$LCD_Driver.c$648$5_1$192 ==.
                                   3598 ;	LCD_Driver.c:648: sprintf(buf, "  Row %d [0x%02X]: 0x%02X = ", row, cgram_addr, pattern);
      002D12 7B 00            [12] 3599 	mov	r3,#0x00
      002D14 8C 01            [24] 3600 	mov	ar1,r4
      002D16 7C 00            [12] 3601 	mov	r4,#0x00
      002D18 8D 00            [24] 3602 	mov	ar0,r5
      002D1A 7F 00            [12] 3603 	mov	r7,#0x00
      002D1C C0 07            [24] 3604 	push	ar7
      002D1E C0 06            [24] 3605 	push	ar6
      002D20 C0 05            [24] 3606 	push	ar5
      002D22 C0 02            [24] 3607 	push	ar2
      002D24 C0 03            [24] 3608 	push	ar3
      002D26 C0 01            [24] 3609 	push	ar1
      002D28 C0 04            [24] 3610 	push	ar4
      002D2A C0 00            [24] 3611 	push	ar0
      002D2C C0 07            [24] 3612 	push	ar7
      002D2E 74 D9            [12] 3613 	mov	a,#___str_17
      002D30 C0 E0            [24] 3614 	push	acc
      002D32 74 42            [12] 3615 	mov	a,#(___str_17 >> 8)
      002D34 C0 E0            [24] 3616 	push	acc
      002D36 74 80            [12] 3617 	mov	a,#0x80
      002D38 C0 E0            [24] 3618 	push	acc
      002D3A 74 82            [12] 3619 	mov	a,#_hex_dump_cgram_buf_327681_192
      002D3C C0 E0            [24] 3620 	push	acc
      002D3E 74 04            [12] 3621 	mov	a,#(_hex_dump_cgram_buf_327681_192 >> 8)
      002D40 C0 E0            [24] 3622 	push	acc
      002D42 E4               [12] 3623 	clr	a
      002D43 C0 E0            [24] 3624 	push	acc
      002D45 12 35 FE         [24] 3625 	lcall	_sprintf
      002D48 E5 81            [12] 3626 	mov	a,sp
      002D4A 24 F4            [12] 3627 	add	a,#0xf4
      002D4C F5 81            [12] 3628 	mov	sp,a
                           000CB3  3629 	C$LCD_Driver.c$649$5_1$192 ==.
                                   3630 ;	LCD_Driver.c:649: putstr(buf);
      002D4E 90 04 82         [24] 3631 	mov	dptr,#_hex_dump_cgram_buf_327681_192
      002D51 75 F0 00         [24] 3632 	mov	b,#0x00
      002D54 12 20 C8         [24] 3633 	lcall	_putstr
      002D57 D0 05            [24] 3634 	pop	ar5
      002D59 D0 06            [24] 3635 	pop	ar6
      002D5B D0 07            [24] 3636 	pop	ar7
                           000CC2  3637 	C$LCD_Driver.c$652$7_1$194 ==.
                                   3638 ;	LCD_Driver.c:652: for(int8_t bit = 4; bit >= 0; bit--) {
      002D5D 90 04 81         [24] 3639 	mov	dptr,#_hex_dump_cgram_pattern_327681_192
      002D60 E0               [24] 3640 	movx	a,@dptr
      002D61 F5 0E            [12] 3641 	mov	_hex_dump_cgram_sloc0_1_0,a
      002D63 75 0F 04         [24] 3642 	mov	_hex_dump_cgram_sloc1_1_0,#0x04
                           000CCB  3643 	C$LCD_Driver.c$665$1_0$187 ==.
                                   3644 ;	LCD_Driver.c:665: restore_cursor_position();
      002D66 D0 07            [24] 3645 	pop	ar7
                           000CCD  3646 	C$LCD_Driver.c$652$6_1$193 ==.
                                   3647 ;	LCD_Driver.c:652: for(int8_t bit = 4; bit >= 0; bit--) {
      002D68                       3648 00108$:
      002D68 E5 0F            [12] 3649 	mov	a,_hex_dump_cgram_sloc1_1_0
      002D6A 20 E7 4D         [24] 3650 	jb	acc.7,00104$
                           000CD2  3651 	C$LCD_Driver.c$653$7_1$194 ==.
                                   3652 ;	LCD_Driver.c:653: if(pattern & (1 << bit)) {
      002D6D AC 0F            [24] 3653 	mov	r4,_hex_dump_cgram_sloc1_1_0
      002D6F 8C F0            [24] 3654 	mov	b,r4
      002D71 05 F0            [12] 3655 	inc	b
      002D73 7C 01            [12] 3656 	mov	r4,#0x01
      002D75 7B 00            [12] 3657 	mov	r3,#0x00
      002D77 80 06            [24] 3658 	sjmp	00155$
      002D79                       3659 00154$:
      002D79 EC               [12] 3660 	mov	a,r4
      002D7A 2C               [12] 3661 	add	a,r4
      002D7B FC               [12] 3662 	mov	r4,a
      002D7C EB               [12] 3663 	mov	a,r3
      002D7D 33               [12] 3664 	rlc	a
      002D7E FB               [12] 3665 	mov	r3,a
      002D7F                       3666 00155$:
      002D7F D5 F0 F7         [24] 3667 	djnz	b,00154$
      002D82 A9 0E            [24] 3668 	mov	r1,_hex_dump_cgram_sloc0_1_0
      002D84 7A 00            [12] 3669 	mov	r2,#0x00
      002D86 E9               [12] 3670 	mov	a,r1
      002D87 52 04            [12] 3671 	anl	ar4,a
      002D89 EA               [12] 3672 	mov	a,r2
      002D8A 52 03            [12] 3673 	anl	ar3,a
      002D8C EC               [12] 3674 	mov	a,r4
      002D8D 4B               [12] 3675 	orl	a,r3
      002D8E 60 14            [24] 3676 	jz	00102$
                           000CF5  3677 	C$LCD_Driver.c$654$8_1$195 ==.
                                   3678 ;	LCD_Driver.c:654: putchar('#');
      002D90 90 00 23         [24] 3679 	mov	dptr,#0x0023
      002D93 C0 07            [24] 3680 	push	ar7
      002D95 C0 06            [24] 3681 	push	ar6
      002D97 C0 05            [24] 3682 	push	ar5
      002D99 12 20 9B         [24] 3683 	lcall	_putchar
      002D9C D0 05            [24] 3684 	pop	ar5
      002D9E D0 06            [24] 3685 	pop	ar6
      002DA0 D0 07            [24] 3686 	pop	ar7
      002DA2 80 12            [24] 3687 	sjmp	00109$
      002DA4                       3688 00102$:
                           000D09  3689 	C$LCD_Driver.c$656$8_1$196 ==.
                                   3690 ;	LCD_Driver.c:656: putchar(' ');
      002DA4 90 00 20         [24] 3691 	mov	dptr,#0x0020
      002DA7 C0 07            [24] 3692 	push	ar7
      002DA9 C0 06            [24] 3693 	push	ar6
      002DAB C0 05            [24] 3694 	push	ar5
      002DAD 12 20 9B         [24] 3695 	lcall	_putchar
      002DB0 D0 05            [24] 3696 	pop	ar5
      002DB2 D0 06            [24] 3697 	pop	ar6
      002DB4 D0 07            [24] 3698 	pop	ar7
      002DB6                       3699 00109$:
                           000D1B  3700 	C$LCD_Driver.c$652$6_1$193 ==.
                                   3701 ;	LCD_Driver.c:652: for(int8_t bit = 4; bit >= 0; bit--) {
      002DB6 15 0F            [12] 3702 	dec	_hex_dump_cgram_sloc1_1_0
      002DB8 80 AE            [24] 3703 	sjmp	00108$
      002DBA                       3704 00104$:
                           000D1F  3705 	C$LCD_Driver.c$659$5_1$192 ==.
                                   3706 ;	LCD_Driver.c:659: putstr("\n\r");
      002DBA 90 40 F8         [24] 3707 	mov	dptr,#___str_0
      002DBD 75 F0 80         [24] 3708 	mov	b,#0x80
      002DC0 C0 07            [24] 3709 	push	ar7
      002DC2 C0 06            [24] 3710 	push	ar6
      002DC4 C0 05            [24] 3711 	push	ar5
      002DC6 12 20 C8         [24] 3712 	lcall	_putstr
      002DC9 D0 05            [24] 3713 	pop	ar5
      002DCB D0 06            [24] 3714 	pop	ar6
      002DCD D0 07            [24] 3715 	pop	ar7
                           000D34  3716 	C$LCD_Driver.c$639$4_0$190 ==.
                                   3717 ;	LCD_Driver.c:639: for(uint8_t row = 0; row < 8; row++) {
      002DCF 0D               [12] 3718 	inc	r5
      002DD0 02 2C D1         [24] 3719 	ljmp	00111$
      002DD3                       3720 00105$:
                           000D38  3721 	C$LCD_Driver.c$661$3_0$189 ==.
                                   3722 ;	LCD_Driver.c:661: putstr("\n\r");
      002DD3 90 40 F8         [24] 3723 	mov	dptr,#___str_0
      002DD6 75 F0 80         [24] 3724 	mov	b,#0x80
      002DD9 C0 07            [24] 3725 	push	ar7
      002DDB 12 20 C8         [24] 3726 	lcall	_putstr
      002DDE D0 07            [24] 3727 	pop	ar7
                           000D45  3728 	C$LCD_Driver.c$634$2_0$188 ==.
                                   3729 ;	LCD_Driver.c:634: for(uint8_t char_code = 0; char_code < 8; char_code++) {
      002DE0 0F               [12] 3730 	inc	r7
      002DE1 02 2C 99         [24] 3731 	ljmp	00114$
      002DE4                       3732 00106$:
                           000D49  3733 	C$LCD_Driver.c$665$1_0$187 ==.
                                   3734 ;	LCD_Driver.c:665: restore_cursor_position();
      002DE4 12 27 94         [24] 3735 	lcall	_restore_cursor_position
                           000D4C  3736 	C$LCD_Driver.c$666$1_0$187 ==.
                                   3737 ;	LCD_Driver.c:666: }
                           000D4C  3738 	C$LCD_Driver.c$666$1_0$187 ==.
                           000D4C  3739 	XG$hex_dump_cgram$0$0 ==.
      002DE7 22               [24] 3740 	ret
                                   3741 ;------------------------------------------------------------
                                   3742 ;Allocation info for local variables in function 'hex_dump_complete'
                                   3743 ;------------------------------------------------------------
                           000D4D  3744 	G$hex_dump_complete$0$0 ==.
                           000D4D  3745 	C$LCD_Driver.c$668$1_0$198 ==.
                                   3746 ;	LCD_Driver.c:668: void hex_dump_complete(void) {
                                   3747 ;	-----------------------------------------
                                   3748 ;	 function hex_dump_complete
                                   3749 ;	-----------------------------------------
      002DE8                       3750 _hex_dump_complete:
                           000D4D  3751 	C$LCD_Driver.c$669$1_0$198 ==.
                                   3752 ;	LCD_Driver.c:669: putstr("\n\r");
      002DE8 90 40 F8         [24] 3753 	mov	dptr,#___str_0
      002DEB 75 F0 80         [24] 3754 	mov	b,#0x80
      002DEE 12 20 C8         [24] 3755 	lcall	_putstr
                           000D56  3756 	C$LCD_Driver.c$672$1_0$198 ==.
                                   3757 ;	LCD_Driver.c:672: hex_dump_ddram();
      002DF1 12 2B 6D         [24] 3758 	lcall	_hex_dump_ddram
                           000D59  3759 	C$LCD_Driver.c$673$1_0$198 ==.
                                   3760 ;	LCD_Driver.c:673: putstr("\n\r");
      002DF4 90 40 F8         [24] 3761 	mov	dptr,#___str_0
      002DF7 75 F0 80         [24] 3762 	mov	b,#0x80
      002DFA 12 20 C8         [24] 3763 	lcall	_putstr
                           000D62  3764 	C$LCD_Driver.c$675$1_0$198 ==.
                                   3765 ;	LCD_Driver.c:675: hex_dump_cgram();
      002DFD 12 2C 79         [24] 3766 	lcall	_hex_dump_cgram
                           000D65  3767 	C$LCD_Driver.c$676$1_0$198 ==.
                                   3768 ;	LCD_Driver.c:676: }
                           000D65  3769 	C$LCD_Driver.c$676$1_0$198 ==.
                           000D65  3770 	XG$hex_dump_complete$0$0 ==.
      002E00 22               [24] 3771 	ret
                                   3772 ;------------------------------------------------------------
                                   3773 ;Allocation info for local variables in function 'menu_print'
                                   3774 ;------------------------------------------------------------
                           000D66  3775 	G$menu_print$0$0 ==.
                           000D66  3776 	C$LCD_Driver.c$678$1_0$200 ==.
                                   3777 ;	LCD_Driver.c:678: void menu_print(void){
                                   3778 ;	-----------------------------------------
                                   3779 ;	 function menu_print
                                   3780 ;	-----------------------------------------
      002E01                       3781 _menu_print:
                           000D66  3782 	C$LCD_Driver.c$680$1_0$200 ==.
                                   3783 ;	LCD_Driver.c:680: putstr("\n\r");
      002E01 90 40 F8         [24] 3784 	mov	dptr,#___str_0
      002E04 75 F0 80         [24] 3785 	mov	b,#0x80
      002E07 12 20 C8         [24] 3786 	lcall	_putstr
                           000D6F  3787 	C$LCD_Driver.c$681$1_0$200 ==.
                                   3788 ;	LCD_Driver.c:681: putstr("Here is everything you can do:\n\r");
      002E0A 90 42 F6         [24] 3789 	mov	dptr,#___str_18
      002E0D 75 F0 80         [24] 3790 	mov	b,#0x80
      002E10 12 20 C8         [24] 3791 	lcall	_putstr
                           000D78  3792 	C$LCD_Driver.c$682$1_0$200 ==.
                                   3793 ;	LCD_Driver.c:682: putstr("--------------------------------------\n\r");
      002E13 90 43 17         [24] 3794 	mov	dptr,#___str_19
      002E16 75 F0 80         [24] 3795 	mov	b,#0x80
      002E19 12 20 C8         [24] 3796 	lcall	_putstr
                           000D81  3797 	C$LCD_Driver.c$683$1_0$200 ==.
                                   3798 ;	LCD_Driver.c:683: putstr("0. Put a character at wherever the cursor is \n\r");
      002E1C 90 43 40         [24] 3799 	mov	dptr,#___str_20
      002E1F 75 F0 80         [24] 3800 	mov	b,#0x80
      002E22 12 20 C8         [24] 3801 	lcall	_putstr
                           000D8A  3802 	C$LCD_Driver.c$684$1_0$200 ==.
                                   3803 ;	LCD_Driver.c:684: putstr("a. Put a character somewhere \n\r");
      002E25 90 43 70         [24] 3804 	mov	dptr,#___str_21
      002E28 75 F0 80         [24] 3805 	mov	b,#0x80
      002E2B 12 20 C8         [24] 3806 	lcall	_putstr
                           000D93  3807 	C$LCD_Driver.c$685$1_0$200 ==.
                                   3808 ;	LCD_Driver.c:685: putstr("b. Put a string somewhere (letter wrap) \n\r");
      002E2E 90 43 90         [24] 3809 	mov	dptr,#___str_22
      002E31 75 F0 80         [24] 3810 	mov	b,#0x80
      002E34 12 20 C8         [24] 3811 	lcall	_putstr
                           000D9C  3812 	C$LCD_Driver.c$686$1_0$200 ==.
                                   3813 ;	LCD_Driver.c:686: putstr("c. Put a string somewhere (word wrap) \n\r");
      002E37 90 43 BB         [24] 3814 	mov	dptr,#___str_23
      002E3A 75 F0 80         [24] 3815 	mov	b,#0x80
      002E3D 12 20 C8         [24] 3816 	lcall	_putstr
                           000DA5  3817 	C$LCD_Driver.c$687$1_0$200 ==.
                                   3818 ;	LCD_Driver.c:687: putstr("d. Clear screen \n\r");
      002E40 90 43 E4         [24] 3819 	mov	dptr,#___str_24
      002E43 75 F0 80         [24] 3820 	mov	b,#0x80
      002E46 12 20 C8         [24] 3821 	lcall	_putstr
                           000DAE  3822 	C$LCD_Driver.c$688$1_0$200 ==.
                                   3823 ;	LCD_Driver.c:688: putstr("e. Re-init screen \n\r");
      002E49 90 43 F7         [24] 3824 	mov	dptr,#___str_25
      002E4C 75 F0 80         [24] 3825 	mov	b,#0x80
      002E4F 12 20 C8         [24] 3826 	lcall	_putstr
                           000DB7  3827 	C$LCD_Driver.c$689$1_0$200 ==.
                                   3828 ;	LCD_Driver.c:689: putstr("--------------------------------------\n\r");
      002E52 90 43 17         [24] 3829 	mov	dptr,#___str_19
      002E55 75 F0 80         [24] 3830 	mov	b,#0x80
      002E58 12 20 C8         [24] 3831 	lcall	_putstr
                           000DC0  3832 	C$LCD_Driver.c$690$1_0$200 ==.
                                   3833 ;	LCD_Driver.c:690: putstr("f. Create Custom Character \n\r");
      002E5B 90 44 0C         [24] 3834 	mov	dptr,#___str_26
      002E5E 75 F0 80         [24] 3835 	mov	b,#0x80
      002E61 12 20 C8         [24] 3836 	lcall	_putstr
                           000DC9  3837 	C$LCD_Driver.c$691$1_0$200 ==.
                                   3838 ;	LCD_Driver.c:691: putstr("g. Put Custom Character somewhere \n\r");
      002E64 90 44 2A         [24] 3839 	mov	dptr,#___str_27
      002E67 75 F0 80         [24] 3840 	mov	b,#0x80
      002E6A 12 20 C8         [24] 3841 	lcall	_putstr
                           000DD2  3842 	C$LCD_Driver.c$692$1_0$200 ==.
                                   3843 ;	LCD_Driver.c:692: putstr("h. Help Menu \n\r");
      002E6D 90 44 4F         [24] 3844 	mov	dptr,#___str_28
      002E70 75 F0 80         [24] 3845 	mov	b,#0x80
      002E73 12 20 C8         [24] 3846 	lcall	_putstr
                           000DDB  3847 	C$LCD_Driver.c$693$1_0$200 ==.
                                   3848 ;	LCD_Driver.c:693: putstr("i. Hex Dump \n\r");
      002E76 90 44 5F         [24] 3849 	mov	dptr,#___str_29
      002E79 75 F0 80         [24] 3850 	mov	b,#0x80
      002E7C 12 20 C8         [24] 3851 	lcall	_putstr
                           000DE4  3852 	C$LCD_Driver.c$694$1_0$200 ==.
                                   3853 ;	LCD_Driver.c:694: putstr("--------------------------------------\n\r");
      002E7F 90 43 17         [24] 3854 	mov	dptr,#___str_19
      002E82 75 F0 80         [24] 3855 	mov	b,#0x80
      002E85 12 20 C8         [24] 3856 	lcall	_putstr
                           000DED  3857 	C$LCD_Driver.c$695$1_0$200 ==.
                                   3858 ;	LCD_Driver.c:695: putstr("Clock Menu: \n\r");
      002E88 90 44 6E         [24] 3859 	mov	dptr,#___str_30
      002E8B 75 F0 80         [24] 3860 	mov	b,#0x80
      002E8E 12 20 C8         [24] 3861 	lcall	_putstr
                           000DF6  3862 	C$LCD_Driver.c$696$1_0$200 ==.
                                   3863 ;	LCD_Driver.c:696: putstr("s. Start Clock\n\r");
      002E91 90 44 7D         [24] 3864 	mov	dptr,#___str_31
      002E94 75 F0 80         [24] 3865 	mov	b,#0x80
      002E97 12 20 C8         [24] 3866 	lcall	_putstr
                           000DFF  3867 	C$LCD_Driver.c$697$1_0$200 ==.
                                   3868 ;	LCD_Driver.c:697: putstr("t. Stop Clock\n\r");
      002E9A 90 44 8E         [24] 3869 	mov	dptr,#___str_32
      002E9D 75 F0 80         [24] 3870 	mov	b,#0x80
      002EA0 12 20 C8         [24] 3871 	lcall	_putstr
                           000E08  3872 	C$LCD_Driver.c$698$1_0$200 ==.
                                   3873 ;	LCD_Driver.c:698: putstr("r. Reset Clock\n\r");
      002EA3 90 44 9E         [24] 3874 	mov	dptr,#___str_33
      002EA6 75 F0 80         [24] 3875 	mov	b,#0x80
      002EA9 12 20 C8         [24] 3876 	lcall	_putstr
                           000E11  3877 	C$LCD_Driver.c$699$1_0$200 ==.
                                   3878 ;	LCD_Driver.c:699: putstr("--------------------------------------\n\r");
      002EAC 90 43 17         [24] 3879 	mov	dptr,#___str_19
      002EAF 75 F0 80         [24] 3880 	mov	b,#0x80
      002EB2 12 20 C8         [24] 3881 	lcall	_putstr
                           000E1A  3882 	C$LCD_Driver.c$700$1_0$200 ==.
                                   3883 ;	LCD_Driver.c:700: }
                           000E1A  3884 	C$LCD_Driver.c$700$1_0$200 ==.
                           000E1A  3885 	XG$menu_print$0$0 ==.
      002EB5 22               [24] 3886 	ret
                                   3887 ;------------------------------------------------------------
                                   3888 ;Allocation info for local variables in function 'main'
                                   3889 ;------------------------------------------------------------
                                   3890 ;choice                    Allocated with name '_main_choice_65537_203'
                                   3891 ;input_buffer              Allocated with name '_main_input_buffer_65537_203'
                                   3892 ;char_buffer               Allocated with name '_main_char_buffer_65537_203'
                                   3893 ;row                       Allocated with name '_main_row_65537_203'
                                   3894 ;col                       Allocated with name '_main_col_65537_203'
                                   3895 ;------------------------------------------------------------
                           000E1B  3896 	G$main$0$0 ==.
                           000E1B  3897 	C$LCD_Driver.c$702$1_0$202 ==.
                                   3898 ;	LCD_Driver.c:702: int main(void)
                                   3899 ;	-----------------------------------------
                                   3900 ;	 function main
                                   3901 ;	-----------------------------------------
      002EB6                       3902 _main:
                           000E1B  3903 	C$LCD_Driver.c$704$1_0$202 ==.
                                   3904 ;	LCD_Driver.c:704: lcdinit();
      002EB6 12 25 82         [24] 3905 	lcall	_lcdinit
                           000E1E  3906 	C$LCD_Driver.c$705$1_0$202 ==.
                                   3907 ;	LCD_Driver.c:705: putstr("LCD Initialized \n\r");
      002EB9 90 44 AF         [24] 3908 	mov	dptr,#___str_34
      002EBC 75 F0 80         [24] 3909 	mov	b,#0x80
      002EBF 12 20 C8         [24] 3910 	lcall	_putstr
                           000E27  3911 	C$LCD_Driver.c$706$1_0$202 ==.
                                   3912 ;	LCD_Driver.c:706: timer_init();
      002EC2 12 28 9D         [24] 3913 	lcall	_timer_init
                           000E2A  3914 	C$LCD_Driver.c$707$1_0$202 ==.
                                   3915 ;	LCD_Driver.c:707: putstr("Timer Initialized \n\r");
      002EC5 90 44 C2         [24] 3916 	mov	dptr,#___str_35
      002EC8 75 F0 80         [24] 3917 	mov	b,#0x80
      002ECB 12 20 C8         [24] 3918 	lcall	_putstr
                           000E33  3919 	C$LCD_Driver.c$708$1_0$202 ==.
                                   3920 ;	LCD_Driver.c:708: P1_3 = 0; // Initialize test pin
                                   3921 ;	assignBit
      002ECE C2 93            [12] 3922 	clr	_P1_3
                           000E35  3923 	C$LCD_Driver.c$709$1_0$202 ==.
                                   3924 ;	LCD_Driver.c:709: display_clock(); // Initial clock display
      002ED0 12 27 B2         [24] 3925 	lcall	_display_clock
                           000E38  3926 	C$LCD_Driver.c$710$1_0$202 ==.
                                   3927 ;	LCD_Driver.c:710: putstr("Clock Display Started \n\r");
      002ED3 90 44 D7         [24] 3928 	mov	dptr,#___str_36
      002ED6 75 F0 80         [24] 3929 	mov	b,#0x80
      002ED9 12 20 C8         [24] 3930 	lcall	_putstr
                           000E41  3931 	C$LCD_Driver.c$713$1_0$202 ==.
                                   3932 ;	LCD_Driver.c:713: lcd_putchar_at(1, 1, 'H');     // Row 0, Col 5: 'H'
      002EDC 90 04 17         [24] 3933 	mov	dptr,#_lcd_putchar_at_PARM_2
      002EDF 74 01            [12] 3934 	mov	a,#0x01
      002EE1 F0               [24] 3935 	movx	@dptr,a
      002EE2 90 04 18         [24] 3936 	mov	dptr,#_lcd_putchar_at_PARM_3
      002EE5 74 48            [12] 3937 	mov	a,#0x48
      002EE7 F0               [24] 3938 	movx	@dptr,a
      002EE8 75 82 01         [24] 3939 	mov	dpl,#0x01
      002EEB 12 24 CD         [24] 3940 	lcall	_lcd_putchar_at
                           000E53  3941 	C$LCD_Driver.c$714$1_0$202 ==.
                                   3942 ;	LCD_Driver.c:714: lcd_putchar_at(1, 2, 'i');     // Row 0, Col 6: 'i'
      002EEE 90 04 17         [24] 3943 	mov	dptr,#_lcd_putchar_at_PARM_2
      002EF1 74 02            [12] 3944 	mov	a,#0x02
      002EF3 F0               [24] 3945 	movx	@dptr,a
      002EF4 90 04 18         [24] 3946 	mov	dptr,#_lcd_putchar_at_PARM_3
      002EF7 74 69            [12] 3947 	mov	a,#0x69
      002EF9 F0               [24] 3948 	movx	@dptr,a
      002EFA 75 82 01         [24] 3949 	mov	dpl,#0x01
      002EFD 12 24 CD         [24] 3950 	lcall	_lcd_putchar_at
                           000E65  3951 	C$LCD_Driver.c$718$1_0$202 ==.
                                   3952 ;	LCD_Driver.c:718: lcdcreatechar(0, custom_char_checker);
      002F00 90 04 3B         [24] 3953 	mov	dptr,#_lcdcreatechar_PARM_2
      002F03 74 4E            [12] 3954 	mov	a,#_custom_char_checker
      002F05 F0               [24] 3955 	movx	@dptr,a
      002F06 74 05            [12] 3956 	mov	a,#(_custom_char_checker >> 8)
      002F08 A3               [24] 3957 	inc	dptr
      002F09 F0               [24] 3958 	movx	@dptr,a
      002F0A E4               [12] 3959 	clr	a
      002F0B A3               [24] 3960 	inc	dptr
      002F0C F0               [24] 3961 	movx	@dptr,a
      002F0D 75 82 00         [24] 3962 	mov	dpl,#0x00
      002F10 12 2A 46         [24] 3963 	lcall	_lcdcreatechar
                           000E78  3964 	C$LCD_Driver.c$719$1_0$202 ==.
                                   3965 ;	LCD_Driver.c:719: lcdcreatechar(1, custom_char_heart);
      002F13 90 04 3B         [24] 3966 	mov	dptr,#_lcdcreatechar_PARM_2
      002F16 74 56            [12] 3967 	mov	a,#_custom_char_heart
      002F18 F0               [24] 3968 	movx	@dptr,a
      002F19 74 05            [12] 3969 	mov	a,#(_custom_char_heart >> 8)
      002F1B A3               [24] 3970 	inc	dptr
      002F1C F0               [24] 3971 	movx	@dptr,a
      002F1D E4               [12] 3972 	clr	a
      002F1E A3               [24] 3973 	inc	dptr
      002F1F F0               [24] 3974 	movx	@dptr,a
      002F20 75 82 01         [24] 3975 	mov	dpl,#0x01
      002F23 12 2A 46         [24] 3976 	lcall	_lcdcreatechar
                           000E8B  3977 	C$LCD_Driver.c$720$1_0$202 ==.
                                   3978 ;	LCD_Driver.c:720: lcdcreatechar(2, custom_char_face);
      002F26 90 04 3B         [24] 3979 	mov	dptr,#_lcdcreatechar_PARM_2
      002F29 74 5E            [12] 3980 	mov	a,#_custom_char_face
      002F2B F0               [24] 3981 	movx	@dptr,a
      002F2C 74 05            [12] 3982 	mov	a,#(_custom_char_face >> 8)
      002F2E A3               [24] 3983 	inc	dptr
      002F2F F0               [24] 3984 	movx	@dptr,a
      002F30 E4               [12] 3985 	clr	a
      002F31 A3               [24] 3986 	inc	dptr
      002F32 F0               [24] 3987 	movx	@dptr,a
      002F33 75 82 02         [24] 3988 	mov	dpl,#0x02
      002F36 12 2A 46         [24] 3989 	lcall	_lcdcreatechar
                           000E9E  3990 	C$LCD_Driver.c$721$1_0$202 ==.
                                   3991 ;	LCD_Driver.c:721: lcdcreatechar(3, custom_char_alpaca);
      002F39 90 04 3B         [24] 3992 	mov	dptr,#_lcdcreatechar_PARM_2
      002F3C 74 66            [12] 3993 	mov	a,#_custom_char_alpaca
      002F3E F0               [24] 3994 	movx	@dptr,a
      002F3F 74 05            [12] 3995 	mov	a,#(_custom_char_alpaca >> 8)
      002F41 A3               [24] 3996 	inc	dptr
      002F42 F0               [24] 3997 	movx	@dptr,a
      002F43 E4               [12] 3998 	clr	a
      002F44 A3               [24] 3999 	inc	dptr
      002F45 F0               [24] 4000 	movx	@dptr,a
      002F46 75 82 03         [24] 4001 	mov	dpl,#0x03
      002F49 12 2A 46         [24] 4002 	lcall	_lcdcreatechar
                           000EB1  4003 	C$LCD_Driver.c$722$1_0$202 ==.
                                   4004 ;	LCD_Driver.c:722: lcdcreatechar(4, custom_char_giraffe);
      002F4C 90 04 3B         [24] 4005 	mov	dptr,#_lcdcreatechar_PARM_2
      002F4F 74 6E            [12] 4006 	mov	a,#_custom_char_giraffe
      002F51 F0               [24] 4007 	movx	@dptr,a
      002F52 74 05            [12] 4008 	mov	a,#(_custom_char_giraffe >> 8)
      002F54 A3               [24] 4009 	inc	dptr
      002F55 F0               [24] 4010 	movx	@dptr,a
      002F56 E4               [12] 4011 	clr	a
      002F57 A3               [24] 4012 	inc	dptr
      002F58 F0               [24] 4013 	movx	@dptr,a
      002F59 75 82 04         [24] 4014 	mov	dpl,#0x04
      002F5C 12 2A 46         [24] 4015 	lcall	_lcdcreatechar
                           000EC4  4016 	C$LCD_Driver.c$724$1_0$202 ==.
                                   4017 ;	LCD_Driver.c:724: lcd_putchar_at(1, 13, 1);
      002F5F 90 04 17         [24] 4018 	mov	dptr,#_lcd_putchar_at_PARM_2
      002F62 74 0D            [12] 4019 	mov	a,#0x0d
      002F64 F0               [24] 4020 	movx	@dptr,a
      002F65 90 04 18         [24] 4021 	mov	dptr,#_lcd_putchar_at_PARM_3
      002F68 74 01            [12] 4022 	mov	a,#0x01
      002F6A F0               [24] 4023 	movx	@dptr,a
      002F6B 75 82 01         [24] 4024 	mov	dpl,#0x01
      002F6E 12 24 CD         [24] 4025 	lcall	_lcd_putchar_at
                           000ED6  4026 	C$LCD_Driver.c$725$1_0$202 ==.
                                   4027 ;	LCD_Driver.c:725: lcd_putchar_at(1, 4, 2);
      002F71 90 04 17         [24] 4028 	mov	dptr,#_lcd_putchar_at_PARM_2
      002F74 74 04            [12] 4029 	mov	a,#0x04
      002F76 F0               [24] 4030 	movx	@dptr,a
      002F77 90 04 18         [24] 4031 	mov	dptr,#_lcd_putchar_at_PARM_3
      002F7A 03               [12] 4032 	rr	a
      002F7B F0               [24] 4033 	movx	@dptr,a
      002F7C 75 82 01         [24] 4034 	mov	dpl,#0x01
      002F7F 12 24 CD         [24] 4035 	lcall	_lcd_putchar_at
                           000EE7  4036 	C$LCD_Driver.c$727$1_0$202 ==.
                                   4037 ;	LCD_Driver.c:727: lcd_putchar_at(1, 7, 3);
      002F82 90 04 17         [24] 4038 	mov	dptr,#_lcd_putchar_at_PARM_2
      002F85 74 07            [12] 4039 	mov	a,#0x07
      002F87 F0               [24] 4040 	movx	@dptr,a
      002F88 90 04 18         [24] 4041 	mov	dptr,#_lcd_putchar_at_PARM_3
      002F8B 74 03            [12] 4042 	mov	a,#0x03
      002F8D F0               [24] 4043 	movx	@dptr,a
      002F8E 75 82 01         [24] 4044 	mov	dpl,#0x01
      002F91 12 24 CD         [24] 4045 	lcall	_lcd_putchar_at
                           000EF9  4046 	C$LCD_Driver.c$728$1_0$202 ==.
                                   4047 ;	LCD_Driver.c:728: lcd_putchar_at(1, 8, 3);
      002F94 90 04 17         [24] 4048 	mov	dptr,#_lcd_putchar_at_PARM_2
      002F97 74 08            [12] 4049 	mov	a,#0x08
      002F99 F0               [24] 4050 	movx	@dptr,a
      002F9A 90 04 18         [24] 4051 	mov	dptr,#_lcd_putchar_at_PARM_3
      002F9D 74 03            [12] 4052 	mov	a,#0x03
      002F9F F0               [24] 4053 	movx	@dptr,a
      002FA0 75 82 01         [24] 4054 	mov	dpl,#0x01
      002FA3 12 24 CD         [24] 4055 	lcall	_lcd_putchar_at
                           000F0B  4056 	C$LCD_Driver.c$729$1_0$202 ==.
                                   4057 ;	LCD_Driver.c:729: lcd_putchar_at(1, 9, 4);
      002FA6 90 04 17         [24] 4058 	mov	dptr,#_lcd_putchar_at_PARM_2
      002FA9 74 09            [12] 4059 	mov	a,#0x09
      002FAB F0               [24] 4060 	movx	@dptr,a
      002FAC 90 04 18         [24] 4061 	mov	dptr,#_lcd_putchar_at_PARM_3
      002FAF 74 04            [12] 4062 	mov	a,#0x04
      002FB1 F0               [24] 4063 	movx	@dptr,a
      002FB2 75 82 01         [24] 4064 	mov	dpl,#0x01
      002FB5 12 24 CD         [24] 4065 	lcall	_lcd_putchar_at
                           000F1D  4066 	C$LCD_Driver.c$730$1_0$202 ==.
                                   4067 ;	LCD_Driver.c:730: lcd_putchar_at(1, 10, 3);
      002FB8 90 04 17         [24] 4068 	mov	dptr,#_lcd_putchar_at_PARM_2
      002FBB 74 0A            [12] 4069 	mov	a,#0x0a
      002FBD F0               [24] 4070 	movx	@dptr,a
      002FBE 90 04 18         [24] 4071 	mov	dptr,#_lcd_putchar_at_PARM_3
      002FC1 74 03            [12] 4072 	mov	a,#0x03
      002FC3 F0               [24] 4073 	movx	@dptr,a
      002FC4 75 82 01         [24] 4074 	mov	dpl,#0x01
      002FC7 12 24 CD         [24] 4075 	lcall	_lcd_putchar_at
                           000F2F  4076 	C$LCD_Driver.c$731$1_0$202 ==.
                                   4077 ;	LCD_Driver.c:731: lcd_putchar_at(1, 11, 4);
      002FCA 90 04 17         [24] 4078 	mov	dptr,#_lcd_putchar_at_PARM_2
      002FCD 74 0B            [12] 4079 	mov	a,#0x0b
      002FCF F0               [24] 4080 	movx	@dptr,a
      002FD0 90 04 18         [24] 4081 	mov	dptr,#_lcd_putchar_at_PARM_3
      002FD3 74 04            [12] 4082 	mov	a,#0x04
      002FD5 F0               [24] 4083 	movx	@dptr,a
      002FD6 75 82 01         [24] 4084 	mov	dpl,#0x01
      002FD9 12 24 CD         [24] 4085 	lcall	_lcd_putchar_at
                           000F41  4086 	C$LCD_Driver.c$736$1_0$202 ==.
                                   4087 ;	LCD_Driver.c:736: menu_print();
      002FDC 12 2E 01         [24] 4088 	lcall	_menu_print
                           000F44  4089 	C$LCD_Driver.c$748$2_1$204 ==.
                                   4090 ;	LCD_Driver.c:748: while (!RI){
      002FDF                       4091 00103$:
      002FDF 20 98 10         [24] 4092 	jb	_RI,00105$
                           000F47  4093 	C$LCD_Driver.c$750$3_1$205 ==.
                                   4094 ;	LCD_Driver.c:750: if(system_clock.update_flag) {
      002FE2 90 05 3F         [24] 4095 	mov	dptr,#(_system_clock + 0x0007)
      002FE5 E0               [24] 4096 	movx	a,@dptr
      002FE6 60 F7            [24] 4097 	jz	00103$
                           000F4D  4098 	C$LCD_Driver.c$751$4_1$206 ==.
                                   4099 ;	LCD_Driver.c:751: system_clock.update_flag = 0;
      002FE8 90 05 3F         [24] 4100 	mov	dptr,#(_system_clock + 0x0007)
      002FEB E4               [12] 4101 	clr	a
      002FEC F0               [24] 4102 	movx	@dptr,a
                           000F52  4103 	C$LCD_Driver.c$752$4_1$206 ==.
                                   4104 ;	LCD_Driver.c:752: display_clock();
      002FED 12 27 B2         [24] 4105 	lcall	_display_clock
      002FF0 80 ED            [24] 4106 	sjmp	00103$
      002FF2                       4107 00105$:
                           000F57  4108 	C$LCD_Driver.c$755$2_1$204 ==.
                                   4109 ;	LCD_Driver.c:755: choice = getchar();
      002FF2 12 20 BA         [24] 4110 	lcall	_getchar
      002FF5 AE 82            [24] 4111 	mov	r6,dpl
                           000F5C  4112 	C$LCD_Driver.c$756$2_1$204 ==.
                                   4113 ;	LCD_Driver.c:756: printf("%c\n\r", choice);
      002FF7 8E 05            [24] 4114 	mov	ar5,r6
      002FF9 7F 00            [12] 4115 	mov	r7,#0x00
      002FFB C0 06            [24] 4116 	push	ar6
      002FFD C0 05            [24] 4117 	push	ar5
      002FFF C0 07            [24] 4118 	push	ar7
      003001 74 F0            [12] 4119 	mov	a,#___str_37
      003003 C0 E0            [24] 4120 	push	acc
      003005 74 44            [12] 4121 	mov	a,#(___str_37 >> 8)
      003007 C0 E0            [24] 4122 	push	acc
      003009 74 80            [12] 4123 	mov	a,#0x80
      00300B C0 E0            [24] 4124 	push	acc
      00300D 12 36 A8         [24] 4125 	lcall	_printf
      003010 E5 81            [12] 4126 	mov	a,sp
      003012 24 FB            [12] 4127 	add	a,#0xfb
      003014 F5 81            [12] 4128 	mov	sp,a
      003016 D0 06            [24] 4129 	pop	ar6
                           000F7D  4130 	C$LCD_Driver.c$758$2_1$204 ==.
                                   4131 ;	LCD_Driver.c:758: switch(choice) {
      003018 BE 30 02         [24] 4132 	cjne	r6,#0x30,00199$
      00301B 80 4A            [24] 4133 	sjmp	00106$
      00301D                       4134 00199$:
      00301D BE 61 02         [24] 4135 	cjne	r6,#0x61,00200$
      003020 80 69            [24] 4136 	sjmp	00107$
      003022                       4137 00200$:
      003022 BE 62 03         [24] 4138 	cjne	r6,#0x62,00201$
      003025 02 30 F2         [24] 4139 	ljmp	00108$
      003028                       4140 00201$:
      003028 BE 63 03         [24] 4141 	cjne	r6,#0x63,00202$
      00302B 02 31 5C         [24] 4142 	ljmp	00109$
      00302E                       4143 00202$:
      00302E BE 64 03         [24] 4144 	cjne	r6,#0x64,00203$
      003031 02 31 C2         [24] 4145 	ljmp	00110$
      003034                       4146 00203$:
      003034 BE 65 03         [24] 4147 	cjne	r6,#0x65,00204$
      003037 02 31 C8         [24] 4148 	ljmp	00111$
      00303A                       4149 00204$:
      00303A BE 66 03         [24] 4150 	cjne	r6,#0x66,00205$
      00303D 02 31 CE         [24] 4151 	ljmp	00112$
      003040                       4152 00205$:
      003040 BE 67 03         [24] 4153 	cjne	r6,#0x67,00206$
      003043 02 31 D4         [24] 4154 	ljmp	00113$
      003046                       4155 00206$:
      003046 BE 68 03         [24] 4156 	cjne	r6,#0x68,00207$
      003049 02 32 57         [24] 4157 	ljmp	00117$
      00304C                       4158 00207$:
      00304C BE 69 03         [24] 4159 	cjne	r6,#0x69,00208$
      00304F 02 32 5C         [24] 4160 	ljmp	00118$
      003052                       4161 00208$:
      003052 BE 72 03         [24] 4162 	cjne	r6,#0x72,00209$
      003055 02 32 6B         [24] 4163 	ljmp	00121$
      003058                       4164 00209$:
      003058 BE 73 03         [24] 4165 	cjne	r6,#0x73,00210$
      00305B 02 32 61         [24] 4166 	ljmp	00119$
      00305E                       4167 00210$:
      00305E BE 74 03         [24] 4168 	cjne	r6,#0x74,00211$
      003061 02 32 66         [24] 4169 	ljmp	00120$
      003064                       4170 00211$:
      003064 02 32 70         [24] 4171 	ljmp	00122$
                           000FCC  4172 	C$LCD_Driver.c$759$3_1$207 ==.
                                   4173 ;	LCD_Driver.c:759: case '0':
      003067                       4174 00106$:
                           000FCC  4175 	C$LCD_Driver.c$760$3_1$207 ==.
                                   4176 ;	LCD_Driver.c:760: putstr("Enter the character: ");
      003067 90 44 F5         [24] 4177 	mov	dptr,#___str_38
      00306A 75 F0 80         [24] 4178 	mov	b,#0x80
      00306D 12 20 C8         [24] 4179 	lcall	_putstr
                           000FD5  4180 	C$LCD_Driver.c$761$3_1$207 ==.
                                   4181 ;	LCD_Driver.c:761: get_user_input(char_buffer, 2);
      003070 90 04 25         [24] 4182 	mov	dptr,#_get_user_input_PARM_2
      003073 74 02            [12] 4183 	mov	a,#0x02
      003075 F0               [24] 4184 	movx	@dptr,a
      003076 90 04 E0         [24] 4185 	mov	dptr,#_main_char_buffer_65537_203
      003079 75 F0 00         [24] 4186 	mov	b,#0x00
      00307C 12 26 54         [24] 4187 	lcall	_get_user_input
                           000FE4  4188 	C$LCD_Driver.c$763$3_1$207 ==.
                                   4189 ;	LCD_Driver.c:763: lcdputch(*char_buffer);
      00307F 90 04 E0         [24] 4190 	mov	dptr,#_main_char_buffer_65537_203
      003082 E0               [24] 4191 	movx	a,@dptr
      003083 F5 82            [12] 4192 	mov	dpl,a
      003085 12 21 79         [24] 4193 	lcall	_lcdputch
                           000FED  4194 	C$LCD_Driver.c$764$3_1$207 ==.
                                   4195 ;	LCD_Driver.c:764: break;
      003088 02 32 88         [24] 4196 	ljmp	00123$
                           000FF0  4197 	C$LCD_Driver.c$766$3_1$207 ==.
                                   4198 ;	LCD_Driver.c:766: case 'a':
      00308B                       4199 00107$:
                           000FF0  4200 	C$LCD_Driver.c$767$3_1$207 ==.
                                   4201 ;	LCD_Driver.c:767: putstr("Enter the character: ");
      00308B 90 44 F5         [24] 4202 	mov	dptr,#___str_38
      00308E 75 F0 80         [24] 4203 	mov	b,#0x80
      003091 12 20 C8         [24] 4204 	lcall	_putstr
                           000FF9  4205 	C$LCD_Driver.c$768$3_1$207 ==.
                                   4206 ;	LCD_Driver.c:768: get_user_input(char_buffer, 2);
      003094 90 04 25         [24] 4207 	mov	dptr,#_get_user_input_PARM_2
      003097 74 02            [12] 4208 	mov	a,#0x02
      003099 F0               [24] 4209 	movx	@dptr,a
      00309A 90 04 E0         [24] 4210 	mov	dptr,#_main_char_buffer_65537_203
      00309D 75 F0 00         [24] 4211 	mov	b,#0x00
      0030A0 12 26 54         [24] 4212 	lcall	_get_user_input
                           001008  4213 	C$LCD_Driver.c$769$3_1$207 ==.
                                   4214 ;	LCD_Driver.c:769: putstr("What row?:");
      0030A3 90 45 0B         [24] 4215 	mov	dptr,#___str_39
      0030A6 75 F0 80         [24] 4216 	mov	b,#0x80
      0030A9 12 20 C8         [24] 4217 	lcall	_putstr
                           001011  4218 	C$LCD_Driver.c$770$3_1$207 ==.
                                   4219 ;	LCD_Driver.c:770: row = get_number();
      0030AC 12 25 E9         [24] 4220 	lcall	_get_number
      0030AF E5 82            [12] 4221 	mov	a,dpl
      0030B1 85 83 F0         [24] 4222 	mov	b,dph
      0030B4 90 04 E1         [24] 4223 	mov	dptr,#_main_row_65537_203
      0030B7 F0               [24] 4224 	movx	@dptr,a
      0030B8 E5 F0            [12] 4225 	mov	a,b
      0030BA A3               [24] 4226 	inc	dptr
      0030BB F0               [24] 4227 	movx	@dptr,a
                           001021  4228 	C$LCD_Driver.c$771$3_1$207 ==.
                                   4229 ;	LCD_Driver.c:771: putstr("And what col?:");
      0030BC 90 45 16         [24] 4230 	mov	dptr,#___str_40
      0030BF 75 F0 80         [24] 4231 	mov	b,#0x80
      0030C2 12 20 C8         [24] 4232 	lcall	_putstr
                           00102A  4233 	C$LCD_Driver.c$772$3_1$207 ==.
                                   4234 ;	LCD_Driver.c:772: col = get_number();
      0030C5 12 25 E9         [24] 4235 	lcall	_get_number
      0030C8 AE 82            [24] 4236 	mov	r6,dpl
      0030CA AF 83            [24] 4237 	mov	r7,dph
      0030CC 90 04 E3         [24] 4238 	mov	dptr,#_main_col_65537_203
      0030CF EE               [12] 4239 	mov	a,r6
      0030D0 F0               [24] 4240 	movx	@dptr,a
      0030D1 EF               [12] 4241 	mov	a,r7
      0030D2 A3               [24] 4242 	inc	dptr
      0030D3 F0               [24] 4243 	movx	@dptr,a
                           001039  4244 	C$LCD_Driver.c$774$3_1$207 ==.
                                   4245 ;	LCD_Driver.c:774: lcd_putchar_at(row, col, *char_buffer);
      0030D4 90 04 E1         [24] 4246 	mov	dptr,#_main_row_65537_203
      0030D7 E0               [24] 4247 	movx	a,@dptr
      0030D8 FC               [12] 4248 	mov	r4,a
      0030D9 A3               [24] 4249 	inc	dptr
      0030DA E0               [24] 4250 	movx	a,@dptr
      0030DB 90 04 E0         [24] 4251 	mov	dptr,#_main_char_buffer_65537_203
      0030DE E0               [24] 4252 	movx	a,@dptr
      0030DF FF               [12] 4253 	mov	r7,a
      0030E0 90 04 17         [24] 4254 	mov	dptr,#_lcd_putchar_at_PARM_2
      0030E3 EE               [12] 4255 	mov	a,r6
      0030E4 F0               [24] 4256 	movx	@dptr,a
      0030E5 90 04 18         [24] 4257 	mov	dptr,#_lcd_putchar_at_PARM_3
      0030E8 EF               [12] 4258 	mov	a,r7
      0030E9 F0               [24] 4259 	movx	@dptr,a
      0030EA 8C 82            [24] 4260 	mov	dpl,r4
      0030EC 12 24 CD         [24] 4261 	lcall	_lcd_putchar_at
                           001054  4262 	C$LCD_Driver.c$775$3_1$207 ==.
                                   4263 ;	LCD_Driver.c:775: break;
      0030EF 02 32 88         [24] 4264 	ljmp	00123$
                           001057  4265 	C$LCD_Driver.c$777$3_1$207 ==.
                                   4266 ;	LCD_Driver.c:777: case 'b':
      0030F2                       4267 00108$:
                           001057  4268 	C$LCD_Driver.c$778$3_1$207 ==.
                                   4269 ;	LCD_Driver.c:778: putstr("Enter the string: ");
      0030F2 90 45 25         [24] 4270 	mov	dptr,#___str_41
      0030F5 75 F0 80         [24] 4271 	mov	b,#0x80
      0030F8 12 20 C8         [24] 4272 	lcall	_putstr
                           001060  4273 	C$LCD_Driver.c$779$3_1$207 ==.
                                   4274 ;	LCD_Driver.c:779: get_user_input(input_buffer, 65);
      0030FB 90 04 25         [24] 4275 	mov	dptr,#_get_user_input_PARM_2
      0030FE 74 41            [12] 4276 	mov	a,#0x41
      003100 F0               [24] 4277 	movx	@dptr,a
      003101 90 04 A0         [24] 4278 	mov	dptr,#_main_input_buffer_65537_203
      003104 75 F0 00         [24] 4279 	mov	b,#0x00
      003107 12 26 54         [24] 4280 	lcall	_get_user_input
                           00106F  4281 	C$LCD_Driver.c$780$3_1$207 ==.
                                   4282 ;	LCD_Driver.c:780: putstr("What row?:");
      00310A 90 45 0B         [24] 4283 	mov	dptr,#___str_39
      00310D 75 F0 80         [24] 4284 	mov	b,#0x80
      003110 12 20 C8         [24] 4285 	lcall	_putstr
                           001078  4286 	C$LCD_Driver.c$781$3_1$207 ==.
                                   4287 ;	LCD_Driver.c:781: row = get_number();
      003113 12 25 E9         [24] 4288 	lcall	_get_number
      003116 E5 82            [12] 4289 	mov	a,dpl
      003118 85 83 F0         [24] 4290 	mov	b,dph
      00311B 90 04 E1         [24] 4291 	mov	dptr,#_main_row_65537_203
      00311E F0               [24] 4292 	movx	@dptr,a
      00311F E5 F0            [12] 4293 	mov	a,b
      003121 A3               [24] 4294 	inc	dptr
      003122 F0               [24] 4295 	movx	@dptr,a
                           001088  4296 	C$LCD_Driver.c$782$3_1$207 ==.
                                   4297 ;	LCD_Driver.c:782: putstr("And what col?:");
      003123 90 45 16         [24] 4298 	mov	dptr,#___str_40
      003126 75 F0 80         [24] 4299 	mov	b,#0x80
      003129 12 20 C8         [24] 4300 	lcall	_putstr
                           001091  4301 	C$LCD_Driver.c$783$3_1$207 ==.
                                   4302 ;	LCD_Driver.c:783: col = get_number();
      00312C 12 25 E9         [24] 4303 	lcall	_get_number
      00312F AE 82            [24] 4304 	mov	r6,dpl
      003131 AF 83            [24] 4305 	mov	r7,dph
      003133 90 04 E3         [24] 4306 	mov	dptr,#_main_col_65537_203
      003136 EE               [12] 4307 	mov	a,r6
      003137 F0               [24] 4308 	movx	@dptr,a
      003138 EF               [12] 4309 	mov	a,r7
      003139 A3               [24] 4310 	inc	dptr
      00313A F0               [24] 4311 	movx	@dptr,a
                           0010A0  4312 	C$LCD_Driver.c$785$3_1$207 ==.
                                   4313 ;	LCD_Driver.c:785: lcd_string_at(row, col, input_buffer);
      00313B 90 04 E1         [24] 4314 	mov	dptr,#_main_row_65537_203
      00313E E0               [24] 4315 	movx	a,@dptr
      00313F FC               [12] 4316 	mov	r4,a
      003140 A3               [24] 4317 	inc	dptr
      003141 E0               [24] 4318 	movx	a,@dptr
      003142 90 04 1A         [24] 4319 	mov	dptr,#_lcd_string_at_PARM_2
      003145 EE               [12] 4320 	mov	a,r6
      003146 F0               [24] 4321 	movx	@dptr,a
      003147 90 04 1B         [24] 4322 	mov	dptr,#_lcd_string_at_PARM_3
      00314A 74 A0            [12] 4323 	mov	a,#_main_input_buffer_65537_203
      00314C F0               [24] 4324 	movx	@dptr,a
      00314D 74 04            [12] 4325 	mov	a,#(_main_input_buffer_65537_203 >> 8)
      00314F A3               [24] 4326 	inc	dptr
      003150 F0               [24] 4327 	movx	@dptr,a
      003151 E4               [12] 4328 	clr	a
      003152 A3               [24] 4329 	inc	dptr
      003153 F0               [24] 4330 	movx	@dptr,a
      003154 8C 82            [24] 4331 	mov	dpl,r4
      003156 12 24 EC         [24] 4332 	lcall	_lcd_string_at
                           0010BE  4333 	C$LCD_Driver.c$786$3_1$207 ==.
                                   4334 ;	LCD_Driver.c:786: break;
      003159 02 32 88         [24] 4335 	ljmp	00123$
                           0010C1  4336 	C$LCD_Driver.c$788$3_1$207 ==.
                                   4337 ;	LCD_Driver.c:788: case 'c':
      00315C                       4338 00109$:
                           0010C1  4339 	C$LCD_Driver.c$789$3_1$207 ==.
                                   4340 ;	LCD_Driver.c:789: putstr("Enter the string: ");
      00315C 90 45 25         [24] 4341 	mov	dptr,#___str_41
      00315F 75 F0 80         [24] 4342 	mov	b,#0x80
      003162 12 20 C8         [24] 4343 	lcall	_putstr
                           0010CA  4344 	C$LCD_Driver.c$790$3_1$207 ==.
                                   4345 ;	LCD_Driver.c:790: get_user_input(input_buffer, 64);
      003165 90 04 25         [24] 4346 	mov	dptr,#_get_user_input_PARM_2
      003168 74 40            [12] 4347 	mov	a,#0x40
      00316A F0               [24] 4348 	movx	@dptr,a
      00316B 90 04 A0         [24] 4349 	mov	dptr,#_main_input_buffer_65537_203
      00316E 75 F0 00         [24] 4350 	mov	b,#0x00
      003171 12 26 54         [24] 4351 	lcall	_get_user_input
                           0010D9  4352 	C$LCD_Driver.c$791$3_1$207 ==.
                                   4353 ;	LCD_Driver.c:791: putstr("What row?:");
      003174 90 45 0B         [24] 4354 	mov	dptr,#___str_39
      003177 75 F0 80         [24] 4355 	mov	b,#0x80
      00317A 12 20 C8         [24] 4356 	lcall	_putstr
                           0010E2  4357 	C$LCD_Driver.c$792$3_1$207 ==.
                                   4358 ;	LCD_Driver.c:792: row = get_number();
      00317D 12 25 E9         [24] 4359 	lcall	_get_number
      003180 E5 82            [12] 4360 	mov	a,dpl
      003182 85 83 F0         [24] 4361 	mov	b,dph
      003185 90 04 E1         [24] 4362 	mov	dptr,#_main_row_65537_203
      003188 F0               [24] 4363 	movx	@dptr,a
      003189 E5 F0            [12] 4364 	mov	a,b
      00318B A3               [24] 4365 	inc	dptr
      00318C F0               [24] 4366 	movx	@dptr,a
                           0010F2  4367 	C$LCD_Driver.c$793$3_1$207 ==.
                                   4368 ;	LCD_Driver.c:793: putstr("And what col?:");
      00318D 90 45 16         [24] 4369 	mov	dptr,#___str_40
      003190 75 F0 80         [24] 4370 	mov	b,#0x80
      003193 12 20 C8         [24] 4371 	lcall	_putstr
                           0010FB  4372 	C$LCD_Driver.c$794$3_1$207 ==.
                                   4373 ;	LCD_Driver.c:794: col = get_number();
      003196 12 25 E9         [24] 4374 	lcall	_get_number
      003199 AE 82            [24] 4375 	mov	r6,dpl
      00319B AF 83            [24] 4376 	mov	r7,dph
      00319D 90 04 E3         [24] 4377 	mov	dptr,#_main_col_65537_203
      0031A0 EE               [12] 4378 	mov	a,r6
      0031A1 F0               [24] 4379 	movx	@dptr,a
      0031A2 EF               [12] 4380 	mov	a,r7
      0031A3 A3               [24] 4381 	inc	dptr
      0031A4 F0               [24] 4382 	movx	@dptr,a
                           00110A  4383 	C$LCD_Driver.c$796$3_1$207 ==.
                                   4384 ;	LCD_Driver.c:796: lcdgotoxy(row, col);
      0031A5 90 04 E1         [24] 4385 	mov	dptr,#_main_row_65537_203
      0031A8 E0               [24] 4386 	movx	a,@dptr
      0031A9 FC               [12] 4387 	mov	r4,a
      0031AA A3               [24] 4388 	inc	dptr
      0031AB E0               [24] 4389 	movx	a,@dptr
      0031AC 90 04 08         [24] 4390 	mov	dptr,#_lcdgotoxy_PARM_2
      0031AF EE               [12] 4391 	mov	a,r6
      0031B0 F0               [24] 4392 	movx	@dptr,a
      0031B1 8C 82            [24] 4393 	mov	dpl,r4
      0031B3 12 21 E1         [24] 4394 	lcall	_lcdgotoxy
                           00111B  4395 	C$LCD_Driver.c$797$3_1$207 ==.
                                   4396 ;	LCD_Driver.c:797: lcdputstr_wordwrap(input_buffer);
      0031B6 90 04 A0         [24] 4397 	mov	dptr,#_main_input_buffer_65537_203
      0031B9 75 F0 00         [24] 4398 	mov	b,#0x00
      0031BC 12 23 13         [24] 4399 	lcall	_lcdputstr_wordwrap
                           001124  4400 	C$LCD_Driver.c$798$3_1$207 ==.
                                   4401 ;	LCD_Driver.c:798: break;
      0031BF 02 32 88         [24] 4402 	ljmp	00123$
                           001127  4403 	C$LCD_Driver.c$800$3_1$207 ==.
                                   4404 ;	LCD_Driver.c:800: case 'd':
      0031C2                       4405 00110$:
                           001127  4406 	C$LCD_Driver.c$801$3_1$207 ==.
                                   4407 ;	LCD_Driver.c:801: lcdclear();
      0031C2 12 25 16         [24] 4408 	lcall	_lcdclear
                           00112A  4409 	C$LCD_Driver.c$802$3_1$207 ==.
                                   4410 ;	LCD_Driver.c:802: break;
      0031C5 02 32 88         [24] 4411 	ljmp	00123$
                           00112D  4412 	C$LCD_Driver.c$804$3_1$207 ==.
                                   4413 ;	LCD_Driver.c:804: case 'e':
      0031C8                       4414 00111$:
                           00112D  4415 	C$LCD_Driver.c$805$3_1$207 ==.
                                   4416 ;	LCD_Driver.c:805: lcdinit();
      0031C8 12 25 82         [24] 4417 	lcall	_lcdinit
                           001130  4418 	C$LCD_Driver.c$806$3_1$207 ==.
                                   4419 ;	LCD_Driver.c:806: break;
      0031CB 02 32 88         [24] 4420 	ljmp	00123$
                           001133  4421 	C$LCD_Driver.c$808$3_1$207 ==.
                                   4422 ;	LCD_Driver.c:808: case 'f':
      0031CE                       4423 00112$:
                           001133  4424 	C$LCD_Driver.c$809$3_1$207 ==.
                                   4425 ;	LCD_Driver.c:809: let_user_create_char();
      0031CE 12 2A B6         [24] 4426 	lcall	_let_user_create_char
                           001136  4427 	C$LCD_Driver.c$810$3_1$207 ==.
                                   4428 ;	LCD_Driver.c:810: break;
      0031D1 02 32 88         [24] 4429 	ljmp	00123$
                           001139  4430 	C$LCD_Driver.c$812$3_1$207 ==.
                                   4431 ;	LCD_Driver.c:812: case 'g':
      0031D4                       4432 00113$:
                           001139  4433 	C$LCD_Driver.c$813$3_1$207 ==.
                                   4434 ;	LCD_Driver.c:813: putstr("Enter the custom character number: ");
      0031D4 90 45 38         [24] 4435 	mov	dptr,#___str_42
      0031D7 75 F0 80         [24] 4436 	mov	b,#0x80
      0031DA 12 20 C8         [24] 4437 	lcall	_putstr
                           001142  4438 	C$LCD_Driver.c$814$3_1$207 ==.
                                   4439 ;	LCD_Driver.c:814: get_user_input(char_buffer, 2);
      0031DD 90 04 25         [24] 4440 	mov	dptr,#_get_user_input_PARM_2
      0031E0 74 02            [12] 4441 	mov	a,#0x02
      0031E2 F0               [24] 4442 	movx	@dptr,a
      0031E3 90 04 E0         [24] 4443 	mov	dptr,#_main_char_buffer_65537_203
      0031E6 75 F0 00         [24] 4444 	mov	b,#0x00
      0031E9 12 26 54         [24] 4445 	lcall	_get_user_input
                           001151  4446 	C$LCD_Driver.c$816$3_1$207 ==.
                                   4447 ;	LCD_Driver.c:816: if ((*char_buffer < '0') || (*char_buffer > '7')) {
      0031EC 90 04 E0         [24] 4448 	mov	dptr,#_main_char_buffer_65537_203
      0031EF E0               [24] 4449 	movx	a,@dptr
      0031F0 FF               [12] 4450 	mov	r7,a
      0031F1 BF 30 00         [24] 4451 	cjne	r7,#0x30,00212$
      0031F4                       4452 00212$:
      0031F4 40 05            [24] 4453 	jc	00114$
      0031F6 EF               [12] 4454 	mov	a,r7
      0031F7 24 C8            [12] 4455 	add	a,#0xff - 0x37
      0031F9 50 0C            [24] 4456 	jnc	00115$
      0031FB                       4457 00114$:
                           001160  4458 	C$LCD_Driver.c$817$4_1$208 ==.
                                   4459 ;	LCD_Driver.c:817: putstr("Error: Custom character code must be between 0 and 7.\n\r");
      0031FB 90 41 1F         [24] 4460 	mov	dptr,#___str_2
      0031FE 75 F0 80         [24] 4461 	mov	b,#0x80
      003201 12 20 C8         [24] 4462 	lcall	_putstr
                           001169  4463 	C$LCD_Driver.c$818$4_1$208 ==.
                                   4464 ;	LCD_Driver.c:818: break;
      003204 02 32 88         [24] 4465 	ljmp	00123$
      003207                       4466 00115$:
                           00116C  4467 	C$LCD_Driver.c$821$3_1$207 ==.
                                   4468 ;	LCD_Driver.c:821: putstr("What row?:");
      003207 90 45 0B         [24] 4469 	mov	dptr,#___str_39
      00320A 75 F0 80         [24] 4470 	mov	b,#0x80
      00320D 12 20 C8         [24] 4471 	lcall	_putstr
                           001175  4472 	C$LCD_Driver.c$822$3_1$207 ==.
                                   4473 ;	LCD_Driver.c:822: row = get_number();
      003210 12 25 E9         [24] 4474 	lcall	_get_number
      003213 E5 82            [12] 4475 	mov	a,dpl
      003215 85 83 F0         [24] 4476 	mov	b,dph
      003218 90 04 E1         [24] 4477 	mov	dptr,#_main_row_65537_203
      00321B F0               [24] 4478 	movx	@dptr,a
      00321C E5 F0            [12] 4479 	mov	a,b
      00321E A3               [24] 4480 	inc	dptr
      00321F F0               [24] 4481 	movx	@dptr,a
                           001185  4482 	C$LCD_Driver.c$823$3_1$207 ==.
                                   4483 ;	LCD_Driver.c:823: putstr("And what col?:");
      003220 90 45 16         [24] 4484 	mov	dptr,#___str_40
      003223 75 F0 80         [24] 4485 	mov	b,#0x80
      003226 12 20 C8         [24] 4486 	lcall	_putstr
                           00118E  4487 	C$LCD_Driver.c$824$3_1$207 ==.
                                   4488 ;	LCD_Driver.c:824: col = get_number();
      003229 12 25 E9         [24] 4489 	lcall	_get_number
      00322C AE 82            [24] 4490 	mov	r6,dpl
      00322E AF 83            [24] 4491 	mov	r7,dph
      003230 90 04 E3         [24] 4492 	mov	dptr,#_main_col_65537_203
      003233 EE               [12] 4493 	mov	a,r6
      003234 F0               [24] 4494 	movx	@dptr,a
      003235 EF               [12] 4495 	mov	a,r7
      003236 A3               [24] 4496 	inc	dptr
      003237 F0               [24] 4497 	movx	@dptr,a
                           00119D  4498 	C$LCD_Driver.c$826$3_1$207 ==.
                                   4499 ;	LCD_Driver.c:826: lcd_putchar_at(row, col, *char_buffer - '0'); // Convert char to number
      003238 90 04 E1         [24] 4500 	mov	dptr,#_main_row_65537_203
      00323B E0               [24] 4501 	movx	a,@dptr
      00323C FC               [12] 4502 	mov	r4,a
      00323D A3               [24] 4503 	inc	dptr
      00323E E0               [24] 4504 	movx	a,@dptr
      00323F 90 04 E0         [24] 4505 	mov	dptr,#_main_char_buffer_65537_203
      003242 E0               [24] 4506 	movx	a,@dptr
      003243 24 D0            [12] 4507 	add	a,#0xd0
      003245 FF               [12] 4508 	mov	r7,a
      003246 90 04 17         [24] 4509 	mov	dptr,#_lcd_putchar_at_PARM_2
      003249 EE               [12] 4510 	mov	a,r6
      00324A F0               [24] 4511 	movx	@dptr,a
      00324B 90 04 18         [24] 4512 	mov	dptr,#_lcd_putchar_at_PARM_3
      00324E EF               [12] 4513 	mov	a,r7
      00324F F0               [24] 4514 	movx	@dptr,a
      003250 8C 82            [24] 4515 	mov	dpl,r4
      003252 12 24 CD         [24] 4516 	lcall	_lcd_putchar_at
                           0011BA  4517 	C$LCD_Driver.c$827$3_1$207 ==.
                                   4518 ;	LCD_Driver.c:827: break;
                           0011BA  4519 	C$LCD_Driver.c$829$3_1$207 ==.
                                   4520 ;	LCD_Driver.c:829: case 'h':
      003255 80 31            [24] 4521 	sjmp	00123$
      003257                       4522 00117$:
                           0011BC  4523 	C$LCD_Driver.c$830$3_1$207 ==.
                                   4524 ;	LCD_Driver.c:830: menu_print();
      003257 12 2E 01         [24] 4525 	lcall	_menu_print
                           0011BF  4526 	C$LCD_Driver.c$831$3_1$207 ==.
                                   4527 ;	LCD_Driver.c:831: break;
                           0011BF  4528 	C$LCD_Driver.c$833$3_1$207 ==.
                                   4529 ;	LCD_Driver.c:833: case 'i':
      00325A 80 2C            [24] 4530 	sjmp	00123$
      00325C                       4531 00118$:
                           0011C1  4532 	C$LCD_Driver.c$834$3_1$207 ==.
                                   4533 ;	LCD_Driver.c:834: hex_dump_complete();
      00325C 12 2D E8         [24] 4534 	lcall	_hex_dump_complete
                           0011C4  4535 	C$LCD_Driver.c$835$3_1$207 ==.
                                   4536 ;	LCD_Driver.c:835: break;
                           0011C4  4537 	C$LCD_Driver.c$837$3_1$207 ==.
                                   4538 ;	LCD_Driver.c:837: case 's':
      00325F 80 27            [24] 4539 	sjmp	00123$
      003261                       4540 00119$:
                           0011C6  4541 	C$LCD_Driver.c$838$3_1$207 ==.
                                   4542 ;	LCD_Driver.c:838: clock_start();
      003261 12 28 79         [24] 4543 	lcall	_clock_start
                           0011C9  4544 	C$LCD_Driver.c$839$3_1$207 ==.
                                   4545 ;	LCD_Driver.c:839: break;
                           0011C9  4546 	C$LCD_Driver.c$841$3_1$207 ==.
                                   4547 ;	LCD_Driver.c:841: case 't':
      003264 80 22            [24] 4548 	sjmp	00123$
      003266                       4549 00120$:
                           0011CB  4550 	C$LCD_Driver.c$842$3_1$207 ==.
                                   4551 ;	LCD_Driver.c:842: clock_stop();
      003266 12 28 73         [24] 4552 	lcall	_clock_stop
                           0011CE  4553 	C$LCD_Driver.c$843$3_1$207 ==.
                                   4554 ;	LCD_Driver.c:843: break;
                           0011CE  4555 	C$LCD_Driver.c$845$3_1$207 ==.
                                   4556 ;	LCD_Driver.c:845: case 'r':
      003269 80 1D            [24] 4557 	sjmp	00123$
      00326B                       4558 00121$:
                           0011D0  4559 	C$LCD_Driver.c$846$3_1$207 ==.
                                   4560 ;	LCD_Driver.c:846: clock_reset();
      00326B 12 28 80         [24] 4561 	lcall	_clock_reset
                           0011D3  4562 	C$LCD_Driver.c$847$3_1$207 ==.
                                   4563 ;	LCD_Driver.c:847: break;
                           0011D3  4564 	C$LCD_Driver.c$849$3_1$207 ==.
                                   4565 ;	LCD_Driver.c:849: default:
      00326E 80 18            [24] 4566 	sjmp	00123$
      003270                       4567 00122$:
                           0011D5  4568 	C$LCD_Driver.c$850$3_1$207 ==.
                                   4569 ;	LCD_Driver.c:850: printf("Invalid option\n\r");
      003270 74 5C            [12] 4570 	mov	a,#___str_43
      003272 C0 E0            [24] 4571 	push	acc
      003274 74 45            [12] 4572 	mov	a,#(___str_43 >> 8)
      003276 C0 E0            [24] 4573 	push	acc
      003278 74 80            [12] 4574 	mov	a,#0x80
      00327A C0 E0            [24] 4575 	push	acc
      00327C 12 36 A8         [24] 4576 	lcall	_printf
      00327F 15 81            [12] 4577 	dec	sp
      003281 15 81            [12] 4578 	dec	sp
      003283 15 81            [12] 4579 	dec	sp
                           0011EA  4580 	C$LCD_Driver.c$851$3_1$207 ==.
                                   4581 ;	LCD_Driver.c:851: menu_print();
      003285 12 2E 01         [24] 4582 	lcall	_menu_print
                           0011ED  4583 	C$LCD_Driver.c$853$2_1$204 ==.
                                   4584 ;	LCD_Driver.c:853: }
      003288                       4585 00123$:
                           0011ED  4586 	C$LCD_Driver.c$855$2_1$204 ==.
                                   4587 ;	LCD_Driver.c:855: putstr("DONE\r\n\r\n");
      003288 90 45 6D         [24] 4588 	mov	dptr,#___str_44
      00328B 75 F0 80         [24] 4589 	mov	b,#0x80
      00328E 12 20 C8         [24] 4590 	lcall	_putstr
      003291 02 2F DF         [24] 4591 	ljmp	00103$
                           0011F9  4592 	C$LCD_Driver.c$857$1_1$202 ==.
                                   4593 ;	LCD_Driver.c:857: }
                           0011F9  4594 	C$LCD_Driver.c$857$1_1$202 ==.
                           0011F9  4595 	XG$main$0$0 ==.
      003294 22               [24] 4596 	ret
                                   4597 	.area CSEG    (CODE)
                                   4598 	.area CONST   (CODE)
                           000000  4599 G$row_addresses$0_0$0 == .
      0040F4                       4600 _row_addresses:
      0040F4 00                    4601 	.db #0x00	; 0
      0040F5 40                    4602 	.db #0x40	; 64
      0040F6 10                    4603 	.db #0x10	; 16
      0040F7 50                    4604 	.db #0x50	; 80	'P'
                           000004  4605 FLCD_Driver$__str_0$0_0$0 == .
                                   4606 	.area CONST   (CODE)
      0040F8                       4607 ___str_0:
      0040F8 0A                    4608 	.db 0x0a
      0040F9 0D                    4609 	.db 0x0d
      0040FA 00                    4610 	.db 0x00
                                   4611 	.area CSEG    (CODE)
                           0011FA  4612 FLCD_Driver$__str_1$0_0$0 == .
                                   4613 	.area CONST   (CODE)
      0040FB                       4614 ___str_1:
      0040FB 45 6E 74 65 72 20 63  4615 	.ascii "Enter custom character code (0-7): "
             75 73 74 6F 6D 20 63
             68 61 72 61 63 74 65
             72 20 63 6F 64 65 20
             28 30 2D 37 29 3A 20
      00411E 00                    4616 	.db 0x00
                                   4617 	.area CSEG    (CODE)
                           0011FA  4618 FLCD_Driver$__str_2$0_0$0 == .
                                   4619 	.area CONST   (CODE)
      00411F                       4620 ___str_2:
      00411F 45 72 72 6F 72 3A 20  4621 	.ascii "Error: Custom character code must be between 0 and 7."
             43 75 73 74 6F 6D 20
             63 68 61 72 61 63 74
             65 72 20 63 6F 64 65
             20 6D 75 73 74 20 62
             65 20 62 65 74 77 65
             65 6E 20 30 20 61 6E
             64 20 37 2E
      004154 0A                    4622 	.db 0x0a
      004155 0D                    4623 	.db 0x0d
      004156 00                    4624 	.db 0x00
                                   4625 	.area CSEG    (CODE)
                           0011FA  4626 FLCD_Driver$__str_3$0_0$0 == .
                                   4627 	.area CONST   (CODE)
      004157                       4628 ___str_3:
      004157 45 6E 74 65 72 20 35  4629 	.ascii "Enter 5 bits per row (0 or 1), press Enter after each row:"
             20 62 69 74 73 20 70
             65 72 20 72 6F 77 20
             28 30 20 6F 72 20 31
             29 2C 20 70 72 65 73
             73 20 45 6E 74 65 72
             20 61 66 74 65 72 20
             65 61 63 68 20 72 6F
             77 3A
      004191 0A                    4630 	.db 0x0a
      004192 0D                    4631 	.db 0x0d
      004193 00                    4632 	.db 0x00
                                   4633 	.area CSEG    (CODE)
                           0011FA  4634 FLCD_Driver$__str_4$0_0$0 == .
                                   4635 	.area CONST   (CODE)
      004194                       4636 ___str_4:
      004194 52 6F 77 20 25 64 3A  4637 	.ascii "Row %d: "
             20
      00419C 00                    4638 	.db 0x00
                                   4639 	.area CSEG    (CODE)
                           0011FA  4640 FLCD_Driver$__str_5$0_0$0 == .
                                   4641 	.area CONST   (CODE)
      00419D                       4642 ___str_5:
      00419D 43 75 73 74 6F 6D 20  4643 	.ascii "Custom character made :) "
             63 68 61 72 61 63 74
             65 72 20 6D 61 64 65
             20 3A 29 20
      0041B6 0A                    4644 	.db 0x0a
      0041B7 0D                    4645 	.db 0x0d
      0041B8 00                    4646 	.db 0x00
                                   4647 	.area CSEG    (CODE)
                           0011FA  4648 FLCD_Driver$__str_6$0_0$0 == .
                                   4649 	.area CONST   (CODE)
      0041B9                       4650 ___str_6:
      0041B9 0A                    4651 	.db 0x0a
      0041BA 0D                    4652 	.db 0x0d
      0041BB 4C 43 44 20 44 44 52  4653 	.ascii "LCD DDRAM HEX DUMP"
             41 4D 20 48 45 58 20
             44 55 4D 50
      0041CD 0A                    4654 	.db 0x0a
      0041CE 0D                    4655 	.db 0x0d
      0041CF 00                    4656 	.db 0x00
                                   4657 	.area CSEG    (CODE)
                           0011FA  4658 FLCD_Driver$__str_7$0_0$0 == .
                                   4659 	.area CONST   (CODE)
      0041D0                       4660 ___str_7:
      0041D0 5B 52 6F 77 5D 20 5B  4661 	.ascii "[Row] [Address]: Data (16 bytes per row)"
             41 64 64 72 65 73 73
             5D 3A 20 44 61 74 61
             20 28 31 36 20 62 79
             74 65 73 20 70 65 72
             20 72 6F 77 29
      0041F8 0A                    4662 	.db 0x0a
      0041F9 0D                    4663 	.db 0x0d
      0041FA 00                    4664 	.db 0x00
                                   4665 	.area CSEG    (CODE)
                           0011FA  4666 FLCD_Driver$__str_8$0_0$0 == .
                                   4667 	.area CONST   (CODE)
      0041FB                       4668 ___str_8:
      0041FB 2D 2D 2D 2D 2D 2D 2D  4669 	.ascii "------------------------------------------------"
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D
      00422B 0A                    4670 	.db 0x0a
      00422C 0D                    4671 	.db 0x0d
      00422D 00                    4672 	.db 0x00
                                   4673 	.area CSEG    (CODE)
                           0011FA  4674 FLCD_Driver$__str_9$0_0$0 == .
                                   4675 	.area CONST   (CODE)
      00422E                       4676 ___str_9:
      00422E 52 6F 77 20 25 64 20  4677 	.ascii "Row %d [0x%02X]:"
             5B 30 78 25 30 32 58
             5D 3A
      00423E 0A                    4678 	.db 0x0a
      00423F 0D                    4679 	.db 0x0d
      004240 00                    4680 	.db 0x00
                                   4681 	.area CSEG    (CODE)
                           0011FA  4682 FLCD_Driver$__str_10$0_0$0 == .
                                   4683 	.area CONST   (CODE)
      004241                       4684 ___str_10:
      004241 30 78 25 30 32 58 20  4685 	.ascii "0x%02X "
      004248 00                    4686 	.db 0x00
                                   4687 	.area CSEG    (CODE)
                           0011FA  4688 FLCD_Driver$__str_11$0_0$0 == .
                                   4689 	.area CONST   (CODE)
      004249                       4690 ___str_11:
      004249 0A                    4691 	.db 0x0a
      00424A 0D                    4692 	.db 0x0d
      00424B 0A                    4693 	.db 0x0a
      00424C 0D                    4694 	.db 0x0d
      00424D 00                    4695 	.db 0x00
                                   4696 	.area CSEG    (CODE)
                           0011FA  4697 FLCD_Driver$__str_12$0_0$0 == .
                                   4698 	.area CONST   (CODE)
      00424E                       4699 ___str_12:
      00424E 4C 43 44 20 43 47 52  4700 	.ascii "LCD CGRAM HEX DUMP"
             41 4D 20 48 45 58 20
             44 55 4D 50
      004260 0A                    4701 	.db 0x0a
      004261 0D                    4702 	.db 0x0d
      004262 00                    4703 	.db 0x00
                                   4704 	.area CSEG    (CODE)
                           0011FA  4705 FLCD_Driver$__str_13$0_0$0 == .
                                   4706 	.area CONST   (CODE)
      004263                       4707 ___str_13:
      004263 5B 43 68 61 72 5D 20  4708 	.ascii "[Char] [Row]: Data (8 characters x 8 rows each)"
             5B 52 6F 77 5D 3A 20
             44 61 74 61 20 28 38
             20 63 68 61 72 61 63
             74 65 72 73 20 78 20
             38 20 72 6F 77 73 20
             65 61 63 68 29
      004292 0A                    4709 	.db 0x0a
      004293 0D                    4710 	.db 0x0d
      004294 00                    4711 	.db 0x00
                                   4712 	.area CSEG    (CODE)
                           0011FA  4713 FLCD_Driver$__str_14$0_0$0 == .
                                   4714 	.area CONST   (CODE)
      004295                       4715 ___str_14:
      004295 2D 2D 2D 2D 2D 2D 2D  4716 	.ascii "--------------------------------------------------"
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D
      0042C7 0A                    4717 	.db 0x0a
      0042C8 0D                    4718 	.db 0x0d
      0042C9 00                    4719 	.db 0x00
                                   4720 	.area CSEG    (CODE)
                           0011FA  4721 FLCD_Driver$__str_15$0_0$0 == .
                                   4722 	.area CONST   (CODE)
      0042CA                       4723 ___str_15:
      0042CA 43 68 61 72 61 63 74  4724 	.ascii "Character "
             65 72 20
      0042D4 00                    4725 	.db 0x00
                                   4726 	.area CSEG    (CODE)
                           0011FA  4727 FLCD_Driver$__str_16$0_0$0 == .
                                   4728 	.area CONST   (CODE)
      0042D5                       4729 ___str_16:
      0042D5 3A                    4730 	.ascii ":"
      0042D6 0A                    4731 	.db 0x0a
      0042D7 0D                    4732 	.db 0x0d
      0042D8 00                    4733 	.db 0x00
                                   4734 	.area CSEG    (CODE)
                           0011FA  4735 FLCD_Driver$__str_17$0_0$0 == .
                                   4736 	.area CONST   (CODE)
      0042D9                       4737 ___str_17:
      0042D9 20 20 52 6F 77 20 25  4738 	.ascii "  Row %d [0x%02X]: 0x%02X = "
             64 20 5B 30 78 25 30
             32 58 5D 3A 20 30 78
             25 30 32 58 20 3D 20
      0042F5 00                    4739 	.db 0x00
                                   4740 	.area CSEG    (CODE)
                           0011FA  4741 FLCD_Driver$__str_18$0_0$0 == .
                                   4742 	.area CONST   (CODE)
      0042F6                       4743 ___str_18:
      0042F6 48 65 72 65 20 69 73  4744 	.ascii "Here is everything you can do:"
             20 65 76 65 72 79 74
             68 69 6E 67 20 79 6F
             75 20 63 61 6E 20 64
             6F 3A
      004314 0A                    4745 	.db 0x0a
      004315 0D                    4746 	.db 0x0d
      004316 00                    4747 	.db 0x00
                                   4748 	.area CSEG    (CODE)
                           0011FA  4749 FLCD_Driver$__str_19$0_0$0 == .
                                   4750 	.area CONST   (CODE)
      004317                       4751 ___str_19:
      004317 2D 2D 2D 2D 2D 2D 2D  4752 	.ascii "--------------------------------------"
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D
      00433D 0A                    4753 	.db 0x0a
      00433E 0D                    4754 	.db 0x0d
      00433F 00                    4755 	.db 0x00
                                   4756 	.area CSEG    (CODE)
                           0011FA  4757 FLCD_Driver$__str_20$0_0$0 == .
                                   4758 	.area CONST   (CODE)
      004340                       4759 ___str_20:
      004340 30 2E 20 50 75 74 20  4760 	.ascii "0. Put a character at wherever the cursor is "
             61 20 63 68 61 72 61
             63 74 65 72 20 61 74
             20 77 68 65 72 65 76
             65 72 20 74 68 65 20
             63 75 72 73 6F 72 20
             69 73 20
      00436D 0A                    4761 	.db 0x0a
      00436E 0D                    4762 	.db 0x0d
      00436F 00                    4763 	.db 0x00
                                   4764 	.area CSEG    (CODE)
                           0011FA  4765 FLCD_Driver$__str_21$0_0$0 == .
                                   4766 	.area CONST   (CODE)
      004370                       4767 ___str_21:
      004370 61 2E 20 50 75 74 20  4768 	.ascii "a. Put a character somewhere "
             61 20 63 68 61 72 61
             63 74 65 72 20 73 6F
             6D 65 77 68 65 72 65
             20
      00438D 0A                    4769 	.db 0x0a
      00438E 0D                    4770 	.db 0x0d
      00438F 00                    4771 	.db 0x00
                                   4772 	.area CSEG    (CODE)
                           0011FA  4773 FLCD_Driver$__str_22$0_0$0 == .
                                   4774 	.area CONST   (CODE)
      004390                       4775 ___str_22:
      004390 62 2E 20 50 75 74 20  4776 	.ascii "b. Put a string somewhere (letter wrap) "
             61 20 73 74 72 69 6E
             67 20 73 6F 6D 65 77
             68 65 72 65 20 28 6C
             65 74 74 65 72 20 77
             72 61 70 29 20
      0043B8 0A                    4777 	.db 0x0a
      0043B9 0D                    4778 	.db 0x0d
      0043BA 00                    4779 	.db 0x00
                                   4780 	.area CSEG    (CODE)
                           0011FA  4781 FLCD_Driver$__str_23$0_0$0 == .
                                   4782 	.area CONST   (CODE)
      0043BB                       4783 ___str_23:
      0043BB 63 2E 20 50 75 74 20  4784 	.ascii "c. Put a string somewhere (word wrap) "
             61 20 73 74 72 69 6E
             67 20 73 6F 6D 65 77
             68 65 72 65 20 28 77
             6F 72 64 20 77 72 61
             70 29 20
      0043E1 0A                    4785 	.db 0x0a
      0043E2 0D                    4786 	.db 0x0d
      0043E3 00                    4787 	.db 0x00
                                   4788 	.area CSEG    (CODE)
                           0011FA  4789 FLCD_Driver$__str_24$0_0$0 == .
                                   4790 	.area CONST   (CODE)
      0043E4                       4791 ___str_24:
      0043E4 64 2E 20 43 6C 65 61  4792 	.ascii "d. Clear screen "
             72 20 73 63 72 65 65
             6E 20
      0043F4 0A                    4793 	.db 0x0a
      0043F5 0D                    4794 	.db 0x0d
      0043F6 00                    4795 	.db 0x00
                                   4796 	.area CSEG    (CODE)
                           0011FA  4797 FLCD_Driver$__str_25$0_0$0 == .
                                   4798 	.area CONST   (CODE)
      0043F7                       4799 ___str_25:
      0043F7 65 2E 20 52 65 2D 69  4800 	.ascii "e. Re-init screen "
             6E 69 74 20 73 63 72
             65 65 6E 20
      004409 0A                    4801 	.db 0x0a
      00440A 0D                    4802 	.db 0x0d
      00440B 00                    4803 	.db 0x00
                                   4804 	.area CSEG    (CODE)
                           0011FA  4805 FLCD_Driver$__str_26$0_0$0 == .
                                   4806 	.area CONST   (CODE)
      00440C                       4807 ___str_26:
      00440C 66 2E 20 43 72 65 61  4808 	.ascii "f. Create Custom Character "
             74 65 20 43 75 73 74
             6F 6D 20 43 68 61 72
             61 63 74 65 72 20
      004427 0A                    4809 	.db 0x0a
      004428 0D                    4810 	.db 0x0d
      004429 00                    4811 	.db 0x00
                                   4812 	.area CSEG    (CODE)
                           0011FA  4813 FLCD_Driver$__str_27$0_0$0 == .
                                   4814 	.area CONST   (CODE)
      00442A                       4815 ___str_27:
      00442A 67 2E 20 50 75 74 20  4816 	.ascii "g. Put Custom Character somewhere "
             43 75 73 74 6F 6D 20
             43 68 61 72 61 63 74
             65 72 20 73 6F 6D 65
             77 68 65 72 65 20
      00444C 0A                    4817 	.db 0x0a
      00444D 0D                    4818 	.db 0x0d
      00444E 00                    4819 	.db 0x00
                                   4820 	.area CSEG    (CODE)
                           0011FA  4821 FLCD_Driver$__str_28$0_0$0 == .
                                   4822 	.area CONST   (CODE)
      00444F                       4823 ___str_28:
      00444F 68 2E 20 48 65 6C 70  4824 	.ascii "h. Help Menu "
             20 4D 65 6E 75 20
      00445C 0A                    4825 	.db 0x0a
      00445D 0D                    4826 	.db 0x0d
      00445E 00                    4827 	.db 0x00
                                   4828 	.area CSEG    (CODE)
                           0011FA  4829 FLCD_Driver$__str_29$0_0$0 == .
                                   4830 	.area CONST   (CODE)
      00445F                       4831 ___str_29:
      00445F 69 2E 20 48 65 78 20  4832 	.ascii "i. Hex Dump "
             44 75 6D 70 20
      00446B 0A                    4833 	.db 0x0a
      00446C 0D                    4834 	.db 0x0d
      00446D 00                    4835 	.db 0x00
                                   4836 	.area CSEG    (CODE)
                           0011FA  4837 FLCD_Driver$__str_30$0_0$0 == .
                                   4838 	.area CONST   (CODE)
      00446E                       4839 ___str_30:
      00446E 43 6C 6F 63 6B 20 4D  4840 	.ascii "Clock Menu: "
             65 6E 75 3A 20
      00447A 0A                    4841 	.db 0x0a
      00447B 0D                    4842 	.db 0x0d
      00447C 00                    4843 	.db 0x00
                                   4844 	.area CSEG    (CODE)
                           0011FA  4845 FLCD_Driver$__str_31$0_0$0 == .
                                   4846 	.area CONST   (CODE)
      00447D                       4847 ___str_31:
      00447D 73 2E 20 53 74 61 72  4848 	.ascii "s. Start Clock"
             74 20 43 6C 6F 63 6B
      00448B 0A                    4849 	.db 0x0a
      00448C 0D                    4850 	.db 0x0d
      00448D 00                    4851 	.db 0x00
                                   4852 	.area CSEG    (CODE)
                           0011FA  4853 FLCD_Driver$__str_32$0_0$0 == .
                                   4854 	.area CONST   (CODE)
      00448E                       4855 ___str_32:
      00448E 74 2E 20 53 74 6F 70  4856 	.ascii "t. Stop Clock"
             20 43 6C 6F 63 6B
      00449B 0A                    4857 	.db 0x0a
      00449C 0D                    4858 	.db 0x0d
      00449D 00                    4859 	.db 0x00
                                   4860 	.area CSEG    (CODE)
                           0011FA  4861 FLCD_Driver$__str_33$0_0$0 == .
                                   4862 	.area CONST   (CODE)
      00449E                       4863 ___str_33:
      00449E 72 2E 20 52 65 73 65  4864 	.ascii "r. Reset Clock"
             74 20 43 6C 6F 63 6B
      0044AC 0A                    4865 	.db 0x0a
      0044AD 0D                    4866 	.db 0x0d
      0044AE 00                    4867 	.db 0x00
                                   4868 	.area CSEG    (CODE)
                           0011FA  4869 FLCD_Driver$__str_34$0_0$0 == .
                                   4870 	.area CONST   (CODE)
      0044AF                       4871 ___str_34:
      0044AF 4C 43 44 20 49 6E 69  4872 	.ascii "LCD Initialized "
             74 69 61 6C 69 7A 65
             64 20
      0044BF 0A                    4873 	.db 0x0a
      0044C0 0D                    4874 	.db 0x0d
      0044C1 00                    4875 	.db 0x00
                                   4876 	.area CSEG    (CODE)
                           0011FA  4877 FLCD_Driver$__str_35$0_0$0 == .
                                   4878 	.area CONST   (CODE)
      0044C2                       4879 ___str_35:
      0044C2 54 69 6D 65 72 20 49  4880 	.ascii "Timer Initialized "
             6E 69 74 69 61 6C 69
             7A 65 64 20
      0044D4 0A                    4881 	.db 0x0a
      0044D5 0D                    4882 	.db 0x0d
      0044D6 00                    4883 	.db 0x00
                                   4884 	.area CSEG    (CODE)
                           0011FA  4885 FLCD_Driver$__str_36$0_0$0 == .
                                   4886 	.area CONST   (CODE)
      0044D7                       4887 ___str_36:
      0044D7 43 6C 6F 63 6B 20 44  4888 	.ascii "Clock Display Started "
             69 73 70 6C 61 79 20
             53 74 61 72 74 65 64
             20
      0044ED 0A                    4889 	.db 0x0a
      0044EE 0D                    4890 	.db 0x0d
      0044EF 00                    4891 	.db 0x00
                                   4892 	.area CSEG    (CODE)
                           0011FA  4893 FLCD_Driver$__str_37$0_0$0 == .
                                   4894 	.area CONST   (CODE)
      0044F0                       4895 ___str_37:
      0044F0 25 63                 4896 	.ascii "%c"
      0044F2 0A                    4897 	.db 0x0a
      0044F3 0D                    4898 	.db 0x0d
      0044F4 00                    4899 	.db 0x00
                                   4900 	.area CSEG    (CODE)
                           0011FA  4901 FLCD_Driver$__str_38$0_0$0 == .
                                   4902 	.area CONST   (CODE)
      0044F5                       4903 ___str_38:
      0044F5 45 6E 74 65 72 20 74  4904 	.ascii "Enter the character: "
             68 65 20 63 68 61 72
             61 63 74 65 72 3A 20
      00450A 00                    4905 	.db 0x00
                                   4906 	.area CSEG    (CODE)
                           0011FA  4907 FLCD_Driver$__str_39$0_0$0 == .
                                   4908 	.area CONST   (CODE)
      00450B                       4909 ___str_39:
      00450B 57 68 61 74 20 72 6F  4910 	.ascii "What row?:"
             77 3F 3A
      004515 00                    4911 	.db 0x00
                                   4912 	.area CSEG    (CODE)
                           0011FA  4913 FLCD_Driver$__str_40$0_0$0 == .
                                   4914 	.area CONST   (CODE)
      004516                       4915 ___str_40:
      004516 41 6E 64 20 77 68 61  4916 	.ascii "And what col?:"
             74 20 63 6F 6C 3F 3A
      004524 00                    4917 	.db 0x00
                                   4918 	.area CSEG    (CODE)
                           0011FA  4919 FLCD_Driver$__str_41$0_0$0 == .
                                   4920 	.area CONST   (CODE)
      004525                       4921 ___str_41:
      004525 45 6E 74 65 72 20 74  4922 	.ascii "Enter the string: "
             68 65 20 73 74 72 69
             6E 67 3A 20
      004537 00                    4923 	.db 0x00
                                   4924 	.area CSEG    (CODE)
                           0011FA  4925 FLCD_Driver$__str_42$0_0$0 == .
                                   4926 	.area CONST   (CODE)
      004538                       4927 ___str_42:
      004538 45 6E 74 65 72 20 74  4928 	.ascii "Enter the custom character number: "
             68 65 20 63 75 73 74
             6F 6D 20 63 68 61 72
             61 63 74 65 72 20 6E
             75 6D 62 65 72 3A 20
      00455B 00                    4929 	.db 0x00
                                   4930 	.area CSEG    (CODE)
                           0011FA  4931 FLCD_Driver$__str_43$0_0$0 == .
                                   4932 	.area CONST   (CODE)
      00455C                       4933 ___str_43:
      00455C 49 6E 76 61 6C 69 64  4934 	.ascii "Invalid option"
             20 6F 70 74 69 6F 6E
      00456A 0A                    4935 	.db 0x0a
      00456B 0D                    4936 	.db 0x0d
      00456C 00                    4937 	.db 0x00
                                   4938 	.area CSEG    (CODE)
                           0011FA  4939 FLCD_Driver$__str_44$0_0$0 == .
                                   4940 	.area CONST   (CODE)
      00456D                       4941 ___str_44:
      00456D 44 4F 4E 45           4942 	.ascii "DONE"
      004571 0D                    4943 	.db 0x0d
      004572 0A                    4944 	.db 0x0a
      004573 0D                    4945 	.db 0x0d
      004574 0A                    4946 	.db 0x0a
      004575 00                    4947 	.db 0x00
                                   4948 	.area CSEG    (CODE)
                                   4949 	.area XINIT   (CODE)
                           000000  4950 FLCD_Driver$__xinit_system_clock$0_0$0 == .
      004581                       4951 __xinit__system_clock:
      004581 00 00                 4952 	.byte #0x00, #0x00	; 0
      004583 00 00                 4953 	.byte #0x00, #0x00	; 0
      004585 00 00                 4954 	.byte #0x00, #0x00	; 0
      004587 01                    4955 	.db #0x01	; 1
      004588 00                    4956 	.db #0x00	; 0
                           000008  4957 FLCD_Driver$__xinit_timer_do_something$0_0$0 == .
      004589                       4958 __xinit__timer_do_something:
      004589 00                    4959 	.db #0x00	;  0
                           000009  4960 FLCD_Driver$__xinit_cursor_backup$0_0$0 == .
      00458A                       4961 __xinit__cursor_backup:
      00458A 00                    4962 	.db #0x00	; 0
      00458B 00                    4963 	.db #0x00	; 0
      00458C 00                    4964 	.db #0x00	; 0
                           00000C  4965 FLCD_Driver$__xinit_current_row$0_0$0 == .
      00458D                       4966 __xinit__current_row:
      00458D 00                    4967 	.db #0x00	; 0
                           00000D  4968 FLCD_Driver$__xinit_current_col$0_0$0 == .
      00458E                       4969 __xinit__current_col:
      00458E 00                    4970 	.db #0x00	; 0
                           00000E  4971 FLCD_Driver$__xinit_lcd_cmd_ptr$0_0$0 == .
      00458F                       4972 __xinit__lcd_cmd_ptr:
      00458F 00 80                 4973 	.byte #0x00,#0x80
                           000010  4974 FLCD_Driver$__xinit_lcdputch_ptr$0_0$0 == .
      004591                       4975 __xinit__lcdputch_ptr:
      004591 01 80                 4976 	.byte #0x01,#0x80
                           000012  4977 FLCD_Driver$__xinit_lcd_status_ptr$0_0$0 == .
      004593                       4978 __xinit__lcd_status_ptr:
      004593 02 80                 4979 	.byte #0x02,#0x80
                           000014  4980 FLCD_Driver$__xinit_lcd_read_ptr$0_0$0 == .
      004595                       4981 __xinit__lcd_read_ptr:
      004595 03 80                 4982 	.byte #0x03,#0x80
                           000016  4983 FLCD_Driver$__xinit_custom_char_checker$0_0$0 == .
      004597                       4984 __xinit__custom_char_checker:
      004597 15                    4985 	.db #0x15	; 21
      004598 0A                    4986 	.db #0x0a	; 10
      004599 15                    4987 	.db #0x15	; 21
      00459A 0A                    4988 	.db #0x0a	; 10
      00459B 15                    4989 	.db #0x15	; 21
      00459C 0A                    4990 	.db #0x0a	; 10
      00459D 15                    4991 	.db #0x15	; 21
      00459E 0A                    4992 	.db #0x0a	; 10
                           00001E  4993 FLCD_Driver$__xinit_custom_char_heart$0_0$0 == .
      00459F                       4994 __xinit__custom_char_heart:
      00459F 00                    4995 	.db #0x00	; 0
      0045A0 0A                    4996 	.db #0x0a	; 10
      0045A1 15                    4997 	.db #0x15	; 21
      0045A2 11                    4998 	.db #0x11	; 17
      0045A3 0A                    4999 	.db #0x0a	; 10
      0045A4 04                    5000 	.db #0x04	; 4
      0045A5 00                    5001 	.db #0x00	; 0
      0045A6 00                    5002 	.db #0x00	; 0
                           000026  5003 FLCD_Driver$__xinit_custom_char_face$0_0$0 == .
      0045A7                       5004 __xinit__custom_char_face:
      0045A7 00                    5005 	.db #0x00	; 0
      0045A8 0A                    5006 	.db #0x0a	; 10
      0045A9 00                    5007 	.db #0x00	; 0
      0045AA 04                    5008 	.db #0x04	; 4
      0045AB 0A                    5009 	.db #0x0a	; 10
      0045AC 04                    5010 	.db #0x04	; 4
      0045AD 11                    5011 	.db #0x11	; 17
      0045AE 1F                    5012 	.db #0x1f	; 31
                           00002E  5013 FLCD_Driver$__xinit_custom_char_alpaca$0_0$0 == .
      0045AF                       5014 __xinit__custom_char_alpaca:
      0045AF 02                    5015 	.db #0x02	; 2
      0045B0 03                    5016 	.db #0x03	; 3
      0045B1 02                    5017 	.db #0x02	; 2
      0045B2 12                    5018 	.db #0x12	; 18
      0045B3 0E                    5019 	.db #0x0e	; 14
      0045B4 0A                    5020 	.db #0x0a	; 10
      0045B5 0A                    5021 	.db #0x0a	; 10
      0045B6 00                    5022 	.db #0x00	; 0
                           000036  5023 FLCD_Driver$__xinit_custom_char_giraffe$0_0$0 == .
      0045B7                       5024 __xinit__custom_char_giraffe:
      0045B7 18                    5025 	.db #0x18	; 24
      0045B8 08                    5026 	.db #0x08	; 8
      0045B9 08                    5027 	.db #0x08	; 8
      0045BA 09                    5028 	.db #0x09	; 9
      0045BB 0E                    5029 	.db #0x0e	; 14
      0045BC 0A                    5030 	.db #0x0a	; 10
      0045BD 0A                    5031 	.db #0x0a	; 10
      0045BE 00                    5032 	.db #0x00	; 0
                                   5033 	.area CABS    (ABS,CODE)
