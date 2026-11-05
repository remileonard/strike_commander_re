ovr271		segment	para public 'OVERLAY' use16
		assume cs:ovr271
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A3060		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		xor	dx, dx
		jmp	short loc_A308A

loc_A306C:
		mov	ax, dx
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	dword ptr es:[bx+5Ah], 0
		mov	bx, [bp+arg_0]
		add	bx, dx
		mov	byte ptr es:[bx+52h], 0
		inc	dx

loc_A308A:
		cmp	dx, 8
		jl	short loc_A306C
		push	0
		push	large 41544544h
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_A30A9
		jmp	loc_A31EE

loc_A30A9:
		mov	[bp+var_4], 304C564Ch
		xor	di, di
		mov	[bp+var_6], 0
		jmp	loc_A31DA

loc_A30BB:
		push	0
		push	large [bp+var_4]
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A30D3
		jmp	loc_A31CF

loc_A30D3:
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dx, di
		shl	dx, 2
		les	bx, [bp+arg_0]
		add	bx, dx
		mov	es:[bx+5Ah], eax
		mov	bx, [bp+arg_4]
		mov	eax, [bx+72h]
		add	eax, 0FFFFFFFCh
		mov	[bp+var_A], eax
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	[bp+var_C], ax
		mov	ax, di
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, [bp+var_C]
		mov	es:[bx+42h], ax
		push	1
		push	0
		push	2
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	bx, di
		shl	bx, 2
		les	si, [bp+arg_0]
		add	si, bx
		mov	es:[si+24h], dx
		mov	es:[si+22h], ax
		mov	ax, di
		shl	ax, 2
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+22h]
		or	ax, es:[bx+24h]
		jnz	short loc_A3164
		push	6009h
		call	sub_1DDFE
		pop	cx

loc_A3164:
		les	bx, [bp+arg_0]
		add	bx, di
		mov	byte ptr es:[bx+52h], 1
		push	large [bp+var_A]
		mov	ax, di
		shl	ax, 2
		mov	bx, [bp+arg_0]
		add	bx, ax
		push	large es:[bx+22h]
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+24h]
		mov	dx, es:[bx+22h]
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		xor	dx, dx
		jmp	short loc_A31C9

loc_A31A8:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		push	es
		les	si, [bp+var_10]
		mov	ax, es:[si]
		shl	ax, 1
		add	bx, ax
		pop	es
		mov	ax, es:[bx]
		les	bx, [bp+var_10]
		mov	es:[bx], ax
		inc	dx
		add	[bp+var_10], 2

loc_A31C9:
		cmp	dx, [bp+var_C]
		jl	short loc_A31A8
		inc	di

loc_A31CF:
		add	[bp+var_4], 1000000h
		inc	[bp+var_6]

loc_A31DA:
		cmp	[bp+var_6], 8
		jge	short loc_A31E3
		jmp	loc_A30BB

loc_A31E3:
		push	[bp+arg_4]
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		jmp	short loc_A3211

loc_A31EE:
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+5Ah], 0
		mov	eax, es:[bx+1Eh]
		mov	es:[bx+22h], eax
		mov	ax, es:[bx+1Ch]
		mov	es:[bx+42h], ax
		mov	byte ptr es:[bx+52h], 0

loc_A3211:
		pop	di
		pop	si
		leave
		retf
sub_A3060		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A3215		proc far

var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= byte ptr -6
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	di, [bp+arg_4]
		push	0
		push	large 52545441h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A3238
		jmp	loc_A32F6

loc_A3238:
		mov	eax, [di+72h]
		mov	ebx, 9
		cdq
		idiv	ebx
		mov	[bp+var_C], ax
		mov	[bp+var_E], 0
		jmp	loc_A32DF

loc_A3252:
		push	large 0FFFFFFFFh
		push	large 9
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	di
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		mov	si, [bp+var_A]
		shl	si, 1
		add	bx, si
		add	ax, es:[bx]
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		cmp	[bp+var_12], 0
		jz	short loc_A32D3
		les	bx, word ptr [bp+var_12]
		mov	al, [bp+var_7]
		mov	es:[bx+3], al
		mov	al, [bp+var_6]
		and	ax, 1
		and	byte ptr es:[bx+2], 0FEh
		or	es:[bx+2], al
		jmp	short loc_A32DC

loc_A32D3:
		push	0FADEh
		call	sub_1DDFE
		pop	cx

loc_A32DC:
		inc	[bp+var_E]

loc_A32DF:
		mov	ax, [bp+var_E]
		cmp	ax, [bp+var_C]
		jge	short loc_A32EA
		jmp	loc_A3252

loc_A32EA:
		mov	eax, [di+76h]
		mov	[di+65h], eax
		mov	byte ptr [di+6Dh], 0

loc_A32F6:
		pop	di
		pop	si
		leave
		retf
sub_A3215		endp
ovr271		ends
