seg313		segment	para public 'CODE' use16
		assume cs:seg313
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C5C0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0AD6o
		dw 0			; memswap
		dd 2F010h		; fileoff
		dw 1DDh			; codesize
		dw 24h			; relsize
		dw 4			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0A00) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F010h, codesize=1DDh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C5E0	proc far		; CODE XREF: IFF_LoadModelMain+B56P
		jmp	PlayerComponent_LoadFieldsWithRetryC_A0A00
VROOMM_StubThunk_6C5E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0ADC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F010h, codesize=1DDh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C5E5	proc far		; DATA XREF: seg339:off_6F4D0o
		jmp	PlayerComponentVariantO_ConstructAndInit_A0ADC
VROOMM_StubThunk_6C5E5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0B40) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F010h, codesize=1DDh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C5EA	proc far
		jmp	PlayerComponent_RegisterAndInitPulses_A0B40
VROOMM_StubThunk_6C5EA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0B8B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F010h, codesize=1DDh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C5EF	proc far
		jmp	PlayerComponent_SubHelperX_A0B8B
VROOMM_StubThunk_6C5EF	endp

seg313		ends
