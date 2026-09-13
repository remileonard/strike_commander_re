stub270		segment	para public 'CODE' use16
		assume cs:stub270
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B890	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:092Eo
		dw 0			; memswap
		dd 224B0h		; fileoff
		dw 4D3h			; codesize
		dw 42h			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_94B9E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=224B0h, codesize=4D3h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6B8B0	proc far		; DATA XREF: seg339:15ACo
		jmp	MissionText_ReleaseWidgetLabel_94B9E
VROOMM_StubThunk_6B8B0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_94710) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=224B0h, codesize=4D3h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6B8B5	proc far
		jmp	MissionText_LoadSubtitleRecordB_94710
VROOMM_StubThunk_6B8B5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_94A86) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=224B0h, codesize=4D3h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6B8BA	proc far		; CODE XREF: IFF_LoadModelMain+F5AP
					; PlayerComponentVariantB_ConstructAndInit_9FBDE+42P
		jmp	MissionText_LoadSubtitleWithString_94A86
VROOMM_StubThunk_6B8BA	endp

stub270		ends
