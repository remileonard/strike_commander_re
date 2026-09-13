stub242		segment	para public 'CODE' use16
		assume cs:stub242
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6AEB0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:084Eo
		dw 0			; memswap
		dd 0C8D0h		; fileoff
		dw 9DCh			; codesize
		dw 7Ch			; relsize
		dw 11			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_804BF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0C8D0h, codesize=9DCh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6AED0	proc far		; DATA XREF: seg339:0632o
		jmp	GlyphObject_DestructWrapperB_804BF
VROOMM_StubThunk_6AED0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7FD03) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0C8D0h, codesize=9DCh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6AED5	proc far		; CODE XREF: seg112:0C93P
		jmp	GlyphObject_AllocateExtended_7FD03
VROOMM_StubThunk_6AED5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7FE9F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0C8D0h, codesize=9DCh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6AEDA	proc far		; CODE XREF: seg112:0D95P
					; MissionLoader_AssignUnitRoster_A7D46+98P
		jmp	GlyphObject_ReleaseStylesAndBuffer_7FE9F
VROOMM_StubThunk_6AEDA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7FD64) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0C8D0h, codesize=9DCh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6AEDF	proc far		; CODE XREF: World_ParseWrldForm_A767F+132P
		jmp	Font_OpenDefinitionFile_7FD64
VROOMM_StubThunk_6AEDF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7FF90) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0C8D0h, codesize=9DCh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6AEE4	proc far
		jmp	Font_LoadGlyphTable_7FF90
VROOMM_StubThunk_6AEE4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8022A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0C8D0h, codesize=9DCh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6AEE9	proc far		; CODE XREF: UI_RenderFormattedText+42P
					; UI_RenderFormattedText+B6P
		jmp	GlyphObject_MeasureAndAllocateB_8022A
VROOMM_StubThunk_6AEE9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_802BA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0C8D0h, codesize=9DCh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6AEEE	proc far
		jmp	GlyphObject_MeasureAndAllocateExtended_802BA
VROOMM_StubThunk_6AEEE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_80467) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0C8D0h, codesize=9DCh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6AEF3	proc far		; CODE XREF: Player_MainUpdate+4C9P
					; Player_MainUpdate+4E7P ...
		jmp	GlyphObject_Helper9_80467
VROOMM_StubThunk_6AEF3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7FB10) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0C8D0h, codesize=9DCh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6AEF8	proc far
		jmp	GlyphObject_LoadMetricsFromIFFB_7FB10
VROOMM_StubThunk_6AEF8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7FC55) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0C8D0h, codesize=9DCh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6AEFD	proc far		; CODE XREF: UI_RenderFormattedText+32P
					; ResourceFile_LoadTypeC_9277C+537P ...
		jmp	GlyphObject_MeasureWrapperB_7FC55
VROOMM_StubThunk_6AEFD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7FC92) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0C8D0h, codesize=9DCh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6AF02	proc far		; CODE XREF: UI_DrawRect+1CP
					; UI_RenderFormattedText+191P ...
		jmp	GlyphObject_ResolveAndMeasureB_7FC92
VROOMM_StubThunk_6AF02	endp

stub242		ends
