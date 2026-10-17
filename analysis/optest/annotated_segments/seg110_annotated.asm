seg110		segment	byte public 'CODE' use16
		assume cs:seg110
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_31BA0	proc far		; CODE XREF: seg107:027BP

var_27		= word ptr -27h
var_25		= word ptr -25h
var_23		= word ptr -23h
var_21		= word ptr -21h
var_1F		= word ptr -1Fh
var_1D		= word ptr -1Dh
var_17		= word ptr -17h
var_15		= word ptr -15h
var_13		= dword	ptr -13h
var_F		= word ptr -0Fh
var_D		= word ptr -0Dh
var_B		= byte ptr -0Bh
var_A		= byte ptr -0Ah
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 27h
		push	ds
		push	es
		push	si
		push	di
		cld

loc_31BAB:				; DATA XREF: seg170:0446o
		push	ss
		pop	es
		lea	di, [bp+var_27]
		mov	si, [bp+arg_2]
		mov	cx, 10h
		rep movsb
		lea	di, [bp+var_17]
		mov	si, [bp+arg_0]
		mov	cx, 13h
		rep movsb
		mov	ax, [bp+var_F]
		add	ax, 7
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		mov	[bp+var_2], ax
		mov	[bp+var_4], 80h	; '�'
		mov	bx, [bp+var_21]
		mov	cx, [bp+var_1D]
		mov	ax, [bp+var_15]
		cmp	ax, cx
		jg	short loc_31C19
		add	ax, [bp+var_D]
		cmp	ax, cx
		jg	short loc_31C17
		cmp	ax, bx
		jle	short loc_31C19
		sub	ax, [bp+var_D]
		cmp	ax, bx
		jl	short loc_31C17
		mov	bx, [bp+var_23]
		mov	cx, [bp+var_1F]
		mov	ax, [bp+var_17]
		cmp	ax, cx
		jg	short loc_31C19
		add	ax, [bp+var_F]
		cmp	ax, cx
		jg	short loc_31C17
		cmp	ax, bx
		jle	short loc_31C19
		sub	ax, [bp+var_F]
		cmp	ax, bx
		jl	short loc_31C17
		jmp	short loc_31C1C
; ���������������������������������������������������������������������������

loc_31C17:				; CODE XREF: sub_31BA0+49j
					; sub_31BA0+54j ...
		jmp	short loc_31C1E
; ���������������������������������������������������������������������������

loc_31C19:				; CODE XREF: sub_31BA0+42j
					; sub_31BA0+4Dj ...
		jmp	loc_31CDD
; ���������������������������������������������������������������������������

loc_31C1C:				; CODE XREF: sub_31BA0+75j
		jmp	short loc_31C83
; ���������������������������������������������������������������������������

loc_31C1E:				; CODE XREF: sub_31BA0:loc_31C17j
		mov	ax, [bp+var_23]
		sub	ax, [bp+var_17]
		jle	short loc_31C45
		sub	[bp+var_F], ax
		jle	short loc_31C19
		mov	cx, ax
		and	cx, 7
		shr	[bp+var_4], cl
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		add	word ptr [bp+var_13], ax
		adc	word ptr [bp+var_13+2],	0
		mov	[bp+var_17], 0

loc_31C45:				; CODE XREF: sub_31BA0+84j
		mov	ax, [bp+var_17]
		add	ax, [bp+var_F]
		dec	ax
		cmp	ax, [bp+var_1F]
		jle	short loc_31C59
		sub	ax, [bp+var_1F]
		sub	[bp+var_F], ax
		jle	short loc_31C19

loc_31C59:				; CODE XREF: sub_31BA0+AFj
		mov	dx, [bp+var_21]
		sub	dx, [bp+var_15]
		jle	short loc_31C74
		sub	[bp+var_D], dx
		mov	ax, [bp+var_2]
		imul	dx
		add	word ptr [bp+var_13], ax
		adc	word ptr [bp+var_13+2],	dx
		mov	[bp+var_15], 0

loc_31C74:				; CODE XREF: sub_31BA0+BFj
		mov	ax, [bp+var_15]
		add	ax, [bp+var_D]
		sub	ax, [bp+var_1D]
		dec	ax
		jle	short loc_31C83
		sub	[bp+var_D], ax

loc_31C83:				; CODE XREF: sub_31BA0:loc_31C1Cj
					; sub_31BA0+DEj
		shl	[bp+var_15], 1
		mov	ax, [bp+var_25]
		add	[bp+var_15], ax
		mov	es, [bp+var_27]
		mov	bl, [bp+var_B]
		mov	bh, [bp+var_A]
		mov	ah, 0FFh

loc_31C97:				; CODE XREF: sub_31BA0+13Bj
		lds	si, [bp+var_13]
		mov	di, [bp+var_15]
		add	[bp+var_15], 2
		mov	di, ss:[di]
		add	di, [bp+var_17]
		mov	dx, [bp+var_F]
		mov	cx, [bp+var_4]
		mov	ch, [si]

loc_31CAF:				; CODE XREF: sub_31BA0+12Aj
		test	cl, ch
		jz	short loc_31CB7
		mov	al, bl
		jmp	short loc_31CB9
; ���������������������������������������������������������������������������

loc_31CB7:				; CODE XREF: sub_31BA0+111j
		mov	al, bh

loc_31CB9:				; CODE XREF: sub_31BA0+115j
		cmp	al, ah
		jz	short loc_31CBF
		stosb
		dec	di

loc_31CBF:				; CODE XREF: sub_31BA0+11Bj
		inc	di
		shr	cl, 1
		jnb	short loc_31CC9
		lodsb
		mov	ch, al
		mov	cl, 80h	; '�'

loc_31CC9:				; CODE XREF: sub_31BA0+122j
		dec	dx
		jnz	short loc_31CAF
		push	ax
		mov	ax, [bp+var_2]
		add	word ptr [bp+var_13], ax
		adc	word ptr [bp+var_13+2],	0
		pop	ax
		dec	[bp+var_D]
		jg	short loc_31C97

loc_31CDD:				; CODE XREF: sub_31BA0:loc_31C19j
		pop	di
		pop	si
		pop	es
		pop	ds
		mov	sp, bp
		pop	bp
		retf	4
sub_31BA0	endp

seg110		ends
