seg016		segment	byte public 'CODE' use16
		assume cs:seg016
		;org 0Bh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_1618B:				; DATA XREF: seg339:0894o
		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+6]
		push	ds
		push	si
		call	Input_JoyTimestampValid
		add	sp, 4
		mov	[bp-2],	ax
		mov	di, word_722E6
		mov	ax, [di+51h]
		mov	[bp-4],	ax
		mov	bx, [bp-4]
		mov	al, [bx+20h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bp-5],	al
		push	ds
		push	offset aRadio	; "RADIO"
		push	large dword ptr	[di+5Eh]
		call	Roster_FindByNameAndFlag
		add	sp, 8
		or	al, al
		jz	short loc_161E6
		mov	ax, [bp-2]
		cmp	ax, 1
		jz	short loc_161DC
		jmp	loc_165E0
; ���������������������������������������������������������������������������

loc_161DC:				; CODE XREF: seg016:0057j seg016:008Aj ...
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		jmp	loc_165E0
; ���������������������������������������������������������������������������

loc_161E6:				; CODE XREF: seg016:004Fj
		mov	ax, [bp-2]
		mov	[bp-8],	ax
		mov	cx, 0Ch		; switch 12 cases
		mov	bx, offset word_165F6

loc_161F2:				; CODE XREF: seg016:007Dj
		mov	ax, cs:[bx]
		cmp	ax, [bp-8]
		jz	short loc_16202
		add	bx, 2
		loop	loc_161F2
		jmp	loc_162B4	; default
; ���������������������������������������������������������������������������

loc_16202:				; CODE XREF: seg016:0078j
		jmp	word ptr cs:[bx+18h] ; switch jump

loc_16206:				; DATA XREF: seg016:048Eo
		cmp	byte ptr [si+73h], 32h ; '2' ; case 0x39
		jz	short loc_161DC
		mov	byte ptr [si+73h], 32h ; '2'
		jmp	loc_165E0
; ���������������������������������������������������������������������������

loc_16213:				; CODE XREF: seg016:loc_16202j
					; DATA XREF: seg016:048Eo
		jmp	short loc_161DC	; case 0x1
; ���������������������������������������������������������������������������

loc_16215:				; CODE XREF: seg016:loc_16202j
					; DATA XREF: seg016:048Eo
		mov	dx, [bp-2]	; case 0x2
		add	dx, 0FFFEh
		cmp	[si+17h], dx
		jg	short loc_16223

loc_16220:				; default
		jmp	loc_162B4
; ���������������������������������������������������������������������������

loc_16223:				; CODE XREF: seg016:009Ej
		cmp	byte ptr [si+73h], 32h ; '2'

loc_16227:
		jnz	short loc_1624A
		mov	bx, dx
		mov	al, [bx+si+41h]
		mov	[si+73h], al
		shl	bx, 2
		mov	ax, [bx+si+4Dh]
		mov	dx, [bx+si+4Bh]
		mov	[si+76h], ax
		mov	[si+74h], dx
		mov	dword ptr [si+9], 0
		jmp	short loc_162B4	; default
; ���������������������������������������������������������������������������

loc_1624A:				; CODE XREF: seg016:loc_16227j
		cmp	byte ptr [si+73h], 33h ; '3'
		jnz	short loc_162B4	; default
		mov	bx, dx
		mov	al, [bx+si+41h]
		mov	[si+73h], al
		mov	dword ptr [bp-10h], 0
		cmp	dword ptr [di+55h], 0
		jz	short loc_16278
		mov	ax, [di+57h]
		mov	dx, [di+55h]
		add	dx, 1Ah
		mov	[bp-0Eh], ax
		mov	[bp-10h], dx
		jmp	short $+2

loc_16278:				; CODE XREF: seg016:00E5j
		mov	ax, [bp-0Eh]
		mov	dx, [bp-10h]
		mov	[bp-0Ah], ax
		mov	[bp-0Ch], dx
		les	bx, [si+74h]
		mov	ax, es:[bx+0Dh]
		mov	[bp-12h], ax
		mov	al, [si+73h]
		mov	[bp-14h], al
		les	bx, [bp-0Ch]
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_162B1
		push	ax
		push	word ptr [bp-12h]
		push	word ptr [bp-0Ah]
		push	dx
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	loc_161DC
; ���������������������������������������������������������������������������

loc_162B1:				; CODE XREF: seg016:011Cj
		jmp	loc_161DC
; ���������������������������������������������������������������������������

loc_162B4:				; CODE XREF: seg016:007Fj
					; seg016:loc_16220j ...
		xor	dx, dx		; default
		mov	eax, dword_70458
		sub	[si+9],	eax
		cmp	dword ptr [si+9], 0
		jg	short loc_162CA
		mov	ax, 1
		jmp	short loc_162CC
; ���������������������������������������������������������������������������

loc_162CA:				; CODE XREF: seg016:0143j
		xor	ax, ax

loc_162CC:				; CODE XREF: seg016:0148j
		or	ax, ax
		jz	short loc_162DB
		mov	eax, [si+0Dh]
		mov	[si+9],	eax
		inc	dx
		jmp	short $+2

loc_162DB:				; CODE XREF: seg016:014Ej
		or	dx, dx
		jnz	short loc_162E2
		jmp	loc_165E0
; ���������������������������������������������������������������������������

loc_162E2:				; CODE XREF: seg016:015Dj
		cmp	word ptr [si+17h], 0FFFFh
		jnz	short loc_162F0
		mov	word ptr [si+17h], 0
		jmp	loc_161DC
; ���������������������������������������������������������������������������

loc_162F0:				; CODE XREF: seg016:0166j
		mov	word ptr [si+11h], 89Ch
		mov	dword ptr [si+13h], 0
		mov	word ptr [si+17h], 0
		mov	al, [si+73h]
		cbw
		cmp	ax, 32h	; '2'
		jz	short loc_16317
		cmp	ax, 33h	; '3'
		jnz	short loc_16313
		jmp	loc_16415
; ���������������������������������������������������������������������������

loc_16313:				; CODE XREF: seg016:018Ej
		mov	byte ptr [si+73h], 32h ; '2'

loc_16317:				; CODE XREF: seg016:0189j
		mov	word ptr [si+15h], ds
		mov	word ptr [si+13h], 8AFh

loc_1631F:
		mov	word ptr [bp-0Eh], 0
		jmp	loc_163DE
; ���������������������������������������������������������������������������

loc_16327:				; CODE XREF: seg016:0271j
		mov	dword ptr [bp-0Ch], 0
		mov	di, [bp-0Eh]
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_16345
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_16347
; ���������������������������������������������������������������������������

loc_16345:				; CODE XREF: seg016:01BAj
		mov	al, 17h

loc_16347:				; CODE XREF: seg016:01C3j
		mov	[bp-14h], al
		cmp	byte ptr [bp-14h], 6
		jnz	short loc_1637C
		mov	dword ptr [bp-18h], 0
		cmp	dword ptr [di+55h], 0
		jz	short loc_16370
		mov	ax, [di+57h]
		mov	dx, [di+55h]
		add	dx, 1Ah
		mov	[bp-16h], ax
		mov	[bp-18h], dx
		jmp	short $+2

loc_16370:				; CODE XREF: seg016:01DDj
		mov	ax, [bp-16h]
		mov	dx, [bp-18h]
		mov	[bp-0Ah], ax
		mov	[bp-0Ch], dx

loc_1637C:				; CODE XREF: seg016:01CEj
		cmp	byte ptr [bp-14h], 15h
		jnz	short loc_1638D
		mov	ax, di
		add	ax, 51h	; 'Q'
		mov	word ptr [bp-0Ah], ds
		mov	[bp-0Ch], ax

loc_1638D:				; CODE XREF: seg016:0200j
		cmp	dword ptr [bp-0Ch], 0
		jz	short loc_163DE
		les	bx, [bp-0Ch]
		cmp	word ptr es:[bx+86h], 0
		jz	short loc_163DE
		mov	ax, [bp-0Ah]
		mov	dx, [bp-0Ch]
		add	dx, 72h	; 'r'
		mov	[bp-1Ah], ax
		mov	[bp-1Ch], dx
		mov	eax, [bp-0Ch]
		mov	[bp-20h], eax
		mov	bx, [si+17h]
		shl	bx, 2
		mov	ax, [bp-1Ah]
		mov	[bx+si+1Bh], ax
		mov	[bx+si+19h], dx
		mov	bx, [si+17h]
		mov	byte ptr [bx+si+41h], 33h ; '3'
		shl	bx, 2
		mov	ax, [bp-1Eh]
		mov	dx, [bp-20h]
		mov	[bx+si+4Dh], ax
		mov	[bx+si+4Bh], dx
		inc	word ptr [si+17h]

loc_163DE:				; CODE XREF: seg016:01A4j seg016:0212j ...
		lea	ax, [bp-0Eh]
		push	ax
		push	59C3h
		call	World_IterateObjects
		add	sp, 4
		or	ax, ax
		jz	short loc_163F4
		jmp	loc_16327
; ���������������������������������������������������������������������������

loc_163F4:				; CODE XREF: seg016:026Fj
		cmp	word ptr [si+17h], 0
		jz	short loc_163FD
		jmp	loc_165E0
; ���������������������������������������������������������������������������

loc_163FD:				; CODE XREF: seg016:0278j
		mov	word ptr [si+17h], 0FFFFh
		mov	dword ptr [bp-12h], 200h
		mov	eax, [bp-12h]
		mov	[si+9],	eax
		jmp	loc_165E0
; ���������������������������������������������������������������������������

loc_16415:				; CODE XREF: seg016:0190j
		mov	ax, [si+76h]
		mov	dx, [si+74h]
		add	dx, 72h	; 'r'
		mov	[si+15h], ax

loc_16421:
		mov	[si+13h], dx
		mov	word ptr [bp-0Ah], 0
		jmp	loc_165D0
; ���������������������������������������������������������������������������

; ==============================================================================================
; far (methode de vtable, loc_1642C, point d'entree du switch a loc_16433) - CONFIRME :
; recupere la lettre d'option a un index donne via Radio_GetOptionLetterByIndex_1F200, calcule
; 'lettre - 0x65' (soustrait 'e') pour indexer un switch a 9 cas (lettres 'e' a 'm', 0-8).
; Chaque cas evalue si cette QUESTION RADIO SPECIFIQUE est ACTUELLEMENT POSABLE dans le
; contexte de jeu courant (retourne un booleen) : case 0x1 ('f') calcule la distance 3D entre
; le joueur (word_722E6) et l'entite, compare a un seuil (0x1388=5000, portee radio/visuelle)
; ; cases 0x2/0x3 ('g'/'h') verifient des drapeaux globaux d'etat (byte_6E4D4/byte_6E4D5,
; probable mode combat/verrouillage) ; case 0x6 ('k') verifie aussi byte_6E4D4. CONFIRME
; ARCHITECTURALEMENT : OPTS liste les options POTENTIELLEMENT disponibles pour un personnage
; (statique, chargee depuis PROF), tandis que cette fonction determine, a chaque
; interrogation, LESQUELLES sont EFFECTIVEMENT disponibles maintenant (dynamique, selon
; distance/etat de combat/etc). Une lettre presente dans OPTS mais dont la condition n'est pas
; remplie serait donc grisee/indisponible dans le menu radio meme si le personnage la supporte
; en principe. Point notable : la lettre 'd' (observee dans BILLY.IFF/GWEN.IFF) tombe HORS de
; la plage geree par ce switch (e-m) - probablement geree par un mecanisme separe (option
; 'toujours disponible', ex. salutation/accuse de reception).
; ==============================================================================================
Radio_EvaluateOptionAvailability_1642C:				; CODE XREF: seg016:045Dj
		push	word ptr [bp-0Ah]
		push	large dword ptr	[si+74h]

loc_16433:
		call	Radio_GetOptionLetterByIndex_1F200
		add	sp, 6
		mov	[bp-0Ch], al
		mov	cl, 1
		cbw
		sub	ax, 65h	; 'e'
		mov	bx, ax
		cmp	bx, 8		; switch 9 cases
		jbe	short loc_1644E
		jmp	loc_1656F	; default
; ���������������������������������������������������������������������������

loc_1644E:				; CODE XREF: seg016:02C9j
		shl	bx, 1
		jmp	cs:off_165E4[bx] ; switch jump

loc_16455:				; DATA XREF: seg016:off_165E4o
		mov	al, [bp-5]	; case 0x0

loc_16458:				; CODE XREF: seg016:03E2j seg016:03E8j
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	cl, al
		jmp	loc_1656F	; default
; ���������������������������������������������������������������������������

loc_16464:				; CODE XREF: seg016:02D0j
					; DATA XREF: seg016:off_165E4o
		mov	di, word_722E6	; case 0x1
		add	di, 12h
		mov	eax, [di]
		mov	[bp-2Ch], eax
		mov	eax, [di+4]
		mov	[bp-28h], eax
		mov	eax, [di+8]
		mov	[bp-24h], eax
		les	bx, [si+74h]
		mov	di, es:[bx+0Dh]
		add	di, 12h
		mov	eax, [di]
		sub	[bp-2Ch], eax
		mov	eax, [di+4]
		sub	[bp-28h], eax
		mov	eax, [di+8]
		sub	[bp-24h], eax
		push	large dword ptr	[bp-24h]
		push	large dword ptr	[bp-28h]
		push	large dword ptr	[bp-2Ch]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-14h], eax
		mov	[bp-18h], eax
		sar	eax, 8
		mov	[bp-10h], eax
		cmp	byte ptr [bp-5], 0
		jnz	short loc_164D4
		jmp	loc_16559
; ���������������������������������������������������������������������������

loc_164D4:				; CODE XREF: seg016:034Fj
		cmp	dword ptr [bp-10h], 1388h
		jge	short loc_16559

loc_164DE:				; CODE XREF: seg016:0375j seg016:03C5j ...
		mov	ax, 1
		jmp	short loc_1655B
; ���������������������������������������������������������������������������
		jmp	short loc_16559
; ���������������������������������������������������������������������������

loc_164E5:				; CODE XREF: seg016:02D0j
					; DATA XREF: seg016:off_165E4o
		cmp	byte_6E4D4, 0	; case 0x2
		jz	short loc_16559
		mov	al, byte_6E4D5
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16559
		jmp	short loc_164DE
; ���������������������������������������������������������������������������
		jmp	short loc_16559
; ���������������������������������������������������������������������������

loc_164F9:				; CODE XREF: seg016:02D0j
					; DATA XREF: seg016:off_165E4o
		cmp	byte_6E4D4, 0	; case 0x3
		jz	short loc_1650E
		mov	al, byte_6E4D5
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1650E
		mov	ax, 1
		jmp	short loc_16510
; ���������������������������������������������������������������������������

loc_1650E:				; CODE XREF: seg016:037Ej seg016:0387j
		xor	ax, ax

loc_16510:				; CODE XREF: seg016:038Cj
		mov	dl, byte_6E4CD
		or	dl, al
		mov	dh, 0
		neg	dx
		sbb	dx, dx
		inc	dx
		mov	cl, dl
		jmp	short loc_1656F	; default
; ���������������������������������������������������������������������������

loc_16521:				; CODE XREF: seg016:02D0j
					; DATA XREF: seg016:off_165E4o
		cmp	byte_6E4D4, 0	; case 0x6
		jz	short loc_16536

loc_16528:
		mov	al, byte_6E4D5
		mov	ah, 0

loc_1652D:
		or	ax, ax
		jnz	short loc_16536
		mov	ax, 1
		jmp	short loc_16538
; ���������������������������������������������������������������������������

loc_16536:				; CODE XREF: seg016:03A6j seg016:03AFj
		xor	ax, ax

loc_16538:				; CODE XREF: seg016:03B4j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_16559
		cmp	byte_6E4CD, 0
		jz	short loc_16559
		jmp	short loc_164DE
; ���������������������������������������������������������������������������
		jmp	short loc_16559
; ���������������������������������������������������������������������������

loc_16549:				; CODE XREF: seg016:02D0j
					; DATA XREF: seg016:off_165E4o
		mov	bx, word_722E6	; case 0x4
		les	bx, [bx+5Ah]
		cmp	word ptr es:[bx+0Dh], 0
		jz	short loc_16559
		jmp	short loc_164DE
; ���������������������������������������������������������������������������

loc_16559:				; CODE XREF: seg016:0351j seg016:035Cj ...
		xor	ax, ax

loc_1655B:				; CODE XREF: seg016:0361j
		mov	cl, al
		jmp	short loc_1656F	; default
; ���������������������������������������������������������������������������

loc_1655F:				; CODE XREF: seg016:02D0j
					; DATA XREF: seg016:off_165E4o
		mov	al, byte_6E4D5	; case 0x5
		jmp	loc_16458
; ���������������������������������������������������������������������������

loc_16565:				; CODE XREF: seg016:02D0j
					; DATA XREF: seg016:off_165E4o
		mov	al, byte_6E4D6	; case 0x7
		jmp	loc_16458
; ���������������������������������������������������������������������������

loc_1656B:				; CODE XREF: seg016:02D0j
					; DATA XREF: seg016:off_165E4o
		mov	cl, byte_6E4D6	; case 0x8

loc_1656F:				; CODE XREF: seg016:02CBj seg016:02E1j ...
		cmp	byte ptr [bp-0Ch], 0FFh	; default
		jz	short loc_165CD
		or	cl, cl
		jz	short loc_165CD
		mov	al, [bp-0Ch]
		cbw
		push	ax
		call	Text_ComputeCumulativeWidth
		pop	cx
		mov	[bp-0Eh], dx
		mov	[bp-10h], ax
		mov	eax, [bp-10h]
		mov	[bp-14h], eax
		mov	al, [bp-0Ch]
		mov	[bp-16h], al
		mov	eax, [si+74h]
		mov	[bp-1Ah], eax
		mov	bx, [si+17h]
		shl	bx, 2
		mov	ax, [bp-12h]
		mov	dx, [bp-14h]
		mov	[bx+si+1Bh], ax
		mov	[bx+si+19h], dx
		mov	bx, [si+17h]
		mov	al, [bp-16h]
		mov	[bx+si+41h], al
		shl	bx, 2
		mov	ax, [bp-18h]
		mov	dx, [bp-1Ah]
		mov	[bx+si+4Dh], ax
		mov	[bx+si+4Bh], dx
		inc	word ptr [si+17h]

loc_165CD:				; CODE XREF: seg016:03F3j seg016:03F7j
		inc	word ptr [bp-0Ah]

loc_165D0:				; CODE XREF: seg016:02A9j
		les	bx, [si+74h]
		mov	ax, es:[bx+86h]
		cmp	ax, [bp-0Ah]
		jle	short loc_165E0
		jmp	Radio_EvaluateOptionAvailability_1642C
; ���������������������������������������������������������������������������

loc_165E0:				; CODE XREF: seg016:0059j seg016:0063j ...
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
off_165E4	dw offset loc_16455	; DATA XREF: seg016:02D0r
		dw offset loc_16464	; jump table for switch	statement
		dw offset loc_164E5
		dw offset loc_164F9
		dw offset loc_16549
		dw offset loc_1655F
		dw offset loc_16521
		dw offset loc_16565
		dw offset loc_1656B
word_165F6	dw	1,     2,     3,     4 ; DATA XREF: seg016:006Fo
		dw	5,     6,     7,     8 ; value table for switch	statement
		dw	9,   0Ah,   0Bh,   39h
		dw offset loc_16213	; jump table for switch	statement
		dw offset loc_16215
		dw offset loc_16215
		dw offset loc_16215
		dw offset loc_16215
		dw offset loc_16215
		dw offset loc_16215
		dw offset loc_16215
		dw offset loc_16215
		dw offset loc_16215
		dw offset loc_16215
		dw offset loc_16206
; ���������������������������������������������������������������������������

loc_16626:				; DATA XREF: seg339:0898o
		push	bp
		mov	bp, sp
		sub	sp, 42h
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [si+4]
		add	di, 2
		push	ds
		push	offset aRadio_0	; "RADIO"
		push	si
		call	Widget_GetNestedPropA
		pop	cx
		add	ax, 5Eh	; '^'
		mov	[bp-2],	ax
		mov	bx, [bp-2]
		push	large dword ptr	[bx]
		call	Roster_FindByNameAndFlag
		add	sp, 8
		or	al, al
		jnz	short loc_1665D
		jmp	loc_16772
; ���������������������������������������������������������������������������

loc_1665D:				; CODE XREF: seg016:04D8j
		mov	cx, [di+8]
		sub	cx, [di+4]
		inc	cx
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		mov	[bp-4],	ax
		mov	ax, [di+4]
		mov	[bp-6],	ax
		mov	ax, [di+6]
		mov	[bp-8],	ax
		mov	bx, [si+4]
		mov	al, [bx+47h]
		mov	ah, 0
		mov	[bp-0Ah], ax
		mov	ax, cx
		sar	ax, 2
		mov	dx, cx
		sub	dx, ax
		mov	[bp-0Ch], dx
		mov	ax, [bp-4]
		sar	ax, 2
		mov	dx, [bp-4]
		sub	dx, ax
		mov	[bp-0Eh], dx
		mov	ax, [bp-0Ch]
		sar	ax, 2
		mov	dx, [bp-6]
		add	dx, ax
		mov	[bp-10h], dx
		mov	ax, [bp-0Eh]
		sar	ax, 2
		mov	dx, [bp-8]
		add	dx, ax
		mov	[bp-12h], dx
		mov	word ptr [bp-14h], 0
		jmp	short loc_166F6
; ���������������������������������������������������������������������������

loc_166C2:				; CODE XREF: seg016:057Aj
		mov	ax, [bp-0Ch]
		call	Math_RandomScale_54DF4
		mov	[bp-20h], ax
		mov	ax, [bp-0Eh]
		call	Math_RandomScale_54DF4
		mov	[bp-22h], ax
		mov	al, [bp-0Ah]
		push	ax
		mov	ax, [bp-12h]
		add	ax, [bp-22h]
		push	ax
		mov	ax, [bp-10h]
		add	ax, [bp-20h]
		push	ax
		push	di
		call	Render_SetPixelClipped_61B58
		add	sp, 8
		inc	word ptr [bp-14h]

loc_166F6:				; CODE XREF: seg016:0540j
		cmp	word ptr [bp-14h], 7
		jl	short loc_166C2
		mov	eax, dword_70458
		imul	eax, 38h
		mov	[bp-18h], eax
		mov	[bp-1Ch], eax
		mov	ax, [bp-1Bh]
		add	word_6D957, ax
		mov	ax, [bp-4]
		add	ax, 4
		cmp	ax, word_6D957
		jge	short loc_16729
		mov	ax, [bp-4]
		add	ax, 4
		sub	word_6D957, ax

loc_16729:				; CODE XREF: seg016:059Dj
		mov	word ptr [bp-1Eh], 0Ch
		mov	bx, [si+4]
		mov	al, [bx+46h]
		push	ax
		push	bx
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		mov	bx, [si+4]
		mov	al, [bx+45h]
		push	ax
		push	bx
		call	Widget_Method_DispatchC_60861
		add	sp, 4
		push	word_6D957
		push	word ptr [bp-1Eh]
		push	word ptr [si+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	ds
		push	offset aCommMode ; "Comm Mode:"
		push	word ptr [si+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		jmp	loc_16894
; ���������������������������������������������������������������������������

loc_16772:				; CODE XREF: seg016:04DAj
		cmp	dword ptr [si+13h], 0
		jnz	short loc_1677C
		jmp	loc_16894
; ���������������������������������������������������������������������������

loc_1677C:				; CODE XREF: seg016:05F7j
		mov	bx, [si+4]
		mov	al, [bx+46h]
		push	ax
		push	bx
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		mov	bx, [si+4]
		mov	al, [bx+45h]
		push	ax
		push	bx
		call	Widget_Method_DispatchC_60861
		add	sp, 4
		push	large 0Ch
		push	word ptr [si+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	ds
		push	word ptr [si+11h]
		push	word ptr [si+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		mov	word ptr [bp-4], 0
		mov	di, 8
		mov	bx, [si+4]
		mov	al, [bx+47h]
		push	ax
		push	bx
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		push	di
		push	word ptr [bp-4]
		push	word ptr [si+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		add	di, 8
		push	large dword ptr	[si+13h]
		push	word ptr [si+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		mov	bx, [si+4]
		mov	al, [bx+46h]
		push	ax
		push	bx
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		mov	bx, [si+4]
		mov	al, [bx+45h]
		push	ax
		push	bx
		call	Widget_Method_DispatchC_60861
		add	sp, 4
		add	di, 2
		cmp	word ptr [si+17h], 0FFFFh
		jnz	short loc_16842
		mov	ax, di
		add	ax, 0Ch
		push	ax

loc_16821:
		mov	ax, [bp-4]

loc_16824:
		add	ax, 0Ah
		push	ax
		push	word ptr [si+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	ds
		push	offset aNoReceivers ; "NO RECEIVERS"
		push	word ptr [si+4]
		call	Widget_SetLabelRaw
		add	sp, 6

loc_16842:				; CODE XREF: seg016:0699j
		mov	word ptr [bp-6], 0
		jmp	short loc_1688C
; ���������������������������������������������������������������������������

loc_16849:				; CODE XREF: seg016:0712j
		mov	bx, [bp-6]
		shl	bx, 2
		push	large dword ptr	[bx+si+19h]
		mov	ax, [bp-6]
		inc	ax
		push	ax
		push	8D3h
		lea	ax, [bp-42h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		push	di
		push	word ptr [bp-4]
		push	word ptr [si+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		add	di, 8
		push	ss
		lea	ax, [bp-42h]
		push	ax
		push	word ptr [si+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		inc	word ptr [bp-6]

loc_1688C:				; CODE XREF: seg016:06C7j
		mov	ax, [si+17h]

loc_1688F:
		cmp	ax, [bp-6]
		jg	short loc_16849

loc_16894:				; CODE XREF: seg016:05EFj seg016:05F9j
		pop	di
		pop	si
		leave
		retf
seg016		ends
