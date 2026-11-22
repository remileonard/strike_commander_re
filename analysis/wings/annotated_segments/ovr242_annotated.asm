ovr242		segment	para public 'OVERLAY' use16
		assume cs:ovr242
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextRenderer_ReleaseCachedGlyph_E4FD0 (sub_E4FD0 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextRenderer_ReleaseCachedGlyph_2BB8C (sub_2BB8C de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextRenderer_ReleaseCachedGlyph_5CA9E (sub_5CA9E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedAllocDispatchE_5C916 ×3, Memory_TypedAllocDispatchC_5C86D, sub_5D76B et
; Registry_LookupForTextRenderer_5B5D9 (seg126). Référencée directement par TextRenderer_Main
; (sub_27477, seg048) — probable libération d'un glyphe/texte mis en cache.
; ==============================================================================================
TextRenderer_ReleaseCachedGlyph_889C0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	1
		push	67B0h
		call	Memory_TypedAllocDispatchE_44A05
		add	sp, 6
		or	al, al
		jz	short loc_889F3
		push	0
		push	1
		push	67B0h
		call	Memory_TypedAllocDispatchC_4495C
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[si+4], eax
		jmp	short loc_889FB

loc_889F3:
		mov	dword ptr [si+4], 0

loc_889FB:
		push	0
		push	2
		push	67B0h
		call	Memory_TypedAllocDispatchE_44A05
		add	sp, 6
		or	al, al
		jz	short loc_88A1D
		call	DisplayCache_Helper_4573C
		push	dx
		push	ax
		pop	eax
		mov	[si+8], eax
		jmp	short loc_88A25

loc_88A1D:
		mov	dword ptr [si+8], 0

loc_88A25:
		push	0
		push	3
		push	67B0h
		call	Memory_TypedAllocDispatchE_44A05
		add	sp, 6
		or	al, al
		jz	short loc_88A47
		call	sub_440E0
		push	dx
		push	ax
		pop	eax
		mov	[si+0Ch], eax
		jmp	short loc_88A4F

loc_88A47:
		mov	dword ptr [si+0Ch], 0

loc_88A4F:
		pop	si
		pop	bp
		retf
TextRenderer_ReleaseCachedGlyph_889C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Memory_AllocatorSlot_Helper_E5062 (sub_E5062 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Memory_AllocatorSlot_Helper_2BC1E (sub_2BC1E de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Memory_AllocatorSlot_Helper_5CB30 (sub_5CB30 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; référencée par sub_5CB99 (rôle exact non détaillé, voisin du gestionnaire de mémoire typée).
; ==============================================================================================
Memory_AllocatorSlot_Helper_88A52		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		cmp	al, 1
		jnz	short loc_88A66
		mov	eax, [si+4]
		jmp	short loc_88A7D

loc_88A66:
		cmp	al, 2
		jnz	short loc_88A70
		mov	eax, [si+8]
		jmp	short loc_88A7D

loc_88A70:
		cmp	al, 3
		jnz	short loc_88A7A
		mov	eax, [si+0Ch]
		jmp	short loc_88A7D

loc_88A7A:
		xor	eax, eax

loc_88A7D:
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
Memory_AllocatorSlot_Helper_88A52		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Memory_AllocatorSlotArray_Construct_E5095 (sub_E5095 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à Memory_AllocatorSlotArray_Construct_2BC51 (sub_2BC51
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Memory_AllocatorSlotArray_Construct_5CB63 (sub_5CB63 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658, 0x18 octets) ou
; réutilise un pointeur existant, initialise un tableau de 6 emplacements pointeurs à zéro.
; Référencée par Memory_AllocatorTableConstructor_5C9D3 (seg131) et sub_5CB99.
; ==============================================================================================
Memory_AllocatorSlotArray_Construct_88A85		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_88A9D
		push	18h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_88AB7

loc_88A9D:
		xor	cx, cx
		jmp	short loc_88AB2

loc_88AA1:
		mov	ax, cx
		shl	ax, 2
		mov	bx, dx
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	cx

loc_88AB2:
		cmp	cx, 6
		jl	short loc_88AA1

loc_88AB7:
		mov	ax, dx
		pop	bp
		retf
Memory_AllocatorSlotArray_Construct_88A85		endp
ovr242		ends
