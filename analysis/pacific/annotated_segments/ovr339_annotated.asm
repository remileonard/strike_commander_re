ovr339		segment	para public 'OVERLAY' use16
		assume cs:ovr339
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9B00		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	sub_3B14C
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		call	sub_746D0
		add	sp, 6
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_B9B3C
		jmp	loc_B9C4B

loc_B9B3C:
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+85h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+67h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Bh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Fh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+73h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+7Bh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+7Fh], eax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+83h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+89h], ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 7Fh
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 100h
		jle	short loc_B9C09
		mov	ax, 1
		jmp	short loc_B9C0B

loc_B9C09:
		xor	ax, ax

loc_B9C0B:
		or	al, al
		jz	short loc_B9C2F
		mov	[bp+var_C], 100h
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+7Fh], eax

loc_B9C2F:
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 73h
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		jmp	short loc_B9C54

loc_B9C4B:
		push	0B008h
		call	sub_1DDFE
		pop	cx

loc_B9C54:
		pop	si
		leave
		retf
sub_B9B00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9C57		proc far

var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= byte ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_B9CD5
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+67h], al
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+68h], al
		mov	byte ptr [bp+var_8], 2
		mov	al, es:[bx+67h]
		mov	[bp+var_4], al
		mov	al, es:[bx+68h]
		mov	[bp+var_5], al
		mov	[bp+var_2], 0
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 2Ch
		push	[bp+arg_2]
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 2
		push	[bp+arg_2]
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 56h
		push	[bp+arg_2]
		push	ax
		call	Keyframe_InitWithTwoParams
		add	sp, 10h
		jmp	short loc_B9CDE

loc_B9CD5:
		push	0B009h
		call	sub_1DDFE
		pop	cx

loc_B9CDE:
		pop	si
		leave
		retf
sub_B9C57		endp
ovr339		ends
