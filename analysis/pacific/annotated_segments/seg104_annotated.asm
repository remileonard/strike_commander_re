seg104		segment	para public 'CODE' use16
		assume cs:seg104
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 6, 3Ch, 5Ah, 76h, 4

loc_41695:
		db 0C6h, 46h, 0FFh, 1, 8Ah, 46h, 0FFh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4169E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_416B6
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_416BB

loc_416B6:
		mov	ax, dx
		add	ax, 6

loc_416BB:
		mov	ax, dx
		pop	bp
		retf
sub_4169E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_416BF		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large [bp+arg_0]
		call	CRT_NormalizeSign32
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+arg_0], eax
		cmp	eax, [bp+arg_C]
		jle	short loc_416E5

loc_416DF:
		mov	ax, 1
		jmp	loc_4178B

loc_416E5:
		push	large [bp+arg_4]
		call	CRT_NormalizeSign32
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+arg_4], eax
		cmp	eax, [bp+arg_C]
		jg	short loc_416DF
		push	large [bp+arg_8]
		call	CRT_NormalizeSign32
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+arg_8], eax
		cmp	eax, [bp+arg_C]
		jg	short loc_416DF
		mov	eax, [bp+arg_8]
		cmp	eax, [bp+arg_4]
		jle	short loc_4172F
		mov	edx, [bp+arg_4]
		mov	[bp+arg_4], eax
		mov	[bp+arg_8], edx

loc_4172F:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+arg_0]
		jle	short loc_41745
		mov	edx, [bp+arg_0]
		mov	[bp+arg_0], eax
		mov	[bp+arg_4], edx

loc_41745:
		mov	eax, [bp+arg_8]
		cmp	eax, [bp+arg_4]
		jle	short loc_4175B
		mov	edx, [bp+arg_4]
		mov	[bp+arg_4], eax
		mov	[bp+arg_8], edx

loc_4175B:
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		mov	eax, [bp+arg_4]
		sar	eax, 1
		add	[bp+var_4], eax
		mov	eax, [bp+arg_8]
		sar	eax, 2
		add	[bp+var_4], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+arg_C]
		jle	short loc_41789
		mov	ax, 1
		jmp	short loc_4178B

loc_41789:
		xor	ax, ax

loc_4178B:
		leave
		retf
sub_416BF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4178D		proc far

var_6E		= word ptr -6Eh
var_6C		= dword ptr -6Ch
var_56		= word ptr -56h
var_54		= dword ptr -54h
var_3E		= word ptr -3Eh
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= byte ptr -34h
var_33		= byte ptr -33h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_56], 16D5h
		mov	[bp+var_54], 0
		mov	[bp+var_56], 16E9h
		mov	[bp+var_6E], 16D5h
		mov	[bp+var_6C], 0
		mov	[bp+var_6E], 16E9h
		mov	[bp+var_8], 0
		mov	[bp+var_C], 0
		push	word ptr [si]
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		les	bx, word ptr [bp+var_10]
		mov	eax, es:[bx+8]
		mov	[bp+var_8], eax
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_417F6
		xor	di, di
		mov	byte ptr [si+4], 0Bh
		jmp	short loc_417FD

loc_417F6:
		les	bx, word ptr [bp+var_8]
		mov	di, es:[bx+14h]

loc_417FD:
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		cmp	[bp+var_16], 0
		jz	short loc_4183F
		les	bx, word ptr [bp+var_16]
		mov	eax, es:[bx+8]
		mov	[bp+var_C], eax
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_41833
		mov	[bp+var_12], 0
		mov	byte ptr [si+5], 0Bh
		jmp	short loc_4184C

loc_41833:
		les	bx, word ptr [bp+var_C]
		mov	ax, es:[bx+14h]
		mov	[bp+var_12], ax
		jmp	short loc_4184C

loc_4183F:
		mov	[bp+var_C], 0
		mov	[bp+var_12], 0

loc_4184C:
		or	di, di
		jnz	short loc_4186B
		cmp	dword_78D7D, 0
		jle	short loc_4186B
		cmp	[bp+var_12], 0
		jnz	short loc_4186B
		cmp	dword_78D81, 0
		jle	short loc_4186B

loc_41866:
		mov	al, 1
		jmp	loc_41A60

loc_4186B:
		push	large [bp+var_10]
		les	bx, word ptr [bp+var_10]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 0Fh
		jnz	short loc_418BF
		mov	bx, [si]
		cmp	word ptr [bx+56h], 0
		jnz	short loc_4188A
		jmp	loc_41A5E

loc_4188A:
		push	large [bp+var_16]
		les	bx, word ptr [bp+var_16]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 0Fh
		jnz	short loc_418A1
		jmp	loc_41A5E

loc_418A1:
		xor	di, di
		mov	ax, [si]
		add	ax, 52h
		mov	[bp+var_18], ax
		mov	bx, [bp+var_18]
		mov	eax, [bx]
		mov	[bp+var_1C], eax
		sar	eax, 8
		mov	dword_78D7D, eax
		jmp	short loc_41915

loc_418BF:
		push	large [bp+var_16]
		les	bx, word ptr [bp+var_16]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 0Fh
		jnz	short loc_41915
		mov	bx, [si]
		cmp	word ptr [bx+56h], 0
		jnz	short loc_418DE
		jmp	loc_41A5E

loc_418DE:
		push	large [bp+var_10]
		les	bx, word ptr [bp+var_10]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 0Fh
		jnz	short loc_418F5
		jmp	loc_41A5E

loc_418F5:
		mov	[bp+var_12], 0
		mov	ax, [si+2]
		add	ax, 52h
		mov	[bp+var_1E], ax
		mov	bx, [bp+var_1E]
		mov	eax, [bx]
		mov	[bp+var_22], eax
		sar	eax, 8
		mov	dword_78D81, eax

loc_41915:
		or	di, di
		jnz	short loc_4197E
		push	0
		push	35BCh
		mov	eax, dword_78D7D
		mov	[bp+var_26], eax
		shl	eax, 8
		mov	[bp+var_2A], eax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	ss
		lea	ax, [bp+var_6E]
		push	ax
		call	sub_38570
		add	sp, 0Ah
		push	23h
		push	35BCh
		mov	eax, dword_78D7D
		mov	[bp+var_2E], eax
		shl	eax, 8
		mov	[bp+var_32], eax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	ss
		lea	ax, [bp+var_56]
		push	ax
		call	sub_38570
		add	sp, 0Ah
		lea	ax, [bp+var_6E]
		mov	word ptr [bp+var_4+2], ss
		mov	word ptr [bp+var_4], ax
		les	bx, word ptr [bp+var_4]
		lea	ax, [bp+var_56]
		mov	es:[bx+4], ss
		mov	es:[bx+2], ax
		jmp	short loc_41989

loc_4197E:
		les	bx, word ptr [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax

loc_41989:
		mov	[bp+var_33], 0FFh
		mov	eax, [bp+var_4]
		mov	[bp+var_38], eax
		mov	[bp+var_3C], 0
		jmp	loc_41A54

loc_419A0:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+6]
		mov	ah, 0
		mov	dx, seg seg227
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+120h]
		mov	[bp+var_34], al
		mov	al, [bp+var_33]
		cmp	al, [bp+var_34]
		jnz	short loc_41A2D
		push	word ptr [si]
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_3E], ax
		mov	di, [si]
		add	di, 12h
		mov	eax, [di]
		mov	dword_7CDB6, eax
		mov	eax, [di+4]
		mov	dword_7CDBA, eax
		mov	eax, [di+8]
		mov	dword_7CDBE, eax
		push	large [bp+var_C]
		push	[bp+var_12]
		push	si
		push	6686h
		push	[bp+var_3E]
		push	large [bp+var_4]
		call	sub_37D97
		add	sp, 10h
		or	al, al
		jz	short loc_41A2D
		cmp	[bp+var_33], 0FFh
		jz	short loc_41A10
		jmp	loc_41866

loc_41A10:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+6]
		mov	[bp+var_33], al
		mov	eax, es:[bx+2]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_4], eax
		jmp	short loc_41A54

loc_41A2D:
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_41A54
		mov	eax, [bp+var_3C]
		mov	[bp+var_4], eax
		mov	[bp+var_3C], 0
		mov	[bp+var_33], 0FFh

loc_41A54:
		cmp	[bp+var_4], 0
		jz	short loc_41A5E
		jmp	loc_419A0

loc_41A5E:
		mov	al, 0

loc_41A60:
		pop	di
		pop	si
		leave
		retf
sub_4178D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41A64		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si]
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	ax, [si+2]
		cmp	ax, word_79788
		jz	short loc_41A86
		push	ax
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx

loc_41A86:
		pop	si
		pop	bp
		retf
sub_41A64		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41A89		proc far

var_EE		= dword ptr -0EEh
var_EA		= dword ptr -0EAh
var_E6		= dword ptr -0E6h
var_E2		= dword ptr -0E2h
var_DE		= dword ptr -0DEh
var_DA		= dword ptr -0DAh
var_D6		= dword ptr -0D6h
var_D2		= dword ptr -0D2h
var_CE		= dword ptr -0CEh
var_CA		= dword ptr -0CAh
var_C6		= dword ptr -0C6h
var_C2		= dword ptr -0C2h
var_BE		= dword ptr -0BEh
var_BA		= dword ptr -0BAh
var_B6		= dword ptr -0B6h
var_B2		= dword ptr -0B2h
var_AE		= dword ptr -0AEh
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0EEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	eax, dword_78D7D
		add	eax, dword_78D81
		mov	[bp+var_6], eax
		mov	eax, dword_7CDB6
		sub	eax, dword_7CDC2
		mov	[bp+var_8E], eax
		mov	eax, dword_7CDBA
		sub	eax, dword_7CDC6
		mov	[bp+var_8A], eax
		mov	eax, dword_7CDBE
		sub	eax, dword_7CDCA
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_7A], eax
		push	eax
		push	large [bp+var_7E]
		push	large [bp+var_82]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		sar	eax, 8
		cmp	eax, [bp+var_6]
		jge	short loc_41B2C
		push	si
		push	cs
		call	near ptr sub_41A64
		pop	cx
		mov	[bp+var_1], 1
		push	si
		push	cs
		call	near ptr sub_4178D
		pop	cx
		mov	[bp+var_2], al

loc_41B2C:
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_41B38
		jmp	loc_41E9D

loc_41B38:
		push	word ptr [si+2]
		push	ss
		lea	ax, word ptr [bp+var_A6]
		push	ax
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	word ptr [si]
		push	ss
		lea	ax, word ptr [bp+var_B2]
		push	ax
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_A6]
		sub	eax, [bp+var_B2]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_A2]
		sub	eax, [bp+var_AE]
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_9E]
		sub	eax, [bp+var_AA]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_BE]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_BA]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_B6]
		mov	[bp+var_92], eax
		lea	ax, word ptr [bp+var_82]
		push	ax
		lea	ax, word ptr [bp+var_9A]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_12]
		push	ax
		call	sub_578DF
		add	sp, 8
		push	large [bp+var_92]
		push	large [bp+var_96]
		push	large [bp+var_9A]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1A], eax
		mov	[bp+var_16], eax
		mov	al, byte_776BC
		mov	ah, 0
		mov	di, ax
		or	di, di
		jz	short loc_41C58
		xor	di, di
		mov	ax, [si]
		cmp	ax, word_7CADA
		jz	short loc_41C01
		mov	ax, [si+2]
		cmp	ax, word_7CADA
		jnz	short loc_41C58

loc_41C01:
		push	word ptr [si]
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_1C], dx
		mov	[bp+var_1E], ax
		push	dx
		push	ax
		les	bx, [bp+var_1E]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 17h
		jz	short loc_41C45
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_20], dx
		mov	[bp+var_22], ax
		push	dx
		push	ax
		les	bx, [bp+var_22]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 17h
		jnz	short loc_41C58

loc_41C45:
		mov	di, 1
		mov	[bp+var_26], 100h
		mov	eax, [bp+var_26]
		mov	[bp+var_16], eax

loc_41C58:
		cmp	[bp+var_16], 0
		jle	short loc_41C64
		mov	ax, 1
		jmp	short loc_41C66

loc_41C64:
		xor	ax, ax

loc_41C66:
		or	al, al
		jz	short loc_41C7F
		cmp	[bp+var_12], 5A00h
		jge	short loc_41C79
		mov	ax, 1
		jmp	short loc_41C7B

loc_41C79:
		xor	ax, ax

loc_41C7B:
		or	al, al
		jnz	short loc_41C86

loc_41C7F:
		or	di, di
		jnz	short loc_41C86
		jmp	loc_41E9D

loc_41C86:
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_2E]
		push	ax
		call	sub_566A3
		add	sp, 6
		mov	eax, [bp+var_A]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_2A], eax
		sar	eax, 8
		cmp	eax, [bp+var_6]
		jl	short loc_41CC0
		jmp	loc_41E9D

loc_41CC0:
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_3A]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_A]
		mov	edx, [bp+var_3A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_36], eax
		mov	eax, dword_7976E
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_36]
		cmp	eax, [bp+var_42]
		jle	short loc_41D18
		mov	ax, 1
		jmp	short loc_41D1A

loc_41D18:
		xor	ax, ax

loc_41D1A:
		or	al, al
		jz	short loc_41D25
		mov	[bp+var_2], 0
		jmp	loc_41E9D

loc_41D25:
		mov	eax, [bp+var_36]
		mov	edx, eax
		mov	ecx, [bp+var_16]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_36], eax
		push	word ptr [si]
		push	ss
		lea	ax, word ptr [bp+var_CA]
		push	ax
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_CA]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_C6]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_52], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_C2]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_D6], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_D2], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_CE], eax
		mov	eax, [bp+var_D6]
		add	dword_7CDB6, eax
		mov	eax, [bp+var_D2]
		add	dword_7CDBA, eax
		mov	eax, [bp+var_CE]
		add	dword_7CDBE, eax
		push	word ptr [si+2]
		push	ss
		lea	ax, word ptr [bp+var_E2]
		push	ax
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_E2]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_62], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_66], eax
		mov	eax, [bp+var_DE]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_DA]
		mov	edx, [bp+var_36]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_72], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_EE], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_EA], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_E6], eax
		mov	eax, [bp+var_EE]
		add	dword_7CDC2, eax
		mov	eax, [bp+var_EA]
		add	dword_7CDC6, eax
		mov	eax, [bp+var_E6]
		add	dword_7CDCA, eax
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_41E94
		push	si
		push	cs
		call	near ptr sub_41A64
		pop	cx

loc_41E94:
		push	si
		push	cs
		call	near ptr sub_4178D
		pop	cx
		mov	[bp+var_2], al

loc_41E9D:
		mov	al, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_41A89		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Collision_InstallExceptionHandler (sub_4463D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,19L
; — installe un gestionnaire (sub_1069, vecteur 0x1A0000F) avec un pointeur de code fixe :
; installation d'un handler d'exception/interruption spécifique.
; ==============================================================================================
Collision_InstallExceptionHandler		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	seg seg104
		push	offset sub_4169E
		push	large 10014h
		push	large 0C0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si], ax
		pop	si
		pop	bp
		retf
Collision_InstallExceptionHandler		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Collision_ResetLinkPool (sub_44663 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,31L — remet à
; zéro 15 entrées de 0x1A octets (deux champs 16-bit + deux flags) : réinitialisation d'un
; pool de 15 slots (probable pool de connexions/liaisons entre objets).
; ==============================================================================================
Collision_ResetLinkPool		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+2], 0
		mov	si, [si]
		xor	dx, dx
		jmp	short loc_41EEF

loc_41EDC:
		xor	ax, ax
		mov	[si+2], ax
		mov	[si], ax
		mov	al, 0
		mov	[si+0Bh], al
		mov	[si+0Ah], al
		inc	dx
		add	si, 0Ch

loc_41EEF:
		cmp	dx, 14h
		jl	short loc_41EDC
		pop	si
		pop	bp
		retf
Collision_ResetLinkPool		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41EF7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+4], 5D02h
		pop	si
		pop	bp
		retf
sub_41EF7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41F06		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_41F1A
		push	word ptr [si]
		call	sub_3B2
		pop	cx

loc_41F1A:
		mov	word ptr [si], 0
		pop	si
		pop	bp
		retf
sub_41F06		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41F21		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+0A2h], 0
		xor	dx, dx
		jmp	short loc_41F3B

loc_41F32:
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si], 0
		inc	dx

loc_41F3B:
		cmp	dx, 51h
		jl	short loc_41F32
		pop	si
		pop	bp
		retf
sub_41F21		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41F43		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	di, 51h
		jl	short loc_41F5F
		push	large 666h
		call	sub_1DDFE
		pop	cx

loc_41F5F:
		cmp	word ptr [si+0A2h], 50h
		jl	short loc_41F6F
		push	0FACEh
		call	sub_1DDFE
		pop	cx

loc_41F6F:
		or	di, di
		jl	short loc_41FA7
		cmp	di, 51h
		jge	short loc_41FA7
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+si]
		mov	[bp+var_2], ax
		mov	ax, [si+0A2h]
		inc	word ptr [si+0A2h]
		shl	ax, 2
		mov	cx, si
		add	cx, ax
		add	cx, 0A4h
		mov	bx, di
		shl	bx, 1
		mov	[bx+si], cx
		mov	bx, cx
		mov	ax, [bp+arg_4]
		mov	[bx], ax
		mov	ax, [bp+var_2]
		mov	[bx+2], ax

loc_41FA7:
		pop	di
		pop	si
		leave
		retf
sub_41F43		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41FAB		proc far

var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		test	byte ptr [bx+2], 2
		jnz	short loc_41FC2
		jmp	loc_42098

loc_41FC2:
		cmp	word ptr [si+0A2h], 50h
		jl	short loc_41FD2
		push	0FACEh
		call	sub_1DDFE
		pop	cx

loc_41FD2:
		mov	di, si
		add	di, 1E4h
		mov	eax, [di]
		mov	[bp+var_16], eax
		mov	eax, [di+4]
		mov	[bp+var_12], eax
		mov	eax, [di+8]
		mov	[bp+var_E], eax
		mov	di, [bp+arg_2]
		add	di, 12h
		mov	eax, [di]
		sub	eax, [bp+var_16]
		sar	eax, 8
		mov	[bp+var_4], eax
		add	[bp+var_4], 0A00h
		cmp	[bp+var_4], 0
		jge	short loc_4201B
		mov	[bp+var_4], 0

loc_4201B:
		cmp	[bp+var_4], 1200h
		jl	short loc_4202D
		mov	[bp+var_4], 11FFh

loc_4202D:
		mov	eax, [bp+var_4]
		sar	eax, 9
		mov	[bp+var_4], eax
		mov	eax, [di+4]
		sub	eax, [bp+var_12]
		sar	eax, 8
		mov	[bp+var_8], eax
		add	[bp+var_8], 0A00h
		cmp	[bp+var_8], 0
		jge	short loc_42060
		mov	[bp+var_8], 0

loc_42060:
		cmp	[bp+var_8], 1200h
		jl	short loc_42072
		mov	[bp+var_8], 11FFh

loc_42072:
		mov	eax, [bp+var_8]
		sar	eax, 9
		mov	[bp+var_8], eax
		mov	ax, word ptr [bp+var_8]
		imul	ax, ax, 9
		mov	dx, word ptr [bp+var_4]
		add	dx, ax
		mov	[bp+var_A], dx
		push	[bp+arg_2]
		push	dx
		push	si
		push	cs
		call	near ptr sub_41F43
		add	sp, 6

loc_42098:
		pop	di
		pop	si
		leave
		retf
sub_41FAB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4209C		proc far

var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= byte ptr -1Ch
var_1A		= byte ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, word_79799
		mov	ax, [bx+0Ch]
		mov	[bp+var_4], ax
		or	ax, ax
		jnz	short loc_420B8
		jmp	loc_42345

loc_420B8:
		mov	eax, [bx+24h]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0
		jnz	short loc_420D0
		push	0B00Bh
		call	sub_1DDFE
		pop	cx

loc_420D0:
		mov	di, si
		add	di, 1E4h
		mov	eax, [di]
		mov	[bp+var_38], eax
		mov	eax, [di+4]
		mov	[bp+var_34], eax
		mov	eax, [di+8]
		mov	[bp+var_30], eax
		mov	ax, [bp+var_4]
		mov	[bp+var_2], ax
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax
		jmp	loc_4233C

loc_420FE:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+4]
		and	ax, 3
		or	al, al
		jnz	short loc_4210F
		jmp	loc_42338

loc_4210F:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+4]
		and	ax, 3
		cmp	al, 1
		jz	short loc_42120
		jmp	loc_42335

loc_42120:
		push	large [bp+var_8]
		call	sub_50324
		add	sp, 4
		les	bx, word ptr [bp+var_8]
		mov	edx, es:[bx+5]
		mov	bx, ax
		sub	edx, [bx]
		sub	edx, [bp+var_38]
		sar	edx, 8
		mov	[bp+var_10], edx
		add	[bp+var_10], 0A00h
		cmp	[bp+var_10], 0
		jge	short loc_4215C
		mov	[bp+var_10], 0

loc_4215C:
		cmp	[bp+var_10], 1200h
		jl	short loc_4216E
		mov	[bp+var_10], 11FFh

loc_4216E:
		mov	eax, [bp+var_10]
		sar	eax, 9
		mov	[bp+var_10], eax
		push	large [bp+var_8]
		call	sub_50324
		add	sp, 4
		les	bx, word ptr [bp+var_8]
		mov	edx, es:[bx+9]
		mov	bx, ax
		sub	edx, [bx+4]
		sub	edx, [bp+var_34]
		sar	edx, 8
		mov	[bp+var_14], edx
		add	[bp+var_14], 0A00h
		cmp	[bp+var_14], 0
		jge	short loc_421B7
		mov	[bp+var_14], 0

loc_421B7:
		cmp	[bp+var_14], 1200h
		jl	short loc_421C9
		mov	[bp+var_14], 11FFh

loc_421C9:
		mov	eax, [bp+var_14]
		sar	eax, 9
		mov	[bp+var_14], eax
		mov	ax, word ptr [bp+var_14]
		imul	ax, ax, 9
		mov	dx, word ptr [bp+var_10]
		add	dx, ax
		mov	[bp+var_16], dx
		mov	bx, [bp+var_16]
		shl	bx, 1
		mov	ax, [bx+si]
		mov	[bp+var_18], ax
		cmp	[bp+var_18], 0
		jnz	short loc_421F6
		jmp	loc_42335

loc_421F6:
		jmp	loc_4232C

loc_421F9:
		mov	bx, [bp+var_18]
		mov	di, [bx]
		or	di, di
		jnz	short loc_42205
		jmp	loc_42323

loc_42205:
		les	bx, word ptr [bp+var_8]
		cmp	es:[bx+19h], di
		jnz	short loc_42211
		jmp	loc_42323

loc_42211:
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		mov	[bp+var_1C], al
		cmp	[bp+var_1C], 3
		jnz	short loc_42224
		jmp	loc_42323

loc_42224:
		cmp	[bp+var_1C], 0Bh
		jnz	short loc_4222D
		jmp	loc_42323

loc_4222D:
		push	large [bp+var_8]
		push	di
		call	sub_503A3
		add	sp, 6
		mov	[bp+var_1A], al
		or	al, al
		jnz	short loc_42244
		jmp	loc_42323

loc_42244:
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_1E], dx
		mov	[bp+var_20], ax
		mov	al, [bp+var_1A]
		push	ax
		push	large [bp+var_8]
		push	di
		push	dx
		push	[bp+var_20]
		les	bx, [bp+var_20]
		mov	bx, es:[bx]
		call	dword ptr [bx+14h]
		add	sp, 0Ch
		or	al, al
		jz	short loc_422AB
		cmp	word_78D85, 6
		jge	short loc_422AB
		les	bx, word ptr [bp+var_8]
		mov	ax, es:[bx+19h]
		mov	[bp+var_22], ax
		push	ax
		mov	ax, word_78D85
		shl	ax, 1
		add	ax, 66AAh
		push	ax
		call	SetReference16
		add	sp, 4
		mov	[bp+var_24], di
		push	[bp+var_24]
		mov	ax, word_78D85
		shl	ax, 1
		add	ax, 669Eh
		push	ax
		call	SetReference16
		add	sp, 4
		inc	word_78D85

loc_422AB:
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+19h], di
		add	di, 12h
		mov	dx, word_7CEF9
		add	dx, 14h
		mov	eax, [di]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_50], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_4C], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_3C], eax
		push	eax
		push	large [bp+var_40]
		push	large [bp+var_44]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		les	bx, word ptr [bp+var_8]
		and	byte ptr es:[bx+4], 0FCh
		or	byte ptr es:[bx+4], 3

loc_42323:
		mov	bx, [bp+var_18]
		mov	ax, [bx+2]
		mov	[bp+var_18], ax

loc_4232C:
		cmp	[bp+var_18], 0
		jz	short loc_42335
		jmp	loc_421F9

loc_42335:
		dec	[bp+var_2]

loc_42338:
		add	word ptr [bp+var_8], 1Bh

loc_4233C:
		cmp	[bp+var_2], 0
		jle	short loc_42345
		jmp	loc_420FE

loc_42345:
		pop	di
		pop	si
		leave
		retf
sub_4209C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42349		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	loc_42409

loc_4235C:
		mov	[bp+var_4], 0
		jmp	loc_423FD

loc_42364:
		mov	ax, [bp+var_2]
		imul	ax, ax, 9
		mov	dx, [bp+var_4]
		add	dx, ax
		mov	[bp+var_6], dx
		mov	bx, [bp+var_6]
		shl	bx, 1
		mov	di, [bx+si]
		jmp	short loc_423F6

loc_4237B:
		mov	ax, [di]
		mov	[bp+var_8], ax
		mov	dx, [di+2]
		or	dx, dx
		jz	short loc_42392
		push	dx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_42416
		add	sp, 6

loc_42392:
		cmp	[bp+var_4], 8
		jge	short loc_423D2
		mov	bx, [bp+var_6]
		inc	bx
		shl	bx, 1
		mov	dx, [bx+si]
		or	dx, dx
		jz	short loc_423B1
		push	dx
		push	[bp+var_8]
		push	si
		nop
		push	cs
		call	near ptr sub_42416
		add	sp, 6

loc_423B1:
		cmp	[bp+var_2], 8
		jge	short loc_423D2
		mov	bx, [bp+var_6]
		add	bx, 0Ah
		shl	bx, 1
		mov	dx, [bx+si]
		or	dx, dx
		jz	short loc_423D2
		push	dx
		push	[bp+var_8]
		push	si
		nop
		push	cs
		call	near ptr sub_42416
		add	sp, 6

loc_423D2:
		cmp	[bp+var_2], 8
		jge	short loc_423F3
		mov	bx, [bp+var_6]
		add	bx, 9
		shl	bx, 1
		mov	dx, [bx+si]
		or	dx, dx
		jz	short loc_423F3
		push	dx
		push	[bp+var_8]
		push	si
		nop
		push	cs
		call	near ptr sub_42416
		add	sp, 6

loc_423F3:
		mov	di, [di+2]

loc_423F6:
		or	di, di
		jnz	short loc_4237B
		inc	[bp+var_4]

loc_423FD:
		cmp	[bp+var_4], 9
		jge	short loc_42406
		jmp	loc_42364

loc_42406:
		inc	[bp+var_2]

loc_42409:
		cmp	[bp+var_2], 9
		jge	short loc_42412
		jmp	loc_4235C

loc_42412:
		pop	di
		pop	si
		leave
		retf
sub_42349		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42416		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	word_7CFAE, 14h
		jge	short loc_4242E
		jmp	loc_424FC

loc_4242E:
		jmp	loc_42505

loc_42431:
		mov	bx, [bp+arg_4]
		mov	di, [bx]
		mov	al, [si+2]
		and	al, 20h
		mov	ah, 0
		or	ax, ax
		jz	short loc_4244F
		mov	al, [di+2]
		and	al, 20h
		mov	ah, 0
		or	ax, ax
		jz	short loc_4244F
		jmp	loc_424F3

loc_4244F:
		test	byte ptr [si+2], 4
		jnz	short loc_4245E
		test	byte ptr [di+2], 4
		jnz	short loc_4245E
		jmp	loc_424F3

loc_4245E:
		mov	al, byte_7CB0A
		mov	ah, 0
		or	ax, ax
		jnz	short loc_424A3
		mov	al, [si+2]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh
		jnz	short loc_42479
		mov	ax, 1
		jmp	short loc_4247B

loc_42479:
		xor	ax, ax

loc_4247B:
		or	al, al
		jz	short loc_424A3
		mov	al, [di+2]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh
		jnz	short loc_42491
		mov	ax, 1
		jmp	short loc_42493

loc_42491:
		xor	ax, ax

loc_42493:
		or	al, al
		jz	short loc_424A3
		cmp	si, word_7CADA
		jz	short loc_424F3
		cmp	di, word_7CADA
		jz	short loc_424F3

loc_424A3:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 0Fh
		jnz	short loc_424B9
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 0Fh
		jz	short loc_424F3

loc_424B9:
		cmp	word_7CFAE, 14h
		jge	short loc_42505
		mov	ax, word_7CFAE
		imul	ax, ax, 0Ch
		mov	dx, word_7CFAC
		add	dx, ax
		mov	[bp+var_2], dx
		push	di
		push	si
		push	dx
		nop
		push	cs
		call	near ptr sub_42785
		add	sp, 6
		push	[bp+var_2]
		push	cs
		call	near ptr sub_41A89
		pop	cx
		or	al, al
		jz	short loc_424F3
		cmp	word_7CFAE, 14h
		jge	short loc_424F3
		inc	word_7CFAE
		jmp	short loc_424F3

loc_424F3:
		mov	bx, [bp+arg_4]
		mov	ax, [bx+2]
		mov	[bp+arg_4], ax

loc_424FC:
		cmp	[bp+arg_4], 0
		jz	short loc_42505
		jmp	loc_42431

loc_42505:
		pop	di
		pop	si
		leave
		retf
sub_42416		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42509		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word_7CADA, 0
		jz	short loc_42594
		mov	di, word_7CADA
		add	di, 12h
		push	word ptr [si+4]
		push	cs
		call	near ptr sub_41F21
		pop	cx
		mov	eax, [di]
		mov	bx, [si+4]
		mov	[bx+1E4h], eax
		mov	eax, [di+4]
		mov	[bx+1E8h], eax
		mov	eax, [di+8]
		mov	[bx+1ECh], eax
		mov	ax, [si+4]
		add	ax, 1E4h
		mov	ax, word_7CEDD
		mov	[bp+var_2], ax
		xor	di, di
		jmp	short loc_4257E

loc_42557:
		or	di, di
		jz	short loc_4256B
		push	di
		push	word ptr [si+4]
		push	cs
		call	near ptr sub_41FAB
		add	sp, 4
		mov	di, [di+4]
		jmp	short loc_42571

loc_4256B:
		mov	bx, [bp+var_2]
		mov	di, [bx+0Bh]

loc_42571:
		or	di, di
		jnz	short loc_4257E
		mov	bx, [bp+var_2]
		mov	ax, [bx+9]
		mov	[bp+var_2], ax

loc_4257E:
		cmp	[bp+var_2], 0
		jnz	short loc_42557
		push	word ptr [si+4]
		push	cs
		call	near ptr sub_42349
		pop	cx
		push	word ptr [si+4]
		push	cs
		call	near ptr sub_4209C
		pop	cx

loc_42594:
		pop	di
		pop	si
		leave
		retf
sub_42509		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42598		proc far

var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 14h
		jl	short loc_425AC
		jmp	loc_426FA

loc_425AC:
		mov	[bp+var_2], 0
		mov	ax, word_79788
		mov	[bp+var_4], ax
		mov	ax, word_7CEDD
		mov	[bp+var_6], ax
		jmp	loc_426F1

loc_425C0:
		cmp	[bp+var_2], 0
		jnz	short loc_425C9
		jmp	loc_426DD

loc_425C9:
		mov	di, [bp+var_2]
		test	byte ptr [di+2], 4
		jnz	short loc_425D5
		jmp	loc_426D5

loc_425D5:
		push	0
		mov	[bp+var_E], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_32], eax
		mov	[bp+var_12], 0
		mov	eax, [bp+var_12]
		mov	[bp+var_2E], eax
		mov	[bp+var_16], 100h
		mov	eax, [bp+var_16]
		mov	[bp+var_2A], eax
		lea	ax, word ptr [bp+var_32]
		push	ax
		mov	ax, di
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	bx, word_79788
		mov	al, [bx+207h]
		mov	[bp+var_17], al
		mov	al, [di+2]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh
		jnz	short loc_4263F
		mov	ax, 1
		jmp	short loc_42641

loc_4263F:
		xor	ax, ax

loc_42641:
		or	al, al
		jz	short loc_42695
		cmp	[bp+var_17], 0
		jz	short loc_42663
		push	di
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	Aircraft_GroundClearance_3DF89
		add	sp, 6
		mov	eax, [bp+var_A]
		add	eax, [bp+var_1C]
		jmp	short loc_42691

loc_42663:
		push	word ptr [di+52h]
		mov	bx, [di+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jnz	short loc_42695
		mov	eax, [di+1Ah]
		add	eax, 0FFFFDD00h
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax

loc_42691:
		mov	[bp+var_A], eax

loc_42695:
		mov	eax, [di+1Ah]
		cmp	eax, [bp+var_A]
		jge	short loc_426A4
		mov	ax, 1
		jmp	short loc_426A6

loc_426A4:
		xor	ax, ax

loc_426A6:
		or	al, al
		jz	short loc_426D5
		cmp	word ptr [si+2], 14h
		jge	short loc_426FA
		mov	ax, [si+2]
		imul	ax, ax, 0Ch
		mov	dx, [si]
		add	dx, ax
		mov	[bp+var_26], dx
		push	[bp+var_4]
		push	di
		push	dx
		nop
		push	cs
		call	near ptr sub_42785
		add	sp, 6
		cmp	word ptr [si+2], 14h
		jge	short loc_426D5
		inc	word ptr [si+2]
		jmp	short loc_426D5

loc_426D5:
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		jmp	short loc_426E3

loc_426DD:
		mov	bx, [bp+var_6]
		mov	ax, [bx+0Bh]

loc_426E3:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_426F1
		mov	[bp+var_6], 0

loc_426F1:
		cmp	[bp+var_6], 0
		jz	short loc_426FA
		jmp	loc_425C0

loc_426FA:
		pop	di
		pop	si
		leave
		retf
sub_42598		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CollisionLink_RemoveByID (sub_44D32 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,52L — parcourt
; une table (pas 0x1A octets) et retire les entrées correspondant à une valeur donnée :
; retrait sélectif d'entrées d'une table de liaisons/connexions par identifiant.
; ==============================================================================================
CollisionLink_RemoveByID		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		inc	cx
		mov	ax, cx
		imul	ax, ax, 0Ch
		mov	di, [si]
		add	di, ax
		jmp	short loc_42740

loc_42718:
		mov	ax, [di]
		mov	[bp+var_2], ax
		mov	ax, [di+2]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		cmp	ax, [bp+arg_4]
		jz	short loc_42733
		mov	ax, [bp+var_4]
		cmp	ax, [bp+arg_4]
		jnz	short loc_4273C

loc_42733:
		mov	word ptr [di], 0
		mov	word ptr [di+2], 0

loc_4273C:
		inc	cx
		add	di, 0Ch

loc_42740:
		cmp	[si+2], cx
		jg	short loc_42718
		pop	di
		pop	si
		leave
		retf
CollisionLink_RemoveByID		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42749		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	di, [si]
		xor	dx, dx
		jmp	short loc_4277A

loc_4275D:
		mov	ax, [di]
		mov	[bp+var_2], ax
		mov	ax, [di+2]
		mov	[bp+var_4], ax
		cmp	[bp+var_2], cx
		jz	short loc_42772
		cmp	[bp+var_4], cx
		jnz	short loc_42776

loc_42772:
		mov	al, 1
		jmp	short loc_42781

loc_42776:
		inc	dx
		add	di, 0Ch

loc_4277A:
		cmp	[si+2], dx
		jg	short loc_4275D
		mov	al, 0

loc_42781:
		pop	di
		pop	si
		leave
		retf
sub_42749		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42785		proc far

var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	[si+6], eax
		mov	ax, [bp+arg_2]
		mov	[si], ax
		mov	dx, [bp+arg_2]
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	dword_7CDB6, eax
		mov	eax, [bx+4]
		mov	dword_7CDBA, eax
		mov	eax, [bx+8]
		mov	dword_7CDBE, eax
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		les	bx, [bp+var_C]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 0Fh
		jnz	short loc_4280E
		mov	ax, [bp+arg_2]
		add	ax, 52h
		mov	[bp+var_E], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_12], eax
		jmp	short loc_42816

loc_4280E:
		les	bx, [bp+var_8]
		mov	eax, es:[bx+10h]

loc_42816:
		sar	eax, 8
		mov	dword_78D7D, eax
		mov	byte ptr [si+4], 0FFh
		mov	byte ptr [si+0Ah], 0
		mov	[si+2], di
		cmp	di, word_79788
		jz	short loc_42891
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		les	bx, [bp+var_16]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		mov	dx, di
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	dword_7CDC2, eax
		mov	eax, [bx+4]
		mov	dword_7CDC6, eax
		mov	eax, [bx+8]
		mov	dword_7CDCA, eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 0Fh
		jnz	short loc_42881
		add	di, 52h
		mov	eax, [di]
		mov	[bp+var_1A], eax
		jmp	short loc_42889

loc_42881:
		les	bx, [bp+var_8]
		mov	eax, es:[bx+10h]

loc_42889:
		sar	eax, 8
		mov	dword_78D81, eax

loc_42891:
		mov	byte ptr [si+5], 0FFh
		mov	byte ptr [si+0Bh], 0
		pop	di
		pop	si
		leave
		retf
sub_42785		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4289D		proc far

var_EE		= word ptr -0EEh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= byte ptr -0B0h
var_A5		= word ptr -0A5h
var_A3		= byte ptr -0A3h
var_62		= word ptr -62h
var_60		= byte ptr -60h
var_5F		= byte ptr -5Fh
var_5E		= word ptr -5Eh
var_5C		= dword ptr -5Ch
var_54		= word ptr -54h
var_52		= word ptr -52h
var_25		= dword ptr -25h
var_1D		= word ptr -1Dh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0EEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 1
		mov	di, [si]
		mov	[bp+var_8], 0
		jmp	loc_42A9E

loc_428B7:
		cmp	[bp+var_8], 14h
		jl	short loc_428C6
		push	0FAC0h
		call	sub_1DDFE
		pop	cx

loc_428C6:
		mov	ax, [di]
		mov	[bp+var_4], ax
		mov	ax, [di+2]
		mov	[bp+var_6], ax
		cmp	[bp+var_4], 0
		jnz	short loc_428DA
		jmp	loc_42A98

loc_428DA:
		cmp	[bp+var_6], 0
		jnz	short loc_428E3
		jmp	loc_42A98

loc_428E3:
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		push	8
		push	ds
		push	offset aTERRAIN
		mov	bx, [bp+var_4]
		push	large [bx+6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_42912
		mov	ax, 1
		jmp	short loc_42914

loc_42912:
		xor	ax, ax

loc_42914:
		or	al, al
		jz	short loc_42925
		mov	ax, [bp+var_6]
		cmp	ax, word_7CADA
		jnz	short loc_42925
		mov	[bp+var_1], 0

loc_42925:
		push	8
		push	ds
		push	offset aTERRAIN
		mov	bx, [bp+var_6]
		push	large [bx+6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_42943
		mov	ax, 1
		jmp	short loc_42945

loc_42943:
		xor	ax, ax

loc_42945:
		or	al, al
		jz	short loc_42956
		mov	ax, [bp+var_4]
		cmp	ax, word_7CADA
		jnz	short loc_42956
		mov	[bp+var_1], 0

loc_42956:
		mov	al, [di+4]
		mov	byte ptr [bp+var_E], al
		mov	ax, [bp+var_6]
		cmp	ax, word_79788
		jnz	short loc_42991
		mov	al, byte ptr [bp+var_E]
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	large [bp+var_C]
		les	bx, word ptr [bp+var_C]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 0Ah
		mov	[di+0Ah], al
		cmp	byte ptr [di+0Ah], 0
		jnz	short loc_4298B
		jmp	loc_42A98

loc_4298B:
		push	[bp+var_4]
		jmp	loc_42A8D

loc_42991:
		push	[bp+var_6]
		mov	bx, [bp+var_6]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		mov	al, [di+5]
		mov	byte ptr [bp+var_14], al
		push	large [bp+var_C]
		les	bx, word ptr [bp+var_C]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 17h
		jz	short loc_429D0
		push	large [bp+var_12]
		les	bx, word ptr [bp+var_12]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 17h
		jnz	short loc_429F0

loc_429D0:
		mov	ax, [bp+var_4]
		cmp	ax, word_7CADA
		jz	short loc_429E2
		mov	ax, [bp+var_6]
		cmp	ax, word_7CADA
		jnz	short loc_429F0

loc_429E2:
		mov	byte_776BC, 1
		mov	[bp+var_1], 0
		mov	byte_78EB7, 1

loc_429F0:
		push	large [bp+var_12]
		les	bx, word ptr [bp+var_12]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 11h
		jnz	short loc_42A13
		mov	ax, [bp+var_4]
		cmp	ax, word_7CADA
		jnz	short loc_42A44
		mov	[bp+var_1], 0
		jmp	short loc_42A44

loc_42A13:
		mov	al, byte ptr [bp+var_E]
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	large [bp+var_C]
		les	bx, word ptr [bp+var_C]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 0Ah
		mov	[di+0Ah], al
		cmp	byte ptr [di+0Ah], 0
		jz	short loc_42A44
		push	[bp+var_4]
		push	[bp+var_8]
		push	si
		push	cs
		call	near ptr CollisionLink_RemoveByID
		add	sp, 6

loc_42A44:
		push	large [bp+var_C]
		les	bx, word ptr [bp+var_C]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 11h
		jnz	short loc_42A67
		mov	ax, [bp+var_6]
		cmp	ax, word_7CADA
		jnz	short loc_42A98
		mov	[bp+var_1], 0
		jmp	short loc_42A98

loc_42A67:
		mov	al, byte ptr [bp+var_14]
		push	ax
		push	[bp+var_4]
		push	[bp+var_6]
		push	large [bp+var_12]
		les	bx, word ptr [bp+var_12]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 0Ah
		mov	[di+0Bh], al
		cmp	byte ptr [di+0Bh], 0
		jz	short loc_42A98
		push	[bp+var_6]

loc_42A8D:
		push	[bp+var_8]
		push	si
		push	cs
		call	near ptr CollisionLink_RemoveByID
		add	sp, 6

loc_42A98:
		inc	[bp+var_8]
		add	di, 0Ch

loc_42A9E:
		mov	ax, [si+2]
		cmp	ax, [bp+var_8]
		jle	short loc_42AA9
		jmp	loc_428B7

loc_42AA9:
		cmp	[bp+var_1], 0
		jz	short loc_42ABA
		cmp	word ptr [si+2], 14h
		jge	short loc_42ABA
		mov	byte_776BC, 0

loc_42ABA:
		mov	di, [si]
		mov	[bp+var_8], 0
		jmp	loc_42BC9

loc_42AC4:
		mov	ax, [di]
		mov	word ptr [bp+var_C+2], ax
		mov	ax, [di+2]
		mov	word ptr [bp+var_C], ax
		cmp	word ptr [bp+var_C+2], 0
		jnz	short loc_42AD8
		jmp	loc_42BC3

loc_42AD8:
		cmp	word ptr [bp+var_C], 0
		jnz	short loc_42AE1
		jmp	loc_42BC3

loc_42AE1:
		mov	byte ptr [bp+var_E+1], 0
		mov	byte ptr [bp+var_E], 0
		cmp	ax, word_79788
		jnz	short loc_42B21
		cmp	byte ptr [di+0Ah], 0
		jnz	short loc_42AF8
		jmp	loc_42B7D

loc_42AF8:
		push	word ptr [bp+var_C+2]
		mov	bx, word ptr [bp+var_C+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		push	0
		push	word ptr [bp+var_C+2]
		push	dx
		push	ax
		les	bx, word ptr [bp+var_12]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		mov	byte ptr [bp+var_E+1], al
		jmp	short loc_42B7D

loc_42B21:
		cmp	byte ptr [di+0Ah], 0
		jz	short loc_42B4F
		push	word ptr [bp+var_C+2]
		mov	bx, word ptr [bp+var_C+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		push	word ptr [bp+var_C]
		push	word ptr [bp+var_C+2]
		push	dx
		push	ax
		les	bx, [bp+var_16]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		mov	byte ptr [bp+var_E+1], al

loc_42B4F:
		cmp	byte ptr [di+0Bh], 0
		jz	short loc_42B7D
		push	word ptr [bp+var_C]
		mov	bx, word ptr [bp+var_C]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_18], dx
		mov	[bp+var_1A], ax
		push	word ptr [bp+var_C+2]
		push	word ptr [bp+var_C]
		push	dx
		push	ax
		les	bx, [bp+var_1A]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		mov	byte ptr [bp+var_E], al

loc_42B7D:
		cmp	byte ptr [bp+var_E+1], 0
		jz	short loc_42BA0
		push	word ptr [bp+var_C+2]
		push	67ADh
		call	sub_1E610
		add	sp, 4
		push	word ptr [bp+var_C+2]
		push	word_79788
		call	sub_3692F
		add	sp, 4

loc_42BA0:
		cmp	byte ptr [bp+var_E], 0
		jz	short loc_42BC3
		push	word ptr [bp+var_C]
		push	67ADh
		call	sub_1E610
		add	sp, 4
		push	word ptr [bp+var_C]
		push	word_79788
		call	sub_3692F
		add	sp, 4

loc_42BC3:
		inc	[bp+var_8]
		add	di, 0Ch

loc_42BC9:
		mov	ax, [si+2]
		cmp	ax, [bp+var_8]
		jle	short loc_42BD4
		jmp	loc_42AC4

loc_42BD4:
		mov	[bp+var_8], 0
		jmp	loc_42CF0

loc_42BDC:
		mov	bx, [bp+var_8]
		shl	bx, 1
		mov	si, [bx+669Eh]
		mov	ax, si
		or	ax, ax
		jnz	short loc_42BEE
		jmp	loc_42CED

loc_42BEE:
		mov	[bp+var_62], 0DAEh
		mov	[bp+var_5C], 0
		mov	[bp+var_5E], 0
		mov	[bp+var_60], 0
		mov	[bp+var_5F], 0
		mov	[bp+var_62], 15EAh
		lea	ax, [bp+var_62]
		push	ax
		call	Debris_BodyReset
		pop	cx
		mov	[bp+var_62], 22A4h
		mov	[bp+var_25], 0
		mov	[bp+var_1D], 0
		lea	ax, [bp+var_62]
		push	ax
		call	ParticleEmitter_Reset
		pop	cx
		mov	[bp+var_EE], 16A8h
		xor	eax, eax
		mov	[bp+var_B4], eax
		mov	[bp+var_B8], eax
		mov	[bp+var_B0], al
		push	ss
		lea	ax, [bp+var_EE]
		push	ax
		call	sub_741CA
		add	sp, 4
		mov	[bp+var_EE], 1F1Ch
		mov	[bp+var_A5], 0
		mov	[bp+var_EE], 1EC4h
		mov	[bp+var_A3], 0
		mov	[bp+var_EE], 1EDCh
		mov	[bp+var_EE], 1EFCh
		lea	ax, [bp+var_EE]
		mov	[bp+var_52], ss
		mov	[bp+var_54], ax
		mov	bx, [bp+var_8]
		shl	bx, 1
		mov	ax, [bx+66AAh]
		mov	word ptr [bp+var_C+2], ax
		push	ax
		lea	ax, [bp+var_1D]
		push	ax
		call	SetReference16
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_C], dx
		mov	[bp+var_E], ax
		lea	ax, [bp+var_62]
		push	ax
		push	si
		push	dx
		push	[bp+var_E]
		les	bx, [bp+var_E]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		or	al, al
		jz	short loc_42CCF
		push	si
		push	67ADh
		call	sub_1E610
		add	sp, 4

loc_42CCF:
		push	2
		push	ss
		lea	ax, [bp+var_EE]
		push	ax
		call	sub_4DC07
		add	sp, 6
		push	2
		lea	ax, [bp+var_62]
		push	ax
		call	sub_4E882
		add	sp, 4

loc_42CED:
		inc	[bp+var_8]

loc_42CF0:
		mov	ax, [bp+var_8]
		cmp	ax, word_78D85
		jge	short loc_42CFC
		jmp	loc_42BDC

loc_42CFC:
		mov	word_78D85, 0
		pop	di
		pop	si
		leave
		retf
sub_4289D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42D06		proc far
		push	bp
		mov	bp, sp
		push	seg seg104
		push	offset sub_42D74
		push	large 10006h
		push	2
		push	669Eh
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg104
		push	offset sub_42D74
		push	large 10006h
		push	2
		push	66AAh
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		pop	bp
		retf
sub_42D06		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42D3D		proc far
		push	bp
		mov	bp, sp
		push	seg seg104
		push	offset sub_42D96
		push	large 10006h
		push	2
		push	66AAh
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg seg104
		push	offset sub_42D96
		push	large 10006h
		push	2
		push	669Eh
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		pop	bp
		retf
sub_42D3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42D74		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_42D8D
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_42D91

loc_42D8D:
		mov	word ptr [si], 0

loc_42D91:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_42D74		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42D96		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_42DBB
		push	si
		call	WeakRef_InvalidateIfSet
		pop	cx
		test	di, 1
sub_42D96		endp
seg104		ends
