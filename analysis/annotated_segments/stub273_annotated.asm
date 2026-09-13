stub273		segment	para public 'CODE' use16
		assume cs:stub273
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B920	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A726o
		dw 0			; memswap
		dd 23110h		; fileoff
		dw 2B3h			; codesize
		dw 20h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_952D0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=23110h, codesize=2B3h, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6B940	proc far		; CODE XREF: MissionText_ReleaseSubrecordA_94BF0+36P
		jmp	AircraftComponent_LoadWithDwordFieldsB_952D0
VROOMM_StubThunk_6B940	endp

stub273		ends
