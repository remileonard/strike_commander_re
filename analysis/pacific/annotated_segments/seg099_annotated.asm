seg099		segment	para public 'CODE' use16
		assume cs:seg099
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E140		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+9], 0
		jz	short loc_3E199
		cmp	byte_7CB0B, 0
		jz	short loc_3E172
		mov	al, es:[bx+55h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3E172
		push	[bp+arg_2]
		push	bx
		call	sub_74566
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+55h], 1

loc_3E172:
		mov	al, byte_7CB0B
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3E199
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+55h], 0
		jz	short loc_3E199
		push	[bp+arg_2]
		push	bx
		call	sub_7456B
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+55h], 0

loc_3E199:
		pop	bp
		retf
sub_3E140		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E19B		proc far

var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		xor	cx, cx
		xor	dx, dx
		mov	[bp+var_4], 0
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_8], eax
		mov	[bp+var_9], 0

loc_3E1BD:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+0Eh]
		cmp	al, [bp+arg_4]
		jnz	short loc_3E1F2
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+30h]
		cmp	eax, [bp+var_8]
		jnz	short loc_3E1DD
		mov	[bp+var_9], 1
		jmp	short loc_3E1F2

loc_3E1DD:
		les	bx, word ptr [bp+var_8]
		cmp	es:[bx+13h], cx
		jle	short loc_3E1F2
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		mov	cx, es:[bx+13h]

loc_3E1F2:
		add	word ptr [bp+var_8], 27h
		inc	dx
		les	bx, [bp+arg_0]
		cmp	es:[bx+34h], dx
		jg	short loc_3E1BD
		cmp	[bp+var_4], 0
		jnz	short loc_3E216
		cmp	[bp+var_9], 0
		jz	short loc_3E216
		mov	eax, es:[bx+30h]
		mov	[bp+var_4], eax

loc_3E216:
		cmp	[bp+var_4], 0
		jz	short loc_3E22F
		les	bx, word ptr [bp+var_4]
		cmp	word ptr es:[bx+13h], 0
		jg	short loc_3E22F
		mov	[bp+var_4], 0

loc_3E22F:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_3E19B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E237		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+30h]
		mov	[bp+var_4], eax
		xor	cx, cx
		cmp	word ptr es:[bx+34h], 1
		jge	short loc_3E258
		jmp	loc_3E2E6

loc_3E258:
		test	dl, 1
		jz	short loc_3E2A4

loc_3E25D:
		add	word ptr [bp+var_4], 27h
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2Ch]
		mov	dx, es:[bx+34h]
		imul	dx, dx, 27h
		add	ax, dx
		cmp	ax, word ptr [bp+var_4]
		ja	short loc_3E27F
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_4], eax

loc_3E27F:
		les	bx, word ptr [bp+var_4]
		cmp	byte ptr es:[bx+0Eh], 40h
		jnz	short loc_3E299
		inc	cx
		test	byte ptr es:[bx+1], 1
		jz	short loc_3E299

loc_3E291:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3E2EA

loc_3E299:
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Eh], cx
		jge	short loc_3E25D
		jmp	short loc_3E2E6

loc_3E2A4:
		test	dl, 2
		jz	short loc_3E2E6

loc_3E2A9:
		add	word ptr [bp+var_4], 27h
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2Ch]
		mov	dx, es:[bx+34h]
		imul	dx, dx, 27h
		add	ax, dx
		cmp	ax, word ptr [bp+var_4]
		ja	short loc_3E2CB
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_4], eax

loc_3E2CB:
		les	bx, word ptr [bp+var_4]
		cmp	byte ptr es:[bx+0Eh], 40h
		jnz	short loc_3E2DD
		inc	cx
		test	byte ptr es:[bx+1], 2
		jnz	short loc_3E291

loc_3E2DD:
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Eh], cx
		jge	short loc_3E2A9

loc_3E2E6:
		xor	dx, dx
		xor	ax, ax

loc_3E2EA:
		leave
		retf
sub_3E237		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E2EC		proc far

var_40		= word ptr -40h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_16		= word ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 40h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		les	bx, word ptr [bp+arg_8]
		mov	eax, es:[bx+23h]
		sar	eax, 8
		cmp	eax, 0
		jle	short loc_3E316
		mov	al, 0
		jmp	loc_3E5B9

loc_3E316:
		cmp	word_7CADA, 0
		jz	short loc_3E370
		cmp	word_7CADA, si
		jnz	short loc_3E370
		push	word_7CADA
		mov	bx, word_7CADA
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_6]
		push	ax
		call	Matrix_RollAngle_59A30
		add	sp, 6
		mov	eax, [bp+var_6]
		or	eax, eax
		jge	short loc_3E34B
		neg	eax

loc_3E34B:
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 5A00h
		jle	short loc_3E366
		mov	ax, 1
		jmp	short loc_3E368

loc_3E366:
		xor	ax, ax

loc_3E368:
		or	al, al
		jz	short loc_3E370
		mov	[bp+var_2], 1

loc_3E370:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx], 0
		jnz	short loc_3E37D
		jmp	loc_3E5B6

loc_3E37D:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_12], ax
		push	ax
		lea	ax, [bp+var_40]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3E3B0
		push	large es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_3E3B2

loc_3E3B0:
		mov	al, 1Ch

loc_3E3B2:
		mov	ah, 0
		mov	[bp+var_10], ax
		mov	cx, 4
		mov	bx, offset word_3E5BD

loc_3E3BD:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_10]
		jz	short loc_3E3CD
		add	bx, 2
		loop	short loc_3E3BD
		jmp	loc_3E5B6

loc_3E3CD:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_3E3D1:
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_3E3DD
		jmp	loc_3E5B6

loc_3E3DD:
		call	DisplayCache_ComputeChecksum_65BFD
		mov	bx, 2EEh
		xor	dx, dx
		div	bx
		mov	dx, ax
		or	dx, dx
		jg	short loc_3E3F2
		mov	dx, 1

loc_3E3F2:
		cmp	word_7CADA, si
		jnz	short loc_3E3FE
		mov	bx, word_79793
		jmp	short loc_3E402

loc_3E3FE:
		mov	bx, word_79795

loc_3E402:
		cmp	bx, dx
		jle	short loc_3E409
		jmp	loc_3E5B6

loc_3E409:
		cmp	word_7CADA, si
		jnz	short loc_3E415
		inc	word_79793
		jmp	short loc_3E419

loc_3E415:
		inc	word_79795

loc_3E419:
		push	1
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	[bp+arg_6]
		push	si
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		nop
		push	cs
		call	near ptr sub_3F391
		add	sp, 16h

loc_3E438:
		les	bx, word ptr [bp+arg_C]
		mov	eax, [bp+arg_8]
		mov	es:[bx+30h], eax
		jmp	loc_3E5B6

loc_3E447:
		les	bx, word ptr [bp+arg_0]
		test	byte ptr es:[bx+12h], 1
		jnz	short loc_3E454
		jmp	loc_3E4E1

loc_3E454:
		xor	di, di
		jmp	short loc_3E4D2

loc_3E458:
		mov	[bp+var_1], 1
		push	1
		push	large [bp+arg_C]
		push	cs
		call	near ptr sub_3E237
		add	sp, 6
		mov	word ptr [bp+arg_8+2], dx
		mov	word ptr [bp+arg_8], ax
		cmp	[bp+arg_8], 0
		jnz	short loc_3E479
		jmp	loc_3E5B6

loc_3E479:
		les	bx, word ptr [bp+arg_8]
		cmp	dword ptr es:[bx+23h], 0
		jnz	short loc_3E4D1
		cmp	word ptr es:[bx+13h], 0
		jz	short loc_3E4D1
		mov	ax, word ptr [bp+arg_0]
		add	ax, 4
		push	word ptr [bp+arg_0+2]
		push	ax
		push	si
		push	word ptr [bp+arg_8+2]
		push	bx
		push	word_79799
		call	sub_4F6E6
		add	sp, 0Ch
		mov	al, byte_7CB0D
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3E4C5
		les	bx, word ptr [bp+arg_8]
		mov	ax, es:[bx+13h]
		dec	ax
		mov	[bp+var_1C], ax
		mov	es:[bx+13h], ax
		les	bx, word ptr [bp+arg_C]
		dec	word ptr es:[bx+3Ah]

loc_3E4C5:
		les	bx, word ptr [bp+arg_C]
		mov	eax, [bp+arg_8]
		mov	es:[bx+30h], eax

loc_3E4D1:
		inc	di

loc_3E4D2:
		les	bx, word ptr [bp+arg_C]
		cmp	es:[bx+1Ch], di
		jle	short loc_3E4DE
		jmp	loc_3E458

loc_3E4DE:
		jmp	loc_3E5B6

loc_3E4E1:
		les	bx, word ptr [bp+arg_0]
		test	byte ptr es:[bx+12h], 2
		jnz	short loc_3E4EE
		jmp	loc_3E5B6

loc_3E4EE:
		xor	di, di
		jmp	short loc_3E565

loc_3E4F2:
		mov	[bp+var_1], 1
		push	2
		push	large [bp+arg_C]
		push	cs
		call	near ptr sub_3E237
		add	sp, 6
		mov	word ptr [bp+arg_8+2], dx
		mov	word ptr [bp+arg_8], ax
		cmp	[bp+arg_8], 0
		jnz	short loc_3E513
		jmp	loc_3E5B6

loc_3E513:
		les	bx, word ptr [bp+arg_8]
		cmp	dword ptr es:[bx+23h], 0
		jnz	short loc_3E564
		cmp	word ptr es:[bx+13h], 0
		jz	short loc_3E564
		mov	ax, word ptr [bp+arg_0]
		add	ax, 4
		push	word ptr [bp+arg_0+2]
		push	ax
		push	si
		push	word ptr [bp+arg_8+2]
		push	bx
		push	word_79799
		call	sub_4F6E6
		add	sp, 0Ch
		mov	al, byte_7CB0D
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3E558
		les	bx, word ptr [bp+arg_8]
		mov	ax, es:[bx+13h]
		dec	ax
		mov	[bp+var_1C], ax
		mov	es:[bx+13h], ax

loc_3E558:
		les	bx, word ptr [bp+arg_C]
		mov	eax, [bp+arg_8]
		mov	es:[bx+30h], eax

loc_3E564:
		inc	di

loc_3E565:
		les	bx, word ptr [bp+arg_C]
		cmp	es:[bx+20h], di
		jg	short loc_3E4F2
		jmp	short loc_3E5B6

loc_3E570:
		call	DisplayCache_ComputeChecksum_65BFD
		mov	bx, 3E8h
		xor	dx, dx
		div	bx
		mov	dx, ax
		or	dx, dx
		jg	short loc_3E585
		mov	dx, 1

loc_3E585:
		cmp	word_7CADA, si
		jnz	short loc_3E591
		mov	bx, word_79791
		jmp	short loc_3E595

loc_3E591:
		mov	bx, word_7978D

loc_3E595:
		cmp	bx, dx
		jge	short loc_3E5B6
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	si
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_1A]
		push	ax
		nop
		push	cs
		call	near ptr sub_3F657
		add	sp, 12h
		jmp	loc_3E438

loc_3E5B6:
		mov	al, [bp+var_1]

loc_3E5B9:
		pop	di
		pop	si
		leave
		retf
sub_3E2EC		endp

; START OF FUNCTION CHUNK FOR sub_3E2EC
word_3E5BD	dw 8
		dw 9
		dw 0Dh
		dw 1Ah
off_3E5C5	dw offset loc_3E570
		dw offset loc_3E3D1
		dw offset loc_3E447
		dw offset loc_3E3D1
; END OF FUNCTION CHUNK FOR sub_3E2EC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E5CD		proc far
		push	bp
		mov	bp, sp
		xor	ax, ax
		pop	bp
		retf
sub_3E5CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E5D4		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3E5F6
		push	word ptr es:[bx+0Dh]
		push	[bp+arg_4]
		push	large es:[bx]
		call	sub_400C2
		add	sp, 8
		jmp	short loc_3E5F8

loc_3E5F6:
		mov	al, 0

loc_3E5F8:
		pop	bp
		retf
sub_3E5D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E5FA		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		les	bx, [bp+arg_4]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_3E63D
		les	bx, word ptr [bp+var_4]
		mov	si, es:[bx+49h]
		or	si, si
		jz	short loc_3E63D
		push	si
		mov	bx, [si]
		call	dword ptr [bx+10h]
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		shl	eax, 8
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		sub	es:[bx+28h], eax

loc_3E63D:
		pop	si
		leave
		retf
sub_3E5FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E640		proc far

var_6C		= dword ptr -6Ch
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= word ptr -4Ch
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 64h
		push	si
		push	di
		cmp	word_7CADA, 0
		jz	short loc_3E698
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+9]
		cmp	ax, word_7CADA
		jnz	short loc_3E698
		push	word_7CADA
		mov	bx, word_7CADA
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		call	Matrix_RollAngle_59A30
		add	sp, 6
		mov	eax, [bp+var_4]
		or	eax, eax
		jge	short loc_3E684
		neg	eax

loc_3E684:
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 5A00h

loc_3E698:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+2Ch], 0
		jnz	short loc_3E6A6
		jmp	loc_3EDF4

loc_3E6A6:
		cmp	dword ptr es:[bx+14h], 0
		jnz	short loc_3E6B1
		jmp	loc_3EDF4

loc_3E6B1:
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, bx, 13h
		add	dx, bx
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		mov	es:[bx+18h], dx
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_10], eax
		xor	dx, dx
		jmp	short loc_3E703

loc_3E6D9:
		les	bx, word ptr [bp+var_10]
		cmp	dword ptr es:[bx+23h], 0
		jz	short loc_3E6FE
		mov	eax, dword_7976E
		sub	es:[bx+23h], eax
		cmp	dword ptr es:[bx+23h], 0
		jge	short loc_3E6FE
		mov	dword ptr es:[bx+23h], 0

loc_3E6FE:
		inc	dx
		add	word ptr [bp+var_10], 27h

loc_3E703:
		les	bx, word ptr [bp+arg_0]
		cmp	es:[bx+34h], dx
		jg	short loc_3E6D9
		mov	eax, [bp+arg_4]
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 0
		jnz	short loc_3E71E
		jmp	loc_3EDF4

loc_3E71E:
		les	bx, word ptr [bp+var_14]
		mov	al, es:[bx+1Ch]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_3E73E
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_3F15E
		add	sp, 4
		jmp	loc_3E80A

loc_3E73E:
		les	bx, word ptr [bp+var_14]
		mov	al, es:[bx+1Bh]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jnz	short loc_3E752
		jmp	loc_3E80A

loc_3E752:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_3EF67
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+9]
		cmp	ax, word_7CADA
		jz	short loc_3E76E
		jmp	loc_3E80A

loc_3E76E:
		cmp	dword ptr es:[bx+18h], 0
		jz	short loc_3E7DF
		les	bx, es:[bx+18h]
		cmp	byte ptr es:[bx+12h], 1
		jnz	short loc_3E7A9
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+18h]
		add	ax, 4
		push	word ptr es:[bx+1Ah]
		push	ax
		push	word ptr es:[bx+1Eh]
		push	word ptr es:[bx+1Ch]
		push	2336h
		lea	ax, [bp+var_4C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		jmp	short loc_3E7EE

loc_3E7A9:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	byte ptr es:[bx+12h], 2
		jnz	short loc_3E7EE
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+18h]
		add	ax, 4
		push	word ptr es:[bx+1Ah]
		push	ax
		push	word ptr es:[bx+22h]
		push	word ptr es:[bx+20h]
		push	2343h
		lea	ax, [bp+var_4C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		jmp	short loc_3E7EE

loc_3E7DF:
		push	2350h
		lea	ax, [bp+var_4C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4

loc_3E7EE:
		sub	sp, 4
		mov	[bp+var_6C], 200h
		push	ss
		lea	ax, [bp+var_4C]
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch

loc_3E80A:
		les	bx, word ptr [bp+var_14]
		mov	al, es:[bx+1Bh]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jnz	short loc_3E81E
		jmp	loc_3E8FE

loc_3E81E:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_3EE7E
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+9]
		cmp	ax, word_7CADA
		jnz	short loc_3E891
		push	large es:[bx+18h]
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr sub_3F17A
		add	sp, 8
		or	ax, ax
		jz	short loc_3E874
		sub	sp, 4
		mov	[bp+var_6C], 200h
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+18h]
		add	ax, 4
		push	word ptr es:[bx+1Ah]
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		jmp	short loc_3E891

loc_3E874:
		sub	sp, 4
		mov	[bp+var_6C], 20000h
		push	seg seg008
		push	offset loc_5648
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch

loc_3E891:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+0Eh], 0
		jz	short loc_3E8FE
		push	word ptr es:[bx+0Eh]
		mov	bx, es:[bx+0Eh]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_18+2], dx
		mov	word ptr [bp+var_18], ax
		cmp	[bp+var_18], 0
		jz	short loc_3E8FE
		les	bx, word ptr [bp+var_18]
		mov	al, es:[bx+17h]
		mov	byte ptr [bp+var_1A], al
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+18h], 0
		jz	short loc_3E8FE
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3E8DE
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_3E8E0

loc_3E8DE:
		mov	al, 0

loc_3E8E0:
		cmp	al, 40h
		jnz	short loc_3E8FE
		cmp	byte ptr [bp+var_1A], 2
		jnz	short loc_3E8FE
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Eh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6

loc_3E8FE:
		les	bx, word ptr [bp+var_14]
		mov	al, es:[bx+1Ch]
		shr	ax, 4
		and	ax, 1
		or	al, al
		jnz	short loc_3E912
		jmp	loc_3E9C3

loc_3E912:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+54h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	es:[bx+54h], al
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3E938
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_3E93A

loc_3E938:
		mov	al, 0

loc_3E93A:
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_3E19B
		add	sp, 6
		mov	word ptr [bp+var_18+2], dx
		mov	word ptr [bp+var_18], ax
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+54h], 0
		jz	short loc_3E9C3
		mov	ax, es:[bx+6]
		cmp	ax, es:[bx]
		jz	short loc_3E966
		cmp	[bp+var_18], 0
		jnz	short loc_3E9C3

loc_3E966:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+53h], 1
		push	40h
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr sub_3F219
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3E9C3
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+53h], 0
		push	40h
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr sub_3F219
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3E9C3
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+6]
		mov	es:[bx], ax
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, bx, 13h
		add	dx, bx
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		mov	es:[bx+18h], dx

loc_3E9C3:
		les	bx, word ptr [bp+var_14]
		mov	al, es:[bx+1Bh]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jnz	short loc_3E9D6
		jmp	loc_3EC75

loc_3E9D6:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+0Ch], 0
		jnz	short loc_3E9E3
		jmp	loc_3EB5A

loc_3E9E3:
		mov	eax, es:[bx+18h]
		mov	[bp+var_18], eax
		mov	ax, es:[bx]
		mov	word ptr [bp+var_1A], ax
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_1E], eax
		mov	word ptr es:[bx], 0
		mov	eax, es:[bx+14h]
		mov	es:[bx+18h], eax
		jmp	loc_3EB39

loc_3EA0D:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3EA24
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_3EA26

loc_3EA24:
		mov	al, 0

loc_3EA26:
		cmp	al, 40h
		jz	short loc_3EA2D
		jmp	loc_3EB2E

loc_3EA2D:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	byte ptr es:[bx+12h], 1
		jnz	short loc_3EA47
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+1Eh]
		mov	word ptr [bp+var_22+2], ax
		jmp	short loc_3EA51

loc_3EA47:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+22h]
		mov	word ptr [bp+var_22+2], ax

loc_3EA51:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_1E], eax
		cmp	[bp+var_1E], 0
		jnz	short loc_3EA67
		jmp	loc_3EB2E

loc_3EA67:
		mov	word ptr [bp+var_22], 0
		jmp	loc_3EB23

loc_3EA6F:
		push	large [bp+arg_0]
		push	large [bp+var_1E]
		push	0
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+9]
		push	large es:[bx+18h]
		push	cs
		call	near ptr sub_3E2EC
		add	sp, 10h
		or	al, al
		jnz	short loc_3EA93
		jmp	loc_3EB20

loc_3EA93:
		cmp	word ptr [bp+var_22], 0
		jz	short loc_3EA9C
		jmp	loc_3EB20

loc_3EA9C:
		les	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+9]
		add	si, 12h
		mov	di, word_7CEF9
		add	di, 14h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_64], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_60], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_50], eax
		push	eax
		push	large [bp+var_54]
		push	large [bp+var_58]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_2A], eax
		mov	[bp+var_2E], eax
		sar	eax, 8
		mov	[bp+var_26], eax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+9]
		push	eax
		push	1
		call	sub_5EBFB
		add	sp, 8

loc_3EB20:
		inc	word ptr [bp+var_22]

loc_3EB23:
		mov	ax, word ptr [bp+var_22]
		cmp	ax, word ptr [bp+var_22+2]
		jge	short loc_3EB2E
		jmp	loc_3EA6F

loc_3EB2E:
		les	bx, word ptr [bp+arg_0]
		inc	word ptr es:[bx]
		add	word ptr es:[bx+18h], 13h

loc_3EB39:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+24h]
		cmp	ax, es:[bx]
		jle	short loc_3EB48
		jmp	loc_3EA0D

loc_3EB48:
		mov	ax, word ptr [bp+var_1A]
		mov	es:[bx], ax
		mov	eax, [bp+var_18]
		mov	es:[bx+18h], eax
		jmp	loc_3EC86

loc_3EB5A:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3EB71
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_3EB73

loc_3EB71:
		mov	al, 0

loc_3EB73:
		mov	byte ptr [bp+var_18+2], al
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_3E19B
		add	sp, 6
		mov	word ptr [bp+var_18], dx
		mov	word ptr [bp+var_1A], ax
		cmp	[bp+var_1A], 0
		jnz	short loc_3EB92
		jmp	loc_3EC41

loc_3EB92:
		push	large [bp+arg_0]
		push	dx
		push	ax
		push	0
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+9]
		push	large es:[bx+18h]
		push	cs
		call	near ptr sub_3E2EC
		add	sp, 10h
		or	al, al
		jnz	short loc_3EBB4
		jmp	loc_3EC41

loc_3EBB4:
		test	byte ptr [bp+var_18+2], 40h
		jnz	short loc_3EBBD
		jmp	loc_3EC41

loc_3EBBD:
		les	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+9]
		add	si, 12h
		mov	di, word_7CEF9
		add	di, 14h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_64], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_60], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_50], eax
		push	eax
		push	large [bp+var_54]
		push	large [bp+var_58]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_22], eax
		mov	[bp+var_26], eax
		sar	eax, 8
		mov	[bp+var_1E], eax
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+9]
		push	eax
		push	1
		call	sub_5EBFB
		add	sp, 8

loc_3EC41:
		mov	al, byte ptr [bp+var_18+2]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_3E19B
		add	sp, 6
		or	ax, dx
		jnz	short loc_3EC86
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx+6]
		imul	bx, bx, 13h
		add	dx, bx
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		mov	es:[bx+18h], dx
		jmp	short loc_3EC86

loc_3EC75:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+9]
		push	1
		call	sub_5ECE8
		add	sp, 4

loc_3EC86:
		les	bx, word ptr [bp+var_14]
		mov	al, es:[bx+1Ch]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_3ECAA
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Eh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6

loc_3ECAA:
		les	bx, word ptr [bp+var_14]
		mov	al, es:[bx+1Bh]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jnz	short loc_3ECBE
		jmp	loc_3ED56

loc_3ECBE:
		xor	di, di
		les	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+0Eh]
		mov	byte ptr [bp+var_18], 1
		les	bx, word ptr [bp+var_14]
		mov	al, es:[bx+1Ch]
		and	ax, 1
		or	al, al
		jz	short loc_3ECDD
		mov	byte ptr [bp+var_18], 0FFh

loc_3ECDD:
		mov	ax, word_77509
		mov	word ptr [bp+var_18+2], ax

loc_3ECE3:
		push	1
		push	large 3A98h
		push	si
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+9]
		push	67ADh
		call	sub_1E90D
		add	sp, 0Ch
		mov	si, ax
		test	byte ptr [si+2], 10h
		jz	short loc_3ED32
		mov	al, [si+51h]
		cmp	al, byte ptr [bp+var_18]
		jz	short loc_3ED4D
		les	bx, word ptr [bp+arg_0]
		cmp	es:[bx+9], si
		jz	short loc_3ED4D
		mov	word ptr [bp+var_1A], si
		push	word ptr [bp+var_1A]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Eh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		jmp	loc_3EDF4

loc_3ED32:
		mov	word ptr [bp+var_1E+2], si
		push	word ptr [bp+var_1E+2]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Eh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		jmp	loc_3EDF4

loc_3ED4D:
		inc	di
		cmp	di, word ptr [bp+var_18+2]
		jl	short loc_3ECE3
		jmp	loc_3EDF4

loc_3ED56:
		les	bx, word ptr [bp+var_14]
		mov	al, es:[bx+1Bh]
		shr	ax, 7
		and	ax, 1
		or	al, al
		jnz	short loc_3ED6A
		jmp	loc_3EDF4

loc_3ED6A:
		xor	di, di
		les	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+0Eh]
		mov	byte ptr [bp+var_18], 0FFh
		les	bx, word ptr [bp+var_14]
		mov	al, es:[bx+1Ch]
		and	ax, 1
		or	al, al
		jz	short loc_3ED89
		mov	byte ptr [bp+var_18], 1

loc_3ED89:
		mov	ax, word_77509
		mov	word ptr [bp+var_18+2], ax

loc_3ED8F:
		push	2
		push	large 3A98h
		push	si
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+9]
		push	67ADh
		call	sub_1E90D
		add	sp, 0Ch
		mov	si, ax
		test	byte ptr [si+2], 10h
		jz	short loc_3EDD4
		mov	al, [si+51h]
		cmp	al, byte ptr [bp+var_18]
		jnz	short loc_3EDEE
		mov	word ptr [bp+var_1A], si
		push	word ptr [bp+var_1A]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Eh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		jmp	short loc_3EDF4

loc_3EDD4:
		mov	word ptr [bp+var_1E+2], si
		push	word ptr [bp+var_1E+2]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Eh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		jmp	short loc_3EDF4

loc_3EDEE:
		inc	di
		cmp	di, word ptr [bp+var_18+2]
		jl	short loc_3ED8F

loc_3EDF4:
		pop	di
		pop	si
		leave
		retf
sub_3E640		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3EDF8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 0
		xor	dx, dx
		cmp	dword ptr es:[bx+18h], 0
		jnz	short loc_3EE5E
		cmp	dword ptr es:[bx+14h], 0
		jz	short loc_3EE7B
		mov	eax, es:[bx+14h]
		mov	es:[bx+18h], eax
		jmp	short loc_3EE5E

loc_3EE22:
		les	bx, [bp+arg_0]
		push	es
		mov	si, [bp+arg_0]
		inc	word ptr es:[si]
		mov	ax, es:[si]
		pop	es
		cmp	es:[bx+24h], ax
		jg	short loc_3EE4A
		mov	es, [bp+arg_2]
		mov	word ptr es:[bx], 0
		mov	eax, es:[bx+14h]
		mov	es:[bx+18h], eax
		jmp	short loc_3EE52

loc_3EE4A:
		les	bx, [bp+arg_0]
		add	word ptr es:[bx+18h], 13h

loc_3EE52:
		les	bx, [bp+arg_0]
		mov	ax, dx
		inc	dx
		cmp	es:[bx+24h], ax
		jl	short loc_3EE7B

loc_3EE5E:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3EE75
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_3EE77

loc_3EE75:
		mov	al, 0

loc_3EE77:
		or	al, al
		jz	short loc_3EE22

loc_3EE7B:
		pop	si
		pop	bp
		retf
sub_3EDF8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3EE7E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 0
		xor	dx, dx
		cmp	dword ptr es:[bx+18h], 0
		jnz	short loc_3EEA9
		cmp	dword ptr es:[bx+14h], 0
		jnz	short loc_3EE9F
		jmp	loc_3EF1F

loc_3EE9F:
		mov	eax, es:[bx+14h]
		mov	es:[bx+18h], eax

loc_3EEA9:
		les	bx, [bp+arg_0]
		push	es
		mov	si, [bp+arg_0]
		inc	word ptr es:[si]
		mov	ax, es:[si]
		pop	es
		cmp	es:[bx+24h], ax
		jg	short loc_3EED1
		mov	es, [bp+arg_2]
		mov	word ptr es:[bx], 0
		mov	eax, es:[bx+14h]
		mov	es:[bx+18h], eax
		jmp	short loc_3EED9

loc_3EED1:
		les	bx, [bp+arg_0]
		add	word ptr es:[bx+18h], 13h

loc_3EED9:
		les	bx, [bp+arg_0]
		mov	ax, dx
		inc	dx
		cmp	es:[bx+24h], ax
		jl	short loc_3EF1F
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3EEFC
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_3EEFE

loc_3EEFC:
		mov	al, 0

loc_3EEFE:
		cmp	al, 40h
		jz	short loc_3EEA9
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3EF19
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_3EF1B

loc_3EF19:
		mov	al, 0

loc_3EF1B:
		or	al, al
		jz	short loc_3EEA9

loc_3EF1F:
		pop	si
		pop	bp
		retf
sub_3EE7E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3EF22		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 18h
		jz	short loc_3EF64
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_3EF5E
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_3EF67
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+18h], 0
		jz	short loc_3EF5A
		mov	al, 1
		jmp	short loc_3EF64

loc_3EF5A:
		mov	al, 0
		jmp	short loc_3EF64

loc_3EF5E:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx

loc_3EF64:
		pop	si
		pop	bp
		retf
sub_3EF22		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3EF67		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		xor	cx, cx
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 0
		cmp	word ptr es:[bx+1Eh], 0
		jnz	short loc_3EF90
		mov	dword ptr es:[bx+18h], 0
		mov	word ptr es:[bx], 0FFFFh
		jmp	loc_3F14F

loc_3EF90:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+18h], 0
		jnz	short loc_3EFEE
		cmp	dword ptr es:[bx+14h], 0
		jnz	short loc_3EFA6
		jmp	loc_3F14F

loc_3EFA6:
		mov	eax, es:[bx+14h]
		mov	es:[bx+18h], eax
		jmp	short loc_3EFEE

loc_3EFB2:
		les	bx, [bp+arg_0]
		push	es
		mov	si, [bp+arg_0]
		inc	word ptr es:[si]
		mov	ax, es:[si]
		pop	es
		cmp	es:[bx+24h], ax
		jg	short loc_3EFDA
		mov	es, [bp+arg_2]
		mov	word ptr es:[bx], 0
		mov	eax, es:[bx+14h]
		mov	es:[bx+18h], eax
		jmp	short loc_3EFE2

loc_3EFDA:
		les	bx, [bp+arg_0]
		add	word ptr es:[bx+18h], 13h

loc_3EFE2:
		les	bx, [bp+arg_0]
		mov	ax, cx
		inc	cx
		cmp	es:[bx+24h], ax
		jl	short loc_3F00B

loc_3EFEE:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3F005
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_3F007

loc_3F005:
		mov	al, 0

loc_3F007:
		cmp	al, 40h
		jnz	short loc_3EFB2

loc_3F00B:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		test	byte ptr es:[bx+12h], 1
		jz	short loc_3F031
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 1Ch
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+1Eh]
		jmp	short loc_3F058

loc_3F031:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		test	byte ptr es:[bx+12h], 2
		jnz	short loc_3F042
		jmp	loc_3F14F

loc_3F042:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 20h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+22h]

loc_3F058:
		les	bx, [bp+var_4]
		mov	bx, es:[bx]
		dec	bx
		cmp	bx, 5
		jbe	short loc_3F067
		jmp	loc_3F13C

loc_3F067:
		shl	bx, 1
		jmp	cs:off_3F152[bx]	; switch jump

loc_3F06E:
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 2
		jmp	loc_3F144

loc_3F079:
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 4
		jmp	loc_3F144

loc_3F084:
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 6
		jmp	loc_3F144

loc_3F08F:
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 1

loc_3F097:
		les	bx, [bp+arg_0]
		push	es
		mov	si, [bp+arg_0]
		inc	word ptr es:[si]
		mov	ax, es:[si]
		pop	es
		cmp	es:[bx+24h], ax
		jg	short loc_3F0BF
		mov	es, [bp+arg_2]
		mov	word ptr es:[bx], 0
		mov	eax, es:[bx+14h]
		mov	es:[bx+18h], eax
		jmp	short loc_3F0C7

loc_3F0BF:
		les	bx, [bp+arg_0]
		add	word ptr es:[bx+18h], 13h

loc_3F0C7:
		les	bx, [bp+arg_0]
		mov	ax, cx
		inc	cx
		cmp	es:[bx+24h], ax
		jl	short loc_3F0F0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3F0EA
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_3F0EC

loc_3F0EA:
		mov	al, 0

loc_3F0EC:
		cmp	al, 40h
		jnz	short loc_3F097

loc_3F0F0:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		test	byte ptr es:[bx+12h], 1
		jz	short loc_3F116
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 1Ch
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+1Eh]
		jmp	short loc_3F144

loc_3F116:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		test	byte ptr es:[bx+12h], 2
		jz	short loc_3F144
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 20h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+22h]
		jmp	short loc_3F144

loc_3F13C:
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 2

loc_3F144:
		les	bx, [bp+var_4]
		cmp	es:[bx], dx
		jle	short loc_3F14F
		jmp	loc_3F058

loc_3F14F:
		pop	si
		leave
		retf
sub_3EF67		endp

; START OF FUNCTION CHUNK FOR sub_3EF67
off_3F152	dw offset loc_3F06E
		dw offset loc_3F079
		dw offset loc_3F13C
		dw offset loc_3F084
		dw offset loc_3F13C
		dw offset loc_3F08F
; END OF FUNCTION CHUNK FOR sub_3EF67

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3F15E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 1
		mov	eax, es:[bx+14h]
		mov	es:[bx+18h], eax
		mov	word ptr es:[bx], 0
		pop	bp
		retf
sub_3F15E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3F17A		proc far

var_6		= byte ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		xor	dx, dx
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_3F1CF
		les	bx, [bp+arg_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3F1A8
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_3F1AA

loc_3F1A8:
		mov	al, 0

loc_3F1AA:
		mov	[bp+var_6], al
		xor	cx, cx
		jmp	short loc_3F1C6

loc_3F1B1:
		les	bx, word ptr [bp+var_4]
		mov	al, [bp+var_6]
		test	es:[bx+0Eh], al
		jz	short loc_3F1C1
		add	dx, es:[bx+13h]

loc_3F1C1:
		inc	cx
		add	word ptr [bp+var_4], 27h

loc_3F1C6:
		les	bx, [bp+arg_0]
		cmp	es:[bx+34h], cx
		jg	short loc_3F1B1

loc_3F1CF:
		mov	ax, dx
		leave
		retf
sub_3F17A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeaponStation_FindLoadedCompatible (sub_40F92 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,49L
; — parcourt les stations d'armement, teste le masque de type et la quantité restante (+0x13 >
; 0) : recherche d'une station d'armement chargée et compatible — appelée directement par
; Flight_PhysicsTick_JDYN (sub_3314).
; ==============================================================================================
WeaponStation_FindLoadedCompatible		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_3F215
		xor	dx, dx
		jmp	short loc_3F20C

loc_3F1F0:
		les	bx, word ptr [bp+var_4]
		mov	al, [bp+arg_4]
		test	es:[bx+0Eh], al
		jz	short loc_3F207
		cmp	word ptr es:[bx+13h], 0
		jle	short loc_3F207
		mov	al, 1
		jmp	short loc_3F217

loc_3F207:
		inc	dx
		add	word ptr [bp+var_4], 27h

loc_3F20C:
		les	bx, [bp+arg_0]
		cmp	es:[bx+34h], dx
		jg	short loc_3F1F0

loc_3F215:
		mov	al, 0

loc_3F217:
		leave
		retf
WeaponStation_FindLoadedCompatible		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3F219		proc far

var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= dword ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	dl, 0
		cmp	[bp+arg_4], 0
		jnz	short loc_3F22B
		jmp	loc_3F2AF

loc_3F22B:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+2Ch], 0
		jz	short loc_3F2AF
		cmp	dword ptr es:[bx+14h], 0
		jz	short loc_3F2AF
		xor	si, si
		jmp	short loc_3F2A6

loc_3F242:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx], si
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, bx, 13h
		add	dx, bx
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ah], ax
		mov	es:[bx+18h], dx
		les	bx, es:[bx+18h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3F277
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_3F279

loc_3F277:
		mov	al, 0

loc_3F279:
		mov	[bp+var_2], al
		mov	dl, [bp+var_2]
		and	dl, [bp+arg_4]
		or	dl, dl
		jz	short loc_3F2A5
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_3E19B
		add	sp, 6
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_3F2A3
		mov	al, 1
		jmp	short loc_3F2B1

loc_3F2A3:
		mov	dl, 0

loc_3F2A5:
		inc	si

loc_3F2A6:
		les	bx, word ptr [bp+arg_0]
		cmp	es:[bx+24h], si
		jg	short loc_3F242

loc_3F2AF:
		mov	al, dl

loc_3F2B1:
		pop	si
		leave
		retf
sub_3F219		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3F2B4		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_4]
		les	bx, [bp+arg_0]
		cmp	es:[bx+24h], dx
		jnb	short loc_3F2C7
		mov	al, 0
		jmp	short loc_3F2EA

loc_3F2C7:
		les	bx, [bp+arg_0]
		mov	es:[bx], dx
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, bx, 13h
		add	dx, bx
		mov	bx, [bp+arg_0]
		mov	es:[bx+1Ah], ax
		mov	es:[bx+18h], dx
		mov	al, 1

loc_3F2EA:
		pop	bp
		retf
sub_3F2B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3F2EC		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	[bp+var_4], 0
		cmp	[bp+arg_4], 0
		jnz	short loc_3F304
		jmp	loc_3F389

loc_3F304:
		les	bx, word ptr [bp+arg_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3F317
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_3F319

loc_3F317:
		mov	al, 0

loc_3F319:
		mov	cl, al
		or	cl, cl
		jz	short loc_3F389
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_8], eax
		mov	ax, es:[bx+2Eh]
		mov	dx, es:[bx+2Ch]
		mov	bx, es:[bx+34h]
		dec	bx
		imul	bx, bx, 27h
		add	dx, bx
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		jmp	short loc_3F381

loc_3F345:
		les	bx, word ptr [bp+var_8]
		cmp	word ptr es:[bx+13h], 0
		jle	short loc_3F35F
		cmp	es:[bx+0Eh], cl
		jnz	short loc_3F35F
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		jmp	short loc_3F389

loc_3F35F:
		add	word ptr [bp+var_8], 27h
		les	bx, word ptr [bp+var_C]
		cmp	word ptr es:[bx+13h], 0
		jle	short loc_3F37D
		cmp	es:[bx+0Eh], cl
		jnz	short loc_3F37D
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		jmp	short loc_3F389

loc_3F37D:
		sub	word ptr [bp+var_C], 27h

loc_3F381:
		mov	ax, word ptr [bp+var_8]
		cmp	ax, word ptr [bp+var_C]
		jbe	short loc_3F345

loc_3F389:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_3F2EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3F391		proc far

var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= word ptr -52h
var_46		= word ptr -46h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h
arg_14		= byte ptr  1Ah

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	si
		push	di
		mov	di, [bp+arg_8]
		les	bx, [bp+arg_10]
		mov	byte ptr es:[bx+42h], 0
		les	bx, [bp+arg_4]
		cmp	dword ptr es:[bx], 0
		jnz	short loc_3F3B1
		jmp	loc_3F627

loc_3F3B1:
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_2], ax
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		les	bx, [bp+arg_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3F3E4
		push	large es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_3F3E6

loc_3F3E4:
		mov	al, 1Ch

loc_3F3E6:
		mov	ah, 0
		cmp	ax, 9
		jz	short loc_3F3F5
		cmp	ax, 1Ah
		jz	short loc_3F3F5
		jmp	loc_3F627

loc_3F3F5:
		cmp	[bp+arg_14], 0
		jnz	short loc_3F3FE
		jmp	loc_3F627

loc_3F3FE:
		les	bx, [bp+arg_C]
		mov	ax, es:[bx+13h]
		dec	ax
		mov	[bp+var_4], ax
		les	bx, es:[bx+16h]
		shl	ax, 1
		add	bx, ax
		mov	dx, es:[bx]
		or	dx, dx
		jz	short loc_3F43A
		cmp	byte_7CB0D, 0
		jz	short loc_3F425
		cmp	di, word_7CADA
		jz	short loc_3F43A

loc_3F425:
		push	1
		push	1
		push	dx
		push	65D0h
		call	sub_37CD0
		add	sp, 8
		mov	si, ax
		jmp	loc_3F4F8

loc_3F43A:
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 4
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		push	1
		push	1
		push	ax
		push	dx
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	si, ax
		or	si, si
		jnz	short loc_3F463
		jmp	loc_3F4F8

loc_3F463:
		lea	ax, [bp+var_46]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	ax, [bp+arg_E]
		mov	dx, [bp+arg_C]
		add	dx, 2
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	dx, [bp+var_C]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[si+12h], eax
		mov	eax, es:[bx+4]
		mov	[si+16h], eax
		mov	eax, es:[bx+8]
		mov	[si+1Ah], eax
		lea	ax, [bp+var_46]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	dx, si
		add	dx, 12h
		mov	cx, si
		add	cx, 12h
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_E], ax
		mov	bx, cx
		mov	eax, [bx]
		mov	bx, [bp+var_E]
		add	eax, [bx]
		mov	bx, dx
		mov	[bx], eax
		mov	bx, cx
		mov	eax, [bx+4]
		mov	bx, [bp+var_E]
		add	eax, [bx+4]
		mov	bx, dx
		mov	[bx+4], eax
		mov	bx, cx
		mov	eax, [bx+8]
		mov	bx, [bp+var_E]
		add	eax, [bx+8]
		mov	bx, dx
		mov	[bx+8], eax

loc_3F4F8:
		or	si, si
		jnz	short loc_3F4FF
		jmp	loc_3F627

loc_3F4FF:
		push	si
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		mov	[bp+var_10], si
		push	[bp+var_10]
		mov	ax, [bp+arg_10]
		add	ax, 12h
		push	[bp+arg_12]
		push	ax
		call	sub_39519
		add	sp, 6
		push	di
		push	ss
		lea	ax, [bp+var_52]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		lea	ax, [bp+var_52]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+54h]
		add	sp, 4
		mov	ax, [bp+arg_A]
		mov	[bp+var_12], ax
		push	ax
		mov	ax, si
		add	ax, 5Ah
		push	ax
		call	SetReference16
		add	sp, 4
		mov	[bp+var_14], di
		push	[bp+var_14]
		mov	ax, si
		add	ax, 5Ch
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	byte_7CB0D, 0
		jz	short loc_3F574
		cmp	di, word_7CADA
		jz	short loc_3F583

loc_3F574:
		les	bx, [bp+arg_C]
		mov	ax, es:[bx+13h]
		dec	ax
		mov	[bp+var_16], ax
		mov	es:[bx+13h], ax

loc_3F583:
		push	0
		push	si
		push	di
		push	67B7h
		call	sub_1F86D
		add	sp, 8
		mov	dx, si
		add	dx, 12h
		mov	cx, word_7CEF9
		add	cx, 14h
		mov	bx, dx
		mov	eax, [bx]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp+var_6A], eax
		mov	bx, dx
		mov	eax, [bx+4]
		mov	bx, cx
		sub	eax, [bx+4]
		mov	[bp+var_66], eax
		mov	bx, dx
		mov	eax, [bx+8]
		mov	bx, cx
		sub	eax, [bx+8]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_56], eax
		push	eax
		push	large [bp+var_5A]
		push	large [bp+var_5E]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		sar	eax, 8
		mov	[bp+var_1A], eax
		push	si
		push	eax
		push	7
		call	sub_5EB62
		add	sp, 8
		cmp	word_7CADA, di
		jnz	short loc_3F623
		inc	word_79791
		jmp	short loc_3F627

loc_3F623:
		inc	word_7978D

loc_3F627:
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_3F632
		mov	ax, si
		jmp	short loc_3F63C

loc_3F632:
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_3F63C:
		or	ax, ax
		jz	short loc_3F64B
		mov	dword ptr [si], 0
		mov	ax, si
		jmp	short loc_3F64D

loc_3F64B:
		mov	ax, si

loc_3F64D:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_3F391		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3F657		proc far

var_42		= word ptr -42h
var_36		= word ptr -36h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 42h
		push	si
		push	di
		mov	di, [bp+arg_8]
		les	bx, [bp+arg_E]
		mov	byte ptr es:[bx+42h], 0
		les	bx, [bp+arg_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_3F686
		push	large es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_3F688

loc_3F686:
		mov	al, 1Ch

loc_3F688:
		cmp	al, 8
		jz	short loc_3F6BB
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_3F697
		mov	ax, si
		jmp	short loc_3F6A1

loc_3F697:
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_3F6A1:
		or	ax, ax
		jz	short loc_3F6B0
		mov	dword ptr [si], 0
		mov	ax, si
		jmp	short loc_3F6B2

loc_3F6B0:
		mov	ax, si

loc_3F6B2:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		jmp	loc_3F8A9

loc_3F6BB:
		les	bx, [bp+arg_4]
		cmp	dword ptr es:[bx], 0
		jnz	short loc_3F6C8
		jmp	loc_3F87D

loc_3F6C8:
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_2], ax
		push	ax
		lea	ax, [bp+var_36]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		les	bx, [bp+arg_A]
		les	bx, es:[bx+16h]
		mov	dx, es:[bx]
		or	dx, dx
		jz	short loc_3F70E
		cmp	byte_7CB0D, 0
		jz	short loc_3F6FA
		cmp	di, word_7CADA
		jz	short loc_3F70E

loc_3F6FA:
		push	1
		push	1
		push	dx
		push	65D0h
		call	sub_37CD0
		add	sp, 8
		mov	si, ax
		jmp	short loc_3F730

loc_3F70E:
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 4
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		push	1
		push	1
		push	ax
		push	dx
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	si, ax

loc_3F730:
		or	si, si
		jnz	short loc_3F737
		jmp	loc_3F87D

loc_3F737:
		lea	ax, [bp+var_36]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	ax, [bp+arg_C]
		mov	dx, [bp+arg_A]
		add	dx, 2
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		les	dx, [bp+var_A]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[si+12h], eax
		mov	eax, es:[bx+4]
		mov	[si+16h], eax
		mov	eax, es:[bx+8]
		mov	[si+1Ah], eax
		lea	ax, [bp+var_36]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	dx, si
		add	dx, 12h
		mov	cx, si
		add	cx, 12h
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_C], ax
		mov	bx, cx
		mov	eax, [bx]
		mov	bx, [bp+var_C]
		add	eax, [bx]
		mov	bx, dx
		mov	[bx], eax
		mov	bx, cx
		mov	eax, [bx+4]
		mov	bx, [bp+var_C]
		add	eax, [bx+4]
		mov	bx, dx
		mov	[bx+4], eax
		mov	bx, cx
		mov	eax, [bx+8]
		mov	bx, [bp+var_C]
		add	eax, [bx+8]
		mov	bx, dx
		mov	[bx+8], eax
		push	si
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		mov	[bp+var_E], si
		push	[bp+var_E]
		mov	ax, [bp+arg_E]
		add	ax, 12h
		push	[bp+arg_10]
		push	ax
		call	sub_39519
		add	sp, 6
		push	di
		push	ss
		lea	ax, [bp+var_42]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		lea	ax, [bp+var_42]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+54h]
		add	sp, 4
		mov	[bp+var_10], di
		push	[bp+var_10]
		mov	ax, si
		add	ax, 5Ch
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	byte_7CB0D, 0
		jz	short loc_3F82C
		cmp	di, word_7CADA
		jz	short loc_3F83B

loc_3F82C:
		les	bx, [bp+arg_A]
		mov	ax, es:[bx+13h]
		dec	ax
		mov	[bp+var_12], ax
		mov	es:[bx+13h], ax

loc_3F83B:
		push	0
		push	si
		push	di
		push	67B7h
		call	sub_1F86D
		add	sp, 8
		cmp	word_7CADA, di
		jnz	short loc_3F856
		inc	word_79791
		jmp	short loc_3F85A

loc_3F856:
		inc	word_7978D

loc_3F85A:
		cmp	byte_7CEF8, 4
		jz	short loc_3F868
		cmp	byte_7CEF8, 0Ch
		jnz	short loc_3F87D

loc_3F868:
		cmp	di, word_7CADA
		jnz	short loc_3F87D
		push	0
		push	large 0
		push	1Ah
		call	sub_5EB62
		add	sp, 8

loc_3F87D:
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_3F888
		mov	ax, si
		jmp	short loc_3F892

loc_3F888:
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_3F892:
		or	ax, ax
		jz	short loc_3F8A1
		mov	dword ptr [si], 0
		mov	ax, si
		jmp	short loc_3F8A3

loc_3F8A1:
		mov	ax, si

loc_3F8A3:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]

loc_3F8A9:
		pop	di
		pop	si
		leave
		retf
sub_3F657		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3F8AD		proc far

var_A		= byte ptr -0Ah
var_8		= byte ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+2Ch], 0
		jnz	short loc_3F8C2
		jmp	loc_3F963

loc_3F8C2:
		mov	si, es:[bx+9]
		mov	eax, [si+63h]
		mov	[bp+var_4], eax
		mov	[bp+var_6], 1
		jmp	short loc_3F90B

loc_3F8D5:
		mov	al, byte ptr [bp+var_6]
		add	al, 0Eh
		mov	[bp+var_8], al
		mov	[bp+var_A], al
		mov	ah, 0
		les	bx, word ptr [bp+var_4]
		add	bx, ax
		cmp	byte ptr es:[bx+3Bh], 0
		jz	short loc_3F8F3
		mov	ax, 1
		jmp	short loc_3F8F5

loc_3F8F3:
		xor	ax, ax

loc_3F8F5:
		or	al, al
		jz	short loc_3F908
		push	[bp+var_6]
		push	large [bp+arg_0]
		call	sub_74561
		add	sp, 6

loc_3F908:
		inc	[bp+var_6]

loc_3F90B:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+34h]
		cmp	ax, [bp+var_6]
		jg	short loc_3F8D5
		les	bx, word ptr [bp+var_4]
		cmp	byte ptr es:[bx+46h], 0
		jz	short loc_3F926
		mov	ax, 1
		jmp	short loc_3F928

loc_3F926:
		xor	ax, ax

loc_3F928:
		or	al, al
		jz	short loc_3F93E
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+46h]
		cmp	al, es:[bx+0Bh]
		jb	short loc_3F93E
		mov	ax, 1
		jmp	short loc_3F940

loc_3F93E:
		xor	ax, ax

loc_3F940:
		or	al, al
		jz	short loc_3F963
		push	0
		push	large [bp+arg_0]
		call	sub_74561
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+9]
		push	14h
		call	sub_5ECE8
sub_3F8AD		endp
seg099		ends
