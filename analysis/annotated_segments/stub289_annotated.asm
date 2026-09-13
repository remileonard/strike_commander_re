stub289		segment	para public 'CODE' use16
		assume cs:stub289
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BCB0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:09C6o
		dw 0			; memswap
		dd 26B00h		; fileoff
		dw 28Dh			; codesize
		dw 28h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_98A60) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=26B00h, codesize=28Dh, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6BCD0	proc far		; CODE XREF: Terrain_BuildAndLoadTilePath_9AECE+287P
		jmp	TextureLoader_OpenAndLoadFull_98A60
VROOMM_StubThunk_6BCD0	endp

stub289		ends
