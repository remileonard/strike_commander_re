seg446		segment	para public 'OVERLAY' use16
		assume cs:seg446
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, copie un champ (+0x2C) vers un pointeur cible (+0x2A) — accesseur simple.
; ==============================================================================================
InfoWidget_CopyFieldA_A4570	proc far		; CODE XREF: VROOMM_StubThunk_6CA30J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		mov	[bx], ax
		pop	si
		pop	bp
		retf
InfoWidget_CopyFieldA_A4570	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, copie conditionnellement un champ (+0x20) vers un pointeur cible (+0x1E) si un flag
; (arg_8) est posé.
; ==============================================================================================
InfoWidget_CopyFieldB_A4582	proc far		; CODE XREF: VROOMM_StubThunk_6CA35J

arg_0		= word ptr  6
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si

loc_A4586:
		mov	si, [bp+arg_0]
		cmp	[bp+arg_8], 0
		jz	short loc_A4597

loc_A458F:
		mov	ax, [si+20h]
		mov	bx, [si+1Eh]
		mov	[bx], ax

loc_A4597:				; CODE XREF: InfoWidget_CopyFieldB_A4582+Bj
		pop	si
		pop	bp
		retf
InfoWidget_CopyFieldB_A4582	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
InfoWidget_Helper_A459A	proc far		; CODE XREF: VROOMM_StubThunk_6CA3AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		mov	[bx], ax
		pop	si
		pop	bp
		retf
InfoWidget_Helper_A459A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, encadré par le verrou d'ownership (seg442), combine Memory_TypedAllocDispatchB_5C832,
; Render_MeasureOrDrawTextString_61F52 (seg174) — mesure/rendu de texte du widget.
; ==============================================================================================
InfoWidget_MeasureAndDrawA_A45AC	proc far		; CODE XREF: VROOMM_StubThunk_6CA3FJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_A45CC
		push	word ptr [si+2Eh]
		jmp	short loc_A45CF
; ���������������������������������������������������������������������������

loc_A45CC:				; CODE XREF: InfoWidget_MeasureAndDrawA_A45AC+19j
		push	word ptr [si+28h]

loc_A45CF:				; CODE XREF: InfoWidget_MeasureAndDrawA_A45AC+1Ej
		push	0
		mov	al, [si+22h]
		push	ax
		push	large dword ptr	[si+1Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	si
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		pop	si
		pop	bp
		retf
InfoWidget_MeasureAndDrawA_A45AC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
InfoWidget_Helper2_A4602	proc far		; CODE XREF: VROOMM_StubThunk_6CA44J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0FFFFFFFFh
		push	word ptr [si+2Ch]
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
InfoWidget_Helper2_A4602	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que InfoWidget_MeasureAndDrawA_A45AC (variante de champ).
; ==============================================================================================
InfoWidget_MeasureAndDrawB_A4621	proc far		; CODE XREF: VROOMM_StubThunk_6CA49J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_A4641
		push	word ptr [si+2Eh]
		jmp	short loc_A4644
; ���������������������������������������������������������������������������

loc_A4641:				; CODE XREF: InfoWidget_MeasureAndDrawB_A4621+19j
		push	word ptr [si+28h]

loc_A4644:				; CODE XREF: InfoWidget_MeasureAndDrawB_A4621+1Ej
		push	0
		mov	al, [si+22h]
		push	ax
		push	large dword ptr	[si+1Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	si
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		pop	si
		pop	bp
		retf
InfoWidget_MeasureAndDrawB_A4621	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx+0x0C].
; ==============================================================================================
InfoWidget_Method_Dispatch0C_A4677	proc far		; CODE XREF: VROOMM_StubThunk_6CA4EJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0FFFFFFFFh

loc_A4681:
		push	word ptr [si+2Ch]
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]

loc_A468A:
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
InfoWidget_Method_Dispatch0C_A4677	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx+0x0C] (variante).
; ==============================================================================================
InfoWidget_Method_Dispatch0CB_A4696	proc far		; CODE XREF: VROOMM_StubThunk_6CA53J

arg_0		= word ptr  6
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 1
		jnz	short loc_A46A8
		mov	dx, [si+2Ch]
		jmp	short loc_A46AB
; ���������������������������������������������������������������������������

loc_A46A8:				; CODE XREF: InfoWidget_Method_Dispatch0CB_A4696+Bj
		mov	dx, [si+30h]

loc_A46AB:				; CODE XREF: InfoWidget_Method_Dispatch0CB_A4696+10j
		push	large 0FFFFFFFFh
		push	dx
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
InfoWidget_Method_Dispatch0CB_A4696	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 110 lignes, NON DÉTAILLÉE — combine TextFormat_ApplyStyleAttribute_5E2D0 (×2), le
; verrou d'ownership, Memory_TypedAllocDispatchB_5C832, Render_MeasureOrDrawTextString_61F52,
; TextFormat_ReleaseStyleList_5E526.
; ==============================================================================================
InfoWidget_MeasureAndDrawStyled_A46C1	proc far		; CODE XREF: VROOMM_StubThunk_6CA58J

var_14		= word ptr -14h
var_12		= word ptr -12h
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+2Ah]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_2], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_4], ax
		mov	ax, word_6FEDC
		add	ax, 2
		mov	[bp+var_6], ax
		mov	[bp+var_14], 0
		mov	[bp+var_12], 0
		push	ax
		lea	ax, [bp+var_14]
		push	ax

loc_A470E:
		call	TextFormat_ApplyStyleAttribute_5E2D0

loc_A4713:
		add	sp, 4

loc_A4716:
		push	si
		mov	ax, word_6FEDC
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		push	si
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_A473F
		push	word ptr [si+34h]
		jmp	short loc_A4742
; ���������������������������������������������������������������������������

loc_A473F:				; CODE XREF: InfoWidget_MeasureAndDrawStyled_A46C1+77j
		push	word ptr [si+28h]

loc_A4742:				; CODE XREF: InfoWidget_MeasureAndDrawStyled_A46C1+7Cj
		push	0
		mov	al, [si+22h]
		push	ax
		push	large dword ptr	[si+1Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	word_6FEDC
		push	0FFh
		mov	ax, [si+2Eh]
		add	ax, [si+28h]
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		call	VROOMM_StubThunk_6C884
		add	sp, 0Ah
		push	si

loc_A4788:
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		lea	ax, [bp+var_14]
		push	ax
		mov	ax, word_6FEDC
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		lea	ax, [bp+var_14]
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		pop	si
		leave
		retf
InfoWidget_MeasureAndDrawStyled_A46C1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx+0x0C].
; ==============================================================================================
InfoWidget_Method_Dispatch0CC_A47AE	proc far		; CODE XREF: VROOMM_StubThunk_6CA5DJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0FFFFFFFFh
		push	word ptr [si+32h]
		push	word ptr [si+30h]
		mov	bx, [si+30h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
InfoWidget_Method_Dispatch0CC_A47AE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx+0x0C].
; ==============================================================================================
InfoWidget_Method_Dispatch0CD_A47CD	proc far		; CODE XREF: VROOMM_StubThunk_6CA62J

arg_0		= word ptr  6
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 1
		jnz	short loc_A47DF
		mov	dx, [si+32h]
		jmp	short loc_A47E2
; ���������������������������������������������������������������������������

loc_A47DF:				; CODE XREF: InfoWidget_Method_Dispatch0CD_A47CD+Bj
		mov	dx, [si+36h]

loc_A47E2:				; CODE XREF: InfoWidget_Method_Dispatch0CD_A47CD+10j
		push	large 0FFFFFFFFh
		push	dx
		push	word ptr [si+30h]
		mov	bx, [si+30h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
InfoWidget_Method_Dispatch0CD_A47CD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle deux stubs voisins (sub_6C785/sub_6C78A).
; ==============================================================================================
InfoWidget_ApplyStubHelpers_A47F8	proc far		; CODE XREF: VROOMM_StubThunk_6CA67J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6C785
		pop	cx
		push	word ptr [si+2Eh]
		push	si
		call	VROOMM_StubThunk_6C78A
		add	sp, 4
		pop	si
		pop	bp
		retf
InfoWidget_ApplyStubHelpers_A47F8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé, 40 lignes).
; ==============================================================================================
InfoWidget_Helper3_A4815	proc far		; CODE XREF: VROOMM_StubThunk_6CA6CJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_A481C:
		cmp	word ptr [si+2Ch], 0
		jge	short loc_A482E

loc_A4822:
		mov	bx, [si+2Ah]
		mov	ax, [bx]

loc_A4827:
		cmp	ax, [si+2Eh]
		jle	short loc_A4840
		jmp	short loc_A4838
; ���������������������������������������������������������������������������

loc_A482E:				; CODE XREF: InfoWidget_Helper3_A4815+Bj
		mov	bx, [si+2Ah]
		mov	ax, [bx]
		cmp	ax, [si+30h]
		jge	short loc_A4840

loc_A4838:				; CODE XREF: InfoWidget_Helper3_A4815+17j
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		add	[bx], ax

loc_A4840:				; CODE XREF: InfoWidget_Helper3_A4815+15j
					; InfoWidget_Helper3_A4815+21j
		pop	si
		pop	bp
		retf
InfoWidget_Helper3_A4815	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable via champ [si+0x2A].
; ==============================================================================================
InfoWidget_Method_DispatchField2A_A4843	proc far		; CODE XREF: VROOMM_StubThunk_6CA71J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_A4846:
		push	si
		mov	si, [bp+arg_0]

loc_A484A:
		call	dword ptr [si+2Ah]

loc_A484D:
		pop	si
		pop	bp
		retf
InfoWidget_Method_DispatchField2A_A4843	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
InfoWidget_Helper4_A4850	proc far		; CODE XREF: VROOMM_StubThunk_6CA76J

arg_0		= word ptr  6

		push	bp

loc_A4851:
		mov	bp, sp
		push	si

loc_A4854:
		mov	si, [bp+arg_0]

loc_A4857:
		mov	bx, [si+2Ah]
		mov	ax, [bx]
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bx], ax
		pop	si
		pop	bp
		retf
InfoWidget_Helper4_A4850	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
InfoWidget_Helper5_A4866	proc far		; CODE XREF: VROOMM_StubThunk_6CA7BJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_A487F
		mov	ax, [si+2Ch]
		jmp	short loc_A4882
; ���������������������������������������������������������������������������

loc_A487F:				; CODE XREF: InfoWidget_Helper5_A4866+12j
		mov	ax, [si+2Eh]

loc_A4882:				; CODE XREF: InfoWidget_Helper5_A4866+17j
		mov	bx, [si+2Ah]
		mov	[bx], ax
		pop	si

loc_A4888:
		pop	bp
		retf
InfoWidget_Helper5_A4866	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 107 lignes, NON DÉTAILLÉE — combine plusieurs stubs voisins
; (sub_6C79E/6C799/6C7A3/6C7B2 ×4), le verrou d'ownership — probable dessin composite de
; plusieurs sous-éléments du widget.
; ==============================================================================================
InfoWidget_DrawComposite_A488A	proc far		; CODE XREF: VROOMM_StubThunk_6CA80J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_A4892:
		push	word_6FE9C

loc_A4896:
		push	si

loc_A4897:
		call	VROOMM_StubThunk_6C79E
		add	sp, 4
		push	word_6FE74
		push	si
		call	VROOMM_StubThunk_6C799
		add	sp, 4
		push	word_6FE74
		mov	ax, [si+1Ch]
		add	ax, 0FFFCh
		push	ax
		push	large 80002h
		push	3
		push	si
		call	VROOMM_StubThunk_6C7A3
		add	sp, 0Ch
		mov	di, word_6FE98
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_A4948
		mov	di, word_6FE74
		push	word_6FE92
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	large 90002h
		push	3
		push	si
		call	VROOMM_StubThunk_6C7B2
		add	sp, 0Ch
		push	word_6FE92
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	large 0A0002h
		push	4
		push	si
		call	VROOMM_StubThunk_6C7B2
		add	sp, 0Ch
		push	word_6FE92
		mov	ax, [si+1Ch]

loc_A4917:
		add	ax, 0FFFDh
		push	ax

loc_A491B:
		push	large 30002h

loc_A4921:
		push	9
		push	si
		call	VROOMM_StubThunk_6C7B2
		add	sp, 0Ch
		push	word_6FE92
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	large 40002h
		push	0Ah
		push	si
		call	VROOMM_StubThunk_6C7B2

loc_A4945:
		add	sp, 0Ch

loc_A4948:				; CODE XREF: InfoWidget_DrawComposite_A488A+48j
		push	si
		call	VROOMM_StubThunk_6C7B7
		pop	cx

loc_A494F:
		push	word_6FEDC
		push	di
		push	word ptr [si+20h]
		mov	ax, [si+6]
		add	ax, 2
		push	ax
		mov	ax, [si+4]
		add	ax, 0Dh
		push	ax
		call	VROOMM_StubThunk_6C884
		add	sp, 0Ah
		push	si
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
InfoWidget_DrawComposite_A488A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx+0x18].
; ==============================================================================================
InfoWidget_Method_Dispatch18_A4978	proc far		; CODE XREF: VROOMM_StubThunk_6CA85J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_A497F:
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_A498C

loc_A4987:
		mov	byte ptr [bx], 0
		jmp	short loc_A4992
; ���������������������������������������������������������������������������

loc_A498C:				; CODE XREF: InfoWidget_Method_Dispatch18_A4978+Dj
		mov	bx, [si+1Eh]
		mov	byte ptr [bx], 1

loc_A4992:				; CODE XREF: InfoWidget_Method_Dispatch18_A4978+12j
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		pop	si
		pop	bp
		retf
InfoWidget_Method_Dispatch18_A4978	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que InfoWidget_MeasureAndDrawA_A45AC (variante de champ).
; ==============================================================================================
InfoWidget_MeasureAndDrawC_A499D	proc far		; CODE XREF: VROOMM_StubThunk_6CA8AJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_A49B8
		push	word ptr [si+2Ch]
		jmp	short loc_A49BB
; ���������������������������������������������������������������������������

loc_A49B8:				; CODE XREF: InfoWidget_MeasureAndDrawC_A499D+14j
		push	word ptr [si+2Ah]

loc_A49BB:				; CODE XREF: InfoWidget_MeasureAndDrawC_A499D+19j
		push	0
		mov	al, [si+24h]
		push	ax
		push	large dword ptr	[si+20h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	si
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		pop	si
		pop	bp
		retf
InfoWidget_MeasureAndDrawC_A499D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable [bx+0x18].
; ==============================================================================================
InfoWidget_Method_Dispatch18B_A49EE	proc far		; CODE XREF: VROOMM_StubThunk_6CA8FJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_A4A02
		mov	byte ptr [bx], 0
		jmp	short loc_A4A08
; ���������������������������������������������������������������������������

loc_A4A02:				; CODE XREF: InfoWidget_Method_Dispatch18B_A49EE+Dj
		mov	bx, [si+1Eh]
		mov	byte ptr [bx], 1

loc_A4A08:				; CODE XREF: InfoWidget_Method_Dispatch18B_A49EE+12j
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		pop	si
		pop	bp

locret_A4A12:
		retf
InfoWidget_Method_Dispatch18B_A49EE	endp

seg446		ends
