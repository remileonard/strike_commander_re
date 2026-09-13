seg064		segment	byte public 'CODE' use16
		assume cs:seg064
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_2DDEA:				; DATA XREF: seg216:02C6o seg339:1836o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]

loc_2DDF0:
		mov	al, es:[bx+6]
		push	ax
		push	word ptr es:[bx+9]
		push	word ptr es:[bx+7]

loc_2DDFD:
		push	word_70E60

loc_2DE01:
		call	Render_SetPixelClipped_61B58
		add	sp, 8
		pop	bp
		retf
seg064		ends
