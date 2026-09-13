seg003		segment	byte public 'CODE' use16
		assume cs:seg003
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_4F80:				; DATA XREF: seg216:00D6o seg339:0388o ...
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4F85:				; DATA XREF: seg339:0118o seg339:0374o ...
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	dx, es:[bx+9]
		mov	ax, es:[bx+7]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,135L — normalise une différence angulaire signée entre 2 angles fixed-point (wraparound
; ±0xB400/0x16800, unité d'angle façon BAM) : calcul de delta de cap (heading) normalisé. LUE
; INTEGRALEMENT (a la demande de Remi). CONFIRME precisement : calcule atan2(y,x) (via
; Math_ArcTan2_54B0A, avec correction de quadrant ±180 deg) pour DEUX vecteurs 2D distincts
; (parametres arg_4/arg_6, chacun un pointeur vers une paire x,y), PUIS calcule le DELTA SIGNE
; entre ces deux angles resultants (wrappe ±180 deg), ecrit dans le pointeur de sortie arg_0.
; Utilise par MVRS_ID5_ApplySetAspectBit_FCE1 pour son test de signe - confirme un veritable
; calcul 'angle entre deux directions', pas juste un produit scalaire comme suppose
; initialement.
; ==============================================================================================
Angle_DeltaNormalized_A	proc far		; CODE XREF: AI_EscortPriorityReactionHandler_9A77+1CBP
					; Goal_FollowWaypoints+1CEP ...

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
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		push	di
		mov	dx, [bp+arg_4]
		mov	si, [bp+arg_6]
		mov	di, dx
		add	di, 4
		mov	eax, [di]
		mov	[bp+var_10], eax
		mov	di, dx
		mov	eax, [di]
		mov	[bp+var_14], eax
		lea	ax, [bp+var_14]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		call	Math_ArcTan2_54B0A
		add	sp, 8
		mov	ax, word ptr [bp+var_14+2]
		sar	ax, 0Fh
		or	al, al
		jz	short loc_4FF5
		mov	ax, word ptr [bp+var_10+2]
		sar	ax, 0Fh
		or	al, al
		jz	short loc_4FEB
		sub	[bp+var_18], 0B400h

loc_4FE9:				; CODE XREF: Angle_DeltaNormalized_A+5Ej
		jmp	short loc_4FF5
; ���������������������������������������������������������������������������

loc_4FEB:				; CODE XREF: Angle_DeltaNormalized_A+4Aj
		add	[bp+var_18], 0B400h
		jmp	short loc_4FE9
; ���������������������������������������������������������������������������

loc_4FF5:				; CODE XREF: Angle_DeltaNormalized_A+40j
					; Angle_DeltaNormalized_A:loc_4FE9j
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	[bp+var_4], eax
		mov	di, si
		add	di, 4
		mov	eax, [di]
		mov	[bp+var_20], eax
		mov	eax, [si]
		mov	[bp+var_24], eax
		lea	ax, [bp+var_24]
		push	ax
		lea	ax, [bp+var_20]
		push	ax
		push	ss
		lea	ax, [bp+var_28]
		push	ax
		call	Math_ArcTan2_54B0A
		add	sp, 8
		mov	ax, word ptr [bp+var_24+2]
		sar	ax, 0Fh
		or	al, al
		jz	short loc_5051
		mov	ax, word ptr [bp+var_20+2]
		sar	ax, 0Fh
		or	al, al
		jz	short loc_5047
		sub	[bp+var_28], 0B400h

loc_5045:				; CODE XREF: Angle_DeltaNormalized_A+BAj
		jmp	short loc_5051
; ���������������������������������������������������������������������������

loc_5047:				; CODE XREF: Angle_DeltaNormalized_A+A6j
		add	[bp+var_28], 0B400h
		jmp	short loc_5045
; ���������������������������������������������������������������������������

loc_5051:				; CODE XREF: Angle_DeltaNormalized_A+9Cj
					; Angle_DeltaNormalized_A:loc_5045j
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		sub	eax, [bp+var_8]
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0B400h
		jle	short loc_5085
		sub	[bp+var_C], 16800h
		jmp	short loc_5099
; ���������������������������������������������������������������������������

loc_5085:				; CODE XREF: Angle_DeltaNormalized_A+E4j
		cmp	[bp+var_C], 0FFFF4C00h
		jge	short loc_5099
		add	[bp+var_C], 16800h
		jmp	short $+2

loc_5099:				; CODE XREF: Angle_DeltaNormalized_A+EEj Angle_DeltaNormalized_A+F8j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_C]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Angle_DeltaNormalized_A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,46L — échange/négate conditionnellement une paire de dwords (vecteur 2D ou nombre
; complexe) selon flag : inversion de direction.
; ==============================================================================================
Vec_NegateSwapPair	proc far		; CODE XREF: AI_EscortPriorityReactionHandler_9A77+1A3P
					; Formation_GuidanceSolution+69CP

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		mov	eax, [di]
		mov	[bp+var_4], eax
		cmp	[bp+arg_2], 0
		jz	short loc_50DD
		mov	eax, [si+4]
		mov	[si], eax
		add	si, 4
		mov	eax, [bp+var_4]
		neg	eax
		mov	[si], eax
		jmp	short loc_50FB
; ���������������������������������������������������������������������������

loc_50DD:				; CODE XREF: Vec_NegateSwapPair+18j
		mov	di, si
		mov	ax, si
		add	ax, 4
		mov	[bp+var_6], ax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		neg	eax
		mov	[di], eax
		mov	eax, [bp+var_4]
		mov	[si+4],	eax

loc_50FB:				; CODE XREF: Vec_NegateSwapPair+2Ej
		pop	di
		pop	si
		leave
		retf
Vec_NegateSwapPair	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 169 lignes - LUE INTEGRALEMENT (a la demande de Remi). SYSTEME RWR (Radar Warning
; Receiver) A DEUX NIVEAUX, entierement decode. Parametre arg_4 selectionne le mode (1 ou 2).
; GARDE INITIALE : si arg_4==1, verifie flags_75 bit6 (modulateur de menace, deja documente) -
; si absent, sortie immediate (retourne 0, aucune alerte). CALCUL DU RATIO DE MENACE :
; Roster_SumAttributeB(liste) * 100 / Roster_SumAttributeA(liste) - vraisemblablement un
; pourcentage de verrouillage/frames de poursuite actives sur le total possible. Si ratio > 80
; (0x50) : declenche. Sinon, pour arg_4==2 : re-verifie flags_75 bit6 comme critere
; alternatif. Pour arg_4==1 supplementaire : compare entite+0x102+0x1A (portee/distance) a
; dword_7203D (seuil de portee capteur, deja connu) - si en dessous, declenche aussi. SI
; DECLENCHE : resout un objet via [entite+0x102->vtable+0]. VERIFICATION CRITIQUE DE
; CORRESPONDANCE JOUEUR : compare le champ +0x50 de cet objet a celui de word_722E6 (LE
; JOUEUR) - l'alerte radio NE SE DECLENCHE QUE SI LA MENACE CORRESPOND SPECIFIQUEMENT AU
; JOUEUR (var_B), pas generiquement pour n'importe quelle IA menacee. DEUX SOUS-TYPES D'ALERTE
; selon objet_resolu+0x63 : SI NON-ZERO (type A, probable 'missile tire/en approche') :
; appelle sub_6CCFF (mise a jour HUD/indicateur visuel avec un offset +0x5A sur l'objet
; resolu), PUIS SI var_B (correspond au joueur) : Radio_PlayMessage_CB45(joueur, code=9,
; categorie=1) - alerte sonore/vocale. Termine TOUJOURS par UIScreen_BuildWidgetTree_53A94
; (code 0) et pose flags_75 bit5 sur l'avion lie (meme bit deja documente ailleurs comme lie a
; la formation - reutilisation multi-contexte probable, ou lien reel avec rupture de formation
; en reaction a la menace, a confirmer). SI ZERO (type B, probable 'verrouillage radar
; simple') : SI var_B : Radio_PlayMessage_CB45(joueur, code=0xA, categorie=1) uniquement, sans
; mise a jour HUD ni bit pose. CONCLUSION : ceci est LE vrai mecanisme 'avertir en cas de
; danger' cherche - mais SPECIFIQUEMENT pour des menaces missile/radar verrouillees sur le
; JOUEUR, pas un avertissement generique de danger pour n'importe quelle IA.
; ==============================================================================================
AI_MissileThreatTrigger_A	proc far		; CODE XREF: seg008:322AP seg008:32F3P

var_B		= byte ptr -0Bh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	[bp+var_1], 0
		cmp	[bp+arg_4], 1
		jnz	short loc_5126
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jnz	short loc_5126
		jmp	loc_526A
; ���������������������������������������������������������������������������

loc_5126:				; CODE XREF: AI_MissileThreatTrigger_A+Ej AI_MissileThreatTrigger_A+22j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		mov	ax, [bx+60h]
		mov	dx, [bx+5Eh]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		push	ax
		push	dx
		call	Roster_SumAttributeB
		add	sp, 4
		movzx	eax, ax
		imul	eax, 64h
		push	eax
		push	large [bp+var_6]
		call	Roster_SumAttributeA
		add	sp, 4
		movzx	ebx, ax
		pop	eax
		cdq
		idiv	ebx
		cmp	eax, 50h ; 'P'
		jg	short loc_51A9
		cmp	[bp+arg_4], 2
		jnz	short loc_5185
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jnz	short loc_51A9

loc_5185:				; CODE XREF: AI_MissileThreatTrigger_A+70j
		cmp	[bp+arg_4], 1
		jnz	short loc_51AD
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		mov	eax, [bx+1Ah]
		cmp	eax, dword_7203D
		jge	short loc_51A3
		mov	ax, 1
		jmp	short loc_51A5
; ���������������������������������������������������������������������������

loc_51A3:				; CODE XREF: AI_MissileThreatTrigger_A+9Dj
		xor	ax, ax

loc_51A5:				; CODE XREF: AI_MissileThreatTrigger_A+A2j
		or	al, al
		jz	short loc_51AD

loc_51A9:				; CODE XREF: AI_MissileThreatTrigger_A+6Aj AI_MissileThreatTrigger_A+84j
		mov	[bp+var_1], 1

loc_51AD:				; CODE XREF: AI_MissileThreatTrigger_A+8Aj AI_MissileThreatTrigger_A+A8j
		cmp	[bp+var_1], 0
		jnz	short loc_51B6
		jmp	loc_526A
; ���������������������������������������������������������������������������

loc_51B6:				; CODE XREF: AI_MissileThreatTrigger_A+B2j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		cmp	word_722E6, 0
		jz	short loc_51EE
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		mov	al, [bx+50h]
		mov	bx, word_722E6
		cmp	al, [bx+50h]
		jnz	short loc_51EE
		mov	ax, 1
		jmp	short loc_51F0
; ���������������������������������������������������������������������������

loc_51EE:				; CODE XREF: AI_MissileThreatTrigger_A+D4j AI_MissileThreatTrigger_A+E8j
		xor	ax, ax

loc_51F0:				; CODE XREF: AI_MissileThreatTrigger_A+EDj
		mov	[bp+var_B], al
		les	bx, [bp+var_A]
		cmp	byte ptr es:[bx+63h], 0
		jz	short loc_5250
		mov	ax, word ptr [bp+var_A]
		add	ax, 5Ah	; 'Z'
		push	word ptr [bp+var_A+2]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		call	VROOMM_StubThunk_6CCFF
		add	sp, 6
		cmp	[bp+var_B], 0
		jz	short loc_5231
		push	1
		push	9
		push	word_722E6
		push	large [bp+arg_0]
		call	Radio_PlayMessage
		add	sp, 0Ah

loc_5231:				; CODE XREF: AI_MissileThreatTrigger_A+11Cj
		push	0
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		call	Combat_TeamOpposedCheckAndDispatch_53A94

loc_5240:
		add	sp, 4

loc_5243:
		les	bx, [bp+arg_0]

loc_5246:
		mov	bx, es:[bx+0Bh]
		or	byte ptr [bx+75h], 20h

loc_524E:
		jmp	short loc_526A
; ���������������������������������������������������������������������������

loc_5250:				; CODE XREF: AI_MissileThreatTrigger_A+FCj
		cmp	[bp+var_B], 0

loc_5254:
		jz	short loc_526A
		push	1
		push	0Ah
		push	word_722E6
		push	large [bp+arg_0]
		call	Radio_PlayMessage
		add	sp, 0Ah

loc_526A:				; CODE XREF: AI_MissileThreatTrigger_A+24j AI_MissileThreatTrigger_A+B4j ...
		mov	al, [bp+var_1]
		leave
		retf
AI_MissileThreatTrigger_A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,53L — négation d'un vecteur 3D (7 dwords, pattern similaire à sub_50AD) : inversion de
; direction vectorielle.
; ==============================================================================================
Vec3_Negate	proc far		; CODE XREF: seg008:09F6P

var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		mov	[bp+var_8], eax
		mov	eax, [si+4]
		mov	[bp+var_4], eax
		mov	si, [bp+arg_2]
		mov	eax, [si]
		mov	[bp+var_10], eax
		mov	eax, [si+4]
		mov	[bp+var_C], eax
		lea	ax, [bp+var_8]
		push	ax
		call	Weapon_ComputeVectorLength_561AF
		pop	cx
		lea	ax, [bp+var_10]
		push	ax
		call	Weapon_ComputeVectorLength_561AF
		pop	cx
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		sub	[bp+var_14], eax
		mov	ax, word ptr [bp+var_14+2]
		sar	ax, 0Fh
		pop	si
		leave
		retf
Vec3_Negate	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	Math_AngleBetweenVectors_552E1
		add	sp, 6
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,90L — clamp d'une valeur entre -limite et +limite (comparaisons signées successives) :
; borne une composante de position/angle.
; ==============================================================================================
Value_ClampSymmetric	proc far		; CODE XREF: AI_CombatDecision_Major+207p
					; AI_CombatDecision_Major+335p ...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_8]
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 0DDh ; '�'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		cmp	dword ptr [si],	0
		jle	short loc_5335
		mov	ax, 1
		jmp	short loc_5337
; ���������������������������������������������������������������������������

loc_5335:				; CODE XREF: Value_ClampSymmetric+29j
		xor	ax, ax

loc_5337:				; CODE XREF: Value_ClampSymmetric+2Ej
		or	al, al
		jz	short loc_5351
		mov	eax, [si]

loc_533E:
		cmp	eax, [bp+var_4]
		jge	short loc_5349
		mov	ax, 1
		jmp	short loc_534B
; ���������������������������������������������������������������������������

loc_5349:				; CODE XREF: Value_ClampSymmetric+3Dj
		xor	ax, ax

loc_534B:				; CODE XREF: Value_ClampSymmetric+42j
		or	al, al
		jz	short loc_537F
		jmp	short loc_5378
; ���������������������������������������������������������������������������

loc_5351:				; CODE XREF: Value_ClampSymmetric+34j
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	eax, [si]
		cmp	eax, [bp+var_4]
		jle	short loc_5372
		mov	ax, 1
		jmp	short loc_5374
; ���������������������������������������������������������������������������

loc_5372:				; CODE XREF: Value_ClampSymmetric+66j
		xor	ax, ax

loc_5374:				; CODE XREF: Value_ClampSymmetric+6Bj
		or	al, al
		jz	short loc_537F

loc_5378:				; CODE XREF: Value_ClampSymmetric+4Aj
		mov	eax, [si]
		mov	[bp+var_4], eax

loc_537F:				; CODE XREF: Value_ClampSymmetric+48j Value_ClampSymmetric+71j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Value_ClampSymmetric	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,329L — vérifie flags avion (+0x28D bit5), heading (+0xB0), chaîne de pointeurs
; cible/allié (+0x287/+0x289 — mêmes offsets que sub_3314), calcule distance de fermeture via
; sub_5828E, compare à seuil dword_7201C, positionne flag d'alerte bit4 à +0x28D : détection
; de menace/verrouillage entrant (missile threat warning).
; ==============================================================================================
AI_IncomingThreatWarning	proc far		; CODE XREF: AI_TopLevelThink+B8P

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
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= byte ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 5Ch
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Dh]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_53B1
		jmp	loc_5638
; ���������������������������������������������������������������������������

loc_53B1:				; CODE XREF: AI_IncomingThreatWarning+1Aj
		and	byte ptr es:[bx+28Dh], 0EFh
		cmp	byte ptr es:[bx+0B0h], 0Dh
		jg	short loc_53C2
		jmp	loc_5638
; ���������������������������������������������������������������������������

loc_53C2:				; CODE XREF: AI_IncomingThreatWarning+2Bj
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Pilot_SkillCheck_B0
		add	sp, 6
		or	al, al
		jnz	short loc_53D7
		jmp	loc_5638
; ���������������������������������������������������������������������������

loc_53D7:				; CODE XREF: AI_IncomingThreatWarning+40j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		mov	al, [bx+50h]
		mov	[bp+var_2], al
		xor	si, si
		mov	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+287h], 0
		jz	short loc_5411
		mov	bx, es:[bx+287h]
		mov	al, [bx+50h]
		cbw
		push	ax
		mov	al, [bp+var_2]
		cbw
		neg	ax
		pop	dx
		cmp	dx, ax
		jnz	short loc_5411
		mov	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+287h]
		jmp	short loc_5439
; ���������������������������������������������������������������������������

loc_5411:				; CODE XREF: AI_IncomingThreatWarning+5Ej AI_IncomingThreatWarning+73j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+289h], 0
		jz	short loc_5439
		mov	bx, es:[bx+289h]
		mov	al, [bx+50h]
		cbw
		push	ax
		mov	al, [bp+var_2]
		cbw
		neg	ax
		pop	dx
		cmp	dx, ax
		jnz	short loc_5439
		mov	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+289h]

loc_5439:				; CODE XREF: AI_IncomingThreatWarning+7Dj AI_IncomingThreatWarning+88j ...
		or	si, si
		jnz	short loc_5440
		jmp	loc_5638
; ���������������������������������������������������������������������������

loc_5440:				; CODE XREF: AI_IncomingThreatWarning+A9j
		mov	eax, [si+5Ah]
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 0
		jnz	short loc_5452
		jmp	loc_5638
; ���������������������������������������������������������������������������

loc_5452:				; CODE XREF: AI_IncomingThreatWarning+BBj
		les	bx, [bp+var_6]
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, 12h
		add	dx, bx
		mov	word ptr [bp+var_A+2], ax
		mov	word ptr [bp+var_A], dx
		cmp	[bp+var_A], 0
		jnz	short loc_5475
		jmp	loc_5638
; ���������������������������������������������������������������������������

loc_5475:				; CODE XREF: AI_IncomingThreatWarning+DEj
		les	bx, [bp+var_A]
		cmp	dword ptr es:[bx], 0
		jz	short loc_5488
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_548A
; ���������������������������������������������������������������������������

loc_5488:				; CODE XREF: AI_IncomingThreatWarning+EBj
		xor	ax, ax

loc_548A:				; CODE XREF: AI_IncomingThreatWarning+F4j
		cmp	ax, 800h
		jz	short loc_5492
		jmp	loc_5638
; ���������������������������������������������������������������������������

loc_5492:				; CODE XREF: AI_IncomingThreatWarning+FBj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+102h]
		mov	[bp+var_C], ax
		mov	[bp+var_10], 0
		les	bx, [bp+var_A]
		cmp	dword ptr es:[bx], 0
		jz	short loc_54D8
		push	0
		lea	ax, [bp+var_10]
		push	ax
		push	word ptr es:[bx+0Dh]
		push	[bp+var_C]
		push	large dword ptr	es:[bx]
		push	ss
		lea	ax, [bp+var_5C]
		push	ax
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 10h
		mov	dx, ss
		lea	ax, [bp+var_5C]
		jmp	short loc_54F5
; ���������������������������������������������������������������������������

loc_54D8:				; CODE XREF: AI_IncomingThreatWarning+11Bj
		mov	eax, dword_707E0
		mov	[bp+var_5C], eax
		mov	eax, dword_707E4
		mov	[bp+var_58], eax
		mov	eax, dword_707E8
		mov	[bp+var_54], eax
		mov	dx, ss
		lea	ax, [bp+var_5C]

loc_54F5:				; CODE XREF: AI_IncomingThreatWarning+144j
		mov	eax, [bp+var_5C]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_3C], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		call	Math_ApplyRotationHelperB_58828
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	di, es:[bx+102h]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_50], eax
		mov	eax, [di+4]
		mov	[bp+var_4C], eax
		mov	eax, [di+8]
		mov	[bp+var_48], eax

loc_5543:
		add	si, 12h

loc_5546:
		mov	eax, [si]
		sub	[bp+var_50], eax

loc_554D:
		mov	eax, [si+4]

loc_5551:
		sub	[bp+var_4C], eax
		mov	eax, [si+8]
		sub	[bp+var_48], eax
		push	large [bp+var_48]
		push	large [bp+var_4C]
		push	large [bp+var_50]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_18], eax
		mov	[bp+var_14], eax
		cmp	eax, dword_7201C
		jg	short loc_5589
		mov	ax, 1
		jmp	short loc_558B
; ���������������������������������������������������������������������������

loc_5589:				; CODE XREF: AI_IncomingThreatWarning+1F0j
		xor	ax, ax

loc_558B:				; CODE XREF: AI_IncomingThreatWarning+1F5j
		or	al, al
		jnz	short loc_5592
		jmp	loc_5638
; ���������������������������������������������������������������������������

loc_5592:				; CODE XREF: AI_IncomingThreatWarning+1FBj
		lea	ax, [bp+var_44]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		cmp	[bp+var_14], 0
		jle	short loc_55B3
		mov	ax, 1
		jmp	short loc_55B5
; ���������������������������������������������������������������������������

loc_55B3:				; CODE XREF: AI_IncomingThreatWarning+21Aj
		xor	ax, ax

loc_55B5:				; CODE XREF: AI_IncomingThreatWarning+21Fj
		or	al, al
		jz	short loc_55FA
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		mov	eax, [bx+20h]
		mov	edx, eax
		mov	ecx, [bp+var_14]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		lea	ax, [bp+var_28]
		push	ax
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		call	Math_ArcTan_54ADE
		add	sp, 6
		mov	eax, [bp+var_2C]
		jmp	short loc_5606
; ���������������������������������������������������������������������������

loc_55FA:				; CODE XREF: AI_IncomingThreatWarning+225j
		mov	[bp+var_30], 5A00h
		mov	eax, [bp+var_30]

loc_5606:				; CODE XREF: AI_IncomingThreatWarning+266j
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		imul	eax, 6
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	eax, [bp+var_1C]
		cmp	eax, [bp+var_38]
		jg	short loc_5629
		mov	ax, 1
		jmp	short loc_562B
; ���������������������������������������������������������������������������

loc_5629:				; CODE XREF: AI_IncomingThreatWarning+290j
		xor	ax, ax

loc_562B:				; CODE XREF: AI_IncomingThreatWarning+295j
		or	al, al
		jz	short loc_5638
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+28Dh], 10h

loc_5638:				; CODE XREF: AI_IncomingThreatWarning+1Cj AI_IncomingThreatWarning+2Dj ...
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Dh]
		shr	ax, 4
		and	ax, 1
		pop	di
		pop	si
		leave
		retf
AI_IncomingThreatWarning	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,63L — 1er du cluster 'cache capteur par frame' : teste bit0 de +0x28C, calcule via
; sub_5861 (distance) vs seuil dword_72039×256, cache résultat bit0 de +0x28D. Capteur caché :
; cible en portée.
; ==============================================================================================
AI_Sensor_TargetInRange	proc far		; CODE XREF: seg002:0042P seg002:017DP ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Ch]
		shr	ax, 6
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_56B7
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jnz	short loc_56A3
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		nop
		push	cs
		call	near ptr AI_Sensor_DistanceFromRef
		add	sp, 8
		mov	eax, dword_72039
		mov	[bp+var_8], eax
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jl	short loc_569D
		mov	ax, 1
		jmp	short loc_569F
; ���������������������������������������������������������������������������

loc_569D:				; CODE XREF: AI_Sensor_TargetInRange+4Cj
		xor	ax, ax

loc_569F:				; CODE XREF: AI_Sensor_TargetInRange+51j
		or	al, al
		jz	short loc_56AE

loc_56A3:				; CODE XREF: AI_Sensor_TargetInRange+29j
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+28Dh], 1
		jmp	short loc_56B7
; ���������������������������������������������������������������������������

loc_56AE:				; CODE XREF: AI_Sensor_TargetInRange+57j
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+28Dh], 0FEh

loc_56B7:				; CODE XREF: AI_Sensor_TargetInRange+18j AI_Sensor_TargetInRange+62j
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Dh]
		and	ax, 1
		leave
		retf
AI_Sensor_TargetInRange	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	large dword ptr	[bp+0Ah]
		nop
		push	cs
		call	near ptr AI_Sensor_InterceptFeasibleCached
		add	sp, 4
		mov	bx, [bp+6]
		mov	eax, dword_7204D
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,99L — teste bit7 de +0x28C, accumule une distance de fermeture (dword_7204D) via
; sub_378CA en boucle, compare au carburant/munitions restant (+0x1A), cache bit1 de +0x28D.
; Capteur caché : faisabilité d'interception. LUE INTEGRALEMENT (a la demande de Remi).
; PRECISION IMPORTANTE : c'est un CAPTEUR MIS EN CACHE, pas un calcul refait a chaque appel.
; Si bit7 de entite+0x28C est pose, retourne IMMEDIATEMENT le resultat CACHE (bit1 de
; entite+0x28D) sans aucun calcul. Sinon : lit un champ a entite+0xE5 (probable
; carburant/munitions restant, mis a l'echelle x4), l'accumule avec le resultat de
; Terrain_QueryAltitudeAt_378CA (position de l'entite + reference globale word_70474) dans
; dword_7204D ('distance de fermeture'), compare ce total au seuil entite_liee+0x1A - si
; depasse, met en cache 'infaisable' (bit1 pose) ; sinon 'faisable' (bit1 efface). Explique
; pourquoi cette fonction sert de garde peu couteuse dans plusieurs fonctions de score
; (MVRS_ID7/8) et dans MVRS_ID8_ApplyFuelGatedManeuver - la plupart des appels retournent un
; resultat en cache, le vrai calcul (avec requete de terrain) n'ayant lieu que lorsque bit7
; signale un rafraichissement necessaire.
; ==============================================================================================
AI_Sensor_InterceptFeasibleCached	proc far		; CODE XREF: seg002:0059P seg002:0194P ...

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
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Ch]
		shr	ax, 7
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_5702
		jmp	loc_57BB
; ���������������������������������������������������������������������������

loc_5702:				; CODE XREF: AI_Sensor_InterceptFeasibleCached+18j
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0E5h ; '�'
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		shl	eax, 2
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	dword_7204D, eax
		push	0
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_2C], eax
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_28], eax

loc_574F:
		mov	[bp+var_1C], 100h
		mov	eax, [bp+var_1C]
		mov	[bp+var_24], eax
		lea	ax, [bp+var_2C]
		push	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+102h]
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp+var_20]
		add	dword_7204D, eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		mov	eax, [bx+1Ah]
		cmp	eax, dword_7204D
		jge	short loc_57A1
		mov	ax, 1
		jmp	short loc_57A3
; ���������������������������������������������������������������������������

loc_57A1:				; CODE XREF: AI_Sensor_InterceptFeasibleCached+B5j
		xor	ax, ax

loc_57A3:				; CODE XREF: AI_Sensor_InterceptFeasibleCached+BAj
		or	al, al
		jz	short loc_57B2
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+28Dh], 2
		jmp	short loc_57BB
; ���������������������������������������������������������������������������

loc_57B2:				; CODE XREF: AI_Sensor_InterceptFeasibleCached+C0j
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+28Dh], 0FDh

loc_57BB:				; CODE XREF: AI_Sensor_InterceptFeasibleCached+1Aj AI_Sensor_InterceptFeasibleCached+CBj
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Dh]
		shr	ax, 1
		and	ax, 1
		leave
		retf
AI_Sensor_InterceptFeasibleCached	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,68L — cache à +0xED : appelle vtable[0x4C] (vecteur vitesse?) puis sub_5828E (magnitude)
; : capteur caché : norme de la vitesse propre.
; ==============================================================================================
AI_Sensor_OwnSpeed	proc far		; CODE XREF: AI_ThrottleController+18p
					; AI_GuidanceSolution_Major+1F2p ...

var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 0EDh ; '�'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_4]
		mov	al, es:[bx+28Ch]
		and	ax, 1
		or	al, al
		jnz	short loc_584F
		les	bx, [bp+arg_4]
		or	byte ptr es:[bx+28Ch], 1
		push	word ptr es:[bx+102h]
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	large [bp+var_18]
		push	large [bp+var_1C]
		push	large [bp+var_20]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	[bp+var_14], eax

loc_5842:
		mov	eax, [bp+var_14]
		les	bx, [bp+arg_4]
		mov	es:[bx+0EDh], eax

loc_584F:				; CODE XREF: AI_Sensor_OwnSpeed+2Ej
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
AI_Sensor_OwnSpeed	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,64L — cache à +0xF1 : appelle sub_4B805 sur position propre (+0xB) puis sub_5828E :
; capteur caché : distance/altitude par rapport à un point de référence.
; ==============================================================================================
AI_Sensor_DistanceFromRef	proc far		; CODE XREF: AI_Sensor_TargetInRange+36p AI_EvadeOrPursueSelector+DAp ...

var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 0F1h ; '�'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_4]
		mov	al, es:[bx+28Ch]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jnz	short loc_58E2
		les	bx, [bp+arg_4]
		or	byte ptr es:[bx+28Ch], 2
		push	word ptr es:[bx+0Bh]
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	FlightControl_ResolveNormalizedParam
		add	sp, 6
		push	large [bp+var_18]
		push	large [bp+var_1C]
		push	large [bp+var_20]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		les	bx, [bp+arg_4]
		mov	es:[bx+0F1h], eax

loc_58E2:				; CODE XREF: AI_Sensor_DistanceFromRef+30j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
AI_Sensor_DistanceFromRef	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,73L — cache à +0xFA : vtable[0x3C] (cap?) + sub_57C67, normalise l'angle (wraparound
; ±0xB400) : capteur caché : cap/bearing normalisé.
; ==============================================================================================
AI_Sensor_HeadingNormalized	proc far		; CODE XREF: AI_ThreatConeTest+8Ap
					; AI_ManeuverSolution_Major+45Ep ...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 0FAh ; '�'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_4]
		mov	al, es:[bx+28Ch]
		shr	ax, 4
		and	ax, 1
		or	al, al
		jnz	short loc_5993
		les	bx, [bp+arg_4]
		or	byte ptr es:[bx+28Ch], 10h
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	ss

loc_5942:
		lea	ax, [bp+var_C]
		push	ax
		call	AI_ComputeGeometrySolution_57C67
		add	sp, 6
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0B400h
		jle	short loc_596A
		sub	[bp+var_4], 16800h
		jmp	short loc_597E
; ���������������������������������������������������������������������������

loc_596A:				; CODE XREF: AI_Sensor_HeadingNormalized+6Aj
		cmp	[bp+var_4], 0FFFF4C00h
		jge	short loc_597E
		add	[bp+var_4], 16800h
		jmp	short $+2

loc_597E:				; CODE XREF: AI_Sensor_HeadingNormalized+74j AI_Sensor_HeadingNormalized+7Ej
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		les	bx, [bp+arg_4]
		mov	es:[bx+0FAh], eax

loc_5993:				; CODE XREF: AI_Sensor_HeadingNormalized+31j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
AI_Sensor_HeadingNormalized	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,57L — cache à +0xF6 : vtable[0x3C]+0xC + sub_552E1 : capteur caché : angle secondaire
; (tangage/roulis?).
; ==============================================================================================
AI_Sensor_SecondaryAngle	proc far		; CODE XREF: seg002:1016P seg003:0C99p ...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 0F6h ; '�'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_4]
		mov	al, es:[bx+28Ch]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jnz	short loc_5A1B
		les	bx, [bp+arg_4]
		or	byte ptr es:[bx+28Ch], 4
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		call	Math_AngleBetweenVectors_552E1
		add	sp, 6
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		les	bx, [bp+arg_4]
		mov	es:[bx+0F6h], eax

loc_5A1B:				; CODE XREF: AI_Sensor_SecondaryAngle+31j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
AI_Sensor_SecondaryAngle	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 10h
		mov	ax, [bp+0Ch]
		mov	dx, [bp+0Ah]
		add	dx, 0FEh ; '�'
		mov	[bp-6],	ax
		mov	[bp-8],	dx
		les	bx, [bp-8]
		mov	eax, es:[bx]
		mov	[bp-4],	eax
		les	bx, [bp+0Ah]
		mov	al, es:[bx+28Ch]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jnz	short loc_5ABA
		les	bx, [bp+0Ah]
		or	byte ptr es:[bx+28Ch], 8
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 10h
		push	ax
		les	bx, [bp+0Ah]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		call	Math_ArcTan2_54B0A
		add	sp, 8
		mov	eax, [bp-0Ch]
		mov	[bp-4],	eax
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		les	bx, [bp+0Ah]
		mov	es:[bx+0FEh], eax

loc_5ABA:				; CODE XREF: seg003:0ADEj
		mov	bx, [bp+6]
		mov	eax, [bp-4]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, ~306 lignes - JAMAIS DOCUMENTEE AVANT CETTE SESSION (methode de vtable, echappait a
; l'heuristique de detection malgre la couverture 100% des proc). CONFIRME etre le TICK IA
; MAITRE PAR ENTITE : slot [vtable+0xC] de la classe avion/pilote (table seg339, meme famille
; que Goal_TransferToWingman/Goal_SelectTransition). Sequence complete : (1)
; decompresse/recompresse un paquet de drapeaux d'etat individuels (+0x28C/+0x28D) ; (2)
; calcule deux SEUILS GLOBAUX partages dword_7203D (via test de portee sub_378CA + capteur
; AI_Sensor_SecondaryAngle_59A5) et dword_72039 (cosinus pondere, sub_54876) - ce sont les
; MEMES globales deja documentees comme consommees par AI_EvadeOrPursueSelector ; (3) met a
; jour le suivi de rotation/cap (+0x174-0x179) et un drapeau HUD d'aerofrein (flags_75 bit0) ;
; (4) calcule un SCORE DE MENACE global word_6D3BC, module par plusieurs bits de flags_75
; (bit6: divise ou double selon le contexte, ajustements +/-2/+/-4) ; (5) AIGUILLAGE FINAL :
; si flags_75 bit5 ET un bit de statut (+0x28B bit3) sont poses, appelle DIRECTEMENT
; Goal_FollowAllyExec_DAA9 (court-circuite tout le reste - mode 'suivre la formation') ; sinon
; appelle AI_TriggerBehaviorUpdate_5E53 (chemin normal). Point d'entree racine de toute la
; logique de decision IA d'une entite pour ce tick. DECOUVERTE NON RESOLUE : le bit5 de
; flags_75 (non documente avant), qui gate a la fois ce court-circuit et la disponibilite
; generale de la reflexion IA dans AI_TriggerBehaviorUpdate.
; ==============================================================================================
AIEntity_MasterTick_5ACC:				; DATA XREF: seg339:011Co
		push	bp
		mov	bp, sp
		sub	sp, 4Ch
		les	bx, [bp+6]
		and	byte ptr es:[bx+28Dh], 0DFh
		mov	al, 0
		and	byte ptr es:[bx+28Dh], 0F7h
		mov	dx, ax
		shl	al, 3
		or	es:[bx+28Dh], al
		and	dx, 1
		and	byte ptr es:[bx+28Ch], 0EFh
		mov	ax, dx
		shl	dl, 4
		or	es:[bx+28Ch], dl
		and	ax, 1
		and	byte ptr es:[bx+28Ch], 0FBh
		mov	dx, ax
		shl	al, 2
		or	es:[bx+28Ch], al
		and	dx, 1
		and	byte ptr es:[bx+28Ch], 0F7h
		mov	ax, dx
		shl	dl, 3
		or	es:[bx+28Ch], dl
		and	ax, 1
		and	byte ptr es:[bx+28Ch], 0FDh
		mov	dx, ax
		shl	al, 1
		or	es:[bx+28Ch], al
		and	dx, 1
		and	byte ptr es:[bx+28Ch], 0FEh
		mov	ax, dx
		or	es:[bx+28Ch], dl
		and	ax, 1
		and	byte ptr es:[bx+28Ch], 0DFh
		mov	dx, ax
		shl	al, 5
		or	es:[bx+28Ch], al
		and	dx, 1
		and	byte ptr es:[bx+28Ch], 7Fh
		mov	ax, dx
		shl	dl, 7
		or	es:[bx+28Ch], dl
		and	ax, 1
		and	byte ptr es:[bx+28Ch], 0BFh
		shl	al, 6
		or	es:[bx+28Ch], al
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 0E5h ; '�'
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	bx, [bp-4]
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		mov	dword_7203D, eax
		push	0
		mov	dword ptr [bp-0Ch], 0
		mov	eax, [bp-0Ch]
		mov	[bp-4Ch], eax
		mov	dword ptr [bp-10h], 0
		mov	eax, [bp-10h]
		mov	[bp-48h], eax
		mov	dword ptr [bp-14h], 100h
		mov	eax, [bp-14h]
		mov	[bp-44h], eax
		lea	ax, [bp-4Ch]
		push	ax
		les	bx, [bp+6]
		mov	ax, es:[bx+102h]
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp-18h]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp-18h]
		add	dword_7203D, eax
		les	bx, [bp+6]
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+82h]
		mov	dword_72039, eax
		push	large dword ptr	[bp+6]
		push	ss
		lea	ax, [bp-1Ch]
		push	ax
		push	cs
		call	near ptr AI_Sensor_SecondaryAngle
		add	sp, 8
		cmp	dword ptr [bp-1Ch], 0
		jle	short loc_5C2B
		mov	ax, 1
		jmp	short loc_5C2D
; ���������������������������������������������������������������������������

loc_5C2B:				; CODE XREF: seg003:0CA4j
		xor	ax, ax

loc_5C2D:				; CODE XREF: seg003:0CA9j
		or	al, al
		jz	short loc_5C75
		les	bx, [bp+6]
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+84h]
		sub	eax, dword_72039
		sar	eax, 1
		mov	[bp-20h], eax
		lea	ax, [bp-1Ch]
		push	ax
		push	ss
		lea	ax, [bp-24h]
		push	ax
		call	Math_Cos_54876
		add	sp, 6
		mov	eax, [bp-24h]
		imul	eax, [bp-20h]
		mov	[bp-28h], eax
		mov	[bp-2Ch], eax
		sar	eax, 8
		add	dword_72039, eax

loc_5C75:				; CODE XREF: seg003:0CAFj
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 175h
		mov	[bp-2Eh], ax
		mov	[bp-30h], dx
		les	bx, [bp-30h]
		mov	eax, es:[bx]
		mov	[bp-34h], eax
		add	eax, dword_70458
		mov	[bp-38h], eax
		mov	[bp-3Ch], eax
		mov	[bp-40h], eax
		mov	eax, [bp-40h]
		les	bx, [bp+6]
		mov	es:[bx+175h], eax
		mov	al, es:[bx+174h]
		and	ax, 1
		or	al, al
		jz	short loc_5CFC
		mov	eax, es:[bx+175h]
		sar	eax, 8
		movzx	edx, byte ptr es:[bx+179h]
		test	eax, edx
		jnz	short loc_5CD5
		mov	ax, 1
		jmp	short loc_5CD7
; ���������������������������������������������������������������������������

loc_5CD5:				; CODE XREF: seg003:0D4Ej
		xor	ax, ax

loc_5CD7:				; CODE XREF: seg003:0D53j
		and	ax, 1
		les	bx, [bp+6]
		and	byte ptr es:[bx+174h], 0FEh
		mov	dx, ax
		or	es:[bx+174h], al
		and	dx, 1
		and	byte ptr es:[bx+174h], 0FDh
		shl	dl, 1
		or	es:[bx+174h], dl
		jmp	short $+2

loc_5CFC:				; CODE XREF: seg003:0D38j
		les	bx, [bp+6]
		mov	al, es:[bx+174h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jz	short loc_5D5A
		mov	eax, es:[bx+175h]
		sar	eax, 8
		mov	dl, es:[bx+179h]
		mov	dh, 0
		sar	dx, 1
		movsx	edx, dx
		test	eax, edx
		jnz	short loc_5D2F
		mov	ax, 1
		jmp	short loc_5D31
; ���������������������������������������������������������������������������

loc_5D2F:				; CODE XREF: seg003:0DA8j
		xor	ax, ax

loc_5D31:				; CODE XREF: seg003:0DADj
		and	ax, 1
		les	bx, [bp+6]
		and	byte ptr es:[bx+174h], 0FBh
		mov	dx, ax
		shl	al, 2
		or	es:[bx+174h], al
		and	dx, 1
		and	byte ptr es:[bx+174h], 0F7h
		shl	dl, 3
		or	es:[bx+174h], dl
		jmp	short $+2

loc_5D5A:				; CODE XREF: seg003:0D8Cj
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+7]
		call	HUD_EncodeInstruments
		add	sp, 4
		les	bx, [bp+6]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		and	ax, 1
		and	ax, 1
		mov	bx, [bp+6]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr AI_Sensor_InterceptFeasibleCached
		add	sp, 4
		or	al, al
		jz	short loc_5DA1
		add	word_6D3BC, 2

loc_5DA1:				; CODE XREF: seg003:0E1Aj
		les	bx, [bp+6]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jz	short loc_5DC0
		mov	dx, 2
		mov	ax, word_6D3BC
		imul	dx
		mov	word_6D3BC, ax

loc_5DC0:				; CODE XREF: seg003:0E33j
		les	bx, [bp+6]
		mov	al, es:[bx+28Bh]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_5DEE
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jz	short loc_5DEE
		push	large dword ptr	[bp+6]
		call	Goal_FollowAllyExec
		jmp	short loc_5DF7
; ���������������������������������������������������������������������������

loc_5DEE:				; CODE XREF: seg003:0E50j seg003:0E61j
		push	large dword ptr	[bp+6]
		nop
		push	cs
		call	near ptr AI_TriggerBehaviorUpdate

loc_5DF7:				; CODE XREF: seg003:0E6Cj
		add	sp, 4
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr AI_Sensor_InterceptFeasibleCached
		add	sp, 4
		or	al, al
		jz	short loc_5E0E
		sub	word_6D3BC, 4

loc_5E0E:				; CODE XREF: seg003:0E87j
		les	bx, [bp+6]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jz	short loc_5E2E
		mov	bx, 4
		mov	ax, word_6D3BC
		cwd
		idiv	bx
		mov	word_6D3BC, ax

loc_5E2E:				; CODE XREF: seg003:0EA0j
		mov	ax, word_6D3BC
		shl	ax, 1
		mov	word_6D3BC, ax
		les	bx, [bp+6]
		and	byte ptr es:[bx+28Bh], 0FDh
		mov	al, 0
		and	byte ptr es:[bx+28Dh], 7Fh
		shl	al, 7
		or	es:[bx+28Dh], al
		mov	al, 1
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,51L — nettoie flag bit2 de +0x28B ; si bit7 de +0x28B et pas bit5 de +0x75, invoque
; sub_814C (comportement IA) ; sinon si cible (+0xD) existe, appelle sub_6AB54 et notifie via
; vtable[0] : déclencheur de mise à jour comportementale IA / notification d'état.
; ==============================================================================================
AI_TriggerBehaviorUpdate	proc far		; CODE XREF: seg003:0E74p

var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+28Bh], 0FBh
		mov	al, es:[bx+28Bh]
		shr	ax, 7
		and	ax, 1
		or	al, al
		jz	short loc_5E92
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5E92
		push	large [bp+arg_0]
		call	AI_TopLevelThink
		add	sp, 4
		jmp	short locret_5ECC
; ���������������������������������������������������������������������������

loc_5E92:				; CODE XREF: AI_TriggerBehaviorUpdate+1Cj AI_TriggerBehaviorUpdate+2Fj
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 7
		and	ax, 1
		or	al, al
		jz	short locret_5ECC
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short locret_5ECC
		push	large dword ptr	es:[bx+0Dh]
		call	VROOMM_StubThunk_6AB54
		add	sp, 4
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bp+var_1]
		mov	[bx+20h], al

locret_5ECC:				; CODE XREF: AI_TriggerBehaviorUpdate+3Dj AI_TriggerBehaviorUpdate+4Fj ...
		leave
		retf
AI_TriggerBehaviorUpdate	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,103L — calcule un vecteur relatif via vtable[0x3C]+sub_58768+sub_5593A+sub_549A6,
; normalise l'angle résultant (wraparound ±0xB400) : calcul de relèvement (bearing) vers un
; point de référence.
; ==============================================================================================
AI_ComputeBearingToRef	proc far		; CODE XREF: AI_ManeuverSolution_Major+1B5p
					; AI_GuidanceSolution_Major+528p ...

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
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_8]
		mov	eax, [si]
		mov	[bp+var_24], eax
		mov	eax, [si+4]
		mov	[bp+var_20], eax
		mov	eax, [si+8]
		mov	[bp+var_1C], eax
		les	bx, [bp+arg_4]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_20], eax
		lea	ax, [bp+var_24]
		push	ax
		call	Targeting_LineOfSightCheck_5593A
		pop	cx
		lea	ax, [bp+var_24]
		push	ax
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		call	Math_ArcCos_549A6
		add	sp, 6
		cmp	[bp+var_1C], 0
		jge	short loc_5F46
		mov	ax, 1
		jmp	short loc_5F48
; ���������������������������������������������������������������������������

loc_5F46:				; CODE XREF: AI_ComputeBearingToRef+71j
		xor	ax, ax

loc_5F48:				; CODE XREF: AI_ComputeBearingToRef+76j
		or	al, al
		jz	short loc_5F88
		cmp	[bp+var_8], 0
		jl	short loc_5F58
		mov	ax, 1
		jmp	short loc_5F5A
; ���������������������������������������������������������������������������

loc_5F58:				; CODE XREF: AI_ComputeBearingToRef+83j
		xor	ax, ax

loc_5F5A:				; CODE XREF: AI_ComputeBearingToRef+88j
		or	al, al
		jz	short loc_5F72
		mov	eax, 0B400h
		sub	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		jmp	short loc_5F84
; ���������������������������������������������������������������������������

loc_5F72:				; CODE XREF: AI_ComputeBearingToRef+8Ej
		mov	eax, 0FFFF4C00h
		sub	eax, [bp+var_8]
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax

loc_5F84:				; CODE XREF: AI_ComputeBearingToRef+A2j
		mov	[bp+var_8], eax

loc_5F88:				; CODE XREF: AI_ComputeBearingToRef+7Cj
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_8]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
AI_ComputeBearingToRef	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,285L — LOI DE CONTROLE IA DE LA VITESSE (poursuite de cible). Objet pilote = arg_0 far
; ptr ; JDYN = es:[arg_0+0x0B] (meme chemin que PhysicsTicks). Lit : jdyn[0x82] (u16, def 100)
; = PLANCHER de la vitesse de consigne (var_4 = max(var_4, jdyn[0x82]<<8), L2044-2070) ;
; jdyn[0x80] (u16, def 500) = PLAFOND / cible haute : quand la distance a la cible > arg_6,
; interpole var_4 vers jdyn[0x80]<<8 (poids = dist_residuelle/3000, clamp 1.0, loc_610A) ou
; plafonne a jdyn[0x80]<<8 (loc_61AB). Branche cible-proche (loc_61D0) : deceleration via
; dword_72039. Resultat -> sub_6250 (AI_ThrottleController). CONFIRME : jdyn[0x80]/[0x82] =
; vitesses IA max/min de poursuite, PAS des params de cellule.
; ==============================================================================================
AI_InterceptSpeedControlLaw	proc far		; CODE XREF: AI_InterceptSpeedCmd_HUD+Fp

var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= word ptr -7Eh
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= word ptr -30h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= word ptr -1Eh
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 96h
		push	si
		push	di
		mov	di, [bp+arg_4]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_72], eax
		mov	eax, [si+4]
		mov	[bp+var_6E], eax
		mov	eax, [si+8]
		mov	[bp+var_6A], eax
		lea	ax, [bp+var_72]
		push	ax
		push	di
		push	ss
		lea	ax, [bp+var_7E]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		lea	ax, [bp+var_7E]
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	Targeting_ComputeGeometryHelperA_5505B
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+82h]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jle	short loc_601B
		mov	ax, 1
		jmp	short loc_601D
; ���������������������������������������������������������������������������

loc_601B:				; CODE XREF: AI_InterceptSpeedControlLaw+79j
		xor	ax, ax

loc_601D:				; CODE XREF: AI_InterceptSpeedControlLaw+7Ej
		or	al, al
		jz	short loc_6044
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+82h]
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax

loc_6044:				; CODE XREF: AI_InterceptSpeedControlLaw+84j
		mov	si, di
		add	si, 12h
		les	bx, [bp+arg_0]
		mov	di, es:[bx+102h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_8A], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_86], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_82], eax
		lea	ax, [bp+var_72]
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		push	ss
		lea	ax, [bp+var_96]
		push	ax
		call	Targeting_ComputeGeometryHelperB_5517F
		add	sp, 8
		mov	eax, [bp+var_96]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_82], eax
		push	eax
		push	large [bp+var_86]
		push	large [bp+var_8A]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		sar	eax, 8
		mov	[bp+var_14], eax
		cmp	eax, [bp+arg_6]
		jg	short loc_60DF
		jmp	loc_61D0
; ���������������������������������������������������������������������������

loc_60DF:				; CODE XREF: AI_InterceptSpeedControlLaw+13Fj
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+80h]
		mov	[bp+var_1E], ax
		movsx	eax, [bp+var_1E]
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jle	short loc_6101
		mov	ax, 1
		jmp	short loc_6103
; ���������������������������������������������������������������������������

loc_6101:				; CODE XREF: AI_InterceptSpeedControlLaw+15Fj
		xor	ax, ax

loc_6103:				; CODE XREF: AI_InterceptSpeedControlLaw+164j
		or	al, al
		jnz	short loc_610A
		jmp	loc_61AB
; ���������������������������������������������������������������������������

loc_610A:				; CODE XREF: AI_InterceptSpeedControlLaw+16Aj
		mov	eax, [bp+var_14]
		sub	eax, [bp+arg_6]
		mov	[bp+var_22], eax
		shl	eax, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_10], eax
		mov	[bp+var_2A], 0BB800h
		mov	eax, [bp+var_10]
		mov	edx, eax
		mov	ecx, [bp+var_2A]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 100h
		jle	short loc_6157
		mov	ax, 1
		jmp	short loc_6159
; ���������������������������������������������������������������������������

loc_6157:				; CODE XREF: AI_InterceptSpeedControlLaw+1B5j
		xor	ax, ax

loc_6159:				; CODE XREF: AI_InterceptSpeedControlLaw+1BAj
		or	al, al
		jz	short loc_616D
		mov	[bp+var_2E], 100h
		mov	eax, [bp+var_2E]
		mov	[bp+var_10], eax

loc_616D:				; CODE XREF: AI_InterceptSpeedControlLaw+1C0j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+80h]
		mov	[bp+var_30], ax
		movsx	eax, [bp+var_30]
		shl	eax, 8
		sub	eax, [bp+var_4]
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_38]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_4]
		jmp	loc_6232
; ���������������������������������������������������������������������������

loc_61AB:				; CODE XREF: AI_InterceptSpeedControlLaw+16Cj
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+80h]
		mov	[bp+var_3A], ax
		movsx	eax, [bp+var_3A]
		shl	eax, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_10], eax
		jmp	short loc_6236
; ���������������������������������������������������������������������������

loc_61D0:				; CODE XREF: AI_InterceptSpeedControlLaw+141j
		mov	eax, dword_72039
		mov	[bp+var_42], eax
		shl	eax, 8
		mov	edx, [bp+var_4]
		sub	edx, eax
		mov	[bp+var_46], edx
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4A]
		imul	eax, [bp+var_4E]
		mov	[bp+var_52], eax
		mov	[bp+var_56], eax
		mov	eax, [bp+arg_6]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_56]
		cdq
		idiv	[bp+var_5A]
		mov	[bp+var_5E], eax
		mov	[bp+var_62], eax
		mov	[bp+var_10], eax
		mov	eax, dword_72039
		mov	[bp+var_66], eax
		shl	eax, 8

loc_6232:				; CODE XREF: AI_InterceptSpeedControlLaw+20Dj
		add	[bp+var_10], eax

loc_6236:				; CODE XREF: AI_InterceptSpeedControlLaw+233j
		mov	eax, [bp+var_10]
		sar	eax, 8
		push	eax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_ThrottleController
		add	sp, 8
		pop	di
		pop	si
		leave
		retf
AI_InterceptSpeedControlLaw	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,111L — récupère la vitesse propre via sub_57CA (capteur caché), calcule l'écart à la
; vitesse de consigne /5, seuils à ±0x500/0xFB00, retourne une commande de manette des gaz
; discrète bornée [-1,10] (throttle bang-bang) : contrôleur de manette des gaz IA.
; ==============================================================================================
AI_ThrottleController	proc far		; CODE XREF: AI_InterceptSpeedControlLaw+2ABp AI_ThrottleCmd_HUD+Cp

var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		mov	eax, [bp+arg_4]
		mov	[bp+var_8], eax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs
		call	near ptr AI_Sensor_OwnSpeed
		add	sp, 8
		mov	eax, [bp+var_8]
		shl	eax, 8
		sub	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	ebx, 5
		cdq
		idiv	ebx
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 500h
		jl	short loc_62A0
		mov	ax, 1
		jmp	short loc_62A2
; ���������������������������������������������������������������������������

loc_62A0:				; CODE XREF: AI_ThrottleController+49j
		xor	ax, ax

loc_62A2:				; CODE XREF: AI_ThrottleController+4Ej
		or	al, al
		jz	short loc_62B4
		mov	[bp+var_18], 0A00h
		mov	eax, [bp+var_18]
		jmp	short loc_62EF
; ���������������������������������������������������������������������������

loc_62B4:				; CODE XREF: AI_ThrottleController+54j
		cmp	[bp+var_4], 0FFFFFB00h
		jle	short loc_62C3
		mov	ax, 1
		jmp	short loc_62C5
; ���������������������������������������������������������������������������

loc_62C3:				; CODE XREF: AI_ThrottleController+6Cj
		xor	ax, ax

loc_62C5:				; CODE XREF: AI_ThrottleController+71j
		or	al, al
		jz	short loc_62E3
		mov	[bp+var_1C], 500h
		mov	eax, [bp+var_1C]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_4]
		add	[bp+var_14], eax
		jmp	short loc_62F3
; ���������������������������������������������������������������������������

loc_62E3:				; CODE XREF: AI_ThrottleController+77j
		mov	[bp+var_20], 0FFFFFF00h
		mov	eax, [bp+var_20]

loc_62EF:				; CODE XREF: AI_ThrottleController+62j
		mov	[bp+var_14], eax

loc_62F3:				; CODE XREF: AI_ThrottleController+91j
		cmp	[bp+var_14], 0
		jge	short loc_6308
		mov	eax, [bp+var_14]
		add	eax, 0FFFFFF80h
		sar	eax, 8
		jmp	short loc_6316
; ���������������������������������������������������������������������������

loc_6308:				; CODE XREF: AI_ThrottleController+A8j
		mov	eax, [bp+var_14]
		add	eax, 80h ; '�'
		sar	eax, 8

loc_6316:				; CODE XREF: AI_ThrottleController+B6j
		mov	dx, ax
		cmp	dx, 0FFFFh
		jge	short loc_6322
		mov	dx, 0FFFFh
		jmp	short loc_632A
; ���������������������������������������������������������������������������

loc_6322:				; CODE XREF: AI_ThrottleController+CBj
		cmp	dx, 0Ah
		jle	short loc_632A
		mov	dx, 0Ah

loc_632A:				; CODE XREF: AI_ThrottleController+D0j AI_ThrottleController+D5j
		mov	al, dl
		leave
		retf
AI_ThrottleController	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,42L — wrapper : appelle sub_6250 (throttle), stocke la commande dans le HUD/panneau
; (+0x1E via pointeur +7), positionne un bit audio/warning (+0x1C bit5) selon détection ennemi
; (+0x75 bit0).
; ==============================================================================================
AI_ThrottleCmd_HUD	proc far		; CODE XREF: AI_SpeedManeuverDecision+5Cp
					; AI_EscortPriorityReactionHandler_9A77+280P ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_ThrottleController
		add	sp, 8
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Eh], al
		cmp	byte ptr es:[bx+1Eh], 0FFh
		jnz	short loc_6363
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		and	ax, 1
		xor	al, 1
		jmp	short loc_6370
; ���������������������������������������������������������������������������

loc_6363:				; CODE XREF: AI_ThrottleCmd_HUD+22j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		and	ax, 1

loc_6370:				; CODE XREF: AI_ThrottleCmd_HUD+33j
		and	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		pop	bp
		retf
AI_ThrottleCmd_HUD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,43L — variante de sub_632E utilisant sub_5F9B (contrôle vitesse d'interception) au lieu
; de sub_6250 direct : même pattern de sortie HUD/audio.
; ==============================================================================================
AI_InterceptSpeedCmd_HUD	proc far		; CODE XREF: AI_InterceptDispatcher+2Bp seg008:2D27P

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		push	large [bp+arg_6]
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_InterceptSpeedControlLaw
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Eh], al
		cmp	byte ptr es:[bx+1Eh], 0FFh
		jnz	short loc_63C0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		and	ax, 1
		xor	al, 1
		jmp	short loc_63CD
; ���������������������������������������������������������������������������

loc_63C0:				; CODE XREF: AI_InterceptSpeedCmd_HUD+25j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		and	ax, 1

loc_63CD:				; CODE XREF: AI_InterceptSpeedCmd_HUD+36j
		and	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		pop	bp
		retf
AI_InterceptSpeedCmd_HUD	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+0Eh]
		mov	eax, [si]
		mov	[bp-8],	eax
		mov	[bp-4],	eax
		mov	eax, [bp-4]
		mov	edx, eax
		mov	ecx, dword_7201C
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-4],	eax
		cmp	dword ptr [bp-4], 100h
		jle	short loc_6424
		mov	ax, 1
		jmp	short loc_6426
; ���������������������������������������������������������������������������

loc_6424:				; CODE XREF: seg003:149Dj
		xor	ax, ax

loc_6426:				; CODE XREF: seg003:14A2j
		or	al, al
		jz	short loc_6438
		mov	dword ptr [bp-0Ch], 100h
		mov	eax, [bp-0Ch]
		jmp	short loc_6452
; ���������������������������������������������������������������������������

loc_6438:				; CODE XREF: seg003:14A8j
		mov	eax, [bp-4]
		cmp	eax, dword_70458
		jge	short loc_6448
		mov	ax, 1
		jmp	short loc_644A
; ���������������������������������������������������������������������������

loc_6448:				; CODE XREF: seg003:14C1j
		xor	ax, ax

loc_644A:				; CODE XREF: seg003:14C6j
		or	al, al
		jz	short loc_6456
		mov	eax, dword_70458

loc_6452:				; CODE XREF: seg003:14B6j
		mov	[bp-4],	eax

loc_6456:				; CODE XREF: seg003:14CCj
		mov	bx, [bp+6]
		mov	eax, [bp-4]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,189L — capteur caché bit3 de +0x28D : récupère/cache la vitesse d'une cible (via
; pointeur +0x104 → vtable[0x18], fallback sur globals dword_707E0/4/8) dans dword_72041/45/49
; (globals 'vitesse cible courante'), option vitesse propre. Copie le résultat dans un buffer
; de sortie (alloue via sub_658 si absent) : cache global de la vitesse de la cible
; verrouillée.
; ==============================================================================================
AI_Sensor_TargetVelocityCache	proc far		; CODE XREF: AI_ManeuverSolution_Major+23p AI_InterceptDispatcher+A5p ...

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
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		mov	cx, [bp+arg_8]
		les	bx, [bp+arg_4]
		mov	al, es:[bx+28Dh]
		shr	ax, 3
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_648A
		jmp	loc_65D7
; ���������������������������������������������������������������������������

loc_648A:				; CODE XREF: AI_Sensor_TargetVelocityCache+1Cj
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	dword_72041, eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	dword_72045, eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	dword_72049, eax
		or	cx, cx
		jnz	short loc_64C1
		jmp	loc_6584
; ���������������������������������������������������������������������������

loc_64C1:				; CODE XREF: AI_Sensor_TargetVelocityCache+53j
		cmp	dword ptr es:[bx+104h],	0
		jnz	short loc_64CD
		jmp	loc_6584
; ���������������������������������������������������������������������������

loc_64CD:				; CODE XREF: AI_Sensor_TargetVelocityCache+5Fj
		les	bx, es:[bx+104h]
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, 12h
		add	dx, bx
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		cmp	[bp+var_10], 0
		jnz	short loc_64F2
		jmp	loc_6584
; ���������������������������������������������������������������������������

loc_64F2:				; CODE XREF: AI_Sensor_TargetVelocityCache+84j
		mov	[bp+var_12], cx
		mov	[bp+var_16], 0
		les	bx, [bp+var_10]
		cmp	dword ptr es:[bx], 0
		jz	short loc_6530
		push	0
		lea	ax, [bp+var_16]
		push	ax
		push	word ptr es:[bx+0Dh]
		push	[bp+var_12]
		push	large dword ptr	es:[bx]
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 10h
		mov	dx, ss
		lea	ax, [bp+var_22]
		jmp	short loc_654D
; ���������������������������������������������������������������������������

loc_6530:				; CODE XREF: AI_Sensor_TargetVelocityCache+9Cj
		mov	eax, dword_707E0
		mov	[bp+var_22], eax
		mov	eax, dword_707E4
		mov	[bp+var_1E], eax
		mov	eax, dword_707E8
		mov	[bp+var_1A], eax
		mov	dx, ss
		lea	ax, [bp+var_22]

loc_654D:				; CODE XREF: AI_Sensor_TargetVelocityCache+C5j
		mov	eax, [bp+var_22]
		mov	dword_72041, eax
		mov	eax, [bp+var_1E]
		mov	dword_72045, eax
		mov	eax, [bp+var_1A]
		mov	dword_72049, eax
		les	bx, [bp+arg_4]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	4F91h
		call	Math_ApplyRotationHelperB_58828
		add	sp, 4

loc_6584:				; CODE XREF: AI_Sensor_TargetVelocityCache+55j AI_Sensor_TargetVelocityCache+61j ...
		mov	eax, dword_72041
		or	eax, dword_72045
		or	eax, dword_72049
		jnz	short loc_6599
		mov	ax, 1
		jmp	short loc_659B
; ���������������������������������������������������������������������������

loc_6599:				; CODE XREF: AI_Sensor_TargetVelocityCache+129j
		xor	ax, ax

loc_659B:				; CODE XREF: AI_Sensor_TargetVelocityCache+12Ej
		or	al, al
		jz	short loc_65CE
		les	bx, [bp+arg_4]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	dword_72041, eax
		mov	eax, [si+4]
		mov	dword_72045, eax
		mov	eax, [si+8]
		mov	dword_72049, eax

loc_65CE:				; CODE XREF: AI_Sensor_TargetVelocityCache+134j
		les	bx, [bp+arg_4]
		or	byte ptr es:[bx+28Dh], 8

loc_65D7:				; CODE XREF: AI_Sensor_TargetVelocityCache+1Ej
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_65E2
		mov	ax, si
		jmp	short loc_65EC
; ���������������������������������������������������������������������������

loc_65E2:				; CODE XREF: AI_Sensor_TargetVelocityCache+173j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_65EC:				; CODE XREF: AI_Sensor_TargetVelocityCache+177j
		or	ax, ax
		jz	short loc_660B
		mov	eax, dword_72041
		mov	[si], eax
		mov	eax, dword_72045
		mov	[si+4],	eax
		mov	eax, dword_72049
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_660D
; ���������������������������������������������������������������������������

loc_660B:				; CODE XREF: AI_Sensor_TargetVelocityCache+185j
		mov	ax, si

loc_660D:				; CODE XREF: AI_Sensor_TargetVelocityCache+1A0j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
AI_Sensor_TargetVelocityCache	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,162L — vérifie vitesse verticale (chute) et timer de menace (dword_7203D) : si critique,
; déclenche manoeuvre d'urgence via sub_7E18 (virage vers cap 0x1E00, taux 0xA) + code HUD
; 0x0A ; sinon évalue bearing (sub_59A5)/distance (sub_5861) vs seuil pour choisir code HUD 1
; ou 0xA. Sélecteur de manoeuvre évasion/poursuite avec signalisation HUD, retourne booléen
; (manoeuvre déclenchée).
; ==============================================================================================
AI_EvadeOrPursueSelector	proc far		; CODE XREF: seg008:324FP

var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	si, [bx]
		add	si, 8
		mov	eax, [si]
		mov	[bp+var_24], eax
		mov	eax, [si+4]
		mov	[bp+var_20], eax
		mov	eax, [si+8]
		mov	[bp+var_1C], eax
		lea	si, [bp+var_24]
		add	si, 8
		cmp	dword ptr [si],	0
		jle	short loc_6651
		mov	ax, 1
		jmp	short loc_6653
; ���������������������������������������������������������������������������

loc_6651:				; CODE XREF: AI_EvadeOrPursueSelector+34j
		xor	ax, ax

loc_6653:				; CODE XREF: AI_EvadeOrPursueSelector+39j
		or	al, al
		jz	short loc_66BC
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		mov	eax, [bx+1Ah]
		cmp	eax, dword_7203D
		jle	short loc_666F
		mov	ax, 1
		jmp	short loc_6671
; ���������������������������������������������������������������������������

loc_666F:				; CODE XREF: AI_EvadeOrPursueSelector+52j
		xor	ax, ax

loc_6671:				; CODE XREF: AI_EvadeOrPursueSelector+57j
		or	al, al
		jz	short loc_66BC
		push	0Ah
		mov	[bp+var_4], 1E00h
		lea	ax, [bp+var_4]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_TurnToBearingCmd
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		and	ax, 1
		and	ax, 1
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		mov	byte ptr es:[bx+1Eh], 0Ah
		mov	al, 1
		jmp	loc_676C
; ���������������������������������������������������������������������������

loc_66BC:				; CODE XREF: AI_EvadeOrPursueSelector+3Fj AI_EvadeOrPursueSelector+5Dj
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs
		call	near ptr AI_Sensor_SecondaryAngle
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jge	short loc_66E0
		mov	ax, 1
		jmp	short loc_66E2
; ���������������������������������������������������������������������������

loc_66E0:				; CODE XREF: AI_EvadeOrPursueSelector+C3j
		xor	ax, ax

loc_66E2:				; CODE XREF: AI_EvadeOrPursueSelector+C8j
		or	al, al
		jz	short loc_6721
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		push	cs
		call	near ptr AI_Sensor_DistanceFromRef
		add	sp, 8
		mov	eax, dword_72039
		mov	[bp+var_14], eax
		shl	eax, 8
		cmp	eax, [bp+var_10]
		jge	short loc_670D
		mov	ax, 1
		jmp	short loc_670F
; ���������������������������������������������������������������������������

loc_670D:				; CODE XREF: AI_EvadeOrPursueSelector+F0j
		xor	ax, ax

loc_670F:				; CODE XREF: AI_EvadeOrPursueSelector+F5j
		or	al, al
		jz	short loc_6721
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 1
		jmp	short loc_672D
; ���������������������������������������������������������������������������

loc_6721:				; CODE XREF: AI_EvadeOrPursueSelector+CEj AI_EvadeOrPursueSelector+FBj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah

loc_672D:				; CODE XREF: AI_EvadeOrPursueSelector+109j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		and	ax, 1
		and	ax, 1
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		push	0Ah
		mov	[bp+var_18], 1E00h
		lea	ax, [bp+var_18]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_TurnToBearingCmd
		add	sp, 8
		mov	al, 0

loc_676C:				; CODE XREF: AI_EvadeOrPursueSelector+A3j
		pop	si
		leave
		retf
AI_EvadeOrPursueSelector	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,169L — combine bearing (sub_59A5), détection ennemi (+0x75 bit6), distance (sub_5861 vs
; dword_72039) et cap (sub_58F4 vs 0x3C00) pour décider si la cible est dans le cône
; d'engagement ; déclenche éventuellement virage d'évitement via sub_7E18(rate=0xA,
; angle=-0x1E00). Test 'cible dans le cône de tir/menace' + réaction évasive.
; ==============================================================================================
AI_ThreatConeTest	proc far		; CODE XREF: AI_CombatDecision_Major+CDp seg008:3309P

var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr AI_Sensor_SecondaryAngle
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 6
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_67C8
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr AI_Sensor_DistanceFromRef
		add	sp, 8
		mov	eax, dword_72039
		mov	[bp+var_C], eax
		shl	eax, 8
		cmp	eax, [bp+var_8]
		jge	short loc_67C2
		mov	ax, 1
		jmp	short loc_67C4
; ���������������������������������������������������������������������������

loc_67C2:				; CODE XREF: AI_ThreatConeTest+4Cj
		xor	ax, ax

loc_67C4:				; CODE XREF: AI_ThreatConeTest+51j
		or	al, al
		jz	short loc_67EF

loc_67C8:				; CODE XREF: AI_ThreatConeTest+2Aj
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		push	cs
		call	near ptr AI_Sensor_SecondaryAngle
		add	sp, 8
		cmp	[bp+var_10], 0
		jg	short loc_67E4
		mov	ax, 1
		jmp	short loc_67E6
; ���������������������������������������������������������������������������

loc_67E4:				; CODE XREF: AI_ThreatConeTest+6Ej
		xor	ax, ax

loc_67E6:				; CODE XREF: AI_ThreatConeTest+73j
		or	al, al
		jz	short loc_67EF
		mov	al, 1
		jmp	locret_68D2
; ���������������������������������������������������������������������������

loc_67EF:				; CODE XREF: AI_ThreatConeTest+57j AI_ThreatConeTest+79j
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	cs
		call	near ptr AI_Sensor_HeadingNormalized
		add	sp, 8
		mov	eax, [bp+var_18]
		or	eax, eax
		jge	short loc_680B
		neg	eax

loc_680B:				; CODE XREF: AI_ThreatConeTest+97j
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_14], eax
		cmp	[bp+var_4], 3C00h
		jle	short loc_6826
		mov	ax, 1
		jmp	short loc_6828
; ���������������������������������������������������������������������������

loc_6826:				; CODE XREF: AI_ThreatConeTest+B0j
		xor	ax, ax

loc_6828:				; CODE XREF: AI_ThreatConeTest+B5j
		or	al, al
		jz	short loc_6871
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jz	short loc_6871
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		and	ax, 1
		and	ax, 1
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		jmp	short loc_68D0
; ���������������������������������������������������������������������������

loc_6871:				; CODE XREF: AI_ThreatConeTest+BBj AI_ThreatConeTest+CFj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		and	ax, 1
		and	ax, 1
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 6
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_68D0
		push	0Ah
		mov	[bp+var_20], 0FFFFE200h
		lea	ax, [bp+var_20]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_TurnToBearingCmd
		add	sp, 8

loc_68D0:				; CODE XREF: AI_ThreatConeTest+100j
					; AI_ThreatConeTest+145j
		mov	al, 0

locret_68D2:				; CODE XREF: AI_ThreatConeTest+7Dj
		leave
		retf
AI_ThreatConeTest	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,74L — DECISION VITESSE/MANOEUVRE IA. JDYN = es:[arg_0+0x0B]. Seuil = (movsx jdyn[0x84]
; (i16, def 231) + dword_72039) / 2 ; si seuil<<8 > distance (AI_Sensor_DistanceFromRef) ->
; retourne 1 (maintien de vitesse). Sinon (loc_691C) : AI_ThrottleCmd_HUD(jdyn[0x80])
; (consigne = vitesse IA max) + AI_TurnToBearingCmd(rate=5, angle=0x500) -> retourne 0.
; jdyn[0x84] = vitesse de croisiere/manoeuvre IA (sert aussi de consigne throttle directe dans
; AI_IssueTurnAndThrottle_77171, ovr231).
; ==============================================================================================
AI_SpeedManeuverDecision	proc far		; CODE XREF: seg008:3372P seg008:33A0P

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr AI_Sensor_DistanceFromRef
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+84h]
		add	eax, dword_72039
		sar	eax, 1
		mov	[bp+var_8], eax
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jg	short loc_6912
		mov	ax, 1
		jmp	short loc_6914
; ���������������������������������������������������������������������������

loc_6912:				; CODE XREF: AI_SpeedManeuverDecision+37j
		xor	ax, ax

loc_6914:				; CODE XREF: AI_SpeedManeuverDecision+3Cj
		or	al, al
		jz	short loc_691C
		mov	al, 1
		jmp	short locret_6975
; ���������������������������������������������������������������������������

loc_691C:				; CODE XREF: AI_SpeedManeuverDecision+42j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+80h]
		push	eax
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_ThrottleCmd_HUD
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		and	ax, 1
		and	ax, 1
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		push	5
		mov	[bp+var_C], 500h
		lea	ax, [bp+var_C]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_TurnToBearingCmd
		add	sp, 8
		mov	al, 0

locret_6975:				; CODE XREF: AI_SpeedManeuverDecision+46j
		leave
		retf
AI_SpeedManeuverDecision	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,616L — fonction majeure : calcule le vecteur relatif cible-soi, sa magnitude
; (sub_5828E), angles via sub_559BB/sub_552E1, et évalue une solution de manoeuvre complexe.
; Vu la taille, candidat fort pour le calcul de solution de tir/interception ou d'évitement
; complet — mérite une passe dédiée.
; ==============================================================================================
AI_ManeuverSolution_Major	proc far		; CODE XREF: AI_InterceptDispatcher+8Dp AI_BehaviorSelector+EBP

var_FC		= word ptr -0FCh
var_F0		= dword	ptr -0F0h
var_EC		= dword	ptr -0ECh
var_E8		= dword	ptr -0E8h
var_D8		= dword	ptr -0D8h
var_D4		= dword	ptr -0D4h
var_D0		= dword	ptr -0D0h
var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= word ptr -70h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= word ptr -42h
var_3F		= byte ptr -3Fh
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0FCh
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	[bp+var_1], 0
		or	di, di
		jnz	short loc_698E
		jmp	loc_6F34
; ���������������������������������������������������������������������������

loc_698E:				; CODE XREF: AI_ManeuverSolution_Major+12j
		push	di
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_C0]
		push	ax
		push	cs
		call	near ptr AI_Sensor_TargetVelocityCache
		add	sp, 0Ah
		mov	si, di
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_CC], eax
		mov	eax, [si+4]
		mov	[bp+var_C8], eax
		mov	eax, [si+8]
		mov	[bp+var_C4], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+102h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_D8], eax
		mov	eax, [si+4]
		mov	[bp+var_D4], eax
		mov	eax, [si+8]
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_D8]
		sub	[bp+var_CC], eax
		mov	eax, [bp+var_D4]
		sub	[bp+var_C8], eax
		mov	eax, [bp+var_D0]
		sub	[bp+var_C4], eax
		push	large [bp+var_C4]
		push	large [bp+var_C8]
		push	large [bp+var_CC]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	[bp+var_6], eax
		lea	ax, [bp+var_CC]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		lea	ax, [bp+var_CC]
		push	ax
		push	ss
		lea	ax, [bp+var_12]
		push	ax
		call	Math_AngleBetweenVectors_552E1
		add	sp, 6
		lea	ax, [bp+var_C0]
		push	ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		call	Math_AngleBetweenVectors_552E1
		add	sp, 6
		mov	eax, [bp+var_12]
		sub	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	[bp+var_E], eax
		lea	ax, [bp+var_CC]
		push	ax
		push	ss
		lea	ax, [bp+var_22]
		push	ax
		call	AI_ComputeApproachAngles_553CF
		add	sp, 6
		lea	ax, [bp+var_C0]
		push	ax
		push	ss
		lea	ax, [bp+var_26]
		push	ax
		call	AI_ComputeApproachAngles_553CF
		add	sp, 6
		mov	eax, [bp+var_22]
		sub	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	[bp+var_1E], eax
		lea	ax, [bp+var_E]
		push	ax
		push	ss
		lea	ax, [bp+var_32]
		push	ax
		call	Math_Square_54C39
		add	sp, 6
		lea	ax, [bp+var_1E]
		push	ax
		push	ss
		lea	ax, [bp+var_36]
		push	ax
		call	Math_Square_54C39
		add	sp, 6
		mov	eax, [bp+var_32]
		add	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		lea	ax, [bp+var_3E]
		push	ax
		push	ss
		lea	ax, [bp+var_2E]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		mov	[bp+var_3F], 0
		mov	ax, 6
		call	Math_RandomScale_54DF4
		push	ax
		mov	ax, 6
		call	Math_RandomScale_54DF4
		pop	dx
		add	dx, ax
		push	dx
		mov	ax, 6
		call	Math_RandomScale_54DF4
		pop	dx
		add	dx, ax
		inc	dx
		mov	[bp+var_42], dx
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B6h]
		cbw
		cmp	ax, [bp+var_42]
		jl	short loc_6B15
		mov	[bp+var_3F], 1

loc_6B15:				; CODE XREF: AI_ManeuverSolution_Major+198j
		mov	[bp+var_46], 700h
		lea	ax, [bp+var_CC]
		push	ax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_4A]
		push	ax
		push	cs
		call	near ptr AI_ComputeBearingToRef
		add	sp, 0Ah
		cmp	[bp+var_4A], 0B400h
		jle	short loc_6B46
		sub	[bp+var_4A], 16800h
		jmp	short loc_6B5A
; ���������������������������������������������������������������������������

loc_6B46:				; CODE XREF: AI_ManeuverSolution_Major+1C3j
		cmp	[bp+var_4A], 0FFFF4C00h
		jge	short loc_6B5A
		add	[bp+var_4A], 16800h
		jmp	short $+2

loc_6B5A:				; CODE XREF: AI_ManeuverSolution_Major+1CDj
					; AI_ManeuverSolution_Major+1D7j
		mov	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		sar	eax, 2
		mov	[bp+var_52], eax
		mov	[bp+var_56], eax
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		or	eax, eax
		jge	short loc_6B7E
		neg	eax

loc_6B7E:				; CODE XREF: AI_ManeuverSolution_Major+202j
		mov	[bp+var_4A], eax
		lea	ax, [bp+var_4A]
		push	ax
		push	ss
		lea	ax, [bp+var_5A]
		push	ax
		call	Math_Sin_5483F
		add	sp, 6
		mov	eax, [bp+var_46]
		mov	edx, [bp+var_5A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		cmp	[bp+var_46], 100h
		jge	short loc_6BB6
		mov	ax, 1
		jmp	short loc_6BB8
; ���������������������������������������������������������������������������

loc_6BB6:				; CODE XREF: AI_ManeuverSolution_Major+238j
		xor	ax, ax

loc_6BB8:				; CODE XREF: AI_ManeuverSolution_Major+23Dj
		or	al, al
		jz	short loc_6BCC
		mov	[bp+var_5E], 100h
		mov	eax, [bp+var_5E]
		mov	[bp+var_46], eax

loc_6BCC:				; CODE XREF: AI_ManeuverSolution_Major+243j
		mov	eax, [bp+var_1E]
		or	eax, eax
		jge	short loc_6BD8
		neg	eax

loc_6BD8:				; CODE XREF: AI_ManeuverSolution_Major+25Cj
		mov	[bp+var_62], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_66], eax
		cmp	eax, [bp+var_46]
		jge	short loc_6BEF
		mov	ax, 1
		jmp	short loc_6BF1
; ���������������������������������������������������������������������������

loc_6BEF:				; CODE XREF: AI_ManeuverSolution_Major+271j
		xor	ax, ax

loc_6BF1:				; CODE XREF: AI_ManeuverSolution_Major+276j
		or	al, al
		jnz	short loc_6BF8
		jmp	loc_6ED9
; ���������������������������������������������������������������������������

loc_6BF8:				; CODE XREF: AI_ManeuverSolution_Major+27Cj
		mov	eax, [bp+var_E]
		or	eax, eax
		jge	short loc_6C04
		neg	eax

loc_6C04:				; CODE XREF: AI_ManeuverSolution_Major+288j
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_6E], eax
		cmp	eax, [bp+var_46]
		jge	short loc_6C1B
		mov	ax, 1
		jmp	short loc_6C1D
; ���������������������������������������������������������������������������

loc_6C1B:				; CODE XREF: AI_ManeuverSolution_Major+29Dj
		xor	ax, ax

loc_6C1D:				; CODE XREF: AI_ManeuverSolution_Major+2A2j
		or	al, al
		jnz	short loc_6C24
		jmp	loc_6ED9
; ���������������������������������������������������������������������������

loc_6C24:				; CODE XREF: AI_ManeuverSolution_Major+2A8j
		mov	eax, [bp+var_6]
		cmp	eax, dword_7201C
		jge	short loc_6C34
		mov	ax, 1
		jmp	short loc_6C36
; ���������������������������������������������������������������������������

loc_6C34:				; CODE XREF: AI_ManeuverSolution_Major+2B6j
		xor	ax, ax

loc_6C36:				; CODE XREF: AI_ManeuverSolution_Major+2BBj
		or	al, al
		jnz	short loc_6C3D
		jmp	loc_6ED9
; ���������������������������������������������������������������������������

loc_6C3D:				; CODE XREF: AI_ManeuverSolution_Major+2C1j
		cmp	[bp+var_3F], 0
		jnz	short loc_6C46
		jmp	loc_6ED9
; ���������������������������������������������������������������������������

loc_6C46:				; CODE XREF: AI_ManeuverSolution_Major+2CAj
		lea	ax, [bp+var_C0]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		mov	eax, [bp+var_C0]
		shl	eax, 8
		mov	[bp+var_C0], eax
		mov	eax, [bp+var_BC]
		shl	eax, 8
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_B8]
		shl	eax, 8
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_CC]
		shl	eax, 8
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_C8]
		shl	eax, 8
		mov	[bp+var_C8], eax
		mov	eax, [bp+var_C4]
		shl	eax, 8
		mov	[bp+var_C4], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_70], ax
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		lea	ax, [bp+var_F0]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		mov	eax, [bp+var_F0]
		shl	eax, 8
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_EC]
		shl	eax, 8
		mov	[bp+var_EC], eax
		mov	eax, [bp+var_E8]
		shl	eax, 8
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_C0]
		sub	[bp+var_F0], eax
		mov	eax, [bp+var_BC]
		sub	[bp+var_EC], eax
		mov	eax, [bp+var_B8]
		sub	[bp+var_E8], eax
		mov	eax, [bp+var_F0]
		add	[bp+var_CC], eax
		mov	eax, [bp+var_EC]
		add	[bp+var_C8], eax
		mov	eax, [bp+var_E8]
		add	[bp+var_C4], eax
		lea	ax, [bp+var_CC]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_F0], eax
		mov	eax, [si+4]
		mov	[bp+var_EC], eax
		mov	eax, [si+8]
		mov	[bp+var_E8], eax
		lea	ax, [bp+var_FC]
		push	ax
		call	Matrix_ApplyToVectorY_57660
		pop	cx
		lea	ax, [bp+var_FC]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	eax, [bp+var_1E]
		or	eax, eax
		jge	short loc_6D92
		neg	eax

loc_6D92:				; CODE XREF: AI_ManeuverSolution_Major+416j
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_46]
		sar	eax, 1
		mov	[bp+var_80], eax
		mov	[bp+var_84], eax
		mov	eax, [bp+var_7C]
		cmp	eax, [bp+var_84]
		jle	short loc_6DBE
		mov	ax, 1
		jmp	short loc_6DC0
; ���������������������������������������������������������������������������

loc_6DBE:				; CODE XREF: AI_ManeuverSolution_Major+440j
		xor	ax, ax

loc_6DC0:				; CODE XREF: AI_ManeuverSolution_Major+445j
		or	al, al
		jz	short loc_6DCA
		mov	eax, [bp+var_4E]
		jmp	short loc_6DED
; ���������������������������������������������������������������������������

loc_6DCA:				; CODE XREF: AI_ManeuverSolution_Major+44Bj
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_88]
		push	ax
		push	cs
		call	near ptr AI_Sensor_HeadingNormalized
		add	sp, 8
		mov	eax, [bp+var_88]
		neg	eax
		mov	[bp+var_8C], eax
		mov	[bp+var_90], eax

loc_6DED:				; CODE XREF: AI_ManeuverSolution_Major+451j
		mov	[bp+var_74], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0Bh]
		add	si, 71h	; 'q'
		mov	eax, [si]
		mov	[bp+var_94], eax
		sar	eax, 2
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_94], eax
		mov	eax, [bp+var_74]
		or	eax, eax
		jge	short loc_6E2F
		neg	eax

loc_6E2F:				; CODE XREF: AI_ManeuverSolution_Major+4B3j
		mov	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		cmp	eax, [bp+var_94]
		jge	short loc_6E4A
		mov	ax, 1
		jmp	short loc_6E4C
; ���������������������������������������������������������������������������

loc_6E4A:				; CODE XREF: AI_ManeuverSolution_Major+4CCj
		xor	ax, ax

loc_6E4C:				; CODE XREF: AI_ManeuverSolution_Major+4D1j
		or	al, al
		jz	short loc_6E57
		push	5
		lea	ax, [bp+var_74]
		jmp	short loc_6E9D
; ���������������������������������������������������������������������������

loc_6E57:				; CODE XREF: AI_ManeuverSolution_Major+4D7j
		cmp	[bp+var_74], 0
		jle	short loc_6E63
		mov	ax, 1
		jmp	short loc_6E65
; ���������������������������������������������������������������������������

loc_6E63:				; CODE XREF: AI_ManeuverSolution_Major+4E5j
		xor	ax, ax

loc_6E65:				; CODE XREF: AI_ManeuverSolution_Major+4EAj
		or	al, al
		jz	short loc_6E84
		push	5
		mov	eax, [bp+var_74]
		sub	eax, [bp+var_94]
		mov	[bp+var_A0], eax
		mov	[bp+var_A4], eax
		lea	ax, [bp+var_A4]
		jmp	short loc_6E9D
; ���������������������������������������������������������������������������

loc_6E84:				; CODE XREF: AI_ManeuverSolution_Major+4F0j
		push	5
		mov	eax, [bp+var_74]
		add	eax, [bp+var_94]
		mov	[bp+var_A8], eax
		mov	[bp+var_AC], eax
		lea	ax, [bp+var_AC]

loc_6E9D:				; CODE XREF: AI_ManeuverSolution_Major+4DEj
					; AI_ManeuverSolution_Major+50Bj
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_TurnToHeadingCmd
		add	sp, 8
		mov	[bp+var_B0], 0
		mov	eax, [bp+var_B0]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		mov	[bp+var_B4], 0
		mov	eax, [bp+var_B4]
		mov	es:[bx+27h], eax
		jmp	short loc_6F30
; ���������������������������������������������������������������������������

loc_6ED9:				; CODE XREF: AI_ManeuverSolution_Major+27Ej
					; AI_ManeuverSolution_Major+2AAj ...
		cmp	[bp+var_6], 0
		jle	short loc_6EE5
		mov	ax, 1
		jmp	short loc_6EE7
; ���������������������������������������������������������������������������

loc_6EE5:				; CODE XREF: AI_ManeuverSolution_Major+567j
		xor	ax, ax

loc_6EE7:				; CODE XREF: AI_ManeuverSolution_Major+56Cj
		or	al, al
		jz	short loc_6F1E
		mov	eax, [di+20h]
		mov	edx, eax
		mov	ecx, [bp+var_6]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_78+2], eax
		mov	eax, [bp+var_78+2]
		mov	[bp+var_7C+2], eax
		lea	ax, [bp+var_7C+2]
		push	ax
		push	ss
		lea	ax, [bp+var_80+2]
		push	ax
		call	Math_ArcTan_54ADE
		add	sp, 6

loc_6F1E:				; CODE XREF: AI_ManeuverSolution_Major+572j
		cmp	[bp+var_2E], 0
		jnz	short loc_6F2A
		mov	ax, 1
		jmp	short loc_6F2C
; ���������������������������������������������������������������������������

loc_6F2A:				; CODE XREF: AI_ManeuverSolution_Major+5ACj
		xor	ax, ax

loc_6F2C:				; CODE XREF: AI_ManeuverSolution_Major+5B1j
		or	al, al
		jz	short loc_6F34

loc_6F30:				; CODE XREF: AI_ManeuverSolution_Major+560j
		mov	[bp+var_1], 1

loc_6F34:				; CODE XREF: AI_ManeuverSolution_Major+14j
					; AI_ManeuverSolution_Major+5B7j
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
AI_ManeuverSolution_Major	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,16L — nettoie flag bit3 de +0x28D puis appelle sub_40FD8(cible +0x104, valeur +0x1A2) :
; probable déclenchement de tir/largage d'arme sur la cible verrouillée.
; ==============================================================================================
AI_FireWeaponTrigger	proc far		; CODE XREF: AI_BehaviorSelector+121P
					; AI_BehaviorSelector+1AEP

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+28Dh], 0F7h
		push	word ptr es:[bx+1A2h]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_ValidateReady
		add	sp, 6
		pop	bp
		retf
AI_FireWeaponTrigger	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,96L — calcule un seuil de fermeture (dword_7201C/4), commande la vitesse via sub_6388,
; calcule le vecteur relatif cible, appelle sub_6977 (évaluation manoeuvre) ; si échec,
; récupère la vitesse cible via sub_6469 et bascule sur sub_702A (guidage alternatif).
; Dispatcher de manoeuvre d'interception : poursuite directe vs guidage complexe.
; ==============================================================================================
AI_InterceptDispatcher	proc far		; CODE XREF: seg008:loc_10E91P
					; seg008:2B8BP	...

var_2E		= word ptr -2Eh
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Eh
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	[bp+var_1], 0
		mov	eax, dword_7201C
		sar	eax, 2
		mov	[bp+var_6], eax
		mov	[bp+var_A], eax
		sar	eax, 8
		push	eax
		push	di
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_InterceptSpeedCmd_HUD
		add	sp, 0Ah
		mov	si, di
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_16], eax
		mov	eax, [si+4]
		mov	[bp+var_12], eax
		mov	eax, [si+8]
		mov	[bp+var_E], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+102h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_22], eax
		mov	eax, [si+4]
		mov	[bp+var_1E], eax
		mov	eax, [si+8]
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_22]
		sub	[bp+var_16], eax
		mov	eax, [bp+var_1E]
		sub	[bp+var_12], eax
		mov	eax, [bp+var_1A]
		sub	[bp+var_E], eax
		push	di
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr AI_ManeuverSolution_Major
		add	sp, 6
		or	al, al
		jnz	short loc_701F
		push	large 0Ah
		push	di
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_2E]
		push	ax
		push	cs
		call	near ptr AI_Sensor_TargetVelocityCache
		add	sp, 0Ah
		lea	ax, [bp+var_2E]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_GuidanceSolution_Major
		add	sp, 0Ch
		or	al, al
		jz	short loc_7023

loc_701F:				; CODE XREF: AI_InterceptDispatcher+95j
		mov	[bp+var_1], 1

loc_7023:				; CODE XREF: AI_InterceptDispatcher+C1j
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
AI_InterceptDispatcher	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 651 lignes - LUE INTEGRALEMENT (a la demande de Remi). VRAIE LOI DE GUIDAGE DE
; POURSUITE AVEC ANTICIPATION (proportional navigation / lead pursuit), le coeur geometrique
; de la chaine de combat aerien IA (AI_SYSTEM.md §4bis). Prend deux vecteurs d'approche
; (si=arg_4, di=arg_6, chacun transforme/calcule via AI_ComputeApproachAngles_553CF), calcule
; leur DELTA D'ANGLE avec gestion complete du wraparound ±180 deg (motif repete plusieurs fois
; : cmp 0xB400/sub 0x16800 si > 180, cmp -180/add 0x16800 si < -180). CAS SPECIAL ANGLE
; DIVERGENT (>90 deg, ligne ~16530) : bascule sur un calcul alternatif (angle=0, pas de
; correction fine) plutot que Math_AngleBetweenVectors, evitant les artefacts numeriques d'un
; calcul d'angle sur des vecteurs presque opposes. GARDE PORTEE CAPTEUR (ligne ~16571) :
; compare [avion+0x1A] a dword_7203D (le seuil de portee de capteur deja connu
; d'AIEntity_MasterTick) - si hors de portee de detection reelle, saute directement a un ANGLE
; FIXE MAXIMAL (±166 deg, constante 0xFFFFA600/-0x5A00) plutot que de calculer une correction
; fine. ESTIMATION DE TEMPS DE VIRAGE (ligne ~16604-16650) : calcule une estimation du temps
; necessaire pour completer un virage, BASEE SUR LA CAPACITE DE MANOEUVRE PROPRE DE L'AVION
; ([avion+0x67], meme champ que les sequences de manoeuvre MVRS_ID14b) - un avion plus
; manoeuvrant obtient une estimation de temps plus courte, permettant des corrections plus
; agressives. PLUSIEURS PALIERS D'ANGLE LIMITE (lignes ~16800-16870) : clamps a ±166 deg (cas
; extreme) ou ±45 deg (cas modere, 0x2D00) selon la situation geometrique. REORIENTATION DU
; VECTEUR D'ENTREE (ligne ~16880, si var_1==1) : recalcule la 3e composante du vecteur si par
; un facteur cosinus (Math_Cos_54876) proportionnel a la distance
; (Math_VectorLength3D_Raw_5828E), puis re-transforme (Vector_TransformHelperB_559BB) - ajuste
; l'approche en fonction de la distance a la cible. SORTIE (fin de fonction, ligne
; ~17058-17075) : calcule un DERNIER delta d'angle final (var_A, wrappe ±180 deg), puis
; DELEGUE DIRECTEMENT (appel en queue) A AI_CombatDecision_Major_75F8 en lui passant CE cap
; final PLUS deux autres deltas intermediaires (var_68, var_E) et l'argument original (arg_8)
; - cette fonction ne prend PAS elle-meme la decision finale, elle prepare la geometrie
; complete pour que AI_CombatDecision_Major decide de l'action. CONFIRME que le triplet de
; guidage complet est : AI_GuidanceSolution_Major (geometrie/anticipation) ->
; AI_CombatDecision_Major (decision) -> AI_TurnToHeadingCmd (execution).
; ==============================================================================================
AI_GuidanceSolution_Major	proc far		; CODE XREF: AI_InterceptDispatcher+B9p AI_GuidanceCmd_FromOwnPos+46p ...

var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
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
var_44		= word ptr -44h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0BEh
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	[bp+var_1], 0
		push	si
		call	Vector_Normalize3D_559BB
		pop	cx
		push	si
		push	ss
		lea	ax, [bp+var_12]
		push	ax
		call	AI_ComputeApproachAngles_553CF
		add	sp, 6
		push	di
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		call	AI_ComputeApproachAngles_553CF
		add	sp, 6
		mov	eax, [bp+var_12]
		sub	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 0B400h
		jle	short loc_7084
		sub	[bp+var_E], 16800h
		jmp	short loc_7098
; ���������������������������������������������������������������������������

loc_7084:				; CODE XREF: AI_GuidanceSolution_Major+4Ej
		cmp	[bp+var_E], 0FFFF4C00h
		jge	short loc_7098
		add	[bp+var_E], 16800h
		jmp	short $+2

loc_7098:				; CODE XREF: AI_GuidanceSolution_Major+58j AI_GuidanceSolution_Major+62j
		mov	eax, [bp+var_E]
		or	eax, eax
		jge	short loc_70A4
		neg	eax

loc_70A4:				; CODE XREF: AI_GuidanceSolution_Major+75j
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		cmp	[bp+var_26], 5A00h
		jl	short loc_70BF
		mov	ax, 1
		jmp	short loc_70C1
; ���������������������������������������������������������������������������

loc_70BF:				; CODE XREF: AI_GuidanceSolution_Major+8Ej
		xor	ax, ax

loc_70C1:				; CODE XREF: AI_GuidanceSolution_Major+93j
		or	al, al
		jz	short loc_70E3
		mov	[bp+var_2A], 0
		mov	eax, [bp+var_2A]
		mov	[si+8],	eax
		mov	[bp+var_2E], 0
		mov	eax, [bp+var_2E]
		jmp	short loc_70F5
; ���������������������������������������������������������������������������

loc_70E3:				; CODE XREF: AI_GuidanceSolution_Major+99j
		push	si
		push	ss
		lea	ax, [bp+var_32]
		push	ax
		call	Math_AngleBetweenVectors_552E1
		add	sp, 6
		mov	eax, [bp+var_32]

loc_70F5:				; CODE XREF: AI_GuidanceSolution_Major+B7j
		mov	[bp+var_1E], eax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_36]
		push	ax
		push	cs
		call	near ptr AI_Sensor_SecondaryAngle
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		mov	eax, [bx+1Ah]
		cmp	eax, dword_7203D
		jg	short loc_7121
		mov	ax, 1
		jmp	short loc_7123
; ���������������������������������������������������������������������������

loc_7121:				; CODE XREF: AI_GuidanceSolution_Major+F0j
		xor	ax, ax

loc_7123:				; CODE XREF: AI_GuidanceSolution_Major+F5j
		or	al, al
		jnz	short loc_712A
		jmp	loc_71EC
; ���������������������������������������������������������������������������

loc_712A:				; CODE XREF: AI_GuidanceSolution_Major+FBj
		mov	eax, [bp+var_1E]
		cmp	eax, [bp+var_36]
		jge	short loc_7139
		mov	ax, 1
		jmp	short loc_713B
; ���������������������������������������������������������������������������

loc_7139:				; CODE XREF: AI_GuidanceSolution_Major+108j
		xor	ax, ax

loc_713B:				; CODE XREF: AI_GuidanceSolution_Major+10Dj
		or	al, al
		jnz	short loc_7142
		jmp	loc_71EC
; ���������������������������������������������������������������������������

loc_7142:				; CODE XREF: AI_GuidanceSolution_Major+113j
		mov	[bp+var_42], 5000h
		mov	eax, [bp+var_42]
		mov	[bp+var_6], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+102h]
		add	ax, 1Ah
		mov	[bp+var_44], ax
		mov	bx, [bp+var_44]
		mov	eax, dword_7203D
		sub	eax, [bx]
		mov	[bp+var_48], eax
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_6]
		mov	edx, [bp+var_4C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0E5h ; '�'
		mov	word ptr [bp+var_98+2],	ax
		mov	word ptr [bp+var_98], dx
		les	bx, [bp+var_98]
		mov	eax, es:[bx]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_6]
		mov	edx, eax
		mov	ecx, [bp+var_94]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_6], eax
		cmp	[bp+var_6], 5000h
		jle	short loc_71CF
		mov	ax, 1
		jmp	short loc_71D1
; ���������������������������������������������������������������������������

loc_71CF:				; CODE XREF: AI_GuidanceSolution_Major+19Ej
		xor	ax, ax

loc_71D1:				; CODE XREF: AI_GuidanceSolution_Major+1A3j
		or	al, al
		jnz	short loc_71D8
		jmp	loc_73D4
; ���������������������������������������������������������������������������

loc_71D8:				; CODE XREF: AI_GuidanceSolution_Major+1A9j
		mov	[bp+var_9E+2], 5000h
		mov	eax, [bp+var_9E+2]
		jmp	loc_73D0
; ���������������������������������������������������������������������������
		jmp	loc_73D4
; ���������������������������������������������������������������������������

loc_71EC:				; CODE XREF: AI_GuidanceSolution_Major+FDj
					; AI_GuidanceSolution_Major+115j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		cmp	byte ptr [bx+67h], 2
		jnb	short loc_7208
		mov	[bp+var_50], 0
		mov	eax, [bp+var_50]
		jmp	loc_7343
; ���������������������������������������������������������������������������

loc_7208:				; CODE XREF: AI_GuidanceSolution_Major+1CDj
		mov	[bp+var_94], 9CCh
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_98]
		push	ax
		push	cs
		call	near ptr AI_Sensor_OwnSpeed
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+67h]
		mov	ah, 0
		sar	ax, 1
		mov	[bp-9Ah], ax
		movsx	ebx, word ptr [bp-9Ah]
		mov	eax, [bp+var_98]
		cdq
		idiv	ebx
		mov	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	edx, eax
		mov	ecx, [bp+var_94]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_98], eax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_9E]
		push	ax
		push	cs
		call	near ptr AI_Sensor_OwnSpeed
		add	sp, 8
		mov	eax, [bp+var_98]
		mov	edx, [bp+var_9E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_98], eax

loc_728E:
		cmp	[bp+var_98], 0
		jle	short loc_729B

loc_7296:
		mov	ax, 1
		jmp	short loc_729D
; ���������������������������������������������������������������������������

loc_729B:				; CODE XREF: AI_GuidanceSolution_Major+26Aj
		xor	ax, ax

loc_729D:				; CODE XREF: AI_GuidanceSolution_Major+26Fj
		or	al, al

loc_729F:
		jnz	short loc_72A4

loc_72A1:
		jmp	loc_7335
; ���������������������������������������������������������������������������

loc_72A4:				; CODE XREF: AI_GuidanceSolution_Major:loc_729Fj
		mov	eax, [bp+var_98]
		mov	[bp+var_A6], eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		mov	eax, [bx+1Ah]
		sub	eax, dword_7203D
		mov	[bp+var_AA], eax
		mov	[bp+var_AE], eax
		sub	[bp+var_A6], eax
		cmp	[bp+var_A6], 0
		jge	short loc_72DB
		mov	ax, 1
		jmp	short loc_72DD
; ���������������������������������������������������������������������������

loc_72DB:				; CODE XREF: AI_GuidanceSolution_Major+2AAj
		xor	ax, ax

loc_72DD:				; CODE XREF: AI_GuidanceSolution_Major+2AFj
		or	al, al
		jz	short loc_72F1
		mov	[bp+var_B2], 0FFFFA600h
		mov	eax, [bp+var_B2]
		jmp	short loc_7343
; ���������������������������������������������������������������������������

loc_72F1:				; CODE XREF: AI_GuidanceSolution_Major+2B5j
		mov	eax, [bp+var_A6]
		mov	edx, eax
		mov	ecx, [bp+var_98]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A6], eax
		lea	ax, [bp+var_A6]
		push	ax
		push	ss
		lea	ax, [bp+var_B6]
		push	ax
		call	Math_ArcSin_5493E
		add	sp, 6
		mov	eax, [bp+var_B6]
		neg	eax
		mov	[bp+var_BA], eax
		mov	[bp+var_BE], eax
		jmp	short loc_7343
; ���������������������������������������������������������������������������

loc_7335:				; CODE XREF: AI_GuidanceSolution_Major:loc_72A1j
		mov	[bp+var_A2], 0FFFFA600h
		mov	eax, [bp+var_A2]

loc_7343:				; CODE XREF: AI_GuidanceSolution_Major+1DBj
					; AI_GuidanceSolution_Major+2C5j ...
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_1E]
		cmp	eax, [bp+var_3E]
		jge	short loc_7356
		mov	ax, 1
		jmp	short loc_7358
; ���������������������������������������������������������������������������

loc_7356:				; CODE XREF: AI_GuidanceSolution_Major+325j
		xor	ax, ax

loc_7358:				; CODE XREF: AI_GuidanceSolution_Major+32Aj
		or	al, al
		jz	short loc_7362
		mov	eax, [bp+var_3E]
		jmp	short loc_73D0
; ���������������������������������������������������������������������������

loc_7362:				; CODE XREF: AI_GuidanceSolution_Major+330j
		cmp	[bp+var_36], 0FFFFD300h
		jge	short loc_7371
		mov	ax, 1
		jmp	short loc_7373
; ���������������������������������������������������������������������������

loc_7371:				; CODE XREF: AI_GuidanceSolution_Major+340j
		xor	ax, ax

loc_7373:				; CODE XREF: AI_GuidanceSolution_Major+345j
		or	al, al
		jz	short loc_739A
		mov	eax, [bp+var_1E]
		cmp	eax, [bp+var_36]
		jge	short loc_7386
		mov	ax, 1
		jmp	short loc_7388
; ���������������������������������������������������������������������������

loc_7386:				; CODE XREF: AI_GuidanceSolution_Major+355j
		xor	ax, ax

loc_7388:				; CODE XREF: AI_GuidanceSolution_Major+35Aj
		or	al, al
		jz	short loc_739A
		mov	[bp+var_54], 0FFFFD300h

loc_7394:
		mov	eax, [bp+var_54]
		jmp	short loc_73D0
; ���������������������������������������������������������������������������

loc_739A:				; CODE XREF: AI_GuidanceSolution_Major+34Bj
					; AI_GuidanceSolution_Major+360j
		cmp	[bp+var_36], 2D00h
		jl	short loc_73A9
		mov	ax, 1
		jmp	short loc_73AB
; ���������������������������������������������������������������������������

loc_73A9:				; CODE XREF: AI_GuidanceSolution_Major+378j
		xor	ax, ax

loc_73AB:				; CODE XREF: AI_GuidanceSolution_Major+37Dj
		or	al, al
		jz	short loc_73D8
		mov	eax, [bp+var_1E]
		cmp	eax, [bp+var_36]
		jle	short loc_73BE
		mov	ax, 1
		jmp	short loc_73C0
; ���������������������������������������������������������������������������

loc_73BE:				; CODE XREF: AI_GuidanceSolution_Major+38Dj
		xor	ax, ax

loc_73C0:				; CODE XREF: AI_GuidanceSolution_Major+392j
		or	al, al
		jz	short loc_73D8
		mov	[bp+var_58], 2D00h
		mov	eax, [bp+var_58]

loc_73D0:				; CODE XREF: AI_GuidanceSolution_Major+1BCj
					; AI_GuidanceSolution_Major+336j ...
		mov	[bp+var_6], eax

loc_73D4:				; CODE XREF: AI_GuidanceSolution_Major+1ABj
					; AI_GuidanceSolution_Major+1BFj
		mov	[bp+var_1], 1

loc_73D8:				; CODE XREF: AI_GuidanceSolution_Major+383j
					; AI_GuidanceSolution_Major+398j
		cmp	[bp+var_1], 0
		jz	short loc_743D
		mov	dword ptr [si+8], 0
		push	large dword ptr	[si+8]
		push	large dword ptr	[si+4]
		push	large dword ptr	[si]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		mov	[bp+var_3A], eax
		lea	ax, [bp+var_6]
		push	ax
		push	ss
		lea	ax, [bp+var_64]
		push	ax
		call	Math_Cos_54876
		add	sp, 6
		mov	eax, [bp+var_64]
		mov	[si+8],	eax
		mov	eax, [si+8]
		mov	edx, [bp+var_3A]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8],	eax
		push	si
		call	Vector_Normalize3D_559BB
		pop	cx

loc_743D:				; CODE XREF: AI_GuidanceSolution_Major+3B2j
		push	si
		push	ss
		lea	ax, [bp+var_6C]
		push	ax
		call	Math_AngleBetweenVectors_552E1
		add	sp, 6
		push	di
		push	ss
		lea	ax, [bp+var_70]
		push	ax
		call	Math_AngleBetweenVectors_552E1
		add	sp, 6
		mov	eax, [bp+var_6C]
		sub	eax, [bp+var_70]
		mov	[bp+var_74], eax
		mov	[bp+var_68], eax
		cmp	[bp+var_68], 0B400h
		jle	short loc_747D
		sub	[bp+var_68], 16800h
		jmp	short loc_7491
; ���������������������������������������������������������������������������

loc_747D:				; CODE XREF: AI_GuidanceSolution_Major+447j
		cmp	[bp+var_68], 0FFFF4C00h
		jge	short loc_7491
		add	[bp+var_68], 16800h
		jmp	short $+2

loc_7491:				; CODE XREF: AI_GuidanceSolution_Major+451j
					; AI_GuidanceSolution_Major+45Bj
		cmp	[bp+var_E], 5A00h
		jl	short loc_74A0

loc_749B:
		mov	ax, 1
		jmp	short loc_74A2
; ���������������������������������������������������������������������������

loc_74A0:				; CODE XREF: AI_GuidanceSolution_Major+46Fj
		xor	ax, ax

loc_74A2:				; CODE XREF: AI_GuidanceSolution_Major+474j
		or	al, al
		jz	short loc_74EB
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_78]
		push	ax
		push	cs
		call	near ptr AI_Sensor_HeadingNormalized
		add	sp, 8
		mov	eax, 5A00h
		sub	eax, [bp+var_78]
		mov	[bp+var_7C], eax
		mov	[bp+var_80], eax
		mov	[bp+var_A], eax
		cmp	[bp+var_68], 0
		jle	short loc_74D8
		mov	ax, 1
		jmp	short loc_74DA
; ���������������������������������������������������������������������������

loc_74D8:				; CODE XREF: AI_GuidanceSolution_Major+4A7j
		xor	ax, ax

loc_74DA:				; CODE XREF: AI_GuidanceSolution_Major+4ACj
		or	al, al
		jnz	short loc_74E1
		jmp	loc_7561
; ���������������������������������������������������������������������������

loc_74E1:				; CODE XREF: AI_GuidanceSolution_Major+4B2j
		mov	eax, [bp+var_68]
		sub	[bp+var_A], eax
		jmp	short loc_7561
; ���������������������������������������������������������������������������

loc_74EB:				; CODE XREF: AI_GuidanceSolution_Major+47Aj
		cmp	[bp+var_E], 0FFFFA600h
		jg	short loc_74FA
		mov	ax, 1
		jmp	short loc_74FC
; ���������������������������������������������������������������������������

loc_74FA:				; CODE XREF: AI_GuidanceSolution_Major+4C9j
		xor	ax, ax

loc_74FC:				; CODE XREF: AI_GuidanceSolution_Major+4CEj
		or	al, al
		jz	short loc_7546
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_84]
		push	ax
		push	cs
		call	near ptr AI_Sensor_HeadingNormalized
		add	sp, 8
		mov	eax, 0FFFFA600h
		sub	eax, [bp+var_84]
		mov	[bp+var_88], eax
		mov	[bp+var_8C], eax
		mov	[bp+var_A], eax
		cmp	[bp+var_68], 0
		jle	short loc_7536
		mov	ax, 1
		jmp	short loc_7538
; ���������������������������������������������������������������������������

loc_7536:				; CODE XREF: AI_GuidanceSolution_Major+505j
		xor	ax, ax

loc_7538:				; CODE XREF: AI_GuidanceSolution_Major+50Aj
		or	al, al
		jz	short loc_7561
		mov	eax, [bp+var_68]
		add	[bp+var_A], eax
		jmp	short loc_7561
; ���������������������������������������������������������������������������

loc_7546:				; CODE XREF: AI_GuidanceSolution_Major+4D4j
		push	si
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_90]
		push	ax
		push	cs
		call	near ptr AI_ComputeBearingToRef
		add	sp, 0Ah
		mov	eax, [bp+var_90]
		mov	[bp+var_A], eax

loc_7561:				; CODE XREF: AI_GuidanceSolution_Major+4B4j
					; AI_GuidanceSolution_Major+4BFj ...
		cmp	[bp+var_A], 0B400h
		jle	short loc_7575
		sub	[bp+var_A], 16800h
		jmp	short loc_7589
; ���������������������������������������������������������������������������

loc_7575:				; CODE XREF: AI_GuidanceSolution_Major+53Fj
		cmp	[bp+var_A], 0FFFF4C00h
		jge	short loc_7589
		add	[bp+var_A], 16800h
		jmp	short $+2

loc_7589:				; CODE XREF: AI_GuidanceSolution_Major+549j
					; AI_GuidanceSolution_Major+553j
		push	large [bp+arg_8]
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		lea	ax, [bp+var_E]
		push	ax

loc_7599:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_CombatDecision_Major
		add	sp, 0Eh
		pop	di
		pop	si
		leave
		retf
AI_GuidanceSolution_Major	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — récupère la position propre (vtable+0x3C, +0xC), l'utilise comme référence pour
; appeler sub_702A(cap,rate) : wrapper de guidage utilisant position courante.
; ==============================================================================================
AI_GuidanceCmd_FromOwnPos	proc far		; CODE XREF: AI_EscortPriorityReactionHandler_9A77+252P
					; seg008:27E9P	...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_C], eax
		mov	eax, [si+4]
		mov	[bp+var_8], eax
		mov	eax, [si+8]
		mov	[bp+var_4], eax
		push	large [bp+arg_6]
		lea	ax, [bp+var_C]
		push	ax
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_GuidanceSolution_Major
		add	sp, 0Ch
		pop	si
		leave
		retf
AI_GuidanceCmd_FromOwnPos	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 603 lignes - LUE INTEGRALEMENT. Dernier maillon decisionnel de la chaine de guidage
; (AI_SYSTEM.md §4bis), recoit la geometrie complete calculee par AI_GuidanceSolution_Major
; (arg_6/arg_8 = deux deltas d'angle intermediaires). DEBUT : remet a zero
; entite+7+0x1F/+0x23/+0x27 (les 3 champs de commande partages avec l'entree souris du joueur,
; §4bis). GARDE CIBLE FINE (sub_564A) : si une condition de cible tient, pose entite+7+0x1E=10
; et BORNE les deux deltas d'entree a ±10 deg (mode 'poursuite fine', corrections limitees).
; GARDE flags_75 BIT 6 (deja documente §7, non reinvestiguee ici) : si actif, BYPASS COMPLET -
; delegue directement a sub_676F et sort. ARBRE DE DECISION PRINCIPAL, base sur la magnitude
; de l'angle (di[0]) : (a) SI < 20 deg (0x1400) : aucune correction, sortie immediate sans
; toucher aux champs de commande. (b) SI l'ecart angulaire total (somme des deux deltas,
; wrappe ±180 deg) est <= 145 deg (0x9100) : calcule une position anticipee via sub_5305 (meme
; fonction utilisee dans les phases de manoeuvre MVRS_ID6/14b), scale par un facteur derive du
; carre de l'angle divise par -10 puis 10, appelle AI_TurnToHeadingCmd(taux=5), ecrit le
; resultat dans entite+7+0x1F. (c) SI > 145 deg (cas extreme, quasi face-a-face) : calcul
; similaire mais en plus MULTIPLIE PAR LE TAUX DE ROULIS PROPRE DE L'AVION ([avion+0x71], meme
; champ que la formule de bonus de MVRS_ID14b_ScoreGeneric), divise par 0x10E (270), borne a
; un maximum (0x1000=16 deg) - encore une adaptation a la capacite de manoeuvre specifique de
; l'appareil. REPLI FINAL (aucune des conditions geometriques ne s'applique) : appelle
; AI_TurnToHeadingCmd(cible=0, taux=2) - une commande neutre de retour au niveau. CONFIRME le
; triptyque complet de la chaine de combat : AI_GuidanceSolution_Major
; (geometrie/anticipation) -> AI_CombatDecision_Major (choix entre correction
; fine/large/extreme/neutre, ecriture finale de la commande) ->
; AI_TurnToHeadingCmd/AI_PitchRollController_Heading (execution).
; ==============================================================================================
AI_CombatDecision_Major	proc far		; CODE XREF: AI_GuidanceSolution_Major+575p

var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0BEh
		push	si
		push	di
		mov	si, [bp+arg_6]
		mov	di, [bp+arg_8]
		mov	[bp+var_1], 0
		mov	[bp+var_6], 0
		mov	eax, [bp+var_6]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		mov	[bp+var_A], 0
		mov	eax, [bp+var_A]
		mov	es:[bx+23h], eax
		mov	[bp+var_E], 0
		mov	eax, [bp+var_E]
		mov	es:[bx+27h], eax
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_Sensor_TargetInRange
		add	sp, 4
		or	al, al
		jz	short loc_76AC
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		cmp	dword ptr [si],	0A00h
		jle	short loc_766E
		mov	ax, 1
		jmp	short loc_7670
; ���������������������������������������������������������������������������

loc_766E:				; CODE XREF: AI_CombatDecision_Major+6Fj
		xor	ax, ax

loc_7670:				; CODE XREF: AI_CombatDecision_Major+74j
		or	al, al
		jz	short loc_7683
		mov	[bp+var_12], 0A00h
		mov	eax, [bp+var_12]
		mov	[si], eax

loc_7683:				; CODE XREF: AI_CombatDecision_Major+7Aj
		mov	bx, [bp+arg_4]
		cmp	dword ptr [bx],	0A00h
		jle	short loc_7694
		mov	ax, 1
		jmp	short loc_7696
; ���������������������������������������������������������������������������

loc_7694:				; CODE XREF: AI_CombatDecision_Major+95j
		xor	ax, ax

loc_7696:				; CODE XREF: AI_CombatDecision_Major+9Aj
		or	al, al

loc_7698:
		jz	short loc_76AC

loc_769A:
		mov	[bp+var_16], 0A00h

loc_76A2:
		mov	eax, [bp+var_16]

loc_76A6:
		mov	bx, [bp+arg_4]
		mov	[bx], eax

loc_76AC:				; CODE XREF: AI_CombatDecision_Major+5Aj
					; AI_CombatDecision_Major:loc_7698j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jz	short loc_76CE
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_ThreatConeTest
		add	sp, 4
		jmp	loc_7B19
; ���������������������������������������������������������������������������

loc_76CE:				; CODE XREF: AI_CombatDecision_Major+C6j
		mov	[bp+var_1C], si
		mov	bx, [bp+var_1C]
		mov	eax, [bx]
		or	eax, eax
		jge	short loc_76DF
		neg	eax

loc_76DF:				; CODE XREF: AI_CombatDecision_Major+E2j
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_1A], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_26], ax
		mov	bx, [bp+var_26]
		mov	eax, [bx]
		or	eax, eax
		jge	short loc_76FF
		neg	eax

loc_76FF:				; CODE XREF: AI_CombatDecision_Major+102j
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_24], eax
		cmp	[bp+var_24], 0
		jz	short loc_7717
		mov	ax, 1
		jmp	short loc_7719
; ���������������������������������������������������������������������������

loc_7717:				; CODE XREF: AI_CombatDecision_Major+118j
		xor	ax, ax

loc_7719:				; CODE XREF: AI_CombatDecision_Major+11Dj
		or	al, al
		jnz	short loc_7732
		cmp	[bp+var_1A], 0
		jz	short loc_7729
		mov	ax, 1
		jmp	short loc_772B
; ���������������������������������������������������������������������������

loc_7729:				; CODE XREF: AI_CombatDecision_Major+12Aj
		xor	ax, ax

loc_772B:				; CODE XREF: AI_CombatDecision_Major+12Fj
		or	al, al
		jnz	short loc_7732
		jmp	loc_7AFB
; ���������������������������������������������������������������������������

loc_7732:				; CODE XREF: AI_CombatDecision_Major+123j
					; AI_CombatDecision_Major+135j
		push	[bp+arg_4]
		push	ss
		lea	ax, [bp+var_36]
		push	ax
		call	Math_Square_54C39
		add	sp, 6
		push	si
		push	ss
		lea	ax, [bp+var_3A]
		push	ax
		call	Math_Square_54C39
		add	sp, 6
		mov	eax, [bp+var_36]
		add	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		lea	ax, [bp+var_42]
		push	ax
		push	ss
		lea	ax, [bp+var_32]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		cmp	[bp+var_32], 1400h
		jle	short loc_7780
		mov	ax, 1
		jmp	short loc_7782
; ���������������������������������������������������������������������������

loc_7780:				; CODE XREF: AI_CombatDecision_Major+181j
		xor	ax, ax

loc_7782:				; CODE XREF: AI_CombatDecision_Major+186j
		or	al, al
		jnz	short loc_7789
		jmp	loc_7814
; ���������������������������������������������������������������������������

loc_7789:				; CODE XREF: AI_CombatDecision_Major+18Cj
		cmp	dword ptr [si],	0FFFFF600h

loc_7790:
		jle	short loc_7797
		mov	ax, 1
		jmp	short loc_7799
; ���������������������������������������������������������������������������

loc_7797:				; CODE XREF: AI_CombatDecision_Major:loc_7790j
		xor	ax, ax

loc_7799:				; CODE XREF: AI_CombatDecision_Major+19Dj
		or	al, al
		jz	short loc_7814
		push	2
		push	di
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_FlightControl_Cluster
		add	sp, 8
		mov	si, di
		mov	eax, [si]
		or	eax, eax
		jge	short loc_77B9
		neg	eax

loc_77B9:				; CODE XREF: AI_CombatDecision_Major+1BCj
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		cmp	[bp+var_4A], 1400h
		jge	short loc_77D4
		mov	ax, 1
		jmp	short loc_77D6
; ���������������������������������������������������������������������������

loc_77D4:				; CODE XREF: AI_CombatDecision_Major+1D5j
		xor	ax, ax

loc_77D6:				; CODE XREF: AI_CombatDecision_Major+1DAj
		or	al, al
		jnz	short loc_77DD
		jmp	loc_7B19
; ���������������������������������������������������������������������������

loc_77DD:				; CODE XREF: AI_CombatDecision_Major+1E0j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		mov	[bp+var_4E], 1000h
		lea	ax, [bp+var_4E]
		push	ax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_52]
		push	ax
		push	cs
		call	near ptr Value_ClampSymmetric
		add	sp, 0Ah
		mov	eax, [bp+var_52]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_56]
		jmp	loc_7AED
; ���������������������������������������������������������������������������

loc_7814:				; CODE XREF: AI_CombatDecision_Major+18Ej
					; AI_CombatDecision_Major+1A3j
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_5E]
		push	ax
		push	cs
		call	near ptr AI_Sensor_HeadingNormalized
		add	sp, 8
		mov	si, di
		mov	eax, [bp+var_5E]
		add	eax, [si]
		mov	[bp+var_62], eax
		mov	[bp+var_5A], eax
		cmp	[bp+var_5A], 0B400h
		jle	short loc_7849
		sub	[bp+var_5A], 16800h
		jmp	short loc_785D
; ���������������������������������������������������������������������������

loc_7849:				; CODE XREF: AI_CombatDecision_Major+245j
		cmp	[bp+var_5A], 0FFFF4C00h
		jge	short loc_785D
		add	[bp+var_5A], 16800h
		jmp	short $+2

loc_785D:				; CODE XREF: AI_CombatDecision_Major+24Fj
					; AI_CombatDecision_Major+259j
		mov	eax, [bp+var_5A]
		or	eax, eax
		jge	short loc_7869
		neg	eax

loc_7869:				; CODE XREF: AI_CombatDecision_Major+26Cj
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_72], eax
		cmp	[bp+var_72], 9100h
		jle	short loc_7884
		mov	ax, 1
		jmp	short loc_7886
; ���������������������������������������������������������������������������

loc_7884:				; CODE XREF: AI_CombatDecision_Major+285j
		xor	ax, ax

loc_7886:				; CODE XREF: AI_CombatDecision_Major+28Aj
		or	al, al
		jnz	short loc_788D
		jmp	loc_7945
; ���������������������������������������������������������������������������

loc_788D:				; CODE XREF: AI_CombatDecision_Major+290j
		lea	ax, [bp+var_1A]
		push	ax

loc_7891:
		push	ss
		lea	ax, [bp+var_76]
		push	ax
		call	Math_Square_54C39
		add	sp, 6
		mov	eax, [bp+var_76]
		mov	[bp+var_6A], eax
		shl	eax, 4
		mov	[bp+var_7A], eax
		mov	[bp+var_7E], eax
		mov	[bp+var_66], eax
		mov	ebx, 0FFFFFFF6h
		cdq
		idiv	ebx
		mov	[bp+var_66], eax
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	[bp+var_66], eax
		cmp	[bp+var_66], 0FFFFF000h
		jge	short loc_78E3
		mov	ax, 1
		jmp	short loc_78E5
; ���������������������������������������������������������������������������

loc_78E3:				; CODE XREF: AI_CombatDecision_Major+2E4j
		xor	ax, ax

loc_78E5:				; CODE XREF: AI_CombatDecision_Major+2E9j
		or	al, al
		jz	short loc_78FB
		mov	[bp+var_82], 0FFFFF000h
		mov	eax, [bp+var_82]
		mov	[bp+var_66], eax

loc_78FB:				; CODE XREF: AI_CombatDecision_Major+2EFj
		push	5
		mov	[bp+var_86], 0
		lea	ax, [bp+var_86]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_TurnToHeadingCmd
		add	sp, 8
		or	al, al
		jnz	short loc_791E
		jmp	loc_7B19
; ���������������������������������������������������������������������������

loc_791E:				; CODE XREF: AI_CombatDecision_Major+321j
		lea	ax, [bp+var_66]
		push	ax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_8A]
		push	ax
		push	cs
		call	near ptr Value_ClampSymmetric
		add	sp, 0Ah
		mov	eax, [bp+var_8A]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8E]
		jmp	loc_7AED
; ���������������������������������������������������������������������������

loc_7945:				; CODE XREF: AI_CombatDecision_Major+292j
		lea	ax, [bp+var_32]
		push	ax
		push	ss
		lea	ax, [bp+var_92]
		push	ax
		call	Math_Square_54C39
		add	sp, 6
		mov	eax, [bp+var_92]
		mov	[bp+var_6A], eax
		shl	eax, 4
		mov	[bp+var_96], eax
		mov	[bp+var_9A], eax
		mov	[bp+var_66], eax
		mov	ebx, 14h
		cdq
		idiv	ebx
		mov	[bp+var_66], eax
		cdq
		idiv	ebx
		mov	[bp+var_66], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0Bh]

loc_7991:
		add	si, 71h	; 'q'
		mov	eax, [bp+var_66]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8

loc_79A3:
		mov	[bp+var_66], eax
		mov	ebx, 10Eh
		mov	eax, [bp+var_66]
		cdq
		idiv	ebx
		mov	[bp+var_66], eax
		cmp	[bp+var_66], 1000h
		jl	short loc_79C9
		mov	ax, 1
		jmp	short loc_79CB
; ���������������������������������������������������������������������������

loc_79C9:				; CODE XREF: AI_CombatDecision_Major+3CAj
		xor	ax, ax

loc_79CB:				; CODE XREF: AI_CombatDecision_Major+3CFj
		or	al, al
		jz	short loc_79ED
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		mov	[bp+var_9E], 1000h
		mov	eax, [bp+var_9E]
		mov	[bp+var_66], eax

loc_79ED:				; CODE XREF: AI_CombatDecision_Major+3D5j
		mov	si, di
		mov	eax, [bp+var_6A]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_A2], eax
		mov	ebx, 14h
		cdq
		idiv	ebx
		mov	[bp+var_A2], eax
		cdq
		idiv	ebx
		mov	[bp+var_A2], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+0Bh]
		add	si, 71h	; 'q'
		mov	eax, [bp+var_A2]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A2], eax
		mov	ebx, 10Eh
		mov	eax, [bp+var_A2]
		cdq
		idiv	ebx
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_A2]
		or	eax, eax
		jge	short loc_7A68
		neg	eax

loc_7A68:				; CODE XREF: AI_CombatDecision_Major+46Bj
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_AE], eax
		mov	si, di
		mov	eax, [si]
		or	eax, eax
		jge	short loc_7A84
		neg	eax

loc_7A84:				; CODE XREF: AI_CombatDecision_Major+487j
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_B6], eax

loc_7A93:
		mov	eax, [bp+var_AE]

loc_7A98:
		cmp	eax, [bp+var_B6]

loc_7A9D:
		jle	short loc_7AA4
		mov	ax, 1
		jmp	short loc_7AA6
; ���������������������������������������������������������������������������

loc_7AA4:				; CODE XREF: AI_CombatDecision_Major:loc_7A9Dj
		xor	ax, ax

loc_7AA6:				; CODE XREF: AI_CombatDecision_Major+4AAj
		or	al, al
		jz	short loc_7AB2
		mov	eax, [di]
		mov	[bp+var_A2], eax

loc_7AB2:				; CODE XREF: AI_CombatDecision_Major+4B0j
		push	5
		lea	ax, [bp+var_A2]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_FlightControl_Cluster
		add	sp, 8
		or	al, al
		jz	short loc_7B19
		lea	ax, [bp+var_66]
		push	ax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_BA]
		push	ax
		push	cs
		call	near ptr Value_ClampSymmetric
		add	sp, 0Ah
		mov	eax, [bp+var_BA]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_BE]

loc_7AED:				; CODE XREF: AI_CombatDecision_Major+219j
					; AI_CombatDecision_Major+34Aj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		jmp	short loc_7B19
; ���������������������������������������������������������������������������

loc_7AFB:				; CODE XREF: AI_CombatDecision_Major+137j
		push	2
		mov	[bp+var_2E], 0
		lea	ax, [bp+var_2E]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_TurnToHeadingCmd
		add	sp, 8
		mov	[bp+var_1], 1

loc_7B19:				; CODE XREF: AI_CombatDecision_Major+D3j
					; AI_CombatDecision_Major+1E2j ...
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
AI_CombatDecision_Major	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,384L — appelée par sub_7E18 (commande de virage vers un angle à un taux donné) :
; candidat fort pour le contrôleur de roulis/virage (aileron command law) — à approfondir.
; ==============================================================================================
AI_RollRateController	proc far		; CODE XREF: AI_TurnToBearingCmd+35p

var_9A		= dword	ptr -9Ah
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1D		= byte ptr -1Dh
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 9Ah
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0B400h
		jle	short loc_7B46
		sub	[bp+var_4], 16800h
		jmp	short loc_7B5A
; ���������������������������������������������������������������������������

loc_7B46:				; CODE XREF: AI_RollRateController+1Aj
		cmp	[bp+var_4], 0FFFF4C00h
		jge	short loc_7B5A
		add	[bp+var_4], 16800h
		jmp	short $+2

loc_7B5A:				; CODE XREF: AI_RollRateController+24j AI_RollRateController+2Ej
		mov	[bp+var_5], 1
		mov	eax, [bp+var_4]
		or	eax, eax
		jge	short loc_7B6A
		neg	eax

loc_7B6A:				; CODE XREF: AI_RollRateController+45j
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		mov	ax, [bp+arg_6]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		shl	eax, 8
		cmp	eax, [bp+var_E]
		jge	short loc_7B90
		mov	ax, 1
		jmp	short loc_7B92
; ���������������������������������������������������������������������������

loc_7B90:				; CODE XREF: AI_RollRateController+69j
		xor	ax, ax

loc_7B92:				; CODE XREF: AI_RollRateController+6Ej
		or	al, al
		jnz	short loc_7B99
		jmp	loc_7DE0
; ���������������������������������������������������������������������������

loc_7B99:				; CODE XREF: AI_RollRateController+74j
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		push	cs
		call	near ptr AI_Sensor_HeadingNormalized
		add	sp, 8
		mov	eax, [bp+var_1C]
		or	eax, eax
		jge	short loc_7BB5
		neg	eax

loc_7BB5:				; CODE XREF: AI_RollRateController+90j
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_26], eax
		cmp	[bp+var_26], 5A00h
		jle	short loc_7BD0
		mov	ax, 1
		jmp	short loc_7BD2
; ���������������������������������������������������������������������������

loc_7BD0:				; CODE XREF: AI_RollRateController+A9j
		xor	ax, ax

loc_7BD2:				; CODE XREF: AI_RollRateController+AEj
		mov	[bp+var_1D], al
		cmp	[bp+var_4], 0FFFFF100h
		jge	short loc_7BE4
		mov	ax, 1
		jmp	short loc_7BE6
; ���������������������������������������������������������������������������

loc_7BE4:				; CODE XREF: AI_RollRateController+BDj
		xor	ax, ax

loc_7BE6:				; CODE XREF: AI_RollRateController+C2j
		or	al, al
		jnz	short loc_7C08
		cmp	[bp+var_1D], 0
		jnz	short loc_7BF3
		jmp	loc_7CD9
; ���������������������������������������������������������������������������

loc_7BF3:				; CODE XREF: AI_RollRateController+CEj
		cmp	[bp+var_4], 0
		jge	short loc_7BFF
		mov	ax, 1
		jmp	short loc_7C01
; ���������������������������������������������������������������������������

loc_7BFF:				; CODE XREF: AI_RollRateController+D8j
		xor	ax, ax

loc_7C01:				; CODE XREF: AI_RollRateController+DDj
		or	al, al
		jnz	short loc_7C08
		jmp	loc_7CD9
; ���������������������������������������������������������������������������

loc_7C08:				; CODE XREF: AI_RollRateController+C8j AI_RollRateController+E3j
		push	5
		mov	[bp+var_2E], 0B400h
		lea	ax, [bp+var_2E]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_TurnToHeadingCmd
		add	sp, 8
		mov	eax, [bp+var_1C]
		or	eax, eax
		jge	short loc_7C2E
		neg	eax

loc_7C2E:				; CODE XREF: AI_RollRateController+109j
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_36], eax
		cmp	[bp+var_36], 0A500h
		jle	short loc_7C49
		mov	ax, 1
		jmp	short loc_7C4B
; ���������������������������������������������������������������������������

loc_7C49:				; CODE XREF: AI_RollRateController+122j
		xor	ax, ax

loc_7C4B:				; CODE XREF: AI_RollRateController+127j
		or	al, al
		jnz	short loc_7C52
		jmp	loc_7DDA
; ���������������������������������������������������������������������������

loc_7C52:				; CODE XREF: AI_RollRateController+12Dj
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_3A], eax
		mov	[bp+var_3E], eax
		cmp	[bp+var_3E], 0F00h
		jle	short loc_7C70
		mov	ax, 1
		jmp	short loc_7C72
; ���������������������������������������������������������������������������

loc_7C70:				; CODE XREF: AI_RollRateController+149j
		xor	ax, ax

loc_7C72:				; CODE XREF: AI_RollRateController+14Ej
		or	al, al
		jz	short loc_7CA6
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_42], eax
		mov	[bp+var_46], eax
		shl	eax, 4
		mov	[bp+var_4A], eax
		mov	[bp+var_4E], eax
		mov	ebx, 0Fh
		cdq
		idiv	ebx
		mov	[bp+var_52], eax
		mov	[bp+var_56], eax
		jmp	short loc_7CB2
; ���������������������������������������������������������������������������

loc_7CA6:				; CODE XREF: AI_RollRateController+154j
		mov	[bp+var_5A], 1000h
		mov	eax, [bp+var_5A]

loc_7CB2:				; CODE XREF: AI_RollRateController+184j
		mov	[bp+var_2A], eax
		lea	ax, [bp+var_2A]
		push	ax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_5E]
		push	ax
		push	cs
		call	near ptr Value_ClampSymmetric
		add	sp, 0Ah
		mov	eax, [bp+var_5E]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_62]
		jmp	loc_7DCE
; ���������������������������������������������������������������������������

loc_7CD9:				; CODE XREF: AI_RollRateController+D0j AI_RollRateController+E5j
		push	5
		mov	[bp+var_66], 0
		lea	ax, [bp+var_66]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_TurnToHeadingCmd
		add	sp, 8
		mov	eax, [bp+var_1C]
		or	eax, eax
		jge	short loc_7CFF
		neg	eax

loc_7CFF:				; CODE XREF: AI_RollRateController+1DAj
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_6E], eax
		cmp	[bp+var_6E], 0F00h
		jge	short loc_7D1A
		mov	ax, 1
		jmp	short loc_7D1C
; ���������������������������������������������������������������������������

loc_7D1A:				; CODE XREF: AI_RollRateController+1F3j
		xor	ax, ax

loc_7D1C:				; CODE XREF: AI_RollRateController+1F8j
		or	al, al
		jnz	short loc_7D23
		jmp	loc_7DDA
; ���������������������������������������������������������������������������

loc_7D23:				; CODE XREF: AI_RollRateController+1FEj
		cmp	[bp+var_4], 0
		jge	short loc_7D2F
		mov	ax, 1
		jmp	short loc_7D31
; ���������������������������������������������������������������������������

loc_7D2F:				; CODE XREF: AI_RollRateController+208j
		xor	ax, ax

loc_7D31:				; CODE XREF: AI_RollRateController+20Dj
		or	al, al
		jz	short loc_7D5A
		mov	eax, [bp+var_4]
		shl	eax, 4
		mov	[bp+var_72], eax
		mov	[bp+var_76], eax
		mov	ebx, 0Fh
		cdq
		idiv	ebx
		mov	[bp+var_7A], eax
		mov	[bp+var_7E], eax
		jmp	short loc_7DA6
; ���������������������������������������������������������������������������

loc_7D5A:				; CODE XREF: AI_RollRateController+213j
		cmp	[bp+var_4], 0F00h
		jge	short loc_7D69
		mov	ax, 1
		jmp	short loc_7D6B
; ���������������������������������������������������������������������������

loc_7D69:				; CODE XREF: AI_RollRateController+242j
		xor	ax, ax

loc_7D6B:				; CODE XREF: AI_RollRateController+247j
		or	al, al
		jz	short loc_7D98
		mov	eax, [bp+var_4]
		shl	eax, 4
		mov	[bp+var_82], eax
		mov	[bp+var_86], eax
		mov	ebx, 0Fh
		cdq
		idiv	ebx
		mov	[bp+var_8A], eax

loc_7D91:
		mov	[bp+var_8E], eax

loc_7D96:
		jmp	short loc_7DA6
; ���������������������������������������������������������������������������

loc_7D98:				; CODE XREF: AI_RollRateController+24Dj
		mov	[bp+var_92], 1000h
		mov	eax, [bp+var_92]

loc_7DA6:				; CODE XREF: AI_RollRateController+238j
					; AI_RollRateController:loc_7D96j
		mov	[bp+var_2A], eax
		lea	ax, [bp+var_2A]
		push	ax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_96]
		push	ax
		push	cs
		call	near ptr Value_ClampSymmetric
		add	sp, 0Ah
		mov	eax, [bp+var_96]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_9A]

loc_7DCE:				; CODE XREF: AI_RollRateController+1B6j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax

loc_7DDA:				; CODE XREF: AI_RollRateController+12Fj
					; AI_RollRateController+200j
		mov	[bp+var_5], 0
		jmp	short loc_7E12
; ���������������������������������������������������������������������������

loc_7DE0:				; CODE XREF: AI_RollRateController+76j
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		push	5
		mov	[bp+var_18], 0
		lea	ax, [bp+var_18]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AI_TurnToHeadingCmd
		add	sp, 8

loc_7E12:				; CODE XREF: AI_RollRateController+2BEj
		mov	al, [bp+var_5]
		pop	si
		leave
		retf
AI_RollRateController	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,36L — calcule l'écart entre un angle cible et le bearing courant (sub_59A5), puis
; appelle sub_7B20(delta, taux) : commande de virage vers un cap à un taux donné (fonction de
; pilotage IA).
; ==============================================================================================
AI_TurnToBearingCmd	proc far		; CODE XREF: AI_EvadeOrPursueSelector+73p
					; AI_EvadeOrPursueSelector+14Ep ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		mov	[bp+var_4], eax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr AI_Sensor_SecondaryAngle
		add	sp, 8
		mov	eax, [bp+var_8]
		sub	[bp+var_4], eax
		push	[bp+arg_6]
		lea	ax, [bp+var_4]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_RollRateController
		add	sp, 8
		pop	si
		leave
		retf
AI_TurnToBearingCmd	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,101L — normalise un angle (wraparound ±0xB400), stocke un compteur HUD (+0x23), compare
; la magnitude à un taux×256 : contrôleur de roulis/tangage basé sur un delta d'angle et un
; taux (variante de sub_7B20 utilisant le cap sub_58F4).
; ==============================================================================================
AI_PitchRollController_Heading	proc far		; CODE XREF: AI_TurnToHeadingCmd+35p seg008:1E5DP ...

var_28		= dword	ptr -28h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	dl, 1
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+23h], eax
		cmp	[bp+var_4], 0B400h
		jle	short loc_7E95
		sub	[bp+var_4], 16800h
		jmp	short loc_7EA9
; ���������������������������������������������������������������������������

loc_7E95:				; CODE XREF: AI_PitchRollController_Heading+33j
		cmp	[bp+var_4], 0FFFF4C00h
		jge	short loc_7EA9

loc_7E9F:
		add	[bp+var_4], 16800h

loc_7EA7:
		jmp	short $+2

loc_7EA9:				; CODE XREF: AI_PitchRollController_Heading+3Dj AI_PitchRollController_Heading+47j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Bh], 0
		jz	short loc_7F2F
		mov	eax, [bp+var_4]
		or	eax, eax
		jge	short loc_7EBF
		neg	eax

loc_7EBF:				; CODE XREF: AI_PitchRollController_Heading+64j
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	ax, [bp+arg_6]
		mov	[bp+var_12], ax
		movsx	eax, [bp+var_12]
		shl	eax, 8
		cmp	eax, [bp+var_10]
		jge	short loc_7EE5
		mov	ax, 1
		jmp	short loc_7EE7
; ���������������������������������������������������������������������������

loc_7EE5:				; CODE XREF: AI_PitchRollController_Heading+88j
		xor	ax, ax

loc_7EE7:				; CODE XREF: AI_PitchRollController_Heading+8Dj
		or	al, al
		jz	short loc_7F2F
		sub	sp, 4
		mov	eax, [bp+var_4]
		mov	[bp+var_28], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Bh]
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		call	JDYN_HighLevelPhysicsCalc
		add	sp, 0Ah
		mov	eax, [bp+var_16]
		neg	eax
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+23h], eax
		mov	dl, 0

loc_7F2F:				; CODE XREF: AI_PitchRollController_Heading+5Bj AI_PitchRollController_Heading+93j
		mov	al, dl
		pop	si
		leave
		retf
AI_PitchRollController_Heading	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,245L — fonction du même cluster (probable suite de sub_7B20/sub_7E56, logique de
; contrôle de vol IA) — à approfondir.
; ==============================================================================================
AI_FlightControl_Cluster	proc far		; CODE XREF: AI_CombatDecision_Major+1AEp
					; AI_CombatDecision_Major+4C7p

var_66		= dword	ptr -66h
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
var_1C		= word ptr -1Ch
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 60h
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	[bp+var_5], 1
		mov	[bp+var_A], 0
		mov	eax, [bp+var_A]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+23h], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 0E9h ; '�'
		mov	word ptr [bp+var_12+2],	ax
		mov	word ptr [bp+var_12], dx
		les	bx, [bp+var_12]
		mov	eax, es:[bx]
		mov	[bp+var_E], eax
		cmp	[bp+var_4], 0B400h
		jle	short loc_7F90
		sub	[bp+var_4], 16800h
		jmp	short loc_7FA4
; ���������������������������������������������������������������������������

loc_7F90:				; CODE XREF: AI_FlightControl_Cluster+50j
		cmp	[bp+var_4], 0FFFF4C00h

loc_7F98:
		jge	short loc_7FA4

loc_7F9A:
		add	[bp+var_4], 16800h

loc_7FA2:
		jmp	short $+2

loc_7FA4:				; CODE XREF: AI_FlightControl_Cluster+5Aj
					; AI_FlightControl_Cluster:loc_7F98j
		cmp	[bp+var_E], 5A00h
		jge	short loc_7FB3
		mov	ax, 1
		jmp	short loc_7FB5
; ���������������������������������������������������������������������������

loc_7FB3:				; CODE XREF: AI_FlightControl_Cluster+78j
		xor	ax, ax

loc_7FB5:				; CODE XREF: AI_FlightControl_Cluster+7Dj
		or	al, al
		jnz	short loc_7FBC
		jmp	loc_8076
; ���������������������������������������������������������������������������

loc_7FBC:				; CODE XREF: AI_FlightControl_Cluster+83j
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		push	cs
		call	near ptr AI_Sensor_HeadingNormalized
		add	sp, 8
		mov	eax, [bp+var_34]

loc_7FD0:
		add	eax, [bp+var_4]

loc_7FD4:
		mov	[bp+var_38], eax
		mov	[bp+var_30], eax

loc_7FDC:
		cmp	eax, [bp+var_E]

loc_7FE0:
		jle	short loc_7FE7

loc_7FE2:
		mov	ax, 1
		jmp	short loc_7FE9
; ���������������������������������������������������������������������������

loc_7FE7:				; CODE XREF: AI_FlightControl_Cluster:loc_7FE0j
		xor	ax, ax

loc_7FE9:				; CODE XREF: AI_FlightControl_Cluster+B1j
		or	al, al
		jz	short loc_801B
		mov	eax, [bp+var_E]
		mov	[bp+var_30], eax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_3C]
		push	ax
		push	cs
		call	near ptr AI_Sensor_HeadingNormalized
		add	sp, 8
		mov	eax, [bp+var_30]
		sub	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		mov	[bp+var_4], eax
		jmp	short loc_8076
; ���������������������������������������������������������������������������

loc_801B:				; CODE XREF: AI_FlightControl_Cluster+B7j
		mov	eax, [bp+var_E]
		neg	eax
		mov	[bp+var_48], eax
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_30]
		cmp	eax, [bp+var_4C]
		jge	short loc_8039
		mov	ax, 1
		jmp	short loc_803B
; ���������������������������������������������������������������������������

loc_8039:				; CODE XREF: AI_FlightControl_Cluster+FEj
		xor	ax, ax

loc_803B:				; CODE XREF: AI_FlightControl_Cluster+103j
		or	al, al
		jz	short loc_8076
		mov	eax, [bp+var_E]
		neg	eax
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		mov	[bp+var_30], eax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_58]
		push	ax
		push	cs
		call	near ptr AI_Sensor_HeadingNormalized
		add	sp, 8
		mov	eax, [bp+var_30]
		sub	eax, [bp+var_58]
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		mov	[bp+var_4], eax

loc_8076:				; CODE XREF: AI_FlightControl_Cluster+85j AI_FlightControl_Cluster+E5j ...
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0Bh], 0
		jz	short loc_80FE
		mov	eax, [bp+var_4]
		or	eax, eax
		jge	short loc_808C
		neg	eax

loc_808C:				; CODE XREF: AI_FlightControl_Cluster+153j
		mov	[bp+var_16], eax

loc_8090:
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	ax, [bp+arg_6]

loc_809B:
		mov	[bp+var_1C], ax

loc_809E:
		movsx	eax, [bp+var_1C]

loc_80A3:
		shl	eax, 8
		cmp	eax, [bp+var_1A]
		jge	short loc_80B2
		mov	ax, 1
		jmp	short loc_80B4
; ���������������������������������������������������������������������������

loc_80B2:				; CODE XREF: AI_FlightControl_Cluster+177j
		xor	ax, ax

loc_80B4:				; CODE XREF: AI_FlightControl_Cluster+17Cj
		or	al, al
		jz	short loc_80FE
		sub	sp, 4
		mov	eax, [bp+var_4]
		mov	[bp+var_66], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0Bh]
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	JDYN_HighLevelPhysicsCalc
		add	sp, 0Ah

loc_80D7:
		mov	eax, [bp+var_20]
		neg	eax

loc_80DE:
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+23h], eax
		mov	[bp+var_5], 0

loc_80FE:				; CODE XREF: AI_FlightControl_Cluster+14Aj
					; AI_FlightControl_Cluster+182j
		mov	al, [bp+var_5]
		pop	si
		leave
		retf
AI_FlightControl_Cluster	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,38L — calcule l'écart entre un cap cible et le cap courant (sub_58F4), puis appelle
; sub_7E56(delta, taux) : commande de roulis/tangage vers un cap à un taux donné, variante de
; sub_7E18 basée sur le cap plutôt que le bearing.
; ==============================================================================================
AI_TurnToHeadingCmd	proc far		; CODE XREF: AI_ManeuverSolution_Major+52Dp
					; AI_CombatDecision_Major+319p ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		mov	[bp+var_4], eax
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr AI_Sensor_HeadingNormalized
		add	sp, 8
		mov	eax, [bp+var_8]
		sub	[bp+var_4], eax
		push	[bp+arg_6]
		lea	ax, [bp+var_4]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_PitchRollController_Heading
		add	sp, 8
		pop	si

locret_8140:
		leave
		retf
AI_TurnToHeadingCmd	endp

; ���������������������������������������������������������������������������

loc_8142:				; DATA XREF: seg339:off_6D1D4o
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_8147:				; DATA XREF: seg339:off_71E42o
		push	bp
		mov	bp, sp
		pop	bp
		retf
seg003		ends
