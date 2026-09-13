stub286		segment	para public 'CODE' use16
		assume cs:stub286
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BB90	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:09AEo
		dw 0			; memswap
		dd 252F0h		; fileoff
		dw 1C4h			; codesize
		dw 14h			; relsize
		dw 2			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97370) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=252F0h, codesize=1C4h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6BBB0	proc far		; CODE XREF: MissionText_LoadSubtitleRecordB_94710+265P
		jmp	HudIcon_ConstructAndLoadFromIFF_97370
VROOMM_StubThunk_6BBB0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97447) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=252F0h, codesize=1C4h, nentries=2.
; ==============================================================================================
VROOMM_StubThunk_6BBB5	proc far		; CODE XREF: seg062:loc_2DA20P
		jmp	AircraftComponent_ConstructWidget_97447
VROOMM_StubThunk_6BBB5	endp

stub286		ends
