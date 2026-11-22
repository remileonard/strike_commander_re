ovr266		segment	para public 'OVERLAY' use16
		assume cs:ovr266
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A11F0		proc far

var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_D], 0
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	di, ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Ch]
		mov	es:[bx+98h], ax
		add	es:[bx+1Ch], di
		mov	eax, [si+72h]
		mov	[bp+var_1C], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2], dx
		mov	word ptr [bp+var_20], ax
		mov	eax, [bp+var_20]
		mov	[bp+var_18], eax
		mov	[bp+var_14], 2
		mov	[bp+var_13], 1
		mov	[bp+var_12], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_12], eax
		push	0
		mov	al, [bp+var_14]
		push	ax
		push	large [bp+var_18]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		push	0
		mov	al, [bp+var_14]
		push	ax
		push	large [bp+var_18]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_22], dx
		mov	[bp+var_24], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_30], eax
		push	0
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_32], dx
		mov	[bp+var_34], ax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+1Ch]
		sub	si, di
		jmp	loc_A15D8

loc_A12EB:
		les	bx, [bp+var_24]
		mov	al, es:[bx+1]
		mov	ah, 0
		imul	ax, ax, 2Ah
		mov	dx, word ptr [bp+var_30+2]
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		mov	bx, [bp+var_24]
		mov	al, es:[bx+2]
		mov	ah, 0
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], bx
		mov	bx, [bp+var_24]
		mov	al, es:[bx+3]
		mov	ah, 0
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_30]
		add	bx, ax
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], bx
		mov	ax, word_77962
		xor	dx, dx
		sub	ax, [bp+var_34]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, [bp+var_24]
		mov	al, es:[bx+4]
		mov	byte ptr [bp+var_2C+1], al
		mov	al, es:[bx]
		mov	byte ptr [bp+var_2C], al
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	[bp+var_2A], ax
		mov	al, es:[bx+2]
		mov	ah, 0
		mov	[bp+var_28], ax
		mov	al, es:[bx+3]
		mov	ah, 0
		mov	[bp+var_26], ax
		mov	al, es:[bx]
		mov	byte ptr [bp+var_2C], al
		cbw
		mov	bx, ax
		cmp	bx, 9
		ja	short loc_A13CC
		shl	bx, 1
		jmp	cs:off_A160C[bx]	; switch jump

loc_A1392:
		push	4
		push	large dword_7CB50
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	FaceType0_Setup_26BF5

loc_A13C1:
		add	sp, 14h
		add	word_77962, 1Eh
		jmp	loc_A15D3

loc_A13CC:
		push	4
		push	large dword_7CB58
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	FaceType1_Setup_26DF3
		jmp	short loc_A13C1

loc_A13FD:
		push	4
		push	large dword_7CB54
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	FaceType2_Setup_26FE3
		add	sp, 14h
		add	word_77962, 20h
		jmp	loc_A15D3

loc_A1437:
		push	4
		push	large dword_7CB5C
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_273F6
		add	sp, 14h
		add	word_77962, 24h
		jmp	loc_A15D3

loc_A1471:
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A14BE
		les	bx, [bp+var_24]
		mov	al, es:[bx+4]
		cbw
		push	ax
		push	64DEh
		call	Table_LookupByRange_2DEC8
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_A14B2
		push	0
		push	large 0
		push	0C8h
		push	ax
		push	64DEh
		call	sub_2E656
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+7Bh], al
		jmp	short loc_A14BA

loc_A14B2:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+7Bh], 0

loc_A14BA:
		mov	[bp+var_D], 1

loc_A14BE:
		push	4
		push	large dword_7CB60
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_27714
		jmp	loc_A13C1

loc_A14F0:
		push	4
		push	large dword_7CB64
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_2690E
		add	sp, 14h
		add	word_77962, 2Ch
		jmp	loc_A15D3

loc_A152A:
		push	4
		push	large dword_7CB68
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_27CDB
		add	sp, 14h
		add	word_77962, 34h
		jmp	short loc_A15D3

loc_A1563:
		push	4
		push	large dword_7CB6C
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_2806D
		add	sp, 14h
		add	word_77962, 2Eh
		jmp	short loc_A15D3

loc_A159C:
		push	4
		push	large dword_7CB70
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_2690E
		add	sp, 14h
		add	word_77962, 36h

loc_A15D3:
		inc	si
		add	[bp+var_24], 8

loc_A15D8:
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Ch], si
		jle	short loc_A15E4
		jmp	loc_A12EB

loc_A15E4:
		cmp	[bp+var_13], 0
		jz	short loc_A1608
		cmp	[bp+var_18], 0
		jz	short loc_A1608
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A1608

loc_A1608:
		pop	di
		pop	si
		leave
		retf
sub_A11F0		endp

; START OF FUNCTION CHUNK FOR sub_A11F0
off_A160C	dw offset loc_A1392
		dw offset loc_A13CC
		dw offset loc_A13FD
		dw offset loc_A1471
		dw offset loc_A1437
		dw offset loc_A1471
		dw offset loc_A14F0
		dw offset loc_A152A
		dw offset loc_A1563
		dw offset loc_A159C
; END OF FUNCTION CHUNK FOR sub_A11F0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A1620		proc far

var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_D], 0
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	di, ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Ch]
		mov	es:[bx+98h], ax
		add	es:[bx+1Ch], di
		mov	eax, [si+72h]
		mov	[bp+var_1C], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2], dx
		mov	word ptr [bp+var_20], ax
		mov	eax, [bp+var_20]
		mov	[bp+var_18], eax
		mov	[bp+var_14], 2
		mov	[bp+var_13], 1
		mov	[bp+var_12], 0
		mov	eax, [bp+var_1C]
		mov	[bp+var_12], eax
		push	0
		mov	al, [bp+var_14]
		push	ax
		push	large [bp+var_18]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		push	0
		mov	al, [bp+var_14]
		push	ax
		push	large [bp+var_18]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_24+2], dx
		mov	word ptr [bp+var_24], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_28], eax
		push	0
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_2A], dx
		mov	[bp+var_2C], ax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+1Ch]
		sub	si, di
		jmp	loc_A19CE

loc_A171B:
		les	bx, word ptr [bp+var_24]
		mov	ax, es:[bx+2]
		imul	ax, ax, 2Ah
		mov	dx, word ptr [bp+var_28+2]
		mov	bx, word ptr [bp+var_28]
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		mov	bx, word ptr [bp+var_24]
		mov	ax, es:[bx+4]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_28]
		add	bx, ax
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], bx
		mov	bx, word ptr [bp+var_24]
		mov	ax, es:[bx+6]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_28]
		add	bx, ax
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], bx
		mov	ax, word_77962
		xor	dx, dx
		sub	ax, [bp+var_2C]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, word ptr [bp+var_24]
		mov	al, es:[bx]
		cbw
		mov	bx, ax
		cmp	bx, 9
		ja	short loc_A17CA
		shl	bx, 1
		jmp	cs:off_A1A02[bx]	; switch jump

loc_A1791:
		push	4
		push	large dword_7CB50
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	FaceType0_Setup_26BF5

loc_A17BF:
		add	sp, 14h
		add	word_77962, 1Eh
		jmp	loc_A19C9

loc_A17CA:
		push	4
		push	large dword_7CB58
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	FaceType1_Setup_26DF3
		jmp	short loc_A17BF

loc_A17FA:
		push	4
		push	large dword_7CB54
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	FaceType2_Setup_26FE3
		add	sp, 14h
		add	word_77962, 20h
		jmp	loc_A19C9

loc_A1833:
		push	4
		push	large dword_7CB5C
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_273F6
		add	sp, 14h
		add	word_77962, 24h
		jmp	loc_A19C9

loc_A186C:
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A18B9
		les	bx, word ptr [bp+var_24]
		mov	al, es:[bx+1]
		cbw
		push	ax
		push	64DEh
		call	Table_LookupByRange_2DEC8
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_A18AD
		push	0
		push	large 0
		push	0C8h
		push	ax
		push	64DEh
		call	sub_2E656
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+7Bh], al
		jmp	short loc_A18B5

loc_A18AD:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+7Bh], 0

loc_A18B5:
		mov	[bp+var_D], 1

loc_A18B9:
		push	4
		push	large dword_7CB60
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_27714
		jmp	loc_A17BF

loc_A18EA:
		push	4
		push	large dword_7CB64
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_2690E
		add	sp, 14h
		add	word_77962, 2Ch
		jmp	loc_A19C9

loc_A1923:
		push	4
		push	large dword_7CB68
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_27CDB
		add	sp, 14h
		add	word_77962, 34h
		jmp	short loc_A19C9

loc_A195B:
		push	4
		push	large dword_7CB6C
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_2806D
		add	sp, 14h
		add	word_77962, 2Eh
		jmp	short loc_A19C9

loc_A1993:
		push	4
		push	large dword_7CB70
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_24]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_2690E
		add	sp, 14h
		add	word_77962, 36h

loc_A19C9:
		inc	si
		add	word ptr [bp+var_24], 8

loc_A19CE:
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Ch], si
		jle	short loc_A19DA
		jmp	loc_A171B

loc_A19DA:
		cmp	[bp+var_13], 0
		jz	short loc_A19FE
		cmp	[bp+var_18], 0
		jz	short loc_A19FE
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A19FE

loc_A19FE:
		pop	di
		pop	si
		leave
		retf
sub_A1620		endp

; START OF FUNCTION CHUNK FOR sub_A1620
off_A1A02	dw offset loc_A1791
		dw offset loc_A17CA
		dw offset loc_A17FA
		dw offset loc_A186C
		dw offset loc_A1833
		dw offset loc_A186C
		dw offset loc_A18EA
		dw offset loc_A1923
		dw offset loc_A195B
		dw offset loc_A1993
; END OF FUNCTION CHUNK FOR sub_A1620

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A1A16		proc far

var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_11], 0
		mov	eax, [si+72h]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	di, ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Ch]
		mov	es:[bx+9Ah], ax
		add	es:[bx+1Ch], di
		mov	eax, [si+72h]
		mov	[bp+var_20], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_24+2], dx
		mov	word ptr [bp+var_24], ax
		mov	eax, [bp+var_24]
		mov	[bp+var_1C], eax
		mov	[bp+var_18], 2
		mov	[bp+var_17], 1
		mov	[bp+var_16], 0
		mov	eax, [bp+var_20]
		mov	[bp+var_16], eax
		push	0
		mov	al, [bp+var_18]
		push	ax
		push	large [bp+var_1C]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		push	0
		mov	al, [bp+var_18]
		push	ax
		push	large [bp+var_1C]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_28+2], dx
		mov	word ptr [bp+var_28], ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_2C], eax
		push	0
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_2E], dx
		mov	[bp+var_30], ax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+1Ch]
		sub	si, di
		jmp	loc_A1DEE

loc_A1AF7:
		les	bx, word ptr [bp+var_28]
		mov	ax, es:[bx+2]
		imul	ax, ax, 2Ah
		mov	dx, word ptr [bp+var_2C+2]
		mov	bx, word ptr [bp+var_2C]
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		mov	bx, word ptr [bp+var_28]
		mov	ax, es:[bx+4]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_2C]
		add	bx, ax
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], bx
		mov	bx, word ptr [bp+var_28]
		mov	ax, es:[bx+6]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_2C]
		add	bx, ax
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], bx
		mov	bx, word ptr [bp+var_28]
		mov	ax, es:[bx+8]
		imul	ax, ax, 2Ah
		mov	bx, word ptr [bp+var_2C]
		add	bx, ax
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], bx
		mov	ax, word_77962
		xor	dx, dx
		sub	ax, [bp+var_30]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Eh]
		mov	dx, si
		shl	dx, 1
		add	bx, dx
		mov	es:[bx], ax
		les	bx, word ptr [bp+var_28]
		mov	al, es:[bx]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 9
		ja	short loc_A1BC0
		shl	bx, 1
		jmp	cs:off_A1E22[bx]	; switch jump

loc_A1B83:
		push	4
		push	large dword_7CB2C
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_2491B
		add	sp, 18h
		add	word_77962, 22h
		jmp	loc_A1DE9

loc_A1BC0:
		push	4
		push	large dword_7CB34
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_24B28
		add	sp, 18h
		add	word_77962, 22h
		jmp	loc_A1DE9

loc_A1BFD:
		push	4
		push	large dword_7CB30
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_24D1C
		add	sp, 18h
		add	word_77962, 24h
		jmp	loc_A1DE9

loc_A1C3A:
		push	4
		push	large dword_7CB38
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_25134
		add	sp, 18h
		add	word_77962, 28h
		jmp	loc_A1DE9

loc_A1C77:
		mov	al, [bp+var_11]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A1CC5
		les	bx, word ptr [bp+var_28]
		mov	al, es:[bx+1]
		mov	ah, 0
		push	ax
		push	64DEh
		call	Table_LookupByRange_2DEC8
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_A1CB9
		push	0
		push	large 0
		push	0C8h
		push	ax
		push	64DEh
		call	sub_2E656
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+7Bh], al
		jmp	short loc_A1CC1

loc_A1CB9:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+7Bh], 0

loc_A1CC1:
		mov	[bp+var_11], 1

loc_A1CC5:
		push	4
		push	large dword_7CB3C
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_25456
		add	sp, 18h
		add	word_77962, 22h
		jmp	loc_A1DE9

loc_A1D02:
		push	4
		push	large dword_7CB40
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_244DE
		add	sp, 18h
		add	word_77962, 34h
		jmp	loc_A1DE9

loc_A1D3F:
		push	4
		push	large dword_7CB44
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_25A8B
		jmp	short loc_A1DE1

loc_A1D73:
		push	4
		push	large dword_7CB48
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_25E21
		add	sp, 18h
		add	word_77962, 36h
		jmp	short loc_A1DE9

loc_A1DAF:
		push	4
		push	large dword_7CB4C
		push	large word_77962
		call	sub_37C3
		add	sp, 0Ah
		push	large [bp+var_28]
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large word_77962
		call	sub_244DE

loc_A1DE1:
		add	sp, 18h
		add	word_77962, 3Ch

loc_A1DE9:
		inc	si
		add	word ptr [bp+var_28], 0Ah

loc_A1DEE:
		les	bx, [bp+arg_0]
		cmp	es:[bx+1Ch], si
		jle	short loc_A1DFA
		jmp	loc_A1AF7

loc_A1DFA:
		cmp	[bp+var_17], 0
		jz	short loc_A1E1E
		cmp	[bp+var_1C], 0
		jz	short loc_A1E1E
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A1E1E

loc_A1E1E:
		pop	di
		pop	si
		leave
		retf
sub_A1A16		endp

; START OF FUNCTION CHUNK FOR sub_A1A16
off_A1E22	dw offset loc_A1B83
		dw offset loc_A1BC0
		dw offset loc_A1BFD
		dw offset loc_A1C77
		dw offset loc_A1C3A
		dw offset loc_A1C77
		dw offset loc_A1D02
		dw offset loc_A1D3F
		dw offset loc_A1D73
		dw offset loc_A1DAF
; END OF FUNCTION CHUNK FOR sub_A1A16
ovr266		ends
