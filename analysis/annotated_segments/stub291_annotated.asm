stub291		segment	para public 'CODE' use16
		assume cs:stub291
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BD10	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:09D6o
		dw 0			; memswap
		dd 27200h		; fileoff
		dw 526h			; codesize
		dw 2Ah			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_99120) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=27200h, codesize=526h, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6BD30	proc far		; CODE XREF: Model_RenderMain+3D9P
		jmp	TRI_ParseOverlayGeometry_99120
VROOMM_StubThunk_6BD30	endp

stub291		ends
