seg030		segment	para public 'CODE' use16
		assume cs:seg030
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9Ch, 3, 0, 0, 83h, 0C4h, 2

loc_11527:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1152B		proc far

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

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di]
		cmp	ax, [si]
		jge	short loc_1154C
		mov	ax, [di]
		cmp	ax, [si+8]
		jge	short loc_1154C
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_1154C:
		mov	ax, [di]
		cmp	ax, [si+4]
		jle	short loc_11560
		mov	ax, [di]
		cmp	ax, [si+0Ch]
		jle	short loc_11560
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_11560:
		mov	ax, [di+2]
		cmp	ax, [si+2]
		jle	short loc_11576
		mov	ax, [di+2]
		cmp	ax, [si+6]
		jle	short loc_11576
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_11576:
		mov	ax, [di+2]
		cmp	ax, [si+0Ah]
		jge	short loc_1158C
		mov	ax, [di+2]
		cmp	ax, [si+0Eh]
		jge	short loc_1158C
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_1158C:
		mov	ax, [si]
		sub	ax, [si+8]
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_115CD
		mov	ax, [si+2]
		sub	ax, [si+0Ah]
		imul	word ptr [si]
		cwd
		idiv	[bp+var_2]
		mov	dx, [si+2]
		sub	dx, ax
		mov	[bp+var_4], dx
		mov	ax, [si]
		sub	ax, [si+8]
		push	ax
		mov	ax, [di+2]
		sub	ax, [bp+var_4]
		pop	dx
		imul	dx
		mov	dx, [si+2]
		sub	dx, [si+0Ah]
		push	dx
		cwd
		pop	bx
		idiv	bx
		mov	[bp+var_6], ax
		jmp	short loc_115D2

loc_115CD:
		mov	ax, [si]
		mov	[bp+var_6], ax

loc_115D2:
		mov	ax, [di]
		cmp	ax, [bp+var_6]
		jge	short loc_115DF
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_115DF:
		mov	ax, [si+4]
		sub	ax, [si+0Ch]
		mov	[bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_11623
		mov	ax, [si+6]
		sub	ax, [si+0Eh]
		imul	word ptr [si+4]
		cwd
		idiv	[bp+var_8]
		mov	dx, [si+6]
		sub	dx, ax
		mov	[bp+var_A], dx
		mov	ax, [si+4]
		sub	ax, [si+0Ch]
		push	ax
		mov	ax, [di+2]
		sub	ax, [bp+var_A]
		pop	dx
		imul	dx
		mov	dx, [si+6]
		sub	dx, [si+0Eh]
		push	dx
		cwd
		pop	bx
		idiv	bx
		mov	[bp+var_C], ax
		jmp	short loc_11629

loc_11623:
		mov	ax, [si+4]
		mov	[bp+var_C], ax

loc_11629:
		mov	ax, [di]
		cmp	ax, [bp+var_C]
		jle	short loc_11636
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_11636:
		mov	ax, [si+4]
		sub	ax, [si]
		mov	cx, ax
		or	cx, cx
		jz	short loc_11667
		mov	ax, [si+6]
		sub	ax, [si+2]
		imul	word ptr [si]
		cwd
		idiv	cx
		mov	dx, [si+2]
		sub	dx, ax
		mov	[bp+var_E], dx
		mov	ax, [si+6]
		sub	ax, [si+2]
		imul	word ptr [di]
		cwd
		idiv	cx
		add	ax, [bp+var_E]
		mov	[bp+var_10], ax
		jmp	short loc_1166D

loc_11667:
		mov	ax, [si+6]
		mov	[bp+var_10], ax

loc_1166D:
		mov	ax, [di+2]
		cmp	ax, [bp+var_10]
		jle	short loc_1167B
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_1167B:
		mov	ax, [si+0Ch]
		sub	ax, [si+8]
		mov	[bp+var_12], ax
		cmp	[bp+var_12], 0
		jz	short loc_116B3
		mov	ax, [si+0Eh]
		sub	ax, [si+0Ah]
		imul	word ptr [si+8]
		cwd
		idiv	[bp+var_12]
		mov	dx, [si+0Ah]
		sub	dx, ax
		mov	[bp+var_14], dx
		mov	ax, [si+0Eh]
		sub	ax, [si+0Ah]
		imul	word ptr [di]
		cwd
		idiv	[bp+var_12]
		add	ax, [bp+var_14]
		mov	[bp+var_16], ax
		jmp	short loc_116B9

loc_116B3:
		mov	ax, [si+0Eh]
		mov	[bp+var_16], ax

loc_116B9:
		mov	ax, [di+2]
		cmp	ax, [bp+var_16]
		jge	short loc_116C7
		mov	al, 0
		pop	di
		pop	si
		leave
		retf

loc_116C7:
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
sub_1152B		endp

; START OF FUNCTION CHUNK FOR sub_1152B
		pop	di
		pop	si
		leave
; END OF FUNCTION CHUNK FOR sub_1152B
seg030		ends
