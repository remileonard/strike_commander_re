stub261		segment	para public 'CODE' use16
		assume cs:stub261
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B650	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:08E6o
		dw 0			; memswap
		dd 1BC60h		; fileoff
		dw 2E2h			; codesize
		dw 46h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8E450) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1BC60h, codesize=2E2h, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6B670	proc far		; CODE XREF: MissionText_LoadSubtitleRecord_87A60+E2P
		jmp	AITargeting_LoadCalibrationRecordB_8E450
VROOMM_StubThunk_6B670	endp

stub261		ends
