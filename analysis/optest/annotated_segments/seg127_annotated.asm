seg127		segment	byte public 'CODE' use16
		assume cs:seg127
		;org 4
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_DrawOrMeasureTextVariantB_62BFE (sub_62BFE de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 255 lignes, NON DÉTAILLÉE —
; même motif exact que Render_DrawOrMeasureTextVariant_625E2 (seg177, vérification de capacité
; (index+1)×4 contre le champ +4 d'une structure far). Référencée par
; CachedObject_BuildComposite_5E00C (seg141) — probable variante supplémentaire de
; rendu/mesure de texte pour le cluster d'objets mis en cache. Identité exacte vis-à-vis de
; sub_625E2 non vérifiée.
; ==============================================================================================
Render_DrawOrMeasureTextVariantB_33984	proc far		; CODE XREF: CachedObject_BuildComposite_2D7C5+7CP

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

loc_33985:				; DATA XREF: seg170:04CEo
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		push	ds
		les	si, [bp+arg_A]
		mov	bx, [bp+arg_E]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	es:[si+4], bx
		jb	short loc_339A0
		jnz	short loc_339A3

loc_339A0:				; CODE XREF: Render_DrawOrMeasureTextVariantB_33984+18j
		jmp	loc_33AB5
; ���������������������������������������������������������������������������

loc_339A3:				; CODE XREF: Render_DrawOrMeasureTextVariantB_33984+1Aj
		mov	ax, es
		mov	dx, 0
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
		add	ax, es:[bx+si]
		adc	dx, es:[bx+si+2]
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
		mov	es, ax
		mov	bx, [bp+arg_0]
		mov	ax, es:[si]
		stc
		adc	ax, es:[si+2]
		mov	[bp+var_6], ax
		mov	[bp+var_E], ax
		mov	ax, es:[si+6]
		stc
		adc	ax, es:[si+4]
		mov	[bp+var_8], ax
		mov	[bp+var_10], ax
		mov	ax, [bp+arg_6]
		sub	ax, es:[si+2]
		cmp	ax, [bx+8]
		jg	short loc_33A2A
		mov	[bp+var_4], ax
		mov	[bp+var_C], ax
		mov	ax, [bx+4]
		sub	ax, [bp+var_C]
		jl	short loc_33A1E
		sub	[bp+var_E], ax
		mov	ax, [bx+4]
		mov	[bp+var_C], ax

loc_33A1E:				; CODE XREF: Render_DrawOrMeasureTextVariantB_33984+8Fj
		mov	ax, [bp+arg_8]
		sub	ax, es:[si+4]
		cmp	ax, [bx+0Ah]
		jle	short loc_33A2D

loc_33A2A:				; CODE XREF: Render_DrawOrMeasureTextVariantB_33984+81j
		jmp	loc_33AB5
; ���������������������������������������������������������������������������

loc_33A2D:				; CODE XREF: Render_DrawOrMeasureTextVariantB_33984+A4j
		mov	[bp+var_2], ax
		mov	[bp+var_A], ax
		mov	ax, [bx+6]
		sub	ax, [bp+var_A]
		jl	short loc_33A44
		sub	[bp+var_10], ax
		mov	ax, [bx+6]
		mov	[bp+var_A], ax

loc_33A44:				; CODE XREF: Render_DrawOrMeasureTextVariantB_33984+B5j
		mov	ax, [bp+arg_6]
		add	ax, es:[si]
		cmp	ax, [bx+4]
		jl	short loc_33A61
		sub	ax, [bx+8]
		jle	short loc_33A57
		sub	[bp+var_E], ax

loc_33A57:				; CODE XREF: Render_DrawOrMeasureTextVariantB_33984+CEj
		mov	ax, [bp+arg_8]
		add	ax, es:[si+6]
		cmp	ax, [bx+6]

loc_33A61:				; CODE XREF: Render_DrawOrMeasureTextVariantB_33984+C9j
		jl	short loc_33AB5
		sub	ax, [bx+0Ah]
		jle	short loc_33A6B
		sub	[bp+var_10], ax

loc_33A6B:				; CODE XREF: Render_DrawOrMeasureTextVariantB_33984+E2j
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_2]
		mul	[bp+var_6]
		mov	di, ax
		mov	dx, [bp+var_C]
		sub	dx, [bp+var_4]
		add	di, dx
		mov	ax, [bx]
		mov	[bp+var_12], ax
		mov	es, [bp+arg_4]
		add	di, [bp+arg_2]
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bx+2]
		mov	bx, ax
		mov	ds, [bp+var_12]

loc_33A96:				; CODE XREF: Render_DrawOrMeasureTextVariantB_33984+12Fj
		mov	si, ss:[bx]
		add	si, [bp+var_C]
		mov	cx, [bp+var_E]
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		add	bx, 2
		sub	di, [bp+var_E]
		add	di, [bp+var_6]
		dec	[bp+var_10]
		jnz	short loc_33A96

loc_33AB5:				; CODE XREF: Render_DrawOrMeasureTextVariantB_33984:loc_339A0j
					; Render_DrawOrMeasureTextVariantB_33984:loc_33A2Aj	...
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Render_DrawOrMeasureTextVariantB_33984	endp

seg127		ends
