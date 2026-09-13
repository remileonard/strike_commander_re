seg001		segment	byte public 'CODE' use16
		assume cs:seg001
		;org 0Bh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 169 lignes - LUE INTEGRALEMENT (correction : precedemment ecartee a tort comme 'sans
; rapport avec MVRS'). Utilise REELLEMENT le noeud ID=20 (entite+0xC1, construit en dur via
; push 0x14 dans PilotProfile_LoadFromPROF) comme OUTIL GEOMETRIQUE REUTILISABLE, hors
; tournoi. Calcule le delta de position entre l'entite et deux references (arg_4, arg_6),
; transforme via sub_550B7, PUIS APPELLE LE SCORE DE ID=20 ([entite+0xC1->vtable+4]) et
; compare a 5. SI < 5 (mauvaise orientation/angle) : NEGATE le delta, calcule sa longueur
; (Math_VectorLength3D_Raw_5828E), et SI < 256 (0x100, TROP PROCHE) declenche une ALERTE
; (Utility_Helper_55DB4, constante 0x3E80005, code 5) - probable avertissement de
; proximite/collision. TOUJOURS a la fin : appelle l'APPLY de ID=20 ([entite+0xC1->vtable+8]).
; CONFIRME que ID=20 sert de solveur geometrique partage, pas un instinct classique du tournoi
; consomme via le tableau MVRS du fichier.
; ==============================================================================================
AI_ProximityGeometricWarning_315B	proc far		; CODE XREF: AI_VisibilityTest+260P

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
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4Ah
		push	si
		push	di
		mov	dx, [bp+arg_4]
		mov	[bp+var_A], 0
		xor	ax, ax
		mov	[bp+var_6], ax
		mov	[bp+var_8], ax
		mov	[bp+var_E], 200h
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+102h]
		add	si, 12h
		mov	di, dx
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_26], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_22], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_1E], eax
		mov	si, [bp+arg_6]
		mov	di, dx
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_32], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_2E], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_36], eax
		lea	ax, [bp+var_3E]
		push	ax
		lea	ax, [bp+var_26]
		push	ax
		push	ss
		lea	ax, [bp+var_4A]
		push	ax
		call	Vector_TransformHelperA_550B7
		add	sp, 8
		mov	eax, [bp+var_4A]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_1E], eax
		mov	[bp+var_12], 200h
		mov	eax, [bp+var_12]
		mov	[bp+var_4], eax
		lea	ax, [bp+var_26]
		mov	[bp+var_6], ax
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_324C
		push	large dword ptr	es:[bx+0Dh]
		call	VROOMM_StubThunk_6AB54
		add	sp, 4

loc_324C:				; CODE XREF: AI_ProximityGeometricWarning_315B+E2j
		mov	byte_72052, 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0C1h]
		mov	byte ptr es:[bx+0Ch], 0
		lea	ax, [bp+var_A]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0C1h]
		les	bx, es:[bx+0C1h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	ah, 0
		cmp	ax, 5
		jge	short loc_32F5
		mov	eax, [bp+var_26]
		neg	eax
		mov	[bp+var_26], eax
		mov	eax, [bp+var_22]
		neg	eax
		mov	[bp+var_22], eax
		mov	eax, [bp+var_1E]
		neg	eax
		mov	[bp+var_1E], eax
		push	eax
		push	large [bp+var_22]
		push	large [bp+var_26]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		cmp	[bp+var_1A], 100h
		jge	short loc_32CE
		mov	ax, 1
		jmp	short loc_32D0
; ���������������������������������������������������������������������������

loc_32CE:				; CODE XREF: AI_ProximityGeometricWarning_315B+16Cj
		xor	ax, ax

loc_32D0:				; CODE XREF: AI_ProximityGeometricWarning_315B+171j
		or	al, al
		jz	short loc_32E8
		push	large 3E80005h
		push	5
		lea	ax, [bp+var_26]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8

loc_32E8:				; CODE XREF: AI_ProximityGeometricWarning_315B+177j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0C1h]
		mov	byte ptr es:[bx+0Ch], 0

loc_32F5:				; CODE XREF: AI_ProximityGeometricWarning_315B+123j
		lea	ax, [bp+var_A]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0C1h]
		les	bx, es:[bx+0C1h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
AI_ProximityGeometricWarning_315B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,1347L — CORRECTION D'ERREUR : ce n'est PAS un tick physique, malgré le nom initial
; 'Flight_PhysicsTick_JDYN' donné par erreur dans une session précédente sur la seule base
; d'une hypothèse de structure, jamais vérifiée en détail. Lecture complète effectuée : la
; fonction lit le timer PIT à des fins de PROFILING uniquement (accumulation dans
; word_704E6[0x5B2E]), initialise un score à -5000, pondère par les attributs de compétence
; pilote (+0xB0/+0xB8), vérifie la disponibilité de 4 masques de type d'arme via
; WeaponStation_FindLoadedCompatible, puis itère sur tous les objets du monde
; (World_IterateObjects) en calculant pour chacun distance+angle d'aspect, un score pondéré
; par bonus de portée/catégorie/ligne de vue (catégorie 2=aéronef, 6=missile, 8=contre-mesure,
; 0x13=catégorie spéciale), avec lecture de flags_75 bit5 du propriétaire pour les candidats
; missile. À la fin, assigne via SetReference les 3 champs +0x281 (décoy/chaff), +0x283 (cible
; principale), +0x287 (menace/missile) du meilleur candidat trouvé, avec traitement spécial si
; c'est un leurre (catégorie 8 : verrouillage forcé + 0x27F=2). C'est le sélecteur de
; cible/menace générique du jeu, utilisé par l'IA (appelée depuis AI_BehaviorStateMachine,
; sub_9D05) et probablement le joueur.
; ==============================================================================================
Targeting_AcquireBestThreat	proc far		; CODE XREF: AI_TopLevelThink+23P AI_BehaviorStateMachine_WeightedOptionSelector_9D05+75P ...

var_100		= dword	ptr -100h
var_FC		= dword	ptr -0FCh
var_F8		= dword	ptr -0F8h
var_F4		= dword	ptr -0F4h
var_F0		= dword	ptr -0F0h
var_EC		= dword	ptr -0ECh
var_E8		= dword	ptr -0E8h
var_E4		= dword	ptr -0E4h
var_E0		= dword	ptr -0E0h
var_DC		= dword	ptr -0DCh
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
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= word ptr -5Ch
var_58		= word ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= word ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= dword	ptr -38h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= dword	ptr -24h
var_20		= byte ptr -20h
var_1E		= byte ptr -1Eh
var_1D		= byte ptr -1Dh
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 100h
		push	si
		push	di
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+28Dh], 0F7h
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 2
		jnz	short loc_3344
		mov	byte ptr es:[bx+27Fh], 0

loc_3344:				; CODE XREF: Targeting_AcquireBestThreat+28j
		cmp	byte_6E33B, 0
		jz	short loc_3392
		mov	ax, word_722E6
		mov	[bp+var_6], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 287h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 281h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 283h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	ax, word_722E6
		jmp	loc_3E8C
; ���������������������������������������������������������������������������

loc_3392:				; CODE XREF: Targeting_AcquireBestThreat+35j
		mov	[bp+var_7], 0
		mov	[bp+var_8], 0
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	[bp+var_E], 0
		cmp	[bp+var_C], 0
		jz	short loc_33EA
		les	bx, [bp+var_C]
		mov	al, es:[bx+52h]
		mov	ah, 0
		mov	[bp+var_E], ax
		cmp	[bp+var_E], 9
		jl	short loc_33D5
		mov	ax, 1
		jmp	short loc_33D7
; ���������������������������������������������������������������������������

loc_33D5:				; CODE XREF: Targeting_AcquireBestThreat+BAj
		xor	ax, ax

loc_33D7:				; CODE XREF: Targeting_AcquireBestThreat+BFj
		mov	[bp+var_7], al
		cmp	[bp+var_E], 6
		jl	short loc_33E5
		mov	ax, 1
		jmp	short loc_33E7
; ���������������������������������������������������������������������������

loc_33E5:				; CODE XREF: Targeting_AcquireBestThreat+CAj
		xor	ax, ax

loc_33E7:				; CODE XREF: Targeting_AcquireBestThreat+CFj
		mov	[bp+var_8], al

loc_33EA:				; CODE XREF: Targeting_AcquireBestThreat+A8j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+17Ah], 0
		mov	[bp+var_14], 0EC78h
		mov	al, es:[bx+0B8h]
		cbw
		push	ax
		mov	al, es:[bx+0B0h]
		cbw
		pop	dx
		sub	dx, ax
		add	dx, 10h
		mov	[bp+var_16], dx
		mov	al, es:[bx+0B0h]
		cbw
		push	ax
		mov	al, es:[bx+0B8h]
		cbw
		pop	dx
		sub	dx, ax
		add	dx, 10h
		mov	[bp+var_18], dx
		mov	[bp+var_1A], 0
		push	1
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	[bp+var_1B], al
		push	3
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	[bp+var_1C], al
		push	700h
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	[bp+var_1D], al
		push	83Ch
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+104h]
		call	WeaponStation_FindLoadedCompatible
		add	sp, 6
		mov	[bp+var_1E], al
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_D0], eax
		mov	eax, [si+4]
		mov	[bp+var_CC], eax
		mov	eax, [si+8]
		mov	[bp+var_C8], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+102h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_DC], eax
		mov	eax, [si+4]
		mov	[bp+var_D8], eax
		mov	eax, [si+8]
		mov	[bp+var_D4], eax
		mov	[bp+var_2E], 0
		cmp	word ptr es:[bx+137h], 0
		jz	short loc_34FD
		push	word ptr es:[bx+137h]
		mov	bx, es:[bx+137h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_2E+2],	dx
		mov	word ptr [bp+var_2E], ax

loc_34FD:				; CODE XREF: Targeting_AcquireBestThreat+1D2j
		cmp	[bp+var_2E], 0
		jz	short loc_3519
		push	large [bp+var_2E]
		les	bx, [bp+var_2E]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	ah, 0
		mov	[bp+var_30], ax

loc_3519:				; CODE XREF: Targeting_AcquireBestThreat+1EEj
		mov	[bp+var_32], 0
		jmp	loc_3D87
; ���������������������������������������������������������������������������

loc_3521:				; CODE XREF: Targeting_AcquireBestThreat+A86j
		mov	ax, [bp+var_32]
		mov	[bp+var_34], ax
		cmp	[bp+var_34], 0
		jnz	short loc_3530
		jmp	loc_3D87
; ���������������������������������������������������������������������������

loc_3530:				; CODE XREF: Targeting_AcquireBestThreat+217j
		push	ax
		mov	bx, [bp+var_34]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_38+2],	dx
		mov	word ptr [bp+var_38], ax
		cmp	[bp+var_38], 0
		jnz	short loc_3549
		jmp	loc_3D87
; ���������������������������������������������������������������������������

loc_3549:				; CODE XREF: Targeting_AcquireBestThreat+230j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		cmp	ax, [bp+var_34]
		jnz	short loc_3558
		jmp	loc_3D87
; ���������������������������������������������������������������������������

loc_3558:				; CODE XREF: Targeting_AcquireBestThreat+23Fj
		push	dx
		push	word ptr [bp+var_38]
		les	bx, [bp+var_38]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_20], al
		les	bx, [bp+var_38]
		cmp	byte ptr es:[bx+11h], 2
		jnz	short loc_357A
		mov	ax, 1
		jmp	short loc_357C
; ���������������������������������������������������������������������������

loc_357A:				; CODE XREF: Targeting_AcquireBestThreat+25Fj
		xor	ax, ax

loc_357C:				; CODE XREF: Targeting_AcquireBestThreat+264j
		mov	byte ptr [bp+var_3A+1],	al
		mov	byte ptr [bp+var_3A], 0
		cmp	[bp+var_20], 6
		jnz	short loc_35AC
		mov	bx, [bp+var_34]
		mov	si, [bx+51h]
		or	si, si
		jz	short loc_35AC
		push	si
		mov	bx, [si]
		call	dword ptr [bx+48h]
		pop	cx
		mov	si, ax
		or	si, si
		jz	short loc_35AC
		mov	al, [si+75h]
		shr	ax, 5
		and	ax, 1
		mov	byte ptr [bp+var_3A], al

loc_35AC:				; CODE XREF: Targeting_AcquireBestThreat+273j
					; Targeting_AcquireBestThreat+27Dj ...
		cmp	[bp+var_20], 8
		jnz	short loc_35BB
		mov	bx, [bp+var_34]
		mov	ax, [bx+55h]
		mov	[bp+var_3C], ax

loc_35BB:				; CODE XREF: Targeting_AcquireBestThreat+29Cj
		cmp	[bp+var_20], 8
		jnz	short loc_35DD
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+102h]
		cmp	ax, [bp+var_3C]
		jnz	short loc_35DD
		les	bx, [bp+var_38]
		cmp	byte ptr es:[bx+4Eh], 1
		jnz	short loc_35DD
		mov	ax, 1
		jmp	short loc_35DF
; ���������������������������������������������������������������������������

loc_35DD:				; CODE XREF: Targeting_AcquireBestThreat+2ABj
					; Targeting_AcquireBestThreat+2B8j ...
		xor	ax, ax

loc_35DF:				; CODE XREF: Targeting_AcquireBestThreat+2C7j
		mov	[bp+var_F], al
		mov	bx, [bp+var_34]
		mov	al, [bx+50h]
		cbw
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+102h]
		push	ax
		mov	al, [bx+50h]
		cbw
		neg	ax
		pop	dx
		cmp	dx, ax
		jnz	short loc_3602
		mov	ax, 1
		jmp	short loc_3604
; ���������������������������������������������������������������������������

loc_3602:				; CODE XREF: Targeting_AcquireBestThreat+2E7j
		xor	ax, ax

loc_3604:				; CODE XREF: Targeting_AcquireBestThreat+2ECj
		mov	dl, al
		or	dl, dl
		jz	short loc_3621
		cmp	byte ptr [bp+var_3A+1],	0
		jz	short loc_3621
		cmp	[bp+arg_4], 0
		jz	short loc_3621
		cmp	[bp+var_1E], 0
		jz	short loc_3621
		mov	ax, 1
		jmp	short loc_3623
; ���������������������������������������������������������������������������

loc_3621:				; CODE XREF: Targeting_AcquireBestThreat+2F4j
					; Targeting_AcquireBestThreat+2FAj ...
		xor	ax, ax

loc_3623:				; CODE XREF: Targeting_AcquireBestThreat+30Bj
		mov	[bp+var_10], al
		or	dl, dl
		jz	short loc_364A
		cmp	[bp+var_20], 6
		jnz	short loc_364A
		mov	al, byte ptr [bp+var_3A]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_364A
		cmp	[bp+var_7], 0
		jnz	short loc_3645
		cmp	[bp+var_8], 0
		jz	short loc_364A

loc_3645:				; CODE XREF: Targeting_AcquireBestThreat+329j
		mov	ax, 1
		jmp	short loc_364C
; ���������������������������������������������������������������������������

loc_364A:				; CODE XREF: Targeting_AcquireBestThreat+314j
					; Targeting_AcquireBestThreat+31Aj ...
		xor	ax, ax

loc_364C:				; CODE XREF: Targeting_AcquireBestThreat+334j
		mov	dl, al
		cmp	[bp+var_F], 0
		jnz	short loc_3661
		or	dl, dl
		jnz	short loc_3661
		cmp	[bp+var_10], 0
		jnz	short loc_3661
		jmp	loc_3D87
; ���������������������������������������������������������������������������

loc_3661:				; CODE XREF: Targeting_AcquireBestThreat+33Ej
					; Targeting_AcquireBestThreat+342j ...
		xor	ax, ax
		mov	di, ax
		mov	ax, di
		mov	[bp+var_12], ax
		mov	si, ax
		mov	dx, [bp+var_34]
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_E8], eax
		mov	eax, [bx+4]
		mov	[bp+var_E4], eax
		mov	eax, [bx+8]
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_E8]
		sub	eax, [bp+var_DC]
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_E4]
		sub	eax, [bp+var_D8]
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_E0]
		sub	eax, [bp+var_D4]
		mov	[bp+var_B0], eax
		push	eax
		push	large [bp+var_B4]
		push	large [bp+var_B8]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		mov	[bp+var_24], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	ss
		lea	ax, [bp+var_48]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	ax, [bp+var_48+1]
		mov	[bp+var_26], ax
		push	large [bp+var_B0]
		push	large [bp+var_B4]
		push	large [bp+var_B8]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	[bp+var_24], eax
		cmp	byte ptr [bp+var_3A+1],	0
		jnz	short loc_373E
		jmp	loc_3837
; ���������������������������������������������������������������������������

loc_373E:				; CODE XREF: Targeting_AcquireBestThreat+425j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+137h]
		cmp	ax, [bp+var_34]
		jnz	short loc_3751
		add	si, 3
		add	di, 6

loc_3751:				; CODE XREF: Targeting_AcquireBestThreat+435j
		cmp	[bp+var_20], 13h
		jz	short loc_375A
		jmp	loc_37EE
; ���������������������������������������������������������������������������

loc_375A:				; CODE XREF: Targeting_AcquireBestThreat+441j
		mov	bx, [bp+var_34]
		cmp	dword ptr [bx+53h], 0
		jg	short loc_3767
		jmp	loc_37EE
; ���������������������������������������������������������������������������

loc_3767:				; CODE XREF: Targeting_AcquireBestThreat+44Ej
		mov	eax, [bp+var_38]
		mov	[bp+var_78], eax
		les	bx, [bp+var_78]
		mov	eax, es:[bx+3Eh]
		mov	[bp+var_7C], eax
		mov	[bp+var_80], eax
		shl	eax, 8
		cmp	eax, [bp+var_24]
		jge	short loc_378E
		mov	ax, 1
		jmp	short loc_3790
; ���������������������������������������������������������������������������

loc_378E:				; CODE XREF: Targeting_AcquireBestThreat+473j
		xor	ax, ax

loc_3790:				; CODE XREF: Targeting_AcquireBestThreat+478j
		or	al, al
		jz	short loc_379B
		mov	[bp+var_12], 0
		jmp	short loc_37DF
; ���������������������������������������������������������������������������

loc_379B:				; CODE XREF: Targeting_AcquireBestThreat+47Ej
		mov	[bp+var_84], 100h
		mov	eax, [bp+var_7C]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_24]
		cdq
		idiv	[bp+var_88]
		mov	[bp+var_8C], eax
		mov	[bp+var_90], eax
		sub	[bp+var_84], eax
		mov	eax, [bp+var_84]
		imul	eax, 0Ah
		mov	[bp+var_84], eax
		mov	ax, word ptr [bp+var_84+1]
		add	ax, 5
		mov	[bp+var_12], ax

loc_37DF:				; CODE XREF: Targeting_AcquireBestThreat+485j
		mov	al, [bp+var_1E]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_37F3
		add	[bp+var_12], 4
		jmp	short loc_37F3
; ���������������������������������������������������������������������������

loc_37EE:				; CODE XREF: Targeting_AcquireBestThreat+443j
					; Targeting_AcquireBestThreat+450j
		mov	[bp+var_12], 0

loc_37F3:				; CODE XREF: Targeting_AcquireBestThreat+4D2j
					; Targeting_AcquireBestThreat+4D8j
		mov	eax, dword_72030
		mov	[bp+var_54], eax
		shl	eax, 8
		cmp	eax, [bp+var_24]
		jl	short loc_380A
		mov	ax, 1
		jmp	short loc_380C
; ���������������������������������������������������������������������������

loc_380A:				; CODE XREF: Targeting_AcquireBestThreat+4EFj
		xor	ax, ax

loc_380C:				; CODE XREF: Targeting_AcquireBestThreat+4F4j
		or	al, al
		jz	short loc_3831
		cmp	[bp+var_26], 2Dh ; '-'
		jge	short loc_381F
		add	si, 5
		add	di, 6
		jmp	loc_3D08
; ���������������������������������������������������������������������������

loc_381F:				; CODE XREF: Targeting_AcquireBestThreat+500j
		cmp	[bp+var_26], 5Ah ; 'Z'
		jl	short loc_3828
		jmp	loc_3D08
; ���������������������������������������������������������������������������

loc_3828:				; CODE XREF: Targeting_AcquireBestThreat+50Fj
		add	si, 3
		add	di, 3
		jmp	loc_3D08
; ���������������������������������������������������������������������������

loc_3831:				; CODE XREF: Targeting_AcquireBestThreat+4FAj
		sub	si, 4
		jmp	loc_3D08
; ���������������������������������������������������������������������������

loc_3837:				; CODE XREF: Targeting_AcquireBestThreat+427j
		push	[bp+var_34]
		mov	bx, [bp+var_34]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	dx, ax
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_C4], eax
		mov	eax, [bx+4]
		mov	[bp+var_C0], eax
		mov	eax, [bx+8]
		mov	[bp+var_BC], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		push	ss
		lea	ax, [bp+var_58]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	ax, [bp+var_58+1]
		mov	[bp+var_28], ax
		mov	eax, [bp+var_C4]
		neg	eax
		mov	[bp+var_F4], eax
		mov	eax, [bp+var_C0]
		neg	eax
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_BC]
		neg	eax
		mov	[bp+var_EC], eax
		mov	eax, [bp+var_F4]
		mov	[bp+var_100], eax
		mov	eax, [bp+var_F0]
		mov	[bp+var_FC], eax
		mov	eax, [bp+var_EC]
		mov	[bp+var_F8], eax
		lea	ax, [bp+var_100]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	ss
		lea	ax, [bp+var_5C]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	ax, [bp+var_5C+1]
		mov	[bp+var_2A], ax
		cmp	[bp+var_2A], 5Ah ; 'Z'
		jle	short loc_3903
		mov	[bp+var_12], 0
		jmp	loc_3A9C
; ���������������������������������������������������������������������������

loc_3903:				; CODE XREF: Targeting_AcquireBestThreat+5E5j
		cmp	[bp+var_20], 8
		jz	short loc_390C
		jmp	loc_3A9C
; ���������������������������������������������������������������������������

loc_390C:				; CODE XREF: Targeting_AcquireBestThreat+5F3j
		xor	di, di
		push	[bp+var_34]
		mov	bx, [bp+var_34]
		mov	bx, [bx]
		call	dword ptr [bx+38h]
		pop	cx
		mov	cx, ax
		mov	eax, dword_72024
		mov	[bp+var_78], eax
		shl	eax, 8
		cmp	eax, [bp+var_24]
		jle	short loc_3933
		mov	ax, 1
		jmp	short loc_3935
; ���������������������������������������������������������������������������

loc_3933:				; CODE XREF: Targeting_AcquireBestThreat+618j
		xor	ax, ax

loc_3935:				; CODE XREF: Targeting_AcquireBestThreat+61Dj
		or	al, al
		jnz	short loc_393C
		jmp	loc_3A9C
; ���������������������������������������������������������������������������

loc_393C:				; CODE XREF: Targeting_AcquireBestThreat+623j
		mov	eax, [bp+var_38]
		mov	[bp+var_7C], eax
		les	bx, [bp+var_7C]
		mov	dx, es:[bx+4Bh]
		and	dx, 700h
		or	dx, dx
		jnz	short loc_3973
		mov	eax, dword_7202C
		mov	[bp+var_80], eax
		shl	eax, 8
		cmp	eax, [bp+var_24]
		jl	short loc_396A
		mov	ax, 1
		jmp	short loc_396C
; ���������������������������������������������������������������������������

loc_396A:				; CODE XREF: Targeting_AcquireBestThreat+64Fj
		xor	ax, ax

loc_396C:				; CODE XREF: Targeting_AcquireBestThreat+654j
		or	al, al
		jnz	short loc_3973
		jmp	loc_3A9C
; ���������������������������������������������������������������������������

loc_3973:				; CODE XREF: Targeting_AcquireBestThreat+63Dj
					; Targeting_AcquireBestThreat+65Aj
		mov	[bp+var_84], 100h
		or	dx, dx
		jz	short loc_39A0
		mov	eax, dword_72024
		mov	[bp+var_88], eax
		mov	eax, [bp+var_24]
		cdq
		idiv	[bp+var_88]
		mov	[bp+var_8C], eax
		mov	[bp+var_90], eax
		jmp	short loc_39BE
; ���������������������������������������������������������������������������

loc_39A0:				; CODE XREF: Targeting_AcquireBestThreat+66Aj
		mov	eax, dword_7202C
		mov	[bp+var_94], eax
		mov	eax, [bp+var_24]
		cdq
		idiv	[bp+var_94]
		mov	[bp+var_98], eax
		mov	[bp+var_9C], eax

loc_39BE:				; CODE XREF: Targeting_AcquireBestThreat+68Aj
		sub	[bp+var_84], eax
		mov	eax, [bp+var_84]
		shl	eax, 4
		mov	[bp+var_A0], eax
		mov	[bp+var_A4], eax
		mov	ax, word ptr [bp+var_A4+1]
		add	ax, 18h
		add	[bp+var_12], ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0B0h]
		cbw
		push	ax
		mov	al, es:[bx+0B0h]
		cbw
		mov	dx, ax
		pop	ax
		imul	dx
		mov	bx, 10h
		cwd
		idiv	bx
		add	ax, 0FFF8h
		add	si, ax
		mov	bx, word ptr [bp+arg_0]
		cmp	es:[bx+287h], cx
		jz	short loc_3A11
		cmp	es:[bx+283h], cx
		jnz	short loc_3A14

loc_3A11:				; CODE XREF: Targeting_AcquireBestThreat+6F4j
		add	si, 4

loc_3A14:				; CODE XREF: Targeting_AcquireBestThreat+6FBj
		cmp	[bp+var_26], 87h ; '�'
		jle	short loc_3A31
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3A31
		sub	si, 4

loc_3A31:				; CODE XREF: Targeting_AcquireBestThreat+705j
					; Targeting_AcquireBestThreat+718j
		lea	ax, [bp+var_B8]
		push	ax
		call	Targeting_LineOfSightCheck_5593A
		pop	cx
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	ss
		lea	ax, [bp+var_A8]
		push	ax
		call	Targeting_ComputeGeometryHelperA_5505B
		add	sp, 8
		mov	[bp+var_AC], 0FFFFFF4Ch
		mov	eax, [bp+var_A8]
		cmp	eax, [bp+var_AC]
		jge	short loc_3A80
		mov	ax, 1
		jmp	short loc_3A82
; ���������������������������������������������������������������������������

loc_3A80:				; CODE XREF: Targeting_AcquireBestThreat+765j
		xor	ax, ax

loc_3A82:				; CODE XREF: Targeting_AcquireBestThreat+76Aj
		or	al, al
		jz	short loc_3A9C
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3A9C
		sub	si, 4

loc_3A9C:				; CODE XREF: Targeting_AcquireBestThreat+5ECj
					; Targeting_AcquireBestThreat+5F5j ...
		cmp	[bp+var_20], 6
		jz	short loc_3AA5
		jmp	loc_3D08
; ���������������������������������������������������������������������������

loc_3AA5:				; CODE XREF: Targeting_AcquireBestThreat+78Cj
		cmp	[bp+var_26], 87h ; '�'
		jle	short loc_3AD7
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3AC2
		sub	si, 4

loc_3AC2:				; CODE XREF: Targeting_AcquireBestThreat+7A9j
		sub	di, 4
		cmp	[bp+var_2A], 2Dh ; '-'
		jge	short loc_3AD1
		add	[bp+var_12], 8
		jmp	short loc_3B31
; ���������������������������������������������������������������������������

loc_3AD1:				; CODE XREF: Targeting_AcquireBestThreat+7B5j
		add	[bp+var_12], 2
		jmp	short loc_3B31
; ���������������������������������������������������������������������������

loc_3AD7:				; CODE XREF: Targeting_AcquireBestThreat+796j
		cmp	[bp+var_26], 5Ah ; 'Z'
		jle	short loc_3B00
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3AF1
		dec	si

loc_3AF1:				; CODE XREF: Targeting_AcquireBestThreat+7DAj
		sub	di, 2
		cmp	[bp+var_2A], 3Ch ; '<'
		jge	short loc_3B31
		add	[bp+var_12], 5
		jmp	short loc_3B31
; ���������������������������������������������������������������������������

loc_3B00:				; CODE XREF: Targeting_AcquireBestThreat+7C7j
		cmp	[bp+var_26], 1Eh
		jle	short loc_3B18
		cmp	[bp+var_2A], 3Ch ; '<'
		jge	short loc_3B10
		add	[bp+var_12], 4

loc_3B10:				; CODE XREF: Targeting_AcquireBestThreat+7F6j
		add	si, 2
		add	di, 2
		jmp	short loc_3B31
; ���������������������������������������������������������������������������

loc_3B18:				; CODE XREF: Targeting_AcquireBestThreat+7F0j
		cmp	[bp+var_2A], 3Ch ; '<'
		jge	short loc_3B22
		add	[bp+var_12], 4

loc_3B22:				; CODE XREF: Targeting_AcquireBestThreat+808j
		add	si, 4
		add	di, 4
		cmp	[bp+var_28], 1Eh
		jge	short loc_3B31
		add	di, 4

loc_3B31:				; CODE XREF: Targeting_AcquireBestThreat+7BBj
					; Targeting_AcquireBestThreat+7C1j ...
		lea	ax, [bp+var_B8]
		push	ax
		call	Targeting_LineOfSightCheck_5593A
		pop	cx
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		push	ss
		lea	ax, [bp+var_60]
		push	ax
		call	Targeting_ComputeGeometryHelperA_5505B
		add	sp, 8
		mov	[bp+var_64], 0FFFFFF4Ch
		mov	eax, [bp+var_60]
		cmp	eax, [bp+var_64]
		jge	short loc_3B7C
		mov	ax, 1
		jmp	short loc_3B7E
; ���������������������������������������������������������������������������

loc_3B7C:				; CODE XREF: Targeting_AcquireBestThreat+861j
		xor	ax, ax

loc_3B7E:				; CODE XREF: Targeting_AcquireBestThreat+866j
		or	al, al
		jz	short loc_3B98
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3B98
		sub	si, 4

loc_3B98:				; CODE XREF: Targeting_AcquireBestThreat+86Cj
					; Targeting_AcquireBestThreat+87Fj
		cmp	[bp+var_28], 50h ; 'P'
		jle	short loc_3BA9
		cmp	[bp+var_28], 64h ; 'd'
		jge	short loc_3BA9
		sub	di, 5
		jmp	short loc_3BB8
; ���������������������������������������������������������������������������

loc_3BA9:				; CODE XREF: Targeting_AcquireBestThreat+888j
					; Targeting_AcquireBestThreat+88Ej
		cmp	[bp+var_28], 3Ch ; '<'
		jle	short loc_3BB8
		cmp	[bp+var_28], 78h ; 'x'
		jge	short loc_3BB8
		sub	di, 3

loc_3BB8:				; CODE XREF: Targeting_AcquireBestThreat+893j
					; Targeting_AcquireBestThreat+899j ...
		mov	eax, dword_72024
		mov	[bp+var_68], eax
		shl	eax, 8
		cmp	eax, [bp+var_24]
		jge	short loc_3BCF
		mov	ax, 1
		jmp	short loc_3BD1
; ���������������������������������������������������������������������������

loc_3BCF:				; CODE XREF: Targeting_AcquireBestThreat+8B4j
		xor	ax, ax

loc_3BD1:				; CODE XREF: Targeting_AcquireBestThreat+8B9j
		or	al, al
		jz	short loc_3BDE
		sub	si, 3
		sub	di, 5
		jmp	loc_3C6E
; ���������������������������������������������������������������������������

loc_3BDE:				; CODE XREF: Targeting_AcquireBestThreat+8BFj
		mov	eax, dword_72020
		mov	[bp+var_6C], eax
		shl	eax, 8
		cmp	eax, [bp+var_24]
		jge	short loc_3BF5
		mov	ax, 1
		jmp	short loc_3BF7
; ���������������������������������������������������������������������������

loc_3BF5:				; CODE XREF: Targeting_AcquireBestThreat+8DAj
		xor	ax, ax

loc_3BF7:				; CODE XREF: Targeting_AcquireBestThreat+8DFj
		or	al, al
		jz	short loc_3C07
		cmp	[bp+var_1D], 0
		jz	short loc_3C07
		dec	si
		add	di, 3
		jmp	short loc_3C6E
; ���������������������������������������������������������������������������

loc_3C07:				; CODE XREF: Targeting_AcquireBestThreat+8E5j
					; Targeting_AcquireBestThreat+8EBj
		cmp	[bp+var_1C], 0
		jz	short loc_3C6E
		mov	eax, dword_7202C
		mov	[bp+var_70], eax
		shl	eax, 8
		cmp	eax, [bp+var_24]
		jge	short loc_3C24
		mov	ax, 1
		jmp	short loc_3C26
; ���������������������������������������������������������������������������

loc_3C24:				; CODE XREF: Targeting_AcquireBestThreat+909j
		xor	ax, ax

loc_3C26:				; CODE XREF: Targeting_AcquireBestThreat+90Ej
		or	al, al
		jz	short loc_3C30
		sub	di, 2
		dec	si
		jmp	short loc_3C52
; ���������������������������������������������������������������������������

loc_3C30:				; CODE XREF: Targeting_AcquireBestThreat+914j
		mov	eax, dword_72028
		mov	[bp+var_74], eax
		shl	eax, 8
		cmp	eax, [bp+var_24]
		jle	short loc_3C47
		mov	ax, 1
		jmp	short loc_3C49
; ���������������������������������������������������������������������������

loc_3C47:				; CODE XREF: Targeting_AcquireBestThreat+92Cj
		xor	ax, ax

loc_3C49:				; CODE XREF: Targeting_AcquireBestThreat+931j
		or	al, al
		jz	short loc_3C52
		dec	di
		add	[bp+var_12], 4

loc_3C52:				; CODE XREF: Targeting_AcquireBestThreat+91Aj
					; Targeting_AcquireBestThreat+937j
		mov	al, [bp+var_1B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3C6E
		cmp	[bp+var_28], 96h ; '�'
		jle	short loc_3C67
		sub	di, 3
		jmp	short loc_3C6E
; ���������������������������������������������������������������������������

loc_3C67:				; CODE XREF: Targeting_AcquireBestThreat+94Cj
		cmp	[bp+var_28], 3Ch ; '<'
		jle	short loc_3C6E
		dec	di

loc_3C6E:				; CODE XREF: Targeting_AcquireBestThreat+8C7j
					; Targeting_AcquireBestThreat+8F1j ...
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+287h]
		cmp	ax, [bp+var_34]
		jnz	short loc_3C81
		add	di, 3
		add	si, 5

loc_3C81:				; CODE XREF: Targeting_AcquireBestThreat+965j
		cmp	[bp+var_2E], 0
		jz	short loc_3CA1
		cmp	[bp+var_30], 6
		jnz	short loc_3CA1
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+137h]
		cmp	ax, [bp+var_34]
		jnz	short loc_3CA1
		add	di, 2
		add	si, 4

loc_3CA1:				; CODE XREF: Targeting_AcquireBestThreat+972j
					; Targeting_AcquireBestThreat+978j ...
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+289h]
		cmp	ax, [bp+var_34]
		jnz	short loc_3CB5
		add	si, 3
		add	[bp+var_12], 5

loc_3CB5:				; CODE XREF: Targeting_AcquireBestThreat+998j
		mov	bx, [bp+var_34]
		les	bx, [bx+5Ah]
		mov	ax, es:[bx+0Dh]
		les	bx, [bp+arg_0]
		cmp	ax, es:[bx+102h]
		jnz	short loc_3CCF
		add	si, 2
		inc	[bp+var_12]

loc_3CCF:				; CODE XREF: Targeting_AcquireBestThreat+9B3j
		les	bx, [bp+var_38]
		mov	al, es:[bx+52h]
		mov	ah, 0
		mov	bx, ax
		mov	al, byte_72038
		mov	ah, 0
		cmp	ax, bx
		jge	short loc_3D03
		mov	ax, bx
		add	ax, 0FFFEh
		cmp	ax, [bp+var_E]
		jle	short loc_3CF6
		mov	ax, [bp+var_E]
		sub	ax, bx
		mov	bx, ax
		jmp	short loc_3CFD
; ���������������������������������������������������������������������������

loc_3CF6:				; CODE XREF: Targeting_AcquireBestThreat+9D7j
		mov	al, byte_72038
		mov	ah, 0
		sub	bx, ax

loc_3CFD:				; CODE XREF: Targeting_AcquireBestThreat+9E0j
		add	di, bx
		add	si, bx
		jmp	short loc_3D08
; ���������������������������������������������������������������������������

loc_3D03:				; CODE XREF: Targeting_AcquireBestThreat+9CDj
		mov	[bp+var_12], 0

loc_3D08:				; CODE XREF: Targeting_AcquireBestThreat+508j
					; Targeting_AcquireBestThreat+511j ...
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Bh]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_3D1C
		add	si, 4

loc_3D1C:				; CODE XREF: Targeting_AcquireBestThreat+A03j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+285h]
		cmp	ax, [bp+var_34]
		jnz	short loc_3D2F
		add	di, 0Ah
		add	si, 5

loc_3D2F:				; CODE XREF: Targeting_AcquireBestThreat+A13j
		push	si
		push	large [bp+arg_0]
		call	Pilot_SkillCheck_B0
		add	sp, 6
		mov	byte ptr [bp+var_78+3],	al
		mov	ax, [bp+var_16]
		imul	di
		push	ax
		mov	ax, [bp+var_18]
		imul	[bp+var_12]
		pop	si
		add	si, ax
		cmp	[bp+var_20], 8
		jnz	short loc_3D73
		cmp	byte ptr [bp+var_78+3],	0
		jz	short loc_3D73
		mov	ax, [bp+var_34]
		mov	word ptr [bp+var_78], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 281h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_3D73:				; CODE XREF: Targeting_AcquireBestThreat+A3Ej
					; Targeting_AcquireBestThreat+A44j
		cmp	byte ptr [bp+var_78+3],	0
		jz	short loc_3D87
		cmp	si, [bp+var_14]
		jle	short loc_3D87
		mov	[bp+var_14], si
		mov	ax, [bp+var_34]
		mov	[bp+var_1A], ax

loc_3D87:				; CODE XREF: Targeting_AcquireBestThreat+20Aj
					; Targeting_AcquireBestThreat+219j ...
		lea	ax, [bp+var_32]
		push	ax
		push	59C3h
		call	World_IterateObjects
		add	sp, 4
		or	ax, ax
		jz	short loc_3D9D
		jmp	loc_3521
; ���������������������������������������������������������������������������

loc_3D9D:				; CODE XREF: Targeting_AcquireBestThreat+A84j
		cmp	[bp+var_1A], 0
		jnz	short loc_3DA6
		jmp	loc_3E73
; ���������������������������������������������������������������������������

loc_3DA6:				; CODE XREF: Targeting_AcquireBestThreat+A8Dj
		push	[bp+var_1A]
		mov	bx, [bp+var_1A]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_34], dx
		mov	word ptr [bp+var_38+2],	ax
		cmp	[bp+var_38+2], 0
		jnz	short loc_3DC1
		jmp	loc_3E73
; ���������������������������������������������������������������������������

loc_3DC1:				; CODE XREF: Targeting_AcquireBestThreat+AA8j
		push	dx
		push	ax
		les	bx, [bp+var_38+2]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 8
		jnz	short loc_3E1F
		mov	ax, [bp+var_1A]
		mov	word ptr [bp+var_38], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 281h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 287h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 283h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+27Fh], 2
		jmp	short loc_3E73
; ���������������������������������������������������������������������������

loc_3E1F:				; CODE XREF: Targeting_AcquireBestThreat+ABDj
		les	bx, [bp+var_38+2]
		cmp	byte ptr es:[bx+11h], 2
		jnz	short loc_3E46
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 287h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		mov	ax, [bp+var_1A]
		mov	[bp+var_3A], ax
		push	ax
		jmp	short loc_3E61
; ���������������������������������������������������������������������������

loc_3E46:				; CODE XREF: Targeting_AcquireBestThreat+B13j
		mov	ax, [bp+var_1A]
		mov	[bp+var_3C], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 287h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		push	0

loc_3E61:				; CODE XREF: Targeting_AcquireBestThreat+B30j
		mov	ax, word ptr [bp+arg_0]
		add	ax, 283h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_3E73:				; CODE XREF: Targeting_AcquireBestThreat+A8Fj
					; Targeting_AcquireBestThreat+AAAj ...
		call	PIT_ReadHighPrecision
		sub	al, byte ptr [bp+var_4]
		mov	bx, word_704E6
		mov	dl, [bx+5B2Eh]
		add	dl, al
		mov	[bx+5B2Eh], dl
		mov	ax, [bp+var_1A]

loc_3E8C:				; CODE XREF: Targeting_AcquireBestThreat+7Bj
		pop	di
		pop	si
		leave
		retf
Targeting_AcquireBestThreat	endp

seg001		ends
