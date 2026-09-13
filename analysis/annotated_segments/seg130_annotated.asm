seg130		segment	byte public 'CODE' use16
		assume cs:seg130
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, destructeur composé : dispatch vtable (+4/+0x14/+0x20), appelle sub_5C579 (destruction
; de sous-objets) puis sub_5F460. Référencée par sub_5C6F3 (seg124/125). Probable membre d'une
; famille de destructeurs quasi-identiques (cf. 5C49A/5C508) — identité non vérifiée.
; ==============================================================================================
TextObjectCluster_DestructVariantA_5C42C	proc far		; CODE XREF: Memory_TypedFreeWrapper_5C6F3+2FP

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp

loc_5C42F:				; DATA XREF: seg216:04D6o
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
		jnz	short loc_5C491
		cmp	[bp+arg_8], 0
		jz	short loc_5C48B

loc_5C45A:
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
		call	near ptr TextObjectCluster_DestructSubobjects_5C579
		add	sp, 0Ch
		push	3A76h
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrame_5F460
		add	sp, 4
		jmp	short loc_5C491
; ���������������������������������������������������������������������������

loc_5C48B:				; CODE XREF: TextObjectCluster_DestructVariantA_5C42C+2Cj
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_5C497
; ���������������������������������������������������������������������������

loc_5C491:				; CODE XREF: TextObjectCluster_DestructVariantA_5C42C+26j
					; TextObjectCluster_DestructVariantA_5C42C+5Dj
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_5C497:				; CODE XREF: TextObjectCluster_DestructVariantA_5C42C+63j
		pop	si
		leave
		retf
TextObjectCluster_DestructVariantA_5C42C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que TextObjectCluster_DestructVariantA_5C42C mais appelle sub_5F4A9 en fin
; de fonction. Référencée depuis seg131. Probable duplicat/variante — non vérifié.
; ==============================================================================================
TextObjectCluster_DestructVariantB_5C49A	proc far		; CODE XREF: seg131:0124P

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
		jnz	short loc_5C4FF
		cmp	[bp+arg_8], 0
		jz	short loc_5C4F9
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
		call	near ptr TextObjectCluster_DestructSubobjects_5C579
		add	sp, 0Ch
		push	[bp+arg_A]
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4
		jmp	short loc_5C4FF
; ���������������������������������������������������������������������������

loc_5C4F9:				; CODE XREF: TextObjectCluster_DestructVariantB_5C49A+2Cj
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_5C505
; ���������������������������������������������������������������������������

loc_5C4FF:				; CODE XREF: TextObjectCluster_DestructVariantB_5C49A+26j
					; TextObjectCluster_DestructVariantB_5C49A+5Dj
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_5C505:				; CODE XREF: TextObjectCluster_DestructVariantB_5C49A+63j
		pop	si
		leave
		retf
TextObjectCluster_DestructVariantB_5C49A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même motif que les variantes A/B, appelle sub_5F460. Référencée par sub_5C774 (seg125).
; Probable duplicat/variante — non vérifié.
; ==============================================================================================
TextObjectCluster_DestructVariantC_5C508	proc far		; CODE XREF: Memory_TypedFreeWrapperB_5C774+32P

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
		jnz	short loc_5C570
		cmp	[bp+arg_8], 0
		jz	short loc_5C56A
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
		call	near ptr TextObjectCluster_DestructSubobjects_5C579
		add	sp, 0Ch

loc_5C554:
		push	[bp+arg_A]

loc_5C557:
		push	3A78h

loc_5C55A:
		mov	ax, si
		add	ax, 4
		push	ax

loc_5C560:
		call	DisplayContext_CommitFrame_5F460

loc_5C565:
		add	sp, 6
		jmp	short loc_5C570
; ���������������������������������������������������������������������������

loc_5C56A:				; CODE XREF: TextObjectCluster_DestructVariantC_5C508+2Cj
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_5C576
; ���������������������������������������������������������������������������

loc_5C570:				; CODE XREF: TextObjectCluster_DestructVariantC_5C508+26j
					; TextObjectCluster_DestructVariantC_5C508+60j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_5C576:				; CODE XREF: TextObjectCluster_DestructVariantC_5C508+66j
		pop	si
		leave
		retf
TextObjectCluster_DestructVariantC_5C508	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, détruit une série de sous-objets (sub_5E95A ×5, sub_5E9A9 ×2, sub_5EA03) — fonction
; commune appelée par les trois variantes DestructVariantA/B/C.
; ==============================================================================================
TextObjectCluster_DestructSubobjects_5C579	proc far		; CODE XREF: TextObjectCluster_DestructVariantA_5C42C+46p
					; TextObjectCluster_DestructVariantB_5C49A+46p ...

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
		jnz	short loc_5C5AF
		push	3A7Dh
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_5E95A
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		push	3A8Dh
		jmp	short loc_5C5F1
; ���������������������������������������������������������������������������

loc_5C5AF:				; CODE XREF: TextObjectCluster_DestructSubobjects_5C579+18j
		cmp	[bp+arg_2], 2
		jnz	short loc_5C5D1
		push	3AACh
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_5E95A
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		push	3ABCh
		jmp	short loc_5C5F1
; ���������������������������������������������������������������������������

loc_5C5D1:				; CODE XREF: TextObjectCluster_DestructSubobjects_5C579+3Aj
		cmp	[bp+arg_2], 3
		jnz	short loc_5C60E
		push	3ADAh
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_5E95A
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		push	3AEAh

loc_5C5F1:				; CODE XREF: TextObjectCluster_DestructSubobjects_5C579+34j
					; TextObjectCluster_DestructSubobjects_5C579+56j
		lea	ax, [bp+var_4]
		push	ax
		call	DisplaySurface_ConstructWithMode_5E9A9
		add	sp, 6
		push	[bp+var_4]
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_5E95A
		add	sp, 4

loc_5C60E:				; CODE XREF: TextObjectCluster_DestructSubobjects_5C579+5Cj
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	3B08h
		lea	ax, [bp+var_4]
		push	ax
		call	DisplaySurface_ConstructWithMode_5E9A9
		add	sp, 0Ch
		push	[bp+var_4]
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	CachedObject_DestructSubobjects_5E95A
		add	sp, 4
		lea	ax, [bp+var_4]
		push	ax
		call	Member_ClearAndFree_5EA03
		pop	cx

loc_5C640:
		pop	si
		leave
		retf
TextObjectCluster_DestructSubobjects_5C579	endp

seg130		ends
