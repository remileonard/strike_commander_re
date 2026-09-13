stub228		segment	para public 'CODE' use16
		assume cs:stub228
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6AA60	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:07DEo
		dw 0			; memswap
		dd 160h			; fileoff
		dw 1C60h		; codesize
		dw 14Ah			; relsize
		dw 30			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7556A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AA80	proc far		; DATA XREF: seg339:02E4o
		jmp	AircraftDamageModel_ReleaseStreamAndDestruct_7556A
VROOMM_StubThunk_6AA80	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_75521) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AA85	proc far		; DATA XREF: seg339:02B4o
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_75521
VROOMM_StubThunk_6AA85	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_754D8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AA8A	proc far		; DATA XREF: seg339:02A0o
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_754D8
VROOMM_StubThunk_6AA8A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7548F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AA8F	proc far		; DATA XREF: seg339:off_6D33Co
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_7548F
VROOMM_StubThunk_6AA8F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_75446) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AA94	proc far		; DATA XREF: seg339:off_6D328o
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_75446
VROOMM_StubThunk_6AA94	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_753FD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AA99	proc far		; DATA XREF: seg339:off_6D314o
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_753FD
VROOMM_StubThunk_6AA99	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_753B4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AA9E	proc far		; DATA XREF: seg339:0250o
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_753B4
VROOMM_StubThunk_6AA9E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7536B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAA3	proc far		; DATA XREF: seg339:023Co
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_7536B
VROOMM_StubThunk_6AAA3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_75322) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAA8	proc far		; DATA XREF: seg339:0228o
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_75322
VROOMM_StubThunk_6AAA8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_752D9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAAD	proc far		; DATA XREF: seg339:0214o
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_752D9
VROOMM_StubThunk_6AAAD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_75290) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAB2	proc far		; DATA XREF: seg339:0200o
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_75290
VROOMM_StubThunk_6AAB2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_75247) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAB7	proc far		; DATA XREF: seg339:01ECo
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_75247
VROOMM_StubThunk_6AAB7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_751FE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AABC	proc far		; DATA XREF: seg339:01D8o
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_751FE
VROOMM_StubThunk_6AABC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_751B5) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAC1	proc far		; DATA XREF: seg339:01C4o
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_751B5
VROOMM_StubThunk_6AAC1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_7516C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAC6	proc far		; DATA XREF: seg339:01B0o
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_7516C
VROOMM_StubThunk_6AAC6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_75123) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AACB	proc far		; DATA XREF: seg339:019Co
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_75123
VROOMM_StubThunk_6AACB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_750DA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAD0	proc far		; DATA XREF: seg339:0188o
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_750DA
VROOMM_StubThunk_6AAD0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_75091) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAD5	proc far		; DATA XREF: seg339:0174o
		jmp	AircraftDamageComponentFamily_ScalarDeletingDtor_75091
VROOMM_StubThunk_6AAD5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_75024) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AADA	proc far		; DATA XREF: seg339:0160o
		jmp	AircraftDamageComponent_ScalarDeletingDtorC_75024
VROOMM_StubThunk_6AADA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_74FDB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AADF	proc far		; DATA XREF: seg339:014Co
		jmp	AircraftDamageComponent_ScalarDeletingDtorB_74FDB
VROOMM_StubThunk_6AADF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_74F92) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAE4	proc far		; DATA XREF: seg339:0138o
		jmp	AircraftDamageComponent_ScalarDeletingDtorA_74F92
VROOMM_StubThunk_6AAE4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_73B4F) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAE9	proc far
		jmp	PilotProfile_LoadFromPROF_73B4F
VROOMM_StubThunk_6AAE9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_73FB4) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAEE	proc far
		jmp	PilotProfile_LoadNUMSCompanionFile_73FB4
VROOMM_StubThunk_6AAEE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_742FC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAF3	proc far
		jmp	PilotProfile_ResolveNamedPropertyNode_742FC
VROOMM_StubThunk_6AAF3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_74292) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAF8	proc far
		jmp	PilotProfile_GoalSlot_BindHandlerByType_74292
VROOMM_StubThunk_6AAF8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_74B35) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AAFD	proc far
		jmp	AircraftDamageModel_Helper_74B35
VROOMM_StubThunk_6AAFD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_74B43) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AB02	proc far		; CODE XREF: seg010:058DP
		jmp	AIEntity_Construct_74B43
VROOMM_StubThunk_6AB02	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_73940) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AB07	proc far		; CODE XREF: Camera_Helper4_9D4D2+CP
		jmp	AIAircraft_LoadProfileGuarded_73940
VROOMM_StubThunk_6AB07	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_74E1C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AB0C	proc far		; DATA XREF: seg339:0114o
		jmp	AIEntity_Destruct_74E1C
VROOMM_StubThunk_6AB0C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_74F84) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=160h, codesize=1C60h, nentries=30.
; ==============================================================================================
VROOMM_StubThunk_6AB11	proc far		; DATA XREF: seg339:off_71E3Co
		jmp	AircraftDamageComponent_Method_NoOp_74F84
VROOMM_StubThunk_6AB11	endp

stub228		ends
