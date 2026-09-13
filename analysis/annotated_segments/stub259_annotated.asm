stub259		segment	para public 'CODE' use16
		assume cs:stub259
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B5E0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:08D6o
		dw 0			; memswap
		dd 1B310h		; fileoff
		dw 327h			; codesize
		dw 40h			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8DB90) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1B310h, codesize=327h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6B600	proc far		; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+2A0P
		jmp	UIWidget_LoadFieldsFromIFF_8DB90
VROOMM_StubThunk_6B600	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8DD3D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1B310h, codesize=327h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6B605	proc far		; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+2D0P
		jmp	UIWidget_LoadFormationFields_8DD3D
VROOMM_StubThunk_6B605	endp

stub259		ends
