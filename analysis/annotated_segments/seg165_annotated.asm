seg165		segment	byte public 'CODE' use16
		assume cs:seg165
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, calcule les dimensions d'un rectangle (à partir d'une structure bx) et remplit une
; région mémoire par motif répété (boucle de décalage). Référencée par
; TextFormat_ReleaseAttribute_5E5AC (seg143) et sub_A40B0.
; ==============================================================================================
Rect_FillRegion_60F94	proc far		; CODE XREF: TextFormat_ReleaseAttribute_5E5AC+11P
					; GaugeWidget_RenderModeDispatch_A40B0+12EP

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		cld
		mov	ax, [bp+arg_2]
		mov	ah, al
		mov	bx, [bp+arg_0]
		mov	es, word ptr [bx]
		mov	dx, [bx+4]
		mov	[bp+var_2], dx
		mov	dx, [bx+8]
		sub	dx, [bp+var_2]
		inc	dx
		mov	si, [bx+0Ah]
		sub	si, [bx+6]
		inc	si
		mov	di, [bx+2]
		mov	bx, [bx+6]

loc_60FC1:
		shl	bx, 1

loc_60FC3:
		add	bx, di

loc_60FC5:				; CODE XREF: Rect_FillRegion_60F94:loc_60FD9j
		mov	di, ss:[bx]
		add	di, [bp+var_2]
		mov	cx, dx

loc_60FCD:
		shr	cx, 1

loc_60FCF:
		rep stosw
		rcl	cx, 1

loc_60FD3:
		rep stosb
		add	bx, 2

loc_60FD8:
		dec	si

loc_60FD9:
		jnz	short loc_60FC5
		pop	di
		pop	si
		mov	sp, bp
		pop	bp

locret_60FE0:
		retf
Rect_FillRegion_60F94	endp

seg165		ends
