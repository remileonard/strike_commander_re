stub265		segment	para public 'CODE' use16
		assume cs:stub265
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B720	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A6E6o
		dw 0			; memswap
		dd 1C780h		; fileoff
		dw 87Dh			; codesize
		dw 0C8h			; relsize
		dw 6			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8F6F7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1C780h, codesize=87Dh, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6B740	proc far		; DATA XREF: InputSystem_InitAll_8F47A+92o
		jmp	InputSystem_Allocate_8F6F7
VROOMM_StubThunk_6B740	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8EEBC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1C780h, codesize=87Dh, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6B745	proc far		; CODE XREF: Config_ReadCalibration+11FP
					; TextRenderer_Main:loc_27C5DP
		jmp	Config_LoadAndApplySettings_8EEBC
VROOMM_StubThunk_6B745	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8F47A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1C780h, codesize=87Dh, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6B74A	proc far		; CODE XREF: TextRenderer_Main+2DFP
		jmp	InputSystem_InitAll_8F47A
VROOMM_StubThunk_6B74A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8F5E0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1C780h, codesize=87Dh, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6B74F	proc far		; CODE XREF: Dialog_Close+6FP
		jmp	InputSystem_ReleaseAll_8F5E0
VROOMM_StubThunk_6B74F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8F69E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1C780h, codesize=87Dh, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6B754	proc far		; CODE XREF: seg047:03B2P
		jmp	InputSystem_ReleaseBlock_8F69E
VROOMM_StubThunk_6B754	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8EEA0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1C780h, codesize=87Dh, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6B759	proc far		; CODE XREF: Cockpit_ReadControlsFrame_8F720+9BP
		jmp	Joystick_GetAxisMaxWrapper_8EEA0
VROOMM_StubThunk_6B759	endp

stub265		ends
