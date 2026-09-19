stub268		segment	para public 'CODE' use16
		assume cs:stub268
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B810	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:091Eo
		dw 0			; memswap
		dd 1F6F0h		; fileoff
		dw 12EEh		; codesize
		dw 0F2h			; relsize
		dw 4			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_91B70) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1F6F0h, codesize=12EEh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B830	proc far
		jmp	Cockpit_ApplyFormatAndDraw_91B70
VROOMM_StubThunk_6B830	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_926A5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1F6F0h, codesize=12EEh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B835	proc far		; CODE XREF: Expr_Node_EvaluateVisibility_53586+163P
					; STRIKE_EXE_MAIN_LOOP:loc_538F1P	...
		jmp	Cockpit_LoadAndApplyEncoding_926A5
VROOMM_StubThunk_6B835	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_91D29) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1F6F0h, codesize=12EEh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B83A	proc far		; CODE XREF: Cockpit_LoadAndInitFull_90D20+BECP
		jmp	ResourceFile_LoadTypeB_91D29
VROOMM_StubThunk_6B83A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9277C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1F6F0h, codesize=12EEh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B83F	proc far		; CODE XREF: Cockpit_LoadAndInitFull_90D20+C48P
		jmp	ResourceFile_LoadTypeC_9277C
VROOMM_StubThunk_6B83F	endp

stub268		ends
