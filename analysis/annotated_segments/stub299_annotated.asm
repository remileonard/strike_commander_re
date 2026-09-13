stub299		segment	para public 'CODE' use16
		assume cs:stub299
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BEE0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0A16o
		dw 0			; memswap
		dd 28FE0h		; fileoff
		dw 6AFh			; codesize
		dw 6Ah			; relsize
		dw 10			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B497) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28FE0h, codesize=6AFh, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6BF00	proc far		; DATA XREF: seg339:1AC8o
		jmp	TerrainTile_Helper3_9B497
VROOMM_StubThunk_6BF00	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B48F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28FE0h, codesize=6AFh, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6BF05	proc far		; DATA XREF: seg339:1AB0o
		jmp	TerrainTile_Helper2_9B48F
VROOMM_StubThunk_6BF05	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B480) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28FE0h, codesize=6AFh, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6BF0A	proc far		; DATA XREF: Terrain_AllocateAndFormatMultiple_9B2F4+123o
		jmp	TerrainTile_Helper_9B480
VROOMM_StubThunk_6BF0A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B451) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28FE0h, codesize=6AFh, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6BF0F	proc far		; DATA XREF: Terrain_BuildAndLoadTilePath_9AECE+1BBo
		jmp	TerrainTile_ConstructDescriptor_9B451
VROOMM_StubThunk_6BF0F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9ADF0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28FE0h, codesize=6AFh, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6BF14	proc far
		jmp	Terrain_ProcessTileThunks_9ADF0
VROOMM_StubThunk_6BF14	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9AE6C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28FE0h, codesize=6AFh, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6BF19	proc far		; DATA XREF: seg339:1ACCo
		jmp	Terrain_ProcessTileThunksB_9AE6C
VROOMM_StubThunk_6BF19	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9AECE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28FE0h, codesize=6AFh, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6BF1E	proc far		; CODE XREF: MissionLoader_LoadFormation_A78F5+FBP
		jmp	Terrain_BuildAndLoadTilePath_9AECE
VROOMM_StubThunk_6BF1E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B2F4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28FE0h, codesize=6AFh, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6BF23	proc far		; CODE XREF: seg077:0329P
		jmp	Terrain_AllocateAndFormatMultiple_9B2F4
VROOMM_StubThunk_6BF23	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B161) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28FE0h, codesize=6AFh, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6BF28	proc far		; CODE XREF: MissionLoader_AssignUnitRosterB_A7E3B:loc_A7E6DP
		jmp	Terrain_ClearTileList_9B161
VROOMM_StubThunk_6BF28	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B1FC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28FE0h, codesize=6AFh, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6BF2D	proc far		; DATA XREF: seg339:1AC0o
		jmp	Terrain_FormatAndReleaseReader_9B1FC
VROOMM_StubThunk_6BF2D	endp

stub299		ends
