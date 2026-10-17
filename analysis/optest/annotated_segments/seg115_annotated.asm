seg115		segment	byte public 'CODE' use16
		assume cs:seg115
		;org 6
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_DrawFilledEllipse_6106E (sub_6106E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 481 lignes, NON DÉTAILLÉE EN PROFONDEUR —
; algorithme de tracé d'ellipse/cercle rempli façon Bresenham : calcule les carrés des rayons
; (arg_6²/arg_8²) et les termes d'erreur incrémentaux dans des globales dédiées
; (word_70F40-70F62), dessine dans une structure de contexte graphique (es:[si]). Cas dégénéré
; (rayons nuls) délégué à sub_61960 (remplissage rectangulaire). Référencée depuis seg059.
; Candidat pour session dédiée si la précision géométrique doit être vérifiée.
; ==============================================================================================
Render_DrawFilledEllipse_32056	proc far		; CODE XREF: seg045:066BP
					; sub_542AC+A98P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si

loc_3205A:				; DATA XREF: seg170:046Eo
		push	di
		cmp	[bp+arg_6], 0
		jz	short loc_32067
		cmp	[bp+arg_8], 0
		jnz	short loc_32094

loc_32067:				; CODE XREF: Render_DrawFilledEllipse_32056+9j
		push	[bp+arg_A]
		mov	ax, [bp+arg_4]
		add	ax, [bp+arg_8]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, [bp+arg_6]
		push	ax
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_8]
		push	ax
		mov	ax, [bp+arg_2]
		sub	ax, [bp+arg_6]
		push	ax
		push	[bp+arg_0]
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		jmp	loc_32393
; ���������������������������������������������������������������������������

loc_32094:				; CODE XREF: Render_DrawFilledEllipse_32056+Fj
		mov	si, [bp+arg_0]
		mov	es, word ptr [si]
		mov	ax, [si+8]
		mov	word_47126, ax
		mov	ax, [si+4]
		mov	word_47122, ax
		mov	ax, [si+6]
		shl	ax, 1
		mov	word_47120, ax
		mov	ax, [si+0Ah]
		shl	ax, 1
		mov	word_47124, ax
		mov	ax, [bp+arg_A]
		mov	ah, al
		mov	word_4711A, ax
		mov	ax, [bp+arg_2]
		mov	word_47128, ax
		mov	ax, [bp+arg_4]
		shl	ax, 1
		mov	word_4712A, ax
		mov	word_4711C, 0
		mov	ax, [bp+arg_8]
		shl	ax, 1
		mov	word_4711E, ax
		mov	ax, [bp+arg_6]
		mul	ax
		mov	word_47130, ax
		mov	word_47132, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_47134, ax
		mov	word_47136, dx
		mov	ax, [bp+arg_8]
		mul	ax
		mov	word_47138, ax
		mov	word_4713A, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_4713C, ax
		mov	word_4713E, dx
		mov	word_47140, 0
		mov	word_47142, 0
		mov	ax, word_47134
		mov	dx, word_47136
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	ax, cx
		pop	dx
		mul	dx
		add	dx, cx
		mov	word_47144, ax
		mov	word_47146, dx
		mov	ax, word_47130
		mov	dx, word_47132
		sar	dx, 1
		rcr	ax, 1
		sar	dx, 1
		rcr	ax, 1
		add	ax, word_47138
		add	dx, word_4713A
		mov	word_47148, ax
		mov	word_4714A, dx
		mov	ax, word_47130
		mov	dx, word_47132
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	ax, cx
		pop	dx
		mul	dx
		add	dx, cx
		sub	word_47148, ax
		sbb	word_4714A, dx
		mov	bx, [bp+arg_8]
		mov	bp, [si+2]

loc_32170:				; CODE XREF: Render_DrawFilledEllipse_32056+215j
		mov	ax, word_47140
		mov	dx, word_47142
		sub	ax, word_47144
		sbb	dx, word_47146
		js	short loc_32184
		jmp	loc_3226E
; ���������������������������������������������������������������������������

loc_32184:				; CODE XREF: Render_DrawFilledEllipse_32056+129j
		push	bx
		mov	ax, word_47128
		add	ax, word_4711C
		cmp	ax, word_47126
		jle	short loc_32195
		mov	ax, word_47126

loc_32195:				; CODE XREF: Render_DrawFilledEllipse_32056+13Aj
		cmp	ax, word_47122
		jge	short loc_3219D

loc_3219B:				; CODE XREF: Render_DrawFilledEllipse_32056+15Ej
					; Render_DrawFilledEllipse_32056+16Fj
		jmp	short loc_32215
; ���������������������������������������������������������������������������

loc_3219D:				; CODE XREF: Render_DrawFilledEllipse_32056+143j
		mov	word_4712E, ax
		mov	ax, word_47128
		sub	ax, word_4711C
		cmp	ax, word_47122
		jge	short loc_321B0
		mov	ax, word_47122

loc_321B0:				; CODE XREF: Render_DrawFilledEllipse_32056+155j
		cmp	ax, word_47126
		jg	short loc_3219B
		mov	word_4712C, ax
		mov	si, word_4712A
		add	si, word_4711E
		cmp	si, word_47120
		jl	short loc_3219B
		cmp	si, word_47124
		jg	short loc_321E7
		mov	di, word_4712C
		mov	cx, word_4712E
		sub	cx, di
		inc	cx
		add	di, [bp+si]
		mov	ax, word_4711A
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_321E7:				; CODE XREF: Render_DrawFilledEllipse_32056+175j
		mov	si, word_4712A
		sub	si, word_4711E
		cmp	si, word_47124
		jg	short loc_32215
		cmp	si, word_47120
		jl	short loc_32215
		mov	di, word_4712C
		mov	cx, word_4712E
		sub	cx, di
		inc	cx
		add	di, [bp+si]
		mov	ax, word_4711A
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_32215:				; CODE XREF: Render_DrawFilledEllipse_32056:loc_3219Bj
					; Render_DrawFilledEllipse_32056+19Dj ...
		pop	bx
		cmp	word_4714A, 0
		js	short loc_32241
		sub	word_4711E, 2
		dec	bx
		mov	ax, word_47144
		mov	dx, word_47146
		sub	ax, word_47134
		sbb	dx, word_47136
		mov	word_47144, ax
		mov	word_47146, dx
		sub	word_47148, ax
		sbb	word_4714A, dx

loc_32241:				; CODE XREF: Render_DrawFilledEllipse_32056+1C5j
		inc	word_4711C
		mov	ax, word_47140
		mov	dx, word_47142
		add	ax, word_4713C
		adc	dx, word_4713E
		mov	word_47140, ax
		mov	word_47142, dx
		add	ax, word_47138
		adc	dx, word_4713A
		add	word_47148, ax
		adc	word_4714A, dx
		jmp	loc_32170
; ���������������������������������������������������������������������������

loc_3226E:				; CODE XREF: Render_DrawFilledEllipse_32056+12Bj
		push	bx
		mov	ax, word_47130
		mov	dx, word_47132
		sub	ax, word_47138
		sbb	dx, word_4713A
		mov	bx, ax
		mov	cx, dx
		sar	dx, 1
		rcr	ax, 1
		add	ax, bx
		adc	dx, cx
		sub	ax, word_47140
		sbb	dx, word_47142
		sub	ax, word_47144
		sbb	dx, word_47146
		sar	dx, 1
		rcr	ax, 1
		add	word_47148, ax
		adc	word_4714A, dx
		pop	bx

loc_322A7:				; CODE XREF: Render_DrawFilledEllipse_32056+33Aj
		push	bx
		mov	ax, word_47128
		add	ax, word_4711C
		cmp	ax, word_47126
		jle	short loc_322B8
		mov	ax, word_47126

loc_322B8:				; CODE XREF: Render_DrawFilledEllipse_32056+25Dj
		cmp	ax, word_47122
		jge	short loc_322C0

loc_322BE:				; CODE XREF: Render_DrawFilledEllipse_32056+281j
					; Render_DrawFilledEllipse_32056+292j
		jmp	short loc_32338
; ���������������������������������������������������������������������������

loc_322C0:				; CODE XREF: Render_DrawFilledEllipse_32056+266j
		mov	word_4712E, ax
		mov	ax, word_47128
		sub	ax, word_4711C
		cmp	ax, word_47122
		jge	short loc_322D3
		mov	ax, word_47122

loc_322D3:				; CODE XREF: Render_DrawFilledEllipse_32056+278j
		cmp	ax, word_47126
		jg	short loc_322BE
		mov	word_4712C, ax
		mov	si, word_4712A
		add	si, word_4711E
		cmp	si, word_47120
		jl	short loc_322BE
		cmp	si, word_47124
		jg	short loc_3230A
		mov	di, word_4712C
		mov	cx, word_4712E
		sub	cx, di
		inc	cx
		add	di, [bp+si]
		mov	ax, word_4711A
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_3230A:				; CODE XREF: Render_DrawFilledEllipse_32056+298j
		mov	si, word_4712A
		sub	si, word_4711E
		cmp	si, word_47124
		jg	short loc_32338
		cmp	si, word_47120
		jl	short loc_32338
		mov	di, word_4712C
		mov	cx, word_4712E
		sub	cx, di
		inc	cx
		add	di, [bp+si]
		mov	ax, word_4711A
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb

loc_32338:				; CODE XREF: Render_DrawFilledEllipse_32056:loc_322BEj
					; Render_DrawFilledEllipse_32056+2C0j ...
		pop	bx
		cmp	word_4714A, 0
		jns	short loc_32362
		inc	word_4711C
		mov	ax, word_47140
		mov	dx, word_47142
		add	ax, word_4713C
		adc	dx, word_4713E
		mov	word_47140, ax
		mov	word_47142, dx
		add	word_47148, ax
		adc	word_4714A, dx

loc_32362:				; CODE XREF: Render_DrawFilledEllipse_32056+2E8j
		sub	word_4711E, 2
		mov	ax, word_47144
		mov	dx, word_47146
		sub	ax, word_47134
		sbb	dx, word_47136
		mov	word_47144, ax
		mov	word_47146, dx
		sub	ax, word_47130
		sbb	dx, word_47132
		sub	word_47148, ax
		sbb	word_4714A, dx
		dec	bx
		js	short loc_32393
		jmp	loc_322A7
; ���������������������������������������������������������������������������

loc_32393:				; CODE XREF: Render_DrawFilledEllipse_32056+3Bj
					; Render_DrawFilledEllipse_32056+338j
		pop	di
		pop	si
		pop	bp
		retf
Render_DrawFilledEllipse_32056	endp

seg115		ends
