stub308		segment	para public 'CODE' use16
		assume cs:stub308
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C140	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0A5Eo
		dw 0			; memswap
		dd 2B220h		; fileoff
		dw 18Ah			; codesize
		dw 10h			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9CE90) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B220h, codesize=18Ah, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6C160	proc far
		jmp	Debris_ReleaseWithErrorCheck_9CE90
VROOMM_StubThunk_6C160	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9CF55) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B220h, codesize=18Ah, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6C165	proc far		; CODE XREF: Camera_Helper_9D286+3CP
		jmp	Debris_ReleaseWithErrorCheckB_9CF55
VROOMM_StubThunk_6C165	endp

stub308		ends
