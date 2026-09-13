stub248		segment	para public 'CODE' use16
		assume cs:stub248
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B190	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A65Eo
		dw 0			; memswap
		dd 132E0h		; fileoff
		dw 7D3h			; codesize
		dw 3Ch			; relsize
		dw 5			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_862A5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=132E0h, codesize=7D3h, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6B1B0	proc far		; DATA XREF: seg339:07E8o
		jmp	AITargeting_ComputeFullSolution_862A5
VROOMM_StubThunk_6B1B0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_861E0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=132E0h, codesize=7D3h, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6B1B5	proc far		; DATA XREF: seg339:07F0o
		jmp	Camera_UpdateAndNotifyB_861E0
VROOMM_StubThunk_6B1B5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8693E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=132E0h, codesize=7D3h, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6B1BA	proc far		; DATA XREF: seg339:07ECo
		jmp	AITargeting_Helper3_8693E
VROOMM_StubThunk_6B1BA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_86948) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=132E0h, codesize=7D3h, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6B1BF	proc far		; DATA XREF: seg339:07CCo
		jmp	AITargeting_Helper4_86948
VROOMM_StubThunk_6B1BF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_86965) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=132E0h, codesize=7D3h, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6B1C4	proc far		; DATA XREF: seg339:07D0o
		jmp	HUDSymbol_BlitOverlapRegion_86965
VROOMM_StubThunk_6B1C4	endp

stub248		ends
