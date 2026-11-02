seg131		segment	para public 'CODE' use16
		assume cs:seg131
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 0E5h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Rect_BlitOverlapRegion_31FCA (sub_31FCA de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21 (code identique à Rect_BlitOverlapRegion_60FE2 de STRIKE.EXE). Copie une
; surface dans une autre. arg_0 = surface source, arg_2 = surface destination (descripteurs de
; 6 mots : segment, table des lignes, gauche, haut, droite, bas). Copie min(largeur) ×
; min(hauteur) pixels ; la source part de SA ligne du haut et de SA colonne de gauche, la
; destination des siennes (mov cx, [si+6] / shl cx, 1 / add cx, di, add si, [bp+var_2] / add
; di, [bp+var_4]), une ligne par passage (rep movsw puis rep movsb). Les deux rectangles ne
; sont donc pas superposés en coordonnées communes : dans les cinématiques, la ligne 0 de
; l'image hors écran (0, 0)–(319, 199) arrive à la ligne 24 de l'écran (rectangle (0,
; 24)–(319, 151)). Appelée par UI_ApplyEncodingHelper_2EC4A (source, destination) et
; UI_ApplyEncodingHelper_2EC65 (destination, source), dont Scene_Tick_C652.
; ==============================================================================================
Rect_BlitOverlapRegion_37B54		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
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
		jbe	short loc_37B84
		mov	dx, ax

loc_37B84:
		mov	cx, [si+0Ah]
		sub	cx, [si+6]
		inc	cx
		mov	ax, [bx+0Ah]
		sub	ax, [bx+6]
		inc	ax
		cmp	ax, cx
		jbe	short loc_37B98
		mov	ax, cx

loc_37B98:
		mov	di, [si+2]
		mov	cx, [si+6]
		shl	cx, 1
		add	cx, di
		mov	[bp+var_6], cx
		mov	di, [bx+2]
		mov	cx, [bx+6]
		shl	cx, 1
		add	cx, di
		mov	es, [si]
		mov	ds, [bx]
		mov	bx, cx

loc_37BB5:
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
		jnz	short loc_37BB5
		pop	es
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Rect_BlitOverlapRegion_37B54		endp
seg131		ends
