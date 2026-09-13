stub293		segment	para public 'CODE' use16
		assume cs:stub293
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BD70	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:09E6o
		dw 0			; memswap
		dd 27B10h		; fileoff
		dw 0A2h			; codesize
		dw 2			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_999F0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=27B10h, codesize=0A2h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6BD90	proc far		; CODE XREF: Terrain_ProcessTileThunks_9ADF0+5CP
		jmp	Terrain_Helper_999F0
VROOMM_StubThunk_6BD90	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_99A76) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=27B10h, codesize=0A2h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6BD95	proc far		; CODE XREF: Terrain_ProcessTileThunksB_9AE6C+39P
		jmp	Terrain_ReleaseFree_99A76
VROOMM_StubThunk_6BD95	endp

stub293		ends
