seg037		segment	para public 'CODE' use16
		assume cs:seg037
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A930		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_1A94F
		cmp	word ptr [di+6], 2
		jz	short loc_1A94F
		push	word_5B6D9
		call	sub_9D78
		pop	cx

loc_1A94F:
		mov	[si+2], di
		pop	di
		pop	si
		pop	bp
		retf
sub_1A930		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A956		proc far

var_70		= word ptr -70h
var_13		= dword ptr -13h
var_F		= dword ptr -0Fh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 70h
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_1A969
		jmp	loc_1AA76

loc_1A969:
		lea	ax, [bp+var_70]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_70], 9B5h
		mov	[bp+var_F], 100h
		mov	[bp+var_13], 0
		mov	[bp+var_70], 0B2Ch
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_70]
		push	ax
		mov	bx, [bp+var_70]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jnz	short loc_1A9A6
		jmp	loc_1AA68

loc_1A9A6:
		lea	ax, [bp+var_70]
		push	ax
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+0Ch], eax
		mov	eax, [si+0Ch]
		mov	[bp+var_4], eax
		mov	ax, word_5B6D3
		mov	[bp+var_6], ax
		push	ax
		push	1
		push	0
		push	2
		push	large [bp+var_4]
		push	67B0h
		call	Memory_TypedFreeWrapperB_44862
		add	sp, 0Eh
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		mov	eax, [bp+var_A]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		cmp	byte ptr [si+14h], 3
		jnz	short loc_1AA1F
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1AA25

loc_1AA1F:
		mov	dx, [si+12h]
		mov	ax, [si+10h]

loc_1AA25:
		push	dx
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		call	sub_51D33
		add	sp, 6
		cmp	byte ptr [si+14h], 3
		jnz	short loc_1AA50
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1AA56

loc_1AA50:
		mov	dx, [si+12h]
		mov	ax, [si+10h]

loc_1AA56:
		mov	[si+0Ah], dx
		mov	[si+8], ax
		mov	ax, [bp+arg_4]
		mov	[si+4], ax
		mov	ax, [bp+arg_6]
		mov	[si+6], ax

loc_1AA68:
		push	0
		lea	ax, [bp+var_70]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4

loc_1AA76:
		pop	si
		leave
		retf
sub_1A956		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1AA79		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1AADF
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		or	al, al
		jz	short loc_1AAA5
		cmp	word ptr [si+2], 0
		jz	short loc_1AAA5
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_9C57
		pop	cx
		jmp	short loc_1AAA5

loc_1AAA5:
		cmp	byte ptr [si+15h], 0
		jz	short loc_1AACB
		cmp	dword ptr [si+10h], 0
		jz	short loc_1AACB
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1AACB

loc_1AACB:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0

loc_1AADF:
		pop	si
		pop	bp
		retf
sub_1AA79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1AAE2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1AB0B
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_1A930
		add	sp, 4
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr sub_1A956
		add	sp, 8

loc_1AB0B:
		pop	si
		pop	bp
		retf
sub_1AAE2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1AB0E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1AB54
		cmp	dword ptr [si+10h], 0
		jz	short loc_1AB27
		mov	ax, 1
		jmp	short loc_1AB29

loc_1AB27:
		xor	ax, ax

loc_1AB29:
		or	ax, ax
		jz	short loc_1AB54
		push	ds
		mov	ax, si
		add	ax, 4
		push	ax
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_9C2D
		add	sp, 8
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_9C51
		add	sp, 4

loc_1AB54:
		pop	si
		pop	bp
		retf
sub_1AB0E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1AB57		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1AB82
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_9C39
		add	sp, 4
		cmp	ax, 3
		jnz	short loc_1AB7E
		mov	ax, 1
		jmp	short loc_1AB80

loc_1AB7E:
		xor	ax, ax

loc_1AB80:
		jmp	short loc_1AB84

loc_1AB82:
		mov	al, 1

loc_1AB84:
		pop	si
		pop	bp
		retf
sub_1AB57		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1AB87		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1ABB2
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_9C39
		add	sp, 4
		cmp	ax, 2
		jnz	short loc_1ABAE
		mov	ax, 1
		jmp	short loc_1ABB0

loc_1ABAE:
		xor	ax, ax

loc_1ABB0:
		jmp	short loc_1ABB4

loc_1ABB2:
		mov	al, 0

loc_1ABB4:
		pop	si
		pop	bp
		retf
sub_1AB87		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1ABB7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1ABE2
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_9C39
		add	sp, 4
		cmp	ax, 1
		jnz	short loc_1ABDE
		mov	ax, 1
		jmp	short loc_1ABE0

loc_1ABDE:
		xor	ax, ax

loc_1ABE0:
		jmp	short loc_1ABE4

loc_1ABE2:
		mov	al, 1

loc_1ABE4:
		pop	si
		pop	bp
		retf
sub_1ABB7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1ABE7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1AC11
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_9C39
		add	sp, 4
		or	ax, ax
		jnz	short loc_1AC0D
		mov	ax, 1
		jmp	short loc_1AC0F

loc_1AC0D:
		xor	ax, ax

loc_1AC0F:
		jmp	short loc_1AC13

loc_1AC11:
		mov	al, 1

loc_1AC13:
		pop	si
		pop	bp
		retf
sub_1ABE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1AC16		proc far

var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+10h], eax
		mov	al, [bp+var_5]
		mov	[si+14h], al
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	eax, [di+6]
		mov	[si+16h], eax
		pop	di
		pop	si
		leave
		retf
sub_1AC16		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1AC57		proc far

var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
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
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 46h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [bp+arg_4]
		mov	[si+1Ah], ax
		cmp	word ptr [si+2], 0
		jnz	short loc_1AC74
		jmp	loc_1B0F0

loc_1AC74:
		mov	dx, di
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_44], eax
		mov	al, [bx+4]
		mov	[bp+var_45], al
		mov	eax, [bp+var_44]
		mov	[si+10h], eax
		mov	al, [bp+var_45]
		mov	[si+14h], al
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	eax, [bx+6]
		mov	[si+16h], eax
		cmp	byte ptr [di+4], 3
		jnz	short loc_1ACC3
		push	0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1ACC8

loc_1ACC3:
		mov	dx, [di+2]
		mov	ax, [di]

loc_1ACC8:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	al, es:[bx+1Eh]
		mov	ah, 0
		mov	dx, 100h
		sub	dx, ax
		movsx	ebx, dx
		mov	eax, 0F4240h
		cdq
		idiv	ebx
		mov	[bp+var_14], eax
		movsx	ebx, word ptr [si+1Ah]
		cdq
		idiv	ebx
		mov	[bp+var_10], eax
		xor	di, di
		mov	[bp+var_1C], 0
		jmp	short loc_1AD1B

loc_1AD09:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0FFFFFFFEh
		inc	[bp+var_1C]

loc_1AD1B:
		cmp	[bp+var_1C], 200h
		jl	short loc_1AD09
		les	bx, [bp+var_4]
		mov	eax, es:[bx+1Ah]
		sar	eax, 8
		add	eax, 0FFFFFFFEh
		mov	[bp+var_C], eax
		cdq
		idiv	[bp+var_10]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_10]
		imul	eax, [bp+var_2C]
		mov	edx, [bp+var_C]
		sub	edx, eax
		mov	[bp+var_30], edx
		mov	[bp+var_34], 0
		jmp	loc_1AEFD

loc_1AD62:
		mov	[bp+var_24], 0F423Fh
		mov	[bp+var_28], 0
		mov	[bp+var_20], 0
		mov	[bp+var_8], 0
		mov	eax, [bp+var_34]
		imul	eax, [bp+var_14]
		movsx	ebx, word ptr [si+1Ah]
		cdq
		idiv	ebx
		add	eax, 20h
		mov	[bp+var_38], eax
		mov	eax, [bp+var_34]
		cmp	eax, [bp+var_2C]
		jl	short loc_1ADAA
		jmp	loc_1AE52

loc_1ADAA:
		mov	eax, [bp+var_38]
		mov	[bp+var_1C], eax
		jmp	short loc_1AE01

loc_1ADB4:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_28]
		jle	short loc_1ADCF
		mov	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		mov	[bp+var_28], eax

loc_1ADCF:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_24]
		jge	short loc_1ADEA
		mov	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		mov	[bp+var_24], eax

loc_1ADEA:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		add	[bp+var_8], eax
		inc	[bp+var_20]
		inc	[bp+var_1C]

loc_1AE01:
		mov	eax, [bp+var_38]
		add	eax, [bp+var_10]
		cmp	eax, [bp+var_1C]
		jge	short loc_1ADB4
		cmp	[bp+var_20], 0
		jz	short loc_1AE39
		mov	eax, [bp+var_8]
		imul	eax, eax, 3E8h
		xor	edx, edx
		div	[bp+var_20]
		sub	eax, 1F400h
		mov	bx, di
		shl	bx, 2
		mov	[bx+si+1Ch], eax
		jmp	short loc_1AE46

loc_1AE39:
		mov	bx, di
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0

loc_1AE46:
		cmp	di, 200h
		jl	short loc_1AE4F
		jmp	loc_1AEF9

loc_1AE4F:
		jmp	loc_1AEF8

loc_1AE52:
		cmp	[bp+var_30], 0
		jg	short loc_1AE5C
		jmp	loc_1AEF9

loc_1AE5C:
		mov	eax, [bp+var_38]
		mov	[bp+var_1C], eax
		jmp	short loc_1AEB3

loc_1AE66:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_28]
		jle	short loc_1AE81
		mov	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		mov	[bp+var_28], eax

loc_1AE81:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		cmp	eax, [bp+var_24]
		jge	short loc_1AE9C
		mov	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		mov	[bp+var_24], eax

loc_1AE9C:
		les	bx, [bp+var_4]
		add	bx, word ptr [bp+var_1C]
		movzx	eax, byte ptr es:[bx]
		add	[bp+var_8], eax
		inc	[bp+var_20]
		inc	[bp+var_1C]

loc_1AEB3:
		mov	eax, [bp+var_C]
		add	eax, 20h
		cmp	eax, [bp+var_1C]
		jg	short loc_1AE66
		cmp	[bp+var_20], 0
		jz	short loc_1AEEB
		mov	eax, [bp+var_8]
		imul	eax, eax, 3E8h
		xor	edx, edx
		div	[bp+var_20]
		sub	eax, 1F400h
		mov	bx, di
		shl	bx, 2
		mov	[bx+si+1Ch], eax
		jmp	short loc_1AEF8

loc_1AEEB:
		mov	bx, di
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0

loc_1AEF8:
		inc	di

loc_1AEF9:
		inc	[bp+var_34]

loc_1AEFD:
		mov	eax, [bp+var_34]
		cmp	eax, [bp+var_2C]
		jg	short loc_1AF0A
		jmp	loc_1AD62

loc_1AF0A:
		mov	[bp+var_24], 270Fh
		mov	[bp+var_28], 0FFFFD8F1h
		mov	[bp+var_1C], 0
		jmp	short loc_1AF68

loc_1AF24:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_28]
		jle	short loc_1AF44
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	[bp+var_28], eax
		mov	ax, word ptr [bp+var_1C]
		mov	[bp+var_3C], ax

loc_1AF44:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_24]
		jge	short loc_1AF64
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	[bp+var_24], eax
		mov	ax, word ptr [bp+var_1C]
		mov	[bp+var_3A], ax

loc_1AF64:
		inc	[bp+var_1C]

loc_1AF68:
		movsx	eax, di
		cmp	eax, [bp+var_1C]
		jg	short loc_1AF24
		mov	[bp+var_24], 270Fh
		mov	[bp+var_28], 0FFFFD8F1h
		mov	[bp+var_1C], 0
		jmp	short loc_1AFDA

loc_1AF8C:
		movsx	eax, [bp+var_3A]
		cmp	eax, [bp+var_1C]
		jz	short loc_1AFD6
		movsx	eax, [bp+var_3C]
		cmp	eax, [bp+var_1C]
		jz	short loc_1AFD6
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_28]
		jle	short loc_1AFBC
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	[bp+var_28], eax

loc_1AFBC:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	eax, [bx+si+1Ch]
		cmp	eax, [bp+var_24]
		jge	short loc_1AFD6
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	[bp+var_24], eax

loc_1AFD6:
		inc	[bp+var_1C]

loc_1AFDA:
		movsx	eax, di
		cmp	eax, [bp+var_1C]
		jg	short loc_1AF8C
		push	large [bp+var_28]
		call	CRT_NormalizeSign32
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		push	eax
		push	large [bp+var_24]
		call	CRT_NormalizeSign32
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		pop	edx
		cmp	edx, eax
		jle	short loc_1B013
		push	large [bp+var_28]
		jmp	short loc_1B017

loc_1B013:
		push	large [bp+var_24]

loc_1B017:
		call	CRT_NormalizeSign32
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_40], eax
		mov	[bp+var_1C], 0
		jmp	loc_1B0E3

loc_1B032:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		push	word ptr [bx+si+1Ch]
		call	CRT_Abs16_300
		pop	cx
		movsx	eax, ax
		push	eax
		mov	eax, [bp+var_40]
		pop	edx
		sub	eax, edx
		imul	eax, eax, 64h
		cdq
		idiv	[bp+var_40]
		mov	[bp+var_18], eax
		cmp	[bp+var_18], 5Fh
		jl	short loc_1B075
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0FFFFFFFFh
		jmp	short loc_1B0DF

loc_1B075:
		cmp	[bp+var_18], 4Eh
		jl	short loc_1B08C
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 8
		jmp	short loc_1B0DF

loc_1B08C:
		cmp	[bp+var_18], 41h
		jl	short loc_1B0A3
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 3
		jmp	short loc_1B0DF

loc_1B0A3:
		cmp	[bp+var_18], 2Ah
		jl	short loc_1B0BA
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 2
		jmp	short loc_1B0DF

loc_1B0BA:
		cmp	[bp+var_18], 19h
		jl	short loc_1B0D1
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0Ah
		jmp	short loc_1B0DF

loc_1B0D1:
		mov	bx, word ptr [bp+var_1C]
		shl	bx, 2
		mov	dword ptr [bx+si+1Ch], 0Bh

loc_1B0DF:
		inc	[bp+var_1C]

loc_1B0E3:
		movsx	eax, di
		cmp	eax, [bp+var_1C]
		jle	short loc_1B0F0
		jmp	loc_1B032

loc_1B0F0:
		pop	di
		pop	si
		leave
		retf
sub_1AC57		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B0F4		proc far

var_70		= word ptr -70h
var_13		= dword ptr -13h
var_F		= dword ptr -0Fh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 70h
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_1B107
		jmp	loc_1B1D7

loc_1B107:
		lea	ax, [bp+var_70]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_70], 9B5h
		mov	[bp+var_F], 100h
		mov	[bp+var_13], 0
		mov	[bp+var_70], 0B2Ch
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_70]
		push	ax
		mov	bx, [bp+var_70]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jnz	short loc_1B144
		jmp	loc_1B1C9

loc_1B144:
		lea	ax, [bp+var_70]
		push	ax
		call	StreamReader_GetCapacity_52ABA
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		mov	ax, word_5B6D3
		mov	[bp+var_6], ax
		push	ax
		push	1
		push	0
		push	2
		push	large [bp+var_4]
		push	67B0h
		call	Memory_TypedFreeWrapperB_44862
		add	sp, 0Eh
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		mov	eax, [bp+var_A]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		cmp	byte ptr [si+14h], 3
		jnz	short loc_1B1B5
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1B1BB

loc_1B1B5:
		mov	dx, [si+12h]
		mov	ax, [si+10h]

loc_1B1BB:
		push	dx
		push	ax
		lea	ax, [bp+var_70]
		push	ax
		call	sub_51D33
		add	sp, 6

loc_1B1C9:
		push	0
		lea	ax, [bp+var_70]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4

loc_1B1D7:
		pop	si
		leave
		retf
sub_1B0F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B1DA		proc far

var_80		= word ptr -80h
var_1F		= dword ptr -1Fh
var_13		= word ptr -13h
var_F		= dword ptr -0Fh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		cmp	word ptr [si+2], 0
		jnz	short loc_1B1F2
		jmp	loc_1B2AD

loc_1B1F2:
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_80]
		push	ax
		mov	bx, [bp+var_80]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	di
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	ax, [bp+var_13]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_1B22C
		mov	eax, [bp+var_1F]
		jmp	short loc_1B230

loc_1B22C:
		mov	eax, [bp+var_F]

loc_1B230:
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		cmp	byte ptr [si+14h], 3
		jnz	short loc_1B28A
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1B290

loc_1B28A:
		mov	dx, [si+12h]
		mov	ax, [si+10h]

loc_1B290:
		push	dx
		push	ax
		push	di
		lea	ax, [bp+var_80]
		push	ax
		call	sub_54A85
		add	sp, 8
		push	2
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4

loc_1B2AD:
		pop	di
		pop	si
		leave
		retf
sub_1B1DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B2B1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1B324
		cmp	dword ptr [si+10h], 0
		jz	short loc_1B2CA
		mov	ax, 1
		jmp	short loc_1B2CC

loc_1B2CA:
		xor	ax, ax

loc_1B2CC:
		or	ax, ax
		jz	short loc_1B324
		push	[bp+arg_2]
		cmp	byte ptr [si+14h], 3
		jnz	short loc_1B2F0
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1B2F6

loc_1B2F0:
		mov	dx, [si+12h]
		mov	ax, [si+10h]

loc_1B2F6:
		push	dx
		push	ax
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_9C3F
		add	sp, 8
		push	0
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_9C51
		add	sp, 4
		mov	eax, dword_5E7D3
		mov	[si+81Dh], eax
		mov	byte ptr [si+81Ch], 1

loc_1B324:
		pop	si
		pop	bp
		retf
sub_1B2B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B327		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	dx, 0FFFFh
		cmp	word ptr [si+2], 0
		jz	short loc_1B37B
		mov	ax, si
		add	ax, 81Ch
		push	ax
		call	Stopwatch_Elapsed_56336
		push	dx
		push	ax
		pop	eax
		pop	cx
		movsx	edx, word ptr [si+1Ah]
		imul	eax, edx
		mov	ebx, 3Ch
		xor	edx, edx
		div	ebx
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 200h
		jge	short loc_1B378
		mov	bx, word ptr [bp+var_4]
		shl	bx, 2
		mov	dx, [bx+si+1Ch]
		jmp	short loc_1B37B

loc_1B378:
		mov	dx, 0FFFEh

loc_1B37B:
		mov	ax, dx
		pop	si
		leave
		retf
sub_1B327		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B380		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1B3A7
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_9C4B
		pop	cx
		cmp	ax, 3
		jnz	short loc_1B3A3
		mov	ax, 1
		jmp	short loc_1B3A5

loc_1B3A3:
		xor	ax, ax

loc_1B3A5:
		jmp	short loc_1B3A9

loc_1B3A7:
		mov	al, 1

loc_1B3A9:
		pop	si
		pop	bp
		retf
sub_1B380		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B3AC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1B3D3
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_9C4B
		pop	cx
		cmp	ax, 2
		jnz	short loc_1B3CF
		mov	ax, 1
		jmp	short loc_1B3D1

loc_1B3CF:
		xor	ax, ax

loc_1B3D1:
		jmp	short loc_1B3D5

loc_1B3D3:
		mov	al, 0

loc_1B3D5:
		pop	si
		pop	bp
		retf
sub_1B3AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B3D8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1B3FF
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_9C4B
		pop	cx
		cmp	ax, 1
		jnz	short loc_1B3FB
		mov	ax, 1
		jmp	short loc_1B3FD

loc_1B3FB:
		xor	ax, ax

loc_1B3FD:
		jmp	short loc_1B401

loc_1B3FF:
		mov	al, 1

loc_1B401:
		pop	si
		pop	bp
		retf
sub_1B3D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B404		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_1B42A
		mov	bx, [si+2]
		push	word ptr [bx+4]
		call	sub_9C4B
		pop	cx
		or	ax, ax
sub_1B404		endp

; START OF FUNCTION CHUNK FOR sub_1B404
		db 75h
; END OF FUNCTION CHUNK FOR sub_1B404
seg037		ends
