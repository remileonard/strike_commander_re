seg090		segment	byte public 'CODE' use16
		assume cs:seg090
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far, LUE (2026-09-24, precise). mov al, 8. Slot +0x34 de la vtable d'INSTANCE du missile
; (seg339 base 0x6FAC4, entree off_6FAF8) : renvoie 8, la meme valeur que la categorie du
; modele MISS (slot +8 de la vtable modele). Meme motif pour le leurre (loc_45197, slot +0x34,
; 0x10). Le sens exact de ce slot d'instance (categorie ?) n'est pas prouve par un lecteur.
; ==============================================================================================
Missile_GetCategory_4244E:				; DATA XREF: seg339:off_6FAF8o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 8
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE (2026-09-24). Mise a jour de l'objet MISSILE (categorie 8). Si +0x59 : l'efface et
; renvoie 1 ; si +0x26 non nul : renvoie 1. Sinon, si le minuteur +0x5A echoit
; (Timer_TickWithBlinkPulses_4FB46) et que le chercheur est actif (+0x61) : +0x55 =
; Targeting_SelectAndPrioritize(modele d'arme +0x0E, cible actuelle +0x55, le missile lui-
; meme, +0x63) ; corps+0x39 (guidage actif) = (+0x55 non nul). Puis
; Camera_ExternalUpdate_3D9B4 (tick du corps -> MissileBody_GuidanceTick_42A4E). ALLUMEUR DE
; PROXIMITE : si cible presente et distance (positions +0x12) < modele+0x63 << 8 (word du
; chunk DATA du modele MISS), renvoie 0 (le missile explose/disparait) ; sinon renvoie l'etat
; du corps.
; ==============================================================================================
Missile_UpdateSeekerAndFuse_42458:				; DATA XREF: seg339:off_6FAD4o
		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+6]
		cmp	byte ptr [si+59h], 0
		jz	short loc_42472
		mov	byte ptr [si+59h], 0

loc_4246D:				; CODE XREF: seg090:0041j
		mov	al, 1
		jmp	loc_42568
; ���������������������������������������������������������������������������

loc_42472:				; CODE XREF: seg090:0027j
		cmp	word ptr [si+26h], 0
		jz	short loc_4247D
		mov	ax, 1
		jmp	short loc_4247F
; ���������������������������������������������������������������������������

loc_4247D:				; CODE XREF: seg090:0036j
		xor	ax, ax

loc_4247F:				; CODE XREF: seg090:003Bj
		or	al, al
		jnz	short loc_4246D
		mov	ax, si

loc_42485:
		add	ax, 5Ah	; 'Z'
		push	ax
		call	Timer_TickWithBlinkPulses_4FB46
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_42498
		jmp	loc_42561
; ���������������������������������������������������������������������������

loc_42498:				; CODE XREF: seg090:0053j
		cmp	byte ptr [si+61h], 0
		jz	short loc_424DA
		mov	al, [si+63h]
		push	ax
		push	si
		push	word ptr [si+55h]
		push	large dword ptr	[si+0Eh]
		call	Targeting_SelectAndPrioritize
		add	sp, 0Ah
		mov	[bp-2],	ax
		push	ax
		mov	ax, si
		add	ax, 55h	; 'U'
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	word ptr [si+55h], 0
		jz	short loc_424D3
		mov	bx, [si+51h]
		mov	byte ptr [bx+39h], 1
		jmp	short loc_424DA
; ���������������������������������������������������������������������������

loc_424D3:				; CODE XREF: seg090:0088j
		mov	bx, [si+51h]
		mov	byte ptr [bx+39h], 0

loc_424DA:				; CODE XREF: seg090:005Cj seg090:0091j
		push	si
		call	Camera_ExternalUpdate_3D9B4
		pop	cx
		mov	[bp-3],	al
		cmp	word ptr [si+55h], 0
		jz	short loc_42565
		cmp	byte ptr [bp-3], 0
		jz	short loc_42565

loc_424F0:
		mov	di, [si+55h]
		add	di, 12h
		mov	dx, si
		add	dx, 12h
		mov	eax, [di]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp-1Ah], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp-16h], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp-12h], eax
		push	eax

loc_42521:
		push	large dword ptr	[bp-16h]

loc_42525:
		push	large dword ptr	[bp-1Ah]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-0Ch], eax
		mov	[bp-8],	eax
		les	bx, [si+0Eh]
		mov	ax, es:[bx+63h]
		mov	[bp-0Eh], ax
		movsx	eax, word ptr [bp-0Eh]
		shl	eax, 8
		cmp	eax, [bp-8]
		jle	short loc_4255B
		mov	ax, 1
		jmp	short loc_4255D
; ���������������������������������������������������������������������������

loc_4255B:				; CODE XREF: seg090:0114j
		xor	ax, ax

loc_4255D:				; CODE XREF: seg090:0119j
		or	al, al
		jz	short loc_42565

loc_42561:				; CODE XREF: seg090:0055j
		mov	al, 0
		jmp	short loc_42568
; ���������������������������������������������������������������������������

loc_42565:				; CODE XREF: seg090:00A8j seg090:00AEj ...
		mov	al, [bp-3]

loc_42568:				; CODE XREF: seg090:002Fj seg090:0123j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4256C:				; DATA XREF: seg339:2A98o
		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+6]
		push	word ptr [bp+8]
		push	si
		call	Debris_CombinePhysicsBodies
		add	sp, 4

loc_42583:
		mov	di, ax
		les	bx, [si+0Eh]
		mov	ax, es:[bx+1Bh]
		mov	dx, es:[bx+19h]
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		cmp	dword ptr [bp-4], 0
		jz	short loc_42612
		les	bx, [bp-4]
		mov	ax, es:[bx+0Ah]
		mov	[bp-0Ah], ax
		movsx	eax, word ptr [bp-0Ah]
		shl	eax, 8
		mov	[bp-0Eh], eax
		mov	eax, [bp-0Eh]
		mov	[bp-8],	eax
		mov	ax, 5
		call	Math_RandomScale_54DF4
		mov	dx, 0Ah
		sub	dx, ax
		mov	[bp-10h], dx
		movsx	eax, word ptr [bp-10h]
		shl	eax, 8
		mov	[bp-14h], eax
		mov	eax, [bp-8]
		mov	edx, [bp-14h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-8],	eax

loc_425ED:
		mov	dword ptr [bp-18h], 0A00h
		mov	eax, [bp-8]
		mov	edx, eax
		mov	ecx, [bp-18h]
		sar	edx, 18h

loc_42604:
		shl	eax, 8
		idiv	ecx
		mov	[bp-8],	eax
		add	di, [bp-7]

loc_42612:				; CODE XREF: seg090:015Bj
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_42618:				; DATA XREF: seg339:off_6FB44o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	ax

loc_4261F:
		push	word ptr [bp+8]
		mov	bx, ax
		push	large dword ptr	[bx+0Eh]
		call	Proximity_TestOriented
		add	sp, 8
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 126L, LUE (2026-09-24). Ex-'Sound3D_TriggerWithRange' (FAUX). PHASE PROPULSEE du
; missile, appelee par MissileBody_GuidanceTick_42A4E tant que +0x3A == 0. Premier appel
; (+0x3B == 0) : vitesse du corps = vitesse du lanceur (+0x37, vtable+0x4C), efface le bit 1
; de [missile]+4, pose +0x3B = 1. Ensuite : si |vitesse| < corps+0x25 (vitesse maximale) :
; vitesse ramenee dans le repere du missile (Matrix_WorldToLocal_58768 avec 0x57E2),
; composantes c0 et c2 mises a 0, c1 += corps+0x29 * dt (acceleration le long du nez), retour
; au repere monde (Matrix_LocalToWorld_58828). Sinon : MissileBody_SetCruiseVelocity_42A1B et
; +0x3A = 1 (fin de la propulsion : elle s'arrete quand la vitesse maximale est atteinte, pas
; sur une duree).
; ==============================================================================================
MissileBody_BoostPhase_42632	proc far		; CODE XREF: seg090:07E9p

var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+3Bh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_42682
		cmp	word ptr [si+37h], 0
		jz	short loc_42677
		push	word ptr [si+37h]
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		mov	bx, [si+37h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_22]
		mov	[si+8],	eax
		mov	eax, [bp+var_1E]
		mov	[si+0Ch], eax
		mov	eax, [bp+var_1A]
		mov	[si+10h], eax

loc_42677:				; CODE XREF: MissileBody_BoostPhase_42632+18j
		mov	bx, [si+2]
		and	byte ptr [bx+4], 0FDh
		mov	byte ptr [si+3Bh], 1

loc_42682:				; CODE XREF: MissileBody_BoostPhase_42632+12j
		push	large dword ptr	[si+10h]
		push	large dword ptr	[si+0Ch]
		push	large dword ptr	[si+8]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		mov	eax, [si+25h]
		cmp	eax, [bp+var_4]
		jle	short loc_426B1
		mov	ax, 1
		jmp	short loc_426B3
; ���������������������������������������������������������������������������

loc_426B1:				; CODE XREF: MissileBody_BoostPhase_42632+78j
		xor	ax, ax

loc_426B3:				; CODE XREF: MissileBody_BoostPhase_42632+7Dj
		or	al, al
		jz	short loc_42729
		push	57E2h
		mov	ax, si
		add	ax, 8
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[si+8],	eax
		mov	eax, dword_70458
		mov	edx, [si+29h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	di, si
		add	di, 0Ch
		mov	ax, si

loc_426F3:
		add	ax, 0Ch

loc_426F6:
		mov	[bp+var_12], ax
		mov	bx, [bp+var_12]

loc_426FC:
		mov	eax, [bx]
		add	eax, [bp+var_10]
		mov	[di], eax
		mov	[bp+var_16], 0
		mov	eax, [bp+var_16]
		mov	[si+10h], eax
		push	57E2h
		mov	ax, si
		add	ax, 8
		push	ax

loc_4271F:
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		jmp	short loc_42734
; ���������������������������������������������������������������������������

loc_42729:				; CODE XREF: MissileBody_BoostPhase_42632+83j
		push	si
		nop
		push	cs
		call	near ptr MissileBody_SetCruiseVelocity_42A1B
		pop	cx
		mov	byte ptr [si+3Ah], 1

loc_42734:				; CODE XREF: MissileBody_BoostPhase_42632+F5j
		pop	di
		pop	si
		leave
		retf
MissileBody_BoostPhase_42632	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 352L, LUE INTEGRALEMENT (2026-09-24). Ex-'Sound3D_ComputeSecondChannel' (FAUX : aucun
; son). LOI DE GUIDAGE DU MISSILE, appelee par MissileBody_GuidanceTick_42A4E quand le corps a
; une cible (+0x35) et le guidage actif (+0x39). Entrees : point vise P = globals
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
MissileBody_SteerToTarget_42738	proc far		; CODE XREF: seg090:07DAp

var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 84h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, dword_7287A
		sub	eax, dword_72886
		mov	[bp+var_60], eax
		mov	eax, dword_7287E
		sub	eax, dword_7288A
		mov	[bp+var_5C], eax
		mov	eax, dword_72882
		sub	eax, dword_7288E
		mov	[bp+var_58], eax
		push	eax
		push	large [bp+var_5C]
		push	large [bp+var_60]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		push	large dword ptr	[si+10h]
		push	large dword ptr	[si+0Ch]
		push	large dword ptr	[si+8]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0
		jz	short loc_427B4
		mov	ax, 1
		jmp	short loc_427B6
; ���������������������������������������������������������������������������

loc_427B4:				; CODE XREF: MissileBody_SteerToTarget_42738+75j
		xor	ax, ax

loc_427B6:				; CODE XREF: MissileBody_SteerToTarget_42738+7Aj
		or	al, al
		jz	short loc_427D6
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, [bp+var_C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_14], eax
		jmp	short loc_427E6
; ���������������������������������������������������������������������������

loc_427D6:				; CODE XREF: MissileBody_SteerToTarget_42738+80j
		mov	[bp+var_18], 100h
		mov	eax, [bp+var_18]
		mov	[bp+var_14], eax

loc_427E6:				; CODE XREF: MissileBody_SteerToTarget_42738+9Cj
		cmp	[bp+var_14], 100h
		jle	short loc_427F5
		mov	ax, 1
		jmp	short loc_427F7
; ���������������������������������������������������������������������������

loc_427F5:				; CODE XREF: MissileBody_SteerToTarget_42738+B6j
		xor	ax, ax

loc_427F7:				; CODE XREF: MissileBody_SteerToTarget_42738+BBj
		or	al, al
		jz	short loc_4280B
		mov	[bp+var_1C], 100h
		mov	eax, [bp+var_1C]
		mov	[bp+var_14], eax

loc_4280B:				; CODE XREF: MissileBody_SteerToTarget_42738+C1j
		push	word ptr [si+35h]
		push	ss
		lea	ax, [bp+var_78]
		push	ax
		mov	bx, [si+35h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_78]

loc_42822:
		mov	edx, [bp+var_14]

loc_42826:
		imul	edx

loc_42829:
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

loc_42882:
		mov	[bp+var_84], eax
		mov	eax, [bp+var_5C]

loc_4288B:
		mov	[bp+var_80], eax

loc_4288F:
		mov	eax, [bp+var_58]

loc_42893:
		mov	[bp+var_7C], eax

loc_42897:
		push	57E2h
		lea	ax, [bp+var_84]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		lea	ax, [bp+var_7C]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	Math_ArcTan2_54B0A
		add	sp, 8
		mov	eax, [bp+var_24]
		mov	[bp+var_20], eax
		cmp	[bp+var_7C], 0
		jle	short loc_428D1
		mov	ax, 1
		jmp	short loc_428D3
; ���������������������������������������������������������������������������

loc_428D1:				; CODE XREF: MissileBody_SteerToTarget_42738+192j
		xor	ax, ax

loc_428D3:				; CODE XREF: MissileBody_SteerToTarget_42738+197j
		or	al, al
		jz	short loc_428DC
		lea	ax, [bp+var_20]
		jmp	short loc_4291B
; ���������������������������������������������������������������������������

loc_428DC:				; CODE XREF: MissileBody_SteerToTarget_42738+19Dj
		cmp	[bp+var_84], 0
		jle	short loc_428E9
		mov	ax, 1
		jmp	short loc_428EB
; ���������������������������������������������������������������������������

loc_428E9:				; CODE XREF: MissileBody_SteerToTarget_42738+1AAj
		xor	ax, ax

loc_428EB:				; CODE XREF: MissileBody_SteerToTarget_42738+1AFj
		or	al, al
		jz	short loc_42906
		mov	eax, [bp+var_20]
		add	eax, 0B400h
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		lea	ax, [bp+var_2C]
		jmp	short loc_4291B
; ���������������������������������������������������������������������������

loc_42906:				; CODE XREF: MissileBody_SteerToTarget_42738+1B5j
		mov	eax, [bp+var_20]
		add	eax, 0FFFF4C00h
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		lea	ax, [bp+var_34]

loc_4291B:				; CODE XREF: MissileBody_SteerToTarget_42738+1A2j
					; MissileBody_SteerToTarget_42738+1CCj
		push	ax
		push	57E2h
		call	Matrix_BuildAxisY_570C5
		add	sp, 4
		push	57E2h
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		push	57E2h
		lea	ax, [bp+var_60]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		push	ss
		lea	ax, [bp+var_3C]
		push	ax
		call	Math_ArcTan2_54B0A
		add	sp, 8
		mov	eax, [bp+var_3C]
		mov	[bp+var_38], eax
		mov	eax, [si+21h]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		cmp	[bp+var_5C], 0
		jge	short loc_4297D
		mov	ax, 1
		jmp	short loc_4297F
; ���������������������������������������������������������������������������

loc_4297D:				; CODE XREF: MissileBody_SteerToTarget_42738+23Ej
		xor	ax, ax

loc_4297F:				; CODE XREF: MissileBody_SteerToTarget_42738+243j
		or	al, al
		jz	short loc_429AF

loc_42983:
		mov	[bp+var_44], 0B400h
		mov	eax, [bp+var_38]

loc_4298F:
		or	eax, eax
		jge	short loc_42997
		neg	eax

loc_42997:				; CODE XREF: MissileBody_SteerToTarget_42738+25Aj
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_44]
		sub	eax, [bp+var_4C]
		mov	[bp+var_38], eax

loc_429AF:				; CODE XREF: MissileBody_SteerToTarget_42738+249j
		mov	eax, [bp+var_38]
		cmp	eax, [bp+var_40]
		jle	short loc_429BE
		mov	ax, 1
		jmp	short loc_429C0
; ���������������������������������������������������������������������������

loc_429BE:				; CODE XREF: MissileBody_SteerToTarget_42738+27Fj
		xor	ax, ax

loc_429C0:				; CODE XREF: MissileBody_SteerToTarget_42738+284j
		or	al, al
		jz	short loc_429EF
		cmp	[bp+var_38], 0
		jge	short loc_429D0
		mov	ax, 1
		jmp	short loc_429D2
; ���������������������������������������������������������������������������

loc_429D0:				; CODE XREF: MissileBody_SteerToTarget_42738+291j
		xor	ax, ax

loc_429D2:				; CODE XREF: MissileBody_SteerToTarget_42738+296j
		or	al, al
		jz	short loc_429E7
		mov	eax, [bp+var_40]
		neg	eax
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		jmp	short loc_429EB
; ���������������������������������������������������������������������������

loc_429E7:				; CODE XREF: MissileBody_SteerToTarget_42738+29Cj
		mov	eax, [bp+var_40]

loc_429EB:				; CODE XREF: MissileBody_SteerToTarget_42738+2ADj
		mov	[bp+var_38], eax

loc_429EF:				; CODE XREF: MissileBody_SteerToTarget_42738+28Aj
		lea	ax, [bp+var_38]
		push	ax

loc_429F3:
		push	57E2h

loc_429F6:
		call	Matrix_BuildAxisX_56EC3
		add	sp, 4
		push	57E2h
		call	Matrix_OrthonormalizeKeepRow0_575DF
		pop	cx
		push	57E2h
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		pop	si
		leave
		retf
MissileBody_SteerToTarget_42738	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 25L, LUE (2026-09-24). Ex-'Sound3D_TriggerDirect' (FAUX). Vitesse du corps =
; (corps+0x2D, corps+0x25, corps+0x31) exprimee dans le repere du missile (c0, c1 = nez, c2),
; ramenee au repere monde par Matrix_LocalToWorld_58828(0x57E2) : vol de croisiere a vitesse
; maximale (+0x25) dans l'axe du nez. Les 4e et 5e dwords du chunk dynamique MISS (+0x2D,
; +0x31) sont les composantes laterale et normale de cette vitesse.
; ==============================================================================================
MissileBody_SetCruiseVelocity_42A1B	proc far		; CODE XREF: MissileBody_BoostPhase_42632+FAp
					; seg090:089Dp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+2Dh]
		mov	[si+8],	eax
		mov	eax, [si+25h]
		mov	[si+0Ch], eax
		mov	eax, [si+31h]
		mov	[si+10h], eax
		push	57E2h
		mov	ax, si
		add	ax, 8
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		pop	si
		pop	bp
		retf
MissileBody_SetCruiseVelocity_42A1B	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE (2026-09-24). Methode virtuelle +0x3C (tick) du CORPS PHYSIQUE du missile (classe
; construite par JDYN_LoadChunkAndConstruct_3A49C quand le chunk dynamique MISS est present :
; 0x3C octets, vtable 0x1F66 ; appelee par Camera_ExternalUpdate_3D9B4). Ordre : position
; propre -> dword_72886.. ; orientation du missile ([+2]->vtable+0x3C) copiee dans 0x57E2 ;
; corps+0x35 = [missile]+0x55 (SetReference16 : la cible choisie par le chercheur) ; si cible
; : point vise = position cible (+0x12) -> dword_7287A.., et si target_type (modele cible
; +0x11) > 1, altitude += (champ +0x10 du sous-objet modele+0x08) >> 3. Si le bit 1 de
; [missile]+4 est nul et le lanceur (+0x37) existe : pose ce bit quand la distance au lanceur
; depasse 4 * (somme des deux valeurs +0x10 des sous-objets modele+0x08) (degagement du
; lanceur). Guidage : si +0x35 et +0x39 -> MissileBody_SteerToTarget_42738. Vitesse : +0x3A ==
; 0 -> MissileBody_BoostPhase_42632 ; sinon cible presente ->
; MissileBody_SetCruiseVelocity_42A1B ; sinon VOL BALISTIQUE : altitude de la vitesse +=
; dword_6FFD7 * dt (gravite), Vector_PrescaleBelow256_55B04 / Vector_NormalizeInPlace_5593A
; sur le vecteur vitesse, puis le nez est aligne sur la vitesse
; (Matrix_OrthonormalizeKeepRow1_57660 + [missile]->vtable+0x40). Renvoie 1.
; ==============================================================================================
MissileBody_GuidanceTick_42A4E:				; DATA XREF: seg339:off_6F052o
		push	bp
		mov	bp, sp
		sub	sp, 5Ah
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [si+2]
		add	di, 12h
		mov	eax, [di]
		mov	dword_72886, eax
		mov	eax, [di+4]
		mov	dword_7288A, eax
		mov	eax, [di+8]
		mov	dword_7288E, eax
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax

loc_42A83:
		push	57E2h
		call	AI_ComputeGeometryHelper_56E29

loc_42A8B:
		add	sp, 4
		mov	bx, [si+2]
		mov	ax, [bx+55h]
		mov	[bp-2],	ax
		push	ax
		mov	ax, si
		add	ax, 35h	; '5'
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	word ptr [si+35h], 0
		jz	short loc_42B18
		push	word ptr [si+35h]
		mov	bx, [si+35h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp-0Ch], dx
		mov	[bp-0Eh], ax
		cmp	dword ptr [bp-0Eh], 0
		jz	short loc_42B18
		mov	di, [si+35h]
		add	di, 12h
		mov	eax, [di]
		mov	dword_7287A, eax
		mov	eax, [di+4]
		mov	dword_7287E, eax
		mov	eax, [di+8]
		mov	dword_72882, eax
		les	bx, [bp-0Eh]
		cmp	byte ptr es:[bx+11h], 1
		jbe	short loc_42B18
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	[bp-14h], ax
		mov	[bp-16h], dx
		les	bx, [bp-16h]

loc_42AFF:
		mov	eax, es:[bx]

loc_42B03:
		mov	[bp-12h], eax

loc_42B07:
		sar	eax, 3
		mov	[bp-1Ah], eax
		mov	[bp-1Eh], eax
		add	dword_72882, eax

loc_42B18:				; CODE XREF: seg090:066Aj seg090:0682j ...
		mov	bx, [si+2]
		mov	al, [bx+4]
		and	al, 2

loc_42B20:
		mov	ah, 0

loc_42B22:
		or	ax, ax
		jz	short loc_42B29

loc_42B26:
		jmp	loc_42C0C
; ���������������������������������������������������������������������������

loc_42B29:				; CODE XREF: seg090:06E4j
		cmp	word ptr [si+37h], 0
		jnz	short loc_42B32
		jmp	loc_42C0C
; ���������������������������������������������������������������������������

loc_42B32:				; CODE XREF: seg090:06EDj
		mov	di, [si+37h]
		add	di, 12h
		mov	eax, [di]
		sub	eax, dword_72886
		mov	[bp-36h], eax
		mov	eax, [di+4]
		sub	eax, dword_7288A
		mov	[bp-32h], eax
		mov	eax, [di+8]
		sub	eax, dword_7288E
		mov	[bp-2Eh], eax
		push	eax
		push	large dword ptr	[bp-32h]
		push	large dword ptr	[bp-36h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-12h], eax
		mov	[bp-0Eh], eax
		mov	eax, [bp-0Eh]
		or	eax, eax
		jge	short loc_42B88
		neg	eax

loc_42B88:				; CODE XREF: seg090:0743j
		mov	[bp-16h], eax
		mov	eax, [bp-16h]
		mov	[bp-1Ah], eax
		mov	[bp-0Eh], eax
		mov	bx, [si+37h]
		les	bx, [bx+0Eh]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	[bp-20h], ax
		mov	[bp-22h], dx
		les	bx, [bp-22h]
		mov	eax, es:[bx]
		mov	[bp-1Eh], eax
		mov	bx, [si+2]
		les	bx, [bx+0Eh]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	[bp-24h], ax
		mov	[bp-26h], dx
		les	bx, [bp-26h]
		mov	eax, es:[bx]
		mov	[bp-2Ah], eax
		mov	eax, [bp-1Eh]
		add	eax, [bp-2Ah]
		mov	[bp-1Eh], eax
		shl	eax, 2
		mov	[bp-1Eh], eax
		mov	eax, [bp-0Eh]
		cmp	eax, [bp-1Eh]

loc_42BF8:
		jle	short loc_42BFF

loc_42BFA:
		mov	ax, 1
		jmp	short loc_42C01
; ���������������������������������������������������������������������������

loc_42BFF:				; CODE XREF: seg090:loc_42BF8j
		xor	ax, ax

loc_42C01:				; CODE XREF: seg090:07BDj
		or	al, al
		jz	short loc_42C0C
		mov	bx, [si+2]
		or	byte ptr [bx+4], 2

loc_42C0C:				; CODE XREF: seg090:loc_42B26j
					; seg090:06EFj	...
		cmp	word ptr [si+35h], 0
		jz	short loc_42C1E
		cmp	byte ptr [si+39h], 0
		jz	short loc_42C1E
		push	si
		push	cs
		call	near ptr MissileBody_SteerToTarget_42738
		pop	cx

loc_42C1E:				; CODE XREF: seg090:07D0j seg090:07D6j
		mov	al, [si+3Ah]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_42C2F
		push	si
		push	cs
		call	near ptr MissileBody_BoostPhase_42632
		jmp	loc_42CE0
; ���������������������������������������������������������������������������

loc_42C2F:				; CODE XREF: seg090:07E5j
		cmp	word ptr [si+35h], 0

loc_42C33:
		jz	short loc_42C38
		jmp	loc_42CDB
; ���������������������������������������������������������������������������

loc_42C38:				; CODE XREF: seg090:loc_42C33j
		mov	eax, dword_6FFD7
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-6],	eax
		mov	eax, [bp-6]
		mov	[bp-0Ah], eax
		add	[si+10h], eax
		mov	di, si
		add	di, 8
		mov	eax, [di]
		mov	[bp-36h], eax
		mov	eax, [di+4]
		mov	[bp-32h], eax
		mov	eax, [di+8]
		mov	[bp-2Eh], eax
		lea	ax, [bp-36h]
		push	ax
		call	Vector_PrescaleBelow256_55B04
		pop	cx
		lea	ax, [bp-36h]
		push	ax

loc_42C83:
		call	Vector_NormalizeInPlace_5593A

loc_42C88:
		pop	cx

loc_42C89:
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]

loc_42C91:
		call	dword ptr [bx+3Ch]
		pop	cx

loc_42C95:
		mov	[bp-0Ch], ax
		push	ax
		lea	ax, [bp-5Ah]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	eax, [bp-36h]
		mov	[bp-4Eh], eax
		mov	eax, [bp-32h]
		mov	[bp-4Ah], eax
		mov	eax, [bp-2Eh]
		mov	[bp-46h], eax
		lea	ax, [bp-5Ah]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		lea	ax, [bp-5Ah]
		push	ax
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		jmp	short loc_42CE1
; ���������������������������������������������������������������������������

loc_42CDB:				; CODE XREF: seg090:07F5j
		push	si
		push	cs
		call	near ptr MissileBody_SetCruiseVelocity_42A1B

loc_42CE0:				; CODE XREF: seg090:07ECj
		pop	cx

loc_42CE1:				; CODE XREF: seg090:0899j
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_42CE7:				; DATA XREF: seg339:off_6F056o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]

loc_42CF1:
		call	dword ptr [bx+3Ch]
		pop	cx
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_42CFD:				; DATA XREF: seg339:off_6F550o
		push	bp
		mov	bp, sp

loc_42D00:
		mov	al, 8
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_42D04:				; DATA XREF: seg339:off_6F548o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_42D4C
		les	bx, [bp+6]
		mov	word ptr es:[bx], 2498h
		push	0
		push	word ptr [bp+8]
		push	bx
		call	Targeting_DestructComponent

loc_42D28:
		add	sp, 6

loc_42D2B:
		test	si, 1
		jz	short loc_42D4C

loc_42D31:
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_42D4C:				; CODE XREF: seg090:08D3j seg090:08EFj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_42D4F:				; DATA XREF: seg339:off_6FADCo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_42D7A
		mov	word ptr [si], 2A14h
		push	0
		push	si
		call	Targeting_DestructWithWeakRefs
		add	sp, 4
		test	di, 1
		jz	short loc_42D7A
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_42D7A:				; CODE XREF: seg090:091Cj seg090:0931j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_42D7E:				; DATA XREF: seg339:4E28o
		push	bp

loc_42D7F:
		mov	bp, sp

loc_42D81:
		push	57E2h

loc_42D84:
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		pop	bp
		retf
seg090		ends
