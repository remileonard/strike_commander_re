seg091		segment	para public 'CODE' use16
		assume cs:seg091
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9, 56h, 9Ah, 9Ch, 3, 0, 0, 59h, 0EBh, 0

loc_2FEAA:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FEAE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_2FEAE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FEB8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_2FEB8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FEC0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+2], ax
		mov	ax, [bp+arg_4]
		mov	[si+4], ax
		mov	word ptr [si+6], 0
		pop	si
		pop	bp
		retf
sub_2FEC0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FEDB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+6]
		cmp	ax, [si+2]
		jge	short loc_2FEFB
		mov	ax, [si+6]
		inc	word ptr [si+6]
		shl	ax, 1
		mov	bx, [si+4]
		add	bx, ax
		mov	ax, [bx]
		jmp	short loc_2FEFD

loc_2FEFB:
		xor	ax, ax

loc_2FEFD:
		pop	si
		pop	bp
		retf
sub_2FEDB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FF00		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+6], 0
		pop	si
		pop	bp
		retf
sub_2FF00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FF0F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		push	451Dh
		mov	ax, dx
		add	ax, 8
		push	ax
		call	CachedObject_DestructSubobjects_2F6ED
		add	sp, 4
		pop	bp
		retf
sub_2FF0F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FF28		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	ds
		push	di
		call	sub_993C
		add	sp, 4
		or	al, al
		jz	short loc_2FF6A
		mov	[bp+var_2], di
		push	1
		push	[bp+var_2]
		mov	ax, si
		add	ax, 2
		push	ax
		call	StreamReader_ReadDispatch_411DE
		add	sp, 6
		mov	byte ptr [si+66h], 0
		mov	word ptr [si+106h], 0
		mov	byte ptr [si+65h], 0
		jmp	short loc_2FF6E

loc_2FF6A:
		mov	byte ptr [si+65h], 1

loc_2FF6E:
		pop	di
		pop	si
		leave
		retf
sub_2FF28		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FF72		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2FFDC
		mov	word ptr [si], 44C5h
		mov	word ptr [si+2], 44D5h
		mov	al, [si+65h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2FFBF
		or	si, si
		jz	short loc_2FF9E
		mov	ax, si
		add	ax, 2
		jmp	short loc_2FFA0

loc_2FF9E:
		mov	ax, si

loc_2FFA0:
		push	ax
		call	StreamReader_ValidateState_412A1
		pop	cx
		or	al, al
		jz	short loc_2FFBF
		or	si, si
		jz	short loc_2FFB6
		mov	ax, si
		add	ax, 2
		jmp	short loc_2FFB8

loc_2FFB6:
		mov	ax, si

loc_2FFB8:
		push	ax
		call	sub_4123E
		pop	cx

loc_2FFBF:
		push	0
		mov	ax, si
		add	ax, 2
		push	ax
		call	sub_30851
		add	sp, 4
		test	di, 1
		jz	short loc_2FFDC
		push	si
		call	sub_39C
		pop	cx

loc_2FFDC:
		pop	di
		pop	si
		pop	bp
		retf
sub_2FF72		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FFE0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+65h], 0
		jz	short loc_2FFF1
		xor	ax, ax
		jmp	short loc_30048

loc_2FFF1:
		cmp	word ptr [si+106h], 0
		jz	short loc_3003D
		mov	ax, si
		add	ax, 108h
		push	ax
		push	451Ah
		push	0

loc_30003:
		call	sub_35D08
		add	sp, 6
		mov	[si+106h], ax
		jmp	short loc_3003D

loc_30011:
		push	0A0h
		mov	ax, si
		add	ax, 66h
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		call	sub_30906
		add	sp, 6
		or	ax, ax
		jz	short loc_30044
		mov	ax, si
		add	ax, 108h
		push	ax
		push	451Ah
		mov	ax, si
		add	ax, 66h
		push	ax
		jmp	short loc_30003

loc_3003D:
		cmp	word ptr [si+106h], 0
		jz	short loc_30011

loc_30044:
		mov	ax, [si+106h]

loc_30048:
		pop	si
		pop	bp
		retf
sub_2FFE0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3004B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0
		mov	ax, si
		add	ax, 2
		push	ax
		call	StreamReader_SeekVariant_412E2
		add	sp, 6
		mov	word ptr [si+106h], 0
		mov	byte ptr [si+66h], 0
		pop	si
		pop	bp
		retf
sub_3004B		endp
seg091		ends
