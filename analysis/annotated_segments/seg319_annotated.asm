seg319		segment	para public 'CODE' use16
		assume cs:seg319
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C710	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0B06o
		dw 0			; memswap
		dd 2F8E0h		; fileoff
		dw 19E8h		; codesize
		dw 0AEh			; relsize
		dw 57			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2BFF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C730	proc far		; DATA XREF: seg339:off_6FED6o
		jmp	PaletteScreen_ReleaseStyleAndObject_A2BFF
VROOMM_StubThunk_6C730	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1375) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C735	proc far
		jmp	PaletteScreen_DrawCurveShape_A1375
VROOMM_StubThunk_6C735	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A14C2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C73A	proc far
		jmp	Palette_ReadAllDACRegisters_A14C2
VROOMM_StubThunk_6C73A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A127B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C73F	proc far		; CODE XREF: GaugeWidget_Method_ClearField_A3224+1FP
					; DATA XREF: seg339:12E2o ...
		jmp	Widget_SetFlagBit0_A127B
VROOMM_StubThunk_6C73F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1289) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C744	proc far		; CODE XREF: GaugeWidget_Method_ToggleField_A324D+20P
					; DATA XREF: seg339:12E6o ...
		jmp	Widget_ClearFlagBit0_A1289
VROOMM_StubThunk_6C744	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1297) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C749	proc far		; CODE XREF: GaugeWidget_Method_SetField_A31EA+2EP
					; DATA XREF: seg339:12EAo ...
		jmp	Widget_TranslateBounds_A1297
VROOMM_StubThunk_6C749	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A24C7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C74E	proc far
		jmp	PaletteScreen_DrawCurveWithLabel_A24C7
VROOMM_StubThunk_6C74E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2671) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C753	proc far
		jmp	PaletteScreen_DrawCurveWithLabelB_A2671
VROOMM_StubThunk_6C753	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A12FB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C758	proc far
		jmp	PaletteScreen_ComputeCurvePointA_A12FB
VROOMM_StubThunk_6C758	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A15BB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C75D	proc far		; CODE XREF: GaugeWidget_HelperH_A381A+17P
		jmp	Palette_ConvertPercentToDAC_A15BB
VROOMM_StubThunk_6C75D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A15F9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C762	proc far
		jmp	Palette_WriteEntryAndCommit_A15F9
VROOMM_StubThunk_6C762	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1626) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C767	proc far		; CODE XREF: Input_CalibrationHandler+177P
					; Cockpit_LoadAndInitFull_90D20+16CP
		jmp	PaletteScreen_BuildCustomGradient_A1626
VROOMM_StubThunk_6C767	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1A24) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C76C	proc far		; CODE XREF: Input_CalibrationHandler:loc_28163P
					; Input_CalibrationHandler+27EP ...
		jmp	PaletteScreen_FormatValueDisplay_A1A24
VROOMM_StubThunk_6C76C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A12B3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C771	proc far		; DATA XREF: seg339:12EEo
					; seg339:off_6E3D2o ...
		jmp	Widget_Method_ReturnZeroA_A12B3
VROOMM_StubThunk_6C771	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1AD1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C776	proc far
		jmp	Widget_SetFlagBit3_A1AD1
VROOMM_StubThunk_6C776	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1ADF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C77B	proc far
		jmp	Widget_SetFlagBit4AndOffsets_A1ADF
VROOMM_StubThunk_6C77B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1E6D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C780	proc far
		jmp	PaletteScreen_DrawWidgetBorderB_A1E6D
VROOMM_StubThunk_6C780	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1CE1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C785	proc far		; CODE XREF: InfoWidget_ApplyStubHelpers_A47F8+8P
		jmp	PaletteScreen_DrawWidgetBorderA_A1CE1
VROOMM_StubThunk_6C785	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1C66) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C78A	proc far		; CODE XREF: InfoWidget_ApplyStubHelpers_A47F8+12P
		jmp	PaletteScreen_DrawWidgetVariantB_A1C66
VROOMM_StubThunk_6C78A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1C36) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C78F	proc far
		jmp	PaletteScreen_DrawWidgetVariantA_A1C36
VROOMM_StubThunk_6C78F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1AF9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C794	proc far
		jmp	PaletteScreen_DrawWidgetBackground_A1AF9
VROOMM_StubThunk_6C794	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1FE5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C799	proc far		; CODE XREF: InfoWidget_DrawComposite_A488A+1AP
		jmp	PaletteScreen_DrawWidgetLineA_A1FE5
VROOMM_StubThunk_6C799	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2034) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C79E	proc far		; CODE XREF: GaugeWidget_ApplyUnderLock_A3991+14P
					; GaugeWidget_UpdateAndReleaseUnderLock_A421B+1CP ...
		jmp	PaletteScreen_ComputeAndClipRegion_A2034
VROOMM_StubThunk_6C79E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2083) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7A3	proc far		; CODE XREF: InfoWidget_DrawComposite_A488A+36P
		jmp	PaletteScreen_DrawWidgetLineB_A2083
VROOMM_StubThunk_6C7A3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A20D7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7A8	proc far
		jmp	PaletteScreen_ComputeAndClipRegionB_A20D7
VROOMM_StubThunk_6C7A8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A212B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7AD	proc far
		jmp	PaletteScreen_DrawWidgetPixel_A212B
VROOMM_StubThunk_6C7AD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A215F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7B2	proc far		; CODE XREF: InfoWidget_DrawComposite_A488A+62P
					; InfoWidget_DrawComposite_A488A+7EP ...
		jmp	PaletteScreen_DrawWidgetFillC_A215F
VROOMM_StubThunk_6C7B2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1240) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7B7	proc far		; CODE XREF: Input_CalibrationHandler+33AP
					; Cockpit_DrawEncodedText_8FA4C+BP	...
		jmp	PaletteScreen_AcquireOwnership_A1240
VROOMM_StubThunk_6C7B7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A125D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7BC	proc far		; CODE XREF: Input_CalibrationHandler+36FP
					; Cockpit_DrawEncodedText_8FA4C+D5P ...
		jmp	PaletteScreen_ReleaseOwnership_A125D
VROOMM_StubThunk_6C7BC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A241D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7C1	proc far
		jmp	PaletteScreen_ApplyTextStyle_A241D
VROOMM_StubThunk_6C7C1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2462) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7C6	proc far
		jmp	PaletteScreen_ApplyTextStyleB_A2462
VROOMM_StubThunk_6C7C6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A12BD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7CB	proc far		; DATA XREF: seg339:12F2o seg339:1326o ...
		jmp	Widget_Method_PassThroughA_A12BD
VROOMM_StubThunk_6C7CB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A12C5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7D0	proc far		; DATA XREF: seg339:12F6o seg339:132Ao ...
		jmp	Widget_Method_PassThroughB_A12C5
VROOMM_StubThunk_6C7D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A21A1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7D5	proc far		; DATA XREF: seg339:off_6FEBEo
		jmp	PaletteScreen_DrawWidgetBorderWrapper_A21A1
VROOMM_StubThunk_6C7D5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A12CD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7DA	proc far		; DATA XREF: seg339:12FEo seg339:1332o ...
		jmp	Widget_Method_Dispatch18_A12CD
VROOMM_StubThunk_6C7DA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A23E7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7DF	proc far
		jmp	PaletteScreen_DrawWidgetVariantC_A23E7
VROOMM_StubThunk_6C7DF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A12DF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7E4	proc far		; DATA XREF: seg339:1302o seg339:1336o ...
		jmp	Widget_Method_PassThroughC_A12DF
VROOMM_StubThunk_6C7E4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A12E9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7E9	proc far		; DATA XREF: seg339:1306o seg339:133Ao ...
		jmp	Widget_Method_PassThroughD_A12E9
VROOMM_StubThunk_6C7E9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A21AF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7EE	proc far		; DATA XREF: seg339:130Ao seg339:133Eo ...
		jmp	PaletteScreen_UpdateWidgetMain_A21AF
VROOMM_StubThunk_6C7EE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A12F3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7F3	proc far		; DATA XREF: seg339:130Eo
					; seg339:off_6FED2o ...
		jmp	Widget_Method_PassThroughE_A12F3
VROOMM_StubThunk_6C7F3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A296C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7F8	proc far
		jmp	PaletteScreen_ReleaseResources_A296C
VROOMM_StubThunk_6C7F8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A280B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C7FD	proc far
		jmp	PaletteScreen_Helper_A280B
VROOMM_StubThunk_6C7FD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2844) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C802	proc far
		jmp	PaletteScreen_HelperB_A2844
VROOMM_StubThunk_6C802	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2893) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C807	proc far
		jmp	PaletteScreen_DrawBorderAndText_A2893
VROOMM_StubThunk_6C807	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A29B4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C80C	proc far		; DATA XREF: seg339:12FAo seg339:132Eo
		jmp	PaletteScreen_MeasureAndDrawBorder_A29B4
VROOMM_StubThunk_6C80C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2BA7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C811	proc far
		jmp	PaletteScreen_ReleaseResourcesB_A2BA7
VROOMM_StubThunk_6C811	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2B1F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C816	proc far
		jmp	PaletteScreen_HelperC_A2B1F
VROOMM_StubThunk_6C816	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2B58) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C81B	proc far
		jmp	PaletteScreen_HelperD_A2B58
VROOMM_StubThunk_6C81B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2A22) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C820	proc far
		jmp	PaletteScreen_MeasureAndDrawBorderB_A2A22
VROOMM_StubThunk_6C820	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A13FF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C825	proc far
		jmp	Palette_SetDACRegister_A13FF
VROOMM_StubThunk_6C825	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1415) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C82A	proc far
		jmp	Palette_GetDACRegister_A1415
VROOMM_StubThunk_6C82A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1430) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C82F	proc far
		jmp	PaletteScreen_ComputeCurvePoint_A1430
VROOMM_StubThunk_6C82F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A14DF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C834	proc far
		jmp	Palette_WriteAllDACRegisters_A14DF
VROOMM_StubThunk_6C834	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A14F1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C839	proc far
		jmp	Palette_WriteSingleEntry_A14F1
VROOMM_StubThunk_6C839	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1520) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C83E	proc far
		jmp	Palette_ReleaseBuffer_A1520
VROOMM_StubThunk_6C83E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A1550) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C843	proc far
		jmp	Palette_GetOrLoadWorkingBuffer_A1550
VROOMM_StubThunk_6C843	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2BF5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F8E0h, codesize=19E8h, nentries=57.
; ==============================================================================================
VROOMM_StubThunk_6C848	proc far		; DATA XREF: seg339:4E34o
		jmp	PaletteScreen_ResetGlobalFlag_A2BF5
VROOMM_StubThunk_6C848	endp

seg319		ends
