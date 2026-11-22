seg101		segment	para public 'CODE' use16
		assume cs:seg101
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh, 8Bh, 0DCh, 36h, 83h, 47h, 4, 0FCh, 90h, 90h, 0E9h, 92h, 0FFh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4447E		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_4447E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44483		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_444D7
		cmp	[bp+arg_8], 0
		jz	short loc_444D7
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		cmp	al, 3
		jnz	short loc_444D7
		push	cs
		call	near ptr sub_4447E
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_444D7:
		cmp	[bp+var_4], 0
		jnz	short loc_4451B
		cmp	[bp+arg_8], 0
		jz	short loc_44515
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		pop	cx
		push	dx
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		push	ax
		push	si
		nop
		push	cs
		call	sub_44669
		add	sp, 0Ch
		push	3D8Ch
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_59C00
		add	sp, 4
		jmp	short loc_4451B

loc_44515:
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_44521

loc_4451B:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_44521:
		pop	si
		leave
		retf
sub_44483		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44524		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_44578
		cmp	[bp+arg_8], 0
		jz	short loc_44578
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		cmp	al, 3
		jnz	short loc_44578
		push	cs
		call	near ptr sub_4447E
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_44578:
		cmp	[bp+var_4], 0
		jnz	short loc_445BC
		cmp	[bp+arg_8], 0
		jz	short loc_445B6
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		pop	cx
		push	dx
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		push	ax
		push	si
		nop
		push	cs
		call	sub_44669
		add	sp, 0Ch
		push	[bp+arg_A]
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_59C05
		add	sp, 4
		jmp	short loc_445BC

loc_445B6:
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_445C2

loc_445BC:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_445C2:
		pop	si
		leave
		retf
sub_44524		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_445C5		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_44619
		cmp	[bp+arg_8], 0
		jz	short loc_44619
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		cmp	al, 3
		jnz	short loc_44619
		push	cs
		call	near ptr sub_4447E
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_44619:
		cmp	[bp+var_4], 0
		jnz	short loc_44660
		cmp	[bp+arg_8], 0
		jz	short loc_4465A
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		pop	cx
		push	dx
		push	ax
		push	large [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		push	ax
		push	si
		nop
		push	cs
		call	sub_44669
		add	sp, 0Ch
		push	[bp+arg_A]
		push	3D8Eh
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_59C00
		add	sp, 6
		jmp	short loc_44660

loc_4465A:
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_44666

loc_44660:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_44666:
		pop	si
		leave
		retf
sub_445C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44669		proc near

var_4		= word ptr -4
var_2		= word ptr -2
arg_2		= word ptr  6
arg_4		= byte ptr  8
arg_6		= dword ptr  0Ah
arg_A		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_2]
		mov	[bp+var_4], 0
		mov	[bp+var_2], 0
		cmp	[bp+arg_4], 1
		jnz	short loc_4469F
		push	3D93h
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_59B3F
		add	sp, 4
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		push	3DA3h
		jmp	short loc_446E1

loc_4469F:
		cmp	[bp+arg_4], 2
		jnz	short loc_446C1
		push	3DC2h
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_59B3F
		add	sp, 4
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		push	3DD2h
		jmp	short loc_446E1

loc_446C1:
		cmp	[bp+arg_4], 3
		jnz	short loc_446FE
		push	3DF0h
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_59B3F
		add	sp, 4
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		push	3E00h

loc_446E1:
		lea	ax, [bp+var_4]
		push	ax
		call	sub_59B44
		add	sp, 6
		push	[bp+var_4]
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_59B3F
		add	sp, 4

loc_446FE:
		push	large [bp+arg_A]
		push	large [bp+arg_6]
		push	3E1Eh
		lea	ax, [bp+var_4]
		push	ax
		call	sub_59B44
		add	sp, 0Ch
		push	[bp+var_4]
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_59B3F
		add	sp, 4
		lea	ax, [bp+var_4]
		push	ax
		call	sub_59B75
		pop	cx
sub_44669		endp
seg101		ends
