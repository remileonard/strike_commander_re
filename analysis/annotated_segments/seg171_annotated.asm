seg171		segment	byte public 'CODE' use16
		assume cs:seg171
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, trace un pixel unique (arg_2=x, arg_4=y, arg_6=couleur) dans une structure de contexte
; graphique (bx), avec clipping contre les bornes +4/+6/+8/+0xA. Référencée depuis seg016 et
; seg027 — primitive de rendu 2D de base (même famille que Render_FillClippedRect_61960,
; seg170).
; ==============================================================================================
Render_SetPixelClipped_61B58	proc far		; CODE XREF: seg016:056BP seg027:0128P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	di, [bp+arg_4]
		cmp	di, [bx+0Ah]
		jg	short loc_61B89
		cmp	di, [bx+6]
		jl	short loc_61B89
		mov	si, [bp+arg_2]
		cmp	si, [bx+4]

loc_61B73:
		jl	short loc_61B89
		cmp	si, [bx+8]
		jg	short loc_61B89
		mov	es, word ptr [bx]
		mov	bx, [bx+2]

loc_61B7F:
		shl	di, 1
		add	si, [bx+di]

loc_61B83:
		mov	ax, [bp+arg_6]

loc_61B86:
		mov	es:[si], al

loc_61B89:				; CODE XREF: Render_SetPixelClipped_61B58+Ej
					; Render_SetPixelClipped_61B58+13j ...
		pop	di
		pop	si
		pop	bp

locret_61B8C:
		retf
Render_SetPixelClipped_61B58	endp

seg171		ends
