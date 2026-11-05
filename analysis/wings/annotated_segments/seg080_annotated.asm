seg080		segment	para public 'CODE' use16
		assume cs:seg080
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 64h, 9Ah, 0D2h, 0, 0B6h, 37h, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37B6B		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_37B6B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37B72		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	2Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_37BBD
		mov	word ptr [si], 2772h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 26E2h
		push	large [bp+var_4]
		push	ax
		call	sub_3747D
		add	sp, 6
		mov	ax, si
		jmp	short loc_37BBF

loc_37BBD:
		mov	ax, si

loc_37BBF:
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_5901E
		add	sp, 6
		mov	ax, si
		pop	si
		leave
		retf
sub_37B72		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37BD3		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		les	bx, [bp+arg_0]
		mov	al, es:[bx+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_37C12
		push	si
		push	di
		mov	bx, [di]
		call	dword ptr [bx+88h]
		add	sp, 4
		mov	[bp+var_2], ax
		mov	[bp+var_4], ax
		add	[si+2Ah], ax
		mov	ax, [si+2Ah]
		les	bx, [bp+arg_0]
		cmp	ax, es:[bx+6]
		jb	short loc_37C12
		mov	al, 1
		jmp	short loc_37C14

loc_37C12:
		mov	al, 0

loc_37C14:
		pop	di
		pop	si
		leave
		retf
sub_37BD3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37C18		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_37C18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37C1D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+3], 0
		jz	short loc_37C2E
		mov	al, 0
		jmp	short loc_37C30

loc_37C2E:
		mov	al, 1

loc_37C30:
		pop	bp
		retf
sub_37C1D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_ManagerDestruct (sub_377D0 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Debris_ManagerDestruct (sub_3896E de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,32L — destructeur (type
; 0x1AD0) libérant la liste des débris associés : destructeur du gestionnaire de débris d'un
; objet.
; ==============================================================================================
Debris_ManagerDestruct		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_37C5D
		mov	word ptr [si], 26D6h
		mov	word ptr [si], 492h
		push	si
		call	sub_4870F
		pop	cx
		test	di, 1
		jz	short loc_37C5D
		push	si
		call	sub_33B
		pop	cx

loc_37C5D:
		pop	di
		pop	si
		pop	bp
		retf
Debris_ManagerDestruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37C61		proc far

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
		xor	di, di

loc_37C73:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jz	short loc_37C8C
		mov	ax, di
		inc	di
		cmp	ax, [bp+arg_2]
		jl	short loc_37C73

loc_37C8C:
		cmp	[bp+var_2], 0
		jz	short loc_37C9E
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr Debris_ReleaseRefCounted
		add	sp, 4

loc_37C9E:
		pop	di
		pop	si
		leave
		retf
sub_37C61		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Debris_FindAndRemoveByID (sub_389DE de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,43L — recherche dans une liste un élément dont le champ
; (+4) correspond à une valeur, puis le retire (sub_38A20) : recherche et suppression d'un
; débris spécifique par identifiant.
; ==============================================================================================
Debris_FindAndRemoveByID		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0

loc_37CB1:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jz	short loc_37CCF
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		cmp	eax, [bp+arg_2]
		jnz	short loc_37CB1

loc_37CCF:
		cmp	[bp+var_2], 0
		jz	short loc_37CE1
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr Debris_ReleaseRefCounted
		add	sp, 4

loc_37CE1:
		pop	si
		leave
		retf
Debris_FindAndRemoveByID		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Debris_ReleaseRefCounted (sub_37882 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 2 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Debris_ReleaseRefCounted (sub_38A20 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,60L — décrémente un compteur de référence (+4), si nul
; et flag actif (+2) notifie (vtable[0]) et retire de la liste : libération d'un débris quand
; son compteur de référence atteint zéro.
; ==============================================================================================
Debris_ReleaseRefCounted		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_37D39
		mov	eax, [di+4]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		dec	word ptr es:[bx+4]
		mov	al, es:[bx+4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_37D39
		cmp	byte ptr es:[bx+2], 0
		jz	short loc_37D39
		cmp	[bp+var_4], 0
		jz	short loc_37D2D
		push	3
		push	word ptr [bp+var_4+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_37D2D

loc_37D2D:
		push	0
		push	di
		push	si
		call	LinkedListB_FindAndDispatch_48648
		add	sp, 6

loc_37D39:
		pop	di
		pop	si
		leave
		retf
Debris_ReleaseRefCounted		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_FindModelByID (sub_38A79 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,75L — recherche un
; modèle de débris par identifiant dans une table globale (offset +0x2B) : recherche d'un
; modèle de débris pré-chargé par identifiant.
; ==============================================================================================
Debris_FindModelByID		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	eax, [bp+arg_2]
		mov	[bp+var_14], eax
		push	8
		push	large [bp+var_14]
		push	ds
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_37AD
		add	sp, 0Ah
		mov	[bp+var_8], 0
		jmp	short loc_37DA4

loc_37D6D:
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[bp+var_6], eax
		les	bx, word ptr [bp+var_6]
		mov	eax, es:[bx+1Dh]
		cmp	eax, [bp+var_10]
		jnz	short loc_37D96
		mov	eax, es:[bx+21h]
		cmp	eax, [bp+var_C]
		jnz	short loc_37D96
		mov	ax, 1
		jmp	short loc_37D98

loc_37D96:
		xor	ax, ax

loc_37D98:
		or	al, al
		jz	short loc_37DA4
		mov	dx, word ptr [bp+var_6+2]
		mov	ax, word ptr [bp+var_6]
		jmp	short loc_37DB9

loc_37DA4:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_37D6D
		xor	dx, dx
		xor	ax, ax

loc_37DB9:
		pop	si
		leave
		retf
Debris_FindModelByID		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37DBC		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_37DDE

loc_37DCD:
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		cmp	eax, [bp+arg_2]
		jnz	short loc_37DDE
		mov	al, 1
		jmp	short loc_37DF1

loc_37DDE:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_37DCD
		mov	al, 0

loc_37DF1:
		pop	si
		leave
		retf
sub_37DBC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37DF4		proc far

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
		xor	di, di
		jmp	short loc_37E1B

loc_37E08:
		mov	ax, di
		inc	di
		cmp	ax, [bp+arg_2]
		jnz	short loc_37E1B
		mov	bx, [bp+var_2]
		mov	dx, [bx+6]
		mov	ax, [bx+4]
		jmp	short loc_37E30

loc_37E1B:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_37E08
		xor	dx, dx
		xor	ax, ax

loc_37E30:
		pop	di
		pop	si
		leave
		retf
sub_37DF4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37E34		proc far

var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_6		= byte ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	si, [bp+arg_0]
		push	8
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		call	sub_37AD
		add	sp, 0Ah
		mov	[bp+var_6], 0
		lea	ax, [bp+var_E]
		push	ax
		call	CRT_Strupr_2D5D
		pop	cx
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	si
		push	cs
		call	near ptr Debris_FindModelByID
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_37E91
		mov	al, [bp+arg_8]
		push	ax
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	si
		call	sub_59065
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_37E91:
		cmp	[bp+var_4], 0
		jz	short loc_37EF4
		les	bx, word ptr [bp+var_4]
		mov	al, [bp+arg_6]
		mov	es:[bx+2Ah], al
		push	word ptr [bp+var_4+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	si, ax
		or	si, si
		jz	short loc_37EF0
		mov	[bp+var_12], 0
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+19h], 0
		jz	short loc_37EE1
		push	ax
		push	large es:[bx+19h]
		les	bx, es:[bx+19h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax

loc_37EE1:
		mov	eax, [bp+var_12]
		mov	[si+0Ah], eax
		les	bx, word ptr [bp+var_4]
		inc	word ptr es:[bx+4]

loc_37EF0:
		mov	ax, si
		jmp	short loc_37EF6

loc_37EF4:
		xor	ax, ax

loc_37EF6:
		pop	si
		leave
		retf
sub_37E34		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_LoadAndInstantiateAlt (sub_37C20 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debris_LoadAndInstantiateAlt (sub_38C12 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,85L
; — variante de sub_38B70 utilisant sub_3CA22 pour la résolution finale : chargement et
; instanciation de débris, variante avec résolution alternative.
; ==============================================================================================
Debris_LoadAndInstantiateAlt		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr Debris_FindModelByID
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_37F33
		mov	al, [bp+arg_8]
		push	ax
		push	large [bp+arg_2]
		push	si
		call	sub_59065
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_37F33:
		cmp	[bp+var_4], 0
		jz	short loc_37FA4
		push	large [bp+var_4]
		push	0
		call	WorldObject_BaseConstructAttached
		add	sp, 6
		mov	si, ax
		or	si, si
		jz	short loc_37FA0
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 1Dh
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	eax, [bp+var_8]
		mov	[si+6], eax
		mov	[bp+var_C], 0
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+19h], 0
		jz	short loc_37F91
		push	si
		push	large es:[bx+19h]
		les	bx, es:[bx+19h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax

loc_37F91:
		mov	eax, [bp+var_C]
		mov	[si+0Ah], eax
		les	bx, word ptr [bp+var_4]
		inc	word ptr es:[bx+4]

loc_37FA0:
		mov	ax, si
		jmp	short loc_37FA6

loc_37FA4:
		xor	ax, ax

loc_37FA6:
		pop	si
		leave
		retf
Debris_LoadAndInstantiateAlt		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37FA9		proc far

var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		xor	di, di
		or	si, si
		jnz	short loc_37FC0
		jmp	loc_38067

loc_37FC0:
		mov	eax, [si+0Eh]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_37FD2
		jmp	loc_38067

loc_37FD2:
		les	bx, word ptr [bp+var_4]
		mov	al, [bp+arg_4]
		mov	es:[bx+2Ah], al
		push	word ptr [bp+var_4+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_38046
		mov	eax, [si+0Ah]
		mov	[di+0Ah], eax
		mov	[bp+var_6], di
		les	bx, [di+0Ah]
		mov	ax, [bp+var_6]
		mov	es:[bx+6], ax
		mov	dword ptr [si+0Ah], 0
		les	bx, word ptr [bp+var_4]
		inc	word ptr es:[bx+4]
		push	si
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	dx, ax
		mov	bx, dx
		mov	eax, [bx]
		mov	[di+12h], eax
		mov	eax, [bx+4]
		mov	[di+16h], eax
		mov	eax, [bx+8]
		mov	[di+1Ah], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+7Ch]
		pop	cx
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_38046:
		mov	dx, [si+24h]
		or	dx, dx
		jz	short loc_38059
		push	si
		push	dx
		call	sub_58F84
		add	sp, 4
		jmp	short loc_38067

loc_38059:
		or	si, si
		jz	short loc_38067
		push	3
		push	si
sub_37FA9		endp
seg080		ends
