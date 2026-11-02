seg045		segment	para public 'CODE' use16
		assume cs:seg045
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B662		proc far

var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		enter	10h, 0
		push	si
		push	di
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_C]
		mov	cx, 3
		rep movsd
		mov	bx, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	ax, [bp+arg_8]
		mov	ah, al
		mov	di, ax
		shl	eax, 10h
		mov	ax, di
		mov	[bp+var_10], eax
		mov	si, [bp+var_A]
		mov	es, [bp+var_C]
		mov	ax, [bp+arg_6]
		cmp	[bp+var_6], ax
		jg	short loc_1B6DD
		cmp	[bp+var_2], ax
		jl	short loc_1B6DD
		shl	ax, 1
		add	si, ax
		mov	ax, [bp+var_8]
		cmp	dx, ax
		jl	short loc_1B6DD
		cmp	bx, ax
		jge	short loc_1B6B2
		mov	bx, ax

loc_1B6B2:
		mov	ax, [bp+var_4]
		cmp	dx, ax
		jle	short loc_1B6BB
		mov	dx, ax

loc_1B6BB:
		cmp	bx, ax
		jg	short loc_1B6DD
		mov	cx, dx
		sub	cx, bx
		inc	cx
		mov	di, bx
		add	di, [si]
		mov	eax, [bp+var_10]
		movzx	ecx, cx
		ror	ecx, 2
		rep stosd
		shr	ecx, 1Eh
		rep stosb

loc_1B6DD:
		pop	di
		pop	si
		leave
		retf
sub_1B662		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B6E1		proc far

var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		enter	46h, 0
		push	si
		push	di
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_C]
		mov	cx, 3
		rep movsd
		mov	bx, [bp+arg_2]
		mov	ax, [bx]
		mov	word ptr [bp+var_18], ax
		mov	ax, [bx+2]
		mov	word ptr [bp+var_18+2], ax
		mov	bx, [bp+arg_4]
		mov	ax, [bx]
		mov	word ptr [bp+var_14], ax
		mov	ax, [bx+2]
		mov	word ptr [bp+var_14+2], ax
		mov	bx, [bp+arg_6]
		mov	ax, [bx]
		mov	word ptr [bp+var_10], ax
		mov	ax, [bx+2]
		mov	word ptr [bp+var_10+2], ax
		mov	bx, [bp+arg_2]
		mov	ax, [bx+4]
		mov	ah, al
		mov	di, ax
		shl	eax, 10h
		mov	ax, di
		mov	[bp+var_1C], eax
		mov	ax, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_18+2], ax
		jnz	short loc_1B776
		cmp	word ptr [bp+var_10+2], ax
		jnz	short loc_1B776
		mov	ax, word ptr [bp+var_18]
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_10]
		cmp	ax, bx
		jle	short loc_1B751
		nop
		nop
		xchg	bx, ax

loc_1B751:
		cmp	bx, cx
		jle	short loc_1B760
		nop
		nop
		xchg	cx, bx
		cmp	ax, bx
		jle	short loc_1B760
		nop
		nop
		xchg	bx, ax

loc_1B760:
		push	large [bp+var_1C]
		push	word ptr [bp+var_18+2]
		push	cx
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1B662
		add	sp, 0Ch
		jmp	loc_1BD5E

loc_1B776:
		mov	eax, [bp+var_18]
		mov	ebx, [bp+var_14]
		mov	ecx, [bp+var_10]
		cmp	eax, ecx
		jle	short loc_1B791
		cmp	ebx, ecx
		jl	short loc_1B791
		xchg	ecx, eax
		jmp	short loc_1B798
		nop

loc_1B791:
		cmp	eax, ebx
		jle	short loc_1B798
		xchg	ebx, eax

loc_1B798:
		cmp	ebx, ecx
		jle	short loc_1B7A0
		xchg	ecx, ebx

loc_1B7A0:
		mov	[bp+var_18], eax
		mov	[bp+var_14], ebx
		mov	[bp+var_10], ecx
		mov	si, [bp+var_8]
		mov	di, [bp+var_4]
		xor	dx, dx
		dec	dx
		cmp	ax, si
		jl	short loc_1B7C3
		nop
		nop
		inc	dx
		cmp	ax, di
		jle	short loc_1B7C3
		nop
		nop
		inc	dx

loc_1B7C3:
		mov	[bp+var_1E], dx
		xor	dx, dx
		dec	dx
		cmp	bx, si
		jl	short loc_1B7D7
		nop
		nop
		inc	dx
		cmp	bx, di
		jle	short loc_1B7D7
		nop
		nop
		inc	dx

loc_1B7D7:
		mov	[bp+var_20], dx
		xor	dx, dx
		dec	dx
		cmp	cx, si
		jl	short loc_1B7EB
		nop
		nop
		inc	dx
		cmp	cx, di
		jle	short loc_1B7EB
		nop
		nop
		inc	dx

loc_1B7EB:
		mov	[bp+var_22], dx
		or	dx, [bp+var_20]
		or	dx, [bp+var_1E]
		mov	[bp+var_24], dx
		mov	ax, word ptr [bp+var_18+2]
		cmp	[bp+var_2], ax
		jl	short loc_1B819
		mov	ax, word ptr [bp+var_10+2]
		cmp	[bp+var_6], ax
		jg	short loc_1B819
		mov	ax, [bp+var_1E]
		cmp	ax, 0
		jz	short loc_1B81C
		cmp	[bp+var_20], ax
		jnz	short loc_1B81C
		cmp	[bp+var_22], ax
		jnz	short loc_1B81C

loc_1B819:
		jmp	loc_1BD5E

loc_1B81C:
		mov	ax, word ptr [bp+var_18]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		xor	eax, eax
		mov	cx, [bp+var_1E]
		or	cx, cx
		jz	short loc_1B841
		nop
		nop
		cmp	[bp+var_22], cx
		jz	short loc_1B85A
		nop
		nop

loc_1B841:
		mov	ax, word ptr [bp+var_10]
		sub	ax, word ptr [bp+var_18]
		shl	eax, 10h
		cdq
		mov	bx, word ptr [bp+var_10+2]
		sub	bx, word ptr [bp+var_18+2]
		movsx	ebx, bx
		idiv	ebx

loc_1B85A:
		mov	[bp+var_34], eax
		xor	eax, eax
		mov	cx, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_10+2], cx
		jz	short loc_1B893
		cmp	[bp+var_2], cx
		jle	short loc_1B893
		mov	cx, [bp+var_20]
		or	cx, cx
		jz	short loc_1B87A
		cmp	[bp+var_22], cx
		jz	short loc_1B893

loc_1B87A:
		mov	ax, word ptr [bp+var_10]
		sub	ax, word ptr [bp+var_14]
		shl	eax, 10h
		cdq
		mov	bx, word ptr [bp+var_10+2]
		sub	bx, word ptr [bp+var_14+2]
		movsx	ebx, bx
		idiv	ebx

loc_1B893:
		mov	[bp+var_38], eax
		mov	cx, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_18+2], cx
		jnz	short loc_1B8BA
		nop
		nop
		mov	ax, word ptr [bp+var_14]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp+var_28], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_30], eax
		jmp	short loc_1B8F4
		nop

loc_1B8BA:
		xor	eax, eax
		mov	cx, word ptr [bp+var_14+2]
		cmp	[bp+var_6], cx
		jg	short loc_1B8F0
		nop
		nop
		mov	cx, [bp+var_1E]
		or	cx, cx
		jz	short loc_1B8D7
		nop
		nop
		cmp	[bp+var_20], cx
		jz	short loc_1B8F0
		nop
		nop

loc_1B8D7:
		mov	ax, word ptr [bp+var_14]
		sub	ax, word ptr [bp+var_18]
		shl	eax, 10h
		cdq
		mov	bx, word ptr [bp+var_14+2]
		sub	bx, word ptr [bp+var_18+2]
		movsx	ebx, bx
		idiv	ebx

loc_1B8F0:
		mov	[bp+var_30], eax

loc_1B8F4:
		mov	ax, word ptr [bp+var_18+2]
		mov	[bp+var_3A], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_3C], ax
		xor	ebx, ebx
		cmp	[bp+var_24], bx
		jnz	short loc_1B90D
		nop
		nop
		jmp	loc_1BA36

loc_1B90D:
		cmp	[bp+var_1E], bx
		jl	short loc_1B917
		nop
		nop
		jmp	loc_1B998

loc_1B917:
		cmp	[bp+var_20], bx
		jge	short loc_1B956
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_1B94A
		nop
		nop
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_1B94A
		nop
		nop
		mov	edx, [bp+var_34]
		cmp	[bp+var_38], edx
		jge	short loc_1B94A
		nop
		nop
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]
		mov	[bp+var_3A], dx
		jmp	short loc_1B950
		nop

loc_1B94A:
		mov	cx, word ptr [bp+var_18]
		mov	dx, word ptr [bp+var_18+2]

loc_1B950:
		mov	ax, [bp+var_8]
		jmp	loc_1B9DE

loc_1B956:
		mov	ax, word ptr [bp+var_18+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_1B998
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_1B989
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jle	short loc_1B97F
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_1B992
		nop

loc_1B97F:
		mov	ax, word ptr [bp+var_18]
		cmp	word ptr [bp+var_10], ax
		jnz	short loc_1B98C
		nop
		nop

loc_1B989:
		jmp	loc_1BA36

loc_1B98C:
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_1B992:
		mov	ax, [bp+var_8]
		jmp	loc_1BA2A

loc_1B998:
		cmp	[bp+var_1E], bx
		jg	short loc_1B9A2
		nop
		nop
		jmp	loc_1BA36

loc_1B9A2:
		cmp	[bp+var_20], bx
		jle	short loc_1B9F0
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_1B9D5
		nop
		nop
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_1B9D5
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_38], eax
		jle	short loc_1B9D5
		nop
		nop
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]
		mov	[bp+var_3A], dx
		jmp	short loc_1B9DB
		nop

loc_1B9D5:
		mov	cx, word ptr [bp+var_18]
		mov	dx, word ptr [bp+var_18+2]

loc_1B9DB:
		mov	ax, [bp+var_4]

loc_1B9DE:
		sub	ax, cx
		mov	bx, word ptr [bp+var_10]
		sub	bx, cx
		mov	cx, word ptr [bp+var_10+2]
		sub	cx, dx
		mov	[bp+var_42], cx
		jmp	short loc_1BA36
		nop

loc_1B9F0:
		mov	ax, word ptr [bp+var_18+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_1BA36
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_1BA36
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jge	short loc_1BA19
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_1BA27
		nop

loc_1BA19:
		cmp	[bp+var_22], 1
		jz	short loc_1BA36
		nop
		nop
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_1BA27:
		mov	ax, [bp+var_4]

loc_1BA2A:
		sub	ax, word ptr [bp+var_18]
		sub	bx, word ptr [bp+var_18]
		sub	cx, word ptr [bp+var_18+2]
		mov	[bp+var_42], cx

loc_1BA36:
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_1BA4B
		mov	ax, [bp+var_6]
		cmp	[bp+var_3A], ax
		jge	short loc_1BABE
		jmp	short loc_1BA74
		nop

loc_1BA4B:
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, [bp+var_42]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		mov	cx, ax
		mov	dx, cx
		add	dx, [bp+var_3A]
		mov	ax, [bp+var_6]
		cmp	ax, dx
		jle	short loc_1BA79
		nop
		nop

loc_1BA74:
		sub	ax, [bp+var_3A]
		mov	cx, ax

loc_1BA79:
		add	[bp+var_3A], cx
		mov	cx, [bp+var_3A]
		sub	cx, word ptr [bp+var_18+2]
		movsx	ecx, cx
		mov	eax, [bp+var_34]
		imul	ecx
		add	[bp+var_2C], eax
		mov	dx, [bp+var_3A]
		sub	dx, word ptr [bp+var_14+2]
		jl	short loc_1BAB3
		nop
		nop
		mov	cx, dx
		mov	eax, [bp+var_38]
		mov	[bp+var_30], eax
		mov	ax, word ptr [bp+var_14]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp+var_28], eax

loc_1BAB3:
		mov	eax, [bp+var_30]
		imul	ecx
		add	[bp+var_28], eax

loc_1BABE:
		xor	ebx, ebx
		cmp	[bp+var_24], bx
		jnz	short loc_1BACB
		nop
		nop
		jmp	loc_1BC1F

loc_1BACB:
		cmp	[bp+var_22], bx
		jl	short loc_1BAD5
		nop
		nop
		jmp	loc_1BB60

loc_1BAD5:
		cmp	[bp+var_20], bx
		jge	short loc_1BB23
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_1BB05
		nop
		nop
		mov	ax, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_18+2], ax
		jz	short loc_1BB05
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jle	short loc_1BB05
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_1BB0B
		nop

loc_1BB05:
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_1BB0B:
		mov	ax, [bp+var_8]

loc_1BB0E:
		sub	ax, word ptr [bp+var_18]
		sub	bx, word ptr [bp+var_18]
		sub	cx, word ptr [bp+var_18+2]
		mov	[bp+var_42], cx
		mov	dx, word ptr [bp+var_18+2]
		mov	[bp+var_3C], dx

loc_1BB20:
		jmp	loc_1BBF4

loc_1BB23:
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_1BB60
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_1BB20
		mov	ax, word ptr [bp+var_10]
		cmp	word ptr [bp+var_18], ax
		jz	short loc_1BB54
		nop
		nop
		mov	eax, [bp+var_38]
		cmp	[bp+var_34], eax
		jge	short loc_1BB54
		nop
		nop
		mov	cx, word ptr [bp+var_18]
		mov	dx, word ptr [bp+var_18+2]
		jmp	short loc_1BB5A
		nop

loc_1BB54:
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]

loc_1BB5A:
		mov	ax, [bp+var_8]
		jmp	loc_1BBE2

loc_1BB60:
		cmp	[bp+var_22], bx
		jg	short loc_1BB6A
		nop
		nop
		jmp	loc_1BBF4

loc_1BB6A:
		cmp	[bp+var_20], bx
		jle	short loc_1BBA6
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_1BB9A
		nop
		nop
		mov	ax, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_18+2], ax
		jz	short loc_1BB9A
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jge	short loc_1BB9A
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_1BBA0
		nop

loc_1BB9A:
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_1BBA0:
		mov	ax, [bp+var_4]
		jmp	loc_1BB0E

loc_1BBA6:
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_1BBF4
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_1BBF4
		nop
		nop
		mov	ax, word ptr [bp+var_10]
		cmp	word ptr [bp+var_18], ax
		jz	short loc_1BBD9
		nop
		nop
		mov	eax, [bp+var_38]
		cmp	[bp+var_34], eax
		jle	short loc_1BBD9
		nop
		nop
		mov	cx, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		jmp	short loc_1BBDF
		nop

loc_1BBD9:
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]

loc_1BBDF:
		mov	ax, [bp+var_4]

loc_1BBE2:
		sub	ax, cx
		mov	bx, word ptr [bp+var_10]
		sub	bx, cx
		mov	cx, word ptr [bp+var_10+2]
		sub	cx, dx
		mov	[bp+var_42], cx
		mov	[bp+var_3C], dx

loc_1BBF4:
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_1BC03
		nop
		nop
		jmp	short loc_1BC1F
		nop

loc_1BC03:
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, [bp+var_42]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		add	[bp+var_3C], ax

loc_1BC1F:
		mov	si, word ptr [bp+var_28+2]
		mov	di, word ptr [bp+var_2C+2]
		mov	cx, word ptr [bp+var_10+2]
		cmp	[bp+var_3C], cx
		jl	short loc_1BC32
		nop
		nop
		mov	[bp+var_3C], cx

loc_1BC32:
		mov	ax, [bp+var_2]
		cmp	[bp+var_3C], ax
		jle	short loc_1BC3F
		nop
		nop
		mov	[bp+var_3C], ax

loc_1BC3F:
		mov	di, [bp+arg_0]
		mov	si, [di+2]
		mov	es, [di]
		mov	ax, [bp+var_3A]
		shl	ax, 1
		add	si, ax
		mov	ax, [bp+var_3C]
		sub	ax, [bp+var_3A]
		inc	ax
		mov	[bp+var_46], ax
		mov	ax, word ptr [bp+var_14+2]
		sub	ax, [bp+var_3A]
		inc	ax
		mov	[bp+var_44], ax
		mov	ebx, [bp+var_28]
		mov	edx, [bp+var_2C]
		mov	eax, [bp+var_30]
		mov	ecx, [bp+var_34]
		cmp	[bp+var_24], 0
		jz	short loc_1BCC9
		nop
		nop
		jmp	loc_1BD59

loc_1BC7D:
		push	ebx
		push	edx
		push	eax
		push	ecx
		shr	ebx, 10h
		shr	edx, 10h
		cmp	bx, dx
		jle	short loc_1BC95
		nop
		nop
		xchg	dx, bx

loc_1BC95:
		mov	cx, dx
		sub	cx, bx
		inc	cx
		mov	di, bx
		add	di, [si]
		mov	eax, [bp+var_1C]
		movzx	ecx, cx
		ror	ecx, 2
		rep stosd
		shr	ecx, 1Eh
		rep stosb
		add	si, 2
		pop	ecx
		pop	eax
		pop	edx
		pop	ebx
		dec	[bp+var_44]
		jz	short loc_1BCD1

loc_1BCC3:
		add	ebx, eax
		add	edx, ecx

loc_1BCC9:
		dec	[bp+var_46]
		jns	short loc_1BC7D
		jmp	loc_1BD5E

loc_1BCD1:
		mov	eax, [bp+var_38]
		mov	bx, word ptr [bp+var_14]
		shl	ebx, 10h
		mov	bx, 8000h
		jmp	short loc_1BCC3
		jmp	short loc_1BD5E
		nop

loc_1BCE4:
		push	ebx
		push	edx
		push	eax
		push	ecx
		shr	ebx, 10h
		shr	edx, 10h
		cmp	bx, dx
		jle	short loc_1BCFC
		nop
		nop
		xchg	dx, bx

loc_1BCFC:
		mov	ax, [bp+var_8]
		cmp	dx, ax
		jl	short loc_1BD34
		cmp	bx, ax
		jge	short loc_1BD09
		mov	bx, ax

loc_1BD09:
		mov	ax, [bp+var_4]
		cmp	dx, ax
		jle	short loc_1BD12
		mov	dx, ax

loc_1BD12:
		cmp	bx, ax
		jg	short loc_1BD34
		mov	cx, dx
		sub	cx, bx
		inc	cx
		mov	di, bx
		add	di, [si]
		mov	eax, [bp+var_1C]
		movzx	ecx, cx
		ror	ecx, 2
		rep stosd
		shr	ecx, 1Eh
		rep stosb

loc_1BD34:
		add	si, 2
		pop	ecx
		pop	eax
		pop	edx
		pop	ebx
		dec	[bp+var_44]
		jnz	short loc_1BD53
		mov	eax, [bp+var_38]
		mov	bx, word ptr [bp+var_14]
		shl	ebx, 10h
		add	bx, 8000h

loc_1BD53:
		add	ebx, eax
		add	edx, ecx

loc_1BD59:
		dec	[bp+var_46]
		jns	short loc_1BCE4

loc_1BD5E:
		pop	di
		pop	si
		leave
		retf
sub_1B6E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BD62		proc far

var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		enter	46h, 0
		push	si
		push	di
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_C]
		mov	cx, 3
		rep movsd
		mov	bx, [bp+arg_2]
		mov	ax, [bx]
		mov	word ptr [bp+var_18], ax
		mov	ax, [bx+2]
		mov	word ptr [bp+var_18+2], ax
		mov	bx, [bp+arg_4]
		mov	ax, [bx]
		mov	word ptr [bp+var_14], ax
		mov	ax, [bx+2]
		mov	word ptr [bp+var_14+2], ax
		mov	bx, [bp+arg_6]
		mov	ax, [bx]
		mov	word ptr [bp+var_10], ax
		mov	ax, [bx+2]
		mov	word ptr [bp+var_10+2], ax
		mov	ax, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_18+2], ax
		jnz	short loc_1BDE2
		cmp	word ptr [bp+var_10+2], ax
		jnz	short loc_1BDE2
		mov	ax, word ptr [bp+var_18]
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_10]
		cmp	ax, bx
		jle	short loc_1BDBE
		nop
		nop
		xchg	bx, ax

loc_1BDBE:
		cmp	bx, cx
		jle	short loc_1BDCD
		nop
		nop
		xchg	cx, bx
		cmp	ax, bx
		jle	short loc_1BDCD
		nop
		nop
		xchg	bx, ax

loc_1BDCD:
		push	[bp+arg_8]
		push	word ptr [bp+var_18+2]
		push	cx
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1B662
		add	sp, 0Ah
		jmp	loc_1C3ED

loc_1BDE2:
		mov	eax, [bp+var_18]
		mov	ebx, [bp+var_14]
		mov	ecx, [bp+var_10]
		cmp	eax, ecx
		jle	short loc_1BDFD
		cmp	ebx, ecx
		jl	short loc_1BDFD
		xchg	ecx, eax
		jmp	short loc_1BE04
		nop

loc_1BDFD:
		cmp	eax, ebx
		jle	short loc_1BE04
		xchg	ebx, eax

loc_1BE04:
		cmp	ebx, ecx
		jle	short loc_1BE0C
		xchg	ecx, ebx

loc_1BE0C:
		mov	[bp+var_18], eax
		mov	[bp+var_14], ebx
		mov	[bp+var_10], ecx
		mov	si, [bp+var_8]
		mov	di, [bp+var_4]
		xor	dx, dx
		dec	dx
		cmp	ax, si
		jl	short loc_1BE2F
		nop
		nop
		inc	dx
		cmp	ax, di
		jle	short loc_1BE2F
		nop
		nop
		inc	dx

loc_1BE2F:
		mov	[bp+var_1E], dx
		xor	dx, dx
		dec	dx
		cmp	bx, si
		jl	short loc_1BE43
		nop
		nop
		inc	dx
		cmp	bx, di
		jle	short loc_1BE43
		nop
		nop
		inc	dx

loc_1BE43:
		mov	[bp+var_20], dx
		xor	dx, dx
		dec	dx
		cmp	cx, si
		jl	short loc_1BE57
		nop
		nop
		inc	dx
		cmp	cx, di
		jle	short loc_1BE57
		nop
		nop
		inc	dx

loc_1BE57:
		mov	[bp+var_22], dx
		or	dx, [bp+var_20]
		or	dx, [bp+var_1E]
		mov	[bp+var_24], dx
		mov	ax, word ptr [bp+var_18+2]
		cmp	[bp+var_2], ax
		jl	short loc_1BE85
		mov	ax, word ptr [bp+var_10+2]
		cmp	[bp+var_6], ax
		jg	short loc_1BE85
		mov	ax, [bp+var_1E]
		cmp	ax, 0
		jz	short loc_1BE88
		cmp	[bp+var_20], ax
		jnz	short loc_1BE88
		cmp	[bp+var_22], ax
		jnz	short loc_1BE88

loc_1BE85:
		jmp	loc_1C3ED

loc_1BE88:
		mov	ax, word ptr [bp+var_18]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		xor	eax, eax
		mov	cx, [bp+var_1E]
		or	cx, cx
		jz	short loc_1BEAD
		nop
		nop
		cmp	[bp+var_22], cx
		jz	short loc_1BEC6
		nop
		nop

loc_1BEAD:
		mov	ax, word ptr [bp+var_10]
		sub	ax, word ptr [bp+var_18]
		shl	eax, 10h
		cdq
		mov	bx, word ptr [bp+var_10+2]
		sub	bx, word ptr [bp+var_18+2]
		movsx	ebx, bx
		idiv	ebx

loc_1BEC6:
		mov	[bp+var_34], eax
		xor	eax, eax
		mov	cx, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_10+2], cx
		jz	short loc_1BEFF
		cmp	[bp+var_2], cx
		jle	short loc_1BEFF
		mov	cx, [bp+var_20]
		or	cx, cx
		jz	short loc_1BEE6
		cmp	[bp+var_22], cx
		jz	short loc_1BEFF

loc_1BEE6:
		mov	ax, word ptr [bp+var_10]
		sub	ax, word ptr [bp+var_14]
		shl	eax, 10h
		cdq
		mov	bx, word ptr [bp+var_10+2]
		sub	bx, word ptr [bp+var_14+2]
		movsx	ebx, bx
		idiv	ebx

loc_1BEFF:
		mov	[bp+var_38], eax
		mov	cx, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_18+2], cx
		jnz	short loc_1BF26
		nop
		nop
		mov	ax, word ptr [bp+var_14]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp+var_28], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_30], eax
		jmp	short loc_1BF60
		nop

loc_1BF26:
		xor	eax, eax
		mov	cx, word ptr [bp+var_14+2]
		cmp	[bp+var_6], cx
		jg	short loc_1BF5C
		nop
		nop
		mov	cx, [bp+var_1E]
		or	cx, cx
		jz	short loc_1BF43
		nop
		nop
		cmp	[bp+var_20], cx
		jz	short loc_1BF5C
		nop
		nop

loc_1BF43:
		mov	ax, word ptr [bp+var_14]
		sub	ax, word ptr [bp+var_18]
		shl	eax, 10h
		cdq
		mov	bx, word ptr [bp+var_14+2]
		sub	bx, word ptr [bp+var_18+2]
		movsx	ebx, bx
		idiv	ebx

loc_1BF5C:
		mov	[bp+var_30], eax

loc_1BF60:
		mov	ax, word ptr [bp+var_18+2]
		mov	[bp+var_3A], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_3C], ax
		xor	ebx, ebx
		cmp	[bp+var_24], bx
		jnz	short loc_1BF79
		nop
		nop
		jmp	loc_1C0A2

loc_1BF79:
		cmp	[bp+var_1E], bx
		jl	short loc_1BF83
		nop
		nop
		jmp	loc_1C004

loc_1BF83:
		cmp	[bp+var_20], bx
		jge	short loc_1BFC2
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_1BFB6
		nop
		nop
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_1BFB6
		nop
		nop
		mov	edx, [bp+var_34]
		cmp	[bp+var_38], edx
		jge	short loc_1BFB6
		nop
		nop
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]
		mov	[bp+var_3A], dx
		jmp	short loc_1BFBC
		nop

loc_1BFB6:
		mov	cx, word ptr [bp+var_18]
		mov	dx, word ptr [bp+var_18+2]

loc_1BFBC:
		mov	ax, [bp+var_8]
		jmp	loc_1C04A

loc_1BFC2:
		mov	ax, word ptr [bp+var_18+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_1C004
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_1BFF5
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jle	short loc_1BFEB
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_1BFFE
		nop

loc_1BFEB:
		mov	ax, word ptr [bp+var_18]
		cmp	word ptr [bp+var_10], ax
		jnz	short loc_1BFF8
		nop
		nop

loc_1BFF5:
		jmp	loc_1C0A2

loc_1BFF8:
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_1BFFE:
		mov	ax, [bp+var_8]
		jmp	loc_1C096

loc_1C004:
		cmp	[bp+var_1E], bx
		jg	short loc_1C00E
		nop
		nop
		jmp	loc_1C0A2

loc_1C00E:
		cmp	[bp+var_20], bx
		jle	short loc_1C05C
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_1C041
		nop
		nop
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_1C041
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_38], eax
		jle	short loc_1C041
		nop
		nop
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]
		mov	[bp+var_3A], dx
		jmp	short loc_1C047
		nop

loc_1C041:
		mov	cx, word ptr [bp+var_18]
		mov	dx, word ptr [bp+var_18+2]

loc_1C047:
		mov	ax, [bp+var_4]

loc_1C04A:
		sub	ax, cx
		mov	bx, word ptr [bp+var_10]
		sub	bx, cx
		mov	cx, word ptr [bp+var_10+2]
		sub	cx, dx
		mov	[bp+var_42], cx
		jmp	short loc_1C0A2
		nop

loc_1C05C:
		mov	ax, word ptr [bp+var_18+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_1C0A2
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_1C0A2
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jge	short loc_1C085
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_1C093
		nop

loc_1C085:
		cmp	[bp+var_22], 1
		jz	short loc_1C0A2
		nop
		nop
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_1C093:
		mov	ax, [bp+var_4]

loc_1C096:
		sub	ax, word ptr [bp+var_18]
		sub	bx, word ptr [bp+var_18]
		sub	cx, word ptr [bp+var_18+2]
		mov	[bp+var_42], cx

loc_1C0A2:
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_1C0B7
		mov	ax, [bp+var_6]
		cmp	[bp+var_3A], ax
		jge	short loc_1C12A
		jmp	short loc_1C0E0
		nop

loc_1C0B7:
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, [bp+var_42]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		mov	cx, ax
		mov	dx, cx
		add	dx, [bp+var_3A]
		mov	ax, [bp+var_6]
		cmp	ax, dx
		jle	short loc_1C0E5
		nop
		nop

loc_1C0E0:
		sub	ax, [bp+var_3A]
		mov	cx, ax

loc_1C0E5:
		add	[bp+var_3A], cx
		mov	cx, [bp+var_3A]
		sub	cx, word ptr [bp+var_18+2]
		movsx	ecx, cx
		mov	eax, [bp+var_34]
		imul	ecx
		add	[bp+var_2C], eax
		mov	dx, [bp+var_3A]
		sub	dx, word ptr [bp+var_14+2]
		jl	short loc_1C11F
		nop
		nop
		mov	cx, dx
		mov	eax, [bp+var_38]
		mov	[bp+var_30], eax
		mov	ax, word ptr [bp+var_14]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp+var_28], eax

loc_1C11F:
		mov	eax, [bp+var_30]
		imul	ecx
		add	[bp+var_28], eax

loc_1C12A:
		xor	ebx, ebx
		cmp	[bp+var_24], bx
		jnz	short loc_1C137
		nop
		nop
		jmp	loc_1C28B

loc_1C137:
		cmp	[bp+var_22], bx
		jl	short loc_1C141
		nop
		nop
		jmp	loc_1C1CC

loc_1C141:
		cmp	[bp+var_20], bx
		jge	short loc_1C18F
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_1C171
		nop
		nop
		mov	ax, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_18+2], ax
		jz	short loc_1C171
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jle	short loc_1C171
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_1C177
		nop

loc_1C171:
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_1C177:
		mov	ax, [bp+var_8]

loc_1C17A:
		sub	ax, word ptr [bp+var_18]
		sub	bx, word ptr [bp+var_18]
		sub	cx, word ptr [bp+var_18+2]
		mov	[bp+var_42], cx
		mov	dx, word ptr [bp+var_18+2]
		mov	[bp+var_3C], dx

loc_1C18C:
		jmp	loc_1C260

loc_1C18F:
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_1C1CC
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_1C18C
		mov	ax, word ptr [bp+var_10]
		cmp	word ptr [bp+var_18], ax
		jz	short loc_1C1C0
		nop
		nop
		mov	eax, [bp+var_38]
		cmp	[bp+var_34], eax
		jge	short loc_1C1C0
		nop
		nop
		mov	cx, word ptr [bp+var_18]
		mov	dx, word ptr [bp+var_18+2]
		jmp	short loc_1C1C6
		nop

loc_1C1C0:
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]

loc_1C1C6:
		mov	ax, [bp+var_8]
		jmp	loc_1C24E

loc_1C1CC:
		cmp	[bp+var_22], bx
		jg	short loc_1C1D6
		nop
		nop
		jmp	loc_1C260

loc_1C1D6:
		cmp	[bp+var_20], bx
		jle	short loc_1C212
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_1C206
		nop
		nop
		mov	ax, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_18+2], ax
		jz	short loc_1C206
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jge	short loc_1C206
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_1C20C
		nop

loc_1C206:
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_1C20C:
		mov	ax, [bp+var_4]
		jmp	loc_1C17A

loc_1C212:
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_1C260
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_1C260
		nop
		nop
		mov	ax, word ptr [bp+var_10]
		cmp	word ptr [bp+var_18], ax
		jz	short loc_1C245
		nop
		nop
		mov	eax, [bp+var_38]
		cmp	[bp+var_34], eax
		jle	short loc_1C245
		nop
		nop
		mov	cx, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		jmp	short loc_1C24B
		nop

loc_1C245:
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]

loc_1C24B:
		mov	ax, [bp+var_4]

loc_1C24E:
		sub	ax, cx
		mov	bx, word ptr [bp+var_10]
		sub	bx, cx
		mov	cx, word ptr [bp+var_10+2]
		sub	cx, dx
		mov	[bp+var_42], cx
		mov	[bp+var_3C], dx

loc_1C260:
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_1C26F
		nop
		nop
		jmp	short loc_1C28B
		nop

loc_1C26F:
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, [bp+var_42]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		add	[bp+var_3C], ax

loc_1C28B:
		mov	si, word ptr [bp+var_28+2]
		mov	di, word ptr [bp+var_2C+2]
		mov	cx, word ptr [bp+var_10+2]
		cmp	[bp+var_3C], cx
		jl	short loc_1C29E
		nop
		nop
		mov	[bp+var_3C], cx

loc_1C29E:
		mov	ax, [bp+var_2]
		cmp	[bp+var_3C], ax
		jle	short loc_1C2AB
		nop
		nop
		mov	[bp+var_3C], ax

loc_1C2AB:
		mov	di, [bp+arg_0]
		mov	si, [di+2]
		mov	es, [di]
		mov	ax, [bp+var_3A]
		shl	ax, 1
		add	si, ax
		mov	ax, [bp+var_3C]
		sub	ax, [bp+var_3A]
		mov	[bp+var_46], ax
		mov	ax, word ptr [bp+var_14+2]
		sub	ax, [bp+var_3A]
		inc	ax
		mov	[bp+var_44], ax
		mov	ebx, [bp+var_28]
		mov	edx, [bp+var_2C]
		mov	eax, [bp+var_30]
		mov	ecx, [bp+var_34]
		cmp	[bp+var_24], 0
		jz	short loc_1C347
		nop
		nop
		jmp	loc_1C3E6

loc_1C2E8:
		push	ebx
		push	edx
		push	eax
		push	ecx
		shr	ebx, 10h
		shr	edx, 10h
		cmp	bx, dx
		jle	short loc_1C300
		nop
		nop
		xchg	dx, bx

loc_1C300:
		mov	cx, dx
		sub	cx, bx
		jnz	short loc_1C309
		nop
		nop
		inc	cx

loc_1C309:
		mov	di, bx
		add	di, [si]
		push	ds
		lds	bx, [bp+arg_8]
		test	di, 1
		jz	short loc_1C31E
		mov	al, es:[di]
		xlatb
		stosb
		jmp	short loc_1C32B

loc_1C31E:
		mov	ax, es:[di]
		xlatb
		xchg	al, ah
		xlatb
		xchg	ah, al
		dec	cx
		jz	short loc_1C32F
		stosw

loc_1C32B:
		loop	short loc_1C31E
		jmp	short loc_1C330

loc_1C32F:
		stosb

loc_1C330:
		pop	ds
		add	si, 2
		pop	ecx
		pop	eax
		pop	edx
		pop	ebx
		dec	[bp+var_44]
		jz	short loc_1C34F

loc_1C341:
		add	ebx, eax
		add	edx, ecx

loc_1C347:
		dec	[bp+var_46]
		jns	short loc_1C2E8
		jmp	loc_1C3ED

loc_1C34F:
		mov	eax, [bp+var_38]
		mov	bx, word ptr [bp+var_14]
		shl	ebx, 10h
		mov	bx, 8000h
		jmp	short loc_1C341
		jmp	loc_1C3ED

loc_1C362:
		push	ebx
		push	edx
		push	ax
		push	cx
		shr	ebx, 10h
		shr	edx, 10h
		cmp	bx, dx
		jle	short loc_1C378
		nop
		nop
		xchg	dx, bx

loc_1C378:
		mov	ax, [bp+var_8]
		cmp	dx, ax
		jl	short loc_1C3C3
		cmp	bx, ax
		jge	short loc_1C385
		mov	bx, ax

loc_1C385:
		mov	ax, [bp+var_4]
		cmp	dx, ax
		jle	short loc_1C38E
		mov	dx, ax

loc_1C38E:
		cmp	bx, ax
		jg	short loc_1C3C3
		mov	cx, dx
		sub	cx, bx
		jnz	short loc_1C39B
		nop
		nop
		inc	cx

loc_1C39B:
		mov	di, bx
		add	di, [si]
		push	ds
		lds	bx, [bp+arg_8]
		test	di, 1
		jz	short loc_1C3B0
		mov	al, es:[di]
		xlatb
		stosb
		jmp	short loc_1C3BD

loc_1C3B0:
		mov	ax, es:[di]
		xlatb
		xchg	al, ah
		xlatb
		xchg	ah, al
		dec	cx
		jz	short loc_1C3C1
		stosw

loc_1C3BD:
		loop	short loc_1C3B0
		jmp	short loc_1C3C2

loc_1C3C1:
		stosb

loc_1C3C2:
		pop	ds

loc_1C3C3:
		add	si, 2
		pop	cx
		pop	ax
		pop	edx
		pop	ebx
		dec	[bp+var_44]
		jnz	short loc_1C3E0
		mov	eax, [bp+var_38]
		mov	bx, word ptr [bp+var_14]
		shl	ebx, 10h
		add	bx, 8000h

loc_1C3E0:
		add	ebx, eax
		add	edx, ecx

loc_1C3E6:
		dec	[bp+var_46]
		jns	loc_1C362

loc_1C3ED:
		pop	di
		pop	si
		leave
		retf
sub_1BD62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C3F1		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		enter	18h, 0
		push	si
		push	di
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_C]
		mov	cx, 3
		rep movsd
		mov	bx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		mov	ax, [bp+arg_4]
		mov	cx, [bp+arg_8]
		mov	es, [bp+var_C]
		mov	si, [bp+arg_A]
		cmp	[bp+var_6], si
		jg	loc_1C4EC
		cmp	[bp+var_2], si
		jl	loc_1C4EC
		shl	si, 1
		add	si, [bp+var_A]
		mov	di, [bp+var_8]
		cmp	dx, di
		jl	loc_1C4EC
		cmp	bx, di
		jge	short loc_1C43C
		nop
		nop
		mov	bx, di

loc_1C43C:
		mov	di, [bp+var_4]
		cmp	dx, di
		jle	short loc_1C447
		nop
		nop
		mov	dx, di

loc_1C447:
		cmp	bx, di
		jg	loc_1C4EC
		mov	di, bx
		mov	bx, cx
		mov	cx, dx
		mov	dx, ax
		sub	cx, di
		inc	cx
		add	di, [si]
		push	si
		xor	bh, bh
		xor	dh, dh
		mov	si, bx
		sub	si, dx
		jnz	short loc_1C474
		mov	al, bl
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		jmp	short loc_1C4EB
		nop

loc_1C474:
		mov	ah, 1
		jns	short loc_1C47E
		nop
		nop
		neg	ah
		neg	si

loc_1C47E:
		inc	si
		mov	al, dl
		cmp	si, cx
		jl	short loc_1C4B0
		nop
		nop
		mov	bx, cx
		mov	dx, si
		dec	dx
		jmp	short loc_1C4A9
		nop

loc_1C48F:
		add	al, ah
		sub	dx, bx
		js	short loc_1C4A7
		add	al, ah
		sub	dx, bx
		js	short loc_1C4A7
		add	al, ah
		sub	dx, bx
		js	short loc_1C4A7
		add	al, ah
		sub	dx, bx
		jns	short loc_1C48F

loc_1C4A7:
		add	dx, si

loc_1C4A9:
		stosb
		dec	cx
		jnz	short loc_1C48F
		jmp	short loc_1C4EB
		nop

loc_1C4B0:
		mov	bx, si
		mov	si, cx
		mov	dx, si
		dec	dx

loc_1C4B7:
		cmp	cx, 4
		jl	short loc_1C4DD
		stosb
		sub	dx, bx
		js	short loc_1C4D3
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_1C4D3
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_1C4D3
		dec	cx
		stosb
		sub	dx, bx
		jns	short loc_1C4D7

loc_1C4D3:
		add	dx, si
		add	al, ah

loc_1C4D7:
		dec	cx
		jnz	short loc_1C4B7
		jmp	short loc_1C4EB
		nop

loc_1C4DD:
		stosb
		sub	dx, bx
		jns	short loc_1C4E8
		nop
		nop
		add	dx, si
		add	al, ah

loc_1C4E8:
		dec	cx
		jnz	short loc_1C4DD

loc_1C4EB:
		pop	si

loc_1C4EC:
		pop	di
		pop	si
		leave
		retf
sub_1C3F1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1C4F0		proc far

var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= dword ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
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
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		enter	4Eh, 0
		push	si
		push	di
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_C]
		mov	cx, 3
		rep movsd
		mov	bx, [bp+arg_2]
		mov	ax, [bx]
		mov	word ptr [bp+var_1E], ax
		mov	ax, [bx+2]
		mov	word ptr [bp+var_1E+2], ax
		mov	bx, [bp+arg_4]
		mov	ax, [bx]
		mov	word ptr [bp+var_1A], ax
		mov	ax, [bx+2]
		mov	word ptr [bp+var_1A+2], ax
		mov	bx, [bp+arg_6]
		mov	ax, [bx]
		mov	word ptr [bp+var_16], ax
		mov	ax, [bx+2]
		mov	word ptr [bp+var_16+2], ax
		mov	bx, [bp+arg_2]
		mov	al, [bx+4]
		mov	[bp+var_12], ax
		mov	bx, [bp+arg_4]
		mov	al, [bx+4]
		mov	[bp+var_10], ax
		mov	bx, [bp+arg_6]
		mov	al, [bx+4]
		mov	[bp+var_E], ax
		mov	ax, word ptr [bp+var_1A+2]
		cmp	word ptr [bp+var_1E+2], ax
		jnz	short loc_1C599
		cmp	word ptr [bp+var_16+2], ax
		jnz	short loc_1C599
		mov	ax, word ptr [bp+var_1E]
		mov	si, [bp+var_12]
		mov	bx, word ptr [bp+var_1A]
		mov	dx, [bp+var_10]
		mov	cx, word ptr [bp+var_16]
		mov	di, [bp+var_E]
		cmp	ax, bx
		jle	short loc_1C572
		nop
		nop
		xchg	bx, ax
		xchg	dx, si

loc_1C572:
		cmp	bx, cx
		jle	short loc_1C585
		nop
		nop
		xchg	cx, bx
		xchg	di, dx
		cmp	ax, bx
		jle	short loc_1C585
		nop
		nop
		xchg	bx, ax
		xchg	dx, si

loc_1C585:
		push	word ptr [bp+var_1E+2]
		push	di
		push	cx
		push	si
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1C3F1
		add	sp, 0Ch
		jmp	loc_1CD34

loc_1C599:
		mov	eax, [bp+var_1E]
		mov	ebx, [bp+var_1A]
		mov	ecx, [bp+var_16]
		cmp	eax, ecx
		jle	short loc_1C5BD
		cmp	ebx, ecx
		jl	short loc_1C5BD
		xchg	ecx, eax
		mov	dx, [bp+var_E]
		xchg	[bp+var_12], dx
		mov	[bp+var_E], dx
		jmp	short loc_1C5CD
		nop

loc_1C5BD:
		cmp	eax, ebx
		jle	short loc_1C5CD
		xchg	ebx, eax
		mov	dx, [bp+var_10]
		xchg	[bp+var_12], dx
		mov	[bp+var_10], dx

loc_1C5CD:
		cmp	ebx, ecx
		jle	short loc_1C5DE
		xchg	ecx, ebx
		mov	dx, [bp+var_E]
		xchg	[bp+var_10], dx
		mov	[bp+var_E], dx

loc_1C5DE:
		mov	[bp+var_1E], eax
		mov	[bp+var_1A], ebx
		mov	[bp+var_16], ecx
		mov	si, [bp+var_8]
		mov	di, [bp+var_4]
		xor	dx, dx
		dec	dx
		cmp	ax, si
		jl	short loc_1C601
		nop
		nop
		inc	dx
		cmp	ax, di
		jle	short loc_1C601
		nop
		nop
		inc	dx

loc_1C601:
		mov	[bp+var_42], dx
		xor	dx, dx
		dec	dx
		cmp	bx, si
		jl	short loc_1C615
		nop
		nop
		inc	dx
		cmp	bx, di
		jle	short loc_1C615
		nop
		nop
		inc	dx

loc_1C615:
		mov	[bp+var_44], dx
		xor	dx, dx
		dec	dx
		cmp	cx, si
		jl	short loc_1C629
		nop
		nop
		inc	dx
		cmp	cx, di
		jle	short loc_1C629
		nop
		nop
		inc	dx

loc_1C629:
		mov	[bp+var_46], dx
		or	dx, [bp+var_44]
		or	dx, [bp+var_42]
		mov	[bp+var_48], dx
		mov	ax, word ptr [bp+var_1E+2]
		cmp	[bp+var_2], ax
		jl	short loc_1C657
		mov	ax, word ptr [bp+var_16+2]
		cmp	[bp+var_6], ax
		jg	short loc_1C657
		mov	ax, [bp+var_42]
		cmp	ax, 0
		jz	short loc_1C65A
		cmp	[bp+var_44], ax
		jnz	short loc_1C65A
		cmp	[bp+var_46], ax
		jnz	short loc_1C65A

loc_1C657:
		jmp	loc_1CD34

loc_1C65A:
		mov	ax, word ptr [bp+var_1E]
		shl	eax, 10h
		add	ax, 8000h
		mov	[bp+var_26], eax
		mov	[bp+var_32], eax
		mov	ax, [bp+var_12]
		shl	ax, 8
		add	ax, 80h
		mov	[bp+var_2C], ax
		mov	[bp+var_38], ax
		xor	eax, eax
		mov	bx, word ptr [bp+var_16+2]
		sub	bx, word ptr [bp+var_1E+2]
		mov	ax, [bp+var_E]
		sub	ax, [bp+var_12]
		cwd
		mov	ah, al
		xor	al, al
		idiv	bx
		mov	[bp+var_3A], ax
		mov	ax, word ptr [bp+var_16]
		sub	ax, word ptr [bp+var_1E]
		shl	eax, 10h
		cdq
		mov	bx, word ptr [bp+var_16+2]
		sub	bx, word ptr [bp+var_1E+2]
		movsx	ebx, bx
		idiv	ebx
		mov	[bp+var_36], eax
		xor	eax, eax
		mov	bx, word ptr [bp+var_16+2]
		mov	cx, word ptr [bp+var_1A+2]
		sub	bx, cx
		jz	short loc_1C6EA
		nop
		nop
		cmp	[bp+var_2], cx
		jle	short loc_1C6EA
		nop
		nop
		mov	ax, [bp+var_E]
		sub	ax, [bp+var_10]
		cwd
		mov	ah, al
		xor	al, al
		idiv	bx
		mov	[bp+var_40], ax
		mov	ax, word ptr [bp+var_16]
		sub	ax, word ptr [bp+var_1A]
		shl	eax, 10h
		cdq
		movsx	ebx, bx
		idiv	ebx

loc_1C6EA:
		mov	[bp+var_3E], eax
		mov	bx, word ptr [bp+var_1A+2]
		sub	bx, word ptr [bp+var_1E+2]
		jnz	short loc_1C723
		nop
		nop
		mov	ax, word ptr [bp+var_1A]
		shl	eax, 10h
		add	ax, 8000h
		mov	[bp+var_26], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_2A], eax
		mov	ax, [bp+var_10]
		shl	ax, 8
		add	ax, 80h
		mov	[bp+var_2C], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_2E], ax
		jmp	short loc_1C756
		nop

loc_1C723:
		xor	eax, eax
		mov	cx, word ptr [bp+var_1A+2]
		cmp	[bp+var_6], cx
		jg	short loc_1C743
		nop
		nop
		mov	ax, word ptr [bp+var_1A]
		sub	ax, word ptr [bp+var_1E]
		shl	eax, 10h
		cdq
		movsx	ebx, bx
		idiv	ebx

loc_1C743:
		mov	[bp+var_2A], eax
		mov	ax, [bp+var_10]
		sub	ax, [bp+var_12]
		cwd
		shl	ax, 8
		idiv	bx
		mov	[bp+var_2E], ax

loc_1C756:
		mov	ax, word ptr [bp+var_1E+2]
		mov	[bp+var_20], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_22], ax
		xor	ebx, ebx
		cmp	[bp+var_48], bx
		jnz	short loc_1C76F
		nop
		nop
		jmp	loc_1C898

loc_1C76F:
		cmp	[bp+var_42], bx
		jl	short loc_1C779
		nop
		nop
		jmp	loc_1C7FA

loc_1C779:
		cmp	[bp+var_44], bx
		jge	short loc_1C7B8
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_1A+2], ax
		jg	short loc_1C7AC
		nop
		nop
		mov	ax, word ptr [bp+var_16+2]
		cmp	word ptr [bp+var_1A+2], ax
		jz	short loc_1C7AC
		nop
		nop
		mov	edx, [bp+var_36]
		cmp	[bp+var_3E], edx
		jge	short loc_1C7AC
		nop
		nop
		mov	cx, word ptr [bp+var_1A]
		mov	dx, word ptr [bp+var_1A+2]
		mov	[bp+var_20], dx
		jmp	short loc_1C7B2
		nop

loc_1C7AC:
		mov	cx, word ptr [bp+var_1E]
		mov	dx, word ptr [bp+var_1E+2]

loc_1C7B2:
		mov	ax, [bp+var_8]
		jmp	loc_1C840

loc_1C7B8:
		mov	ax, word ptr [bp+var_1E+2]
		cmp	word ptr [bp+var_1A+2], ax
		jz	short loc_1C7FA
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_1A+2], ax
		jl	short loc_1C7EB
		nop
		nop
		mov	eax, [bp+var_36]
		cmp	[bp+var_2A], eax
		jle	short loc_1C7E1
		nop
		nop
		mov	bx, word ptr [bp+var_1A]
		mov	cx, word ptr [bp+var_1A+2]
		jmp	short loc_1C7F4
		nop

loc_1C7E1:
		mov	ax, word ptr [bp+var_1E]
		cmp	word ptr [bp+var_16], ax
		jnz	short loc_1C7EE
		nop
		nop

loc_1C7EB:
		jmp	loc_1C898

loc_1C7EE:
		mov	bx, word ptr [bp+var_16]
		mov	cx, word ptr [bp+var_16+2]

loc_1C7F4:
		mov	ax, [bp+var_8]
		jmp	loc_1C88C

loc_1C7FA:
		cmp	[bp+var_42], bx
		jg	short loc_1C804
		nop
		nop
		jmp	loc_1C898

loc_1C804:
		cmp	[bp+var_44], bx
		jle	short loc_1C852
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_1A+2], ax
		jg	short loc_1C837
		nop
		nop
		mov	ax, word ptr [bp+var_16+2]
		cmp	word ptr [bp+var_1A+2], ax
		jz	short loc_1C837
		nop
		nop
		mov	eax, [bp+var_36]
		cmp	[bp+var_3E], eax
		jle	short loc_1C837
		nop
		nop
		mov	cx, word ptr [bp+var_1A]
		mov	dx, word ptr [bp+var_1A+2]
		mov	[bp+var_20], dx
		jmp	short loc_1C83D
		nop

loc_1C837:
		mov	cx, word ptr [bp+var_1E]
		mov	dx, word ptr [bp+var_1E+2]

loc_1C83D:
		mov	ax, [bp+var_4]

loc_1C840:
		sub	ax, cx
		mov	bx, word ptr [bp+var_16]
		sub	bx, cx
		mov	cx, word ptr [bp+var_16+2]
		sub	cx, dx
		mov	[bp+var_4E], cx
		jmp	short loc_1C898
		nop

loc_1C852:
		mov	ax, word ptr [bp+var_1E+2]
		cmp	word ptr [bp+var_1A+2], ax
		jz	short loc_1C898
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_1A+2], ax
		jl	short loc_1C898
		nop
		nop
		mov	eax, [bp+var_36]
		cmp	[bp+var_2A], eax
		jge	short loc_1C87B
		nop
		nop
		mov	bx, word ptr [bp+var_1A]
		mov	cx, word ptr [bp+var_1A+2]
		jmp	short loc_1C889
		nop

loc_1C87B:
		cmp	[bp+var_46], 1
		jz	short loc_1C898
		nop
		nop
		mov	bx, word ptr [bp+var_16]
		mov	cx, word ptr [bp+var_16+2]

loc_1C889:
		mov	ax, [bp+var_4]

loc_1C88C:
		sub	ax, word ptr [bp+var_1E]
		sub	bx, word ptr [bp+var_1E]
		sub	cx, word ptr [bp+var_1E+2]
		mov	[bp+var_4E], cx

loc_1C898:
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_1C8B1
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	[bp+var_20], ax
		jge	loc_1C946
		jmp	short loc_1C8DA
		nop

loc_1C8B1:
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, [bp+var_4E]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		mov	cx, ax
		mov	dx, cx
		add	dx, [bp+var_20]
		mov	ax, [bp+var_6]
		cmp	ax, dx
		jle	short loc_1C8DF
		nop
		nop

loc_1C8DA:
		sub	ax, [bp+var_20]
		mov	cx, ax

loc_1C8DF:
		add	[bp+var_20], cx
		mov	cx, [bp+var_20]
		sub	cx, word ptr [bp+var_1E+2]
		movsx	ecx, cx
		mov	ax, [bp+var_3A]
		imul	cx
		add	[bp+var_38], ax
		mov	eax, [bp+var_36]
		imul	ecx
		add	[bp+var_32], eax
		mov	dx, [bp+var_20]
		sub	dx, word ptr [bp+var_1A+2]
		jl	short loc_1C933
		nop
		nop
		mov	cx, dx
		mov	eax, [bp+var_3E]
		mov	[bp+var_2A], eax
		mov	ax, word ptr [bp+var_1A]
		shl	eax, 10h
		add	ax, 8000h
		mov	[bp+var_26], eax
		mov	ax, [bp+var_40]
		mov	[bp+var_2E], ax
		mov	ax, [bp+var_10]
		shl	ax, 8
		add	ax, 80h
		mov	[bp+var_2C], ax

loc_1C933:
		mov	ax, [bp+var_2E]
		imul	cx
		add	[bp+var_2C], ax
		mov	eax, [bp+var_2A]
		imul	ecx
		add	[bp+var_26], eax

loc_1C946:
		xor	ebx, ebx
		cmp	[bp+var_48], bx
		jnz	short loc_1C953
		nop
		nop
		jmp	loc_1CAA7

loc_1C953:
		cmp	[bp+var_46], bx
		jl	short loc_1C95D
		nop
		nop
		jmp	loc_1C9E8

loc_1C95D:
		cmp	[bp+var_44], bx
		jge	short loc_1C9AB
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_1A+2], ax
		jl	short loc_1C98D
		nop
		nop
		mov	ax, word ptr [bp+var_1A+2]
		cmp	word ptr [bp+var_1E+2], ax
		jz	short loc_1C98D
		nop
		nop
		mov	eax, [bp+var_36]
		cmp	[bp+var_2A], eax
		jle	short loc_1C98D
		nop
		nop
		mov	bx, word ptr [bp+var_1A]
		mov	cx, word ptr [bp+var_1A+2]
		jmp	short loc_1C993
		nop

loc_1C98D:
		mov	bx, word ptr [bp+var_16]
		mov	cx, word ptr [bp+var_16+2]

loc_1C993:
		mov	ax, [bp+var_8]

loc_1C996:
		sub	ax, word ptr [bp+var_1E]
		sub	bx, word ptr [bp+var_1E]
		sub	cx, word ptr [bp+var_1E+2]
		mov	[bp+var_4E], cx
		mov	dx, word ptr [bp+var_1E+2]
		mov	[bp+var_22], dx

loc_1C9A8:
		jmp	loc_1CA7C

loc_1C9AB:
		mov	ax, word ptr [bp+var_16+2]
		cmp	word ptr [bp+var_1A+2], ax
		jz	short loc_1C9E8
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_1A+2], ax
		jg	short loc_1C9A8
		mov	ax, word ptr [bp+var_16]
		cmp	word ptr [bp+var_1E], ax
		jz	short loc_1C9DC
		nop
		nop
		mov	eax, [bp+var_3E]
		cmp	[bp+var_36], eax
		jge	short loc_1C9DC
		nop
		nop
		mov	cx, word ptr [bp+var_1E]
		mov	dx, word ptr [bp+var_1E+2]
		jmp	short loc_1C9E2
		nop

loc_1C9DC:
		mov	cx, word ptr [bp+var_1A]
		mov	dx, word ptr [bp+var_1A+2]

loc_1C9E2:
		mov	ax, [bp+var_8]
		jmp	loc_1CA6A

loc_1C9E8:
		cmp	[bp+var_46], bx
		jg	short loc_1C9F2
		nop
		nop
		jmp	loc_1CA7C

loc_1C9F2:
		cmp	[bp+var_44], bx
		jle	short loc_1CA2E
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_1A+2], ax
		jl	short loc_1CA22
		nop
		nop
		mov	ax, word ptr [bp+var_1A+2]
		cmp	word ptr [bp+var_1E+2], ax
		jz	short loc_1CA22
		nop
		nop
		mov	eax, [bp+var_36]
		cmp	[bp+var_2A], eax
		jge	short loc_1CA22
		nop
		nop
		mov	bx, word ptr [bp+var_1A]
		mov	cx, word ptr [bp+var_1A+2]
		jmp	short loc_1CA28
		nop

loc_1CA22:
		mov	bx, word ptr [bp+var_16]
		mov	cx, word ptr [bp+var_16+2]

loc_1CA28:
		mov	ax, [bp+var_4]
		jmp	loc_1C996

loc_1CA2E:
		mov	ax, word ptr [bp+var_16+2]
		cmp	word ptr [bp+var_1A+2], ax
		jz	short loc_1CA7C
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_1A+2], ax
		jg	short loc_1CA7C
		nop
		nop
		mov	ax, word ptr [bp+var_16]
		cmp	word ptr [bp+var_1E], ax
		jz	short loc_1CA61
		nop
		nop
		mov	eax, [bp+var_3E]
		cmp	[bp+var_36], eax
		jle	short loc_1CA61
		nop
		nop
		mov	cx, word ptr [bp+var_16]
		mov	dx, word ptr [bp+var_16+2]
		jmp	short loc_1CA67
		nop

loc_1CA61:
		mov	cx, word ptr [bp+var_1A]
		mov	dx, word ptr [bp+var_1A+2]

loc_1CA67:
		mov	ax, [bp+var_4]

loc_1CA6A:
		sub	ax, cx
		mov	bx, word ptr [bp+var_16]
		sub	bx, cx
		mov	cx, word ptr [bp+var_16+2]
		sub	cx, dx
		mov	[bp+var_4E], cx
		mov	[bp+var_22], dx

loc_1CA7C:
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_1CA8B
		nop
		nop
		jmp	short loc_1CAA7
		nop

loc_1CA8B:
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, [bp+var_4E]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		add	[bp+var_22], ax

loc_1CAA7:
		mov	si, word ptr [bp+var_26+2]
		mov	di, word ptr [bp+var_32+2]
		mov	cx, word ptr [bp+var_16+2]
		cmp	[bp+var_22], cx
		jl	short loc_1CABA
		nop
		nop
		mov	[bp+var_22], cx

loc_1CABA:
		mov	ax, [bp+var_2]
		cmp	[bp+var_22], ax
		jle	short loc_1CAC7
		nop
		nop
		mov	[bp+var_22], ax

loc_1CAC7:
		mov	si, [bp+var_A]
		mov	es, [bp+var_C]
		mov	ax, [bp+var_20]
		shl	ax, 1
		add	si, ax
		mov	ax, [bp+var_22]
		sub	ax, [bp+var_20]
		inc	ax
		mov	[bp+var_4A], ax
		mov	ax, word ptr [bp+var_1A+2]
		sub	ax, [bp+var_20]
		inc	ax
		mov	[bp+var_4C], ax
		mov	ebx, [bp+var_26]
		mov	edx, [bp+var_32]
		mov	eax, [bp+var_2A]
		mov	ecx, [bp+var_36]
		cmp	[bp+var_48], 0
		jz	loc_1CC02
		jmp	loc_1CD2D

loc_1CB03:
		push	ebx
		push	edx
		shr	ebx, 10h
		shr	edx, 10h
		mov	al, byte ptr [bp+var_2C+1]
		mov	cl, byte ptr [bp+var_38+1]
		cmp	bx, dx
		jle	short loc_1CB1E
		nop
		nop
		xchg	dx, bx
		xchg	cx, ax

loc_1CB1E:
		mov	di, bx
		mov	bx, cx
		mov	cx, dx
		mov	dx, ax
		sub	cx, di
		inc	cx
		add	di, [si]
		push	si
		xor	bh, bh
		xor	dh, dh
		mov	si, bx
		sub	si, dx
		jnz	short loc_1CB45
		mov	al, bl
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		jmp	short loc_1CBBC
		nop

loc_1CB45:
		mov	ah, 1
		jns	short loc_1CB4F
		nop
		nop
		neg	ah
		neg	si

loc_1CB4F:
		inc	si
		mov	al, dl
		cmp	si, cx
		jl	short loc_1CB81
		nop
		nop
		mov	bx, cx
		mov	dx, si
		dec	dx
		jmp	short loc_1CB7A
		nop

loc_1CB60:
		add	al, ah
		sub	dx, bx
		js	short loc_1CB78
		add	al, ah
		sub	dx, bx
		js	short loc_1CB78
		add	al, ah
		sub	dx, bx
		js	short loc_1CB78
		add	al, ah
		sub	dx, bx
		jns	short loc_1CB60

loc_1CB78:
		add	dx, si

loc_1CB7A:
		stosb
		dec	cx
		jnz	short loc_1CB60
		jmp	short loc_1CBBC
		nop

loc_1CB81:
		mov	bx, si
		mov	si, cx
		mov	dx, si
		dec	dx

loc_1CB88:
		cmp	cx, 4
		jl	short loc_1CBAE
		stosb
		sub	dx, bx
		js	short loc_1CBA4
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_1CBA4
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_1CBA4
		dec	cx
		stosb
		sub	dx, bx
		jns	short loc_1CBA8

loc_1CBA4:
		add	dx, si
		add	al, ah

loc_1CBA8:
		dec	cx
		jnz	short loc_1CB88
		jmp	short loc_1CBBC
		nop

loc_1CBAE:
		stosb
		sub	dx, bx
		jns	short loc_1CBB9
		nop
		nop
		add	dx, si
		add	al, ah

loc_1CBB9:
		dec	cx
		jnz	short loc_1CBAE

loc_1CBBC:
		pop	si
		add	si, 2
		pop	edx
		pop	ebx
		dec	[bp+var_4C]
		jnz	short loc_1CBEE
		mov	eax, [bp+var_3E]
		mov	[bp+var_2A], eax
		mov	ax, [bp+var_40]
		mov	[bp+var_2E], ax
		mov	bx, word ptr [bp+var_1A]
		shl	ebx, 10h
		add	bx, 8000h
		mov	ax, [bp+var_10]
		shl	ax, 8
		add	ax, 80h
		mov	[bp+var_2C], ax

loc_1CBEE:
		add	ebx, [bp+var_2A]
		mov	ax, [bp+var_2E]
		add	[bp+var_2C], ax
		add	edx, [bp+var_36]
		mov	ax, [bp+var_3A]
		add	[bp+var_38], ax

loc_1CC02:
		dec	[bp+var_4A]
		jns	loc_1CB03
		jmp	loc_1CD34
		push	ebx
		push	edx
		shr	ebx, 10h
		shr	edx, 10h
		mov	al, byte ptr [bp+var_2C+1]
		mov	cl, byte ptr [bp+var_38+1]
		cmp	bx, dx
		jle	short loc_1CC27
		nop
		nop
		xchg	dx, bx
		xchg	cx, ax

loc_1CC27:
		mov	di, [bp+var_8]
		cmp	dx, di
		jl	loc_1CCE8
		cmp	bx, di
		jge	short loc_1CC38
		nop
		nop
		mov	bx, di

loc_1CC38:
		mov	di, [bp+var_4]
		cmp	dx, di
		jle	short loc_1CC43
		nop
		nop
		mov	dx, di

loc_1CC43:
		cmp	bx, di
		jg	loc_1CCE8
		mov	di, bx
		mov	bx, cx
		mov	cx, dx
		mov	dx, ax
		sub	cx, di
		inc	cx
		add	di, [si]
		push	si
		xor	bh, bh
		xor	dh, dh
		mov	si, bx
		sub	si, dx
		jnz	short loc_1CC70
		mov	al, bl
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		jmp	short loc_1CCE7
		nop

loc_1CC70:
		mov	ah, 1
		jns	short loc_1CC7A
		nop
		nop
		neg	ah
		neg	si

loc_1CC7A:
		inc	si
		mov	al, dl
		cmp	si, cx
		jl	short loc_1CCAC
		nop
		nop
		mov	bx, cx
		mov	dx, si
		dec	dx
		jmp	short loc_1CCA5
		nop

loc_1CC8B:
		add	al, ah
		sub	dx, bx
		js	short loc_1CCA3
		add	al, ah
		sub	dx, bx
		js	short loc_1CCA3
		add	al, ah
		sub	dx, bx
		js	short loc_1CCA3
		add	al, ah
		sub	dx, bx
		jns	short loc_1CC8B

loc_1CCA3:
		add	dx, si

loc_1CCA5:
		stosb
		dec	cx
		jnz	short loc_1CC8B
		jmp	short loc_1CCE7
		nop

loc_1CCAC:
		mov	bx, si
		mov	si, cx
		mov	dx, si
		dec	dx

loc_1CCB3:
		cmp	cx, 4
		jl	short loc_1CCD9
		stosb
		sub	dx, bx
		js	short loc_1CCCF
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_1CCCF
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_1CCCF
		dec	cx
		stosb
		sub	dx, bx
		jns	short loc_1CCD3

loc_1CCCF:
		add	dx, si
		add	al, ah

loc_1CCD3:
		dec	cx
		jnz	short loc_1CCB3
		jmp	short loc_1CCE7
		nop

loc_1CCD9:
		stosb
		sub	dx, bx
		jns	short loc_1CCE4
		nop
		nop
		add	dx, si
		add	al, ah

loc_1CCE4:
		dec	cx
		jnz	short loc_1CCD9

loc_1CCE7:
		pop	si

loc_1CCE8:
		add	si, 2
		pop	edx
		pop	ebx
		dec	[bp+var_4C]
		jnz	short loc_1CD19
		mov	eax, [bp+var_3E]
		mov	[bp+var_2A], eax
		mov	ax, [bp+var_40]
		mov	[bp+var_2E], ax
		mov	bx, word ptr [bp+var_1A]
		shl	ebx, 10h
		add	bx, 8000h
		mov	ax, [bp+var_10]
		shl	ax, 8
		add	ax, 80h
		mov	[bp+var_2C], ax

loc_1CD19:
		add	ebx, [bp+var_2A]
		mov	ax, [bp+var_2E]
		add	[bp+var_2C], ax
		add	edx, [bp+var_36]
		mov	ax, [bp+var_3A]
		add	[bp+var_38], ax

loc_1CD2D:
		dec	[bp+var_4A]
sub_1C4F0		endp
seg045		ends
