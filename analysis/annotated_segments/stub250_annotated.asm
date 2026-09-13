stub250		segment	para public 'CODE' use16
		assume cs:stub250
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B230	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:088Eo
		dw 0			; memswap
		dd 14B60h		; fileoff
		dw 12Eh			; codesize
		dw 14h			; relsize
		dw 4			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87930) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=14B60h, codesize=12Eh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B250	proc far		; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+270P
		jmp	TextScroll_Allocate_87930
VROOMM_StubThunk_6B250	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87969) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=14B60h, codesize=12Eh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B255	proc far
		jmp	TextScroll_LoadFieldsFromIFF_87969
VROOMM_StubThunk_6B255	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_879F7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=14B60h, codesize=12Eh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B25A	proc far		; DATA XREF: seg339:088Co
		jmp	TextScroll_Helper3_879F7
VROOMM_StubThunk_6B25A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87A2B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=14B60h, codesize=12Eh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B25F	proc far		; DATA XREF: seg339:0890o
		jmp	TextScroll_Helper4_87A2B
VROOMM_StubThunk_6B25F	endp

stub250		ends
