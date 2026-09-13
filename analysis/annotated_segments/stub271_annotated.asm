stub271		segment	para public 'CODE' use16
		assume cs:stub271
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B8C0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0936o
		dw 0			; memswap
		dd 229D0h		; fileoff
		dw 148h			; codesize
		dw 1Ch			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_94C80) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=229D0h, codesize=148h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6B8E0	proc far		; CODE XREF: AircraftComponent_LoadMixedFieldsB_96321+C6P
		jmp	MissionText_AllocateMultiBuffer_94C80
VROOMM_StubThunk_6B8E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_94BF0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=229D0h, codesize=148h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6B8E5	proc far
		jmp	MissionText_ReleaseSubrecordA_94BF0
VROOMM_StubThunk_6B8E5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_94C38) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=229D0h, codesize=148h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6B8EA	proc far
		jmp	MissionText_ReleaseSubrecordB_94C38
VROOMM_StubThunk_6B8EA	endp

stub271		ends
