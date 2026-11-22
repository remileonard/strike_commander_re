seg092		segment	para public 'CODE' use16
		assume cs:seg092
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E2h, 0EAh, 43h, 0, 0F8h, 74h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3A6E6		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0ECh]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+88h]
		add	sp, 4
		mov	dx, ax
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		cmp	byte ptr [bx+51h], 1
		jnz	short loc_3A72C
		mov	ax, word_7CB07
		cmp	ax, 1
		jz	short loc_3A71E
		cmp	ax, 2
		jz	short loc_3A722
		jmp	short loc_3A725

loc_3A71E:
		sar	dx, 1
		jmp	short loc_3A725

loc_3A722:
		sar	dx, 2

loc_3A725:
		or	dx, dx
		jnz	short loc_3A72C
		mov	dx, 1

loc_3A72C:
		mov	al, [bp+arg_6]
		push	ax
		push	dx
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_3A740
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_3A6E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3A740		proc far

var_42		= word ptr -42h
var_19		= byte ptr -19h
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= byte ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 42h
		push	si
		push	di
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+0ECh]
		mov	bx, es:[bx+0ECh]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		mov	al, [bp+arg_6]
		mov	ah, 0
		mov	[bp+var_8], ax
		xor	di, di
		mov	[bp+var_C], 0
		jmp	short loc_3A789

loc_3A77A:
		les	bx, word ptr [bp+var_C]
		mov	al, es:[bx+6]
		cmp	al, [bp+arg_6]
		jnz	short loc_3A789
		jmp	loc_3ADD4

loc_3A789:
		cmp	[bp+var_C], 0
		jnz	short loc_3A7C4
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		xor	ax, ax
		xor	dx, dx
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], dx
		jmp	short loc_3A7C4

loc_3A7C4:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Ch]
		or	ax, es:[bx+0Eh]
		jnz	short loc_3A7F5
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		jmp	short loc_3A83E

loc_3A7F5:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Eh]
		mov	dx, es:[bx+0Ch]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], dx
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]

loc_3A83E:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Ch]
		or	ax, es:[bx+0Eh]
		jz	short loc_3A88F
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Eh]
		mov	dx, es:[bx+0Ch]
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		mov	al, 1
		jmp	short loc_3A899

loc_3A88F:
		mov	[bp+var_C], 0
		mov	al, 0

loc_3A899:
		or	al, al
		jz	short loc_3A8A0
		jmp	loc_3A77A

loc_3A8A0:
		jmp	loc_3ADD4

loc_3A8A3:
		or	di, di
		jnz	short loc_3A8AA
		jmp	loc_3AAE8

loc_3A8AA:
		cmp	[bp+var_C], 0
		jnz	short loc_3A8E5
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		xor	ax, ax
		xor	dx, dx
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], dx
		jmp	short loc_3A8E5

loc_3A8E5:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Ch]
		or	ax, es:[bx+0Eh]
		jnz	short loc_3A916
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		jmp	short loc_3A95F

loc_3A916:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Eh]
		mov	dx, es:[bx+0Ch]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], dx
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]

loc_3A95F:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Ch]
		or	ax, es:[bx+0Eh]
		jz	short loc_3A9B0
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Eh]
		mov	dx, es:[bx+0Ch]
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		mov	al, 1
		jmp	short loc_3A9BA

loc_3A9B0:
		mov	[bp+var_C], 0
		mov	al, 0

loc_3A9BA:
		cmp	[bp+var_C], 0
		jz	short loc_3A9C4
		jmp	loc_3AAD4

loc_3A9C4:
		cmp	[bp+var_C], 0
		jnz	short loc_3A9FF
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		xor	ax, ax
		xor	dx, dx
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], dx
		jmp	short loc_3A9FF

loc_3A9FF:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Ch]
		or	ax, es:[bx+0Eh]
		jnz	short loc_3AA30
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		jmp	short loc_3AA79

loc_3AA30:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Eh]
		mov	dx, es:[bx+0Ch]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], dx
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]

loc_3AA79:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Ch]
		or	ax, es:[bx+0Eh]
		jz	short loc_3AACA
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Eh]
		mov	dx, es:[bx+0Ch]
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		mov	al, 1
		jmp	short loc_3AAD4

loc_3AACA:
		mov	[bp+var_C], 0
		mov	al, 0

loc_3AAD4:
		les	bx, word ptr [bp+var_C]
		mov	al, es:[bx+6]
		mov	[bp+arg_6], al
		mov	ah, 0
		cmp	ax, [bp+var_8]
		jnz	short loc_3AAE8
		jmp	loc_3ADDD

loc_3AAE8:
		cmp	[bp+arg_6], 23h
		jnz	short loc_3AB26
		push	large [bp+var_4]
		les	bx, word ptr [bp+var_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 6
		jnz	short loc_3AB26
		mov	ax, 4
		call	Math_RandomScale_56C2F
		mov	dx, ax
		cmp	dx, 2
		jge	short loc_3AB17
		mov	[bp+arg_6], 0Bh
		jmp	short loc_3AB26

loc_3AB17:
		cmp	dx, 2
		jnz	short loc_3AB22
		mov	[bp+arg_6], 8
		jmp	short loc_3AB26

loc_3AB22:
		mov	[bp+arg_6], 9

loc_3AB26:
		xor	si, si
		mov	dx, 1
		mov	al, [bp+arg_6]
		mov	ah, 0
		sub	ax, 8
		mov	bx, ax
		cmp	bx, 19h
		ja	short loc_3ABA7
		shl	bx, 1
		jmp	cs:off_3ADE1[bx]	; switch jump

loc_3AB41:
		mov	[bp+var_E], 28h
		jmp	short loc_3ABA9

loc_3AB47:
		mov	[bp+var_E], 29h
		jmp	short loc_3ABA9

loc_3AB4D:
		mov	[bp+var_E], 2Ah
		jmp	short loc_3ABA9

loc_3AB53:
		mov	[bp+var_E], 2Bh
		jmp	short loc_3ABA9

loc_3AB59:
		mov	[bp+var_E], 2Dh
		jmp	short loc_3ABA9

loc_3AB5F:
		mov	[bp+var_E], 2Ch
		jmp	short loc_3ABA9

loc_3AB65:
		mov	[bp+var_E], 39h
		jmp	short loc_3ABA9

loc_3AB6B:
		mov	[bp+var_E], 38h
		jmp	short loc_3ABA9

loc_3AB71:
		mov	[bp+var_E], 2Fh
		jmp	short loc_3ABA9

loc_3AB77:
		mov	[bp+var_E], 30h
		jmp	short loc_3ABA9

loc_3AB7D:
		mov	[bp+var_E], 31h
		jmp	short loc_3ABA9

loc_3AB83:
		mov	[bp+var_E], 32h
		jmp	short loc_3ABA9

loc_3AB89:
		mov	[bp+var_E], 33h
		jmp	short loc_3ABA9

loc_3AB8F:
		mov	[bp+var_E], 34h
		jmp	short loc_3ABA9

loc_3AB95:
		mov	[bp+var_E], 2Eh
		jmp	short loc_3ABA9

loc_3AB9B:
		mov	[bp+var_E], 37h
		jmp	short loc_3ABA9

loc_3ABA1:
		mov	[bp+var_E], 3Ah
		jmp	short loc_3ABA9

loc_3ABA7:
		xor	dx, dx

loc_3ABA9:
		mov	[bp+var_10], 0FFFFh
		mov	[bp+var_12], 0
		jmp	short loc_3ABE7

loc_3ABB5:
		les	bx, word ptr [bp+arg_0]
		add	bx, [bp+var_12]
		mov	al, es:[bx+76h]
		cmp	al, [bp+arg_6]
		jnz	short loc_3ABE4
		or	dx, dx
		jz	short loc_3ABD8
		mov	al, [bp+var_E]
		mov	ah, 0
		cmp	ax, [bp+var_12]
		jnz	short loc_3ABD8
		mov	ax, [bp+var_12]
		mov	[bp+var_10], ax

loc_3ABD8:
		mov	al, byte ptr [bp+var_12]
		mov	byte ptr [bp+si+var_42], al
		inc	si
		cmp	si, 28h
		jge	short loc_3ABED

loc_3ABE4:
		inc	[bp+var_12]

loc_3ABE7:
		cmp	[bp+var_12], 3Bh
		jl	short loc_3ABB5

loc_3ABED:
		mov	[bp+var_14], si
		or	dx, dx
		jnz	short loc_3ABF7
		jmp	loc_3ACB5

loc_3ABF7:
		cmp	[bp+var_6], 0
		jnz	short loc_3AC00
		jmp	loc_3ACB5

loc_3AC00:
		mov	al, byte ptr [bp+var_10]
		push	ax
		push	large [bp+arg_0]
		call	sub_4156B
		add	sp, 6
		mov	ah, 0
		mov	dx, ax
		cmp	dx, 96h
		jl	short loc_3AC23
		cmp	[bp+var_6], 6
		jg	short loc_3AC23
		jmp	loc_3ADDD

loc_3AC23:
		cmp	dx, 64h
		jl	short loc_3AC34
		cmp	[bp+var_6], 6
		jg	short loc_3AC34
		sar	[bp+var_6], 2
		jmp	short loc_3AC42

loc_3AC34:
		cmp	dx, 32h
		jl	short loc_3AC42
		cmp	[bp+var_6], 6
		jg	short loc_3AC42
		sar	[bp+var_6], 1

loc_3AC42:
		or	dx, dx
		jz	short loc_3ACB5
		or	dx, dx
		jnz	short loc_3AC4D
		mov	dx, 1

loc_3AC4D:
		cmp	[bp+var_6], dx
		jle	short loc_3AC56
		mov	ax, dx
		jmp	short loc_3AC59

loc_3AC56:
		mov	ax, [bp+var_6]

loc_3AC59:
		mov	cx, ax
		mov	al, byte ptr [bp+var_10]
		mov	byte ptr [bp+var_16], al
		mov	[bp+var_17], cl
		cmp	byte ptr [bp+var_16], 3Bh
		jnb	short loc_3ACB2
		mov	ah, 0
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	al, [bp+var_17]
		add	es:[bx+3Bh], al
		mov	al, byte ptr [bp+var_16]
		mov	ah, 0
		mov	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	al, es:[bx+3Bh]
		mov	dl, byte ptr [bp+var_16]
		mov	dh, 0
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		cmp	al, es:[bx]
		jbe	short loc_3ACB2
		mov	al, byte ptr [bp+var_16]
		mov	ah, 0
		mov	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	al, es:[bx]
		mov	dl, byte ptr [bp+var_16]
		mov	dh, 0
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		mov	es:[bx+3Bh], al
		jmp	short loc_3ACB2

loc_3ACB2:
		sub	[bp+var_6], cx

loc_3ACB5:
		mov	ax, si
		call	Math_RandomScale_56C2F
		mov	[bp+var_12], ax
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0EEh]
		add	al, byte ptr [bp+var_6]
		mov	es:[bx+0EEh], al
		cmp	[bp+var_6], 0
		jnz	short loc_3ACD8
		jmp	loc_3ADC8

loc_3ACD8:
		jmp	loc_3ADB9

loc_3ACDB:
		lea	ax, [bp+var_42]
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	al, [bx]
		push	ax
		push	large [bp+arg_0]
		call	sub_4156B
		add	sp, 6
		mov	ah, 0
		mov	dx, ax
		mov	ax, [bp+var_6]
		mov	[bp+var_16], ax
		cmp	dx, [bp+var_16]
		jge	short loc_3AD04
		mov	[bp+var_16], dx

loc_3AD04:
		cmp	[bp+var_16], 0
		jz	short loc_3AD6E
		lea	ax, [bp+var_42]
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	al, [bx]
		mov	[bp+var_18], al
		mov	al, byte ptr [bp+var_16]
		mov	[bp+var_19], al
		cmp	[bp+var_18], 3Bh
		jnb	short loc_3AD6E
		mov	al, [bp+var_18]
		mov	ah, 0
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	al, [bp+var_19]
		add	es:[bx+3Bh], al
		mov	al, [bp+var_18]
		mov	ah, 0
		mov	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	al, es:[bx+3Bh]
		mov	dl, [bp+var_18]
		mov	dh, 0
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		cmp	al, es:[bx]
		jbe	short loc_3AD6E
		mov	al, [bp+var_18]
		mov	ah, 0
		mov	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	al, es:[bx]
		mov	dl, [bp+var_18]
		mov	dh, 0
		mov	bx, word ptr [bp+arg_0]
		add	bx, dx
		mov	es:[bx+3Bh], al
		jmp	short loc_3AD6E

loc_3AD6E:
		lea	ax, [bp+var_42]
		mov	bx, [bp+var_12]
		add	bx, ax
		cmp	byte ptr [bx], 0
		jnz	short loc_3AD9E
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		test	byte ptr [bx+2], 4
		jz	short loc_3AD9E
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		test	byte ptr [bx+2], 10h
		jz	short loc_3AD9E
		push	bx
		call	SmokeTrail_EnableIfModelHasSmok_3BD75
		pop	cx

loc_3AD9E:
		mov	ax, [bp+var_16]
		sub	[bp+var_6], ax
		dec	[bp+var_14]
		mov	ax, si
		dec	ax
		cmp	ax, [bp+var_12]
		jnz	short loc_3ADB6
		mov	[bp+var_12], 0
		jmp	short loc_3ADB9

loc_3ADB6:
		inc	[bp+var_12]

loc_3ADB9:
		cmp	[bp+var_6], 0
		jle	short loc_3ADC8
		cmp	[bp+var_14], 0
		jz	short loc_3ADC8
		jmp	loc_3ACDB

loc_3ADC8:
		inc	di
		cmp	[bp+var_6], 6
		jge	short loc_3ADD4
		mov	[bp+var_6], 0

loc_3ADD4:
		cmp	[bp+var_6], 0
		jle	short loc_3ADDD
		jmp	loc_3A8A3

loc_3ADDD:
		pop	di
		pop	si
		leave
		retf
sub_3A740		endp

; START OF FUNCTION CHUNK FOR sub_3A740
off_3ADE1	dw offset loc_3AB47
		dw offset loc_3AB4D
		dw offset loc_3AB5F
		dw offset loc_3AB41
		dw offset loc_3AB59
		dw offset loc_3AB53
		dw offset loc_3AB9B
		dw offset loc_3ABA7
		dw offset loc_3ABA7
		dw offset loc_3ABA7
		dw offset loc_3ABA7
		dw offset loc_3ABA7
		dw offset loc_3ABA7
		dw offset loc_3AB6B
		dw offset loc_3AB65
		dw offset loc_3ABA7
		dw offset loc_3AB71
		dw offset loc_3AB77
		dw offset loc_3AB7D
		dw offset loc_3AB83
		dw offset loc_3AB89
		dw offset loc_3AB8F
		dw offset loc_3AB95
		dw offset loc_3ABA7
		dw offset loc_3ABA7
		dw offset loc_3ABA1
; END OF FUNCTION CHUNK FOR sub_3A740

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3AE15		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		xor	cx, cx
		xor	si, si
		xor	dx, dx
		jmp	short loc_3AE59

loc_3AE25:
		mov	al, dl
		mov	ah, 0
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	di, ax
		mov	al, dl
		mov	ah, 0
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, es:[bx+3Bh]
		mov	ah, 0
		mov	bx, ax
		cmp	dx, 0Eh
		jnz	short loc_3AE54
		cmp	bx, di
		jb	short loc_3AE54
		mov	ax, 64h
		jmp	short loc_3AE6A

loc_3AE54:
		add	cx, di
		add	si, bx
		inc	dx

loc_3AE59:
		cmp	dx, 3Bh
		jl	short loc_3AE25
		mov	ax, si
		imul	ax, ax, 64h
		xor	dx, dx
		div	cx
		mov	[bp+var_2], ax

loc_3AE6A:
		pop	di
		pop	si
		leave
		retf
sub_3AE15		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3AE6E		proc far

var_3A		= dword ptr -3Ah
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		mov	[bp+var_4], 0
		jmp	short loc_3AEBA

loc_3AE7F:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+6]
		cmp	al, [bp+arg_4]
		jnz	short loc_3AEBA
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 0Bh
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	[bp+var_24], eax
		mov	eax, es:[si+4]
		mov	[bp+var_20], eax
		mov	eax, es:[si+8]
		mov	[bp+var_1C], eax
		jmp	loc_3AFE8

loc_3AEBA:
		cmp	[bp+var_4], 0
		jnz	short loc_3AEF5
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		xor	ax, ax
		xor	dx, dx
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], dx
		jmp	short loc_3AEF5

loc_3AEF5:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Ch]
		or	ax, es:[bx+0Eh]
		jnz	short loc_3AF3D
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		jmp	short loc_3AF9D

loc_3AF3D:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Eh]
		mov	dx, es:[bx+0Ch]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], dx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx

loc_3AF9D:
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Ch]
		or	ax, es:[bx+0Eh]
		jz	short loc_3AFD7
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+0Eh]
		mov	dx, es:[bx+0Ch]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	al, 1
		jmp	short loc_3AFE1

loc_3AFD7:
		mov	[bp+var_4], 0
		mov	al, 0

loc_3AFE1:
		or	al, al
		jz	short loc_3AFE8
		jmp	loc_3AE7F

loc_3AFE8:
		cmp	[bp+var_4], 0
		jnz	short loc_3AFF2
		jmp	loc_3B142

loc_3AFF2:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0ECh]
		mov	bx, es:[bx+0ECh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	sub_5A629
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0ECh]
		add	si, 12h
		mov	eax, [si]
		add	[bp+var_24], eax
		mov	eax, [si+4]
		add	[bp+var_20], eax
		mov	eax, [si+8]
		add	[bp+var_1C], eax
		push	1
		push	1
		push	ds
		push	offset aEXPLODE1
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	si, ax
		or	si, si
		jnz	short loc_3B050
		jmp	loc_3B142

loc_3B050:
		mov	eax, [bp+var_24]
		mov	[si+12h], eax
		mov	eax, [bp+var_20]
		mov	[si+16h], eax
		mov	eax, [bp+var_1C]
		mov	[si+1Ah], eax
		push	large 640000h
		sub	sp, 4
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ECh]
		les	bx, [bx+0Eh]
		les	bx, es:[bx+1Bh]
		mov	ax, es:[bx+8]
		sar	ax, 1
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_3A], eax
		push	si
		call	sub_4BD5F
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0ECh]
		mov	[bp+var_C], ax
		push	ax
		mov	ax, si
		add	ax, 5Bh
		push	ax
		call	SetReference16
		add	sp, 4
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0ECh]
		mov	bx, es:[bx+0ECh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	byte ptr [si+5Dh], 0
		mov	eax, [si+12h]
		mov	bx, word_7CEF9
		sub	eax, [bx+14h]
		mov	[bp+var_30], eax
		mov	eax, [si+16h]
		sub	eax, [bx+18h]
		mov	[bp+var_2C], eax
		mov	eax, [si+1Ah]
		sub	eax, [bx+1Ch]
		mov	[bp+var_28], eax
		push	eax
		push	large [bp+var_2C]
		push	large [bp+var_30]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		sar	eax, 8
		mov	[bp+var_10], eax
		push	0
		push	eax
		push	2
		call	sub_5EB62
		add	sp, 8
		push	si
		push	67ADh
		call	List_AppendIfNonNull_1E24C
sub_3AE6E		endp

; START OF FUNCTION CHUNK FOR sub_3AE6E
		db 83h
; END OF FUNCTION CHUNK FOR sub_3AE6E
seg092		ends
