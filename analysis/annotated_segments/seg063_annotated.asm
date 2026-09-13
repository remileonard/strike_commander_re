seg063		segment	byte public 'CODE' use16
		assume cs:seg063
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_2DD6A:				; DATA XREF: seg339:1892o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		push	word ptr es:[bx+6]
		push	0
		mov	al, es:[bx+10h]
		push	ax

loc_2DD7B:
		push	large dword ptr	es:[bx+0Ch]
		push	5C44h

loc_2DD83:
		call	Memory_TypedAllocDispatchB_5C832

loc_2DD88:
		add	sp, 0Ah
		push	dx
		push	ax
		les	bx, [bp+6]

loc_2DD90:
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		push	word_70E60
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2DDA6:				; DATA XREF: seg339:1896o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		push	word ptr es:[bx+16h]
		push	word ptr es:[bx+16h]
		push	word ptr es:[bx+6]
		push	0
		mov	al, es:[bx+10h]
		push	ax

loc_2DDBF:
		push	large dword ptr	es:[bx+0Ch]

loc_2DDC4:
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		les	bx, [bp+6]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		push	word_70E60

loc_2DDE0:
		call	Render_DrawRotatedScaledSprite_62800
		add	sp, 10h
		pop	bp
		retf
seg063		ends
