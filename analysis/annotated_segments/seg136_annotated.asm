seg136		segment	byte public 'CODE' use16
		assume cs:seg136
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 190 lignes, NON DÉTAILLÉE — validation détaillée d'un bloc de tas (gestion d'erreur
; sub_6B70F ×3, formatage de message sub_22FC). Référencée par Heap_ValidateBlock_5D3AA
; (seg137) — fait partie du gestionnaire de tas bas niveau (Borland), pas du rendu de texte
; comme supposé initialement. CONFIRMÉ par le seg339 : messages « Far Heap Allocation error
; #%04X », « Free block #%02d at %04X:0000, size = %ld », « Invalid pointer free » —
; validation de tas standard du runtime Borland.
; ==============================================================================================
Heap_ValidateBlockDetailed_5CFF8	proc far		; CODE XREF: Heap_ValidateBlock_5D3AA+3EP

var_1		= byte ptr -1
arg_0		= byte ptr  6
arg_2		= byte ptr  8

		push	bp

loc_5CFF9:				; DATA XREF: seg216:off_6A2E6o
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, word_70E22
		or	si, si
		jnz	short loc_5D00B
		jmp	loc_5D100
; ���������������������������������������������������������������������������

loc_5D00B:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+Ej
		cmp	byte_70E27, 0
		jnz	short loc_5D015

loc_5D012:
		jmp	loc_5D0F8
; ���������������������������������������������������������������������������

loc_5D015:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+18j
		jmp	loc_5D100
; ���������������������������������������������������������������������������

loc_5D018:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+105j
		mov	[bp+var_1], 1

loc_5D01C:
		cmp	word ptr [si+2], 0

loc_5D020:
		jz	short loc_5D03B

loc_5D022:
		mov	bx, [si+2]
		mov	di, [bx]

loc_5D027:
		and	di, 0FFFEh
		add	di, [si+2]
		cmp	di, si
		jnz	short loc_5D036
		mov	ax, 1
		jmp	short loc_5D038
; ���������������������������������������������������������������������������

loc_5D036:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+37j
		xor	ax, ax

loc_5D038:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+3Cj
		mov	[bp+var_1], al

loc_5D03B:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8:loc_5D020j
		cmp	[bp+var_1], 0

loc_5D03F:
		jz	short loc_5D05B
		mov	ax, [si]
		and	ax, 0FFFEh
		mov	di, si
		add	di, ax
		cmp	[di+2],	si
		jnz	short loc_5D054
		mov	ax, 1
		jmp	short loc_5D056
; ���������������������������������������������������������������������������

loc_5D054:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+55j
		xor	ax, ax

loc_5D056:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+5Aj
		mov	[bp+var_1], al
		jmp	short loc_5D064
; ���������������������������������������������������������������������������

loc_5D05B:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8:loc_5D03Fj
		push	1307h
		call	VROOMM_StubThunk_6B70F

loc_5D063:
		pop	cx

loc_5D064:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+61j
		cmp	[bp+var_1], 0
		jz	short loc_5D08C
		test	word ptr [si], 1
		jnz	short loc_5D08C
		mov	bx, [si+4]
		cmp	[bx+6],	si
		jnz	short loc_5D085
		mov	bx, [si+6]
		cmp	[bx+4],	si
		jnz	short loc_5D085
		mov	ax, 1
		jmp	short loc_5D087
; ���������������������������������������������������������������������������

loc_5D085:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+7Ej
					; Heap_ValidateBlockDetailed_5CFF8+86j
		xor	ax, ax

loc_5D087:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+8Bj
		mov	[bp+var_1], al
		jmp	short loc_5D09E
; ���������������������������������������������������������������������������

loc_5D08C:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+70j
					; Heap_ValidateBlockDetailed_5CFF8+76j
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5D09E
		push	1307h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5D09E:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+92j
					; Heap_ValidateBlockDetailed_5CFF8+9Bj
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5D0B0
		push	1307h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5D0B0:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+ADj
		mov	dl, [si]
		and	dl, 1
		cmp	[bp+arg_0], 0
		jz	short loc_5D0C3
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jz	short loc_5D0D2

loc_5D0C3:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+C1j
		cmp	[bp+arg_0], 0
		jz	short loc_5D0F1
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5D0F1

loc_5D0D2:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+C9j
		mov	ax, [si]
		and	ax, 0FFFEh
		push	ax
		push	si
		or	dl, dl
		jz	short loc_5D0E2
		mov	ax, 3D61h
		jmp	short loc_5D0E5
; ���������������������������������������������������������������������������

loc_5D0E2:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+E3j
		mov	ax, 3D6Bh

loc_5D0E5:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+E8j
		push	ax
		push	3D40h
		call	CRT_Msg_NullPtrAssign
		add	sp, 8

loc_5D0F1:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+CFj
					; Heap_ValidateBlockDetailed_5CFF8+D8j
		mov	ax, [si]
		and	ax, 0FFFEh
		add	si, ax

loc_5D0F8:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8:loc_5D012j
		cmp	word ptr [si], 1
		jz	short loc_5D100
		jmp	loc_5D018
; ���������������������������������������������������������������������������

loc_5D100:				; CODE XREF: Heap_ValidateBlockDetailed_5CFF8+10j
					; Heap_ValidateBlockDetailed_5CFF8:loc_5D015j	...
		pop	di
		pop	si
		leave
		retf
Heap_ValidateBlockDetailed_5CFF8	endp

seg136		ends
