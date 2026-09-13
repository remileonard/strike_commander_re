stub257		segment	para public 'CODE' use16
		assume cs:stub257
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B520	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:08C6o
		dw 0			; memswap
		dd 1A780h		; fileoff
		dw 16Bh			; codesize
		dw 18h			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D1C0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A780h, codesize=16Bh, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6B540	proc far		; DATA XREF: seg339:0DAEo
		jmp	MissionRecordField_ReleaseViaThunkB_8D1C0
VROOMM_StubThunk_6B540	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D0A0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A780h, codesize=16Bh, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6B545	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+1AEP
		jmp	MissionRecord_LoadFieldGroupMixE_8D0A0
VROOMM_StubThunk_6B545	endp

stub257		ends
