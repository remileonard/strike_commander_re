stub301		segment	para public 'CODE' use16
		assume cs:stub301
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BF90	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0A26o
		dw 0			; memswap
		dd 29990h		; fileoff
		dw 0D2h			; codesize
		dw 0Eh			; relsize
		dw 4			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B7C8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29990h, codesize=0D2h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6BFB0	proc far		; DATA XREF: seg339:1B5Co seg339:1C5Eo ...
		jmp	Debris_Helper2_9B7C8
VROOMM_StubThunk_6BFB0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B7C0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29990h, codesize=0D2h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6BFB5	proc far		; DATA XREF: seg339:1AF8o
					; seg339:off_6FD74o ...
		jmp	Debris_Helper_9B7C0
VROOMM_StubThunk_6BFB5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B700) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29990h, codesize=0D2h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6BFBA	proc far		; CODE XREF: WorldObject_BaseDestruct+16P
					; Camera_DestructFollow+2EP ...
		jmp	Debris_FindAndUnregister_9B700
VROOMM_StubThunk_6BFBA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9B78D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=29990h, codesize=0D2h, nentries=4.
; ==============================================================================================
VROOMM_StubThunk_6BFBF	proc far		; CODE XREF: Player_MainUpdate+176P
					; Player_MainUpdate+1E4P ...
		jmp	Debris_ContainerOpWrapperB_9B78D
VROOMM_StubThunk_6BFBF	endp

stub301		ends
