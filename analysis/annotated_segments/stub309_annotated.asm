stub309		segment	para public 'CODE' use16
		assume cs:stub309
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C170	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0A66o
		dw 0			; memswap
		dd 2B3C0h		; fileoff
		dw 9Ch			; codesize
		dw 0Ch			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D020) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B3C0h, codesize=9Ch, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6C190	proc far		; DATA XREF: seg339:25ACo seg339:2638o ...
		jmp	WorldObject_ApplyOrientationAndFilter_9D020
VROOMM_StubThunk_6C190	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D095) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B3C0h, codesize=9Ch, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6C195	proc far		; DATA XREF: seg339:off_6F660o
					; seg339:263Co	...
		jmp	AI_ComputeGeometryWrapper_9D095
VROOMM_StubThunk_6C195	endp

stub309		ends
