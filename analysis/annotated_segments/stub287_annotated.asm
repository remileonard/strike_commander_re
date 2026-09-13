stub287		segment	para public 'CODE' use16
		assume cs:stub287
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BBC0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:09B6o
		dw 0			; memswap
		dd 254D0h		; fileoff
		dw 9FEh			; codesize
		dw 54h			; relsize
		dw 18			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97540) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BBE0	proc far		; CODE XREF: AIManeuver_Helper_780A5+61P
					; AIManeuver_LoadFormationDataC_7AEE0+7FP ...
		jmp	MissionText_ApplyDualStyle_97540
VROOMM_StubThunk_6BBE0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_975CC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BBE5	proc far		; DATA XREF: seg339:044Co
		jmp	MissionText_DrawTypewriterSynced_975CC
VROOMM_StubThunk_6BBE5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9786A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BBEA	proc far		; CODE XREF: TextScroll_DrawTypewriterFrame_87457+8P
					; DATA XREF: seg339:0454o
		jmp	MissionText_ReleaseStyleWrapper_9786A
VROOMM_StubThunk_6BBEA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9788C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BBEF	proc far		; CODE XREF: TextScroll_FormatAndReleaseRefs_874EF+210P
					; DATA XREF: seg339:045Co
		jmp	MissionText_ReleaseStyles_9788C
VROOMM_StubThunk_6BBEF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97C5C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BBF4	proc far		; CODE XREF: AIManeuver_BuildRotationAndLookupB_7A836+52P
					; HUDSymbol_Helper16_85F30+19P ...
		jmp	MissionText_CopyBufferB_97C5C
VROOMM_StubThunk_6BBF4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97CB7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BBF9	proc far
		jmp	MissionText_Helper4_97CB7
VROOMM_StubThunk_6BBF9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97D39) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BBFE	proc far		; CODE XREF: HUDSymbol_Helper16_85F30+22P
		jmp	MissionText_ComputeTrigonometricLayout_97D39
VROOMM_StubThunk_6BBFE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97CF5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BC03	proc far		; CODE XREF: Kneeboard_ProcessSelected+57P
		jmp	MissionText_Helper6_97CF5
VROOMM_StubThunk_6BC03	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97CD0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BC08	proc far		; CODE XREF: Cockpit_ApplyViewRecord_84EC0+E3P
		jmp	MissionText_Helper5_97CD0
VROOMM_StubThunk_6BC08	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_978D4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BC0D	proc far		; CODE XREF: AIManeuver_LoadFormationData_77E78+42P
					; AIManeuver_LoadFormationDataB_77FCA+3EP ...
		jmp	MissionText_CopyStringField_978D4
VROOMM_StubThunk_6BC0D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97939) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BC12	proc far		; CODE XREF: AIManeuver_Helper_780A5+A3P
					; AIManeuver_LoadFormationDataC_7AEE0+B0P ...
		jmp	MissionText_Helper_97939
VROOMM_StubThunk_6BC12	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97979) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BC17	proc far
		jmp	MissionText_LoadFormationLabel_97979
VROOMM_StubThunk_6BC17	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97A2D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BC1C	proc far
		jmp	MissionText_ConstructFullOrientation_97A2D
VROOMM_StubThunk_6BC1C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97A00) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BC21	proc far		; CODE XREF: Kneeboard_RenderEntry+76P
		jmp	MissionText_Helper2_97A00
VROOMM_StubThunk_6BC21	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97BD3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BC26	proc far		; CODE XREF: AIManeuver_Helper3_7818E+8P
					; HUDSymbol_Helper_80922+16P ...
		jmp	MissionText_CopyBuffer_97BD3
VROOMM_StubThunk_6BC26	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97C39) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BC2B	proc far		; CODE XREF: AIManeuver_Helper4_781BC+7P
					; HUDSymbol_Helper2_8094F+1AP ...
		jmp	Camera_DetachParentWrapper_97C39
VROOMM_StubThunk_6BC2B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97B69) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BC30	proc far		; CODE XREF: HUDSymbol_ReleaseRefConditionalB_85639+8P
					; DATA XREF: seg339:0468o ...
		jmp	MissionText_Helper3_97B69
VROOMM_StubThunk_6BC30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97B89) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=254D0h, codesize=9FEh, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6BC35	proc far		; CODE XREF: AI_ManeuverCleanup_79CFF+5EP
					; MissionRecord_ReleaseEntryB_7D2D1+12P ...
		jmp	MissionText_ReleaseFree_97B89
VROOMM_StubThunk_6BC35	endp

stub287		ends
