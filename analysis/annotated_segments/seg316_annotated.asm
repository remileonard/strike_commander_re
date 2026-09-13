seg316		segment	para public 'CODE' use16
		assume cs:seg316
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C680	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0AEEo
		dw 0			; memswap
		dd 2F630h		; fileoff
		dw 73h			; codesize
		dw 0Eh			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0FB0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F630h, codesize=73h, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6C6A0	proc far		; CODE XREF: IFF_LoadModelMain+8F3P
		jmp	PlayerComponent_LoadFieldsWithRetryD_A0FB0
VROOMM_StubThunk_6C6A0	endp

seg316		ends
