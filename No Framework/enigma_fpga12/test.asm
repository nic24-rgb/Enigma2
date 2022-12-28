#define     progStart   $0000
.org        progStart
    ld  HL, $2400
    ld	A,$99
    ld	(HL),A
    ld	DE,$2401
    ld	BC,$1000
    ldir
    ret

21 00 24 3E 99 77 11 01 24 01 00 10 ED B0 C9