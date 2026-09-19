stub240		segment	para public 'CODE' use16
		assume cs:stub240
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6ADD0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A61Eo
		dw 0			; memswap
		dd 9F80h		; fileoff
		dw 0B74h		; codesize
		dw 76h			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7DE55) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=9F80h, codesize=0B74h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6ADF0	proc far		; DATA XREF: seg339:0515o
		jmp	MissionRecord_ReleaseEntryC_7DE55
VROOMM_StubThunk_6ADF0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7D310) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=9F80h, codesize=0B74h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6ADF5	proc far		; DATA XREF: seg339:051Do
		jmp	MissionRecord_Helper2_7D310
VROOMM_StubThunk_6ADF5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7D31A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=9F80h, codesize=0B74h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6ADFA	proc far		; CODE XREF: STRIKE_EXE_MAIN_LOOP+7BP
		jmp	MissionRecord_LoadAndBuildWidgetTree_7D31A
VROOMM_StubThunk_6ADFA	endp

stub240		ends
