stub247		segment	para public 'CODE' use16
		assume cs:stub247
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B140	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0876o
		dw 0			; memswap
		dd 12F80h		; fileoff
		dw 32Ch			; codesize
		dw 2Ch			; relsize
		dw 8			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_861AD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=12F80h, codesize=32Ch, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B160	proc far		; DATA XREF: seg339:07E4o
		jmp	HUDSymbol_ReleaseAndFree_861AD
VROOMM_StubThunk_6B160	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85EB0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=12F80h, codesize=32Ch, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B165	proc far
		jmp	HUDSymbol_ConstructVariantP_85EB0
VROOMM_StubThunk_6B165	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85F30) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=12F80h, codesize=32Ch, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B16A	proc far		; DATA XREF: seg339:07D8o
		jmp	HUDSymbol_Helper16_85F30
VROOMM_StubThunk_6B16A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_85F65) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=12F80h, codesize=32Ch, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B16F	proc far		; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+360P
		jmp	HUDSymbol_LoadConfigFromIFF_85F65
VROOMM_StubThunk_6B16F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_860CA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=12F80h, codesize=32Ch, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B174	proc far		; DATA XREF: seg339:07D4o
		jmp	HUDSymbol_ReleaseBlock_860CA
VROOMM_StubThunk_6B174	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_86141) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=12F80h, codesize=32Ch, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B179	proc far		; DATA XREF: seg339:07C0o
		jmp	HUDSymbol_Helper17_86141
VROOMM_StubThunk_6B179	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_86166) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=12F80h, codesize=32Ch, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B17E	proc far		; DATA XREF: seg339:07C4o
		jmp	HUDSymbol_Helper18_86166
VROOMM_StubThunk_6B17E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_86189) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=12F80h, codesize=32Ch, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6B183	proc far		; DATA XREF: seg339:07C8o
		jmp	HUDSymbol_Helper19_86189
VROOMM_StubThunk_6B183	endp

stub247		ends
