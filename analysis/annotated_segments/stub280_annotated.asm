stub280		segment	para public 'CODE' use16
		assume cs:stub280
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BA70	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A75Eo
		dw 0			; memswap
		dd 24370h		; fileoff
		dw 11Fh			; codesize
		dw 0Ah			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_96470) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=24370h, codesize=11Fh, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6BA90	proc far		; CODE XREF: AircraftComponent_LoadMixedFieldsB_96321+B9P
		jmp	AircraftComponent_LoadFieldGroupC_96470
VROOMM_StubThunk_6BA90	endp

stub280		ends
