seg101		segment	para public 'CODE' use16
		assume cs:seg101
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 75h, 4, 0B0h, 0, 0EBh, 2

loc_3FF86:
		db 0B0h, 1, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Proximity_TestPoints (sub_42D8C de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 153L, LUE 2026-09-25.
; (objet, point, direction, portee, cone) : d = |objet+0x12 - point| ; faux si d <= 0 (exclut
; la reference elle-meme) ou si portee (entier, shl 8) < d ; vrai si byte_7235D (seulement
; remis a 0 dans le code lu) ; sinon vrai si dot(normalise(objet - point), direction) >=
; Math_CosDeg_5483F(cone). Le cone est donc tracking_cone en DEGRES, demi-angle (AIM-9J 40,
; AIM-9M 45).
; ==============================================================================================
Proximity_TestPoints		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_3FF9D
		jmp	loc_40079

loc_3FF9D:
		mov	si, dx
		add	si, 12h
		mov	di, [bp+arg_2]
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_26], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_22], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_1E], eax
		push	eax
		push	large [bp+var_22]
		push	large [bp+var_26]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jle	short loc_3FFF1
		mov	ax, 1
		jmp	short loc_3FFF3

loc_3FFF1:
		xor	ax, ax

loc_3FFF3:
		or	al, al
		jnz	short loc_3FFFA
		jmp	loc_40079

loc_3FFFA:
		mov	eax, [bp+arg_6]
		mov	[bp+var_C], eax
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jl	short loc_40011
		mov	ax, 1
		jmp	short loc_40013

loc_40011:
		xor	ax, ax

loc_40013:
		or	al, al
		jz	short loc_40079
		cmp	byte_7CB10, 0
		jz	short loc_40022

loc_4001E:
		mov	al, 1
		jmp	short loc_4007B

loc_40022:
		lea	ax, word ptr [bp+var_26]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		push	[bp+arg_4]
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Math_DotProduct3D_56E96
		add	sp, 8
		mov	ax, [bp+arg_A]
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_1A], eax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_14]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_14]
		jl	short loc_40073
		mov	ax, 1
		jmp	short loc_40075

loc_40073:
		xor	ax, ax

loc_40075:
		or	al, al
		jnz	short loc_4001E

loc_40079:
		mov	al, 0

loc_4007B:
		pop	di
		pop	si
		leave
		retf
Proximity_TestPoints		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4007F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_4008E
		mov	ax, si
		jmp	short loc_40098

loc_4008E:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_40098:
		or	ax, ax
		jz	short loc_400B7
		mov	eax, dword_79CEC
		mov	[si], eax
		mov	eax, dword_79CF0
		mov	[si+4], eax
		mov	eax, dword_79CF4
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_400B9

loc_400B7:
		mov	ax, si

loc_400B9:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_4007F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_400C2		proc far

arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_6]
		or	si, si
		jz	short loc_400EF
		push	0
		push	large 0
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	[bp+arg_4]
		push	cs
		call	near ptr Proximity_TestPoints
		add	sp, 0Ch
		jmp	short loc_400F1

loc_400EF:
		mov	al, 0

loc_400F1:
		pop	si
		pop	bp
		retf
sub_400C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Targeting_ReticleWindowTest (sub_42EFC de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,69L — teste la
; proximité (sub_42EC3) puis vérifie que l'angle projeté (vtable[0x7C]) est dans une fenêtre
; de ±0x19 (25) autour d'une valeur cible : test 'cible dans le réticule du viseur' (fenêtre
; angulaire de verrouillage).
; ==============================================================================================
Targeting_ReticleWindowTest		proc far

var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	al, [bp+arg_8]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	[bp+var_4], 0
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_40164
		push	di
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_400C2
		add	sp, 8
		or	al, al
		jz	short loc_40164
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx+80h]
		add	sp, 4
		mov	ah, 0
		mov	dx, [bp+var_2]
		add	dx, 19h
		cmp	ax, dx
		jg	short loc_40164
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx+80h]
		add	sp, 4
		mov	ah, 0
		mov	dx, [bp+var_2]
		add	dx, 0FFE7h
		cmp	ax, dx
		jl	short loc_40164
		mov	[bp+var_4], si

loc_40164:
		mov	ax, [bp+var_4]
		pop	di
		pop	si
		leave
		retf
Targeting_ReticleWindowTest		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4016B		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	dx, [bp+arg_4]
		mov	bx, [bp+arg_6]
		or	dx, dx
		jnz	short loc_40180
		jmp	loc_40207

loc_40180:
		or	bx, bx
		jnz	short loc_40187
		jmp	loc_40207

loc_40187:
		mov	si, dx
		add	si, 12h
		mov	di, bx
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_20], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_1C], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_18], eax
		push	eax
		push	large [bp+var_1C]
		push	large [bp+var_20]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+5Fh]
		mov	[bp+var_10], eax
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	eax, es:[bx+5Fh]
		mov	[bp+var_14], eax
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jle	short loc_401FD
		mov	ax, 1
		jmp	short loc_401FF

loc_401FD:
		xor	ax, ax

loc_401FF:
		or	al, al
		jz	short loc_40207
		mov	al, 1
		jmp	short loc_40209

loc_40207:
		mov	al, 0

loc_40209:
		pop	di
		pop	si
		leave
		retf
sub_4016B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4020D		proc far
		push	bp
		mov	bp, sp
		xor	ax, ax
		pop	bp
		retf
sub_4020D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40214		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_2], 0
		mov	ax, [bp+var_2]
		leave
		retf
sub_40214		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40224		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+5Ch]
		pop	si
		pop	bp
		retf
sub_40224		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40231		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_40231		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4023B		proc far
		push	bp
		mov	bp, sp
		mov	al, 7
		pop	bp
		retf
sub_4023B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40242		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_4028A
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1EDCh
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_3C42E
		add	sp, 6
		test	si, 1
		jz	short loc_4028A
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_4028A:
		pop	si
		leave
		retf
sub_40242		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Targeting_InitWithFlags (sub_4338E de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,19L — attache
; (sub_3DC3D) puis positionne 2 flags (+0x59=1, +4 bit5) : initialisation d'un composant de
; verrouillage avec flags spécifiques.
; ==============================================================================================
Targeting_InitWithFlags		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	sub_3C4B2
		add	sp, 6
		mov	byte ptr [si+5Eh], 1
		or	byte ptr [si+2], 20h
		pop	si
		pop	bp
		retf
Targeting_InitWithFlags		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_402AC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 7
		pop	bp
		retf
sub_402AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_402B6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_402F9
		mov	word ptr [si], 23F6h
		mov	ax, si
		add	ax, 5Ch
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 5Ah
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	sub_3C510
		add	sp, 4
		test	di, 1
sub_402B6		endp
seg101		ends
