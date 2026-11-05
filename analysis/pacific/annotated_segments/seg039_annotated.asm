seg039		segment	para public 'CODE' use16
		assume cs:seg039
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 0, 59h, 8Bh, 0D0h, 0Bh, 0C0h

loc_1B9C7:
		db 8Bh, 0C2h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Video_ClearTextPage (sub_20610 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,22L — remplit de zéros
; une zone mémoire (0x280 mots = écran texte 80x25) via segment/offset lu dans une table
; (word_70E62) : effacement de la page vidéo texte.
; ==============================================================================================
Video_ClearTextPage		proc far
		push	bp
		mov	bp, sp
		push	di
		mov	bx, word_7AF7E
		mov	es, [bx]
		mov	bx, [bx+2]
		mov	di, [bx]
		add	di, 0FA00h
		mov	cx, 280h
		xor	ax, ax
		rep stosw
		pop	di
		pop	bp
		retf
Video_ClearTextPage		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B9E8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jge	short loc_1B9F6
		mov	[bp+arg_0], 0

loc_1B9F6:
		cmp	[bp+arg_0], 4
		jle	short loc_1BA01
		mov	[bp+arg_0], 4

loc_1BA01:
		mov	ax, [bp+arg_0]
		cmp	ax, word_773FE
		jz	short loc_1BA37
		mov	ax, [bp+arg_0]
		mov	word_773FE, ax
		mov	dx, 50h
		mov	ax, [bp+arg_0]
		imul	dx
		mov	[bp+arg_0], ax
		mov	ax, 40h
		mov	es, ax
		mov	dx, 3D4h
		add	dl, 6
		sub	dl, 6
		mov	bx, [bp+arg_0]
		mov	ah, bh
		mov	al, 0Ch
sub_1B9E8		endp
seg039		ends
