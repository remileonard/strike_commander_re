seg090		segment	byte public 'CODE' use16
		assume cs:seg090
		;org 2
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Font_ComputeGlyphBoundingBox_5E74E (sub_5E74E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, valide l'index d'un caractère contre le
; compteur de glyphes d'une police (table far ptr par glyphe, 4 octets/entrée), récupère les 4
; valeurs de la fonte (bearing/avance) et calcule la boîte englobante du glyphe positionné au
; curseur (cx,dx) dans la structure de sortie. Appelée par
; Text_ComputeMaxLineWidth_5E6BF/Text_ComputeMaxLineHeight_5E706 (seg146-147) pour accumuler
; les dimensions d'un texte multi-lignes. Référencée aussi par sub_1450B.
; ==============================================================================================
Font_ComputeGlyphBoundingBox_2EF02	proc far		; CODE XREF: CachedObject_BuildAndTransform_2D682+6BP
					; seg108:0133P	...

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h

		push	bp

loc_2EF03:				; DATA XREF: seg170:03A6o
		mov	bp, sp
		push	ds
		push	es
		push	si
		push	di
		lds	si, [bp+arg_2]
		mov	bx, [bp+arg_0]
		mov	ax, ds
		xor	dx, dx
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
		shl	bx, 1
		shl	bx, 1
		cmp	bx, [si+4]
		jl	short loc_2EF35
		xor	ax, ax
		jmp	short loc_2EF82
; ���������������������������������������������������������������������������

loc_2EF35:				; CODE XREF: Font_ComputeGlyphBoundingBox_2EF02+2Dj
		add	bx, 4
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
		les	di, [bp+arg_A]
		mov	cx, [bp+arg_8]
		mov	dx, [bp+arg_6]
		mov	ax, [si]
		add	ax, cx
		mov	es:[di+4], ax
		mov	ax, cx
		sub	ax, [si+2]
		mov	es:[di], ax
		mov	ax, dx
		sub	ax, [si+4]
		mov	es:[di+2], ax
		mov	ax, [si+6]
		add	ax, dx
		mov	es:[di+6], ax
		mov	ax, 0FFFFh

loc_2EF82:				; CODE XREF: Font_ComputeGlyphBoundingBox_2EF02+31j
		pop	di
		pop	si
		pop	es
		pop	ds
		pop	bp
		retf	0Eh
Font_ComputeGlyphBoundingBox_2EF02	endp

seg090		ends
