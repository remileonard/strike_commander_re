seg320		segment	para public 'CODE' use16
		assume cs:seg320
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C850	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0B0Eo
		dw 0			; memswap
		dd 31380h		; fileoff
		dw 1B3h			; codesize
		dw 18h			; relsize
		dw 6			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2C30) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31380h, codesize=1B3h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6C870	proc far
		jmp	PaletteScreen_ConstructAndBindWidget_A2C30
VROOMM_StubThunk_6C870	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2CB7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31380h, codesize=1B3h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6C875	proc far		; CODE XREF: PaletteScreen_Helper_A280B+BP
					; PaletteScreen_HelperB_A2844:loc_A2852P	...
		jmp	PaletteScreen_Helper_A2CB7
VROOMM_StubThunk_6C875	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2CEC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31380h, codesize=1B3h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6C87A	proc far		; CODE XREF: PaletteScreen_HelperB_A2844+3BP
					; PaletteScreen_HelperD_A2B58+3BP
		jmp	PaletteScreen_LookupByteTable_A2CEC
VROOMM_StubThunk_6C87A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2CFC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31380h, codesize=1B3h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6C87F	proc far
		jmp	PaletteScreen_DispatchWidgetLayoutA_A2CFC
VROOMM_StubThunk_6C87F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2D4A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31380h, codesize=1B3h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6C884	proc far		; CODE XREF: PaletteScreen_DrawWidgetVariantC_A23E7+25P
					; PaletteScreen_DrawBorderAndText_A2893+AAP ...
		jmp	PaletteScreen_DispatchWidgetLayoutB_A2D4A
VROOMM_StubThunk_6C884	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A2DA6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=31380h, codesize=1B3h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6C889	proc far
		jmp	PaletteScreen_SwitchModeAndDispatch_A2DA6
VROOMM_StubThunk_6C889	endp

seg320		ends
