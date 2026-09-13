seg331		segment	para public 'CODE' use16
		assume cs:seg331
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6CD10	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0B66o
		dw 0			; memswap
		dd 35AA0h		; fileoff
		dw 565h			; codesize
		dw 4Ch			; relsize
		dw 15			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A758F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD30	proc far		; DATA XREF: TextCycler_Helper_A7408+46o
		jmp	TextCycler_AllocateB_A758F
VROOMM_StubThunk_6CD30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7566) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD35	proc far		; DATA XREF: TextCycler_AdvanceRandomA_A7245:loc_A7277o
					; TextCycler_AdvanceRandomB_A730E:loc_A7332o	...
		jmp	TextCycler_AllocateA_A7566
VROOMM_StubThunk_6CD35	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7060) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD3A	proc far		; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+E7P
		jmp	TextCycler_ReleaseEntry_A7060
VROOMM_StubThunk_6CD3A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A71E5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD3F	proc far		; CODE XREF: Terrain_SectorResolveChecked+64P
		jmp	TextCycler_ReleaseBuffer_A71E5
VROOMM_StubThunk_6CD3F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A70B7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD44	proc far		; CODE XREF: Terrain_SectorIndexResolve+CDP
		jmp	TextCycler_ReadTypedEntry_A70B7
VROOMM_StubThunk_6CD44	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A713E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD49	proc far
		jmp	TextCycler_LoadFromIndexedReader_A713E
VROOMM_StubThunk_6CD49	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A721F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD4E	proc far		; DATA XREF: TextCycler_ReleaseAndReset_A73BA+1Do
					; TextCycler_Helper2_A74E3+6o
		jmp	TextCycler_ReleaseEntryConditional_A721F
VROOMM_StubThunk_6CD4E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7245) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD53	proc far		; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+165P
		jmp	TextCycler_AdvanceRandomA_A7245
VROOMM_StubThunk_6CD53	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A730E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD58	proc far
		jmp	TextCycler_AdvanceRandomB_A730E
VROOMM_StubThunk_6CD58	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A73BA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD5D	proc far		; DATA XREF: TextCycler_Helper2_A74E3+23o
		jmp	TextCycler_ReleaseAndReset_A73BA
VROOMM_StubThunk_6CD5D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7408) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD62	proc far		; CODE XREF: AircraftComponent_LoadFieldGroupPair_95E20+66P
					; AircraftComponent_LoadSubrecord_95FD0:loc_960B9P	...
		jmp	TextCycler_Helper_A7408
VROOMM_StubThunk_6CD62	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A746E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD67	proc far		; CODE XREF: AircraftComponent_LoadFieldGroupA_96590+34P
					; TextureLoader_OpenAndLoadFull_98A60+1CAP ...
		jmp	TextCycler_LoadWithErrorCheck_A746E
VROOMM_StubThunk_6CD67	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A74A5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD6C	proc far		; CODE XREF: AircraftComponent_LoadFieldGroupAB_965E0+4DP
					; TextureLoader_OpenAndLoadFull_98A60:loc_98C60P	...
		jmp	TextCycler_AdvanceRandomBWithErrorCheck_A74A5
VROOMM_StubThunk_6CD6C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A74E3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD71	proc far		; CODE XREF: Terrain_FormatAndReleaseReader_9B1FC+3BP
					; Terrain_FormatAndReleaseReader_9B1FC+83P
		jmp	TextCycler_Helper2_A74E3
VROOMM_StubThunk_6CD71	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7538) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=35AA0h, codesize=565h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6CD76	proc far		; CODE XREF: seg068:0648P seg075:036AP ...
		jmp	TextCycler_ReleaseResource_A7538
VROOMM_StubThunk_6CD76	endp

seg331		ends
