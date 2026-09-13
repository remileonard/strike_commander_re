seg330		segment	para public 'CODE' use16
		assume cs:seg330
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6CCD0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0B5Eo
		dw 0			; memswap
		dd 356B0h		; fileoff
		dw 3BEh			; codesize
		dw 24h			; relsize
		dw 5			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6CA0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=356B0h, codesize=3BEh, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6CCF0	proc far		; CODE XREF: IFF_LoadModelMain+ECFP
		jmp	PlayerComponent_LoadDataChunk_A6CA0
VROOMM_StubThunk_6CCF0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6D18) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=356B0h, codesize=3BEh, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6CCF5	proc far		; DATA XREF: seg339:off_6F458o
		jmp	TriggerObject_Construct_A6D18
VROOMM_StubThunk_6CCF5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6DA2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=356B0h, codesize=3BEh, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6CCFA	proc far
		jmp	TriggerObject_InitDerived_A6DA2
VROOMM_StubThunk_6CCFA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A6DF2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=356B0h, codesize=3BEh, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6CCFF	proc far		; CODE XREF: AI_MissileThreatTrigger_A+110P
					; MissionRecord_LoadAndBuildWidgetTree_7D31A+66DP ...
		jmp	TriggerObject_SpawnAndBindFull_A6DF2
VROOMM_StubThunk_6CCFF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A700F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=356B0h, codesize=3BEh, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6CD04	proc far		; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+505P
		jmp	TriggerObject_ConstructSubobjects_A700F
VROOMM_StubThunk_6CD04	endp

seg330		ends
