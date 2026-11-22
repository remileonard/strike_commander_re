seg000		segment	para public 'CODE' use16
		assume cs:seg000
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

		public start
start		proc near
		mov	dx, seg dseg
		mov	cs:32Ch, dx
		mov	ah, 30h
		int	21h
		mov	bp, word_489E2
		mov	bx, word_48A0C
		mov	ds, dx
		mov	word_48B46, ax
		mov	word_48B44, es
		mov	word_48B40, bx
		mov	word_48B5C, bp
		mov	ax, 1209h
		mov	bx, 4143h
		int	15h
		mov	dx, 74h
		or	ax, ax
		jnz	short loc_4A
		cmp	bx, 1209h
		jnz	short loc_4A
		mov	dx, 97h
		mov	ax, 1209h
		mov	bx, 5645h
		int	15h
		cmp	ax, 436h
		jnb	short loc_5A

loc_4A:
		mov	ax, 3
		xor	bx, bx
		int	10h
		mov	ah, 9
		int	21h
		mov	ax, 4C01h
		int	21h

loc_5A:
		call	sub_218
		mov	ax, word_48B40
		mov	es, ax
		xor	ax, ax
		mov	bx, ax
		mov	di, ax
		mov	cx, 7FFFh
		cld

loc_6C:
		repne scasb
		jcxz	short loc_D1
		inc	bx
		cmp	es:[di], al
		jnz	short loc_6C
		or	ch, 80h
		neg	cx
		mov	word_48B3E, cx
		mov	cx, 1
		shl	bx, cl
		add	bx, 8
		and	bx, 0FFF8h
		mov	word_48B42, bx
		mov	dx, ds
		sub	bp, dx
		mov	di, word_48BA4
		cmp	di, 200h
		jnb	short loc_A3
		mov	di, 200h
		mov	word_48BA4, di

loc_A3:
		add	di, 6E94h
		jb	short loc_D1
		add	di, word_4E6D2
		jb	short loc_D1
		mov	cl, 4
		shr	di, cl
		inc	di
		cmp	bp, di
		jb	short loc_D1
		cmp	word_48BA4, 0
		jz	short loc_C6
		cmp	word_4E6D2, 0
		jnz	short loc_D4

loc_C6:
		mov	di, 1000h
		cmp	bp, di
		ja	short loc_D4
		mov	di, bp
		jmp	short loc_D4

loc_D1:
		jmp	sub_315

loc_D4:
		mov	bx, di
		add	bx, dx
		mov	word_48B54, bx
		mov	word_48B58, bx
		mov	ax, word_48B44
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
		mov	es, cs:32Ch
		mov	di, 6052h
		mov	cx, 6E94h
		sub	cx, di
		cld
		rep stosb
		cmp	word_4E6A8, 14h
		jbe	short loc_155
		cmp	byte ptr word_48B46, 3
		jb	short loc_155
		ja	short loc_11E
		cmp	byte_48B47, 1Eh
		jb	short loc_155

loc_11E:
		mov	ax, 5801h
		mov	bx, 2
		int	21h
		jb	short loc_152
		mov	ah, 67h
		mov	bx, word_4E6A8
		int	21h
		jb	short loc_152
		mov	ah, 48h
		mov	bx, 1
		int	21h
		jb	short loc_152
		inc	ax
		mov	word_48B5C, ax
		dec	ax
		mov	es, ax
		mov	ah, 49h
		int	21h
		jb	short loc_152
		mov	ax, 5801h
		mov	bx, 0
		int	21h
		jnb	short loc_155

loc_152:
		jmp	sub_315

loc_155:
		mov	ah, 0
		int	1Ah
		mov	word_48B4A, dx
		mov	word_48B4C, cx
		or	al, al
		jz	short loc_171
		mov	ax, 40h
		mov	es, ax
		mov	bx, 70h
		mov	byte ptr es:[bx], 1

loc_171:
		mov	ax, seg seg001
		mov	es, ax
		mov	bx, 3E5h
		mov	byte ptr es:[bx], 9Ah
		mov	word ptr es:[bx+1], 330h
		mov	es:[bx+3], cs
		mov	byte ptr es:[bx+5], 0C3h
		xor	bp, bp
		push	ds
		mov	ds, cs:32Ch
		call	sub_515B
		pop	ds
		mov	es, cs:32Ch
		mov	si, 5ED2h
		mov	di, 5FB0h
		call	sub_288
		push	word_48B3C
		push	word_48B3A
		push	word_48B38
		call	sub_5EA8
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
		mov	es, cs:32Ch
		push	si
		push	di
		mov	si, 5FB0h
		mov	di, 6052h
		call	sub_2CC
		pop	di
		pop	si
		retf
Ovl_CopyStubTable		endp

; ----------------------------------------------------------------------

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Ovl_ChecksumStub (sub_176 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far — checksum 16-bit sur
; 47 octets de la table overlay ; si ≠0D5Ch → erreur fatale via sub_2A5.
; ==============================================================================================
Ovl_ChecksumStub		proc far
		push	si
		push	di
		mov	es, cs:32Ch
		xor	ax, ax
		mov	si, ax
		mov	cx, 2Fh

loc_1E0:
		add	al, es:[si]
		adc	ah, 0
		inc	si
		loop	short loc_1E0
		sub	ax, 0D5Ch
		jz	short loc_1F7
		mov	cx, 19h
		mov	dx, 2Fh
		call	sub_30D

loc_1F7:
		pop	di
		pop	si
		retf
Ovl_ChecksumStub		endp

; ----------------------------------------------------------------------

sub_1FA		proc near
		mov	bp, sp
		push	ds
		mov	ds, cs:32Ch
		call	sub_5181
		pop	ds
		mov	ah, 4Ch
		mov	al, [bp+4]
		int	21h
		mov	cx, 0Eh
		mov	dx, 48h
		jmp	loc_31B
sub_1FA		endp

; ----------------------------------------------------------------------

sub_218		proc near
		push	ds
		mov	ax, 3500h
		int	21h
		mov	word_48B28, bx
		mov	word_48B2A, es
		mov	ax, 3504h
		int	21h
		mov	word_48B2C, bx
		mov	word_48B2E, es
		mov	ax, 3505h
		int	21h
		mov	word_48B30, bx
		mov	word_48B32, es
		mov	ax, 3506h
		int	21h
		mov	word_48B34, bx
		mov	word_48B36, es
		mov	ax, 2500h
		mov	dx, cs
		mov	ds, dx
		mov	dx, 20Fh
		int	21h
		pop	ds
		ret
sub_218		endp

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
		lds	dx, word_48B28
		int	21h
		pop	ds
		push	ds
		mov	ax, 2504h
		lds	dx, word_48B2C
		int	21h
		pop	ds
		push	ds
		mov	ax, 2505h
		lds	dx, word_48B30
		int	21h
		pop	ds
		push	ds
		mov	ax, 2506h
		lds	dx, word_48B34
		int	21h
		pop	ds
		retf
CRT_RestoreIntVectors		endp

; ----------------------------------------------------------------------

sub_288		proc near
		mov	ax, 100h
		mov	dx, di
		mov	bx, si

loc_28F:
		cmp	bx, di
		jz	short loc_2AC
		cmp	byte ptr es:[bx], 0FFh
		jz	short loc_2A7
		mov	cl, es:[bx+1]
		xor	ch, ch
		cmp	cx, ax
		jnb	short loc_2A7
		mov	ax, cx
		mov	dx, bx

loc_2A7:
		add	bx, 6
		jmp	short loc_28F

loc_2AC:
		cmp	dx, di
		jz	short loc_2CB
		mov	bx, dx
		cmp	byte ptr es:[bx], 0
		mov	byte ptr es:[bx], 0FFh
		push	es
		jz	short loc_2C4
		call	dword ptr es:[bx+2]
		pop	es
		jmp	short sub_288

loc_2C4:
		call	word ptr es:[bx+2]
		pop	es
		jmp	short sub_288

loc_2CB:
		ret
sub_288		endp

; ----------------------------------------------------------------------

sub_2CC		proc near
		mov	ah, 0
		mov	dx, di
		mov	bx, si

loc_2D2:
		cmp	bx, di
		jz	short loc_2ED
		cmp	byte ptr es:[bx], 0FFh
		jz	short loc_2E8
		cmp	es:[bx+1], ah
		jb	short loc_2E8
		mov	ah, es:[bx+1]
		mov	dx, bx

loc_2E8:
		add	bx, 6
		jmp	short loc_2D2

loc_2ED:
		cmp	dx, di
		jz	short loc_30C
		mov	bx, dx
		cmp	byte ptr es:[bx], 0
		mov	byte ptr es:[bx], 0FFh
		push	es
		jz	short loc_305
		call	dword ptr es:[bx+2]
		pop	es
		jmp	short sub_2CC

loc_305:
		call	word ptr es:[bx+2]
		pop	es
		jmp	short sub_2CC

loc_30C:
		ret
sub_2CC		endp

; ----------------------------------------------------------------------

sub_30D		proc near
		mov	ah, 40h
		mov	bx, 2
		int	21h
		ret
sub_30D		endp

; ----------------------------------------------------------------------

sub_315		proc far
		mov	cx, 1Eh
		mov	dx, 56h

loc_31B:
		mov	ds, cs:32Ch
		call	sub_30D
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
		push	word_48A98
		push	cx
		push	dx
		push	di
		push	si
		push	ax
		push	0
		sti
		push	seg dseg
		pop	ds
		call	sub_40A4
		pop	di
		pop	si
		sub	di, dx
		jnz	short loc_359
		sub	si, ax
		jz	short loc_35C

loc_359:
		popf
		stc
		pushf

loc_35C:
		popf
		pop	es
		pop	ds
		leave
		retf
sub_315		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Abs16_2CD (sub_2CD
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. Valeur absolue d'un entier 16 bits (or ax, ax / jge / neg ax).
; ==============================================================================================
CRT_Abs16_361		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		or	ax, ax
		jge	short loc_36D
		neg	ax

loc_36D:
		pop	bp
		retf
CRT_Abs16_361		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		cmp	word_4E458, 20h
		jnz	short loc_37E
		mov	ax, 1
		jmp	short loc_39A

loc_37E:
		mov	bx, word_4E458
		mov	cl, 2
		shl	bx, cl
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		mov	[bx+6E08h], ax
		mov	[bx+6E06h], dx
		inc	word_4E458
		xor	ax, ax

loc_39A:
		pop	bp
		retf
sub_36F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		call	sub_330E8
		pop	cx
		pop	bp
		retf
sub_39C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3AA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, ds
		cmp	[bp+arg_2], ax
		jnz	short loc_3BF
		push	[bp+arg_0]
		call	sub_330E8
		pop	cx
		jmp	short loc_3CC

loc_3BF:
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_339AF
		pop	cx
		pop	cx

loc_3CC:
		pop	bp
		retf
sub_3AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3CE		proc far

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
sub_3CE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3E1		proc far

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
sub_3E1		endp

; ----------------------------------------------------------------------

sub_3F8		proc far
		retf
sub_3F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3F9		proc near

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		or	si, si
		jnz	short loc_426
		jmp	short loc_416

loc_406:
		dec	word_4E458
		mov	bx, word_4E458
		mov	cl, 2
		shl	bx, cl
		call	dword ptr [bx+6E06h]

loc_416:
		cmp	word_4E458, 0
		jnz	short loc_406
		nop
		push	cs
		call	near ptr Ovl_CopyStubTable
		call	dword ptr dword_4E55C

loc_426:
		nop
		push	cs
		call	near ptr CRT_RestoreIntVectors
		nop
		push	cs
		call	near ptr Ovl_ChecksumStub
		cmp	[bp+arg_2], 0
		jnz	short loc_44B
		or	si, si
		jnz	short loc_442
		call	dword ptr dword_4E560
		call	dword ptr dword_4E564

loc_442:
		push	[bp+arg_0]
		nop
		push	cs
		call	sub_1FA
		pop	cx

loc_44B:
		pop	si
		pop	bp
		ret	6
sub_3F9		endp

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
		call	sub_3F9
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
		call	sub_3F9
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
		call	sub_3F9
		retf
		mov	ax, 1
		push	ax
		push	ax
		xor	ax, ax
		push	ax
		call	sub_3F9
		retf
; END OF FUNCTION CHUNK FOR CRT_Abort

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

sub_4A7		proc far

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
sub_4A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4BA		proc far

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
sub_4BA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4CD		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		lea	ax, [bp+var_2]
		push	ax
		nop
		push	cs
		call	near ptr sub_3CE
		pop	cx
		mov	ax, [bp+var_2]
		dec	ax
		mov	sp, bp
		pop	bp
		retf
sub_4CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4E5		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, [bp+arg_0]
		inc	ax
		push	ax
		nop
		push	cs
		call	near ptr sub_3E1
		pop	cx
		pop	cx
		mov	ax, [bp+var_2]
		mov	sp, bp
		pop	bp
		retf
sub_4E5		endp

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

sub_522		proc near
		pop	cx
		push	cs
		push	cx
		xor	cx, cx
		jmp	short loc_53F
sub_522		endp

; START OF FUNCTION CHUNK FOR sub_522
		pop	cx
		push	cs
		push	cx
		mov	cx, 1
		jmp	short loc_53F
; END OF FUNCTION CHUNK FOR sub_522

; ----------------------------------------------------------------------

sub_531		proc far
		pop	cx
		push	cs
		push	cx
		mov	cx, 2
		jmp	short loc_53F
		pop	cx
		push	cs
		push	cx
		mov	cx, 3

loc_53F:
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
		jnz	short loc_55E
		or	dx, dx
		jz	short loc_5C3
		or	bx, bx
		jz	short loc_5C3

loc_55E:
		test	di, 1
		jnz	short loc_580
		or	dx, dx
		jns	short loc_572
		neg	dx
		neg	ax
		sbb	dx, 0
		or	di, 0Ch

loc_572:
		or	cx, cx
		jns	short loc_580
		neg	cx
		neg	bx
		sbb	cx, 0
		xor	di, 4

loc_580:
		mov	bp, cx
		mov	cx, 20h
		push	di
		xor	di, di
		xor	si, si

loc_58A:
		shl	ax, 1
		rcl	dx, 1
		rcl	si, 1
		rcl	di, 1
		cmp	di, bp
		jb	short loc_5A1
		ja	short loc_59C
		cmp	si, bx
		jb	short loc_5A1

loc_59C:
		sub	si, bx
		sbb	di, bp
		inc	ax

loc_5A1:
		loop	short loc_58A
		pop	bx
		test	bx, 2
		jz	short loc_5B0
		mov	ax, si
		mov	dx, di
		shr	bx, 1

loc_5B0:
		test	bx, 4
		jz	short loc_5BD
		neg	dx
		neg	ax
		sbb	dx, 0

loc_5BD:
		pop	di
		pop	si
		pop	bp
		retf	8

loc_5C3:
		div	bx
		test	di, 2
		jz	short loc_5CC
		xchg	dx, ax

loc_5CC:
		xor	dx, dx
		jmp	short loc_5BD
sub_531		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5D0		proc near

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jl	short loc_5F0
		cmp	si, 58h
		jle	short loc_5E3

loc_5E0:
		mov	si, 57h

loc_5E3:
		mov	word_4E6D4, si
		mov	al, [si+5CF6h]
		cbw
		mov	si, ax
		jmp	short loc_5FD

loc_5F0:
		neg	si
		cmp	si, 30h
		jg	short loc_5E0
		mov	word_4E6D4, 0FFFFh

loc_5FD:
		mov	word_48B48, si
		mov	ax, 0FFFFh
		pop	si
		pop	bp
		ret	2
sub_5D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_609		proc far

saved_4		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+saved_4]
		push	si
		call	sub_5D0
		mov	ax, si
		pop	si
		pop	bp
		ret	2
sub_609		endp

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
		jg	short loc_64C
		jl	short loc_63D
		cmp	[bp+arg_0], 0
		jnb	short loc_64C

loc_63D:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		neg	dx
		neg	ax
		sbb	dx, 0
		jmp	short loc_652

loc_64C:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]

loc_652:
		pop	bp
		retf
CRT_NormalizeSign32		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_654		proc near

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
		ja	short loc_6C2
		cmp	bl, 2
		jb	short loc_6C2
		mov	ax, [bp+arg_8]
		mov	cx, [bp+arg_A]
		or	cx, cx
		jge	short loc_68A
		cmp	[bp+arg_2], 0
		jz	short loc_68A
		mov	byte ptr [di], 2Dh
		inc	di
		neg	cx
		neg	ax
		sbb	cx, 0

loc_68A:
		lea	si, [bp+var_22]
		jcxz	short loc_69E

loc_68F:
		xchg	cx, ax
		sub	dx, dx
		div	bx
		xchg	cx, ax
		div	bx
		mov	[si], dl
		inc	si
		jcxz	short loc_6A5
		jmp	short loc_68F

loc_69E:
		sub	dx, dx
		div	bx
		mov	[si], dl
		inc	si

loc_6A5:
		or	ax, ax
		jnz	short loc_69E
		lea	cx, [bp+var_22]
		neg	cx
		add	cx, si
		cld

loc_6B1:
		dec	si
		mov	al, [si]
		sub	al, 0Ah
		jnb	short loc_6BC
		add	al, 3Ah
		jmp	short loc_6BF

loc_6BC:
		add	al, [bp+arg_0]

loc_6BF:
		stosb
		loop	short loc_6B1

loc_6C2:
		mov	al, 0
		stosb
		pop	es
		mov	ax, [bp+arg_6]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret	0Ch
sub_654		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6D1		proc far

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
		call	sub_654
		pop	bp
		ret	4
sub_6D1		endp

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
		and	word ptr [bx+5CCAh], 0FDFFh
		mov	ah, 42h
		mov	al, [bp+arg_6]
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_2]
		int	21h
		jb	short loc_710
		jmp	short loc_715

loc_710:
		push	ax
		call	sub_5D0
		cwd

loc_715:
		pop	bp
		retf
CRT_Lseek		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_717		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, word_4F868
		mov	dx, word_4F866
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		mov	word_4F868, ax
		mov	word_4F866, dx
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		mov	sp, bp
		pop	bp
		retf
sub_717		endp

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
		jz	short loc_753
		mov	ax, si
		jmp	short loc_756

loc_753:
		mov	ax, 1

loc_756:
		mov	si, ax
		jmp	short loc_75E

loc_75A:
		call	dword ptr word_4F866

loc_75E:
		push	si
		call	sub_32FCF
		pop	cx
		mov	[bp+var_2], ax
		or	ax, ax
		jnz	short loc_775
		mov	ax, word_4F866
		or	ax, word_4F868
		jnz	short loc_75A

loc_775:
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
		jz	short loc_793
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		jmp	short loc_798

loc_793:
		xor	dx, dx
		mov	ax, 1

loc_798:
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		jmp	short loc_7A4

loc_7A0:
		call	dword ptr word_4F866

loc_7A4:
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_33985
		pop	cx
		pop	cx
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jnz	short loc_7C4
		mov	ax, word_4F866
		or	ax, word_4F868
		jnz	short loc_7A0

loc_7C4:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		mov	sp, bp
		pop	bp
		retf
CRT_Malloc32_Retry		endp

; ----------------------------------------------------------------------

sub_7CE		proc near
		push	si
		xchg	si, ax
		xchg	dx, ax
		test	ax, ax
		jz	short loc_7D7
		mul	bx

loc_7D7:
		jcxz	short loc_7DE
		xchg	cx, ax
		mul	si
		add	ax, cx

loc_7DE:
		xchg	si, ax
		mul	bx
		add	dx, si
		pop	si
		ret
sub_7CE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Srand_6F2 (sub_6F2
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. srand() du runtime : graine de CRT_Rand (word_487DE = arg_0, word_487E0 =
; 0). Appelée par mid2 (sub_6B9C0) et mid17 (sub_98210) avec CRT_Time_85A(0) : tirages
; différents à chaque partie.
; ==============================================================================================
CRT_Srand_7E5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	word_4E732, 0
		mov	word_4E730, ax
		pop	bp
		retf
CRT_Srand_7E5		endp

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
		mov	cx, word_4E732
		mov	bx, word_4E730
		mov	dx, 15Ah
		mov	ax, 4E35h
		call	sub_7CE
		add	ax, 1
		adc	dx, 0
		mov	word_4E732, dx
		mov	word_4E730, ax
		mov	ax, word_4E732
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
		jb	short loc_82C
		xor	ax, ax
		jmp	short loc_830

loc_82C:
		push	ax
		call	sub_5D0

loc_830:
		pop	bp
		retf
CRT_Unlink		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_832		proc far

var_6		= word ptr -6
var_4		= word ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		push	di
		mov	[bp+var_4], 0
		mov	[bp+var_6], 0
		jmp	short loc_85F
sub_832		endp

; ----------------------------------------------------------------------

sub_846		proc near
		mov	di, [bp+0Ch]
		test	byte ptr [bp-1], 20h
		jz	short loc_856
		les	di, [di]
		add	word ptr [bp+0Ch], 4
		ret

loc_856:
		mov	di, [di]
		push	ds
		pop	es
		add	word ptr [bp+0Ch], 2
		ret

loc_85F:
		push	es
		cld

loc_861:
		mov	si, [bp+0Ah]

loc_864:
		lodsb
		or	al, al
		jz	short loc_8C7
		cmp	al, 25h
		jz	short loc_8CA

loc_86D:
		cbw
		xchg	di, ax
		inc	word ptr [bp-6]
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		or	ax, ax
		jl	short loc_8A3
		cbw
		or	di, di
		js	short loc_8B4
		cmp	byte ptr [di+5D54h], 1
		jnz	short loc_8B4

loc_889:
		xchg	bx, ax
		or	bl, bl
		js	short loc_8A6
		cmp	byte ptr [bx+5D54h], 1
		jnz	short loc_8A6
		inc	word ptr [bp-6]
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		or	ax, ax
		jg	short loc_889

loc_8A3:
		jmp	loc_BFA

loc_8A6:
		push	word ptr [bp+8]
		push	bx
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		dec	word ptr [bp-6]
		jmp	short loc_864

loc_8B4:
		cmp	ax, di
		jz	short loc_864
		push	word ptr [bp+8]
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		dec	word ptr [bp-6]
		jmp	loc_C0E

loc_8C7:
		jmp	loc_C0E

loc_8CA:
		mov	word ptr [bp-0Ah], 0FFFFh
		mov	byte ptr [bp-1], 0

loc_8D3:
		lodsb
		cbw
		mov	[bp+0Ah], si
		xchg	di, ax
		or	di, di
		jl	short loc_8F6
		mov	bl, [di+5D54h]
		xor	bh, bh
		cmp	bx, 15h
		jbe	short loc_8EB
		jmp	loc_BFA

loc_8EB:
		shl	bx, 1
		jmp	cs:off_CA1[bx]	; switch jump

loc_8F2:
		xchg	di, ax
		jmp	loc_86D

loc_8F6:
		jmp	loc_C0E

loc_8F9:
		or	byte ptr [bp-1], 1
		jmp	short loc_8D3

loc_8FF:
		sub	di, 30h
		xchg	[bp-0Ah], di
		or	di, di
		jl	short loc_8D3
		mov	ax, 0Ah
		mul	di
		add	[bp-0Ah], ax
		jmp	short loc_8D3

loc_913:
		or	byte ptr [bp-1], 8
		jmp	short loc_8D3

loc_919:
		or	byte ptr [bp-1], 4
		jmp	short loc_8D3

loc_91F:
		or	byte ptr [bp-1], 2
		jmp	short loc_8D3

loc_925:
		and	byte ptr [bp-1], 0DFh
		jmp	short loc_8D3

loc_92B:
		or	byte ptr [bp-1], 20h
		jmp	short loc_8D3

loc_931:
		mov	ax, [bp-6]
		sub	dx, dx
		test	byte ptr [bp-1], 1
		jz	short loc_98C
		jmp	short loc_8D3

loc_93E:
		mov	si, 8
		jmp	short loc_94F

loc_943:
		mov	si, 0Ah
		jmp	short loc_94F

loc_948:
		mov	si, 10h
		jmp	short loc_94F

loc_94D:
		xor	si, si

loc_94F:
		test	di, 20h
		jnz	short loc_95E
		cmp	di, 58h
		jz	short loc_95E
		or	byte ptr [bp-1], 4

loc_95E:
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
		call	sub_CF8
		add	sp, 0Eh
		cmp	word ptr [bp-8], 0
		jle	short loc_99B
		test	byte ptr [bp-1], 1
		jnz	short loc_998
		inc	word ptr [bp-4]

loc_98C:
		call	sub_846
		stosw
		test	byte ptr [bp-1], 4
		jz	short loc_998
		xchg	dx, ax
		stosw

loc_998:
		jmp	loc_861

loc_99B:
		jl	short loc_9A0
		jmp	loc_C0E

loc_9A0:
		jmp	loc_BFA

loc_9A3:
		call	sub_9A6
sub_846		endp

; ----------------------------------------------------------------------

sub_9A6		proc near
		jmp	loc_C15
		push	word ptr [bp+8]
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		dec	word ptr [bp-6]
		and	word ptr [bp-0Ah], 7FFFh
		call	loc_9BD
		jmp	loc_C3B
		push	dx
		cmp	al, 3Ah
		jz	short loc_9DA
		or	ax, ax
		jle	short loc_9D5
		push	word ptr [bp+8]
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		dec	word ptr [bp-6]

loc_9D5:
		pop	dx
		mov	bx, ds
		jmp	short loc_9F5

loc_9DA:
		call	loc_9DD
		jmp	loc_C3B
		pop	bx
		or	ax, ax
		jle	short loc_9F5
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

loc_9F5:
		test	byte ptr [bp-1], 1
		jnz	short loc_A0B
		call	sub_846
		inc	word ptr [bp-4]
		xchg	dx, ax
		stosw
		test	byte ptr [bp-1], 20h
		jz	short loc_A0B
		xchg	bx, ax
		stosw

loc_A0B:
		jmp	loc_861

loc_A0E:
		jmp	loc_BFA

loc_A11:
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
		call	sub_1FAB
		add	sp, 0Ch
		cmp	word ptr [bp-8], 0
		jle	short loc_A6D
		mov	al, [bp-1]
		cbw
		test	ax, 1
		jnz	short loc_A67
		call	sub_846
		inc	word ptr [bp-4]
		test	byte ptr [bp-1], 4
		jz	short loc_A4F
		mov	ax, 4
		jmp	short loc_A5C

loc_A4F:
		test	byte ptr [bp-1], 8
		jz	short loc_A5A
		mov	ax, 8
		jmp	short loc_A5C

loc_A5A:
		xor	ax, ax

loc_A5C:
		push	ax
		push	di
		call	sub_1FAF
		add	sp, 4
		jmp	loc_861

loc_A67:
		call	sub_1FB3
		jmp	loc_861

loc_A6D:
		call	sub_1FB3
		jl	short loc_A0E
		jmp	loc_C0E

loc_A75:
		call	sub_A78
sub_9A6		endp

; ----------------------------------------------------------------------

sub_A78		proc near
		jmp	loc_C15
		test	byte ptr [bp-1], 1
		jnz	short loc_A87
		call	sub_846
		inc	word ptr [bp-4]

loc_A87:
		and	word ptr [bp-0Ah], 7FFFh
		jz	short loc_AB7

loc_A8E:
		test	byte ptr [bp-1], 1
		jnz	short loc_A95
		stosb

loc_A95:
		inc	word ptr [bp-6]
		push	es
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		pop	es
		or	ax, ax
		jle	short loc_AB7
		or	al, al
		js	short loc_AB2
		xchg	bx, ax
		cmp	byte ptr [bx+5D54h], 1
		xchg	bx, ax
		jle	short loc_AB7

loc_AB2:
		dec	word ptr [bp-0Ah]
		jg	short loc_A8E

loc_AB7:
		push	es
		push	word ptr [bp+8]
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		pop	es
		dec	word ptr [bp-6]
		test	byte ptr [bp-1], 1
		jnz	short loc_ACE
		mov	al, 0
		stosb

loc_ACE:
		jmp	loc_861

loc_AD1:
		test	byte ptr [bp-1], 1
		jnz	short loc_ADA
		call	sub_846

loc_ADA:
		mov	si, [bp-0Ah]
		or	si, si
		jge	short loc_AE4
		mov	si, 1

loc_AE4:
		jz	short loc_B00

loc_AE6:
		inc	word ptr [bp-6]
		push	es
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		pop	es
		or	ax, ax
		jl	short loc_B0C
		test	byte ptr [bp-1], 1
		jnz	short loc_AFD
		stosb

loc_AFD:
		dec	si
		jg	short loc_AE6

loc_B00:
		test	byte ptr [bp-1], 1
		jnz	short loc_B09
		inc	word ptr [bp-4]

loc_B09:
		jmp	loc_861

loc_B0C:
		jmp	loc_BFA

loc_B0F:
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
		jnz	short loc_B2A
		or	byte ptr [bp-1], 10h
		lodsb

loc_B2A:
		mov	ah, 0

loc_B2C:
		mov	dl, al
		mov	di, ax
		mov	cl, 3
		shr	di, cl
		mov	cx, 107h
		and	cl, dl
		shl	ch, cl
		or	[bp+di-2Ah], ch

loc_B3E:
		lodsb
		cmp	al, 0
		jz	short loc_B69
		cmp	al, 5Dh
		jz	short loc_B6C
		cmp	al, 2Dh
		jnz	short loc_B2C
		cmp	dl, [si]
		ja	short loc_B2C
		cmp	byte ptr [si], 5Dh
		jz	short loc_B2C
		lodsb
		sub	al, dl
		jz	short loc_B3E
		add	dl, al

loc_B5B:
		rol	ch, 1
		adc	di, 0
		or	[bp+di-2Ah], ch
		dec	al
		jnz	short loc_B5B
		jmp	short loc_B3E

loc_B69:
		jmp	loc_C0E

loc_B6C:
		mov	[bp+0Ah], si
		and	word ptr [bp-0Ah], 7FFFh
		mov	si, [bp-0Ah]
		test	byte ptr [bp-1], 1
		jnz	short loc_B80
		call	sub_846

loc_B80:
		dec	si
		jl	short loc_BD3
		inc	word ptr [bp-6]
		push	es
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		pop	es
		or	ax, ax
		jl	short loc_BE8
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
		jz	short loc_BB0
		test	byte ptr [bp-1], 10h
		jz	short loc_BB6
		jmp	short loc_BBF

loc_BB0:
		test	byte ptr [bp-1], 10h
		jz	short loc_BBF

loc_BB6:
		test	byte ptr [bp-1], 1
		jnz	short loc_B80
		stosb
		jmp	short loc_B80

loc_BBF:
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
		jge	short loc_BDC

loc_BD3:
		test	byte ptr [bp-1], 1
		jnz	short loc_BE5
		inc	word ptr [bp-4]

loc_BDC:
		test	byte ptr [bp-1], 1
		jnz	short loc_BE5
		mov	al, 0
		stosb

loc_BE5:
		jmp	loc_861

loc_BE8:
		inc	si
		cmp	si, [bp-0Ah]
		jge	short loc_BFA
		test	byte ptr [bp-1], 1
		jnz	short loc_BFA
		mov	al, 0
		stosb
		inc	word ptr [bp-4]

loc_BFA:
		push	word ptr [bp+8]
		mov	ax, 0FFFFh
		push	ax
		call	word ptr [bp+6]
		pop	cx
		pop	cx
		cmp	word ptr [bp-4], 1
		sbb	word ptr [bp-4], 0

loc_C0E:
		pop	es
		mov	ax, [bp-4]
		jmp	loc_C9B

loc_C15:
		inc	word ptr [bp-6]
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		or	ax, ax
		jle	short loc_C36
		or	al, al
		js	short loc_C30
		xchg	bx, ax
		cmp	byte ptr [bx+5D54h], 1
		xchg	bx, ax
		jz	short loc_C15

loc_C30:
		pop	cx
		add	cx, 3
		jmp	cx

loc_C36:
		jz	short loc_C30
		pop	cx
		jmp	short loc_BFA

loc_C3B:
		sub	dx, dx
		mov	cx, 4

loc_C40:
		dec	word ptr [bp-0Ah]
		jl	short loc_C8A
		push	dx
		push	cx
		inc	word ptr [bp-6]
		push	word ptr [bp+8]
		call	word ptr [bp+4]
		pop	cx
		pop	cx
		pop	dx
		or	ax, ax
		jle	short loc_C8C
		dec	cl
		jl	short loc_C8C
		mov	ch, al
		sub	ch, 30h
		jb	short loc_C8C
		cmp	ch, 0Ah
		jb	short loc_C7E
		sub	ch, 11h
		jb	short loc_C8C
		cmp	ch, 6
		jb	short loc_C7B
		sub	ch, 20h
		jb	short loc_C8C
		cmp	ch, 6
		jnb	short loc_C8C

loc_C7B:
		add	ch, 0Ah

loc_C7E:
		shl	dx, 1
		shl	dx, 1
		shl	dx, 1
		shl	dx, 1
		add	dl, ch
		jmp	short loc_C40

loc_C8A:
		sub	ax, ax

loc_C8C:
		cmp	cl, 4
		jz	short loc_C97
		pop	cx
		add	cx, 3
		jmp	cx

loc_C97:
		pop	cx
		jmp	loc_BFA

loc_C9B:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret
sub_A78		endp

; START OF FUNCTION CHUNK FOR sub_A78
off_CA1	dw offset loc_C0E
		dw offset loc_C0E
		dw offset loc_C0E
		dw offset loc_8F2
		dw offset loc_8F9
		dw offset loc_8FF
		dw offset loc_AD1
		dw offset loc_943
		dw offset loc_943
		dw offset loc_94D
		dw offset loc_A11
		dw offset loc_913
		dw offset loc_91F
		dw offset loc_919
		dw offset loc_93E
		dw offset loc_A75
		dw offset loc_B0F
		dw offset loc_931
		dw offset loc_948
		dw offset loc_9A3
		dw offset loc_925
		dw offset loc_92B
; END OF FUNCTION CHUNK FOR sub_A78

; ----------------------------------------------------------------------

sub_CCD		proc near
		push	bx
		sub	bl, 30h
		jb	short loc_CF5
		cmp	bl, 9
		jbe	short loc_CEA
		cmp	bl, 2Ah
		ja	short loc_CE2
		sub	bl, 7
		jmp	short loc_CE5

loc_CE2:
		sub	bl, 27h

loc_CE5:
		cmp	bl, 9
		jbe	short loc_CF5

loc_CEA:
		cmp	bl, cl
		jnb	short loc_CF5
		inc	sp
		inc	sp
		clc
		mov	bh, 0
		jmp	short loc_CF7

loc_CF5:
		pop	bx
		stc

loc_CF7:
		ret
sub_CCD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CF8		proc near

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

loc_D0E:
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		or	ax, ax
		jl	short loc_D84
		cbw
		xchg	bx, ax
		test	bl, 80h
		jnz	short loc_D2B
		mov	di, 5A7Bh
		test	byte ptr [bx+di], 1
		jnz	short loc_D0E

loc_D2B:
		xchg	bx, ax
		dec	[bp+arg_8]
		jl	short loc_D8B
		cmp	al, 2Bh
		jz	short loc_D3C
		cmp	al, 2Dh
		jnz	short loc_D4F
		inc	[bp+var_1]

loc_D3C:
		dec	[bp+arg_8]
		jl	short loc_D8B
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		or	ax, ax
		jl	short loc_D84

loc_D4F:
		sub	si, si
		mov	di, si
		mov	cx, [bp+arg_6]
		jcxz	short loc_DA5
		cmp	cx, 24h
		ja	short loc_D8B
		cmp	cl, 2
		jb	short loc_D8B
		cmp	al, 30h
		jnz	short loc_DD1
		cmp	cl, 10h
		jnz	short loc_DCF
		dec	[bp+arg_8]
		jl	short loc_DA2
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		cmp	al, 78h
		jz	short loc_DCF
		cmp	al, 58h
		jz	short loc_DCF
		jmp	short loc_DF7

loc_D84:
		mov	[bp+var_6], 0FFFFh
		jmp	short loc_D90

loc_D8B:
		mov	[bp+var_6], 0

loc_D90:
		push	[bp+arg_4]
		push	ax
		call	word ptr [bp+arg_2]
		pop	cx
		pop	cx
		dec	[bp+var_4]
		sub	ax, ax
		cwd
		jmp	loc_E49

loc_DA2:
		jmp	loc_E39

loc_DA5:
		cmp	al, 30h
		mov	[bp+arg_6], 0Ah
		jnz	short loc_DD1
		dec	[bp+arg_8]
		jl	short loc_DA2
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		mov	[bp+arg_6], 8
		cmp	al, 78h
		jz	short loc_DCA
		cmp	al, 58h
		jnz	short loc_DF7

loc_DCA:
		mov	[bp+arg_6], 10h

loc_DCF:
		jmp	short loc_DE8

loc_DD1:
		mov	cx, [bp+arg_6]
		xchg	bx, ax
		call	sub_CCD
		xchg	bx, ax
		jb	short loc_D8B
		xchg	si, ax
		jmp	short loc_DE8

loc_DDE:
		xchg	si, ax
		mul	[bp+arg_6]
		add	si, ax
		adc	di, dx
		jnz	short loc_E14

loc_DE8:
		dec	[bp+arg_8]
		jl	short loc_E39
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx

loc_DF7:
		mov	cx, [bp+arg_6]
		xchg	bx, ax
		call	sub_CCD
		xchg	bx, ax
		jnb	short loc_DDE
		jmp	short loc_E2D

loc_E03:
		xchg	si, ax
		mul	cx
		xchg	di, ax
		xchg	dx, cx
		mul	dx
		add	si, di
		adc	ax, cx
		xchg	di, ax
		adc	dl, dh
		jnz	short loc_E5B

loc_E14:
		dec	[bp+arg_8]
		jl	short loc_E39
		inc	[bp+var_4]
		push	[bp+arg_4]
		call	word ptr [bp+arg_0]
		pop	cx
		mov	cx, [bp+arg_6]
		xchg	bx, ax
		call	sub_CCD
		xchg	bx, ax
		jnb	short loc_E03

loc_E2D:
		push	[bp+arg_4]
		push	ax
		call	word ptr [bp+arg_2]
		pop	cx
		pop	cx
		dec	[bp+var_4]

loc_E39:
		mov	dx, di
		xchg	si, ax
		cmp	[bp+var_1], 0
		jz	short loc_E49
		neg	dx
		neg	ax
		sbb	dx, 0

loc_E49:
		mov	di, [bp+arg_A]
		mov	bx, [bp+var_4]
		add	[di], bx
		mov	di, [bp+arg_C]
		mov	bx, [bp+var_6]
		mov	[di], bx
		jmp	short loc_E71

loc_E5B:
		mov	ax, 0FFFFh
		mov	dx, 7FFFh
		add	al, [bp+var_1]
		adc	ah, 0
		adc	dx, 0
		mov	[bp+var_6], 2
		jmp	short loc_E49

loc_E71:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret
sub_CF8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E77		proc far

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
sub_E77		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E8F		proc far

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
sub_E8F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EA2		proc far

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
sub_EA2		endp

; START OF FUNCTION CHUNK FOR sub_EA2
		mov	dx, 5
		cmp	dx, word_4E6A8
		jnb	short loc_EE9

loc_EBE:
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+5CCAh], 0
		mov	bx, dx
		mov	cl, 4
		shl	bx, cl
		mov	byte ptr [bx+5B8Ch], 0FFh
		mov	ax, dx
		shl	ax, cl
		add	ax, 5B88h
		mov	bx, dx
		shl	bx, cl
		mov	[bx+5B96h], ax
		inc	dx
		cmp	dx, word_4E6A8
		jb	short loc_EBE

loc_EE9:
		mov	al, byte_4E56C
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_IsAtty
		pop	cx
		or	ax, ax
		jnz	short loc_EFE
		and	word_4E56A, 0FDFFh

loc_EFE:
		mov	ax, 200h
		push	ax
		test	word_4E56A, 200h
		jz	short loc_F0F
		mov	ax, 1
		jmp	short loc_F11

loc_F0F:
		xor	ax, ax

loc_F11:
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, 5B88h
		push	ax
		nop
		push	cs
		call	near ptr Stdio_SetupFileStruct
		add	sp, 8
		mov	al, byte_4E57C
		cbw
		push	ax
		nop
		push	cs
		call	near ptr CRT_IsAtty
		pop	cx
		or	ax, ax
		jnz	short loc_F36
		and	word_4E57A, 0FDFFh

loc_F36:
		mov	ax, 200h
		push	ax
		test	word_4E57A, 200h
		jz	short loc_F47
		mov	ax, 2
		jmp	short loc_F49

loc_F47:
		xor	ax, ax

loc_F49:
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, 5B98h
		push	ax
		nop
		push	cs
		call	near ptr Stdio_SetupFileStruct
		add	sp, 8
		ret
; END OF FUNCTION CHUNK FOR sub_EA2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F5A		proc far

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
		call	near ptr sub_2FAA
		add	sp, 8
		lea	ax, [bp+var_4]
		push	ax
		nop
		push	cs
		call	near ptr sub_E8F
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		nop
		push	cs
		call	near ptr sub_EA2
		pop	cx
		xor	ax, ax
		mov	sp, bp
		pop	bp
		retf
sub_F5A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à CRT_Time_85A (sub_85A
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. time() du runtime : date (sub_3E9) et heure (sub_3FC) du DOS converties par
; sub_2899 en secondes (dx:ax), rangées aussi en [arg_0] si arg_0 ≠ 0.
; ==============================================================================================
CRT_Time_F92		proc far

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
		call	near ptr sub_4A7
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		nop
		push	cs
		call	near ptr sub_4BA
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		nop
		push	cs
		call	near ptr sub_2E91
		pop	cx
		pop	cx
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		or	si, si
		jz	short loc_FD4
		mov	ax, [bp+var_A]
		mov	dx, [bp+var_C]
		mov	[si+2], ax
		mov	[si], dx

loc_FD4:
		mov	dx, [bp+var_A]
		mov	ax, [bp+var_C]
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Time_F92		endp

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
		jnz	short loc_FEF
		mov	ax, 0FFFFh
		jmp	short loc_1009

loc_FEF:
		mov	al, dl
		mov	ah, 0
		mov	bx, ax
		test	byte ptr [bx+5A7Bh], 8
		jz	short loc_1005
		mov	al, dl
		mov	ah, 0
		add	ax, 0FFE0h
		jmp	short loc_1009

loc_1005:
		mov	al, dl
		mov	ah, 0

loc_1009:
		pop	bp
		retf
CRT_CtypeLookup		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_100B		proc far

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
		jnz	short loc_1023
		jmp	loc_123C

loc_1023:
		lea	ax, [bp+arg_C]
		mov	[bp+var_2], ax
		test	[bp+arg_A], 1
		jz	short loc_104D
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		mov	ax, word ptr [bp+var_6]
		or	ax, word ptr [bp+var_6+2]
		jnz	short loc_1060
		jmp	short loc_105B

loc_104D:
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	di, [bx-2]
		or	di, di
		jnz	short loc_1060

loc_105B:
		mov	[bp+var_8], 0

loc_1060:
		test	[bp+arg_A], 10h
		jz	short loc_1078
		les	bx, [bp+arg_0]
		mov	ax, es:[bx-2]
		mov	dx, es:[bx-4]
		mov	[bp+arg_8], ax
		mov	[bp+arg_6], dx

loc_1078:
		cmp	[bp+var_8], 0
		jnz	short loc_1081
		jmp	loc_11E8

loc_1081:
		mov	ax, [bp+arg_A]
		and	ax, 1A7h
		mov	[bp+var_C], ax
		test	[bp+var_C], 80h
		jz	short loc_1096
		and	[bp+var_C], 0FEFFh

loc_1096:
		mov	bx, [bp+arg_4]
		xor	cx, cx
		mov	dx, [bp+arg_8]
		mov	ax, [bp+arg_6]
		sub	ax, 1
		sbb	dx, 0
		call	sub_7CE
		add	ax, [bp+arg_0]
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	dx, [bp+arg_2]
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		jmp	loc_11CA

loc_10C1:
		mov	ax, [bp+var_C]
		mov	[bp+var_A], ax
		mov	cx, 10h
		mov	bx, offset word_1242

loc_10CD:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_A]
		jz	short loc_10DD
		add	bx, 2
		loop	short loc_10CD
		jmp	loc_11B2

loc_10DD:
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_10E1:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		push	[bp+var_10]
		call	di

loc_10ED:
		add	sp, 6
		jmp	loc_11B7

loc_10F3:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		push	[bp+var_10]
		call	dword ptr [bp+var_6]
		jmp	short loc_10ED

loc_1102:
		push	[bp+var_E]
		push	[bp+var_10]
		mov	ax, 2
		push	ax

loc_110C:
		call	di
		jmp	short loc_1135

loc_1110:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		push	[bp+var_10]
		jmp	short loc_110C

loc_111C:
		push	[bp+var_E]
		push	[bp+var_10]
		mov	ax, 2
		push	ax
		jmp	short loc_1132

loc_1128:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		push	[bp+var_10]

loc_1132:
		call	dword ptr [bp+var_6]

loc_1135:
		jmp	loc_11B7

loc_1138:
		push	[bp+var_E]
		push	[bp+var_10]
		mov	ax, 2
		call	di
		jmp	short loc_1153

loc_1145:
		jmp	short loc_1138

loc_1147:
		push	[bp+var_E]
		push	[bp+var_10]
		mov	ax, 2
		call	dword ptr [bp+var_6]

loc_1153:
		jmp	short loc_11B7

loc_1155:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		push	ax
		call	di
		pop	cx
		pop	si
		pop	ds
		jmp	short loc_11B7

loc_1165:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		pop	cx
		pop	si
		pop	ds
		jmp	short loc_11B7

loc_1176:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		push	ax
		call	di
		pop	si
		pop	ds
		jmp	short loc_11B7

loc_1185:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		pop	si
		pop	ds
		jmp	short loc_11B7

loc_1195:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		call	di
		pop	si
		pop	ds
		jmp	short loc_11B7

loc_11A3:
		push	ds
		push	si
		lds	si, [bp+var_10]
		mov	ax, 2
		call	dword ptr [bp+var_6]
		pop	si
		pop	ds
		jmp	short loc_11B7

loc_11B2:
		nop
		push	cs
		call	near ptr sub_315

loc_11B7:
		mov	ax, [bp+arg_4]
		xor	dx, dx
		sub	[bp+var_10], ax
		sbb	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	[bp+var_E], dx

loc_11CA:
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_8]
		sub	[bp+arg_6], 1
		sbb	[bp+arg_8], 0
		or	dx, dx
		jbe	short loc_11DF
		jmp	loc_10C1

loc_11DF:
		jnz	short loc_11E8
		or	ax, ax
		jbe	short loc_11E8
		jmp	loc_10C1

loc_11E8:
		test	[bp+arg_A], 8
		jz	short loc_123C
		mov	[bp+var_E], 0
		test	[bp+arg_A], 10h
		jz	short loc_1200
		mov	[bp+var_E], 4

loc_1200:
		test	[bp+arg_A], 40h
		jz	short loc_1220
		add	[bp+var_E], 2
		les	bx, [bp+arg_0]
		sub	bx, [bp+var_E]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_C], ax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+var_C]
		jmp	short loc_1229

loc_1220:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		sub	dx, [bp+var_E]

loc_1229:
		mov	[bp+arg_2], ax
		mov	[bp+arg_0], dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_3AA
		pop	cx
		pop	cx

loc_123C:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_100B		endp

; START OF FUNCTION CHUNK FOR sub_100B
word_1242	dw 4
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
off_1262	dw offset loc_10E1
		dw offset loc_10F3
		dw offset loc_1102
		dw offset loc_111C
		dw offset loc_1138
		dw offset loc_1147
		dw offset loc_1155
		dw offset loc_1165
		dw offset loc_1176
		dw offset loc_1185
		dw offset loc_1195
		dw offset loc_11A3
		dw offset loc_1110
		dw offset loc_1128
		dw offset loc_1145
		dw offset loc_1147
; END OF FUNCTION CHUNK FOR sub_100B

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
		jnz	short loc_1298
		jmp	loc_142E

loc_1298:
		lea	ax, [bp+arg_8]
		mov	[bp+var_2], ax
		test	[bp+arg_6], 1
		jz	short loc_12C2
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		mov	ax, word ptr [bp+var_6]
		or	ax, word ptr [bp+var_6+2]
		jnz	short loc_12D5
		jmp	short loc_12D0

loc_12C2:
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	di, [bx-2]
		or	di, di
		jnz	short loc_12D5

loc_12D0:
		mov	[bp+var_8], 0

loc_12D5:
		test	[bp+arg_6], 10h
		jz	short loc_12E5
		mov	bx, [bp+arg_0]
		mov	ax, [bx-2]
		mov	[bp+arg_4], ax

loc_12E5:
		cmp	[bp+var_8], 0
		jnz	short loc_12EE
		jmp	loc_140E

loc_12EE:
		mov	ax, [bp+arg_6]
		and	ax, 1A7h
		mov	[bp+var_C], ax
		test	[bp+var_C], 80h
		jz	short loc_1303
		and	[bp+var_C], 0FEFFh

loc_1303:
		mov	ax, [bp+arg_4]
		dec	ax
		imul	[bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, ax
		mov	[bp+var_E], dx
		jmp	loc_1401

loc_1315:
		mov	ax, [bp+var_C]
		mov	[bp+var_A], ax
		mov	cx, 10h
		mov	bx, offset word_1434

loc_1321:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_A]
		jz	short loc_1331
		add	bx, 2
		loop	short loc_1321
		jmp	loc_13F6

loc_1331:
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_1335:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		call	di

loc_133E:
		pop	cx
		pop	cx
		jmp	loc_13FB

loc_1343:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		call	dword ptr [bp+var_6]
		jmp	short loc_133E

loc_134F:
		push	[bp+var_E]
		mov	ax, 2
		push	ax
		call	di
		jmp	loc_13FB

loc_135B:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		call	di
		jmp	loc_13FB

loc_1367:
		push	[bp+var_E]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		jmp	loc_13FB

loc_1374:
		mov	ax, 2
		push	ax
		push	[bp+var_E]
		call	dword ptr [bp+var_6]
		jmp	short loc_13FB

loc_1380:
		mov	ax, 2
		mov	bx, [bp+var_E]
		jmp	short loc_138E

loc_1388:
		mov	bx, [bp+var_E]
		mov	ax, 2

loc_138E:
		call	di
		jmp	short loc_13FB

loc_1392:
		mov	ax, 2
		mov	bx, [bp+var_E]
		jmp	short loc_13A0

loc_139A:
		mov	bx, [bp+var_E]
		mov	ax, 2

loc_13A0:
		call	dword ptr [bp+var_6]
		jmp	short loc_13FB

loc_13A5:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	di
		pop	cx
		pop	si
		jmp	short loc_13FB

loc_13B3:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		pop	cx
		pop	si
		jmp	short loc_13FB

loc_13C2:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	di
		pop	si
		jmp	short loc_13FB

loc_13CF:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		push	ax
		call	dword ptr [bp+var_6]
		pop	si
		jmp	short loc_13FB

loc_13DD:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		call	di
		pop	si
		jmp	short loc_13FB

loc_13E9:
		push	si
		mov	si, [bp+var_E]
		mov	ax, 2
		call	dword ptr [bp+var_6]
		pop	si
		jmp	short loc_13FB

loc_13F6:
		nop
		push	cs
		call	near ptr sub_315

loc_13FB:
		mov	ax, [bp+arg_2]
		sub	[bp+var_E], ax

loc_1401:
		mov	ax, [bp+arg_4]
		dec	[bp+arg_4]
		or	ax, ax
		jbe	short loc_140E
		jmp	loc_1315

loc_140E:
		test	[bp+arg_6], 8
		jz	short loc_142E
		test	[bp+arg_6], 10h
		jz	short loc_1425
		mov	ax, [bp+arg_0]
		add	ax, 0FFFEh
		mov	[bp+arg_0], ax

loc_1425:
		push	[bp+arg_0]
		nop
		push	cs
		call	near ptr sub_39C
		pop	cx

loc_142E:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Doprnt_Core		endp

; START OF FUNCTION CHUNK FOR CRT_Doprnt_Core
word_1434	dw 0
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
off_1454	dw offset loc_1335
		dw offset loc_1343
		dw offset loc_134F
		dw offset loc_1367
		dw offset loc_1380
		dw offset loc_1392
		dw offset loc_13A5
		dw offset loc_13B3
		dw offset loc_13C2
		dw offset loc_13CF
		dw offset loc_13DD
		dw offset loc_13E9
		dw offset loc_135B
		dw offset loc_1374
		dw offset loc_1388
		dw offset loc_139A
; END OF FUNCTION CHUNK FOR CRT_Doprnt_Core

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1474		proc far

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
		jz	short loc_14AD
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	ax, word ptr [bp+var_8]
		or	ax, word ptr [bp+var_8+2]
		jnz	short loc_14C5
		jmp	short loc_14C0

loc_14AD:
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_14C5

loc_14C0:
		mov	[bp+var_A], 0

loc_14C5:
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jz	short loc_14D0
		jmp	loc_15C8

loc_14D0:
		mov	[bp+var_10], 0
		test	di, 10h
		jz	short loc_14E0
		mov	[bp+var_10], 4

loc_14E0:
		test	di, 40h
		jnz	short loc_14E9
		jmp	loc_1569

loc_14E9:
		add	[bp+var_10], 2
		mov	bx, [bp+arg_4]
		xor	cx, cx
		mov	dx, [bp+arg_8]
		mov	ax, [bp+arg_6]
		call	sub_7CE
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
		jnz	short loc_1522

loc_151B:
		xor	dx, dx
		xor	ax, ax
		jmp	loc_16C0

loc_1522:
		xor	ax, ax
		push	ax
		push	[bp+arg_4]
		mov	ax, 1
		xor	dx, dx
		push	ax
		push	dx
		call	near ptr sub_531
		mov	[bp+var_12], ax
		mov	ax, [bp+arg_0]
		mov	[bp+var_E], ax
		jmp	short loc_1543

loc_153D:
		mov	ax, [bp+arg_4]
		add	[bp+var_12], ax

loc_1543:
		mov	ax, [bp+var_10]
		add	ax, [bp+var_E]
		cmp	ax, [bp+var_12]
		ja	short loc_153D
		mov	ax, [bp+var_12]
		sub	ax, [bp+var_E]
		sub	ax, [bp+var_10]
		add	[bp+arg_0], ax
		les	bx, [bp+arg_0]
		mov	ax, [bp+var_E]
		mov	es:[bx], ax
		add	[bp+arg_0], 2
		jmp	short loc_15AE

loc_1569:
		mov	bx, [bp+arg_4]
		xor	cx, cx
		mov	dx, [bp+arg_8]
		mov	ax, [bp+arg_6]
		call	sub_7CE
		add	ax, [bp+var_10]
		adc	dx, 0
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		cmp	[bp+var_14], 0
		jb	short loc_1593
		ja	short loc_151B
		cmp	[bp+var_16], 0FFFFh
		jbe	short loc_1593
		jmp	short loc_151B

loc_1593:
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
		jnz	short loc_15AE
		jmp	loc_151B

loc_15AE:
		test	di, 10h
		jz	short loc_15C8
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_8]
		mov	dx, [bp+arg_6]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		add	[bp+arg_0], 4

loc_15C8:
		and	di, 1A7h
		test	di, 80h
		jz	short loc_15D6
		and	di, 0FEFFh

loc_15D6:
		cmp	[bp+var_A], 0
		jnz	short loc_15DF
		jmp	loc_16BA

loc_15DF:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		jmp	loc_169C

loc_15EE:
		mov	[bp+var_C], di
		mov	cx, 10h
		mov	bx, offset word_16C6

loc_15F7:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_C]
		jz	short loc_1606
		add	bx, 2
		loop	short loc_15F7
		jmp	short loc_1684

loc_1606:
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_160A:
		push	[bp+var_E]
		push	[bp+var_10]
		call	word ptr [bp+var_4]

loc_1613:
		pop	cx
		pop	cx
		jmp	short loc_1689

loc_1617:
		push	[bp+var_E]
		push	[bp+var_10]
		call	dword ptr [bp+var_8]
		jmp	short loc_1613

loc_1622:
		push	[bp+var_E]
		push	[bp+var_10]
		call	word ptr [bp+var_4]
		jmp	short loc_163A

loc_162D:
		jmp	short loc_1631

loc_162F:
		jmp	short loc_1622

loc_1631:
		push	[bp+var_E]
		push	[bp+var_10]
		call	dword ptr [bp+var_8]

loc_163A:
		jmp	short loc_1689

loc_163C:
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	word ptr [bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_1689

loc_1648:
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	dword ptr [bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_1689

loc_1654:
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	word ptr [bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_1689

loc_1660:
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	dword ptr [bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_1689

loc_166C:
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	word ptr [bp+var_4]
		pop	si
		pop	ds
		jmp	short loc_1689

loc_1678:
		push	ds
		push	si
		lds	si, [bp+var_10]
		call	dword ptr [bp+var_8]
		pop	si
		pop	ds
		jmp	short loc_1689

loc_1684:
		nop
		push	cs
		call	near ptr sub_315

loc_1689:
		mov	ax, [bp+arg_4]
		xor	dx, dx
		add	[bp+var_10], ax
		adc	dx, 0
		mov	cx, 0Ch
		shl	dx, cl
		add	[bp+var_E], dx

loc_169C:
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_8]
		sub	[bp+arg_6], 1
		sbb	[bp+arg_8], 0
		or	dx, dx
		jbe	short loc_16B1
		jmp	loc_15EE

loc_16B1:
		jnz	short loc_16BA
		or	ax, ax
		jbe	short loc_16BA
		jmp	loc_15EE

loc_16BA:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]

loc_16C0:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_1474		endp

; START OF FUNCTION CHUNK FOR sub_1474
word_16C6	dw 4
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
off_16E6	dw offset loc_160A
		dw offset loc_1617
		dw offset loc_1622
		dw offset loc_162D
		dw offset loc_162F
		dw offset loc_1631
		dw offset loc_163C
		dw offset loc_1648
		dw offset loc_1654
		dw offset loc_1660
		dw offset loc_166C
		dw offset loc_1678
		dw offset loc_1622
		dw offset loc_162D
		dw offset loc_162F
		dw offset loc_1631
; END OF FUNCTION CHUNK FOR sub_1474

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
		jz	short loc_1740
		add	[bp+var_2], 4
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	dx, [bx-4]
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	ax, word ptr [bp+var_8]
		or	ax, word ptr [bp+var_8+2]
		jnz	short loc_1758
		jmp	short loc_1753

loc_1740:
		add	[bp+var_2], 2
		mov	bx, [bp+var_2]
		mov	ax, [bx-2]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_1758

loc_1753:
		mov	[bp+var_A], 0

loc_1758:
		or	di, di
		jnz	short loc_17AC
		mov	ax, [bp+arg_2]
		imul	[bp+arg_4]
		mov	[bp+var_E], 0
		mov	[bp+var_10], ax
		test	[bp+arg_6], 10h
		jz	short loc_1779
		add	[bp+var_10], 2
		adc	[bp+var_E], 0

loc_1779:
		cmp	[bp+var_E], 0
		jb	short loc_178C
		ja	short loc_1787
		cmp	[bp+var_10], 0FFFFh
		jbe	short loc_178C

loc_1787:
		xor	ax, ax
		jmp	loc_1872

loc_178C:
		push	[bp+var_10]
		nop
		push	cs
		call	near ptr CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	di, di
		jnz	short loc_179D
		jmp	short loc_1787

loc_179D:
		test	[bp+arg_6], 10h
		jz	short loc_17AC
		mov	ax, [bp+arg_4]
		mov	[di], ax
		add	di, 2

loc_17AC:
		and	[bp+arg_6], 1A7h
		test	[bp+arg_6], 80h
		jz	short loc_17BD
		and	[bp+arg_6], 0FEFFh

loc_17BD:
		cmp	[bp+var_A], 0
		jnz	short loc_17C6
		jmp	loc_1870

loc_17C6:
		mov	[bp+var_E], di
		jmp	loc_1863

loc_17CC:
		mov	ax, [bp+arg_6]
		mov	[bp+var_C], ax
		mov	cx, 10h
		mov	bx, offset word_1878

loc_17D8:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_C]
		jz	short loc_17E7
		add	bx, 2
		loop	short loc_17D8
		jmp	short loc_1858

loc_17E7:
		jmp	word ptr cs:[bx+20h] ; switch jump

loc_17EB:
		push	[bp+var_E]
		call	word ptr [bp+var_4]

loc_17F1:
		pop	cx
		jmp	short loc_185D

loc_17F4:
		push	[bp+var_E]
		call	dword ptr [bp+var_8]
		jmp	short loc_17F1

loc_17FC:
		push	[bp+var_E]
		call	word ptr [bp+var_4]
		jmp	short loc_180A

loc_1804:
		push	[bp+var_E]
		call	dword ptr [bp+var_8]

loc_180A:
		jmp	short loc_185D

loc_180C:
		mov	bx, [bp+var_E]
		call	word ptr [bp+var_4]
		jmp	short loc_185D

loc_1814:
		mov	bx, [bp+var_E]
		call	dword ptr [bp+var_8]
		jmp	short loc_185D

loc_181C:
		push	si
		mov	si, [bp+var_E]
		call	word ptr [bp+var_4]
		pop	si
		jmp	short loc_185D

loc_1826:
		push	si
		mov	si, [bp+var_E]
		call	dword ptr [bp+var_8]
		pop	si
		jmp	short loc_185D

loc_1830:
		push	si
		mov	si, [bp+var_E]
		call	word ptr [bp+var_4]
		pop	si
		jmp	short loc_185D

loc_183A:
		push	si
		mov	si, [bp+var_E]
		call	dword ptr [bp+var_8]
		pop	si
		jmp	short loc_185D

loc_1844:
		push	si
		mov	si, [bp+var_E]
		call	word ptr [bp+var_4]
		pop	si
		jmp	short loc_185D

loc_184E:
		push	si
		mov	si, [bp+var_E]
		call	dword ptr [bp+var_8]
		pop	si
		jmp	short loc_185D

loc_1858:
		nop
		push	cs
		call	near ptr sub_315

loc_185D:
		mov	ax, [bp+arg_2]
		add	[bp+var_E], ax

loc_1863:
		mov	ax, [bp+arg_4]
		dec	[bp+arg_4]
		or	ax, ax
		jbe	short loc_1870
		jmp	loc_17CC

loc_1870:
		mov	ax, di

loc_1872:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
CRT_Doprnt_Dispatch		endp

; START OF FUNCTION CHUNK FOR CRT_Doprnt_Dispatch
word_1878	dw 0
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
off_1898	dw offset loc_17EB
		dw offset loc_17F4
		dw offset loc_17FC
		dw offset loc_1804
		dw offset loc_180C
		dw offset loc_1814
		dw offset loc_181C
		dw offset loc_1826
		dw offset loc_1830
		dw offset loc_183A
		dw offset loc_1844
		dw offset loc_184E
		dw offset loc_17FC
		dw offset loc_1804
		dw offset loc_180C
		dw offset loc_1814
; END OF FUNCTION CHUNK FOR CRT_Doprnt_Dispatch

; ----------------------------------------------------------------------

sub_18B8		proc near
		mov	al, dh
		call	sub_18BF
		mov	al, dl
sub_18B8		endp

; ----------------------------------------------------------------------

sub_18BF		proc near
		aam	10h
		xchg	al, ah
		call	sub_18C8
		xchg	al, ah
sub_18BF		endp

; ----------------------------------------------------------------------

sub_18C8		proc near
		add	al, 90h
		daa
		adc	al, 40h
		daa
		stosb
		ret
sub_18C8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_18D0		proc near

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
		jmp	short loc_1930
sub_18D0		endp

; ----------------------------------------------------------------------

sub_18EA		proc near
		push	di
		mov	cx, 0FFFFh
		xor	al, al
		repne scasb
		not	cx
		dec	cx
		pop	di
		ret
sub_18EA		endp

; ----------------------------------------------------------------------

sub_18F7		proc near
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp-14h]
		jnz	short loc_192F
sub_18F7		endp

; ----------------------------------------------------------------------

sub_1900		proc near
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
		jnz	short loc_191F
		mov	word ptr [bp-16h], 1

loc_191F:
		mov	word ptr [bp-14h], 50h
		add	[bp-12h], di
		lea	di, [bp-96h]
		pop	es
		pop	dx
		pop	cx
		pop	bx

loc_192F:
		ret

loc_1930:
		push	es
		cld
		lea	di, [bp-96h]
		mov	[bp-4], di

loc_1939:
		mov	di, [bp-4]

loc_193C:
		mov	si, [bp+6]

loc_193F:
		lodsb
		or	al, al
		jz	short loc_1956
		cmp	al, 25h
		jz	short loc_1959

loc_1948:
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp-14h]
		jg	short loc_193F
		call	sub_1900
		jmp	short loc_193F

loc_1956:
		jmp	loc_1D33

loc_1959:
		mov	[bp-10h], si
		lodsb
		cmp	al, 25h
		jz	short loc_1948
		mov	[bp-4], di
		xor	cx, cx
		mov	[bp-0Eh], cx
		mov	[bp-2], cx
		mov	[bp-0Bh], cl
		mov	word ptr [bp-8], 0FFFFh
		mov	word ptr [bp-0Ah], 0FFFFh
		jmp	short loc_197C

loc_197B:
		lodsb

loc_197C:
		xor	ah, ah
		mov	dx, ax
		mov	bx, ax
		sub	bl, 20h
		cmp	bl, 60h
		jnb	short loc_199D
		mov	bl, [bx+5DDBh]
		cmp	bx, 17h
		jbe	short loc_1996
		jmp	loc_1D23

loc_1996:
		shl	bx, 1
		jmp	cs:off_1D53[bx]	; switch jump

loc_199D:
		jmp	loc_1D23

loc_19A0:
		cmp	ch, 0
		ja	short loc_199D
		or	word ptr [bp-2], 1
		jmp	short loc_197B

loc_19AB:
		cmp	ch, 0
		ja	short loc_199D
		or	word ptr [bp-2], 2
		jmp	short loc_197B

loc_19B6:
		cmp	ch, 0
		ja	short loc_199D
		cmp	byte ptr [bp-0Bh], 2Bh
		jz	short loc_19C4
		mov	[bp-0Bh], dl

loc_19C4:
		jmp	short loc_197B

loc_19C6:
		and	word ptr [bp-2], 0FFDFh
		jmp	short loc_19D0

loc_19CC:
		or	word ptr [bp-2], 20h

loc_19D0:
		mov	ch, 5
		jmp	short loc_197B

loc_19D4:
		cmp	ch, 0
		ja	short loc_1A26
		test	word ptr [bp-2], 2
		jnz	short loc_1A09
		or	word ptr [bp-2], 8
		mov	ch, 1
		jmp	short loc_197B

loc_19E8:
		jmp	loc_1D23

loc_19EB:
		mov	di, [bp+4]
		mov	ax, ss:[di]
		add	word ptr [bp+4], 2
		cmp	ch, 2
		jnb	short loc_1A0C
		or	ax, ax
		jns	short loc_1A04
		neg	ax
		or	word ptr [bp-2], 2

loc_1A04:
		mov	[bp-8], ax
		mov	ch, 3

loc_1A09:
		jmp	loc_197B

loc_1A0C:
		cmp	ch, 4
		jnz	short loc_19E8
		mov	[bp-0Ah], ax
		inc	ch
		jmp	loc_197B

loc_1A19:
		cmp	ch, 4
		jnb	short loc_19E8
		mov	ch, 4
		inc	word ptr [bp-0Ah]
		jmp	loc_197B

loc_1A26:
		xchg	dx, ax
		sub	al, 30h
		cbw
		cmp	ch, 2
		ja	short loc_1A48
		mov	ch, 2
		xchg	[bp-8], ax
		or	ax, ax
		jl	short loc_1A09
		shl	ax, 1
		mov	dx, ax
		shl	ax, 1
		shl	ax, 1
		add	ax, dx
		add	[bp-8], ax
		jmp	loc_197B

loc_1A48:
		cmp	ch, 4
		jnz	short loc_19E8
		xchg	[bp-0Ah], ax
		or	ax, ax
		jz	short loc_1A09
		shl	ax, 1
		mov	dx, ax
		shl	ax, 1
		shl	ax, 1
		add	ax, dx
		add	[bp-0Ah], ax
		jmp	loc_197B

loc_1A64:
		or	word ptr [bp-2], 10h
		jmp	loc_19D0

loc_1A6B:
		or	word ptr [bp-2], 100h

loc_1A70:
		and	word ptr [bp-2], 0FFEFh
		jmp	loc_19D0

loc_1A77:
		mov	bh, 8
		jmp	short loc_1A85

loc_1A7B:
		mov	bh, 0Ah
		jmp	short loc_1A89

loc_1A7F:
		mov	bh, 10h
		mov	bl, 0E9h
		add	bl, dl

loc_1A85:
		mov	byte ptr [bp-0Bh], 0

loc_1A89:
		mov	[bp-5], dl
		xor	dx, dx
		mov	[bp-6], dl
		mov	di, [bp+4]
		mov	ax, ss:[di]
		jmp	short loc_1AA9

loc_1A99:
		mov	bh, 0Ah
		mov	byte ptr [bp-6], 1
		mov	[bp-5], dl
		mov	di, [bp+4]
		mov	ax, ss:[di]
		cwd

loc_1AA9:
		inc	di
		inc	di
		mov	[bp+6], si
		test	word ptr [bp-2], 10h
		jz	short loc_1ABA
		mov	dx, ss:[di]
		inc	di
		inc	di

loc_1ABA:
		mov	[bp+4], di
		lea	di, [bp-45h]
		or	ax, ax
		jnz	short loc_1AD6
		or	dx, dx
		jnz	short loc_1AD6
		cmp	word ptr [bp-0Ah], 0
		jnz	short loc_1ADA
		mov	byte ptr ss:[di], 0
		mov	ax, di
		jmp	short loc_1AE9

loc_1AD6:
		or	word ptr [bp-2], 4

loc_1ADA:
		push	dx
		push	ax
		push	di
		mov	al, bh
		cbw
		push	ax
		mov	al, [bp-6]
		push	ax
		push	bx
		call	sub_654

loc_1AE9:
		push	ss
		pop	es
		mov	dx, [bp-0Ah]
		or	dx, dx
		jge	short loc_1AF5
		jmp	loc_1BE7

loc_1AF5:
		jmp	loc_1BF5

loc_1AF8:
		mov	[bp-5], dl
		mov	[bp+6], si
		lea	di, [bp-46h]
		mov	bx, [bp+4]
		push	word ptr ss:[bx]
		inc	bx
		inc	bx
		mov	[bp+4], bx
		test	word ptr [bp-2], 20h
		jz	short loc_1B23
		mov	dx, ss:[bx]
		inc	bx
		inc	bx
		mov	[bp+4], bx
		push	ss
		pop	es
		call	sub_18B8
		mov	al, 3Ah
		stosb

loc_1B23:
		push	ss
		pop	es
		pop	dx
		call	sub_18B8
		mov	byte ptr ss:[di], 0
		mov	byte ptr [bp-6], 0
		and	word ptr [bp-2], 0FFFBh
		lea	cx, [bp-46h]
		sub	di, cx
		xchg	di, cx
		mov	dx, [bp-0Ah]
		cmp	dx, cx
		jg	short loc_1B45
		mov	dx, cx

loc_1B45:
		jmp	loc_1BE7

loc_1B48:
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
		jmp	loc_1C2A

loc_1B68:
		mov	[bp+6], si
		mov	[bp-5], dl
		mov	di, [bp+4]
		test	word ptr [bp-2], 20h
		jnz	short loc_1B85
		mov	di, ss:[di]
		add	word ptr [bp+4], 2
		push	ds
		pop	es
		or	di, di
		jmp	short loc_1B90

loc_1B85:
		les	di, ss:[di]
		add	word ptr [bp+4], 4
		mov	ax, es
		or	ax, di

loc_1B90:
		jnz	short loc_1B97
		push	ds
		pop	es
		mov	di, 5DD4h

loc_1B97:
		call	sub_18EA
		cmp	cx, [bp-0Ah]
		jbe	short loc_1BA2
		mov	cx, [bp-0Ah]

loc_1BA2:
		jmp	loc_1C2A

loc_1BA5:
		mov	[bp+6], si
		mov	[bp-5], dl
		mov	di, [bp+4]
		mov	cx, [bp-0Ah]
		or	cx, cx
		jge	short loc_1BB8
		mov	cx, 6

loc_1BB8:
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
		jz	short loc_1BD7
		mov	ax, 8
		add	word ptr [bp+4], 0Ah
		jmp	short loc_1BDE

loc_1BD7:
		add	word ptr [bp+4], 8
		mov	ax, 6

loc_1BDE:
		push	ax
		call	sub_1FA7
		push	ss
		pop	es
		lea	di, [bp-45h]

loc_1BE7:
		test	word ptr [bp-2], 8
		jz	short loc_1C06
		mov	dx, [bp-8]
		or	dx, dx
		jle	short loc_1C06

loc_1BF5:
		call	sub_18EA
		cmp	byte ptr es:[di], 2Dh
		jnz	short loc_1BFF
		dec	cx

loc_1BFF:
		sub	dx, cx
		jle	short loc_1C06
		mov	[bp-0Eh], dx

loc_1C06:
		cmp	byte ptr es:[di], 2Dh
		jz	short loc_1C17
		mov	al, [bp-0Bh]
		or	al, al
		jz	short loc_1C27
		dec	di
		mov	es:[di], al

loc_1C17:
		cmp	word ptr [bp-0Eh], 0
		jle	short loc_1C27
		mov	cx, [bp-0Ah]
		or	cx, cx
		jge	short loc_1C27
		dec	word ptr [bp-0Eh]

loc_1C27:
		call	sub_18EA

loc_1C2A:
		mov	si, di
		mov	di, [bp-4]
		mov	bx, [bp-8]
		mov	ax, 5
		and	ax, [bp-2]
		cmp	ax, 5
		jnz	short loc_1C50
		mov	ah, [bp-5]
		cmp	ah, 6Fh
		jnz	short loc_1C52
		cmp	word ptr [bp-0Eh], 0
		jg	short loc_1C50
		mov	word ptr [bp-0Eh], 1

loc_1C50:
		jmp	short loc_1C6D

loc_1C52:
		cmp	ah, 78h
		jz	short loc_1C5C
		cmp	ah, 58h
		jnz	short loc_1C6D

loc_1C5C:
		or	word ptr [bp-2], 40h
		dec	bx
		dec	bx
		sub	word ptr [bp-0Eh], 2
		jge	short loc_1C6D
		mov	word ptr [bp-0Eh], 0

loc_1C6D:
		add	cx, [bp-0Eh]
		test	word ptr [bp-2], 2
		jnz	short loc_1C83
		jmp	short loc_1C7F

loc_1C79:
		mov	al, 20h
		call	sub_18F7
		dec	bx

loc_1C7F:
		cmp	bx, cx
		jg	short loc_1C79

loc_1C83:
		test	word ptr [bp-2], 40h
		jz	short loc_1C95
		mov	al, 30h
		call	sub_18F7
		mov	al, [bp-5]
		call	sub_18F7

loc_1C95:
		mov	dx, [bp-0Eh]
		or	dx, dx
		jle	short loc_1CC3
		sub	cx, dx
		sub	bx, dx
		mov	al, es:[si]
		cmp	al, 2Dh
		jz	short loc_1CAF
		cmp	al, 20h
		jz	short loc_1CAF
		cmp	al, 2Bh
		jnz	short loc_1CB6

loc_1CAF:
		lodsb
		call	sub_18F7
		dec	cx
		dec	bx

loc_1CB6:
		xchg	dx, cx
		jcxz	short loc_1CC1

loc_1CBA:
		mov	al, 30h
		call	sub_18F7
		loop	short loc_1CBA

loc_1CC1:
		xchg	dx, cx

loc_1CC3:
		jcxz	short loc_1CD7
		sub	bx, cx

loc_1CC7:
		lodsb
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp-14h]
		jg	short loc_1CD5
		call	sub_1900

loc_1CD5:
		loop	short loc_1CC7

loc_1CD7:
		or	bx, bx
		jle	short loc_1CE4
		mov	cx, bx

loc_1CDD:
		mov	al, 20h
		call	sub_18F7
		loop	short loc_1CDD

loc_1CE4:
		jmp	loc_193C

loc_1CE7:
		mov	[bp+6], si
		mov	di, [bp+4]
		test	word ptr [bp-2], 20h
		jnz	short loc_1CFF
		mov	di, ss:[di]
		add	word ptr [bp+4], 2
		push	ds
		pop	es
		jmp	short loc_1D06

loc_1CFF:
		les	di, ss:[di]
		add	word ptr [bp+4], 4

loc_1D06:
		mov	ax, 50h
		sub	al, [bp-14h]
		add	ax, [bp-12h]
		mov	es:[di], ax
		test	word ptr [bp-2], 10h
		jz	short loc_1D20
		inc	di
		inc	di
		mov	word ptr es:[di], 0

loc_1D20:
		jmp	loc_1939

loc_1D23:
		mov	si, [bp-10h]
		mov	di, [bp-4]
		mov	al, 25h

loc_1D2B:
		call	sub_18F7
		lodsb
		or	al, al
		jnz	short loc_1D2B

loc_1D33:
		cmp	byte ptr [bp-14h], 50h
		jge	short loc_1D3C
		call	sub_1900

loc_1D3C:
		pop	es
		cmp	word ptr [bp-16h], 0
		jz	short loc_1D48
		mov	ax, 0FFFFh
		jmp	short loc_1D4B

loc_1D48:
		mov	ax, [bp-12h]

loc_1D4B:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret	8
sub_1900		endp

; START OF FUNCTION CHUNK FOR sub_1900
off_1D53	dw offset loc_19B6
		dw offset loc_19A0
		dw offset loc_19EB
		dw offset loc_19AB
		dw offset loc_1A19
		dw offset loc_1A26
		dw offset loc_1A64
		dw offset loc_1A6B
		dw offset loc_1A70
		dw offset loc_19D4
		dw offset loc_1A99
		dw offset loc_1A77
		dw offset loc_1A7B
		dw offset loc_1A7F
		dw offset loc_1AF8
		dw offset loc_1BA5
		dw offset loc_1B48
		dw offset loc_1B68
		dw offset loc_1CE7
		dw offset loc_1D23
		dw offset loc_1D23
		dw offset loc_1D23
		dw offset loc_19C6
		dw offset loc_19CC
		mov	dx, 5E3Ch
		jmp	short loc_1D8B
		mov	dx, 5E41h

loc_1D8B:
		mov	cx, 5
		mov	ah, 40h
		mov	bx, 2
		int	21h
		mov	cx, 27h
		mov	dx, 5E46h
		mov	ah, 40h
		int	21h
		jmp	sub_315
; END OF FUNCTION CHUNK FOR sub_1900

; ----------------------------------------------------------------------

sub_1DA2		proc near
		ret
sub_1DA2		endp

; ----------------------------------------------------------------------

sub_1DA3		proc near
		pushf
		cli
		mov	al, 0
		out	43h, al
		call	sub_1DA2
		in	al, 40h
		mov	bl, al
		call	sub_1DA2
		in	al, 40h
		mov	bh, al
		not	bx
		popf
		mov	ax, bx
		ret
sub_1DA3		endp

; ----------------------------------------------------------------------

sub_1DBD		proc far
		push	si
		xor	si, si

loc_1DC0:
		call	sub_1DA3
		test	ax, 1
		jnz	short loc_1DD6
		mov	word_4E850, 0
		mov	word_4E84E, 4A9h
		jmp	short loc_1DDC

loc_1DD6:
		inc	si
		cmp	si, 64h
		jl	short loc_1DC0

loc_1DDC:
		pop	si
		retf
sub_1DBD		endp

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
		call	sub_1DA3
		mov	si, ax
		xor	dx, dx
		mov	bx, [bp+arg_0]
		xor	cx, cx
		push	ax
		push	dx
		mov	dx, word_4E850
		mov	ax, word_4E84E
		call	sub_7CE
		pop	bx
		pop	cx
		add	cx, ax
		adc	bx, dx
		mov	[bp+var_2], bx
		mov	[bp+var_4], cx
		jmp	short loc_1E27

loc_1E0B:
		cmp	bx, si
		jnb	short loc_1E25
		cmp	[bp+var_2], 1
		ja	short loc_1E1D
		jb	short loc_1E3A
		cmp	[bp+var_4], 0
		jb	short loc_1E3A

loc_1E1D:
		sub	[bp+var_4], 0
		sbb	[bp+var_2], 1

loc_1E25:
		mov	si, bx

loc_1E27:
		call	sub_1DA3
		mov	bx, ax
		xor	dx, dx
		cmp	dx, [bp+var_2]
		jb	short loc_1E0B
		jnz	short loc_1E3A
		cmp	ax, [bp+var_4]
		jb	short loc_1E0B

loc_1E3A:
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
		call	near ptr sub_E77
		pop	cx
		lea	ax, [bp+var_8]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_1E67
		add	sp, 8
		mov	sp, bp
		pop	bp
		retf
CRT_InstallProtectedHandler		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E67		proc far

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
		jb	short loc_1EA5
		cmp	al, 26h
		ja	short loc_1EA5
		mov	byte ptr [bp+var_B], 36h
		mov	[bp+var_A], 68Fh
		mov	[bp+var_8], cx
		mov	[bp+var_6], 0CB5Dh

loc_1EA5:
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
		jz	short loc_1EFD
		push	ax
		push	ax
		call	sub_5D0
		pop	ax

loc_1EFD:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_1E67		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F03		proc far

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
		jb	short loc_1F4A
		cmp	al, 26h
		ja	short loc_1F4A
		mov	[bp+var_D], 36h
		mov	[bp+var_C], 68Fh
		mov	[bp+var_A], cx
		mov	[bp+var_8], 0CAh
		mov	[bp+var_7], 2
		jmp	short loc_1F53
sub_1F03		endp

; ----------------------------------------------------------------------

sub_1F49		proc far
		iret

loc_1F4A:
		mov	byte ptr [bp-0Dh], 0CAh
		mov	word ptr [bp-0Ch], 2

loc_1F53:
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
		call	near ptr sub_1F49
		pop	ds
		pop	bp
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_1F49		endp

; ----------------------------------------------------------------------

sub_1FA7		proc near
		jmp	word ptr word_4E8AA
sub_1FA7		endp

; ----------------------------------------------------------------------

sub_1FAB		proc near
		jmp	word ptr word_4E8AC
sub_1FAB		endp

; ----------------------------------------------------------------------

sub_1FAF		proc near
		jmp	word ptr word_4E8AE
sub_1FAF		endp

; ----------------------------------------------------------------------

sub_1FB3		proc near
		jmp	word ptr word_4E8B0
sub_1FB3		endp

; START OF FUNCTION CHUNK FOR sub_1FB3
		add	[bx+si], al
		pop	word_4E856
		pop	word_4E858
		pop	word_4E85A
		mov	cs:1FB7h, ds
		mov	word_4E85C, si
		mov	word_4E85E, di
		cld
		mov	es, word_48B44
		mov	si, 80h
		xor	ah, ah
		lodsb
		inc	ax
		mov	bp, es
		xchg	si, dx
		xchg	bx, ax
		mov	si, word_48B3E
		inc	si
		inc	si
		mov	cx, 1
		cmp	byte ptr word_48B46, 3
		jb	short loc_2005
		mov	es, word_48B40
		mov	di, si
		mov	cl, 7Fh
		xor	al, al
		repne scasb
		jcxz	short loc_2074
		xor	cl, 7Fh

loc_2005:
		push	ax
		mov	ax, cx
		add	ax, bx
		inc	ax
		and	ax, 0FFFEh
		mov	di, sp
		sub	di, ax
		jb	short loc_2074
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

loc_202C:
		call	loc_204C
		ja	short loc_203C

loc_2031:
		jb	short loc_2079
		cmp	al, 0Dh
		jz	short loc_2048
		call	loc_204C
		ja	short loc_2031

loc_203C:
		cmp	al, 20h
		jz	short loc_2048
		cmp	al, 0Dh
		jz	short loc_2048
		cmp	al, 9
		jnz	short loc_202C

loc_2048:
		xor	al, al
		jmp	short loc_202C
		or	ax, ax
		jz	short loc_2057
		inc	dx
		stosb
		or	al, al
		jnz	short loc_2057
		inc	bx

loc_2057:
		xchg	al, ah
		xor	al, al
		stc
		jcxz	short loc_2073
		lodsb
		dec	cx
		sub	al, 22h
		jz	short loc_2073
		add	al, 22h
		cmp	al, 5Ch
		jnz	short loc_2071
		cmp	byte ptr [si], 22h
		jnz	short loc_2071
		lodsb
		dec	cx

loc_2071:
		or	si, si

loc_2073:
		ret

loc_2074:
		nop
		nop
		jmp	sub_315

loc_2079:
		pop	cx
		add	cx, dx
		mov	ds, cs:1FB7h
		mov	word_4E852, bx
		inc	bx
		add	bx, bx
		mov	si, sp
		mov	bp, sp
		sub	bp, bx
		jb	short loc_2074
		mov	sp, bp
		mov	word_4E854, bp

loc_2096:
		jcxz	short loc_20A6
		mov	[bp], si
		add	bp, 2

loc_209E:
		lodsb
		or	al, al
		loopne	short loc_209E
		jz	short loc_2096

loc_20A6:
		xor	ax, ax
		mov	[bp], ax
		mov	ds, cs:1FB7h
		mov	si, word_4E85C
		mov	di, word_4E85E
		push	word_4E85A
		push	word_4E858
		mov	ax, word_4E852
		mov	word_48B38, ax
		mov	ax, word_4E854
		mov	word_48B3A, ax
		jmp	word ptr word_4E856
		push	si
		push	di
		mov	cx, word_48B3E
		push	cx
		call	sub_32FCF
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2107
		push	ds
		push	ds
		pop	es
		mov	ds, word_48B40
		xor	si, si
		cld
		rep movsb
		pop	ds
		mov	di, ax
		push	es
		push	word_48B42
		call	sub_32FCF
		pop	bx
		mov	bx, ax
		pop	es
		mov	word_4E860, ax
		or	ax, ax
		jnz	short loc_210C

loc_2107:
		nop
		nop
		jmp	sub_315

loc_210C:
		xor	ax, ax
		mov	cx, 0FFFFh
		cmp	byte ptr [di], 0
		jz	short loc_2122

loc_2116:
		mov	[bx], di
		add	bx, 2
		repne scasb
		cmp	es:[di], al
		jnz	short loc_2116

loc_2122:
		mov	[bx], ax
		pop	di
		pop	si
		mov	ax, word_4E860
		mov	word_48B3C, ax
		ret
; END OF FUNCTION CHUNK FOR sub_1FB3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à PC_SoundOn (sub_1C57 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à PC_SoundOn (sub_1F18 de
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
		jnb	short loc_2157
		div	bx
		mov	bx, ax
		in	al, 61h
		test	al, 3
		jnz	short loc_214F
		or	al, 3
		out	61h, al
		mov	al, 0B6h
		out	43h, al

loc_214F:
		mov	al, bl
		out	42h, al
		mov	al, bh
		out	42h, al

loc_2157:
		pop	bp
		retf
PC_SoundOn		endp

; ----------------------------------------------------------------------

sub_2159		proc far
		in	al, 61h
		and	al, 0FCh
		out	61h, al
		retf
sub_2159		endp

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
		jz	short loc_2191
		test	[bp+arg_2], 2
		jz	short loc_2184
		test	dx, 1
		jnz	short loc_2188

loc_2184:
		xor	ax, ax
		jmp	short loc_2191

loc_2188:
		mov	word_48B48, 5
		mov	ax, 0FFFFh

loc_2191:
		pop	bp
		retf
CRT_Write_TextMode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2193		proc far

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
		mov	di, 5A7Bh

loc_21A8:
		mov	bl, [si]
		inc	si
		test	byte ptr [bx+di], 1
		jnz	short loc_21A8
		mov	bp, 0
		cmp	bl, 2Bh
		jz	short loc_21BE
		cmp	bl, 2Dh
		jnz	short loc_21C1
		inc	bp

loc_21BE:
		mov	bl, [si]
		inc	si

loc_21C1:
		cmp	bl, 39h
		ja	short loc_21F4
		sub	bl, 30h
		jb	short loc_21F4
		mul	cx
		add	ax, bx
		adc	dl, dh
		jz	short loc_21BE
		jmp	short loc_21E7

loc_21D5:
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

loc_21E7:
		mov	bl, [si]
		inc	si
		cmp	bl, 39h
		ja	short loc_21F4
		sub	bl, 30h
		jnb	short loc_21D5

loc_21F4:
		dec	bp
		jl	short loc_21FE
		neg	dx
		neg	ax
		sbb	dx, 0

loc_21FE:
		pop	bp
		pop	di
		pop	si
		pop	bp
		retf
sub_2193		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2203		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_2193
		pop	cx
		pop	bp
		retf
sub_2203		endp

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
		jb	short loc_2225
		xchg	cx, ax
		jmp	short loc_2229

loc_2225:
		push	ax
		call	sub_5D0

loc_2229:
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
		jnz	short loc_223E
		nop
		push	cs
		call	near ptr sub_230C
		jmp	short loc_22A6

loc_223E:
		cmp	[di+0Eh], di
		jz	short loc_2248

loc_2243:
		mov	ax, 0FFFFh
		jmp	short loc_22A8

loc_2248:
		cmp	word ptr [di], 0
		jl	short loc_2276
		test	word ptr [di+2], 8
		jnz	short loc_225E
		mov	ax, di
		add	ax, 5
		cmp	[di+0Ah], ax
		jnz	short loc_22A6

loc_225E:
		mov	word ptr [di], 0
		mov	ax, di
		add	ax, 5
		cmp	[di+0Ah], ax
		jnz	short loc_22A6
		mov	ax, [di+8]
		mov	[di+0Ah], ax
		jmp	short loc_22A6
		jmp	short loc_22A6

loc_2276:
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
		jz	short loc_22A6
		test	word ptr [di+2], 200h
		jnz	short loc_22A6
		or	word ptr [di+2], 10h
		jmp	short loc_2243

loc_22A6:
		xor	ax, ax

loc_22A8:
		pop	di
		pop	si
		pop	bp
		retf
Stdio_Fflush		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22AC		proc far

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
		jb	short loc_22D9
		xor	ax, ax
		jmp	short loc_22DD

loc_22D9:
		push	bx
		call	sub_5D0

loc_22DD:
		pop	bp
		retf
sub_22AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22DF		proc far

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
		jb	short loc_2306
		xor	ax, ax
		jmp	short loc_230A

loc_2306:
		push	bx
		call	sub_5D0

loc_230A:
		pop	bp
		retf
sub_22DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_230C		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	[bp+var_2], 0
		mov	di, word_4E6A8
		mov	si, 5B88h
		jmp	short loc_2336

loc_2322:
		test	word ptr [si+2], 3
		jz	short loc_2333
		push	si
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		inc	[bp+var_2]

loc_2333:
		add	si, 10h

loc_2336:
		mov	ax, di
		dec	di
		or	ax, ax
		jnz	short loc_2322
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_230C		endp

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
		jnz	short loc_2356

loc_2352:
		xor	ax, ax
		jmp	short loc_237B

loc_2356:
		push	di
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2352
		push	di
		push	si
		push	[bp+arg_2]
		call	sub_280C
		or	ax, ax
		jz	short loc_2378
		mov	bx, si
		mov	al, [bx+di-1]
		mov	ah, 0
		jmp	short loc_237B

loc_2378:
		mov	ax, 0FFFFh

loc_237B:
		pop	di
		pop	si
		pop	bp
		retf
CRT_Strrchr_Like		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_237F		proc far

saved_4		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+saved_4]
		cmp	word ptr [si], 0
		jge	short loc_2396
		mov	dx, [si+6]
		add	dx, [si]
		inc	dx
		mov	di, dx
		jmp	short loc_23A1

loc_2396:
		mov	ax, [si]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	dx, ax
		mov	di, ax

loc_23A1:
		test	word ptr [si+2], 40h
		jnz	short loc_23D4
		mov	cx, [si+0Ah]
		cmp	word ptr [si], 0
		jge	short loc_23CD
		jmp	short loc_23BB

loc_23B2:
		dec	cx
		mov	bx, cx
		cmp	byte ptr [bx], 0Ah
		jnz	short loc_23BB
		inc	di

loc_23BB:
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_23B2
		jmp	short loc_23D4

loc_23C4:
		mov	bx, cx
		inc	cx
		cmp	byte ptr [bx], 0Ah
		jnz	short loc_23CD
		inc	di

loc_23CD:
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_23C4

loc_23D4:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		ret	2
sub_237F		endp

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
		jz	short loc_23F7
		mov	ax, 0FFFFh
		jmp	short loc_2440

loc_23F7:
		cmp	di, 1
		jnz	short loc_240C
		cmp	word ptr [si], 0
		jle	short loc_240C
		push	si
		call	near ptr sub_237F
		cwd
		sub	[bp+arg_2], ax
		sbb	[bp+arg_4], dx

loc_240C:
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
		jnz	short loc_243E
		cmp	ax, 0FFFFh
		jnz	short loc_243E
		mov	ax, 0FFFFh
		jmp	short loc_2440

loc_243E:
		xor	ax, ax

loc_2440:
		pop	di
		pop	si
		pop	bp
		retf
Stdio_WriteTextMode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2444		proc far

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
		jnz	short loc_2478
		cmp	ax, 0FFFFh
		jnz	short loc_2478
		jmp	loc_2500

loc_2478:
		cmp	word ptr [si], 0
		jge	short loc_24F5
		mov	al, [si+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+5CCAh], 800h
		jz	short loc_24E8
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
		jnz	short loc_24B4
		cmp	ax, 0FFFFh
		jz	short loc_2506

loc_24B4:
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
		jnz	short loc_24DC
		cmp	ax, 0FFFFh
		jnz	short loc_24DC
		mov	dx, 0FFFFh
		mov	ax, 0FFFFh
		jmp	short loc_2506

loc_24DC:
		mov	ax, [bp+var_6]
		mov	dx, [bp+var_8]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx

loc_24E8:
		push	si
		call	near ptr sub_237F
		cwd
		add	[bp+var_4], ax
		adc	[bp+var_2], dx
		jmp	short loc_2500

loc_24F5:
		push	si
		call	near ptr sub_237F
		cwd
		sub	[bp+var_4], ax
		sbb	[bp+var_2], dx

loc_2500:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_2506:
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_2444		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_250B		proc far

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
		jz	short loc_2536
		mov	al, 0
		mov	ah, [di]
		mov	cx, 0FFFFh
		cld
		repne scasb
		not	cx
		dec	cx
		jz	short loc_2536
		mov	di, word_4E860
		or	di, di
		mov	[bp+var_2], di
		jnz	short loc_2541

loc_2536:
		xor	ax, ax
		jmp	short loc_2564

loc_253A:
		add	[bp+var_2], 2
		mov	di, [bp+var_2]

loc_2541:
		mov	di, [di]
		or	di, di
		jz	short loc_2536
		mov	al, [di]
		or	al, al
		jz	short loc_2536
		cmp	ah, al
		jnz	short loc_253A
		mov	bx, cx
		cmp	byte ptr [bx+di], 3Dh
		jnz	short loc_253A
		mov	si, [bp+arg_0]
		repe cmpsb
		xchg	bx, cx
		jnz	short loc_253A
		inc	di
		mov	ax, di

loc_2564:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_250B		endp

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
		jnz	short loc_257D
		mov	ax, bx
		cwd
		jmp	short loc_2581

loc_257D:
		mov	ax, bx
		xor	dx, dx

loc_2581:
		push	dx
		push	ax
		push	[bp+arg_2]
		push	cx
		mov	al, 1
		push	ax
		mov	al, 61h
		push	ax
		call	sub_654
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
		call	sub_654
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
		jnz	short loc_25C6
		mov	ax, 1
		jmp	short loc_25C8

loc_25C6:
		xor	ax, ax

loc_25C8:
		push	ax
		mov	al, 61h
		push	ax
		call	sub_654
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
		jnb	short loc_25E9
		movsb

loc_25E9:
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
		jz	short loc_260C
		jcxz	short loc_2613
		stosb
		dec	cx

loc_260C:
		shr	cx, 1
		rep stosw
		jnb	short loc_2613
		stosb

loc_2613:
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

sub_2631		proc far

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
		jnb	short loc_2646
		std
		mov	ax, 1
		jmp	short loc_2649

loc_2646:
		cld
		xor	ax, ax

loc_2649:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cx, [bp+arg_4]
		or	ax, ax
		jz	short loc_265C
		add	si, cx
		dec	si
		add	di, cx
		dec	di

loc_265C:
		test	di, 1
		jz	short loc_2666
		jcxz	short loc_2675
		movsb
		dec	cx

loc_2666:
		sub	si, ax
		sub	di, ax
		shr	cx, 1
		rep movsw
		jnb	short loc_2675
		add	si, ax
		add	di, ax
		movsb

loc_2675:
		cld
		pop	di
		pop	si
		pop	bp
		retf
sub_2631		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_267A		proc far

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
		call	near ptr sub_2631
		add	sp, 6
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_267A		endp

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
		mov	ax, 280Ch
		push	ax
		mov	ax, 5B98h
		push	ax
		push	[bp+arg_0]
		lea	ax, [bp+arg_2]
		push	ax
		call	sub_18D0
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
		mov	byte_4F86A, al
		cmp	word ptr [di], 0FFFFh
		jge	short loc_2713
		inc	word ptr [di]
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	[bx], al
		test	word ptr [di+2], 8
		jnz	short loc_26EB
		jmp	loc_27F1

loc_26EB:
		cmp	byte_4F86A, 0Ah
		jz	short loc_26FC
		cmp	byte_4F86A, 0Dh
		jz	short loc_26FC
		jmp	loc_27F1

loc_26FC:
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_270A
		jmp	loc_27F1

loc_270A:
		mov	ax, 0FFFFh
		jmp	loc_27F6
		jmp	loc_27F1

loc_2713:
		test	word ptr [di+2], 90h
		jnz	short loc_2721
		test	word ptr [di+2], 2
		jnz	short loc_2727

loc_2721:
		or	word ptr [di+2], 10h
		jmp	short loc_270A

loc_2727:
		or	word ptr [di+2], 100h
		cmp	word ptr [di+6], 0
		jz	short loc_277E
		cmp	word ptr [di], 0
		jz	short loc_2742
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_270A

loc_2742:
		mov	ax, [di+6]
		neg	ax
		mov	[di], ax
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	al, byte_4F86A
		mov	[bx], al
		test	word ptr [di+2], 8
		jnz	short loc_275E
		jmp	loc_27F1

loc_275E:
		cmp	byte_4F86A, 0Ah
		jz	short loc_276F
		cmp	byte_4F86A, 0Dh
		jz	short loc_276F
		jmp	loc_27F1

loc_276F:
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jz	short loc_27F1
		jmp	short loc_270A
		jmp	short loc_27F1

loc_277E:
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+5CCAh], 800h
		jz	short loc_27A5
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

loc_27A5:
		cmp	byte_4F86A, 0Ah
		jnz	short loc_27CD
		test	word ptr [di+2], 40h
		jnz	short loc_27CD
		mov	ax, 1
		push	ax
		mov	ax, 5E82h
		push	ax
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		cmp	ax, 1
		jnz	short loc_27E7

loc_27CD:
		mov	ax, 1
		push	ax
		mov	ax, 6E8Ah
		push	ax
		mov	al, [di+4]
		cbw
		push	ax
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		cmp	ax, 1
		jz	short loc_27F1

loc_27E7:
		test	word ptr [di+2], 200h
		jnz	short loc_27F1
		jmp	loc_2721

loc_27F1:
		mov	al, byte_4F86A
		mov	ah, 0

loc_27F6:
		pop	di
		pop	si
		pop	bp
		retf
Stdio_Putc		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27FA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 5B98h
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr Stdio_Putc
		pop	cx
		pop	cx
		pop	bp
		retf
sub_27FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_280C		proc near

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
		jz	short loc_284E
		jmp	short loc_2841

loc_2826:
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
		jnz	short loc_2841

loc_283C:
		xor	ax, ax
		jmp	loc_29AC

loc_2841:
		mov	ax, [bp+arg_2]
		dec	[bp+arg_2]
		or	ax, ax
		jnz	short loc_2826
		jmp	loc_29A9

loc_284E:
		test	word ptr [di+2], 40h
		jnz	short loc_2858
		jmp	loc_294A

loc_2858:
		cmp	word ptr [di+6], 0
		jnz	short loc_2861
		jmp	loc_2906

loc_2861:
		mov	ax, [di+6]
		cmp	ax, [bp+arg_2]
		jnb	short loc_28C1
		cmp	word ptr [di], 0
		jz	short loc_2879
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jnz	short loc_283C

loc_2879:
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+5CCAh], 800h
		jz	short loc_28A0
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

loc_28A0:
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
		jnz	short loc_28BB
		jmp	loc_29A9

loc_28BB:
		jmp	loc_283C
		jmp	loc_29A9

loc_28C1:
		mov	ax, [di]
		add	ax, [bp+arg_2]
		jl	short loc_28E5
		cmp	word ptr [di], 0
		jnz	short loc_28D7
		mov	ax, 0FFFFh
		sub	ax, [di+6]
		mov	[di], ax
		jmp	short loc_28E5

loc_28D7:
		push	di
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx
		or	ax, ax
		jz	short loc_28E5
		jmp	loc_283C

loc_28E5:
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
		jmp	loc_29A9

loc_2906:
		mov	al, [di+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	word ptr [bx+5CCAh], 800h
		jz	short loc_292D
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

loc_292D:
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
		jz	short loc_29A9
		jmp	loc_283C
		jmp	short loc_29A9

loc_294A:
		cmp	word ptr [di+6], 0
		jz	short loc_298E
		jmp	short loc_2982

loc_2952:
		inc	word ptr [di]
		jge	short loc_296A
		mov	bx, [di+0Ah]
		inc	word ptr [di+0Ah]
		mov	si, [bp+arg_4]
		inc	[bp+arg_4]
		mov	al, [si]
		mov	[bx], al
		mov	ah, 0
		jmp	short loc_297A

loc_296A:
		push	di
		mov	bx, [bp+arg_4]
		inc	[bp+arg_4]
		mov	al, [bx]
		push	ax
		push	cs
		call	near ptr Stdio_Ungetc
		pop	cx
		pop	cx

loc_297A:
		cmp	ax, 0FFFFh
		jnz	short loc_2982
		jmp	loc_283C

loc_2982:
		mov	ax, [bp+arg_2]
		dec	[bp+arg_2]
		or	ax, ax
		jnz	short loc_2952
		jmp	short loc_29A9

loc_298E:
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
		jz	short loc_29A9
		jmp	loc_283C

loc_29A9:
		mov	ax, [bp+var_2]

loc_29AC:
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		ret	6
sub_280C		endp

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
		jnz	short loc_29D0
		cmp	[bp+arg_4], 2
		jg	short loc_29D0
		cmp	di, 7FFFh
		jbe	short loc_29D6

loc_29D0:
		mov	ax, 0FFFFh
		jmp	loc_2A88

loc_29D6:
		cmp	word_4E866, 0
		jnz	short loc_29EB
		cmp	si, 5B98h
		jnz	short loc_29EB
		mov	word_4E866, 1
		jmp	short loc_29FE

loc_29EB:
		cmp	word_4E864, 0
		jnz	short loc_29FE
		cmp	si, 5B88h
		jnz	short loc_29FE
		mov	word_4E864, 1

loc_29FE:
		cmp	word ptr [si], 0
		jz	short loc_2A16
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

loc_2A16:
		test	word ptr [si+2], 4
		jz	short loc_2A26
		push	word ptr [si+8]
		call	sub_330E8
		pop	cx

loc_2A26:
		and	word ptr [si+2], 0FFF3h
		mov	word ptr [si+6], 0
		mov	ax, si
		add	ax, 5
		mov	[si+8], ax
		mov	[si+0Ah], ax
		cmp	[bp+arg_4], 2
		jz	short loc_2A86
		or	di, di
		jbe	short loc_2A86
		mov	word_4E55E, seg seg000
		mov	word ptr dword_4E55C, 3522h
		cmp	[bp+arg_2], 0
		jnz	short loc_2A70
		push	di
		call	sub_32FCF
		pop	cx
		mov	[bp+arg_2], ax
		or	ax, ax
		jnz	short loc_2A67
		jmp	loc_29D0

loc_2A67:
		or	word ptr [si+2], 4
		jmp	short loc_2A70
		jmp	loc_29D0

loc_2A70:
		mov	ax, [bp+arg_2]
		mov	[si+0Ah], ax
		mov	[si+8], ax
		mov	[si+6], di
		cmp	[bp+arg_4], 1
		jnz	short loc_2A86
		or	word ptr [si+2], 8

loc_2A86:
		xor	ax, ax

loc_2A88:
		pop	di
		pop	si
		pop	bp
		retf
Stdio_SetupFileStruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2A8C		proc far

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
sub_2A8C		endp

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
		mov	ax, 2A8Ch
		push	ax
		lea	ax, [bp+arg_0]
		push	ax
		push	[bp+arg_2]
		lea	ax, [bp+arg_4]
		push	ax
		call	sub_18D0
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
		mov	ax, 2A8Ch
		push	ax
		lea	ax, [bp+arg_0]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_4]
		call	sub_18D0
		pop	bp
		retf
CRT_Msg_Sprintf2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2AED		proc far

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
		jnz	short loc_2B05
		mov	ax, 0FFFFh
		jmp	short loc_2B09

loc_2B05:
		mov	al, dl
		mov	ah, 0

loc_2B09:
		pop	si
		pop	bp
		ret
sub_2AED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B0C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		dec	word ptr [si]
		pop	si
		pop	bp
		ret
sub_2B0C		endp

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
		mov	ax, 2B0Ch
		push	ax
		mov	ax, 2AEDh
		push	ax
		call	near ptr sub_832
		add	sp, 0Ah
		pop	bp
		retf
CRT_Msg_Sprintf3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B36		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	[bp+arg_2]
		lea	ax, [bp+arg_0]
		push	ax
		mov	ax, 2B0Ch
		push	ax
		mov	ax, 2AEDh
		push	ax
		call	near ptr sub_832
		add	sp, 0Ah
		pop	bp
		retf
sub_2B36		endp

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
		jz	short loc_2B80
		movsb
		dec	cx

loc_2B80:
		shr	cx, 1
		rep movsw
		jnb	short loc_2B87
		movsb

loc_2B87:
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
		jz	short loc_2BA6
		lodsb
		cmp	al, bl
		jz	short loc_2BBB
		and	al, al
		jz	short loc_2BB7

loc_2BA6:
		lodsw
		cmp	al, bl
		jz	short loc_2BBC
		and	al, al
		jz	short loc_2BB7
		cmp	ah, bl
		jz	short loc_2BBB
		and	ah, ah
		jnz	short loc_2BA6

loc_2BB7:
		xor	ax, ax
		jmp	short loc_2BBF

loc_2BBB:
		inc	si

loc_2BBC:
		lea	ax, [si-2]

loc_2BBF:
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
		call	sub_32FCF
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2C43
		push	[bp+var_2]
		push	si
		push	ax
		nop
		push	cs
		call	near ptr CRT_Memmove
		add	sp, 6

loc_2C43:
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

loc_2C62:
		lodsb
		mov	bl, [di]
		or	al, al
		jz	short loc_2C85
		scasb
		jz	short loc_2C62
		cmp	al, ch
		jb	short loc_2C76
		cmp	al, cl
		ja	short loc_2C76
		sub	al, 20h

loc_2C76:
		cmp	bl, ch
		jb	short loc_2C81
		cmp	bl, cl
		ja	short loc_2C81
		sub	bl, 20h

loc_2C81:
		cmp	al, bl
		jz	short loc_2C62

loc_2C85:
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
CRT_Strupr_2CA5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		cld
		mov	si, [bp+arg_0]
		mov	dx, si
		jmp	short loc_2CBC

loc_2CB1:
		sub	al, 41h
		cmp	al, 19h
		ja	short loc_2CBC
		add	al, 61h
		mov	[si-1], al

loc_2CBC:
		lodsb
		and	al, al
		jnz	short loc_2CB1
		xchg	dx, ax
		pop	si
		pop	bp
		retf
CRT_Strupr_2CA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CC5		proc far

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
		jbe	short loc_2CED
		mov	si, [bp+arg_4]

loc_2CED:
		push	si
		mov	ax, di
		add	ax, [bp+var_2]
		push	ax
		push	[bp+arg_2]
		nop
		push	cs
		call	near ptr sub_2631
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
sub_2CC5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D0F		proc far

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
		jcxz	short loc_2D42
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

loc_2D42:
		pop	di
		pop	si
		pop	bp
		retf
sub_2D0F		endp

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

sub_2D72		proc far

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
		jnz	short loc_2D8B
		mov	ax, 0FFFFh
		jmp	short loc_2D8D

loc_2D8B:
		mov	ax, dx

loc_2D8D:
		pop	si
		pop	bp
		ret
sub_2D72		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D90		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		dec	word ptr [si]
		pop	si
		pop	bp
		ret
sub_2D90		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D9C		proc far

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
		mov	word_48B48, 0
		jmp	short loc_2DBA

loc_2DB4:
		inc	[bp+arg_0]
		inc	[bp+var_2]

loc_2DBA:
		mov	bx, [bp+arg_0]
		mov	al, [bx]
		cbw
		mov	bx, ax
		mov	al, [bx+5A7Bh]
		cbw
		test	ax, 1
		jnz	short loc_2DB4
		mov	bx, [bp+arg_0]
		cmp	byte ptr [bx], 2Dh
		jnz	short loc_2DD9
		mov	ax, 1
		jmp	short loc_2DDB

loc_2DD9:
		xor	ax, ax

loc_2DDB:
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
		mov	ax, 2D90h
		push	ax
		mov	ax, 2D72h
		push	ax
		call	sub_CF8
		add	sp, 0Eh
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		cmp	[bp+var_4], 0
		jg	short loc_2E12
		mov	ax, [bp+var_2]
		sub	[bp+arg_0], ax
		jmp	short loc_2E5C

loc_2E12:
		cmp	[bp+var_4], 2
		jnz	short loc_2E20
		mov	word_48B48, 22h
		jmp	short loc_2E5C

loc_2E20:
		cmp	[bp+var_4], 1
		jnz	short loc_2E5C
		cmp	[bp+var_6], 0
		jl	short loc_2E39
		jnz	short loc_2E34
		cmp	[bp+var_8], 0
		jb	short loc_2E39

loc_2E34:
		mov	ax, 1
		jmp	short loc_2E3B

loc_2E39:
		xor	ax, ax

loc_2E3B:
		cmp	ax, di
		jnz	short loc_2E5C
		mov	word_48B48, 22h
		or	di, di
		jz	short loc_2E50
		mov	dx, 8000h
		xor	ax, ax
		jmp	short loc_2E56

loc_2E50:
		mov	dx, 7FFFh
		mov	ax, 0FFFFh

loc_2E56:
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax

loc_2E5C:
		or	si, si
		jz	short loc_2E65
		mov	ax, [bp+arg_0]
		mov	[si], ax

loc_2E65:
		mov	dx, [bp+var_6]
		mov	ax, [bp+var_8]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
sub_2D9C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_Strupr (sub_2B99 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far — met en majuscule en place
; (soustrait 0x20 sur plage a-z) : strupr().
; ==============================================================================================
CRT_Strupr_2E71		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		cld
		mov	si, [bp+arg_0]
		mov	dx, si
		jmp	short loc_2E88

loc_2E7D:
		sub	al, 61h
		cmp	al, 19h
		ja	short loc_2E88
		add	al, 41h
		mov	[si-1], al

loc_2E88:
		lodsb
		and	al, al
		jnz	short loc_2E7D
		xchg	dx, ax
		pop	si
		pop	bp
		retf
CRT_Strupr_2E71		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E91		proc far

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
		call	near ptr sub_317A
		mov	ax, word_4E894
		mov	dx, word_4E892
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
		call	sub_7CE
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
		call	sub_7CE
		add	[bp+var_4], ax
		adc	[bp+var_2], dx
		test	si, 3
		jz	short loc_2EFD
		add	[bp+var_4], 5180h
		adc	[bp+var_2], 1

loc_2EFD:
		xor	cx, cx
		mov	al, [di+3]
		cbw
		dec	ax
		mov	si, ax
		jmp	short loc_2F10

loc_2F08:
		dec	si
		mov	al, [si+5E88h]
		cbw
		add	cx, ax

loc_2F10:
		or	si, si
		jg	short loc_2F08
		mov	al, [di+2]
		cbw
		dec	ax
		add	cx, ax
		cmp	byte ptr [di+3], 2
		jle	short loc_2F28
		test	word ptr [di], 3
		jnz	short loc_2F28
		inc	cx

loc_2F28:
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
		cmp	word_4E896, 0
		jz	short loc_2F5C
		mov	al, [bx+1]
		mov	ah, 0
		push	ax
		push	cx
		xor	ax, ax
		push	ax
		mov	ax, [di]
		add	ax, 0F84Eh
		push	ax
		call	sub_32FB
		or	ax, ax
		jz	short loc_2F5C
		dec	si

loc_2F5C:
		mov	ax, si
		cwd
		push	ax
		push	dx
		xor	dx, dx
		mov	ax, 0E10h
		pop	cx
		pop	bx
		call	sub_7CE
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
		call	sub_7CE
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
sub_2E91		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2FAA		proc far

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
		call	near ptr sub_317A
		mov	ax, word_4E894
		mov	dx, word_4E892
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
		call	near ptr sub_531
		mov	[di+3], al
		xor	ax, ax
		mov	dx, 3Ch
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_522
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		xor	ax, ax
		mov	dx, 3Ch
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_531
		mov	[di], al
		xor	ax, ax
		mov	dx, 3Ch
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_522
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		xor	ax, ax
		mov	dx, 88F8h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_522
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
		call	near ptr sub_531
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		cmp	[bp+arg_2], 0
		jl	short loc_3094
		jnz	short loc_3061
		cmp	[bp+arg_0], 2250h
		jb	short loc_3094

loc_3061:
		sub	[bp+arg_0], 2250h
		sbb	[bp+arg_2], 0
		inc	word ptr [si]
		xor	ax, ax
		mov	dx, 2238h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_522
		add	[si], ax
		xor	ax, ax
		mov	dx, 2238h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_531
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax

loc_3094:
		cmp	word_4E896, 0
		jz	short loc_30D5
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_531
		push	ax
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_522
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, [si]
		add	ax, 0F84Eh
		push	ax
		call	sub_32FB
		or	ax, ax
		jz	short loc_30D5
		add	[bp+arg_0], 1
		adc	[bp+arg_2], 0

loc_30D5:
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	near ptr sub_531
		mov	[di+1], al
		xor	ax, ax
		mov	dx, 18h
		push	ax
		push	dx
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_522
		mov	[bp+arg_2], dx
		mov	[bp+arg_0], ax
		add	[bp+arg_0], 1
		adc	[bp+arg_2], 0
		test	word ptr [si], 3
		jnz	short loc_313A
		cmp	[bp+arg_2], 0
		jl	short loc_3124
		jg	short loc_311A
		cmp	[bp+arg_0], 3Ch
		jbe	short loc_3124

loc_311A:
		sub	[bp+arg_0], 1
		sbb	[bp+arg_2], 0
		jmp	short loc_313A

loc_3124:
		cmp	[bp+arg_2], 0
		jnz	short loc_313A
		cmp	[bp+arg_0], 3Ch
		jnz	short loc_313A
		mov	byte ptr [si+3], 2
		mov	byte ptr [si+2], 1Dh
		jmp	short loc_3176

loc_313A:
		mov	byte ptr [si+3], 0
		jmp	short loc_3155

loc_3140:
		mov	al, [si+3]
		cbw
		mov	bx, ax
		mov	al, [bx+5E88h]
		cbw
		cwd
		sub	[bp+arg_0], ax
		sbb	[bp+arg_2], dx
		inc	byte ptr [si+3]

loc_3155:
		mov	al, [si+3]
		cbw
		mov	bx, ax
		mov	al, [bx+5E88h]
		cbw
		cwd
		cmp	dx, [bp+arg_2]
		jl	short loc_3140
		jnz	short loc_316D
		cmp	ax, [bp+arg_0]
		jb	short loc_3140

loc_316D:
		inc	byte ptr [si+3]
		mov	al, byte ptr [bp+arg_0]
		mov	[si+2], al

loc_3176:
		pop	di
		pop	si
		pop	bp
		retf
sub_2FAA		endp

; ----------------------------------------------------------------------

sub_317A		proc far
		push	si
		push	di
		mov	ax, 5EB8h
		push	ax
		nop
		push	cs
		call	near ptr sub_250B
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_3200
		push	ax
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		cmp	ax, 4
		jb	short loc_3200
		mov	al, [di]
		cbw
		mov	bx, ax
		mov	al, [bx+5A7Bh]
		cbw
		test	ax, 0Ch
		jz	short loc_3200
		mov	al, [di+1]
		cbw
		mov	bx, ax
		mov	al, [bx+5A7Bh]
		cbw
		test	ax, 0Ch
		jz	short loc_3200
		mov	al, [di+2]
		cbw
		mov	bx, ax
		mov	al, [bx+5A7Bh]
		cbw
		test	ax, 0Ch
		jz	short loc_3200
		cmp	byte ptr [di+3], 2Dh
		jz	short loc_31E0
		cmp	byte ptr [di+3], 2Bh
		jz	short loc_31E0
		mov	al, [di+3]
		cbw
		mov	bx, ax
		test	byte ptr [bx+5A7Bh], 2
		jz	short loc_3200

loc_31E0:
		mov	al, [di+3]
		cbw
		mov	bx, ax
		mov	al, [bx+5A7Bh]
		cbw
		test	ax, 2
		jnz	short loc_3233
		mov	al, [di+4]
		cbw
		mov	bx, ax
		mov	al, [bx+5A7Bh]
		cbw
		test	ax, 2
		jnz	short loc_3233

loc_3200:
		mov	word_4E896, 1
		mov	word_4E894, 0
		mov	word_4E892, 4650h
		mov	ax, 5EBBh
		push	ax
		push	word_4E88E
		nop
		push	cs
		call	near ptr CRT_Strcpy
		pop	cx
		pop	cx
		mov	ax, 5EBFh
		push	ax
		push	word_4E890
		nop
		push	cs
		call	near ptr CRT_Strcpy
		pop	cx
		pop	cx
		jmp	loc_32F8

loc_3233:
		mov	ax, 4
		push	ax
		xor	ax, ax
		push	ax
		push	word_4E890
		nop
		push	cs
		call	near ptr CRT_Memset_Public
		add	sp, 6
		mov	ax, 3
		push	ax
		push	di
		push	word_4E88E
		nop
		push	cs
		call	near ptr CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, word_4E88E
		mov	byte ptr [bx+3], 0
		mov	ax, di
		add	ax, 3
		push	ax
		nop
		push	cs
		call	near ptr sub_2193
		pop	cx
		push	ax
		push	dx
		xor	dx, dx
		mov	ax, 0E10h
		pop	cx
		pop	bx
		call	sub_7CE
		mov	word_4E894, dx
		mov	word_4E892, ax
		mov	word_4E896, 0
		mov	si, 3
		jmp	short loc_32F1

loc_3289:
		mov	bx, si
		mov	al, [bx+di]
		cbw
		mov	bx, ax
		test	byte ptr [bx+5A7Bh], 0Ch
		jz	short loc_32F0
		mov	ax, di
		add	ax, si
		push	ax
		nop
		push	cs
		call	near ptr CRT_Strlen
		pop	cx
		cmp	ax, 3
		jb	short loc_32F8
		mov	bx, di
		mov	al, [bx+si+1]
		cbw
		mov	bx, ax
		mov	al, [bx+5A7Bh]
		cbw
		test	ax, 0Ch
		jz	short loc_32F8
		mov	bx, di
		mov	al, [bx+si+2]
		cbw
		mov	bx, ax
		mov	al, [bx+5A7Bh]
		cbw
		test	ax, 0Ch
		jz	short loc_32F8
		mov	ax, 3
		push	ax
		mov	ax, di
		add	ax, si
		push	ax
		push	word_4E890
		nop
		push	cs
		call	near ptr CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, word_4E890
		mov	byte ptr [bx+3], 0
		mov	word_4E896, 1
		jmp	short loc_32F8

loc_32F0:
		inc	si

loc_32F1:
		mov	bx, si
		cmp	byte ptr [bx+di], 0
		jnz	short loc_3289

loc_32F8:
		pop	di
		pop	si
		retf
sub_317A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32FB		proc near

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		cmp	[bp+arg_2], 0
		jnz	short loc_3331
		mov	si, [bp+arg_4]
		cmp	[bp+arg_4], 3Bh
		jb	short loc_331A
		mov	ax, [bp+arg_0]
		add	ax, 46h
		test	ax, 3
		jnz	short loc_331A
		dec	si

loc_331A:
		mov	[bp+arg_2], 0
		jmp	short loc_3324

loc_3321:
		inc	[bp+arg_2]

loc_3324:
		mov	bx, [bp+arg_2]
		shl	bx, 1
		cmp	[bx+5E94h], si
		jbe	short loc_3321
		jmp	short loc_3352

loc_3331:
		mov	bx, [bp+arg_2]
		dec	bx
		shl	bx, 1
		mov	ax, [bx+5E94h]
		add	[bp+arg_4], ax
		cmp	[bp+arg_2], 3
		jbe	short loc_3352
		mov	ax, [bp+arg_0]
		add	ax, 46h
		test	ax, 3
		jnz	short loc_3352
		inc	[bp+arg_4]

loc_3352:
		cmp	[bp+arg_2], 4
		jb	short loc_33D3
		jz	short loc_3362
		cmp	[bp+arg_2], 0Ah
		ja	short loc_33D3
		jnz	short loc_33CE

loc_3362:
		mov	bx, [bp+arg_2]
		shl	bx, 1
		cmp	[bp+arg_0], 10h
		jle	short loc_337C
		cmp	[bp+arg_2], 4
		jnz	short loc_337C
		mov	cx, [bx+5E92h]
		add	cx, 7
		jmp	short loc_3380

loc_337C:
		mov	cx, [bx+5E94h]

loc_3380:
		mov	bx, [bp+arg_0]
		add	bx, 7B2h
		test	bl, 3
		jz	short loc_338D
		dec	cx

loc_338D:
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
		jnz	short loc_33C2
		cmp	ax, cx
		ja	short loc_33CE
		jnz	short loc_33D3
		cmp	[bp+arg_6], 2
		jb	short loc_33D3
		jmp	short loc_33CE

loc_33C2:
		cmp	ax, cx
		jb	short loc_33CE
		jnz	short loc_33D3
		cmp	[bp+arg_6], 1
		ja	short loc_33D3

loc_33CE:
		mov	ax, 1
		jmp	short loc_33D5

loc_33D3:
		xor	ax, ax

loc_33D5:
		pop	si
		pop	bp
		ret	8
sub_32FB		endp

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
		cmp	di, word_4E6A8
		jb	short loc_33F9
		mov	ax, 6
		push	ax
		call	sub_5D0
		jmp	loc_34E2

loc_33F9:
		mov	ax, [bp+arg_4]
		inc	ax
		cmp	ax, 2
		jnb	short loc_3407
		xor	ax, ax
		jmp	loc_34E2

loc_3407:
		mov	bx, di
		shl	bx, 1
		test	word ptr [bx+5CCAh], 800h
		jz	short loc_3426
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

loc_3426:
		mov	bx, di
		shl	bx, 1
		test	word ptr [bx+5CCAh], 4000h
		jnz	short loc_3442
		push	[bp+arg_4]
		push	si
		push	di
		nop
		push	cs
		call	near ptr Stdio_ErrorHandler
		add	sp, 6
		jmp	loc_34E2

loc_3442:
		mov	bx, di
		shl	bx, 1
		and	word ptr [bx+5CCAh], 0FDFFh
		mov	[bp+var_6], si
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		jmp	short loc_34A6

loc_3457:
		dec	[bp+var_2]
		mov	bx, [bp+var_6]
		inc	[bp+var_6]
		mov	al, [bx]
		mov	[bp+var_3], al
		cmp	al, 0Ah
		jnz	short loc_346D
		mov	byte ptr [si], 0Dh
		inc	si

loc_346D:
		mov	al, [bp+var_3]
		mov	[si], al
		inc	si
		lea	ax, [bp+var_88]
		mov	dx, si
		sub	dx, ax
		cmp	dx, 80h
		jl	short loc_34AA
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
		jz	short loc_34A6
		cmp	dx, 0FFFFh
		jnz	short loc_349E

loc_3499:
		mov	ax, 0FFFFh
		jmp	short loc_34DD

loc_349E:
		mov	ax, [bp+arg_4]
		sub	ax, [bp+var_2]
		jmp	short loc_34D9

loc_34A6:
		lea	si, [bp+var_88]

loc_34AA:
		cmp	[bp+var_2], 0
		jnz	short loc_3457
		lea	ax, [bp+var_88]
		sub	si, ax
		mov	ax, si
		or	ax, ax
		jbe	short loc_34DF
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
		jz	short loc_34DF
		cmp	dx, 0FFFFh
		jz	short loc_3499
		mov	ax, [bp+arg_4]

loc_34D9:
		add	ax, dx
		sub	ax, si

loc_34DD:
		jmp	short loc_34E2

loc_34DF:
		mov	ax, [bp+arg_4]

loc_34E2:
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
		test	word ptr [bx+5CCAh], 1
		jz	short loc_34FE
		mov	ax, 5
		push	ax
		jmp	short loc_351D

loc_34FE:
		mov	ah, 40h
		mov	bx, [bp+arg_0]
		mov	cx, [bp+arg_4]
		mov	dx, [bp+arg_2]
		int	21h
		jb	short loc_351C
		push	ax
		mov	bx, [bp+arg_0]
		shl	bx, 1
		or	word ptr [bx+5CCAh], 1000h
		pop	ax
		jmp	short loc_3520

loc_351C:
		push	ax

loc_351D:
		call	sub_5D0

loc_3520:
		pop	bp
		retf
Stdio_ErrorHandler		endp

; START OF FUNCTION CHUNK FOR Stdio_ErrorHandler
		push	si
		push	di
		mov	di, 4
		mov	si, 5B88h
		jmp	short loc_353E

loc_352C:
		test	word ptr [si+2], 3
		jz	short loc_353A
		push	si
		nop
		push	cs
		call	near ptr Stdio_Fflush
		pop	cx

loc_353A:
		dec	di
		add	si, 10h

loc_353E:
		or	di, di
		jnz	short loc_352C
		pop	di
		pop	si
		retf
; END OF FUNCTION CHUNK FOR Stdio_ErrorHandler

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3545		proc far

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
		jnb	short loc_355D
		movsb

loc_355D:
		mov	ds, dx
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
sub_3545		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3569		proc far

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
		jz	short loc_3583
		jcxz	short loc_358A
		stosb
		dec	cx

loc_3583:
		shr	cx, 1
		rep stosw
		jnb	short loc_358A
		stosb

loc_358A:
		pop	di
		pop	bp
		retf
sub_3569		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_358D		proc far

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
		call	near ptr sub_3569
		add	sp, 8
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_358D		endp

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
		jz	short loc_35DC
		movsb
		dec	cx

loc_35DC:
		shr	cx, 1
		rep movsw
		jnb	short loc_35E3
		movsb

loc_35E3:
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
		jz	short loc_3606
		lodsb
		cmp	al, bl
		jz	short loc_361E
		and	al, al
		jz	short loc_3617

loc_3606:
		lodsw
		cmp	al, bl
		jz	short loc_361F
		and	al, al
		jz	short loc_3617
		cmp	ah, bl
		jz	short loc_361E
		and	ah, ah
		jnz	short loc_3606

loc_3617:
		pop	ds
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_3625

loc_361E:
		inc	si

loc_361F:
		lea	ax, [si-2]
		mov	dx, ds
		pop	ds

loc_3625:
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3628		proc far

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
sub_3628		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3651		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	di
		les	di, [bp+arg_0]
		xor	ax, ax
		cmp	ax, [bp+arg_2]
		jnz	short loc_3663
		cmp	ax, di
		jz	short loc_366D

loc_3663:
		cld
		mov	cx, 0FFFFh
		repne scasb
		xchg	cx, ax
		not	ax
		dec	ax

loc_366D:
		pop	di
		pop	bp
		retf
sub_3651		endp

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
		jcxz	short loc_36A2
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

loc_36A2:
		mov	ds, dx
		pop	di
		pop	si
		pop	bp
		retf
CRT_MemFamily_Extra7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36A8		proc far

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
sub_36A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36D9		proc far

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

loc_36F0:
		jcxz	short loc_3716
		lodsb
		mov	bl, es:[di]
		or	al, al
		jz	short loc_3716
		scasb
		loope	short loc_36F0
		cmp	al, dh
		jb	short loc_3707
		cmp	al, dl
		ja	short loc_3707
		sub	al, 20h

loc_3707:
		cmp	bl, dh
		jb	short loc_3712
		cmp	bl, dl
		ja	short loc_3712
		sub	bl, 20h

loc_3712:
		cmp	al, bl
		jz	short loc_36F0

loc_3716:
		sub	ax, bx
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_36D9		endp

; START OF FUNCTION CHUNK FOR sub_36D9
		push	dx
		jnz	short loc_378E
		jz	short loc_378B
		insw
		and	gs:[bx+76h], ch
		jb	loc_3796
		popaw
		jns	short loc_374D
		jb	loc_37A2
		outsw
		jb	short loc_3740
		db 0Ah
; END OF FUNCTION CHUNK FOR sub_36D9

; ----------------------------------------------------------------------

sub_3734		proc far
		mov	cx, 17h
		mov	dx, 371Dh
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

loc_374D:
		push	cs
sub_3734		endp

; START OF FUNCTION CHUNK FOR sub_3734
		db 0E8h
		push	cs
; END OF FUNCTION CHUNK FOR sub_3734
seg000		ends
