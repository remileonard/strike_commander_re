stub274		segment	para public 'CODE' use16
		assume cs:stub274
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B950	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:094Eo
		dw 0			; memswap
		dd 233F0h		; fileoff
		dw 262h			; codesize
		dw 1Eh			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_95590) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=233F0h, codesize=262h, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6B970	proc far		; CODE XREF: MissionText_ReleaseSubrecordB_94C38:loc_94C6EP
		jmp	AircraftComponent_LoadWithDwordFieldsC_95590
VROOMM_StubThunk_6B970	endp

stub274		ends
