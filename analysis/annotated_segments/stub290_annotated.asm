stub290		segment	para public 'CODE' use16
		assume cs:stub290
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BCE0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:09CEo
		dw 0			; memswap
		dd 26DC0h		; fileoff
		dw 42Dh			; codesize
		dw 12h			; relsize
		dw 1			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_98CF0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=26DC0h, codesize=42Dh, nentries=1.
; ==============================================================================================
VROOMM_StubThunk_6BD00	proc far		; CODE XREF: Terrain_CheckAdjacentDistance+4EP
		jmp	Terrain_ComputeVisibilityAndAltitude_98CF0
VROOMM_StubThunk_6BD00	endp

stub290		ends
