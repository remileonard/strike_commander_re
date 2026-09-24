seg311		segment	para public 'CODE' use16
		assume cs:seg311
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6C510	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:0AC6o
		dw 0			; memswap
		dd 2E8E0h		; fileoff
		dw 3B1h			; codesize
		dw 38h			; relsize
		dw 15			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0340) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C530	proc far		; CODE XREF: IFF_LoadModelMain+840P
		jmp	MissileModel_LoadDATAChunk_A0340
VROOMM_StubThunk_6C530	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A03B6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C535	proc far		; DATA XREF: seg339:off_6F54Co
		jmp	PlayerComponentVariantJ_ConstructAndInit_A03B6
VROOMM_StubThunk_6C535	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0455) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C53A	proc far
		jmp	PlayerComponent_InitPulseTimer_A0455
VROOMM_StubThunk_6C53A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0488) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C53F	proc far
		jmp	PlayerComponent_SubHelperP_A0488
VROOMM_StubThunk_6C53F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0574) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C544	proc far
		jmp	PlayerComponent_SubHelperS_A0574
VROOMM_StubThunk_6C544	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0673) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C549	proc far
		jmp	PlayerComponent_SubHelperT_A0673
VROOMM_StubThunk_6C549	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0681) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C54E	proc far
		jmp	PlayerComponent_SubHelperU_A0681
VROOMM_StubThunk_6C54E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A04AC) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C553	proc far		; CODE XREF: JDYN_LoadChunkAndConstruct_3A49C+1E3P
		jmp	PlayerComponent_SubHelperQ_A04AC
VROOMM_StubThunk_6C553	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A04C0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C558	proc far
		jmp	PlayerComponent_SubHelperR_A04C0
VROOMM_StubThunk_6C558	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A04E3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C55D	proc far
		jmp	DynMissile_LoadMISSChunk_A04E3
VROOMM_StubThunk_6C55D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A06BA) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C562	proc far
		jmp	PlayerComponent_SubHelperW_A06BA
VROOMM_StubThunk_6C562	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0697) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C567	proc far
		jmp	PlayerComponent_SubHelperV_A0697
VROOMM_StubThunk_6C567	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A058D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C56C	proc far		; DATA XREF: seg339:off_6F016o
		jmp	PlayerComponentVariantK_ConstructAndInit_A058D
VROOMM_StubThunk_6C56C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A05CB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C571	proc far		; DATA XREF: seg339:1F6Ao
		jmp	PlayerComponentVariantL_ConstructAndInit_A05CB
VROOMM_StubThunk_6C571	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_A0617) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=2E8E0h, codesize=3B1h, nentries=15.
; ==============================================================================================
VROOMM_StubThunk_6C576	proc far		; DATA XREF: seg339:off_6F01Eo
		jmp	PlayerComponentVariantM_ConstructAndInit_A0617
VROOMM_StubThunk_6C576	endp

seg311		ends
