seg000		segment	para public 'CODE' use16
		assume cs:seg000
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

		public start
start		proc near
		mov	dx, seg dseg
		mov	cs:2C7h, dx
		mov	ah, 30h
		int	21h
		mov	bp, word_59D22
		mov	bx, word_59D4C
		mov	ds, dx
		mov	word_59E3F, ax
		mov	word_59E3D, es
		mov	word_59E39, bx
		mov	word_59E55, bp
		call	sub_1B2
		mov	ax, word_59E39
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
		mov	word_59E37, cx
		mov	cx, 1
		shl	bx, cl
		add	bx, 8
		and	bx, 0FFF8h
		mov	word_59E3B, bx
		mov	dx, ds
		sub	bp, dx
		mov	di, word_5A3B8
		cmp	di, 200h
		jnb	short loc_6E
		mov	di, 200h
		mov	word_5A3B8, di

loc_6E:
		add	di, 6A56h
		jb	short loc_9C
		add	di, word_5EC92
		jb	short loc_9C
		mov	cl, 4
		shr	di, cl
		inc	di
		cmp	bp, di
		jb	short loc_9C
		cmp	word_5A3B8, 0
		jz	short loc_91
		cmp	word_5EC92, 0
		jnz	short loc_9F

loc_91:
		mov	di, 1000h
		cmp	bp, di
		ja	short loc_9F
		mov	di, bp
		jmp	short loc_9F

loc_9C:
		jmp	sub_2AF

loc_9F:
		mov	bx, di
		add	bx, dx
		mov	word_59E4D, bx
		mov	word_59E51, bx
		mov	ax, word_59E3D
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
		mov	es, cs:2C7h
		mov	di, 5298h
		mov	cx, 6A56h
		sub	cx, di
		cld
		rep stosb
		cmp	word_5EC68, 14h
		jbe	short loc_120
		cmp	byte ptr word_59E3F, 3
		jb	short loc_120
		ja	short loc_E9
		cmp	byte_59E40, 1Eh
		jb	short loc_120

loc_E9:
		mov	ax, 5801h
		mov	bx, 2
		int	21h
		jb	short loc_11D
		mov	ah, 67h
		mov	bx, word_5EC68
		int	21h
		jb	short loc_11D
		mov	ah, 48h
		mov	bx, 1
		int	21h
		jb	short loc_11D
		inc	ax
		mov	word_59E55, ax
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
		jmp	sub_2AF

loc_120:
		mov	ah, 0
		int	1Ah
		mov	word_59E43, dx
		mov	word_59E45, cx
		or	al, al
		jz	short loc_13C
		mov	ax, 40h
		mov	es, ax
		mov	bx, 70h
		mov	byte ptr es:[bx], 1

loc_13C:
		mov	es, cs:2C7h
		mov	si, 50E8h
		mov	di, 51F0h
		call	sub_222
		push	word_59E35
		push	word_59E33
		push	word_59E31
		call	sub_9DCA
		push	ax
		nop
		push	cs
		call	near ptr CRT_Exit
start		endp

; ----------------------------------------------------------------------

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Ovl_CopyStubTable (sub_197 de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE :
; même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Ovl_CopyStubTable (sub_163 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 2 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Ovl_CopyStubTable (sub_163 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — copie mémoire (memcpy-like via sub_264) 4EC8h→4F64h :
; init table du overlay manager.
; ==============================================================================================
Ovl_CopyStubTable		proc far
		mov	es, cs:2C7h
		push	si
		push	di
		mov	si, 51F0h
		mov	di, 5298h
		call	sub_266
		pop	di
		pop	si
		retf
Ovl_CopyStubTable		endp

; ----------------------------------------------------------------------

sub_174		proc far
		push	si
		push	di
		mov	es, cs:2C7h
		xor	ax, ax
		mov	si, ax
		mov	cx, 2Fh
		nop

loc_183:
		add	al, es:[si]
		adc	ah, 0
		inc	si
		loop	short loc_183
		sub	ax, 0D5Ch
		nop
		jz	short loc_19C
		mov	cx, 19h
		nop
		mov	dx, 2Fh
		call	sub_2A7

loc_19C:
		pop	di
		pop	si
		retf
sub_174		endp

; ----------------------------------------------------------------------

sub_19F		proc near
		mov	bp, sp
		mov	ah, 4Ch
		mov	al, [bp+4]
		int	21h
		mov	cx, 0Eh
		nop
		mov	dx, 48h
		jmp	loc_2B6
sub_19F		endp

; ----------------------------------------------------------------------

sub_1B2		proc near
		push	ds
		mov	ax, 3500h
		int	21h
		mov	word_59E21, bx
		mov	word_59E23, es
		mov	ax, 3504h
		int	21h
		mov	word_59E25, bx
		mov	word_59E27, es
		mov	ax, 3505h
		int	21h
		mov	word_59E29, bx
		mov	word_59E2B, es
		mov	ax, 3506h
		int	21h
		mov	word_59E2D, bx
		mov	word_59E2F, es
		mov	ax, 2500h
		mov	dx, cs
		mov	ds, dx
		mov	dx, 1A8h
		int	21h
		pop	ds
		ret
sub_1B2		endp

; ----------------------------------------------------------------------

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_RestoreIntVectors
; (sub_237 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; CRT_RestoreIntVectors (sub_1F7 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1
; opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; CRT_RestoreIntVectors (sub_1F3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — restaure les vecteurs d'interruption sauvegardés par
; sub_1B0 (INT21 AH=25h), cleanup à l'exit.
; ==============================================================================================
CRT_RestoreIntVectors		proc far
		push	ds
		mov	ax, 2500h
		lds	dx, word_59E21
		int	21h
		pop	ds
		push	ds
		mov	ax, 2504h
		lds	dx, word_59E25
		int	21h
		pop	ds
		push	ds
		mov	ax, 2505h
		lds	dx, word_59E29
		int	21h
		pop	ds
		push	ds
		mov	ax, 2506h
		lds	dx, word_59E2D
		int	21h
		pop	ds
		retf
CRT_RestoreIntVectors		endp

; ----------------------------------------------------------------------

sub_222		proc near
		mov	ax, 100h
		mov	dx, di
		mov	bx, si

loc_229:
		cmp	bx, di
		jz	short loc_246
		cmp	byte ptr es:[bx], 0FFh
		jz	short loc_241
		mov	cl, es:[bx+1]
		xor	ch, ch
		cmp	cx, ax
		jnb	short loc_241
		mov	ax, cx
		mov	dx, bx

loc_241:
		add	bx, 6
		jmp	short loc_229

loc_246:
		cmp	dx, di
		jz	short loc_265
		mov	bx, dx
		cmp	byte ptr es:[bx], 0
		mov	byte ptr es:[bx], 0FFh
		push	es
		jz	short loc_25E
		call	dword ptr es:[bx+2]
		pop	es
		jmp	short sub_222

loc_25E:
		call	word ptr es:[bx+2]
		pop	es
		jmp	short sub_222

loc_265:
		ret
sub_222		endp

; ----------------------------------------------------------------------

sub_266		proc near
		mov	ah, 0
		mov	dx, di
		mov	bx, si

loc_26C:
		cmp	bx, di
		jz	short loc_287
		cmp	byte ptr es:[bx], 0FFh
		jz	short loc_282
		cmp	es:[bx+1], ah
		jb	short loc_282
		mov	ah, es:[bx+1]
		mov	dx, bx

loc_282:
		add	bx, 6
		jmp	short loc_26C

loc_287:
		cmp	dx, di
		jz	short loc_2A6
		mov	bx, dx
		cmp	byte ptr es:[bx], 0
		mov	byte ptr es:[bx], 0FFh
		push	es
		jz	short loc_29F
		call	dword ptr es:[bx+2]
		pop	es
		jmp	short sub_266

loc_29F:
		call	word ptr es:[bx+2]
		pop	es
		jmp	short sub_266

loc_2A6:
		ret
sub_266		endp

; ----------------------------------------------------------------------

sub_2A7		proc near
		mov	ah, 40h
		mov	bx, 2
		int	21h
		ret
sub_2A7		endp

; ----------------------------------------------------------------------

sub_2AF		proc near
		mov	cx, 1Eh
		nop
		mov	dx, 56h

loc_2B6:
		mov	ds, cs:2C7h
		call	sub_2A7
		mov	ax, 3
		push	ax
		nop
		push	cs
		call	near ptr CRT_Abort
		add	[bx+si], al
		add	al, [bx+si+7552h]
		outsb
		jz	short loc_339
		insw
		and	gs:[bx+76h], ch
		jb	loc_344
		popaw
		jns	short loc_2FB
		jb	loc_350
		outsw
		jb	short loc_2EE
		or	bh, [bx+di+17h]
sub_2AF		endp

; ----------------------------------------------------------------------

sub_2E2		proc far
		mov	cx, 17h
		mov	dx, 2CBh
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

loc_2FB:
		push	cs
		call	near ptr CRT_Abort
		retf
sub_2E2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Abs16_377 (sub_377
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Abs16_2CD (sub_2CD
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. Valeur absolue d'un entier 16 bits (or ax, ax / jge / neg ax).
; ==============================================================================================
CRT_Abs16_300		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		or	ax, ax
		jge	short loc_30C
		neg	ax

loc_30C:
		pop	bp
		retf
CRT_Abs16_300		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	word_5EA18, 20h
		jnz	short loc_31D
		mov	ax, 1
		jmp	short loc_339

loc_31D:
		mov	bx, word_5EA18
		mov	cl, 2
		shl	bx, cl
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		mov	[bx+69CAh], ax
		mov	[bx+69C8h], dx
		inc	word_5EA18
		xor	ax, ax

loc_339:
		pop	bp
		retf
sub_30E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		call	sub_45058
		pop	cx
		pop	bp
		retf
sub_33B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_349		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, ds
		cmp	[bp+arg_2], ax
		jnz	short loc_35E
		push	[bp+arg_0]
		call	sub_45058
		pop	cx
		jmp	short loc_36B

loc_35E:
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_4591F
		pop	cx
		pop	cx

loc_36B:
		pop	bp
		retf
sub_349		endp

; ----------------------------------------------------------------------

sub_36D		proc far
		retf
sub_36D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36E		proc near

var_7C2		= word ptr -7C2h
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		or	si, si
		jnz	short loc_39B
		jmp	short loc_38B

loc_37B:
		dec	word_5EA18
		mov	bx, word_5EA18
		mov	cl, 2
		shl	bx, cl
		call	dword ptr [bx+69C8h]

loc_38B:
		cmp	word_5EA18, 0
		jnz	short loc_37B
		nop
		push	cs
		call	near ptr Ovl_CopyStubTable
		call	dword ptr dword_5EB1C

loc_39B:
		nop
		push	cs
		call	near ptr CRT_RestoreIntVectors
		nop
		push	cs
		call	near ptr sub_174
		cmp	[bp+arg_2], 0
		jnz	short loc_3C0
		or	si, si
		jnz	short loc_3B7
		call	dword ptr dword_5EB20
		call	dword ptr dword_5EB24

loc_3B7:
		push	[bp+arg_0]
		nop
		push	cs
		call	sub_19F
		pop	cx

loc_3C0:
		pop	si
		pop	bp
		ret	6
sub_36E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Exit (sub_49C de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
		call	sub_36E
		pop	bp
		retf
CRT_Exit		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Abort (sub_4AB de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
		call	sub_36E
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
		call	sub_36E
		retf
		mov	ax, 1
		push	ax
		push	ax
		xor	ax, ax
		push	ax
		call	sub_36E
		retf
; END OF FUNCTION CHUNK FOR CRT_Abort

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Fmemcpy (sub_4E9
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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

sub_41C		proc far

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
sub_41C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42F		proc far

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
sub_42F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_442		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		mov	al, 0
		push	ax
		push	cs
		call	near ptr sub_453
		pop	cx
		pop	cx
		pop	bp
		retf
sub_442		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_453		proc far

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_2]
		push	ds
		mov	ah, 1Ch
		mov	dl, [bp+arg_0]
		int	21h
		mov	ah, [bx]
		pop	ds
		mov	[si], ax
		mov	[si+2], dx
		mov	[si+4], cx
		pop	si
		pop	bp
		retf
sub_453		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_470		proc far

var_2		= word ptr -2
arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_2]
		mov	ah, 36h
		mov	dl, [bp+arg_0]
		int	21h
		mov	[bp+var_2], bx
		mov	[si+6], ax
		mov	ax, [bp+var_2]
		mov	[si], ax
		mov	[si+2], dx
		mov	[si+4], cx
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_470		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_GetVect (sub_52B
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_SetVect (sub_53A
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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

sub_4B7		proc near
		pop	cx
		push	cs
		push	cx
		xor	cx, cx
		jmp	short loc_4D4
sub_4B7		endp

; START OF FUNCTION CHUNK FOR sub_4B7
		pop	cx
		push	cs
		push	cx
		mov	cx, 1
		jmp	short loc_4D4
; END OF FUNCTION CHUNK FOR sub_4B7

; ----------------------------------------------------------------------

sub_4C6		proc far
		pop	cx
		push	cs
		push	cx
		mov	cx, 2
		jmp	short loc_4D4
		pop	cx
		push	cs
		push	cx
		mov	cx, 3

loc_4D4:
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
		jnz	short loc_4F3
		or	dx, dx
		jz	short loc_558
		or	bx, bx
		jz	short loc_558

loc_4F3:
		test	di, 1
		jnz	short loc_515
		or	dx, dx
		jns	short loc_507
		neg	dx
		neg	ax
		sbb	dx, 0
		or	di, 0Ch

loc_507:
		or	cx, cx
		jns	short loc_515
		neg	cx
		neg	bx
		sbb	cx, 0
		xor	di, 4

loc_515:
		mov	bp, cx
		mov	cx, 20h
		push	di
		xor	di, di
		xor	si, si

loc_51F:
		shl	ax, 1
		rcl	dx, 1
		rcl	si, 1
		rcl	di, 1
		cmp	di, bp
		jb	short loc_536
		ja	short loc_531
		cmp	si, bx
		jb	short loc_536

loc_531:
		sub	si, bx
		sbb	di, bp
		inc	ax

loc_536:
		loop	short loc_51F
		pop	bx
		test	bx, 2
		jz	short loc_545
		mov	ax, si
		mov	dx, di
		shr	bx, 1

loc_545:
		test	bx, 4
		jz	short loc_552
		neg	dx
		neg	ax
		sbb	dx, 0

loc_552:
		pop	di
		pop	si
		pop	bp
		retf	8

loc_558:
		div	bx
		test	di, 2
		jz	short loc_561
		xchg	dx, ax

loc_561:
		xor	dx, dx
		jmp	short loc_552
sub_4C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_565		proc near

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jl	short loc_585
		cmp	si, 58h
		jle	short loc_578

loc_575:
		mov	si, 57h

loc_578:
		mov	word_5EC94, si
		mov	al, [si+4F76h]
		cbw
		mov	si, ax
		jmp	short loc_592

loc_585:
		neg	si
		cmp	si, 30h
		jg	short loc_575
		mov	word_5EC94, 0FFFFh

loc_592:
		mov	word_59E41, si
		mov	ax, 0FFFFh
		pop	si
		pop	bp
		ret	2
sub_565		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59E		proc far

saved_4		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+saved_4]
		push	si
		call	sub_565
		mov	ax, si
		pop	si
		pop	bp
		ret	2
sub_59E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_IsAtty (sub_644 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_NormalizeSign32
; (sub_655 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; CRT_NormalizeSign32 (sub_539 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à CRT_NormalizeSign32 (sub_543 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — normalise le signe d'une paire dx:ax selon
; le signe d'un second opérande : brique de division/modulo signé 32-bit.
; ==============================================================================================
CRT_NormalizeSign32		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	[bp+arg_2], 0
		jg	short loc_5E1
		jl	short loc_5D2
		cmp	[bp+arg_0], 0
		jnb	short loc_5E1

loc_5D2:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		neg	dx
		neg	ax
		sbb	dx, 0
		jmp	short loc_5E7

loc_5E1:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]

loc_5E7:
		pop	bp
		retf
CRT_NormalizeSign32		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5E9		proc near

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
		ja	short loc_657
		cmp	bl, 2
		jb	short loc_657
		mov	ax, [bp+arg_8]
		mov	cx, [bp+arg_A]
		or	cx, cx
		jge	short loc_61F
		cmp	[bp+arg_2], 0
		jz	short loc_61F
		mov	byte ptr [di], 2Dh
		inc	di
		neg	cx
		neg	ax
		sbb	cx, 0

loc_61F:
		lea	si, [bp+var_22]
		jcxz	short loc_633

loc_624:
		xchg	cx, ax
		sub	dx, dx
		div	bx
		xchg	cx, ax
		div	bx
		mov	[si], dl
		inc	si
		jcxz	short loc_63A
		jmp	short loc_624

loc_633:
		sub	dx, dx
		div	bx
		mov	[si], dl
		inc	si

loc_63A:
		or	ax, ax
		jnz	short loc_633
		lea	cx, [bp+var_22]
		neg	cx
		add	cx, si
		cld

loc_646:
		dec	si
		mov	al, [si]
		sub	al, 0Ah
		jnb	short loc_651
		add	al, 3Ah
		jmp	short loc_654

loc_651:
		add	al, [bp+arg_0]

loc_654:
		stosb
		loop	short loc_646

loc_657:
		mov	al, 0
		stosb
		pop	es
		mov	ax, [bp+arg_6]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret	0Ch
sub_5E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_666		proc far

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
		call	sub_5E9
		pop	bp
		ret	4
sub_666		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Lseek (sub_717 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à CRT_Lseek (sub_5FB de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à CRT_Lseek (sub_605 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; wrapper lseek() (INT21 AH=42h) avec gestion d'erreur via sub_4E7.
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
		and	word ptr [bx+4F4Ah], 0FDFFh
		mov	ah, 42h
		mov	al, [bp+arg_6]
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_2]
		int	21h
		jb	short loc_6A5
		jmp	short loc_6AA

loc_6A5:
		push	ax
		call	sub_565
		cwd

loc_6AA:
		pop	bp
		retf
CRT_Lseek		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6AC		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, word_6076A
		mov	dx, word_60768
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		mov	word_6076A, ax
		mov	word_60768, dx
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		mov	sp, bp
		pop	bp
		retf
sub_6AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Malloc16_Retry
; (sub_76A de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s)
; (adresses de données ou constantes) — à vérifier à CRT_Malloc16_Retry (sub_64E de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à CRT_Malloc16_Retry (sub_658 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; allocation avec retry sur errno global (dword_72F54), appelle sub_5D22B : variante malloc
; courte 16-bit.
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
		jz	short loc_6E8
		mov	ax, si
		jmp	short loc_6EB

loc_6E8:
		mov	ax, 1

loc_6EB:
		mov	si, ax
		jmp	short loc_6F3

loc_6EF:
		call	dword ptr word_60768

loc_6F3:
		push	si
		call	sub_44F3F
		pop	cx
		mov	[bp+var_2], ax
		or	ax, ax
		jnz	short loc_70A
		mov	ax, word_60768
		or	ax, word_6076A
		jnz	short loc_6EF

loc_70A:
		mov	ax, [bp+var_2]
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Malloc16_Retry		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Malloc32_Retry
; (sub_7A6 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s)
; (adresses de données ou constantes) — à vérifier à CRT_Malloc32_Retry (sub_68A de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à CRT_Malloc32_Retry (sub_694 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; variante 32-bit de sub_658 : normalise dx:ax à 1 si zéro, retry sur dword_72F54 via
; sub_5D90E.
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
		jz	short loc_728
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		jmp	short loc_72D

loc_728:
		xor	dx, dx
		mov	ax, 1

loc_72D:
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		jmp	short loc_739

loc_735:
		call	dword ptr word_60768

loc_739:
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_458F5
		pop	cx
		pop	cx
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jnz	short loc_759
		mov	ax, word_60768
		or	ax, word_6076A
		jnz	short loc_735

loc_759:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		mov	sp, bp
		pop	bp
		retf
CRT_Malloc32_Retry		endp

; ----------------------------------------------------------------------

sub_763		proc near
		push	si
		xchg	si, ax
		xchg	dx, ax
		test	ax, ax
		jz	short loc_76C
		mul	bx

loc_76C:
		jcxz	short loc_773
		xchg	cx, ax
		mul	si
		add	ax, cx

loc_773:
		xchg	si, ax
		mul	bx
		add	dx, si
		pop	si
		ret
sub_763		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Srand_80E (sub_80E
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Srand_6F2 (sub_6F2
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. srand() du runtime : graine de CRT_Rand (word_487DE = arg_0, word_487E0 =
; 0). Appelée par mid2 (sub_6B9C0) et mid17 (sub_98210) avec CRT_Time_85A(0) : tirages
; différents à chaque partie.
; ==============================================================================================
CRT_Srand_77A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	word_5ECF2, 0
		mov	word_5ECF0, ax
		pop	bp
		retf
CRT_Srand_77A		endp

; ----------------------------------------------------------------------

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Rand (sub_81F de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Rand (sub_703 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à CRT_Rand (sub_70D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; générateur pseudo-aléatoire congruentiel linéaire (constantes 4E35h/1, seed 32-bit
; word_71CF6/71CF8) : runtime rand().
; ==============================================================================================
CRT_Rand		proc far
		mov	cx, word_5ECF2
		mov	bx, word_5ECF0
		mov	dx, 15Ah
		mov	ax, 4E35h
		call	sub_763
		add	ax, 1
		adc	dx, 0
		mov	word_5ECF2, dx
		mov	word_5ECF0, ax
		mov	ax, word_5ECF2
		cwd
		and	ax, 7FFFh
		retf
CRT_Rand		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Unlink (sub_845 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
		jb	short loc_7C1
		xor	ax, ax
		jmp	short loc_7C5

loc_7C1:
		push	ax
		call	sub_565

loc_7C5:
		pop	bp
		retf
CRT_Unlink		endp

; ----------------------------------------------------------------------

sub_7C7		proc near
		push	bx
		sub	bl, 30h
		jb	short loc_7EF
		cmp	bl, 9
		jbe	short loc_7E4
		cmp	bl, 2Ah
		ja	short loc_7DC
		sub	bl, 7
		jmp	short loc_7DF

loc_7DC:
		sub	bl, 27h

loc_7DF:
		cmp	bl, 9
		jbe	short loc_7EF

loc_7E4:
		cmp	bl, cl
		jnb	short loc_7EF
		inc	sp
		inc	sp
		clc
		mov	bh, 0
		jmp	short loc_7F1

loc_7EF:
		pop	bx
		stc

loc_7F1:
		ret
sub_7C7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7F2		proc near

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

loc_808:
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		or	ax, ax
		jl	short loc_87E
		cbw
		xchg	bx, ax
		test	bl, 80h
		jnz	short loc_825
		mov	di, 4CFBh
		test	byte ptr [bx+di], 1
		jnz	short loc_808

loc_825:
		xchg	bx, ax
		dec	[bp+arg_8]
		jl	short loc_885
		cmp	al, 2Bh
		jz	short loc_836
		cmp	al, 2Dh
		jnz	short loc_849
		inc	[bp+var_1]

loc_836:
		dec	[bp+arg_8]
		jl	short loc_885
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		or	ax, ax
		jl	short loc_87E

loc_849:
		sub	si, si
		mov	di, si
		mov	cx, [bp+arg_6]
		jcxz	short loc_89F
		cmp	cx, 24h
		ja	short loc_885
		cmp	cl, 2
		jb	short loc_885
		cmp	al, 30h
		jnz	short loc_8CB
		cmp	cl, 10h
		jnz	short loc_8C9
		dec	[bp+arg_8]
		jl	short loc_89C
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		cmp	al, 78h
		jz	short loc_8C9
		cmp	al, 58h
		jz	short loc_8C9
		jmp	short loc_8F1

loc_87E:
		mov	[bp+var_6], 0FFFFh
		jmp	short loc_88A

loc_885:
		mov	[bp+var_6], 0

loc_88A:
		push	[bp+arg_4]
		push	ax
		call	word ptr [bp+arg_2]
		pop	cx
		pop	cx
		dec	[bp+var_4]
		sub	ax, ax
		cwd
		jmp	loc_943

loc_89C:
		jmp	loc_933

loc_89F:
		cmp	al, 30h
		mov	[bp+arg_6], 0Ah
		jnz	short loc_8CB
		dec	[bp+arg_8]
		jl	short loc_89C
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		mov	[bp+arg_6], 8
		cmp	al, 78h
		jz	short loc_8C4
		cmp	al, 58h
		jnz	short loc_8F1

loc_8C4:
		mov	[bp+arg_6], 10h

loc_8C9:
		jmp	short loc_8E2

loc_8CB:
		mov	cx, [bp+arg_6]
		xchg	bx, ax
		call	sub_7C7
		xchg	bx, ax
		jb	short loc_885
		xchg	si, ax
		jmp	short loc_8E2

loc_8D8:
		xchg	si, ax
		mul	[bp+arg_6]
		add	si, ax
		adc	di, dx
		jnz	short loc_90E

loc_8E2:
		dec	[bp+arg_8]
		jl	short loc_933
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx

loc_8F1:
		mov	cx, [bp+arg_6]
		xchg	bx, ax
		call	sub_7C7
		xchg	bx, ax
		jnb	short loc_8D8
		jmp	short loc_927

loc_8FD:
		xchg	si, ax
		mul	cx
		xchg	di, ax
		xchg	dx, cx
		mul	dx
		add	si, di
		adc	ax, cx
		xchg	di, ax
		adc	dl, dh
		jnz	short loc_955

loc_90E:
		dec	[bp+arg_8]
		jl	short loc_933
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		mov	cx, [bp+arg_6]
		xchg	bx, ax
		call	sub_7C7
		xchg	bx, ax
		jnb	short loc_8FD

loc_927:
		push	[bp+arg_4]
		push	ax
		call	word ptr [bp+arg_2]
		pop	cx
		pop	cx
		dec	[bp+var_4]

loc_933:
		mov	dx, di
		xchg	si, ax
		cmp	[bp+var_1], 0
		jz	short loc_943
		neg	dx
		neg	ax
		sbb	dx, 0

loc_943:
		mov	di, [bp+arg_A]
		mov	bx, [bp+var_4]
		add	[di], bx
		mov	di, [bp+arg_C]
		mov	bx, [bp+var_6]
		mov	[di], bx
		jmp	short loc_96B

loc_955:
		mov	ax, 0FFFFh
		mov	dx, 7FFFh
		add	al, [bp+var_1]
		adc	ah, 0
		adc	dx, 0
		mov	[bp+var_6], 2
		jmp	short loc_943

loc_96B:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret
sub_7F2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_971		proc far

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
sub_971		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_989		proc far

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
sub_989		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_99C		proc far

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
sub_99C		endp

; START OF FUNCTION CHUNK FOR sub_99C
		mov	dx, 5
		cmp	dx, word_5EC68
		jnb	short loc_9E3

loc_9B8:
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+4F4Ah], 0
		mov	bx, dx
		mov	cl, 4
		shl	bx, cl
		mov	byte ptr [bx+4E0Ch], 0FFh
		mov	ax, dx
		shl	ax, cl
		add	ax, 4E08h
		mov	bx, dx
		shl	bx, cl
		mov	[bx+4E16h], ax
		inc	dx
		cmp	dx, word_5EC68
		jb	short loc_9B8

loc_9E3:
		mov	al, byte_5EB2C
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_IsAtty
		pop	cx
		or	ax, ax
		jnz	short loc_9F8
		and	word_5EB2A, 0FDFFh

loc_9F8:
		mov	ax, 200h
		push	ax
		test	word_5EB2A, 200h
		jz	short loc_A09
		mov	ax, 1
		jmp	short loc_A0B

loc_A09:
		xor	ax, ax

loc_A0B:
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, 4E08h
		push	ax
		nop
		push	cs
		call	near ptr Stdio_SetupFileStruct
		add	sp, 8
		mov	al, byte_5EB3C
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_IsAtty
		pop	cx
		or	ax, ax
		jnz	short loc_A30
		and	word_5EB3A, 0FDFFh

loc_A30:
		mov	ax, 200h
		push	ax
		test	word_5EB3A, 200h
		jz	short loc_A41
		mov	ax, 2
		jmp	short loc_A43

loc_A41:
		xor	ax, ax

loc_A43:
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, 4E18h
		push	ax
		nop
		push	cs
		call	near ptr Stdio_SetupFileStruct
		add	sp, 8
		ret
; END OF FUNCTION CHUNK FOR sub_99C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A54		proc far

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
		call	near ptr sub_306E
		add	sp, 8
		lea	ax, [bp+var_4]
		push	ax
		nop
		push	cs
		call	near ptr sub_989
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		nop
		push	cs
		call	near ptr sub_99C
		pop	cx
		xor	ax, ax
		mov	sp, bp
		pop	bp
		retf
sub_A54		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Time_FBB (sub_FBB
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Time_85A (sub_85A
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. time() du runtime : date (sub_3E9) et heure (sub_3FC) du DOS converties par
; sub_2899 en secondes (dx:ax), rangées aussi en [arg_0] si arg_0 ≠ 0.
; ==============================================================================================
CRT_Time_A8C		proc far

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
		call	near ptr sub_41C
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		nop
		push	cs
		call	near ptr sub_42F
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		nop
		push	cs
		call	near ptr sub_2F55
		pop	cx
		pop	cx
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		or	si, si
		jz	short loc_ACE
		mov	ax, [bp+var_A]
		mov	dx, [bp+var_C]
		mov	[si+2], ax
		mov	[si], dx

loc_ACE:
		mov	dx, [bp+var_A]
		mov	ax, [bp+var_C]
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Time_A8C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_CtypeLookup (sub_1008 de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE :
; même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à CRT_CtypeLookup (sub_8A7 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; CRT_CtypeLookup (sub_E4B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte
; à revérifier ici. — far — table lookup type de caractère (table 4971h), cas spécial 0xFFFF :
; ctype-like classification/toupper-tolower.
; ==============================================================================================
CRT_CtypeLookup		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	dx, 0FFFFh
		jnz	short loc_AE9
		mov	ax, 0FFFFh
		jmp	short loc_B03

loc_AE9:
		mov	al, dl
		mov	ah, 0
		mov	bx, ax
		test	byte ptr [bx+4CFBh], 8
		jz	short loc_AFF
		mov	al, dl
		mov	ah, 0
		add	ax, 0FFE0h
		jmp	short loc_B03

loc_AFF:
		mov	al, dl
		mov	ah, 0

loc_B03:
		pop	bp
		retf
CRT_CtypeLookup		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B05		proc far

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
		jnz	short loc_B1D
		jmp	loc_D36

loc_B1D:
		lea	ax, [bp+arg_C]
		mov	[bp+var_2], ax
		test	[bp+arg_A], 1
		jz	short loc_B47
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		mov	ax, word ptr [bp+var_6]
		or	ax, word ptr [bp+var_6+2]
		jnz	short loc_B5A
		jmp	short loc_B55

loc_B47:
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	di, [bx-2]
		or	di, di
		jnz	short loc_B5A

loc_B55:
		mov	[bp+var_8], 0

loc_B5A:
		test	[bp+arg_A], 10h
		jz	short loc_B72
		les	bx, [bp+arg_0]
		mov	ax, es:[bx-2]
		mov	dx, es:[bx-4]
		mov	[bp+arg_8], ax
		mov	[bp+arg_6], dx

loc_B72:
		cmp	[bp+var_8], 0
		jnz	short loc_B7B
		jmp	loc_CE2

loc_B7B:
		mov	ax, [bp+arg_A]
		and	ax, 1A7h
		mov	[bp+var_C], ax
		test	[bp+var_C], 80h
		jz	short loc_B90
		and	[bp+var_C], 0FEFFh

loc_B90:
		mov	bx, [bp+arg_4]
		xor	cx, cx
		mov	dx, [bp+arg_8]
		mov	ax, [bp+arg_6]
		sub	ax, 1
		sbb	dx, 0
		call	sub_763
		add	ax, [bp+arg_0]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+arg_2]
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		jmp	loc_CC4

loc_BBB:
		mov	ax, [bp+var_C]
		mov	[bp+var_A], ax
		mov	cx, 10h
		mov	bx, offset word_D3C

loc_BC7:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_A]
		jz	short loc_BD7
		add	bx, 2
		loop	short loc_BC7
		jmp	loc_CAC

loc_BD7:
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_BDB:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		push	[bp+var_10]
		call	di

loc_BE7:
		add	sp, 6
		jmp	loc_CB1

loc_BED:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		push	[bp+var_10]
		call	dword ptr [bp+var_6]
		jmp	short loc_BE7

loc_BFC:
		push	[bp+var_E]
		push	[bp+var_10]
		mov	ax, 2
		push	ax

loc_C06:
		call	di
		jmp	short loc_C2F

loc_C0A:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		push	[bp+var_10]
		jmp	short loc_C06

loc_C16:
		push	[bp+var_E]
		push	[bp+var_10]
		mov	ax, 2
		push	ax
		jmp	short loc_C2C

loc_C22:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		push	[bp+var_10]

loc_C2C:
		call	dword ptr [bp+var_6]

loc_C2F:
		jmp	loc_CB1

loc_C32:
		push	[bp+var_E]
		push	[bp+var_10]
		mov	ax, 2
		call	di
		jmp	short loc_C4D

loc_C3F:
		jmp	short loc_C32

loc_C41:
		push	[bp+var_E]
		push	[bp+var_10]
		mov	ax, 2
		call	dword ptr [bp+var_6]

loc_C4D:
		jmp	short loc_CB1

loc_C4F:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		push	ax
		call	di
		pop	cx
		pop	si
		pop	ds
		jmp	short loc_CB1

loc_C5F:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		pop	cx
		pop	si
		pop	ds
		jmp	short loc_CB1

loc_C70:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		push	ax
		call	di
		pop	si
		pop	ds
		jmp	short loc_CB1

loc_C7F:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		pop	si
		pop	ds
		jmp	short loc_CB1

loc_C8F:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		call	di
		pop	si
		pop	ds
		jmp	short loc_CB1

loc_C9D:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		call	dword ptr [bp+var_6]
		pop	si
		pop	ds
		jmp	short loc_CB1

loc_CAC:
		nop
		push	cs
		call	sub_2AF

loc_CB1:
		mov	ax, [bp+arg_4]
		xor	dx, dx
		sub	[bp+var_10], ax
		sbb	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	[bp+var_E], dx

loc_CC4:
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_8]
		sub	[bp+arg_6], 1
		sbb	[bp+arg_8], 0
		or	dx, dx
		jbe	short loc_CD9
		jmp	loc_BBB

loc_CD9:
		jnz	short loc_CE2
		or	ax, ax
		jbe	short loc_CE2
		jmp	loc_BBB

loc_CE2:
		test	[bp+arg_A], 8
		jz	short loc_D36
		mov	[bp+var_E], 0
		test	[bp+arg_A], 10h
		jz	short loc_CFA
		mov	[bp+var_E], 4

loc_CFA:
		test	[bp+arg_A], 40h
		jz	short loc_D1A
		add	[bp+var_E], 2
		les	bx, [bp+arg_0]
		sub	bx, [bp+var_E]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_C], ax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+var_C]
		jmp	short loc_D23

loc_D1A:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		sub	dx, [bp+var_E]

loc_D23:
		mov	[bp+arg_2], ax
		mov	[bp+arg_0], dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_349
		pop	cx
		pop	cx

loc_D36:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_B05		endp

; START OF FUNCTION CHUNK FOR sub_B05
word_D3C	dw 4
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
off_D5C	dw offset loc_BDB
		dw offset loc_BED
		dw offset loc_BFC
		dw offset loc_C16
		dw offset loc_C32
		dw offset loc_C41
		dw offset loc_C4F
		dw offset loc_C5F
		dw offset loc_C70
		dw offset loc_C7F
		dw offset loc_C8F
		dw offset loc_C9D
		dw offset loc_C0A
		dw offset loc_C22
		dw offset loc_C3F
		dw offset loc_C41
; END OF FUNCTION CHUNK FOR sub_B05

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Doprnt_Core (sub_12AB de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE :
; même suite d'instructions, 9 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à CRT_Doprnt_Core (sub_8D3 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à CRT_Doprnt_Core (sub_E77 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — 299 lignes, moteur vprintf/_doprnt (gestion
; varargs 2/4 octets selon flag), cœur du formatteur d'impression bas niveau.
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
		jnz	short loc_D92
		jmp	loc_F28

loc_D92:
		lea	ax, [bp+arg_8]
		mov	[bp+var_2], ax
		test	[bp+arg_6], 1
		jz	short loc_DBC
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		mov	ax, word ptr [bp+var_6]
		or	ax, word ptr [bp+var_6+2]
		jnz	short loc_DCF
		jmp	short loc_DCA

loc_DBC:
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	di, [bx-2]
		or	di, di
		jnz	short loc_DCF

loc_DCA:
		mov	[bp+var_8], 0

loc_DCF:
		test	[bp+arg_6], 10h
		jz	short loc_DDF
		mov	bx, [bp+arg_0]
		mov	ax, [bx-2]
		mov	[bp+arg_4], ax

loc_DDF:
		cmp	[bp+var_8], 0
		jnz	short loc_DE8
		jmp	loc_F08

loc_DE8:
		mov	ax, [bp+arg_6]
		and	ax, 1A7h
		mov	[bp+var_C], ax
		test	[bp+var_C], 80h
		jz	short loc_DFD
		and	[bp+var_C], 0FEFFh

loc_DFD:
		mov	ax, [bp+arg_4]
		dec	ax
		imul	[bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, ax
		mov	[bp+var_E], dx
		jmp	loc_EFB

loc_E0F:
		mov	ax, [bp+var_C]
		mov	[bp+var_A], ax
		mov	cx, 10h
		mov	bx, offset word_F2E

loc_E1B:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_A]
		jz	short loc_E2B
		add	bx, 2
		loop	short loc_E1B
		jmp	loc_EF0

loc_E2B:
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_E2F:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		call	di

loc_E38:
		pop	cx
		pop	cx
		jmp	loc_EF5

loc_E3D:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		call	dword ptr [bp+var_6]
		jmp	short loc_E38

loc_E49:
		push	[bp+var_E]
		mov	ax, 2
		push	ax
		call	di
		jmp	loc_EF5

loc_E55:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		call	di
		jmp	loc_EF5

loc_E61:
		push	[bp+var_E]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		jmp	loc_EF5

loc_E6E:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		call	dword ptr [bp+var_6]
		jmp	short loc_EF5

loc_E7A:
		mov	ax, 2
		mov	bx, [bp+var_E]
		jmp	short loc_E88

loc_E82:
		mov	bx, [bp+var_E]
		mov	ax, 2

loc_E88:
		call	di
		jmp	short loc_EF5

loc_E8C:
		mov	ax, 2
		mov	bx, [bp+var_E]
		jmp	short loc_E9A

loc_E94:
		mov	bx, [bp+var_E]
		mov	ax, 2

loc_E9A:
		call	dword ptr [bp+var_6]
		jmp	short loc_EF5

loc_E9F:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	di
		pop	cx
		pop	si
		jmp	short loc_EF5

loc_EAD:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		pop	cx
		pop	si
		jmp	short loc_EF5

loc_EBC:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	di
		pop	si
		jmp	short loc_EF5

loc_EC9:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		pop	si
		jmp	short loc_EF5

loc_ED7:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		call	di
		pop	si
		jmp	short loc_EF5

loc_EE3:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		call	dword ptr [bp+var_6]
		pop	si
		jmp	short loc_EF5

loc_EF0:
		nop
		push	cs
		call	sub_2AF

loc_EF5:
		mov	ax, [bp+arg_2]
		sub	[bp+var_E], ax

loc_EFB:
		mov	ax, [bp+arg_4]
		dec	[bp+arg_4]
		or	ax, ax
		jbe	short loc_F08
		jmp	loc_E0F

loc_F08:
		test	[bp+arg_6], 8
		jz	short loc_F28
		test	[bp+arg_6], 10h
		jz	short loc_F1F
		mov	ax, [bp+arg_0]
		add	ax, 0FFFEh
		mov	[bp+arg_0], ax

loc_F1F:
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_33B
		pop	cx

loc_F28:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Doprnt_Core		endp

; START OF FUNCTION CHUNK FOR CRT_Doprnt_Core
word_F2E	dw 0
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
off_F4E	dw offset loc_E2F
		dw offset loc_E3D
		dw offset loc_E49
		dw offset loc_E61
		dw offset loc_E7A
		dw offset loc_E8C
		dw offset loc_E9F
		dw offset loc_EAD
		dw offset loc_EBC
		dw offset loc_EC9
		dw offset loc_ED7
		dw offset loc_EE3
		dw offset loc_E55
		dw offset loc_E6E
		dw offset loc_E82
		dw offset loc_E94
; END OF FUNCTION CHUNK FOR CRT_Doprnt_Core

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Doprnt_Dispatch (sub_172F de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE :
; même suite d'instructions, 14 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à CRT_Doprnt_Dispatch (sub_D57 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à CRT_Doprnt_Dispatch (sub_1069 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far — 257 lignes, gros switch (cases 0x81-0xA1)
; dispatchant sur spécificateurs de format via callbacks [bp+var_4]/[bp+var_8] : moteur
; _doprnt (dispatch %d/%s/%x/%ld etc, variantes near/far).
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
		jz	short loc_FA8
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	ax, word ptr [bp+var_8]
		or	ax, word ptr [bp+var_8+2]
		jnz	short loc_FC0
		jmp	short loc_FBB

loc_FA8:
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_FC0

loc_FBB:
		mov	[bp+var_A], 0

loc_FC0:
		or	di, di
		jnz	short loc_1014
		mov	ax, [bp+arg_2]
		imul	[bp+arg_4]
		mov	[bp+var_E], 0
		mov	[bp+var_10], ax
		test	[bp+arg_6], 10h
		jz	short loc_FE1
		add	[bp+var_10], 2
		adc	[bp+var_E], 0

loc_FE1:
		cmp	[bp+var_E], 0
		jb	short loc_FF4
		ja	short loc_FEF
		cmp	[bp+var_10], 0FFFFh
		jbe	short loc_FF4

loc_FEF:
		xor	ax, ax
		jmp	loc_10DA

loc_FF4:
		push	[bp+var_10]
		nop
		push	cs
		call	near ptr CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	di, di
		jnz	short loc_1005
		jmp	short loc_FEF

loc_1005:
		test	[bp+arg_6], 10h
		jz	short loc_1014
		mov	ax, [bp+arg_4]
		mov	[di], ax
		add	di, 2

loc_1014:
		and	[bp+arg_6], 1A7h
		test	[bp+arg_6], 80h
		jz	short loc_1025
		and	[bp+arg_6], 0FEFFh

loc_1025:
		cmp	[bp+var_A], 0
		jnz	short loc_102E
		jmp	loc_10D8

loc_102E:
		mov	[bp+var_E], di
		jmp	loc_10CB

loc_1034:
		mov	ax, [bp+arg_6]
		mov	[bp+var_C], ax
		mov	cx, 10h
		mov	bx, offset word_10E0

loc_1040:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_C]
		jz	short loc_104F
		add	bx, 2
		loop	short loc_1040
		jmp	short loc_10C0

loc_104F:
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_1053:
		push	[bp+var_E]
		call	word ptr [bp+var_4]

loc_1059:
		pop	cx
		jmp	short loc_10C5

loc_105C:
		push	[bp+var_E]
		call	dword ptr [bp+var_8]
		jmp	short loc_1059

loc_1064:
		push	[bp+var_E]
		call	word ptr [bp+var_4]
		jmp	short loc_1072

loc_106C:
		push	[bp+var_E]
		call	dword ptr [bp+var_8]

loc_1072:
		jmp	short loc_10C5

loc_1074:
		mov	bx, [bp+var_E]
		call	word ptr [bp+var_4]
		jmp	short loc_10C5

loc_107C:
		mov	bx, [bp+var_E]
		call	dword ptr [bp+var_8]
		jmp	short loc_10C5

loc_1084:
		push	si
		mov	si, [bp+var_E]
		call	word ptr [bp+var_4]
		pop	si
		jmp	short loc_10C5

loc_108E:
		push	si
		mov	si, [bp+var_E]
		call	dword ptr [bp+var_8]
		pop	si
		jmp	short loc_10C5

loc_1098:
		push	si
		mov	si, [bp+var_E]
		call	word ptr [bp+var_4]
		pop	si
		jmp	short loc_10C5

loc_10A2:
		push	si
		mov	si, [bp+var_E]
		call	dword ptr [bp+var_8]
		pop	si
		jmp	short loc_10C5

loc_10AC:
		push	si
		mov	si, [bp+var_E]
		call	word ptr [bp+var_4]
		pop	si
		jmp	short loc_10C5

loc_10B6:
		push	si
		mov	si, [bp+var_E]
		call	dword ptr [bp+var_8]
		pop	si
		jmp	short loc_10C5

loc_10C0:
		nop
		push	cs
		call	sub_2AF

loc_10C5:
		mov	ax, [bp+arg_2]
		add	[bp+var_E], ax

loc_10CB:
		mov	ax, [bp+arg_4]
		dec	[bp+arg_4]
		or	ax, ax
		jbe	short loc_10D8
		jmp	loc_1034

loc_10D8:
		mov	ax, di

loc_10DA:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Doprnt_Dispatch		endp

; START OF FUNCTION CHUNK FOR CRT_Doprnt_Dispatch
word_10E0	dw 0
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
off_1100	dw offset loc_1053
		dw offset loc_105C
		dw offset loc_1064
		dw offset loc_106C
		dw offset loc_1074
		dw offset loc_107C
		dw offset loc_1084
		dw offset loc_108E
		dw offset loc_1098
		dw offset loc_10A2
		dw offset loc_10AC
		dw offset loc_10B6
		dw offset loc_1064
		dw offset loc_106C
		dw offset loc_1074
		dw offset loc_107C
; END OF FUNCTION CHUNK FOR CRT_Doprnt_Dispatch

; ----------------------------------------------------------------------

sub_1120		proc near
		mov	al, dh
		call	sub_1127
		mov	al, dl
sub_1120		endp

; ----------------------------------------------------------------------

sub_1127		proc near
		aam	10h
		xchg	al, ah
		call	sub_1130
		xchg	al, ah
sub_1127		endp

; ----------------------------------------------------------------------

sub_1130		proc near
		add	al, 90h
		daa
		adc	al, 40h
		daa
		stosb
		ret
sub_1130		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1138		proc near

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
		jmp	short loc_1198
sub_1138		endp

; ----------------------------------------------------------------------

sub_1152		proc near
		push	di
		mov	cx, 0FFFFh
		xor	al, al
		repne scasb
		not	cx
		dec	cx
		pop	di
		ret
sub_1152		endp

; ----------------------------------------------------------------------

sub_115F		proc near
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp-14h]
		jnz	short loc_1197
sub_115F		endp

; ----------------------------------------------------------------------

sub_1168		proc near
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
		jnz	short loc_1187
		mov	word ptr [bp-16h], 1

loc_1187:
		mov	word ptr [bp-14h], 50h
		add	[bp-12h], di
		lea	di, [bp-96h]
		pop	es
		pop	dx
		pop	cx
		pop	bx

loc_1197:
		ret

loc_1198:
		push	es
		cld
		lea	di, [bp-96h]
		mov	[bp-4], di

loc_11A1:
		mov	di, [bp-4]

loc_11A4:
		mov	si, [bp+6]

loc_11A7:
		lodsb
		or	al, al
		jz	short loc_11BE
		cmp	al, 25h
		jz	short loc_11C1

loc_11B0:
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp-14h]
		jg	short loc_11A7
		call	sub_1168
		jmp	short loc_11A7

loc_11BE:
		jmp	loc_159B

loc_11C1:
		mov	[bp-10h], si
		lodsb
		cmp	al, 25h
		jz	short loc_11B0
		mov	[bp-4], di
		xor	cx, cx
		mov	[bp-0Eh], cx
		mov	[bp-2], cx
		mov	[bp-0Bh], cl
		mov	word ptr [bp-8], 0FFFFh
		mov	word ptr [bp-0Ah], 0FFFFh
		jmp	short loc_11E4

loc_11E3:
		lodsb

loc_11E4:
		xor	ah, ah
		mov	dx, ax
		mov	bx, ax
		sub	bl, 20h
		cmp	bl, 60h
		jnb	short loc_1205
		mov	bl, [bx+4FDBh]
		cmp	bx, 17h
		jbe	short loc_11FE
		jmp	loc_158B

loc_11FE:
		shl	bx, 1
		jmp	cs:off_15BB[bx]	; switch jump

loc_1205:
		jmp	loc_158B

loc_1208:
		cmp	ch, 0
		ja	short loc_1205
		or	word ptr [bp-2], 1
		jmp	short loc_11E3

loc_1213:
		cmp	ch, 0
		ja	short loc_1205
		or	word ptr [bp-2], 2
		jmp	short loc_11E3

loc_121E:
		cmp	ch, 0
		ja	short loc_1205
		cmp	byte ptr [bp-0Bh], 2Bh
		jz	short loc_122C
		mov	[bp-0Bh], dl

loc_122C:
		jmp	short loc_11E3

loc_122E:
		and	word ptr [bp-2], 0FFDFh
		jmp	short loc_1238

loc_1234:
		or	word ptr [bp-2], 20h

loc_1238:
		mov	ch, 5
		jmp	short loc_11E3

loc_123C:
		cmp	ch, 0
		ja	short loc_128E
		test	word ptr [bp-2], 2
		jnz	short loc_1271
		or	word ptr [bp-2], 8
		mov	ch, 1
		jmp	short loc_11E3

loc_1250:
		jmp	loc_158B

loc_1253:
		mov	di, [bp+4]
		mov	ax, ss:[di]
		add	word ptr [bp+4], 2
		cmp	ch, 2
		jnb	short loc_1274
		or	ax, ax
		jns	short loc_126C
		neg	ax
		or	word ptr [bp-2], 2

loc_126C:
		mov	[bp-8], ax
		mov	ch, 3

loc_1271:
		jmp	loc_11E3

loc_1274:
		cmp	ch, 4
		jnz	short loc_1250
		mov	[bp-0Ah], ax
		inc	ch
		jmp	loc_11E3

loc_1281:
		cmp	ch, 4
		jnb	short loc_1250
		mov	ch, 4
		inc	word ptr [bp-0Ah]
		jmp	loc_11E3

loc_128E:
		xchg	dx, ax
		sub	al, 30h
		cbw
		cmp	ch, 2
		ja	short loc_12B0
		mov	ch, 2
		xchg	[bp-8], ax
		or	ax, ax
		jl	short loc_1271
		shl	ax, 1
		mov	dx, ax
		shl	ax, 1
		shl	ax, 1
		add	ax, dx
		add	[bp-8], ax
		jmp	loc_11E3

loc_12B0:
		cmp	ch, 4
		jnz	short loc_1250
		xchg	[bp-0Ah], ax
		or	ax, ax
		jz	short loc_1271
		shl	ax, 1
		mov	dx, ax
		shl	ax, 1
		shl	ax, 1
		add	ax, dx
		add	[bp-0Ah], ax
		jmp	loc_11E3

loc_12CC:
		or	word ptr [bp-2], 10h
		jmp	loc_1238

loc_12D3:
		or	word ptr [bp-2], 100h

loc_12D8:
		and	word ptr [bp-2], 0FFEFh
		jmp	loc_1238

loc_12DF:
		mov	bh, 8
		jmp	short loc_12ED

loc_12E3:
		mov	bh, 0Ah
		jmp	short loc_12F1

loc_12E7:
		mov	bh, 10h
		mov	bl, 0E9h
		add	bl, dl

loc_12ED:
		mov	byte ptr [bp-0Bh], 0

loc_12F1:
		mov	[bp-5], dl
		xor	dx, dx
		mov	[bp-6], dl
		mov	di, [bp+4]
		mov	ax, ss:[di]
		jmp	short loc_1311

loc_1301:
		mov	bh, 0Ah
		mov	byte ptr [bp-6], 1
		mov	[bp-5], dl
		mov	di, [bp+4]
		mov	ax, ss:[di]
		cwd

loc_1311:
		inc	di
		inc	di
		mov	[bp+6], si
		test	word ptr [bp-2], 10h
		jz	short loc_1322
		mov	dx, ss:[di]
		inc	di
		inc	di

loc_1322:
		mov	[bp+4], di
		lea	di, [bp-45h]
		or	ax, ax
		jnz	short loc_133E
		or	dx, dx
		jnz	short loc_133E
		cmp	word ptr [bp-0Ah], 0
		jnz	short loc_1342
		mov	byte ptr ss:[di], 0
		mov	ax, di
		jmp	short loc_1351

loc_133E:
		or	word ptr [bp-2], 4

loc_1342:
		push	dx
		push	ax
		push	di
		mov	al, bh
		cbw
		push	ax
		mov	al, [bp-6]
		push	ax
		push	bx
		call	sub_5E9

loc_1351:
		push	ss
		pop	es
		mov	dx, [bp-0Ah]
		or	dx, dx
		jge	short loc_135D
		jmp	loc_144F

loc_135D:
		jmp	loc_145D

loc_1360:
		mov	[bp-5], dl
		mov	[bp+6], si
		lea	di, [bp-46h]
		mov	bx, [bp+4]
		push	word ptr ss:[bx]
		inc	bx
		inc	bx
		mov	[bp+4], bx
		test	word ptr [bp-2], 20h
		jz	short loc_138B
		mov	dx, ss:[bx]
		inc	bx
		inc	bx
		mov	[bp+4], bx
		push	ss
		pop	es
		call	sub_1120
		mov	al, 3Ah
		stosb

loc_138B:
		push	ss
		pop	es
		pop	dx
		call	sub_1120
		mov	byte ptr ss:[di], 0
		mov	byte ptr [bp-6], 0
		and	word ptr [bp-2], 0FFFBh
		lea	cx, [bp-46h]
		sub	di, cx
		xchg	di, cx
		mov	dx, [bp-0Ah]
		cmp	dx, cx
		jg	short loc_13AD
		mov	dx, cx

loc_13AD:
		jmp	loc_144F

loc_13B0:
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
		jmp	loc_1492

loc_13D0:
		mov	[bp+6], si
		mov	[bp-5], dl
		mov	di, [bp+4]
		test	word ptr [bp-2], 20h
		jnz	short loc_13ED
		mov	di, ss:[di]
		add	word ptr [bp+4], 2
		push	ds
		pop	es
		or	di, di
		jmp	short loc_13F8

loc_13ED:
		les	di, ss:[di]
		add	word ptr [bp+4], 4
		mov	ax, es
		or	ax, di

loc_13F8:
		jnz	short loc_13FF
		push	ds
		pop	es
		mov	di, 4FD4h

loc_13FF:
		call	sub_1152
		cmp	cx, [bp-0Ah]
		jbe	short loc_140A
		mov	cx, [bp-0Ah]

loc_140A:
		jmp	loc_1492

loc_140D:
		mov	[bp+6], si
		mov	[bp-5], dl
		mov	di, [bp+4]
		mov	cx, [bp-0Ah]
		or	cx, cx
		jge	short loc_1420
		mov	cx, 6

loc_1420:
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
		jz	short loc_143F
		mov	ax, 8
		add	word ptr [bp+4], 0Ah
		jmp	short loc_1446

loc_143F:
		add	word ptr [bp+4], 8
		mov	ax, 6

loc_1446:
		push	ax
		call	sub_1D60
		push	ss
		pop	es
		lea	di, [bp-45h]

loc_144F:
		test	word ptr [bp-2], 8
		jz	short loc_146E
		mov	dx, [bp-8]
		or	dx, dx
		jle	short loc_146E

loc_145D:
		call	sub_1152
		cmp	byte ptr es:[di], 2Dh
		jnz	short loc_1467
		dec	cx

loc_1467:
		sub	dx, cx
		jle	short loc_146E
		mov	[bp-0Eh], dx

loc_146E:
		cmp	byte ptr es:[di], 2Dh
		jz	short loc_147F
		mov	al, [bp-0Bh]
		or	al, al
		jz	short loc_148F
		dec	di
		mov	es:[di], al

loc_147F:
		cmp	word ptr [bp-0Eh], 0
		jle	short loc_148F
		mov	cx, [bp-0Ah]
		or	cx, cx
		jge	short loc_148F
		dec	word ptr [bp-0Eh]

loc_148F:
		call	sub_1152

loc_1492:
		mov	si, di
		mov	di, [bp-4]
		mov	bx, [bp-8]
		mov	ax, 5
		and	ax, [bp-2]
		cmp	ax, 5
		jnz	short loc_14B8
		mov	ah, [bp-5]
		cmp	ah, 6Fh
		jnz	short loc_14BA
		cmp	word ptr [bp-0Eh], 0
		jg	short loc_14B8
		mov	word ptr [bp-0Eh], 1

loc_14B8:
		jmp	short loc_14D5

loc_14BA:
		cmp	ah, 78h
		jz	short loc_14C4
		cmp	ah, 58h
		jnz	short loc_14D5

loc_14C4:
		or	word ptr [bp-2], 40h
		dec	bx
		dec	bx
		sub	word ptr [bp-0Eh], 2
		jge	short loc_14D5
		mov	word ptr [bp-0Eh], 0

loc_14D5:
		add	cx, [bp-0Eh]
		test	word ptr [bp-2], 2
		jnz	short loc_14EB
		jmp	short loc_14E7

loc_14E1:
		mov	al, 20h
		call	sub_115F
		dec	bx

loc_14E7:
		cmp	bx, cx
		jg	short loc_14E1

loc_14EB:
		test	word ptr [bp-2], 40h
		jz	short loc_14FD
		mov	al, 30h
		call	sub_115F
		mov	al, [bp-5]
		call	sub_115F

loc_14FD:
		mov	dx, [bp-0Eh]
		or	dx, dx
		jle	short loc_152B
		sub	cx, dx
		sub	bx, dx
		mov	al, es:[si]
		cmp	al, 2Dh
		jz	short loc_1517
		cmp	al, 20h
		jz	short loc_1517
		cmp	al, 2Bh
		jnz	short loc_151E

loc_1517:
		lodsb
		call	sub_115F
		dec	cx
		dec	bx

loc_151E:
		xchg	dx, cx
		jcxz	short loc_1529

loc_1522:
		mov	al, 30h
		call	sub_115F
		loop	short loc_1522

loc_1529:
		xchg	dx, cx

loc_152B:
		jcxz	short loc_153F
		sub	bx, cx

loc_152F:
		lodsb
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp-14h]
		jg	short loc_153D
		call	sub_1168

loc_153D:
		loop	short loc_152F

loc_153F:
		or	bx, bx
		jle	short loc_154C
		mov	cx, bx

loc_1545:
		mov	al, 20h
		call	sub_115F
		loop	short loc_1545

loc_154C:
		jmp	loc_11A4

loc_154F:
		mov	[bp+6], si
		mov	di, [bp+4]
		test	word ptr [bp-2], 20h
		jnz	short loc_1567
		mov	di, ss:[di]
		add	word ptr [bp+4], 2
		push	ds
		pop	es
		jmp	short loc_156E

loc_1567:
		les	di, ss:[di]
		add	word ptr [bp+4], 4

loc_156E:
		mov	ax, 50h
		sub	al, [bp-14h]
		add	ax, [bp-12h]
		mov	es:[di], ax
		test	word ptr [bp-2], 10h
		jz	short loc_1588
		inc	di
		inc	di
		mov	word ptr es:[di], 0

loc_1588:
		jmp	loc_11A1

loc_158B:
		mov	si, [bp-10h]
		mov	di, [bp-4]
		mov	al, 25h

loc_1593:
		call	sub_115F
		lodsb
		or	al, al
		jnz	short loc_1593

loc_159B:
		cmp	byte ptr [bp-14h], 50h
		jge	short loc_15A4
		call	sub_1168

loc_15A4:
		pop	es
		cmp	word ptr [bp-16h], 0
		jz	short loc_15B0
		mov	ax, 0FFFFh
		jmp	short loc_15B3

loc_15B0:
		mov	ax, [bp-12h]

loc_15B3:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret	8
sub_1168		endp

; START OF FUNCTION CHUNK FOR sub_1168
off_15BB	dw offset loc_121E
		dw offset loc_1208
		dw offset loc_1253
		dw offset loc_1213
		dw offset loc_1281
		dw offset loc_128E
		dw offset loc_12CC
		dw offset loc_12D3
		dw offset loc_12D8
		dw offset loc_123C
		dw offset loc_1301
		dw offset loc_12DF
		dw offset loc_12E3
		dw offset loc_12E7
		dw offset loc_1360
		dw offset loc_140D
		dw offset loc_13B0
		dw offset loc_13D0
		dw offset loc_154F
		dw offset loc_158B
		dw offset loc_158B
		dw offset loc_158B
		dw offset loc_122E
		dw offset loc_1234
; END OF FUNCTION CHUNK FOR sub_1168

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15EB		proc far

saved_4		= word ptr  4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	al, byte_5ED66
		mov	ah, 0
		mov	dx, [bp+saved_4]
		dec	dx
		imul	dx
		push	ax
		mov	ax, word_5ED69
		pop	dx
		add	ax, dx
		mov	dx, [bp+arg_0]
		dec	dx
		add	ax, dx
		shl	ax, 1
		mov	dx, word_5ED6B
		pop	bp
		ret	4
sub_15EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1610		proc far

var_2		= word ptr -2
saved_4		= word ptr  4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	al, byte_5ED68
		mov	ah, 0
		mov	[bp+var_2], ax
		push	ds
		mov	cx, [bp+saved_4]
		jcxz	short loc_1680
		les	di, [bp+arg_4]
		lds	si, [bp+arg_0]
		cld
		cmp	si, di
		jnb	short loc_163B
		mov	ax, cx
		dec	ax
		shl	ax, 1
		add	si, ax
		add	di, ax
		std

loc_163B:
		cmp	[bp+var_2], 0
		jnz	short loc_1645
		rep movsw
		jmp	short loc_1680

loc_1645:
		mov	dx, 3DAh
		mov	ax, es
		mov	bx, ds
		cmp	ax, bx
		jz	short loc_1661

loc_1650:
		cli

loc_1651:
		in	al, dx
		ror	al, 1
		jb	short loc_1651

loc_1656:
		in	al, dx
		ror	al, 1
		jnb	short loc_1656
		movsw
		sti
		loop	short loc_1650
		jmp	short loc_1680

loc_1661:
		cli

loc_1662:
		in	al, dx
		ror	al, 1
		jb	short loc_1662

loc_1667:
		in	al, dx
		ror	al, 1
		jnb	short loc_1667
		lodsw
		sti
		mov	bx, ax

loc_1670:
		in	al, dx
		ror	al, 1
		jb	short loc_1670

loc_1675:
		in	al, dx
		ror	al, 1
		jnb	short loc_1675
		mov	ax, bx
		stosw
		sti
		loop	short loc_1661

loc_1680:
		cld
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret	0Ah
sub_1610		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_168A		proc far

var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_2]
		mov	di, [bp+arg_0]
		mov	[bp+var_5], 0
		call	near ptr sub_2252
		mov	ah, 0
		mov	[bp+var_2], ax
		call	near ptr sub_2252
		mov	cl, 8
		shr	ax, cl
		mov	ah, 0
		mov	[bp+var_4], ax
		jmp	loc_178B

loc_16B3:
		mov	bx, si
		inc	si
		mov	al, [bx]
		mov	[bp+var_5], al
		mov	ah, 0
		sub	ax, 7
		mov	bx, ax
		cmp	bx, 6
		ja	short loc_16F5
		shl	bx, 1
		jmp	cs:off_17AF[bx]	; switch jump

loc_16CE:
		mov	ah, 0Eh
		mov	al, 7
		call	sub_180B
		jmp	short loc_174D

loc_16D7:
		mov	al, byte_5ED5E
		mov	ah, 0
		cmp	ax, [bp+var_2]
		jge	short loc_174D
		dec	[bp+var_2]
		jmp	short loc_174D

loc_16E6:
		mov	al, byte_5ED5E
		mov	ah, 0
		mov	[bp+var_2], ax
		jmp	short loc_174D

loc_16F0:
		inc	[bp+var_4]
		jmp	short loc_174D

loc_16F5:
		mov	al, byte_5ED67
		mov	ah, 0
		or	ax, ax
		jnz	short loc_172C
		cmp	word_5ED6D, 0
		jz	short loc_172C
		mov	ah, byte_5ED62
		mov	al, [bp+var_5]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		inc	ax
		push	ax
		mov	ax, [bp+var_4]
		inc	ax
		push	ax
		call	near ptr sub_15EB
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		mov	ax, 1
		push	ax
		call	near ptr sub_1610
		jmp	short loc_174A

loc_172C:
		mov	dl, byte ptr [bp+var_2]
		mov	dh, byte ptr [bp+var_4]
		mov	ah, 2
		mov	bh, 0
		call	sub_180B
		mov	bl, byte_5ED62
		mov	al, [bp+var_5]
		mov	ah, 9
		mov	bh, 0
		mov	cx, 1
		call	sub_180B

loc_174A:
		inc	[bp+var_2]

loc_174D:
		mov	al, byte_5ED60
		mov	ah, 0
		cmp	ax, [bp+var_2]
		jge	short loc_1765
		mov	al, byte_5ED5E
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	ax, word_5ED5C
		add	[bp+var_4], ax

loc_1765:
		mov	al, byte_5ED61
		mov	ah, 0
		cmp	ax, [bp+var_4]
		jge	short loc_178B
		mov	al, 6
		push	ax
		mov	al, byte_5ED5E
		push	ax
		mov	al, byte_5ED5F
		push	ax
		mov	al, byte_5ED60
		push	ax
		mov	al, byte_5ED61
		push	ax
		mov	al, 1
		push	ax
		call	sub_1F43
		dec	[bp+var_4]

loc_178B:
		mov	ax, di
		dec	di
		or	ax, ax
		jz	short loc_1795
		jmp	loc_16B3

loc_1795:
		mov	dl, byte ptr [bp+var_2]
		mov	dh, byte ptr [bp+var_4]
		mov	ah, 2
		mov	bh, 0
		call	sub_180B
		mov	al, [bp+var_5]
		mov	ah, 0
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret	6
sub_168A		endp

; START OF FUNCTION CHUNK FOR sub_168A
off_17AF	dw offset loc_16CE
		dw offset loc_16D7
		dw offset loc_16F5
		dw offset loc_16F0
		dw offset loc_16F5
		dw offset loc_16F5
		dw offset loc_16E6
; END OF FUNCTION CHUNK FOR sub_168A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17BD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 168Ah
		push	ax
		xor	ax, ax
		push	ax
		push	[bp+arg_0]
		lea	ax, [bp+arg_2]
		push	ax
		call	sub_1138
		pop	bp
		retf
sub_17BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17D3		proc far

saved_4		= word ptr  4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+saved_4]
		jmp	short loc_17F0

loc_17DC:
		les	bx, [bp+arg_0]
		inc	[bp+arg_0]
		mov	al, es:[bx]
		mov	bx, si
		inc	si
		cmp	al, [bx]
		jz	short loc_17F0
		xor	ax, ax
		jmp	short loc_17F8

loc_17F0:
		cmp	byte ptr [si], 0
		jnz	short loc_17DC
		mov	ax, 1

loc_17F8:
		pop	si
		pop	bp
		ret	6
sub_17D3		endp

; ----------------------------------------------------------------------

sub_17FD		proc near
		mov	ah, 12h
		mov	bl, 10h
		call	sub_180B
		mov	al, bl
		add	al, 0F0h
		mov	ah, 0
		ret
sub_17FD		endp

; ----------------------------------------------------------------------

sub_180B		proc near
		push	bp
		push	ds
		push	cx
		mov	cx, 40h
		mov	ds, cx
		pop	cx
		cmp	ah, 0
		jz	short loc_1822
		cmp	ah, 0Fh
		jz	short loc_1877

loc_181E:
		int	10h
		jmp	short loc_1893

loc_1822:
		cmp	al, 2
		jz	short loc_182A
		cmp	al, 3
		jnz	short loc_1843

loc_182A:
		push	ax
		mov	ax, 1A00h
		int	10h
		cmp	al, 1Ah
		jz	short loc_1839
		and	byte_59DA7, 0FEh

loc_1839:
		mov	ah, 1
		mov	cx, 607h
		int	10h
		pop	ax
		jmp	short loc_181E

loc_1843:
		cmp	al, 40h
		jnz	short loc_181E
		mov	bl, 10h
		mov	ah, 12h
		int	10h
		cmp	bl, 10h
		jz	short loc_1893
		mov	ax, 1112h
		xor	bl, bl
		int	10h
		mov	ax, 1200h
		mov	bl, 20h
		int	10h
		mov	ax, 1A00h
		int	10h
		cmp	al, 1Ah
		jz	short loc_1893
		or	byte_59DA7, 1
		mov	ah, 1
		mov	cx, 600h
		int	10h
		jmp	short loc_1893

loc_1877:
		int	10h
		cmp	al, 2
		jz	short loc_1881
		cmp	al, 3
		jnz	short loc_1893

loc_1881:
		push	ax
		call	sub_17FD
		or	al, al
		pop	ax
		jz	short loc_1893
		cmp	byte_59DA4, 18h
		jz	short loc_1893
		mov	al, 40h

loc_1893:
		pop	ds
		pop	bp
		ret
sub_180B		endp

; START OF FUNCTION CHUNK FOR sub_180B
		mov	ah, 0Fh
		call	sub_180B
		push	ax
		call	near ptr sub_18B3
		pop	cx
		mov	ah, 8
		mov	bh, 0
		call	sub_180B
		and	ah, 7Fh
		mov	byte_5ED63, ah
		mov	byte_5ED62, ah
		ret
; END OF FUNCTION CHUNK FOR sub_180B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18B3		proc far

saved_4		= byte ptr  4

		push	bp
		mov	bp, sp
		mov	al, [bp+saved_4]
		mov	byte_5ED64, al
		mov	ah, 0Fh
		call	sub_180B
		mov	byte_5ED66, ah
		cmp	al, byte_5ED64
		jz	short loc_18DF
		mov	al, byte_5ED64
		mov	ah, 0
		call	sub_180B
		mov	ah, 0Fh
		call	sub_180B
		mov	byte_5ED64, al
		mov	byte_5ED66, ah

loc_18DF:
		cmp	byte_5ED64, 3
		jbe	short loc_18F9
		cmp	byte_5ED64, 40h
		jnb	short loc_18F9
		cmp	byte_5ED64, 7
		jz	short loc_18F9
		mov	ax, 1
		jmp	short loc_18FB

loc_18F9:
		xor	ax, ax

loc_18FB:
		mov	byte_5ED67, al
		cmp	byte_5ED64, 40h
		jz	short loc_1909
		mov	al, 19h
		jmp	short loc_1914

loc_1909:
		mov	ax, 40h
		mov	es, ax
		mov	al, es:84h
		inc	al

loc_1914:
		mov	byte_5ED65, al
		cmp	byte_5ED64, 7
		jz	short loc_193D
		mov	ax, 0F000h
		mov	dx, 0FFEAh
		push	ax
		push	dx
		mov	ax, 504Fh
		push	ax
		call	near ptr sub_17D3
		or	ax, ax
		jnz	short loc_193D
		call	sub_17FD
		or	ax, ax
		jnz	short loc_193D
		mov	ax, 1
		jmp	short loc_193F

loc_193D:
		xor	ax, ax

loc_193F:
		mov	byte_5ED68, al
		cmp	byte_5ED64, 7
		jnz	short loc_194E
		mov	ax, 0B000h
		jmp	short loc_1951

loc_194E:
		mov	ax, 0B800h

loc_1951:
		mov	word_5ED6B, ax
		mov	word_5ED69, 0
		mov	al, 0
		mov	byte_5ED5F, al
		mov	byte_5ED5E, al
		mov	al, byte_5ED66
		add	al, 0FFh
		mov	byte_5ED60, al
		mov	al, byte_5ED65
		add	al, 0FFh
		mov	byte_5ED61, al
		pop	bp
		ret
sub_18B3		endp

; START OF FUNCTION CHUNK FOR sub_18B3
		mov	dx, 5056h
		jmp	short loc_197C
		mov	dx, 505Bh

loc_197C:
		mov	cx, 5
		mov	ah, 40h
		mov	bx, 2
		int	21h
		mov	cx, 27h
		mov	dx, 5060h
		mov	ah, 40h
		int	21h
		jmp	sub_2AF
; END OF FUNCTION CHUNK FOR sub_18B3

; ----------------------------------------------------------------------

sub_1993		proc near
		ret
sub_1993		endp

; ----------------------------------------------------------------------

sub_1994		proc near
		pushf
		cli
		mov	al, 0
		out	43h, al
		call	sub_1993
		in	al, 40h
		mov	bl, al
		call	sub_1993
		in	al, 40h
		mov	bh, al
		not	bx
		popf
		mov	ax, bx
		ret
sub_1994		endp

; ----------------------------------------------------------------------

sub_19AE		proc far
		push	si
		xor	si, si

loc_19B1:
		call	sub_1994
		test	ax, 1
		jnz	short loc_19C7
		mov	word_5EDAA, 0
		mov	word_5EDA8, 4A9h
		jmp	short loc_19CD

loc_19C7:
		inc	si
		cmp	si, 64h
		jl	short loc_19B1

loc_19CD:
		pop	si
		retf
sub_19AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à PIT_DelayLoop
; (sub_1E07 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à PIT_DelayLoop
; (sub_149E de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à PIT_DelayLoop
; (sub_17B0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far — boucle d'attente utilisant sub_1775 (PIT) et un delta 32-bit (word_71E14/16) :
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
		call	sub_1994
		mov	si, ax
		xor	dx, dx
		mov	bx, [bp+arg_0]
		xor	cx, cx
		push	ax
		push	dx
		mov	dx, word_5EDAA
		mov	ax, word_5EDA8
		call	sub_763
		pop	bx
		pop	cx
		add	cx, ax
		adc	bx, dx
		mov	[bp+var_2], bx
		mov	[bp+var_4], cx
		jmp	short loc_1A18

loc_19FC:
		cmp	bx, si
		jnb	short loc_1A16
		cmp	[bp+var_2], 1
		ja	short loc_1A0E
		jb	short loc_1A2B
		cmp	[bp+var_4], 0
		jb	short loc_1A2B

loc_1A0E:
		sub	[bp+var_4], 0
		sbb	[bp+var_2], 1

loc_1A16:
		mov	si, bx

loc_1A18:
		call	sub_1994
		mov	bx, ax
		xor	dx, dx
		cmp	dx, [bp+var_2]
		jb	short loc_19FC
		jnz	short loc_1A2B
		cmp	ax, [bp+var_4]
		jb	short loc_19FC

loc_1A2B:
		pop	si
		mov	sp, bp
		pop	bp
		retf
PIT_DelayLoop		endp

; ----------------------------------------------------------------------

sub_1A30		proc far
		cmp	byte_5EDAC, 0
		jz	short loc_1A41
		mov	byte_5EDAC, 0
		mov	al, byte_5EDAD
		jmp	short loc_1A46

loc_1A41:
		mov	ax, 700h
		int	21h

loc_1A46:
		mov	ah, 0
		retf
sub_1A30		endp

; START OF FUNCTION CHUNK FOR sub_1A30
		pop	ax
		push	cs
		push	ax
		push	si
		cmp	byte_5EDAC, 0
		jz	short loc_1A5C
		push	cs
		call	near ptr sub_1A30
		mov	si, ax
		jmp	short loc_1A69

loc_1A5C:
		push	cs
		call	near ptr sub_1A30
		mov	si, ax
		push	ax
		nop
		push	cs
		call	near ptr sub_1D4D
		pop	cx

loc_1A69:
		mov	ax, si
		pop	si
		retf
		pop	ax
		push	cs
		push	ax
; END OF FUNCTION CHUNK FOR sub_1A30

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A70		proc far

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		cmp	byte_5EDAC, 0
		jz	short loc_1A7F
		mov	ax, 0FFFFh
		jmp	short loc_1A8C

loc_1A7F:
		mov	byte_5EDAC, 1
		mov	al, [bp+arg_0]
		mov	byte_5EDAD, al
		mov	ah, 0

loc_1A8C:
		pop	bp
		retf
sub_1A70		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A8E		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	di
		push	si
		push	[bp+arg_4]
		push	[bp+arg_6]
		call	sub_1ECC
		or	ax, ax
		jnz	short loc_1AAF
		xor	ax, ax
		jmp	short loc_1ADC

loc_1AAF:
		mov	ax, [bp+arg_4]
		sub	ax, di
		inc	ax
		mov	[bp+var_2], ax
		jmp	short loc_1AD4

loc_1ABA:
		push	ds
		push	[bp+arg_8]
		push	di
		push	si
		call	near ptr sub_15EB
		push	dx
		push	ax
		push	[bp+var_2]
		call	sub_1E90
		mov	ax, [bp+var_2]
		shl	ax, 1
		add	[bp+arg_8], ax
		inc	si

loc_1AD4:
		cmp	si, [bp+arg_6]
		jle	short loc_1ABA
		mov	ax, 1

loc_1ADC:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_1A8E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1AE2		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	di
		push	si
		push	[bp+arg_4]
		push	[bp+arg_6]
		call	sub_1ECC
		or	ax, ax
		jnz	short loc_1B03
		xor	ax, ax
		jmp	short loc_1B30

loc_1B03:
		mov	ax, [bp+arg_4]
		sub	ax, di
		inc	ax
		mov	[bp+var_2], ax
		jmp	short loc_1B28

loc_1B0E:
		push	di
		push	si
		call	near ptr sub_15EB
		push	dx
		push	ax
		push	ds
		push	[bp+arg_8]
		push	[bp+var_2]
		call	sub_1E90
		mov	ax, [bp+var_2]
		shl	ax, 1
		add	[bp+arg_8], ax
		inc	si

loc_1B28:
		cmp	si, [bp+arg_6]
		jle	short loc_1B0E
		mov	ax, 1

loc_1B30:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_1AE2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; CRT_InstallProtectedHandler (sub_1E68 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à CRT_InstallProtectedHandler (sub_14FF de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à CRT_InstallProtectedHandler (sub_1811 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; sauvegarde contexte (sub_D8E=setjmp) puis appelle sub_1839 avec 3 arguments : installation
; d'un handler protégé (structured exception).
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
		call	near ptr sub_971
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1B5E
		add	sp, 8
		mov	sp, bp
		pop	bp
		retf
CRT_InstallProtectedHandler		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B5E		proc far

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
		jb	short loc_1B9C
		cmp	al, 26h
		ja	short loc_1B9C
		mov	byte ptr [bp+var_B], 36h
		mov	[bp+var_A], 68Fh
		mov	[bp+var_8], cx
		mov	[bp+var_6], 0CB5Dh

loc_1B9C:
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
		jz	short loc_1BF4
		push	ax
		push	ax
		call	sub_565
		pop	ax

loc_1BF4:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_1B5E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1BFA		proc far

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
		jb	short loc_1C41
		cmp	al, 26h
		ja	short loc_1C41
		mov	[bp+var_D], 36h
		mov	[bp+var_C], 68Fh
		mov	[bp+var_A], cx
		mov	[bp+var_8], 0CAh
		mov	[bp+var_7], 2
		jmp	short loc_1C4A
sub_1BFA		endp

; ----------------------------------------------------------------------

sub_1C40		proc far
		iret

loc_1C41:
		mov	byte ptr [bp-0Dh], 0CAh
		mov	word ptr [bp-0Ch], 2

loc_1C4A:
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
		call	near ptr sub_1C40
		pop	ds
		pop	bp
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_1C40		endp

; ----------------------------------------------------------------------

sub_1C9E		proc far
		cmp	byte_5EDAC, 0
		jz	short loc_1CAA
		mov	ax, 1
		jmp	short loc_1CAF

loc_1CAA:
		mov	ah, 0Bh
		int	21h
		cbw

loc_1CAF:
		retf
sub_1C9E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1CB0		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_2]
		mov	di, [bp+arg_6]
		push	[bp+arg_0]
		push	si
		push	[bp+arg_4]
		push	di
		call	sub_1ECC
		or	ax, ax
		jz	short loc_1CF0
		push	[bp+arg_8]
		push	[bp+arg_A]
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_0]
		mov	dx, [bp+arg_8]
		add	dx, ax
		push	dx
		mov	ax, di
		sub	ax, si
		mov	dx, [bp+arg_A]
		add	dx, ax
		push	dx
		call	sub_1ECC
		or	ax, ax
		jnz	short loc_1CF4

loc_1CF0:
		xor	ax, ax
		jmp	short loc_1D47

loc_1CF4:
		mov	dx, si
		mov	[bp+var_2], di
		mov	[bp+var_4], 1
		cmp	si, [bp+arg_A]
		jge	short loc_1D0D
		mov	dx, di
		mov	[bp+var_2], si
		mov	[bp+var_4], 0FFFFh

loc_1D0D:
		mov	di, dx
		jmp	short loc_1D3A

loc_1D11:
		push	[bp+arg_8]
		mov	ax, di
		sub	ax, si
		mov	dx, [bp+arg_A]
		add	dx, ax
		push	dx
		call	near ptr sub_15EB
		push	dx
		push	ax
		push	[bp+arg_0]
		push	di
		call	near ptr sub_15EB
		push	dx
		push	ax
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_0]
		inc	ax
		push	ax
		call	sub_1E90
		add	di, [bp+var_4]

loc_1D3A:
		mov	ax, [bp+var_2]
		add	ax, [bp+var_4]
		cmp	ax, di
		jnz	short loc_1D11
		mov	ax, 1

loc_1D47:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_1CB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D4D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		lea	ax, [bp+arg_0]
		push	ax
		mov	ax, 1
		push	ax
		xor	ax, ax
		push	ax
		call	near ptr sub_168A
		pop	bp
		retf
sub_1D4D		endp

; ----------------------------------------------------------------------

sub_1D60		proc near
		jmp	word ptr word_5EE00
sub_1D60		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D64		proc near

var_1		= byte ptr -1
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	ax, [bp+arg_0]
		shr	ax, 1
		mov	cx, ax
		mov	al, byte_5ED66
		mov	ah, 0
		push	ax
		mov	ax, cx
		xor	dx, dx
		pop	bx
		div	bx
		mov	bl, al
		mov	ah, 0
		mov	dl, byte_5ED66
		mov	dh, 0
		imul	dx
		mov	dl, cl
		sub	dl, al
		mov	[bp+var_1], dl
		mov	ah, bl
		mov	al, [bp+var_1]
		mov	sp, bp
		pop	bp
		ret	4
sub_1D64		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1D9C		proc near

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_2]
		mov	di, [bp+arg_0]
		mov	dx, [si]
		cmp	dx, [di]
		jz	short loc_1DB6
		mov	bh, 0
		mov	ah, 2
		call	sub_180B
		mov	[di], dx

loc_1DB6:
		inc	dl
		cmp	dl, byte_5ED66
		jb	short loc_1DC2
		inc	dh
		mov	dl, 0

loc_1DC2:
		mov	[si], dx
		pop	di
		pop	si
		pop	bp
		ret	4
sub_1D9C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1DCA		proc near

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	di, [bp+arg_0]
		call	near ptr sub_2252
		mov	[bp+var_8], ax
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		cmp	ax, word_5ED6B
		jnz	short loc_1DEC
		mov	ax, 1
		jmp	short loc_1DEE

loc_1DEC:
		xor	ax, ax

loc_1DEE:
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_1E01
		push	[bp+arg_8]
		push	[bp+arg_6]
		call	sub_1D64
		mov	[bp+var_2], ax

loc_1E01:
		mov	ax, [bp+arg_4]
		cmp	ax, word_5ED6B
		jnz	short loc_1E0F
		mov	ax, 1
		jmp	short loc_1E11

loc_1E0F:
		xor	ax, ax

loc_1E11:
		mov	[bp+var_C], ax
		or	ax, ax
		jz	short loc_1E77
		push	[bp+arg_4]
		push	[bp+arg_2]
		call	sub_1D64
		mov	[bp+var_4], ax
		jmp	short loc_1E77

loc_1E26:
		cmp	[bp+var_C], 0
		jz	short loc_1E42
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	sub_1D9C
		mov	bh, 0
		mov	ah, 8
		call	sub_180B
		mov	si, ax
		jmp	short loc_1E4C

loc_1E42:
		les	bx, [bp+arg_2]
		mov	si, es:[bx]
		add	[bp+arg_2], 2

loc_1E4C:
		cmp	[bp+var_A], 0
		jz	short loc_1E6D
		lea	ax, [bp+var_2]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	sub_1D9C
		mov	ax, si
		mov	bl, ah
		mov	cx, 1
		mov	bh, 0
		mov	ah, 9
		call	sub_180B
		jmp	short loc_1E77

loc_1E6D:
		les	bx, [bp+arg_6]
		mov	es:[bx], si
		add	[bp+arg_6], 2

loc_1E77:
		mov	ax, di
		dec	di
		or	ax, ax
		jnz	short loc_1E26
		mov	dx, [bp+var_8]
		mov	bh, 0
		mov	ah, 2
		call	sub_180B
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret	0Ah
sub_1DCA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E90		proc near

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, byte_5ED67
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1EB8
		cmp	word_5ED6D, 0
		jz	short loc_1EB8
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	dx
		call	near ptr sub_1610
		jmp	short loc_1EC8

loc_1EB8:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	dx
		call	sub_1DCA

loc_1EC8:
		pop	bp
		ret	0Ah
sub_1E90		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1ECC		proc near

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	bx, [bp+arg_6]
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_2]
		mov	al, byte_5ED66
		mov	ah, 0
		mov	cx, ax
		mov	al, byte_5ED65
		mov	ah, 0
		mov	dx, ax
		cmp	bx, cx
		ja	short loc_1F19
		cmp	di, cx
		ja	short loc_1F19
		cmp	bx, di
		jg	short loc_1F19
		cmp	si, dx
		ja	short loc_1F19
		cmp	[bp+arg_0], dx
		ja	short loc_1F19
		cmp	si, [bp+arg_0]
		jg	short loc_1F19
		or	bx, bx
		jle	short loc_1F19
		or	di, di
		jle	short loc_1F19
		or	si, si
		jle	short loc_1F19
		cmp	[bp+arg_0], 0
		jle	short loc_1F19
		mov	ax, 1
		jmp	short loc_1F1B

loc_1F19:
		xor	ax, ax

loc_1F1B:
		pop	di
		pop	si
		pop	bp
		ret	8
sub_1ECC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F21		proc near

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	dx, [bp+arg_2]
		mov	ch, byte_5ED62
		mov	cl, 20h
		jmp	short loc_1F39

loc_1F33:
		mov	[si], cx
		add	si, 2
		inc	dx

loc_1F39:
		cmp	dx, [bp+arg_0]
		jle	short loc_1F33
		pop	si
		pop	bp
		ret	6
sub_1F21		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F43		proc near

var_A0		= word ptr -0A0h
saved_0		= word ptr  0
arg_0		= byte ptr  4
arg_2		= byte ptr  6
arg_4		= byte ptr  8
arg_6		= byte ptr  0Ah
arg_8		= byte ptr  0Ch
arg_A		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0A0h
		mov	al, byte_5ED67
		mov	ah, 0
		or	ax, ax
		jz	short loc_1F56
		jmp	loc_208A

loc_1F56:
		cmp	word_5ED6D, 0
		jnz	short loc_1F60
		jmp	loc_208A

loc_1F60:
		cmp	[bp+arg_0], 1
		jz	short loc_1F69
		jmp	loc_208A

loc_1F69:
		inc	[bp+arg_8]
		inc	[bp+arg_6]
		inc	[bp+arg_4]
		inc	[bp+arg_2]
		cmp	[bp+arg_A], 6
		jz	short loc_1F7E
		jmp	loc_200C

loc_1F7E:
		mov	al, [bp+arg_6]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_6]
		mov	ah, 0
		inc	ax
		push	ax
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax
		nop
		push	cs
		call	near ptr sub_1CB0
		add	sp, 0Ch
		lea	ax, [bp+var_A0]
		push	ax
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax
		nop
		push	cs
		call	near ptr sub_1A8E
		add	sp, 0Ah
		lea	ax, [bp+var_A0]
		push	ax
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		call	sub_1F21
		lea	ax, [bp+var_A0]
		push	ax
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_2]

loc_1FF8:
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax
		nop
		push	cs
		call	near ptr sub_1AE2
		add	sp, 0Ah
		jmp	loc_20A3

loc_200C:
		mov	al, [bp+arg_6]
		mov	ah, 0
		inc	ax
		push	ax
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_2]
		mov	ah, 0
		dec	ax
		push	ax
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_6]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax
		nop
		push	cs
		call	near ptr sub_1CB0
		add	sp, 0Ch
		lea	ax, [bp+var_A0]
		push	ax
		mov	al, [bp+arg_6]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_6]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax
		nop
		push	cs
		call	near ptr sub_1A8E
		add	sp, 0Ah
		lea	ax, [bp+var_A0]
		push	ax
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		call	sub_1F21
		lea	ax, [bp+var_A0]
		push	ax
		mov	al, [bp+arg_6]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_6]
		jmp	loc_1FF8

loc_208A:
		mov	bh, byte_5ED62
		mov	ah, [bp+arg_A]
		mov	al, [bp+arg_0]
		mov	ch, [bp+arg_6]
		mov	cl, [bp+arg_8]
		mov	dh, [bp+arg_2]
		mov	dl, [bp+arg_4]
		call	sub_180B

loc_20A3:
		mov	sp, bp
		pop	bp
		ret	0Ch
sub_1F43		endp

; START OF FUNCTION CHUNK FOR sub_1F43
		add	[bx+si], al
		pop	word_5EDB2
		pop	word_5EDB4
		pop	word_5EDB6
		mov	cs:20A9h, ds
		mov	word_5EDB8, si
		mov	word_5EDBA, di
		cld
		mov	es, word_59E3D
		mov	si, 80h
		xor	ah, ah
		lodsb
		inc	ax
		mov	bp, es
		xchg	si, dx
		xchg	bx, ax
		mov	si, word_59E37
		inc	si
		inc	si
		mov	cx, 1
		cmp	byte ptr word_59E3F, 3
		jb	short loc_20F7
		mov	es, word_59E39
		mov	di, si
		mov	cl, 7Fh
		xor	al, al
		repne scasb
		jcxz	short loc_2166
		xor	cl, 7Fh

loc_20F7:
		push	ax
		mov	ax, cx
		add	ax, bx
		inc	ax
		and	ax, 0FFFEh
		mov	di, sp
		sub	di, ax
		jb	short loc_2166
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

loc_211E:
		call	loc_213E
		ja	short loc_212E

loc_2123:
		jb	short loc_216B
		cmp	al, 0Dh
		jz	short loc_213A
		call	loc_213E
		ja	short loc_2123

loc_212E:
		cmp	al, 20h
		jz	short loc_213A
		cmp	al, 0Dh
		jz	short loc_213A
		cmp	al, 9
		jnz	short loc_211E

loc_213A:
		xor	al, al
		jmp	short loc_211E
		or	ax, ax
		jz	short loc_2149
		inc	dx
		stosb
		or	al, al
		jnz	short loc_2149
		inc	bx

loc_2149:
		xchg	al, ah
		xor	al, al
		stc
		jcxz	short loc_2165
		lodsb
		dec	cx
		sub	al, 22h
		jz	short loc_2165
		add	al, 22h
		cmp	al, 5Ch
		jnz	short loc_2163
		cmp	byte ptr [si], 22h
		jnz	short loc_2163
		lodsb
		dec	cx

loc_2163:
		or	si, si

loc_2165:
		ret

loc_2166:
		nop
		nop
		jmp	sub_2AF

loc_216B:
		pop	cx
		add	cx, dx
		mov	ds, cs:20A9h
		mov	word_5EDAE, bx
		inc	bx
		add	bx, bx
		mov	si, sp
		mov	bp, sp
		sub	bp, bx
		jb	short loc_2166
		mov	sp, bp
		mov	word_5EDB0, bp

loc_2188:
		jcxz	short loc_2198
		mov	[bp+saved_0], si
		add	bp, 2

loc_2190:
		lodsb
		or	al, al
		loopne	short loc_2190
		jz	short loc_2188

loc_2198:
		xor	ax, ax
		mov	[bp+saved_0], ax
		mov	ds, cs:20A9h
		mov	si, word_5EDB8
		mov	di, word_5EDBA
		push	word_5EDB6
		push	word_5EDB4
		mov	ax, word_5EDAE
		mov	word_59E31, ax
		mov	ax, word_5EDB0
		mov	word_59E33, ax
		jmp	word ptr word_5EDB2
		push	si
		push	di
		mov	cx, word_59E37
		push	cx
		call	sub_44F3F
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_21F9
		push	ds
		push	ds
		pop	es
		mov	ds, word_59E39
		xor	si, si
		cld
		rep movsb
		pop	ds
		mov	di, ax
		push	es
		push	word_59E3B
		call	sub_44F3F
		pop	bx
		mov	bx, ax
		pop	es
		mov	word_5EDBC, ax
		or	ax, ax
		jnz	short loc_21FE

loc_21F9:
		nop
		nop
		jmp	sub_2AF

loc_21FE:
		xor	ax, ax
		mov	cx, 0FFFFh
		cmp	byte ptr [di], 0
		jz	short loc_2214

loc_2208:
		mov	[bx], di
		add	bx, 2
		repne scasb
		cmp	es:[di], al
		jnz	short loc_2208

loc_2214:
		mov	[bx], ax
		pop	di
		pop	si
		mov	ax, word_5EDBC
		mov	word_59E35, ax
		ret
; END OF FUNCTION CHUNK FOR sub_1F43

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à PC_SoundOn (sub_1F18 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; programme le timer PIT canal 2 (port 42h/43h) à une fréquence donnée + active le gate
; speaker (port 61h) : fonction sound(freq).
; ==============================================================================================
PC_SoundOn		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	ax, 34DDh
		mov	dx, 12h
		cmp	dx, bx
		jnb	short loc_2249
		div	bx
		mov	bx, ax
		in	al, 61h
		test	al, 3
		jnz	short loc_2241
		or	al, 3
		out	61h, al
		mov	al, 0B6h
		out	43h, al

loc_2241:
		mov	al, bl
		out	42h, al
		mov	al, bh
		out	42h, al

loc_2249:
		pop	bp
		retf
PC_SoundOn		endp

; ----------------------------------------------------------------------

sub_224B		proc far
		in	al, 61h
		and	al, 0FCh
		out	61h, al
		retf
sub_224B		endp

; ----------------------------------------------------------------------

sub_2252		proc far
		mov	ah, 3
		mov	bh, 0
		call	sub_180B
		mov	ax, dx
		ret
sub_2252		endp

; START OF FUNCTION CHUNK FOR sub_2252
		call	near ptr sub_2252
		mov	ah, 0
		mov	dl, byte_5ED5E
		mov	dh, 0
		sub	ax, dx
		inc	ax
		retf
		call	near ptr sub_2252
		mov	cl, 8
		shr	ax, cl
		mov	ah, 0
		mov	dl, byte_5ED5F
		mov	dh, 0
		sub	ax, dx
		inc	ax
		retf
; END OF FUNCTION CHUNK FOR sub_2252

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Write_TextMode
; (sub_2156 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; CRT_Write_TextMode (sub_1C8A de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à CRT_Write_TextMode (sub_1F4B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — wrapper write() avec test mode texte/binaire
; (CR/LF handling, flag bit1).
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
		jz	short loc_22AF
		test	[bp+arg_2], 2
		jz	short loc_22A2
		test	dx, 1
		jnz	short loc_22A6

loc_22A2:
		xor	ax, ax
		jmp	short loc_22AF

loc_22A6:
		mov	word_59E41, 5
		mov	ax, 0FFFFh

loc_22AF:
		pop	bp
		retf
CRT_Write_TextMode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22B1		proc far

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
		mov	di, 4CFBh

loc_22C6:
		mov	bl, [si]
		inc	si
		test	byte ptr [bx+di], 1
		jnz	short loc_22C6
		mov	bp, 0
		cmp	bl, 2Bh
		jz	short loc_22DC
		cmp	bl, 2Dh
		jnz	short loc_22DF
		inc	bp

loc_22DC:
		mov	bl, [si]
		inc	si

loc_22DF:
		cmp	bl, 39h
		ja	short loc_2312
		sub	bl, 30h
		jb	short loc_2312
		mul	cx
		add	ax, bx
		adc	dl, dh
		jz	short loc_22DC
		jmp	short loc_2305

loc_22F3:
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

loc_2305:
		mov	bl, [si]
		inc	si
		cmp	bl, 39h
		ja	short loc_2312
		sub	bl, 30h
		jnb	short loc_22F3

loc_2312:
		dec	bp
		jl	short loc_231C
		neg	dx
		neg	ax
		sbb	dx, 0

loc_231C:
		pop	bp
		pop	di
		pop	si
		pop	bp
		retf
sub_22B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2321		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_22B1
		pop	cx
		pop	bp
		retf
sub_2321		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_SetFileAttr
; (sub_2206 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s)
; (adresses de données ou constantes) — à vérifier à CRT_SetFileAttr (sub_1D3A de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à CRT_SetFileAttr (sub_1F7E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; opération fichier bas niveau INT21 AH=43h (get/set attributs) avec gestion erreur via
; sub_4E7.
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
		jb	short loc_2343
		xchg	cx, ax
		jmp	short loc_2347

loc_2343:
		push	ax
		call	sub_565

loc_2347:
		pop	bp
		retf
CRT_SetFileAttr		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Stdio_Fflush (sub_2221
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
		jnz	short loc_235C
		nop
		push	cs
		call	near ptr sub_242A
		jmp	short loc_23C4

loc_235C:
		cmp	[di+0Eh], di
		jz	short loc_2366

loc_2361:
		mov	ax, 0FFFFh
		jmp	short loc_23C6

loc_2366:
		cmp	word ptr [di], 0
		jl	short loc_2394
		test	word ptr [di+2], 8
		jnz	short loc_237C
		mov	ax, di
		add	ax, 5
		cmp	[di+0Ah], ax
		jnz	short loc_23C4

loc_237C:
		mov	word ptr [di], 0
		mov	ax, di
		add	ax, 5
		cmp	[di+0Ah], ax
		jnz	short loc_23C4
		mov	ax, [di+8]
		mov	[di+0Ah], ax
		jmp	short loc_23C4
		jmp	short loc_23C4

loc_2394:
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
		jz	short loc_23C4
		test	word ptr [di+2], 200h
		jnz	short loc_23C4
		or	word ptr [di+2], 10h
		jmp	short loc_2361

loc_23C4:
		xor	ax, ax

loc_23C6:
		pop	di
		pop	si
		pop	bp
		retf
Stdio_Fflush		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23CA		proc far

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
		jb	short loc_23F7
		xor	ax, ax
		jmp	short loc_23FB

loc_23F7:
		push	bx
		call	sub_565

loc_23FB:
		pop	bp
		retf
sub_23CA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23FD		proc far

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
		jb	short loc_2424
		xor	ax, ax
		jmp	short loc_2428

loc_2424:
		push	bx
		call	sub_565

loc_2428:
		pop	bp
		retf
sub_23FD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_242A		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	[bp+var_2], 0
		mov	di, word_5EC68
		mov	si, 4E08h
		jmp	short loc_2454

loc_2440:
		test	word ptr [si+2], 3
		jz	short loc_2451
		push	si
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		inc	[bp+var_2]

loc_2451:
		add	si, 10h

loc_2454:
		mov	ax, di
		dec	di
		or	ax, ax
		jnz	short loc_2440
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_242A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Strrchr_Like
; (sub_2358 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Strrchr_Like
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
		jnz	short loc_2474

loc_2470:
		xor	ax, ax
		jmp	short loc_2499

loc_2474:
		push	di
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2470
		push	di
		push	si
		push	[bp+arg_2]
		call	sub_292A
		or	ax, ax
		jz	short loc_2496
		mov	bx, si
		mov	al, [bx+di-1]
		mov	ah, 0
		jmp	short loc_2499

loc_2496:
		mov	ax, 0FFFFh

loc_2499:
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strrchr_Like		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_249D		proc far

saved_4		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+saved_4]
		cmp	word ptr [si], 0
		jge	short loc_24B4
		mov	dx, [si+6]
		add	dx, [si]
		inc	dx
		mov	di, dx
		jmp	short loc_24BF

loc_24B4:
		mov	ax, [si]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	dx, ax
		mov	di, ax

loc_24BF:
		test	word ptr [si+2], 40h
		jnz	short loc_24F2
		mov	cx, [si+0Ah]
		cmp	word ptr [si], 0
		jge	short loc_24EB
		jmp	short loc_24D9

loc_24D0:
		dec	cx
		mov	bx, cx
		cmp	byte ptr [bx], 0Ah
		jnz	short loc_24D9
		inc	di

loc_24D9:
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_24D0
		jmp	short loc_24F2

loc_24E2:
		mov	bx, cx
		inc	cx
		cmp	byte ptr [bx], 0Ah
		jnz	short loc_24EB
		inc	di

loc_24EB:
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_24E2

loc_24F2:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		ret	2
sub_249D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Stdio_WriteTextMode
; (sub_23EE de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s)
; (adresses de données ou constantes) — à vérifier à Stdio_WriteTextMode (sub_1F06 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à Stdio_WriteTextMode (sub_2106
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far
; — écriture bas niveau d'un buffer FILE* avec traduction CR/LF (sub_20A9) puis lseek/write
; (sub_605) : flush écriture d'un stream texte.
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
		jz	short loc_2515
		mov	ax, 0FFFFh
		jmp	short loc_255E

loc_2515:
		cmp	di, 1
		jnz	short loc_252A
		cmp	word ptr [si], 0
		jle	short loc_252A
		push	si
		call	near ptr sub_249D
		cwd
		sub	[bp+arg_2], ax
		sbb	[bp+arg_4], dx

loc_252A:
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
		jnz	short loc_255C
		cmp	ax, 0FFFFh
		jnz	short loc_255C
		mov	ax, 0FFFFh
		jmp	short loc_255E

loc_255C:
		xor	ax, ax

loc_255E:
		pop	di
		pop	si
		pop	bp
		retf
Stdio_WriteTextMode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2562		proc far

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
		jnz	short loc_2596
		cmp	ax, 0FFFFh
		jnz	short loc_2596
		jmp	loc_261E

loc_2596:
		cmp	word ptr [si], 0
		jge	short loc_2613
		mov	al, [si+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+4F4Ah], 800h
		jz	short loc_2606
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
		jnz	short loc_25D2
		cmp	ax, 0FFFFh
		jz	short loc_2624

loc_25D2:
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
		jnz	short loc_25FA
		cmp	ax, 0FFFFh
		jnz	short loc_25FA
		mov	dx, 0FFFFh
		mov	ax, 0FFFFh
		jmp	short loc_2624

loc_25FA:
		mov	ax, [bp+var_6]
		mov	dx, [bp+var_8]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx

loc_2606:
		push	si
		call	near ptr sub_249D
		cwd
		add	[bp+var_4], ax
		adc	[bp+var_2], dx
		jmp	short loc_261E

loc_2613:
		push	si
		call	near ptr sub_249D
		cwd
		sub	[bp+var_4], ax
		sbb	[bp+var_2], dx

loc_261E:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_2624:
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_2562		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2629		proc far

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
		jz	short loc_2654
		mov	al, 0
		mov	ah, [di]
		mov	cx, 0FFFFh
		cld
		repne scasb
		not	cx
		dec	cx
		jz	short loc_2654
		mov	di, word_5EDBC
		or	di, di
		mov	[bp+var_2], di
		jnz	short loc_265F

loc_2654:
		xor	ax, ax
		jmp	short loc_2682

loc_2658:
		add	[bp+var_2], 2
		mov	di, [bp+var_2]

loc_265F:
		mov	di, [di]
		or	di, di
		jz	short loc_2654
		mov	al, [di]
		or	al, al
		jz	short loc_2654
		cmp	ah, al
		jnz	short loc_2658
		mov	bx, cx
		cmp	byte ptr [bx+di], 3Dh
		jnz	short loc_2658
		mov	si, [bp+arg_0]
		repe cmpsb
		xchg	bx, cx
		jnz	short loc_2658
		inc	di
		mov	ax, di

loc_2682:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_2629		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Itoa_Signed10
; (sub_257C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; CRT_Itoa_Signed10 (sub_2094 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à CRT_Itoa_Signed10 (sub_2235 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — wrapper sprintf %d signé base10 via sub_56B
; (itoa signé).
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
		jnz	short loc_269B
		mov	ax, bx
		cwd
		jmp	short loc_269F

loc_269B:
		mov	ax, bx
		xor	dx, dx

loc_269F:
		push	dx
		push	ax
		push	[bp+arg_2]
		push	cx
		mov	al, 1
		push	ax
		mov	al, 61h
		push	ax
		call	sub_5E9
		pop	bp
		retf
CRT_Itoa_Signed10		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Itoa_Unsigned
; (sub_25A4 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; CRT_Itoa_Unsigned (sub_20BC de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à CRT_Itoa_Unsigned (sub_225D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — wrapper itoa non signé base10.
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
		call	sub_5E9
		pop	bp
		retf
CRT_Itoa_Unsigned		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Itoa_BaseVariant
; (sub_25BE de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; CRT_Itoa_BaseVariant (sub_20D6 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à CRT_Itoa_BaseVariant (sub_2277 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — wrapper itoa base variable, signé uniquement
; si base=10.
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
		jnz	short loc_26E4
		mov	ax, 1
		jmp	short loc_26E6

loc_26E4:
		xor	ax, ax

loc_26E6:
		push	ax
		mov	al, 61h
		push	ax
		call	sub_5E9
		pop	bp
		retf
CRT_Itoa_BaseVariant		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Memmove (sub_25E3
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
		jnb	short loc_2707
		movsb

loc_2707:
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
CRT_Memmove		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Memset (sub_2602
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
		jz	short loc_272A
		jcxz	short loc_2731
		stosb
		dec	cx

loc_272A:
		shr	cx, 1
		rep stosw
		jnb	short loc_2731
		stosb

loc_2731:
		pop	di
		pop	bp
		retf
CRT_Memset		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Memset_Public
; (sub_2628 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; CRT_Memset_Public (sub_2140 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à CRT_Memset_Public (sub_22E1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — wrapper memset avec retour du pointeur :
; implémentation publique memset().
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

sub_274F		proc far

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
		jnb	short loc_2764
		std
		mov	ax, 1
		jmp	short loc_2767

loc_2764:
		cld
		xor	ax, ax

loc_2767:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cx, [bp+arg_4]
		or	ax, ax
		jz	short loc_277A
		add	si, cx
		dec	si
		add	di, cx
		dec	di

loc_277A:
		test	di, 1
		jz	short loc_2784
		jcxz	short loc_2793
		movsb
		dec	cx

loc_2784:
		sub	si, ax
		sub	di, ax
		shr	cx, 1
		rep movsw
		jnb	short loc_2793
		add	si, ax
		add	di, ax
		movsb

loc_2793:
		cld
		pop	di
		pop	si
		pop	bp
		retf
sub_274F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2798		proc far

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
		call	near ptr sub_274F
		add	sp, 6
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_2798		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Msg_NullPtrAssign (sub_26A6 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à CRT_Msg_NullPtrAssign (sub_21BE de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite
; d'instructions, 2 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à CRT_Msg_NullPtrAssign (sub_22FC de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — wrapper sprintf avec format fixe (pointeurs
; 2474h/aNullPointerAss+45h) : probable message runtime 'Null pointer assignment'.
; ==============================================================================================
CRT_Msg_NullPtrAssign		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, 292Ah
		push	ax
		mov	ax, 4E18h
		push	ax
		push	[bp+arg_0]
		lea	ax, [bp+arg_2]
		push	ax
		call	sub_1138
		pop	bp
		retf
CRT_Msg_NullPtrAssign		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Stdio_Ungetc (sub_26BD
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_Putc (sub_26D6 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite
; d'instructions, 3 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à Stdio_Putc (sub_21EE de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Stdio_Putc (sub_232C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; putc()/fputc() interne : écrit un octet dans le buffer FILE*, gère line-buffering (flush sur
; \n/\r via sub_1F99), unbuffered (sub_605), et erreurs matherr-like via sub_2CC7.
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
		mov	byte_6076C, al
		cmp	word ptr [di], 0FFFFh
		jge	short loc_2831
		inc	word ptr [di]
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	[bx], al
		test	word ptr [di+2], 8
		jnz	short loc_2809
		jmp	loc_290F

loc_2809:
		cmp	byte_6076C, 0Ah
		jz	short loc_281A
		cmp	byte_6076C, 0Dh
		jz	short loc_281A
		jmp	loc_290F

loc_281A:
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_2828
		jmp	loc_290F

loc_2828:
		mov	ax, 0FFFFh
		jmp	loc_2914
		jmp	loc_290F

loc_2831:
		test	word ptr [di+2], 90h
		jnz	short loc_283F
		test	word ptr [di+2], 2
		jnz	short loc_2845

loc_283F:
		or	word ptr [di+2], 10h
		jmp	short loc_2828

loc_2845:
		or	word ptr [di+2], 100h
		cmp	word ptr [di+6], 0
		jz	short loc_289C
		cmp	word ptr [di], 0
		jz	short loc_2860
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_2828

loc_2860:
		mov	ax, [di+6]
		neg	ax
		mov	[di], ax
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	al, byte_6076C
		mov	[bx], al
		test	word ptr [di+2], 8
		jnz	short loc_287C
		jmp	loc_290F

loc_287C:
		cmp	byte_6076C, 0Ah
		jz	short loc_288D
		cmp	byte_6076C, 0Dh
		jz	short loc_288D
		jmp	loc_290F

loc_288D:
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jz	short loc_290F
		jmp	short loc_2828
		jmp	short loc_290F

loc_289C:
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+4F4Ah], 800h
		jz	short loc_28C3
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

loc_28C3:
		cmp	byte_6076C, 0Ah
		jnz	short loc_28EB
		test	word ptr [di+2], 40h
		jnz	short loc_28EB
		mov	ax, 1
		push	ax
		mov	ax, 509Eh
		push	ax
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		cmp	ax, 1
		jnz	short loc_2905

loc_28EB:
		mov	ax, 1
		push	ax
		mov	ax, 6A4Ch
		push	ax
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		cmp	ax, 1
		jz	short loc_290F

loc_2905:
		test	word ptr [di+2], 200h
		jnz	short loc_290F
		jmp	loc_283F

loc_290F:
		mov	al, byte_6076C
		mov	ah, 0

loc_2914:
		pop	di
		pop	si
		pop	bp
		retf
Stdio_Putc		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2918		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4E18h
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr Stdio_Putc
		pop	cx
		pop	cx
		pop	bp
		retf
sub_2918		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_292A		proc near

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
		jz	short loc_296C
		jmp	short loc_295F

loc_2944:
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
		jnz	short loc_295F

loc_295A:
		xor	ax, ax
		jmp	loc_2ACA

loc_295F:
		mov	ax, [bp+arg_2]
		dec	[bp+arg_2]
		or	ax, ax
		jnz	short loc_2944
		jmp	loc_2AC7

loc_296C:
		test	word ptr [di+2], 40h
		jnz	short loc_2976
		jmp	loc_2A68

loc_2976:
		cmp	word ptr [di+6], 0
		jnz	short loc_297F
		jmp	loc_2A24

loc_297F:
		mov	ax, [di+6]
		cmp	ax, [bp+arg_2]
		jnb	short loc_29DF
		cmp	word ptr [di], 0
		jz	short loc_2997
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_295A

loc_2997:
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+4F4Ah], 800h
		jz	short loc_29BE
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

loc_29BE:
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
		jnz	short loc_29D9
		jmp	loc_2AC7

loc_29D9:
		jmp	loc_295A
		jmp	loc_2AC7

loc_29DF:
		mov	ax, [di]
		add	ax, [bp+arg_2]
		jl	short loc_2A03
		cmp	word ptr [di], 0
		jnz	short loc_29F5
		mov	ax, 0FFFFh
		sub	ax, [di+6]
		mov	[di], ax
		jmp	short loc_2A03

loc_29F5:
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jz	short loc_2A03
		jmp	loc_295A

loc_2A03:
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
		jmp	loc_2AC7

loc_2A24:
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+4F4Ah], 800h
		jz	short loc_2A4B
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

loc_2A4B:
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
		jz	short loc_2AC7
		jmp	loc_295A
		jmp	short loc_2AC7

loc_2A68:
		cmp	word ptr [di+6], 0
		jz	short loc_2AAC
		jmp	short loc_2AA0

loc_2A70:
		inc	word ptr [di]
		jge	short loc_2A88
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	si, [bp+arg_4]
		inc	[bp+arg_4]
		mov	al, [si]
		mov	[bx], al
		mov	ah, 0
		jmp	short loc_2A98

loc_2A88:
		push	di
		mov	bx, [bp+arg_4]
		inc	[bp+arg_4]
		mov	al, [bx]
		push	ax
		push	cs
		call	near ptr Stdio_Ungetc
		pop	cx
		pop	cx

loc_2A98:
		cmp	ax, 0FFFFh
		jnz	short loc_2AA0
		jmp	loc_295A

loc_2AA0:
		mov	ax, [bp+arg_2]
		dec	[bp+arg_2]
		or	ax, ax
		jnz	short loc_2A70
		jmp	short loc_2AC7

loc_2AAC:
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
		jz	short loc_2AC7
		jmp	loc_295A

loc_2AC7:
		mov	ax, [bp+var_2]

loc_2ACA:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret	6
sub_292A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_SetupFileStruct (sub_29C6 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Stdio_SetupFileStruct (sub_24DE de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite
; d'instructions, 3 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à Stdio_SetupFileStruct (sub_261C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — 112 lignes, initialise les champs d'une structure FILE*
; (buffer, position, flags [si+2] bits 4/8) : setvbuf()/setup interne de flux (fdopen).
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
		jnz	short loc_2AEE
		cmp	[bp+arg_4], 2
		jg	short loc_2AEE
		cmp	di, 7FFFh
		jbe	short loc_2AF4

loc_2AEE:
		mov	ax, 0FFFFh
		jmp	loc_2BA6

loc_2AF4:
		cmp	word_5EDC2, 0
		jnz	short loc_2B09
		cmp	si, 4E18h
		jnz	short loc_2B09
		mov	word_5EDC2, 1
		jmp	short loc_2B1C

loc_2B09:
		cmp	word_5EDC0, 0
		jnz	short loc_2B1C
		cmp	si, 4E08h
		jnz	short loc_2B1C
		mov	word_5EDC0, 1

loc_2B1C:
		cmp	word ptr [si], 0
		jz	short loc_2B34
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

loc_2B34:
		test	word ptr [si+2], 4
		jz	short loc_2B44
		push	word ptr [si+8]
		call	sub_45058
		pop	cx

loc_2B44:
		and	word ptr [si+2], 0FFF3h
		mov	word ptr [si+6], 0
		mov	ax, si
		add	ax, 5
		mov	[si+8], ax
		mov	[si+0Ah], ax
		cmp	[bp+arg_4], 2
		jz	short loc_2BA4
		or	di, di
		jbe	short loc_2BA4
		mov	word_5EB1E, seg seg000
		mov	word ptr dword_5EB1C, 35E6h
		cmp	[bp+arg_2], 0
		jnz	short loc_2B8E
		push	di
		call	sub_44F3F
		pop	cx
		mov	[bp+arg_2], ax
		or	ax, ax
		jnz	short loc_2B85
		jmp	loc_2AEE

loc_2B85:
		or	word ptr [si+2], 4
		jmp	short loc_2B8E
		jmp	loc_2AEE

loc_2B8E:
		mov	ax, [bp+arg_2]
		mov	[si+0Ah], ax
		mov	[si+8], ax
		mov	[si+6], di
		cmp	[bp+arg_4], 1
		jnz	short loc_2BA4
		or	word ptr [si+2], 8

loc_2BA4:
		xor	ax, ax

loc_2BA6:
		pop	di
		pop	si
		pop	bp
		retf
Stdio_SetupFileStruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BAA		proc far

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
sub_2BAA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Msg_Sprintf1 (sub_2CEF de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE :
; même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à CRT_Msg_Sprintf1 (sub_25DE de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; CRT_Msg_Sprintf1 (sub_2945 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — wrapper sprintf (sub_1233) avec format fixe 291Dh :
; génère un message formaté standard (probable message d'erreur runtime).
; ==============================================================================================
CRT_Msg_Sprintf1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx], 0
		mov	ax, 2BAAh
		push	ax
		lea	ax, [bp+arg_0]
		push	ax
		push	[bp+arg_2]
		lea	ax, [bp+arg_4]
		push	ax
		call	sub_1138
		pop	bp
		retf
CRT_Msg_Sprintf1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Msg_Sprintf2 (sub_2D0C de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE :
; même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à CRT_Msg_Sprintf2 (sub_25FB de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; CRT_Msg_Sprintf2 (sub_2962 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — variante de sub_2945, arguments passés différemment
; (sprintf format 291Dh) : sibling wrapper de génération de message.
; ==============================================================================================
CRT_Msg_Sprintf2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx], 0
		mov	ax, 2BAAh
		push	ax
		lea	ax, [bp+arg_0]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_4]
		call	sub_1138
		pop	bp
		retf
CRT_Msg_Sprintf2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Strcat (sub_2D8E
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
		jz	short loc_2C38
		movsb
		dec	cx

loc_2C38:
		shr	cx, 1
		rep movsw
		jnb	short loc_2C3F
		movsb

loc_2C3F:
		xchg	dx, ax
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strcat		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Strchr_WordAligned
; (sub_2DC7 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; CRT_Strchr_WordAligned (sub_2650 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à CRT_Strchr_WordAligned (sub_2A1D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — recherche d'un caractère dans une chaîne
; avec alignement pair/impair (lodsb/lodsw) : strchr() optimisé mot.
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
		jz	short loc_2C5E
		lodsb
		cmp	al, bl
		jz	short loc_2C73
		and	al, al
		jz	short loc_2C6F

loc_2C5E:
		lodsw
		cmp	al, bl
		jz	short loc_2C74
		and	al, al
		jz	short loc_2C6F
		cmp	ah, bl
		jz	short loc_2C73
		and	ah, ah
		jnz	short loc_2C5E

loc_2C6F:
		xor	ax, ax
		jmp	short loc_2C77

loc_2C73:
		inc	si

loc_2C74:
		lea	ax, [si-2]

loc_2C77:
		pop	si
		pop	bp
		retf
CRT_Strchr_WordAligned		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Strncmp_Like
; (sub_2DFD de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Strncmp_Like
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
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Strcpy (sub_2E2C
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Strdup (sub_2E4E
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
		call	sub_44F3F
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2CFB
		push	[bp+var_2]
		push	si
		push	ax
		nop
		push	cs
		call	near ptr CRT_Memmove
		add	sp, 6

loc_2CFB:
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
; far, stricmp de Borland : compare deux chaînes du segment de données sans tenir compte de la
; casse (a..z ramenés à A..Z), rend la différence du premier caractère différent.
; ==============================================================================================
CRT_StrICmp_2D03		proc far

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

loc_2D1A:
		lodsb
		mov	bl, [di]
		or	al, al
		jz	short loc_2D3D
		scasb
		jz	short loc_2D1A
		cmp	al, ch
		jb	short loc_2D2E
		cmp	al, cl
		ja	short loc_2D2E
		sub	al, 20h

loc_2D2E:
		cmp	bl, ch
		jb	short loc_2D39
		cmp	bl, cl
		ja	short loc_2D39
		sub	bl, 20h

loc_2D39:
		cmp	al, bl
		jz	short loc_2D1A

loc_2D3D:
		sub	ax, bx
		pop	di
		pop	si
		pop	bp
		retf
CRT_StrICmp_2D03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Strlen (sub_2EC6
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Strupr_2EE0
; (sub_2EE0 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s)
; (adresses de données ou constantes) — à vérifier à CRT_Strupr (sub_2B99 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — met en
; majuscule en place (soustrait 0x20 sur plage a-z) : strupr().
; ==============================================================================================
CRT_Strupr_2D5D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		cld
		mov	si, [bp+arg_0]
		mov	dx, si
		jmp	short loc_2D74

loc_2D69:
		sub	al, 41h
		cmp	al, 19h
		ja	short loc_2D74
		add	al, 61h
		mov	[si-1], al

loc_2D74:
		lodsb
		and	al, al
		jnz	short loc_2D69
		xchg	dx, ax
		pop	si
		pop	bp
		retf
CRT_Strupr_2D5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D7D		proc far

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
		jbe	short loc_2DA5
		mov	si, [bp+arg_4]

loc_2DA5:
		push	si
		mov	ax, di
		add	ax, [bp+var_2]
		push	ax
		push	[bp+arg_2]
		nop
		push	cs
		call	near ptr sub_274F
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
sub_2D7D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_Strncpy_Pad
; (sub_2F81 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s)
; (adresses de données ou constantes) — à vérifier à CRT_Strncpy_Pad (sub_280A de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à CRT_Strncpy_Pad (sub_2B6D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far —
; copie bornée avec padding (strlen source, rep movsb puis rep stosb pour compléter) :
; strncpy() avec remplissage.
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

sub_2DF3		proc far

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

loc_2E0B:
		jcxz	short loc_2E30
		lodsb
		mov	bl, [di]
		or	al, al
		jz	short loc_2E30
		scasb
		loope	short loc_2E0B
		cmp	al, dh
		jb	short loc_2E21
		cmp	al, dl
		ja	short loc_2E21
		sub	al, 20h

loc_2E21:
		cmp	bl, dh
		jb	short loc_2E2C
		cmp	bl, dl
		ja	short loc_2E2C
		sub	bl, 20h

loc_2E2C:
		cmp	al, bl
		jz	short loc_2E0B

loc_2E30:
		sub	ax, bx
		pop	di
		pop	si
		pop	bp
		retf
sub_2DF3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E36		proc far

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
		jnz	short loc_2E4F
		mov	ax, 0FFFFh
		jmp	short loc_2E51

loc_2E4F:
		mov	ax, dx

loc_2E51:
		pop	si
		pop	bp
		ret
sub_2E36		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E54		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		dec	word ptr [si]
		pop	si
		pop	bp
		ret
sub_2E54		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E60		proc far

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
		mov	word_59E41, 0
		jmp	short loc_2E7E

loc_2E78:
		inc	[bp+arg_0]
		inc	[bp+var_2]

loc_2E7E:
		mov	bx, [bp+arg_0]
		mov	al, [bx]
		cbw
		mov	bx, ax
		mov	al, [bx+4CFBh]
		cbw
		test	ax, 1
		jnz	short loc_2E78
		mov	bx, [bp+arg_0]
		cmp	byte ptr [bx], 2Dh
		jnz	short loc_2E9D
		mov	ax, 1
		jmp	short loc_2E9F

loc_2E9D:
		xor	ax, ax

loc_2E9F:
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
		mov	ax, 2E54h
		push	ax
		mov	ax, 2E36h
		push	ax
		call	sub_7F2
		add	sp, 0Eh
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		cmp	[bp+var_4], 0
		jg	short loc_2ED6
		mov	ax, [bp+var_2]
		sub	[bp+arg_0], ax
		jmp	short loc_2F20

loc_2ED6:
		cmp	[bp+var_4], 2
		jnz	short loc_2EE4
		mov	word_59E41, 22h
		jmp	short loc_2F20

loc_2EE4:
		cmp	[bp+var_4], 1
		jnz	short loc_2F20
		cmp	[bp+var_6], 0
		jl	short loc_2EFD
		jnz	short loc_2EF8
		cmp	[bp+var_8], 0
		jb	short loc_2EFD

loc_2EF8:
		mov	ax, 1
		jmp	short loc_2EFF

loc_2EFD:
		xor	ax, ax

loc_2EFF:
		cmp	ax, di
		jnz	short loc_2F20
		mov	word_59E41, 22h
		or	di, di
		jz	short loc_2F14
		mov	dx, 8000h
		xor	ax, ax
		jmp	short loc_2F1A

loc_2F14:
		mov	dx, 7FFFh
		mov	ax, 0FFFFh

loc_2F1A:
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax

loc_2F20:
		or	si, si
		jz	short loc_2F29
		mov	ax, [bp+arg_0]
		mov	[si], ax

loc_2F29:
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_2E60		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, strupr : met la chaîne en majuscules sur place (a..z seulement).
; ==============================================================================================
CRT_StrUpr_2F35		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		cld
		mov	si, [bp+arg_0]
		mov	dx, si
		jmp	short loc_2F4C

loc_2F41:
		sub	al, 61h
		cmp	al, 19h
		ja	short loc_2F4C
		add	al, 41h
		mov	[si-1], al

loc_2F4C:
		lodsb
		and	al, al
		jnz	short loc_2F41
		xchg	dx, ax
		pop	si
		pop	bp
		retf
CRT_StrUpr_2F35		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F55		proc far

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
		call	near ptr sub_323E
		mov	ax, word_5EDF0
		mov	dx, word_5EDEE
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
		call	sub_763
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
		call	sub_763
		add	[bp+var_4], ax
		adc	[bp+var_2], dx
		test	si, 3
		jz	short loc_2FC1
		add	[bp+var_4], 5180h
		adc	[bp+var_2], 1

loc_2FC1:
		xor	cx, cx
		mov	al, [di+3]
		cbw
		dec	ax
		mov	si, ax
		jmp	short loc_2FD4

loc_2FCC:
		dec	si
		mov	al, [si+50A4h]
		cbw
		add	cx, ax

loc_2FD4:
		or	si, si
		jg	short loc_2FCC
		mov	al, [di+2]
		cbw
		dec	ax
		add	cx, ax
		cmp	byte ptr [di+3], 2
		jle	short loc_2FEC
		test	word ptr [di], 3
		jnz	short loc_2FEC
		inc	cx

loc_2FEC:
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
		cmp	word_5EDF2, 0
		jz	short loc_3020
		mov	al, [bx+1]
		mov	ah, 0
		push	ax
		push	cx
		xor	ax, ax
		push	ax
		mov	ax, [di]
		add	ax, 0F84Eh
		push	ax
		call	sub_33BF
		or	ax, ax
		jz	short loc_3020
		dec	si

loc_3020:
		mov	ax, si
		cwd
		push	ax
		push	dx
		xor	dx, dx
		mov	ax, 0E10h
		pop	cx
		pop	bx
		call	sub_763
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
		call	sub_763
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
sub_2F55		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_306E		proc far

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
		call	near ptr sub_323E
		mov	ax, word_5EDF0
		mov	dx, word_5EDEE
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
		call	near ptr sub_4C6
		mov	[di+3], al
		xor	ax, ax
		mov	dx, 3Ch
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_4B7
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		xor	ax, ax
		mov	dx, 3Ch
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_4C6
		mov	[di], al
		xor	ax, ax
		mov	dx, 3Ch
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_4B7
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		xor	ax, ax
		mov	dx, 88F8h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_4B7
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
		call	near ptr sub_4C6
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		cmp	[bp+arg_2], 0
		jl	short loc_3158
		jnz	short loc_3125
		cmp	[bp+arg_0], 2250h
		jb	short loc_3158

loc_3125:
		sub	[bp+arg_0], 2250h
		sbb	[bp+arg_2], 0
		inc	word ptr [si]
		xor	ax, ax
		mov	dx, 2238h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_4B7
		add	[si], ax
		xor	ax, ax
		mov	dx, 2238h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_4C6
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax

loc_3158:
		cmp	word_5EDF2, 0
		jz	short loc_3199
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_4C6
		push	ax
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_4B7
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, [si]
		add	ax, 0F84Eh
		push	ax
		call	sub_33BF
		or	ax, ax
		jz	short loc_3199
		add	[bp+arg_0], 1
		adc	[bp+arg_2], 0

loc_3199:
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_4C6
		mov	[di+1], al
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_4B7
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		add	[bp+arg_0], 1
		adc	[bp+arg_2], 0
		test	word ptr [si], 3
		jnz	short loc_31FE
		cmp	[bp+arg_2], 0
		jl	short loc_31E8
		jg	short loc_31DE
		cmp	[bp+arg_0], 3Ch
		jbe	short loc_31E8

loc_31DE:
		sub	[bp+arg_0], 1
		sbb	[bp+arg_2], 0
		jmp	short loc_31FE

loc_31E8:
		cmp	[bp+arg_2], 0
		jnz	short loc_31FE
		cmp	[bp+arg_0], 3Ch
		jnz	short loc_31FE
		mov	byte ptr [si+3], 2
		mov	byte ptr [si+2], 1Dh
		jmp	short loc_323A

loc_31FE:
		mov	byte ptr [si+3], 0
		jmp	short loc_3219

loc_3204:
		mov	al, [si+3]
		cbw
		mov	bx, ax
		mov	al, [bx+50A4h]
		cbw
		cwd
		sub	[bp+arg_0], ax
		sbb	[bp+arg_2], dx
		inc	byte ptr [si+3]

loc_3219:
		mov	al, [si+3]
		cbw
		mov	bx, ax
		mov	al, [bx+50A4h]
		cbw
		cwd
		cmp	dx, [bp+arg_2]
		jl	short loc_3204
		jnz	short loc_3231
		cmp	ax, [bp+arg_0]
		jb	short loc_3204

loc_3231:
		inc	byte ptr [si+3]
		mov	al, byte ptr [bp+arg_0]
		mov	[si+2], al

loc_323A:
		pop	di
		pop	si
		pop	bp
		retf
sub_306E		endp

; ----------------------------------------------------------------------

sub_323E		proc far
		push	si
		push	di
		mov	ax, 50D4h
		push	ax
		nop
		push	cs
		call	near ptr sub_2629
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_32C4
		push	ax
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		cmp	ax, 4
		jb	short loc_32C4
		mov	al, [di]
		cbw
		mov	bx, ax
		mov	al, [bx+4CFBh]
		cbw
		test	ax, 0Ch
		jz	short loc_32C4
		mov	al, [di+1]
		cbw
		mov	bx, ax
		mov	al, [bx+4CFBh]
		cbw
		test	ax, 0Ch
		jz	short loc_32C4
		mov	al, [di+2]
		cbw
		mov	bx, ax
		mov	al, [bx+4CFBh]
		cbw
		test	ax, 0Ch
		jz	short loc_32C4
		cmp	byte ptr [di+3], 2Dh
		jz	short loc_32A4
		cmp	byte ptr [di+3], 2Bh
		jz	short loc_32A4
		mov	al, [di+3]
		cbw
		mov	bx, ax
		test	byte ptr [bx+4CFBh], 2
		jz	short loc_32C4

loc_32A4:
		mov	al, [di+3]
		cbw
		mov	bx, ax
		mov	al, [bx+4CFBh]
		cbw
		test	ax, 2
		jnz	short loc_32F7
		mov	al, [di+4]
		cbw
		mov	bx, ax
		mov	al, [bx+4CFBh]
		cbw
		test	ax, 2
		jnz	short loc_32F7

loc_32C4:
		mov	word_5EDF2, 1
		mov	word_5EDF0, 0
		mov	word_5EDEE, 4650h
		mov	ax, 50D7h
		push	ax
		push	word_5EDEA
		nop
		push	cs
		call	near ptr CRT_Strcpy
		pop	cx
		pop	cx
		mov	ax, 50DBh
		push	ax
		push	word_5EDEC
		nop
		push	cs
		call	near ptr CRT_Strcpy
		pop	cx
		pop	cx
		jmp	loc_33BC

loc_32F7:
		mov	ax, 4
		push	ax
		xor	ax, ax
		push	ax
		push	word_5EDEC
		nop
		push	cs
		call	near ptr CRT_Memset_Public
		add	sp, 6
		mov	ax, 3
		push	ax
		push	di
		push	word_5EDEA
		nop
		push	cs
		call	near ptr CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, word_5EDEA
		mov	byte ptr [bx+3], 0
		mov	ax, di
		add	ax, 3
		push	ax
		nop
		push	cs
		call	near ptr sub_22B1
		pop	cx
		push	ax
		push	dx
		xor	dx, dx
		mov	ax, 0E10h
		pop	cx
		pop	bx
		call	sub_763
		mov	word_5EDF0, dx
		mov	word_5EDEE, ax
		mov	word_5EDF2, 0
		mov	si, 3
		jmp	short loc_33B5

loc_334D:
		mov	bx, si
		mov	al, [bx+di]
		cbw
		mov	bx, ax
		test	byte ptr [bx+4CFBh], 0Ch
		jz	short loc_33B4
		mov	ax, di
		add	ax, si
		push	ax
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		cmp	ax, 3
		jb	short loc_33BC
		mov	bx, di
		mov	al, [bx+si+1]
		cbw
		mov	bx, ax
		mov	al, [bx+4CFBh]
		cbw
		test	ax, 0Ch
		jz	short loc_33BC
		mov	bx, di
		mov	al, [bx+si+2]
		cbw
		mov	bx, ax
		mov	al, [bx+4CFBh]
		cbw
		test	ax, 0Ch
		jz	short loc_33BC
		mov	ax, 3
		push	ax
		mov	ax, di
		add	ax, si
		push	ax
		push	word_5EDEC
		nop
		push	cs
		call	near ptr CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, word_5EDEC
		mov	byte ptr [bx+3], 0
		mov	word_5EDF2, 1
		jmp	short loc_33BC

loc_33B4:
		inc	si

loc_33B5:
		mov	bx, si
		cmp	byte ptr [bx+di], 0
		jnz	short loc_334D

loc_33BC:
		pop	di
		pop	si
		retf
sub_323E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33BF		proc near

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		cmp	[bp+arg_2], 0
		jnz	short loc_33F5
		mov	si, [bp+arg_4]
		cmp	[bp+arg_4], 3Bh
		jb	short loc_33DE
		mov	ax, [bp+arg_0]
		add	ax, 46h
		test	ax, 3
		jnz	short loc_33DE
		dec	si

loc_33DE:
		mov	[bp+arg_2], 0
		jmp	short loc_33E8

loc_33E5:
		inc	[bp+arg_2]

loc_33E8:
		mov	bx, [bp+arg_2]
		shl	bx, 1
		cmp	[bx+50B0h], si
		jbe	short loc_33E5
		jmp	short loc_3416

loc_33F5:
		mov	bx, [bp+arg_2]
		dec	bx
		shl	bx, 1
		mov	ax, [bx+50B0h]
		add	[bp+arg_4], ax
		cmp	[bp+arg_2], 3
		jbe	short loc_3416
		mov	ax, [bp+arg_0]
		add	ax, 46h
		test	ax, 3
		jnz	short loc_3416
		inc	[bp+arg_4]

loc_3416:
		cmp	[bp+arg_2], 4
		jb	short loc_3497
		jz	short loc_3426
		cmp	[bp+arg_2], 0Ah
		ja	short loc_3497
		jnz	short loc_3492

loc_3426:
		mov	bx, [bp+arg_2]
		shl	bx, 1
		cmp	[bp+arg_0], 10h
		jle	short loc_3440
		cmp	[bp+arg_2], 4
		jnz	short loc_3440
		mov	cx, [bx+50AEh]
		add	cx, 7
		jmp	short loc_3444

loc_3440:
		mov	cx, [bx+50B0h]

loc_3444:
		mov	bx, [bp+arg_0]
		add	bx, 7B2h
		test	bl, 3
		jz	short loc_3451
		dec	cx

loc_3451:
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
		jnz	short loc_3486
		cmp	ax, cx
		ja	short loc_3492
		jnz	short loc_3497
		cmp	[bp+arg_6], 2
		jb	short loc_3497
		jmp	short loc_3492

loc_3486:
		cmp	ax, cx
		jb	short loc_3492
		jnz	short loc_3497
		cmp	[bp+arg_6], 1
		ja	short loc_3497

loc_3492:
		mov	ax, 1
		jmp	short loc_3499

loc_3497:
		xor	ax, ax

loc_3499:
		pop	si
		pop	bp
		ret	8
sub_33BF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_WriteLowLevel (sub_3658 de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE :
; même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Stdio_WriteLowLevel (sub_2DE2 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 3 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Stdio_WriteLowLevel (sub_2BB9 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — 166 lignes, écriture bas niveau DOS d'un buffer (utilisée
; par sub_1F99/sub_232C) : implémentation write() de bas niveau du runtime stdio.
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
		cmp	di, word_5EC68
		jb	short loc_34BD
		mov	ax, 6
		push	ax
		call	sub_565
		jmp	loc_35A6

loc_34BD:
		mov	ax, [bp+arg_4]
		inc	ax
		cmp	ax, 2
		jnb	short loc_34CB
		xor	ax, ax
		jmp	loc_35A6

loc_34CB:
		mov	bx, di
		shl	bx, 1
		test	word ptr [bx+4F4Ah], 800h
		jz	short loc_34EA
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

loc_34EA:
		mov	bx, di
		shl	bx, 1
		test	word ptr [bx+4F4Ah], 4000h
		jnz	short loc_3506
		push	[bp+arg_4]
		push	si
		push	di
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		jmp	loc_35A6

loc_3506:
		mov	bx, di
		shl	bx, 1
		and	word ptr [bx+4F4Ah], 0FDFFh
		mov	[bp+var_6], si
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		jmp	short loc_356A

loc_351B:
		dec	[bp+var_2]
		mov	bx, [bp+var_6]
		inc	[bp+var_6]
		mov	al, [bx]
		mov	[bp+var_3], al
		cmp	al, 0Ah
		jnz	short loc_3531
		mov	byte ptr [si], 0Dh
		inc	si

loc_3531:
		mov	al, [bp+var_3]
		mov	[si], al
		inc	si
		lea	ax, [bp+var_88]
		mov	dx, si
		sub	dx, ax
		cmp	dx, 80h
		jl	short loc_356E
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
		jz	short loc_356A
		cmp	dx, 0FFFFh
		jnz	short loc_3562

loc_355D:
		mov	ax, 0FFFFh
		jmp	short loc_35A1

loc_3562:
		mov	ax, [bp+arg_4]
		sub	ax, [bp+var_2]
		jmp	short loc_359D

loc_356A:
		lea	si, [bp+var_88]

loc_356E:
		cmp	[bp+var_2], 0
		jnz	short loc_351B
		lea	ax, [bp+var_88]
		sub	si, ax
		mov	ax, si
		or	ax, ax
		jbe	short loc_35A3
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
		jz	short loc_35A3
		cmp	dx, 0FFFFh
		jz	short loc_355D
		mov	ax, [bp+arg_4]

loc_359D:
		add	ax, dx
		sub	ax, si

loc_35A1:
		jmp	short loc_35A6

loc_35A3:
		mov	ax, [bp+arg_4]

loc_35A6:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
Stdio_WriteLowLevel		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Stdio_ErrorHandler (sub_3766 de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE :
; même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Stdio_ErrorHandler (sub_2EF0 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 2 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Stdio_ErrorHandler (sub_2CC7 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far — 44 lignes, gestion d'erreur de stream avec messages fixes
; (4D7Ch/5EA8h) : probable handler d'erreur matherr/ferror.
; ==============================================================================================
Stdio_ErrorHandler		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		shl	bx, 1
		test	word ptr [bx+4F4Ah], 1
		jz	short loc_35C2
		mov	ax, 5
		push	ax
		jmp	short loc_35E1

loc_35C2:
		mov	ah, 40h
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_2]
		int	21h
		jb	short loc_35E0
		push	ax
		mov	bx, [bp+arg_0]
		shl	bx, 1
		or	word ptr [bx+4F4Ah], 1000h
		pop	ax
		jmp	short loc_35E4

loc_35E0:
		push	ax

loc_35E1:
		call	sub_565

loc_35E4:
		pop	bp
		retf
Stdio_ErrorHandler		endp

; START OF FUNCTION CHUNK FOR Stdio_ErrorHandler
		push	si
		push	di
		mov	di, 4
		mov	si, 4E08h
		jmp	short loc_3602

loc_35F0:
		test	word ptr [si+2], 3
		jz	short loc_35FE
		push	si
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx

loc_35FE:
		dec	di
		add	si, 10h

loc_3602:
		or	di, di
		jnz	short loc_35F0
		pop	di
		pop	si
		retf
; END OF FUNCTION CHUNK FOR Stdio_ErrorHandler

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3609		proc far

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
		jnb	short loc_3621
		movsb

loc_3621:
		mov	ds, dx
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
sub_3609		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_362D		proc far

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
		jz	short loc_3647
		jcxz	short loc_364E
		stosb
		dec	cx

loc_3647:
		shr	cx, 1
		rep stosw
		jnb	short loc_364E
		stosb

loc_364E:
		pop	di
		pop	bp
		retf
sub_362D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3651		proc far

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
		call	near ptr sub_362D
		add	sp, 8
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3651		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_MemFamily_Extra2
; (sub_382A de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s)
; (adresses de données ou constantes) — à vérifier à CRT_MemFamily_Extra2 (sub_2F71 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à CRT_MemFamily_Extra2 (sub_2D48
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far
; — (cluster mémoire/chaînes, à approfondir si besoin).
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
		jz	short loc_36A0
		movsb
		dec	cx

loc_36A0:
		shr	cx, 1
		rep movsw
		jnb	short loc_36A7
		movsb

loc_36A7:
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
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_MemFamily_Extra3
; (sub_3869 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; CRT_MemFamily_Extra3 (sub_2FB0 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à CRT_MemFamily_Extra3 (sub_2D87 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — (cluster mémoire/chaînes, à approfondir si
; besoin).
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
		jz	short loc_36CA
		lodsb
		cmp	al, bl
		jz	short loc_36E2
		and	al, al
		jz	short loc_36DB

loc_36CA:
		lodsw
		cmp	al, bl
		jz	short loc_36E3
		and	al, al
		jz	short loc_36DB
		cmp	ah, bl
		jz	short loc_36E2
		and	ah, ah
		jnz	short loc_36CA

loc_36DB:
		pop	ds
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_36E9

loc_36E2:
		inc	si

loc_36E3:
		lea	ax, [si-2]
		mov	dx, ds
		pop	ds

loc_36E9:
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36EC		proc far

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
sub_36EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3715		proc far

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

loc_372A:
		lodsb
		mov	bl, es:[di]
		or	al, al
		jz	short loc_374E
		scasb
		jz	short loc_372A
		cmp	al, ch
		jb	short loc_373F
		cmp	al, cl
		ja	short loc_373F
		sub	al, 20h

loc_373F:
		cmp	bl, ch
		jb	short loc_374A
		cmp	bl, cl
		ja	short loc_374A
		sub	bl, 20h

loc_374A:
		cmp	al, bl
		jz	short loc_372A

loc_374E:
		sub	ax, bx
		mov	ds, dx
		pop	di
		pop	si
		pop	bp
		retf
sub_3715		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3756		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	di
		les	di, [bp+arg_0]
		xor	ax, ax
		cmp	ax, [bp+arg_2]
		jnz	short loc_3768
		cmp	ax, di
		jz	short loc_3772

loc_3768:
		cld
		mov	cx, 0FFFFh
		repne scasb
		xchg	cx, ax
		not	ax
		dec	ax

loc_3772:
		pop	di
		pop	bp
		retf
sub_3756		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à CRT_MemFamily_Extra7
; (sub_39A9 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier
; ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; CRT_MemFamily_Extra7 (sub_3035 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à CRT_MemFamily_Extra7 (sub_2E3C de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far — (cluster mémoire/chaînes, à approfondir si
; besoin).
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
		jcxz	short loc_37A7
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

loc_37A7:
		mov	ds, dx
		pop	di
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37AD		proc far

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
sub_37AD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37DE		proc far

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

loc_37F5:
		jcxz	short loc_381B
		lodsb
		mov	bl, es:[di]
		or	al, al
		jz	short loc_381B
		scasb
		loope	short loc_37F5
		cmp	al, dh
		jb	short loc_380C
		cmp	al, dl
		ja	short loc_380C
		sub	al, 20h

loc_380C:
		cmp	bl, dh
		jb	short loc_3817
		cmp	bl, dl
		ja	short loc_3817
		sub	bl, 20h

loc_3817:
		cmp	al, bl
		jz	short loc_37F5

loc_381B:
		sub	ax, bx
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_37DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Strlen_Far (sub_2EA5 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — boucle lodsb jusqu'à octet
; nul, restaure ds : strlen far / recherche fin de chaîne avec segment.
; ==============================================================================================
CRT_Strlen_Far		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		cld
		push	ds
		lds	si, [bp+arg_0]
		mov	dx, si
		jmp	short loc_383A

loc_382F:
		sub	al, 61h
		cmp	al, 19h
		ja	short loc_383A
		add	al, 41h
		mov	[si-1], al

loc_383A:
		lodsb
		and	al, al
		jnz	short loc_382F
		xchg	dx, ax
		mov	dx, ds
		pop	ds
		pop	si
		pop	bp
		retf
CRT_Strlen_Far		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3846		proc far

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
saved_0		= byte ptr  0
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
		jz	short loc_387F
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	ax, word ptr [bp+var_8]
		or	ax, word ptr [bp+var_8+2]
		jnz	short loc_3897
		jmp	short loc_3892

loc_387F:
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_3897

loc_3892:
		mov	[bp+var_A], 0

loc_3897:
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_38A2
		jmp	loc_399A

loc_38A2:
		mov	[bp+var_10], 0
		test	di, 10h
		jz	short loc_38B2
		mov	[bp+var_10], 4

loc_38B2:
		test	di, 40h
		jnz	short loc_38BB
		jmp	loc_393B

loc_38BB:
		add	[bp+var_10], 2
		mov	bx, [bp+arg_4]
		xor	cx, cx
		mov	dx, [bp+arg_8]
		mov	ax, [bp+arg_6]
		call	sub_763
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
		jnz	short loc_38F4

loc_38ED:
		xor	dx, dx
		xor	ax, ax
		jmp	loc_3A92

loc_38F4:
		xor	ax, ax
		push	ax
		push	[bp+arg_4]
		mov	ax, 1
		xor	dx, dx
		push	ax
		push	dx
		call	near ptr sub_4C6
		mov	[bp+var_12], ax
		mov	ax, [bp+arg_0]
		mov	[bp+var_E], ax
		jmp	short loc_3915

loc_390F:
		mov	ax, [bp+arg_4]
		add	[bp+var_12], ax

loc_3915:
		mov	ax, [bp+var_10]
		add	ax, [bp+var_E]
		cmp	ax, [bp+var_12]
		ja	short loc_390F
		mov	ax, [bp+var_12]
		sub	ax, [bp+var_E]
		sub	ax, [bp+var_10]
		add	[bp+arg_0], ax
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_E]
		mov	es:[bx], ax
		add	[bp+arg_0], 2
		jmp	short loc_3980

loc_393B:
		mov	bx, [bp+arg_4]
		xor	cx, cx
		mov	dx, [bp+arg_8]
		mov	ax, [bp+arg_6]
		call	sub_763
		add	ax, [bp+var_10]
		adc	dx, 0
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		cmp	[bp+var_14], 0
		jb	short loc_3965
		ja	short loc_38ED
		cmp	[bp+var_16], 0FFFFh
		jbe	short loc_3965
		jmp	short loc_38ED

loc_3965:
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
		jnz	short loc_3980
		jmp	loc_38ED

loc_3980:
		test	di, 10h
		jz	short loc_399A
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_8]
		mov	dx, [bp+arg_6]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		add	[bp+arg_0], 4

loc_399A:
		and	di, 1A7h
		test	di, 80h
		jz	short loc_39A8
		and	di, 0FEFFh

loc_39A8:
		cmp	[bp+var_A], 0
		jnz	short loc_39B1
		jmp	loc_3A8C

loc_39B1:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		jmp	loc_3A6E

loc_39C0:
		mov	[bp+var_C], di
		mov	cx, 10h
		mov	bx, 3A98h

loc_39C9:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_C]
		jz	short loc_39D8
		add	bx, 2
		loop	short loc_39C9
		jmp	short loc_3A56

loc_39D8:
		jmp	word ptr cs:[bx+20h]
		push	[bp+var_E]
		push	[bp+var_10]
		call	word ptr [bp+var_4]

loc_39E5:
		pop	cx
		pop	cx
		jmp	short loc_3A5B
		push	[bp+var_E]
		push	[bp+var_10]
		call	dword ptr [bp+var_8]
		jmp	short loc_39E5

loc_39F4:
		push	[bp+var_E]
		push	[bp+var_10]
		call	word ptr [bp+var_4]
		jmp	short loc_3A0C
		jmp	short loc_3A03
		jmp	short loc_39F4

loc_3A03:
		push	[bp+var_E]
		push	[bp+var_10]
		call	dword ptr [bp+var_8]

loc_3A0C:
		jmp	short loc_3A5B
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	word ptr [bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_3A5B
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	dword ptr [bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_3A5B
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	word ptr [bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_3A5B
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	dword ptr [bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_3A5B
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	word ptr [bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_3A5B
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	dword ptr [bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_3A5B

loc_3A56:
		nop
		push	cs
		call	sub_2AF

loc_3A5B:
		mov	ax, [bp+arg_4]
		xor	dx, dx
		add	[bp+var_10], ax
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	[bp+var_E], dx

loc_3A6E:
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_8]
		sub	[bp+arg_6], 1
		sbb	[bp+arg_8], 0
		or	dx, dx
		jbe	short loc_3A83
		jmp	loc_39C0

loc_3A83:
		jnz	short loc_3A8C
		or	ax, ax
		jbe	short loc_3A8C
		jmp	loc_39C0

loc_3A8C:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]

loc_3A92:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_3846		endp

; START OF FUNCTION CHUNK FOR sub_3846
		db 4, 0, 5, 0, 6, 0, 7, 0, 24h, 0, 25h, 0, 84h, 0, 85h, 0
		db 86h, 0, 87h, 0, 0A4h, 0, 0A5h, 0, 6, 1, 7, 1, 24h, 1, 25h, 1
		db 0DCh, 39h, 0E9h, 39h, 0F4h, 39h, 0FFh, 39h, 1, 3Ah, 3, 3Ah, 0Eh, 3Ah, 1Ah, 3Ah
		db 26h, 3Ah
		xor	bh, [bp+si+saved_0]
		cmp	cl, ds:[bp+si+3Ah]
; END OF FUNCTION CHUNK FOR sub_3846
seg000		ends
