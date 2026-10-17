seg072		segment	byte public 'CODE' use16
		assume cs:seg072
		;org 7
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_AllocatorTable_PopulateSlots_5CB99 (sub_5CB99
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 152 lignes — construit le tableau de 6 emplacements
; (Memory_AllocatorSlotArray_Construct_5CB63), libère un glyphe en cache
; (TextRenderer_ReleaseCachedGlyph_5CA9E), puis peuple/configure chaque emplacement
; (Memory_AllocatorSlot_Helper_5CB30, appelée 12 fois), termine par la construction de deux
; sous-objets (sub_5E9A9/sub_5EA03). Référencée par sub_5F700 (seg125, via
; Music_RequestTune_5A984).
; ==============================================================================================
Memory_AllocatorTable_PopulateSlots_2BC87	proc far		; CODE XREF: Runtime_FatalErrorHandler_2FF75+37P
					; Runtime_FatalErrorHandler_2FF75+46P

var_1E		= word ptr -1Eh
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_2BC8A:				; DATA XREF: seg170:030Eo
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlotArray_Construct_2BC51
		pop	cx
		mov	[bp+var_4], 0
		mov	[bp+var_2], 0
		lea	ax, [bp+var_1E]
		push	ax
		call	TextRenderer_ReleaseCachedGlyph_2BB8C
		pop	cx
		push	3
		push	si
		call	Memory_AllocatorSlot_Helper_2BC1E
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		push	eax
		push	3
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_2BC1E
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
		call	Memory_AllocatorSlot_Helper_2BC1E
		add	sp, 4
		push	dx
		push	ax
		push	3
		push	si
		call	Memory_AllocatorSlot_Helper_2BC1E
		add	sp, 4
		push	dx
		push	ax
		push	2
		push	si
		call	Memory_AllocatorSlot_Helper_2BC1E
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		push	eax
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_2BC1E
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		pop	edx
		sub	edx, eax
		push	edx
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_2BC1E
		add	sp, 4
		push	dx
		push	ax
		push	2
		push	si
		call	Memory_AllocatorSlot_Helper_2BC1E
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	si
		call	Memory_AllocatorSlot_Helper_2BC1E
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		push	eax
		push	1
		lea	ax, [bp+var_1E]
		push	ax
		call	Memory_AllocatorSlot_Helper_2BC1E
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
		call	Memory_AllocatorSlot_Helper_2BC1E
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	si
		call	Memory_AllocatorSlot_Helper_2BC1E
		add	sp, 4
		push	dx
		push	ax
		push	3D16h
		lea	ax, [bp+var_4]
		push	ax
		call	DisplaySurface_ConstructWithMode_2F21E
		add	sp, 28h
		mov	ax, [bp+var_4]
		mov	[bp+var_6], ax
		lea	ax, [bp+var_4]
		push	ax
		call	Member_ClearAndFree_2F278
		pop	cx
		mov	ax, [bp+var_6]
		pop	si
		leave
		retf
Memory_AllocatorTable_PopulateSlots_2BC87	endp

seg072		ends
