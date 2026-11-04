seg171		segment	para public 'CODE' use16
		assume cs:seg171
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_440E1		proc far

var_8		= byte ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	dx, [bp+arg_0]
		mov	byte_4DDBC, dl
		mov	ax, seg seg180
		mov	es, ax
		mov	al, es:8
		mov	byte_4DDBD, al
		mov	ax, dx
		and	ax, 0FF7Fh
		mov	[bp+var_2], ax
		mov	[bp+var_8], 1
		mov	byte ptr [bp+var_6], 1
		test	dx, 80h
		jz	short loc_4411A
		mov	byte ptr [bp+var_6], 2
		mov	[bp+var_8], 0
		jmp	short loc_44128

loc_4411A:
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+6CF2h], 1
		jnz	short loc_44128
		mov	byte ptr [bp+var_6], 4

loc_44128:
		mov	al, byte ptr [bp+var_6]
		mov	ah, 0
		test	word_4DDE6, ax
		jnz	short loc_44136
		jmp	loc_441B7

loc_44136:
		cmp	[bp+var_2], 2Ah
		jnz	short loc_4414A
		mov	ax, seg seg180
		mov	es, ax
		mov	al, es:8
		cbw
		or	ax, ax
		jnz	short loc_441B7

loc_4414A:
		mov	al, byte ptr [bp+var_2]
		mov	byte ptr [bp+var_6+1], al
		mov	ax, seg seg180
		mov	es, ax
		cmp	byte ptr es:8, 0
		jz	short loc_44162
		mov	ax, 1
		jmp	short loc_44164

loc_44162:
		xor	ax, ax

loc_44164:
		mov	[bp+var_4], al
		mov	[bp+var_3], 0
		cmp	byte_4F70A, 0
		jz	short loc_44176
		or	[bp+var_3], 80h

loc_44176:
		cmp	byte_4F72B, 0
		jz	short loc_44181
		or	[bp+var_3], 40h

loc_44181:
		cmp	byte_4F6EF, 0
		jz	short loc_4418C
		or	[bp+var_3], 20h

loc_4418C:
		cmp	byte_4F727, 0
		jz	short loc_44197
		or	[bp+var_3], 10h

loc_44197:
		cmp	byte_4F6FC, 0
		jz	short loc_441A2
		or	[bp+var_3], 8

loc_441A2:
		cmp	byte_4F708, 0
		jz	short loc_441AD
		or	[bp+var_3], 4

loc_441AD:
		lea	ax, [bp+var_6]
		push	ax
		nop
		push	cs
		call	near ptr Keyboard_PushEventToQueue_442BA
		pop	cx

loc_441B7:
		cmp	[bp+var_2], 2Ah
		jnz	short loc_441CB
		mov	ax, seg seg180
		mov	es, ax
		mov	al, es:8
		cbw
		or	ax, ax
		jnz	short loc_441D5

loc_441CB:
		mov	bx, [bp+var_2]
		mov	al, [bp+var_8]
		mov	[bx+6CF2h], al

loc_441D5:
		leave
		retf
sub_440E1		endp

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
Keyboard_RegisterOrInitHandlerTable_441D7		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_441F0
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4420C

loc_441F0:
		push	si
		call	Keyboard_AllocateHandlerMask_44526
		pop	cx
		nop
		push	cs
		call	near ptr Keyboard_ClearHandlerTable_4423B
		push	[bp+arg_6]
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Keyboard_InitSystem_44251
		add	sp, 8

loc_4420C:
		mov	ax, si
		pop	si
		pop	bp
		retf
Keyboard_RegisterOrInitHandlerTable_441D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44211		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_4422A
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_44236

loc_4422A:
		push	si
		call	Keyboard_AllocateHandlerMask_44526
		pop	cx
		nop
		push	cs
		call	near ptr Keyboard_ClearHandlerTable_4423B

loc_44236:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_44211		endp

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
Keyboard_ClearHandlerTable_4423B		proc far
		push	bp
		mov	bp, sp
		push	large 670000h
		push	6CF2h
		call	CRT_Memset_Public
		add	sp, 6
		pop	bp
		retf
Keyboard_ClearHandlerTable_4423B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Keyboard_InitSystem_3E458 (sub_3E458 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Keyboard_InitSystem_66C34 (sub_66C34 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far, initialisation du système
; clavier : configure le pointeur (dword_71176) et la capacité (word_7117A) de la file
; d'événements circulaire, puis installe Keyboard_ProcessScanCode_66AC4 comme gestionnaire
; pour les 255 scan-codes possibles (sub_66F61).
; ==============================================================================================
Keyboard_InitSystem_44251		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jz	short loc_4427D
		mov	eax, [bp+arg_2]
		mov	dword_4DDBE, eax
		mov	ax, [bp+arg_6]
		mov	word_4DDC2, ax
		push	0FFh
		push	seg seg171
		push	offset sub_440E1
		call	Keyboard_ConfigureHandlerMask_4457E
		add	sp, 6

loc_4427D:
		pop	bp
		retf
Keyboard_InitSystem_44251		endp

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
Keyboard_UnregisterHandlerTable_4427F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_442B6
		push	large 0FF0000h
		push	0
		call	Keyboard_ConfigureHandlerMask_4457E
		add	sp, 6
		push	0
		push	si
		call	sub_44551
		add	sp, 4
		test	di, 1
		jz	short loc_442B6
		push	si
		call	sub_39C
		pop	cx

loc_442B6:
		pop	di
		pop	si
		pop	bp
		retf
Keyboard_UnregisterHandlerTable_4427F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_PushEventToQueue_3E4C1 (sub_3E4C1 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à Keyboard_PushEventToQueue_66C9D
; (sub_66C9D de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — ⭐ far, pousse un événement clavier dans une file circulaire : vérifie que la file
; n'est pas pleine (byte_7117E vs word_7117A), écrit l'événement (4 octets) à l'index courant
; (byte_7117D, via dword_71176), incrémente les compteurs avec retour à zéro circulaire.
; Appelée par Keyboard_ProcessScanCode_66AC4 — cœur du tampon d'événements clavier. CONFIRMÉ
; par le seg339 : message « keyboard stack overflow » — la file circulaire dispose bien d'une
; détection de dépassement documentée par une chaîne de debug dédiée.
; ==============================================================================================
Keyboard_PushEventToQueue_442BA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	al, byte_4DDC6
		mov	ah, 0
		cmp	ax, word_4DDC2
		jnb	short loc_4430C
		mov	al, [di]
		mov	ah, 0
		test	word_4DDE6, ax
		jz	short loc_4430C
		mov	al, byte_4DDC6
		inc	al
		mov	byte_4DDC6, al
		mov	al, byte_4DDC5
		mov	ah, 0
		shl	ax, 2
		les	bx, word ptr dword_4DDBE
		add	bx, ax
		mov	eax, [di]
		mov	es:[bx], eax
		inc	byte_4DDC5
		mov	al, byte_4DDC5
		mov	ah, 0
		cmp	ax, word_4DDC2
		jb	short loc_44308
		mov	byte_4DDC5, 0

loc_44308:
		mov	al, 1
		jmp	short loc_4430E

loc_4430C:
		mov	al, 0

loc_4430E:
		pop	di
		pop	si
		pop	bp
		retf
Keyboard_PushEventToQueue_442BA		endp

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
Keyboard_PeekOrPopEvent_44312		proc far
		push	bp
		mov	bp, sp
		cmp	byte_4DDC6, 0
		jz	short loc_44352
		mov	al, byte_4DDC6
		add	al, 0FFh
		mov	byte_4DDC6, al
		mov	al, byte_4DDC4
		mov	ah, 0
		shl	ax, 2
		les	bx, word ptr dword_4DDBE
		add	bx, ax
		mov	eax, es:[bx]
		mov	dword_4F739, eax
		inc	byte_4DDC4
		mov	al, byte_4DDC4
		mov	ah, 0
		cmp	ax, word_4DDC2
		jb	short loc_4434E
		mov	byte_4DDC4, 0

loc_4434E:
		mov	al, 1
		jmp	short loc_44354

loc_44352:
		mov	al, 0

loc_44354:
		pop	bp
		retf
Keyboard_PeekOrPopEvent_44312		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyboard_QueryHandlerTable_3E55D (sub_3E55D de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Keyboard_QueryHandlerTable_66D39 (sub_66D39 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 50 lignes,
; NON DÉTAILLÉE — combine Keyboard_PeekOrPopEvent_66CF5 et sub_22E1.
; ==============================================================================================
Keyboard_QueryHandlerTable_44356		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		jmp	short loc_4436D

loc_4435B:
		push	cs
		call	near ptr Keyboard_PeekOrPopEvent_44312
		or	al, al
		jz	short loc_4436D
		mov	al, byte ptr dword_4F739
		mov	ah, 0
		test	[bp+arg_0], ax
		jnz	short loc_44385

loc_4436D:
		push	large 40000h
		push	6D59h
		call	CRT_Memset_Public
		add	sp, 6
		cmp	byte_4DDC6, 0
		jnz	short loc_4435B

loc_44385:
		mov	ax, 6D59h
		pop	bp
		retf
Keyboard_QueryHandlerTable_44356		endp

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
Keyboard_Method_ReturnTypeTag_4438A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	cs
		call	near ptr Keyboard_QueryHandlerTable_44356
		pop	cx
		mov	bx, ax
		mov	eax, [bx]
		mov	[si], eax
		mov	ax, si
		pop	si
		pop	bp
		retf
Keyboard_Method_ReturnTypeTag_4438A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_443A6		proc far
		push	bp
		mov	bp, sp
		mov	ax, 6D59h
		pop	bp
		retf
sub_443A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_443AE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		call	Keyboard_ReportErrorIfActive_44511
		push	[bp+arg_0]
		push	cs
		call	near ptr Keyboard_QueryHandlerTable_44356
		pop	cx
		pop	bp
		retf
sub_443AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (2 sur
; 2), à Keyboard_QueryAndDispatch_3E5C7 (sub_3E5C7 de OPTEST.EXE). Code non comparé
; instruction par instruction. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Keyboard_QueryAndDispatch_66DA3 (sub_66DA3 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine sub_66EF4 et
; Keyboard_Method_ReturnTypeTag... (Keyboard_QueryHandlerTable-related, sub_66D6D) — accesseur
; final du cluster clavier de ce segment.
; ==============================================================================================
Keyboard_QueryAndDispatch_443C0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		call	Keyboard_ReportErrorIfActive_44511
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
Keyboard_QueryAndDispatch_443C0		endp

; START OF FUNCTION CHUNK FOR Keyboard_QueryAndDispatch_443C0
		db 0E8h
; END OF FUNCTION CHUNK FOR Keyboard_QueryAndDispatch_443C0
seg171		ends
