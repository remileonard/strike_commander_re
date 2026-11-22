seg211		segment	para public 'CODE' use16
		assume cs:seg211
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EC71		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	cx, [bp+arg_0]
		mov	byte_7B244, cl
		mov	ax, seg seg219
		mov	es, ax
		mov	al, es:21Ah
		mov	byte_7B245, al
		mov	dx, cx
		and	dx, 0FF7Fh
		cmp	dx, 2Ah
		jnz	short loc_6ECA5
		mov	ax, seg seg219
		mov	es, ax
		cmp	byte ptr es:21Ah, 0
		jz	short loc_6ECA5
		jmp	loc_6ED6F

loc_6ECA5:
		mov	[bp+var_2], 1
		mov	ax, seg seg219
		mov	es, ax
		cmp	byte ptr es:21Ah, 0
		jz	short loc_6ECC6
		mov	ax, seg seg231
		mov	bx, dx
		mov	es, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax

loc_6ECC6:
		mov	byte_7D37B, 1
		test	cx, 80h
		jz	short loc_6ECDC
		mov	byte_7D37B, 2
		mov	[bp+var_2], 0
		jmp	short loc_6ECEA

loc_6ECDC:
		mov	bx, dx
		cmp	byte ptr [bx+6BE0h], 1
		jnz	short loc_6ECEA
		mov	byte_7D37B, 4

loc_6ECEA:
		mov	bx, dx
		mov	al, [bp+var_2]
		mov	[bx+6BE0h], al
		mov	al, byte_7D37B
		mov	ah, 0
		test	word_7B26E, ax
		jz	short loc_6ED6F
		mov	byte_7D37C, dl
		mov	ax, seg seg219
		mov	es, ax
		cmp	byte ptr es:21Ah, 0
		jz	short loc_6ED14
		mov	ax, 1
		jmp	short loc_6ED16

loc_6ED14:
		xor	ax, ax

loc_6ED16:
		mov	byte_7D37D, al
		mov	byte_7D37E, 0
		cmp	byte_7D348, 0
		jz	short loc_6ED2A
		or	byte_7D37E, 80h

loc_6ED2A:
		cmp	byte_7D369, 0
		jz	short loc_6ED36
		or	byte_7D37E, 40h

loc_6ED36:
		cmp	byte_7D32D, 0
		jz	short loc_6ED42
		or	byte_7D37E, 20h

loc_6ED42:
		cmp	byte_7D365, 0
		jz	short loc_6ED4E
		or	byte_7D37E, 10h

loc_6ED4E:
		cmp	byte_7D33A, 0
		jz	short loc_6ED5A
		or	byte_7D37E, 8

loc_6ED5A:
		cmp	byte_7D346, 0
		jz	short loc_6ED66
		or	byte_7D37E, 4

loc_6ED66:
		push	6C4Bh
		nop
		push	cs
		call	near ptr Keyboard_PushEventToQueue_6EE54
		pop	cx

loc_6ED6F:
		leave
		retf
sub_6EC71		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Keyboard_RegisterOrInitHandlerTable_3E3DE (sub_3E3DE de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Keyboard_RegisterOrInitHandlerTable_66BBA (sub_66BBA
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658) et initialise la table de gestionnaires par scan-code (sub_66F09,
; Keyboard_ClearHandlerTable_66C1E, Keyboard_InitSystem_66C34).
; ==============================================================================================
Keyboard_RegisterOrInitHandlerTable_6ED71		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6ED8A
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6EDA6

loc_6ED8A:
		push	si
		call	Keyboard_AllocateHandlerMask_6F043
		pop	cx
		nop
		push	cs
		call	near ptr Keyboard_ClearHandlerTable_6EDD5
		push	[bp+arg_6]
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Keyboard_InitSystem_6EDEB
		add	sp, 8

loc_6EDA6:
		mov	ax, si
		pop	si
		pop	bp
		retf
Keyboard_RegisterOrInitHandlerTable_6ED71		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EDAB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6EDC4
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6EDD0

loc_6EDC4:
		push	si
		call	Keyboard_AllocateHandlerMask_6F043
		pop	cx
		nop
		push	cs
		call	near ptr Keyboard_ClearHandlerTable_6EDD5

loc_6EDD0:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_6EDAB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_ClearHandlerTable_3E442 (sub_3E442 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Keyboard_ClearHandlerTable_66C1E (sub_66C1E de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, réinitialise la
; table de gestionnaires par scan-code (256 octets à 0x670000, tag 5D18h) via sub_22E1.
; ==============================================================================================
Keyboard_ClearHandlerTable_6EDD5		proc far
		push	bp
		mov	bp, sp
		push	large 670000h
		push	6BE0h
		call	CRT_Memset_Public
		add	sp, 6
		pop	bp
		retf
Keyboard_ClearHandlerTable_6EDD5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_InitSystem_3E458 (sub_3E458 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à Keyboard_InitSystem_66C34
; (sub_66C34 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — ⭐ far, initialisation du système clavier : configure le pointeur (dword_71176) et la
; capacité (word_7117A) de la file d'événements circulaire, puis installe
; Keyboard_ProcessScanCode_66AC4 comme gestionnaire pour les 255 scan-codes possibles
; (sub_66F61).
; ==============================================================================================
Keyboard_InitSystem_6EDEB		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jz	short loc_6EE17
		mov	eax, [bp+arg_2]
		mov	dword ptr word_7B246, eax
		mov	ax, [bp+arg_6]
		mov	word_7B24A, ax
		push	0FFh
		push	seg seg211
		push	offset sub_6EC71
		call	Keyboard_ConfigureHandlerMask_6F09B
		add	sp, 6

loc_6EE17:
		pop	bp
		retf
Keyboard_InitSystem_6EDEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Keyboard_UnregisterHandlerTable_3E486 (sub_3E486 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à Keyboard_UnregisterHandlerTable_66C62 (sub_66C62 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_66F61, sub_66F34 et libère l'objet (sub_338) — pendant destructeur de
; Keyboard_RegisterOrInitHandlerTable_66BBA.
; ==============================================================================================
Keyboard_UnregisterHandlerTable_6EE19		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6EE50
		push	large 0FF0000h
		push	0
		call	Keyboard_ConfigureHandlerMask_6F09B
		add	sp, 6
		push	0
		push	si
		call	sub_6F06E
		add	sp, 4
		test	di, 1
		jz	short loc_6EE50
		push	si
		call	sub_3B2
		pop	cx

loc_6EE50:
		pop	di
		pop	si
		pop	bp
		retf
Keyboard_UnregisterHandlerTable_6EE19		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Keyboard_PushEventToQueue_3E4C1 (sub_3E4C1 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Keyboard_PushEventToQueue_66C9D (sub_66C9D de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far, pousse un événement clavier
; dans une file circulaire : vérifie que la file n'est pas pleine (byte_7117E vs word_7117A),
; écrit l'événement (4 octets) à l'index courant (byte_7117D, via dword_71176), incrémente les
; compteurs avec retour à zéro circulaire. Appelée par Keyboard_ProcessScanCode_66AC4 — cœur
; du tampon d'événements clavier. CONFIRMÉ par le seg339 : message « keyboard stack overflow »
; — la file circulaire dispose bien d'une détection de dépassement documentée par une chaîne
; de debug dédiée.
; ==============================================================================================
Keyboard_PushEventToQueue_6EE54		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, byte_7B24E
		mov	ah, 0
		cmp	ax, word_7B24A
		jnb	short loc_6EEA6
		mov	al, [di]
		mov	ah, 0
		test	word_7B26E, ax
		jz	short loc_6EEA6
		mov	al, byte_7B24E
		inc	al
		mov	byte_7B24E, al
		mov	al, byte_7B24D
		mov	ah, 0
		shl	ax, 2
		les	bx, word_7B246
		add	bx, ax
		mov	eax, [di]
		mov	es:[bx], eax
		inc	byte_7B24D
		mov	al, byte_7B24D
		mov	ah, 0
		cmp	ax, word_7B24A
		jb	short loc_6EEA2
		mov	byte_7B24D, 0

loc_6EEA2:
		mov	al, 1
		jmp	short loc_6EEA8

loc_6EEA6:
		mov	al, 0

loc_6EEA8:
		pop	di
		pop	si
		pop	bp
		retf
Keyboard_PushEventToQueue_6EE54		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_PeekOrPopEvent_3E519 (sub_3E519 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à Keyboard_PeekOrPopEvent_66CF5
; (sub_66CF5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — ⚠️ far, 40 lignes, NON DÉTAILLÉE — probable lecture (pop) d'un événement depuis la
; file circulaire (pendant lecture de Keyboard_PushEventToQueue_66C9D).
; ==============================================================================================
Keyboard_PeekOrPopEvent_6EEAC		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7B24E, 0
		jz	short loc_6EEEC
		mov	al, byte_7B24E
		add	al, 0FFh
		mov	byte_7B24E, al
		mov	al, byte_7B24C
		mov	ah, 0
		shl	ax, 2
		les	bx, word_7B246
		add	bx, ax
		mov	eax, es:[bx]
		mov	dword ptr byte_7D377, eax
		inc	byte_7B24C
		mov	al, byte_7B24C
		mov	ah, 0
		cmp	ax, word_7B24A
		jb	short loc_6EEE8
		mov	byte_7B24C, 0

loc_6EEE8:
		mov	al, 1
		jmp	short loc_6EEEE

loc_6EEEC:
		mov	al, 0

loc_6EEEE:
		pop	bp
		retf
Keyboard_PeekOrPopEvent_6EEAC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_QueryHandlerTable_3E55D (sub_3E55D de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Keyboard_QueryHandlerTable_66D39 (sub_66D39 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 50 lignes,
; NON DÉTAILLÉE — combine Keyboard_PeekOrPopEvent_66CF5 et sub_22E1.
; ==============================================================================================
Keyboard_QueryHandlerTable_6EEF0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		jmp	short loc_6EF07

loc_6EEF5:
		push	cs
		call	near ptr Keyboard_PeekOrPopEvent_6EEAC
		or	al, al
		jz	short loc_6EF07
		mov	al, byte_7D377
		mov	ah, 0
		test	[bp+arg_0], ax
		jnz	short loc_6EF1F

loc_6EF07:
		push	large 40000h
		push	6C47h
		call	CRT_Memset_Public
		add	sp, 6
		cmp	byte_7B24E, 0
		jnz	short loc_6EEF5

loc_6EF1F:
		mov	ax, 6C47h
		pop	bp
		retf
Keyboard_QueryHandlerTable_6EEF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Keyboard_Method_ReturnTypeTag_3E591 (sub_3E591 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Keyboard_Method_ReturnTypeTag_66D6D (sub_66D6D de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, stub retournant une
; constante de type (5D7Fh).
; ==============================================================================================
Keyboard_Method_ReturnTypeTag_6EF24		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	cs
		call	near ptr Keyboard_QueryHandlerTable_6EEF0
		pop	cx
		mov	bx, ax
		mov	eax, [bx]
		mov	[si], eax
		mov	ax, si
		pop	si
		pop	bp
		retf
Keyboard_Method_ReturnTypeTag_6EF24		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EF40		proc far
		push	bp
		mov	bp, sp
		mov	ax, 6C47h
		pop	bp
		retf
sub_6EF40		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EF48		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		call	Keyboard_ReportErrorIfActive_6F02E
		push	[bp+arg_0]
		push	cs
		call	near ptr Keyboard_QueryHandlerTable_6EEF0
		pop	cx
		pop	bp
		retf
sub_6EF48		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6EF5A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		call	Keyboard_ReportErrorIfActive_6F02E
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr Keyboard_Method_ReturnTypeTag_6EF24
		add	sp, 4
		pop	bp
sub_6EF5A		endp
seg211		ends
