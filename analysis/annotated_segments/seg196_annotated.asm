seg196		segment	byte public 'CODE' use16
		assume cs:seg196
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, destructeur (tag 402Ah) : ferme le flux (StreamReader_CloseHook_63D6E), libère un champ
; (+0x75) et le flux lui-même (StreamReader_Close_63BD5), libère l'objet si demandé.
; Référencée par sub_33485 et sub_3350E (proches du cœur IA).
; ==============================================================================================
IndexedRecordReader_Destruct_659D0	proc far		; CODE XREF: TerrainTile_DescriptorDestruct+34P
					; Terrain_SectorIndexResolve+EBP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si

loc_659DD:				; DATA XREF: seg216:06E6o
		jz	short loc_65A16
		mov	word ptr [si], 402Ah
		push	si
		call	StreamReader_ValidateState_63DB5
		pop	cx
		or	al, al
		jz	short loc_659F5
		push	si

loc_659EF:
		call	StreamReader_CloseHook_63D6E
		pop	cx

loc_659F5:				; CODE XREF: IndexedRecordReader_Destruct_659D0+1Cj
		push	word ptr [si+75h]
		call	CRT_FreeNear_Wrap
		pop	cx
		push	0
		push	si
		call	StreamReader_Close_63BD5
		add	sp, 4
		test	di, 1
		jz	short loc_65A16
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_65A16:				; CODE XREF: IndexedRecordReader_Destruct_659D0:loc_659DDj
					; IndexedRecordReader_Destruct_659D0+3Dj
		pop	di
		pop	si
		pop	bp
		retf
IndexedRecordReader_Destruct_659D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), construit un StreamReader (StreamReader_ConstructVariantA_63A39,
; seg190) et initialise les champs d'index (sub_65B03).
; ==============================================================================================
IndexedRecordReader_ConstructVariantA_65A1A	proc far		; CODE XREF: TerrainTile_DescriptorConstruct:loc_3332BP
					; Terrain_SectorIndexResolve+90P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_65A21:
		or	si, si

loc_65A23:
		jnz	short loc_65A33
		push	77h ; 'w'

loc_65A27:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_65A2F:
		or	ax, ax
		jz	short loc_65A45

loc_65A33:				; CODE XREF: IndexedRecordReader_ConstructVariantA_65A1A:loc_65A23j
		push	si

loc_65A34:
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	word ptr [si], 402Ah
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_65B03
		pop	cx

loc_65A45:				; CODE XREF: IndexedRecordReader_ConstructVariantA_65A1A+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
IndexedRecordReader_ConstructVariantA_65A1A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que ConstructVariantA avec dispatch vtable [bx+0x14] additionnel.
; ==============================================================================================
IndexedRecordReader_ConstructVariantB_65A4A	proc far		; CODE XREF: AudioQueue_ProcessMain_AA84E+54P
					; AudioQueue_ProcessMain_AA84E+12BP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_65A63
		push	77h ; 'w'

loc_65A57:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_65A85

loc_65A63:				; CODE XREF: IndexedRecordReader_ConstructVariantB_65A4A+9j
		push	si
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	word ptr [si], 402Ah
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_65B03
		pop	cx
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_65A85:				; CODE XREF: IndexedRecordReader_ConstructVariantB_65A4A+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
IndexedRecordReader_ConstructVariantB_65A4A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), construit via StreamReader_ConstructAndBind_63B23 (seg190) et
; initialise les champs d'index (sub_65B03), dispatch vtable [bx+0xC].
; ==============================================================================================
IndexedRecordReader_ConstructVariantC_65A8A	proc far		; CODE XREF: MissionRecord_LoadEntityDatabase_7B035+71P
					; MissionRecord_LoadAndBuildWidgetTree_7D31A+64P ...

var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_65AA6
		push	77h ; 'w'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_65AA2:
		or	ax, ax
		jz	short loc_65AFE

loc_65AA6:				; CODE XREF: IndexedRecordReader_ConstructVariantC_65A8A+Cj
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax

loc_65AAC:
		mov	eax, [bp+arg_4]

loc_65AB0:
		mov	[bp+var_6], eax

loc_65AB4:
		mov	eax, [bp+arg_8]
		mov	[bp+var_A], eax
		mov	word ptr [si], 39E3h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], seg seg160
		mov	word ptr [si+2], 0
		mov	word ptr [si], 3FB3h
		push	0
		push	eax
		push	large [bp+var_6]
		push	[bp+var_2]
		push	si
		call	StreamReader_ConstructAndBind_63B23
		add	sp, 0Eh
		mov	word ptr [si], 402Ah
		push	si

loc_65AF1:
		nop
		push	cs
		call	near ptr IndexedRecordReader_InitFields_65B03
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_65AFE:				; CODE XREF: IndexedRecordReader_ConstructVariantC_65A8A+1Aj
		mov	ax, si
		pop	si
		leave
		retf
IndexedRecordReader_ConstructVariantC_65A8A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, initialise les champs d'index de l'objet (+0x5D compteur courant, +0x5F total,
; +0x61/+0x65 position, +0x75 cache) à zéro. Appelée par les trois constructeurs
; ConstructVariant*.
; ==============================================================================================
IndexedRecordReader_InitFields_65B03	proc far		; CODE XREF: IndexedRecordReader_ConstructVariantA_65A1A+27p
					; IndexedRecordReader_ConstructVariantB_65A4A+27p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+5Dh], ax
		mov	[si+5Fh], ax
		movsx	eax, ax
		mov	[si+65h], eax
		mov	[si+61h], eax

loc_65B1E:
		mov	word ptr [si+75h], 0
		pop	si
		pop	bp
		retf
IndexedRecordReader_InitFields_65B03	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — lit un champ 32 bits
; (StreamReader_ReadTyped_63FA1), le divise par 4 pour obtenir un nombre d'entrées d'index,
; décrémenté de 1 (-1 = dernier index valide).
; ==============================================================================================
IndexedRecordReader_Method_ComputeCount_65B26:				; DATA XREF: seg339:off_710E6o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	si
		call	StreamReader_PrepareForRead_63F46
		pop	cx
		push	large 4
		push	large 4
		push	ss
		lea	ax, [bp-4]

loc_65B41:
		push	ax
		push	si

loc_65B43:
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		mov	eax, [bp-4]

loc_65B4F:
		mov	ebx, 4
		cdq

loc_65B57:
		idiv	ebx

loc_65B5A:
		dec	ax
		mov	[si+5Dh], ax

loc_65B5E:
		mov	word ptr [si+5Fh], 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, stub retournant 0 (32 bits).
; ==============================================================================================
IndexedRecordReader_Method_ReturnZero_65B66:
		push	bp

loc_65B67:
		mov	bp, sp
		xor	eax, eax
		shld	edx, eax, 10h
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 129 lignes, NON DÉTAILLÉE — combine Memory_TypedFreeWrapperC_5C6F3 (×2),
; StreamReader_ReadTyped_63FA1, sub_66068 et Memory_TypedFree_5C7B6 (×2) — probable chargement
; complet de la table d'index en mémoire.
; ==============================================================================================
IndexedRecordReader_ReadIndexTable_65B73	proc far		; CODE XREF: IndexedRecordReader_SeekToIndex_65C6D+88p

var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 400h
		push	1
		push	0
		push	2
		mov	eax, [bp+var_4]
		add	eax, 0Fh
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx

loc_65BA3:
		mov	word ptr [bp+var_8], ax

loc_65BA6:
		mov	[bp+var_C], 3000h

loc_65BAE:
		push	1
		push	0
		push	2
		mov	eax, [bp+var_C]
		add	eax, 0Fh
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax

loc_65BCF:
		mov	bx, [si+59h]

loc_65BD2:
		mov	ax, [bx+2]

loc_65BD5:
		mov	word_710FA, ax
		mov	word_71111, 0
		mov	word_710F2, 0
		mov	eax, [bp+var_8]
		mov	[bp+var_14], eax
		mov	cx, word ptr [bp+var_14+2]
		mov	bx, word ptr [bp+var_14]

loc_65BF2:
		mov	dx, bx
		and	dx, 0Fh
		or	dx, dx
		jz	short loc_65C00
		sub	bx, dx
		inc	cx
		jmp	short $+2

loc_65C00:				; CODE XREF: IndexedRecordReader_ReadIndexTable_65B73+86j
		mov	seg_7110B, cx

loc_65C04:
		mov	word_71109, bx
		mov	ax, word ptr [bp+var_4]
		mov	word_7110D, ax
		mov	dx, [bp+var_E]
		cmp	[bp+var_10], 0
		jz	short loc_65C18
		inc	dx

loc_65C18:				; CODE XREF: IndexedRecordReader_ReadIndexTable_65B73+A2j
		mov	word_710FE, dx
		mov	eax, [bp+arg_A]

loc_65C20:
		mov	dword ptr word_71105, eax

loc_65C24:
		push	large 0FFFFFFFFh
		push	large [bp+var_4]
		push	large [dword ptr word_71109]
		push	si

loc_65C31:
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		call	LZW_Decompress_66068
		mov	[bp+var_16], ax
		push	0
		push	2
		lea	ax, [bp+var_10]
		push	ax
		push	5C44h

loc_65C4C:
		call	Memory_TypedFree_5C7B6

loc_65C51:
		add	sp, 8
		push	0

loc_65C56:
		push	2

loc_65C58:
		lea	ax, [bp+var_8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	ax, [bp+var_16]
		pop	si
		leave
		retf
IndexedRecordReader_ReadIndexTable_65B73	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 123 lignes, NON DÉTAILLÉE — combine Runtime_FatalErrorHandlerWithTag (sub_5F4A9),
; IndexedRecordReader_AdvanceIndex_65E2C, StreamReader_ReadTyped_63FA1 et
; IndexedRecordReader_ReadIndexTable_65B73 — positionnement sur une entrée d'index donnée.
; ==============================================================================================
IndexedRecordReader_SeekToIndex_65C6D	proc far		; CODE XREF: TextRenderer_InputFieldHandler_5A0F3+107P
					; TextRenderer_InputFieldHandler_5A0F3+352P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	[bp+arg_4], 0
		jnz	short loc_65C8B
		push	1D01h
		push	si
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4

loc_65C8B:				; CODE XREF: IndexedRecordReader_SeekToIndex_65C6D+10j
		cmp	di, 0FFFFh
		jz	short loc_65C9E
		push	di
		push	si
		nop

loc_65C93:
		push	cs

loc_65C94:
		call	near ptr IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		or	al, al

loc_65C9C:
		jz	short loc_65D09

loc_65C9E:				; CODE XREF: IndexedRecordReader_SeekToIndex_65C6D+21j
		mov	ax, [si+6Dh]

loc_65CA1:
		and	ax, 0C0h

loc_65CA4:
		or	ax, ax

loc_65CA6:
		jz	short loc_65CC4
		cmp	ax, 0C0h ; '�'

loc_65CAB:
		jnz	short loc_65CFD
		push	large dword ptr	[si+65h]
		push	large dword ptr	[si+61h]
		push	large [bp+arg_4]
		push	si
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh

loc_65CC2:
		jmp	short loc_65D09
; ���������������������������������������������������������������������������

loc_65CC4:				; CODE XREF: IndexedRecordReader_SeekToIndex_65C6D:loc_65CA6j
		mov	ax, [si+6Dh]
		and	ax, 0C0h

loc_65CCA:
		cmp	ax, 0C0h ; '�'

loc_65CCD:
		jnz	short loc_65CD5

loc_65CCF:
		mov	eax, [si+61h]

loc_65CD3:
		jmp	short loc_65CD9
; ���������������������������������������������������������������������������

loc_65CD5:				; CODE XREF: IndexedRecordReader_SeekToIndex_65C6D:loc_65CCDj
		mov	eax, [si+71h]

loc_65CD9:				; CODE XREF: IndexedRecordReader_SeekToIndex_65C6D:loc_65CD3j
		push	eax
		push	large [bp+arg_4]

loc_65CDF:
		mov	eax, [si+61h]

loc_65CE3:
		add	eax, 0FFFFFFFCh

loc_65CE7:
		push	eax
		mov	eax, [si+65h]
		add	eax, 4
		push	eax

loc_65CF3:
		push	si
		push	cs
		call	near ptr IndexedRecordReader_ReadIndexTable_65B73

loc_65CF8:
		add	sp, 12h
		jmp	short loc_65D09
; ���������������������������������������������������������������������������

loc_65CFD:				; CODE XREF: IndexedRecordReader_SeekToIndex_65C6D:loc_65CABj
		push	1D00h
		push	si
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4

loc_65D09:				; CODE XREF: IndexedRecordReader_SeekToIndex_65C6D:loc_65C9Cj
					; IndexedRecordReader_SeekToIndex_65C6D:loc_65CC2j	...
		pop	di
		pop	si
		pop	bp
		retf
IndexedRecordReader_SeekToIndex_65C6D	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		inc	word ptr [si+5Fh]
		mov	ax, [si+5Fh]
		cmp	ax, [si+5Dh]
		jnz	short loc_65D2B
		push	1D02h
		push	si

loc_65D23:
		call	DisplayContext_CommitFrameWithTag_5F4A9

loc_65D28:
		add	sp, 4

loc_65D2B:				; CODE XREF: seg196:034Dj
		push	word ptr [si+5Fh]

loc_65D2E:
		push	si

loc_65D2F:
		nop
		push	cs

loc_65D31:
		call	near ptr IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		pop	si

loc_65D38:
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+5Fh]
		dec	word ptr [si+5Fh]
		or	ax, ax

loc_65D49:
		jnz	short loc_65D57

loc_65D4B:
		push	1D02h
		push	si

loc_65D4F:
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4

loc_65D57:				; CODE XREF: seg196:loc_65D49j
		push	word ptr [si+5Fh]
		push	si
		nop
		push	cs
		call	near ptr IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+5Dh], 0
		jz	short loc_65DA6
		mov	ax, [si+5Dh]
		shl	ax, 2
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+75h], ax
		cmp	word ptr [si+75h], 0
		jz	short loc_65DA6
		push	large 4
		mov	ax, [si+5Dh]
		inc	ax
		shl	ax, 2

loc_65D93:
		movsx	eax, ax

loc_65D97:
		push	eax
		push	ds
		push	word ptr [si+75h]
		push	si

loc_65D9E:
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh

loc_65DA6:				; CODE XREF: seg196:03A1j seg196:03B7j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit une entrée via StreamReader_ReadTyped_63FA1, gestion d'erreur
; (Runtime_FatalErrorHandlerWithTag). Appelée deux fois par sub_65E2C.
; ==============================================================================================
IndexedRecordReader_ReadEntry_65DA9	proc far		; CODE XREF: IndexedRecordReader_AdvanceIndex_65E2C+11p
					; IndexedRecordReader_AdvanceIndex_65E2C+3Ep

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_65DAA:
		mov	bp, sp
		sub	sp, 4

loc_65DAF:
		push	si
		mov	si, [bp+arg_0]

loc_65DB3:
		mov	dx, [bp+arg_2]

loc_65DB6:
		mov	[bp+var_4], 0
		cmp	[si+5Dh], dx
		jbe	short loc_65E14
		cmp	word ptr [si+75h], 0

loc_65DC7:
		jz	short loc_65DDC
		mov	ax, dx
		shl	ax, 2

loc_65DCE:
		mov	bx, [si+75h]
		add	bx, ax
		mov	eax, [bx]

loc_65DD6:
		mov	[bp+var_4], eax
		jmp	short loc_65DF9
; ���������������������������������������������������������������������������

loc_65DDC:				; CODE XREF: IndexedRecordReader_ReadEntry_65DA9:loc_65DC7j
		mov	ax, dx
		inc	ax
		shl	ax, 2

loc_65DE2:
		movsx	eax, ax
		push	eax
		push	large 4
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh

loc_65DF9:				; CODE XREF: IndexedRecordReader_ReadEntry_65DA9+31j
		mov	eax, [bp+var_4]
		sar	eax, 18h
		mov	word_72D9A, ax
		mov	eax, [bp+var_4]
		and	eax, 0FFFFFFh
		mov	[bp+var_4], eax

loc_65E12:
		jmp	short loc_65E20
; ���������������������������������������������������������������������������

loc_65E14:				; CODE XREF: IndexedRecordReader_ReadEntry_65DA9+18j
		push	1D02h
		push	si

loc_65E18:
		call	DisplayContext_CommitFrameWithTag_5F4A9

loc_65E1D:
		add	sp, 4

loc_65E20:				; CODE XREF: IndexedRecordReader_ReadEntry_65DA9:loc_65E12j
		mov	eax, [bp+var_4]

loc_65E24:
		shld	edx, eax, 10h

loc_65E29:
		pop	si
		leave
		retf
IndexedRecordReader_ReadEntry_65DA9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 115 lignes, NON DÉTAILLÉE — combine IndexedRecordReader_ReadEntry_65DA9 (×2),
; StreamReader_GetCapacity_64062, StreamReader_SeekVariant_63DF6, StreamReader_ReadTyped_63FA1
; — avance vers l'entrée d'index suivante et positionne le flux.
; ==============================================================================================
IndexedRecordReader_AdvanceIndex_65E2C	proc far		; CODE XREF: Terrain_HeightmapAllocate+DDP
					; Terrain_SectorIndexResolve+B3P ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8

loc_65E32:
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr IndexedRecordReader_ReadEntry_65DA9
		push	dx
		push	ax

loc_65E42:
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax

loc_65E4B:
		mov	ax, word_72D9A

loc_65E4E:
		mov	[si+6Dh], ax

loc_65E51:
		mov	[si+5Fh], di

loc_65E54:
		inc	di
		cmp	[si+5Dh], di
		jnz	short loc_65E67
		push	si
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax
		pop	eax

loc_65E64:
		pop	cx
		jmp	short loc_65E74
; ���������������������������������������������������������������������������

loc_65E67:				; CODE XREF: IndexedRecordReader_AdvanceIndex_65E2C+2Cj
		push	di
		push	si
		push	cs
		call	near ptr IndexedRecordReader_ReadEntry_65DA9
		push	dx
		push	ax
		pop	eax
		add	sp, 4

loc_65E74:				; CODE XREF: IndexedRecordReader_AdvanceIndex_65E2C+39j
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		sub	eax, [bp+var_4]
		mov	[si+61h], eax
		mov	eax, [bp+var_4]
		mov	[si+65h], eax
		push	eax
		push	si

loc_65E8F:
		call	StreamReader_SeekVariant_63DF6
		add	sp, 6
		test	word ptr [si+6Dh], 0C0h

loc_65E9C:
		jnz	short loc_65EB7
		push	large dword ptr	[si+65h]

loc_65EA2:
		push	large 4
		push	ds
		mov	ax, si

loc_65EA8:
		add	ax, 71h	; 'q'
		push	ax

loc_65EAC:
		push	si
		call	StreamReader_ReadTyped_63FA1

loc_65EB2:
		add	sp, 0Eh

loc_65EB5:
		jmp	short loc_65EBF
; ���������������������������������������������������������������������������

loc_65EB7:				; CODE XREF: IndexedRecordReader_AdvanceIndex_65E2C:loc_65E9Cj
		mov	eax, [si+61h]
		mov	[si+71h], eax

loc_65EBF:				; CODE XREF: IndexedRecordReader_AdvanceIndex_65E2C:loc_65EB5j
		mov	al, 1
		pop	di
		pop	si

locret_65EC3:
		leave
		retf
IndexedRecordReader_AdvanceIndex_65E2C	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — construit un nouvel objet copiant l'état
; d'index courant (tag 3FEAh via sub_5E9A9), transfère le flux sous-jacent
; (StreamReader_Destruct_638FF puis Member_ClearAndFree_5EA03) — probable méthode « clone » de
; l'itérateur d'index.
; ==============================================================================================
IndexedRecordReader_Method_CloneState_65EC5:				; DATA XREF: seg339:off_710DAo
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si

loc_65ECC:
		mov	si, [bp+6]

loc_65ECF:
		mov	word ptr [bp-4], 0
		mov	word ptr [bp-2], 0
		push	large dword ptr	[si+69h]

loc_65EDD:
		push	large dword ptr	[si+65h]

loc_65EE1:
		push	large dword ptr	[si+61h]
		push	word ptr [si+5Fh]
		push	word ptr [si+5Dh]
		push	3FEAh
		lea	ax, [bp-4]
		push	ax
		call	DisplaySurface_ConstructWithMode_5E9A9
		add	sp, 14h
		push	word ptr [bp-4]
		mov	ax, si
		add	ax, 6
		push	ax
		call	CachedObject_DestructSubobjects_5E95A
		add	sp, 4
		push	si
		call	StreamReader_Destruct_638FF
		pop	cx
		lea	ax, [bp-4]
		push	ax

loc_65F16:
		call	Member_ClearAndFree_5EA03
		pop	cx
		pop	si
		leave
		retf
seg196		ends
