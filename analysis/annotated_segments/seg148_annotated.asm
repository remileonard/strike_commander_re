seg148		segment	byte public 'CODE' use16
		assume cs:seg148
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, valide l'index d'un caractère contre le compteur de glyphes d'une police (table far ptr
; par glyphe, 4 octets/entrée), récupère les 4 valeurs de la fonte (bearing/avance) et calcule
; la boîte englobante du glyphe positionné au curseur (cx,dx) dans la structure de sortie.
; Appelée par Text_ComputeMaxLineWidth_5E6BF/Text_ComputeMaxLineHeight_5E706 (seg146-147) pour
; accumuler les dimensions d'un texte multi-lignes. Référencée aussi par sub_1450B.
; ==============================================================================================
Font_ComputeGlyphBoundingBox_5E74E	proc far		; CODE XREF: UI_RenderFormattedText+77P
					; UI_RenderFormattedText+104P ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		push	ds
		push	es

loc_5E753:
		push	si
		push	di
		lds	si, [bp+arg_2]
		mov	bx, [bp+arg_0]
		mov	ax, ds
		xor	dx, dx
		shl	ax, 1
		rcl	dx, 1

loc_5E763:
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
		jl	short loc_5E781
		xor	ax, ax
		jmp	short loc_5E7CE
; ���������������������������������������������������������������������������

loc_5E781:				; CODE XREF: Font_ComputeGlyphBoundingBox_5E74E+2Dj
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

loc_5E7CE:				; CODE XREF: Font_ComputeGlyphBoundingBox_5E74E+31j
		pop	di
		pop	si

loc_5E7D0:
		pop	es
		pop	ds
		pop	bp
		retf	0Eh
Font_ComputeGlyphBoundingBox_5E74E	endp

seg148		ends
