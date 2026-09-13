seg324		segment	para public 'CODE' use16
		assume cs:seg324
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6CAA0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0B2Eo
		dw 0			; memswap
		dd 33280h		; fileoff
		dw 0EEh			; codesize
		dw 8			; relsize
		dw 6			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4A20) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33280h, codesize=0EEh, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6CAC0	proc far		; CODE XREF: PlayerComponent_SubHelperD_9FDAB:loc_9FDD2P
					; PlayerComponent_SubHelperK_A012B+17P ...
		jmp	AircraftDynamics_ReadMassChunk_A4A20
VROOMM_StubThunk_6CAC0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4ABC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33280h, codesize=0EEh, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6CAC5	proc far		; CODE XREF: Ctor_CompositeObjectC_RebindPointers_4F91A+18P
					; Ctor_CompositeObjectC_RebindPointers_4F91A+7CP ...
		jmp	PlayerComponent_Helper_A4ABC
VROOMM_StubThunk_6CAC5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4A88) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33280h, codesize=0EEh, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6CACA	proc far		; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+96P
					; JDYN_LoadChunkAndConstruct_3A49C+1CBP ...
		jmp	PlayerComponent_SubHelper_A4A88
VROOMM_StubThunk_6CACA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4AA6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33280h, codesize=0EEh, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6CACF	proc far		; CODE XREF: seg082:0021P seg109:0444P ...
		jmp	PlayerComponent_LoadFieldsWithRetryEVariant_A4AA6
VROOMM_StubThunk_6CACF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4A75) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33280h, codesize=0EEh, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6CAD4	proc far
		jmp	PlayerComponent_LoadFieldsWithRetryEWrapper_A4A75
VROOMM_StubThunk_6CAD4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4AED) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=33280h, codesize=0EEh, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6CAD9	proc far		; CODE XREF: seg082:05BAP
					; seg082:loc_3AC71P ...
		jmp	PlayerComponent_ReleaseVariant_A4AED
VROOMM_StubThunk_6CAD9	endp

seg324		ends
