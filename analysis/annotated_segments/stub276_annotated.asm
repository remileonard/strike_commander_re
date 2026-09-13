stub276		segment	para public 'CODE' use16
		assume cs:stub276
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B9B0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:095Eo
		dw 0			; memswap
		dd 23CD0h		; fileoff
		dw 1AEh			; codesize
		dw 1Eh			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_95E20) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=23CD0h, codesize=1AEh, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6B9D0	proc far		; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+6BP
		jmp	AircraftComponent_LoadFieldGroupPair_95E20
VROOMM_StubThunk_6B9D0	endp

stub276		ends
