stub310		segment	para public 'CODE' use16
		assume cs:stub310
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C1A0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0A6Eo
		dw 0			; memswap
		dd 2B470h		; fileoff
		dw 2B4h			; codesize
		dw 2Eh			; relsize
		dw 6			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D0C0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B470h, codesize=2B4h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6C1C0	proc far		; CODE XREF: IFF_LoadModelMain+3B2P
					; IFF_LoadInfoChunk+5DP ...
		jmp	JDYN_LoadChunkWrapper_9D0C0
VROOMM_StubThunk_6C1C0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D0FA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B470h, codesize=2B4h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6C1C5	proc far		; DATA XREF: seg339:2508o
		jmp	Debris_ConstructWithCameraAttach_9D0FA
VROOMM_StubThunk_6C1C5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D189) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B470h, codesize=2B4h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6C1CA	proc far		; CODE XREF: IFF_LoadModelMain+447P
					; PlayerComponent_ApplyFlagsAndLoad_A07ED+CP	...
		jmp	JDYN_LoadAngleAndChunk_9D189
VROOMM_StubThunk_6C1CA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D214) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B470h, codesize=2B4h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6C1CF	proc far		; DATA XREF: seg339:2530o
		jmp	Camera_ConstructAttachedWithTarget_9D214
VROOMM_StubThunk_6C1CF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D286) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B470h, codesize=2B4h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6C1D4	proc far		; CODE XREF: IFF_LoadModelMain+4EDP
					; Camera_Helper2_9D380+1CP
		jmp	Camera_Helper_9D286
VROOMM_StubThunk_6C1D4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D2CC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2B470h, codesize=2B4h, nentries=6.
; ==============================================================================================
VROOMM_StubThunk_6C1D9	proc far		; DATA XREF: seg339:off_6F5A4o
		jmp	WorldObject_ConstructWithAIEntity_9D2CC
VROOMM_StubThunk_6C1D9	endp

stub310		ends
