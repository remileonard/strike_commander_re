seg008		segment	para public 'CODE' use16
		assume cs:seg008
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 3, 0DCh, 2, 28h, 3, 0AEh, 2, 28h, 3, 8Fh, 2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57CB		proc far

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
		jz	short loc_57E8
		push	0EEE1h
		call	sub_9D47
		pop	cx

loc_57E8:
		mov	ax, dx
		pop	bp
		retf
sub_57CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57EC		proc far

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
sub_57EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57FB		proc far

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
sub_57FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_580D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	bx, 4143h
		mov	ax, 1209h
		int	15h
		or	ax, ax
		jnz	short loc_5825
		cmp	bx, 1209h
		jz	short loc_582E

loc_5825:
		push	0EEEEh
		call	sub_9D47
		pop	cx

loc_582E:
		pop	bp
		retf
sub_580D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5830		proc far

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
sub_5830		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5844		proc far

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
sub_5844		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5856		proc far

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
sub_5856		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5870		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+15h], 0
		jz	short loc_588D
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_5856
		add	sp, 6
		jmp	short loc_589E

loc_588D:
		mov	dx, 1
		mov	cl, byte ptr [bp+arg_2]
		mov	ch, byte ptr [bp+arg_4]
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h

loc_589E:
		pop	si
		pop	bp
		retf
sub_5870		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_58A1		proc far

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
		jz	short loc_58C3
		push	0EEE2h
		call	sub_9D47
		pop	cx

loc_58C3:
		pop	si
		pop	bp
		retf
sub_58A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_58C6		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_580D
		pop	cx
		push	si
		push	cs
		call	near ptr sub_5830
		pop	cx
		mov	[bp+var_2], ax
		push	80h
		push	si
		push	cs
		call	near ptr sub_57CB
		add	sp, 4
		mov	[si+13h], ax
		push	word ptr [si+13h]
		push	si
		push	cs
		call	near ptr sub_57FB
		add	sp, 4
		push	0FFFFh
		push	si
		push	cs
		call	near ptr sub_58A1
		add	sp, 4
		cmp	byte ptr [si+10h], 2
		jnz	short loc_5915
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_595C
		add	sp, 4
		jmp	short loc_5915

loc_5915:
		cmp	[bp+var_2], 0
		jnz	short loc_5921
		push	si
		push	cs
		call	near ptr sub_5844
		pop	cx

loc_5921:
		pop	si
		leave
		retf
sub_58C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5924		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+11h], 0FFFFh
		jz	short loc_5959
		cmp	byte ptr [si+10h], 2
		jnz	short loc_5944
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_595C
		add	sp, 4
		jmp	short loc_5944

loc_5944:
		push	word ptr [si+13h]
		push	si
		push	cs
		call	near ptr sub_57EC
		add	sp, 4
		mov	word ptr [si+11h], 0FFFFh
		mov	word ptr [si+13h], 0FFFFh

loc_5959:
		pop	si
		pop	bp
		retf
sub_5924		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_595C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	byte ptr [si+10h], 2
		jnz	short loc_5979
		push	di
		push	si
		push	cs
		call	near ptr sub_58A1
		add	sp, 4
		mov	[si+11h], di

loc_5979:
		pop	di
		pop	si
		pop	bp
		retf
sub_595C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_597D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+10h], 1
		jnz	short loc_599C
		push	word ptr [si]
		mov	ax, si
		add	ax, 2
		push	ax
		call	UI_ApplyEncodingHelper_47B1D

loc_5997:
		add	sp, 4
		jmp	short loc_59C8

loc_599C:
		cmp	byte ptr [si+10h], 2
		jnz	short loc_59C8
		cmp	word ptr [si+11h], 0
		jz	short loc_59C8
		push	0
		push	word ptr [si+11h]
		push	si
		push	cs
		call	near ptr sub_5870
		add	sp, 6
		cmp	word ptr [si+11h], 1
		jnz	short loc_59BF
		push	2
		jmp	short loc_59C1

loc_59BF:
		push	1

loc_59C1:
		push	si
		push	cs
		call	near ptr sub_595C
		jmp	short loc_5997

loc_59C8:
		pop	si
		pop	bp
		retf
sub_597D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59CB		proc far
		push	bp
		mov	bp, sp
		mov	word_5F544, 0
		mov	word_5F546, 0
		mov	byte_5F551, 0
		pop	bp
		retf
sub_59CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59E1		proc far
		push	bp
		mov	bp, sp
		cmp	byte_5F552, 1
		jnz	short loc_59F6
		push	5824h
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		jmp	short loc_59F6

loc_59F6:
		cmp	byte_5F552, 2
		jnz	short loc_5A07
		push	5822h
		push	cs
		call	near ptr sub_5924
		pop	cx
		jmp	short loc_5A07

loc_5A07:
		push	5824h
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
sub_59E1		endp
seg008		ends
