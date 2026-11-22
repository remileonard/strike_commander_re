seg061		segment	byte public 'CODE' use16
		assume cs:seg061
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_28B08:				; DATA XREF: dseg:3340o
		push	bp
		mov	bp, sp
		mov	bx, [bp+6]

loc_28B0E:				; DATA XREF: seg170:02AEo
		xor	dx, dx
		xor	ax, ax
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_28B16:				; DATA XREF: dseg:3344o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_28B1E:				; DATA XREF: dseg:3348o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_28B26:				; DATA XREF: dseg:334Co
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_28B2E:				; DATA XREF: dseg:3350o
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_28B3A:				; DATA XREF: dseg:3354o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_28B42	proc far		; CODE XREF: sub_C2650+7DP
					; DATA XREF: dseg:3358o

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_28B69
		mov	word ptr [si], 3340h
		mov	word ptr [si+2], 0FFFFh
		test	di, 1
		jz	short loc_28B69
		push	si
		call	sub_308
		add	sp, 2

loc_28B69:				; CODE XREF: sub_28B42+Dj
					; sub_28B42+1Cj
		pop	di
		pop	si
		pop	bp
		retf
sub_28B42	endp

; ���������������������������������������������������������������������������

loc_28B6D:				; DATA XREF: dseg:335Co
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
seg061		ends
