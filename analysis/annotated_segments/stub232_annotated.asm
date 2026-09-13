stub232		segment	para public 'CODE' use16
		assume cs:stub232
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6AC00	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:07FEo
		dw 0			; memswap
		dd 4840h		; fileoff
		dw 1FC2h		; codesize
		dw 82h			; relsize
		dw 12			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_79D88) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=4840h, codesize=1FC2h, nentries=12.
; ==============================================================================================
VROOMM_StubThunk_6AC20	proc far		; DATA XREF: seg339:04A0o seg339:04F5o ...
		jmp	AI_ManeuverHelper3_79D88
VROOMM_StubThunk_6AC20	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_79D7A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=4840h, codesize=1FC2h, nentries=12.
; ==============================================================================================
VROOMM_StubThunk_6AC25	proc far		; DATA XREF: seg339:047Co
		jmp	AI_ManeuverHelper2_79D7A
VROOMM_StubThunk_6AC25	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_79CFF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=4840h, codesize=1FC2h, nentries=12.
; ==============================================================================================
VROOMM_StubThunk_6AC2A	proc far		; DATA XREF: seg339:off_6D51Co
		jmp	AI_ManeuverCleanup_79CFF
VROOMM_StubThunk_6AC2A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_79CF7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=4840h, codesize=1FC2h, nentries=12.
; ==============================================================================================
VROOMM_StubThunk_6AC2F	proc far		; DATA XREF: seg339:0458o
		jmp	AI_ManeuverHelper_79CF7
VROOMM_StubThunk_6AC2F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_77E78) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=4840h, codesize=1FC2h, nentries=12.
; ==============================================================================================
VROOMM_StubThunk_6AC34	proc far
		jmp	AIManeuver_LoadFormationData_77E78
VROOMM_StubThunk_6AC34	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_780A5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=4840h, codesize=1FC2h, nentries=12.
; ==============================================================================================
VROOMM_StubThunk_6AC39	proc far
		jmp	AIManeuver_Helper_780A5
VROOMM_StubThunk_6AC39	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_77FCA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=4840h, codesize=1FC2h, nentries=12.
; ==============================================================================================
VROOMM_StubThunk_6AC3E	proc far		; CODE XREF: Kneeboard_RenderEntry+189P
		jmp	AIManeuver_LoadFormationDataB_77FCA
VROOMM_StubThunk_6AC3E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_77DD0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=4840h, codesize=1FC2h, nentries=12.
; ==============================================================================================
VROOMM_StubThunk_6AC43	proc far
		jmp	AIManeuver_AllocateField_77DD0
VROOMM_StubThunk_6AC43	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7818E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=4840h, codesize=1FC2h, nentries=12.
; ==============================================================================================
VROOMM_StubThunk_6AC48	proc far		; DATA XREF: seg339:off_6D510o
		jmp	AIManeuver_Helper3_7818E
VROOMM_StubThunk_6AC48	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_781BC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=4840h, codesize=1FC2h, nentries=12.
; ==============================================================================================
VROOMM_StubThunk_6AC4D	proc far		; DATA XREF: seg339:0464o
		jmp	AIManeuver_Helper4_781BC
VROOMM_StubThunk_6AC4D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_781D0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=4840h, codesize=1FC2h, nentries=12.
; ==============================================================================================
VROOMM_StubThunk_6AC52	proc far		; DATA XREF: seg339:off_6D520o
		jmp	CameraScript_ExecuteCOMP_781D0
VROOMM_StubThunk_6AC52	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_78184) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=4840h, codesize=1FC2h, nentries=12.
; ==============================================================================================
VROOMM_StubThunk_6AC57	proc far		; DATA XREF: seg339:0474o
		jmp	AIManeuver_Helper2_78184
VROOMM_StubThunk_6AC57	endp

stub232		ends
