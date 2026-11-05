seg059		segment	para public 'CODE' use16
		assume cs:seg059
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E9h, 66h, 3, 7Eh, 0E6h, 3, 76h, 0ECh, 0EBh, 0E0h

loc_28A1A:
		pop	di
		pop	si
		leave
		retf

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28A1E		proc far

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
		jg	short loc_28A99
		cmp	[bp+var_2], ax
		jl	short loc_28A99
		shl	ax, 1
		add	si, ax
		mov	ax, [bp+var_8]
		cmp	dx, ax
		jl	short loc_28A99
		cmp	bx, ax
		jge	short loc_28A6E
		mov	bx, ax

loc_28A6E:
		mov	ax, [bp+var_4]
		cmp	dx, ax
		jle	short loc_28A77
		mov	dx, ax

loc_28A77:
		cmp	bx, ax
		jg	short loc_28A99
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

loc_28A99:
		pop	di
		pop	si
		leave
		retf
sub_28A1E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28A9D		proc far

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
		jnz	short loc_28B32
		cmp	word ptr [bp+var_10+2], ax
		jnz	short loc_28B32
		mov	ax, word ptr [bp+var_18]
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_10]
		cmp	ax, bx
		jle	short loc_28B0D
		nop
		nop
		xchg	bx, ax

loc_28B0D:
		cmp	bx, cx
		jle	short loc_28B1C
		nop
		nop
		xchg	cx, bx
		cmp	ax, bx
		jle	short loc_28B1C
		nop
		nop
		xchg	bx, ax

loc_28B1C:
		push	large [bp+var_1C]
		push	word ptr [bp+var_18+2]
		push	cx
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_28A1E
		add	sp, 0Ch
		jmp	loc_2911A

loc_28B32:
		mov	eax, [bp+var_18]
		mov	ebx, [bp+var_14]
		mov	ecx, [bp+var_10]
		cmp	eax, ecx
		jle	short loc_28B4D
		cmp	ebx, ecx
		jl	short loc_28B4D
		xchg	ecx, eax
		jmp	short loc_28B54
		nop

loc_28B4D:
		cmp	eax, ebx
		jle	short loc_28B54
		xchg	ebx, eax

loc_28B54:
		cmp	ebx, ecx
		jle	short loc_28B5C
		xchg	ecx, ebx

loc_28B5C:
		mov	[bp+var_18], eax
		mov	[bp+var_14], ebx
		mov	[bp+var_10], ecx
		mov	si, [bp+var_8]
		mov	di, [bp+var_4]
		xor	dx, dx
		dec	dx
		cmp	ax, si
		jl	short loc_28B7F
		nop
		nop
		inc	dx
		cmp	ax, di
		jle	short loc_28B7F
		nop
		nop
		inc	dx

loc_28B7F:
		mov	[bp+var_1E], dx
		xor	dx, dx
		dec	dx
		cmp	bx, si
		jl	short loc_28B93
		nop
		nop
		inc	dx
		cmp	bx, di
		jle	short loc_28B93
		nop
		nop
		inc	dx

loc_28B93:
		mov	[bp+var_20], dx
		xor	dx, dx
		dec	dx
		cmp	cx, si
		jl	short loc_28BA7
		nop
		nop
		inc	dx
		cmp	cx, di
		jle	short loc_28BA7
		nop
		nop
		inc	dx

loc_28BA7:
		mov	[bp+var_22], dx
		or	dx, [bp+var_20]
		or	dx, [bp+var_1E]
		mov	[bp+var_24], dx
		mov	ax, word ptr [bp+var_18+2]
		cmp	[bp+var_2], ax
		jl	short loc_28BD5
		mov	ax, word ptr [bp+var_10+2]
		cmp	[bp+var_6], ax
		jg	short loc_28BD5
		mov	ax, [bp+var_1E]
		cmp	ax, 0
		jz	short loc_28BD8
		cmp	[bp+var_20], ax
		jnz	short loc_28BD8
		cmp	[bp+var_22], ax
		jnz	short loc_28BD8

loc_28BD5:
		jmp	loc_2911A

loc_28BD8:
		mov	ax, word ptr [bp+var_18]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		xor	eax, eax
		mov	cx, [bp+var_1E]
		or	cx, cx
		jz	short loc_28BFD
		nop
		nop
		cmp	[bp+var_22], cx
		jz	short loc_28C16
		nop
		nop

loc_28BFD:
		mov	ax, word ptr [bp+var_10]
		sub	ax, word ptr [bp+var_18]
		shl	eax, 10h
		cdq
		mov	bx, word ptr [bp+var_10+2]
		sub	bx, word ptr [bp+var_18+2]
		movsx	ebx, bx
		idiv	ebx

loc_28C16:
		mov	[bp+var_34], eax
		xor	eax, eax
		mov	cx, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_10+2], cx
		jz	short loc_28C4F
		cmp	[bp+var_2], cx
		jle	short loc_28C4F
		mov	cx, [bp+var_20]
		or	cx, cx
		jz	short loc_28C36
		cmp	[bp+var_22], cx
		jz	short loc_28C4F

loc_28C36:
		mov	ax, word ptr [bp+var_10]
		sub	ax, word ptr [bp+var_14]
		shl	eax, 10h
		cdq
		mov	bx, word ptr [bp+var_10+2]
		sub	bx, word ptr [bp+var_14+2]
		movsx	ebx, bx
		idiv	ebx

loc_28C4F:
		mov	[bp+var_38], eax
		mov	cx, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_18+2], cx
		jnz	short loc_28C76
		nop
		nop
		mov	ax, word ptr [bp+var_14]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp+var_28], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_30], eax
		jmp	short loc_28CB0
		nop

loc_28C76:
		xor	eax, eax
		mov	cx, word ptr [bp+var_14+2]
		cmp	[bp+var_6], cx
		jg	short loc_28CAC
		nop
		nop
		mov	cx, [bp+var_1E]
		or	cx, cx
		jz	short loc_28C93
		nop
		nop
		cmp	[bp+var_20], cx
		jz	short loc_28CAC
		nop
		nop

loc_28C93:
		mov	ax, word ptr [bp+var_14]
		sub	ax, word ptr [bp+var_18]
		shl	eax, 10h
		cdq
		mov	bx, word ptr [bp+var_14+2]
		sub	bx, word ptr [bp+var_18+2]
		movsx	ebx, bx
		idiv	ebx

loc_28CAC:
		mov	[bp+var_30], eax

loc_28CB0:
		mov	ax, word ptr [bp+var_18+2]
		mov	[bp+var_3A], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_3C], ax
		xor	ebx, ebx
		cmp	[bp+var_24], bx
		jnz	short loc_28CC9
		nop
		nop
		jmp	loc_28DF2

loc_28CC9:
		cmp	[bp+var_1E], bx
		jl	short loc_28CD3
		nop
		nop
		jmp	loc_28D54

loc_28CD3:
		cmp	[bp+var_20], bx
		jge	short loc_28D12
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_28D06
		nop
		nop
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_28D06
		nop
		nop
		mov	edx, [bp+var_34]
		cmp	[bp+var_38], edx
		jge	short loc_28D06
		nop
		nop
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]
		mov	[bp+var_3A], dx
		jmp	short loc_28D0C
		nop

loc_28D06:
		mov	cx, word ptr [bp+var_18]
		mov	dx, word ptr [bp+var_18+2]

loc_28D0C:
		mov	ax, [bp+var_8]
		jmp	loc_28D9A

loc_28D12:
		mov	ax, word ptr [bp+var_18+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_28D54
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_28D45
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jle	short loc_28D3B
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_28D4E
		nop

loc_28D3B:
		mov	ax, word ptr [bp+var_18]
		cmp	word ptr [bp+var_10], ax
		jnz	short loc_28D48
		nop
		nop

loc_28D45:
		jmp	loc_28DF2

loc_28D48:
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_28D4E:
		mov	ax, [bp+var_8]
		jmp	loc_28DE6

loc_28D54:
		cmp	[bp+var_1E], bx
		jg	short loc_28D5E
		nop
		nop
		jmp	loc_28DF2

loc_28D5E:
		cmp	[bp+var_20], bx
		jle	short loc_28DAC
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_28D91
		nop
		nop
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_28D91
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_38], eax
		jle	short loc_28D91
		nop
		nop
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]
		mov	[bp+var_3A], dx
		jmp	short loc_28D97
		nop

loc_28D91:
		mov	cx, word ptr [bp+var_18]
		mov	dx, word ptr [bp+var_18+2]

loc_28D97:
		mov	ax, [bp+var_4]

loc_28D9A:
		sub	ax, cx
		mov	bx, word ptr [bp+var_10]
		sub	bx, cx
		mov	cx, word ptr [bp+var_10+2]
		sub	cx, dx
		mov	[bp+var_42], cx
		jmp	short loc_28DF2
		nop

loc_28DAC:
		mov	ax, word ptr [bp+var_18+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_28DF2
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_28DF2
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jge	short loc_28DD5
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_28DE3
		nop

loc_28DD5:
		cmp	[bp+var_22], 1
		jz	short loc_28DF2
		nop
		nop
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_28DE3:
		mov	ax, [bp+var_4]

loc_28DE6:
		sub	ax, word ptr [bp+var_18]
		sub	bx, word ptr [bp+var_18]
		sub	cx, word ptr [bp+var_18+2]
		mov	[bp+var_42], cx

loc_28DF2:
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_28E07
		mov	ax, [bp+var_6]
		cmp	[bp+var_3A], ax
		jge	short loc_28E7A
		jmp	short loc_28E30
		nop

loc_28E07:
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
		jle	short loc_28E35
		nop
		nop

loc_28E30:
		sub	ax, [bp+var_3A]
		mov	cx, ax

loc_28E35:
		add	[bp+var_3A], cx
		mov	cx, [bp+var_3A]
		sub	cx, word ptr [bp+var_18+2]
		movsx	ecx, cx
		mov	eax, [bp+var_34]
		imul	ecx
		add	[bp+var_2C], eax
		mov	dx, [bp+var_3A]
		sub	dx, word ptr [bp+var_14+2]
		jl	short loc_28E6F
		nop
		nop
		mov	cx, dx
		mov	eax, [bp+var_38]
		mov	[bp+var_30], eax
		mov	ax, word ptr [bp+var_14]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp+var_28], eax

loc_28E6F:
		mov	eax, [bp+var_30]
		imul	ecx
		add	[bp+var_28], eax

loc_28E7A:
		xor	ebx, ebx
		cmp	[bp+var_24], bx
		jnz	short loc_28E87
		nop
		nop
		jmp	loc_28FDB

loc_28E87:
		cmp	[bp+var_22], bx
		jl	short loc_28E91
		nop
		nop
		jmp	loc_28F1C

loc_28E91:
		cmp	[bp+var_20], bx
		jge	short loc_28EDF
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_28EC1
		nop
		nop
		mov	ax, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_18+2], ax
		jz	short loc_28EC1
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jle	short loc_28EC1
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_28EC7
		nop

loc_28EC1:
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_28EC7:
		mov	ax, [bp+var_8]

loc_28ECA:
		sub	ax, word ptr [bp+var_18]
		sub	bx, word ptr [bp+var_18]
		sub	cx, word ptr [bp+var_18+2]
		mov	[bp+var_42], cx
		mov	dx, word ptr [bp+var_18+2]
		mov	[bp+var_3C], dx

loc_28EDC:
		jmp	loc_28FB0

loc_28EDF:
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_28F1C
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_28EDC
		mov	ax, word ptr [bp+var_10]
		cmp	word ptr [bp+var_18], ax
		jz	short loc_28F10
		nop
		nop
		mov	eax, [bp+var_38]
		cmp	[bp+var_34], eax
		jge	short loc_28F10
		nop
		nop
		mov	cx, word ptr [bp+var_18]
		mov	dx, word ptr [bp+var_18+2]
		jmp	short loc_28F16
		nop

loc_28F10:
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]

loc_28F16:
		mov	ax, [bp+var_8]
		jmp	loc_28F9E

loc_28F1C:
		cmp	[bp+var_22], bx
		jg	short loc_28F26
		nop
		nop
		jmp	loc_28FB0

loc_28F26:
		cmp	[bp+var_20], bx
		jle	short loc_28F62
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_28F56
		nop
		nop
		mov	ax, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_18+2], ax
		jz	short loc_28F56
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jge	short loc_28F56
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_28F5C
		nop

loc_28F56:
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_28F5C:
		mov	ax, [bp+var_4]
		jmp	loc_28ECA

loc_28F62:
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_28FB0
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_28FB0
		nop
		nop
		mov	ax, word ptr [bp+var_10]
		cmp	word ptr [bp+var_18], ax
		jz	short loc_28F95
		nop
		nop
		mov	eax, [bp+var_38]
		cmp	[bp+var_34], eax
		jle	short loc_28F95
		nop
		nop
		mov	cx, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		jmp	short loc_28F9B
		nop

loc_28F95:
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]

loc_28F9B:
		mov	ax, [bp+var_4]

loc_28F9E:
		sub	ax, cx
		mov	bx, word ptr [bp+var_10]
		sub	bx, cx
		mov	cx, word ptr [bp+var_10+2]
		sub	cx, dx
		mov	[bp+var_42], cx
		mov	[bp+var_3C], dx

loc_28FB0:
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_28FBF
		nop
		nop
		jmp	short loc_28FDB
		nop

loc_28FBF:
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, [bp+var_42]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		add	[bp+var_3C], ax

loc_28FDB:
		mov	si, word ptr [bp+var_28+2]
		mov	di, word ptr [bp+var_2C+2]
		mov	cx, word ptr [bp+var_10+2]
		cmp	[bp+var_3C], cx
		jl	short loc_28FEE
		nop
		nop
		mov	[bp+var_3C], cx

loc_28FEE:
		mov	ax, [bp+var_2]
		cmp	[bp+var_3C], ax
		jle	short loc_28FFB
		nop
		nop
		mov	[bp+var_3C], ax

loc_28FFB:
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
		jz	short loc_29085
		nop
		nop
		jmp	loc_29115

loc_29039:
		push	ebx
		push	edx
		push	eax
		push	ecx
		shr	ebx, 10h
		shr	edx, 10h
		cmp	bx, dx
		jle	short loc_29051
		nop
		nop
		xchg	dx, bx

loc_29051:
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
		jz	short loc_2908D

loc_2907F:
		add	ebx, eax
		add	edx, ecx

loc_29085:
		dec	[bp+var_46]
		jns	short loc_29039
		jmp	loc_2911A

loc_2908D:
		mov	eax, [bp+var_38]
		mov	bx, word ptr [bp+var_14]
		shl	ebx, 10h
		mov	bx, 8000h
		jmp	short loc_2907F
		jmp	short loc_2911A
		nop

loc_290A0:
		push	ebx
		push	edx
		push	eax
		push	ecx
		shr	ebx, 10h
		shr	edx, 10h
		cmp	bx, dx
		jle	short loc_290B8
		nop
		nop
		xchg	dx, bx

loc_290B8:
		mov	ax, [bp+var_8]
		cmp	dx, ax
		jl	short loc_290F0
		cmp	bx, ax
		jge	short loc_290C5
		mov	bx, ax

loc_290C5:
		mov	ax, [bp+var_4]
		cmp	dx, ax
		jle	short loc_290CE
		mov	dx, ax

loc_290CE:
		cmp	bx, ax
		jg	short loc_290F0
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

loc_290F0:
		add	si, 2
		pop	ecx
		pop	eax
		pop	edx
		pop	ebx
		dec	[bp+var_44]
		jnz	short loc_2910F
		mov	eax, [bp+var_38]
		mov	bx, word ptr [bp+var_14]
		shl	ebx, 10h
		add	bx, 8000h

loc_2910F:
		add	ebx, eax
		add	edx, ecx

loc_29115:
		dec	[bp+var_46]
		jns	short loc_290A0

loc_2911A:
		pop	di
		pop	si
		leave
		retf
sub_28A9D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2911E		proc far

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
		jnz	short loc_2919E
		cmp	word ptr [bp+var_10+2], ax
		jnz	short loc_2919E
		mov	ax, word ptr [bp+var_18]
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_10]
		cmp	ax, bx
		jle	short loc_2917A
		nop
		nop
		xchg	bx, ax

loc_2917A:
		cmp	bx, cx
		jle	short loc_29189
		nop
		nop
		xchg	cx, bx
		cmp	ax, bx
		jle	short loc_29189
		nop
		nop
		xchg	bx, ax

loc_29189:
		push	[bp+arg_8]
		push	word ptr [bp+var_18+2]
		push	cx
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_28A1E
		add	sp, 0Ah
		jmp	loc_297A9

loc_2919E:
		mov	eax, [bp+var_18]
		mov	ebx, [bp+var_14]
		mov	ecx, [bp+var_10]
		cmp	eax, ecx
		jle	short loc_291B9
		cmp	ebx, ecx
		jl	short loc_291B9
		xchg	ecx, eax
		jmp	short loc_291C0
		nop

loc_291B9:
		cmp	eax, ebx
		jle	short loc_291C0
		xchg	ebx, eax

loc_291C0:
		cmp	ebx, ecx
		jle	short loc_291C8
		xchg	ecx, ebx

loc_291C8:
		mov	[bp+var_18], eax
		mov	[bp+var_14], ebx
		mov	[bp+var_10], ecx
		mov	si, [bp+var_8]
		mov	di, [bp+var_4]
		xor	dx, dx
		dec	dx
		cmp	ax, si
		jl	short loc_291EB
		nop
		nop
		inc	dx
		cmp	ax, di
		jle	short loc_291EB
		nop
		nop
		inc	dx

loc_291EB:
		mov	[bp+var_1E], dx
		xor	dx, dx
		dec	dx
		cmp	bx, si
		jl	short loc_291FF
		nop
		nop
		inc	dx
		cmp	bx, di
		jle	short loc_291FF
		nop
		nop
		inc	dx

loc_291FF:
		mov	[bp+var_20], dx
		xor	dx, dx
		dec	dx
		cmp	cx, si
		jl	short loc_29213
		nop
		nop
		inc	dx
		cmp	cx, di
		jle	short loc_29213
		nop
		nop
		inc	dx

loc_29213:
		mov	[bp+var_22], dx
		or	dx, [bp+var_20]
		or	dx, [bp+var_1E]
		mov	[bp+var_24], dx
		mov	ax, word ptr [bp+var_18+2]
		cmp	[bp+var_2], ax
		jl	short loc_29241
		mov	ax, word ptr [bp+var_10+2]
		cmp	[bp+var_6], ax
		jg	short loc_29241
		mov	ax, [bp+var_1E]
		cmp	ax, 0
		jz	short loc_29244
		cmp	[bp+var_20], ax
		jnz	short loc_29244
		cmp	[bp+var_22], ax
		jnz	short loc_29244

loc_29241:
		jmp	loc_297A9

loc_29244:
		mov	ax, word ptr [bp+var_18]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		xor	eax, eax
		mov	cx, [bp+var_1E]
		or	cx, cx
		jz	short loc_29269
		nop
		nop
		cmp	[bp+var_22], cx
		jz	short loc_29282
		nop
		nop

loc_29269:
		mov	ax, word ptr [bp+var_10]
		sub	ax, word ptr [bp+var_18]
		shl	eax, 10h
		cdq
		mov	bx, word ptr [bp+var_10+2]
		sub	bx, word ptr [bp+var_18+2]
		movsx	ebx, bx
		idiv	ebx

loc_29282:
		mov	[bp+var_34], eax
		xor	eax, eax
		mov	cx, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_10+2], cx
		jz	short loc_292BB
		cmp	[bp+var_2], cx
		jle	short loc_292BB
		mov	cx, [bp+var_20]
		or	cx, cx
		jz	short loc_292A2
		cmp	[bp+var_22], cx
		jz	short loc_292BB

loc_292A2:
		mov	ax, word ptr [bp+var_10]
		sub	ax, word ptr [bp+var_14]
		shl	eax, 10h
		cdq
		mov	bx, word ptr [bp+var_10+2]
		sub	bx, word ptr [bp+var_14+2]
		movsx	ebx, bx
		idiv	ebx

loc_292BB:
		mov	[bp+var_38], eax
		mov	cx, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_18+2], cx
		jnz	short loc_292E2
		nop
		nop
		mov	ax, word ptr [bp+var_14]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp+var_28], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_30], eax
		jmp	short loc_2931C
		nop

loc_292E2:
		xor	eax, eax
		mov	cx, word ptr [bp+var_14+2]
		cmp	[bp+var_6], cx
		jg	short loc_29318
		nop
		nop
		mov	cx, [bp+var_1E]
		or	cx, cx
		jz	short loc_292FF
		nop
		nop
		cmp	[bp+var_20], cx
		jz	short loc_29318
		nop
		nop

loc_292FF:
		mov	ax, word ptr [bp+var_14]
		sub	ax, word ptr [bp+var_18]
		shl	eax, 10h
		cdq
		mov	bx, word ptr [bp+var_14+2]
		sub	bx, word ptr [bp+var_18+2]
		movsx	ebx, bx
		idiv	ebx

loc_29318:
		mov	[bp+var_30], eax

loc_2931C:
		mov	ax, word ptr [bp+var_18+2]
		mov	[bp+var_3A], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_3C], ax
		xor	ebx, ebx
		cmp	[bp+var_24], bx
		jnz	short loc_29335
		nop
		nop
		jmp	loc_2945E

loc_29335:
		cmp	[bp+var_1E], bx
		jl	short loc_2933F
		nop
		nop
		jmp	loc_293C0

loc_2933F:
		cmp	[bp+var_20], bx
		jge	short loc_2937E
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_29372
		nop
		nop
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_29372
		nop
		nop
		mov	edx, [bp+var_34]
		cmp	[bp+var_38], edx
		jge	short loc_29372
		nop
		nop
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]
		mov	[bp+var_3A], dx
		jmp	short loc_29378
		nop

loc_29372:
		mov	cx, word ptr [bp+var_18]
		mov	dx, word ptr [bp+var_18+2]

loc_29378:
		mov	ax, [bp+var_8]
		jmp	loc_29406

loc_2937E:
		mov	ax, word ptr [bp+var_18+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_293C0
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_293B1
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jle	short loc_293A7
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_293BA
		nop

loc_293A7:
		mov	ax, word ptr [bp+var_18]
		cmp	word ptr [bp+var_10], ax
		jnz	short loc_293B4
		nop
		nop

loc_293B1:
		jmp	loc_2945E

loc_293B4:
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_293BA:
		mov	ax, [bp+var_8]
		jmp	loc_29452

loc_293C0:
		cmp	[bp+var_1E], bx
		jg	short loc_293CA
		nop
		nop
		jmp	loc_2945E

loc_293CA:
		cmp	[bp+var_20], bx
		jle	short loc_29418
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_293FD
		nop
		nop
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_293FD
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_38], eax
		jle	short loc_293FD
		nop
		nop
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]
		mov	[bp+var_3A], dx
		jmp	short loc_29403
		nop

loc_293FD:
		mov	cx, word ptr [bp+var_18]
		mov	dx, word ptr [bp+var_18+2]

loc_29403:
		mov	ax, [bp+var_4]

loc_29406:
		sub	ax, cx
		mov	bx, word ptr [bp+var_10]
		sub	bx, cx
		mov	cx, word ptr [bp+var_10+2]
		sub	cx, dx
		mov	[bp+var_42], cx
		jmp	short loc_2945E
		nop

loc_29418:
		mov	ax, word ptr [bp+var_18+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_2945E
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_2945E
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jge	short loc_29441
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_2944F
		nop

loc_29441:
		cmp	[bp+var_22], 1
		jz	short loc_2945E
		nop
		nop
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_2944F:
		mov	ax, [bp+var_4]

loc_29452:
		sub	ax, word ptr [bp+var_18]
		sub	bx, word ptr [bp+var_18]
		sub	cx, word ptr [bp+var_18+2]
		mov	[bp+var_42], cx

loc_2945E:
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_29473
		mov	ax, [bp+var_6]
		cmp	[bp+var_3A], ax
		jge	short loc_294E6
		jmp	short loc_2949C
		nop

loc_29473:
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
		jle	short loc_294A1
		nop
		nop

loc_2949C:
		sub	ax, [bp+var_3A]
		mov	cx, ax

loc_294A1:
		add	[bp+var_3A], cx
		mov	cx, [bp+var_3A]
		sub	cx, word ptr [bp+var_18+2]
		movsx	ecx, cx
		mov	eax, [bp+var_34]
		imul	ecx
		add	[bp+var_2C], eax
		mov	dx, [bp+var_3A]
		sub	dx, word ptr [bp+var_14+2]
		jl	short loc_294DB
		nop
		nop
		mov	cx, dx
		mov	eax, [bp+var_38]
		mov	[bp+var_30], eax
		mov	ax, word ptr [bp+var_14]
		shl	eax, 10h
		mov	ax, 8000h
		mov	[bp+var_28], eax

loc_294DB:
		mov	eax, [bp+var_30]
		imul	ecx
		add	[bp+var_28], eax

loc_294E6:
		xor	ebx, ebx
		cmp	[bp+var_24], bx
		jnz	short loc_294F3
		nop
		nop
		jmp	loc_29647

loc_294F3:
		cmp	[bp+var_22], bx
		jl	short loc_294FD
		nop
		nop
		jmp	loc_29588

loc_294FD:
		cmp	[bp+var_20], bx
		jge	short loc_2954B
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_2952D
		nop
		nop
		mov	ax, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_18+2], ax
		jz	short loc_2952D
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jle	short loc_2952D
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_29533
		nop

loc_2952D:
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_29533:
		mov	ax, [bp+var_8]

loc_29536:
		sub	ax, word ptr [bp+var_18]
		sub	bx, word ptr [bp+var_18]
		sub	cx, word ptr [bp+var_18+2]
		mov	[bp+var_42], cx
		mov	dx, word ptr [bp+var_18+2]
		mov	[bp+var_3C], dx

loc_29548:
		jmp	loc_2961C

loc_2954B:
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_29588
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_29548
		mov	ax, word ptr [bp+var_10]
		cmp	word ptr [bp+var_18], ax
		jz	short loc_2957C
		nop
		nop
		mov	eax, [bp+var_38]
		cmp	[bp+var_34], eax
		jge	short loc_2957C
		nop
		nop
		mov	cx, word ptr [bp+var_18]
		mov	dx, word ptr [bp+var_18+2]
		jmp	short loc_29582
		nop

loc_2957C:
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]

loc_29582:
		mov	ax, [bp+var_8]
		jmp	loc_2960A

loc_29588:
		cmp	[bp+var_22], bx
		jg	short loc_29592
		nop
		nop
		jmp	loc_2961C

loc_29592:
		cmp	[bp+var_20], bx
		jle	short loc_295CE
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_14+2], ax
		jl	short loc_295C2
		nop
		nop
		mov	ax, word ptr [bp+var_14+2]
		cmp	word ptr [bp+var_18+2], ax
		jz	short loc_295C2
		nop
		nop
		mov	eax, [bp+var_34]
		cmp	[bp+var_30], eax
		jge	short loc_295C2
		nop
		nop
		mov	bx, word ptr [bp+var_14]
		mov	cx, word ptr [bp+var_14+2]
		jmp	short loc_295C8
		nop

loc_295C2:
		mov	bx, word ptr [bp+var_10]
		mov	cx, word ptr [bp+var_10+2]

loc_295C8:
		mov	ax, [bp+var_4]
		jmp	loc_29536

loc_295CE:
		mov	ax, word ptr [bp+var_10+2]
		cmp	word ptr [bp+var_14+2], ax
		jz	short loc_2961C
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_14+2], ax
		jg	short loc_2961C
		nop
		nop
		mov	ax, word ptr [bp+var_10]
		cmp	word ptr [bp+var_18], ax
		jz	short loc_29601
		nop
		nop
		mov	eax, [bp+var_38]
		cmp	[bp+var_34], eax
		jle	short loc_29601
		nop
		nop
		mov	cx, word ptr [bp+var_10]
		mov	dx, word ptr [bp+var_10+2]
		jmp	short loc_29607
		nop

loc_29601:
		mov	cx, word ptr [bp+var_14]
		mov	dx, word ptr [bp+var_14+2]

loc_29607:
		mov	ax, [bp+var_4]

loc_2960A:
		sub	ax, cx
		mov	bx, word ptr [bp+var_10]
		sub	bx, cx
		mov	cx, word ptr [bp+var_10+2]
		sub	cx, dx
		mov	[bp+var_42], cx
		mov	[bp+var_3C], dx

loc_2961C:
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_2962B
		nop
		nop
		jmp	short loc_29647
		nop

loc_2962B:
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, [bp+var_42]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		add	[bp+var_3C], ax

loc_29647:
		mov	si, word ptr [bp+var_28+2]
		mov	di, word ptr [bp+var_2C+2]
		mov	cx, word ptr [bp+var_10+2]
		cmp	[bp+var_3C], cx
		jl	short loc_2965A
		nop
		nop
		mov	[bp+var_3C], cx

loc_2965A:
		mov	ax, [bp+var_2]
		cmp	[bp+var_3C], ax
		jle	short loc_29667
		nop
		nop
		mov	[bp+var_3C], ax

loc_29667:
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
		jz	short loc_29703
		nop
		nop
		jmp	loc_297A2

loc_296A4:
		push	ebx
		push	edx
		push	eax
		push	ecx
		shr	ebx, 10h
		shr	edx, 10h
		cmp	bx, dx
		jle	short loc_296BC
		nop
		nop
		xchg	dx, bx

loc_296BC:
		mov	cx, dx
		sub	cx, bx
		jnz	short loc_296C5
		nop
		nop
		inc	cx

loc_296C5:
		mov	di, bx
		add	di, [si]
		push	ds
		lds	bx, [bp+arg_8]
		test	di, 1
		jz	short loc_296DA
		mov	al, es:[di]
		xlatb
		stosb
		jmp	short loc_296E7

loc_296DA:
		mov	ax, es:[di]
		xlatb
		xchg	al, ah
		xlatb
		xchg	ah, al
		dec	cx
		jz	short loc_296EB
		stosw

loc_296E7:
		loop	short loc_296DA
		jmp	short loc_296EC

loc_296EB:
		stosb

loc_296EC:
		pop	ds
		add	si, 2
		pop	ecx
		pop	eax
		pop	edx
		pop	ebx
		dec	[bp+var_44]
		jz	short loc_2970B

loc_296FD:
		add	ebx, eax
		add	edx, ecx

loc_29703:
		dec	[bp+var_46]
		jns	short loc_296A4
		jmp	loc_297A9

loc_2970B:
		mov	eax, [bp+var_38]
		mov	bx, word ptr [bp+var_14]
		shl	ebx, 10h
		mov	bx, 8000h
		jmp	short loc_296FD
		jmp	loc_297A9

loc_2971E:
		push	ebx
		push	edx
		push	ax
		push	cx
		shr	ebx, 10h
		shr	edx, 10h
		cmp	bx, dx
		jle	short loc_29734
		nop
		nop
		xchg	dx, bx

loc_29734:
		mov	ax, [bp+var_8]
		cmp	dx, ax
		jl	short loc_2977F
		cmp	bx, ax
		jge	short loc_29741
		mov	bx, ax

loc_29741:
		mov	ax, [bp+var_4]
		cmp	dx, ax
		jle	short loc_2974A
		mov	dx, ax

loc_2974A:
		cmp	bx, ax
		jg	short loc_2977F
		mov	cx, dx
		sub	cx, bx
		jnz	short loc_29757
		nop
		nop
		inc	cx

loc_29757:
		mov	di, bx
		add	di, [si]
		push	ds
		lds	bx, [bp+arg_8]
		test	di, 1
		jz	short loc_2976C
		mov	al, es:[di]
		xlatb
		stosb
		jmp	short loc_29779

loc_2976C:
		mov	ax, es:[di]
		xlatb
		xchg	al, ah
		xlatb
		xchg	ah, al
		dec	cx
		jz	short loc_2977D
		stosw

loc_29779:
		loop	short loc_2976C
		jmp	short loc_2977E

loc_2977D:
		stosb

loc_2977E:
		pop	ds

loc_2977F:
		add	si, 2
		pop	cx
		pop	ax
		pop	edx
		pop	ebx
		dec	[bp+var_44]
		jnz	short loc_2979C
		mov	eax, [bp+var_38]
		mov	bx, word ptr [bp+var_14]
		shl	ebx, 10h
		add	bx, 8000h

loc_2979C:
		add	ebx, eax
		add	edx, ecx

loc_297A2:
		dec	[bp+var_46]
		jns	loc_2971E

loc_297A9:
		pop	di
		pop	si
		leave
		retf
sub_2911E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_297AD		proc far

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
		jg	loc_298A8
		cmp	[bp+var_2], si
		jl	loc_298A8
		shl	si, 1
		add	si, [bp+var_A]
		mov	di, [bp+var_8]
		cmp	dx, di
		jl	loc_298A8
		cmp	bx, di
		jge	short loc_297F8
		nop
		nop
		mov	bx, di

loc_297F8:
		mov	di, [bp+var_4]
		cmp	dx, di
		jle	short loc_29803
		nop
		nop
		mov	dx, di

loc_29803:
		cmp	bx, di
		jg	loc_298A8
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
		jnz	short loc_29830
		mov	al, bl
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		jmp	short loc_298A7
		nop

loc_29830:
		mov	ah, 1
		jns	short loc_2983A
		nop
		nop
		neg	ah
		neg	si

loc_2983A:
		inc	si
		mov	al, dl
		cmp	si, cx
		jl	short loc_2986C
		nop
		nop
		mov	bx, cx
		mov	dx, si
		dec	dx
		jmp	short loc_29865
		nop

loc_2984B:
		add	al, ah
		sub	dx, bx
		js	short loc_29863
		add	al, ah
		sub	dx, bx
		js	short loc_29863
		add	al, ah
		sub	dx, bx
		js	short loc_29863
		add	al, ah
		sub	dx, bx
		jns	short loc_2984B

loc_29863:
		add	dx, si

loc_29865:
		stosb
		dec	cx
		jnz	short loc_2984B
		jmp	short loc_298A7
		nop

loc_2986C:
		mov	bx, si
		mov	si, cx
		mov	dx, si
		dec	dx

loc_29873:
		cmp	cx, 4
		jl	short loc_29899
		stosb
		sub	dx, bx
		js	short loc_2988F
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_2988F
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_2988F
		dec	cx
		stosb
		sub	dx, bx
		jns	short loc_29893

loc_2988F:
		add	dx, si
		add	al, ah

loc_29893:
		dec	cx
		jnz	short loc_29873
		jmp	short loc_298A7
		nop

loc_29899:
		stosb
		sub	dx, bx
		jns	short loc_298A4
		nop
		nop
		add	dx, si
		add	al, ah

loc_298A4:
		dec	cx
		jnz	short loc_29899

loc_298A7:
		pop	si

loc_298A8:
		pop	di
		pop	si
		leave
		retf
sub_297AD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_298AC		proc far

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
		jnz	short loc_29955
		cmp	word ptr [bp+var_16+2], ax
		jnz	short loc_29955
		mov	ax, word ptr [bp+var_1E]
		mov	si, [bp+var_12]
		mov	bx, word ptr [bp+var_1A]
		mov	dx, [bp+var_10]
		mov	cx, word ptr [bp+var_16]
		mov	di, [bp+var_E]
		cmp	ax, bx
		jle	short loc_2992E
		nop
		nop
		xchg	bx, ax
		xchg	dx, si

loc_2992E:
		cmp	bx, cx
		jle	short loc_29941
		nop
		nop
		xchg	cx, bx
		xchg	di, dx
		cmp	ax, bx
		jle	short loc_29941
		nop
		nop
		xchg	bx, ax
		xchg	dx, si

loc_29941:
		push	word ptr [bp+var_1E+2]
		push	di
		push	cx
		push	si
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_297AD
		add	sp, 0Ch
		jmp	loc_2A0F0

loc_29955:
		mov	eax, [bp+var_1E]
		mov	ebx, [bp+var_1A]
		mov	ecx, [bp+var_16]
		cmp	eax, ecx
		jle	short loc_29979
		cmp	ebx, ecx
		jl	short loc_29979
		xchg	ecx, eax
		mov	dx, [bp+var_E]
		xchg	[bp+var_12], dx
		mov	[bp+var_E], dx
		jmp	short loc_29989
		nop

loc_29979:
		cmp	eax, ebx
		jle	short loc_29989
		xchg	ebx, eax
		mov	dx, [bp+var_10]
		xchg	[bp+var_12], dx
		mov	[bp+var_10], dx

loc_29989:
		cmp	ebx, ecx
		jle	short loc_2999A
		xchg	ecx, ebx
		mov	dx, [bp+var_E]
		xchg	[bp+var_10], dx
		mov	[bp+var_E], dx

loc_2999A:
		mov	[bp+var_1E], eax
		mov	[bp+var_1A], ebx
		mov	[bp+var_16], ecx
		mov	si, [bp+var_8]
		mov	di, [bp+var_4]
		xor	dx, dx
		dec	dx
		cmp	ax, si
		jl	short loc_299BD
		nop
		nop
		inc	dx
		cmp	ax, di
		jle	short loc_299BD
		nop
		nop
		inc	dx

loc_299BD:
		mov	[bp+var_42], dx
		xor	dx, dx
		dec	dx
		cmp	bx, si
		jl	short loc_299D1
		nop
		nop
		inc	dx
		cmp	bx, di
		jle	short loc_299D1
		nop
		nop
		inc	dx

loc_299D1:
		mov	[bp+var_44], dx
		xor	dx, dx
		dec	dx
		cmp	cx, si
		jl	short loc_299E5
		nop
		nop
		inc	dx
		cmp	cx, di
		jle	short loc_299E5
		nop
		nop
		inc	dx

loc_299E5:
		mov	[bp+var_46], dx
		or	dx, [bp+var_44]
		or	dx, [bp+var_42]
		mov	[bp+var_48], dx
		mov	ax, word ptr [bp+var_1E+2]
		cmp	[bp+var_2], ax
		jl	short loc_29A13
		mov	ax, word ptr [bp+var_16+2]
		cmp	[bp+var_6], ax
		jg	short loc_29A13
		mov	ax, [bp+var_42]
		cmp	ax, 0
		jz	short loc_29A16
		cmp	[bp+var_44], ax
		jnz	short loc_29A16
		cmp	[bp+var_46], ax
		jnz	short loc_29A16

loc_29A13:
		jmp	loc_2A0F0

loc_29A16:
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
		jz	short loc_29AA6
		nop
		nop
		cmp	[bp+var_2], cx
		jle	short loc_29AA6
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

loc_29AA6:
		mov	[bp+var_3E], eax
		mov	bx, word ptr [bp+var_1A+2]
		sub	bx, word ptr [bp+var_1E+2]
		jnz	short loc_29ADF
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
		jmp	short loc_29B12
		nop

loc_29ADF:
		xor	eax, eax
		mov	cx, word ptr [bp+var_1A+2]
		cmp	[bp+var_6], cx
		jg	short loc_29AFF
		nop
		nop
		mov	ax, word ptr [bp+var_1A]
		sub	ax, word ptr [bp+var_1E]
		shl	eax, 10h
		cdq
		movsx	ebx, bx
		idiv	ebx

loc_29AFF:
		mov	[bp+var_2A], eax
		mov	ax, [bp+var_10]
		sub	ax, [bp+var_12]
		cwd
		shl	ax, 8
		idiv	bx
		mov	[bp+var_2E], ax

loc_29B12:
		mov	ax, word ptr [bp+var_1E+2]
		mov	[bp+var_20], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_22], ax
		xor	ebx, ebx
		cmp	[bp+var_48], bx
		jnz	short loc_29B2B
		nop
		nop
		jmp	loc_29C54

loc_29B2B:
		cmp	[bp+var_42], bx
		jl	short loc_29B35
		nop
		nop
		jmp	loc_29BB6

loc_29B35:
		cmp	[bp+var_44], bx
		jge	short loc_29B74
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_1A+2], ax
		jg	short loc_29B68
		nop
		nop
		mov	ax, word ptr [bp+var_16+2]
		cmp	word ptr [bp+var_1A+2], ax
		jz	short loc_29B68
		nop
		nop
		mov	edx, [bp+var_36]
		cmp	[bp+var_3E], edx
		jge	short loc_29B68
		nop
		nop
		mov	cx, word ptr [bp+var_1A]
		mov	dx, word ptr [bp+var_1A+2]
		mov	[bp+var_20], dx
		jmp	short loc_29B6E
		nop

loc_29B68:
		mov	cx, word ptr [bp+var_1E]
		mov	dx, word ptr [bp+var_1E+2]

loc_29B6E:
		mov	ax, [bp+var_8]
		jmp	loc_29BFC

loc_29B74:
		mov	ax, word ptr [bp+var_1E+2]
		cmp	word ptr [bp+var_1A+2], ax
		jz	short loc_29BB6
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_1A+2], ax
		jl	short loc_29BA7
		nop
		nop
		mov	eax, [bp+var_36]
		cmp	[bp+var_2A], eax
		jle	short loc_29B9D
		nop
		nop
		mov	bx, word ptr [bp+var_1A]
		mov	cx, word ptr [bp+var_1A+2]
		jmp	short loc_29BB0
		nop

loc_29B9D:
		mov	ax, word ptr [bp+var_1E]
		cmp	word ptr [bp+var_16], ax
		jnz	short loc_29BAA
		nop
		nop

loc_29BA7:
		jmp	loc_29C54

loc_29BAA:
		mov	bx, word ptr [bp+var_16]
		mov	cx, word ptr [bp+var_16+2]

loc_29BB0:
		mov	ax, [bp+var_8]
		jmp	loc_29C48

loc_29BB6:
		cmp	[bp+var_42], bx
		jg	short loc_29BC0
		nop
		nop
		jmp	loc_29C54

loc_29BC0:
		cmp	[bp+var_44], bx
		jle	short loc_29C0E
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_1A+2], ax
		jg	short loc_29BF3
		nop
		nop
		mov	ax, word ptr [bp+var_16+2]
		cmp	word ptr [bp+var_1A+2], ax
		jz	short loc_29BF3
		nop
		nop
		mov	eax, [bp+var_36]
		cmp	[bp+var_3E], eax
		jle	short loc_29BF3
		nop
		nop
		mov	cx, word ptr [bp+var_1A]
		mov	dx, word ptr [bp+var_1A+2]
		mov	[bp+var_20], dx
		jmp	short loc_29BF9
		nop

loc_29BF3:
		mov	cx, word ptr [bp+var_1E]
		mov	dx, word ptr [bp+var_1E+2]

loc_29BF9:
		mov	ax, [bp+var_4]

loc_29BFC:
		sub	ax, cx
		mov	bx, word ptr [bp+var_16]
		sub	bx, cx
		mov	cx, word ptr [bp+var_16+2]
		sub	cx, dx
		mov	[bp+var_4E], cx
		jmp	short loc_29C54
		nop

loc_29C0E:
		mov	ax, word ptr [bp+var_1E+2]
		cmp	word ptr [bp+var_1A+2], ax
		jz	short loc_29C54
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_1A+2], ax
		jl	short loc_29C54
		nop
		nop
		mov	eax, [bp+var_36]
		cmp	[bp+var_2A], eax
		jge	short loc_29C37
		nop
		nop
		mov	bx, word ptr [bp+var_1A]
		mov	cx, word ptr [bp+var_1A+2]
		jmp	short loc_29C45
		nop

loc_29C37:
		cmp	[bp+var_46], 1
		jz	short loc_29C54
		nop
		nop
		mov	bx, word ptr [bp+var_16]
		mov	cx, word ptr [bp+var_16+2]

loc_29C45:
		mov	ax, [bp+var_4]

loc_29C48:
		sub	ax, word ptr [bp+var_1E]
		sub	bx, word ptr [bp+var_1E]
		sub	cx, word ptr [bp+var_1E+2]
		mov	[bp+var_4E], cx

loc_29C54:
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_29C6D
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	[bp+var_20], ax
		jge	loc_29D02
		jmp	short loc_29C96
		nop

loc_29C6D:
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
		jle	short loc_29C9B
		nop
		nop

loc_29C96:
		sub	ax, [bp+var_20]
		mov	cx, ax

loc_29C9B:
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
		jl	short loc_29CEF
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

loc_29CEF:
		mov	ax, [bp+var_2E]
		imul	cx
		add	[bp+var_2C], ax
		mov	eax, [bp+var_2A]
		imul	ecx
		add	[bp+var_26], eax

loc_29D02:
		xor	ebx, ebx
		cmp	[bp+var_48], bx
		jnz	short loc_29D0F
		nop
		nop
		jmp	loc_29E63

loc_29D0F:
		cmp	[bp+var_46], bx
		jl	short loc_29D19
		nop
		nop
		jmp	loc_29DA4

loc_29D19:
		cmp	[bp+var_44], bx
		jge	short loc_29D67
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_1A+2], ax
		jl	short loc_29D49
		nop
		nop
		mov	ax, word ptr [bp+var_1A+2]
		cmp	word ptr [bp+var_1E+2], ax
		jz	short loc_29D49
		nop
		nop
		mov	eax, [bp+var_36]
		cmp	[bp+var_2A], eax
		jle	short loc_29D49
		nop
		nop
		mov	bx, word ptr [bp+var_1A]
		mov	cx, word ptr [bp+var_1A+2]
		jmp	short loc_29D4F
		nop

loc_29D49:
		mov	bx, word ptr [bp+var_16]
		mov	cx, word ptr [bp+var_16+2]

loc_29D4F:
		mov	ax, [bp+var_8]

loc_29D52:
		sub	ax, word ptr [bp+var_1E]
		sub	bx, word ptr [bp+var_1E]
		sub	cx, word ptr [bp+var_1E+2]
		mov	[bp+var_4E], cx
		mov	dx, word ptr [bp+var_1E+2]
		mov	[bp+var_22], dx

loc_29D64:
		jmp	loc_29E38

loc_29D67:
		mov	ax, word ptr [bp+var_16+2]
		cmp	word ptr [bp+var_1A+2], ax
		jz	short loc_29DA4
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_1A+2], ax
		jg	short loc_29D64
		mov	ax, word ptr [bp+var_16]
		cmp	word ptr [bp+var_1E], ax
		jz	short loc_29D98
		nop
		nop
		mov	eax, [bp+var_3E]
		cmp	[bp+var_36], eax
		jge	short loc_29D98
		nop
		nop
		mov	cx, word ptr [bp+var_1E]
		mov	dx, word ptr [bp+var_1E+2]
		jmp	short loc_29D9E
		nop

loc_29D98:
		mov	cx, word ptr [bp+var_1A]
		mov	dx, word ptr [bp+var_1A+2]

loc_29D9E:
		mov	ax, [bp+var_8]
		jmp	loc_29E26

loc_29DA4:
		cmp	[bp+var_46], bx
		jg	short loc_29DAE
		nop
		nop
		jmp	loc_29E38

loc_29DAE:
		cmp	[bp+var_44], bx
		jle	short loc_29DEA
		nop
		nop
		mov	ax, [bp+var_6]
		cmp	word ptr [bp+var_1A+2], ax
		jl	short loc_29DDE
		nop
		nop
		mov	ax, word ptr [bp+var_1A+2]
		cmp	word ptr [bp+var_1E+2], ax
		jz	short loc_29DDE
		nop
		nop
		mov	eax, [bp+var_36]
		cmp	[bp+var_2A], eax
		jge	short loc_29DDE
		nop
		nop
		mov	bx, word ptr [bp+var_1A]
		mov	cx, word ptr [bp+var_1A+2]
		jmp	short loc_29DE4
		nop

loc_29DDE:
		mov	bx, word ptr [bp+var_16]
		mov	cx, word ptr [bp+var_16+2]

loc_29DE4:
		mov	ax, [bp+var_4]
		jmp	loc_29D52

loc_29DEA:
		mov	ax, word ptr [bp+var_16+2]
		cmp	word ptr [bp+var_1A+2], ax
		jz	short loc_29E38
		nop
		nop
		mov	ax, [bp+var_2]
		cmp	word ptr [bp+var_1A+2], ax
		jg	short loc_29E38
		nop
		nop
		mov	ax, word ptr [bp+var_16]
		cmp	word ptr [bp+var_1E], ax
		jz	short loc_29E1D
		nop
		nop
		mov	eax, [bp+var_3E]
		cmp	[bp+var_36], eax
		jle	short loc_29E1D
		nop
		nop
		mov	cx, word ptr [bp+var_16]
		mov	dx, word ptr [bp+var_16+2]
		jmp	short loc_29E23
		nop

loc_29E1D:
		mov	cx, word ptr [bp+var_1A]
		mov	dx, word ptr [bp+var_1A+2]

loc_29E23:
		mov	ax, [bp+var_4]

loc_29E26:
		sub	ax, cx
		mov	bx, word ptr [bp+var_16]
		sub	bx, cx
		mov	cx, word ptr [bp+var_16+2]
		sub	cx, dx
		mov	[bp+var_4E], cx
		mov	[bp+var_22], dx

loc_29E38:
		shl	eax, 10h
		cdq
		or	bx, bx
		jnz	short loc_29E47
		nop
		nop
		jmp	short loc_29E63
		nop

loc_29E47:
		movsx	ebx, bx
		idiv	ebx
		movsx	ebx, [bp+var_4E]
		imul	ebx
		add	eax, 8000h
		shr	eax, 10h
		add	[bp+var_22], ax

loc_29E63:
		mov	si, word ptr [bp+var_26+2]
		mov	di, word ptr [bp+var_32+2]
		mov	cx, word ptr [bp+var_16+2]
		cmp	[bp+var_22], cx
		jl	short loc_29E76
		nop
		nop
		mov	[bp+var_22], cx

loc_29E76:
		mov	ax, [bp+var_2]
		cmp	[bp+var_22], ax
		jle	short loc_29E83
		nop
		nop
		mov	[bp+var_22], ax

loc_29E83:
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
		jz	loc_29FBE
		jmp	loc_2A0E9

loc_29EBF:
		push	ebx
		push	edx
		shr	ebx, 10h
		shr	edx, 10h
		mov	al, byte ptr [bp+var_2C+1]
		mov	cl, byte ptr [bp+var_38+1]
		cmp	bx, dx
		jle	short loc_29EDA
		nop
		nop
		xchg	dx, bx
		xchg	cx, ax

loc_29EDA:
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
		jnz	short loc_29F01
		mov	al, bl
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		jmp	short loc_29F78
		nop

loc_29F01:
		mov	ah, 1
		jns	short loc_29F0B
		nop
		nop
		neg	ah
		neg	si

loc_29F0B:
		inc	si
		mov	al, dl
		cmp	si, cx
		jl	short loc_29F3D
		nop
		nop
		mov	bx, cx
		mov	dx, si
		dec	dx
		jmp	short loc_29F36
		nop

loc_29F1C:
		add	al, ah
		sub	dx, bx
		js	short loc_29F34
		add	al, ah
		sub	dx, bx
		js	short loc_29F34
		add	al, ah
		sub	dx, bx
		js	short loc_29F34
		add	al, ah
		sub	dx, bx
		jns	short loc_29F1C

loc_29F34:
		add	dx, si

loc_29F36:
		stosb
		dec	cx
		jnz	short loc_29F1C
		jmp	short loc_29F78
		nop

loc_29F3D:
		mov	bx, si
		mov	si, cx
		mov	dx, si
		dec	dx

loc_29F44:
		cmp	cx, 4
		jl	short loc_29F6A
		stosb
		sub	dx, bx
		js	short loc_29F60
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_29F60
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_29F60
		dec	cx
		stosb
		sub	dx, bx
		jns	short loc_29F64

loc_29F60:
		add	dx, si
		add	al, ah

loc_29F64:
		dec	cx
		jnz	short loc_29F44
		jmp	short loc_29F78
		nop

loc_29F6A:
		stosb
		sub	dx, bx
		jns	short loc_29F75
		nop
		nop
		add	dx, si
		add	al, ah

loc_29F75:
		dec	cx
		jnz	short loc_29F6A

loc_29F78:
		pop	si
		add	si, 2
		pop	edx
		pop	ebx
		dec	[bp+var_4C]
		jnz	short loc_29FAA
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

loc_29FAA:
		add	ebx, [bp+var_2A]
		mov	ax, [bp+var_2E]
		add	[bp+var_2C], ax
		add	edx, [bp+var_36]
		mov	ax, [bp+var_3A]
		add	[bp+var_38], ax

loc_29FBE:
		dec	[bp+var_4A]
		jns	loc_29EBF
		jmp	loc_2A0F0

loc_29FC8:
		push	ebx
		push	edx
		shr	ebx, 10h
		shr	edx, 10h
		mov	al, byte ptr [bp+var_2C+1]
		mov	cl, byte ptr [bp+var_38+1]
		cmp	bx, dx
		jle	short loc_29FE3
		nop
		nop
		xchg	dx, bx
		xchg	cx, ax

loc_29FE3:
		mov	di, [bp+var_8]
		cmp	dx, di
		jl	loc_2A0A4
		cmp	bx, di
		jge	short loc_29FF4
		nop
		nop
		mov	bx, di

loc_29FF4:
		mov	di, [bp+var_4]
		cmp	dx, di
		jle	short loc_29FFF
		nop
		nop
		mov	dx, di

loc_29FFF:
		cmp	bx, di
		jg	loc_2A0A4
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
		jnz	short loc_2A02C
		mov	al, bl
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		jmp	short loc_2A0A3
		nop

loc_2A02C:
		mov	ah, 1
		jns	short loc_2A036
		nop
		nop
		neg	ah
		neg	si

loc_2A036:
		inc	si
		mov	al, dl
		cmp	si, cx
		jl	short loc_2A068
		nop
		nop
		mov	bx, cx
		mov	dx, si
		dec	dx
		jmp	short loc_2A061
		nop

loc_2A047:
		add	al, ah
		sub	dx, bx
		js	short loc_2A05F
		add	al, ah
		sub	dx, bx
		js	short loc_2A05F
		add	al, ah
		sub	dx, bx
		js	short loc_2A05F
		add	al, ah
		sub	dx, bx
		jns	short loc_2A047

loc_2A05F:
		add	dx, si

loc_2A061:
		stosb
		dec	cx
		jnz	short loc_2A047
		jmp	short loc_2A0A3
		nop

loc_2A068:
		mov	bx, si
		mov	si, cx
		mov	dx, si
		dec	dx

loc_2A06F:
		cmp	cx, 4
		jl	short loc_2A095
		stosb
		sub	dx, bx
		js	short loc_2A08B
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_2A08B
		dec	cx
		stosb
		sub	dx, bx
		js	short loc_2A08B
		dec	cx
		stosb
		sub	dx, bx
		jns	short loc_2A08F

loc_2A08B:
		add	dx, si
		add	al, ah

loc_2A08F:
		dec	cx
		jnz	short loc_2A06F
		jmp	short loc_2A0A3
		nop

loc_2A095:
		stosb
		sub	dx, bx
		jns	short loc_2A0A0
		nop
		nop
		add	dx, si
		add	al, ah

loc_2A0A0:
		dec	cx
		jnz	short loc_2A095

loc_2A0A3:
		pop	si

loc_2A0A4:
		add	si, 2
		pop	edx
		pop	ebx
		dec	[bp+var_4C]
		jnz	short loc_2A0D5
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

loc_2A0D5:
		add	ebx, [bp+var_2A]
		mov	ax, [bp+var_2E]
		add	[bp+var_2C], ax
		add	edx, [bp+var_36]
		mov	ax, [bp+var_3A]
		add	[bp+var_38], ax

loc_2A0E9:
		dec	[bp+var_4A]
		jns	loc_29FC8
sub_298AC		endp
seg059		ends
