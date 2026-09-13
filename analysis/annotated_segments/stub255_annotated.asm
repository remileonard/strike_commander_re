stub255		segment	para public 'CODE' use16
		assume cs:stub255
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6B400	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:08B6o
		dw 0			; memswap
		dd 18750h		; fileoff
		dw 17B5h		; codesize
		dw 0BEh			; relsize
		dw 27			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8C8DE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B420	proc far		; DATA XREF: seg339:0BCCo
		jmp	MissionRecordField_ReleaseSingleB_8C8DE
VROOMM_StubThunk_6B420	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8C897) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B425	proc far		; DATA XREF: seg339:0BBCo
		jmp	MissionRecordField_ReleaseSingleB_8C897
VROOMM_StubThunk_6B425	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8C850) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B42A	proc far		; DATA XREF: seg339:0BACo
		jmp	MissionRecordField_ReleaseSingleB_8C850
VROOMM_StubThunk_6B42A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8C809) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B42F	proc far		; DATA XREF: seg339:0B9Co
		jmp	MissionRecordField_ReleaseSingleB_8C809
VROOMM_StubThunk_6B42F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8C7C2) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B434	proc far		; DATA XREF: seg339:0B8Co
		jmp	MissionRecordField_ReleaseSingleB_8C7C2
VROOMM_StubThunk_6B434	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8C77B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B439	proc far		; DATA XREF: seg339:0B7Co
		jmp	MissionRecordField_ReleaseSingleB_8C77B
VROOMM_StubThunk_6B439	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8C734) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B43E	proc far		; DATA XREF: seg339:0B6Co
		jmp	MissionRecordField_ReleaseSingleB_8C734
VROOMM_StubThunk_6B43E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8C6ED) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B443	proc far		; DATA XREF: seg339:0B5Co
		jmp	MissionRecordField_ReleaseSingleB_8C6ED
VROOMM_StubThunk_6B443	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B3D9) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B448	proc far
		jmp	MissionRecordField_ThunkOnly_8B3D9
VROOMM_StubThunk_6B448	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B42B) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B44D	proc far		; CODE XREF: MissionRecord_LoadWithDwordFields_89850+2F2P
					; MissionRecord_LoadWithDwordFieldsB_89F00+323P ...
		jmp	MissionRecordField_ThunkOnly2_8B42B
VROOMM_StubThunk_6B44D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B473) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B452	proc far		; CODE XREF: MissionRecord_LoadWithDwordFields_89850+317P
					; MissionRecord_LoadAndDecodeSub_89D4D+167P ...
		jmp	MissionRecordField_ThunkOnly3_8B473
VROOMM_StubThunk_6B452	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B4B8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B457	proc far		; CODE XREF: MissionRecord_LoadWithDwordFieldsB_89F00+36DP
					; MissionRecord_LoadWithDwordFieldsC_8A5E0+28EP
		jmp	MissionRecordField_ThunkOnly4_8B4B8
VROOMM_StubThunk_6B457	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B50D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B45C	proc far		; CODE XREF: MissionRecord_LoadWithDwordFields_89850+33CP
		jmp	MissionRecordField_ThunkOnly5_8B50D
VROOMM_StubThunk_6B45C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B562) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B461	proc far		; CODE XREF: MissionRecord_LoadWithDwordFieldsD_8A9D4+163P
					; MissionRecord_LoadWithDwordFieldsE_8AB92:loc_8ACF5P	...
		jmp	MissionRecordField_ThunkOnly6_8B562
VROOMM_StubThunk_6B461	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B255) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B466	proc far
		jmp	MissionRecordField_Helper2_8B255
VROOMM_StubThunk_6B466	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B211) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B46B	proc far		; CODE XREF: MissionRecord_LoadWithDwordFields_89850+2CAP
					; MissionRecord_LoadAndDecodeSub_89D4D+142P ...
		jmp	MissionRecordField_ReleaseWrapper_8B211
VROOMM_StubThunk_6B46B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B170) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B470	proc far		; CODE XREF: MissionRecordField_ReleaseViaThunk_8AF0E:loc_8AF2DP
					; MissionRecordField_ReleaseViaThunk_8AF59+1FP ...
		jmp	MissionRecordField_ReleaseDouble_8B170
VROOMM_StubThunk_6B470	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; near, thunk fixe VROOMM (jmp loc_8B831) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B475	proc near		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+422P
		jmp	far ptr	loc_8B831
VROOMM_StubThunk_6B475	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B5A7) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B47A	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+3D5P
		jmp	MissionRecord_LoadFieldGroupMix_8B5A7
VROOMM_StubThunk_6B47A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8BAE8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B47F	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+46FP
		jmp	MissionRecord_LoadFieldGroupMixB_8BAE8
VROOMM_StubThunk_6B47F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8BDBC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B484	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+4BCP
		jmp	MissionRecord_LoadFieldGroupSmall_8BDBC
VROOMM_StubThunk_6B484	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8BE83) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B489	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+556P
		jmp	MissionRecord_LoadWithDwordFieldsG_8BE83
VROOMM_StubThunk_6B489	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B2A3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B48E	proc far
		jmp	MissionRecordField_ReleaseAndThunk_8B2A3
VROOMM_StubThunk_6B48E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8C088) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B493	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+5A3P
		jmp	MissionRecord_LoadFieldGroupMixC_8C088
VROOMM_StubThunk_6B493	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8B33E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B498	proc far
		jmp	MissionRecordField_ReleaseAndThunkB_8B33E
VROOMM_StubThunk_6B498	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8C32C) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B49D	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+509P
		jmp	MissionRecord_LoadFieldGroupMixD_8C32C
VROOMM_StubThunk_6B49D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_8C531) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=18750h, codesize=17B5h, nentries=27.
; ==============================================================================================
VROOMM_StubThunk_6B4A2	proc far		; CODE XREF: MissionRecord_LoadAndDecodeMain_88206+5F0P
		jmp	MissionRecord_LoadWithDwordFieldsH_8C531
VROOMM_StubThunk_6B4A2	endp

stub255		ends
