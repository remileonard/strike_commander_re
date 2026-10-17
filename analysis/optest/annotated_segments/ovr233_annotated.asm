ovr233		segment	para public 'OVERLAY' use16
		assume cs:ovr233
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C5AD0	proc far		; CODE XREF: sub_42CE0J

var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	[bp+var_2], 0
		jmp	short loc_C5B01
; ���������������������������������������������������������������������������

loc_C5ADF:				; CODE XREF: sub_C5AD0+35j
		mov	ax, [bp+var_2]
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	dword ptr es:[bx+64h], 0
		les	bx, [bp+arg_0]
		add	bx, [bp+var_2]
		mov	byte ptr es:[bx+5Ch], 0
		inc	[bp+var_2]

loc_C5B01:				; CODE XREF: sub_C5AD0+Dj
		cmp	[bp+var_2], 8
		jl	short loc_C5ADF
		push	0
		push	large 41544544h
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_C5B21
		jmp	loc_C5C67
; ���������������������������������������������������������������������������

loc_C5B21:				; CODE XREF: sub_C5AD0+4Cj
		mov	[bp+var_6], 304C564Ch
		mov	[bp+var_8], 0
		mov	[bp+var_A], 0
		jmp	loc_C5C51
; ���������������������������������������������������������������������������

loc_C5B36:				; CODE XREF: sub_C5AD0+187j
		push	0
		push	large [bp+var_6]
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_C5B4E
		jmp	loc_C5C46
; ���������������������������������������������������������������������������

loc_C5B4E:				; CODE XREF: sub_C5AD0+79j
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	dx, [bp+var_8]
		shl	dx, 2
		les	bx, [bp+arg_0]
		add	bx, dx
		mov	es:[bx+64h], eax
		mov	bx, [bp+arg_4]
		mov	eax, [bx+72h]
		add	eax, 0FFFFFFFCh
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	[bp+var_10], ax
		mov	ax, [bp+var_8]
		shl	ax, 1
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, [bp+var_10]
		mov	es:[bx+4Ch], ax
		push	1
		push	0
		push	2
		mov	ax, [bp+var_10]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	bx, [bp+var_8]
		shl	bx, 2
		les	si, [bp+arg_0]
		add	si, bx
		mov	es:[si+2Eh], dx
		mov	es:[si+2Ch], ax
		les	bx, [bp+arg_0]
		add	bx, [bp+var_8]
		mov	byte ptr es:[bx+5Ch], 1
		push	large [bp+var_E]
		mov	ax, [bp+var_8]
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		push	word ptr es:[bx+2Eh]
		push	word ptr es:[bx+2Ch]
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	ax, [bp+var_8]
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+2Eh]
		mov	dx, es:[bx+2Ch]
		mov	word ptr [bp+var_14+2],	ax
		mov	word ptr [bp+var_14], dx
		xor	di, di
		jmp	short loc_C5C3E
; ���������������������������������������������������������������������������

loc_C5C1D:				; CODE XREF: sub_C5AD0+171j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+28h]
		push	es
		les	si, [bp+var_14]
		mov	ax, es:[si]
		shl	ax, 1
		add	bx, ax
		pop	es
		mov	ax, es:[bx]
		les	bx, [bp+var_14]
		mov	es:[bx], ax
		inc	di
		add	word ptr [bp+var_14], 2

loc_C5C3E:				; CODE XREF: sub_C5AD0+14Bj
		cmp	di, [bp+var_10]
		jl	short loc_C5C1D
		inc	[bp+var_8]

loc_C5C46:				; CODE XREF: sub_C5AD0+7Bj
		add	[bp+var_6], 1000000h
		inc	[bp+var_A]

loc_C5C51:				; CODE XREF: sub_C5AD0+63j
		cmp	[bp+var_A], 8
		jge	short loc_C5C5A
		jmp	loc_C5B36
; ���������������������������������������������������������������������������

loc_C5C5A:				; CODE XREF: sub_C5AD0+185j
		push	[bp+arg_4]
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		jmp	short loc_C5C99
; ���������������������������������������������������������������������������

loc_C5C67:				; CODE XREF: sub_C5AD0+4Ej
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+64h], 0
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+28h]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Ch], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+26h]
		les	bx, [bp+arg_0]
		mov	es:[bx+4Ch], ax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+5Ch], 0

loc_C5C99:				; CODE XREF: sub_C5AD0+195j
		pop	di
		pop	si
		leave
		retf
sub_C5AD0	endp

ovr233		ends
