seg119		segment	byte public 'CODE' use16
		assume cs:seg119
		;org 4
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_DrawHorizontalLineClipped_61B8E (sub_61B8E de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 201 lignes, NON DÉTAILLÉE —
; trace une ligne horizontale clippée (couleur arg_A) contre les bornes d'un contexte
; graphique (bx, champs +4/+8), même famille que
; Render_SetPixelClipped_61B58/Render_FillClippedRect_61960. Référencée par sub_A1CE1 et
; sub_A1E6D (cluster non encore couvert, probable proche du seg170-180).
; ==============================================================================================
Render_DrawHorizontalLineClipped_32914	proc far		; CODE XREF: sub_DE60+2FP seg022:0907P ...

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
		mov	bx, [bp+arg_0]
		mov	es, word ptr [bx]

loc_3291E:				; DATA XREF: seg170:048Eo
		mov	ax, [bp+arg_A]
		mov	ah, al
		mov	word_4717A, ax
		mov	ax, [bx+4]
		mov	word_4717E, ax
		mov	ax, [bx+8]
		mov	word_47182, ax
		mov	si, [bp+arg_2]
		cmp	si, word_47182
		jg	short loc_32999
		mov	word_47184, si
		cmp	si, word_4717E
		jge	short loc_32949
		mov	si, word_4717E

loc_32949:				; CODE XREF: Render_DrawHorizontalLineClipped_32914+2Fj
		mov	word_47188, si
		mov	si, [bp+arg_6]
		cmp	si, word_4717E
		jl	short loc_32999
		mov	word_47186, si
		cmp	si, word_47182
		jle	short loc_32964
		mov	si, word_47182

loc_32964:				; CODE XREF: Render_DrawHorizontalLineClipped_32914+4Aj
		mov	word_4718A, si
		mov	ax, [bx+6]
		shl	ax, 1
		mov	word_4717C, ax
		mov	ax, [bx+0Ah]
		shl	ax, 1
		mov	word_47180, ax
		mov	ax, [bp+arg_4]
		shl	ax, 1
		cmp	ax, word_47180
		jg	short loc_32999
		mov	word_4718E, ax
		mov	ax, [bp+arg_8]
		shl	ax, 1
		cmp	ax, word_4717C
		jl	short loc_32999
		mov	word_4718C, ax
		mov	bp, [bx+2]
		jmp	short loc_3299C
; ���������������������������������������������������������������������������

loc_32999:				; CODE XREF: Render_DrawHorizontalLineClipped_32914+25j
					; Render_DrawHorizontalLineClipped_32914+40j ...
		jmp	loc_32A54
; ���������������������������������������������������������������������������

loc_3299C:				; CODE XREF: Render_DrawHorizontalLineClipped_32914+83j
		mov	si, word_4718E
		cmp	si, word_4717C
		jl	short loc_329C7
		mov	di, word_47188
		mov	cx, word_4718A
		sub	cx, di
		inc	cx
		add	di, [bp+si]
		mov	ax, word_4717A
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		add	word_4718E, 2
		jmp	short loc_329CF
; ���������������������������������������������������������������������������

loc_329C7:				; CODE XREF: Render_DrawHorizontalLineClipped_32914+90j
		mov	si, word_4717C
		mov	word_4718E, si

loc_329CF:				; CODE XREF: Render_DrawHorizontalLineClipped_32914+B1j
		mov	si, word_4718C
		cmp	si, word_47180
		jg	short loc_329FA
		mov	di, word_47188
		mov	cx, word_4718A
		sub	cx, di
		inc	cx
		add	di, [bp+si]
		mov	ax, word_4717A
		mov	ah, al
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		sub	word_4718C, 2
		jmp	short loc_32A02
; ���������������������������������������������������������������������������

loc_329FA:				; CODE XREF: Render_DrawHorizontalLineClipped_32914+C3j
		mov	si, word_47180
		mov	word_4718C, si

loc_32A02:				; CODE XREF: Render_DrawHorizontalLineClipped_32914+E4j
		mov	di, word_47184
		cmp	di, word_4717E
		jl	short loc_32A2B
		mov	si, word_4718E
		cmp	si, word_4718C
		jg	short loc_32A54
		mov	cx, di
		mov	ax, word_4717A

loc_32A1B:				; CODE XREF: Render_DrawHorizontalLineClipped_32914+115j
		mov	di, cx
		add	di, [bp+si]
		mov	es:[di], al
		add	si, 2
		cmp	si, word_4718C
		jle	short loc_32A1B

loc_32A2B:				; CODE XREF: Render_DrawHorizontalLineClipped_32914+F6j
		mov	di, word_47186
		cmp	di, word_47182
		jg	short loc_32A54
		mov	si, word_4718E
		cmp	si, word_4718C
		jg	short loc_32A54
		mov	cx, di
		mov	ax, word_4717A

loc_32A44:				; CODE XREF: Render_DrawHorizontalLineClipped_32914+13Ej
		mov	di, cx
		add	di, [bp+si]
		mov	es:[di], al
		add	si, 2
		cmp	si, word_4718C
		jle	short loc_32A44

loc_32A54:				; CODE XREF: Render_DrawHorizontalLineClipped_32914:loc_32999j
					; Render_DrawHorizontalLineClipped_32914+100j ...
		pop	di
		pop	si
		pop	bp
		retf
Render_DrawHorizontalLineClipped_32914	endp

seg119		ends
