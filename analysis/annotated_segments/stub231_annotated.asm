stub231		segment	para public 'CODE' use16
		assume cs:stub231
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6ABB0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:07F6o
		dw 0			; memswap
		dd 3A30h		; fileoff
		dw 0DC6h		; codesize
		dw 44h			; relsize
		dw 7			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_775B1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A30h, codesize=0DC6h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6ABD0	proc far
		jmp	AI_TransformTargetVector_775B1
VROOMM_StubThunk_6ABD0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_776FB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A30h, codesize=0DC6h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6ABD5	proc far
		jmp	AI_WeaponEngagementCycle_776FB
VROOMM_StubThunk_6ABD5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_77171) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A30h, codesize=0DC6h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6ABDA	proc far
		jmp	AI_IssueTurnAndThrottle_77171
VROOMM_StubThunk_6ABDA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_77282) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A30h, codesize=0DC6h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6ABDF	proc far
		jmp	AI_ComputeGuidanceSolution_77282
VROOMM_StubThunk_6ABDF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_77215) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A30h, codesize=0DC6h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6ABE4	proc far		; DATA XREF: seg339:016Co
		jmp	AI_TargetTrackHelper_77215
VROOMM_StubThunk_6ABE4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_77000) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A30h, codesize=0DC6h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6ABE9	proc far		; DATA XREF: seg339:0164o
		jmp	MVRS_ID14_ScoreWeaponReadiness_77000
VROOMM_StubThunk_6ABE9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7709A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A30h, codesize=0DC6h, nentries=7.
; ==============================================================================================
VROOMM_StubThunk_6ABEE	proc far		; DATA XREF: seg339:0168o
		jmp	MVRS_ID14_ApplyWeaponTracking_7709A
VROOMM_StubThunk_6ABEE	endp

stub231		ends
