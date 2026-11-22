ovr276		segment	para public 'OVERLAY' use16
		assume cs:ovr276
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A3690		proc far

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
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		xor	di, di
		jmp	loc_A37CB

loc_A36D2:
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+98h]
		add	dx, ax
		mov	cx, dx
		cmp	es:[bx+1Ch], cx
		jle	short loc_A370E
		les	bx, es:[bx+1Eh]
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
		jmp	short loc_A3717

loc_A370E:
		push	600Ah
		call	sub_1DDFE
		pop	cx

loc_A3717:
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_A], ax
		mov	cx, [bp+var_A]
		les	bx, [bp+arg_0]
		cmp	es:[bx+7Ch], cx
		jbe	short loc_A3740
		mov	dx, es:[bx+82h]
		mov	ax, es:[bx+80h]
		mov	bx, cx
		imul	bx, bx, 0Eh
		add	ax, bx
		jmp	short loc_A3764

loc_A3740:
		les	bx, [bp+arg_0]
		sub	cx, es:[bx+7Ch]
		cmp	es:[bx+7Eh], cx
		jbe	short loc_A3760
		mov	dx, es:[bx+86h]
		mov	ax, es:[bx+84h]
		mov	bx, cx
		imul	bx, bx, 18h
		add	ax, bx
		jmp	short loc_A3764

loc_A3760:
		xor	dx, dx
		xor	ax, ax

loc_A3764:
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+1Eh], dx
		mov	es:[bx+1Ch], ax
		cmp	dword ptr es:[bx+1Ch], 0
		jnz	short loc_A3780
		push	600Bh
		call	sub_1DDFE
		pop	cx

loc_A3780:
		push	large 6
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
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

loc_A37CB:
		cmp	di, [bp+var_C]
		jge	short loc_A37D3
		jmp	loc_A36D2

loc_A37D3:
		pop	di
		pop	si
		leave
		retf
sub_A3690		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A37D7		proc far

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
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		xor	di, di
		jmp	loc_A38DE

loc_A3819:
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+98h]
		add	dx, ax
		mov	cx, dx
		cmp	es:[bx+1Ch], cx
		jle	short loc_A3855
		les	bx, es:[bx+1Eh]
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
		jmp	short loc_A385E

loc_A3855:
		push	600Ah
		call	sub_1DDFE
		pop	cx

loc_A385E:
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_A], ax
		mov	cx, [bp+var_A]
		les	bx, [bp+arg_0]
		cmp	es:[bx+7Ch], cx
		jbe	short loc_A3887
		mov	dx, es:[bx+82h]
		mov	ax, es:[bx+80h]
		mov	bx, cx
		imul	bx, bx, 0Eh
		add	ax, bx
		jmp	short loc_A38AB

loc_A3887:
		les	bx, [bp+arg_0]
		sub	cx, es:[bx+7Ch]
		cmp	es:[bx+7Eh], cx
		jbe	short loc_A38A7
		mov	dx, es:[bx+86h]
		mov	ax, es:[bx+84h]
		mov	bx, cx
		imul	bx, bx, 18h
		add	ax, bx
		jmp	short loc_A38AB

loc_A38A7:
		xor	dx, dx
		xor	ax, ax

loc_A38AB:
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+1Eh], dx
		mov	es:[bx+1Ch], ax
		cmp	dword ptr es:[bx+1Ch], 0
		jnz	short loc_A38C7
		push	600Bh
		call	sub_1DDFE
		pop	cx

loc_A38C7:
		push	large 0Ch
		mov	ax, word ptr [bp+var_8]
		add	ax, 20h
		push	word ptr [bp+var_8+2]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		inc	di

loc_A38DE:
		cmp	di, [bp+var_C]
		jge	short loc_A38E6
		jmp	loc_A3819

loc_A38E6:
		pop	di
		pop	si
		leave
		retf
sub_A37D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A38EA		proc far

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
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		xor	di, di
		jmp	loc_A39F1

loc_A392C:
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+9Ah]
		add	dx, ax
		mov	cx, dx
		cmp	es:[bx+1Ch], cx
		jle	short loc_A3960
		les	bx, es:[bx+1Eh]
		mov	ax, cx
		shl	ax, 1
		add	bx, ax
		mov	ax, [bp+var_A]
		mov	dx, [bp+var_C]
		add	dx, es:[bx]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		jmp	short loc_A3969

loc_A3960:
		push	600Ah
		call	sub_1DDFE
		pop	cx

loc_A3969:
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_6], ax
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		mov	cx, [bp+var_6]
		les	bx, [bp+arg_0]
		cmp	es:[bx+7Ch], cx
		jbe	short loc_A399A
		mov	dx, es:[bx+82h]
		mov	ax, es:[bx+80h]
		mov	bx, cx
		imul	bx, bx, 0Eh
		add	ax, bx
		jmp	short loc_A39BE

loc_A399A:
		les	bx, [bp+arg_0]
		sub	cx, es:[bx+7Ch]
		cmp	es:[bx+7Eh], cx
		jbe	short loc_A39BA
		mov	dx, es:[bx+86h]
		mov	ax, es:[bx+84h]
		mov	bx, cx
		imul	bx, bx, 18h
		add	ax, bx
		jmp	short loc_A39BE

loc_A39BA:
		xor	dx, dx
		xor	ax, ax

loc_A39BE:
		les	bx, word ptr [bp+var_10]
		mov	es:[bx+22h], dx
		mov	es:[bx+20h], ax
		cmp	dword ptr es:[bx+20h], 0
		jnz	short loc_A39DA
		push	600Bh
		call	sub_1DDFE
		pop	cx

loc_A39DA:
		push	large 10h
		mov	ax, word ptr [bp+var_10]
		add	ax, 24h
		push	word ptr [bp+var_10+2]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		inc	di

loc_A39F1:
		cmp	di, [bp+var_8]
		jge	short loc_A39F9
		jmp	loc_A392C

loc_A39F9:
		pop	di
		pop	si
		leave
		retf
sub_A38EA		endp
ovr276		ends
