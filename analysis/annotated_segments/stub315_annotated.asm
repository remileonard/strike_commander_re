stub315		segment	para public 'CODE' use16
		assume cs:stub315
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C2A0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A876o
		dw 0			; memswap
		dd 2BBB0h		; fileoff
		dw 19Fh			; codesize
		dw 14h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D770) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2BBB0h, codesize=19Fh, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6C2C0	proc far		; DATA XREF: seg339:24D4o
		jmp	Debris_SpawnOrchestratorVariant_9D770
VROOMM_StubThunk_6C2C0	endp

stub315		ends
