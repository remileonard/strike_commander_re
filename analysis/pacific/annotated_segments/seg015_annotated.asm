seg015		segment	para public 'CODE' use16
		assume cs:seg015
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9390		proc far
		enter	2, 0
		call	sub_72F23
		leave
		retf
sub_9390		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_939B		proc far

arg_0		= word ptr  6

		enter	0, 0
		push	cs
		call	near ptr sub_9390
		cmp	ax, seg stub235
		jnz	short loc_93B0
		mov	dx, seg stub235
		mov	ax, [bp+arg_0]
		jmp	short loc_93C0

loc_93B0:
		mov	ax, seg stub235
		mov	es, ax
		mov	bx, [bp+arg_0]
		mov	ax, es:[bx+1]
		mov	dx, es:[bx+3]

loc_93C0:
		leave
		retf
sub_939B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_93C2		proc far
		enter	2, 0
		push	cs
		call	near ptr sub_9390
		cmp	ax, seg stub235
		jnz	short loc_93D6
		mov	ax, 43h
		xor	dx, dx
		jmp	short loc_93E4

loc_93D6:
		mov	ax, seg stub235
		mov	es, ax
		mov	bx, 43h
		mov	ax, es:[bx+1]
		xor	dx, dx

loc_93E4:
		leave
		retf
sub_93C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_93E6		proc far

arg_0		= dword ptr  6

		enter	0, 0
		push	cs
		call	near ptr sub_93C2
		push	dx
		push	ax
		mov	ax, 43h
		push	ax
		push	cs
		call	near ptr sub_939B
		pop	cx
		push	dx
		push	0
		push	large [bp+arg_0]
sub_93E6		endp
seg015		ends
