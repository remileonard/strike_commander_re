seg046		segment	para public 'CODE' use16
		assume cs:seg046
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FEh

loc_1F371:
		db 0B0h, 1

loc_1F373:
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F377		proc far

var_C		= word ptr -0Ch
var_4		= word ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	byte ptr [bp+var_C], 0

loc_1F381:
		lea	ax, [bp+var_C]
		push	ax
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte ptr [bp+var_C], 0
		jnz	short loc_1F3B3
		lea	ax, [bp+var_C]
		push	ax
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1F3B3
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		call	sub_19979
		add	sp, 4
		jmp	short loc_1F3B3

loc_1F3B3:
		cmp	byte ptr [bp+var_C], 0
		jnz	short loc_1F381
		cmp	byte ptr [bp+var_4], 0
		jnz	short loc_1F381
		leave
		retf
sub_1F377		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F3C1		proc far
		push	bp
		mov	bp, sp
		mov	byte_6065A, 0
		call	TextScrollDisplayB_ApplyHelperD_571DE
		pop	bp
		retf
sub_1F3C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F3D0		proc far
		push	bp
		mov	bp, sp
		call	TextScrollDisplayB_ApplyHelperC_571A4
		mov	byte_6065A, 1
		pop	bp
		retf
sub_1F3D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F3DF		proc far

var_52		= word ptr -52h
var_50		= word ptr -50h
var_4D		= word ptr -4Dh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= word ptr -3Eh
var_3C		= byte ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		push	di
		mov	si, [bp+arg_2]
		push	100h
		push	0
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		lea	ax, [bp+var_50]
		push	ax
		call	sub_46B83
		pop	cx
		mov	ax, [bp+var_4D]
		mov	[bp+var_52], ax
		push	large 320032h
		push	32h
		push	ds
		push	ax
		call	sub_21B6B
		add	sp, 0Ah
		mov	[bp+var_2], ax
		lea	ax, [bp+var_50]
		push	ax
		call	sub_46E08
		pop	cx
		mov	bx, word_5B3E1
		mov	al, [bx+16h]
		mov	ah, 0
		mov	[bp+var_3], al
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_14], 0
		mov	byte ptr [bp+var_12+2], 2
		mov	byte ptr [bp+var_12+3], 0
		mov	[bp+var_E], 0
		mov	ax, word_5DD44
		mov	[bp+var_16], ax
		push	ax
		mov	ax, word_5B3E3
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		push	[bp+arg_0]
		push	word_5B3E3
		call	sub_4926B
		add	sp, 4
		mov	[bp+var_18], ax
		mov	bx, [bp+var_18]
		add	bx, 14h
		mov	cx, 14h
		mov	ax, bx
		sar	ax, 1
		mov	dx, 0A0h
		sub	dx, ax
		mov	[bp+var_6], dx
		mov	ax, cx
		sar	ax, 1
		mov	di, 64h
		sub	di, ax
		mov	ax, [bp+var_6]
		add	ax, bx
		dec	ax
		mov	[bp+var_8], ax
		mov	ax, di
		add	ax, cx
		dec	ax
		mov	[bp+var_A], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_22], ax
		mov	[bp+var_24], di
		mov	ax, [bp+var_8]
		mov	[bp+var_26], ax
		mov	ax, [bp+var_A]
		mov	[bp+var_28], ax
		mov	ax, [bp+var_22]
		mov	[bp+var_20], ax
		mov	ax, [bp+var_24]
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_26]
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_28]
		mov	[bp+var_1A], ax
		mov	ax, bx
		imul	cx
		movsx	eax, ax
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_34+2], dx
		mov	word ptr [bp+var_34], ax
		mov	eax, [bp+var_34]
		mov	[bp+var_14], eax
		mov	byte ptr [bp+var_12+2], 2
		mov	byte ptr [bp+var_12+3], 1
		mov	[bp+var_E], 0
		mov	eax, [bp+var_30]
		mov	[bp+var_E], eax
		mov	al, byte_5E7D0
		mov	[bp+var_35], al
		cmp	[bp+var_35], 0
		jz	short loc_1F538
		push	cs
		call	near ptr sub_1F3C1

loc_1F538:
		lea	ax, [bp+var_20]
		push	ax
		cmp	byte ptr [bp+var_12+2], 3
		jnz	short loc_1F559
		push	0
		mov	al, byte ptr [bp+var_12+2]
		push	ax
		push	large [bp+var_14]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1F560

loc_1F559:
		mov	edx, [bp+var_12]
		mov	ax, word ptr [bp+var_14]

loc_1F560:
		push	dx
		push	ax
		push	word_5DD44
		call	sub_4AB4C
		add	sp, 8
		push	0
		push	[bp+var_A]
		push	[bp+var_8]
		push	di
		push	[bp+var_6]
		push	word_5DD44
		call	sub_493A8
		add	sp, 0Ch
		mov	ax, [bp+var_18]
		sar	ax, 1
		mov	dx, 0A0h
		sub	dx, ax
		mov	[bp+var_38], dx
		push	[bp+arg_0]
		mov	ax, di
		add	ax, 5
		push	ax
		push	dx
		push	201Bh
		push	word_5B3E3
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah
		cmp	[bp+var_35], 0
		jz	short loc_1F5B6
		push	cs
		call	near ptr sub_1F3D0

loc_1F5B6:
		mov	ax, word_5CF9F
		mov	[bp+var_3A], ax
		cmp	[bp+var_3A], 0
		jz	short loc_1F5C9
		push	ax
		call	sub_4140B
		pop	cx

loc_1F5C9:
		mov	di, word_5CF9D
		or	di, di
		jz	short loc_1F5DE
		push	0
		push	word ptr [di+4]
		call	sub_9CC3
		add	sp, 4

loc_1F5DE:
		push	cs
		call	near ptr sub_1F377
		mov	[bp+var_3E], 0
		xor	eax, eax
		mov	[bp+var_42], eax
		mov	[bp+var_46], eax
		mov	eax, [bp+arg_4]
		mov	[bp+var_4A], eax
		mov	[bp+var_42], eax
		mov	eax, dword_5E7D3
		mov	[bp+var_46], eax

loc_1F606:
		cmp	[bp+arg_4], 4B0h
		jnb	short loc_1F62F
		mov	eax, [bp+var_46]
		add	eax, [bp+var_42]
		cmp	eax, dword_5E7D3
		ja	short loc_1F624
		mov	ax, 1
		jmp	short loc_1F626

loc_1F624:
		xor	ax, ax

loc_1F626:
		or	al, al
		jz	short loc_1F62F
		mov	byte ptr [si], 0
		jmp	short loc_1F66A

loc_1F62F:
		cmp	[bp+var_3E], 0
		jnz	short loc_1F651
		push	0FFh
		push	si
		call	sub_55996
		add	sp, 4
		cmp	byte ptr [si], 1
		jnz	short loc_1F606
		mov	al, [si+1]
		mov	[bp+var_3C], al
		inc	[bp+var_3E]
		jmp	short loc_1F606

loc_1F651:
		push	0FFh
		push	si
		call	sub_55996
		add	sp, 4
		cmp	byte ptr [si], 2
		jnz	short loc_1F606
		mov	al, [si+1]
		cmp	al, [bp+var_3C]
		jnz	short loc_1F606

loc_1F66A:
		cmp	[bp+var_3A], 0
		jz	short loc_1F679
		push	[bp+var_3A]
		call	sub_41438
		pop	cx

loc_1F679:
		or	di, di
		jz	short loc_1F68A
		push	0
		push	word ptr [di+4]
		call	sub_9CC9
		add	sp, 4

loc_1F68A:
		cmp	[bp+var_35], 0
		jz	short loc_1F694
		push	cs
		call	near ptr sub_1F3C1

loc_1F694:
		lea	ax, [bp+var_20]
		push	ax
		cmp	byte ptr [bp+var_12+2], 3
		jnz	short loc_1F6B5
		push	0
		mov	al, byte ptr [bp+var_12+2]
		push	ax
		push	large [bp+var_14]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_1F6BC

loc_1F6B5:
		mov	edx, [bp+var_12]
		mov	ax, word ptr [bp+var_14]

loc_1F6BC:
		push	dx
		push	ax
		push	word_5DD44
		call	sub_4A530
		add	sp, 8
		cmp	[bp+var_35], 0
		jz	short loc_1F6D4
		push	cs
		call	near ptr sub_1F3D0

loc_1F6D4:
		mov	al, [bp+var_3]
		push	ax
		push	word_5B3E1
		mov	bx, word_5B3E1
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	byte ptr [bp+var_12+3], 0
		jz	short loc_1F70C
		cmp	[bp+var_14], 0
		jz	short loc_1F70C
		push	0
		mov	al, byte ptr [bp+var_12+2]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_1F70C

loc_1F70C:
		pop	di
		pop	si
		leave
		retf
sub_1F3DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F710		proc far

var_2C		= word ptr -2Ch
var_4		= word ptr -4
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		mov	byte ptr [bp+var_2C], 0
		cmp	[bp+arg_0], 56h
		jnz	short loc_1F734
		push	69Ah
		push	2022h
		lea	ax, [bp+var_2C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		jmp	short loc_1F78F

loc_1F734:
		cmp	[bp+arg_0], 50h
		jnz	short loc_1F748
		push	202Dh
		lea	ax, [bp+var_2C]
		push	ax
		call	CRT_Msg_Sprintf1
		jmp	short loc_1F78C

loc_1F748:
		cmp	[bp+arg_0], 49h
		jnz	short loc_1F76F
		mov	al, byte_5FA6C
		mov	ah, 0
		push	ax
		push	word_5F8E2
		mov	al, byte_5F8E4
		mov	ah, 0
		push	ax
		push	2039h
		lea	ax, [bp+var_2C]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		jmp	short loc_1F78F

loc_1F76F:
		cmp	[bp+arg_0], 58h
		jnz	short loc_1F77A
		push	204Bh
		jmp	short loc_1F783

loc_1F77A:
		cmp	[bp+arg_0], 4Dh
		jnz	short loc_1F78F
		push	205Eh

loc_1F783:
		lea	ax, [bp+var_2C]
		push	ax
		call	CRT_Strcpy

loc_1F78C:
		add	sp, 4

loc_1F78F:
		push	large 4B0h
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		push	cs
		call	near ptr sub_1F3DF
		add	sp, 8
		cmp	[bp+arg_0], 58h
		jnz	short loc_1F7B7
		cmp	byte ptr [bp+var_4+1], 15h
		jnz	short loc_1F7C8
		nop
		push	cs
		call	near ptr sub_1FA10
		jmp	short loc_1F7C8

loc_1F7B7:
		cmp	[bp+arg_0], 4Dh
		jnz	short loc_1F7C8
		cmp	byte ptr [bp+var_4+1], 15h
		jnz	short loc_1F7C8
		nop
		push	cs
		call	near ptr sub_1FA35

loc_1F7C8:
		leave
		retf
sub_1F710		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F7CA		proc far

var_6		= word ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		cmp	byte_605CE, 1
		jz	short loc_1F7E0
		cmp	byte_605EF, 1
		jnz	short loc_1F7E5

loc_1F7E0:
		mov	ax, 1
		jmp	short loc_1F7E7

loc_1F7E5:
		xor	ax, ax

loc_1F7E7:
		mov	[bp+var_1], al
		cmp	byte_5FDDE, 1
		jnz	short loc_1F801
		test	byte_5FDE1, 30h
		jz	short loc_1F7FD
		mov	ax, 1
		jmp	short loc_1F7FF

loc_1F7FD:
		xor	ax, ax

loc_1F7FF:
		jmp	short loc_1F816

loc_1F801:
		cmp	byte_605B3, 1
		jz	short loc_1F80F
		cmp	byte_605EB, 1
		jnz	short loc_1F814

loc_1F80F:
		mov	ax, 1
		jmp	short loc_1F816

loc_1F814:
		xor	ax, ax

loc_1F816:
		mov	[bp+var_2], al
		cmp	[bp+var_2], 0
		jnz	short loc_1F822
		jmp	loc_1F942

loc_1F822:
		cmp	byte_605B5, 1
		jnz	short loc_1F87C
		cmp	byte_5FE42, 0
		jz	short loc_1F875
		mov	al, byte_603B4
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_603B4, al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1F848
		mov	byte_603B5, 1

loc_1F848:
		cmp	byte_603B4, 0
		jz	short loc_1F85B
		push	large 2Dh
		lea	ax, [bp+var_6]
		push	ax
		push	2074h
		jmp	short loc_1F865

loc_1F85B:
		push	large 2Dh
		lea	ax, [bp+var_6]
		push	ax
		push	207Eh

loc_1F865:
		push	cs
		call	near ptr sub_1F3DF
		add	sp, 8
		push	668Ch
		call	sub_3D45B
		pop	cx

loc_1F875:
		mov	byte_5FE42, 0
		jmp	short loc_1F881

loc_1F87C:
		mov	byte_5FE42, 1

loc_1F881:
		cmp	byte_603B4, 0
		jz	short loc_1F8DC
		cmp	byte_605AA, 1
		jnz	short loc_1F8D7
		cmp	byte_5FE43, 0
		jz	short loc_1F8D0
		mov	al, byte_603B5
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_603B5, al
		cmp	byte_603B5, 0
		jz	short loc_1F8B6
		push	large 2Dh
		lea	ax, [bp+var_6]
		push	ax
		push	2089h
		jmp	short loc_1F8C0

loc_1F8B6:
		push	large 2Dh
		lea	ax, [bp+var_6]
		push	ax
		push	2091h

loc_1F8C0:
		push	cs
		call	near ptr sub_1F3DF
		add	sp, 8
		push	668Ch
		call	sub_3D45B
		pop	cx

loc_1F8D0:
		mov	byte_5FE43, 0
		jmp	short loc_1F8DC

loc_1F8D7:
		mov	byte_5FE43, 1

loc_1F8DC:
		cmp	byte_605C8, 1
		jnz	short loc_1F93D
		cmp	byte_5FE44, 0
		jz	short loc_1F936
		mov	al, byte_603B1
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_603B1, al
		cmp	byte_603B1, 0
		jz	short loc_1F913
		push	6040h
		call	sub_13DD2
		pop	cx
		push	large 2Dh
		lea	ax, [bp+var_6]
		push	ax
		push	209Ah
		jmp	short loc_1F926

loc_1F913:
		push	6040h
		call	sub_13D97
		pop	cx
		push	large 2Dh
		lea	ax, [bp+var_6]
		push	ax
		push	20A3h

loc_1F926:
		push	cs
		call	near ptr sub_1F3DF
		add	sp, 8
		push	668Ch
		call	sub_3D45B
		pop	cx

loc_1F936:
		mov	byte_5FE44, 0
		jmp	short loc_1F942

loc_1F93D:
		mov	byte_5FE44, 1

loc_1F942:
		cmp	[bp+var_1], 0
		jnz	short loc_1F94B
		jmp	loc_1F9F5

loc_1F94B:
		mov	dl, 0
		cmp	byte_605BA, 1
		jnz	short loc_1F9AF
		mov	al, [bp+arg_0]
		mov	ah, 0
		or	ax, ax
		jz	short loc_1F960
		jmp	loc_1F9F5

loc_1F960:
		mov	di, word_5CF9F
		or	di, di
		jz	short loc_1F96F
		push	di
		call	sub_4140B
		pop	cx

loc_1F96F:
		mov	si, word_5CF9D
		or	si, si
		jz	short loc_1F984
		push	0
		push	word ptr [si+4]
		call	sub_9CC3
		add	sp, 4

loc_1F984:
		push	1
		push	605Fh
		call	sub_58BC4
		add	sp, 4
		or	di, di
		jz	short loc_1F99C
		push	di
		call	sub_41438
		pop	cx

loc_1F99C:
		or	si, si
		jz	short loc_1F9F5
		push	0
		push	word ptr [si+4]
		call	sub_9CC9
		add	sp, 4
		jmp	short loc_1F9F5

loc_1F9AF:
		cmp	byte_605C5, 1
		jnz	short loc_1F9BA
		mov	dl, 56h
		jmp	short loc_1F9EB

loc_1F9BA:
		cmp	byte_605AF, 1
		jnz	short loc_1F9C5
		mov	dl, 50h
		jmp	short loc_1F9EB

loc_1F9C5:
		cmp	byte_605C3, 1
		jnz	short loc_1F9D0
		mov	dl, 58h
		jmp	short loc_1F9EB

loc_1F9D0:
		cmp	byte_605C8, 1
		jnz	short loc_1F9DB
		mov	dl, 4Dh
		jmp	short loc_1F9EB

loc_1F9DB:
		cmp	byte_5B3DC, 0
		jz	short loc_1F9EB
		cmp	byte_605AD, 1
		jnz	short loc_1F9EB
		mov	dl, 49h

loc_1F9EB:
		or	dl, dl
		jz	short loc_1F9F5
		push	dx
		push	cs
		call	near ptr sub_1F710
		pop	cx

loc_1F9F5:
		cmp	byte_605AF, 1
		jnz	short loc_1FA0C
		mov	al, byte_5BD3A
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1FA0C
		push	50h
		push	cs
		call	near ptr sub_1F710
		pop	cx

loc_1FA0C:
		pop	di
		pop	si
		leave
		retf
sub_1F7CA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FA10		proc far
		push	bp
		mov	bp, sp
		mov	byte_5CFA5, 1
		call	Keyboard_DrainBufferBIOS_578C9
		call	sub_47E06
		push	20ADh
		call	CRT_Msg_NullPtrAssign
		pop	cx
		push	1
		call	CRT_Exit
		pop	cx
		pop	bp
		retf
sub_1FA10		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FA35		proc far
		push	bp
		mov	bp, sp
		mov	byte_5CFA5, 1
		call	Keyboard_DrainBufferBIOS_578C9
		call	sub_47E06
		push	3
		call	CRT_Exit
		pop	cx
		pop	bp
		retf
sub_1FA35		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FA51		proc far

var_E		= word ptr -0Eh
var_6		= word ptr -6
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		mov	[bp+var_1], 0
		push	0
		push	cs
		call	near ptr sub_1F7CA
		pop	cx
		cmp	byte_603DE, 0
		jnz	short loc_1FAD5
		mov	byte ptr [bp+var_E], 0
		lea	ax, [bp+var_E]
		push	ax
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte ptr [bp+var_E], 0
		jnz	short loc_1FA9F
		lea	ax, [bp+var_E]
		push	ax
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1FA9F
		lea	ax, [bp+var_6]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		call	sub_19979
		add	sp, 4
		jmp	short loc_1FA9F

loc_1FA9F:
		cmp	byte ptr [bp+var_6], 1
		jnz	short loc_1FAB4
		push	0FFh
		lea	ax, [bp+var_6]
		push	ax
		call	sub_55996
		add	sp, 4

loc_1FAB4:
		cmp	byte ptr [bp+var_6], 2
		jnz	short loc_1FACF
		cmp	byte ptr [bp+var_6+1], 1
		jnz	short loc_1FAC7
		mov	byte_603DE, 1
		jmp	short loc_1FAD5

loc_1FAC7:
		cmp	byte ptr [bp+var_6+1], 39h
		jnz	short loc_1FAD9
		jmp	short loc_1FAD5
sub_1FA51		endp

; START OF FUNCTION CHUNK FOR sub_1FA51

loc_1FACF:
		db 80h
; END OF FUNCTION CHUNK FOR sub_1FA51
seg046		ends
