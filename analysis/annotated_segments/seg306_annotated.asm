seg306		segment	para public 'CODE' use16
		assume cs:seg306
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C2D0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0A9Eo
		dw 0			; memswap
		dd 2BD70h		; fileoff
		dw 41Eh			; codesize
		dw 20h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D910) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2BD70h, codesize=41Eh, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6C2F0	proc far		; DATA XREF: seg339:off_6F588o
		jmp	Gauge_ComputeAndRenderNeedle_9D910
VROOMM_StubThunk_6C2F0	endp

seg306		ends
