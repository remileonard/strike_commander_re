seg172		segment	byte public 'CODE' use16
		assume cs:seg172
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 201 lignes, NON DÉTAILLÉE — trace une ligne horizontale clippée (couleur arg_A)
; contre les bornes d'un contexte graphique (bx, champs +4/+8), même famille que
; Render_SetPixelClipped_61B58/Render_FillClippedRect_61960. Référencée par sub_A1CE1 et
; sub_A1E6D (cluster non encore couvert, probable proche du seg170-180).
; ==============================================================================================
Render_DrawHorizontalLineClipped_61B8E	proc far		; CODE XREF: PaletteScreen_DrawWidgetBorderA_A1CE1+57P
					; PaletteScreen_DrawWidgetBorderB_A1E6D+56P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp

loc_61B8F:
		mov	bp, sp
		push	si

loc_61B92:
		push	di

loc_61B93:
		mov	bx, [bp+arg_0]

loc_61B96:
		mov	es, word ptr [bx]
		mov	ax, [bp+arg_A]
		mov	ah, al
		mov	word_70FA0, ax
		mov	ax, [bx+4]
		mov	word_70FA4, ax
		mov	ax, [bx+8]
		mov	word_70FA8, ax
		mov	si, [bp+arg_2]
		cmp	si, word_70FA8
		jg	short loc_61C13
		mov	word_70FAA, si
		cmp	si, word_70FA4
		jge	short loc_61BC3

loc_61BBF:
		mov	si, word_70FA4

loc_61BC3:				; CODE XREF: Render_DrawHorizontalLineClipped_61B8E+2Fj
		mov	word_70FAE, si
		mov	si, [bp+arg_6]
		cmp	si, word_70FA4
		jl	short loc_61C13
		mov	word_70FAC, si

loc_61BD4:
		cmp	si, word_70FA8
		jle	short loc_61BDE
		mov	si, word_70FA8

loc_61BDE:				; CODE XREF: Render_DrawHorizontalLineClipped_61B8E+4Aj
		mov	word_70FB0, si

loc_61BE2:
		mov	ax, [bx+6]
		shl	ax, 1
		mov	word_70FA2, ax
		mov	ax, [bx+0Ah]
		shl	ax, 1
		mov	word_70FA6, ax

loc_61BF2:
		mov	ax, [bp+arg_4]
		shl	ax, 1
		cmp	ax, word_70FA6
		jg	short loc_61C13

loc_61BFD:
		mov	word_70FB4, ax

loc_61C00:
		mov	ax, [bp+arg_8]

loc_61C03:
		shl	ax, 1
		cmp	ax, word_70FA2
		jl	short loc_61C13
		mov	word_70FB2, ax
		mov	bp, [bx+2]
		jmp	short loc_61C16
; ���������������������������������������������������������������������������

loc_61C13:				; CODE XREF: Render_DrawHorizontalLineClipped_61B8E+25j
					; Render_DrawHorizontalLineClipped_61B8E+40j ...
		jmp	loc_61CCE
; ���������������������������������������������������������������������������

loc_61C16:				; CODE XREF: Render_DrawHorizontalLineClipped_61B8E+83j
		mov	si, word_70FB4
		cmp	si, word_70FA2
		jl	short loc_61C41
		mov	di, word_70FAE
		mov	cx, word_70FB0
		sub	cx, di
		inc	cx
		add	di, [bp+si]
		mov	ax, word_70FA0

loc_61C30:
		mov	ah, al

loc_61C32:
		shr	cx, 1
		rep stosw

loc_61C36:
		rcl	cx, 1
		rep stosb
		add	word_70FB4, 2

loc_61C3F:
		jmp	short loc_61C49
; ���������������������������������������������������������������������������

loc_61C41:				; CODE XREF: Render_DrawHorizontalLineClipped_61B8E+90j
		mov	si, word_70FA2
		mov	word_70FB4, si

loc_61C49:				; CODE XREF: Render_DrawHorizontalLineClipped_61B8E:loc_61C3Fj
		mov	si, word_70FB2
		cmp	si, word_70FA6

loc_61C51:
		jg	short loc_61C74
		mov	di, word_70FAE
		mov	cx, word_70FB0
		sub	cx, di
		inc	cx
		add	di, [bp+si]
		mov	ax, word_70FA0
		mov	ah, al

loc_61C65:
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		sub	word_70FB2, 2
		jmp	short loc_61C7C
; ���������������������������������������������������������������������������

loc_61C74:				; CODE XREF: Render_DrawHorizontalLineClipped_61B8E:loc_61C51j
		mov	si, word_70FA6
		mov	word_70FB2, si

loc_61C7C:				; CODE XREF: Render_DrawHorizontalLineClipped_61B8E+E4j
		mov	di, word_70FAA
		cmp	di, word_70FA4
		jl	short loc_61CA5

loc_61C86:
		mov	si, word_70FB4
		cmp	si, word_70FB2

loc_61C8E:
		jg	short loc_61CCE
		mov	cx, di
		mov	ax, word_70FA0

loc_61C95:				; CODE XREF: Render_DrawHorizontalLineClipped_61B8E+115j
		mov	di, cx
		add	di, [bp+si]
		mov	es:[di], al
		add	si, 2
		cmp	si, word_70FB2
		jle	short loc_61C95

loc_61CA5:				; CODE XREF: Render_DrawHorizontalLineClipped_61B8E+F6j
		mov	di, word_70FAC
		cmp	di, word_70FA8
		jg	short loc_61CCE
		mov	si, word_70FB4
		cmp	si, word_70FB2
		jg	short loc_61CCE
		mov	cx, di
		mov	ax, word_70FA0

loc_61CBE:				; CODE XREF: Render_DrawHorizontalLineClipped_61B8E+13Ej
		mov	di, cx
		add	di, [bp+si]

loc_61CC2:
		mov	es:[di], al
		add	si, 2
		cmp	si, word_70FB2
		jle	short loc_61CBE

loc_61CCE:				; CODE XREF: Render_DrawHorizontalLineClipped_61B8E:loc_61C13j
					; Render_DrawHorizontalLineClipped_61B8E:loc_61C8Ej	...
		pop	di
		pop	si

loc_61CD0:
		pop	bp

locret_61CD1:
		retf
Render_DrawHorizontalLineClipped_61B8E	endp

seg172		ends
