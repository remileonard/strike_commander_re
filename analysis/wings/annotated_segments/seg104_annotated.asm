seg104		segment	para public 'CODE' use16
		assume cs:seg104
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44CF0		proc far

var_1		= byte ptr -1
arg_0		= byte ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, word_5DC68
		or	si, si
		jnz	short loc_44D03
		jmp	loc_44E13

loc_44D03:
		cmp	byte_5DC6D, 0
		jnz	short loc_44D0D
		jmp	loc_44E0B

loc_44D0D:
		jmp	loc_44E13
		mov	[bp+var_1], 1
		cmp	word ptr [si+2], 0
		jz	short loc_44D33
		mov	bx, [si+2]
		mov	di, [bx]
		and	di, 0FFFEh
		add	di, [si+2]
		cmp	di, si
		jnz	short loc_44D2E
		mov	ax, 1
		jmp	short loc_44D30

loc_44D2E:
		xor	ax, ax

loc_44D30:
		mov	[bp+var_1], al

loc_44D33:
		cmp	[bp+var_1], 0
		jz	short loc_44D53
		mov	ax, [si]
		and	ax, 0FFFEh
		mov	di, si
		add	di, ax
		cmp	[di+2], si
		jnz	short loc_44D4C
		mov	ax, 1
		jmp	short loc_44D4E

loc_44D4C:
		xor	ax, ax

loc_44D4E:
		mov	[bp+var_1], al
		jmp	short loc_44D65

loc_44D53:
		mov	byte_5DC6F, 0
		inc	byte_5DC6D
		push	1307h
		call	sub_9D47
		pop	cx

loc_44D65:
		cmp	[bp+var_1], 0
		jz	short loc_44D8D
		test	word ptr [si], 1
		jnz	short loc_44D8D
		mov	bx, [si+4]
		cmp	[bx+6], si
		jnz	short loc_44D86
		mov	bx, [si+6]
		cmp	[bx+4], si
		jnz	short loc_44D86
		mov	ax, 1
		jmp	short loc_44D88

loc_44D86:
		xor	ax, ax

loc_44D88:
		mov	[bp+var_1], al
		jmp	short loc_44DA8

loc_44D8D:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44DA8
		inc	byte_5DC6D
		mov	byte_5DC6F, 0
		push	1307h
		call	sub_9D47
		pop	cx

loc_44DA8:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44DC3
		inc	byte_5DC6D
		mov	byte_5DC6F, 0
		push	1307h
		call	sub_9D47
		pop	cx

loc_44DC3:
		mov	dl, [si]
		and	dl, 1
		cmp	[bp+arg_0], 0
		jz	short loc_44DD6
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jz	short loc_44DE5

loc_44DD6:
		cmp	[bp+arg_0], 0
		jz	short loc_44E04
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44E04

loc_44DE5:
		mov	ax, [si]
		and	ax, 0FFFEh
		push	ax
		push	si
		or	dl, dl
		jz	short loc_44DF5
		mov	ax, 3F37h
		jmp	short loc_44DF8

loc_44DF5:
		mov	ax, 3F41h

loc_44DF8:
		push	ax
		push	3F16h
		call	CRT_Msg_NullPtrAssign
		add	sp, 8

loc_44E04:
		mov	ax, [si]
		and	ax, 0FFFEh
		add	si, ax

loc_44E0B:
		cmp	word ptr [si], 1
		jz	short loc_44E13
sub_44CF0		endp
seg104		ends
