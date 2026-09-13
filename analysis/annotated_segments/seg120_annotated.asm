seg120		segment	byte public 'CODE' use16
		assume cs:seg120
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, recherche les métriques d'un glyphe (largeur/hauteur/bbox) dans une table de police
; (pointeur gs:), retourne 4 champs dans la structure appelante. Référencée par sub_87718.
; ==============================================================================================
Font_GetGlyphMetrics_58DFE	proc far		; CODE XREF: Font_ApplyStyleAndMeasure_87718+67P

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		enter	0, 0
		push	si
		les	si, [bp+arg_2]
		mov	ax, gs
		cmp	ax, 0
		jz	short loc_58E36
		mov	bx, [bp+arg_6]
		shl	bx, 1
		add	si, es:[bx+si+2]
		mov	bx, [bp+arg_0]
		mov	ax, es:[si+4]
		mov	[bx+4],	ax

loc_58E20:
		add	ax, es:[si]
		dec	ax
		mov	[bx+8],	ax

loc_58E27:
		mov	ax, es:[si+6]
		mov	[bx+6],	ax
		add	ax, es:[si+2]
		dec	ax
		mov	[bx+0Ah], ax

loc_58E36:				; CODE XREF: Font_GetGlyphMetrics_58DFE+Dj
		pop	si
		leave
		retf
Font_GetGlyphMetrics_58DFE	endp

; ���������������������������������������������������������������������������
		enter	4, 0
		push	si
		push	di
		push	ds
		mov	bx, [bp+0Eh]
		shl	bx, 1
		lgs	si, [bp+0Ah]
		mov	ax, gs
		cmp	ax, 0
		jz	loc_58ED0
		add	si, gs:[bx+si+2]
		mov	bx, [bp+8]
		mov	es, word ptr [bx]
		mov	ax, [bx+2]
		mov	[bp-4],	ax
		mov	bx, [bp+6]
		mov	ax, [bx+2]
		mov	[bp-2],	ax
		mov	ds, word ptr [bx]
		add	si, 4
		lods	word ptr gs:[si]
		mov	dx, ax
		lods	word ptr gs:[si]
		shl	ax, 1
		jmp	short loc_58EC8
; ���������������������������������������������������������������������������

loc_58E79:				; CODE XREF: seg120:00DEj
		mov	bx, gs:[si+2]
		shl	bx, 1
		mov	cx, gs:[si+4]
		add	si, 6
		push	si
		mov	si, [bp-2]
		sub	bx, ax
		mov	si, ss:[bx+si]
		add	bx, ax
		add	si, di
		sub	si, dx
		add	bx, [bp-4]
		add	di, ss:[bx]
		push	ax
		test	di, 3
		jz	short loc_58EB7
		mov	ax, di
		and	ax, 3
		neg	ax
		add	ax, 4
		cmp	cx, ax
		jle	short loc_58EC4
		sub	cx, ax
		xchg	ax, cx
		rep movsb
		mov	cx, ax

loc_58EB7:				; CODE XREF: seg120:00B0j
		mov	ax, cx
		shr	cx, 2
		rep movsd
		mov	cx, ax
		and	cx, 3

loc_58EC4:				; CODE XREF: seg120:00BEj
		rep movsb
		pop	ax
		pop	si

loc_58EC8:				; CODE XREF: seg120:0087j
		mov	di, gs:[si]
		cmp	di, 0FFFFh
		jnz	short loc_58E79

loc_58ED0:				; CODE XREF: seg120:005Ej
		pop	ds
		pop	di
		pop	si
		leave
		retf
seg120		ends
