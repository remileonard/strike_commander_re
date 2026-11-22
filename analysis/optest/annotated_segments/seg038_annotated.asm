seg038		segment	byte public 'CODE' use16
		assume cs:seg038
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1A440	proc far		; CODE XREF: sub_C6E6A+118P
					; DATA XREF: dseg:2FCEo

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]

loc_1A44A:				; DATA XREF: seg170:01EEo
		cmp	[bp+arg_0], 0
		jz	short loc_1A47A
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 2FA6h
		test	si, 1
		jz	short loc_1A47A
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8

loc_1A47A:				; CODE XREF: sub_1A440+Fj
					; sub_1A440+1Dj
		pop	si
		leave
		retf
sub_1A440	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	word ptr es:[bx+6], 0
		les	bx, [bp+6]
		mov	dword ptr es:[bx+2], 0
		les	bx, [bp+6]
		mov	byte ptr es:[bx+8], 0
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1A49F	proc far		; CODE XREF: seg036:0086P
					; sub_C658C+57P

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+2], eax
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_8]
		mov	es:[bx+6], ax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+8], 0
		pop	bp
		retf
sub_1A49F	endp

; ���������������������������������������������������������������������������

loc_1A4C2:				; DATA XREF: dseg:2FCAo
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
seg038		ends
