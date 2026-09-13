stub254		segment	para public 'CODE' use16
		assume cs:stub254
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B390	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:08AEo
		dw 0			; memswap
		dd 16CA0h		; fileoff
		dw 1915h		; codesize
		dw 19Ah			; relsize
		dw 16			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B120) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3B0	proc far		; DATA XREF: seg339:0B4Bo
		jmp	MissionRecordField_ReleaseViaThunk_8B120
VROOMM_StubThunk_6B3B0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B0D5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3B5	proc far		; DATA XREF: seg339:0B2Bo
		jmp	MissionRecordField_ReleaseViaThunk_8B0D5
VROOMM_StubThunk_6B3B5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B08A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3BA	proc far		; DATA XREF: seg339:0B1Bo
		jmp	MissionRecordField_ReleaseViaThunk_8B08A
VROOMM_StubThunk_6B3BA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B03F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3BF	proc far		; DATA XREF: seg339:0B0Bo
		jmp	MissionRecordField_ReleaseViaThunk_8B03F
VROOMM_StubThunk_6B3BF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B03A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3C4	proc far		; DATA XREF: seg339:0AF7o
					; seg339:off_6DDDEo ...
		jmp	MissionRecordField_Helper_8B03A
VROOMM_StubThunk_6B3C4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8AFEF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3C9	proc far		; DATA XREF: seg339:0AEBo
		jmp	MissionRecordField_ReleaseViaThunk_8AFEF
VROOMM_StubThunk_6B3C9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8AFA4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3CE	proc far		; DATA XREF: seg339:0ADBo
		jmp	MissionRecordField_ReleaseViaThunk_8AFA4
VROOMM_StubThunk_6B3CE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8AF59) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3D3	proc far		; DATA XREF: seg339:0ACBo
		jmp	MissionRecordField_ReleaseViaThunk_8AF59
VROOMM_StubThunk_6B3D3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8AF0E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3D8	proc far		; DATA XREF: seg339:0ABBo
		jmp	MissionRecordField_ReleaseViaThunk_8AF0E
VROOMM_StubThunk_6B3D8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_89850) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3DD	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+2A1P
		jmp	MissionRecord_LoadWithDwordFields_89850
VROOMM_StubThunk_6B3DD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_89D4D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3E2	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+15DP
		jmp	MissionRecord_LoadAndDecodeSub_89D4D
VROOMM_StubThunk_6B3E2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_89F00) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3E7	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+207P
		jmp	MissionRecord_LoadWithDwordFieldsB_89F00
VROOMM_StubThunk_6B3E7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8A5E0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3EC	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+254P
		jmp	MissionRecord_LoadWithDwordFieldsC_8A5E0
VROOMM_StubThunk_6B3EC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8A9D4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3F1	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+2EEP
		jmp	MissionRecord_LoadWithDwordFieldsD_8A9D4
VROOMM_StubThunk_6B3F1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8AB92) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3F6	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+33BP
		jmp	MissionRecord_LoadWithDwordFieldsE_8AB92
VROOMM_StubThunk_6B3F6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8AD50) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=16CA0h, codesize=1915h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6B3FB	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+388P
		jmp	MissionRecord_LoadWithDwordFieldsF_8AD50
VROOMM_StubThunk_6B3FB	endp

stub254		ends
