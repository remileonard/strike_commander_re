seg102		segment	para public 'CODE' use16
		assume cs:seg102
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32D80		proc far

var_1		= byte ptr -1
arg_0		= byte ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, word_4D292
		or	si, si
		jnz	short loc_32D93
		jmp	loc_32EA3

loc_32D93:
		cmp	byte_4D297, 0
		jnz	short loc_32D9D
		jmp	loc_32E9B

loc_32D9D:
		jmp	loc_32EA3
		mov	[bp+var_1], 1
		cmp	word ptr [si+2], 0
		jz	short loc_32DC3
		mov	bx, [si+2]
		mov	di, [bx]
		and	di, 0FFFEh
		add	di, [si+2]
		cmp	di, si
		jnz	short loc_32DBE
		mov	ax, 1
		jmp	short loc_32DC0

loc_32DBE:
		xor	ax, ax

loc_32DC0:
		mov	[bp+var_1], al

loc_32DC3:
		cmp	[bp+var_1], 0
		jz	short loc_32DE3
		mov	ax, [si]
		and	ax, 0FFFEh
		mov	di, si
		add	di, ax
		cmp	[di+2], si
		jnz	short loc_32DDC
		mov	ax, 1
		jmp	short loc_32DDE

loc_32DDC:
		xor	ax, ax

loc_32DDE:
		mov	[bp+var_1], al
		jmp	short loc_32DF5

loc_32DE3:
		mov	byte_4D299, 0
		inc	byte_4D297
		push	1307h
		call	sub_13451
		pop	cx

loc_32DF5:
		cmp	[bp+var_1], 0
		jz	short loc_32E1D
		test	word ptr [si], 1
		jnz	short loc_32E1D
		mov	bx, [si+4]
		cmp	[bx+6], si
		jnz	short loc_32E16
		mov	bx, [si+6]
		cmp	[bx+4], si
		jnz	short loc_32E16
		mov	ax, 1
		jmp	short loc_32E18

loc_32E16:
		xor	ax, ax

loc_32E18:
		mov	[bp+var_1], al
		jmp	short loc_32E38

loc_32E1D:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_32E38
		inc	byte_4D297
		mov	byte_4D299, 0
		push	1307h
		call	sub_13451
		pop	cx

loc_32E38:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_32E53
		inc	byte_4D297
		mov	byte_4D299, 0
		push	1307h
		call	sub_13451
		pop	cx

loc_32E53:
		mov	dl, [si]
		and	dl, 1
		cmp	[bp+arg_0], 0
		jz	short loc_32E66
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jz	short loc_32E75

loc_32E66:
		cmp	[bp+arg_0], 0
		jz	short loc_32E94
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_32E94

loc_32E75:
		mov	ax, [si]
		and	ax, 0FFFEh
		push	ax
		push	si
		or	dl, dl
		jz	short loc_32E85
		mov	ax, 48A1h
		jmp	short loc_32E88

loc_32E85:
		mov	ax, 48ABh

loc_32E88:
		push	ax
		push	4880h
		call	CRT_Msg_NullPtrAssign
		add	sp, 8

loc_32E94:
		mov	ax, [si]
		and	ax, 0FFFEh
		add	si, ax

loc_32E9B:
		cmp	word ptr [si], 1
		jz	short loc_32EA3
sub_32D80		endp
seg102		ends
