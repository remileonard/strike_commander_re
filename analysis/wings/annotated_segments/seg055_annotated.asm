seg055		segment	para public 'CODE' use16
		assume cs:seg055
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 6, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26653		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_26653		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26658		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], eax
		mov	si, [bp+arg_6]
		mov	eax, [si]
		mov	es:[bx+13h], eax
		mov	eax, [si+4]
		mov	es:[bx+17h], eax
		mov	eax, [si+8]
		mov	es:[bx+1Bh], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_4], eax
		push	8
		push	large [bp+var_4]
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		call	sub_37AD
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Eh], 0
		pop	si
		leave
		retf
sub_26658		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Particle_ListMergeNode (sub_3901C de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,38L — décrémente
; un compteur (+0x14), fusionne des liens de liste chaînée (comparaison de références) :
; gestion de liste chaînée de particules (retrait/fusion de nœud).
; ==============================================================================================
Particle_ListMergeNode		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		dec	word ptr es:[bx+14h]
		mov	eax, es:[bx]
		cmp	eax, [bp+arg_8]
		jnz	short loc_266D8
		les	bx, word ptr [bp+arg_8]
		mov	eax, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx], eax

loc_266D8:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		cmp	eax, [bp+arg_8]
		jnz	short loc_266EF
		mov	eax, [bp+arg_4]
		mov	es:[bx+4], eax

loc_266EF:
		cmp	[bp+arg_4], 0
		jz	short loc_26706
		les	bx, word ptr [bp+arg_8]
		mov	eax, es:[bx+2]
		les	bx, word ptr [bp+arg_4]
		mov	es:[bx+2], eax

loc_26706:
		pop	bp
		retf
Particle_ListMergeNode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26708		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	dx, [bp+arg_4]
		mov	[bp+var_4], 0
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx]
		jmp	short loc_26769

loc_26722:
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_26759
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Particle_ListMergeNode
		add	sp, 0Ch
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_26774

loc_26759:
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_8]
		mov	eax, es:[bx+2]

loc_26769:
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jnz	short loc_26722

loc_26774:
		leave
		retf
sub_26708		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26776		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	[bp+var_4], 0
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx]
		jmp	short loc_267D7

loc_2678D:
		mov	eax, [bp+arg_4]
		cmp	eax, [bp+var_8]
		jnz	short loc_267C7
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Particle_ListMergeNode
		add	sp, 0Ch
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_267E2

loc_267C7:
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_8]
		mov	eax, es:[bx+2]

loc_267D7:
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jnz	short loc_2678D

loc_267E2:
		leave
		retf
sub_26776		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Particle_PoolWait
; (sub_381F3 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Particle_PoolWait (sub_3914B
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; far,83L — parcourt un compteur décroissant appelant potentiellement une résolution (cx
; itérations) : recherche/attente sur un pool d'objets (particules ou débris) avec limite.
; ==============================================================================================
Particle_PoolWait		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	cx, [bp+arg_4]
		mov	[bp+var_4], 0
		jmp	short loc_26807

loc_267F7:
		mov	ax, cx
		dec	cx
		or	ax, ax
		jnz	short loc_26807
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	loc_26887

loc_26807:
		cmp	[bp+var_4], 0
		jnz	short loc_26820
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		mov	es:[bx+8], eax
		jmp	short loc_26820

loc_26820:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jnz	short loc_26836
		mov	eax, es:[bx]
		mov	es:[bx+0Ch], eax
		jmp	short loc_2685A

loc_26836:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Ch]
		mov	es:[bx+8], eax
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx

loc_2685A:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jz	short loc_26872
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_4], eax
		mov	al, 1
		jmp	short loc_2687C

loc_26872:
		mov	[bp+var_4], 0
		mov	al, 0

loc_2687C:
		or	al, al
		jz	short loc_26883
		jmp	loc_267F7

loc_26883:
		xor	dx, dx
		xor	ax, ax

loc_26887:
		leave
		retf
Particle_PoolWait		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Particle_ListFreeAll (sub_38298 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Particle_ListFreeAll (sub_391F0 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,49L — parcourt une liste chaînée
; en libérant chaque nœud (sub_5C7B6) : libération complète d'une liste chaînée de
; particules/effets.
; ==============================================================================================
Particle_ListFreeAll		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		jmp	short loc_268C3

loc_26898:
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	eax, [bp+var_8]

loc_268C3:
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_26898
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+4], eax
		mov	es:[bx], eax
		mov	word ptr es:[bx+14h], 0
		mov	byte ptr es:[bx+16h], 0
		leave
		retf
Particle_ListFreeAll		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Effect_NotifyAndResetList (sub_382F9 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 2 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Effect_NotifyAndResetList (sub_39251 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,75L — parcourt une liste appelant vtable[0x10] sur
; chaque élément, réinitialise deux champs si liste vide : notification en masse + reset
; conditionnel d'une liste d'effets.
; ==============================================================================================
Effect_NotifyAndResetList		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_4], 0
		jmp	short loc_2690D

loc_268FA:
		push	[bp+arg_4]
		push	large [bp+var_4]
		les	bx, word ptr [bp+var_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_2690D:
		cmp	[bp+var_4], 0
		jnz	short loc_26926
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		mov	es:[bx+8], eax
		jmp	short loc_26926

loc_26926:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jnz	short loc_2693C
		mov	eax, es:[bx]
		mov	es:[bx+0Ch], eax
		jmp	short loc_26960

loc_2693C:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Ch]
		mov	es:[bx+8], eax
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx

loc_26960:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jz	short loc_26978
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_4], eax
		mov	al, 1
		jmp	short loc_26982

loc_26978:
		mov	[bp+var_4], 0
		mov	al, 0

loc_26982:
		or	al, al
		jz	short loc_26989
		jmp	loc_268FA

loc_26989:
		leave
		retf
Effect_NotifyAndResetList		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2698B		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		push	8
		push	large [bp+var_4]
		mov	ax, [bp+arg_0]
		add	ax, 6
		push	[bp+arg_2]
		push	ax
		call	sub_37AD
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Eh], 0
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	es:[bx+0Fh], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	es:[bx+13h], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	es:[bx+17h], eax
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	es:[bx+1Bh], eax
		leave
		retf
sub_2698B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Debris_Helper4_9C7DF
; (sub_9C7DF de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, aucun appel externe visible (20 lignes).
; ==============================================================================================
Debris_Helper4_269FF		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], eax
		mov	eax, [si+4]
		mov	es:[bx+23h], eax
		mov	eax, [si+8]
		mov	es:[bx+27h], eax
		pop	si
		pop	bp
		retf
Debris_Helper4_269FF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26A26		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_26A53
		mov	al, byte_5C182
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_5C182, al
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		jmp	short loc_26A55

loc_26A53:
		mov	al, 0

loc_26A55:
		pop	bp
		retf
sub_26A26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26A57		proc far

var_50		= dword ptr -50h
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
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		cmp	[bp+arg_4], 0
		jnz	short loc_26A68
		jmp	loc_26B8A

loc_26A68:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 1Fh
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_38], eax
		mov	eax, es:[si+4]
		mov	[bp+var_34], eax
		mov	eax, es:[si+8]
		mov	[bp+var_30], eax
		cmp	byte_5C182, 0
		jz	short loc_26AEF
		mov	eax, dword_60008
		neg	eax
		mov	[bp+var_44], eax
		mov	eax, dword_6000C
		neg	eax
		mov	[bp+var_40], eax
		mov	eax, dword_60010
		neg	eax
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_48], eax
		lea	ax, word ptr [bp+var_50]
		push	ax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	Targeting_ComputeBearingElevation_3A2BC
		add	sp, 8
		mov	eax, [bp+var_C]
		jmp	short loc_26B07

loc_26AEF:
		push	62E8h
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Targeting_ComputeBearingElevation_3A2BC
		add	sp, 8
		mov	eax, [bp+var_10]

loc_26B07:
		mov	[bp+var_8], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 0Fh
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		push	large dword_60010
		push	large dword_6000C
		push	large dword_60008
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_20], eax
		mov	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Math_CosDeg_3902D
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_24]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		cmp	eax, [bp+var_14]
		jge	short loc_26B80
		mov	ax, 1
		jmp	short loc_26B82

loc_26B80:
		xor	ax, ax

loc_26B82:
		or	al, al
		jz	short loc_26B8A
		mov	al, 1
		jmp	short loc_26B8C

loc_26B8A:
		mov	al, 0

loc_26B8C:
		pop	si
		leave
		retf
sub_26A57		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26B8F		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_26BBC
		mov	al, byte_5C182
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_5C182, al
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		jmp	short loc_26BBE

loc_26BBC:
		mov	al, 0

loc_26BBE:
		pop	bp
		retf
sub_26B8F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26BC0		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_26BC0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26BC7		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_26BF4
		mov	al, byte_5C182
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_5C182, al
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		jmp	short loc_26BF6

loc_26BF4:
		mov	al, 0

loc_26BF6:
		pop	bp
		retf
sub_26BC7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26BF8		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_26BF8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26BFF		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_26C2C
		mov	al, byte_5C182
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_5C182, al
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		jmp	short loc_26C2E

loc_26C2C:
		mov	al, 0

loc_26C2E:
		pop	bp
		retf
sub_26BFF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26C30		proc far

var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		cmp	[bp+arg_4], 0
		jnz	short loc_26C41
		jmp	loc_26D29

loc_26C41:
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 13h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_10], eax
		mov	eax, es:[si+4]
		mov	[bp+var_C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_8], eax
		cmp	byte_5C182, 0
		jz	short loc_26CA0
		push	62C4h
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_3D00B
		add	sp, 4
		mov	eax, [bp+var_10]
		add	dword_60008, eax
		mov	eax, [bp+var_C]
		add	dword_6000C, eax
		mov	eax, [bp+var_8]
		add	dword_60010, eax
		jmp	short loc_26D06

loc_26CA0:
		push	62A0h
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_3D00B
		add	sp, 4
		mov	eax, [bp+var_10]
		sub	eax, dword_60008
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_C]
		sub	eax, dword_6000C
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		sub	eax, dword_60010
		mov	[bp+var_14], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_28]
		mov	dword_60008, eax
		mov	eax, [bp+var_24]
		mov	dword_6000C, eax
		mov	eax, [bp+var_20]
		mov	dword_60010, eax

loc_26D06:
		mov	al, byte_5C182
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_5C182, al
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		jmp	short loc_26D2B

loc_26D29:
		mov	al, 0

loc_26D2B:
		pop	si
		leave
		retf
sub_26C30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26D2E		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_26D5B
		mov	al, byte_5C182
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_5C182, al
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 8
		jmp	short loc_26D5D

loc_26D5B:
		mov	al, 0

loc_26D5D:
		pop	bp
		retf
sub_26D2E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26D5F		proc far

var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		cmp	[bp+arg_4], 0
		jnz	short loc_26D70
		jmp	loc_26E9F

loc_26D70:
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+13h]
		mov	[bp+var_28], eax
		mov	eax, es:[bx+17h]
		mov	[bp+var_24], eax
		mov	eax, es:[bx+1Bh]
		mov	[bp+var_20], eax
		cmp	byte_5C182, 0
		jz	short loc_26DC1
		push	62A0h
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	sub_3D00B
		add	sp, 4
		mov	eax, dword_60008
		sub	[bp+var_28], eax
		mov	eax, dword_6000C
		sub	[bp+var_24], eax
		mov	eax, dword_60010
		sub	[bp+var_20], eax
		push	62C4h
		jmp	short loc_26DEB

loc_26DC1:
		push	62C4h
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	sub_3D00B
		add	sp, 4
		mov	eax, dword_60008
		add	[bp+var_28], eax
		mov	eax, dword_6000C
		add	[bp+var_24], eax
		mov	eax, dword_60010
		add	[bp+var_20], eax
		push	62A0h

loc_26DEB:
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	Matrix_WorldToLocal_3CF4B
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+23h]
		mov	[bp+var_4], eax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+27h]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+2Bh]
		mov	[bp+var_10], eax
		mov	eax, es:[bx+2Fh]
		mov	[bp+var_14], eax
		mov	eax, es:[bx+33h]
		mov	[bp+var_18], eax
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+0Fh]
		mov	[bp+var_1C], eax
		lea	si, word ptr [bp+var_28]
		mov	eax, [si]
		sub	eax, [bp+var_1C]
		cmp	eax, [bp+var_8]
		jg	short loc_26E9F
		mov	eax, [si]
		add	eax, [bp+var_1C]
		cmp	eax, [bp+var_4]
		jl	short loc_26E9F
		mov	eax, [bp+var_24]
		mov	[si], eax
		mov	eax, [si]
		sub	eax, [bp+var_1C]
		cmp	eax, [bp+var_C]
		jg	short loc_26E9F
		mov	eax, [si]
		add	eax, [bp+var_1C]
		cmp	eax, [bp+var_10]
		jl	short loc_26E9F
		mov	eax, [bp+var_20]
		mov	[si], eax
		mov	eax, [si]
		sub	eax, [bp+var_1C]
		cmp	eax, [bp+var_14]
		jg	short loc_26E9F
		mov	eax, [si]
		add	eax, [bp+var_1C]
		cmp	eax, [bp+var_18]
		jl	short loc_26E9F
		mov	al, 1
		jmp	short loc_26EA1

loc_26E9F:
		mov	al, 0

loc_26EA1:
		pop	si
		leave
		retf
sub_26D5F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26EA4		proc far

var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	[bp+var_1], 0
		cmp	[bp+arg_4], 0
		jz	short loc_26F03
		mov	eax, [bp+arg_4]
		mov	[bp+var_6], eax
		push	large [bp+var_6]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Effect_GridProjectCorners
		add	sp, 8
		or	al, al
		jz	short loc_26ED5
		mov	[bp+var_1], 1

loc_26ED5:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_26F03
		mov	al, byte_5C182
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_5C182, al
		push	large [bp+arg_0]
		push	large [bp+var_6]
		nop
		push	cs
		call	near ptr Effect_GridProjectCorners
		add	sp, 8
		or	al, al
		jz	short loc_26F03
		mov	[bp+var_1], 1

loc_26F03:
		mov	al, [bp+var_1]
		leave
		retf
sub_26EA4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26F08		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		cmp	[bp+arg_4], 0
		jz	short loc_26F86
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	dword_60014, eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	dword_60018, eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	dword_6001C, eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 1Fh
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	si, [bp+var_10]
		mov	eax, es:[si]
		mov	dword_60020, eax
		mov	eax, es:[si+4]
		mov	dword_60024, eax
		mov	eax, es:[si+8]
		mov	dword_60028, eax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Effect_RenderVolumetric
		add	sp, 4
		or	al, al
		jz	short loc_26F86
		mov	al, 1
		jmp	short loc_26F88

loc_26F86:
		mov	al, 0

loc_26F88:
		pop	si
		leave
		retf
sub_26F08		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Effect_BBoxClipTest (sub_3894C de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE :
; même suite d'instructions, 6 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Effect_BBoxClipTest (sub_157C1 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Effect_BBoxClipTest (sub_398CB de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far,47L — calcule un code de sortie combiné
; (Cohen-Sutherland, 3 axes) pour une bounding box vs un point : test de clipping bounding-box
; pour le rendu de débris/particules.
; ==============================================================================================
Effect_BBoxClipTest		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		xor	cx, cx
		mov	di, [bp+arg_0]
		mov	es, [bp+arg_2]
		mov	eax, es:[di+1Fh]
		sub	eax, [si]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si]
		sub	eax, es:[di+23h]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, es:[di+27h]
		sub	eax, [si+4]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si+4]
		sub	eax, es:[di+2Bh]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, es:[di+2Fh]
		sub	eax, [si+8]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si+8]
		sub	eax, es:[di+33h]
		shl	eax, 1
		rcl	cx, 1
		mov	al, cl
		pop	di
		pop	si
		pop	bp
		retf
Effect_BBoxClipTest		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 12 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Effect_GridProjectCorners (sub_389B4 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 21 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Effect_GridProjectCorners (sub_39933 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,237L — itère une grille
; (offsets +0x1F/+0x27/+0x2F/+0x33) en projetant les coins vers des globals partagés
; (dword_72826-728...) : préparation géométrique d'une grille de rendu (probable overlay/effet
; de zone).
; ==============================================================================================
Effect_GridProjectCorners		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+2Fh]
		mov	[bp+var_4], eax
		mov	eax, es:[bx+33h]
		mov	[bp+var_10], eax
		xor	si, si
		jmp	loc_27097

loc_27015:
		mov	ax, si
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_18], eax
		mov	[bp+var_C], eax
		xor	di, di
		jmp	short loc_27091

loc_27030:
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+27h]
		mov	[bp+var_14], eax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_C]
		mov	dword_60014, eax
		mov	eax, [bp+var_8]
		mov	dword_60018, eax
		mov	eax, [bp+var_4]
		mov	dword_6001C, eax
		mov	eax, [bp+var_18]
		mov	dword_60020, eax
		mov	eax, [bp+var_14]
		mov	dword_60024, eax
		mov	eax, [bp+var_10]
		mov	dword_60028, eax
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Debug_ToggleWireframeMode
		add	sp, 8
		or	al, al
		jz	short loc_27090

loc_2708B:
		mov	al, 1
		jmp	loc_271E5

loc_27090:
		inc	di

loc_27091:
		cmp	di, 2
		jl	short loc_27030
		inc	si

loc_27097:
		cmp	si, 2
		jge	short loc_2709F
		jmp	loc_27015

loc_2709F:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+27h]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+2Bh]
		mov	[bp+var_14], eax
		xor	si, si
		jmp	loc_27139

loc_270B9:
		mov	ax, si
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_18], eax
		mov	[bp+var_C], eax
		xor	di, di
		jmp	short loc_27133

loc_270D4:
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+2Fh]
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		mov	dword_60014, eax
		mov	eax, [bp+var_8]
		mov	dword_60018, eax
		mov	eax, [bp+var_4]
		mov	dword_6001C, eax
		mov	eax, [bp+var_18]
		mov	dword_60020, eax
		mov	eax, [bp+var_14]
		mov	dword_60024, eax
		mov	eax, [bp+var_10]
		mov	dword_60028, eax
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Debug_ToggleWireframeMode
		add	sp, 8
		or	al, al
		jz	short loc_27132
		jmp	loc_2708B

loc_27132:
		inc	di

loc_27133:
		cmp	di, 2
		jl	short loc_270D4
		inc	si

loc_27139:
		cmp	si, 2
		jge	short loc_27141
		jmp	loc_270B9

loc_27141:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+23h]
		mov	[bp+var_18], eax
		xor	si, si
		jmp	loc_271DB

loc_2715B:
		mov	ax, si
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+27h]
		mov	[bp+var_14], eax
		mov	[bp+var_8], eax
		xor	di, di
		jmp	short loc_271D5

loc_27176:
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+2Fh]
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		mov	dword_60014, eax
		mov	eax, [bp+var_8]
		mov	dword_60018, eax
		mov	eax, [bp+var_4]
		mov	dword_6001C, eax
		mov	eax, [bp+var_18]
		mov	dword_60020, eax
		mov	eax, [bp+var_14]
		mov	dword_60024, eax
		mov	eax, [bp+var_10]
		mov	dword_60028, eax
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Debug_ToggleWireframeMode
		add	sp, 8
		or	al, al
		jz	short loc_271D4
		jmp	loc_2708B

loc_271D4:
		inc	di

loc_271D5:
		cmp	di, 2
		jl	short loc_27176
		inc	si

loc_271DB:
		cmp	si, 2
		jge	short loc_271E3
		jmp	loc_2715B

loc_271E3:
		mov	al, 0

loc_271E5:
		pop	di
		pop	si
		leave
		retf
Effect_GridProjectCorners		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 15 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Effect_RenderVolumetric (sub_38BAA de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 16 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Effect_RenderVolumetric (sub_39B29 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,589L — grosse fonction du
; cluster effets/débris (buffer local 0x1A0) appelée par sub_3A1C6 : candidat pour le rendu
; détaillé d'un effet visuel complexe (explosion/fumée volumétrique), à approfondir.
; ==============================================================================================
Effect_RenderVolumetric		proc far

var_1A0		= dword ptr -1A0h
var_19C		= dword ptr -19Ch
var_198		= dword ptr -198h
var_194		= dword ptr -194h
var_190		= dword ptr -190h
var_18C		= dword ptr -18Ch
var_188		= dword ptr -188h
var_184		= dword ptr -184h
var_180		= dword ptr -180h
var_17C		= dword ptr -17Ch
var_178		= dword ptr -178h
var_174		= dword ptr -174h
var_170		= dword ptr -170h
var_16C		= dword ptr -16Ch
var_168		= dword ptr -168h
var_164		= dword ptr -164h
var_160		= dword ptr -160h
var_15C		= dword ptr -15Ch
var_158		= dword ptr -158h
var_154		= dword ptr -154h
var_150		= dword ptr -150h
var_14C		= dword ptr -14Ch
var_148		= dword ptr -148h
var_144		= dword ptr -144h
var_140		= dword ptr -140h
var_13C		= dword ptr -13Ch
var_138		= dword ptr -138h
var_134		= dword ptr -134h
var_130		= dword ptr -130h
var_12C		= dword ptr -12Ch
var_128		= dword ptr -128h
var_124		= dword ptr -124h
var_120		= dword ptr -120h
var_11C		= dword ptr -11Ch
var_118		= dword ptr -118h
var_114		= dword ptr -114h
var_110		= dword ptr -110h
var_10C		= dword ptr -10Ch
var_108		= dword ptr -108h
var_104		= dword ptr -104h
var_100		= dword ptr -100h
var_FC		= dword ptr -0FCh
var_F8		= dword ptr -0F8h
var_F4		= dword ptr -0F4h
var_F0		= dword ptr -0F0h
var_EC		= dword ptr -0ECh
var_E8		= dword ptr -0E8h
var_E4		= dword ptr -0E4h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
var_D4		= dword ptr -0D4h
var_D0		= dword ptr -0D0h
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
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
var_50		= dword ptr -50h
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
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1ACh
		mov	[bp+var_2], 0
		mov	[bp+var_3], 0
		cmp	byte_5C182, 0
		jz	short loc_27248
		mov	eax, dword_60008
		sub	dword_60014, eax
		mov	eax, dword_6000C
		sub	dword_60018, eax
		mov	eax, dword_60010
		sub	dword_6001C, eax
		mov	eax, dword_60008
		sub	dword_60020, eax
		mov	eax, dword_6000C
		sub	dword_60024, eax
		mov	eax, dword_60010
		sub	dword_60028, eax
		push	62C4h
		push	62F4h
		call	Matrix_WorldToLocal_3CF4B
		add	sp, 4
		push	62C4h
		jmp	short loc_2728F

loc_27248:
		mov	eax, dword_60008
		add	dword_60014, eax
		mov	eax, dword_6000C
		add	dword_60018, eax
		mov	eax, dword_60010
		add	dword_6001C, eax
		mov	eax, dword_60008
		add	dword_60020, eax
		mov	eax, dword_6000C
		add	dword_60024, eax
		mov	eax, dword_60010
		add	dword_60028, eax
		push	62A0h
		push	62F4h
		call	Matrix_WorldToLocal_3CF4B
		add	sp, 4
		push	62A0h

loc_2728F:
		push	6300h
		call	Matrix_WorldToLocal_3CF4B
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+23h]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_10], eax
		mov	eax, es:[bx+27h]
		mov	[bp+var_14], eax
		mov	eax, es:[bx+2Bh]
		mov	[bp+var_18], eax
		mov	eax, es:[bx+2Fh]
		mov	[bp+var_1C], eax
		mov	eax, es:[bx+33h]
		mov	[bp+var_20], eax
		jmp	loc_27875

loc_272D6:
		push	62F4h
		push	large [bp+arg_0]
		push	cs
		call	near ptr Effect_BBoxClipTest
		add	sp, 6
		mov	[bp+var_1], al
		push	6300h
		push	large [bp+arg_0]
		push	cs
		call	near ptr Effect_BBoxClipTest
		add	sp, 6
		mov	bl, al
		mov	al, [bp+var_1]
		cbw
		or	ax, ax
		jz	short loc_27306
		mov	al, bl
		cbw
		or	ax, ax
		jnz	short loc_27311

loc_27306:
		mov	[bp+var_2], 1
		mov	[bp+var_3], 1
		jmp	loc_27875

loc_27311:
		test	[bp+var_1], bl
		jz	short loc_27321
		mov	[bp+var_2], 1
		mov	[bp+var_3], 0
		jmp	loc_27875

loc_27321:
		test	[bp+var_1], 20h
		jnz	short loc_2732A
		jmp	loc_273F3

loc_2732A:
		mov	eax, [bp+var_10]
		sub	eax, dword_60014
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	[bp+var_8], eax
		mov	eax, dword_60020
		sub	eax, dword_60014
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_30]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_10]
		mov	dword_60014, eax
		mov	eax, dword_60024
		sub	eax, dword_60018
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_38]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	eax, dword_60018
		add	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	dword_60018, eax
		mov	eax, dword_60028
		sub	eax, dword_6001C
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	eax, dword_6001C
		add	eax, [bp+var_58]
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		jmp	loc_27871

loc_273F3:
		test	[bp+var_1], 10h
		jnz	short loc_273FC
		jmp	loc_274D0

loc_273FC:
		mov	eax, [bp+var_C]
		sub	eax, dword_60014
		mov	[bp+var_64], eax
		mov	[bp+var_68], eax
		mov	[bp+var_8], eax
		mov	eax, dword_60020
		sub	eax, dword_60014
		mov	[bp+var_6C], eax
		mov	[bp+var_70], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_70]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_C]
		mov	dword_60014, eax
		mov	eax, dword_60024
		sub	eax, dword_60018
		mov	[bp+var_74], eax
		mov	[bp+var_78], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_78]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_80], eax
		mov	eax, dword_60018
		add	eax, [bp+var_80]
		mov	[bp+var_84], eax
		mov	[bp+var_88], eax
		mov	dword_60018, eax
		mov	eax, dword_60028
		sub	eax, dword_6001C
		mov	[bp+var_8C], eax
		mov	[bp+var_90], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_90]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_98], eax
		mov	eax, dword_6001C
		add	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		mov	[bp+var_A0], eax
		jmp	loc_27871

loc_274D0:
		test	[bp+var_1], 8
		jnz	short loc_274D9
		jmp	loc_275B9

loc_274D9:
		mov	eax, [bp+var_14]
		sub	eax, dword_60018
		mov	[bp+var_A4], eax
		mov	[bp+var_A8], eax
		mov	[bp+var_8], eax
		mov	eax, dword_60024
		sub	eax, dword_60018
		mov	[bp+var_AC], eax
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_B0]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_60020
		sub	eax, dword_60014
		mov	[bp+var_B4], eax
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_B8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_C0], eax
		mov	eax, dword_60014
		add	eax, [bp+var_C0]
		mov	[bp+var_C4], eax
		mov	[bp+var_C8], eax
		mov	dword_60014, eax
		mov	eax, [bp+var_14]
		mov	dword_60018, eax
		mov	eax, dword_60028
		sub	eax, dword_6001C
		mov	[bp+var_CC], eax
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_D0]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_D8], eax
		mov	eax, dword_6001C
		add	eax, [bp+var_D8]
		mov	[bp+var_DC], eax
		mov	[bp+var_E0], eax
		jmp	loc_27871

loc_275B9:
		test	[bp+var_1], 4
		jnz	short loc_275C2
		jmp	loc_276A2

loc_275C2:
		mov	eax, [bp+var_18]
		sub	eax, dword_60018
		mov	[bp+var_E4], eax
		mov	[bp+var_E8], eax
		mov	[bp+var_8], eax
		mov	eax, dword_60024
		sub	eax, dword_60018
		mov	[bp+var_EC], eax
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_F0]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_60020
		sub	eax, dword_60014
		mov	[bp+var_F4], eax
		mov	[bp+var_F8], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_F8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_FC], eax
		mov	eax, [bp+var_FC]
		mov	[bp+var_100], eax
		mov	eax, dword_60014
		add	eax, [bp+var_100]
		mov	[bp+var_104], eax
		mov	[bp+var_108], eax
		mov	dword_60014, eax
		mov	eax, [bp+var_18]
		mov	dword_60018, eax
		mov	eax, dword_60028
		sub	eax, dword_6001C
		mov	[bp+var_10C], eax
		mov	[bp+var_110], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_110]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_114], eax
		mov	eax, [bp+var_114]
		mov	[bp+var_118], eax
		mov	eax, dword_6001C
		add	eax, [bp+var_118]
		mov	[bp+var_11C], eax
		mov	[bp+var_120], eax
		jmp	loc_27871

loc_276A2:
		test	[bp+var_1], 2
		jnz	short loc_276AB
		jmp	loc_2778B

loc_276AB:
		mov	eax, [bp+var_1C]
		sub	eax, dword_6001C
		mov	[bp+var_124], eax
		mov	[bp+var_128], eax
		mov	[bp+var_8], eax
		mov	eax, dword_60028
		sub	eax, dword_6001C
		mov	[bp+var_12C], eax
		mov	[bp+var_130], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_130]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_60020
		sub	eax, dword_60014
		mov	[bp+var_134], eax
		mov	[bp+var_138], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_138]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_13C], eax
		mov	eax, [bp+var_13C]
		mov	[bp+var_140], eax
		mov	eax, dword_60014
		add	eax, [bp+var_140]
		mov	[bp+var_144], eax
		mov	[bp+var_148], eax
		mov	dword_60014, eax
		mov	eax, dword_60024
		sub	eax, dword_60018
		mov	[bp+var_14C], eax
		mov	[bp+var_150], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_150]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_154], eax
		mov	eax, [bp+var_154]
		mov	[bp+var_158], eax
		mov	eax, dword_60018
		add	eax, [bp+var_158]
		mov	[bp+var_15C], eax
		mov	[bp+var_160], eax
		mov	dword_60018, eax
		mov	eax, [bp+var_1C]
		jmp	loc_27871

loc_2778B:
		test	[bp+var_1], 1
		jnz	short loc_27794
		jmp	loc_27875

loc_27794:
		mov	eax, [bp+var_20]
		sub	eax, dword_6001C
		mov	[bp+var_164], eax
		mov	[bp+var_168], eax
		mov	[bp+var_8], eax
		mov	eax, dword_60028
		sub	eax, dword_6001C
		mov	[bp+var_16C], eax
		mov	[bp+var_170], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_170]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_60020
		sub	eax, dword_60014
		mov	[bp+var_174], eax
		mov	[bp+var_178], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_178]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_17C], eax
		mov	eax, [bp+var_17C]
		mov	[bp+var_180], eax
		mov	eax, dword_60014
		add	eax, [bp+var_180]
		mov	[bp+var_184], eax
		mov	[bp+var_188], eax
		mov	dword_60014, eax
		mov	eax, dword_60024
		sub	eax, dword_60018
		mov	[bp+var_18C], eax
		mov	[bp+var_190], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_190]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_194], eax
		mov	eax, [bp+var_194]
		mov	[bp+var_198], eax
		mov	eax, dword_60018
		add	eax, [bp+var_198]
		mov	[bp+var_19C], eax
		mov	[bp+var_1A0], eax
		mov	dword_60018, eax
		mov	eax, [bp+var_20]

loc_27871:
		mov	dword_6001C, eax

loc_27875:
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_27881
		jmp	loc_272D6

loc_27881:
		mov	al, [bp+var_3]
		leave
		retf
Effect_RenderVolumetric		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debug_ToggleWireframeMode (sub_39247 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Debug_ToggleWireframeMode (sub_3A1C6 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,50L — bascule un mode
; de rendu global (byte_6EC34) entre deux réglages sonores/visuels ('WF'/'XX', bip 'Wv'),
; appelle sub_39B29 : bascule debug entre deux modes de rendu (wireframe/solide) avec retour
; sonore.
; ==============================================================================================
Debug_ToggleWireframeMode		proc far

arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_278E0
		cmp	byte_5C182, 0
		jz	short loc_278AA
		push	62C4h
		push	62F4h
		call	sub_3D00B
		add	sp, 4
		push	62C4h
		jmp	short loc_278BB

loc_278AA:
		push	62A0h
		push	62F4h
		call	sub_3D00B
		add	sp, 4
		push	62A0h

loc_278BB:
		push	6300h
		call	sub_3D00B
		add	sp, 4
		mov	al, byte_5C182
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_5C182, al
		push	large [bp+arg_4]
		push	cs
		call	near ptr Effect_RenderVolumetric
		add	sp, 4
		jmp	short loc_278E2

loc_278E0:
		mov	al, 0

loc_278E2:
		pop	bp
		retf
Debug_ToggleWireframeMode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_278E4		proc far
		push	bp
		mov	bp, sp
		push	62A0h
		call	Formation_ComputeGeometryHelper_3B522
		pop	cx
sub_278E4		endp
seg055		ends
