seg069		segment	byte public 'CODE' use16
		assume cs:seg069
		;org 0Ah
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextObjectCluster_DestructVariantA_5C42C (sub_5C42C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; destructeur composé : dispatch vtable (+4/+0x14/+0x20), appelle sub_5C579 (destruction de
; sous-objets) puis sub_5F460. Référencée par sub_5C6F3 (seg124/125). Probable membre d'une
; famille de destructeurs quasi-identiques (cf. 5C49A/5C508) — identité non vérifiée.
; ==============================================================================================
TextObjectCluster_DestructVariantA_2B51A	proc far		; CODE XREF: Memory_TypedFreeWrapper_2B7E1+2FP

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp

loc_2B51D:				; DATA XREF: seg170:02F6o
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_2B57F
		cmp	[bp+arg_8], 0
		jz	short loc_2B579
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		pop	cx
		push	dx
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		pop	cx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextObjectCluster_DestructSubobjects_2B667
		add	sp, 0Ch
		push	3BE8h
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrame_2FCD5
		add	sp, 4
		jmp	short loc_2B57F
; ���������������������������������������������������������������������������

loc_2B579:				; CODE XREF: TextObjectCluster_DestructVariantA_2B51A+2Cj
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_2B585
; ���������������������������������������������������������������������������

loc_2B57F:				; CODE XREF: TextObjectCluster_DestructVariantA_2B51A+26j
					; TextObjectCluster_DestructVariantA_2B51A+5Dj
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_2B585:				; CODE XREF: TextObjectCluster_DestructVariantA_2B51A+63j
		pop	si
		leave
		retf
TextObjectCluster_DestructVariantA_2B51A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextObjectCluster_DestructVariantB_5C49A (sub_5C49A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, même motif que
; TextObjectCluster_DestructVariantA_5C42C mais appelle sub_5F4A9 en fin de fonction.
; Référencée depuis seg131. Probable duplicat/variante — non vérifié.
; ==============================================================================================
TextObjectCluster_DestructVariantB_2B588	proc far		; CODE XREF: seg070:0122P

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_2B5ED
		cmp	[bp+arg_8], 0
		jz	short loc_2B5E7
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		pop	cx
		push	dx
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		pop	cx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextObjectCluster_DestructSubobjects_2B667
		add	sp, 0Ch
		push	[bp+arg_A]
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4
		jmp	short loc_2B5ED
; ���������������������������������������������������������������������������

loc_2B5E7:				; CODE XREF: TextObjectCluster_DestructVariantB_2B588+2Cj
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_2B5F3
; ���������������������������������������������������������������������������

loc_2B5ED:				; CODE XREF: TextObjectCluster_DestructVariantB_2B588+26j
					; TextObjectCluster_DestructVariantB_2B588+5Dj
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_2B5F3:				; CODE XREF: TextObjectCluster_DestructVariantB_2B588+63j
		pop	si
		leave
		retf
TextObjectCluster_DestructVariantB_2B588	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextObjectCluster_DestructVariantC_5C508 (sub_5C508 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que les variantes A/B, appelle sub_5F460. Référencée par sub_5C774 (seg125).
; Probable duplicat/variante — non vérifié.
; ==============================================================================================
TextObjectCluster_DestructVariantC_2B5F6	proc far		; CODE XREF: Memory_TypedFreeWrapperB_2B862+32P

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_2B65E
		cmp	[bp+arg_8], 0
		jz	short loc_2B658
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		pop	cx
		push	dx
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		pop	cx
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextObjectCluster_DestructSubobjects_2B667
		add	sp, 0Ch
		push	[bp+arg_A]
		push	3BEAh
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrame_2FCD5
		add	sp, 6
		jmp	short loc_2B65E
; ���������������������������������������������������������������������������

loc_2B658:				; CODE XREF: TextObjectCluster_DestructVariantC_2B5F6+2Cj
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_2B664
; ���������������������������������������������������������������������������

loc_2B65E:				; CODE XREF: TextObjectCluster_DestructVariantC_2B5F6+26j
					; TextObjectCluster_DestructVariantC_2B5F6+60j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_2B664:				; CODE XREF: TextObjectCluster_DestructVariantC_2B5F6+66j
		pop	si
		leave
		retf
TextObjectCluster_DestructVariantC_2B5F6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextObjectCluster_DestructSubobjects_5C579 (sub_5C579
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; détruit une série de sous-objets (sub_5E95A ×5, sub_5E9A9 ×2, sub_5EA03) — fonction commune
; appelée par les trois variantes DestructVariantA/B/C.
; ==============================================================================================
TextObjectCluster_DestructSubobjects_2B667	proc far		; CODE XREF: TextObjectCluster_DestructVariantA_2B51A+46p
					; TextObjectCluster_DestructVariantB_2B588+46p ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	[bp+var_2], 0
		cmp	[bp+arg_2], 1
		jnz	short loc_2B69D
		push	3BEFh
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_2F1CF
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		push	3BFFh
		jmp	short loc_2B6DF
; ���������������������������������������������������������������������������

loc_2B69D:				; CODE XREF: TextObjectCluster_DestructSubobjects_2B667+18j
		cmp	[bp+arg_2], 2
		jnz	short loc_2B6BF
		push	3C1Eh
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_2F1CF
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		push	3C2Eh
		jmp	short loc_2B6DF
; ���������������������������������������������������������������������������

loc_2B6BF:				; CODE XREF: TextObjectCluster_DestructSubobjects_2B667+3Aj
		cmp	[bp+arg_2], 3
		jnz	short loc_2B6FC
		push	3C4Ch
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_2F1CF
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		push	3C5Ch

loc_2B6DF:				; CODE XREF: TextObjectCluster_DestructSubobjects_2B667+34j
					; TextObjectCluster_DestructSubobjects_2B667+56j
		lea	ax, [bp+var_4]
		push	ax
		call	DisplaySurface_ConstructWithMode_2F21E
		add	sp, 6
		push	[bp+var_4]
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_2F1CF
		add	sp, 4

loc_2B6FC:				; CODE XREF: TextObjectCluster_DestructSubobjects_2B667+5Cj
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	3C7Ah
		lea	ax, [bp+var_4]
		push	ax
		call	DisplaySurface_ConstructWithMode_2F21E
		add	sp, 0Ch
		push	[bp+var_4]
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_2F1CF
		add	sp, 4
		lea	ax, [bp+var_4]
		push	ax
		call	Member_ClearAndFree_2F278
		pop	cx
		pop	si
		leave
		retf
TextObjectCluster_DestructSubobjects_2B667	endp

seg069		ends
