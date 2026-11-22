seg036		segment	byte public 'CODE' use16
		assume cs:seg036
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1A0D0	proc far		; CODE XREF: sub_C6390+1CFP
					; DATA XREF: dseg:2FD2o

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]

loc_1A0DA:				; DATA XREF: seg170:01DEo
		cmp	[bp+arg_0], 0
		jz	short loc_1A10A
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 2FD2h
		test	si, 1
		jz	short loc_1A10A
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8

loc_1A10A:				; CODE XREF: sub_1A0D0+Fj
					; sub_1A0D0+1Dj
		pop	si
		leave
		retf
sub_1A0D0	endp

; ���������������������������������������������������������������������������

loc_1A10D:				; DATA XREF: dseg:2FD6o
		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		mov	eax, [bp+6]
		mov	[bp-8],	eax
		mov	ax, [bp+0Ah]
		mov	[bp-0Ah], ax
		push	1
		push	0
		push	2
		push	large 9
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	[bp-0Ch], dx
		mov	[bp-0Eh], ax
		or	ax, dx
		jz	short loc_1A166
		les	bx, [bp-0Eh]
		mov	word ptr es:[bx], 2FA6h
		push	word ptr [bp-0Ah]
		push	word ptr [bp-6]
		push	word ptr [bp-8]
		push	word ptr [bp-0Ch]
		push	word ptr [bp-0Eh]
		call	sub_1A49F
		add	sp, 0Ah
		mov	dx, [bp-0Ch]
		mov	ax, [bp-0Eh]
		jmp	short loc_1A16C
; ���������������������������������������������������������������������������

loc_1A166:				; CODE XREF: seg036:006Dj
		mov	dx, [bp-0Ch]
		mov	ax, [bp-0Eh]

loc_1A16C:				; CODE XREF: seg036:0094j
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		leave
		retf
; ���������������������������������������������������������������������������
		leave
		retf
; ���������������������������������������������������������������������������

loc_1A17C:				; DATA XREF: dseg:2FDAo
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A185:				; DATA XREF: dseg:2FA6o
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A18A:				; DATA XREF: dseg:2FAAo
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A18F:				; DATA XREF: dseg:2FAEo
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A198:				; DATA XREF: dseg:2FB2o
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A1A1:				; DATA XREF: dseg:2FB6o
		push	bp
		mov	bp, sp
		mov	dx, ds
		mov	ax, 6528h
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A1AD:				; DATA XREF: dseg:2FBAo dseg:37C2o
		push	bp
		mov	bp, sp
		mov	dx, ds
		mov	ax, 6528h
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A1B9:				; DATA XREF: dseg:2FBEo
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A1C2:				; DATA XREF: dseg:2FC2o dseg:37CAo
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1A1C7:				; DATA XREF: dseg:2FC6o
		push	bp
		mov	bp, sp
		pop	bp
		retf
seg036		ends
