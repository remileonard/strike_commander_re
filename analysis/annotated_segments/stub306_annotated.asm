stub306		segment	para public 'CODE' use16
		assume cs:stub306
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C0C0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0A4Eo
		dw 0			; memswap
		dd 2AD00h		; fileoff
		dw 23Dh			; codesize
		dw 0Ah			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9C9A0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2AD00h, codesize=23Dh, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6C0E0	proc far		; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+35AP
		jmp	Debris_ComputeRandomizedForces_9C9A0
VROOMM_StubThunk_6C0E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9CB2C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2AD00h, codesize=23Dh, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6C0E5	proc far		; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+372P
		jmp	Debris_AllocateFamily_9CB2C
VROOMM_StubThunk_6C0E5	endp

stub306		ends
