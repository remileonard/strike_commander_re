ovr235		segment	para public 'OVERLAY' use16
		assume cs:ovr235
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C5E60	proc far		; CODE XREF: sub_42D40J sub_C5EB6+Fp

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+4], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+28h], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+9Ah], 0
		les	bx, [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+26h], ax
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+84h], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+85h], 0
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+98h], 0FFFFh
		pop	bp
		retf
sub_C5E60	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C5EB6	proc far		; CODE XREF: sub_42D45J

var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_C5E60
		add	sp, 4
		push	0
		push	large 4F464E49h
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C5EF5
		push	[bp+arg_4]
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+84h], al

loc_C5EF5:				; CODE XREF: sub_C5EB6+2Aj
		push	0
		push	large 464E4941h
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C5F3E
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+8Eh], eax
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+96h], ax
		jmp	short loc_C5F65
; ���������������������������������������������������������������������������

loc_C5F3E:				; CODE XREF: sub_C5EB6+54j
		mov	[bp+var_4], 0Ch
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		mov	es:[bx+8Eh], eax
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+96h], 0

loc_C5F65:				; CODE XREF: sub_C5EB6+86j
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+8Eh]
		les	bx, [bp+arg_0]
		mov	es:[bx+92h], eax
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_42C50
		add	sp, 6
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_42D70
		add	sp, 6
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_1B3D1
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_C], eax
		xor	di, di
		jmp	short loc_C601B
; ���������������������������������������������������������������������������

loc_C5FBA:				; CODE XREF: sub_C5EB6+16Cj
		mov	ax, word ptr [bp+var_C+2]
		mov	dx, word ptr [bp+var_C]
		add	dx, 0Ch
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		les	si, [bp+var_10]
		mov	eax, es:[si]
		mov	[bp+var_1C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_18], eax
		mov	eax, es:[si+8]
		mov	[bp+var_14], eax
		lea	ax, [bp+var_1C]
		push	ax
		call	Vector_Normalize3D_241B4
		add	sp, 2
		les	bx, [bp+var_C]
		mov	eax, [bp+var_1C]
		mov	es:[bx+0Ch], eax
		les	bx, [bp+var_C]
		mov	eax, [bp+var_18]
		mov	es:[bx+10h], eax
		les	bx, [bp+var_C]
		mov	eax, [bp+var_14]
		mov	es:[bx+14h], eax
		inc	di
		add	word ptr [bp+var_C], 18h

loc_C601B:				; CODE XREF: sub_C5EB6+102j
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], di
		jg	short loc_C5FBA
		pop	di
		pop	si
		leave
		retf
sub_C5EB6	endp

ovr235		ends
