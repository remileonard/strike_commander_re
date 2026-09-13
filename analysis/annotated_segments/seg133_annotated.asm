seg133		segment	byte public 'CODE' use16
		assume cs:seg133
		;org 9
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 152 lignes — construit le tableau de 6 emplacements
; (Memory_AllocatorSlotArray_Construct_5CB63), libère un glyphe en cache
; (TextRenderer_ReleaseCachedGlyph_5CA9E), puis peuple/configure chaque emplacement
; (Memory_AllocatorSlot_Helper_5CB30, appelée 12 fois), termine par la construction de deux
; sous-objets (sub_5E9A9/sub_5EA03). Référencée par sub_5F700 (seg125, via
; TextObject_AllocateVariantA_5A984).
; ==============================================================================================
Memory_AllocatorTable_PopulateSlots_5CB99	proc far		; CODE XREF: Runtime_FatalErrorHandler_5F700+37P
					; Runtime_FatalErrorHandler_5F700+46P

var_1E		= word ptr -1Eh
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_5CB9C:				; DATA XREF: seg216:04EEo
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlotArray_Construct_5CB63
		pop	cx
		mov	[bp+var_4], 0
		mov	[bp+var_2], 0
		lea	ax, [bp+var_1E]
		push	ax
		call	TextRenderer_ReleaseCachedGlyph_5CA9E
		pop	cx
		push	3
		push	si
		call	Memory_AllocatorSlot_Helper_5CB30
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		push	eax
		push	3
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_5CB30
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		pop	edx
		sub	edx, eax
		push	edx
		push	3
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_5CB30

loc_5CBF6:
		add	sp, 4
		push	dx
		push	ax
		push	3
		push	si

loc_5CBFE:
		call	Memory_AllocatorSlot_Helper_5CB30
		add	sp, 4
		push	dx
		push	ax
		push	2
		push	si
		call	Memory_AllocatorSlot_Helper_5CB30
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		push	eax
		push	2
		lea	ax, [bp+var_1E]
		push	ax

loc_5CC1F:
		call	Memory_AllocatorSlot_Helper_5CB30
		push	dx
		push	ax
		pop	eax
		add	sp, 4

loc_5CC2B:
		pop	edx
		sub	edx, eax
		push	edx
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_5CB30
		add	sp, 4
		push	dx
		push	ax
		push	2
		push	si
		call	Memory_AllocatorSlot_Helper_5CB30
		add	sp, 4
		push	dx
		push	ax
		push	1

loc_5CC51:
		push	si

loc_5CC52:
		call	Memory_AllocatorSlot_Helper_5CB30
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		push	eax
		push	1
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_5CB30
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		pop	edx
		sub	edx, eax
		push	edx
		push	1
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_5CB30
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	si
		call	Memory_AllocatorSlot_Helper_5CB30
		add	sp, 4
		push	dx
		push	ax
		push	3BA4h
		lea	ax, [bp+var_4]
		push	ax
		call	DisplaySurface_ConstructWithMode_5E9A9
		add	sp, 28h
		mov	ax, [bp+var_4]
		mov	[bp+var_6], ax
		lea	ax, [bp+var_4]
		push	ax

loc_5CCAF:
		call	Member_ClearAndFree_5EA03
		pop	cx
		mov	ax, [bp+var_6]
		pop	si
		leave
		retf
Memory_AllocatorTable_PopulateSlots_5CB99	endp

seg133		ends
