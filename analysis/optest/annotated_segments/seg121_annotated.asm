seg121		segment	byte public 'CODE' use16
		assume cs:seg121
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Shape_DrawSpans_61F52
; (sub_61F52 de STRIKE.EXE). far. DESSIN D'UNE IMAGE (forme RealSpace, format des segments de
; ligne) à la position (arg_2, arg_4), avec découpe sur le rectangle de la fenêtre. Pour
; chaque segment : lodsw = n (0 = fin de l'image), lodsw = x, lodsw = y (ajoutés à la
; position) ; n pair : n/2 pixels recopiés tels quels (shr cx, 1 / rep movsw / rep movsb) ; n
; impair : blocs de n/2 pixels en tout, chaque bloc commence par un octet c (lodsb / shr al,
; 1) : c pair → c/2 pixels recopiés (rep movsw / rep movsb), c impair → c/2 fois l'octet
; suivant (rep stosw / rep stosb). Écriture directe dans la mémoire d'écran : ni XOR ni
; couleur transparente testée ; la transparence vient du format (seuls les pixels des segments
; sont écrits), et une image dessinée après une autre la recouvre là où leurs segments se
; chevauchent. Ex-'Render_MeasureOrDrawTextString' (nom faux), renommée 2026-10-23 après
; lecture de la boucle de pixels (boucle relue ici, dans OPTEST). Lecteur Python équivalent :
; tools/sc_data.py image_spans/draw_image.
; ==============================================================================================
Shape_DrawSpans_32CD8	proc far		; CODE XREF: seg004:0192P TalkingHead_DrawAt_9D47+3CP ...

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
arg_6		= dword	ptr  0Ch
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 152h
		push	si
		push	di
		push	ds
		cld
		push	ss
		pop	es
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
		cmp	[si+4],	bx
		jb	short loc_32D05
		jnz	short loc_32D08

loc_32D05:				; CODE XREF: Shape_DrawSpans_32CD8+29j
		jmp	loc_32DC4
; ���������������������������������������������������������������������������

loc_32D08:				; CODE XREF: Shape_DrawSpans_32CD8+2Bj
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
		jg	short loc_32D67
		mov	ax, [bp+arg_2]
		sub	ax, [si+2]
		cmp	ax, [bp+var_E]
		jl	short loc_32D5C
		mov	ax, [bp+arg_4]
		sub	ax, [si+4]
		cmp	ax, [bp+var_C]

loc_32D5C:				; CODE XREF: Shape_DrawSpans_32CD8+79j
		jl	short loc_32DCB
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_8]

loc_32D67:				; CODE XREF: Shape_DrawSpans_32CD8+6Ej
		jg	short loc_32DCB
		mov	dx, ds
		add	si, 8

loc_32D6E:				; CODE XREF: Shape_DrawSpans_32CD8+BFj
					; Shape_DrawSpans_32CD8+D7j ...
		lodsw
		or	ax, ax
		jz	short loc_32DD1
		mov	cx, ax
		lodsw
		add	ax, [bp+arg_2]
		mov	di, ax
		lodsw
		add	ax, [bp+arg_4]
		shl	ax, 1
		mov	bx, [bp+var_10]
		add	bx, ax
		add	di, ss:[bx]
		mov	ds, dx
		shr	cx, 1
		jb	short loc_32D99
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		jmp	short loc_32D6E
; ���������������������������������������������������������������������������

loc_32D99:				; CODE XREF: Shape_DrawSpans_32CD8+B5j
		mov	bx, cx

loc_32D9B:				; CODE XREF: Shape_DrawSpans_32CD8+D5j
					; Shape_DrawSpans_32CD8+E8j
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_32DB1
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_32D9B
		jmp	short loc_32D6E
; ���������������������������������������������������������������������������

loc_32DB1:				; CODE XREF: Shape_DrawSpans_32CD8+C9j
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_32D9B
		jmp	short loc_32D6E
; ���������������������������������������������������������������������������

loc_32DC4:				; CODE XREF: Shape_DrawSpans_32CD8:loc_32D05j
					; Shape_DrawSpans_32CD8:loc_32DD1j
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_32DCB:				; CODE XREF: Shape_DrawSpans_32CD8:loc_32D5Cj
					; Shape_DrawSpans_32CD8:loc_32D67j
		add	si, 8

loc_32DCE:				; CODE XREF: Shape_DrawSpans_32CD8+157j
					; Shape_DrawSpans_32CD8+161j ...
		lodsw
		shr	ax, 1

loc_32DD1:				; CODE XREF: Shape_DrawSpans_32CD8+99j
		jz	short loc_32DC4
		mov	cx, ax
		jb	short loc_32E3F
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_32E3B
		cmp	ax, [bp+var_8]
		jg	short loc_32E3B
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_32E3B
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_32E3B
		shl	bx, 1
		push	ds
		mov	ax, [bp+var_10]
		add	bx, ax
		mov	di, ss:[bx]
		pop	ds
		add	di, dx
		mov	ax, [bp+var_E]
		mov	bx, [bp+var_A]
		sub	ax, dx
		jle	short loc_32E1C
		sub	cx, ax
		add	si, ax
		add	di, ax
		add	dx, ax

loc_32E1C:				; CODE XREF: Shape_DrawSpans_32CD8+13Aj
		add	dx, cx
		dec	dx
		sub	dx, bx
		jle	short loc_32E31
		sub	cx, dx
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		add	si, dx
		jmp	short loc_32DCE
; ���������������������������������������������������������������������������

loc_32E31:				; CODE XREF: Shape_DrawSpans_32CD8+149j
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		jmp	short loc_32DCE
; ���������������������������������������������������������������������������

loc_32E3B:				; CODE XREF: Shape_DrawSpans_32CD8+10Cj
					; Shape_DrawSpans_32CD8+111j ...
		add	si, cx
		jmp	short loc_32DCE
; ���������������������������������������������������������������������������

loc_32E3F:				; CODE XREF: Shape_DrawSpans_32CD8+FDj
		lodsw
		add	ax, [bp+arg_2]
		mov	dx, ax
		lodsw
		add	ax, [bp+arg_4]
		cmp	ax, [bp+var_C]
		jl	short loc_32EAC
		cmp	ax, [bp+var_8]
		jg	short loc_32EAC
		mov	bx, ax
		cmp	dx, [bp+var_A]
		jg	short loc_32EAC
		mov	ax, dx
		add	ax, cx
		dec	ax
		cmp	ax, [bp+var_E]
		jl	short loc_32EAC
		shl	bx, 1
		push	ds
		mov	di, [bp+var_10]
		add	bx, di
		mov	di, ss:[bx]
		pop	ds
		add	di, dx
		sub	ax, [bp+var_A]
		sub	dx, [bp+var_E]
		jl	short loc_32EBF
		cmp	ax, 0
		jg	short loc_32EBF
		mov	bx, cx

loc_32E81:				; CODE XREF: Shape_DrawSpans_32CD8+1BBj
					; Shape_DrawSpans_32CD8+1CFj
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_32E98
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_32E81
		jmp	loc_32DCE
; ���������������������������������������������������������������������������

loc_32E98:				; CODE XREF: Shape_DrawSpans_32CD8+1AFj
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_32E81
		jmp	loc_32DCE
; ���������������������������������������������������������������������������

loc_32EAC:				; CODE XREF: Shape_DrawSpans_32CD8+174j
					; Shape_DrawSpans_32CD8+179j ...
		lodsb
		add	si, 1
		shr	al, 1
		cbw
		jb	short loc_32EB8
		add	si, ax
		dec	si

loc_32EB8:				; CODE XREF: Shape_DrawSpans_32CD8+1DBj
		sub	cx, ax
		jnz	short loc_32EAC
		jmp	loc_32DCE
; ���������������������������������������������������������������������������

loc_32EBF:				; CODE XREF: Shape_DrawSpans_32CD8+1A0j
					; Shape_DrawSpans_32CD8+1A5j
		mov	[bp+var_2], ax
		mov	bx, cx
		push	cx
		push	es
		push	di
		push	ss
		pop	es
		lea	di, [bp+var_152]

loc_32ECD:				; CODE XREF: Shape_DrawSpans_32CD8+207j
					; Shape_DrawSpans_32CD8+21Aj
		lodsb
		shr	al, 1
		cbw
		mov	cx, ax
		jb	short loc_32EE3
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		sub	bx, ax
		jnz	short loc_32ECD
		jmp	short loc_32EF4
; ���������������������������������������������������������������������������

loc_32EE3:				; CODE XREF: Shape_DrawSpans_32CD8+1FBj
		sub	bx, ax
		lodsb
		mov	ah, al
		shr	cx, 1
		rep stosw
		adc	cx, cx
		rep stosb
		or	bx, bx
		jnz	short loc_32ECD

loc_32EF4:				; CODE XREF: Shape_DrawSpans_32CD8+209j
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
		jge	short loc_32F0D
		add	cx, dx
		sub	si, dx
		sub	di, dx

loc_32F0D:				; CODE XREF: Shape_DrawSpans_32CD8+22Dj
		cmp	[bp+var_2], 0
		jle	short loc_32F19
		sub	cx, [bp+var_2]
		mov	ax, [bp+var_2]

loc_32F19:				; CODE XREF: Shape_DrawSpans_32CD8+239j
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		add	si, ax
		pop	si
		pop	ds
		jmp	loc_32DCE
Shape_DrawSpans_32CD8	endp

seg121		ends
