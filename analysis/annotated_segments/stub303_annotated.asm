stub303		segment	para public 'CODE' use16
		assume cs:stub303
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C020	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A816o
		dw 0			; memswap
		dd 2A2A0h		; fileoff
		dw 856h			; codesize
		dw 3Ah			; relsize
		dw 4			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9C7DF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2A2A0h, codesize=856h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C040	proc far		; DATA XREF: seg339:off_6EC76o
		jmp	Debris_Helper4_9C7DF
VROOMM_StubThunk_6C040	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9C7BA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2A2A0h, codesize=856h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C045	proc far		; DATA XREF: Debris_LoadFieldMixC_9BFB0+337o
					; Debris_LoadFieldMixC_9BFB0+355o ...
		jmp	Debris_AllocateExtended_9C7BA
VROOMM_StubThunk_6C045	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9BFB0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2A2A0h, codesize=856h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C04A	proc far		; CODE XREF: Debris_LoadFieldMixB_9BDE9+71P
		jmp	Debris_LoadFieldMixC_9BFB0
VROOMM_StubThunk_6C04A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9C42F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2A2A0h, codesize=856h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C04F	proc far
		jmp	Debris_ComputeScaledPhysics_9C42F
VROOMM_StubThunk_6C04F	endp

stub303		ends
