seg147		segment	para public 'CODE' use16
		assume cs:seg147
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E9h, 5Ch, 0FFh

loc_64D23:
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64D26		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dl, [bp+arg_6]
		xor	ax, ax
		test	dl, 4
		jz	short loc_64D3B
		mov	ax, 1
		jmp	short loc_64D43

loc_64D3B:
		test	dl, 8
		jz	short loc_64D43
		mov	ax, 0FFFFh

loc_64D43:
		push	ax
		push	0
		push	large [bp+arg_2]
		call	sub_65D77
		add	sp, 8
		pop	bp
		retf
sub_64D26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64D54		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	dword ptr [si], 0
		jz	short loc_64D74
		push	word ptr [si+2]
		call	sub_65EBC
		pop	cx
		mov	dword ptr [si], 0

loc_64D74:
		pop	si
		pop	bp
		retf
sub_64D54		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64D77		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	large [bp+arg_A]
		push	large [bp+arg_6]
		push	large [bp+arg_2]
		call	sub_6418B
		add	sp, 0Ch
		pop	bp
		retf
sub_64D77		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64D93		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		call	sub_66372
		pop	bp
		retf
sub_64D93		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64DA0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		call	sub_661A6
		mov	ax, 2
		pop	bp
		retf
sub_64DA0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64DB0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_7AC5C
		pop	bp
		retf
sub_64DB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64DBB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_64DBB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64DC3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_64DDC
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_64E39

loc_64DDC:
		mov	word ptr [si], 0D7Ch
		mov	ax, word_7AFA2
		mov	[si+2], ax
		mov	word_7AFA2, si
		mov	word ptr [si+4], 372h
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+8], seg seg173
		mov	word ptr [si+6], 2
		mov	word ptr [si], 44FBh
		mov	word ptr [si+4], 4523h
		mov	word ptr [si], 4556h
		mov	word ptr [si+4], 457Eh
		cmp	byte_7AC5C, 0
		jz	short loc_64E2F
		push	452Dh
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_76670
		add	sp, 4
		jmp	short loc_64E34

loc_64E2F:
		call	sub_66300

loc_64E34:
		mov	byte_7AC5C, 1

loc_64E39:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_64DC3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64E3E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_64E7A
		mov	word ptr [si], 4556h
		mov	word ptr [si+4], 457Eh
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_765E5
		pop	cx
		push	0
		push	si
		call	sub_68298
		add	sp, 4
		test	di, 1
		jz	short loc_64E7A
		push	si
		call	sub_3B2
		pop	cx

loc_64E7A:
		pop	di
		pop	si
		pop	bp
		retf
sub_64E3E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64E7E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_4]
		mov	ax, [bp+arg_2]
		pop	bp
		retf
sub_64E7E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64E8C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_64E8C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64E96		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 2
		pop	bp
		retf
sub_64E96		endp
seg147		ends
