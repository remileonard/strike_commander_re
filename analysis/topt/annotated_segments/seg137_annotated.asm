seg137		segment	para public 'CODE' use16
		assume cs:seg137
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 1Fh, 0E9h, 83h, 0FEh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (11 sur
; 11), à Shape_DrawSpans_32CD8 (sub_32CD8 de OPTEST.EXE). Code non comparé instruction par
; instruction. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Shape_DrawSpans_61F52 (sub_61F52 de STRIKE.EXE). far. DESSIN D'UNE IMAGE (forme RealSpace,
; format des segments de ligne) à la position (arg_2, arg_4), avec découpe sur le rectangle de
; la fenêtre. Pour chaque segment : lodsw = n (0 = fin de l'image), lodsw = x, lodsw = y
; (ajoutés à la position) ; n pair : n/2 pixels recopiés tels quels (shr cx, 1 / rep movsw /
; rep movsb) ; n impair : blocs de n/2 pixels en tout, chaque bloc commence par un octet c
; (lodsb / shr al, 1) : c pair → c/2 pixels recopiés (rep movsw / rep movsb), c impair → c/2
; fois l'octet suivant (rep stosw / rep stosb). Écriture directe dans la mémoire d'écran : ni
; XOR ni couleur transparente testée ; la transparence vient du format (seuls les pixels des
; segments sont écrits), et une image dessinée après une autre la recouvre là où leurs
; segments se chevauchent. Ex-'Render_MeasureOrDrawTextString' (nom faux), renommée 2026-10-23
; après lecture de la boucle de pixels (boucle relue ici, dans OPTEST). Lecteur Python
; équivalent : tools/sc_data.py image_spans/draw_image.
; ==============================================================================================
Shape_DrawSpans_38514		proc far

var_152		= word ptr -152h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_A		= word ptr  10h

		enter	152h, 0
		push	si
		push	di
		push	ds
		cld
		push	ss
		pop	es
		push	ds
		pop	gs
		mov	si, [bp+arg_0]
		lea	di, [bp+var_12]
		mov	cx, 6
		rep movsw
		mov	es, [bp+var_12]
		lds	si, [bp+arg_6]
		mov	bx, [bp+arg_A]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	[si+4], bx
		jb	short loc_38541
		jnz	short loc_38544

loc_38541:
		jmp	loc_38600

loc_38544:
		mov	ax, ds
		mov	dx, 0
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		add	ax, si
		adc	dx, 0
		add	ax, [bx+si]
		adc	dx, [bx+si+2]
		mov	si, ax
		and	si, 0Fh
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		mov	ds, ax
		mov	ax, [si]
		add	ax, [bp+arg_2]
		cmp	ax, [bp+var_A]
		jg	short loc_385A3
		mov	ax, [bp+arg_2]
		sub	ax, [si+2]
		cmp	ax, [bp+var_E]
		jl	short loc_38598
		mov	ax, [bp+arg_4]
		sub	ax, [si+4]
		cmp	ax, [bp+var_C]

loc_38598:
		jl	short loc_38605
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_8]

loc_385A3:
		jg	short loc_38605
		mov	dx, ds
		add	si, 8

loc_385AA:
		lodsw
		or	ax, ax
		jz	short loc_3860B
		mov	cx, ax
		lodsw
		add	ax, [bp+arg_2]
		mov	di, ax
		lodsw
		add	ax, [bp+arg_4]
		shl	ax, 1
		mov	bx, [bp+var_10]
		add	bx, ax
		add	di, gs:[bx]
		mov	ds, dx
		shr	cx, 1
		jb	short loc_385D5
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		jmp	short loc_385AA

loc_385D5:
		mov	bx, cx

loc_385D7:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_385ED
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_385D7
		jmp	short loc_385AA

loc_385ED:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_385D7
		jmp	short loc_385AA

loc_38600:
		pop	ds
		pop	di
		pop	si
		leave
		retf

loc_38605:
		add	si, 8

loc_38608:
		lodsw
		shr	ax, 1

loc_3860B:
		jz	short loc_38600
		mov	cx, ax
		jb	short loc_38679
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_38675
		cmp	ax, [bp+var_8]
		jg	short loc_38675
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_38675
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_38675
		shl	bx, 1
		push	ds
		mov	ax, [bp+var_10]
		add	bx, ax
		mov	di, gs:[bx]
		pop	ds
		add	di, dx
		mov	ax, [bp+var_E]
		mov	bx, [bp+var_A]
		sub	ax, dx
		jle	short loc_38656
		sub	cx, ax
		add	si, ax
		add	di, ax
		add	dx, ax

loc_38656:
		add	dx, cx
		dec	dx
		sub	dx, bx
		jle	short loc_3866B
		sub	cx, dx
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		add	si, dx
		jmp	short loc_38608

loc_3866B:
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		jmp	short loc_38608

loc_38675:
		add	si, cx
		jmp	short loc_38608

loc_38679:
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_386E6
		cmp	ax, [bp+var_8]
		jg	short loc_386E6
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_386E6
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_386E6
		shl	bx, 1
		push	ds
		mov	di, [bp+var_10]
		add	bx, di
		mov	di, gs:[bx]
		pop	ds
		add	di, dx
		sub	ax, [bp+var_A]
		sub	dx, [bp+var_E]
		jl	short loc_386F9
		cmp	ax, 0
		jg	short loc_386F9
		mov	bx, cx

loc_386BB:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_386D2
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_386BB
		jmp	loc_38608

loc_386D2:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_386BB
		jmp	loc_38608

loc_386E6:
		lodsb
		add	si, 1
		shr	al, 1
		cbw
		jb	short loc_386F2
		add	si, ax
		dec	si

loc_386F2:
		sub	cx, ax
		jnz	short loc_386E6
		jmp	loc_38608

loc_386F9:
		mov	[bp+var_2], ax
		mov	bx, cx
		push	cx
		push	es
		push	di
		push	ss
		pop	es
		lea	di, [bp+var_152]

loc_38707:
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_3871D
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_38707
		jmp	short loc_3872E

loc_3871D:
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_38707

loc_3872E:
		pop	di
		pop	es
		pop	cx
		push	ds
		push	si
		push	ss
		pop	ds
		lea	si, [bp+var_152]
		mov	ax, 0
		cmp	dx, 0
		jge	short loc_38747
		add	cx, dx
		sub	si, dx
		sub	di, dx

loc_38747:
		cmp	[bp+var_2], 0
		jle	short loc_38753
		sub	cx, [bp+var_2]
		mov	ax, [bp+var_2]

loc_38753:
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		add	si, ax
		pop	si
		pop	ds
Shape_DrawSpans_38514		endp

; START OF FUNCTION CHUNK FOR Shape_DrawSpans_38514
		db 0E9h
; END OF FUNCTION CHUNK FOR Shape_DrawSpans_38514
seg137		ends
