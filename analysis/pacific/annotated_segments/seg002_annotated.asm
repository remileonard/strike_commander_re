seg002		segment	para public 'CODE' use16
		assume cs:seg002
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 0, 0C3h, 0CBh, 0

; ----------------------------------------------------------------------

sub_4485		proc far
		mov	ax, 1209h
		push	ax
		call	sub_1DDFE
		add	sp, 2
		retf
sub_4485		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4492		proc far

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
		mov	ax, word_7AB88
		or	ax, ax
		jz	short loc_44DE
		les	bx, word_7AB7E
		cmp	byte ptr es:[bx], 0
		jz	short loc_44DE
		cmp	word ptr [bp+arg_0+2], ax
		jnb	short loc_44B8
		mov	ax, word_7684C
		cmp	word ptr [bp+arg_0+2], ax
		jnb	short loc_44DE

loc_44B8:
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		push	large [bp+arg_8]
		push	[bp+arg_C]
		push	cs
		call	near ptr sub_46A4
		add	sp, 0Eh
		cmp	byte ptr cs:4, 0
		jnz	short sub_4485
		pop	cx
		pop	bx
		pop	di
		pop	si
		leave
		retf	0Eh

loc_44DE:
		mov	word_7B10C, 0
		mov	ax, word ptr [bp+arg_4]
		or	ax, word ptr [bp+arg_4+2]
		cmp	ax, 0
		jnz	short loc_44F5
		clc
		xor	dx, dx
		jmp	loc_45C6

loc_44F5:
		xor	ax, ax
		mov	word_7B10A, ax
		mov	word_7B108, ax
		inc	ax
		cmp	word ptr [bp+arg_0+2], 0
		jnz	short loc_450D
		cmp	word ptr [bp+arg_0], 0
		jnz	short loc_450D
		jmp	loc_4599

loc_450D:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	bx, [bp+arg_C]
		mov	dx, word ptr [bp+arg_8]
		mov	cx, word ptr [bp+arg_8+2]
		cmp	cx, 0FFFFh
		jnz	short loc_452C
		cmp	dx, 0FFFFh
		jz	short loc_4537

loc_452C:
		mov	ax, 4200h
		int	21h
		jb	sub_4485
		jb	short loc_4599

loc_4537:
		mov	di, word ptr [bp+arg_4+2]
		mov	si, word ptr [bp+arg_4]

loc_453D:
		or	di, di
		jnz	short loc_4547
		cmp	si, 0FFF0h
		jbe	short loc_457E

loc_4547:
		mov	cx, 0FFF0h
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 3Fh
		int	21h
		jb	sub_4485
		cmp	byte ptr cs:4, 0
		jnz	sub_4485
		pop	ds
		jb	short loc_4599
		add	word_7B108, ax
		adc	word_7B10A, 0
		cmp	ax, 0
		jz	short loc_45B6
		sub	si, ax
		sbb	di, 0
		shr	ax, 4
		add	[bp+var_2], ax
		jmp	short loc_453D

loc_457E:
		mov	cx, si
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 3Fh
		int	21h
		jb	sub_4485
		cmp	byte ptr cs:4, 0
		jnz	sub_4485
		pop	ds
		jnb	short loc_45B6

loc_4599:
		or	ax, ax
		jnz	short loc_459E
		inc	ax

loc_459E:
		mov	word_7B10C, ax
		call	dword ptr dword_7B10E
		test	word_7B10C, 0FFFFh
		jz	loc_44F5
		xor	ax, ax
		xor	dx, dx
		stc
		jmp	short loc_45C6

loc_45B6:
		add	word_7B108, ax
		adc	word_7B10A, 0
		mov	ax, word_7B108
		mov	dx, word_7B10A

loc_45C6:
		cmp	byte ptr cs:4, 0
		jnz	sub_4485
		pop	cx
		pop	bx
		pop	di
		pop	si
		leave
		retf	0Eh
sub_4492		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45D8		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= word ptr  12h

		enter	4, 0
		push	si
		push	di
		mov	ax, word_7AB88
		or	ax, ax
		jz	short loc_4618
		les	bx, word_7AB7E
		cmp	byte ptr es:[bx], 0
		jz	short loc_4618
		cmp	word ptr [bp+arg_0+2], ax
		jnb	short loc_45FC
		mov	ax, word_7684C
		cmp	word ptr [bp+arg_0+2], ax
		jnb	short loc_4618

loc_45FC:
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		push	large [bp+arg_8]
		push	[bp+arg_C]
		push	cs
		call	sub_4774
		add	sp, 0Eh
		pop	di
		pop	si
		leave
		retf	0Eh

loc_4618:
		mov	ax, word ptr [bp+arg_0]
		mov	[bp+var_4], ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	[bp+var_2], ax
		mov	bx, [bp+arg_C]
		mov	dx, word ptr [bp+arg_8]
		mov	cx, word ptr [bp+arg_8+2]
		cmp	cx, 0FFFFh
		jnz	short loc_4637
		cmp	dx, 0FFFFh
		jz	short loc_4642

loc_4637:
		mov	ax, 4200h
		int	21h
		jb	sub_4485
		jb	short loc_4685

loc_4642:
		mov	di, word ptr [bp+arg_4+2]
		mov	si, word ptr [bp+arg_4]

loc_4648:
		or	di, di
		jnz	short loc_4652
		cmp	si, 0FFF0h
		jbe	short loc_4671

loc_4652:
		mov	cx, 0FFF0h
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 40h
		int	21h
		pop	ds
		jb	short loc_4685
		cmp	ax, cx
		jb	short loc_4682
		sub	si, ax
		sbb	di, 0
		shr	ax, 4
		add	[bp+var_2], ax
		jmp	short loc_4648

loc_4671:
		mov	cx, si
		push	ds
		lds	dx, [bp+var_4]
		mov	ah, 40h
		int	21h
		pop	ds
		jb	short loc_4685
		cmp	ax, cx
		jnb	short loc_469B

loc_4682:
		mov	ax, 0FFFFh

loc_4685:
		mov	word_7B10C, ax
		call	dword ptr dword_7B10E
		test	word_7B10C, 0FFFFh
		jnz	short loc_4696
		jmp	short loc_4618

loc_4696:
		xor	ax, ax
		stc
		jmp	short loc_469E

loc_469B:
		mov	ax, 1

loc_469E:
		pop	di
		pop	si
		leave
		retf	0Eh
sub_45D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46A4		proc far

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
		mov	word_7B10C, ax
		mov	dword ptr word_7B108, eax
		mov	bx, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		cmp	cx, 0FFFFh
		jz	short loc_46C9
		mov	ax, 4200h
		int	21h
		jb	loc_474D

loc_46C9:
		push	large [bp+arg_A]
		call	sub_63D74
		add	sp, 4
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf
		int	15h
		popf
		mov	edx, [bp+var_4]

loc_46E9:
		mov	[bp+var_4], edx
		mov	ax, 4
		push	ax
		push	edx
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		movzx	ecx, dx
		shl	ecx, 4
		movzx	eax, ax
		add	ecx, eax
		sub	ecx, dword_7AB8A
		neg	cx
		jnz	short loc_471A
		dec	cx

loc_471A:
		cmp	ecx, [bp+arg_6]
		jbe	short loc_4723
		mov	cx, word ptr [bp+arg_6]

loc_4723:
		mov	bx, [bp+arg_0]
		push	ds
		lds	dx, [bp+var_8]
		mov	ah, 3Fh
		int	21h
		pop	ds
		jb	short loc_474D
		movzx	eax, ax
		add	dword ptr word_7B108, eax
		cmp	ax, cx
		jb	short loc_475D
		mov	edx, [bp+var_4]
		add	edx, eax
		sub	[bp+arg_6], eax
		jz	short loc_475D
		jmp	short loc_46E9

loc_474D:
		mov	word_7B10C, ax
		call	dword ptr dword_7B10E
		test	word_7B10C, 0FFFFh
		jz	short loc_4723
		stc

loc_475D:
		pushf
		mov	ax, 1209h
		mov	bx, 534Dh
		pushf
		int	15h
		popf
		mov	eax, dword ptr word_7B108
		shld	edx, eax, 10h
		popf
		leave
		retf
sub_46A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4774		proc near

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
		mov	word_7B10C, ax
		mov	dword ptr word_7B108, eax
		mov	bx, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	cx, [bp+arg_6]
		cmp	cx, 0FFFFh
		jz	short loc_4799
		mov	ax, 4200h
		int	21h
		jb	loc_4820

loc_4799:
		push	large [bp+arg_C]
		call	sub_63D74
		add	sp, 4
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf
		int	15h
		popf
		mov	edx, [bp+var_4]

loc_47B9:
		mov	[bp+var_4], edx
		mov	ax, 4
		push	ax
		push	edx
		call	sub_63C15
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		movzx	ecx, dx
		shl	ecx, 4
		movzx	eax, ax
		add	ecx, eax
		sub	ecx, dword_7AB8A
		neg	cx
		jnz	short loc_47EA
		dec	cx

loc_47EA:
		cmp	ecx, [bp+arg_8]
		jbe	short loc_47F3
		mov	cx, word ptr [bp+arg_8]

loc_47F3:
		mov	bx, [bp+arg_2]
		push	ds
		lds	dx, [bp+var_8]
		mov	ah, 40h
		int	21h
		pop	ds
		jb	short loc_4820
		movzx	eax, ax
		add	dword ptr word_7B108, eax
		cmp	ax, cx
		jb	short loc_481D
		mov	edx, [bp+var_4]
		add	edx, eax
		sub	[bp+arg_8], eax
		jz	short loc_4830
		jmp	short loc_47B9

loc_481D:
		mov	ax, 0FFFFh

loc_4820:
		mov	word_7B10C, ax
		call	dword ptr dword_7B10E
		test	word_7B10C, 0FFFFh
		jz	short loc_47F3
		stc

loc_4830:
		pushf
		mov	ax, 1209h
		mov	bx, 534Dh
		pushf
		int	15h
		popf
		mov	eax, dword ptr word_7B108
sub_4774		endp

; START OF FUNCTION CHUNK FOR sub_4774
		db 66h
; END OF FUNCTION CHUNK FOR sub_4774
seg002		ends
