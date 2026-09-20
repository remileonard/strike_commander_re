seg309		segment	para public 'CODE' use16
		assume cs:seg309
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C360	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A896o
		dw 0			; memswap
		dd 2C2E0h		; fileoff
		dw 1C61h		; codesize
		dw 92h			; relsize
		dw 39			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9DE60) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C380	proc far		; CODE XREF: Weapon_LoadWDATChunk_A0700+61P
		jmp	WeaponId_ToTypeMask_9DE60
VROOMM_StubThunk_6C380	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9DF63) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C385	proc far
		jmp	PlayerComponent_LoadFromResourceRecord_9DF63
VROOMM_StubThunk_6C385	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9DF2A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C38A	proc far
		jmp	PlayerComponent_ReadFieldAndDispatch_9DF2A
VROOMM_StubThunk_6C38A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9DED3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C38F	proc far
		jmp	PlayerComponent_ApplyExternalCall_9DED3
VROOMM_StubThunk_6C38F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9DFC5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C394	proc far		; CODE XREF: SwpnModel_LoadDataChunk_A0A00+A8P
		jmp	PlayerComponent_ReleaseAndReload_9DFC5
VROOMM_StubThunk_6C394	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9E289) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C399	proc far		; CODE XREF: HUD_RenderSymbologyMain+C47P
					; HUD_RenderSymbologyMain+CE9P ...
		jmp	TimedTrigger_SpawnAndBindGeometry_9E289
VROOMM_StubThunk_6C399	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9E651) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C39E	proc far		; CODE XREF: HUD_RenderSymbologyMain+101AP
					; HUD_RenderSymbologyAlt+591P ...
		jmp	PlayerComponent_Helper_9E651
VROOMM_StubThunk_6C39E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9E682) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3A3	proc far
		jmp	PlayerComponent_LoadTripleField_9E682
VROOMM_StubThunk_6C3A3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9E58E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3A8	proc far
		jmp	PlayerComponent_ReleaseHelper_9E58E
VROOMM_StubThunk_6C3A8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9E77F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3AD	proc far
		jmp	PlayerComponent_ComputeDerived_9E77F
VROOMM_StubThunk_6C3AD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9E812) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3B2	proc far
		jmp	PlayerComponent_ComputeComplex_9E812
VROOMM_StubThunk_6C3B2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9E731) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3B7	proc far
		jmp	PlayerComponent_ApplyExternalHelper_9E731
VROOMM_StubThunk_6C3B7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9EA2E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3BC	proc far
		jmp	PlayerComponent_ComputeComplexB_9EA2E
VROOMM_StubThunk_6C3BC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F1D0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3C1	proc far
		jmp	PlayerComponent_HelperVariantA_9F1D0
VROOMM_StubThunk_6C3C1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9EC4D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3C6	proc far
		jmp	PlayerComponent_DispatchPair_9EC4D
VROOMM_StubThunk_6C3C6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F4D3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3CB	proc far
		jmp	PlayerComponent_HelperVariantE_9F4D3
VROOMM_StubThunk_6C3CB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9ED62) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3D0	proc far
		jmp	PlayerComponent_Dispatch_9ED62
VROOMM_StubThunk_6C3D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9EF74) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3D5	proc far		; CODE XREF: MissionScenario_DispatchWrapper_AA0C7+26P
		jmp	PlayerComponent_LoadSequence_9EF74
VROOMM_StubThunk_6C3D5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9EFBE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3DA	proc far		; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+4BBP
		jmp	PlayerComponent_ConstructFromStream_9EFBE
VROOMM_StubThunk_6C3DA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F07F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3DF	proc far
		jmp	PlayerComponent_LoadMultiField_9F07F
VROOMM_StubThunk_6C3DF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9EDD4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3E4	proc far
		jmp	PlayerComponent_LoadAndApply_9EDD4
VROOMM_StubThunk_6C3E4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F286) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3E9	proc far		; CODE XREF: MissionScenario_DispatchDecodeA_A9FD0+70P
		jmp	PlayerComponent_OrchestrateComplex_9F286
VROOMM_StubThunk_6C3E9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F434) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3EE	proc far		; CODE XREF: MissionScenario_DispatchDecodeA_A9FD0+2DP
		jmp	PlayerComponent_HelperVariantD_9F434
VROOMM_StubThunk_6C3EE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F4ED) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3F3	proc far
		jmp	PlayerComponent_FullReleaseAndLoad_9F4ED
VROOMM_StubThunk_6C3F3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F6EA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3F8	proc far		; CODE XREF: Camera_ConstructWithSecondaryFlag_9D3BA+BBP
					; Camera_ConstructWithHandle_9D610+101P
		jmp	PlayerComponent_ReleaseAndReload_9F6EA
VROOMM_StubThunk_6C3F8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F698) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C3FD	proc far
		jmp	PlayerComponent_ReleaseAndDispatch_9F698
VROOMM_StubThunk_6C3FD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9EC8A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C402	proc far
		jmp	PlayerComponent_SetReferenceHelper_9EC8A
VROOMM_StubThunk_6C402	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9ED43) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C407	proc far
		jmp	PlayerComponent_Helper_9ED43
VROOMM_StubThunk_6C407	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F873) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C40C	proc far		; CODE XREF: Camera_DestructCompoundA+20P
					; Camera_DestructCompoundB+19P
		jmp	PlayerComponent_ReleaseFull_9F873
VROOMM_StubThunk_6C40C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F82C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C411	proc far
		jmp	PlayerComponent_ReleaseHelperB_9F82C
VROOMM_StubThunk_6C411	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F760) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C416	proc far
		jmp	PlayerComponent_HelperVariantF_9F760
VROOMM_StubThunk_6C416	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F784) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C41B	proc far		; CODE XREF: Gauge_ComputeAndRenderNeedle_9D910+366P
		jmp	PlayerComponent_FormatAndDisplay_9F784
VROOMM_StubThunk_6C41B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F212) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C420	proc far
		jmp	PlayerComponent_HelperVariantB_9F212
VROOMM_StubThunk_6C420	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F24C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C425	proc far
		jmp	PlayerComponent_HelperVariantC_9F24C
VROOMM_StubThunk_6C425	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F92A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C42A	proc far		; CODE XREF: Player_MainUpdate+304P
					; seg014:0097P	...
		jmp	PlayerComponent_UpdateFromCache_9F92A
VROOMM_StubThunk_6C42A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9E027) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C42F	proc far		; CODE XREF: HUD_RenderSymbologyAlt+19DP
		jmp	PlayerComponent_ComputeGeometryComplex_9E027
VROOMM_StubThunk_6C42F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9F98D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C434	proc far		; CODE XREF: HUD_RenderSymbologyMain+C8EP
					; HUD_RenderSymbologyAlt+219P ...
		jmp	PlayerComponent_MainOrchestrator_9F98D
VROOMM_StubThunk_6C434	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9FA4E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C439	proc far		; CODE XREF: UIScreen_RenderOrLayoutList_54503+25P
		jmp	PlayerComponent_TopLevelEntry_9FA4E
VROOMM_StubThunk_6C439	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9EBD7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2C2E0h, codesize=1C61h, nentries=39.
; ==============================================================================================
VROOMM_StubThunk_6C43E	proc far		; CODE XREF: Camera_Helper2_9D380+2FP
		jmp	PlayerComponent_ReleaseAndLoad_9EBD7
VROOMM_StubThunk_6C43E	endp

seg309		ends
