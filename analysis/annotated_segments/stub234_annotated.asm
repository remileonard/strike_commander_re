stub234		segment	para public 'CODE' use16
		assume cs:stub234
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6AC90	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:080Eo
		dw 0			; memswap
		dd 7340h		; fileoff
		dw 1D3h			; codesize
		dw 12h			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7A836) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7340h, codesize=1D3h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6ACB0	proc far		; CODE XREF: seg015:057AP
					; Input_ReadMouseAndAxes_7AAF0+13BP
		jmp	AIManeuver_BuildRotationAndLookupB_7A836
VROOMM_StubThunk_6ACB0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7A800) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7340h, codesize=1D3h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6ACB5	proc far		; CODE XREF: seg015:064AP seg015:09C5P ...
		jmp	AIManeuver_BuildRotationAndLookup_7A800
VROOMM_StubThunk_6ACB5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7A90A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=7340h, codesize=1D3h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6ACBA	proc far		; CODE XREF: seg015:06F3P
					; Input_ProcessFrame_7A9E0+FDP ...
		jmp	AI_ApplyManeuverAngles_7A90A
VROOMM_StubThunk_6ACBA	endp

stub234		ends
