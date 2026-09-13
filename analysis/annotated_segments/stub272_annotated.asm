stub272		segment	para public 'CODE' use16
		assume cs:stub272
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B8F0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A71Eo
		dw 0			; memswap
		dd 22B40h		; fileoff
		dw 582h			; codesize
		dw 48h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_94D40) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=22B40h, codesize=582h, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6B910	proc far		; CODE XREF: AircraftComponent_LoadSubrecord_95FD0+3DP
		jmp	AircraftComponent_LoadWithDwordFields_94D40
VROOMM_StubThunk_6B910	endp

stub272		ends
