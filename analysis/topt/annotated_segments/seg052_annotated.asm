seg052		segment	para public 'CODE' use16
		assume cs:seg052
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FEh, 89h, 46h, 0FCh, 8Bh, 56h, 0FEh, 8Bh, 46h, 0FCh, 0C9h, 0CBh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F64E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 534E494Ch
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jz	short loc_1F697
		push	0
		push	large 4E494C56h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_1F68E
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_48550
		add	sp, 6

loc_1F68E:
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_1F697:
		pop	si
		pop	bp
		retf
sub_1F64E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F69A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 53525053h
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jz	short loc_1F6E3
		push	0
		push	large 52505356h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_1F6DA
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_48580
		add	sp, 6

loc_1F6DA:
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_1F6E3:
		pop	si
		pop	bp
		retf
sub_1F69A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F6E6		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+1Ch], 0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+14h]
		push	word ptr es:[bx+12h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	word_4C11A, dx
		mov	word_4C118, ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	word_4C11E, dx
		mov	word_4C11C, ax
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_48610
		add	sp, 6
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1F64E
		add	sp, 6
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1F69A
		add	sp, 6
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_48640
		add	sp, 6
		pop	si
		leave
		retf
sub_1F6E6		endp
seg052		ends
