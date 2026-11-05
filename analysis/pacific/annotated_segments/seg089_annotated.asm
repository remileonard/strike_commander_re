seg089		segment	para public 'CODE' use16
		assume cs:seg089
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0

loc_37D91:
		db 8Bh, 0C7h, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37D97		proc far

var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= dword ptr -3Eh
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1B		= byte ptr -1Bh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 58h
		push	si
		push	di
		mov	di, [bp+arg_6]
		mov	si, [bp+arg_8]
		mov	[bp+var_1], 0FFh
		or	si, si
		jnz	short loc_37DB0
		jmp	loc_38022

loc_37DB0:
		mov	[bp+var_40], 16D5h
		mov	[bp+var_3E], 0
		mov	[bp+var_40], 16E9h
		cmp	[bp+arg_A], 0
		jnz	short loc_37DF9
		push	23h
		push	35BCh
		mov	eax, dword_78D81
		mov	[bp+var_A], eax
		shl	eax, 8
		mov	[bp+var_E], eax
		lea	ax, word ptr [bp+var_E]
		push	ax
		push	ss
		lea	ax, [bp+var_40]
		push	ax
		nop
		push	cs
		call	near ptr sub_38570
		add	sp, 0Ah
		lea	ax, [bp+var_40]
		mov	word ptr [bp+var_6+2], ss
		mov	word ptr [bp+var_6], ax
		jmp	short loc_37E04

loc_37DF9:
		les	bx, [bp+arg_C]
		mov	eax, es:[bx]
		mov	[bp+var_6], eax

loc_37E04:
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0Bh
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		les	dx, [bp+var_12]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[bp+var_4C], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_48], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_44], eax
		push	[bp+arg_4]
		push	65D6h
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		push	[bp+arg_4]
		lea	ax, word ptr [bp+var_4C]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, [bp+var_6]
		mov	[bp+var_16], eax
		mov	[bp+var_1A], 0
		jmp	loc_38018

loc_37E62:
		les	bx, word ptr [bp+var_6]
		mov	al, es:[bx+6]
		mov	ah, 0
		mov	dx, seg seg227
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+120h]
		mov	[bp+var_1B], al
		mov	al, [bp+var_1]
		cmp	al, [bp+var_1B]
		jz	short loc_37E85
		jmp	loc_37FF1

loc_37E85:
		mov	eax, dword_7CDC2
		sub	eax, [di]
		mov	dword_7CD4E, eax
		mov	eax, dword_7CDC6
		sub	eax, [di+4]
		mov	dword_7CD52, eax
		mov	eax, dword_7CDCA
		sub	eax, [di+8]
		mov	dword_7CD56, eax
		les	bx, word ptr [bp+var_6]
		mov	eax, es:[bx+0Bh]
		mov	[bp+var_58], eax
		mov	eax, es:[bx+0Fh]
		mov	[bp+var_54], eax
		mov	eax, es:[bx+13h]
		mov	[bp+var_50], eax
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	65FAh
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [bp+var_58]
		or	eax, [bp+var_54]
		or	eax, [bp+var_50]
		jnz	short loc_37EF1
		mov	ax, 1
		jmp	short loc_37EF3

loc_37EF1:
		xor	ax, ax

loc_37EF3:
		or	al, al
		jz	short loc_37F1D
		mov	eax, dword_7CD4E
		sub	eax, [bp+var_4C]
		mov	[bp+var_58], eax
		mov	eax, dword_7CD52
		sub	eax, [bp+var_48]
		mov	[bp+var_54], eax
		mov	eax, dword_7CD56
		sub	eax, [bp+var_44]
		mov	[bp+var_50], eax
		jmp	short loc_37F5C

loc_37F1D:
		push	65FAh
		lea	ax, word ptr [bp+var_58]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, dword_7CD4E
		add	[bp+var_58], eax
		mov	eax, dword_7CD52
		add	[bp+var_54], eax
		mov	eax, dword_7CD56
		add	[bp+var_50], eax
		mov	eax, [bp+var_4C]
		sub	[bp+var_58], eax
		mov	eax, [bp+var_48]
		sub	[bp+var_54], eax
		mov	eax, [bp+var_44]
		sub	[bp+var_50], eax

loc_37F5C:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+7]
		les	bx, word ptr [bp+var_6]
		add	eax, es:[bx+7]
		mov	[bp+var_20], eax
		push	large [bp+var_50]
		push	large [bp+var_54]
		push	large [bp+var_58]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		cmp	eax, [bp+var_20]
		jg	short loc_37FF1
		mov	byte_77DF0, 0
		push	large [bp+var_6]
		push	large [bp+arg_0]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 8
		or	al, al
		jz	short loc_37FF1
		cmp	[bp+var_1], 0FFh
		jz	short loc_37FD4
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+6]
		mov	[si+4], al
		les	bx, word ptr [bp+var_6]
		mov	al, es:[bx+6]
		mov	[si+5], al
		mov	al, 1
		jmp	short loc_38024

loc_37FD4:
		les	bx, word ptr [bp+var_6]
		mov	al, es:[bx+6]
		mov	[bp+var_1], al
		mov	eax, es:[bx+2]
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_6], eax
		jmp	short loc_38018

loc_37FF1:
		les	bx, word ptr [bp+var_6]
		mov	eax, es:[bx+2]
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 0
		jnz	short loc_38018
		mov	eax, [bp+var_1A]
		mov	[bp+var_6], eax
		mov	[bp+var_1A], 0
		mov	[bp+var_1], 0FFh

loc_38018:
		cmp	[bp+var_6], 0
		jz	short loc_38022
		jmp	loc_37E62

loc_38022:
		mov	al, 0

loc_38024:
		pop	di
		pop	si
		leave
		retf
sub_37D97		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38028		proc far

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
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_21		= dword ptr -21h
var_1D		= dword ptr -1Dh
var_19		= dword ptr -19h
var_15		= dword ptr -15h
var_11		= dword ptr -11h
var_D		= dword ptr -0Dh
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 98h
		push	si
		mov	[bp+var_2C], 16D5h
		mov	[bp+var_2A], 0
		mov	[bp+var_2C], 16C1h
		mov	ax, word ptr [bp+arg_8+2]
		mov	dx, word ptr [bp+arg_8]
		add	dx, 5
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_38], eax
		mov	eax, es:[si+4]
		mov	[bp+var_34], eax
		mov	eax, es:[si+8]
		mov	[bp+var_30], eax
		mov	ax, word ptr [bp+arg_8+2]
		mov	dx, word ptr [bp+arg_8]
		add	dx, 5
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	[bp+var_50], eax
		mov	eax, es:[si+4]
		mov	[bp+var_4C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_48], eax
		push	large [bp+arg_8]
		call	sub_50324
		add	sp, 4
		mov	si, ax
		mov	eax, [bp+var_50]
		sub	eax, [si]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_4C]
		sub	eax, [si+4]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_48]
		sub	eax, [si+8]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_3C], eax
		mov	si, [bp+arg_6]
		mov	eax, [bp+var_44]
		sub	eax, [si]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_40]
		sub	eax, [si+4]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_3C]
		sub	eax, [si+8]
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_80]
		mov	dword_7CD4E, eax
		mov	eax, [bp+var_7C]
		mov	dword_7CD52, eax
		mov	eax, [bp+var_78]
		mov	dword_7CD56, eax
		push	[bp+arg_4]
		push	65D6h
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [bp+var_38]
		sub	eax, [bp+var_44]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_34]
		sub	eax, [bp+var_40]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_30]
		sub	eax, [bp+var_3C]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_8C]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_15], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_11], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_D], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_21], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_1D], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_19], eax
		mov	byte_77DF0, 0
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		push	large [bp+arg_0]
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 8
		pop	si
		leave
		retf
sub_38028		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Particle_PoolWait (sub_3914B de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,83L — parcourt un
; compteur décroissant appelant potentiellement une résolution (cx itérations) :
; recherche/attente sur un pool d'objets (particules ou débris) avec limite.
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
		jmp	short loc_38216

loc_38206:
		mov	ax, cx
		dec	cx
		or	ax, ax
		jnz	short loc_38216
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	loc_38296

loc_38216:
		cmp	[bp+var_4], 0
		jnz	short loc_3822F
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		mov	es:[bx+8], eax
		jmp	short loc_3822F

loc_3822F:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jnz	short loc_38245
		mov	eax, es:[bx]
		mov	es:[bx+0Ch], eax
		jmp	short loc_38269

loc_38245:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Ch]
		mov	es:[bx+8], eax
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx

loc_38269:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jz	short loc_38281
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_4], eax
		mov	al, 1
		jmp	short loc_3828B

loc_38281:
		mov	[bp+var_4], 0
		mov	al, 0

loc_3828B:
		or	al, al
		jz	short loc_38292
		jmp	loc_38206

loc_38292:
		xor	dx, dx
		xor	ax, ax

loc_38296:
		leave
		retf
Particle_PoolWait		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Particle_ListFreeAll (sub_391F0 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,49L — parcourt une
; liste chaînée en libérant chaque nœud (sub_5C7B6) : libération complète d'une liste chaînée
; de particules/effets.
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
		jmp	short loc_382D2

loc_382A7:
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	eax, [bp+var_8]

loc_382D2:
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_382A7
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
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Effect_NotifyAndResetList (sub_39251 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,75L — parcourt
; une liste appelant vtable[0x10] sur chaque élément, réinitialise deux champs si liste vide :
; notification en masse + reset conditionnel d'une liste d'effets.
; ==============================================================================================
Effect_NotifyAndResetList		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_4], 0
		jmp	short loc_3831C

loc_38309:
		push	[bp+arg_4]
		push	large [bp+var_4]
		les	bx, word ptr [bp+var_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_3831C:
		cmp	[bp+var_4], 0
		jnz	short loc_38335
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		mov	es:[bx+8], eax
		jmp	short loc_38335

loc_38335:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jnz	short loc_3834B
		mov	eax, es:[bx]
		mov	es:[bx+0Ch], eax
		jmp	short loc_3836F

loc_3834B:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Ch]
		mov	es:[bx+8], eax
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx

loc_3836F:
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jz	short loc_38387
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_4], eax
		mov	al, 1
		jmp	short loc_38391

loc_38387:
		mov	[bp+var_4], 0
		mov	al, 0

loc_38391:
		or	al, al
		jz	short loc_38398
		jmp	loc_38309

loc_38398:
		leave
		retf
Effect_NotifyAndResetList		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3839A		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_4]
		mov	es:[bx+6], al
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	es:[bx+7], eax
		xor	eax, eax
		mov	es:[bx+13h], eax
		mov	es:[bx+0Fh], eax
		mov	es:[bx+0Bh], eax
		leave
		retf
sub_3839A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_383CF		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_383FC
		mov	al, byte_77DF0
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_77DF0, al
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		jmp	short loc_383FE

loc_383FC:
		mov	al, 0

loc_383FE:
		pop	bp
		retf
sub_383CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38400		proc far

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
		jnz	short loc_38411
		jmp	loc_38533

loc_38411:
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 17h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_38], eax
		mov	eax, es:[si+4]
		mov	[bp+var_34], eax
		mov	eax, es:[si+8]
		mov	[bp+var_30], eax
		cmp	byte_77DF0, 0
		jz	short loc_38498
		mov	eax, dword_7CD4E
		neg	eax
		mov	[bp+var_44], eax
		mov	eax, dword_7CD52
		neg	eax
		mov	[bp+var_40], eax
		mov	eax, dword_7CD56
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
		call	sub_578DF
		add	sp, 8
		mov	eax, [bp+var_C]
		jmp	short loc_384B0

loc_38498:
		push	661Eh
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_578DF
		add	sp, 8
		mov	eax, [bp+var_10]

loc_384B0:
		mov	[bp+var_8], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 7
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		push	large dword_7CD56
		push	large dword_7CD52
		push	large dword_7CD4E
		call	sub_5A065
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
		call	sub_566A3
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_24]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		cmp	eax, [bp+var_14]
		jge	short loc_38529
		mov	ax, 1
		jmp	short loc_3852B

loc_38529:
		xor	ax, ax

loc_3852B:
		or	al, al
		jz	short loc_38533
		mov	al, 1
		jmp	short loc_38535

loc_38533:
		mov	al, 0

loc_38535:
		pop	si
		leave
		retf
sub_38400		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38538		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_38565
		mov	al, byte_77DF0
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_77DF0, al
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		jmp	short loc_38567

loc_38565:
		mov	al, 0

loc_38567:
		pop	bp
		retf
sub_38538		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38569		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_38569		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38570		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		les	bx, [bp+arg_0]
		mov	es:[bx+7], eax
		mov	si, [bp+arg_6]
		mov	eax, [si]
		mov	es:[bx+0Bh], eax
		mov	eax, [si+4]
		mov	es:[bx+0Fh], eax
		mov	eax, [si+8]
		mov	es:[bx+13h], eax
		mov	al, [bp+arg_8]
		mov	es:[bx+6], al
		pop	si
		pop	bp
		retf
sub_38570		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_385A9		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_385D6
		mov	al, byte_77DF0
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_77DF0, al
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		jmp	short loc_385D8

loc_385D6:
		mov	al, 0

loc_385D8:
		pop	bp
		retf
sub_385A9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_385DA		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_385DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_385E1		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_3860E
		mov	al, byte_77DF0
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_77DF0, al
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		jmp	short loc_38610

loc_3860E:
		mov	al, 0

loc_38610:
		pop	bp
		retf
sub_385E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38612		proc far

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
		jnz	short loc_38623
		jmp	loc_3870B

loc_38623:
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0Bh
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_10], eax
		mov	eax, es:[si+4]
		mov	[bp+var_C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_8], eax
		cmp	byte_77DF0, 0
		jz	short loc_38682
		push	65FAh
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, [bp+var_10]
		add	dword_7CD4E, eax
		mov	eax, [bp+var_C]
		add	dword_7CD52, eax
		mov	eax, [bp+var_8]
		add	dword_7CD56, eax
		jmp	short loc_386E8

loc_38682:
		push	65D6h
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, [bp+var_10]
		sub	eax, dword_7CD4E
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_C]
		sub	eax, dword_7CD52
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		sub	eax, dword_7CD56
		mov	[bp+var_14], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_28]
		mov	dword_7CD4E, eax
		mov	eax, [bp+var_24]
		mov	dword_7CD52, eax
		mov	eax, [bp+var_20]
		mov	dword_7CD56, eax

loc_386E8:
		mov	al, byte_77DF0
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_77DF0, al
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		jmp	short loc_3870D

loc_3870B:
		mov	al, 0

loc_3870D:
		pop	si
		leave
		retf
sub_38612		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38710		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_3873D
		mov	al, byte_77DF0
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_77DF0, al
		push	large [bp+arg_0]
		push	large [bp+arg_4]
		les	bx, word ptr [bp+arg_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 8
		jmp	short loc_3873F

loc_3873D:
		mov	al, 0

loc_3873F:
		pop	bp
		retf
sub_38710		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38741		proc far

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
		jnz	short loc_38752
		jmp	loc_38881

loc_38752:
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+0Bh]
		mov	[bp+var_28], eax
		mov	eax, es:[bx+0Fh]
		mov	[bp+var_24], eax
		mov	eax, es:[bx+13h]
		mov	[bp+var_20], eax
		cmp	byte_77DF0, 0
		jz	short loc_387A3
		push	65D6h
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, dword_7CD4E
		sub	[bp+var_28], eax
		mov	eax, dword_7CD52
		sub	[bp+var_24], eax
		mov	eax, dword_7CD56
		sub	[bp+var_20], eax
		push	65FAh
		jmp	short loc_387CD

loc_387A3:
		push	65FAh
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, dword_7CD4E
		add	[bp+var_28], eax
		mov	eax, dword_7CD52
		add	[bp+var_24], eax
		mov	eax, dword_7CD56
		add	[bp+var_20], eax
		push	65D6h

loc_387CD:
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Bh]
		mov	[bp+var_4], eax
		mov	eax, es:[bx+17h]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+23h]
		mov	[bp+var_10], eax
		mov	eax, es:[bx+27h]
		mov	[bp+var_14], eax
		mov	eax, es:[bx+2Bh]
		mov	[bp+var_18], eax
		les	bx, word ptr [bp+arg_4]
		mov	eax, es:[bx+7]
		mov	[bp+var_1C], eax
		lea	si, word ptr [bp+var_28]
		mov	eax, [si]
		sub	eax, [bp+var_1C]
		cmp	eax, [bp+var_8]
		jg	short loc_38881
		mov	eax, [si]
		add	eax, [bp+var_1C]
		cmp	eax, [bp+var_4]
		jl	short loc_38881
		mov	eax, [bp+var_24]
		mov	[si], eax
		mov	eax, [si]
		sub	eax, [bp+var_1C]
		cmp	eax, [bp+var_C]
		jg	short loc_38881
		mov	eax, [si]
		add	eax, [bp+var_1C]
		cmp	eax, [bp+var_10]
		jl	short loc_38881
		mov	eax, [bp+var_20]
		mov	[si], eax
		mov	eax, [si]
		sub	eax, [bp+var_1C]
		cmp	eax, [bp+var_14]
		jg	short loc_38881
		mov	eax, [si]
		add	eax, [bp+var_1C]
		cmp	eax, [bp+var_18]
		jl	short loc_38881
		mov	al, 1
		jmp	short loc_38883

loc_38881:
		mov	al, 0

loc_38883:
		pop	si
		leave
		retf
sub_38741		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_38886		proc far

var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	[bp+var_1], 0
		cmp	[bp+arg_4], 0
		jz	short loc_388E5
		mov	eax, [bp+arg_4]
		mov	[bp+var_6], eax
		push	large [bp+var_6]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Effect_GridProjectCorners
		add	sp, 8
		or	al, al
		jz	short loc_388B7
		mov	[bp+var_1], 1

loc_388B7:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_388E5
		mov	al, byte_77DF0
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_77DF0, al
		push	large [bp+arg_0]
		push	large [bp+var_6]
		nop
		push	cs
		call	near ptr Effect_GridProjectCorners
		add	sp, 8
		or	al, al
		jz	short loc_388E5
		mov	[bp+var_1], 1

loc_388E5:
		mov	al, [bp+var_1]
		leave
		retf
sub_38886		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_388EA		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		cmp	[bp+arg_4], 0
		jz	short loc_38947
		xor	eax, eax
		mov	dword_7CD62, eax
		mov	dword_7CD5E, eax
		mov	dword_7CD5A, eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 17h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	dword_7CD66, eax
		mov	eax, es:[si+4]
		mov	dword_7CD6A, eax
		mov	eax, es:[si+8]
		mov	dword_7CD6E, eax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Effect_RenderVolumetric
		add	sp, 4
		or	al, al
		jz	short loc_38947
		mov	al, 1
		jmp	short loc_38949

loc_38947:
		mov	al, 0

loc_38949:
		pop	si
		leave
		retf
sub_388EA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Effect_BBoxClipTest (sub_157C1 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à Effect_BBoxClipTest (sub_398CB de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,47L — calcule un
; code de sortie combiné (Cohen-Sutherland, 3 axes) pour une bounding box vs un point : test
; de clipping bounding-box pour le rendu de débris/particules.
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
		mov	eax, es:[di+17h]
		sub	eax, [si]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si]
		sub	eax, es:[di+1Bh]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, es:[di+1Fh]
		sub	eax, [si+4]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si+4]
		sub	eax, es:[di+23h]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, es:[di+27h]
		sub	eax, [si+8]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si+8]
		sub	eax, es:[di+2Bh]
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
; Reprise de STRIKE.EXE : même suite d'instructions, 21 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Effect_GridProjectCorners (sub_39933 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,237L — itère une
; grille (offsets +0x1F/+0x27/+0x2F/+0x33) en projetant les coins vers des globals partagés
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
		mov	eax, es:[bx+27h]
		mov	[bp+var_4], eax
		mov	eax, es:[bx+2Bh]
		mov	[bp+var_10], eax
		xor	si, si
		jmp	loc_38A58

loc_389D6:
		mov	ax, si
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+17h]
		mov	[bp+var_18], eax
		mov	[bp+var_C], eax
		xor	di, di
		jmp	short loc_38A52

loc_389F1:
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_14], eax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_C]
		mov	dword_7CD5A, eax
		mov	eax, [bp+var_8]
		mov	dword_7CD5E, eax
		mov	eax, [bp+var_4]
		mov	dword_7CD62, eax
		mov	eax, [bp+var_18]
		mov	dword_7CD66, eax
		mov	eax, [bp+var_14]
		mov	dword_7CD6A, eax
		mov	eax, [bp+var_10]
		mov	dword_7CD6E, eax
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Debug_ToggleWireframeMode
		add	sp, 8
		or	al, al
		jz	short loc_38A51

loc_38A4C:
		mov	al, 1
		jmp	loc_38BA6

loc_38A51:
		inc	di

loc_38A52:
		cmp	di, 2
		jl	short loc_389F1
		inc	si

loc_38A58:
		cmp	si, 2
		jge	short loc_38A60
		jmp	loc_389D6

loc_38A60:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+23h]
		mov	[bp+var_14], eax
		xor	si, si
		jmp	loc_38AFA

loc_38A7A:
		mov	ax, si
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+17h]
		mov	[bp+var_18], eax
		mov	[bp+var_C], eax
		xor	di, di
		jmp	short loc_38AF4

loc_38A95:
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+27h]
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		mov	dword_7CD5A, eax
		mov	eax, [bp+var_8]
		mov	dword_7CD5E, eax
		mov	eax, [bp+var_4]
		mov	dword_7CD62, eax
		mov	eax, [bp+var_18]
		mov	dword_7CD66, eax
		mov	eax, [bp+var_14]
		mov	dword_7CD6A, eax
		mov	eax, [bp+var_10]
		mov	dword_7CD6E, eax
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Debug_ToggleWireframeMode
		add	sp, 8
		or	al, al
		jz	short loc_38AF3
		jmp	loc_38A4C

loc_38AF3:
		inc	di

loc_38AF4:
		cmp	di, 2
		jl	short loc_38A95
		inc	si

loc_38AFA:
		cmp	si, 2
		jge	short loc_38B02
		jmp	loc_38A7A

loc_38B02:
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+17h]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+1Bh]
		mov	[bp+var_18], eax
		xor	si, si
		jmp	loc_38B9C

loc_38B1C:
		mov	ax, si
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_14], eax
		mov	[bp+var_8], eax
		xor	di, di
		jmp	short loc_38B96

loc_38B37:
		mov	ax, di
		shl	ax, 2
		les	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+27h]
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		mov	dword_7CD5A, eax
		mov	eax, [bp+var_8]
		mov	dword_7CD5E, eax
		mov	eax, [bp+var_4]
		mov	dword_7CD62, eax
		mov	eax, [bp+var_18]
		mov	dword_7CD66, eax
		mov	eax, [bp+var_14]
		mov	dword_7CD6A, eax
		mov	eax, [bp+var_10]
		mov	dword_7CD6E, eax
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Debug_ToggleWireframeMode
		add	sp, 8
		or	al, al
		jz	short loc_38B95
		jmp	loc_38A4C

loc_38B95:
		inc	di

loc_38B96:
		cmp	di, 2
		jl	short loc_38B37
		inc	si

loc_38B9C:
		cmp	si, 2
		jge	short loc_38BA4
		jmp	loc_38B1C

loc_38BA4:
		mov	al, 0

loc_38BA6:
		pop	di
		pop	si
		leave
		retf
Effect_GridProjectCorners		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 16 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Effect_RenderVolumetric (sub_39B29 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,589L — grosse
; fonction du cluster effets/débris (buffer local 0x1A0) appelée par sub_3A1C6 : candidat pour
; le rendu détaillé d'un effet visuel complexe (explosion/fumée volumétrique), à approfondir.
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
		cmp	byte_77DF0, 0
		jz	short loc_38C09
		mov	eax, dword_7CD4E
		sub	dword_7CD5A, eax
		mov	eax, dword_7CD52
		sub	dword_7CD5E, eax
		mov	eax, dword_7CD56
		sub	dword_7CD62, eax
		mov	eax, dword_7CD4E
		sub	dword_7CD66, eax
		mov	eax, dword_7CD52
		sub	dword_7CD6A, eax
		mov	eax, dword_7CD56
		sub	dword_7CD6E, eax
		push	65FAh
		push	662Ah
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		push	65FAh
		jmp	short loc_38C50

loc_38C09:
		mov	eax, dword_7CD4E
		add	dword_7CD5A, eax
		mov	eax, dword_7CD52
		add	dword_7CD5E, eax
		mov	eax, dword_7CD56
		add	dword_7CD62, eax
		mov	eax, dword_7CD4E
		add	dword_7CD66, eax
		mov	eax, dword_7CD52
		add	dword_7CD6A, eax
		mov	eax, dword_7CD56
		add	dword_7CD6E, eax
		push	65D6h
		push	662Ah
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		push	65D6h

loc_38C50:
		push	6636h
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+1Bh]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+17h]
		mov	[bp+var_10], eax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_14], eax
		mov	eax, es:[bx+23h]
		mov	[bp+var_18], eax
		mov	eax, es:[bx+27h]
		mov	[bp+var_1C], eax
		mov	eax, es:[bx+2Bh]
		mov	[bp+var_20], eax
		jmp	loc_39236

loc_38C97:
		push	662Ah
		push	large [bp+arg_0]
		push	cs
		call	near ptr Effect_BBoxClipTest
		add	sp, 6
		mov	[bp+var_1], al
		push	6636h
		push	large [bp+arg_0]
		push	cs
		call	near ptr Effect_BBoxClipTest
		add	sp, 6
		mov	bl, al
		mov	al, [bp+var_1]
		cbw
		or	ax, ax
		jz	short loc_38CC7
		mov	al, bl
		cbw
		or	ax, ax
		jnz	short loc_38CD2

loc_38CC7:
		mov	[bp+var_2], 1
		mov	[bp+var_3], 1
		jmp	loc_39236

loc_38CD2:
		test	[bp+var_1], bl
		jz	short loc_38CE2
		mov	[bp+var_2], 1
		mov	[bp+var_3], 0
		jmp	loc_39236

loc_38CE2:
		test	[bp+var_1], 20h
		jnz	short loc_38CEB
		jmp	loc_38DB4

loc_38CEB:
		mov	eax, [bp+var_10]
		sub	eax, dword_7CD5A
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	[bp+var_8], eax
		mov	eax, dword_7CD66
		sub	eax, dword_7CD5A
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
		mov	dword_7CD5A, eax
		mov	eax, dword_7CD6A
		sub	eax, dword_7CD5E
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_38]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	eax, dword_7CD5E
		add	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	dword_7CD5E, eax
		mov	eax, dword_7CD6E
		sub	eax, dword_7CD62
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	eax, dword_7CD62
		add	eax, [bp+var_58]
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		jmp	loc_39232

loc_38DB4:
		test	[bp+var_1], 10h
		jnz	short loc_38DBD
		jmp	loc_38E91

loc_38DBD:
		mov	eax, [bp+var_C]
		sub	eax, dword_7CD5A
		mov	[bp+var_64], eax
		mov	[bp+var_68], eax
		mov	[bp+var_8], eax
		mov	eax, dword_7CD66
		sub	eax, dword_7CD5A
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
		mov	dword_7CD5A, eax
		mov	eax, dword_7CD6A
		sub	eax, dword_7CD5E
		mov	[bp+var_74], eax
		mov	[bp+var_78], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_78]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_80], eax
		mov	eax, dword_7CD5E
		add	eax, [bp+var_80]
		mov	[bp+var_84], eax
		mov	[bp+var_88], eax
		mov	dword_7CD5E, eax
		mov	eax, dword_7CD6E
		sub	eax, dword_7CD62
		mov	[bp+var_8C], eax
		mov	[bp+var_90], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_90]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_98], eax
		mov	eax, dword_7CD62
		add	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		mov	[bp+var_A0], eax
		jmp	loc_39232

loc_38E91:
		test	[bp+var_1], 8
		jnz	short loc_38E9A
		jmp	loc_38F7A

loc_38E9A:
		mov	eax, [bp+var_14]
		sub	eax, dword_7CD5E
		mov	[bp+var_A4], eax
		mov	[bp+var_A8], eax
		mov	[bp+var_8], eax
		mov	eax, dword_7CD6A
		sub	eax, dword_7CD5E
		mov	[bp+var_AC], eax
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_B0]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_7CD66
		sub	eax, dword_7CD5A
		mov	[bp+var_B4], eax
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_B8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_C0], eax
		mov	eax, dword_7CD5A
		add	eax, [bp+var_C0]
		mov	[bp+var_C4], eax
		mov	[bp+var_C8], eax
		mov	dword_7CD5A, eax
		mov	eax, [bp+var_14]
		mov	dword_7CD5E, eax
		mov	eax, dword_7CD6E
		sub	eax, dword_7CD62
		mov	[bp+var_CC], eax
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_D0]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_D8], eax
		mov	eax, dword_7CD62
		add	eax, [bp+var_D8]
		mov	[bp+var_DC], eax
		mov	[bp+var_E0], eax
		jmp	loc_39232

loc_38F7A:
		test	[bp+var_1], 4
		jnz	short loc_38F83
		jmp	loc_39063

loc_38F83:
		mov	eax, [bp+var_18]
		sub	eax, dword_7CD5E
		mov	[bp+var_E4], eax
		mov	[bp+var_E8], eax
		mov	[bp+var_8], eax
		mov	eax, dword_7CD6A
		sub	eax, dword_7CD5E
		mov	[bp+var_EC], eax
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_F0]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_7CD66
		sub	eax, dword_7CD5A
		mov	[bp+var_F4], eax
		mov	[bp+var_F8], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_F8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_FC], eax
		mov	eax, [bp+var_FC]
		mov	[bp+var_100], eax
		mov	eax, dword_7CD5A
		add	eax, [bp+var_100]
		mov	[bp+var_104], eax
		mov	[bp+var_108], eax
		mov	dword_7CD5A, eax
		mov	eax, [bp+var_18]
		mov	dword_7CD5E, eax
		mov	eax, dword_7CD6E
		sub	eax, dword_7CD62
		mov	[bp+var_10C], eax
		mov	[bp+var_110], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_110]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_114], eax
		mov	eax, [bp+var_114]
		mov	[bp+var_118], eax
		mov	eax, dword_7CD62
		add	eax, [bp+var_118]
		mov	[bp+var_11C], eax
		mov	[bp+var_120], eax
		jmp	loc_39232

loc_39063:
		test	[bp+var_1], 2
		jnz	short loc_3906C
		jmp	loc_3914C

loc_3906C:
		mov	eax, [bp+var_1C]
		sub	eax, dword_7CD62
		mov	[bp+var_124], eax
		mov	[bp+var_128], eax
		mov	[bp+var_8], eax
		mov	eax, dword_7CD6E
		sub	eax, dword_7CD62
		mov	[bp+var_12C], eax
		mov	[bp+var_130], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_130]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_7CD66
		sub	eax, dword_7CD5A
		mov	[bp+var_134], eax
		mov	[bp+var_138], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_138]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_13C], eax
		mov	eax, [bp+var_13C]
		mov	[bp+var_140], eax
		mov	eax, dword_7CD5A
		add	eax, [bp+var_140]
		mov	[bp+var_144], eax
		mov	[bp+var_148], eax
		mov	dword_7CD5A, eax
		mov	eax, dword_7CD6A
		sub	eax, dword_7CD5E
		mov	[bp+var_14C], eax
		mov	[bp+var_150], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_150]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_154], eax
		mov	eax, [bp+var_154]
		mov	[bp+var_158], eax
		mov	eax, dword_7CD5E
		add	eax, [bp+var_158]
		mov	[bp+var_15C], eax
		mov	[bp+var_160], eax
		mov	dword_7CD5E, eax
		mov	eax, [bp+var_1C]
		jmp	loc_39232

loc_3914C:
		test	[bp+var_1], 1
		jnz	short loc_39155
		jmp	loc_39236

loc_39155:
		mov	eax, [bp+var_20]
		sub	eax, dword_7CD62
		mov	[bp+var_164], eax
		mov	[bp+var_168], eax
		mov	[bp+var_8], eax
		mov	eax, dword_7CD6E
		sub	eax, dword_7CD62
		mov	[bp+var_16C], eax
		mov	[bp+var_170], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_170]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_7CD66
		sub	eax, dword_7CD5A
		mov	[bp+var_174], eax
		mov	[bp+var_178], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_178]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_17C], eax
		mov	eax, [bp+var_17C]
		mov	[bp+var_180], eax
		mov	eax, dword_7CD5A
		add	eax, [bp+var_180]
		mov	[bp+var_184], eax
		mov	[bp+var_188], eax
		mov	dword_7CD5A, eax
		mov	eax, dword_7CD6A
		sub	eax, dword_7CD5E
		mov	[bp+var_18C], eax
		mov	[bp+var_190], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_190]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_194], eax
		mov	eax, [bp+var_194]
		mov	[bp+var_198], eax
		mov	eax, dword_7CD5E
		add	eax, [bp+var_198]
		mov	[bp+var_19C], eax
		mov	[bp+var_1A0], eax
		mov	dword_7CD5E, eax
		mov	eax, [bp+var_20]

loc_39232:
		mov	dword_7CD62, eax

loc_39236:
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_39242
		jmp	loc_38C97

loc_39242:
		mov	al, [bp+var_3]
		leave
		retf
Effect_RenderVolumetric		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Debug_ToggleWireframeMode (sub_3A1C6 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,50L — bascule un
; mode de rendu global (byte_6EC34) entre deux réglages sonores/visuels ('WF'/'XX', bip 'Wv'),
; appelle sub_39B29 : bascule debug entre deux modes de rendu (wireframe/solide) avec retour
; sonore.
; ==============================================================================================
Debug_ToggleWireframeMode		proc far

arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_392A1
		cmp	byte_77DF0, 0
		jz	short loc_3926B
		push	65FAh
		push	662Ah
		call	sub_5A629
		add	sp, 4
		push	65FAh
		jmp	short loc_3927C

loc_3926B:
		push	65D6h
		push	662Ah
		call	sub_5A629
		add	sp, 4
		push	65D6h

loc_3927C:
		push	6636h
		call	sub_5A629
		add	sp, 4
		mov	al, byte_77DF0
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_77DF0, al
		push	large [bp+arg_4]
		push	cs
		call	near ptr Effect_RenderVolumetric
		add	sp, 4
		jmp	short loc_392A3

loc_392A1:
		mov	al, 0

loc_392A3:
		pop	bp
		retf
Debug_ToggleWireframeMode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_392A5		proc far
		push	bp
		mov	bp, sp
		push	65D6h
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		push	65FAh
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		pop	bp
		retf
sub_392A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_392BC		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], eax
		mov	eax, [si+4]
		mov	es:[bx+1Bh], eax
		mov	eax, [si+8]
		mov	es:[bx+1Fh], eax
sub_392BC		endp
seg089		ends
