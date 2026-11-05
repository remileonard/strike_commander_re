seg103		segment	para public 'CODE' use16
		assume cs:seg103
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C2h, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_414D4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0EEh], 0
		jz	short loc_41519
		cmp	word_7977C, 0
		jz	short loc_41519
		mov	al, es:[bx+0EEh]
		mov	ah, 0
		mov	bx, 0Ah
		cwd
		idiv	bx
		inc	ax
		push	ax
		mov	bx, [bp+arg_0]
		push	word ptr es:[bx+0ECh]
		push	word ptr es:[bx+0ECh]
		mov	bx, es:[bx+0ECh]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		push	dx
		push	ax
		call	sub_370D5
		add	sp, 8

loc_41519:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0EEh], 0
		pop	bp
		retf
sub_414D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41524		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	cx, cx
		xor	dx, dx
		jmp	short loc_4153E

loc_4152D:
		mov	al, dl
		mov	ah, 0
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		add	cx, ax
		inc	dx

loc_4153E:
		cmp	dx, 3Bh
		jl	short loc_4152D
		mov	ax, cx
		pop	bp
		retf
sub_41524		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41547		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	cx, cx
		xor	dx, dx
		jmp	short loc_41562

loc_41550:
		mov	al, dl
		mov	ah, 0
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	al, es:[bx+3Bh]
		mov	ah, 0
		add	cx, ax
		inc	dx

loc_41562:
		cmp	dx, 3Bh
		jl	short loc_41550
		mov	ax, cx
		pop	bp
		retf
sub_41547		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4156B		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	cx, [bp+arg_4]
		cmp	cl, 3Bh
		jnb	short loc_41591
		mov	al, cl
		mov	ah, 0
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	al, es:[bx]
		mov	dl, cl
		mov	dh, 0
		mov	bx, [bp+arg_0]
		add	bx, dx
		sub	al, es:[bx+3Bh]
		jmp	short loc_41593

loc_41591:
		mov	al, 0

loc_41593:
		pop	bp
		retf
sub_4156B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41595		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	cx, [bp+arg_4]
		mov	dl, 64h
		cmp	cl, 3Bh
		jnb	short loc_415C9
		mov	al, cl
		mov	ah, 0
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	al, es:[bx+3Bh]
		mov	ah, 0
		imul	ax, ax, 64h
		mov	dl, cl
		mov	dh, 0
		mov	bx, [bp+arg_0]
		add	bx, dx
		mov	dl, es:[bx]
		mov	dh, 0
		push	dx
		cwd
		pop	bx
		idiv	bx
		mov	dl, al

loc_415C9:
		mov	al, dl
		pop	bp
		retf
sub_41595		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_415CD		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	4
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_41595
		add	sp, 6
		mov	ah, 0
		push	ax
		push	3
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_41595
		add	sp, 6
		mov	ah, 0
		pop	bx
		add	bx, ax
		push	bx
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_41595
		add	sp, 6
		mov	ah, 0
		pop	bx
		add	bx, ax
		cmp	bx, 0FFh
		jle	short loc_4160E
		mov	bx, 0FFh

loc_4160E:
		mov	al, bl
		pop	bp
		retf
sub_415CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41612		proc far

var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_1], 0
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_41595
		add	sp, 6
		cmp	al, 1Eh
		ja	short loc_4164F
		push	4
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_41595
		add	sp, 6
		cmp	al, 32h
		ja	short loc_4164F
		push	3
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_41595
		add	sp, 6
		cmp	al, 32h
		jbe	short loc_41653

loc_4164F:
		mov	[bp+var_1], 1

loc_41653:
		mov	al, [bp+var_1]
		leave
		retf
sub_41612		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41658		proc far

var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_1], 0
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_41595
		add	sp, 6
		cmp	al, 5Ah
		ja	short loc_41695
		push	4
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_41595
		add	sp, 6
		cmp	al, 5Ah
		ja	short loc_41695
		push	3
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_41595
sub_41658		endp

; START OF FUNCTION CHUNK FOR sub_41658
		db 83h, 0C4h
; END OF FUNCTION CHUNK FOR sub_41658
seg103		ends
