stub312		segment	para public 'CODE' use16
		assume cs:stub312
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C210	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A85Eo
		dw 0			; memswap
		dd 2B890h		; fileoff
		dw 58h			; codesize
		dw 4			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D490) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B890h, codesize=58h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6C230	proc far
		jmp	Camera_Helper3_9D490
VROOMM_StubThunk_6C230	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D4B5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B890h, codesize=58h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6C235	proc far		; CODE XREF: Camera_ConstructWithHandle_9D610:loc_9D690P
		jmp	Camera_InitAndGetHandleWrapper_9D4B5
VROOMM_StubThunk_6C235	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D4D2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B890h, codesize=58h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6C23A	proc far		; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+195P
		jmp	Camera_Helper4_9D4D2
VROOMM_StubThunk_6C23A	endp

stub312		ends
