stub278		segment	para public 'CODE' use16
		assume cs:stub278
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BA10	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:096Eo
		dw 0			; memswap
		dd 24030h		; fileoff
		dw 191h			; codesize
		dw 0Ch			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_96140) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=24030h, codesize=191h, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6BA30	proc far		; CODE XREF: MissionText_AllocateMultiBuffer_94C80+ADP
		jmp	AircraftComponent_LoadMixedFields_96140
VROOMM_StubThunk_6BA30	endp

stub278		ends
