seg133		segment	para public 'CODE' use16
		assume cs:seg133
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0F3h, 0ABh, 13h, 0C9h, 0F3h, 0AAh

loc_49D96:
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Render_SetPixelClipped_6A11A (sub_6A11A de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Render_SetPixelClipped_328DE (sub_328DE de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Render_SetPixelClipped_61B58 (sub_61B58 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, trace un pixel unique (arg_2=x,
; arg_4=y, arg_6=couleur) dans une structure de contexte graphique (bx), avec clipping contre
; les bornes +4/+6/+8/+0xA. Référencée depuis seg016 et seg027 — primitive de rendu 2D de base
; (même famille que Render_FillClippedRect_61960, seg170).
; ==============================================================================================
Render_SetPixelClipped_49D9A		proc far

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
		jg	short loc_49DCB
		cmp	di, [bx+6]
		jl	short loc_49DCB
		mov	si, [bp+arg_2]
		cmp	si, [bx+4]
		jl	short loc_49DCB
		cmp	si, [bx+8]
		jg	short loc_49DCB
		mov	es, [bx]
		mov	bx, [bx+2]
		shl	di, 1
		add	si, [bx+di]
		mov	ax, [bp+arg_6]
		mov	es:[si], al

loc_49DCB:
		pop	di
		pop	si
		pop	bp
		retf
Render_SetPixelClipped_49D9A		endp

; START OF FUNCTION CHUNK FOR Render_SetPixelClipped_49D9A
		db 0
; END OF FUNCTION CHUNK FOR Render_SetPixelClipped_49D9A
seg133		ends
