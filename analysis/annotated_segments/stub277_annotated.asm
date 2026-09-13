stub277		segment	para public 'CODE' use16
		assume cs:stub277
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B9E0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0966o
		dw 0			; memswap
		dd 23EA0h		; fileoff
		dw 164h			; codesize
		dw 20h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_95FD0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=23EA0h, codesize=164h, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6BA00	proc far		; CODE XREF: MissionText_AllocateMultiBuffer_94C80+54P
		jmp	AircraftComponent_LoadSubrecord_95FD0
VROOMM_StubThunk_6BA00	endp

stub277		ends
