ovr233		segment	para public 'OVERLAY' use16
		assume cs:ovr233
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BCC90		proc far

var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	eax, [di+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_A], ax
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_A]
		add	es:[bx+1Ch], ax
		mov	eax, [di+72h]
		mov	[bp+var_18], eax
		push	1
		push	0
		push	2
		push	large [bp+var_18]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_1C+2], dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	[bp+var_14], eax
		mov	[bp+var_10], 2
		mov	[bp+var_F], 1
		mov	[bp+var_E], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_E], eax
		push	0
		mov	al, [bp+var_10]
		push	ax
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		push	0
		mov	al, [bp+var_10]
		push	ax
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_1E], dx
		mov	[bp+var_20], ax
		push	0
		mov	al, [bp+var_10]
		push	ax
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_1E], dx
		mov	[bp+var_20], ax
		mov	eax, dword_4F25C
		mov	[bp+var_24], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_28], eax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+14h]
		push	word ptr es:[bx+12h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_2A], dx
		mov	[bp+var_2C], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Ch]
		sub	ax, [bp+var_A]
		mov	si, ax
		jmp	loc_BCF36

loc_BCD9F:
		les	bx, [bp+var_20]
		mov	al, es:[bx+1]
		cbw
		mov	dx, 18h
		imul	dx
		mov	dx, word ptr [bp+var_28+2]
		mov	bx, word ptr [bp+var_28]
		add	bx, ax
		mov	[bp+var_2], dx
		mov	[bp+var_4], bx
		les	bx, [bp+var_20]
		mov	al, es:[bx+1]
		cbw
		mov	dx, 12h
		imul	dx
		mov	dx, word ptr [bp+var_24+2]
		mov	bx, word ptr [bp+var_24]
		add	bx, ax
		mov	[bp+var_6], dx
		mov	[bp+var_8], bx
		mov	ax, word_4C118
		xor	dx, dx
		sub	ax, [bp+var_2C]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, [bp+var_20]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 3
		ja	short loc_BCE6F
		shl	bx, 1
		jmp	cs:off_BCF7E[bx]	; switch jump

loc_BCE0E:
		push	[bp+var_1E]
		push	[bp+var_20]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_4C11E
		push	word_4C11C
		call	sub_22FA5
		add	sp, 0Ch
		push	0Dh
		push	word_4F266
		push	word_4F264
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_6]
		push	[bp+var_8]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_22CCD
		add	sp, 0Ch
		add	word_4C118, 0Dh
		add	word_4C11C, 0Bh
		jmp	loc_BCF31

loc_BCE6F:
		push	[bp+var_1E]
		push	[bp+var_20]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_4C11E
		push	word_4C11C
		call	sub_22FA5
		add	sp, 0Ch
		push	0Dh
		push	word_4F26A
		push	word_4F268
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_6]
		push	[bp+var_8]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_22CCD
		add	sp, 0Ch
		add	word_4C118, 0Dh
		add	word_4C11C, 0Bh
		jmp	short loc_BCF31

loc_BCECF:
		push	[bp+var_1E]
		push	[bp+var_20]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_4C11E
		push	word_4C11C
		call	sub_2302A
		add	sp, 0Ch
		push	10h
		push	word_4F262
		push	word_4F260
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_6]
		push	[bp+var_8]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_2307A
		add	sp, 0Ch
		add	word_4C118, 10h
		add	word_4C11C, 0Eh
		jmp	short loc_BCF31

loc_BCF2F:
		jmp	short loc_BCF31

loc_BCF31:
		inc	si
		add	[bp+var_20], 8

loc_BCF36:
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Ch], si
		jle	short loc_BCF42
		jmp	loc_BCD9F

loc_BCF42:
		cmp	[bp+var_F], 0
		jz	short loc_BCF66
		cmp	[bp+var_14], 0
		jz	short loc_BCF66
		push	0
		mov	al, [bp+var_10]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BCF66

loc_BCF66:
		mov	[bp+var_14], 0
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		pop	di
		pop	si
		leave
		retf
sub_BCC90		endp

; START OF FUNCTION CHUNK FOR sub_BCC90
off_BCF7E	dw offset loc_BCE0E
		dw offset loc_BCE6F
		dw offset loc_BCECF
		dw offset loc_BCF2F
; END OF FUNCTION CHUNK FOR sub_BCC90
ovr233		ends
