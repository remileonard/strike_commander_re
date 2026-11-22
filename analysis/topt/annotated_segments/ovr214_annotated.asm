ovr214		segment	para public 'OVERLAY' use16
		assume cs:ovr214
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TranslucentFont_DrawGlyph_BDDC0 (sub_BDDC0 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. Méthode de dessin d'un caractère (entrée 1 de la table de méthodes dseg
; 1DADh) d'une police dérivée de GlyphObject à pixels translucides, utilisée pour les titres
; de mid1 (police mid1 27). Appelle Render_DrawScaledSprite_32F28 avec l'image du caractère
; (forme en +2/+4, image arg_4), échelle 256 × 256 (taille d'origine), position (arg_6, arg_8
; + [si+0Eh]), puis les 4 champs propres à cette police : table de remappage far
; ([si+17h]:[si+19h]), A = [si+1Bh], B = [si+1Dh]. Dans Render_DrawScaledSprite_32F28, un
; pixel de couleur c avec A ≤ c < A + B est remplacé par table[(c − A) × 256 + couleur déjà à
; l'écran] (sub dl, ah / shl dx, 8 / mov al, es:[di] / lds bx, [bp+arg_10] / add bx, dx /
; xlat) ; les autres pixels sont dessinés tels quels. mid1 (scène 2) y met A = 239, B = 16,
; table = données de mid1 60 + étape × 4096 (shl bx, 0Ch), étape 0 à 15 à l'apparition, 15 à 0
; à la disparition.
; ==============================================================================================
TranslucentFont_DrawGlyph_B5700		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+1Dh]
		push	word ptr [si+1Bh]
		push	word ptr [si+19h]
		push	word ptr [si+17h]
		push	100h
		push	100h
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+6]
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_8]
		add	ax, [si+0Eh]
		push	ax
		push	[bp+arg_6]
		push	[bp+arg_2]
		call	sub_38762
		add	sp, 18h
		pop	si
		pop	bp
		retf
TranslucentFont_DrawGlyph_B5700		endp
ovr214		ends
