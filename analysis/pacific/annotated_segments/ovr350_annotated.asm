ovr350		segment	para public 'OVERLAY' use16
		assume cs:ovr350
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C1910		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_C1929
		push	35h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_C193D

loc_C1929:
		mov	ax, [bp+arg_4]
		mov	[si], ax
		mov	ax, 0FFFFh
		mov	[si+33h], ax
		mov	[si+31h], ax
		mov	[si+2Fh], ax
		mov	[si+2Dh], ax

loc_C193D:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_C1910		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_C1942		proc far

var_196		= word ptr -196h
var_192		= word ptr -192h
var_191		= word ptr -191h
var_171		= dword ptr -171h
var_16D		= dword ptr -16Dh
var_169		= dword ptr -169h
var_165		= dword ptr -165h
var_160		= word ptr -160h
var_103		= dword ptr -103h
var_FF		= dword ptr -0FFh
var_FB		= dword ptr -0FBh
var_F3		= dword ptr -0F3h
var_EA		= dword ptr -0EAh
var_E6		= word ptr -0E6h
var_E4		= word ptr -0E4h
var_B8		= word ptr -0B8h
var_5B		= dword ptr -5Bh
var_57		= dword ptr -57h
var_53		= dword ptr -53h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 196h
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_B8], 508h
		mov	[bp+var_57], 100h
		mov	[bp+var_5B], 0
		mov	[bp+var_B8], 520h
		mov	[bp+var_3C], 0
		xor	ax, ax
		mov	[bp+var_3E], ax
		movsx	eax, ax
		mov	[bp+var_53], eax
		mov	[bp+var_B8], 15AEh
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	0
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_ReadDispatch_6C244
		add	sp, 6
		mov	al, 0
		lea	ax, [bp+var_160]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_160], 508h
		mov	[bp+var_FF], 100h
		mov	[bp+var_103], 0
		mov	[bp+var_160], 520h
		mov	[bp+var_E4], 0
		xor	ax, ax
		mov	[bp+var_E6], ax
		movsx	eax, ax
		mov	[bp+var_FB], eax
		push	1
		push	3800h
		lea	ax, [bp+var_160]
		push	ax
		mov	bx, [bp+var_160]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	[bp+var_F3], 4E53494Dh
		jz	short loc_C1A0B
		push	0F00Eh
		call	sub_1DDFE
		pop	cx

loc_C1A0B:
		lea	ax, [bp+var_160]
		push	ax
		call	sub_6DC9A
		pop	cx
		push	large 0
		push	large 4E53494Dh
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766BA
		add	sp, 0Ah
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766BF
		pop	cx
		push	large 0
		push	large 444C5257h
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766BA
		add	sp, 0Ah
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766BF
		pop	cx
		push	0
		push	large 444C5257h
		lea	ax, [bp+var_160]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_C1A7A
		push	0F00Fh
		call	sub_1DDFE
		pop	cx

loc_C1A7A:
		lea	ax, [bp+var_160]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766F1
		add	sp, 4
		lea	ax, [bp+var_160]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766C9
		pop	cx
		mov	di, 37E0h
		jmp	short loc_C1B08

loc_C1AA7:
		push	large 0
		push	large [di]
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large [di]
		lea	ax, [bp+var_160]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C1AD9
		push	0F010h
		call	sub_1DDFE
		pop	cx

loc_C1AD9:
		lea	ax, [bp+var_160]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766E7
		add	sp, 4
		mov	eax, [bp+var_EA]
		mov	[bp+var_FB], eax
		mov	byte ptr [bp+var_F3], 0
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766D3
		pop	cx
		add	di, 4

loc_C1B08:
		cmp	dword ptr [di], 0
		jnz	short loc_C1AA7
		push	large 0
		push	large 41455241h
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 41455241h
		lea	ax, [bp+var_160]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C1B46
		push	0F011h
		call	sub_1DDFE
		pop	cx

loc_C1B46:
		lea	ax, [bp+var_160]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766E7
		add	sp, 4
		cmp	word ptr [si], 1
		jnz	short loc_C1BC8
		xor	di, di
		jmp	short loc_C1BC3

loc_C1B61:
		mov	byte ptr [bp+var_192], 53h
		mov	[bp+var_165], 4E2000h
		mov	byte ptr [bp+var_191], 0
		mov	[bp+var_171], 0
		mov	[bp+var_16D], 0
		mov	[bp+var_169], 0
		mov	ax, di
		inc	ax
		push	ax
		push	381Eh
		lea	ax, [bp+var_191]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	large [bp+var_53]
		push	large 31h
		push	ss
		lea	ax, [bp+var_192]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_53], 31h
		inc	di

loc_C1BC3:
		cmp	[si+4], di
		jg	short loc_C1B61

loc_C1BC8:
		mov	eax, [bp+var_EA]
		mov	[bp+var_FB], eax
		mov	byte ptr [bp+var_F3], 0
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 54534143h
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 54534143h
		lea	ax, [bp+var_160]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C1C1A
		push	0F012h
		call	sub_1DDFE
		pop	cx

loc_C1C1A:
		push	large 9
		lea	ax, [bp+var_160]
		push	ax
		call	ResourceRecord_RecordCount_6DDDF
		add	sp, 6
		mov	[bp+var_4], ax
		lea	ax, [bp+var_160]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766E7
		add	sp, 4
		cmp	word ptr [si], 1
		jnz	short loc_C1C87
		xor	di, di
		jmp	short loc_C1C82

loc_C1C48:
		mov	[bp+var_6], 0
		jmp	short loc_C1C74

loc_C1C4F:
		mov	byte ptr [bp+var_10], 0
		push	large [bp+var_53]
		push	large 9
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_53], 9
		inc	[bp+var_6]

loc_C1C74:
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+6]
		cmp	ax, [bp+var_6]
		jg	short loc_C1C4F
		inc	di

loc_C1C82:
		cmp	[si+4], di
		jg	short loc_C1C48

loc_C1C87:
		mov	eax, [bp+var_EA]
		mov	[bp+var_FB], eax
		mov	byte ptr [bp+var_F3], 0
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 54524150h
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 54524150h
		lea	ax, [bp+var_160]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C1CD9
		push	0F013h
		call	sub_1DDFE
		pop	cx

loc_C1CD9:
		lea	ax, [bp+var_160]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766E7
		add	sp, 4
		cmp	word ptr [si], 1
		jnz	short loc_C1D58
		mov	[bp+var_6], 0
		xor	di, di
		jmp	short loc_C1D53

loc_C1CF9:
		mov	[bp+var_8], 0
		jmp	short loc_C1D45

loc_C1D00:
		mov	ax, [bp+var_4]
		add	ax, [bp+var_6]
		push	ax
		mov	ax, di
		imul	ax, ax, 0Ah
		mov	dx, si
		add	dx, ax
		add	dx, 6
		push	dx
		lea	ax, [bp+var_196]
		push	ax
		push	cs
		call	near ptr sub_C1910
		add	sp, 6
		push	large [bp+var_53]
		push	large 35h
		push	ss
		lea	ax, [bp+var_196]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_53], 35h
		inc	[bp+var_6]
		inc	[bp+var_8]

loc_C1D45:
		mov	bx, di
		imul	bx, bx, 0Ah
		mov	ax, [bx+si+6]
		cmp	ax, [bp+var_8]
		jg	short loc_C1D00
		inc	di

loc_C1D53:
		cmp	[si+4], di
		jg	short loc_C1CF9

loc_C1D58:
		mov	eax, [bp+var_EA]
		mov	[bp+var_FB], eax
		mov	byte ptr [bp+var_F3], 0
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766D3
		pop	cx
		push	large 0
		push	large 59414C50h
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766BA
		add	sp, 0Ah
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766BF
		pop	cx
		push	0
		push	large 59414C50h
		lea	ax, [bp+var_160]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_C1DB5
		push	0F014h
		call	sub_1DDFE
		pop	cx

loc_C1DB5:
		lea	ax, [bp+var_160]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766F1
		add	sp, 4
		cmp	word ptr [si], 1
		jnz	short loc_C1E24
		xor	di, di
		jmp	short loc_C1E1F

loc_C1DD0:
		push	large 0
		push	large 454E4353h
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	large [bp+var_53]
		push	large 9
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_53], 9
		xor	dx, dx
		jmp	short loc_C1E09

loc_C1E08:
		inc	dx

loc_C1E09:
		mov	bx, di
		imul	bx, bx, 0Ah
		cmp	[bx+si+6], dx
		jg	short loc_C1E08
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766D3
		pop	cx
		inc	di

loc_C1E1F:
		cmp	[si+4], di
		jg	short loc_C1DD0

loc_C1E24:
		lea	ax, [bp+var_160]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766C9
		pop	cx
		push	large 0
		push	large 44414F4Ch
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766B5
		add	sp, 0Ah
		push	0
		push	large 44414F4Ch
		lea	ax, [bp+var_160]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_C1E72
		push	0F015h
		call	sub_1DDFE
		pop	cx

loc_C1E72:
		lea	ax, [bp+var_160]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766E7
		add	sp, 4
		cmp	word ptr [si], 1
		jnz	short loc_C1EB1
		xor	di, di
		jmp	short loc_C1EAC

loc_C1E8D:
		push	large [bp+var_53]
		push	large 9
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	[bp+var_53], 9
		inc	di

loc_C1EAC:
		cmp	[si+4], di
		jg	short loc_C1E8D

loc_C1EB1:
		mov	eax, [bp+var_EA]
		mov	[bp+var_FB], eax
		mov	byte ptr [bp+var_F3], 0
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766D3
		pop	cx
		lea	ax, [bp+var_B8]
		push	ax
		call	sub_766C9
		pop	cx
		lea	ax, [bp+var_160]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		mov	[bp+var_160], 520h
		lea	ax, [bp+var_160]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_160]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		mov	[bp+var_B8], 520h
		lea	ax, [bp+var_B8]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_C1942		endp
ovr350		ends
