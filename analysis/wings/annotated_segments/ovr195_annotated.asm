ovr195		segment	para public 'OVERLAY' use16
		assume cs:ovr195
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_EntryConstructObj (sub_98A60 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_EntryConstructObj (sub_2341F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 52L, LUE INTEGRALEMENT. RENOMMEE (ancien 'Kneeboard_EntryConstructObj'). Construit une
; entree de 26 octets (tag final 0x119C, voisin du tag du gestionnaire 0x1198), stocke une
; reference directe a l'objet suivi (+0xE), appelle son vtable+0x14 (meme slot 'etat'
; qu'EntityTracker_ApplySelection), et copie 8 octets depuis objet+0x53 (position ou
; identifiant, a confirmer) dans les champs +5/+9 utilises comme cle de recherche par
; EntityTracker_FindByID.
; ==============================================================================================
EntityTracker_EntryConstructObj		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_6F14D
		push	1Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6F1A2

loc_6F14D:
		mov	word ptr [si], 0A2Dh
		mov	word ptr [si+2], 0
		mov	word ptr [si], 244Eh
		mov	ax, si
		add	ax, 5
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	[si+0Eh], di
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		pop	cx
		mov	[si+4], al
		add	di, 53h
		mov	eax, [di]
		mov	[si+5], eax
		mov	eax, [di+4]
		mov	[si+9], eax
		mov	byte ptr [si+0Dh], 0

loc_6F1A2:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
EntityTracker_EntryConstructObj		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F1A8		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		or	si, si
		jnz	short loc_6F1CB
		push	1Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_6F1CB
		jmp	loc_6F2BA

loc_6F1CB:
		mov	word ptr [si], 0A2Dh
		mov	word ptr [si+2], 0
		mov	word ptr [si], 244Eh
		mov	ax, si
		add	ax, 5
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	word ptr [si+0Eh], 0
		mov	al, [bp+arg_2]
		mov	[si+4], al
		mov	eax, [di+72h]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_4]
		mov	[si+16h], eax
		push	large [di+72h]
		cmp	byte ptr [si+14h], 3
		jnz	short loc_6F269
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6F26F

loc_6F269:
		mov	dx, [si+12h]
		mov	ax, [si+10h]

loc_6F26F:
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		cmp	byte ptr [si+14h], 3
		jnz	short loc_6F297
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6F29D

loc_6F297:
		mov	dx, [si+12h]
		mov	ax, [si+10h]

loc_6F29D:
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		push	8
		push	dx
		push	ax
		push	ds
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_37AD
		add	sp, 0Ah
		mov	byte ptr [si+0Dh], 0

loc_6F2BA:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_6F1A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F2C0		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0Eh], 0
		jnz	short loc_6F346
		xor	dx, dx
		mov	al, [si+4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6F343
		cmp	byte ptr [si+14h], 3
		jnz	short loc_6F2F9
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_6F2FF

loc_6F2F9:
		mov	dx, [si+12h]
		mov	ax, [si+10h]

loc_6F2FF:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		push	7Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6F33F
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_3B522
		pop	cx
		mov	word ptr [di+50h], 242Ah
		mov	ax, di
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	large [bp+var_4]
		push	di
		call	sub_58EB0
		add	sp, 6
		mov	ax, di
		jmp	short loc_6F341

loc_6F33F:
		mov	ax, di

loc_6F341:
		mov	dx, ax

loc_6F343:
		mov	[si+0Eh], dx

loc_6F346:
		pop	di
		pop	si
		leave
		retf
sub_6F2C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; EntityTracker_EntryDestruct (sub_98DEF de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; EntityTracker_EntryDestruct (sub_237AC de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, 54L, LUE INTEGRALEMENT. RENOMMEE (ancien
; 'Kneeboard_EntryDestruct'). Si un objet est lie (+0xE) et son bit +0x52.0 est actif, appelle
; [+0x50->vtable+4] (arret) puis [+0x50->vtable+0xC](param=3) (notification de detachement) ;
; detache la reference (+0xE=0) sans liberer la structure elle-meme. Appelee aussi depuis
; Mission_TriggerEvaluator.
; ==============================================================================================
EntityTracker_EntryDestruct		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0Eh], 0
		jz	short loc_6F39C
		mov	bx, [si+0Eh]
		mov	al, [bx+52h]
		and	ax, 1
		or	al, al
		jz	short loc_6F36C
		push	bx
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		pop	cx

loc_6F36C:
		cmp	dword ptr [si+10h], 0
		jz	short loc_6F378
		mov	ax, 1
		jmp	short loc_6F37A

loc_6F378:
		xor	ax, ax

loc_6F37A:
		or	ax, ax
		jz	short loc_6F39C
		cmp	word ptr [si+0Eh], 0
		jz	short loc_6F397
		push	3
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_6F397

loc_6F397:
		mov	word ptr [si+0Eh], 0

loc_6F39C:
		pop	si
		pop	bp
		retf
EntityTracker_EntryDestruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_EntryDestructFull (sub_98E44 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_EntryDestructFull (sub_23801 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 63L, LUE INTEGRALEMENT. RENOMMEE (ancien 'Kneeboard_EntryDestructFull'). Meme detachement
; que EntryDestruct, PLUS libere la ressource associee (+0x10) si possedee (+0x15), via
; Memory_TypedFree_5C7B6.
; ==============================================================================================
EntityTracker_EntryDestructFull		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0Eh], 0
		jz	short loc_6F3DF
		mov	bx, [si+0Eh]
		mov	al, [bx+52h]
		and	ax, 1
		or	al, al
		jz	short loc_6F3C1
		push	bx
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		pop	cx

loc_6F3C1:
		cmp	word ptr [si+0Eh], 0
		jz	short loc_6F3DA
		push	3
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_6F3DA

loc_6F3DA:
		mov	word ptr [si+0Eh], 0

loc_6F3DF:
		cmp	byte ptr [si+15h], 0
		jz	short loc_6F405
		cmp	dword ptr [si+10h], 0
		jz	short loc_6F405
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6F405

loc_6F405:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		pop	si
		pop	bp
		retf
EntityTracker_EntryDestructFull		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; EntityTracker_AddEntryObj (sub_98EC1 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; EntityTracker_AddEntryObj (sub_BFD41 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1
; opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; EntityTracker_AddEntryObj (sub_2387E de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, LUE INTEGRALEMENT. RENOMMEE (ancien
; 'Kneeboard_AddEntryObj', ancien nom d'appelant 'Cinematic_LoadCameraDef' egalement a
; reconsiderer). Construit une entree via EntityTracker_EntryConstructObj puis l'insere en
; queue de liste (LinkedListB_InsertAtTail_5F57F).
; ==============================================================================================
EntityTracker_AddEntryObj		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	0
		push	cs
		call	near ptr EntityTracker_EntryConstructObj
		add	sp, 4
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_48623
		add	sp, 4
		pop	si
		leave
		retf
EntityTracker_AddEntryObj		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; EntityTracker_AddEntryText (sub_98EE7 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; EntityTracker_AddEntryText (sub_BFD69 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; EntityTracker_AddEntryText (sub_238A4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE INTEGRALEMENT. RENOMMEE (ancien
; 'Kneeboard_AddEntryText'). Construit une entree texte via EntityTracker_EntryConstructText
; puis l'insere en queue de liste.
; ==============================================================================================
EntityTracker_AddEntryText		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		mov	al, [bp+arg_2]
		push	ax
		push	0
		push	cs
		call	near ptr sub_6F1A8
		add	sp, 6
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_48623
		add	sp, 4
		pop	si
		leave
		retf
EntityTracker_AddEntryText		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_FindByID (sub_238CE de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 60L, LUE
; INTEGRALEMENT. RENOMMEE (ancien 'Kneeboard_FindByID'). Parcourt une liste chainee
; (LinkedListB_Helper_5F6A9), comparant un identifiant de 8 octets (deux dwords, +5/+9 de
; chaque noeud) a celui recherche. Retourne le noeud correspondant ou 0.
; ==============================================================================================
EntityTracker_FindByID		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_6F4AE

loc_6F47D:
		mov	bx, [bp+var_2]
		mov	eax, [bx+5]
		les	bx, [bp+arg_2]
		cmp	eax, es:[bx]
		jnz	short loc_6F4A3
		mov	bx, [bp+var_2]
		mov	eax, [bx+9]
		mov	bx, [bp+arg_2]
		cmp	eax, es:[bx+4]
		jnz	short loc_6F4A3
		mov	ax, 1
		jmp	short loc_6F4A5

loc_6F4A3:
		xor	ax, ax

loc_6F4A5:
		or	al, al
		jz	short loc_6F4AE
		mov	ax, [bp+var_2]
		jmp	short loc_6F4C1

loc_6F4AE:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_6F47D
		xor	ax, ax

loc_6F4C1:
		pop	si
		leave
		retf
EntityTracker_FindByID		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F4C4		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_6F4E5

loc_6F4D5:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_6F4E5
		mov	ax, [bx+0Eh]
		jmp	short loc_6F4F8

loc_6F4E5:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_6F4D5
		xor	ax, ax

loc_6F4F8:
		pop	si
		leave
		retf
sub_6F4C4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F4FB		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_6F51C

loc_6F50C:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		cmp	ax, [bp+arg_2]
		jnz	short loc_6F51C
		mov	ax, [bp+var_2]
		jmp	short loc_6F52F

loc_6F51C:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_6F50C
		xor	ax, ax

loc_6F52F:
		pop	si
		leave
		retf
sub_6F4FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_FindByIDContinue (sub_23994 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 73L, LUE INTEGRALEMENT. RENOMMEE (ancien 'Kneeboard_FindByIDContinue'). Identique a
; FindByID, mais si l'entree trouvee n'a pas d'objet lie (+0xE==0, entree texte), l'affiche
; immediatement (EntityTracker_RenderEntry) ; retourne l'objet lie ou 0.
; ==============================================================================================
EntityTracker_FindByIDContinue		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_6F586

loc_6F543:
		mov	bx, [bp+var_2]
		mov	eax, [bx+5]
		les	bx, [bp+arg_2]
		cmp	eax, es:[bx]
		jnz	short loc_6F569
		mov	bx, [bp+var_2]
		mov	eax, [bx+9]
		mov	bx, [bp+arg_2]
		cmp	eax, es:[bx+4]
		jnz	short loc_6F569
		mov	ax, 1
		jmp	short loc_6F56B

loc_6F569:
		xor	ax, ax

loc_6F56B:
		or	al, al
		jz	short loc_6F586
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_6F57E
		push	bx
		push	cs
		call	near ptr sub_6F2C0
		pop	cx

loc_6F57E:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		jmp	short loc_6F599

loc_6F586:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_6F543
		xor	ax, ax

loc_6F599:
		pop	si
		leave
		retf
EntityTracker_FindByIDContinue		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; EntityTracker_RenderByCode (sub_239FE de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE INTEGRALEMENT. RENOMMEE (ancien
; 'Kneeboard_RenderByCode'). Parcourt la liste, pour chaque entree dont [+4]==code demande ET
; sans objet lie (+0xE==0), l'affiche (RenderEntry). Appelee depuis Radar_TargetTypeFilter et
; Mission_PlayerEventHandler.
; ==============================================================================================
EntityTracker_RenderByCode		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_6F5CC

loc_6F5AD:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_6F5CC
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_6F5C4
		push	bx
		push	cs
		call	near ptr sub_6F2C0
		pop	cx

loc_6F5C4:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		jmp	short loc_6F5DF

loc_6F5CC:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_6F5AD
		xor	ax, ax

loc_6F5DF:
		pop	si
		leave
		retf
EntityTracker_RenderByCode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F5E2		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_6F5FE

loc_6F5F3:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		cmp	ax, [bp+arg_2]
		jz	short loc_6F60F

loc_6F5FE:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_6F5F3

loc_6F60F:
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		jmp	short loc_6F638

loc_6F617:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_4]
		jnz	short loc_6F638
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_6F630

loc_6F628:
		push	[bp+var_2]
		push	cs
		call	near ptr sub_6F2C0
		pop	cx

loc_6F630:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		jmp	short loc_6F680

loc_6F638:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_6F617
		mov	[bp+var_2], 0
		jmp	short loc_6F665

loc_6F650:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_4]
		jnz	short loc_6F665
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_6F630
		jmp	short loc_6F628
		jmp	short loc_6F630

loc_6F665:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jz	short loc_6F67E
		mov	ax, [bp+var_2]
		cmp	ax, [bp+var_4]
		jnz	short loc_6F650

loc_6F67E:
		xor	ax, ax

loc_6F680:
		pop	si
		leave
		retf
sub_6F5E2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldWrapper_3FE83 (sub_3FE83 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à ResourceRecord_WriteFieldWrapper_3C848 (sub_3C848 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldWrapper_64FD8 (sub_64FD8 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, enveloppe appelant sub_6501E.
; Référencée par sub_A8F22.
; ==============================================================================================
ResourceRecord_WriteFieldWrapper_6F683		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr EntityTracker_ClearAll
		pop	cx
		pop	bp
		retf
ResourceRecord_WriteFieldWrapper_6F683		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F692		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+11h], 15h
		mov	word ptr [si+0Fh], 0
		mov	word ptr [si+12h], 0
		push	ds
		mov	ax, si
		add	ax, 6
		push	ax
		push	si
		nop
		push	cs
		call	near ptr EntityTracker_SelectByID
		add	sp, 6
		mov	ax, [si+12h]
		pop	si
		pop	bp
		retf
sub_6F692		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à EntityTracker_ClearAll
; (sub_23B23 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, 32L, LUE INTEGRALEMENT. RENOMMEE (ancien 'Kneeboard_ClearAll'). Parcourt toute
; la liste, detruit chaque entree (EntryDestruct, sans liberer les ressources), remet +0x12
; (selection courante) a 0.
; ==============================================================================================
EntityTracker_ClearAll		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_6F6D6

loc_6F6CE:
		push	[bp+var_2]
		push	cs
		call	near ptr EntityTracker_EntryDestruct
		pop	cx

loc_6F6D6:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_6F6CE
		mov	word ptr [si+12h], 0
		pop	si
		leave
		retf
EntityTracker_ClearAll		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; EntityTracker_RemoveByTarget (sub_23B55 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, 60L, LUE INTEGRALEMENT. RENOMMEE (ancien
; 'Kneeboard_RemoveByTarget'). Trouve et detruit completement (EntryDestructFull) l'entree
; liee a un objet precis, la retire de la liste, met a jour +0x12/+0xF si c'etait la
; selection/tete courante. Appelee depuis MissionRecord_LoadEntityDatabase_7B035 ET
; MissionRecord_LoadAndBuildWidgetTree_7D31A.
; ==============================================================================================
EntityTracker_RemoveByTarget		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_6F739

loc_6F701:
		mov	bx, [bp+var_2]
		mov	di, [bx+0Eh]
		cmp	di, [bp+arg_2]
		jnz	short loc_6F739
		push	bx
		push	cs
		call	near ptr EntityTracker_EntryDestructFull
		pop	cx
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_48648
		add	sp, 6
		cmp	[si+12h], di
		jnz	short loc_6F72A
		mov	word ptr [si+12h], 0

loc_6F72A:
		mov	ax, [si+0Fh]
		cmp	ax, [bp+var_2]
		jnz	short loc_6F74A
		mov	word ptr [si+0Fh], 0
		jmp	short loc_6F74A

loc_6F739:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_6F701

loc_6F74A:
		pop	di
		pop	si
		leave
		retf
EntityTracker_RemoveByTarget		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; EntityTracker_RemoveByTargetUpdateHead (sub_23BB4 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 45L, LUE INTEGRALEMENT. RENOMMEE
; (ancien 'Kneeboard_RemoveByTargetUpdateHead'). Variante plus legere : destruction simple
; (EntryDestruct, pas Full), met a jour +0xF (tete). Appelee par EntityTracker_ApplySelection.
; ==============================================================================================
EntityTracker_RemoveByTargetUpdateHead		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_6F779

loc_6F75F:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		mov	[bp+var_4], ax
		cmp	ax, [bp+arg_2]
		jnz	short loc_6F779
		push	bx
		push	cs
		call	near ptr EntityTracker_EntryDestruct
		pop	cx
		mov	ax, [bp+var_2]
		mov	[si+0Fh], ax

loc_6F779:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_6F75F
		pop	si
		leave
		retf
EntityTracker_RemoveByTargetUpdateHead		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; EntityTracker_ClearAllFull (sub_23BF3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, 39L, LUE INTEGRALEMENT. RENOMMEE (ancien
; 'Kneeboard_ClearAllFull'). Comme ClearAll mais destruction complete (EntryDestructFull) et
; retrait de chaque entree de la liste ; remet aussi +0xF a 0. Appelee par
; EntityTracker_ResetAndRefresh.
; ==============================================================================================
EntityTracker_ClearAllFull		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_6F7AF

loc_6F799:
		push	[bp+var_2]
		push	cs
		call	near ptr EntityTracker_EntryDestructFull
		pop	cx
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_48648
		add	sp, 6

loc_6F7AF:
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_6F799
		mov	word ptr [si+12h], 0
		mov	word ptr [si+0Fh], 0
		pop	si
		leave
		retf
EntityTracker_ClearAllFull		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_ResetAndRefresh (sub_23C38 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE INTEGRALEMENT. RENOMMEE (ancien 'Kneeboard_ResetAndRefresh'). Appelle
; EntityTracker_ClearAllFull. Appelee depuis EntityTracker_Destruct.
; ==============================================================================================
EntityTracker_ResetAndRefresh		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr EntityTracker_ClearAllFull
		pop	cx
		push	6286h
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		pop	bp
		retf
EntityTracker_ResetAndRefresh		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; EntityTracker_SelectByID (sub_992B5 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à EntityTracker_SelectByID (sub_23C4F de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 30L, LUE INTEGRALEMENT. Relais :
; appelle EntityTracker_FindByIDContinue(self, id) ; si trouve, applique la selection
; (EntityTracker_ApplySelection). Appelee depuis EntityTracker_Init et seg009 (non identifie).
; ==============================================================================================
EntityTracker_SelectByID		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr EntityTracker_FindByIDContinue
		add	sp, 6
		mov	dx, ax
		or	dx, dx
		jz	short loc_6F816
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_6F854
		add	sp, 4
		mov	[bp+var_1], al

loc_6F816:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
EntityTracker_SelectByID		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F81C		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	[bp+var_1], 0
		cmp	[si+11h], dl
		jz	short loc_6F84E
		push	dx
		push	si
		push	cs
		call	near ptr EntityTracker_RenderByCode
		add	sp, 4
		mov	dx, ax
		or	dx, dx
		jz	short loc_6F84E
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_6F854
		add	sp, 4
		mov	[bp+var_1], al

loc_6F84E:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_6F81C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F854		proc far

var_8		= word ptr -8
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_1], 0
		cmp	[si+12h], di
		jnz	short loc_6F86E
		jmp	loc_6F91A

loc_6F86E:
		mov	byte_5C58D, 0
		or	di, di
		jnz	short loc_6F87A
		jmp	loc_6F91A

loc_6F87A:
		mov	[bp+var_6], 100h
		lea	ax, word ptr [bp+var_6]
		push	ax
		push	63DEh
		call	Cockpit_PanAzimuthUpdate_35863
		add	sp, 4
		cmp	word ptr [si+12h], 0
		jz	short loc_6F8A4
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		pop	cx

loc_6F8A4:
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx]
		pop	cx
		or	al, al
		jz	short loc_6F8D6
		push	word ptr [si+12h]
		push	si
		push	cs
		call	near ptr EntityTracker_RemoveByTargetUpdateHead
		add	sp, 4
		mov	[si+12h], di
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		pop	cx
		mov	[si+11h], al
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+10h]
		pop	cx
		mov	[bp+var_1], 1
		jmp	short loc_6F91A

loc_6F8D6:
		cmp	word ptr [si+12h], 0
		jz	short loc_6F91A
		mov	ax, [si+0Fh]
		mov	[bp+var_8], ax
		push	di
		push	si
		push	cs
		call	near ptr EntityTracker_RemoveByTargetUpdateHead
		add	sp, 4
		mov	ax, [bp+var_8]
		mov	[si+0Fh], ax
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx]
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6F90D
		push	9002h
		call	sub_9D47
		jmp	short loc_6F919

loc_6F90D:
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+10h]

loc_6F919:
		pop	cx

loc_6F91A:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_6F854		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Kneeboard_ProcessSelected (sub_99415 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Kneeboard_ProcessSelected (sub_23D8F de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,67L — notifie l'entrée
; sélectionnée (+0x12) via vtable, vérifie un état (vtable[0x14]==4), déclenche sub_6BC03 sur
; un champ (+0x60) sinon : traitement de l'entrée sélectionnée du journal (probable action
; 'centrer la carte sur cet objectif').
; ==============================================================================================
Kneeboard_ProcessSelected		proc far

var_8		= dword ptr -8
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+12h], 0
		jz	short loc_6F982
		mov	bx, [si+12h]
		cmp	word ptr [bx+5Ch], 0
		jz	short loc_6F954
		push	word ptr [bx+5Ch]
		mov	bx, [bx+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		mov	bx, [si+12h]
		push	word ptr [bx+5Ch]
		mov	bx, [bx+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		jmp	short loc_6F954

loc_6F954:
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 4
		jz	short loc_6F982
		sub	sp, 4
		mov	di, [si+12h]
		add	di, 5Eh
		mov	eax, [di]
		mov	[bp+var_8], eax
		push	word ptr [si+12h]
		call	sub_58E92
		add	sp, 6
		jmp	short loc_6F982

loc_6F982:
		pop	di
		pop	si
		pop	bp
		retf
Kneeboard_ProcessSelected		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6F986		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6F99F
		push	14h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_6F9C9

loc_6F99F:
		mov	word ptr [si], 492h
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax
		mov	word ptr [si], 2426h
		mov	ax, si
		add	ax, 6
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	byte ptr [si+11h], 15h
		mov	word ptr [si+0Fh], 0
		mov	word ptr [si+12h], 0

loc_6F9C9:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_6F986		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_Destruct (sub_23E48 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 38L, LUE
; INTEGRALEMENT. RENOMMEE (ancien 'Kneeboard_Destruct'). Referencee via vtable (seg339:1198,
; confirme). Vide la liste (EntityTracker_ResetAndRefresh), libere la liste chainee
; (LinkedListB_Helper_5F66B), libere la memoire si demande.
; ==============================================================================================
EntityTracker_Destruct		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6F9FF
		mov	word ptr [si], 2426h
		push	si
		push	cs
		call	near ptr EntityTracker_ResetAndRefresh
		pop	cx
		mov	word ptr [si], 492h
		push	si
		call	sub_4870F
		pop	cx
		test	di, 1
		jz	short loc_6F9FF
		push	si
		call	sub_33B
		pop	cx

loc_6F9FF:
		pop	di
		pop	si
		pop	bp
		retf
EntityTracker_Destruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6FA03		proc far

var_4		= byte ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		mov	word_5FFAA, 0
		mov	word_5FFAC, 0
		mov	word_5FFAE, 13Fh
		mov	word_5FFB0, 0C7h
		cmp	byte_5F552, 1
		jnz	short loc_6FA3A
		mov	ax, 5824h
		jmp	short loc_6FA3D

loc_6FA3A:
		mov	ax, word_5F542

loc_6FA3D:
		push	ax
		push	6286h
		call	TextFormat_ApplyStyleAttributeB_478D0
		add	sp, 4
		mov	word_5C144, 0
		push	0
		push	large 524D4143h
		push	di
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_6FA67
		jmp	loc_6FB15

loc_6FA67:
		jmp	short loc_6FAE4

loc_6FA69:
		push	di
		call	ResourceRecord_ComputeAlignedBounds_54140
		pop	cx
		mov	[bp+var_4], 15h
		cmp	dword ptr [di+6Dh], 524D4143h
		jnz	short loc_6FA83
		mov	ax, 1
		jmp	short loc_6FA85

loc_6FA83:
		xor	ax, ax

loc_6FA85:
		or	ax, ax
		jz	short loc_6FA8D
		mov	[bp+var_4], 0

loc_6FA8D:
		cmp	dword ptr [di+6Dh], 54525453h
		jnz	short loc_6FA9C
		mov	ax, 1
		jmp	short loc_6FA9E

loc_6FA9C:
		xor	ax, ax

loc_6FA9E:
		or	ax, ax
		jz	short loc_6FAB1
		push	di
		mov	ax, si
		add	ax, 6
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4

loc_6FAB1:
		cmp	[bp+var_2], 0
		jz	short loc_6FAC9
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr EntityTracker_AddEntryObj
		add	sp, 4
		mov	[bp+var_2], 0
		jmp	short loc_6FADC

loc_6FAC9:
		cmp	[bp+var_4], 15h
		jz	short loc_6FADC
		push	di
		mov	al, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr EntityTracker_AddEntryText
		add	sp, 6

loc_6FADC:
		mov	eax, [di+76h]
		mov	[di+65h], eax

loc_6FAE4:
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_6FAF3
		push	di
		call	ResourceRecord_ReadPayload_54332
		pop	cx
		jmp	short loc_6FB07

loc_6FAF3:
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_6FB05
		mov	ax, 1
		jmp	short loc_6FB07

loc_6FB05:
		xor	ax, ax

loc_6FB07:
		or	ax, ax
		jnz	short loc_6FB0E
		jmp	loc_6FA69

loc_6FB0E:
		push	di
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx

loc_6FB15:
		pop	di
		pop	si
		leave
		retf
sub_6FA03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6FB19		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_6FB19		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6FB23		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6FB7D
		cmp	byte ptr [si+15h], 0
		jz	short loc_6FB58
		cmp	dword ptr [si+10h], 0
		jz	short loc_6FB58
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_6FB58

loc_6FB58:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		test	di, 1
		jz	short loc_6FB7B
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_6FB7D

loc_6FB7B:
		jmp	short loc_6FB7D

loc_6FB7D:
		pop	di
		pop	si
		pop	bp
		retf
sub_6FB23		endp
ovr195		ends
