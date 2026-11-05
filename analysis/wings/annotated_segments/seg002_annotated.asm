seg002		segment	para public 'CODE' use16
		assume cs:seg002
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 1Fh, 0CBh

loc_4414:
		db 0EAh, 0AFh, 2, 0, 0, 0C3h, 0CBh, 0, 0

; ----------------------------------------------------------------------

sub_441D		proc far
		mov	ax, 1209h
		push	ax
		call	sub_9D47
		add	sp, 2
		retf
sub_441D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_442A		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= word ptr  12h

		enter	4, 0
		push	si
		push	di
		push	bx
		push	cx
		mov	ax, word_5D97E
		or	ax, ax
		jz	short loc_4476
		les	bx, word_5D974
		cmp	byte ptr es:[bx], 0
		jz	short loc_4476
		cmp	word ptr [bp+arg_0+2], ax
		jnb	short loc_4450
		mov	ax, word_59E3D
		cmp	word ptr [bp+arg_0+2], ax
		jnb	short loc_4476

loc_4450:
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		push	large [bp+arg_8]
		push	[bp+arg_C]
		push	cs
		call	near ptr sub_463C
		add	sp, 0Eh
		cmp	byte ptr cs:0Ch, 0
		jnz	short sub_441D
		pop	cx
		pop	bx
		pop	di
		pop	si
		leave
		retf	0Eh

loc_4476:
		mov	word_5E5E8, 0
		mov	ax, word ptr [bp+arg_4]
		or	ax, word ptr [bp+arg_4+2]
		cmp	ax, 0
		jnz	short loc_448D
		clc
		xor	dx, dx
		jmp	loc_455E

loc_448D:
		xor	ax, ax
		mov	word_5E5E6, ax
		mov	word ptr dword_5E5E4, ax
		inc	ax
		cmp	word ptr [bp+arg_0+2], 0
		jnz	short loc_44A5
		cmp	word ptr [bp+arg_0], 0
		jnz	short loc_44A5
		jmp	loc_4531

loc_44A5:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	bx, [bp+arg_C]
		mov	dx, word ptr [bp+arg_8]
		mov	cx, word ptr [bp+arg_8+2]
		cmp	cx, 0FFFFh
		jnz	short loc_44C4
		cmp	dx, 0FFFFh
		jz	short loc_44CF

loc_44C4:
		mov	ax, 4200h
		int	21h
		jb	sub_441D
		jb	short loc_4531

loc_44CF:
		mov	di, word ptr [bp+arg_4+2]
		mov	si, word ptr [bp+arg_4]

loc_44D5:
		or	di, di
		jnz	short loc_44DF
		cmp	si, 0FFF0h
		jbe	short loc_4516

loc_44DF:
		mov	cx, 0FFF0h
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 3Fh
		int	21h
		jb	sub_441D
		cmp	byte ptr cs:0Ch, 0
		jnz	sub_441D
		pop	ds
		jb	short loc_4531
		add	word ptr dword_5E5E4, ax
		adc	word_5E5E6, 0
		cmp	ax, 0
		jz	short loc_454E
		sub	si, ax
		sbb	di, 0
		shr	ax, 4
		add	[bp+var_2], ax
		jmp	short loc_44D5

loc_4516:
		mov	cx, si
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 3Fh
		int	21h
		jb	sub_441D
		cmp	byte ptr cs:0Ch, 0
		jnz	sub_441D
		pop	ds
		jnb	short loc_454E

loc_4531:
		or	ax, ax
		jnz	short loc_4536
		inc	ax

loc_4536:
		mov	word_5E5E8, ax
		call	dword ptr dword_5E5EA
		test	word_5E5E8, 0FFFFh
		jz	loc_448D
		xor	ax, ax
		xor	dx, dx
		stc
		jmp	short loc_455E

loc_454E:
		add	word ptr dword_5E5E4, ax
		adc	word_5E5E6, 0
		mov	ax, word ptr dword_5E5E4
		mov	dx, word_5E5E6

loc_455E:
		cmp	byte ptr cs:0Ch, 0
		jnz	sub_441D
		pop	cx
		pop	bx
		pop	di
		pop	si
		leave
		retf	0Eh
sub_442A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4570		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= word ptr  12h

		enter	4, 0
		push	si
		push	di
		mov	ax, word_5D97E
		or	ax, ax
		jz	short loc_45B0
		les	bx, word_5D974
		cmp	byte ptr es:[bx], 0
		jz	short loc_45B0
		cmp	word ptr [bp+arg_0+2], ax
		jnb	short loc_4594
		mov	ax, word_59E3D
		cmp	word ptr [bp+arg_0+2], ax
		jnb	short loc_45B0

loc_4594:
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		push	large [bp+arg_8]
		push	[bp+arg_C]
		push	cs
		call	sub_470C
		add	sp, 0Eh
		pop	di
		pop	si
		leave
		retf	0Eh

loc_45B0:
		mov	ax, word ptr [bp+arg_0]
		mov	[bp+var_4], ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	[bp+var_2], ax
		mov	bx, [bp+arg_C]
		mov	dx, word ptr [bp+arg_8]
		mov	cx, word ptr [bp+arg_8+2]
		cmp	cx, 0FFFFh
		jnz	short loc_45CF
		cmp	dx, 0FFFFh
		jz	short loc_45DA

loc_45CF:
		mov	ax, 4200h
		int	21h
		jb	sub_441D
		jb	short loc_461D

loc_45DA:
		mov	di, word ptr [bp+arg_4+2]
		mov	si, word ptr [bp+arg_4]

loc_45E0:
		or	di, di
		jnz	short loc_45EA
		cmp	si, 0FFF0h
		jbe	short loc_4609

loc_45EA:
		mov	cx, 0FFF0h
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 40h
		int	21h
		pop	ds
		jb	short loc_461D
		cmp	ax, cx
		jb	short loc_461A
		sub	si, ax
		sbb	di, 0
		shr	ax, 4
		add	[bp+var_2], ax
		jmp	short loc_45E0

loc_4609:
		mov	cx, si
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 40h
		int	21h
		pop	ds
		jb	short loc_461D
		cmp	ax, cx
		jnb	short loc_4633

loc_461A:
		mov	ax, 0FFFFh

loc_461D:
		mov	word_5E5E8, ax
		call	dword ptr dword_5E5EA
		test	word_5E5E8, 0FFFFh
		jnz	short loc_462E
		jmp	short loc_45B0

loc_462E:
		xor	ax, ax
		stc
		jmp	short loc_4636

loc_4633:
		mov	ax, 1

loc_4636:
		pop	di
		pop	si
		leave
		retf	0Eh
sub_4570		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_463C		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		enter	8, 0
		xor	eax, eax
		mov	word_5E5E8, ax
		mov	dword_5E5E4, eax
		mov	bx, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		cmp	cx, 0FFFFh
		jz	short loc_4661
		mov	ax, 4200h
		int	21h
		jb	loc_46E5

loc_4661:
		push	large [bp+arg_A]
		call	sub_43346
		add	sp, 4
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf
		int	15h
		popf
		mov	edx, [bp+var_4]

loc_4681:
		mov	[bp+var_4], edx
		mov	ax, 4
		push	ax
		push	edx
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		movzx	ecx, dx
		shl	ecx, 4
		movzx	eax, ax
		add	ecx, eax
		sub	ecx, dword_5D980
		neg	cx
		jnz	short loc_46B2
		dec	cx

loc_46B2:
		cmp	ecx, [bp+arg_6]
		jbe	short loc_46BB
		mov	cx, word ptr [bp+arg_6]

loc_46BB:
		mov	bx, [bp+arg_0]
		push	ds
		lds	dx, [bp+var_8]
		mov	ah, 3Fh
		int	21h
		pop	ds
		jb	short loc_46E5
		movzx	eax, ax
		add	dword_5E5E4, eax
		cmp	ax, cx
		jb	short loc_46F5
		mov	edx, [bp+var_4]
		add	edx, eax
		sub	[bp+arg_6], eax
		jz	short loc_46F5
		jmp	short loc_4681

loc_46E5:
		mov	word_5E5E8, ax
		call	dword ptr dword_5E5EA
		test	word_5E5E8, 0FFFFh
		jz	short loc_46BB
		stc

loc_46F5:
		pushf
		mov	ax, 1209h
		mov	bx, 534Dh
		pushf
		int	15h
		popf
		mov	eax, dword_5E5E4
		shld	edx, eax, 10h
		popf
		leave
		retf
sub_463C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_470C		proc near

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= dword ptr  0Ch
arg_C		= dword ptr  10h

		enter	8, 0
		xor	eax, eax
		mov	word_5E5E8, ax
		mov	dword_5E5E4, eax
		mov	bx, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	cx, [bp+arg_6]
		cmp	cx, 0FFFFh
		jz	short loc_4731
		mov	ax, 4200h
		int	21h
		jb	loc_47B8

loc_4731:
		push	large [bp+arg_C]
		call	sub_43346
		add	sp, 4
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf
		int	15h
		popf
		mov	edx, [bp+var_4]

loc_4751:
		mov	[bp+var_4], edx
		mov	ax, 4
		push	ax
		push	edx
		call	sub_431E7
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		movzx	ecx, dx
		shl	ecx, 4
		movzx	eax, ax
		add	ecx, eax
		sub	ecx, dword_5D980
		neg	cx
		jnz	short loc_4782
		dec	cx

loc_4782:
		cmp	ecx, [bp+arg_8]
		jbe	short loc_478B
		mov	cx, word ptr [bp+arg_8]

loc_478B:
		mov	bx, [bp+arg_2]
		push	ds
		lds	dx, [bp+var_8]
		mov	ah, 40h
		int	21h
		pop	ds
		jb	short loc_47B8
		movzx	eax, ax
		add	dword_5E5E4, eax
		cmp	ax, cx
		jb	short loc_47B5
		mov	edx, [bp+var_4]
		add	edx, eax
		sub	[bp+arg_8], eax
		jz	short loc_47C8
		jmp	short loc_4751

loc_47B5:
		mov	ax, 0FFFFh

loc_47B8:
		mov	word_5E5E8, ax
		call	dword ptr dword_5E5EA
		test	word_5E5E8, 0FFFFh
		jz	short loc_478B
		stc

loc_47C8:
		pushf
		mov	ax, 1209h
		mov	bx, 534Dh
		pushf
sub_470C		endp
seg002		ends
