ovr242		segment	para public 'OVERLAY' use16
		assume cs:ovr242
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BE070		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
saved_0		= byte ptr  0
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	[bp+saved_0], 0
		xor	si, si
		jmp	short loc_BE0C8

loc_BE083:
		push	di
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	[bp+var_A], ax
		push	large 8
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		push	0
		push	0
		push	[bp+var_A]
		lea	ax, [bp+var_8]
		push	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+7Ch]
		add	ax, si
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 7Ch
		push	[bp+arg_2]
		push	ax
		call	sub_48410
		add	sp, 0Eh
		inc	si

loc_BE0C8:
		les	bx, [bp+arg_0]
		cmp	es:[bx+7Eh], si
		ja	short loc_BE083
		pop	di
		pop	si
		leave
		retf
sub_BE070		endp
ovr242		ends
