stub298		segment	para public 'CODE' use16
		assume cs:stub298
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BEB0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0A0Eo
		dw 0			; memswap
		dd 28F70h		; fileoff
		dw 65h			; codesize
		dw 2			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9AD80) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28F70h, codesize=65h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6BED0	proc far		; CODE XREF: Terrain_ProcessTileThunks_9ADF0+70P
		jmp	Terrain_Helper6_9AD80
VROOMM_StubThunk_6BED0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9ADC9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=28F70h, codesize=65h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6BED5	proc far		; CODE XREF: Terrain_ProcessTileThunksB_9AE6C:loc_9AE95P
		jmp	Terrain_ReleaseFreeB_9ADC9
VROOMM_StubThunk_6BED5	endp

stub298		ends
