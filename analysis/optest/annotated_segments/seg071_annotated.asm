seg071		segment	byte public 'CODE' use16
		assume cs:seg071
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextRenderer_ReleaseCachedGlyph_5CA9E (sub_5CA9E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedAllocDispatchE_5C916 ×3, Memory_TypedAllocDispatchC_5C86D, sub_5D76B et
; Registry_LookupForTextRenderer_5B5D9 (seg126). Référencée directement par TextRenderer_Main
; (sub_27477, seg048) — probable libération d'un glyphe/texte mis en cache.
; ==============================================================================================
TextRenderer_ReleaseCachedGlyph_2BB8C	proc far		; CODE XREF: Memory_AllocatorTable_PopulateSlots_2BC87+22P
					; sub_5D287+317P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	1
		push	661Ah
		call	Memory_TypedAllocDispatchE_2BA04
		add	sp, 6
		or	al, al
		jz	short loc_2BBBF
		push	0
		push	1
		push	661Ah
		call	Memory_TypedAllocDispatchC_2B95B
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[si+4],	eax
		jmp	short loc_2BBC7
; ���������������������������������������������������������������������������

loc_2BBBF:				; CODE XREF: TextRenderer_ReleaseCachedGlyph_2BB8C+18j
		mov	dword ptr [si+4], 0

loc_2BBC7:				; CODE XREF: TextRenderer_ReleaseCachedGlyph_2BB8C+31j
		push	0
		push	2
		push	661Ah
		call	Memory_TypedAllocDispatchE_2BA04
		add	sp, 6
		or	al, al
		jz	short loc_2BBE9
		call	DisplayCache_Helper_2C859
		push	dx
		push	ax
		pop	eax
		mov	[si+8],	eax
		jmp	short loc_2BBF1
; ���������������������������������������������������������������������������

loc_2BBE9:				; CODE XREF: TextRenderer_ReleaseCachedGlyph_2BB8C+4Cj
		mov	dword ptr [si+8], 0

loc_2BBF1:				; CODE XREF: TextRenderer_ReleaseCachedGlyph_2BB8C+5Bj
		push	0
		push	3
		push	661Ah
		call	Memory_TypedAllocDispatchE_2BA04
		add	sp, 6
		or	al, al
		jz	short loc_2BC13
		call	Registry_LookupForTextRenderer_2A6C7
		push	dx
		push	ax
		pop	eax
		mov	[si+0Ch], eax
		jmp	short loc_2BC1B
; ���������������������������������������������������������������������������

loc_2BC13:				; CODE XREF: TextRenderer_ReleaseCachedGlyph_2BB8C+76j
		mov	dword ptr [si+0Ch], 0

loc_2BC1B:				; CODE XREF: TextRenderer_ReleaseCachedGlyph_2BB8C+85j
		pop	si
		pop	bp
		retf
TextRenderer_ReleaseCachedGlyph_2BB8C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Memory_AllocatorSlot_Helper_5CB30 (sub_5CB30 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée par sub_5CB99 (rôle exact non
; détaillé, voisin du gestionnaire de mémoire typée).
; ==============================================================================================
Memory_AllocatorSlot_Helper_2BC1E	proc far		; CODE XREF: Memory_AllocatorTable_PopulateSlots_2BC87+2BP
					; Memory_AllocatorTable_PopulateSlots_2BC87+3FP ...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		cmp	al, 1
		jnz	short loc_2BC32
		mov	eax, [si+4]
		jmp	short loc_2BC49
; ���������������������������������������������������������������������������

loc_2BC32:				; CODE XREF: Memory_AllocatorSlot_Helper_2BC1E+Cj
		cmp	al, 2
		jnz	short loc_2BC3C
		mov	eax, [si+8]
		jmp	short loc_2BC49
; ���������������������������������������������������������������������������

loc_2BC3C:				; CODE XREF: Memory_AllocatorSlot_Helper_2BC1E+16j
		cmp	al, 3
		jnz	short loc_2BC46
		mov	eax, [si+0Ch]
		jmp	short loc_2BC49
; ���������������������������������������������������������������������������

loc_2BC46:				; CODE XREF: Memory_AllocatorSlot_Helper_2BC1E+20j
		xor	eax, eax

loc_2BC49:				; CODE XREF: Memory_AllocatorSlot_Helper_2BC1E+12j
					; Memory_AllocatorSlot_Helper_2BC1E+1Cj ...
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
Memory_AllocatorSlot_Helper_2BC1E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Memory_AllocatorSlotArray_Construct_5CB63 (sub_5CB63 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658, 0x18 octets) ou
; réutilise un pointeur existant, initialise un tableau de 6 emplacements pointeurs à zéro.
; Référencée par Memory_AllocatorTableConstructor_5C9D3 (seg131) et sub_5CB99.
; ==============================================================================================
Memory_AllocatorSlotArray_Construct_2BC51	proc far		; CODE XREF: Memory_AllocatorTableConstructor_2BAC1+1AP
					; Memory_AllocatorTable_PopulateSlots_2BC87+EP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_2BC69
		push	18h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_2BC83

loc_2BC69:				; CODE XREF: Memory_AllocatorSlotArray_Construct_2BC51+8j
		xor	cx, cx
		jmp	short loc_2BC7E
; ���������������������������������������������������������������������������

loc_2BC6D:				; CODE XREF: Memory_AllocatorSlotArray_Construct_2BC51+30j
		mov	ax, cx
		shl	ax, 2
		mov	bx, dx
		add	bx, ax
		mov	dword ptr [bx],	0
		inc	cx

loc_2BC7E:				; CODE XREF: Memory_AllocatorSlotArray_Construct_2BC51+1Aj
		cmp	cx, 6
		jl	short loc_2BC6D

loc_2BC83:				; CODE XREF: Memory_AllocatorSlotArray_Construct_2BC51+16j
		mov	ax, dx
		pop	bp
		retf
Memory_AllocatorSlotArray_Construct_2BC51	endp

seg071		ends
