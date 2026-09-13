stub292		segment	para public 'CODE' use16
		assume cs:stub292
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BD40	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:09DEo
		dw 0			; memswap
		dd 27750h		; fileoff
		dw 39Ch			; codesize
		dw 16h			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_99650) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=27750h, codesize=39Ch, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BD60	proc far		; CODE XREF: Terrain_ClearTileList_9B161+92P
		jmp	Terrain_AllocateSectorBuffers_99650
VROOMM_StubThunk_6BD60	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_998C0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=27750h, codesize=39Ch, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BD65	proc far		; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+241P
		jmp	Terrain_LoadATRIChunk_998C0
VROOMM_StubThunk_6BD65	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_999C1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=27750h, codesize=39Ch, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BD6A	proc far		; CODE XREF: Terrain_FormatAndReleaseReader_9B1FC+B3P
		jmp	Terrain_ReleaseTileDescriptor_999C1
VROOMM_StubThunk_6BD6A	endp

stub292		ends
