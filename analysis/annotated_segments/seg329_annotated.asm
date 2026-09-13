seg329		segment	para public 'CODE' use16
		assume cs:seg329
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6CC80	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0B56o
		dw 0			; memswap
		dd 352F0h		; fileoff
		dw 391h			; codesize
		dw 20h			; relsize
		dw 7			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6A52) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=352F0h, codesize=391h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6CCA0	proc far
		jmp	PlayerComponent_ComputeSteppedRange_A6A52
VROOMM_StubThunk_6CCA0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6900) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=352F0h, codesize=391h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6CCA5	proc far		; CODE XREF: MissionText_LoadSubtitleRecordB_94710+2F8P
		jmp	PlayerComponent_LoadAndComputeRange_A6900
VROOMM_StubThunk_6CCA5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6AE9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=352F0h, codesize=391h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6CCAA	proc far		; DATA XREF: seg339:off_7039Eo
		jmp	PlayerComponent_ComputeSteppedRangeWrapper_A6AE9
VROOMM_StubThunk_6CCAA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6B09) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=352F0h, codesize=391h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6CCAF	proc far
		jmp	PlayerComponent_LoadListAndCompute_A6B09
VROOMM_StubThunk_6CCAF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6BD7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=352F0h, codesize=391h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6CCB4	proc far		; CODE XREF: IFF_LoadModelMain:loc_3BB9DP
		jmp	PlayerComponent_InitBaseClassMinimal_A6BD7
VROOMM_StubThunk_6CCB4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6BFB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=352F0h, codesize=391h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6CCB9	proc far		; DATA XREF: seg339:251Co
		jmp	PlayerComponentVariantAI_ConstructAndInit_A6BFB
VROOMM_StubThunk_6CCB9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6C4A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=352F0h, codesize=391h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6CCBE	proc far
		jmp	PlayerComponent_SubHelperAJ_A6C4A
VROOMM_StubThunk_6CCBE	endp

seg329		ends
