stub243		segment	para public 'CODE' use16
		assume cs:stub243
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6AF10	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0856o
		dw 0			; memswap
		dd 0D330h		; fileoff
		dw 2682h		; codesize
		dw 0A8h			; relsize
		dw 18			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_82B2B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF30	proc far		; DATA XREF: seg339:06AEo
		jmp	HUDSymbol_ReleaseTwoRefs_82B2B
VROOMM_StubThunk_6AF30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_82AF0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF35	proc far		; DATA XREF: seg339:068Ao
		jmp	HUDSymbol_ReleaseSingleRef_82AF0
VROOMM_StubThunk_6AF35	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_82A91) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF3A	proc far		; DATA XREF: seg339:off_6D716o
		jmp	HUDSymbol_ReleaseAllRefs_82A91
VROOMM_StubThunk_6AF3A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_82181) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF3F	proc far
		jmp	HUDSymbol_RenderWithLOSCheckB_82181
VROOMM_StubThunk_6AF3F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_80971) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF44	proc far
		jmp	HUDSymbol_DrawWithLineOfSight_80971
VROOMM_StubThunk_6AF44	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_80B74) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF49	proc far
		jmp	HUDSymbol_RenderWithClipTest_80B74
VROOMM_StubThunk_6AF49	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_81467) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF4E	proc far
		jmp	HUDSymbol_RenderWithClipTestB_81467
VROOMM_StubThunk_6AF4E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_81C26) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF53	proc far
		jmp	HUDSymbol_RenderWithClipTestC_81C26
VROOMM_StubThunk_6AF53	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_818A2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF58	proc far
		jmp	HUDSymbol_RenderWithLOSCheck_818A2
VROOMM_StubThunk_6AF58	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8203D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF5D	proc far
		jmp	HUDSymbol_ComputeTransform_8203D
VROOMM_StubThunk_6AF5D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_804F0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF62	proc far
		jmp	HUDSymbol_ConstructVariantA_804F0
VROOMM_StubThunk_6AF62	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_80701) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF67	proc far
		jmp	HUDSymbol_ConstructAndInitAngle_80701
VROOMM_StubThunk_6AF67	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_805F8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF6C	proc far		; CODE XREF: Kneeboard_RenderEntry:loc_236F7P
		jmp	HUDSymbol_ConstructVariantB_805F8
VROOMM_StubThunk_6AF6C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_80922) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF71	proc far		; DATA XREF: seg339:065Ao
		jmp	HUDSymbol_Helper_80922
VROOMM_StubThunk_6AF71	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8094F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF76	proc far		; DATA XREF: seg339:065Eo
		jmp	HUDSymbol_Helper2_8094F
VROOMM_StubThunk_6AF76	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_82693) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF7B	proc far		; DATA XREF: seg339:off_6D71Ao
		jmp	HUDSymbol_ConstructWithViewMatrix_82693
VROOMM_StubThunk_6AF7B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_82850) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF80	proc far		; DATA XREF: seg339:066Eo
		jmp	HUDSymbol_Helper3_82850
VROOMM_StubThunk_6AF80	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8285A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0D330h, codesize=2682h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6AF85	proc far		; CODE XREF: Mission_PlayerEventHandler+B2P
		jmp	HUDSymbol_ConstructWithGeometry_8285A
VROOMM_StubThunk_6AF85	endp

stub243		ends
