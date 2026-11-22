ovr236		segment	para public 'OVERLAY' use16
		assume cs:ovr236
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C6030	proc far		; CODE XREF: sub_42D70J

var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 38h
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	0
		push	large 54524556h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_C6053
		jmp	loc_C6190
; ���������������������������������������������������������������������������

loc_C6053:				; CODE XREF: sub_C6030+1Ej
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+16h]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+14h]
		push	word ptr es:[bx+12h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_8], eax
		xor	di, di
		jmp	loc_C6184
; ���������������������������������������������������������������������������

loc_C608A:				; CODE XREF: sub_C6030+15Dj
		push	si
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_C], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_10], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_14], eax
		mov	[bp+var_24], 0
		mov	eax, [bp+var_24]
		les	bx, [bp+var_8]
		mov	es:[bx+0Ch], eax
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		les	bx, [bp+var_8]
		mov	es:[bx+10h], eax
		mov	[bp+var_2C], 0
		mov	eax, [bp+var_2C]
		les	bx, [bp+var_8]
		mov	es:[bx+14h], eax
		les	bx, [bp+var_8]
		mov	eax, [bp+var_C]
		mov	es:[bx], eax
		les	bx, [bp+var_8]
		mov	eax, [bp+var_10]
		mov	es:[bx+4], eax
		les	bx, [bp+var_8]
		mov	eax, [bp+var_14]
		mov	es:[bx+8], eax
		mov	[bp+var_30], 0
		mov	eax, [bp+var_30]
		les	bx, [bp+var_8]
		mov	es:[bx+0Ch], eax
		mov	[bp+var_34], 0
		mov	eax, [bp+var_34]
		les	bx, [bp+var_8]
		mov	es:[bx+10h], eax
		mov	[bp+var_38], 0
		mov	eax, [bp+var_38]
		les	bx, [bp+var_8]
		mov	es:[bx+14h], eax
		inc	di
		add	word ptr [bp+var_8], 18h

loc_C6184:				; CODE XREF: sub_C6030+57j
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], di
		jle	short loc_C6190
		jmp	loc_C608A
; ���������������������������������������������������������������������������

loc_C6190:				; CODE XREF: sub_C6030+20j
					; sub_C6030+15Bj
		pop	di
		pop	si
		leave
		retf
sub_C6030	endp

ovr236		ends
