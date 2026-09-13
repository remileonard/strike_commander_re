seg334		segment	para public 'CODE' use16
		assume cs:seg334
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6CE70	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A95Eo
		dw 0			; memswap
		dd 38100h		; fileoff
		dw 13BAh		; codesize
		dw 0B6h			; relsize
		dw 46			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA7E3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CE90	proc far		; DATA XREF: MissionScenario_Helper_AA687+Fo
		jmp	ExprSlot_ReleaseObjectAndFree_AA7E3
VROOMM_StubThunk_6CE90	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA7D4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CE95	proc far		; DATA XREF: MissionPlay_LoadScenes_AA595+97o
		jmp	ExprSlot_Helper10_AA7D4
VROOMM_StubThunk_6CE95	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9A7B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CE9A	proc far		; CODE XREF: Program_InitVideoFontArgs+19EP
		jmp	ExprSlot_ResetFieldsB_A9A7B
VROOMM_StubThunk_6CE9A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9A89) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CE9F	proc far		; CODE XREF: MissionScenario_LoadMainRecord_A8331+3B5P
		jmp	ExprSlot_ReleaseAndReloadDwordB_A9A89
VROOMM_StubThunk_6CE9F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9AEC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEA4	proc far		; CODE XREF: MissionScenario_ReleaseAllFields_A8049+64P
					; MissionScenario_ConstructFieldChain_A8124+6DP
		jmp	ExprSlot_ReleaseSingleB_A9AEC
VROOMM_StubThunk_6CEA4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA2F4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEA9	proc far		; CODE XREF: Program_InitVideoFontArgs+193P
		jmp	ExprSlot_Helper5_AA2F4
VROOMM_StubThunk_6CEA9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA307) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEAE	proc far
		jmp	ExprSlot_Helper6_AA307
VROOMM_StubThunk_6CEAE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA31D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEB3	proc far		; CODE XREF: MissionScenario_LoadMainRecord_A8331+405P
		jmp	ExprSlot_ReleaseAndReloadDwordD_AA31D
VROOMM_StubThunk_6CEB3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA37D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEB8	proc far		; CODE XREF: MissionScenario_ReleaseAllFields_A8049+70P
					; MissionScenario_ConstructFieldChain_A8124+61P
		jmp	ExprSlot_ReleaseSingleE_AA37D
VROOMM_StubThunk_6CEB8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9450) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEBD	proc far
		jmp	ExprSlot_LoadFieldGroup_A9450
VROOMM_StubThunk_6CEBD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A94E9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEC2	proc far
		jmp	ExprSlot_ReleaseAndLoad_A94E9
VROOMM_StubThunk_6CEC2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9565) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEC7	proc far
		jmp	ExprSlot_ReleaseAndLoadExtended_A9565
VROOMM_StubThunk_6CEC7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9690) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CECC	proc far
		jmp	ExprSlot_ReleaseAndLoadB_A9690
VROOMM_StubThunk_6CECC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9737) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CED1	proc far		; CODE XREF: Program_InitVideoFontArgs+142P
		jmp	ExprSlot_ResetFields_A9737
VROOMM_StubThunk_6CED1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A974A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CED6	proc far		; CODE XREF: MissionScenario_LoadMainRecord_A8331+2C8P
		jmp	ExprSlot_ConstructMain_A974A
VROOMM_StubThunk_6CED6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A98EC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEDB	proc far		; CODE XREF: MissionScenario_ReleaseAllFields_A8049+C4P
					; MissionScenario_ConstructFieldChain_A8124:loc_A8131P
		jmp	ExprSlot_ReleaseArray_A98EC
VROOMM_StubThunk_6CEDB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA6B3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEE0	proc far		; CODE XREF: Program_InitVideoFontArgs+14DP
		jmp	ExprSlot_Helper9_AA6B3
VROOMM_StubThunk_6CEE0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA6C9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEE5	proc far		; CODE XREF: MissionScenario_LoadMainRecord_A8331:loc_A8635P
		jmp	ExprSlot_LoadFieldGroupWithErrorCheck_AA6C9
VROOMM_StubThunk_6CEE5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA7A4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEEA	proc far		; CODE XREF: MissionScenario_ReleaseAllFields_A8049+B8P
					; MissionScenario_ConstructFieldChain_A8124+19P
		jmp	ExprSlot_ReleaseSingleF_AA7A4
VROOMM_StubThunk_6CEEA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA1AB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEEF	proc far		; CODE XREF: Program_InitVideoFontArgs+158P
		jmp	ExprSlot_Helper3_AA1AB
VROOMM_StubThunk_6CEEF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA1BE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEF4	proc far		; CODE XREF: MissionScenario_LoadMainRecord_A8331+33FP
		jmp	ExprSlot_AllocateAndReloadDword_AA1BE
VROOMM_StubThunk_6CEF4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA205) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEF9	proc far		; CODE XREF: MissionScenario_ReleaseAllFields_A8049+ACP
					; MissionScenario_ConstructFieldChain_A8124+25P
		jmp	ExprSlot_ReleaseObject_AA205
VROOMM_StubThunk_6CEF9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA0F7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CEFE	proc far		; CODE XREF: Program_InitVideoFontArgs+163P
		jmp	ExprSlot_Helper2_AA0F7
VROOMM_StubThunk_6CEFE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA10D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF03	proc far		; CODE XREF: MissionScenario_LoadMainRecord_A8331+37AP
		jmp	ExprSlot_ReleaseAndReloadDwordC_AA10D
VROOMM_StubThunk_6CF03	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA17B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF08	proc far		; CODE XREF: MissionScenario_ReleaseAllFields_A8049+A0P
					; MissionScenario_ConstructFieldChain_A8124+31P
		jmp	ExprSlot_ReleaseSingleC_AA17B
VROOMM_StubThunk_6CF08	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9956) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF0D	proc far		; CODE XREF: MissionScenario_LoadMainRecord_A8331+28DP
		jmp	ExprSlot_ReleaseAndReloadDword_A9956
VROOMM_StubThunk_6CF0D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9A44) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF12	proc far		; CODE XREF: MissionScenario_ReleaseAllFields_A8049+94P
					; MissionScenario_ConstructFieldChain_A8124+3DP
		jmp	ExprSlot_ReleaseSingle_A9A44
VROOMM_StubThunk_6CF12	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9DFD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF17	proc far
		jmp	ExprSlot_Helper_A9DFD
VROOMM_StubThunk_6CF17	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9E3C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF1C	proc far
		jmp	ExprSlot_LoadAndResolveNames_A9E3C
VROOMM_StubThunk_6CF1C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9FD0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF21	proc far		; CODE XREF: MissionScenario_LoadFromIFF_A8C44+2A1P
		jmp	MissionScenario_DispatchDecodeA_A9FD0
VROOMM_StubThunk_6CF21	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA04B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF26	proc far		; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+20BP
		jmp	MissionScenario_DispatchDecodeB_AA04B
VROOMM_StubThunk_6CF26	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA0C7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF2B	proc far		; CODE XREF: MissionScenario_LoadFromIFF_A8C44+257P
		jmp	MissionScenario_DispatchWrapper_AA0C7
VROOMM_StubThunk_6CF2B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA227) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF30	proc far		; CODE XREF: Program_InitVideoFontArgs+17DP
		jmp	ExprSlot_Helper4_AA227
VROOMM_StubThunk_6CF30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA23D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF35	proc far		; CODE XREF: MissionScenario_LoadMainRecord_A8331+440P
		jmp	ExprSlot_LoadAndResolveNamesWithErrorCheck_AA23D
VROOMM_StubThunk_6CF35	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA2C4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF3A	proc far		; CODE XREF: MissionScenario_ReleaseAllFields_A8049+88P
					; MissionScenario_ConstructFieldChain_A8124+49P
		jmp	ExprSlot_ReleaseSingleD_AA2C4
VROOMM_StubThunk_6CF3A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA3A5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF3F	proc far
		jmp	MissionScene_ParseRecord_AA3A5
VROOMM_StubThunk_6CF3F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA49A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF44	proc far
		jmp	ExprSlot_ReleaseObjectB_AA49A
VROOMM_StubThunk_6CF44	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA4BD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF49	proc far		; CODE XREF: UIScript_ParseAndEvaluate_7A054+554P
					; UIScript_ParseAndEvaluate_7A054+573P
		jmp	MissionScenario_ResolveMultipleFields_AA4BD
VROOMM_StubThunk_6CF49	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA56C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF4E	proc far		; CODE XREF: Program_InitVideoFontArgs+188P
		jmp	ExprSlot_Helper7_AA56C
VROOMM_StubThunk_6CF4E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA57F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF53	proc far
		jmp	ExprSlot_Helper8_AA57F
VROOMM_StubThunk_6CF53	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA595) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF58	proc far		; CODE XREF: MissionScenario_LoadMainRecord_A8331+4DEP
		jmp	MissionPlay_LoadScenes_AA595
VROOMM_StubThunk_6CF58	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA687) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF5D	proc far		; CODE XREF: MissionScenario_ReleaseAllFields_A8049+7CP
					; MissionScenario_ConstructFieldChain_A8124+55P
		jmp	MissionScenario_Helper_AA687
VROOMM_StubThunk_6CF5D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9B14) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF62	proc far
		jmp	MissionScenario_DecodeFieldA_A9B14
VROOMM_StubThunk_6CF62	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9BD8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF67	proc far
		jmp	MissionScenario_DecodeFieldB_A9BD8
VROOMM_StubThunk_6CF67	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9CC3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF6C	proc far		; CODE XREF: MissionScenario_LoadFromIFF_A8C44+22DP
		jmp	MissionScenario_LoadAndDecodeField_A9CC3
VROOMM_StubThunk_6CF6C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A9D66) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=38100h, codesize=13BAh, nentries=46.
; ==============================================================================================
VROOMM_StubThunk_6CF71	proc far		; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+224P
		jmp	ExprSlot_WriteFieldGroup_A9D66
VROOMM_StubThunk_6CF71	endp

seg334		ends
