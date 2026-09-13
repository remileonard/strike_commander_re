stub296		segment	para public 'CODE' use16
		assume cs:stub296
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BE50	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A7DEo
		dw 0			; memswap
		dd 28AA0h		; fileoff
		dw 31Fh			; codesize
		dw 2Ch			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9A8F0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28AA0h, codesize=31Fh, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BE70	proc far
		jmp	TerrainTile_Allocate_9A8F0
VROOMM_StubThunk_6BE70	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9A95A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28AA0h, codesize=31Fh, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BE75	proc far		; CODE XREF: Picking_ComputeMain+2F9P
		jmp	TerrainSector_LoadIndexedRecord_9A95A
VROOMM_StubThunk_6BE75	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9A925) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28AA0h, codesize=31Fh, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BE7A	proc far		; DATA XREF: seg339:off_6EB32o
		jmp	TerrainTile_ReleaseSimple_9A925
VROOMM_StubThunk_6BE7A	endp

stub296		ends
