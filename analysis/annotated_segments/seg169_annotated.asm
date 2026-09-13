seg169		segment	byte public 'CODE' use16
		assume cs:seg169
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 454 lignes, NON DÉTAILLÉE EN PROFONDEUR — même signature et même structure que
; Render_DrawFilledEllipse_6106E (seg167), cas dégénéré délégué au même sub_61960. Probable
; variante « contour seul » (non rempli) de l'algorithme d'ellipse — identité exacte non
; vérifiée. Référencée depuis seg020 et seg059.
; ==============================================================================================
Render_DrawEllipseOutline_61612	proc far		; CODE XREF: seg020:loc_18331P
					; seg059:0512P	...

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
		jz	short loc_61623
		cmp	[bp+arg_8], 0
		jnz	short loc_61650

loc_61623:				; CODE XREF: Render_DrawEllipseOutline_61612+9j
		push	[bp+arg_A]
		mov	ax, [bp+arg_4]
		add	ax, [bp+arg_8]
		push	ax
		mov	ax, [bp+arg_2]

loc_61630:
		add	ax, [bp+arg_6]
		push	ax
		mov	ax, [bp+arg_4]

loc_61637:
		sub	ax, [bp+arg_8]
		push	ax
		mov	ax, [bp+arg_2]
		sub	ax, [bp+arg_6]
		push	ax

loc_61642:
		push	[bp+arg_0]

loc_61645:
		call	Render_FillClippedRect_61960

loc_6164A:
		add	sp, 0Ch
		jmp	loc_6195B
; ���������������������������������������������������������������������������

loc_61650:				; CODE XREF: Render_DrawEllipseOutline_61612+Fj
		mov	si, [bp+arg_0]

loc_61653:
		mov	es, word ptr [si]

loc_61655:
		mov	ax, [si+8]
		mov	word_70F7E, ax
		mov	ax, [si+4]
		mov	word_70F7A, ax

loc_61661:
		mov	ax, [si+6]
		shl	ax, 1

loc_61666:
		mov	word_70F78, ax

loc_61669:
		mov	ax, [si+0Ah]
		shl	ax, 1

loc_6166E:
		mov	word_70F7C, ax
		mov	ax, [bp+arg_A]

loc_61674:
		mov	ah, al
		mov	word_70F72, ax
		mov	ax, [bp+arg_2]
		mov	word_70F80, ax
		mov	ax, [bp+arg_4]
		shl	ax, 1
		mov	word_70F82, ax
		mov	word_70F74, 0
		mov	ax, [bp+arg_8]
		shl	ax, 1

loc_61692:
		mov	word_70F76, ax
		mov	ax, [bp+arg_6]
		mul	ax
		mov	word_70F84, ax
		mov	word_70F86, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_70F88, ax
		mov	word_70F8A, dx
		mov	ax, [bp+arg_8]
		mul	ax
		mov	word_70F8C, ax
		mov	word_70F8E, dx
		shl	ax, 1
		rcl	dx, 1
		mov	word_70F90, ax
		mov	word_70F92, dx

loc_616C3:
		mov	word_70F94, 0
		mov	word_70F96, 0

loc_616CF:
		mov	ax, word_70F88

loc_616D2:
		mov	dx, word_70F8A

loc_616D6:
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	ax, cx
		pop	dx
		mul	dx
		add	dx, cx
		mov	word_70F98, ax
		mov	word_70F9A, dx
		mov	ax, word_70F84

loc_616EE:
		mov	dx, word_70F86
		sar	dx, 1
		rcr	ax, 1
		sar	dx, 1
		rcr	ax, 1
		add	ax, word_70F8C
		add	dx, word_70F8E

loc_61702:
		mov	word_70F9C, ax
		mov	word_70F9E, dx
		mov	ax, word_70F84
		mov	dx, word_70F86
		mov	cx, [bp+arg_8]
		push	ax
		mov	ax, dx
		mul	cx
		xchg	ax, cx
		pop	dx
		mul	dx
		add	dx, cx
		sub	word_70F9C, ax
		sbb	word_70F9E, dx
		mov	bx, [bp+arg_8]
		mov	bp, [si+2]

loc_6172C:				; CODE XREF: Render_DrawEllipseOutline_61612+21Bj
		mov	ax, word_70F94

loc_6172F:
		mov	dx, word_70F96
		sub	ax, word_70F98
		sbb	dx, word_70F9A
		js	short loc_61740
		jmp	loc_61830
; ���������������������������������������������������������������������������

loc_61740:				; CODE XREF: Render_DrawEllipseOutline_61612+129j
		mov	dx, word_70F72

loc_61744:
		mov	di, word_70F80

loc_61748:
		add	di, word_70F74

loc_6174C:
		cmp	di, word_70F7E
		jg	short loc_6178E
		cmp	di, word_70F7A
		jl	short loc_6178E
		mov	ax, di
		mov	si, word_70F82

loc_6175E:
		add	si, word_70F76
		cmp	si, word_70F78
		jl	short loc_61775
		cmp	si, word_70F7C
		jg	short loc_61775
		add	di, [bp+si]
		mov	es:[di], dl
		mov	di, ax

loc_61775:				; CODE XREF: Render_DrawEllipseOutline_61612+154j
					; Render_DrawEllipseOutline_61612+15Aj
		mov	si, word_70F82
		sub	si, word_70F76
		cmp	si, word_70F78
		jl	short loc_6178E
		cmp	si, word_70F7C
		jg	short loc_6178E
		add	di, [bp+si]
		mov	es:[di], dl

loc_6178E:				; CODE XREF: Render_DrawEllipseOutline_61612+13Ej
					; Render_DrawEllipseOutline_61612+144j ...
		mov	di, word_70F80
		sub	di, word_70F74
		cmp	di, word_70F7E
		jg	short loc_617D8
		cmp	di, word_70F7A
		jl	short loc_617D8
		mov	ax, di
		mov	si, word_70F82
		add	si, word_70F76
		cmp	si, word_70F78
		jl	short loc_617BF
		cmp	si, word_70F7C
		jg	short loc_617BF
		add	di, [bp+si]
		mov	es:[di], dl
		mov	di, ax

loc_617BF:				; CODE XREF: Render_DrawEllipseOutline_61612+19Ej
					; Render_DrawEllipseOutline_61612+1A4j
		mov	si, word_70F82

loc_617C3:
		sub	si, word_70F76
		cmp	si, word_70F78

loc_617CB:
		jl	short loc_617D8
		cmp	si, word_70F7C

loc_617D1:
		jg	short loc_617D8

loc_617D3:
		add	di, [bp+si]

loc_617D5:
		mov	es:[di], dl

loc_617D8:				; CODE XREF: Render_DrawEllipseOutline_61612+188j
					; Render_DrawEllipseOutline_61612+18Ej ...
		cmp	word_70F9E, 0
		js	short loc_61803

loc_617DF:
		sub	word_70F76, 2
		dec	bx
		mov	ax, word_70F98

loc_617E8:
		mov	dx, word_70F9A
		sub	ax, word_70F88
		sbb	dx, word_70F8A

loc_617F4:
		mov	word_70F98, ax

loc_617F7:
		mov	word_70F9A, dx

loc_617FB:
		sub	word_70F9C, ax
		sbb	word_70F9E, dx

loc_61803:				; CODE XREF: Render_DrawEllipseOutline_61612+1CBj
		inc	word_70F74
		mov	ax, word_70F94
		mov	dx, word_70F96
		add	ax, word_70F90
		adc	dx, word_70F92
		mov	word_70F94, ax
		mov	word_70F96, dx
		add	ax, word_70F8C
		adc	dx, word_70F8E
		add	word_70F9C, ax
		adc	word_70F9E, dx
		jmp	loc_6172C
; ���������������������������������������������������������������������������

loc_61830:				; CODE XREF: Render_DrawEllipseOutline_61612+12Bj
		push	bx

loc_61831:
		mov	ax, word_70F84
		mov	dx, word_70F86
		sub	ax, word_70F8C
		sbb	dx, word_70F8E

loc_61840:
		mov	bx, ax
		mov	cx, dx

loc_61844:
		sar	dx, 1
		rcr	ax, 1
		add	ax, bx
		adc	dx, cx
		sub	ax, word_70F94
		sbb	dx, word_70F96
		sub	ax, word_70F98
		sbb	dx, word_70F9A
		sar	dx, 1
		rcr	ax, 1

loc_61860:
		add	word_70F9C, ax
		adc	word_70F9E, dx
		pop	bx

loc_61869:				; CODE XREF: Render_DrawEllipseOutline_61612+346j
		mov	dx, word_70F72
		mov	di, word_70F80

loc_61871:
		add	di, word_70F74
		cmp	di, word_70F7E
		jg	short loc_618B7
		cmp	di, word_70F7A
		jl	short loc_618B7

loc_61881:
		mov	ax, di

loc_61883:
		mov	si, word_70F82

loc_61887:
		add	si, word_70F76
		cmp	si, word_70F78

loc_6188F:
		jl	short loc_6189E

loc_61891:
		cmp	si, word_70F7C
		jg	short loc_6189E
		add	di, [bp+si]
		mov	es:[di], dl
		mov	di, ax

loc_6189E:				; CODE XREF: Render_DrawEllipseOutline_61612:loc_6188Fj
					; Render_DrawEllipseOutline_61612+283j
		mov	si, word_70F82
		sub	si, word_70F76
		cmp	si, word_70F78
		jl	short loc_618B7
		cmp	si, word_70F7C
		jg	short loc_618B7
		add	di, [bp+si]
		mov	es:[di], dl

loc_618B7:				; CODE XREF: Render_DrawEllipseOutline_61612+267j
					; Render_DrawEllipseOutline_61612+26Dj ...
		mov	di, word_70F80
		sub	di, word_70F74
		cmp	di, word_70F7E
		jg	short loc_61901

loc_618C5:
		cmp	di, word_70F7A

loc_618C9:
		jl	short loc_61901
		mov	ax, di
		mov	si, word_70F82
		add	si, word_70F76
		cmp	si, word_70F78

loc_618D9:
		jl	short loc_618E8

loc_618DB:
		cmp	si, word_70F7C

loc_618DF:
		jg	short loc_618E8

loc_618E1:
		add	di, [bp+si]

loc_618E3:
		mov	es:[di], dl
		mov	di, ax

loc_618E8:				; CODE XREF: Render_DrawEllipseOutline_61612:loc_618D9j
					; Render_DrawEllipseOutline_61612:loc_618DFj
		mov	si, word_70F82
		sub	si, word_70F76

loc_618F0:
		cmp	si, word_70F78
		jl	short loc_61901

loc_618F6:
		cmp	si, word_70F7C
		jg	short loc_61901
		add	di, [bp+si]
		mov	es:[di], dl

loc_61901:				; CODE XREF: Render_DrawEllipseOutline_61612+2B1j
					; Render_DrawEllipseOutline_61612:loc_618C9j	...
		cmp	word_70F9E, 0
		jns	short loc_6192A
		inc	word_70F74
		mov	ax, word_70F94
		mov	dx, word_70F96
		add	ax, word_70F90
		adc	dx, word_70F92
		mov	word_70F94, ax
		mov	word_70F96, dx
		add	word_70F9C, ax
		adc	word_70F9E, dx

loc_6192A:				; CODE XREF: Render_DrawEllipseOutline_61612+2F4j
		sub	word_70F76, 2
		mov	ax, word_70F98

loc_61932:
		mov	dx, word_70F9A

loc_61936:
		sub	ax, word_70F88

loc_6193A:
		sbb	dx, word_70F8A
		mov	word_70F98, ax

loc_61941:
		mov	word_70F9A, dx
		sub	ax, word_70F84
		sbb	dx, word_70F86
		sub	word_70F9C, ax

loc_61951:
		sbb	word_70F9E, dx
		dec	bx
		js	short loc_6195B
		jmp	loc_61869
; ���������������������������������������������������������������������������

loc_6195B:				; CODE XREF: Render_DrawEllipseOutline_61612+3Bj
					; Render_DrawEllipseOutline_61612+344j
		pop	di
		pop	si
		pop	bp
		retf
Render_DrawEllipseOutline_61612	endp

seg169		ends
