stub245		segment	para public 'CODE' use16
		assume cs:stub245
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B060	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0866o
		dw 0			; memswap
		dd 11ED0h		; fileoff
		dw 4E2h			; codesize
		dw 1Ah			; relsize
		dw 8			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_84FE2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=11ED0h, codesize=4E2h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B080	proc far		; CODE XREF: seg015:0653P
		jmp	HUDSymbol_Helper11_84FE2
VROOMM_StubThunk_6B080	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85078) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=11ED0h, codesize=4E2h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B085	proc far		; CODE XREF: Radar_ToggleTracking+49P
					; AIManeuver_BuildRotationAndLookup_7A800+23P ...
		jmp	HUDSymbol_ApplyDualStyle_85078
VROOMM_StubThunk_6B085	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_84EC0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=11ED0h, codesize=4E2h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B08A	proc far		; CODE XREF: seg015:068AP
					; TextScroll_DrawTypewriterFrameB_8781A+52P
		jmp	Cockpit_ApplyViewRecord_84EC0
VROOMM_StubThunk_6B08A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85103) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=11ED0h, codesize=4E2h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B08F	proc far		; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+18EP
					; Cockpit_ViewPanTransitionMain_15B67+1DBP ...
		jmp	Cockpit_PanElevationFrame_85103
VROOMM_StubThunk_6B08F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_851D5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=11ED0h, codesize=4E2h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B094	proc far		; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+D4P
					; Cockpit_ViewPanTransitionMain_15B67+295P ...
		jmp	Camera_PanTransitionWrapper_851D5
VROOMM_StubThunk_6B094	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8523B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=11ED0h, codesize=4E2h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B099	proc far		; CODE XREF: Cockpit_ViewPanTransitionMain_15B67+CDP
					; Cockpit_ViewPanTransitionMain_15B67+1D4P ...
		jmp	HUDSymbol_Helper13_8523B
VROOMM_StubThunk_6B099	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85014) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=11ED0h, codesize=4E2h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B09E	proc far
		jmp	HUDSymbol_Helper12_85014
VROOMM_StubThunk_6B09E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8528C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=11ED0h, codesize=4E2h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B0A3	proc far		; CODE XREF: AITargeting_ComputeFullSolution_862A5+12DP
					; AITargeting_ComputeFullSolution_862A5+439P
		jmp	HUDSymbol_AllocateDualBuffer_8528C
VROOMM_StubThunk_6B0A3	endp

stub245		ends
