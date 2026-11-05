ovr258		segment	para public 'OVERLAY' use16
		assume cs:ovr258
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
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
		jnz	short loc_98A7D
		push	1Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_98AD2

loc_98A7D:
		mov	word ptr [si], 9B2h
		mov	word ptr [si+2], 0
		mov	word ptr [si], 0DE5h
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

loc_98AD2:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
EntityTracker_EntryConstructObj		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_EntryConstructText (sub_23497 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 102L, LUE INTEGRALEMENT. RENOMMEE (ancien 'Kneeboard_EntryConstructText'). Meme tag final
; (0x119C) que EntryConstructObj. Lit du texte/donnees depuis un enregistrement ressource
; (ResourceRecord_ReadFieldGroupA), pose +0xE=0 (aucun objet lie, confirme le sens de ce champ
; comme discriminant texte/objet).
; ==============================================================================================
EntityTracker_EntryConstructText		proc far

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
		jnz	short loc_98AFB
		push	1Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_98AFB
		jmp	loc_98BCE

loc_98AFB:
		mov	word ptr [si], 9B2h
		mov	word ptr [si+2], 0
		mov	word ptr [si], 0DE5h
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
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
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
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_A], dx
		mov	[bp+var_C], ax
		push	8
		push	dx
		push	ax
		push	ds
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		mov	byte ptr [si+0Dh], 0

loc_98BCE:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
EntityTracker_EntryConstructText		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 22 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_RenderEntry (sub_23593 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 264L, LUE
; INTEGRALEMENT — DECOUVERTE MAJEURE. RENOMMEE (ancien 'Kneeboard_RenderEntry'). VRAI SWITCH A
; 20 CAS (0x0-0x13) sur le code de type ([entree+4]). Pour chaque cas : alloue un objet de
; 0x80 (128) octets, appelle un stub VROOMM DIFFERENT par cas (construction d'un widget/objet
; de ce type precis), pose le resultat comme objet lie de l'entree (+0xE). CONFIRME : ce
; systeme construit dynamiquement 20 types differents d'objets a partir d'une ressource — pas
; un simple rendu de texte. CE QUE CES 20 TYPES REPRESENTENT REELEMENT N'EST PAS VERIFIE
; (aucun des 20 stubs VROOMM n'a ete lu) ; ne pas assumer 'widget UI' sans lecture. Appelee
; depuis Mission_TriggerEvaluator.
; ==============================================================================================
EntityTracker_RenderEntry		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0Eh], 0
		jz	short loc_98BE8
		jmp	loc_98DC1

loc_98BE8:
		xor	di, di
		mov	al, [si+4]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 14h
		jbe	short loc_98BF9
		jmp	loc_98DBE

loc_98BF9:
		shl	bx, 1
		jmp	cs:off_98DC5[bx]	; switch jump

loc_98C00:
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		push	80h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_98C56
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [di+50h], 6D0h
		mov	ax, di
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	large [bp+var_4]
		push	di
		call	sub_73DF1
		add	sp, 6
		mov	ax, di
		jmp	short loc_98C58

loc_98C56:
		mov	ax, di

loc_98C58:
		mov	di, ax
		jmp	loc_98DBE

loc_98C5D:
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	sub_73521
		jmp	loc_98D3D

loc_98C7E:
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	sub_7353F
		jmp	loc_98D3D

loc_98C9F:
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	sub_73401
		jmp	short loc_98D3D

loc_98CBF:
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	sub_733D9
		jmp	short loc_98D3D

loc_98CDF:
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	sub_73429
		jmp	short loc_98D3D

loc_98CFF:
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	sub_73456
		jmp	short loc_98D3D

loc_98D1F:
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	sub_7337C

loc_98D3D:
		add	sp, 6
		mov	di, ax
		jmp	short loc_98DBE

loc_98D44:
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	sub_7309E
		add	sp, 6
		mov	di, ax
		mov	eax, [si+16h]
		add	eax, 0FFFFFFE4h
		mov	[bp+var_8], eax
		push	0
		mov	al, [si+14h]
		push	ax
		push	large [si+10h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		add	word ptr [bp+var_C], 1Ch
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_10]
		mov	[di+80h], eax
		mov	eax, [bp+var_14]
		mov	[di+86h], eax
		mov	byte ptr [di+84h], 2
		mov	byte ptr [di+85h], 0

loc_98DBE:
		mov	[si+0Eh], di

loc_98DC1:
		pop	di
		pop	si
		leave
		retf
EntityTracker_RenderEntry		endp

; START OF FUNCTION CHUNK FOR EntityTracker_RenderEntry
off_98DC5	dw offset loc_98C00
		dw offset loc_98C5D
		dw offset loc_98DBE
		dw offset loc_98C7E
		dw offset loc_98DBE
		dw offset loc_98DBE
		dw offset loc_98DBE
		dw offset loc_98C9F
		dw offset loc_98CBF
		dw offset loc_98CDF
		dw offset loc_98CFF
		dw offset loc_98DBE
		dw offset loc_98D1F
		dw offset loc_98DBE
		dw offset loc_98DBE
		dw offset loc_98DBE
		dw offset loc_98DBE
		dw offset loc_98DBE
		dw offset loc_98DBE
		dw offset loc_98DBE
		dw offset loc_98D44
; END OF FUNCTION CHUNK FOR EntityTracker_RenderEntry

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_EntryDestruct (sub_237AC de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 54L, LUE
; INTEGRALEMENT. RENOMMEE (ancien 'Kneeboard_EntryDestruct'). Si un objet est lie (+0xE) et
; son bit +0x52.0 est actif, appelle [+0x50->vtable+4] (arret) puis
; [+0x50->vtable+0xC](param=3) (notification de detachement) ; detache la reference (+0xE=0)
; sans liberer la structure elle-meme. Appelee aussi depuis Mission_TriggerEvaluator.
; ==============================================================================================
EntityTracker_EntryDestruct		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+0Eh], 0
		jz	short loc_98E41
		mov	bx, [si+0Eh]
		mov	al, [bx+52h]
		and	ax, 1
		or	al, al
		jz	short loc_98E11
		push	bx
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		pop	cx

loc_98E11:
		cmp	dword ptr [si+10h], 0
		jz	short loc_98E1D
		mov	ax, 1
		jmp	short loc_98E1F

loc_98E1D:
		xor	ax, ax

loc_98E1F:
		or	ax, ax
		jz	short loc_98E41
		cmp	word ptr [si+0Eh], 0
		jz	short loc_98E3C
		push	3
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_98E3C

loc_98E3C:
		mov	word ptr [si+0Eh], 0

loc_98E41:
		pop	si
		pop	bp
		retf
EntityTracker_EntryDestruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
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
		jz	short loc_98E84
		mov	bx, [si+0Eh]
		mov	al, [bx+52h]
		and	ax, 1
		or	al, al
		jz	short loc_98E66
		push	bx
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		pop	cx

loc_98E66:
		cmp	word ptr [si+0Eh], 0
		jz	short loc_98E7F
		push	3
		push	word ptr [si+0Eh]
		mov	bx, [si+0Eh]
		mov	bx, [bx+50h]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_98E7F

loc_98E7F:
		mov	word ptr [si+0Eh], 0

loc_98E84:
		cmp	byte ptr [si+15h], 0
		jz	short loc_98EAA
		cmp	dword ptr [si+10h], 0
		jz	short loc_98EAA
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_98EAA

loc_98EAA:
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
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_AddEntryObj (sub_BFD41 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à EntityTracker_AddEntryObj (sub_2387E de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE INTEGRALEMENT.
; RENOMMEE (ancien 'Kneeboard_AddEntryObj', ancien nom d'appelant 'Cinematic_LoadCameraDef'
; egalement a reconsiderer). Construit une entree via EntityTracker_EntryConstructObj puis
; l'insere en queue de liste (LinkedListB_InsertAtTail_5F57F).
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
		call	LinkedListB_InsertAtTail_68A21
		add	sp, 4
		pop	si
		leave
		retf
EntityTracker_AddEntryObj		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_AddEntryText (sub_BFD69 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à EntityTracker_AddEntryText (sub_238A4 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE INTEGRALEMENT.
; RENOMMEE (ancien 'Kneeboard_AddEntryText'). Construit une entree texte via
; EntityTracker_EntryConstructText puis l'insere en queue de liste.
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
		call	near ptr EntityTracker_EntryConstructText
		add	sp, 6
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_68A21
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
		jmp	short loc_98F53

loc_98F22:
		mov	bx, [bp+var_2]
		mov	eax, [bx+5]
		les	bx, [bp+arg_2]
		cmp	eax, es:[bx]
		jnz	short loc_98F48
		mov	bx, [bp+var_2]
		mov	eax, [bx+9]
		mov	bx, [bp+arg_2]
		cmp	eax, es:[bx+4]
		jnz	short loc_98F48
		mov	ax, 1
		jmp	short loc_98F4A

loc_98F48:
		xor	ax, ax

loc_98F4A:
		or	al, al
		jz	short loc_98F53
		mov	ax, [bp+var_2]
		jmp	short loc_98F66

loc_98F53:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_98F22
		xor	ax, ax

loc_98F66:
		pop	si
		leave
		retf
EntityTracker_FindByID		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_98F69		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_98F8A

loc_98F7A:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_98F8A
		mov	ax, [bx+0Eh]
		jmp	short loc_98F9D

loc_98F8A:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_98F7A
		xor	ax, ax

loc_98F9D:
		pop	si
		leave
		retf
sub_98F69		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_98FA0		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_98FC1

loc_98FB1:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		cmp	ax, [bp+arg_2]
		jnz	short loc_98FC1
		mov	ax, [bp+var_2]
		jmp	short loc_98FD4

loc_98FC1:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_98FB1
		xor	ax, ax

loc_98FD4:
		pop	si
		leave
		retf
sub_98FA0		endp

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
		jmp	short loc_9902B

loc_98FE8:
		mov	bx, [bp+var_2]
		mov	eax, [bx+5]
		les	bx, [bp+arg_2]
		cmp	eax, es:[bx]
		jnz	short loc_9900E
		mov	bx, [bp+var_2]
		mov	eax, [bx+9]
		mov	bx, [bp+arg_2]
		cmp	eax, es:[bx+4]
		jnz	short loc_9900E
		mov	ax, 1
		jmp	short loc_99010

loc_9900E:
		xor	ax, ax

loc_99010:
		or	al, al
		jz	short loc_9902B
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_99023
		push	bx
		push	cs
		call	near ptr EntityTracker_RenderEntry
		pop	cx

loc_99023:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		jmp	short loc_9903E

loc_9902B:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_98FE8
		xor	ax, ax

loc_9903E:
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
		jmp	short loc_99071

loc_99052:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_99071
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_99069
		push	bx
		push	cs
		call	near ptr EntityTracker_RenderEntry
		pop	cx

loc_99069:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		jmp	short loc_99084

loc_99071:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_99052
		xor	ax, ax

loc_99084:
		pop	si
		leave
		retf
EntityTracker_RenderByCode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_99087		proc far

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
		jmp	short loc_990A3

loc_99098:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		cmp	ax, [bp+arg_2]
		jz	short loc_990B4

loc_990A3:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_99098

loc_990B4:
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		jmp	short loc_990DD

loc_990BC:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_4]
		jnz	short loc_990DD
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_990D5

loc_990CD:
		push	[bp+var_2]
		push	cs
		call	near ptr EntityTracker_RenderEntry
		pop	cx

loc_990D5:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		jmp	short loc_99125

loc_990DD:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_990BC
		mov	[bp+var_2], 0
		jmp	short loc_9910A

loc_990F5:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_4]
		jnz	short loc_9910A
		cmp	word ptr [bx+0Eh], 0
		jnz	short loc_990D5
		jmp	short loc_990CD
		jmp	short loc_990D5

loc_9910A:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jz	short loc_99123
		mov	ax, [bp+var_2]
		cmp	ax, [bp+var_4]
		jnz	short loc_990F5

loc_99123:
		xor	ax, ax

loc_99125:
		pop	si
		leave
		retf
sub_99087		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldWrapper_3C848 (sub_3C848 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_WriteFieldWrapper_64FD8 (sub_64FD8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe appelant sub_6501E. Référencée par sub_A8F22.
; ==============================================================================================
ResourceRecord_WriteFieldWrapper_99128		proc far

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
ResourceRecord_WriteFieldWrapper_99128		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_Init (sub_23AF4 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE INTEGRALEMENT.
; RENOMMEE (ancien 'Kneeboard_Init'). Initialise les champs de selection
; (+0xF/+0x11/+0x12/+0x14) puis appelle EntityTracker_SelectByID(self, self+6) — auto-
; selection par son propre nom embarque. Appelee depuis
; MissionLoader_QueryAndReleaseAttribute_A7F3A.
; ==============================================================================================
EntityTracker_Init		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+11h], 15h
		mov	word ptr [si+0Fh], 0
		mov	word ptr [si+12h], 0
		mov	byte ptr [si+14h], 0
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
EntityTracker_Init		endp

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
		jmp	short loc_9917F

loc_99177:
		push	[bp+var_2]
		push	cs
		call	near ptr EntityTracker_EntryDestruct
		pop	cx

loc_9917F:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_99177
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
		jmp	short loc_991E2

loc_991AA:
		mov	bx, [bp+var_2]
		mov	di, [bx+0Eh]
		cmp	di, [bp+arg_2]
		jnz	short loc_991E2
		push	bx
		push	cs
		call	near ptr EntityTracker_EntryDestructFull
		pop	cx
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6
		cmp	[si+12h], di
		jnz	short loc_991D3
		mov	word ptr [si+12h], 0

loc_991D3:
		mov	ax, [si+0Fh]
		cmp	ax, [bp+var_2]
		jnz	short loc_991F3
		mov	word ptr [si+0Fh], 0
		jmp	short loc_991F3

loc_991E2:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_991AA

loc_991F3:
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
		jmp	short loc_99222

loc_99208:
		mov	bx, [bp+var_2]
		mov	ax, [bx+0Eh]
		mov	[bp+var_4], ax
		cmp	ax, [bp+arg_2]
		jnz	short loc_99222
		push	bx
		push	cs
		call	near ptr EntityTracker_EntryDestruct
		pop	cx
		mov	ax, [bp+var_2]
		mov	[si+0Fh], ax

loc_99222:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_99208
		pop	si
		leave
		retf
EntityTracker_RemoveByTargetUpdateHead		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_99236		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_9925F

loc_99242:
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+0Eh], 0
		jz	short loc_99251
		push	bx
		push	cs
		call	near ptr EntityTracker_EntryDestructFull
		pop	cx

loc_99251:
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6

loc_9925F:
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_99242
		mov	word ptr [si+12h], 0
		mov	word ptr [si+0Fh], 0
		pop	si
		leave
		retf
sub_99236		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_99282		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_99236
		pop	cx
		push	6324h
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		mov	byte ptr [si+11h], 15h
		mov	word ptr [si+0Fh], 0
		mov	word ptr [si+12h], 0
		mov	byte ptr [si+14h], 0
		mov	byte ptr [si+15h], 0
		mov	byte ptr [si+16h], 0
		pop	si
		pop	bp
		retf
sub_99282		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; EntityTracker_SelectByID (sub_23C4F de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, 30L, LUE INTEGRALEMENT. Relais : appelle
; EntityTracker_FindByIDContinue(self, id) ; si trouve, applique la selection
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
		jz	short loc_992E2
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_99332
		add	sp, 4
		mov	[bp+var_1], al

loc_992E2:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
EntityTracker_SelectByID		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; EntityTracker_SelectByStateCode (sub_23C82 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, 40L, LUE INTEGRALEMENT. Si l'etat courant
; (+0x11) correspond deja au code demande : si ce code vaut 4 specifiquement, appelle une
; fonction nommee 'Radar_ToggleTracking' (nom herite NON VERIFIE, a prendre avec prudence) sur
; word_6E4B2 ; sinon rien. Sinon : cherche une entree via EntityTracker_RenderByCode(code), et
; si trouvee, l'applique comme selection. Appelee (au moins deux fois) depuis
; Player_MainUpdate.
; ==============================================================================================
EntityTracker_SelectByStateCode		proc far

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
		jz	short loc_9931C
		push	dx
		push	si
		push	cs
		call	near ptr EntityTracker_RenderByCode
		add	sp, 4
		mov	dx, ax
		or	dx, dx
		jz	short loc_9932C
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_99332
		add	sp, 4
		mov	[bp+var_1], al
		jmp	short loc_9932C

loc_9931C:
		cmp	byte ptr [si+11h], 4
		jnz	short loc_9932C
		push	word_77696
		call	Radar_ToggleTracking
		pop	cx

loc_9932C:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
EntityTracker_SelectByStateCode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_99332		proc far

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
		jnz	short loc_9934C
		jmp	loc_9940E

loc_9934C:
		mov	byte_7975D, 0
		or	di, di
		jnz	short loc_99358
		jmp	loc_9940E

loc_99358:
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 5
		jnz	short loc_99369
		mov	ax, 1
		jmp	short loc_9936B

loc_99369:
		xor	ax, ax

loc_9936B:
		mov	byte_77510, al
		mov	[bp+var_6], 100h
		lea	ax, word ptr [bp+var_6]
		push	ax
		push	64DEh
		call	Cockpit_PanAzimuthUpdate_2E46C
		add	sp, 4
		cmp	word ptr [si+12h], 0
		jz	short loc_99398
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+4]
		pop	cx

loc_99398:
		push	di
		mov	bx, [di+50h]
		call	dword ptr [bx]
		pop	cx
		or	al, al
		jz	short loc_993CA
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
		jmp	short loc_9940E

loc_993CA:
		cmp	word ptr [si+12h], 0
		jz	short loc_9940E
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
		jnz	short loc_99401
		push	9002h
		call	sub_1DDFE
		jmp	short loc_9940D

loc_99401:
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+10h]

loc_9940D:
		pop	cx

loc_9940E:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_99332		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Kneeboard_ProcessSelected (sub_23D8F de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,67L — notifie
; l'entrée sélectionnée (+0x12) via vtable, vérifie un état (vtable[0x14]==4), déclenche
; sub_6BC03 sur un champ (+0x60) sinon : traitement de l'entrée sélectionnée du journal
; (probable action 'centrer la carte sur cet objectif').
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
		jz	short loc_99476
		mov	bx, [si+12h]
		cmp	word ptr [bx+5Ch], 0
		jz	short loc_99448
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
		jmp	short loc_99448

loc_99448:
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 4
		jz	short loc_99476
		sub	sp, 4
		mov	di, [si+12h]
		add	di, 60h
		mov	eax, [di]
		mov	[bp+var_8], eax
		push	word ptr [si+12h]
		call	sub_73DD3
		add	sp, 6
		jmp	short loc_99476

loc_99476:
		pop	di
		pop	si
		pop	bp
		retf
Kneeboard_ProcessSelected		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9947A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_99493
		push	17h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_994B6

loc_99493:
		mov	word ptr [si], 909h
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax
		mov	word ptr [si], 0DE1h
		mov	ax, si
		add	ax, 6
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr sub_994BB
		pop	cx

loc_994B6:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_9947A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_994BB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+11h], 15h
		mov	word ptr [si+0Fh], 0
		mov	word ptr [si+12h], 0
		mov	byte ptr [si+14h], 0
		mov	byte ptr [si+15h], 0
		mov	byte ptr [si+16h], 0
		pop	si
		pop	bp
		retf
sub_994BB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_994DF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_99510
		mov	word ptr [si], 0DE1h
		push	si
		push	cs
		call	near ptr sub_99282
		pop	cx
		mov	word ptr [si], 909h
		push	si
		call	sub_68B0D
		pop	cx
		test	di, 1
		jz	short loc_99510
		push	si
		call	sub_3B2
		pop	cx

loc_99510:
		pop	di
		pop	si
		pop	bp
		retf
sub_994DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_99514		proc far

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
		push	si
		push	cs
		call	near ptr sub_994BB
		pop	cx
		mov	[bp+var_2], 0
		mov	word_7CA58, 0
		mov	word_7CA5A, 0
		mov	word_7CA5C, 13Fh
		mov	word_7CA5E, 0C7h
		cmp	byte_7C9F0, 1
		jnz	short loc_99551
		mov	ax, 62B2h
		jmp	short loc_99554

loc_99551:
		mov	ax, word_7C9E0

loc_99554:
		push	ax
		push	6324h
		call	TextFormat_ApplyStyleAttributeB_67C9A
		add	sp, 4
		mov	word_7750E, 0
		push	0
		push	large 524D4143h
		push	di
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_9957E
		jmp	loc_9970C

loc_9957E:
		jmp	loc_996DB

loc_99581:
		push	di
		call	ResourceRecord_ComputeAlignedBounds_6DC3A
		pop	cx
		mov	[bp+var_4], 15h
		cmp	dword ptr [di+6Dh], 524D4143h
		jnz	short loc_9959B
		mov	ax, 1
		jmp	short loc_9959D

loc_9959B:
		xor	ax, ax

loc_9959D:
		or	ax, ax
		jz	short loc_995A8
		mov	[bp+var_4], 0
		jmp	loc_996A8

loc_995A8:
		cmp	dword ptr [di+6Dh], 48435441h
		jnz	short loc_995B7
		mov	ax, 1
		jmp	short loc_995B9

loc_995B7:
		xor	ax, ax

loc_995B9:
		or	ax, ax
		jz	short loc_995C4
		mov	[bp+var_4], 1
		jmp	loc_996A8

loc_995C4:
		cmp	dword ptr [di+6Dh], 53414843h
		jnz	short loc_995D3
		mov	ax, 1
		jmp	short loc_995D5

loc_995D3:
		xor	ax, ax

loc_995D5:
		or	ax, ax
		jz	short loc_995E0
		mov	[bp+var_4], 3
		jmp	loc_996A8

loc_995E0:
		cmp	dword ptr [di+6Dh], 54525453h
		jnz	short loc_995EF
		mov	ax, 1
		jmp	short loc_995F1

loc_995EF:
		xor	ax, ax

loc_995F1:
		or	ax, ax
		jz	short loc_99607
		push	di
		mov	ax, si
		add	ax, 6
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		jmp	loc_996A8

loc_99607:
		cmp	dword ptr [di+6Dh], 544E4F43h
		jnz	short loc_99616
		mov	ax, 1
		jmp	short loc_99618

loc_99616:
		xor	ax, ax

loc_99618:
		or	ax, ax
		jz	short loc_99623
		mov	[bp+var_4], 7
		jmp	loc_996A8

loc_99623:
		cmp	dword ptr [di+6Dh], 41544F52h
		jnz	short loc_99632
		mov	ax, 1
		jmp	short loc_99634

loc_99632:
		xor	ax, ax

loc_99634:
		or	ax, ax
		jz	short loc_9963E
		mov	[bp+var_4], 9
		jmp	short loc_996A8

loc_9963E:
		cmp	dword ptr [di+6Dh], 47524154h
		jnz	short loc_9964D
		mov	ax, 1
		jmp	short loc_9964F

loc_9964D:
		xor	ax, ax

loc_9964F:
		or	ax, ax
		jz	short loc_99659
		mov	[bp+var_4], 0Ah
		jmp	short loc_996A8

loc_99659:
		cmp	dword ptr [di+6Dh], 504D4F43h
		jnz	short loc_99668
		mov	ax, 1
		jmp	short loc_9966A

loc_99668:
		xor	ax, ax

loc_9966A:
		or	ax, ax
		jz	short loc_99674
		mov	[bp+var_4], 14h
		jmp	short loc_996A8

loc_99674:
		cmp	dword ptr [di+6Dh], 54434956h
		jnz	short loc_99683
		mov	ax, 1
		jmp	short loc_99685

loc_99683:
		xor	ax, ax

loc_99685:
		or	ax, ax
		jz	short loc_9968F
		mov	[bp+var_4], 8
		jmp	short loc_996A8

loc_9968F:
		cmp	dword ptr [di+6Dh], 50414557h
		jnz	short loc_9969E
		mov	ax, 1
		jmp	short loc_996A0

loc_9969E:
		xor	ax, ax

loc_996A0:
		or	ax, ax
		jz	short loc_996A8
		mov	[bp+var_4], 0Ch

loc_996A8:
		cmp	[bp+var_2], 0
		jz	short loc_996C0
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr EntityTracker_AddEntryObj
		add	sp, 4
		mov	[bp+var_2], 0
		jmp	short loc_996D3

loc_996C0:
		cmp	[bp+var_4], 15h
		jz	short loc_996D3
		push	di
		mov	al, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr EntityTracker_AddEntryText
		add	sp, 6

loc_996D3:
		mov	eax, [di+76h]
		mov	[di+65h], eax

loc_996DB:
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_996EA
		push	di
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_996FE

loc_996EA:
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_996FC
		mov	ax, 1
		jmp	short loc_996FE

loc_996FC:
		xor	ax, ax

loc_996FE:
		or	ax, ax
		jnz	short loc_99705
		jmp	loc_99581

loc_99705:
		push	di
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_9970C:
		pop	di
		pop	si
		leave
		retf
sub_99514		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_99710		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	8Bh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_99769
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [di+50h], 6D0h
		mov	ax, di
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	di
		call	sub_73DDD
		pop	cx
		mov	word ptr [di+50h], 7EEh
		mov	ax, di
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [di+89h], 0
		mov	word ptr [di+50h], 925h
		mov	ax, di
		jmp	short loc_9976B

loc_99769:
		mov	ax, di

loc_9976B:
		mov	di, ax
		or	di, di
		jz	short loc_9978E
		push	[bp+arg_2]
		push	ax
		call	sub_7354E
		add	sp, 4
		mov	ax, [di+5Ch]
		mov	word_77696, ax
		push	di
		push	si
		push	cs
		call	near ptr EntityTracker_AddEntryObj
		add	sp, 4
		jmp	short loc_99797

loc_9978E:
		push	1111h
		call	sub_1DDFE
		pop	cx

loc_99797:
		pop	di
		pop	si
		pop	bp
		retf
sub_99710		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9979B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	96h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_99800
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [di+50h], 6D0h
		mov	ax, di
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	di
		call	sub_73DDD
		pop	cx
		mov	word ptr [di+50h], 7EEh
		mov	ax, di
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [di+89h], 0
		mov	word ptr [di+50h], 8ADh
		mov	ax, di
		add	ax, 8Bh
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	ax, di
		jmp	short loc_99802

loc_99800:
		mov	ax, di

loc_99802:
		mov	di, ax
		or	di, di
		jz	short loc_9981F
		push	[bp+arg_2]
		push	ax
		call	sub_73567
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr EntityTracker_AddEntryObj
		add	sp, 4
		jmp	short loc_99828

loc_9981F:
		push	1112h
		call	sub_1DDFE
		pop	cx

loc_99828:
		pop	di
		pop	si
		pop	bp
		retf
sub_9979B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9982C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_99886
		cmp	byte ptr [si+15h], 0
		jz	short loc_99861
		cmp	dword ptr [si+10h], 0
		jz	short loc_99861
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_99861

loc_99861:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		test	di, 1
		jz	short loc_99884
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_99886

loc_99884:
		jmp	short loc_99886

loc_99886:
		pop	di
		pop	si
		pop	bp
		retf
sub_9982C		endp
ovr258		ends
