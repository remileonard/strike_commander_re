ovr240		segment	para public 'OVERLAY' use16
		assume cs:ovr240
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BDEE0		proc far

var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	0
		push	large 54524556h
		push	si
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_BDF03
		jmp	loc_BE010

loc_BDF03:
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
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_8], eax
		xor	di, di
		jmp	loc_BE004

loc_BDF3A:
		push	si
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_C], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_10], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_14], eax
		mov	[bp+var_24], 0
		mov	eax, [bp+var_24]
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+14h], eax
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+10h], eax
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+0Ch], eax
		les	bx, word ptr [bp+var_8]
		mov	eax, [bp+var_C]
		mov	es:[bx], eax
		les	bx, word ptr [bp+var_8]
		mov	eax, [bp+var_10]
		mov	es:[bx+4], eax
		les	bx, word ptr [bp+var_8]
		mov	eax, [bp+var_14]
		mov	es:[bx+8], eax
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+14h], eax
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+10h], eax
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+0Ch], eax
		inc	di
		add	word ptr [bp+var_8], 18h

loc_BE004:
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], di
		jle	short loc_BE010
		jmp	loc_BDF3A

loc_BE010:
		pop	di
		pop	si
		leave
		retf
sub_BDEE0		endp
ovr240		ends
