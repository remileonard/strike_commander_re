ovr214		segment	para public 'OVERLAY' use16
		assume cs:ovr214
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_76C00		proc far

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
		jmp	short loc_76C2A

loc_76C0C:
		mov	ax, dx
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	dword ptr es:[bx+68h], 0
		mov	bx, [bp+arg_0]
		add	bx, dx
		mov	byte ptr es:[bx+60h], 0
		inc	dx

loc_76C2A:
		cmp	dx, 8
		jl	short loc_76C0C
		push	0
		push	large 41544544h
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_76C49
		jmp	loc_76D8E

loc_76C49:
		mov	[bp+var_4], 304C564Ch
		xor	di, di
		mov	[bp+var_6], 0
		jmp	loc_76D7A

loc_76C5B:
		push	0
		push	large [bp+var_4]
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_76C73
		jmp	loc_76D6F

loc_76C73:
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupC_53FFD
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dx, di
		shl	dx, 2
		les	bx, [bp+arg_0]
		add	bx, dx
		mov	es:[bx+68h], eax
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
		mov	es:[bx+50h], ax
		push	1
		push	0
		push	2
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	bx, di
		shl	bx, 2
		les	si, [bp+arg_0]
		add	si, bx
		mov	es:[si+32h], dx
		mov	es:[si+30h], ax
		mov	ax, di
		shl	ax, 2
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+30h]
		or	ax, es:[bx+32h]
		jnz	short loc_76D04
		push	6009h
		call	sub_9D47
		pop	cx

loc_76D04:
		les	bx, [bp+arg_0]
		add	bx, di
		mov	byte ptr es:[bx+60h], 1
		push	large [bp+var_A]
		mov	ax, di
		shl	ax, 2
		mov	bx, [bp+arg_0]
		add	bx, ax
		push	large es:[bx+30h]
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+32h]
		mov	dx, es:[bx+30h]
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		xor	dx, dx
		jmp	short loc_76D69

loc_76D48:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+28h]
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

loc_76D69:
		cmp	dx, [bp+var_C]
		jl	short loc_76D48
		inc	di

loc_76D6F:
		add	[bp+var_4], 1000000h
		inc	[bp+var_6]

loc_76D7A:
		cmp	[bp+var_6], 8
		jge	short loc_76D83
		jmp	loc_76C5B

loc_76D83:
		push	[bp+arg_4]
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx
		jmp	short loc_76DB1

loc_76D8E:
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+68h], 0
		mov	eax, es:[bx+28h]
		mov	es:[bx+30h], eax
		mov	ax, es:[bx+26h]
		mov	es:[bx+50h], ax
		mov	byte ptr es:[bx+60h], 0

loc_76DB1:
		pop	di
		pop	si
		leave
		retf
sub_76C00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_76DB5		proc far

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
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jnz	short loc_76DD8
		jmp	loc_76E78

loc_76DD8:
		mov	eax, [di+72h]
		mov	ebx, 9
		cdq
		idiv	ebx
		mov	[bp+var_C], ax
		mov	[bp+var_E], 0
		jmp	short loc_76E64

loc_76DF1:
		push	large 0FFFFFFFFh
		push	large 9
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	di
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+20h]
		push	ax
		push	large es:[bx+1Ch]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		les	bx, es:[bx+28h]
		mov	si, [bp+var_A]
		shl	si, 1
		add	bx, si
		add	ax, es:[bx]
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		cmp	[bp+var_12], 0
		jz	short loc_76E58
		les	bx, word ptr [bp+var_12]
		mov	al, [bp+var_7]
		mov	es:[bx+3], al
		mov	al, [bp+var_6]
		and	ax, 1
		and	byte ptr es:[bx+2], 0FEh
		or	es:[bx+2], al
		jmp	short loc_76E61

loc_76E58:
		push	0FADEh
		call	sub_9D47
		pop	cx

loc_76E61:
		inc	[bp+var_E]

loc_76E64:
		mov	ax, [bp+var_E]
		cmp	ax, [bp+var_C]
		jl	short loc_76DF1
		mov	eax, [di+76h]
		mov	[di+65h], eax
		mov	byte ptr [di+6Dh], 0

loc_76E78:
		pop	di
		pop	si
		leave
		retf
sub_76DB5		endp
ovr214		ends
