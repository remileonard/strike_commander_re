ovr219		segment	para public 'OVERLAY' use16
		assume cs:ovr219
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2650	proc far		; CODE XREF: sub_4299AJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_C2662
		jmp	loc_C26E4
; ���������������������������������������������������������������������������

loc_C2662:				; CODE XREF: sub_C2650+Dj
		mov	word ptr [si], 32B4h
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_C2683
		push	3
		push	word ptr [si+0Ch]
		push	word ptr [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+28h]
		add	sp, 6
		jmp	short $+2

loc_C2683:				; CODE XREF: sub_C2650+1Bj
		mov	dword ptr [si+0Ah], 0
		push	3
		push	word ptr [si+1Eh]
		call	sub_20D1A
		add	sp, 4
		mov	word ptr [si+1Eh], 0
		push	word ptr [si+26h]
		call	sub_308
		add	sp, 2
		mov	word ptr [si+26h], 0
		push	si
		push	6363h
		call	sub_22251
		add	sp, 4
		push	word ptr [si+10h]
		push	word ptr [si+0Eh]
		push	6350h
		call	sub_219F0
		add	sp, 6
		push	0
		push	si
		call	sub_28B42
		add	sp, 4
		test	di, 1
		jz	short loc_C26E4
		push	si
		call	sub_308
		add	sp, 2

loc_C26E4:				; CODE XREF: sub_C2650+Fj
					; sub_C2650+89j
		pop	di
		pop	si
		pop	bp
		retf
sub_C2650	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C26E8	proc far		; CODE XREF: sub_4299FJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_4644D, 0
		push	[bp+arg_2]
		push	si
		push	word ptr [si+10h]
		push	word ptr [si+0Eh]
		les	bx, [si+0Eh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		or	al, al
		jz	short loc_C271A
		push	si
		push	6369h
		call	sub_2039A
		add	sp, 4

loc_C271A:				; CODE XREF: sub_C26E8+24j
		pop	si
		pop	bp
		retf
sub_C26E8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C271D	proc far		; CODE XREF: sub_42995J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_C271D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C2725	proc far		; CODE XREF: sub_42990J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, 0
		pop	bp
		retf
sub_C2725	endp

; ���������������������������������������������������������������������������
		pop	bp
		retf
ovr219		ends
