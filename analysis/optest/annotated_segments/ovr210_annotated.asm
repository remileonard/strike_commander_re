ovr210		segment	para public 'OVERLAY' use16
		assume cs:ovr210
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_BDDC0	proc far		; CODE XREF: sub_42650J

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+1Dh]
		push	word ptr [si+1Bh]
		push	word ptr [si+19h]
		push	word ptr [si+17h]
		push	100h
		push	100h
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		push	0
		mov	al, [si+6]
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		mov	ax, [bp+arg_8]
		add	ax, [si+0Eh]
		push	ax
		push	[bp+arg_6]
		push	[bp+arg_2]
		call	Render_DrawScaledSprite_32F28
		add	sp, 18h
		pop	si
		pop	bp
		retf
sub_BDDC0	endp

ovr210		ends
