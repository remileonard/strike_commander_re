ovr239		segment	para public 'OVERLAY' use16
		assume cs:ovr239
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BDD10		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+4], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+1Eh], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+90h], 0
		les	bx, [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+1Ch], ax
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+7Ah], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+7Bh], 0
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+8Eh], 0FFFFh
		pop	bp
		retf
sub_BDD10		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BDD64		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_BDD10
		add	sp, 4
		push	0
		push	large 4F464E49h
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BDDA2
		push	[bp+arg_4]
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+7Ah], al

loc_BDDA2:
		push	0
		push	large 464E4941h
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_BDDEB
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+84h], eax
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+8Ch], ax
		jmp	short loc_BDE12

loc_BDDEB:
		mov	[bp+var_4], 0Ch
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		mov	es:[bx+84h], eax
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+8Ch], 0

loc_BDE12:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+84h]
		les	bx, [bp+arg_0]
		mov	es:[bx+88h], eax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_485B0
		add	sp, 6
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_486D0
		add	sp, 6
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_1F6E6
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_C], eax
		xor	di, di
		jmp	short loc_BDEC8

loc_BDE67:
		mov	ax, word ptr [bp+var_C+2]
		mov	dx, word ptr [bp+var_C]
		add	dx, 0Ch
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	si, [bp+var_10]
		mov	eax, es:[si]
		mov	[bp+var_1C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_18], eax
		mov	eax, es:[si+8]
		mov	[bp+var_14], eax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	Vector_Normalize3D_28FB2
		add	sp, 2
		les	bx, word ptr [bp+var_C]
		mov	eax, [bp+var_1C]
		mov	es:[bx+0Ch], eax
		les	bx, word ptr [bp+var_C]
		mov	eax, [bp+var_18]
		mov	es:[bx+10h], eax
		les	bx, word ptr [bp+var_C]
		mov	eax, [bp+var_14]
		mov	es:[bx+14h], eax
		inc	di
		add	word ptr [bp+var_C], 18h

loc_BDEC8:
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], di
		jg	short loc_BDE67
		pop	di
		pop	si
		leave
		retf
sub_BDD64		endp
ovr239		ends
