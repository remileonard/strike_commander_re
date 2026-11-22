seg125		segment	byte public 'CODE' use16
		assume cs:seg125
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_BlitClippedRegion_6271A (sub_6271A de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 194 lignes, NON DÉTAILLÉE — calcule les
; dimensions et bornes d'une région rectangulaire (structure di, champs 0/2/4/6) pour une
; opération de blit/copie. Référencée deux fois par sub_A40B0 (même appelant que
; Rect_FillRegion_60F94, seg165) — probable primitive de copie de bloc à l'écran avec
; clipping.
; ==============================================================================================
Render_BlitClippedRegion_334A0	proc far		; CODE XREF: sub_CE2C+2D3P
					; sub_E77F+75P	...

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

loc_334A8:				; DATA XREF: seg170:04BEo
		push	ds
		mov	ax, ds
		mov	es, ax
		assume es:dseg
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
		mov	cx, [di+2]
		sub	ax, cx
		inc	ax
		mov	[bp+var_8], ax
		mov	[bp+var_10], ax
		pop	cx
		mov	ax, [di]
		cmp	ax, [bx+8]
		jg	short loc_334F8
		mov	[bp+var_4], ax
		mov	[bp+var_C], ax
		mov	ax, [bx+4]
		sub	ax, [bp+var_C]
		jl	short loc_334F0
		sub	[bp+var_E], ax
		mov	ax, [bx+4]
		mov	[bp+var_C], ax

loc_334F0:				; CODE XREF: Render_BlitClippedRegion_334A0+45j
		mov	ax, [di+2]
		cmp	ax, [bx+0Ah]
		jle	short loc_334FB

loc_334F8:				; CODE XREF: Render_BlitClippedRegion_334A0+37j
		jmp	loc_3357F
; ���������������������������������������������������������������������������

loc_334FB:				; CODE XREF: Render_BlitClippedRegion_334A0+56j
		mov	[bp+var_2], ax
		mov	[bp+var_A], ax
		mov	ax, [bx+6]
		sub	ax, [bp+var_A]
		jl	short loc_33512
		sub	[bp+var_10], ax
		mov	ax, [bx+6]
		mov	[bp+var_A], ax

loc_33512:				; CODE XREF: Render_BlitClippedRegion_334A0+67j
		mov	ax, [di+4]
		cmp	ax, [bx+4]
		jl	short loc_33528
		sub	ax, [bx+8]
		jle	short loc_33522
		sub	[bp+var_E], ax

loc_33522:				; CODE XREF: Render_BlitClippedRegion_334A0+7Dj
		mov	ax, [di+6]
		cmp	ax, [bx+6]

loc_33528:				; CODE XREF: Render_BlitClippedRegion_334A0+78j
		jl	short loc_3357F
		sub	ax, [bx+0Ah]
		jle	short loc_33532
		sub	[bp+var_10], ax

loc_33532:				; CODE XREF: Render_BlitClippedRegion_334A0+8Dj
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_2]
		mul	[bp+var_6]
		mov	si, ax
		mov	dx, [bp+var_C]
		sub	dx, [bp+var_4]
		add	si, dx
		mov	ax, [bp+arg_4]
		mov	[bp+var_12], ax
		mov	bx, [bp+arg_0]
		mov	es, word ptr [bx]
		assume es:nothing
		add	si, [bp+arg_2]
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bx+2]
		mov	bx, ax
		mov	ds, [bp+var_12]

loc_33560:				; CODE XREF: Render_BlitClippedRegion_334A0+DDj
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
		jnz	short loc_33560

loc_3357F:				; CODE XREF: Render_BlitClippedRegion_334A0:loc_334F8j
					; Render_BlitClippedRegion_334A0:loc_33528j
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Render_BlitClippedRegion_334A0	endp

seg125		ends
