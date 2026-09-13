stub264		segment	para public 'CODE' use16
		assume cs:stub264
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B6E0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:08FEo
		dw 0			; memswap
		dd 1C590h		; fileoff
		dw 1D4h			; codesize
		dw 18h			; relsize
		dw 4			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8ED6E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1C590h, codesize=1D4h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B700	proc far
		jmp	CRT_FormatAndValidateStream_8ED6E
VROOMM_StubThunk_6B700	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8ECC0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1C590h, codesize=1D4h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B705	proc far
		jmp	CRT_ReadTypedValue_8ECC0
VROOMM_StubThunk_6B705	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8ED1F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1C590h, codesize=1D4h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B70A	proc far
		jmp	CRT_StringLengthHelper_8ED1F
VROOMM_StubThunk_6B70A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8EE3F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1C590h, codesize=1D4h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B70F	proc far		; CODE XREF: Lexer_CountTokensAndFormat:loc_1CA01P
					; Compiler_EmitByTokenType+44P ...
		jmp	Runtime_NullPointerAssignHandler_8EE3F
VROOMM_StubThunk_6B70F	endp

stub264		ends
