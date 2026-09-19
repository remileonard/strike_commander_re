stub233		segment	para public 'CODE' use16
		assume cs:stub233
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6AC60	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0806o
		dw 0			; memswap
		dd 6890h		; fileoff
		dw 0A56h		; codesize
		dw 4Ch			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7A79E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=6890h, codesize=0A56h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6AC80	proc far		; CODE XREF: STRIKE_EXE_MAIN_LOOP+E6P
		jmp	UIScript_Helper_7A79E
VROOMM_StubThunk_6AC80	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7A054) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=6890h, codesize=0A56h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6AC85	proc far
		jmp	UIScript_ParseAndEvaluate_7A054
VROOMM_StubThunk_6AC85	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_79DA0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=6890h, codesize=0A56h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6AC8A	proc far
		jmp	Pilot_IssueControlCommand_79DA0
VROOMM_StubThunk_6AC8A	endp

stub233		ends
