stub313		segment	para public 'CODE' use16
		assume cs:stub313
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C240	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A866o
		dw 0			; memswap
		dd 2B8F0h		; fileoff
		dw 11Fh			; codesize
		dw 1Ch			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D4F0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B8F0h, codesize=11Fh, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6C260	proc far		; CODE XREF: IFF_LoadModelMain+677P
		jmp	MissionRecord_LoadStringFields_9D4F0
VROOMM_StubThunk_6C260	endp

stub313		ends
