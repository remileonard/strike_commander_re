seg082		segment	para public 'CODE' use16
		assume cs:seg082
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 50h, 50h, 9Ah, 19h, 29h, 66h, 39h, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3837C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		shl	ax, 2
		mov	[bp+var_2], ax
		push	1
		push	0
		push	2
		movzx	eax, [bp+var_2]
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[si+4], dx
		mov	[si+2], ax
		cmp	dword ptr [si+2], 0
		jnz	short loc_383BD
		push	0C017h
		call	sub_9D47
		pop	cx

loc_383BD:
		pop	si
		leave
		retf
sub_3837C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeakRef_TableDestruct (sub_39333 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à WeakRef_TableDestruct (sub_3A274 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,26L — vide la table (sub_3A3B0)
; puis libère la mémoire : destructeur du registre de pointeurs faibles.
; ==============================================================================================
WeakRef_TableDestruct		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr WeakRef_InvalidateAll
		pop	cx
		push	0
		push	2
		mov	ax, si
		add	ax, 2
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	dword ptr [si+2], 0
		pop	si
		pop	bp
		retf
WeakRef_TableDestruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_383EE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	word ptr [di], 0C8h
		jge	short loc_38417
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short loc_38420

loc_38417:
		push	0C018h
		call	sub_9D47
		pop	cx

loc_38420:
		pop	di
		pop	si
		pop	bp
		retf
sub_383EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeakRef_UnregisterByValue (sub_39398 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à WeakRef_UnregisterByValue (sub_3A2CD de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,66L — retire une entrée
; du registre correspondant à une valeur donnée (recherche + suppression avec compactage) :
; désenregistrement de toutes les références faibles pointant vers une valeur.
; ==============================================================================================
WeakRef_UnregisterByValue		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	[bp+arg_2], 0
		jz	short loc_38493
		xor	cx, cx
		jmp	short loc_3848F

loc_3843E:
		les	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	ax, es:[bx]
		cmp	ax, [bp+arg_2]
		jnz	short loc_3848E
		les	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0
		les	bx, [di+2]
		dec	word ptr [di]
		mov	ax, [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	bx, [di+2]
		mov	si, cx
		shl	si, 2
		add	bx, si
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		inc	[bp+var_2]
		jmp	short loc_3848F

loc_3848E:
		inc	cx

loc_3848F:
		cmp	[di], cx
		jg	short loc_3843E

loc_38493:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
WeakRef_UnregisterByValue		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeakRef_Invalidate (sub_3940E de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 4 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à WeakRef_Invalidate (sub_3A343 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,65L — retire une entrée du registre par
; correspondance exacte (pointeur + segment), met le champ cible à zéro : invalidation d'une
; référence faible spécifique (nullification + désenregistrement).
; ==============================================================================================
WeakRef_Invalidate		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_384FD

loc_384A6:
		les	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		cmp	ax, [bp+arg_4]
		jnz	short loc_384FC
		cmp	dx, [bp+arg_2]
		jnz	short loc_384FC
		mov	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0
		les	bx, [di+2]
		dec	word ptr [di]
		mov	ax, [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	bx, [di+2]
		mov	si, cx
		shl	si, 2
		add	bx, si
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		mov	ax, 1
		jmp	short loc_38503

loc_384FC:
		inc	cx

loc_384FD:
		cmp	[di], cx
		jg	short loc_384A6
		xor	ax, ax

loc_38503:
		pop	di
		pop	si
		pop	bp
		retf
WeakRef_Invalidate		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeakRef_InvalidateAll (sub_3947B de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à WeakRef_InvalidateAll (sub_3A3B0 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,39L — parcourt tout le registre,
; met à zéro chaque champ cible référencé, vide la table : invalidation en masse de toutes les
; références faibles (reset complet du registre).
; ==============================================================================================
WeakRef_InvalidateAll		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_38538

loc_38512:
		les	bx, [si+2]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_38537
		mov	bx, [si+2]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0

loc_38537:
		inc	dx

loc_38538:
		cmp	[si], dx
		jg	short loc_38512
		mov	word ptr [si], 0
		pop	si
		pop	bp
		retf
WeakRef_InvalidateAll		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeakRef_InvalidateIfSet (sub_394B7 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à WeakRef_InvalidateIfSet (sub_2237A de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à WeakRef_InvalidateIfSet (sub_3A3EC de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,23L — si le champ référencé est non nul, l'invalide via
; sub_3A343 : wrapper d'invalidation conditionnelle d'une référence faible.
; ==============================================================================================
WeakRef_InvalidateIfSet		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_3855F
		push	ds
		push	si
		push	6495h
		push	cs
		call	near ptr WeakRef_Invalidate
		add	sp, 6
		mov	word ptr [si], 0

loc_3855F:
		pop	si
		pop	bp
		retf
WeakRef_InvalidateIfSet		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SetReference16 (sub_394D6 de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à SetReference16 (sub_3A40B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,32L — invalide l'ancienne référence
; (sub_3A3EC) puis assigne et enregistre la nouvelle (sub_3A2A2) : variante de SetReference
; pour un champ 16-bit simple (near pointer).
; ==============================================================================================
SetReference16		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr WeakRef_InvalidateIfSet
		pop	cx
		mov	[si], di
		or	di, di
		jz	short loc_38585
		push	ds
		push	si
		push	6495h
		push	cs
		call	near ptr sub_383EE
		add	sp, 6

loc_38585:
		pop	di
		pop	si
		pop	bp
		retf
SetReference16		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38589		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 0
		jz	short loc_385A3
		push	[bp+arg_2]
		push	bx
		push	6495h
		push	cs
		call	near ptr WeakRef_Invalidate
		add	sp, 6

loc_385A3:
		pop	bp
		retf
sub_38589		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_385A5		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_38589
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx], si
		or	si, si
		jz	short loc_385CF
		push	word ptr [bp+arg_0+2]
		push	bx
		push	6495h
		push	cs
		call	near ptr sub_383EE
		add	sp, 6

loc_385CF:
		pop	si
sub_385A5		endp
seg082		ends
