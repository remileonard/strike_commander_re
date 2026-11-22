seg090		segment	para public 'CODE' use16
		assume cs:seg090
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_392E3		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_392E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_392E8		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, di
		shl	ax, 2
		mov	[bp+var_2], ax
		push	1
		push	0
		push	2
		movzx	eax, [bp+var_2]
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+6], dx
		mov	[si+4], ax
		mov	[si+2], di
		cmp	dword ptr [si+4], 0
		jnz	short loc_3932F
		push	0C017h
		call	sub_1DDFE
		pop	cx

loc_3932F:
		pop	di
		pop	si
		leave
		retf
sub_392E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeakRef_TableDestruct (sub_3A274 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,26L — vide la
; table (sub_3A3B0) puis libère la mémoire : destructeur du registre de pointeurs faibles.
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
		add	ax, 4
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword ptr [si+4], 0
		pop	si
		pop	bp
		retf
WeakRef_TableDestruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39361		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	ax, [di]
		cmp	ax, [di+2]
		jge	short loc_3938B
		les	bx, [di+4]
		mov	ax, [di]
		inc	word ptr [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short loc_39394

loc_3938B:
		push	0C018h
		call	sub_1DDFE
		pop	cx

loc_39394:
		pop	di
		pop	si
		pop	bp
		retf
sub_39361		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeakRef_UnregisterByValue (sub_3A2CD de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,66L — retire une
; entrée du registre correspondant à une valeur donnée (recherche + suppression avec
; compactage) : désenregistrement de toutes les références faibles pointant vers une valeur.
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
		jz	short loc_39407
		xor	cx, cx
		jmp	short loc_39403

loc_393B2:
		les	bx, [di+4]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	ax, es:[bx]
		cmp	ax, [bp+arg_2]
		jnz	short loc_39402
		les	bx, [di+4]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0
		les	bx, [di+4]
		dec	word ptr [di]
		mov	ax, [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	bx, [di+4]
		mov	si, cx
		shl	si, 2
		add	bx, si
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		inc	[bp+var_2]
		jmp	short loc_39403

loc_39402:
		inc	cx

loc_39403:
		cmp	[di], cx
		jg	short loc_393B2

loc_39407:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
WeakRef_UnregisterByValue		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeakRef_Invalidate (sub_3A343 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,65L — retire une entrée
; du registre par correspondance exacte (pointeur + segment), met le champ cible à zéro :
; invalidation d'une référence faible spécifique (nullification + désenregistrement).
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
		jmp	short loc_39471

loc_3941A:
		les	bx, [di+4]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		cmp	ax, [bp+arg_4]
		jnz	short loc_39470
		cmp	dx, [bp+arg_2]
		jnz	short loc_39470
		mov	bx, [di+4]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0
		les	bx, [di+4]
		dec	word ptr [di]
		mov	ax, [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	bx, [di+4]
		mov	si, cx
		shl	si, 2
		add	bx, si
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		mov	ax, 1
		jmp	short loc_39477

loc_39470:
		inc	cx

loc_39471:
		cmp	[di], cx
		jg	short loc_3941A
		xor	ax, ax

loc_39477:
		pop	di
		pop	si
		pop	bp
		retf
WeakRef_Invalidate		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeakRef_InvalidateAll (sub_3A3B0 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,39L — parcourt
; tout le registre, met à zéro chaque champ cible référencé, vide la table : invalidation en
; masse de toutes les références faibles (reset complet du registre).
; ==============================================================================================
WeakRef_InvalidateAll		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_394AC

loc_39486:
		les	bx, [si+4]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_394AB
		mov	bx, [si+4]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0

loc_394AB:
		inc	dx

loc_394AC:
		cmp	[si], dx
		jg	short loc_39486
		mov	word ptr [si], 0
		pop	si
		pop	bp
		retf
WeakRef_InvalidateAll		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeakRef_InvalidateIfSet (sub_2237A de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à WeakRef_InvalidateIfSet (sub_3A3EC de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,23L — si le champ référencé
; est non nul, l'invalide via sub_3A343 : wrapper d'invalidation conditionnelle d'une
; référence faible.
; ==============================================================================================
WeakRef_InvalidateIfSet		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_394D3
		push	ds
		push	si
		push	67A5h
		push	cs
		call	near ptr WeakRef_Invalidate
		add	sp, 6
		mov	word ptr [si], 0

loc_394D3:
		pop	si
		pop	bp
		retf
WeakRef_InvalidateIfSet		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SetReference16 (sub_3A40B de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,32L — invalide
; l'ancienne référence (sub_3A3EC) puis assigne et enregistre la nouvelle (sub_3A2A2) :
; variante de SetReference pour un champ 16-bit simple (near pointer).
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
		jz	short loc_394F9
		push	ds
		push	si
		push	67A5h
		push	cs
		call	near ptr sub_39361
		add	sp, 6

loc_394F9:
		pop	di
		pop	si
		pop	bp
		retf
SetReference16		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_394FD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 0
		jz	short loc_39517
		push	[bp+arg_2]
		push	bx
		push	67A5h
		push	cs
		call	near ptr WeakRef_Invalidate
		add	sp, 6

loc_39517:
		pop	bp
		retf
sub_394FD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39519		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_394FD
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx], si
		or	si, si
		jz	short loc_39543
		push	word ptr [bp+arg_0+2]
		push	bx
		push	67A5h
		push	cs
		call	near ptr sub_39361
sub_39519		endp
seg090		ends
