stub260		segment	para public 'CODE' use16
		assume cs:stub260
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B610	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:08DEo
		dw 0			; memswap
		dd 1B680h		; fileoff
		dw 58Fh			; codesize
		dw 48h			; relsize
		dw 4			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8DEC0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1B680h, codesize=58Fh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B630	proc far		; CODE XREF: seg010:03D6P seg010:048FP ...
		jmp	UIWidget_ReleaseWrapper_8DEC0
VROOMM_StubThunk_6B630	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8E2AF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1B680h, codesize=58Fh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B635	proc far
		jmp	AITargeting_AllocateWithErrorCheck_8E2AF
VROOMM_StubThunk_6B635	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8E351) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1B680h, codesize=58Fh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B63A	proc far		; CODE XREF: seg011:1215P seg098:0034P ...
		jmp	PilotProfile_LoadFromPROF_VersionGate_8E351
VROOMM_StubThunk_6B63A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8DF49) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1B680h, codesize=58Fh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B63F	proc far		; CODE XREF: seg010:0656P
					; DATA XREF: seg339:038Co
		jmp	PilotProfile_LoadRADI_8DF49
VROOMM_StubThunk_6B63F	endp

stub260		ends
