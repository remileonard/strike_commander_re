stub246		segment	para public 'CODE' use16
		assume cs:stub246
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B0B0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:086Eo
		dw 0			; memswap
		dd 123D0h		; fileoff
		dw 0AF1h		; codesize
		dw 0AAh			; relsize
		dw 21			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85E66) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B0D0	proc far		; DATA XREF: seg339:07A8o
		jmp	HUDSymbol_ReleaseSingleRefD_85E66
VROOMM_StubThunk_6B0D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85E2B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B0D5	proc far		; DATA XREF: seg339:0784o
		jmp	HUDSymbol_ReleaseSingleRefC_85E2B
VROOMM_StubThunk_6B0D5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85DF5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B0DA	proc far		; DATA XREF: seg339:off_6D810o
		jmp	HUDSymbol_ReleaseListEntryB_85DF5
VROOMM_StubThunk_6B0DA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85DCA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B0DF	proc far		; DATA XREF: seg339:075Co
		jmp	HUDSymbol_ReleaseListEntry_85DCA
VROOMM_StubThunk_6B0DF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85DC2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B0E4	proc far		; DATA XREF: seg339:0740o seg339:0750o ...
		jmp	HUDSymbol_Helper15_85DC2
VROOMM_StubThunk_6B0E4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85DB3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B0E9	proc far		; DATA XREF: seg339:073Co seg339:074Co ...
		jmp	UI_PositionListLabelsWrapper_85DB3
VROOMM_StubThunk_6B0E9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_853B0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B0EE	proc far		; CODE XREF: HUDSymbol_ConstructAndInitAngle_80701+B1P
					; HUDSymbol_ConstructAndInitAngleB_82CDC+B1P ...
		jmp	HUDSymbol_Helper14_853B0
VROOMM_StubThunk_6B0EE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_853FF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B0F3	proc far
		jmp	HUDSymbol_ConstructVariantJ_853FF
VROOMM_StubThunk_6B0F3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_854F9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B0F8	proc far
		jmp	HUDSymbol_ConstructAndInitAngleF_854F9
VROOMM_StubThunk_6B0F8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8547C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B0FD	proc far		; CODE XREF: Kneeboard_RenderEntry+A2P
		jmp	HUDSymbol_ConstructVariantK_8547C
VROOMM_StubThunk_6B0FD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_855E1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B102	proc far		; CODE XREF: HUDSymbol_Helper7_84337+BP
					; DATA XREF: seg339:067Eo
		jmp	HUDSymbol_ConstructWithContainerOpB_855E1
VROOMM_StubThunk_6B102	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85639) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B107	proc far		; CODE XREF: HUDSymbol_ReleaseRefConditional_834B8+8P
					; DATA XREF: seg339:off_6D712o	...
		jmp	HUDSymbol_ReleaseRefConditionalB_85639
VROOMM_StubThunk_6B107	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85656) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B10C	proc far
		jmp	HUDSymbol_ConstructVariantL_85656
VROOMM_StubThunk_6B10C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85790) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B111	proc far
		jmp	HUDSymbol_ConstructAndInitAngleG_85790
VROOMM_StubThunk_6B111	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_856F3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B116	proc far		; CODE XREF: Kneeboard_RenderEntry+C3P
		jmp	Cinematic_CamEntryConstruct_CHAS_856F3
VROOMM_StubThunk_6B116	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85878) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B11B	proc far		; DATA XREF: seg339:079Co
		jmp	Camera_OrbitReset_85878
VROOMM_StubThunk_6B11B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_859C7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B120	proc far		; CODE XREF: Cinematic_LoadCameraDef+109P
		jmp	Cinematic_CamEntryConstruct_CKPT_859C7
VROOMM_StubThunk_6B120	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85ACB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B125	proc far
		jmp	TextScrollDisplay_FormatAndCache_85ACB
VROOMM_StubThunk_6B125	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85A49) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B12A	proc far
		jmp	HUDSymbol_ConstructVariantO_85A49
VROOMM_StubThunk_6B12A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85D22) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B12F	proc far		; DATA XREF: seg339:0778o
		jmp	HUDSymbol_ConstructWithContainerOpC_85D22
VROOMM_StubThunk_6B12F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85D95) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=123D0h, codesize=0AF1h, nentries=21.
; ==============================================================================================
VROOMM_StubThunk_6B134	proc far		; DATA XREF: seg339:077Co
		jmp	Video_InitShakeEffect_85D95
VROOMM_StubThunk_6B134	endp

stub246		ends
