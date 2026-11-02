ovr237		segment	para public 'OVERLAY' use16
		assume cs:ovr237
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD980		proc far

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	[bp+var_2], 0
		jmp	short loc_BD9B1

loc_BD98F:
		mov	ax, [bp+var_2]
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	dword ptr es:[bx+5Ah], 0
		les	bx, [bp+arg_0]
		add	bx, [bp+var_2]
		mov	byte ptr es:[bx+52h], 0
		inc	[bp+var_2]

loc_BD9B1:
		cmp	[bp+var_2], 8
		jl	short loc_BD98F
		push	0
		push	large 41544544h
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_BD9D1
		jmp	loc_BDB17

loc_BD9D1:
		mov	[bp+var_6], 304C564Ch
		mov	[bp+var_8], 0
		mov	[bp+var_A], 0
		jmp	loc_BDB01

loc_BD9E6:
		push	0
		push	large [bp+var_6]
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_BD9FE
		jmp	loc_BDAF6

loc_BD9FE:
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	dx, [bp+var_8]
		shl	dx, 2
		les	bx, [bp+arg_0]
		add	bx, dx
		mov	es:[bx+5Ah], eax
		mov	bx, [bp+arg_4]
		mov	eax, [bx+72h]
		add	eax, 0FFFFFFFCh
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	[bp+var_10], ax
		mov	ax, [bp+var_8]
		shl	ax, 1
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, [bp+var_10]
		mov	es:[bx+42h], ax
		push	1
		push	0
		push	2
		mov	ax, [bp+var_10]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	bx, [bp+var_8]
		shl	bx, 2
		les	si, [bp+arg_0]
		add	si, bx
		mov	es:[si+24h], dx
		mov	es:[si+22h], ax
		les	bx, [bp+arg_0]
		add	bx, [bp+var_8]
		mov	byte ptr es:[bx+52h], 1
		push	large [bp+var_E]
		mov	ax, [bp+var_8]
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		push	word ptr es:[bx+24h]
		push	word ptr es:[bx+22h]
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	ax, [bp+var_8]
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+24h]
		mov	dx, es:[bx+22h]
		mov	[bp+var_12], ax
		mov	[bp+var_14], dx
		xor	di, di
		jmp	short loc_BDAEE

loc_BDACD:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		push	es
		les	si, [bp+var_14]
		mov	ax, es:[si]
		shl	ax, 1
		add	bx, ax
		pop	es
		mov	ax, es:[bx]
		les	bx, [bp+var_14]
		mov	es:[bx], ax
		inc	di
		add	[bp+var_14], 2

loc_BDAEE:
		cmp	di, [bp+var_10]
		jl	short loc_BDACD
		inc	[bp+var_8]

loc_BDAF6:
		add	[bp+var_6], 1000000h
		inc	[bp+var_A]

loc_BDB01:
		cmp	[bp+var_A], 8
		jge	short loc_BDB0A
		jmp	loc_BD9E6

loc_BDB0A:
		push	[bp+arg_4]
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		jmp	short loc_BDB49

loc_BDB17:
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+5Ah], 0
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Eh]
		les	bx, [bp+arg_0]
		mov	es:[bx+22h], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+42h], ax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+52h], 0

loc_BDB49:
		pop	di
		pop	si
		leave
		retf
sub_BD980		endp
ovr237		ends
