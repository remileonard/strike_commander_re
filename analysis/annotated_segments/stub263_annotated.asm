stub263		segment	para public 'CODE' use16
		assume cs:stub263
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B6B0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:08F6o
		dw 0			; memswap
		dd 1C0D0h		; fileoff
		dw 452h			; codesize
		dw 60h			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8E860) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1C0D0h, codesize=452h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6B6D0	proc far		; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+300P
		jmp	AITargeting_LoadFieldsFromIFF_8E860
VROOMM_StubThunk_6B6D0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8EAE8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1C0D0h, codesize=452h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6B6D5	proc far		; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C:loc_8D99CP
		jmp	AITargeting_LoadFieldsFromIFFB_8EAE8
VROOMM_StubThunk_6B6D5	endp

stub263		ends
