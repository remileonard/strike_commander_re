seg106		segment	para public 'CODE' use16
		assume cs:seg106
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45212		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		movzx	eax, [bp+arg_2]
		or	ax, ax
		jge	short loc_45243
		sub	ax, 7FFDh
		push	ax
		push	[bp+arg_0]
		add	[bp+arg_0], ax
		sub	[bp+arg_2], ax
		push	cs
		call	near ptr sub_45212
		add	sp, 4
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_45212
		add	sp, 4
		jmp	loc_45347

loc_45243:
		cmp	ax, 2
		ja	short loc_4524D
		mov	ax, 1401h
		jmp	short loc_45260

loc_4524D:
		movzx	ebx, [bp+arg_0]
		add	eax, ebx
		test	eax, 0FFFF0000h
		jz	short loc_4526C
		mov	ax, 1402h

loc_45260:
		push	ax
		call	sub_9D47
		add	sp, 2
		jmp	loc_45347

loc_4526C:
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
		cmp	word_5DC70, 0
		jnz	short loc_452D7
		mov	word_5DC70, ax
		mov	es:4, ax
		mov	es:6, ax
		jmp	short loc_45325

loc_452D7:
		mov	bx, word_5DC70
		mov	fs, bx
		mov	dx, fs
		mov	cx, es:0
		cmp	cx, fs:0
		jnb	short loc_452F1
		mov	word_5DC70, es
		jmp	short loc_45303

loc_452F1:
		mov	fs, fs:6
		mov	ax, fs
		cmp	ax, dx
		jz	short loc_45303
		cmp	cx, fs:0
		ja	short loc_452F1

loc_45303:
		mov	bx, fs:4
		mov	fs, bx
		mov	es:6, bx
		mov	bx, fs:4
		mov	es:4, bx
		mov	gs, bx
		mov	fs:4, es
		mov	gs:6, es

loc_45325:
		mov	ax, [bp+arg_0]
		dec	ax
		cmp	word_5DC73, 0
		jnz	short loc_45335
		mov	word_5DC73, ax
		jmp	short loc_45344

loc_45335:
		cmp	word_5DC75, 0
		jnz	short loc_45341
		mov	word_5DC75, ax
		jmp	short loc_45344

loc_45341:
		mov	word_5DC77, ax

loc_45344:
		mov	ax, 1

loc_45347:
		leave
		retf
sub_45212		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45349		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		enter	0, 0
		push	si
		push	di
		mov	di, [bp+arg_6]
		xor	si, si
		or	di, di
		jnz	short loc_4536D
		push	1
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_45349
		add	sp, 8
		or	dx, dx
		jnz	loc_45481

loc_4536D:
		pushf

loc_4536E:
		cmp	byte_5DC79, 0
		jnz	short loc_4536E
		cli
		cmp	byte_5DC79, 0
		jz	short loc_45380
		popf
		jmp	short loc_4536D

loc_45380:
		mov	si, 1
		mov	byte_5DC79, 1
		popf
		mov	eax, [bp+arg_0]
		or	eax, eax
		jz	loc_45429
		add	eax, 13h
		shr	eax, 4
		or	ax, ax
		jle	loc_45433
		mov	bx, word_5DC70
		or	bx, bx
		jz	loc_4542E
		mov	es, bx
		mov	dx, bx

loc_453B0:
		or	di, di
		jz	short loc_453D0
		jl	short loc_453C4
		cmp	bx, word_59E3D
		jbe	short loc_453D0
		cmp	bx, 0A000h
		jb	short loc_453D9
		jmp	short loc_453D0

loc_453C4:
		cmp	bx, 0A000h
		jnb	short loc_453D9
		cmp	bx, word_59E3D
		jbe	short loc_453D9

loc_453D0:
		mov	cx, es:0
		sub	cx, ax
		jge	short loc_453E9

loc_453D9:
		mov	bx, es:6
		mov	es, bx
		cmp	dx, bx
		jnz	short loc_453B0
		mov	ax, 1403h
		jmp	short loc_45436

loc_453E9:
		or	cx, cx
		jnz	short loc_45450
		mov	dx, es:4
		cmp	bx, dx
		jnz	short loc_453FE
		mov	word_5DC70, 0
		jmp	short loc_45420

loc_453FE:
		cmp	bx, word_5DC70
		jnz	short loc_4540D
		mov	bx, es:6
		mov	word_5DC70, bx

loc_4540D:
		mov	fs, dx
		mov	bx, es:6
		mov	fs:6, bx
		mov	fs, bx
		mov	fs:4, dx

loc_45420:
		neg	word ptr es:0
		mov	dx, es
		jmp	short loc_4547E

loc_45429:
		mov	ax, 1404h
		jmp	short loc_45436

loc_4542E:
		mov	ax, 1406h
		jmp	short loc_45436

loc_45433:
		mov	ax, 1405h

loc_45436:
		cmp	[bp+arg_4], 0
		jz	short loc_4544A
		mov	byte_5DC79, 0
		push	ax
		call	sub_9D47
		add	sp, 2

loc_4544A:
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_45481

loc_45450:
		mov	es:0, cx
		push	ax
		push	bx
		push	cx
		push	es
		push	cs
		call	near ptr sub_45637
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

loc_4547E:
		mov	ax, 4

loc_45481:
		or	si, si
		jz	short loc_4548A
		mov	byte_5DC79, 0

loc_4548A:
		pop	di
		pop	si
		leave
		retf
sub_45349		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4548E		proc far

arg_0		= word ptr  6

		enter	0, 0
		push	si
		xor	si, si

loc_45495:
		pushf

loc_45496:
		cmp	byte_5DC79, 0
		jnz	short loc_45496
		cli
		cmp	byte_5DC79, 0
		jz	short loc_454A8
		popf
		jmp	short loc_45495

loc_454A8:
		mov	byte_5DC79, 1
		mov	si, 1
		popf
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_45572
		add	sp, 2
		or	ax, ax
		jz	loc_45566
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	ax, es:2
		or	ax, ax
		jz	short loc_454F8
		mov	fs, ax
		cmp	word ptr fs:0, 0
		jle	short loc_454F8
		mov	ax, es:0
		sub	fs:0, ax
		mov	ax, fs
		add	ax, fs:0
		mov	es, ax
		mov	es:2, fs
		push	fs
		push	cs
		call	near ptr sub_45637
		pop	cx
		jmp	short loc_45566

loc_454F8:
		mov	ax, [bp+arg_0]
		mov	es, ax
		neg	word ptr es:0
		mov	es, ax
		cmp	word_5DC70, 0
		jnz	short loc_45518
		mov	word_5DC70, ax
		mov	es:4, ax
		mov	es:6, ax
		jmp	short loc_45566

loc_45518:
		mov	bx, word_5DC70
		mov	fs, bx
		mov	dx, fs
		mov	cx, es:0
		cmp	cx, fs:0
		jnb	short loc_45532
		mov	word_5DC70, es
		jmp	short loc_45544

loc_45532:
		mov	fs, fs:6
		mov	ax, fs
		cmp	ax, dx
		jz	short loc_45544
		cmp	cx, fs:0
		ja	short loc_45532

loc_45544:
		mov	bx, fs:4
		mov	fs, bx
		mov	es:6, bx
		mov	bx, fs:4
		mov	es:4, bx
		mov	gs, bx
		mov	fs:4, es
		mov	gs:6, es

loc_45566:
		or	si, si
		jz	short loc_4556F
		mov	byte_5DC79, 0

loc_4556F:
		pop	si
		leave
		retf
sub_4548E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45572		proc far

arg_0		= word ptr  6

		enter	0, 0
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	bx, es:0
		or	bx, bx
		jge	short loc_455AD
		neg	bx
		add	bx, ax
		mov	fs, bx
		cmp	fs:2, ax
		jnz	short loc_455AD
		mov	bx, es:2
		or	bx, bx
		jz	short loc_455C6
		mov	fs, bx
		mov	cx, fs:0
		or	cx, cx
		jge	short loc_455A7
		neg	cx

loc_455A7:
		add	bx, cx
		cmp	ax, bx
		jz	short loc_455C6

loc_455AD:
		mov	byte_5DC79, 0
		push	cs
		call	near ptr sub_45778
		mov	ax, 1409h
		push	ax
		call	sub_9D47
		add	sp, 2
		xor	ax, ax
		jmp	short loc_45635

loc_455C6:
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	bx, es:0
		neg	bx
		mov	dx, bx
		add	dx, ax
		mov	fs, dx
		mov	cx, fs:0
		or	cx, cx
		jle	short loc_45632
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
		jnz	short loc_4560B
		mov	word_5DC70, 0
		jmp	short loc_45632

loc_4560B:
		mov	dx, word_5DC70
		cmp	ax, dx
		jnz	short loc_4561A
		mov	ax, es:6
		mov	word_5DC70, ax

loc_4561A:
		mov	bx, es:4
		mov	cx, es:6
		mov	es, bx
		mov	es:6, cx
		mov	es, cx
		mov	es:4, bx

loc_45632:
		mov	ax, 1

loc_45635:
		leave
		retf
sub_45572		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45637		proc far

arg_0		= word ptr  6

		enter	0, 0
		push	di
		push	si
		mov	dx, word_5DC70
		mov	bx, [bp+arg_0]
		mov	es, bx
		mov	cx, es:0
		mov	di, es:6
		mov	fs, di
		cmp	di, es:4
		jnz	short loc_45673
		cmp	di, bx
		jz	loc_45738
		mov	word_5DC70, bx
		cmp	cx, fs:0
		jbe	loc_45738
		mov	word_5DC70, di
		jmp	loc_45738

loc_45673:
		cmp	cx, fs:0
		jbe	short loc_4567E
		cmp	di, dx
		jnz	short loc_45694

loc_4567E:
		mov	di, es:4
		mov	fs, di
		cmp	cx, fs:0
		jnb	loc_45738
		cmp	bx, dx
		jz	loc_45738

loc_45694:
		push	di
		push	bx
		push	cx
		push	es
		push	fs
		mov	ax, bx
		mov	es, ax
		cmp	es:4, ax
		jnz	short loc_456AD
		mov	word_5DC70, 0
		jmp	short loc_456D4

loc_456AD:
		mov	dx, word_5DC70
		cmp	ax, dx
		jnz	short loc_456BC
		mov	ax, es:6
		mov	word_5DC70, ax

loc_456BC:
		mov	bx, es:4
		mov	cx, es:6
		mov	es, bx
		mov	es:6, cx
		mov	es, cx
		mov	es:4, bx

loc_456D4:
		pop	fs
		pop	es
		pop	cx
		pop	bx
		pop	di
		mov	dx, word_5DC70
		cmp	es:4, di
		jz	short loc_456FB

loc_456E5:
		mov	si, di
		mov	di, fs:6
		mov	fs, di
		cmp	di, dx
		jz	short loc_45713
		cmp	fs:0, cx
		jnb	short loc_45713
		jmp	short loc_456E5

loc_456FB:
		mov	si, di
		mov	di, fs:4
		mov	fs, di
		cmp	si, dx
		jz	short loc_4570F
		cmp	fs:0, cx
		ja	short loc_456FB

loc_4570F:
		xchg	di, si
		mov	fs, di

loc_45713:
		mov	gs, si
		mov	es:4, si
		mov	es:6, di
		mov	gs:6, bx
		mov	fs:4, bx
		mov	di, dx
		mov	fs, di
		cmp	cx, fs:0
		jnb	short loc_45738
		mov	word_5DC70, bx

loc_45738:
		pop	si
		pop	di
		leave
		retf
sub_45637		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; DisplayCache_Helper_6616A (sub_6616A de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à DisplayCache_Helper_2C859 (sub_2C859 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à DisplayCache_Helper_5D76B (sub_5D76B de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée
; directement par UIScreen_RenderGraphVGA (sub_509EE, seg113) et
; TextRenderer_ReleaseCachedGlyph (sub_5CA9E, seg132).
; ==============================================================================================
DisplayCache_Helper_4573C		proc far
		enter	2, 0
		xor	cx, cx
		xor	eax, eax
		mov	bx, word_5DC70
		mov	es, bx
		mov	dx, bx

loc_4574D:
		inc	cx
		cmp	cx, 3E8h
		jb	short loc_45759
		xor	eax, eax
		jmp	short loc_45771

loc_45759:
		mov	bx, es:6
		mov	es, bx
		add	ax, es:0
		cmp	bx, dx
		jnz	short loc_4574D
		shl	eax, 4
		sub	eax, 4

loc_45771:
		shld	edx, eax, 10h
		leave
		retf
DisplayCache_Helper_4573C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45778		proc far

var_2		= word ptr -2

		enter	2, 0
		mov	[bp+var_2], 0
		mov	bx, word_5DC73
		or	bx, bx
		jz	loc_45838

loc_4578B:
		mov	es, bx
		xor	ax, ax
		or	es:2, ax
		jnz	loc_4582C

loc_45798:
		mov	ax, bx
		mov	cx, es:0
		or	cx, cx
		jge	short loc_457A5
		neg	cx

loc_457A5:
		add	ax, cx
		mov	fs, ax
		cmp	word ptr fs:0, 0FFFFh
		jnz	short loc_457BA
		cmp	word ptr fs:4, 1209h
		jz	short loc_45805

loc_457BA:
		cmp	fs:2, bx
		jz	short loc_457C3
		jmp	short loc_4582C

loc_457C3:
		cmp	cx, es:0
		jnz	short loc_457F0
		mov	gs, es:6
		cmp	bx, gs:4
		jz	short loc_457E4

loc_457D6:
		cmp	word ptr gs:0, 0
		jge	short loc_4582C
		mov	ax, gs
		mov	es, ax
		jmp	short loc_4582C

loc_457E4:
		mov	gs, es:4
		cmp	bx, gs:6
		jnz	short loc_457D6

loc_457F0:
		mov	bx, fs
		mov	es, bx
		cmp	word ptr es:0, 0FFFFh
		jnz	short loc_45798
		cmp	word ptr es:4, 1209h
		jnz	short loc_45798

loc_45805:
		inc	[bp+var_2]
		cmp	[bp+var_2], 2
		ja	short loc_45838
		jz	short loc_4581E
		cmp	word_5DC75, 0
		jz	short loc_45838
		mov	bx, word_5DC75
		jmp	loc_4578B

loc_4581E:
		cmp	word_5DC77, 0
		jz	short loc_45838
		mov	bx, word_5DC77
		jmp	loc_4578B

loc_4582C:
		mov	ax, 1407h
		push	ax
		call	sub_9D47
		add	sp, 2

loc_45838:
		leave
		retf
sub_45778		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PagedResourceB_Helper_66268 (sub_66268 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à PagedResourceB_Helper_5D859 (sub_5D859 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée par sub_14279 (proche
; de UIScreen_Construct, seg114).
; ==============================================================================================
PagedResourceB_Helper_4583A		proc far

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
		mov	bx, word_5DC70
		mov	es, bx

loc_45854:
		mov	bx, es:6
		mov	es, bx
		movzx	ecx, word ptr es:0
		shl	ecx, 4
		mov	[bp+var_4], ecx
		mov	edx, es:0
		mov	[bp+var_8], edx
		mov	edx, es:4
		mov	[bp+var_C], edx

loc_4587E:
		mov	ecx, [bp+var_4]
		test	ecx, 0FFFF0000h
		jnz	short loc_45894
		sub	[bp+var_4], ecx
		shr	cx, 2
		jmp	short loc_4589F

loc_45894:
		sub	[bp+var_4], 10000h
		mov	cx, 4000h

loc_4589F:
		xor	di, di
		rep stosd
		mov	dx, es
		add	dx, 1000h
		mov	es, dx
		cmp	[bp+var_4], 0
		jnz	short loc_4587E
		mov	es, bx
		mov	edx, [bp+var_8]
		mov	es:0, edx
		mov	edx, [bp+var_C]
		mov	es:4, edx
		cmp	bx, word_5DC70
		jnz	short loc_45854
		pop	di
		leave
		retf
PagedResourceB_Helper_4583A		endp

; ----------------------------------------------------------------------

sub_458D2		proc far
		mov	ah, 48h
		mov	bx, 0FFFFh
		int	21h
		jnb	short loc_458E7
		mov	ah, 48h
		int	21h
		jb	short loc_458F2
		cmp	ax, word_59E3D
		jb	short loc_458F2

loc_458E7:
		push	bx
		push	ax
		push	cs
		call	near ptr sub_45212
		add	sp, 4
		jmp	short loc_458F4

loc_458F2:
		xor	ax, ax

loc_458F4:
		retf
sub_458D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_458F5		proc far

arg_0		= dword ptr  6

		enter	0, 0
		cmp	word_5DC70, 0
		jnz	short loc_45908
		push	cs
		call	near ptr sub_458D2
		or	ax, ax
		jz	short loc_45919

loc_45908:
		push	0
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_45349
		add	sp, 8
		jmp	short loc_4591D

loc_45919:
		xor	ax, ax
		xor	dx, dx

loc_4591D:
		leave
		retf
sub_458F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4591F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		movzx	edx, [bp+arg_2]
		movzx	eax, [bp+arg_0]
		shl	edx, 4
		add	edx, eax
		shr	edx, 4
		jz	short loc_45942
		push	dx
		push	cs
		call	near ptr sub_4548E
		add	sp, 2

loc_45942:
		leave
		retf
sub_4591F		endp

; ----------------------------------------------------------------------

sub_45944		proc far
		push	di
		xor	eax, eax
		mov	cx, 3E8h
		mov	bx, word_5DC70
		or	bx, bx
		jz	short loc_4597D
		mov	di, bx

loc_45955:
		mov	es, bx
		mov	dx, es:0
		cmp	dx, ax
		jbe	short loc_45962
		mov	ax, dx

loc_45962:
		mov	bx, es:6
		cmp	di, bx
		jz	short loc_4596E
		dec	cx
		jnz	short loc_45955

loc_4596E:
		shl	eax, 4
		sub	eax, 4
		shld	edx, eax, 10h
		jmp	short loc_45981

loc_4597D:
		xor	ax, ax
sub_45944		endp

; START OF FUNCTION CHUNK FOR sub_45944
		db 33h
; END OF FUNCTION CHUNK FOR sub_45944
seg106		ends
