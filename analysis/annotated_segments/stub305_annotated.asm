stub305		segment	para public 'CODE' use16
		assume cs:stub305
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C090	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0A46o
		dw 0			; memswap
		dd 2AC90h		; fileoff
		dw 5Bh			; codesize
		dw 0			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9C940) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2AC90h, codesize=5Bh, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6C0B0	proc far		; DATA XREF: seg339:off_6F4B4o
		jmp	Debris_Helper5_9C940
VROOMM_StubThunk_6C0B0	endp

stub305		ends
