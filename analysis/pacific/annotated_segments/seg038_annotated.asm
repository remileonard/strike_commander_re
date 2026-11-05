seg038		segment	para public 'CODE' use16
		assume cs:seg038
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0D0h, 0Bh, 0C0h

loc_1AFD3:
		db 8Bh, 0C2h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 12 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à RadioQueue_RemoveSlot (sub_1EA36 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,69L — retire une
; entrée de la table de messages actifs (globals 0x5034/0x5054/0x5064/0x5084, max 8 slots),
; décrémente le compteur (word_6DF26), déplace la dernière entrée (swap-remove) : libération
; d'un slot de la file de messages radio actifs.
; ==============================================================================================
RadioQueue_RemoveSlot		proc far
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	byte_7C99A, 0
		xor	cx, cx
		jmp	short loc_1B057

loc_1AFE5:
		mov	bx, cx
		shl	bx, 2
		mov	eax, dword_7976E
		sub	[bx+6158h], eax
		mov	bx, cx
		shl	bx, 2
		cmp	dword ptr [bx+6158h], 0
		jg	short loc_1B056
		mov	si, cx
		dec	word_77356
		jz	short loc_1B054
		mov	di, word_77356
		mov	bx, di
		shl	bx, 2
		mov	eax, [bx+6158h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+6158h], eax
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+6188h]
		mov	bx, si
		shl	bx, 1
		mov	[bx+6188h], ax
		mov	bx, di
		shl	bx, 2
		mov	ax, [bx+61A2h]
		mov	dx, [bx+61A0h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+61A2h], ax
		mov	[bx+61A0h], dx
		mov	al, [di+61D0h]
		mov	[si+61D0h], al
		jmp	short loc_1B057

loc_1B054:
		jmp	short loc_1B057

loc_1B056:
		inc	cx

loc_1B057:
		cmp	cx, word_77356
		jl	short loc_1AFE5
		nop
		push	cs
		call	near ptr sub_1B5A9
		pop	di
		pop	si
		pop	bp
		retf
RadioQueue_RemoveSlot		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à RadioQueue_AllocateSlot (sub_1EAC5 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,90L —
; recherche/insère une entrée dans la même table de messages actifs (limite 8, timer
; décrémenté par dword_70458) : allocation/mise à jour d'un slot de message radio actif
; (gestion du timer de cooldown).
; ==============================================================================================
RadioQueue_AllocateSlot		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	di, [bp+arg_4]
		or	di, di
		jnz	short loc_1B078
		jmp	loc_1B0F9

loc_1B078:
		mov	si, word_77356
		cmp	si, 0Ch
		jge	short loc_1B087
		inc	word_77356
		jmp	short loc_1B0C1

loc_1B087:
		xor	cx, cx
		mov	si, cx
		shl	si, 2
		add	si, 6158h
		mov	eax, [si]
		mov	[bp+var_8], eax
		xor	dx, dx
		jmp	short loc_1B0B9

loc_1B09D:
		mov	bx, dx
		shl	bx, 2
		mov	eax, [bx+6158h]
		cmp	eax, [bp+var_8]
		jge	short loc_1B0B8
		mov	bx, dx
		shl	bx, 2
		mov	[bp+var_8], eax
		mov	cx, dx

loc_1B0B8:
		inc	dx

loc_1B0B9:
		cmp	dx, word_77356
		jl	short loc_1B09D
		mov	si, cx

loc_1B0C1:
		mov	[bp+var_4], 800h
		mov	eax, [bp+var_4]
		mov	bx, si
		shl	bx, 2
		mov	[bx+6158h], eax
		mov	bx, si
		shl	bx, 1
		mov	[bx+6188h], di
		mov	bx, si
		shl	bx, 2
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		mov	[bx+61A2h], ax
		mov	[bx+61A0h], dx
		mov	al, [bp+arg_6]
		mov	[si+61D0h], al

loc_1B0F9:
		pop	di
		pop	si
		leave
		retf
RadioQueue_AllocateSlot		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 12 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à RadioQueue_RemoveByPos (sub_1EB5C de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,73L — recherche
; une entrée par coordonnées (+0x5064/0x5066) et la retire (swap-remove) : suppression d'un
; message actif par position.
; ==============================================================================================
RadioQueue_RemoveByPos		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		xor	cx, cx
		jmp	short loc_1B174

loc_1B106:
		mov	bx, cx
		shl	bx, 2
		mov	ax, [bx+61A2h]
		mov	dx, [bx+61A0h]
		cmp	ax, [bp+arg_2]
		jnz	short loc_1B173
		cmp	dx, [bp+arg_0]
		jnz	short loc_1B173
		mov	si, cx
		dec	word_77356
		jz	short loc_1B171
		mov	di, word_77356
		mov	bx, di
		shl	bx, 2
		mov	eax, [bx+6158h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+6158h], eax
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+6188h]
		mov	bx, si
		shl	bx, 1
		mov	[bx+6188h], ax
		mov	bx, di
		shl	bx, 2
		mov	ax, [bx+61A2h]
		mov	dx, [bx+61A0h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+61A2h], ax
		mov	[bx+61A0h], dx
		mov	al, [di+61D0h]
		mov	[si+61D0h], al
		jmp	short loc_1B174

loc_1B171:
		jmp	short loc_1B174

loc_1B173:
		inc	cx

loc_1B174:
		cmp	cx, word_77356
		jl	short loc_1B106
		pop	di
		pop	si
		pop	bp
		retf
RadioQueue_RemoveByPos		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à RadioQueue_FindOldestSlot (sub_1EBDD de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,66L — recherche
; dans la table des 8 slots celui associé à un objet donné (si) avec le timer le plus ancien :
; sélection du slot de message radio le plus prioritaire/ancien pour une source donnée.
; ==============================================================================================
RadioQueue_FindOldestSlot		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	cx, 0FFFFh
		cmp	byte_77359, 0
		jz	short loc_1B1A8
		mov	al, byte_77358
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		cmp	[bx+6188h], si
		jnz	short loc_1B1A8
		mov	al, byte_77358
		mov	ah, 0
		jmp	short loc_1B1E4

loc_1B1A8:
		xor	dx, dx
		jmp	short loc_1B1DC

loc_1B1AC:
		mov	bx, dx
		shl	bx, 1
		cmp	[bx+6188h], si
		jnz	short loc_1B1DB
		cmp	cx, 0FFFFh
		jz	short loc_1B1CB
		mov	bx, dx
		shl	bx, 2
		mov	eax, [bx+6158h]
		cmp	eax, [bp+var_4]
		jge	short loc_1B1DB

loc_1B1CB:
		mov	bx, dx
		shl	bx, 2
		mov	eax, [bx+6158h]
		mov	[bp+var_4], eax
		mov	cx, dx

loc_1B1DB:
		inc	dx

loc_1B1DC:
		cmp	dx, word_77356
		jl	short loc_1B1AC
		mov	ax, cx

loc_1B1E4:
		pop	si
		leave
		retf
RadioQueue_FindOldestSlot		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 22 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à RadioQueue_RegisterMessage (sub_1EC46 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,154L — réserve
; un slot de message (sub_1EBDD), enregistre position/priorité, traite spécialement le cas où
; la source est le joueur (word_722E6) : enregistrement d'un nouveau message radio actif —
; cœur du système de chatter radio (lié à sub_CB45/sub_CC7A du seg006).
; ==============================================================================================
RadioQueue_RegisterMessage		proc far

var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+84h], 0
		mov	[bp+var_2], 0FFh
		push	word ptr es:[bx+0Dh]
		push	cs
		call	near ptr RadioQueue_FindOldestSlot
		pop	cx
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0FFFFh
		jnz	short loc_1B215
		jmp	loc_1B319

loc_1B215:
		mov	bx, [bp+var_4]
		mov	al, [bx+61D0h]
		mov	[bp+var_2], al
		shl	bx, 2
		mov	ax, [bx+61A2h]
		mov	dx, [bx+61A0h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+86h], ax
		mov	es:[bx+84h], dx
		mov	ax, es:[bx+0Dh]
		cmp	ax, word_7CADA
		jnz	short loc_1B2BE
		cmp	dword_7735E, 0
		jz	short loc_1B24E
		mov	ax, 1
		jmp	short loc_1B250

loc_1B24E:
		xor	ax, ax

loc_1B250:
		or	al, al
		jnz	short loc_1B260
		push	2
		call	sub_5EFBF
		pop	cx
		or	al, al
		jz	short loc_1B267

loc_1B260:
		mov	[bp+var_4], 0FFFFh
		jmp	short loc_1B2BE

loc_1B267:
		mov	al, byte ptr [bp+var_4]
		mov	byte_77358, al
		mov	al, byte_77359
		mov	ah, 0
		push	ax
		mov	al, [bp+var_2]
		push	ax
		push	large [bp+arg_0]
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+84h]
		nop
		push	cs
		call	near ptr sub_1B3FC
		add	sp, 0Ch
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1B2B9
		mov	[bp+var_8], 700h
		mov	eax, [bp+var_8]
		mov	bx, [bp+var_4]
		shl	bx, 2
		mov	[bx+6158h], eax
		mov	al, byte ptr [bp+var_4]
		mov	byte_77358, al
		mov	al, byte_77359
		inc	al
		mov	byte_77359, al
		jmp	short loc_1B260

loc_1B2B9:
		mov	byte_77359, 0

loc_1B2BE:
		cmp	[bp+var_4], 0FFFFh
		jz	short loc_1B319
		mov	si, [bp+var_4]
		dec	word_77356
		jz	short loc_1B319
		mov	di, word_77356
		mov	bx, di
		shl	bx, 2
		mov	eax, [bx+6158h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+6158h], eax
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+6188h]
		mov	bx, si
		shl	bx, 1
		mov	[bx+6188h], ax
		mov	bx, di
		shl	bx, 2
		mov	ax, [bx+61A2h]
		mov	dx, [bx+61A0h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+61A2h], ax
		mov	[bx+61A0h], dx
		mov	al, [di+61D0h]
		mov	[si+61D0h], al
		jmp	short loc_1B319

loc_1B319:
		mov	al, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
RadioQueue_RegisterMessage		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AV_SyncComputeOffset (sub_1ED7F de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,16L — calcule deux
; offsets temporels (dword_72140/72144) à partir d'une table (word_70E62) : synchronisation
; audio/vidéo (offset de lecture).
; ==============================================================================================
AV_SyncComputeOffset		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, word_7AF7E
		mov	ax, [bx+6]
		add	ax, [bp+arg_0]
		mov	word_7C912, ax
		add	ax, 0Ch
		mov	word_7C916, ax
		pop	bp
		retf
AV_SyncComputeOffset		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AV_SyncInit (sub_1ED97 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,19L — initialise la synchro
; audio/vidéo puis appelle sub_1ED7F(0xBC) : initialisation de la synchronisation d'une
; séquence audio/animation.
; ==============================================================================================
AV_SyncInit		proc far
		push	bp
		mov	bp, sp
		mov	bx, word_7AF7E
		mov	ax, [bx+4]
		mov	word_7C910, ax
		mov	ax, [bx+8]
		mov	word_7C914, ax
		push	0BBh
		push	cs
		call	near ptr AV_SyncComputeOffset
		pop	cx
		pop	bp
		retf
AV_SyncInit		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Text_ParseInt (sub_1EDB4 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,65L — parse un nombre depuis
; une chaîne (sub_2D87=conversion chiffre) caractère par caractère : parseur d'entier depuis
; une chaîne (utilisé par le format de texte de briefing/dialogue).
; ==============================================================================================
Text_ParseInt		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		jmp	short loc_1B392

loc_1B361:
		push	0Ah
		push	large [bp+arg_0]
		call	CRT_MemFamily_Extra3
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_1B38C
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		inc	dx
		mov	word ptr [bp+arg_0+2], ax
		mov	word ptr [bp+arg_0], dx
		dec	si
		jmp	short loc_1B392

loc_1B38C:
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_1B3A5

loc_1B392:
		or	si, si
		jz	short loc_1B39F
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_1B361

loc_1B39F:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]

loc_1B3A5:
		pop	si
		leave
		retf
Text_ParseInt		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Text_SplitParagraphs (sub_1EE07 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,52L — copie une chaîne
; jusqu'au saut de ligne (0x0A), détecte les doubles sauts de ligne (paragraphe) : découpage
; de texte en lignes/paragraphes pour l'affichage de briefing.
; ==============================================================================================
Text_SplitParagraphs		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	cx, [bp+arg_0]
		mov	[bp+var_1], 1
		xor	dx, dx
		jmp	short loc_1B3E5

loc_1B3B9:
		les	bx, [bp+arg_2]
		add	bx, dx
		cmp	byte ptr es:[bx], 0Ah
		jnz	short loc_1B3D6
		mov	bx, dx
		add	bx, [bp+arg_2]
		cmp	byte ptr es:[bx+1], 0
		jz	short loc_1B3F0
		mov	[bp+var_1], 0
		jmp	short loc_1B3F0

loc_1B3D6:
		les	bx, [bp+arg_2]
		add	bx, dx
		mov	al, es:[bx]
		mov	bx, cx
		add	bx, dx
		mov	[bx], al
		inc	dx

loc_1B3E5:
		les	bx, [bp+arg_2]
		add	bx, dx
		cmp	byte ptr es:[bx], 0
		jnz	short loc_1B3B9

loc_1B3F0:
		mov	bx, cx
		add	bx, dx
		mov	byte ptr [bx], 0
		mov	al, [bp+var_1]
		leave
		retf
Text_SplitParagraphs		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B3FC		proc far

var_C4		= word ptr -0C4h
var_A4		= word ptr -0A4h
var_24		= word ptr -24h
var_14		= dword ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 0C4h
		push	si
		mov	[bp+var_1], 1
		mov	al, [bp+arg_8]
		cbw
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Text_ComputeMessageWidth
		add	sp, 6
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jnz	short loc_1B429
		jmp	loc_1B5A3

loc_1B429:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 74h
		push	word ptr [bp+arg_0+2]
		push	ax
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	sub_38D6
		add	sp, 8
		push	[bp+arg_A]
		push	large [bp+var_6]
		push	cs
		call	near ptr Text_ParseInt
		add	sp, 6
		mov	[bp+var_8], dx
		mov	[bp+var_A], ax
		push	dx
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		push	cs
		call	near ptr Text_SplitParagraphs
		add	sp, 6
		mov	[bp+var_1], al
		mov	al, [bp+arg_8]
		cbw
		lea	ax, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		push	0C3Fh
		push	61EAh
		call	CRT_Msg_Sprintf1
		add	sp, 8
		jmp	loc_1B554

loc_1B483:
		mov	al, [si+1]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	cx, ax
		mov	al, [si+2]
		mov	[bp+var_F], al
		mov	al, [si+3]
		mov	[bp+var_10], al
		mov	byte ptr [si+1], 46h
		mov	byte ptr [si+2], 73h
		mov	byte ptr [si+3], 0
		mov	word ptr [bp+var_14+2], ds
		mov	word ptr [bp+var_14], 0C46h
		cmp	cx, 43h
		jnz	short loc_1B4C4
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 74h
		mov	word ptr [bp+var_14+2], ax
		mov	word ptr [bp+var_14], dx

loc_1B4C4:
		cmp	cx, 4Eh
		jnz	short loc_1B4D8
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 54h
		mov	word ptr [bp+var_14+2], ax
		mov	word ptr [bp+var_14], dx

loc_1B4D8:
		cmp	cx, 53h
		jnz	short loc_1B4EA
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+94h]
		mov	[bp+var_14], eax

loc_1B4EA:
		cmp	cx, 23h
		jnz	short loc_1B511
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+92h]
		push	0C48h
		lea	ax, [bp+var_C4]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		lea	ax, [bp+var_C4]
		mov	word ptr [bp+var_14+2], ss
		mov	word ptr [bp+var_14], ax

loc_1B511:
		push	large [bp+var_14]
		push	61EAh
		lea	ax, [bp+var_A4]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	al, [bp+var_F]
		mov	[si+2], al
		mov	al, [bp+var_10]
		mov	[si+3], al
		mov	ax, si
		add	ax, 2
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	CRT_Strcat
		add	sp, 4
		lea	ax, [bp+var_A4]
		push	ax
		push	61EAh
		call	CRT_Strcpy
		add	sp, 4

loc_1B554:
		push	25h
		push	61EAh
		call	CRT_Strchr_WordAligned
		add	sp, 4
		mov	si, ax
		or	ax, ax
		jz	short loc_1B56A
		jmp	loc_1B483

loc_1B56A:
		mov	[bp+var_E], 200h
		mov	eax, [bp+var_E]
		mov	dword_7735A, eax
		mov	word_77360, ds
		mov	word ptr dword_7735E, 61EAh
		mov	byte_77362, 0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+53h]
		mov	byte_77362, al
		mov	al, [bp+arg_8]
		mov	byte_77363, al
		mov	bx, es:[bx+0Dh]
		mov	al, [bx+51h]
		mov	byte_7C99B, al

loc_1B5A3:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_1B3FC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B5A9		proc far
		push	bp
		mov	bp, sp
		cmp	dword_7735E, 0
		jz	short loc_1B5DC
		mov	eax, dword_7976E
		sub	dword_7735A, eax
		cmp	dword_7735A, 0
		jge	short loc_1B5DC
		mov	dword_7735A, 0
		mov	dword_7735E, 0
		mov	byte_7C99A, 1

loc_1B5DC:
		pop	bp
		retf
sub_1B5A9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Text_ToUpper (sub_1F0CD de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,35L — met en majuscule chaque
; caractère alphabétique d'une chaîne ASCIIZ (plage a-z) : conversion en majuscules (strupr)
; pour texte radio/UI.
; ==============================================================================================
Text_ToUpper		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		jmp	short loc_1B604

loc_1B5E6:
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		cbw
		add	ax, 0FF9Fh
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 1Ah
		jnb	short loc_1B601
		mov	al, es:[bx]
		add	al, 0E0h
		mov	es:[bx], al

loc_1B601:
		inc	[bp+arg_0]

loc_1B604:
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_1B5E6
		leave
		retf
Text_ToUpper		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B60F		proc far

var_50		= word ptr -50h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		push	di
		cmp	byte_77362, 0
		jnz	short loc_1B621
		jmp	loc_1B6C9

loc_1B621:
		push	ds
		push	offset aPAK
		push	large dword_77364
		push	ds
		push	offset aINTEL
		lea	ax, [bp+var_50]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		push	0
		push	2
		mov	al, byte_77363
		mov	ah, 0
		push	ax
		mov	al, byte_77362
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		call	sub_5EF07
		add	sp, 0Ah
		or	al, al
		jz	short loc_1B6C4
		cmp	byte_77359, 0
		jz	short loc_1B6C4
		mov	al, byte_77358
		mov	ah, 0
		mov	si, ax
		dec	word_77356
		jz	short loc_1B6BA
		mov	di, word_77356
		mov	bx, di
		shl	bx, 2
		mov	eax, [bx+6158h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+6158h], eax
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+6188h]
		mov	bx, si
		shl	bx, 1
		mov	[bx+6188h], ax
		mov	bx, di
		shl	bx, 2
		mov	ax, [bx+61A2h]
		mov	dx, [bx+61A0h]
		mov	bx, si
		shl	bx, 2
		mov	[bx+61A2h], ax
		mov	[bx+61A0h], dx
		mov	al, [di+61D0h]
		mov	[si+61D0h], al
		jmp	short loc_1B6BA

loc_1B6BA:
		mov	byte_77359, 0
		mov	byte_77358, 0FFh

loc_1B6C4:
		mov	byte_77362, 0

loc_1B6C9:
		cmp	dword_7735E, 0
		jz	short loc_1B707
		push	[bp+arg_0]
		push	61DCh
		call	TextFormat_ApplyStyleAttributeB_67C9A
		add	sp, 4
		push	large dword_7735E
		push	cs
		call	near ptr Text_ToUpper
		add	sp, 4
		push	1
		push	0
		push	large dword_7735E
		push	word_7C912
		push	61DCh
		push	ds
		push	offset unk_7CEFE
		call	sub_15D3D
		add	sp, 10h

loc_1B707:
		pop	di
		pop	si
		leave
		retf
sub_1B60F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Radio_GetOptionLetterByIndex_1F200 (sub_1F200 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 20
; lignes - CONFIRME (information externe de Remi + lecture du code) : accesseur simple pour le
; systeme de menu radio des coequipiers. Prend (entite, index) en argument, verifie l'index
; contre le compteur OPTS (PilotProfile+0x86), retourne la lettre a cette position
; (PilotProfile+0x88+index) si valide, sinon 0xFF ('option absente'). OPTS (chunk du fichier
; PROF) contient une sequence de lettres minuscules representant les QUESTIONS/ORDRES qu'on
; peut poser a ce personnage par radio - chaque lettre correspond a un type de question fixe
; du jeu (voir Radio_EvaluateOptionAvailability_16433 pour le detail des 9 types reconnus 'e'
; a 'm'). Un personnage sans OPTS (Hammer, PNJ non-interactif) n'a donc aucune question
; disponible - coherent avec son statut non-radio.
; ==============================================================================================
Radio_GetOptionLetterByIndex_1B70B		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_4]
		mov	cl, 0FFh
		les	bx, [bp+arg_0]
		cmp	es:[bx+88h], dx
		jbe	short loc_1B724
		add	bx, dx
		mov	cl, es:[bx+8Ah]

loc_1B724:
		mov	al, cl
		pop	bp
		retf
Radio_GetOptionLetterByIndex_1B70B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B728		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	0
		mov	al, byte_7C9A0
		push	ax
		push	large dword_7C99C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	dx, [bp+var_4]
		add	dx, word ptr dword_7C9A2
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		jmp	short loc_1B782

loc_1B75C:
		les	bx, [bp+var_4]
		mov	ax, es:[bx]
		mov	[bp+var_A], ax
		add	[bp+var_4], 2
		cmp	ax, [bp+arg_0]
		jnz	short loc_1B776
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short loc_1B78E

loc_1B776:
		les	bx, [bp+var_4]
		inc	[bp+var_4]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_1B776

loc_1B782:
		mov	ax, [bp+var_4]
		cmp	ax, [bp+var_8]
		jb	short loc_1B75C
		xor	dx, dx
		xor	ax, ax

loc_1B78E:
		leave
		retf
sub_1B728		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Text_ComputeMessageWidth (sub_1F285 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,55L — table
; indexée (max 0x21 entrées, +0xF), résout un texte via sub_5C832 avec accumulation de largeur
; : calcul de la largeur totale d'un message pour son affichage (retour ligne).
; ==============================================================================================
Text_ComputeMessageWidth		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	dx, [bp+arg_4]
		mov	[bp+var_4], 0
		cmp	dx, 22h
		jnb	short loc_1B7DB
		mov	ax, dx
		shl	ax, 1
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	si, es:[bx+0Fh]
		or	si, si
		jz	short loc_1B7DB
		push	0
		mov	bx, [bp+arg_0]
		mov	al, es:[bx+6]
		push	ax
		push	large es:[bx+2]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		add	word ptr [bp+var_4], si

loc_1B7DB:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
Text_ComputeMessageWidth		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B7E4		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	byte ptr [si+20h], 1
		mov	byte ptr [si+21h], 0
		mov	byte ptr [si+22h], 0
		mov	[si+2], ax
		push	si
		call	UI_PositionListLabels
		pop	cx
		push	cs
		call	near ptr AV_SyncInit
		pop	si
		leave
		retf
sub_1B7E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B811		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	dword_7735E, 0
		jz	short loc_1B824
		mov	ax, 1
		jmp	short loc_1B826

loc_1B824:
		xor	ax, ax

loc_1B826:
		or	al, al
		jz	short loc_1B835
		mov	ax, dx
		add	ax, 12h
		push	ax
		push	cs
		call	near ptr sub_1B60F
		pop	cx

loc_1B835:
		pop	bp
		retf
sub_1B811		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B837		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, word_7CADA
		or	di, di
		jz	short loc_1B8A2
		les	bx, [di+63h]
		cmp	byte ptr es:[bx+48h], 0
		jz	short loc_1B859
		mov	ax, 1
		jmp	short loc_1B85B

loc_1B859:
		xor	ax, ax

loc_1B85B:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1B88C
		mov	[bp+var_4], 0
		cmp	dword ptr [di+5Ah], 0
		jz	short loc_1B881
		mov	ax, [di+5Ch]
		mov	dx, [di+5Ah]
		add	dx, 1Ah
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		jmp	short loc_1B881

loc_1B881:
		push	large [bp+var_4]
		push	cs
		call	near ptr RadioQueue_RegisterMessage
		add	sp, 4

loc_1B88C:
		cmp	dword_7735E, 0
		jz	short loc_1B899
		mov	ax, 1
		jmp	short loc_1B89B

loc_1B899:
		xor	ax, ax

loc_1B89B:
		mov	[si+20h], al
		push	cs
		call	near ptr RadioQueue_RemoveSlot

loc_1B8A2:
		pop	di
		pop	si
		leave
		retf
sub_1B837		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B8A6		proc far
		push	bp
		mov	bp, sp
		push	seg seg038
		push	offset sub_1B9B1
		push	large 1000Ch
		push	4
		push	6158h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	dword_7735A, 0
		mov	word_7C90C, 0
		mov	word_7C90E, 0
		mov	byte_7C919, 0
		mov	dword_7C99C, 0
		mov	byte_7C9A0, 2
		mov	byte_7C9A1, 0
		mov	dword_7C9A2, 0
		mov	dword_7C9A6, 0
		mov	byte_7C9AA, 2
		mov	byte_7C9AB, 0
		mov	dword_7C9AC, 0
		pop	bp
		retf
sub_1B8A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B916		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	byte_7C9AB, 0
		jz	short loc_1B94A
		cmp	dword_7C9A6, 0
		jz	short loc_1B94A
		push	0
		mov	al, byte_7C9AA
		push	ax
		mov	eax, dword_7C9A6
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_1B94A

loc_1B94A:
		mov	dword_7C9A6, 0
		mov	byte_7C9AB, 0
		mov	dword_7C9AC, 0
		cmp	byte_7C9A1, 0
		jz	short loc_1B98F
		cmp	dword_7C99C, 0
		jz	short loc_1B98F
		push	0
		mov	al, byte_7C9A0
		push	ax
		mov	eax, dword_7C99C
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_1B98F

loc_1B98F:
		mov	dword_7C99C, 0
		mov	byte_7C9A1, 0
		mov	dword_7C9A2, 0
		push	61DCh
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		leave
		retf
sub_1B916		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1B9B1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_1B9C7
		push	4
sub_1B9B1		endp

; START OF FUNCTION CHUNK FOR sub_1B9B1
		db 9Ah
		push	7
; END OF FUNCTION CHUNK FOR sub_1B9B1
seg038		ends
