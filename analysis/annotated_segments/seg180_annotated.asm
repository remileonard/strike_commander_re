seg180		segment	byte public 'CODE' use16
		assume cs:seg180
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 255 lignes, NON DÉTAILLÉE — même motif exact que
; Render_DrawOrMeasureTextVariant_625E2 (seg177, vérification de capacité (index+1)×4 contre
; le champ +4 d'une structure far). Référencée par CachedObject_BuildComposite_5E00C (seg141)
; — probable variante supplémentaire de rendu/mesure de texte pour le cluster d'objets mis en
; cache. Identité exacte vis-à-vis de sub_625E2 non vérifiée.
; ==============================================================================================
Render_DrawOrMeasureTextVariantB_62BFE	proc far		; CODE XREF: CachedObject_BuildComposite_5E00C+7CP

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

loc_62C01:
		sub	sp, 12h
		push	si
		push	di

loc_62C06:
		push	ds

loc_62C07:
		les	si, [bp+arg_A]
		mov	bx, [bp+arg_E]
		inc	bx
		shl	bx, 1
		shl	bx, 1

loc_62C12:
		cmp	es:[si+4], bx
		jb	short loc_62C1A

loc_62C18:
		jnz	short loc_62C1D

loc_62C1A:				; CODE XREF: Render_DrawOrMeasureTextVariantB_62BFE+18j
		jmp	loc_62D2F
; ���������������������������������������������������������������������������

loc_62C1D:				; CODE XREF: Render_DrawOrMeasureTextVariantB_62BFE:loc_62C18j
		mov	ax, es
		mov	dx, 0

loc_62C22:
		shl	ax, 1
		rcl	dx, 1

loc_62C26:
		shl	ax, 1
		rcl	dx, 1

loc_62C2A:
		shl	ax, 1

loc_62C2C:
		rcl	dx, 1
		shl	ax, 1

loc_62C30:
		rcl	dx, 1

loc_62C32:
		add	ax, si

loc_62C34:
		adc	dx, 0

loc_62C37:
		add	ax, es:[bx+si]
		adc	dx, es:[bx+si+2]

loc_62C3E:
		mov	si, ax
		and	si, 0Fh

loc_62C43:
		shr	dx, 1
		rcr	ax, 1

loc_62C47:
		shr	dx, 1

loc_62C49:
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1

loc_62C4F:
		shr	dx, 1

loc_62C51:
		rcr	ax, 1
		mov	es, ax

loc_62C55:
		mov	bx, [bp+arg_0]

loc_62C58:
		mov	ax, es:[si]
		stc
		adc	ax, es:[si+2]
		mov	[bp+var_6], ax
		mov	[bp+var_E], ax
		mov	ax, es:[si+6]
		stc
		adc	ax, es:[si+4]

loc_62C6F:
		mov	[bp+var_8], ax
		mov	[bp+var_10], ax

loc_62C75:
		mov	ax, [bp+arg_6]
		sub	ax, es:[si+2]
		cmp	ax, [bx+8]
		jg	short loc_62CA4

loc_62C81:
		mov	[bp+var_4], ax

loc_62C84:
		mov	[bp+var_C], ax

loc_62C87:
		mov	ax, [bx+4]

loc_62C8A:
		sub	ax, [bp+var_C]
		jl	short loc_62C98

loc_62C8F:
		sub	[bp+var_E], ax

loc_62C92:
		mov	ax, [bx+4]

loc_62C95:
		mov	[bp+var_C], ax

loc_62C98:				; CODE XREF: Render_DrawOrMeasureTextVariantB_62BFE+8Fj
		mov	ax, [bp+arg_8]
		sub	ax, es:[si+4]
		cmp	ax, [bx+0Ah]
		jle	short loc_62CA7

loc_62CA4:				; CODE XREF: Render_DrawOrMeasureTextVariantB_62BFE+81j
		jmp	loc_62D2F
; ���������������������������������������������������������������������������

loc_62CA7:				; CODE XREF: Render_DrawOrMeasureTextVariantB_62BFE+A4j
		mov	[bp+var_2], ax
		mov	[bp+var_A], ax
		mov	ax, [bx+6]
		sub	ax, [bp+var_A]
		jl	short loc_62CBE
		sub	[bp+var_10], ax
		mov	ax, [bx+6]
		mov	[bp+var_A], ax

loc_62CBE:				; CODE XREF: Render_DrawOrMeasureTextVariantB_62BFE+B5j
		mov	ax, [bp+arg_6]
		add	ax, es:[si]

loc_62CC4:
		cmp	ax, [bx+4]
		jl	short loc_62CDB
		sub	ax, [bx+8]
		jle	short loc_62CD1
		sub	[bp+var_E], ax

loc_62CD1:				; CODE XREF: Render_DrawOrMeasureTextVariantB_62BFE+CEj
		mov	ax, [bp+arg_8]
		add	ax, es:[si+6]
		cmp	ax, [bx+6]

loc_62CDB:				; CODE XREF: Render_DrawOrMeasureTextVariantB_62BFE+C9j
		jl	short loc_62D2F
		sub	ax, [bx+0Ah]
		jle	short loc_62CE5
		sub	[bp+var_10], ax

loc_62CE5:				; CODE XREF: Render_DrawOrMeasureTextVariantB_62BFE+E2j
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_2]
		mul	[bp+var_6]
		mov	di, ax

loc_62CF0:
		mov	dx, [bp+var_C]
		sub	dx, [bp+var_4]

loc_62CF6:
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

loc_62D10:				; CODE XREF: Render_DrawOrMeasureTextVariantB_62BFE+12Fj
		mov	si, ss:[bx]

loc_62D13:
		add	si, [bp+var_C]

loc_62D16:
		mov	cx, [bp+var_E]

loc_62D19:
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb

loc_62D21:
		add	bx, 2

loc_62D24:
		sub	di, [bp+var_E]

loc_62D27:
		add	di, [bp+var_6]

loc_62D2A:
		dec	[bp+var_10]
		jnz	short loc_62D10

loc_62D2F:				; CODE XREF: Render_DrawOrMeasureTextVariantB_62BFE:loc_62C1Aj
					; Render_DrawOrMeasureTextVariantB_62BFE:loc_62CA4j	...
		pop	ds

loc_62D30:
		pop	di

loc_62D31:
		pop	si

loc_62D32:
		mov	sp, bp
		pop	bp
		retf
Render_DrawOrMeasureTextVariantB_62BFE	endp

seg180		ends
