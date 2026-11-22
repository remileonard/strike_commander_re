seg088		segment	para public 'CODE' use16
		assume cs:seg088
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 8Bh, 4, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Member_ClearAndFree_2F278 (sub_2F278 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Member_ClearAndFree_5EA03 (sub_5EA03 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via vtable et dans
; des dizaines de segments — libère (sub_338) un pointeur membre s'il est posé, puis remet à
; zéro deux champs (pointeur + taille/longueur). Motif « clear/reset » d'un membre géré, PAS
; un constructeur de sous-objet comme précédemment supposé dans plusieurs segments — à garder
; en tête pour la relecture de ces entrées si besoin.
; ==============================================================================================
Member_ClearAndFree_2F796		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_2F7AA
		push	word ptr [si]
		call	sub_39C
		pop	cx

loc_2F7AA:
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		pop	si
		pop	bp
		retf
Member_ClearAndFree_2F796		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Member_AllocateAndCopy_2F298 (sub_2F298 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Member_AllocateAndCopy_5EA23 (sub_5EA23 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; Member_ClearAndFree_5EA03 puis DisplayCache_GetHeadValue_5D469 (seg137) ×2 et alloue
; (sub_658) — motif complémentaire « clear puis réallouer/copier » un membre géré.
; ==============================================================================================
Member_AllocateAndCopy_2F7B6		proc far

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
		call	near ptr Member_ClearAndFree_2F796
		pop	cx
		call	sub_33289
		cmp	ax, di
		jnb	short loc_2F7D7
		call	sub_33289
		mov	di, ax

loc_2F7D7:
		or	di, di
		jbe	short loc_2F7EB
		push	di
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si], ax
		mov	bx, [si]
		mov	byte ptr [bx], 0
		jmp	short loc_2F7EF

loc_2F7EB:
		mov	word ptr [si], 0

loc_2F7EF:
		mov	[si+2], di
		mov	ax, [si]
		pop	di
		pop	si
		pop	bp
		retf
Member_AllocateAndCopy_2F7B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Member_CopyRaw_2F2DA (sub_2F2DA de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à Member_CopyRaw_5EA65 (sub_5EA65 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible — copie de données brutes entre deux membres (rôle exact non détaillé).
; ==============================================================================================
Member_CopyRaw_2F7F8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_2F843
		mov	di, [si]
		mov	dx, [si+2]
		jmp	short loc_2F80E

loc_2F80C:
		inc	di
		dec	dx

loc_2F80E:
		cmp	byte ptr [di], 0
		jnz	short loc_2F80C
		jmp	short loc_2F822

loc_2F815:
		les	bx, [bp+arg_2]
		mov	al, es:[bx]
		mov	[di], al
		inc	[bp+arg_2]
		inc	di
		dec	dx

loc_2F822:
		or	dx, dx
		jz	short loc_2F82F
		les	bx, [bp+arg_2]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_2F815

loc_2F82F:
		or	dx, dx
		jz	short loc_2F838
		mov	byte ptr [di], 0
		jmp	short loc_2F843

loc_2F838:
		mov	ax, [si+2]
		dec	ax
		mov	bx, [si]
		add	bx, ax
		mov	byte ptr [bx], 0

loc_2F843:
		pop	di
		pop	si
		pop	bp
		retf
Member_CopyRaw_2F7F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Member_NullTerminateIfSet_2F329 (sub_2F329 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Member_NullTerminateIfSet_5EAB4 (sub_5EAB4 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, écrit un octet nul en tête du
; buffer pointé par un membre, s'il est non nul. Référencée par DisplaySurface_Construct_5E819
; et DisplaySurface_ConstructWithMode_5E9A9 (seg151).
; ==============================================================================================
Member_NullTerminateIfSet_2F847		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_2F858
		mov	bx, [si]
		mov	byte ptr [bx], 0

loc_2F858:
		pop	si
		pop	bp
		retf
Member_NullTerminateIfSet_2F847		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F85B		proc far
		push	bp
		mov	bp, sp
		mov	word_4CE02, 0
		push	100h
		push	4422h
		push	cs
		call	near ptr Member_AllocateAndCopy_2F7B6
		add	sp, 4
		pop	bp
		retf
sub_2F85B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F873		proc far
		push	bp
		mov	bp, sp
		push	4422h
		push	cs
		call	near ptr Member_ClearAndFree_2F796
		pop	cx
		pop	bp
		retf
sub_2F873		endp
seg088		ends
