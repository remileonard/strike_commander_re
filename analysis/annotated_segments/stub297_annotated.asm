stub297		segment	para public 'CODE' use16
		assume cs:stub297
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BE80	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A7E6o
		dw 0			; memswap
		dd 28DF0h		; fileoff
		dw 16Ch			; codesize
		dw 10h			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9AC10) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28DF0h, codesize=16Ch, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BEA0	proc far		; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+256P
		jmp	Terrain_LoadHeightmapFromIFFC_9AC10
VROOMM_StubThunk_6BEA0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9AD0A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28DF0h, codesize=16Ch, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BEA5	proc far		; CODE XREF: Terrain_ClearTileList_9B161+50P
		jmp	Terrain_Helper5_9AD0A
VROOMM_StubThunk_6BEA5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9AD36) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28DF0h, codesize=16Ch, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BEAA	proc far		; CODE XREF: Terrain_FormatAndReleaseReader_9B1FC+A3P
		jmp	Terrain_ReleaseTileDescriptorC_9AD36
VROOMM_StubThunk_6BEAA	endp

stub297		ends
