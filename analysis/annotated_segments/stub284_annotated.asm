stub284		segment	para public 'CODE' use16
		assume cs:stub284
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BB30	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:099Eo
		dw 0			; memswap
		dd 24660h		; fileoff
		dw 0A45h		; codesize
		dw 58h			; relsize
		dw 3			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_96750) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=24660h, codesize=0A45h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BB50	proc far		; CODE XREF: seg108:015FP
					; DATA XREF: seg339:15C4o
		jmp	AircraftComponent_ReleaseMultiple_96750
VROOMM_StubThunk_6BB50	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_96917) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=24660h, codesize=0A45h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BB55	proc far		; CODE XREF: seg060:loc_2C93DP
					; PlayerComponent_LoadListAndCompute_A6B09+3CP
		jmp	AircraftComponent_ConstructAndCalibrate_96917
VROOMM_StubThunk_6BB55	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9707A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=24660h, codesize=0A45h, nentries=3.
; ==============================================================================================
VROOMM_StubThunk_6BB5A	proc far		; CODE XREF: seg108:044FP
					; DATA XREF: seg339:1862o
		jmp	AircraftComponent_ReleaseAndDestructGeneric_9707A
VROOMM_StubThunk_6BB5A	endp

stub284		ends
