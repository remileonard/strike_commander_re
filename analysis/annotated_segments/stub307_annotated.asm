stub307		segment	para public 'CODE' use16
		assume cs:stub307
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C0F0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0A56o
		dw 0			; memswap
		dd 2AF50h		; fileoff
		dw 2A2h			; codesize
		dw 1Eh			; relsize
		dw 7			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9CBE0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2AF50h, codesize=2A2h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6C110	proc far
		jmp	Debris_LoadStringFields_9CBE0
VROOMM_StubThunk_6C110	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9CC2B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2AF50h, codesize=2A2h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6C115	proc far
		jmp	Debris_Helper6_9CC2B
VROOMM_StubThunk_6C115	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9CCE5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2AF50h, codesize=2A2h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6C11A	proc far
		jmp	Debris_LoadSubrecordWithRelease_9CCE5
VROOMM_StubThunk_6C11A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9CD97) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2AF50h, codesize=2A2h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6C11F	proc far
		jmp	Debris_ReleaseWrapperB_9CD97
VROOMM_StubThunk_6C11F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9CE33) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2AF50h, codesize=2A2h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6C124	proc far		; CODE XREF: Camera_ConstructWithHandle_9D610+128P
		jmp	Debris_ReleaseWrapperD_9CE33
VROOMM_StubThunk_6C124	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9CE11) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2AF50h, codesize=2A2h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6C129	proc far
		jmp	Debris_ReleaseWrapperC_9CE11
VROOMM_StubThunk_6C129	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9CCB3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2AF50h, codesize=2A2h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6C12E	proc far		; CODE XREF: MissionRecord_LoadStringFields_9D4F0+1FP
		jmp	Debris_ReleaseWrapper_9CCB3
VROOMM_StubThunk_6C12E	endp

stub307		ends
