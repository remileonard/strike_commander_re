seg325		segment	para public 'CODE' use16
		assume cs:seg325
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6CAE0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A916o
		dw 0			; memswap
		dd 33380h		; fileoff
		dw 0B0Ch		; codesize
		dw 58h			; relsize
		dw 28			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4B98) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB00	proc far		; CODE XREF: PlayerComponent_ConstructAndLoadMassive_A5EB4+28P
					; TriggerObject_ConstructSubobjects_A700F+1DP
		jmp	PlayerComponent_ResetFieldsB_A4B98
VROOMM_StubThunk_6CB00	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4B4B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB05	proc far		; CODE XREF: Ctor_CompositeObjectC_RebindPointers_4F91A+34P
					; PlayerComponent_LoadFieldsWithRetryL_A5C76+22P
		jmp	PlayerComponent_Helper_A4B4B
VROOMM_StubThunk_6CB05	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4B10) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB0A	proc far		; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+E8P
					; JDYN_LoadChunkAndConstruct_3A49C+4BFP ...
		jmp	PlayerComponent_ResetFields_A4B10
VROOMM_StubThunk_6CB0A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4B33) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB0F	proc far
		jmp	PlayerComponent_ResetFieldsWrapper_A4B33
VROOMM_StubThunk_6CB0F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4B74) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB14	proc far
		jmp	PlayerComponentVariantT_ConstructAndInit_A4B74
VROOMM_StubThunk_6CB14	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4BE1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB19	proc far		; CODE XREF: PlayerComponent_SubHelperD_9FDAB+1CP
					; PlayerComponent_ConstructAndLoadMassive_A5EB4+34P ...
		jmp	AircraftDynamics_ReadAtmoChunk_A4BE1
VROOMM_StubThunk_6CB19	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4BA6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB1E	proc far		; CODE XREF: Ctor_CompositeObjectC_RebindPointers_4F91A+4BP
					; PlayerComponent_SubHelperH_A00B6+34P ...
		jmp	PlayerComponent_HelperB_A4BA6
VROOMM_StubThunk_6CB1E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4BBD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB23	proc far
		jmp	PlayerComponentVariantU_ConstructAndInit_A4BBD
VROOMM_StubThunk_6CB23	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4F01) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB28	proc far
		jmp	PlayerComponent_LoadFieldsWithRetryG_A4F01
VROOMM_StubThunk_6CB28	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4F40) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB2D	proc far		; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+3A4P
		jmp	PlayerComponentVariantY_ConstructAndInit_A4F40
VROOMM_StubThunk_6CB2D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4CFB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB32	proc far		; CODE XREF: seg082:0933J seg082:0987J
					; DATA XREF: ...
		jmp	PlayerComponentVariantV_ConstructAndInit_A4CFB
VROOMM_StubThunk_6CB32	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4D8B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB37	proc far		; CODE XREF: seg082:091CJ
					; seg082:loc_3ADEBJ
					; DATA XREF: ...
		jmp	PlayerComponentVariantW_ConstructAndInit_A4D8B
VROOMM_StubThunk_6CB37	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4E40) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB3C	proc far		; CODE XREF: seg082:loc_3AD75J
					; seg082:loc_3ADDFJ
					; DATA XREF: ...
		jmp	PlayerComponentVariantX_ConstructAndInit_A4E40
VROOMM_StubThunk_6CB3C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5224) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB41	proc far		; CODE XREF: PlayerComponent_ConstructAndLoadMassive_A5EB4:loc_A5F01P
		jmp	AircraftDynamics_ReadThrustChunk_A5224
VROOMM_StubThunk_6CB41	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5189) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB46	proc far		; CODE XREF: PlayerComponent_LoadFieldsWithRetryL_A5C76+5FP
		jmp	PlayerComponent_HelperC_A5189
VROOMM_StubThunk_6CB46	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A51B2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB4B	proc far
		jmp	PlayerComponent_LoadFieldsWithRetryH_A51B2
VROOMM_StubThunk_6CB4B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A51F5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB50	proc far
		jmp	PlayerComponentVariantAC_ConstructAndInit_A51F5
VROOMM_StubThunk_6CB50	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4F68) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB55	proc far		; CODE XREF: seg082:loc_3B07BJ
					; seg082:0CC3J
					; DATA XREF: ...
		jmp	PlayerComponentVariantZ_ConstructAndInit_A4F68
VROOMM_StubThunk_6CB55	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5001) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB5A	proc far		; CODE XREF: seg082:0BF4J seg082:0CACJ
					; DATA XREF: ...
		jmp	PlayerComponentVariantAA_ConstructAndInit_A5001
VROOMM_StubThunk_6CB5A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A50BF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB5F	proc far		; CODE XREF: seg082:0BDDJ seg082:0C95J
					; DATA XREF: ...
		jmp	PlayerComponentVariantAB_ConstructAndInit_A50BF
VROOMM_StubThunk_6CB5F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A52B8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB64	proc far		; CODE XREF: PlayerComponent_ConstructAndLoadMassive_A5EB4:loc_A5EF2P
					; TriggerObject_ConstructSubobjects_A700F+38P
		jmp	AircraftDynamics_ReadStblChunk_A52B8
VROOMM_StubThunk_6CB64	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A55B9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB69	proc far		; CODE XREF: Ctor_CompositeObjectC_RebindPointers_4F91A+67P
					; PlayerComponent_LoadFieldsWithRetryL_A5C76+43P
		jmp	PlayerComponent_HelperE_A55B9
VROOMM_StubThunk_6CB69	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A55D0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB6E	proc far
		jmp	PlayerComponent_LoadFieldsWithRetryK_A55D0
VROOMM_StubThunk_6CB6E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A52FD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB73	proc far		; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+106P
					; JDYN_LoadChunkAndConstruct_3A49C:loc_3A97FP	...
		jmp	PlayerComponent_HelperD_A52FD
VROOMM_StubThunk_6CB73	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A5280) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB78	proc far
		jmp	PlayerComponentVariantAD_ConstructAndInit_A5280
VROOMM_StubThunk_6CB78	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A532A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB7D	proc far		; CODE XREF: seg082:0EF3J seg082:101EJ
					; DATA XREF: ...
		jmp	PlayerComponentVariantAE_ConstructAndInit_A532A
VROOMM_StubThunk_6CB7D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A53E3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB82	proc far		; CODE XREF: seg082:0EDCJ seg082:1007J
					; DATA XREF: ...
		jmp	PlayerComponentVariantAF_ConstructAndInit_A53E3
VROOMM_StubThunk_6CB82	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A54C8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33380h, codesize=0B0Ch, nentries=28.
; ==============================================================================================
VROOMM_StubThunk_6CB87	proc far		; CODE XREF: seg082:0EC5J seg082:0FF0J
					; DATA XREF: ...
		jmp	PlayerComponentVariantAG_ConstructAndInit_A54C8
VROOMM_StubThunk_6CB87	endp

seg325		ends
