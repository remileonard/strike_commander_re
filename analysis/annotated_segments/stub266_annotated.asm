stub266		segment	para public 'CODE' use16
		assume cs:stub266
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B760	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:090Eo
		dw 0			; memswap
		dd 1D0D0h		; fileoff
		dw 15FEh		; codesize
		dw 114h			; relsize
		dw 14			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_90CBB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1D0D0h, codesize=15FEh, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B780	proc far		; DATA XREF: seg339:14AFo
		jmp	ResourceFile_ReleaseAndStyle_90CBB
VROOMM_StubThunk_6B780	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8FA4C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1D0D0h, codesize=15FEh, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B785	proc far		; CODE XREF: Cockpit_LoadAndInitFull_90D20+B2CP
					; Cockpit_LoadAndInitFull_90D20+CAAP ...
		jmp	Cockpit_DrawEncodedText_8FA4C
VROOMM_StubThunk_6B785	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8FB2A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1D0D0h, codesize=15FEh, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B78A	proc far		; CODE XREF: Cockpit_LoadAndInitFull_90D20+D20P
					; Cockpit_LoadAndApplyEncoding_926A5+7BP
		jmp	Cockpit_ApplyEncodingWrapper_8FB2A
VROOMM_StubThunk_6B78A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8FB73) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1D0D0h, codesize=15FEh, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B78F	proc far		; CODE XREF: Cockpit_LoadAndInitFull_90D20+C65P
		jmp	Config_WriteSettingsField_8FB73
VROOMM_StubThunk_6B78F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8FCB6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1D0D0h, codesize=15FEh, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B794	proc far
		jmp	Config_WriteSettingsFieldB_8FCB6
VROOMM_StubThunk_6B794	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8FBE7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1D0D0h, codesize=15FEh, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B799	proc far
		jmp	Config_ReadSettingsField_8FBE7
VROOMM_StubThunk_6B799	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8FD2A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1D0D0h, codesize=15FEh, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B79E	proc far		; CODE XREF: Cockpit_LoadAndInitFull_90D20+C77P
		jmp	Config_ReadSettingsFieldWithMessage_8FD2A
VROOMM_StubThunk_6B79E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8FC61) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1D0D0h, codesize=15FEh, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B7A3	proc far		; CODE XREF: Program_InitVideoFontArgs+209P
		jmp	CRT_DisplayCalibrationMessage_8FC61
VROOMM_StubThunk_6B7A3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8F900) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1D0D0h, codesize=15FEh, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B7A8	proc far
		jmp	Cockpit_ReadControlsFrameB_8F900
VROOMM_StubThunk_6B7A8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8F720) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1D0D0h, codesize=15FEh, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B7AD	proc far		; CODE XREF: Cockpit_LoadAndInitFull_90D20+D14P
		jmp	Cockpit_ReadControlsFrame_8F720
VROOMM_StubThunk_6B7AD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_90097) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1D0D0h, codesize=15FEh, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B7B2	proc far		; CODE XREF: Cockpit_LoadAndInitFull_90D20+BFEP
		jmp	ResourceFile_LoadTypeA_90097
VROOMM_StubThunk_6B7B2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8FDC0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1D0D0h, codesize=15FEh, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B7B7	proc far
		jmp	Cockpit_LoadAndDrawCalibration_8FDC0
VROOMM_StubThunk_6B7B7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_90923) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1D0D0h, codesize=15FEh, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B7BC	proc far		; DATA XREF: seg339:4DD4o
		jmp	ResourceFile_Helper_90923
VROOMM_StubThunk_6B7BC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_90AD6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1D0D0h, codesize=15FEh, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B7C1	proc far		; DATA XREF: seg339:4EEEo
		jmp	ResourceFile_ReleaseMultipleBlocks_90AD6
VROOMM_StubThunk_6B7C1	endp

stub266		ends
