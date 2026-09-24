stub304		segment	para public 'CODE' use16
		assume cs:stub304
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C060	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0A3Eo
		dw 0			; memswap
		dd 2AB40h		; fileoff
		dw 130h			; codesize
		dw 10h			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9C810) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2AB40h, codesize=130h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6C080	proc far		; CODE XREF: IFF_LoadModelMain+ACCP
		jmp	DecoyModel_LoadDATALifetime_9C810
VROOMM_StubThunk_6C080	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9C85A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2AB40h, codesize=130h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6C085	proc far		; DATA XREF: seg339:off_6F4E4o
		jmp	Decoy_ConstructInstance_9C85A
VROOMM_StubThunk_6C085	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9C90B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2AB40h, codesize=130h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6C08A	proc far
		jmp	Decoy_AttachAndStartLifetime_9C90B
VROOMM_StubThunk_6C08A	endp

stub304		ends
