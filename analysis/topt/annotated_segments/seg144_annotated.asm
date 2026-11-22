seg144		segment	para public 'CODE' use16
		assume cs:seg144
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 1Fh, 5Fh, 5Eh, 0C9h, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, lue en partie 2026-11-02. Arguments : surface (to1mid2 : word_4D36E), tampon lointain,
; rectangle (4 mots : gauche, haut, droite, bas, lus mov cx, [si] / mov ax, [si+4] …). Calcule
; largeur et hauteur du rectangle, le borne à la surface ([bx+4], [bx+6], [bx+8], [bx+0Ah]) et
; copie entre la surface et le tampon. Sens (surface -> tampon) déduit de l'ordre des appels
; dans to1mid2 : appelée une fois avant le premier dessin, Surface_RestoreRect_38CDA entre
; deux dessins.
; ==============================================================================================
Surface_SaveRect_392F6		proc far

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
		push	cx
		mov	si, [bp+arg_6]
		mov	bx, [bp+arg_0]
		mov	cx, [si]
		mov	ax, [si+4]
		sub	ax, cx
		inc	ax
		mov	[bp+var_6], ax
		mov	[bp+var_E], ax
		mov	ax, [si+6]
		mov	cx, [si+2]
		sub	ax, cx
		inc	ax
		mov	[bp+var_8], ax
		mov	[bp+var_10], ax
		pop	cx
		mov	ax, [si]
		cmp	ax, [bx+8]
		jg	short loc_39348
		mov	[bp+var_4], ax
		mov	[bp+var_C], ax
		mov	ax, [bx+4]
		sub	ax, [bp+var_C]
		jl	short loc_39340
		sub	[bp+var_E], ax
		mov	ax, [bx+4]
		mov	[bp+var_C], ax

loc_39340:
		mov	ax, [si+2]
		cmp	ax, [bx+0Ah]
		jle	short loc_3934B

loc_39348:
		jmp	loc_393CF

loc_3934B:
		mov	[bp+var_2], ax
		mov	[bp+var_A], ax
		mov	ax, [bx+6]
		sub	ax, [bp+var_A]
		jl	short loc_39362
		sub	[bp+var_10], ax
		mov	ax, [bx+6]
		mov	[bp+var_A], ax

loc_39362:
		mov	ax, [si+4]
		cmp	ax, [bx+4]
		jl	short loc_39378
		sub	ax, [bx+8]
		jle	short loc_39372
		sub	[bp+var_E], ax

loc_39372:
		mov	ax, [si+6]
		cmp	ax, [bx+6]

loc_39378:
		jl	short loc_393CF
		sub	ax, [bx+0Ah]
		jle	short loc_39382
		sub	[bp+var_10], ax

loc_39382:
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_2]
		mul	[bp+var_6]
		mov	di, ax
		mov	dx, [bp+var_C]
		sub	dx, [bp+var_4]
		add	di, dx
		mov	ax, [bx]
		mov	[bp+var_12], ax
		mov	es, [bp+arg_4]
		add	di, [bp+arg_2]
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bx+2]
		mov	bx, ax
		push	ds
		pop	gs
		mov	ds, [bp+var_12]

loc_393B0:
		mov	si, gs:[bx]
		add	si, [bp+var_C]
		mov	cx, [bp+var_E]
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		add	bx, 2
		sub	di, [bp+var_E]
		add	di, [bp+var_6]
		dec	[bp+var_10]
		jnz	short loc_393B0

loc_393CF:
		pop	ds
Surface_SaveRect_392F6		endp
seg144		ends
