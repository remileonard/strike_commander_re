seg153		segment	byte public 'CODE' use16
		assume cs:seg153
		;org 0Ch
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Joystick_ReadAxesRaw_6634C (sub_6634C de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⭐ near, boucle de mesure matérielle du joystick —
; écrit sur le port 0x201 (Game I/O port) pour déclencher les 4 circuits RC des axes, puis lit
; en boucle jusqu'à ce que chaque bit (axes X1/Y1/X2/Y2) retombe à zéro, comptant les cycles
; écoulés dans si/di/bp/bx (mesure de temps proportionnelle à la position de chaque axe,
; principe classique du port joystick analogique PC). Lit aussi l'état des 4 boutons en fin de
; boucle. Fonction bas niveau dépendante de la vitesse du CPU — cohérente avec le système de
; calibration de joystick déjà identifié dans les sessions précédentes.
; ==============================================================================================
Joystick_ReadAxesRaw_3DBBC	proc near		; CODE XREF: Joystick_ReadAxesAndButtons_3DBFB+8p
		push	bp
		xor	si, si

loc_3DBBF:				; DATA XREF: seg170:059Eo
		xor	di, di
		xor	bp, bp
		xor	bx, bx
		mov	dx, 201h
		pushf
		cli
		out	dx, al		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)

loc_3DBCB:				; CODE XREF: Joystick_ReadAxesRaw_3DBBC+28j
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
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
		loop	loc_3DBCB
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
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
		retn
Joystick_ReadAxesRaw_3DBBC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Joystick_ReadAxesAndButtons_6638B (sub_6638B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle Joystick_ReadAxesRaw_6634C et range
; les 4 valeurs d'axes brutes (+0/+2/+4, +6/+8/+0xA) plus les boutons dans la structure de
; sortie. Référencée par sub_67835 et sub_67910.
; ==============================================================================================
Joystick_ReadAxesAndButtons_3DBFB	proc far		; CODE XREF: Joystick_ReadAndScaleAxes_3F059+49P
					; Joystick_SampleAxesToTable_3F134+AP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	di
		push	si
		mov	cx, [bp+arg_0]
		call	Joystick_ReadAxesRaw_3DBBC
		mov	bx, [bp+arg_2]
		mov	[bx], si
		mov	[bx+2],	di
		mov	si, ax
		and	ax, 3
		mov	[bx+4],	ax
		mov	ax, si
		shr	ax, 1
		shr	ax, 1
		add	bx, 6
		mov	[bx], cx
		mov	[bx+2],	dx
		mov	[bx+4],	ax
		pop	si
		pop	di
		pop	bp
		retf	4
Joystick_ReadAxesAndButtons_3DBFB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������


; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Joystick_ReadButtonsOnly_663BD (sub_663BD de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, lit uniquement l'état des 4 boutons du
; joystick (port 0x201) sans mesurer les axes — variante rapide de Joystick_ReadAxesRaw_6634C.
; Référencée par sub_67906.
; ==============================================================================================
Joystick_ReadButtonsOnly_3DC2D	proc far		; CODE XREF: Joystick_ReadButtonsWrapper_3F12A+3P
		push	si
		push	di
		pushf
		cli
		mov	dx, 201h
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
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
Joystick_ReadButtonsOnly_3DC2D	endp

seg153		ends
