seg323		segment	para public 'CODE' use16
		assume cs:seg323
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6CA10	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0B26o
		dw 0			; memswap
		dd 32D90h		; fileoff
		dw 4A3h			; codesize
		dw 42h			; relsize
		dw 20			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4570) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA30	proc far
		jmp	InfoWidget_CopyFieldA_A4570
VROOMM_StubThunk_6CA30	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4582) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA35	proc far
		jmp	InfoWidget_CopyFieldB_A4582
VROOMM_StubThunk_6CA35	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A459A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA3A	proc far		; DATA XREF: seg339:1342o
					; seg339:off_6E426o
		jmp	InfoWidget_Helper_A459A
VROOMM_StubThunk_6CA3A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A45AC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA3F	proc far		; DATA XREF: seg339:off_6E412o
		jmp	InfoWidget_MeasureAndDrawA_A45AC
VROOMM_StubThunk_6CA3F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4602) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA44	proc far
		jmp	InfoWidget_Helper2_A4602
VROOMM_StubThunk_6CA44	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4621) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA49	proc far
		jmp	InfoWidget_MeasureAndDrawB_A4621
VROOMM_StubThunk_6CA49	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4677) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA4E	proc far
		jmp	InfoWidget_Method_Dispatch0C_A4677
VROOMM_StubThunk_6CA4E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4696) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA53	proc far
		jmp	InfoWidget_Method_Dispatch0CB_A4696
VROOMM_StubThunk_6CA53	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A46C1) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA58	proc far
		jmp	InfoWidget_MeasureAndDrawStyled_A46C1
VROOMM_StubThunk_6CA58	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A47AE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA5D	proc far
		jmp	InfoWidget_Method_Dispatch0CC_A47AE
VROOMM_StubThunk_6CA5D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A47CD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA62	proc far
		jmp	InfoWidget_Method_Dispatch0CD_A47CD
VROOMM_StubThunk_6CA62	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A47F8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA67	proc far
		jmp	InfoWidget_ApplyStubHelpers_A47F8
VROOMM_StubThunk_6CA67	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4815) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA6C	proc far
		jmp	InfoWidget_Helper3_A4815
VROOMM_StubThunk_6CA6C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4843) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA71	proc far
		jmp	InfoWidget_Method_DispatchField2A_A4843
VROOMM_StubThunk_6CA71	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4850) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA76	proc far
		jmp	InfoWidget_Helper4_A4850
VROOMM_StubThunk_6CA76	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4866) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA7B	proc far
		jmp	InfoWidget_Helper5_A4866
VROOMM_StubThunk_6CA7B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A488A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA80	proc far
		jmp	InfoWidget_DrawComposite_A488A
VROOMM_StubThunk_6CA80	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A4978) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA85	proc far
		jmp	InfoWidget_Method_Dispatch18_A4978
VROOMM_StubThunk_6CA85	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A499D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA8A	proc far		; DATA XREF: seg339:1497o
		jmp	InfoWidget_MeasureAndDrawC_A499D
VROOMM_StubThunk_6CA8A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A49EE) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=32D90h, codesize=4A3h, nentries=20.
; ==============================================================================================
VROOMM_StubThunk_6CA8F	proc far		; DATA XREF: seg339:14ABo
		jmp	InfoWidget_Method_Dispatch18B_A49EE
VROOMM_StubThunk_6CA8F	endp

seg323		ends
