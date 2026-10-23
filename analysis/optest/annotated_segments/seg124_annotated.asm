seg124		segment	byte public 'CODE' use16
		assume cs:seg124
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_DrawOrMeasureTextVariant_625E2 (sub_625E2 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — ⚠️ far, 215 lignes, NON DÉTAILLÉE — référencée
; via vtable (DATA XREF seg216), même motif de vérification de capacité de buffer que
; Shape_DrawSpans_61F52 (comparaison (index+1)×4 contre le champ +4 d'une structure far).
; Référencée par CachedObject_BuildVariant_5E12A (seg141) — probable variante de rendu/mesure
; de texte pour le cluster d'objets mis en cache. Candidat pour session dédiée.
; ==============================================================================================
Render_DrawOrMeasureTextVariant_33368	proc far		; CODE XREF: CachedObject_BuildVariant_2D8E3+54P

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
		les	di, [bp+arg_A]
		mov	bx, [bp+arg_E]
		inc	bx
		shl	bx, 1
		shl	bx, 1
		cmp	es:[di+4], bx
		jb	short loc_33384
		jnz	short loc_33387

loc_33384:				; CODE XREF: Render_DrawOrMeasureTextVariant_33368+18j
		jmp	loc_33499
; ���������������������������������������������������������������������������

loc_33387:				; CODE XREF: Render_DrawOrMeasureTextVariant_33368+1Aj
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
		add	ax, di
		adc	dx, 0
		add	ax, es:[bx+di]
		adc	dx, es:[bx+di+2]
		mov	di, ax
		and	di, 0Fh
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
		mov	ax, es:[di]
		stc
		adc	ax, es:[di+2]
		mov	[bp+var_6], ax
		mov	[bp+var_E], ax
		mov	ax, es:[di+6]
		stc
		adc	ax, es:[di+4]
		mov	[bp+var_8], ax
		mov	[bp+var_10], ax
		mov	ax, [bp+arg_6]
		sub	ax, es:[di+2]
		cmp	ax, [bx+8]
		jg	short loc_3340E
		mov	[bp+var_4], ax
		mov	[bp+var_C], ax
		mov	ax, [bx+4]
		sub	ax, [bp+var_C]
		jl	short loc_33402
		sub	[bp+var_E], ax
		mov	ax, [bx+4]
		mov	[bp+var_C], ax

loc_33402:				; CODE XREF: Render_DrawOrMeasureTextVariant_33368+8Fj
		mov	ax, [bp+arg_8]
		sub	ax, es:[di+4]
		cmp	ax, [bx+0Ah]
		jle	short loc_33411

loc_3340E:				; CODE XREF: Render_DrawOrMeasureTextVariant_33368+81j
		jmp	loc_33499
; ���������������������������������������������������������������������������

loc_33411:				; CODE XREF: Render_DrawOrMeasureTextVariant_33368+A4j
		mov	[bp+var_2], ax
		mov	[bp+var_A], ax
		mov	ax, [bx+6]
		sub	ax, [bp+var_A]
		jl	short loc_33428
		sub	[bp+var_10], ax
		mov	ax, [bx+6]
		mov	[bp+var_A], ax

loc_33428:				; CODE XREF: Render_DrawOrMeasureTextVariant_33368+B5j
		mov	ax, [bp+arg_6]
		add	ax, es:[di]
		cmp	ax, [bx+4]
		jl	short loc_33445
		sub	ax, [bx+8]
		jle	short loc_3343B
		sub	[bp+var_E], ax

loc_3343B:				; CODE XREF: Render_DrawOrMeasureTextVariant_33368+CEj
		mov	ax, [bp+arg_8]
		add	ax, es:[di+6]
		cmp	ax, [bx+6]

loc_33445:				; CODE XREF: Render_DrawOrMeasureTextVariant_33368+C9j
		jl	short loc_33499
		sub	ax, [bx+0Ah]
		jle	short loc_3344F
		sub	[bp+var_10], ax

loc_3344F:				; CODE XREF: Render_DrawOrMeasureTextVariant_33368+E2j
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_2]
		mul	[bp+var_6]
		mov	si, ax
		mov	dx, [bp+var_C]
		sub	dx, [bp+var_4]
		add	si, dx
		mov	ax, [bp+arg_4]
		mov	[bp+var_12], ax
		mov	es, word ptr [bx]
		add	si, [bp+arg_2]
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bx+2]
		mov	bx, ax
		mov	ds, [bp+var_12]

loc_3347A:				; CODE XREF: Render_DrawOrMeasureTextVariant_33368+12Fj
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
		dec	[bp+var_10]
		jnz	short loc_3347A

loc_33499:				; CODE XREF: Render_DrawOrMeasureTextVariant_33368:loc_33384j
					; Render_DrawOrMeasureTextVariant_33368:loc_3340Ej	...
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Render_DrawOrMeasureTextVariant_33368	endp

seg124		ends
