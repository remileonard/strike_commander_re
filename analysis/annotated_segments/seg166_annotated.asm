seg166		segment	byte public 'CODE' use16
		assume cs:seg166
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 107 lignes, NON DÉTAILLÉE — référencée via vtable (DATA XREF seg216) — calcule la
; région de recouvrement entre deux rectangles (source si, destination bx) et copie les
; données correspondantes. Référencée par UI_ApplyEncodingHelper_5E576 et directement depuis
; seg143 — probable opération de blit/copie de zone à l'écran.
; ==============================================================================================
Rect_BlitOverlapRegion_60FE2	proc far		; CODE XREF: UI_ApplyEncodingHelper_5E576+10P
					; seg143:02D1P

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_60FE3:				; DATA XREF: seg216:05F6o
		mov	bp, sp

loc_60FE5:
		sub	sp, 6
		push	si
		push	di
		push	ds
		push	es
		cld
		mov	bx, [bp+arg_0]
		mov	si, [bp+arg_2]

loc_60FF3:
		mov	ax, [bx+4]
		mov	[bp+var_2], ax
		mov	cx, [si+4]

loc_60FFC:
		mov	[bp+var_4], cx

loc_60FFF:
		mov	ax, [si+8]

loc_61002:
		sub	ax, cx
		inc	ax
		mov	dx, [bx+8]

loc_61008:
		sub	dx, [bx+4]
		inc	dx
		cmp	dx, ax
		jbe	short loc_61012
		mov	dx, ax

loc_61012:				; CODE XREF: Rect_BlitOverlapRegion_60FE2+2Cj
		mov	cx, [si+0Ah]
		sub	cx, [si+6]
		inc	cx
		mov	ax, [bx+0Ah]
		sub	ax, [bx+6]
		inc	ax
		cmp	ax, cx
		jbe	short loc_61026
		mov	ax, cx

loc_61026:				; CODE XREF: Rect_BlitOverlapRegion_60FE2+40j
		mov	di, [si+2]
		mov	cx, [si+6]
		shl	cx, 1
		add	cx, di
		mov	[bp+var_6], cx

loc_61033:
		mov	di, [bx+2]
		mov	cx, [bx+6]
		shl	cx, 1
		add	cx, di
		mov	es, word ptr [si]
		mov	ds, word ptr [bx]
		mov	bx, cx

loc_61043:				; CODE XREF: Rect_BlitOverlapRegion_60FE2+82j
		mov	si, ss:[bx]

loc_61046:
		mov	di, [bp+var_6]
		mov	di, ss:[di]
		add	si, [bp+var_2]

loc_6104F:
		add	di, [bp+var_4]
		mov	cx, dx
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		add	[bp+var_6], 2

loc_61060:
		add	bx, 2

loc_61063:
		dec	ax
		jnz	short loc_61043

loc_61066:
		pop	es
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Rect_BlitOverlapRegion_60FE2	endp

seg166		ends
