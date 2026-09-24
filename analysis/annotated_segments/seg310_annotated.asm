seg310		segment	para public 'CODE' use16
		assume cs:seg310
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C450	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0ABEo
		dw 0			; memswap
		dd 2DFF0h		; fileoff
		dw 864h			; codesize
		dw 60h			; relsize
		dw 29			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FAD0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C470	proc far		; CODE XREF: IFF_LoadModelMain+995P
		jmp	PlayerComponent_LoadFieldsWithRetry_9FAD0
VROOMM_StubThunk_6C470	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FB3F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C475	proc far		; DATA XREF: seg339:off_6F514o
		jmp	PlayerComponentVariantA_ConstructAndInit_9FB3F
VROOMM_StubThunk_6C475	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FD1C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C47A	proc far
		jmp	PlayerComponent_InitTimerField_9FD1C
VROOMM_StubThunk_6C47A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FD58) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C47F	proc far
		jmp	PlayerComponent_SubHelperA_9FD58
VROOMM_StubThunk_6C47F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FBDE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C484	proc far		; CODE XREF: IFF_LoadModelMain:loc_3C2B2P
		jmp	PlayerComponentVariantB_ConstructAndInit_9FBDE
VROOMM_StubThunk_6C484	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FC45) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C489	proc far		; DATA XREF: seg339:off_6F4F8o
		jmp	PlayerComponentVariantC_ConstructAndInit_9FC45
VROOMM_StubThunk_6C489	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FD75) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C48E	proc far
		jmp	PlayerComponent_SubHelperB_9FD75
VROOMM_StubThunk_6C48E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FE23) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C493	proc far
		jmp	PlayerComponent_SubHelperE_9FE23
VROOMM_StubThunk_6C493	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0090) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C498	proc far
		jmp	PlayerComponent_SubHelperF_A0090
VROOMM_StubThunk_6C498	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A009E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C49D	proc far
		jmp	PlayerComponent_SubHelperG_A009E
VROOMM_StubThunk_6C49D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FD97) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4A2	proc far		; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+2A8P
		jmp	PlayerComponent_SubHelperC_9FD97
VROOMM_StubThunk_6C4A2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FDAB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4A7	proc far
		jmp	PlayerComponent_SubHelperD_9FDAB
VROOMM_StubThunk_6C4A7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FDDE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4AC	proc far
		jmp	DynGuidedBomb_LoadGBMBChunk_9FDDE
VROOMM_StubThunk_6C4AC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0100) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4B1	proc far
		jmp	PlayerComponent_SubHelperI_A0100
VROOMM_StubThunk_6C4B1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A00B6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4B6	proc far
		jmp	PlayerComponent_SubHelperH_A00B6
VROOMM_StubThunk_6C4B6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FE3A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4BB	proc far		; CODE XREF: seg082:0A8CJ seg082:0AE0J
					; DATA XREF: ...
		jmp	PlayerComponentVariantD_ConstructAndInit_9FE3A
VROOMM_StubThunk_6C4BB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FEF4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4C0	proc far		; CODE XREF: seg082:0A75J seg082:0AD4J
					; DATA XREF: ...
		jmp	PlayerComponentVariantE_ConstructAndInit_9FEF4
VROOMM_StubThunk_6C4C0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FFBC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4C5	proc far		; CODE XREF: seg082:0A5EJ seg082:0AC8J
					; DATA XREF: ...
		jmp	PlayerComponentVariantF_ConstructAndInit_9FFBC
VROOMM_StubThunk_6C4C5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A01A9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4CA	proc far
		jmp	PlayerComponent_RegisterInList_A01A9
VROOMM_StubThunk_6C4CA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A02CC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4CF	proc far
		jmp	PlayerComponent_SubHelperL_A02CC
VROOMM_StubThunk_6C4CF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A02DA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4D4	proc far
		jmp	PlayerComponent_SubHelperM_A02DA
VROOMM_StubThunk_6C4D4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0117) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4D9	proc far		; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+306P
		jmp	PlayerComponent_SubHelperJ_A0117
VROOMM_StubThunk_6C4D9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A012B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4DE	proc far
		jmp	PlayerComponent_SubHelperK_A012B
VROOMM_StubThunk_6C4DE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A014E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4E3	proc far
		jmp	PlayerComponent_LoadFieldGroupB_A014E
VROOMM_StubThunk_6C4E3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0313) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4E8	proc far
		jmp	PlayerComponent_SubHelperO_A0313
VROOMM_StubThunk_6C4E8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A02F0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4ED	proc far
		jmp	PlayerComponent_SubHelperN_A02F0
VROOMM_StubThunk_6C4ED	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A01F5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4F2	proc far		; DATA XREF: seg339:1E06o
		jmp	PlayerComponentVariantG_ConstructAndInit_A01F5
VROOMM_StubThunk_6C4F2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A022E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4F7	proc far		; DATA XREF: seg339:1E0Ao
		jmp	PlayerComponentVariantH_ConstructAndInit_A022E
VROOMM_StubThunk_6C4F7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0275) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2DFF0h, codesize=864h, nentries=29.
; ==============================================================================================
VROOMM_StubThunk_6C4FC	proc far		; DATA XREF: seg339:1E0Eo
		jmp	PlayerComponentVariantI_ConstructAndInit_A0275
VROOMM_StubThunk_6C4FC	endp

seg310		ends
