ovr321		segment	para public 'OVERLAY' use16
		assume cs:ovr321
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B11B0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+59h], 1
		mov	byte ptr [si+5Ah], 1
		pop	si
		pop	bp
		retf
sub_B11B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B11C2		proc far

var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4B		= word ptr -4Bh
var_48		= word ptr -48h
var_46		= word ptr -46h
var_45		= word ptr -45h
var_42		= word ptr -42h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+55h], 0
		jz	short loc_B11DA
		cmp	word ptr [si+53h], 0
		jnz	short loc_B11E3

loc_B11DA:
		mov	byte ptr [si+59h], 0
		mov	al, 1
		jmp	loc_B1698

loc_B11E3:
		xor	di, di
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 61h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	dx, [bp+var_4]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[bp+var_74], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_70], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_6C], eax
		push	word ptr [si+55h]
		mov	bx, [si+55h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_74]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	dx, [si+55h]
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		add	eax, [bp+var_74]
		mov	[bp+var_80], eax
		mov	eax, [bx+4]
		add	eax, [bp+var_70]
		mov	[bp+var_7C], eax
		mov	eax, [bx+8]
		add	eax, [bp+var_6C]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_8C]
		mov	[si+12h], eax
		mov	eax, [bp+var_88]
		mov	[si+16h], eax
		mov	eax, [bp+var_84]
		mov	[si+1Ah], eax
		mov	ax, si
		add	ax, 12h
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	eax, [si+0Ah]
		mov	[bp+var_8], eax
		cmp	byte ptr [si+5Ah], 0
		jz	short loc_B12D2
		mov	byte ptr [si+5Ah], 0
		mov	ax, word_7CADA
		mov	[bp+var_A], ax
		push	ax
		mov	ax, si
		add	ax, 53h
		push	ax
		call	SetReference16
		add	sp, 4
		mov	bx, [si+53h]
		push	word ptr [bx+52h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	[si+57h], ax

loc_B12D2:
		cmp	byte ptr [si+0A3h], 0
		jz	short loc_B12E2
		mov	byte ptr [si+0A3h], 0
		mov	byte ptr [si+59h], 0

loc_B12E2:
		cmp	byte ptr [si+59h], 0
		jnz	short loc_B12EB
		jmp	loc_B1639

loc_B12EB:
		push	1
		push	large [bp+var_8]
		les	bx, word ptr [bp+var_8]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		push	si
		nop
		push	cs
		call	near ptr sub_B169C
		pop	cx
		mov	ax, si
		add	ax, 5Bh
		push	ax
		mov	ax, si
		add	ax, 97h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	sub_578DF
		add	sp, 8
		mov	eax, [bp+var_24]
		mov	[bp+var_20], eax
		mov	dx, si
		add	dx, 5Bh
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_98], eax
		mov	eax, [bx+4]
		mov	[bp+var_94], eax
		mov	eax, [bx+8]
		mov	[bp+var_90], eax
		mov	dx, si
		add	dx, 97h
		mov	bx, dx
		mov	eax, [bx]
		sub	[bp+var_98], eax
		mov	eax, [bx+4]
		sub	[bp+var_94], eax
		mov	eax, [bx+8]
		sub	[bp+var_90], eax
		mov	eax, [bp+var_90]
		or	eax, eax
		jge	short loc_B1375
		neg	eax

loc_B1375:
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_94]
		or	eax, eax
		jge	short loc_B1387
		neg	eax

loc_B1387:
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_98]
		or	eax, eax
		jge	short loc_B1399
		neg	eax

loc_B1399:
		mov	[bp+var_A4], eax
		mov	ax, si
		add	ax, 8Bh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	sub_566A3
		add	sp, 6
		mov	[bp+var_30], 1400h
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_2C]
		push	ax
		call	sub_566A3
		add	sp, 6
		mov	dx, [si+53h]
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_68], eax
		mov	eax, [bx+4]
		mov	[bp+var_64], eax
		mov	eax, [bx+8]
		mov	[bp+var_60], eax
		mov	dx, [si+55h]
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		sub	[bp+var_68], eax
		mov	eax, [bx+4]
		sub	[bp+var_64], eax
		mov	eax, [bx+8]
		sub	[bp+var_60], eax
		mov	eax, [bp+var_9C]
		cmp	eax, [bp+var_2C]
		jle	short loc_B1418
		mov	ax, 1
		jmp	short loc_B141A

loc_B1418:
		xor	ax, ax

loc_B141A:
		or	al, al
		jnz	short loc_B1434
		mov	eax, [bp+var_A4]
		cmp	eax, [bp+var_2C]
		jle	short loc_B142E
		mov	ax, 1
		jmp	short loc_B1430

loc_B142E:
		xor	ax, ax

loc_B1430:
		or	al, al
		jz	short loc_B1439

loc_B1434:
		mov	byte ptr [si+52h], 3
		inc	di

loc_B1439:
		push	large [bp+var_60]
		push	large [bp+var_64]
		push	large [bp+var_68]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	eax, [si+93h]
		cmp	eax, [bp+var_38]
		jge	short loc_B1469
		mov	ax, 1
		jmp	short loc_B146B

loc_B1469:
		xor	ax, ax

loc_B146B:
		or	al, al
		jnz	short loc_B1472
		jmp	loc_B1517

loc_B1472:
		mov	eax, [si+8Bh]
		cmp	eax, [bp+var_20]
		jle	short loc_B1482
		mov	ax, 1
		jmp	short loc_B1484

loc_B1482:
		xor	ax, ax

loc_B1484:
		or	al, al
		jz	short loc_B148F
		mov	byte ptr [si+52h], 0
		jmp	loc_B15F5

loc_B148F:
		mov	eax, [bp+var_9C]
		cmp	eax, [bp+var_28]
		jle	short loc_B149F
		mov	ax, 1
		jmp	short loc_B14A1

loc_B149F:
		xor	ax, ax

loc_B14A1:
		or	al, al
		jz	short loc_B14DD
		mov	eax, [bp+var_9C]
		cmp	eax, [bp+var_A4]
		jle	short loc_B14B6
		mov	ax, 1
		jmp	short loc_B14B8

loc_B14B6:
		xor	ax, ax

loc_B14B8:
		or	al, al
		jz	short loc_B14DD
		cmp	[bp+var_90], 0
		jle	short loc_B14C9
		mov	ax, 1
		jmp	short loc_B14CB

loc_B14C9:
		xor	ax, ax

loc_B14CB:
		or	al, al
		jz	short loc_B14D6
		mov	byte ptr [si+52h], 6
		jmp	loc_B15F4

loc_B14D6:
		mov	byte ptr [si+52h], 2
		jmp	loc_B15F4

loc_B14DD:
		mov	eax, [bp+var_A4]
		cmp	eax, [bp+var_28]
		jle	short loc_B14ED
		mov	ax, 1
		jmp	short loc_B14EF

loc_B14ED:
		xor	ax, ax

loc_B14EF:
		or	al, al
		jnz	short loc_B14F6
		jmp	loc_B15F5

loc_B14F6:
		cmp	[bp+var_98], 0
		jle	short loc_B1503
		mov	ax, 1
		jmp	short loc_B1505

loc_B1503:
		xor	ax, ax

loc_B1505:
		or	al, al
		jz	short loc_B1510
		mov	byte ptr [si+52h], 4
		jmp	loc_B15F4

loc_B1510:
		mov	byte ptr [si+52h], 5
		jmp	loc_B15F4

loc_B1517:
		push	word ptr [si+55h]
		mov	bx, [si+55h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_46]
		push	ax
		call	sub_5720C
		add	sp, 6
		mov	ax, [bp+var_45]
		mov	[bp+var_42], ax
		push	word ptr [si+53h]
		mov	bx, [si+53h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_4C]
		push	ax
		call	sub_5720C
		add	sp, 6
		mov	ax, [bp+var_4B]
		mov	[bp+var_48], ax
		mov	dx, [bp+var_42]
		sub	dx, [bp+var_48]
		mov	[bp+var_4E], dx
		mov	ax, si
		add	ax, 8Fh
		mov	[bp+var_50], ax
		movsx	eax, [bp+var_4E]
		shl	eax, 8
		mov	bx, [bp+var_50]
		cmp	eax, [bx]
		jle	short loc_B1584
		mov	ax, 1
		jmp	short loc_B1586

loc_B1584:
		xor	ax, ax

loc_B1586:
		or	al, al
		jz	short loc_B1599
		or	dx, dx
		jle	short loc_B1594
		mov	byte ptr [si+52h], 4
		jmp	short loc_B1598

loc_B1594:
		mov	byte ptr [si+52h], 5

loc_B1598:
		inc	di

loc_B1599:
		push	word ptr [si+53h]
		push	ss
		lea	ax, word ptr [bp+var_B0]
		push	ax
		mov	bx, [si+53h]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_A8]
		push	large [bp+var_AC]
		push	large [bp+var_B0]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_58], eax
		mov	[bp+var_54], eax
		mov	bx, [si+57h]
		mov	eax, [bx+63h]
		mov	[bp+var_5C], eax
		shl	eax, 8
		cmp	eax, [bp+var_54]
		jge	short loc_B15EA
		mov	ax, 1
		jmp	short loc_B15EC

loc_B15EA:
		xor	ax, ax

loc_B15EC:
		or	al, al
		jz	short loc_B15F5
		mov	byte ptr [si+52h], 1

loc_B15F4:
		inc	di

loc_B15F5:
		cmp	di, 3
		jle	short loc_B164B
		mov	byte ptr [si+52h], 3
		push	large [bp+var_60]
		push	large [bp+var_64]
		push	large [bp+var_68]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		cmp	[bp+var_40], 1400h
		jge	short loc_B162D
		mov	ax, 1
		jmp	short loc_B162F

loc_B162D:
		xor	ax, ax

loc_B162F:
		or	al, al
		jz	short loc_B164B
		mov	byte ptr [si+59h], 0
		jmp	short loc_B164B

loc_B1639:
		push	0
		push	large [bp+var_8]
		les	bx, word ptr [bp+var_8]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_B164B:
		push	large [bp+var_60]
		push	large [bp+var_64]
		push	large [bp+var_68]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		sar	eax, 3
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		mov	ax, word ptr [bp+var_1A+1]
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+0Dh], ax
		mov	al, [si+52h]
		mov	ah, 0
		mov	[bp+var_1C], ax
		les	bx, es:[bx+9]
		mov	es:[bx+4], ax
		push	si
		call	StreamReader_DestructWrapper_3B3C6
		pop	cx

loc_B1698:
		pop	di
		pop	si
		leave
		retf
sub_B11C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B169C		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+55h]
		add	di, 12h
		mov	eax, [di]
		mov	[si+7Fh], eax
		mov	eax, [di+4]
		mov	[si+83h], eax
		mov	eax, [di+8]
		mov	[si+87h], eax
		mov	eax, dword_7CDEE
		sub	[si+7Fh], eax
		mov	eax, dword_7CDF2
		sub	[si+83h], eax
		mov	eax, dword_7CDF6
		sub	[si+87h], eax
		mov	di, [si+53h]
		add	di, 12h
		mov	eax, [di]
		mov	[si+73h], eax
		mov	eax, [di+4]
		mov	[si+77h], eax
		mov	eax, [di+8]
		mov	[si+7Bh], eax
		push	word ptr [si+53h]
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		mov	bx, [si+53h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		add	sp, 6
		mov	eax, [bp+var_C]
		mov	[si+67h], eax
		mov	eax, [bp+var_8]
		mov	[si+6Bh], eax
		mov	eax, [bp+var_4]
		mov	[si+6Fh], eax
		mov	ax, si
		add	ax, 97h
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	di, si
		add	di, 73h
		mov	eax, [di]
		mov	[si+5Bh], eax
		mov	eax, [di+4]
		mov	[si+5Fh], eax
		mov	eax, [di+8]
		mov	[si+63h], eax
		mov	di, si
		add	di, 7Fh
		mov	eax, [di]
		sub	[si+5Bh], eax
		mov	eax, [di+4]
		sub	[si+5Fh], eax
		mov	eax, [di+8]
		sub	[si+63h], eax
		mov	ax, si
		add	ax, 5Bh
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_B169C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B177C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_B177C		endp
ovr321		ends
