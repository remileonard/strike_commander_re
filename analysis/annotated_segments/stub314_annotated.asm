stub314		segment	para public 'CODE' use16
		assume cs:stub314
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C270	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:off_6A86Eo
		dw 0			; memswap
		dd 2BA30h		; fileoff
		dw 15Dh			; codesize
		dw 16h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9D610) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2BA30h, codesize=15Dh, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6C290	proc far		; DATA XREF: seg339:off_6F57Co
		jmp	Camera_ConstructWithHandle_9D610
VROOMM_StubThunk_6C290	endp

stub314		ends
