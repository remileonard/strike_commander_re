seg168		segment	para public 'CODE' use16
		assume cs:seg168
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 0C6h, 6, 56h, 68h, 0, 0C6h, 6, 57h, 68h, 0, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_556AD		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	cx, [bp+arg_0]
		mov	byte_5E77A, cl
		mov	ax, seg seg177
		mov	es, ax
		mov	al, es:212h
		mov	byte_5E77B, al
		mov	dx, cx
		and	dx, 0FF7Fh
		cmp	dx, 2Ah
		jnz	short loc_556E1
		mov	ax, seg seg177
		mov	es, ax
		cmp	byte ptr es:212h, 0
		jz	short loc_556E1
		jmp	loc_557AB

loc_556E1:
		mov	[bp+var_2], 1
		mov	ax, seg seg177
		mov	es, ax
		cmp	byte ptr es:212h, 0
		jz	short loc_55702
		mov	ax, seg seg181
		mov	bx, dx
		mov	es, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax

loc_55702:
		mov	byte_6061A, 1
		test	cx, 80h
		jz	short loc_55718
		mov	byte_6061A, 2
		mov	[bp+var_2], 0
		jmp	short loc_55726

loc_55718:
		mov	bx, dx
		cmp	byte ptr [bx+6876h], 1
		jnz	short loc_55726
		mov	byte_6061A, 4

loc_55726:
		mov	bx, dx
		mov	al, [bp+var_2]
		mov	[bx+6876h], al
		mov	al, byte_6061A
		mov	ah, 0
		test	word_5E7A4, ax
		jz	short loc_557AB
		mov	byte_6061B, dl
		mov	ax, seg seg177
		mov	es, ax
		cmp	byte ptr es:212h, 0
		jz	short loc_55750
		mov	ax, 1
		jmp	short loc_55752

loc_55750:
		xor	ax, ax

loc_55752:
		mov	byte_6061C, al
		mov	byte_6061D, 0
		cmp	byte_605CE, 0
		jz	short loc_55766
		or	byte_6061D, 80h

loc_55766:
		cmp	byte_605EF, 0
		jz	short loc_55772
		or	byte_6061D, 40h

loc_55772:
		cmp	byte_605B3, 0
		jz	short loc_5577E
		or	byte_6061D, 20h

loc_5577E:
		cmp	byte_605EB, 0
		jz	short loc_5578A
		or	byte_6061D, 10h

loc_5578A:
		cmp	byte_605C0, 0
		jz	short loc_55796
		or	byte_6061D, 8

loc_55796:
		cmp	byte_605CC, 0
		jz	short loc_557A2
		or	byte_6061D, 4

loc_557A2:
		push	68FAh
		nop
		push	cs
		call	near ptr Keyboard_PushEventToQueue_55890
		pop	cx

loc_557AB:
		leave
		retf
sub_556AD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Keyboard_RegisterOrInitHandlerTable_6ED71 (sub_6ED71 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à Keyboard_RegisterOrInitHandlerTable_3E3DE (sub_3E3DE
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Keyboard_RegisterOrInitHandlerTable_66BBA (sub_66BBA de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658) et initialise
; la table de gestionnaires par scan-code (sub_66F09, Keyboard_ClearHandlerTable_66C1E,
; Keyboard_InitSystem_66C34).
; ==============================================================================================
Keyboard_RegisterOrInitHandlerTable_557AD		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_557C6
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_557E2

loc_557C6:
		push	si
		call	Keyboard_AllocateHandlerMask_55A7F
		pop	cx
		nop
		push	cs
		call	near ptr Keyboard_ClearHandlerTable_55811
		push	[bp+arg_6]
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Keyboard_InitSystem_55827
		add	sp, 8

loc_557E2:
		mov	ax, si
		pop	si
		pop	bp
		retf
Keyboard_RegisterOrInitHandlerTable_557AD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_557E7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_55800
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5580C

loc_55800:
		push	si
		call	Keyboard_AllocateHandlerMask_55A7F
		pop	cx
		nop
		push	cs
		call	near ptr Keyboard_ClearHandlerTable_55811

loc_5580C:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_557E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_ClearHandlerTable_6EDD5 (sub_6EDD5 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_ClearHandlerTable_3E442 (sub_3E442 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Keyboard_ClearHandlerTable_66C1E (sub_66C1E de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, réinitialise la
; table de gestionnaires par scan-code (256 octets à 0x670000, tag 5D18h) via sub_22E1.
; ==============================================================================================
Keyboard_ClearHandlerTable_55811		proc far
		push	bp
		mov	bp, sp
		push	large 800000h
		push	6876h
		call	CRT_Memset_Public
		add	sp, 6
		pop	bp
		retf
Keyboard_ClearHandlerTable_55811		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_InitSystem_6EDEB (sub_6EDEB de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Keyboard_InitSystem_3E458 (sub_3E458 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à Keyboard_InitSystem_66C34 (sub_66C34 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far,
; initialisation du système clavier : configure le pointeur (dword_71176) et la capacité
; (word_7117A) de la file d'événements circulaire, puis installe
; Keyboard_ProcessScanCode_66AC4 comme gestionnaire pour les 255 scan-codes possibles
; (sub_66F61).
; ==============================================================================================
Keyboard_InitSystem_55827		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jz	short loc_55853
		mov	eax, [bp+arg_2]
		mov	dword_5E77C, eax
		mov	ax, [bp+arg_6]
		mov	word_5E780, ax
		push	0FFh
		push	seg seg168
		push	offset sub_556AD
		call	Keyboard_ConfigureHandlerMask_55AD7
		add	sp, 6

loc_55853:
		pop	bp
		retf
Keyboard_InitSystem_55827		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Keyboard_UnregisterHandlerTable_6EE19 (sub_6EE19 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à Keyboard_UnregisterHandlerTable_3E486 (sub_3E486 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; Keyboard_UnregisterHandlerTable_66C62 (sub_66C62 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_66F61, sub_66F34 et libère
; l'objet (sub_338) — pendant destructeur de Keyboard_RegisterOrInitHandlerTable_66BBA.
; ==============================================================================================
Keyboard_UnregisterHandlerTable_55855		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_5588C
		push	large 0FF0000h
		push	0
		call	Keyboard_ConfigureHandlerMask_55AD7
		add	sp, 6
		push	0
		push	si
		call	sub_55AAA
		add	sp, 4
		test	di, 1
		jz	short loc_5588C
		push	si
		call	sub_33B
		pop	cx

loc_5588C:
		pop	di
		pop	si
		pop	bp
		retf
Keyboard_UnregisterHandlerTable_55855		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_PushEventToQueue_6EE54 (sub_6EE54 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
Keyboard_PushEventToQueue_55890		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, byte_5E784
		mov	ah, 0
		cmp	ax, word_5E780
		jnb	short loc_558E2
		mov	al, [di]
		mov	ah, 0
		test	word_5E7A4, ax
		jz	short loc_558E2
		mov	al, byte_5E784
		inc	al
		mov	byte_5E784, al
		mov	al, byte_5E783
		mov	ah, 0
		shl	ax, 2
		les	bx, word ptr dword_5E77C
		add	bx, ax
		mov	eax, [di]
		mov	es:[bx], eax
		inc	byte_5E783
		mov	al, byte_5E783
		mov	ah, 0
		cmp	ax, word_5E780
		jb	short loc_558DE
		mov	byte_5E783, 0

loc_558DE:
		mov	al, 1
		jmp	short loc_558E4

loc_558E2:
		mov	al, 0

loc_558E4:
		pop	di
		pop	si
		pop	bp
		retf
Keyboard_PushEventToQueue_55890		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_PeekOrPopEvent_6EEAC (sub_6EEAC de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_PeekOrPopEvent_3E519 (sub_3E519 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à Keyboard_PeekOrPopEvent_66CF5
; (sub_66CF5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — ⚠️ far, 40 lignes, NON DÉTAILLÉE — probable lecture (pop) d'un événement depuis la
; file circulaire (pendant lecture de Keyboard_PushEventToQueue_66C9D).
; ==============================================================================================
Keyboard_PeekOrPopEvent_558E8		proc far
		push	bp
		mov	bp, sp
		cmp	byte_5E784, 0
		jz	short loc_55928
		mov	al, byte_5E784
		add	al, 0FFh
		mov	byte_5E784, al
		mov	al, byte_5E782
		mov	ah, 0
		shl	ax, 2
		les	bx, word ptr dword_5E77C
		add	bx, ax
		mov	eax, es:[bx]
		mov	dword_60616, eax
		inc	byte_5E782
		mov	al, byte_5E782
		mov	ah, 0
		cmp	ax, word_5E780
		jb	short loc_55924
		mov	byte_5E782, 0

loc_55924:
		mov	al, 1
		jmp	short loc_5592A

loc_55928:
		mov	al, 0

loc_5592A:
		pop	bp
		retf
Keyboard_PeekOrPopEvent_558E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_QueryHandlerTable_6EEF0 (sub_6EEF0 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_QueryHandlerTable_3E55D (sub_3E55D de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Keyboard_QueryHandlerTable_66D39 (sub_66D39 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 50 lignes,
; NON DÉTAILLÉE — combine Keyboard_PeekOrPopEvent_66CF5 et sub_22E1.
; ==============================================================================================
Keyboard_QueryHandlerTable_5592C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		jmp	short loc_55943

loc_55931:
		push	cs
		call	near ptr Keyboard_PeekOrPopEvent_558E8
		or	al, al
		jz	short loc_55943
		mov	al, byte ptr dword_60616
		mov	ah, 0
		test	[bp+arg_0], ax
		jnz	short loc_5595B

loc_55943:
		push	large 40000h
		push	68F6h
		call	CRT_Memset_Public
		add	sp, 6
		cmp	byte_5E784, 0
		jnz	short loc_55931

loc_5595B:
		mov	ax, 68F6h
		pop	bp
		retf
Keyboard_QueryHandlerTable_5592C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Keyboard_Method_ReturnTypeTag_6EF24 (sub_6EF24 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à Keyboard_Method_ReturnTypeTag_3E591 (sub_3E591 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à
; Keyboard_Method_ReturnTypeTag_66D6D (sub_66D6D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, stub retournant une constante de type
; (5D7Fh).
; ==============================================================================================
Keyboard_Method_ReturnTypeTag_55960		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	cs
		call	near ptr Keyboard_QueryHandlerTable_5592C
		pop	cx
		mov	bx, ax
		mov	eax, [bx]
		mov	[si], eax
		mov	ax, si
		pop	si
		pop	bp
		retf
Keyboard_Method_ReturnTypeTag_55960		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5597C		proc far
		push	bp
		mov	bp, sp
		mov	ax, 68F6h
		pop	bp
		retf
sub_5597C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55984		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		call	Keyboard_ReportErrorIfActive_55A6A
		push	[bp+arg_0]
		push	cs
		call	near ptr Keyboard_QueryHandlerTable_5592C
		pop	cx
		pop	bp
		retf
sub_55984		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55996		proc far
		push	bp
		mov	bp, sp
		call	Keyboard_ReportErrorIfActive_55A6A
sub_55996		endp

; START OF FUNCTION CHUNK FOR sub_55996
		db 0FFh, 76h
; END OF FUNCTION CHUNK FOR sub_55996
seg168		ends
