seg054		segment	byte public 'CODE' use16
		assume cs:seg054
		;org 1
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_22411	proc far		; CODE XREF: sub_22454+1Cp
					; sub_C3281+C2P ...

arg_0		= word ptr  6

		push	bp

loc_22412:				; DATA XREF: seg170:0276o
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+6], 0
		jle	short loc_22450
		inc	word ptr [si+0Ah]
		mov	ax, [si+0Ah]
		cmp	ax, [si+6]
		jl	short loc_2242F
		mov	word ptr [si+0Ah], 0

loc_2242F:				; CODE XREF: sub_22411+17j
		mov	ax, [si+0Ah]
		mov	dx, 6
		imul	dx
		mov	dx, [si+8]
		add	dx, ax
		mov	di, dx
		mov	eax, [di]
		mov	[si], eax
		mov	al, [di+4]
		mov	[si+4],	al
		mov	al, [di+5]
		mov	[si+5],	al

loc_22450:				; CODE XREF: sub_22411+Cj
		pop	di
		pop	si
		pop	bp
		retf
sub_22411	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_22454	proc far		; CODE XREF: sub_1A59D+42P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+2], 0
		jz	short loc_22483
		les	bx, [bp+arg_0]
		mov	si, es:[bx+6]
		xor	di, di
		jmp	short loc_2247A
; ���������������������������������������������������������������������������

loc_2246E:				; CODE XREF: sub_22454+2Dj
		push	si
		push	cs
		call	near ptr sub_22411
		add	sp, 2
		inc	di
		add	si, 0Ch

loc_2247A:				; CODE XREF: sub_22454+18j
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], di
		ja	short loc_2246E

loc_22483:				; CODE XREF: sub_22454+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_22454	endp

seg054		ends
