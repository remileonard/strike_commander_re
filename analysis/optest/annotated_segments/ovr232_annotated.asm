ovr232		segment	para public 'OVERLAY' use16
		assume cs:ovr232
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C5950	proc far		; CODE XREF: sub_42CB0J

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	0
		push	large 53495254h
		push	si
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jnz	short loc_C5973
		jmp	loc_C5ABE
; ���������������������������������������������������������������������������

loc_C5973:				; CODE XREF: sub_C5950+1Ej
		push	0
		push	large 49525456h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C59A3
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_42BC0
		add	sp, 6
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0

loc_C59A3:				; CODE XREF: sub_C5950+36j
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jz	short loc_C59D3
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_42C80
		add	sp, 6
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2
		jmp	loc_C5A91
; ���������������������������������������������������������������������������

loc_C59D3:				; CODE XREF: sub_C5950+66j
		xor	di, di
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C59FB
		mov	eax, [si+72h]
		mov	ebx, 8
		cdq
		idiv	ebx
		mov	di, ax

loc_C59FB:				; CODE XREF: sub_C5950+98j
		mov	[bp+var_2], 0
		push	0
		push	large 534D4E41h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C5A27
		mov	eax, [si+72h]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	[bp+var_2], ax

loc_C5A27:				; CODE XREF: sub_C5950+C3j
		or	di, di
		jnz	short loc_C5A31
		cmp	[bp+var_2], 0
		jz	short loc_C5A47

loc_C5A31:				; CODE XREF: sub_C5950+D9j
		push	[bp+var_2]
		push	di
		mov	ax, [bp+arg_0]
		add	ax, 86h	; '�'
		push	[bp+arg_2]
		push	ax
		call	sub_42AC2
		add	sp, 8

loc_C5A47:				; CODE XREF: sub_C5950+DFj
		or	di, di
		jz	short loc_C5A6B
		push	0
		push	large 534D5854h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_42DA0
		add	sp, 6

loc_C5A6B:				; CODE XREF: sub_C5950+F9j
		cmp	[bp+var_2], 0
		jz	short loc_C5A91
		push	0
		push	large 534D4E41h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_42DD0
		add	sp, 6

loc_C5A91:				; CODE XREF: sub_C5950+80j
					; sub_C5950+11Fj
		push	0
		push	large 59585655h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C5AB5
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_42E00
		add	sp, 6

loc_C5AB5:				; CODE XREF: sub_C5950+154j
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_C5ABE:				; CODE XREF: sub_C5950+20j
		pop	di
		pop	si
		leave
		retf
sub_C5950	endp

ovr232		ends
