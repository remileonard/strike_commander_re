seg078		segment	para public 'CODE' use16
		assume cs:seg078
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 0C3h

loc_362C2:
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_362C6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jnz	short loc_362E3
		push	26CAh
		push	si
		nop
		push	cs
		call	near ptr Container_FindOrInsert
		add	sp, 4
		mov	[si+2], ax
		mov	[si], ax

loc_362E3:
		pop	si
		pop	bp
		retf
sub_362C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Construct (sub_1E14E de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE :
; même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Container_Construct (sub_1FDBC de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Container_Construct (sub_21E90 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,28L — constructeur d'une liste chaînée vide (tête/queue à
; 0, type 0x1104) : constructeur de conteneur liste générique (template C++).
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
		push	26CAh
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
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Container_ConstructTyped (sub_1E170 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Container_ConstructTyped (sub_1FDDE de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Container_ConstructTyped (sub_21EB2 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,24L — variante
; de sub_21E90 avec type paramétrable : constructeur de conteneur liste générique (variante
; paramétrée).
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

sub_3632A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_36343
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3634E

loc_36343:
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Container_ConstructTyped
		add	sp, 4

loc_3634E:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_3632A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36353		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3636C
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_36373

loc_3636C:
		xor	ax, ax
		mov	[si+2], ax
		mov	[si], ax

loc_36373:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_36353		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Container_Destruct
; (sub_1E1E0 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Container_Destruct (sub_21F21 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,31L — destructeur : vide la liste (sub_22392) puis libère
; si demandé (sub_338) : destructeur du conteneur liste générique.
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
		jz	short loc_3639B
		push	si
		nop
		push	cs
		call	near ptr Container_Clear
		pop	cx
		test	di, 1
		jz	short loc_3639B
		push	si
		call	sub_33B
		pop	cx

loc_3639B:
		pop	di
		pop	si
		pop	bp
		retf
Container_Destruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3639F		proc far

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
		jz	short loc_363D7
		mov	bx, [bp+arg_4]
		xor	cx, cx
		or	dx, dx
		jz	short loc_363D5
		or	bx, bx
		jz	short loc_363D5
		push	bx
		push	dx
		nop
		push	cs
		call	near ptr sub_37148
		add	sp, 4
		mov	cx, ax
		jmp	short loc_363D5

loc_363D5:
		mov	si, cx

loc_363D7:
		or	si, si
		jz	short loc_363DF
		mov	al, 1
		jmp	short loc_363E1

loc_363DF:
		mov	al, 0

loc_363E1:
		pop	si
		pop	bp
		retf
sub_3639F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; List_AppendIfNonNull_1E24C (sub_1E24C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; List_AppendIfNonNull_21F8D (sub_21F8D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, args (liste, nœud) : appelle
; List_AppendTail_22C23 sur l'en-tête pointé par la liste si la liste et le nœud sont non
; nuls. Anciennement Container_KeyEquals (n'est pas un test d'égalité). Appelée avec le tag
; 0x59C3 (liste des entités du monde) au spawn et au chargement de mission.
; ==============================================================================================
List_AppendIfNonNull_363E4		proc far

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
		jz	short loc_3640B
		or	bx, bx
		jz	short loc_3640B
		push	bx
		push	dx
		nop
		push	cs
		call	near ptr sub_37148
		add	sp, 4
		mov	cx, ax
		jmp	short loc_3640B

loc_3640B:
		mov	[bp+var_2], cx
		cmp	[bp+var_2], 0
		jz	short loc_36418
		mov	al, 1
		jmp	short loc_3641A

loc_36418:
		mov	al, 0

loc_3641A:
		pop	si
		leave
		retf
List_AppendIfNonNull_363E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Container_UnlinkNode
; (sub_1E285 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; Container_UnlinkNode (sub_1FF3C de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Container_UnlinkNode (sub_21FC6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,36L — retire un nœud (di) de la liste chaînée
; (mise à jour tête/queue/liens) : unlink de nœud dans le conteneur liste (opération interne).
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
		jnz	short loc_36434
		mov	ax, [di+9]
		mov	[si], ax

loc_36434:
		cmp	[si+2], di
		jnz	short loc_3643C
		mov	[si+2], dx

loc_3643C:
		or	dx, dx
		jz	short loc_36448
		mov	ax, [di+9]
		mov	bx, dx
		mov	[bx+9], ax

loc_36448:
		pop	di
		pop	si
		pop	bp
		retf
Container_UnlinkNode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Container_FindAndRemove (sub_1E2B4 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants
; et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions, 1
; opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Container_FindAndRemove (sub_1FF6B de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1
; opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Container_FindAndRemove (sub_21FF5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,29L — recherche (sub_22555) puis retire (sub_2235C) une
; entrée par clé : suppression d'une entrée du conteneur par clé (find+remove).
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

sub_36472		proc far

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
		jz	short loc_36495
		push	3
		push	ax
		nop
		push	cs
		call	near ptr Container_Op_37121
		add	sp, 4

loc_36495:
		or	si, si
		jz	short loc_3649E
		mov	ax, 1
		jmp	short loc_364A0

loc_3649E:
		xor	ax, ax

loc_364A0:
		pop	si
		pop	bp
		retf
sub_36472		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Container_FindOrInsert
; (sub_1E30B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Container_FindOrInsert (sub_2204C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,69L — recherche une entrée existante (sub_22555) ; sinon
; alloue un nœud (sub_658, 15 octets), copie la clé (jusqu'à 8 car., sub_2AFB5/sub_2B6D) et
; l'insère : 'find or insert' du conteneur associatif clé→valeur (dictionnaire par nom).
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
		jnz	short loc_36510
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_364FE
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
		jmp	short loc_36500

loc_364FE:
		mov	ax, di

loc_36500:
		mov	di, ax
		or	di, di
		jz	short loc_36510
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Container_Append
		add	sp, 4

loc_36510:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
Container_FindOrInsert		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Container_Append
; (sub_1E37E de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; Container_Append (sub_20050 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Container_Append (sub_220BF de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,35L — insère un nœud en fin de liste (chaînage
; tête/queue) : append au conteneur liste.
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
		jz	short loc_36542
		mov	word ptr [di+9], 0
		cmp	word ptr [si+2], 0
		jnz	short loc_36539
		mov	ax, di
		mov	[si+2], ax
		mov	[si], ax
		jmp	short loc_36542

loc_36539:
		mov	bx, [si+2]
		mov	[bx+9], di
		mov	[si+2], di

loc_36542:
		pop	di
		pop	si
		pop	bp
		retf
Container_Append		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36546		proc far

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
		jmp	short loc_3655B

loc_3655A:
		inc	di

loc_3655B:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_36951
		add	sp, 4
		or	ax, ax
		jnz	short loc_3655A
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_36546		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36572		proc far

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
		jmp	short loc_3658E

loc_36587:
		mov	ax, di
		dec	di
		or	ax, ax
		jge	short loc_3659F

loc_3658E:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_36951
		add	sp, 4
		or	ax, ax
		jnz	short loc_36587

loc_3659F:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_36572		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_365A6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, word_5DD42
		mov	ax, [bx+6]
		mov	word_60196, ax
		mov	ax, [bx+0Ah]
		mov	word_60198, ax
		mov	ax, [bx+4]
		mov	word_6019A, ax
		mov	ax, [bx+8]
		mov	word_6019C, ax
		mov	dword_6019E, 200h
		push	[bp+arg_2]
		push	word ptr [si]
		nop
		push	cs
		call	near ptr WorldObjects_CallSlot4OnAll_3729C
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_365A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_365E2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si]
		nop
		push	cs
		call	near ptr Container_Op_37262
		pop	cx
		pop	si
		pop	bp
		retf
sub_365E2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObjects_CallSlot1COnActive_1E461 (sub_1E461 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
WorldObjects_CallSlot1COnActive_365F4		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_3661A

loc_36605:
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+5], 1
		jnz	short loc_3661A
		push	[bp+arg_2]
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4

loc_3661A:
		cmp	[bp+var_2], 0
		jnz	short loc_36627
		mov	bx, [si]
		mov	ax, [bx+0Bh]
		jmp	short loc_3662D

loc_36627:
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]

loc_3662D:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_36605
		pop	si
		leave
		retf
WorldObjects_CallSlot1COnActive_365F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObjects_UpdateFrame_ResetCounters_221C2
; (sub_221C2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, remet à zéro word_6E1BD et les 8 compteurs de profilage (table à 0x5B06), puis
; appelle WorldObjects_UpdateAllAndRemoveDead_221F2 sur la liste passée en argument. Appelée
; par CombatTarget_WeaponActionSubsystem (avec le tag 0x59C3), donc par MAIN_GAME_TICK.
; Anciennement WorldObjects_PeriodicGC (n'est qu'un enrobage de la boucle de mise à jour).
; ==============================================================================================
WorldObjects_UpdateFrame_ResetCounters_36639		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word_5C3F3, 0
		xor	ax, ax
		jmp	short loc_36659

loc_3664A:
		mov	bx, ax
		shl	bx, 2
		mov	dword ptr [bx+65B0h], 0
		inc	ax

loc_36659:
		cmp	ax, 8
		jl	short loc_3664A
		push	word ptr [si]
		nop
		push	cs
		call	near ptr WorldObjects_UpdateAllAndRemoveDead_36669
		pop	cx
		pop	si
		pop	bp
		retf
WorldObjects_UpdateFrame_ResetCounters_36639		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObjects_UpdateAllAndRemoveDead_221F2 (sub_221F2
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; parcourt une liste d'objets monde (tête à +0xB de l'en-tête, suivant à +2 du nœud) : pour
; chaque nœud appelle le slot +0x10 (mise à jour, renvoie 1 = vivant / 0 = mort) en
; chronométrant avec PIT_ReadHighPrecision, puis, si 0 est renvoyé, valide l'enfant (slot 0
; puis slot +0xC de l'enfant) et retire le nœud (Container_RemoveNode) et le détruit (slot
; +0x18, argument 3). Le temps est cumulé par type d'objet (slot +0x34 : 6, 0xB, 0xC/0x12,
; autres). Appelée par WorldObjects_UpdateFrame_ResetCounters_221C2 (depuis
; CombatTarget_WeaponActionSubsystem, tick principal), Picking_ResolveSymbol et
; WorldObject_TestAliveAndUpdateChildren_3800A. Anciennement WorldObjects_PurgeExpired (nom
; trop restrictif : c'est la boucle de mise à jour du monde).
; ==============================================================================================
WorldObjects_UpdateAllAndRemoveDead_36669		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= byte ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		jmp	loc_36776

loc_3667E:
		inc	word_5C3F3
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_6], eax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_366FA
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_14+2], dx
		mov	word ptr [bp+var_14], ax
		cmp	[bp+var_14], 0
		jz	short loc_366FA
		push	0
		push	[bp+var_2]
		push	dx
		push	ax
		les	bx, word ptr [bp+var_14]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		or	al, al
		jz	short loc_366FA
		push	[bp+var_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		cmp	[bp+var_2], 0
		jz	short loc_366F5
		push	3
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_366F5

loc_366F5:
		mov	[bp+var_2], di
		jmp	short loc_36776

loc_366FA:
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_A], eax
		mov	[bp+var_C], 0
		sub	eax, [bp+var_6]
		mov	[bp+var_10], eax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_36731
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		mov	[bp+var_C], al

loc_36731:
		cmp	[bp+var_C], 6
		jnz	short loc_36742
		mov	eax, [bp+var_10]
		add	dword_602D0, eax
		jmp	short loc_36773

loc_36742:
		cmp	[bp+var_C], 0Ch
		jz	short loc_3674E
		cmp	[bp+var_C], 12h
		jnz	short loc_36759

loc_3674E:
		mov	eax, [bp+var_10]
		add	dword_602D4, eax
		jmp	short loc_36773

loc_36759:
		cmp	[bp+var_C], 0Bh
		jnz	short loc_3676A
		mov	eax, [bp+var_10]
		add	dword_602D8, eax
		jmp	short loc_36773

loc_3676A:
		mov	eax, [bp+var_10]
		add	dword_602DC, eax

loc_36773:
		mov	di, [bp+var_2]

loc_36776:
		cmp	[bp+var_2], 0
		jnz	short loc_36781
		mov	ax, [si+0Bh]
		jmp	short loc_36787

loc_36781:
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]

loc_36787:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_36793
		jmp	loc_3667E

loc_36793:
		pop	di
		pop	si
		leave
		retf
WorldObjects_UpdateAllAndRemoveDead_36669		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObjects_IntegrateAllMotion_1E56B (sub_1E56B de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
WorldObjects_IntegrateAllMotion_36797		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_367B4

loc_367A8:
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx

loc_367B4:
		cmp	[bp+var_2], 0
		jnz	short loc_367C1
		mov	bx, [si]
		mov	ax, [bx+0Bh]
		jmp	short loc_367C7

loc_367C1:
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]

loc_367C7:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_367A8
		pop	si
		leave
		retf
WorldObjects_IntegrateAllMotion_36797		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Container_RemoveEntry
; (sub_1E5A7 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Container_RemoveEntry (sub_2235C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,53L — retire une entrée spécifique du conteneur (via unlink
; sub_21FC6 identifié en amont) : suppression ciblée d'un nœud du conteneur.
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
		jz	short loc_36803
		mov	di, [si]
		xor	cx, cx
		jmp	short loc_367FF

loc_367E8:
		cmp	di, dx
		jnz	short loc_367FA
		push	di
		push	cx
		push	si
		push	cs
		call	near ptr Container_UnlinkNode
		add	sp, 6
		mov	al, 1
		jmp	short loc_36805

loc_367FA:
		mov	cx, di
		mov	di, [di+9]

loc_367FF:
		or	di, di
		jnz	short loc_367E8

loc_36803:
		mov	al, 0

loc_36805:
		pop	di
		pop	si
		pop	bp
		retf
Container_RemoveEntry		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Container_Clear
; (sub_1E5DD de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Container_Clear (sub_22392 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,37L — vide entièrement la liste (libère chaque nœud) :
; clear/destructeur de contenu du conteneur liste.
; ==============================================================================================
Container_Clear		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_3682D

loc_36815:
		mov	bx, [si]
		mov	ax, [bx+9]
		mov	[bp+var_2], ax
		push	3
		push	bx
		nop
		push	cs
		call	near ptr Container_Op_37121
		add	sp, 4
		mov	ax, [bp+var_2]
		mov	[si], ax

loc_3682D:
		cmp	word ptr [si], 0
		jnz	short loc_36815
		xor	ax, ax
		mov	[si+2], ax
		mov	[si], ax
		pop	si
		leave
		retf
Container_Clear		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; WorldObjects_RemoveAndDelete_223C5 (sub_223C5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, 40L, LUE 2026-10-15. Parcourt les sous-listes
; de la liste arg_0 (59C3h = objets du monde ; tete [arg_0], suivante +9) et appelle
; Container_RemoveAndDeleteObject_22DE5(sous-liste, objet arg_2) jusqu'a la premiere qui
; contient l'objet : retire et DETRUIT l'objet, sans explosion. Appelants : Collision_MainLoop
; (objets retires apres collision) et MissionObject_RemoveInstanceFromWorld_53337 (opcode
; 0x91). Ex-'WorldObjects_RemoveAndDelete_223C5'.
; ==============================================================================================
WorldObjects_RemoveAndDelete_3683C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	si, [si]
		jmp	short loc_3685E

loc_36847:
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Container_RemoveAndDeleteObject_37315
		add	sp, 4
		or	al, al
		jz	short loc_3685B
		mov	al, 1
		jmp	short loc_36864

loc_3685B:
		mov	si, [si+9]

loc_3685E:
		or	si, si
		jnz	short loc_36847
		mov	al, 0

loc_36864:
		pop	si
		pop	bp
		retf
WorldObjects_RemoveAndDelete_3683C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Container_Op_223F0
; (sub_223F0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,40L — (cluster conteneur) — accesseur ou test additionnel, non détaillé.
; ==============================================================================================
Container_Op_36867		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	si, [si]
		jmp	short loc_36889

loc_36872:
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Container_Op_3740F
		add	sp, 4
		or	al, al
		jz	short loc_36886
		mov	al, 1
		jmp	short loc_3688F

loc_36886:
		mov	si, [si+9]

loc_36889:
		or	si, si
		jnz	short loc_36872
		mov	al, 0

loc_3688F:
		pop	si
		pop	bp
		retf
Container_Op_36867		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Container_Op_1E66D
; (sub_1E66D de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Container_Op_2241B (sub_2241B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,81L — (cluster conteneur) — opération de taille moyenne sur
; le conteneur, non détaillée.
; ==============================================================================================
Container_Op_36892		proc far

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
		call	sub_37AD
		add	sp, 0Ah
		mov	[bp+var_2], 0
		mov	[bp+var_10], 0
		jmp	short loc_368EF

loc_368C2:
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
		jnz	short loc_368E9
		mov	ax, 1
		jmp	short loc_368EB

loc_368E9:
		xor	ax, ax

loc_368EB:
		or	al, al
		jnz	short loc_36900

loc_368EF:
		lea	ax, [bp+var_10]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_36951
		add	sp, 4
		or	ax, ax
		jnz	short loc_368C2

loc_36900:
		mov	ax, [bp+var_10]
		pop	si
		leave
		retf
Container_Op_36892		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36906		proc far

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
		jz	short loc_36946
		mov	di, [bp+arg_4]
		cmp	word ptr [di], 0
		jnz	short loc_36933
		mov	bx, [si+4]
		mov	ax, [bx+0Bh]
		jmp	short loc_36938

loc_36933:
		mov	bx, [di]
		mov	ax, [bx+2]

loc_36938:
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_36946
		mov	bx, [bp+arg_4]
		mov	ax, [bx]
		jmp	short loc_3694D

loc_36946:
		mov	bx, [bp+arg_4]
		xor	ax, ax
		mov	[bx], ax

loc_3694D:
		pop	di
		pop	si
		pop	bp
		retf
sub_36906		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36951		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_3696D
		mov	ax, [si]
		mov	[si+4], ax

loc_36966:
		mov	word ptr [si+8], 0
		jmp	short loc_369AF

loc_3696D:
		mov	ax, [di]
		mov	[si+8], ax
		push	word ptr [si+8]
		push	si
		nop
		push	cs
		call	near ptr Container_Op_369F7
		add	sp, 4
		mov	[si+4], ax
		cmp	word ptr [si+4], 0
		jnz	short loc_369AF
		jmp	short loc_36966

loc_36989:
		cmp	word ptr [si+8], 0
		jnz	short loc_36997
		mov	bx, [si+4]
		mov	ax, [bx+0Bh]
		jmp	short loc_3699D

loc_36997:
		mov	bx, [si+8]
		mov	ax, [bx+2]

loc_3699D:
		mov	[si+8], ax
		cmp	word ptr [si+8], 0
		jnz	short loc_369B5
		mov	bx, [si+4]
		mov	ax, [bx+9]
		mov	[si+4], ax

loc_369AF:
		cmp	word ptr [si+4], 0
		jnz	short loc_36989

loc_369B5:
		mov	ax, [si+8]
		mov	[di], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_36951		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Container_FindByKey
; (sub_1E83C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Container_FindByKey (sub_22555 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,47L — recherche une entrée du conteneur par clé
; (comparaison via sub_21F8D) : lookup par clé dans le conteneur associatif.
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
		jmp	short loc_369ED

loc_369CD:
		mov	eax, [si]
		cmp	eax, [di]
		jnz	short loc_369E4
		mov	eax, [si+4]
		cmp	eax, [di+4]
		jnz	short loc_369E4
		mov	ax, 1
		jmp	short loc_369E6

loc_369E4:
		xor	ax, ax

loc_369E6:
		or	al, al
		jnz	short loc_369F1
		mov	si, [si+9]

loc_369ED:
		or	si, si
		jnz	short loc_369CD

loc_369F1:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
Container_FindByKey		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Op_1E875 (sub_1E875 de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Container_Op_2258E (sub_2258E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,51L — (cluster conteneur) — variante de
; recherche/insertion, non détaillée.
; ==============================================================================================
Container_Op_369F7		proc far

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
		jnz	short loc_36A25

loc_36A0A:
		mov	ax, si
		jmp	short loc_36A2B

loc_36A0E:
		or	di, di
		jnz	short loc_36A17
		mov	di, [si+0Bh]
		jmp	short loc_36A1E

loc_36A17:
		cmp	di, dx
		jz	short loc_36A0A
		mov	di, [di+2]

loc_36A1E:
		or	di, di
		jnz	short loc_36A25
		mov	si, [si+9]

loc_36A25:
		or	si, si
		jnz	short loc_36A0E
		xor	ax, ax

loc_36A2B:
		pop	di
		pop	si
		pop	bp
		retf
Container_Op_369F7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36A2F		proc far

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
		jmp	short loc_36A7B

loc_36A43:
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_36A7B
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 8
		jz	short loc_36A75
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_36A7B

loc_36A75:
		mov	[bp+var_1], 1
		jmp	short loc_36A88

loc_36A7B:
		push	di
		push	si
		push	cs
		call	near ptr sub_36951
		add	sp, 4
		or	ax, ax
		jnz	short loc_36A43

loc_36A88:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_36A2F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36A8F		proc far

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
		jmp	loc_36B44

loc_36AA9:
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_36AC4
		jmp	loc_36B44

loc_36AC4:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+15h]
		cmp	al, [bp+arg_A]
		jnz	short loc_36B44
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
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		sar	eax, 8
		cmp	eax, [bp+arg_6]
		jge	short loc_36B44

loc_36B3E:
		mov	ax, [bp+var_4]
		jmp	loc_36C11

loc_36B44:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr sub_36951
		add	sp, 4
		or	ax, ax
		jz	short loc_36B57
		jmp	loc_36AA9

loc_36B57:
		mov	[bp+var_4], 0
		jmp	loc_36BF4

loc_36B5F:
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_36BF4
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+15h]
		cmp	al, [bp+arg_A]
		jnz	short loc_36BF4
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
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		sar	eax, 8
		cmp	eax, [bp+arg_6]
		jge	short loc_36BF4
		jmp	loc_36B3E

loc_36BF4:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr sub_36951
		add	sp, 4
		or	ax, ax
		jz	short loc_36C0F
		mov	ax, [bp+var_4]
		cmp	ax, [bp+arg_4]
		jz	short loc_36C0F
		jmp	loc_36B5F

loc_36C0F:
		xor	ax, ax

loc_36C11:
		pop	di
		pop	si
		leave
		retf
sub_36A8F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36C15		proc far

var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= dword ptr -4Ch
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
		sub	sp, 0B0h
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
		call	Math_CosDeg_38FF6
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
		mov	[bp+var_74], eax
		mov	eax, [bx+4]
		mov	[bp+var_70], eax
		mov	eax, [bx+8]
		mov	[bp+var_6C], eax
		mov	[bp+var_20], 0
		or	di, di
		jnz	short loc_36CA8
		jmp	loc_36D4C

loc_36CA8:
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
		mov	[bp+var_8C], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+4]
		mov	bx, dx
		sub	eax, [bx+4]
		mov	[bp+var_88], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+8]
		mov	bx, dx
		sub	eax, [bx+8]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_8C]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_78], eax
		push	eax
		push	large [bp+var_7C]
		push	large [bp+var_80]
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	[bp+var_2A], eax
		mov	[bp+var_20], eax

loc_36D4C:
		cmp	[bp+arg_E], 0
		jz	short loc_36D6C
		mov	eax, [bp+arg_6]
		mov	[bp+var_36], eax
		shl	eax, 8
		sub	eax, [bp+var_20]
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		jmp	short loc_36D7B

loc_36D6C:
		mov	eax, [bp+var_20]
		neg	eax
		mov	[bp+var_42], eax
		mov	[bp+var_46], eax

loc_36D7B:
		mov	[bp+var_2E], eax
		mov	[bp+var_48], 0
		jmp	loc_36F6D

loc_36D87:
		push	[bp+var_48]
		mov	bx, [bp+var_48]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_4C+2], dx
		mov	word ptr [bp+var_4C], ax
		cmp	[bp+var_4C], 0
		jnz	short loc_36DA2
		jmp	loc_36F6D

loc_36DA2:
		mov	ax, [bp+var_48]
		mov	[bp+var_4E], ax
		cmp	ax, [bp+arg_2]
		jnz	short loc_36DB0
		jmp	loc_36F6D

loc_36DB0:
		cmp	[bp+var_48], di
		jnz	short loc_36DB8
		jmp	loc_36F6D

loc_36DB8:
		les	bx, word ptr [bp+var_4C]
		mov	al, es:[bx+15h]
		cmp	al, [bp+arg_C]
		jz	short loc_36DC7
		jmp	loc_36F6D

loc_36DC7:
		push	[bp+var_4E]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	[bp+var_50], ax
		push	[bp+arg_2]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	dx, ax
		mov	bx, [bp+var_50]
		mov	eax, [bx]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_A4], eax
		mov	bx, [bp+var_50]
		mov	eax, [bx+4]
		mov	bx, dx
		sub	eax, [bx+4]
		mov	[bp+var_A0], eax
		mov	bx, [bp+var_50]
		mov	eax, [bx+8]
		mov	bx, dx
		sub	eax, [bx+8]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_A0]
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_B0]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_78], eax
		push	eax
		push	large [bp+var_7C]
		push	large [bp+var_80]
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_58], eax
		mov	[bp+var_54], eax
		mov	eax, [bp+arg_6]
		mov	[bp+var_5C], eax
		shl	eax, 8
		cmp	eax, [bp+var_54]
		jle	short loc_36E80
		mov	ax, 1
		jmp	short loc_36E82

loc_36E80:
		xor	ax, ax

loc_36E82:
		or	al, al
		jnz	short loc_36E89
		jmp	loc_36F6D

loc_36E89:
		lea	ax, word ptr [bp+var_80]
		push	ax
		call	Vector_NormalizeInPlace_3A0DC
		pop	cx
		cmp	[bp+arg_A], 0B4h
		jz	short loc_36EC7
		lea	ax, word ptr [bp+var_74]
		push	ax
		lea	ax, word ptr [bp+var_80]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_60]
		push	ax
		call	Math_DotProduct3D_397FD
		add	sp, 8
		mov	eax, [bp+var_60]
		cmp	eax, [bp+var_16]
		jl	short loc_36EBE
		mov	ax, 1
		jmp	short loc_36EC0

loc_36EBE:
		xor	ax, ax

loc_36EC0:
		or	al, al
		jnz	short loc_36EC7
		jmp	loc_36F6D

loc_36EC7:
		mov	eax, [bp+var_54]
		cmp	eax, [bp+var_8]
		jge	short loc_36ED6
		mov	ax, 1
		jmp	short loc_36ED8

loc_36ED6:
		xor	ax, ax

loc_36ED8:
		or	al, al
		jz	short loc_36EEC
		mov	eax, [bp+var_54]
		mov	[bp+var_8], eax
		mov	ax, [bp+var_4E]
		mov	[bp+var_4], ax
		jmp	short loc_36F0F

loc_36EEC:
		mov	eax, [bp+var_54]
		cmp	eax, [bp+var_12]
		jle	short loc_36EFB
		mov	ax, 1
		jmp	short loc_36EFD

loc_36EFB:
		xor	ax, ax

loc_36EFD:
		or	al, al
		jz	short loc_36F0F
		mov	eax, [bp+var_54]
		mov	[bp+var_12], eax
		mov	ax, [bp+var_4E]
		mov	[bp+var_E], ax

loc_36F0F:
		mov	eax, [bp+var_54]
		sub	eax, [bp+var_20]
		mov	[bp+var_64], eax
		mov	[bp+var_68], eax
		mov	[bp+var_32], eax
		cmp	[bp+arg_E], 0
		jz	short loc_36F43
		cmp	[bp+var_32], 0
		jle	short loc_36F6D
		cmp	eax, [bp+var_2E]
		jge	short loc_36F3B
		mov	ax, 1
		jmp	short loc_36F3D

loc_36F3B:
		xor	ax, ax

loc_36F3D:
		or	al, al
		jz	short loc_36F6D
		jmp	short loc_36F5F

loc_36F43:
		cmp	[bp+var_32], 0
		jge	short loc_36F6D
		mov	eax, [bp+var_32]
		cmp	eax, [bp+var_2E]
		jle	short loc_36F59
		mov	ax, 1
		jmp	short loc_36F5B

loc_36F59:
		xor	ax, ax

loc_36F5B:
		or	al, al
		jz	short loc_36F6D

loc_36F5F:
		mov	eax, [bp+var_32]
		mov	[bp+var_2E], eax
		mov	ax, [bp+var_4E]
		mov	[bp+var_2], ax

loc_36F6D:
		lea	ax, [bp+var_48]
		push	ax
		push	si
		push	cs
		call	near ptr sub_36951
		add	sp, 4
		or	ax, ax
		jz	short loc_36F80
		jmp	loc_36D87

loc_36F80:
		cmp	[bp+var_2], 0
		jz	short loc_36F89
		mov	di, [bp+var_2]

loc_36F89:
		cmp	[bp+arg_E], 0
		jz	short loc_36FA0
		cmp	[bp+var_2], 0
		jnz	short loc_36FAF
		cmp	[bp+var_4], 0
		jz	short loc_36FAF
		mov	di, [bp+var_4]
		jmp	short loc_36FAF

loc_36FA0:
		cmp	[bp+var_2], 0
		jnz	short loc_36FAF
		cmp	[bp+var_E], 0
		jz	short loc_36FAF
		mov	di, [bp+var_E]

loc_36FAF:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_36C15		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36FB5		proc far

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
		call	Math_CosDeg_38FF6
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
		jmp	loc_37107

loc_37029:
		push	[bp+var_14]
		mov	bx, [bp+var_14]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_18+2], dx
		mov	word ptr [bp+var_18], ax
		cmp	[bp+var_18], 0
		jnz	short loc_37044
		jmp	loc_37107

loc_37044:
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
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_22], eax
		mov	[bp+var_26], eax
		sar	eax, 8
		mov	[bp+var_1E], eax
		cmp	[bp+arg_A], 0
		jz	short loc_370C6
		les	bx, word ptr [bp+var_18]
		mov	al, es:[bx+15h]
		cmp	al, [bp+arg_A]
		jnz	short loc_37107

loc_370C6:
		mov	eax, [bp+var_1E]
		cmp	eax, [bp+var_6]
		jge	short loc_37107
		lea	ax, word ptr [bp+var_42]
		push	ax
		call	Vector_NormalizeInPlace_3A0DC
		pop	cx
		lea	ax, word ptr [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_42]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_2A]
		push	ax
		call	Math_DotProduct3D_397FD
		add	sp, 8
		mov	eax, [bp+var_2A]
		cmp	eax, [bp+var_C]
		jl	short loc_37107
		mov	ax, [bp+var_1A]
		mov	[bp+var_2], ax
		mov	eax, [bp+var_1E]
		mov	[bp+var_6], eax

loc_37107:
		lea	ax, [bp+var_14]
		push	ax
		push	si
		push	cs
		call	near ptr sub_36951
		add	sp, 4
		or	ax, ax
		jz	short loc_3711A
		jmp	loc_37029

loc_3711A:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_36FB5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Container_Op_1EFD2
; (sub_1EFD2 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Container_Op_22BFC (sub_22BFC de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,32L — (cluster conteneur) — accesseur/test, non détaillé.
; ==============================================================================================
Container_Op_37121		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_37144
		push	si
		nop
		push	cs
		call	near ptr Container_Op_372DB
		pop	cx
		test	di, 1
		jz	short loc_37144
		push	si
		call	sub_33B
		pop	cx

loc_37144:
		pop	di
		pop	si
		pop	bp
		retf
Container_Op_37121		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37148		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_37177
		mov	word ptr [di+2], 0
		cmp	word ptr [si+0Dh], 0
		jnz	short loc_3716C
		mov	ax, di
		mov	[si+0Dh], ax
		mov	[si+0Bh], ax
		jmp	short loc_37180

loc_3716C:
		mov	bx, [si+0Dh]
		mov	[bx+2], di
		mov	[si+0Dh], di
		jmp	short loc_37180

loc_37177:
		push	9023h
		call	sub_9D47
		pop	cx

loc_37180:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
sub_37148		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_RemoveNode (sub_1F037 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Container_RemoveNode (sub_20D7C de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Container_RemoveNode (sub_22C56 de STRIKE.EXE).
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
		jnz	short loc_3719F
		mov	ax, [di+2]
		mov	[si+0Bh], ax

loc_3719F:
		cmp	[si+0Dh], di
		jnz	short loc_371A7
		mov	[si+0Dh], dx

loc_371A7:
		or	dx, dx
		jz	short loc_371B3
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2], ax

loc_371B3:
		mov	word ptr [di+2], 0
		pop	di
		pop	si
		pop	bp
		retf
Container_RemoveNode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Op_1F06D (sub_1F06D de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Container_Op_22C8C (sub_22C8C de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,41L — (cluster conteneur) — accesseur/test
; additionnel, non détaillé.
; ==============================================================================================
Container_Op_371BC		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_371D9

loc_371CD:
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_371D9:
		cmp	[bp+var_2], 0
		jnz	short loc_371E4
		mov	ax, [si+0Bh]
		jmp	short loc_371EA

loc_371E4:
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]

loc_371EA:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_371CD
		pop	si
		leave
		retf
Container_Op_371BC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Op_1F0A7 (sub_1F0A7 de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Container_Op_22CC6 (sub_22CC6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,63L — (cluster conteneur) — opération de
; taille moyenne, non détaillée.
; ==============================================================================================
Container_Op_371F6		proc far

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
		jmp	short loc_37233

loc_3720B:
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
		jge	short loc_37233
		mov	eax, [bp+var_4]
		mov	[di], eax

loc_37233:
		cmp	[bp+var_6], 0
		jnz	short loc_3723E
		mov	ax, [si+0Bh]
		jmp	short loc_37244

loc_3723E:
		mov	bx, [bp+var_6]
		mov	ax, [bx+2]

loc_37244:
		mov	[bp+var_6], ax
		cmp	[bp+var_6], 0
		jnz	short loc_3720B
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
Container_Op_371F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Op_1F06D (sub_1F06D de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Container_Op_22C8C (sub_22C8C de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,41L — (cluster conteneur) — accesseur/test
; additionnel, non détaillé.
; ==============================================================================================
Container_Op_37262		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_3727F

loc_37273:
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx

loc_3727F:
		cmp	[bp+var_2], 0
		jnz	short loc_3728A
		mov	ax, [si+0Bh]
		jmp	short loc_37290

loc_3728A:
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]

loc_37290:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_37273
		pop	si
		leave
		retf
Container_Op_37262		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObjects_CallSlot4OnAll_1F14D (sub_1F14D de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
WorldObjects_CallSlot4OnAll_3729C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_372BE

loc_372AD:
		push	[bp+arg_2]
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4

loc_372BE:
		cmp	[bp+var_2], 0
		jnz	short loc_372C9
		mov	ax, [si+0Bh]
		jmp	short loc_372CF

loc_372C9:
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]

loc_372CF:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_372AD
		pop	si
		leave
		retf
WorldObjects_CallSlot4OnAll_3729C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Op_1F18C (sub_1F18C de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE :
; même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Container_Op_20EEC (sub_20EEC de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Container_Op_22DAB (sub_22DAB de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far,41L — (cluster conteneur) — accesseur/test
; additionnel, non détaillé.
; ==============================================================================================
Container_Op_372DB		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+0Bh]
		jmp	short loc_37305

loc_372EB:
		mov	ax, [di+2]
		mov	[bp+var_2], ax
		or	di, di
		jz	short loc_37302
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_37302

loc_37302:
		mov	di, [bp+var_2]

loc_37305:
		or	di, di
		jnz	short loc_372EB
		xor	ax, ax
		mov	[si+0Dh], ax
		mov	[si+0Bh], ax
		pop	di
		pop	si
		leave
		retf
Container_Op_372DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_RemoveAndDeleteObject_1F1C6 (sub_1F1C6 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_RemoveAndDeleteObject_22DE5 (sub_22DE5 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 54L, LUE 2026-10-15. Cherche l'objet arg_2 dans la liste arg_0 (tete +0x0B, suivant +2) ;
; trouve : Container_RemoveNode puis destructeur de l'objet (slot +0x18, argument 3 = detruire
; et liberer), renvoie 1 ; sinon 0. Aucun effet de destruction (pas
; d'Object_SpawnDestructionEffects_3863A). Ex-'Container_RemoveAndDeleteObject_22DE5'.
; ==============================================================================================
Container_RemoveAndDeleteObject_37315		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	di, [si+0Bh]
		jmp	short loc_3734D

loc_37324:
		cmp	di, [bp+arg_2]
		jnz	short loc_37348
		push	di
		push	dx
		push	si
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		or	di, di
		jz	short loc_37344
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_37344

loc_37344:
		mov	al, 1
		jmp	short loc_37353

loc_37348:
		mov	dx, di
		mov	di, [di+2]

loc_3734D:
		or	di, di
		jnz	short loc_37324
		mov	al, 0

loc_37353:
		pop	di
		pop	si
		pop	bp
		retf
Container_RemoveAndDeleteObject_37315		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObject_GetNthChild_1F208 (sub_1F208 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObject_GetNthChild_22E27 (sub_22E27 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-12. Ex-'Container_Op'. (liste, n) : renvoie le n-ième élément d'une liste
; chaînée (tête [liste+0x0B], suivant [élément+2]) ou 0. Sert aux sous-objets attachés (CHLD)
; d'un avion (instance +0x1E).
; ==============================================================================================
WorldObject_GetNthChild_37357		proc far

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
		jmp	short loc_37372

loc_3736B:
		mov	ax, dx
		dec	dx
		or	ax, ax
		jle	short loc_3738C

loc_37372:
		cmp	[bp+var_2], 0
		jnz	short loc_3737D
		mov	ax, [si+0Bh]
		jmp	short loc_37383

loc_3737D:
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]

loc_37383:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_3736B

loc_3738C:
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
WorldObject_GetNthChild_37357		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37392		proc far

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
		call	sub_37AD
		add	sp, 0Ah
		mov	[bp+var_2], 0
		mov	[bp+var_10], 0
		jmp	short loc_373EF

loc_373C2:
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
		jnz	short loc_373E9
		mov	ax, 1
		jmp	short loc_373EB

loc_373E9:
		xor	ax, ax

loc_373EB:
		or	al, al
		jnz	short loc_37409

loc_373EF:
		cmp	[bp+var_10], 0
		jnz	short loc_373FA
		mov	ax, [si+0Bh]
		jmp	short loc_37400

loc_373FA:
		mov	bx, [bp+var_10]
		mov	ax, [bx+2]

loc_37400:
		mov	[bp+var_10], ax
		cmp	[bp+var_10], 0
		jnz	short loc_373C2

loc_37409:
		mov	ax, [bp+var_10]
		pop	si
		leave
		retf
sub_37392		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Container_Op_22EDF
; (sub_22EDF de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,44L — (cluster conteneur) — accesseur/test additionnel, non détaillé.
; ==============================================================================================
Container_Op_3740F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	di, [si+0Bh]
		jmp	short loc_37436

loc_3741E:
		cmp	di, [bp+arg_2]
		jnz	short loc_37431
		push	di
		push	dx
		push	si
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		mov	al, 1
		jmp	short loc_3743C

loc_37431:
		mov	dx, di
		mov	di, [di+2]

loc_37436:
		or	di, di
		jnz	short loc_3741E
		mov	al, 0

loc_3743C:
		pop	di
		pop	si
		pop	bp
		retf
Container_Op_3740F		endp
seg078		ends
