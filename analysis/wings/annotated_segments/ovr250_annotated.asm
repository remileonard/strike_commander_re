ovr250		segment	para public 'OVERLAY' use16
		assume cs:ovr250
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Palette_StepTowardTarget_2ED93 (sub_2ED93 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Fondu incrémental de type
; Bresenham sur n octets. Au premier appel (word_47030 = 1) : écart et sens de chaque
; composante, nombre d'étapes = plus grand écart, accumulateurs à la moitié. Chaque appel
; suivant : chaque composante avance de 1 quand son accumulateur dépasse le nombre d'étapes,
; si bien que toutes arrivent ensemble. Renvoie 1 tant qu'il reste des étapes.
; ==============================================================================================
Palette_StepTowardTarget_88FC0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_0]
		cmp	word_5D91A, 0
		jnz	short loc_88FD5
		jmp	loc_890B1

loc_88FD5:
		push	si
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word_60424, ax
		push	si
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word_60426, ax
		push	si
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word_60428, ax
		cmp	word_60424, 0
		jz	short loc_89008
		cmp	word_60426, 0
		jz	short loc_89008
		cmp	word_60428, 0
		jnz	short loc_89040

loc_89008:
		cmp	word_60424, 0
		jz	short loc_89019
		push	word_60424
		call	sub_33B
		pop	cx

loc_89019:
		cmp	word_60426, 0
		jz	short loc_8902A
		push	word_60426
		call	sub_33B
		pop	cx

loc_8902A:
		cmp	word_60428, 0
		jz	short loc_8903B
		push	word_60428
		call	sub_33B
		pop	cx

loc_8903B:
		xor	ax, ax
		jmp	loc_89129

loc_89040:
		mov	word_6042A, 0
		xor	cx, cx
		jmp	short loc_8908A

loc_8904A:
		mov	bx, cx
		mov	al, [bx+di]
		mov	ah, 0
		mov	bx, [bp+arg_2]
		add	bx, cx
		mov	dl, [bx]
		mov	dh, 0
		sub	ax, dx
		mov	dx, ax
		or	dx, dx
		jge	short loc_8906E
		neg	dx
		mov	bx, word_60428
		add	bx, cx
		mov	byte ptr [bx], 1
		jmp	short loc_89077

loc_8906E:
		mov	bx, word_60428
		add	bx, cx
		mov	byte ptr [bx], 0FFh

loc_89077:
		mov	bx, word_60426
		add	bx, cx
		mov	[bx], dl
		cmp	dx, word_6042A
		jbe	short loc_89089
		mov	word_6042A, dx

loc_89089:
		inc	cx

loc_8908A:
		cmp	cx, si
		jb	short loc_8904A
		mov	dx, word_6042A
		shr	dx, 1
		xor	cx, cx
		jmp	short loc_890A1

loc_89098:
		mov	bx, word_60424
		add	bx, cx
		mov	[bx], dl
		inc	cx

loc_890A1:
		cmp	cx, si
		jb	short loc_89098
		mov	ax, word_6042A
		mov	word_6042C, ax
		mov	word_5D91A, 0

loc_890B1:
		mov	ax, word_6042C
		dec	word_6042C
		or	ax, ax
		jnz	short loc_890E3
		push	word_60424
		call	sub_33B
		pop	cx
		push	word_60426
		call	sub_33B
		pop	cx
		push	word_60428
		call	sub_33B
		pop	cx
		mov	word_5D91A, 1
		jmp	loc_8903B

loc_890E3:
		xor	cx, cx
		jmp	short loc_89122

loc_890E7:
		mov	bx, word_60426
		add	bx, cx
		mov	al, [bx]
		mov	bx, word_60424
		add	bx, cx
		add	[bx], al
		mov	al, [bx]
		mov	ah, 0
		cmp	ax, word_6042A
		jbe	short loc_89121
		mov	bx, word_60424
		add	bx, cx
		mov	al, [bx]
		sub	al, byte ptr word_6042A
		mov	bx, word_60424
		add	bx, cx
		mov	[bx], al
		mov	bx, word_60428
		add	bx, cx
		mov	al, [bx]
		mov	bx, cx
		add	[bx+di], al

loc_89121:
		inc	cx

loc_89122:
		cmp	cx, si
		jb	short loc_890E7
		mov	ax, 1

loc_89129:
		pop	di
		pop	si
		pop	bp
		retf	6
Palette_StepTowardTarget_88FC0		endp
ovr250		ends
