stub328		segment	para public 'CODE' use16
		assume cs:stub328
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
stru_74A30	db 0CDh, 3Fh		; int_code
		dw 0			; memswap
		dd 382F0h		; fileoff
		dw 1A5Ah		; codesize
		dw 0B4h		; relsize
		dw 39h			; nentries
		dw 0		; prevstub
		db 10h dup(0)		; workarea

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A50	proc far
		jmp	PaletteScreen_ReleaseStyleAndObject_B5041
sub_74A50	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A55	proc far
		jmp	PaletteScreen_DrawCurveShape_B3745
sub_74A55	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A5A	proc far
		jmp	Palette_ReadAllDACRegisters_B3892
sub_74A5A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A5F	proc far
		jmp	Widget_SetFlagBit0_B364B
sub_74A5F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A64	proc far
		jmp	Widget_ClearFlagBit0_B3659
sub_74A64	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A69	proc far
		jmp	Widget_TranslateBounds_B3667
sub_74A69	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A6E	proc far
		jmp	PaletteScreen_DrawCurveWithLabel_B4897
sub_74A6E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A73	proc far
		jmp	PaletteScreen_DrawCurveWithLabelB_B4A41
sub_74A73	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A78	proc far
		jmp	PaletteScreen_ComputeCurvePointA_B36CB
sub_74A78	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A7D	proc far
		jmp	Palette_ConvertPercentToDAC_B398B
sub_74A7D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A82	proc far
		jmp	Palette_WriteEntryAndCommit_B39C9
sub_74A82	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A87	proc far
		jmp	PaletteScreen_BuildCustomGradient_B39F6
sub_74A87	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A8C	proc far
		jmp	PaletteScreen_FormatValueDisplay_B3DF4
sub_74A8C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A91	proc far
		jmp	sub_B3683
sub_74A91	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A96	proc far
		jmp	Widget_SetFlagBit0_B3EA1
sub_74A96	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74A9B	proc far
		jmp	Widget_SetFlagBit4AndOffsets_B3EAF
sub_74A9B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AA0	proc far
		jmp	PaletteScreen_DrawWidgetBorderB_B423D
sub_74AA0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AA5	proc far
		jmp	PaletteScreen_DrawWidgetBorderA_B40B1
sub_74AA5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AAA	proc far
		jmp	PaletteScreen_DrawWidgetVariantB_B4036
sub_74AAA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AAF	proc far
		jmp	PaletteScreen_DrawWidgetVariantA_B4006
sub_74AAF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AB4	proc far
		jmp	PaletteScreen_DrawWidgetBackground_B3EC9
sub_74AB4	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AB9	proc far
		jmp	sub_B43B5
sub_74AB9	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74ABE	proc far
		jmp	sub_B4404
sub_74ABE	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AC3	proc far
		jmp	sub_B4453
sub_74AC3	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AC8	proc far
		jmp	sub_B44A7
sub_74AC8	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74ACD	proc far
		jmp	PaletteScreen_DrawWidgetPixel_B44FB
sub_74ACD	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AD2	proc far
		jmp	PaletteScreen_DrawWidgetFillC_B452F
sub_74AD2	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AD7	proc far
		jmp	PaletteScreen_AcquireOwnership_B3610
sub_74AD7	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74ADC	proc far
		jmp	PaletteScreen_ReleaseOwnership_B362D
sub_74ADC	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AE1	proc far
		jmp	PaletteScreen_ApplyTextStyle_B47ED
sub_74AE1	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AE6	proc far
		jmp	PaletteScreen_ApplyTextStyleB_B4832
sub_74AE6	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AEB	proc far
		jmp	sub_B368D
sub_74AEB	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AF0	proc far
		jmp	sub_B3695
sub_74AF0	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AF5	proc far
		jmp	PaletteScreen_DrawWidgetBorderWrapper_B4571
sub_74AF5	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AFA	proc far
		jmp	Widget_Method_Dispatch18_B369D
sub_74AFA	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74AFF	proc far
		jmp	PaletteScreen_DrawWidgetVariantC_B47B7
sub_74AFF	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B04	proc far
		jmp	sub_B36AF
sub_74B04	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B09	proc far
		jmp	sub_B36B9
sub_74B09	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B0E	proc far
		jmp	PaletteScreen_UpdateWidgetMain_B457F
sub_74B0E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B13	proc far
		jmp	sub_B36C3
sub_74B13	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B18	proc far
		jmp	sub_B4D82
sub_74B18	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B1D	proc far
		jmp	sub_B4BDB
sub_74B1D	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B22	proc far
		jmp	sub_B4C29
sub_74B22	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B27	proc far
		jmp	sub_B4C8F
sub_74B27	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B2C	proc far
		jmp	PaletteScreen_MeasureAndDrawBorder_B4DF6
sub_74B2C	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B31	proc far
		jmp	PaletteScreen_ReleaseResourcesB_B4FE9
sub_74B31	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B36	proc far
		jmp	PaletteScreen_HelperC_B4F61
sub_74B36	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B3B	proc far
		jmp	PaletteScreen_HelperD_B4F9A
sub_74B3B	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B40	proc far
		jmp	PaletteScreen_MeasureAndDrawBorderB_B4E64
sub_74B40	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B45	proc far
		jmp	Palette_SetDACRegister_B37CF
sub_74B45	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B4A	proc far
		jmp	Palette_GetDACRegister_B37E5
sub_74B4A	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B4F	proc far
		jmp	sub_B3800
sub_74B4F	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B54	proc far
		jmp	Palette_WriteAllDACRegisters_B38AF
sub_74B54	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B59	proc far
		jmp	Palette_WriteSingleEntry_B38C1
sub_74B59	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B5E	proc far
		jmp	Palette_ReleaseBuffer_B38F0
sub_74B5E	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B63	proc far
		jmp	Palette_GetOrLoadWorkingBuffer_B3920
sub_74B63	endp

; ----------------------------------------------------------------------

; Attributes: thunk

sub_74B68	proc far
		jmp	PaletteScreen_ResetGlobalFlag_B5037
sub_74B68	endp
		db 0, 0, 0
stub328		ends
