seg044		segment	para public 'CODE' use16
		assume cs:seg044
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 78h, 5, 90h, 90h, 0E9h, 1Ch, 0FFh, 5Fh, 5Eh, 0C9h, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B40C		proc far

var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
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
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		enter	1Ch, 0
		push	si
		push	di
		cld
		push	ss
		pop	es
		mov	si, [bp+arg_0]
		lea	di, [bp+var_C]
		mov	cx, 6
		rep movsw
		mov	bx, [bp+var_A]
		mov	ax, [bx+2]
		sub	ax, [bx]
		mov	[bp+var_E], ax
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_8]
		cmp	ax, bx
		jle	short loc_1B44E
		xchg	bx, ax
		mov	[bp+arg_4], ax
		mov	[bp+arg_8], bx
		mov	cx, [bp+arg_2]
		xchg	[bp+arg_6], cx
		mov	[bp+arg_2], cx
		mov	cx, [bp+arg_A]
		xchg	[bp+arg_C], cx
		mov	[bp+arg_A], cx

loc_1B44E:
		mov	cx, [bp+arg_8]
		sub	cx, [bp+arg_4]
		jo	short loc_1B4AA
		mov	[bp+var_12], cx
		mov	cx, [bp+arg_6]
		sub	cx, [bp+arg_2]
		jo	short loc_1B4AA
		mov	[bp+var_10], cx
		mov	cx, [bp+arg_C]
		sub	cx, [bp+arg_A]
		jo	short loc_1B4AA
		mov	[bp+var_14], cx
		mov	cx, [bp+arg_2]
		mov	dx, [bp+arg_6]
		cmp	cx, dx
		mov	[bp+var_16], 0
		jz	short loc_1B48A
		mov	[bp+var_16], 1
		jle	short loc_1B48A
		xchg	dx, cx
		neg	[bp+var_16]

loc_1B48A:
		mov	[bp+var_18], dx
		sub	[bp+var_18], cx
		mov	ax, [bp+arg_4]
		cmp	ax, [bp+var_2]
		jg	short loc_1B4AA
		mov	bx, [bp+arg_8]
		cmp	bx, [bp+var_6]
		jl	short loc_1B4AA
		cmp	cx, [bp+var_4]
		jg	short loc_1B4AA
		cmp	dx, [bp+var_8]
		jge	short loc_1B4AD

loc_1B4AA:
		jmp	loc_1B65D

loc_1B4AD:
		mov	cx, [bp+var_6]
		mov	dx, [bp+arg_4]
		mov	ax, cx
		sub	ax, dx
		jle	short loc_1B4DD
		mov	[bp+arg_4], cx
		mov	cx, [bp+arg_8]
		sub	cx, dx
		push	ax
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		imul	dx
		idiv	cx
		add	[bp+arg_2], ax
		pop	ax
		mov	dx, [bp+arg_C]
		sub	dx, [bp+arg_A]
		imul	dx
		idiv	cx
		add	[bp+arg_A], ax

loc_1B4DD:
		mov	cx, [bp+var_8]
		mov	dx, [bp+arg_2]
		mov	ax, cx
		sub	ax, dx
		jg	short loc_1B4F2
		mov	cx, [bp+var_4]
		mov	ax, cx
		sub	ax, dx
		jge	short loc_1B520

loc_1B4F2:
		mov	[bp+arg_2], cx
		mov	cx, [bp+arg_6]
		sub	cx, dx
		push	ax
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]
		imul	dx
		idiv	cx
		add	[bp+arg_4], ax
		pop	ax
		mov	dx, [bp+arg_C]
		sub	dx, [bp+arg_A]
		imul	dx
		idiv	cx
		add	[bp+arg_A], ax
		mov	ax, [bp+arg_4]
		cmp	ax, [bp+var_2]
		jg	loc_1B65D

loc_1B520:
		mov	cx, [bp+var_2]
		mov	dx, [bp+arg_8]
		mov	ax, dx
		sub	ax, cx
		jle	short loc_1B550
		mov	[bp+arg_8], cx
		mov	cx, dx
		sub	cx, [bp+arg_4]
		push	ax
		mov	dx, [bp+arg_6]
		sub	dx, [bp+arg_2]
		imul	dx
		idiv	cx
		sub	[bp+arg_6], ax
		pop	ax
		mov	dx, [bp+arg_C]
		sub	dx, [bp+arg_A]
		imul	dx
		idiv	cx
		sub	[bp+arg_C], ax

loc_1B550:
		mov	cx, [bp+var_8]
		mov	dx, [bp+arg_6]
		mov	ax, dx
		sub	ax, cx
		jl	short loc_1B565
		mov	cx, [bp+var_4]
		mov	ax, dx
		sub	ax, cx
		jle	short loc_1B593

loc_1B565:
		mov	[bp+arg_6], cx
		mov	cx, dx
		sub	cx, [bp+arg_2]
		push	ax
		mov	dx, [bp+arg_8]
		sub	dx, [bp+arg_4]
		imul	dx
		idiv	cx
		sub	[bp+arg_8], ax
		pop	ax
		mov	dx, [bp+arg_C]
		sub	dx, [bp+arg_A]
		imul	dx
		idiv	cx
		sub	[bp+arg_C], ax
		mov	ax, [bp+arg_8]
		cmp	ax, [bp+var_6]
		jl	loc_1B65D

loc_1B593:
		mov	ax, [bp+arg_8]
		sub	ax, [bp+arg_4]
		mov	[bp+var_12], ax
		mov	ax, [bp+arg_6]
		sub	ax, [bp+arg_2]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[bp+var_18], ax
		mov	ax, [bp+arg_C]
		sub	ax, [bp+arg_A]
		mov	[bp+var_14], ax
		mov	es, [bp+var_C]
		mov	bx, [bp+arg_4]
		shl	bx, 1
		add	bx, [bp+var_A]
		mov	di, [bx]
		add	di, [bp+arg_2]
		mov	ax, [bp+var_18]
		cmp	ax, [bp+var_12]
		jb	short loc_1B614
		movsx	ecx, [bp+var_18]
		or	cx, cx
		jle	short loc_1B5E4
		mov	ax, [bp+var_14]
		shl	eax, 10h
		cdq
		idiv	ecx
		mov	[bp+var_1C], eax

loc_1B5E4:
		mov	si, [bp+var_18]
		mov	dx, [bp+var_12]
		mov	ax, [bp+arg_A]
		shl	eax, 10h
		mov	ax, 8000h
		jmp	short loc_1B5FC

loc_1B5F6:
		add	di, [bp+var_16]
		dec	cx
		jle	short loc_1B65D

loc_1B5FC:
		shld	ebx, eax, 10h
		mov	es:[di], bl
		add	eax, [bp+var_1C]
		sub	si, dx
		jg	short loc_1B5F6
		add	di, [bp+var_E]
		add	si, [bp+var_18]
		jmp	short loc_1B5F6

loc_1B614:
		movsx	ecx, [bp+var_12]
		or	cx, cx
		jle	short loc_1B62D
		mov	ax, [bp+var_14]
		shl	eax, 10h
		cdq
		idiv	ecx
		mov	[bp+var_1C], eax

loc_1B62D:
		mov	si, [bp+var_12]
		mov	dx, [bp+var_18]
		mov	ax, [bp+arg_A]
		shl	eax, 10h
		mov	ax, 8000h
		jmp	short loc_1B645

loc_1B63F:
		add	di, [bp+var_E]
		dec	cx
		jle	short loc_1B65D

loc_1B645:
		shld	ebx, eax, 10h
		mov	es:[di], bl
		add	eax, [bp+var_1C]
		sub	si, dx
		jg	short loc_1B63F
		add	di, [bp+var_16]
		add	si, [bp+var_12]
		jmp	short loc_1B63F

loc_1B65D:
		pop	di
		pop	si
		leave
sub_1B40C		endp
seg044		ends
