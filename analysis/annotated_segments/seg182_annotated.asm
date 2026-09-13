seg182		segment	byte public 'CODE' use16
		assume cs:seg182
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 136 lignes, NON DÉTAILLÉE — référencée via vtable (DATA XREF seg216), même motif que
; Rect_BlitOverlapRegion_60FE2 (seg166) : calcule l'intersection entre deux rectangles
; (source/destination) avant copie. Référencée par sub_86965.
; ==============================================================================================
Rect_BlitOverlapRegionVariant_62E16	proc far		; CODE XREF: HUDSymbol_BlitOverlapRegion_86965+43P
					; DATA XREF: seg216:0676o

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		enter	0Ah, 0
		push	si
		push	di
		push	ds
		cld
		mov	bx, [bp+arg_0]

loc_62E21:
		mov	si, [bp+arg_2]
		mov	ax, [bx+4]

loc_62E27:
		mov	[bp+var_2], ax

loc_62E2A:
		mov	cx, [si+4]
		mov	[bp+var_4], cx

loc_62E30:
		mov	ax, [si+8]
		sub	ax, cx
		inc	ax
		mov	dx, [bx+8]
		sub	dx, [bx+4]
		inc	dx
		cmp	dx, ax
		jbe	short loc_62E43

loc_62E41:
		mov	dx, ax

loc_62E43:				; CODE XREF: Rect_BlitOverlapRegionVariant_62E16+29j
		mov	cx, [si+0Ah]
		sub	cx, [si+6]
		inc	cx

loc_62E4A:
		mov	ax, [bx+0Ah]
		sub	ax, [bx+6]
		inc	ax

loc_62E51:
		cmp	ax, cx

loc_62E53:
		jbe	short loc_62E57
		mov	ax, cx

loc_62E57:				; CODE XREF: Rect_BlitOverlapRegionVariant_62E16:loc_62E53j
		push	word ptr [bx]
		push	word ptr [si]
		mov	cx, dx
		mov	dx, ax
		mov	ax, [si+6]

loc_62E62:
		mov	si, [si+2]
		shl	ax, 1
		add	si, ax
		mov	ax, [si+2]
		sub	ax, [si]
		mov	[bp+var_8], ax

loc_62E71:
		mov	ax, [bx+6]
		mov	di, [bx+2]
		shl	ax, 1
		add	di, ax
		mov	ax, [di+2]
		sub	ax, [di]

loc_62E80:
		mov	[bp+var_6], ax

loc_62E83:
		xchg	si, di
		mov	si, [si]
		add	si, [bp+var_2]
		mov	di, [di]
		add	di, [bp+var_4]
		mov	[bp+var_A], dx

loc_62E92:
		mov	dx, [bp+arg_6]
		mov	bx, [bp+arg_4]
		shl	ebx, 10h
		pop	es
		pop	ds

loc_62E9E:				; CODE XREF: Rect_BlitOverlapRegionVariant_62E16:loc_62EC0j
		push	cx
		xor	bx, bx

loc_62EA1:				; CODE XREF: Rect_BlitOverlapRegionVariant_62E16+9Ej
		mov	al, [bx+si]
		push	ds
		mov	ds, dx
		ror	ebx, 10h
		xlat
		rol	ebx, 10h
		pop	ds

loc_62EB0:
		mov	es:[bx+di], al

loc_62EB3:
		inc	bx
		loop	loc_62EA1

loc_62EB6:
		pop	cx
		add	si, [bp+var_6]
		add	di, [bp+var_8]
		dec	[bp+var_A]

loc_62EC0:
		jnz	short loc_62E9E
		pop	ds
		pop	di
		pop	si
		leave
		retf
Rect_BlitOverlapRegionVariant_62E16	endp

seg182		ends
