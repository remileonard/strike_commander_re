stub258		segment	para public 'CODE' use16
		assume cs:stub258
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B550	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:08CEo
		dw 0			; memswap
		dd 1A910h		; fileoff
		dw 97Eh			; codesize
		dw 7Ah			; relsize
		dw 20			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D210) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B570	proc far		; CODE XREF: HUDSymbol_LoadConfigFromIFF_85F65+24P
					; TextScroll_Allocate_87930+1AP ...
		jmp	UIWidget_Allocate_8D210
VROOMM_StubThunk_6B570	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D27C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B575	proc far		; DATA XREF: seg339:0888o seg339:0DD6o ...
		jmp	UIWidget_Helper2_8D27C
VROOMM_StubThunk_6B575	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D266) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B57A	proc far		; CODE XREF: HUDSymbol_Helper18_86166+8P
					; TextScroll_Helper3_879F7+14P
					; DATA XREF: ...
		jmp	UIWidget_Helper_8D266
VROOMM_StubThunk_6B57A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D284) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B57F	proc far		; CODE XREF: HUDSymbol_Helper19_86189+1BP
					; TextScroll_Helper4_87A2B+BP
					; DATA XREF: ...
		jmp	UIWidget_FindActiveByCode_8D284
VROOMM_StubThunk_6B57F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D323) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B584	proc far		; DATA XREF: TextScrollDisplay_FormatAndCache_85ACB+81o
		jmp	UIWidget_ConstructStyled_8D323
VROOMM_StubThunk_6B584	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D37B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B589	proc far		; DATA XREF: UIWidget_ReleaseAndDestruct_8D9EF+3Do
		jmp	UIWidget_ReleaseStyles_8D37B
VROOMM_StubThunk_6B589	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D2C9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B58E	proc far
		jmp	UIWidget_DispatchLayout_8D2C9
VROOMM_StubThunk_6B58E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D495) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B593	proc far
		jmp	UIWidget_Helper4_8D495
VROOMM_StubThunk_6B593	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D52E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B598	proc far
		jmp	UIWidget_Helper5_8D52E
VROOMM_StubThunk_6B598	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D577) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B59D	proc far
		jmp	UIWidget_ApplyStyleAndBounds_8D577
VROOMM_StubThunk_6B59D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D61F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B5A2	proc far
		jmp	UIWidget_Helper7_8D61F
VROOMM_StubThunk_6B5A2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D401) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B5A7	proc far
		jmp	UIWidget_ApplyDualStyleB_8D401
VROOMM_StubThunk_6B5A7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D5FF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B5AC	proc far
		jmp	UIWidget_Helper6_8D5FF
VROOMM_StubThunk_6B5AC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D3C3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B5B1	proc far
		jmp	UIWidget_Helper3_8D3C3
VROOMM_StubThunk_6B5B1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D9EF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B5B6	proc far		; CODE XREF: TextScroll_FormatAndReleaseRefs_874EF+1E3P
		jmp	UIWidget_ReleaseAndDestruct_8D9EF
VROOMM_StubThunk_6B5B6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D63D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B5BB	proc far
		jmp	UIWidget_ReleaseFree_8D63D
VROOMM_StubThunk_6B5BB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8D66C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B5C0	proc far		; CODE XREF: Cockpit_LoadViewTable_86B53+585P
		jmp	UIWidget_LoadDefinitionFromIFF_8D66C
VROOMM_StubThunk_6B5C0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8DA61) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B5C5	proc far
		jmp	UIWidget_ErrorCheckWrapper_8DA61
VROOMM_StubThunk_6B5C5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8DB1A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B5CA	proc far		; CODE XREF: Widget_MainHandler:loc_1C7EDP
					; Widget_MainHandler+162P
		jmp	UIWidget_Helper8_8DB1A
VROOMM_StubThunk_6B5CA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8DB42) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1A910h, codesize=97Eh, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6B5CF	proc far		; CODE XREF: Video_ShakeEffectWrapperB_878A6+21P
		jmp	UIWidget_Helper9_8DB42
VROOMM_StubThunk_6B5CF	endp

stub258		ends
