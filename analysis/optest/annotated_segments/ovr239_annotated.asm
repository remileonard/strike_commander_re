ovr239		segment	para public 'OVERLAY' use16
		assume cs:ovr239
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C6260	proc far		; CODE XREF: sub_42E00J

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	eax, [di+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	[bp+var_A], ax
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+20h]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+1Eh]
		push	word ptr es:[bx+1Ch]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[bp+var_C], dx
		mov	[bp+var_E], ax
		mov	[bp+var_10], 0
		jmp	loc_C637D
; ���������������������������������������������������������������������������

loc_C62AB:				; CODE XREF: sub_C6260+125j
		push	di
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_8], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+26h]
		cmp	ax, [bp+var_8]
		jle	short loc_C62E2
		les	bx, [bp+arg_0]
		les	bx, es:[bx+28h]
		mov	ax, [bp+var_8]
		shl	ax, 1
		add	bx, ax
		mov	ax, [bp+var_C]
		mov	dx, [bp+var_E]
		add	dx, es:[bx]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		jmp	short loc_C62ED
; ���������������������������������������������������������������������������

loc_C62E2:				; CODE XREF: sub_C6260+61j
		push	600Ah
		call	sub_30D3
		add	sp, 2

loc_C62ED:				; CODE XREF: sub_C6260+80j
		push	di
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_6], ax
		mov	si, [bp+var_6]
		les	bx, [bp+arg_0]
		cmp	es:[bx+86h], si
		jbe	short loc_C631D
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+8Ah]
		push	ax
		mov	ax, si
		mov	dx, 6
		imul	dx
		mov	dx, ax
		pop	ax
		add	ax, dx
		jmp	short loc_C6348
; ���������������������������������������������������������������������������

loc_C631D:				; CODE XREF: sub_C6260+A4j
		les	bx, [bp+arg_0]
		sub	si, es:[bx+86h]
		les	bx, [bp+arg_0]
		cmp	es:[bx+88h], si
		jbe	short loc_C6346
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+8Ch]
		push	ax
		mov	ax, si
		mov	dx, 0Ch
		imul	dx
		mov	dx, ax
		pop	ax
		add	ax, dx
		jmp	short loc_C6348
; ���������������������������������������������������������������������������

loc_C6346:				; CODE XREF: sub_C6260+CDj
		xor	ax, ax

loc_C6348:				; CODE XREF: sub_C6260+BBj
					; sub_C6260+E4j
		les	bx, [bp+var_4]
		mov	es:[bx+16h], ax
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx+16h], 0
		jnz	short loc_C6364
		push	600Bh
		call	sub_30D3
		add	sp, 2

loc_C6364:				; CODE XREF: sub_C6260+F7j
		push	large 6
		mov	ax, word ptr [bp+var_4]
		add	ax, 18h
		push	word ptr [bp+var_4+2]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		inc	[bp+var_10]

loc_C637D:				; CODE XREF: sub_C6260+48j
		mov	ax, [bp+var_10]
		cmp	ax, [bp+var_A]
		jge	short loc_C6388
		jmp	loc_C62AB
; ���������������������������������������������������������������������������

loc_C6388:				; CODE XREF: sub_C6260+123j
		pop	di
		pop	si
		leave
		retf
sub_C6260	endp

ovr239		ends
