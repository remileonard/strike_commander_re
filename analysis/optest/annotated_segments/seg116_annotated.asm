seg116		segment	byte public 'CODE' use16
		assume cs:seg116
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_DrawEllipseOutline_61612 (sub_61612 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 454 lignes, NON DÉTAILLÉE EN PROFONDEUR —
; même signature et même structure que Render_DrawFilledEllipse_6106E (seg167), cas dégénéré
; délégué au même sub_61960. Probable variante « contour seul » (non rempli) de l'algorithme
; d'ellipse — identité exacte non vérifiée. Référencée depuis seg020 et seg059.
; ==============================================================================================
Render_DrawEllipseOutline_32398	proc far		; CODE XREF: seg045:0602P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		push	di
		cmp	[bp+arg_6], 0
		jz	short loc_323A9
		cmp	[bp+arg_8], 0
		jnz	short loc_323D6

loc_323A9:				; CODE XREF: Render_DrawEllipseOutline_32398+9j
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
		jmp	loc_326E1
; ���������������������������������������������������������������������������

loc_323D6:				; CODE XREF: Render_DrawEllipseOutline_32398+Fj
		mov	si, [bp+arg_0]
		mov	es, word ptr [si]
		mov	ax, [si+8]
		mov	word_47158, ax
		mov	ax, [si+4]
		mov	word_47154, ax
		mov	ax, [si+6]
		shl	ax, 1
		mov	word_47152, ax
		mov	ax, [si+0Ah]
		shl	ax, 1
		mov	word_47156, ax
		mov	ax, [bp+arg_A]
		mov	ah, al
		mov	word_4714C, ax
		mov	ax, [bp+arg_2]
		mov	word_4715A, ax
		mov	ax, [bp+arg_4]
		shl	ax, 1
		mov	word_4715C, ax
		mov	word_4714E, 0
		mov	ax, [bp+arg_8]
		shl	ax, 1
		mov	word_47150, ax
		mov	ax, [bp+arg_6]
		mul	ax
		mov	word_4715E, ax
		mov	word_47160, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_47162, ax
		mov	word_47164, dx
		mov	ax, [bp+arg_8]
		mul	ax
		mov	word_47166, ax
		mov	word_47168, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_4716A, ax
		mov	word_4716C, dx
		mov	word_4716E, 0
		mov	word_47170, 0
		mov	ax, word_47162
		mov	dx, word_47164
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	ax, cx
		pop	dx
		mul	dx
		add	dx, cx
		mov	word_47172, ax
		mov	word_47174, dx
		mov	ax, word_4715E
		mov	dx, word_47160
		sar	dx, 1
		rcr	ax, 1
		sar	dx, 1
		rcr	ax, 1
		add	ax, word_47166
		add	dx, word_47168
		mov	word_47176, ax
		mov	word_47178, dx
		mov	ax, word_4715E
		mov	dx, word_47160
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	ax, cx
		pop	dx
		mul	dx
		add	dx, cx
		sub	word_47176, ax
		sbb	word_47178, dx
		mov	bx, [bp+arg_8]
		mov	bp, [si+2]

loc_324B2:				; CODE XREF: Render_DrawEllipseOutline_32398+21Bj
		mov	ax, word_4716E
		mov	dx, word_47170
		sub	ax, word_47172
		sbb	dx, word_47174
		js	short loc_324C6
		jmp	loc_325B6
; ���������������������������������������������������������������������������

loc_324C6:				; CODE XREF: Render_DrawEllipseOutline_32398+129j
		mov	dx, word_4714C
		mov	di, word_4715A
		add	di, word_4714E
		cmp	di, word_47158
		jg	short loc_32514
		cmp	di, word_47154
		jl	short loc_32514
		mov	ax, di
		mov	si, word_4715C
		add	si, word_47150
		cmp	si, word_47152
		jl	short loc_324FB
		cmp	si, word_47156
		jg	short loc_324FB
		add	di, [bp+si]
		mov	es:[di], dl
		mov	di, ax

loc_324FB:				; CODE XREF: Render_DrawEllipseOutline_32398+154j
					; Render_DrawEllipseOutline_32398+15Aj
		mov	si, word_4715C
		sub	si, word_47150
		cmp	si, word_47152
		jl	short loc_32514
		cmp	si, word_47156
		jg	short loc_32514
		add	di, [bp+si]
		mov	es:[di], dl

loc_32514:				; CODE XREF: Render_DrawEllipseOutline_32398+13Ej
					; Render_DrawEllipseOutline_32398+144j ...
		mov	di, word_4715A
		sub	di, word_4714E
		cmp	di, word_47158
		jg	short loc_3255E
		cmp	di, word_47154
		jl	short loc_3255E
		mov	ax, di
		mov	si, word_4715C
		add	si, word_47150
		cmp	si, word_47152
		jl	short loc_32545
		cmp	si, word_47156
		jg	short loc_32545
		add	di, [bp+si]
		mov	es:[di], dl
		mov	di, ax

loc_32545:				; CODE XREF: Render_DrawEllipseOutline_32398+19Ej
					; Render_DrawEllipseOutline_32398+1A4j
		mov	si, word_4715C
		sub	si, word_47150
		cmp	si, word_47152
		jl	short loc_3255E
		cmp	si, word_47156
		jg	short loc_3255E
		add	di, [bp+si]
		mov	es:[di], dl

loc_3255E:				; CODE XREF: Render_DrawEllipseOutline_32398+188j
					; Render_DrawEllipseOutline_32398+18Ej ...
		cmp	word_47178, 0
		js	short loc_32589
		sub	word_47150, 2
		dec	bx
		mov	ax, word_47172
		mov	dx, word_47174
		sub	ax, word_47162
		sbb	dx, word_47164
		mov	word_47172, ax
		mov	word_47174, dx
		sub	word_47176, ax
		sbb	word_47178, dx

loc_32589:				; CODE XREF: Render_DrawEllipseOutline_32398+1CBj
		inc	word_4714E
		mov	ax, word_4716E
		mov	dx, word_47170
		add	ax, word_4716A
		adc	dx, word_4716C
		mov	word_4716E, ax
		mov	word_47170, dx
		add	ax, word_47166
		adc	dx, word_47168
		add	word_47176, ax
		adc	word_47178, dx
		jmp	loc_324B2
; ���������������������������������������������������������������������������

loc_325B6:				; CODE XREF: Render_DrawEllipseOutline_32398+12Bj
		push	bx
		mov	ax, word_4715E
		mov	dx, word_47160
		sub	ax, word_47166
		sbb	dx, word_47168
		mov	bx, ax
		mov	cx, dx
		sar	dx, 1
		rcr	ax, 1
		add	ax, bx
		adc	dx, cx
		sub	ax, word_4716E
		sbb	dx, word_47170
		sub	ax, word_47172
		sbb	dx, word_47174
		sar	dx, 1
		rcr	ax, 1
		add	word_47176, ax
		adc	word_47178, dx
		pop	bx

loc_325EF:				; CODE XREF: Render_DrawEllipseOutline_32398+346j
		mov	dx, word_4714C
		mov	di, word_4715A
		add	di, word_4714E
		cmp	di, word_47158
		jg	short loc_3263D
		cmp	di, word_47154
		jl	short loc_3263D
		mov	ax, di
		mov	si, word_4715C
		add	si, word_47150
		cmp	si, word_47152
		jl	short loc_32624
		cmp	si, word_47156
		jg	short loc_32624
		add	di, [bp+si]
		mov	es:[di], dl
		mov	di, ax

loc_32624:				; CODE XREF: Render_DrawEllipseOutline_32398+27Dj
					; Render_DrawEllipseOutline_32398+283j
		mov	si, word_4715C
		sub	si, word_47150
		cmp	si, word_47152
		jl	short loc_3263D
		cmp	si, word_47156
		jg	short loc_3263D
		add	di, [bp+si]
		mov	es:[di], dl

loc_3263D:				; CODE XREF: Render_DrawEllipseOutline_32398+267j
					; Render_DrawEllipseOutline_32398+26Dj ...
		mov	di, word_4715A
		sub	di, word_4714E
		cmp	di, word_47158
		jg	short loc_32687
		cmp	di, word_47154
		jl	short loc_32687
		mov	ax, di
		mov	si, word_4715C
		add	si, word_47150
		cmp	si, word_47152
		jl	short loc_3266E
		cmp	si, word_47156
		jg	short loc_3266E
		add	di, [bp+si]
		mov	es:[di], dl
		mov	di, ax

loc_3266E:				; CODE XREF: Render_DrawEllipseOutline_32398+2C7j
					; Render_DrawEllipseOutline_32398+2CDj
		mov	si, word_4715C
		sub	si, word_47150
		cmp	si, word_47152
		jl	short loc_32687
		cmp	si, word_47156
		jg	short loc_32687
		add	di, [bp+si]
		mov	es:[di], dl

loc_32687:				; CODE XREF: Render_DrawEllipseOutline_32398+2B1j
					; Render_DrawEllipseOutline_32398+2B7j ...
		cmp	word_47178, 0
		jns	short loc_326B0
		inc	word_4714E
		mov	ax, word_4716E
		mov	dx, word_47170
		add	ax, word_4716A
		adc	dx, word_4716C
		mov	word_4716E, ax
		mov	word_47170, dx
		add	word_47176, ax
		adc	word_47178, dx

loc_326B0:				; CODE XREF: Render_DrawEllipseOutline_32398+2F4j
		sub	word_47150, 2
		mov	ax, word_47172
		mov	dx, word_47174
		sub	ax, word_47162
		sbb	dx, word_47164
		mov	word_47172, ax
		mov	word_47174, dx
		sub	ax, word_4715E
		sbb	dx, word_47160
		sub	word_47176, ax
		sbb	word_47178, dx
		dec	bx
		js	short loc_326E1
		jmp	loc_325EF
; ���������������������������������������������������������������������������

loc_326E1:				; CODE XREF: Render_DrawEllipseOutline_32398+3Bj
					; Render_DrawEllipseOutline_32398+344j
		pop	di
		pop	si
		pop	bp
		retf
Render_DrawEllipseOutline_32398	endp

seg116		ends
