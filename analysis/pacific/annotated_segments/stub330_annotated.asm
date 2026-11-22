stub330		segment	para public 'CODE' use16
		assume cs:stub330
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74BC0	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 3A000h		; fileoff
		dw 14AEh		; codesize
		dw 96h		; relsize
		dw 39h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74BE0	proc far
		jmp	GaugeWidget_GetNthListItem_B52F9
sub_74BE0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74BE5	proc far
		jmp	GaugeWidget_AllocateListNode_B547D
sub_74BE5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74BEA	proc far
		jmp	GaugeWidget_AllocateListNodeB_B54BA
sub_74BEA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74BEF	proc far
		jmp	GaugeWidget_ReleaseListNodeB_B54E7
sub_74BEF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74BF4	proc far
		jmp	GaugeWidget_RemoveListNode_B553C
sub_74BF4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74BF9	proc far
		jmp	GaugeWidget_Helper_B5397
sub_74BF9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74BFE	proc far
		jmp	GaugeWidget_HelperB_B53F6
sub_74BFE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C03	proc far
		jmp	GaugeWidget_HelperC_B542C
sub_74C03	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C08	proc far
		jmp	GaugeWidget_InsertListNode_B55AC
sub_74C08	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C0D	proc far
		jmp	GaugeWidget_HelperD_B555C
sub_74C0D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C12	proc far
		jmp	GaugeWidget_HelperE_B5585
sub_74C12	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C17	proc far
		jmp	GaugeWidget_ComputeLayout_B56F4
sub_74C17	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C1C	proc far
		jmp	sub_B577A
sub_74C1C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C21	proc far
		jmp	sub_B5337
sub_74C21	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C26	proc far
		jmp	GaugeWidget_InsertListNodeAtHead_B5625
sub_74C26	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C2B	proc far
		jmp	GaugeWidget_InsertListNodeAtTail_B5646
sub_74C2B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C30	proc far
		jmp	GaugeWidget_Method_SetField_B5667
sub_74C30	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C35	proc far
		jmp	GaugeWidget_Method_ClearField_B56A1
sub_74C35	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C3A	proc far
		jmp	GaugeWidget_Method_ToggleField_B56CA
sub_74C3A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C3F	proc far
		jmp	sub_B5250
sub_74C3F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C44	proc far
		jmp	GaugeWidget_Destruct_B529D
sub_74C44	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C49	proc far
		jmp	GaugeWidget_GetFirstListItem_B52D0
sub_74C49	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C4E	proc far
		jmp	GaugeWidget_ComputeRange_B58BD
sub_74C4E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C53	proc far
		jmp	GaugeWidget_RebuildListFromRange_B57DB
sub_74C53	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C58	proc far
		jmp	GaugeWidget_UpdateWithLock_B588C
sub_74C58	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C5D	proc far
		jmp	GaugeWidget_RenderModeDispatch_B633E
sub_74C5D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C62	proc far
		jmp	GaugeWidget_RenderModeDispatch_B6549
sub_74C62	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C67	proc far
		jmp	GaugeWidget_AllocateRenderBuffer_B5E88
sub_74C67	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C6C	proc far
		jmp	GaugeWidget_DrawFrameConditional_B5ECE
sub_74C6C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C71	proc far
		jmp	sub_B5F14
sub_74C71	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C76	proc far
		jmp	GaugeWidget_AllocateExtra_B5F6B
sub_74C76	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C7B	proc far
		jmp	GaugeWidget_ReleaseExtra_B5FC2
sub_74C7B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C80	proc far
		jmp	sub_B6021
sub_74C80	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C85	proc far
		jmp	GaugeWidget_HelperJ_B6050
sub_74C85	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C8A	proc far
		jmp	sub_B6074
sub_74C8A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C8F	proc far
		jmp	GaugeWidget_ApplyTextStyle_B5917
sub_74C8F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C94	proc far
		jmp	GaugeWidgetVariantA_ConstructAndInit_B5951
sub_74C94	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C99	proc far
		jmp	GaugeWidgetVariantB_ConstructAndInit_B59C6
sub_74C99	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74C9E	proc far
		jmp	GaugeWidgetVariantC_ConstructAndInit_B5A41
sub_74C9E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CA3	proc far
		jmp	GaugeWidget_ComputeLayoutB_B5ACB
sub_74CA3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CA8	proc far
		jmp	GaugeWidget_RebuildAndRelease_B5B44
sub_74CA8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CAD	proc far
		jmp	GaugeWidget_HelperH_B5CA1
sub_74CAD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CB2	proc far
		jmp	GaugeWidget_DrawFrame_B5D05
sub_74CB2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CB7	proc far
		jmp	GaugeWidget_DrawFrameWrapper_B5DF4
sub_74CB7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CBC	proc far
		jmp	GaugeWidget_AllocateRenderBufferWrapper_B5F43
sub_74CBC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CC1	proc far
		jmp	GaugeWidget_ApplyUnderLock_B5E18
sub_74CC1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CC6	proc far
		jmp	GaugeWidget_QueryRenderState_B5E3E
sub_74CC6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CCB	proc far
		jmp	GaugeWidget_MeasureAndDraw_B5C04
sub_74CCB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CD0	proc far
		jmp	GaugeWidget_HelperG_B5C89
sub_74CD0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CD5	proc far
		jmp	GaugeWidget_UpdateWithLockWrapper_B60AD
sub_74CD5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CDA	proc far
		jmp	GaugeWidget_RebuildDisplay_B611E
sub_74CDA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CDF	proc far
		jmp	GaugeWidget_HelperI_B5CCB
sub_74CDF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CE4	proc far
		jmp	GaugeWidget_QueryAndFormat_B60C5
sub_74CE4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CE9	proc far
		jmp	GaugeWidget_FormatDisplayValue_B618F
sub_74CE9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CEE	proc far
		jmp	sub_B5E63
sub_74CEE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CF3	proc far
		jmp	GaugeWidget_ReleaseExtraAndNode_B6693
sub_74CF3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74CF8	proc far
		jmp	GaugeWidget_UpdateAndReleaseUnderLock_B66B4
sub_74CF8	endp
		db 0, 0, 0
stub330		ends
