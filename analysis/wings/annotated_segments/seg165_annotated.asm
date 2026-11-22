seg165		segment	para public 'CODE' use16
		assume cs:seg165
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

sub_54EB2		proc near
		push	bp
		xor	si, si
		xor	di, di
		xor	bp, bp
		xor	bx, bx
		mov	dx, 201h
		pushf
		cli
		out	dx, al

loc_54EC1:
		in	al, dx
		shr	al, 1
		adc	si, 0
		shr	al, 1
		adc	di, 0
		shr	al, 1
		adc	bp, 0
		shr	al, 1
		adc	bx, 0
		nop
		nop
		nop
		nop
		loop	short loc_54EC1
		in	al, dx
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		popf
		and	ax, 0Fh
		xor	al, 0Fh
		mov	cx, bp
		mov	dx, bx
		pop	bp
		ret
sub_54EB2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Joystick_ReadAxesAndButtons_6E515 (sub_6E515 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Joystick_ReadAxesAndButtons_3DBFB (sub_3DBFB de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; Joystick_ReadAxesAndButtons_6638B (sub_6638B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle Joystick_ReadAxesRaw_6634C et range
; les 4 valeurs d'axes brutes (+0/+2/+4, +6/+8/+0xA) plus les boutons dans la structure de
; sortie. Référencée par sub_67835 et sub_67910.
; ==============================================================================================
Joystick_ReadAxesAndButtons_54EF1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	di
		push	si
		mov	cx, [bp+arg_0]
		call	sub_54EB2
		mov	bx, [bp+arg_2]
		mov	[bx], si
		mov	[bx+2], di
		mov	si, ax
		and	ax, 3
		mov	[bx+4], ax
		mov	ax, si
		shr	ax, 1
		shr	ax, 1
		add	bx, 6
		mov	[bx], cx
		mov	[bx+2], dx
		mov	[bx+4], ax
		pop	si
		pop	di
		pop	bp
		retf	4
Joystick_ReadAxesAndButtons_54EF1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54F23		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	di
		push	si
		mov	cx, [bp+arg_0]
		call	sub_54EB2
		mov	bx, [bp+arg_4]
		cmp	bx, 1
		jz	short loc_54F4C
		mov	bx, [bp+arg_2]
		mov	[bx], si
		mov	[bx+2], di
		mov	si, ax
		and	ax, 3
		mov	[bx+4], ax
		pop	si
		pop	di
		pop	bp
		retf	6

loc_54F4C:
		mov	bx, [bp+arg_2]
		shr	ax, 1
		shr	ax, 1
		mov	[bx], cx
		mov	[bx+2], dx
		mov	[bx+4], ax
		pop	si
		pop	di
		pop	bp
		retf	6
sub_54F23		endp

; ----------------------------------------------------------------------

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Joystick_ReadButtonsOnly_6E547 (sub_6E547 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Joystick_ReadButtonsOnly_3DC2D (sub_3DC2D de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Joystick_ReadButtonsOnly_663BD (sub_663BD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; lit uniquement l'état des 4 boutons du joystick (port 0x201) sans mesurer les axes —
; variante rapide de Joystick_ReadAxesRaw_6634C. Référencée par sub_67906.
; ==============================================================================================
Joystick_ReadButtonsOnly_54F61		proc far
		push	si
		push	di
		pushf
		cli
		mov	dx, 201h
		in	al, dx
		shr	al, 1
		shr	al, 1
		shr	al, 1
		shr	al, 1
		and	ax, 0Fh
		xor	al, 0Fh
		popf
		pop	di
		pop	si
		retf
Joystick_ReadButtonsOnly_54F61		endp

; ----------------------------------------------------------------------

sub_54F7A		proc far
		lea	edx, dword_59DFA
		xor	cx, cx
		mov	bx, 5350h
		mov	ax, 1209h
		int	15h
		retf
sub_54F7A		endp

; START OF FUNCTION CHUNK FOR sub_54F7A
		db 0A1h, 72h, 69h, 3Dh, 0FFh, 3Fh, 7Dh, 0Ch, 0BAh, 0, 0, 52h, 68h, 3Eh, 69h, 50h
		db 0Eh, 0E8h, 85h, 0FFh, 0A1h, 72h, 69h, 3Dh, 0FFh, 3Fh, 7Dh, 0F8h, 0BAh, 1, 0, 52h
		db 68h, 44h, 69h, 50h, 0Eh, 0E8h, 71h, 0FFh, 0BBh, 0, 0, 8Bh, 87h, 3Eh, 69h, 89h
		db 87h, 96h, 69h, 8Bh, 87h, 40h, 69h, 89h, 87h, 9Ah, 69h, 0BBh, 6, 0, 8Bh, 87h
		db 3Eh, 69h, 0BBh, 2, 0, 89h, 87h, 96h, 69h, 0BBh, 6, 0, 8Bh, 87h, 40h, 69h
		db 0BBh, 2
		add	[bx+di-6579h], cl
; END OF FUNCTION CHUNK FOR sub_54F7A
seg165		ends
