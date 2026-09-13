stub256		segment	para public 'CODE' use16
		assume cs:stub256
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B4B0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:08BEo
		dw 0			; memswap
		dd 19FE0h		; fileoff
		dw 763h			; codesize
		dw 32h			; relsize
		dw 14			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8C930) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=19FE0h, codesize=763h, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B4D0	proc far
		jmp	UISublist_ResetAndCopy_8C930
VROOMM_StubThunk_6B4D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8CCE8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=19FE0h, codesize=763h, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B4D5	proc far		; CODE XREF: MissionRecord_LoadWithDwordFields_89850+40FP
					; MissionRecord_LoadWithDwordFieldsB_89F00:loc_8A4EEP	...
		jmp	UISublist_ReleaseSimple_8CCE8
VROOMM_StubThunk_6B4D5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8CBB0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=19FE0h, codesize=763h, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B4DA	proc far		; CODE XREF: MissionRecord_LoadWithDwordFields_89850+42CP
					; MissionRecord_LoadWithDwordFields_89850+445P ...
		jmp	UISublist_ConstructStrings_8CBB0
VROOMM_StubThunk_6B4DA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8CCA0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=19FE0h, codesize=763h, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B4DF	proc far		; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+606P
					; MissionRecord_LoadWithDwordFieldsB_89F00+61BP ...
		jmp	UISublist_Helper2_8CCA0
VROOMM_StubThunk_6B4DF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8CAF9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=19FE0h, codesize=763h, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B4E4	proc far		; CODE XREF: seg025:05B5P seg027:0C82P ...
		jmp	UISublist_ReleaseTriple_8CAF9
VROOMM_StubThunk_6B4E4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8C9BA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=19FE0h, codesize=763h, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B4E9	proc far
		jmp	UISublist_Reset_8C9BA
VROOMM_StubThunk_6B4E9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8CA28) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=19FE0h, codesize=763h, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B4EE	proc far		; CODE XREF: MissionRecordField_ThunkOnly3_8B473+18P
		jmp	UISublist_Helper_8CA28
VROOMM_StubThunk_6B4EE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8CD2C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=19FE0h, codesize=763h, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B4F3	proc far		; CODE XREF: MissionRecordField_ThunkOnly6_8B562+18P
		jmp	UISublist_ReleaseAndCount_8CD2C
VROOMM_StubThunk_6B4F3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8CDE4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=19FE0h, codesize=763h, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B4F8	proc far
		jmp	UISublist_Helper3_8CDE4
VROOMM_StubThunk_6B4F8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8CE0D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=19FE0h, codesize=763h, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B4FD	proc far		; CODE XREF: MissionRecordField_ThunkOnly4_8B4B8+27P
		jmp	UISublist_ReleaseSimpleB_8CE0D
VROOMM_StubThunk_6B4FD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8CE72) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=19FE0h, codesize=763h, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B502	proc far
		jmp	UISublist_Helper4_8CE72
VROOMM_StubThunk_6B502	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8CEB2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=19FE0h, codesize=763h, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B507	proc far		; CODE XREF: MissionRecordField_ThunkOnly5_8B50D+27P
		jmp	UISublist_ReleaseSimpleC_8CEB2
VROOMM_StubThunk_6B507	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8CF10) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=19FE0h, codesize=763h, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B50C	proc far		; CODE XREF: MissionRecordField_ReleaseAndThunk_8B2A3+58P
					; MissionRecordField_ReleaseAndThunkB_8B33E+58P ...
		jmp	UISublist_ResetB_8CF10
VROOMM_StubThunk_6B50C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8CFCF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=19FE0h, codesize=763h, nentries=14.
; ==============================================================================================
VROOMM_StubThunk_6B511	proc far		; CODE XREF: MissionRecordField_ThunkOnly2_8B42B+1BP
		jmp	UISublist_ResetC_8CFCF
VROOMM_StubThunk_6B511	endp

stub256		ends
