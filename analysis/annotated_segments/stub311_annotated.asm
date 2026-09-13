stub311		segment	para public 'CODE' use16
		assume cs:stub311
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C1E0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0A76o
		dw 0			; memswap
		dd 2B760h		; fileoff
		dw 110h			; codesize
		dw 12h			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D380) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B760h, codesize=110h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6C200	proc far		; CODE XREF: IFF_LoadModelMain+5A1P
					; MissionRecord_LoadStringFields_9D4F0+CP
		jmp	Camera_Helper2_9D380
VROOMM_StubThunk_6C200	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D3BA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B760h, codesize=110h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6C205	proc far		; DATA XREF: seg339:off_6F590o
		jmp	Camera_ConstructWithSecondaryFlag_9D3BA
VROOMM_StubThunk_6C205	endp

stub311		ends
