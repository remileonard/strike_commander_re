seg151		segment	para public 'CODE' use16
		assume cs:seg151
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh, 8Bh, 0DCh, 36h, 83h, 47h, 4, 0FCh, 90h, 90h, 0E9h, 99h, 0FFh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6571E		proc far

var_1		= byte ptr -1
arg_0		= byte ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, word_7AE72
		or	si, si
		jnz	short loc_65731
		jmp	loc_65841

loc_65731:
		cmp	byte_7AE77, 0
		jnz	short loc_6573B
		jmp	loc_65839

loc_6573B:
		jmp	loc_65841
		mov	[bp+var_1], 1
		cmp	word ptr [si+2], 0
		jz	short loc_65761
		mov	bx, [si+2]
		mov	di, [bx]
		and	di, 0FFFEh
		add	di, [si+2]
		cmp	di, si
		jnz	short loc_6575C
		mov	ax, 1
		jmp	short loc_6575E

loc_6575C:
		xor	ax, ax

loc_6575E:
		mov	[bp+var_1], al

loc_65761:
		cmp	[bp+var_1], 0
		jz	short loc_65781
		mov	ax, [si]
		and	ax, 0FFFEh
		mov	di, si
		add	di, ax
		cmp	[di+2], si
		jnz	short loc_6577A
		mov	ax, 1
		jmp	short loc_6577C

loc_6577A:
		xor	ax, ax

loc_6577C:
		mov	[bp+var_1], al
		jmp	short loc_65793

loc_65781:
		mov	byte_7AE79, 0
		inc	byte_7AE77
		push	1307h
		call	sub_1DDFE
		pop	cx

loc_65793:
		cmp	[bp+var_1], 0
		jz	short loc_657BB
		test	word ptr [si], 1
		jnz	short loc_657BB
		mov	bx, [si+4]
		cmp	[bx+6], si
		jnz	short loc_657B4
		mov	bx, [si+6]
		cmp	[bx+4], si
		jnz	short loc_657B4
		mov	ax, 1
		jmp	short loc_657B6

loc_657B4:
		xor	ax, ax

loc_657B6:
		mov	[bp+var_1], al
		jmp	short loc_657D6

loc_657BB:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_657D6
		inc	byte_7AE77
		mov	byte_7AE79, 0
		push	1307h
		call	sub_1DDFE
		pop	cx

loc_657D6:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_657F1
		inc	byte_7AE77
		mov	byte_7AE79, 0
		push	1307h
		call	sub_1DDFE
		pop	cx

loc_657F1:
		mov	dl, [si]
		and	dl, 1
		cmp	[bp+arg_0], 0
		jz	short loc_65804
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jz	short loc_65813

loc_65804:
		cmp	[bp+arg_0], 0
		jz	short loc_65832
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_65832

loc_65813:
		mov	ax, [si]
		and	ax, 0FFFEh
		push	ax
		push	si
		or	dl, dl
		jz	short loc_65823
		mov	ax, 4731h
		jmp	short loc_65826

loc_65823:
		mov	ax, 473Bh

loc_65826:
		push	ax
		push	4710h
		call	CRT_Msg_NullPtrAssign
		add	sp, 8

loc_65832:
		mov	ax, [si]
		and	ax, 0FFFEh
		add	si, ax

loc_65839:
		cmp	word ptr [si], 1
		jz	short loc_65841
sub_6571E		endp

; START OF FUNCTION CHUNK FOR sub_6571E
		db 0E9h
		std
; END OF FUNCTION CHUNK FOR sub_6571E
seg151		ends
