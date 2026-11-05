ovr209		segment	para public 'OVERLAY' use16
		assume cs:ovr209
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_75C10		proc far

var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_10		= dword ptr -10h
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
		add	es:[bx+26h], di
		mov	eax, [si+72h]
		mov	[bp+var_16], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_1A+2], dx
		mov	word ptr [bp+var_1A], ax
		mov	eax, [bp+var_1A]
		mov	[bp+var_12], eax
		mov	byte ptr [bp+var_10+2], 2
		mov	byte ptr [bp+var_10+3], 1
		mov	[bp+var_C], 0
		mov	eax, [bp+var_16]
		mov	[bp+var_C], eax
		cmp	byte ptr [bp+var_10+2], 3
		jnz	short loc_75C91
		push	0
		mov	al, byte ptr [bp+var_10+2]
		push	ax
		push	large [bp+var_12]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_75C98

loc_75C91:
		mov	edx, [bp+var_10]
		mov	ax, word ptr [bp+var_12]

loc_75C98:
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_5407E
		add	sp, 6
		cmp	byte ptr [bp+var_10+2], 3
		jnz	short loc_75CC0
		push	0
		mov	al, byte ptr [bp+var_10+2]
		push	ax
		push	large [bp+var_12]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_75CC7

loc_75CC0:
		mov	edx, [bp+var_10]
		mov	ax, word ptr [bp+var_12]

loc_75CC7:
		mov	word ptr [bp+var_1E+2], dx
		mov	word ptr [bp+var_1E], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_22], eax
		push	0
		mov	al, es:[bx+20h]
		push	ax
		push	large es:[bx+1Ch]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	[bp+var_24], dx
		mov	[bp+var_26], ax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+26h]
		sub	si, di
		jmp	loc_75DE0

loc_75D1C:
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
		mov	ax, word_5C350
		xor	dx, dx
		sub	ax, [bp+var_26]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+28h]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, word ptr [bp+var_1E]
		mov	al, es:[bx]
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_75DA9
		push	4
		push	large dword_5FFB4
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_1E]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_2632C
		add	sp, 10h
		add	word_5C350, 0Fh
		jmp	short loc_75DDB

loc_75DA9:
		push	4
		push	large dword_5FFB8
		push	large word_5C350
		call	sub_3609
		add	sp, 0Ah
		push	large [bp+var_1E]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_5C350
		call	sub_26442
		add	sp, 10h
		add	word_5C350, 12h

loc_75DDB:
		inc	si
		add	word ptr [bp+var_1E], 6

loc_75DE0:
		les	bx, [bp+arg_0]
		cmp	es:[bx+26h], si
		jle	short loc_75DEC
		jmp	loc_75D1C

loc_75DEC:
		cmp	byte ptr [bp+var_10+3], 0
		jz	short loc_75E10
		cmp	[bp+var_12], 0
		jz	short loc_75E10
		push	0
		mov	al, byte ptr [bp+var_10+2]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_75E10

loc_75E10:
		pop	di
		pop	si
		leave
		retf
sub_75C10		endp
ovr209		ends
