stub235		segment	para public 'CODE' use16
		assume cs:stub235
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6ACC0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0816o
		dw 0			; memswap
		dd 7530h		; fileoff
		dw 108h			; codesize
		dw 2			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7A9E0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7530h, codesize=108h, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6ACE0	proc far		; CODE XREF: seg015:072FP
		jmp	Input_ProcessFrame_7A9E0
VROOMM_StubThunk_6ACE0	endp

stub235		ends
