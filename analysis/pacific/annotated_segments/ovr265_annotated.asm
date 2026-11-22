ovr265		segment	para public 'OVERLAY' use16
		assume cs:ovr265
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A1090		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 454E494Ch
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_A10D5
		push	0
		push	large 45434146h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A10CE
		push	si
		push	large [bp+arg_0]
		call	sub_73AC0
		add	sp, 6

loc_A10CE:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_A10D5:
		pop	si
		pop	bp
		retf
sub_A1090		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A10D8		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+1Ch], 0
		push	0
		mov	al, es:[bx+16h]
		push	ax
		push	large es:[bx+12h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77960, dx
		mov	word_7795E, ax
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77964, dx
		mov	word_77962, ax
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_A1150
		push	si
		push	large [bp+arg_0]
		call	sub_73B20
		add	sp, 6
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_A1150:
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_A1090
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		call	sub_73B50
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		call	sub_73B55
		add	sp, 6
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	si
		push	large [bp+arg_0]
		call	sub_73B80
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		call	sub_73B85
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_A10D8		endp
ovr265		ends
