seg037		segment	byte public 'CODE' use16
		assume cs:seg037
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1A1CC	proc far		; CODE XREF: sub_1A317+C9p
					; sub_1A317+108p

var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		push	0
		push	large 594C4F50h
		push	si
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_1A1F6
		jmp	loc_1A2EE
; ���������������������������������������������������������������������������

loc_1A1F6:				; CODE XREF: sub_1A1CC+25j
		mov	[bp+var_6], si
		push	1
		push	0
		push	2
		push	large 9Eh ; '�'
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		or	ax, dx
		jnz	short loc_1A21D
		jmp	loc_1A2E2
; ���������������������������������������������������������������������������

loc_1A21D:				; CODE XREF: sub_1A1CC+4Cj
		les	bx, [bp+var_A]
		mov	word ptr es:[bx], 2FD2h
		les	bx, [bp+var_A]
		mov	word ptr es:[bx], 2FDEh
		les	bx, [bp+var_A]
		mov	dword ptr es:[bx+8], 0
		les	bx, [bp+var_A]
		mov	byte ptr es:[bx+0Ch], 2
		les	bx, [bp+var_A]
		mov	byte ptr es:[bx+0Dh], 0
		les	bx, [bp+var_A]
		mov	dword ptr es:[bx+0Eh], 0
		les	bx, [bp+var_A]
		mov	dword ptr es:[bx+12h], 0
		les	bx, [bp+var_A]
		mov	byte ptr es:[bx+16h], 2
		les	bx, [bp+var_A]
		mov	byte ptr es:[bx+17h], 0
		les	bx, [bp+var_A]
		mov	dword ptr es:[bx+18h], 0
		les	bx, [bp+var_A]
		mov	dword ptr es:[bx+1Ch], 0
		les	bx, [bp+var_A]
		mov	byte ptr es:[bx+20h], 2
		les	bx, [bp+var_A]
		mov	byte ptr es:[bx+21h], 0
		les	bx, [bp+var_A]
		mov	dword ptr es:[bx+22h], 0
		les	bx, [bp+var_A]
		xor	ax, ax
		mov	es:[bx+88h], ax
		les	bx, [bp+var_A]
		mov	es:[bx+86h], ax
		les	bx, [bp+var_A]
		xor	ax, ax
		mov	es:[bx+8Ch], ax
		les	bx, [bp+var_A]
		mov	es:[bx+8Ah], ax
		push	[bp+var_6]
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		call	sub_42D45
		add	sp, 6
		mov	dx, word ptr [bp+var_A+2]
		mov	ax, word ptr [bp+var_A]
		jmp	short loc_1A2E8
; ���������������������������������������������������������������������������

loc_1A2E2:				; CODE XREF: sub_1A1CC+4Ej
		mov	dx, word ptr [bp+var_A+2]
		mov	ax, word ptr [bp+var_A]

loc_1A2E8:				; CODE XREF: sub_1A1CC+114j
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_1A2EE:				; CODE XREF: sub_1A1CC+27j
		cmp	[bp+var_4], 0
		jnz	short loc_1A302
		push	6002h
		call	sub_30D3
		add	sp, 2
		jmp	short loc_1A30B
; ���������������������������������������������������������������������������

loc_1A302:				; CODE XREF: sub_1A1CC+127j
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_1A30B:				; CODE XREF: sub_1A1CC+134j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
sub_1A1CC	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1A317	proc far		; CODE XREF: sub_C2BC0+361P

var_B8		= word ptr -0B8h
var_5B		= dword	ptr -5Bh
var_57		= dword	ptr -57h
var_53		= dword	ptr -53h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B8h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		push	0
		push	large 52505041h
		push	si
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_1A342
		jmp	loc_1A434
; ���������������������������������������������������������������������������

loc_1A342:				; CODE XREF: sub_1A317+26j
		push	0
		push	large 454C4946h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_1A35A
		jmp	loc_1A41D
; ���������������������������������������������������������������������������

loc_1A35A:				; CODE XREF: sub_1A317+3Ej
		mov	[bp+var_10], si
		push	[bp+var_10]
		lea	ax, [bp+var_E]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_B8], 556h
		mov	[bp+var_57], 100h
		mov	[bp+var_5B], 0
		mov	[bp+var_B8], 56Eh
		mov	[bp+var_3C], 0
		xor	ax, ax
		mov	[bp+var_3E], ax
		movsx	eax, ax
		mov	[bp+var_53], eax
		push	1
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		mov	bx, [bp+var_B8]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	dword ptr [si+6Dh], 52505041h
		jnz	short loc_1A3CB
		mov	ax, 1
		jmp	short loc_1A3CD
; ���������������������������������������������������������������������������

loc_1A3CB:				; CODE XREF: sub_1A317+ADj
		xor	ax, ax

loc_1A3CD:				; CODE XREF: sub_1A317+B2j
		or	ax, ax
		jz	short loc_1A3EE
		push	si
		call	sub_3C491
		add	sp, 2
		lea	ax, [bp+var_B8]
		push	ax
		push	cs
		call	near ptr sub_1A1CC
		add	sp, 2
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		jmp	short loc_1A3F9
; ���������������������������������������������������������������������������

loc_1A3EE:				; CODE XREF: sub_1A317+B8j
		push	6003h
		call	sub_30D3
		add	sp, 2

loc_1A3F9:				; CODE XREF: sub_1A317+D5j
		mov	[bp+var_B8], 56Eh
		lea	ax, [bp+var_B8]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		jmp	short loc_1A42B
; ���������������������������������������������������������������������������

loc_1A41D:				; CODE XREF: sub_1A317+40j
		push	si
		push	cs
		call	near ptr sub_1A1CC
		add	sp, 2
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_1A42B:				; CODE XREF: sub_1A317+104j
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_1A434:				; CODE XREF: sub_1A317+28j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
sub_1A317	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
seg037		ends
