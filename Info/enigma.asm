0000: F3       di
0001: 32 06 58 ld   ($5806),a
0004: AF       xor  a
0005: C3 5A 02 jp   $025A
0008: F5       push af
0009: 3E 00    ld   a,$00
000B: C3 5D 00 jp   $005D
000E: 4D       ld   c,l
000F: 56       ld   d,(hl)
0010: F5       push af
0011: 3E 01    ld   a,$01
0013: C3 5D 00 jp   $005D
0016: 48       ld   c,b
0017: 0D       dec  c
0018: D5       push de
0019: 11 20 00 ld   de,$0020
001C: 19       add  hl,de
001D: D1       pop  de
001E: C9       ret
001F: 00       nop
0020: D5       push de
0021: 11 E0 FF ld   de,$FFE0
0024: 19       add  hl,de
0025: D1       pop  de
0026: C9       ret
0027: 49       ld   c,c
0028: 0D       dec  c
0029: 0A       ld   a,(bc)
002A: 5A       ld   e,d
002B: 49       ld   c,c
002C: 4C       ld   c,h
002D: 45       ld   b,l
002E: 43       ld   b,e
002F: 36 3A    ld   (hl),$3A
0031: 09       add  hl,bc
0032: 4C       ld   c,h
0033: 44       ld   b,h
0034: 41       ld   b,c
0035: 20 35    jr   nz,$006C
0037: 30 F3    jr   nc,$002C
;-------------------------- interrupt routine?
0039: 7E       ld   a,(hl)	;load value from hl into a
003A: 12       ld   (de),a	;load into de value from a - so move value from hl to de
003B: 23       inc  hl		;inc
003C: 13       inc  de		;inc
003D: 05       dec  b		;dec b
003E: C2 39 00 jp   nz,$0039 ;loop if not zero
0041: C9       ret
;---------------------------
0042: F3       di
0043: 3E 01    ld   a,$01
0045: 32 B4 20 ld   ($20B4),a
0048: 7E       ld   a,(hl)
0049: 4F       ld   c,a
004A: 1A       ld   a,(de)
004B: 77       ld   (hl),a
004C: 79       ld   a,c
004D: 12       ld   (de),a
004E: 23       inc  hl
004F: 13       inc  de
0050: 05       dec  b
0051: C2 48 00 jp   nz,$0048
0054: 3E 20    ld   a,$20
0056: 32 A8 20 ld   ($20A8),a
0059: 32 A0 20 ld   ($20A0),a
005C: C9       ret
005D: 32 81 20 ld   ($2081),a
0060: 32 06 58 ld   ($5806),a
0063: C5       push bc
0064: D5       push de
0065: E5       push hl
0066: 3A 01 58 ld   a,($5801) 	;IN0 read
0069: E6 01    and  $01			;check against bit 1 - Coin In
006B: CA 76 00 jp   z,$0076
006E: 3E 01    ld   a,$01
0070: 32 82 20 ld   ($2082),a
0073: C3 BC 00 jp   $00BC
0076: 3A 82 20 ld   a,($2082)
0079: A7       and  a
007A: CA BC 00 jp   z,$00BC
007D: AF       xor  a
007E: 32 82 20 ld   ($2082),a
0081: 3E 15    ld   a,$15
0083: CD 1D 01 call $011D
0086: 3A 00 20 ld   a,($2000)
0089: 17       rla
008A: D2 9A 00 jp   nc,$009A
008D: 21 84 20 ld   hl,$2084
0090: 34       inc  (hl)
0091: 7E       ld   a,(hl)
0092: E6 01    and  $01
0094: CA 9A 00 jp   z,$009A
0097: C3 BC 00 jp   $00BC
009A: 21 83 20 ld   hl,$2083
009D: 7E       ld   a,(hl)
009E: FE 99    cp   $99
00A0: CA BC 00 jp   z,$00BC
00A3: 3C       inc  a
00A4: 57       ld   d,a
00A5: E6 0F    and  $0F
00A7: FE 0A    cp   $0A
00A9: 7A       ld   a,d
00AA: DA B0 00 jp   c,$00B0
00AD: 37       scf
00AE: 3F       ccf
00AF: 27       daa
00B0: 77       ld   (hl),a
00B1: CD 16 0F call $0F16
00B4: 3A B2 20 ld   a,($20B2)
00B7: E6 40    and  $40
00B9: CA F5 00 jp   z,$00F5
00BC: CD 73 07 call $0773
00BF: 3A 8F 20 ld   a,($208F)
00C2: 3D       dec  a
00C3: 32 8F 20 ld   ($208F),a
00C6: 3A 84 22 ld   a,($2284)
00C9: A7       and  a
00CA: C2 EA 00 jp   nz,$00EA
00CD: 3A A0 20 ld   a,($20A0)
00D0: FE 05    cp   $05
00D2: D2 12 01 jp   nc,$0112
00D5: 3E 01    ld   a,$01
00D7: 32 8E 20 ld   ($208E),a
00DA: C3 17 01 jp   $0117
00DD: 4A       ld   c,d
00DE: 4F       ld   c,a
00DF: 48       ld   c,b
00E0: 4E       ld   c,(hl)
00E1: 20 4C    jr   nz,$012F
00E3: 41       ld   b,c
00E4: 54       ld   d,h
00E5: 48       ld   c,b
00E6: 42       ld   b,d
00E7: 55       ld   d,l
00E8: 52       ld   d,d
00E9: 59       ld   e,c
00EA: 3A 00 20 ld   a,($2000)
00ED: E6 08    and  $08
00EF: CA D5 00 jp   z,$00D5
00F2: C3 CD 00 jp   $00CD
00F5: AF       xor  a
00F6: 32 83 22 ld   ($2283),a
00F9: 3A B2 20 ld   a,($20B2)
00FC: E6 0C    and  $0C
00FE: 32 B2 20 ld   ($20B2),a
0101: C2 07 01 jp   nz,$0107
0104: CD 2C 09 call $092C
0107: 3E 20    ld   a,$20
0109: 32 A2 20 ld   ($20A2),a
010C: CD 6A 09 call $096A
010F: C3 BC 00 jp   $00BC
0112: 3E 10    ld   a,$10
0114: 32 8E 20 ld   ($208E),a
0117: E1       pop  hl
0118: D1       pop  de
0119: C1       pop  bc
011A: F1       pop  af
011B: FB       ei
011C: C9       ret
;--------------------------------  sound interfacing shenanigans
011D: F3       di
011E: D5       push de
011F: 57       ld   d,a				;d = a = $13										;if a = $9A; d = 9A
0120: 3A D8 20 ld   a,($20D8)		;get value from $20D8 into a
0123: A7       and  a				;and a? = 0?
0124: 7A       ld   a,d				;a = d = $13
0125: D1       pop  de
0126: C0       ret  nz				;retrun if not zero
0127: C5       push bc
0128: 06 08    ld   b,$08			;b = $08
012A: F6 80    or   $80				;or $13 with $80 - $93
012C: 2F       cpl					;subract A from FF = $6C
012D: 4F       ld   c,a				;c = $6C
012E: E6 01    and  $01				;=$01	
0130: F6 04    or   $04				;=$05
0132: 32 03 58 ld   ($5803),a		;load $05 into 5803 - is the sound interface
0135: E6 01    and  $01				;=$01
0137: 32 03 58 ld   ($5803),a		;load $01 into 5803
013A: 79       ld   a,c				;a = $77
013B: 1F       rra					;3B?
013C: 4F       ld   c,a				;c = 3B
013D: 05       dec  b				;does 05,01,04,00 into 5803 until B is 0
013E: C2 2E 01 jp   nz,$012E
0141: 3E 07    ld   a,$07
0143: C1       pop  bc
0144: 32 03 58 ld   ($5803),a		;put $07 into 5803 - what does $07 actually do? What should it do?
0147: C9       ret
;---------------------------------
0148: D8       ret  c
0149: 10 00    djnz $014B
014B: 10 00    djnz $014D
014D: 10 00    djnz $014F
014F: 10 00    djnz $0151
0151: 38 00    jr   c,$0153
0153: 38 00    jr   c,$0155
0155: 78       ld   a,b
0156: 00       nop
0157: 78       ld   a,b
0158: 00       nop
0159: F8       ret  m
015A: 00       nop
015B: 78       ld   a,b
015C: 01 78 02 ld   bc,$0278
015F: 78       ld   a,b
0160: 04       inc  b
0161: 78       ld   a,b
0162: 04       inc  b
0163: 78       ld   a,b
0164: 04       inc  b
0165: F8       ret  m
0166: 07       rlca
0167: C8       ret  z
0168: 06 A8    ld   b,$A8
016A: 06 68    ld   b,$68
016C: 06 E8    ld   b,$E8
016E: 06 F8    ld   b,$F8
0170: 07       rlca
0171: F8       ret  m
0172: 07       rlca
0173: E8       ret  pe
0174: 06 08    ld   b,$08
0176: 06 E8    ld   b,$E8
0178: 06 F8    ld   b,$F8
017A: 07       rlca
017B: F8       ret  m
017C: 07       rlca
017D: 08       ex   af,af'
017E: 06 E8    ld   b,$E8
0180: 07       rlca
0181: E8       ret  pe
0182: 07       rlca
0183: F8       ret  m
0184: 07       rlca
0185: F8       ret  m
0186: 07       rlca
0187: 08       ex   af,af'
0188: 06 A8    ld   b,$A8
018A: 06 E8    ld   b,$E8
018C: 06 F8    ld   b,$F8
018E: 07       rlca
018F: F8       ret  m
0190: 07       rlca
0191: 08       ex   af,af'
0192: 06 E8    ld   b,$E8
0194: 06 E8    ld   b,$E8
0196: 0E F8    ld   c,$F8
0198: 1F       rra
0199: F8       ret  m
019A: 3F       ccf
019B: F8       ret  m
019C: 7F       ld   a,a
019D: F8       ret  m
019E: FF       rst  $38
019F: F8       ret  m
01A0: FF       rst  $38
01A1: F8       ret  m
01A2: FF       rst  $38
01A3: F8       ret  m
01A4: FF       rst  $38
01A5: F0       ret  p
01A6: 03       inc  bc
01A7: E0       ret  po
01A8: 01 80 00 ld   bc,$0080
01AB: 80       add  a,b
01AC: 00       nop
01AD: 80       add  a,b
01AE: 00       nop
01AF: 80       add  a,b
01B0: 00       nop
01B1: 80       add  a,b
01B2: 00       nop
01B3: 80       add  a,b
01B4: 00       nop
01B5: 80       add  a,b
01B6: 00       nop
01B7: 40       ld   b,b
01B8: 01 20 02 ld   bc,$0220
01BB: 10 04    djnz $01C1
01BD: 08       ex   af,af'
01BE: 08       ex   af,af'
01BF: 04       inc  b
01C0: 10 FE    djnz $01C0
01C2: 3F       ccf
01C3: FC 1F 1C call m,$1C1F
01C6: 1C       inc  e
01C7: 5C       ld   e,h
01C8: 1D       dec  e
01C9: DC 1D FC call c,$FC1D
01CC: 1F       rra
01CD: FC 1F 1C call m,$1C1F
01D0: 1C       inc  e
01D1: DC 1F DC call c,$DC1F
01D4: 1F       rra
01D5: FC 1F FC call m,$FC1F
01D8: 1F       rra
01D9: 1C       inc  e
01DA: 1C       inc  e
01DB: 5C       ld   e,h
01DC: 1D       dec  e
01DD: DC 1D FC call c,$FC1D
01E0: 1F       rra
01E1: FC 1F 1C call m,$1C1F
01E4: 1C       inc  e
01E5: DC 1D DC call c,$DC1D
01E8: 1D       dec  e
01E9: FC 1F FC call m,$FC1F
01EC: 1F       rra
01ED: FC 1D 1C call m,$1C1D
01F0: 1C       inc  e
01F1: FC 1D FC call m,$FC1D
01F4: 1F       rra
01F5: FC 1F 1C call m,$1C1F
01F8: 1C       inc  e
01F9: 3C       inc  a
01FA: 1D       dec  e
01FB: 5C       ld   e,h
01FC: 1C       inc  e
01FD: FC 1F FC call m,$FC1F
0200: 1F       rra
0201: 1C       inc  e
0202: 1C       inc  e
0203: DC 1D 1C call c,$1C1D
0206: 1C       inc  e
0207: FC 1F FC call m,$FC1F
020A: 1F       rra
020B: 1C       inc  e
020C: 1C       inc  e
020D: 7C       ld   a,h
020E: 1E 3C    ld   e,$3C
0210: 1F       rra
0211: 1C       inc  e
0212: 1C       inc  e
0213: FC 1F FC call m,$FC1F
0216: 1F       rra
0217: DC 1D 1C call c,$1C1D
021A: 1C       inc  e
021B: DC 1D FC call c,$FC1D
021E: 1F       rra
021F: FC 1F 1C call m,$1C1F
0222: 1C       inc  e
0223: DC 1D DC call c,$DC1D
0226: 1D       dec  e
0227: FC 1F FC call m,$FC1F
022A: 1F       rra
022B: 5C       ld   e,h
022C: 1C       inc  e
022D: 5C       ld   e,h
022E: 1D       dec  e
022F: 1C       inc  e
0230: 1D       dec  e
0231: FC 1F FC call m,$FC1F
0234: 1F       rra
0235: 00       nop
0236: 00       nop
0237: 2C       inc  l
0238: 24       inc  h
0239: 01 09 08 ld   bc,$0809
023C: 01 FF 11 ld   bc,$11FF
023F: 37       scf
0240: 02       ld   (bc),a
0241: 1A       ld   a,(de)
0242: FE 2C    cp   $2C
0244: C2 31 0C jp   nz,$0C31
0247: 21 04 36 ld   hl,$3604
024A: CD B1 0E call $0EB1
024D: 3A CD 20 ld   a,($20CD)
0250: 3D       dec  a
0251: 32 CD 20 ld   ($20CD),a
0254: C2 59 17 jp   nz,$1759
0257: C3 0C 18 jp   $180C
025A: 32 05 58 ld   ($5805),a
025D: 21 00 00 ld   hl,$0000
0260: AF       xor  a
0261: 86       add  a,(hl)
0262: 23       inc  hl
0263: 47       ld   b,a
0264: 7C       ld   a,h
0265: FE 20    cp   $20
0267: 78       ld   a,b
0268: C2 61 02 jp   nz,$0261
026B: A7       and  a
026C: C2 5D 02 jp   nz,$025D
026F: 3E 07    ld   a,$07
0271: 32 03 58 ld   ($5803),a
0274: 3E 03    ld   a,$03
0276: 32 03 58 ld   ($5803),a
0279: 3E 07    ld   a,$07
027B: 32 03 58 ld   ($5803),a
027E: 31 80 20 ld   sp,$2080
0281: 3A 01 50 ld   a,($5001)
0284: 32 00 20 ld   ($2000),a
0287: 3E 96    ld   a,$96
0289: CD 1D 01 call $011D
028C: 21 81 20 ld   hl,$2081
028F: CD 34 09 call $0934
0292: 3A 01 50 ld   a,($5001)
0295: FE 7D    cp   $7D
0297: C2 87 02 jp   nz,$0287
029A: 3E 97    ld   a,$97
029C: CD 1D 01 call $011D
029F: 3A 01 50 ld   a,($5001)
02A2: FE F4    cp   $F4
02A4: C2 9F 02 jp   nz,$029F
02A7: 3E 24    ld   a,$24
02A9: 21 C1 20 ld   hl,$20C1
02AC: 77       ld   (hl),a
02AD: 23       inc  hl
02AE: 77       ld   (hl),a
02AF: 23       inc  hl
02B0: 77       ld   (hl),a
02B1: 21 01 25 ld   hl,$2501
02B4: 22 80 22 ld   ($2280),hl
02B7: 22 80 23 ld   ($2380),hl
02BA: 21 00 22 ld   hl,$2200
02BD: 22 B5 20 ld   ($20B5),hl
02C0: 3E 7F    ld   a,$7F
02C2: 32 82 22 ld   ($2282),a
02C5: 32 82 23 ld   ($2382),a
02C8: 3E FF    ld   a,$FF
02CA: 32 A5 20 ld   ($20A5),a
02CD: 32 A4 20 ld   ($20A4),a
02D0: 3E 20    ld   a,$20
02D2: 32 A2 20 ld   ($20A2),a
02D5: 3A B2 20 ld   a,($20B2)
02D8: E6 40    and  $40
02DA: C2 E9 02 jp   nz,$02E9
02DD: 3A 83 20 ld   a,($2083)
02E0: A7       and  a
02E1: C2 E9 02 jp   nz,$02E9
02E4: 3E 12    ld   a,$12
02E6: CD 1D 01 call $011D
02E9: 3A 84 22 ld   a,($2284)
02EC: A7       and  a
02ED: CA F7 02 jp   z,$02F7
02F0: CD ED 11 call $11ED
02F3: 11 00 22 ld   de,$2200
02F6: FF       rst  $38
;---------------------------------
02F7: 3E C0    ld   a,$C0			;a=C0
02F9: 32 A0 20 ld   ($20A0),a		;put C0 into 20A0
02FC: 3E 20    ld   a,$20			;a=20
02FE: 32 A2 20 ld   ($20A2),a		;20 in 20A2
0301: 32 B4 20 ld   ($20B4),a		;20 in 20B4
0304: 21 01 25 ld   hl,$2501		;hl=2501
0307: 22 80 22 ld   ($2280),hl		;put value in hl into 2280 or actually 2501 into 2280?
030A: CD 2C 09 call $092C
030D: AF       xor  a
030E: 32 B8 20 ld   ($20B8),a
0311: 3E 01    ld   a,$01
0313: 32 A5 20 ld   ($20A5),a
0316: 11 00 22 ld   de,$2200
0319: 3A 84 22 ld   a,($2284)
031C: E6 03    and  $03
031E: FE 03    cp   $03
0320: C2 2A 03 jp   nz,$032A
0323: 3A 9F 20 ld   a,($209F)
0326: 3D       dec  a
0327: 32 9F 20 ld   ($209F),a
032A: 3A A0 20 ld   a,($20A0)
032D: A7       and  a
032E: C2 57 03 jp   nz,$0357
0331: 3A B2 20 ld   a,($20B2)
0334: E6 80    and  $80
0336: CA 40 03 jp   z,$0340
0339: 3A 83 22 ld   a,($2283)
033C: 3C       inc  a
033D: 32 83 22 ld   ($2283),a
0340: 3A 84 22 ld   a,($2284)
0343: 3C       inc  a
0344: 32 84 22 ld   ($2284),a
0347: C3 D5 02 jp   $02D5
034A: 43       ld   b,e
034B: 48       ld   c,b
034C: 52       ld   d,d
034D: 49       ld   c,c
034E: 53       ld   d,e
034F: 20 53    jr   nz,$03A4
0351: 54       ld   d,h
0352: 41       ld   b,c
0353: 4D       ld   c,l
0354: 50       ld   d,b
0355: 45       ld   b,l
0356: 52       ld   d,d
0357: 32 A8 20 ld   ($20A8),a
035A: AF       xor  a
035B: 32 A0 20 ld   ($20A0),a
035E: 3A A2 20 ld   a,($20A2)
0361: E6 80    and  $80
0363: C2 71 03 jp   nz,$0371
0366: D5       push de
0367: 11 C0 22 ld   de,$22C0
036A: 21 60 47 ld   hl,$4760
036D: 06 20    ld   b,$20
036F: FF       rst  $38
0370: D1       pop  de
0371: 3A B7 20 ld   a,($20B7)
0374: 3C       inc  a
0375: 32 B7 20 ld   ($20B7),a
0378: E6 0F    and  $0F
037A: C2 C4 03 jp   nz,$03C4
037D: 3A BB 20 ld   a,($20BB)
0380: A7       and  a
0381: C2 8C 03 jp   nz,$038C
0384: 3A B2 20 ld   a,($20B2)
0387: E6 F3    and  $F3
0389: 32 B2 20 ld   ($20B2),a
038C: 21 C0 22 ld   hl,$22C0
038F: 06 0C    ld   b,$0C
0391: 7E       ld   a,(hl)
0392: E6 1F    and  $1F
0394: FE 0E    cp   $0E
0396: DA A1 03 jp   c,$03A1
0399: 3D       dec  a
039A: 77       ld   (hl),a
039B: 23       inc  hl
039C: 23       inc  hl
039D: 05       dec  b
039E: C2 91 03 jp   nz,$0391
03A1: 21 00 22 ld   hl,$2200
03A4: 01 C1 0C ld   bc,$0CC1
03A7: 7E       ld   a,(hl)
03A8: 23       inc  hl
03A9: 23       inc  hl
03AA: 23       inc  hl
03AB: 23       inc  hl
03AC: FE 80    cp   $80
03AE: D2 B4 12 jp   nc,$12B4
03B1: 05       dec  b
03B2: C2 A7 03 jp   nz,$03A7
03B5: 3A 85 22 ld   a,($2285)
03B8: FE 80    cp   $80
03BA: DA C4 03 jp   c,$03C4
03BD: E6 01    and  $01
03BF: EE 01    xor  $01
03C1: 32 85 22 ld   ($2285),a
03C4: 3E 30    ld   a,$30
03C6: 3D       dec  a
03C7: C2 C6 03 jp   nz,$03C6
03CA: 1A       ld   a,(de)
03CB: 4F       ld   c,a
03CC: FB       ei
03CD: 13       inc  de
03CE: 1A       ld   a,(de)
03CF: 47       ld   b,a
03D0: 13       inc  de
03D1: 1A       ld   a,(de)
03D2: 6F       ld   l,a
03D3: 13       inc  de
03D4: 1A       ld   a,(de)
03D5: 67       ld   h,a
03D6: 79       ld   a,c
03D7: E6 80    and  $80
03D9: CA CB 05 jp   z,$05CB
03DC: 79       ld   a,c
03DD: E6 38    and  $38
03DF: FE 08    cp   $08
03E1: CA 97 0D jp   z,$0D97
03E4: D5       push de
03E5: CD 1D 06 call $061D
03E8: 3A A8 20 ld   a,($20A8)
03EB: FE 04    cp   $04
03ED: DC 75 0E call c,$0E75
03F0: D1       pop  de
03F1: 79       ld   a,c
03F2: E6 38    and  $38
03F4: FE 10    cp   $10
03F6: CA 98 11 jp   z,$1198
03F9: FE 20    cp   $20
03FB: CA 90 12 jp   z,$1290
03FE: FE 28    cp   $28
0400: CA E4 12 jp   z,$12E4
0403: FE 30    cp   $30
0405: CA 91 13 jp   z,$1391
0408: FE 38    cp   $38
040A: CA 9B 14 jp   z,$149B
040D: CD 2E 06 call $062E
0410: 22 9E 20 ld   ($209E),hl
0413: 3A A0 20 ld   a,($20A0)
0416: 3C       inc  a
0417: 32 A0 20 ld   ($20A0),a
041A: 7C       ld   a,h
041B: 12       ld   (de),a
041C: 1B       dec  de
041D: 7D       ld   a,l
041E: 12       ld   (de),a
041F: 1B       dec  de
0420: 78       ld   a,b
0421: 12       ld   (de),a
0422: 1B       dec  de
0423: 1A       ld   a,(de)
0424: E6 80    and  $80
0426: EE 7F    xor  $7F
0428: A1       and  c
0429: 79       ld   a,c
042A: 12       ld   (de),a
042B: 13       inc  de
042C: 13       inc  de
042D: 13       inc  de
042E: 13       inc  de
042F: D5       push de
0430: 3A A2 20 ld   a,($20A2)
0433: E6 E0    and  $E0
0435: C2 5E 05 jp   nz,$055E
0438: 3A 83 22 ld   a,($2283)
043B: A7       and  a
043C: C2 61 04 jp   nz,$0461
043F: 2A A5 20 ld   hl,($20A5)
0442: 7C       ld   a,h
0443: A7       and  a
0444: CA 61 04 jp   z,$0461
0447: 2B       dec  hl
0448: 22 A5 20 ld   ($20A5),hl
044B: 7D       ld   a,l
044C: E6 03    and  $03
044E: CC 2C 11 call z,$112C
0451: C3 5E 05 jp   $055E
0454: 4E       ld   c,(hl)
0455: 4F       ld   c,a
0456: 52       ld   d,d
0457: 4D       ld   c,l
0458: 41       ld   b,c
0459: 4E       ld   c,(hl)
045A: 20 50    jr   nz,$04AC
045C: 41       ld   b,c
045D: 52       ld   d,d
045E: 4B       ld   c,e
045F: 45       ld   b,l
0460: 52       ld   d,d
0461: 3A B2 20 ld   a,($20B2)
0464: E6 20    and  $20
0466: CA 70 04 jp   z,$0470
0469: 3A 83 23 ld   a,($2383)
046C: A7       and  a
046D: C2 40 05 jp   nz,$0540
0470: 3A 83 22 ld   a,($2283)
0473: A7       and  a
0474: C2 56 05 jp   nz,$0556
0477: F3       di
0478: 3E 12    ld   a,$12
047A: CD 1D 01 call $011D
047D: AF       xor  a
047E: 32 B2 20 ld   ($20B2),a
0481: 32 86 20 ld   ($2086),a
0484: 32 05 58 ld   ($5805),a
0487: 3E 20    ld   a,$20
0489: 32 A2 20 ld   ($20A2),a
048C: 11 A9 20 ld   de,$20A9
048F: 21 AC 20 ld   hl,$20AC
0492: CD 2D 16 call $162D
0495: A7       and  a
0496: CA 9E 04 jp   z,$049E
0499: FE 01    cp   $01
049B: CA 46 16 jp   z,$1646
049E: 3E 01    ld   a,$01
04A0: 32 B9 20 ld   ($20B9),a
04A3: 11 A9 20 ld   de,$20A9
04A6: 21 AF 20 ld   hl,$20AF
04A9: CD 2D 16 call $162D
04AC: FE 02    cp   $02
04AE: DA 31 05 jp   c,$0531
04B1: 11 AF 20 ld   de,$20AF
04B4: 3A B9 20 ld   a,($20B9)
04B7: FE 01    cp   $01
04B9: CA 51 16 jp   z,$1651
04BC: 21 AC 20 ld   hl,$20AC
04BF: 06 03    ld   b,$03
04C1: FF       rst  $38
04C2: CD 2C 09 call $092C
04C5: 3A B9 20 ld   a,($20B9)
04C8: FE 01    cp   $01
04CA: CA 57 16 jp   z,$1657
04CD: 3E 20    ld   a,$20
04CF: 32 86 20 ld   ($2086),a
04D2: 32 05 58 ld   ($5805),a
04D5: CD E5 04 call $04E5
04D8: C3 FF 04 jp   $04FF
04DB: 44       ld   b,h
04DC: 41       ld   b,c
04DD: 56       ld   d,(hl)
04DE: 45       ld   b,l
04DF: 20 53    jr   nz,$0534
04E1: 57       ld   d,a
04E2: 49       ld   c,c
04E3: 46       ld   b,(hl)
04E4: 54       ld   d,h
04E5: 21 0D 26 ld   hl,$260D
04E8: 11 F5 18 ld   de,$18F5
04EB: CD B1 0E call $0EB1
04EE: 11 B9 20 ld   de,$20B9
04F1: 06 01    ld   b,$01
04F3: CD F7 0E call $0EF7
04F6: 21 8B 27 ld   hl,$278B
04F9: 11 0D 19 ld   de,$190D
04FC: C3 B1 0E jp   $0EB1
04FF: 21 09 30 ld   hl,$3009
0502: 22 BE 20 ld   ($20BE),hl
0505: 11 23 19 ld   de,$1923
0508: CD B1 0E call $0EB1
050B: 21 00 06 ld   hl,$0600
050E: 22 BA 20 ld   ($20BA),hl
0511: 21 C1 20 ld   hl,$20C1
0514: 22 BC 20 ld   ($20BC),hl
0517: 3E 03    ld   a,$03
0519: 32 C0 20 ld   ($20C0),a
051C: 21 C1 20 ld   hl,$20C1
051F: 3E 24    ld   a,$24
0521: 77       ld   (hl),a
0522: 23       inc  hl
0523: 77       ld   (hl),a
0524: 23       inc  hl
0525: 77       ld   (hl),a
0526: 3A B2 20 ld   a,($20B2)
0529: F6 0C    or   $0C
052B: 32 B2 20 ld   ($20B2),a
052E: C3 5E 05 jp   $055E
0531: CD 2C 09 call $092C
0534: C3 5E 05 jp   $055E
0537: 4C       ld   c,h
0538: 45       ld   b,l
0539: 4E       ld   c,(hl)
053A: 20 50    jr   nz,$058C
053C: 41       ld   b,c
053D: 52       ld   d,d
053E: 4B       ld   c,e
053F: 53       ld   d,e
0540: 21 00 22 ld   hl,$2200
0543: 11 00 23 ld   de,$2300
0546: 06 00    ld   b,$00
0548: CD 42 00 call $0042
054B: 3A 86 20 ld   a,($2086)
054E: EE 20    xor  $20
0550: 32 05 58 ld   ($5805),a
0553: 32 86 20 ld   ($2086),a
0556: CD 2C 09 call $092C
0559: 3E 20    ld   a,$20
055B: 32 A2 20 ld   ($20A2),a
055E: D1       pop  de
055F: 3A 84 22 ld   a,($2284)
0562: E6 03    and  $03
0564: FE 01    cp   $01
0566: CA 77 05 jp   z,$0577
0569: FE 02    cp   $02
056B: CA 77 05 jp   z,$0577
056E: 7B       ld   a,e
056F: FE 80    cp   $80
0571: CA 5B 16 jp   z,$165B
0574: C3 C4 03 jp   $03C4
0577: 3A B4 20 ld   a,($20B4)
057A: A7       and  a
057B: C2 97 05 jp   nz,$0597
057E: 3E 01    ld   a,$01
0580: 32 B4 20 ld   ($20B4),a
0583: EB       ex   de,hl
0584: 22 B5 20 ld   ($20B5),hl
0587: EB       ex   de,hl
0588: 11 30 22 ld   de,$2230
058B: C3 C4 03 jp   $03C4
058E: 7B       ld   a,e
058F: FE 30    cp   $30
0591: C2 C4 03 jp   nz,$03C4
0594: C3 5B 16 jp   $165B
0597: 7B       ld   a,e
0598: FE 80    cp   $80
059A: C2 C4 03 jp   nz,$03C4
059D: AF       xor  a
059E: 32 B4 20 ld   ($20B4),a
05A1: EB       ex   de,hl
05A2: 2A B5 20 ld   hl,($20B5)
05A5: EB       ex   de,hl
05A6: C3 8E 05 jp   $058E
05A9: 3A 84 22 ld   a,($2284)
05AC: E6 03    and  $03
05AE: FE 01    cp   $01
05B0: CA BB 05 jp   z,$05BB
05B3: FE 02    cp   $02
05B5: CA BB 05 jp   z,$05BB
05B8: C3 C1 05 jp   $05C1
05BB: 7B       ld   a,e
05BC: FE 30    cp   $30
05BE: D2 2E 04 jp   nc,$042E
05C1: 3E 78    ld   a,$78
05C3: 3D       dec  a
05C4: FB       ei
05C5: C2 C3 05 jp   nz,$05C3
05C8: C3 2E 04 jp   $042E
05CB: 79       ld   a,c
05CC: FE 40    cp   $40
05CE: DA A9 05 jp   c,$05A9
05D1: E6 38    and  $38
05D3: FE 28    cp   $28
05D5: CA 4F 13 jp   z,$134F
05D8: FE 18    cp   $18
05DA: CA 59 14 jp   z,$1459
05DD: FE 20    cp   $20
05DF: CA 4A 15 jp   z,$154A
05E2: FE 10    cp   $10
05E4: CA 87 15 jp   z,$1587
05E7: D5       push de
05E8: 16 49    ld   d,$49
05EA: 79       ld   a,c
05EB: E6 08    and  $08
05ED: C2 EB 0D jp   nz,$0DEB
05F0: 79       ld   a,c
05F1: 17       rla
05F2: E6 7E    and  $7E
05F4: CD 25 06 call $0625
05F7: 79       ld   a,c
05F8: E6 07    and  $07
05FA: 3D       dec  a
05FB: CA 17 06 jp   z,$0617
05FE: CD 09 06 call $0609
0601: D1       pop  de
0602: AF       xor  a
0603: 32 9F 20 ld   ($209F),a
0606: C3 1A 04 jp   $041A
0609: D5       push de
060A: 16 49    ld   d,$49
060C: 5F       ld   e,a
060D: 79       ld   a,c
060E: E6 F8    and  $F8
0610: B3       or   e
0611: 4F       ld   c,a
0612: E6 3F    and  $3F
0614: C3 76 06 jp   $0676
0617: 0E 00    ld   c,$00
0619: D1       pop  de
061A: C3 1A 04 jp   $041A
061D: 16 48    ld   d,$48
061F: 79       ld   a,c
0620: 17       rla
0621: E6 FE    and  $FE
0623: F6 80    or   $80
0625: 5F       ld   e,a
0626: E5       push hl
0627: C5       push bc
0628: CD 3A 07 call $073A
062B: C1       pop  bc
062C: E1       pop  hl
062D: C9       ret
062E: D5       push de
062F: 78       ld   a,b
0630: FE 80    cp   $80
0632: DA CE 06 jp   c,$06CE
0635: CD E5 06 call $06E5
0638: 85       add  a,l
0639: 6F       ld   l,a
063A: 7C       ld   a,h
063B: CE 00    adc  a,$00
063D: 67       ld   h,a
063E: FE 3E    cp   $3E
0640: C2 47 06 jp   nz,$0647
0643: 78       ld   a,b
0644: E6 7F    and  $7F
0646: 47       ld   b,a
0647: 78       ld   a,b
0648: E6 08    and  $08
064A: CA 83 06 jp   z,$0683
064D: 78       ld   a,b
064E: E6 07    and  $07
0650: 57       ld   d,a
0651: 59       ld   e,c
0652: 7B       ld   a,e
0653: E6 07    and  $07
0655: 82       add  a,d
0656: 5F       ld   e,a
0657: E6 08    and  $08
0659: CA 69 06 jp   z,$0669
065C: 2C       inc  l
065D: 7D       ld   a,l
065E: E6 1F    and  $1F
0660: FE 1A    cp   $1A
0662: C2 69 06 jp   nz,$0669
0665: 78       ld   a,b
0666: E6 F7    and  $F7
0668: 47       ld   b,a
0669: 7B       ld   a,e
066A: E6 07    and  $07
066C: 16 48    ld   d,$48
066E: 5F       ld   e,a
066F: 79       ld   a,c
0670: E6 F8    and  $F8
0672: B3       or   e
0673: 4F       ld   c,a
0674: F6 40    or   $40
0676: 17       rla
0677: E6 FE    and  $FE
0679: 5F       ld   e,a
067A: E5       push hl
067B: C5       push bc
067C: CD F8 06 call $06F8
067F: C1       pop  bc
0680: E1       pop  hl
0681: D1       pop  de
0682: C9       ret
0683: 78       ld   a,b
0684: E6 07    and  $07
0686: 57       ld   d,a
0687: 59       ld   e,c
0688: 7B       ld   a,e
0689: E6 07    and  $07
068B: 92       sub  d
068C: 5F       ld   e,a
068D: A7       and  a
068E: F2 69 06 jp   p,$0669
0691: 2D       dec  l
0692: 79       ld   a,c
0693: E6 38    and  $38
0695: FE 20    cp   $20
0697: CA 69 06 jp   z,$0669
069A: 3A 8E 20 ld   a,($208E)
069D: 57       ld   d,a
069E: 7D       ld   a,l
069F: E6 1F    and  $1F
06A1: BA       cp   d
06A2: CA C7 06 jp   z,$06C7
06A5: 57       ld   d,a
06A6: 3A A2 20 ld   a,($20A2)
06A9: E6 80    and  $80
06AB: 7A       ld   a,d
06AC: C2 BB 06 jp   nz,$06BB
06AF: FE 10    cp   $10
06B1: D2 69 06 jp   nc,$0669
06B4: 78       ld   a,b
06B5: F6 08    or   $08
06B7: 47       ld   b,a
06B8: C3 69 06 jp   $0669
06BB: FE 03    cp   $03
06BD: C2 69 06 jp   nz,$0669
06C0: 78       ld   a,b
06C1: F6 08    or   $08
06C3: 47       ld   b,a
06C4: C3 7F 0D jp   $0D7F
06C7: 78       ld   a,b
06C8: F6 08    or   $08
06CA: 47       ld   b,a
06CB: C3 69 06 jp   $0669
06CE: CD E5 06 call $06E5
06D1: 5F       ld   e,a
06D2: 7D       ld   a,l
06D3: 93       sub  e
06D4: 6F       ld   l,a
06D5: 7C       ld   a,h
06D6: DE 00    sbc  a,$00
06D8: FE 26    cp   $26
06DA: 67       ld   h,a
06DB: C2 47 06 jp   nz,$0647
06DE: 78       ld   a,b
06DF: F6 80    or   $80
06E1: 47       ld   b,a
06E2: C3 47 06 jp   $0647
06E5: 3A 84 22 ld   a,($2284)
06E8: E6 03    and  $03
06EA: FE 01    cp   $01
06EC: C2 F4 06 jp   nz,$06F4
06EF: 78       ld   a,b
06F0: 17       rla
06F1: E6 C0    and  $C0
06F3: C9       ret
06F4: 78       ld   a,b
06F5: E6 60    and  $60
06F7: C9       ret
06F8: E5       push hl
06F9: EB       ex   de,hl
06FA: 5E       ld   e,(hl)
06FB: 23       inc  hl
06FC: 56       ld   d,(hl)
06FD: E1       pop  hl
06FE: 7D       ld   a,l
06FF: D6 20    sub  $20
0701: 4F       ld   c,a
0702: 7C       ld   a,h
0703: DE 00    sbc  a,$00
0705: 47       ld   b,a
0706: E5       push hl
0707: C5       push bc
0708: 1A       ld   a,(de)
0709: B6       or   (hl)
070A: 77       ld   (hl),a
070B: 13       inc  de
070C: D5       push de
070D: 1A       ld   a,(de)
070E: 5F       ld   e,a
070F: 0A       ld   a,(bc)
0710: B3       or   e
0711: 02       ld   (bc),a
0712: D1       pop  de
0713: 03       inc  bc
0714: 13       inc  de
0715: 23       inc  hl
0716: 1A       ld   a,(de)
0717: FE AA    cp   $AA
0719: C2 09 07 jp   nz,$0709
071C: C1       pop  bc
071D: E1       pop  hl
071E: CD 27 07 call $0727
0721: FE AA    cp   $AA
0723: C2 06 07 jp   nz,$0706
0726: C9       ret
0727: 13       inc  de
0728: 7D       ld   a,l
0729: C6 20    add  a,$20
072B: 6F       ld   l,a
072C: 7C       ld   a,h
072D: CE 00    adc  a,$00
072F: 67       ld   h,a
0730: 79       ld   a,c
0731: D6 20    sub  $20
0733: 4F       ld   c,a
0734: 78       ld   a,b
0735: DE 00    sbc  a,$00
0737: 47       ld   b,a
0738: 1A       ld   a,(de)
0739: C9       ret
073A: E5       push hl
073B: EB       ex   de,hl
073C: 5E       ld   e,(hl)
073D: 23       inc  hl
073E: 56       ld   d,(hl)
073F: E1       pop  hl
0740: 7D       ld   a,l
0741: D6 20    sub  $20
0743: 4F       ld   c,a
0744: 7C       ld   a,h
0745: DE 00    sbc  a,$00
0747: 47       ld   b,a
0748: E5       push hl
0749: C5       push bc
074A: 1A       ld   a,(de)
074B: 2F       cpl
074C: A6       and  (hl)
074D: 77       ld   (hl),a
074E: 13       inc  de
074F: D5       push de
0750: 1A       ld   a,(de)
0751: 2F       cpl
0752: 5F       ld   e,a
0753: 0A       ld   a,(bc)
0754: A3       and  e
0755: 02       ld   (bc),a
0756: B6       or   (hl)
0757: D1       pop  de
0758: A7       and  a
0759: CA 5F 07 jp   z,$075F
075C: 32 85 20 ld   ($2085),a
075F: 03       inc  bc
0760: 13       inc  de
0761: 23       inc  hl
0762: 1A       ld   a,(de)
0763: FE AA    cp   $AA
0765: C2 4B 07 jp   nz,$074B
0768: C1       pop  bc
0769: E1       pop  hl
076A: CD 27 07 call $0727
076D: FE AA    cp   $AA
076F: C2 48 07 jp   nz,$0748
0772: C9       ret
0773: 11 81 20 ld   de,$2081
0776: 2A 87 20 ld   hl,($2087)
0779: 3A 00 20 ld   a,($2000)
077C: E6 04    and  $04
077E: CA 9B 07 jp   z,$079B
0781: 3A 86 20 ld   a,($2086)
0784: A7       and  a
0785: C2 9B 07 jp   nz,$079B
0788: 1A       ld   a,(de)
0789: A7       and  a
078A: C2 94 07 jp   nz,$0794
078D: 7C       ld   a,h
078E: FE 33    cp   $33
0790: D2 AE 07 jp   nc,$07AE
0793: C9       ret
0794: 7C       ld   a,h
0795: FE 33    cp   $33
0797: DA AE 07 jp   c,$07AE
079A: C9       ret
079B: 1A       ld   a,(de)
079C: A7       and  a
079D: CA A7 07 jp   z,$07A7
07A0: 7C       ld   a,h
07A1: FE 31    cp   $31
07A3: D2 AE 07 jp   nc,$07AE
07A6: C9       ret
07A7: 7C       ld   a,h
07A8: FE 31    cp   $31
07AA: DA AE 07 jp   c,$07AE
07AD: C9       ret
07AE: 3A A2 20 ld   a,($20A2)
07B1: E6 C0    and  $C0
07B3: FE C0    cp   $C0
07B5: CA 77 08 jp   z,$0877
07B8: FE 40    cp   $40
07BA: CA 0F 0E jp   z,$0E0F
07BD: 3A B2 20 ld   a,($20B2)
07C0: E6 80    and  $80
07C2: CA CA 0F jp   z,$0FCA
07C5: 3A A5 20 ld   a,($20A5)
07C8: A7       and  a
07C9: CA 13 08 jp   z,$0813
07CC: 3D       dec  a
07CD: 32 A5 20 ld   ($20A5),a
07D0: C2 0D 08 jp   nz,$080D
07D3: 3A B2 20 ld   a,($20B2)
07D6: E6 40    and  $40
07D8: CA F9 07 jp   z,$07F9
07DB: 3A D9 20 ld   a,($20D9)
07DE: A7       and  a
07DF: CA F9 07 jp   z,$07F9
07E2: 3A 02 50 ld   a,($5002)
07E5: FE AA    cp   $AA
07E7: CA F2 07 jp   z,$07F2
07EA: 3E 01    ld   a,$01
07EC: 32 A5 20 ld   ($20A5),a
07EF: C3 0D 08 jp   $080D
07F2: AF       xor  a
07F3: 32 D8 20 ld   ($20D8),a
07F6: 32 D9 20 ld   ($20D9),a
07F9: 3E 0D    ld   a,$0D
07FB: CD 1D 01 call $011D
07FE: 21 89 27 ld   hl,$2789
0801: 11 1F 00 ld   de,$001F
0804: 01 A8 01 ld   bc,$01A8
0807: CD 89 11 call $1189
080A: C3 31 0C jp   $0C31
080D: CD 61 11 call $1161
0810: C3 31 0C jp   $0C31
0813: 3A 82 22 ld   a,($2282)
0816: 3D       dec  a
0817: FA 2C 08 jp   m,$082C
081A: 2A 80 22 ld   hl,($2280)
081D: 36 FF    ld   (hl),$FF
081F: 11 20 00 ld   de,$0020
0822: 19       add  hl,de
0823: 22 80 22 ld   ($2280),hl
0826: 32 82 22 ld   ($2282),a
0829: C3 31 0C jp   $0C31
082C: 3A 7C 22 ld   a,($227C)
082F: E6 C0    and  $C0
0831: C2 31 0C jp   nz,$0C31
0834: 3A 83 22 ld   a,($2283)
0837: A7       and  a
0838: CA 31 0C jp   z,$0C31
083B: 3D       dec  a
083C: 32 83 22 ld   ($2283),a
083F: 2A 80 22 ld   hl,($2280)
0842: 7C       ld   a,h
0843: D6 25    sub  $25
0845: 17       rla
0846: 17       rla
0847: 17       rla
0848: E6 78    and  $78
084A: 67       ld   h,a
084B: 7D       ld   a,l
084C: 07       rlca
084D: 07       rlca
084E: 07       rlca
084F: E6 07    and  $07
0851: 84       add  a,h
0852: 32 82 22 ld   ($2282),a
0855: AF       xor  a
0856: 32 A3 20 ld   ($20A3),a
0859: 32 86 22 ld   ($2286),a
085C: 3E C0    ld   a,$C0
085E: 32 A2 20 ld   ($20A2),a
0861: 21 03 32 ld   hl,$3203
0864: 22 87 20 ld   ($2087),hl
0867: CD 6A 09 call $096A
086A: 3A 84 22 ld   a,($2284)
086D: 2F       cpl
086E: E6 03    and  $03
0870: 3C       inc  a
0871: CD 1D 01 call $011D
0874: C3 31 0C jp   $0C31
0877: CD 4D 0D call $0D4D
087A: CD 3A 07 call $073A
087D: CD 76 0D call $0D76
0880: CD 3A 07 call $073A
0883: CD 6D 0D call $0D6D
0886: E5       push hl
0887: AF       xor  a
0888: 32 85 20 ld   ($2085),a
088B: CD 3A 07 call $073A
088E: 3A 85 20 ld   a,($2085)
0891: A7       and  a
0892: CA B4 08 jp   z,$08B4
0895: 3A 84 22 ld   a,($2284)
0898: E6 03    and  $03
089A: FE 03    cp   $03
089C: C2 A7 08 jp   nz,$08A7
089F: 3A 5C 22 ld   a,($225C)
08A2: E6 80    and  $80
08A4: CA D7 15 jp   z,$15D7
08A7: AF       xor  a
08A8: CD 1D 01 call $011D
08AB: 3E 40    ld   a,$40
08AD: 32 A2 20 ld   ($20A2),a
08B0: E1       pop  hl
08B1: C3 31 0C jp   $0C31
08B4: E1       pop  hl
08B5: CD A3 0B call $0BA3
08B8: 07       rlca
08B9: 07       rlca
08BA: DA 12 09 jp   c,$0912
08BD: 07       rlca
08BE: DA 1F 09 jp   c,$091F
08C1: 22 87 20 ld   ($2087),hl
08C4: CD E3 0C call $0CE3
08C7: 3A A3 20 ld   a,($20A3)
08CA: E6 10    and  $10
08CC: CA D5 08 jp   z,$08D5
08CF: CD 4D 0D call $0D4D
08D2: CD F8 06 call $06F8
08D5: CD 6D 0D call $0D6D
08D8: CD F8 06 call $06F8
08DB: CD BD 09 call $09BD
08DE: 3A 8F 20 ld   a,($208F)
08E1: E6 7E    and  $7E
08E3: C2 31 0C jp   nz,$0C31
08E6: 3A A7 20 ld   a,($20A7)
08E9: D6 08    sub  $08
08EB: 32 A7 20 ld   ($20A7),a
08EE: F2 31 0C jp   p,$0C31
08F1: 3E 20    ld   a,$20
08F3: 32 A7 20 ld   ($20A7),a
08F6: 2A 80 22 ld   hl,($2280)
08F9: 36 C3    ld   (hl),$C3
08FB: 11 E0 FF ld   de,$FFE0
08FE: 19       add  hl,de
08FF: 22 80 22 ld   ($2280),hl
0902: 3A 82 22 ld   a,($2282)
0905: 3D       dec  a
0906: 32 82 22 ld   ($2282),a
0909: CC 4D 11 call z,$114D
090C: FC 4D 11 call m,$114D
090F: C3 31 0C jp   $0C31
0912: 7C       ld   a,h
0913: FE 3D    cp   $3D
0915: CA C1 08 jp   z,$08C1
0918: 01 20 00 ld   bc,$0020
091B: 09       add  hl,bc
091C: C3 C1 08 jp   $08C1
091F: 7C       ld   a,h
0920: FE 26    cp   $26
0922: CA C1 08 jp   z,$08C1
0925: 01 E0 FF ld   bc,$FFE0
0928: 09       add  hl,bc
0929: C3 C1 08 jp   $08C1
;--------------------------------
092C: 21 00 24 ld   hl,$2400
092F: 3E 02    ld   a,$02
0931: 32 87 20 ld   ($2087),a
0934: 36 00    ld   (hl),$00
0936: 23       inc  hl
0937: 7C       ld   a,h
0938: FE 40    cp   $40
093A: C2 34 09 jp   nz,$0934 ;stops here
093D: 21 01 25 ld   hl,$2501
0940: 22 80 22 ld   ($2280),hl
0943: 22 80 23 ld   ($2380),hl
0946: 11 20 00 ld   de,$0020
0949: 3E 02    ld   a,$02
094B: 36 FF    ld   (hl),$FF
094D: 19       add  hl,de
094E: 36 C3    ld   (hl),$C3
0950: 3C       inc  a
0951: F2 4D 09 jp   p,$094D
0954: 3A 41 19 ld   a,($1941)
0957: FE 23    cp   $23
0959: C2 12 01 jp   nz,$0112
095C: 3E FF    ld   a,$FF
095E: 32 C4 20 ld   ($20C4),a
0961: 21 9C 30 ld   hl,$309C
0964: 11 C1 20 ld   de,$20C1
0967: CD B1 0E call $0EB1
096A: 21 83 22 ld   hl,$2283
096D: CD 08 11 call $1108
0970: 21 1C 25 ld   hl,$251C
0973: CD B1 0E call $0EB1
0976: 21 83 23 ld   hl,$2383
0979: CD 08 11 call $1108
097C: 21 1C 39 ld   hl,$391C
097F: CD B1 0E call $0EB1
0982: CD 16 0F call $0F16
0985: 11 E4 4D ld   de,$4DE4
0988: 21 1E 25 ld   hl,$251E
098B: CD B1 0E call $0EB1
098E: 11 A9 20 ld   de,$20A9
0991: 21 1D 25 ld   hl,$251D
0994: 06 06    ld   b,$06
0996: CD DE 0E call $0EDE
0999: 11 AF 20 ld   de,$20AF
099C: 21 1D 2F ld   hl,$2F1D
099F: 06 06    ld   b,$06
09A1: CD DE 0E call $0EDE
09A4: 11 AC 20 ld   de,$20AC
09A7: 21 1D 39 ld   hl,$391D
09AA: 06 06    ld   b,$06
09AC: CD DE 0E call $0EDE
09AF: C9       ret
;-----------------------------------
09B0: 3E 01    ld   a,$01
09B2: 32 A3 20 ld   ($20A3),a
09B5: 3E 0B    ld   a,$0B
09B7: CD 1D 01 call $011D
09BA: C3 FB 09 jp   $09FB
09BD: 3A A4 20 ld   a,($20A4)
09C0: FE FF    cp   $FF
09C2: CA D3 09 jp   z,$09D3
09C5: 5F       ld   e,a
09C6: 16 22    ld   d,$22
09C8: 3E FF    ld   a,$FF
09CA: 32 A4 20 ld   ($20A4),a
09CD: E5       push hl
09CE: D5       push de
09CF: C5       push bc
09D0: C3 1A 0B jp   $0B1A
09D3: 3A B8 20 ld   a,($20B8)
09D6: A7       and  a
09D7: C2 79 0A jp   nz,$0A79
09DA: CD A3 0B call $0BA3
09DD: 32 E2 20 ld   ($20E2),a
09E0: E6 08    and  $08
09E2: CA B0 09 jp   z,$09B0
09E5: 3E 10    ld   a,$10
09E7: 32 A3 20 ld   ($20A3),a
09EA: 3A D0 20 ld   a,($20D0)
09ED: A7       and  a
09EE: C2 FB 09 jp   nz,$09FB
09F1: 3E 01    ld   a,$01
09F3: 32 D0 20 ld   ($20D0),a
09F6: 3E 0A    ld   a,$0A
09F8: CD 1D 01 call $011D
09FB: 3A E2 20 ld   a,($20E2)
09FE: E6 10    and  $10
0A00: CA 7E 0A jp   z,$0A7E
0A03: 3A A7 20 ld   a,($20A7)
0A06: A7       and  a
0A07: F2 33 0A jp   p,$0A33
0A0A: 3E 20    ld   a,$20
0A0C: 32 A7 20 ld   ($20A7),a
0A0F: 2A 80 22 ld   hl,($2280)
0A12: 36 C3    ld   (hl),$C3
0A14: 11 40 19 ld   de,$1940
0A17: 3A 3F 11 ld   a,($113F)
0A1A: 3C       inc  a
0A1B: BB       cp   e
0A1C: C2 1A 04 jp   nz,$041A
0A1F: 11 E0 FF ld   de,$FFE0
0A22: 19       add  hl,de
0A23: 22 80 22 ld   ($2280),hl
0A26: 3A 82 22 ld   a,($2282)
0A29: 3D       dec  a
0A2A: 32 82 22 ld   ($2282),a
0A2D: CC 4D 11 call z,$114D
0A30: FC 4D 11 call m,$114D
0A33: 3A 89 20 ld   a,($2089)
0A36: A7       and  a
0A37: CA 83 0A jp   z,$0A83
0A3A: 3A A7 20 ld   a,($20A7)
0A3D: D6 11    sub  $11
0A3F: 32 A7 20 ld   ($20A7),a
0A42: AF       xor  a
0A43: 32 89 20 ld   ($2089),a
0A46: 2A 8B 20 ld   hl,($208B)
0A49: CD 73 0A call $0A73
0A4C: 2A 87 20 ld   hl,($2087)
0A4F: 23       inc  hl
0A50: 23       inc  hl
0A51: 23       inc  hl
0A52: 22 8B 20 ld   ($208B),hl
0A55: 3E 80    ld   a,$80
0A57: 32 8A 20 ld   ($208A),a
0A5A: CD 63 0A call $0A63
0A5D: 3E 0C    ld   a,$0C
0A5F: CD 1D 01 call $011D
0A62: C9       ret
0A63: CD B0 0A call $0AB0
0A66: 3A 8A 20 ld   a,($208A)
0A69: E6 03    and  $03
0A6B: F6 F8    or   $F8
0A6D: 5F       ld   e,a
0A6E: 16 4F    ld   d,$4F
0A70: 1A       ld   a,(de)
0A71: 77       ld   (hl),a
0A72: C9       ret
0A73: CD B6 0A call $0AB6
0A76: AF       xor  a
0A77: 77       ld   (hl),a
0A78: C9       ret
0A79: 3E 01    ld   a,$01
0A7B: 32 A3 20 ld   ($20A3),a
0A7E: 3E 01    ld   a,$01
0A80: 32 89 20 ld   ($2089),a
0A83: 3A 8A 20 ld   a,($208A)
0A86: FE 80    cp   $80
0A88: D8       ret  c
0A89: 2A 8B 20 ld   hl,($208B)
0A8C: CD 73 0A call $0A73
0A8F: 2A 8B 20 ld   hl,($208B)
0A92: 7D       ld   a,l
0A93: E6 1F    and  $1F
0A95: FE 1A    cp   $1A
0A97: D2 91 0B jp   nc,$0B91
0A9A: 3A 8A 20 ld   a,($208A)
0A9D: 3C       inc  a
0A9E: E6 81    and  $81
0AA0: 32 8A 20 ld   ($208A),a
0AA3: E6 01    and  $01
0AA5: C2 AC 0A jp   nz,$0AAC
0AA8: 23       inc  hl
0AA9: 22 8B 20 ld   ($208B),hl
0AAC: CD 63 0A call $0A63
0AAF: C9       ret
0AB0: 7E       ld   a,(hl)
0AB1: A7       and  a
0AB2: C8       ret  z
0AB3: C3 BD 0A jp   $0ABD
0AB6: 7E       ld   a,(hl)
0AB7: FE 0F    cp   $0F
0AB9: C8       ret  z
0ABA: FE F0    cp   $F0
0ABC: C8       ret  z
0ABD: E5       push hl
0ABE: D5       push de
0ABF: C5       push bc
0AC0: 2D       dec  l
0AC1: 7D       ld   a,l
0AC2: E6 1F    and  $1F
0AC4: 6F       ld   l,a
0AC5: 06 02    ld   b,$02
0AC7: 3A 84 22 ld   a,($2284)
0ACA: E6 03    and  $03
0ACC: FE 03    cp   $03
0ACE: CA C0 14 jp   z,$14C0
0AD1: 0E 03    ld   c,$03
0AD3: 11 00 22 ld   de,$2200
0AD6: 1A       ld   a,(de)
0AD7: E6 80    and  $80
0AD9: CA E7 0A jp   z,$0AE7
0ADC: 13       inc  de
0ADD: 13       inc  de
0ADE: 1A       ld   a,(de)
0ADF: E6 1F    and  $1F
0AE1: BD       cp   l
0AE2: CA 10 0B jp   z,$0B10
0AE5: 1B       dec  de
0AE6: 1B       dec  de
0AE7: 13       inc  de
0AE8: 13       inc  de
0AE9: 13       inc  de
0AEA: 13       inc  de
0AEB: 7B       ld   a,e
0AEC: FE 80    cp   $80
0AEE: C2 D6 0A jp   nz,$0AD6
0AF1: 0D       dec  c
0AF2: 79       ld   a,c
0AF3: FE 02    cp   $02
0AF5: CA 07 0B jp   z,$0B07
0AF8: FE 01    cp   $01
0AFA: CA 0B 0B jp   z,$0B0B
0AFD: 25       dec  h
0AFE: 2C       inc  l
0AFF: 05       dec  b
0B00: C2 C7 0A jp   nz,$0AC7
0B03: C1       pop  bc
0B04: D1       pop  de
0B05: E1       pop  hl
0B06: C9       ret
0B07: 25       dec  h
0B08: C3 D3 0A jp   $0AD3
0B0B: 24       inc  h
0B0C: 24       inc  h
0B0D: C3 D3 0A jp   $0AD3
0B10: 13       inc  de
0B11: 1A       ld   a,(de)
0B12: BC       cp   h
0B13: C2 EA 0A jp   nz,$0AEA
0B16: 7B       ld   a,e
0B17: 32 A4 20 ld   ($20A4),a
0B1A: 1A       ld   a,(de)
0B1B: 67       ld   h,a
0B1C: 1B       dec  de
0B1D: 1A       ld   a,(de)
0B1E: 6F       ld   l,a
0B1F: 1B       dec  de
0B20: 1B       dec  de
0B21: 1A       ld   a,(de)
0B22: 4F       ld   c,a
0B23: D5       push de
0B24: CD 1D 06 call $061D
0B27: D1       pop  de
0B28: 1A       ld   a,(de)
0B29: 47       ld   b,a
0B2A: FE 80    cp   $80
0B2C: DA 8F 0B jp   c,$0B8F
0B2F: E6 F8    and  $F8
0B31: FE E0    cp   $E0
0B33: CA 8F 0B jp   z,$0B8F
0B36: E6 38    and  $38
0B38: FE 30    cp   $30
0B3A: CA ED 13 jp   z,$13ED
0B3D: FE 10    cp   $10
0B3F: C2 76 0B jp   nz,$0B76
0B42: 3E FF    ld   a,$FF
0B44: 32 A4 20 ld   ($20A4),a
0B47: D5       push de
0B48: 3E 30    ld   a,$30
0B4A: 83       add  a,e
0B4B: 5F       ld   e,a
0B4C: 3E E0    ld   a,$E0
0B4E: 12       ld   (de),a
0B4F: 13       inc  de
0B50: 3E 03    ld   a,$03
0B52: 12       ld   (de),a
0B53: 3A 00 20 ld   a,($2000)
0B56: E6 10    and  $10
0B58: CA 5E 0B jp   z,$0B5E
0B5B: 3E 07    ld   a,$07
0B5D: 12       ld   (de),a
0B5E: 13       inc  de
0B5F: 7D       ld   a,l
0B60: 12       ld   (de),a
0B61: 13       inc  de
0B62: 7C       ld   a,h
0B63: 12       ld   (de),a
0B64: D1       pop  de
0B65: 13       inc  de
0B66: 1A       ld   a,(de)
0B67: F6 67    or   $67
0B69: 12       ld   (de),a
0B6A: 1B       dec  de
0B6B: 3E 08    ld   a,$08
0B6D: CD 1D 01 call $011D
0B70: 78       ld   a,b
0B71: F6 88    or   $88
0B73: C3 7D 0B jp   $0B7D
0B76: 3E 06    ld   a,$06
0B78: CD 1D 01 call $011D
0B7B: 3E 47    ld   a,$47
0B7D: 12       ld   (de),a
0B7E: 78       ld   a,b
0B7F: 1F       rra
0B80: E6 1C    and  $1C
0B82: 5F       ld   e,a
0B83: 16 00    ld   d,$00
0B85: 21 48 0F ld   hl,$0F48
0B88: E5       push hl
0B89: 21 28 0F ld   hl,$0F28
0B8C: 19       add  hl,de
0B8D: E5       push hl
0B8E: C9       ret
0B8F: C1       pop  bc
0B90: D1       pop  de
0B91: 3E 02    ld   a,$02
0B93: 32 8A 20 ld   ($208A),a
0B96: 2A 8B 20 ld   hl,($208B)
0B99: 36 00    ld   (hl),$00
0B9B: 21 00 00 ld   hl,$0000
0B9E: 22 8B 20 ld   ($208B),hl
0BA1: E1       pop  hl
0BA2: C9       ret
0BA3: 3A B2 20 ld   a,($20B2)
0BA6: E6 40    and  $40
0BA8: CA BB 0B jp   z,$0BBB
0BAB: 3E 19    ld   a,$19
0BAD: CD 1D 01 call $011D
0BB0: 3A 86 20 ld   a,($2086)
0BB3: A7       and  a
0BB4: C2 F5 0B jp   nz,$0BF5
0BB7: 3A 01 58 ld   a,($5801)	;IN0 read
0BBA: C9       ret
0BBB: 3A C6 20 ld   a,($20C6)
0BBE: 3C       inc  a
0BBF: 32 C6 20 ld   ($20C6),a
0BC2: E6 07    and  $07
0BC4: C2 F1 0B jp   nz,$0BF1
0BC7: 3A 71 20 ld   a,($2071)
0BCA: E6 78    and  $78
0BCC: EE 08    xor  $08
0BCE: CA F1 0B jp   z,$0BF1
0BD1: 32 C7 20 ld   ($20C7),a
0BD4: C5       push bc
0BD5: E5       push hl
0BD6: 06 04    ld   b,$04
0BD8: 21 92 20 ld   hl,$2092
0BDB: 7E       ld   a,(hl)
0BDC: E6 FE    and  $FE
0BDE: 4F       ld   c,a
0BDF: 3A 88 20 ld   a,($2088)
0BE2: E6 FE    and  $FE
0BE4: B9       cp   c
0BE5: CA F9 0B jp   z,$0BF9
0BE8: 23       inc  hl
0BE9: 23       inc  hl
0BEA: 23       inc  hl
0BEB: 05       dec  b
0BEC: C2 DB 0B jp   nz,$0BDB
0BEF: E1       pop  hl
0BF0: C1       pop  bc
0BF1: 3A C7 20 ld   a,($20C7)
0BF4: C9       ret
0BF5: 3A 02 58 ld   a,($5802)
0BF8: C9       ret
0BF9: 4E       ld   c,(hl)
0BFA: 3A 88 20 ld   a,($2088)
0BFD: B9       cp   c
0BFE: DA 09 0C jp   c,$0C09
0C01: 3E 50    ld   a,$50
0C03: 32 C7 20 ld   ($20C7),a
0C06: C3 EF 0B jp   $0BEF
0C09: 3E 30    ld   a,$30
0C0B: C3 03 0C jp   $0C03
0C0E: 3A A1 20 ld   a,($20A1)
0C11: E6 03    and  $03
0C13: C3 62 0C jp   $0C62
0C16: 3A 84 22 ld   a,($2284)
0C19: E6 03    and  $03
0C1B: FE 03    cp   $03
0C1D: CA 0E 0C jp   z,$0C0E
0C20: 3A 84 22 ld   a,($2284)
0C23: FE 08    cp   $08
0C25: D2 5D 0C jp   nc,$0C5D
0C28: 3A A1 20 ld   a,($20A1)
0C2B: E6 03    and  $03
0C2D: C0       ret  nz
0C2E: C3 63 0C jp   $0C63
0C31: 11 90 20 ld   de,$2090
0C34: 3A A1 20 ld   a,($20A1)
0C37: 3C       inc  a
0C38: 32 A1 20 ld   ($20A1),a
0C3B: 3A 00 20 ld   a,($2000)
0C3E: E6 10    and  $10
0C40: CA 16 0C jp   z,$0C16
0C43: 3A 84 22 ld   a,($2284)
0C46: E6 03    and  $03
0C48: FE 03    cp   $03
0C4A: CA 63 0C jp   z,$0C63
0C4D: 3A 84 22 ld   a,($2284)
0C50: FE 08    cp   $08
0C52: D2 0E 0C jp   nc,$0C0E
0C55: 3A 00 20 ld   a,($2000)
0C58: E6 20    and  $20
0C5A: CA 0E 0C jp   z,$0C0E
0C5D: 3A A1 20 ld   a,($20A1)
0C60: E6 01    and  $01
0C62: C8       ret  z
0C63: AF       xor  a
0C64: 32 9D 20 ld   ($209D),a
0C67: 1A       ld   a,(de)
0C68: 4F       ld   c,a
0C69: E6 80    and  $80
0C6B: CA BD 0C jp   z,$0CBD
0C6E: 13       inc  de
0C6F: 1A       ld   a,(de)
0C70: 6F       ld   l,a
0C71: 13       inc  de
0C72: 1A       ld   a,(de)
0C73: 67       ld   h,a
0C74: AF       xor  a
0C75: 77       ld   (hl),a
0C76: 3A A2 20 ld   a,($20A2)
0C79: E6 80    and  $80
0C7B: CA A3 0C jp   z,$0CA3
0C7E: 79       ld   a,c
0C7F: 3C       inc  a
0C80: E6 81    and  $81
0C82: 4F       ld   c,a
0C83: E6 01    and  $01
0C85: CA 92 0C jp   z,$0C92
0C88: 2C       inc  l
0C89: 36 00    ld   (hl),$00
0C8B: 2D       dec  l
0C8C: 3E 0F    ld   a,$0F
0C8E: 77       ld   (hl),a
0C8F: C3 A3 0C jp   $0CA3
0C92: 2D       dec  l
0C93: 7D       ld   a,l
0C94: E6 1F    and  $1F
0C96: FE 02    cp   $02
0C98: C2 A0 0C jp   nz,$0CA0
0C9B: 0E 00    ld   c,$00
0C9D: C3 A3 0C jp   $0CA3
0CA0: 3E F0    ld   a,$F0
0CA2: 77       ld   (hl),a
0CA3: 7C       ld   a,h
0CA4: 12       ld   (de),a
0CA5: 1B       dec  de
0CA6: 7D       ld   a,l
0CA7: 12       ld   (de),a
0CA8: 1B       dec  de
0CA9: 3A A2 20 ld   a,($20A2)
0CAC: E6 80    and  $80
0CAE: CA B2 0C jp   z,$0CB2
0CB1: 79       ld   a,c
0CB2: 12       ld   (de),a
0CB3: 13       inc  de
0CB4: 13       inc  de
0CB5: 13       inc  de
0CB6: 7B       ld   a,e
0CB7: FE 9C    cp   $9C
0CB9: C8       ret  z
0CBA: C3 67 0C jp   $0C67
0CBD: 3A A2 20 ld   a,($20A2)
0CC0: E6 80    and  $80
0CC2: CA B3 0C jp   z,$0CB3
0CC5: 3A 9D 20 ld   a,($209D)
0CC8: A7       and  a
0CC9: C2 B3 0C jp   nz,$0CB3
0CCC: 2A 9E 20 ld   hl,($209E)
0CCF: 7D       ld   a,l
0CD0: E6 1F    and  $1F
0CD2: FE 08    cp   $08
0CD4: DA B3 0C jp   c,$0CB3
0CD7: 3E 01    ld   a,$01
0CD9: 32 9D 20 ld   ($209D),a
0CDC: 0E 80    ld   c,$80
0CDE: 13       inc  de
0CDF: 13       inc  de
0CE0: C3 92 0C jp   $0C92
0CE3: 3A A3 20 ld   a,($20A3)
0CE6: FE 10    cp   $10
0CE8: DA 15 0D jp   c,$0D15
0CEB: 3E 10    ld   a,$10
0CED: 32 A3 20 ld   ($20A3),a
0CF0: 3A A7 20 ld   a,($20A7)
0CF3: 3D       dec  a
0CF4: 32 A7 20 ld   ($20A7),a
0CF7: 2A 87 20 ld   hl,($2087)
0CFA: 7D       ld   a,l
0CFB: E6 1F    and  $1F
0CFD: FE 19    cp   $19
0CFF: D2 28 0D jp   nc,$0D28
0D02: 3A A2 20 ld   a,($20A2)
0D05: 3C       inc  a
0D06: E6 C7    and  $C7
0D08: 32 A2 20 ld   ($20A2),a
0D0B: E6 07    and  $07
0D0D: C2 11 0D jp   nz,$0D11
0D10: 23       inc  hl
0D11: 22 87 20 ld   ($2087),hl
0D14: C9       ret
0D15: 3A D0 20 ld   a,($20D0)
0D18: A7       and  a
0D19: CA 2B 0D jp   z,$0D2B
0D1C: 3E 0B    ld   a,$0B
0D1E: CD 1D 01 call $011D
0D21: AF       xor  a
0D22: 32 D0 20 ld   ($20D0),a
0D25: C3 2B 0D jp   $0D2B
0D28: 32 A3 20 ld   ($20A3),a
0D2B: 2A 87 20 ld   hl,($2087)
0D2E: 7D       ld   a,l
0D2F: E6 1F    and  $1F
0D31: FE 03    cp   $03
0D33: DA 49 0D jp   c,$0D49
0D36: 3A A2 20 ld   a,($20A2)
0D39: F6 08    or   $08
0D3B: 3D       dec  a
0D3C: E6 C7    and  $C7
0D3E: 32 A2 20 ld   ($20A2),a
0D41: E6 07    and  $07
0D43: FE 07    cp   $07
0D45: C2 49 0D jp   nz,$0D49
0D48: 2B       dec  hl
0D49: 22 87 20 ld   ($2087),hl
0D4C: C9       ret
0D4D: 2A 87 20 ld   hl,($2087)
0D50: 2B       dec  hl
0D51: 11 30 49 ld   de,$4930
0D54: 3A A2 20 ld   a,($20A2)
0D57: 17       rla
0D58: E6 0E    and  $0E
0D5A: B3       or   e
0D5B: 5F       ld   e,a
0D5C: 3A B8 20 ld   a,($20B8)
0D5F: A7       and  a
0D60: C8       ret  z
0D61: 2A 5E 22 ld   hl,($225E)
0D64: 2D       dec  l
0D65: 2D       dec  l
0D66: 22 87 20 ld   ($2087),hl
0D69: 11 10 49 ld   de,$4910
0D6C: C9       ret
0D6D: 2A 87 20 ld   hl,($2087)
0D70: 11 10 49 ld   de,$4910
0D73: C3 54 0D jp   $0D54
0D76: 2A 87 20 ld   hl,($2087)
0D79: 11 20 49 ld   de,$4920
0D7C: C3 54 0D jp   $0D54
0D7F: 3A 7C 22 ld   a,($227C)
0D82: E6 C0    and  $C0
0D84: C2 69 06 jp   nz,$0669
0D87: 3E C8    ld   a,$C8
0D89: 32 7C 22 ld   ($227C),a
0D8C: 3E 04    ld   a,$04
0D8E: 32 7D 22 ld   ($227D),a
0D91: 22 7E 22 ld   ($227E),hl
0D94: C3 69 06 jp   $0669
0D97: D5       push de
0D98: CD 1D 06 call $061D
0D9B: 0C       inc  c
0D9C: 79       ld   a,c
0D9D: E6 07    and  $07
0D9F: C2 B1 0D jp   nz,$0DB1
0DA2: 05       dec  b
0DA3: C2 B1 0D jp   nz,$0DB1
0DA6: 0E 48    ld   c,$48
0DA8: 3E 05    ld   a,$05
0DAA: CD 1D 01 call $011D
0DAD: D1       pop  de
0DAE: C3 1A 04 jp   $041A
0DB1: 79       ld   a,c
0DB2: E6 07    and  $07
0DB4: F6 C8    or   $C8
0DB6: 4F       ld   c,a
0DB7: 17       rla
0DB8: E6 1E    and  $1E
0DBA: F6 80    or   $80
0DBC: 5F       ld   e,a
0DBD: 16 48    ld   d,$48
0DBF: E5       push hl
0DC0: C5       push bc
0DC1: CD F8 06 call $06F8
0DC4: C1       pop  bc
0DC5: E1       pop  hl
0DC6: D1       pop  de
0DC7: C3 1A 04 jp   $041A
0DCA: F5       push af
0DCB: C5       push bc
0DCC: E5       push hl
0DCD: E6 07    and  $07
0DCF: FE 04    cp   $04
0DD1: D2 E0 0D jp   nc,$0DE0
0DD4: 17       rla
0DD5: E6 0E    and  $0E
0DD7: B3       or   e
0DD8: 5F       ld   e,a
0DD9: CD F8 06 call $06F8
0DDC: E1       pop  hl
0DDD: C1       pop  bc
0DDE: F1       pop  af
0DDF: C9       ret
0DE0: 17       rla
0DE1: E6 0E    and  $0E
0DE3: B3       or   e
0DE4: 5F       ld   e,a
0DE5: CD 3A 07 call $073A
0DE8: C3 DC 0D jp   $0DDC
0DEB: 11 E0 4A ld   de,$4AE0
0DEE: 79       ld   a,c
0DEF: 3C       inc  a
0DF0: E6 07    and  $07
0DF2: CA 0A 0E jp   z,$0E0A
0DF5: CD CA 0D call $0DCA
0DF8: 5F       ld   e,a
0DF9: 79       ld   a,c
0DFA: E6 F8    and  $F8
0DFC: B3       or   e
0DFD: 4F       ld   c,a
0DFE: D1       pop  de
0DFF: E5       push hl
0E00: 21 00 00 ld   hl,$0000
0E03: 22 9E 20 ld   ($209E),hl
0E06: E1       pop  hl
0E07: C3 1A 04 jp   $041A
0E0A: 0E 00    ld   c,$00
0E0C: C3 FE 0D jp   $0DFE
0E0F: 2A 8B 20 ld   hl,($208B)
0E12: 36 00    ld   (hl),$00
0E14: 21 00 00 ld   hl,$0000
0E17: 22 8B 20 ld   ($208B),hl
0E1A: AF       xor  a
0E1B: 32 8A 20 ld   ($208A),a
0E1E: 3A A2 20 ld   a,($20A2)
0E21: 3C       inc  a
0E22: 32 A2 20 ld   ($20A2),a
0E25: E6 3F    and  $3F
0E27: CA 3B 0E jp   z,$0E3B
0E2A: 1F       rra
0E2B: 1F       rra
0E2C: 1F       rra
0E2D: E6 07    and  $07
0E2F: 2A 87 20 ld   hl,($2087)
0E32: 11 F0 4A ld   de,$4AF0
0E35: CD CA 0D call $0DCA
0E38: C3 31 0C jp   $0C31
0E3B: 3E 00    ld   a,$00
0E3D: 32 A2 20 ld   ($20A2),a
0E40: 21 01 25 ld   hl,$2501
0E43: 22 80 22 ld   ($2280),hl
0E46: 21 FF 07 ld   hl,$07FF
0E49: 22 A5 20 ld   ($20A5),hl
0E4C: 3A B2 20 ld   a,($20B2)
0E4F: E6 40    and  $40
0E51: C2 31 0C jp   nz,$0C31
0E54: 21 00 22 ld   hl,$2200
0E57: 3A 83 22 ld   a,($2283)
0E5A: A7       and  a
0E5B: CA 31 0C jp   z,$0C31
0E5E: 3D       dec  a
0E5F: 32 83 22 ld   ($2283),a
0E62: 36 00    ld   (hl),$00
0E64: 23       inc  hl
0E65: 7D       ld   a,l
0E66: FE 80    cp   $80
0E68: C2 62 0E jp   nz,$0E62
0E6B: 31 80 20 ld   sp,$2080
0E6E: AF       xor  a
0E6F: 32 A0 20 ld   ($20A0),a
0E72: C3 2C 17 jp   $172C
0E75: 3A A2 20 ld   a,($20A2)
0E78: E6 80    and  $80
0E7A: C8       ret  z
0E7B: 7D       ld   a,l
0E7C: E6 18    and  $18
0E7E: C8       ret  z
0E7F: 3A 84 22 ld   a,($2284)
0E82: E6 03    and  $03
0E84: FE 02    cp   $02
0E86: C8       ret  z
0E87: 3A 87 20 ld   a,($2087)
0E8A: 3C       inc  a
0E8B: E6 1F    and  $1F
0E8D: 5F       ld   e,a
0E8E: 7D       ld   a,l
0E8F: E6 1F    and  $1F
0E91: BB       cp   e
0E92: DA 9C 0E jp   c,$0E9C
0E95: 78       ld   a,b
0E96: E6 F7    and  $F7
0E98: 47       ld   b,a
0E99: C3 A0 0E jp   $0EA0
0E9C: 78       ld   a,b
0E9D: F6 08    or   $08
0E9F: 47       ld   b,a
0EA0: 3A 88 20 ld   a,($2088)
0EA3: BC       cp   h
0EA4: DA AC 0E jp   c,$0EAC
0EA7: 78       ld   a,b
0EA8: F6 80    or   $80
0EAA: 47       ld   b,a
0EAB: C9       ret
0EAC: 78       ld   a,b
0EAD: E6 7F    and  $7F
0EAF: 47       ld   b,a
0EB0: C9       ret
;-----------------------------------
0EB1: C5       push bc
0EB2: 01 20 00 ld   bc,$0020
0EB5: 1A       ld   a,(de)
0EB6: FE FF    cp   $FF
0EB8: C2 BD 0E jp   nz,$0EBD
0EBB: C1       pop  bc
0EBC: C9       ret
;----------------------------------
0EBD: D5       push de
0EBE: E5       push hl
0EBF: 11 80 4E ld   de,$4E80
0EC2: 26 00    ld   h,$00
0EC4: 6F       ld   l,a
0EC5: 29       add  hl,hl
0EC6: 29       add  hl,hl
0EC7: 29       add  hl,hl
0EC8: 19       add  hl,de
0EC9: EB       ex   de,hl
0ECA: E1       pop  hl
0ECB: CD D3 0E call $0ED3
0ECE: D1       pop  de
0ECF: 13       inc  de
0ED0: C3 B5 0E jp   $0EB5
0ED3: 1A       ld   a,(de)
0ED4: 77       ld   (hl),a
0ED5: 13       inc  de
0ED6: 09       add  hl,bc
0ED7: 7B       ld   a,e
0ED8: E6 07    and  $07
0EDA: C2 D3 0E jp   nz,$0ED3
0EDD: C9       ret
;-----------------------------------------
0EDE: 1A       ld   a,(de)
0EDF: 0F       rrca
0EE0: E6 78    and  $78
0EE2: C5       push bc
0EE3: D5       push de
0EE4: 11 80 4E ld   de,$4E80
0EE7: 83       add  a,e
0EE8: 5F       ld   e,a
0EE9: 3E 00    ld   a,$00
0EEB: 8A       adc  a,d
0EEC: 57       ld   d,a
0EED: 01 20 00 ld   bc,$0020
0EF0: CD D3 0E call $0ED3
0EF3: D1       pop  de
0EF4: C1       pop  bc
0EF5: 05       dec  b
0EF6: C8       ret  z
0EF7: C5       push bc
0EF8: D5       push de
0EF9: 1A       ld   a,(de)
0EFA: 17       rla
0EFB: 17       rla
0EFC: 17       rla
0EFD: E6 78    and  $78
0EFF: 11 80 4E ld   de,$4E80
0F02: 83       add  a,e
0F03: 5F       ld   e,a
0F04: 3E 00    ld   a,$00
0F06: 8A       adc  a,d
0F07: 57       ld   d,a
0F08: 01 20 00 ld   bc,$0020
0F0B: CD D3 0E call $0ED3
0F0E: D1       pop  de
0F0F: C1       pop  bc
0F10: 05       dec  b
0F11: C8       ret  z
0F12: 13       inc  de
0F13: C3 DE 0E jp   $0EDE
;---------------------------
0F16: 11 DC 4D ld   de,$4DDC
0F19: 21 01 35 ld   hl,$3501
0F1C: CD B1 0E call $0EB1
0F1F: 11 83 20 ld   de,$2083
0F22: 06 02    ld   b,$02
0F24: CD DE 0E call $0EDE
0F27: C9       ret
;------------------------------
0F28: 11 20 00 ld   de,$0020
0F2B: C9       ret
0F2C: 11 40 00 ld   de,$0040
0F2F: C9       ret
0F30: 11 40 00 ld   de,$0040
0F33: C9       ret
0F34: 11 60 00 ld   de,$0060
0F37: C9       ret
0F38: 11 00 00 ld   de,$0000
0F3B: C9       ret
0F3C: 11 80 00 ld   de,$0080
0F3F: C9       ret
0F40: 11 00 01 ld   de,$0100
0F43: C9       ret
0F44: 11 00 10 ld   de,$1000
0F47: C9       ret
0F48: 3A B2 20 ld   a,($20B2)
0F4B: E6 40    and  $40
0F4D: CA 8F 0B jp   z,$0B8F
0F50: 3A 86 20 ld   a,($2086)
0F53: A7       and  a
0F54: C2 A3 0F jp   nz,$0FA3
0F57: 21 AB 20 ld   hl,$20AB
0F5A: CD A9 0F call $0FA9
0F5D: 3A 86 20 ld   a,($2086)
0F60: A7       and  a
0F61: C2 97 0F jp   nz,$0F97
0F64: 3A A9 20 ld   a,($20A9)
0F67: 47       ld   b,a
0F68: 3A 88 22 ld   a,($2288)
0F6B: B8       cp   b
0F6C: C2 9D 0F jp   nz,$0F9D
0F6F: 3E FF    ld   a,$FF
0F71: 32 88 22 ld   ($2288),a
0F74: 3A 83 22 ld   a,($2283)
0F77: 3C       inc  a
0F78: 32 83 22 ld   ($2283),a
0F7B: CD 6A 09 call $096A
0F7E: 3E 07    ld   a,$07
0F80: CD 1D 01 call $011D
0F83: 21 37 02 ld   hl,$0237
0F86: 06 06    ld   b,$06
0F88: AF       xor  a
0F89: 86       add  a,(hl)
0F8A: 23       inc  hl
0F8B: 05       dec  b
0F8C: C2 89 0F jp   nz,$0F89
0F8F: FE 63    cp   $63
0F91: C2 91 0B jp   nz,$0B91
0F94: C3 8F 0B jp   $0B8F
0F97: 3A AC 20 ld   a,($20AC)
0F9A: C3 67 0F jp   $0F67
0F9D: CD 8E 09 call $098E
0FA0: C3 8F 0B jp   $0B8F
0FA3: 21 AE 20 ld   hl,$20AE
0FA6: C3 5A 0F jp   $0F5A
0FA9: 7E       ld   a,(hl)
0FAA: 83       add  a,e
0FAB: 27       daa
0FAC: 77       ld   (hl),a
0FAD: 2B       dec  hl
0FAE: 7E       ld   a,(hl)
0FAF: 8A       adc  a,d
0FB0: 27       daa
0FB1: 77       ld   (hl),a
0FB2: 2B       dec  hl
0FB3: 7E       ld   a,(hl)
0FB4: CE 00    adc  a,$00
0FB6: 27       daa
0FB7: 77       ld   (hl),a
0FB8: C9       ret
0FB9: 3A BB 20 ld   a,($20BB)
0FBC: A7       and  a
0FBD: C2 31 0C jp   nz,$0C31
0FC0: 3E 03    ld   a,$03
0FC2: 32 83 22 ld   ($2283),a
0FC5: 3E 80    ld   a,$80
0FC7: C3 2F 10 jp   $102F
0FCA: 3A 83 20 ld   a,($2083)
0FCD: A7       and  a
0FCE: CA B9 0F jp   z,$0FB9
0FD1: FE 02    cp   $02
0FD3: DA F7 0F jp   c,$0FF7
0FD6: 3A 01 58 ld   a,($5801)	;IN0 read
0FD9: E6 02    and  $02			;check against bit 2 = 2 player start
0FDB: C2 B5 10 jp   nz,$10B5
0FDE: 3A B2 20 ld   a,($20B2)
0FE1: E6 04    and  $04
0FE3: C2 F7 0F jp   nz,$0FF7
0FE6: 21 89 26 ld   hl,$2689
0FE9: 11 93 49 ld   de,$4993
0FEC: CD B1 0E call $0EB1
0FEF: 3A B2 20 ld   a,($20B2)	
0FF2: F6 04    or   $04			
0FF4: 32 B2 20 ld   ($20B2),a
0FF7: 3A 01 58 ld   a,($5801)	;IN0 read
0FFA: E6 04    and  $04			;check against bit 3 = 1 player start
0FFC: C2 1B 10 jp   nz,$101B
0FFF: 3A B2 20 ld   a,($20B2)
1002: E6 08    and  $08
1004: C2 31 0C jp   nz,$0C31
1007: 21 8B 26 ld   hl,$268B
100A: 11 7A 49 ld   de,$497A
100D: CD B1 0E call $0EB1
1010: 3A B2 20 ld   a,($20B2)
1013: F6 08    or   $08
1015: 32 B2 20 ld   ($20B2),a
1018: C3 31 0C jp   $0C31
;-------------------------		Player 1 Start Pressed
101B: CD F1 10 call $10F1		;Jump for credits check
101E: CD 1C 11 call $111C		;Jump for Rom check
1021: 32 83 22 ld   ($2283),a	;load 2283 with a = $03
1024: AF       xor  a			;a = 0
1025: 32 83 23 ld   ($2383),a	;put 0 in 2383 location
1028: 3E 13    ld   a,$13		;a = $13
102A: CD 1D 01 call $011D		;interface with 5803 - sound chip - is that the rising sound maybe?
102D: 3E C0    ld   a,$C0		;a=$C0
102F: 32 B2 20 ld   ($20B2),a	;load 20B2 with C0
1032: 21 00 22 ld   hl,$2200	;hl is $2200
1035: 36 00    ld   (hl),$00	;put 0 in $2200
1037: 23       inc  hl			;+1
1038: 7D       ld   a,l			;a=l
1039: FE 80    cp   $80			;compare to 80 - has hl reached $2280 yet?
103B: C2 35 10 jp   nz,$1035	;if not jump back to 1035 to loop - so this clears areas 2200 to 2280 with 0
103E: 21 00 4E ld   hl,$4E00	;load hl with $4E00
1041: 11 00 22 ld   de,$2200	;load DE with $2200
1044: 3A 00 20 ld   a,($2000)	;load a with value from $2000 - $40?
1047: E6 40    and  $40			;and it with $40 - should equal 1
1049: C2 4E 10 jp   nz,$104E	;if not zero jump to 104E
104C: 3E 80    ld   a,$80		;otherwise a = $80 not $40
104E: 47       ld   b,a			;b=40 or 80
104F: FF       rst  $38			;branch to $38 to do mem copy of 40 bytes from 4E00-4E40 to 2200-2240
1050: 3E 7F    ld   a,$7F		;a=$7F
1052: 32 82 22 ld   ($2282),a	;put $7F into 2282
1055: 3A B2 20 ld   a,($20B2)	;a = value from $20B2 = C0?
1058: E6 C0    and  $C0			;and with C0 = 1
105A: FE C0    cp   $C0			;=1
105C: C2 6B 10 jp   nz,$106B	;jump to 106B if not zero
105F: 3E 06    ld   a,$06
1061: 21 A9 20 ld   hl,$20A9
1064: 36 00    ld   (hl),$00
1066: 23       inc  hl
1067: 3D       dec  a
1068: C2 64 10 jp   nz,$1064
106B: AF       xor  a			;a=0
106C: 32 05 58 ld   ($5805),a	;zero in 5805 - this should be the flip screen? not sure
106F: 32 84 22 ld   ($2284),a	;put zeros in all these locations
1072: 32 84 23 ld   ($2384),a
1075: 32 87 22 ld   ($2287),a
1078: 32 87 23 ld   ($2387),a
107B: 32 BB 20 ld   ($20BB),a
107E: 32 86 20 ld   ($2086),a
1081: 3E 01    ld   a,$01		;put 1 in all these locations
1083: 32 88 22 ld   ($2288),a
1086: 32 88 23 ld   ($2388),a
1089: 21 84 18 ld   hl,$1884	;hl = 1884
108C: 06 28    ld   b,$28		;b = 28
108E: 86       add  a,(hl)		;add value in 1884 to a
108F: 23       inc  hl			;+1 to hl
1090: 05       dec  b			;-1 to b  
1091: C2 8E 10 jp   nz,$108E	;loop 28 times
1094: FE A9    cp   $A9			;compare a with $A9 - this shoudl be just checking ROM
1096: C0       ret  nz			;return if difference is not zero
1097: 3A B2 20 ld   a,($20B2)	;a = value from 20B2 = C0
109A: E6 40    and  $40			;=40
109C: CA A7 10 jp   z,$10A7		; if it was zero jump
109F: 3E 9A    ld   a,$9A		;a = 9A
10A1: CD 1D 01 call $011D		;sound interface shenanigans
10A4: CD 79 12 call $1279		;Get $38 or freeze
10A7: 31 80 20 ld   sp,$2080	;stack pointed to 2080
10AA: 3A B2 20 ld   a,($20B2)	;a=value in 20B2 = C0? - maybe if this is not C0 it is why there is a difference - is 20B2 2 player related?
10AD: E6 40    and  $40			;=40
10AF: C2 F7 02 jp   nz,$02F7	;not zero so jump to 2F7
10B2: C3 DD 02 jp   $02DD
10B5: CD F1 10 call $10F1
10B8: CD F1 10 call $10F1
10BB: CD 1C 11 call $111C
10BE: 32 83 22 ld   ($2283),a
10C1: 32 83 23 ld   ($2383),a
10C4: 21 00 23 ld   hl,$2300
10C7: 36 00    ld   (hl),$00
10C9: 23       inc  hl
10CA: 7D       ld   a,l
10CB: FE 80    cp   $80
10CD: C2 C7 10 jp   nz,$10C7
10D0: 21 00 4E ld   hl,$4E00
10D3: 11 00 23 ld   de,$2300
10D6: 3A 00 20 ld   a,($2000)
10D9: E6 40    and  $40
10DB: C2 E0 10 jp   nz,$10E0
10DE: 3E 80    ld   a,$80
10E0: 47       ld   b,a
10E1: FF       rst  $38
10E2: 3E 7F    ld   a,$7F
10E4: 32 82 23 ld   ($2382),a
10E7: 3E 13    ld   a,$13
10E9: CD 1D 01 call $011D
10EC: 3E E0    ld   a,$E0
10EE: C3 2F 10 jp   $102F
;---------------------------- Get number of credits, decrement, do checks and return
10F1: 3A 83 20 ld   a,($2083)	
10F4: 3D       dec  a
10F5: 47       ld   b,a
10F6: E6 0F    and  $0F
10F8: FE 0F    cp   $0F
10FA: C2 03 11 jp   nz,$1103
10FD: 78       ld   a,b
10FE: E6 F0    and  $F0
1100: F6 09    or   $09
1102: 47       ld   b,a
1103: 78       ld   a,b
1104: 32 83 20 ld   ($2083),a
1107: C9       ret
;------------------------------
1108: 3A 86 20 ld   a,($2086)
110B: A7       and  a
110C: CA 13 11 jp   z,$1113
110F: 7C       ld   a,h
1110: EE 01    xor  $01
1112: 67       ld   h,a
1113: 7E       ld   a,(hl)
1114: 16 49    ld   d,$49
1116: 5F       ld   e,a
1117: 3E B2    ld   a,$B2
1119: 93       sub  e
111A: 5F       ld   e,a
111B: C9       ret
;-------------------------------- some checks
111C: 3A 67 01 ld   a,($0167)	;load value from Rom
111F: FE C8    cp   $C8			;check against C8 - it will be
1121: 3E FF    ld   a,$FF		;load a with FF
1123: C0       ret  nz			;return if ROM is not C8
1124: 3A 00 20 ld   a,($2000)	;get value 2000 - should be $40
1127: E6 03    and  $03			;and it with $03 = $00
1129: C6 03    add  a,$03		;add 03 = $03
112B: C9       ret				;return
;--------------------------------
112C: 3A B2 20 ld   a,($20B2)
112F: E6 40    and  $40
1131: CA 3E 11 jp   z,$113E
1134: 11 B4 49 ld   de,$49B4
1137: 21 0B 2D ld   hl,$2D0B
113A: CD B1 0E call $0EB1
113D: C9       ret
113E: 11 3F 19 ld   de,$193F
1141: 3A 83 20 ld   a,($2083)
1144: A7       and  a
1145: CA 37 11 jp   z,$1137
1148: AF       xor  a
1149: 32 A5 20 ld   ($20A5),a
114C: C9       ret
114D: AF       xor  a
114E: 32 83 22 ld   ($2283),a
1151: CD 6D 0D call $0D6D
1154: CD 3A 07 call $073A
1157: 3E 40    ld   a,$40
1159: 32 A2 20 ld   ($20A2),a
115C: AF       xor  a
115D: CD 1D 01 call $011D
1160: C9       ret
1161: 3A B2 20 ld   a,($20B2)
1164: E6 40    and  $40
1166: CA 7A 11 jp   z,$117A
1169: 3A 86 20 ld   a,($2086)
116C: A7       and  a
116D: C2 83 11 jp   nz,$1183
1170: 11 BE 49 ld   de,$49BE
1173: 21 89 2D ld   hl,$2D89
1176: CD B1 0E call $0EB1
1179: C9       ret
117A: 11 29 19 ld   de,$1929
117D: 21 89 27 ld   hl,$2789
1180: C3 76 11 jp   $1176
1183: 11 C7 49 ld   de,$49C7
1186: C3 73 11 jp   $1173
1189: C5       push bc
118A: 36 00    ld   (hl),$00
118C: 23       inc  hl
118D: 05       dec  b
118E: C2 8A 11 jp   nz,$118A
1191: 19       add  hl,de
1192: C1       pop  bc
1193: 0D       dec  c
1194: C2 89 11 jp   nz,$1189
1197: C9       ret
1198: 7B       ld   a,e
1199: FE 40    cp   $40
119B: D2 16 03 jp   nc,$0316
119E: D5       push de
119F: 3A 8F 20 ld   a,($208F)
11A2: E6 01    and  $01
11A4: CA AB 11 jp   z,$11AB
11A7: D1       pop  de
11A8: C3 0D 04 jp   $040D
11AB: 3A A0 20 ld   a,($20A0)
11AE: 17       rla
11AF: E6 1F    and  $1F
11B1: F6 C0    or   $C0
11B3: 5F       ld   e,a
11B4: E5       push hl
11B5: 16 22    ld   d,$22
11B7: 7D       ld   a,l
11B8: E6 1F    and  $1F
11BA: 6F       ld   l,a
11BB: 1A       ld   a,(de)
11BC: E6 1F    and  $1F
11BE: BD       cp   l
11BF: 78       ld   a,b
11C0: D2 C8 11 jp   nc,$11C8
11C3: E6 F7    and  $F7
11C5: C3 CA 11 jp   $11CA
11C8: F6 08    or   $08
11CA: E6 F8    and  $F8
11CC: F6 01    or   $01
11CE: 47       ld   b,a
11CF: 13       inc  de
11D0: 1A       ld   a,(de)
11D1: BC       cp   h
11D2: 78       ld   a,b
11D3: CA DE 11 jp   z,$11DE
11D6: DA E3 11 jp   c,$11E3
11D9: F6 E0    or   $E0
11DB: C3 E7 11 jp   $11E7
11DE: E6 1F    and  $1F
11E0: C3 E7 11 jp   $11E7
11E3: E6 7F    and  $7F
11E5: F6 60    or   $60
11E7: 47       ld   b,a
11E8: E1       pop  hl
11E9: D1       pop  de
11EA: C3 0D 04 jp   $040D
11ED: 3A B2 20 ld   a,($20B2)
11F0: E6 40    and  $40
11F2: CA FA 11 jp   z,$11FA
11F5: 3E 14    ld   a,$14
11F7: CD 1D 01 call $011D
11FA: AF       xor  a
11FB: 32 8A 20 ld   ($208A),a
11FE: 32 8C 20 ld   ($208C),a
1201: 3A 84 22 ld   a,($2284)
1204: E6 03    and  $03
1206: FE 01    cp   $01
1208: CA 1B 12 jp   z,$121B
120B: FE 02    cp   $02
120D: CA 39 12 jp   z,$1239
1210: FE 03    cp   $03
1212: CA 4E 12 jp   z,$124E
1215: 21 00 4E ld   hl,$4E00
1218: 06 80    ld   b,$80
121A: C9       ret
121B: CD 6C 12 call $126C
121E: CA 29 12 jp   z,$1229
1221: 3E 9C    ld   a,$9C
1223: CD 1D 01 call $011D
1226: CD 79 12 call $1279
1229: FB       ei
122A: 11 C0 22 ld   de,$22C0
122D: 21 60 47 ld   hl,$4760
1230: 06 20    ld   b,$20
1232: FF       rst  $38
1233: 21 80 47 ld   hl,$4780
1236: 06 30    ld   b,$30
1238: C9       ret
1239: CD 6C 12 call $126C
123C: CA 47 12 jp   z,$1247
123F: 3E 9B    ld   a,$9B
1241: CD 1D 01 call $011D
1244: CD 79 12 call $1279
1247: FB       ei
1248: 21 B0 47 ld   hl,$47B0
124B: 06 50    ld   b,$50
124D: C9       ret
124E: CD 6C 12 call $126C
1251: CA 5C 12 jp   z,$125C
1254: 3E 9D    ld   a,$9D
1256: CD 1D 01 call $011D
1259: CD 79 12 call $1279
125C: FB       ei
125D: 21 28 47 ld   hl,$4728
1260: 11 5C 22 ld   de,$225C
1263: 06 04    ld   b,$04
1265: FF       rst  $38
1266: 21 D8 46 ld   hl,$46D8
1269: 06 50    ld   b,$50
126B: C9       ret
126C: F3       di
126D: 3A A2 20 ld   a,($20A2)
1270: E6 80    and  $80
1272: C8       ret  z
1273: 3A B2 20 ld   a,($20B2)
1276: E6 40    and  $40
1278: C9       ret
;---------------------------------
1279: 3E 01    ld   a,$01			;a=1
127B: 32 D8 20 ld   ($20D8),a		;load 1 into 20D8
127E: FB       ei					;enable ints
127F: 3A 35 50 ld   a,($5035)		;a=value from 5035 ----> sound chip IO?
1282: FE 38    cp   $38				;compare with 38
1284: C2 7F 12 jp   nz,$127F		;if it isn't 38 loop
1287: 3E 01    ld   a,$01			;a=01
1289: 32 A5 20 ld   ($20A5),a		;let 20A5 = 1
128C: 32 D9 20 ld   ($20D9),a		;let 20D9 = 1
128F: C9       ret
;----------------------------------
1290: D5       push de
1291: E5       push hl
1292: 7D       ld   a,l
1293: E6 1F    and  $1F
1295: 6F       ld   l,a
1296: 3A 87 20 ld   a,($2087)
1299: 3C       inc  a
129A: 3C       inc  a
129B: E6 1F    and  $1F
129D: BD       cp   l
129E: D2 A6 12 jp   nc,$12A6
12A1: E1       pop  hl
12A2: D1       pop  de
12A3: C3 0D 04 jp   $040D
12A6: 3E 05    ld   a,$05
12A8: CD 1D 01 call $011D
12AB: 3E 48    ld   a,$48
12AD: 4F       ld   c,a
12AE: E1       pop  hl
12AF: D1       pop  de
12B0: 2D       dec  l
12B1: C3 1A 04 jp   $041A
12B4: 7D       ld   a,l
12B5: 69       ld   l,c
12B6: 4F       ld   c,a
12B7: 3A 85 22 ld   a,($2285)
12BA: E6 01    and  $01
12BC: CA CF 12 jp   z,$12CF
12BF: 7E       ld   a,(hl)
12C0: FE 3B    cp   $3B
12C2: D4 DA 12 call nc,$12DA
12C5: 3C       inc  a
12C6: 77       ld   (hl),a
12C7: 23       inc  hl
12C8: 23       inc  hl
12C9: 7D       ld   a,l
12CA: 69       ld   l,c
12CB: 4F       ld   c,a
12CC: C3 B1 03 jp   $03B1
12CF: 7E       ld   a,(hl)
12D0: FE 28    cp   $28
12D2: DC DA 12 call c,$12DA
12D5: 3D       dec  a
12D6: 77       ld   (hl),a
12D7: C3 C7 12 jp   $12C7
12DA: 3A 85 22 ld   a,($2285)
12DD: F6 80    or   $80
12DF: 32 85 22 ld   ($2285),a
12E2: 7E       ld   a,(hl)
12E3: C9       ret
12E4: 3A B7 20 ld   a,($20B7)
12E7: E6 07    and  $07
12E9: C2 2F 13 jp   nz,$132F
12EC: 3A 86 22 ld   a,($2286)
12EF: FE 80    cp   $80
12F1: D2 2F 13 jp   nc,$132F
12F4: 3A A2 20 ld   a,($20A2)
12F7: E6 80    and  $80
12F9: CA 2F 13 jp   z,$132F
12FC: 1B       dec  de
12FD: 1B       dec  de
12FE: 1B       dec  de
12FF: EB       ex   de,hl
1300: 11 40 22 ld   de,$2240
1303: 7B       ld   a,e
1304: 85       add  a,l
1305: 5F       ld   e,a
1306: 7E       ld   a,(hl)
1307: E6 C7    and  $C7
1309: F6 30    or   $30
130B: 12       ld   (de),a
130C: AF       xor  a
130D: 77       ld   (hl),a
130E: 23       inc  hl
130F: 13       inc  de
1310: 06 03    ld   b,$03
1312: FF       rst  $38
1313: EB       ex   de,hl
1314: 1B       dec  de
1315: 3E 09    ld   a,$09
1317: CD 1D 01 call $011D
131A: 3A 8F 20 ld   a,($208F)
131D: E6 01    and  $01
131F: CA 2A 13 jp   z,$132A
1322: 3E 80    ld   a,$80
1324: 32 86 22 ld   ($2286),a
1327: C3 2E 04 jp   $042E
132A: 3E C0    ld   a,$C0
132C: C3 24 13 jp   $1324
132F: D5       push de
1330: C5       push bc
1331: 11 20 45 ld   de,$4520
1334: 78       ld   a,b
1335: E6 1F    and  $1F
1337: 83       add  a,e
1338: 5F       ld   e,a
1339: 1A       ld   a,(de)
133A: 47       ld   b,a
133B: CD 2E 06 call $062E
133E: 79       ld   a,c
133F: C1       pop  bc
1340: 4F       ld   c,a
1341: 78       ld   a,b
1342: E6 E0    and  $E0
1344: 5F       ld   e,a
1345: 78       ld   a,b
1346: 3C       inc  a
1347: E6 1F    and  $1F
1349: B3       or   e
134A: 47       ld   b,a
134B: D1       pop  de
134C: C3 10 04 jp   $0410
134F: D5       push de
1350: 78       ld   a,b
1351: E6 01    and  $01
1353: CA 5C 13 jp   z,$135C
1356: 11 40 45 ld   de,$4540
1359: C3 5F 13 jp   $135F
135C: 11 69 45 ld   de,$4569
135F: C5       push bc
1360: E5       push hl
1361: CD 40 07 call $0740
1364: E1       pop  hl
1365: C1       pop  bc
1366: 05       dec  b
1367: CA 8B 13 jp   z,$138B
136A: 78       ld   a,b
136B: E6 01    and  $01
136D: CA 76 13 jp   z,$1376
1370: 11 40 45 ld   de,$4540
1373: C3 79 13 jp   $1379
1376: 11 69 45 ld   de,$4569
1379: C5       push bc
137A: E5       push hl
137B: CD FE 06 call $06FE
137E: E1       pop  hl
137F: C1       pop  bc
1380: D1       pop  de
1381: AF       xor  a
1382: 32 9E 20 ld   ($209E),a
1385: 32 9F 20 ld   ($209F),a
1388: C3 13 04 jp   $0413
138B: 0E E8    ld   c,$E8
138D: D1       pop  de
138E: C3 10 04 jp   $0410
1391: 3A 86 22 ld   a,($2286)
1394: E6 02    and  $02
1396: FE 02    cp   $02
1398: CA F9 13 jp   z,$13F9
139B: 3A 86 22 ld   a,($2286)
139E: E6 40    and  $40
13A0: CA E4 13 jp   z,$13E4
13A3: 7C       ld   a,h
13A4: FE 28    cp   $28
13A6: DA AE 13 jp   c,$13AE
13A9: 06 20    ld   b,$20
13AB: C3 B8 13 jp   $13B8
13AE: 06 A0    ld   b,$A0
13B0: 3A 86 22 ld   a,($2286)
13B3: F6 01    or   $01
13B5: 32 86 22 ld   ($2286),a
13B8: 7D       ld   a,l
13B9: E6 1F    and  $1F
13BB: FE 10    cp   $10
13BD: DA C9 13 jp   c,$13C9
13C0: 78       ld   a,b
13C1: F6 01    or   $01
13C3: E6 A1    and  $A1
13C5: 47       ld   b,a
13C6: C3 D5 13 jp   $13D5
13C9: 78       ld   a,b
13CA: F6 09    or   $09
13CC: 47       ld   b,a
13CD: 3A 86 22 ld   a,($2286)
13D0: F6 02    or   $02
13D2: 32 86 22 ld   ($2286),a
13D5: 3A 86 22 ld   a,($2286)
13D8: E6 03    and  $03
13DA: FE 03    cp   $03
13DC: C2 0D 04 jp   nz,$040D
13DF: 06 00    ld   b,$00
13E1: C3 0D 04 jp   $040D
13E4: 7C       ld   a,h
13E5: FE 3C    cp   $3C
13E7: DA AE 13 jp   c,$13AE
13EA: C3 A9 13 jp   $13A9
13ED: AF       xor  a
13EE: 32 86 22 ld   ($2286),a
13F1: 3E 00    ld   a,$00
13F3: 32 B7 20 ld   ($20B7),a
13F6: C3 76 0B jp   $0B76
13F9: 7C       ld   a,h
13FA: FE 3D    cp   $3D
13FC: D2 3C 14 jp   nc,$143C
13FF: FE 27    cp   $27
1401: DA 3C 14 jp   c,$143C
1404: 7D       ld   a,l
1405: E6 1F    and  $1F
1407: FE 03    cp   $03
1409: DA 3C 14 jp   c,$143C
140C: FE 1B    cp   $1B
140E: D2 3C 14 jp   nc,$143C
1411: D5       push de
1412: C5       push bc
1413: 11 90 45 ld   de,$4590
1416: 78       ld   a,b
1417: E6 7F    and  $7F
1419: 83       add  a,e
141A: 5F       ld   e,a
141B: 3A 86 22 ld   a,($2286)
141E: E6 40    and  $40
1420: 1A       ld   a,(de)
1421: C2 54 14 jp   nz,$1454
1424: EE 08    xor  $08
1426: 47       ld   b,a
1427: CD 2E 06 call $062E
142A: 79       ld   a,c
142B: C1       pop  bc
142C: 4F       ld   c,a
142D: 78       ld   a,b
142E: 3C       inc  a
142F: E6 7F    and  $7F
1431: FE 70    cp   $70
1433: C2 37 14 jp   nz,$1437
1436: AF       xor  a
1437: 47       ld   b,a
1438: D1       pop  de
1439: C3 10 04 jp   $0410
143C: AF       xor  a
143D: 32 86 22 ld   ($2286),a
1440: 1B       dec  de
1441: 1B       dec  de
1442: 1B       dec  de
1443: AF       xor  a
1444: 12       ld   (de),a
1445: 7B       ld   a,e
1446: E6 3F    and  $3F
1448: 5F       ld   e,a
1449: 21 B0 47 ld   hl,$47B0
144C: 85       add  a,l
144D: 6F       ld   l,a
144E: 06 04    ld   b,$04
1450: FF       rst  $38
1451: C3 2F 04 jp   $042F
1454: EE 88    xor  $88
1456: C3 26 14 jp   $1426
1459: D5       push de
145A: 78       ld   a,b
145B: E6 01    and  $01
145D: CA 66 14 jp   z,$1466
1460: 11 00 46 ld   de,$4600
1463: C3 69 14 jp   $1469
1466: 11 0A 46 ld   de,$460A
1469: C5       push bc
146A: E5       push hl
146B: CD 40 07 call $0740
146E: E1       pop  hl
146F: C1       pop  bc
1470: 05       dec  b
1471: 78       ld   a,b
1472: E6 01    and  $01
1474: CA 7D 14 jp   z,$147D
1477: 11 00 46 ld   de,$4600
147A: C3 80 14 jp   $1480
147D: 11 0A 46 ld   de,$460A
1480: DF       rst  $18
1481: 7C       ld   a,h
1482: FE 3E    cp   $3E
1484: C2 89 14 jp   nz,$1489
1487: 26 25    ld   h,$25
1489: C5       push bc
148A: E5       push hl
148B: CD FE 06 call $06FE
148E: 2A 9E 20 ld   hl,($209E)
1491: DF       rst  $18
1492: 22 9E 20 ld   ($209E),hl
1495: E1       pop  hl
1496: C1       pop  bc
1497: D1       pop  de
1498: C3 13 04 jp   $0413
149B: 3A 87 22 ld   a,($2287)
149E: FE 04    cp   $04
14A0: C2 A8 14 jp   nz,$14A8
14A3: 0E 60    ld   c,$60
14A5: C3 4A 15 jp   $154A
14A8: 79       ld   a,c
14A9: EE 04    xor  $04
14AB: 4F       ld   c,a
14AC: 3A B7 20 ld   a,($20B7)
14AF: E6 03    and  $03
14B1: C2 0D 04 jp   nz,$040D
14B4: 3A 71 20 ld   a,($2071)
14B7: 1F       rra
14B8: 1F       rra
14B9: E6 80    and  $80
14BB: A8       xor  b
14BC: 47       ld   b,a
14BD: C3 0D 04 jp   $040D
14C0: 2A 5E 22 ld   hl,($225E)
14C3: CD 34 15 call $1534
14C6: EB       ex   de,hl
14C7: 2A 8B 20 ld   hl,($208B)
14CA: 19       add  hl,de
14CB: 7C       ld   a,h
14CC: A7       and  a
14CD: C2 3F 15 jp   nz,$153F
14D0: 7D       ld   a,l
14D1: E6 1F    and  $1F
14D3: C2 1F 15 jp   nz,$151F
14D6: 7D       ld   a,l
14D7: FE 80    cp   $80
14D9: D2 1F 15 jp   nc,$151F
14DC: 3A 5C 22 ld   a,($225C)
14DF: E6 80    and  $80
14E1: CA 1F 15 jp   z,$151F
14E4: 3A 87 22 ld   a,($2287)
14E7: 17       rla
14E8: 17       rla
14E9: E6 0C    and  $0C
14EB: 11 50 22 ld   de,$2250
14EE: 83       add  a,e
14EF: 5F       ld   e,a
14F0: 3E E0    ld   a,$E0
14F2: 12       ld   (de),a
14F3: 13       inc  de
14F4: 3E 03    ld   a,$03
14F6: 12       ld   (de),a
14F7: 13       inc  de
14F8: 2A 5E 22 ld   hl,($225E)
14FB: 7D       ld   a,l
14FC: 12       ld   (de),a
14FD: 13       inc  de
14FE: 7C       ld   a,h
14FF: 12       ld   (de),a
1500: 3A 87 22 ld   a,($2287)
1503: 3C       inc  a
1504: 32 87 22 ld   ($2287),a
1507: E6 03    and  $03
1509: C2 1A 15 jp   nz,$151A
150C: AF       xor  a
150D: CD 1D 01 call $011D
1510: 11 5C 22 ld   de,$225C
1513: 3E 60    ld   a,$60
1515: 06 38    ld   b,$38
1517: C3 7D 0B jp   $0B7D
151A: 3E 06    ld   a,$06
151C: CD 1D 01 call $011D
151F: AF       xor  a
1520: 32 8A 20 ld   ($208A),a
1523: 2A 8B 20 ld   hl,($208B)
1526: 36 00    ld   (hl),$00
1528: 21 00 00 ld   hl,$0000
152B: 22 9E 20 ld   ($209E),hl
152E: 22 8B 20 ld   ($208B),hl
1531: C3 8F 0B jp   $0B8F
1534: 7D       ld   a,l
1535: 2F       cpl
1536: C6 01    add  a,$01
1538: 6F       ld   l,a
1539: 7C       ld   a,h
153A: 2F       cpl
153B: CE 00    adc  a,$00
153D: 67       ld   h,a
153E: C9       ret
153F: CD 34 15 call $1534
1542: 7C       ld   a,h
1543: A7       and  a
1544: CA D0 14 jp   z,$14D0
1547: C3 1F 15 jp   $151F
154A: D5       push de
154B: C5       push bc
154C: E5       push hl
154D: 2A 5E 22 ld   hl,($225E)
1550: 25       dec  h
1551: 25       dec  h
1552: 06 03    ld   b,$03
1554: 79       ld   a,c
1555: 3C       inc  a
1556: E6 07    and  $07
1558: CA 6C 15 jp   z,$156C
155B: 11 F0 4A ld   de,$4AF0
155E: CD CA 0D call $0DCA
1561: 24       inc  h
1562: 24       inc  h
1563: 05       dec  b
1564: C2 5B 15 jp   nz,$155B
1567: E1       pop  hl
1568: C1       pop  bc
1569: C3 F8 0D jp   $0DF8
156C: 21 18 24 ld   hl,$2418
156F: 01 E0 02 ld   bc,$02E0
1572: 11 1E 00 ld   de,$001E
1575: CD 89 11 call $1189
1578: 3E 04    ld   a,$04
157A: 32 E0 20 ld   ($20E0),a
157D: E1       pop  hl
157E: C1       pop  bc
157F: 21 18 44 ld   hl,$4418
1582: 0E 50    ld   c,$50
1584: C3 FE 0D jp   $0DFE
1587: 3A E0 20 ld   a,($20E0)
158A: A7       and  a
158B: CA 9A 15 jp   z,$159A
158E: 3D       dec  a
158F: 32 E0 20 ld   ($20E0),a
1592: C2 9A 15 jp   nz,$159A
1595: 3E 01    ld   a,$01
1597: CD 1D 01 call $011D
159A: D5       push de
159B: AF       xor  a
159C: 32 87 22 ld   ($2287),a
159F: 11 7C 18 ld   de,$187C
15A2: C5       push bc
15A3: E5       push hl
15A4: 3A B8 20 ld   a,($20B8)
15A7: A7       and  a
15A8: C2 08 16 jp   nz,$1608
15AB: 3A B2 20 ld   a,($20B2)
15AE: E6 80    and  $80
15B0: CA 22 17 jp   z,$1722
15B3: 3A A2 20 ld   a,($20A2)
15B6: E6 80    and  $80
15B8: CA CA 15 jp   z,$15CA
15BB: CD 40 07 call $0740
15BE: E1       pop  hl
15BF: E7       rst  $20
15C0: 7C       ld   a,h
15C1: FE 27    cp   $27
15C3: DA 24 16 jp   c,$1624
15C6: E5       push hl
15C7: 11 7C 18 ld   de,$187C
15CA: CD FE 06 call $06FE
15CD: E1       pop  hl
15CE: C1       pop  bc
15CF: D1       pop  de
15D0: AF       xor  a
15D1: 32 9E 20 ld   ($209E),a
15D4: C3 13 04 jp   $0413
15D7: 2A 5E 22 ld   hl,($225E)
15DA: CD 34 15 call $1534
15DD: EB       ex   de,hl
15DE: 2A 87 20 ld   hl,($2087)
15E1: 2C       inc  l
15E2: 2C       inc  l
15E3: 19       add  hl,de
15E4: 7C       ld   a,h
15E5: A7       and  a
15E6: C2 FD 15 jp   nz,$15FD
15E9: 7D       ld   a,l
15EA: E6 1F    and  $1F
15EC: C2 A7 08 jp   nz,$08A7
15EF: 7D       ld   a,l
15F0: FE 60    cp   $60
15F2: D2 A7 08 jp   nc,$08A7
15F5: 3E 01    ld   a,$01
15F7: 32 B8 20 ld   ($20B8),a
15FA: C3 B4 08 jp   $08B4
15FD: CD 34 15 call $1534
1600: 7C       ld   a,h
1601: A7       and  a
1602: CA E9 15 jp   z,$15E9
1605: C3 A7 08 jp   $08A7
1608: 3E 7F    ld   a,$7F
160A: 32 82 22 ld   ($2282),a
160D: 3E 98    ld   a,$98
160F: CD 1D 01 call $011D
1612: FB       ei
1613: 3A 79 50 ld   a,($5079)
1616: FE 38    cp   $38
1618: C2 13 16 jp   nz,$1613
161B: 3A 51 50 ld   a,($5051)
161E: FE AA    cp   $AA
1620: C2 1B 16 jp   nz,$161B
1623: E1       pop  hl
1624: C1       pop  bc
1625: D1       pop  de
1626: AF       xor  a
1627: 32 A0 20 ld   ($20A0),a
162A: C3 16 03 jp   $0316
162D: 0E 03    ld   c,$03
162F: 46       ld   b,(hl)
1630: 1A       ld   a,(de)
1631: B8       cp   b
1632: CA 3B 16 jp   z,$163B
1635: DA 43 16 jp   c,$1643
1638: 3E 02    ld   a,$02
163A: C9       ret
163B: 0D       dec  c
163C: 23       inc  hl
163D: 13       inc  de
163E: C2 2F 16 jp   nz,$162F
1641: AF       xor  a
1642: C9       ret
1643: 3E 01    ld   a,$01
1645: C9       ret
1646: 11 AC 20 ld   de,$20AC
1649: 3E 02    ld   a,$02
164B: 32 B9 20 ld   ($20B9),a
164E: C3 A6 04 jp   $04A6
1651: 21 A9 20 ld   hl,$20A9
1654: C3 BF 04 jp   $04BF
1657: AF       xor  a
1658: C3 CF 04 jp   $04CF
165B: 2A BA 20 ld   hl,($20BA)
165E: 7C       ld   a,h
165F: A7       and  a
1660: CA 16 03 jp   z,$0316
1663: 2B       dec  hl
1664: 22 BA 20 ld   ($20BA),hl
1667: 7C       ld   a,h
1668: A7       and  a
1669: CA DA 16 jp   z,$16DA
166C: 7D       ld   a,l
166D: E6 03    and  $03
166F: C2 16 03 jp   nz,$0316
1672: 3E 96    ld   a,$96
1674: CD 1D 01 call $011D
1677: 3A 01 50 ld   a,($5001)
167A: FE 7D    cp   $7D
167C: C2 77 16 jp   nz,$1677
167F: 3E 97    ld   a,$97
1681: CD 1D 01 call $011D
1684: 3A 02 50 ld   a,($5002)
1687: FE F4    cp   $F4
1689: C2 84 16 jp   nz,$1684
168C: CD E5 04 call $04E5
168F: CD AB 0B call $0BAB
1692: 17       rla
1693: 17       rla
1694: DA A7 16 jp   c,$16A7
1697: 17       rla
1698: DA 10 17 jp   c,$1710
169B: E6 80    and  $80
169D: C2 C9 16 jp   nz,$16C9
16A0: AF       xor  a
16A1: 32 C5 20 ld   ($20C5),a
16A4: C3 16 03 jp   $0316
16A7: 2A BC 20 ld   hl,($20BC)
16AA: 7E       ld   a,(hl)
16AB: 3C       inc  a
16AC: FE 25    cp   $25
16AE: CA F0 16 jp   z,$16F0
16B1: 77       ld   (hl),a
16B2: 6F       ld   l,a
16B3: 26 00    ld   h,$00
16B5: 11 80 4E ld   de,$4E80
16B8: 29       add  hl,hl
16B9: 29       add  hl,hl
16BA: 29       add  hl,hl
16BB: 19       add  hl,de
16BC: EB       ex   de,hl
16BD: 2A BE 20 ld   hl,($20BE)
16C0: 01 20 00 ld   bc,$0020
16C3: CD D3 0E call $0ED3
16C6: C3 16 03 jp   $0316
16C9: 3A C5 20 ld   a,($20C5)
16CC: A7       and  a
16CD: C2 16 03 jp   nz,$0316
16D0: 3A C0 20 ld   a,($20C0)
16D3: 3D       dec  a
16D4: 32 C0 20 ld   ($20C0),a
16D7: C2 F5 16 jp   nz,$16F5
16DA: AF       xor  a
16DB: 32 BB 20 ld   ($20BB),a
16DE: CD 2C 09 call $092C
16E1: AF       xor  a
16E2: 32 05 58 ld   ($5805),a
16E5: 3A B2 20 ld   a,($20B2)
16E8: E6 F3    and  $F3
16EA: 32 B2 20 ld   ($20B2),a
16ED: C3 16 03 jp   $0316
16F0: 3E 0A    ld   a,$0A
16F2: C3 B1 16 jp   $16B1
16F5: 2A BC 20 ld   hl,($20BC)
16F8: 23       inc  hl
16F9: 22 BC 20 ld   ($20BC),hl
16FC: EB       ex   de,hl
16FD: 2A BE 20 ld   hl,($20BE)
1700: 24       inc  h
1701: 24       inc  h
1702: 22 BE 20 ld   ($20BE),hl
1705: 3E 01    ld   a,$01
1707: 32 C5 20 ld   ($20C5),a
170A: 3E 0A    ld   a,$0A
170C: EB       ex   de,hl
170D: C3 B1 16 jp   $16B1
1710: 2A BC 20 ld   hl,($20BC)
1713: 7E       ld   a,(hl)
1714: 3D       dec  a
1715: FE 09    cp   $09
1717: CA 1D 17 jp   z,$171D
171A: C3 B1 16 jp   $16B1
171D: 3E 24    ld   a,$24
171F: C3 B1 16 jp   $16B1
1722: 3A BB 20 ld   a,($20BB)
1725: A7       and  a
1726: C2 CA 15 jp   nz,$15CA
1729: C3 BB 15 jp   $15BB
172C: 3A 83 22 ld   a,($2283)
172F: 32 C8 20 ld   ($20C8),a
1732: 21 16 40 ld   hl,$4016
1735: 22 C9 20 ld   ($20C9),hl
1738: 21 04 40 ld   hl,$4004
173B: 22 CB 20 ld   ($20CB),hl
173E: AF       xor  a
173F: 32 83 22 ld   ($2283),a
1742: 32 82 22 ld   ($2282),a
1745: 32 A5 20 ld   ($20A5),a
1748: 3A B2 20 ld   a,($20B2)
174B: F6 0C    or   $0C
174D: 32 B2 20 ld   ($20B2),a
1750: 3E 80    ld   a,$80
1752: 32 CD 20 ld   ($20CD),a
1755: FB       ei
1756: CD 2C 09 call $092C
1759: 11 00 4A ld   de,$4A00
175C: 21 13 28 ld   hl,$2813
175F: CD FE 06 call $06FE
1762: 3A 83 20 ld   a,($2083)
1765: A7       and  a
1766: CA 79 17 jp   z,$1779
1769: F3       di
176A: AF       xor  a
176B: 32 A0 20 ld   ($20A0),a
176E: 3A B2 20 ld   a,($20B2)
1771: E6 F3    and  $F3
1773: 32 B2 20 ld   ($20B2),a
1776: C3 16 03 jp   $0316
1779: 11 49 19 ld   de,$1949
177C: 21 13 2C ld   hl,$2C13
177F: CD B1 0E call $0EB1
1782: 24       inc  h
1783: CD 6A 18 call $186A
1786: 11 BA 40 ld   de,$40BA
1789: 21 11 28 ld   hl,$2811
178C: CD FE 06 call $06FE
178F: 11 5A 19 ld   de,$195A
1792: 21 11 2C ld   hl,$2C11
1795: CD B1 0E call $0EB1
1798: 24       inc  h
1799: CD 6A 18 call $186A
179C: 11 79 42 ld   de,$4279
179F: 21 0F 28 ld   hl,$280F
17A2: CD FE 06 call $06FE
17A5: 11 64 19 ld   de,$1964
17A8: 21 0F 2C ld   hl,$2C0F
17AB: CD B1 0E call $0EB1
17AE: 24       inc  h
17AF: CD 6A 18 call $186A
17B2: 11 06 44 ld   de,$4406
17B5: 21 0D 28 ld   hl,$280D
17B8: CD FE 06 call $06FE
17BB: 11 6E 19 ld   de,$196E
17BE: 21 0D 2C ld   hl,$2C0D
17C1: CD B1 0E call $0EB1
17C4: 24       inc  h
17C5: CD 6A 18 call $186A
17C8: 11 11 46 ld   de,$4611
17CB: 21 0A 28 ld   hl,$280A
17CE: CD FE 06 call $06FE
17D1: 11 78 19 ld   de,$1978
17D4: 21 0B 2C ld   hl,$2C0B
17D7: CD B1 0E call $0EB1
17DA: 24       inc  h
17DB: CD 6A 18 call $186A
17DE: 11 6F 1B ld   de,$1B6F
17E1: 21 87 28 ld   hl,$2887
17E4: 01 02 90 ld   bc,$9002
17E7: CD 30 18 call $1830
17EA: 11 89 19 ld   de,$1989
17ED: 2A C9 20 ld   hl,($20C9)
17F0: 7C       ld   a,h
17F1: FE 27    cp   $27
17F3: C2 22 18 jp   nz,$1822
17F6: 2A CB 20 ld   hl,($20CB)
17F9: 7C       ld   a,h
17FA: FE 26    cp   $26
17FC: CA 3E 02 jp   z,$023E
17FF: E7       rst  $20
1800: 22 CB 20 ld   ($20CB),hl
1803: 11 49 01 ld   de,$0149
1806: CD 2C 18 call $182C
1809: C3 59 17 jp   $1759
180C: 3A C8 20 ld   a,($20C8)
180F: 32 83 22 ld   ($2283),a
1812: 3E 70    ld   a,$70
1814: 32 82 22 ld   ($2282),a
1817: 3A FC 17 ld   a,($17FC)
181A: FE CA    cp   $CA
181C: C2 12 01 jp   nz,$0112
181F: C3 16 03 jp   $0316
1822: E7       rst  $20
1823: 22 C9 20 ld   ($20C9),hl
1826: CD 43 18 call $1843
1829: C3 59 17 jp   $1759
182C: 06 77    ld   b,$77
182E: 0E 02    ld   c,$02
1830: 1A       ld   a,(de)
1831: 77       ld   (hl),a
1832: 13       inc  de
1833: 23       inc  hl
1834: 0D       dec  c
1835: C2 30 18 jp   nz,$1830
1838: D5       push de
1839: 11 1E 00 ld   de,$001E
183C: 19       add  hl,de
183D: D1       pop  de
183E: 05       dec  b
183F: C2 2E 18 jp   nz,$182E
1842: C9       ret
1843: 06 51    ld   b,$51
1845: 0E 06    ld   c,$06
1847: D5       push de
1848: 1A       ld   a,(de)
1849: 77       ld   (hl),a
184A: 23       inc  hl
184B: 13       inc  de
184C: 0D       dec  c
184D: C2 48 18 jp   nz,$1848
1850: 11 1A 00 ld   de,$001A
1853: 19       add  hl,de
1854: D1       pop  de
1855: 0E 06    ld   c,$06
1857: 1A       ld   a,(de)
1858: 77       ld   (hl),a
1859: 23       inc  hl
185A: 13       inc  de
185B: 0D       dec  c
185C: C2 57 18 jp   nz,$1857
185F: D5       push de
1860: 11 1A 00 ld   de,$001A
1863: 19       add  hl,de
1864: D1       pop  de
1865: 05       dec  b
1866: C2 45 18 jp   nz,$1845
1869: C9       ret
186A: 11 53 19 ld   de,$1953
186D: 3A 63 1A ld   a,($1A63)
1870: FE 13    cp   $13
1872: CA 78 18 jp   z,$1878
1875: 11 82 19 ld   de,$1982
1878: CD B1 0E call $0EB1
187B: C9       ret
187C: FC EC 07 call m,$07EC
187F: 06 AA    ld   b,$AA
1881: FB       ei
1882: 0B       dec  bc
1883: 07       rlca
1884: 06 AA    ld   b,$AA
1886: 09       add  hl,bc
1887: E9       jp   (hl)
1888: 06 06    ld   b,$06
188A: AA       xor  d
188B: E8       ret  pe
188C: F8       ret  m
188D: 07       rlca
188E: 07       rlca
188F: AA       xor  d
1890: E8       ret  pe
1891: F8       ret  m
1892: 07       rlca
1893: 07       rlca
1894: AA       xor  d
1895: F8       ret  m
1896: E8       ret  pe
1897: 07       rlca
1898: 06 AA    ld   b,$AA
189A: F8       ret  m
189B: 68       ld   l,b
189C: 07       rlca
189D: 06 AA    ld   b,$AA
189F: 08       ex   af,af'
18A0: A8       xor  b
18A1: 06 06    ld   b,$06
18A3: AA       xor  d
18A4: A8       xor  b
18A5: C8       ret  z
18A6: 06 06    ld   b,$06
18A8: AA       xor  d
18A9: E8       ret  pe
18AA: F8       ret  m
18AB: 06 07    ld   b,$07
18AD: AA       xor  d
18AE: F8       ret  m
18AF: 78       ld   a,b
18B0: 07       rlca
18B1: 04       inc  b
18B2: AA       xor  d
18B3: F8       ret  m
18B4: 78       ld   a,b
18B5: 07       rlca
18B6: 04       inc  b
18B7: AA       xor  d
18B8: 08       ex   af,af'
18B9: 78       ld   a,b
18BA: 06 04    ld   b,$04
18BC: AA       xor  d
18BD: E8       ret  pe
18BE: 78       ld   a,b
18BF: 06 02    ld   b,$02
18C1: AA       xor  d
18C2: E8       ret  pe
18C3: 78       ld   a,b
18C4: 0E 01    ld   c,$01
18C6: AA       xor  d
18C7: F8       ret  m
18C8: F8       ret  m
18C9: 1F       rra
18CA: 00       nop
18CB: AA       xor  d
18CC: F8       ret  m
18CD: 78       ld   a,b
18CE: 3F       ccf
18CF: 00       nop
18D0: AA       xor  d
18D1: F8       ret  m
18D2: 78       ld   a,b
18D3: 7F       ld   a,a
18D4: 00       nop
18D5: AA       xor  d
18D6: F8       ret  m
18D7: 38 FF    jr   c,$18D8
18D9: 00       nop
18DA: AA       xor  d
18DB: F8       ret  m
18DC: 38 FF    jr   c,$18DD
18DE: 00       nop
18DF: AA       xor  d
18E0: F8       ret  m
18E1: 10 FF    djnz $18E2
18E3: 00       nop
18E4: AA       xor  d
18E5: F8       ret  m
18E6: 10 FF    djnz $18E7
18E8: 00       nop
18E9: AA       xor  d
18EA: F0       ret  p
18EB: 10 03    djnz $18F0
18ED: 00       nop
18EE: AA       xor  d
18EF: E0       ret  po
18F0: 10 01    djnz $18F3
18F2: 00       nop
18F3: AA       xor  d
18F4: AA       xor  d
18F5: 0C       inc  c
18F6: 18 17    jr   $190F
18F8: 10 1B    djnz $1915
18FA: 0A       ld   a,(bc)
18FB: 1D       dec  e
18FC: 1E 15    ld   e,$15
18FE: 0A       ld   a,(bc)
18FF: 1D       dec  e
1900: 12       ld   (de),a
1901: 18 17    jr   $191A
1903: 1C       inc  e
1904: 24       inc  h
1905: 19       add  hl,de
1906: 15       dec  d
1907: 0A       ld   a,(bc)
1908: 22 0E 1B ld   ($1B0E),hl
190B: 24       inc  h
190C: FF       rst  $38
190D: 19       add  hl,de
190E: 15       dec  d
190F: 0E 0A    ld   c,$0A
1911: 1C       inc  e
1912: 0E 24    ld   c,$24
1914: 0E 17    ld   c,$17
1916: 1D       dec  e
1917: 0E 1B    ld   c,$1B
1919: 24       inc  h
191A: 12       ld   (de),a
191B: 17       rla
191C: 12       ld   (de),a
191D: 1D       dec  e
191E: 12       ld   (de),a
191F: 0A       ld   a,(bc)
1920: 15       dec  d
1921: 1C       inc  e
1922: FF       rst  $38
1923: 2A 24 2A ld   hl,($2A24)
1926: 24       inc  h
1927: 2A FF 19 ld   hl,($19FF)
192A: 15       dec  d
192B: 0E 0A    ld   c,$0A
192D: 1C       inc  e
192E: 0E 24    ld   c,$24
1930: 12       ld   (de),a
1931: 17       rla
1932: 1C       inc  e
1933: 0E 1B    ld   c,$1B
1935: 1D       dec  e
1936: 24       inc  h
1937: 0C       inc  c
1938: 18 12    jr   $194C
193A: 17       rla
193B: 26 1C    ld   h,$1C
193D: 28 FF    jr   z,$193E
193F: 25       dec  h
1940: 24       inc  h
1941: 23       inc  hl
1942: 12       ld   (de),a
1943: 15       dec  d
1944: 0E 0C    ld   c,$0C
1946: 24       inc  h
1947: 25       dec  h
1948: FF       rst  $38
1949: 2A 2A 2A ld   hl,($2A2A)
194C: 2A 2A 2A ld   hl,($2A2A)
194F: 24       inc  h
1950: 02       ld   (bc),a
1951: 00       nop
1952: FF       rst  $38
1953: 19       add  hl,de
1954: 18 12    jr   $1968
1956: 17       rla
1957: 1D       dec  e
1958: 1C       inc  e
1959: FF       rst  $38
195A: 2A 2A 2A ld   hl,($2A2A)
195D: 2A 2A 2A ld   hl,($2A2A)
1960: 24       inc  h
1961: 04       inc  b
1962: 00       nop
1963: FF       rst  $38
1964: 2A 2A 2A ld   hl,($2A2A)
1967: 2A 2A 2A ld   hl,($2A2A)
196A: 24       inc  h
196B: 06 00    ld   b,$00
196D: FF       rst  $38
196E: 2A 2A 24 ld   hl,($242A)
1971: 08       ex   af,af'
1972: 00       nop
1973: 2A 01 00 ld   hl,($0001)
1976: 00       nop
1977: FF       rst  $38
1978: 2A 2A 2A ld   hl,($2A2A)
197B: 2A 24 01 ld   hl,($0124)
197E: 00       nop
197F: 00       nop
1980: 00       nop
1981: FF       rst  $38
1982: 1B       dec  de
1983: 12       ld   (de),a
1984: 19       add  hl,de
1985: 24       inc  h
1986: 18 0F    jr   $1997
1988: 0F       rrca
1989: 20 00    jr   nz,$198B
198B: 00       nop
198C: 00       nop
198D: 00       nop
198E: 00       nop
198F: 20 00    jr   nz,$1991
1991: 00       nop
1992: 00       nop
1993: 00       nop
1994: 00       nop
1995: 20 00    jr   nz,$1997
1997: 00       nop
1998: 00       nop
1999: 00       nop
199A: 00       nop
199B: 20 00    jr   nz,$199D
199D: 00       nop
199E: 00       nop
199F: 00       nop
19A0: 00       nop
19A1: 20 00    jr   nz,$19A3
19A3: 00       nop
19A4: 00       nop
19A5: 00       nop
19A6: 00       nop
19A7: 20 00    jr   nz,$19A9
19A9: 00       nop
19AA: 00       nop
19AB: 00       nop
19AC: 00       nop
19AD: 70       ld   (hl),b
19AE: 00       nop
19AF: 00       nop
19B0: 00       nop
19B1: 00       nop
19B2: 00       nop
19B3: F8       ret  m
19B4: 00       nop
19B5: 00       nop
19B6: 00       nop
19B7: 00       nop
19B8: 00       nop
19B9: FC 01 00 call m,$0001
19BC: 00       nop
19BD: 00       nop
19BE: 00       nop
19BF: FE 03    cp   $03
19C1: 00       nop
19C2: 00       nop
19C3: 00       nop
19C4: 00       nop
19C5: 1E 06    ld   e,$06
19C7: 00       nop
19C8: 00       nop
19C9: 00       nop
19CA: 00       nop
19CB: 0F       rrca
19CC: 08       ex   af,af'
19CD: 00       nop
19CE: 00       nop
19CF: 00       nop
19D0: 00       nop
19D1: 07       rlca
19D2: 10 00    djnz $19D4
19D4: 00       nop
19D5: 00       nop
19D6: 00       nop
19D7: 03       inc  bc
19D8: 20 00    jr   nz,$19DA
19DA: 00       nop
19DB: 00       nop
19DC: 00       nop
19DD: 83       add  a,e
19DE: 23       inc  hl
19DF: 00       nop
19E0: 00       nop
19E1: 00       nop
19E2: 00       nop
19E3: 63       ld   h,e
19E4: 4C       ld   c,h
19E5: 00       nop
19E6: 00       nop
19E7: 00       nop
19E8: 00       nop
19E9: 63       ld   h,e
19EA: 8C       adc  a,h
19EB: 00       nop
19EC: 00       nop
19ED: 00       nop
19EE: 00       nop
19EF: 83       add  a,e
19F0: 03       inc  bc
19F1: 01 00 00 ld   bc,$0000
19F4: 00       nop
19F5: 07       rlca
19F6: 80       add  a,b
19F7: 03       inc  bc
19F8: 00       nop
19F9: 00       nop
19FA: 00       nop
19FB: FF       rst  $38
19FC: FF       rst  $38
19FD: 03       inc  bc
19FE: 00       nop
19FF: 00       nop
1A00: 00       nop
1A01: 07       rlca
1A02: 80       add  a,b
1A03: 07       rlca
1A04: 00       nop
1A05: 00       nop
1A06: 00       nop
1A07: 03       inc  bc
1A08: 00       nop
1A09: 0E 00    ld   c,$00
1A0B: 00       nop
1A0C: 00       nop
1A0D: 61       ld   h,c
1A0E: 18 38    jr   $1A48
1A10: 00       nop
1A11: 00       nop
1A12: 00       nop
1A13: 61       ld   h,c
1A14: 18 D8    jr   $19EE
1A16: 00       nop
1A17: 00       nop
1A18: 00       nop
1A19: 61       ld   h,c
1A1A: 18 18    jr   $1A34
1A1C: 03       inc  bc
1A1D: 00       nop
1A1E: 00       nop
1A1F: 61       ld   h,c
1A20: 18 18    jr   $1A3A
1A22: 0C       inc  c
1A23: 00       nop
1A24: 00       nop
1A25: 61       ld   h,c
1A26: 00       nop
1A27: 18 10    jr   $1A39
1A29: 00       nop
1A2A: 00       nop
1A2B: 61       ld   h,c
1A2C: 00       nop
1A2D: F8       ret  m
1A2E: 3F       ccf
1A2F: 00       nop
1A30: 00       nop
1A31: 61       ld   h,c
1A32: 40       ld   b,b
1A33: 00       nop
1A34: 20 00    jr   nz,$1A36
1A36: 00       nop
1A37: 61       ld   h,c
1A38: 40       ld   b,b
1A39: 00       nop
1A3A: 20 00    jr   nz,$1A3C
1A3C: 00       nop
1A3D: 01 E0 F0 ld   bc,$F0E0
1A40: 3F       ccf
1A41: 00       nop
1A42: 00       nop
1A43: 01 F0 11 ld   bc,$11F0
1A46: 29       add  hl,hl
1A47: 00       nop
1A48: 00       nop
1A49: 01 F8 13 ld   bc,$13F8
1A4C: 29       add  hl,hl
1A4D: 00       nop
1A4E: 00       nop
1A4F: 01 FC 17 ld   bc,$17FC
1A52: 29       add  hl,hl
1A53: 00       nop
1A54: 00       nop
1A55: 01 FE 1F ld   bc,$1FFE
1A58: 29       add  hl,hl
1A59: 00       nop
1A5A: 00       nop
1A5B: 01 02 10 ld   bc,$1002
1A5E: 29       add  hl,hl
1A5F: 00       nop
1A60: 00       nop
1A61: 01 32 13 ld   bc,$1332
1A64: 29       add  hl,hl
1A65: 00       nop
1A66: 00       nop
1A67: 21 32 13 ld   hl,$1332
1A6A: 29       add  hl,hl
1A6B: 00       nop
1A6C: 00       nop
1A6D: 21 FE 1F ld   hl,$1FFE
1A70: 29       add  hl,hl
1A71: 00       nop
1A72: 00       nop
1A73: 21 02 10 ld   hl,$1002
1A76: 29       add  hl,hl
1A77: 00       nop
1A78: 00       nop
1A79: 21 7E 1C ld   hl,$1C7E
1A7C: 29       add  hl,hl
1A7D: 00       nop
1A7E: 00       nop
1A7F: 21 8E 1F ld   hl,$1F8E
1A82: 29       add  hl,hl
1A83: 00       nop
1A84: 00       nop
1A85: 21 02 10 ld   hl,$1002
1A88: 29       add  hl,hl
1A89: 00       nop
1A8A: 00       nop
1A8B: 21 FE 1F ld   hl,$1FFE
1A8E: 29       add  hl,hl
1A8F: 00       nop
1A90: 00       nop
1A91: 21 F2 13 ld   hl,$13F2
1A94: 29       add  hl,hl
1A95: 00       nop
1A96: 00       nop
1A97: 31 02 10 ld   sp,$1002
1A9A: 29       add  hl,hl
1A9B: 00       nop
1A9C: 00       nop
1A9D: 31 F2 13 ld   sp,$13F2
1AA0: 29       add  hl,hl
1AA1: 00       nop
1AA2: 00       nop
1AA3: 31 FE 1F ld   sp,$1FFE
1AA6: 29       add  hl,hl
1AA7: 00       nop
1AA8: 00       nop
1AA9: 31 06 18 ld   sp,$1806
1AAC: 29       add  hl,hl
1AAD: 00       nop
1AAE: 00       nop
1AAF: 31 F2 13 ld   sp,$13F2
1AB2: 29       add  hl,hl
1AB3: 00       nop
1AB4: 00       nop
1AB5: 39       add  hl,sp
1AB6: 32 13 29 ld   ($2913),a
1AB9: 00       nop
1ABA: 00       nop
1ABB: 39       add  hl,sp
1ABC: 06 19    ld   b,$19
1ABE: 29       add  hl,hl
1ABF: 00       nop
1AC0: 00       nop
1AC1: 39       add  hl,sp
1AC2: FE 1F    cp   $1F
1AC4: 29       add  hl,hl
1AC5: 00       nop
1AC6: 00       nop
1AC7: 39       add  hl,sp
1AC8: 02       ld   (bc),a
1AC9: 10 29    djnz $1AF4
1ACB: 00       nop
1ACC: 00       nop
1ACD: 39       add  hl,sp
1ACE: FE FC    cp   $FC
1AD0: 3F       ccf
1AD1: 00       nop
1AD2: 00       nop
1AD3: 39       add  hl,sp
1AD4: 3E FE    ld   a,$FE
1AD6: 3F       ccf
1AD7: 00       nop
1AD8: 00       nop
1AD9: 39       add  hl,sp
1ADA: FE 7C    cp   $7C
1ADC: 7C       ld   a,h
1ADD: 00       nop
1ADE: 00       nop
1ADF: 39       add  hl,sp
1AE0: 02       ld   (bc),a
1AE1: 30 F8    jr   nc,$1ADB
1AE3: 01 00 39 ld   bc,$3900
1AE6: FE 3F    cp   $3F
1AE8: F8       ret  m
1AE9: 07       rlca
1AEA: 00       nop
1AEB: 3D       dec  a
1AEC: 02       ld   (bc),a
1AED: 18 F0    jr   $1ADF
1AEF: 1F       rra
1AF0: 00       nop
1AF1: 3D       dec  a
1AF2: 9E       sbc  a,(hl)
1AF3: 13       inc  de
1AF4: F1       pop  af
1AF5: 7F       ld   a,a
1AF6: 00       nop
1AF7: 3D       dec  a
1AF8: 9E       sbc  a,(hl)
1AF9: 13       inc  de
1AFA: F1       pop  af
1AFB: FF       rst  $38
1AFC: 01 3D 02 ld   bc,$023D
1AFF: 18 F1    jr   $1AF2
1B01: FF       rst  $38
1B02: 07       rlca
1B03: 3D       dec  a
1B04: FE 1F    cp   $1F
1B06: 31 3C 1F ld   sp,$1F3C
1B09: 3D       dec  a
1B0A: FE 1F    cp   $1F
1B0C: 31 39 7F ld   sp,$7F39
1B0F: 3D       dec  a
1B10: FE 1F    cp   $1F
1B12: 31 23 FF ld   sp,$FF23
1B15: 1D       dec  e
1B16: F2 13 31 jp   p,$3113
1B19: 0F       rrca
1B1A: FF       rst  $38
1B1B: 0D       dec  c
1B1C: 02       ld   (bc),a
1B1D: 10 F1    djnz $1B10
1B1F: FF       rst  $38
1B20: FF       rst  $38
1B21: 05       dec  b
1B22: F2 13 31 jp   p,$3113
1B25: 00       nop
1B26: FF       rst  $38
1B27: 01 02 10 ld   bc,$1002
1B2A: 31 33 FF ld   sp,$FF33
1B2D: 02       ld   (bc),a
1B2E: F2 13 30 jp   p,$3013
1B31: 33       inc  sp
1B32: FF       rst  $38
1B33: 04       inc  b
1B34: FE 1F    cp   $1F
1B36: 30 3F    jr   nc,$1B77
1B38: FF       rst  $38
1B39: 08       ex   af,af'
1B3A: F8       ret  m
1B3B: 07       rlca
1B3C: F8       ret  m
1B3D: FF       rst  $38
1B3E: FF       rst  $38
1B3F: 30 00    jr   nc,$1B41
1B41: 00       nop
1B42: 1E 00    ld   e,$00
1B44: 00       nop
1B45: C0       ret  nz
1B46: FF       rst  $38
1B47: FF       rst  $38
1B48: E1       pop  hl
1B49: 00       nop
1B4A: 00       nop
1B4B: 00       nop
1B4C: 81       add  a,c
1B4D: 07       rlca
1B4E: 1C       inc  e
1B4F: 03       inc  bc
1B50: 00       nop
1B51: 80       add  a,b
1B52: 00       nop
1B53: 19       add  hl,de
1B54: C3 00 00 jp   $0000
1B57: C0       ret  nz
1B58: FF       rst  $38
1B59: 73       ld   (hl),e
1B5A: 38 00    jr   c,$1B5C
1B5C: 00       nop
1B5D: 20 00    jr   nz,$1B5F
1B5F: 24       inc  h
1B60: 07       rlca
1B61: 00       nop
1B62: 00       nop
1B63: E0       ret  po
1B64: FF       rst  $38
1B65: C7       rst  $00
1B66: 00       nop
1B67: 00       nop
1B68: 00       nop
1B69: 00       nop
1B6A: 00       nop
1B6B: 00       nop
1B6C: 00       nop
1B6D: 00       nop
1B6E: 00       nop
1B6F: F0       ret  p
1B70: 0F       rrca
1B71: F8       ret  m
1B72: 1F       rra
1B73: FC 3F 3C call m,$3C3F
1B76: 3C       inc  a
1B77: 1C       inc  e
1B78: 38 1C    jr   c,$1B96
1B7A: 38 DC    jr   c,$1B58
1B7C: 39       add  hl,sp
1B7D: DC 39 DC call c,$DC39
1B80: 39       add  hl,sp
1B81: DC 3D FC call c,$FC3D
1B84: 3D       dec  a
1B85: F8       ret  m
1B86: 1D       dec  e
1B87: F0       ret  p
1B88: 0D       dec  c
1B89: 00       nop
1B8A: 00       nop
1B8B: 00       nop
1B8C: 00       nop
1B8D: 00       nop
1B8E: 00       nop
1B8F: FC 0F FC call m,$FC0F
1B92: 1F       rra
1B93: FC 3F C0 call m,$C03F
1B96: 3D       dec  a
1B97: C0       ret  nz
1B98: 39       add  hl,sp
1B99: C0       ret  nz
1B9A: 39       add  hl,sp
1B9B: C0       ret  nz
1B9C: 39       add  hl,sp
1B9D: C0       ret  nz
1B9E: 39       add  hl,sp
1B9F: C0       ret  nz
1BA0: 39       add  hl,sp
1BA1: C0       ret  nz
1BA2: 3D       dec  a
1BA3: FC 3F FC call m,$FC3F
1BA6: 1F       rra
1BA7: FC 0F 00 call m,$000F
1BAA: 00       nop
1BAB: 00       nop
1BAC: 00       nop
1BAD: 00       nop
1BAE: 00       nop
1BAF: FC 0F FC call m,$FC0F
1BB2: 1F       rra
1BB3: FC 3F 00 call m,$003F
1BB6: 3C       inc  a
1BB7: 00       nop
1BB8: 38 FC    jr   c,$1BB6
1BBA: 3F       ccf
1BBB: FC 3F FC call m,$FC3F
1BBE: 3F       ccf
1BBF: 00       nop
1BC0: 38 00    jr   c,$1BC2
1BC2: 3C       inc  a
1BC3: FC 3F FC call m,$FC3F
1BC6: 1F       rra
1BC7: FC 0F 00 call m,$000F
1BCA: 00       nop
1BCB: 00       nop
1BCC: 00       nop
1BCD: 00       nop
1BCE: 00       nop
1BCF: F0       ret  p
1BD0: 0F       rrca
1BD1: F8       ret  m
1BD2: 1F       rra
1BD3: FC 3F BC call m,$BC3F
1BD6: 3D       dec  a
1BD7: 9C       sbc  a,h
1BD8: 39       add  hl,sp
1BD9: 9C       sbc  a,h
1BDA: 39       add  hl,sp
1BDB: 9C       sbc  a,h
1BDC: 39       add  hl,sp
1BDD: 9C       sbc  a,h
1BDE: 39       add  hl,sp
1BDF: 9C       sbc  a,h
1BE0: 39       add  hl,sp
1BE1: 1C       inc  e
1BE2: 38 1C    jr   c,$1C00
1BE4: 38 1C    jr   c,$1C02
1BE6: 38 1C    jr   c,$1C04
1BE8: 38 00    jr   c,$1BEA
1BEA: 00       nop
1BEB: 00       nop
1BEC: 00       nop
1BED: 00       nop
1BEE: 00       nop
1BEF: 00       nop
1BF0: 00       nop
1BF1: 00       nop
1BF2: 00       nop
1BF3: 00       nop
1BF4: 00       nop
1BF5: 00       nop
1BF6: 00       nop
1BF7: 00       nop
1BF8: 00       nop
1BF9: 00       nop
1BFA: 00       nop
1BFB: 00       nop
1BFC: 00       nop
1BFD: 00       nop
1BFE: 00       nop
1BFF: 00       nop
1C00: 00       nop
1C01: 00       nop
1C02: 00       nop
1C03: 00       nop
1C04: 00       nop
1C05: 00       nop
1C06: 00       nop
1C07: 00       nop
1C08: 00       nop
1C09: 00       nop
1C0A: 00       nop
1C0B: 00       nop
1C0C: 00       nop
1C0D: 00       nop
1C0E: 00       nop
1C0F: FC 3F FC call m,$FC3F
1C12: 3F       ccf
1C13: FC 3F E0 call m,$E03F
1C16: 38 E0    jr   c,$1BF8
1C18: 38 E0    jr   c,$1BFA
1C1A: 38 E0    jr   c,$1BFC
1C1C: 38 E0    jr   c,$1BFE
1C1E: 38 E0    jr   c,$1C00
1C20: 38 E0    jr   c,$1C02
1C22: 38 E0    jr   c,$1C04
1C24: 3F       ccf
1C25: C0       ret  nz
1C26: 1F       rra
1C27: 80       add  a,b
1C28: 0F       rrca
1C29: 00       nop
1C2A: 00       nop
1C2B: 00       nop
1C2C: 00       nop
1C2D: 00       nop
1C2E: 00       nop
1C2F: FC 3F FC call m,$FC3F
1C32: 3F       ccf
1C33: FC 3F 1C call m,$1C3F
1C36: 00       nop
1C37: 1C       inc  e
1C38: 00       nop
1C39: 1C       inc  e
1C3A: 00       nop
1C3B: 1C       inc  e
1C3C: 00       nop
1C3D: 1C       inc  e
1C3E: 00       nop
1C3F: 1C       inc  e
1C40: 00       nop
1C41: 1C       inc  e
1C42: 00       nop
1C43: 1C       inc  e
1C44: 00       nop
1C45: 1C       inc  e
1C46: 00       nop
1C47: 1C       inc  e
1C48: 00       nop
1C49: 00       nop
1C4A: 00       nop
1C4B: 00       nop
1C4C: 00       nop
1C4D: 00       nop
1C4E: 00       nop
1C4F: FC 0F FC call m,$FC0F
1C52: 1F       rra
1C53: FC 3F C0 call m,$C03F
1C56: 3D       dec  a
1C57: C0       ret  nz
1C58: 39       add  hl,sp
1C59: C0       ret  nz
1C5A: 39       add  hl,sp
1C5B: C0       ret  nz
1C5C: 39       add  hl,sp
1C5D: C0       ret  nz
1C5E: 39       add  hl,sp
1C5F: C0       ret  nz
1C60: 39       add  hl,sp
1C61: C0       ret  nz
1C62: 3D       dec  a
1C63: FC 3F FC call m,$FC3F
1C66: 1F       rra
1C67: FC 0F 00 call m,$000F
1C6A: 00       nop
1C6B: 00       nop
1C6C: 00       nop
1C6D: 00       nop
1C6E: 00       nop
1C6F: FC 3F FC call m,$FC3F
1C72: 3F       ccf
1C73: FC 3F 00 call m,$003F
1C76: 1E 00    ld   e,$00
1C78: 0F       rrca
1C79: 80       add  a,b
1C7A: 07       rlca
1C7B: C0       ret  nz
1C7C: 03       inc  bc
1C7D: E0       ret  po
1C7E: 01 F0 00 ld   bc,$00F0
1C81: 78       ld   a,b
1C82: 00       nop
1C83: FC 3F FC call m,$FC3F
1C86: 3F       ccf
1C87: FC 3F 00 call m,$003F
1C8A: 00       nop
1C8B: 00       nop
1C8C: 00       nop
1C8D: 00       nop
1C8E: 00       nop
1C8F: 10 00    djnz $1C91
1C91: 10 00    djnz $1C93
1C93: 10 00    djnz $1C95
1C95: 10 00    djnz $1C97
1C97: 38 00    jr   c,$1C99
1C99: 38 00    jr   c,$1C9B
1C9B: 78       ld   a,b
1C9C: 00       nop
1C9D: 78       ld   a,b
1C9E: 00       nop
1C9F: F8       ret  m
1CA0: 00       nop
1CA1: 78       ld   a,b
1CA2: 01 78 02 ld   bc,$0278
1CA5: 78       ld   a,b
1CA6: 04       inc  b
1CA7: 78       ld   a,b
1CA8: 04       inc  b
1CA9: 78       ld   a,b
1CAA: 04       inc  b
1CAB: F8       ret  m
1CAC: 07       rlca
1CAD: C8       ret  z
1CAE: 06 A8    ld   b,$A8
1CB0: 06 68    ld   b,$68
1CB2: 06 E8    ld   b,$E8
1CB4: 06 F8    ld   b,$F8
1CB6: 07       rlca
1CB7: F8       ret  m
1CB8: 07       rlca
1CB9: E8       ret  pe
1CBA: 06 08    ld   b,$08
1CBC: 06 E8    ld   b,$E8
1CBE: 06 F8    ld   b,$F8
1CC0: 07       rlca
1CC1: F8       ret  m
1CC2: 07       rlca
1CC3: 08       ex   af,af'
1CC4: 06 E8    ld   b,$E8
1CC6: 07       rlca
1CC7: E8       ret  pe
1CC8: 07       rlca
1CC9: F8       ret  m
1CCA: 07       rlca
1CCB: F8       ret  m
1CCC: 07       rlca
1CCD: 08       ex   af,af'
1CCE: 06 A8    ld   b,$A8
1CD0: 06 E8    ld   b,$E8
1CD2: 06 F8    ld   b,$F8
1CD4: 07       rlca
1CD5: F8       ret  m
1CD6: 07       rlca
1CD7: 08       ex   af,af'
1CD8: 06 E8    ld   b,$E8
1CDA: 06 E8    ld   b,$E8
1CDC: 0E F8    ld   c,$F8
1CDE: 1F       rra
1CDF: F8       ret  m
1CE0: 3F       ccf
1CE1: F8       ret  m
1CE2: 7F       ld   a,a
1CE3: F8       ret  m
1CE4: FF       rst  $38
1CE5: F8       ret  m
1CE6: FF       rst  $38
1CE7: F8       ret  m
1CE8: FF       rst  $38
1CE9: F8       ret  m
1CEA: FF       rst  $38
1CEB: F0       ret  p
1CEC: 03       inc  bc
1CED: E0       ret  po
1CEE: 01 80 00 ld   bc,$0080
1CF1: 80       add  a,b
1CF2: 00       nop
1CF3: 80       add  a,b
1CF4: 00       nop
1CF5: 80       add  a,b
1CF6: 00       nop
1CF7: 80       add  a,b
1CF8: 00       nop
1CF9: 80       add  a,b
1CFA: 00       nop
1CFB: 80       add  a,b
1CFC: 00       nop
1CFD: 40       ld   b,b
1CFE: 01 20 02 ld   bc,$0220
1D01: 10 04    djnz $1D07
1D03: 08       ex   af,af'
1D04: 08       ex   af,af'
1D05: 04       inc  b
1D06: 10 FE    djnz $1D06
1D08: 3F       ccf
1D09: FC 1F 1C call m,$1C1F
1D0C: 1C       inc  e
1D0D: 5C       ld   e,h
1D0E: 1D       dec  e
1D0F: DC 1D FC call c,$FC1D
1D12: 1F       rra
1D13: FC 1F 1C call m,$1C1F
1D16: 1C       inc  e
1D17: DC 1F DC call c,$DC1F
1D1A: 1F       rra
1D1B: FC 1F FC call m,$FC1F
1D1E: 1F       rra
1D1F: 1C       inc  e
1D20: 1C       inc  e
1D21: 5C       ld   e,h
1D22: 1D       dec  e
1D23: DC 1D FC call c,$FC1D
1D26: 1F       rra
1D27: FC 1F 1C call m,$1C1F
1D2A: 1C       inc  e
1D2B: DC 1D DC call c,$DC1D
1D2E: 1D       dec  e
1D2F: FC 1F FC call m,$FC1F
1D32: 1F       rra
1D33: FC 1D 1C call m,$1C1D
1D36: 1C       inc  e
1D37: FC 1D FC call m,$FC1D
1D3A: 1F       rra
1D3B: FC 1F 1C call m,$1C1F
1D3E: 1C       inc  e
1D3F: 3C       inc  a
1D40: 1D       dec  e
1D41: 5C       ld   e,h
1D42: 1C       inc  e
1D43: FC 1F FC call m,$FC1F
1D46: 1F       rra
1D47: 1C       inc  e
1D48: 1C       inc  e
1D49: DC 1D 1C call c,$1C1D
1D4C: 1C       inc  e
1D4D: FC 1F FC call m,$FC1F
1D50: 1F       rra
1D51: 1C       inc  e
1D52: 1C       inc  e
1D53: 7C       ld   a,h
1D54: 1E 3C    ld   e,$3C
1D56: 1F       rra
1D57: 1C       inc  e
1D58: 1C       inc  e
1D59: FC 1F FC call m,$FC1F
1D5C: 1F       rra
1D5D: DC 1D 1C call c,$1C1D
1D60: 1C       inc  e
1D61: DC 1D FC call c,$FC1D
1D64: 1F       rra
1D65: FC 1F 1C call m,$1C1F
1D68: 1C       inc  e
1D69: DC 1D DC call c,$DC1D
1D6C: 1D       dec  e
1D6D: FC 1F FC call m,$FC1F
1D70: 1F       rra
1D71: 5C       ld   e,h
1D72: 1C       inc  e
1D73: 5C       ld   e,h
1D74: 1D       dec  e
1D75: 1C       inc  e
1D76: 1D       dec  e
1D77: FC 1F FC call m,$FC1F
1D7A: 1F       rra
1D7B: 00       nop
1D7C: 00       nop
1D7D: 2C       inc  l
1D7E: 24       inc  h
1D7F: 01 09 08 ld   bc,$0809
1D82: 01 FF C3 ld   bc,$C3FF
1D85: FE 0D    cp   $0D
1D87: 3A E0 20 ld   a,($20E0)
1D8A: A7       and  a
1D8B: CA 9A 15 jp   z,$159A
1D8E: 3D       dec  a
1D8F: 32 E0 20 ld   ($20E0),a
1D92: C2 9A 15 jp   nz,$159A
1D95: 3E 01    ld   a,$01
1D97: CD 1D 01 call $011D
1D9A: D5       push de
1D9B: AF       xor  a
1D9C: 32 87 22 ld   ($2287),a
1D9F: 11 7C 18 ld   de,$187C
1DA2: C5       push bc
1DA3: E5       push hl
1DA4: 3A B8 20 ld   a,($20B8)
1DA7: A7       and  a
1DA8: C2 08 16 jp   nz,$1608
1DAB: 3A B2 20 ld   a,($20B2)
1DAE: E6 80    and  $80
1DB0: CA 22 17 jp   z,$1722
1DB3: 3A A2 20 ld   a,($20A2)
1DB6: E6 80    and  $80
1DB8: CA CA 15 jp   z,$15CA
1DBB: CD 40 07 call $0740
1DBE: E1       pop  hl
1DBF: E7       rst  $20
1DC0: 7C       ld   a,h
1DC1: FE 27    cp   $27
1DC3: DA 24 16 jp   c,$1624
1DC6: E5       push hl
1DC7: 11 7C 18 ld   de,$187C
1DCA: CD FE 06 call $06FE
1DCD: E1       pop  hl
1DCE: C1       pop  bc
1DCF: D1       pop  de
1DD0: AF       xor  a
1DD1: 32 9E 20 ld   ($209E),a
1DD4: C3 13 04 jp   $0413
1DD7: 2A 5E 22 ld   hl,($225E)
1DDA: CD 34 15 call $1534
1DDD: EB       ex   de,hl
1DDE: 2A 87 20 ld   hl,($2087)
1DE1: 2C       inc  l
1DE2: 2C       inc  l
1DE3: 19       add  hl,de
1DE4: 7C       ld   a,h
1DE5: A7       and  a
1DE6: C2 FD 15 jp   nz,$15FD
1DE9: 7D       ld   a,l
1DEA: E6 1F    and  $1F
1DEC: C2 A7 08 jp   nz,$08A7
1DEF: 7D       ld   a,l
1DF0: FE 60    cp   $60
1DF2: D2 A7 08 jp   nc,$08A7
1DF5: 3E 01    ld   a,$01
1DF7: 32 B8 20 ld   ($20B8),a
1DFA: C3 B4 08 jp   $08B4
1DFD: CD 34 15 call $1534
1E00: 7C       ld   a,h
1E01: A7       and  a
1E02: CA E9 15 jp   z,$15E9
1E05: C3 A7 08 jp   $08A7
1E08: 3E 7F    ld   a,$7F
1E0A: 32 82 22 ld   ($2282),a
1E0D: 3E 98    ld   a,$98
1E0F: CD 1D 01 call $011D
1E12: FB       ei
1E13: 3A 79 50 ld   a,($5079)
1E16: FE 38    cp   $38
1E18: C2 13 16 jp   nz,$1613
1E1B: 3A 51 50 ld   a,($5051)
1E1E: FE AA    cp   $AA
1E20: C2 1B 16 jp   nz,$161B
1E23: E1       pop  hl
1E24: C1       pop  bc
1E25: D1       pop  de
1E26: AF       xor  a
1E27: 32 A0 20 ld   ($20A0),a
1E2A: C3 16 03 jp   $0316
1E2D: 0E 03    ld   c,$03
1E2F: 46       ld   b,(hl)
1E30: 1A       ld   a,(de)
1E31: B8       cp   b
1E32: CA 3B 16 jp   z,$163B
1E35: DA 43 16 jp   c,$1643
1E38: 3E 02    ld   a,$02
1E3A: C9       ret
1E3B: 0D       dec  c
1E3C: 23       inc  hl
1E3D: 13       inc  de
1E3E: C2 2F 16 jp   nz,$162F
1E41: AF       xor  a
1E42: C9       ret
1E43: 3E 01    ld   a,$01
1E45: C9       ret
1E46: 11 AC 20 ld   de,$20AC
1E49: 3E 02    ld   a,$02
1E4B: 32 B9 20 ld   ($20B9),a
1E4E: C3 A6 04 jp   $04A6
1E51: 21 A9 20 ld   hl,$20A9
1E54: C3 BF 04 jp   $04BF
1E57: AF       xor  a
1E58: C3 CF 04 jp   $04CF
1E5B: 2A BA 20 ld   hl,($20BA)
1E5E: 7C       ld   a,h
1E5F: A7       and  a
1E60: CA 16 03 jp   z,$0316
1E63: 2B       dec  hl
1E64: 22 BA 20 ld   ($20BA),hl
1E67: 7C       ld   a,h
1E68: A7       and  a
1E69: CA DA 16 jp   z,$16DA
1E6C: 7D       ld   a,l
1E6D: E6 03    and  $03
1E6F: C2 16 03 jp   nz,$0316
1E72: 3E 96    ld   a,$96
1E74: CD 1D 01 call $011D
1E77: 3A 01 50 ld   a,($5001)
1E7A: FE 7D    cp   $7D
1E7C: C2 77 16 jp   nz,$1677
1E7F: 3E 97    ld   a,$97
1E81: CD 1D 01 call $011D
1E84: 3A 02 50 ld   a,($5002)
1E87: FE F4    cp   $F4
1E89: C2 84 16 jp   nz,$1684
1E8C: CD E5 04 call $04E5
1E8F: CD AB 0B call $0BAB
1E92: 17       rla
1E93: 17       rla
1E94: DA A7 16 jp   c,$16A7
1E97: 17       rla
1E98: DA 10 17 jp   c,$1710
1E9B: E6 80    and  $80
1E9D: C2 C9 16 jp   nz,$16C9
1EA0: AF       xor  a
1EA1: 32 C5 20 ld   ($20C5),a
1EA4: C3 16 03 jp   $0316
1EA7: 2A BC 20 ld   hl,($20BC)
1EAA: 7E       ld   a,(hl)
1EAB: 3C       inc  a
1EAC: FE 25    cp   $25
1EAE: CA F0 16 jp   z,$16F0
1EB1: 77       ld   (hl),a
1EB2: 6F       ld   l,a
1EB3: 26 00    ld   h,$00
1EB5: 11 80 4E ld   de,$4E80
1EB8: 29       add  hl,hl
1EB9: 29       add  hl,hl
1EBA: 29       add  hl,hl
1EBB: 19       add  hl,de
1EBC: EB       ex   de,hl
1EBD: 2A BE 20 ld   hl,($20BE)
1EC0: 01 20 00 ld   bc,$0020
1EC3: CD D3 0E call $0ED3
1EC6: C3 16 03 jp   $0316
1EC9: 3A C5 20 ld   a,($20C5)
1ECC: A7       and  a
1ECD: C2 16 03 jp   nz,$0316
1ED0: 3A C0 20 ld   a,($20C0)
1ED3: 3D       dec  a
1ED4: 32 C0 20 ld   ($20C0),a
1ED7: C2 F5 16 jp   nz,$16F5
1EDA: AF       xor  a
1EDB: 32 BB 20 ld   ($20BB),a
1EDE: CD 2C 09 call $092C
1EE1: AF       xor  a
1EE2: 32 05 58 ld   ($5805),a
1EE5: 3A B2 20 ld   a,($20B2)
1EE8: E6 F3    and  $F3
1EEA: 32 B2 20 ld   ($20B2),a
1EED: C3 16 03 jp   $0316
1EF0: 3E 0A    ld   a,$0A
1EF2: C3 B1 16 jp   $16B1
1EF5: 2A BC 20 ld   hl,($20BC)
1EF8: 23       inc  hl
1EF9: 22 BC 20 ld   ($20BC),hl
1EFC: EB       ex   de,hl
1EFD: 2A BE 20 ld   hl,($20BE)
1F00: 24       inc  h
1F01: 24       inc  h
1F02: 22 BE 20 ld   ($20BE),hl
1F05: 3E 01    ld   a,$01
1F07: 32 C5 20 ld   ($20C5),a
1F0A: 3E 0A    ld   a,$0A
1F0C: EB       ex   de,hl
1F0D: C3 B1 16 jp   $16B1
1F10: 2A BC 20 ld   hl,($20BC)
1F13: 7E       ld   a,(hl)
1F14: 3D       dec  a
1F15: FE 09    cp   $09
1F17: CA 1D 17 jp   z,$171D
1F1A: C3 B1 16 jp   $16B1
1F1D: 3E 24    ld   a,$24
1F1F: C3 B1 16 jp   $16B1
1F22: 3A BB 20 ld   a,($20BB)
1F25: A7       and  a
1F26: C2 CA 15 jp   nz,$15CA
1F29: C3 BB 15 jp   $15BB
1F2C: 3A 83 22 ld   a,($2283)
1F2F: 32 C8 20 ld   ($20C8),a
1F32: 21 16 40 ld   hl,$4016
1F35: 22 C9 20 ld   ($20C9),hl
1F38: 21 04 40 ld   hl,$4004
1F3B: 22 CB 20 ld   ($20CB),hl
1F3E: AF       xor  a
1F3F: 32 83 22 ld   ($2283),a
1F42: 32 82 22 ld   ($2282),a
1F45: 32 A5 20 ld   ($20A5),a
1F48: 3A B2 20 ld   a,($20B2)
1F4B: F6 0C    or   $0C
1F4D: 32 B2 20 ld   ($20B2),a
1F50: 3E 80    ld   a,$80
1F52: 32 CD 20 ld   ($20CD),a
1F55: FB       ei
1F56: CD 2C 09 call $092C
1F59: 11 00 4A ld   de,$4A00
1F5C: 21 13 28 ld   hl,$2813
1F5F: CD FE 06 call $06FE
1F62: 3A 83 20 ld   a,($2083)
1F65: A7       and  a
1F66: CA 79 17 jp   z,$1779
1F69: F3       di
1F6A: AF       xor  a
1F6B: 32 A0 20 ld   ($20A0),a
1F6E: 3A B2 20 ld   a,($20B2)
1F71: E6 F3    and  $F3
1F73: 32 B2 20 ld   ($20B2),a
1F76: C3 16 03 jp   $0316
1F79: 11 49 19 ld   de,$1949
1F7C: 21 13 2C ld   hl,$2C13
1F7F: CD B1 0E call $0EB1
1F82: 24       inc  h
1F83: CD 6A 18 call $186A
1F86: 11 BA 40 ld   de,$40BA
1F89: 21 11 28 ld   hl,$2811
1F8C: CD FE 06 call $06FE
1F8F: 11 5A 19 ld   de,$195A
1F92: 21 11 2C ld   hl,$2C11
1F95: CD B1 0E call $0EB1
1F98: 24       inc  h
1F99: CD 6A 18 call $186A
1F9C: 11 79 42 ld   de,$4279
1F9F: 21 0F 28 ld   hl,$280F
1FA2: CD FE 06 call $06FE
1FA5: 11 64 19 ld   de,$1964
1FA8: 21 0F 2C ld   hl,$2C0F
1FAB: CD B1 0E call $0EB1
1FAE: 24       inc  h
1FAF: CD 6A 18 call $186A
1FB2: 11 06 44 ld   de,$4406
1FB5: 21 0D 28 ld   hl,$280D
1FB8: CD FE 06 call $06FE
1FBB: 11 6E 19 ld   de,$196E
1FBE: 21 0D 2C ld   hl,$2C0D
1FC1: CD B1 0E call $0EB1
1FC4: 24       inc  h
1FC5: CD 6A 18 call $186A
1FC8: 11 11 46 ld   de,$4611
1FCB: 21 0A 28 ld   hl,$280A
1FCE: CD FE 06 call $06FE
1FD1: 11 78 19 ld   de,$1978
1FD4: 21 0B 2C ld   hl,$2C0B
1FD7: CD B1 0E call $0EB1
1FDA: 24       inc  h
1FDB: CD 6A 18 call $186A
1FDE: 11 6F 1B ld   de,$1B6F
1FE1: 21 87 28 ld   hl,$2887
1FE4: 01 02 90 ld   bc,$9002
1FE7: CD 30 18 call $1830
1FEA: 11 89 19 ld   de,$1989
1FED: 2A C9 20 ld   hl,($20C9)
1FF0: 7C       ld   a,h
1FF1: FE 27    cp   $27
1FF3: C2 22 18 jp   nz,$1822
1FF6: 2A CB 20 ld   hl,($20CB)
1FF9: 7C       ld   a,h
1FFA: FE 26    cp   $26
1FFC: CA 3E 02 jp   z,$023E
1FFF: E7       rst  $20
4000: 00       nop
4001: 00       nop
4002: 6F       ld   l,a
4003: EF       rst  $28
4004: AA       xor  d
4005: 00       nop
4006: 00       nop
4007: 7E       ld   a,(hl)
4008: 7F       ld   a,a
4009: AA       xor  d
400A: 00       nop
400B: 00       nop
400C: 3E 3E    ld   a,$3E
400E: AA       xor  d
400F: 00       nop
4010: 00       nop
4011: 1C       inc  e
4012: 1C       inc  e
4013: AA       xor  d
4014: AA       xor  d
4015: C0       ret  nz
4016: C0       ret  nz
4017: FD 9D    sbc  a,iyl
4019: 03       inc  bc
401A: 03       inc  bc
401B: AA       xor  d
401C: C0       ret  nz
401D: C0       ret  nz
401E: F1       pop  af
401F: 19       add  hl,de
4020: 01 03 AA ld   bc,$AA03
4023: 80       add  a,b
4024: 80       add  a,b
4025: FF       rst  $38
4026: 9F       sbc  a,a
4027: 00       nop
4028: 01 AA 00 ld   bc,$00AA
402B: 00       nop
402C: 47       ld   b,a
402D: FE 00    cp   $00
402F: 01 AA 00 ld   bc,$00AA
4032: 00       nop
4033: 3F       ccf
4034: F8       ret  m
4035: AA       xor  d
4036: 00       nop
4037: 00       nop
4038: 30 30    jr   nc,$406A
403A: AA       xor  d
403B: AA       xor  d
403C: F0       ret  p
403D: F0       ret  p
403E: F9       ld   sp,hl
403F: FD       db   $fd
4040: 07       rlca
4041: 0F       rrca
4042: AA       xor  d
4043: D0       ret  nc
4044: D0       ret  nc
4045: F1       pop  af
4046: 1F       rra
4047: 07       rlca
4048: 0F       rrca
4049: AA       xor  d
404A: E0       ret  po
404B: D0       ret  nc
404C: F1       pop  af
404D: 0F       rrca
404E: 03       inc  bc
404F: 0E AA    ld   c,$AA
4051: 80       add  a,b
4052: E0       ret  po
4053: 13       inc  de
4054: 17       rla
4055: 03       inc  bc
4056: 0E AA    ld   c,$AA
4058: 00       nop
4059: C0       ret  nz
405A: 0F       rrca
405B: E7       rst  $20
405C: 03       inc  bc
405D: 07       rlca
405E: AA       xor  d
405F: 00       nop
4060: 00       nop
4061: 1E CC    ld   e,$CC
4063: 01 03 AA ld   bc,$AA03
4066: 00       nop
4067: 00       nop
4068: FE FC    cp   $FC
406A: 00       nop
406B: 01 AA 00 ld   bc,$00AA
406E: 00       nop
406F: 7C       ld   a,h
4070: F0       ret  p
4071: AA       xor  d
4072: AA       xor  d
4073: FC FC 3F call m,$3FFC
4076: 1F       rra
4077: 1F       rra
4078: 1F       rra
4079: AA       xor  d
407A: FC FC 71 call m,$71FC
407D: 0F       rrca
407E: 1F       rra
407F: 37       scf
4080: AA       xor  d
4081: FC FC E3 call m,$E3FC
4084: C1       pop  bc
4085: 1F       rra
4086: 33       inc  sp
4087: AA       xor  d
4088: C8       ret  z
4089: 1C       inc  e
408A: C3 E3 0D jp   $0DE3
408D: 33       inc  sp
408E: AA       xor  d
408F: 98       sbc  a,b
4090: 98       sbc  a,b
4091: FF       rst  $38
4092: F3       di
4093: 0C       inc  c
4094: 33       inc  sp
4095: AA       xor  d
4096: 30 98    jr   nc,$4030
4098: 7F       ld   a,a
4099: FF       rst  $38
409A: 0C       inc  c
409B: 33       inc  sp
409C: AA       xor  d
409D: E0       ret  po
409E: D0       ret  nc
409F: 3E FF    ld   a,$FF
40A1: 0E 1B    ld   c,$1B
40A3: AA       xor  d
40A4: C0       ret  nz
40A5: E0       ret  po
40A6: FF       rst  $38
40A7: BF       cp   a
40A8: 07       rlca
40A9: 1F       rra
40AA: AA       xor  d
40AB: 80       add  a,b
40AC: C0       ret  nz
40AD: FF       rst  $38
40AE: FF       rst  $38
40AF: 07       rlca
40B0: 0F       rrca
40B1: AA       xor  d
40B2: 00       nop
40B3: 00       nop
40B4: 8E       adc  a,(hl)
40B5: C0       ret  nz
40B6: 03       inc  bc
40B7: 07       rlca
40B8: AA       xor  d
40B9: AA       xor  d
40BA: FE CE    cp   $CE
40BC: AA       xor  d
40BD: CE CF    adc  a,$CF
40BF: AA       xor  d
40C0: CF       rst  $08
40C1: 7C       ld   a,h
40C2: AA       xor  d
40C3: 7C       ld   a,h
40C4: 34       inc  (hl)
40C5: AA       xor  d
40C6: 34       inc  (hl)
40C7: 52       ld   d,d
40C8: AA       xor  d
40C9: 52       ld   d,d
40CA: 51       ld   d,c
40CB: AA       xor  d
40CC: 51       ld   d,c
40CD: 48       ld   c,b
40CE: AA       xor  d
40CF: 48       ld   c,b
40D0: 44       ld   b,h
40D1: AA       xor  d
40D2: 44       ld   b,h
40D3: 22 AA 22 ld   ($22AA),hl
40D6: 1F       rra
40D7: AA       xor  d
40D8: 1F       rra
40D9: 00       nop
40DA: AA       xor  d
40DB: AA       xor  d
40DC: FC 9C 01 call m,$019C
40DF: 01 AA 9C ld   bc,$9CAA
40E2: 9E       sbc  a,(hl)
40E3: 01 01 AA ld   bc,$AA01
40E6: 9E       sbc  a,(hl)
40E7: F8       ret  m
40E8: 01 00 AA ld   bc,$AA00
40EB: F8       ret  m
40EC: A4       and  h
40ED: AA       xor  d
40EE: A4       and  h
40EF: 22 00 01 ld   ($0100),hl
40F2: AA       xor  d
40F3: 22 40 01 ld   ($0140),hl
40F6: 01 AA 40 ld   bc,$40AA
40F9: 20 01    jr   nz,$40FC
40FB: 01 AA 20 ld   bc,$20AA
40FE: 10 01    djnz $4101
4100: 01 AA 10 ld   bc,$10AA
4103: 88       adc  a,b
4104: 01 00 AA ld   bc,$AA00
4107: 88       adc  a,b
4108: 7C       ld   a,h
4109: AA       xor  d
410A: 7C       ld   a,h
410B: 00       nop
410C: AA       xor  d
410D: AA       xor  d
410E: AA       xor  d
410F: F8       ret  m
4110: 38 03    jr   c,$4115
4112: 03       inc  bc
4113: AA       xor  d
4114: 38 3C    jr   c,$4152
4116: 03       inc  bc
4117: 03       inc  bc
4118: AA       xor  d
4119: 3C       inc  a
411A: F0       ret  p
411B: 03       inc  bc
411C: 01 AA F0 ld   bc,$F0AA
411F: 50       ld   d,b
4120: 01 02 AA ld   bc,$AA02
4123: 50       ld   d,b
4124: 90       sub  b
4125: 02       ld   (bc),a
4126: 04       inc  b
4127: AA       xor  d
4128: 90       sub  b
4129: 88       adc  a,b
412A: 04       inc  b
412B: 04       inc  b
412C: AA       xor  d
412D: 88       adc  a,b
412E: 84       add  a,h
412F: 04       inc  b
4130: 04       inc  b
4131: AA       xor  d
4132: 84       add  a,h
4133: 80       add  a,b
4134: 04       inc  b
4135: 04       inc  b
4136: AA       xor  d
4137: 80       add  a,b
4138: 40       ld   b,b
4139: 04       inc  b
413A: 04       inc  b
413B: AA       xor  d
413C: 40       ld   b,b
413D: 20 04    jr   nz,$4143
413F: 02       ld   (bc),a
4140: AA       xor  d
4141: 20 F0    jr   nz,$4133
4143: 02       ld   (bc),a
4144: 01 AA F0 ld   bc,$F0AA
4147: 00       nop
4148: 01 00 AA ld   bc,$AA00
414B: AA       xor  d
414C: F0       ret  p
414D: 70       ld   (hl),b
414E: 07       rlca
414F: 06 AA    ld   b,$AA
4151: 70       ld   (hl),b
4152: 78       ld   a,b
4153: 06 06    ld   b,$06
4155: AA       xor  d
4156: 78       ld   a,b
4157: E0       ret  po
4158: 06 03    ld   b,$03
415A: AA       xor  d
415B: E0       ret  po
415C: A0       and  b
415D: 03       inc  bc
415E: 04       inc  b
415F: AA       xor  d
4160: A0       and  b
4161: 20 04    jr   nz,$4167
4163: 09       add  hl,bc
4164: AA       xor  d
4165: 20 20    jr   nz,$4187
4167: 09       add  hl,bc
4168: 09       add  hl,bc
4169: AA       xor  d
416A: 20 18    jr   nz,$4184
416C: 09       add  hl,bc
416D: 09       add  hl,bc
416E: AA       xor  d
416F: 18 00    jr   $4171
4171: 09       add  hl,bc
4172: 09       add  hl,bc
4173: AA       xor  d
4174: 00       nop
4175: 00       nop
4176: 09       add  hl,bc
4177: 09       add  hl,bc
4178: AA       xor  d
4179: 00       nop
417A: 00       nop
417B: 09       add  hl,bc
417C: 09       add  hl,bc
417D: AA       xor  d
417E: 00       nop
417F: 80       add  a,b
4180: 09       add  hl,bc
4181: 07       rlca
4182: AA       xor  d
4183: 80       add  a,b
4184: 00       nop
4185: 07       rlca
4186: 00       nop
4187: AA       xor  d
4188: AA       xor  d
4189: E0       ret  po
418A: E0       ret  po
418B: 0F       rrca
418C: 0C       inc  c
418D: AA       xor  d
418E: E0       ret  po
418F: F0       ret  p
4190: 0C       inc  c
4191: 0C       inc  c
4192: AA       xor  d
4193: F0       ret  p
4194: C0       ret  nz
4195: 0C       inc  c
4196: 07       rlca
4197: AA       xor  d
4198: C0       ret  nz
4199: 40       ld   b,b
419A: 07       rlca
419B: 09       add  hl,bc
419C: AA       xor  d
419D: 40       ld   b,b
419E: 40       ld   b,b
419F: 09       add  hl,bc
41A0: 12       ld   (de),a
41A1: AA       xor  d
41A2: 40       ld   b,b
41A3: 40       ld   b,b
41A4: 12       ld   (de),a
41A5: 12       ld   (de),a
41A6: AA       xor  d
41A7: 40       ld   b,b
41A8: 30 12    jr   nc,$41BC
41AA: 12       ld   (de),a
41AB: AA       xor  d
41AC: 30 00    jr   nc,$41AE
41AE: 12       ld   (de),a
41AF: 12       ld   (de),a
41B0: AA       xor  d
41B1: 00       nop
41B2: 00       nop
41B3: 12       ld   (de),a
41B4: 12       ld   (de),a
41B5: AA       xor  d
41B6: 00       nop
41B7: 00       nop
41B8: 12       ld   (de),a
41B9: 12       ld   (de),a
41BA: AA       xor  d
41BB: 00       nop
41BC: 00       nop
41BD: 12       ld   (de),a
41BE: 0F       rrca
41BF: AA       xor  d
41C0: 00       nop
41C1: 00       nop
41C2: 0F       rrca
41C3: 00       nop
41C4: AA       xor  d
41C5: AA       xor  d
41C6: C0       ret  nz
41C7: C0       ret  nz
41C8: 1F       rra
41C9: 19       add  hl,de
41CA: AA       xor  d
41CB: C0       ret  nz
41CC: E0       ret  po
41CD: 19       add  hl,de
41CE: 19       add  hl,de
41CF: AA       xor  d
41D0: E0       ret  po
41D1: 80       add  a,b
41D2: 19       add  hl,de
41D3: 0F       rrca
41D4: AA       xor  d
41D5: 80       add  a,b
41D6: 80       add  a,b
41D7: 0F       rrca
41D8: 12       ld   (de),a
41D9: AA       xor  d
41DA: 80       add  a,b
41DB: 80       add  a,b
41DC: 12       ld   (de),a
41DD: 24       inc  h
41DE: AA       xor  d
41DF: 80       add  a,b
41E0: 40       ld   b,b
41E1: 24       inc  h
41E2: 24       inc  h
41E3: AA       xor  d
41E4: 40       ld   b,b
41E5: 20 24    jr   nz,$420B
41E7: 24       inc  h
41E8: AA       xor  d
41E9: 20 00    jr   nz,$41EB
41EB: 24       inc  h
41EC: 24       inc  h
41ED: AA       xor  d
41EE: 00       nop
41EF: 00       nop
41F0: 24       inc  h
41F1: 22 AA 00 ld   ($00AA),hl
41F4: 00       nop
41F5: 22 11 AA ld   ($AA11),hl
41F8: 00       nop
41F9: 80       add  a,b
41FA: 11 0F AA ld   de,$AA0F
41FD: 80       add  a,b
41FE: 00       nop
41FF: 0F       rrca
4200: 00       nop
4201: AA       xor  d
4202: AA       xor  d
4203: 80       add  a,b
4204: 80       add  a,b
4205: 3F       ccf
4206: 33       inc  sp
4207: AA       xor  d
4208: 80       add  a,b
4209: C0       ret  nz
420A: 33       inc  sp
420B: 33       inc  sp
420C: AA       xor  d
420D: C0       ret  nz
420E: 00       nop
420F: 33       inc  sp
4210: 1F       rra
4211: AA       xor  d
4212: 00       nop
4213: 80       add  a,b
4214: 1F       rra
4215: 14       inc  d
4216: AA       xor  d
4217: 80       add  a,b
4218: 40       ld   b,b
4219: 14       inc  d
421A: 24       inc  h
421B: AA       xor  d
421C: 40       ld   b,b
421D: 00       nop
421E: 24       inc  h
421F: 28 AA    jr   z,$41CB
4221: 00       nop
4222: 00       nop
4223: 28 24    jr   z,$4249
4225: AA       xor  d
4226: 00       nop
4227: 00       nop
4228: 24       inc  h
4229: 22 AA 00 ld   ($00AA),hl
422C: 00       nop
422D: 22 11 AA ld   ($AA11),hl
4230: 00       nop
4231: 80       add  a,b
4232: 11 0F AA ld   de,$AA0F
4235: 80       add  a,b
4236: 00       nop
4237: 0F       rrca
4238: 00       nop
4239: AA       xor  d
423A: AA       xor  d
423B: 00       nop
423C: 00       nop
423D: 7F       ld   a,a
423E: 67       ld   h,a
423F: AA       xor  d
4240: 00       nop
4241: 80       add  a,b
4242: 67       ld   h,a
4243: 67       ld   h,a
4244: AA       xor  d
4245: 80       add  a,b
4246: 00       nop
4247: 67       ld   h,a
4248: 3E AA    ld   a,$AA
424A: 00       nop
424B: 00       nop
424C: 3E 1A    ld   a,$1A
424E: AA       xor  d
424F: 00       nop
4250: 00       nop
4251: 1A       ld   a,(de)
4252: 29       add  hl,hl
4253: AA       xor  d
4254: 00       nop
4255: 80       add  a,b
4256: 29       add  hl,hl
4257: 28 AA    jr   z,$4203
4259: 80       add  a,b
425A: 00       nop
425B: 28 24    jr   z,$4281
425D: AA       xor  d
425E: 00       nop
425F: 00       nop
4260: 24       inc  h
4261: 22 AA 00 ld   ($00AA),hl
4264: 00       nop
4265: 22 11 AA ld   ($AA11),hl
4268: 00       nop
4269: 80       add  a,b
426A: 11 0F AA ld   de,$AA0F
426D: 80       add  a,b
426E: 00       nop
426F: 0F       rrca
4270: 00       nop
4271: AA       xor  d
4272: AA       xor  d
4273: AA       xor  d
4274: AA       xor  d
4275: AA       xor  d
4276: AA       xor  d
4277: AA       xor  d
4278: AA       xor  d
4279: 3E 1A    ld   a,$1A
427B: AA       xor  d
427C: 1A       ld   a,(de)
427D: 0E AA    ld   c,$AA
427F: 0E 19    ld   c,$19
4281: AA       xor  d
4282: 19       add  hl,de
4283: 28 AA    jr   z,$422F
4285: 28 48    jr   z,$42CF
4287: AA       xor  d
4288: 48       ld   c,b
4289: 90       sub  b
428A: AA       xor  d
428B: 90       sub  b
428C: E0       ret  po
428D: AA       xor  d
428E: E0       ret  po
428F: 00       nop
4290: AA       xor  d
4291: AA       xor  d
4292: 7C       ld   a,h
4293: 34       inc  (hl)
4294: AA       xor  d
4295: 34       inc  (hl)
4296: 1C       inc  e
4297: AA       xor  d
4298: 1C       inc  e
4299: F2 00 03 jp   p,$0300
429C: AA       xor  d
429D: F2 20 03 jp   p,$0320
42A0: 04       inc  b
42A1: AA       xor  d
42A2: 20 C0    jr   nz,$4264
42A4: 04       inc  b
42A5: 07       rlca
42A6: AA       xor  d
42A7: C0       ret  nz
42A8: 00       nop
42A9: 07       rlca
42AA: 00       nop
42AB: AA       xor  d
42AC: AA       xor  d
42AD: F8       ret  m
42AE: 68       ld   l,b
42AF: AA       xor  d
42B0: 68       ld   l,b
42B1: 38 AA    jr   c,$425D
42B3: 38 64    jr   c,$4319
42B5: AA       xor  d
42B6: 64       ld   h,h
42B7: A0       and  b
42B8: AA       xor  d
42B9: A0       and  b
42BA: 20 00    jr   nz,$42BC
42BC: 01 AA 20 ld   bc,$20AA
42BF: 40       ld   b,b
42C0: 01 02 AA ld   bc,$AA02
42C3: 40       ld   b,b
42C4: 80       add  a,b
42C5: 02       ld   (bc),a
42C6: 03       inc  bc
42C7: AA       xor  d
42C8: 80       add  a,b
42C9: 00       nop
42CA: 03       inc  bc
42CB: 00       nop
42CC: AA       xor  d
42CD: AA       xor  d
42CE: D0       ret  nc
42CF: D0       ret  nc
42D0: 01 00 AA ld   bc,$AA00
42D3: D0       ret  nc
42D4: 70       ld   (hl),b
42D5: AA       xor  d
42D6: 70       ld   (hl),b
42D7: C8       ret  z
42D8: AA       xor  d
42D9: C8       ret  z
42DA: 40       ld   b,b
42DB: 00       nop
42DC: 01 AA 40 ld   bc,$40AA
42DF: 40       ld   b,b
42E0: 01 01 AA ld   bc,$AA01
42E3: 40       ld   b,b
42E4: 40       ld   b,b
42E5: 01 01 AA ld   bc,$AA01
42E8: 40       ld   b,b
42E9: C0       ret  nz
42EA: 01 00 AA ld   bc,$AA00
42ED: C0       ret  nz
42EE: 00       nop
42EF: AA       xor  d
42F0: AA       xor  d
42F1: A0       and  b
42F2: A0       and  b
42F3: 03       inc  bc
42F4: 01 AA A0 ld   bc,$A0AA
42F7: E0       ret  po
42F8: 01 00 AA ld   bc,$AA00
42FB: E0       ret  po
42FC: 90       sub  b
42FD: AA       xor  d
42FE: 90       sub  b
42FF: C0       ret  nz
4300: AA       xor  d
4301: C0       ret  nz
4302: A0       and  b
4303: AA       xor  d
4304: A0       and  b
4305: 50       ld   d,b
4306: AA       xor  d
4307: 50       ld   d,b
4308: 30 AA    jr   nc,$42B4
430A: 30 00    jr   nc,$430C
430C: AA       xor  d
430D: AA       xor  d
430E: C0       ret  nz
430F: 40       ld   b,b
4310: 07       rlca
4311: 03       inc  bc
4312: AA       xor  d
4313: 40       ld   b,b
4314: E0       ret  po
4315: 03       inc  bc
4316: 01 AA E0 ld   bc,$E0AA
4319: C0       ret  nz
431A: 01 01 AA ld   bc,$AA01
431D: C0       ret  nz
431E: 60       ld   h,b
431F: 01 01 AA ld   bc,$AA01
4322: 60       ld   h,b
4323: 90       sub  b
4324: 01 00 AA ld   bc,$AA00
4327: 90       sub  b
4328: 70       ld   (hl),b
4329: AA       xor  d
432A: 70       ld   (hl),b
432B: 00       nop
432C: AA       xor  d
432D: AA       xor  d
432E: 80       add  a,b
432F: 80       add  a,b
4330: 0F       rrca
4331: 06 AA    ld   b,$AA
4333: 80       add  a,b
4334: 80       add  a,b
4335: 06 03    ld   b,$03
4337: AA       xor  d
4338: 80       add  a,b
4339: 40       ld   b,b
433A: 03       inc  bc
433B: 02       ld   (bc),a
433C: AA       xor  d
433D: 40       ld   b,b
433E: 00       nop
433F: 02       ld   (bc),a
4340: 03       inc  bc
4341: AA       xor  d
4342: 00       nop
4343: 80       add  a,b
4344: 03       inc  bc
4345: 02       ld   (bc),a
4346: AA       xor  d
4347: 80       add  a,b
4348: 40       ld   b,b
4349: 02       ld   (bc),a
434A: 01 AA 40 ld   bc,$40AA
434D: C0       ret  nz
434E: 01 00 AA ld   bc,$AA00
4351: C0       ret  nz
4352: 00       nop
4353: AA       xor  d
4354: AA       xor  d
4355: 00       nop
4356: 00       nop
4357: 1F       rra
4358: 0D       dec  c
4359: AA       xor  d
435A: 00       nop
435B: 00       nop
435C: 0D       dec  c
435D: 07       rlca
435E: AA       xor  d
435F: 00       nop
4360: 80       add  a,b
4361: 07       rlca
4362: 0C       inc  c
4363: AA       xor  d
4364: 80       add  a,b
4365: 00       nop
4366: 0C       inc  c
4367: 14       inc  d
4368: AA       xor  d
4369: 00       nop
436A: 00       nop
436B: 14       inc  d
436C: 14       inc  d
436D: AA       xor  d
436E: 00       nop
436F: 00       nop
4370: 14       inc  d
4371: 14       inc  d
4372: AA       xor  d
4373: 00       nop
4374: 00       nop
4375: 14       inc  d
4376: 0C       inc  c
4377: AA       xor  d
4378: 00       nop
4379: 00       nop
437A: 0C       inc  c
437B: 00       nop
437C: AA       xor  d
437D: AA       xor  d
437E: FE FE    cp   $FE
4380: 3F       ccf
4381: 3F       ccf
4382: AA       xor  d
4383: FC FC 39 call m,$39FC
4386: 39       add  hl,sp
4387: AA       xor  d
4388: F8       ret  m
4389: F8       ret  m
438A: 38 38    jr   c,$43C4
438C: AA       xor  d
438D: AA       xor  d
438E: FC FC 7F call m,$7FFC
4391: 7F       ld   a,a
4392: AA       xor  d
4393: F8       ret  m
4394: F8       ret  m
4395: 73       ld   (hl),e
4396: 73       ld   (hl),e
4397: AA       xor  d
4398: F0       ret  p
4399: F0       ret  p
439A: 71       ld   (hl),c
439B: 71       ld   (hl),c
439C: AA       xor  d
439D: AA       xor  d
439E: F8       ret  m
439F: F8       ret  m
43A0: FF       rst  $38
43A1: FF       rst  $38
43A2: AA       xor  d
43A3: F0       ret  p
43A4: F0       ret  p
43A5: E7       rst  $20
43A6: E7       rst  $20
43A7: AA       xor  d
43A8: E0       ret  po
43A9: E0       ret  po
43AA: E3       ex   (sp),hl
43AB: E3       ex   (sp),hl
43AC: AA       xor  d
43AD: AA       xor  d
43AE: F0       ret  p
43AF: F0       ret  p
43B0: FF       rst  $38
43B1: FF       rst  $38
43B2: 01 01 AA ld   bc,$AA01
43B5: E0       ret  po
43B6: E0       ret  po
43B7: CF       rst  $08
43B8: CF       rst  $08
43B9: 01 01 AA ld   bc,$AA01
43BC: C0       ret  nz
43BD: C0       ret  nz
43BE: C7       rst  $00
43BF: C7       rst  $00
43C0: 01 01 AA ld   bc,$AA01
43C3: AA       xor  d
43C4: E0       ret  po
43C5: E0       ret  po
43C6: FF       rst  $38
43C7: FF       rst  $38
43C8: 03       inc  bc
43C9: 03       inc  bc
43CA: AA       xor  d
43CB: C0       ret  nz
43CC: C0       ret  nz
43CD: 9F       sbc  a,a
43CE: 9F       sbc  a,a
43CF: 03       inc  bc
43D0: 03       inc  bc
43D1: AA       xor  d
43D2: 80       add  a,b
43D3: 80       add  a,b
43D4: 8F       adc  a,a
43D5: 8F       adc  a,a
43D6: 03       inc  bc
43D7: 03       inc  bc
43D8: AA       xor  d
43D9: AA       xor  d
43DA: C0       ret  nz
43DB: C0       ret  nz
43DC: FF       rst  $38
43DD: FF       rst  $38
43DE: 07       rlca
43DF: 07       rlca
43E0: AA       xor  d
43E1: 80       add  a,b
43E2: 80       add  a,b
43E3: 3F       ccf
43E4: 3F       ccf
43E5: 07       rlca
43E6: 07       rlca
43E7: AA       xor  d
43E8: 00       nop
43E9: 00       nop
43EA: 1F       rra
43EB: 1F       rra
43EC: 07       rlca
43ED: 07       rlca
43EE: AA       xor  d
43EF: AA       xor  d
43F0: 80       add  a,b
43F1: 80       add  a,b
43F2: FF       rst  $38
43F3: FF       rst  $38
43F4: 0F       rrca
43F5: 0F       rrca
43F6: AA       xor  d
43F7: 00       nop
43F8: 00       nop
43F9: 7F       ld   a,a
43FA: 7F       ld   a,a
43FB: 0E 0E    ld   c,$0E
43FD: AA       xor  d
43FE: 00       nop
43FF: 00       nop
4400: 3E 3E    ld   a,$3E
4402: 0E 0E    ld   c,$0E
4404: AA       xor  d
4405: AA       xor  d
4406: 9A       sbc  a,d
4407: 96       sub  (hl)
4408: AA       xor  d
4409: 96       sub  (hl)
440A: 9A       sbc  a,d
440B: AA       xor  d
440C: 5A       ld   e,d
440D: 56       ld   d,(hl)
440E: AA       xor  d
440F: 37       scf
4410: 3B       dec  sp
4411: AA       xor  d
4412: 16 16    ld   d,$16
4414: AA       xor  d
4415: 1C       inc  e
4416: 1C       inc  e
4417: AA       xor  d
4418: 1C       inc  e
4419: 1C       inc  e
441A: AA       xor  d
441B: 08       ex   af,af'
441C: 08       ex   af,af'
441D: AA       xor  d
441E: AA       xor  d
441F: 2C       inc  l
4420: 34       inc  (hl)
4421: 01 01 AA ld   bc,$AA01
4424: 34       inc  (hl)
4425: 2C       inc  l
4426: 01 01 AA ld   bc,$AA01
4429: AC       xor  h
442A: B4       or   h
442B: AA       xor  d
442C: 76       halt
442D: 6E       ld   l,(hl)
442E: AA       xor  d
442F: 2C       inc  l
4430: 2C       inc  l
4431: AA       xor  d
4432: 38 38    jr   c,$446C
4434: AA       xor  d
4435: 38 38    jr   c,$446F
4437: AA       xor  d
4438: 10 10    djnz $444A
443A: AA       xor  d
443B: AA       xor  d
443C: 68       ld   l,b
443D: 58       ld   e,b
443E: 02       ld   (bc),a
443F: 02       ld   (bc),a
4440: AA       xor  d
4441: 58       ld   e,b
4442: 68       ld   l,b
4443: 02       ld   (bc),a
4444: 02       ld   (bc),a
4445: AA       xor  d
4446: 68       ld   l,b
4447: 58       ld   e,b
4448: 01 01 AA ld   bc,$AA01
444B: DC CC AA call c,$AACC
444E: 78       ld   a,b
444F: 78       ld   a,b
4450: AA       xor  d
4451: 70       ld   (hl),b
4452: 70       ld   (hl),b
4453: AA       xor  d
4454: 70       ld   (hl),b
4455: 70       ld   (hl),b
4456: AA       xor  d
4457: 20 20    jr   nz,$4479
4459: AA       xor  d
445A: AA       xor  d
445B: B0       or   b
445C: D0       ret  nc
445D: 04       inc  b
445E: 04       inc  b
445F: AA       xor  d
4460: D0       ret  nc
4461: B0       or   b
4462: 04       inc  b
4463: 04       inc  b
4464: AA       xor  d
4465: B0       or   b
4466: 90       sub  b
4467: 02       ld   (bc),a
4468: 02       ld   (bc),a
4469: AA       xor  d
446A: D8       ret  c
446B: F8       ret  m
446C: 01 01 AA ld   bc,$AA01
446F: B0       or   b
4470: B0       or   b
4471: AA       xor  d
4472: E0       ret  po
4473: E0       ret  po
4474: AA       xor  d
4475: E0       ret  po
4476: E0       ret  po
4477: AA       xor  d
4478: 40       ld   b,b
4479: 40       ld   b,b
447A: AA       xor  d
447B: AA       xor  d
447C: A0       and  b
447D: 60       ld   h,b
447E: 09       add  hl,bc
447F: 09       add  hl,bc
4480: AA       xor  d
4481: 60       ld   h,b
4482: 20 09    jr   nz,$448D
4484: 09       add  hl,bc
4485: AA       xor  d
4486: A0       and  b
4487: E0       ret  po
4488: 05       dec  b
4489: 05       dec  b
448A: AA       xor  d
448B: 70       ld   (hl),b
448C: 30 03    jr   nc,$4491
448E: 03       inc  bc
448F: AA       xor  d
4490: E0       ret  po
4491: E0       ret  po
4492: 01 01 AA ld   bc,$AA01
4495: C0       ret  nz
4496: C0       ret  nz
4497: 01 01 AA ld   bc,$AA01
449A: C0       ret  nz
449B: C0       ret  nz
449C: 01 01 AA ld   bc,$AA01
449F: 80       add  a,b
44A0: 80       add  a,b
44A1: AA       xor  d
44A2: AA       xor  d
44A3: C0       ret  nz
44A4: 40       ld   b,b
44A5: 12       ld   (de),a
44A6: 12       ld   (de),a
44A7: AA       xor  d
44A8: 40       ld   b,b
44A9: C0       ret  nz
44AA: 13       inc  de
44AB: 13       inc  de
44AC: AA       xor  d
44AD: C0       ret  nz
44AE: C0       ret  nz
44AF: 0A       ld   a,(bc)
44B0: 0A       ld   a,(bc)
44B1: AA       xor  d
44B2: 60       ld   h,b
44B3: 60       ld   h,b
44B4: 07       rlca
44B5: 07       rlca
44B6: AA       xor  d
44B7: C0       ret  nz
44B8: C0       ret  nz
44B9: 02       ld   (bc),a
44BA: 02       ld   (bc),a
44BB: AA       xor  d
44BC: 80       add  a,b
44BD: 80       add  a,b
44BE: 03       inc  bc
44BF: 03       inc  bc
44C0: AA       xor  d
44C1: 80       add  a,b
44C2: 80       add  a,b
44C3: 03       inc  bc
44C4: 03       inc  bc
44C5: AA       xor  d
44C6: 00       nop
44C7: 00       nop
44C8: 01 01 AA ld   bc,$AA01
44CB: AA       xor  d
44CC: 80       add  a,b
44CD: 80       add  a,b
44CE: 24       inc  h
44CF: 27       daa
44D0: AA       xor  d
44D1: 80       add  a,b
44D2: 80       add  a,b
44D3: 25       dec  h
44D4: 24       inc  h
44D5: AA       xor  d
44D6: 80       add  a,b
44D7: 80       add  a,b
44D8: 16 17    ld   d,$17
44DA: AA       xor  d
44DB: C0       ret  nz
44DC: C0       ret  nz
44DD: 0D       dec  c
44DE: 0D       dec  c
44DF: AA       xor  d
44E0: 80       add  a,b
44E1: 80       add  a,b
44E2: 07       rlca
44E3: 07       rlca
44E4: AA       xor  d
44E5: 00       nop
44E6: 00       nop
44E7: 07       rlca
44E8: 07       rlca
44E9: AA       xor  d
44EA: 00       nop
44EB: 00       nop
44EC: 07       rlca
44ED: 07       rlca
44EE: AA       xor  d
44EF: 00       nop
44F0: 00       nop
44F1: 02       ld   (bc),a
44F2: 02       ld   (bc),a
44F3: AA       xor  d
44F4: AA       xor  d
44F5: 00       nop
44F6: 00       nop
44F7: 4D       ld   c,l
44F8: 4B       ld   c,e
44F9: AA       xor  d
44FA: 00       nop
44FB: 00       nop
44FC: 4B       ld   c,e
44FD: 4D       ld   c,l
44FE: AA       xor  d
44FF: 00       nop
4500: 00       nop
4501: 29       add  hl,hl
4502: 2B       dec  hl
4503: AA       xor  d
4504: 80       add  a,b
4505: 80       add  a,b
4506: 1F       rra
4507: 1D       dec  e
4508: AA       xor  d
4509: 00       nop
450A: 00       nop
450B: 0B       dec  bc
450C: 0B       dec  bc
450D: AA       xor  d
450E: 00       nop
450F: 00       nop
4510: 0E 0E    ld   c,$0E
4512: AA       xor  d
4513: 00       nop
4514: 00       nop
4515: 0E 0E    ld   c,$0E
4517: AA       xor  d
4518: 00       nop
4519: 00       nop
451A: 04       inc  b
451B: 04       inc  b
451C: AA       xor  d
451D: AA       xor  d
451E: FF       rst  $38
451F: FF       rst  $38
4520: CB EB    set  5,e
4522: CA C0 A0 jp   z,$A0C0
4525: A2       and  d
4526: A2       and  d
4527: 04       inc  b
4528: 04       inc  b
4529: 22 22 20 ld   ($2022),hl
452C: 40       ld   b,b
452D: 4A       ld   c,d
452E: 6B       ld   l,e
452F: 4B       ld   c,e
4530: 4B       ld   c,e
4531: 6B       ld   l,e
4532: 4A       ld   c,d
4533: 40       ld   b,b
4534: 20 22    jr   nz,$4558
4536: 22 04 04 ld   ($0404),hl
4539: A2       and  d
453A: A2       and  d
453B: A0       and  b
453C: C0       ret  nz
453D: CA EB CB jp   z,$CBEB
4540: A1       and  c
4541: 61       ld   h,c
4542: 89       adc  a,c
4543: 89       adc  a,c
4544: AA       xor  d
4545: 61       ld   h,c
4546: 21 89 89 ld   hl,$8989
4549: AA       xor  d
454A: A1       and  c
454B: E1       pop  hl
454C: 85       add  a,l
454D: 85       add  a,l
454E: AA       xor  d
454F: 71       ld   (hl),c
4550: 31 83 83 ld   sp,$8383
4553: AA       xor  d
4554: E2 E2 41 jp   po,$41E2
4557: 41       ld   b,c
4558: AA       xor  d
4559: C4 C4 21 call nz,$21C4
455C: 21 AA 88 ld   hl,$88AA
455F: 88       adc  a,b
4560: 10 10    djnz $4572
4562: AA       xor  d
4563: F0       ret  p
4564: F0       ret  p
4565: 0F       rrca
4566: 0F       rrca
4567: AA       xor  d
4568: AA       xor  d
4569: 5F       ld   e,a
456A: 9F       sbc  a,a
456B: F6 F6    or   $F6
456D: AA       xor  d
456E: 9F       sbc  a,a
456F: DF       rst  $18
4570: F6 F6    or   $F6
4572: AA       xor  d
4573: 5F       ld   e,a
4574: 1F       rra
4575: FA FA AA jp   m,$AAFA
4578: 8F       adc  a,a
4579: CF       rst  $08
457A: FC FC AA call m,$AAFC
457D: 1E 1E    ld   e,$1E
457F: 7E       ld   a,(hl)
4580: 7E       ld   a,(hl)
4581: AA       xor  d
4582: 3C       inc  a
4583: 3C       inc  a
4584: 3E 3E    ld   a,$3E
4586: AA       xor  d
4587: 78       ld   a,b
4588: 78       ld   a,b
4589: 1F       rra
458A: 1F       rra
458B: AA       xor  d
458C: 00       nop
458D: 00       nop
458E: AA       xor  d
458F: AA       xor  d
4590: 2E 4F    ld   l,$4F
4592: 4D       ld   c,l
4593: 4D       ld   c,l
4594: 4D       ld   c,l
4595: 4C       ld   c,h
4596: 4C       ld   c,h
4597: 4C       ld   c,h
4598: 4B       ld   c,e
4599: 4B       ld   c,e
459A: 4B       ld   c,e
459B: 2C       inc  l
459C: 2B       dec  hl
459D: 0B       dec  bc
459E: 2B       dec  hl
459F: 0B       dec  bc
45A0: AC       xor  h
45A1: 0A       ld   a,(bc)
45A2: AD       xor  l
45A3: AA       xor  d
45A4: AA       xor  d
45A5: AA       xor  d
45A6: CA CA A9 jp   z,$A9CA
45A9: A0       and  b
45AA: A0       and  b
45AB: A0       and  b
45AC: A0       and  b
45AD: A1       and  c
45AE: A1       and  c
45AF: A0       and  b
45B0: A1       and  c
45B1: A2       and  d
45B2: A2       and  d
45B3: A3       and  e
45B4: A4       and  h
45B5: A3       and  e
45B6: 03       inc  bc
45B7: 03       inc  bc
45B8: 03       inc  bc
45B9: 03       inc  bc
45BA: 23       inc  hl
45BB: 23       inc  hl
45BC: 23       inc  hl
45BD: 21 22 21 ld   hl,$2122
45C0: 21 20 21 ld   hl,$2120
45C3: 20 20    jr   nz,$45E5
45C5: 20 20    jr   nz,$45E7
45C7: 20 29    jr   nz,$45F2
45C9: 20 4A    jr   nz,$4615
45CB: 4B       ld   c,e
45CC: 6C       ld   l,h
45CD: 6C       ld   l,h
45CE: 6C       ld   l,h
45CF: 6C       ld   l,h
45D0: 6B       ld   l,e
45D1: 6B       ld   l,e
45D2: 6B       ld   l,e
45D3: 6B       ld   l,e
45D4: 6B       ld   l,e
45D5: 6A       ld   l,d
45D6: 6B       ld   l,e
45D7: 6A       ld   l,d
45D8: 6A       ld   l,d
45D9: 6A       ld   l,d
45DA: 6A       ld   l,d
45DB: 69       ld   l,c
45DC: 69       ld   l,c
45DD: 69       ld   l,c
45DE: 60       ld   h,b
45DF: 60       ld   h,b
45E0: 60       ld   h,b
45E1: 60       ld   h,b
45E2: 60       ld   h,b
45E3: 60       ld   h,b
45E4: 60       ld   h,b
45E5: 60       ld   h,b
45E6: 60       ld   h,b
45E7: 60       ld   h,b
45E8: 60       ld   h,b
45E9: 60       ld   h,b
45EA: 60       ld   h,b
45EB: 60       ld   h,b
45EC: 60       ld   h,b
45ED: 60       ld   h,b
45EE: 60       ld   h,b
45EF: 60       ld   h,b
45F0: 60       ld   h,b
45F1: 60       ld   h,b
45F2: 60       ld   h,b
45F3: 60       ld   h,b
45F4: 60       ld   h,b
45F5: 60       ld   h,b
45F6: 60       ld   h,b
45F7: 60       ld   h,b
45F8: 60       ld   h,b
45F9: 60       ld   h,b
45FA: 60       ld   h,b
45FB: 60       ld   h,b
45FC: 60       ld   h,b
45FD: 60       ld   h,b
45FE: 60       ld   h,b
45FF: 60       ld   h,b
4600: 3E 08    ld   a,$08
4602: AA       xor  d
4603: 08       ex   af,af'
4604: 08       ex   af,af'
4605: AA       xor  d
4606: 08       ex   af,af'
4607: 00       nop
4608: AA       xor  d
4609: AA       xor  d
460A: 08       ex   af,af'
460B: 14       inc  d
460C: AA       xor  d
460D: 14       inc  d
460E: 00       nop
460F: AA       xor  d
4610: AA       xor  d
4611: E9       jp   (hl)
4612: E9       jp   (hl)
4613: A2       and  d
4614: BE       cp   (hl)
4615: AA       xor  d
4616: E9       jp   (hl)
4617: E9       jp   (hl)
4618: A2       and  d
4619: 80       add  a,b
461A: AA       xor  d
461B: EA EA A2 jp   pe,$A2EA
461E: 80       add  a,b
461F: AA       xor  d
4620: EC EC BE call pe,$BEEC
4623: BE       cp   (hl)
4624: AA       xor  d
4625: E8       ret  pe
4626: E8       ret  pe
4627: 80       add  a,b
4628: BE       cp   (hl)
4629: AA       xor  d
462A: E8       ret  pe
462B: E8       ret  pe
462C: 80       add  a,b
462D: BE       cp   (hl)
462E: AA       xor  d
462F: E8       ret  pe
4630: E8       ret  pe
4631: BE       cp   (hl)
4632: BE       cp   (hl)
4633: AA       xor  d
4634: E8       ret  pe
4635: E8       ret  pe
4636: BE       cp   (hl)
4637: BE       cp   (hl)
4638: AA       xor  d
4639: E8       ret  pe
463A: E8       ret  pe
463B: 7E       ld   a,(hl)
463C: 40       ld   b,b
463D: AA       xor  d
463E: F8       ret  m
463F: F8       ret  m
4640: 7E       ld   a,(hl)
4641: 40       ld   b,b
4642: AA       xor  d
4643: E0       ret  po
4644: E0       ret  po
4645: 3E 3E    ld   a,$3E
4647: AA       xor  d
4648: E0       ret  po
4649: E0       ret  po
464A: 20 22    jr   nz,$466E
464C: AA       xor  d
464D: E0       ret  po
464E: E0       ret  po
464F: 10 12    djnz $4663
4651: AA       xor  d
4652: E0       ret  po
4653: E0       ret  po
4654: 1E 12    ld   e,$12
4656: AA       xor  d
4657: E0       ret  po
4658: E0       ret  po
4659: 0A       ld   a,(bc)
465A: 0E AA    ld   c,$AA
465C: E0       ret  po
465D: E0       ret  po
465E: 0A       ld   a,(bc)
465F: 08       ex   af,af'
4660: AA       xor  d
4661: E0       ret  po
4662: E0       ret  po
4663: 06 04    ld   b,$04
4665: AA       xor  d
4666: E0       ret  po
4667: E0       ret  po
4668: 02       ld   (bc),a
4669: 02       ld   (bc),a
466A: AA       xor  d
466B: E0       ret  po
466C: E0       ret  po
466D: 01 01 AA ld   bc,$AA01
4670: E0       ret  po
4671: E0       ret  po
4672: AA       xor  d
4673: AA       xor  d
4674: EF       rst  $28
4675: EF       rst  $28
4676: BE       cp   (hl)
4677: BE       cp   (hl)
4678: AA       xor  d
4679: EF       rst  $28
467A: EF       rst  $28
467B: BE       cp   (hl)
467C: 80       add  a,b
467D: AA       xor  d
467E: EE EE    xor  $EE
4680: BE       cp   (hl)
4681: 80       add  a,b
4682: AA       xor  d
4683: EC EC BE call pe,$BEEC
4686: BE       cp   (hl)
4687: AA       xor  d
4688: E8       ret  pe
4689: E8       ret  pe
468A: 80       add  a,b
468B: A2       and  d
468C: AA       xor  d
468D: E8       ret  pe
468E: E8       ret  pe
468F: 80       add  a,b
4690: A2       and  d
4691: AA       xor  d
4692: E8       ret  pe
4693: E8       ret  pe
4694: BE       cp   (hl)
4695: A2       and  d
4696: AA       xor  d
4697: E8       ret  pe
4698: E8       ret  pe
4699: A2       and  d
469A: BE       cp   (hl)
469B: AA       xor  d
469C: E8       ret  pe
469D: E8       ret  pe
469E: 62       ld   h,d
469F: 40       ld   b,b
46A0: AA       xor  d
46A1: F8       ret  m
46A2: F8       ret  m
46A3: 62       ld   h,d
46A4: 40       ld   b,b
46A5: AA       xor  d
46A6: E0       ret  po
46A7: E0       ret  po
46A8: 3E 3E    ld   a,$3E
46AA: AA       xor  d
46AB: E0       ret  po
46AC: E0       ret  po
46AD: 20 3E    jr   nz,$46ED
46AF: AA       xor  d
46B0: E0       ret  po
46B1: E0       ret  po
46B2: 10 1E    djnz $46D2
46B4: AA       xor  d
46B5: E0       ret  po
46B6: E0       ret  po
46B7: 1E 1E    ld   e,$1E
46B9: AA       xor  d
46BA: E0       ret  po
46BB: E0       ret  po
46BC: 0E 0E    ld   c,$0E
46BE: AA       xor  d
46BF: E0       ret  po
46C0: E0       ret  po
46C1: 0E 08    ld   c,$08
46C3: AA       xor  d
46C4: E0       ret  po
46C5: E0       ret  po
46C6: 06 04    ld   b,$04
46C8: AA       xor  d
46C9: E0       ret  po
46CA: E0       ret  po
46CB: 02       ld   (bc),a
46CC: 02       ld   (bc),a
46CD: AA       xor  d
46CE: E0       ret  po
46CF: E0       ret  po
46D0: 01 01 AA ld   bc,$AA01
46D3: E0       ret  po
46D4: E0       ret  po
46D5: AA       xor  d
46D6: AA       xor  d
46D7: FF       rst  $38
46D8: 58       ld   e,b
46D9: 00       nop
46DA: 10 2D    djnz $4709
46DC: 58       ld   e,b
46DD: FF       rst  $38
46DE: 11 28 58 ld   de,$5828
46E1: 00       nop
46E2: 15       dec  d
46E3: 2A 58 FF ld   hl,($FF58)
46E6: 08       ex   af,af'
46E7: 36 58    ld   (hl),$58
46E9: 00       nop
46EA: 07       rlca
46EB: 35       dec  (hl)
46EC: 58       ld   e,b
46ED: FF       rst  $38
46EE: 16 29    ld   d,$29
46F0: 58       ld   e,b
46F1: 00       nop
46F2: 0A       ld   a,(bc)
46F3: 2D       dec  l
46F4: 58       ld   e,b
46F5: FF       rst  $38
46F6: 0C       inc  c
46F7: 39       add  hl,sp
46F8: 58       ld   e,b
46F9: 00       nop
46FA: 10 27    djnz $4723
46FC: 58       ld   e,b
46FD: FF       rst  $38
46FE: 06 2C    ld   b,$2C
4700: 58       ld   e,b
4701: 00       nop
4702: 11 3C 58 ld   de,$583C
4705: FF       rst  $38
4706: 15       dec  d
4707: 2E 58    ld   l,$58
4709: 00       nop
470A: 05       dec  b
470B: 2F       cpl
470C: 58       ld   e,b
470D: FF       rst  $38
470E: 14       inc  d
470F: 31 58 00 ld   sp,$0058
4712: 0A       ld   a,(bc)
4713: 30 58    jr   nc,$476D
4715: FF       rst  $38
4716: 0C       inc  c
4717: 34       inc  (hl)
4718: 58       ld   e,b
4719: 00       nop
471A: 17       rla
471B: 3A 58 FF ld   a,($FF58)
471E: 0F       rrca
471F: 37       scf
4720: 58       ld   e,b
4721: 00       nop
4722: 13       inc  de
4723: 34       inc  (hl)
4724: 58       ld   e,b
4725: FF       rst  $38
4726: 15       dec  d
4727: 2B       dec  hl
4728: F8       ret  m
4729: C0       ret  nz
472A: 18 33    jr   $475F
472C: FF       rst  $38
472D: FF       rst  $38
472E: FF       rst  $38
472F: FF       rst  $38
4730: FF       rst  $38
4731: FF       rst  $38
4732: FF       rst  $38
4733: FF       rst  $38
4734: FF       rst  $38
4735: FF       rst  $38
4736: FF       rst  $38
4737: FF       rst  $38
4738: FF       rst  $38
4739: FF       rst  $38
473A: FF       rst  $38
473B: FF       rst  $38
473C: FF       rst  $38
473D: FF       rst  $38
473E: FF       rst  $38
473F: FF       rst  $38
4740: FF       rst  $38
4741: FF       rst  $38
4742: FF       rst  $38
4743: FF       rst  $38
4744: FF       rst  $38
4745: FF       rst  $38
4746: FF       rst  $38
4747: FF       rst  $38
4748: FF       rst  $38
4749: FF       rst  $38
474A: FF       rst  $38
474B: FF       rst  $38
474C: FF       rst  $38
474D: FF       rst  $38
474E: FF       rst  $38
474F: FF       rst  $38
4750: FF       rst  $38
4751: FF       rst  $38
4752: FF       rst  $38
4753: FF       rst  $38
4754: FF       rst  $38
4755: FF       rst  $38
4756: FF       rst  $38
4757: FF       rst  $38
4758: FF       rst  $38
4759: FF       rst  $38
475A: FF       rst  $38
475B: FF       rst  $38
475C: FF       rst  $38
475D: FF       rst  $38
475E: FF       rst  $38
475F: FF       rst  $38
4760: 15       dec  d
4761: 2F       cpl
4762: 18 2F    jr   $4793
4764: 15       dec  d
4765: 33       inc  sp
4766: 18 33    jr   $479B
4768: 15       dec  d
4769: 2B       dec  hl
476A: 18 2B    jr   $4797
476C: 15       dec  d
476D: 37       scf
476E: 18 37    jr   $47A7
4770: 15       dec  d
4771: 27       daa
4772: 18 27    jr   $479B
4774: 15       dec  d
4775: 3B       dec  sp
4776: 18 3B    jr   $47B3
4778: FF       rst  $38
4779: FF       rst  $38
477A: FF       rst  $38
477B: FF       rst  $38
477C: FF       rst  $38
477D: FF       rst  $38
477E: FF       rst  $38
477F: FF       rst  $38
4780: D0       ret  nc
4781: E9       jp   (hl)
4782: 15       dec  d
4783: 33       inc  sp
4784: D1       pop  de
4785: 61       ld   h,c
4786: 18 33    jr   $47BB
4788: D2 E9 15 jp   nc,$15E9
478B: 33       inc  sp
478C: D3 61    out  ($61),a
478E: 18 33    jr   $47C3
4790: D4 E9 15 call nc,$15E9
4793: 33       inc  sp
4794: D5       push de
4795: 61       ld   h,c
4796: 18 33    jr   $47CB
4798: D6 E1    sub  $E1
479A: 15       dec  d
479B: 33       inc  sp
479C: D7       rst  $10
479D: 69       ld   l,c
479E: 18 33    jr   $47D3
47A0: D0       ret  nc
47A1: E1       pop  hl
47A2: 15       dec  d
47A3: 33       inc  sp
47A4: D1       pop  de
47A5: 69       ld   l,c
47A6: 18 33    jr   $47DB
47A8: D2 E1 15 jp   nc,$15E1
47AB: 33       inc  sp
47AC: D3 69    out  ($69),a
47AE: 18 33    jr   $47E3
47B0: 68       ld   l,b
47B1: 1C       inc  e
47B2: 18 2A    jr   $47DE
47B4: 69       ld   l,c
47B5: 16 18    ld   d,$18
47B7: 2F       cpl
47B8: 68       ld   l,b
47B9: 11 18 34 ld   de,$3418
47BC: 6D       ld   l,l
47BD: 17       rla
47BE: 18 39    jr   $47F9
47C0: 69       ld   l,c
47C1: 12       ld   (de),a
47C2: 15       dec  d
47C3: 2A 6F 18 ld   hl,($186F)
47C6: 15       dec  d
47C7: 2F       cpl
47C8: 6A       ld   l,d
47C9: 13       inc  de
47CA: 15       dec  d
47CB: 34       inc  (hl)
47CC: 6E       ld   l,(hl)
47CD: 19       add  hl,de
47CE: 15       dec  d
47CF: 39       add  hl,sp
47D0: 6B       ld   l,e
47D1: 14       inc  d
47D2: 12       ld   (de),a
47D3: 2A 6A 1A ld   hl,($1A6A)
47D6: 12       ld   (de),a
47D7: 2F       cpl
47D8: 68       ld   l,b
47D9: 15       dec  d
47DA: 12       ld   (de),a
47DB: 34       inc  (hl)
47DC: 69       ld   l,c
47DD: 1B       dec  de
47DE: 12       ld   (de),a
47DF: 39       add  hl,sp
47E0: 00       nop
47E1: 00       nop
47E2: 00       nop
47E3: 00       nop
47E4: 00       nop
47E5: 00       nop
47E6: 00       nop
47E7: 00       nop
47E8: 00       nop
47E9: 00       nop
47EA: 00       nop
47EB: 00       nop
47EC: 00       nop
47ED: 00       nop
47EE: 00       nop
47EF: 00       nop
47F0: 00       nop
47F1: 00       nop
47F2: 00       nop
47F3: 00       nop
47F4: 00       nop
47F5: 00       nop
47F6: 00       nop
47F7: 00       nop
47F8: 00       nop
47F9: 00       nop
47FA: 00       nop
47FB: 00       nop
47FC: 00       nop
47FD: 00       nop
47FE: 00       nop
47FF: 00       nop
4800: 18 18    jr   $481A
4802: AA       xor  d
4803: 24       inc  h
4804: 24       inc  h
4805: AA       xor  d
4806: 42       ld   b,d
4807: 42       ld   b,d
4808: AA       xor  d
4809: 81       add  a,c
480A: 81       add  a,c
480B: AA       xor  d
480C: AA       xor  d
480D: 18 18    jr   $4827
480F: AA       xor  d
4810: 24       inc  h
4811: 24       inc  h
4812: AA       xor  d
4813: 42       ld   b,d
4814: 42       ld   b,d
4815: AA       xor  d
4816: AA       xor  d
4817: 18 18    jr   $4831
4819: AA       xor  d
481A: 24       inc  h
481B: 24       inc  h
481C: AA       xor  d
481D: AA       xor  d
481E: 24       inc  h
481F: 24       inc  h
4820: AA       xor  d
4821: 18 18    jr   $483B
4823: AA       xor  d
4824: AA       xor  d
4825: 42       ld   b,d
4826: 42       ld   b,d
4827: AA       xor  d
4828: 42       ld   b,d
4829: 42       ld   b,d
482A: AA       xor  d
482B: 3C       inc  a
482C: 3C       inc  a
482D: AA       xor  d
482E: AA       xor  d
482F: 81       add  a,c
4830: 81       add  a,c
4831: AA       xor  d
4832: 81       add  a,c
4833: 81       add  a,c
4834: AA       xor  d
4835: 42       ld   b,d
4836: 42       ld   b,d
4837: AA       xor  d
4838: 3C       inc  a
4839: 3C       inc  a
483A: AA       xor  d
483B: AA       xor  d
483C: 00       nop
483D: 00       nop
483E: 00       nop
483F: 00       nop
4840: 7F       ld   a,a
4841: 9F       sbc  a,a
4842: AA       xor  d
4843: 9F       sbc  a,a
4844: 9F       sbc  a,a
4845: AA       xor  d
4846: 0E 0E    ld   c,$0E
4848: AA       xor  d
4849: AA       xor  d
484A: 5F       ld   e,a
484B: BF       cp   a
484C: AA       xor  d
484D: 1F       rra
484E: 5F       ld   e,a
484F: AA       xor  d
4850: 0E 0E    ld   c,$0E
4852: AA       xor  d
4853: AA       xor  d
4854: 9F       sbc  a,a
4855: 7F       ld   a,a
4856: AA       xor  d
4857: 1F       rra
4858: 9F       sbc  a,a
4859: AA       xor  d
485A: 0E 0E    ld   c,$0E
485C: AA       xor  d
485D: AA       xor  d
485E: BF       cp   a
485F: 5F       ld   e,a
4860: AA       xor  d
4861: 5F       ld   e,a
4862: 1F       rra
4863: AA       xor  d
4864: 0E 0E    ld   c,$0E
4866: AA       xor  d
4867: AA       xor  d
4868: FF       rst  $38
4869: FF       rst  $38
486A: AA       xor  d
486B: 3E 3E    ld   a,$3E
486D: AA       xor  d
486E: 5A       ld   e,d
486F: 5A       ld   e,d
4870: AA       xor  d
4871: 99       sbc  a,c
4872: 99       sbc  a,c
4873: AA       xor  d
4874: AA       xor  d
4875: 00       nop
4876: 00       nop
4877: 00       nop
4878: 00       nop
4879: 00       nop
487A: 00       nop
487B: 00       nop
487C: 00       nop
487D: 00       nop
487E: 00       nop
487F: 00       nop
4880: 00       nop
4881: 4A       ld   c,d
4882: 0D       dec  c
4883: 4A       ld   c,d
4884: 1C       inc  e
4885: 4A       ld   c,d
4886: 2D       dec  l
4887: 4A       ld   c,d
4888: 40       ld   b,b
4889: 4A       ld   c,d
488A: 55       ld   d,l
488B: 4A       ld   c,d
488C: 6A       ld   l,d
488D: 4A       ld   c,d
488E: 7F       ld   a,a
488F: 4A       ld   c,d
4890: 40       ld   b,b
4891: 48       ld   c,b
4892: 4A       ld   c,d
4893: 48       ld   c,b
4894: 54       ld   d,h
4895: 48       ld   c,b
4896: 5E       ld   e,(hl)
4897: 48       ld   c,b
4898: 40       ld   b,b
4899: 48       ld   c,b
489A: 4A       ld   c,d
489B: 48       ld   c,b
489C: 54       ld   d,h
489D: 48       ld   c,b
489E: 5E       ld   e,(hl)
489F: 48       ld   c,b
48A0: BA       cp   d
48A1: 40       ld   b,b
48A2: DC 40 0F call c,$0F40
48A5: 41       ld   b,c
48A6: 4C       ld   c,h
48A7: 41       ld   b,c
48A8: 89       adc  a,c
48A9: 41       ld   b,c
48AA: C6 41    add  a,$41
48AC: 03       inc  bc
48AD: 42       ld   b,d
48AE: 3B       dec  sp
48AF: 42       ld   b,d
48B0: 79       ld   a,c
48B1: 42       ld   b,d
48B2: 92       sub  d
48B3: 42       ld   b,d
48B4: AD       xor  l
48B5: 42       ld   b,d
48B6: CE 42    adc  a,$42
48B8: F1       pop  af
48B9: 42       ld   b,d
48BA: 0E 43    ld   c,$43
48BC: 2E 43    ld   l,$43
48BE: 55       ld   d,l
48BF: 43       ld   b,e
48C0: D0       ret  nc
48C1: 49       ld   c,c
48C2: 7E       ld   a,(hl)
48C3: 43       ld   b,e
48C4: 8E       adc  a,(hl)
48C5: 43       ld   b,e
48C6: 9E       sbc  a,(hl)
48C7: 43       ld   b,e
48C8: AE       xor  (hl)
48C9: 43       ld   b,e
48CA: C4 43 DA call nz,$DA43
48CD: 43       ld   b,e
48CE: F0       ret  p
48CF: 43       ld   b,e
48D0: 06 44    ld   b,$44
48D2: 1F       rra
48D3: 44       ld   b,h
48D4: 3C       inc  a
48D5: 44       ld   b,h
48D6: 5B       ld   e,e
48D7: 44       ld   b,h
48D8: 7C       ld   a,h
48D9: 44       ld   b,h
48DA: A3       and  e
48DB: 44       ld   b,h
48DC: CC 44 F5 call z,$F544
48DF: 44       ld   b,h
48E0: 06 44    ld   b,$44
48E2: 1F       rra
48E3: 44       ld   b,h
48E4: 3C       inc  a
48E5: 44       ld   b,h
48E6: 5B       ld   e,e
48E7: 44       ld   b,h
48E8: 7C       ld   a,h
48E9: 44       ld   b,h
48EA: A3       and  e
48EB: 44       ld   b,h
48EC: CC 44 F5 call z,$F544
48EF: 44       ld   b,h
48F0: 11 46 11 ld   de,$1146
48F3: 46       ld   b,(hl)
48F4: 11 46 11 ld   de,$1146
48F7: 46       ld   b,(hl)
48F8: 74       ld   (hl),h
48F9: 46       ld   b,(hl)
48FA: 74       ld   (hl),h
48FB: 46       ld   b,(hl)
48FC: 74       ld   (hl),h
48FD: 46       ld   b,(hl)
48FE: 74       ld   (hl),h
48FF: 46       ld   b,(hl)
4900: 00       nop
4901: 00       nop
4902: 2F       cpl
4903: 48       ld   c,b
4904: 25       dec  h
4905: 48       ld   c,b
4906: 21 48 1E ld   hl,$1E48
4909: 48       ld   c,b
490A: 17       rla
490B: 48       ld   c,b
490C: 0D       dec  c
490D: 48       ld   c,b
490E: 00       nop
490F: 48       ld   c,b
4910: 00       nop
4911: 4B       ld   c,e
4912: 24       inc  h
4913: 4B       ld   c,e
4914: 4A       ld   c,d
4915: 4B       ld   c,e
4916: 70       ld   (hl),b
4917: 4B       ld   c,e
4918: 96       sub  (hl)
4919: 4B       ld   c,e
491A: BC       cp   h
491B: 4B       ld   c,e
491C: E4 4B 0C call po,$0C4B
491F: 4C       ld   c,h
4920: 3A 4C 5E ld   a,($5E4C)
4923: 4C       ld   c,h
4924: 84       add  a,h
4925: 4C       ld   c,h
4926: AA       xor  d
4927: 4C       ld   c,h
4928: D0       ret  nc
4929: 4C       ld   c,h
492A: F6 4C    or   $4C
492C: 1E 4D    ld   e,$4D
492E: 46       ld   b,(hl)
492F: 4D       ld   c,l
4930: 68       ld   l,b
4931: 4D       ld   c,l
4932: 72       ld   (hl),d
4933: 4D       ld   c,l
4934: 7C       ld   a,h
4935: 4D       ld   c,l
4936: 8C       adc  a,h
4937: 4D       ld   c,l
4938: 9C       sbc  a,h
4939: 4D       ld   c,l
493A: AC       xor  h
493B: 4D       ld   c,l
493C: BC       cp   h
493D: 4D       ld   c,l
493E: CC 4D F1 call z,$F14D
4941: F3       di
4942: AA       xor  d
4943: F1       pop  af
4944: FB       ei
4945: AA       xor  d
4946: 73       ld   (hl),e
4947: FF       rst  $38
4948: AA       xor  d
4949: 7B       ld   a,e
494A: 7E       ld   a,(hl)
494B: AA       xor  d
494C: 7F       ld   a,a
494D: 66       ld   h,(hl)
494E: AA       xor  d
494F: 3E 73    ld   a,$73
4951: AA       xor  d
4952: 7D       ld   a,l
4953: 73       ld   (hl),e
4954: AA       xor  d
4955: F9       ld   sp,hl
4956: 3B       dec  sp
4957: AA       xor  d
4958: FB       ei
4959: 36 AA    ld   (hl),$AA
495B: F9       ld   sp,hl
495C: 3C       inc  a
495D: AA       xor  d
495E: FD 7E AA ld   a,(iy-$56)
4961: 7E       ld   a,(hl)
4962: F9       ld   sp,hl
4963: AA       xor  d
4964: FE FB    cp   $FB
4966: AA       xor  d
4967: 7F       ld   a,a
4968: 77       ld   (hl),a
4969: AA       xor  d
496A: 7F       ld   a,a
496B: FE AA    cp   $AA
496D: 7F       ld   a,a
496E: FE AA    cp   $AA
4970: 5F       ld   e,a
4971: FE AA    cp   $AA
4973: 5F       ld   e,a
4974: 7C       ld   a,h
4975: AA       xor  d
4976: 3E 1C    ld   a,$1C
4978: AA       xor  d
4979: AA       xor  d
497A: 25       dec  h
497B: 24       inc  h
497C: 19       add  hl,de
497D: 1E 1C    ld   e,$1C
497F: 11 24 01 ld   de,$0124
4982: 24       inc  h
4983: 19       add  hl,de
4984: 15       dec  d
4985: 0A       ld   a,(bc)
4986: 22 0E 1B ld   ($1B0E),hl
4989: 24       inc  h
498A: 0B       dec  bc
498B: 1E 1D    ld   e,$1D
498D: 1D       dec  e
498E: 18 17    jr   $49A7
4990: 24       inc  h
4991: 25       dec  h
4992: FF       rst  $38
4993: 25       dec  h
4994: 24       inc  h
4995: 19       add  hl,de
4996: 1E 1C    ld   e,$1C
4998: 11 24 02 ld   de,$0224
499B: 24       inc  h
499C: 19       add  hl,de
499D: 15       dec  d
499E: 0A       ld   a,(bc)
499F: 22 0E 1B ld   ($1B0E),hl
49A2: 24       inc  h
49A3: 0B       dec  bc
49A4: 1E 1D    ld   e,$1D
49A6: 1D       dec  e
49A7: 18 17    jr   $49C0
49A9: 24       inc  h
49AA: 25       dec  h
49AB: FF       rst  $38
49AC: 2B       dec  hl
49AD: 2B       dec  hl
49AE: 2B       dec  hl
49AF: 2B       dec  hl
49B0: 2B       dec  hl
49B1: 2B       dec  hl
49B2: 24       inc  h
49B3: FF       rst  $38
49B4: 10 0A    djnz $49C0
49B6: 16 0E    ld   d,$0E
49B8: 24       inc  h
49B9: 18 1F    jr   $49DA
49BB: 0E 1B    ld   c,$1B
49BD: FF       rst  $38
49BE: 19       add  hl,de
49BF: 15       dec  d
49C0: 0A       ld   a,(bc)
49C1: 22 0E 1B ld   ($1B0E),hl
49C4: 24       inc  h
49C5: 01 FF 19 ld   bc,$19FF
49C8: 15       dec  d
49C9: 0A       ld   a,(bc)
49CA: 22 0E 1B ld   ($1B0E),hl
49CD: 24       inc  h
49CE: 02       ld   (bc),a
49CF: FF       rst  $38
49D0: FF       rst  $38
49D1: FF       rst  $38
49D2: 1F       rra
49D3: 1F       rra
49D4: AA       xor  d
49D5: FE FE    cp   $FE
49D7: 1C       inc  e
49D8: 1C       inc  e
49D9: AA       xor  d
49DA: 7C       ld   a,h
49DB: 7C       ld   a,h
49DC: 1C       inc  e
49DD: 1C       inc  e
49DE: AA       xor  d
49DF: AA       xor  d
49E0: 00       nop
49E1: 00       nop
49E2: 00       nop
49E3: 00       nop
49E4: 00       nop
49E5: 00       nop
49E6: 00       nop
49E7: 00       nop
49E8: 00       nop
49E9: 00       nop
49EA: 00       nop
49EB: 00       nop
49EC: 00       nop
49ED: 00       nop
49EE: 00       nop
49EF: 00       nop
49F0: 00       nop
49F1: 00       nop
49F2: 00       nop
49F3: 00       nop
49F4: 00       nop
49F5: 00       nop
49F6: 00       nop
49F7: 00       nop
49F8: 00       nop
49F9: 00       nop
49FA: 00       nop
49FB: 00       nop
49FC: 00       nop
49FD: 00       nop
49FE: 00       nop
49FF: 00       nop
4A00: FC FC AA call m,$AAFC
4A03: 66       ld   h,(hl)
4A04: 66       ld   h,(hl)
4A05: AA       xor  d
4A06: 25       dec  h
4A07: 25       dec  h
4A08: AA       xor  d
4A09: 19       add  hl,de
4A0A: 19       add  hl,de
4A0B: AA       xor  d
4A0C: AA       xor  d
4A0D: F8       ret  m
4A0E: F8       ret  m
4A0F: 01 01 AA ld   bc,$AA01
4A12: CC CC AA call z,$AACC
4A15: 4A       ld   c,d
4A16: 4A       ld   c,d
4A17: AA       xor  d
4A18: 32 32 AA ld   ($AA32),a
4A1B: AA       xor  d
4A1C: F0       ret  p
4A1D: F0       ret  p
4A1E: 03       inc  bc
4A1F: 03       inc  bc
4A20: AA       xor  d
4A21: 98       sbc  a,b
4A22: 98       sbc  a,b
4A23: 01 01 AA ld   bc,$AA01
4A26: 94       sub  h
4A27: 94       sub  h
4A28: AA       xor  d
4A29: 64       ld   h,h
4A2A: 64       ld   h,h
4A2B: AA       xor  d
4A2C: AA       xor  d
4A2D: E0       ret  po
4A2E: E0       ret  po
4A2F: 07       rlca
4A30: 07       rlca
4A31: AA       xor  d
4A32: 30 30    jr   nc,$4A64
4A34: 03       inc  bc
4A35: 03       inc  bc
4A36: AA       xor  d
4A37: 28 28    jr   z,$4A61
4A39: 01 01 AA ld   bc,$AA01
4A3C: C8       ret  z
4A3D: C8       ret  z
4A3E: AA       xor  d
4A3F: AA       xor  d
4A40: C0       ret  nz
4A41: C0       ret  nz
4A42: 0F       rrca
4A43: 0F       rrca
4A44: AA       xor  d
4A45: D0       ret  nc
4A46: D0       ret  nc
4A47: 06 06    ld   b,$06
4A49: AA       xor  d
4A4A: E0       ret  po
4A4B: E0       ret  po
4A4C: 02       ld   (bc),a
4A4D: 02       ld   (bc),a
4A4E: AA       xor  d
4A4F: 80       add  a,b
4A50: 80       add  a,b
4A51: 01 01 AA ld   bc,$AA01
4A54: AA       xor  d
4A55: 80       add  a,b
4A56: 80       add  a,b
4A57: 1F       rra
4A58: 1F       rra
4A59: AA       xor  d
4A5A: A0       and  b
4A5B: A0       and  b
4A5C: 0D       dec  c
4A5D: 0D       dec  c
4A5E: AA       xor  d
4A5F: C0       ret  nz
4A60: C0       ret  nz
4A61: 05       dec  b
4A62: 05       dec  b
4A63: AA       xor  d
4A64: 00       nop
4A65: 00       nop
4A66: 03       inc  bc
4A67: 03       inc  bc
4A68: AA       xor  d
4A69: AA       xor  d
4A6A: 00       nop
4A6B: 00       nop
4A6C: 3F       ccf
4A6D: 3F       ccf
4A6E: AA       xor  d
4A6F: 40       ld   b,b
4A70: 40       ld   b,b
4A71: 1B       dec  de
4A72: 1B       dec  de
4A73: AA       xor  d
4A74: 80       add  a,b
4A75: 80       add  a,b
4A76: 0B       dec  bc
4A77: 0B       dec  bc
4A78: AA       xor  d
4A79: 00       nop
4A7A: 00       nop
4A7B: 06 06    ld   b,$06
4A7D: AA       xor  d
4A7E: AA       xor  d
4A7F: 00       nop
4A80: 00       nop
4A81: 7E       ld   a,(hl)
4A82: 7E       ld   a,(hl)
4A83: AA       xor  d
4A84: 80       add  a,b
4A85: 80       add  a,b
4A86: 36 36    ld   (hl),$36
4A88: AA       xor  d
4A89: 00       nop
4A8A: 00       nop
4A8B: 17       rla
4A8C: 17       rla
4A8D: AA       xor  d
4A8E: 00       nop
4A8F: 00       nop
4A90: 0C       inc  c
4A91: 0C       inc  c
4A92: AA       xor  d
4A93: AA       xor  d
4A94: 00       nop
4A95: 00       nop
4A96: 00       nop
4A97: 00       nop
4A98: 7E       ld   a,(hl)
4A99: FF       rst  $38
4A9A: AA       xor  d
4A9B: 66       ld   h,(hl)
4A9C: 7A       ld   a,d
4A9D: AA       xor  d
4A9E: 42       ld   b,d
4A9F: 64       ld   h,h
4AA0: AA       xor  d
4AA1: BD       cp   l
4AA2: 7E       ld   a,(hl)
4AA3: AA       xor  d
4AA4: 7F       ld   a,a
4AA5: FF       rst  $38
4AA6: AA       xor  d
4AA7: 7F       ld   a,a
4AA8: 7E       ld   a,(hl)
4AA9: AA       xor  d
4AAA: 3E 7F    ld   a,$7F
4AAC: AA       xor  d
4AAD: 1E 37    ld   e,$37
4AAF: AA       xor  d
4AB0: AA       xor  d
4AB1: 7E       ld   a,(hl)
4AB2: 3F       ccf
4AB3: AA       xor  d
4AB4: EE 1F    xor  $1F
4AB6: AA       xor  d
4AB7: EA 3F AA jp   pe,$AA3F
4ABA: C9       ret
4ABB: 7F       ld   a,a
4ABC: AA       xor  d
4ABD: 7F       ld   a,a
4ABE: FF       rst  $38
4ABF: AA       xor  d
4AC0: 7F       ld   a,a
4AC1: FF       rst  $38
4AC2: AA       xor  d
4AC3: F3       di
4AC4: FE AA    cp   $AA
4AC6: F3       di
4AC7: 7E       ld   a,(hl)
4AC8: AA       xor  d
4AC9: FF       rst  $38
4ACA: 5F       ld   e,a
4ACB: AA       xor  d
4ACC: 7E       ld   a,(hl)
4ACD: 4D       ld   c,l
4ACE: AA       xor  d
4ACF: 7C       ld   a,h
4AD0: 7E       ld   a,(hl)
4AD1: AA       xor  d
4AD2: 78       ld   a,b
4AD3: 13       inc  de
4AD4: AA       xor  d
4AD5: AA       xor  d
4AD6: 00       nop
4AD7: 00       nop
4AD8: 00       nop
4AD9: 00       nop
4ADA: 00       nop
4ADB: 00       nop
4ADC: 00       nop
4ADD: 00       nop
4ADE: 00       nop
4ADF: 00       nop
4AE0: 68       ld   l,b
4AE1: 48       ld   c,b
4AE2: 98       sbc  a,b
4AE3: 4A       ld   c,d
4AE4: B1       or   c
4AE5: 4A       ld   c,d
4AE6: 40       ld   b,b
4AE7: 49       ld   c,c
4AE8: 68       ld   l,b
4AE9: 48       ld   c,b
4AEA: 98       sbc  a,b
4AEB: 4A       ld   c,d
4AEC: B1       or   c
4AED: 4A       ld   c,d
4AEE: 40       ld   b,b
4AEF: 49       ld   c,c
4AF0: 00       nop
4AF1: 40       ld   b,b
4AF2: 15       dec  d
4AF3: 40       ld   b,b
4AF4: 3C       inc  a
4AF5: 40       ld   b,b
4AF6: 73       ld   (hl),e
4AF7: 40       ld   b,b
4AF8: 00       nop
4AF9: 40       ld   b,b
4AFA: 15       dec  d
4AFB: 40       ld   b,b
4AFC: 3C       inc  a
4AFD: 40       ld   b,b
4AFE: 73       ld   (hl),e
4AFF: 40       ld   b,b
4B00: FE FE    cp   $FE
4B02: FF       rst  $38
4B03: 0F       rrca
4B04: AA       xor  d
4B05: FE C6    cp   $C6
4B07: 0F       rrca
4B08: 00       nop
4B09: AA       xor  d
4B0A: C6 C3    add  a,$C3
4B0C: 00       nop
4B0D: 00       nop
4B0E: AA       xor  d
4B0F: C3 C0 00 jp   $00C0
4B12: 00       nop
4B13: AA       xor  d
4B14: C0       ret  nz
4B15: F8       ret  m
4B16: 00       nop
4B17: 03       inc  bc
4B18: AA       xor  d
4B19: F8       ret  m
4B1A: F8       ret  m
4B1B: 03       inc  bc
4B1C: 03       inc  bc
4B1D: AA       xor  d
4B1E: F8       ret  m
4B1F: 00       nop
4B20: 03       inc  bc
4B21: 00       nop
4B22: AA       xor  d
4B23: AA       xor  d
4B24: FC FC FF call m,$FFFC
4B27: 1F       rra
4B28: 01 00 AA ld   bc,$AA00
4B2B: FC 8C 1F call m,$1F8C
4B2E: 01 AA 8C ld   bc,$8CAA
4B31: 86       add  a,(hl)
4B32: 01 01 AA ld   bc,$AA01
4B35: 86       add  a,(hl)
4B36: 80       add  a,b
4B37: 01 01 AA ld   bc,$AA01
4B3A: 80       add  a,b
4B3B: F0       ret  p
4B3C: 01 07 AA ld   bc,$AA07
4B3F: F0       ret  p
4B40: F0       ret  p
4B41: 07       rlca
4B42: 07       rlca
4B43: AA       xor  d
4B44: F0       ret  p
4B45: 00       nop
4B46: 07       rlca
4B47: 00       nop
4B48: AA       xor  d
4B49: AA       xor  d
4B4A: F8       ret  m
4B4B: F8       ret  m
4B4C: FF       rst  $38
4B4D: 3F       ccf
4B4E: 03       inc  bc
4B4F: 00       nop
4B50: AA       xor  d
4B51: F8       ret  m
4B52: 18 3F    jr   $4B93
4B54: 03       inc  bc
4B55: AA       xor  d
4B56: 18 0C    jr   $4B64
4B58: 03       inc  bc
4B59: 03       inc  bc
4B5A: AA       xor  d
4B5B: 0C       inc  c
4B5C: 00       nop
4B5D: 03       inc  bc
4B5E: 03       inc  bc
4B5F: AA       xor  d
4B60: 00       nop
4B61: E0       ret  po
4B62: 03       inc  bc
4B63: 0F       rrca
4B64: AA       xor  d
4B65: E0       ret  po
4B66: E0       ret  po
4B67: 0F       rrca
4B68: 0F       rrca
4B69: AA       xor  d
4B6A: E0       ret  po
4B6B: 00       nop
4B6C: 0F       rrca
4B6D: 00       nop
4B6E: AA       xor  d
4B6F: AA       xor  d
4B70: F0       ret  p
4B71: F0       ret  p
4B72: FF       rst  $38
4B73: 7F       ld   a,a
4B74: 07       rlca
4B75: 00       nop
4B76: AA       xor  d
4B77: F0       ret  p
4B78: 30 7F    jr   nc,$4BF9
4B7A: 06 AA    ld   b,$AA
4B7C: 30 18    jr   nc,$4B96
4B7E: 06 06    ld   b,$06
4B80: AA       xor  d
4B81: 18 00    jr   $4B83
4B83: 06 06    ld   b,$06
4B85: AA       xor  d
4B86: 00       nop
4B87: C0       ret  nz
4B88: 06 1F    ld   b,$1F
4B8A: AA       xor  d
4B8B: C0       ret  nz
4B8C: C0       ret  nz
4B8D: 1F       rra
4B8E: 1F       rra
4B8F: AA       xor  d
4B90: C0       ret  nz
4B91: 00       nop
4B92: 1F       rra
4B93: 00       nop
4B94: AA       xor  d
4B95: AA       xor  d
4B96: E0       ret  po
4B97: E0       ret  po
4B98: FF       rst  $38
4B99: FF       rst  $38
4B9A: 0F       rrca
4B9B: 00       nop
4B9C: AA       xor  d
4B9D: E0       ret  po
4B9E: 60       ld   h,b
4B9F: FF       rst  $38
4BA0: 0C       inc  c
4BA1: AA       xor  d
4BA2: 60       ld   h,b
4BA3: 30 0C    jr   nc,$4BB1
4BA5: 0C       inc  c
4BA6: AA       xor  d
4BA7: 30 00    jr   nc,$4BA9
4BA9: 0C       inc  c
4BAA: 0C       inc  c
4BAB: AA       xor  d
4BAC: 00       nop
4BAD: 80       add  a,b
4BAE: 0C       inc  c
4BAF: 3F       ccf
4BB0: AA       xor  d
4BB1: 80       add  a,b
4BB2: 80       add  a,b
4BB3: 3F       ccf
4BB4: 3F       ccf
4BB5: AA       xor  d
4BB6: 80       add  a,b
4BB7: 00       nop
4BB8: 3F       ccf
4BB9: 00       nop
4BBA: AA       xor  d
4BBB: AA       xor  d
4BBC: C0       ret  nz
4BBD: C0       ret  nz
4BBE: FF       rst  $38
4BBF: FF       rst  $38
4BC0: 1F       rra
4BC1: 01 AA C0 ld   bc,$C0AA
4BC4: C0       ret  nz
4BC5: FF       rst  $38
4BC6: 18 01    jr   $4BC9
4BC8: 00       nop
4BC9: AA       xor  d
4BCA: C0       ret  nz
4BCB: 60       ld   h,b
4BCC: 18 18    jr   $4BE6
4BCE: AA       xor  d
4BCF: 60       ld   h,b
4BD0: 00       nop
4BD1: 18 18    jr   $4BEB
4BD3: AA       xor  d
4BD4: 00       nop
4BD5: 00       nop
4BD6: 18 7F    jr   $4C57
4BD8: AA       xor  d
4BD9: 00       nop
4BDA: 00       nop
4BDB: 7F       ld   a,a
4BDC: 7F       ld   a,a
4BDD: AA       xor  d
4BDE: 00       nop
4BDF: 00       nop
4BE0: 7F       ld   a,a
4BE1: 00       nop
4BE2: AA       xor  d
4BE3: AA       xor  d
4BE4: 80       add  a,b
4BE5: 80       add  a,b
4BE6: FF       rst  $38
4BE7: FF       rst  $38
4BE8: 3F       ccf
4BE9: 03       inc  bc
4BEA: AA       xor  d
4BEB: 80       add  a,b
4BEC: 80       add  a,b
4BED: FF       rst  $38
4BEE: 31 03 00 ld   sp,$0003
4BF1: AA       xor  d
4BF2: 80       add  a,b
4BF3: C0       ret  nz
4BF4: 31 30 AA ld   sp,$AA30
4BF7: C0       ret  nz
4BF8: 00       nop
4BF9: 30 30    jr   nc,$4C2B
4BFB: AA       xor  d
4BFC: 00       nop
4BFD: 00       nop
4BFE: 30 FE    jr   nc,$4BFE
4C00: AA       xor  d
4C01: 00       nop
4C02: 00       nop
4C03: FE FE    cp   $FE
4C05: AA       xor  d
4C06: 00       nop
4C07: 00       nop
4C08: FE 00    cp   $00
4C0A: AA       xor  d
4C0B: AA       xor  d
4C0C: 00       nop
4C0D: 00       nop
4C0E: FF       rst  $38
4C0F: FF       rst  $38
4C10: 7F       ld   a,a
4C11: 07       rlca
4C12: AA       xor  d
4C13: 00       nop
4C14: 00       nop
4C15: FF       rst  $38
4C16: 63       ld   h,e
4C17: 07       rlca
4C18: 00       nop
4C19: AA       xor  d
4C1A: 00       nop
4C1B: 80       add  a,b
4C1C: 63       ld   h,e
4C1D: 61       ld   h,c
4C1E: AA       xor  d
4C1F: 80       add  a,b
4C20: 00       nop
4C21: 61       ld   h,c
4C22: 60       ld   h,b
4C23: AA       xor  d
4C24: 00       nop
4C25: 00       nop
4C26: 60       ld   h,b
4C27: FC 00 01 call m,$0100
4C2A: AA       xor  d
4C2B: 00       nop
4C2C: 00       nop
4C2D: FC FC 01 call m,$01FC
4C30: 01 AA 00 ld   bc,$00AA
4C33: 00       nop
4C34: FC 00 01 call m,$0100
4C37: 00       nop
4C38: AA       xor  d
4C39: AA       xor  d
4C3A: 00       nop
4C3B: 00       nop
4C3C: 00       nop
4C3D: 00       nop
4C3E: AA       xor  d
4C3F: 00       nop
4C40: 00       nop
4C41: 00       nop
4C42: F0       ret  p
4C43: AA       xor  d
4C44: 00       nop
4C45: 00       nop
4C46: E0       ret  po
4C47: FE AA    cp   $AA
4C49: 00       nop
4C4A: 00       nop
4C4B: FE F8    cp   $F8
4C4D: AA       xor  d
4C4E: 00       nop
4C4F: 03       inc  bc
4C50: F8       ret  m
4C51: F8       ret  m
4C52: AA       xor  d
4C53: 03       inc  bc
4C54: 03       inc  bc
4C55: F8       ret  m
4C56: F8       ret  m
4C57: AA       xor  d
4C58: 03       inc  bc
4C59: 03       inc  bc
4C5A: F8       ret  m
4C5B: F8       ret  m
4C5C: AA       xor  d
4C5D: AA       xor  d
4C5E: 01 01 00 ld   bc,$0001
4C61: 00       nop
4C62: 0C       inc  c
4C63: 00       nop
4C64: AA       xor  d
4C65: 01 00 00 ld   bc,$0000
4C68: E0       ret  po
4C69: AA       xor  d
4C6A: 00       nop
4C6B: 00       nop
4C6C: 80       add  a,b
4C6D: FC AA 00 call m,$00AA
4C70: 00       nop
4C71: FC F0 AA call m,$AAF0
4C74: 00       nop
4C75: 07       rlca
4C76: F0       ret  p
4C77: F0       ret  p
4C78: AA       xor  d
4C79: 07       rlca
4C7A: 07       rlca
4C7B: F0       ret  p
4C7C: F0       ret  p
4C7D: AA       xor  d
4C7E: 07       rlca
4C7F: 07       rlca
4C80: F0       ret  p
4C81: F0       ret  p
4C82: AA       xor  d
4C83: AA       xor  d
4C84: 01 01 00 ld   bc,$0001
4C87: 00       nop
4C88: F8       ret  m
4C89: 00       nop
4C8A: AA       xor  d
4C8B: 01 01 00 ld   bc,$0001
4C8E: C0       ret  nz
4C8F: AA       xor  d
4C90: 01 01 C0 ld   bc,$C001
4C93: F8       ret  m
4C94: AA       xor  d
4C95: 01 01 F8 ld   bc,$F801
4C98: E0       ret  po
4C99: AA       xor  d
4C9A: 01 0F E0 ld   bc,$E00F
4C9D: E0       ret  po
4C9E: AA       xor  d
4C9F: 0F       rrca
4CA0: 0F       rrca
4CA1: E0       ret  po
4CA2: E0       ret  po
4CA3: AA       xor  d
4CA4: 0F       rrca
4CA5: 0F       rrca
4CA6: E0       ret  po
4CA7: E0       ret  po
4CA8: AA       xor  d
4CA9: AA       xor  d
4CAA: 07       rlca
4CAB: 07       rlca
4CAC: 00       nop
4CAD: 00       nop
4CAE: F0       ret  p
4CAF: 00       nop
4CB0: AA       xor  d
4CB1: 07       rlca
4CB2: 03       inc  bc
4CB3: 00       nop
4CB4: 00       nop
4CB5: AA       xor  d
4CB6: 03       inc  bc
4CB7: 03       inc  bc
4CB8: 00       nop
4CB9: F0       ret  p
4CBA: AA       xor  d
4CBB: 03       inc  bc
4CBC: 03       inc  bc
4CBD: F0       ret  p
4CBE: C0       ret  nz
4CBF: AA       xor  d
4CC0: 03       inc  bc
4CC1: 1F       rra
4CC2: C0       ret  nz
4CC3: C0       ret  nz
4CC4: AA       xor  d
4CC5: 1F       rra
4CC6: 1F       rra
4CC7: C0       ret  nz
4CC8: C0       ret  nz
4CC9: AA       xor  d
4CCA: 1F       rra
4CCB: 1F       rra
4CCC: C0       ret  nz
4CCD: C0       ret  nz
4CCE: AA       xor  d
4CCF: AA       xor  d
4CD0: 0F       rrca
4CD1: 0F       rrca
4CD2: 00       nop
4CD3: 00       nop
4CD4: E0       ret  po
4CD5: 00       nop
4CD6: AA       xor  d
4CD7: 0F       rrca
4CD8: 07       rlca
4CD9: 00       nop
4CDA: 00       nop
4CDB: AA       xor  d
4CDC: 07       rlca
4CDD: 07       rlca
4CDE: 00       nop
4CDF: E0       ret  po
4CE0: AA       xor  d
4CE1: 07       rlca
4CE2: 07       rlca
4CE3: E0       ret  po
4CE4: 80       add  a,b
4CE5: AA       xor  d
4CE6: 07       rlca
4CE7: 3F       ccf
4CE8: 80       add  a,b
4CE9: 80       add  a,b
4CEA: AA       xor  d
4CEB: 3F       ccf
4CEC: 3F       ccf
4CED: 80       add  a,b
4CEE: 80       add  a,b
4CEF: AA       xor  d
4CF0: 3F       ccf
4CF1: 3F       ccf
4CF2: 80       add  a,b
4CF3: 80       add  a,b
4CF4: AA       xor  d
4CF5: AA       xor  d
4CF6: 1F       rra
4CF7: 1F       rra
4CF8: 00       nop
4CF9: 00       nop
4CFA: C0       ret  nz
4CFB: E0       ret  po
4CFC: AA       xor  d
4CFD: 1F       rra
4CFE: 0F       rrca
4CFF: 00       nop
4D00: 00       nop
4D01: E0       ret  po
4D02: FC AA 0F call m,$0FAA
4D05: 0F       rrca
4D06: 00       nop
4D07: C0       ret  nz
4D08: AA       xor  d
4D09: 0F       rrca
4D0A: 0F       rrca
4D0B: C0       ret  nz
4D0C: 00       nop
4D0D: AA       xor  d
4D0E: 0F       rrca
4D0F: 7F       ld   a,a
4D10: 00       nop
4D11: 00       nop
4D12: AA       xor  d
4D13: 7F       ld   a,a
4D14: 7F       ld   a,a
4D15: 00       nop
4D16: 00       nop
4D17: AA       xor  d
4D18: 7F       ld   a,a
4D19: 7F       ld   a,a
4D1A: 00       nop
4D1B: 00       nop
4D1C: AA       xor  d
4D1D: AA       xor  d
4D1E: 3F       ccf
4D1F: 3F       ccf
4D20: 00       nop
4D21: 00       nop
4D22: 80       add  a,b
4D23: 80       add  a,b
4D24: AA       xor  d
4D25: 3F       ccf
4D26: 1F       rra
4D27: 00       nop
4D28: 00       nop
4D29: 80       add  a,b
4D2A: F8       ret  m
4D2B: AA       xor  d
4D2C: 1F       rra
4D2D: 1F       rra
4D2E: 00       nop
4D2F: 80       add  a,b
4D30: AA       xor  d
4D31: 1F       rra
4D32: 1F       rra
4D33: 80       add  a,b
4D34: 00       nop
4D35: AA       xor  d
4D36: 1F       rra
4D37: FF       rst  $38
4D38: 00       nop
4D39: 00       nop
4D3A: AA       xor  d
4D3B: FF       rst  $38
4D3C: FF       rst  $38
4D3D: 00       nop
4D3E: 00       nop
4D3F: AA       xor  d
4D40: FF       rst  $38
4D41: FF       rst  $38
4D42: 00       nop
4D43: 00       nop
4D44: AA       xor  d
4D45: AA       xor  d
4D46: 7F       ld   a,a
4D47: 7F       ld   a,a
4D48: AA       xor  d
4D49: 7F       ld   a,a
4D4A: 3F       ccf
4D4B: AA       xor  d
4D4C: 3F       ccf
4D4D: 3F       ccf
4D4E: AA       xor  d
4D4F: 3F       ccf
4D50: 3F       ccf
4D51: AA       xor  d
4D52: 3F       ccf
4D53: FF       rst  $38
4D54: 00       nop
4D55: 01 00 FC ld   bc,$FC00
4D58: AA       xor  d
4D59: FF       rst  $38
4D5A: FF       rst  $38
4D5B: 01 01 FC ld   bc,$FC01
4D5E: FC AA FF call m,$FFAA
4D61: FF       rst  $38
4D62: 01 01 FC ld   bc,$FC01
4D65: FC AA AA call m,$AAAA
4D68: 70       ld   (hl),b
4D69: 60       ld   h,b
4D6A: AA       xor  d
4D6B: 60       ld   h,b
4D6C: 40       ld   b,b
4D6D: AA       xor  d
4D6E: 40       ld   b,b
4D6F: 00       nop
4D70: AA       xor  d
4D71: AA       xor  d
4D72: F8       ret  m
4D73: E0       ret  po
4D74: AA       xor  d
4D75: E0       ret  po
4D76: 80       add  a,b
4D77: AA       xor  d
4D78: 80       add  a,b
4D79: 00       nop
4D7A: AA       xor  d
4D7B: AA       xor  d
4D7C: FC E0 01 call m,$01E0
4D7F: 01 AA F0 ld   bc,$F0AA
4D82: 00       nop
4D83: 01 01 AA ld   bc,$AA01
4D86: 00       nop
4D87: 00       nop
4D88: 01 00 AA ld   bc,$AA00
4D8B: AA       xor  d
4D8C: FC E0 03 call m,$03E0
4D8F: 03       inc  bc
4D90: AA       xor  d
4D91: 80       add  a,b
4D92: 00       nop
4D93: 03       inc  bc
4D94: 02       ld   (bc),a
4D95: AA       xor  d
4D96: 00       nop
4D97: 00       nop
4D98: 02       ld   (bc),a
4D99: 00       nop
4D9A: AA       xor  d
4D9B: AA       xor  d
4D9C: F0       ret  p
4D9D: 80       add  a,b
4D9E: 07       rlca
4D9F: 07       rlca
4DA0: AA       xor  d
4DA1: 00       nop
4DA2: 00       nop
4DA3: 07       rlca
4DA4: 04       inc  b
4DA5: AA       xor  d
4DA6: 00       nop
4DA7: 00       nop
4DA8: 04       inc  b
4DA9: 00       nop
4DAA: AA       xor  d
4DAB: AA       xor  d
4DAC: C0       ret  nz
4DAD: 00       nop
4DAE: 0F       rrca
4DAF: 0E AA    ld   c,$AA
4DB1: 00       nop
4DB2: 00       nop
4DB3: 0E 08    ld   c,$08
4DB5: AA       xor  d
4DB6: 00       nop
4DB7: 00       nop
4DB8: 08       ex   af,af'
4DB9: 00       nop
4DBA: AA       xor  d
4DBB: AA       xor  d
4DBC: 00       nop
4DBD: 00       nop
4DBE: 1F       rra
4DBF: 1C       inc  e
4DC0: AA       xor  d
4DC1: 00       nop
4DC2: 00       nop
4DC3: 1C       inc  e
4DC4: 10 AA    djnz $4D70
4DC6: 00       nop
4DC7: 00       nop
4DC8: 10 00    djnz $4DCA
4DCA: AA       xor  d
4DCB: AA       xor  d
4DCC: 00       nop
4DCD: 00       nop
4DCE: 3C       inc  a
4DCF: 30 AA    jr   nc,$4D7B
4DD1: 00       nop
4DD2: 00       nop
4DD3: 30 20    jr   nc,$4DF5
4DD5: AA       xor  d
4DD6: 00       nop
4DD7: 00       nop
4DD8: 20 00    jr   nz,$4DDA
4DDA: AA       xor  d
4DDB: AA       xor  d
4DDC: 0C       inc  c
4DDD: 1B       dec  de
4DDE: 0E 0D    ld   c,$0D
4DE0: 12       ld   (de),a
4DE1: 1D       dec  e
4DE2: 24       inc  h
4DE3: FF       rst  $38
4DE4: 1C       inc  e
4DE5: 0C       inc  c
4DE6: 18 1B    jr   $4E03
4DE8: 0E 01    ld   c,$01
4DEA: 24       inc  h
4DEB: 24       inc  h
4DEC: 24       inc  h
4DED: 11 12 2A ld   de,$2A12
4DF0: 1C       inc  e
4DF1: 0C       inc  c
4DF2: 18 1B    jr   $4E0F
4DF4: 0E 24    ld   c,$24
4DF6: 24       inc  h
4DF7: 24       inc  h
4DF8: 1C       inc  e
4DF9: 0C       inc  c
4DFA: 18 1B    jr   $4E17
4DFC: 0E 02    ld   c,$02
4DFE: FF       rst  $38
4DFF: 00       nop
4E00: C0       ret  nz
4E01: A9       xor  c
4E02: 11 34 C1 ld   de,$C134
4E05: AF       xor  a
4E06: 12       ld   (de),a
4E07: 2A C2 2F ld   hl,($2FC2)
4E0A: 78       ld   a,b
4E0B: 3B       dec  sp
4E0C: C3 21 10 jp   $1021
4E0F: 2E C4    ld   l,$C4
4E11: CF       rst  $08
4E12: 10 33    djnz $4E47
4E14: C5       push bc
4E15: A3       and  e
4E16: 55       ld   d,l
4E17: 3D       dec  a
4E18: C6 AF    add  a,$AF
4E1A: 13       inc  de
4E1B: 36 C7    ld   (hl),$C7
4E1D: A7       and  a
4E1E: 12       ld   (de),a
4E1F: 28 C0    jr   z,$4DE1
4E21: 2D       dec  l
4E22: 58       ld   e,b
4E23: 3A C1 22 ld   a,($22C1)
4E26: 58       ld   e,b
4E27: 2E C2    ld   l,$C2
4E29: C2 17 34 jp   nz,$3417
4E2C: C3 AE 75 jp   $75AE
4E2F: 3D       dec  a
4E30: C4 21 55 call nz,$5521
4E33: 29       add  hl,hl
4E34: C5       push bc
4E35: 29       add  hl,hl
4E36: 74       ld   (hl),h
4E37: 31 C6 E1 ld   sp,$E1C6
4E3A: 15       dec  d
4E3B: 34       inc  (hl)
4E3C: C7       rst  $00
4E3D: E9       jp   (hl)
4E3E: 36 3B    ld   (hl),$3B
4E40: C0       ret  nz
4E41: 22 56 3F ld   ($3F56),hl
4E44: C1       pop  bc
4E45: 63       ld   h,e
4E46: 13       inc  de
4E47: 3C       inc  a
4E48: C2 A2 17 jp   nz,$17A2
4E4B: 31 C3 41 ld   sp,$41C3
4E4E: 10 2E    djnz $4E7E
4E50: C4 61 36 call nz,$3661
4E53: 3A C5 69 ld   a,($69C5)
4E56: 58       ld   e,b
4E57: 2C       inc  l
4E58: C6 62    add  a,$62
4E5A: 37       scf
4E5B: 34       inc  (hl)
4E5C: C7       rst  $00
4E5D: C1       pop  bc
4E5E: 38 3D    jr   c,$4E9D
4E60: C4 22 55 call nz,$5522
4E63: 29       add  hl,hl
4E64: C5       push bc
4E65: 49       ld   c,c
4E66: 74       ld   (hl),h
4E67: 31 C6 E3 ld   sp,$E3C6
4E6A: 15       dec  d
4E6B: 34       inc  (hl)
4E6C: C7       rst  $00
4E6D: E5       push hl
4E6E: 36 3B    ld   (hl),$3B
4E70: C0       ret  nz
4E71: 23       inc  hl
4E72: 56       ld   d,(hl)
4E73: 3F       ccf
4E74: C1       pop  bc
4E75: 69       ld   l,c
4E76: 33       inc  sp
4E77: 3C       inc  a
4E78: C2 A1 15 jp   nz,$15A1
4E7B: 30 00    jr   nc,$4E7D
4E7D: 00       nop
4E7E: 00       nop
4E7F: 00       nop
4E80: 00       nop
4E81: 1C       inc  e
4E82: 3E 43    ld   a,$43
4E84: 41       ld   b,c
4E85: 61       ld   h,c
4E86: 3E 1C    ld   a,$1C
4E88: 00       nop
4E89: 01 21 7F ld   bc,$7F21
4E8C: 7F       ld   a,a
4E8D: 01 01 00 ld   bc,$0001
4E90: 00       nop
4E91: 23       inc  hl
4E92: 67       ld   h,a
4E93: 4F       ld   c,a
4E94: 4D       ld   c,l
4E95: 5D       ld   e,l
4E96: 79       ld   a,c
4E97: 31 00 02 ld   sp,$0200
4E9A: 43       ld   b,e
4E9B: 49       ld   c,c
4E9C: 59       ld   e,c
4E9D: 79       ld   a,c
4E9E: 6F       ld   l,a
4E9F: 46       ld   b,(hl)
4EA0: 00       nop
4EA1: 0C       inc  c
4EA2: 1C       inc  e
4EA3: 34       inc  (hl)
4EA4: 64       ld   h,h
4EA5: 7F       ld   a,a
4EA6: 7F       ld   a,a
4EA7: 04       inc  b
4EA8: 00       nop
4EA9: 72       ld   (hl),d
4EAA: 73       ld   (hl),e
4EAB: 51       ld   d,c
4EAC: 51       ld   d,c
4EAD: 51       ld   d,c
4EAE: 5F       ld   e,a
4EAF: 0E 00    ld   c,$00
4EB1: 1E 3F    ld   e,$3F
4EB3: 69       ld   l,c
4EB4: 49       ld   c,c
4EB5: 49       ld   c,c
4EB6: 4F       ld   c,a
4EB7: 06 00    ld   b,$00
4EB9: 60       ld   h,b
4EBA: 60       ld   h,b
4EBB: 47       ld   b,a
4EBC: 4F       ld   c,a
4EBD: 58       ld   e,b
4EBE: 70       ld   (hl),b
4EBF: 60       ld   h,b
4EC0: 00       nop
4EC1: 36 79    ld   (hl),$79
4EC3: 59       ld   e,c
4EC4: 4D       ld   c,l
4EC5: 4D       ld   c,l
4EC6: 37       scf
4EC7: 06 00    ld   b,$00
4EC9: 30 79    jr   nc,$4F44
4ECB: 49       ld   c,c
4ECC: 49       ld   c,c
4ECD: 4B       ld   c,e
4ECE: 7E       ld   a,(hl)
4ECF: 3C       inc  a
4ED0: 00       nop
4ED1: 1F       rra
4ED2: 3F       ccf
4ED3: 64       ld   h,h
4ED4: 44       ld   b,h
4ED5: 64       ld   h,h
4ED6: 3F       ccf
4ED7: 1F       rra
4ED8: 00       nop
4ED9: 7F       ld   a,a
4EDA: 7F       ld   a,a
4EDB: 49       ld   c,c
4EDC: 49       ld   c,c
4EDD: 49       ld   c,c
4EDE: 7F       ld   a,a
4EDF: 36 00    ld   (hl),$00
4EE1: 1C       inc  e
4EE2: 3E 63    ld   a,$63
4EE4: 41       ld   b,c
4EE5: 41       ld   b,c
4EE6: 63       ld   h,e
4EE7: 22 00 7F ld   ($7F00),hl
4EEA: 7F       ld   a,a
4EEB: 41       ld   b,c
4EEC: 41       ld   b,c
4EED: 63       ld   h,e
4EEE: 3E 1C    ld   a,$1C
4EF0: 00       nop
4EF1: 7F       ld   a,a
4EF2: 7F       ld   a,a
4EF3: 49       ld   c,c
4EF4: 49       ld   c,c
4EF5: 49       ld   c,c
4EF6: 41       ld   b,c
4EF7: 41       ld   b,c
4EF8: 00       nop
4EF9: 7F       ld   a,a
4EFA: 7F       ld   a,a
4EFB: 48       ld   c,b
4EFC: 48       ld   c,b
4EFD: 48       ld   c,b
4EFE: 48       ld   c,b
4EFF: 40       ld   b,b
4F00: 00       nop
4F01: 1C       inc  e
4F02: 3E 63    ld   a,$63
4F04: 41       ld   b,c
4F05: 49       ld   c,c
4F06: 4F       ld   c,a
4F07: 4F       ld   c,a
4F08: 00       nop
4F09: 7F       ld   a,a
4F0A: 7F       ld   a,a
4F0B: 08       ex   af,af'
4F0C: 08       ex   af,af'
4F0D: 08       ex   af,af'
4F0E: 7F       ld   a,a
4F0F: 7F       ld   a,a
4F10: 00       nop
4F11: 41       ld   b,c
4F12: 41       ld   b,c
4F13: 7F       ld   a,a
4F14: 7F       ld   a,a
4F15: 41       ld   b,c
4F16: 41       ld   b,c
4F17: 00       nop
4F18: 00       nop
4F19: 02       ld   (bc),a
4F1A: 03       inc  bc
4F1B: 01 01 01 ld   bc,$0101
4F1E: 7F       ld   a,a
4F1F: 7E       ld   a,(hl)
4F20: 00       nop
4F21: 7F       ld   a,a
4F22: 7F       ld   a,a
4F23: 0C       inc  c
4F24: 1E 37    ld   e,$37
4F26: 63       ld   h,e
4F27: 41       ld   b,c
4F28: 00       nop
4F29: 7F       ld   a,a
4F2A: 7F       ld   a,a
4F2B: 01 01 01 ld   bc,$0101
4F2E: 01 01 00 ld   bc,$0001
4F31: 7F       ld   a,a
4F32: 7F       ld   a,a
4F33: 38 1C    jr   c,$4F51
4F35: 38 7F    jr   c,$4FB6
4F37: 7F       ld   a,a
4F38: 00       nop
4F39: 7F       ld   a,a
4F3A: 7F       ld   a,a
4F3B: 38 1C    jr   c,$4F59
4F3D: 0E 7F    ld   c,$7F
4F3F: 7F       ld   a,a
4F40: 00       nop
4F41: 3E 7F    ld   a,$7F
4F43: 41       ld   b,c
4F44: 41       ld   b,c
4F45: 41       ld   b,c
4F46: 7F       ld   a,a
4F47: 3E 00    ld   a,$00
4F49: 7F       ld   a,a
4F4A: 7F       ld   a,a
4F4B: 44       ld   b,h
4F4C: 44       ld   b,h
4F4D: 44       ld   b,h
4F4E: 7C       ld   a,h
4F4F: 38 00    jr   c,$4F51
4F51: 3E 7F    ld   a,$7F
4F53: 41       ld   b,c
4F54: 45       ld   b,l
4F55: 47       ld   b,a
4F56: 7E       ld   a,(hl)
4F57: 3D       dec  a
4F58: 00       nop
4F59: 7F       ld   a,a
4F5A: 7F       ld   a,a
4F5B: 44       ld   b,h
4F5C: 46       ld   b,(hl)
4F5D: 4F       ld   c,a
4F5E: 7B       ld   a,e
4F5F: 39       add  hl,sp
4F60: 00       nop
4F61: 32 7B 49 ld   ($497B),a
4F64: 49       ld   c,c
4F65: 69       ld   l,c
4F66: 2F       cpl
4F67: 06 00    ld   b,$00
4F69: 40       ld   b,b
4F6A: 40       ld   b,b
4F6B: 7F       ld   a,a
4F6C: 7F       ld   a,a
4F6D: 40       ld   b,b
4F6E: 40       ld   b,b
4F6F: 00       nop
4F70: 00       nop
4F71: 7E       ld   a,(hl)
4F72: 7F       ld   a,a
4F73: 01 01 01 ld   bc,$0101
4F76: 7F       ld   a,a
4F77: 7E       ld   a,(hl)
4F78: 00       nop
4F79: 78       ld   a,b
4F7A: 7C       ld   a,h
4F7B: 0E 07    ld   c,$07
4F7D: 0E 7C    ld   c,$7C
4F7F: 78       ld   a,b
4F80: 00       nop
4F81: 7F       ld   a,a
4F82: 7F       ld   a,a
4F83: 0E 1C    ld   c,$1C
4F85: 0E 7F    ld   c,$7F
4F87: 7F       ld   a,a
4F88: 00       nop
4F89: 63       ld   h,e
4F8A: 77       ld   (hl),a
4F8B: 3E 1C    ld   a,$1C
4F8D: 37       scf
4F8E: 77       ld   (hl),a
4F8F: 63       ld   h,e
4F90: 00       nop
4F91: 70       ld   (hl),b
4F92: 78       ld   a,b
4F93: 0F       rrca
4F94: 0F       rrca
4F95: 78       ld   a,b
4F96: 70       ld   (hl),b
4F97: 00       nop
4F98: 00       nop
4F99: 63       ld   h,e
4F9A: 67       ld   h,a
4F9B: 6F       ld   l,a
4F9C: 7B       ld   a,e
4F9D: 73       ld   (hl),e
4F9E: 63       ld   h,e
4F9F: 00       nop
4FA0: 00       nop
4FA1: 00       nop
4FA2: 00       nop
4FA3: 00       nop
4FA4: 00       nop
4FA5: 00       nop
4FA6: 00       nop
4FA7: 00       nop
4FA8: 00       nop
4FA9: 22 14 7F ld   ($7F14),hl
4FAC: 14       inc  d
4FAD: 22 00 00 ld   ($0000),hl
4FB0: 00       nop
4FB1: 08       ex   af,af'
4FB2: 1C       inc  e
4FB3: 36 63    ld   (hl),$63
4FB5: 41       ld   b,c
4FB6: 00       nop
4FB7: 00       nop
4FB8: 00       nop
4FB9: 14       inc  d
4FBA: 14       inc  d
4FBB: 14       inc  d
4FBC: 14       inc  d
4FBD: 14       inc  d
4FBE: 14       inc  d
4FBF: 00       nop
4FC0: 00       nop
4FC1: 00       nop
4FC2: 41       ld   b,c
4FC3: 63       ld   h,e
4FC4: 36 1C    ld   (hl),$1C
4FC6: 08       ex   af,af'
4FC7: 00       nop
4FC8: 00       nop
4FC9: 00       nop
4FCA: 08       ex   af,af'
4FCB: 08       ex   af,af'
4FCC: 7F       ld   a,a
4FCD: 08       ex   af,af'
4FCE: 08       ex   af,af'
4FCF: 00       nop
4FD0: 00       nop
4FD1: 08       ex   af,af'
4FD2: 08       ex   af,af'
4FD3: 08       ex   af,af'
4FD4: 08       ex   af,af'
4FD5: 08       ex   af,af'
4FD6: 00       nop
4FD7: 00       nop
4FD8: 00       nop
4FD9: 38 12    jr   c,$4FED
4FDB: FC 12 38 call m,$3812
4FDE: 00       nop
4FDF: 00       nop
4FE0: 3C       inc  a
4FE1: 42       ld   b,d
4FE2: 99       sbc  a,c
4FE3: A5       and  l
4FE4: A5       and  l
4FE5: 81       add  a,c
4FE6: 42       ld   b,d
4FE7: 3C       inc  a
4FE8: FF       rst  $38
4FE9: FF       rst  $38
4FEA: FF       rst  $38
4FEB: FF       rst  $38
4FEC: FF       rst  $38
4FED: FF       rst  $38
4FEE: FF       rst  $38
4FEF: FF       rst  $38
4FF0: FF       rst  $38
4FF1: FF       rst  $38
4FF2: FF       rst  $38
4FF3: FF       rst  $38
4FF4: FF       rst  $38
4FF5: FF       rst  $38
4FF6: FF       rst  $38
4FF7: FF       rst  $38
4FF8: 0F       rrca
4FF9: F0       ret  p
4FFA: 00       nop
5000: 00       nop
5001: 40       ld   b,b
5002: F4 00 00 call p,$0000
5005: 00       nop
5034: 00       nop
5035: 38 00    jr   c,$5037
5037: 00       nop
5051: AA       xor  d
5052: 00       nop
5078: 00       nop
5079: 38 00    jr   c,$507B
507B: 00       nop
