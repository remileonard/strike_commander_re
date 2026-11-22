ovr399		segment	para public 'OVERLAY' use16
		assume cs:ovr399
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_AllocatorTable_PopulateSlots_2BC87 (sub_2BC87
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
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
Memory_AllocatorTable_PopulateSlots_E50D0		proc far

var_1E		= word ptr -1Eh
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_7640A
		pop	cx
		mov	[bp+var_4], 0
		mov	[bp+var_2], 0
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_76400
		pop	cx
		push	3
		push	si
		call	sub_76405
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		push	eax
		push	3
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_76405
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
		call	sub_76405
		add	sp, 4
		push	dx
		push	ax
		push	3
		push	si
		call	sub_76405
		add	sp, 4
		push	dx
		push	ax
		push	2
		push	si
		call	sub_76405
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		push	eax
		push	2
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_76405
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
		call	sub_76405
		add	sp, 4
		push	dx
		push	ax
		push	2
		push	si
		call	sub_76405
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	si
		call	sub_76405
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		push	eax
		push	1
		lea	ax, [bp+var_1E]
		push	ax
		call	sub_76405
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
		call	sub_76405
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	si
		call	sub_76405
		add	sp, 4
		push	dx
		push	ax
		push	4308h
		lea	ax, [bp+var_4]
		push	ax
		call	sub_765B4
		add	sp, 28h
		mov	ax, [bp+var_4]
		mov	[bp+var_6], ax
		lea	ax, [bp+var_4]
		push	ax
		call	sub_765E5
		pop	cx
		mov	ax, [bp+var_6]
		pop	si
		leave
		retf
Memory_AllocatorTable_PopulateSlots_E50D0		endp
ovr399		ends
