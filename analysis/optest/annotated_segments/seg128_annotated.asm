seg128		segment	byte public 'CODE' use16
		assume cs:seg128
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_BlitClippedRegionVariant_62D36 (sub_62D36 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — ⚠️ far, 166 lignes, NON DÉTAILLÉE — référencée
; via vtable (DATA XREF seg216), même motif que Render_BlitClippedRegion_6271A (seg178) :
; calcule dimensions et bornes d'une région rectangulaire (structure si, champs 0/2/4/6) pour
; un blit. Référencée par sub_A3EA5.
; ==============================================================================================
Render_BlitClippedRegionVariant_33ABC	proc far		; CODE XREF: sub_CE2C+23FP
					; sub_E52D+175P ...

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
		push	cx
		mov	si, [bp+arg_6]
		mov	bx, [bp+arg_0]
		mov	cx, [si]
		mov	ax, [si+4]
		sub	ax, cx
		inc	ax
		mov	[bp+var_6], ax
		mov	[bp+var_E], ax
		mov	ax, [si+6]
		mov	cx, [si+2]
		sub	ax, cx
		inc	ax
		mov	[bp+var_8], ax
		mov	[bp+var_10], ax
		pop	cx
		mov	ax, [si]
		cmp	ax, [bx+8]
		jg	short loc_33B10
		mov	[bp+var_4], ax
		mov	[bp+var_C], ax
		mov	ax, [bx+4]
		sub	ax, [bp+var_C]
		jl	short loc_33B08
		sub	[bp+var_E], ax
		mov	ax, [bx+4]
		mov	[bp+var_C], ax

loc_33B08:				; CODE XREF: Render_BlitClippedRegionVariant_33ABC+41j
		mov	ax, [si+2]
		cmp	ax, [bx+0Ah]
		jle	short loc_33B13

loc_33B10:				; CODE XREF: Render_BlitClippedRegionVariant_33ABC+33j
		jmp	loc_33B94
; ���������������������������������������������������������������������������

loc_33B13:				; CODE XREF: Render_BlitClippedRegionVariant_33ABC+52j
		mov	[bp+var_2], ax
		mov	[bp+var_A], ax
		mov	ax, [bx+6]
		sub	ax, [bp+var_A]
		jl	short loc_33B2A
		sub	[bp+var_10], ax
		mov	ax, [bx+6]
		mov	[bp+var_A], ax

loc_33B2A:				; CODE XREF: Render_BlitClippedRegionVariant_33ABC+63j
		mov	ax, [si+4]
		cmp	ax, [bx+4]
		jl	short loc_33B40
		sub	ax, [bx+8]
		jle	short loc_33B3A
		sub	[bp+var_E], ax

loc_33B3A:				; CODE XREF: Render_BlitClippedRegionVariant_33ABC+79j
		mov	ax, [si+6]
		cmp	ax, [bx+6]

loc_33B40:				; CODE XREF: Render_BlitClippedRegionVariant_33ABC+74j
		jl	short loc_33B94
		sub	ax, [bx+0Ah]
		jle	short loc_33B4A
		sub	[bp+var_10], ax

loc_33B4A:				; CODE XREF: Render_BlitClippedRegionVariant_33ABC+89j
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

loc_33B75:				; CODE XREF: Render_BlitClippedRegionVariant_33ABC+D6j
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
		jnz	short loc_33B75

loc_33B94:				; CODE XREF: Render_BlitClippedRegionVariant_33ABC:loc_33B10j
					; Render_BlitClippedRegionVariant_33ABC:loc_33B40j
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Render_BlitClippedRegionVariant_33ABC	endp

seg128		ends
