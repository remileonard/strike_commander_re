stub241		segment	para public 'CODE' use16
		assume cs:stub241
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6AE00	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0846o
		dw 0			; memswap
		dd 0AB70h		; fileoff
		dw 1C7Dh		; codesize
		dw 0DEh			; relsize
		dw 28			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7FAE0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE20	proc far		; DATA XREF: seg339:05F4o
		jmp	GlyphObject_DestructWrapper_7FAE0
VROOMM_StubThunk_6AE20	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7EB0D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE25	proc far
		jmp	GlyphObject_Helper4_7EB0D
VROOMM_StubThunk_6AE25	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7EB1C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE2A	proc far
		jmp	GlyphObject_Helper5_7EB1C
VROOMM_StubThunk_6AE2A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7EBCA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE2F	proc far
		jmp	GlyphObject_Helper7_7EBCA
VROOMM_StubThunk_6AE2F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7EC45) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE34	proc far
		jmp	GlyphObject_Helper8_7EC45
VROOMM_StubThunk_6AE34	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7E5F2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE39	proc far
		jmp	GlyphObject_ResolveHierarchyOffset_7E5F2
VROOMM_StubThunk_6AE39	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7E690) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE3E	proc far
		jmp	GlyphObject_StoreComputedPosition_7E690
VROOMM_StubThunk_6AE3E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7F90F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE43	proc far		; CODE XREF: Player_MainUpdate+823P
		jmp	Lexer_LoadScriptFile_7F90F
VROOMM_StubThunk_6AE43	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7FA32) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE48	proc far		; CODE XREF: Player_MainUpdate+82FP
		jmp	GlyphObject_ReleaseMultiple_7FA32
VROOMM_StubThunk_6AE48	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7E1B4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE4D	proc far
		jmp	Font_LoadDefinitionFromIFF_7E1B4
VROOMM_StubThunk_6AE4D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7E6E1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE52	proc far
		jmp	GlyphObject_Helper_7E6E1
VROOMM_StubThunk_6AE52	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7E708) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE57	proc far
		jmp	GlyphObject_Helper2_7E708
VROOMM_StubThunk_6AE57	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7E72B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE5C	proc far
		jmp	GlyphObject_Helper3_7E72B
VROOMM_StubThunk_6AE5C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7E7CC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE61	proc far
		jmp	GlyphObject_MeasureAndRelease_7E7CC
VROOMM_StubThunk_6AE61	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7EDCA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE66	proc far
		jmp	Render_DrawComplexShape_7EDCA
VROOMM_StubThunk_6AE66	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7E81D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE6B	proc far
		jmp	Expr_ResolveBuiltinCallSite_7E81D
VROOMM_StubThunk_6AE6B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7E9C9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE70	proc far
		jmp	GlyphObject_ComputeClipRegion_7E9C9
VROOMM_StubThunk_6AE70	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7F587) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE75	proc far
		jmp	GlyphObject_MeasureAndDraw_7F587
VROOMM_StubThunk_6AE75	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7F69C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE7A	proc far
		jmp	Lexer_AdvanceWrapper_7F69C
VROOMM_StubThunk_6AE7A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7F6C5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE7F	proc far
		jmp	Lexer_RewindWrapper_7F6C5
VROOMM_StubThunk_6AE7F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7F5D5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE84	proc far
		jmp	Expr_ResolveStringEntry_7F5D5
VROOMM_StubThunk_6AE84	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7F6EE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE89	proc far
		jmp	Cockpit_ProcessInputFrame_7F6EE
VROOMM_StubThunk_6AE89	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7DE90) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE8E	proc far
		jmp	GlyphObject_LoadMetricsFromIFF_7DE90
VROOMM_StubThunk_6AE8E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7DFCA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE93	proc far
		jmp	GlyphObject_MeasureWrapper_7DFCA
VROOMM_StubThunk_6AE93	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7DF7F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE98	proc far
		jmp	GlyphObject_MeasureAndAllocate_7DF7F
VROOMM_StubThunk_6AE98	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7E00D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AE9D	proc far
		jmp	GlyphObject_ResolveAndMeasure_7E00D
VROOMM_StubThunk_6AE9D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7E0BD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AEA2	proc far
		jmp	GlyphObject_DrawScaled_7E0BD
VROOMM_StubThunk_6AEA2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7EB72) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0AB70h, codesize=1C7Dh, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6AEA7	proc far
		jmp	GlyphObject_Helper6_7EB72
VROOMM_StubThunk_6AEA7	endp

stub241		ends
