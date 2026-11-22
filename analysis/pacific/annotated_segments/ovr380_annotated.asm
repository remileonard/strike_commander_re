ovr380		segment	para public 'OVERLAY' use16
		assume cs:ovr380
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05 (fichiers, chunks et appels ; pas ligne par ligne). Commande 19
; (LOOK_AT_KILLBOARD) : police boardfnt ; sub_9B7FA charge blkbrd et csmlgp.
; ==============================================================================================
Gameflow_KillBoard_D47D0		proc far

var_278		= word ptr -278h
var_25A		= word ptr -25Ah
var_246		= word ptr -246h
var_21E		= word ptr -21Eh
var_21C		= word ptr -21Ch
var_204		= word ptr -204h
var_202		= word ptr -202h
var_1EE		= byte ptr -1EEh
var_1EA		= word ptr -1EAh
var_1DA		= word ptr -1DAh
var_1D8		= word ptr -1D8h
var_1D6		= word ptr -1D6h
var_1D2		= word ptr -1D2h
var_1D0		= word ptr -1D0h
var_1CE		= word ptr -1CEh
var_1CC		= word ptr -1CCh
var_1CA		= word ptr -1CAh
var_1C8		= word ptr -1C8h
var_1C4		= word ptr -1C4h
var_1A4		= word ptr -1A4h
var_12C		= word ptr -12Ch
var_B4		= word ptr -0B4h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_46		= word ptr -46h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2D		= byte ptr -2Dh
var_2C		= word ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= byte ptr -20h
var_1F		= byte ptr -1Fh
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= byte ptr -18h
var_17		= word ptr -17h
var_14		= dword ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 278h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		lea	ax, [bp+var_64]
		push	ss
		push	ax
		push	ds
		push	offset unk_7A84A
		mov	cx, 12h
		call	CRT_Fmemcpy
		xor	di, di
		jmp	loc_D48D7

loc_D4800:
		xor	cx, cx
		jmp	loc_D48C7

loc_D4805:
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_64]
		add	bx, ax
		mov	ax, [bx]
		imul	ax, ax, 1Bh
		mov	bx, si
		add	bx, ax
		mov	ax, [bx+57Fh]
		mov	bx, cx
		shl	bx, 1
		lea	dx, [bp+var_64]
		add	bx, dx
		mov	dx, [bx]
		imul	dx, dx, 1Bh
		mov	bx, si
		add	bx, dx
		add	ax, [bx+583h]
		mov	bx, cx
		shl	bx, 1
		lea	dx, [bp+var_64]
		add	bx, dx
		mov	dx, [bx]
		imul	dx, dx, 1Bh
		mov	bx, si
		add	bx, dx
		add	ax, [bx+581h]
		mov	[bp+var_38], ax
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	ax, [bx]
		imul	ax, ax, 1Bh
		mov	bx, si
		add	bx, ax
		mov	ax, [bx+57Fh]
		mov	bx, cx
		shl	bx, 1
		lea	dx, [bp+var_62]
		add	bx, dx
		mov	dx, [bx]
		imul	dx, dx, 1Bh
		mov	bx, si
		add	bx, dx
		add	ax, [bx+583h]
		mov	bx, cx
		shl	bx, 1
		lea	dx, [bp+var_62]
		add	bx, dx
		mov	dx, [bx]
		imul	dx, dx, 1Bh
		mov	bx, si
		add	bx, dx
		add	ax, [bx+581h]
		mov	[bp+var_3A], ax
		cmp	ax, [bp+var_38]
		jle	short loc_D48C6
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_64]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_3C], ax
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	ax, [bx]
		mov	bx, cx
		shl	bx, 1
		lea	dx, [bp+var_64]
		add	bx, dx
		mov	[bx], ax
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	ax, [bp+var_3C]
		mov	[bx], ax

loc_D48C6:
		inc	cx

loc_D48C7:
		mov	ax, di
		inc	ax
		mov	dx, 9
		sub	dx, ax
		cmp	dx, cx
		jle	short loc_D48D6
		jmp	loc_D4805

loc_D48D6:
		inc	di

loc_D48D7:
		cmp	di, 9
		jge	short loc_D48DF
		jmp	loc_D4800

loc_D48DF:
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
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_12C]
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
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_1A4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_7437
		add	sp, 6
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		push	2
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	3Bh
		lea	ax, [bp+var_12C]
		push	ax
		call	sub_75B60
		add	sp, 8
		lea	ax, word ptr [bp+var_A]
		push	ax
		lea	ax, [bp+var_1C4]
		push	ax
		call	sub_6743B
		add	sp, 4
		mov	[bp+var_14], 0
		mov	[bp+var_10], 2
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		push	2
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	0Ah
		lea	ax, [bp+var_1A4]
		push	ax
		call	sub_75B60
		add	sp, 8
		mov	[bp+var_1A], 0
		mov	[bp+var_17], 0
		lea	ax, word ptr [bp+var_14]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_76281
		add	sp, 4
		mov	[bp+var_1D2], 0
		mov	[bp+var_1D0], 0
		mov	[bp+var_1CE], 0
		mov	[bp+var_1CC], 0
		mov	[bp+var_1CA], 13Fh
		mov	[bp+var_1C8], 0C7h
		push	0
		lea	ax, [bp+var_1D2]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aBoardfnt
		push	3
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_B4]
		push	ax
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_28+2], dx
		mov	word ptr [bp+var_28], ax
		mov	eax, [bp+var_28]
		mov	[bp+var_24], eax
		mov	[bp+var_20], 2
		mov	[bp+var_1F], 1
		mov	[bp+var_1E], 0
		lea	ax, word ptr [bp+var_24]
		push	ax
		lea	ax, [bp+var_1EA]
		push	ax
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	[bp+var_1DA], 0
		mov	[bp+var_1D8], 0
		push	2Dh
		lea	ax, [bp+var_1EA]
		push	ax
		mov	bx, [bp+var_1EA]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_1D6], ax
		lea	ax, [bp+var_1EA]
		push	ax
		lea	ax, [bp+var_1D2]
		push	ax
		lea	ax, [bp+var_204]
		push	ax
		call	sub_75D04
		add	sp, 6
		lea	ax, [bp+var_1D2]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		call	sub_6735D
		add	sp, 4
		push	0
		push	[bp+var_1A]
		mov	al, [bp+var_18]
		push	ax
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_76259
		add	sp, 8
		push	0
		push	word_7AF7E
		call	TextScrollDisplayB_ApplyHelperA_6FA1B
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_6FABB
		push	word ptr [si+4E2h]
		lea	ax, [bp+var_1D2]
		push	ax
		lea	ax, [bp+var_21E]
		push	ax
		call	sub_75D04
		add	sp, 6
		push	4135h
		lea	ax, [bp+var_246]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	[bp+var_2D], 0
		mov	[bp+var_1EE], 4
		push	0FBCh
		lea	ax, [bp+var_25A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_D4B69

loc_D4B52:
		lea	ax, [bp+var_25A]
		push	ax
		call	CRT_Strlen
		pop	cx
		dec	ax
		lea	dx, [bp+var_25A]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_D4B69:
		lea	ax, [bp+var_25A]
		push	ax
		lea	ax, [bp+var_204]
		push	ax
		call	sub_75D4F
		add	sp, 4
		cmp	ax, 8Ch
		jle	short loc_D4B87
		cmp	byte ptr [bp+var_25A], 0
		jnz	short loc_D4B52

loc_D4B87:
		xor	eax, eax
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		mov	[bp+var_32], 3
		mov	eax, dword_7B29D
		mov	[bp+var_36], eax

loc_D4BA2:
		mov	eax, [bp+var_36]
		add	eax, [bp+var_32]
		cmp	eax, dword_7B29D
		ja	short loc_D4BB6
		mov	ax, 1
		jmp	short loc_D4BB8

loc_D4BB6:
		xor	ax, ax

loc_D4BB8:
		or	al, al
		jnz	short loc_D4BBF
		jmp	loc_D4DBB

loc_D4BBF:
		call	sub_75755
		mov	[bp+var_32], 3
		mov	eax, dword_7B29D
		mov	[bp+var_36], eax
		mov	[bp+var_38], 0Ch
		mov	[bp+var_3A], 39h
		lea	ax, [bp+var_1C4]
		push	ax
		call	sub_67A27
		pop	cx
		push	si
		call	sub_757E0
		pop	cx
		xor	di, di
		jmp	loc_D4D6D

loc_D4BF5:
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_64]
		add	bx, ax
		mov	ax, [bx]
		imul	ax, ax, 1Bh
		mov	bx, si
		add	bx, ax
		cmp	byte ptr [bx+585h], 0
		jnz	short loc_D4C11
		jmp	loc_D4D6C

loc_D4C11:
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_64]
		add	bx, ax
		cmp	word ptr [bx], 0
		jnz	short loc_D4C26
		lea	ax, [bp+var_25A]
		push	ax
		jmp	short loc_D4C3D

loc_D4C26:
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_64]
		add	bx, ax
		mov	ax, [bx]
		imul	ax, ax, 1Bh
		mov	dx, si
		add	dx, ax
		add	dx, 56Bh
		push	dx

loc_D4C3D:
		lea	ax, [bp+var_278]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_278]
		push	ax
		push	[bp+var_3A]
		push	1Bh
		push	4149h
		lea	ax, [bp+var_204]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		push	0Ah
		lea	ax, [bp+var_40]
		push	ax
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_64]
		add	bx, ax
		mov	ax, [bx]
		imul	ax, ax, 1Bh
		mov	bx, si
		add	bx, ax
		push	word ptr [bx+583h]
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	0Ah
		lea	ax, [bp+var_46]
		push	ax
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_64]
		add	bx, ax
		mov	ax, [bx]
		imul	ax, ax, 1Bh
		mov	bx, si
		add	bx, ax
		push	word ptr [bx+57Fh]
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	0Ah
		lea	ax, [bp+var_4C]
		push	ax
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_64]
		add	bx, ax
		mov	ax, [bx]
		imul	ax, ax, 1Bh
		mov	bx, si
		add	bx, ax
		push	word ptr [bx+581h]
		call	CRT_Itoa_Signed10
		add	sp, 6
		lea	ax, [bp+var_40]
		push	ax
		lea	ax, [bp+var_204]
		push	ax
		call	sub_75D4F
		add	sp, 4
		mov	[bp+var_4E], ax
		lea	ax, [bp+var_46]
		push	ax
		lea	ax, [bp+var_204]
		push	ax
		call	sub_75D4F
		add	sp, 4
		mov	[bp+var_50], ax
		lea	ax, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_204]
		push	ax
		call	sub_75D4F
		add	sp, 4
		mov	[bp+var_52], ax
		lea	ax, [bp+var_40]
		push	ax
		push	[bp+var_3A]
		mov	ax, 0F7h
		sub	ax, [bp+var_4E]
		push	ax
		push	4150h
		lea	ax, [bp+var_204]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		lea	ax, [bp+var_4C]
		push	ax
		push	[bp+var_3A]
		mov	ax, 11Fh
		sub	ax, [bp+var_52]
		push	ax
		push	4157h
		lea	ax, [bp+var_204]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		lea	ax, [bp+var_46]
		push	ax
		push	[bp+var_3A]
		mov	ax, 0CBh
		sub	ax, [bp+var_50]
		push	ax
		push	415Eh
		lea	ax, [bp+var_204]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah
		mov	ax, [bp+var_38]
		add	[bp+var_3A], ax

loc_D4D6C:
		inc	di

loc_D4D6D:
		cmp	di, 9
		jge	short loc_D4D75
		jmp	loc_D4BF5

loc_D4D75:
		cmp	[bp+var_2D], 0
		jz	short loc_D4D96
		lea	ax, [bp+var_246]
		push	ax
		push	large 0AF0002h
		push	4165h
		lea	ax, [bp+var_21E]
		push	ax
		call	sub_75D4A
		add	sp, 0Ah

loc_D4D96:
		push	word_7AF7C
		call	sub_6FC2E
		pop	cx
		lea	ax, [bp+var_1D2]
		push	ax
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		push	word_7AF7C
		call	sub_6FC40
		pop	cx

loc_D4DBB:
		mov	byte ptr [bp+var_3E], 0
		lea	ax, [bp+var_3E]
		push	ax
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte ptr [bp+var_3E], 0
		jnz	short loc_D4DF1
		lea	ax, [bp+var_3E]
		push	ax
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_D4DF1
		lea	ax, [bp+var_42]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_D4DF1

loc_D4DF1:
		cmp	byte ptr [bp+var_3E], 0
		jz	short loc_D4E1D
		mov	dx, [bp+var_3C]
		mov	bx, [bp+var_3A]
		or	dx, dx
		jle	short loc_D4E19
		cmp	dx, 280h
		jge	short loc_D4E19
		cmp	bx, 96h
		jle	short loc_D4E19
		cmp	bx, 0C8h
		jge	short loc_D4E19
		mov	[bp+var_2D], 1
		jmp	short loc_D4E1D

loc_D4E19:
		mov	[bp+var_2D], 0

loc_D4E1D:
		cmp	[bp+var_2D], 0
		jz	short loc_D4E37
		cmp	word_7D3DA, 1
		jnz	short loc_D4E4E
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	word_7D3DA, 0
		jmp	short loc_D4E49

loc_D4E37:
		cmp	word_7D3DA, 0
		jnz	short loc_D4E4E
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	word_7D3DA, 1

loc_D4E49:
		call	TextScrollDisplayB_ApplyHelperC_6FABB

loc_D4E4E:
		cmp	byte ptr [bp+var_3E], 2
		jnz	short loc_D4E5A
		cmp	[bp+var_2D], 0
		jnz	short loc_D4E6C

loc_D4E5A:
		cmp	byte ptr [bp+var_42], 2
		jz	short loc_D4E63
		jmp	loc_D4BA2

loc_D4E63:
		cmp	byte ptr [bp+var_42+1], 1
		jz	short loc_D4E6C
		jmp	loc_D4BA2

loc_D4E6C:
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		lea	ax, [bp+var_21C]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_2C]
		push	ax
		call	sub_67383
		pop	cx
		lea	ax, [bp+var_202]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	2
		lea	ax, [bp+var_1EA]
		push	ax
		call	sub_69368
		add	sp, 4
		cmp	[bp+var_1F], 0
		jz	short loc_D4ED2
		cmp	[bp+var_24], 0
		jz	short loc_D4ED2
		push	0
		mov	al, [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D4ED2

loc_D4ED2:
		mov	[bp+var_24], 0
		mov	[bp+var_1F], 0
		mov	[bp+var_1E], 0
		lea	ax, [bp+var_1D2]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_7627C
		pop	cx
		cmp	[bp+var_F], 0
		jz	short loc_D4F1F
		cmp	[bp+var_14], 0
		jz	short loc_D4F1F
		push	0
		mov	al, [bp+var_10]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D4F1F

loc_D4F1F:
		mov	[bp+var_14], 0
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		push	2
		lea	ax, [bp+var_1C4]
		push	ax
		call	CachedObject_Destruct_6761B
		add	sp, 4
		cmp	[bp+var_5], 0
		jz	short loc_D4F66
		cmp	[bp+var_A], 0
		jz	short loc_D4F66
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_D4F66

loc_D4F66:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		push	2
		lea	ax, [bp+var_1A4]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		push	2
		lea	ax, [bp+var_12C]
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_KillBoard_D47D0		endp
ovr380		ends
