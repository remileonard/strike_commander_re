seg312		segment	para public 'CODE' use16
		assume cs:seg312
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C580	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0ACEo
		dw 0			; memswap
		dd 2ECE0h		; fileoff
		dw 2F5h			; codesize
		dw 32h			; relsize
		dw 4			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0700) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2ECE0h, codesize=2F5h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C5A0	proc far		; CODE XREF: PlayerComponent_LoadFieldsWithRetryD_A0FB0+19P
					; PlayerComponent_LoadFieldsWithRetryM_A66F0+2CP
		jmp	PlayerComponent_LoadAllFields_A0700
VROOMM_StubThunk_6C5A0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A07ED) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2ECE0h, codesize=2F5h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C5A5	proc far		; CODE XREF: IFF_LoadModelMain+79EP
					; PlayerComponent_LoadFieldsWithRetry_9FAD0+CP	...
		jmp	PlayerComponent_ApplyFlagsAndLoad_A07ED
VROOMM_StubThunk_6C5A5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0810) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2ECE0h, codesize=2F5h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C5AA	proc far		; DATA XREF: seg339:off_6F5F4o
		jmp	PlayerComponentVariantN_ConstructAndInit_A0810
VROOMM_StubThunk_6C5AA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A089D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2ECE0h, codesize=2F5h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6C5AF	proc far		; DATA XREF: seg339:off_6F504o
					; seg339:off_6F520o ...
		jmp	PlayerComponent_ComputeImpactResponse_A089D
VROOMM_StubThunk_6C5AF	endp

seg312		ends
