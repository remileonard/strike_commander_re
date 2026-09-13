stub275		segment	para public 'CODE' use16
		assume cs:stub275
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B980	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0956o
		dw 0			; memswap
		dd 23670h		; fileoff
		dw 61Bh			; codesize
		dw 40h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_95800) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=23670h, codesize=61Bh, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6B9A0	proc far		; CODE XREF: AircraftComponent_LoadMixedFieldsB_96321+ACP
		jmp	AircraftComponent_LoadFieldSequence_95800
VROOMM_StubThunk_6B9A0	endp

stub275		ends
