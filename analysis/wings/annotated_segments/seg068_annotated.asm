seg068		segment	para public 'CODE' use16
		assume cs:seg068
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 26h, 0, 0, 0, 0, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_303D7		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 454E494Ch
		push	si
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jz	short loc_3041C
		push	0
		push	large 45434146h
		push	si
		call	ResourceRecord_SeekAndRead_53CC2
		add	sp, 8
		or	ax, ax
		jz	short loc_30415
		push	si
		push	large [bp+arg_0]
		call	sub_59270
		add	sp, 6

loc_30415:
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_3041C:
		pop	si
		pop	bp
		retf
sub_303D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3041F		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3041F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30424		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+26h], 0
		push	0
		mov	al, es:[bx+20h]
		push	ax
		push	large es:[bx+1Ch]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	word_5C34E, dx
		mov	word_5C34C, ax
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		mov	word_5C352, dx
		mov	word_5C350, ax
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jz	short loc_3049C
		push	si
		push	large [bp+arg_0]
		call	sub_592F0
		add	sp, 6
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_3049C:
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
		push	cs
		call	near ptr sub_303D7
		add	sp, 6
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
		call	sub_59320
		add	sp, 6
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
		call	sub_59325
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		call	sub_59350
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		call	sub_59355
		add	sp, 6
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	67B0h
sub_30424		endp

; START OF FUNCTION CHUNK FOR sub_30424
		db 9Ah, 0F1h, 1, 73h
; END OF FUNCTION CHUNK FOR sub_30424
seg068		ends
