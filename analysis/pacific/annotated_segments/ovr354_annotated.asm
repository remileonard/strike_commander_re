ovr354		segment	para public 'OVERLAY' use16
		assume cs:ovr354
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C56B0		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di]
		cmp	ax, [si]
		jge	short loc_C56CE
		cmp	ax, [si+8]
		jge	short loc_C56CE

loc_C56C9:
		mov	al, 0
		jmp	loc_C57FA

loc_C56CE:
		mov	ax, [di]
		cmp	ax, [si+4]
		jle	short loc_C56DA
		cmp	ax, [si+0Ch]
		jg	short loc_C56C9

loc_C56DA:
		mov	ax, [di+2]
		cmp	ax, [si+2]
		jge	short loc_C56E7
		cmp	ax, [si+6]
		jl	short loc_C56C9

loc_C56E7:
		mov	ax, [di+2]
		cmp	ax, [si+0Ah]
		jle	short loc_C56F4
		cmp	ax, [si+0Eh]
		jg	short loc_C56C9

loc_C56F4:
		mov	cx, [si]
		sub	cx, [si+8]
		or	cx, cx
		jz	short loc_C572E
		mov	ax, [si+2]
		sub	ax, [si+0Ah]
		imul	word ptr [si]
		cwd
		idiv	cx
		mov	dx, [si+2]
		sub	dx, ax
		mov	[bp+var_2], dx
		mov	ax, [si]
		sub	ax, [si+8]
		push	ax
		mov	ax, [di+2]
		sub	ax, [bp+var_2]
		pop	dx
		imul	dx
		mov	dx, [si+2]
		sub	dx, [si+0Ah]
		push	dx
		cwd
		pop	bx
		idiv	bx
		mov	dx, ax
		jmp	short loc_C5730

loc_C572E:
		mov	dx, [si]

loc_C5730:
		cmp	[di], dx
		jl	short loc_C56C9
		mov	cx, [si+4]
		sub	cx, [si+0Ch]
		or	cx, cx
		jz	short loc_C5771
		mov	ax, [si+6]
		sub	ax, [si+0Eh]
		imul	word ptr [si+4]
		cwd
		idiv	cx
		mov	dx, [si+6]
		sub	dx, ax
		mov	[bp+var_4], dx
		mov	ax, [si+4]
		sub	ax, [si+0Ch]
		push	ax
		mov	ax, [di+2]
		sub	ax, [bp+var_4]
		pop	dx
		imul	dx
		mov	dx, [si+6]
		sub	dx, [si+0Eh]
		push	dx
		cwd
		pop	bx
		idiv	bx
		mov	dx, ax
		jmp	short loc_C5774

loc_C5771:
		mov	dx, [si+4]

loc_C5774:
		cmp	[di], dx
		jle	short loc_C577B
		jmp	loc_C56C9

loc_C577B:
		mov	ax, [si+6]
		sub	ax, [si+2]
		imul	word ptr [si]
		mov	dx, [si+4]
		sub	dx, [si]
		push	dx
		cwd
		pop	bx
		idiv	bx
		mov	dx, [si+2]
		sub	dx, ax
		mov	[bp+var_6], dx
		mov	ax, [si+6]
		sub	ax, [si+2]
		imul	word ptr [di]
		mov	dx, [si+4]
		sub	dx, [si]
		push	dx
		cwd
		pop	bx
		idiv	bx
		add	ax, [bp+var_6]
		mov	[bp+var_8], ax
		mov	ax, [di+2]
		cmp	ax, [bp+var_8]
		jge	short loc_C57B8
		jmp	loc_C56C9

loc_C57B8:
		mov	ax, [si+0Eh]
		sub	ax, [si+0Ah]
		imul	word ptr [si+8]
		mov	dx, [si+0Ch]
		sub	dx, [si+8]
		push	dx
		cwd
		pop	bx
		idiv	bx
		mov	dx, [si+0Ah]
		sub	dx, ax
		mov	[bp+var_A], dx
		mov	ax, [si+0Eh]
		sub	ax, [si+0Ah]
		imul	word ptr [di]
		mov	dx, [si+0Ch]
		sub	dx, [si+8]
		push	dx
		cwd
		pop	bx
		idiv	bx
		add	ax, [bp+var_A]
		mov	[bp+var_C], ax
		mov	ax, [di+2]
		cmp	ax, [bp+var_C]
		jle	short loc_C57F8
		jmp	loc_C56C9

loc_C57F8:
		mov	al, 1

loc_C57FA:
		pop	di
		pop	si
		leave
		retf
sub_C56B0		endp
ovr354		ends
