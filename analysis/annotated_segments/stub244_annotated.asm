stub244		segment	para public 'CODE' use16
		assume cs:stub244
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6AF90	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:085Eo
		dw 0			; memswap
		dd 0FA60h		; fileoff
		dw 233Bh		; codesize
		dw 124h			; relsize
		dw 34			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_84E74) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFB0	proc far		; DATA XREF: seg339:off_6D7D3o
		jmp	HUDSymbol_ReleaseTwoRefsC_84E74
VROOMM_StubThunk_6AFB0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_84E39) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFB5	proc far		; DATA XREF: seg339:06FFo
		jmp	HUDSymbol_ReleaseSingleRefB_84E39
VROOMM_StubThunk_6AFB5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_84DF2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFBA	proc far		; DATA XREF: seg339:off_6D78Bo
		jmp	HUDSymbol_ReleaseTwoRefsB_84DF2
VROOMM_StubThunk_6AFBA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_82B80) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFBF	proc far
		jmp	HUDSymbol_ConstructVariantQ_82B80
VROOMM_StubThunk_6AFBF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_82CDC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFC4	proc far
		jmp	HUDSymbol_ConstructAndInitAngleB_82CDC
VROOMM_StubThunk_6AFC4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_82C2E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFC9	proc far		; CODE XREF: Kneeboard_RenderEntry+104P
		jmp	HUDSymbol_ConstructVariantC_82C2E
VROOMM_StubThunk_6AFC9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8349F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFCE	proc far		; DATA XREF: seg339:0717o
		jmp	HUDSymbol_Helper4_8349F
VROOMM_StubThunk_6AFCE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_834B8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFD3	proc far		; DATA XREF: seg339:off_6D7CFo
		jmp	HUDSymbol_ReleaseRefConditional_834B8
VROOMM_StubThunk_6AFD3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_82DEB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFD8	proc far		; DATA XREF: seg339:0727o
		jmp	HUDSymbol_RenderWithClipTestD_82DEB
VROOMM_StubThunk_6AFD8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_834D5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFDD	proc far		; CODE XREF: Radar_TargetTypeFilter+93P
		jmp	HUDSymbol_ComputeTransformB_834D5
VROOMM_StubThunk_6AFDD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_834AE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFE2	proc far		; DATA XREF: seg339:072Bo
		jmp	HUDSymbol_Helper5_834AE
VROOMM_StubThunk_6AFE2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_837BB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFE7	proc far
		jmp	HUDSymbol_ConstructVariantD_837BB
VROOMM_StubThunk_6AFE7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_838BF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFEC	proc far
		jmp	HUDSymbol_ConstructAndInitAngleC_838BF
VROOMM_StubThunk_6AFEC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8383D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFF1	proc far		; CODE XREF: Kneeboard_RenderEntry+E4P
		jmp	HUDSymbol_ConstructVariantE_8383D
VROOMM_StubThunk_6AFF1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_839CA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFF6	proc far		; DATA XREF: seg339:06F3o
		jmp	HUDSymbol_ConstructWithMatrix_839CA
VROOMM_StubThunk_6AFF6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_83A42) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6AFFB	proc far		; DATA XREF: seg339:0703o
		jmp	HUDSymbol_RenderMissileDirection_83A42
VROOMM_StubThunk_6AFFB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_83B7B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B000	proc far		; DATA XREF: seg339:0707o
		jmp	HUDSymbol_Helper6_83B7B
VROOMM_StubThunk_6B000	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_83B85) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B005	proc far		; DATA XREF: seg339:0713o
		jmp	HUDSymbol_RenderGraphWrapper_83B85
VROOMM_StubThunk_6B005	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8417C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B00A	proc far
		jmp	HUDSymbol_ComputeBearingDisplay_8417C
VROOMM_StubThunk_6B00A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_83BB1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B00F	proc far
		jmp	HUDSymbol_ConstructVariantF_83BB1
VROOMM_StubThunk_6B00F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_83CE9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B014	proc far
		jmp	HUDSymbol_ConstructAndInitAngleD_83CE9
VROOMM_StubThunk_6B014	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_83C4D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B019	proc far		; CODE XREF: Kneeboard_RenderEntry+124P
		jmp	HUDSymbol_ConstructVariantG_83C4D
VROOMM_StubThunk_6B019	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_84337) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B01E	proc far		; DATA XREF: seg339:06A2o
		jmp	HUDSymbol_Helper7_84337
VROOMM_StubThunk_6B01E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_843B5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B023	proc far		; DATA XREF: seg339:06B2o
		jmp	HUDSymbol_ProcessJoystickAndFilter_843B5
VROOMM_StubThunk_6B023	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_84749) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B028	proc far		; DATA XREF: seg339:06B6o
		jmp	HUDSymbol_Helper8_84749
VROOMM_StubThunk_6B028	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_83DD7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B02D	proc far
		jmp	HUDSymbol_ConstructWithFullMatrix_83DD7
VROOMM_StubThunk_6B02D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_83FC9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B032	proc far		; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+AAAP
		jmp	HUDSymbol_ComputeApproachDisplay_83FC9
VROOMM_StubThunk_6B032	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_84753) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B037	proc far
		jmp	HUDSymbol_ConstructVariantH_84753
VROOMM_StubThunk_6B037	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_84863) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B03C	proc far
		jmp	HUDSymbol_ConstructAndInitAngleE_84863
VROOMM_StubThunk_6B03C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_847DB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B041	proc far		; CODE XREF: Kneeboard_RenderEntry+144P
		jmp	HUDSymbol_ConstructVariantI_847DB
VROOMM_StubThunk_6B041	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8492E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B046	proc far		; DATA XREF: seg339:06CFo
		jmp	HUDSymbol_ConstructWithContainerOp_8492E
VROOMM_StubThunk_6B046	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_849B2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B04B	proc far		; DATA XREF: seg339:06DFo
		jmp	HUDSymbol_RenderWithClipTestE_849B2
VROOMM_StubThunk_6B04B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_84DD1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B050	proc far		; DATA XREF: seg339:off_6D793o
		jmp	HUDSymbol_Helper9_84DD1
VROOMM_StubThunk_6B050	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_84DDB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0FA60h, codesize=233Bh, nentries=34.
; ==============================================================================================
VROOMM_StubThunk_6B055	proc far		; DATA XREF: seg339:off_71E54o
		jmp	HUDSymbol_Helper10_84DDB
VROOMM_StubThunk_6B055	endp

stub244		ends
