seg010		segment	para public 'CODE' use16
		assume cs:seg010
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9, 56h, 9Ah, 3Bh, 3, 0, 0, 59h, 0EBh, 0

loc_755A:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_755E		proc far

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
		call	sub_839A
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
		call	sub_835A
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
		call	sub_835A
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
		call	sub_835A
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
		call	sub_835A
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
sub_755E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_763B		proc far

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
		call	sub_839A
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
		call	sub_835A
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
		call	sub_835A
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
		call	sub_835A
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
		call	sub_835A
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
sub_763B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7718		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
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
		call	sub_839A
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
		call	sub_835A
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [di+18h]
		add	edx, eax
		mov	[bp+var_1C], edx
		mov	eax, edx
		mov	[si+18h], eax
		mov	eax, [bp+arg_0]
		mov	[bp+var_18], eax
		mov	[si+1Ch], eax
		push	large [bp+var_4]
		mov	bx, [bp+arg_6]
		mov	eax, [bx+20h]
		sub	eax, [di+20h]
		push	eax
		call	sub_835A
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	edx, [di+20h]
		add	edx, eax
		mov	[bp+var_14], edx
		mov	eax, edx
		mov	[si+20h], eax
		mov	eax, [bp+var_1C]
		sar	eax, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_18]
		sar	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		sar	eax, 8
		mov	[bp+var_14], eax
		mov	ax, word_5FF5E
		mov	[bp+var_6], ax
		mov	ax, word_5FF60
		mov	[bp+var_8], ax
		mov	eax, [bp+var_18]
		mov	[bp+var_C], eax
		mov	eax, dword_5FF62
		mov	[bp+var_10], eax
		mov	eax, [bp+var_1C]
		mov	ebx, [bp+var_10]
		mov	ecx, [bp+var_C]
		imul	ebx
		idiv	ecx
		sar	eax, 8
		sub	ebx, ebx
		mov	bx, [bp+var_6]
		add	eax, ebx
		mov	bx, 7D00h
		cmp	eax, ebx
		jle	short loc_781F
		mov	eax, ebx

loc_781F:
		neg	ebx
		cmp	eax, ebx
		jge	short loc_782A
		mov	eax, ebx

loc_782A:
		mov	[si], eax
		mov	eax, [si]
		shl	eax, 10h
		mov	[si], eax
		mov	eax, dword_5FF66
		mov	[bp+var_10], eax
		mov	eax, [bp+var_14]
		mov	ebx, [bp+var_10]
		mov	ecx, [bp+var_C]
		imul	ebx
		idiv	ecx
		sar	eax, 8
		sub	ebx, ebx
		sub	ecx, ecx
		mov	cx, [bp+var_8]
		sub	ecx, eax
		mov	eax, ecx
		mov	bx, 7D00h
		cmp	eax, ebx
		jle	short loc_786F
		mov	eax, ebx

loc_786F:
		neg	ebx
		cmp	eax, ebx
		jge	short loc_787A
		mov	eax, ebx

loc_787A:
		mov	[si+4], eax
		mov	eax, [si+4]
		shl	eax, 10h
		mov	[si+4], eax
		push	large [bp+var_4]
		mov	bx, [bp+arg_6]
		mov	eax, [bx+0Ch]
		sub	eax, [di+0Ch]
		push	eax
		call	sub_835A
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
		call	sub_835A
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
		call	sub_835A
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
sub_7718		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_790E		proc far

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
		mov	[bp+var_1A], 0
		mov	[bp+var_22], 5BACh
		mov	[bp+var_24], 5B9Ah
		mov	[bp+var_28], 0
		jmp	short loc_7941

loc_792C:
		mov	ax, [bp+var_28]
		imul	ax, ax, 24h
		add	ax, 583Ah
		mov	bx, [bp+var_28]
		shl	bx, 1
		mov	[bx+5B9Ah], ax
		inc	[bp+var_28]

loc_7941:
		mov	ax, [bp+var_28]
		cmp	ax, [bp+arg_0]
		jl	short loc_792C
		mov	ax, [bp+arg_0]
		imul	ax, ax, 24h
		add	ax, 583Ah
		mov	[bp+var_2A], ax
		mov	[bp+var_1C], 0
		cmp	[bp+var_1A], 0
		jnz	short loc_7981
		mov	ax, [bp+var_24]
		mov	[bp+var_18], ax
		mov	[bp+var_14], ax
		mov	ax, [bp+arg_0]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_24]
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, dx
		mov	[bp+var_12], ax
		mov	ax, [bp+var_22]
		jmp	short loc_79A0

loc_7981:
		mov	ax, [bp+var_22]
		mov	[bp+var_18], ax
		mov	[bp+var_14], ax
		mov	ax, [bp+arg_0]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_22]
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, dx
		mov	[bp+var_12], ax
		mov	ax, [bp+var_24]

loc_79A0:
		mov	[bp+var_2], ax
		xor	ax, ax
		mov	[bp+var_26], ax
		mov	[bp+var_1E], ax
		mov	[bp+var_6], 0
		jmp	loc_7AAE

loc_79B6:
		mov	bx, [bp+var_16]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		mov	bx, [bp+var_18]
		mov	ax, [bx]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx+1Ch]
		cmp	eax, dword_5A358
		jl	short loc_79EE
		cmp	[bp+var_1C], 0
		jz	short loc_79EB
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_C]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_26]
		jmp	short loc_79EE

loc_79EB:
		inc	[bp+var_1E]

loc_79EE:
		mov	bx, [bp+var_C]
		mov	eax, [bx+1Ch]
		cmp	eax, dword_5A358
		jge	short loc_7A0A
		mov	bx, [bp+var_E]
		mov	eax, [bx+1Ch]
		cmp	eax, dword_5A358
		jge	short loc_7A29

loc_7A0A:
		mov	bx, [bp+var_C]
		mov	eax, [bx+1Ch]
		cmp	eax, dword_5A358
		jge	short loc_7A1B
		jmp	loc_7AA0

loc_7A1B:
		mov	bx, [bp+var_E]
		mov	eax, [bx+1Ch]
		cmp	eax, dword_5A358
		jge	short loc_7AA0

loc_7A29:
		cmp	[bp+var_1C], 0
		jnz	short loc_7A78
		mov	[bp+var_20], 0
		jmp	short loc_7A68

loc_7A36:
		mov	bx, [bp+var_12]
		mov	ax, [bx]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_10]
		mov	eax, [bx+1Ch]
		cmp	eax, dword_5A358
		jl	short loc_7A5B
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_10]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_26]

loc_7A5B:
		mov	ax, [bp+var_14]
		mov	[bp+var_12], ax
		inc	[bp+var_20]
		add	[bp+var_14], 2

loc_7A68:
		movsx	eax, [bp+var_20]
		cmp	eax, [bp+var_6]
		jbe	short loc_7A36
		mov	[bp+var_1C], 1

loc_7A78:
		push	[bp+var_2A]
		push	[bp+var_C]
		push	[bp+var_E]
		push	large dword_5A358
		push	cs
		call	near ptr sub_7718
		add	sp, 0Ah
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_2A]
		mov	[bx], ax
		add	[bp+var_2A], 24h
		add	[bp+var_2], 2
		inc	[bp+var_26]

loc_7AA0:
		mov	ax, [bp+var_18]
		mov	[bp+var_16], ax
		inc	[bp+var_6]
		add	[bp+var_18], 2

loc_7AAE:
		movsx	eax, [bp+arg_0]
		cmp	eax, [bp+var_6]
		jbe	short loc_7ABC
		jmp	loc_79B6

loc_7ABC:
		cmp	[bp+var_1C], 0
		jz	short loc_7ACD
		xor	[bp+var_1A], 1
		mov	[bp+var_1C], 0
		jmp	short loc_7AD3

loc_7ACD:
		mov	ax, [bp+var_1E]
		mov	[bp+var_26], ax

loc_7AD3:
		cmp	[bp+var_26], 3
		jnb	short loc_7AE0

loc_7AD9:
		xor	dx, dx
		xor	ax, ax
		jmp	loc_8302

loc_7AE0:
		cmp	[bp+var_1A], 0
		jnz	short loc_7B07
		mov	ax, [bp+var_24]
		mov	[bp+var_18], ax
		mov	[bp+var_14], ax
		mov	ax, [bp+var_26]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_24]
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, dx
		mov	[bp+var_12], ax
		mov	ax, [bp+var_22]
		jmp	short loc_7B26

loc_7B07:
		mov	ax, [bp+var_22]
		mov	[bp+var_18], ax
		mov	[bp+var_14], ax
		mov	ax, [bp+var_26]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_22]
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, dx
		mov	[bp+var_12], ax
		mov	ax, [bp+var_24]

loc_7B26:
		mov	[bp+var_2], ax
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_1E], ax
		mov	[bp+var_6], 0
		jmp	loc_7C33

loc_7B3E:
		mov	bx, [bp+var_16]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		mov	bx, [bp+var_18]
		mov	ax, [bx]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		cmp	eax, dword_5A368
		jg	short loc_7B76
		cmp	[bp+var_1C], 0
		jz	short loc_7B73
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_C]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]
		jmp	short loc_7B76

loc_7B73:
		inc	[bp+var_1E]

loc_7B76:
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		cmp	eax, dword_5A368
		jg	short loc_7B90
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		cmp	eax, dword_5A368
		jg	short loc_7BAD

loc_7B90:
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		cmp	eax, dword_5A368
		jg	short loc_7BA0
		jmp	loc_7C25

loc_7BA0:
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		cmp	eax, dword_5A368
		jg	short loc_7C25

loc_7BAD:
		cmp	[bp+var_1C], 0
		jnz	short loc_7BFC
		mov	[bp+var_20], 0
		jmp	short loc_7BEC

loc_7BBA:
		mov	bx, [bp+var_12]
		mov	ax, [bx]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		cmp	eax, dword_5A368
		jg	short loc_7BDF
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_10]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_7BDF:
		mov	ax, [bp+var_14]
		mov	[bp+var_12], ax
		inc	[bp+var_20]
		add	[bp+var_14], 2

loc_7BEC:
		movsx	eax, [bp+var_20]
		cmp	eax, [bp+var_6]
		jbe	short loc_7BBA
		mov	[bp+var_1C], 1

loc_7BFC:
		push	[bp+var_2A]
		push	[bp+var_C]
		push	[bp+var_E]
		push	large dword_5A368
		push	cs
		call	near ptr sub_755E
		add	sp, 0Ah
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_2A]
		mov	[bx], ax
		add	[bp+var_2A], 24h
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_7C25:
		mov	ax, [bp+var_18]
		mov	[bp+var_16], ax
		inc	[bp+var_6]
		add	[bp+var_18], 2

loc_7C33:
		movzx	eax, [bp+var_26]
		cmp	eax, [bp+var_6]
		jbe	short loc_7C41
		jmp	loc_7B3E

loc_7C41:
		cmp	[bp+var_1C], 0
		jz	short loc_7C52
		xor	[bp+var_1A], 1
		mov	[bp+var_1C], 0
		jmp	short loc_7C5B

loc_7C52:
		movsx	eax, [bp+var_1E]
		mov	[bp+var_A], eax

loc_7C5B:
		cmp	[bp+var_A], 3
		jnb	short loc_7C65
		jmp	loc_7AD9

loc_7C65:
		mov	ax, word ptr [bp+var_A]
		mov	[bp+var_26], ax
		cmp	[bp+var_1A], 0
		jnz	short loc_7C92
		mov	ax, [bp+var_24]
		mov	[bp+var_18], ax
		mov	[bp+var_14], ax
		mov	ax, [bp+var_26]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_24]
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, dx
		mov	[bp+var_12], ax
		mov	ax, [bp+var_22]
		jmp	short loc_7CB1

loc_7C92:
		mov	ax, [bp+var_22]
		mov	[bp+var_18], ax
		mov	[bp+var_14], ax
		mov	ax, [bp+var_26]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_22]
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, dx
		mov	[bp+var_12], ax
		mov	ax, [bp+var_24]

loc_7CB1:
		mov	[bp+var_2], ax
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_1E], ax
		mov	[bp+var_6], 0
		jmp	loc_7DC4

loc_7CC9:
		mov	bx, [bp+var_16]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		mov	bx, [bp+var_18]
		mov	ax, [bx]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx+4]
		cmp	eax, dword_5A35C
		jl	short loc_7D02
		cmp	[bp+var_1C], 0
		jz	short loc_7CFF
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_C]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]
		jmp	short loc_7D02

loc_7CFF:
		inc	[bp+var_1E]

loc_7D02:
		mov	bx, [bp+var_C]
		mov	eax, [bx+4]
		cmp	eax, dword_5A35C
		jge	short loc_7D1E
		mov	bx, [bp+var_E]
		mov	eax, [bx+4]
		cmp	eax, dword_5A35C
		jge	short loc_7D3D

loc_7D1E:
		mov	bx, [bp+var_C]
		mov	eax, [bx+4]
		cmp	eax, dword_5A35C
		jge	short loc_7D2F
		jmp	loc_7DB6

loc_7D2F:
		mov	bx, [bp+var_E]
		mov	eax, [bx+4]
		cmp	eax, dword_5A35C
		jge	short loc_7DB6

loc_7D3D:
		cmp	[bp+var_1C], 0
		jnz	short loc_7D8D
		mov	[bp+var_20], 0
		jmp	short loc_7D7D

loc_7D4A:
		mov	bx, [bp+var_12]
		mov	ax, [bx]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_10]
		mov	eax, [bx+4]
		cmp	eax, dword_5A35C
		jl	short loc_7D70
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_10]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_7D70:
		mov	ax, [bp+var_14]
		mov	[bp+var_12], ax
		inc	[bp+var_20]
		add	[bp+var_14], 2

loc_7D7D:
		movsx	eax, [bp+var_20]
		cmp	eax, [bp+var_6]
		jbe	short loc_7D4A
		mov	[bp+var_1C], 1

loc_7D8D:
		push	[bp+var_2A]
		push	[bp+var_C]
		push	[bp+var_E]
		push	large dword_5A35C
		push	cs
		call	near ptr sub_763B
		add	sp, 0Ah
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_2A]
		mov	[bx], ax
		add	[bp+var_2A], 24h
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_7DB6:
		mov	ax, [bp+var_18]
		mov	[bp+var_16], ax
		inc	[bp+var_6]
		add	[bp+var_18], 2

loc_7DC4:
		movzx	eax, [bp+var_26]
		cmp	eax, [bp+var_6]
		jbe	short loc_7DD2
		jmp	loc_7CC9

loc_7DD2:
		cmp	[bp+var_1C], 0
		jz	short loc_7DE3
		xor	[bp+var_1A], 1
		mov	[bp+var_1C], 0
		jmp	short loc_7DEC

loc_7DE3:
		movsx	eax, [bp+var_1E]
		mov	[bp+var_A], eax

loc_7DEC:
		cmp	[bp+var_A], 3
		jnb	short loc_7DF6
		jmp	loc_7AD9

loc_7DF6:
		mov	ax, word ptr [bp+var_A]
		mov	[bp+var_26], ax
		cmp	[bp+var_1A], 0
		jnz	short loc_7E23
		mov	ax, [bp+var_24]
		mov	[bp+var_18], ax
		mov	[bp+var_14], ax
		mov	ax, [bp+var_26]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_24]
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, dx
		mov	[bp+var_12], ax
		mov	ax, [bp+var_22]
		jmp	short loc_7E42

loc_7E23:
		mov	ax, [bp+var_22]
		mov	[bp+var_18], ax
		mov	[bp+var_14], ax
		mov	ax, [bp+var_26]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_22]
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, dx
		mov	[bp+var_12], ax
		mov	ax, [bp+var_24]

loc_7E42:
		mov	[bp+var_2], ax
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_1E], ax
		mov	[bp+var_6], 0
		jmp	loc_7F4F

loc_7E5A:
		mov	bx, [bp+var_16]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		mov	bx, [bp+var_18]
		mov	ax, [bx]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		cmp	eax, dword_5A364
		jl	short loc_7E92
		cmp	[bp+var_1C], 0
		jz	short loc_7E8F
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_C]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]
		jmp	short loc_7E92

loc_7E8F:
		inc	[bp+var_1E]

loc_7E92:
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		cmp	eax, dword_5A364
		jge	short loc_7EAC
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		cmp	eax, dword_5A364
		jge	short loc_7EC9

loc_7EAC:
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		cmp	eax, dword_5A364
		jge	short loc_7EBC
		jmp	loc_7F41

loc_7EBC:
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		cmp	eax, dword_5A364
		jge	short loc_7F41

loc_7EC9:
		cmp	[bp+var_1C], 0
		jnz	short loc_7F18
		mov	[bp+var_20], 0
		jmp	short loc_7F08

loc_7ED6:
		mov	bx, [bp+var_12]
		mov	ax, [bx]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		cmp	eax, dword_5A364
		jl	short loc_7EFB
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_10]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_7EFB:
		mov	ax, [bp+var_14]
		mov	[bp+var_12], ax
		inc	[bp+var_20]
		add	[bp+var_14], 2

loc_7F08:
		movsx	eax, [bp+var_20]
		cmp	eax, [bp+var_6]
		jbe	short loc_7ED6
		mov	[bp+var_1C], 1

loc_7F18:
		push	[bp+var_2A]
		push	[bp+var_C]
		push	[bp+var_E]
		push	large dword_5A364
		push	cs
		call	near ptr sub_755E
		add	sp, 0Ah
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_2A]
		mov	[bx], ax
		add	[bp+var_2A], 24h
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_7F41:
		mov	ax, [bp+var_18]
		mov	[bp+var_16], ax
		inc	[bp+var_6]
		add	[bp+var_18], 2

loc_7F4F:
		movzx	eax, [bp+var_26]
		cmp	eax, [bp+var_6]
		jbe	short loc_7F5D
		jmp	loc_7E5A

loc_7F5D:
		cmp	[bp+var_1C], 0
		jz	short loc_7F6E
		xor	[bp+var_1A], 1
		mov	[bp+var_1C], 0
		jmp	short loc_7F77

loc_7F6E:
		movsx	eax, [bp+var_1E]
		mov	[bp+var_A], eax

loc_7F77:
		cmp	[bp+var_A], 3
		jnb	short loc_7F81
		jmp	loc_7AD9

loc_7F81:
		mov	ax, word ptr [bp+var_A]
		mov	[bp+var_26], ax
		cmp	[bp+var_1A], 0
		jnz	short loc_7FAE
		mov	ax, [bp+var_24]
		mov	[bp+var_18], ax
		mov	[bp+var_14], ax
		mov	ax, [bp+var_26]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_24]
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, dx
		mov	[bp+var_12], ax
		mov	ax, [bp+var_22]
		jmp	short loc_7FCD

loc_7FAE:
		mov	ax, [bp+var_22]
		mov	[bp+var_18], ax
		mov	[bp+var_14], ax
		mov	ax, [bp+var_26]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_22]
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, dx
		mov	[bp+var_12], ax
		mov	ax, [bp+var_24]

loc_7FCD:
		mov	[bp+var_2], ax
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_1E], ax
		mov	[bp+var_6], 0
		jmp	loc_80E0

loc_7FE5:
		mov	bx, [bp+var_16]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		mov	bx, [bp+var_18]
		mov	ax, [bx]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx+4]
		cmp	eax, dword_5A360
		jg	short loc_801E
		cmp	[bp+var_1C], 0
		jz	short loc_801B
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_C]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]
		jmp	short loc_801E

loc_801B:
		inc	[bp+var_1E]

loc_801E:
		mov	bx, [bp+var_C]
		mov	eax, [bx+4]
		cmp	eax, dword_5A360
		jg	short loc_803A
		mov	bx, [bp+var_E]
		mov	eax, [bx+4]
		cmp	eax, dword_5A360
		jg	short loc_8059

loc_803A:
		mov	bx, [bp+var_C]
		mov	eax, [bx+4]
		cmp	eax, dword_5A360
		jg	short loc_804B
		jmp	loc_80D2

loc_804B:
		mov	bx, [bp+var_E]
		mov	eax, [bx+4]
		cmp	eax, dword_5A360
		jg	short loc_80D2

loc_8059:
		cmp	[bp+var_1C], 0
		jnz	short loc_80A9
		mov	[bp+var_20], 0
		jmp	short loc_8099

loc_8066:
		mov	bx, [bp+var_12]
		mov	ax, [bx]
		mov	[bp+var_10], ax
		mov	bx, [bp+var_10]
		mov	eax, [bx+4]
		cmp	eax, dword_5A360
		jg	short loc_808C
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_10]
		mov	[bx], ax
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_808C:
		mov	ax, [bp+var_14]
		mov	[bp+var_12], ax
		inc	[bp+var_20]
		add	[bp+var_14], 2

loc_8099:
		movsx	eax, [bp+var_20]
		cmp	eax, [bp+var_6]
		jbe	short loc_8066
		mov	[bp+var_1C], 1

loc_80A9:
		push	[bp+var_2A]
		push	[bp+var_C]
		push	[bp+var_E]
		push	large dword_5A360
		push	cs
		call	near ptr sub_763B
		add	sp, 0Ah
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_2A]
		mov	[bx], ax
		add	[bp+var_2A], 24h
		add	[bp+var_2], 2
		inc	[bp+var_A]

loc_80D2:
		mov	ax, [bp+var_18]
		mov	[bp+var_16], ax
		inc	[bp+var_6]
		add	[bp+var_18], 2

loc_80E0:
		movzx	eax, [bp+var_26]
		cmp	eax, [bp+var_6]
		jbe	short loc_80EE
		jmp	loc_7FE5

loc_80EE:
		cmp	[bp+var_1C], 0
		jz	short loc_80FA
		xor	[bp+var_1A], 1
		jmp	short loc_8103

loc_80FA:
		movsx	eax, [bp+var_1E]
		mov	[bp+var_A], eax

loc_8103:
		cmp	[bp+var_A], 3
		jnb	short loc_810D
		jmp	loc_7AD9

loc_810D:
		mov	ax, word ptr [bp+var_A]
		mov	[bp+var_26], ax
		cmp	[bp+var_1A], 0
		jnz	short loc_813A
		mov	ax, [bp+var_24]
		mov	[bp+var_18], ax
		mov	[bp+var_14], ax
		mov	ax, [bp+var_26]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_24]
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, dx
		mov	[bp+var_12], ax
		mov	ax, [bp+var_22]
		jmp	short loc_8159

loc_813A:
		mov	ax, [bp+var_22]
		mov	[bp+var_18], ax
		mov	[bp+var_14], ax
		mov	ax, [bp+var_26]
		dec	ax
		shl	ax, 1
		mov	dx, [bp+var_22]
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, dx
		mov	[bp+var_12], ax
		mov	ax, [bp+var_24]

loc_8159:
		mov	[bp+var_2], ax
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_1E], ax
		mov	[bp+var_1C], 1
		mov	[bp+var_6], 0
		jmp	short loc_81E3

loc_8175:
		mov	bx, [bp+var_16]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		mov	bx, [bp+var_18]
		mov	ax, [bx]
		mov	[bp+var_E], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		sar	eax, 10h
		mov	[bp+var_36], ax
		mov	eax, [bx+4]
		sar	eax, 10h
		mov	[bp+var_38], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		sar	eax, 10h
		mov	[bp+var_3A], ax
		mov	eax, [bx+4]
		sar	eax, 10h
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_36]
		cmp	ax, [bp+var_3A]
		jnz	short loc_81C5
		mov	ax, [bp+var_38]
		cmp	ax, [bp+var_3C]
		jz	short loc_81DB

loc_81C5:
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_C]
		mov	[bx], ax
		add	[bp+var_2], 2
		mov	ax, [bp+var_18]
		mov	[bp+var_16], ax
		inc	[bp+var_A]

loc_81DB:
		inc	[bp+var_6]
		add	[bp+var_18], 2

loc_81E3:
		movzx	eax, [bp+var_26]
		cmp	eax, [bp+var_6]
		ja	short loc_8175
		cmp	[bp+var_1C], 0
		jnz	short loc_81FD
		movsx	eax, [bp+var_1E]
		mov	[bp+var_A], eax

loc_81FD:
		mov	ax, word ptr [bp+var_A]
		mov	[bp+var_26], ax
		mov	[bp+var_2C], ax
		cmp	[bp+var_26], 3
		jnb	short loc_820F
		jmp	loc_7AD9

loc_820F:
		mov	ax, [bp+var_26]
		cmp	ax, [bp+arg_0]
		jnz	short loc_821C
		push	[bp+arg_2]
		jmp	short loc_822E

loc_821C:
		mov	ax, [bp+arg_0]
		sub	[bp+var_26], ax
		mov	ax, [bp+var_26]
		imul	ax, ax, 18h
		mov	dx, [bp+arg_2]
		add	dx, ax
		push	dx

loc_822E:
		push	637Ah
		call	sub_33F63
		add	sp, 4
		mov	word ptr [bp+var_30+2], dx
		mov	word ptr [bp+var_30], ax
		cmp	[bp+var_30], 0
		jnz	short loc_8249
		jmp	loc_7AD9

loc_8249:
		cmp	[bp+var_26], 3
		jnz	short loc_8259
		push	2
		push	seg seg179
		push	0
		jmp	short loc_8261

loc_8259:
		push	2
		push	seg seg179
		push	60h

loc_8261:
		push	large [bp+var_30]
		call	sub_3609
		add	sp, 0Ah
		movsx	eax, [bp+var_2C]
		les	bx, word ptr [bp+var_30]
		mov	es:[bx+14h], eax
		cmp	[bp+var_1C], 0
		jz	short loc_8289
		xor	[bp+var_1A], 1
		mov	[bp+var_1C], 0

loc_8289:
		cmp	[bp+var_1A], 0
		jnz	short loc_8294
		mov	ax, [bp+var_24]
		jmp	short loc_8297

loc_8294:
		mov	ax, [bp+var_22]

loc_8297:
		mov	[bp+var_16], ax
		mov	ax, word ptr [bp+var_30+2]
		mov	dx, word ptr [bp+var_30]
		add	dx, 18h
		mov	[bp+var_32], ax
		mov	[bp+var_34], dx
		les	di, [bp+var_34]
		mov	bx, [bp+var_16]
		mov	dx, [bp+var_2C]

loc_82B2:
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
		jnz	short loc_82B2
		mov	dx, word ptr [bp+var_30+2]
		mov	ax, word ptr [bp+var_30]

loc_8302:
		pop	di
		pop	si
		leave
		retf
sub_790E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8306		proc far
		push	bp
		mov	bp, sp
		mov	ax, seg seg179
		mov	es, ax
		mov	word ptr es:0, 658h
		mov	es, ax
		mov	word ptr es:0, 65Ch
		mov	es, ax
		mov	word ptr es:0, 660h
		mov	es, ax
		mov	word ptr es:0, 664h
		mov	ax, seg seg179
		mov	es, ax
		mov	word ptr es:60h, 658h
		mov	es, ax
		mov	word ptr es:60h, 64Ch
		mov	es, ax
		mov	word ptr es:60h, 650h
		mov	es, ax
sub_8306		endp
seg010		ends
