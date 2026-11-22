ovr218		segment	para public 'OVERLAY' use16
		assume cs:ovr218
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_77160		proc far

var_8		= word ptr -8
saved_0		= byte ptr  0
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	[bp+saved_0], 0
		xor	si, si
		jmp	short loc_7719D

loc_7716F:
		push	large 8
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		push	large 0
		lea	ax, [bp+var_8]
		push	ax
		push	si
		mov	ax, [bp+arg_0]
		add	ax, 8Ah
		push	[bp+arg_2]
		push	ax
		call	sub_5911A
		add	sp, 0Ch
		inc	si

loc_7719D:
		les	bx, [bp+arg_0]
		cmp	es:[bx+8Ah], si
		ja	short loc_7716F
		pop	si
		leave
		retf
sub_77160		endp
ovr218		ends
