ovr253		segment	para public 'OVERLAY' use16
		assume cs:ovr253
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Member_ClearAndFree_E57F0 (sub_E57F0 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Member_ClearAndFree_2F278 (sub_2F278 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Member_ClearAndFree_5EA03 (sub_5EA03 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via
; vtable et dans des dizaines de segments — libère (sub_338) un pointeur membre s'il est posé,
; puis remet à zéro deux champs (pointeur + taille/longueur). Motif « clear/reset » d'un
; membre géré, PAS un constructeur de sous-objet comme précédemment supposé dans plusieurs
; segments — à garder en tête pour la relecture de ces entrées si besoin.
; ==============================================================================================
Member_ClearAndFree_89350		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_89364
		push	word ptr [si]
		call	sub_33B
		pop	cx

loc_89364:
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		pop	si
		pop	bp
		retf
Member_ClearAndFree_89350		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Member_AllocateAndCopy_E5810 (sub_E5810 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Member_AllocateAndCopy_2F298 (sub_2F298 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Member_AllocateAndCopy_5EA23 (sub_5EA23 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle Member_ClearAndFree_5EA03 puis DisplayCache_GetHeadValue_5D469 (seg137) ×2 et alloue
; (sub_658) — motif complémentaire « clear puis réallouer/copier » un membre géré.
; ==============================================================================================
Member_AllocateAndCopy_89370		proc far

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
		call	near ptr Member_ClearAndFree_89350
		pop	cx
		call	sub_451F9
		cmp	ax, di
		jnb	short loc_89391
		call	sub_451F9
		mov	di, ax

loc_89391:
		or	di, di
		jbe	short loc_893A5
		push	di
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si], ax
		mov	bx, [si]
		mov	byte ptr [bx], 0
		jmp	short loc_893A9

loc_893A5:
		mov	word ptr [si], 0

loc_893A9:
		mov	[si+2], di
		mov	ax, [si]
		pop	di
		pop	si
		pop	bp
		retf
Member_AllocateAndCopy_89370		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Member_CopyRaw_E5852
; (sub_E5852 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Member_CopyRaw_2F2DA
; (sub_2F2DA de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Member_CopyRaw_5EA65 (sub_5EA65 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, aucun appel externe visible — copie de données brutes
; entre deux membres (rôle exact non détaillé).
; ==============================================================================================
Member_CopyRaw_893B2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_893FD
		mov	di, [si]
		mov	dx, [si+2]
		jmp	short loc_893C8

loc_893C6:
		inc	di
		dec	dx

loc_893C8:
		cmp	byte ptr [di], 0
		jnz	short loc_893C6
		jmp	short loc_893DC

loc_893CF:
		les	bx, [bp+arg_2]
		mov	al, es:[bx]
		mov	[di], al
		inc	[bp+arg_2]
		inc	di
		dec	dx

loc_893DC:
		or	dx, dx
		jz	short loc_893E9
		les	bx, [bp+arg_2]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_893CF

loc_893E9:
		or	dx, dx
		jz	short loc_893F2
		mov	byte ptr [di], 0
		jmp	short loc_893FD

loc_893F2:
		mov	ax, [si+2]
		dec	ax
		mov	bx, [si]
		add	bx, ax
		mov	byte ptr [bx], 0

loc_893FD:
		pop	di
		pop	si
		pop	bp
		retf
Member_CopyRaw_893B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Member_NullTerminateIfSet_E58A1 (sub_E58A1 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Member_NullTerminateIfSet_2F329 (sub_2F329 de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Member_NullTerminateIfSet_5EAB4 (sub_5EAB4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; écrit un octet nul en tête du buffer pointé par un membre, s'il est non nul. Référencée par
; DisplaySurface_Construct_5E819 et DisplaySurface_ConstructWithMode_5E9A9 (seg151).
; ==============================================================================================
Member_NullTerminateIfSet_89401		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_89412
		mov	bx, [si]
		mov	byte ptr [bx], 0

loc_89412:
		pop	si
		pop	bp
		retf
Member_NullTerminateIfSet_89401		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89415		proc far
		push	bp
		mov	bp, sp
		mov	word_5D91C, 0
		push	100h
		push	3BFCh
		push	cs
		call	near ptr Member_AllocateAndCopy_89370
		add	sp, 4
		pop	bp
		retf
sub_89415		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8942D		proc far
		push	bp
		mov	bp, sp
		push	3BFCh
		push	cs
		call	near ptr Member_ClearAndFree_89350
		pop	cx
		pop	bp
		retf
sub_8942D		endp
ovr253		ends
