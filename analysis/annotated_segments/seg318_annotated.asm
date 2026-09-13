seg318		segment	para public 'CODE' use16
		assume cs:seg318
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C6E0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A8DEo
		dw 0			; memswap
		dd 2F750h		; fileoff
		dw 172h			; codesize
		dw 16h			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A10C0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F750h, codesize=172h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6C700	proc far		; CODE XREF: GaugeWidget_RenderModeDispatch_A3EA5+1EEP
		jmp	SaveGame_WriteFile_A10C0
VROOMM_StubThunk_6C700	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1173) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F750h, codesize=172h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6C705	proc far		; CODE XREF: GaugeWidget_RenderModeDispatch_A40B0+11AP
		jmp	SaveGame_ReadFile_A1173
VROOMM_StubThunk_6C705	endp

seg318		ends
