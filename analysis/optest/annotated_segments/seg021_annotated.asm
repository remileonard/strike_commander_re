seg021		segment	byte public 'CODE' use16
		assume cs:seg021
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_D2CC	proc far		; CODE XREF: seg021:07D2p sub_DAEB+29p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_D2E7
		push	35h ; '5'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_D312

loc_D2E7:				; CODE XREF: sub_D2CC+9j
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_FED6
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2A87h
		xor	ax, ax
		mov	[si+20h], ax
		mov	[si+1Eh], ax
		mov	word ptr [si+22h], 0
		mov	byte ptr [si+34h], 0

loc_D312:				; CODE XREF: sub_D2CC+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_D2CC	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_D31A	proc far		; CODE XREF: sub_DC89+AFp
					; DATA XREF: dseg:2AB7o

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_D34F
		mov	word ptr [si+0Eh], 2A87h
		push	si
		nop
		push	cs
		call	near ptr sub_D3CD
		add	sp, 2
		push	si
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		test	di, 1
		jz	short loc_D34F
		push	si
		call	sub_308
		add	sp, 2

loc_D34F:				; CODE XREF: sub_D31A+Dj sub_D31A+2Aj
		pop	di
		pop	si
		pop	bp
		retf
sub_D31A	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	byte ptr [si+34h], 1
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_D387
		add	sp, 4
		mov	di, ax
		jmp	short loc_D37F
; ���������������������������������������������������������������������������

loc_D36E:				; CODE XREF: seg021:00C1j
		and	byte ptr [di+10h], 0FBh
		push	1
		push	si
		nop
		push	cs
		call	near ptr sub_D387
		add	sp, 4
		mov	di, ax

loc_D37F:				; CODE XREF: seg021:00ACj
		or	di, di
		jnz	short loc_D36E
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_D387	proc far		; CODE XREF: seg021:00A4p seg021:00B7p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

; FUNCTION CHUNK AT 010A SIZE 00000003 BYTES

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jnz	short loc_D39D
		mov	ax, [si+1Eh]
		mov	[si+24h], ax
		jmp	short loc_D3B5
; ���������������������������������������������������������������������������

loc_D39D:				; CODE XREF: sub_D387+Cj
		jmp	short loc_D3A8
; ���������������������������������������������������������������������������

loc_D39F:				; CODE XREF: sub_D387+2Cj
		mov	bx, [si+24h]
		mov	ax, [bx+2]
		mov	[si+24h], ax

loc_D3A8:				; CODE XREF: sub_D387:loc_D39Dj
		cmp	word ptr [si+24h], 0
		jz	short loc_D3B5
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_D39F

loc_D3B5:				; CODE XREF: sub_D387+14j sub_D387+25j
		cmp	word ptr [si+24h], 0
		jnz	short loc_D3C2
		xor	ax, ax
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_D3CA
; ���������������������������������������������������������������������������

loc_D3C2:				; CODE XREF: sub_D387+32j
		mov	bx, [si+24h]
		mov	ax, [bx]
		pop	si
		pop	bp
		retf
sub_D387	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR sub_D387

loc_D3CA:				; CODE XREF: sub_D387+39j
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK	FOR sub_D387

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_D3CD	proc far		; CODE XREF: sub_D31A+17p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		jmp	short loc_D414
; ���������������������������������������������������������������������������

loc_D3D7:				; CODE XREF: sub_D3CD+4Bj
		mov	di, [si+1Eh]
		cmp	word ptr [di], 0
		jz	short loc_D3F0
		push	3
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short $+2

loc_D3F0:				; CODE XREF: sub_D3CD+10j
		mov	ax, [di+2]
		mov	[si+1Eh], ax
		push	di
		call	sub_308
		add	sp, 2
		mov	ax, [si+22h]
		dec	word ptr [si+22h]
		or	ax, ax
		jg	short loc_D414
		push	29EEh
		call	sub_310B
		add	sp, 2

loc_D414:				; CODE XREF: sub_D3CD+8j sub_D3CD+3Aj
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_D3D7
		xor	ax, ax
		mov	[si+20h], ax
		mov	[si+1Eh], ax
		mov	word ptr [si+22h], 0
		pop	di
		pop	si
		pop	bp
		retf
sub_D3CD	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		jmp	short loc_D47C
; ���������������������������������������������������������������������������

loc_D43D:				; CODE XREF: seg021:01C0j
		mov	word ptr [bp-2], 1
		mov	cx, [si+1Eh]
		mov	bx, cx
		mov	di, [bx+2]
		jmp	short loc_D478
; ���������������������������������������������������������������������������

loc_D44C:				; CODE XREF: seg021:01BAj
		mov	bx, cx
		mov	bx, [bx]
		mov	al, [bx+15h]
		and	ax, 0Fh
		mov	bx, [di]
		mov	dl, [bx+15h]
		and	dx, 0Fh
		cmp	ax, dx
		jle	short loc_D473
		mov	word ptr [bp-2], 0
		mov	bx, cx
		mov	dx, [bx]
		mov	ax, [di]
		mov	bx, cx
		mov	[bx], ax
		mov	[di], dx

loc_D473:				; CODE XREF: seg021:01A0j
		mov	cx, di
		mov	di, [di+2]

loc_D478:				; CODE XREF: seg021:018Aj
		or	di, di
		jnz	short loc_D44C

loc_D47C:				; CODE XREF: seg021:017Bj
		cmp	word ptr [bp-2], 0
		jz	short loc_D43D
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	cx, [bp+8]
		mov	di, [si+1Eh]
		jmp	short loc_D4B6
; ���������������������������������������������������������������������������

loc_D496:				; CODE XREF: seg021:01F8j
		mov	bx, [di]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, cx
		jnz	short loc_D4B3
		mov	dx, [bp+0Ah]
		mov	ax, dx
		and	ax, 0Fh
		mov	bx, [di]
		and	byte ptr [bx+15h], 0F0h
		or	[bx+15h], al

loc_D4B3:				; CODE XREF: seg021:01E0j
		mov	di, [di+2]

loc_D4B6:				; CODE XREF: seg021:01D4j
		or	di, di
		jnz	short loc_D496
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		mov	dx, [bp+8]
		mov	cx, [bp+0Ah]
		mov	di, [si+1Eh]
		jmp	short loc_D515
; ���������������������������������������������������������������������������

loc_D4D4:				; CODE XREF: seg021:0257j
		mov	bx, [di]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, dx
		jnz	short loc_D4F4
		mov	[bp-2],	cx
		mov	ax, [bp-2]
		and	ax, 0Fh
		mov	bx, [di]
		and	byte ptr [bx+15h], 0F0h
		or	[bx+15h], al
		jmp	short loc_D512
; ���������������������������������������������������������������������������

loc_D4F4:				; CODE XREF: seg021:021Ej
		mov	bx, [di]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, cx
		jnz	short loc_D512
		mov	[bp-4],	dx
		mov	ax, [bp-4]
		and	ax, 0Fh
		mov	bx, [di]
		and	byte ptr [bx+15h], 0F0h
		or	[bx+15h], al

loc_D512:				; CODE XREF: seg021:0232j seg021:023Ej
		mov	di, [di+2]

loc_D515:				; CODE XREF: seg021:0212j
		or	di, di
		jnz	short loc_D4D4
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_D51D	proc far		; CODE XREF: sub_D67E+5Dp seg021:0450p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	4
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	di, di
		jz	short loc_D556
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	word ptr [di+2], 0
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_D54A
		mov	[si+1Eh], di
		jmp	short loc_D550
; ���������������������������������������������������������������������������

loc_D54A:				; CODE XREF: sub_D51D+26j
		mov	bx, [si+20h]
		mov	[bx+2],	di

loc_D550:				; CODE XREF: sub_D51D+2Bj
		mov	[si+20h], di
		inc	word ptr [si+22h]

loc_D556:				; CODE XREF: sub_D51D+16j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
sub_D51D	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_D560	proc far		; CODE XREF: seg021:0471p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	4
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	di, di
		jz	short loc_D589
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [si+1Eh]
		mov	[di+2],	ax
		mov	[si+1Eh], di
		inc	word ptr [si+22h]

loc_D589:				; CODE XREF: sub_D560+16j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
sub_D560	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_D593	proc far		; CODE XREF: sub_D5FE+18p seg021:0447p ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	di, [si+1Eh]
		jmp	short loc_D5F0
; ���������������������������������������������������������������������������

loc_D5A8:				; CODE XREF: sub_D593+5Fj
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jnz	short loc_D5E7
		cmp	[bp+var_2], 0
		jz	short loc_D5BE
		mov	ax, [di+2]
		mov	bx, [bp+var_2]
		mov	[bx+2],	ax

loc_D5BE:				; CODE XREF: sub_D593+20j
		cmp	[si+1Eh], di
		jnz	short loc_D5C9
		mov	ax, [di+2]
		mov	[si+1Eh], ax

loc_D5C9:				; CODE XREF: sub_D593+2Ej
		cmp	[si+20h], di
		jnz	short loc_D5D4
		mov	ax, [bp+var_2]
		mov	[si+20h], ax

loc_D5D4:				; CODE XREF: sub_D593+39j
		push	di
		call	sub_308
		add	sp, 2
		dec	word ptr [si+22h]
		mov	ax, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_D5E7:				; CODE XREF: sub_D593+1Aj
		mov	[bp+var_2], di
		mov	bx, [bp+var_2]
		mov	di, [bx+2]

loc_D5F0:				; CODE XREF: sub_D593+13j
		or	di, di
		jnz	short loc_D5A8
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_D593	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_D5FE	proc far		; CODE XREF: sub_E8FD+17p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+4]
		add	sp, 2
		push	di
		push	si
		push	cs
		call	near ptr sub_D593
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_D5FE	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	dx, [bp+8]
		xor	cx, cx
		or	dx, dx
		jl	short loc_D645
		cmp	[si+22h], dx
		jle	short loc_D645
		mov	di, [si+1Eh]
		jmp	short loc_D63F
; ���������������������������������������������������������������������������

loc_D63B:				; CODE XREF: seg021:0381j
		mov	di, [di+2]
		dec	dx

loc_D63F:				; CODE XREF: seg021:0379j
		or	dx, dx
		jnz	short loc_D63B
		mov	cx, [di]

loc_D645:				; CODE XREF: seg021:036Fj seg021:0374j
		mov	ax, cx
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	cx, [bp+8]
		xor	dx, dx
		mov	di, [si+1Eh]
		jmp	short loc_D66F
; ���������������������������������������������������������������������������

loc_D661:				; CODE XREF: seg021:03B1j
		cmp	[di], cx
		jnz	short loc_D66B
		mov	ax, dx
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_D66B:				; CODE XREF: seg021:03A3j
		mov	di, [di+2]
		inc	dx

loc_D66F:				; CODE XREF: seg021:039Fj
		or	di, di
		jnz	short loc_D661
		mov	ax, 0FFFFh
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_D67E	proc far		; CODE XREF: sub_E1FF+12p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[si+26h], di
		mov	ax, [di+4]
		mov	[si+28h], ax
		mov	ax, [di+6]
		mov	[si+2Ah], ax
		mov	ax, [di+8]
		inc	ax
		mov	[si+2Ch], ax
		mov	ax, [di+0Ah]
		inc	ax
		mov	[si+2Eh], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dx, [si+1Ah]
		sub	dx, ax
		sub	dx, [si+2Ch]
		mov	[si+30h], dx
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dx, [si+1Ch]
		sub	dx, ax
		sub	dx, [si+2Eh]
		mov	[si+32h], dx
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6
		push	di
		push	si
		push	cs
		call	near ptr sub_D51D
		add	sp, 4
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_D6F5
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_D6F5:				; CODE XREF: sub_D67E+6Bj
		pop	di
		pop	si
		pop	bp
		retf
sub_D67E	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	di
		push	si
		push	cs
		call	near ptr sub_D593
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr sub_D51D
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	di
		push	si
		push	cs
		call	near ptr sub_D593
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr sub_D560
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_D73B:				; DATA XREF: dseg:070Co dseg:2A53o ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [si+1Eh]
		jmp	short loc_D75E
; ���������������������������������������������������������������������������

loc_D748:				; CODE XREF: seg021:04A0j
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6
		mov	di, [di+2]

loc_D75E:				; CODE XREF: seg021:0486j
		or	di, di
		jnz	short loc_D748
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	si
		call	Widget_TranslateBounds_F8B4
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_D775:				; DATA XREF: dseg:0704o dseg:2A4Bo ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [si+1Eh]
		jmp	short loc_D791
; ���������������������������������������������������������������������������

loc_D782:				; CODE XREF: seg021:04D3j
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		add	sp, 2
		mov	di, [di+2]

loc_D791:				; CODE XREF: seg021:04C0j
		or	di, di
		jnz	short loc_D782
		push	si
		call	Widget_SetFlagBit0_F898
		add	sp, 2
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_D7A2:				; DATA XREF: dseg:0708o dseg:2A4Fo ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [si+1Eh]
		jmp	short loc_D7BF
; ���������������������������������������������������������������������������

loc_D7AF:				; CODE XREF: seg021:0501j
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	di, [di+2]

loc_D7BF:				; CODE XREF: seg021:04EDj
		or	di, di
		jnz	short loc_D7AF
		push	si
		call	Widget_ClearFlagBit0_F8A6
		add	sp, 2
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_D7D0:				; DATA XREF: dseg:0724o dseg:2A6Bo ...
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		mov	ax, [bp+8]
		add	ax, [si+4]
		mov	[bp-4],	ax
		mov	ax, [bp+0Ah]
		add	ax, [si+6]
		mov	[bp-6],	ax
		mov	ax, [si+1Eh]
		mov	[bp-8],	ax
		jmp	short loc_D861
; ���������������������������������������������������������������������������

loc_D7FA:				; CODE XREF: seg021:05A5j
		mov	bx, [bp-8]
		mov	di, [bx]
		mov	ax, [di+4]
		cmp	ax, [bp-4]
		jg	short loc_D824
		mov	ax, [di+6]
		cmp	ax, [bp-6]
		jg	short loc_D824
		mov	ax, [di+8]
		cmp	ax, [bp-4]
		jl	short loc_D824
		mov	ax, [di+0Ah]
		cmp	ax, [bp-6]
		jl	short loc_D824
		mov	ax, 1
		jmp	short loc_D826
; ���������������������������������������������������������������������������

loc_D824:				; CODE XREF: seg021:0545j seg021:054Dj ...
		xor	ax, ax

loc_D826:				; CODE XREF: seg021:0562j
		or	ax, ax
		jz	short loc_D858
		mov	ax, [bp-4]
		sub	ax, [di+4]
		mov	[bp-0Ah], ax
		mov	ax, [bp-6]
		sub	ax, [di+6]
		mov	[bp-0Ch], ax
		push	word ptr [bp-0Ch]
		push	word ptr [bp-0Ah]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	[bp-2],	ax
		cmp	word ptr [bp-2], 0
		jnz	short loc_D858
		mov	[bp-2],	di

loc_D858:				; CODE XREF: seg021:0568j seg021:0593j
		mov	bx, [bp-8]
		mov	ax, [bx+2]
		mov	[bp-8],	ax

loc_D861:				; CODE XREF: seg021:0538j
		cmp	word ptr [bp-8], 0
		jnz	short loc_D7FA
		mov	ax, [bp-2]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_D872:				; DATA XREF: dseg:0728o dseg:2A6Fo ...
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		mov	ax, [bp+8]
		add	ax, [si+4]
		mov	cx, ax
		mov	ax, [bp+0Ah]
		add	ax, [si+6]
		mov	[bp-4],	ax
		mov	dx, [si+1Eh]
		jmp	short loc_D8C9
; ���������������������������������������������������������������������������

loc_D898:				; CODE XREF: seg021:060Bj
		mov	bx, dx
		mov	di, [bx]
		cmp	[di+4],	cx
		jg	short loc_D8BB
		mov	ax, [di+6]
		cmp	ax, [bp-4]
		jg	short loc_D8BB
		cmp	[di+8],	cx
		jl	short loc_D8BB
		mov	ax, [di+0Ah]
		cmp	ax, [bp-4]
		jl	short loc_D8BB
		mov	ax, 1
		jmp	short loc_D8BD
; ���������������������������������������������������������������������������

loc_D8BB:				; CODE XREF: seg021:05DFj seg021:05E7j ...
		xor	ax, ax

loc_D8BD:				; CODE XREF: seg021:05F9j
		or	ax, ax
		jz	short loc_D8C4
		mov	[bp-2],	di

loc_D8C4:				; CODE XREF: seg021:05FFj
		mov	bx, dx
		mov	dx, [bx+2]

loc_D8C9:				; CODE XREF: seg021:05D6j
		or	dx, dx
		jnz	short loc_D898
		mov	ax, [bp-2]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_D8D8	proc far		; CODE XREF: sub_E2B2+6Cp
					; DATA XREF: dseg:2AAFo

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_D8FF
		jmp	loc_D994
; ���������������������������������������������������������������������������

loc_D8FF:				; CODE XREF: sub_D8D8+22j
		mov	ax, [bp+arg_2]
		add	ax, [si+4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_6], ax
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_4]
		sub	ax, [bx+4]
		mov	[bp+var_8], ax
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_6]
		sub	ax, [bx+6]
		mov	[bp+var_A], ax
		cmp	byte ptr [si+34h], 0
		jz	short loc_D979
		push	0
		push	si
		push	cs
		call	near ptr sub_D387
		add	sp, 4
		mov	di, ax
		jmp	short loc_D975
; ���������������������������������������������������������������������������

loc_D93D:				; CODE XREF: sub_D8D8+9Fj
		cmp	di, [bp+var_2]
		jz	short loc_D969
		mov	al, [di+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_D969
		and	byte ptr [di+10h], 0DFh
		mov	al, [di+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_D969
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		jmp	short $+2

loc_D969:				; CODE XREF: sub_D8D8+68j sub_D8D8+75j ...
		push	1
		push	si
		push	cs
		call	near ptr sub_D387
		add	sp, 4
		mov	di, ax

loc_D975:				; CODE XREF: sub_D8D8+63j
		or	di, di
		jnz	short loc_D93D

loc_D979:				; CODE XREF: sub_D8D8+55j
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah

loc_D994:				; CODE XREF: sub_D8D8+24j
		pop	di
		pop	si
		leave
		retf
sub_D8D8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_D998	proc far		; CODE XREF: seg021:0F8Dp seg025:058CP
					; DATA XREF: ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_F859
		add	sp, 2
		mov	di, [si+1Eh]
		jmp	short loc_D9BE
; ���������������������������������������������������������������������������

loc_D9AE:				; CODE XREF: sub_D998+28j
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+1Ch]
		add	sp, 2
		mov	di, [di+2]

loc_D9BE:				; CODE XREF: sub_D998+14j
		or	di, di
		jnz	short loc_D9AE
		push	si
		call	sub_F878
		add	sp, 2
		pop	di
		pop	si
		pop	bp
		retf
sub_D998	endp

; ���������������������������������������������������������������������������

loc_D9CF:				; DATA XREF: dseg:0714o dseg:2A5Bo ...
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+6]
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	di, ax
		or	di, di
		jz	short loc_DA27
		mov	ax, [bp+8]
		add	ax, [si+4]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		add	ax, [si+6]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		sub	ax, [di+4]
		mov	[bp-6],	ax
		mov	ax, [bp-4]
		sub	ax, [di+6]
		mov	[bp-8],	ax
		push	word ptr [bp+0Ch]
		push	word ptr [bp-8]
		push	word ptr [bp-6]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+10h]
		add	sp, 8

loc_DA27:				; CODE XREF: seg021:072Ej
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_DA2B	proc far		; CODE XREF: seg021:081Dp sub_DAEB+74p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+35h], 0
		mov	byte ptr [si+4Fh], 1
		mov	word ptr [si+5Ch], 0FFFFh
		xor	ax, ax
		mov	[si+60h], ax
		mov	[si+5Eh], ax
		xor	ax, ax
		mov	[si+64h], ax
		mov	[si+62h], ax
		push	word_46F46
		mov	ax, si
		add	ax, 37h	; '7'
		push	ax
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		xor	ax, ax
		mov	[si+70h], ax
		mov	[si+6Eh], ax
		pop	si
		pop	bp
		retf
sub_DA2B	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_DA88
		push	72h ; 'r'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_DAE3

loc_DA88:				; CODE XREF: seg021:07B6j
		push	0
		push	0
		push	0FFFFh
		push	0FFFFh
		push	si
		push	cs
		call	near ptr sub_D2CC
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2A4Bh
		mov	word ptr [si+37h], 0
		mov	word ptr [si+39h], 0
		mov	byte ptr [si+44h], 0
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+54h], 2
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		push	si
		push	cs
		call	near ptr sub_DA2B
		add	sp, 2

loc_DAE3:				; CODE XREF: seg021:07C6j
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_DAEB	proc far		; CODE XREF: sub_11F61+29P
					; sub_4CF75+37EP ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_DB06
		push	72h ; 'r'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_DB65

loc_DB06:				; CODE XREF: sub_DAEB+9j
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_D2CC
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2A4Bh
		mov	word ptr [si+37h], 0
		mov	word ptr [si+39h], 0
		mov	byte ptr [si+44h], 0
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+54h], 2
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		push	si
		push	cs
		call	near ptr sub_DA2B
		add	sp, 2

loc_DB65:				; CODE XREF: sub_DAEB+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_DAEB	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jnz	short loc_DB8C
		push	72h ; 'r'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_DBF5

loc_DB8C:				; CODE XREF: seg021:08BAj
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	si
		push	cs
		call	near ptr sub_D2CC
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2A4Bh
		mov	word ptr [si+37h], 0
		mov	word ptr [si+39h], 0
		mov	byte ptr [si+44h], 0
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+54h], 2
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		push	si
		push	cs
		call	near ptr sub_DA2B
		add	sp, 2

loc_DBF5:				; CODE XREF: seg021:08CAj
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	[si+1Ah], di
		mov	ax, [bp+0Ah]
		mov	[si+1Ch], ax
		mov	ax, [si+4]
		add	ax, [si+1Ah]
		dec	ax
		mov	[si+8],	ax
		mov	ax, [si+6]
		add	ax, [si+1Ch]
		dec	ax
		mov	[si+0Ah], ax
		mov	bx, word_46F46
		mov	ax, [bx+8]
		mov	bx, word_46F46
		sub	ax, [bx+4]
		inc	ax
		sub	ax, di
		sar	ax, 1
		mov	[bp-2],	ax
		mov	bx, word_46F46
		mov	ax, [bx+0Ah]
		mov	bx, word_46F46
		sub	ax, [bx+6]
		inc	ax
		sub	ax, [bp+0Ah]
		sar	ax, 1
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[bp-6],	ax
		mov	ax, [bp-4]
		mov	[bp-8],	ax
		mov	ax, [bp-6]
		sub	ax, [si+4]
		mov	[bp-0Ah], ax
		mov	ax, [bp-8]
		sub	ax, [si+6]
		mov	[bp-0Ch], ax
		push	word ptr [bp-0Ch]
		push	word ptr [bp-0Ah]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_DC89	proc far		; CODE XREF: sub_11FFE+12FP
					; sub_4CF75+63BP ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_DC9B
		jmp	loc_DD4D
; ���������������������������������������������������������������������������

loc_DC9B:				; CODE XREF: sub_DC89+Dj
		mov	word ptr [si+0Eh], 2A4Bh
		push	si
		nop
		push	cs
		call	near ptr sub_E086
		add	sp, 2
		push	si
		nop
		push	cs
		call	near ptr sub_E1A2
		add	sp, 2
		cmp	byte ptr [si+55h], 0
		jz	short loc_DCD8
		cmp	dword ptr [si+50h], 0
		jz	short loc_DCD8
		push	0
		mov	al, [si+54h]
		push	ax
		mov	ax, si
		add	ax, 50h	; 'P'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_DCD8:				; CODE XREF: sub_DC89+2Dj sub_DC89+34j
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		cmp	byte ptr [si+4Ah], 0
		jz	short loc_DD12
		cmp	dword ptr [si+45h], 0
		jz	short loc_DD12
		push	0
		mov	al, [si+49h]
		push	ax
		mov	ax, si
		add	ax, 45h	; 'E'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_DD12:				; CODE XREF: sub_DC89+67j sub_DC89+6Ej
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	ax, si
		add	ax, 37h	; '7'
		push	ax
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		push	0
		push	si
		push	cs
		call	near ptr sub_D31A
		add	sp, 4
		test	di, 1
		jz	short loc_DD4D
		push	si
		call	sub_308
		add	sp, 2

loc_DD4D:				; CODE XREF: sub_DC89+Fj sub_DC89+B9j
		pop	di
		pop	si
		pop	bp
		retf
sub_DC89	endp

; ���������������������������������������������������������������������������

loc_DD51:				; DATA XREF: dseg:0738o dseg:2A7Fo ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		call	sub_F859
		add	sp, 2
		cmp	word ptr [si+5Ch], 0FFFFh
		jz	short loc_DD83
		mov	al, [si+5Ch]
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch

loc_DD83:				; CODE XREF: seg021:0AA5j
		cmp	word ptr [si+5Eh], 0
		jz	short loc_DD92
		push	si
		nop
		push	cs
		call	near ptr sub_E034
		add	sp, 2

loc_DD92:				; CODE XREF: seg021:0AC7j
		cmp	dword ptr [si+50h], 0
		jz	short loc_DD9E
		mov	ax, 1
		jmp	short loc_DDA0
; ���������������������������������������������������������������������������

loc_DD9E:				; CODE XREF: seg021:0AD7j
		xor	ax, ax

loc_DDA0:				; CODE XREF: seg021:0ADCj
		or	ax, ax
		jz	short loc_DDD2
		push	word ptr [si+5Ah]
		push	0
		mov	al, [si+54h]
		push	ax
		push	word ptr [si+52h]
		push	word ptr [si+50h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_46F46
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch

loc_DDD2:				; CODE XREF: seg021:0AE2j
		push	si
		call	sub_F878
		add	sp, 2
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_DDDE:				; DATA XREF: dseg:073Co dseg:2A83o ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [bp+8], 0
		jz	short loc_DDF5
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 2

loc_DDF5:				; CODE XREF: seg021:0B29j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		cmp	di, 0FFFEh
		jnz	short loc_DE1B
		push	29h ; ')'
		push	42h ; 'B'
		push	51h ; 'Q'
		call	sub_FB6B
		add	sp, 6
		mov	[si+5Ch], ax
		jmp	short loc_DE1E
; ���������������������������������������������������������������������������

loc_DE1B:				; CODE XREF: seg021:0B46j
		mov	[si+5Ch], di

loc_DE1E:				; CODE XREF: seg021:0B59j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	di, di
		jz	short loc_DE5C
		mov	ax, [bp+0Ah]
		sub	ax, [di+4]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ch]
		sub	ax, [di+6]
		mov	[bp-4],	ax
		push	word ptr [bp+10h]
		push	word ptr [bp+0Eh]
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah

loc_DE5C:				; CODE XREF: seg021:0B72j
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_DE60	proc far		; CODE XREF: seg021:0CACp sub_E034+41p

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		call	sub_F859
		add	sp, 2
		cmp	[bp+arg_C], 0
		jz	short loc_DEA1
		mov	al, byte ptr word_45B00
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_46F46
		call	Render_DrawHorizontalLineClipped_32914
		add	sp, 0Ch
		inc	di
		inc	[bp+arg_4]
		dec	[bp+arg_6]
		dec	[bp+arg_8]

loc_DEA1:				; CODE XREF: sub_DE60+1Bj
		mov	[bp+var_2], 0
		jmp	short loc_DF21
; ���������������������������������������������������������������������������

loc_DEA8:				; CODE XREF: sub_DE60+C9j
		mov	al, byte ptr word_45B04
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, [bp+arg_4]
		inc	ax
		push	ax
		push	[bp+arg_6]
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, byte ptr word_45B04
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_8]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, byte ptr word_45B0A
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		mov	al, byte ptr word_45B0A
		push	ax
		mov	ax, [bp+arg_8]
		dec	ax
		push	ax
		push	di
		push	[bp+arg_4]
		push	di
		push	word_46F46
		call	Render_FillClippedRect_326E6
		add	sp, 0Ch
		inc	di
		inc	[bp+arg_4]
		dec	[bp+arg_6]
		dec	[bp+arg_8]
		inc	[bp+var_2]

loc_DF21:				; CODE XREF: sub_DE60+46j
		mov	ax, [bp+var_2]
		cmp	ax, [bp+arg_A]
		jge	short loc_DF2C
		jmp	loc_DEA8
; ���������������������������������������������������������������������������

loc_DF2C:				; CODE XREF: sub_DE60+C7j
		mov	al, byte ptr word_45B08
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_46F46
		call	Rect_ComputeIntersection_31EEA
		add	sp, 0Ch
		push	si
		call	sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_DE60	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	1
		push	1
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	si
		push	cs
		call	near ptr sub_DE60
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		call	sub_F859
		add	sp, 2
		push	word ptr [si+5Ch]
		push	word ptr [bp+8]
		call	sub_10531
		add	sp, 4
		push	si
		call	sub_F878
		add	sp, 2
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_DF9F	proc far		; CODE XREF: sub_137FA+A2P
					; sub_4CF75+5B9P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+35h], 1
		push	si
		nop
		push	cs
		call	near ptr sub_E52D
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx]
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_DF9F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_DFCA	proc far		; CODE XREF: seg025:04F1P
					; sub_137FA+10DP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+4]
		add	sp, 2
		push	si
		nop
		push	cs
		call	near ptr sub_E77F
		add	sp, 2
		mov	word ptr [si+35h], 0
		pop	si
		pop	bp
		retf
sub_DFCA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_DFEC	proc far		; CODE XREF: GaugeWidget_AllocateRenderBufferWrapper_E0B7+1Fp

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	0Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [bp+arg_4]
		mov	[di+2],	ax
		mov	ax, [bp+arg_6]
		mov	[di+4],	ax
		mov	ax, [bp+arg_8]
		mov	[di+6],	ax
		mov	word ptr [di+8], 0
		cmp	word ptr [si+5Eh], 0
		jnz	short loc_E027
		mov	[si+5Eh], di
		jmp	short loc_E02D
; ���������������������������������������������������������������������������

loc_E027:				; CODE XREF: sub_DFEC+34j
		mov	bx, [si+60h]
		mov	[bx+8],	di

loc_E02D:				; CODE XREF: sub_DFEC+39j
		mov	[si+60h], di
		pop	di
		pop	si
		pop	bp
		retf
sub_DFEC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_E034	proc far		; CODE XREF: seg021:0ACCp

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+5Eh]
		jmp	short loc_E07E
; ���������������������������������������������������������������������������

loc_E044:				; CODE XREF: sub_E034+4Cj
		mov	ax, [di]
		mov	[bp+var_2], ax
		mov	ax, [di+2]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		add	ax, [di+4]
		dec	ax
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		add	ax, [di+6]
		dec	ax
		mov	[bp+var_8], ax
		push	1
		push	1
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_DE60
		add	sp, 0Eh
		mov	di, [di+8]

loc_E07E:				; CODE XREF: sub_E034+Ej
		or	di, di
		jnz	short loc_E044
		pop	di
		pop	si
		leave
		retf
sub_E034	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_E086	proc far		; CODE XREF: sub_DC89+1Ap

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+5Eh]
		jmp	short loc_E0A7
; ���������������������������������������������������������������������������

loc_E096:				; CODE XREF: sub_E086+23j
		mov	[bp+var_2], di
		mov	di, [di+8]
		push	[bp+var_2]
		call	sub_308
		add	sp, 2

loc_E0A7:				; CODE XREF: sub_E086+Ej
		or	di, di
		jnz	short loc_E096
		xor	ax, ax
		mov	[si+60h], ax
		mov	[si+5Eh], ax
		pop	di
		pop	si
		leave
		retf
sub_E086	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_AllocateRenderBufferWrapper_A3AB5 (sub_A3AB5 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; GaugeWidget_AllocateRenderBuffer_A39FA.
; ==============================================================================================
GaugeWidget_AllocateRenderBufferWrapper_E0B7	proc far		; CODE XREF: seg025:05EDP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ah]
		sub	ax, [si+6]
		inc	ax
		push	ax
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	si
		push	cs
		call	near ptr sub_DFEC
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateRenderBufferWrapper_E0B7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_E0DF	proc far		; CODE XREF: sub_E1FF+24p
					; sub_5DD30+237P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+62h]
		jmp	short loc_E0F8
; ���������������������������������������������������������������������������

loc_E0EC:				; CODE XREF: sub_E0DF+1Bj
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jnz	short loc_E0F5
		jmp	short loc_E0FC
; ���������������������������������������������������������������������������

loc_E0F5:				; CODE XREF: sub_E0DF+12j
		mov	di, [di+4]

loc_E0F8:				; CODE XREF: sub_E0DF+Bj
		or	di, di
		jnz	short loc_E0EC

loc_E0FC:				; CODE XREF: sub_E0DF+14j
		or	di, di
		jnz	short loc_E125
		push	6
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		mov	word ptr [di+4], 0
		cmp	word ptr [si+62h], 0
		jnz	short loc_E11C
		mov	[si+62h], di
		jmp	short loc_E122
; ���������������������������������������������������������������������������

loc_E11C:				; CODE XREF: sub_E0DF+36j
		mov	bx, [si+64h]
		mov	[bx+4],	di

loc_E122:				; CODE XREF: sub_E0DF+3Bj
		mov	[si+64h], di

loc_E125:				; CODE XREF: sub_E0DF+1Fj
		or	di, di
		jz	short loc_E134
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [bp+arg_4]
		mov	[di+2],	ax

loc_E134:				; CODE XREF: sub_E0DF+48j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
sub_E0DF	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_E13E	proc far		; CODE XREF: sub_E8FD+Ep

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	di, [si+62h]
		jmp	short loc_E19A
; ���������������������������������������������������������������������������

loc_E153:				; CODE XREF: sub_E13E+5Ej
		mov	ax, [di+2]
		cmp	ax, [bp+arg_2]
		jnz	short loc_E194
		mov	ax, [di+4]
		mov	[bp+var_4], ax
		cmp	[bp+var_2], 0
		jz	short loc_E170
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_4]
		mov	[bx+4],	ax

loc_E170:				; CODE XREF: sub_E13E+27j
		cmp	[si+64h], di
		jnz	short loc_E17B
		mov	ax, [bp+var_2]
		mov	[si+64h], ax

loc_E17B:				; CODE XREF: sub_E13E+35j
		cmp	[si+62h], di
		jnz	short loc_E186
		mov	ax, [di+4]
		mov	[si+62h], ax

loc_E186:				; CODE XREF: sub_E13E+40j
		push	di
		call	sub_308
		add	sp, 2
		mov	di, [bp+var_4]
		jmp	short loc_E19A
; ���������������������������������������������������������������������������

loc_E194:				; CODE XREF: sub_E13E+1Bj
		mov	[bp+var_2], di
		mov	di, [di+4]

loc_E19A:				; CODE XREF: sub_E13E+13j sub_E13E+54j
		or	di, di
		jnz	short loc_E153
		pop	di
		pop	si
		leave
		retf
sub_E13E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_E1A2	proc far		; CODE XREF: sub_DC89+23p

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+62h]
		jmp	short loc_E1C3
; ���������������������������������������������������������������������������

loc_E1B2:				; CODE XREF: sub_E1A2+23j
		mov	[bp+var_2], di
		mov	di, [di+4]
		push	[bp+var_2]
		call	sub_308
		add	sp, 2

loc_E1C3:				; CODE XREF: sub_E1A2+Ej
		or	di, di
		jnz	short loc_E1B2
		xor	ax, ax
		mov	[si+64h], ax
		mov	[si+62h], ax
		pop	di
		pop	si
		leave
		retf
sub_E1A2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_E1D3	proc far		; CODE XREF: sub_E2B2+10p
					; sub_E328+17Fp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [si+62h]
		jmp	short loc_E1F1
; ���������������������������������������������������������������������������

loc_E1E3:				; CODE XREF: sub_E1D3+20j
		cmp	[di], dx
		jnz	short loc_E1EE
		mov	ax, [di+2]
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_E1EE:				; CODE XREF: sub_E1D3+12j
		mov	di, [di+4]

loc_E1F1:				; CODE XREF: sub_E1D3+Ej
		or	di, di
		jnz	short loc_E1E3
		xor	ax, ax
		pop	di
		pop	si
		pop	bp
		retf
sub_E1D3	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_E1FF	proc far		; CODE XREF: seg025:070CP seg025:07B4P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_E22B
		push	di
		push	si
		push	cs
		call	near ptr sub_D67E
		add	sp, 4
		cmp	[bp+arg_4], 0
		jz	short loc_E229
		push	di
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr sub_E0DF
		add	sp, 6

loc_E229:				; CODE XREF: sub_E1FF+1Cj
		jmp	short loc_E236
; ���������������������������������������������������������������������������

loc_E22B:				; CODE XREF: sub_E1FF+Dj
		push	2A11h
		call	sub_310B
		add	sp, 2

loc_E236:				; CODE XREF: sub_E1FF:loc_E229j
		pop	di
		pop	si
		pop	bp
		retf
sub_E1FF	endp

; ���������������������������������������������������������������������������

loc_E23A:				; DATA XREF: dseg:071Co dseg:2A63o ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_D998
		add	sp, 2
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_QueryAndFormat_A3C2C (sub_A3C2C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Joystick_LoadCalibrationSample-like accessor (sub_66DA3, seg163) et
; GaugeWidget_FormatDisplayValue_A3CF6.
; ==============================================================================================
GaugeWidget_QueryAndFormat_E256	proc far		; CODE XREF: seg025:05A7P
					; sub_4CF75+1FFP ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, 0C00h
		int	21h		; DOS -	CLEAR KEYBOARD BUFFER
					; AL must be 01h, 06h, 07h, 08h, or 0Ah.

loc_E265:				; CODE XREF: GaugeWidget_QueryAndFormat_E256+22j
		push	0FFh
		push	5F5Fh
		call	Keyboard_QueryAndDispatch_3E5C7
		add	sp, 4
		cmp	byte_48F7F, 0
		jnz	short loc_E265
		push	[bp+arg_2]
		push	0FFFFh
		push	si
		nop
		push	cs
		call	near ptr sub_E328
		add	sp, 6
		mov	[bp+var_2], ax
		push	word ptr [si+6Ch]
		push	word ptr [si+6Ah]
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
GaugeWidget_QueryAndFormat_E256	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_E2B2	proc far		; CODE XREF: sub_4F1A7+CA2P
					; DATA XREF: dseg:072Co ...

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_8]
		push	si
		push	cs
		call	near ptr sub_E1D3
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_E30A
		mov	ax, [bp+arg_2]
		add	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		sub	ax, [di+4]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		sub	ax, [di+6]
		mov	[bp+var_8], ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+var_8]
		push	[bp+var_6]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah
		jmp	short loc_E324
; ���������������������������������������������������������������������������

loc_E30A:				; CODE XREF: sub_E2B2+1Aj
		cmp	[bp+arg_6], 0
		jz	short loc_E324
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_D8D8
		add	sp, 0Ah

loc_E324:				; CODE XREF: sub_E2B2+56j sub_E2B2+5Cj
		pop	di
		pop	si
		leave
		retf
sub_E2B2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_E328	proc far		; CODE XREF: GaugeWidget_QueryAndFormat_E256+2Cp
					; sub_137FA+B5P ...

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	word ptr [si+6Ch], 0
		mov	word ptr [si+6Ah], 0
		mov	[bp+var_2], 0
		push	si
		call	sub_F878
		add	sp, 2
		jmp	loc_E516
; ���������������������������������������������������������������������������

loc_E350:				; CODE XREF: sub_E328+1F8j
		push	5F58h
		call	TextScroll_FormatAndApply_3EA28
		add	sp, 2
		cmp	byte_48F78, 0
		jnz	short loc_E385
		push	5F58h
		call	sub_6DBF
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E383
		push	5F5Fh
		push	5F58h
		call	sub_6BFB
		add	sp, 4
		jmp	short $+2

loc_E383:				; CODE XREF: sub_E328+49j
		jmp	short $+2

loc_E385:				; CODE XREF: sub_E328+38j
		mov	al, byte_48F78
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E391
		jmp	loc_E47D
; ���������������������������������������������������������������������������

loc_E391:				; CODE XREF: sub_E328+64j
		mov	ax, [si+68h]
		mov	[bp+var_4], ax
		mov	ax, word_48F7A
		sar	ax, 1
		mov	[si+66h], ax
		mov	ax, word_48F7C
		mov	[si+68h], ax
		mov	ax, [si+68h]
		sub	[bp+var_4], ax
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_E3BE
		cmp	[bp+var_4], 0
		jnz	short loc_E3BE
		jmp	loc_E46B
; ���������������������������������������������������������������������������

loc_E3BE:				; CODE XREF: sub_E328+8Bj sub_E328+91j
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+20h]
		add	sp, 6
		mov	[bp+var_6], ax
		mov	ax, [bp+var_6]
		cmp	ax, [bp+var_2]
		jz	short loc_E3E6
		mov	ax, 1
		jmp	short loc_E3E8
; ���������������������������������������������������������������������������

loc_E3E6:				; CODE XREF: sub_E328+B7j
		xor	ax, ax

loc_E3E8:				; CODE XREF: sub_E328+BCj
		mov	[bp+var_8], ax
		cmp	[bp+var_2], 0
		jz	short loc_E406
		cmp	[bp+var_8], 0
		jz	short loc_E406
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+14h]
		add	sp, 2

loc_E406:				; CODE XREF: sub_E328+C7j sub_E328+CDj
		cmp	[bp+var_6], 0
		jz	short loc_E447
		push	[bp+var_8]
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+10h]
		add	sp, 8
		push	si
		call	sub_F859
		add	sp, 2
		mov	ax, [si+6Eh]
		mov	[bp+var_A], ax
		mov	ax, [bp+var_A]
		mov	word_49818, ax
		push	si
		call	sub_F878
		add	sp, 2
		jmp	short loc_E465
; ���������������������������������������������������������������������������

loc_E447:				; CODE XREF: sub_E328+E2j
		push	si
		call	sub_F859
		add	sp, 2
		mov	ax, [si+70h]
		mov	[bp+var_C], ax
		mov	ax, [bp+var_C]
		mov	word_49818, ax
		push	si
		call	sub_F878
		add	sp, 2

loc_E465:				; CODE XREF: sub_E328+11Dj
		mov	ax, [bp+var_6]
		mov	[bp+var_2], ax

loc_E46B:				; CODE XREF: sub_E328+93j
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_E47D
		mov	al, byte_48F79
		mov	ah, 0
		mov	[si+6Ah], ax

loc_E47D:				; CODE XREF: sub_E328+66j
					; sub_E328+14Bj
		mov	al, byte_48F7F
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_E4D9
		mov	ax, 0C00h
		int	21h		; DOS -	CLEAR KEYBOARD BUFFER
					; AL must be 01h, 06h, 07h, 08h, or 0Ah.
		mov	word ptr [si+6Ah], 0
		mov	al, byte_48F80
		mov	ah, 0
		mov	dx, word_45ADC
		shl	dx, 8
		or	dx, ax
		mov	[si+6Ch], dx
		push	word ptr [si+6Ch]
		push	si
		push	cs
		call	near ptr sub_E1D3
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_E4D9
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	di, ax
		or	di, di
		jnz	short loc_E4D9
		cmp	[bp+arg_4], 0
		jz	short loc_E4D9
		jmp	short loc_E523
; ���������������������������������������������������������������������������

loc_E4D9:				; CODE XREF: sub_E328+15Dj
					; sub_E328+189j ...
		or	di, di
		jnz	short loc_E50D
		mov	al, byte_48F78
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_E50D
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	di, ax
		or	di, di
		jnz	short loc_E50D
		cmp	[bp+arg_4], 0
		jz	short loc_E50D
		jmp	short loc_E523
; ���������������������������������������������������������������������������

loc_E50D:				; CODE XREF: sub_E328+1B3j
					; sub_E328+1BDj ...
		cmp	[bp+arg_2], 0FFFFh
		jz	short loc_E516
		dec	[bp+arg_2]

loc_E516:				; CODE XREF: sub_E328+25j
					; sub_E328+1E9j
		or	di, di
		jnz	short loc_E523
		cmp	[bp+arg_2], 0
		jz	short loc_E523
		jmp	loc_E350
; ���������������������������������������������������������������������������

loc_E523:				; CODE XREF: sub_E328+1AFj
					; sub_E328+1E3j ...
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_E328	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_E52D	proc far		; CODE XREF: sub_DF9F+Fp

var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_F859
		add	sp, 2
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [si+8]
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+3Bh], ax
		mov	ax, [bp+var_4]
		mov	[si+3Dh], ax
		mov	ax, [bp+var_6]
		mov	[si+3Fh], ax
		mov	ax, [bp+var_8]
		mov	[si+41h], ax
		mov	ax, [si+3Fh]
		sub	ax, [si+3Bh]
		inc	ax
		mov	dx, [si+41h]
		sub	dx, [si+3Dh]
		inc	dx
		imul	dx
		mov	di, ax
		push	0
		push	2
		push	661Ah
		call	Memory_TypedAllocDispatchC_2B95B
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[bp+var_C], eax
		push	0
		push	3
		push	661Ah
		call	Memory_TypedAllocDispatchC_2B95B
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[bp+var_10], eax
		cmp	byte ptr [si+4Fh], 3
		jnz	short loc_E5CF
		movzx	eax, di
		cmp	eax, [bp+var_C]
		jle	short loc_E5CF
		mov	byte ptr [si+4Fh], 2

loc_E5CF:				; CODE XREF: sub_E52D+92j sub_E52D+9Cj
		cmp	byte ptr [si+4Fh], 4
		jnz	short loc_E5E3
		movzx	eax, di
		cmp	eax, [bp+var_10]
		jle	short loc_E5E3
		mov	byte ptr [si+4Fh], 2

loc_E5E3:				; CODE XREF: sub_E52D+A6j sub_E52D+B0j
		cmp	byte ptr [si+4Fh], 1
		jnz	short loc_E5FD
		movzx	eax, di
		cmp	eax, [bp+var_10]
		jle	short loc_E5F9
		mov	byte ptr [si+4Fh], 2
		jmp	short loc_E5FD
; ���������������������������������������������������������������������������

loc_E5F9:				; CODE XREF: sub_E52D+C4j
		mov	byte ptr [si+4Fh], 4

loc_E5FD:				; CODE XREF: sub_E52D+BAj sub_E52D+CAj
		mov	al, [si+4Fh]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4		; switch 5 cases
		jbe	short loc_E60C
		jmp	loc_E766	; default
; ���������������������������������������������������������������������������

loc_E60C:				; CODE XREF: sub_E52D+DAj
		shl	bx, 1
		jmp	cs:off_E775[bx]	; switch jump

loc_E613:				; DATA XREF: seg021:off_E775o
		movzx	eax, di		; case 0x3
		mov	[bp+var_14], eax
		push	1
		push	0
		push	2
		push	large [bp+var_14]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2],	dx
		mov	word ptr [bp+var_18], ax
		mov	eax, [bp+var_18]
		mov	[si+45h], eax
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 1
		mov	dword ptr [si+4Bh], 0
		mov	eax, [bp+var_14]
		mov	[si+4Bh], eax
		push	0
		mov	al, [si+49h]
		push	ax
		push	word ptr [si+47h]
		push	word ptr [si+45h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_E6AC
		mov	ax, si
		add	ax, 37h	; '7'
		jz	short loc_E67F
		mov	ax, si
		add	ax, 3Bh	; ';'
		jmp	short loc_E684
; ���������������������������������������������������������������������������

loc_E67F:				; CODE XREF: sub_E52D+149j
		mov	ax, si
		add	ax, 37h	; '7'

loc_E684:				; CODE XREF: sub_E52D+150j
		push	ax
		push	0
		mov	al, [si+49h]
		push	ax
		push	word ptr [si+47h]
		push	word ptr [si+45h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_46F46
		call	Render_BlitClippedRegionVariant_33ABC
		add	sp, 8
		jmp	short loc_E6B0
; ���������������������������������������������������������������������������

loc_E6AC:				; CODE XREF: sub_E52D+142j
		mov	byte ptr [si+4Fh], 0

loc_E6B0:				; CODE XREF: sub_E52D+17Dj
		jmp	loc_E768
; ���������������������������������������������������������������������������

loc_E6B3:				; CODE XREF: sub_E52D+E1j
					; DATA XREF: seg021:off_E775o
		movzx	eax, di		; case 0x4
		mov	[bp+var_1C], eax
		push	1
		push	0
		push	3
		push	large [bp+var_1C]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2],	dx
		mov	word ptr [bp+var_20], ax
		mov	eax, [bp+var_20]
		mov	[si+45h], eax
		mov	byte ptr [si+49h], 3
		mov	byte ptr [si+4Ah], 1
		mov	dword ptr [si+4Bh], 0
		mov	eax, [bp+var_1C]
		mov	[si+4Bh], eax
		push	0
		mov	al, [si+49h]
		push	ax
		push	word ptr [si+47h]
		push	word ptr [si+45h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_E74C
		mov	ax, si
		add	ax, 37h	; '7'
		jz	short loc_E71F
		mov	ax, si
		add	ax, 3Bh	; ';'
		jmp	short loc_E724
; ���������������������������������������������������������������������������

loc_E71F:				; CODE XREF: sub_E52D+1E9j
		mov	ax, si
		add	ax, 37h	; '7'

loc_E724:				; CODE XREF: sub_E52D+1F0j
		push	ax
		push	0
		mov	al, [si+49h]
		push	ax
		push	word ptr [si+47h]
		push	word ptr [si+45h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_46F46
		call	Render_BlitClippedRegionVariant_33ABC
		add	sp, 8
		jmp	short loc_E750
; ���������������������������������������������������������������������������

loc_E74C:				; CODE XREF: sub_E52D+1E2j
		mov	byte ptr [si+4Fh], 0

loc_E750:				; CODE XREF: sub_E52D+21Dj
		jmp	short loc_E768
; ���������������������������������������������������������������������������

loc_E752:				; CODE XREF: sub_E52D+E1j
					; DATA XREF: seg021:off_E775o
		push	si		; case 0x2
		push	2A33h
		mov	ax, si
		add	ax, 37h	; '7'
		push	ax
		call	sub_426B0
		add	sp, 6
		jmp	short loc_E768
; ���������������������������������������������������������������������������

loc_E766:				; CODE XREF: sub_E52D+DCj sub_E52D+E1j
					; DATA XREF: ...
		jmp	short $+2	; default

loc_E768:				; CODE XREF: sub_E52D:loc_E6B0j
					; sub_E52D:loc_E750j ...
		push	si
		call	sub_F878
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_E52D	endp

; ���������������������������������������������������������������������������
off_E775	dw offset loc_E766	; DATA XREF: sub_E52D+E1r
		dw offset loc_E766	; jump table for switch	statement
		dw offset loc_E752
		dw offset loc_E613
		dw offset loc_E6B3

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_E77F	proc far		; CODE XREF: sub_DFCA+14p

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_F859
		add	sp, 2
		mov	al, [si+4Fh]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4		; switch 5 cases
		jbe	short loc_E7A1
		jmp	loc_E8D5	; default
; ���������������������������������������������������������������������������

loc_E7A1:				; CODE XREF: sub_E77F+1Dj
		shl	bx, 1
		jmp	cs:off_E8F3[bx]	; switch jump

loc_E7A8:				; DATA XREF: seg021:off_E8F3o
		push	0		; case 0x3
		mov	al, [si+49h]
		push	ax
		push	word ptr [si+47h]
		push	word ptr [si+45h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_E836
		mov	ax, si
		add	ax, 37h	; '7'
		jz	short loc_E7D1
		mov	ax, si
		add	ax, 3Bh	; ';'
		jmp	short loc_E7D6
; ���������������������������������������������������������������������������

loc_E7D1:				; CODE XREF: sub_E77F+49j
		mov	ax, si
		add	ax, 37h	; '7'

loc_E7D6:				; CODE XREF: sub_E77F+50j
		push	ax
		push	0
		mov	al, [si+49h]
		push	ax
		push	word ptr [si+47h]
		push	word ptr [si+45h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_46F46
		call	Render_BlitClippedRegion_334A0
		add	sp, 8
		cmp	byte ptr [si+4Ah], 0
		jz	short loc_E822
		cmp	dword ptr [si+45h], 0
		jz	short loc_E822
		push	0
		mov	al, [si+49h]
		push	ax
		mov	ax, si
		add	ax, 45h	; 'E'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_E822:				; CODE XREF: sub_E77F+81j sub_E77F+88j
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0

loc_E836:				; CODE XREF: sub_E77F+42j
		jmp	loc_E8E7
; ���������������������������������������������������������������������������

loc_E839:				; CODE XREF: sub_E77F+24j
					; DATA XREF: seg021:off_E8F3o
		push	0		; case 0x4
		mov	al, [si+49h]
		push	ax
		push	word ptr [si+47h]
		push	word ptr [si+45h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_E8BD
		mov	ax, si
		add	ax, 37h	; '7'
		jz	short loc_E86B
		mov	ax, si
		add	ax, 3Bh	; ';'
		jmp	short loc_E870
; ���������������������������������������������������������������������������

loc_E86B:				; CODE XREF: sub_E77F+E3j
		mov	ax, si
		add	ax, 37h	; '7'

loc_E870:				; CODE XREF: sub_E77F+EAj
		push	ax
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	word_46F46
		call	Render_BlitClippedRegion_334A0
		add	sp, 8
		cmp	byte ptr [si+4Ah], 0
		jz	short loc_E8A9
		cmp	dword ptr [si+45h], 0
		jz	short loc_E8A9
		push	0
		mov	al, [si+49h]
		push	ax
		mov	ax, si
		add	ax, 45h	; 'E'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_E8A9:				; CODE XREF: sub_E77F+108j
					; sub_E77F+10Fj
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0

loc_E8BD:				; CODE XREF: sub_E77F+DCj
		jmp	short loc_E8E7
; ���������������������������������������������������������������������������

loc_E8BF:				; CODE XREF: sub_E77F+24j
					; DATA XREF: seg021:off_E8F3o
		push	si		; case 0x2
		push	2A3Fh
		mov	ax, si
		add	ax, 37h	; '7'
		push	ax
		call	sub_426B5
		add	sp, 6
		jmp	short loc_E8E7
; ���������������������������������������������������������������������������

loc_E8D3:				; CODE XREF: sub_E77F+24j
					; DATA XREF: seg021:off_E8F3o
		jmp	short loc_E8E7	; case 0x0
; ���������������������������������������������������������������������������

loc_E8D5:				; CODE XREF: sub_E77F+1Fj sub_E77F+24j
					; DATA XREF: ...
		mov	al, [si+5Ch]	; default
		push	ax
		mov	ax, si
		add	ax, 37h	; '7'
		push	ax
		call	Rect_FillRegion_31F7C
		add	sp, 4

loc_E8E7:				; CODE XREF: sub_E77F:loc_E836j
					; sub_E77F:loc_E8BDj ...
		push	si
		call	sub_F878
		add	sp, 2
		pop	si
		leave
		retf
sub_E77F	endp

; ���������������������������������������������������������������������������
off_E8F3	dw offset loc_E8D3	; DATA XREF: sub_E77F+24r
		dw offset loc_E8D5	; jump table for switch	statement
		dw offset loc_E8BF
		dw offset loc_E7A8
		dw offset loc_E839

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_E8FD	proc far		; CODE XREF: seg021:1690p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr sub_E13E
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr sub_D5FE
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_E8FD	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		cmp	word ptr [bp+0Ah], 0
		jz	short loc_E94D
		push	si
		call	sub_F859
		add	sp, 2
		push	word ptr [si+5Ch]
		push	di
		call	sub_10531
		add	sp, 4
		push	si
		call	sub_F878
		add	sp, 2

loc_E94D:				; CODE XREF: seg021:166Dj
		push	di
		push	si
		push	cs
		call	near ptr sub_E8FD
		add	sp, 4
		or	di, di
		jz	short loc_E968
		push	3
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short $+2

loc_E968:				; CODE XREF: seg021:1698j
		pop	di
		pop	si
		pop	bp
		retf
seg021		ends
