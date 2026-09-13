stub251		segment	para public 'CODE' use16
		assume cs:stub251
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B270	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0896o
		dw 0			; memswap
		dd 14CB0h		; fileoff
		dw 4A0h			; codesize
		dw 3Ch			; relsize
		dw 8			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87ECA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=14CB0h, codesize=4A0h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B290	proc far		; DATA XREF: seg339:0922o
		jmp	TextScroll_ReleaseListEntries_87ECA
VROOMM_StubThunk_6B290	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87EAC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=14CB0h, codesize=4A0h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B295	proc far		; DATA XREF: seg339:08DEo
		jmp	TextScroll_ReleaseFreeB_87EAC
VROOMM_StubThunk_6B295	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87E8B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=14CB0h, codesize=4A0h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B29A	proc far		; DATA XREF: seg339:08DAo
		jmp	TextScroll_ReleaseFree_87E8B
VROOMM_StubThunk_6B29A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87A60) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=14CB0h, codesize=4A0h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B29F	proc far		; CODE XREF: Cockpit_LoadViewTable_86B53+5B6P
		jmp	MissionText_LoadSubtitleRecord_87A60
VROOMM_StubThunk_6B29F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87E24) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=14CB0h, codesize=4A0h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B2A4	proc far		; CODE XREF: TextScroll_DrawTypewriterFrameB_8781A+60P
		jmp	TextScroll_ListHelper_87E24
VROOMM_StubThunk_6B2A4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87E57) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=14CB0h, codesize=4A0h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B2A9	proc far		; CODE XREF: TextScroll_DrawTypewriterFrame_87457+14P
		jmp	TextScroll_ListHelperB_87E57
VROOMM_StubThunk_6B2A9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87D74) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=14CB0h, codesize=4A0h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B2AE	proc far
		jmp	TextScroll_AllocateAndInsert_87D74
VROOMM_StubThunk_6B2AE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87DBD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=14CB0h, codesize=4A0h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B2B3	proc far		; CODE XREF: HUDSymbol_ReleaseListEntryB_85DF5+14P
					; TextScroll_FormatAndReleaseRefs_874EF+1F6P
		jmp	TextScroll_ReleaseStylesAndFind_87DBD
VROOMM_StubThunk_6B2B3	endp

stub251		ends
