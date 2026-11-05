ovr212		segment	para public 'OVERLAY' use16
		assume cs:ovr212
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_766F0		proc far

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_4]
		xor	di, di
		mov	[bp+var_2], 0
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_7673F
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	di, ax
		cmp	dword ptr [si+72h], 2
		jle	short loc_76731
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_2], ax

loc_76731:
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0
		jmp	short loc_76748

loc_7673F:
		push	6006h
		call	sub_9D47
		pop	cx

loc_76748:
		push	[bp+var_2]
		push	di
		mov	ax, [bp+arg_0]
		add	ax, 8Ah
		push	[bp+arg_2]
		push	ax
		call	sub_59115
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+8Eh]
		mov	[bp+var_6], eax
		xor	di, di
		mov	eax, es:[bx+92h]
		mov	[bp+var_A], eax
		mov	[bp+var_C], 0
		jmp	loc_7686C

loc_7677F:
		push	si
		call	ResourceRecord_ComputeAlignedBounds_54140
		pop	cx
		cmp	dword ptr [si+6Dh], 504D5854h
		jnz	short loc_76795
		mov	ax, 1
		jmp	short loc_76797

loc_76795:
		xor	ax, ax

loc_76797:
		or	ax, ax
		jz	short loc_76805
		push	large 0Ch
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		cmp	es:[bx+8Ah], di
		ja	short loc_767BF
		push	6007h
		call	sub_9D47
		pop	cx

loc_767BF:
		mov	ax, word ptr [bp+var_14]
		imul	word ptr [bp+var_14+2]
		movzx	eax, ax
		mov	[bp+var_10], eax
		push	2
		push	large [bp+var_14]
		lea	ax, [bp+var_1C]
		push	ax
		push	large [bp+var_6]
		call	sub_590CA
		add	sp, 0Ch
		push	large [bp+var_10]
		push	large [bp+var_6]
		call	sub_590ED
		add	sp, 4
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		add	word ptr [bp+var_6], 0Eh
		inc	di
		jmp	short loc_76860

loc_76805:
		cmp	dword ptr [si+6Dh], 414D5854h
		jnz	short loc_76814
		mov	ax, 1
		jmp	short loc_76816

loc_76814:
		xor	ax, ax

loc_76816:
		or	ax, ax
		jz	short loc_76860
		push	large 0Eh
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+8Ch]
		cmp	ax, [bp+var_C]
		ja	short loc_76841
		push	6008h
		call	sub_9D47
		pop	cx

loc_76841:
		push	large [bp+var_14]
		push	[bp+var_16]
		lea	ax, [bp+var_1E]
		push	ax
		push	si
		push	large [bp+var_A]
		call	sub_59106
		add	sp, 0Eh
		add	word ptr [bp+var_A], 18h
		inc	[bp+var_C]

loc_76860:
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0

loc_7686C:
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_7687B
		push	si
		call	ResourceRecord_ReadPayload_54332
		pop	cx
		jmp	short loc_7688F

loc_7687B:
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_7688D
		mov	ax, 1
		jmp	short loc_7688F

loc_7688D:
		xor	ax, ax

loc_7688F:
		or	ax, ax
		jnz	short loc_76896
		jmp	loc_7677F

loc_76896:
		pop	di
		pop	si
		leave
		retf
sub_766F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7689A		proc far

var_22		= word ptr -22h
var_20		= word ptr -20h
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
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
		xor	di, di
		mov	[bp+var_2], 0
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_768E9
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	di, ax
		cmp	dword ptr [si+72h], 2
		jle	short loc_768DB
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_2], ax

loc_768DB:
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0
		jmp	short loc_768F2

loc_768E9:
		push	6006h
		call	sub_9D47
		pop	cx

loc_768F2:
		push	[bp+var_2]
		push	di
		mov	ax, [bp+arg_0]
		add	ax, 8Ah
		push	[bp+arg_2]
		push	ax
		call	sub_59115
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+8Eh]
		mov	[bp+var_6], eax
		xor	di, di
		mov	eax, es:[bx+92h]
		mov	[bp+var_A], eax
		mov	[bp+var_C], 0
		jmp	loc_76A30

loc_76929:
		push	si
		call	ResourceRecord_ComputeAlignedBounds_54140
		pop	cx
		cmp	dword ptr [si+6Dh], 504D5854h
		jnz	short loc_7693F
		mov	ax, 1
		jmp	short loc_76941

loc_7693F:
		xor	ax, ax

loc_76941:
		or	ax, ax
		jnz	short loc_76948
		jmp	loc_769C9

loc_76948:
		push	large 0Ch
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		cmp	es:[bx+8Ah], di
		ja	short loc_7696C
		push	6007h
		call	sub_9D47
		pop	cx

loc_7696C:
		mov	ax, word ptr [bp+var_18]
		imul	word ptr [bp+var_18+2]
		movzx	eax, ax
		mov	[bp+var_10], eax
		push	2
		push	large [bp+var_18]
		lea	ax, [bp+var_20]
		push	ax
		push	large [bp+var_6]
		call	sub_590CA
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_14], eax
		cmp	eax, [bp+var_10]
		jz	short loc_769A7
		push	0FEEDh
		call	sub_9D47
		pop	cx

loc_769A7:
		push	large [bp+var_10]
		push	large [bp+var_6]
		call	sub_590ED
		add	sp, 4
		push	dx
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		add	word ptr [bp+var_6], 0Eh
		inc	di
		jmp	short loc_76A24

loc_769C9:
		cmp	dword ptr [si+6Dh], 414D5854h
		jnz	short loc_769D8
		mov	ax, 1
		jmp	short loc_769DA

loc_769D8:
		xor	ax, ax

loc_769DA:
		or	ax, ax
		jz	short loc_76A24
		push	large 0Eh
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+8Ch]
		cmp	ax, [bp+var_C]
		ja	short loc_76A05
		push	6008h
		call	sub_9D47
		pop	cx

loc_76A05:
		push	large [bp+var_18]
		push	[bp+var_1A]
		lea	ax, [bp+var_22]
		push	ax
		push	si
		push	large [bp+var_A]
		call	sub_59106
		add	sp, 0Eh
		add	word ptr [bp+var_A], 18h
		inc	[bp+var_C]

loc_76A24:
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0

loc_76A30:
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_76A3F
		push	si
		call	ResourceRecord_ReadPayload_54332
		pop	cx
		jmp	short loc_76A53

loc_76A3F:
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_76A51
		mov	ax, 1
		jmp	short loc_76A53

loc_76A51:
		xor	ax, ax

loc_76A53:
		or	ax, ax
		jnz	short loc_76A5A
		jmp	loc_76929

loc_76A5A:
		pop	di
		pop	si
		leave
		retf
sub_7689A		endp
ovr212		ends
