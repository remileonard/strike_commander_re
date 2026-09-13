stub252		segment	para public 'CODE' use16
		assume cs:stub252
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B2C0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:089Eo
		dw 0			; memswap
		dd 151A0h		; fileoff
		dw 143h			; codesize
		dw 18h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_87F00) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=151A0h, codesize=143h, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6B2E0	proc far		; CODE XREF: MissionText_LoadSubtitleRecord_87A60+18CP
					; MissionText_LoadSubtitleRecord_87A60+236P
		jmp	TextScroll_LoadMultipleFieldGroups_87F00
VROOMM_StubThunk_6B2E0	endp

stub252		ends
