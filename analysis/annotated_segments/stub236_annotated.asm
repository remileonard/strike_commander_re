stub236		segment	para public 'CODE' use16
		assume cs:stub236
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6ACF0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:081Eo
		dw 0			; memswap
		dd 7640h		; fileoff
		dw 17Ch			; codesize
		dw 0Ch			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7AAF0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7640h, codesize=17Ch, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6AD10	proc far		; CODE XREF: seg015:0723P
		jmp	Input_ReadMouseAndAxes_7AAF0
VROOMM_StubThunk_6AD10	endp

stub236		ends
