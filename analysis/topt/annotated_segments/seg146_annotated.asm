seg146		segment	para public 'CODE' use16
		assume cs:seg146
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_396B0		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		cld
		mov	si, [bp+arg_0]
		mov	ax, [si]
		mov	es, ax
		mov	bx, [si+2]
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_2]
		mov	bx, [bp+arg_6]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_8]
		cmp	bx, ax
		jge	short loc_396DE
		xchg	bx, ax
		xchg	dx, cx

loc_396DE:
		mov	[bp+arg_2], ax
		mov	[bp+arg_6], bx
		mov	[bp+arg_4], cx
		mov	[bp+arg_8], dx
		cmp	dx, cx
		jge	short loc_396FA
		xchg	dx, cx
		neg	[bp+var_2]
		mov	[bp+var_8], 1
		jmp	short loc_396FF

loc_396FA:
		mov	[bp+var_8], 0

loc_396FF:
		cmp	bx, [si+4]
		jge	short loc_39707
		jmp	loc_3989C

loc_39707:
		cmp	ax, [si+8]
		jle	short loc_3970F
		jmp	loc_3989C

loc_3970F:
		cmp	dx, [si+6]
		jge	short loc_39717
		jmp	loc_3989C

loc_39717:
		cmp	cx, [si+0Ah]
		jle	short loc_3971F
		jmp	loc_3989C

loc_3971F:
		cmp	bx, [si+8]
		jle	short loc_39746
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]
		mov	ax, [si+8]
		sub	ax, [bp+arg_2]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_4]
		mov	[bp+arg_8], ax
		mov	ax, [si+8]
		mov	[bp+arg_6], ax

loc_39746:
		mov	ax, [bp+arg_2]
		cmp	ax, [si+4]
		jge	short loc_39770
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]
		mov	ax, [si+4]
		sub	ax, [bp+arg_2]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_4]
		mov	[bp+arg_4], ax
		mov	ax, [si+4]
		mov	[bp+arg_2], ax

loc_39770:
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		test	[bp+var_8], 0FFh
		jz	short loc_39792
		xchg	bx, ax
		xchg	dx, cx
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	[bp+arg_2], cx
		mov	[bp+arg_6], dx

loc_39792:
		cmp	bx, [si+6]
		jge	short loc_3979A
		jmp	loc_3989C

loc_3979A:
		cmp	ax, [si+0Ah]
		jle	short loc_397A2
		jmp	loc_3989C

loc_397A2:
		cmp	bx, [si+0Ah]
		jle	short loc_397C5
		sub	bx, ax
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		mov	ax, [si+0Ah]
		sub	ax, [bp+arg_4]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_2]
		mov	[bp+arg_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+arg_8], ax

loc_397C5:
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		cmp	ax, [si+6]
		jge	short loc_397F2
		mov	bx, [bp+arg_8]
		sub	bx, [bp+arg_4]
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		mov	ax, [si+6]
		sub	ax, [bp+arg_4]
		imul	dx
		idiv	bx
		add	ax, [bp+arg_2]
		mov	[bp+arg_2], ax
		mov	ax, [si+6]
		mov	[bp+arg_4], ax

loc_397F2:
		mov	bx, [bp+arg_8]
		sub	bx, [bp+arg_4]
		mov	[bp+var_6], bx
		test	[bp+var_8], 0FFh
		jz	short loc_3981D
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		xchg	bx, ax
		xchg	dx, cx
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	[bp+arg_2], cx
		mov	[bp+arg_6], dx

loc_3981D:
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		mov	[bp+var_4], bx
		xor	al, al
		mov	ah, byte ptr [bp+arg_4]
		shr	ax, 1
		shr	ax, 1
		add	ah, byte ptr [bp+arg_4]
		add	ax, [bp+arg_2]
		mov	di, ax
		mov	al, [bp+arg_A]
		xor	cx, cx
		mov	bx, [bp+arg_2]
		cmp	bx, [bp+arg_6]
		jz	short loc_39884
		mov	bx, [bp+arg_4]
		cmp	bx, [bp+arg_8]
		jz	short loc_39892
		mov	bx, [bp+var_4]
		mov	dx, [bp+var_6]
		cmp	dx, bx
		jg	short loc_3986D
		mov	si, bx
		inc	si

loc_39859:
		xor	es:[di], al
		inc	di
		dec	si
		jz	short loc_3989C
		add	cx, dx
		cmp	cx, bx
		jl	short loc_39859
		add	di, [bp+var_2]
		sub	cx, bx
		jmp	short loc_39859

loc_3986D:
		mov	si, dx
		inc	si

loc_39870:
		xor	es:[di], al
		add	di, [bp+var_2]
		dec	si
		jz	short loc_3989C
		add	cx, bx
		cmp	cx, dx
		jl	short loc_39870
		inc	di
		sub	cx, dx
		jmp	short loc_39870

loc_39884:
		mov	cx, [bp+var_6]
		inc	cx

loc_39888:
		xor	es:[di], al
		add	di, [bp+var_2]
		loop	short loc_39888
		jmp	short loc_3989C

loc_39892:
		mov	cx, [bp+var_4]
		inc	cx

loc_39896:
		xor	es:[di], al
		inc	di
		loop	short loc_39896

loc_3989C:
		pop	di
		pop	si
		mov	sp, bp
sub_396B0		endp
seg146		ends
