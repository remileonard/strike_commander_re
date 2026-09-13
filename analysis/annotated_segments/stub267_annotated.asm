stub267		segment	para public 'CODE' use16
		assume cs:stub267
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B7D0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A6F6o
		dw 0			; memswap
		dd 1E7F0h		; fileoff
		dw 0E4Fh		; codesize
		dw 9Ch			; relsize
		dw 4			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_90D20) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1E7F0h, codesize=0E4Fh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B7F0	proc far		; CODE XREF: Config_ReadCalibration+140P
		jmp	Cockpit_LoadAndInitFull_90D20
VROOMM_StubThunk_6B7F0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_91AA6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1E7F0h, codesize=0E4Fh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B7F5	proc far
		jmp	Cockpit_Helper_91AA6
VROOMM_StubThunk_6B7F5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_91AE9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1E7F0h, codesize=0E4Fh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B7FA	proc far
		jmp	Cockpit_Helper2_91AE9
VROOMM_StubThunk_6B7FA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_91B2C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=1E7F0h, codesize=0E4Fh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B7FF	proc far
		jmp	Cockpit_Helper3_91B2C
VROOMM_StubThunk_6B7FF	endp

stub267		ends
