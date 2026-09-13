stub269		segment	para public 'CODE' use16
		assume cs:stub269
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B850	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0926o
		dw 0			; memswap
		dd 20AE0h		; fileoff
		dw 18ADh		; codesize
		dw 122h			; relsize
		dw 4			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_93295) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=20AE0h, codesize=18ADh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B870	proc far		; CODE XREF: Cockpit_LoadAndInitFull_90D20+C22P
		jmp	ResourceFile_LoadTypeE_93295
VROOMM_StubThunk_6B870	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_93BA5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=20AE0h, codesize=18ADh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B875	proc far		; CODE XREF: Cockpit_LoadAndInitFull_90D20+C34P
		jmp	ResourceFile_LoadTypeF_93BA5
VROOMM_StubThunk_6B875	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9416A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=20AE0h, codesize=18ADh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B87A	proc far		; CODE XREF: Cockpit_LoadAndInitFull_90D20+BDAP
		jmp	ResourceFile_LoadTypeG_9416A
VROOMM_StubThunk_6B87A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_92E60) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=20AE0h, codesize=18ADh, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6B87F	proc far		; CODE XREF: Cockpit_LoadAndInitFull_90D20+C10P
		jmp	ResourceFile_LoadTypeD_92E60
VROOMM_StubThunk_6B87F	endp

stub269		ends
