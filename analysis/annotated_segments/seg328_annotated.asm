seg328		segment	para public 'CODE' use16
		assume cs:seg328
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6CC50	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0B4Eo
		dw 0			; memswap
		dd 350C0h		; fileoff
		dw 208h			; codesize
		dw 22h			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A66F0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=350C0h, codesize=208h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6CC70	proc far		; CODE XREF: IFF_LoadModelMain+29DP
		jmp	PlayerComponent_LoadFieldsWithRetryM_A66F0
VROOMM_StubThunk_6CC70	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A68A2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=350C0h, codesize=208h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6CC75	proc far		; CODE XREF: MissionText_LoadSubtitleRecordB_94710+2C7P
		jmp	PlayerComponent_LoadFieldsWithRetryN_A68A2
VROOMM_StubThunk_6CC75	endp

seg328		ends
