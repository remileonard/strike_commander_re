seg178		segment	byte public 'CODE' use16
		assume cs:seg178
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 194 lignes, NON DÉTAILLÉE — calcule les dimensions et bornes d'une région
; rectangulaire (structure di, champs 0/2/4/6) pour une opération de blit/copie. Référencée
; deux fois par sub_A40B0 (même appelant que Rect_FillRegion_60F94, seg165) — probable
; primitive de copie de bloc à l'écran avec clipping.
; ==============================================================================================
Render_BlitClippedRegion_6271A	proc far		; CODE XREF: GaugeWidget_RenderModeDispatch_A40B0+72P
					; GaugeWidget_RenderModeDispatch_A40B0+DEP

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

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		push	ds
		mov	ax, ds
		mov	es, ax
		assume es:seg339
		mov	di, [bp+arg_6]
		mov	bx, [bp+arg_0]
		push	cx
		mov	ax, [di+4]
		mov	cx, [di]
		sub	ax, cx
		inc	ax
		mov	[bp+var_6], ax
		mov	[bp+var_E], ax
		mov	ax, [di+6]

loc_6273F:
		mov	cx, [di+2]

loc_62742:
		sub	ax, cx

loc_62744:
		inc	ax
		mov	[bp+var_8], ax

loc_62748:
		mov	[bp+var_10], ax
		pop	cx
		mov	ax, [di]
		cmp	ax, [bx+8]
		jg	short loc_62772

loc_62753:
		mov	[bp+var_4], ax

loc_62756:
		mov	[bp+var_C], ax
		mov	ax, [bx+4]

loc_6275C:
		sub	ax, [bp+var_C]

loc_6275F:
		jl	short loc_6276A

loc_62761:
		sub	[bp+var_E], ax

loc_62764:
		mov	ax, [bx+4]

loc_62767:
		mov	[bp+var_C], ax

loc_6276A:				; CODE XREF: Render_BlitClippedRegion_6271A:loc_6275Fj
		mov	ax, [di+2]
		cmp	ax, [bx+0Ah]
		jle	short loc_62775

loc_62772:				; CODE XREF: Render_BlitClippedRegion_6271A+37j
		jmp	loc_627F9
; ���������������������������������������������������������������������������

loc_62775:				; CODE XREF: Render_BlitClippedRegion_6271A+56j
		mov	[bp+var_2], ax
		mov	[bp+var_A], ax

loc_6277B:
		mov	ax, [bx+6]

loc_6277E:
		sub	ax, [bp+var_A]

loc_62781:
		jl	short loc_6278C

loc_62783:
		sub	[bp+var_10], ax

loc_62786:
		mov	ax, [bx+6]
		mov	[bp+var_A], ax

loc_6278C:				; CODE XREF: Render_BlitClippedRegion_6271A:loc_62781j
		mov	ax, [di+4]

loc_6278F:
		cmp	ax, [bx+4]

loc_62792:
		jl	short loc_627A2
		sub	ax, [bx+8]

loc_62797:
		jle	short loc_6279C
		sub	[bp+var_E], ax

loc_6279C:				; CODE XREF: Render_BlitClippedRegion_6271A:loc_62797j
		mov	ax, [di+6]
		cmp	ax, [bx+6]

loc_627A2:				; CODE XREF: Render_BlitClippedRegion_6271A:loc_62792j
		jl	short loc_627F9
		sub	ax, [bx+0Ah]
		jle	short loc_627AC
		sub	[bp+var_10], ax

loc_627AC:				; CODE XREF: Render_BlitClippedRegion_6271A+8Dj
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_2]

loc_627B2:
		mul	[bp+var_6]
		mov	si, ax

loc_627B7:
		mov	dx, [bp+var_C]

loc_627BA:
		sub	dx, [bp+var_4]
		add	si, dx

loc_627BF:
		mov	ax, [bp+arg_4]

loc_627C2:
		mov	[bp+var_12], ax

loc_627C5:
		mov	bx, [bp+arg_0]
		mov	es, word ptr [bx]
		assume es:nothing
		add	si, [bp+arg_2]
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bx+2]
		mov	bx, ax

loc_627D7:
		mov	ds, [bp+var_12]

loc_627DA:				; CODE XREF: Render_BlitClippedRegion_6271A+DDj
		mov	di, ss:[bx]
		add	di, [bp+var_C]

loc_627E0:
		mov	cx, [bp+var_E]
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		add	bx, 2
		sub	si, [bp+var_E]

loc_627F1:
		add	si, [bp+var_6]

loc_627F4:
		dec	[bp+var_10]
		jnz	short loc_627DA

loc_627F9:				; CODE XREF: Render_BlitClippedRegion_6271A:loc_62772j
					; Render_BlitClippedRegion_6271A:loc_627A2j
		pop	ds
		pop	di
		pop	si

loc_627FC:
		mov	sp, bp
		pop	bp
		retf
Render_BlitClippedRegion_6271A	endp

seg178		ends
