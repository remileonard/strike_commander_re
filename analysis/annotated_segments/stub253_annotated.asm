stub253		segment	para public 'CODE' use16
		assume cs:stub253
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B2F0	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:08A6o
		dw 0			; memswap
		dd 15300h		; fileoff
		dw 17F6h		; codesize
		dw 196h			; relsize
		dw 24			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_89812) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B310	proc far		; DATA XREF: seg339:0A86o
		jmp	MissionRecordField_ReleaseSingle_89812
VROOMM_StubThunk_6B310	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_897DE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B315	proc far		; DATA XREF: seg339:0A72o
		jmp	MissionRecordField_ReleaseSingle_897DE
VROOMM_StubThunk_6B315	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_897AA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B31A	proc far		; DATA XREF: seg339:0A5Eo
		jmp	MissionRecordField_ReleaseSingle_897AA
VROOMM_StubThunk_6B31A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_89776) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B31F	proc far		; DATA XREF: seg339:0A4Ao
		jmp	MissionRecordField_ReleaseSingle_89776
VROOMM_StubThunk_6B31F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_89742) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B324	proc far		; DATA XREF: seg339:0A36o
		jmp	MissionRecordField_ReleaseSingle_89742
VROOMM_StubThunk_6B324	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8970E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B329	proc far		; DATA XREF: seg339:off_6DAD2o
		jmp	MissionRecordField_ReleaseSingle_8970E
VROOMM_StubThunk_6B329	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_896DA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B32E	proc far		; DATA XREF: seg339:0A0Eo
		jmp	MissionRecordField_ReleaseSingle_896DA
VROOMM_StubThunk_6B32E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_896A6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B333	proc far		; DATA XREF: seg339:09FAo
		jmp	MissionRecordField_ReleaseSingle_896A6
VROOMM_StubThunk_6B333	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_89672) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B338	proc far		; DATA XREF: seg339:09E6o
		jmp	MissionRecordField_ReleaseSingle_89672
VROOMM_StubThunk_6B338	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8963E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B33D	proc far		; DATA XREF: seg339:off_6DA82o
		jmp	MissionRecordField_ReleaseSingle_8963E
VROOMM_StubThunk_6B33D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8960A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B342	proc far		; DATA XREF: seg339:09BEo
		jmp	MissionRecordField_ReleaseSingle_8960A
VROOMM_StubThunk_6B342	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_895D6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B347	proc far		; DATA XREF: seg339:09AAo
		jmp	MissionRecordField_ReleaseSingle_895D6
VROOMM_StubThunk_6B347	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_895A2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B34C	proc far		; DATA XREF: seg339:0996o
		jmp	MissionRecordField_ReleaseSingle_895A2
VROOMM_StubThunk_6B34C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8956E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B351	proc far		; DATA XREF: seg339:0982o
		jmp	MissionRecordField_ReleaseSingle_8956E
VROOMM_StubThunk_6B351	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8953A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B356	proc far		; DATA XREF: seg339:096Eo
		jmp	MissionRecordField_ReleaseSingle_8953A
VROOMM_StubThunk_6B356	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8809B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B35B	proc far		; CODE XREF: Cockpit_LoadViewTable_86B53+545P
					; Cockpit_LoadViewTable_86B53+558P
		jmp	MissionRecord_ConstructStream_8809B
VROOMM_StubThunk_6B35B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_88050) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B360	proc far
		jmp	MissionRecord_Helper_88050
VROOMM_StubThunk_6B360	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_88206) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B365	proc far
		jmp	MissionRecord_LoadAndDecodeMain_88206
VROOMM_StubThunk_6B365	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_88894) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B36A	proc far
		jmp	MissionRecord_LoadSubrecords_88894
VROOMM_StubThunk_6B36A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_88B02) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B36F	proc far
		jmp	MissionRecord_LoadFieldSequence_88B02
VROOMM_StubThunk_6B36F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_88CAD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B374	proc far
		jmp	MissionRecord_LoadWithStringConstruct_88CAD
VROOMM_StubThunk_6B374	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8939A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B379	proc far
		jmp	MissionRecord_LoadFieldGroupSequence_8939A
VROOMM_StubThunk_6B379	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8811A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B37E	proc far
		jmp	MissionRecord_ReleaseTriple_8811A
VROOMM_StubThunk_6B37E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_894F3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=15300h, codesize=17F6h, nentries=24.
; ==============================================================================================
VROOMM_StubThunk_6B383	proc far		; CODE XREF: TextScroll_FormatAndReleaseRefs_874EF+8CP
					; TextScroll_FormatAndReleaseRefs_874EF+99P
		jmp	MissionRecord_ReleaseStreamAndDestruct_894F3
VROOMM_StubThunk_6B383	endp

stub253		ends
