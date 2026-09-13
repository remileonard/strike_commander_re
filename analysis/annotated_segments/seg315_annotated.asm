seg315		segment	para public 'CODE' use16
		assume cs:seg315
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C650	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0AE6o
		dw 0			; memswap
		dd 2F3D0h		; fileoff
		dw 22Bh			; codesize
		dw 26h			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0D80) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F3D0h, codesize=22Bh, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6C670	proc far		; CODE XREF: IFF_LoadModelMain+BF3P
		jmp	PlayerComponent_ApplyFlagsAndReleaseRef_A0D80
VROOMM_StubThunk_6C670	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0DBA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F3D0h, codesize=22Bh, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6C675	proc far		; DATA XREF: seg339:off_6F4BCo
		jmp	PlayerComponentVariantR_ConstructAndInit_A0DBA
VROOMM_StubThunk_6C675	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0E3F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2F3D0h, codesize=22Bh, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6C67A	proc far		; DATA XREF: seg339:off_6FC22o
		jmp	HUD_RenderApproachAngleWidget_A0E3F
VROOMM_StubThunk_6C67A	endp

seg315		ends
