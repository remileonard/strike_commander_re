seg164		segment	byte public 'CODE' use16
		assume cs:seg164
		;org 2
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, calcule l'intersection/le clamp de deux rectangles (tri min/max sur X et Y). Référencée
; depuis seg028 (framework UI) et sub_1EFFE — probable calcul de zone de rafraîchissement
; (clip) pour l'UI.
; ==============================================================================================
Rect_ComputeIntersection_60F02	proc far		; CODE XREF: seg028:0067P
					; RadioQueue_ExpireTimer+6CP ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	es, word ptr [bx]
		mov	di, [bx+2]
		mov	ax, [bp+arg_2]
		mov	cx, [bp+arg_6]
		cmp	ax, cx
		jle	short loc_60F1D
		xchg	ax, cx

loc_60F1D:				; CODE XREF: Rect_ComputeIntersection_60F02+18j
		mov	si, [bx+4]
		mov	dx, [bx+8]
		cmp	ax, dx
		jg	short loc_60F8D
		cmp	ax, si
		jge	short loc_60F2D
		mov	ax, si

loc_60F2D:				; CODE XREF: Rect_ComputeIntersection_60F02+27j
		mov	[bp+var_2], ax
		cmp	cx, si
		jl	short loc_60F8D
		cmp	cx, dx
		jle	short loc_60F3A
		mov	cx, dx

loc_60F3A:				; CODE XREF: Rect_ComputeIntersection_60F02+34j
		mov	[bp+var_4], cx
		mov	ax, [bx+6]
		mov	si, [bp+arg_4]

loc_60F43:
		mov	cx, [bp+arg_8]

loc_60F46:
		cmp	si, cx
		jle	short loc_60F4C
		xchg	si, cx

loc_60F4C:				; CODE XREF: Rect_ComputeIntersection_60F02+46j
		cmp	si, ax
		jge	short loc_60F52

loc_60F50:
		mov	si, ax

loc_60F52:				; CODE XREF: Rect_ComputeIntersection_60F02+4Cj
		mov	ax, [bx+0Ah]
		mov	bx, cx

loc_60F57:
		cmp	bx, ax
		jle	short loc_60F5D
		mov	bx, ax

loc_60F5D:				; CODE XREF: Rect_ComputeIntersection_60F02+57j
		mov	dx, [di+2]
		sub	dx, [di]
		sub	bx, si
		inc	bx
		shl	si, 1
		add	di, si
		mov	di, [di]
		add	di, [bp+var_2]
		mov	cx, [bp+var_4]
		sub	cx, [bp+var_2]
		inc	cx
		mov	si, cx
		mov	ax, [bp+arg_A]
		mov	ah, al

loc_60F7C:				; CODE XREF: Rect_ComputeIntersection_60F02+89j
		shr	cx, 1
		rep stosw
		adc	cx, cx

loc_60F82:
		rep stosb
		mov	cx, si
		sub	di, cx

loc_60F88:
		add	di, dx
		dec	bx
		jnz	short loc_60F7C

loc_60F8D:				; CODE XREF: Rect_ComputeIntersection_60F02+23j
					; Rect_ComputeIntersection_60F02+30j
		pop	di
		pop	si

loc_60F8F:
		mov	sp, bp
		pop	bp
		retf
Rect_ComputeIntersection_60F02	endp

seg164		ends
