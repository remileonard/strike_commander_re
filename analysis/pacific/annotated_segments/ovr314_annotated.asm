ovr314		segment	para public 'OVERLAY' use16
		assume cs:ovr314
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AFA50		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 8
		pop	bp
		retf
sub_AFA50		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AFA5A		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+5Eh], 0
		jz	short loc_AFA78
		and	byte ptr [si+2], 0FDh
		mov	byte ptr [si+5Eh], 0

loc_AFA73:
		mov	al, 1
		jmp	loc_AFB30

loc_AFA78:
		or	byte ptr [si+2], 2
		cmp	word ptr [si+26h], 0
		jz	short loc_AFA87
		mov	ax, 1
		jmp	short loc_AFA89

loc_AFA87:
		xor	ax, ax

loc_AFA89:
		or	al, al
		jnz	short loc_AFA73
		mov	ax, si
		add	ax, 5Fh
		push	ax
		call	sub_5083D
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AFAA2
		jmp	loc_AFB29

loc_AFAA2:
		push	si
		call	sub_3C21D
		pop	cx
		mov	[bp+var_1], al
		cmp	word ptr [si+5Ah], 0
		jz	short loc_AFB2D
		cmp	[bp+var_1], 0
		jz	short loc_AFB2D
		mov	di, [si+5Ah]
		add	di, 12h
		mov	dx, si
		add	dx, 12h
		mov	eax, [di]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_18], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_14], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_10], eax
		push	eax
		push	large [bp+var_14]
		push	large [bp+var_18]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	[bp+var_6], eax
		les	bx, [si+0Eh]
		mov	ax, es:[bx+6Ch]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		shl	eax, 8
		cmp	eax, [bp+var_6]
		jle	short loc_AFB23
		mov	ax, 1
		jmp	short loc_AFB25

loc_AFB23:
		xor	ax, ax

loc_AFB25:
		or	al, al
		jz	short loc_AFB2D

loc_AFB29:
		mov	al, 0
		jmp	short loc_AFB30

loc_AFB2D:
		mov	al, [bp+var_1]

loc_AFB30:
		pop	di
		pop	si
		leave
		retf
sub_AFA5A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AFB34		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		call	sub_36F5C
		add	sp, 4
		mov	di, ax
		les	bx, [si+0Eh]
		mov	ax, es:[bx+1Dh]
		mov	dx, es:[bx+1Bh]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		cmp	[bp+var_4], 0
		jz	short loc_AFBDA
		les	bx, word ptr [bp+var_4]
		mov	ax, es:[bx+0Ah]
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_8], eax
		mov	ax, 5
		call	Math_RandomScale_56C2F
		mov	dx, 0Ah
		sub	dx, ax
		mov	[bp+var_10], dx
		movsx	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	[bp+var_18], 0A00h
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_18]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		add	di, word ptr [bp+var_8+1]

loc_AFBDA:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_AFB34		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AFBE0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	[bp+arg_2]
		mov	bx, ax
		push	large [bx+0Eh]
		call	sub_400C2
		add	sp, 8
		pop	bp
		retf
sub_AFBE0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 26 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissileBody_BoostPhase_42632 (sub_42632 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 126L, LUE (2026-09-24). Ex-'Sound3D_TriggerWithRange' (FAUX). PHASE PROPULSEE du missile,
; appelee par MissileBody_GuidanceTick_42A4E tant que +0x3A == 0. Premier appel (+0x3B == 0) :
; vitesse du corps = vitesse du lanceur (+0x37, vtable+0x4C), efface le bit 1 de [missile]+4,
; pose +0x3B = 1. Ensuite : si |vitesse| < corps+0x25 (vitesse maximale) : vitesse ramenee
; dans le repere du missile (Matrix_WorldToLocal_58768 avec 0x57E2), composantes c0 et c2
; mises a 0, c1 += corps+0x29 * dt (acceleration le long du nez), retour au repere monde
; (Matrix_LocalToWorld_58828). Sinon : MissileBody_SetCruiseVelocity_42A1B et +0x3A = 1 (fin
; de la propulsion : elle s'arrete quand la vitesse maximale est atteinte, pas sur une duree).
; ==============================================================================================
MissileBody_BoostPhase_AFBFA		proc far

var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+3Eh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_AFC4A
		cmp	word ptr [si+3Ah], 0
		jz	short loc_AFC3F
		push	word ptr [si+3Ah]
		push	ss
		lea	ax, word ptr [bp+var_22]
		push	ax
		mov	bx, [si+3Ah]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_22]
		mov	[si+2], eax
		mov	eax, [bp+var_1E]
		mov	[si+6], eax
		mov	eax, [bp+var_1A]
		mov	[si+0Ah], eax

loc_AFC3F:
		mov	bx, [si+1Eh]
		and	byte ptr [bx+2], 0FDh
		mov	byte ptr [si+3Eh], 1

loc_AFC4A:
		push	large [si+0Ah]
		push	large [si+6]
		push	large [si+2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		mov	eax, [si+28h]
		cmp	eax, [bp+var_4]
		jle	short loc_AFC79
		mov	ax, 1
		jmp	short loc_AFC7B

loc_AFC79:
		xor	ax, ax

loc_AFC7B:
		or	al, al
		jz	short loc_AFCF1
		push	6660h
		mov	ax, si
		add	ax, 2
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[si+2], eax
		mov	eax, dword_7976E
		mov	edx, [si+2Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	di, si
		add	di, 6
		mov	ax, si
		add	ax, 6
		mov	[bp+var_12], ax
		mov	bx, [bp+var_12]
		mov	eax, [bx]
		add	eax, [bp+var_10]
		mov	[di], eax
		mov	[bp+var_16], 0
		mov	eax, [bp+var_16]
		mov	[si+0Ah], eax
		push	6660h
		mov	ax, si
		add	ax, 2
		push	ax
		call	sub_5A629
		add	sp, 4
		jmp	short loc_AFCFC

loc_AFCF1:
		push	si
		nop
		push	cs
		call	near ptr MissileBody_SetCruiseVelocity_AFFE3
		pop	cx
		mov	byte ptr [si+3Dh], 1

loc_AFCFC:
		pop	di
		pop	si
		leave
		retf
MissileBody_BoostPhase_AFBFA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 29 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissileBody_SteerToTarget_42738 (sub_42738 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 352L, LUE INTEGRALEMENT (2026-09-24). Ex-'Sound3D_ComputeSecondChannel' (FAUX : aucun son).
; LOI DE GUIDAGE DU MISSILE, appelee par MissileBody_GuidanceTick_42A4E quand le corps a une
; cible (+0x35) et le guidage actif (+0x39). Entrees : point vise P = globals
; dword_7287A/7E/82 (position +0x12 de la cible), position propre = dword_72886/8A/8E, matrice
; d'orientation du missile copiee dans le global 0x57E2. (1) D = P - moi, dist = |D| ; vitesse
; = |corps+8/+C/+10| ; t = dist/vitesse borne a 1.0 (0x100 ; 1.0 si vitesse nulle). (2)
; ANTICIPATION : D += vitesse_cible (cible->vtable+0x4C) * t. (3) L =
; Matrix_WorldToLocal_58768(D, 0x57E2) = D projete sur les 3 lignes de la matrice (repere
; missile : c0, c1, c2). (4) ROULIS INSTANTANE : a = Math_ArcTan2_54B0A(c0, c2) = atan(c0/c2),
; corrige de +/-180 (0xB400) si c2 <= 0 (signe de c0) ; Matrix_BuildAxisY_570C5(0x57E2, a) +
; Matrix_OrthonormalizeKeepRow1_57660 : rotation autour de l'axe c1 (le nez) qui amene la
; cible dans le plan (c1, c2) cote +c2. Pas de limite de vitesse sur ce roulis. (5) TANGAGE
; LIMITE : D re-projete, b = atan(c2/c1), et si c1 < 0 (cible derriere) b = 180 - |b| ; borne
; max = corps+0x21 * dt (dword_70458) : si b > borne, b = borne (le code ne borne que le cote
; positif ; apres le roulis la cible est cote +c2, donc b >= 0).
; Matrix_BuildAxisX_56EC3(0x57E2, b) + Matrix_OrthonormalizeKeepRow0_575DF : rotation autour
; de c0 (axe des ailes). (6) [missile]->vtable+0x40(0x57E2) : ecrit la nouvelle orientation.
; Loi de poursuite avec anticipation en 'bank-to-turn' : roulis immediat vers la cible puis
; cabrage a vitesse angulaire bornee (corps+0x21 = 1er dword du chunk dynamique MISS, en
; degres 24.8 par unite de temps). Matrix_BuildAxisY_570C5 ignore les angles < 0x38 (0,22
; deg).
; ==============================================================================================
MissileBody_SteerToTarget_AFD00		proc far

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
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 84h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, dword_7CD78
		sub	eax, dword_7CD84
		mov	[bp+var_60], eax
		mov	eax, dword_7CD7C
		sub	eax, dword_7CD88
		mov	[bp+var_5C], eax
		mov	eax, dword_7CD80
		sub	eax, dword_7CD8C
		mov	[bp+var_58], eax
		push	eax
		push	large [bp+var_5C]
		push	large [bp+var_60]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		push	large [si+0Ah]
		push	large [si+6]
		push	large [si+2]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0
		jz	short loc_AFD7C
		mov	ax, 1
		jmp	short loc_AFD7E

loc_AFD7C:
		xor	ax, ax

loc_AFD7E:
		or	al, al
		jz	short loc_AFD9E
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, [bp+var_C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_14], eax
		jmp	short loc_AFDAE

loc_AFD9E:
		mov	[bp+var_18], 100h
		mov	eax, [bp+var_18]
		mov	[bp+var_14], eax

loc_AFDAE:
		cmp	[bp+var_14], 100h
		jle	short loc_AFDBD
		mov	ax, 1
		jmp	short loc_AFDBF

loc_AFDBD:
		xor	ax, ax

loc_AFDBF:
		or	al, al
		jz	short loc_AFDD3
		mov	[bp+var_1C], 100h
		mov	eax, [bp+var_1C]
		mov	[bp+var_14], eax

loc_AFDD3:
		push	word ptr [si+38h]
		push	ss
		lea	ax, word ptr [bp+var_78]
		push	ax
		mov	bx, [si+38h]
		mov	bx, [bx]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_78]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_74]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_68], eax
		mov	eax, [bp+var_70]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_64], eax
		mov	eax, [bp+var_60]
		add	eax, [bp+var_6C]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_5C]
		add	eax, [bp+var_68]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_58]
		add	eax, [bp+var_64]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_7C], eax
		push	6660h
		lea	ax, word ptr [bp+var_84]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		lea	ax, word ptr [bp+var_7C]
		push	ax
		lea	ax, word ptr [bp+var_84]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Math_ArcTan2_56937
		add	sp, 8
		mov	eax, [bp+var_24]
		mov	[bp+var_20], eax
		cmp	[bp+var_7C], 0
		jle	short loc_AFE99
		mov	ax, 1
		jmp	short loc_AFE9B

loc_AFE99:
		xor	ax, ax

loc_AFE9B:
		or	al, al
		jz	short loc_AFEA4
		lea	ax, word ptr [bp+var_20]
		jmp	short loc_AFEE3

loc_AFEA4:
		cmp	[bp+var_84], 0
		jle	short loc_AFEB1
		mov	ax, 1
		jmp	short loc_AFEB3

loc_AFEB1:
		xor	ax, ax

loc_AFEB3:
		or	al, al
		jz	short loc_AFECE
		mov	eax, [bp+var_20]
		add	eax, 0B400h
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		lea	ax, word ptr [bp+var_2C]
		jmp	short loc_AFEE3

loc_AFECE:
		mov	eax, [bp+var_20]
		add	eax, 0FFFF4C00h
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		lea	ax, word ptr [bp+var_34]

loc_AFEE3:
		push	ax
		push	6660h
		call	Matrix_BuildAxisY_58E8E
		add	sp, 4
		push	6660h
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		push	6660h
		lea	ax, word ptr [bp+var_60]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		lea	ax, word ptr [bp+var_5C]
		push	ax
		lea	ax, word ptr [bp+var_58]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_3C]
		push	ax
		call	Math_ArcTan2_56937
		add	sp, 8
		mov	eax, [bp+var_3C]
		mov	[bp+var_38], eax
		mov	eax, [si+24h]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		cmp	[bp+var_5C], 0
		jge	short loc_AFF45
		mov	ax, 1
		jmp	short loc_AFF47

loc_AFF45:
		xor	ax, ax

loc_AFF47:
		or	al, al
		jz	short loc_AFF77
		mov	[bp+var_44], 0B400h
		mov	eax, [bp+var_38]
		or	eax, eax
		jge	short loc_AFF5F
		neg	eax

loc_AFF5F:
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_44]
		sub	eax, [bp+var_4C]
		mov	[bp+var_38], eax

loc_AFF77:
		mov	eax, [bp+var_38]
		cmp	eax, [bp+var_40]
		jle	short loc_AFF86
		mov	ax, 1
		jmp	short loc_AFF88

loc_AFF86:
		xor	ax, ax

loc_AFF88:
		or	al, al
		jz	short loc_AFFB7
		cmp	[bp+var_38], 0
		jge	short loc_AFF98
		mov	ax, 1
		jmp	short loc_AFF9A

loc_AFF98:
		xor	ax, ax

loc_AFF9A:
		or	al, al
		jz	short loc_AFFAF
		mov	eax, [bp+var_40]
		neg	eax
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		jmp	short loc_AFFB3

loc_AFFAF:
		mov	eax, [bp+var_40]

loc_AFFB3:
		mov	[bp+var_38], eax

loc_AFFB7:
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6660h
		call	Matrix_BuildAxisX_58C8C
		add	sp, 4
		push	6660h
		call	Matrix_OrthonormalizeKeepRow0_593A8
		pop	cx
		push	6660h
		push	word ptr [si+1Eh]
		mov	bx, [si+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		pop	si
		leave
		retf
MissileBody_SteerToTarget_AFD00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissileBody_SetCruiseVelocity_42A1B (sub_42A1B de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 25L, LUE (2026-09-24). Ex-'Sound3D_TriggerDirect' (FAUX). Vitesse du corps = (corps+0x2D,
; corps+0x25, corps+0x31) exprimee dans le repere du missile (c0, c1 = nez, c2), ramenee au
; repere monde par Matrix_LocalToWorld_58828(0x57E2) : vol de croisiere a vitesse maximale
; (+0x25) dans l'axe du nez. Les 4e et 5e dwords du chunk dynamique MISS (+0x2D, +0x31) sont
; les composantes laterale et normale de cette vitesse.
; ==============================================================================================
MissileBody_SetCruiseVelocity_AFFE3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+30h]
		mov	[si+2], eax
		mov	eax, [si+28h]
		mov	[si+6], eax
		mov	eax, [si+34h]
		mov	[si+0Ah], eax
		push	6660h
		mov	ax, si
		add	ax, 2
		push	ax
		call	sub_5A629
		add	sp, 4
		pop	si
		pop	bp
		retf
MissileBody_SetCruiseVelocity_AFFE3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B0016		proc far

var_5A		= word ptr -5Ah
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 5Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+1Eh]
		add	di, 12h
		mov	eax, [di]
		mov	dword_7CD84, eax
		mov	eax, [di+4]
		mov	dword_7CD88, eax
		mov	eax, [di+8]
		mov	dword_7CD8C, eax
		push	word ptr [si+1Eh]
		mov	bx, [si+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	6660h
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	bx, [si+1Eh]
		mov	ax, [bx+5Ah]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, si
		add	ax, 38h
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	word ptr [si+38h], 0
		jz	short loc_B00E0
		push	word ptr [si+38h]
		mov	bx, [si+38h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		cmp	[bp+var_E], 0
		jz	short loc_B00E0
		mov	di, [si+38h]
		add	di, 12h
		mov	eax, [di]
		mov	dword_7CD78, eax
		mov	eax, [di+4]
		mov	dword_7CD7C, eax
		mov	eax, [di+8]
		mov	dword_7CD80, eax
		les	bx, word ptr [bp+var_E]
		cmp	byte ptr es:[bx+17h], 1
		jbe	short loc_B00E0
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	word ptr [bp+var_16+2], ax
		mov	word ptr [bp+var_16], dx
		les	bx, word ptr [bp+var_16]
		mov	eax, es:[bx]
		mov	[bp+var_12], eax
		sar	eax, 3
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], eax
		add	dword_7CD80, eax

loc_B00E0:
		mov	bx, [si+1Eh]
		mov	al, [bx+2]
		and	al, 2
		mov	ah, 0
		or	ax, ax
		jz	short loc_B00F1
		jmp	loc_B01D4

loc_B00F1:
		cmp	word ptr [si+3Ah], 0
		jnz	short loc_B00FA
		jmp	loc_B01D4

loc_B00FA:
		mov	di, [si+3Ah]
		add	di, 12h
		mov	eax, [di]
		sub	eax, dword_7CD84
		mov	[bp+var_36], eax
		mov	eax, [di+4]
		sub	eax, dword_7CD88
		mov	[bp+var_32], eax
		mov	eax, [di+8]
		sub	eax, dword_7CD8C
		mov	[bp+var_2E], eax
		push	eax
		push	large [bp+var_32]
		push	large [bp+var_36]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		or	eax, eax
		jge	short loc_B0150
		neg	eax

loc_B0150:
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	[bp+var_E], eax
		mov	bx, [si+3Ah]
		les	bx, [bx+0Eh]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	[bp+var_20], ax
		mov	[bp+var_22], dx
		les	bx, [bp+var_22]
		mov	eax, es:[bx]
		mov	[bp+var_1E], eax
		mov	bx, [si+1Eh]
		les	bx, [bx+0Eh]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	[bp+var_24], ax
		mov	[bp+var_26], dx
		les	bx, [bp+var_26]
		mov	eax, es:[bx]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_1E]
		add	eax, [bp+var_2A]
		mov	[bp+var_1E], eax
		shl	eax, 2
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_E]
		cmp	eax, [bp+var_1E]
		jle	short loc_B01C7
		mov	ax, 1
		jmp	short loc_B01C9

loc_B01C7:
		xor	ax, ax

loc_B01C9:
		or	al, al
		jz	short loc_B01D4
		mov	bx, [si+1Eh]
		or	byte ptr [bx+2], 2

loc_B01D4:
		cmp	word ptr [si+38h], 0
		jz	short loc_B01E6
		cmp	byte ptr [si+3Ch], 0
		jz	short loc_B01E6
		push	si
		push	cs
		call	near ptr MissileBody_SteerToTarget_AFD00
		pop	cx

loc_B01E6:
		mov	al, [si+3Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B01F7
		push	si
		push	cs
		call	near ptr MissileBody_BoostPhase_AFBFA
		jmp	loc_B02B2

loc_B01F7:
		cmp	word ptr [si+38h], 0
		jz	short loc_B0200
		jmp	loc_B02AD

loc_B0200:
		mov	eax, dword_7942B
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]
		mov	[bp+var_A], eax
		add	[si+0Ah], eax
		mov	di, si
		add	di, 2
		mov	eax, [di]
		mov	[bp+var_36], eax
		mov	eax, [di+4]
		mov	[bp+var_32], eax
		mov	eax, [di+8]
		mov	[bp+var_2E], eax
		push	3
		push	large 100h
		lea	ax, word ptr [bp+var_36]
		push	ax
		call	sub_57677
		add	sp, 8
		lea	ax, word ptr [bp+var_36]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		push	word ptr [si+1Eh]
		mov	bx, [si+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	word ptr [bp+var_E+2], ax
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [bp+var_36]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_46], eax
		lea	ax, [bp+var_5A]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, [bp+var_5A]
		push	ax
		push	word ptr [si+1Eh]
		mov	bx, [si+1Eh]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		jmp	short loc_B02B3

loc_B02AD:
		push	si
		push	cs
		call	near ptr MissileBody_SetCruiseVelocity_AFFE3

loc_B02B2:
		pop	cx

loc_B02B3:
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
sub_B0016		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_Method_Dispatch18_A12CD (sub_A12CD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; dispatch vtable [bx+0x18] (champ +0x0E).
; ==============================================================================================
Widget_Method_Dispatch18_B02B9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		pop	si
		pop	bp
		retf
Widget_Method_Dispatch18_B02B9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B02CA		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_B02CA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B02CF		proc far
		push	bp
		mov	bp, sp
		mov	al, 8
		pop	bp
		retf
sub_B02CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B02D6		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_B031E
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1DE4h
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_40242
		add	sp, 6
		test	si, 1
		jz	short loc_B031E
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_B031E:
		pop	si
		leave
		retf
sub_B02D6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B0321		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B034C
		mov	word ptr [si], 251Eh
		push	0
		push	si
		call	sub_402B6
		add	sp, 4
		test	di, 1
		jz	short loc_B034C
		push	si
		call	sub_3B2
		pop	cx

loc_B034C:
		pop	di
		pop	si
		pop	bp
		retf
sub_B0321		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B0350		proc far
		push	bp
		mov	bp, sp
		push	6660h
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		pop	bp
		retf
sub_B0350		endp
ovr314		ends
