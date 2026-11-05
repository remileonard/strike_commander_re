ovr379		segment	para public 'OVERLAY' use16
		assume cs:ovr379
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05 (fichiers, chunks et appels ; pas ligne par ligne). Commande 29
; (SHOW_DOSSIER*) : page n de dossier.pak, police foptions.
; ==============================================================================================
Gameflow_ShowDossier_D3F00		proc far

var_2A6		= word ptr -2A6h
var_2A4		= word ptr -2A4h
var_290		= byte ptr -290h
var_28C		= word ptr -28Ch
var_28A		= word ptr -28Ah
var_272		= word ptr -272h
var_1FA		= word ptr -1FAh
var_1EA		= word ptr -1EAh
var_1E8		= word ptr -1E8h
var_1E6		= word ptr -1E6h
var_1E2		= word ptr -1E2h
var_16A		= word ptr -16Ah
var_F2		= word ptr -0F2h
var_F0		= word ptr -0F0h
var_EE		= word ptr -0EEh
var_EC		= word ptr -0ECh
var_EA		= word ptr -0EAh
var_E8		= word ptr -0E8h
var_E4		= word ptr -0E4h
var_B2		= word ptr -0B2h
var_61		= byte ptr -61h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= byte ptr -4Ah
var_49		= word ptr -49h
var_46		= dword ptr -46h
var_42		= byte ptr -42h
var_41		= byte ptr -41h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= byte ptr -34h
var_33		= byte ptr -33h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= byte ptr -2Ah
var_29		= byte ptr -29h
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2A6h
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	byte ptr [bp+var_8], 0
		mov	[bp+var_F2], 0
		mov	[bp+var_F0], 0
		mov	[bp+var_EE], 0
		mov	[bp+var_EC], 0
		mov	[bp+var_EA], 13Fh
		mov	[bp+var_E8], 0C7h
		push	0
		lea	ax, [bp+var_F2]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		lea	ax, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		call	sub_6735D
		add	sp, 4
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	37h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_16A]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	38h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_1E2]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_1A], 0
		mov	[bp+var_16], 2
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		push	2
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	4Ch
		lea	ax, [bp+var_16A]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_24], 0
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		push	2
		lea	ax, word ptr [bp+var_24]
		push	ax
		mov	ax, si
		add	ax, 4Ch
		push	ax
		lea	ax, [bp+var_16A]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_2E], 0
		mov	[bp+var_2A], 2
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		push	2
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	10h
		lea	ax, [bp+var_1E2]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aFoptions_1
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_B2]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_3C+2], dx
		mov	word ptr [bp+var_3C], ax
		mov	eax, [bp+var_3C]
		mov	[bp+var_38], eax
		mov	[bp+var_34], 2
		mov	[bp+var_33], 1
		mov	[bp+var_32], 0
		lea	ax, word ptr [bp+var_38]
		push	ax
		lea	ax, [bp+var_1FA]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[bp+var_1EA], 1
		mov	[bp+var_1E8], 0
		push	2Dh
		lea	ax, [bp+var_1FA]
		push	ax
		mov	bx, [bp+var_1FA]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_1E6], ax
		push	50h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aDossier
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_B2]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_272]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		lea	ax, [bp+var_1FA]
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_28C]
		push	ax
		call	sub_75D04
		add	sp, 6
		lea	ax, [bp+var_1FA]
		push	ax
		lea	ax, [bp+var_F2]
		push	ax
		lea	ax, [bp+var_2A6]
		push	ax
		call	sub_75D04
		add	sp, 6
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_28C]
		push	ax
		call	sub_75D18
		add	sp, 0Ah
		push	large 0BB010Ah
		push	large 520075h
		lea	ax, [bp+var_2A6]
		push	ax
		call	sub_75D18
		add	sp, 0Ah
		mov	[bp+var_46], 0
		mov	[bp+var_42], 2
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		push	2
		lea	ax, word ptr [bp+var_46]
		push	ax
		mov	ax, si
		dec	ax
		push	ax
		lea	ax, [bp+var_272]
		push	ax
		call	sub_75B60
		add	sp, 8
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	[bp+var_4C], 0
		mov	[bp+var_49], 0
		lea	ax, word ptr [bp+var_2E]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		call	sub_76281
		add	sp, 4
		push	0
		push	[bp+var_4C]
		mov	al, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_4C]
		push	ax
		call	sub_76259
		add	sp, 8
		push	large 0
		mov	al, [bp+var_16]
		push	ax
		push	large [bp+var_1A]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		push	large 0
		mov	al, [bp+var_20]
		push	ax
		push	large [bp+var_24]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		push	ds
		push	offset a__7
		push	0
		mov	al, [bp+var_42]
		push	ax
		push	large [bp+var_46]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_3A56
		add	sp, 8
		mov	[bp+var_4E], dx
		mov	[bp+var_50], ax
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_E4]
		push	ax
		call	sub_38D6
		add	sp, 8
		lea	ax, [bp+var_E4]
		push	ax
		push	large 3000ABh
		push	40FBh
		lea	ax, [bp+var_28C]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		push	ds
		push	offset a__8
		push	large 0
		call	sub_3A56
		add	sp, 8
		mov	[bp+var_4E], dx
		mov	[bp+var_50], ax
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_E4]
		push	ax
		call	sub_38D6
		add	sp, 8
		lea	ax, [bp+var_E4]
		push	ax
		push	large 3B00ABh
		push	4104h
		lea	ax, [bp+var_28C]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		push	ds
		push	offset a__9
		push	large 0
		call	sub_3A56
		add	sp, 8
		mov	[bp+var_4E], dx
		mov	[bp+var_50], ax
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_E4]
		push	ax
		call	sub_38D6
		add	sp, 8
		lea	ax, [bp+var_E4]
		push	ax
		push	large 4600ABh
		push	410Dh
		lea	ax, [bp+var_28C]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		lea	ax, [bp+var_F2]
		push	ax
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		push	ds
		push	offset a__10
		push	large 0
		call	sub_3A56
		add	sp, 8
		mov	[bp+var_4E], dx
		mov	[bp+var_50], ax
		mov	[bp+var_54], 0
		push	dx
		push	ax
		call	sub_398A
		add	sp, 4
		movzx	eax, ax
		mov	[bp+var_58], eax
		cmp	[bp+var_58], 0
		jz	short loc_D4383
		jmp	loc_D44CF

loc_D4383:
		lea	ax, [bp+var_4C]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	[bp+var_41], 0
		jz	short loc_D43B1
		cmp	[bp+var_46], 0
		jz	short loc_D43B1
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D43B1

loc_D43B1:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		lea	ax, [bp+var_2A4]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_28A]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_272]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_1FA]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_D441D
		cmp	[bp+var_38], 0
		jz	short loc_D441D
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D441D

loc_D441D:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_D4455
		cmp	[bp+var_2E], 0
		jz	short loc_D4455
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D4455

loc_D4455:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		cmp	[bp+var_1F], 0
		jz	short loc_D448D
		cmp	[bp+var_24], 0
		jz	short loc_D448D
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D448D

loc_D448D:
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		cmp	[bp+var_15], 0
		jnz	short loc_D44AA
		jmp	loc_D477B

loc_D44AA:
		cmp	[bp+var_1A], 0
		jnz	short loc_D44B4
		jmp	loc_D477B

loc_D44B4:
		push	0
		mov	al, [bp+var_16]
		push	ax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	loc_D477B
		jmp	loc_D477B

loc_D44CF:
		mov	[bp+var_290], 4
		xor	eax, eax
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		mov	[bp+var_61], 0
		call	Keyboard_DrainBufferBIOS_701E1
		call	sub_75750
		mov	byte ptr [bp+var_C], 0
		jmp	loc_D45A0

loc_D44F4:
		mov	[bp+var_5C], 1
		mov	eax, dword_7B29D
		mov	[bp+var_60], eax
		les	bx, [bp+var_50]
		mov	al, es:[bx]
		mov	ah, 0
		push	ax
		push	4116h
		lea	ax, [bp+var_2A6]
		push	ax
		call	sub_75D4A
		add	sp, 6
		inc	[bp+var_54]
		inc	[bp+var_50]
		mov	al, [bp+var_61]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D45A0
		lea	ax, [bp+var_F2]
		push	ax
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte ptr [bp+var_8], 0
		jnz	short loc_D4570
		lea	ax, [bp+var_8]
		push	ax
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D4570
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_D4570

loc_D4570:
		cmp	byte ptr [bp+var_8], 1
		jnz	short loc_D457A
		mov	[bp+var_61], 1

loc_D457A:
		cmp	byte ptr [bp+var_C], 0
		jz	short loc_D4584
		mov	[bp+var_61], 1

loc_D4584:
		mov	eax, [bp+var_60]
		add	eax, [bp+var_5C]
		cmp	eax, dword_7B29D
		ja	short loc_D4598
		mov	ax, 1
		jmp	short loc_D459A

loc_D4598:
		xor	ax, ax

loc_D459A:
		mov	ah, 0
		or	ax, ax
		jz	short loc_D4584

loc_D45A0:
		mov	eax, [bp+var_54]
		cmp	eax, [bp+var_58]
		jge	short loc_D45AD
		jmp	loc_D44F4

loc_D45AD:
		mov	[bp+var_61], 0
		call	Keyboard_DrainBufferBIOS_701E1
		call	sub_75750
		mov	byte ptr [bp+var_C], 0
		lea	ax, [bp+var_F2]
		push	ax
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		mov	[bp+var_5C], 7D0h
		mov	eax, dword_7B29D
		mov	[bp+var_60], eax
		jmp	short loc_D4628

loc_D45E2:
		lea	ax, [bp+var_8]
		push	ax
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte ptr [bp+var_8], 0
		jnz	short loc_D4614
		lea	ax, [bp+var_8]
		push	ax
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D4614
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_D4614

loc_D4614:
		cmp	byte ptr [bp+var_8], 2
		jnz	short loc_D461E
		mov	[bp+var_61], 1

loc_D461E:
		cmp	byte ptr [bp+var_C], 0
		jz	short loc_D4628
		mov	[bp+var_61], 1

loc_D4628:
		mov	eax, [bp+var_60]
		add	eax, [bp+var_5C]
		cmp	eax, dword_7B29D
		ja	short loc_D463C
		mov	ax, 1
		jmp	short loc_D463E

loc_D463C:
		xor	ax, ax

loc_D463E:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D464D
		mov	al, [bp+var_61]
		mov	ah, 0
		or	ax, ax
		jz	short loc_D45E2

loc_D464D:
		lea	ax, [bp+var_4C]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	[bp+var_41], 0
		jz	short loc_D467B
		cmp	[bp+var_46], 0
		jz	short loc_D467B
		push	0
		mov	al, [bp+var_42]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D467B

loc_D467B:
		mov	[bp+var_46], 0
		mov	[bp+var_41], 0
		mov	[bp+var_40], 0
		lea	ax, [bp+var_2A4]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_28A]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_272]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_1FA]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_33], 0
		jz	short loc_D46E7
		cmp	[bp+var_38], 0
		jz	short loc_D46E7
		push	0
		mov	al, [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D46E7

loc_D46E7:
		mov	[bp+var_38], 0
		mov	[bp+var_33], 0
		mov	[bp+var_32], 0
		cmp	[bp+var_29], 0
		jz	short loc_D471F
		cmp	[bp+var_2E], 0
		jz	short loc_D471F
		push	0
		mov	al, [bp+var_2A]
		push	ax
		lea	ax, word ptr [bp+var_2E]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D471F

loc_D471F:
		mov	[bp+var_2E], 0
		mov	[bp+var_29], 0
		mov	[bp+var_28], 0
		cmp	[bp+var_1F], 0
		jz	short loc_D4757
		cmp	[bp+var_24], 0
		jz	short loc_D4757
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D4757

loc_D4757:
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		cmp	[bp+var_15], 0
		jz	short loc_D477B
		cmp	[bp+var_1A], 0
		jz	short loc_D477B
		jmp	loc_D44B4

loc_D477B:
		mov	[bp+var_1A], 0
		mov	[bp+var_15], 0
		mov	[bp+var_14], 0
		push	2
		lea	ax, [bp+var_1E2]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_16A]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		lea	ax, [bp+var_10]
		push	ax
		call	sub_67383
		pop	cx
		lea	ax, [bp+var_F2]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		pop	si
		leave
		retf
Gameflow_ShowDossier_D3F00		endp
ovr379		ends
