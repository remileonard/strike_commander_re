seg079		segment	para public 'CODE' use16
		assume cs:seg079
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Debris_BodyReset
; (sub_36948 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; Debris_BodyReset (sub_21083 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Debris_BodyReset (sub_37C4C de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,23L — remet à zéro les champs d'accumulation
; (forces, position, cible, sous-composants) : constructeur/reset d'un corps physique de
; débris.
; ==============================================================================================
Debris_BodyReset		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dword ptr [si+0Ah], 0
		mov	dword ptr [si+0Eh], 0
		xor	eax, eax
		mov	[si+1Ah], eax
		mov	[si+16h], eax
		mov	[si+12h], eax
		mov	word ptr [si+2Ah], 0
		mov	word ptr [si+24h], 0
		mov	word ptr [si+26h], 0
		mov	word ptr [si+1Eh], 0
		pop	si
		pop	bp
		retf
Debris_BodyReset		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3747D		proc far

var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Debris_BodyReset
		pop	cx
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	[si+0Eh], eax
		les	bx, [si+0Eh]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	[si+20h], eax
		les	bx, [si+0Eh]
		les	bx, es:[bx+8]
		cmp	byte ptr es:[bx+16h], 0
		jz	short loc_374D0
		or	byte ptr [si+4], 2
		jmp	short loc_374D4

loc_374D0:
		and	byte ptr [si+4], 0FDh

loc_374D4:
		les	bx, [si+0Eh]
		mov	al, es:[bx+16h]
		mov	[si+28h], al
		mov	al, es:[bx+18h]
		mov	[si+29h], al
		pop	si
		leave
		retf
sub_3747D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_374E8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	bx, ax
		mov	dx, [bx+10h]
		mov	ax, [bx+0Eh]
		pop	bp
		retf
sub_374E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Debris_BodyGetPosition
; (sub_36A1C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Debris_BodyGetPosition (sub_37D04 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,24L — copie la position 3D (+0x12) d'un objet référencé
; vers un buffer : lecture de la position d'un corps physique de débris.
; ==============================================================================================
Debris_BodyGetPosition		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	di, dx
		add	di, 12h
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4], eax
		mov	eax, [di+8]
		mov	[si+8], eax
		pop	di
		pop	si
		pop	bp
		retf
Debris_BodyGetPosition		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37522		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_37536
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FEh

loc_37536:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_37545
		push	word ptr [si+1Eh]
		call	Container_Op_37262
		pop	cx

loc_37545:
		pop	si
		pop	bp
		retf
sub_37522		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; WorldObject_TranslateBy_36A6C (sub_36A6C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à WorldObject_TranslateBy_37D54 (sub_37D54 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 44L, LUE (2026-09-25).
; Ex-'Debris_BodyIntegrateForces' (FAUX : pas des forces). (objet, &dx, &dy, &dz) : position
; objet+0x12/+0x16/+0x1A += (dx, dy, dz) ; puis Debris_ComputeTorque si +0x24 et notification
; (vtable+8).
; ==============================================================================================
WorldObject_TranslateBy_37548		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		add	[si+12h], eax
		mov	di, [bp+arg_4]
		mov	eax, [di]
		add	[si+16h], eax
		mov	di, [bp+arg_6]
		mov	eax, [di]
		add	[si+1Ah], eax
		cmp	word ptr [si+24h], 0
		jz	short loc_3757D
		push	word ptr [si+24h]
		nop
		push	cs
		call	near ptr sub_3763E
		pop	cx

loc_3757D:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
WorldObject_TranslateBy_37548		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_BodyDetach (sub_37D94 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,34L — notifie la cible
; référencée (+0xA, vtable[0x20]), efface un flag sur le parent (+0x26, bit1), notifie via
; sub_22C8C (conteneur) : destruction/détachement d'un corps physique de débris.
; ==============================================================================================
Debris_BodyDetach		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_375A6
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_375A6:
		cmp	word ptr [si+26h], 0
		jz	short loc_375B3
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FDh

loc_375B3:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_375C2
		push	word ptr [si+1Eh]
		call	Container_Op_371BC
		pop	cx

loc_375C2:
		pop	si
		pop	bp
		retf
Debris_BodyDetach		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_375C5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_375E3
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_375E3:
		cmp	word ptr [si+26h], 0
		jz	short loc_375F4
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FEh
		and	byte ptr [bx+30h], 0FDh

loc_375F4:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_37603
		push	word ptr [si+1Eh]
		call	Container_Op_371BC
		pop	cx

loc_37603:
		pop	si
		pop	bp
		retf
sub_375C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_Method_Dispatch18_36B1B (sub_36B1B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 2 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Widget_Method_Dispatch18_A12CD (sub_A12CD de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0x18] (champ +0x0E).
; ==============================================================================================
Widget_Method_Dispatch18_37606		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+28h]
		pop	cx
		pop	si
		pop	bp
		retf
Widget_Method_Dispatch18_37606		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_Method_Dispatch18_36B1B (sub_36B1B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 2 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Widget_Method_Dispatch18_A12CD (sub_A12CD de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0x18] (champ +0x0E).
; ==============================================================================================
Widget_Method_Dispatch18_37617		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+28h]
		pop	cx
		pop	si
		pop	bp
		retf
Widget_Method_Dispatch18_37617		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37628		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		pop	bp
		retf
sub_37628		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37633		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		pop	bp
		retf
sub_37633		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3763E		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Eh], 0
		jz	short loc_37689
		les	bx, [si+0Eh]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	word ptr [si+1Eh]
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	Container_Op_371F6
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si+20h], eax

loc_37689:
		cmp	word ptr [si+24h], 0
		jz	short loc_37697
		push	word ptr [si+24h]
		push	cs
		call	near ptr sub_3763E
		pop	cx

loc_37697:
		pop	si
		leave
		retf
sub_3763E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Debris_ComputeNetForce
; (sub_36BAF de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Debris_ComputeNetForce
; (sub_37EA6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,38L — calcule la magnitude du vecteur de force accumulé (sub_5828E) plus une
; composante additionnelle (+0x20, probable gravité) : calcul de la force résultante totale
; sur un débris (avec gravité).
; ==============================================================================================
Debris_ComputeNetForce		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	large [si+1Ah]
		push	large [si+16h]
		push	large [si+12h]
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		add	si, 20h
		add	eax, [si]
		mov	[bp+var_10], eax
		mov	bx, word ptr [bp+var_4]
		mov	[bx], eax
		mov	es, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
Debris_ComputeNetForce		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Debris_ResolveForceBuffer (sub_36BFD de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Debris_ResolveForceBuffer (sub_37EF4 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,30L — si un parent existe,
; applique le transfert de force (sub_37F18) et retourne son buffer de couple ; sinon retourne
; le buffer de force local : résolution du buffer de force/couple actif d'un débris (avec ou
; sans parent).
; ==============================================================================================
Debris_ResolveForceBuffer		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_37704
		push	si
		nop
		push	cs
		call	near ptr Debris_TransferForceToParent
		pop	cx
		mov	ax, [si+26h]
		add	ax, 24h
		jmp	short loc_37709

loc_37704:
		mov	ax, si
		add	ax, 12h

loc_37709:
		pop	si
		pop	bp
		retf
Debris_ResolveForceBuffer		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Debris_TransferForceToParent (sub_36C21 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Debris_TransferForceToParent (sub_37F18 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,65L — transfère la position et un flag 'déjà
; transformé' au parent, applique la force sur son vecteur de couple (vtable[0x78]) :
; transfert récursif de force vers le corps parent (chaîne de sous-composants physiques).
; ==============================================================================================
Debris_TransferForceToParent		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_37789
		mov	bx, [si+26h]
		mov	al, [bx+30h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_37789
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		mov	[bx+24h], eax
		mov	eax, [di+4]
		mov	[bx+28h], eax
		mov	eax, [di+8]
		mov	[bx+2Ch], eax
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+7Ch]
		pop	cx
		push	ax
		mov	ax, [si+26h]
		add	ax, 24h
		push	ax
		call	sub_3D00B
		add	sp, 4
		push	word ptr [si+24h]
		push	cs
		call	near ptr Debris_ResolveForceBuffer
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	bx, [si+26h]
		add	[bx+24h], eax
		mov	eax, [di+4]
		add	[bx+28h], eax
		mov	eax, [di+8]
		add	[bx+2Ch], eax
		or	byte ptr [bx+30h], 1

loc_37789:
		pop	di
		pop	si
		pop	bp
		retf
Debris_TransferForceToParent		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3778D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3778D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_NotifyChildValidate (sub_37FA1 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,52L — notifie un
; composant enfant (vtable[0]) et teste son état actif (vtable[8]) avant de vérifier un flag
; de type : notification et validation d'état d'un corps physique enfant.
; ==============================================================================================
Debris_NotifyChildValidate		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_377FA
		push	di
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		cmp	word ptr [si+1Eh], 0
		jz	short loc_377FA
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		or	al, al
		jz	short loc_377FA
		les	bx, [si+0Ah]
		cmp	byte ptr es:[bx+8], 0
		jz	short loc_377FA
		push	word ptr [si+0Ch]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_377FA
		push	di
		push	word ptr [si+1Eh]
		call	WorldObjects_CallSlot4OnAll_3729C
		add	sp, 4

loc_377FA:
		pop	di
		pop	si
		pop	bp
		retf
Debris_NotifyChildValidate		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObject_TestAliveAndUpdateChildren_3800A
; (sub_3800A de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, si l'enfant à +0xA existe et que son slot +0x18 renvoie 0 → renvoie 0 (mort).
; Sinon, si une liste de sous-objets existe à +0x1E, appelle
; WorldObjects_UpdateAllAndRemoveDead_221F2 dessus (mise à jour hiérarchique) et renvoie 1
; (vivant). Anciennement Debris_TestDestroyedState (le résultat non nul signifie vivant, pas
; détruit).
; ==============================================================================================
WorldObject_TestAliveAndUpdateChildren_377FE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_37826
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_37826
		mov	al, 0
		jmp	short loc_37837

loc_37826:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_37835
		push	word ptr [si+1Eh]
		call	WorldObjects_UpdateAllAndRemoveDead_36669
		pop	cx

loc_37835:
		mov	al, 1

loc_37837:
		pop	si
		pop	bp
		retf
WorldObject_TestAliveAndUpdateChildren_377FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3783A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3783A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37842		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_37842		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3784A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3784A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37852		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		pop	bp
		retf
sub_37852		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Debris_PositionWidget_36DB4 (sub_36DB4 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Debris_PositionWidget (sub_38068 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,21L — récupère la position
; (vtable[0x3C]) et notifie sub_56E29 : positionnement d'un widget/marqueur sur un objet
; physique.
; ==============================================================================================
Debris_PositionWidget_3785C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	[bp+arg_2]
		call	AI_ComputeGeometryHelper_3B608
		add	sp, 4
		pop	si
		pop	bp
		retf
Debris_PositionWidget_3785C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37879		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, 6636h
		pop	bp
		retf
sub_37879		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37884		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, 6636h
		pop	bp
		retf
sub_37884		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3788F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_4]
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_378A1
		mov	ax, si
		jmp	short loc_378AB

loc_378A1:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_378AB:
		or	ax, ax
		jz	short loc_378CA
		mov	eax, dword_5CC90
		mov	[si], eax
		mov	eax, dword_5CC94
		mov	[si+4], eax
		mov	eax, dword_5CC98
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_378CC

loc_378CA:
		mov	ax, si

loc_378CC:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_3788F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_378D5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_4]
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_378E7
		mov	ax, si
		jmp	short loc_378F1

loc_378E7:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_378F1:
		or	ax, ax
		jz	short loc_37910
		mov	eax, dword_5CC90
		mov	[si], eax
		mov	eax, dword_5CC94
		mov	[si+4], eax
		mov	eax, dword_5CC98
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_37912

loc_37910:
		mov	ax, si

loc_37912:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_378D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3791B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_4]
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_3792D
		mov	ax, si
		jmp	short loc_37937

loc_3792D:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_37937:
		or	ax, ax
		jz	short loc_37956
		mov	eax, dword_5CC90
		mov	[si], eax
		mov	eax, dword_5CC94
		mov	[si+4], eax
		mov	eax, dword_5CC98
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_37958

loc_37956:
		mov	ax, si

loc_37958:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_3791B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37961		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_4]
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_37973
		mov	ax, si
		jmp	short loc_3797D

loc_37973:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_3797D:
		or	ax, ax
		jz	short loc_3799C
		mov	eax, dword_5CC90
		mov	[si], eax
		mov	eax, dword_5CC94
		mov	[si+4], eax
		mov	eax, dword_5CC98
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_3799E

loc_3799C:
		mov	ax, si

loc_3799E:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_37961		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_379A7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_379A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_379AF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_379AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_379B7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_379B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_379BF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_379BF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_379C7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_379C7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_379CF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 0
		pop	bp
		retf
sub_379CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_379D9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+28h]
		pop	si
		pop	bp
		retf
sub_379D9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_GetSubpartAttrib_36F3E (sub_36F3E de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_GetSubpartAttrib (sub_381F2 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,14L — accesseur
; d'un champ (+0x13 via référence +0xE) : getter d'un attribut de sous-composant.
; ==============================================================================================
Debris_GetSubpartAttrib_379E6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	bx, ax
		les	bx, [bx+0Eh]
		mov	al, es:[bx+17h]
		pop	bp
		retf
Debris_GetSubpartAttrib_379E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Debris_GetStateFlag
; (sub_36F4F de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Debris_GetStateFlag (sub_38203 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,14L — accesseur trivial d'un champ (+0x29) : getter d'un
; flag d'état de débris.
; ==============================================================================================
Debris_GetStateFlag		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+29h]
		pop	si
		pop	bp
		retf
Debris_GetStateFlag		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37A04		proc far

var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_37A32
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		les	bx, [bp+var_6]
		mov	ax, es:[bx+6]
		mov	[bp+var_2], ax

loc_37A32:
		push	si
		push	ss
		lea	ax, word ptr [bp+var_40]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	di
		push	ss
		lea	ax, word ptr [bp+var_4C]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_40]
		add	eax, [bp+var_4C]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_3C]
		add	eax, [bp+var_48]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_38]
		add	eax, [bp+var_44]
		mov	[bp+var_2C], eax
		push	eax
		push	large [bp+var_30]
		push	large [bp+var_34]
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	edx, eax
		mov	[bp+var_12], 0C800h
		mov	ecx, [bp+var_12]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_16], eax
		mov	[bp+var_1A], 0A00h
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_16]
		cmp	eax, [bp+var_1E]
		jge	short loc_37AED
		mov	ax, 1
		jmp	short loc_37AEF

loc_37AED:
		xor	ax, ax

loc_37AEF:
		or	al, al
		jz	short loc_37AF8
		lea	ax, word ptr [bp+var_16]
		jmp	short loc_37AFB

loc_37AF8:
		lea	ax, word ptr [bp+var_1E]

loc_37AFB:
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_22], eax
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	ax, [bp+var_2]
		mov	[bp+var_24], ax
		movsx	eax, [bp+var_24]
		shl	eax, 8
		mov	[bp+var_28], eax
		mov	edx, [bp+var_28]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A], eax
		mov	ax, word ptr [bp+var_A+1]
		pop	di
		pop	si
		leave
		retf
sub_37A04		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37B36		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_37B36		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37B40		proc far
		push	bp
		mov	bp, sp
		mov	word_601A2, 492h
		xor	ax, ax
		mov	word_601A6, ax
		mov	word_601A4, ax
		mov	word_601A2, 26D6h
		pop	bp
		retf
sub_37B40		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37B59		proc far
		push	bp
		mov	bp, sp
		push	2
sub_37B59		endp

; START OF FUNCTION CHUNK FOR sub_37B59
		db 68h, 82h
; END OF FUNCTION CHUNK FOR sub_37B59
seg079		ends
