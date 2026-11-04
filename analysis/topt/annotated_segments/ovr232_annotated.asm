ovr232		segment	para public 'OVERLAY' use16
		assume cs:ovr232
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BC960		proc far

var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= dword ptr -16h
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
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	eax, [di+72h]
		mov	ebx, 7
		cdq
		idiv	ebx
		mov	[bp+var_12], ax
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_12]
		add	es:[bx+1Ch], ax
		mov	eax, [di+72h]
		mov	[bp+var_20], eax
		push	1
		push	0
		push	2
		push	large [bp+var_20]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_24+2], dx
		mov	word ptr [bp+var_24], ax
		mov	eax, [bp+var_24]
		mov	[bp+var_1C], eax
		mov	[bp+var_18], 2
		mov	[bp+var_17], 1
		mov	[bp+var_16], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_16], eax
		push	0
		mov	al, [bp+var_18]
		push	ax
		push	word ptr [bp+var_1C+2]
		push	word ptr [bp+var_1C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		push	0
		mov	al, [bp+var_18]
		push	ax
		push	word ptr [bp+var_1C+2]
		push	word ptr [bp+var_1C]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_26], dx
		mov	[bp+var_28], ax
		mov	eax, dword_4F25C
		mov	[bp+var_2C], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_30], eax
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
		mov	[bp+var_32], dx
		mov	[bp+var_34], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Ch]
		sub	ax, [bp+var_12]
		mov	si, ax
		jmp	loc_BCC47

loc_BCA52:
		les	bx, [bp+var_28]
		mov	al, es:[bx+1]
		cbw
		mov	dx, 18h
		imul	dx
		mov	dx, word ptr [bp+var_30+2]
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	[bp+var_2], dx
		mov	[bp+var_4], bx
		les	bx, [bp+var_28]
		mov	al, es:[bx+2]
		cbw
		mov	dx, 18h
		imul	dx
		mov	dx, word ptr [bp+var_30+2]
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	[bp+var_6], dx
		mov	[bp+var_8], bx
		les	bx, [bp+var_28]
		mov	al, es:[bx+1]
		cbw
		mov	dx, 12h
		imul	dx
		mov	dx, word ptr [bp+var_2C+2]
		mov	bx, word ptr [bp+var_2C]
		add	bx, ax
		mov	[bp+var_A], dx
		mov	[bp+var_C], bx
		les	bx, [bp+var_28]
		mov	al, es:[bx+2]
		cbw
		mov	dx, 12h
		imul	dx
		mov	dx, word ptr [bp+var_2C+2]
		mov	bx, word ptr [bp+var_2C]
		add	bx, ax
		mov	[bp+var_E], dx
		mov	[bp+var_10], bx
		mov	ax, word_4C118
		xor	dx, dx
		sub	ax, [bp+var_34]
		sbb	dx, 0
		shl	eax, 10h
		shrd	eax, edx, 10h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, [bp+var_28]
		mov	al, es:[bx]
		cbw
		cmp	ax, 1
		jz	short loc_BCAFD
		cmp	ax, 2
		jz	short loc_BCB6A
		cmp	ax, 3
		jnz	short loc_BCAFB
		jmp	loc_BCBD6

loc_BCAFB:
		jmp	short loc_BCAFD

loc_BCAFD:
		push	[bp+var_26]
		push	[bp+var_28]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_4C11E
		push	word_4C11C
		call	sub_18E25
		add	sp, 10h
		push	0Fh
		push	word_4F1B8
		push	word_4F1B6
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_E]
		push	[bp+var_10]
		push	[bp+var_A]
		push	[bp+var_C]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_18997
		add	sp, 10h
		add	word_4C118, 0Fh
		add	word_4C11C, 0Ch
		jmp	loc_BCC42

loc_BCB6A:
		push	[bp+var_26]
		push	[bp+var_28]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_4C11E
		push	word_4C11C
		call	sub_18F5C
		add	sp, 10h
		push	12h
		push	word_4F1BC
		push	word_4F1BA
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_E]
		push	[bp+var_10]
		push	[bp+var_A]
		push	[bp+var_C]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_18F9F
		add	sp, 10h
		add	word_4C118, 12h
		add	word_4C11C, 0Fh
		jmp	short loc_BCC42

loc_BCBD6:
		push	[bp+var_26]
		push	[bp+var_28]
		push	[bp+var_6]
		push	[bp+var_8]
		push	[bp+var_2]
		push	[bp+var_4]
		push	word_4C11E
		push	word_4C11C
		call	sub_19077
		add	sp, 10h
		push	10h
		push	word_4F1C0
		push	word_4F1BE
		push	word_4C11A
		push	word_4C118
		call	sub_3545
		add	sp, 0Ah
		push	[bp+var_E]
		push	[bp+var_10]
		push	[bp+var_A]
		push	[bp+var_C]
		push	word_4C11E
		push	word_4C11C
		push	word_4C11A
		push	word_4C118
		call	sub_18997
		add	sp, 10h
		add	word_4C118, 10h
		add	word_4C11C, 0Dh
		jmp	short loc_BCC42

loc_BCC42:
		inc	si
		add	[bp+var_28], 7

loc_BCC47:
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Ch], si
		jle	short loc_BCC53
		jmp	loc_BCA52

loc_BCC53:
		cmp	[bp+var_17], 0
		jz	short loc_BCC77
		cmp	[bp+var_1C], 0
		jz	short loc_BCC77
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_BCC77

loc_BCC77:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		pop	di
		pop	si
		leave
		retf
sub_BC960		endp
ovr232		ends
