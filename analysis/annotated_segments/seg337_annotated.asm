seg337		segment	para public 'CODE' use16
		assume cs:seg337
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6D030	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0B96o
		dw 0			; memswap
		dd 3A6B0h		; fileoff
		dw 2ADh			; codesize
		dw 26h			; relsize
		dw 5			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB8A1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A6B0h, codesize=2ADh, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6D050	proc far
		jmp	AudioQueue_ProcessAndDecode_AB8A1
VROOMM_StubThunk_6D050	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB860) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A6B0h, codesize=2ADh, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6D055	proc far		; CODE XREF: TextRenderer_Main+958P
		jmp	AudioQueue_Helper2_AB860
VROOMM_StubThunk_6D055	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_ABAAD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A6B0h, codesize=2ADh, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6D05A	proc far		; CODE XREF: seg048:12B9P
		jmp	AudioQueue_ReleaseAndCoalesce_ABAAD
VROOMM_StubThunk_6D05A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB883) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A6B0h, codesize=2ADh, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6D05F	proc far		; CODE XREF: Widget_ApplyLayoutHelper_5A88F+45P
		jmp	AudioQueue_OpcodeWrapper_AB883
VROOMM_StubThunk_6D05F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB9D7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A6B0h, codesize=2ADh, nentries=5.
; ==============================================================================================
VROOMM_StubThunk_6D064	proc far		; CODE XREF: Widget_Helper_5AAB2+1BP
		jmp	AudioQueue_LoadFromMultipleReaders_AB9D7
VROOMM_StubThunk_6D064	endp

seg337		ends
