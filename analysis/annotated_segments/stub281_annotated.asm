stub281		segment	para public 'CODE' use16
		assume cs:stub281
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BAA0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A766o
		dw 0			; memswap
		dd 244A0h		; fileoff
		dw 4Ah			; codesize
		dw 4			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_96590) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=244A0h, codesize=4Ah, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6BAC0	proc far		; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+10BP
		jmp	AircraftComponent_LoadFieldGroupA_96590
VROOMM_StubThunk_6BAC0	endp

stub281		ends
