ovr408		segment	para public 'OVERLAY' use16
		assume cs:ovr408
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

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
Member_ClearAndFree_E57F0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_E5804
		push	word ptr [si]
		call	sub_3B2
		pop	cx

loc_E5804:
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		pop	si
		pop	bp
		retf
Member_ClearAndFree_E57F0		endp

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
Member_AllocateAndCopy_E5810		proc far

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
		call	near ptr Member_ClearAndFree_E57F0
		pop	cx
		call	DisplayCache_GetHeadValue_65C27
		cmp	ax, di
		jnb	short loc_E5831
		call	DisplayCache_GetHeadValue_65C27
		mov	di, ax

loc_E5831:
		or	di, di
		jbe	short loc_E5845
		push	di
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si], ax
		mov	bx, [si]
		mov	byte ptr [bx], 0
		jmp	short loc_E5849

loc_E5845:
		mov	word ptr [si], 0

loc_E5849:
		mov	[si+2], di
		mov	ax, [si]
		pop	di
		pop	si
		pop	bp
		retf
Member_AllocateAndCopy_E5810		endp

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
Member_CopyRaw_E5852		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_E589D
		mov	di, [si]
		mov	dx, [si+2]
		jmp	short loc_E5868

loc_E5866:
		inc	di
		dec	dx

loc_E5868:
		cmp	byte ptr [di], 0
		jnz	short loc_E5866
		jmp	short loc_E587C

loc_E586F:
		les	bx, [bp+arg_2]
		mov	al, es:[bx]
		mov	[di], al
		inc	[bp+arg_2]
		inc	di
		dec	dx

loc_E587C:
		or	dx, dx
		jz	short loc_E5889
		les	bx, [bp+arg_2]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_E586F

loc_E5889:
		or	dx, dx
		jz	short loc_E5892
		mov	byte ptr [di], 0
		jmp	short loc_E589D

loc_E5892:
		mov	ax, [si+2]
		dec	ax
		mov	bx, [si]
		add	bx, ax
		mov	byte ptr [bx], 0

loc_E589D:
		pop	di
		pop	si
		pop	bp
		retf
Member_CopyRaw_E5852		endp

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
Member_NullTerminateIfSet_E58A1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_E58B2
		mov	bx, [si]
		mov	byte ptr [bx], 0

loc_E58B2:
		pop	si
		pop	bp
		retf
Member_NullTerminateIfSet_E58A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E58B5		proc far
		push	bp
		mov	bp, sp
		mov	word_7AB7A, 0
		push	100h
		push	444Ah
		push	cs
		call	near ptr Member_AllocateAndCopy_E5810
		add	sp, 4
		pop	bp
		retf
sub_E58B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E58CD		proc far
		push	bp
		mov	bp, sp
		push	444Ah
		push	cs
		call	near ptr Member_ClearAndFree_E57F0
		pop	cx
		pop	bp
		retf
sub_E58CD		endp
ovr408		ends
