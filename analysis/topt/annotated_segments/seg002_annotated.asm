seg002		segment	para public 'CODE' use16
		assume cs:seg002
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 3, 0, 0, 0C3h, 0CBh, 0, 0

; ----------------------------------------------------------------------

sub_4097		proc far
		mov	ax, 1209h
		push	ax
		call	sub_13451
		add	sp, 2
		retf
sub_4097		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40A4		proc far

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
		mov	ax, word_4CFA8
		or	ax, ax
		jz	short loc_40F0
		les	bx, word_4CF9E
		cmp	byte ptr es:[bx], 0
		jz	short loc_40F0
		cmp	word ptr [bp+arg_0+2], ax
		jnb	short loc_40CA
		mov	ax, word_48B44
		cmp	word ptr [bp+arg_0+2], ax
		jnb	short loc_40F0

loc_40CA:
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		push	large [bp+arg_8]
		push	[bp+arg_C]
		push	cs
		call	near ptr sub_42B6
		add	sp, 0Eh
		cmp	byte ptr cs:6, 0
		jnz	short sub_4097
		pop	cx
		pop	bx
		pop	di
		pop	si
		leave
		retf	0Eh

loc_40F0:
		mov	word_4DC0C, 0
		mov	ax, word ptr [bp+arg_4]
		or	ax, word ptr [bp+arg_4+2]
		cmp	ax, 0
		jnz	short loc_4107
		clc
		xor	dx, dx
		jmp	loc_41D8

loc_4107:
		xor	ax, ax
		mov	word_4DC0A, ax
		mov	word ptr dword_4DC08, ax
		inc	ax
		cmp	word ptr [bp+arg_0+2], 0
		jnz	short loc_411F
		cmp	word ptr [bp+arg_0], 0
		jnz	short loc_411F
		jmp	loc_41AB

loc_411F:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	bx, [bp+arg_C]
		mov	dx, word ptr [bp+arg_8]
		mov	cx, word ptr [bp+arg_8+2]
		cmp	cx, 0FFFFh
		jnz	short loc_413E
		cmp	dx, 0FFFFh
		jz	short loc_4149

loc_413E:
		mov	ax, 4200h
		int	21h
		jb	sub_4097
		jb	short loc_41AB

loc_4149:
		mov	di, word ptr [bp+arg_4+2]
		mov	si, word ptr [bp+arg_4]

loc_414F:
		or	di, di
		jnz	short loc_4159
		cmp	si, 0FFF0h
		jbe	short loc_4190

loc_4159:
		mov	cx, 0FFF0h
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 3Fh
		int	21h
		jb	sub_4097
		cmp	byte ptr cs:6, 0
		jnz	sub_4097
		pop	ds
		jb	short loc_41AB
		add	word ptr dword_4DC08, ax
		adc	word_4DC0A, 0
		cmp	ax, 0
		jz	short loc_41C8
		sub	si, ax
		sbb	di, 0
		shr	ax, 4
		add	[bp+var_2], ax
		jmp	short loc_414F

loc_4190:
		mov	cx, si
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 3Fh
		int	21h
		jb	sub_4097
		cmp	byte ptr cs:6, 0
		jnz	sub_4097
		pop	ds
		jnb	short loc_41C8

loc_41AB:
		or	ax, ax
		jnz	short loc_41B0
		inc	ax

loc_41B0:
		mov	word_4DC0C, ax
		call	dword ptr dword_4DC0E
		test	word_4DC0C, 0FFFFh
		jz	loc_4107
		xor	ax, ax
		xor	dx, dx
		stc
		jmp	short loc_41D8

loc_41C8:
		add	word ptr dword_4DC08, ax
		adc	word_4DC0A, 0
		mov	ax, word ptr dword_4DC08
		mov	dx, word_4DC0A

loc_41D8:
		cmp	byte ptr cs:6, 0
		jnz	sub_4097
		pop	cx
		pop	bx
		pop	di
		pop	si
		leave
		retf	0Eh
sub_40A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41EA		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= word ptr  12h

		enter	4, 0
		push	si
		push	di
		mov	ax, word_4CFA8
		or	ax, ax
		jz	short loc_422A
		les	bx, word_4CF9E
		cmp	byte ptr es:[bx], 0
		jz	short loc_422A
		cmp	word ptr [bp+arg_0+2], ax
		jnb	short loc_420E
		mov	ax, word_48B44
		cmp	word ptr [bp+arg_0+2], ax
		jnb	short loc_422A

loc_420E:
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		push	large [bp+arg_8]
		push	[bp+arg_C]
		push	cs
		call	sub_4386
		add	sp, 0Eh
		pop	di
		pop	si
		leave
		retf	0Eh

loc_422A:
		mov	ax, word ptr [bp+arg_0]
		mov	[bp+var_4], ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	[bp+var_2], ax
		mov	bx, [bp+arg_C]
		mov	dx, word ptr [bp+arg_8]
		mov	cx, word ptr [bp+arg_8+2]
		cmp	cx, 0FFFFh
		jnz	short loc_4249
		cmp	dx, 0FFFFh
		jz	short loc_4254

loc_4249:
		mov	ax, 4200h
		int	21h
		jb	sub_4097
		jb	short loc_4297

loc_4254:
		mov	di, word ptr [bp+arg_4+2]
		mov	si, word ptr [bp+arg_4]

loc_425A:
		or	di, di
		jnz	short loc_4264
		cmp	si, 0FFF0h
		jbe	short loc_4283

loc_4264:
		mov	cx, 0FFF0h
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 40h
		int	21h
		pop	ds
		jb	short loc_4297
		cmp	ax, cx
		jb	short loc_4294
		sub	si, ax
		sbb	di, 0
		shr	ax, 4
		add	[bp+var_2], ax
		jmp	short loc_425A

loc_4283:
		mov	cx, si
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 40h
		int	21h
		pop	ds
		jb	short loc_4297
		cmp	ax, cx
		jnb	short loc_42AD

loc_4294:
		mov	ax, 0FFFFh

loc_4297:
		mov	word_4DC0C, ax
		call	dword ptr dword_4DC0E
		test	word_4DC0C, 0FFFFh
		jnz	short loc_42A8
		jmp	short loc_422A

loc_42A8:
		xor	ax, ax
		stc
		jmp	short loc_42B0

loc_42AD:
		mov	ax, 1

loc_42B0:
		pop	di
		pop	si
		leave
		retf	0Eh
sub_41EA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42B6		proc far

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
		mov	word_4DC0C, ax
		mov	dword_4DC08, eax
		mov	bx, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		cmp	cx, 0FFFFh
		jz	short loc_42DB
		mov	ax, 4200h
		int	21h
		jb	loc_435F

loc_42DB:
		push	large [bp+arg_A]
		call	sub_312CC
		add	sp, 4
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf
		int	15h
		popf
		mov	edx, [bp+var_4]

loc_42FB:
		mov	[bp+var_4], edx
		mov	ax, 4
		push	ax
		push	edx
		call	sub_31186
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		movzx	ecx, dx
		shl	ecx, 4
		movzx	eax, ax
		add	ecx, eax
		sub	ecx, dword_4CFAA
		neg	cx
		jnz	short loc_432C
		dec	cx

loc_432C:
		cmp	ecx, [bp+arg_6]
		jbe	short loc_4335
		mov	cx, word ptr [bp+arg_6]

loc_4335:
		mov	bx, [bp+arg_0]
		push	ds
		lds	dx, [bp+var_8]
		mov	ah, 3Fh
		int	21h
		pop	ds
		jb	short loc_435F
		movzx	eax, ax
		add	dword_4DC08, eax
		cmp	ax, cx
		jb	short loc_436F
		mov	edx, [bp+var_4]
		add	edx, eax
		sub	[bp+arg_6], eax
		jz	short loc_436F
		jmp	short loc_42FB

loc_435F:
		mov	word_4DC0C, ax
		call	dword ptr dword_4DC0E
		test	word_4DC0C, 0FFFFh
		jz	short loc_4335
		stc

loc_436F:
		pushf
		mov	ax, 1209h
		mov	bx, 534Dh
		pushf
		int	15h
		popf
		mov	eax, dword_4DC08
		shld	edx, eax, 10h
		popf
		leave
		retf
sub_42B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4386		proc near

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
		mov	word_4DC0C, ax
		mov	dword_4DC08, eax
		mov	bx, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	cx, [bp+arg_6]
		cmp	cx, 0FFFFh
		jz	short loc_43AB
		mov	ax, 4200h
		int	21h
		jb	loc_4432

loc_43AB:
		push	large [bp+arg_C]
		call	sub_312CC
		add	sp, 4
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf
		int	15h
		popf
		mov	edx, [bp+var_4]

loc_43CB:
		mov	[bp+var_4], edx
		mov	ax, 4
		push	ax
		push	edx
		call	sub_31186
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		movzx	ecx, dx
		shl	ecx, 4
		movzx	eax, ax
		add	ecx, eax
		sub	ecx, dword_4CFAA
		neg	cx
		jnz	short loc_43FC
		dec	cx

loc_43FC:
		cmp	ecx, [bp+arg_8]
		jbe	short loc_4405
		mov	cx, word ptr [bp+arg_8]

loc_4405:
		mov	bx, [bp+arg_2]
		push	ds
		lds	dx, [bp+var_8]
		mov	ah, 40h
		int	21h
		pop	ds
		jb	short loc_4432
		movzx	eax, ax
		add	dword_4DC08, eax
		cmp	ax, cx
		jb	short loc_442F
		mov	edx, [bp+var_4]
		add	edx, eax
		sub	[bp+arg_8], eax
		jz	short loc_4442
		jmp	short loc_43CB

loc_442F:
		mov	ax, 0FFFFh

loc_4432:
		mov	word_4DC0C, ax
		call	dword ptr dword_4DC0E
		test	word_4DC0C, 0FFFFh
		jz	short loc_4405
		stc

loc_4442:
		pushf
		mov	ax, 1209h
		mov	bx, 534Dh
		pushf
		int	15h
		popf
sub_4386		endp

; START OF FUNCTION CHUNK FOR sub_4386
		db 66h, 0A1h, 28h
; END OF FUNCTION CHUNK FOR sub_4386
seg002		ends
