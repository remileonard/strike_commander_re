seg075		segment	byte public 'CODE' use16
		assume cs:seg075
		;org 6
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Heap_ValidateBlockDetailed_5CFF8 (sub_5CFF8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 190 lignes, NON DÉTAILLÉE — validation détaillée d'un bloc de tas (gestion d'erreur
; sub_6B70F ×3, formatage de message sub_22FC). Référencée par Heap_ValidateBlock_5D3AA
; (seg137) — fait partie du gestionnaire de tas bas niveau (Borland), pas du rendu de texte
; comme supposé initialement. CONFIRMÉ par le seg339 : messages « Far Heap Allocation error
; #%04X », « Free block #%02d at %04X:0000, size = %ld », « Invalid pointer free » —
; validation de tas standard du runtime Borland.
; ==============================================================================================
Heap_ValidateBlockDetailed_2C0E6	proc far		; CODE XREF: Heap_ValidateBlock_2C498+3EP

var_1		= byte ptr -1
arg_0		= byte ptr  6
arg_2		= byte ptr  8

		push	bp

loc_2C0E7:				; DATA XREF: seg170:0326o
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, word_46F04
		or	si, si
		jnz	short loc_2C0F9
		jmp	loc_2C1EE
; ���������������������������������������������������������������������������

loc_2C0F9:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+Ej
		cmp	byte_46F09, 0
		jnz	short loc_2C103
		jmp	loc_2C1E6
; ���������������������������������������������������������������������������

loc_2C103:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+18j
		jmp	loc_2C1EE
; ���������������������������������������������������������������������������

loc_2C106:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+105j
		mov	[bp+var_1], 1
		cmp	word ptr [si+2], 0
		jz	short loc_2C129
		mov	bx, [si+2]
		mov	di, [bx]
		and	di, 0FFFEh
		add	di, [si+2]
		cmp	di, si
		jnz	short loc_2C124
		mov	ax, 1
		jmp	short loc_2C126
; ���������������������������������������������������������������������������

loc_2C124:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+37j
		xor	ax, ax

loc_2C126:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+3Cj
		mov	[bp+var_1], al

loc_2C129:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+28j
		cmp	[bp+var_1], 0
		jz	short loc_2C149
		mov	ax, [si]
		and	ax, 0FFFEh
		mov	di, si
		add	di, ax
		cmp	[di+2],	si
		jnz	short loc_2C142
		mov	ax, 1
		jmp	short loc_2C144
; ���������������������������������������������������������������������������

loc_2C142:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+55j
		xor	ax, ax

loc_2C144:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+5Aj
		mov	[bp+var_1], al
		jmp	short loc_2C152
; ���������������������������������������������������������������������������

loc_2C149:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+47j
		push	1307h
		call	sub_30D3
		pop	cx

loc_2C152:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+61j
		cmp	[bp+var_1], 0
		jz	short loc_2C17A
		test	word ptr [si], 1
		jnz	short loc_2C17A
		mov	bx, [si+4]
		cmp	[bx+6],	si
		jnz	short loc_2C173
		mov	bx, [si+6]
		cmp	[bx+4],	si
		jnz	short loc_2C173
		mov	ax, 1
		jmp	short loc_2C175
; ���������������������������������������������������������������������������

loc_2C173:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+7Ej
					; Heap_ValidateBlockDetailed_2C0E6+86j
		xor	ax, ax

loc_2C175:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+8Bj
		mov	[bp+var_1], al
		jmp	short loc_2C18C
; ���������������������������������������������������������������������������

loc_2C17A:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+70j
					; Heap_ValidateBlockDetailed_2C0E6+76j
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2C18C
		push	1307h
		call	sub_30D3
		pop	cx

loc_2C18C:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+92j
					; Heap_ValidateBlockDetailed_2C0E6+9Bj
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2C19E
		push	1307h
		call	sub_30D3
		pop	cx

loc_2C19E:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+ADj
		mov	dl, [si]
		and	dl, 1
		cmp	[bp+arg_0], 0
		jz	short loc_2C1B1
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jz	short loc_2C1C0

loc_2C1B1:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+C1j
		cmp	[bp+arg_0], 0
		jz	short loc_2C1DF
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2C1DF

loc_2C1C0:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+C9j
		mov	ax, [si]
		and	ax, 0FFFEh
		push	ax
		push	si
		or	dl, dl
		jz	short loc_2C1D0
		mov	ax, 3ED3h
		jmp	short loc_2C1D3
; ���������������������������������������������������������������������������

loc_2C1D0:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+E3j
		mov	ax, 3EDDh

loc_2C1D3:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+E8j
		push	ax
		push	3EB2h
		call	CRT_Msg_NullPtrAssign
		add	sp, 8

loc_2C1DF:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+CFj
					; Heap_ValidateBlockDetailed_2C0E6+D8j
		mov	ax, [si]
		and	ax, 0FFFEh
		add	si, ax

loc_2C1E6:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+1Aj
		cmp	word ptr [si], 1
		jz	short loc_2C1EE
		jmp	loc_2C106
; ���������������������������������������������������������������������������

loc_2C1EE:				; CODE XREF: Heap_ValidateBlockDetailed_2C0E6+10j
					; Heap_ValidateBlockDetailed_2C0E6:loc_2C103j	...
		pop	di
		pop	si
		leave
		retf
Heap_ValidateBlockDetailed_2C0E6	endp

seg075		ends
