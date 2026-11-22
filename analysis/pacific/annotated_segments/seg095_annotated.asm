seg095		segment	para public 'CODE' use16
		assume cs:seg095
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 74h, 7, 56h, 9Ah, 0B2h, 3, 0, 0, 59h

loc_3C639:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C63D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 5
		pop	bp
		retf
sub_3C63D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_ResolvePositionVelocity_3DDC4 (sub_3DDC4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,58L
; — calcule la position caméra (sub_3D9FB) puis récupère la vitesse de la cible secondaire
; (+0x55, vtable[8]) : résolution position+vitesse pour la caméra externe orientée cible.
; ==============================================================================================
Camera_ResolvePositionVelocity_3C647		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_3C266
		pop	cx
		or	al, al
		jz	short loc_3C69A
		cmp	dword ptr [si+5Ah], 0
		jz	short loc_3C675
		push	large [si+5Ah]
		les	bx, [si+5Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_3C679

loc_3C675:
		xor	dx, dx
		xor	ax, ax

loc_3C679:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		cmp	dword ptr [si+5Fh], 0
		jz	short loc_3C696
		push	dx
		push	ax
		push	large [si+5Fh]
		call	sub_3E640
		add	sp, 8
		jmp	short loc_3C696

loc_3C696:
		mov	al, 1
		jmp	short loc_3C69C

loc_3C69A:
		mov	al, 0

loc_3C69C:
		pop	si
		leave
		retf
Camera_ResolvePositionVelocity_3C647		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C69F		proc far
		push	bp
		mov	bp, sp
		mov	al, 5
		pop	bp
		retf
sub_3C69F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_DestructCompoundA (sub_3DE23 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,42L —
; destructeur (type 0x24DC) libérant une référence far (+0x4A, sub_6C40C) puis appelant le
; destructeur parent (sub_3DCDB) : destructeur composé de caméra avec libération de ressource
; additionnelle.
; ==============================================================================================
Camera_DestructCompoundA		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_3C6FD
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1E7Ch
		push	3
		push	large es:[bx+5Dh]
		call	sub_74557
		add	sp, 6
		push	0
		push	large [bp+arg_0]
		call	Camera_DestructTypeC
		add	sp, 6
		test	si, 1
		jz	short loc_3C6FD
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_3C6FD:
		pop	si
		leave
		retf
Camera_DestructCompoundA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C700		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3C700		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Camera_InitAndGetHandle
; (sub_3DE85 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,22L — initialise (sub_3DD55) puis retourne l'identité (sub_3DE7D) :
; constructeur/initialisation avec retour de handle.
; ==============================================================================================
Camera_InitAndGetHandle		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	Camera_InitWithSecondaryTarget
		add	sp, 6
		push	si
		push	cs
		call	near ptr sub_3C700
		pop	cx
		pop	si
		pop	bp
		retf
Camera_InitAndGetHandle		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C725		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3C75E
		mov	word ptr [si], 217Ch
		push	3
		push	large [si+5Fh]
		call	sub_74557
		add	sp, 6
		push	0
		push	si
		call	sub_3C5F4
		add	sp, 4
		test	di, 1
		jz	short loc_3C75E
		push	si
		call	sub_3B2
		pop	cx

loc_3C75E:
		pop	di
		pop	si
sub_3C725		endp
seg095		ends
