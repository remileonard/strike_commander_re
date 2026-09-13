seg307		segment	para public 'CODE' use16
		assume cs:seg307
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C300	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A886o
		dw 0			; memswap
		dd 2C1B0h		; fileoff
		dw 114h			; codesize
		dw 4			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9DD30) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C1B0h, codesize=114h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6C320	proc far
		jmp	TimedTrigger_NotifySingleListener_9DD30
VROOMM_StubThunk_6C320	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9DD81) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C1B0h, codesize=114h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6C325	proc far		; CODE XREF: Camera_ConstructWithHandle_9D610:loc_9D760P
		jmp	TimedTrigger_NotifyConditional_9DD81
VROOMM_StubThunk_6C325	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9DDCF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C1B0h, codesize=114h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6C32A	proc far		; CODE XREF: Camera_ConstructWithHandle_9D610+143P
		jmp	TimedTrigger_ReleaseIfInactive_9DDCF
VROOMM_StubThunk_6C32A	endp

seg307		ends
