seg074		segment	byte public 'CODE' use16
		assume cs:seg074
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
		push	bp

loc_2BEF9:				; DATA XREF: seg170:031Eo
		mov	bp, sp
		sub	sp, 20Ah
		push	si
		xor	si, si
		mov	ax, word_46F0A
		xor	dx, dx
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		mov	[bp-6],	ax
		mov	[bp-8],	dx
		push	word ptr [bp+6]
		push	3DE8h
		lea	ax, [bp-20Ah]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6

loc_2BF26:				; CODE XREF: seg074:0094j
		les	bx, [bp-4]
		movsx	eax, word ptr es:[bx]
		shl	eax, 4
		add	eax, 0FFFFFFFCh
		push	eax
		push	word ptr [bp-2]
		push	si
		push	3E09h
		lea	ax, [bp-20Ah]
		push	ax
		call	CRT_Strlen
		pop	cx
		lea	dx, [bp-20Ah]
		add	ax, dx
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
		jz	short loc_2BF86
		lea	ax, [bp-20Ah]
		push	ax
		call	CRT_Strlen
		pop	cx
		cmp	ax, 1D6h
		jb	short loc_2BF26

loc_2BF86:				; CODE XREF: seg074:0084j
		lea	ax, [bp-20Ah]
		push	ax
		call	sub_310B
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
		mov	di, word_46F3E
		xor	eax, eax
		mov	[bp-0Ch], eax
		mov	[bp-8],	eax
		push	3E36h
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		or	si, si
		jz	short loc_2BFD0
		push	si
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_2BFDA
; ���������������������������������������������������������������������������

loc_2BFD0:				; CODE XREF: seg074:00CFj
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_2BFDA:				; CODE XREF: seg074:00DEj
		mov	word ptr [bp-0Eh], 0
		jmp	loc_2C09B
; ���������������������������������������������������������������������������
		jmp	loc_2C075
; ���������������������������������������������������������������������������

loc_2BFE5:				; CODE XREF: seg074:0196j seg074:01A1j
		les	bx, [bp-4]
		mov	ax, es:[bx]
		mov	[bp-10h], ax
		mov	[bp-12h], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		shl	eax, 4
		push	eax
		push	di
		cmp	word ptr [bp-10h], 0
		jg	short loc_2C00C
		mov	ax, 3E71h
		jmp	short loc_2C00F
; ���������������������������������������������������������������������������

loc_2C00C:				; CODE XREF: seg074:0115j
		mov	ax, 3E7Bh

loc_2C00F:				; CODE XREF: seg074:011Aj
		push	ax
		push	3E4Eh
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	si, si
		jz	short loc_2C032
		push	si
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_2C03C
; ���������������������������������������������������������������������������

loc_2C032:				; CODE XREF: seg074:0131j
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_2C03C:				; CODE XREF: seg074:0140j
		cmp	word ptr [bp-10h], 0
		jg	short loc_2C05B
		mov	ax, [bp-10h]
		mov	[bp-14h], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		shl	eax, 4
		add	[bp-0Ch], eax
		jmp	short loc_2C068
; ���������������������������������������������������������������������������

loc_2C05B:				; CODE XREF: seg074:0150j
		movsx	eax, word ptr [bp-10h]
		shl	eax, 4
		add	[bp-8],	eax

loc_2C068:				; CODE XREF: seg074:0169j
		mov	ax, [bp-10h]
		mov	[bp-16h], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		add	di, ax

loc_2C075:				; CODE XREF: seg074:00F2j seg074:01AFj ...
		mov	[bp-2],	di
		mov	word ptr [bp-4], 0
		les	bx, [bp-4]
		cmp	word ptr es:[bx], 0FFFFh
		jz	short loc_2C089
		jmp	loc_2BFE5
; ���������������������������������������������������������������������������

loc_2C089:				; CODE XREF: seg074:0194j
		cmp	word ptr es:[bx+4], 1209h
		jz	short loc_2C094
		jmp	loc_2BFE5
; ���������������������������������������������������������������������������

loc_2C094:				; CODE XREF: seg074:019Fj
		inc	word ptr [bp-0Eh]
		mov	di, word_46F40

loc_2C09B:				; CODE XREF: seg074:00EFj
		cmp	word ptr [bp-0Eh], 0
		jz	short loc_2C075
		cmp	word ptr [bp-0Eh], 1
		jnz	short loc_2C0AE
		cmp	word_46F40, 0
		jnz	short loc_2C075

loc_2C0AE:				; CODE XREF: seg074:01B5j
		push	large dword ptr	[bp-0Ch]
		push	large dword ptr	[bp-8]
		push	3E80h
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	si, si
		jz	short loc_2C0D8
		push	si
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_2C0E2
; ���������������������������������������������������������������������������

loc_2C0D8:				; CODE XREF: seg074:01D7j
		lea	ax, [bp-66h]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_2C0E2:				; CODE XREF: seg074:01E6j
		pop	di
		pop	si
		leave
		retf
seg074		ends
