ovr213		segment	para public 'OVERLAY' use16
		assume cs:ovr213
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_76A60		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 53495254h
		push	si
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_76A7F
		jmp	loc_76B7D

loc_76A7F:
		push	0
		push	large 49525456h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_76AA0
		push	si
		push	large [bp+arg_0]
		call	sub_59240
		jmp	short loc_76ABF

loc_76AA0:
		push	0
		push	large 45434146h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_76ACE
		push	si
		push	large [bp+arg_0]
		call	sub_59245

loc_76ABF:
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0

loc_76ACE:
		push	0
		push	large 5350414Dh
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_76AF0
		push	si
		push	large [bp+arg_0]
		call	sub_59475
		add	sp, 6

loc_76AF0:
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jz	short loc_76B11
		push	si
		push	large [bp+arg_0]
		call	sub_592F5
		jmp	short loc_76B30

loc_76B11:
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_76B3A
		push	si
		push	large [bp+arg_0]
		call	sub_59410

loc_76B30:
		add	sp, 6
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_76B3A:
		push	0
		push	large 59585655h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_76B76
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	si
		push	large [bp+arg_0]
		call	sub_59470
		add	sp, 6

loc_76B76:
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_76B7D:
		pop	si
		pop	bp
		retf
sub_76A60		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_76B80		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 44415551h
		push	si
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jz	short loc_76BF3
		push	0
		push	large 45434146h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_76BCA
		push	si
		push	large [bp+arg_0]
		call	sub_5924A
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0

loc_76BCA:
		push	0
		push	large 5350414Dh
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_76BEC
		push	si
		push	large [bp+arg_0]
		call	sub_5947A
		add	sp, 6

loc_76BEC:
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_76BF3:
		pop	si
		pop	bp
		retf
sub_76B80		endp
ovr213		ends
