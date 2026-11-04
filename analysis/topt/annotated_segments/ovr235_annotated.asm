ovr235		segment	para public 'OVERLAY' use16
		assume cs:ovr235
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD5E0		proc far

var_22		= word ptr -22h
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BD637
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_2], ax
		cmp	dword ptr [si+72h], 2
		jle	short loc_BD629
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_4], ax

loc_BD629:
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0
		jmp	short loc_BD642

loc_BD637:
		push	6006h
		call	sub_13451
		add	sp, 2

loc_BD642:
		push	[bp+var_4]
		push	[bp+var_2]
		mov	ax, [bp+arg_0]
		add	ax, 7Ch
		push	[bp+arg_2]
		push	ax
		call	sub_48406
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+80h]
		mov	[bp+var_6], ax
		mov	[bp+var_8], 0
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+82h]
		mov	[bp+var_A], ax
		mov	[bp+var_C], 0
		jmp	loc_BD7CA

loc_BD67D:
		push	si
		call	ResourceRecord_ComputeAlignedBounds_42BD4
		add	sp, 2
		cmp	dword ptr [si+6Dh], 504D5854h
		jnz	short loc_BD695
		mov	ax, 1
		jmp	short loc_BD697

loc_BD695:
		xor	ax, ax

loc_BD697:
		or	ax, ax
		jz	short loc_BD702
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+7Ch]
		cmp	ax, [bp+var_8]
		ja	short loc_BD6B2
		push	6007h
		call	sub_13451
		add	sp, 2

loc_BD6B2:
		push	large 0Eh
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		cmp	[bp+var_16], 5A4Ch
		jnz	short loc_BD6E2
		push	si
		push	[bp+var_18]
		push	[bp+var_1A]
		lea	ax, [bp+var_22]
		push	ax
		push	[bp+var_6]
		call	sub_483E3
		add	sp, 0Ah
		jmp	short loc_BD6F8

loc_BD6E2:
		push	si
		push	[bp+var_18]
		push	[bp+var_1A]
		lea	ax, [bp+var_22]
		push	ax
		push	[bp+var_6]
		call	sub_483DE
		add	sp, 0Ah

loc_BD6F8:
		add	[bp+var_6], 6
		inc	[bp+var_8]
		jmp	loc_BD7BE

loc_BD702:
		cmp	dword ptr [si+6Dh], 414D5854h
		jnz	short loc_BD711
		mov	ax, 1
		jmp	short loc_BD713

loc_BD711:
		xor	ax, ax

loc_BD713:
		or	ax, ax
		jnz	short loc_BD71A
		jmp	loc_BD7BE

loc_BD71A:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+7Eh]
		cmp	ax, [bp+var_C]
		ja	short loc_BD731
		push	6008h
		call	sub_13451
		add	sp, 2

loc_BD731:
		push	large 0Eh
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		push	[bp+var_16]
		push	[bp+var_18]
		push	[bp+var_1A]
		lea	ax, [bp+var_22]
		push	ax
		push	[bp+var_A]
		call	sub_483ED
		add	sp, 0Ah
		xor	di, di
		jmp	short loc_BD7B2

loc_BD75E:
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_E], ax
		cmp	[bp+var_E], 5A4Ch
		jnz	short loc_BD7A4
		push	si
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_10], ax
		push	di
		push	si
		push	[bp+var_A]
		call	sub_483F7
		add	sp, 6
		movsx	eax, [bp+var_10]
		mov	edx, [si+65h]
		add	edx, eax
		mov	[bp+var_14], edx
		mov	eax, [bp+var_14]
		mov	[si+65h], eax
		jmp	short loc_BD7B1

loc_BD7A4:
		push	di
		push	si
		push	[bp+var_A]
		call	sub_483F2
		add	sp, 6

loc_BD7B1:
		inc	di

loc_BD7B2:
		cmp	di, [bp+var_16]
		jl	short loc_BD75E
		add	[bp+var_A], 0Eh
		inc	[bp+var_C]

loc_BD7BE:
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0

loc_BD7CA:
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_BD7DB
		push	si
		call	ResourceRecord_ReadPayload_42DC6
		add	sp, 2
		jmp	short loc_BD7EF

loc_BD7DB:
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_BD7ED
		mov	ax, 1
		jmp	short loc_BD7EF

loc_BD7ED:
		xor	ax, ax

loc_BD7EF:
		or	ax, ax
		jnz	short loc_BD7F6
		jmp	loc_BD67D

loc_BD7F6:
		pop	di
		pop	si
		leave
		retf
sub_BD5E0		endp
ovr235		ends
