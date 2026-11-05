ovr286		segment	para public 'OVERLAY' use16
		assume cs:ovr286
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A7710		proc far

var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= dword ptr -4Ch
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	ax, [bp+arg_6]
		mov	[di+2], ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		call	sub_7844
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_A7743
		mov	eax, [bx+61h]
		jmp	short loc_A774A

loc_A7743:
		mov	bx, [bp+arg_2]
		mov	eax, [bx+71h]

loc_A774A:
		cmp	eax, 0
		jg	short loc_A7753
		jmp	loc_A7C76

loc_A7753:
		push	[bp+arg_2]
		call	StreamReader_GetCapacity_6C5C7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_2]
		push	large [bx+65h]
		push	bx
		call	StreamReader_SeekVariant_6C348
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 0Ah
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	[bp+arg_2]
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	ax, [bp+var_8]
		mov	[di+16h], ax
		mov	ax, [bp+var_E]
		mov	[di+6], ax
		mov	ax, [bp+var_C]
		mov	[di+14h], ax
		mov	ax, [di+6]
		imul	ax, ax, 1Eh
		mov	dx, [di+14h]
		imul	dx, dx, 26h
		add	ax, dx
		movzx	eax, ax
		mov	[bp+var_12], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[di+8], eax
		mov	byte ptr [di+0Ch], 2
		mov	byte ptr [di+0Dh], 1
		mov	dword ptr [di+0Eh], 0
		mov	eax, [bp+var_12]
		mov	[di+0Eh], eax
		push	0
		mov	al, [di+0Ch]
		push	ax
		push	large [di+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_18], dx
		mov	[bp+var_1A], ax
		push	0
		mov	al, [di+0Ch]
		push	ax
		push	large [di+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		mov	ax, [bp+var_1A]
		mov	[bp+var_1C], ax
		mov	[di+4], ax
		mov	ax, [di+6]
		imul	ax, ax, 1Eh
		mov	dx, [bp+var_1A]
		add	dx, ax
		mov	[bp+var_1E], dx
		mov	ax, [bp+var_1E]
		mov	[di+12h], ax
		mov	ax, [di+6]
		imul	ax, ax, 0Dh
		mov	[bp+var_24], ax
		mov	ax, [di+14h]
		imul	ax, ax, 1Ch
		mov	[bp+var_26], ax
		mov	si, [bp+var_24]
		add	si, [bp+var_26]
		movsx	eax, si
		mov	[bp+var_34], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_38+2], dx
		mov	word ptr [bp+var_38], ax
		mov	eax, [bp+var_38]
		mov	[bp+var_30], eax
		mov	[bp+var_2C], 2
		mov	[bp+var_2B], 1
		mov	[bp+var_2A], 0
		mov	eax, [bp+var_34]
		mov	[bp+var_2A], eax
		push	0
		mov	al, [di+0Ch]
		push	ax
		push	large [di+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		push	large 0FFFFFFFFh
		movsx	eax, si
		push	eax
		push	0
		mov	al, [bp+var_2C]
		push	ax
		push	large [bp+var_30]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_2]
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	ax, [di+4]
		mov	dx, word_77BF2
		mov	[bp+var_3A], dx
		mov	[bp+var_3C], ax
		push	0
		mov	al, [bp+var_2C]
		push	ax
		push	large [bp+var_30]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_40+2], dx
		mov	word ptr [bp+var_40], ax
		xor	cx, cx
		jmp	short loc_A7965

loc_A790B:
		mov	eax, [bp+var_40]
		mov	[bp+var_44], eax
		les	si, word ptr [bp+var_44]
		mov	eax, es:[si]
		mov	[bp+var_6A], eax
		mov	eax, es:[si+4]
		mov	[bp+var_66], eax
		mov	eax, es:[si+8]
		mov	[bp+var_62], eax
		les	bx, [bp+var_3C]
		mov	eax, [bp+var_6A]
		mov	es:[bx+11h], eax
		mov	eax, [bp+var_66]
		mov	es:[bx+15h], eax
		mov	eax, [bp+var_62]
		mov	es:[bx+19h], eax
		les	bx, word ptr [bp+var_40]
		mov	al, es:[bx+0Ch]
		les	bx, [bp+var_3C]
		mov	es:[bx+1Dh], al
		inc	cx
		add	[bp+var_3C], 1Eh
		add	word ptr [bp+var_40], 0Dh

loc_A7965:
		cmp	[di+6], cx
		jg	short loc_A790B
		mov	ax, [di+12h]
		mov	dx, word_77BF2
		mov	[bp+var_46], dx
		mov	[bp+var_48], ax
		mov	eax, [bp+var_40]
		mov	[bp+var_4C], eax
		mov	ax, [di+4]
		mov	[bp+var_3A], dx
		mov	[bp+var_3C], ax
		xor	cx, cx
		jmp	loc_A7B2F

loc_A798D:
		les	bx, word ptr [bp+var_4C]
		mov	al, es:[bx+13h]
		les	bx, [bp+var_48]
		mov	es:[bx], al
		les	bx, word ptr [bp+var_4C]
		mov	ax, es:[bx+1]
		imul	ax, ax, 1Eh
		mov	dx, [bp+var_3A]
		mov	bx, [bp+var_3C]
		add	bx, ax
		mov	[bp+var_4E], dx
		mov	[bp+var_50], bx
		mov	ax, [bp+var_50]
		mov	[bp+var_52], ax
		mov	ax, [bp+var_52]
		les	bx, [bp+var_48]
		mov	es:[bx+1], ax
		les	bx, word ptr [bp+var_4C]
		mov	ax, es:[bx+3]
		imul	ax, ax, 1Eh
		mov	bx, [bp+var_3C]
		add	bx, ax
		mov	[bp+var_54], dx
		mov	[bp+var_56], bx
		mov	ax, [bp+var_56]
		mov	[bp+var_58], ax
		mov	ax, [bp+var_58]
		les	bx, [bp+var_48]
		mov	es:[bx+3], ax
		les	bx, word ptr [bp+var_4C]
		mov	ax, es:[bx+5]
		imul	ax, ax, 1Eh
		mov	bx, [bp+var_3C]
		add	bx, ax
		mov	[bp+var_5A], dx
		mov	[bp+var_5C], bx
		mov	ax, [bp+var_5C]
		mov	[bp+var_5E], ax
		mov	ax, [bp+var_5E]
		les	bx, [bp+var_48]
		mov	es:[bx+5], ax
		mov	word ptr es:[bx+7], 0
		mov	word ptr es:[bx+9], 0
		mov	word ptr es:[bx+0Bh], 0
		mov	word ptr es:[bx+0Dh], 0
		mov	word ptr es:[bx+0Fh], 0
		mov	word ptr es:[bx+11h], 0
		les	bx, word ptr [bp+var_4C]
		mov	dx, es:[bx+14h]
		cmp	dx, word_7CC8E
		jnb	short loc_A7A50
		mov	ax, dx
		imul	ax, ax, 0Eh
		mov	edx, dword_7CC94
		push	ax
		mov	ax, word_7CC92
		pop	bx
		add	ax, bx
		jmp	short loc_A7A71

loc_A7A50:
		sub	dx, word_7CC8E
		cmp	dx, word_7CC90
		jnb	short loc_A7A6D
		mov	ax, dx
		imul	ax, ax, 18h
		mov	edx, dword_7CC98
		push	ax
		mov	ax, word_7CC96
		pop	bx
		add	ax, bx
		jmp	short loc_A7A71

loc_A7A6D:
		xor	dx, dx
		xor	ax, ax

loc_A7A71:
		les	bx, [bp+var_48]
		mov	es:[bx+16h], dx
		mov	es:[bx+14h], ax
		les	bx, es:[bx+14h]
		mov	eax, es:[bx]
		les	bx, [bp+var_48]
		mov	es:[bx+14h], eax
		les	bx, word ptr [bp+var_4C]
		mov	al, es:[bx+16h]
		mov	ah, 0
		les	bx, [bp+var_48]
		mov	es:[bx+18h], ax
		les	bx, word ptr [bp+var_4C]
		mov	al, es:[bx+18h]
		mov	ah, 0
		les	bx, [bp+var_48]
		mov	es:[bx+1Ch], ax
		les	bx, word ptr [bp+var_4C]
		mov	al, es:[bx+1Ah]
		mov	ah, 0
		les	bx, [bp+var_48]
		mov	es:[bx+20h], ax
		les	bx, word ptr [bp+var_4C]
		mov	al, es:[bx+17h]
		mov	ah, 0
		les	bx, [bp+var_48]
		mov	es:[bx+1Ah], ax
		les	bx, word ptr [bp+var_4C]
		mov	al, es:[bx+19h]
		mov	ah, 0
		les	bx, [bp+var_48]
		mov	es:[bx+1Eh], ax
		les	bx, word ptr [bp+var_4C]
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		les	bx, [bp+var_48]
		mov	es:[bx+22h], ax
		push	es
		les	si, word ptr [bp+var_4C]
		mov	al, es:[si]
		pop	es
		mov	es:[bx+24h], al
		mov	es, [bp+var_46]
		mov	byte ptr es:[bx+25h], 0
		cmp	dword ptr es:[bx+14h], 0
		jnz	short loc_A7B0D
		mov	byte ptr es:[bx+25h], 1

loc_A7B0D:
		les	bx, word ptr [bp+var_4C]
		mov	dx, es:[bx+14h]
		cmp	dx, 0Eh
		jb	short loc_A7B26
		cmp	dx, 11h
		ja	short loc_A7B26
		les	bx, [bp+var_48]
		mov	byte ptr es:[bx+25h], 1

loc_A7B26:
		inc	cx
		add	[bp+var_48], 26h
		add	word ptr [bp+var_4C], 1Ch

loc_A7B2F:
		cmp	[di+14h], cx
		jle	short loc_A7B37
		jmp	loc_A798D

loc_A7B37:
		cmp	[bp+var_2B], 0
		jz	short loc_A7B5B
		cmp	[bp+var_30], 0
		jz	short loc_A7B5B
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A7B5B

loc_A7B5B:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	1
		push	0
		push	2
		mov	ax, [bp+var_6]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[di+1Eh], dx
		mov	[di+1Ch], ax
		push	large 0FFFFFFFFh
		mov	ax, [bp+var_6]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	large [di+1Ch]
		push	[bp+arg_2]
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		mov	ax, [di+16h]
		imul	word ptr [di+16h]
		mov	[bp+var_20], ax
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_22], ax
		push	large 0FFFFFFFFh
		mov	ax, [bp+var_20]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	ds
		push	[bp+var_22]
		push	[bp+arg_2]
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	1
		push	0
		push	2
		mov	ax, [bp+var_20]
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[di+1Ah], dx
		mov	[di+18h], ax
		xor	cx, cx
		jmp	short loc_A7C57

loc_A7C07:
		mov	ax, [di+1Eh]
		mov	dx, [di+1Ch]
		mov	bx, cx
		shl	bx, 1
		mov	si, [bp+var_22]
		add	si, bx
		mov	bx, [si]
		shl	bx, 1
		add	dx, bx
		mov	[bp+var_24], ax
		mov	[bp+var_26], dx
		les	bx, [bp+var_26]
		cmp	word ptr es:[bx], 0FFFFh
		jz	short loc_A7C41
		les	bx, [di+18h]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		mov	ax, [bp+var_24]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short loc_A7C56

loc_A7C41:
		les	bx, [di+18h]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx], 0

loc_A7C56:
		inc	cx

loc_A7C57:
		cmp	cx, [bp+var_20]
		jl	short loc_A7C07
		push	[bp+var_22]
		call	sub_3B2
		pop	cx
		push	large [bp+var_4]
		push	[bp+arg_2]
		call	StreamReader_SeekVariant_6C348
		add	sp, 6
		jmp	short loc_A7C7B

loc_A7C76:
		mov	word ptr [di+16h], 0

loc_A7C7B:
		mov	dword_77BF0, 0
		pop	di
		pop	si
		leave
		retf
sub_A7710		endp
ovr286		ends
