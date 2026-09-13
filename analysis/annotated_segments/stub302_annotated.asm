stub302		segment	para public 'CODE' use16
		assume cs:stub302
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BFD0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0A2Eo
		dw 0			; memswap
		dd 29A70h		; fileoff
		dw 7CCh			; codesize
		dw 64h			; relsize
		dw 9			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9BF8E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29A70h, codesize=7CCh, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6BFF0	proc far		; DATA XREF: seg339:off_6EC1Bo
		jmp	Debris_ReleaseFree_9BF8E
VROOMM_StubThunk_6BFF0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9BF6A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29A70h, codesize=7CCh, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6BFF5	proc far		; DATA XREF: Debris_LoadFieldMix_9BA85+2CFo
		jmp	Debris_ConstructEmptyWithFormation_9BF6A
VROOMM_StubThunk_6BFF5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9BA29) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29A70h, codesize=7CCh, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6BFFA	proc far		; CODE XREF: IFF_LoadModelMain+1DFP
					; IFF_LoadModelMain+26AP ...
		jmp	Debris_Helper3_9BA29
VROOMM_StubThunk_6BFFA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9BA85) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29A70h, codesize=7CCh, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6BFFF	proc far		; CODE XREF: IFF_LoadModelMain+164P
					; IFF_LoadAngleParam+1CP ...
		jmp	Debris_LoadFieldMix_9BA85
VROOMM_StubThunk_6BFFF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9BDE9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29A70h, codesize=7CCh, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6C004	proc far		; CODE XREF: IFF_LoadModelMain+F02P
		jmp	Debris_LoadFieldMixB_9BDE9
VROOMM_StubThunk_6C004	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B7E0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29A70h, codesize=7CCh, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6C009	proc far		; CODE XREF: seg083:0FCEP
					; seg083:loc_3C883P ...
		jmp	Debris_ReleaseAllParticles_9B7E0
VROOMM_StubThunk_6C009	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B8E0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29A70h, codesize=7CCh, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6C00E	proc far		; CODE XREF: seg079:0062P
					; seg084:loc_3C9AFP ...
		jmp	Debris_LoadAndSpawnFromRecord_9B8E0
VROOMM_StubThunk_6C00E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9BF1D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29A70h, codesize=7CCh, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6C013	proc far		; CODE XREF: IFF_LoadModelMain+F0FP
		jmp	Debris_ListAllocateAndInsert_9BF1D
VROOMM_StubThunk_6C013	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9BECD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29A70h, codesize=7CCh, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6C018	proc far		; CODE XREF: MissionScenario_ReleaseAllFields_A8049+1CP
		jmp	Debris_ListFindAndDispatch_9BECD
VROOMM_StubThunk_6C018	endp

stub302		ends
