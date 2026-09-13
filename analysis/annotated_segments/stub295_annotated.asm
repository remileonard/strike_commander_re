stub295		segment	para public 'CODE' use16
		assume cs:stub295
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BDF0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:09F6o
		dw 0			; memswap
		dd 280D0h		; fileoff
		dw 973h			; codesize
		dw 54h			; relsize
		dw 11			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9A8BE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=280D0h, codesize=973h, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6BE10	proc far		; DATA XREF: TerrainSector_ParseTriple_9A844+1Fo
					; TerrainSector_ParseTriple_9A844+38o
		jmp	TerrainSector_AllocateExtendedB_9A8BE
VROOMM_StubThunk_6BE10	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9A899) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=280D0h, codesize=973h, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6BE15	proc far		; DATA XREF: TerrainSector_ParseTriple_9A844+6o
		jmp	TerrainSector_AllocateExtended_9A899
VROOMM_StubThunk_6BE15	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_99FF4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=280D0h, codesize=973h, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6BE1A	proc far		; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+27BP
		jmp	TerrainSector_LoadFieldMix_99FF4
VROOMM_StubThunk_6BE1A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9A566) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=280D0h, codesize=973h, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6BE1F	proc far
		jmp	TerrainSector_AllocateArray_9A566
VROOMM_StubThunk_6BE1F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9A215) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=280D0h, codesize=973h, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6BE24	proc far		; CODE XREF: Terrain_Helper3_99ED5:loc_99F10P
		jmp	TerrainSector_AllocateMultiBuffer_9A215
VROOMM_StubThunk_6BE24	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9A4A3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=280D0h, codesize=973h, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6BE29	proc far		; CODE XREF: Terrain_ProcessTileThunksB_9AE6C+49P
		jmp	TerrainSector_ReleaseDouble_9A4A3
VROOMM_StubThunk_6BE29	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9A467) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=280D0h, codesize=973h, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6BE2E	proc far
		jmp	TerrainSector_ReleaseTriple_9A467
VROOMM_StubThunk_6BE2E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9A540) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=280D0h, codesize=973h, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6BE33	proc far		; CODE XREF: Terrain_NotifyAdjacentPatches+25P
					; Terrain_Helper4_99F1C:loc_99F62P
		jmp	TerrainSector_Helper2_9A540
VROOMM_StubThunk_6BE33	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_99F70) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=280D0h, codesize=973h, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6BE38	proc far
		jmp	TextRenderer_LookupAndClear_99F70
VROOMM_StubThunk_6BE38	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_99FA1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=280D0h, codesize=973h, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6BE3D	proc far
		jmp	TerrainSector_Helper_99FA1
VROOMM_StubThunk_6BE3D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9A844) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=280D0h, codesize=973h, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6BE42	proc far		; DATA XREF: seg339:off_71EBAo
		jmp	TerrainSector_ParseTriple_9A844
VROOMM_StubThunk_6BE42	endp

stub295		ends
