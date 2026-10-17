seg040		segment	byte public 'CODE' use16
		assume cs:seg040
		;org 9
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1B339	proc far		; CODE XREF: sub_1B3D1+9Ep

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp

loc_1B33A:				; DATA XREF: seg170:01FEo
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 534E494Ch
		push	si
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jz	short loc_1B382
		push	0
		push	large 4E494C56h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_1B379
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_42BF0
		add	sp, 6

loc_1B379:				; CODE XREF: sub_1B339+2Fj
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_1B382:				; CODE XREF: sub_1B339+1Aj
		pop	si
		pop	bp
		retf
sub_1B339	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1B385	proc far		; CODE XREF: sub_1B3D1+D2p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 53525053h
		push	si
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jz	short loc_1B3CE
		push	0
		push	large 52505356h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_1B3C5
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_42C20
		add	sp, 6

loc_1B3C5:				; CODE XREF: sub_1B385+2Fj
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_1B3CE:				; CODE XREF: sub_1B385+1Aj
		pop	si
		pop	bp
		retf
sub_1B385	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1B3D1	proc far		; CODE XREF: sub_C5EB6+ECP

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+26h], 0
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
		mov	word_4600E, dx
		mov	word_4600C, ax
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
		mov	word_46012, dx
		mov	word_46010, ax
		push	si
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_42CB0
		add	sp, 6
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
		push	si
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_1B339
		add	sp, 6
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
		push	si
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_1B385
		add	sp, 6
		push	si
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_42CE0
		add	sp, 6
		pop	si
		leave
		retf
sub_1B3D1	endp

seg040		ends
