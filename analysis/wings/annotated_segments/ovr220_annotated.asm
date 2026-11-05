ovr220		segment	para public 'OVERLAY' use16
		assume cs:ovr220
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_77220		proc far

var_16		= word ptr -16h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_C], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+20h]
		push	ax
		push	large es:[bx+1Ch]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		xor	di, di
		jmp	loc_7735D

loc_77262:
		push	si
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+2Ch]
		add	dx, ax
		mov	cx, dx
		cmp	es:[bx+26h], cx
		jle	short loc_7729D
		les	bx, es:[bx+28h]
		mov	ax, cx
		shl	ax, 1
		add	bx, ax
		mov	ax, [bp+var_E]
		mov	dx, [bp+var_10]
		add	dx, es:[bx]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		jmp	short loc_772A6

loc_7729D:
		push	600Ah
		call	sub_9D47
		pop	cx

loc_772A6:
		push	si
		call	ResourceRecord_ReadFinalField_540D0
		pop	cx
		mov	[bp+var_A], ax
		mov	cx, [bp+var_A]
		les	bx, [bp+arg_0]
		cmp	es:[bx+8Ah], cx
		jbe	short loc_772D0
		mov	dx, es:[bx+90h]
		mov	ax, es:[bx+8Eh]
		mov	bx, cx
		imul	bx, bx, 0Eh
		add	ax, bx
		jmp	short loc_772F6

loc_772D0:
		les	bx, [bp+arg_0]
		sub	cx, es:[bx+8Ah]
		cmp	es:[bx+8Ch], cx
		jbe	short loc_772F2
		mov	dx, es:[bx+94h]
		mov	ax, es:[bx+92h]
		mov	bx, cx
		imul	bx, bx, 18h
		add	ax, bx
		jmp	short loc_772F6

loc_772F2:
		xor	dx, dx
		xor	ax, ax

loc_772F6:
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+1Eh], dx
		mov	es:[bx+1Ch], ax
		cmp	dword ptr es:[bx+1Ch], 0
		jnz	short loc_77312
		push	600Bh
		call	sub_9D47
		pop	cx

loc_77312:
		push	large 6
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		mov	al, byte ptr [bp+var_16]
		mov	ah, 0
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+20h], ax
		mov	al, [bp+var_14]
		mov	ah, 0
		mov	es:[bx+24h], ax
		mov	al, [bp+var_12]
		mov	ah, 0
		mov	es:[bx+28h], ax
		mov	al, byte ptr [bp+var_16+1]
		mov	ah, 0
		mov	es:[bx+22h], ax
		mov	al, [bp+var_13]
		mov	ah, 0
		mov	es:[bx+26h], ax
		mov	al, [bp+var_11]
		mov	ah, 0
		mov	es:[bx+2Ah], ax
		inc	di

loc_7735D:
		cmp	di, [bp+var_C]
		jge	short loc_77365
		jmp	loc_77262

loc_77365:
		pop	di
		pop	si
		leave
		retf
sub_77220		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_77369		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [si+72h]
		mov	ebx, 10h
		cdq
		idiv	ebx
		mov	[bp+var_C], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+20h]
		push	ax
		push	large es:[bx+1Ch]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		xor	di, di
		jmp	loc_77472

loc_773AB:
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+2Ch]
		add	dx, ax
		mov	cx, dx
		cmp	es:[bx+26h], cx
		jle	short loc_773E6
		les	bx, es:[bx+28h]
		mov	ax, cx
		shl	ax, 1
		add	bx, ax
		mov	ax, [bp+var_E]
		mov	dx, [bp+var_10]
		add	dx, es:[bx]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		jmp	short loc_773EF

loc_773E6:
		push	600Ah
		call	sub_9D47
		pop	cx

loc_773EF:
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_A], ax
		mov	cx, [bp+var_A]
		les	bx, [bp+arg_0]
		cmp	es:[bx+8Ah], cx
		jbe	short loc_77419
		mov	dx, es:[bx+90h]
		mov	ax, es:[bx+8Eh]
		mov	bx, cx
		imul	bx, bx, 0Eh
		add	ax, bx
		jmp	short loc_7743F

loc_77419:
		les	bx, [bp+arg_0]
		sub	cx, es:[bx+8Ah]
		cmp	es:[bx+8Ch], cx
		jbe	short loc_7743B
		mov	dx, es:[bx+94h]
		mov	ax, es:[bx+92h]
		mov	bx, cx
		imul	bx, bx, 18h
		add	ax, bx
		jmp	short loc_7743F

loc_7743B:
		xor	dx, dx
		xor	ax, ax

loc_7743F:
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+1Eh], dx
		mov	es:[bx+1Ch], ax
		cmp	dword ptr es:[bx+1Ch], 0
		jnz	short loc_7745B
		push	600Bh
		call	sub_9D47
		pop	cx

loc_7745B:
		push	large 0Ch
		mov	ax, word ptr [bp+var_8]
		add	ax, 20h
		push	word ptr [bp+var_8+2]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		inc	di

loc_77472:
		cmp	di, [bp+var_C]
		jge	short loc_7747A
		jmp	loc_773AB

loc_7747A:
		pop	di
		pop	si
		leave
		retf
sub_77369		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7747E		proc far

var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [si+72h]
		mov	ebx, 14h
		cdq
		idiv	ebx
		mov	[bp+var_8], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+20h]
		push	ax
		push	large es:[bx+1Ch]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		xor	di, di
		jmp	loc_77587

loc_774C0:
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+2Eh]
		add	dx, ax
		mov	cx, dx
		cmp	es:[bx+26h], cx
		jle	short loc_774F3
		les	bx, es:[bx+28h]
		mov	ax, cx
		shl	ax, 1
		add	bx, ax
		mov	ax, [bp+var_A]
		mov	dx, [bp+var_C]
		add	dx, es:[bx]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		jmp	short loc_774FC

loc_774F3:
		push	600Ah
		call	sub_9D47
		pop	cx

loc_774FC:
		push	si
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_6], ax
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		mov	cx, [bp+var_6]
		les	bx, [bp+arg_0]
		cmp	es:[bx+8Ah], cx
		jbe	short loc_7752E
		mov	dx, es:[bx+90h]
		mov	ax, es:[bx+8Eh]
		mov	bx, cx
		imul	bx, bx, 0Eh
		add	ax, bx
		jmp	short loc_77554

loc_7752E:
		les	bx, [bp+arg_0]
		sub	cx, es:[bx+8Ah]
		cmp	es:[bx+8Ch], cx
		jbe	short loc_77550
		mov	dx, es:[bx+94h]
		mov	ax, es:[bx+92h]
		mov	bx, cx
		imul	bx, bx, 18h
		add	ax, bx
		jmp	short loc_77554

loc_77550:
		xor	dx, dx
		xor	ax, ax

loc_77554:
		les	bx, word ptr [bp+var_10]
		mov	es:[bx+22h], dx
		mov	es:[bx+20h], ax
		cmp	dword ptr es:[bx+20h], 0
		jnz	short loc_77570
		push	600Bh
		call	sub_9D47
		pop	cx

loc_77570:
		push	large 10h
		mov	ax, word ptr [bp+var_10]
		add	ax, 24h
		push	word ptr [bp+var_10+2]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		inc	di

loc_77587:
		cmp	di, [bp+var_8]
		jge	short loc_7758F
		jmp	loc_774C0

loc_7758F:
		pop	di
		pop	si
		leave
		retf
sub_7747E		endp
ovr220		ends
