seg314		segment	para public 'CODE' use16
		assume cs:seg314
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C600	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0ADEo
		dw 0			; memswap
		dd 2F220h		; fileoff
		dw 193h			; codesize
		dw 16h			; relsize
		dw 8			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0BE0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F220h, codesize=193h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6C620	proc far
		jmp	PlayerComponent_SubHelperY_A0BE0
VROOMM_StubThunk_6C620	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0C03) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F220h, codesize=193h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6C625	proc far		; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+3FDP
		jmp	PlayerComponent_SubHelperAA_A0C03
VROOMM_StubThunk_6C625	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0C36) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F220h, codesize=193h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6C62A	proc far
		jmp	PlayerComponent_LoadFieldGroupD_A0C36
VROOMM_StubThunk_6C62A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0C78) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F220h, codesize=193h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6C62F	proc far
		jmp	PlayerComponent_SubHelperBB_A0C78
VROOMM_StubThunk_6C62F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0C80) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F220h, codesize=193h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6C634	proc far
		jmp	PlayerComponent_SubHelperCC_A0C80
VROOMM_StubThunk_6C634	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0CA2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F220h, codesize=193h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6C639	proc far		; DATA XREF: seg339:off_6EE66o
		jmp	PlayerComponentVariantQ_ConstructAndInit_A0CA2
VROOMM_StubThunk_6C639	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0CE2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F220h, codesize=193h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6C63E	proc far		; DATA XREF: seg339:off_6EE6Ao
		jmp	PlayerComponent_SubHelperZ_A0CE2
VROOMM_StubThunk_6C63E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0D23) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F220h, codesize=193h, nentries=8.
; ==============================================================================================
VROOMM_StubThunk_6C643	proc far		; DATA XREF: seg339:off_6EE6Eo
		jmp	PlayerComponentVariantP_ConstructAndInit_A0D23
VROOMM_StubThunk_6C643	endp

seg314		ends
