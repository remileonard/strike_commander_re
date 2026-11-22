ovr311		segment	para public 'OVERLAY' use16
		assume cs:ovr311
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-11-11. Numéro d'arme du WDAT (0 à 7) → masque d'un octet : 0→0, 1→1 (B100LB),
; 2→2 (B500LB), 3→10h (HVAR), 4→4 (B1000LB), 5→8 (MK-13), 6→20h (NAPALM), 7→40h (canons) ; au-
; delà de 7 : erreur C019h. Noms entre parenthèses : objets de PACIFIC.DAT qui portent ces
; numéros.
; ==============================================================================================
Weapon_IdToMask_ADEA0		proc far

var_2		= byte ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_2], 0
		mov	al, [bp+arg_0]
		cbw
		mov	bx, ax
		cmp	bx, 7
		ja	short loc_ADEDC
		shl	bx, 1
		jmp	cs:off_ADEEA[bx]	; switch jump

loc_ADEBC:
		mov	al, 0
		jmp	short loc_ADEE8

loc_ADEC0:
		mov	al, 1
		jmp	short loc_ADEE8

loc_ADEC4:
		mov	al, 2
		jmp	short loc_ADEE8

loc_ADEC8:
		mov	al, 4
		jmp	short loc_ADEE8

loc_ADECC:
		mov	al, 10h
		jmp	short loc_ADEE8

loc_ADED0:
		mov	al, 8
		jmp	short loc_ADEE8

loc_ADED4:
		mov	al, 20h
		jmp	short loc_ADEE8

loc_ADED8:
		mov	al, 40h
		jmp	short loc_ADEE8

loc_ADEDC:
		push	0C019h
		call	sub_1DDFE
		pop	cx
		mov	al, [bp+var_2]

loc_ADEE8:
		leave
		retf
Weapon_IdToMask_ADEA0		endp

; START OF FUNCTION CHUNK FOR Weapon_IdToMask_ADEA0
off_ADEEA	dw offset loc_ADEBC
		dw offset loc_ADEC0
		dw offset loc_ADEC4
		dw offset loc_ADECC
		dw offset loc_ADEC8
		dw offset loc_ADED0
		dw offset loc_ADED4
		dw offset loc_ADED8
; END OF FUNCTION CHUNK FOR Weapon_IdToMask_ADEA0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ADEFA		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 4
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx+4], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+8], eax
		mov	byte ptr es:[bx+0Ch], 0
		les	bx, [bp+arg_4]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+0Dh]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Dh], ax
		les	bx, [bp+arg_4]
		mov	al, es:[bx+12h]
		les	bx, [bp+arg_0]
		mov	es:[bx+12h], al
		leave
		retf
sub_ADEFA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ADF5F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	8
		push	ds
		push	offset aNONE
		mov	ax, [bp+arg_0]
		add	ax, 4
		push	[bp+arg_2]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ch], 0
		mov	dword ptr es:[bx], 0
		mov	word ptr es:[bx+0Dh], 0
		mov	word ptr es:[bx+10h], 0
		mov	byte ptr es:[bx+12h], 0
		pop	bp
		retf
sub_ADF5F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ADF9D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+10h], ax
		push	si
		mov	ax, [bp+arg_0]
		add	ax, 4
		push	[bp+arg_2]
		push	ax
		call	sub_294DB
		add	sp, 6
		mov	ax, [bp+arg_0]
		add	ax, 4
		push	[bp+arg_2]
		push	ax
		call	sub_3B1D
		add	sp, 4
		push	0
		mov	ax, [bp+arg_0]
		add	ax, 4
		push	[bp+arg_2]
		push	ax
		push	65D0h
		call	sub_742E8
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		mov	word ptr es:[bx+0Dh], 0
		mov	byte ptr es:[bx+12h], 0
		pop	si
		pop	bp
		retf
sub_ADF9D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AE006		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_AE02E
		push	1
		push	0
		push	2
		push	large 13h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_AE050

loc_AE02E:
		xor	eax, eax
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], eax
		mov	es:[bx+4], eax
		mov	es:[bx+0Ch], al
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_ADF9D
		add	sp, 6

loc_AE050:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_AE006		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AE058		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		les	bx, [bp+arg_4]
		mov	al, es:[bx+0Eh]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], al
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 2
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_14], eax
		mov	eax, es:[si+4]
		mov	[bp+var_10], eax
		mov	eax, es:[si+8]
		mov	[bp+var_C], eax
		mov	es, [bp+arg_2]
		mov	eax, [bp+var_14]
		mov	es:[bx+2], eax
		mov	eax, [bp+var_10]
		mov	es:[bx+6], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+0Ah], eax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+13h]
		les	bx, [bp+arg_0]
		mov	es:[bx+13h], ax
		les	bx, [bp+arg_4]
		mov	al, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx], al
		les	bx, [bp+arg_4]
		mov	al, es:[bx+15h]
		les	bx, [bp+arg_0]
		mov	es:[bx+15h], al
		les	bx, [bp+arg_4]
		mov	al, es:[bx+1]
		les	bx, [bp+arg_0]
		mov	es:[bx+1], al
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	es:[bx+23h], eax
		push	1
		push	0
		push	2
		push	large 10h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], dx
		mov	es:[bx+16h], ax
		xor	dx, dx
		jmp	short loc_AE134

loc_AE121:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16h]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	word ptr es:[bx], 0
		inc	dx

loc_AE134:
		cmp	dx, 8
		jl	short loc_AE121
		pop	si
		leave
		retf
sub_AE058		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_Helper_9E651 (sub_9E651 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle sub_9E731. Référencée par sub_9F1D0/9F434/9F760.
; ==============================================================================================
PlayerComponent_Helper_AE13C		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_4]
		or	ax, ax
		jz	short loc_AE153
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_AE22A
		add	sp, 6

loc_AE153:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0Eh], 0
		mov	dword ptr es:[bx+0Fh], 0
		mov	word ptr es:[bx+13h], 0
		pop	bp
		retf
PlayerComponent_Helper_AE13C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AE16C		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_Helper_AE13C
		add	sp, 6
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+23h], eax
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+15h], al
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], eax
		mov	al, [bp+arg_6]
		mov	es:[bx], al
		push	1
		push	0
		push	2
		push	large 10h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+18h], dx
		mov	es:[bx+16h], ax
		xor	dx, dx
		jmp	short loc_AE21A

loc_AE207:
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+16h]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	word ptr es:[bx], 0
		inc	dx

loc_AE21A:
		cmp	dx, 8
		jl	short loc_AE207
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+1], 0
		pop	si
		leave
		retf
sub_AE16C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AE22A		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+15h], 0
		jz	short loc_AE27C
		cmp	byte ptr es:[bx+15h], 4
		jz	short loc_AE27C
		mov	eax, es:[bx+16h]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_AE273

loc_AE24F:
		les	bx, word ptr [bp+var_4]
		cmp	word ptr es:[bx], 0
		jz	short loc_AE26E
		push	word ptr es:[bx]
		push	[bp+arg_4]
		call	sub_74144
		add	sp, 4
		les	bx, word ptr [bp+var_4]
		mov	word ptr es:[bx], 0

loc_AE26E:
		inc	si
		add	word ptr [bp+var_4], 2

loc_AE273:
		les	bx, [bp+arg_0]
		cmp	es:[bx+13h], si
		jg	short loc_AE24F

loc_AE27C:
		pop	si
		leave
		retf
sub_AE22A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AE27F		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	cx, [bp+arg_8]
		cmp	[bp+arg_4], 0
		jz	short loc_AE30D
		or	cx, cx
		jz	short loc_AE30D
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		xor	dx, dx
		jmp	short loc_AE300

loc_AE29F:
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_AE2B2
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_AE2B4

loc_AE2B2:
		mov	al, 0

loc_AE2B4:
		les	bx, [bp+arg_0]
		cmp	al, es:[bx+0Eh]
		jnz	short loc_AE2FB
		mov	eax, [bp+var_4]
		mov	es:[bx+0Fh], eax
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 4
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ah], eax
		les	bx, [bp+var_8]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Eh], eax
		mov	byte ptr es:[bx+22h], 0
		jmp	short loc_AE30D

loc_AE2FB:
		inc	dx
		add	word ptr [bp+var_4], 13h

loc_AE300:
		cmp	dx, cx
		jl	short loc_AE29F
		push	0C022h
		call	sub_1DDFE
		pop	cx

loc_AE30D:
		leave
		retf
sub_AE27F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AE30F		proc far

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
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Fh], 0
		jnz	short loc_AE325
		jmp	loc_AE50F

loc_AE325:
		les	bx, es:[bx+0Fh]
		cmp	dword ptr es:[bx], 0
		jnz	short loc_AE333
		jmp	loc_AE50F

loc_AE333:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+13h], 0
		jg	short loc_AE340
		jmp	loc_AE50F

loc_AE340:
		les	bx, es:[bx+0Fh]
		cmp	dword ptr es:[bx], 0
		jz	short loc_AE360
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_AE362

loc_AE360:
		mov	al, 1Ch

loc_AE362:
		cmp	al, 0Dh
		jnz	short loc_AE369
		jmp	loc_AE50F

loc_AE369:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Fh]
		les	bx, es:[bx]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	0
		push	ax
		push	dx
		call	Particle_PoolWait
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_AE3D5
		les	bx, word ptr [bp+var_8]
		mov	eax, es:[bx+27h]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+2Bh]
		sub	[bp+var_C], eax
		mov	eax, es:[bx+17h]
		mov	[bp+var_10], eax
		mov	eax, es:[bx+1Bh]
		sub	[bp+var_10], eax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_14], eax
		mov	eax, es:[bx+23h]
		sub	[bp+var_14], eax
		jmp	short loc_AE3DE

loc_AE3D5:
		push	0C01Ah
		call	sub_1DDFE
		pop	cx

loc_AE3DE:
		cmp	[bp+arg_4], 0
		jnz	short loc_AE3E7
		jmp	loc_AE50F

loc_AE3E7:
		xor	di, di
		jmp	loc_AE503

loc_AE3EC:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16h]
		mov	ax, di
		shl	ax, 1
		add	bx, ax
		cmp	word ptr es:[bx], 0
		jz	short loc_AE402
		jmp	loc_AE502

loc_AE402:
		push	1
		push	1
		mov	ax, [bp+arg_0]
		add	ax, 1Ah
		push	[bp+arg_2]
		push	ax
		push	65D0h
		call	Debris_LoadAndInstantiateAlt
		add	sp, 0Ah
		mov	si, ax
		or	si, si
		jnz	short loc_AE424
		jmp	loc_AE4F0

loc_AE424:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16h]
		mov	ax, di
		shl	ax, 1
		add	bx, ax
		mov	es:[bx], si
		push	68E2h
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 2
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	dx, [bp+var_18]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[si+12h], eax
		mov	eax, es:[bx+4]
		mov	[si+16h], eax
		mov	eax, es:[bx+8]
		mov	[si+1Ah], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		or	di, di
		jnz	short loc_AE484
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+13h], 1
		jz	short loc_AE4A1

loc_AE484:
		cmp	di, 2
		jz	short loc_AE48E
		cmp	di, 5
		jnz	short loc_AE4A1

loc_AE48E:
		mov	eax, [bp+var_C]
		shl	eax, 1
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		add	[bp+var_1C], eax

loc_AE4A1:
		mov	eax, [bp+var_1C]
		sub	[si+1Ah], eax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+13h], 1
		jle	short loc_AE4D5
		mov	ax, di
		and	ax, 3
		or	ax, ax
		jz	short loc_AE4C3
		cmp	ax, 1
		jz	short loc_AE4CD
		jmp	short loc_AE4D5

loc_AE4C3:
		mov	eax, [bp+var_10]
		sub	[si+12h], eax
		jmp	short loc_AE4D5

loc_AE4CD:
		mov	eax, [bp+var_10]
		add	[si+12h], eax

loc_AE4D5:
		cmp	di, 3
		jl	short loc_AE4E2
		mov	eax, [bp+var_14]
		add	[si+16h], eax

loc_AE4E2:
		push	si
		push	[bp+arg_4]
		call	sub_7413F
		add	sp, 4
		jmp	short loc_AE502

loc_AE4F0:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+16h]
		mov	ax, di
		shl	ax, 1
		add	bx, ax
		mov	word ptr es:[bx], 0

loc_AE502:
		inc	di

loc_AE503:
		les	bx, [bp+arg_0]
		cmp	es:[bx+13h], di
		jle	short loc_AE50F
		jmp	loc_AE3EC

loc_AE50F:
		pop	di
		pop	si
		leave
		retf
sub_AE30F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-11-11. (point d'emport, arme WPNS, quantité n) : rien si le point porte déjà
; une arme (masque +0Eh ≠ 0). Capacité selon le type HPTS du point (+15h) et le masque de
; l'arme : 0 et 4 = canon (40h), toute la quantité ; 1 = 10h ×1 ; 2 = 1 ×1 ; 3 = 2, 4, 8 ou
; 20h ×1 ; autre type : rien de défini. Charge min(n, capacité − déjà chargé) (+13h), pose
; masque (+0Eh), arme (+0Fh) et nom (+1Ah) ; rend le nombre chargé. Équivalent de
; WeaponSys_LoadStoresOnHardpoint_9EA2E de STRIKE.EXE.
; ==============================================================================================
WeaponSys_LoadStoresOnHardpoint_AE513		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_8]
		xor	di, di
		cmp	[bp+arg_4], 0
		jnz	short loc_AE52A
		jmp	loc_AE62B

loc_AE52A:
		les	bx, word ptr [bp+arg_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_AE53D
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_AE53F

loc_AE53D:
		mov	al, 0

loc_AE53F:
		mov	[bp+var_4], al
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0Eh], 0
		jz	short loc_AE54F
		jmp	loc_AE62B

loc_AE54F:
		mov	al, es:[bx+15h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_AE5C3
		shl	bx, 1
		jmp	cs:off_AE641[bx]	; switch jump

loc_AE563:
		mov	al, [bp+var_4]
		mov	ah, 0
		cmp	ax, 40h
		jz	short loc_AE56F
		jmp	short loc_AE5C1

loc_AE56F:
		mov	dx, si
		jmp	short loc_AE5C3
		jmp	short loc_AE5C1

loc_AE575:
		mov	al, [bp+var_4]
		mov	ah, 0
		cmp	ax, 10h
		jz	short loc_AE5BC
		jmp	short loc_AE5C1
		jmp	short loc_AE5BC
		jmp	short loc_AE5C1

loc_AE585:
		mov	al, [bp+var_4]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_AE5BC
		jmp	short loc_AE5C1
		jmp	short loc_AE5BC
		jmp	short loc_AE5C1

loc_AE595:
		mov	al, [bp+var_4]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	cx, 4
		mov	bx, offset word_AE631

loc_AE5A3:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_2]
		jz	short loc_AE5B2
		add	bx, 2
		loop	short loc_AE5A3
		jmp	short loc_AE5C1

loc_AE5B2:
		jmp	word ptr cs:[bx+8] ; switch jump
		jmp	short loc_AE5BC

loc_AE5B8:
		jmp	short loc_AE5BC

loc_AE5BA:
		jmp	short loc_AE5BC

loc_AE5BC:
		mov	dx, 1
		jmp	short loc_AE5C3

loc_AE5C1:
		xor	dx, dx

loc_AE5C3:
		les	bx, [bp+arg_0]
		mov	ax, si
		add	ax, es:[bx+13h]
		cmp	ax, dx
		jg	short loc_AE5D8
		add	es:[bx+13h], si
		mov	di, si
		jmp	short loc_AE5E7

loc_AE5D8:
		les	bx, [bp+arg_0]
		mov	ax, dx
		sub	ax, es:[bx+13h]
		mov	di, ax
		mov	es:[bx+13h], dx

loc_AE5E7:
		or	di, di
		jle	short loc_AE62B
		les	bx, [bp+arg_0]
		mov	al, [bp+var_4]
		mov	es:[bx+0Eh], al
		mov	eax, [bp+arg_4]
		mov	es:[bx+0Fh], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 4
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		push	8
		push	ax
		push	dx
		mov	ax, [bp+arg_0]
		add	ax, 1Ah
		push	[bp+arg_2]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+22h], 0

loc_AE62B:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
WeaponSys_LoadStoresOnHardpoint_AE513		endp

; START OF FUNCTION CHUNK FOR WeaponSys_LoadStoresOnHardpoint_AE513
word_AE631	dw 2
		dw 4
		dw 8
		dw 20h
off_AE639	dw offset loc_AE5BC
		dw offset loc_AE5BA
		dw offset loc_AE5B8
		dw offset loc_AE5BC
off_AE641	dw offset loc_AE563
		dw offset loc_AE575
		dw offset loc_AE585
		dw offset loc_AE595
		dw offset loc_AE563
; END OF FUNCTION CHUNK FOR WeaponSys_LoadStoresOnHardpoint_AE513

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AE64B		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	1
		push	0
		push	2
		push	large 56h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		or	ax, dx
		jz	short loc_AE69F
		les	bx, [bp+var_6]
		mov	word ptr es:[bx+0Eh], 0
		mov	word ptr es:[bx+10h], 0
		mov	word ptr es:[bx+12h], 0
		push	[bp+var_2]
		push	dx
		push	bx
		nop
		push	cs
		call	near ptr sub_AE7D0
		add	sp, 6
		mov	dx, [bp+var_4]
		mov	ax, [bp+var_6]
		jmp	short loc_AE6A5

loc_AE69F:
		mov	dx, [bp+var_4]
		mov	ax, [bp+var_6]

loc_AE6A5:
		les	bx, [bp+arg_0]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		leave
		retf
sub_AE64B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_DispatchPair_9EC4D (sub_9EC4D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine PlayerComponent_SetReferenceHelper_9EC8A et PlayerComponent_Helper_9ED43. Référencée
; via jmp depuis un stub VROOMM (sub_6C3C6) et par plusieurs fonctions du cluster.
; ==============================================================================================
PlayerComponent_DispatchPair_AE6B1		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+9], 0
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr sub_AE6EE
		add	sp, 4
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_AE7AC
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+3Ch], 4E20h
		mov	word ptr es:[bx+40h], 3Ch
		mov	byte ptr es:[bx+55h], 0
		pop	bp
		retf
PlayerComponent_DispatchPair_AE6B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AE6EE		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		xor	ax, ax
		mov	es:[bx+6], ax
		mov	es:[bx+4], ax
		mov	es:[bx+2], ax
		mov	es:[bx], ax
		mov	byte ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+0Dh], 0
		push	0
		mov	ax, [bp+arg_0]
		add	ax, 0Eh
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+14h], 0
		mov	dword ptr es:[bx+18h], 0
		mov	word ptr es:[bx+24h], 0
		mov	word ptr es:[bx+26h], 0
		xor	ax, ax
		mov	es:[bx+1Eh], ax
		mov	es:[bx+1Ch], ax
		xor	ax, ax
		mov	es:[bx+22h], ax
		mov	es:[bx+20h], ax
		mov	byte ptr es:[bx+42h], 0
		mov	byte ptr es:[bx+53h], 0
		mov	byte ptr es:[bx+54h], 0
		mov	dword ptr es:[bx+4Fh], 0
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	es:[bx+28h], eax
		push	0
		mov	ax, [bp+arg_0]
		add	ax, 12h
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Ch]
		mov	es:[bx+30h], eax
		leave
		retf
sub_AE6EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AE7AC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+2Ch], 0
		xor	ax, ax
		mov	es:[bx+38h], ax
		mov	es:[bx+36h], ax
		mov	es:[bx+34h], ax
		mov	byte ptr es:[bx+0Ch], 0
		pop	bp
		retf
sub_AE7AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AE7D0		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_DispatchPair_AE6B1
		add	sp, 4
		push	si
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr WeaponSys_LoadFormWEAP_AE98A
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AE82F
		push	0
		push	large 4C494657h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_AE82F
		mov	[bp+var_C], si
		push	[bp+var_C]
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_A]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr WeaponSys_LoadFromFile_AE9D4
		add	sp, 6

loc_AE82F:
		pop	si
		leave
		retf
sub_AE7D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AE832		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_4]
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+2Ch], 0
		jnz	short loc_AE84B
		jmp	loc_AE986

loc_AE84B:
		push	0
		push	large 534E5057h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_AE863
		jmp	loc_AE986

loc_AE863:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+14h], 0
		jz	short loc_AE88A
		push	0
		push	2
		mov	eax, es:[bx+14h]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_AE88A:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_AE6EE
		add	sp, 4
		mov	eax, [si+72h]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+24h], ax
		cmp	word ptr es:[bx+24h], 0
		jg	short loc_AE8B5
		jmp	loc_AE986

loc_AE8B5:
		push	1
		push	0
		push	2
		mov	ax, es:[bx+24h]
		inc	ax
		imul	ax, ax, 13h
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+16h], dx
		mov	es:[bx+14h], ax
		cmp	dword ptr es:[bx+14h], 0
		jnz	short loc_AE8EA
		jmp	loc_AE986

loc_AE8EA:
		mov	eax, es:[bx+14h]
		mov	es:[bx+18h], eax
		mov	[bp+var_8], eax
		xor	di, di
		jmp	short loc_AE91B

loc_AE8FC:
		push	si
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_ADF9D
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+9]
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+0Dh], ax
		inc	di
		add	word ptr [bp+var_8], 13h

loc_AE91B:
		les	bx, word ptr [bp+arg_0]
		cmp	es:[bx+24h], di
		jg	short loc_AE8FC
		inc	word ptr es:[bx+24h]
		mov	ax, es:[bx+9]
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+0Dh], ax
		mov	dword ptr es:[bx], 0
		push	ds
		push	offset aNONE
		mov	ax, word ptr [bp+var_8]
		add	ax, 4
		push	word ptr [bp+var_8+2]
		push	ax
		call	sub_38D6
		add	sp, 8
		les	bx, word ptr [bp+var_8]
		mov	byte ptr es:[bx+0Fh], 0
		mov	word ptr es:[bx+10h], 0
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+24h]
		dec	ax
		mov	es:[bx+6], ax
		mov	ax, es:[bx+6]
		mov	es:[bx+4], ax
		mov	es:[bx+2], ax
		mov	es:[bx], ax
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr WeaponSys_DistributeStores_AEC5A
		add	sp, 4

loc_AE986:
		pop	di
		pop	si
		leave
		retf
sub_AE832		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; WeaponSys_LoadFormWEAP_9EF74 (sub_9EF74 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-12.
; Ex-'PlayerComponent_LoadSequence'. Entre dans le FORM WEAP, puis
; WeaponSys_LoadInfoHptsDcoy_9F07F et WeaponSys_LoadWPNS_9EDD4, puis ressort. Renvoie 1 si le
; FORM existe.
; ==============================================================================================
WeaponSys_LoadFormWEAP_AE98A		proc far

var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 50414557h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_AE9CE
		push	si
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_AEA95
		add	sp, 6
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_AE832
		add	sp, 6
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_AE9CE:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
WeaponSys_LoadFormWEAP_AE98A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeaponSys_LoadFromFile_9EFBE (sub_9EFBE de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-12. Ex-'PlayerComponent_ConstructFromStream'. (système d'armes, nom) : ouvre
; OBJECTS\<nom>.IFF (Path_ResolveDataFile) et y lit le FORM WEAP
; (WeaponSys_LoadFormWEAP_9EF74) ; échec → erreur C01Bh. Utilisé par FORM WFIL et par le 3e
; nom d'un enregistrement PART (emport imposé par la mission,
; PartEntry_ResolveSpawnPositionAndActivate_51EDC).
; ==============================================================================================
WeaponSys_LoadFromFile_AE9D4		proc far

var_FA		= word ptr -0FAh
var_9D		= dword ptr -9Dh
var_99		= dword ptr -99h
var_95		= dword ptr -95h
var_80		= word ptr -80h
var_7E		= word ptr -7Eh
var_52		= word ptr -52h
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0FAh
		push	seg seg225
		push	0
		push	ds
		push	[bp+arg_4]
		push	ds
		push	offset aOBJECTS
		lea	ax, [bp+var_52]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		mov	[bp+var_1], 0
		lea	ax, [bp+var_FA]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_FA], 508h
		mov	[bp+var_99], 100h
		mov	[bp+var_9D], 0
		mov	[bp+var_FA], 520h
		mov	[bp+var_7E], 0
		xor	ax, ax
		mov	[bp+var_80], ax
		movsx	eax, ax
		mov	[bp+var_95], eax
		push	1
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_FA]
		push	ax
		mov	bx, [bp+var_FA]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jz	short loc_AEA61
		lea	ax, [bp+var_FA]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr WeaponSys_LoadFormWEAP_AE98A
		add	sp, 6
		mov	[bp+var_1], al

loc_AEA61:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AEA73
		push	0C01Bh
		call	sub_1DDFE
		pop	cx

loc_AEA73:
		mov	[bp+var_FA], 520h
		lea	ax, [bp+var_FA]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_FA]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		leave
		retf
WeaponSys_LoadFromFile_AE9D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AEA95		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AEAD6
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+3Ch], eax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+40h], ax

loc_AEAD6:
		push	0
		push	large 53545048h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_AEAEE
		jmp	loc_AEBA0

loc_AEAEE:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+2Ch], 0
		jz	short loc_AEB24
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr PlayerComponent_ReleaseHelperB_AF26E
		add	sp, 4
		push	0
		push	2
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_AEB24:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_AE7AC
		add	sp, 4
		mov	eax, [si+72h]
		mov	ebx, 0Dh
		cdq
		idiv	ebx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+34h], ax
		push	1
		push	0
		push	2
		mov	ax, es:[bx+34h]
		imul	ax, ax, 27h
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+2Eh], dx
		mov	es:[bx+2Ch], ax
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_AEB81
		mov	word ptr es:[bx+34h], 0

loc_AEB81:
		xor	di, di
		jmp	short loc_AEB97

loc_AEB85:
		push	di
		push	si
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_AE16C
		add	sp, 8
		inc	di
		add	word ptr [bp+var_8], 27h

loc_AEB97:
		les	bx, word ptr [bp+arg_0]
		cmp	es:[bx+34h], di
		jg	short loc_AEB85

loc_AEBA0:
		pop	di
		pop	si
		leave
		retf
sub_AEA95		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_HelperVariantA_9F1D0 (sub_9F1D0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle PlayerComponent_Helper_9E651. Référencée via jmp depuis un stub VROOMM (sub_6C3C1)
; et par sub_9F286.
; ==============================================================================================
PlayerComponent_HelperVariantA_AEBA4		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+2Ch], 0
		jz	short loc_AEBE3
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_AEBDA

loc_AEBC3:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	large [bp+var_4]
		push	cs
		call	near ptr PlayerComponent_Helper_AE13C
		add	sp, 6
		inc	si
		add	word ptr [bp+var_4], 27h

loc_AEBDA:
		les	bx, [bp+arg_0]
		cmp	es:[bx+34h], si
		jg	short loc_AEBC3

loc_AEBE3:
		pop	si
		leave
		retf
PlayerComponent_HelperVariantA_AEBA4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AEBE6		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_AEC14

loc_AEBFD:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_AE30F
		add	sp, 6
		inc	si
		add	word ptr [bp+var_4], 27h

loc_AEC14:
		les	bx, [bp+arg_0]
		cmp	es:[bx+34h], si
		jg	short loc_AEBFD
		pop	si
		leave
		retf
sub_AEBE6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AEC20		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_AEC4E

loc_AEC37:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_AE22A
		add	sp, 6
		inc	si
		add	word ptr [bp+var_4], 27h

loc_AEC4E:
		les	bx, [bp+arg_0]
		cmp	es:[bx+34h], si
		jg	short loc_AEC37
		pop	si
		leave
		retf
sub_AEC20		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-11-11. Répartit les armes WPNS (enregistrements de 13h octets, +14h, nombre
; +24h) sur les points d'emport (27h octets, +2Ch, nombre +34h). Canon (masque 40h) : le
; PREMIER canon de la liste va sur tous les points de type 0 (groupe 1 : +1 du point = 1, +1Eh
; compte, bit 1 de +12h de l'arme), les canons suivants sur les points de type 4 (groupe 2 :
; +1 = 2, +22h, bit 2), chacun avec toute sa quantité (WeaponSys_LoadStoresOnHardpoint_AE513).
; Autres armes : deux curseurs aux deux bouts de la liste des points ; même type aux deux
; bouts : moitié du reste (sar 1) à chacun, les deux avancent ; sinon tout le reste au
; premier, seul lui avance ; reste non chargé gardé en +10h. Enfin masse d'emport (somme
; nombre × masse, méthode +10h de l'objet) en +28h. Équivalent de
; PlayerComponent_OrchestrateComplex_9F286 de STRIKE.EXE.
; ==============================================================================================
WeaponSys_DistributeStores_AEC5A		proc far

var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	[bp+var_2], 0
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+1Eh], 0
		mov	word ptr es:[bx+22h], 0
		mov	word ptr es:[bx+3Ah], 0
		cmp	dword ptr es:[bx+14h], 0
		jnz	short loc_AEC86
		jmp	loc_AEE3F

loc_AEC86:
		cmp	dword ptr es:[bx+2Ch], 0
		jnz	short loc_AEC91
		jmp	loc_AEE3F

loc_AEC91:
		mov	eax, es:[bx+14h]
		mov	[bp+var_E], eax
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr PlayerComponent_HelperVariantA_AEBA4
		add	sp, 4
		xor	di, di
		jmp	loc_AEE33

loc_AECAA:
		les	bx, word ptr [bp+var_E]
		mov	byte ptr es:[bx+12h], 0
		cmp	dword ptr es:[bx], 0
		jz	short loc_AECC2
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_AECC4

loc_AECC2:
		mov	al, 0

loc_AECC4:
		cmp	al, 40h
		jz	short loc_AECCB
		jmp	loc_AED7F

loc_AECCB:
		xor	si, si
		jmp	loc_AED64

loc_AECD0:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2Ch]
		mov	ax, si
		imul	ax, ax, 27h
		add	bx, ax
		mov	al, es:[bx+15h]
		cmp	al, [bp+var_2]
		jnz	short loc_AED63
		les	bx, word ptr [bp+var_E]
		push	word ptr es:[bx+10h]
		push	word ptr [bp+var_E+2]
		push	bx
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2Ch]
		mov	dx, si
		imul	dx, dx, 27h
		add	ax, dx
		push	word ptr es:[bx+2Eh]
		push	ax
		push	cs
		call	near ptr WeaponSys_LoadStoresOnHardpoint_AE513
		add	sp, 0Ah
		mov	[bp+var_18], ax
		or	ax, ax
		jz	short loc_AED63
		cmp	[bp+var_2], 0
		jnz	short loc_AED41
		les	bx, [bp+arg_0]
		add	es:[bx+3Ah], ax
		les	bx, es:[bx+2Ch]
		mov	ax, si
		imul	ax, ax, 27h
		add	bx, ax
		mov	byte ptr es:[bx+1], 1
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+1Eh]
		les	bx, word ptr [bp+var_E]
		or	byte ptr es:[bx+12h], 1
		jmp	short loc_AED63

loc_AED41:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2Ch]
		mov	ax, si
		imul	ax, ax, 27h
		add	bx, ax
		mov	byte ptr es:[bx+1], 2
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+22h]
		les	bx, word ptr [bp+var_E]
		or	byte ptr es:[bx+12h], 2

loc_AED63:
		inc	si

loc_AED64:
		les	bx, [bp+arg_0]
		cmp	es:[bx+34h], si
		jle	short loc_AED70
		jmp	loc_AECD0

loc_AED70:
		mov	[bp+var_2], 4
		mov	ax, es:[bx+1Eh]
		mov	es:[bx+1Ch], ax
		jmp	loc_AEE2E

loc_AED7F:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+22h]
		mov	es:[bx+20h], ax
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_12], eax
		mov	ax, es:[bx+2Eh]
		mov	dx, es:[bx+2Ch]
		mov	bx, es:[bx+34h]
		dec	bx
		imul	bx, bx, 27h
		add	dx, bx
		mov	word ptr [bp+var_16+2], ax
		mov	word ptr [bp+var_16], dx
		les	bx, word ptr [bp+var_E]
		mov	si, es:[bx+10h]
		jmp	short loc_AEE1B

loc_AEDB4:
		mov	eax, [bp+var_12]
		cmp	eax, [bp+var_16]
		jz	short loc_AEE05
		les	bx, word ptr [bp+var_12]
		mov	al, es:[bx+15h]
		les	bx, word ptr [bp+var_16]
		cmp	al, es:[bx+15h]
		jnz	short loc_AEE05
		mov	ax, si
		sar	ax, 1
		mov	[bp+var_18], ax
		push	ax
		push	large [bp+var_E]
		push	large [bp+var_12]
		push	cs
		call	near ptr WeaponSys_LoadStoresOnHardpoint_AE513
		add	sp, 0Ah
		sub	si, ax
		add	word ptr [bp+var_12], 27h
		push	[bp+var_18]
		push	large [bp+var_E]
		push	large [bp+var_16]
		push	cs
		call	near ptr WeaponSys_LoadStoresOnHardpoint_AE513
		add	sp, 0Ah
		sub	si, ax
		sub	word ptr [bp+var_16], 27h
		jmp	short loc_AEE1B

loc_AEE05:
		push	si
		push	large [bp+var_E]
		push	large [bp+var_12]
		push	cs
		call	near ptr WeaponSys_LoadStoresOnHardpoint_AE513
		add	sp, 0Ah
		sub	si, ax
		add	word ptr [bp+var_12], 27h

loc_AEE1B:
		or	si, si
		jle	short loc_AEE27
		mov	ax, word ptr [bp+var_12]
		cmp	ax, word ptr [bp+var_16]
		jbe	short loc_AEDB4

loc_AEE27:
		les	bx, word ptr [bp+var_E]
		mov	es:[bx+10h], si

loc_AEE2E:
		inc	di
		add	word ptr [bp+var_E], 13h

loc_AEE33:
		les	bx, [bp+arg_0]
		cmp	es:[bx+24h], di
		jle	short loc_AEE3F
		jmp	loc_AECAA

loc_AEE3F:
		mov	[bp+var_6], 0
		xor	si, si
		jmp	short loc_AEEC1

loc_AEE4B:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2Ch]
		mov	ax, si
		imul	ax, ax, 27h
		add	bx, ax
		cmp	word ptr es:[bx+13h], 0
		jz	short loc_AEEC0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2Ch]
		mov	ax, si
		imul	ax, ax, 27h
		add	bx, ax
		les	bx, es:[bx+0Fh]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	word ptr [bp+var_E+2], ax
		mov	word ptr [bp+var_E], dx
		cmp	[bp+var_E], 0
		jz	short loc_AEEC0
		les	bx, word ptr [bp+var_E]
		mov	di, es:[bx+49h]
		or	di, di
		jz	short loc_AEEC0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+10h]
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2Ch]
		mov	dx, si
		imul	dx, dx, 27h
		add	bx, dx
		movsx	edx, word ptr es:[bx+13h]
		imul	eax, edx
		mov	[bp+var_12], eax
		shl	eax, 8
		add	[bp+var_6], eax

loc_AEEC0:
		inc	si

loc_AEEC1:
		les	bx, [bp+arg_0]
		cmp	es:[bx+34h], si
		jg	short loc_AEE4B
		mov	[bp+var_A], 0
		mov	eax, [bp+var_A]
		mov	es:[bx+28h], eax
		pop	di
		pop	si
		leave
		retf
WeaponSys_DistributeStores_AEC5A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AEEDF		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+14h], 0
		jnz	short loc_AEEF5
		jmp	loc_AEF7A

loc_AEEF5:
		cmp	dword ptr es:[bx+2Ch], 0
		jz	short loc_AEF7A
		mov	eax, es:[bx+14h]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_AEF71

loc_AEF0A:
		les	bx, word ptr [bp+var_4]
		mov	word ptr es:[bx+10h], 0
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_8], eax
		xor	di, di
		jmp	short loc_AEF63

loc_AEF23:
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_AEF36
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_AEF38

loc_AEF36:
		mov	al, 0

loc_AEF38:
		les	bx, word ptr [bp+var_8]
		cmp	al, es:[bx+0Eh]
		jnz	short loc_AEF5E
		mov	ax, es:[bx+13h]
		les	bx, word ptr [bp+var_4]
		add	es:[bx+10h], ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		push	large [bp+var_8]
		push	cs
		call	near ptr PlayerComponent_Helper_AE13C
		add	sp, 6

loc_AEF5E:
		inc	di
		add	word ptr [bp+var_8], 27h

loc_AEF63:
		les	bx, [bp+arg_0]
		cmp	es:[bx+34h], di
		jg	short loc_AEF23
		inc	si
		add	word ptr [bp+var_4], 13h

loc_AEF71:
		les	bx, [bp+arg_0]
		cmp	es:[bx+24h], si
		jg	short loc_AEF0A

loc_AEF7A:
		pop	di
		pop	si
		leave
		retf
sub_AEEDF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_HelperVariantE_9F4D3 (sub_9F4D3 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle PlayerComponent_DispatchPair_9EC4D. Référencée via jmp depuis un stub VROOMM
; (sub_6C3CB).
; ==============================================================================================
PlayerComponent_HelperVariantE_AEF7E		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_DispatchPair_AE6B1
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+9], ax
		pop	bp
		retf
PlayerComponent_HelperVariantE_AEF7E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AEF98		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+24h]
		les	bx, [bp+arg_0]
		mov	es:[bx+24h], ax
		cmp	word ptr es:[bx+24h], 0
		jz	short loc_AF021
		push	1
		push	0
		push	2
		mov	ax, es:[bx+24h]
		imul	ax, ax, 13h
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+16h], dx
		mov	es:[bx+14h], ax
		mov	eax, es:[bx+14h]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_4]
		mov	eax, es:[bx+14h]
		mov	[bp+var_8], eax
		xor	si, si
		jmp	short loc_AF018

loc_AEFF6:
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_ADEFA
		add	sp, 8
		les	bx, word ptr [bp+var_4]
		mov	ax, [bp+arg_8]
		mov	es:[bx+0Dh], ax
		inc	si
		add	word ptr [bp+var_4], 13h
		add	word ptr [bp+var_8], 13h

loc_AF018:
		les	bx, [bp+arg_0]
		cmp	es:[bx+24h], si
		jg	short loc_AEFF6

loc_AF021:
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+34h]
		les	bx, [bp+arg_0]
		mov	es:[bx+34h], ax
		cmp	word ptr es:[bx+34h], 0
		jz	short loc_AF0B0
		push	1
		push	0
		push	2
		mov	ax, es:[bx+34h]
		imul	ax, ax, 27h
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+2Eh], dx
		mov	es:[bx+2Ch], ax
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_4]
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_8], eax
		xor	si, si
		jmp	short loc_AF0A7

loc_AF078:
		push	large [bp+var_8]
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_AE058
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+24h]
		push	large es:[bx+14h]
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_AE27F
		add	sp, 0Ah
		inc	si
		add	word ptr [bp+var_4], 27h
		add	word ptr [bp+var_8], 27h

loc_AF0A7:
		les	bx, [bp+arg_0]
		cmp	es:[bx+34h], si
		jg	short loc_AF078

loc_AF0B0:
		push	0
		mov	ax, [bp+arg_0]
		add	ax, 0Eh
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+24h], 0
		jz	short loc_AF0D9
		mov	ax, es:[bx+24h]
		dec	ax
		mov	es:[bx+6], ax
		jmp	short loc_AF0E2

loc_AF0D9:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+6], 0

loc_AF0E2:
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+38h]
		les	bx, [bp+arg_0]
		mov	es:[bx+38h], ax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+36h]
		les	bx, [bp+arg_0]
		mov	es:[bx+36h], ax
		les	bx, [bp+arg_4]
		mov	eax, es:[bx+3Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+3Ch], eax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+40h]
		les	bx, [bp+arg_0]
		mov	es:[bx+40h], ax
		les	bx, [bp+arg_4]
		mov	eax, es:[bx+28h]
		les	bx, [bp+arg_0]
		mov	es:[bx+28h], eax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+3Ah]
		les	bx, [bp+arg_0]
		mov	es:[bx+3Ah], ax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+1Eh]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Eh], ax
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+22h]
		les	bx, [bp+arg_0]
		mov	es:[bx+22h], ax
		mov	ax, es:[bx+1Eh]
		mov	es:[bx+1Ch], ax
		mov	ax, es:[bx+22h]
		mov	es:[bx+20h], ax
		mov	ax, es:[bx+6]
		mov	es:[bx+4], ax
		mov	es:[bx+2], ax
		mov	es:[bx], ax
		mov	eax, es:[bx+2Ch]
		mov	es:[bx+30h], eax
		pop	si
		leave
		retf
sub_AEF98		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AF182		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	1
		push	0
		push	2
		push	large 56h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_AF1CC
		les	bx, [bp+var_4]
		mov	word ptr es:[bx+0Eh], 0
		mov	word ptr es:[bx+10h], 0
		mov	word ptr es:[bx+12h], 0
		push	dx
		push	bx
		push	cs
		call	near ptr PlayerComponent_DispatchPair_AE6B1
		add	sp, 4
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short loc_AF1D2

loc_AF1CC:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_AF1D2:
		leave
		retf
sub_AF182		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_ReleaseAndReload_9F6EA (sub_9F6EA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFreeWrapper_5C6F3, PlayerComponent_DispatchPair_9EC4D,
; PlayerComponent_FullReleaseAndLoad_9F4ED. Référencée via jmp depuis un stub VROOMM
; (sub_6C3F8).
; ==============================================================================================
PlayerComponent_ReleaseAndReload_AF1D4		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	large 56h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		or	ax, dx
		jz	short loc_AF241
		les	bx, word ptr [bp+var_8]
		mov	word ptr es:[bx+0Eh], 0
		mov	word ptr es:[bx+10h], 0
		mov	word ptr es:[bx+12h], 0
		push	dx
		push	bx
		push	cs
		call	near ptr PlayerComponent_DispatchPair_AE6B1
		add	sp, 4
		push	si
		push	large [bp+var_4]
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_AEF98
		add	sp, 0Ah
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+9], si
		mov	dx, word ptr [bp+var_8+2]
		mov	ax, word ptr [bp+var_8]
		jmp	short loc_AF247

loc_AF241:
		mov	dx, word ptr [bp+var_8+2]
		mov	ax, word ptr [bp+var_8]

loc_AF247:
		pop	si
		leave
		retf
PlayerComponent_ReleaseAndReload_AF1D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_HelperVariantF_9F760 (sub_9F760 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle PlayerComponent_Helper_9E651. Référencée via jmp depuis un stub VROOMM (sub_6C416)
; et par sub_9F784.
; ==============================================================================================
PlayerComponent_HelperVariantF_AF24A		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+9]
		mov	ax, es:[bx+2Ch]
		mov	dx, [bp+arg_4]
		imul	dx, dx, 27h
		add	ax, dx
		push	word ptr es:[bx+2Eh]
		push	ax
		push	cs
		call	near ptr PlayerComponent_Helper_AE13C
		add	sp, 6
		pop	bp
		retf
PlayerComponent_HelperVariantF_AF24A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_ReleaseHelperB_9F82C (sub_9F82C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle Memory_TypedFree_5C7B6. Référencée via jmp depuis un stub VROOMM (sub_6C411) et par
; PlayerComponent_LoadMultiField_9F07F.
; ==============================================================================================
PlayerComponent_ReleaseHelperB_AF26E		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_4], eax
		xor	si, si
		jmp	short loc_AF2A9

loc_AF285:
		push	0
		push	2
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+16h]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		inc	si
		add	word ptr [bp+var_4], 27h

loc_AF2A9:
		les	bx, [bp+arg_0]
		cmp	es:[bx+34h], si
		jg	short loc_AF285
		pop	si
		leave
		retf
PlayerComponent_ReleaseHelperB_AF26E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 12 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_ReleaseFull_9F873 (sub_9F873 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 87 lignes, NON DÉTAILLÉE — combine PlayerComponent_ReleaseHelperB_9F82C,
; Memory_TypedFree_5C7B6 (×3), sub_3A432 (×3). Référencée via jmp depuis un stub VROOMM
; (sub_6C40C).
; ==============================================================================================
PlayerComponent_ReleaseFull_AF2B5		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_AF2C9
		jmp	loc_AF369

loc_AF2C9:
		push	large [bp+arg_0]
		push	cs
		call	near ptr PlayerComponent_ReleaseHelperB_AF26E
		add	sp, 4
		push	0
		push	2
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+2Ch]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+14h]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	ax, word ptr [bp+arg_0]
		add	ax, 12h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 10h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Eh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_394FD
		add	sp, 4
		test	si, 1
		jz	short loc_AF369
		mov	eax, [bp+arg_0]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_AF369:
		pop	si
		leave
		retf
PlayerComponent_ReleaseFull_AF2B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AF36C		proc far

var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	[bp+var_1], 0
		xor	si, si
		jmp	short loc_AF3D7

loc_AF37B:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, si
		imul	bx, bx, 13h
		add	dx, bx
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		les	bx, [bp+var_6]
		cmp	dword ptr es:[bx], 0
		jz	short loc_AF3A6
		les	bx, es:[bx]
		mov	al, es:[bx+5Eh]
		jmp	short loc_AF3A8

loc_AF3A6:
		mov	al, 0

loc_AF3A8:
		mov	[bp+var_8], al
		and	al, 40h
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AF3D6
		mov	al, [bp+var_8]
		push	ax
		push	large [bp+arg_0]
		call	WeaponStation_FindFullestOfMask_3E19B
		add	sp, 6
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_AF3D6
		mov	[bp+var_1], 1
		jmp	short loc_AF3E0

loc_AF3D6:
		inc	si

loc_AF3D7:
		les	bx, word ptr [bp+arg_0]
		cmp	es:[bx+24h], si
		jg	short loc_AF37B

loc_AF3E0:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_AF36C		endp
ovr311		ends
