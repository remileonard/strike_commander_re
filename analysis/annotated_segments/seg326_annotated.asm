seg326		segment	para public 'CODE' use16
		assume cs:seg326
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6CB90	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A91Eo
		dw 0			; memswap
		dd 33F00h		; fileoff
		dw 8FEh			; codesize
		dw 6Eh			; relsize
		dw 11			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5D18) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33F00h, codesize=8FEh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6CBB0	proc far
		jmp	JDYN_ReadChunkFields_A5D18
VROOMM_StubThunk_6CBB0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5EB4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33F00h, codesize=8FEh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6CBB5	proc far
		jmp	PlayerComponent_ConstructAndLoadMassive_A5EB4
VROOMM_StubThunk_6CBB5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5B8F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33F00h, codesize=8FEh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6CBBA	proc far
		jmp	PlayerComponent_Helper_A5B8F
VROOMM_StubThunk_6CBBA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5C76) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33F00h, codesize=8FEh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6CBBF	proc far
		jmp	PlayerComponent_LoadFieldsWithRetryL_A5C76
VROOMM_StubThunk_6CBBF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5620) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33F00h, codesize=8FEh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6CBC4	proc far
		jmp	PlayerComponent_ResetVisualStateDefaults_A5620
VROOMM_StubThunk_6CBC4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5707) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33F00h, codesize=8FEh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6CBC9	proc far
		jmp	PlayerComponentVariantAH_ConstructAndInit_A5707
VROOMM_StubThunk_6CBC9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5CEA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33F00h, codesize=8FEh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6CBCE	proc far		; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+17EP
		jmp	PlayerComponent_LoadFieldsWrapper_A5CEA
VROOMM_StubThunk_6CBCE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A574D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33F00h, codesize=8FEh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6CBD3	proc far		; CODE XREF: seg082:11AFJ seg082:134DJ ...
		jmp	PlayerComponentVariantAI_ConstructAndInit_A574D
VROOMM_StubThunk_6CBD3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A58AB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33F00h, codesize=8FEh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6CBD8	proc far		; CODE XREF: seg082:1198J
					; seg082:loc_3B7A6J ...
		jmp	PlayerComponentVariantAJ_ConstructAndInit_A58AB
VROOMM_StubThunk_6CBD8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5A17) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33F00h, codesize=8FEh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6CBDD	proc far		; CODE XREF: seg082:1181J seg082:131FJ ...
		jmp	PlayerComponentVariantAK_ConstructAndInit_A5A17
VROOMM_StubThunk_6CBDD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5F16) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33F00h, codesize=8FEh, nentries=11.
; ==============================================================================================
VROOMM_StubThunk_6CBE2	proc far		; CODE XREF: seg082:11C6J seg082:1365J
					; DATA XREF: ...
		jmp	PlayerComponent_Helper_A5F16
VROOMM_StubThunk_6CBE2	endp

seg326		ends
