ovr273		segment	para public 'OVERLAY' use16
		assume cs:ovr273
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A3490		proc far

var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	0
		push	large 54524556h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A34B3
		jmp	loc_A35BF

loc_A34B3:
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		push	ax
		push	large es:[bx+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_4], eax
		xor	di, di
		jmp	loc_A35B3

loc_A34DE:
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_14], eax
		mov	[bp+var_8], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_18], eax
		mov	[bp+var_C], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_1C], eax
		mov	[bp+var_10], eax
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+0Ch], eax
		mov	[bp+var_24], 0
		mov	eax, [bp+var_24]
		mov	es:[bx+10h], eax
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		mov	es:[bx+14h], eax
		and	byte ptr es:[bx+29h], 0FDh
		and	byte ptr es:[bx+29h], 0FBh
		and	byte ptr es:[bx+29h], 0F7h
		and	byte ptr es:[bx+29h], 0FEh
		mov	eax, [bp+var_8]
		mov	es:[bx], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+4], eax
		mov	eax, [bp+var_10]
		mov	es:[bx+8], eax
		mov	[bp+var_2C], 0
		mov	eax, [bp+var_2C]
		mov	es:[bx+0Ch], eax
		mov	[bp+var_30], 0
		mov	eax, [bp+var_30]
		mov	es:[bx+10h], eax
		mov	[bp+var_34], 0
		mov	eax, [bp+var_34]
		mov	es:[bx+14h], eax
		inc	di
		add	word ptr [bp+var_4], 2Ah

loc_A35B3:
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], di
		jle	short loc_A35BF
		jmp	loc_A34DE

loc_A35BF:
		pop	di
		pop	si
		leave
		retf
sub_A3490		endp
ovr273		ends
