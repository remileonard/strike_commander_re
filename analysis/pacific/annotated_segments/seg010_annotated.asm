seg010		segment	para public 'CODE' use16
		assume cs:seg010
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65C2		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [di]
		sub	eax, [si]
		push	eax
		mov	eax, [bp+arg_0]
		sub	eax, [si]
		push	eax
		call	sub_63D4
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_8]
		mov	eax, [bp+arg_0]
		mov	[bx], eax
		push	large [bp+var_4]
		mov	eax, [di+4]
		sub	eax, [si+4]
		push	eax
		call	sub_6394
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [si+4]
		add	edx, eax
		mov	bx, [bp+arg_8]
		mov	[bx+4], edx
		push	large [bp+var_4]
		mov	eax, [di+8]
		sub	eax, [si+8]
		push	eax
		call	sub_6394
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [si+8]
		add	edx, eax
		mov	bx, [bp+arg_8]
		mov	[bx+8], edx
		push	large [bp+var_4]
		mov	eax, [di+0Ch]
		sub	eax, [si+0Ch]
		push	eax
		call	sub_6394
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [si+0Ch]
		add	edx, eax
		mov	bx, [bp+arg_8]
		mov	[bx+0Ch], edx
		push	large [bp+var_4]
		mov	eax, [di+10h]
		sub	eax, [si+10h]
		push	eax
		call	sub_6394
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [si+10h]
		add	edx, eax
		mov	bx, [bp+arg_8]
		mov	[bx+10h], edx
		pop	di
		pop	si
		leave
		retf
sub_65C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_669F		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [di+4]
		sub	eax, [si+4]
		push	eax
		mov	eax, [bp+arg_0]
		sub	eax, [si+4]
		push	eax
		call	sub_63D4
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_8]
		mov	eax, [bp+arg_0]
		mov	[bx+4], eax
		push	large [bp+var_4]
		mov	eax, [di]
		sub	eax, [si]
		push	eax
		call	sub_6394
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [si]
		add	edx, eax
		mov	bx, [bp+arg_8]
		mov	[bx], edx
		push	large [bp+var_4]
		mov	eax, [di+8]
		sub	eax, [si+8]
		push	eax
		call	sub_6394
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [si+8]
		add	edx, eax
		mov	bx, [bp+arg_8]
		mov	[bx+8], edx
		push	large [bp+var_4]
		mov	eax, [di+0Ch]
		sub	eax, [si+0Ch]
		push	eax
		call	sub_6394
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [si+0Ch]
		add	edx, eax
		mov	bx, [bp+arg_8]
		mov	[bx+0Ch], edx
		push	large [bp+var_4]
		mov	eax, [di+10h]
		sub	eax, [si+10h]
		push	eax
		call	sub_6394
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [si+10h]
		add	edx, eax
		mov	bx, [bp+arg_8]
		mov	[bx+10h], edx
		pop	di
		pop	si
		leave
		retf
sub_669F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_677C		proc far

var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 46h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_8]
		mov	bx, [bp+arg_6]
		mov	eax, [bx+1Ch]
		sub	eax, [di+1Ch]
		push	eax
		mov	eax, [bp+arg_0]
		sub	eax, [di+1Ch]
		push	eax
		call	sub_63D4
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax
		push	eax
		mov	bx, [bp+arg_6]
		mov	eax, [bx+18h]
		sub	eax, [di+18h]
		push	eax
		call	sub_6394
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [di+18h]
		add	edx, eax
		mov	[bp+var_46], edx
		mov	eax, edx
		mov	[si+18h], eax
		mov	eax, [bp+arg_0]
		mov	[bp+var_42], eax
		mov	[si+1Ch], eax
		push	large [bp+var_4]
		mov	bx, [bp+arg_6]
		mov	eax, [bx+20h]
		sub	eax, [di+20h]
		push	eax
		call	sub_6394
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [di+20h]
		add	edx, eax
		mov	[bp+var_3E], edx
		mov	eax, edx
		mov	[si+20h], eax
		mov	eax, [bp+var_46]
		sar	eax, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_42]
		sar	eax, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_3E]
		sar	eax, 8
		mov	[bp+var_3E], eax
		mov	ax, word_7CA0C
		mov	[bp+var_E], ax
		mov	ax, word_7CA0E
		mov	[bp+var_10], ax
		mov	eax, [bp+var_42]
		mov	[bp+var_8], eax
		mov	eax, dword_7CA10
		mov	[bp+var_C], eax
		mov	eax, [bp+var_46]
		mov	ebx, [bp+var_C]
		mov	ecx, [bp+var_8]
		imul	ebx
		idiv	ecx
		sar	eax, 8
		sub	ebx, ebx
		mov	bx, [bp+var_E]
		add	eax, ebx
		mov	bx, 7D00h
		cmp	eax, ebx
		jle	short loc_6883
		mov	eax, ebx

loc_6883:
		neg	ebx
		cmp	eax, ebx
		jge	short loc_688E
		mov	eax, ebx

loc_688E:
		mov	[si], eax
		mov	eax, [si]
		shl	eax, 10h
		mov	[si], eax
		mov	eax, dword_7CA14
		mov	[bp+var_C], eax
		mov	eax, [bp+var_3E]
		mov	ebx, [bp+var_C]
		mov	ecx, [bp+var_8]
		imul	ebx
		idiv	ecx
		sar	eax, 8
		sub	ebx, ebx
		sub	ecx, ecx
		mov	cx, [bp+var_10]
		sub	ecx, eax
		mov	eax, ecx
		mov	bx, 7D00h
		cmp	eax, ebx
		jle	short loc_68D3
		mov	eax, ebx

loc_68D3:
		neg	ebx
		cmp	eax, ebx
		jge	short loc_68DE
		mov	eax, ebx

loc_68DE:
		mov	[si+4], eax
		mov	eax, [si+4]
		shl	eax, 10h
		mov	[si+4], eax
		push	large [bp+var_4]
		mov	bx, [bp+arg_6]
		mov	eax, [bx+0Ch]
		sub	eax, [di+0Ch]
		push	eax
		call	sub_6394
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [di+0Ch]
		add	edx, eax
		mov	[si+0Ch], edx
		push	large [bp+var_4]
		mov	bx, [bp+arg_6]
		mov	eax, [bx+8]
		sub	eax, [di+8]
		push	eax
		call	sub_6394
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [di+8]
		add	edx, eax
		mov	[si+8], edx
		push	large [bp+var_4]
		mov	bx, [bp+arg_6]
		mov	eax, [bx+10h]
		sub	eax, [di+10h]
		push	eax
		call	sub_6394
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [di+10h]
		add	edx, eax
		mov	[si+10h], edx
		mov	dword ptr [si+14h], 40000000h
		pop	di
		pop	si
		leave
		retf
sub_677C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6972		proc far

var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		push	di
		mov	[bp+var_22], 0
		mov	[bp+var_16], 6074h
		mov	[bp+var_14], 6062h
		mov	[bp+var_28], 0
		jmp	short loc_69A5

loc_6990:
		mov	ax, [bp+var_28]
		imul	ax, ax, 24h
		add	ax, 5D02h
		mov	bx, [bp+var_28]
		shl	bx, 1
		mov	[bx+6062h], ax
		inc	[bp+var_28]

loc_69A5:
		mov	ax, [bp+var_28]
		cmp	ax, [bp+arg_0]
		jl	short loc_6990
		mov	ax, [bp+arg_0]
		imul	ax, ax, 24h
		add	ax, 5D02h
		mov	[bp+var_20], ax
		mov	[bp+var_24], 0
		cmp	[bp+var_22], 0
		jnz	short loc_69E5
		mov	ax, [bp+var_14]
		mov	[bp+var_1E], ax
		mov	[bp+var_1A], ax
		mov	ax, [bp+arg_0]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_14]
		add	dx, ax
		mov	[bp+var_1C], dx
		mov	ax, dx
		mov	[bp+var_18], ax
		mov	ax, [bp+var_16]
		jmp	short loc_6A04

loc_69E5:
		mov	ax, [bp+var_16]
		mov	[bp+var_1E], ax
		mov	[bp+var_1A], ax
		mov	ax, [bp+arg_0]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_16]
		add	dx, ax
		mov	[bp+var_1C], dx
		mov	ax, dx
		mov	[bp+var_18], ax
		mov	ax, [bp+var_14]

loc_6A04:
		mov	[bp+var_2], ax
		xor	ax, ax
		mov	[bp+var_C], ax
		mov	[bp+var_26], ax
		mov	[bp+var_6], 0
		jmp	loc_6B12

loc_6A1A:
		mov	bx, [bp+var_1C]
		mov	ax, [bx]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_1E]
		mov	ax, [bx]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx+1Ch]
		cmp	eax, dword_76A48
		jl	short loc_6A52
		cmp	[bp+var_24], 0
		jz	short loc_6A4F
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_E]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_C]
		jmp	short loc_6A52

loc_6A4F:
		inc	[bp+var_26]

loc_6A52:
		mov	bx, [bp+var_E]
		mov	eax, [bx+1Ch]
		cmp	eax, dword_76A48
		jge	short loc_6A6E
		mov	bx, [bp+var_10]
		mov	eax, [bx+1Ch]
		cmp	eax, dword_76A48
		jge	short loc_6A8D

loc_6A6E:
		mov	bx, [bp+var_E]
		mov	eax, [bx+1Ch]
		cmp	eax, dword_76A48
		jge	short loc_6A7F
		jmp	loc_6B04

loc_6A7F:
		mov	bx, [bp+var_10]
		mov	eax, [bx+1Ch]
		cmp	eax, dword_76A48
		jge	short loc_6B04

loc_6A8D:
		cmp	[bp+var_24], 0
		jnz	short loc_6ADC
		mov	[bp+var_2A], 0
		jmp	short loc_6ACC

loc_6A9A:
		mov	bx, [bp+var_18]
		mov	ax, [bx]
		mov	[bp+var_12], ax
		mov	bx, [bp+var_12]
		mov	eax, [bx+1Ch]
		cmp	eax, dword_76A48
		jl	short loc_6ABF
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_12]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_C]

loc_6ABF:
		mov	ax, [bp+var_1A]
		mov	[bp+var_18], ax
		inc	[bp+var_2A]
		add	[bp+var_1A], 2

loc_6ACC:
		movsx	eax, [bp+var_2A]
		cmp	eax, [bp+var_6]
		jbe	short loc_6A9A
		mov	[bp+var_24], 1

loc_6ADC:
		push	[bp+var_20]
		push	[bp+var_E]
		push	[bp+var_10]
		push	large dword_76A48
		push	cs
		call	near ptr sub_677C
		add	sp, 0Ah
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_20]
		mov	[bx], ax
		add	[bp+var_20], 24h
		add	[bp+var_2], 2
		inc	[bp+var_C]

loc_6B04:
		mov	ax, [bp+var_1E]
		mov	[bp+var_1C], ax
		inc	[bp+var_6]
		add	[bp+var_1E], 2

loc_6B12:
		movsx	eax, [bp+arg_0]
		cmp	eax, [bp+var_6]
		jbe	short loc_6B20
		jmp	loc_6A1A

loc_6B20:
		cmp	[bp+var_24], 0
		jz	short loc_6B31
		xor	[bp+var_22], 1
		mov	[bp+var_24], 0
		jmp	short loc_6B37

loc_6B31:
		mov	ax, [bp+var_26]
		mov	[bp+var_C], ax

loc_6B37:
		cmp	[bp+var_C], 3
		jnb	short loc_6B44

loc_6B3D:
		xor	dx, dx
		xor	ax, ax
		jmp	loc_7366

loc_6B44:
		cmp	[bp+var_22], 0
		jnz	short loc_6B6B
		mov	ax, [bp+var_14]
		mov	[bp+var_1E], ax
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_C]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_14]
		add	dx, ax
		mov	[bp+var_1C], dx
		mov	ax, dx
		mov	[bp+var_18], ax
		mov	ax, [bp+var_16]
		jmp	short loc_6B8A

loc_6B6B:
		mov	ax, [bp+var_16]
		mov	[bp+var_1E], ax
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_C]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_16]
		add	dx, ax
		mov	[bp+var_1C], dx
		mov	ax, dx
		mov	[bp+var_18], ax
		mov	ax, [bp+var_14]

loc_6B8A:
		mov	[bp+var_2], ax
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_26], ax
		mov	[bp+var_6], 0
		jmp	loc_6C97

loc_6BA2:
		mov	bx, [bp+var_1C]
		mov	ax, [bx]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_1E]
		mov	ax, [bx]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		cmp	eax, dword_76A58
		jg	short loc_6BDA
		cmp	[bp+var_24], 0
		jz	short loc_6BD7
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_E]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]
		jmp	short loc_6BDA

loc_6BD7:
		inc	[bp+var_26]

loc_6BDA:
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		cmp	eax, dword_76A58
		jg	short loc_6BF4
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		cmp	eax, dword_76A58
		jg	short loc_6C11

loc_6BF4:
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		cmp	eax, dword_76A58
		jg	short loc_6C04
		jmp	loc_6C89

loc_6C04:
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		cmp	eax, dword_76A58
		jg	short loc_6C89

loc_6C11:
		cmp	[bp+var_24], 0
		jnz	short loc_6C60
		mov	[bp+var_2A], 0
		jmp	short loc_6C50

loc_6C1E:
		mov	bx, [bp+var_18]
		mov	ax, [bx]
		mov	[bp+var_12], ax
		mov	bx, [bp+var_12]
		mov	eax, [bx]
		cmp	eax, dword_76A58
		jg	short loc_6C43
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_12]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_6C43:
		mov	ax, [bp+var_1A]
		mov	[bp+var_18], ax
		inc	[bp+var_2A]
		add	[bp+var_1A], 2

loc_6C50:
		movsx	eax, [bp+var_2A]
		cmp	eax, [bp+var_6]
		jbe	short loc_6C1E
		mov	[bp+var_24], 1

loc_6C60:
		push	[bp+var_20]
		push	[bp+var_E]
		push	[bp+var_10]
		push	large dword_76A58
		push	cs
		call	near ptr sub_65C2
		add	sp, 0Ah
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_20]
		mov	[bx], ax
		add	[bp+var_20], 24h
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_6C89:
		mov	ax, [bp+var_1E]
		mov	[bp+var_1C], ax
		inc	[bp+var_6]
		add	[bp+var_1E], 2

loc_6C97:
		movzx	eax, [bp+var_C]
		cmp	eax, [bp+var_6]
		jbe	short loc_6CA5
		jmp	loc_6BA2

loc_6CA5:
		cmp	[bp+var_24], 0
		jz	short loc_6CB6
		xor	[bp+var_22], 1
		mov	[bp+var_24], 0
		jmp	short loc_6CBF

loc_6CB6:
		movsx	eax, [bp+var_26]
		mov	[bp+var_A], eax

loc_6CBF:
		cmp	[bp+var_A], 3
		jnb	short loc_6CC9
		jmp	loc_6B3D

loc_6CC9:
		mov	ax, word ptr [bp+var_A]
		mov	[bp+var_C], ax
		cmp	[bp+var_22], 0
		jnz	short loc_6CF6
		mov	ax, [bp+var_14]
		mov	[bp+var_1E], ax
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_C]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_14]
		add	dx, ax
		mov	[bp+var_1C], dx
		mov	ax, dx
		mov	[bp+var_18], ax
		mov	ax, [bp+var_16]
		jmp	short loc_6D15

loc_6CF6:
		mov	ax, [bp+var_16]
		mov	[bp+var_1E], ax
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_C]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_16]
		add	dx, ax
		mov	[bp+var_1C], dx
		mov	ax, dx
		mov	[bp+var_18], ax
		mov	ax, [bp+var_14]

loc_6D15:
		mov	[bp+var_2], ax
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_26], ax
		mov	[bp+var_6], 0
		jmp	loc_6E28

loc_6D2D:
		mov	bx, [bp+var_1C]
		mov	ax, [bx]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_1E]
		mov	ax, [bx]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx+4]
		cmp	eax, dword_76A4C
		jl	short loc_6D66
		cmp	[bp+var_24], 0
		jz	short loc_6D63
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_E]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]
		jmp	short loc_6D66

loc_6D63:
		inc	[bp+var_26]

loc_6D66:
		mov	bx, [bp+var_E]
		mov	eax, [bx+4]
		cmp	eax, dword_76A4C
		jge	short loc_6D82
		mov	bx, [bp+var_10]
		mov	eax, [bx+4]
		cmp	eax, dword_76A4C
		jge	short loc_6DA1

loc_6D82:
		mov	bx, [bp+var_E]
		mov	eax, [bx+4]
		cmp	eax, dword_76A4C
		jge	short loc_6D93
		jmp	loc_6E1A

loc_6D93:
		mov	bx, [bp+var_10]
		mov	eax, [bx+4]
		cmp	eax, dword_76A4C
		jge	short loc_6E1A

loc_6DA1:
		cmp	[bp+var_24], 0
		jnz	short loc_6DF1
		mov	[bp+var_2A], 0
		jmp	short loc_6DE1

loc_6DAE:
		mov	bx, [bp+var_18]
		mov	ax, [bx]
		mov	[bp+var_12], ax
		mov	bx, [bp+var_12]
		mov	eax, [bx+4]
		cmp	eax, dword_76A4C
		jl	short loc_6DD4
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_12]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_6DD4:
		mov	ax, [bp+var_1A]
		mov	[bp+var_18], ax
		inc	[bp+var_2A]
		add	[bp+var_1A], 2

loc_6DE1:
		movsx	eax, [bp+var_2A]
		cmp	eax, [bp+var_6]
		jbe	short loc_6DAE
		mov	[bp+var_24], 1

loc_6DF1:
		push	[bp+var_20]
		push	[bp+var_E]
		push	[bp+var_10]
		push	large dword_76A4C
		push	cs
		call	near ptr sub_669F
		add	sp, 0Ah
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_20]
		mov	[bx], ax
		add	[bp+var_20], 24h
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_6E1A:
		mov	ax, [bp+var_1E]
		mov	[bp+var_1C], ax
		inc	[bp+var_6]
		add	[bp+var_1E], 2

loc_6E28:
		movzx	eax, [bp+var_C]
		cmp	eax, [bp+var_6]
		jbe	short loc_6E36
		jmp	loc_6D2D

loc_6E36:
		cmp	[bp+var_24], 0
		jz	short loc_6E47
		xor	[bp+var_22], 1
		mov	[bp+var_24], 0
		jmp	short loc_6E50

loc_6E47:
		movsx	eax, [bp+var_26]
		mov	[bp+var_A], eax

loc_6E50:
		cmp	[bp+var_A], 3
		jnb	short loc_6E5A
		jmp	loc_6B3D

loc_6E5A:
		mov	ax, word ptr [bp+var_A]
		mov	[bp+var_C], ax
		cmp	[bp+var_22], 0
		jnz	short loc_6E87
		mov	ax, [bp+var_14]
		mov	[bp+var_1E], ax
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_C]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_14]
		add	dx, ax
		mov	[bp+var_1C], dx
		mov	ax, dx
		mov	[bp+var_18], ax
		mov	ax, [bp+var_16]
		jmp	short loc_6EA6

loc_6E87:
		mov	ax, [bp+var_16]
		mov	[bp+var_1E], ax
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_C]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_16]
		add	dx, ax
		mov	[bp+var_1C], dx
		mov	ax, dx
		mov	[bp+var_18], ax
		mov	ax, [bp+var_14]

loc_6EA6:
		mov	[bp+var_2], ax
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_26], ax
		mov	[bp+var_6], 0
		jmp	loc_6FB3

loc_6EBE:
		mov	bx, [bp+var_1C]
		mov	ax, [bx]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_1E]
		mov	ax, [bx]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		cmp	eax, dword_76A54
		jl	short loc_6EF6
		cmp	[bp+var_24], 0
		jz	short loc_6EF3
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_E]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]
		jmp	short loc_6EF6

loc_6EF3:
		inc	[bp+var_26]

loc_6EF6:
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		cmp	eax, dword_76A54
		jge	short loc_6F10
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		cmp	eax, dword_76A54
		jge	short loc_6F2D

loc_6F10:
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		cmp	eax, dword_76A54
		jge	short loc_6F20
		jmp	loc_6FA5

loc_6F20:
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		cmp	eax, dword_76A54
		jge	short loc_6FA5

loc_6F2D:
		cmp	[bp+var_24], 0
		jnz	short loc_6F7C
		mov	[bp+var_2A], 0
		jmp	short loc_6F6C

loc_6F3A:
		mov	bx, [bp+var_18]
		mov	ax, [bx]
		mov	[bp+var_12], ax
		mov	bx, [bp+var_12]
		mov	eax, [bx]
		cmp	eax, dword_76A54
		jl	short loc_6F5F
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_12]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_6F5F:
		mov	ax, [bp+var_1A]
		mov	[bp+var_18], ax
		inc	[bp+var_2A]
		add	[bp+var_1A], 2

loc_6F6C:
		movsx	eax, [bp+var_2A]
		cmp	eax, [bp+var_6]
		jbe	short loc_6F3A
		mov	[bp+var_24], 1

loc_6F7C:
		push	[bp+var_20]
		push	[bp+var_E]
		push	[bp+var_10]
		push	large dword_76A54
		push	cs
		call	near ptr sub_65C2
		add	sp, 0Ah
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_20]
		mov	[bx], ax
		add	[bp+var_20], 24h
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_6FA5:
		mov	ax, [bp+var_1E]
		mov	[bp+var_1C], ax
		inc	[bp+var_6]
		add	[bp+var_1E], 2

loc_6FB3:
		movzx	eax, [bp+var_C]
		cmp	eax, [bp+var_6]
		jbe	short loc_6FC1
		jmp	loc_6EBE

loc_6FC1:
		cmp	[bp+var_24], 0
		jz	short loc_6FD2
		xor	[bp+var_22], 1
		mov	[bp+var_24], 0
		jmp	short loc_6FDB

loc_6FD2:
		movsx	eax, [bp+var_26]
		mov	[bp+var_A], eax

loc_6FDB:
		cmp	[bp+var_A], 3
		jnb	short loc_6FE5
		jmp	loc_6B3D

loc_6FE5:
		mov	ax, word ptr [bp+var_A]
		mov	[bp+var_C], ax
		cmp	[bp+var_22], 0
		jnz	short loc_7012
		mov	ax, [bp+var_14]
		mov	[bp+var_1E], ax
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_C]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_14]
		add	dx, ax
		mov	[bp+var_1C], dx
		mov	ax, dx
		mov	[bp+var_18], ax
		mov	ax, [bp+var_16]
		jmp	short loc_7031

loc_7012:
		mov	ax, [bp+var_16]
		mov	[bp+var_1E], ax
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_C]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_16]
		add	dx, ax
		mov	[bp+var_1C], dx
		mov	ax, dx
		mov	[bp+var_18], ax
		mov	ax, [bp+var_14]

loc_7031:
		mov	[bp+var_2], ax
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_26], ax
		mov	[bp+var_6], 0
		jmp	loc_7144

loc_7049:
		mov	bx, [bp+var_1C]
		mov	ax, [bx]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_1E]
		mov	ax, [bx]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx+4]
		cmp	eax, dword_76A50
		jg	short loc_7082
		cmp	[bp+var_24], 0
		jz	short loc_707F
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_E]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]
		jmp	short loc_7082

loc_707F:
		inc	[bp+var_26]

loc_7082:
		mov	bx, [bp+var_E]
		mov	eax, [bx+4]
		cmp	eax, dword_76A50
		jg	short loc_709E
		mov	bx, [bp+var_10]
		mov	eax, [bx+4]
		cmp	eax, dword_76A50
		jg	short loc_70BD

loc_709E:
		mov	bx, [bp+var_E]
		mov	eax, [bx+4]
		cmp	eax, dword_76A50
		jg	short loc_70AF
		jmp	loc_7136

loc_70AF:
		mov	bx, [bp+var_10]
		mov	eax, [bx+4]
		cmp	eax, dword_76A50
		jg	short loc_7136

loc_70BD:
		cmp	[bp+var_24], 0
		jnz	short loc_710D
		mov	[bp+var_2A], 0
		jmp	short loc_70FD

loc_70CA:
		mov	bx, [bp+var_18]
		mov	ax, [bx]
		mov	[bp+var_12], ax
		mov	bx, [bp+var_12]
		mov	eax, [bx+4]
		cmp	eax, dword_76A50
		jg	short loc_70F0
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_12]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_70F0:
		mov	ax, [bp+var_1A]
		mov	[bp+var_18], ax
		inc	[bp+var_2A]
		add	[bp+var_1A], 2

loc_70FD:
		movsx	eax, [bp+var_2A]
		cmp	eax, [bp+var_6]
		jbe	short loc_70CA
		mov	[bp+var_24], 1

loc_710D:
		push	[bp+var_20]
		push	[bp+var_E]
		push	[bp+var_10]
		push	large dword_76A50
		push	cs
		call	near ptr sub_669F
		add	sp, 0Ah
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_20]
		mov	[bx], ax
		add	[bp+var_20], 24h
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_7136:
		mov	ax, [bp+var_1E]
		mov	[bp+var_1C], ax
		inc	[bp+var_6]
		add	[bp+var_1E], 2

loc_7144:
		movzx	eax, [bp+var_C]
		cmp	eax, [bp+var_6]
		jbe	short loc_7152
		jmp	loc_7049

loc_7152:
		cmp	[bp+var_24], 0
		jz	short loc_715E
		xor	[bp+var_22], 1
		jmp	short loc_7167

loc_715E:
		movsx	eax, [bp+var_26]
		mov	[bp+var_A], eax

loc_7167:
		cmp	[bp+var_A], 3
		jnb	short loc_7171
		jmp	loc_6B3D

loc_7171:
		mov	ax, word ptr [bp+var_A]
		mov	[bp+var_C], ax
		cmp	[bp+var_22], 0
		jnz	short loc_719E
		mov	ax, [bp+var_14]
		mov	[bp+var_1E], ax
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_C]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_14]
		add	dx, ax
		mov	[bp+var_1C], dx
		mov	ax, dx
		mov	[bp+var_18], ax
		mov	ax, [bp+var_16]
		jmp	short loc_71BD

loc_719E:
		mov	ax, [bp+var_16]
		mov	[bp+var_1E], ax
		mov	[bp+var_1A], ax
		mov	ax, [bp+var_C]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_16]
		add	dx, ax
		mov	[bp+var_1C], dx
		mov	ax, dx
		mov	[bp+var_18], ax
		mov	ax, [bp+var_14]

loc_71BD:
		mov	[bp+var_2], ax
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_26], ax
		mov	[bp+var_24], 1
		mov	[bp+var_6], 0
		jmp	short loc_7247

loc_71D9:
		mov	bx, [bp+var_1C]
		mov	ax, [bx]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_1E]
		mov	ax, [bx]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		sar	eax, 10h
		mov	[bp+var_36], ax
		mov	eax, [bx+4]
		sar	eax, 10h
		mov	[bp+var_38], ax
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		sar	eax, 10h
		mov	[bp+var_3A], ax
		mov	eax, [bx+4]
		sar	eax, 10h
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_36]
		cmp	ax, [bp+var_3A]
		jnz	short loc_7229
		mov	ax, [bp+var_38]
		cmp	ax, [bp+var_3C]
		jz	short loc_723F

loc_7229:
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_E]
		mov	[bx], ax
		add	[bp+var_2], 2
		mov	ax, [bp+var_1E]
		mov	[bp+var_1C], ax
		inc	[bp+var_A]

loc_723F:
		inc	[bp+var_6]
		add	[bp+var_1E], 2

loc_7247:
		movzx	eax, [bp+var_C]
		cmp	eax, [bp+var_6]
		ja	short loc_71D9
		cmp	[bp+var_24], 0
		jnz	short loc_7261
		movsx	eax, [bp+var_26]
		mov	[bp+var_A], eax

loc_7261:
		mov	ax, word ptr [bp+var_A]
		mov	[bp+var_C], ax
		mov	[bp+var_2C], ax
		cmp	[bp+var_C], 3
		jnb	short loc_7273
		jmp	loc_6B3D

loc_7273:
		mov	ax, [bp+var_C]
		cmp	ax, [bp+arg_0]
		jnz	short loc_7280
		push	[bp+arg_2]
		jmp	short loc_7292

loc_7280:
		mov	ax, [bp+arg_0]
		sub	[bp+var_C], ax
		mov	ax, [bp+var_C]
		imul	ax, ax, 18h
		mov	dx, [bp+arg_2]
		add	dx, ax
		push	dx

loc_7292:
		push	6496h
		call	sub_29411
		add	sp, 4
		mov	word ptr [bp+var_30+2], dx
		mov	word ptr [bp+var_30], ax
		cmp	[bp+var_30], 0
		jnz	short loc_72AD
		jmp	loc_6B3D

loc_72AD:
		cmp	[bp+var_C], 3
		jnz	short loc_72BD
		push	2
		push	seg seg222
		push	0
		jmp	short loc_72C5

loc_72BD:
		push	2
		push	seg seg222
		push	60h

loc_72C5:
		push	large [bp+var_30]
		call	sub_37C3
		add	sp, 0Ah
		movsx	eax, [bp+var_2C]
		les	bx, word ptr [bp+var_30]
		mov	es:[bx+14h], eax
		cmp	[bp+var_24], 0
		jz	short loc_72ED
		xor	[bp+var_22], 1
		mov	[bp+var_24], 0

loc_72ED:
		cmp	[bp+var_22], 0
		jnz	short loc_72F8
		mov	ax, [bp+var_14]
		jmp	short loc_72FB

loc_72F8:
		mov	ax, [bp+var_16]

loc_72FB:
		mov	[bp+var_1C], ax
		mov	ax, word ptr [bp+var_30+2]
		mov	dx, word ptr [bp+var_30]
		add	dx, 18h
		mov	[bp+var_32], ax
		mov	[bp+var_34], dx
		les	di, [bp+var_34]
		mov	bx, [bp+var_1C]
		mov	dx, [bp+var_2C]

loc_7316:
		mov	si, [bx]
		mov	eax, [si]
		sar	eax, 10h
		mov	es:[di], eax
		mov	eax, [si+4]
		sar	eax, 10h
		mov	es:[di+4], eax
		mov	eax, [si+8]
		mov	es:[di+8], eax
		mov	eax, [si+0Ch]
		mov	es:[di+0Ch], eax
		mov	eax, [si+10h]
		mov	es:[di+10h], eax
		mov	eax, [si+14h]
		mov	es:[di+14h], eax
		add	si, 24h
		add	di, 18h
		add	bx, 2
		dec	dx
		jnz	short loc_7316
		mov	dx, word ptr [bp+var_30+2]
		mov	ax, word ptr [bp+var_30]

loc_7366:
		pop	di
		pop	si
		leave
		retf
sub_6972		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_736A		proc far
		push	bp
		mov	bp, sp
		mov	ax, seg seg222
		mov	es, ax
		mov	word ptr es:0, 338h
		mov	es, ax
		mov	word ptr es:0, 33Ch
		mov	es, ax
		mov	word ptr es:0, 340h
		mov	es, ax
		mov	word ptr es:0, 344h
		mov	ax, seg seg222
		mov	es, ax
		mov	word ptr es:60h, 338h
		mov	es, ax
		mov	word ptr es:60h, 32Ch
		mov	es, ax
sub_736A		endp

; START OF FUNCTION CHUNK FOR sub_736A
		db 26h, 0C7h, 6, 60h, 0
; END OF FUNCTION CHUNK FOR sub_736A
seg010		ends
