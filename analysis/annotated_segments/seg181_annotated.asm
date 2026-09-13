seg181		segment	byte public 'CODE' use16
		assume cs:seg181
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 166 lignes, NON DÉTAILLÉE — référencée via vtable (DATA XREF seg216), même motif que
; Render_BlitClippedRegion_6271A (seg178) : calcule dimensions et bornes d'une région
; rectangulaire (structure si, champs 0/2/4/6) pour un blit. Référencée par sub_A3EA5.
; ==============================================================================================
Render_BlitClippedRegionVariant_62D36	proc far		; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+162P

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

loc_62D37:
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di

loc_62D3E:				; DATA XREF: seg216:066Eo
		push	ds
		push	cx

loc_62D40:
		mov	si, [bp+arg_6]

loc_62D43:
		mov	bx, [bp+arg_0]

loc_62D46:
		mov	cx, [si]
		mov	ax, [si+4]

loc_62D4B:
		sub	ax, cx
		inc	ax
		mov	[bp+var_6], ax

loc_62D51:
		mov	[bp+var_E], ax

loc_62D54:
		mov	ax, [si+6]

loc_62D57:
		mov	cx, [si+2]

loc_62D5A:
		sub	ax, cx
		inc	ax
		mov	[bp+var_8], ax

loc_62D60:
		mov	[bp+var_10], ax
		pop	cx
		mov	ax, [si]

loc_62D66:
		cmp	ax, [bx+8]
		jg	short loc_62D8A
		mov	[bp+var_4], ax
		mov	[bp+var_C], ax

loc_62D71:
		mov	ax, [bx+4]
		sub	ax, [bp+var_C]
		jl	short loc_62D82
		sub	[bp+var_E], ax
		mov	ax, [bx+4]

loc_62D7F:
		mov	[bp+var_C], ax

loc_62D82:				; CODE XREF: Render_BlitClippedRegionVariant_62D36+41j
		mov	ax, [si+2]

loc_62D85:
		cmp	ax, [bx+0Ah]
		jle	short loc_62D8D

loc_62D8A:				; CODE XREF: Render_BlitClippedRegionVariant_62D36+33j
		jmp	loc_62E0E
; ���������������������������������������������������������������������������

loc_62D8D:				; CODE XREF: Render_BlitClippedRegionVariant_62D36+52j
		mov	[bp+var_2], ax
		mov	[bp+var_A], ax
		mov	ax, [bx+6]
		sub	ax, [bp+var_A]
		jl	short loc_62DA4
		sub	[bp+var_10], ax
		mov	ax, [bx+6]
		mov	[bp+var_A], ax

loc_62DA4:				; CODE XREF: Render_BlitClippedRegionVariant_62D36+63j
		mov	ax, [si+4]
		cmp	ax, [bx+4]
		jl	short loc_62DBA
		sub	ax, [bx+8]
		jle	short loc_62DB4
		sub	[bp+var_E], ax

loc_62DB4:				; CODE XREF: Render_BlitClippedRegionVariant_62D36+79j
		mov	ax, [si+6]
		cmp	ax, [bx+6]

loc_62DBA:				; CODE XREF: Render_BlitClippedRegionVariant_62D36+74j
		jl	short loc_62E0E
		sub	ax, [bx+0Ah]
		jle	short loc_62DC4
		sub	[bp+var_10], ax

loc_62DC4:				; CODE XREF: Render_BlitClippedRegionVariant_62D36+89j
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_2]
		mul	[bp+var_6]
		mov	di, ax

loc_62DCF:
		mov	dx, [bp+var_C]
		sub	dx, [bp+var_4]
		add	di, dx
		mov	ax, [bx]
		mov	[bp+var_12], ax
		mov	es, [bp+arg_4]
		add	di, [bp+arg_2]

loc_62DE2:
		mov	ax, [bp+var_A]
		shl	ax, 1
		add	ax, [bx+2]
		mov	bx, ax
		mov	ds, [bp+var_12]

loc_62DEF:				; CODE XREF: Render_BlitClippedRegionVariant_62D36+D6j
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
		jnz	short loc_62DEF

loc_62E0E:				; CODE XREF: Render_BlitClippedRegionVariant_62D36:loc_62D8Aj
					; Render_BlitClippedRegionVariant_62D36:loc_62DBAj
		pop	ds
		pop	di

loc_62E10:
		pop	si

loc_62E11:
		mov	sp, bp
		pop	bp
		retf
Render_BlitClippedRegionVariant_62D36	endp

seg181		ends
