ovr272		segment	para public 'OVERLAY' use16
		assume cs:ovr272
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A3300		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+4], 0
		mov	dword ptr es:[bx+1Eh], 0
		mov	dword ptr es:[bx+94h], 0
		xor	ax, ax
		mov	es:[bx+1Ch], ax
		mov	es:[bx+2], ax
		mov	byte ptr es:[bx+7Ah], 0
		mov	byte ptr es:[bx+7Bh], 0
		xor	ax, ax
		mov	es:[bx+9Ah], ax
		mov	es:[bx+98h], ax
		mov	word ptr es:[bx+92h], 0FFFFh
		pop	bp
		retf
sub_A3300		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A334B		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_A3300
		add	sp, 4
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A3384
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+7Ah], al

loc_A3384:
		push	0
		push	large 464E4941h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_A33BE
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+88h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+90h], ax
		jmp	short loc_A33E2

loc_A33BE:
		mov	[bp+var_4], 0Ch
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+88h], eax
		mov	word ptr es:[bx+90h], 0

loc_A33E2:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+88h]
		mov	es:[bx+8Ch], eax
		push	si
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_73AF0
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		call	sub_73BE0
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		call	sub_73A60
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_C], eax
		xor	di, di
		jmp	short loc_A3481

loc_A3428:
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
		call	Vector_Normalize3D_57796
		pop	cx
		les	bx, word ptr [bp+var_C]
		mov	eax, [bp+var_1C]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_18]
		mov	es:[bx+10h], eax
		mov	eax, [bp+var_14]
		mov	es:[bx+14h], eax
		inc	di
		add	word ptr [bp+var_C], 2Ah

loc_A3481:
		les	bx, word ptr [bp+arg_0]
		cmp	es:[bx+2], di
		jg	short loc_A3428
		pop	di
		pop	si
		leave
		retf
sub_A334B		endp
ovr272		ends
