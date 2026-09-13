seg132		segment	byte public 'CODE' use16
		assume cs:seg132
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedAllocDispatchE_5C916 ×3, Memory_TypedAllocDispatchC_5C86D,
; sub_5D76B et Registry_LookupForTextRenderer_5B5D9 (seg126). Référencée directement par
; TextRenderer_Main (sub_27477, seg048) — probable libération d'un glyphe/texte mis en cache.
; ==============================================================================================
TextRenderer_ReleaseCachedGlyph_5CA9E	proc far		; CODE XREF: TextRenderer_Main+3D6P
					; Memory_AllocatorTable_PopulateSlots_5CB99+22P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	1
		push	5C44h
		call	Memory_TypedAllocDispatchE_5C916
		add	sp, 6
		or	al, al
		jz	short loc_5CAD1
		push	0
		push	1
		push	5C44h
		call	Memory_TypedAllocDispatchC_5C86D
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[si+4],	eax
		jmp	short loc_5CAD9
; ���������������������������������������������������������������������������

loc_5CAD1:				; CODE XREF: TextRenderer_ReleaseCachedGlyph_5CA9E+18j
		mov	dword ptr [si+4], 0

loc_5CAD9:				; CODE XREF: TextRenderer_ReleaseCachedGlyph_5CA9E+31j
		push	0
		push	2
		push	5C44h
		call	Memory_TypedAllocDispatchE_5C916
		add	sp, 6
		or	al, al
		jz	short loc_5CAFB
		call	DisplayCache_Helper_5D76B
		push	dx
		push	ax

loc_5CAF3:
		pop	eax

loc_5CAF5:
		mov	[si+8],	eax
		jmp	short loc_5CB03
; ���������������������������������������������������������������������������

loc_5CAFB:				; CODE XREF: TextRenderer_ReleaseCachedGlyph_5CA9E+4Cj
		mov	dword ptr [si+8], 0

loc_5CB03:				; CODE XREF: TextRenderer_ReleaseCachedGlyph_5CA9E+5Bj
		push	0
		push	3

loc_5CB07:
		push	5C44h
		call	Memory_TypedAllocDispatchE_5C916
		add	sp, 6
		or	al, al
		jz	short loc_5CB25
		call	Registry_LookupForTextRenderer_5B5D9
		push	dx
		push	ax
		pop	eax
		mov	[si+0Ch], eax
		jmp	short loc_5CB2D
; ���������������������������������������������������������������������������

loc_5CB25:				; CODE XREF: TextRenderer_ReleaseCachedGlyph_5CA9E+76j
		mov	dword ptr [si+0Ch], 0

loc_5CB2D:				; CODE XREF: TextRenderer_ReleaseCachedGlyph_5CA9E+85j
		pop	si
		pop	bp

locret_5CB2F:
		retf
TextRenderer_ReleaseCachedGlyph_5CA9E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_5CB99 (rôle exact non détaillé, voisin du gestionnaire de mémoire
; typée).
; ==============================================================================================
Memory_AllocatorSlot_Helper_5CB30	proc far		; CODE XREF: Memory_AllocatorTable_PopulateSlots_5CB99+2BP
					; Memory_AllocatorTable_PopulateSlots_5CB99+3FP ...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		cmp	al, 1
		jnz	short loc_5CB44
		mov	eax, [si+4]
		jmp	short loc_5CB5B
; ���������������������������������������������������������������������������

loc_5CB44:				; CODE XREF: Memory_AllocatorSlot_Helper_5CB30+Cj
		cmp	al, 2
		jnz	short loc_5CB4E
		mov	eax, [si+8]
		jmp	short loc_5CB5B
; ���������������������������������������������������������������������������

loc_5CB4E:				; CODE XREF: Memory_AllocatorSlot_Helper_5CB30+16j
		cmp	al, 3
		jnz	short loc_5CB58
		mov	eax, [si+0Ch]
		jmp	short loc_5CB5B
; ���������������������������������������������������������������������������

loc_5CB58:				; CODE XREF: Memory_AllocatorSlot_Helper_5CB30+20j
		xor	eax, eax

loc_5CB5B:				; CODE XREF: Memory_AllocatorSlot_Helper_5CB30+12j
					; Memory_AllocatorSlot_Helper_5CB30+1Cj ...
		shld	edx, eax, 10h
		pop	si
		pop	bp
		retf
Memory_AllocatorSlot_Helper_5CB30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658, 0x18 octets) ou réutilise un pointeur existant, initialise un tableau
; de 6 emplacements pointeurs à zéro. Référencée par Memory_AllocatorTableConstructor_5C9D3
; (seg131) et sub_5CB99.
; ==============================================================================================
Memory_AllocatorSlotArray_Construct_5CB63	proc far		; CODE XREF: Memory_AllocatorTableConstructor_5C9D3+1AP
					; Memory_AllocatorTable_PopulateSlots_5CB99+EP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_5CB7B
		push	18h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_5CB95

loc_5CB7B:				; CODE XREF: Memory_AllocatorSlotArray_Construct_5CB63+8j
		xor	cx, cx
		jmp	short loc_5CB90
; ���������������������������������������������������������������������������

loc_5CB7F:				; CODE XREF: Memory_AllocatorSlotArray_Construct_5CB63+30j
		mov	ax, cx
		shl	ax, 2
		mov	bx, dx
		add	bx, ax
		mov	dword ptr [bx],	0
		inc	cx

loc_5CB90:				; CODE XREF: Memory_AllocatorSlotArray_Construct_5CB63+1Aj
		cmp	cx, 6
		jl	short loc_5CB7F

loc_5CB95:				; CODE XREF: Memory_AllocatorSlotArray_Construct_5CB63+16j
		mov	ax, dx
		pop	bp
		retf
Memory_AllocatorSlotArray_Construct_5CB63	endp

seg132		ends
