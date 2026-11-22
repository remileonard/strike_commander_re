seg104		segment	para public 'CODE' use16
		assume cs:seg104
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_332A2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		movzx	eax, [bp+arg_2]
		or	ax, ax
		jge	short loc_332D3
		sub	ax, 7FFDh
		push	ax
		push	[bp+arg_0]
		add	[bp+arg_0], ax
		sub	[bp+arg_2], ax
		push	cs
		call	near ptr sub_332A2
		add	sp, 4
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_332A2
		add	sp, 4
		jmp	loc_333D7

loc_332D3:
		cmp	ax, 2
		ja	short loc_332DD
		mov	ax, 1401h
		jmp	short loc_332F0

loc_332DD:
		movzx	ebx, [bp+arg_0]
		add	eax, ebx
		test	eax, 0FFFF0000h
		jz	short loc_332FC
		mov	ax, 1402h

loc_332F0:
		push	ax
		call	sub_13451
		add	sp, 2
		jmp	loc_333D7

loc_332FC:
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	word ptr es:0, 0FFFFh
		mov	word ptr es:2, 0
		mov	word ptr es:4, 0
		mov	word ptr es:6, 0
		inc	[bp+arg_0]
		mov	ax, [bp+arg_0]
		mov	bx, [bp+arg_2]
		sub	bx, 2
		add	ax, bx
		mov	es, ax
		mov	ax, [bp+arg_0]
		mov	word ptr es:0, 0FFFFh
		mov	es:2, ax
		mov	word ptr es:4, 1209h
		mov	es, ax
		mov	es:0, bx
		mov	bx, ax
		dec	bx
		mov	es:2, bx
		mov	es, ax
		cmp	word_4D29A, 0
		jnz	short loc_33367
		mov	word_4D29A, ax
		mov	es:4, ax
		mov	es:6, ax
		jmp	short loc_333B5

loc_33367:
		mov	bx, word_4D29A
		mov	fs, bx
		mov	dx, fs
		mov	cx, es:0
		cmp	cx, fs:0
		jnb	short loc_33381
		mov	word_4D29A, es
		jmp	short loc_33393

loc_33381:
		mov	fs, fs:6
		mov	ax, fs
		cmp	ax, dx
		jz	short loc_33393
		cmp	cx, fs:0
		ja	short loc_33381

loc_33393:
		mov	bx, fs:4
		mov	fs, bx
		mov	es:6, bx
		mov	bx, fs:4
		mov	es:4, bx
		mov	gs, bx
		mov	fs:4, es
		mov	gs:6, es

loc_333B5:
		mov	ax, [bp+arg_0]
		dec	ax
		cmp	word_4D29D, 0
		jnz	short loc_333C5
		mov	word_4D29D, ax
		jmp	short loc_333D4

loc_333C5:
		cmp	word_4D29F, 0
		jnz	short loc_333D1
		mov	word_4D29F, ax
		jmp	short loc_333D4

loc_333D1:
		mov	word_4D2A1, ax

loc_333D4:
		mov	ax, 1

loc_333D7:
		leave
		retf
sub_332A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_333D9		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		enter	0, 0
		push	si
		push	di
		mov	di, [bp+arg_6]
		xor	si, si
		or	di, di
		jnz	short loc_333FD
		push	1
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_333D9
		add	sp, 8
		or	dx, dx
		jnz	loc_33511

loc_333FD:
		pushf

loc_333FE:
		cmp	byte_4D2A3, 0
		jnz	short loc_333FE
		cli
		cmp	byte_4D2A3, 0
		jz	short loc_33410
		popf
		jmp	short loc_333FD

loc_33410:
		mov	si, 1
		mov	byte_4D2A3, 1
		popf
		mov	eax, [bp+arg_0]
		or	eax, eax
		jz	loc_334B9
		add	eax, 13h
		shr	eax, 4
		or	ax, ax
		jle	loc_334C3
		mov	bx, word_4D29A
		or	bx, bx
		jz	loc_334BE
		mov	es, bx
		mov	dx, bx

loc_33440:
		or	di, di
		jz	short loc_33460
		jl	short loc_33454
		cmp	bx, word_48B44
		jbe	short loc_33460
		cmp	bx, 0A000h
		jb	short loc_33469
		jmp	short loc_33460

loc_33454:
		cmp	bx, 0A000h
		jnb	short loc_33469
		cmp	bx, word_48B44
		jbe	short loc_33469

loc_33460:
		mov	cx, es:0
		sub	cx, ax
		jge	short loc_33479

loc_33469:
		mov	bx, es:6
		mov	es, bx
		cmp	dx, bx
		jnz	short loc_33440
		mov	ax, 1403h
		jmp	short loc_334C6

loc_33479:
		or	cx, cx
		jnz	short loc_334E0
		mov	dx, es:4
		cmp	bx, dx
		jnz	short loc_3348E
		mov	word_4D29A, 0
		jmp	short loc_334B0

loc_3348E:
		cmp	bx, word_4D29A
		jnz	short loc_3349D
		mov	bx, es:6
		mov	word_4D29A, bx

loc_3349D:
		mov	fs, dx
		mov	bx, es:6
		mov	fs:6, bx
		mov	fs, bx
		mov	fs:4, dx

loc_334B0:
		neg	word ptr es:0
		mov	dx, es
		jmp	short loc_3350E

loc_334B9:
		mov	ax, 1404h
		jmp	short loc_334C6

loc_334BE:
		mov	ax, 1406h
		jmp	short loc_334C6

loc_334C3:
		mov	ax, 1405h

loc_334C6:
		cmp	[bp+arg_4], 0
		jz	short loc_334DA
		mov	byte_4D2A3, 0
		push	ax
		call	sub_13451
		add	sp, 2

loc_334DA:
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_33511

loc_334E0:
		mov	es:0, cx
		push	ax
		push	bx
		push	cx
		push	es
		push	cs
		call	near ptr sub_336C7
		pop	cx
		pop	cx
		pop	bx
		pop	ax
		add	cx, bx
		mov	es, cx
		mov	es:0, ax
		neg	word ptr es:0
		mov	es:2, bx
		mov	dx, cx
		add	cx, ax
		mov	es, cx
		mov	es:2, dx

loc_3350E:
		mov	ax, 4

loc_33511:
		or	si, si
		jz	short loc_3351A
		mov	byte_4D2A3, 0

loc_3351A:
		pop	di
		pop	si
		leave
		retf
sub_333D9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3351E		proc far

arg_0		= word ptr  6

		enter	0, 0
		push	si
		xor	si, si

loc_33525:
		pushf

loc_33526:
		cmp	byte_4D2A3, 0
		jnz	short loc_33526
		cli
		cmp	byte_4D2A3, 0
		jz	short loc_33538
		popf
		jmp	short loc_33525

loc_33538:
		mov	byte_4D2A3, 1
		mov	si, 1
		popf
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_33602
		add	sp, 2
		or	ax, ax
		jz	loc_335F6
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	ax, es:2
		or	ax, ax
		jz	short loc_33588
		mov	fs, ax
		cmp	word ptr fs:0, 0
		jle	short loc_33588
		mov	ax, es:0
		sub	fs:0, ax
		mov	ax, fs
		add	ax, fs:0
		mov	es, ax
		mov	es:2, fs
		push	fs
		push	cs
		call	near ptr sub_336C7
		pop	cx
		jmp	short loc_335F6

loc_33588:
		mov	ax, [bp+arg_0]
		mov	es, ax
		neg	word ptr es:0
		mov	es, ax
		cmp	word_4D29A, 0
		jnz	short loc_335A8
		mov	word_4D29A, ax
		mov	es:4, ax
		mov	es:6, ax
		jmp	short loc_335F6

loc_335A8:
		mov	bx, word_4D29A
		mov	fs, bx
		mov	dx, fs
		mov	cx, es:0
		cmp	cx, fs:0
		jnb	short loc_335C2
		mov	word_4D29A, es
		jmp	short loc_335D4

loc_335C2:
		mov	fs, fs:6
		mov	ax, fs
		cmp	ax, dx
		jz	short loc_335D4
		cmp	cx, fs:0
		ja	short loc_335C2

loc_335D4:
		mov	bx, fs:4
		mov	fs, bx
		mov	es:6, bx
		mov	bx, fs:4
		mov	es:4, bx
		mov	gs, bx
		mov	fs:4, es
		mov	gs:6, es

loc_335F6:
		or	si, si
		jz	short loc_335FF
		mov	byte_4D2A3, 0

loc_335FF:
		pop	si
		leave
		retf
sub_3351E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33602		proc far

arg_0		= word ptr  6

		enter	0, 0
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	bx, es:0
		or	bx, bx
		jge	short loc_3363D
		neg	bx
		add	bx, ax
		mov	fs, bx
		cmp	fs:2, ax
		jnz	short loc_3363D
		mov	bx, es:2
		or	bx, bx
		jz	short loc_33656
		mov	fs, bx
		mov	cx, fs:0
		or	cx, cx
		jge	short loc_33637
		neg	cx

loc_33637:
		add	bx, cx
		cmp	ax, bx
		jz	short loc_33656

loc_3363D:
		mov	byte_4D2A3, 0
		push	cs
		call	near ptr sub_33808
		mov	ax, 1409h
		push	ax
		call	sub_13451
		add	sp, 2
		xor	ax, ax
		jmp	short loc_336C5

loc_33656:
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	bx, es:0
		neg	bx
		mov	dx, bx
		add	dx, ax
		mov	fs, dx
		mov	cx, fs:0
		or	cx, cx
		jle	short loc_336C2
		add	bx, cx
		mov	es:0, bx
		neg	word ptr es:0
		mov	ax, es
		add	bx, ax
		mov	fs, bx
		mov	fs:2, es
		mov	ax, dx
		mov	es, ax
		cmp	es:4, ax
		jnz	short loc_3369B
		mov	word_4D29A, 0
		jmp	short loc_336C2

loc_3369B:
		mov	dx, word_4D29A
		cmp	ax, dx
		jnz	short loc_336AA
		mov	ax, es:6
		mov	word_4D29A, ax

loc_336AA:
		mov	bx, es:4
		mov	cx, es:6
		mov	es, bx
		mov	es:6, cx
		mov	es, cx
		mov	es:4, bx

loc_336C2:
		mov	ax, 1

loc_336C5:
		leave
		retf
sub_33602		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_336C7		proc far

arg_0		= word ptr  6

		enter	0, 0
		push	di
		push	si
		mov	dx, word_4D29A
		mov	bx, [bp+arg_0]
		mov	es, bx
		mov	cx, es:0
		mov	di, es:6
		mov	fs, di
		cmp	di, es:4
		jnz	short loc_33703
		cmp	di, bx
		jz	loc_337C8
		mov	word_4D29A, bx
		cmp	cx, fs:0
		jbe	loc_337C8
		mov	word_4D29A, di
		jmp	loc_337C8

loc_33703:
		cmp	cx, fs:0
		jbe	short loc_3370E
		cmp	di, dx
		jnz	short loc_33724

loc_3370E:
		mov	di, es:4
		mov	fs, di
		cmp	cx, fs:0
		jnb	loc_337C8
		cmp	bx, dx
		jz	loc_337C8

loc_33724:
		push	di
		push	bx
		push	cx
		push	es
		push	fs
		mov	ax, bx
		mov	es, ax
		cmp	es:4, ax
		jnz	short loc_3373D
		mov	word_4D29A, 0
		jmp	short loc_33764

loc_3373D:
		mov	dx, word_4D29A
		cmp	ax, dx
		jnz	short loc_3374C
		mov	ax, es:6
		mov	word_4D29A, ax

loc_3374C:
		mov	bx, es:4
		mov	cx, es:6
		mov	es, bx
		mov	es:6, cx
		mov	es, cx
		mov	es:4, bx

loc_33764:
		pop	fs
		pop	es
		pop	cx
		pop	bx
		pop	di
		mov	dx, word_4D29A
		cmp	es:4, di
		jz	short loc_3378B

loc_33775:
		mov	si, di
		mov	di, fs:6
		mov	fs, di
		cmp	di, dx
		jz	short loc_337A3
		cmp	fs:0, cx
		jnb	short loc_337A3
		jmp	short loc_33775

loc_3378B:
		mov	si, di
		mov	di, fs:4
		mov	fs, di
		cmp	si, dx
		jz	short loc_3379F
		cmp	fs:0, cx
		ja	short loc_3378B

loc_3379F:
		xchg	di, si
		mov	fs, di

loc_337A3:
		mov	gs, si
		mov	es:4, si
		mov	es:6, di
		mov	gs:6, bx
		mov	fs:4, bx
		mov	di, dx
		mov	fs, di
		cmp	cx, fs:0
		jnb	short loc_337C8
		mov	word_4D29A, bx

loc_337C8:
		pop	si
		pop	di
		leave
		retf
sub_336C7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; DisplayCache_Helper_2C859 (sub_2C859 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à DisplayCache_Helper_5D76B (sub_5D76B de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée directement par
; UIScreen_RenderGraphVGA (sub_509EE, seg113) et TextRenderer_ReleaseCachedGlyph (sub_5CA9E,
; seg132).
; ==============================================================================================
DisplayCache_Helper_337CC		proc far
		enter	2, 0
		xor	cx, cx
		xor	eax, eax
		mov	bx, word_4D29A
		mov	es, bx
		mov	dx, bx

loc_337DD:
		inc	cx
		cmp	cx, 3E8h
		jb	short loc_337E9
		xor	eax, eax
		jmp	short loc_33801

loc_337E9:
		mov	bx, es:6
		mov	es, bx
		add	ax, es:0
		cmp	bx, dx
		jnz	short loc_337DD
		shl	eax, 4
		sub	eax, 4

loc_33801:
		shld	edx, eax, 10h
		leave
		retf
DisplayCache_Helper_337CC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33808		proc far

var_2		= word ptr -2

		enter	2, 0
		mov	[bp+var_2], 0
		mov	bx, word_4D29D
		or	bx, bx
		jz	loc_338C8

loc_3381B:
		mov	es, bx
		xor	ax, ax
		or	es:2, ax
		jnz	loc_338BC

loc_33828:
		mov	ax, bx
		mov	cx, es:0
		or	cx, cx
		jge	short loc_33835
		neg	cx

loc_33835:
		add	ax, cx
		mov	fs, ax
		cmp	word ptr fs:0, 0FFFFh
		jnz	short loc_3384A
		cmp	word ptr fs:4, 1209h
		jz	short loc_33895

loc_3384A:
		cmp	fs:2, bx
		jz	short loc_33853
		jmp	short loc_338BC

loc_33853:
		cmp	cx, es:0
		jnz	short loc_33880
		mov	gs, es:6
		cmp	bx, gs:4
		jz	short loc_33874

loc_33866:
		cmp	word ptr gs:0, 0
		jge	short loc_338BC
		mov	ax, gs
		mov	es, ax
		jmp	short loc_338BC

loc_33874:
		mov	gs, es:4
		cmp	bx, gs:6
		jnz	short loc_33866

loc_33880:
		mov	bx, fs
		mov	es, bx
		cmp	word ptr es:0, 0FFFFh
		jnz	short loc_33828
		cmp	word ptr es:4, 1209h
		jnz	short loc_33828

loc_33895:
		inc	[bp+var_2]
		cmp	[bp+var_2], 2
		ja	short loc_338C8
		jz	short loc_338AE
		cmp	word_4D29F, 0
		jz	short loc_338C8
		mov	bx, word_4D29F
		jmp	loc_3381B

loc_338AE:
		cmp	word_4D2A1, 0
		jz	short loc_338C8
		mov	bx, word_4D2A1
		jmp	loc_3381B

loc_338BC:
		mov	ax, 1407h
		push	ax
		call	sub_13451
		add	sp, 2

loc_338C8:
		leave
		retf
sub_33808		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedResourceB_Helper_5D859 (sub_5D859 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée par sub_14279 (proche de
; UIScreen_Construct, seg114).
; ==============================================================================================
PagedResourceB_Helper_338CA		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= byte ptr  6

		enter	0Ch, 0
		push	di
		mov	al, [bp+arg_0]
		shl	ax, 8
		mov	al, [bp+arg_0]
		push	ax
		shl	eax, 10h
		pop	ax
		mov	bx, word_4D29A
		mov	es, bx

loc_338E4:
		mov	bx, es:6
		mov	es, bx
		movzx	ecx, word ptr es:0
		shl	ecx, 4
		mov	[bp+var_4], ecx
		mov	edx, es:0
		mov	[bp+var_8], edx
		mov	edx, es:4
		mov	[bp+var_C], edx

loc_3390E:
		mov	ecx, [bp+var_4]
		test	ecx, 0FFFF0000h
		jnz	short loc_33924
		sub	[bp+var_4], ecx
		shr	cx, 2
		jmp	short loc_3392F

loc_33924:
		sub	[bp+var_4], 10000h
		mov	cx, 4000h

loc_3392F:
		xor	di, di
		rep stosd
		mov	dx, es
		add	dx, 1000h
		mov	es, dx
		cmp	[bp+var_4], 0
		jnz	short loc_3390E
		mov	es, bx
		mov	edx, [bp+var_8]
		mov	es:0, edx
		mov	edx, [bp+var_C]
		mov	es:4, edx
		cmp	bx, word_4D29A
		jnz	short loc_338E4
		pop	di
		leave
		retf
PagedResourceB_Helper_338CA		endp

; ----------------------------------------------------------------------

sub_33962		proc far
		mov	ah, 48h
		mov	bx, 0FFFFh
		int	21h
		jnb	short loc_33977
		mov	ah, 48h
		int	21h
		jb	short loc_33982
		cmp	ax, word_48B44
		jb	short loc_33982

loc_33977:
		push	bx
		push	ax
		push	cs
		call	near ptr sub_332A2
		add	sp, 4
		jmp	short loc_33984

loc_33982:
		xor	ax, ax

loc_33984:
		retf
sub_33962		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33985		proc far

arg_0		= dword ptr  6

		enter	0, 0
		cmp	word_4D29A, 0
		jnz	short loc_33998
		push	cs
		call	near ptr sub_33962
		or	ax, ax
		jz	short loc_339A9

loc_33998:
		push	0
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_333D9
		add	sp, 8
		jmp	short loc_339AD

loc_339A9:
		xor	ax, ax
		xor	dx, dx

loc_339AD:
		leave
		retf
sub_33985		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_339AF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		movzx	edx, [bp+arg_2]
		movzx	eax, [bp+arg_0]
		shl	edx, 4
		add	edx, eax
		shr	edx, 4
		jz	short loc_339D2
		push	dx
		push	cs
		call	near ptr sub_3351E
		add	sp, 2

loc_339D2:
		leave
		retf
sub_339AF		endp

; ----------------------------------------------------------------------

sub_339D4		proc far
		push	di
		xor	eax, eax
		mov	cx, 3E8h
		mov	bx, word_4D29A
		or	bx, bx
		jz	short loc_33A0D
		mov	di, bx

loc_339E5:
		mov	es, bx
		mov	dx, es:0
		cmp	dx, ax
		jbe	short loc_339F2
		mov	ax, dx

loc_339F2:
		mov	bx, es:6
		cmp	di, bx
		jz	short loc_339FE
		dec	cx
		jnz	short loc_339E5

loc_339FE:
		shl	eax, 4
		sub	eax, 4
		shld	edx, eax, 10h
		jmp	short loc_33A11

loc_33A0D:
		xor	ax, ax
sub_339D4		endp

; START OF FUNCTION CHUNK FOR sub_339D4
		db 33h
; END OF FUNCTION CHUNK FOR sub_339D4
seg104		ends
