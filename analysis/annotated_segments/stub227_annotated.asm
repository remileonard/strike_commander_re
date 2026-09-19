stub227		segment	para public 'CODE' use16
		assume cs:stub227
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6AA00	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:07CEo
					; seg216:07D6o
		dw 0			; memswap
		dd 0			; fileoff
		dw 15Ah			; codesize
		dw 6			; relsize
		dw 10			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_73935) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0, codesize=15Ah, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6AA20	proc far		; DATA XREF: seg339:off_6D172o
					; seg339:0384o	...
		jmp	WorldObjectA_Method_NoOpC_73935
VROOMM_StubThunk_6AA20	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_73930) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0, codesize=15Ah, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6AA25	proc far		; DATA XREF: seg339:off_6D16Eo
					; seg339:0380o	...
		jmp	WorldObjectA_Method_NoOpB_73930
VROOMM_StubThunk_6AA25	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_73929) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0, codesize=15Ah, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6AA2A	proc far		; DATA XREF: seg339:037Co seg339:03A0o
		jmp	WorldObjectA_Method_ReturnZero_73929
VROOMM_StubThunk_6AA2A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_737E0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0, codesize=15Ah, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6AA2F	proc far		; CODE XREF: AircraftStateBits_Clear_12806:loc_1280DP
		jmp	WorldObjectA_Method_NoOp_737E0
VROOMM_StubThunk_6AA2F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_737E5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0, codesize=15Ah, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6AA34	proc far		; CODE XREF: AircraftStateBlock_Reset_12931+AP seg010:01ACP ...
		jmp	WorldObjectA_ResetPositionVector_737E5
VROOMM_StubThunk_6AA34	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7385B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0, codesize=15Ah, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6AA39	proc far		; DATA XREF: seg339:00C6o
		jmp	WorldObjectA_Construct_7385B
VROOMM_StubThunk_6AA39	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_738A0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0, codesize=15Ah, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6AA3E	proc far		; CODE XREF: seg010:01F6P
					; DATA XREF: seg339:00CAo
		jmp	WorldObjectA_ScalarDeletingDtor_738A0
VROOMM_StubThunk_6AA3E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_738DA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0, codesize=15Ah, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6AA43	proc far		; CODE XREF: seg010:03BCP seg010:0475P ...
		jmp	WorldObjectA_Method_ClearField2_738DA
VROOMM_StubThunk_6AA43	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_738EF) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0, codesize=15Ah, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6AA48	proc far		; CODE XREF: SubObject_NotifyEvent+100P
					; DATA XREF: seg339:off_6D15Eo
		jmp	WorldObjectB_ScalarDeletingDtor_738EF
VROOMM_StubThunk_6AA48	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_738E8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=0, codesize=15Ah, nentries=10.
; ==============================================================================================
VROOMM_StubThunk_6AA4D	proc far		; DATA XREF: seg339:039Co
		jmp	WorldObjectA_Method_ReturnTrue_738E8
VROOMM_StubThunk_6AA4D	endp

stub227		ends
