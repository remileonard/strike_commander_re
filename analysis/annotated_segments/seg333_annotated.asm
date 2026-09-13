seg333		segment	para public 'CODE' use16
		assume cs:seg333
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6CDF0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0B76o
		dw 0			; memswap
		dd 36B30h		; fileoff
		dw 1460h		; codesize
		dw 15Ch			; relsize
		dw 18			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9418) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE10	proc far		; DATA XREF: seg339:off_70771o
		jmp	MissionScenario_ReleaseStreamB_A9418
VROOMM_StubThunk_6CE10	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A93E0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE15	proc far		; DATA XREF: seg339:off_70759o
		jmp	MissionScenario_ReleaseStreamA_A93E0
VROOMM_StubThunk_6CE15	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A7FF0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE1A	proc far		; CODE XREF: UIScript_ParseAndEvaluate_7A054+1E1P
		jmp	MissionScenario_QueryFieldWrapper_A7FF0
VROOMM_StubThunk_6CE1A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A8B8F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE1F	proc far
		jmp	MissionScenario_ConvertFieldValue_A8B8F
VROOMM_StubThunk_6CE1F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A8A40) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE24	proc far		; CODE XREF: Expr_LookupNamedValue_52D08+BP
		jmp	MissionScenario_Helper_A8A40
VROOMM_StubThunk_6CE24	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A8BA9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE29	proc far		; CODE XREF: Expr_ResolveBuiltinCallSite_7E81D+8FP
		jmp	MissionScenario_ResolveFieldEntryB_A8BA9
VROOMM_StubThunk_6CE29	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A8BD1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE2E	proc far		; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94:loc_53CD3P
					; Expr_ResolveBuiltinCallSite_7E81D+119P
		jmp	MissionScenario_ResolveFieldChain_A8BD1
VROOMM_StubThunk_6CE2E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A8225) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE33	proc far
		jmp	MissionScenario_LoadFieldGroup_A8225
VROOMM_StubThunk_6CE33	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A8124) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE38	proc far
		jmp	MissionScenario_ConstructFieldChain_A8124
VROOMM_StubThunk_6CE38	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A81E0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE3D	proc far		; CODE XREF: UIScreen_Construct_53896+125P
		jmp	MissionScenario_ConstructAndBindUI_A81E0
VROOMM_StubThunk_6CE3D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A82B0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE42	proc far		; CODE XREF: Program_InitVideoFontArgs+1D9P
		jmp	MissionScenario_ReleaseAndStoreField_A82B0
VROOMM_StubThunk_6CE42	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A8331) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE47	proc far		; CODE XREF: Program_InitVideoFontArgs+1F1P
		jmp	MissionScenario_LoadMainRecord_A8331
VROOMM_StubThunk_6CE47	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A8049) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE4C	proc far		; CODE XREF: Program_InitVideoFontArgs+221P
		jmp	MissionScenario_ReleaseAllFields_A8049
VROOMM_StubThunk_6CE4C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A8C44) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE51	proc far		; CODE XREF: Program_InitVideoFontArgs+200P
		jmp	MissionScenario_LoadFromIFF_A8C44
VROOMM_StubThunk_6CE51	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A8F22) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE56	proc far
		jmp	MissionScenario_ResolveAndBindExpressions_A8F22
VROOMM_StubThunk_6CE56	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9382) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE5B	proc far		; CODE XREF: UIScreen_Construct_53896+1E9P
		jmp	MissionScenario_RecomputeFields_A9382
VROOMM_StubThunk_6CE5B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A8A87) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE60	proc far		; CODE XREF: UIScript_ParseAndEvaluate_7A054+2EP
		jmp	MissionScenario_QueryAndResolve_A8A87
VROOMM_StubThunk_6CE60	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A8B37) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=36B30h, codesize=1460h, nentries=18.
; ==============================================================================================
VROOMM_StubThunk_6CE65	proc far
		jmp	MissionScenario_ResolveFieldEntry_A8B37
VROOMM_StubThunk_6CE65	endp

seg333		ends
