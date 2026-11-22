seg041		segment	byte public 'CODE' use16
		assume cs:seg041
		;org 0Bh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_1B4BB:				; DATA XREF: dseg:2DD8o dseg:2DFCo ...
		push	bp
		mov	bp, sp
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1B4C0	proc far		; CODE XREF: seg028:0C4FP seg028:0DDEP ...

var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2]
		sar	eax, 8
		push	eax
		push	62D0h
		call	Palette_FogTableIndex_1F908
		add	sp, 6
		push	ax
		push	62D0h
		call	sub_1ECF9
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_1B500
		mov	al, [bp+arg_4]
		mov	[bp+var_5], al
		jmp	short loc_1B510
; ���������������������������������������������������������������������������

loc_1B500:				; CODE XREF: sub_1B4C0+36j
		mov	al, [bp+arg_4]
		mov	ah, 0
		les	bx, [bp+var_4]
		add	bx, ax
		mov	al, es:[bx]
		mov	[bp+var_5], al

loc_1B510:				; CODE XREF: sub_1B4C0+3Ej
		mov	al, [bp+var_5]
		leave
		retf
sub_1B4C0	endp

; ���������������������������������������������������������������������������
		leave
		retf
seg041		ends
