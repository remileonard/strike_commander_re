seg338		segment	para public 'CODE' use16
		assume cs:seg338
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6D070	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A97Eo
		dw 0			; memswap
		dd 3A990h		; fileoff
		dw 38Fh			; codesize
		dw 2Ch			; relsize
		dw 4			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_ABB10) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A990h, codesize=38Fh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6D090	proc far
		jmp	AudioQueue_ProcessAndDecodeB_ABB10
VROOMM_StubThunk_6D090	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_ABBEF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A990h, codesize=38Fh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6D095	proc far		; CODE XREF: Widget_Helper_5AAD7+24P
		jmp	AudioQueue_MainProcessEntry_ABBEF
VROOMM_StubThunk_6D095	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_ABDAF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A990h, codesize=38Fh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6D09A	proc far		; CODE XREF: Widget_Helper_5AB2C+1BP
		jmp	AudioQueue_OpcodeHelper_ABDAF
VROOMM_StubThunk_6D09A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_ABDEC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A990h, codesize=38Fh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6D09F	proc far		; CODE XREF: Weapon_HUDBox_FullUpdateCycle_5AB79+30P
		jmp	AudioQueue_FinalizeAndRelease_ABDEC
VROOMM_StubThunk_6D09F	endp

seg338		ends
