stub249		segment	para public 'CODE' use16
		assume cs:stub249
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B1D0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0886o
		dw 0			; memswap
		dd 13AF0h		; fileoff
		dw 0F6Fh		; codesize
		dw 0FCh			; relsize
		dw 11			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8790A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=13AF0h, codesize=0F6Fh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6B1F0	proc far
		jmp	TextScroll_Helper2_8790A
VROOMM_StubThunk_6B1F0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_878EC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=13AF0h, codesize=0F6Fh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6B1F5	proc far		; DATA XREF: Cockpit_LoadViewTable_86B53+9Do
		jmp	TextScroll_Helper_878EC
VROOMM_StubThunk_6B1F5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87325) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=13AF0h, codesize=0F6Fh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6B1FA	proc far		; CODE XREF: MissionRecord_LoadEntityDatabase_7B035:loc_7B156P
					; Cockpit_ApplyViewRecord_84EC0+1BP
		jmp	IndexedRecordReader_ReleaseAndAdvance_87325
VROOMM_StubThunk_6B1FA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87718) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=13AF0h, codesize=0F6Fh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6B1FF	proc far		; CODE XREF: AIManeuver_BuildRotationAndLookupB_7A836+43P
					; Cockpit_ApplyViewRecord_84EC0+27P
		jmp	Font_ApplyStyleAndMeasure_87718
VROOMM_StubThunk_6B1FF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_869C0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=13AF0h, codesize=0F6Fh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6B204	proc far
		jmp	UIScreen_ClearAndLoadResource_869C0
VROOMM_StubThunk_6B204	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_86B53) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=13AF0h, codesize=0F6Fh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6B209	proc far		; CODE XREF: TextScrollDisplay_FormatAndCache_85ACB+1D3P
		jmp	Cockpit_LoadViewTable_86B53
VROOMM_StubThunk_6B209	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8781A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=13AF0h, codesize=0F6Fh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6B20E	proc far		; DATA XREF: seg339:off_6D814o
		jmp	TextScroll_DrawTypewriterFrameB_8781A
VROOMM_StubThunk_6B20E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87457) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=13AF0h, codesize=0F6Fh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6B213	proc far		; DATA XREF: seg339:076Co
		jmp	TextScroll_DrawTypewriterFrame_87457
VROOMM_StubThunk_6B213	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_874EF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=13AF0h, codesize=0F6Fh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6B218	proc far		; DATA XREF: seg339:0774o
		jmp	TextScroll_FormatAndReleaseRefs_874EF
VROOMM_StubThunk_6B218	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87883) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=13AF0h, codesize=0F6Fh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6B21D	proc far		; CODE XREF: UIScript_ParseAndEvaluate_7A054+6C6P
					; HUDSymbol_ConstructWithContainerOpC_85D22+56P
		jmp	Video_ShakeEffectWrapper_87883
VROOMM_StubThunk_6B21D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_878A6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=13AF0h, codesize=0F6Fh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6B222	proc far		; CODE XREF: RadioFlags_ResetBank+45P
		jmp	Video_ShakeEffectWrapperB_878A6
VROOMM_StubThunk_6B222	endp

stub249		ends
