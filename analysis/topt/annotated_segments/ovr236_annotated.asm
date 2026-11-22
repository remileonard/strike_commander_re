ovr236		segment	para public 'OVERLAY' use16
		assume cs:ovr236
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BD800		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	0
		push	large 53495254h
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_BD823
		jmp	loc_BD96E

loc_BD823:
		push	0
		push	large 49525456h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BD853
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_48520
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0

loc_BD853:
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jz	short loc_BD883
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_485E0
		add	sp, 6
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2
		jmp	loc_BD941

loc_BD883:
		xor	di, di
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BD8AB
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	di, ax

loc_BD8AB:
		mov	[bp+var_2], 0
		push	0
		push	large 534D4E41h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BD8D7
		mov	eax, [si+72h]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	[bp+var_2], ax

loc_BD8D7:
		or	di, di
		jnz	short loc_BD8E1
		cmp	[bp+var_2], 0
		jz	short loc_BD8F7

loc_BD8E1:
		push	[bp+var_2]
		push	di
		mov	ax, [bp+arg_0]
		add	ax, 7Ch
		push	[bp+arg_2]
		push	ax
		call	sub_48406
		add	sp, 8

loc_BD8F7:
		or	di, di
		jz	short loc_BD91B
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_48700
		add	sp, 6

loc_BD91B:
		cmp	[bp+var_2], 0
		jz	short loc_BD941
		push	0
		push	large 534D4E41h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_48730
		add	sp, 6

loc_BD941:
		push	0
		push	large 59585655h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BD965
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_48760
		add	sp, 6

loc_BD965:
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_BD96E:
		pop	di
		pop	si
		leave
		retf
sub_BD800		endp
ovr236		ends
