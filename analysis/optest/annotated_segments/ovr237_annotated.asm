ovr237		segment	para public 'OVERLAY' use16
		assume cs:ovr237
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C61A0	proc far		; CODE XREF: sub_42DA0J

var_8		= word ptr -8
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	byte ptr [bp+0], 0
		xor	si, si
		jmp	short loc_C61E0
; ���������������������������������������������������������������������������

loc_C61B3:				; CODE XREF: sub_C61A0+48j
		push	large 8
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		push	0
		push	0
		lea	ax, [bp+var_8]
		push	ax
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 86h	; '�'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_42AC7
		add	sp, 0Ch
		inc	si

loc_C61E0:				; CODE XREF: sub_C61A0+11j
		les	bx, [bp+arg_0]
		cmp	es:[bx+86h], si
		ja	short loc_C61B3
		pop	di
		pop	si
		leave
		retf
sub_C61A0	endp

ovr237		ends
