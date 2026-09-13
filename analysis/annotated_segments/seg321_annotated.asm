seg321		segment	para public 'CODE' use16
		assume cs:seg321
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C890	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0B16o
		dw 0			; memswap
		dd 31550h		; fileoff
		dw 1475h		; codesize
		dw 90h			; relsize
		dw 57			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2E95) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8B0	proc far
		jmp	GaugeWidget_GetNthListItem_A2E95
VROOMM_StubThunk_6C8B0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3000) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8B5	proc far
		jmp	GaugeWidget_AllocateListNode_A3000
VROOMM_StubThunk_6C8B5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A303D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8BA	proc far
		jmp	GaugeWidget_AllocateListNodeB_A303D
VROOMM_StubThunk_6C8BA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A306A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8BF	proc far
		jmp	GaugeWidget_ReleaseListNodeB_A306A
VROOMM_StubThunk_6C8BF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A30BF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8C4	proc far
		jmp	GaugeWidget_RemoveListNode_A30BF
VROOMM_StubThunk_6C8C4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2F1A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8C9	proc far
		jmp	GaugeWidget_Helper_A2F1A
VROOMM_StubThunk_6C8C9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2F79) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8CE	proc far
		jmp	GaugeWidget_HelperB_A2F79
VROOMM_StubThunk_6C8CE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2FAF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8D3	proc far
		jmp	GaugeWidget_HelperC_A2FAF
VROOMM_StubThunk_6C8D3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A312F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8D8	proc far
		jmp	GaugeWidget_InsertListNode_A312F
VROOMM_StubThunk_6C8D8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A30DF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8DD	proc far
		jmp	GaugeWidget_HelperD_A30DF
VROOMM_StubThunk_6C8DD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3108) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8E2	proc far
		jmp	GaugeWidget_HelperE_A3108
VROOMM_StubThunk_6C8E2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3277) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8E7	proc far		; DATA XREF: seg339:2E66o
					; seg339:off_6FF52o
		jmp	GaugeWidget_ComputeLayout_A3277
VROOMM_StubThunk_6C8E7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A32FD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8EC	proc far		; DATA XREF: seg339:off_6FF1Ao
					; seg339:off_6FF56o
		jmp	GaugeWidget_HelperF_A32FD
VROOMM_StubThunk_6C8EC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2ED3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8F1	proc far
		jmp	GaugeWidget_ReleaseListNode_A2ED3
VROOMM_StubThunk_6C8F1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A31A8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8F6	proc far
		jmp	GaugeWidget_InsertListNodeAtHead_A31A8
VROOMM_StubThunk_6C8F6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A31C9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C8FB	proc far
		jmp	GaugeWidget_InsertListNodeAtTail_A31C9
VROOMM_StubThunk_6C8FB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A31EA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C900	proc far		; DATA XREF: seg339:off_6FEFEo
					; seg339:off_6FF3Ao
		jmp	GaugeWidget_Method_SetField_A31EA
VROOMM_StubThunk_6C900	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3224) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C905	proc far		; DATA XREF: seg339:off_6FEF6o
					; seg339:off_6FF32o
		jmp	GaugeWidget_Method_ClearField_A3224
VROOMM_StubThunk_6C905	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A324D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C90A	proc far		; DATA XREF: seg339:off_6FEFAo
					; seg339:off_6FF36o
		jmp	GaugeWidget_Method_ToggleField_A324D
VROOMM_StubThunk_6C90A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2DF0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C90F	proc far
		jmp	GaugeWidget_Construct_A2DF0
VROOMM_StubThunk_6C90F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2E39) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C914	proc far		; DATA XREF: seg339:off_6FF62o
		jmp	GaugeWidget_Destruct_A2E39
VROOMM_StubThunk_6C914	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2E6C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C919	proc far
		jmp	GaugeWidget_GetFirstListItem_A2E6C
VROOMM_StubThunk_6C919	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3436) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C91E	proc far		; DATA XREF: seg339:off_6FF06o
					; seg339:off_6FF42o
		jmp	GaugeWidget_ComputeRange_A3436
VROOMM_StubThunk_6C91E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3354) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C923	proc far		; DATA XREF: seg339:off_6FF5Ao
		jmp	GaugeWidget_RebuildListFromRange_A3354
VROOMM_StubThunk_6C923	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3405) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C928	proc far		; DATA XREF: seg339:off_6FF4Ao
		jmp	GaugeWidget_UpdateWithLock_A3405
VROOMM_StubThunk_6C928	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3EA5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C92D	proc far
		jmp	GaugeWidget_RenderModeDispatch_A3EA5
VROOMM_StubThunk_6C92D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A40B0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C932	proc far
		jmp	GaugeWidget_RenderModeDispatch_A40B0
VROOMM_StubThunk_6C932	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A39FA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C937	proc far
		jmp	GaugeWidget_AllocateRenderBuffer_A39FA
VROOMM_StubThunk_6C937	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3A40) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C93C	proc far
		jmp	GaugeWidget_DrawFrameConditional_A3A40
VROOMM_StubThunk_6C93C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3A86) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C941	proc far
		jmp	GaugeWidget_ReleaseRenderBuffer_A3A86
VROOMM_StubThunk_6C941	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3ADD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C946	proc far		; CODE XREF: Input_CalibrationHandler+257P
					; Input_CalibrationHandler+310P ...
		jmp	GaugeWidget_AllocateExtra_A3ADD
VROOMM_StubThunk_6C946	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3B34) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C94B	proc far
		jmp	GaugeWidget_ReleaseExtra_A3B34
VROOMM_StubThunk_6C94B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3B93) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C950	proc far
		jmp	GaugeWidget_ReleaseExtraB_A3B93
VROOMM_StubThunk_6C950	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3BC2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C955	proc far
		jmp	GaugeWidget_HelperJ_A3BC2
VROOMM_StubThunk_6C955	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3BE6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C95A	proc far		; CODE XREF: Input_CalibrationHandler+245P
					; Input_CalibrationHandler+2FEP ...
		jmp	GaugeWidget_InsertAndAllocateExtra_A3BE6
VROOMM_StubThunk_6C95A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3490) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C95F	proc far
		jmp	GaugeWidget_ApplyTextStyle_A3490
VROOMM_StubThunk_6C95F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A34CA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C964	proc far
		jmp	GaugeWidgetVariantA_ConstructAndInit_A34CA
VROOMM_StubThunk_6C964	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A353F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C969	proc far		; CODE XREF: Input_CalibrationHandler+192P
					; ResourceFile_LoadTypeA_90097+1DAP ...
		jmp	GaugeWidgetVariantB_ConstructAndInit_A353F
VROOMM_StubThunk_6C969	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A35BA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C96E	proc far
		jmp	GaugeWidgetVariantC_ConstructAndInit_A35BA
VROOMM_StubThunk_6C96E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3644) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C973	proc far
		jmp	GaugeWidget_ComputeLayoutB_A3644
VROOMM_StubThunk_6C973	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A36BD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C978	proc far		; CODE XREF: Input_CalibrationHandler+43BP
					; ResourceFile_LoadTypeA_90097+880P ...
		jmp	GaugeWidget_RebuildAndRelease_A36BD
VROOMM_StubThunk_6C978	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A381A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C97D	proc far
		jmp	GaugeWidget_HelperH_A381A
VROOMM_StubThunk_6C97D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A387E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C982	proc far
		jmp	GaugeWidget_DrawFrame_A387E
VROOMM_StubThunk_6C982	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A396D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C987	proc far
		jmp	GaugeWidget_DrawFrameWrapper_A396D
VROOMM_StubThunk_6C987	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3AB5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C98C	proc far
		jmp	GaugeWidget_AllocateRenderBufferWrapper_A3AB5
VROOMM_StubThunk_6C98C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3991) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C991	proc far
		jmp	GaugeWidget_ApplyUnderLock_A3991
VROOMM_StubThunk_6C991	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A39B7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C996	proc far		; CODE XREF: Input_CalibrationHandler+32FP
					; ResourceFile_LoadTypeA_90097+786P ...
		jmp	GaugeWidget_QueryRenderState_A39B7
VROOMM_StubThunk_6C996	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A377D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C99B	proc far		; DATA XREF: seg339:off_6FF2Ao
		jmp	GaugeWidget_MeasureAndDraw_A377D
VROOMM_StubThunk_6C99B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3802) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C9A0	proc far		; DATA XREF: seg339:off_6FF2Eo
		jmp	GaugeWidget_HelperG_A3802
VROOMM_StubThunk_6C9A0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3C14) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C9A5	proc far		; DATA XREF: seg339:off_6FF0Eo
		jmp	GaugeWidget_UpdateWithLockWrapper_A3C14
VROOMM_StubThunk_6C9A5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3C85) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C9AA	proc far		; DATA XREF: seg339:off_6FF1Eo
		jmp	GaugeWidget_RebuildDisplay_A3C85
VROOMM_StubThunk_6C9AA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3844) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C9AF	proc far
		jmp	GaugeWidget_HelperI_A3844
VROOMM_StubThunk_6C9AF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3C2C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C9B4	proc far		; CODE XREF: Input_CalibrationHandler+37EP
					; ResourceFile_LoadTypeA_90097+791P ...
		jmp	GaugeWidget_QueryAndFormat_A3C2C
VROOMM_StubThunk_6C9B4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A3CF6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C9B9	proc far
		jmp	GaugeWidget_FormatDisplayValue_A3CF6
VROOMM_StubThunk_6C9B9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A39DC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C9BE	proc far		; CODE XREF: Input_CalibrationHandler+391P
					; ResourceFile_LoadTypeA_90097+839P ...
		jmp	GaugeWidget_DrawByMode_A39DC
VROOMM_StubThunk_6C9BE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A41FA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C9C3	proc far
		jmp	GaugeWidget_ReleaseExtraAndNode_A41FA
VROOMM_StubThunk_6C9C3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A421B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31550h, codesize=1475h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C9C8	proc far
		jmp	GaugeWidget_UpdateAndReleaseUnderLock_A421B
VROOMM_StubThunk_6C9C8	endp

seg321		ends
