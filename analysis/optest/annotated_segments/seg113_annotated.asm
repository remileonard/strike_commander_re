seg113		segment	byte public 'CODE' use16
		assume cs:seg113
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Rect_FillRegion_60F94
; (sub_60F94 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, calcule les dimensions d'un rectangle (à partir d'une structure bx) et remplit
; une région mémoire par motif répété (boucle de décalage). Référencée par
; TextFormat_ReleaseAttribute_5E5AC (seg143) et sub_A40B0.
; ==============================================================================================
Rect_FillRegion_31F7C	proc far		; CODE XREF: sub_E77F+160P
					; TextFormat_ReleaseAttribute_2EC80+11P

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
		shl	bx, 1
		add	bx, di

loc_31FAD:				; CODE XREF: Rect_FillRegion_31F7C+45j
		mov	di, ss:[bx]
		add	di, [bp+var_2]
		mov	cx, dx
		shr	cx, 1
		rep stosw
		rcl	cx, 1
		rep stosb
		add	bx, 2
		dec	si
		jnz	short loc_31FAD
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Rect_FillRegion_31F7C	endp

seg113		ends
