stub237		segment	para public 'CODE' use16
		assume cs:stub237
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6AD20	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0826o
		dw 0			; memswap
		dd 77D0h		; fileoff
		dw 53h			; codesize
		dw 8			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7AC70) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=77D0h, codesize=53h, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6AD40	proc far
		jmp	Input_ReadJoystickButtons_7AC70
VROOMM_StubThunk_6AD40	endp

stub237		ends
