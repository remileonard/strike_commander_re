ovr219		segment	para public 'OVERLAY' use16
		assume cs:ovr219
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_771B0		proc far

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
		jmp	short loc_77206

loc_771C3:
		push	di
		call	ResourceRecord_ReadFieldGroupB_53FD3
		pop	cx
		mov	[bp+var_A], ax
		push	large 8
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		push	large 0
		push	[bp+var_A]
		lea	ax, [bp+var_8]
		push	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+8Ah]
		add	ax, si
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 8Ah
		push	[bp+arg_2]
		push	ax
		call	sub_5911F
		add	sp, 0Eh
		inc	si

loc_77206:
		les	bx, [bp+arg_0]
		cmp	es:[bx+8Ch], si
		ja	short loc_771C3
		pop	di
		pop	si
		leave
		retf
sub_771B0		endp
ovr219		ends
