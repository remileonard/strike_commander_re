stub282		segment	para public 'CODE' use16
		assume cs:stub282
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BAD0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A76Eo
		dw 0			; memswap
		dd 244F0h		; fileoff
		dw 64h			; codesize
		dw 6			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_965E0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=244F0h, codesize=64h, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6BAF0	proc far		; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+12FP
		jmp	AircraftComponent_LoadFieldGroupAB_965E0
VROOMM_StubThunk_6BAF0	endp

stub282		ends
