seg141		segment	para public 'CODE' use16
		assume cs:seg141
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 4Eh, 0F0h, 75h, 0E1h

loc_38CD4:
		db 1Fh, 5Fh, 5Eh, 0C9h, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, lue en partie 2026-11-02. Mêmes arguments que Surface_SaveRect_392F6 (surface, tampon
; lointain, rectangle). Sens (tampon -> surface) déduit de l'ordre des appels dans to1mid2 :
; appelée entre deux images du diaporama, après Surface_SaveRect_392F6, pour remettre le fond
; avant l'image suivante.
; ==============================================================================================
Surface_RestoreRect_38CDA		proc far

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

		enter	12h, 0
		push	si
		push	di
		push	ds
		mov	ax, ds
		mov	es, ax
		mov	di, [bp+arg_6]
		mov	bx, [bp+arg_0]
		push	cx
		mov	ax, [di+4]
		mov	cx, [di]
		sub	ax, cx
		inc	ax
		mov	[bp+var_6], ax
		mov	[bp+var_E], ax
		mov	ax, [di+6]
		mov	cx, [di+2]
		sub	ax, cx
		inc	ax
		mov	[bp+var_8], ax
		mov	[bp+var_10], ax
		pop	cx
		mov	ax, [di]
		cmp	ax, [bx+8]
		jg	short loc_38D30
		mov	[bp+var_4], ax
		mov	[bp+var_C], ax
		mov	ax, [bx+4]
		sub	ax, [bp+var_C]
		jl	short loc_38D28
		sub	[bp+var_E], ax
		mov	ax, [bx+4]
		mov	[bp+var_C], ax

loc_38D28:
		mov	ax, [di+2]
		cmp	ax, [bx+0Ah]
		jle	short loc_38D33

loc_38D30:
		jmp	loc_38DBA

loc_38D33:
		mov	[bp+var_2], ax
		mov	[bp+var_A], ax
		mov	ax, [bx+6]
		sub	ax, [bp+var_A]
		jl	short loc_38D4A
		sub	[bp+var_10], ax
		mov	ax, [bx+6]
		mov	[bp+var_A], ax

loc_38D4A:
		mov	ax, [di+4]
		cmp	ax, [bx+4]
		jl	short loc_38D60
		sub	ax, [bx+8]
		jle	short loc_38D5A
		sub	[bp+var_E], ax

loc_38D5A:
		mov	ax, [di+6]
		cmp	ax, [bx+6]

loc_38D60:
		jl	short loc_38DBA
		sub	ax, [bx+0Ah]
		jle	short loc_38D6A
		sub	[bp+var_10], ax

loc_38D6A:
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_2]
		mul	[bp+var_6]
		mov	si, ax
		mov	dx, [bp+var_C]
		sub	dx, [bp+var_4]
		add	si, dx
		mov	ax, [bp+arg_4]
		mov	[bp+var_12], ax
		mov	bx, [bp+arg_0]
		mov	es, [bx]
		add	si, [bp+arg_2]
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bx+2]
		mov	bx, ax
		push	ds
		pop	gs
		mov	ds, [bp+var_12]

loc_38D9B:
		mov	di, gs:[bx]
		add	di, [bp+var_C]
		mov	cx, [bp+var_E]
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		add	bx, 2
		sub	si, [bp+var_E]
		add	si, [bp+var_6]
		dec	[bp+var_10]
		jnz	short loc_38D9B

loc_38DBA:
		pop	ds
		pop	di
		pop	si
		leave
		retf
Surface_RestoreRect_38CDA		endp

; START OF FUNCTION CHUNK FOR Surface_RestoreRect_38CDA
		db 0
; END OF FUNCTION CHUNK FOR Surface_RestoreRect_38CDA
seg141		ends
