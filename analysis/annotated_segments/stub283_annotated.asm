stub283		segment	para public 'CODE' use16
		assume cs:stub283
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BB00	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0996o
		dw 0			; memswap
		dd 24560h		; fileoff
		dw 0F4h			; codesize
		dw 0Ch			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_96650) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=24560h, codesize=0F4h, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6BB20	proc far		; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+151P
		jmp	AircraftComponent_LoadFinalFieldsWithErrorCheck_96650
VROOMM_StubThunk_6BB20	endp

stub283		ends
