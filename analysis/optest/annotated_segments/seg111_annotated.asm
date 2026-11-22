seg111		segment	byte public 'CODE' use16
		assume cs:seg111
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_31CE8	proc far		; CODE XREF: seg107:0264P

var_35		= word ptr -35h
var_33		= word ptr -33h
var_31		= word ptr -31h
var_2F		= word ptr -2Fh
var_2D		= word ptr -2Dh
var_2B		= word ptr -2Bh
var_25		= word ptr -25h
var_23		= word ptr -23h
var_21		= dword	ptr -21h
var_1D		= word ptr -1Dh
var_1B		= word ptr -1Bh
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 35h
		push	ds
		push	es
		push	si
		push	di
		cld
		push	ss
		pop	es
		lea	di, [bp+var_35]
		mov	si, [bp+arg_6]
		mov	cx, 10h
		rep movsb
		lea	di, [bp+var_25]
		mov	si, [bp+arg_4]
		mov	cx, 13h
		rep movsb
		mov	ax, [bp+arg_2]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_0]
		mov	[bp+var_8], ax
		xor	ax, ax
		mov	[bp+var_6], 0
		mov	[bp+var_4], 0
		mov	ax, [bp+var_1D]
		add	ax, 7
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		mov	[bp+var_10], ax
		mov	[bp+var_12], 80h ; '�'
		mov	bx, [bp+var_2F]
		mov	cx, [bp+var_2B]
		mov	ax, [bp+var_23]
		cmp	ax, cx
		jg	short loc_31D79
		add	ax, [bp+var_1B]
		cmp	ax, cx
		jg	short loc_31D77
		cmp	ax, bx
		jle	short loc_31D79
		sub	ax, [bp+var_1B]
		cmp	ax, bx
		jl	short loc_31D77
		mov	bx, [bp+var_31]
		mov	cx, [bp+var_2D]
		mov	ax, [bp+var_25]
		cmp	ax, cx
		jg	short loc_31D79
		add	ax, [bp+var_1D]
		cmp	ax, cx
		jg	short loc_31D77
		cmp	ax, bx
		jle	short loc_31D79
		sub	ax, [bp+var_1D]
		cmp	ax, bx
		jl	short loc_31D77
		jmp	short loc_31D7C
; ���������������������������������������������������������������������������

loc_31D77:				; CODE XREF: sub_31CE8+61j
					; sub_31CE8+6Cj ...
		jmp	short loc_31D7E
; ���������������������������������������������������������������������������

loc_31D79:				; CODE XREF: sub_31CE8+5Aj
					; sub_31CE8+65j ...
		jmp	loc_31EDF
; ���������������������������������������������������������������������������

loc_31D7C:				; CODE XREF: sub_31CE8+8Dj
		jmp	short loc_31DE3
; ���������������������������������������������������������������������������

loc_31D7E:				; CODE XREF: sub_31CE8:loc_31D77j
		mov	ax, [bp+var_31]
		sub	ax, [bp+var_25]
		jle	short loc_31DA5
		sub	[bp+var_1D], ax
		jle	short loc_31D79
		mov	cx, ax
		and	cx, 7
		shr	[bp+var_12], cl
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		add	word ptr [bp+var_21], ax
		adc	word ptr [bp+var_21+2],	0
		mov	[bp+var_25], 0

loc_31DA5:				; CODE XREF: sub_31CE8+9Cj
		mov	ax, [bp+var_25]
		add	ax, [bp+var_1D]
		dec	ax
		cmp	ax, [bp+var_2D]
		jle	short loc_31DB9
		sub	ax, [bp+var_2D]
		sub	[bp+var_1D], ax
		jle	short loc_31D79

loc_31DB9:				; CODE XREF: sub_31CE8+C7j
		mov	dx, [bp+var_2F]
		sub	dx, [bp+var_23]
		jle	short loc_31DD4
		sub	[bp+var_1B], dx
		mov	ax, [bp+var_10]
		imul	dx
		add	word ptr [bp+var_21], ax
		adc	word ptr [bp+var_21+2],	dx
		mov	[bp+var_23], 0

loc_31DD4:				; CODE XREF: sub_31CE8+D7j
		mov	ax, [bp+var_23]
		add	ax, [bp+var_1B]
		sub	ax, [bp+var_2B]
		dec	ax
		jle	short loc_31DE3
		sub	[bp+var_1B], ax

loc_31DE3:				; CODE XREF: sub_31CE8:loc_31D7Cj
					; sub_31CE8+F6j
		shl	[bp+var_23], 1
		mov	ax, [bp+var_33]
		add	[bp+var_23], ax
		mov	es, [bp+var_35]
		push	ax
		push	di
		mov	di, [bp+var_A]
		mov	bl, [di]
		xor	ax, ax
		mov	al, bl
		mov	[bp+var_E], ax
		inc	di
		mov	[bp+var_A], di
		mov	bl, [di]
		mov	[bp+var_6], 1
		mov	di, [bp+var_8]
		mov	bh, [di]
		mov	al, bh
		mov	[bp+var_C], ax
		inc	di
		mov	[bp+var_8], di
		mov	bh, [di]
		mov	[bp+var_4], offset unk_43021
		mov	[bp+var_2], ds
		pop	di
		pop	ax
		mov	ah, 0FFh

loc_31E24:				; CODE XREF: sub_31CE8+1F4j
		lds	si, [bp+var_21]
		mov	di, [bp+var_23]
		add	[bp+var_23], 2
		mov	di, ss:[di]
		add	di, [bp+var_25]
		mov	dx, [bp+var_1D]
		mov	cx, [bp+var_12]
		mov	ch, [si]

loc_31E3C:				; CODE XREF: sub_31CE8+1ACj
		test	cl, ch
		jz	short loc_31E44
		mov	al, bl
		jmp	short loc_31E46
; ���������������������������������������������������������������������������

loc_31E44:				; CODE XREF: sub_31CE8+156j
		mov	al, bh

loc_31E46:				; CODE XREF: sub_31CE8+15Aj
		cmp	al, ah
		jz	short loc_31E4C
		stosb
		dec	di

loc_31E4C:				; CODE XREF: sub_31CE8+160j
		inc	di
		shr	cl, 1
		jnb	short loc_31E56
		lodsb
		mov	ch, al
		mov	cl, 80h	; '�'

loc_31E56:				; CODE XREF: sub_31CE8+167j
		push	ax
		push	di
		push	ds
		mov	ds, [bp+var_2]
		mov	ax, [bp+var_E]
		or	ax, ax
		jz	short loc_31E76
		cmp	ax, 1
		jz	short loc_31E76
		mov	ax, [bp+var_6]
		mov	di, [bp+var_A]
		add	di, ax
		mov	bl, [di]
		inc	ax
		mov	[bp+var_6], ax

loc_31E76:				; CODE XREF: sub_31CE8+179j
					; sub_31CE8+17Ej
		mov	ax, [bp+var_C]
		or	ax, ax
		jz	short loc_31E90
		cmp	ax, 1
		jz	short loc_31E90
		mov	ax, [bp+var_4]
		mov	di, [bp+var_8]
		add	di, ax
		mov	bh, [di]
		inc	ax
		mov	[bp+var_4], ax

loc_31E90:				; CODE XREF: sub_31CE8+193j
					; sub_31CE8+198j
		pop	ds
		pop	di
		pop	ax
		dec	dx
		jnz	short loc_31E3C
		push	ax
		mov	ax, [bp+var_10]
		add	word ptr [bp+var_21], ax
		adc	word ptr [bp+var_21+2],	0
		pop	ax
		push	ax
		push	di
		push	ds
		mov	ds, [bp+var_2]
		mov	ax, [bp+var_E]
		cmp	ax, 1
		jnz	short loc_31EBE
		mov	ax, [bp+var_6]
		mov	di, [bp+var_A]
		add	di, ax
		mov	bl, [di]
		inc	ax
		mov	[bp+var_6], ax

loc_31EBE:				; CODE XREF: sub_31CE8+1C6j
		mov	ax, [bp+var_C]
		cmp	ax, 1
		jnz	short loc_31ED4
		mov	ax, [bp+var_4]
		mov	di, [bp+var_8]
		add	di, ax
		mov	bh, [di]
		inc	ax
		mov	[bp+var_4], ax

loc_31ED4:				; CODE XREF: sub_31CE8+1DCj
		pop	ds
		pop	di
		pop	ax
		dec	[bp+var_1B]
		jle	short loc_31EDF
		jmp	loc_31E24
; ���������������������������������������������������������������������������

loc_31EDF:				; CODE XREF: sub_31CE8:loc_31D79j
					; sub_31CE8+1F2j
		pop	di
		pop	si
		pop	es
		pop	ds
		mov	sp, bp
		pop	bp
		retf	8
sub_31CE8	endp

seg111		ends
