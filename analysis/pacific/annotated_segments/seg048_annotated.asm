seg048		segment	para public 'CODE' use16
		assume cs:seg048
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DEA3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	cx, [bp+arg_0]
		mov	bx, [bp+arg_2]
		sar	bx, 4
		mov	ah, 43h
		int	67h
		or	ah, ah
		jz	short loc_1DEC0
		push	0EEE1h
		call	sub_1DDFE
		pop	cx

loc_1DEC0:
		mov	ax, dx
		pop	bp
		retf
sub_1DEA3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DEC4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	ah, 45h
		int	67h
		pop	bp
		retf
sub_1DEC4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DED3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	cx, [bp+arg_0]
		mov	dx, [bp+arg_2]
		xor	bx, bx
		mov	ax, 4400h
		int	67h
		pop	bp
		retf
sub_1DED3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DEE5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, 4143h
		mov	ax, 1209h
		int	15h
		or	ax, ax
		jnz	short loc_1DEFD
		cmp	bx, 1209h
		jz	short loc_1DF06

loc_1DEFD:
		push	0EEEEh
		call	sub_1DDFE
		pop	cx

loc_1DF06:
		pop	bp
		retf
sub_1DEE5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DF08		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		pushf
		mov	bx, 534Dh
		mov	ax, 1209h
		int	15h
		popf
		mov	ax, bx
		pop	bp
		retf
sub_1DF08		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DF1C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		pushf
		mov	bx, 736Dh
		mov	ax, 1209h
		int	15h
		popf
		pop	bp
		retf
sub_1DF1C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DF2E		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	cl, [bp+arg_2]
		mov	ch, [bp+arg_4]
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		pop	si
		pop	bp
		retf
sub_1DF2E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DF48		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+15h], 0
		jz	short loc_1DF65
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_1DF2E
		add	sp, 6
		jmp	short loc_1DF76

loc_1DF65:
		mov	dx, 1
		mov	cl, byte ptr [bp+arg_2]
		mov	ch, byte ptr [bp+arg_4]
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h

loc_1DF76:
		pop	si
		pop	bp
		retf
sub_1DF48		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DF79		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [si+13h]
		mov	cx, [bp+arg_2]
		mov	bx, 4D55h
		mov	ax, 1209h
		int	15h
		or	ax, ax
		jz	short loc_1DF9B
		push	0EEE2h
		call	sub_1DDFE
		pop	cx

loc_1DF9B:
		pop	si
		pop	bp
		retf
sub_1DF79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DF9E		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_1DEE5
		pop	cx
		push	si
		push	cs
		call	near ptr sub_1DF08
		pop	cx
		mov	[bp+var_2], ax
		push	80h
		push	si
		push	cs
		call	near ptr sub_1DEA3
		add	sp, 4
		mov	[si+13h], ax
		push	word ptr [si+13h]
		push	si
		push	cs
		call	near ptr sub_1DED3
		add	sp, 4
		push	0FFFFh
		push	si
		push	cs
		call	near ptr sub_1DF79
		add	sp, 4
		cmp	byte ptr [si+10h], 2
		jnz	short loc_1DFED
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_1E034
		add	sp, 4
		jmp	short loc_1DFED

loc_1DFED:
		cmp	[bp+var_2], 0
		jnz	short loc_1DFF9
		push	si
		push	cs
		call	near ptr sub_1DF1C
		pop	cx

loc_1DFF9:
		pop	si
		leave
		retf
sub_1DF9E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DFFC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+11h], 0FFFFh
		jz	short loc_1E031
		cmp	byte ptr [si+10h], 2
		jnz	short loc_1E01C
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_1E034
		add	sp, 4
		jmp	short loc_1E01C

loc_1E01C:
		push	word ptr [si+13h]
		push	si
		push	cs
		call	near ptr sub_1DEC4
		add	sp, 4
		mov	word ptr [si+11h], 0FFFFh
		mov	word ptr [si+13h], 0FFFFh

loc_1E031:
		pop	si
		pop	bp
		retf
sub_1DFFC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E034		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	byte ptr [si+10h], 2
		jnz	short loc_1E051
		push	di
		push	si
		push	cs
		call	near ptr sub_1DF79
		add	sp, 4
		mov	[si+11h], di

loc_1E051:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E034		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E055		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+10h], 1
		jnz	short loc_1E074
		push	word ptr [si]
		mov	ax, si
		add	ax, 2
		push	ax
		call	UI_ApplyEncodingHelper_67EE7

loc_1E06F:
		add	sp, 4
		jmp	short loc_1E0A0

loc_1E074:
		cmp	byte ptr [si+10h], 2
		jnz	short loc_1E0A0
		cmp	word ptr [si+11h], 0
		jz	short loc_1E0A0
		push	0
		push	word ptr [si+11h]
		push	si
		push	cs
		call	near ptr sub_1DF48
		add	sp, 6
		cmp	word ptr [si+11h], 1
		jnz	short loc_1E097
		push	2
		jmp	short loc_1E099

loc_1E097:
		push	1

loc_1E099:
		push	si
		push	cs
		call	near ptr sub_1E034
		jmp	short loc_1E06F

loc_1E0A0:
		pop	si
		pop	bp
		retf
sub_1E055		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E0A3		proc far
		push	bp
		mov	bp, sp
		mov	word_7C9E2, 0
		mov	word_7C9E4, 0
		mov	byte_7C9EF, 0
		pop	bp
		retf
sub_1E0A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E0B9		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7C9F0, 1
		jnz	short loc_1E0CE
		push	62B2h
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		jmp	short loc_1E0CE

loc_1E0CE:
		cmp	byte_7C9F0, 2
		jnz	short loc_1E0DF
		push	62B0h
		push	cs
		call	near ptr sub_1DFFC
		pop	cx
		jmp	short loc_1E0DF
sub_1E0B9		endp

; START OF FUNCTION CHUNK FOR sub_1E0B9

loc_1E0DF:
		db 68h
; END OF FUNCTION CHUNK FOR sub_1E0B9
seg048		ends
