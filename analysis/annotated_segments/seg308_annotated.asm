seg308		segment	para public 'CODE' use16
		assume cs:seg308
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C330	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0AAEo
		dw 0			; memswap
		dd 2C2D0h		; fileoff
		dw 8			; codesize
		dw 0			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9DE50) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2D0h, codesize=8, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6C350	proc far		; DATA XREF: seg339:27D8o
		jmp	TimedTrigger_PassThroughArg_9DE50
VROOMM_StubThunk_6C350	endp

seg308		ends
