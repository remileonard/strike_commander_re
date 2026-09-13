seg177		segment	byte public 'CODE' use16
		assume cs:seg177
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 215 lignes, NON DÉTAILLÉE — référencée via vtable (DATA XREF seg216), même motif de
; vérification de capacité de buffer que Render_MeasureOrDrawTextString_61F52 (comparaison
; (index+1)×4 contre le champ +4 d'une structure far). Référencée par
; CachedObject_BuildVariant_5E12A (seg141) — probable variante de rendu/mesure de texte pour
; le cluster d'objets mis en cache. Candidat pour session dédiée.
; ==============================================================================================
Render_DrawOrMeasureTextVariant_625E2	proc far		; CODE XREF: CachedObject_BuildVariant_5E12A+54P

var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		push	ds

loc_625EB:				; DATA XREF: seg216:064Eo
		les	di, [bp+arg_A]
		mov	bx, [bp+arg_E]
		inc	bx
		shl	bx, 1

loc_625F4:
		shl	bx, 1
		cmp	es:[di+4], bx
		jb	short loc_625FE
		jnz	short loc_62601

loc_625FE:				; CODE XREF: Render_DrawOrMeasureTextVariant_625E2+18j
		jmp	loc_62713
; ���������������������������������������������������������������������������

loc_62601:				; CODE XREF: Render_DrawOrMeasureTextVariant_625E2+1Aj
		mov	ax, es
		mov	dx, 0
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1

loc_62612:
		shl	ax, 1
		rcl	dx, 1
		add	ax, di
		adc	dx, 0

loc_6261B:
		add	ax, es:[bx+di]
		adc	dx, es:[bx+di+2]
		mov	di, ax
		and	di, 0Fh
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1

loc_62631:
		rcr	ax, 1

loc_62633:
		shr	dx, 1

loc_62635:
		rcr	ax, 1
		mov	es, ax
		mov	bx, [bp+arg_0]
		mov	ax, es:[di]
		stc
		adc	ax, es:[di+2]

loc_62644:
		mov	[bp+var_6], ax

loc_62647:
		mov	[bp+var_E], ax
		mov	ax, es:[di+6]

loc_6264E:
		stc
		adc	ax, es:[di+4]

loc_62653:
		mov	[bp+var_8], ax
		mov	[bp+var_10], ax
		mov	ax, [bp+arg_6]
		sub	ax, es:[di+2]
		cmp	ax, [bx+8]
		jg	short loc_62688
		mov	[bp+var_4], ax
		mov	[bp+var_C], ax
		mov	ax, [bx+4]
		sub	ax, [bp+var_C]
		jl	short loc_6267C
		sub	[bp+var_E], ax
		mov	ax, [bx+4]
		mov	[bp+var_C], ax

loc_6267C:				; CODE XREF: Render_DrawOrMeasureTextVariant_625E2+8Fj
		mov	ax, [bp+arg_8]

loc_6267F:
		sub	ax, es:[di+4]

loc_62683:
		cmp	ax, [bx+0Ah]

loc_62686:
		jle	short loc_6268B

loc_62688:				; CODE XREF: Render_DrawOrMeasureTextVariant_625E2+81j
		jmp	loc_62713
; ���������������������������������������������������������������������������

loc_6268B:				; CODE XREF: Render_DrawOrMeasureTextVariant_625E2:loc_62686j
		mov	[bp+var_2], ax
		mov	[bp+var_A], ax
		mov	ax, [bx+6]
		sub	ax, [bp+var_A]
		jl	short loc_626A2
		sub	[bp+var_10], ax
		mov	ax, [bx+6]
		mov	[bp+var_A], ax

loc_626A2:				; CODE XREF: Render_DrawOrMeasureTextVariant_625E2+B5j
		mov	ax, [bp+arg_6]
		add	ax, es:[di]
		cmp	ax, [bx+4]
		jl	short loc_626BF
		sub	ax, [bx+8]
		jle	short loc_626B5
		sub	[bp+var_E], ax

loc_626B5:				; CODE XREF: Render_DrawOrMeasureTextVariant_625E2+CEj
		mov	ax, [bp+arg_8]

loc_626B8:
		add	ax, es:[di+6]
		cmp	ax, [bx+6]

loc_626BF:				; CODE XREF: Render_DrawOrMeasureTextVariant_625E2+C9j
		jl	short loc_62713

loc_626C1:
		sub	ax, [bx+0Ah]
		jle	short loc_626C9

loc_626C6:
		sub	[bp+var_10], ax

loc_626C9:				; CODE XREF: Render_DrawOrMeasureTextVariant_625E2+E2j
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_2]

loc_626CF:
		mul	[bp+var_6]
		mov	si, ax

loc_626D4:
		mov	dx, [bp+var_C]
		sub	dx, [bp+var_4]
		add	si, dx
		mov	ax, [bp+arg_4]

loc_626DF:
		mov	[bp+var_12], ax

loc_626E2:
		mov	es, word ptr [bx]
		add	si, [bp+arg_2]

loc_626E7:
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bx+2]
		mov	bx, ax
		mov	ds, [bp+var_12]

loc_626F4:				; CODE XREF: Render_DrawOrMeasureTextVariant_625E2+12Fj
		mov	di, ss:[bx]
		add	di, [bp+var_C]
		mov	cx, [bp+var_E]
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		add	bx, 2
		sub	si, [bp+var_E]
		add	si, [bp+var_6]

loc_6270E:
		dec	[bp+var_10]
		jnz	short loc_626F4

loc_62713:				; CODE XREF: Render_DrawOrMeasureTextVariant_625E2:loc_625FEj
					; Render_DrawOrMeasureTextVariant_625E2:loc_62688j	...
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Render_DrawOrMeasureTextVariant_625E2	endp

seg177		ends
