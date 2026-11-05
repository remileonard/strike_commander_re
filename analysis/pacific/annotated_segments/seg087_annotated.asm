seg087		segment	para public 'CODE' use16
		assume cs:seg087
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 91h, 35h, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Debris_BodyReset
; (sub_21083 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à Debris_BodyReset
; (sub_37C4C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,23L — remet à zéro les champs d'accumulation (forces, position, cible, sous-
; composants) : constructeur/reset d'un corps physique de débris.
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

sub_36985		proc far

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
		jz	short loc_369D8
		or	byte ptr [si+2], 2
		jmp	short loc_369DC

loc_369D8:
		and	byte ptr [si+2], 0FDh

loc_369DC:
		les	bx, [si+0Eh]
		mov	al, es:[bx+18h]
		mov	[si+28h], al
		mov	al, es:[bx+1Ah]
		mov	[si+29h], al
		cmp	byte_79B64, 0
		jz	short loc_36A09
		mov	ax, word ptr [bp+arg_2]
		add	ax, 36h
		push	word ptr [bp+arg_2+2]
		push	ax
		push	15CAh
		call	CRT_Msg_NullPtrAssign
		add	sp, 6

loc_36A09:
		pop	si
		leave
		retf
sub_36985		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36A0C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	bx, ax
		mov	dx, [bx+10h]
		mov	ax, [bx+0Eh]
		pop	bp
		retf
sub_36A0C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Debris_BodyGetPosition
; (sub_37D04 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,24L — copie la position 3D (+0x12) d'un objet référencé vers un buffer : lecture
; de la position d'un corps physique de débris.
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

sub_36A46		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_36A5A
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FEh

loc_36A5A:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_36A69
		push	word ptr [si+1Eh]
		call	Container_Op_1F113
		pop	cx

loc_36A69:
		pop	si
		pop	bp
		retf
sub_36A46		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; WorldObject_TranslateBy_37D54 (sub_37D54 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, 44L, LUE (2026-09-25).
; Ex-'Debris_BodyIntegrateForces' (FAUX : pas des forces). (objet, &dx, &dy, &dz) : position
; objet+0x12/+0x16/+0x1A += (dx, dy, dz) ; puis Debris_ComputeTorque si +0x24 et notification
; (vtable+8).
; ==============================================================================================
WorldObject_TranslateBy_36A6C		proc far

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
		jz	short loc_36AA1
		push	word ptr [si+24h]
		nop
		push	cs
		call	near ptr sub_36B53
		pop	cx

loc_36AA1:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
WorldObject_TranslateBy_36A6C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36AAC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+2Ch], 1
		cmp	word ptr [si+26h], 0
		jz	short loc_36AC4
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FDh

loc_36AC4:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_36AD3
		push	word ptr [si+1Eh]
		call	Container_Op_1F06D
		pop	cx

loc_36AD3:
		pop	si
		pop	bp
		retf
sub_36AAC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36AD6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_36AF4
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 4

loc_36AF4:
		mov	byte ptr [si+2Ch], 1
		cmp	word ptr [si+26h], 0
		jz	short loc_36B09
		mov	bx, [si+26h]
		and	byte ptr [bx+30h], 0FEh
		and	byte ptr [bx+30h], 0FDh

loc_36B09:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_36B18
		push	word ptr [si+1Eh]
		call	Container_Op_1F06D
		pop	cx

loc_36B18:
		pop	si
		pop	bp
		retf
sub_36AD6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_Method_Dispatch18_A12CD (sub_A12CD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; dispatch vtable [bx+0x18] (champ +0x0E).
; ==============================================================================================
Widget_Method_Dispatch18_36B1B		proc far

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
Widget_Method_Dispatch18_36B1B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_Method_Dispatch18_A12CD (sub_A12CD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; dispatch vtable [bx+0x18] (champ +0x0E).
; ==============================================================================================
Widget_Method_Dispatch18_36B2C		proc far

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
Widget_Method_Dispatch18_36B2C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36B3D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		pop	bp
		retf
sub_36B3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36B48		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		pop	bp
		retf
sub_36B48		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36B53		proc far

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
		jz	short loc_36B9E
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
		call	Container_Op_1F0A7
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si+20h], eax

loc_36B9E:
		cmp	word ptr [si+24h], 0
		jz	short loc_36BAC
		push	word ptr [si+24h]
		push	cs
		call	near ptr sub_36B53
		pop	cx

loc_36BAC:
		pop	si
		leave
		retf
sub_36B53		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_ComputeNetForce (sub_37EA6 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,38L — calcule la
; magnitude du vecteur de force accumulé (sub_5828E) plus une composante additionnelle (+0x20,
; probable gravité) : calcul de la force résultante totale sur un débris (avec gravité).
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
		call	sub_5A065
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
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Debris_ResolveForceBuffer (sub_37EF4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,30L — si un parent existe, applique le transfert de
; force (sub_37F18) et retourne son buffer de couple ; sinon retourne le buffer de force local
; : résolution du buffer de force/couple actif d'un débris (avec ou sans parent).
; ==============================================================================================
Debris_ResolveForceBuffer		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_36C19
		push	si
		nop
		push	cs
		call	near ptr Debris_TransferForceToParent
		pop	cx
		mov	ax, [si+26h]
		add	ax, 24h
		jmp	short loc_36C1E

loc_36C19:
		mov	ax, si
		add	ax, 12h

loc_36C1E:
		pop	si
		pop	bp
		retf
Debris_ResolveForceBuffer		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_TransferForceToParent (sub_37F18 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,65L
; — transfère la position et un flag 'déjà transformé' au parent, applique la force sur son
; vecteur de couple (vtable[0x78]) : transfert récursif de force vers le corps parent (chaîne
; de sous-composants physiques).
; ==============================================================================================
Debris_TransferForceToParent		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+26h], 0
		jz	short loc_36C9E
		mov	bx, [si+26h]
		mov	al, [bx+30h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_36C9E
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
		call	sub_5A629
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

loc_36C9E:
		pop	di
		pop	si
		pop	bp
		retf
Debris_TransferForceToParent		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36CA2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_36CA2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36CAA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_36D0F
		push	di
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		cmp	word ptr [si+1Eh], 0
		jz	short loc_36D0F
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		or	al, al
		jz	short loc_36D0F
		les	bx, [si+0Ah]
		cmp	byte ptr es:[bx+8], 0
		jz	short loc_36D0F
		push	word ptr [si+0Ch]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_36D0F
		push	di
		push	word ptr [si+1Eh]
		call	WorldObjects_CallSlot4OnAll_1F14D
		add	sp, 4

loc_36D0F:
		les	bx, [si+0Eh]
		cmp	word ptr es:[bx+44h], 0
		jz	short loc_36D4E
		mov	al, byte_7D152
		mov	ah, 0
		or	ax, ax
		jnz	short loc_36D4E
		mov	bx, es:[bx+44h]
		mov	[bx+52h], si
		mov	bx, [si+0Eh]
		push	word ptr es:[bx+44h]
		mov	bx, es:[bx+44h]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		pop	cx
		push	di
		les	bx, [si+0Eh]
		push	word ptr es:[bx+44h]
		mov	bx, es:[bx+44h]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4

loc_36D4E:
		pop	di
		pop	si
		pop	bp
		retf
sub_36CAA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36D52		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+2Ch], 0
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_36D7E
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_36D7E
		mov	al, 0
		jmp	short loc_36D8F

loc_36D7E:
		cmp	word ptr [si+1Eh], 0
		jz	short loc_36D8D
		push	word ptr [si+1Eh]
		call	sub_1E4C4
		pop	cx

loc_36D8D:
		mov	al, 1

loc_36D8F:
		pop	si
		pop	bp
		retf
sub_36D52		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36D92		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_36D92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36D9A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_36D9A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36DA2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_36DA2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36DAA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		pop	bp
		retf
sub_36DAA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Debris_PositionWidget
; (sub_38068 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,21L — récupère la position (vtable[0x3C]) et notifie sub_56E29 : positionnement
; d'un widget/marqueur sur un objet physique.
; ==============================================================================================
Debris_PositionWidget_36DB4		proc far

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
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		pop	si
		pop	bp
		retf
Debris_PositionWidget_36DB4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36DD1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, 68E2h
		pop	bp
		retf
sub_36DD1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36DDC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, 68E2h
		pop	bp
		retf
sub_36DDC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36DE7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_4]
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_36DF9
		mov	ax, si
		jmp	short loc_36E03

loc_36DF9:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_36E03:
		or	ax, ax
		jz	short loc_36E22
		mov	eax, dword_79CEC
		mov	[si], eax
		mov	eax, dword_79CF0
		mov	[si+4], eax
		mov	eax, dword_79CF4
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_36E24

loc_36E22:
		mov	ax, si

loc_36E24:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_36DE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36E2D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_4]
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_36E3F
		mov	ax, si
		jmp	short loc_36E49

loc_36E3F:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_36E49:
		or	ax, ax
		jz	short loc_36E68
		mov	eax, dword_79CEC
		mov	[si], eax
		mov	eax, dword_79CF0
		mov	[si+4], eax
		mov	eax, dword_79CF4
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_36E6A

loc_36E68:
		mov	ax, si

loc_36E6A:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_36E2D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36E73		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_4]
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_36E85
		mov	ax, si
		jmp	short loc_36E8F

loc_36E85:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_36E8F:
		or	ax, ax
		jz	short loc_36EAE
		mov	eax, dword_79CEC
		mov	[si], eax
		mov	eax, dword_79CF0
		mov	[si+4], eax
		mov	eax, dword_79CF4
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_36EB0

loc_36EAE:
		mov	ax, si

loc_36EB0:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_36E73		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36EB9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_4]
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_36ECB
		mov	ax, si
		jmp	short loc_36ED5

loc_36ECB:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_36ED5:
		or	ax, ax
		jz	short loc_36EF4
		mov	eax, dword_79CEC
		mov	[si], eax
		mov	eax, dword_79CF0
		mov	[si+4], eax
		mov	eax, dword_79CF4
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_36EF6

loc_36EF4:
		mov	ax, si

loc_36EF6:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_36EB9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36EFF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_36EFF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36F07		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_36F07		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36F0F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_36F0F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36F17		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_36F17		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36F1F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_36F1F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36F27		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 0
		pop	bp
		retf
sub_36F27		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36F31		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+28h]
		pop	si
		pop	bp
		retf
sub_36F31		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_GetSubpartAttrib (sub_381F2 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,14L — accesseur
; d'un champ (+0x13 via référence +0xE) : getter d'un attribut de sous-composant.
; ==============================================================================================
Debris_GetSubpartAttrib_36F3E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	bx, ax
		les	bx, [bx+0Eh]
		mov	al, es:[bx+19h]
		pop	bp
		retf
Debris_GetSubpartAttrib_36F3E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Debris_GetStateFlag
; (sub_38203 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,14L — accesseur trivial d'un champ (+0x29) : getter d'un flag d'état de débris.
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

sub_36F5C		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_36F86
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		les	bx, [bp+var_6]
		mov	ax, es:[bx+6]
		mov	[bp+var_2], ax

loc_36F86:
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
sub_36F5C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36F8C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_36F8C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36F96		proc far
		push	bp
		mov	bp, sp
		mov	word_7CD00, 909h
		xor	ax, ax
		mov	word_7CD04, ax
		mov	word_7CD02, ax
		mov	word_7CD00, 15DDh
		pop	bp
		retf
sub_36F96		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_36FAF		proc far
		push	bp
		mov	bp, sp
		push	2
		push	65D0h
		call	Debris_ManagerDestruct
		add	sp, 4
		pop	bp
sub_36FAF		endp
seg087		ends
