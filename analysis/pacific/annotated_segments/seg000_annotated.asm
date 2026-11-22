seg000		segment	para public 'CODE' use16
		assume cs:seg000
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

		public start
start		proc near
		mov	dx, seg dseg
		mov	cs:309h, dx
		mov	ah, 30h
		int	21h
		mov	bp, word_76732
		mov	bx, word_7675C
		mov	ds, dx
		mov	word_7684E, ax
		mov	word_7684C, es
		mov	word_76848, bx
		mov	word_76864, bp
		call	sub_1F4
		mov	ax, word_76848
		mov	es, ax
		xor	ax, ax
		mov	bx, ax
		mov	di, ax
		mov	cx, 7FFFh
		cld

loc_37:
		repne scasb
		jcxz	short loc_9C
		inc	bx
		cmp	es:[di], al
		jnz	short loc_37
		or	ch, 80h
		neg	cx
		mov	word_76846, cx
		mov	cx, 1
		shl	bx, cl
		add	bx, 8
		and	bx, 0FFF8h
		mov	word_7684A, bx
		mov	dx, ds
		sub	bp, dx
		mov	di, word_76D41
		cmp	di, 200h
		jnb	short loc_6E
		mov	di, 200h
		mov	word_76D41, di

loc_6E:
		add	di, 6D4Ch
		jb	short loc_9C
		add	di, word_7BF6E
		jb	short loc_9C
		mov	cl, 4
		shr	di, cl
		inc	di
		cmp	bp, di
		jb	short loc_9C
		cmp	word_76D41, 0
		jz	short loc_91
		cmp	word_7BF6E, 0
		jnz	short loc_9F

loc_91:
		mov	di, 1000h
		cmp	bp, di
		ja	short loc_9F
		mov	di, bp
		jmp	short loc_9F

loc_9C:
		jmp	sub_2F1

loc_9F:
		mov	bx, di
		add	bx, dx
		mov	word_7685C, bx
		mov	word_76860, bx
		mov	ax, word_7684C
		sub	bx, ax
		mov	es, ax
		mov	ah, 4Ah
		push	di
		int	21h
		pop	di
		shl	di, cl
		cli
		mov	ss, dx
		mov	sp, di
		sti
		xor	ax, ax
		mov	es, cs:309h
		mov	di, 5CC4h
		mov	cx, 6D4Ch
		sub	cx, di
		cld
		rep stosb
		cmp	word_7BF44, 14h
		jbe	short loc_120
		cmp	byte ptr word_7684E, 3
		jb	short loc_120
		ja	short loc_E9
		cmp	byte_7684F, 1Eh
		jb	short loc_120

loc_E9:
		mov	ax, 5801h
		mov	bx, 2
		int	21h
		jb	short loc_11D
		mov	ah, 67h
		mov	bx, word_7BF44
		int	21h
		jb	short loc_11D
		mov	ah, 48h
		mov	bx, 1
		int	21h
		jb	short loc_11D
		inc	ax
		mov	word_76864, ax
		dec	ax
		mov	es, ax
		mov	ah, 49h
		int	21h
		jb	short loc_11D
		mov	ax, 5801h
		mov	bx, 0
		int	21h
		jnb	short loc_120

loc_11D:
		jmp	sub_2F1

loc_120:
		mov	ah, 0
		int	1Ah
		mov	word_76852, dx
		mov	word_76854, cx
		or	al, al
		jz	short loc_13C
		mov	ax, 40h
		mov	es, ax
		mov	bx, 70h
		mov	byte ptr es:[bx], 1

loc_13C:
		mov	ax, seg seg001
		mov	es, ax
		mov	bx, 3E4h
		mov	byte ptr es:[bx], 9Ah
		mov	word ptr es:[bx+1], 30Dh
		mov	es:[bx+3], cs
		mov	byte ptr es:[bx+5], 0C3h
		mov	bx, seg seg000
		mov	es, bx
		mov	bx, 1FDCh
		mov	byte ptr es:[bx+3Fh], 0EBh
		xor	bp, bp
		push	ds
		mov	ds, cs:309h
		call	sub_9428
		pop	ds
		mov	es, cs:309h
		mov	si, 5A84h
		mov	di, 5BE6h
		call	sub_264
		push	word_76844
		push	word_76842
		push	word_76840
		call	sub_73050
		push	ax
		nop
		push	cs
		call	near ptr CRT_Exit
start		endp

; ----------------------------------------------------------------------

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Ovl_CopyStubTable (sub_163 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Ovl_CopyStubTable (sub_163 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — copie mémoire (memcpy-like via sub_264)
; 4EC8h→4F64h : init table du overlay manager.
; ==============================================================================================
Ovl_CopyStubTable		proc far
		mov	es, cs:309h
		push	si
		push	di
		mov	si, 5BE6h
		mov	di, 5CC4h
		call	sub_2A8
		pop	di
		pop	si
		retf
Ovl_CopyStubTable		endp

; ----------------------------------------------------------------------

sub_1AA		proc far
		push	si
		push	di
		mov	es, cs:309h
		xor	ax, ax
		mov	si, ax
		mov	cx, 2Fh
		nop

loc_1B9:
		add	al, es:[si]
		adc	ah, 0
		inc	si
		loop	short loc_1B9
		sub	ax, 0D5Ch
		nop
		jz	short loc_1D2
		mov	cx, 19h
		nop
		mov	dx, 2Fh
		call	sub_2E9

loc_1D2:
		pop	di
		pop	si
		retf
sub_1AA		endp

; ----------------------------------------------------------------------

sub_1D5		proc near
		mov	bp, sp
		push	ds
		mov	ds, cs:309h
		call	sub_94F2
		pop	ds
		mov	ah, 4Ch
		mov	al, [bp+4]
		int	21h
		mov	cx, 0Eh
		nop
		mov	dx, 48h
		jmp	loc_2F8
sub_1D5		endp

; ----------------------------------------------------------------------

sub_1F4		proc near
		push	ds
		mov	ax, 3500h
		int	21h
		mov	word_76830, bx
		mov	word_76832, es
		mov	ax, 3504h
		int	21h
		mov	word_76834, bx
		mov	word_76836, es
		mov	ax, 3505h
		int	21h
		mov	word_76838, bx
		mov	word_7683A, es
		mov	ax, 3506h
		int	21h
		mov	word_7683C, bx
		mov	word_7683E, es
		mov	ax, 2500h
		mov	dx, cs
		mov	ds, dx
		mov	dx, 1EAh
		int	21h
		pop	ds
		ret
sub_1F4		endp

; ----------------------------------------------------------------------

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_RestoreIntVectors
; (sub_1F7 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s)
; (adresses de données ou constantes) — à vérifier à CRT_RestoreIntVectors (sub_1F3 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; restaure les vecteurs d'interruption sauvegardés par sub_1B0 (INT21 AH=25h), cleanup à
; l'exit.
; ==============================================================================================
CRT_RestoreIntVectors		proc far
		push	ds
		mov	ax, 2500h
		lds	dx, word_76830
		int	21h
		pop	ds
		push	ds
		mov	ax, 2504h
		lds	dx, word_76834
		int	21h
		pop	ds
		push	ds
		mov	ax, 2505h
		lds	dx, word_76838
		int	21h
		pop	ds
		push	ds
		mov	ax, 2506h
		lds	dx, word_7683C
		int	21h
		pop	ds
		retf
CRT_RestoreIntVectors		endp

; ----------------------------------------------------------------------

sub_264		proc near
		mov	ax, 100h
		mov	dx, di
		mov	bx, si

loc_26B:
		cmp	bx, di
		jz	short loc_288
		cmp	byte ptr es:[bx], 0FFh
		jz	short loc_283
		mov	cl, es:[bx+1]
		xor	ch, ch
		cmp	cx, ax
		jnb	short loc_283
		mov	ax, cx
		mov	dx, bx

loc_283:
		add	bx, 6
		jmp	short loc_26B

loc_288:
		cmp	dx, di
		jz	short loc_2A7
		mov	bx, dx
		cmp	byte ptr es:[bx], 0
		mov	byte ptr es:[bx], 0FFh
		push	es
		jz	short loc_2A0
		call	dword ptr es:[bx+2]
		pop	es
		jmp	short sub_264

loc_2A0:
		call	word ptr es:[bx+2]
		pop	es
		jmp	short sub_264

loc_2A7:
		ret
sub_264		endp

; ----------------------------------------------------------------------

sub_2A8		proc near
		mov	ah, 0
		mov	dx, di
		mov	bx, si

loc_2AE:
		cmp	bx, di
		jz	short loc_2C9
		cmp	byte ptr es:[bx], 0FFh
		jz	short loc_2C4
		cmp	es:[bx+1], ah
		jb	short loc_2C4
		mov	ah, es:[bx+1]
		mov	dx, bx

loc_2C4:
		add	bx, 6
		jmp	short loc_2AE

loc_2C9:
		cmp	dx, di
		jz	short loc_2E8
		mov	bx, dx
		cmp	byte ptr es:[bx], 0
		mov	byte ptr es:[bx], 0FFh
		push	es
		jz	short loc_2E1
		call	dword ptr es:[bx+2]
		pop	es
		jmp	short sub_2A8

loc_2E1:
		call	word ptr es:[bx+2]
		pop	es
		jmp	short sub_2A8

loc_2E8:
		ret
sub_2A8		endp

; ----------------------------------------------------------------------

sub_2E9		proc near
		mov	ah, 40h
		mov	bx, 2
		int	21h
		ret
sub_2E9		endp

; ----------------------------------------------------------------------

sub_2F1		proc far
		mov	cx, 1Eh
		nop
		mov	dx, 56h

loc_2F8:
		mov	ds, cs:309h
		call	sub_2E9
		mov	ax, 3
		push	ax
		nop
		push	cs
		call	near ptr CRT_Abort
		add	[bx+si], al
		add	al, [bx+si+2C8h]
		add	[bx+si], al
		push	ds
		push	es
		clc
		pushf
		push	si
		push	di
		push	word_767E8
		push	cx
		push	dx
		push	di
		push	si
		push	ax
		push	0
		sti
		push	seg dseg
		pop	ds
		call	sub_4492
		pop	di
		pop	si
		sub	di, dx
		jnz	short loc_33A
		nop
		nop
		sub	si, ax
		jz	short loc_33D
		nop
		nop

loc_33A:
		popf
		stc
		pushf

loc_33D:
		popf
		pop	es
		pop	ds
		leave
		retf
sub_2F1		endp

; START OF FUNCTION CHUNK FOR sub_2F1
		push	dx
		jnz	short loc_3B3
		jz	short loc_3B0
		insw
		and	gs:[bx+76h], ch
		jb	loc_3BB
		popaw
		jns	short loc_372
		jb	loc_3C7
		outsw
		jb	short loc_365
		db 0Ah
; END OF FUNCTION CHUNK FOR sub_2F1

; ----------------------------------------------------------------------

sub_359		proc far
		mov	cx, 17h
		mov	dx, 342h
		push	cs
		pop	ds
		mov	ah, 40h
		mov	bx, 2
		int	21h
		mov	ax, 4
		push	ax
		mov	ax, seg dseg
		mov	ds, ax
		nop

loc_372:
		push	cs
		call	near ptr CRT_Abort
		retf
sub_359		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Abs16_2CD (sub_2CD
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. Valeur absolue d'un entier 16 bits (or ax, ax / jge / neg ax).
; ==============================================================================================
CRT_Abs16_377		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		or	ax, ax
		jge	short loc_383
		neg	ax

loc_383:
		pop	bp
		retf
CRT_Abs16_377		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_385		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	word_7BCF4, 20h
		jnz	short loc_394
		mov	ax, 1
		jmp	short loc_3B0

loc_394:
		mov	bx, word_7BCF4
		mov	cl, 2
		shl	bx, cl
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		mov	[bx+6CBCh], ax
		mov	[bx+6CBAh], dx
		inc	word_7BCF4
		xor	ax, ax

loc_3B0:
		pop	bp
		retf
sub_385		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B2		proc far

arg_0		= word ptr  6

		push	bp

loc_3B3:
		mov	bp, sp
		push	[bp+arg_0]
		call	sub_65A86
		pop	cx
		pop	bp
		retf
sub_3B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, ds
		cmp	[bp+arg_2], ax
		jnz	short loc_3D5
		push	[bp+arg_0]
		call	sub_65A86
		pop	cx
		jmp	short loc_3E2

loc_3D5:
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_6634D
		pop	cx
		pop	cx

loc_3E2:
		pop	bp
		retf
sub_3C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E4		proc far

var_2		= word ptr -2
arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_2]
		mov	dl, [bp+arg_0]
		mov	ah, 36h
		int	21h
		cmp	ax, 0FFFFh
		jnz	short loc_402
		mov	ax, 13h
		mov	word_76850, ax
		jmp	short loc_415

loc_402:
		mov	[bp+var_2], bx
		mov	[si], dx
		mov	[si+4], ax
		mov	[si+6], cx
		mov	ax, [bp+var_2]
		mov	[si+2], ax
		xor	ax, ax

loc_415:
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_3E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_41A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ah, 19h
		int	21h
		mov	ah, 0
		inc	ax
		mov	[si], ax
		pop	si
		pop	bp
		retf
sub_41A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42D		proc far

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_2]
		mov	dl, [bp+arg_0]
		dec	dl
		mov	ah, 0Eh
		int	21h
		mov	ah, 0
		mov	[si], ax
		pop	si
		pop	bp
		retf
sub_42D		endp

; ----------------------------------------------------------------------

sub_444		proc far
		retf
sub_444		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_445		proc near

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		or	si, si
		jnz	short loc_472
		jmp	short loc_462

loc_452:
		dec	word_7BCF4
		mov	bx, word_7BCF4
		mov	cl, 2
		shl	bx, cl
		call	dword ptr [bx+6CBAh]

loc_462:
		cmp	word_7BCF4, 0
		jnz	short loc_452
		nop
		push	cs
		call	near ptr Ovl_CopyStubTable
		call	dword ptr dword_7BDF8

loc_472:
		nop
		push	cs
		call	near ptr CRT_RestoreIntVectors
		nop
		push	cs
		call	near ptr sub_1AA
		cmp	[bp+arg_2], 0
		jnz	short loc_497
		or	si, si
		jnz	short loc_48E
		call	dword ptr dword_7BDFC
		call	dword ptr dword_7BE00

loc_48E:
		push	[bp+arg_0]
		nop
		push	cs
		call	sub_1D5
		pop	cx

loc_497:
		pop	si
		pop	bp
		ret	6
sub_445		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Exit (sub_392 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à CRT_Exit (sub_3C2 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; wrapper exit(code) → sub_36B(0,0,code).
; ==============================================================================================
CRT_Exit		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		push	ax
		push	[bp+arg_0]
		call	sub_445
		pop	bp
		retf
CRT_Exit		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Abort (sub_3A1 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à CRT_Abort (sub_3D1 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; wrapper _exit/abort(code) flag=1 → sub_36B(1,0,code).
; ==============================================================================================
CRT_Abort		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 1
		push	ax
		xor	ax, ax
		push	ax
		push	[bp+arg_0]
		call	sub_445
		pop	bp
		retf
CRT_Abort		endp

; START OF FUNCTION CHUNK FOR CRT_Abort
		xor	ax, ax
		push	ax
		mov	ax, 1
		push	ax
		xor	ax, ax
		push	ax
		call	sub_445
		retf
		mov	ax, 1
		push	ax
		push	ax
		xor	ax, ax
		push	ax
		call	sub_445
		retf
; END OF FUNCTION CHUNK FOR CRT_Abort

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4D7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_66323
		pop	cx
		pop	cx
		pop	bp
		retf
sub_4D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Fmemcpy (sub_3CD de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à CRT_Fmemcpy (sub_3FD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; memcpy générique (rep movsw+movsb) : équivalent _fmemcpy.
; ==============================================================================================
CRT_Fmemcpy		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		lds	si, [bp+arg_0]
		les	di, [bp+arg_4]
		cld
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf	8
CRT_Fmemcpy		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_505		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ah, 2Ah
		int	21h
		mov	[si], cx
		mov	[si+2], dx
		pop	si
		pop	bp
		retf
sub_505		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_518		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ah, 2Ch
		int	21h
		mov	[si], cx
		mov	[si+2], dx
		pop	si
		pop	bp
		retf
sub_518		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_GetVect (sub_40F de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à CRT_GetVect (sub_419 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — wrapper getvect() (INT21
; AH=35h).
; ==============================================================================================
CRT_GetVect		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		mov	ah, 35h
		mov	al, [bp+arg_0]
		int	21h
		xchg	bx, ax
		mov	dx, es
		pop	bp
		retf
CRT_GetVect		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_SetVect (sub_41E de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à CRT_SetVect (sub_428 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; wrapper setvect() (INT21 AH=25h).
; ==============================================================================================
CRT_SetVect		proc far

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ah, 25h
		mov	al, [bp+arg_0]
		push	ds
		lds	dx, [bp+arg_2]
		int	21h
		pop	ds
		pop	bp
		retf
CRT_SetVect		endp

; ----------------------------------------------------------------------

sub_54B		proc near
		pop	cx
		push	cs
		push	cx
		xor	cx, cx
		jmp	short loc_568
sub_54B		endp

; START OF FUNCTION CHUNK FOR sub_54B
		pop	cx
		push	cs
		push	cx
		mov	cx, 1
		jmp	short loc_568
; END OF FUNCTION CHUNK FOR sub_54B

; ----------------------------------------------------------------------

sub_55A		proc far
		pop	cx
		push	cs
		push	cx
		mov	cx, 2
		jmp	short loc_568
		pop	cx
		push	cs
		push	cx
		mov	cx, 3

loc_568:
		push	bp
		push	si
		push	di
		mov	bp, sp
		mov	di, cx
		mov	ax, [bp+0Ah]
		mov	dx, [bp+0Ch]
		mov	bx, [bp+0Eh]
		mov	cx, [bp+10h]
		or	cx, cx
		jnz	short loc_587
		or	dx, dx
		jz	short loc_5EC
		or	bx, bx
		jz	short loc_5EC

loc_587:
		test	di, 1
		jnz	short loc_5A9
		or	dx, dx
		jns	short loc_59B
		neg	dx
		neg	ax
		sbb	dx, 0
		or	di, 0Ch

loc_59B:
		or	cx, cx
		jns	short loc_5A9
		neg	cx
		neg	bx
		sbb	cx, 0
		xor	di, 4

loc_5A9:
		mov	bp, cx
		mov	cx, 20h
		push	di
		xor	di, di
		xor	si, si

loc_5B3:
		shl	ax, 1
		rcl	dx, 1
		rcl	si, 1
		rcl	di, 1
		cmp	di, bp
		jb	short loc_5CA
		ja	short loc_5C5
		cmp	si, bx
		jb	short loc_5CA

loc_5C5:
		sub	si, bx
		sbb	di, bp
		inc	ax

loc_5CA:
		loop	short loc_5B3
		pop	bx
		test	bx, 2
		jz	short loc_5D9
		mov	ax, si
		mov	dx, di
		shr	bx, 1

loc_5D9:
		test	bx, 4
		jz	short loc_5E6
		neg	dx
		neg	ax
		sbb	dx, 0

loc_5E6:
		pop	di
		pop	si
		pop	bp
		retf	8

loc_5EC:
		div	bx
		test	di, 2
		jz	short loc_5F5
		xchg	dx, ax

loc_5F5:
		xor	dx, dx
		jmp	short loc_5E6
sub_55A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5F9		proc near

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jl	short loc_619
		cmp	si, 58h
		jle	short loc_60C

loc_609:
		mov	si, 57h

loc_60C:
		mov	word_7BF70, si
		mov	al, [si+5842h]
		cbw
		mov	si, ax
		jmp	short loc_626

loc_619:
		neg	si
		cmp	si, 30h
		jg	short loc_609
		mov	word_7BF70, 0FFFFh

loc_626:
		mov	word_76850, si
		mov	ax, 0FFFFh
		pop	si
		pop	bp
		ret	2
sub_5F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_632		proc far

saved_4		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+saved_4]
		push	si
		call	sub_5F9
		mov	ax, si
		pop	si
		pop	bp
		ret	2
sub_632		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_IsAtty (sub_528 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à CRT_IsAtty (sub_532 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far — isatty() : IOCTL GET DEVICE
; INFO (INT21 AH=44h), teste bit device (0x80).
; ==============================================================================================
CRT_IsAtty		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4400h
		mov	bx, [bp+arg_0]
		int	21h
		xchg	dx, ax
		and	ax, 80h
		pop	bp
		retf
CRT_IsAtty		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_NormalizeSign32
; (sub_539 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; CRT_NormalizeSign32 (sub_543 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — normalise le signe d'une paire dx:ax selon le signe d'un
; second opérande : brique de division/modulo signé 32-bit.
; ==============================================================================================
CRT_NormalizeSign32		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	[bp+arg_2], 0
		jg	short loc_675
		jl	short loc_666
		cmp	[bp+arg_0], 0
		jnb	short loc_675

loc_666:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		neg	dx
		neg	ax
		sbb	dx, 0
		jmp	short loc_67B

loc_675:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]

loc_67B:
		pop	bp
		retf
CRT_NormalizeSign32		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67D		proc near

var_22		= word ptr -22h
arg_0		= byte ptr  4
arg_2		= byte ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch
arg_A		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		push	es
		mov	di, [bp+arg_6]
		push	ds
		pop	es
		mov	bx, [bp+arg_4]
		cmp	bx, 24h
		ja	short loc_6EB
		cmp	bl, 2
		jb	short loc_6EB
		mov	ax, [bp+arg_8]
		mov	cx, [bp+arg_A]
		or	cx, cx
		jge	short loc_6B3
		cmp	[bp+arg_2], 0
		jz	short loc_6B3
		mov	byte ptr [di], 2Dh
		inc	di
		neg	cx
		neg	ax
		sbb	cx, 0

loc_6B3:
		lea	si, [bp+var_22]
		jcxz	short loc_6C7

loc_6B8:
		xchg	cx, ax
		sub	dx, dx
		div	bx
		xchg	cx, ax
		div	bx
		mov	[si], dl
		inc	si
		jcxz	short loc_6CE
		jmp	short loc_6B8

loc_6C7:
		sub	dx, dx
		div	bx
		mov	[si], dl
		inc	si

loc_6CE:
		or	ax, ax
		jnz	short loc_6C7
		lea	cx, [bp+var_22]
		neg	cx
		add	cx, si
		cld

loc_6DA:
		dec	si
		mov	al, [si]
		sub	al, 0Ah
		jnb	short loc_6E5
		add	al, 3Ah
		jmp	short loc_6E8

loc_6E5:
		add	al, [bp+arg_0]

loc_6E8:
		stosb
		loop	short loc_6DA

loc_6EB:
		mov	al, 0
		stosb
		pop	es
		mov	ax, [bp+arg_6]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret	0Ch
sub_67D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6FA		proc far

saved_4		= word ptr  4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		push	[bp+arg_0]
		push	[bp+saved_4]
		mov	ax, 0Ah
		push	ax
		mov	al, 0
		push	ax
		mov	al, 61h
		push	ax
		call	sub_67D
		pop	bp
		ret	4
sub_6FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Lseek (sub_5FB de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à CRT_Lseek (sub_605 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à
; revérifier ici. — far — wrapper lseek() (INT21 AH=42h) avec gestion d'erreur via sub_4E7.
; ==============================================================================================
CRT_Lseek		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 1
		and	word ptr [bx+5816h], 0FDFFh
		mov	ah, 42h
		mov	al, [bp+arg_6]
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_2]
		int	21h
		jb	short loc_739
		jmp	short loc_73E

loc_739:
		push	ax
		call	sub_5F9
		cwd

loc_73E:
		pop	bp
		retf
CRT_Lseek		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_740		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, word_7D46C
		mov	dx, word_7D46A
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		mov	word_7D46C, ax
		mov	word_7D46A, dx
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		mov	sp, bp
		pop	bp
		retf
sub_740		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Malloc16_Retry (sub_64E de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à CRT_Malloc16_Retry (sub_658 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — allocation
; avec retry sur errno global (dword_72F54), appelle sub_5D22B : variante malloc courte
; 16-bit.
; ==============================================================================================
CRT_Malloc16_Retry		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_77C
		mov	ax, si
		jmp	short loc_77F

loc_77C:
		mov	ax, 1

loc_77F:
		mov	si, ax
		jmp	short loc_787

loc_783:
		call	dword ptr word_7D46A

loc_787:
		push	si
		call	sub_6596D
		pop	cx
		mov	[bp+var_2], ax
		or	ax, ax
		jnz	short loc_79E
		mov	ax, word_7D46A
		or	ax, word_7D46C
		jnz	short loc_783

loc_79E:
		mov	ax, [bp+var_2]
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Malloc16_Retry		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Malloc32_Retry (sub_68A de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à CRT_Malloc32_Retry (sub_694 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — variante
; 32-bit de sub_658 : normalise dx:ax à 1 si zéro, retry sur dword_72F54 via sub_5D90E.
; ==============================================================================================
CRT_Malloc32_Retry		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_7BC
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		jmp	short loc_7C1

loc_7BC:
		xor	dx, dx
		mov	ax, 1

loc_7C1:
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		jmp	short loc_7CD

loc_7C9:
		call	dword ptr word_7D46A

loc_7CD:
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_66323
		pop	cx
		pop	cx
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jnz	short loc_7ED
		mov	ax, word_7D46A
		or	ax, word_7D46C
		jnz	short loc_7C9

loc_7ED:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		mov	sp, bp
		pop	bp
		retf
CRT_Malloc32_Retry		endp

; ----------------------------------------------------------------------

sub_7F7		proc near
		push	si
		xchg	si, ax
		xchg	dx, ax
		test	ax, ax
		jz	short loc_800
		mul	bx

loc_800:
		jcxz	short loc_807
		xchg	cx, ax
		mul	si
		add	ax, cx

loc_807:
		xchg	si, ax
		mul	bx
		add	dx, si
		pop	si
		ret
sub_7F7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Srand_6F2 (sub_6F2
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. srand() du runtime : graine de CRT_Rand (word_487DE = arg_0, word_487E0 =
; 0). Appelée par mid2 (sub_6B9C0) et mid17 (sub_98210) avec CRT_Time_85A(0) : tirages
; différents à chaque partie.
; ==============================================================================================
CRT_Srand_80E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	word_7BFCE, 0
		mov	word_7BFCC, ax
		pop	bp
		retf
CRT_Srand_80E		endp

; ----------------------------------------------------------------------

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Rand (sub_703 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à CRT_Rand (sub_70D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; générateur pseudo-aléatoire congruentiel linéaire (constantes 4E35h/1, seed 32-bit
; word_71CF6/71CF8) : runtime rand().
; ==============================================================================================
CRT_Rand		proc far
		mov	cx, word_7BFCE
		mov	bx, word_7BFCC
		mov	dx, 15Ah
		mov	ax, 4E35h
		call	sub_7F7
		add	ax, 1
		adc	dx, 0
		mov	word_7BFCE, dx
		mov	word_7BFCC, ax
		mov	ax, word_7BFCE
		cwd
		and	ax, 7FFFh
		retf
CRT_Rand		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Unlink (sub_729 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à CRT_Unlink (sub_733 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; wrapper unlink() (INT21 AH=41h) avec gestion erreur via sub_4E7.
; ==============================================================================================
CRT_Unlink		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ah, 41h
		mov	dx, [bp+arg_0]
		int	21h
		jb	short loc_855
		xor	ax, ax
		jmp	short loc_859

loc_855:
		push	ax
		call	sub_5F9

loc_859:
		pop	bp
		retf
CRT_Unlink		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_85B		proc far

var_6		= word ptr -6
var_4		= word ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		push	di
		mov	[bp+var_4], 0
		mov	[bp+var_6], 0
		jmp	short loc_888
sub_85B		endp

; ----------------------------------------------------------------------

sub_86F		proc near
		mov	di, [bp+0Ch]
		test	byte ptr [bp-1], 20h
		jz	short loc_87F
		les	di, [di]
		add	word ptr [bp+0Ch], 4
		ret

loc_87F:
		mov	di, [di]
		push	ds
		pop	es
		add	word ptr [bp+0Ch], 2
		ret

loc_888:
		push	es
		cld

loc_88A:
		mov	si, [bp+0Ah]

loc_88D:
		lodsb
		or	al, al
		jz	short loc_8F0
		cmp	al, 25h
		jz	short loc_8F3

loc_896:
		cbw
		xchg	di, ax
		inc	word ptr [bp-6]
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		or	ax, ax
		jl	short loc_8CC
		cbw
		or	di, di
		js	short loc_8DD
		cmp	byte ptr [di+58A0h], 1
		jnz	short loc_8DD

loc_8B2:
		xchg	bx, ax
		or	bl, bl
		js	short loc_8CF
		cmp	byte ptr [bx+58A0h], 1
		jnz	short loc_8CF
		inc	word ptr [bp-6]
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		or	ax, ax
		jg	short loc_8B2

loc_8CC:
		jmp	loc_C23

loc_8CF:
		push	word ptr [bp+8]
		push	bx
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		dec	word ptr [bp-6]
		jmp	short loc_88D

loc_8DD:
		cmp	ax, di
		jz	short loc_88D
		push	word ptr [bp+8]
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		dec	word ptr [bp-6]
		jmp	loc_C37

loc_8F0:
		jmp	loc_C37

loc_8F3:
		mov	word ptr [bp-0Ah], 0FFFFh
		mov	byte ptr [bp-1], 0

loc_8FC:
		lodsb
		cbw
		mov	[bp+0Ah], si
		xchg	di, ax
		or	di, di
		jl	short loc_91F
		mov	bl, [di+58A0h]
		xor	bh, bh
		cmp	bx, 15h
		jbe	short loc_914
		jmp	loc_C23

loc_914:
		shl	bx, 1
		jmp	cs:off_CCA[bx]	; switch jump

loc_91B:
		xchg	di, ax
		jmp	loc_896

loc_91F:
		jmp	loc_C37

loc_922:
		or	byte ptr [bp-1], 1
		jmp	short loc_8FC

loc_928:
		sub	di, 30h
		xchg	[bp-0Ah], di
		or	di, di
		jl	short loc_8FC
		mov	ax, 0Ah
		mul	di
		add	[bp-0Ah], ax
		jmp	short loc_8FC

loc_93C:
		or	byte ptr [bp-1], 8
		jmp	short loc_8FC

loc_942:
		or	byte ptr [bp-1], 4
		jmp	short loc_8FC

loc_948:
		or	byte ptr [bp-1], 2
		jmp	short loc_8FC

loc_94E:
		and	byte ptr [bp-1], 0DFh
		jmp	short loc_8FC

loc_954:
		or	byte ptr [bp-1], 20h
		jmp	short loc_8FC

loc_95A:
		mov	ax, [bp-6]
		sub	dx, dx
		test	byte ptr [bp-1], 1
		jz	short loc_9B5
		jmp	short loc_8FC

loc_967:
		mov	si, 8
		jmp	short loc_978

loc_96C:
		mov	si, 0Ah
		jmp	short loc_978

loc_971:
		mov	si, 10h
		jmp	short loc_978

loc_976:
		xor	si, si

loc_978:
		test	di, 20h
		jnz	short loc_987
		cmp	di, 58h
		jz	short loc_987
		or	byte ptr [bp-1], 4

loc_987:
		lea	ax, [bp-8]
		push	ax
		lea	ax, [bp-6]
		push	ax
		mov	ax, [bp-0Ah]
		and	ax, 7FFFh
		push	ax
		push	si
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+4]
		call	sub_D21
		add	sp, 0Eh
		cmp	word ptr [bp-8], 0
		jle	short loc_9C4
		test	byte ptr [bp-1], 1
		jnz	short loc_9C1
		inc	word ptr [bp-4]

loc_9B5:
		call	sub_86F
		stosw
		test	byte ptr [bp-1], 4
		jz	short loc_9C1
		xchg	dx, ax
		stosw

loc_9C1:
		jmp	loc_88A

loc_9C4:
		jl	short loc_9C9
		jmp	loc_C37

loc_9C9:
		jmp	loc_C23

loc_9CC:
		call	sub_9CF
sub_86F		endp

; ----------------------------------------------------------------------

sub_9CF		proc near
		jmp	loc_C3E
		push	word ptr [bp+8]
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		dec	word ptr [bp-6]
		and	word ptr [bp-0Ah], 7FFFh
		call	loc_9E6
		jmp	loc_C64
		push	dx
		cmp	al, 3Ah
		jz	short loc_A03
		or	ax, ax
		jle	short loc_9FE
		push	word ptr [bp+8]
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		dec	word ptr [bp-6]

loc_9FE:
		pop	dx
		mov	bx, ds
		jmp	short loc_A1E

loc_A03:
		call	loc_A06
		jmp	loc_C64
		pop	bx
		or	ax, ax
		jle	short loc_A1E
		push	dx
		push	bx
		push	word ptr [bp+8]
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		dec	word ptr [bp-6]
		pop	bx
		pop	dx

loc_A1E:
		test	byte ptr [bp-1], 1
		jnz	short loc_A34
		call	sub_86F
		inc	word ptr [bp-4]
		xchg	dx, ax
		stosw
		test	byte ptr [bp-1], 20h
		jz	short loc_A34
		xchg	bx, ax
		stosw

loc_A34:
		jmp	loc_88A

loc_A37:
		jmp	loc_C23

loc_A3A:
		lea	ax, [bp-8]
		push	ax
		lea	ax, [bp-6]
		push	ax
		mov	ax, 7FFFh
		and	ax, [bp-0Ah]
		push	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	word ptr [bp+4]
		call	sub_1FD4
		add	sp, 0Ch
		cmp	word ptr [bp-8], 0
		jle	short loc_A96
		mov	al, [bp-1]
		cbw
		test	ax, 1
		jnz	short loc_A90
		call	sub_86F
		inc	word ptr [bp-4]
		test	byte ptr [bp-1], 4
		jz	short loc_A78
		mov	ax, 4
		jmp	short loc_A85

loc_A78:
		test	byte ptr [bp-1], 8
		jz	short loc_A83
		mov	ax, 8
		jmp	short loc_A85

loc_A83:
		xor	ax, ax

loc_A85:
		push	ax
		push	di
		call	sub_1FD8
		add	sp, 4
		jmp	loc_88A

loc_A90:
		call	sub_1FDC
		jmp	loc_88A

loc_A96:
		call	sub_1FDC
		jl	short loc_A37
		jmp	loc_C37

loc_A9E:
		call	sub_AA1
sub_9CF		endp

; ----------------------------------------------------------------------

sub_AA1		proc near
		jmp	loc_C3E
		test	byte ptr [bp-1], 1
		jnz	short loc_AB0
		call	sub_86F
		inc	word ptr [bp-4]

loc_AB0:
		and	word ptr [bp-0Ah], 7FFFh
		jz	short loc_AE0

loc_AB7:
		test	byte ptr [bp-1], 1
		jnz	short loc_ABE
		stosb

loc_ABE:
		inc	word ptr [bp-6]
		push	es
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		pop	es
		or	ax, ax
		jle	short loc_AE0
		or	al, al
		js	short loc_ADB
		xchg	bx, ax
		cmp	byte ptr [bx+58A0h], 1
		xchg	bx, ax
		jle	short loc_AE0

loc_ADB:
		dec	word ptr [bp-0Ah]
		jg	short loc_AB7

loc_AE0:
		push	es
		push	word ptr [bp+8]
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		pop	es
		dec	word ptr [bp-6]
		test	byte ptr [bp-1], 1
		jnz	short loc_AF7
		mov	al, 0
		stosb

loc_AF7:
		jmp	loc_88A

loc_AFA:
		test	byte ptr [bp-1], 1
		jnz	short loc_B03
		call	sub_86F

loc_B03:
		mov	si, [bp-0Ah]
		or	si, si
		jge	short loc_B0D
		mov	si, 1

loc_B0D:
		jz	short loc_B29

loc_B0F:
		inc	word ptr [bp-6]
		push	es
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		pop	es
		or	ax, ax
		jl	short loc_B35
		test	byte ptr [bp-1], 1
		jnz	short loc_B26
		stosb

loc_B26:
		dec	si
		jg	short loc_B0F

loc_B29:
		test	byte ptr [bp-1], 1
		jnz	short loc_B32
		inc	word ptr [bp-4]

loc_B32:
		jmp	loc_88A

loc_B35:
		jmp	loc_C23

loc_B38:
		sub	ax, ax
		cld
		push	ss
		pop	es
		lea	di, [bp-2Ah]
		mov	cx, 10h
		rep stosw
		lodsb
		and	byte ptr [bp-1], 0EFh
		cmp	al, 5Eh
		jnz	short loc_B53
		or	byte ptr [bp-1], 10h
		lodsb

loc_B53:
		mov	ah, 0

loc_B55:
		mov	dl, al
		mov	di, ax
		mov	cl, 3
		shr	di, cl
		mov	cx, 107h
		and	cl, dl
		shl	ch, cl
		or	[bp+di-2Ah], ch

loc_B67:
		lodsb
		cmp	al, 0
		jz	short loc_B92
		cmp	al, 5Dh
		jz	short loc_B95
		cmp	al, 2Dh
		jnz	short loc_B55
		cmp	dl, [si]
		ja	short loc_B55
		cmp	byte ptr [si], 5Dh
		jz	short loc_B55
		lodsb
		sub	al, dl
		jz	short loc_B67
		add	dl, al

loc_B84:
		rol	ch, 1
		adc	di, 0
		or	[bp+di-2Ah], ch
		dec	al
		jnz	short loc_B84
		jmp	short loc_B67

loc_B92:
		jmp	loc_C37

loc_B95:
		mov	[bp+0Ah], si
		and	word ptr [bp-0Ah], 7FFFh
		mov	si, [bp-0Ah]
		test	byte ptr [bp-1], 1
		jnz	short loc_BA9
		call	sub_86F

loc_BA9:
		dec	si
		jl	short loc_BFC
		inc	word ptr [bp-6]
		push	es
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		pop	es
		or	ax, ax
		jl	short loc_C11
		xchg	si, ax
		mov	bx, si
		mov	cl, 3
		shr	si, cl
		mov	cx, 107h
		and	cl, bl
		shl	ch, cl
		test	[bp+si-2Ah], ch
		xchg	si, ax
		xchg	bx, ax
		jz	short loc_BD9
		test	byte ptr [bp-1], 10h
		jz	short loc_BDF
		jmp	short loc_BE8

loc_BD9:
		test	byte ptr [bp-1], 10h
		jz	short loc_BE8

loc_BDF:
		test	byte ptr [bp-1], 1
		jnz	short loc_BA9
		stosb
		jmp	short loc_BA9

loc_BE8:
		push	es
		push	word ptr [bp+8]
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		pop	es
		dec	word ptr [bp-6]
		inc	si
		cmp	si, [bp-0Ah]
		jge	short loc_C05

loc_BFC:
		test	byte ptr [bp-1], 1
		jnz	short loc_C0E
		inc	word ptr [bp-4]

loc_C05:
		test	byte ptr [bp-1], 1
		jnz	short loc_C0E
		mov	al, 0
		stosb

loc_C0E:
		jmp	loc_88A

loc_C11:
		inc	si
		cmp	si, [bp-0Ah]
		jge	short loc_C23
		test	byte ptr [bp-1], 1
		jnz	short loc_C23
		mov	al, 0
		stosb
		inc	word ptr [bp-4]

loc_C23:
		push	word ptr [bp+8]
		mov	ax, 0FFFFh
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		cmp	word ptr [bp-4], 1
		sbb	word ptr [bp-4], 0

loc_C37:
		pop	es
		mov	ax, [bp-4]
		jmp	loc_CC4

loc_C3E:
		inc	word ptr [bp-6]
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		or	ax, ax
		jle	short loc_C5F
		or	al, al
		js	short loc_C59
		xchg	bx, ax
		cmp	byte ptr [bx+58A0h], 1
		xchg	bx, ax
		jz	short loc_C3E

loc_C59:
		pop	cx
		add	cx, 3
		jmp	cx

loc_C5F:
		jz	short loc_C59
		pop	cx
		jmp	short loc_C23

loc_C64:
		sub	dx, dx
		mov	cx, 4

loc_C69:
		dec	word ptr [bp-0Ah]
		jl	short loc_CB3
		push	dx
		push	cx
		inc	word ptr [bp-6]
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		pop	cx
		pop	dx
		or	ax, ax
		jle	short loc_CB5
		dec	cl
		jl	short loc_CB5
		mov	ch, al
		sub	ch, 30h
		jb	short loc_CB5
		cmp	ch, 0Ah
		jb	short loc_CA7
		sub	ch, 11h
		jb	short loc_CB5
		cmp	ch, 6
		jb	short loc_CA4
		sub	ch, 20h
		jb	short loc_CB5
		cmp	ch, 6
		jnb	short loc_CB5

loc_CA4:
		add	ch, 0Ah

loc_CA7:
		shl	dx, 1
		shl	dx, 1
		shl	dx, 1
		shl	dx, 1
		add	dl, ch
		jmp	short loc_C69

loc_CB3:
		sub	ax, ax

loc_CB5:
		cmp	cl, 4
		jz	short loc_CC0
		pop	cx
		add	cx, 3
		jmp	cx

loc_CC0:
		pop	cx
		jmp	loc_C23

loc_CC4:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret
sub_AA1		endp

; START OF FUNCTION CHUNK FOR sub_AA1
off_CCA	dw offset loc_C37
		dw offset loc_C37
		dw offset loc_C37
		dw offset loc_91B
		dw offset loc_922
		dw offset loc_928
		dw offset loc_AFA
		dw offset loc_96C
		dw offset loc_96C
		dw offset loc_976
		dw offset loc_A3A
		dw offset loc_93C
		dw offset loc_948
		dw offset loc_942
		dw offset loc_967
		dw offset loc_A9E
		dw offset loc_B38
		dw offset loc_95A
		dw offset loc_971
		dw offset loc_9CC
		dw offset loc_94E
		dw offset loc_954
; END OF FUNCTION CHUNK FOR sub_AA1

; ----------------------------------------------------------------------

sub_CF6		proc near
		push	bx
		sub	bl, 30h
		jb	short loc_D1E
		cmp	bl, 9
		jbe	short loc_D13
		cmp	bl, 2Ah
		ja	short loc_D0B
		sub	bl, 7
		jmp	short loc_D0E

loc_D0B:
		sub	bl, 27h

loc_D0E:
		cmp	bl, 9
		jbe	short loc_D1E

loc_D13:
		cmp	bl, cl
		jnb	short loc_D1E
		inc	sp
		inc	sp
		clc
		mov	bh, 0
		jmp	short loc_D20

loc_D1E:
		pop	bx
		stc

loc_D20:
		ret
sub_CF6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D21		proc near

var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch
arg_A		= word ptr  0Eh
arg_C		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	[bp+var_1], 0
		mov	[bp+var_4], 0
		mov	[bp+var_6], 1

loc_D37:
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		or	ax, ax
		jl	short loc_DAD
		cbw
		xchg	bx, ax
		test	bl, 80h
		jnz	short loc_D54
		mov	di, 55C7h
		test	byte ptr [bx+di], 1
		jnz	short loc_D37

loc_D54:
		xchg	bx, ax
		dec	[bp+arg_8]
		jl	short loc_DB4
		cmp	al, 2Bh
		jz	short loc_D65
		cmp	al, 2Dh
		jnz	short loc_D78
		inc	[bp+var_1]

loc_D65:
		dec	[bp+arg_8]
		jl	short loc_DB4
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		or	ax, ax
		jl	short loc_DAD

loc_D78:
		sub	si, si
		mov	di, si
		mov	cx, [bp+arg_6]
		jcxz	short loc_DCE
		cmp	cx, 24h
		ja	short loc_DB4
		cmp	cl, 2
		jb	short loc_DB4
		cmp	al, 30h
		jnz	short loc_DFA
		cmp	cl, 10h
		jnz	short loc_DF8
		dec	[bp+arg_8]
		jl	short loc_DCB
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		cmp	al, 78h
		jz	short loc_DF8
		cmp	al, 58h
		jz	short loc_DF8
		jmp	short loc_E20

loc_DAD:
		mov	[bp+var_6], 0FFFFh
		jmp	short loc_DB9

loc_DB4:
		mov	[bp+var_6], 0

loc_DB9:
		push	[bp+arg_4]
		push	ax
		call	word ptr [bp+arg_2]
		pop	cx
		pop	cx
		dec	[bp+var_4]
		sub	ax, ax
		cwd
		jmp	loc_E72

loc_DCB:
		jmp	loc_E62

loc_DCE:
		cmp	al, 30h
		mov	[bp+arg_6], 0Ah
		jnz	short loc_DFA
		dec	[bp+arg_8]
		jl	short loc_DCB
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		mov	[bp+arg_6], 8
		cmp	al, 78h
		jz	short loc_DF3
		cmp	al, 58h
		jnz	short loc_E20

loc_DF3:
		mov	[bp+arg_6], 10h

loc_DF8:
		jmp	short loc_E11

loc_DFA:
		mov	cx, [bp+arg_6]
		xchg	bx, ax
		call	sub_CF6
		xchg	bx, ax
		jb	short loc_DB4
		xchg	si, ax
		jmp	short loc_E11

loc_E07:
		xchg	si, ax
		mul	[bp+arg_6]
		add	si, ax
		adc	di, dx
		jnz	short loc_E3D

loc_E11:
		dec	[bp+arg_8]
		jl	short loc_E62
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx

loc_E20:
		mov	cx, [bp+arg_6]
		xchg	bx, ax
		call	sub_CF6
		xchg	bx, ax
		jnb	short loc_E07
		jmp	short loc_E56

loc_E2C:
		xchg	si, ax
		mul	cx
		xchg	di, ax
		xchg	dx, cx
		mul	dx
		add	si, di
		adc	ax, cx
		xchg	di, ax
		adc	dl, dh
		jnz	short loc_E84

loc_E3D:
		dec	[bp+arg_8]
		jl	short loc_E62
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		mov	cx, [bp+arg_6]
		xchg	bx, ax
		call	sub_CF6
		xchg	bx, ax
		jnb	short loc_E2C

loc_E56:
		push	[bp+arg_4]
		push	ax
		call	word ptr [bp+arg_2]
		pop	cx
		pop	cx
		dec	[bp+var_4]

loc_E62:
		mov	dx, di
		xchg	si, ax
		cmp	[bp+var_1], 0
		jz	short loc_E72
		neg	dx
		neg	ax
		sbb	dx, 0

loc_E72:
		mov	di, [bp+arg_A]
		mov	bx, [bp+var_4]
		add	[di], bx
		mov	di, [bp+arg_C]
		mov	bx, [bp+var_6]
		mov	[di], bx
		jmp	short loc_E9A

loc_E84:
		mov	ax, 0FFFFh
		mov	dx, 7FFFh
		add	al, [bp+var_1]
		adc	ah, 0
		adc	dx, 0
		mov	[bp+var_6], 2
		jmp	short loc_E72

loc_E9A:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret
sub_D21		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EA0		proc far

saved_4		= word ptr  4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	[si], es
		mov	ax, [bp+saved_4]
		mov	[si+2], ax
		mov	[si+4], ss
		mov	[si+6], ds
		pop	si
		pop	bp
		retf
sub_EA0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EB8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ah, 2Bh
		mov	si, [bp+arg_0]
		mov	cx, [si]
		mov	dx, [si+2]
		int	21h
		pop	si
		pop	bp
		retf
sub_EB8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ECB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ah, 2Dh
		mov	si, [bp+arg_0]
		mov	cx, [si]
		mov	dx, [si+2]
		int	21h
		pop	si
		pop	bp
		retf
sub_ECB		endp

; START OF FUNCTION CHUNK FOR sub_ECB
		mov	dx, 5
		cmp	dx, word_7BF44
		jnb	short loc_F12

loc_EE7:
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+5816h], 0
		mov	bx, dx
		mov	cl, 4
		shl	bx, cl
		mov	byte ptr [bx+56D8h], 0FFh
		mov	ax, dx
		shl	ax, cl
		add	ax, 56D4h
		mov	bx, dx
		shl	bx, cl
		mov	[bx+56E2h], ax
		inc	dx
		cmp	dx, word_7BF44
		jb	short loc_EE7

loc_F12:
		mov	al, byte_7BE08
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_IsAtty
		pop	cx
		or	ax, ax
		jnz	short loc_F27
		and	word_7BE06, 0FDFFh

loc_F27:
		mov	ax, 200h
		push	ax
		test	word_7BE06, 200h
		jz	short loc_F38
		mov	ax, 1
		jmp	short loc_F3A

loc_F38:
		xor	ax, ax

loc_F3A:
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, 56D4h
		push	ax
		nop
		push	cs
		call	near ptr Stdio_SetupFileStruct
		add	sp, 8
		mov	al, byte_7BE18
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_IsAtty
		pop	cx
		or	ax, ax
		jnz	short loc_F5F
		and	word_7BE16, 0FDFFh

loc_F5F:
		mov	ax, 200h
		push	ax
		test	word_7BE16, 200h
		jz	short loc_F70
		mov	ax, 2
		jmp	short loc_F72

loc_F70:
		xor	ax, ax

loc_F72:
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, 56E4h
		push	ax
		nop
		push	cs
		call	near ptr Stdio_SetupFileStruct
		add	sp, 8
		ret
; END OF FUNCTION CHUNK FOR sub_ECB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F83		proc far

var_8		= word ptr -8
var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		mov	bx, [bp+arg_0]
		push	word ptr [bx+2]
		push	word ptr [bx]
		nop
		push	cs
		call	near ptr sub_3228
		add	sp, 8
		lea	ax, [bp+var_4]
		push	ax
		nop
		push	cs
		call	near ptr sub_EB8
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		nop
		push	cs
		call	near ptr sub_ECB
		pop	cx
		xor	ax, ax
		mov	sp, bp
		pop	bp
		retf
sub_F83		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Time_85A (sub_85A
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. time() du runtime : date (sub_3E9) et heure (sub_3FC) du DOS converties par
; sub_2899 en secondes (dx:ax), rangées aussi en [arg_0] si arg_0 ≠ 0.
; ==============================================================================================
CRT_Time_FBB		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_4]
		push	ax
		nop
		push	cs
		call	near ptr sub_505
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		nop
		push	cs
		call	near ptr sub_518
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		nop
		push	cs
		call	near ptr sub_310F
		pop	cx
		pop	cx
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		or	si, si
		jz	short loc_FFD
		mov	ax, [bp+var_A]
		mov	dx, [bp+var_C]
		mov	[si+2], ax
		mov	[si], dx

loc_FFD:
		mov	dx, [bp+var_A]
		mov	ax, [bp+var_C]
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Time_FBB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_CtypeLookup (sub_8A7 de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à CRT_CtypeLookup (sub_E4B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — table lookup type de caractère (table 4971h), cas spécial
; 0xFFFF : ctype-like classification/toupper-tolower.
; ==============================================================================================
CRT_CtypeLookup		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	dx, 0FFFFh
		jnz	short loc_1018
		mov	ax, 0FFFFh
		jmp	short loc_1032

loc_1018:
		mov	al, dl
		mov	ah, 0
		mov	bx, ax
		test	byte ptr [bx+55C7h], 8
		jz	short loc_102E
		mov	al, dl
		mov	ah, 0
		add	ax, 0FFE0h
		jmp	short loc_1032

loc_102E:
		mov	al, dl
		mov	ah, 0

loc_1032:
		pop	bp
		retf
CRT_CtypeLookup		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1034		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	[bp+var_8], 1
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jnz	short loc_104C
		jmp	loc_1265

loc_104C:
		lea	ax, [bp+arg_C]
		mov	[bp+var_2], ax
		test	[bp+arg_A], 1
		jz	short loc_1076
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		mov	ax, word ptr [bp+var_6]
		or	ax, word ptr [bp+var_6+2]
		jnz	short loc_1089
		jmp	short loc_1084

loc_1076:
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	di, [bx-2]
		or	di, di
		jnz	short loc_1089

loc_1084:
		mov	[bp+var_8], 0

loc_1089:
		test	[bp+arg_A], 10h
		jz	short loc_10A1
		les	bx, [bp+arg_0]
		mov	ax, es:[bx-2]
		mov	dx, es:[bx-4]
		mov	[bp+arg_8], ax
		mov	[bp+arg_6], dx

loc_10A1:
		cmp	[bp+var_8], 0
		jnz	short loc_10AA
		jmp	loc_1211

loc_10AA:
		mov	ax, [bp+arg_A]
		and	ax, 1A7h
		mov	[bp+var_C], ax
		test	[bp+var_C], 80h
		jz	short loc_10BF
		and	[bp+var_C], 0FEFFh

loc_10BF:
		mov	bx, [bp+arg_4]
		xor	cx, cx
		mov	dx, [bp+arg_8]
		mov	ax, [bp+arg_6]
		sub	ax, 1
		sbb	dx, 0
		call	sub_7F7
		add	ax, [bp+arg_0]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+arg_2]
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		jmp	loc_11F3

loc_10EA:
		mov	ax, [bp+var_C]
		mov	[bp+var_A], ax
		mov	cx, 10h
		mov	bx, offset word_126B

loc_10F6:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_A]
		jz	short loc_1106
		add	bx, 2
		loop	short loc_10F6
		jmp	loc_11DB

loc_1106:
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_110A:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		push	[bp+var_10]
		call	di

loc_1116:
		add	sp, 6
		jmp	loc_11E0

loc_111C:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		push	[bp+var_10]
		call	dword ptr [bp+var_6]
		jmp	short loc_1116

loc_112B:
		push	[bp+var_E]
		push	[bp+var_10]
		mov	ax, 2
		push	ax

loc_1135:
		call	di
		jmp	short loc_115E

loc_1139:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		push	[bp+var_10]
		jmp	short loc_1135

loc_1145:
		push	[bp+var_E]
		push	[bp+var_10]
		mov	ax, 2
		push	ax
		jmp	short loc_115B

loc_1151:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		push	[bp+var_10]

loc_115B:
		call	dword ptr [bp+var_6]

loc_115E:
		jmp	loc_11E0

loc_1161:
		push	[bp+var_E]
		push	[bp+var_10]
		mov	ax, 2
		call	di
		jmp	short loc_117C

loc_116E:
		jmp	short loc_1161

loc_1170:
		push	[bp+var_E]
		push	[bp+var_10]
		mov	ax, 2
		call	dword ptr [bp+var_6]

loc_117C:
		jmp	short loc_11E0

loc_117E:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		push	ax
		call	di
		pop	cx
		pop	si
		pop	ds
		jmp	short loc_11E0

loc_118E:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		pop	cx
		pop	si
		pop	ds
		jmp	short loc_11E0

loc_119F:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		push	ax
		call	di
		pop	si
		pop	ds
		jmp	short loc_11E0

loc_11AE:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		pop	si
		pop	ds
		jmp	short loc_11E0

loc_11BE:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		call	di
		pop	si
		pop	ds
		jmp	short loc_11E0

loc_11CC:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		call	dword ptr [bp+var_6]
		pop	si
		pop	ds
		jmp	short loc_11E0

loc_11DB:
		nop
		push	cs
		call	near ptr sub_2F1

loc_11E0:
		mov	ax, [bp+arg_4]
		xor	dx, dx
		sub	[bp+var_10], ax
		sbb	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	[bp+var_E], dx

loc_11F3:
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_8]
		sub	[bp+arg_6], 1
		sbb	[bp+arg_8], 0
		or	dx, dx
		jbe	short loc_1208
		jmp	loc_10EA

loc_1208:
		jnz	short loc_1211
		or	ax, ax
		jbe	short loc_1211
		jmp	loc_10EA

loc_1211:
		test	[bp+arg_A], 8
		jz	short loc_1265
		mov	[bp+var_E], 0
		test	[bp+arg_A], 10h
		jz	short loc_1229
		mov	[bp+var_E], 4

loc_1229:
		test	[bp+arg_A], 40h
		jz	short loc_1249
		add	[bp+var_E], 2
		les	bx, [bp+arg_0]
		sub	bx, [bp+var_E]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_C], ax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+var_C]
		jmp	short loc_1252

loc_1249:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		sub	dx, [bp+var_E]

loc_1252:
		mov	[bp+arg_2], ax
		mov	[bp+arg_0], dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_3C0
		pop	cx
		pop	cx

loc_1265:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_1034		endp

; START OF FUNCTION CHUNK FOR sub_1034
word_126B	dw 4
		dw 5
		dw 6
		dw 7
		dw 24h
		dw 25h
		dw 84h
		dw 85h
		dw 86h
		dw 87h
		dw 0A4h
		dw 0A5h
		dw 106h
		dw 107h
		dw 124h
		dw 125h
off_128B	dw offset loc_110A
		dw offset loc_111C
		dw offset loc_112B
		dw offset loc_1145
		dw offset loc_1161
		dw offset loc_1170
		dw offset loc_117E
		dw offset loc_118E
		dw offset loc_119F
		dw offset loc_11AE
		dw offset loc_11BE
		dw offset loc_11CC
		dw offset loc_1139
		dw offset loc_1151
		dw offset loc_116E
		dw offset loc_1170
; END OF FUNCTION CHUNK FOR sub_1034

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 9 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Doprnt_Core (sub_8D3 de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à CRT_Doprnt_Core (sub_E77 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — 299 lignes, moteur
; vprintf/_doprnt (gestion varargs 2/4 octets selon flag), cœur du formatteur d'impression bas
; niveau.
; ==============================================================================================
CRT_Doprnt_Core		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	[bp+var_8], 1
		cmp	[bp+arg_0], 0
		jnz	short loc_12C1
		jmp	loc_1457

loc_12C1:
		lea	ax, [bp+arg_8]
		mov	[bp+var_2], ax
		test	[bp+arg_6], 1
		jz	short loc_12EB
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		mov	ax, word ptr [bp+var_6]
		or	ax, word ptr [bp+var_6+2]
		jnz	short loc_12FE
		jmp	short loc_12F9

loc_12EB:
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	di, [bx-2]
		or	di, di
		jnz	short loc_12FE

loc_12F9:
		mov	[bp+var_8], 0

loc_12FE:
		test	[bp+arg_6], 10h
		jz	short loc_130E
		mov	bx, [bp+arg_0]
		mov	ax, [bx-2]
		mov	[bp+arg_4], ax

loc_130E:
		cmp	[bp+var_8], 0
		jnz	short loc_1317
		jmp	loc_1437

loc_1317:
		mov	ax, [bp+arg_6]
		and	ax, 1A7h
		mov	[bp+var_C], ax
		test	[bp+var_C], 80h
		jz	short loc_132C
		and	[bp+var_C], 0FEFFh

loc_132C:
		mov	ax, [bp+arg_4]
		dec	ax
		imul	[bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, ax
		mov	[bp+var_E], dx
		jmp	loc_142A

loc_133E:
		mov	ax, [bp+var_C]
		mov	[bp+var_A], ax
		mov	cx, 10h
		mov	bx, offset word_145D

loc_134A:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_A]
		jz	short loc_135A
		add	bx, 2
		loop	short loc_134A
		jmp	loc_141F

loc_135A:
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_135E:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		call	di

loc_1367:
		pop	cx
		pop	cx
		jmp	loc_1424

loc_136C:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		call	dword ptr [bp+var_6]
		jmp	short loc_1367

loc_1378:
		push	[bp+var_E]
		mov	ax, 2
		push	ax
		call	di
		jmp	loc_1424

loc_1384:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		call	di
		jmp	loc_1424

loc_1390:
		push	[bp+var_E]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		jmp	loc_1424

loc_139D:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		call	dword ptr [bp+var_6]
		jmp	short loc_1424

loc_13A9:
		mov	ax, 2
		mov	bx, [bp+var_E]
		jmp	short loc_13B7

loc_13B1:
		mov	bx, [bp+var_E]
		mov	ax, 2

loc_13B7:
		call	di
		jmp	short loc_1424

loc_13BB:
		mov	ax, 2
		mov	bx, [bp+var_E]
		jmp	short loc_13C9

loc_13C3:
		mov	bx, [bp+var_E]
		mov	ax, 2

loc_13C9:
		call	dword ptr [bp+var_6]
		jmp	short loc_1424

loc_13CE:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	di
		pop	cx
		pop	si
		jmp	short loc_1424

loc_13DC:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		pop	cx
		pop	si
		jmp	short loc_1424

loc_13EB:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	di
		pop	si
		jmp	short loc_1424

loc_13F8:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		pop	si
		jmp	short loc_1424

loc_1406:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		call	di
		pop	si
		jmp	short loc_1424

loc_1412:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		call	dword ptr [bp+var_6]
		pop	si
		jmp	short loc_1424

loc_141F:
		nop
		push	cs
		call	near ptr sub_2F1

loc_1424:
		mov	ax, [bp+arg_2]
		sub	[bp+var_E], ax

loc_142A:
		mov	ax, [bp+arg_4]
		dec	[bp+arg_4]
		or	ax, ax
		jbe	short loc_1437
		jmp	loc_133E

loc_1437:
		test	[bp+arg_6], 8
		jz	short loc_1457
		test	[bp+arg_6], 10h
		jz	short loc_144E
		mov	ax, [bp+arg_0]
		add	ax, 0FFFEh
		mov	[bp+arg_0], ax

loc_144E:
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_3B2
		pop	cx

loc_1457:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Doprnt_Core		endp

; START OF FUNCTION CHUNK FOR CRT_Doprnt_Core
word_145D	dw 0
		dw 1
		dw 2
		dw 3
		dw 20h
		dw 21h
		dw 80h
		dw 81h
		dw 82h
		dw 83h
		dw 0A0h
		dw 0A1h
		dw 102h
		dw 103h
		dw 120h
		dw 121h
off_147D	dw offset loc_135E
		dw offset loc_136C
		dw offset loc_1378
		dw offset loc_1390
		dw offset loc_13A9
		dw offset loc_13BB
		dw offset loc_13CE
		dw offset loc_13DC
		dw offset loc_13EB
		dw offset loc_13F8
		dw offset loc_1406
		dw offset loc_1412
		dw offset loc_1384
		dw offset loc_139D
		dw offset loc_13B1
		dw offset loc_13C3
; END OF FUNCTION CHUNK FOR CRT_Doprnt_Core

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_149D		proc far

var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	di, [bp+arg_A]
		mov	[bp+var_A], 1
		lea	ax, [bp+arg_C]
		mov	[bp+var_2], ax
		test	di, 1
		jz	short loc_14D6
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	ax, word ptr [bp+var_8]
		or	ax, word ptr [bp+var_8+2]
		jnz	short loc_14EE
		jmp	short loc_14E9

loc_14D6:
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_14EE

loc_14E9:
		mov	[bp+var_A], 0

loc_14EE:
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_14F9
		jmp	loc_15F1

loc_14F9:
		mov	[bp+var_10], 0
		test	di, 10h
		jz	short loc_1509
		mov	[bp+var_10], 4

loc_1509:
		test	di, 40h
		jnz	short loc_1512
		jmp	loc_1592

loc_1512:
		add	[bp+var_10], 2
		mov	bx, [bp+arg_4]
		xor	cx, cx
		mov	dx, [bp+arg_8]
		mov	ax, [bp+arg_6]
		call	sub_7F7
		add	ax, [bp+var_10]
		adc	dx, 0
		add	ax, [bp+arg_4]
		adc	dx, 0
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr CRT_Malloc32_Retry
		pop	cx
		pop	cx
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		or	ax, [bp+arg_2]
		jnz	short loc_154B

loc_1544:
		xor	dx, dx
		xor	ax, ax
		jmp	loc_16E9

loc_154B:
		xor	ax, ax
		push	ax
		push	[bp+arg_4]
		mov	ax, 1
		xor	dx, dx
		push	ax
		push	dx
		call	near ptr sub_55A
		mov	[bp+var_12], ax
		mov	ax, [bp+arg_0]
		mov	[bp+var_E], ax
		jmp	short loc_156C

loc_1566:
		mov	ax, [bp+arg_4]
		add	[bp+var_12], ax

loc_156C:
		mov	ax, [bp+var_10]
		add	ax, [bp+var_E]
		cmp	ax, [bp+var_12]
		ja	short loc_1566
		mov	ax, [bp+var_12]
		sub	ax, [bp+var_E]
		sub	ax, [bp+var_10]
		add	[bp+arg_0], ax
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_E]
		mov	es:[bx], ax
		add	[bp+arg_0], 2
		jmp	short loc_15D7

loc_1592:
		mov	bx, [bp+arg_4]
		xor	cx, cx
		mov	dx, [bp+arg_8]
		mov	ax, [bp+arg_6]
		call	sub_7F7
		add	ax, [bp+var_10]
		adc	dx, 0
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		cmp	[bp+var_14], 0
		jb	short loc_15BC
		ja	short loc_1544
		cmp	[bp+var_16], 0FFFFh
		jbe	short loc_15BC
		jmp	short loc_1544

loc_15BC:
		push	[bp+var_14]
		push	[bp+var_16]
		nop
		push	cs
		call	near ptr CRT_Malloc32_Retry
		pop	cx
		pop	cx
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		or	ax, [bp+arg_2]
		jnz	short loc_15D7
		jmp	loc_1544

loc_15D7:
		test	di, 10h
		jz	short loc_15F1
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_8]
		mov	dx, [bp+arg_6]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		add	[bp+arg_0], 4

loc_15F1:
		and	di, 1A7h
		test	di, 80h
		jz	short loc_15FF
		and	di, 0FEFFh

loc_15FF:
		cmp	[bp+var_A], 0
		jnz	short loc_1608
		jmp	loc_16E3

loc_1608:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		jmp	loc_16C5

loc_1617:
		mov	[bp+var_C], di
		mov	cx, 10h
		mov	bx, offset word_16EF

loc_1620:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_C]
		jz	short loc_162F
		add	bx, 2
		loop	short loc_1620
		jmp	short loc_16AD

loc_162F:
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_1633:
		push	[bp+var_E]
		push	[bp+var_10]
		call	word ptr [bp+var_4]

loc_163C:
		pop	cx
		pop	cx
		jmp	short loc_16B2

loc_1640:
		push	[bp+var_E]
		push	[bp+var_10]
		call	dword ptr [bp+var_8]
		jmp	short loc_163C

loc_164B:
		push	[bp+var_E]
		push	[bp+var_10]
		call	word ptr [bp+var_4]
		jmp	short loc_1663

loc_1656:
		jmp	short loc_165A

loc_1658:
		jmp	short loc_164B

loc_165A:
		push	[bp+var_E]
		push	[bp+var_10]
		call	dword ptr [bp+var_8]

loc_1663:
		jmp	short loc_16B2

loc_1665:
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	word ptr [bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_16B2

loc_1671:
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	dword ptr [bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_16B2

loc_167D:
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	word ptr [bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_16B2

loc_1689:
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	dword ptr [bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_16B2

loc_1695:
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	word ptr [bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_16B2

loc_16A1:
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	dword ptr [bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_16B2

loc_16AD:
		nop
		push	cs
		call	near ptr sub_2F1

loc_16B2:
		mov	ax, [bp+arg_4]
		xor	dx, dx
		add	[bp+var_10], ax
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	[bp+var_E], dx

loc_16C5:
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_8]
		sub	[bp+arg_6], 1
		sbb	[bp+arg_8], 0
		or	dx, dx
		jbe	short loc_16DA
		jmp	loc_1617

loc_16DA:
		jnz	short loc_16E3
		or	ax, ax
		jbe	short loc_16E3
		jmp	loc_1617

loc_16E3:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]

loc_16E9:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_149D		endp

; START OF FUNCTION CHUNK FOR sub_149D
word_16EF	dw 4
		dw 5
		dw 6
		dw 7
		dw 24h
		dw 25h
		dw 84h
		dw 85h
		dw 86h
		dw 87h
		dw 0A4h
		dw 0A5h
		dw 106h
		dw 107h
		dw 124h
		dw 125h
off_170F	dw offset loc_1633
		dw offset loc_1640
		dw offset loc_164B
		dw offset loc_1656
		dw offset loc_1658
		dw offset loc_165A
		dw offset loc_1665
		dw offset loc_1671
		dw offset loc_167D
		dw offset loc_1689
		dw offset loc_1695
		dw offset loc_16A1
		dw offset loc_164B
		dw offset loc_1656
		dw offset loc_1658
		dw offset loc_165A
; END OF FUNCTION CHUNK FOR sub_149D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 14 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Doprnt_Dispatch (sub_D57 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à CRT_Doprnt_Dispatch (sub_1069 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — 257 lignes,
; gros switch (cases 0x81-0xA1) dispatchant sur spécificateurs de format via callbacks
; [bp+var_4]/[bp+var_8] : moteur _doprnt (dispatch %d/%s/%x/%ld etc, variantes near/far).
; ==============================================================================================
CRT_Doprnt_Dispatch		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_A], 1
		lea	ax, [bp+arg_8]
		mov	[bp+var_2], ax
		test	[bp+arg_6], 1
		jz	short loc_1769
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	ax, word ptr [bp+var_8]
		or	ax, word ptr [bp+var_8+2]
		jnz	short loc_1781
		jmp	short loc_177C

loc_1769:
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_1781

loc_177C:
		mov	[bp+var_A], 0

loc_1781:
		or	di, di
		jnz	short loc_17D5
		mov	ax, [bp+arg_2]
		imul	[bp+arg_4]
		mov	[bp+var_E], 0
		mov	[bp+var_10], ax
		test	[bp+arg_6], 10h
		jz	short loc_17A2
		add	[bp+var_10], 2
		adc	[bp+var_E], 0

loc_17A2:
		cmp	[bp+var_E], 0
		jb	short loc_17B5
		ja	short loc_17B0
		cmp	[bp+var_10], 0FFFFh
		jbe	short loc_17B5

loc_17B0:
		xor	ax, ax
		jmp	loc_189B

loc_17B5:
		push	[bp+var_10]
		nop
		push	cs
		call	near ptr CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	di, di
		jnz	short loc_17C6
		jmp	short loc_17B0

loc_17C6:
		test	[bp+arg_6], 10h
		jz	short loc_17D5
		mov	ax, [bp+arg_4]
		mov	[di], ax
		add	di, 2

loc_17D5:
		and	[bp+arg_6], 1A7h
		test	[bp+arg_6], 80h
		jz	short loc_17E6
		and	[bp+arg_6], 0FEFFh

loc_17E6:
		cmp	[bp+var_A], 0
		jnz	short loc_17EF
		jmp	loc_1899

loc_17EF:
		mov	[bp+var_E], di
		jmp	loc_188C

loc_17F5:
		mov	ax, [bp+arg_6]
		mov	[bp+var_C], ax
		mov	cx, 10h
		mov	bx, offset word_18A1

loc_1801:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_C]
		jz	short loc_1810
		add	bx, 2
		loop	short loc_1801
		jmp	short loc_1881

loc_1810:
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_1814:
		push	[bp+var_E]
		call	word ptr [bp+var_4]

loc_181A:
		pop	cx
		jmp	short loc_1886

loc_181D:
		push	[bp+var_E]
		call	dword ptr [bp+var_8]
		jmp	short loc_181A

loc_1825:
		push	[bp+var_E]
		call	word ptr [bp+var_4]
		jmp	short loc_1833

loc_182D:
		push	[bp+var_E]
		call	dword ptr [bp+var_8]

loc_1833:
		jmp	short loc_1886

loc_1835:
		mov	bx, [bp+var_E]
		call	word ptr [bp+var_4]
		jmp	short loc_1886

loc_183D:
		mov	bx, [bp+var_E]
		call	dword ptr [bp+var_8]
		jmp	short loc_1886

loc_1845:
		push	si
		mov	si, [bp+var_E]
		call	word ptr [bp+var_4]
		pop	si
		jmp	short loc_1886

loc_184F:
		push	si
		mov	si, [bp+var_E]
		call	dword ptr [bp+var_8]
		pop	si
		jmp	short loc_1886

loc_1859:
		push	si
		mov	si, [bp+var_E]
		call	word ptr [bp+var_4]
		pop	si
		jmp	short loc_1886

loc_1863:
		push	si
		mov	si, [bp+var_E]
		call	dword ptr [bp+var_8]
		pop	si
		jmp	short loc_1886

loc_186D:
		push	si
		mov	si, [bp+var_E]
		call	word ptr [bp+var_4]
		pop	si
		jmp	short loc_1886

loc_1877:
		push	si
		mov	si, [bp+var_E]
		call	dword ptr [bp+var_8]
		pop	si
		jmp	short loc_1886

loc_1881:
		nop
		push	cs
		call	near ptr sub_2F1

loc_1886:
		mov	ax, [bp+arg_2]
		add	[bp+var_E], ax

loc_188C:
		mov	ax, [bp+arg_4]
		dec	[bp+arg_4]
		or	ax, ax
		jbe	short loc_1899
		jmp	loc_17F5

loc_1899:
		mov	ax, di

loc_189B:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Doprnt_Dispatch		endp

; START OF FUNCTION CHUNK FOR CRT_Doprnt_Dispatch
word_18A1	dw 0
		dw 1
		dw 2
		dw 3
		dw 20h
		dw 21h
		dw 80h
		dw 81h
		dw 82h
		dw 83h
		dw 0A0h
		dw 0A1h
		dw 102h
		dw 103h
		dw 120h
		dw 121h
off_18C1	dw offset loc_1814
		dw offset loc_181D
		dw offset loc_1825
		dw offset loc_182D
		dw offset loc_1835
		dw offset loc_183D
		dw offset loc_1845
		dw offset loc_184F
		dw offset loc_1859
		dw offset loc_1863
		dw offset loc_186D
		dw offset loc_1877
		dw offset loc_1825
		dw offset loc_182D
		dw offset loc_1835
		dw offset loc_183D
; END OF FUNCTION CHUNK FOR CRT_Doprnt_Dispatch

; ----------------------------------------------------------------------

sub_18E1		proc near
		mov	al, dh
		call	sub_18E8
		mov	al, dl
sub_18E1		endp

; ----------------------------------------------------------------------

sub_18E8		proc near
		aam	10h
		xchg	al, ah
		call	sub_18F1
		xchg	al, ah
sub_18E8		endp

; ----------------------------------------------------------------------

sub_18F1		proc near
		add	al, 90h
		daa
		adc	al, 40h
		daa
		stosb
		ret
sub_18F1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18F9		proc near

var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h

		push	bp
		mov	bp, sp
		sub	sp, 96h
		push	si
		push	di
		mov	[bp+var_12], 0
		mov	[bp+var_14], 50h
		mov	[bp+var_16], 0
		jmp	short loc_1959
sub_18F9		endp

; ----------------------------------------------------------------------

sub_1913		proc near
		push	di
		mov	cx, 0FFFFh
		xor	al, al
		repne scasb
		not	cx
		dec	cx
		pop	di
		ret
sub_1913		endp

; ----------------------------------------------------------------------

sub_1920		proc near
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp-14h]
		jnz	short loc_1958
sub_1920		endp

; ----------------------------------------------------------------------

sub_1929		proc near
		push	bx
		push	cx
		push	dx
		push	es
		lea	ax, [bp-96h]
		sub	di, ax
		lea	ax, [bp-96h]
		push	ax
		push	di
		push	word ptr [bp+8]
		call	word ptr [bp+0Ah]
		or	ax, ax
		jnz	short loc_1948
		mov	word ptr [bp-16h], 1

loc_1948:
		mov	word ptr [bp-14h], 50h
		add	[bp-12h], di
		lea	di, [bp-96h]
		pop	es
		pop	dx
		pop	cx
		pop	bx

loc_1958:
		ret

loc_1959:
		push	es
		cld
		lea	di, [bp-96h]
		mov	[bp-4], di

loc_1962:
		mov	di, [bp-4]

loc_1965:
		mov	si, [bp+6]

loc_1968:
		lodsb
		or	al, al
		jz	short loc_197F
		cmp	al, 25h
		jz	short loc_1982

loc_1971:
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp-14h]
		jg	short loc_1968
		call	sub_1929
		jmp	short loc_1968

loc_197F:
		jmp	loc_1D5C

loc_1982:
		mov	[bp-10h], si
		lodsb
		cmp	al, 25h
		jz	short loc_1971
		mov	[bp-4], di
		xor	cx, cx
		mov	[bp-0Eh], cx
		mov	[bp-2], cx
		mov	[bp-0Bh], cl
		mov	word ptr [bp-8], 0FFFFh
		mov	word ptr [bp-0Ah], 0FFFFh
		jmp	short loc_19A5

loc_19A4:
		lodsb

loc_19A5:
		xor	ah, ah
		mov	dx, ax
		mov	bx, ax
		sub	bl, 20h
		cmp	bl, 60h
		jnb	short loc_19C6
		mov	bl, [bx+5927h]
		cmp	bx, 17h
		jbe	short loc_19BF
		jmp	loc_1D4C

loc_19BF:
		shl	bx, 1
		jmp	cs:off_1D7C[bx]	; switch jump

loc_19C6:
		jmp	loc_1D4C

loc_19C9:
		cmp	ch, 0
		ja	short loc_19C6
		or	word ptr [bp-2], 1
		jmp	short loc_19A4

loc_19D4:
		cmp	ch, 0
		ja	short loc_19C6
		or	word ptr [bp-2], 2
		jmp	short loc_19A4

loc_19DF:
		cmp	ch, 0
		ja	short loc_19C6
		cmp	byte ptr [bp-0Bh], 2Bh
		jz	short loc_19ED
		mov	[bp-0Bh], dl

loc_19ED:
		jmp	short loc_19A4

loc_19EF:
		and	word ptr [bp-2], 0FFDFh
		jmp	short loc_19F9

loc_19F5:
		or	word ptr [bp-2], 20h

loc_19F9:
		mov	ch, 5
		jmp	short loc_19A4

loc_19FD:
		cmp	ch, 0
		ja	short loc_1A4F
		test	word ptr [bp-2], 2
		jnz	short loc_1A32
		or	word ptr [bp-2], 8
		mov	ch, 1
		jmp	short loc_19A4

loc_1A11:
		jmp	loc_1D4C

loc_1A14:
		mov	di, [bp+4]
		mov	ax, ss:[di]
		add	word ptr [bp+4], 2
		cmp	ch, 2
		jnb	short loc_1A35
		or	ax, ax
		jns	short loc_1A2D
		neg	ax
		or	word ptr [bp-2], 2

loc_1A2D:
		mov	[bp-8], ax
		mov	ch, 3

loc_1A32:
		jmp	loc_19A4

loc_1A35:
		cmp	ch, 4
		jnz	short loc_1A11
		mov	[bp-0Ah], ax
		inc	ch
		jmp	loc_19A4

loc_1A42:
		cmp	ch, 4
		jnb	short loc_1A11
		mov	ch, 4
		inc	word ptr [bp-0Ah]
		jmp	loc_19A4

loc_1A4F:
		xchg	dx, ax
		sub	al, 30h
		cbw
		cmp	ch, 2
		ja	short loc_1A71
		mov	ch, 2
		xchg	[bp-8], ax
		or	ax, ax
		jl	short loc_1A32
		shl	ax, 1
		mov	dx, ax
		shl	ax, 1
		shl	ax, 1
		add	ax, dx
		add	[bp-8], ax
		jmp	loc_19A4

loc_1A71:
		cmp	ch, 4
		jnz	short loc_1A11
		xchg	[bp-0Ah], ax
		or	ax, ax
		jz	short loc_1A32
		shl	ax, 1
		mov	dx, ax
		shl	ax, 1
		shl	ax, 1
		add	ax, dx
		add	[bp-0Ah], ax
		jmp	loc_19A4

loc_1A8D:
		or	word ptr [bp-2], 10h
		jmp	loc_19F9

loc_1A94:
		or	word ptr [bp-2], 100h

loc_1A99:
		and	word ptr [bp-2], 0FFEFh
		jmp	loc_19F9

loc_1AA0:
		mov	bh, 8
		jmp	short loc_1AAE

loc_1AA4:
		mov	bh, 0Ah
		jmp	short loc_1AB2

loc_1AA8:
		mov	bh, 10h
		mov	bl, 0E9h
		add	bl, dl

loc_1AAE:
		mov	byte ptr [bp-0Bh], 0

loc_1AB2:
		mov	[bp-5], dl
		xor	dx, dx
		mov	[bp-6], dl
		mov	di, [bp+4]
		mov	ax, ss:[di]
		jmp	short loc_1AD2

loc_1AC2:
		mov	bh, 0Ah
		mov	byte ptr [bp-6], 1
		mov	[bp-5], dl
		mov	di, [bp+4]
		mov	ax, ss:[di]
		cwd

loc_1AD2:
		inc	di
		inc	di
		mov	[bp+6], si
		test	word ptr [bp-2], 10h
		jz	short loc_1AE3
		mov	dx, ss:[di]
		inc	di
		inc	di

loc_1AE3:
		mov	[bp+4], di
		lea	di, [bp-45h]
		or	ax, ax
		jnz	short loc_1AFF
		or	dx, dx
		jnz	short loc_1AFF
		cmp	word ptr [bp-0Ah], 0
		jnz	short loc_1B03
		mov	byte ptr ss:[di], 0
		mov	ax, di
		jmp	short loc_1B12

loc_1AFF:
		or	word ptr [bp-2], 4

loc_1B03:
		push	dx
		push	ax
		push	di
		mov	al, bh
		cbw
		push	ax
		mov	al, [bp-6]
		push	ax
		push	bx
		call	sub_67D

loc_1B12:
		push	ss
		pop	es
		mov	dx, [bp-0Ah]
		or	dx, dx
		jge	short loc_1B1E
		jmp	loc_1C10

loc_1B1E:
		jmp	loc_1C1E

loc_1B21:
		mov	[bp-5], dl
		mov	[bp+6], si
		lea	di, [bp-46h]
		mov	bx, [bp+4]
		push	word ptr ss:[bx]
		inc	bx
		inc	bx
		mov	[bp+4], bx
		test	word ptr [bp-2], 20h
		jz	short loc_1B4C
		mov	dx, ss:[bx]
		inc	bx
		inc	bx
		mov	[bp+4], bx
		push	ss
		pop	es
		call	sub_18E1
		mov	al, 3Ah
		stosb

loc_1B4C:
		push	ss
		pop	es
		pop	dx
		call	sub_18E1
		mov	byte ptr ss:[di], 0
		mov	byte ptr [bp-6], 0
		and	word ptr [bp-2], 0FFFBh
		lea	cx, [bp-46h]
		sub	di, cx
		xchg	di, cx
		mov	dx, [bp-0Ah]
		cmp	dx, cx
		jg	short loc_1B6E
		mov	dx, cx

loc_1B6E:
		jmp	loc_1C10

loc_1B71:
		mov	[bp+6], si
		mov	[bp-5], dl
		mov	di, [bp+4]
		mov	ax, ss:[di]
		add	word ptr [bp+4], 2
		push	ss
		pop	es
		lea	di, [bp-45h]
		xor	ah, ah
		mov	ss:[di], ax
		mov	cx, 1
		jmp	loc_1C53

loc_1B91:
		mov	[bp+6], si
		mov	[bp-5], dl
		mov	di, [bp+4]
		test	word ptr [bp-2], 20h
		jnz	short loc_1BAE
		mov	di, ss:[di]
		add	word ptr [bp+4], 2
		push	ds
		pop	es
		or	di, di
		jmp	short loc_1BB9

loc_1BAE:
		les	di, ss:[di]
		add	word ptr [bp+4], 4
		mov	ax, es
		or	ax, di

loc_1BB9:
		jnz	short loc_1BC0
		push	ds
		pop	es
		mov	di, 5920h

loc_1BC0:
		call	sub_1913
		cmp	cx, [bp-0Ah]
		jbe	short loc_1BCB
		mov	cx, [bp-0Ah]

loc_1BCB:
		jmp	loc_1C53

loc_1BCE:
		mov	[bp+6], si
		mov	[bp-5], dl
		mov	di, [bp+4]
		mov	cx, [bp-0Ah]
		or	cx, cx
		jge	short loc_1BE1
		mov	cx, 6

loc_1BE1:
		push	di
		push	cx
		lea	bx, [bp-45h]
		push	bx
		push	dx
		mov	ax, 1
		and	ax, [bp-2]
		push	ax
		mov	ax, [bp-2]
		test	ax, 100h
		jz	short loc_1C00
		mov	ax, 8
		add	word ptr [bp+4], 0Ah
		jmp	short loc_1C07

loc_1C00:
		add	word ptr [bp+4], 8
		mov	ax, 6

loc_1C07:
		push	ax
		call	sub_1FD0
		push	ss
		pop	es
		lea	di, [bp-45h]

loc_1C10:
		test	word ptr [bp-2], 8
		jz	short loc_1C2F
		mov	dx, [bp-8]
		or	dx, dx
		jle	short loc_1C2F

loc_1C1E:
		call	sub_1913
		cmp	byte ptr es:[di], 2Dh
		jnz	short loc_1C28
		dec	cx

loc_1C28:
		sub	dx, cx
		jle	short loc_1C2F
		mov	[bp-0Eh], dx

loc_1C2F:
		cmp	byte ptr es:[di], 2Dh
		jz	short loc_1C40
		mov	al, [bp-0Bh]
		or	al, al
		jz	short loc_1C50
		dec	di
		mov	es:[di], al

loc_1C40:
		cmp	word ptr [bp-0Eh], 0
		jle	short loc_1C50
		mov	cx, [bp-0Ah]
		or	cx, cx
		jge	short loc_1C50
		dec	word ptr [bp-0Eh]

loc_1C50:
		call	sub_1913

loc_1C53:
		mov	si, di
		mov	di, [bp-4]
		mov	bx, [bp-8]
		mov	ax, 5
		and	ax, [bp-2]
		cmp	ax, 5
		jnz	short loc_1C79
		mov	ah, [bp-5]
		cmp	ah, 6Fh
		jnz	short loc_1C7B
		cmp	word ptr [bp-0Eh], 0
		jg	short loc_1C79
		mov	word ptr [bp-0Eh], 1

loc_1C79:
		jmp	short loc_1C96

loc_1C7B:
		cmp	ah, 78h
		jz	short loc_1C85
		cmp	ah, 58h
		jnz	short loc_1C96

loc_1C85:
		or	word ptr [bp-2], 40h
		dec	bx
		dec	bx
		sub	word ptr [bp-0Eh], 2
		jge	short loc_1C96
		mov	word ptr [bp-0Eh], 0

loc_1C96:
		add	cx, [bp-0Eh]
		test	word ptr [bp-2], 2
		jnz	short loc_1CAC
		jmp	short loc_1CA8

loc_1CA2:
		mov	al, 20h
		call	sub_1920
		dec	bx

loc_1CA8:
		cmp	bx, cx
		jg	short loc_1CA2

loc_1CAC:
		test	word ptr [bp-2], 40h
		jz	short loc_1CBE
		mov	al, 30h
		call	sub_1920
		mov	al, [bp-5]
		call	sub_1920

loc_1CBE:
		mov	dx, [bp-0Eh]
		or	dx, dx
		jle	short loc_1CEC
		sub	cx, dx
		sub	bx, dx
		mov	al, es:[si]
		cmp	al, 2Dh
		jz	short loc_1CD8
		cmp	al, 20h
		jz	short loc_1CD8
		cmp	al, 2Bh
		jnz	short loc_1CDF

loc_1CD8:
		lodsb
		call	sub_1920
		dec	cx
		dec	bx

loc_1CDF:
		xchg	dx, cx
		jcxz	short loc_1CEA

loc_1CE3:
		mov	al, 30h
		call	sub_1920
		loop	short loc_1CE3

loc_1CEA:
		xchg	dx, cx

loc_1CEC:
		jcxz	short loc_1D00
		sub	bx, cx

loc_1CF0:
		lodsb
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp-14h]
		jg	short loc_1CFE
		call	sub_1929

loc_1CFE:
		loop	short loc_1CF0

loc_1D00:
		or	bx, bx
		jle	short loc_1D0D
		mov	cx, bx

loc_1D06:
		mov	al, 20h
		call	sub_1920
		loop	short loc_1D06

loc_1D0D:
		jmp	loc_1965

loc_1D10:
		mov	[bp+6], si
		mov	di, [bp+4]
		test	word ptr [bp-2], 20h
		jnz	short loc_1D28
		mov	di, ss:[di]
		add	word ptr [bp+4], 2
		push	ds
		pop	es
		jmp	short loc_1D2F

loc_1D28:
		les	di, ss:[di]
		add	word ptr [bp+4], 4

loc_1D2F:
		mov	ax, 50h
		sub	al, [bp-14h]
		add	ax, [bp-12h]
		mov	es:[di], ax
		test	word ptr [bp-2], 10h
		jz	short loc_1D49
		inc	di
		inc	di
		mov	word ptr es:[di], 0

loc_1D49:
		jmp	loc_1962

loc_1D4C:
		mov	si, [bp-10h]
		mov	di, [bp-4]
		mov	al, 25h

loc_1D54:
		call	sub_1920
		lodsb
		or	al, al
		jnz	short loc_1D54

loc_1D5C:
		cmp	byte ptr [bp-14h], 50h
		jge	short loc_1D65
		call	sub_1929

loc_1D65:
		pop	es
		cmp	word ptr [bp-16h], 0
		jz	short loc_1D71
		mov	ax, 0FFFFh
		jmp	short loc_1D74

loc_1D71:
		mov	ax, [bp-12h]

loc_1D74:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret	8
sub_1929		endp

; START OF FUNCTION CHUNK FOR sub_1929
off_1D7C	dw offset loc_19DF
		dw offset loc_19C9
		dw offset loc_1A14
		dw offset loc_19D4
		dw offset loc_1A42
		dw offset loc_1A4F
		dw offset loc_1A8D
		dw offset loc_1A94
		dw offset loc_1A99
		dw offset loc_19FD
		dw offset loc_1AC2
		dw offset loc_1AA0
		dw offset loc_1AA4
		dw offset loc_1AA8
		dw offset loc_1B21
		dw offset loc_1BCE
		dw offset loc_1B71
		dw offset loc_1B91
		dw offset loc_1D10
		dw offset loc_1D4C
		dw offset loc_1D4C
		dw offset loc_1D4C
		dw offset loc_19EF
		dw offset loc_19F5
		mov	dx, 5988h
		jmp	short loc_1DB4
		mov	dx, 598Dh

loc_1DB4:
		mov	cx, 5
		mov	ah, 40h
		mov	bx, 2
		int	21h
		mov	cx, 27h
		mov	dx, 5992h
		mov	ah, 40h
		int	21h
		jmp	sub_2F1
; END OF FUNCTION CHUNK FOR sub_1929

; ----------------------------------------------------------------------

sub_1DCB		proc near
		ret
sub_1DCB		endp

; ----------------------------------------------------------------------

sub_1DCC		proc near
		pushf
		cli
		mov	al, 0
		out	43h, al
		call	sub_1DCB
		in	al, 40h
		mov	bl, al
		call	sub_1DCB
		in	al, 40h
		mov	bh, al
		not	bx
		popf
		mov	ax, bx
		ret
sub_1DCC		endp

; ----------------------------------------------------------------------

sub_1DE6		proc far
		push	si
		xor	si, si

loc_1DE9:
		call	sub_1DCC
		test	ax, 1
		jnz	short loc_1DFF
		mov	word_7C0EC, 0
		mov	word_7C0EA, 4A9h
		jmp	short loc_1E05

loc_1DFF:
		inc	si
		cmp	si, 64h
		jl	short loc_1DE9

loc_1E05:
		pop	si
		retf
sub_1DE6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à PIT_DelayLoop (sub_149E
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à PIT_DelayLoop (sub_17B0
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far
; — boucle d'attente utilisant sub_1775 (PIT) et un delta 32-bit (word_71E14/16) :
; implémentation delay()/temporisation précise.
; ==============================================================================================
PIT_DelayLoop		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		call	sub_1DCC
		mov	si, ax
		xor	dx, dx
		mov	bx, [bp+arg_0]
		xor	cx, cx
		push	ax
		push	dx
		mov	dx, word_7C0EC
		mov	ax, word_7C0EA
		call	sub_7F7
		pop	bx
		pop	cx
		add	cx, ax
		adc	bx, dx
		mov	[bp+var_2], bx
		mov	[bp+var_4], cx
		jmp	short loc_1E50

loc_1E34:
		cmp	bx, si
		jnb	short loc_1E4E
		cmp	[bp+var_2], 1
		ja	short loc_1E46
		jb	short loc_1E63
		cmp	[bp+var_4], 0
		jb	short loc_1E63

loc_1E46:
		sub	[bp+var_4], 0
		sbb	[bp+var_2], 1

loc_1E4E:
		mov	si, bx

loc_1E50:
		call	sub_1DCC
		mov	bx, ax
		xor	dx, dx
		cmp	dx, [bp+var_2]
		jb	short loc_1E34
		jnz	short loc_1E63
		cmp	ax, [bp+var_4]
		jb	short loc_1E34

loc_1E63:
		pop	si
		mov	sp, bp
		pop	bp
		retf
PIT_DelayLoop		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; CRT_InstallProtectedHandler (sub_14FF de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à CRT_InstallProtectedHandler (sub_1811 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far — sauvegarde contexte
; (sub_D8E=setjmp) puis appelle sub_1839 avec 3 arguments : installation d'un handler protégé
; (structured exception).
; ==============================================================================================
CRT_InstallProtectedHandler		proc far

var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		lea	ax, [bp+var_8]
		push	ax
		nop
		push	cs
		call	near ptr sub_EA0
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1E90
		add	sp, 8
		mov	sp, bp
		pop	bp
		retf
CRT_InstallProtectedHandler		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E90		proc far

var_14		= word ptr -14h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_B		= word ptr -0Bh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		push	ds
		lea	cx, [bp+var_E]
		mov	word ptr [bp+var_4], cx
		mov	word ptr [bp+var_4+2], ss
		mov	byte ptr [bp+var_E], 55h
		mov	byte ptr [bp+var_E+1], 0CDh
		mov	ax, [bp+arg_0]
		mov	[bp+var_C], al
		mov	[bp+var_B], 0CB5Dh
		cmp	al, 25h
		jb	short loc_1ECE
		cmp	al, 26h
		ja	short loc_1ECE
		mov	byte ptr [bp+var_B], 36h
		mov	[bp+var_A], 68Fh
		mov	[bp+var_8], cx
		mov	[bp+var_6], 0CB5Dh

loc_1ECE:
		mov	si, [bp+arg_6]
		push	word ptr [si]
		push	word ptr [si+6]
		mov	si, [bp+arg_2]
		mov	ax, [si]
		mov	bx, [si+2]
		mov	cx, [si+4]
		mov	dx, [si+6]
		mov	di, [si+0Ah]
		mov	si, [si+8]
		pop	ds
		pop	es
		call	dword ptr [bp+var_4]
		pushf
		pushf
		push	si
		push	ds
		push	es
		mov	ds, [bp+var_14]
		mov	si, [bp+arg_6]
		pop	word ptr [si]
		pop	word ptr [si+6]
		mov	si, [bp+arg_4]
		pop	word ptr [si+8]
		pop	word ptr [si+0Eh]
		pop	word ptr [si+0Ch]
		and	word ptr [si+0Ch], 1
		mov	[si+0Ah], di
		mov	[si+6], dx
		mov	[si+4], cx
		mov	[si+2], bx
		mov	[si], ax
		pop	ds
		jz	short loc_1F26
		push	ax
		push	ax
		call	sub_5F9
		pop	ax

loc_1F26:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_1E90		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F2C		proc far

var_12		= word ptr -12h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_7		= word ptr -7
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		push	bp
		push	ds
		pushf
		lea	cx, [bp+var_12]
		mov	[bp+var_4], cx
		mov	[bp+var_2], ss
		mov	[bp+var_12], 6E8Bh
		mov	[bp+var_10], 0DEh
		mov	[bp+var_F], 0CDh
		mov	ax, [bp+arg_0]
		mov	[bp+var_E], al
		cmp	al, 25h
		jb	short loc_1F73
		cmp	al, 26h
		ja	short loc_1F73
		mov	[bp+var_D], 36h
		mov	[bp+var_C], 68Fh
		mov	[bp+var_A], cx
		mov	[bp+var_8], 0CAh
		mov	[bp+var_7], 2
		jmp	short loc_1F7C
sub_1F2C		endp

; ----------------------------------------------------------------------

sub_1F72		proc far
		iret

loc_1F73:
		mov	byte ptr [bp-0Dh], 0CAh
		mov	word ptr [bp-0Ch], 2

loc_1F7C:
		mov	di, [bp+8]
		push	ds
		push	di
		mov	ax, [di]
		mov	bx, [di+2]
		mov	cx, [di+4]
		mov	dx, [di+6]
		push	word ptr [di+8]
		mov	si, [di+0Ah]
		mov	es, [di+10h]
		lds	di, [di+0Ch]
		call	dword ptr [bp-4]
		push	ds
		push	di
		push	bp
		pushf
		mov	bp, sp
		lds	di, [bp+8]
		mov	[di], ax
		mov	[di+2], bx
		mov	[di+4], cx
		mov	[di+6], dx
		mov	[di+0Ah], si
		mov	[di+10h], es
		pop	word ptr [di+12h]
		pop	word ptr [di+8]
		pop	word ptr [di+0Ch]
		pop	word ptr [di+0Eh]
		add	sp, 4
		push	cs
		call	near ptr sub_1F72
		pop	ds
		pop	bp
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_1F72		endp

; ----------------------------------------------------------------------

sub_1FD0		proc near
		jmp	word ptr word_7C140
sub_1FD0		endp

; ----------------------------------------------------------------------

sub_1FD4		proc near
		jmp	word ptr word_7C142
sub_1FD4		endp

; ----------------------------------------------------------------------

sub_1FD8		proc near
		jmp	word ptr word_7C144
sub_1FD8		endp

; ----------------------------------------------------------------------

sub_1FDC		proc near
		jmp	word ptr word_7C146
sub_1FDC		endp

; START OF FUNCTION CHUNK FOR sub_1FDC
		add	[bx+si], al
		pop	word_7C0F2
		pop	word_7C0F4
		pop	word_7C0F6
		mov	cs:1FE0h, ds
		mov	word_7C0F8, si
		mov	word_7C0FA, di
		cld
		mov	es, word_7684C
		mov	si, 80h
		xor	ah, ah
		lodsb
		inc	ax
		mov	bp, es
		xchg	si, dx
		xchg	bx, ax
		mov	si, word_76846
		inc	si
		inc	si
		mov	cx, 1
		cmp	byte ptr word_7684E, 3
		jb	short loc_202E
		mov	es, word_76848
		mov	di, si
		mov	cl, 7Fh
		xor	al, al
		repne scasb
		jcxz	short loc_209D
		xor	cl, 7Fh

loc_202E:
		push	ax
		mov	ax, cx
		add	ax, bx
		inc	ax
		and	ax, 0FFFEh
		mov	di, sp
		sub	di, ax
		jb	short loc_209D
		mov	sp, di
		push	es
		pop	ds
		push	ss
		pop	es
		push	cx
		dec	cx
		rep movsb
		xor	al, al
		stosb
		mov	ds, bp
		xchg	dx, si
		xchg	cx, bx
		mov	ax, bx
		mov	dx, ax
		inc	bx

loc_2055:
		call	loc_2075
		ja	short loc_2065

loc_205A:
		jb	short loc_20A2
		cmp	al, 0Dh
		jz	short loc_2071
		call	loc_2075
		ja	short loc_205A

loc_2065:
		cmp	al, 20h
		jz	short loc_2071
		cmp	al, 0Dh
		jz	short loc_2071
		cmp	al, 9
		jnz	short loc_2055

loc_2071:
		xor	al, al
		jmp	short loc_2055
		or	ax, ax
		jz	short loc_2080
		inc	dx
		stosb
		or	al, al
		jnz	short loc_2080
		inc	bx

loc_2080:
		xchg	al, ah
		xor	al, al
		stc
		jcxz	short loc_209C
		lodsb
		dec	cx
		sub	al, 22h
		jz	short loc_209C
		add	al, 22h
		cmp	al, 5Ch
		jnz	short loc_209A
		cmp	byte ptr [si], 22h
		jnz	short loc_209A
		lodsb
		dec	cx

loc_209A:
		or	si, si

loc_209C:
		ret

loc_209D:
		nop
		nop
		jmp	sub_2F1

loc_20A2:
		pop	cx
		add	cx, dx
		mov	ds, cs:1FE0h
		mov	word_7C0EE, bx
		inc	bx
		add	bx, bx
		mov	si, sp
		mov	bp, sp
		sub	bp, bx
		jb	short loc_209D
		mov	sp, bp
		mov	word_7C0F0, bp

loc_20BF:
		jcxz	short loc_20CF
		mov	[bp], si
		add	bp, 2

loc_20C7:
		lodsb
		or	al, al
		loopne	short loc_20C7
		jz	short loc_20BF

loc_20CF:
		xor	ax, ax
		mov	[bp], ax
		mov	ds, cs:1FE0h
		mov	si, word_7C0F8
		mov	di, word_7C0FA
		push	word_7C0F6
		push	word_7C0F4
		mov	ax, word_7C0EE
		mov	word_76840, ax
		mov	ax, word_7C0F0
		mov	word_76842, ax
		jmp	word ptr word_7C0F2
		push	si
		push	di
		mov	cx, word_76846
		push	cx
		call	sub_6596D
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2130
		push	ds
		push	ds
		pop	es
		mov	ds, word_76848
		xor	si, si
		cld
		rep movsb
		pop	ds
		mov	di, ax
		push	es
		push	word_7684A
		call	sub_6596D
		pop	bx
		mov	bx, ax
		pop	es
		mov	word_7C0FC, ax
		or	ax, ax
		jnz	short loc_2135

loc_2130:
		nop
		nop
		jmp	sub_2F1

loc_2135:
		xor	ax, ax
		mov	cx, 0FFFFh
		cmp	byte ptr [di], 0
		jz	short loc_214B

loc_213F:
		mov	[bx], di
		add	bx, 2
		repne scasb
		cmp	es:[di], al
		jnz	short loc_213F

loc_214B:
		mov	[bx], ax
		pop	di
		pop	si
		mov	ax, word_7C0FC
		mov	word_76844, ax
		ret
; END OF FUNCTION CHUNK FOR sub_1FDC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Write_TextMode
; (sub_1C8A de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; CRT_Write_TextMode (sub_1F4B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — wrapper write() avec test mode texte/binaire (CR/LF
; handling, flag bit1).
; ==============================================================================================
CRT_Write_TextMode		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr CRT_SetFileAttr
		pop	cx
		pop	cx
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_2187
		test	[bp+arg_2], 2
		jz	short loc_217A
		test	dx, 1
		jnz	short loc_217E

loc_217A:
		xor	ax, ax
		jmp	short loc_2187

loc_217E:
		mov	word_76850, 5
		mov	ax, 0FFFFh

loc_2187:
		pop	bp
		retf
CRT_Write_TextMode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2189		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	bp
		mov	si, [bp+arg_0]
		cld
		sub	ax, ax
		cwd
		mov	cx, 0Ah
		mov	bh, 0
		mov	di, 55C7h

loc_219E:
		mov	bl, [si]
		inc	si
		test	byte ptr [bx+di], 1
		jnz	short loc_219E
		mov	bp, 0
		cmp	bl, 2Bh
		jz	short loc_21B4
		cmp	bl, 2Dh
		jnz	short loc_21B7
		inc	bp

loc_21B4:
		mov	bl, [si]
		inc	si

loc_21B7:
		cmp	bl, 39h
		ja	short loc_21EA
		sub	bl, 30h
		jb	short loc_21EA
		mul	cx
		add	ax, bx
		adc	dl, dh
		jz	short loc_21B4
		jmp	short loc_21DD

loc_21CB:
		mov	di, dx
		mov	cx, 0Ah
		mul	cx
		xchg	di, ax
		xchg	cx, dx
		mul	dx
		xchg	dx, ax
		xchg	di, ax
		add	ax, bx
		adc	dx, cx

loc_21DD:
		mov	bl, [si]
		inc	si
		cmp	bl, 39h
		ja	short loc_21EA
		sub	bl, 30h
		jnb	short loc_21CB

loc_21EA:
		dec	bp
		jl	short loc_21F4
		neg	dx
		neg	ax
		sbb	dx, 0

loc_21F4:
		pop	bp
		pop	di
		pop	si
		pop	bp
		retf
sub_2189		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21F9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_2189
		pop	cx
		pop	bp
		retf
sub_21F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_SetFileAttr (sub_1D3A de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à CRT_SetFileAttr (sub_1F7E de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — opération
; fichier bas niveau INT21 AH=43h (get/set attributs) avec gestion erreur via sub_4E7.
; ==============================================================================================
CRT_SetFileAttr		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	cx, [bp+arg_4]
		mov	ah, 43h
		mov	al, [bp+arg_2]
		mov	dx, [bp+arg_0]
		int	21h
		jb	short loc_221B
		xchg	cx, ax
		jmp	short loc_221F

loc_221B:
		push	ax
		call	sub_5F9

loc_221F:
		pop	bp
		retf
CRT_SetFileAttr		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Stdio_Fflush (sub_1D55
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_Fflush (sub_1F99 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — fflush() interne d'un FILE*
; : vérifie flag dirty (bit3), appelle sub_2BB9 (write) si besoin, met à jour pointeurs de
; buffer.
; ==============================================================================================
Stdio_Fflush		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		or	di, di
		jnz	short loc_2234
		nop
		push	cs
		call	near ptr sub_2302
		jmp	short loc_229C

loc_2234:
		cmp	[di+0Eh], di
		jz	short loc_223E

loc_2239:
		mov	ax, 0FFFFh
		jmp	short loc_229E

loc_223E:
		cmp	word ptr [di], 0
		jl	short loc_226C
		test	word ptr [di+2], 8
		jnz	short loc_2254
		mov	ax, di
		add	ax, 5
		cmp	[di+0Ah], ax
		jnz	short loc_229C

loc_2254:
		mov	word ptr [di], 0
		mov	ax, di
		add	ax, 5
		cmp	[di+0Ah], ax
		jnz	short loc_229C
		mov	ax, [di+8]
		mov	[di+0Ah], ax
		jmp	short loc_229C
		jmp	short loc_229C

loc_226C:
		mov	ax, [di+6]
		add	ax, [di]
		inc	ax
		mov	si, ax
		sub	[di], si
		push	ax
		mov	ax, [di+8]
		mov	[di+0Ah], ax
		push	ax
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_WriteLowLevel
		add	sp, 6
		cmp	ax, si
		jz	short loc_229C
		test	word ptr [di+2], 200h
		jnz	short loc_229C
		or	word ptr [di+2], 10h
		jmp	short loc_2239

loc_229C:
		xor	ax, ax

loc_229E:
		pop	di
		pop	si
		pop	bp
		retf
Stdio_Fflush		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22A2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	ds
		mov	ah, 2Fh
		int	21h
		push	es
		push	bx
		mov	ah, 1Ah
		mov	dx, [bp+arg_2]
		int	21h
		mov	ah, 4Eh
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_0]
		int	21h
		pushf
		pop	cx
		xchg	bx, ax
		mov	ah, 1Ah
		pop	dx
		pop	ds
		int	21h
		push	cx
		popf
		pop	ds
		jb	short loc_22CF
		xor	ax, ax
		jmp	short loc_22D3

loc_22CF:
		push	bx
		call	sub_5F9

loc_22D3:
		pop	bp
		retf
sub_22A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22D5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	ds
		mov	ah, 2Fh
		int	21h
		push	es
		push	bx
		mov	ah, 1Ah
		mov	dx, [bp+arg_0]
		int	21h
		mov	ah, 4Fh
		int	21h
		pushf
		pop	cx
		xchg	bx, ax
		mov	ah, 1Ah
		pop	dx
		pop	ds
		int	21h
		push	cx
		popf
		pop	ds
		jb	short loc_22FC
		xor	ax, ax
		jmp	short loc_2300

loc_22FC:
		push	bx
		call	sub_5F9

loc_2300:
		pop	bp
		retf
sub_22D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2302		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	[bp+var_2], 0
		mov	di, word_7BF44
		mov	si, 56D4h
		jmp	short loc_232C

loc_2318:
		test	word ptr [si+2], 3
		jz	short loc_2329
		push	si
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		inc	[bp+var_2]

loc_2329:
		add	si, 10h

loc_232C:
		mov	ax, di
		dec	di
		or	ax, ax
		jnz	short loc_2318
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_2302		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_233C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_2B34
		add	sp, 0Ah
		pop	bp
		retf
sub_233C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Strrchr_Like
; (sub_1E70 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Strrchr_Like
; (sub_2070 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — recherche un caractère en fin de chaîne via sub_2B1C(strlen)+sub_2474 :
; strrchr-like.
; ==============================================================================================
CRT_Strrchr_Like		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		or	di, di
		jnz	short loc_2368

loc_2364:
		xor	ax, ax
		jmp	short loc_238D

loc_2368:
		push	di
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2364
		push	di
		push	si
		push	[bp+arg_2]
		call	sub_281E
		or	ax, ax
		jz	short loc_238A
		mov	bx, si
		mov	al, [bx+di-1]
		mov	ah, 0
		jmp	short loc_238D

loc_238A:
		mov	ax, 0FFFFh

loc_238D:
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strrchr_Like		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2391		proc far

saved_4		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+saved_4]
		cmp	word ptr [si], 0
		jge	short loc_23A8
		mov	dx, [si+6]
		add	dx, [si]
		inc	dx
		mov	di, dx
		jmp	short loc_23B3

loc_23A8:
		mov	ax, [si]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	dx, ax
		mov	di, ax

loc_23B3:
		test	word ptr [si+2], 40h
		jnz	short loc_23E6
		mov	cx, [si+0Ah]
		cmp	word ptr [si], 0
		jge	short loc_23DF
		jmp	short loc_23CD

loc_23C4:
		dec	cx
		mov	bx, cx
		cmp	byte ptr [bx], 0Ah
		jnz	short loc_23CD
		inc	di

loc_23CD:
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_23C4
		jmp	short loc_23E6

loc_23D6:
		mov	bx, cx
		inc	cx
		cmp	byte ptr [bx], 0Ah
		jnz	short loc_23DF
		inc	di

loc_23DF:
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_23D6

loc_23E6:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		ret	2
sub_2391		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_WriteTextMode (sub_1F06 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à Stdio_WriteTextMode (sub_2106 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — écriture bas
; niveau d'un buffer FILE* avec traduction CR/LF (sub_20A9) puis lseek/write (sub_605) : flush
; écriture d'un stream texte.
; ==============================================================================================
Stdio_WriteTextMode		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		push	si
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jz	short loc_2409
		mov	ax, 0FFFFh
		jmp	short loc_2452

loc_2409:
		cmp	di, 1
		jnz	short loc_241E
		cmp	word ptr [si], 0
		jle	short loc_241E
		push	si
		call	near ptr sub_2391
		cwd
		sub	[bp+arg_2], ax
		sbb	[bp+arg_4], dx

loc_241E:
		and	word ptr [si+2], 0FE5Fh
		mov	word ptr [si], 0
		mov	ax, [si+8]
		mov	[si+0Ah], ax
		push	di
		push	[bp+arg_4]
		push	[bp+arg_2]
		mov	al, [si+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8
		cmp	dx, 0FFFFh
		jnz	short loc_2450
		cmp	ax, 0FFFFh
		jnz	short loc_2450
		mov	ax, 0FFFFh
		jmp	short loc_2452

loc_2450:
		xor	ax, ax

loc_2452:
		pop	di
		pop	si
		pop	bp
		retf
Stdio_WriteTextMode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2456		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	ax, 1
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		mov	al, [si+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		cmp	dx, 0FFFFh
		jnz	short loc_248A
		cmp	ax, 0FFFFh
		jnz	short loc_248A
		jmp	loc_2512

loc_248A:
		cmp	word ptr [si], 0
		jge	short loc_2507
		mov	al, [si+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+5816h], 800h
		jz	short loc_24FA
		mov	ax, 2
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		mov	al, [si+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		cmp	dx, 0FFFFh
		jnz	short loc_24C6
		cmp	ax, 0FFFFh
		jz	short loc_2518

loc_24C6:
		xor	ax, ax
		push	ax
		push	[bp+var_2]
		push	[bp+var_4]
		mov	al, [si+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8
		cmp	dx, 0FFFFh
		jnz	short loc_24EE
		cmp	ax, 0FFFFh
		jnz	short loc_24EE
		mov	dx, 0FFFFh
		mov	ax, 0FFFFh
		jmp	short loc_2518

loc_24EE:
		mov	ax, [bp+var_6]
		mov	dx, [bp+var_8]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx

loc_24FA:
		push	si
		call	near ptr sub_2391
		cwd
		add	[bp+var_4], ax
		adc	[bp+var_2], dx
		jmp	short loc_2512

loc_2507:
		push	si
		call	near ptr sub_2391
		cwd
		sub	[bp+var_4], ax
		sbb	[bp+var_2], dx

loc_2512:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_2518:
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_2456		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_251D		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	ds
		pop	es
		or	di, di
		jz	short loc_2548
		mov	al, 0
		mov	ah, [di]
		mov	cx, 0FFFFh
		cld
		repne scasb
		not	cx
		dec	cx
		jz	short loc_2548
		mov	di, word_7C0FC
		or	di, di
		mov	[bp+var_2], di
		jnz	short loc_2553

loc_2548:
		xor	ax, ax
		jmp	short loc_2576

loc_254C:
		add	[bp+var_2], 2
		mov	di, [bp+var_2]

loc_2553:
		mov	di, [di]
		or	di, di
		jz	short loc_2548
		mov	al, [di]
		or	al, al
		jz	short loc_2548
		cmp	ah, al
		jnz	short loc_254C
		mov	bx, cx
		cmp	byte ptr [bx+di], 3Dh
		jnz	short loc_254C
		mov	si, [bp+arg_0]
		repe cmpsb
		xchg	bx, cx
		jnz	short loc_254C
		inc	di
		mov	ax, di

loc_2576:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_251D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Itoa_Signed10
; (sub_2094 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; CRT_Itoa_Signed10 (sub_2235 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — wrapper sprintf %d signé base10 via sub_56B (itoa signé).
; ==============================================================================================
CRT_Itoa_Signed10		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_4]
		cmp	cx, 0Ah
		jnz	short loc_258F
		mov	ax, bx
		cwd
		jmp	short loc_2593

loc_258F:
		mov	ax, bx
		xor	dx, dx

loc_2593:
		push	dx
		push	ax
		push	[bp+arg_2]
		push	cx
		mov	al, 1
		push	ax
		mov	al, 61h
		push	ax
		call	sub_67D
		pop	bp
		retf
CRT_Itoa_Signed10		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Itoa_Unsigned
; (sub_20BC de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; CRT_Itoa_Unsigned (sub_225D de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — wrapper itoa non signé base10.
; ==============================================================================================
CRT_Itoa_Unsigned		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_6]
		mov	al, 0
		push	ax
		mov	al, 61h
		push	ax
		call	sub_67D
		pop	bp
		retf
CRT_Itoa_Unsigned		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Itoa_BaseVariant
; (sub_20D6 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; CRT_Itoa_BaseVariant (sub_2277 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — wrapper itoa base variable, signé uniquement si base=10.
; ==============================================================================================
CRT_Itoa_BaseVariant		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_6]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	[bp+arg_4]
		push	ax
		cmp	ax, 0Ah
		jnz	short loc_25D8
		mov	ax, 1
		jmp	short loc_25DA

loc_25D8:
		xor	ax, ax

loc_25DA:
		push	ax
		mov	al, 61h
		push	ax
		call	sub_67D
		pop	bp
		retf
CRT_Itoa_BaseVariant		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Memmove (sub_20FB
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Memmove (sub_229C
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far
; — memmove (rep movsw+movsb) : équivalent _fmemcpy public.
; ==============================================================================================
CRT_Memmove		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		pop	es
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	cx, [bp+arg_4]
		shr	cx, 1
		cld
		rep movsw
		jnb	short loc_25FB
		movsb

loc_25FB:
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
CRT_Memmove		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Memset (sub_211A de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à CRT_Memset (sub_22BB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; memset (rep stosw+stosb, alignement pair géré).
; ==============================================================================================
CRT_Memset		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	di
		push	ds
		pop	es
		mov	di, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	al, [bp+arg_4]
		mov	ah, al
		cld
		test	di, 1
		jz	short loc_261E
		jcxz	short loc_2625
		stosb
		dec	cx

loc_261E:
		shr	cx, 1
		rep stosw
		jnb	short loc_2625
		stosb

loc_2625:
		pop	di
		pop	bp
		retf
CRT_Memset		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Memset_Public
; (sub_2140 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; CRT_Memset_Public (sub_22E1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — wrapper memset avec retour du pointeur : implémentation
; publique memset().
; ==============================================================================================
CRT_Memset_Public		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr CRT_Memset
		add	sp, 6
		mov	ax, si
		pop	si
		pop	bp
		retf
CRT_Memset_Public		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2643		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		pop	es
		mov	ax, [bp+arg_0]
		cmp	ax, [bp+arg_2]
		jnb	short loc_2658
		std
		mov	ax, 1
		jmp	short loc_265B

loc_2658:
		cld
		xor	ax, ax

loc_265B:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cx, [bp+arg_4]
		or	ax, ax
		jz	short loc_266E
		add	si, cx
		dec	si
		add	di, cx
		dec	di

loc_266E:
		test	di, 1
		jz	short loc_2678
		jcxz	short loc_2687
		movsb
		dec	cx

loc_2678:
		sub	si, ax
		sub	di, ax
		shr	cx, 1
		rep movsw
		jnb	short loc_2687
		add	si, ax
		add	di, ax
		movsb

loc_2687:
		cld
		pop	di
		pop	si
		pop	bp
		retf
sub_2643		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_268C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		push	si
		push	[bp+arg_2]
		push	cs
		call	near ptr sub_2643
		add	sp, 6
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_268C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Msg_NullPtrAssign (sub_21BE de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à CRT_Msg_NullPtrAssign (sub_22FC de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — wrapper sprintf avec format fixe (pointeurs
; 2474h/aNullPointerAss+45h) : probable message runtime 'Null pointer assignment'.
; ==============================================================================================
CRT_Msg_NullPtrAssign		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 281Eh
		push	ax
		mov	ax, 56E4h
		push	ax
		push	[bp+arg_0]
		lea	ax, [bp+arg_2]
		push	ax
		call	sub_18F9
		pop	bp
		retf
CRT_Msg_NullPtrAssign		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Stdio_Ungetc (sub_21D5
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à Stdio_Ungetc (sub_2313
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far
; — décrémente le compteur d'ungetc puis appelle sub_232C : implémentation ungetc().
; ==============================================================================================
Stdio_Ungetc		proc far

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_2]
		dec	word ptr [si]
		push	si
		mov	al, [bp+arg_0]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_Putc
		pop	cx
		pop	cx
		pop	si
		pop	bp
		retf
Stdio_Ungetc		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_Putc (sub_21EE de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite
; d'instructions, 3 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à Stdio_Putc (sub_232C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à
; revérifier ici. — far — putc()/fputc() interne : écrit un octet dans le buffer FILE*, gère
; line-buffering (flush sur \n/\r via sub_1F99), unbuffered (sub_605), et erreurs matherr-like
; via sub_2CC7.
; ==============================================================================================
Stdio_Putc		proc far

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_2]
		mov	al, [bp+arg_0]
		mov	byte_7D46E, al
		cmp	word ptr [di], 0FFFFh
		jge	short loc_2725
		inc	word ptr [di]
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	[bx], al
		test	word ptr [di+2], 8
		jnz	short loc_26FD
		jmp	loc_2803

loc_26FD:
		cmp	byte_7D46E, 0Ah
		jz	short loc_270E
		cmp	byte_7D46E, 0Dh
		jz	short loc_270E
		jmp	loc_2803

loc_270E:
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_271C
		jmp	loc_2803

loc_271C:
		mov	ax, 0FFFFh
		jmp	loc_2808
		jmp	loc_2803

loc_2725:
		test	word ptr [di+2], 90h
		jnz	short loc_2733
		test	word ptr [di+2], 2
		jnz	short loc_2739

loc_2733:
		or	word ptr [di+2], 10h
		jmp	short loc_271C

loc_2739:
		or	word ptr [di+2], 100h
		cmp	word ptr [di+6], 0
		jz	short loc_2790
		cmp	word ptr [di], 0
		jz	short loc_2754
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_271C

loc_2754:
		mov	ax, [di+6]
		neg	ax
		mov	[di], ax
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	al, byte_7D46E
		mov	[bx], al
		test	word ptr [di+2], 8
		jnz	short loc_2770
		jmp	loc_2803

loc_2770:
		cmp	byte_7D46E, 0Ah
		jz	short loc_2781
		cmp	byte_7D46E, 0Dh
		jz	short loc_2781
		jmp	loc_2803

loc_2781:
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jz	short loc_2803
		jmp	short loc_271C
		jmp	short loc_2803

loc_2790:
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+5816h], 800h
		jz	short loc_27B7
		mov	ax, 2
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8

loc_27B7:
		cmp	byte_7D46E, 0Ah
		jnz	short loc_27DF
		test	word ptr [di+2], 40h
		jnz	short loc_27DF
		mov	ax, 1
		push	ax
		mov	ax, 59CEh
		push	ax
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		cmp	ax, 1
		jnz	short loc_27F9

loc_27DF:
		mov	ax, 1
		push	ax
		mov	ax, 6D3Eh
		push	ax
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		cmp	ax, 1
		jz	short loc_2803

loc_27F9:
		test	word ptr [di+2], 200h
		jnz	short loc_2803
		jmp	loc_2733

loc_2803:
		mov	al, byte_7D46E
		mov	ah, 0

loc_2808:
		pop	di
		pop	si
		pop	bp
		retf
Stdio_Putc		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_280C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 56E4h
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr Stdio_Putc
		pop	cx
		pop	cx
		pop	bp
		retf
sub_280C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_281E		proc near

var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		test	word ptr [di+2], 8
		jz	short loc_2860
		jmp	short loc_2853

loc_2838:
		push	di
		mov	bx, [bp+arg_4]
		inc	[bp+arg_4]
		mov	al, [bx]
		cbw
		push	ax
		push	cs
		call	near ptr Stdio_Putc
		pop	cx
		pop	cx
		cmp	ax, 0FFFFh
		jnz	short loc_2853

loc_284E:
		xor	ax, ax
		jmp	loc_29BE

loc_2853:
		mov	ax, [bp+arg_2]
		dec	[bp+arg_2]
		or	ax, ax
		jnz	short loc_2838
		jmp	loc_29BB

loc_2860:
		test	word ptr [di+2], 40h
		jnz	short loc_286A
		jmp	loc_295C

loc_286A:
		cmp	word ptr [di+6], 0
		jnz	short loc_2873
		jmp	loc_2918

loc_2873:
		mov	ax, [di+6]
		cmp	ax, [bp+arg_2]
		jnb	short loc_28D3
		cmp	word ptr [di], 0
		jz	short loc_288B
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_284E

loc_288B:
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+5816h], 800h
		jz	short loc_28B2
		mov	ax, 2
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8

loc_28B2:
		push	[bp+arg_2]
		push	[bp+arg_4]
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		cmp	ax, [bp+arg_2]
		jnz	short loc_28CD
		jmp	loc_29BB

loc_28CD:
		jmp	loc_284E
		jmp	loc_29BB

loc_28D3:
		mov	ax, [di]
		add	ax, [bp+arg_2]
		jl	short loc_28F7
		cmp	word ptr [di], 0
		jnz	short loc_28E9
		mov	ax, 0FFFFh
		sub	ax, [di+6]
		mov	[di], ax
		jmp	short loc_28F7

loc_28E9:
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jz	short loc_28F7
		jmp	loc_284E

loc_28F7:
		push	[bp+arg_2]
		push	[bp+arg_4]
		push	word ptr [di+0Ah]
		nop
		push	cs
		call	near ptr CRT_Memmove
		add	sp, 6
		mov	ax, [di]
		add	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [bp+arg_2]
		add	[di+0Ah], ax
		jmp	loc_29BB

loc_2918:
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+5816h], 800h
		jz	short loc_293F
		mov	ax, 2
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8

loc_293F:
		push	[bp+arg_2]
		push	[bp+arg_4]
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		cmp	ax, [bp+arg_2]
		jz	short loc_29BB
		jmp	loc_284E
		jmp	short loc_29BB

loc_295C:
		cmp	word ptr [di+6], 0
		jz	short loc_29A0
		jmp	short loc_2994

loc_2964:
		inc	word ptr [di]
		jge	short loc_297C
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	si, [bp+arg_4]
		inc	[bp+arg_4]
		mov	al, [si]
		mov	[bx], al
		mov	ah, 0
		jmp	short loc_298C

loc_297C:
		push	di
		mov	bx, [bp+arg_4]
		inc	[bp+arg_4]
		mov	al, [bx]
		push	ax
		push	cs
		call	near ptr Stdio_Ungetc
		pop	cx
		pop	cx

loc_298C:
		cmp	ax, 0FFFFh
		jnz	short loc_2994
		jmp	loc_284E

loc_2994:
		mov	ax, [bp+arg_2]
		dec	[bp+arg_2]
		or	ax, ax
		jnz	short loc_2964
		jmp	short loc_29BB

loc_29A0:
		push	[bp+arg_2]
		push	[bp+arg_4]
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_WriteLowLevel
		add	sp, 6
		cmp	ax, [bp+arg_2]
		jz	short loc_29BB
		jmp	loc_284E

loc_29BB:
		mov	ax, [bp+var_2]

loc_29BE:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret	6
sub_281E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_SetupFileStruct (sub_24DE de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Stdio_SetupFileStruct (sub_261C de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — 112 lignes, initialise les champs d'une
; structure FILE* (buffer, position, flags [si+2] bits 4/8) : setvbuf()/setup interne de flux
; (fdopen).
; ==============================================================================================
Stdio_SetupFileStruct		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		cmp	[si+0Eh], si
		jnz	short loc_29E2
		cmp	[bp+arg_4], 2
		jg	short loc_29E2
		cmp	di, 7FFFh
		jbe	short loc_29E8

loc_29E2:
		mov	ax, 0FFFFh
		jmp	loc_2A9A

loc_29E8:
		cmp	word_7C102, 0
		jnz	short loc_29FD
		cmp	si, 56E4h
		jnz	short loc_29FD
		mov	word_7C102, 1
		jmp	short loc_2A10

loc_29FD:
		cmp	word_7C100, 0
		jnz	short loc_2A10
		cmp	si, 56D4h
		jnz	short loc_2A10
		mov	word_7C100, 1

loc_2A10:
		cmp	word ptr [si], 0
		jz	short loc_2A28
		mov	ax, 1
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		push	si
		nop
		push	cs
		call	near ptr Stdio_WriteTextMode
		add	sp, 8

loc_2A28:
		test	word ptr [si+2], 4
		jz	short loc_2A38
		push	word ptr [si+8]
		call	sub_65A86
		pop	cx

loc_2A38:
		and	word ptr [si+2], 0FFF3h
		mov	word ptr [si+6], 0
		mov	ax, si
		add	ax, 5
		mov	[si+8], ax
		mov	[si+0Ah], ax
		cmp	[bp+arg_4], 2
		jz	short loc_2A98
		or	di, di
		jbe	short loc_2A98
		mov	word_7BDFA, seg seg000
		mov	word ptr dword_7BDF8, 37A0h
		cmp	[bp+arg_2], 0
		jnz	short loc_2A82
		push	di
		call	sub_6596D
		pop	cx
		mov	[bp+arg_2], ax
		or	ax, ax
		jnz	short loc_2A79
		jmp	loc_29E2

loc_2A79:
		or	word ptr [si+2], 4
		jmp	short loc_2A82
		jmp	loc_29E2

loc_2A82:
		mov	ax, [bp+arg_2]
		mov	[si+0Ah], ax
		mov	[si+8], ax
		mov	[si+6], di
		cmp	[bp+arg_4], 1
		jnz	short loc_2A98
		or	word ptr [si+2], 8

loc_2A98:
		xor	ax, ax

loc_2A9A:
		pop	di
		pop	si
		pop	bp
		retf
Stdio_SetupFileStruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A9E		proc near

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2AD7
		push	di
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		cmp	ax, [bp+arg_0]
		jb	short loc_2ACE
		push	[bp+arg_0]
		push	di
		push	si
		nop
		push	cs
		call	near ptr CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx+si], 0
		jmp	short loc_2AD7

loc_2ACE:
		push	di
		push	si
		nop
		push	cs
		call	near ptr CRT_Strcpy
		pop	cx
		pop	cx

loc_2AD7:
		pop	di
		pop	si
		pop	bp
		ret	6
sub_2A9E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2ADD		proc near

var_2		= word ptr -2
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si-1], 2Eh
		jnz	short loc_2AEE
		dec	si

loc_2AEE:
		dec	si
		mov	bx, si
		mov	al, [bx]
		cbw
		mov	[bp+var_2], ax
		mov	cx, 4
		mov	bx, offset word_2B24

loc_2AFD:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_2]
		jz	short loc_2B0C
		add	bx, 2
		loop	short loc_2AFD
		jmp	short loc_2B1B

loc_2B0C:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_2B10:
		cmp	byte ptr [si-2], 0
		jnz	short loc_2B1B

loc_2B16:
		mov	ax, 1
		jmp	short loc_2B1D

loc_2B1B:
		xor	ax, ax

loc_2B1D:
		pop	si
		mov	sp, bp
		pop	bp
		ret	2
sub_2ADD		endp

; START OF FUNCTION CHUNK FOR sub_2ADD
word_2B24	dw 0
		dw 2Fh
		dw 3Ah
		dw 5Ch
off_2B2C	dw offset loc_2B16
		dw offset loc_2B16
		dw offset loc_2B10
		dw offset loc_2B16
; END OF FUNCTION CHUNK FOR sub_2ADD

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B34		proc far

var_56		= word ptr -56h
var_55		= word ptr -55h
var_54		= word ptr -54h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 56h
		push	si
		push	di
		mov	[bp+var_2], 0
		cmp	[bp+arg_2], 0
		jz	short loc_2B4D
		mov	bx, [bp+arg_2]
		mov	byte ptr [bx], 0

loc_2B4D:
		cmp	[bp+arg_4], 0
		jz	short loc_2B59
		mov	bx, [bp+arg_4]
		mov	byte ptr [bx], 0

loc_2B59:
		cmp	[bp+arg_6], 0
		jz	short loc_2B65
		mov	bx, [bp+arg_6]
		mov	byte ptr [bx], 0

loc_2B65:
		cmp	[bp+arg_8], 0
		jz	short loc_2B71
		mov	bx, [bp+arg_8]
		mov	byte ptr [bx], 0

loc_2B71:
		lea	si, [bp+var_56]
		jmp	short loc_2B79

loc_2B76:
		inc	[bp+arg_0]

loc_2B79:
		mov	bx, [bp+arg_0]
		cmp	byte ptr [bx], 20h
		jz	short loc_2B76
		push	bx
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		mov	di, ax
		cmp	ax, 50h
		jle	short loc_2B92
		mov	di, 50h

loc_2B92:
		mov	byte ptr [si], 0
		inc	si
		push	di
		push	[bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr CRT_Strncpy_Pad
		add	sp, 6
		add	si, di
		mov	byte ptr [si], 0
		xor	di, di

loc_2BAA:
		dec	si
		mov	bx, si
		mov	al, [bx]
		cbw
		mov	[bp+var_4], ax
		mov	cx, 7
		mov	bx, offset word_2C90

loc_2BB9:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_4]
		jz	short loc_2BC8
		add	bx, 2
		loop	short loc_2BB9
		jmp	short loc_2BAA

loc_2BC8:
		jmp	word ptr cs:[bx+0Eh] ; switch jump

loc_2BCC:
		or	di, di
		jnz	short loc_2BDC
		cmp	byte ptr [si+1], 0
		jnz	short loc_2BDC
		push	si
		call	sub_2ADD
		mov	di, ax

loc_2BDC:
		or	di, di
		jnz	short loc_2BAA
		test	[bp+var_2], 2
		jnz	short loc_2BAA
		or	[bp+var_2], 2
		push	[bp+arg_8]
		push	si
		mov	ax, 4
		push	ax
		call	sub_2A9E
		mov	byte ptr [si], 0
		jmp	short loc_2BAA

loc_2BFB:
		lea	ax, [bp+var_54]
		cmp	ax, si
		jnz	short loc_2BAA

loc_2C02:
		or	di, di
		jz	short loc_2C23
		inc	si
		mov	bx, si
		cmp	byte ptr [bx], 0
		jz	short loc_2C12
		or	[bp+var_2], 8

loc_2C12:
		push	[bp+arg_4]
		push	si
		mov	ax, 41h
		push	ax
		call	sub_2A9E
		mov	byte ptr [si], 0
		dec	si
		jmp	short loc_2C6A

loc_2C23:
		or	di, di
		jnz	short loc_2BAA
		inc	di
		inc	si
		mov	bx, si
		cmp	byte ptr [bx], 0
		jz	short loc_2C34
		or	[bp+var_2], 4

loc_2C34:
		push	[bp+arg_6]
		push	si
		mov	ax, 8
		push	ax
		call	sub_2A9E
		mov	byte ptr [si], 0
		dec	si
		cmp	byte ptr [si], 0
		jz	short loc_2C6A
		cmp	byte ptr [si], 3Ah
		jz	short loc_2C50
		jmp	loc_2BAA

loc_2C50:
		lea	ax, [bp+var_54]
		cmp	ax, si
		jz	short loc_2C5A
		jmp	loc_2BAA

loc_2C5A:
		jmp	short loc_2C6A

loc_2C5C:
		or	di, di
		jz	short loc_2C63
		jmp	loc_2BAA

loc_2C63:
		or	[bp+var_2], 1
		jmp	loc_2BAA

loc_2C6A:
		cmp	byte ptr [si], 3Ah
		jnz	short loc_2C87
		cmp	byte ptr [bp+var_55], 0
		jz	short loc_2C79
		or	[bp+var_2], 10h

loc_2C79:
		push	[bp+arg_2]
		lea	ax, [bp+var_55]
		push	ax
		mov	ax, 2
		push	ax
		call	sub_2A9E

loc_2C87:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_2B34		endp

; START OF FUNCTION CHUNK FOR sub_2B34
word_2C90	dw 0
		dw 2Ah
		dw 2Eh
		dw 2Fh
		dw 3Ah
		dw 3Fh
		dw 5Ch
off_2C9E	dw offset loc_2C02
		dw offset loc_2C5C
		dw offset loc_2BCC
		dw offset loc_2C23
		dw offset loc_2BFB
		dw offset loc_2C5C
		dw offset loc_2C23
; END OF FUNCTION CHUNK FOR sub_2B34

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CAC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_2B34
		add	sp, 0Ah
		pop	bp
		retf
sub_2CAC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CC7		proc far

saved_4		= word ptr  4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+saved_4]
		push	di
		push	[bp+arg_2]
		push	word ptr [si]
		nop
		push	cs
		call	near ptr CRT_Memmove
		add	sp, 6
		add	[si], di
		mov	bx, [si]
		mov	byte ptr [bx], 0
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		ret	6
sub_2CC7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Msg_Sprintf1 (sub_25DE de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à CRT_Msg_Sprintf1 (sub_2945 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — wrapper sprintf (sub_1233) avec format fixe
; 291Dh : génère un message formaté standard (probable message d'erreur runtime).
; ==============================================================================================
CRT_Msg_Sprintf1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx], 0
		mov	ax, 2CC7h
		push	ax
		lea	ax, [bp+arg_0]
		push	ax
		push	[bp+arg_2]
		lea	ax, [bp+arg_4]
		push	ax
		call	sub_18F9
		pop	bp
		retf
CRT_Msg_Sprintf1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Msg_Sprintf2 (sub_25FB de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à CRT_Msg_Sprintf2 (sub_2962 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — variante de sub_2945, arguments passés
; différemment (sprintf format 291Dh) : sibling wrapper de génération de message.
; ==============================================================================================
CRT_Msg_Sprintf2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx], 0
		mov	ax, 2CC7h
		push	ax
		lea	ax, [bp+arg_0]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_4]
		call	sub_18F9
		pop	bp
		retf
CRT_Msg_Sprintf2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D28		proc far

saved_4		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+saved_4]
		mov	bx, [si]
		inc	word ptr [si]
		mov	dl, [bx]
		mov	al, dl
		or	al, al
		jnz	short loc_2D40
		mov	ax, 0FFFFh
		jmp	short loc_2D44

loc_2D40:
		mov	al, dl
		mov	ah, 0

loc_2D44:
		pop	si
		pop	bp
		ret
sub_2D28		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D47		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		dec	word ptr [si]
		pop	si
		pop	bp
		ret
sub_2D47		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Msg_Sprintf3 (sub_29A9 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — wrapper vers
; sub_749(sprintf) avec 2 formats fixes (299Dh/297Eh) : génération de message formaté
; standard.
; ==============================================================================================
CRT_Msg_Sprintf3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		lea	ax, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		lea	ax, [bp+arg_0]
		push	ax
		mov	ax, 2D47h
		push	ax
		mov	ax, 2D28h
		push	ax
		call	near ptr sub_85B
		add	sp, 0Ah
		pop	bp
		retf
CRT_Msg_Sprintf3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D71		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	[bp+arg_2]
		lea	ax, [bp+arg_0]
		push	ax
		mov	ax, 2D47h
		push	ax
		mov	ax, 2D28h
		push	ax
		call	near ptr sub_85B
		add	sp, 0Ah
		pop	bp
		retf
sub_2D71		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Strcat (sub_2617 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à CRT_Strcat (sub_29E4 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — concatène deux chaînes
; ASCIIZ (trouve fin via repne scasb x2, puis movsw/movsb) : strcat().
; ==============================================================================================
CRT_Strcat		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		cld
		mov	di, [bp+arg_0]
		push	ds
		pop	es
		mov	dx, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		lea	si, [di-1]
		mov	di, [bp+arg_2]
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		sub	di, cx
		xchg	di, si
		test	si, 1
		jz	short loc_2DBB
		movsb
		dec	cx

loc_2DBB:
		shr	cx, 1
		rep movsw
		jnb	short loc_2DC2
		movsb

loc_2DC2:
		xchg	dx, ax
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strcat		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Strchr_WordAligned
; (sub_2650 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; CRT_Strchr_WordAligned (sub_2A1D de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — recherche d'un caractère dans une chaîne avec alignement
; pair/impair (lodsb/lodsw) : strchr() optimisé mot.
; ==============================================================================================
CRT_Strchr_WordAligned		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		cld
		mov	si, [bp+arg_0]
		mov	bl, [bp+arg_2]
		test	si, 1
		jz	short loc_2DE1
		lodsb
		cmp	al, bl
		jz	short loc_2DF6
		and	al, al
		jz	short loc_2DF2

loc_2DE1:
		lodsw
		cmp	al, bl
		jz	short loc_2DF7
		and	al, al
		jz	short loc_2DF2
		cmp	ah, bl
		jz	short loc_2DF6
		and	ah, ah
		jnz	short loc_2DE1

loc_2DF2:
		xor	ax, ax
		jmp	short loc_2DFA

loc_2DF6:
		inc	si

loc_2DF7:
		lea	ax, [si-2]

loc_2DFA:
		pop	si
		pop	bp
		retf
CRT_Strchr_WordAligned		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Strncmp_Like
; (sub_2686 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Strncmp_Like
; (sub_2A53 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — comparaison de deux chaînes selon longueur de la seconde (repe cmpsb) :
; strncmp-like (bornée par arg_2).
; ==============================================================================================
CRT_Strncmp_Like		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, ds
		mov	es, ax
		cld
		xor	ax, ax
		mov	bx, ax
		mov	di, [bp+arg_2]
		mov	si, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		mov	di, si
		mov	si, [bp+arg_0]
		repe cmpsb
		mov	al, [si-1]
		mov	bl, [di-1]
		sub	ax, bx
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strncmp_Like		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Strcpy (sub_26B5 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à CRT_Strcpy (sub_2A82 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; copie une chaîne ASCIIZ (strlen puis rep movsb) : strcpy().
; ==============================================================================================
CRT_Strcpy		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		pop	es
		cld
		mov	di, [bp+arg_2]
		mov	si, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		mov	di, [bp+arg_0]
		rep movsb
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strcpy		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Strdup (sub_26D7 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à CRT_Strdup (sub_2AA4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; alloue (sub_5D22B) et copie une chaîne (strlen+1 puis sub_229C) : strdup().
; ==============================================================================================
CRT_Strdup		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		inc	ax
		mov	[bp+var_2], ax
		push	ax
		call	sub_6596D
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2E7E
		push	[bp+var_2]
		push	si
		push	ax
		nop
		push	cs
		call	near ptr CRT_Memmove
		add	sp, 6

loc_2E7E:
		mov	ax, di
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Strdup		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Stricmp (sub_270F
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_Stricmp (sub_2ADC
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far
; — comparaison de chaînes insensible à la casse (table de plage 617Ah = A-Z/a-z) : stricmp().
; ==============================================================================================
CRT_Stricmp		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, ds
		mov	es, ax
		cld
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		xor	ax, ax
		mov	bx, ax
		mov	cx, 617Ah

loc_2E9D:
		lodsb
		mov	bl, [di]
		or	al, al
		jz	short loc_2EC0
		scasb
		jz	short loc_2E9D
		cmp	al, ch
		jb	short loc_2EB1
		cmp	al, cl
		ja	short loc_2EB1
		sub	al, 20h

loc_2EB1:
		cmp	bl, ch
		jb	short loc_2EBC
		cmp	bl, cl
		ja	short loc_2EBC
		sub	bl, 20h

loc_2EBC:
		cmp	al, bl
		jz	short loc_2E9D

loc_2EC0:
		sub	ax, bx
		pop	di
		pop	si
		pop	bp
		retf
CRT_Stricmp		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Strlen (sub_274F de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à CRT_Strlen (sub_2B1C de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — strlen() (repne scasb).
; ==============================================================================================
CRT_Strlen		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	di
		mov	ax, ds
		mov	es, ax
		mov	di, [bp+arg_0]
		xor	ax, ax
		cld
		mov	cx, 0FFFFh
		repne scasb
		xchg	cx, ax
		not	ax
		dec	ax
		pop	di
		pop	bp
		retf
CRT_Strlen		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Strupr (sub_2B99 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far — met en majuscule en place
; (soustrait 0x20 sur plage a-z) : strupr().
; ==============================================================================================
CRT_Strupr_2EE0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		cld
		mov	si, [bp+arg_0]
		mov	dx, si
		jmp	short loc_2EF7

loc_2EEC:
		sub	al, 41h
		cmp	al, 19h
		ja	short loc_2EF7
		add	al, 61h
		mov	[si-1], al

loc_2EF7:
		lodsb
		and	al, al
		jnz	short loc_2EEC
		xchg	dx, ax
		pop	si
		pop	bp
		retf
CRT_Strupr_2EE0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F00		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	di
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		mov	[bp+var_2], ax
		push	[bp+arg_2]
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		mov	si, ax
		cmp	si, [bp+arg_4]
		jbe	short loc_2F28
		mov	si, [bp+arg_4]

loc_2F28:
		push	si
		mov	ax, di
		add	ax, [bp+var_2]
		push	ax
		push	[bp+arg_2]
		nop
		push	cs
		call	near ptr sub_2643
		add	sp, 6
		mov	bx, [bp+var_2]
		add	bx, si
		mov	byte ptr [bx+di], 0
		mov	ax, di
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_2F00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F4A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, ds
		mov	es, ax
		cld
		mov	di, [bp+arg_2]
		mov	si, di
		mov	ax, [bp+arg_4]
		mov	cx, ax
		jcxz	short loc_2F7D
		mov	bx, ax
		xor	al, al
		repne scasb
		sub	bx, cx
		mov	cx, bx
		mov	di, si
		mov	si, [bp+arg_0]
		repe cmpsb
		mov	al, [si-1]
		mov	bl, [di-1]
		xor	ah, ah
		mov	bh, ah
		sub	ax, bx

loc_2F7D:
		pop	di
		pop	si
		pop	bp
		retf
sub_2F4A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Strncpy_Pad (sub_280A de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à CRT_Strncpy_Pad (sub_2B6D de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — copie bornée
; avec padding (strlen source, rep movsb puis rep stosb pour compléter) : strncpy() avec
; remplissage.
; ==============================================================================================
CRT_Strncpy_Pad		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, ds
		mov	es, ax
		cld
		mov	di, [bp+arg_2]
		mov	si, di
		xor	al, al
		mov	bx, [bp+arg_4]
		mov	cx, bx
		repne scasb
		sub	bx, cx
		mov	di, [bp+arg_0]
		xchg	bx, cx
		rep movsb
		mov	cx, bx
		rep stosb
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strncpy_Pad		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FAD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		pop	es
		cld
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cx, [bp+arg_4]
		xor	ax, ax
		mov	bx, ax
		mov	dx, 617Ah

loc_2FC5:
		jcxz	short loc_2FEA
		lodsb
		mov	bl, [di]
		or	al, al
		jz	short loc_2FEA
		scasb
		loope	short loc_2FC5
		cmp	al, dh
		jb	short loc_2FDB
		cmp	al, dl
		ja	short loc_2FDB
		sub	al, 20h

loc_2FDB:
		cmp	bl, dh
		jb	short loc_2FE6
		cmp	bl, dl
		ja	short loc_2FE6
		sub	bl, 20h

loc_2FE6:
		cmp	al, bl
		jz	short loc_2FC5

loc_2FEA:
		sub	ax, bx
		pop	di
		pop	si
		pop	bp
		retf
sub_2FAD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FF0		proc far

saved_4		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+saved_4]
		mov	bx, [si]
		inc	word ptr [si]
		mov	al, [bx]
		cbw
		mov	dx, ax
		or	ax, ax
		jnz	short loc_3009
		mov	ax, 0FFFFh
		jmp	short loc_300B

loc_3009:
		mov	ax, dx

loc_300B:
		pop	si
		pop	bp
		ret
sub_2FF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_300E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		dec	word ptr [si]
		pop	si
		pop	bp
		ret
sub_300E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_301A		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_2]
		mov	[bp+var_2], 0
		mov	word_76850, 0
		jmp	short loc_3038

loc_3032:
		inc	[bp+arg_0]
		inc	[bp+var_2]

loc_3038:
		mov	bx, [bp+arg_0]
		mov	al, [bx]
		cbw
		mov	bx, ax
		mov	al, [bx+55C7h]
		cbw
		test	ax, 1
		jnz	short loc_3032
		mov	bx, [bp+arg_0]
		cmp	byte ptr [bx], 2Dh
		jnz	short loc_3057
		mov	ax, 1
		jmp	short loc_3059

loc_3057:
		xor	ax, ax

loc_3059:
		mov	di, ax
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, 7FFFh
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+arg_0]
		push	ax
		mov	ax, 300Eh
		push	ax
		mov	ax, 2FF0h
		push	ax
		call	sub_D21
		add	sp, 0Eh
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		cmp	[bp+var_4], 0
		jg	short loc_3090
		mov	ax, [bp+var_2]
		sub	[bp+arg_0], ax
		jmp	short loc_30DA

loc_3090:
		cmp	[bp+var_4], 2
		jnz	short loc_309E
		mov	word_76850, 22h
		jmp	short loc_30DA

loc_309E:
		cmp	[bp+var_4], 1
		jnz	short loc_30DA
		cmp	[bp+var_6], 0
		jl	short loc_30B7
		jnz	short loc_30B2
		cmp	[bp+var_8], 0
		jb	short loc_30B7

loc_30B2:
		mov	ax, 1
		jmp	short loc_30B9

loc_30B7:
		xor	ax, ax

loc_30B9:
		cmp	ax, di
		jnz	short loc_30DA
		mov	word_76850, 22h
		or	di, di
		jz	short loc_30CE
		mov	dx, 8000h
		xor	ax, ax
		jmp	short loc_30D4

loc_30CE:
		mov	dx, 7FFFh
		mov	ax, 0FFFFh

loc_30D4:
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax

loc_30DA:
		or	si, si
		jz	short loc_30E3
		mov	ax, [bp+arg_0]
		mov	[si], ax

loc_30E3:
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_301A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Strupr (sub_2B99 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far — met en majuscule en place
; (soustrait 0x20 sur plage a-z) : strupr().
; ==============================================================================================
CRT_Strupr_30EF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		cld
		mov	si, [bp+arg_0]
		mov	dx, si
		jmp	short loc_3106

loc_30FB:
		sub	al, 61h
		cmp	al, 19h
		ja	short loc_3106
		add	al, 41h
		mov	[si-1], al

loc_3106:
		lodsb
		and	al, al
		jnz	short loc_30FB
		xchg	dx, ax
		pop	si
		pop	bp
		retf
CRT_Strupr_30EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_310F		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	di, [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_33F8
		mov	ax, word_7C130
		mov	dx, word_7C12E
		add	dx, 0A600h
		adc	ax, 12CEh
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	si, [di]
		add	si, 0F844h
		mov	ax, si
		mov	cl, 2
		sar	ax, cl
		cwd
		push	ax
		push	dx
		mov	dx, 786h
		mov	ax, 1F80h
		pop	cx
		pop	bx
		call	sub_7F7
		add	[bp+var_4], ax
		adc	[bp+var_2], dx
		mov	ax, si
		and	ax, 3
		cwd
		push	ax
		push	dx
		mov	dx, 1E1h
		mov	ax, 3380h
		pop	cx
		pop	bx
		call	sub_7F7
		add	[bp+var_4], ax
		adc	[bp+var_2], dx
		test	si, 3
		jz	short loc_317B
		add	[bp+var_4], 5180h
		adc	[bp+var_2], 1

loc_317B:
		xor	cx, cx
		mov	al, [di+3]
		cbw
		dec	ax
		mov	si, ax
		jmp	short loc_318E

loc_3186:
		dec	si
		mov	al, [si+59D4h]
		cbw
		add	cx, ax

loc_318E:
		or	si, si
		jg	short loc_3186
		mov	al, [di+2]
		cbw
		dec	ax
		add	cx, ax
		cmp	byte ptr [di+3], 2
		jle	short loc_31A6
		test	word ptr [di], 3
		jnz	short loc_31A6
		inc	cx

loc_31A6:
		mov	bx, [bp+arg_2]
		mov	al, [bx+1]
		mov	ah, 0
		push	ax
		mov	ax, cx
		mov	dx, 18h
		imul	dx
		pop	dx
		add	ax, dx
		mov	si, ax
		cmp	word_7C132, 0
		jz	short loc_31DA
		mov	al, [bx+1]
		mov	ah, 0
		push	ax
		push	cx
		xor	ax, ax
		push	ax
		mov	ax, [di]
		add	ax, 0F84Eh
		push	ax
		call	sub_3579
		or	ax, ax
		jz	short loc_31DA
		dec	si

loc_31DA:
		mov	ax, si
		cwd
		push	ax
		push	dx
		xor	dx, dx
		mov	ax, 0E10h
		pop	cx
		pop	bx
		call	sub_7F7
		add	[bp+var_4], ax
		adc	[bp+var_2], dx
		mov	bx, [bp+arg_2]
		mov	al, [bx]
		mov	ah, 0
		cwd
		push	ax
		push	dx
		xor	dx, dx
		mov	ax, 3Ch
		pop	cx
		pop	bx
		call	sub_7F7
		mov	bx, [bp+arg_2]
		mov	bl, [bx+3]
		mov	bh, 0
		push	ax
		mov	ax, bx
		push	dx
		cwd
		pop	bx
		pop	cx
		add	cx, ax
		adc	bx, dx
		add	[bp+var_4], cx
		adc	[bp+var_2], bx
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_310F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3228		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		nop
		push	cs
		call	near ptr sub_33F8
		mov	ax, word_7C130
		mov	dx, word_7C12E
		add	dx, 0A600h
		adc	ax, 12CEh
		sub	[bp+arg_0], dx
		sbb	[bp+arg_2], ax
		mov	byte ptr [di+2], 0
		xor	ax, ax
		mov	dx, 3Ch
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_55A
		mov	[di+3], al
		xor	ax, ax
		mov	dx, 3Ch
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_54B
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		xor	ax, ax
		mov	dx, 3Ch
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_55A
		mov	[di], al
		xor	ax, ax
		mov	dx, 3Ch
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_54B
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		xor	ax, ax
		mov	dx, 88F8h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_54B
		mov	cl, 2
		shl	ax, cl
		add	ax, 7BCh
		mov	[si], ax
		xor	ax, ax
		mov	dx, 88F8h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_55A
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		cmp	[bp+arg_2], 0
		jl	short loc_3312
		jnz	short loc_32DF
		cmp	[bp+arg_0], 2250h
		jb	short loc_3312

loc_32DF:
		sub	[bp+arg_0], 2250h
		sbb	[bp+arg_2], 0
		inc	word ptr [si]
		xor	ax, ax
		mov	dx, 2238h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_54B
		add	[si], ax
		xor	ax, ax
		mov	dx, 2238h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_55A
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax

loc_3312:
		cmp	word_7C132, 0
		jz	short loc_3353
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_55A
		push	ax
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_54B
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, [si]
		add	ax, 0F84Eh
		push	ax
		call	sub_3579
		or	ax, ax
		jz	short loc_3353
		add	[bp+arg_0], 1
		adc	[bp+arg_2], 0

loc_3353:
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_55A
		mov	[di+1], al
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_54B
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		add	[bp+arg_0], 1
		adc	[bp+arg_2], 0
		test	word ptr [si], 3
		jnz	short loc_33B8
		cmp	[bp+arg_2], 0
		jl	short loc_33A2
		jg	short loc_3398
		cmp	[bp+arg_0], 3Ch
		jbe	short loc_33A2

loc_3398:
		sub	[bp+arg_0], 1
		sbb	[bp+arg_2], 0
		jmp	short loc_33B8

loc_33A2:
		cmp	[bp+arg_2], 0
		jnz	short loc_33B8
		cmp	[bp+arg_0], 3Ch
		jnz	short loc_33B8
		mov	byte ptr [si+3], 2
		mov	byte ptr [si+2], 1Dh
		jmp	short loc_33F4

loc_33B8:
		mov	byte ptr [si+3], 0
		jmp	short loc_33D3

loc_33BE:
		mov	al, [si+3]
		cbw
		mov	bx, ax
		mov	al, [bx+59D4h]
		cbw
		cwd
		sub	[bp+arg_0], ax
		sbb	[bp+arg_2], dx
		inc	byte ptr [si+3]

loc_33D3:
		mov	al, [si+3]
		cbw
		mov	bx, ax
		mov	al, [bx+59D4h]
		cbw
		cwd
		cmp	dx, [bp+arg_2]
		jl	short loc_33BE
		jnz	short loc_33EB
		cmp	ax, [bp+arg_0]
		jb	short loc_33BE

loc_33EB:
		inc	byte ptr [si+3]
		mov	al, byte ptr [bp+arg_0]
		mov	[si+2], al

loc_33F4:
		pop	di
		pop	si
		pop	bp
		retf
sub_3228		endp

; ----------------------------------------------------------------------

sub_33F8		proc far
		push	si
		push	di
		mov	ax, 5A04h
		push	ax
		nop
		push	cs
		call	near ptr sub_251D
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_347E
		push	ax
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		cmp	ax, 4
		jb	short loc_347E
		mov	al, [di]
		cbw
		mov	bx, ax
		mov	al, [bx+55C7h]
		cbw
		test	ax, 0Ch
		jz	short loc_347E
		mov	al, [di+1]
		cbw
		mov	bx, ax
		mov	al, [bx+55C7h]
		cbw
		test	ax, 0Ch
		jz	short loc_347E
		mov	al, [di+2]
		cbw
		mov	bx, ax
		mov	al, [bx+55C7h]
		cbw
		test	ax, 0Ch
		jz	short loc_347E
		cmp	byte ptr [di+3], 2Dh
		jz	short loc_345E
		cmp	byte ptr [di+3], 2Bh
		jz	short loc_345E
		mov	al, [di+3]
		cbw
		mov	bx, ax
		test	byte ptr [bx+55C7h], 2
		jz	short loc_347E

loc_345E:
		mov	al, [di+3]
		cbw
		mov	bx, ax
		mov	al, [bx+55C7h]
		cbw
		test	ax, 2
		jnz	short loc_34B1
		mov	al, [di+4]
		cbw
		mov	bx, ax
		mov	al, [bx+55C7h]
		cbw
		test	ax, 2
		jnz	short loc_34B1

loc_347E:
		mov	word_7C132, 1
		mov	word_7C130, 0
		mov	word_7C12E, 4650h
		mov	ax, 5A07h
		push	ax
		push	word_7C12A
		nop
		push	cs
		call	near ptr CRT_Strcpy
		pop	cx
		pop	cx
		mov	ax, 5A0Bh
		push	ax
		push	word_7C12C
		nop
		push	cs
		call	near ptr CRT_Strcpy
		pop	cx
		pop	cx
		jmp	loc_3576

loc_34B1:
		mov	ax, 4
		push	ax
		xor	ax, ax
		push	ax
		push	word_7C12C
		nop
		push	cs
		call	near ptr CRT_Memset_Public
		add	sp, 6
		mov	ax, 3
		push	ax
		push	di
		push	word_7C12A
		nop
		push	cs
		call	near ptr CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, word_7C12A
		mov	byte ptr [bx+3], 0
		mov	ax, di
		add	ax, 3
		push	ax
		nop
		push	cs
		call	near ptr sub_2189
		pop	cx
		push	ax
		push	dx
		xor	dx, dx
		mov	ax, 0E10h
		pop	cx
		pop	bx
		call	sub_7F7
		mov	word_7C130, dx
		mov	word_7C12E, ax
		mov	word_7C132, 0
		mov	si, 3
		jmp	short loc_356F

loc_3507:
		mov	bx, si
		mov	al, [bx+di]
		cbw
		mov	bx, ax
		test	byte ptr [bx+55C7h], 0Ch
		jz	short loc_356E
		mov	ax, di
		add	ax, si
		push	ax
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		cmp	ax, 3
		jb	short loc_3576
		mov	bx, di
		mov	al, [bx+si+1]
		cbw
		mov	bx, ax
		mov	al, [bx+55C7h]
		cbw
		test	ax, 0Ch
		jz	short loc_3576
		mov	bx, di
		mov	al, [bx+si+2]
		cbw
		mov	bx, ax
		mov	al, [bx+55C7h]
		cbw
		test	ax, 0Ch
		jz	short loc_3576
		mov	ax, 3
		push	ax
		mov	ax, di
		add	ax, si
		push	ax
		push	word_7C12C
		nop
		push	cs
		call	near ptr CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, word_7C12C
		mov	byte ptr [bx+3], 0
		mov	word_7C132, 1
		jmp	short loc_3576

loc_356E:
		inc	si

loc_356F:
		mov	bx, si
		cmp	byte ptr [bx+di], 0
		jnz	short loc_3507

loc_3576:
		pop	di
		pop	si
		retf
sub_33F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3579		proc near

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		cmp	[bp+arg_2], 0
		jnz	short loc_35AF
		mov	si, [bp+arg_4]
		cmp	[bp+arg_4], 3Bh
		jb	short loc_3598
		mov	ax, [bp+arg_0]
		add	ax, 46h
		test	ax, 3
		jnz	short loc_3598
		dec	si

loc_3598:
		mov	[bp+arg_2], 0
		jmp	short loc_35A2

loc_359F:
		inc	[bp+arg_2]

loc_35A2:
		mov	bx, [bp+arg_2]
		shl	bx, 1
		cmp	[bx+59E0h], si
		jbe	short loc_359F
		jmp	short loc_35D0

loc_35AF:
		mov	bx, [bp+arg_2]
		dec	bx
		shl	bx, 1
		mov	ax, [bx+59E0h]
		add	[bp+arg_4], ax
		cmp	[bp+arg_2], 3
		jbe	short loc_35D0
		mov	ax, [bp+arg_0]
		add	ax, 46h
		test	ax, 3
		jnz	short loc_35D0
		inc	[bp+arg_4]

loc_35D0:
		cmp	[bp+arg_2], 4
		jb	short loc_3651
		jz	short loc_35E0
		cmp	[bp+arg_2], 0Ah
		ja	short loc_3651
		jnz	short loc_364C

loc_35E0:
		mov	bx, [bp+arg_2]
		shl	bx, 1
		cmp	[bp+arg_0], 10h
		jle	short loc_35FA
		cmp	[bp+arg_2], 4
		jnz	short loc_35FA
		mov	cx, [bx+59DEh]
		add	cx, 7
		jmp	short loc_35FE

loc_35FA:
		mov	cx, [bx+59E0h]

loc_35FE:
		mov	bx, [bp+arg_0]
		add	bx, 7B2h
		test	bl, 3
		jz	short loc_360B
		dec	cx

loc_360B:
		mov	bx, [bp+arg_0]
		inc	bx
		sar	bx, 1
		sar	bx, 1
		add	bx, cx
		mov	ax, 16Dh
		mul	[bp+arg_0]
		add	ax, bx
		add	ax, 4
		xor	dx, dx
		mov	bx, 7
		div	bx
		sub	cx, dx
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_2], 4
		jnz	short loc_3640
		cmp	ax, cx
		ja	short loc_364C
		jnz	short loc_3651
		cmp	[bp+arg_6], 2
		jb	short loc_3651
		jmp	short loc_364C

loc_3640:
		cmp	ax, cx
		jb	short loc_364C
		jnz	short loc_3651
		cmp	[bp+arg_6], 1
		ja	short loc_3651

loc_364C:
		mov	ax, 1
		jmp	short loc_3653

loc_3651:
		xor	ax, ax

loc_3653:
		pop	si
		pop	bp
		ret	8
sub_3579		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_WriteLowLevel (sub_2DE2 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Stdio_WriteLowLevel (sub_2BB9 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — 166 lignes, écriture bas niveau DOS d'un
; buffer (utilisée par sub_1F99/sub_232C) : implémentation write() de bas niveau du runtime
; stdio.
; ==============================================================================================
Stdio_WriteLowLevel		proc far

var_88		= word ptr -88h
var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 88h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	di, word_7BF44
		jb	short loc_3677
		mov	ax, 6
		push	ax
		call	sub_5F9
		jmp	loc_3760

loc_3677:
		mov	ax, [bp+arg_4]
		inc	ax
		cmp	ax, 2
		jnb	short loc_3685
		xor	ax, ax
		jmp	loc_3760

loc_3685:
		mov	bx, di
		shl	bx, 1
		test	word ptr [bx+5816h], 800h
		jz	short loc_36A4
		mov	ax, 2
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		push	di
		nop
		push	cs
		call	near ptr CRT_Lseek
		add	sp, 8

loc_36A4:
		mov	bx, di
		shl	bx, 1
		test	word ptr [bx+5816h], 4000h
		jnz	short loc_36C0
		push	[bp+arg_4]
		push	si
		push	di
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		jmp	loc_3760

loc_36C0:
		mov	bx, di
		shl	bx, 1
		and	word ptr [bx+5816h], 0FDFFh
		mov	[bp+var_6], si
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		jmp	short loc_3724

loc_36D5:
		dec	[bp+var_2]
		mov	bx, [bp+var_6]
		inc	[bp+var_6]
		mov	al, [bx]
		mov	[bp+var_3], al
		cmp	al, 0Ah
		jnz	short loc_36EB
		mov	byte ptr [si], 0Dh
		inc	si

loc_36EB:
		mov	al, [bp+var_3]
		mov	[si], al
		inc	si
		lea	ax, [bp+var_88]
		mov	dx, si
		sub	dx, ax
		cmp	dx, 80h
		jl	short loc_3728
		sub	si, ax
		push	si
		push	ax
		push	di
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		mov	dx, ax
		cmp	ax, si
		jz	short loc_3724
		cmp	dx, 0FFFFh
		jnz	short loc_371C

loc_3717:
		mov	ax, 0FFFFh
		jmp	short loc_375B

loc_371C:
		mov	ax, [bp+arg_4]
		sub	ax, [bp+var_2]
		jmp	short loc_3757

loc_3724:
		lea	si, [bp+var_88]

loc_3728:
		cmp	[bp+var_2], 0
		jnz	short loc_36D5
		lea	ax, [bp+var_88]
		sub	si, ax
		mov	ax, si
		or	ax, ax
		jbe	short loc_375D
		push	si
		lea	ax, [bp+var_88]
		push	ax
		push	di
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		mov	dx, ax
		cmp	ax, si
		jz	short loc_375D
		cmp	dx, 0FFFFh
		jz	short loc_3717
		mov	ax, [bp+arg_4]

loc_3757:
		add	ax, dx
		sub	ax, si

loc_375B:
		jmp	short loc_3760

loc_375D:
		mov	ax, [bp+arg_4]

loc_3760:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Stdio_WriteLowLevel		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_ErrorHandler (sub_2EF0 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Stdio_ErrorHandler (sub_2CC7 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — 44 lignes, gestion d'erreur de stream avec
; messages fixes (4D7Ch/5EA8h) : probable handler d'erreur matherr/ferror.
; ==============================================================================================
Stdio_ErrorHandler		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 1
		test	word ptr [bx+5816h], 1
		jz	short loc_377C
		mov	ax, 5
		push	ax
		jmp	short loc_379B

loc_377C:
		mov	ah, 40h
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_2]
		int	21h
		jb	short loc_379A
		push	ax
		mov	bx, [bp+arg_0]
		shl	bx, 1
		or	word ptr [bx+5816h], 1000h
		pop	ax
		jmp	short loc_379E

loc_379A:
		push	ax

loc_379B:
		call	sub_5F9

loc_379E:
		pop	bp
		retf
Stdio_ErrorHandler		endp

; START OF FUNCTION CHUNK FOR Stdio_ErrorHandler
		push	si
		push	di
		mov	di, 4
		mov	si, 56D4h
		jmp	short loc_37BC

loc_37AA:
		test	word ptr [si+2], 3
		jz	short loc_37B8
		push	si
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx

loc_37B8:
		dec	di
		add	si, 10h

loc_37BC:
		or	di, di
		jnz	short loc_37AA
		pop	di
		pop	si
		retf
; END OF FUNCTION CHUNK FOR Stdio_ErrorHandler

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37C3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, ds
		les	di, [bp+arg_0]
		lds	si, [bp+arg_4]
		mov	cx, [bp+arg_8]
		shr	cx, 1
		cld
		rep movsw
		jnb	short loc_37DB
		movsb

loc_37DB:
		mov	ds, dx
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
sub_37C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37E7		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		push	di
		les	di, [bp+arg_0]
		mov	cx, [bp+arg_4]
		mov	al, [bp+arg_6]
		mov	ah, al
		cld
		test	di, 1
		jz	short loc_3801
		jcxz	short loc_3808
		stosb
		dec	cx

loc_3801:
		shr	cx, 1
		rep stosw
		jnb	short loc_3808
		stosb

loc_3808:
		pop	di
		pop	bp
		retf
sub_37E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_380B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_6]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_37E7
		add	sp, 8
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_380B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_MemFamily_Extra2 (sub_2F71 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à CRT_MemFamily_Extra2 (sub_2D48 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — (cluster
; mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra2		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		cld
		push	ds
		les	di, [bp+arg_0]
		mov	dx, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		push	es
		lea	si, [di-1]
		les	di, [bp+arg_4]
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		sub	di, cx
		push	es
		pop	ds
		pop	es
		xchg	di, si
		test	si, 1
		jz	short loc_385A
		movsb
		dec	cx

loc_385A:
		shr	cx, 1
		rep movsw
		jnb	short loc_3861
		movsb

loc_3861:
		xchg	dx, ax
		mov	dx, es
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_MemFamily_Extra3
; (sub_2FB0 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; CRT_MemFamily_Extra3 (sub_2D87 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra3		proc far

arg_0		= word ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		cld
		push	ds
		lds	si, [bp+arg_0]
		mov	bl, [bp+arg_4]
		test	si, 1
		jz	short loc_3884
		lodsb
		cmp	al, bl
		jz	short loc_389C
		and	al, al
		jz	short loc_3895

loc_3884:
		lodsw
		cmp	al, bl
		jz	short loc_389D
		and	al, al
		jz	short loc_3895
		cmp	ah, bl
		jz	short loc_389C
		and	ah, ah
		jnz	short loc_3884

loc_3895:
		pop	ds
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_38A3

loc_389C:
		inc	si

loc_389D:
		lea	ax, [si-2]
		mov	dx, ds
		pop	ds

loc_38A3:
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à CRT_MemFamily_Extra4
; (sub_2DC4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra4		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, ds
		cld
		xor	ax, ax
		mov	bx, ax
		les	di, [bp+arg_4]
		mov	si, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		mov	di, si
		lds	si, [bp+arg_0]
		repe cmpsb
		mov	al, [si-1]
		mov	bl, es:[di-1]
		sub	ax, bx
		mov	ds, dx
		pop	di
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38D6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		cld
		les	di, [bp+arg_4]
		mov	si, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		push	ds
		mov	ax, es
		mov	ds, ax
		les	di, [bp+arg_0]
		rep movsb
		pop	ds
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
sub_38D6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38FF		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_398A
		pop	cx
		pop	cx
		inc	ax
		mov	si, ax
		xor	ax, ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_4D7
		pop	cx
		pop	cx
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_393E
		push	si
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	dx
		push	[bp+var_4]
		nop
		push	cs
		call	near ptr sub_37C3
		add	sp, 0Ah

loc_393E:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_38FF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3949		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, ds
		cld
		lds	si, [bp+arg_0]
		les	di, [bp+arg_4]
		xor	ax, ax
		mov	bx, ax
		mov	cx, 617Ah

loc_395E:
		lodsb
		mov	bl, es:[di]
		or	al, al
		jz	short loc_3982
		scasb
		jz	short loc_395E
		cmp	al, ch
		jb	short loc_3973
		cmp	al, cl
		ja	short loc_3973
		sub	al, 20h

loc_3973:
		cmp	bl, ch
		jb	short loc_397E
		cmp	bl, cl
		ja	short loc_397E
		sub	bl, 20h

loc_397E:
		cmp	al, bl
		jz	short loc_395E

loc_3982:
		sub	ax, bx
		mov	ds, dx
		pop	di
		pop	si
		pop	bp
		retf
sub_3949		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_398A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	di
		les	di, [bp+arg_0]
		xor	ax, ax
		cmp	ax, [bp+arg_2]
		jnz	short loc_399C
		cmp	ax, di
		jz	short loc_39A6

loc_399C:
		cld
		mov	cx, 0FFFFh
		repne scasb
		xchg	cx, ax
		not	ax
		dec	ax

loc_39A6:
		pop	di
		pop	bp
		retf
sub_398A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_MemFamily_Extra7
; (sub_3035 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; CRT_MemFamily_Extra7 (sub_2E3C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — (cluster mémoire/chaînes, à approfondir si besoin).
; ==============================================================================================
CRT_MemFamily_Extra7		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, ds
		cld
		les	di, [bp+arg_4]
		mov	si, di
		mov	ax, [bp+arg_8]
		mov	cx, ax
		jcxz	short loc_39DB
		mov	bx, ax
		xor	al, al
		repne scasb
		sub	bx, cx
		mov	cx, bx
		mov	di, si
		lds	si, [bp+arg_0]
		repe cmpsb
		mov	al, [si-1]
		mov	bl, es:[di-1]
		xor	ah, ah
		mov	bh, ah
		sub	ax, bx

loc_39DB:
		mov	ds, dx
		pop	di
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39E1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		cld
		les	di, [bp+arg_4]
		mov	si, di
		xor	al, al
		mov	bx, [bp+arg_8]
		mov	cx, bx
		repne scasb
		sub	bx, cx
		push	ds
		mov	di, es
		mov	ds, di
		les	di, [bp+arg_0]
		xchg	bx, cx
		rep movsb
		mov	cx, bx
		rep stosb
		pop	ds
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
sub_39E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3A12		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		cld
		lds	si, [bp+arg_0]
		les	di, [bp+arg_4]
		mov	cx, [bp+arg_8]
		xor	ax, ax
		mov	bx, ax
		mov	dx, 617Ah

loc_3A29:
		jcxz	short loc_3A4F
		lodsb
		mov	bl, es:[di]
		or	al, al
		jz	short loc_3A4F
		scasb
		loope	short loc_3A29
		cmp	al, dh
		jb	short loc_3A40
		cmp	al, dl
		ja	short loc_3A40
		sub	al, 20h

loc_3A40:
		cmp	bl, dh
		jb	short loc_3A4B
		cmp	bl, dl
		ja	short loc_3A4B
		sub	bl, 20h

loc_3A4B:
		cmp	al, bl
		jz	short loc_3A29

loc_3A4F:
		sub	ax, bx
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_3A12		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3A56		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_3AA9
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		mov	word_7D47A, ax
		mov	word_7D478, dx
		jmp	short loc_3AA9

loc_3A73:
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		jmp	short loc_3A93

loc_3A81:
		les	bx, [bp+var_4]
		mov	al, es:[bx]
		les	bx, word_7D478
		cmp	al, es:[bx]
		jz	short loc_3A9C
		inc	[bp+var_4]

loc_3A93:
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_3A81

loc_3A9C:
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx], 0
		jz	short loc_3AB3
		inc	word_7D478

loc_3AA9:
		les	bx, word_7D478
		cmp	byte ptr es:[bx], 0
		jnz	short loc_3A73

loc_3AB3:
		les	bx, word_7D478
		cmp	byte ptr es:[bx], 0
		jnz	short loc_3AC3
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_3B19

loc_3AC3:
		mov	ax, word_7D47A
		mov	dx, word_7D478
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		jmp	short loc_3B09

loc_3AD2:
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		jmp	short loc_3AFC

loc_3AE0:
		les	bx, [bp+var_4]
		mov	al, es:[bx]
		les	bx, word_7D478
		cmp	al, es:[bx]
		jnz	short loc_3AF9
		mov	byte ptr es:[bx], 0
		inc	word_7D478
		jmp	short loc_3B13

loc_3AF9:
		inc	[bp+var_4]

loc_3AFC:
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_3AE0
		inc	word_7D478

loc_3B09:
		les	bx, word_7D478
		cmp	byte ptr es:[bx], 0
		jnz	short loc_3AD2

loc_3B13:
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]

loc_3B19:
		mov	sp, bp
		pop	bp
		retf
sub_3A56		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B1D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		cld
		push	ds
		lds	si, [bp+arg_0]
		mov	dx, si
		jmp	short loc_3B35

loc_3B2A:
		sub	al, 61h
		cmp	al, 19h
		ja	short loc_3B35
		add	al, 41h
		mov	[si-1], al

loc_3B35:
		lodsb
		and	al, al
		jnz	short loc_3B2A
		xchg	dx, ax
		mov	dx, ds
		pop	ds
		pop	si
		pop	bp
sub_3B1D		endp
seg000		ends
