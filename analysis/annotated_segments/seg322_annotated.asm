seg322		segment	para public 'CODE' use16
		assume cs:seg322
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C9D0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0B1Eo
		dw 0			; memswap
		dd 32A70h		; fileoff
		dw 2FEh			; codesize
		dw 20h			; relsize
		dw 4			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4270) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32A70h, codesize=2FEh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C9F0	proc far		; CODE XREF: ResourceFile_LoadTypeA_90097+26BP
					; ResourceFile_LoadTypeA_90097+680P ...
		jmp	GaugeWidgetVariantD_ConstructAndInit_A4270
VROOMM_StubThunk_6C9F0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A44FA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32A70h, codesize=2FEh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C9F5	proc far		; DATA XREF: seg339:off_6FF96o
		jmp	GaugeWidget_ReleaseAllResources_A44FA
VROOMM_StubThunk_6C9F5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4388) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32A70h, codesize=2FEh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C9FA	proc far		; DATA XREF: seg339:off_6FF7Eo
		jmp	GaugeWidget_DrawWithLabel_A4388
VROOMM_StubThunk_6C9FA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A449F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32A70h, codesize=2FEh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C9FF	proc far		; DATA XREF: seg339:off_6FF92o
		jmp	GaugeWidget_HitTestEntries_A449F
VROOMM_StubThunk_6C9FF	endp

seg322		ends
