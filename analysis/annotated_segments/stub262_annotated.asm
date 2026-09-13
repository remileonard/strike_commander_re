stub262		segment	para public 'CODE' use16
		assume cs:stub262
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B680	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:08EEo
		dw 0			; memswap
		dd 1BF90h		; fileoff
		dw 119h			; codesize
		dw 1Eh			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8E740) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1BF90h, codesize=119h, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6B6A0	proc far		; CODE XREF: MissionText_LoadSubtitleRecord_87A60+2ECP
		jmp	AITargeting_LoadCalibrationRecordC_8E740
VROOMM_StubThunk_6B6A0	endp

stub262		ends
