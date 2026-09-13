stub285		segment	para public 'CODE' use16
		assume cs:stub285
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BB60	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:09A6o
		dw 0			; memswap
		dd 25100h		; fileoff
		dw 1C5h			; codesize
		dw 1Ah			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_971C4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25100h, codesize=1C5h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BB80	proc far
		jmp	AircraftComponent_LoadMixedFieldsC_971C4
VROOMM_StubThunk_6BB80	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97215) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25100h, codesize=1C5h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BB85	proc far
		jmp	AircraftComponent_LoadWithDwordFieldsD_97215
VROOMM_StubThunk_6BB85	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_971A0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25100h, codesize=1C5h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BB8A	proc far		; CODE XREF: MissionText_LoadSubtitleRecordB_94710+14DP
					; MissionText_LoadSubtitleRecordB_94710+1CBP ...
		jmp	AircraftComponent_Helper2_971A0
VROOMM_StubThunk_6BB8A	endp

stub285		ends
