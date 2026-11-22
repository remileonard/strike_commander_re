ovr275		segment	para public 'OVERLAY' use16
		assume cs:ovr275
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A3620		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	[bp+var_1], 0
		xor	si, si
		jmp	short loc_A3675

loc_A3633:
		push	di
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_A], ax
		push	large 8
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	large 0
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
		call	sub_751BA
		add	sp, 0Eh
		inc	si

loc_A3675:
		les	bx, [bp+arg_0]
		cmp	es:[bx+7Eh], si
		ja	short loc_A3633
		pop	di
		pop	si
		leave
		retf
sub_A3620		endp
ovr275		ends
