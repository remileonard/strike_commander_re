seg336		segment	para public 'CODE' use16
		assume cs:seg336
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6CFF0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A96Eo
		dw 0			; memswap
		dd 3A370h		; fileoff
		dw 316h			; codesize
		dw 20h			; relsize
		dw 6			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB82E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A370h, codesize=316h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6D010	proc far
		jmp	AudioQueue_Helper_AB82E
VROOMM_StubThunk_6D010	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB540) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A370h, codesize=316h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6D015	proc far		; CODE XREF: TextRenderer_Main:loc_27D59P
		jmp	AudioQueue_InitAndProcess_AB540
VROOMM_StubThunk_6D015	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB583) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A370h, codesize=316h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6D01A	proc far		; CODE XREF: Widget_ApplyLayoutHelper_5A88F+2DP
		jmp	AudioQueue_AdvanceWrapper_AB583
VROOMM_StubThunk_6D01A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB592) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A370h, codesize=316h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6D01F	proc far
		jmp	AudioQueue_LoadAndPlayEntry_AB592
VROOMM_StubThunk_6D01F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB7A4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A370h, codesize=316h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6D024	proc far		; CODE XREF: seg048:12C8P
					; TextObjectCluster_DestructAll_5ABD1+16P
		jmp	AudioQueue_AdvanceAndRelease_AB7A4
VROOMM_StubThunk_6D024	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB770) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=3A370h, codesize=316h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6D029	proc far		; CODE XREF: Widget_Helper_5AA73+1AP
					; Widget_Helper_5AA95+15P
		jmp	AudioQueue_AdvanceSlotEntry_AB770
VROOMM_StubThunk_6D029	endp

seg336		ends
