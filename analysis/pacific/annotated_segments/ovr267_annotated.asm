ovr267		segment	para public 'OVERLAY' use16
		assume cs:ovr267
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A1E40		proc far

var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [si+72h]
		mov	ebx, 6
		cdq
		idiv	ebx
		mov	di, ax
		les	bx, [bp+arg_0]
		add	es:[bx+1Ch], di
		mov	eax, [si+72h]
		mov	[bp+var_16], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_1A+2], dx
		mov	word ptr [bp+var_1A], ax
		mov	eax, [bp+var_1A]
		mov	[bp+var_12], eax
		mov	[bp+var_E], 2
		mov	[bp+var_D], 1
		mov	[bp+var_C], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_C], eax
		push	0
		mov	al, [bp+var_E]
		push	ax
		push	large [bp+var_12]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		push	0
		mov	al, [bp+var_E]
		push	ax
		push	large [bp+var_12]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_1E+2], dx
		mov	word ptr [bp+var_1E], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_22], eax
		push	0
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_24], dx
		mov	[bp+var_26], ax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+1Ch]
		sub	si, di
		jmp	loc_A1FF2

loc_A1F2E:
		les	bx, word ptr [bp+var_1E]
		mov	ax, es:[bx+2]
		imul	ax, ax, 2Ah
		mov	dx, word ptr [bp+var_22+2]
		mov	bx, word ptr [bp+var_22]
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		mov	bx, word ptr [bp+var_1E]
		mov	ax, es:[bx+4]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_22]
		add	bx, ax
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], bx
		mov	ax, word_77962
		xor	dx, dx
		sub	ax, [bp+var_26]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, word ptr [bp+var_1E]
		mov	al, es:[bx]
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_A1FBB
		push	4
		push	large dword_7CA62
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_1E]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_1FD93
		add	sp, 10h
		add	word_77962, 0Fh
		jmp	short loc_A1FED

loc_A1FBB:
		push	4
		push	large dword_7CA66
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_1E]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_1FF26
		add	sp, 10h
		add	word_77962, 12h

loc_A1FED:
		inc	si
		add	word ptr [bp+var_1E], 6

loc_A1FF2:
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Ch], si
		jle	short loc_A1FFE
		jmp	loc_A1F2E

loc_A1FFE:
		cmp	[bp+var_D], 0
		jz	short loc_A2022
		cmp	[bp+var_12], 0
		jz	short loc_A2022
		push	0
		mov	al, [bp+var_E]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A2022

loc_A2022:
		pop	di
		pop	si
		leave
		retf
sub_A1E40		endp
ovr267		ends
