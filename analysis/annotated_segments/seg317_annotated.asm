seg317		segment	para public 'CODE' use16
		assume cs:seg317
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C6B0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0AF6o
		dw 0			; memswap
		dd 2F6C0h		; fileoff
		dw 83h			; codesize
		dw 0Ch			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1030) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F6C0h, codesize=83h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6C6D0	proc far		; CODE XREF: IFF_LoadModelMain+701P
		jmp	PlayerComponent_InitBaseClass_A1030
VROOMM_StubThunk_6C6D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1054) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F6C0h, codesize=83h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6C6D5	proc far		; DATA XREF: seg339:24B8o
		jmp	PlayerComponentVariantS_ConstructAndInit_A1054
VROOMM_StubThunk_6C6D5	endp

seg317		ends
