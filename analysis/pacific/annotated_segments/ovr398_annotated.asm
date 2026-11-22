ovr398		segment	para public 'OVERLAY' use16
		assume cs:ovr398
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
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
TextRenderer_ReleaseCachedGlyph_E4FD0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	1
		push	6B04h
		call	Memory_TypedAllocDispatchE_65433
		add	sp, 6
		or	al, al
		jz	short loc_E5003
		push	0
		push	1
		push	6B04h
		call	Memory_TypedAllocDispatchC_6538A
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[si+4], eax
		jmp	short loc_E500B

loc_E5003:
		mov	dword ptr [si+4], 0

loc_E500B:
		push	0
		push	2
		push	6B04h
		call	Memory_TypedAllocDispatchE_65433
		add	sp, 6
		or	al, al
		jz	short loc_E502D
		call	DisplayCache_Helper_6616A
		push	dx
		push	ax
		pop	eax
		mov	[si+8], eax
		jmp	short loc_E5035

loc_E502D:
		mov	dword ptr [si+8], 0

loc_E5035:
		push	0
		push	3
		push	6B04h
		call	Memory_TypedAllocDispatchE_65433
		add	sp, 6
		or	al, al
		jz	short loc_E5057
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		mov	[si+0Ch], eax
		jmp	short loc_E505F

loc_E5057:
		mov	dword ptr [si+0Ch], 0

loc_E505F:
		pop	si
		pop	bp
		retf
TextRenderer_ReleaseCachedGlyph_E4FD0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Memory_AllocatorSlot_Helper_2BC1E (sub_2BC1E de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Memory_AllocatorSlot_Helper_5CB30 (sub_5CB30 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée par sub_5CB99
; (rôle exact non détaillé, voisin du gestionnaire de mémoire typée).
; ==============================================================================================
Memory_AllocatorSlot_Helper_E5062		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		cmp	al, 1
		jnz	short loc_E5076
		mov	eax, [si+4]
		jmp	short loc_E508D

loc_E5076:
		cmp	al, 2
		jnz	short loc_E5080
		mov	eax, [si+8]
		jmp	short loc_E508D

loc_E5080:
		cmp	al, 3
		jnz	short loc_E508A
		mov	eax, [si+0Ch]
		jmp	short loc_E508D

loc_E508A:
		xor	eax, eax

loc_E508D:
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
Memory_AllocatorSlot_Helper_E5062		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Memory_AllocatorSlotArray_Construct_2BC51 (sub_2BC51 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Memory_AllocatorSlotArray_Construct_5CB63 (sub_5CB63
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658, 0x18 octets) ou réutilise un pointeur existant, initialise un tableau de 6
; emplacements pointeurs à zéro. Référencée par Memory_AllocatorTableConstructor_5C9D3
; (seg131) et sub_5CB99.
; ==============================================================================================
Memory_AllocatorSlotArray_Construct_E5095		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_E50AD
		push	18h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_E50C7

loc_E50AD:
		xor	cx, cx
		jmp	short loc_E50C2

loc_E50B1:
		mov	ax, cx
		shl	ax, 2
		mov	bx, dx
		add	bx, ax
		mov	dword ptr [bx], 0
		inc	cx

loc_E50C2:
		cmp	cx, 6
		jl	short loc_E50B1

loc_E50C7:
		mov	ax, dx
		pop	bp
		retf
Memory_AllocatorSlotArray_Construct_E5095		endp
ovr398		ends
