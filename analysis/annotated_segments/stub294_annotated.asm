stub294		segment	para public 'CODE' use16
		assume cs:stub294
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BDA0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:09EEo
		dw 0			; memswap
		dd 27BC0h		; fileoff
		dw 4CEh			; codesize
		dw 3Ah			; relsize
		dw 7			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_99B7F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=27BC0h, codesize=4CEh, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6BDC0	proc far		; CODE XREF: Terrain_ComputeLODMesh+361P
		jmp	IndexedRecordReader_ScanAndReadTypedB_99B7F
VROOMM_StubThunk_6BDC0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_99AA0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=27BC0h, codesize=4CEh, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6BDC5	proc far		; DATA XREF: seg339:198Ao
		jmp	Terrain_ReleaseSectorAndTile_99AA0
VROOMM_StubThunk_6BDC5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_99CEF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=27BC0h, codesize=4CEh, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6BDCA	proc far		; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+1E9P
		jmp	Terrain_LoadHeightmapFromIFFB_99CEF
VROOMM_StubThunk_6BDCA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_99E7C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=27BC0h, codesize=4CEh, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6BDCF	proc far		; DATA XREF: Terrain_FormatAndReleaseReader_9B1FC+1Fo
		jmp	Terrain_ReleaseTileDescriptorB_99E7C
VROOMM_StubThunk_6BDCF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_99EBC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=27BC0h, codesize=4CEh, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6BDD4	proc far
		jmp	Terrain_Helper2_99EBC
VROOMM_StubThunk_6BDD4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_99ED5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=27BC0h, codesize=4CEh, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6BDD9	proc far		; CODE XREF: Terrain_ProcessTileThunks_9ADF0:loc_9AE23P
		jmp	Terrain_Helper3_99ED5
VROOMM_StubThunk_6BDD9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_99F1C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=27BC0h, codesize=4CEh, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6BDDE	proc far		; CODE XREF: Terrain_UpdateLODPerFrame+60P
		jmp	Terrain_Helper4_99F1C
VROOMM_StubThunk_6BDDE	endp

stub294		ends
