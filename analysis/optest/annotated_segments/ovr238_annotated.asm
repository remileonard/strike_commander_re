ovr238		segment	para public 'OVERLAY' use16
		assume cs:ovr238
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C61F0	proc far		; CODE XREF: sub_42DD0J

var_A		= word ptr -0Ah
var_8		= word ptr -8
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	byte ptr [bp+0], 0
		xor	si, si
		jmp	short loc_C6249
; ���������������������������������������������������������������������������

loc_C6203:				; CODE XREF: sub_C61F0+61j
		push	di
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		mov	[bp+var_A], ax
		push	large 8
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		push	0
		push	0
		push	[bp+var_A]
		lea	ax, [bp+var_8]
		push	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+86h]
		add	ax, si
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 86h	; '�'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_42ACC
		add	sp, 0Eh
		inc	si

loc_C6249:				; CODE XREF: sub_C61F0+11j
		les	bx, [bp+arg_0]
		cmp	es:[bx+88h], si
		ja	short loc_C6203
		pop	di
		pop	si
		leave
		retf
sub_C61F0	endp

ovr238		ends
