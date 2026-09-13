seg335		segment	para public 'CODE' use16
		assume cs:seg335
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6CF80	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A966o
		dw 0			; memswap
		dd 39580h		; fileoff
		dw 0D26h		; codesize
		dw 0BAh			; relsize
		dw 13			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB4E1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=39580h, codesize=0D26h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CFA0	proc far		; DATA XREF: AudioQueue_UnregisterAndCleanup_AB44A+34o
		jmp	AudioQueue_ReleaseAndDestruct_AB4E1
VROOMM_StubThunk_6CFA0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB4BE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=39580h, codesize=0D26h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CFA5	proc far		; DATA XREF: AudioQueue_ReleaseAndAdvance_AACA6+24o
		jmp	AudioQueue_Helper_AB4BE
VROOMM_StubThunk_6CFA5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AACA6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=39580h, codesize=0D26h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CFAA	proc far
		jmp	AudioQueue_ReleaseAndAdvance_AACA6
VROOMM_StubThunk_6CFAA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AAE3B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=39580h, codesize=0D26h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CFAF	proc far
		jmp	AudioQueue_ReleaseAndAdvanceB_AAE3B
VROOMM_StubThunk_6CFAF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AAFA0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=39580h, codesize=0D26h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CFB4	proc far
		jmp	AudioQueue_ProcessAndAdvance_AAFA0
VROOMM_StubThunk_6CFB4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA810) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=39580h, codesize=0D26h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CFB9	proc far		; CODE XREF: TextRenderer_Main+85BP
		jmp	AudioQueue_RegisterTickModule_AA810
VROOMM_StubThunk_6CFB9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA831) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=39580h, codesize=0D26h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CFBE	proc far		; CODE XREF: Widget_ApplyLayoutHelper_5A88F+15P
		jmp	AudioQueue_AdvanceSlot_AA831
VROOMM_StubThunk_6CFBE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AA84E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=39580h, codesize=0D26h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CFC3	proc far		; CODE XREF: TextRenderer_Main+867P
		jmp	AudioQueue_ProcessMain_AA84E
VROOMM_StubThunk_6CFC3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB2BD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=39580h, codesize=0D26h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CFC8	proc far
		jmp	AudioQueue_ReleaseAllSlots_AB2BD
VROOMM_StubThunk_6CFC8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB44A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=39580h, codesize=0D26h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CFCD	proc far		; CODE XREF: seg048:12D7P
					; TextObjectCluster_DestructAll_5ABD1+78P
		jmp	AudioQueue_UnregisterAndCleanup_AB44A
VROOMM_StubThunk_6CFCD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB16F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=39580h, codesize=0D26h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CFD2	proc far		; CODE XREF: Widget_Helper_5A9BA+EP
		jmp	AudioQueue_ActivateSlotOpcode_AB16F
VROOMM_StubThunk_6CFD2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB1AF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=39580h, codesize=0D26h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CFD7	proc far		; CODE XREF: Widget_Helper_5A9D0+EP
		jmp	AudioQueue_DeactivateSlotOpcode_AB1AF
VROOMM_StubThunk_6CFD7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_AB1EF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=39580h, codesize=0D26h, nentries=13.
; ==============================================================================================
VROOMM_StubThunk_6CFDC	proc far		; CODE XREF: Widget_Helper_5A9E6+12P
		jmp	AudioQueue_ProcessSequencerSlots_AB1EF
VROOMM_StubThunk_6CFDC	endp

seg335		ends
