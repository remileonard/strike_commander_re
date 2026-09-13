seg327		segment	para public 'CODE' use16
		assume cs:seg327
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6CBF0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A926o
		dw 0			; memswap
		dd 34870h		; fileoff
		dw 7C5h			; codesize
		dw 86h			; relsize
		dw 10			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A66B8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=34870h, codesize=7C5h, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6CC10	proc far		; DATA XREF: seg339:off_701B6o
		jmp	TextLabel_ReleaseAndDestruct_A66B8
VROOMM_StubThunk_6CC10	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6683) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=34870h, codesize=7C5h, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6CC15	proc far		; DATA XREF: MissionText_LoadAndFormatFromIFF_A636C+ECo
		jmp	TextLabel_AllocateSmallBuffer_A6683
VROOMM_StubThunk_6CC15	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5F89) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=34870h, codesize=7C5h, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6CC1A	proc far		; CODE XREF: IFF_LoadModelMain+E21P
		jmp	TextLabel_LoadFieldsFromIFF_A5F89
VROOMM_StubThunk_6CC1A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5F20) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=34870h, codesize=7C5h, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6CC1F	proc far		; DATA XREF: seg339:off_6F46Co
		jmp	TextLabel_ConstructAndInit_A5F20
VROOMM_StubThunk_6CC1F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6023) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=34870h, codesize=7C5h, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6CC24	proc far
		jmp	TextLabel_Helper_A6023
VROOMM_StubThunk_6CC24	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6048) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=34870h, codesize=7C5h, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6CC29	proc far
		jmp	TextLabel_InitRandomTimer_A6048
VROOMM_StubThunk_6CC29	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A60AC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=34870h, codesize=7C5h, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6CC2E	proc far
		jmp	TextLabel_MeasureAndAllocate_A60AC
VROOMM_StubThunk_6CC2E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6188) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=34870h, codesize=7C5h, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6CC33	proc far		; DATA XREF: MissionText_LoadAndFormatFromIFF_A636C+D0o
		jmp	TextLabel_AllocateBuffer_A6188
VROOMM_StubThunk_6CC33	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A61D0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=34870h, codesize=7C5h, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6CC38	proc far
		jmp	TextLabel_LoadFieldsExtended_A61D0
VROOMM_StubThunk_6CC38	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A636C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=34870h, codesize=7C5h, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6CC3D	proc far		; CODE XREF: MissionLoader_LoadChunkB_A7CA1+7EP
		jmp	MissionText_LoadAndFormatFromIFF_A636C
VROOMM_StubThunk_6CC3D	endp

seg327		ends
