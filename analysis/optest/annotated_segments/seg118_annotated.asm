seg118		segment	byte public 'CODE' use16
		assume cs:seg118
		;org 0Eh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Render_SetPixelClipped_61B58 (sub_61B58 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, trace un pixel unique (arg_2=x, arg_4=y,
; arg_6=couleur) dans une structure de contexte graphique (bx), avec clipping contre les
; bornes +4/+6/+8/+0xA. Référencée depuis seg016 et seg027 — primitive de rendu 2D de base
; (même famille que Render_FillClippedRect_61960, seg170).
; ==============================================================================================
Render_SetPixelClipped_328DE	proc far		; CODE XREF: seg023:0E19P
					; sub_54030+8BP ...

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
		jg	short loc_3290F
		cmp	di, [bx+6]
		jl	short loc_3290F
		mov	si, [bp+arg_2]
		cmp	si, [bx+4]
		jl	short loc_3290F
		cmp	si, [bx+8]
		jg	short loc_3290F
		mov	es, word ptr [bx]
		mov	bx, [bx+2]
		shl	di, 1
		add	si, [bx+di]
		mov	ax, [bp+arg_6]
		mov	es:[si], al

loc_3290F:				; CODE XREF: Render_SetPixelClipped_328DE+Ej
					; Render_SetPixelClipped_328DE+13j ...
		pop	di
		pop	si
		pop	bp
		retf
Render_SetPixelClipped_328DE	endp

seg118		ends
