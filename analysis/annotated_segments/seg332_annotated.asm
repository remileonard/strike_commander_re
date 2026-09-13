seg332		segment	para public 'CODE' use16
		assume cs:seg332
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6CD80	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0B6Eo
		dw 0			; memswap
		dd 36060h		; fileoff
		dw 0A17h		; codesize
		dw 0A8h			; relsize
		dw 13			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A78AD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36060h, codesize=0A17h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CDA0	proc far
		jmp	MissionLoader_LoadWaypoint_A78AD
VROOMM_StubThunk_6CDA0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7B1E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36060h, codesize=0A17h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CDA5	proc far
		jmp	MissionLoader_SpawnEntity_A7B1E
VROOMM_StubThunk_6CDA5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A78F5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36060h, codesize=0A17h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CDAA	proc far
		jmp	MissionLoader_LoadFormation_A78F5
VROOMM_StubThunk_6CDAA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7C8E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36060h, codesize=0A17h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CDAF	proc far
		jmp	MissionLoader_LoadChunkA_A7C8E
VROOMM_StubThunk_6CDAF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7A10) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36060h, codesize=0A17h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CDB4	proc far
		jmp	MissionLoader_LoadPosition_A7A10
VROOMM_StubThunk_6CDB4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7CA1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36060h, codesize=0A17h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CDB9	proc far
		jmp	MissionLoader_LoadChunkB_A7CA1
VROOMM_StubThunk_6CDB9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7D46) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36060h, codesize=0A17h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CDBE	proc far		; CODE XREF: MissionScenario_RecomputeFields_A9382+56P
		jmp	MissionLoader_AssignUnitRoster_A7D46
VROOMM_StubThunk_6CDBE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7E3B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36060h, codesize=0A17h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CDC3	proc far		; CODE XREF: MissionScenario_ConstructAndBindUI_A81E0+7P
		jmp	MissionLoader_AssignUnitRosterB_A7E3B
VROOMM_StubThunk_6CDC3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A767F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36060h, codesize=0A17h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CDC8	proc far		; CODE XREF: MissionScenario_LoadMainRecord_A8331+24EP
		jmp	World_ParseWrldForm_A767F
VROOMM_StubThunk_6CDC8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A75D0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36060h, codesize=0A17h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CDCD	proc far		; CODE XREF: MissionScenario_LoadMainRecord_A8331+232P
		jmp	World_OpenAndParseFile_A75D0
VROOMM_StubThunk_6CDCD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7F16) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36060h, codesize=0A17h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CDD2	proc far
		jmp	MissionLoader_ReleaseRosterAndDestruct_A7F16
VROOMM_StubThunk_6CDD2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7F3A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36060h, codesize=0A17h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CDD7	proc far		; CODE XREF: UIScreen_Construct_53896+10P
		jmp	MissionLoader_QueryAndReleaseAttribute_A7F3A
VROOMM_StubThunk_6CDD7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7FD0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36060h, codesize=0A17h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CDDC	proc far		; DATA XREF: seg339:4E58o
		jmp	MissionLoader_Helper_A7FD0
VROOMM_StubThunk_6CDDC	endp

seg332		ends
