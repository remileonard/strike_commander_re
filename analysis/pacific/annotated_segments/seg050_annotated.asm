seg050		segment	para public 'CODE' use16
		assume cs:seg050
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 0, 59h

loc_1E143:
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E146		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1E146		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Construct (sub_1FDBC de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Container_Construct (sub_21E90 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,28L — constructeur d'une liste chaînée vide
; (tête/queue à 0, type 0x1104) : constructeur de conteneur liste générique (template C++).
; ==============================================================================================
Container_Construct		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+2], ax
		mov	[si], ax
		push	0DCEh
		push	si
		nop
		push	cs
		call	near ptr Container_FindOrInsert
		add	sp, 4
		mov	[si+2], ax
		mov	[si], ax
		pop	si
		pop	bp
		retf
Container_Construct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Container_ConstructTyped (sub_1FDDE de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Container_ConstructTyped (sub_21EB2 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,24L — variante de sub_21E90 avec
; type paramétrable : constructeur de conteneur liste générique (variante paramétrée).
; ==============================================================================================
Container_ConstructTyped		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+2], ax
		mov	[si], ax
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Container_FindOrInsert
		add	sp, 4
		mov	[si+2], ax
		mov	[si], ax
		pop	si
		pop	bp
		retf
Container_ConstructTyped		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E192		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1E1AB
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1E1B6

loc_1E1AB:
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Container_ConstructTyped
		add	sp, 4

loc_1E1B6:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1E192		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E1BB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1E1D4
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1E1DB

loc_1E1D4:
		xor	ax, ax
		mov	[si+2], ax
		mov	[si], ax

loc_1E1DB:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_1E1BB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Container_Destruct
; (sub_21F21 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,31L — destructeur : vide la liste (sub_22392) puis libère si demandé (sub_338) :
; destructeur du conteneur liste générique.
; ==============================================================================================
Container_Destruct		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1E203
		push	si
		nop
		push	cs
		call	near ptr Container_Clear
		pop	cx
		test	di, 1
		jz	short loc_1E203
		push	si
		call	sub_3B2
		pop	cx

loc_1E203:
		pop	di
		pop	si
		pop	bp
		retf
Container_Destruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E207		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		xor	si, si
		push	[bp+arg_2]
		push	ax
		nop
		push	cs
		call	near ptr Container_FindOrInsert
		add	sp, 4
		mov	dx, ax
		or	dx, dx
		jz	short loc_1E23F
		mov	bx, [bp+arg_4]
		xor	cx, cx
		or	dx, dx
		jz	short loc_1E23D
		or	bx, bx
		jz	short loc_1E23D
		push	bx
		push	dx
		nop
		push	cs
		call	near ptr sub_1EFF9
		add	sp, 4
		mov	cx, ax
		jmp	short loc_1E23D

loc_1E23D:
		mov	si, cx

loc_1E23F:
		or	si, si
		jz	short loc_1E247
		mov	al, 1
		jmp	short loc_1E249

loc_1E247:
		mov	al, 0

loc_1E249:
		pop	si
		pop	bp
		retf
sub_1E207		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à List_AppendIfNonNull_21F8D (sub_21F8D de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, args (liste,
; nœud) : appelle List_AppendTail_22C23 sur l'en-tête pointé par la liste si la liste et le
; nœud sont non nuls. Anciennement Container_KeyEquals (n'est pas un test d'égalité). Appelée
; avec le tag 0x59C3 (liste des entités du monde) au spawn et au chargement de mission.
; ==============================================================================================
List_AppendIfNonNull_1E24C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [si]
		mov	bx, [bp+arg_2]
		xor	cx, cx
		or	dx, dx
		jz	short loc_1E273
		or	bx, bx
		jz	short loc_1E273
		push	bx
		push	dx
		nop
		push	cs
		call	near ptr sub_1EFF9
		add	sp, 4
		mov	cx, ax
		jmp	short loc_1E273

loc_1E273:
		mov	[bp+var_2], cx
		cmp	[bp+var_2], 0
		jz	short loc_1E280
		mov	al, 1
		jmp	short loc_1E282

loc_1E280:
		mov	al, 0

loc_1E282:
		pop	si
		leave
		retf
List_AppendIfNonNull_1E24C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Container_UnlinkNode
; (sub_1FF3C de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Container_UnlinkNode (sub_21FC6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,36L — retire un nœud (di) de la liste chaînée (mise à jour
; tête/queue/liens) : unlink de nœud dans le conteneur liste (opération interne).
; ==============================================================================================
Container_UnlinkNode		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		cmp	[si], di
		jnz	short loc_1E29C
		mov	ax, [di+9]
		mov	[si], ax

loc_1E29C:
		cmp	[si+2], di
		jnz	short loc_1E2A4
		mov	[si+2], dx

loc_1E2A4:
		or	dx, dx
		jz	short loc_1E2B0
		mov	ax, [di+9]
		mov	bx, dx
		mov	[bx+9], ax

loc_1E2B0:
		pop	di
		pop	si
		pop	bp
		retf
Container_UnlinkNode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_FindAndRemove (sub_1FF6B de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Container_FindAndRemove (sub_21FF5 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,29L — recherche (sub_22555)
; puis retire (sub_2235C) une entrée par clé : suppression d'une entrée du conteneur par clé
; (find+remove).
; ==============================================================================================
Container_FindAndRemove		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Container_FindByKey
		add	sp, 4
		mov	di, ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Container_RemoveEntry
		add	sp, 4
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
Container_FindAndRemove		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E2DA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	ax
		push	cs
		call	near ptr Container_FindAndRemove
		add	sp, 4
		mov	si, ax
		or	si, si
		jz	short loc_1E2FD
		push	3
		push	ax
		nop
		push	cs
		call	near ptr Container_Op_1EFD2
		add	sp, 4

loc_1E2FD:
		or	si, si
		jz	short loc_1E306
		mov	ax, 1
		jmp	short loc_1E308

loc_1E306:
		xor	ax, ax

loc_1E308:
		pop	si
		pop	bp
		retf
sub_1E2DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Container_FindOrInsert
; (sub_2204C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,69L — recherche une entrée existante (sub_22555) ; sinon alloue un nœud (sub_658,
; 15 octets), copie la clé (jusqu'à 8 car., sub_2AFB5/sub_2B6D) et l'insère : 'find or insert'
; du conteneur associatif clé→valeur (dictionnaire par nom).
; ==============================================================================================
Container_FindOrInsert		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Container_FindByKey
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_1E378
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_1E366
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	8
		push	[bp+var_2]
		push	di
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [di+8], 0
		mov	word ptr [di+9], 0
		xor	ax, ax
		mov	[di+0Dh], ax
		mov	[di+0Bh], ax
		mov	ax, di
		jmp	short loc_1E368

loc_1E366:
		mov	ax, di

loc_1E368:
		mov	di, ax
		or	di, di
		jz	short loc_1E378
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Container_Append
		add	sp, 4

loc_1E378:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
Container_FindOrInsert		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Container_Append
; (sub_20050 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à Container_Append
; (sub_220BF de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,35L — insère un nœud en fin de liste (chaînage tête/queue) : append au conteneur
; liste.
; ==============================================================================================
Container_Append		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_1E3AA
		mov	word ptr [di+9], 0
		cmp	word ptr [si+2], 0
		jnz	short loc_1E3A1
		mov	ax, di
		mov	[si+2], ax
		mov	[si], ax
		jmp	short loc_1E3AA

loc_1E3A1:
		mov	bx, [si+2]
		mov	[bx+9], di
		mov	[si+2], di

loc_1E3AA:
		pop	di
		pop	si
		pop	bp
		retf
Container_Append		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E3AE		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		jmp	short loc_1E3C3

loc_1E3C2:
		inc	di

loc_1E3C3:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_1E7CF
		add	sp, 4
		or	ax, ax
		jnz	short loc_1E3C2
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_1E3AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E3DA		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_1E3F6

loc_1E3EF:
		mov	ax, di
		dec	di
		or	ax, ax
		jge	short loc_1E407

loc_1E3F6:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_1E7CF
		add	sp, 4
		or	ax, ax
		jnz	short loc_1E3EF

loc_1E407:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_1E3DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E40E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, word_7AF7C
		mov	ax, [bx+6]
		mov	word_7C9F8, ax
		mov	ax, [bx+0Ah]
		mov	word_7C9FA, ax
		mov	ax, [bx+4]
		mov	word_7C9FC, ax
		mov	ax, [bx+8]
		mov	word_7C9FE, ax
		mov	dword_7CA00, 200h
		push	[bp+arg_2]
		push	word ptr [si]
		nop
		push	cs
		call	near ptr WorldObjects_CallSlot4OnAll_1F14D
		add	sp, 4
		call	sub_511DF
		pop	si
		pop	bp
		retf
sub_1E40E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E44F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si]
		nop
		push	cs
		call	near ptr Container_Op_1F113
		pop	cx
		pop	si
		pop	bp
		retf
sub_1E44F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObjects_CallSlot1COnActive_2217D (sub_2217D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; args (liste en arg_0, objet en arg_2) : parcourt la liste (tête à +0xB de l'en-tête, suivant
; à +2 du nœud) et pour chaque nœud dont l'octet +5 vaut 1 appelle le slot +0x1C avec (nœud,
; objet). Appelée par UIScreen_RenderGraphVGA_Wrapper_50E44 avec la liste 0x59C3 (entités du
; monde), elle-même appelée par TrackedObject_NotifyWorldObjects_2DFE4. Anciennement
; Container_NotifyAllActive. Rôle du slot +0x1C non identifié ; aucun lien prouvé avec
; AIEntity_MasterTick_5ACC (le tick de l'entité IA passe par
; WorldObjects_UpdateAllAndRemoveDead_221F2, slot +0x10).
; ==============================================================================================
WorldObjects_CallSlot1COnActive_1E461		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_1E487

loc_1E472:
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+3], 1
		jnz	short loc_1E487
		push	[bp+arg_2]
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4

loc_1E487:
		cmp	[bp+var_2], 0
		jnz	short loc_1E494
		mov	bx, [si]
		mov	ax, [bx+0Bh]
		jmp	short loc_1E49A

loc_1E494:
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]

loc_1E49A:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_1E472
		pop	si
		leave
		retf
WorldObjects_CallSlot1COnActive_1E461		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E4A6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word_77507, 0
		push	word ptr [si]
		nop
		push	cs
		call	near ptr sub_1E4C4
		pop	cx
		mov	ax, word_77507
		mov	word_77509, ax
		pop	si
		pop	bp
		retf
sub_1E4A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E4C4		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		jmp	short loc_1E54A

loc_1E4D8:
		inc	word_77507
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1E547
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_1E547
		push	0
		push	[bp+var_2]
		push	dx
		push	ax
		les	bx, word ptr [bp+var_6]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		or	al, al
		jz	short loc_1E547
		push	[bp+var_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		cmp	[bp+var_2], 0
		jz	short loc_1E542
		push	3
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_1E542

loc_1E542:
		mov	[bp+var_2], di
		jmp	short loc_1E54A

loc_1E547:
		mov	di, [bp+var_2]

loc_1E54A:
		cmp	[bp+var_2], 0
		jnz	short loc_1E555
		mov	ax, [si+0Bh]
		jmp	short loc_1E55B

loc_1E555:
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]

loc_1E55B:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_1E567
		jmp	loc_1E4D8

loc_1E567:
		pop	di
		pop	si
		leave
		retf
sub_1E4C4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObjects_IntegrateAllMotion_22320 (sub_22320 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 41L, LUE 2026-10-15. INTEGRATION DU MOUVEMENT DE TOUS LES OBJETS d'une liste (59C3h = objets
; du monde) : pour chaque noeud (tete [liste]+0x0B, suivant +2), appelle le slot +0x14 (pour
; un missile : WorldObject_IntegrateBodyMotion_3D31D, position += vitesse du corps * dt).
; Appelee par CombatTarget_WeaponActionSubsystem juste APRES
; WorldObjects_UpdateFrame_ResetCounters_221C2 (mises a jour +0x10 de tous les objets) :
; chaque frame, tous les objets sont mis a jour, puis tous sont deplaces.
; Ex-'Container_Op_22320'.
; ==============================================================================================
WorldObjects_IntegrateAllMotion_1E56B		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_1E588

loc_1E57C:
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx

loc_1E588:
		cmp	[bp+var_2], 0
		jnz	short loc_1E595
		mov	bx, [si]
		mov	ax, [bx+0Bh]
		jmp	short loc_1E59B

loc_1E595:
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]

loc_1E59B:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_1E57C
		pop	si
		leave
		retf
WorldObjects_IntegrateAllMotion_1E56B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Container_RemoveEntry
; (sub_2235C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,53L — retire une entrée spécifique du conteneur (via unlink sub_21FC6 identifié
; en amont) : suppression ciblée d'un nœud du conteneur.
; ==============================================================================================
Container_RemoveEntry		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jz	short loc_1E5D7
		mov	di, [si]
		xor	cx, cx
		jmp	short loc_1E5D3

loc_1E5BC:
		cmp	di, dx
		jnz	short loc_1E5CE
		push	di
		push	cx
		push	si
		push	cs
		call	near ptr Container_UnlinkNode
		add	sp, 6
		mov	al, 1
		jmp	short loc_1E5D9

loc_1E5CE:
		mov	cx, di
		mov	di, [di+9]

loc_1E5D3:
		or	di, di
		jnz	short loc_1E5BC

loc_1E5D7:
		mov	al, 0

loc_1E5D9:
		pop	di
		pop	si
		pop	bp
		retf
Container_RemoveEntry		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Container_Clear
; (sub_22392 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,37L — vide entièrement la liste (libère chaque nœud) : clear/destructeur de
; contenu du conteneur liste.
; ==============================================================================================
Container_Clear		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_1E601

loc_1E5E9:
		mov	bx, [si]
		mov	ax, [bx+9]
		mov	[bp+var_2], ax
		push	3
		push	bx
		nop
		push	cs
		call	near ptr Container_Op_1EFD2
		add	sp, 4
		mov	ax, [bp+var_2]
		mov	[si], ax

loc_1E601:
		cmp	word ptr [si], 0
		jnz	short loc_1E5E9
		xor	ax, ax
		mov	[si+2], ax
		mov	[si], ax
		pop	si
		leave
		retf
Container_Clear		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E610		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	si, [si]
		or	di, di
		jnz	short loc_1E638
		jmp	short loc_1E63C

loc_1E623:
		push	di
		push	si
		nop
		push	cs
		call	near ptr Container_RemoveAndDeleteObject_1F1C6
		add	sp, 4
		or	al, al
		jz	short loc_1E635
		mov	al, 1
		jmp	short loc_1E63E

loc_1E635:
		mov	si, [si+9]

loc_1E638:
		or	si, si
		jnz	short loc_1E623

loc_1E63C:
		mov	al, 0

loc_1E63E:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E610		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E642		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	si, [si]
		jmp	short loc_1E664

loc_1E64D:
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_1F2C0
		add	sp, 4
		or	al, al
		jz	short loc_1E661
		mov	al, 1
		jmp	short loc_1E66A

loc_1E661:
		mov	si, [si+9]

loc_1E664:
		or	si, si
		jnz	short loc_1E64D
		mov	al, 0

loc_1E66A:
		pop	si
		pop	bp
		retf
sub_1E642		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Container_Op_2241B
; (sub_2241B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,81L — (cluster conteneur) — opération de taille moyenne sur le conteneur, non
; détaillée.
; ==============================================================================================
Container_Op_1E66D		proc far

var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_E], eax
		push	8
		push	large [bp+var_E]
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		mov	[bp+var_2], 0
		mov	[bp+var_10], 0
		jmp	short loc_1E6CA

loc_1E69D:
		mov	bx, [bp+var_10]
		mov	eax, [bx+6]
		mov	[bp+var_14], eax
		push	8
		push	large [bp+var_14]
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_1E6C4
		mov	ax, 1
		jmp	short loc_1E6C6

loc_1E6C4:
		xor	ax, ax

loc_1E6C6:
		or	al, al
		jnz	short loc_1E6DB

loc_1E6CA:
		lea	ax, [bp+var_10]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_1E7CF
		add	sp, 4
		or	ax, ax
		jnz	short loc_1E69D

loc_1E6DB:
		mov	ax, [bp+var_10]
		pop	si
		leave
		retf
Container_Op_1E66D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. (liste, type, camp, précédent) : objet suivant dont l'octet +53 de la
; description vaut type et, pour un objet de la classe 16 ([objet+2] & 16), dont le camp
; [objet+81] vaut camp.
; ==============================================================================================
WorldObjects_FindNextOfType_1E6E1		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_1E726

loc_1E6ED:
		push	[bp+arg_6]
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_1E726
		les	bx, [bp+var_4]
		mov	al, es:[bx+35h]
		cmp	al, [bp+arg_2]
		jnz	short loc_1E726
		mov	bx, [bp+arg_6]
		test	byte ptr [bx+2], 10h
		jz	short loc_1E71F
		mov	al, [bx+51h]
		cmp	al, [bp+arg_4]
		jnz	short loc_1E726

loc_1E71F:
		mov	ax, [bp+arg_6]
		jmp	short loc_1E739
		jmp	short loc_1E71F

loc_1E726:
		lea	ax, [bp+arg_6]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_1E7CF
		add	sp, 4
		or	ax, ax
		jnz	short loc_1E6ED
		xor	ax, ax

loc_1E739:
		pop	si
		leave
		retf
WorldObjects_FindNextOfType_1E6E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E73C		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_1E76E

loc_1E748:
		push	[bp+arg_4]
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_1E76E
		les	bx, [bp+var_4]
		mov	al, es:[bx+35h]
		cmp	al, [bp+arg_2]
		jnz	short loc_1E76E
		mov	ax, [bp+arg_4]
		jmp	short loc_1E781

loc_1E76E:
		lea	ax, [bp+arg_4]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_1E7CF
		add	sp, 4
		or	ax, ax
		jnz	short loc_1E748
		xor	ax, ax

loc_1E781:
		pop	si
		leave
		retf
sub_1E73C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E784		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Container_FindByKey
		add	sp, 4
		mov	[si+4], ax
		cmp	word ptr [si+4], 0
		jz	short loc_1E7C4
		mov	di, [bp+arg_4]
		cmp	word ptr [di], 0
		jnz	short loc_1E7B1
		mov	bx, [si+4]
		mov	ax, [bx+0Bh]
		jmp	short loc_1E7B6

loc_1E7B1:
		mov	bx, [di]
		mov	ax, [bx+4]

loc_1E7B6:
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_1E7C4
		mov	bx, [bp+arg_4]
		mov	ax, [bx]
		jmp	short loc_1E7CB

loc_1E7C4:
		mov	bx, [bp+arg_4]
		xor	ax, ax
		mov	[bx], ax

loc_1E7CB:
		pop	di
		pop	si
		pop	bp
		retf
sub_1E784		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E7CF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_1E7EB
		mov	ax, [si]
		mov	[si+4], ax

loc_1E7E4:
		mov	word ptr [si+8], 0
		jmp	short loc_1E82D

loc_1E7EB:
		mov	ax, [di]
		mov	[si+8], ax
		push	word ptr [si+8]
		push	si
		nop
		push	cs
		call	near ptr Container_Op_1E875
		add	sp, 4
		mov	[si+4], ax
		cmp	word ptr [si+4], 0
		jnz	short loc_1E82D
		jmp	short loc_1E7E4

loc_1E807:
		cmp	word ptr [si+8], 0
		jnz	short loc_1E815
		mov	bx, [si+4]
		mov	ax, [bx+0Bh]
		jmp	short loc_1E81B

loc_1E815:
		mov	bx, [si+8]
		mov	ax, [bx+4]

loc_1E81B:
		mov	[si+8], ax
		cmp	word ptr [si+8], 0
		jnz	short loc_1E833
		mov	bx, [si+4]
		mov	ax, [bx+9]
		mov	[si+4], ax

loc_1E82D:
		cmp	word ptr [si+4], 0
		jnz	short loc_1E807

loc_1E833:
		mov	ax, [si+8]
		mov	[di], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_1E7CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Container_FindByKey
; (sub_22555 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,47L — recherche une entrée du conteneur par clé (comparaison via sub_21F8D) :
; lookup par clé dans le conteneur associatif.
; ==============================================================================================
Container_FindByKey		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	si, [si]
		jmp	short loc_1E86B

loc_1E84B:
		mov	eax, [si]
		cmp	eax, [di]
		jnz	short loc_1E862
		mov	eax, [si+4]
		cmp	eax, [di+4]
		jnz	short loc_1E862
		mov	ax, 1
		jmp	short loc_1E864

loc_1E862:
		xor	ax, ax

loc_1E864:
		or	al, al
		jnz	short loc_1E86F
		mov	si, [si+9]

loc_1E86B:
		or	si, si
		jnz	short loc_1E84B

loc_1E86F:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
Container_FindByKey		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Op_2258E (sub_2258E de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,51L — (cluster
; conteneur) — variante de recherche/insertion, non détaillée.
; ==============================================================================================
Container_Op_1E875		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		xor	di, di
		mov	si, [si]
		or	dx, dx
		jnz	short loc_1E8A3

loc_1E888:
		mov	ax, si
		jmp	short loc_1E8A9

loc_1E88C:
		or	di, di
		jnz	short loc_1E895
		mov	di, [si+0Bh]
		jmp	short loc_1E89C

loc_1E895:
		cmp	di, dx
		jz	short loc_1E888
		mov	di, [di+4]

loc_1E89C:
		or	di, di
		jnz	short loc_1E8A3
		mov	si, [si+9]

loc_1E8A3:
		or	si, si
		jnz	short loc_1E88C
		xor	ax, ax

loc_1E8A9:
		pop	di
		pop	si
		pop	bp
		retf
Container_Op_1E875		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E8AD		proc far

var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_1], 0
		jmp	short loc_1E8F9

loc_1E8C1:
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_1E8F9
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 8
		jz	short loc_1E8F3
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_1E8F9

loc_1E8F3:
		mov	[bp+var_1], 1
		jmp	short loc_1E906

loc_1E8F9:
		push	di
		push	si
		push	cs
		call	near ptr sub_1E7CF
		add	sp, 4
		or	ax, ax
		jnz	short loc_1E8C1

loc_1E906:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_1E8AD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1E90D		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		jmp	loc_1E9C2

loc_1E927:
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_1E942
		jmp	loc_1E9C2

loc_1E942:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+17h]
		cmp	al, [bp+arg_A]
		jnz	short loc_1E9C2
		push	[bp+var_4]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_1C], eax
		mov	eax, [di+4]
		mov	[bp+var_18], eax
		mov	eax, [di+8]
		mov	[bp+var_14], eax
		push	[bp+var_2]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	di, ax
		mov	eax, [di]
		sub	[bp+var_1C], eax
		mov	eax, [di+4]
		sub	[bp+var_18], eax
		mov	eax, [di+8]
		sub	[bp+var_14], eax
		push	large [bp+var_14]
		push	large [bp+var_18]
		push	large [bp+var_1C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		sar	eax, 8
		cmp	eax, [bp+arg_6]
		jge	short loc_1E9C2

loc_1E9BC:
		mov	ax, [bp+var_4]
		jmp	loc_1EA8F

loc_1E9C2:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr sub_1E7CF
		add	sp, 4
		or	ax, ax
		jz	short loc_1E9D5
		jmp	loc_1E927

loc_1E9D5:
		mov	[bp+var_4], 0
		jmp	loc_1EA72

loc_1E9DD:
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_1EA72
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+17h]
		cmp	al, [bp+arg_A]
		jnz	short loc_1EA72
		push	[bp+var_4]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_1C], eax
		mov	eax, [di+4]
		mov	[bp+var_18], eax
		mov	eax, [di+8]
		mov	[bp+var_14], eax
		push	[bp+var_2]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	di, ax
		mov	eax, [di]
		sub	[bp+var_1C], eax
		mov	eax, [di+4]
		sub	[bp+var_18], eax
		mov	eax, [di+8]
		sub	[bp+var_14], eax
		push	large [bp+var_14]
		push	large [bp+var_18]
		push	large [bp+var_1C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		sar	eax, 8
		cmp	eax, [bp+arg_6]
		jge	short loc_1EA72
		jmp	loc_1E9BC

loc_1EA72:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr sub_1E7CF
		add	sp, 4
		or	ax, ax
		jz	short loc_1EA8D
		mov	ax, [bp+var_4]
		cmp	ax, [bp+arg_4]
		jz	short loc_1EA8D
		jmp	loc_1E9DD

loc_1EA8D:
		xor	ax, ax

loc_1EA8F:
		pop	di
		pop	si
		leave
		retf
sub_1E90D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EA93		proc far

var_B2		= dword ptr -0B2h
var_AE		= dword ptr -0AEh
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= word ptr  10h
arg_C		= byte ptr  12h
arg_E		= byte ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 0B2h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		mov	eax, [bp+arg_6]
		mov	[bp+var_C], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	[bp+var_E], 0
		mov	[bp+var_12], 0
		mov	ax, [bp+arg_A]
		mov	[bp+var_18], ax
		movsx	eax, [bp+var_18]
		shl	eax, 8
		mov	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_16]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	dx, ax
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_76], eax
		mov	eax, [bx+4]
		mov	[bp+var_72], eax
		mov	eax, [bx+8]
		mov	[bp+var_6E], eax
		mov	[bp+var_20], 0
		or	di, di
		jnz	short loc_1EB26
		jmp	loc_1EBCC

loc_1EB26:
		push	di
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	[bp+var_22], ax
		push	[bp+arg_2]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	dx, ax
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_8E], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+4]
		mov	bx, dx
		sub	eax, [bx+4]
		mov	[bp+var_8A], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+8]
		mov	bx, dx
		sub	eax, [bx+8]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_9A]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_7A], eax
		push	eax
		push	large [bp+var_7E]
		push	large [bp+var_82]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		mov	[bp+var_20], eax

loc_1EBCC:
		cmp	[bp+arg_E], 0
		jz	short loc_1EBEC
		mov	eax, [bp+arg_6]
		mov	[bp+var_36], eax
		shl	eax, 8
		sub	eax, [bp+var_20]
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		jmp	short loc_1EBFB

loc_1EBEC:
		mov	eax, [bp+var_20]
		neg	eax
		mov	[bp+var_42], eax
		mov	[bp+var_46], eax

loc_1EBFB:
		mov	[bp+var_2E], eax
		mov	[bp+var_48], 0
		mov	[bp+var_4A], 0
		jmp	loc_1EE03

loc_1EC0C:
		inc	[bp+var_4A]
		cmp	[bp+var_4A], 0C8h
		jle	short loc_1EC19
		jmp	loc_1EE16

loc_1EC19:
		push	[bp+var_48]
		mov	bx, [bp+var_48]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_4E+2], dx
		mov	word ptr [bp+var_4E], ax
		cmp	[bp+var_4E], 0
		jnz	short loc_1EC34
		jmp	loc_1EE03

loc_1EC34:
		mov	ax, [bp+var_48]
		mov	[bp+var_50], ax
		cmp	ax, [bp+arg_2]
		jnz	short loc_1EC42
		jmp	loc_1EE03

loc_1EC42:
		cmp	[bp+var_48], di
		jnz	short loc_1EC4A
		jmp	loc_1EE03

loc_1EC4A:
		les	bx, word ptr [bp+var_4E]
		mov	al, es:[bx+17h]
		cmp	al, [bp+arg_C]
		jz	short loc_1EC59
		jmp	loc_1EE03

loc_1EC59:
		push	[bp+var_50]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	[bp+var_52], ax
		push	[bp+arg_2]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	dx, ax
		mov	bx, [bp+var_52]
		mov	eax, [bx]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_A6], eax
		mov	bx, [bp+var_52]
		mov	eax, [bx+4]
		mov	bx, dx
		sub	eax, [bx+4]
		mov	[bp+var_A2], eax
		mov	bx, [bp+var_52]
		mov	eax, [bx+8]
		mov	bx, dx
		sub	eax, [bx+8]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_9E]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_7A], eax
		push	eax
		push	large [bp+var_7E]
		push	large [bp+var_82]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_5A], eax
		mov	[bp+var_56], eax
		mov	eax, [bp+arg_6]
		mov	[bp+var_5E], eax
		shl	eax, 8
		cmp	eax, [bp+var_56]
		jle	short loc_1ED14
		mov	ax, 1
		jmp	short loc_1ED16

loc_1ED14:
		xor	ax, ax

loc_1ED16:
		or	al, al
		jnz	short loc_1ED1D
		jmp	loc_1EE03

loc_1ED1D:
		lea	ax, word ptr [bp+var_82]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		cmp	[bp+arg_A], 0B4h
		jz	short loc_1ED5D
		lea	ax, word ptr [bp+var_76]
		push	ax
		lea	ax, word ptr [bp+var_82]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_62]
		push	ax
		call	Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_62]
		cmp	eax, [bp+var_16]
		jl	short loc_1ED54
		mov	ax, 1
		jmp	short loc_1ED56

loc_1ED54:
		xor	ax, ax

loc_1ED56:
		or	al, al
		jnz	short loc_1ED5D
		jmp	loc_1EE03

loc_1ED5D:
		mov	eax, [bp+var_56]
		cmp	eax, [bp+var_8]
		jge	short loc_1ED6C
		mov	ax, 1
		jmp	short loc_1ED6E

loc_1ED6C:
		xor	ax, ax

loc_1ED6E:
		or	al, al
		jz	short loc_1ED82
		mov	eax, [bp+var_56]
		mov	[bp+var_8], eax
		mov	ax, [bp+var_50]
		mov	[bp+var_4], ax
		jmp	short loc_1EDA5

loc_1ED82:
		mov	eax, [bp+var_56]
		cmp	eax, [bp+var_12]
		jle	short loc_1ED91
		mov	ax, 1
		jmp	short loc_1ED93

loc_1ED91:
		xor	ax, ax

loc_1ED93:
		or	al, al
		jz	short loc_1EDA5
		mov	eax, [bp+var_56]
		mov	[bp+var_12], eax
		mov	ax, [bp+var_50]
		mov	[bp+var_E], ax

loc_1EDA5:
		mov	eax, [bp+var_56]
		sub	eax, [bp+var_20]
		mov	[bp+var_66], eax
		mov	[bp+var_6A], eax
		mov	[bp+var_32], eax
		cmp	[bp+arg_E], 0
		jz	short loc_1EDD9
		cmp	[bp+var_32], 0
		jle	short loc_1EE03
		cmp	eax, [bp+var_2E]
		jge	short loc_1EDD1
		mov	ax, 1
		jmp	short loc_1EDD3

loc_1EDD1:
		xor	ax, ax

loc_1EDD3:
		or	al, al
		jz	short loc_1EE03
		jmp	short loc_1EDF5

loc_1EDD9:
		cmp	[bp+var_32], 0
		jge	short loc_1EE03
		mov	eax, [bp+var_32]
		cmp	eax, [bp+var_2E]
		jle	short loc_1EDEF
		mov	ax, 1
		jmp	short loc_1EDF1

loc_1EDEF:
		xor	ax, ax

loc_1EDF1:
		or	al, al
		jz	short loc_1EE03

loc_1EDF5:
		mov	eax, [bp+var_32]
		mov	[bp+var_2E], eax
		mov	ax, [bp+var_50]
		mov	[bp+var_2], ax

loc_1EE03:
		lea	ax, [bp+var_48]
		push	ax
		push	si
		push	cs
		call	near ptr sub_1E7CF
		add	sp, 4
		or	ax, ax
		jz	short loc_1EE16
		jmp	loc_1EC0C

loc_1EE16:
		cmp	[bp+var_2], 0
		jz	short loc_1EE1F
		mov	di, [bp+var_2]

loc_1EE1F:
		cmp	[bp+arg_E], 0
		jz	short loc_1EE36
		cmp	[bp+var_2], 0
		jnz	short loc_1EE45
		cmp	[bp+var_4], 0
		jz	short loc_1EE45
		mov	di, [bp+var_4]
		jmp	short loc_1EE45

loc_1EE36:
		cmp	[bp+var_2], 0
		jnz	short loc_1EE45
		cmp	[bp+var_E], 0
		jz	short loc_1EE45
		mov	di, [bp+var_E]

loc_1EE45:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_1EA93		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EE4B		proc far

var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h
arg_C		= byte ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 42h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	eax, [bp+arg_4]
		inc	eax
		mov	[bp+var_6], eax
		mov	ax, [bp+arg_2]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		push	[bp+var_8]
		mov	bx, [bp+var_8]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_36], eax
		mov	eax, [di+4]
		mov	[bp+var_32], eax
		mov	eax, [di+8]
		mov	[bp+var_2E], eax
		mov	[bp+var_14], 0
		jmp	loc_1EFB8

loc_1EEBF:
		push	[bp+var_14]
		mov	bx, [bp+var_14]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_18+2], dx
		mov	word ptr [bp+var_18], ax
		cmp	[bp+var_18], 0
		jnz	short loc_1EEDA
		jmp	loc_1EFB8

loc_1EEDA:
		mov	ax, [bp+var_14]
		mov	[bp+var_1A], ax
		push	ax
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_42], eax
		mov	eax, [di+4]
		mov	[bp+var_3E], eax
		mov	eax, [di+8]
		mov	[bp+var_3A], eax
		push	[bp+var_8]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	di, ax
		mov	eax, [di]
		sub	[bp+var_42], eax
		mov	eax, [di+4]
		sub	[bp+var_3E], eax
		mov	eax, [di+8]
		sub	[bp+var_3A], eax
		push	large [bp+var_3A]
		push	large [bp+var_3E]
		push	large [bp+var_42]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_22], eax
		mov	[bp+var_26], eax
		sar	eax, 8
		mov	[bp+var_1E], eax
		cmp	[bp+arg_A], 0
		jz	short loc_1EF5C
		les	bx, word ptr [bp+var_18]
		mov	al, es:[bx+17h]
		cmp	al, [bp+arg_A]
		jnz	short loc_1EFB8

loc_1EF5C:
		cmp	[bp+arg_C], 1Ch
		jz	short loc_1EF77
		push	large [bp+var_18]
		les	bx, word ptr [bp+var_18]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, [bp+arg_C]
		jnz	short loc_1EFB8

loc_1EF77:
		mov	eax, [bp+var_1E]
		cmp	eax, [bp+var_6]
		jge	short loc_1EFB8
		lea	ax, word ptr [bp+var_42]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		lea	ax, word ptr [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_2A]
		cmp	eax, [bp+var_C]
		jl	short loc_1EFB8
		mov	ax, [bp+var_1A]
		mov	[bp+var_2], ax
		mov	eax, [bp+var_1E]
		mov	[bp+var_6], eax

loc_1EFB8:
		lea	ax, [bp+var_14]
		push	ax
		push	si
		push	cs
		call	near ptr sub_1E7CF
		add	sp, 4
		or	ax, ax
		jz	short loc_1EFCB
		jmp	loc_1EEBF

loc_1EFCB:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_1EE4B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Container_Op_22BFC
; (sub_22BFC de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,32L — (cluster conteneur) — accesseur/test, non détaillé.
; ==============================================================================================
Container_Op_1EFD2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1EFF5
		push	si
		nop
		push	cs
		call	near ptr Container_Op_1F18C
		pop	cx
		test	di, 1
		jz	short loc_1EFF5
		push	si
		call	sub_3B2
		pop	cx

loc_1EFF5:
		pop	di
		pop	si
		pop	bp
		retf
Container_Op_1EFD2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1EFF9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_1F028
		mov	word ptr [di+4], 0
		cmp	word ptr [si+0Dh], 0
		jnz	short loc_1F01D
		mov	ax, di
		mov	[si+0Dh], ax
		mov	[si+0Bh], ax
		jmp	short loc_1F031

loc_1F01D:
		mov	bx, [si+0Dh]
		mov	[bx+4], di
		mov	[si+0Dh], di
		jmp	short loc_1F031

loc_1F028:
		push	9023h
		call	sub_1DDFE
		pop	cx

loc_1F031:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
sub_1EFF9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_RemoveNode (sub_20D7C de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à Container_RemoveNode (sub_22C56 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,40L — retire un
; nœud spécifique par pointeur (unlink direct) : suppression directe d'un nœud connu du
; conteneur.
; ==============================================================================================
Container_RemoveNode		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		cmp	[si+0Bh], di
		jnz	short loc_1F050
		mov	ax, [di+4]
		mov	[si+0Bh], ax

loc_1F050:
		cmp	[si+0Dh], di
		jnz	short loc_1F058
		mov	[si+0Dh], dx

loc_1F058:
		or	dx, dx
		jz	short loc_1F064
		mov	ax, [di+4]
		mov	bx, dx
		mov	[bx+4], ax

loc_1F064:
		mov	word ptr [di+4], 0
		pop	di
		pop	si
		pop	bp
		retf
Container_RemoveNode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Op_22C8C (sub_22C8C de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,41L — (cluster
; conteneur) — accesseur/test additionnel, non détaillé.
; ==============================================================================================
Container_Op_1F06D		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_1F08A

loc_1F07E:
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_1F08A:
		cmp	[bp+var_2], 0
		jnz	short loc_1F095
		mov	ax, [si+0Bh]
		jmp	short loc_1F09B

loc_1F095:
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]

loc_1F09B:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_1F07E
		pop	si
		leave
		retf
Container_Op_1F06D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Op_22CC6 (sub_22CC6 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,63L — (cluster
; conteneur) — opération de taille moyenne, non détaillée.
; ==============================================================================================
Container_Op_1F0A7		proc far

var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	[bp+var_6], 0
		jmp	short loc_1F0E4

loc_1F0BC:
		push	[bp+var_6]
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	Debris_ComputeNetForce
		add	sp, 6
		mov	eax, [bp+var_A]
		mov	[bp+var_4], eax
		mov	eax, [di]
		cmp	eax, [bp+var_4]
		jge	short loc_1F0E4
		mov	eax, [bp+var_4]
		mov	[di], eax

loc_1F0E4:
		cmp	[bp+var_6], 0
		jnz	short loc_1F0EF
		mov	ax, [si+0Bh]
		jmp	short loc_1F0F5

loc_1F0EF:
		mov	bx, [bp+var_6]
		mov	ax, [bx+4]

loc_1F0F5:
		mov	[bp+var_6], ax
		cmp	[bp+var_6], 0
		jnz	short loc_1F0BC
		mov	si, di
		mov	eax, [si]
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Container_Op_1F0A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Op_22C8C (sub_22C8C de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,41L — (cluster
; conteneur) — accesseur/test additionnel, non détaillé.
; ==============================================================================================
Container_Op_1F113		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_1F130

loc_1F124:
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx

loc_1F130:
		cmp	[bp+var_2], 0
		jnz	short loc_1F13B
		mov	ax, [si+0Bh]
		jmp	short loc_1F141

loc_1F13B:
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]

loc_1F141:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_1F124
		pop	si
		leave
		retf
Container_Op_1F113		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObjects_CallSlot4OnAll_22D6C (sub_22D6C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; parcourt toute la liste (tous les nœuds, pas seulement les actifs) et appelle le slot +4 de
; chaque nœud avec (nœud, objet arg_2). Appelée par
; WorldObjects_CallSlot4OnAllThenRecompute_2214F et Picking_ResolveSymbol. Anciennement
; Container_FindByKeyAlt (aucune recherche par clé dans ce corps). Rôle du slot +4 non
; identifié (pour la vtable de l'entité IA c'est un destructeur : les nœuds de la liste 0x59C3
; ne sont donc pas des entités IA, mais des objets monde qui pointent vers elles à +0x55).
; ==============================================================================================
WorldObjects_CallSlot4OnAll_1F14D		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_1F16F

loc_1F15E:
		push	[bp+arg_2]
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4

loc_1F16F:
		cmp	[bp+var_2], 0
		jnz	short loc_1F17A
		mov	ax, [si+0Bh]
		jmp	short loc_1F180

loc_1F17A:
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]

loc_1F180:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_1F15E
		pop	si
		leave
		retf
WorldObjects_CallSlot4OnAll_1F14D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Op_20EEC (sub_20EEC de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à Container_Op_22DAB (sub_22DAB de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,41L — (cluster
; conteneur) — accesseur/test additionnel, non détaillé.
; ==============================================================================================
Container_Op_1F18C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+0Bh]
		jmp	short loc_1F1B6

loc_1F19C:
		mov	ax, [di+4]
		mov	[bp+var_2], ax
		or	di, di
		jz	short loc_1F1B3
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_1F1B3

loc_1F1B3:
		mov	di, [bp+var_2]

loc_1F1B6:
		or	di, di
		jnz	short loc_1F19C
		xor	ax, ax
		mov	[si+0Dh], ax
		mov	[si+0Bh], ax
		pop	di
		pop	si
		leave
		retf
Container_Op_1F18C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_RemoveAndDeleteObject_22DE5 (sub_22DE5 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 54L, LUE 2026-10-15. Cherche l'objet arg_2 dans la liste arg_0 (tete +0x0B, suivant +2) ;
; trouve : Container_RemoveNode puis destructeur de l'objet (slot +0x18, argument 3 = detruire
; et liberer), renvoie 1 ; sinon 0. Aucun effet de destruction (pas
; d'Object_SpawnDestructionEffects_3863A). Ex-'Container_RemoveAndDeleteObject_22DE5'.
; ==============================================================================================
Container_RemoveAndDeleteObject_1F1C6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	di, [si+0Bh]
		jmp	short loc_1F1FE

loc_1F1D5:
		cmp	di, [bp+arg_2]
		jnz	short loc_1F1F9
		push	di
		push	dx
		push	si
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		or	di, di
		jz	short loc_1F1F5
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_1F1F5

loc_1F1F5:
		mov	al, 1
		jmp	short loc_1F204

loc_1F1F9:
		mov	dx, di
		mov	di, [di+4]

loc_1F1FE:
		or	di, di
		jnz	short loc_1F1D5
		mov	al, 0

loc_1F204:
		pop	di
		pop	si
		pop	bp
		retf
Container_RemoveAndDeleteObject_1F1C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObject_GetNthChild_22E27 (sub_22E27 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-12. Ex-'Container_Op'. (liste, n) : renvoie le n-ième élément d'une liste
; chaînée (tête [liste+0x0B], suivant [élément+2]) ou 0. Sert aux sous-objets attachés (CHLD)
; d'un avion (instance +0x1E).
; ==============================================================================================
WorldObject_GetNthChild_1F208		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_1F223

loc_1F21C:
		mov	ax, dx
		dec	dx
		or	ax, ax
		jle	short loc_1F23D

loc_1F223:
		cmp	[bp+var_2], 0
		jnz	short loc_1F22E
		mov	ax, [si+0Bh]
		jmp	short loc_1F234

loc_1F22E:
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]

loc_1F234:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_1F21C

loc_1F23D:
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
WorldObject_GetNthChild_1F208		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F243		proc far

var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_E], eax
		push	8
		push	large [bp+var_E]
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		mov	[bp+var_2], 0
		mov	[bp+var_10], 0
		jmp	short loc_1F2A0

loc_1F273:
		mov	bx, [bp+var_10]
		mov	eax, [bx+6]
		mov	[bp+var_14], eax
		push	8
		push	large [bp+var_14]
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_1F29A
		mov	ax, 1
		jmp	short loc_1F29C

loc_1F29A:
		xor	ax, ax

loc_1F29C:
		or	al, al
		jnz	short loc_1F2BA

loc_1F2A0:
		cmp	[bp+var_10], 0
		jnz	short loc_1F2AB
		mov	ax, [si+0Bh]
		jmp	short loc_1F2B1

loc_1F2AB:
		mov	bx, [bp+var_10]
		mov	ax, [bx+4]

loc_1F2B1:
		mov	[bp+var_10], ax
		cmp	[bp+var_10], 0
		jnz	short loc_1F273

loc_1F2BA:
		mov	ax, [bp+var_10]
		pop	si
		leave
		retf
sub_1F243		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F2C0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	di, [si+0Bh]
		jmp	short loc_1F2E7

loc_1F2CF:
		cmp	di, [bp+arg_2]
		jnz	short loc_1F2E2
		push	di
		push	dx
		push	si
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		mov	al, 1
		jmp	short loc_1F2ED

loc_1F2E2:
		mov	dx, di
		mov	di, [di+4]

loc_1F2E7:
		or	di, di
		jnz	short loc_1F2CF
		mov	al, 0

loc_1F2ED:
		pop	di
		pop	si
		pop	bp
sub_1F2C0		endp
seg050		ends
