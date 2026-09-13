stub279		segment	para public 'CODE' use16
		assume cs:stub279
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BA40	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0976o
		dw 0			; memswap
		dd 241D0h		; fileoff
		dw 185h			; codesize
		dw 12h			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_962E0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=241D0h, codesize=185h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6BA60	proc far		; CODE XREF: PlayerComponent_LoadAndComputeRange_A6900+B2P
		jmp	AircraftComponent_Helper_962E0
VROOMM_StubThunk_6BA60	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_96321) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=241D0h, codesize=185h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6BA65	proc far		; CODE XREF: MissionText_LoadSubtitleRecordB_94710+CFP
					; PlayerComponent_LoadAndComputeRange_A6900+EFP
		jmp	AircraftComponent_LoadMixedFieldsB_96321
VROOMM_StubThunk_6BA65	endp

stub279		ends
