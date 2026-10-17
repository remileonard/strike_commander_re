ovr222		segment	para public 'OVERLAY' use16
		assume cs:ovr222
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2FD0	proc far		; CODE XREF: sub_42A60J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		call	sub_42945
		add	sp, 4
		cmp	word ptr [si+26h], 0
		jz	short loc_C3001
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		push	word ptr [si+26h]
		call	sub_2581F
		add	sp, 4
		mov	bx, [si+26h]
		or	byte ptr [bx+30h], 2

loc_C3001:				; CODE XREF: sub_C2FD0+17j
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	sub_2621D
		add	sp, 4
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_C3037
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_C3037:				; CODE XREF: sub_C2FD0+53j
		cmp	word ptr [si+1Eh], 0
		jz	short loc_C3048
		push	word ptr [si+1Eh]
		call	sub_20DB2
		add	sp, 2

loc_C3048:				; CODE XREF: sub_C2FD0+6Bj
		pop	si
		pop	bp
		retf
sub_C2FD0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C304B	proc far		; CODE XREF: sub_42A65J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+78h]
		add	sp, 2
		push	ax
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	sub_2581F
		add	sp, 4
		push	si
		call	sub_4294A
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_C304B	endp

ovr222		ends
