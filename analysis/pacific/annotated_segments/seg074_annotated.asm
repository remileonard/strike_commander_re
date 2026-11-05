seg074		segment	para public 'CODE' use16
		assume cs:seg074
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 36h, 4Ch, 48h, 9Ah, 0Ah, 0, 11h, 6Ah, 83h, 0C4h, 8, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BE6D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2BEBB
		cmp	word_7CADA, 0
		jz	short loc_2BEBB
		cmp	byte_7769E, 0
		jnz	short loc_2BEBB
		cmp	byte_77698, 0
		jnz	short loc_2BEBB
		mov	di, word_77696
		or	di, di
		jz	short loc_2BEBB
		cmp	word ptr [di+10h], 0
		jz	short loc_2BEBB
		mov	ax, di
		add	ax, 32h
		push	ax
		mov	bx, [di+32h]
		call	dword ptr [bx+0Ch]
		pop	cx
		mov	ax, di
		add	ax, 32h
		push	ax
		mov	bx, [di+32h]
		call	dword ptr [bx+10h]
		pop	cx

loc_2BEBB:
		mov	ax, si
		add	ax, 2
		push	ax
		push	ds
		push	offset unk_7CEFE
		call	sub_1602C
		add	sp, 6
		push	62B0h
		call	sub_1E055
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
sub_2BE6D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BEDA		proc far

var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= word ptr -76h
var_74		= word ptr -74h
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
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 8Eh
		push	si
		push	di
		mov	cx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	[bp+var_6], 70000000h
		mov	word ptr [si], 0
		mov	bx, cx
		mov	ax, [bx]
		dec	ax
		imul	ax, ax, 18h
		mov	dx, cx
		add	dx, ax
		add	dx, 2
		mov	[bp+var_A], dx
		mov	ax, [bp+var_A]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_4]
		shl	ax, 2
		mov	di, [bp+var_8]
		add	di, ax
		mov	eax, [bp+arg_6]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	[bp+var_14], eax
		mov	[bp+var_2C], 0
		mov	bx, [bp+var_A]
		mov	eax, [bx+0Ch]
		cmp	eax, [bp+var_2C]
		jge	short loc_2BF51
		mov	ax, 1
		jmp	short loc_2BF53

loc_2BF51:
		xor	ax, ax

loc_2BF53:
		or	al, al
		jz	short loc_2BF65
		mov	[bp+var_30], 0FFFFFF00h
		mov	eax, [bp+var_30]
		jmp	short loc_2BF71

loc_2BF65:
		mov	[bp+var_34], 100h
		mov	eax, [bp+var_34]

loc_2BF71:
		mov	[bp+var_28], eax
		mov	eax, [bp+arg_A]
		sub	[bp+var_14], eax
		mov	di, cx
		add	di, 2
		mov	bx, cx
		mov	ax, [bx]
		mov	[bp+var_2], ax
		jmp	loc_2C14F

loc_2BF8C:
		mov	[bp+var_8], di
		mov	[bp+var_38], 0
		mov	eax, [di+0Ch]
		cmp	eax, [bp+var_38]
		jge	short loc_2BFA6
		mov	ax, 1
		jmp	short loc_2BFA8

loc_2BFA6:
		xor	ax, ax

loc_2BFA8:
		or	al, al
		jz	short loc_2BFBA
		mov	[bp+var_3C], 0FFFFFF00h
		mov	eax, [bp+var_3C]
		jmp	short loc_2BFC6

loc_2BFBA:
		mov	[bp+var_40], 100h
		mov	eax, [bp+var_40]

loc_2BFC6:
		mov	[bp+var_28], eax
		mov	ax, [bp+arg_4]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		mov	[bp+var_42], dx
		mov	eax, [bp+arg_6]
		mov	bx, [bp+var_42]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		sub	eax, [bp+arg_A]
		mov	[bp+var_4E], eax
		mov	[bp+var_52], eax
		mov	[bp+var_18], eax
		mov	[bp+var_56], 0
		mov	eax, [bp+var_14]
		cmp	eax, [bp+var_56]
		jl	short loc_2C01D
		mov	ax, 1
		jmp	short loc_2C01F

loc_2C01D:
		xor	ax, ax

loc_2C01F:
		mov	[bp+var_5A], 0
		push	ax
		mov	eax, [bp+var_18]
		cmp	eax, [bp+var_5A]
		jl	short loc_2C037
		mov	ax, 1
		jmp	short loc_2C039

loc_2C037:
		xor	ax, ax

loc_2C039:
		pop	dx
		xor	dl, al
		or	dl, dl
		jnz	short loc_2C043
		jmp	loc_2C107

loc_2C043:
		mov	eax, [bp+var_14]
		sub	eax, [bp+var_18]
		mov	[bp+var_5E], eax
		mov	[bp+var_62], eax
		mov	[bp+var_1C], eax
		push	eax
		push	large [bp+var_6]
		push	large [bp+var_14]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_66], eax
		mov	[bp+var_6A], eax
		mov	[bp+var_1C], eax
		mov	[bp+var_E], di
		mov	ax, [bp+var_A]
		mov	[bp+var_C], ax
		mov	ax, [si]
		imul	ax, ax, 18h
		mov	dx, si
		add	dx, ax
		add	dx, 2
		mov	[bp+var_10], dx
		mov	[bp+var_74], 0
		jmp	short loc_2C0FF

loc_2C098:
		mov	ax, [bp+var_C]
		mov	[bp+var_76], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	bx, [bp+var_76]
		sub	eax, [bx]
		mov	[bp+var_7A], eax
		mov	[bp+var_7E], eax
		push	large [bp+var_6]
		push	eax
		push	large [bp+var_1C]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_82], eax
		mov	[bp+var_86], eax
		mov	[bp+var_72], eax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		add	eax, [bp+var_72]
		mov	[bp+var_8A], eax
		mov	[bp+var_8E], eax
		mov	bx, [bp+var_10]
		mov	[bx], eax
		inc	[bp+var_74]
		add	[bp+var_C], 4
		add	[bp+var_E], 4
		add	[bp+var_10], 4

loc_2C0FF:
		cmp	[bp+var_74], 6
		jl	short loc_2C098
		inc	word ptr [si]

loc_2C107:
		mov	[bp+var_6E], 0
		mov	eax, [bp+var_18]
		cmp	eax, [bp+var_6E]
		jl	short loc_2C11E
		mov	ax, 1
		jmp	short loc_2C120

loc_2C11E:
		xor	ax, ax

loc_2C120:
		or	al, al
		jz	short loc_2C13E
		mov	ax, [si]
		inc	word ptr [si]
		imul	ax, ax, 18h
		mov	dx, si
		add	dx, ax
		add	dx, 2
		push	ds
		push	dx
		push	ds
		push	di
		mov	cx, 18h
		call	CRT_Fmemcpy

loc_2C13E:
		dec	[bp+var_2]
		mov	[bp+var_A], di
		mov	eax, [bp+var_18]
		mov	[bp+var_14], eax
		add	di, 18h

loc_2C14F:
		cmp	[bp+var_2], 0
		jle	short loc_2C158
		jmp	loc_2BF8C

loc_2C158:
		pop	di
		pop	si
		leave
		retf
sub_2BEDA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C15C		proc far

var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= word ptr -76h
var_74		= word ptr -74h
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
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 8Eh
		push	si
		push	di
		mov	cx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	[bp+var_6], 70000000h
		mov	word ptr [si], 0
		mov	bx, cx
		mov	ax, [bx]
		dec	ax
		imul	ax, ax, 18h
		mov	dx, cx
		add	dx, ax
		add	dx, 2
		mov	[bp+var_A], dx
		mov	ax, [bp+var_A]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_4]
		shl	ax, 2
		mov	di, [bp+var_8]
		add	di, ax
		mov	eax, [bp+arg_6]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	[bp+var_14], eax
		mov	[bp+var_2C], 0
		mov	bx, [bp+var_A]
		mov	eax, [bx+0Ch]
		cmp	eax, [bp+var_2C]
		jge	short loc_2C1D3
		mov	ax, 1
		jmp	short loc_2C1D5

loc_2C1D3:
		xor	ax, ax

loc_2C1D5:
		or	al, al
		jz	short loc_2C1E7
		mov	[bp+var_30], 0FFFFFF00h
		mov	eax, [bp+var_30]
		jmp	short loc_2C1F3

loc_2C1E7:
		mov	[bp+var_34], 100h
		mov	eax, [bp+var_34]

loc_2C1F3:
		mov	[bp+var_28], eax
		mov	eax, [bp+arg_A]
		sub	[bp+var_14], eax
		mov	di, cx
		add	di, 2
		mov	bx, cx
		mov	ax, [bx]
		mov	[bp+var_2], ax
		jmp	loc_2C3D1

loc_2C20E:
		mov	[bp+var_8], di
		mov	[bp+var_38], 0
		mov	eax, [di+0Ch]
		cmp	eax, [bp+var_38]
		jge	short loc_2C228
		mov	ax, 1
		jmp	short loc_2C22A

loc_2C228:
		xor	ax, ax

loc_2C22A:
		or	al, al
		jz	short loc_2C23C
		mov	[bp+var_3C], 0FFFFFF00h
		mov	eax, [bp+var_3C]
		jmp	short loc_2C248

loc_2C23C:
		mov	[bp+var_40], 100h
		mov	eax, [bp+var_40]

loc_2C248:
		mov	[bp+var_28], eax
		mov	ax, [bp+arg_4]
		shl	ax, 2
		mov	dx, [bp+var_8]
		add	dx, ax
		mov	[bp+var_42], dx
		mov	eax, [bp+arg_6]
		mov	bx, [bp+var_42]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		sub	eax, [bp+arg_A]
		mov	[bp+var_4E], eax
		mov	[bp+var_52], eax
		mov	[bp+var_18], eax
		mov	[bp+var_56], 0
		mov	eax, [bp+var_14]
		cmp	eax, [bp+var_56]
		jg	short loc_2C29F
		mov	ax, 1
		jmp	short loc_2C2A1

loc_2C29F:
		xor	ax, ax

loc_2C2A1:
		mov	[bp+var_5A], 0
		push	ax
		mov	eax, [bp+var_18]
		cmp	eax, [bp+var_5A]
		jg	short loc_2C2B9
		mov	ax, 1
		jmp	short loc_2C2BB

loc_2C2B9:
		xor	ax, ax

loc_2C2BB:
		pop	dx
		xor	dl, al
		or	dl, dl
		jnz	short loc_2C2C5
		jmp	loc_2C389

loc_2C2C5:
		mov	eax, [bp+var_14]
		sub	eax, [bp+var_18]
		mov	[bp+var_5E], eax
		mov	[bp+var_62], eax
		mov	[bp+var_1C], eax
		push	eax
		push	large [bp+var_6]
		push	large [bp+var_14]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_66], eax
		mov	[bp+var_6A], eax
		mov	[bp+var_1C], eax
		mov	[bp+var_E], di
		mov	ax, [bp+var_A]
		mov	[bp+var_C], ax
		mov	ax, [si]
		imul	ax, ax, 18h
		mov	dx, si
		add	dx, ax
		add	dx, 2
		mov	[bp+var_10], dx
		mov	[bp+var_74], 0
		jmp	short loc_2C381

loc_2C31A:
		mov	ax, [bp+var_C]
		mov	[bp+var_76], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	bx, [bp+var_76]
		sub	eax, [bx]
		mov	[bp+var_7A], eax
		mov	[bp+var_7E], eax
		push	large [bp+var_6]
		push	eax
		push	large [bp+var_1C]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_82], eax
		mov	[bp+var_86], eax
		mov	[bp+var_72], eax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		add	eax, [bp+var_72]
		mov	[bp+var_8A], eax
		mov	[bp+var_8E], eax
		mov	bx, [bp+var_10]
		mov	[bx], eax
		inc	[bp+var_74]
		add	[bp+var_C], 4
		add	[bp+var_E], 4
		add	[bp+var_10], 4

loc_2C381:
		cmp	[bp+var_74], 6
		jl	short loc_2C31A
		inc	word ptr [si]

loc_2C389:
		mov	[bp+var_6E], 0
		mov	eax, [bp+var_18]
		cmp	eax, [bp+var_6E]
		jg	short loc_2C3A0
		mov	ax, 1
		jmp	short loc_2C3A2

loc_2C3A0:
		xor	ax, ax

loc_2C3A2:
		or	al, al
		jz	short loc_2C3C0
		mov	ax, [si]
		inc	word ptr [si]
		imul	ax, ax, 18h
		mov	dx, si
		add	dx, ax
		add	dx, 2
		push	ds
		push	dx
		push	ds
		push	di
		mov	cx, 18h
		call	CRT_Fmemcpy

loc_2C3C0:
		dec	[bp+var_2]
		mov	[bp+var_A], di
		mov	eax, [bp+var_18]
		mov	[bp+var_14], eax
		add	di, 18h

loc_2C3D1:
		cmp	[bp+var_2], 0
		jle	short loc_2C3DA
		jmp	loc_2C20E

loc_2C3DA:
		pop	di
		pop	si
		leave
		retf
sub_2C15C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C3DE		proc far

var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= word ptr -68h
var_66		= word ptr -66h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		push	di
		mov	cx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	[bp+var_6], 70000000h
		mov	word ptr [si], 0
		mov	bx, cx
		mov	ax, [bx]
		dec	ax
		imul	ax, ax, 18h
		mov	dx, cx
		add	dx, ax
		add	dx, 2
		mov	[bp+var_8], dx
		mov	bx, [bp+var_8]
		mov	ax, [bp+arg_4]
		shl	ax, 2
		mov	di, bx
		add	di, ax
		mov	eax, [bp+arg_6]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_22], eax
		mov	[bp+var_12], eax
		mov	bx, [bp+var_8]
		mov	eax, [bx+0Ch]
		mov	edx, [bp+arg_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		sub	[bp+var_12], eax
		mov	di, cx
		add	di, 2
		mov	bx, cx
		mov	ax, [bx]
		mov	[bp+var_2], ax
		jmp	loc_2C60B

loc_2C469:
		mov	bx, di
		mov	ax, [bp+arg_4]
		shl	ax, 2
		mov	dx, bx
		add	dx, ax
		mov	[bp+var_2C], dx
		mov	eax, [bp+arg_6]
		mov	bx, [bp+var_2C]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	eax, [di+0Ch]
		mov	edx, [bp+arg_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_34]
		sub	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		mov	[bp+var_16], eax
		mov	[bp+var_48], 0
		mov	eax, [bp+var_12]
		cmp	eax, [bp+var_48]
		jg	short loc_2C4DD
		mov	ax, 1
		jmp	short loc_2C4DF

loc_2C4DD:
		xor	ax, ax

loc_2C4DF:
		mov	[bp+var_4C], 0
		push	ax
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_4C]
		jg	short loc_2C4F7
		mov	ax, 1
		jmp	short loc_2C4F9

loc_2C4F7:
		xor	ax, ax

loc_2C4F9:
		pop	dx
		xor	dl, al
		or	dl, dl
		jnz	short loc_2C503
		jmp	loc_2C5C3

loc_2C503:
		mov	eax, [bp+var_12]
		sub	eax, [bp+var_16]
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		mov	[bp+var_1A], eax
		push	eax
		push	large [bp+var_6]
		push	large [bp+var_12]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_58], eax
		mov	[bp+var_5C], eax
		mov	[bp+var_1A], eax
		mov	[bp+var_C], di
		mov	ax, [bp+var_8]
		mov	[bp+var_A], ax
		mov	ax, [si]
		imul	ax, ax, 18h
		mov	dx, si
		add	dx, ax
		add	dx, 2
		mov	[bp+var_E], dx
		mov	[bp+var_66], 0
		jmp	short loc_2C5BB

loc_2C558:
		mov	ax, [bp+var_A]
		mov	[bp+var_68], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	bx, [bp+var_68]
		sub	eax, [bx]
		mov	[bp+var_6C], eax
		mov	[bp+var_70], eax
		push	large [bp+var_6]
		push	eax
		push	large [bp+var_1A]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_74], eax
		mov	[bp+var_78], eax
		mov	[bp+var_64], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		add	eax, [bp+var_64]
		mov	[bp+var_7C], eax
		mov	[bp+var_80], eax
		mov	bx, [bp+var_E]
		mov	[bx], eax
		inc	[bp+var_66]
		add	[bp+var_A], 4
		add	[bp+var_C], 4
		add	[bp+var_E], 4

loc_2C5BB:
		cmp	[bp+var_66], 6
		jl	short loc_2C558
		inc	word ptr [si]

loc_2C5C3:
		mov	[bp+var_60], 0
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_60]
		jg	short loc_2C5DA
		mov	ax, 1
		jmp	short loc_2C5DC

loc_2C5DA:
		xor	ax, ax

loc_2C5DC:
		or	al, al
		jz	short loc_2C5FA
		mov	ax, [si]
		inc	word ptr [si]
		imul	ax, ax, 18h
		mov	dx, si
		add	dx, ax
		add	dx, 2
		push	ds
		push	dx
		push	ds
		push	di
		mov	cx, 18h
		call	CRT_Fmemcpy

loc_2C5FA:
		dec	[bp+var_2]
		mov	[bp+var_8], di
		mov	eax, [bp+var_16]
		mov	[bp+var_12], eax
		add	di, 18h

loc_2C60B:
		cmp	[bp+var_2], 0
		jle	short loc_2C614
		jmp	loc_2C469

loc_2C614:
		pop	di
		pop	si
		leave
		retf
sub_2C3DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C618		proc far

var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= word ptr -68h
var_66		= word ptr -66h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		push	di
		mov	cx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	[bp+var_6], 70000000h
		mov	word ptr [si], 0
		mov	bx, cx
		mov	ax, [bx]
		dec	ax
		imul	ax, ax, 18h
		mov	dx, cx
		add	dx, ax
		add	dx, 2
		mov	[bp+var_8], dx
		mov	bx, [bp+var_8]
		mov	ax, [bp+arg_4]
		shl	ax, 2
		mov	di, bx
		add	di, ax
		mov	eax, [bp+arg_6]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_22], eax
		mov	[bp+var_12], eax
		mov	bx, [bp+var_8]
		mov	eax, [bx+0Ch]
		mov	edx, [bp+arg_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		sub	[bp+var_12], eax
		mov	di, cx
		add	di, 2
		mov	bx, cx
		mov	ax, [bx]
		mov	[bp+var_2], ax
		jmp	loc_2C845

loc_2C6A3:
		mov	bx, di
		mov	ax, [bp+arg_4]
		shl	ax, 2
		mov	dx, bx
		add	dx, ax
		mov	[bp+var_2C], dx
		mov	eax, [bp+arg_6]
		mov	bx, [bp+var_2C]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	eax, [di+0Ch]
		mov	edx, [bp+arg_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_34]
		sub	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		mov	[bp+var_16], eax
		mov	[bp+var_48], 0
		mov	eax, [bp+var_12]
		cmp	eax, [bp+var_48]
		jl	short loc_2C717
		mov	ax, 1
		jmp	short loc_2C719

loc_2C717:
		xor	ax, ax

loc_2C719:
		mov	[bp+var_4C], 0
		push	ax
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_4C]
		jl	short loc_2C731
		mov	ax, 1
		jmp	short loc_2C733

loc_2C731:
		xor	ax, ax

loc_2C733:
		pop	dx
		xor	dl, al
		or	dl, dl
		jnz	short loc_2C73D
		jmp	loc_2C7FD

loc_2C73D:
		mov	eax, [bp+var_12]
		sub	eax, [bp+var_16]
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		mov	[bp+var_1A], eax
		push	eax
		push	large [bp+var_6]
		push	large [bp+var_12]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_58], eax
		mov	[bp+var_5C], eax
		mov	[bp+var_1A], eax
		mov	[bp+var_C], di
		mov	ax, [bp+var_8]
		mov	[bp+var_A], ax
		mov	ax, [si]
		imul	ax, ax, 18h
		mov	dx, si
		add	dx, ax
		add	dx, 2
		mov	[bp+var_E], dx
		mov	[bp+var_66], 0
		jmp	short loc_2C7F5

loc_2C792:
		mov	ax, [bp+var_A]
		mov	[bp+var_68], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	bx, [bp+var_68]
		sub	eax, [bx]
		mov	[bp+var_6C], eax
		mov	[bp+var_70], eax
		push	large [bp+var_6]
		push	eax
		push	large [bp+var_1A]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_74], eax
		mov	[bp+var_78], eax
		mov	[bp+var_64], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		add	eax, [bp+var_64]
		mov	[bp+var_7C], eax
		mov	[bp+var_80], eax
		mov	bx, [bp+var_E]
		mov	[bx], eax
		inc	[bp+var_66]
		add	[bp+var_A], 4
		add	[bp+var_C], 4
		add	[bp+var_E], 4

loc_2C7F5:
		cmp	[bp+var_66], 6
		jl	short loc_2C792
		inc	word ptr [si]

loc_2C7FD:
		mov	[bp+var_60], 0
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_60]
		jl	short loc_2C814
		mov	ax, 1
		jmp	short loc_2C816

loc_2C814:
		xor	ax, ax

loc_2C816:
		or	al, al
		jz	short loc_2C834
		mov	ax, [si]
		inc	word ptr [si]
		imul	ax, ax, 18h
		mov	dx, si
		add	dx, ax
		add	dx, 2
		push	ds
		push	dx
		push	ds
		push	di
		mov	cx, 18h
		call	CRT_Fmemcpy

loc_2C834:
		dec	[bp+var_2]
		mov	[bp+var_8], di
		mov	eax, [bp+var_16]
		mov	[bp+var_12], eax
		add	di, 18h

loc_2C845:
		cmp	[bp+var_2], 0
		jle	short loc_2C84E
		jmp	loc_2C6A3

loc_2C84E:
		pop	di
		pop	si
		leave
		retf
sub_2C618		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Camera_CopyState
; (sub_2DE6D de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,74L — copie intégralement une structure caméra/objet 3D (position 20 octets,
; orientation normalisée 12+12 octets via sub_56E29, 8 octets additionnels via memcpy sub_3FD)
; : copie complète d'un état de caméra (position+orientation).
; ==============================================================================================
Camera_CopyState		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4], eax
		mov	eax, [di+8]
		mov	[si+8], eax
		mov	eax, [di+0Ch]
		mov	[si+0Ch], eax
		mov	eax, [di+10h]
		mov	[si+10h], eax
		mov	dx, di
		add	dx, 14h
		mov	bx, dx
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		mov	ax, di
		add	ax, 20h
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [di+44h]
		mov	[si+44h], eax
		mov	ax, si
		add	ax, 48h
		push	ds
		push	ax
		mov	ax, di
		add	ax, 48h
		push	ds
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy
		pop	di
		pop	si
		pop	bp
		retf
Camera_CopyState		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C8D7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_2C8D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C8E1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 0
		pop	bp
		retf
sub_2C8E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C8EB		proc far

var_6C		= word ptr -6Ch
var_58		= word ptr -58h
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Ch], 0
		jnz	short loc_2C8FF
		jmp	loc_2CA2F

loc_2C8FF:
		push	si
		push	62D4h
		push	cs
		call	near ptr Camera_CopyState
		add	sp, 4
		mov	ax, [si+5Ch]
		add	ax, 2
		mov	[bp+var_6], ax
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		call	sub_6735D
		add	sp, 4
		push	si
		nop
		push	cs
		call	near ptr sub_2D6FC
		pop	cx
		push	si
		push	67ADh
		call	sub_1E40E
		add	sp, 4
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2C961
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 4
		jnz	short loc_2C961
		mov	di, [si+5Ch]
		cmp	byte ptr [di+17Bh], 0
		jz	short loc_2C961
		push	si
		mov	ax, di
		add	ax, 22h
		push	ax
		call	sub_17B69
		add	sp, 4

loc_2C961:
		mov	al, byte_76E26
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2C975
		push	6496h
		call	sub_292D9
		pop	cx
		jmp	short loc_2C97A

loc_2C975:
		mov	byte_76E26, 0

loc_2C97A:
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+20h]
		pop	cx
		mov	al, byte_7978A
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2CA08
		cmp	word_797AB, 0
		jz	short loc_2CA08
		mov	ax, word_7AF7C
		mov	[bp+var_8], ax
		push	ax
		mov	ax, word_77535
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	0
		push	word_77535
		call	sub_75D09
		add	sp, 4
		push	0EFh
		push	word_77535
		call	sub_75D09
		add	sp, 4
		push	large 0A0000h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		push	3
		push	303Ah
		lea	ax, [bp+var_6C]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	13EEh
		lea	ax, [bp+var_58]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		lea	ax, [bp+var_58]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 4

loc_2CA08:
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+14h]
		pop	cx
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		pop	cx
		push	6496h
		call	sub_292BC
		pop	cx
		lea	ax, [bp+var_4]
		push	ax
		call	sub_67383
		pop	cx

loc_2CA2F:
		pop	di
		pop	si
		leave
		retf
sub_2C8EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via vtable
; (DATA XREF seg339) — enveloppe appelant StreamReader_Destruct_638FF. Référencée directement
; par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_2CA33		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	UIScreen_RenderGraphVGA_Wrapper_51B77
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_2CA33		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_TransformPoint (sub_2DFF3 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,84L — si une
; caméra parente est référencée (+0x5E), transforme un point via sub_33080 (transformation
; dans l'espace caméra) ; sinon fallback direct (+0x1C) : transformation d'un point dans
; l'espace de la caméra active (avec ou sans parent).
; ==============================================================================================
Camera_TransformPoint		proc far

var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Eh], 0
		jz	short loc_2CAC9
		mov	di, si
		add	di, 14h
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_1C], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_18], eax
		mov	[bp+var_C], 100h
		mov	eax, [bp+var_C]
		mov	[bp+var_14], eax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		sub	sp, 0Ch
		mov	eax, [di]
		mov	[bp+var_2E], eax
		mov	eax, [di+4]
		mov	[bp+var_2A], eax
		mov	eax, [di+8]
		mov	[bp+var_26], eax
		mov	ax, [si+5Eh]
		add	ax, 0Ah
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_32021
		add	sp, 14h
		mov	eax, [bp+var_10]
		sar	eax, 8
		shld	edx, eax, 10h
		jmp	short loc_2CAD6

loc_2CAC9:
		mov	eax, [si+1Ch]
		sar	eax, 8
		shld	edx, eax, 10h

loc_2CAD6:
		pop	di
		pop	si
		leave
		retf
Camera_TransformPoint		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CADA		proc far

var_14		= dword ptr -14h
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, di
		add	ax, 1Ah
		mov	[bp+var_6], ax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_4], eax
		mov	al, [di+2]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh
		jnz	short loc_2CB0C
		mov	ax, 1
		jmp	short loc_2CB0E

loc_2CB0C:
		xor	ax, ax

loc_2CB0E:
		or	al, al
		jz	short loc_2CB38
		push	word ptr [di+52h]
		mov	bx, [di+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	di, [bx]
		cmp	byte ptr [di+20h], 0
		jz	short loc_2CB38
		mov	[bp+var_A], 0FFEC0000h
		mov	eax, [bp+var_A]
		mov	[bp+var_4], eax

loc_2CB38:
		push	[bp+arg_4]
		sub	sp, 4
		mov	eax, [bp+var_4]
		mov	[bp+var_14], eax
		push	si
		nop
		push	cs
		call	near ptr sub_2CB53
		add	sp, 8
		pop	di
		pop	si
		leave
		retf
sub_2CADA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CB53		proc far

var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 3Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		mov	ax, di
		add	ax, 8
		mov	[bp+var_6], ax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_4], eax
		push	di
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	sub_5711C
		add	sp, 6
		mov	eax, [bp+var_E]
		neg	eax
		mov	[bp+var_12], eax
		mov	[bp+var_A], eax
		push	si
		push	cs
		call	near ptr Camera_TransformPoint
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_1A], eax
		shl	eax, 8
		mov	[bp+var_16], eax
		cmp	[bp+arg_2], 0FFEC0000h
		jnz	short loc_2CBB5
		mov	ax, 1
		jmp	short loc_2CBB7

loc_2CBB5:
		xor	ax, ax

loc_2CBB7:
		or	al, al
		jz	short loc_2CBDB
		mov	[bp+var_1E], 210000h
		mov	eax, [bp+var_1E]
		mov	[bp+arg_2], eax
		mov	[bp+var_22], 210000h
		mov	eax, [bp+var_22]
		mov	[bp+var_16], eax

loc_2CBDB:
		mov	eax, [si]
		shl	eax, 1
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		add	[bp+var_16], eax
		mov	eax, [bp+arg_2]
		sub	[bp+var_16], eax
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_4]
		jle	short loc_2CC04
		mov	ax, 1
		jmp	short loc_2CC06

loc_2CC04:
		xor	ax, ax

loc_2CC06:
		or	al, al
		jnz	short loc_2CC0D
		jmp	loc_2CD62

loc_2CC0D:
		cmp	[bp+var_A], 0FFFFEC00h
		jle	short loc_2CC1C
		mov	ax, 1
		jmp	short loc_2CC1E

loc_2CC1C:
		xor	ax, ax

loc_2CC1E:
		or	al, al
		jnz	short loc_2CC5C
		cmp	[bp+var_4], 0
		jz	short loc_2CC5C
		mov	eax, [bp+var_16]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_36], eax
		mov	[bp+var_2E], eax
		cmp	[bp+var_2E], 300h
		jg	short loc_2CC5C
		jmp	loc_2CD1E

loc_2CC5C:
		push	large [di+8]
		push	large [di+4]
		push	large [di]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_3E], eax
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	edx, dword_77B16
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_3A]
		jle	short loc_2CC9F
		mov	ax, 1
		jmp	short loc_2CCA1

loc_2CC9F:
		xor	ax, ax

loc_2CCA1:
		or	al, al
		jz	short loc_2CD14
		cmp	[bp+var_3A], 0
		jz	short loc_2CD14
		mov	eax, [bp+var_3A]
		mov	[di+8], eax
		mov	eax, [bp+var_16]
		mov	edx, eax
		mov	ecx, [bp+var_3A]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_16], eax
		mov	eax, [di]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[di], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[di+4], eax
		mov	ax, di
		add	ax, 4
		mov	eax, [di+8]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[di+8], eax
		mov	ax, di
		add	ax, 8
		jmp	short loc_2CD62

loc_2CD14:
		mov	eax, [bp+var_16]
		mov	[di+8], eax
		jmp	short loc_2CD62

loc_2CD1E:
		mov	eax, [di]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[di], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[di+4], eax
		mov	ax, di
		add	ax, 4
		mov	eax, [di+8]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[di+8], eax
		mov	ax, di
		add	ax, 8

loc_2CD62:
		pop	di
		pop	si
		leave
		retf
sub_2CB53		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Camera_DetachParent
; (sub_2E28F de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,20L — détache la référence de caméra parente (+0x5E), invalide le lien retour :
; détachement d'une caméra de son parent.
; ==============================================================================================
Camera_DetachParent		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Eh], 0
		jz	short loc_2CD80
		mov	bx, [si+5Eh]
		mov	word ptr [bx+4], 0
		mov	word ptr [si+5Eh], 0

loc_2CD80:
		pop	si
		pop	bp
		retf
Camera_DetachParent		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CD83		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	si
		pushaw
		mov	esi, dword_77550
		mov	edx, [bp+arg_0]
		mov	cx, 1
		mov	bx, 7370h
		mov	ax, 1209h
		int	15h
		popaw
		pop	si
		pop	bp
		retf
sub_2CD83		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CDA0		proc far

var_392		= dword ptr -392h
var_38E		= dword ptr -38Eh
var_386		= dword ptr -386h
var_382		= dword ptr -382h
var_37E		= dword ptr -37Eh
var_37A		= dword ptr -37Ah
var_376		= dword ptr -376h
var_372		= dword ptr -372h
var_36E		= dword ptr -36Eh
var_36A		= dword ptr -36Ah
var_366		= dword ptr -366h
var_362		= dword ptr -362h
var_35E		= dword ptr -35Eh
var_35A		= dword ptr -35Ah
var_356		= word ptr -356h
var_352		= word ptr -352h
var_34A		= word ptr -34Ah
var_346		= word ptr -346h
var_342		= word ptr -342h
var_266		= word ptr -266h
var_264		= word ptr -264h
var_174		= word ptr -174h
var_172		= dword ptr -172h
var_16E		= dword ptr -16Eh
var_16A		= dword ptr -16Ah
var_166		= dword ptr -166h
var_162		= dword ptr -162h
var_15E		= dword ptr -15Eh
var_15A		= dword ptr -15Ah
var_156		= dword ptr -156h
var_152		= dword ptr -152h
var_14E		= dword ptr -14Eh
var_14A		= dword ptr -14Ah
var_146		= dword ptr -146h
var_142		= dword ptr -142h
var_13E		= dword ptr -13Eh
var_13A		= dword ptr -13Ah
var_136		= dword ptr -136h
var_132		= dword ptr -132h
var_12E		= dword ptr -12Eh
var_12A		= dword ptr -12Ah
var_126		= dword ptr -126h
var_122		= dword ptr -122h
var_11E		= dword ptr -11Eh
var_11A		= dword ptr -11Ah
var_116		= dword ptr -116h
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
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 386h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	seg seg074
		push	offset sub_2DD31
		push	large 1000Ah
		push	18h
		lea	ax, word ptr [bp+var_172]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg074
		push	offset sub_2DD31
		push	large 1000Ah
		push	18h
		lea	ax, [bp+var_264]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		lea	ax, [bp+var_356]
		mov	word_7CC0C, ax
		or	si, si
		jz	short loc_2CE32
		mov	bx, 12h
		cmp	bx, word_7CC8E
		jnb	short loc_2CE09
		mov	ax, bx
		imul	ax, ax, 0Eh
		mov	edx, dword_7CC94
		push	ax
		mov	ax, word_7CC92
		pop	bx
		add	ax, bx
		jmp	short loc_2CE2A

loc_2CE09:
		sub	bx, word_7CC8E
		cmp	bx, word_7CC90
		jnb	short loc_2CE26
		mov	ax, bx
		imul	ax, ax, 18h
		mov	edx, dword_7CC98
		push	ax
		mov	ax, word_7CC96
		pop	bx
		add	ax, bx
		jmp	short loc_2CE2A

loc_2CE26:
		xor	dx, dx
		xor	ax, ax

loc_2CE2A:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		jmp	short loc_2CEA4

loc_2CE32:
		mov	bx, word_77B1A
		add	bx, 7
		cmp	bx, word_7CC8E
		jnb	short loc_2CE52
		mov	ax, bx
		imul	ax, ax, 0Eh
		mov	edx, dword_7CC94
		push	ax
		mov	ax, word_7CC92
		pop	bx
		add	ax, bx
		jmp	short loc_2CE73

loc_2CE52:
		sub	bx, word_7CC8E
		cmp	bx, word_7CC90
		jnb	short loc_2CE6F
		mov	ax, bx
		imul	ax, ax, 18h
		mov	edx, dword_7CC98
		push	ax
		mov	ax, word_7CC96
		pop	bx
		add	ax, bx
		jmp	short loc_2CE73

loc_2CE6F:
		xor	dx, dx
		xor	ax, ax

loc_2CE73:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		inc	word_77B1C
		mov	ax, word_77B1C
		cmp	ax, 2
		jnz	short loc_2CEA4
		cmp	word_77B60, 0
		jnz	short loc_2CEA4
		inc	word_77B1A
		mov	ax, word_77B1A
		cmp	ax, 0Ah
		jnz	short loc_2CE9E
		mov	word_77B1A, 0

loc_2CE9E:
		mov	word_77B1C, 0

loc_2CEA4:
		mov	[bp+var_174], 4
		mov	[bp+var_266], 0
		mov	di, [bp+arg_4]
		mov	eax, [di]
		mov	[bp+var_37A], eax
		mov	eax, [di+4]
		mov	[bp+var_376], eax
		mov	eax, [di+8]
		mov	[bp+var_372], eax
		mov	eax, [bp+var_37A]
		mov	[bp+var_386], eax
		mov	eax, [bp+var_376]
		mov	[bp+var_382], eax
		mov	eax, [bp+var_372]
		mov	[bp+var_37E], eax
		mov	eax, [bp+var_386]
		mov	[bp+var_362], eax
		mov	eax, [bp+var_382]
		mov	[bp+var_35E], eax
		mov	eax, [bp+var_37E]
		mov	[bp+var_35A], eax
		mov	eax, [bp+var_362]
		mov	[bp+var_36E], eax
		mov	eax, [bp+var_35E]
		mov	[bp+var_36A], eax
		mov	eax, [bp+var_35A]
		mov	[bp+var_366], eax
		or	si, si
		jz	short loc_2CF30
		mov	ax, 2134h
		jmp	short loc_2CF32

loc_2CF30:
		xor	ax, ax

loc_2CF32:
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_372], eax
		mov	[bp+var_35A], eax
		mov	[bp+var_37E], eax
		mov	[bp+var_366], eax
		sub	[bp+var_36E], 0C350000h
		sub	[bp+var_36A], 0C350000h
		sub	[bp+var_386], 0C350000h
		add	[bp+var_382], 0C350000h
		add	[bp+var_362], 0C350000h
		sub	[bp+var_35E], 0C350000h
		add	[bp+var_37A], 0C350000h
		add	[bp+var_376], 0C350000h
		or	si, si
		jz	short loc_2CFAB
		mov	ax, 80h
		jmp	short loc_2CFAE

loc_2CFAB:
		mov	ax, 10h

loc_2CFAE:
		movsx	ebx, ax
		mov	eax, [bp+var_36E]
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		mov	[bp+var_162], eax
		or	si, si
		jz	short loc_2CFCE
		mov	ax, 80h
		jmp	short loc_2CFD1

loc_2CFCE:
		mov	ax, 10h

loc_2CFD1:
		movsx	ebx, ax
		mov	eax, [bp+var_36A]
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		mov	[bp+var_15E], eax
		or	si, si
		jz	short loc_2CFF1
		mov	ax, 80h
		jmp	short loc_2CFF4

loc_2CFF1:
		mov	ax, 10h

loc_2CFF4:
		movsx	ebx, ax
		mov	eax, [bp+var_362]
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		mov	[bp+var_14A], eax
		or	si, si
		jz	short loc_2D014
		mov	ax, 80h
		jmp	short loc_2D017

loc_2D014:
		mov	ax, 10h

loc_2D017:
		movsx	ebx, ax
		mov	eax, [bp+var_35E]
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		mov	[bp+var_146], eax
		or	si, si
		jz	short loc_2D037
		mov	ax, 80h
		jmp	short loc_2D03A

loc_2D037:
		mov	ax, 10h

loc_2D03A:
		movsx	ebx, ax
		mov	eax, [bp+var_37A]
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		mov	[bp+var_132], eax
		or	si, si
		jz	short loc_2D05A
		mov	ax, 80h
		jmp	short loc_2D05D

loc_2D05A:
		mov	ax, 10h

loc_2D05D:
		movsx	ebx, ax
		mov	eax, [bp+var_376]
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		mov	[bp+var_12E], eax
		or	si, si
		jz	short loc_2D07D
		mov	ax, 80h
		jmp	short loc_2D080

loc_2D07D:
		mov	ax, 10h

loc_2D080:
		movsx	ebx, ax
		mov	eax, [bp+var_386]
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		mov	[bp+var_11A], eax
		or	si, si
		jz	short loc_2D0A0
		mov	ax, 80h
		jmp	short loc_2D0A3

loc_2D0A0:
		mov	ax, 10h

loc_2D0A3:
		movsx	ebx, ax
		mov	eax, [bp+var_382]
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		mov	[bp+var_116], eax
		mov	di, [bp+arg_4]
		mov	eax, [di]
		sub	[bp+var_36E], eax
		mov	eax, [di+4]
		sub	[bp+var_36A], eax
		mov	eax, [di+8]
		sub	[bp+var_366], eax
		mov	di, [bp+arg_4]
		mov	eax, [di]
		sub	[bp+var_362], eax
		mov	eax, [di+4]
		sub	[bp+var_35E], eax
		mov	eax, [di+8]
		sub	[bp+var_35A], eax
		mov	di, [bp+arg_4]
		mov	eax, [di]
		sub	[bp+var_386], eax
		mov	eax, [di+4]
		sub	[bp+var_382], eax
		mov	eax, [di+8]
		sub	[bp+var_37E], eax
		mov	di, [bp+arg_4]
		mov	eax, [di]
		sub	[bp+var_37A], eax
		mov	eax, [di+4]
		sub	[bp+var_376], eax
		mov	eax, [di+8]
		sub	[bp+var_372], eax
		push	[bp+arg_2]
		lea	ax, word ptr [bp+var_36E]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		push	[bp+arg_2]
		lea	ax, word ptr [bp+var_362]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		push	[bp+arg_2]
		lea	ax, word ptr [bp+var_386]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		push	[bp+arg_2]
		lea	ax, word ptr [bp+var_37A]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, [bp+var_36E]
		mov	[bp+var_172], eax
		mov	eax, [bp+var_366]
		mov	[bp+var_16E], eax
		mov	eax, [bp+var_36A]
		mov	[bp+var_16A], eax
		mov	[bp+var_166], eax
		mov	eax, [bp+var_362]
		mov	[bp+var_15A], eax
		mov	eax, [bp+var_35A]
		mov	[bp+var_156], eax
		mov	eax, [bp+var_35E]
		mov	[bp+var_152], eax
		mov	[bp+var_14E], eax
		mov	eax, [bp+var_37A]
		mov	[bp+var_142], eax
		mov	eax, [bp+var_372]
		mov	[bp+var_13E], eax
		mov	eax, [bp+var_376]
		mov	[bp+var_13A], eax
		mov	[bp+var_136], eax
		mov	eax, [bp+var_386]
		mov	[bp+var_12A], eax
		mov	eax, [bp+var_37E]
		mov	[bp+var_126], eax
		mov	eax, [bp+var_382]
		mov	[bp+var_122], eax
		mov	[bp+var_11E], eax
		sub	sp, 4
		mov	[bp+var_16], 100h
		mov	eax, [bp+var_16]
		mov	[bp+var_38E], eax
		sub	sp, 4
		mov	[bp+var_1A], 100h
		mov	eax, [bp+var_1A]
		mov	[bp+var_392], eax
		push	2
		lea	ax, [bp+var_266]
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		push	cs
		call	near ptr sub_2BEDA
		add	sp, 0Eh
		cmp	[bp+var_266], 0
		jnz	short loc_2D23F
		jmp	loc_2D6F8

loc_2D23F:
		sub	sp, 4
		or	si, si
		jz	short loc_2D253
		mov	[bp+var_1E], 4E20000h
		lea	ax, word ptr [bp+var_1E]
		jmp	short loc_2D25E

loc_2D253:
		mov	[bp+var_22], 2710000h
		lea	ax, word ptr [bp+var_22]

loc_2D25E:
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_38E], eax
		sub	sp, 4
		mov	[bp+var_26], 100h
		mov	eax, [bp+var_26]
		mov	[bp+var_392], eax
		push	2
		lea	ax, [bp+var_174]
		push	ax
		lea	ax, [bp+var_266]
		push	ax
		push	cs
		call	near ptr sub_2C15C
		add	sp, 0Eh
		cmp	[bp+var_174], 0
		jnz	short loc_2D299
		jmp	loc_2D6F8

loc_2D299:
		xor	di, di
		jmp	loc_2D349

loc_2D29E:
		mov	[bp+var_2A], 0EA6000h
		mov	bx, di
		imul	bx, bx, 18h
		lea	ax, word ptr [bp+var_16A]
		add	bx, ax
		mov	eax, [bx]
		cmp	eax, [bp+var_2A]
		jl	short loc_2D2BF
		mov	ax, 1
		jmp	short loc_2D2C1

loc_2D2BF:
		xor	ax, ax

loc_2D2C1:
		or	al, al
		jnz	short loc_2D2C8
		jmp	loc_2D348

loc_2D2C8:
		mov	bx, di
		imul	bx, bx, 18h
		lea	ax, word ptr [bp+var_172]
		add	bx, ax
		mov	eax, [bx]
		mov	[bp+var_36E], eax
		mov	bx, di
		imul	bx, bx, 18h
		lea	ax, word ptr [bp+var_16A]
		add	bx, ax
		mov	eax, [bx]
		mov	[bp+var_36A], eax
		mov	bx, di
		imul	bx, bx, 18h
		lea	ax, word ptr [bp+var_16E]
		add	bx, ax
		mov	eax, [bx]
		mov	[bp+var_366], eax
		push	[bp+arg_2]
		lea	ax, word ptr [bp+var_36E]
		push	ax
		call	sub_5A629
		add	sp, 4
		or	si, si
		jz	short loc_2D319
		xor	ax, ax
		jmp	short loc_2D31C

loc_2D319:
		mov	ax, 0DC00h

loc_2D31C:
		movsx	eax, ax
		mov	[bp+var_366], eax
		push	[bp+arg_2]
		lea	ax, word ptr [bp+var_36E]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	bx, di
		imul	bx, bx, 18h
		lea	ax, word ptr [bp+var_16E]
		add	bx, ax
		mov	eax, [bp+var_366]
		mov	[bx], eax

loc_2D348:
		inc	di

loc_2D349:
		cmp	di, [bp+var_174]
		jge	short loc_2D352
		jmp	loc_2D29E

loc_2D352:
		mov	[bp+var_2E], 0A100h
		mov	eax, [bp+var_2E]
		mov	[bp+var_12], eax
		mov	si, [bp+arg_6]
		mov	eax, [bp+var_12]
		mov	edx, eax
		mov	ecx, [si]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_12], eax
		sub	sp, 4
		mov	eax, [bp+var_12]
		neg	eax
		mov	[bp+var_32], eax
		mov	[bp+var_38E], eax
		sub	sp, 4
		mov	[bp+var_36], 100h
		mov	eax, [bp+var_36]
		mov	[bp+var_392], eax
		push	0
		lea	ax, [bp+var_266]
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		push	cs
		call	near ptr sub_2C618
		add	sp, 0Eh
		cmp	[bp+var_266], 0
		jnz	short loc_2D3C2
		jmp	loc_2D6F8

loc_2D3C2:
		sub	sp, 4
		mov	eax, [bp+var_12]
		mov	[bp+var_38E], eax
		sub	sp, 4
		mov	[bp+var_3A], 100h
		mov	eax, [bp+var_3A]
		mov	[bp+var_392], eax
		push	0
		lea	ax, [bp+var_174]
		push	ax
		lea	ax, [bp+var_266]
		push	ax
		push	cs
		call	near ptr sub_2C3DE
		add	sp, 0Eh
		cmp	[bp+var_174], 0
		jnz	short loc_2D3FF
		jmp	loc_2D6F8

loc_2D3FF:
		mov	[bp+var_3E], 6700h
		mov	eax, [bp+var_3E]
		mov	[bp+var_12], eax
		mov	si, [bp+arg_8]
		mov	eax, [bp+var_12]
		mov	edx, eax
		mov	ecx, [si]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_12], eax
		sub	sp, 4
		mov	eax, [bp+var_12]
		neg	eax
		mov	[bp+var_42], eax
		mov	[bp+var_38E], eax
		sub	sp, 4
		mov	[bp+var_46], 100h
		mov	eax, [bp+var_46]
		mov	[bp+var_392], eax
		push	1
		lea	ax, [bp+var_266]
		push	ax
		lea	ax, [bp+var_174]
		push	ax
		push	cs
		call	near ptr sub_2C618
		add	sp, 0Eh
		cmp	[bp+var_266], 0
		jnz	short loc_2D46F
		jmp	loc_2D6F8

loc_2D46F:
		sub	sp, 4
		mov	eax, [bp+var_12]
		mov	[bp+var_38E], eax
		sub	sp, 4
		mov	[bp+var_4A], 100h
		mov	eax, [bp+var_4A]
		mov	[bp+var_392], eax
		push	1
		lea	ax, [bp+var_174]
		push	ax
		lea	ax, [bp+var_266]
		push	ax
		push	cs
		call	near ptr sub_2C3DE
		add	sp, 0Eh
		cmp	[bp+var_174], 0
		jnz	short loc_2D4AC
		jmp	loc_2D6F8

loc_2D4AC:
		xor	si, si
		jmp	loc_2D6CE

loc_2D4B1:
		mov	bx, [bp+arg_A]
		movsx	eax, word ptr [bx]
		mov	bx, si
		imul	bx, bx, 18h
		lea	dx, [bp+var_356]
		add	bx, dx
		mov	[bx], eax
		mov	bx, si
		imul	bx, bx, 18h
		lea	ax, word ptr [bp+var_172]
		add	bx, ax
		mov	eax, [bx]
		mov	[bp+var_4E], eax
		mov	bx, si
		imul	bx, bx, 18h
		lea	ax, word ptr [bp+var_16A]
		add	bx, ax
		mov	eax, [bx]
		mov	[bp+var_52], eax
		mov	bx, [bp+arg_6]
		mov	eax, [bx]
		mov	[bp+var_56], eax
		mov	[bp+var_5A], eax
		push	large [bp+var_52]
		push	eax
		push	large [bp+var_4E]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_5E], eax
		mov	[bp+var_62], eax
		movsx	eax, word ptr [bp+var_62+1]
		mov	bx, si
		imul	bx, bx, 18h
		lea	dx, [bp+var_356]
		add	bx, dx
		add	[bx], eax
		mov	bx, si
		imul	bx, bx, 18h
		lea	ax, [bp+var_356]
		add	bx, ax
		cmp	dword ptr [bx], 0
		jge	short loc_2D54A
		mov	bx, si
		imul	bx, bx, 18h
		add	bx, ax
		mov	dword ptr [bx], 0
		jmp	short loc_2D56C

loc_2D54A:
		mov	bx, si
		imul	bx, bx, 18h
		lea	ax, [bp+var_356]
		add	bx, ax
		cmp	dword ptr [bx], 13Fh
		jle	short loc_2D56C
		mov	bx, si
		imul	bx, bx, 18h
		add	bx, ax
		mov	dword ptr [bx], 13Fh

loc_2D56C:
		mov	bx, [bp+arg_A]
		movsx	eax, word ptr [bx+2]
		mov	bx, si
		imul	bx, bx, 18h
		lea	dx, [bp+var_352]
		add	bx, dx
		mov	[bx], eax
		mov	bx, si
		imul	bx, bx, 18h
		lea	ax, word ptr [bp+var_16E]
		add	bx, ax
		mov	eax, [bx]
		mov	[bp+var_4E], eax
		mov	bx, [bp+arg_8]
		mov	eax, [bx]
		mov	[bp+var_66], eax
		mov	[bp+var_6A], eax
		push	large [bp+var_52]
		push	eax
		push	large [bp+var_4E]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_6E], eax
		mov	[bp+var_72], eax
		movsx	eax, word ptr [bp+var_72+1]
		mov	bx, si
		imul	bx, bx, 18h
		lea	dx, [bp+var_352]
		add	bx, dx
		sub	[bx], eax
		mov	bx, si
		imul	bx, bx, 18h
		lea	ax, [bp+var_352]
		add	bx, ax
		cmp	dword ptr [bx], 0
		jge	short loc_2D5F4
		mov	bx, si
		imul	bx, bx, 18h
		add	bx, ax
		mov	dword ptr [bx], 0
		jmp	short loc_2D616

loc_2D5F4:
		mov	bx, si
		imul	bx, bx, 18h
		lea	ax, [bp+var_352]
		add	bx, ax
		cmp	dword ptr [bx], 0C7h
		jle	short loc_2D616
		mov	bx, si
		imul	bx, bx, 18h
		add	bx, ax
		mov	dword ptr [bx], 0C7h

loc_2D616:
		mov	bx, si
		imul	bx, bx, 18h
		lea	ax, word ptr [bp+var_16A]
		add	bx, ax
		mov	eax, [bx]
		mov	ebx, 40h
		cdq
		idiv	ebx
		mov	[bp+var_7E], eax
		mov	[bp+var_82], eax
		sar	eax, 8
		mov	[bp+var_76], eax
		cmp	[bp+var_76], 0
		jnz	short loc_2D64F
		mov	[bp+var_76], 1

loc_2D64F:
		mov	eax, 40000000h
		cdq
		idiv	[bp+var_76]
		mov	bx, si
		imul	bx, bx, 18h
		lea	dx, [bp+var_342]
		add	bx, dx
		mov	[bx], eax
		mov	bx, si
		imul	bx, bx, 18h
		lea	ax, word ptr [bp+var_162]
		add	bx, ax
		mov	eax, [bx]
		mov	[bp+var_7A], eax
		push	large [bp+var_76]
		push	eax
		call	sub_210EE
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	bx, si
		imul	bx, bx, 18h
		lea	dx, [bp+var_34A]
		add	bx, dx
		mov	[bx], eax
		mov	bx, si
		imul	bx, bx, 18h
		lea	ax, word ptr [bp+var_15E]
		add	bx, ax
		mov	eax, [bx]
		mov	[bp+var_7A], eax
		push	large [bp+var_76]
		push	eax
		call	sub_210EE
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	bx, si
		imul	bx, bx, 18h
		lea	dx, [bp+var_346]
		add	bx, dx
		mov	[bx], eax
		inc	si

loc_2D6CE:
		cmp	si, [bp+var_174]
		jge	short loc_2D6D7
		jmp	loc_2D4B1

loc_2D6D7:
		movsx	eax, [bp+var_174]
		mov	dword_7CBF0, eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	dword_7CBF8, eax
		push	large dword_77558
		push	cs
		call	near ptr sub_2CD83
		add	sp, 4

loc_2D6F8:
		pop	di
		pop	si
		leave
		retf
sub_2CDA0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D6FC		proc far

var_AA		= dword ptr -0AAh
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= word ptr -80h
var_7E		= word ptr -7Eh
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= word ptr -6Ch
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= word ptr -5Ah
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= word ptr -48h
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0A0h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_7CAFE, 0
		jnz	short loc_2D716
		cmp	byte_7CAFF, 0
		jz	short loc_2D72C

loc_2D716:
		cmp	byte_7CAFF, 0
		jnz	short loc_2D720
		jmp	loc_2DB6B

loc_2D720:
		mov	al, byte_7CAFE
		mov	ah, 0
		or	ax, ax
		jz	short loc_2D72C
		jmp	loc_2DB6B

loc_2D72C:
		mov	eax, [si+2Ch]
		mov	[bp+var_94], eax
		mov	eax, [si+30h]
		mov	[bp+var_90], eax
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_8C], eax
		lea	ax, word ptr [bp+var_94]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	eax, [bp+var_90]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_94]
		neg	eax
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_8C]
		mov	[bp+var_98], eax
		mov	eax, dword_797C7
		shl	eax, 2
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	eax, [bp+var_94]
		mov	edx, [bp+var_24]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_94], eax
		mov	eax, [bp+var_90]
		mov	edx, [bp+var_24]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_90], eax
		mov	eax, [bp+var_8C]
		mov	edx, [bp+var_24]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8C], eax
		mov	eax, dword_797C7
		shl	eax, 1
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_A0]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_9C]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_98]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_98], eax
		mov	eax, [bp+var_A0]
		sub	[bp+var_94], eax
		mov	eax, [bp+var_9C]
		sub	[bp+var_90], eax
		mov	eax, [bp+var_98]
		sub	[bp+var_8C], eax
		mov	eax, [bp+var_94]
		add	[bp+var_A0], eax
		mov	eax, [bp+var_90]
		add	[bp+var_9C], eax
		mov	eax, [bp+var_8C]
		add	[bp+var_98], eax
		mov	eax, dword_797CB
		mov	[bp+var_8C], eax
		mov	[bp+var_98], eax
		mov	di, si
		add	di, 1Ch
		mov	eax, [di]
		sub	[bp+var_8C], eax
		mov	ax, si
		add	ax, 20h
		push	ax
		lea	ax, word ptr [bp+var_94]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	di, si
		add	di, 1Ch
		mov	eax, [di]
		sub	[bp+var_98], eax
		mov	ax, si
		add	ax, 20h
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	[bp+var_30], 0E6h
		mov	eax, [si+34h]
		cmp	eax, [bp+var_30]
		jle	short loc_2D8C7
		mov	ax, 1
		jmp	short loc_2D8C9

loc_2D8C7:
		xor	ax, ax

loc_2D8C9:
		or	al, al
		jnz	short loc_2D8EA
		mov	[bp+var_34], 0FFFFFF1Ah
		mov	eax, [si+34h]
		cmp	eax, [bp+var_34]
		jge	short loc_2D8E4
		mov	ax, 1
		jmp	short loc_2D8E6

loc_2D8E4:
		xor	ax, ax

loc_2D8E6:
		or	al, al
		jz	short loc_2D942

loc_2D8EA:
		cmp	dword ptr [si+34h], 0
		jle	short loc_2D8F6
		mov	ax, 1
		jmp	short loc_2D8F8

loc_2D8F6:
		xor	ax, ax

loc_2D8F8:
		or	al, al
		jz	short loc_2D91F
		mov	[bp+var_4], 0FFFFFF9Ch
		mov	[bp+var_8], 12Ch
		mov	[bp+var_C], 190h
		mov	[bp+var_10], 12Ch
		jmp	loc_2DA74

loc_2D91F:
		mov	[bp+var_4], 0FFFFFF9Ch
		mov	[bp+var_8], 0FFFFFF9Ch
		mov	[bp+var_C], 190h
		mov	[bp+var_10], 0FFFFFF9Ch
		jmp	loc_2DA74

loc_2D942:
		mov	ax, [si+8]
		mov	[bp+var_36], ax
		mov	di, si
		add	di, 0Ch
		push	large [bp+var_90]
		push	large [di]
		push	large [bp+var_94]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		movsx	eax, [bp+var_36]
		shl	eax, 8
		mov	edx, [bp+var_3E]
		add	edx, eax
		mov	[bp+var_42], edx
		mov	eax, [bp+var_42]
		mov	[bp+var_46], eax
		sar	eax, 8
		mov	[bp+var_4], eax
		mov	ax, [si+0Ah]
		mov	[bp+var_48], ax
		mov	di, si
		add	di, 10h
		push	large [bp+var_90]
		push	large [di]
		push	large [bp+var_8C]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		movsx	eax, [bp+var_48]
		shl	eax, 8
		sub	eax, [bp+var_50]
		mov	[bp+var_54], eax
		mov	[bp+var_58], eax
		sar	eax, 8
		mov	[bp+var_8], eax
		mov	ax, [si+8]
		mov	[bp+var_5A], ax
		mov	di, si
		add	di, 0Ch
		push	large [bp+var_9C]
		push	large [di]
		push	large [bp+var_A0]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_5E], eax
		mov	[bp+var_62], eax
		movsx	eax, [bp+var_5A]
		shl	eax, 8
		mov	edx, [bp+var_62]
		add	edx, eax
		mov	[bp+var_66], edx
		mov	eax, [bp+var_66]
		mov	[bp+var_6A], eax
		sar	eax, 8
		mov	[bp+var_C], eax
		mov	ax, [si+0Ah]
		mov	[bp+var_6C], ax
		mov	di, si
		add	di, 10h
		push	large [bp+var_9C]
		push	large [di]
		push	large [bp+var_98]
		call	Math_FixedMulDiv_59E20
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_70], eax
		mov	[bp+var_74], eax
		movsx	eax, [bp+var_6C]
		shl	eax, 8
		sub	eax, [bp+var_74]
		mov	[bp+var_78], eax
		mov	[bp+var_7C], eax
		sar	eax, 8
		mov	[bp+var_10], eax

loc_2DA74:
		cmp	[bp+var_4], 1FFFh
		jle	short loc_2DA88
		mov	[bp+var_4], 1FFFh
		jmp	short loc_2DA9A

loc_2DA88:
		cmp	[bp+var_4], 0FFFFE001h
		jge	short loc_2DA9A
		mov	[bp+var_4], 0FFFFE001h

loc_2DA9A:
		cmp	[bp+var_8], 1FFFh
		jle	short loc_2DAAE
		mov	[bp+var_8], 1FFFh
		jmp	short loc_2DAC0

loc_2DAAE:
		cmp	[bp+var_8], 0FFFFE001h
		jge	short loc_2DAC0
		mov	[bp+var_8], 0FFFFE001h

loc_2DAC0:
		cmp	[bp+var_C], 1FFFh
		jle	short loc_2DAD4
		mov	[bp+var_C], 1FFFh
		jmp	short loc_2DAE6

loc_2DAD4:
		cmp	[bp+var_C], 0FFFFE001h
		jge	short loc_2DAE6
		mov	[bp+var_C], 0FFFFE001h

loc_2DAE6:
		cmp	[bp+var_10], 1FFFh
		jle	short loc_2DAFA
		mov	[bp+var_10], 1FFFh
		jmp	short loc_2DB0C

loc_2DAFA:
		cmp	[bp+var_10], 0FFFFE001h
		jge	short loc_2DB0C
		mov	[bp+var_10], 0FFFFE001h

loc_2DB0C:
		mov	ax, word ptr [bp+var_4]
		mov	[si+78h], ax
		mov	ax, word ptr [bp+var_8]
		mov	[si+7Ah], ax
		mov	ax, word ptr [bp+var_C]
		mov	[si+7Ch], ax
		mov	ax, word ptr [bp+var_10]
		mov	[si+7Eh], ax
		mov	al, byte_7CC49
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2DB64
		mov	al, byte_7750C
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2DB64
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 0Fh
		jz	short loc_2DB64
		push	0
		sub	sp, 4
		mov	di, si
		add	di, 1Ch
		mov	eax, [di]
		mov	[bp+var_AA], eax
		push	64DEh
		call	Interp_FractionalCompute
		add	sp, 8
		mov	byte_7750C, 1

loc_2DB64:
		push	si
		nop
		push	cs
		call	near ptr Camera_UpdateViewportClip
		pop	cx

loc_2DB6B:
		mov	bx, word_7AF7C
		mov	bx, [bx+2]
		mov	ax, [bx]
		mov	bx, word_7AF7C
		mov	dx, [bx]
		mov	[bp+var_7E], dx
		mov	[bp+var_80], ax
		push	2
		push	dx
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	dword_7CBEC, eax
		mov	bx, word_7AF7C
		movsx	eax, word ptr [bx+4]
		mov	dword_7CBFC, eax
		movsx	eax, word ptr [bx+8]
		mov	dword_7CC08, eax
		movsx	eax, word ptr [bx+6]
		mov	dword_7CC00, eax
		movsx	eax, word ptr [bx+0Ah]
		mov	dword_7CC04, eax
		cmp	byte_7CAFE, 0
		jz	short loc_2DBD6
		cmp	byte_7CAFF, 0
		jz	short loc_2DBD6
		push	0A6h
		push	bx
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4

loc_2DBD6:
		cmp	byte_7CAFE, 0
		jnz	short loc_2DBE7
		cmp	byte_7CAFF, 0
		jnz	short loc_2DBE7
		jmp	loc_2DCA7

loc_2DBE7:
		cmp	byte_7CAFF, 0
		jz	short loc_2DC34
		mov	[bp+var_84], 0FA000h
		mov	eax, [si+1Ch]
		cmp	eax, [bp+var_84]
		jge	short loc_2DC07
		mov	ax, 1
		jmp	short loc_2DC09

loc_2DC07:
		xor	ax, ax

loc_2DC09:
		or	al, al
		jz	short loc_2DC34
		mov	ax, si
		add	ax, 8
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		mov	ax, si
		add	ax, 0Ch
		push	ax
		mov	ax, si
		add	ax, 14h
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		push	0
		push	cs
		call	near ptr sub_2CDA0
		add	sp, 0Ch

loc_2DC34:
		cmp	byte_7CAFE, 0
		jz	short loc_2DCA7
		mov	al, byte_7CAFF
		mov	ah, 0
		or	ax, ax
		jz	short loc_2DC63
		mov	[bp+var_88], 0FA000h
		mov	eax, [si+1Ch]
		cmp	eax, [bp+var_88]
		jle	short loc_2DC5D
		mov	ax, 1
		jmp	short loc_2DC5F

loc_2DC5D:
		xor	ax, ax

loc_2DC5F:
		or	al, al
		jz	short loc_2DC80

loc_2DC63:
		cmp	byte_7CAFE, 0
		jz	short loc_2DC71
		cmp	byte_7CAFF, 0
		jnz	short loc_2DC80

loc_2DC71:
		push	0A6h
		push	word_7AF7C
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4

loc_2DC80:
		mov	ax, si
		add	ax, 8
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		mov	ax, si
		add	ax, 0Ch
		push	ax
		mov	ax, si
		add	ax, 14h
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		push	1
		push	cs
		call	near ptr sub_2CDA0
		add	sp, 0Ch

loc_2DCA7:
		pop	di
		pop	si
		leave
		retf
sub_2D6FC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_UpdateViewportClip (sub_1EA87 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Camera_UpdateViewportClip (sub_2E6CB de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,36L — compare le
; rectangle de viewport courant (+0x78-0x7E) au précédent, met à jour la zone de clipping si
; changé (sub_58B97) : mise à jour du rectangle de clipping du viewport caméra (cache si
; inchangé).
; ==============================================================================================
Camera_UpdateViewportClip		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+78h]
		cmp	ax, [si+7Ch]
		jnz	short loc_2DCC2
		mov	ax, [si+7Ah]
		cmp	ax, [si+7Eh]
		jz	short loc_2DCDA

loc_2DCC2:
		push	word ptr [si+7Eh]
		push	word ptr [si+7Ch]
		push	word ptr [si+7Ah]
		push	word ptr [si+78h]
		push	word_7AF7C
		call	sub_5A8D2
		add	sp, 0Ah

loc_2DCDA:
		pop	si
		pop	bp
		retf
Camera_UpdateViewportClip		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DCDD		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_77B0E, eax
		mov	word_7CBC6, 0
		mov	[bp+var_8], 0D5h
		mov	eax, [bp+var_8]
		mov	dword_77B12, eax
		mov	[bp+var_C], 1400h
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	ds
		push	offset dword_77B16
		call	sub_566A3
		add	sp, 6
		leave
		retf
sub_2DCDD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DD23		proc far
		push	bp
		mov	bp, sp
		push	6496h
		call	sub_293AE
		pop	cx
		pop	bp
		retf
sub_2DD23		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DD31		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 4
		mov	ax, dx
		add	ax, 8
		mov	ax, dx
		add	ax, 0Ch
		mov	ax, dx
		add	ax, 10h
		mov	ax, dx
		add	ax, 14h
sub_2DD31		endp
seg074		ends
