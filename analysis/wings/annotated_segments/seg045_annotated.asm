seg045		segment	para public 'CODE' use16
		assume cs:seg045
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F232		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di]
		cmp	ax, [si]
		jge	short loc_1F250
		cmp	ax, [si+8]
		jge	short loc_1F250

loc_1F24B:
		mov	al, 0
		jmp	loc_1F373

loc_1F250:
		mov	ax, [di]
		cmp	ax, [si+4]
		jle	short loc_1F25C
		cmp	ax, [si+0Ch]
		jg	short loc_1F24B

loc_1F25C:
		mov	ax, [di+2]
		cmp	ax, [si+2]
		jle	short loc_1F269
		cmp	ax, [si+6]
		jg	short loc_1F24B

loc_1F269:
		mov	ax, [di+2]
		cmp	ax, [si+0Ah]
		jge	short loc_1F276
		cmp	ax, [si+0Eh]
		jl	short loc_1F24B

loc_1F276:
		mov	cx, [si]
		sub	cx, [si+8]
		or	cx, cx
		jz	short loc_1F2B0
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
		jmp	short loc_1F2B2

loc_1F2B0:
		mov	dx, [si]

loc_1F2B2:
		cmp	[di], dx
		jl	short loc_1F24B
		mov	cx, [si+4]
		sub	cx, [si+0Ch]
		or	cx, cx
		jz	short loc_1F2F3
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
		jmp	short loc_1F2F6

loc_1F2F3:
		mov	dx, [si+4]

loc_1F2F6:
		cmp	[di], dx
		jle	short loc_1F2FD
		jmp	loc_1F24B

loc_1F2FD:
		mov	cx, [si+4]
		sub	cx, [si]
		or	cx, cx
		jz	short loc_1F32B
		mov	ax, [si+6]
		sub	ax, [si+2]
		imul	word ptr [si]
		cwd
		idiv	cx
		mov	dx, [si+2]
		sub	dx, ax
		mov	[bp+var_6], dx
		mov	ax, [si+6]
		sub	ax, [si+2]
		imul	word ptr [di]
		cwd
		idiv	cx
		add	ax, [bp+var_6]
		mov	dx, ax
		jmp	short loc_1F32E

loc_1F32B:
		mov	dx, [si+6]

loc_1F32E:
		cmp	[di+2], dx
		jle	short loc_1F336
		jmp	loc_1F24B

loc_1F336:
		mov	cx, [si+0Ch]
		sub	cx, [si+8]
		or	cx, cx
		jz	short loc_1F366
		mov	ax, [si+0Eh]
		sub	ax, [si+0Ah]
		imul	word ptr [si+8]
		cwd
		idiv	cx
		mov	dx, [si+0Ah]
		sub	dx, ax
		mov	[bp+var_8], dx
		mov	ax, [si+0Eh]
		sub	ax, [si+0Ah]
		imul	word ptr [di]
		cwd
		idiv	cx
		add	ax, [bp+var_8]
		mov	dx, ax
		jmp	short loc_1F369

loc_1F366:
		mov	dx, [si+0Eh]

loc_1F369:
		cmp	[di+2], dx
		jge	short loc_1F371
sub_1F232		endp

; START OF FUNCTION CHUNK FOR sub_1F232
		db 0E9h, 0DAh
; END OF FUNCTION CHUNK FOR sub_1F232
seg045		ends
