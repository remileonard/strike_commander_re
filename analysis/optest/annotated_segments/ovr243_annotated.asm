ovr243		segment	para public 'OVERLAY' use16
		assume cs:ovr243
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C7F20	proc far		; CODE XREF: sub_42F00J

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+6]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+7]
		push	word_46F44
		call	Render_SetPixelClipped_328DE
		add	sp, 8
		pop	bp
		retf
sub_C7F20	endp

ovr243		ends
