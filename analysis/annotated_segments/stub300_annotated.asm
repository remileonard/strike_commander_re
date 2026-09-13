stub300		segment	para public 'CODE' use16
		assume cs:stub300
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BF40	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0A1Eo
		dw 0			; memswap
		dd 29700h		; fileoff
		dw 259h			; codesize
		dw 28h			; relsize
		dw 7			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B4A0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29700h, codesize=259h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6BF60	proc far
		jmp	Debris_ConstructWithFormation_9B4A0
VROOMM_StubThunk_6BF60	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B4DE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29700h, codesize=259h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6BF65	proc far		; CODE XREF: WorldObject_ApplyOrientationAndFilter_9D020+BP
					; DATA XREF: seg339:off_6EBACo	...
		jmp	Debris_ConstructWithRotation_9B4DE
VROOMM_StubThunk_6BF65	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B57E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29700h, codesize=259h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6BF6A	proc far		; CODE XREF: AI_ComputeGeometryWrapper_9D095+1EP
					; DATA XREF: seg339:off_6EBB0o	...
		jmp	Debris_ReleaseForceBufferWrapper_9B57E
VROOMM_StubThunk_6BF6A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B5BD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29700h, codesize=259h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6BF6F	proc far		; CODE XREF: Debris_LoadAndSpawnFromRecord_9B8E0+12AP
					; PlayerComponent_ComputeComplex_9E812+1EFP
		jmp	Debris_ConstructWithTorque_9B5BD
VROOMM_StubThunk_6BF6F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B62B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29700h, codesize=259h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6BF74	proc far		; CODE XREF: Debris_InstantiateFromParent+A6P
					; PlayerComponent_ApplyExternalHelper_9E731+2DP
		jmp	Debris_ContainerOpWrapper_9B62B
VROOMM_StubThunk_6BF74	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B649) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29700h, codesize=259h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6BF79	proc far
		jmp	Debris_ConstructWithTorqueB_9B649
VROOMM_StubThunk_6BF79	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B6C5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29700h, codesize=259h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6BF7E	proc far
		jmp	Debris_ContainerCompareAndOp_9B6C5
VROOMM_StubThunk_6BF7E	endp

stub300		ends
