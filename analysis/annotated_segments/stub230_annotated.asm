stub230		segment	para public 'CODE' use16
		assume cs:stub230
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6AB60	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:07EEo
		dw 0			; memswap
		dd 20C0h		; fileoff
		dw 18C9h		; codesize
		dw 98h			; relsize
		dw 9			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_75D51) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=20C0h, codesize=18C9h, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6AB80	proc far
		jmp	AITargeting_ComputeSolution_75D51
VROOMM_StubThunk_6AB80	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_75AA6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=20C0h, codesize=18C9h, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6AB85	proc far
		jmp	AITargeting_ComputeGeometry_75AA6
VROOMM_StubThunk_6AB85	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_76325) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=20C0h, codesize=18C9h, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6AB8A	proc far
		jmp	AITargeting_ComputeOrientation_76325
VROOMM_StubThunk_6AB8A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_765B2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=20C0h, codesize=18C9h, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6AB8F	proc far
		jmp	AITargeting_ComputeOrientationExtended_765B2
VROOMM_StubThunk_6AB8F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_76C09) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=20C0h, codesize=18C9h, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6AB94	proc far
		jmp	AITargeting_Helper2_76C09
VROOMM_StubThunk_6AB94	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_76E67) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=20C0h, codesize=18C9h, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6AB99	proc far
		jmp	AITargeting_ApplyRangeCheck_76E67
VROOMM_StubThunk_6AB99	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_75C18) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=20C0h, codesize=18C9h, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6AB9E	proc far		; DATA XREF: seg339:off_6D3E2o
		jmp	AITargeting_UpdateAndRender_75C18
VROOMM_StubThunk_6AB9E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_75730) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=20C0h, codesize=18C9h, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6ABA3	proc far		; DATA XREF: seg339:032Ao
		jmp	AITargeting_Helper_75730
VROOMM_StubThunk_6ABA3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_75746) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=20C0h, codesize=18C9h, nentries=9.
; ==============================================================================================
VROOMM_StubThunk_6ABA8	proc far		; DATA XREF: seg339:032Eo
		jmp	AITargeting_RenderThreatList_75746
VROOMM_StubThunk_6ABA8	endp

stub230		ends
