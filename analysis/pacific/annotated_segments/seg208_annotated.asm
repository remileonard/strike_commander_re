seg208		segment	para public 'CODE' use16
		assume cs:seg208
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 0C6h, 5Eh, 0C9h, 0CBh, 0

; ----------------------------------------------------------------------

sub_6E4D6		proc near
		push	bp
		xor	si, si
		xor	di, di
		xor	bp, bp
		xor	bx, bx
		mov	dx, 201h
		pushf
		cli
		out	dx, al

loc_6E4E5:
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
		loop	short loc_6E4E5
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
sub_6E4D6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Joystick_ReadAxesAndButtons_3DBFB (sub_3DBFB de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; Joystick_ReadAxesAndButtons_6638B (sub_6638B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle Joystick_ReadAxesRaw_6634C et range
; les 4 valeurs d'axes brutes (+0/+2/+4, +6/+8/+0xA) plus les boutons dans la structure de
; sortie. Référencée par sub_67835 et sub_67910.
; ==============================================================================================
Joystick_ReadAxesAndButtons_6E515		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	di
		push	si
		mov	cx, [bp+arg_0]
		call	sub_6E4D6
		mov	bx, [bp+arg_2]
		mov	[bx], si
		mov	[bx+2], di
		mov	si, ax
		and	ax, 3
		mov	[bx+4], ax
		mov	ax, si
		shr	ax, 1
		shr	ax, 1
		add	bx, 8
		mov	[bx], cx
		mov	[bx+2], dx
		mov	[bx+4], ax
		pop	si
		pop	di
		pop	bp
		retf	4
Joystick_ReadAxesAndButtons_6E515		endp

; ----------------------------------------------------------------------

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Joystick_ReadButtonsOnly_3DC2D (sub_3DC2D de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Joystick_ReadButtonsOnly_663BD (sub_663BD de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, lit uniquement l'état des 4
; boutons du joystick (port 0x201) sans mesurer les axes — variante rapide de
; Joystick_ReadAxesRaw_6634C. Référencée par sub_67906.
; ==============================================================================================
Joystick_ReadButtonsOnly_6E547		proc far
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
Joystick_ReadButtonsOnly_6E547		endp

; ----------------------------------------------------------------------

sub_6E560		proc far
		lea	edx, dword_767D0
		xor	cx, cx
		mov	bx, 5350h
		mov	ax, 1209h
		int	15h
		retf
sub_6E560		endp

; START OF FUNCTION CHUNK FOR sub_6E560
		push	5CC4h
		push	word_7C428
		push	cs
		call	near ptr Joystick_ReadAxesAndButtons_6E515
		xor	dx, dx
		mov	bx, dx
		shl	bx, 3
		mov	ax, [bx+5CC4h]
		mov	bx, dx
		shl	bx, 1
		mov	[bx+5CFAh], ax
		mov	bx, dx
		shl	bx, 3
		mov	ax, [bx+5CC6h]
		mov	bx, dx
		shl	bx, 1
		mov	[bx+5CFEh], ax
		inc	dx
; END OF FUNCTION CHUNK FOR sub_6E560
seg208		ends
