seg078		segment	para public 'CODE' use16
		assume cs:seg078
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 0C9h, 0CBh

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
TextRenderer_ReleaseCachedGlyph_2EE54		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	1
		push	6C14h
		call	Memory_TypedAllocDispatchE_32A95
		add	sp, 6
		or	al, al
		jz	short loc_2EE87
		push	0
		push	1
		push	6C14h
		call	Memory_TypedAllocDispatchC_329EC
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[si+4], eax
		jmp	short loc_2EE8F

loc_2EE87:
		mov	dword ptr [si+4], 0

loc_2EE8F:
		push	0
		push	2
		push	6C14h
		call	Memory_TypedAllocDispatchE_32A95
		add	sp, 6
		or	al, al
		jz	short loc_2EEB1
		call	DisplayCache_Helper_337CC
		push	dx
		push	ax
		pop	eax
		mov	[si+8], eax
		jmp	short loc_2EEB9

loc_2EEB1:
		mov	dword ptr [si+8], 0

loc_2EEB9:
		push	0
		push	3
		push	6C14h
		call	Memory_TypedAllocDispatchE_32A95
		add	sp, 6
		or	al, al
		jz	short loc_2EEDB
		call	sub_32170
		push	dx
		push	ax
		pop	eax
		mov	[si+0Ch], eax
		jmp	short loc_2EEE3

loc_2EEDB:
		mov	dword ptr [si+0Ch], 0

loc_2EEE3:
		pop	si
		pop	bp
		retf
TextRenderer_ReleaseCachedGlyph_2EE54		endp

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
Memory_AllocatorSlot_Helper_2EEE6		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		cmp	al, 1
		jnz	short loc_2EEFA
		mov	eax, [si+4]
		jmp	short loc_2EF11

loc_2EEFA:
		cmp	al, 2
		jnz	short loc_2EF04
		mov	eax, [si+8]
		jmp	short loc_2EF11

loc_2EF04:
		cmp	al, 3
		jnz	short loc_2EF0E
		mov	eax, [si+0Ch]
		jmp	short loc_2EF11

loc_2EF0E:
		xor	eax, eax

loc_2EF11:
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
Memory_AllocatorSlot_Helper_2EEE6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2EF19		proc far

var_39		= dword ptr -39h
arg_0		= word ptr  6
arg_3D4		= byte ptr  3DAh

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_2EF31
		push	18h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_2EF4B

loc_2EF31:
		xor	cx, cx
		jmp	short loc_2EF46
sub_2EF19		endp

; START OF FUNCTION CHUNK FOR sub_2EF19
		db 8Bh
		rol	cx, 0E0h
		add	cl, [bp+di+arg_3D4]
		fsub	[bp+var_39]
; END OF FUNCTION CHUNK FOR sub_2EF19
seg078		ends
