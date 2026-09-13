stub239		segment	para public 'CODE' use16
		assume cs:stub239
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6AD80	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A616o
		dw 0			; memswap
		dd 7A50h		; fileoff
		dw 2422h		; codesize
		dw 10Ch			; relsize
		dw 8			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7D2D1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7A50h, codesize=2422h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6ADA0	proc far		; DATA XREF: seg339:04E5o
		jmp	MissionRecord_ReleaseEntryB_7D2D1
VROOMM_StubThunk_6ADA0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7D27E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7A50h, codesize=2422h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6ADA5	proc far		; DATA XREF: TextObjectCluster_DestructAll_5ABD1+3Co
					; MissionRecord_LoadEntityDatabase_7B035+901o ...
		jmp	MissionRecord_ReleaseEntry_7D27E
VROOMM_StubThunk_6ADA5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7D249) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7A50h, codesize=2422h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6ADAA	proc far		; DATA XREF: TextRenderer_Main+8A9o
					; MissionRecord_LoadEntityDatabase_7B035+5EAo ...
		jmp	MissionRecord_Helper_7D249
VROOMM_StubThunk_6ADAA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7AEE0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7A50h, codesize=2422h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6ADAF	proc far		; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+CBP
		jmp	AIManeuver_LoadFormationDataC_7AEE0
VROOMM_StubThunk_6ADAF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7AF9E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7A50h, codesize=2422h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6ADB4	proc far		; DATA XREF: seg339:04EDo
		jmp	AIManeuver_Helper5_7AF9E
VROOMM_StubThunk_6ADB4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7AFCA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7A50h, codesize=2422h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6ADB9	proc far		; DATA XREF: seg339:04F1o seg339:0521o
		jmp	Camera_UpdateAndNotify_7AFCA
VROOMM_StubThunk_6ADB9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7AFA8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7A50h, codesize=2422h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6ADBE	proc far		; CODE XREF: MissionRecord_LoadAndBuildWidgetTree_7D31A+115P
		jmp	Kneeboard_UpdateEntry_7AFA8
VROOMM_StubThunk_6ADBE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7B035) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7A50h, codesize=2422h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6ADC3	proc far		; CODE XREF: UIScreen_Construct_53896+3CP
		jmp	MissionRecord_LoadEntityDatabase_7B035
VROOMM_StubThunk_6ADC3	endp

stub239		ends
