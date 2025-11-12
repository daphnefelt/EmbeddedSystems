                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module DAC_Control
                                      6 	.optsdcc -mmcs51 --model-large
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _print_menu
                                     13 	.globl _manual_dac_control
                                     14 	.globl _get_number
                                     15 	.globl _test_dc_levels
                                     16 	.globl _generate_sin_wave
                                     17 	.globl _dac_write
                                     18 	.globl _spi_transfer_bitbang
                                     19 	.globl __nop_
                                     20 	.globl _spi_transfer
                                     21 	.globl _spi_deinit
                                     22 	.globl _spi_init
                                     23 	.globl _putstr
                                     24 	.globl _generate_sin_table
                                     25 	.globl _simple_sin
                                     26 	.globl _atoi
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
                                    103 	.globl _SPDAT
                                    104 	.globl _SPSTA
                                    105 	.globl _SPCON
                                    106 	.globl _B
                                    107 	.globl _ACC
                                    108 	.globl _PSW
                                    109 	.globl _IP
                                    110 	.globl _P3
                                    111 	.globl _IE
                                    112 	.globl _P2
                                    113 	.globl _SBUF
                                    114 	.globl _SCON
                                    115 	.globl _P1
                                    116 	.globl _TH1
                                    117 	.globl _TH0
                                    118 	.globl _TL1
                                    119 	.globl _TL0
                                    120 	.globl _TMOD
                                    121 	.globl _TCON
                                    122 	.globl _PCON
                                    123 	.globl _DPH
                                    124 	.globl _DPL
                                    125 	.globl _SP
                                    126 	.globl _P0
                                    127 	.globl _bit_bang_mode
                                    128 	.globl _wave_frequency
                                    129 	.globl _sin_index
                                    130 	.globl _generate_sin_table_PARM_2
                                    131 	.globl _sin_table
                                    132 	.globl _putchar
                                    133 	.globl _getchar
                                    134 ;--------------------------------------------------------
                                    135 ; special function registers
                                    136 ;--------------------------------------------------------
                                    137 	.area RSEG    (ABS,DATA)
      000000                        138 	.org 0x0000
                           000080   139 G$P0$0_0$0 == 0x0080
                           000080   140 _P0	=	0x0080
                           000081   141 G$SP$0_0$0 == 0x0081
                           000081   142 _SP	=	0x0081
                           000082   143 G$DPL$0_0$0 == 0x0082
                           000082   144 _DPL	=	0x0082
                           000083   145 G$DPH$0_0$0 == 0x0083
                           000083   146 _DPH	=	0x0083
                           000087   147 G$PCON$0_0$0 == 0x0087
                           000087   148 _PCON	=	0x0087
                           000088   149 G$TCON$0_0$0 == 0x0088
                           000088   150 _TCON	=	0x0088
                           000089   151 G$TMOD$0_0$0 == 0x0089
                           000089   152 _TMOD	=	0x0089
                           00008A   153 G$TL0$0_0$0 == 0x008a
                           00008A   154 _TL0	=	0x008a
                           00008B   155 G$TL1$0_0$0 == 0x008b
                           00008B   156 _TL1	=	0x008b
                           00008C   157 G$TH0$0_0$0 == 0x008c
                           00008C   158 _TH0	=	0x008c
                           00008D   159 G$TH1$0_0$0 == 0x008d
                           00008D   160 _TH1	=	0x008d
                           000090   161 G$P1$0_0$0 == 0x0090
                           000090   162 _P1	=	0x0090
                           000098   163 G$SCON$0_0$0 == 0x0098
                           000098   164 _SCON	=	0x0098
                           000099   165 G$SBUF$0_0$0 == 0x0099
                           000099   166 _SBUF	=	0x0099
                           0000A0   167 G$P2$0_0$0 == 0x00a0
                           0000A0   168 _P2	=	0x00a0
                           0000A8   169 G$IE$0_0$0 == 0x00a8
                           0000A8   170 _IE	=	0x00a8
                           0000B0   171 G$P3$0_0$0 == 0x00b0
                           0000B0   172 _P3	=	0x00b0
                           0000B8   173 G$IP$0_0$0 == 0x00b8
                           0000B8   174 _IP	=	0x00b8
                           0000D0   175 G$PSW$0_0$0 == 0x00d0
                           0000D0   176 _PSW	=	0x00d0
                           0000E0   177 G$ACC$0_0$0 == 0x00e0
                           0000E0   178 _ACC	=	0x00e0
                           0000F0   179 G$B$0_0$0 == 0x00f0
                           0000F0   180 _B	=	0x00f0
                           0000C3   181 G$SPCON$0_0$0 == 0x00c3
                           0000C3   182 _SPCON	=	0x00c3
                           0000C4   183 G$SPSTA$0_0$0 == 0x00c4
                           0000C4   184 _SPSTA	=	0x00c4
                           0000C5   185 G$SPDAT$0_0$0 == 0x00c5
                           0000C5   186 _SPDAT	=	0x00c5
                                    187 ;--------------------------------------------------------
                                    188 ; special function bits
                                    189 ;--------------------------------------------------------
                                    190 	.area RSEG    (ABS,DATA)
      000000                        191 	.org 0x0000
                           000080   192 G$P0_0$0_0$0 == 0x0080
                           000080   193 _P0_0	=	0x0080
                           000081   194 G$P0_1$0_0$0 == 0x0081
                           000081   195 _P0_1	=	0x0081
                           000082   196 G$P0_2$0_0$0 == 0x0082
                           000082   197 _P0_2	=	0x0082
                           000083   198 G$P0_3$0_0$0 == 0x0083
                           000083   199 _P0_3	=	0x0083
                           000084   200 G$P0_4$0_0$0 == 0x0084
                           000084   201 _P0_4	=	0x0084
                           000085   202 G$P0_5$0_0$0 == 0x0085
                           000085   203 _P0_5	=	0x0085
                           000086   204 G$P0_6$0_0$0 == 0x0086
                           000086   205 _P0_6	=	0x0086
                           000087   206 G$P0_7$0_0$0 == 0x0087
                           000087   207 _P0_7	=	0x0087
                           000088   208 G$IT0$0_0$0 == 0x0088
                           000088   209 _IT0	=	0x0088
                           000089   210 G$IE0$0_0$0 == 0x0089
                           000089   211 _IE0	=	0x0089
                           00008A   212 G$IT1$0_0$0 == 0x008a
                           00008A   213 _IT1	=	0x008a
                           00008B   214 G$IE1$0_0$0 == 0x008b
                           00008B   215 _IE1	=	0x008b
                           00008C   216 G$TR0$0_0$0 == 0x008c
                           00008C   217 _TR0	=	0x008c
                           00008D   218 G$TF0$0_0$0 == 0x008d
                           00008D   219 _TF0	=	0x008d
                           00008E   220 G$TR1$0_0$0 == 0x008e
                           00008E   221 _TR1	=	0x008e
                           00008F   222 G$TF1$0_0$0 == 0x008f
                           00008F   223 _TF1	=	0x008f
                           000090   224 G$P1_0$0_0$0 == 0x0090
                           000090   225 _P1_0	=	0x0090
                           000091   226 G$P1_1$0_0$0 == 0x0091
                           000091   227 _P1_1	=	0x0091
                           000092   228 G$P1_2$0_0$0 == 0x0092
                           000092   229 _P1_2	=	0x0092
                           000093   230 G$P1_3$0_0$0 == 0x0093
                           000093   231 _P1_3	=	0x0093
                           000094   232 G$P1_4$0_0$0 == 0x0094
                           000094   233 _P1_4	=	0x0094
                           000095   234 G$P1_5$0_0$0 == 0x0095
                           000095   235 _P1_5	=	0x0095
                           000096   236 G$P1_6$0_0$0 == 0x0096
                           000096   237 _P1_6	=	0x0096
                           000097   238 G$P1_7$0_0$0 == 0x0097
                           000097   239 _P1_7	=	0x0097
                           000098   240 G$RI$0_0$0 == 0x0098
                           000098   241 _RI	=	0x0098
                           000099   242 G$TI$0_0$0 == 0x0099
                           000099   243 _TI	=	0x0099
                           00009A   244 G$RB8$0_0$0 == 0x009a
                           00009A   245 _RB8	=	0x009a
                           00009B   246 G$TB8$0_0$0 == 0x009b
                           00009B   247 _TB8	=	0x009b
                           00009C   248 G$REN$0_0$0 == 0x009c
                           00009C   249 _REN	=	0x009c
                           00009D   250 G$SM2$0_0$0 == 0x009d
                           00009D   251 _SM2	=	0x009d
                           00009E   252 G$SM1$0_0$0 == 0x009e
                           00009E   253 _SM1	=	0x009e
                           00009F   254 G$SM0$0_0$0 == 0x009f
                           00009F   255 _SM0	=	0x009f
                           0000A0   256 G$P2_0$0_0$0 == 0x00a0
                           0000A0   257 _P2_0	=	0x00a0
                           0000A1   258 G$P2_1$0_0$0 == 0x00a1
                           0000A1   259 _P2_1	=	0x00a1
                           0000A2   260 G$P2_2$0_0$0 == 0x00a2
                           0000A2   261 _P2_2	=	0x00a2
                           0000A3   262 G$P2_3$0_0$0 == 0x00a3
                           0000A3   263 _P2_3	=	0x00a3
                           0000A4   264 G$P2_4$0_0$0 == 0x00a4
                           0000A4   265 _P2_4	=	0x00a4
                           0000A5   266 G$P2_5$0_0$0 == 0x00a5
                           0000A5   267 _P2_5	=	0x00a5
                           0000A6   268 G$P2_6$0_0$0 == 0x00a6
                           0000A6   269 _P2_6	=	0x00a6
                           0000A7   270 G$P2_7$0_0$0 == 0x00a7
                           0000A7   271 _P2_7	=	0x00a7
                           0000A8   272 G$EX0$0_0$0 == 0x00a8
                           0000A8   273 _EX0	=	0x00a8
                           0000A9   274 G$ET0$0_0$0 == 0x00a9
                           0000A9   275 _ET0	=	0x00a9
                           0000AA   276 G$EX1$0_0$0 == 0x00aa
                           0000AA   277 _EX1	=	0x00aa
                           0000AB   278 G$ET1$0_0$0 == 0x00ab
                           0000AB   279 _ET1	=	0x00ab
                           0000AC   280 G$ES$0_0$0 == 0x00ac
                           0000AC   281 _ES	=	0x00ac
                           0000AF   282 G$EA$0_0$0 == 0x00af
                           0000AF   283 _EA	=	0x00af
                           0000B0   284 G$P3_0$0_0$0 == 0x00b0
                           0000B0   285 _P3_0	=	0x00b0
                           0000B1   286 G$P3_1$0_0$0 == 0x00b1
                           0000B1   287 _P3_1	=	0x00b1
                           0000B2   288 G$P3_2$0_0$0 == 0x00b2
                           0000B2   289 _P3_2	=	0x00b2
                           0000B3   290 G$P3_3$0_0$0 == 0x00b3
                           0000B3   291 _P3_3	=	0x00b3
                           0000B4   292 G$P3_4$0_0$0 == 0x00b4
                           0000B4   293 _P3_4	=	0x00b4
                           0000B5   294 G$P3_5$0_0$0 == 0x00b5
                           0000B5   295 _P3_5	=	0x00b5
                           0000B6   296 G$P3_6$0_0$0 == 0x00b6
                           0000B6   297 _P3_6	=	0x00b6
                           0000B7   298 G$P3_7$0_0$0 == 0x00b7
                           0000B7   299 _P3_7	=	0x00b7
                           0000B0   300 G$RXD$0_0$0 == 0x00b0
                           0000B0   301 _RXD	=	0x00b0
                           0000B1   302 G$TXD$0_0$0 == 0x00b1
                           0000B1   303 _TXD	=	0x00b1
                           0000B2   304 G$INT0$0_0$0 == 0x00b2
                           0000B2   305 _INT0	=	0x00b2
                           0000B3   306 G$INT1$0_0$0 == 0x00b3
                           0000B3   307 _INT1	=	0x00b3
                           0000B4   308 G$T0$0_0$0 == 0x00b4
                           0000B4   309 _T0	=	0x00b4
                           0000B5   310 G$T1$0_0$0 == 0x00b5
                           0000B5   311 _T1	=	0x00b5
                           0000B6   312 G$WR$0_0$0 == 0x00b6
                           0000B6   313 _WR	=	0x00b6
                           0000B7   314 G$RD$0_0$0 == 0x00b7
                           0000B7   315 _RD	=	0x00b7
                           0000B8   316 G$PX0$0_0$0 == 0x00b8
                           0000B8   317 _PX0	=	0x00b8
                           0000B9   318 G$PT0$0_0$0 == 0x00b9
                           0000B9   319 _PT0	=	0x00b9
                           0000BA   320 G$PX1$0_0$0 == 0x00ba
                           0000BA   321 _PX1	=	0x00ba
                           0000BB   322 G$PT1$0_0$0 == 0x00bb
                           0000BB   323 _PT1	=	0x00bb
                           0000BC   324 G$PS$0_0$0 == 0x00bc
                           0000BC   325 _PS	=	0x00bc
                           0000D0   326 G$P$0_0$0 == 0x00d0
                           0000D0   327 _P	=	0x00d0
                           0000D1   328 G$F1$0_0$0 == 0x00d1
                           0000D1   329 _F1	=	0x00d1
                           0000D2   330 G$OV$0_0$0 == 0x00d2
                           0000D2   331 _OV	=	0x00d2
                           0000D3   332 G$RS0$0_0$0 == 0x00d3
                           0000D3   333 _RS0	=	0x00d3
                           0000D4   334 G$RS1$0_0$0 == 0x00d4
                           0000D4   335 _RS1	=	0x00d4
                           0000D5   336 G$F0$0_0$0 == 0x00d5
                           0000D5   337 _F0	=	0x00d5
                           0000D6   338 G$AC$0_0$0 == 0x00d6
                           0000D6   339 _AC	=	0x00d6
                           0000D7   340 G$CY$0_0$0 == 0x00d7
                           0000D7   341 _CY	=	0x00d7
                                    342 ;--------------------------------------------------------
                                    343 ; overlayable register banks
                                    344 ;--------------------------------------------------------
                                    345 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        346 	.ds 8
                                    347 ;--------------------------------------------------------
                                    348 ; internal ram data
                                    349 ;--------------------------------------------------------
                                    350 	.area DSEG    (DATA)
                           000000   351 LDAC_Control.simple_sin$sloc0$0_1$0==.
      000008                        352 _simple_sin_sloc0_1_0:
      000008                        353 	.ds 4
                           000004   354 LDAC_Control.simple_sin$sloc1$0_1$0==.
      00000C                        355 _simple_sin_sloc1_1_0:
      00000C                        356 	.ds 4
                           000008   357 LDAC_Control.generate_sin_table$sloc0$0_1$0==.
      000010                        358 _generate_sin_table_sloc0_1_0:
      000010                        359 	.ds 3
                           00000B   360 LDAC_Control.generate_sin_table$sloc1$0_1$0==.
      000013                        361 _generate_sin_table_sloc1_1_0:
      000013                        362 	.ds 4
                           00000F   363 LDAC_Control.generate_sin_table$sloc2$0_1$0==.
      000017                        364 _generate_sin_table_sloc2_1_0:
      000017                        365 	.ds 3
                                    366 ;--------------------------------------------------------
                                    367 ; overlayable items in internal ram
                                    368 ;--------------------------------------------------------
                                    369 ;--------------------------------------------------------
                                    370 ; Stack segment in internal ram
                                    371 ;--------------------------------------------------------
                                    372 	.area	SSEG
      00002B                        373 __start__stack:
      00002B                        374 	.ds	1
                                    375 
                                    376 ;--------------------------------------------------------
                                    377 ; indirectly addressable internal ram data
                                    378 ;--------------------------------------------------------
                                    379 	.area ISEG    (DATA)
                                    380 ;--------------------------------------------------------
                                    381 ; absolute internal ram data
                                    382 ;--------------------------------------------------------
                                    383 	.area IABS    (ABS,DATA)
                                    384 	.area IABS    (ABS,DATA)
                                    385 ;--------------------------------------------------------
                                    386 ; bit data
                                    387 ;--------------------------------------------------------
                                    388 	.area BSEG    (BIT)
                                    389 ;--------------------------------------------------------
                                    390 ; paged external ram data
                                    391 ;--------------------------------------------------------
                                    392 	.area PSEG    (PAG,XDATA)
                                    393 ;--------------------------------------------------------
                                    394 ; external ram data
                                    395 ;--------------------------------------------------------
                                    396 	.area XSEG    (XDATA)
                           000000   397 G$sin_table$0_0$0==.
      000400                        398 _sin_table::
      000400                        399 	.ds 256
                           000100   400 LDAC_Control.simple_sin$x$1_0$67==.
      000500                        401 _simple_sin_x_65536_67:
      000500                        402 	.ds 4
                           000104   403 LDAC_Control.generate_sin_table$size$1_0$70==.
      000504                        404 _generate_sin_table_PARM_2:
      000504                        405 	.ds 2
                           000106   406 LDAC_Control.generate_sin_table$table$1_0$70==.
      000506                        407 _generate_sin_table_table_65536_70:
      000506                        408 	.ds 3
                           000109   409 LDAC_Control.putchar$c$1_0$74==.
      000509                        410 _putchar_c_65536_74:
      000509                        411 	.ds 2
                           00010B   412 LDAC_Control.putstr$s$1_0$78==.
      00050B                        413 _putstr_s_65536_78:
      00050B                        414 	.ds 3
                           00010E   415 LDAC_Control.spi_transfer$data$1_0$85==.
      00050E                        416 _spi_transfer_data_65536_85:
      00050E                        417 	.ds 1
                           00010F   418 LDAC_Control.spi_transfer_bitbang$data$1_0$89==.
      00050F                        419 _spi_transfer_bitbang_data_65536_89:
      00050F                        420 	.ds 1
                           000110   421 LDAC_Control.spi_transfer_bitbang$received$1_0$90==.
      000510                        422 _spi_transfer_bitbang_received_65536_90:
      000510                        423 	.ds 1
                           000111   424 LDAC_Control.dac_write$value$1_0$94==.
      000511                        425 _dac_write_value_65536_94:
      000511                        426 	.ds 1
                           000112   427 LDAC_Control.test_dc_levels$test_values$1_1$102==.
      000512                        428 _test_dc_levels_test_values_65537_102:
      000512                        429 	.ds 5
                           000117   430 LDAC_Control.test_dc_levels$labels$1_1$102==.
      000517                        431 _test_dc_levels_labels_65537_102:
      000517                        432 	.ds 15
                           000126   433 LDAC_Control.get_number$buffer$1_0$106==.
      000526                        434 _get_number_buffer_65536_106:
      000526                        435 	.ds 4
                           00012A   436 LDAC_Control.main$i$5_0$121==.
      00052A                        437 _main_i_327680_121:
      00052A                        438 	.ds 2
                                    439 ;--------------------------------------------------------
                                    440 ; absolute external ram data
                                    441 ;--------------------------------------------------------
                                    442 	.area XABS    (ABS,XDATA)
                                    443 ;--------------------------------------------------------
                                    444 ; external initialized ram data
                                    445 ;--------------------------------------------------------
                                    446 	.area XISEG   (XDATA)
                           000000   447 G$sin_index$0_0$0==.
      000573                        448 _sin_index::
      000573                        449 	.ds 1
                           000001   450 G$wave_frequency$0_0$0==.
      000574                        451 _wave_frequency::
      000574                        452 	.ds 2
                           000003   453 G$bit_bang_mode$0_0$0==.
      000576                        454 _bit_bang_mode::
      000576                        455 	.ds 1
                                    456 	.area HOME    (CODE)
                                    457 	.area GSINIT0 (CODE)
                                    458 	.area GSINIT1 (CODE)
                                    459 	.area GSINIT2 (CODE)
                                    460 	.area GSINIT3 (CODE)
                                    461 	.area GSINIT4 (CODE)
                                    462 	.area GSINIT5 (CODE)
                                    463 	.area GSINIT  (CODE)
                                    464 	.area GSFINAL (CODE)
                                    465 	.area CSEG    (CODE)
                                    466 ;--------------------------------------------------------
                                    467 ; interrupt vector
                                    468 ;--------------------------------------------------------
                                    469 	.area HOME    (CODE)
      002000                        470 __interrupt_vect:
      002000 02 20 06         [24]  471 	ljmp	__sdcc_gsinit_startup
                                    472 ;--------------------------------------------------------
                                    473 ; global & static initialisations
                                    474 ;--------------------------------------------------------
                                    475 	.area HOME    (CODE)
                                    476 	.area GSINIT  (CODE)
                                    477 	.area GSFINAL (CODE)
                                    478 	.area GSINIT  (CODE)
                                    479 	.globl __sdcc_gsinit_startup
                                    480 	.globl __sdcc_program_startup
                                    481 	.globl __start__stack
                                    482 	.globl __mcs51_genXINIT
                                    483 	.globl __mcs51_genXRAMCLEAR
                                    484 	.globl __mcs51_genRAMCLEAR
                                    485 	.area GSFINAL (CODE)
      00205F 02 20 03         [24]  486 	ljmp	__sdcc_program_startup
                                    487 ;--------------------------------------------------------
                                    488 ; Home
                                    489 ;--------------------------------------------------------
                                    490 	.area HOME    (CODE)
                                    491 	.area HOME    (CODE)
      002003                        492 __sdcc_program_startup:
      002003 02 27 53         [24]  493 	ljmp	_main
                                    494 ;	return from main will return to caller
                                    495 ;--------------------------------------------------------
                                    496 ; code
                                    497 ;--------------------------------------------------------
                                    498 	.area CSEG    (CODE)
                                    499 ;------------------------------------------------------------
                                    500 ;Allocation info for local variables in function 'simple_sin'
                                    501 ;------------------------------------------------------------
                                    502 ;sloc0                     Allocated with name '_simple_sin_sloc0_1_0'
                                    503 ;sloc1                     Allocated with name '_simple_sin_sloc1_1_0'
                                    504 ;x                         Allocated with name '_simple_sin_x_65536_67'
                                    505 ;x2                        Allocated with name '_simple_sin_x2_65537_69'
                                    506 ;x3                        Allocated with name '_simple_sin_x3_65537_69'
                                    507 ;x5                        Allocated with name '_simple_sin_x5_65537_69'
                                    508 ;------------------------------------------------------------
                           000000   509 	G$simple_sin$0$0 ==.
                           000000   510 	C$DAC_Control.c$37$0_0$68 ==.
                                    511 ;	DAC_Control.c:37: float simple_sin(float x) {
                                    512 ;	-----------------------------------------
                                    513 ;	 function simple_sin
                                    514 ;	-----------------------------------------
      002062                        515 _simple_sin:
                           000007   516 	ar7 = 0x07
                           000006   517 	ar6 = 0x06
                           000005   518 	ar5 = 0x05
                           000004   519 	ar4 = 0x04
                           000003   520 	ar3 = 0x03
                           000002   521 	ar2 = 0x02
                           000001   522 	ar1 = 0x01
                           000000   523 	ar0 = 0x00
      002062 AF 82            [24]  524 	mov	r7,dpl
      002064 AE 83            [24]  525 	mov	r6,dph
      002066 AD F0            [24]  526 	mov	r5,b
      002068 FC               [12]  527 	mov	r4,a
      002069 90 05 00         [24]  528 	mov	dptr,#_simple_sin_x_65536_67
      00206C EF               [12]  529 	mov	a,r7
      00206D F0               [24]  530 	movx	@dptr,a
      00206E EE               [12]  531 	mov	a,r6
      00206F A3               [24]  532 	inc	dptr
      002070 F0               [24]  533 	movx	@dptr,a
      002071 ED               [12]  534 	mov	a,r5
      002072 A3               [24]  535 	inc	dptr
      002073 F0               [24]  536 	movx	@dptr,a
      002074 EC               [12]  537 	mov	a,r4
      002075 A3               [24]  538 	inc	dptr
      002076 F0               [24]  539 	movx	@dptr,a
                           000015   540 	C$DAC_Control.c$39$1_0$68 ==.
                                    541 ;	DAC_Control.c:39: while (x > PI) x -= 2.0f * PI;
      002077                        542 00101$:
      002077 90 05 00         [24]  543 	mov	dptr,#_simple_sin_x_65536_67
      00207A E0               [24]  544 	movx	a,@dptr
      00207B FC               [12]  545 	mov	r4,a
      00207C A3               [24]  546 	inc	dptr
      00207D E0               [24]  547 	movx	a,@dptr
      00207E FD               [12]  548 	mov	r5,a
      00207F A3               [24]  549 	inc	dptr
      002080 E0               [24]  550 	movx	a,@dptr
      002081 FE               [12]  551 	mov	r6,a
      002082 A3               [24]  552 	inc	dptr
      002083 E0               [24]  553 	movx	a,@dptr
      002084 FF               [12]  554 	mov	r7,a
      002085 C0 07            [24]  555 	push	ar7
      002087 C0 06            [24]  556 	push	ar6
      002089 C0 05            [24]  557 	push	ar5
      00208B C0 04            [24]  558 	push	ar4
      00208D C0 04            [24]  559 	push	ar4
      00208F C0 05            [24]  560 	push	ar5
      002091 C0 06            [24]  561 	push	ar6
      002093 C0 07            [24]  562 	push	ar7
      002095 90 0F DB         [24]  563 	mov	dptr,#0x0fdb
      002098 75 F0 49         [24]  564 	mov	b,#0x49
      00209B 74 40            [12]  565 	mov	a,#0x40
      00209D 12 2B 58         [24]  566 	lcall	___fslt
      0020A0 AB 82            [24]  567 	mov	r3,dpl
      0020A2 E5 81            [12]  568 	mov	a,sp
      0020A4 24 FC            [12]  569 	add	a,#0xfc
      0020A6 F5 81            [12]  570 	mov	sp,a
      0020A8 D0 04            [24]  571 	pop	ar4
      0020AA D0 05            [24]  572 	pop	ar5
      0020AC D0 06            [24]  573 	pop	ar6
      0020AE D0 07            [24]  574 	pop	ar7
      0020B0 EB               [12]  575 	mov	a,r3
      0020B1 60 37            [24]  576 	jz	00104$
      0020B3 74 DB            [12]  577 	mov	a,#0xdb
      0020B5 C0 E0            [24]  578 	push	acc
      0020B7 74 0F            [12]  579 	mov	a,#0x0f
      0020B9 C0 E0            [24]  580 	push	acc
      0020BB 74 C9            [12]  581 	mov	a,#0xc9
      0020BD C0 E0            [24]  582 	push	acc
      0020BF 74 40            [12]  583 	mov	a,#0x40
      0020C1 C0 E0            [24]  584 	push	acc
      0020C3 8C 82            [24]  585 	mov	dpl,r4
      0020C5 8D 83            [24]  586 	mov	dph,r5
      0020C7 8E F0            [24]  587 	mov	b,r6
      0020C9 EF               [12]  588 	mov	a,r7
      0020CA 12 28 7D         [24]  589 	lcall	___fssub
      0020CD AC 82            [24]  590 	mov	r4,dpl
      0020CF AD 83            [24]  591 	mov	r5,dph
      0020D1 AE F0            [24]  592 	mov	r6,b
      0020D3 FF               [12]  593 	mov	r7,a
      0020D4 E5 81            [12]  594 	mov	a,sp
      0020D6 24 FC            [12]  595 	add	a,#0xfc
      0020D8 F5 81            [12]  596 	mov	sp,a
      0020DA 90 05 00         [24]  597 	mov	dptr,#_simple_sin_x_65536_67
      0020DD EC               [12]  598 	mov	a,r4
      0020DE F0               [24]  599 	movx	@dptr,a
      0020DF ED               [12]  600 	mov	a,r5
      0020E0 A3               [24]  601 	inc	dptr
      0020E1 F0               [24]  602 	movx	@dptr,a
      0020E2 EE               [12]  603 	mov	a,r6
      0020E3 A3               [24]  604 	inc	dptr
      0020E4 F0               [24]  605 	movx	@dptr,a
      0020E5 EF               [12]  606 	mov	a,r7
      0020E6 A3               [24]  607 	inc	dptr
      0020E7 F0               [24]  608 	movx	@dptr,a
                           000086   609 	C$DAC_Control.c$40$1_0$68 ==.
                                    610 ;	DAC_Control.c:40: while (x < -PI) x += 2.0f * PI;
      0020E8 80 8D            [24]  611 	sjmp	00101$
      0020EA                        612 00104$:
      0020EA 90 05 00         [24]  613 	mov	dptr,#_simple_sin_x_65536_67
      0020ED E0               [24]  614 	movx	a,@dptr
      0020EE FC               [12]  615 	mov	r4,a
      0020EF A3               [24]  616 	inc	dptr
      0020F0 E0               [24]  617 	movx	a,@dptr
      0020F1 FD               [12]  618 	mov	r5,a
      0020F2 A3               [24]  619 	inc	dptr
      0020F3 E0               [24]  620 	movx	a,@dptr
      0020F4 FE               [12]  621 	mov	r6,a
      0020F5 A3               [24]  622 	inc	dptr
      0020F6 E0               [24]  623 	movx	a,@dptr
      0020F7 FF               [12]  624 	mov	r7,a
      0020F8 C0 07            [24]  625 	push	ar7
      0020FA C0 06            [24]  626 	push	ar6
      0020FC C0 05            [24]  627 	push	ar5
      0020FE C0 04            [24]  628 	push	ar4
      002100 74 DB            [12]  629 	mov	a,#0xdb
      002102 C0 E0            [24]  630 	push	acc
      002104 74 0F            [12]  631 	mov	a,#0x0f
      002106 C0 E0            [24]  632 	push	acc
      002108 74 49            [12]  633 	mov	a,#0x49
      00210A C0 E0            [24]  634 	push	acc
      00210C 74 C0            [12]  635 	mov	a,#0xc0
      00210E C0 E0            [24]  636 	push	acc
      002110 8C 82            [24]  637 	mov	dpl,r4
      002112 8D 83            [24]  638 	mov	dph,r5
      002114 8E F0            [24]  639 	mov	b,r6
      002116 EF               [12]  640 	mov	a,r7
      002117 12 2B 58         [24]  641 	lcall	___fslt
      00211A AB 82            [24]  642 	mov	r3,dpl
      00211C E5 81            [12]  643 	mov	a,sp
      00211E 24 FC            [12]  644 	add	a,#0xfc
      002120 F5 81            [12]  645 	mov	sp,a
      002122 D0 04            [24]  646 	pop	ar4
      002124 D0 05            [24]  647 	pop	ar5
      002126 D0 06            [24]  648 	pop	ar6
      002128 D0 07            [24]  649 	pop	ar7
      00212A EB               [12]  650 	mov	a,r3
      00212B 60 37            [24]  651 	jz	00106$
      00212D 74 DB            [12]  652 	mov	a,#0xdb
      00212F C0 E0            [24]  653 	push	acc
      002131 74 0F            [12]  654 	mov	a,#0x0f
      002133 C0 E0            [24]  655 	push	acc
      002135 74 C9            [12]  656 	mov	a,#0xc9
      002137 C0 E0            [24]  657 	push	acc
      002139 74 40            [12]  658 	mov	a,#0x40
      00213B C0 E0            [24]  659 	push	acc
      00213D 8C 82            [24]  660 	mov	dpl,r4
      00213F 8D 83            [24]  661 	mov	dph,r5
      002141 8E F0            [24]  662 	mov	b,r6
      002143 EF               [12]  663 	mov	a,r7
      002144 12 2B A8         [24]  664 	lcall	___fsadd
      002147 A8 82            [24]  665 	mov	r0,dpl
      002149 A9 83            [24]  666 	mov	r1,dph
      00214B AA F0            [24]  667 	mov	r2,b
      00214D FB               [12]  668 	mov	r3,a
      00214E E5 81            [12]  669 	mov	a,sp
      002150 24 FC            [12]  670 	add	a,#0xfc
      002152 F5 81            [12]  671 	mov	sp,a
      002154 90 05 00         [24]  672 	mov	dptr,#_simple_sin_x_65536_67
      002157 E8               [12]  673 	mov	a,r0
      002158 F0               [24]  674 	movx	@dptr,a
      002159 E9               [12]  675 	mov	a,r1
      00215A A3               [24]  676 	inc	dptr
      00215B F0               [24]  677 	movx	@dptr,a
      00215C EA               [12]  678 	mov	a,r2
      00215D A3               [24]  679 	inc	dptr
      00215E F0               [24]  680 	movx	@dptr,a
      00215F EB               [12]  681 	mov	a,r3
      002160 A3               [24]  682 	inc	dptr
      002161 F0               [24]  683 	movx	@dptr,a
      002162 80 86            [24]  684 	sjmp	00104$
      002164                        685 00106$:
                           000102   686 	C$DAC_Control.c$43$1_1$68 ==.
                                    687 ;	DAC_Control.c:43: float x2 = x * x;
      002164 C0 07            [24]  688 	push	ar7
      002166 C0 06            [24]  689 	push	ar6
      002168 C0 05            [24]  690 	push	ar5
      00216A C0 04            [24]  691 	push	ar4
      00216C C0 04            [24]  692 	push	ar4
      00216E C0 05            [24]  693 	push	ar5
      002170 C0 06            [24]  694 	push	ar6
      002172 C0 07            [24]  695 	push	ar7
                           000112   696 	C$DAC_Control.c$44$1_1$68 ==.
                                    697 ;	DAC_Control.c:44: float x3 = x2 * x;
      002174 8C 82            [24]  698 	mov	dpl,r4
      002176 8D 83            [24]  699 	mov	dph,r5
      002178 8E F0            [24]  700 	mov	b,r6
      00217A EF               [12]  701 	mov	a,r7
      00217B 12 29 15         [24]  702 	lcall	___fsmul
      00217E 85 82 08         [24]  703 	mov	_simple_sin_sloc0_1_0,dpl
      002181 85 83 09         [24]  704 	mov	(_simple_sin_sloc0_1_0 + 1),dph
      002184 85 F0 0A         [24]  705 	mov	(_simple_sin_sloc0_1_0 + 2),b
      002187 F5 0B            [12]  706 	mov	(_simple_sin_sloc0_1_0 + 3),a
      002189 E5 81            [12]  707 	mov	a,sp
      00218B 24 FC            [12]  708 	add	a,#0xfc
      00218D F5 81            [12]  709 	mov	sp,a
      00218F D0 04            [24]  710 	pop	ar4
      002191 D0 05            [24]  711 	pop	ar5
      002193 D0 06            [24]  712 	pop	ar6
      002195 D0 07            [24]  713 	pop	ar7
      002197 C0 07            [24]  714 	push	ar7
      002199 C0 06            [24]  715 	push	ar6
      00219B C0 05            [24]  716 	push	ar5
      00219D C0 04            [24]  717 	push	ar4
      00219F C0 04            [24]  718 	push	ar4
      0021A1 C0 05            [24]  719 	push	ar5
      0021A3 C0 06            [24]  720 	push	ar6
      0021A5 C0 07            [24]  721 	push	ar7
                           000145   722 	C$DAC_Control.c$45$1_1$68 ==.
                                    723 ;	DAC_Control.c:45: float x5 = x3 * x2;
      0021A7 85 08 82         [24]  724 	mov	dpl,_simple_sin_sloc0_1_0
      0021AA 85 09 83         [24]  725 	mov	dph,(_simple_sin_sloc0_1_0 + 1)
      0021AD 85 0A F0         [24]  726 	mov	b,(_simple_sin_sloc0_1_0 + 2)
      0021B0 E5 0B            [12]  727 	mov	a,(_simple_sin_sloc0_1_0 + 3)
      0021B2 12 29 15         [24]  728 	lcall	___fsmul
      0021B5 85 82 0C         [24]  729 	mov	_simple_sin_sloc1_1_0,dpl
      0021B8 85 83 0D         [24]  730 	mov	(_simple_sin_sloc1_1_0 + 1),dph
      0021BB 85 F0 0E         [24]  731 	mov	(_simple_sin_sloc1_1_0 + 2),b
      0021BE F5 0F            [12]  732 	mov	(_simple_sin_sloc1_1_0 + 3),a
      0021C0 E5 81            [12]  733 	mov	a,sp
      0021C2 24 FC            [12]  734 	add	a,#0xfc
      0021C4 F5 81            [12]  735 	mov	sp,a
      0021C6 C0 08            [24]  736 	push	_simple_sin_sloc0_1_0
      0021C8 C0 09            [24]  737 	push	(_simple_sin_sloc0_1_0 + 1)
      0021CA C0 0A            [24]  738 	push	(_simple_sin_sloc0_1_0 + 2)
      0021CC C0 0B            [24]  739 	push	(_simple_sin_sloc0_1_0 + 3)
                           00016C   740 	C$DAC_Control.c$47$1_1$68 ==.
                                    741 ;	DAC_Control.c:47: return x - (x3 / 6.0f) + (x5 / 120.0f);
      0021CE 85 0C 82         [24]  742 	mov	dpl,_simple_sin_sloc1_1_0
      0021D1 85 0D 83         [24]  743 	mov	dph,(_simple_sin_sloc1_1_0 + 1)
      0021D4 85 0E F0         [24]  744 	mov	b,(_simple_sin_sloc1_1_0 + 2)
      0021D7 E5 0F            [12]  745 	mov	a,(_simple_sin_sloc1_1_0 + 3)
      0021D9 12 29 15         [24]  746 	lcall	___fsmul
      0021DC 85 82 08         [24]  747 	mov	_simple_sin_sloc0_1_0,dpl
      0021DF 85 83 09         [24]  748 	mov	(_simple_sin_sloc0_1_0 + 1),dph
      0021E2 85 F0 0A         [24]  749 	mov	(_simple_sin_sloc0_1_0 + 2),b
      0021E5 F5 0B            [12]  750 	mov	(_simple_sin_sloc0_1_0 + 3),a
      0021E7 E5 81            [12]  751 	mov	a,sp
      0021E9 24 FC            [12]  752 	add	a,#0xfc
      0021EB F5 81            [12]  753 	mov	sp,a
      0021ED E4               [12]  754 	clr	a
      0021EE C0 E0            [24]  755 	push	acc
      0021F0 C0 E0            [24]  756 	push	acc
      0021F2 74 C0            [12]  757 	mov	a,#0xc0
      0021F4 C0 E0            [24]  758 	push	acc
      0021F6 74 40            [12]  759 	mov	a,#0x40
      0021F8 C0 E0            [24]  760 	push	acc
      0021FA 85 0C 82         [24]  761 	mov	dpl,_simple_sin_sloc1_1_0
      0021FD 85 0D 83         [24]  762 	mov	dph,(_simple_sin_sloc1_1_0 + 1)
      002200 85 0E F0         [24]  763 	mov	b,(_simple_sin_sloc1_1_0 + 2)
      002203 E5 0F            [12]  764 	mov	a,(_simple_sin_sloc1_1_0 + 3)
      002205 12 37 39         [24]  765 	lcall	___fsdiv
      002208 A8 82            [24]  766 	mov	r0,dpl
      00220A A9 83            [24]  767 	mov	r1,dph
      00220C AA F0            [24]  768 	mov	r2,b
      00220E FB               [12]  769 	mov	r3,a
      00220F E5 81            [12]  770 	mov	a,sp
      002211 24 FC            [12]  771 	add	a,#0xfc
      002213 F5 81            [12]  772 	mov	sp,a
      002215 D0 04            [24]  773 	pop	ar4
      002217 D0 05            [24]  774 	pop	ar5
      002219 D0 06            [24]  775 	pop	ar6
      00221B D0 07            [24]  776 	pop	ar7
      00221D C0 00            [24]  777 	push	ar0
      00221F C0 01            [24]  778 	push	ar1
      002221 C0 02            [24]  779 	push	ar2
      002223 C0 03            [24]  780 	push	ar3
      002225 8C 82            [24]  781 	mov	dpl,r4
      002227 8D 83            [24]  782 	mov	dph,r5
      002229 8E F0            [24]  783 	mov	b,r6
      00222B EF               [12]  784 	mov	a,r7
      00222C 12 28 7D         [24]  785 	lcall	___fssub
      00222F AC 82            [24]  786 	mov	r4,dpl
      002231 AD 83            [24]  787 	mov	r5,dph
      002233 AE F0            [24]  788 	mov	r6,b
      002235 FF               [12]  789 	mov	r7,a
      002236 E5 81            [12]  790 	mov	a,sp
      002238 24 FC            [12]  791 	add	a,#0xfc
      00223A F5 81            [12]  792 	mov	sp,a
      00223C C0 07            [24]  793 	push	ar7
      00223E C0 06            [24]  794 	push	ar6
      002240 C0 05            [24]  795 	push	ar5
      002242 C0 04            [24]  796 	push	ar4
      002244 E4               [12]  797 	clr	a
      002245 C0 E0            [24]  798 	push	acc
      002247 C0 E0            [24]  799 	push	acc
      002249 74 F0            [12]  800 	mov	a,#0xf0
      00224B C0 E0            [24]  801 	push	acc
      00224D 74 42            [12]  802 	mov	a,#0x42
      00224F C0 E0            [24]  803 	push	acc
      002251 85 08 82         [24]  804 	mov	dpl,_simple_sin_sloc0_1_0
      002254 85 09 83         [24]  805 	mov	dph,(_simple_sin_sloc0_1_0 + 1)
      002257 85 0A F0         [24]  806 	mov	b,(_simple_sin_sloc0_1_0 + 2)
      00225A E5 0B            [12]  807 	mov	a,(_simple_sin_sloc0_1_0 + 3)
      00225C 12 37 39         [24]  808 	lcall	___fsdiv
      00225F A8 82            [24]  809 	mov	r0,dpl
      002261 A9 83            [24]  810 	mov	r1,dph
      002263 AA F0            [24]  811 	mov	r2,b
      002265 FB               [12]  812 	mov	r3,a
      002266 E5 81            [12]  813 	mov	a,sp
      002268 24 FC            [12]  814 	add	a,#0xfc
      00226A F5 81            [12]  815 	mov	sp,a
      00226C D0 04            [24]  816 	pop	ar4
      00226E D0 05            [24]  817 	pop	ar5
      002270 D0 06            [24]  818 	pop	ar6
      002272 D0 07            [24]  819 	pop	ar7
      002274 C0 00            [24]  820 	push	ar0
      002276 C0 01            [24]  821 	push	ar1
      002278 C0 02            [24]  822 	push	ar2
      00227A C0 03            [24]  823 	push	ar3
      00227C 8C 82            [24]  824 	mov	dpl,r4
      00227E 8D 83            [24]  825 	mov	dph,r5
      002280 8E F0            [24]  826 	mov	b,r6
      002282 EF               [12]  827 	mov	a,r7
      002283 12 2B A8         [24]  828 	lcall	___fsadd
      002286 AC 82            [24]  829 	mov	r4,dpl
      002288 AD 83            [24]  830 	mov	r5,dph
      00228A AE F0            [24]  831 	mov	r6,b
      00228C FF               [12]  832 	mov	r7,a
      00228D E5 81            [12]  833 	mov	a,sp
      00228F 24 FC            [12]  834 	add	a,#0xfc
      002291 F5 81            [12]  835 	mov	sp,a
      002293 8C 82            [24]  836 	mov	dpl,r4
      002295 8D 83            [24]  837 	mov	dph,r5
      002297 8E F0            [24]  838 	mov	b,r6
      002299 EF               [12]  839 	mov	a,r7
                           000238   840 	C$DAC_Control.c$48$1_1$68 ==.
                                    841 ;	DAC_Control.c:48: }
                           000238   842 	C$DAC_Control.c$48$1_1$68 ==.
                           000238   843 	XG$simple_sin$0$0 ==.
      00229A 22               [24]  844 	ret
                                    845 ;------------------------------------------------------------
                                    846 ;Allocation info for local variables in function 'generate_sin_table'
                                    847 ;------------------------------------------------------------
                                    848 ;sloc0                     Allocated with name '_generate_sin_table_sloc0_1_0'
                                    849 ;sloc1                     Allocated with name '_generate_sin_table_sloc1_1_0'
                                    850 ;sloc2                     Allocated with name '_generate_sin_table_sloc2_1_0'
                                    851 ;size                      Allocated with name '_generate_sin_table_PARM_2'
                                    852 ;table                     Allocated with name '_generate_sin_table_table_65536_70'
                                    853 ;i                         Allocated with name '_generate_sin_table_i_131072_72'
                                    854 ;angle                     Allocated with name '_generate_sin_table_angle_196608_73'
                                    855 ;sin_val                   Allocated with name '_generate_sin_table_sin_val_196608_73'
                                    856 ;scaled                    Allocated with name '_generate_sin_table_scaled_196608_73'
                                    857 ;------------------------------------------------------------
                           000239   858 	G$generate_sin_table$0$0 ==.
                           000239   859 	C$DAC_Control.c$49$1_1$72 ==.
                                    860 ;	DAC_Control.c:49: void generate_sin_table(uint8_t *table, uint16_t size) {
                                    861 ;	-----------------------------------------
                                    862 ;	 function generate_sin_table
                                    863 ;	-----------------------------------------
      00229B                        864 _generate_sin_table:
      00229B AF F0            [24]  865 	mov	r7,b
      00229D AE 83            [24]  866 	mov	r6,dph
      00229F E5 82            [12]  867 	mov	a,dpl
      0022A1 90 05 06         [24]  868 	mov	dptr,#_generate_sin_table_table_65536_70
      0022A4 F0               [24]  869 	movx	@dptr,a
      0022A5 EE               [12]  870 	mov	a,r6
      0022A6 A3               [24]  871 	inc	dptr
      0022A7 F0               [24]  872 	movx	@dptr,a
      0022A8 EF               [12]  873 	mov	a,r7
      0022A9 A3               [24]  874 	inc	dptr
      0022AA F0               [24]  875 	movx	@dptr,a
                           000249   876 	C$DAC_Control.c$50$3_0$73 ==.
                                    877 ;	DAC_Control.c:50: for (uint16_t i = 0; i < size; i++) {
      0022AB 90 05 06         [24]  878 	mov	dptr,#_generate_sin_table_table_65536_70
      0022AE E0               [24]  879 	movx	a,@dptr
      0022AF F5 10            [12]  880 	mov	_generate_sin_table_sloc0_1_0,a
      0022B1 A3               [24]  881 	inc	dptr
      0022B2 E0               [24]  882 	movx	a,@dptr
      0022B3 F5 11            [12]  883 	mov	(_generate_sin_table_sloc0_1_0 + 1),a
      0022B5 A3               [24]  884 	inc	dptr
      0022B6 E0               [24]  885 	movx	a,@dptr
      0022B7 F5 12            [12]  886 	mov	(_generate_sin_table_sloc0_1_0 + 2),a
      0022B9 90 05 04         [24]  887 	mov	dptr,#_generate_sin_table_PARM_2
      0022BC E0               [24]  888 	movx	a,@dptr
      0022BD FB               [12]  889 	mov	r3,a
      0022BE A3               [24]  890 	inc	dptr
      0022BF E0               [24]  891 	movx	a,@dptr
      0022C0 FC               [12]  892 	mov	r4,a
      0022C1 79 00            [12]  893 	mov	r1,#0x00
      0022C3 7A 00            [12]  894 	mov	r2,#0x00
      0022C5                        895 00103$:
      0022C5 C3               [12]  896 	clr	c
      0022C6 E9               [12]  897 	mov	a,r1
      0022C7 9B               [12]  898 	subb	a,r3
      0022C8 EA               [12]  899 	mov	a,r2
      0022C9 9C               [12]  900 	subb	a,r4
      0022CA 40 03            [24]  901 	jc	00116$
      0022CC 02 24 17         [24]  902 	ljmp	00105$
      0022CF                        903 00116$:
                           00026D   904 	C$DAC_Control.c$53$2_0$72 ==.
                                    905 ;	DAC_Control.c:53: float angle = 2.0 * PI * i / size;
      0022CF 89 82            [24]  906 	mov	dpl,r1
      0022D1 8A 83            [24]  907 	mov	dph,r2
      0022D3 C0 04            [24]  908 	push	ar4
      0022D5 C0 03            [24]  909 	push	ar3
      0022D7 C0 02            [24]  910 	push	ar2
      0022D9 C0 01            [24]  911 	push	ar1
      0022DB 12 2C 4A         [24]  912 	lcall	___uint2fs
      0022DE A8 82            [24]  913 	mov	r0,dpl
      0022E0 AD 83            [24]  914 	mov	r5,dph
      0022E2 AE F0            [24]  915 	mov	r6,b
      0022E4 FF               [12]  916 	mov	r7,a
      0022E5 C0 00            [24]  917 	push	ar0
      0022E7 C0 05            [24]  918 	push	ar5
      0022E9 C0 06            [24]  919 	push	ar6
      0022EB C0 07            [24]  920 	push	ar7
      0022ED 90 0F DB         [24]  921 	mov	dptr,#0x0fdb
      0022F0 75 F0 C9         [24]  922 	mov	b,#0xc9
      0022F3 74 40            [12]  923 	mov	a,#0x40
      0022F5 12 29 15         [24]  924 	lcall	___fsmul
      0022F8 85 82 13         [24]  925 	mov	_generate_sin_table_sloc1_1_0,dpl
      0022FB 85 83 14         [24]  926 	mov	(_generate_sin_table_sloc1_1_0 + 1),dph
      0022FE 85 F0 15         [24]  927 	mov	(_generate_sin_table_sloc1_1_0 + 2),b
      002301 F5 16            [12]  928 	mov	(_generate_sin_table_sloc1_1_0 + 3),a
      002303 E5 81            [12]  929 	mov	a,sp
      002305 24 FC            [12]  930 	add	a,#0xfc
      002307 F5 81            [12]  931 	mov	sp,a
      002309 D0 01            [24]  932 	pop	ar1
      00230B D0 02            [24]  933 	pop	ar2
      00230D D0 03            [24]  934 	pop	ar3
      00230F D0 04            [24]  935 	pop	ar4
      002311 8B 82            [24]  936 	mov	dpl,r3
      002313 8C 83            [24]  937 	mov	dph,r4
      002315 C0 04            [24]  938 	push	ar4
      002317 C0 03            [24]  939 	push	ar3
      002319 C0 02            [24]  940 	push	ar2
      00231B C0 01            [24]  941 	push	ar1
      00231D 12 2C 4A         [24]  942 	lcall	___uint2fs
      002320 A8 82            [24]  943 	mov	r0,dpl
      002322 AD 83            [24]  944 	mov	r5,dph
      002324 AE F0            [24]  945 	mov	r6,b
      002326 FF               [12]  946 	mov	r7,a
      002327 C0 00            [24]  947 	push	ar0
      002329 C0 05            [24]  948 	push	ar5
      00232B C0 06            [24]  949 	push	ar6
      00232D C0 07            [24]  950 	push	ar7
                           0002CD   951 	C$DAC_Control.c$54$2_0$72 ==.
                                    952 ;	DAC_Control.c:54: float sin_val = simple_sin(angle);
      00232F 85 13 82         [24]  953 	mov	dpl,_generate_sin_table_sloc1_1_0
      002332 85 14 83         [24]  954 	mov	dph,(_generate_sin_table_sloc1_1_0 + 1)
      002335 85 15 F0         [24]  955 	mov	b,(_generate_sin_table_sloc1_1_0 + 2)
      002338 E5 16            [12]  956 	mov	a,(_generate_sin_table_sloc1_1_0 + 3)
      00233A 12 37 39         [24]  957 	lcall	___fsdiv
      00233D A8 82            [24]  958 	mov	r0,dpl
      00233F AD 83            [24]  959 	mov	r5,dph
      002341 AE F0            [24]  960 	mov	r6,b
      002343 FF               [12]  961 	mov	r7,a
      002344 E5 81            [12]  962 	mov	a,sp
      002346 24 FC            [12]  963 	add	a,#0xfc
      002348 F5 81            [12]  964 	mov	sp,a
      00234A 88 82            [24]  965 	mov	dpl,r0
      00234C 8D 83            [24]  966 	mov	dph,r5
      00234E 8E F0            [24]  967 	mov	b,r6
      002350 EF               [12]  968 	mov	a,r7
      002351 12 20 62         [24]  969 	lcall	_simple_sin
      002354 A8 82            [24]  970 	mov	r0,dpl
      002356 AD 83            [24]  971 	mov	r5,dph
      002358 AE F0            [24]  972 	mov	r6,b
      00235A FF               [12]  973 	mov	r7,a
                           0002F9   974 	C$DAC_Control.c$55$2_0$72 ==.
                                    975 ;	DAC_Control.c:55: float scaled = (sin_val + 1.0f) * 127.5f;
      00235B E4               [12]  976 	clr	a
      00235C C0 E0            [24]  977 	push	acc
      00235E C0 E0            [24]  978 	push	acc
      002360 74 80            [12]  979 	mov	a,#0x80
      002362 C0 E0            [24]  980 	push	acc
      002364 74 3F            [12]  981 	mov	a,#0x3f
      002366 C0 E0            [24]  982 	push	acc
      002368 88 82            [24]  983 	mov	dpl,r0
      00236A 8D 83            [24]  984 	mov	dph,r5
      00236C 8E F0            [24]  985 	mov	b,r6
      00236E EF               [12]  986 	mov	a,r7
      00236F 12 2B A8         [24]  987 	lcall	___fsadd
      002372 A8 82            [24]  988 	mov	r0,dpl
      002374 AD 83            [24]  989 	mov	r5,dph
      002376 AE F0            [24]  990 	mov	r6,b
      002378 FF               [12]  991 	mov	r7,a
      002379 E5 81            [12]  992 	mov	a,sp
      00237B 24 FC            [12]  993 	add	a,#0xfc
      00237D F5 81            [12]  994 	mov	sp,a
      00237F C0 00            [24]  995 	push	ar0
      002381 C0 05            [24]  996 	push	ar5
      002383 C0 06            [24]  997 	push	ar6
      002385 C0 07            [24]  998 	push	ar7
                           000325   999 	C$DAC_Control.c$56$2_0$72 ==.
                                   1000 ;	DAC_Control.c:56: table[i] = (uint8_t)(scaled + 0.5); // so it rounds to nearest int
      002387 90 00 00         [24] 1001 	mov	dptr,#0x0000
      00238A 75 F0 FF         [24] 1002 	mov	b,#0xff
      00238D 74 42            [12] 1003 	mov	a,#0x42
      00238F 12 29 15         [24] 1004 	lcall	___fsmul
      002392 85 82 13         [24] 1005 	mov	_generate_sin_table_sloc1_1_0,dpl
      002395 85 83 14         [24] 1006 	mov	(_generate_sin_table_sloc1_1_0 + 1),dph
      002398 85 F0 15         [24] 1007 	mov	(_generate_sin_table_sloc1_1_0 + 2),b
      00239B F5 16            [12] 1008 	mov	(_generate_sin_table_sloc1_1_0 + 3),a
      00239D E5 81            [12] 1009 	mov	a,sp
      00239F 24 FC            [12] 1010 	add	a,#0xfc
      0023A1 F5 81            [12] 1011 	mov	sp,a
      0023A3 D0 01            [24] 1012 	pop	ar1
      0023A5 D0 02            [24] 1013 	pop	ar2
      0023A7 D0 03            [24] 1014 	pop	ar3
      0023A9 D0 04            [24] 1015 	pop	ar4
      0023AB C0 03            [24] 1016 	push	ar3
      0023AD C0 04            [24] 1017 	push	ar4
      0023AF E9               [12] 1018 	mov	a,r1
      0023B0 25 10            [12] 1019 	add	a,_generate_sin_table_sloc0_1_0
      0023B2 F5 17            [12] 1020 	mov	_generate_sin_table_sloc2_1_0,a
      0023B4 EA               [12] 1021 	mov	a,r2
      0023B5 35 11            [12] 1022 	addc	a,(_generate_sin_table_sloc0_1_0 + 1)
      0023B7 F5 18            [12] 1023 	mov	(_generate_sin_table_sloc2_1_0 + 1),a
      0023B9 85 12 19         [24] 1024 	mov	(_generate_sin_table_sloc2_1_0 + 2),(_generate_sin_table_sloc0_1_0 + 2)
      0023BC C0 04            [24] 1025 	push	ar4
      0023BE C0 03            [24] 1026 	push	ar3
      0023C0 C0 02            [24] 1027 	push	ar2
      0023C2 C0 01            [24] 1028 	push	ar1
      0023C4 E4               [12] 1029 	clr	a
      0023C5 C0 E0            [24] 1030 	push	acc
      0023C7 C0 E0            [24] 1031 	push	acc
      0023C9 C0 E0            [24] 1032 	push	acc
      0023CB 74 3F            [12] 1033 	mov	a,#0x3f
      0023CD C0 E0            [24] 1034 	push	acc
      0023CF 85 13 82         [24] 1035 	mov	dpl,_generate_sin_table_sloc1_1_0
      0023D2 85 14 83         [24] 1036 	mov	dph,(_generate_sin_table_sloc1_1_0 + 1)
      0023D5 85 15 F0         [24] 1037 	mov	b,(_generate_sin_table_sloc1_1_0 + 2)
      0023D8 E5 16            [12] 1038 	mov	a,(_generate_sin_table_sloc1_1_0 + 3)
      0023DA 12 2B A8         [24] 1039 	lcall	___fsadd
      0023DD A8 82            [24] 1040 	mov	r0,dpl
      0023DF AD 83            [24] 1041 	mov	r5,dph
      0023E1 AE F0            [24] 1042 	mov	r6,b
      0023E3 FF               [12] 1043 	mov	r7,a
      0023E4 E5 81            [12] 1044 	mov	a,sp
      0023E6 24 FC            [12] 1045 	add	a,#0xfc
      0023E8 F5 81            [12] 1046 	mov	sp,a
      0023EA 88 82            [24] 1047 	mov	dpl,r0
      0023EC 8D 83            [24] 1048 	mov	dph,r5
      0023EE 8E F0            [24] 1049 	mov	b,r6
      0023F0 EF               [12] 1050 	mov	a,r7
      0023F1 12 37 FC         [24] 1051 	lcall	___fs2uchar
      0023F4 AF 82            [24] 1052 	mov	r7,dpl
      0023F6 D0 01            [24] 1053 	pop	ar1
      0023F8 D0 02            [24] 1054 	pop	ar2
      0023FA D0 03            [24] 1055 	pop	ar3
      0023FC D0 04            [24] 1056 	pop	ar4
      0023FE 85 17 82         [24] 1057 	mov	dpl,_generate_sin_table_sloc2_1_0
      002401 85 18 83         [24] 1058 	mov	dph,(_generate_sin_table_sloc2_1_0 + 1)
      002404 85 19 F0         [24] 1059 	mov	b,(_generate_sin_table_sloc2_1_0 + 2)
      002407 EF               [12] 1060 	mov	a,r7
      002408 12 2B 3D         [24] 1061 	lcall	__gptrput
                           0003A9  1062 	C$DAC_Control.c$50$2_0$72 ==.
                                   1063 ;	DAC_Control.c:50: for (uint16_t i = 0; i < size; i++) {
      00240B 09               [12] 1064 	inc	r1
      00240C B9 00 01         [24] 1065 	cjne	r1,#0x00,00117$
      00240F 0A               [12] 1066 	inc	r2
      002410                       1067 00117$:
      002410 D0 04            [24] 1068 	pop	ar4
      002412 D0 03            [24] 1069 	pop	ar3
      002414 02 22 C5         [24] 1070 	ljmp	00103$
      002417                       1071 00105$:
                           0003B5  1072 	C$DAC_Control.c$58$2_0$72 ==.
                                   1073 ;	DAC_Control.c:58: }
                           0003B5  1074 	C$DAC_Control.c$58$2_0$72 ==.
                           0003B5  1075 	XG$generate_sin_table$0$0 ==.
      002417 22               [24] 1076 	ret
                                   1077 ;------------------------------------------------------------
                                   1078 ;Allocation info for local variables in function 'putchar'
                                   1079 ;------------------------------------------------------------
                                   1080 ;c                         Allocated with name '_putchar_c_65536_74'
                                   1081 ;------------------------------------------------------------
                           0003B6  1082 	G$putchar$0$0 ==.
                           0003B6  1083 	C$DAC_Control.c$66$2_0$75 ==.
                                   1084 ;	DAC_Control.c:66: int putchar(int c) {
                                   1085 ;	-----------------------------------------
                                   1086 ;	 function putchar
                                   1087 ;	-----------------------------------------
      002418                       1088 _putchar:
      002418 AF 83            [24] 1089 	mov	r7,dph
      00241A E5 82            [12] 1090 	mov	a,dpl
      00241C 90 05 09         [24] 1091 	mov	dptr,#_putchar_c_65536_74
      00241F F0               [24] 1092 	movx	@dptr,a
      002420 EF               [12] 1093 	mov	a,r7
      002421 A3               [24] 1094 	inc	dptr
      002422 F0               [24] 1095 	movx	@dptr,a
                           0003C1  1096 	C$DAC_Control.c$67$1_0$75 ==.
                                   1097 ;	DAC_Control.c:67: while (!TI);
      002423                       1098 00101$:
      002423 30 99 FD         [24] 1099 	jnb	_TI,00101$
                           0003C4  1100 	C$DAC_Control.c$68$1_0$75 ==.
                                   1101 ;	DAC_Control.c:68: SBUF = c;
      002426 90 05 09         [24] 1102 	mov	dptr,#_putchar_c_65536_74
      002429 E0               [24] 1103 	movx	a,@dptr
      00242A FE               [12] 1104 	mov	r6,a
      00242B A3               [24] 1105 	inc	dptr
      00242C E0               [24] 1106 	movx	a,@dptr
      00242D FF               [12] 1107 	mov	r7,a
      00242E 8E 99            [24] 1108 	mov	_SBUF,r6
                           0003CE  1109 	C$DAC_Control.c$69$1_0$75 ==.
                                   1110 ;	DAC_Control.c:69: TI = 0;
                                   1111 ;	assignBit
      002430 C2 99            [12] 1112 	clr	_TI
                           0003D0  1113 	C$DAC_Control.c$70$1_0$75 ==.
                                   1114 ;	DAC_Control.c:70: return c;
      002432 8E 82            [24] 1115 	mov	dpl,r6
      002434 8F 83            [24] 1116 	mov	dph,r7
                           0003D4  1117 	C$DAC_Control.c$71$1_0$75 ==.
                                   1118 ;	DAC_Control.c:71: }
                           0003D4  1119 	C$DAC_Control.c$71$1_0$75 ==.
                           0003D4  1120 	XG$putchar$0$0 ==.
      002436 22               [24] 1121 	ret
                                   1122 ;------------------------------------------------------------
                                   1123 ;Allocation info for local variables in function 'getchar'
                                   1124 ;------------------------------------------------------------
                           0003D5  1125 	G$getchar$0$0 ==.
                           0003D5  1126 	C$DAC_Control.c$73$1_0$77 ==.
                                   1127 ;	DAC_Control.c:73: int getchar(void) {
                                   1128 ;	-----------------------------------------
                                   1129 ;	 function getchar
                                   1130 ;	-----------------------------------------
      002437                       1131 _getchar:
                           0003D5  1132 	C$DAC_Control.c$74$1_0$77 ==.
                                   1133 ;	DAC_Control.c:74: while (!RI);
      002437                       1134 00101$:
                           0003D5  1135 	C$DAC_Control.c$75$1_0$77 ==.
                                   1136 ;	DAC_Control.c:75: RI = 0;
                                   1137 ;	assignBit
      002437 10 98 02         [24] 1138 	jbc	_RI,00114$
      00243A 80 FB            [24] 1139 	sjmp	00101$
      00243C                       1140 00114$:
                           0003DA  1141 	C$DAC_Control.c$76$1_0$77 ==.
                                   1142 ;	DAC_Control.c:76: return SBUF;
      00243C AE 99            [24] 1143 	mov	r6,_SBUF
      00243E 7F 00            [12] 1144 	mov	r7,#0x00
      002440 8E 82            [24] 1145 	mov	dpl,r6
      002442 8F 83            [24] 1146 	mov	dph,r7
                           0003E2  1147 	C$DAC_Control.c$77$1_0$77 ==.
                                   1148 ;	DAC_Control.c:77: }
                           0003E2  1149 	C$DAC_Control.c$77$1_0$77 ==.
                           0003E2  1150 	XG$getchar$0$0 ==.
      002444 22               [24] 1151 	ret
                                   1152 ;------------------------------------------------------------
                                   1153 ;Allocation info for local variables in function 'putstr'
                                   1154 ;------------------------------------------------------------
                                   1155 ;s                         Allocated with name '_putstr_s_65536_78'
                                   1156 ;------------------------------------------------------------
                           0003E3  1157 	G$putstr$0$0 ==.
                           0003E3  1158 	C$DAC_Control.c$79$1_0$79 ==.
                                   1159 ;	DAC_Control.c:79: void putstr(char *s) {
                                   1160 ;	-----------------------------------------
                                   1161 ;	 function putstr
                                   1162 ;	-----------------------------------------
      002445                       1163 _putstr:
      002445 AF F0            [24] 1164 	mov	r7,b
      002447 AE 83            [24] 1165 	mov	r6,dph
      002449 E5 82            [12] 1166 	mov	a,dpl
      00244B 90 05 0B         [24] 1167 	mov	dptr,#_putstr_s_65536_78
      00244E F0               [24] 1168 	movx	@dptr,a
      00244F EE               [12] 1169 	mov	a,r6
      002450 A3               [24] 1170 	inc	dptr
      002451 F0               [24] 1171 	movx	@dptr,a
      002452 EF               [12] 1172 	mov	a,r7
      002453 A3               [24] 1173 	inc	dptr
      002454 F0               [24] 1174 	movx	@dptr,a
                           0003F3  1175 	C$DAC_Control.c$80$1_0$79 ==.
                                   1176 ;	DAC_Control.c:80: while (*s) {
      002455 90 05 0B         [24] 1177 	mov	dptr,#_putstr_s_65536_78
      002458 E0               [24] 1178 	movx	a,@dptr
      002459 FD               [12] 1179 	mov	r5,a
      00245A A3               [24] 1180 	inc	dptr
      00245B E0               [24] 1181 	movx	a,@dptr
      00245C FE               [12] 1182 	mov	r6,a
      00245D A3               [24] 1183 	inc	dptr
      00245E E0               [24] 1184 	movx	a,@dptr
      00245F FF               [12] 1185 	mov	r7,a
      002460                       1186 00101$:
      002460 8D 82            [24] 1187 	mov	dpl,r5
      002462 8E 83            [24] 1188 	mov	dph,r6
      002464 8F F0            [24] 1189 	mov	b,r7
      002466 12 38 04         [24] 1190 	lcall	__gptrget
      002469 FC               [12] 1191 	mov	r4,a
      00246A 60 27            [24] 1192 	jz	00108$
                           00040A  1193 	C$DAC_Control.c$81$2_0$80 ==.
                                   1194 ;	DAC_Control.c:81: putchar(*s++);
      00246C 0D               [12] 1195 	inc	r5
      00246D BD 00 01         [24] 1196 	cjne	r5,#0x00,00116$
      002470 0E               [12] 1197 	inc	r6
      002471                       1198 00116$:
      002471 90 05 0B         [24] 1199 	mov	dptr,#_putstr_s_65536_78
      002474 ED               [12] 1200 	mov	a,r5
      002475 F0               [24] 1201 	movx	@dptr,a
      002476 EE               [12] 1202 	mov	a,r6
      002477 A3               [24] 1203 	inc	dptr
      002478 F0               [24] 1204 	movx	@dptr,a
      002479 EF               [12] 1205 	mov	a,r7
      00247A A3               [24] 1206 	inc	dptr
      00247B F0               [24] 1207 	movx	@dptr,a
      00247C 7B 00            [12] 1208 	mov	r3,#0x00
      00247E 8C 82            [24] 1209 	mov	dpl,r4
      002480 8B 83            [24] 1210 	mov	dph,r3
      002482 C0 07            [24] 1211 	push	ar7
      002484 C0 06            [24] 1212 	push	ar6
      002486 C0 05            [24] 1213 	push	ar5
      002488 12 24 18         [24] 1214 	lcall	_putchar
      00248B D0 05            [24] 1215 	pop	ar5
      00248D D0 06            [24] 1216 	pop	ar6
      00248F D0 07            [24] 1217 	pop	ar7
      002491 80 CD            [24] 1218 	sjmp	00101$
      002493                       1219 00108$:
      002493 90 05 0B         [24] 1220 	mov	dptr,#_putstr_s_65536_78
      002496 ED               [12] 1221 	mov	a,r5
      002497 F0               [24] 1222 	movx	@dptr,a
      002498 EE               [12] 1223 	mov	a,r6
      002499 A3               [24] 1224 	inc	dptr
      00249A F0               [24] 1225 	movx	@dptr,a
      00249B EF               [12] 1226 	mov	a,r7
      00249C A3               [24] 1227 	inc	dptr
      00249D F0               [24] 1228 	movx	@dptr,a
                           00043C  1229 	C$DAC_Control.c$83$1_0$79 ==.
                                   1230 ;	DAC_Control.c:83: }
                           00043C  1231 	C$DAC_Control.c$83$1_0$79 ==.
                           00043C  1232 	XG$putstr$0$0 ==.
      00249E 22               [24] 1233 	ret
                                   1234 ;------------------------------------------------------------
                                   1235 ;Allocation info for local variables in function 'spi_init'
                                   1236 ;------------------------------------------------------------
                           00043D  1237 	G$spi_init$0$0 ==.
                           00043D  1238 	C$DAC_Control.c$86$1_0$82 ==.
                                   1239 ;	DAC_Control.c:86: void spi_init(void) {
                                   1240 ;	-----------------------------------------
                                   1241 ;	 function spi_init
                                   1242 ;	-----------------------------------------
      00249F                       1243 _spi_init:
                           00043D  1244 	C$DAC_Control.c$88$1_0$82 ==.
                                   1245 ;	DAC_Control.c:88: SPI_CS = 1; // CS inactive (high)
                                   1246 ;	assignBit
      00249F D2 92            [12] 1247 	setb	_P1_2
                           00043F  1248 	C$DAC_Control.c$89$1_0$82 ==.
                                   1249 ;	DAC_Control.c:89: SPI_SCK = 0;
                                   1250 ;	assignBit
      0024A1 C2 96            [12] 1251 	clr	_P1_6
                           000441  1252 	C$DAC_Control.c$90$1_0$82 ==.
                                   1253 ;	DAC_Control.c:90: SPI_MOSI = 0;
                                   1254 ;	assignBit
      0024A3 C2 97            [12] 1255 	clr	_P1_7
                           000443  1256 	C$DAC_Control.c$101$1_0$82 ==.
                                   1257 ;	DAC_Control.c:101: SPCON = 0x71;
      0024A5 75 C3 71         [24] 1258 	mov	_SPCON,#0x71
                           000446  1259 	C$DAC_Control.c$103$1_0$82 ==.
                                   1260 ;	DAC_Control.c:103: SPSTA = 0x00;   // SPI status register, start empty
      0024A8 75 C4 00         [24] 1261 	mov	_SPSTA,#0x00
                           000449  1262 	C$DAC_Control.c$105$1_0$82 ==.
                                   1263 ;	DAC_Control.c:105: putstr("SPI Controller Initialized\n\r");
      0024AB 90 38 B3         [24] 1264 	mov	dptr,#___str_0
      0024AE 75 F0 80         [24] 1265 	mov	b,#0x80
      0024B1 12 24 45         [24] 1266 	lcall	_putstr
                           000452  1267 	C$DAC_Control.c$106$1_0$82 ==.
                                   1268 ;	DAC_Control.c:106: }
                           000452  1269 	C$DAC_Control.c$106$1_0$82 ==.
                           000452  1270 	XG$spi_init$0$0 ==.
      0024B4 22               [24] 1271 	ret
                                   1272 ;------------------------------------------------------------
                                   1273 ;Allocation info for local variables in function 'spi_deinit'
                                   1274 ;------------------------------------------------------------
                           000453  1275 	G$spi_deinit$0$0 ==.
                           000453  1276 	C$DAC_Control.c$108$1_0$84 ==.
                                   1277 ;	DAC_Control.c:108: void spi_deinit(void) { // for bit bang mode
                                   1278 ;	-----------------------------------------
                                   1279 ;	 function spi_deinit
                                   1280 ;	-----------------------------------------
      0024B5                       1281 _spi_deinit:
                           000453  1282 	C$DAC_Control.c$109$1_0$84 ==.
                                   1283 ;	DAC_Control.c:109: SPCON = 0x00; // Disable SPI
      0024B5 75 C3 00         [24] 1284 	mov	_SPCON,#0x00
                           000456  1285 	C$DAC_Control.c$110$1_0$84 ==.
                                   1286 ;	DAC_Control.c:110: }
                           000456  1287 	C$DAC_Control.c$110$1_0$84 ==.
                           000456  1288 	XG$spi_deinit$0$0 ==.
      0024B8 22               [24] 1289 	ret
                                   1290 ;------------------------------------------------------------
                                   1291 ;Allocation info for local variables in function 'spi_transfer'
                                   1292 ;------------------------------------------------------------
                                   1293 ;data                      Allocated with name '_spi_transfer_data_65536_85'
                                   1294 ;------------------------------------------------------------
                           000457  1295 	G$spi_transfer$0$0 ==.
                           000457  1296 	C$DAC_Control.c$113$1_0$86 ==.
                                   1297 ;	DAC_Control.c:113: uint8_t spi_transfer(uint8_t data) {
                                   1298 ;	-----------------------------------------
                                   1299 ;	 function spi_transfer
                                   1300 ;	-----------------------------------------
      0024B9                       1301 _spi_transfer:
      0024B9 E5 82            [12] 1302 	mov	a,dpl
      0024BB 90 05 0E         [24] 1303 	mov	dptr,#_spi_transfer_data_65536_85
      0024BE F0               [24] 1304 	movx	@dptr,a
                           00045D  1305 	C$DAC_Control.c$115$1_0$86 ==.
                                   1306 ;	DAC_Control.c:115: SPDAT = data; // Load data into SPI Data Register
      0024BF E0               [24] 1307 	movx	a,@dptr
      0024C0 F5 C5            [12] 1308 	mov	_SPDAT,a
                           000460  1309 	C$DAC_Control.c$116$1_0$86 ==.
                                   1310 ;	DAC_Control.c:116: while (!(SPSTA & 0x80)); // Wait for SPIF (SPI Interrupt Flag)
      0024C2                       1311 00101$:
      0024C2 E5 C4            [12] 1312 	mov	a,_SPSTA
      0024C4 30 E7 FB         [24] 1313 	jnb	acc.7,00101$
                           000465  1314 	C$DAC_Control.c$117$1_0$86 ==.
                                   1315 ;	DAC_Control.c:117: SPSTA &= ~0x80; // Clear flag
      0024C7 53 C4 7F         [24] 1316 	anl	_SPSTA,#0x7f
                           000468  1317 	C$DAC_Control.c$118$1_0$86 ==.
                                   1318 ;	DAC_Control.c:118: return SPDAT;  // data recieved is not in the same register, not gonna use for this but returning anyway
      0024CA 85 C5 82         [24] 1319 	mov	dpl,_SPDAT
                           00046B  1320 	C$DAC_Control.c$120$1_0$86 ==.
                                   1321 ;	DAC_Control.c:120: }
                           00046B  1322 	C$DAC_Control.c$120$1_0$86 ==.
                           00046B  1323 	XG$spi_transfer$0$0 ==.
      0024CD 22               [24] 1324 	ret
                                   1325 ;------------------------------------------------------------
                                   1326 ;Allocation info for local variables in function '_nop_'
                                   1327 ;------------------------------------------------------------
                           00046C  1328 	G$_nop_$0$0 ==.
                           00046C  1329 	C$DAC_Control.c$123$1_0$88 ==.
                                   1330 ;	DAC_Control.c:123: void _nop_(void) {
                                   1331 ;	-----------------------------------------
                                   1332 ;	 function _nop_
                                   1333 ;	-----------------------------------------
      0024CE                       1334 __nop_:
                           00046C  1335 	C$DAC_Control.c$126$1_0$88 ==.
                                   1336 ;	DAC_Control.c:126: __endasm;
      0024CE 00               [12] 1337 	nop
                           00046D  1338 	C$DAC_Control.c$127$1_0$88 ==.
                                   1339 ;	DAC_Control.c:127: }
                           00046D  1340 	C$DAC_Control.c$127$1_0$88 ==.
                           00046D  1341 	XG$_nop_$0$0 ==.
      0024CF 22               [24] 1342 	ret
                                   1343 ;------------------------------------------------------------
                                   1344 ;Allocation info for local variables in function 'spi_transfer_bitbang'
                                   1345 ;------------------------------------------------------------
                                   1346 ;data                      Allocated with name '_spi_transfer_bitbang_data_65536_89'
                                   1347 ;received                  Allocated with name '_spi_transfer_bitbang_received_65536_90'
                                   1348 ;i                         Allocated with name '_spi_transfer_bitbang_i_65536_90'
                                   1349 ;------------------------------------------------------------
                           00046E  1350 	G$spi_transfer_bitbang$0$0 ==.
                           00046E  1351 	C$DAC_Control.c$128$1_0$90 ==.
                                   1352 ;	DAC_Control.c:128: uint8_t spi_transfer_bitbang(uint8_t data) {
                                   1353 ;	-----------------------------------------
                                   1354 ;	 function spi_transfer_bitbang
                                   1355 ;	-----------------------------------------
      0024D0                       1356 _spi_transfer_bitbang:
      0024D0 E5 82            [12] 1357 	mov	a,dpl
      0024D2 90 05 0F         [24] 1358 	mov	dptr,#_spi_transfer_bitbang_data_65536_89
      0024D5 F0               [24] 1359 	movx	@dptr,a
                           000474  1360 	C$DAC_Control.c$129$2_0$90 ==.
                                   1361 ;	DAC_Control.c:129: uint8_t received = 0;
      0024D6 90 05 10         [24] 1362 	mov	dptr,#_spi_transfer_bitbang_received_65536_90
      0024D9 E4               [12] 1363 	clr	a
      0024DA F0               [24] 1364 	movx	@dptr,a
                           000479  1365 	C$DAC_Control.c$132$1_0$90 ==.
                                   1366 ;	DAC_Control.c:132: for (i = 0; i < 8; i++) {
      0024DB 7F 00            [12] 1367 	mov	r7,#0x00
      0024DD                       1368 00104$:
                           00047B  1369 	C$DAC_Control.c$134$3_0$92 ==.
                                   1370 ;	DAC_Control.c:134: SPI_MOSI = (data & 0x80) ? 1 : 0;
      0024DD 90 05 0F         [24] 1371 	mov	dptr,#_spi_transfer_bitbang_data_65536_89
      0024E0 E0               [24] 1372 	movx	a,@dptr
      0024E1 FE               [12] 1373 	mov	r6,a
      0024E2 FC               [12] 1374 	mov	r4,a
      0024E3 53 04 80         [24] 1375 	anl	ar4,#0x80
      0024E6 7D 00            [12] 1376 	mov	r5,#0x00
                                   1377 ;	assignBit
      0024E8 EC               [12] 1378 	mov	a,r4
      0024E9 4D               [12] 1379 	orl	a,r5
      0024EA 24 FF            [12] 1380 	add	a,#0xff
      0024EC 92 97            [24] 1381 	mov	_P1_7,c
                           00048C  1382 	C$DAC_Control.c$135$3_0$92 ==.
                                   1383 ;	DAC_Control.c:135: data <<= 1;
      0024EE EE               [12] 1384 	mov	a,r6
      0024EF 2E               [12] 1385 	add	a,r6
      0024F0 90 05 0F         [24] 1386 	mov	dptr,#_spi_transfer_bitbang_data_65536_89
      0024F3 F0               [24] 1387 	movx	@dptr,a
                           000492  1388 	C$DAC_Control.c$138$3_0$92 ==.
                                   1389 ;	DAC_Control.c:138: _nop_();
      0024F4 C0 07            [24] 1390 	push	ar7
      0024F6 12 24 CE         [24] 1391 	lcall	__nop_
      0024F9 D0 07            [24] 1392 	pop	ar7
                           000499  1393 	C$DAC_Control.c$141$3_0$92 ==.
                                   1394 ;	DAC_Control.c:141: SPI_SCK = 1;
                                   1395 ;	assignBit
      0024FB D2 96            [12] 1396 	setb	_P1_6
                           00049B  1397 	C$DAC_Control.c$144$3_0$92 ==.
                                   1398 ;	DAC_Control.c:144: received <<= 1;
      0024FD 90 05 10         [24] 1399 	mov	dptr,#_spi_transfer_bitbang_received_65536_90
      002500 E0               [24] 1400 	movx	a,@dptr
      002501 25 E0            [12] 1401 	add	a,acc
      002503 F0               [24] 1402 	movx	@dptr,a
                           0004A2  1403 	C$DAC_Control.c$145$3_0$92 ==.
                                   1404 ;	DAC_Control.c:145: if (SPI_MISO) {
      002504 30 95 08         [24] 1405 	jnb	_P1_5,00102$
                           0004A5  1406 	C$DAC_Control.c$146$4_0$93 ==.
                                   1407 ;	DAC_Control.c:146: received |= 1;
      002507 90 05 10         [24] 1408 	mov	dptr,#_spi_transfer_bitbang_received_65536_90
      00250A E0               [24] 1409 	movx	a,@dptr
      00250B 43 E0 01         [24] 1410 	orl	acc,#0x01
      00250E F0               [24] 1411 	movx	@dptr,a
      00250F                       1412 00102$:
                           0004AD  1413 	C$DAC_Control.c$150$3_0$92 ==.
                                   1414 ;	DAC_Control.c:150: _nop_();
      00250F C0 07            [24] 1415 	push	ar7
      002511 12 24 CE         [24] 1416 	lcall	__nop_
                           0004B2  1417 	C$DAC_Control.c$153$3_0$92 ==.
                                   1418 ;	DAC_Control.c:153: SPI_SCK = 0;
                                   1419 ;	assignBit
      002514 C2 96            [12] 1420 	clr	_P1_6
                           0004B4  1421 	C$DAC_Control.c$156$3_0$92 ==.
                                   1422 ;	DAC_Control.c:156: _nop_();
      002516 12 24 CE         [24] 1423 	lcall	__nop_
      002519 D0 07            [24] 1424 	pop	ar7
                           0004B9  1425 	C$DAC_Control.c$132$2_0$91 ==.
                                   1426 ;	DAC_Control.c:132: for (i = 0; i < 8; i++) {
      00251B 0F               [12] 1427 	inc	r7
      00251C BF 08 00         [24] 1428 	cjne	r7,#0x08,00122$
      00251F                       1429 00122$:
      00251F 40 BC            [24] 1430 	jc	00104$
                           0004BF  1431 	C$DAC_Control.c$159$1_0$90 ==.
                                   1432 ;	DAC_Control.c:159: return received;
      002521 90 05 10         [24] 1433 	mov	dptr,#_spi_transfer_bitbang_received_65536_90
      002524 E0               [24] 1434 	movx	a,@dptr
                           0004C3  1435 	C$DAC_Control.c$160$1_0$90 ==.
                                   1436 ;	DAC_Control.c:160: }
                           0004C3  1437 	C$DAC_Control.c$160$1_0$90 ==.
                           0004C3  1438 	XG$spi_transfer_bitbang$0$0 ==.
      002525 F5 82            [12] 1439 	mov	dpl,a
      002527 22               [24] 1440 	ret
                                   1441 ;------------------------------------------------------------
                                   1442 ;Allocation info for local variables in function 'dac_write'
                                   1443 ;------------------------------------------------------------
                                   1444 ;value                     Allocated with name '_dac_write_value_65536_94'
                                   1445 ;command                   Allocated with name '_dac_write_command_65536_95'
                                   1446 ;------------------------------------------------------------
                           0004C6  1447 	G$dac_write$0$0 ==.
                           0004C6  1448 	C$DAC_Control.c$163$1_0$95 ==.
                                   1449 ;	DAC_Control.c:163: void dac_write(uint8_t value) {
                                   1450 ;	-----------------------------------------
                                   1451 ;	 function dac_write
                                   1452 ;	-----------------------------------------
      002528                       1453 _dac_write:
      002528 E5 82            [12] 1454 	mov	a,dpl
      00252A 90 05 11         [24] 1455 	mov	dptr,#_dac_write_value_65536_94
      00252D F0               [24] 1456 	movx	@dptr,a
                           0004CC  1457 	C$DAC_Control.c$167$1_0$95 ==.
                                   1458 ;	DAC_Control.c:167: SPI_CS = 0;  // Chip Select low
                                   1459 ;	assignBit
      00252E C2 92            [12] 1460 	clr	_P1_2
                           0004CE  1461 	C$DAC_Control.c$171$1_0$95 ==.
                                   1462 ;	DAC_Control.c:171: if (bit_bang_mode) {
      002530 90 05 76         [24] 1463 	mov	dptr,#_bit_bang_mode
      002533 E0               [24] 1464 	movx	a,@dptr
      002534 60 22            [24] 1465 	jz	00102$
                           0004D4  1466 	C$DAC_Control.c$172$2_0$96 ==.
                                   1467 ;	DAC_Control.c:172: spi_transfer_bitbang(command | ((value >> 4) & 0x0F)); // Command + upper 4 bits of data
      002536 90 05 11         [24] 1468 	mov	dptr,#_dac_write_value_65536_94
      002539 E0               [24] 1469 	movx	a,@dptr
      00253A FF               [12] 1470 	mov	r7,a
      00253B C4               [12] 1471 	swap	a
      00253C 54 0F            [12] 1472 	anl	a,#0x0f
      00253E 44 30            [12] 1473 	orl	a,#0x30
      002540 F5 82            [12] 1474 	mov	dpl,a
      002542 C0 07            [24] 1475 	push	ar7
      002544 12 24 D0         [24] 1476 	lcall	_spi_transfer_bitbang
      002547 D0 07            [24] 1477 	pop	ar7
                           0004E7  1478 	C$DAC_Control.c$173$2_0$96 ==.
                                   1479 ;	DAC_Control.c:173: spi_transfer_bitbang((value << 4) & 0xF0); // Lower 4 bits + padding
      002549 EF               [12] 1480 	mov	a,r7
      00254A C4               [12] 1481 	swap	a
      00254B 54 F0            [12] 1482 	anl	a,#0xf0
      00254D FF               [12] 1483 	mov	r7,a
      00254E 53 07 F0         [24] 1484 	anl	ar7,#0xf0
      002551 8F 82            [24] 1485 	mov	dpl,r7
      002553 12 24 D0         [24] 1486 	lcall	_spi_transfer_bitbang
      002556 80 20            [24] 1487 	sjmp	00103$
      002558                       1488 00102$:
                           0004F6  1489 	C$DAC_Control.c$175$2_0$97 ==.
                                   1490 ;	DAC_Control.c:175: spi_transfer(command | ((value >> 4) & 0x0F)); // Command + upper 4 bits of data
      002558 90 05 11         [24] 1491 	mov	dptr,#_dac_write_value_65536_94
      00255B E0               [24] 1492 	movx	a,@dptr
      00255C FF               [12] 1493 	mov	r7,a
      00255D C4               [12] 1494 	swap	a
      00255E 54 0F            [12] 1495 	anl	a,#0x0f
      002560 44 30            [12] 1496 	orl	a,#0x30
      002562 F5 82            [12] 1497 	mov	dpl,a
      002564 C0 07            [24] 1498 	push	ar7
      002566 12 24 B9         [24] 1499 	lcall	_spi_transfer
      002569 D0 07            [24] 1500 	pop	ar7
                           000509  1501 	C$DAC_Control.c$176$2_0$97 ==.
                                   1502 ;	DAC_Control.c:176: spi_transfer((value << 4) & 0xF0); // Lower 4 bits + padding
      00256B EF               [12] 1503 	mov	a,r7
      00256C C4               [12] 1504 	swap	a
      00256D 54 F0            [12] 1505 	anl	a,#0xf0
      00256F FF               [12] 1506 	mov	r7,a
      002570 53 07 F0         [24] 1507 	anl	ar7,#0xf0
      002573 8F 82            [24] 1508 	mov	dpl,r7
      002575 12 24 B9         [24] 1509 	lcall	_spi_transfer
      002578                       1510 00103$:
                           000516  1511 	C$DAC_Control.c$179$1_0$95 ==.
                                   1512 ;	DAC_Control.c:179: SPI_CS = 1;  // Chip Select high
                                   1513 ;	assignBit
      002578 D2 92            [12] 1514 	setb	_P1_2
                           000518  1515 	C$DAC_Control.c$180$1_0$95 ==.
                                   1516 ;	DAC_Control.c:180: }
                           000518  1517 	C$DAC_Control.c$180$1_0$95 ==.
                           000518  1518 	XG$dac_write$0$0 ==.
      00257A 22               [24] 1519 	ret
                                   1520 ;------------------------------------------------------------
                                   1521 ;Allocation info for local variables in function 'generate_sin_wave'
                                   1522 ;------------------------------------------------------------
                                   1523 ;sin_value                 Allocated with name '_generate_sin_wave_sin_value_65536_98'
                                   1524 ;------------------------------------------------------------
                           000519  1525 	G$generate_sin_wave$0$0 ==.
                           000519  1526 	C$DAC_Control.c$183$1_0$98 ==.
                                   1527 ;	DAC_Control.c:183: void generate_sin_wave() {
                                   1528 ;	-----------------------------------------
                                   1529 ;	 function generate_sin_wave
                                   1530 ;	-----------------------------------------
      00257B                       1531 _generate_sin_wave:
                           000519  1532 	C$DAC_Control.c$184$1_0$98 ==.
                                   1533 ;	DAC_Control.c:184: uint8_t sin_value = sin_table[sin_index];
      00257B 90 05 73         [24] 1534 	mov	dptr,#_sin_index
      00257E E0               [24] 1535 	movx	a,@dptr
      00257F 24 00            [12] 1536 	add	a,#_sin_table
      002581 F5 82            [12] 1537 	mov	dpl,a
      002583 E4               [12] 1538 	clr	a
      002584 34 04            [12] 1539 	addc	a,#(_sin_table >> 8)
      002586 F5 83            [12] 1540 	mov	dph,a
      002588 E0               [24] 1541 	movx	a,@dptr
                           000527  1542 	C$DAC_Control.c$185$1_0$98 ==.
                                   1543 ;	DAC_Control.c:185: dac_write(sin_value);
      002589 F5 82            [12] 1544 	mov	dpl,a
      00258B 12 25 28         [24] 1545 	lcall	_dac_write
                           00052C  1546 	C$DAC_Control.c$188$1_0$98 ==.
                                   1547 ;	DAC_Control.c:188: sin_index++;
      00258E 90 05 73         [24] 1548 	mov	dptr,#_sin_index
      002591 E0               [24] 1549 	movx	a,@dptr
      002592 04               [12] 1550 	inc	a
      002593 F0               [24] 1551 	movx	@dptr,a
                           000532  1552 	C$DAC_Control.c$190$1_0$98 ==.
                                   1553 ;	DAC_Control.c:190: sin_index = 0;
                           000532  1554 	C$DAC_Control.c$192$1_0$98 ==.
                                   1555 ;	DAC_Control.c:192: }
                           000532  1556 	C$DAC_Control.c$192$1_0$98 ==.
                           000532  1557 	XG$generate_sin_wave$0$0 ==.
      002594 22               [24] 1558 	ret
                                   1559 ;------------------------------------------------------------
                                   1560 ;Allocation info for local variables in function 'test_dc_levels'
                                   1561 ;------------------------------------------------------------
                                   1562 ;test_values               Allocated with name '_test_dc_levels_test_values_65537_102'
                                   1563 ;labels                    Allocated with name '_test_dc_levels_labels_65537_102'
                                   1564 ;i                         Allocated with name '_test_dc_levels_i_131073_103'
                                   1565 ;------------------------------------------------------------
                           000533  1566 	G$test_dc_levels$0$0 ==.
                           000533  1567 	C$DAC_Control.c$195$1_0$101 ==.
                                   1568 ;	DAC_Control.c:195: void test_dc_levels(void) {
                                   1569 ;	-----------------------------------------
                                   1570 ;	 function test_dc_levels
                                   1571 ;	-----------------------------------------
      002595                       1572 _test_dc_levels:
                           000533  1573 	C$DAC_Control.c$196$1_0$101 ==.
                                   1574 ;	DAC_Control.c:196: putstr("\n\r----- DC Level Test ----\n\r");
      002595 90 39 02         [24] 1575 	mov	dptr,#___str_6
      002598 75 F0 80         [24] 1576 	mov	b,#0x80
      00259B 12 24 45         [24] 1577 	lcall	_putstr
                           00053C  1578 	C$DAC_Control.c$199$2_0$103 ==.
                                   1579 ;	DAC_Control.c:199: uint8_t test_values[] = {0, 64, 128, 192, 255};
      00259E 90 05 12         [24] 1580 	mov	dptr,#_test_dc_levels_test_values_65537_102
      0025A1 E4               [12] 1581 	clr	a
      0025A2 F0               [24] 1582 	movx	@dptr,a
      0025A3 90 05 13         [24] 1583 	mov	dptr,#(_test_dc_levels_test_values_65537_102 + 0x0001)
      0025A6 74 40            [12] 1584 	mov	a,#0x40
      0025A8 F0               [24] 1585 	movx	@dptr,a
      0025A9 90 05 14         [24] 1586 	mov	dptr,#(_test_dc_levels_test_values_65537_102 + 0x0002)
      0025AC 23               [12] 1587 	rl	a
      0025AD F0               [24] 1588 	movx	@dptr,a
      0025AE 90 05 15         [24] 1589 	mov	dptr,#(_test_dc_levels_test_values_65537_102 + 0x0003)
      0025B1 74 C0            [12] 1590 	mov	a,#0xc0
      0025B3 F0               [24] 1591 	movx	@dptr,a
      0025B4 90 05 16         [24] 1592 	mov	dptr,#(_test_dc_levels_test_values_65537_102 + 0x0004)
      0025B7 74 FF            [12] 1593 	mov	a,#0xff
      0025B9 F0               [24] 1594 	movx	@dptr,a
                           000558  1595 	C$DAC_Control.c$200$2_0$103 ==.
                                   1596 ;	DAC_Control.c:200: char *labels[] = {"0V (0)", "1.25V (64)", "2.5V (128)", "3.75V (192)", "5V (255)"};
      0025BA 90 05 17         [24] 1597 	mov	dptr,#_test_dc_levels_labels_65537_102
      0025BD 74 D0            [12] 1598 	mov	a,#___str_1
      0025BF F0               [24] 1599 	movx	@dptr,a
      0025C0 74 38            [12] 1600 	mov	a,#(___str_1 >> 8)
      0025C2 A3               [24] 1601 	inc	dptr
      0025C3 F0               [24] 1602 	movx	@dptr,a
      0025C4 74 80            [12] 1603 	mov	a,#0x80
      0025C6 A3               [24] 1604 	inc	dptr
      0025C7 F0               [24] 1605 	movx	@dptr,a
      0025C8 90 05 1A         [24] 1606 	mov	dptr,#(_test_dc_levels_labels_65537_102 + 0x0003)
      0025CB 74 D7            [12] 1607 	mov	a,#___str_2
      0025CD F0               [24] 1608 	movx	@dptr,a
      0025CE 74 38            [12] 1609 	mov	a,#(___str_2 >> 8)
      0025D0 A3               [24] 1610 	inc	dptr
      0025D1 F0               [24] 1611 	movx	@dptr,a
      0025D2 74 80            [12] 1612 	mov	a,#0x80
      0025D4 A3               [24] 1613 	inc	dptr
      0025D5 F0               [24] 1614 	movx	@dptr,a
      0025D6 90 05 1D         [24] 1615 	mov	dptr,#(_test_dc_levels_labels_65537_102 + 0x0006)
      0025D9 74 E2            [12] 1616 	mov	a,#___str_3
      0025DB F0               [24] 1617 	movx	@dptr,a
      0025DC 74 38            [12] 1618 	mov	a,#(___str_3 >> 8)
      0025DE A3               [24] 1619 	inc	dptr
      0025DF F0               [24] 1620 	movx	@dptr,a
      0025E0 74 80            [12] 1621 	mov	a,#0x80
      0025E2 A3               [24] 1622 	inc	dptr
      0025E3 F0               [24] 1623 	movx	@dptr,a
      0025E4 90 05 20         [24] 1624 	mov	dptr,#(_test_dc_levels_labels_65537_102 + 0x0009)
      0025E7 74 ED            [12] 1625 	mov	a,#___str_4
      0025E9 F0               [24] 1626 	movx	@dptr,a
      0025EA 74 38            [12] 1627 	mov	a,#(___str_4 >> 8)
      0025EC A3               [24] 1628 	inc	dptr
      0025ED F0               [24] 1629 	movx	@dptr,a
      0025EE 74 80            [12] 1630 	mov	a,#0x80
      0025F0 A3               [24] 1631 	inc	dptr
      0025F1 F0               [24] 1632 	movx	@dptr,a
      0025F2 90 05 23         [24] 1633 	mov	dptr,#(_test_dc_levels_labels_65537_102 + 0x000c)
      0025F5 74 F9            [12] 1634 	mov	a,#___str_5
      0025F7 F0               [24] 1635 	movx	@dptr,a
      0025F8 74 38            [12] 1636 	mov	a,#(___str_5 >> 8)
      0025FA A3               [24] 1637 	inc	dptr
      0025FB F0               [24] 1638 	movx	@dptr,a
      0025FC 74 80            [12] 1639 	mov	a,#0x80
      0025FE A3               [24] 1640 	inc	dptr
      0025FF F0               [24] 1641 	movx	@dptr,a
                           00059E  1642 	C$DAC_Control.c$202$3_1$104 ==.
                                   1643 ;	DAC_Control.c:202: for (uint8_t i = 0; i < 5; i++) {
      002600 7F 00            [12] 1644 	mov	r7,#0x00
      002602                       1645 00103$:
      002602 BF 05 00         [24] 1646 	cjne	r7,#0x05,00116$
      002605                       1647 00116$:
      002605 50 59            [24] 1648 	jnc	00105$
                           0005A5  1649 	C$DAC_Control.c$203$3_1$104 ==.
                                   1650 ;	DAC_Control.c:203: printf("Setting Channel A to %s\n\r", labels[i]);
      002607 EF               [12] 1651 	mov	a,r7
      002608 75 F0 03         [24] 1652 	mov	b,#0x03
      00260B A4               [48] 1653 	mul	ab
      00260C 24 17            [12] 1654 	add	a,#_test_dc_levels_labels_65537_102
      00260E F5 82            [12] 1655 	mov	dpl,a
      002610 74 05            [12] 1656 	mov	a,#(_test_dc_levels_labels_65537_102 >> 8)
      002612 35 F0            [12] 1657 	addc	a,b
      002614 F5 83            [12] 1658 	mov	dph,a
      002616 E0               [24] 1659 	movx	a,@dptr
      002617 FC               [12] 1660 	mov	r4,a
      002618 A3               [24] 1661 	inc	dptr
      002619 E0               [24] 1662 	movx	a,@dptr
      00261A FD               [12] 1663 	mov	r5,a
      00261B A3               [24] 1664 	inc	dptr
      00261C E0               [24] 1665 	movx	a,@dptr
      00261D FE               [12] 1666 	mov	r6,a
      00261E C0 07            [24] 1667 	push	ar7
      002620 C0 04            [24] 1668 	push	ar4
      002622 C0 05            [24] 1669 	push	ar5
      002624 C0 06            [24] 1670 	push	ar6
      002626 74 1F            [12] 1671 	mov	a,#___str_7
      002628 C0 E0            [24] 1672 	push	acc
      00262A 74 39            [12] 1673 	mov	a,#(___str_7 >> 8)
      00262C C0 E0            [24] 1674 	push	acc
      00262E 74 80            [12] 1675 	mov	a,#0x80
      002630 C0 E0            [24] 1676 	push	acc
      002632 12 2C F3         [24] 1677 	lcall	_printf
      002635 E5 81            [12] 1678 	mov	a,sp
      002637 24 FA            [12] 1679 	add	a,#0xfa
      002639 F5 81            [12] 1680 	mov	sp,a
      00263B D0 07            [24] 1681 	pop	ar7
                           0005DB  1682 	C$DAC_Control.c$204$3_1$104 ==.
                                   1683 ;	DAC_Control.c:204: dac_write(test_values[i]);
      00263D EF               [12] 1684 	mov	a,r7
      00263E 24 12            [12] 1685 	add	a,#_test_dc_levels_test_values_65537_102
      002640 F5 82            [12] 1686 	mov	dpl,a
      002642 E4               [12] 1687 	clr	a
      002643 34 05            [12] 1688 	addc	a,#(_test_dc_levels_test_values_65537_102 >> 8)
      002645 F5 83            [12] 1689 	mov	dph,a
      002647 E0               [24] 1690 	movx	a,@dptr
      002648 F5 82            [12] 1691 	mov	dpl,a
      00264A C0 07            [24] 1692 	push	ar7
      00264C 12 25 28         [24] 1693 	lcall	_dac_write
                           0005ED  1694 	C$DAC_Control.c$206$3_1$104 ==.
                                   1695 ;	DAC_Control.c:206: putstr("Press a key to do the next value\n\r");
      00264F 90 39 39         [24] 1696 	mov	dptr,#___str_8
      002652 75 F0 80         [24] 1697 	mov	b,#0x80
      002655 12 24 45         [24] 1698 	lcall	_putstr
                           0005F6  1699 	C$DAC_Control.c$207$3_1$104 ==.
                                   1700 ;	DAC_Control.c:207: getchar();
      002658 12 24 37         [24] 1701 	lcall	_getchar
      00265B D0 07            [24] 1702 	pop	ar7
                           0005FB  1703 	C$DAC_Control.c$202$2_1$103 ==.
                                   1704 ;	DAC_Control.c:202: for (uint8_t i = 0; i < 5; i++) {
      00265D 0F               [12] 1705 	inc	r7
      00265E 80 A2            [24] 1706 	sjmp	00103$
      002660                       1707 00105$:
                           0005FE  1708 	C$DAC_Control.c$209$2_1$101 ==.
                                   1709 ;	DAC_Control.c:209: }
                           0005FE  1710 	C$DAC_Control.c$209$2_1$101 ==.
                           0005FE  1711 	XG$test_dc_levels$0$0 ==.
      002660 22               [24] 1712 	ret
                                   1713 ;------------------------------------------------------------
                                   1714 ;Allocation info for local variables in function 'get_number'
                                   1715 ;------------------------------------------------------------
                                   1716 ;buffer                    Allocated with name '_get_number_buffer_65536_106'
                                   1717 ;idx                       Allocated with name '_get_number_idx_65536_106'
                                   1718 ;c                         Allocated with name '_get_number_c_65536_106'
                                   1719 ;------------------------------------------------------------
                           0005FF  1720 	G$get_number$0$0 ==.
                           0005FF  1721 	C$DAC_Control.c$211$2_1$106 ==.
                                   1722 ;	DAC_Control.c:211: uint16_t get_number(void) {
                                   1723 ;	-----------------------------------------
                                   1724 ;	 function get_number
                                   1725 ;	-----------------------------------------
      002661                       1726 _get_number:
                           0005FF  1727 	C$DAC_Control.c$216$3_0$109 ==.
                                   1728 ;	DAC_Control.c:216: while(1) {
      002661 7F 00            [12] 1729 	mov	r7,#0x00
      002663                       1730 00110$:
                           000601  1731 	C$DAC_Control.c$217$2_0$107 ==.
                                   1732 ;	DAC_Control.c:217: c = getchar();
      002663 C0 07            [24] 1733 	push	ar7
      002665 12 24 37         [24] 1734 	lcall	_getchar
      002668 AD 82            [24] 1735 	mov	r5,dpl
      00266A AE 83            [24] 1736 	mov	r6,dph
      00266C D0 07            [24] 1737 	pop	ar7
                           00060C  1738 	C$DAC_Control.c$219$2_0$107 ==.
                                   1739 ;	DAC_Control.c:219: if (c == '\r' || c == '\n') {
      00266E BD 0D 02         [24] 1740 	cjne	r5,#0x0d,00135$
      002671 80 03            [24] 1741 	sjmp	00105$
      002673                       1742 00135$:
      002673 BD 0A 17         [24] 1743 	cjne	r5,#0x0a,00106$
      002676                       1744 00105$:
                           000614  1745 	C$DAC_Control.c$220$3_0$108 ==.
                                   1746 ;	DAC_Control.c:220: buffer[idx] = '\0';
      002676 EF               [12] 1747 	mov	a,r7
      002677 24 26            [12] 1748 	add	a,#_get_number_buffer_65536_106
      002679 F5 82            [12] 1749 	mov	dpl,a
      00267B E4               [12] 1750 	clr	a
      00267C 34 05            [12] 1751 	addc	a,#(_get_number_buffer_65536_106 >> 8)
      00267E F5 83            [12] 1752 	mov	dph,a
      002680 E4               [12] 1753 	clr	a
      002681 F0               [24] 1754 	movx	@dptr,a
                           000620  1755 	C$DAC_Control.c$221$3_0$108 ==.
                                   1756 ;	DAC_Control.c:221: putstr("\n\r");
      002682 90 39 5C         [24] 1757 	mov	dptr,#___str_9
      002685 75 F0 80         [24] 1758 	mov	b,#0x80
      002688 12 24 45         [24] 1759 	lcall	_putstr
                           000629  1760 	C$DAC_Control.c$222$3_0$108 ==.
                                   1761 ;	DAC_Control.c:222: break;
      00268B 80 2B            [24] 1762 	sjmp	00111$
      00268D                       1763 00106$:
                           00062B  1764 	C$DAC_Control.c$224$2_0$107 ==.
                                   1765 ;	DAC_Control.c:224: else if (c >= '0' && c <= '9' && idx < 3) {
      00268D BD 30 00         [24] 1766 	cjne	r5,#0x30,00138$
      002690                       1767 00138$:
      002690 40 D1            [24] 1768 	jc	00110$
      002692 ED               [12] 1769 	mov	a,r5
      002693 24 C6            [12] 1770 	add	a,#0xff - 0x39
      002695 40 CC            [24] 1771 	jc	00110$
      002697 BF 03 00         [24] 1772 	cjne	r7,#0x03,00141$
      00269A                       1773 00141$:
      00269A 50 C7            [24] 1774 	jnc	00110$
                           00063A  1775 	C$DAC_Control.c$225$3_0$109 ==.
                                   1776 ;	DAC_Control.c:225: buffer[idx++] = c;
      00269C EF               [12] 1777 	mov	a,r7
      00269D 24 26            [12] 1778 	add	a,#_get_number_buffer_65536_106
      00269F F5 82            [12] 1779 	mov	dpl,a
      0026A1 E4               [12] 1780 	clr	a
      0026A2 34 05            [12] 1781 	addc	a,#(_get_number_buffer_65536_106 >> 8)
      0026A4 F5 83            [12] 1782 	mov	dph,a
      0026A6 0F               [12] 1783 	inc	r7
      0026A7 ED               [12] 1784 	mov	a,r5
      0026A8 F0               [24] 1785 	movx	@dptr,a
                           000647  1786 	C$DAC_Control.c$226$3_0$109 ==.
                                   1787 ;	DAC_Control.c:226: putchar(c);
      0026A9 7E 00            [12] 1788 	mov	r6,#0x00
      0026AB 8D 82            [24] 1789 	mov	dpl,r5
      0026AD 8E 83            [24] 1790 	mov	dph,r6
      0026AF C0 07            [24] 1791 	push	ar7
      0026B1 12 24 18         [24] 1792 	lcall	_putchar
      0026B4 D0 07            [24] 1793 	pop	ar7
      0026B6 80 AB            [24] 1794 	sjmp	00110$
      0026B8                       1795 00111$:
                           000656  1796 	C$DAC_Control.c$230$1_0$106 ==.
                                   1797 ;	DAC_Control.c:230: return atoi(buffer);
      0026B8 90 05 26         [24] 1798 	mov	dptr,#_get_number_buffer_65536_106
      0026BB 75 F0 00         [24] 1799 	mov	b,#0x00
      0026BE 12 2A 19         [24] 1800 	lcall	_atoi
                           00065F  1801 	C$DAC_Control.c$231$1_0$106 ==.
                                   1802 ;	DAC_Control.c:231: }
                           00065F  1803 	C$DAC_Control.c$231$1_0$106 ==.
                           00065F  1804 	XG$get_number$0$0 ==.
      0026C1 22               [24] 1805 	ret
                                   1806 ;------------------------------------------------------------
                                   1807 ;Allocation info for local variables in function 'manual_dac_control'
                                   1808 ;------------------------------------------------------------
                                   1809 ;value                     Allocated with name '_manual_dac_control_value_65537_112'
                                   1810 ;------------------------------------------------------------
                           000660  1811 	G$manual_dac_control$0$0 ==.
                           000660  1812 	C$DAC_Control.c$233$1_0$111 ==.
                                   1813 ;	DAC_Control.c:233: void manual_dac_control(void) {
                                   1814 ;	-----------------------------------------
                                   1815 ;	 function manual_dac_control
                                   1816 ;	-----------------------------------------
      0026C2                       1817 _manual_dac_control:
                           000660  1818 	C$DAC_Control.c$235$1_0$111 ==.
                                   1819 ;	DAC_Control.c:235: putstr("Enter DAC value (0-255): ");
      0026C2 90 39 5F         [24] 1820 	mov	dptr,#___str_10
      0026C5 75 F0 80         [24] 1821 	mov	b,#0x80
      0026C8 12 24 45         [24] 1822 	lcall	_putstr
                           000669  1823 	C$DAC_Control.c$236$1_1$112 ==.
                                   1824 ;	DAC_Control.c:236: uint16_t value = get_number();
      0026CB 12 26 61         [24] 1825 	lcall	_get_number
      0026CE AE 82            [24] 1826 	mov	r6,dpl
      0026D0 AF 83            [24] 1827 	mov	r7,dph
                           000670  1828 	C$DAC_Control.c$238$1_1$112 ==.
                                   1829 ;	DAC_Control.c:238: if (value > 255) {
      0026D2 8E 04            [24] 1830 	mov	ar4,r6
      0026D4 8F 05            [24] 1831 	mov	ar5,r7
      0026D6 C3               [12] 1832 	clr	c
      0026D7 74 FF            [12] 1833 	mov	a,#0xff
      0026D9 9C               [12] 1834 	subb	a,r4
      0026DA E4               [12] 1835 	clr	a
      0026DB 9D               [12] 1836 	subb	a,r5
      0026DC 50 0B            [24] 1837 	jnc	00102$
                           00067C  1838 	C$DAC_Control.c$239$2_1$113 ==.
                                   1839 ;	DAC_Control.c:239: putstr("Error: Value must be 0-255\n\r");
      0026DE 90 39 79         [24] 1840 	mov	dptr,#___str_11
      0026E1 75 F0 80         [24] 1841 	mov	b,#0x80
      0026E4 12 24 45         [24] 1842 	lcall	_putstr
                           000685  1843 	C$DAC_Control.c$240$2_1$113 ==.
                                   1844 ;	DAC_Control.c:240: return;
      0026E7 80 20            [24] 1845 	sjmp	00103$
      0026E9                       1846 00102$:
                           000687  1847 	C$DAC_Control.c$243$1_1$112 ==.
                                   1848 ;	DAC_Control.c:243: dac_write((uint8_t)value);
      0026E9 8E 82            [24] 1849 	mov	dpl,r6
      0026EB C0 06            [24] 1850 	push	ar6
      0026ED 12 25 28         [24] 1851 	lcall	_dac_write
                           00068E  1852 	C$DAC_Control.c$245$1_1$112 ==.
                                   1853 ;	DAC_Control.c:245: (uint8_t)value);
      0026F0 7F 00            [12] 1854 	mov	r7,#0x00
                           000690  1855 	C$DAC_Control.c$244$1_1$112 ==.
                                   1856 ;	DAC_Control.c:244: printf("Channel A set to %d\n\r", 
      0026F2 C0 07            [24] 1857 	push	ar7
      0026F4 74 96            [12] 1858 	mov	a,#___str_12
      0026F6 C0 E0            [24] 1859 	push	acc
      0026F8 74 39            [12] 1860 	mov	a,#(___str_12 >> 8)
      0026FA C0 E0            [24] 1861 	push	acc
      0026FC 74 80            [12] 1862 	mov	a,#0x80
      0026FE C0 E0            [24] 1863 	push	acc
      002700 12 2C F3         [24] 1864 	lcall	_printf
      002703 E5 81            [12] 1865 	mov	a,sp
      002705 24 FB            [12] 1866 	add	a,#0xfb
      002707 F5 81            [12] 1867 	mov	sp,a
      002709                       1868 00103$:
                           0006A7  1869 	C$DAC_Control.c$246$1_1$111 ==.
                                   1870 ;	DAC_Control.c:246: }
                           0006A7  1871 	C$DAC_Control.c$246$1_1$111 ==.
                           0006A7  1872 	XG$manual_dac_control$0$0 ==.
      002709 22               [24] 1873 	ret
                                   1874 ;------------------------------------------------------------
                                   1875 ;Allocation info for local variables in function 'print_menu'
                                   1876 ;------------------------------------------------------------
                           0006A8  1877 	G$print_menu$0$0 ==.
                           0006A8  1878 	C$DAC_Control.c$249$1_1$115 ==.
                                   1879 ;	DAC_Control.c:249: void print_menu(void) {
                                   1880 ;	-----------------------------------------
                                   1881 ;	 function print_menu
                                   1882 ;	-----------------------------------------
      00270A                       1883 _print_menu:
                           0006A8  1884 	C$DAC_Control.c$250$1_0$115 ==.
                                   1885 ;	DAC_Control.c:250: putstr("\n\r");
      00270A 90 39 5C         [24] 1886 	mov	dptr,#___str_9
      00270D 75 F0 80         [24] 1887 	mov	b,#0x80
      002710 12 24 45         [24] 1888 	lcall	_putstr
                           0006B1  1889 	C$DAC_Control.c$251$1_0$115 ==.
                                   1890 ;	DAC_Control.c:251: putstr("Here's everything you can do: \n\r");
      002713 90 39 AC         [24] 1891 	mov	dptr,#___str_13
      002716 75 F0 80         [24] 1892 	mov	b,#0x80
      002719 12 24 45         [24] 1893 	lcall	_putstr
                           0006BA  1894 	C$DAC_Control.c$252$1_0$115 ==.
                                   1895 ;	DAC_Control.c:252: putstr("1. Test DC Levels\n\r");
      00271C 90 39 CD         [24] 1896 	mov	dptr,#___str_14
      00271F 75 F0 80         [24] 1897 	mov	b,#0x80
      002722 12 24 45         [24] 1898 	lcall	_putstr
                           0006C3  1899 	C$DAC_Control.c$253$1_0$115 ==.
                                   1900 ;	DAC_Control.c:253: putstr("2. sin Wave\n\r");
      002725 90 39 E1         [24] 1901 	mov	dptr,#___str_15
      002728 75 F0 80         [24] 1902 	mov	b,#0x80
      00272B 12 24 45         [24] 1903 	lcall	_putstr
                           0006CC  1904 	C$DAC_Control.c$254$1_0$115 ==.
                                   1905 ;	DAC_Control.c:254: putstr("3. Manual DAC Value\n\r");
      00272E 90 39 EF         [24] 1906 	mov	dptr,#___str_16
      002731 75 F0 80         [24] 1907 	mov	b,#0x80
      002734 12 24 45         [24] 1908 	lcall	_putstr
                           0006D5  1909 	C$DAC_Control.c$255$1_0$115 ==.
                                   1910 ;	DAC_Control.c:255: putstr("4. Toggle Bit-Bang Mode\n\r");
      002737 90 3A 05         [24] 1911 	mov	dptr,#___str_17
      00273A 75 F0 80         [24] 1912 	mov	b,#0x80
      00273D 12 24 45         [24] 1913 	lcall	_putstr
                           0006DE  1914 	C$DAC_Control.c$256$1_0$115 ==.
                                   1915 ;	DAC_Control.c:256: putstr("h. Help (show this menu)\n\r");
      002740 90 3A 1F         [24] 1916 	mov	dptr,#___str_18
      002743 75 F0 80         [24] 1917 	mov	b,#0x80
      002746 12 24 45         [24] 1918 	lcall	_putstr
                           0006E7  1919 	C$DAC_Control.c$257$1_0$115 ==.
                                   1920 ;	DAC_Control.c:257: putstr("----------------------------------------\n\r");
      002749 90 3A 3A         [24] 1921 	mov	dptr,#___str_19
      00274C 75 F0 80         [24] 1922 	mov	b,#0x80
      00274F 12 24 45         [24] 1923 	lcall	_putstr
                           0006F0  1924 	C$DAC_Control.c$258$1_0$115 ==.
                                   1925 ;	DAC_Control.c:258: }
                           0006F0  1926 	C$DAC_Control.c$258$1_0$115 ==.
                           0006F0  1927 	XG$print_menu$0$0 ==.
      002752 22               [24] 1928 	ret
                                   1929 ;------------------------------------------------------------
                                   1930 ;Allocation info for local variables in function 'main'
                                   1931 ;------------------------------------------------------------
                                   1932 ;choice                    Allocated with name '_main_choice_65536_117'
                                   1933 ;i                         Allocated with name '_main_i_327680_121'
                                   1934 ;------------------------------------------------------------
                           0006F1  1935 	G$main$0$0 ==.
                           0006F1  1936 	C$DAC_Control.c$261$1_0$117 ==.
                                   1937 ;	DAC_Control.c:261: int main(void) {
                                   1938 ;	-----------------------------------------
                                   1939 ;	 function main
                                   1940 ;	-----------------------------------------
      002753                       1941 _main:
                           0006F1  1942 	C$DAC_Control.c$264$1_0$117 ==.
                                   1943 ;	DAC_Control.c:264: spi_init();
      002753 12 24 9F         [24] 1944 	lcall	_spi_init
                           0006F4  1945 	C$DAC_Control.c$265$1_0$117 ==.
                                   1946 ;	DAC_Control.c:265: generate_sin_table(sin_table, 256);
      002756 90 05 04         [24] 1947 	mov	dptr,#_generate_sin_table_PARM_2
      002759 E4               [12] 1948 	clr	a
      00275A F0               [24] 1949 	movx	@dptr,a
      00275B 04               [12] 1950 	inc	a
      00275C A3               [24] 1951 	inc	dptr
      00275D F0               [24] 1952 	movx	@dptr,a
      00275E 90 04 00         [24] 1953 	mov	dptr,#_sin_table
      002761 75 F0 00         [24] 1954 	mov	b,#0x00
      002764 12 22 9B         [24] 1955 	lcall	_generate_sin_table
                           000705  1956 	C$DAC_Control.c$266$1_0$117 ==.
                                   1957 ;	DAC_Control.c:266: print_menu();
      002767 12 27 0A         [24] 1958 	lcall	_print_menu
                           000708  1959 	C$DAC_Control.c$268$1_0$117 ==.
                                   1960 ;	DAC_Control.c:268: while (1) {
      00276A                       1961 00117$:
                           000708  1962 	C$DAC_Control.c$269$2_0$118 ==.
                                   1963 ;	DAC_Control.c:269: putstr("\nEnter choice: ");
      00276A 90 3A 65         [24] 1964 	mov	dptr,#___str_20
      00276D 75 F0 80         [24] 1965 	mov	b,#0x80
      002770 12 24 45         [24] 1966 	lcall	_putstr
                           000711  1967 	C$DAC_Control.c$270$2_0$118 ==.
                                   1968 ;	DAC_Control.c:270: choice = getchar();
      002773 12 24 37         [24] 1969 	lcall	_getchar
      002776 AE 82            [24] 1970 	mov	r6,dpl
                           000716  1971 	C$DAC_Control.c$271$2_0$118 ==.
                                   1972 ;	DAC_Control.c:271: putchar(choice);
      002778 8E 05            [24] 1973 	mov	ar5,r6
      00277A 7F 00            [12] 1974 	mov	r7,#0x00
      00277C 8D 82            [24] 1975 	mov	dpl,r5
      00277E 8F 83            [24] 1976 	mov	dph,r7
      002780 C0 06            [24] 1977 	push	ar6
      002782 12 24 18         [24] 1978 	lcall	_putchar
                           000723  1979 	C$DAC_Control.c$272$2_0$118 ==.
                                   1980 ;	DAC_Control.c:272: putstr("\n\r");
      002785 90 39 5C         [24] 1981 	mov	dptr,#___str_9
      002788 75 F0 80         [24] 1982 	mov	b,#0x80
      00278B 12 24 45         [24] 1983 	lcall	_putstr
      00278E D0 06            [24] 1984 	pop	ar6
                           00072E  1985 	C$DAC_Control.c$274$2_0$118 ==.
                                   1986 ;	DAC_Control.c:274: switch (choice) {
      002790 BE 31 02         [24] 1987 	cjne	r6,#0x31,00178$
      002793 80 20            [24] 1988 	sjmp	00101$
      002795                       1989 00178$:
      002795 BE 32 02         [24] 1990 	cjne	r6,#0x32,00179$
      002798 80 20            [24] 1991 	sjmp	00102$
      00279A                       1992 00179$:
      00279A BE 33 03         [24] 1993 	cjne	r6,#0x33,00180$
      00279D 02 28 1D         [24] 1994 	ljmp	00107$
      0027A0                       1995 00180$:
      0027A0 BE 34 03         [24] 1996 	cjne	r6,#0x34,00181$
      0027A3 02 28 23         [24] 1997 	ljmp	00108$
      0027A6                       1998 00181$:
      0027A6 BE 48 03         [24] 1999 	cjne	r6,#0x48,00182$
      0027A9 02 28 6A         [24] 2000 	ljmp	00113$
      0027AC                       2001 00182$:
      0027AC BE 68 03         [24] 2002 	cjne	r6,#0x68,00183$
      0027AF 02 28 6A         [24] 2003 	ljmp	00113$
      0027B2                       2004 00183$:
      0027B2 02 28 70         [24] 2005 	ljmp	00114$
                           000753  2006 	C$DAC_Control.c$275$3_0$119 ==.
                                   2007 ;	DAC_Control.c:275: case '1':
      0027B5                       2008 00101$:
                           000753  2009 	C$DAC_Control.c$276$3_0$119 ==.
                                   2010 ;	DAC_Control.c:276: test_dc_levels();
      0027B5 12 25 95         [24] 2011 	lcall	_test_dc_levels
                           000756  2012 	C$DAC_Control.c$277$3_0$119 ==.
                                   2013 ;	DAC_Control.c:277: break;
                           000756  2014 	C$DAC_Control.c$279$3_0$119 ==.
                                   2015 ;	DAC_Control.c:279: case '2':
      0027B8 80 B0            [24] 2016 	sjmp	00117$
      0027BA                       2017 00102$:
                           000758  2018 	C$DAC_Control.c$280$3_0$119 ==.
                                   2019 ;	DAC_Control.c:280: putstr("Put any char to stop the sin wave \n\r");
      0027BA 90 3A 75         [24] 2020 	mov	dptr,#___str_21
      0027BD 75 F0 80         [24] 2021 	mov	b,#0x80
      0027C0 12 24 45         [24] 2022 	lcall	_putstr
                           000761  2023 	C$DAC_Control.c$281$3_0$119 ==.
                                   2024 ;	DAC_Control.c:281: while (!RI) {
      0027C3                       2025 00104$:
      0027C3 20 98 48         [24] 2026 	jb	_RI,00106$
                           000764  2027 	C$DAC_Control.c$282$4_0$120 ==.
                                   2028 ;	DAC_Control.c:282: generate_sin_wave();
      0027C6 12 25 7B         [24] 2029 	lcall	_generate_sin_wave
                           000767  2030 	C$DAC_Control.c$284$6_0$121 ==.
                                   2031 ;	DAC_Control.c:284: for (volatile uint16_t i = 0; i < (1200 / wave_frequency); i++);
      0027C9 90 05 2A         [24] 2032 	mov	dptr,#_main_i_327680_121
      0027CC E4               [12] 2033 	clr	a
      0027CD F0               [24] 2034 	movx	@dptr,a
      0027CE A3               [24] 2035 	inc	dptr
      0027CF F0               [24] 2036 	movx	@dptr,a
      0027D0                       2037 00120$:
      0027D0 90 05 74         [24] 2038 	mov	dptr,#_wave_frequency
      0027D3 E0               [24] 2039 	movx	a,@dptr
      0027D4 FE               [12] 2040 	mov	r6,a
      0027D5 A3               [24] 2041 	inc	dptr
      0027D6 E0               [24] 2042 	movx	a,@dptr
      0027D7 FF               [12] 2043 	mov	r7,a
      0027D8 90 05 2C         [24] 2044 	mov	dptr,#__divuint_PARM_2
      0027DB EE               [12] 2045 	mov	a,r6
      0027DC F0               [24] 2046 	movx	@dptr,a
      0027DD EF               [12] 2047 	mov	a,r7
      0027DE A3               [24] 2048 	inc	dptr
      0027DF F0               [24] 2049 	movx	@dptr,a
      0027E0 90 04 B0         [24] 2050 	mov	dptr,#0x04b0
      0027E3 12 28 88         [24] 2051 	lcall	__divuint
      0027E6 AE 82            [24] 2052 	mov	r6,dpl
      0027E8 AF 83            [24] 2053 	mov	r7,dph
      0027EA 90 05 2A         [24] 2054 	mov	dptr,#_main_i_327680_121
      0027ED E0               [24] 2055 	movx	a,@dptr
      0027EE FC               [12] 2056 	mov	r4,a
      0027EF A3               [24] 2057 	inc	dptr
      0027F0 E0               [24] 2058 	movx	a,@dptr
      0027F1 FD               [12] 2059 	mov	r5,a
      0027F2 C3               [12] 2060 	clr	c
      0027F3 EC               [12] 2061 	mov	a,r4
      0027F4 9E               [12] 2062 	subb	a,r6
      0027F5 ED               [12] 2063 	mov	a,r5
      0027F6 9F               [12] 2064 	subb	a,r7
      0027F7 50 CA            [24] 2065 	jnc	00104$
      0027F9 90 05 2A         [24] 2066 	mov	dptr,#_main_i_327680_121
      0027FC E0               [24] 2067 	movx	a,@dptr
      0027FD FE               [12] 2068 	mov	r6,a
      0027FE A3               [24] 2069 	inc	dptr
      0027FF E0               [24] 2070 	movx	a,@dptr
      002800 FF               [12] 2071 	mov	r7,a
      002801 90 05 2A         [24] 2072 	mov	dptr,#_main_i_327680_121
      002804 74 01            [12] 2073 	mov	a,#0x01
      002806 2E               [12] 2074 	add	a,r6
      002807 F0               [24] 2075 	movx	@dptr,a
      002808 E4               [12] 2076 	clr	a
      002809 3F               [12] 2077 	addc	a,r7
      00280A A3               [24] 2078 	inc	dptr
      00280B F0               [24] 2079 	movx	@dptr,a
      00280C 80 C2            [24] 2080 	sjmp	00120$
      00280E                       2081 00106$:
                           0007AC  2082 	C$DAC_Control.c$286$3_0$119 ==.
                                   2083 ;	DAC_Control.c:286: getchar(); // Clear the input buffer
      00280E 12 24 37         [24] 2084 	lcall	_getchar
                           0007AF  2085 	C$DAC_Control.c$287$3_0$119 ==.
                                   2086 ;	DAC_Control.c:287: putstr("sin wave stopped\n\r");
      002811 90 3A 9A         [24] 2087 	mov	dptr,#___str_22
      002814 75 F0 80         [24] 2088 	mov	b,#0x80
      002817 12 24 45         [24] 2089 	lcall	_putstr
                           0007B8  2090 	C$DAC_Control.c$288$3_0$119 ==.
                                   2091 ;	DAC_Control.c:288: break;
      00281A 02 27 6A         [24] 2092 	ljmp	00117$
                           0007BB  2093 	C$DAC_Control.c$290$3_0$119 ==.
                                   2094 ;	DAC_Control.c:290: case '3':
      00281D                       2095 00107$:
                           0007BB  2096 	C$DAC_Control.c$291$3_0$119 ==.
                                   2097 ;	DAC_Control.c:291: manual_dac_control();
      00281D 12 26 C2         [24] 2098 	lcall	_manual_dac_control
                           0007BE  2099 	C$DAC_Control.c$292$3_0$119 ==.
                                   2100 ;	DAC_Control.c:292: break;
      002820 02 27 6A         [24] 2101 	ljmp	00117$
                           0007C1  2102 	C$DAC_Control.c$294$3_0$119 ==.
                                   2103 ;	DAC_Control.c:294: case '4':
      002823                       2104 00108$:
                           0007C1  2105 	C$DAC_Control.c$295$3_0$119 ==.
                                   2106 ;	DAC_Control.c:295: bit_bang_mode = !bit_bang_mode;
      002823 90 05 76         [24] 2107 	mov	dptr,#_bit_bang_mode
      002826 E0               [24] 2108 	movx	a,@dptr
      002827 B4 01 00         [24] 2109 	cjne	a,#0x01,00186$
      00282A                       2110 00186$:
      00282A E4               [12] 2111 	clr	a
      00282B 33               [12] 2112 	rlc	a
      00282C F0               [24] 2113 	movx	@dptr,a
                           0007CB  2114 	C$DAC_Control.c$296$3_0$119 ==.
                                   2115 ;	DAC_Control.c:296: if (bit_bang_mode) {
      00282D 90 05 76         [24] 2116 	mov	dptr,#_bit_bang_mode
      002830 E0               [24] 2117 	movx	a,@dptr
      002831 60 05            [24] 2118 	jz	00110$
                           0007D1  2119 	C$DAC_Control.c$297$4_0$122 ==.
                                   2120 ;	DAC_Control.c:297: spi_deinit(); // Disable hardware SPI
      002833 12 24 B5         [24] 2121 	lcall	_spi_deinit
      002836 80 03            [24] 2122 	sjmp	00111$
      002838                       2123 00110$:
                           0007D6  2124 	C$DAC_Control.c$299$4_0$123 ==.
                                   2125 ;	DAC_Control.c:299: spi_init(); // Re-enable hardware SPI
      002838 12 24 9F         [24] 2126 	lcall	_spi_init
      00283B                       2127 00111$:
                           0007D9  2128 	C$DAC_Control.c$301$3_0$119 ==.
                                   2129 ;	DAC_Control.c:301: printf("Bit-Bang Mode %s\n\r", bit_bang_mode ? "Enabled" : "Disabled");
      00283B 90 05 76         [24] 2130 	mov	dptr,#_bit_bang_mode
      00283E E0               [24] 2131 	movx	a,@dptr
      00283F 60 06            [24] 2132 	jz	00124$
      002841 7E C0            [12] 2133 	mov	r6,#___str_24
      002843 7F 3A            [12] 2134 	mov	r7,#(___str_24 >> 8)
      002845 80 04            [24] 2135 	sjmp	00125$
      002847                       2136 00124$:
      002847 7E C8            [12] 2137 	mov	r6,#___str_25
      002849 7F 3A            [12] 2138 	mov	r7,#(___str_25 >> 8)
      00284B                       2139 00125$:
      00284B 7D 80            [12] 2140 	mov	r5,#0x80
      00284D C0 06            [24] 2141 	push	ar6
      00284F C0 07            [24] 2142 	push	ar7
      002851 C0 05            [24] 2143 	push	ar5
      002853 74 AD            [12] 2144 	mov	a,#___str_23
      002855 C0 E0            [24] 2145 	push	acc
      002857 74 3A            [12] 2146 	mov	a,#(___str_23 >> 8)
      002859 C0 E0            [24] 2147 	push	acc
      00285B ED               [12] 2148 	mov	a,r5
      00285C C0 E0            [24] 2149 	push	acc
      00285E 12 2C F3         [24] 2150 	lcall	_printf
      002861 E5 81            [12] 2151 	mov	a,sp
      002863 24 FA            [12] 2152 	add	a,#0xfa
      002865 F5 81            [12] 2153 	mov	sp,a
                           000805  2154 	C$DAC_Control.c$302$3_0$119 ==.
                                   2155 ;	DAC_Control.c:302: break;
      002867 02 27 6A         [24] 2156 	ljmp	00117$
                           000808  2157 	C$DAC_Control.c$305$3_0$119 ==.
                                   2158 ;	DAC_Control.c:305: case 'H':
      00286A                       2159 00113$:
                           000808  2160 	C$DAC_Control.c$306$3_0$119 ==.
                                   2161 ;	DAC_Control.c:306: print_menu();
      00286A 12 27 0A         [24] 2162 	lcall	_print_menu
                           00080B  2163 	C$DAC_Control.c$307$3_0$119 ==.
                                   2164 ;	DAC_Control.c:307: break;
      00286D 02 27 6A         [24] 2165 	ljmp	00117$
                           00080E  2166 	C$DAC_Control.c$309$3_0$119 ==.
                                   2167 ;	DAC_Control.c:309: default:
      002870                       2168 00114$:
                           00080E  2169 	C$DAC_Control.c$310$3_0$119 ==.
                                   2170 ;	DAC_Control.c:310: putstr("Invalid choice. Press 'h' for help.\n\r");
      002870 90 3A D1         [24] 2171 	mov	dptr,#___str_26
      002873 75 F0 80         [24] 2172 	mov	b,#0x80
      002876 12 24 45         [24] 2173 	lcall	_putstr
                           000817  2174 	C$DAC_Control.c$312$1_0$117 ==.
                                   2175 ;	DAC_Control.c:312: }
      002879 02 27 6A         [24] 2176 	ljmp	00117$
                           00081A  2177 	C$DAC_Control.c$315$1_0$117 ==.
                                   2178 ;	DAC_Control.c:315: return 0;
                           00081A  2179 	C$DAC_Control.c$316$1_0$117 ==.
                                   2180 ;	DAC_Control.c:316: }
                           00081A  2181 	C$DAC_Control.c$316$1_0$117 ==.
                           00081A  2182 	XG$main$0$0 ==.
      00287C 22               [24] 2183 	ret
                                   2184 	.area CSEG    (CODE)
                                   2185 	.area CONST   (CODE)
                           000000  2186 FDAC_Control$__str_0$0_0$0 == .
                                   2187 	.area CONST   (CODE)
      0038B3                       2188 ___str_0:
      0038B3 53 50 49 20 43 6F 6E  2189 	.ascii "SPI Controller Initialized"
             74 72 6F 6C 6C 65 72
             20 49 6E 69 74 69 61
             6C 69 7A 65 64
      0038CD 0A                    2190 	.db 0x0a
      0038CE 0D                    2191 	.db 0x0d
      0038CF 00                    2192 	.db 0x00
                                   2193 	.area CSEG    (CODE)
                           00081B  2194 FDAC_Control$__str_1$0_0$0 == .
                                   2195 	.area CONST   (CODE)
      0038D0                       2196 ___str_1:
      0038D0 30 56 20 28 30 29     2197 	.ascii "0V (0)"
      0038D6 00                    2198 	.db 0x00
                                   2199 	.area CSEG    (CODE)
                           00081B  2200 FDAC_Control$__str_2$0_0$0 == .
                                   2201 	.area CONST   (CODE)
      0038D7                       2202 ___str_2:
      0038D7 31 2E 32 35 56 20 28  2203 	.ascii "1.25V (64)"
             36 34 29
      0038E1 00                    2204 	.db 0x00
                                   2205 	.area CSEG    (CODE)
                           00081B  2206 FDAC_Control$__str_3$0_0$0 == .
                                   2207 	.area CONST   (CODE)
      0038E2                       2208 ___str_3:
      0038E2 32 2E 35 56 20 28 31  2209 	.ascii "2.5V (128)"
             32 38 29
      0038EC 00                    2210 	.db 0x00
                                   2211 	.area CSEG    (CODE)
                           00081B  2212 FDAC_Control$__str_4$0_0$0 == .
                                   2213 	.area CONST   (CODE)
      0038ED                       2214 ___str_4:
      0038ED 33 2E 37 35 56 20 28  2215 	.ascii "3.75V (192)"
             31 39 32 29
      0038F8 00                    2216 	.db 0x00
                                   2217 	.area CSEG    (CODE)
                           00081B  2218 FDAC_Control$__str_5$0_0$0 == .
                                   2219 	.area CONST   (CODE)
      0038F9                       2220 ___str_5:
      0038F9 35 56 20 28 32 35 35  2221 	.ascii "5V (255)"
             29
      003901 00                    2222 	.db 0x00
                                   2223 	.area CSEG    (CODE)
                           00081B  2224 FDAC_Control$__str_6$0_0$0 == .
                                   2225 	.area CONST   (CODE)
      003902                       2226 ___str_6:
      003902 0A                    2227 	.db 0x0a
      003903 0D                    2228 	.db 0x0d
      003904 2D 2D 2D 2D 2D 20 44  2229 	.ascii "----- DC Level Test ----"
             43 20 4C 65 76 65 6C
             20 54 65 73 74 20 2D
             2D 2D 2D
      00391C 0A                    2230 	.db 0x0a
      00391D 0D                    2231 	.db 0x0d
      00391E 00                    2232 	.db 0x00
                                   2233 	.area CSEG    (CODE)
                           00081B  2234 FDAC_Control$__str_7$0_0$0 == .
                                   2235 	.area CONST   (CODE)
      00391F                       2236 ___str_7:
      00391F 53 65 74 74 69 6E 67  2237 	.ascii "Setting Channel A to %s"
             20 43 68 61 6E 6E 65
             6C 20 41 20 74 6F 20
             25 73
      003936 0A                    2238 	.db 0x0a
      003937 0D                    2239 	.db 0x0d
      003938 00                    2240 	.db 0x00
                                   2241 	.area CSEG    (CODE)
                           00081B  2242 FDAC_Control$__str_8$0_0$0 == .
                                   2243 	.area CONST   (CODE)
      003939                       2244 ___str_8:
      003939 50 72 65 73 73 20 61  2245 	.ascii "Press a key to do the next value"
             20 6B 65 79 20 74 6F
             20 64 6F 20 74 68 65
             20 6E 65 78 74 20 76
             61 6C 75 65
      003959 0A                    2246 	.db 0x0a
      00395A 0D                    2247 	.db 0x0d
      00395B 00                    2248 	.db 0x00
                                   2249 	.area CSEG    (CODE)
                           00081B  2250 FDAC_Control$__str_9$0_0$0 == .
                                   2251 	.area CONST   (CODE)
      00395C                       2252 ___str_9:
      00395C 0A                    2253 	.db 0x0a
      00395D 0D                    2254 	.db 0x0d
      00395E 00                    2255 	.db 0x00
                                   2256 	.area CSEG    (CODE)
                           00081B  2257 FDAC_Control$__str_10$0_0$0 == .
                                   2258 	.area CONST   (CODE)
      00395F                       2259 ___str_10:
      00395F 45 6E 74 65 72 20 44  2260 	.ascii "Enter DAC value (0-255): "
             41 43 20 76 61 6C 75
             65 20 28 30 2D 32 35
             35 29 3A 20
      003978 00                    2261 	.db 0x00
                                   2262 	.area CSEG    (CODE)
                           00081B  2263 FDAC_Control$__str_11$0_0$0 == .
                                   2264 	.area CONST   (CODE)
      003979                       2265 ___str_11:
      003979 45 72 72 6F 72 3A 20  2266 	.ascii "Error: Value must be 0-255"
             56 61 6C 75 65 20 6D
             75 73 74 20 62 65 20
             30 2D 32 35 35
      003993 0A                    2267 	.db 0x0a
      003994 0D                    2268 	.db 0x0d
      003995 00                    2269 	.db 0x00
                                   2270 	.area CSEG    (CODE)
                           00081B  2271 FDAC_Control$__str_12$0_0$0 == .
                                   2272 	.area CONST   (CODE)
      003996                       2273 ___str_12:
      003996 43 68 61 6E 6E 65 6C  2274 	.ascii "Channel A set to %d"
             20 41 20 73 65 74 20
             74 6F 20 25 64
      0039A9 0A                    2275 	.db 0x0a
      0039AA 0D                    2276 	.db 0x0d
      0039AB 00                    2277 	.db 0x00
                                   2278 	.area CSEG    (CODE)
                           00081B  2279 FDAC_Control$__str_13$0_0$0 == .
                                   2280 	.area CONST   (CODE)
      0039AC                       2281 ___str_13:
      0039AC 48 65 72 65 27 73 20  2282 	.ascii "Here's everything you can do: "
             65 76 65 72 79 74 68
             69 6E 67 20 79 6F 75
             20 63 61 6E 20 64 6F
             3A 20
      0039CA 0A                    2283 	.db 0x0a
      0039CB 0D                    2284 	.db 0x0d
      0039CC 00                    2285 	.db 0x00
                                   2286 	.area CSEG    (CODE)
                           00081B  2287 FDAC_Control$__str_14$0_0$0 == .
                                   2288 	.area CONST   (CODE)
      0039CD                       2289 ___str_14:
      0039CD 31 2E 20 54 65 73 74  2290 	.ascii "1. Test DC Levels"
             20 44 43 20 4C 65 76
             65 6C 73
      0039DE 0A                    2291 	.db 0x0a
      0039DF 0D                    2292 	.db 0x0d
      0039E0 00                    2293 	.db 0x00
                                   2294 	.area CSEG    (CODE)
                           00081B  2295 FDAC_Control$__str_15$0_0$0 == .
                                   2296 	.area CONST   (CODE)
      0039E1                       2297 ___str_15:
      0039E1 32 2E 20 73 69 6E 20  2298 	.ascii "2. sin Wave"
             57 61 76 65
      0039EC 0A                    2299 	.db 0x0a
      0039ED 0D                    2300 	.db 0x0d
      0039EE 00                    2301 	.db 0x00
                                   2302 	.area CSEG    (CODE)
                           00081B  2303 FDAC_Control$__str_16$0_0$0 == .
                                   2304 	.area CONST   (CODE)
      0039EF                       2305 ___str_16:
      0039EF 33 2E 20 4D 61 6E 75  2306 	.ascii "3. Manual DAC Value"
             61 6C 20 44 41 43 20
             56 61 6C 75 65
      003A02 0A                    2307 	.db 0x0a
      003A03 0D                    2308 	.db 0x0d
      003A04 00                    2309 	.db 0x00
                                   2310 	.area CSEG    (CODE)
                           00081B  2311 FDAC_Control$__str_17$0_0$0 == .
                                   2312 	.area CONST   (CODE)
      003A05                       2313 ___str_17:
      003A05 34 2E 20 54 6F 67 67  2314 	.ascii "4. Toggle Bit-Bang Mode"
             6C 65 20 42 69 74 2D
             42 61 6E 67 20 4D 6F
             64 65
      003A1C 0A                    2315 	.db 0x0a
      003A1D 0D                    2316 	.db 0x0d
      003A1E 00                    2317 	.db 0x00
                                   2318 	.area CSEG    (CODE)
                           00081B  2319 FDAC_Control$__str_18$0_0$0 == .
                                   2320 	.area CONST   (CODE)
      003A1F                       2321 ___str_18:
      003A1F 68 2E 20 48 65 6C 70  2322 	.ascii "h. Help (show this menu)"
             20 28 73 68 6F 77 20
             74 68 69 73 20 6D 65
             6E 75 29
      003A37 0A                    2323 	.db 0x0a
      003A38 0D                    2324 	.db 0x0d
      003A39 00                    2325 	.db 0x00
                                   2326 	.area CSEG    (CODE)
                           00081B  2327 FDAC_Control$__str_19$0_0$0 == .
                                   2328 	.area CONST   (CODE)
      003A3A                       2329 ___str_19:
      003A3A 2D 2D 2D 2D 2D 2D 2D  2330 	.ascii "----------------------------------------"
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D 2D 2D
             2D 2D 2D 2D 2D
      003A62 0A                    2331 	.db 0x0a
      003A63 0D                    2332 	.db 0x0d
      003A64 00                    2333 	.db 0x00
                                   2334 	.area CSEG    (CODE)
                           00081B  2335 FDAC_Control$__str_20$0_0$0 == .
                                   2336 	.area CONST   (CODE)
      003A65                       2337 ___str_20:
      003A65 0A                    2338 	.db 0x0a
      003A66 45 6E 74 65 72 20 63  2339 	.ascii "Enter choice: "
             68 6F 69 63 65 3A 20
      003A74 00                    2340 	.db 0x00
                                   2341 	.area CSEG    (CODE)
                           00081B  2342 FDAC_Control$__str_21$0_0$0 == .
                                   2343 	.area CONST   (CODE)
      003A75                       2344 ___str_21:
      003A75 50 75 74 20 61 6E 79  2345 	.ascii "Put any char to stop the sin wave "
             20 63 68 61 72 20 74
             6F 20 73 74 6F 70 20
             74 68 65 20 73 69 6E
             20 77 61 76 65 20
      003A97 0A                    2346 	.db 0x0a
      003A98 0D                    2347 	.db 0x0d
      003A99 00                    2348 	.db 0x00
                                   2349 	.area CSEG    (CODE)
                           00081B  2350 FDAC_Control$__str_22$0_0$0 == .
                                   2351 	.area CONST   (CODE)
      003A9A                       2352 ___str_22:
      003A9A 73 69 6E 20 77 61 76  2353 	.ascii "sin wave stopped"
             65 20 73 74 6F 70 70
             65 64
      003AAA 0A                    2354 	.db 0x0a
      003AAB 0D                    2355 	.db 0x0d
      003AAC 00                    2356 	.db 0x00
                                   2357 	.area CSEG    (CODE)
                           00081B  2358 FDAC_Control$__str_23$0_0$0 == .
                                   2359 	.area CONST   (CODE)
      003AAD                       2360 ___str_23:
      003AAD 42 69 74 2D 42 61 6E  2361 	.ascii "Bit-Bang Mode %s"
             67 20 4D 6F 64 65 20
             25 73
      003ABD 0A                    2362 	.db 0x0a
      003ABE 0D                    2363 	.db 0x0d
      003ABF 00                    2364 	.db 0x00
                                   2365 	.area CSEG    (CODE)
                           00081B  2366 FDAC_Control$__str_24$0_0$0 == .
                                   2367 	.area CONST   (CODE)
      003AC0                       2368 ___str_24:
      003AC0 45 6E 61 62 6C 65 64  2369 	.ascii "Enabled"
      003AC7 00                    2370 	.db 0x00
                                   2371 	.area CSEG    (CODE)
                           00081B  2372 FDAC_Control$__str_25$0_0$0 == .
                                   2373 	.area CONST   (CODE)
      003AC8                       2374 ___str_25:
      003AC8 44 69 73 61 62 6C 65  2375 	.ascii "Disabled"
             64
      003AD0 00                    2376 	.db 0x00
                                   2377 	.area CSEG    (CODE)
                           00081B  2378 FDAC_Control$__str_26$0_0$0 == .
                                   2379 	.area CONST   (CODE)
      003AD1                       2380 ___str_26:
      003AD1 49 6E 76 61 6C 69 64  2381 	.ascii "Invalid choice. Press 'h' for help."
             20 63 68 6F 69 63 65
             2E 20 50 72 65 73 73
             20 27 68 27 20 66 6F
             72 20 68 65 6C 70 2E
      003AF4 0A                    2382 	.db 0x0a
      003AF5 0D                    2383 	.db 0x0d
      003AF6 00                    2384 	.db 0x00
                                   2385 	.area CSEG    (CODE)
                                   2386 	.area XINIT   (CODE)
                           000000  2387 FDAC_Control$__xinit_sin_index$0_0$0 == .
      003B02                       2388 __xinit__sin_index:
      003B02 00                    2389 	.db #0x00	; 0
                           000001  2390 FDAC_Control$__xinit_wave_frequency$0_0$0 == .
      003B03                       2391 __xinit__wave_frequency:
      003B03 64 00                 2392 	.byte #0x64, #0x00	; 100
                           000003  2393 FDAC_Control$__xinit_bit_bang_mode$0_0$0 == .
      003B05                       2394 __xinit__bit_bang_mode:
      003B05 00                    2395 	.db #0x00	;  0
                                   2396 	.area CABS    (ABS,CODE)
