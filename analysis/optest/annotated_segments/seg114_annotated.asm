seg114		segment	byte public 'CODE' use16
		assume cs:seg114
		;org 0Ah
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Rect_BlitOverlapRegion_60FE2 (sub_60FE2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 107 lignes, NON DÉTAILLÉE — référencée via
; vtable (DATA XREF seg216) — calcule la région de recouvrement entre deux rectangles (source
; si, destination bx) et copie les données correspondantes. Référencée par
; UI_ApplyEncodingHelper_5E576 et directement depuis seg143 — probable opération de blit/copie
; de zone à l'écran.
; ==============================================================================================
Rect_BlitOverlapRegion_31FCA	proc far		; CODE XREF: UI_ApplyEncodingHelper_2EC4A+10P
					; UI_ApplyEncodingHelper_2EC65+10P

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_31FCB:				; DATA XREF: seg170:0466o
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		push	ds
		push	es
		cld
		mov	bx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	ax, [bx+4]
		mov	[bp+var_2], ax
		mov	cx, [si+4]
		mov	[bp+var_4], cx
		mov	ax, [si+8]
		sub	ax, cx
		inc	ax
		mov	dx, [bx+8]
		sub	dx, [bx+4]
		inc	dx
		cmp	dx, ax
		jbe	short loc_31FFA
		mov	dx, ax

loc_31FFA:				; CODE XREF: Rect_BlitOverlapRegion_31FCA+2Cj
		mov	cx, [si+0Ah]
		sub	cx, [si+6]
		inc	cx
		mov	ax, [bx+0Ah]
		sub	ax, [bx+6]
		inc	ax
		cmp	ax, cx
		jbe	short loc_3200E
		mov	ax, cx

loc_3200E:				; CODE XREF: Rect_BlitOverlapRegion_31FCA+40j
		mov	di, [si+2]
		mov	cx, [si+6]
		shl	cx, 1
		add	cx, di
		mov	[bp+var_6], cx
		mov	di, [bx+2]
		mov	cx, [bx+6]
		shl	cx, 1
		add	cx, di
		mov	es, word ptr [si]
		mov	ds, word ptr [bx]
		mov	bx, cx

loc_3202B:				; CODE XREF: Rect_BlitOverlapRegion_31FCA+82j
		mov	si, ss:[bx]
		mov	di, [bp+var_6]
		mov	di, ss:[di]
		add	si, [bp+var_2]
		add	di, [bp+var_4]
		mov	cx, dx
		shr	cx, 1
		rep movsw
		rcl	cx, 1
		rep movsb
		add	[bp+var_6], 2
		add	bx, 2
		dec	ax
		jnz	short loc_3202B
		pop	es
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Rect_BlitOverlapRegion_31FCA	endp

seg114		ends
