stub238		segment	para public 'CODE' use16
		assume cs:stub238
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6AD50	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A60Eo
		dw 0			; memswap
		dd 7830h		; fileoff
		dw 20Bh			; codesize
		dw 0Eh			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7ACD0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7830h, codesize=20Bh, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6AD70	proc far		; CODE XREF: seg015:073BP
		jmp	Input_ReadJoystickButtonsExtended_7ACD0
VROOMM_StubThunk_6AD70	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7ADFC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7830h, codesize=20Bh, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6AD75	proc far		; CODE XREF: seg015:0747P
		jmp	Input_ReadJoystickAxisMax_7ADFC
VROOMM_StubThunk_6AD75	endp

stub238		ends
