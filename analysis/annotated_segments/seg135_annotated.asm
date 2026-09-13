seg135		segment	byte public 'CODE' use16
		assume cs:seg135
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
		push	bp

; ==============================================================================================
; ⚠️ far, 276 lignes, NON DÉTAILLÉE — référencée via vtable (DATA XREF seg216), grande frame
; locale (0x20A octets, buffer texte). Combine massivement sub_2945/sub_2070/sub_22FC (trio de
; formatage déjà vu dans PagedMemory_ReadFormattedString_5BE40, seg127) avec un tag constant
; 3C76h et sub_2B1C/sub_5F700. Probable construction d'une chaîne de texte formatée (étiquette
; d'écran/HUD). Candidat pour session dédiée.
; ==============================================================================================
TextFormat_BuildLabelString_5CE0B:				; DATA XREF: seg216:04FEo
		mov	bp, sp
		sub	sp, 20Ah
		push	si
		xor	si, si
		mov	ax, word_70E28
		xor	dx, dx
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		mov	[bp-6],	ax

loc_5CE22:
		mov	[bp-8],	dx
		push	word ptr [bp+6]

loc_5CE28:
		push	3C76h
		lea	ax, [bp-20Ah]
		push	ax

loc_5CE30:
		call	CRT_Msg_Sprintf1

loc_5CE35:
		add	sp, 6

loc_5CE38:				; CODE XREF: seg135:0096j
		les	bx, [bp-4]
		movsx	eax, word ptr es:[bx]
		shl	eax, 4
		add	eax, 0FFFFFFFCh
		push	eax
		push	word ptr [bp-2]
		push	si
		push	3C97h
		lea	ax, [bp-20Ah]
		push	ax

loc_5CE56:
		call	CRT_Strlen
		pop	cx

loc_5CE5C:
		lea	dx, [bp-20Ah]
		add	ax, dx

loc_5CE62:
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		inc	si
		les	bx, [bp-4]
		mov	ax, es:[bx+6]
		mov	[bp-0Ah], ax
		mov	[bp-2],	ax
		mov	word ptr [bp-4], 0
		mov	eax, [bp-4]
		cmp	eax, [bp-8]
		jz	short loc_5CE98
		lea	ax, [bp-20Ah]
		push	ax
		call	CRT_Strlen
		pop	cx
		cmp	ax, 1D6h
		jb	short loc_5CE38

loc_5CE98:				; CODE XREF: seg135:0086j
		lea	ax, [bp-20Ah]
		push	ax
		call	Runtime_FatalErrorHandler_5F700
		pop	cx
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, word_70E5C
		xor	eax, eax
		mov	[bp-0Ch], eax
		mov	[bp-8],	eax
		push	3CC4h
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		or	si, si
		jz	short loc_5CEE2
		push	si
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_5CEEC
; ���������������������������������������������������������������������������

loc_5CEE2:				; CODE XREF: seg135:00D1j
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_5CEEC:				; CODE XREF: seg135:00E0j
		mov	word ptr [bp-0Eh], 0
		jmp	loc_5CFAD
; ���������������������������������������������������������������������������

loc_5CEF4:
		jmp	loc_5CF87
; ���������������������������������������������������������������������������

loc_5CEF7:				; CODE XREF: seg135:0198j seg135:01A3j
		les	bx, [bp-4]

loc_5CEFA:
		mov	ax, es:[bx]
		mov	[bp-10h], ax

loc_5CF00:
		mov	[bp-12h], ax
		cwd
		xor	ax, dx

loc_5CF06:
		sub	ax, dx
		movsx	eax, ax
		shl	eax, 4
		push	eax
		push	di
		cmp	word ptr [bp-10h], 0
		jg	short loc_5CF1E
		mov	ax, 3CFFh
		jmp	short loc_5CF21
; ���������������������������������������������������������������������������

loc_5CF1E:				; CODE XREF: seg135:0117j
		mov	ax, 3D09h

loc_5CF21:				; CODE XREF: seg135:011Cj
		push	ax
		push	3CDCh

loc_5CF25:
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	si, si

loc_5CF33:
		jz	short loc_5CF44
		push	si

loc_5CF36:
		lea	ax, [bp-66h]
		push	ax

loc_5CF3A:
		call	CRT_Strrchr_Like

loc_5CF3F:
		add	sp, 4

loc_5CF42:
		jmp	short loc_5CF4E
; ���������������������������������������������������������������������������

loc_5CF44:				; CODE XREF: seg135:loc_5CF33j
		lea	ax, [bp-66h]

loc_5CF47:
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_5CF4E:				; CODE XREF: seg135:loc_5CF42j
		cmp	word ptr [bp-10h], 0

loc_5CF52:
		jg	short loc_5CF6D
		mov	ax, [bp-10h]
		mov	[bp-14h], ax
		cwd
		xor	ax, dx

loc_5CF5D:
		sub	ax, dx

loc_5CF5F:
		movsx	eax, ax

loc_5CF63:
		shl	eax, 4
		add	[bp-0Ch], eax
		jmp	short loc_5CF7A
; ���������������������������������������������������������������������������

loc_5CF6D:				; CODE XREF: seg135:loc_5CF52j
		movsx	eax, word ptr [bp-10h]
		shl	eax, 4
		add	[bp-8],	eax

loc_5CF7A:				; CODE XREF: seg135:016Bj
		mov	ax, [bp-10h]
		mov	[bp-16h], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		add	di, ax

loc_5CF87:				; CODE XREF: seg135:loc_5CEF4j
					; seg135:01B1j	...
		mov	[bp-2],	di
		mov	word ptr [bp-4], 0
		les	bx, [bp-4]
		cmp	word ptr es:[bx], 0FFFFh
		jz	short loc_5CF9B
		jmp	loc_5CEF7
; ���������������������������������������������������������������������������

loc_5CF9B:				; CODE XREF: seg135:0196j
		cmp	word ptr es:[bx+4], 1209h
		jz	short loc_5CFA6
		jmp	loc_5CEF7
; ���������������������������������������������������������������������������

loc_5CFA6:				; CODE XREF: seg135:01A1j
		inc	word ptr [bp-0Eh]
		mov	di, word_70E5E

loc_5CFAD:				; CODE XREF: seg135:00F1j
		cmp	word ptr [bp-0Eh], 0
		jz	short loc_5CF87
		cmp	word ptr [bp-0Eh], 1
		jnz	short loc_5CFC0
		cmp	word_70E5E, 0
		jnz	short loc_5CF87

loc_5CFC0:				; CODE XREF: seg135:01B7j
		push	large dword ptr	[bp-0Ch]
		push	large dword ptr	[bp-8]
		push	3D0Eh
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	si, si
		jz	short loc_5CFEA
		push	si
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_5CFF4
; ���������������������������������������������������������������������������

loc_5CFEA:				; CODE XREF: seg135:01D9j
		lea	ax, [bp-66h]
		push	ax

loc_5CFEE:
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_5CFF4:				; CODE XREF: seg135:01E8j
		pop	di
		pop	si
		leave

locret_5CFF7:
		retf
seg135		ends
