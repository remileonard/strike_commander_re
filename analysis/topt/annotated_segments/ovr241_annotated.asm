ovr241		segment	para public 'OVERLAY' use16
		assume cs:ovr241
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE020		proc far

var_8		= word ptr -8
saved_0		= byte ptr  0
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	[bp+saved_0], 0
		xor	si, si
		jmp	short loc_BE060

loc_BE033:
		push	large 8
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		push	0
		push	0
		lea	ax, [bp+var_8]
		push	ax
		push	si
		mov	ax, [bp+arg_0]
		add	ax, 7Ch
		push	[bp+arg_2]
		push	ax
		call	sub_4840B
		add	sp, 0Ch
		inc	si

loc_BE060:
		les	bx, [bp+arg_0]
		cmp	es:[bx+7Ch], si
		ja	short loc_BE033
		pop	di
		pop	si
		leave
		retf
sub_BE020		endp
ovr241		ends
