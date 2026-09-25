seg089		segment	byte public 'CODE' use16
		assume cs:seg089
		;org 1
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far, LUE (2026-09-24), formule balistique NON RESOLUE. Methode +0x18 des modeles BOMB/DURD :
; (sortie, modele, 0, porteur = point d'emport+0x0D, &hauteur, n). Porteur nul -> vecteur par
; defaut. n >= 4 (id 7) : impact = position du porteur + direction horizontale de sa vitesse *
; 2500 (si masque modele+0x4B == 0x40) ou * 3000, altitude = terrain. n = 3 (MK-20/MK-82) : Z
; = alt porteur - hauteur (= altitude de la cible d'apres l'appelant) ; t = (-vz - sqrt(vz^2 -
; 2 g Z)) / g avec g = dword_6FFD7 = -9,8 ; t -= Z / (3 * (2000 - alt porteur) + 290) ; impact
; = position porteur + vitesse horizontale * t, altitude = terrain (Terrain_QueryAltitudeAt).
; A CLARIFIER : Z vaut l'altitude de la cible et non la hauteur de chute ; soit l'objet +0x0D
; ou la hauteur passee ne sont pas ce que l'on croit, soit c'est un defaut de l'original.
; ==============================================================================================
BombModel_PredictImpact_41311:				; DATA XREF: seg339:off_6F50Co
					; seg339:2478o
		push	bp
		mov	bp, sp

loc_41314:				; DATA XREF: seg216:off_6A16Eo
		sub	sp, 92h
		push	si
		push	di
		mov	si, [bp+10h]
		mov	di, [bp+14h]
		or	si, si
		jnz	short loc_41327
		jmp	loc_416FB
; ���������������������������������������������������������������������������

loc_41327:				; CODE XREF: seg089:0012j
		mov	bx, [bp+12h]
		mov	eax, [bx]
		mov	[bp-4],	eax
		push	si
		push	ss
		lea	ax, [bp-56h]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	ax, si
		add	ax, 12h
		mov	[bp-6],	ax
		mov	bx, [bp-6]
		mov	eax, [bx]
		mov	[bp-62h], eax
		mov	eax, [bx+4]
		mov	[bp-5Eh], eax
		mov	eax, [bx+8]
		mov	[bp-5Ah], eax
		cmp	di, 4
		jge	short loc_41369
		jmp	loc_4145C
; ���������������������������������������������������������������������������

loc_41369:				; CODE XREF: seg089:0054j
		les	bx, [bp+0Ah]
		cmp	word ptr es:[bx+4Bh], 40h ; '@'
		jnz	short loc_41381
		mov	dword ptr [bp-1Ah], 9C400h
		mov	eax, [bp-1Ah]
		jmp	short loc_4138D
; ���������������������������������������������������������������������������

loc_41381:				; CODE XREF: seg089:0061j
		mov	dword ptr [bp-1Eh], 0BB800h
		mov	eax, [bp-1Eh]

loc_4138D:				; CODE XREF: seg089:006Fj
		mov	[bp-16h], eax
		mov	eax, [bp-16h]
		mov	[bp-22h], eax
		mov	eax, [bp-56h]
		mov	[bp-2Ah], eax
		mov	eax, [bp-52h]
		mov	[bp-26h], eax
		lea	ax, [bp-2Ah]
		push	ax
		call	UI_ComputeScaledVectorHelper_56215
		pop	cx
		mov	eax, [bp-2Ah]
		mov	edx, [bp-22h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-2Ah], eax
		mov	eax, [bp-26h]
		mov	edx, [bp-22h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-26h], eax
		mov	eax, [bp-2Ah]
		mov	[bp-32h], eax
		mov	eax, [bp-26h]
		mov	[bp-2Eh], eax
		mov	eax, [bp-2Ah]
		mov	[bp-56h], eax
		mov	eax, [bp-26h]
		mov	[bp-52h], eax
		push	1
		lea	ax, [bp-6Eh]
		push	ax
		mov	eax, [bp-56h]
		add	eax, [bp-62h]
		mov	[bp-7Ah], eax
		mov	eax, [bp-52h]
		add	eax, [bp-5Eh]
		mov	[bp-76h], eax
		mov	eax, [bp-4Eh]
		add	eax, [bp-5Ah]
		mov	[bp-72h], eax
		mov	eax, [bp-7Ah]
		mov	[bp-86h], eax
		mov	eax, [bp-76h]
		mov	[bp-82h], eax
		mov	eax, [bp-72h]
		mov	[bp-7Eh], eax
		lea	ax, [bp-86h]
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp-36h]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp-36h]
		jmp	loc_41651
; ���������������������������������������������������������������������������

loc_4145C:				; CODE XREF: seg089:0056j
		or	di, di
		jz	short loc_41474
		mov	eax, [bp-5Ah]
		sub	eax, [bp-4]
		mov	[bp-0Ah], eax
		mov	[bp-0Eh], eax
		mov	[bp-4],	eax

loc_41474:				; CODE XREF: seg089:014Ej
		mov	eax, [bp-56h]
		mov	[bp-6Eh], eax
		mov	eax, [bp-52h]

loc_41480:
		mov	[bp-6Ah], eax
		mov	eax, [bp-4Eh]
		mov	[bp-66h], eax
		mov	eax, [bp-66h]
		mov	edx, [bp-66h]

loc_41494:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-16h], eax
		mov	eax, dword_6FFD7
		mov	edx, [bp-4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-1Ah], eax
		mov	eax, [bp-1Ah]
		shl	eax, 1
		mov	[bp-1Ah], eax
		mov	eax, [bp-16h]
		sub	eax, [bp-1Ah]
		mov	[bp-16h], eax
		mov	dword ptr [bp-1Eh], 0
		cmp	eax, [bp-1Eh]
		jl	short loc_414DE
		mov	ax, 1
		jmp	short loc_414E0
; ���������������������������������������������������������������������������

loc_414DE:				; CODE XREF: seg089:01C7j
		xor	ax, ax

loc_414E0:				; CODE XREF: seg089:01CCj
		or	al, al
		jz	short loc_41508
		lea	ax, [bp-16h]
		push	ax
		push	ss
		lea	ax, [bp-22h]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		mov	eax, [bp-22h]
		neg	eax
		mov	[bp-26h], eax
		mov	[bp-2Ah], eax
		mov	[bp-16h], eax

loc_41508:				; CODE XREF: seg089:01D2j
		mov	eax, [bp-16h]
		sub	eax, [bp-66h]
		mov	[bp-16h], eax
		mov	eax, [bp-16h]
		mov	edx, eax
		mov	ecx, dword_6FFD7
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-16h], eax
		mov	eax, [bp-5Ah]
		mov	[bp-32h], eax
		mov	eax, 7D000h
		sub	eax, [bp-32h]
		mov	[bp-32h], eax
		mov	dword ptr [bp-36h], 3
		mov	eax, [bp-32h]
		mov	edx, [bp-36h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-32h], eax
		add	dword ptr [bp-32h], 12200h
		cmp	di, 3
		jnz	short loc_41592

loc_4156E:
		mov	eax, [bp-4]

loc_41572:
		mov	edx, eax

loc_41575:
		mov	ecx, [bp-32h]
		sar	edx, 18h
		shl	eax, 8

loc_41581:
		idiv	ecx
		mov	[bp-3Ah], eax

loc_41588:
		mov	eax, [bp-3Ah]

loc_4158C:
		mov	[bp-3Eh], eax
		jmp	short loc_415B6
; ���������������������������������������������������������������������������

loc_41592:				; CODE XREF: seg089:025Cj
		les	bx, [bp+0Ah]
		cmp	byte ptr es:[bx+4Dh], 5
		jnz	short loc_415AA
		mov	dword ptr [bp-42h], 100h
		mov	eax, [bp-42h]
		jmp	short loc_415B6
; ���������������������������������������������������������������������������

loc_415AA:				; CODE XREF: seg089:028Aj
		mov	dword ptr [bp-46h], 0
		mov	eax, [bp-46h]

loc_415B6:				; CODE XREF: seg089:0280j seg089:0298j
		mov	[bp-2Eh], eax
		mov	eax, [bp-16h]
		sub	eax, [bp-2Eh]
		mov	[bp-16h], eax
		mov	eax, [bp-56h]
		mov	edx, [bp-16h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-56h], eax
		mov	eax, [bp-52h]
		mov	edx, [bp-16h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-52h], eax
		push	1
		lea	ax, [bp-7Ah]
		push	ax
		mov	eax, [bp-56h]
		add	eax, [bp-62h]
		mov	[bp-86h], eax
		mov	eax, [bp-52h]
		add	eax, [bp-5Eh]
		mov	[bp-82h], eax
		mov	eax, [bp-4Eh]
		add	eax, [bp-5Ah]
		mov	[bp-7Eh], eax
		mov	eax, [bp-86h]
		mov	[bp-92h], eax
		mov	eax, [bp-82h]
		mov	[bp-8Eh], eax
		mov	eax, [bp-7Eh]
		mov	[bp-8Ah], eax
		lea	ax, [bp-92h]
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp-4Ah]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp-4Ah]

loc_41651:				; CODE XREF: seg089:0149j
		mov	[bp-4Eh], eax
		mov	eax, [bp-5Ah]
		sub	[bp-4Eh], eax
		cmp	di, 2
		jz	short loc_4166C
		cmp	di, 5
		jz	short loc_4166C
		cmp	di, 3
		jnz	short loc_416CA

loc_4166C:				; CODE XREF: seg089:0350j seg089:0355j
		mov	dword ptr [bp-12h], 0
		mov	eax, [bp-12h]
		mov	[bp-5Ah], eax

loc_4167C:
		mov	eax, [bp-62h]

loc_41680:
		add	[bp-56h], eax
		mov	eax, [bp-5Eh]

loc_41688:
		add	[bp-52h], eax
		mov	eax, [bp-5Ah]
		add	[bp-4Eh], eax
		mov	si, [bp+6]
		or	si, si
		jz	short loc_4169F
		mov	ax, si
		jmp	short loc_416A9
; ���������������������������������������������������������������������������

loc_4169F:				; CODE XREF: seg089:0389j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_416A9:				; CODE XREF: seg089:038Dj
		or	ax, ax
		jz	short loc_41729

loc_416AD:				; CODE XREF: seg089:03E7j
		mov	eax, [bp-56h]
		mov	[si], eax
		mov	eax, [bp-52h]
		mov	[si+4],	eax
		mov	eax, [bp-4Eh]

loc_416C0:				; CODE XREF: seg089:0417j
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_4172B
; ���������������������������������������������������������������������������
		jmp	short loc_41729
; ���������������������������������������������������������������������������

loc_416CA:				; CODE XREF: seg089:035Aj
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp-56h]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		mov	si, [bp+6]
		or	si, si
		jz	short loc_416E9
		mov	ax, si
		jmp	short loc_416F3
; ���������������������������������������������������������������������������

loc_416E9:				; CODE XREF: seg089:03D3j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_416F3:				; CODE XREF: seg089:03D7j
		or	ax, ax
		jz	short loc_41729
		jmp	short loc_416AD
; ���������������������������������������������������������������������������
		jmp	short loc_41729
; ���������������������������������������������������������������������������

loc_416FB:				; CODE XREF: seg089:0014j
		mov	si, [bp+6]
		or	si, si
		jz	short loc_41706
		mov	ax, si
		jmp	short loc_41710
; ���������������������������������������������������������������������������

loc_41706:				; CODE XREF: seg089:03F0j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_41710:				; CODE XREF: seg089:03F4j
		or	ax, ax
		jz	short loc_41729
		mov	eax, dword_707F8
		mov	[si], eax
		mov	eax, dword_707FC
		mov	[si+4],	eax
		mov	eax, dword_70800
		jmp	short loc_416C0
; ���������������������������������������������������������������������������

loc_41729:				; CODE XREF: seg089:039Bj seg089:03B8j ...
		mov	ax, si

loc_4172B:				; CODE XREF: seg089:03B6j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE (2026-09-24). Methode +0x14 des modeles BOMB (vtable seg339 0x6F510) et DURD
; (0x6F4F4), appelee par GroundAttack_Phase3_WeaponRelease_776FB pour la GBU-15 : (modele,
; cible, lanceur). Faux si modele+0x5E == 0 (octet du chunk DATA du modele : bombe guidee ?)
; ou sans cible/lanceur. t = distance(cible, lanceur) / |vitesse du lanceur| ; VRAI si
; Math_DotProduct3D_5505B(direction normalisee vers la cible, nez du lanceur) >
; Math_CosDeg_5483F(modele+0x61 * t) (+0x61 = word du chunk DATA,
; PlayerComponent_LoadFieldsWithRetry_9FAD0). Le cone d'acceptation s'elargit avec le temps de
; vol.
; ==============================================================================================
BombModel_TestGuidedLockCone_41735:				; DATA XREF: seg339:2458o seg339:2474o
		push	bp
		mov	bp, sp
		sub	sp, 4Ch
		push	si
		push	di
		mov	di, [bp+0Ah]
		mov	si, [bp+0Ch]
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+5Eh], 0
		jnz	short loc_41750
		jmp	loc_418A3
; ���������������������������������������������������������������������������

loc_41750:				; CODE XREF: seg089:043Bj
		or	di, di
		jnz	short loc_41757
		jmp	loc_418A3
; ���������������������������������������������������������������������������

loc_41757:				; CODE XREF: seg089:0442j
		or	si, si
		jnz	short loc_4175E
		jmp	loc_418A3
; ���������������������������������������������������������������������������

loc_4175E:				; CODE XREF: seg089:0449j
		push	si
		push	ss
		lea	ax, [bp-34h]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	large dword ptr	[bp-2Ch]
		push	large dword ptr	[bp-30h]
		push	large dword ptr	[bp-34h]

loc_41778:
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax

loc_41781:
		add	sp, 0Ch
		mov	[bp-8],	eax
		mov	[bp-0Ch], eax
		mov	[bp-4],	eax
		add	di, 12h
		mov	ax, si
		add	ax, 12h
		mov	[bp-0Eh], ax
		mov	eax, [di]
		mov	bx, [bp-0Eh]
		sub	eax, [bx]
		mov	[bp-40h], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp-3Ch], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp-38h], eax
		push	eax
		push	large dword ptr	[bp-3Ch]
		push	large dword ptr	[bp-40h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-16h], eax
		mov	[bp-12h], eax
		cmp	dword ptr [bp-4], 0
		jz	short loc_417EA
		mov	ax, 1
		jmp	short loc_417EC
; ���������������������������������������������������������������������������

loc_417EA:				; CODE XREF: seg089:04D3j
		xor	ax, ax

loc_417EC:				; CODE XREF: seg089:04D8j
		or	al, al
		jz	short loc_4180A
		mov	eax, [bp-12h]
		mov	edx, eax
		mov	ecx, [bp-4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-4],	eax

loc_4180A:				; CODE XREF: seg089:04DEj
		les	bx, [bp+6]
		mov	ax, es:[bx+61h]
		mov	[bp-20h], ax
		movsx	eax, word ptr [bp-20h]
		shl	eax, 8
		mov	[bp-1Eh], eax
		mov	eax, [bp-1Eh]
		mov	edx, [bp-4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-1Ah], eax
		lea	ax, [bp-1Ah]
		push	ax
		push	ss
		lea	ax, [bp-24h]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		mov	eax, [bp-24h]
		mov	[bp-1Ah], eax
		lea	ax, [bp-40h]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp-4Ch], eax
		mov	eax, [si+4]

loc_4186F:
		mov	[bp-48h], eax

loc_41873:
		mov	eax, [si+8]
		mov	[bp-44h], eax

loc_4187B:
		lea	ax, [bp-4Ch]
		push	ax

loc_4187F:
		lea	ax, [bp-40h]
		push	ax

loc_41883:
		push	ss

loc_41884:
		lea	ax, [bp-28h]
		push	ax
		call	Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp-28h]
		cmp	eax, [bp-1Ah]
		jle	short loc_4189F
		mov	ax, 1
		jmp	short loc_418A1
; ���������������������������������������������������������������������������

loc_4189F:				; CODE XREF: seg089:0588j
		xor	ax, ax

loc_418A1:				; CODE XREF: seg089:058Dj
		jmp	short loc_418A5
; ���������������������������������������������������������������������������

loc_418A3:				; CODE XREF: seg089:043Dj seg089:0444j ...
		mov	al, 0

loc_418A5:				; CODE XREF: seg089:loc_418A1j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_418A9:				; DATA XREF: seg339:off_6F954o
					; seg339:off_6FA6Co
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 9
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_418B3:				; DATA XREF: seg339:off_6F4FCo
					; seg339:2468o
		push	bp
		mov	bp, sp
		mov	al, 9
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,39L — destructeur (type 0x2460) déléguant à sub_43343, libère si demandé : destructeur
; générique d'un composant leurre/chaff-flare.
; ==============================================================================================
Countermeasure_DestructA	proc far		; CODE XREF: seg089:0632p
					; DATA XREF: seg339:off_6F510o

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_41902
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 2460h
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Targeting_DestructComponent
		add	sp, 6
		test	si, 1
		jz	short loc_41902
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_41902:				; CODE XREF: Countermeasure_DestructA+Fj
					; Countermeasure_DestructA+2Bj
		pop	si
		leave
		retf
Countermeasure_DestructA	endp

; ���������������������������������������������������������������������������

loc_41905:				; DATA XREF: seg339:off_6F4F4o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_41969
		les	bx, [bp+6]
		mov	word ptr es:[bx], 2444h
		cmp	dword ptr es:[bx+63h], 0
		jz	short loc_4193B
		push	3
		push	large dword ptr	es:[bx+63h]
		les	bx, es:[bx+63h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short $+2

loc_4193B:				; CODE XREF: seg089:0614j
		push	0
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr Countermeasure_DestructA
		add	sp, 6
		test	si, 1
		jz	short loc_41969
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_41969:				; CODE XREF: seg089:0604j seg089:063Cj
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — destructeur (type 0x2988) déléguant à sub_433B7 : destructeur d'un second
; composant du système de contre-mesures.
; ==============================================================================================
Countermeasure_DestructB	proc far		; CODE XREF: seg089:06BDp
					; DATA XREF: seg339:off_6FA50o

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_41997
		mov	word ptr [si], 2988h
		push	0
		push	si

loc_41982:
		call	Targeting_DestructWithWeakRefs
		add	sp, 4
		test	di, 1

loc_4198E:
		jz	short loc_41997
		push	si

loc_41991:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_41997:				; CODE XREF: Countermeasure_DestructB+Dj
					; Countermeasure_DestructB:loc_4198Ej
		pop	di

loc_41998:
		pop	si
		pop	bp
		retf
Countermeasure_DestructB	endp

; ���������������������������������������������������������������������������

loc_4199B:				; DATA XREF: seg339:2888o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_419E0
		mov	word ptr [si], 2870h
		cmp	dword ptr [si+5Fh], 0
		jz	short loc_419C9
		push	3
		push	large dword ptr	[si+5Fh]
		les	bx, [si+5Fh]
		mov	bx, es:[bx]
		call	dword ptr [bx+28h]
		add	sp, 6
		jmp	short $+2

loc_419C9:				; CODE XREF: seg089:06A3j
		push	0
		push	si
		push	cs
		call	near ptr Countermeasure_DestructB
		add	sp, 4
		test	di, 1
		jz	short loc_419E0
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_419E0:				; CODE XREF: seg089:0698j seg089:06C7j
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 62L, LUE INTEGRALEMENT (2026-09-24). Ex-'Countermeasure_ComputeTransform'. ALIGNE LE
; NEZ DE L'OBJET SUR SA VITESSE : v = objet->vtable+0x4C (vitesse) ;
; Vector_PrescaleBelow256_55B04(v) (garde anti-debordement) ; Vector_NormalizeInPlace_5593A(v)
; (vecteur unitaire) ; copie de l'orientation (vtable+0x3C, 36 octets) ; LIGNE 1 (+0x0C)
; remplacee par v ; Matrix_OrthonormalizeKeepRow1_57660 (lignes 0 et 2 reconstruites par
; produits vectoriels) ; objet->vtable+0x40 (ecrit l'orientation). La ligne 1 est l'axe du nez
; : MissileBody_BoostPhase_42632 et MissileBody_SetCruiseVelocity_42A1B mettent toute la
; vitesse sur la composante 1 du repere local (Matrix_WorldToLocal_58768 /
; Matrix_LocalToWorld_58828). Appelants : GuidedBombBody_GuidanceTick_41F2B (sans cible) et
; deux fois la mise a jour d'objet loc_41AAF (seg089, classe non identifiee).
; ==============================================================================================
WorldObject_AlignNoseOnVelocity_419E4	proc far		; CODE XREF: seg089:0785p seg089:07FFp ...

var_32		= word ptr -32h
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		lea	ax, [bp+var_E]
		push	ax
		call	Vector_PrescaleBelow256_55B04
		pop	cx
		lea	ax, [bp+var_E]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_2], ax
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	eax, [bp+var_E]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_6]
		mov	[bp+var_1E], eax
		lea	ax, [bp+var_32]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		lea	ax, [bp+var_32]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4
		pop	si
		leave
		retf
WorldObject_AlignNoseOnVelocity_419E4	endp

; ���������������������������������������������������������������������������

loc_41A59:				; DATA XREF: seg339:off_6FA48o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+59h], 0
		jz	short loc_41A6C
		mov	byte ptr [si+59h], 0
		jmp	short loc_41AAA
; ���������������������������������������������������������������������������

loc_41A6C:				; CODE XREF: seg089:0754j
		mov	ax, si
		add	ax, 5Ah	; 'Z'
		push	ax
		call	Timer_Tick_4F9E6
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_41A84
		or	byte ptr [si+4], 2
		jmp	short loc_41A88
; ���������������������������������������������������������������������������

loc_41A84:				; CODE XREF: seg089:076Cj
		and	byte ptr [si+4], 0FDh

loc_41A88:				; CODE XREF: seg089:0772j
		les	bx, [si+0Eh]

loc_41A8B:
		cmp	word ptr es:[bx+4Bh], 80h ; '�'

loc_41A91:
		jz	short loc_41A99
		push	si
		push	cs
		call	near ptr WorldObject_AlignNoseOnVelocity_419E4
		pop	cx

loc_41A99:				; CODE XREF: seg089:loc_41A91j
		push	si
		call	Camera_ExternalUpdate_3D9B4
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_41AAA
		mov	al, 0
		jmp	short loc_41AAC
; ���������������������������������������������������������������������������

loc_41AAA:				; CODE XREF: seg089:075Aj seg089:0794j
		mov	al, 1

loc_41AAC:				; CODE XREF: seg089:0798j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_41AAF:				; DATA XREF: seg339:off_6F930o
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+59h], 0
		jz	short loc_41AC6
		mov	byte ptr [si+59h], 0
		jmp	loc_41B7F
; ���������������������������������������������������������������������������

loc_41AC6:				; CODE XREF: seg089:07ADj
		mov	ax, si
		add	ax, 5Ah	; 'Z'
		push	ax
		call	Timer_Tick_4F9E6
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_41ADE
		or	byte ptr [si+4], 2
		jmp	short loc_41AE2
; ���������������������������������������������������������������������������

loc_41ADE:				; CODE XREF: seg089:07C6j
		and	byte ptr [si+4], 0FDh

loc_41AE2:				; CODE XREF: seg089:07CCj
		mov	al, [si+63h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_41B0D
		test	byte ptr [si+4], 2
		jz	short loc_41B0D
		mov	eax, [si+0Ah]
		mov	[bp-4],	eax
		mov	eax, [si+5Fh]
		mov	[si+0Ah], eax
		mov	eax, [bp-4]
		mov	[si+5Fh], eax
		mov	byte ptr [si+63h], 1

loc_41B0D:				; CODE XREF: seg089:07D9j seg089:07DFj
		push	si
		push	cs
		call	near ptr WorldObject_AlignNoseOnVelocity_419E4
		pop	cx
		push	1
		lea	ax, [bp-10h]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp-4]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		cmp	dword ptr [bp-4], 1E00h
		jg	short loc_41B3F
		mov	ax, 1
		jmp	short loc_41B41
; ���������������������������������������������������������������������������

loc_41B3F:				; CODE XREF: seg089:0828j
		xor	ax, ax

loc_41B41:				; CODE XREF: seg089:082Dj
		or	al, al
		jz	short loc_41B6E
		push	large 158h
		push	0
		lea	ax, [bp-1Ch]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		lea	ax, [bp-1Ch]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 4
		push	si
		push	cs
		call	near ptr WorldObject_AlignNoseOnVelocity_419E4
		pop	cx
		jmp	short loc_41B7F
; ���������������������������������������������������������������������������

loc_41B6E:				; CODE XREF: seg089:0833j
		push	si

loc_41B6F:
		call	Camera_ExternalUpdate_3D9B4
		pop	cx
		mov	ah, 0

loc_41B77:
		or	ax, ax

loc_41B79:
		jnz	short loc_41B7F
		mov	al, 0
		jmp	short loc_41B81
; ���������������������������������������������������������������������������

loc_41B7F:				; CODE XREF: seg089:07B3j seg089:085Cj ...
		mov	al, 1

loc_41B81:				; CODE XREF: seg089:086Dj
		pop	si

locret_41B82:
		leave

locret_41B83:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 57L, LUE (2026-09-24). Ex-'Countermeasure_CacheDistance' (FAUX : ce n'est pas une
; distance). Une seule fois (drapeau +0x24) : vitesse de l'objet ([si]+8/+C/+10) = vitesse du
; lanceur (+0x22, vtable+0x4C), norme mise en cache dans +0x1C = vitesse de vol guide de la
; bombe (utilisee par GuidedBombBody_SteerToTarget_41BEF).
; ==============================================================================================
GuidedBombBody_InheritLaunchSpeed_41B84	proc far		; CODE XREF: seg089:0CDAp

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si

loc_41B8B:
		mov	si, [bp+arg_0]

loc_41B8E:
		mov	al, [si+24h]
		mov	ah, 0

loc_41B93:
		or	ax, ax
		jnz	short loc_41BEC
		push	word ptr [si+22h]
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		mov	bx, [si+22h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	bx, [si]
		mov	eax, [bp+var_14]
		mov	[bx+8],	eax
		mov	eax, [bp+var_10]
		mov	[bx+0Ch], eax
		mov	eax, [bp+var_C]
		mov	[bx+10h], eax
		push	large dword ptr	[bx+10h]
		push	large dword ptr	[bx+0Ch]
		push	large dword ptr	[bx+8]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	[si+1Ch], eax
		mov	byte ptr [si+24h], 1

loc_41BEC:				; CODE XREF: GuidedBombBody_InheritLaunchSpeed_41B84+11j
		pop	si
		leave
		retf
GuidedBombBody_InheritLaunchSpeed_41B84	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 380L, LUE INTEGRALEMENT (2026-09-24). Ex-'Audio3D_ComputeDistanceParams' (FAUX : aucun
; son, pas d'auditeur). LOI DE GUIDAGE DE LA BOMBE GUIDEE (corps du chunk dynamique GBMB),
; deuxieme copie de MissileBody_SteerToTarget_42738 avec d'autres champs : cible +0x20,
; matrice globale 0x57A6, point vise dword_7283E/42/46 (position +0x12 de la cible, SANS
; relevement d'altitude), position propre dword_7284A/4E/52. (1) D = cible - moi ; t = dist /
; |vitesse du corps [si]+8| borne a 1.0 ; D += vitesse_cible (vtable+0x4C) * t. (2) Roulis
; immediat : atan(c0/c2) (Math_ArcTan2_54B0A), +/-180 si c2 <= 0, Matrix_BuildAxisY_570C5 +
; Matrix_OrthonormalizeKeepRow1_57660. (3) Tangage : Math_ArcTan_54ADE(c2/c1) apres idiv par
; c1 SANS garde (division par zero si c1 == 0 exactement), 180 - |b| si c1 < 0, borne a +0x18
; * dt (+0x18 = unique dword du chunk GBMB), Matrix_BuildAxisX_56EC3 +
; Matrix_OrthonormalizeKeepRow0_575DF. (4) [objet]->vtable+0x40(0x57A6) : nouvelle
; orientation. (5) DIFFERENCE AVEC LE MISSILE : vitesse = (0, +0x1C, 0) dans le repere de la
; bombe (Matrix_LocalToWorld_58828) : vitesse CONSTANTE = vitesse du lanceur au largage (mise
; en cache par GuidedBombBody_InheritLaunchSpeed_41B84), ni propulsion, ni gravite, ni perte
; de vitesse tant qu'elle est guidee.
; ==============================================================================================
GuidedBombBody_SteerToTarget_41BEF	proc far		; CODE XREF: seg089:0CE0p

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
		sub	sp, 8Ch
		push	si
		mov	si, [bp+arg_0]
		mov	eax, dword_7283E
		sub	eax, dword_7284A
		mov	[bp+var_68], eax
		mov	eax, dword_72842
		sub	eax, dword_7284E
		mov	[bp+var_64], eax
		mov	eax, dword_72846
		sub	eax, dword_72852
		mov	[bp+var_60], eax
		push	eax
		push	large [bp+var_64]
		push	large [bp+var_68]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		mov	bx, [si]
		push	large dword ptr	[bx+10h]
		push	large dword ptr	[bx+0Ch]
		push	large dword ptr	[bx+8]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0
		jz	short loc_41C6D
		mov	ax, 1
		jmp	short loc_41C6F
; ���������������������������������������������������������������������������

loc_41C6D:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+77j
		xor	ax, ax

loc_41C6F:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+7Cj
		or	al, al

loc_41C71:
		jz	short loc_41C8F
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, [bp+var_C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_14], eax
		jmp	short loc_41C9F
; ���������������������������������������������������������������������������

loc_41C8F:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF:loc_41C71j
		mov	[bp+var_18], 100h
		mov	eax, [bp+var_18]
		mov	[bp+var_14], eax

loc_41C9F:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+9Ej
		cmp	[bp+var_14], 100h
		jle	short loc_41CAE
		mov	ax, 1
		jmp	short loc_41CB0
; ���������������������������������������������������������������������������

loc_41CAE:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+B8j
		xor	ax, ax

loc_41CB0:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+BDj
		or	al, al
		jz	short loc_41CC4
		mov	[bp+var_1C], 100h
		mov	eax, [bp+var_1C]
		mov	[bp+var_14], eax

loc_41CC4:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+C3j
		push	word ptr [si+20h]
		push	ss
		lea	ax, [bp+var_80]
		push	ax
		mov	bx, [si+20h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_80]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_74], eax
		mov	eax, [bp+var_7C]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_70], eax
		mov	eax, [bp+var_78]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_68]
		add	eax, [bp+var_74]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_64]
		add	eax, [bp+var_70]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_60]
		add	eax, [bp+var_6C]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_84], eax
		push	57A6h
		lea	ax, [bp+var_8C]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		lea	ax, [bp+var_84]
		push	ax
		lea	ax, [bp+var_8C]
		push	ax
		push	ss
		lea	ax, [bp+var_24]
		push	ax

loc_41D71:
		call	Math_ArcTan2_54B0A
		add	sp, 8
		mov	eax, [bp+var_24]
		mov	[bp+var_20], eax

loc_41D81:
		cmp	[bp+var_84], 0
		jle	short loc_41D8E
		mov	ax, 1
		jmp	short loc_41D90
; ���������������������������������������������������������������������������

loc_41D8E:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+198j
		xor	ax, ax

loc_41D90:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+19Dj
		or	al, al
		jz	short loc_41D99
		lea	ax, [bp+var_20]
		jmp	short loc_41DD8
; ���������������������������������������������������������������������������

loc_41D99:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+1A3j
		cmp	[bp+var_8C], 0
		jle	short loc_41DA6
		mov	ax, 1
		jmp	short loc_41DA8
; ���������������������������������������������������������������������������

loc_41DA6:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+1B0j
		xor	ax, ax

loc_41DA8:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+1B5j
		or	al, al
		jz	short loc_41DC3
		mov	eax, [bp+var_20]
		add	eax, 0B400h
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		lea	ax, [bp+var_2C]
		jmp	short loc_41DD8
; ���������������������������������������������������������������������������

loc_41DC3:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+1BBj
		mov	eax, [bp+var_20]
		add	eax, 0FFFF4C00h
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		lea	ax, [bp+var_34]

loc_41DD8:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+1A8j
					; GuidedBombBody_SteerToTarget_41BEF+1D2j
		push	ax
		push	57A6h
		call	Matrix_BuildAxisY_570C5
		add	sp, 4
		push	57A6h
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		push	57A6h
		lea	ax, [bp+var_68]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		mov	eax, [bp+var_60]
		mov	edx, eax
		mov	ecx, [bp+var_64]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_38], eax
		lea	ax, [bp+var_38]
		push	ax
		push	ss
		lea	ax, [bp+var_3C]
		push	ax
		call	Math_ArcTan_54ADE
		add	sp, 6
		mov	eax, [bp+var_3C]
		mov	[bp+var_38], eax
		mov	eax, [si+18h]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		cmp	[bp+var_64], 0
		jge	short loc_41E50
		mov	ax, 1
		jmp	short loc_41E52
; ���������������������������������������������������������������������������

loc_41E50:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+25Aj
		xor	ax, ax

loc_41E52:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+25Fj
		or	al, al
		jz	short loc_41E82
		mov	[bp+var_44], 0B400h
		mov	eax, [bp+var_38]
		or	eax, eax
		jge	short loc_41E6A
		neg	eax

loc_41E6A:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+276j
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]

loc_41E72:
		mov	[bp+var_4C], eax

loc_41E76:
		mov	eax, [bp+var_44]
		sub	eax, [bp+var_4C]

loc_41E7E:
		mov	[bp+var_38], eax

loc_41E82:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+265j
		mov	eax, [bp+var_38]

loc_41E86:
		cmp	eax, [bp+var_40]
		jle	short loc_41E91
		mov	ax, 1

loc_41E8F:
		jmp	short loc_41E93
; ���������������������������������������������������������������������������

loc_41E91:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+29Bj
		xor	ax, ax

loc_41E93:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF:loc_41E8Fj
		or	al, al
		jz	short loc_41EC2
		cmp	[bp+var_38], 0
		jge	short loc_41EA3
		mov	ax, 1
		jmp	short loc_41EA5
; ���������������������������������������������������������������������������

loc_41EA3:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+2ADj
		xor	ax, ax

loc_41EA5:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+2B2j
		or	al, al
		jz	short loc_41EBA
		mov	eax, [bp+var_40]
		neg	eax
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		jmp	short loc_41EBE
; ���������������������������������������������������������������������������

loc_41EBA:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+2B8j
		mov	eax, [bp+var_40]

loc_41EBE:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+2C9j
		mov	[bp+var_38], eax

loc_41EC2:				; CODE XREF: GuidedBombBody_SteerToTarget_41BEF+2A6j
		lea	ax, [bp+var_38]
		push	ax
		push	57A6h
		call	Matrix_BuildAxisX_56EC3
		add	sp, 4
		push	57A6h
		call	Matrix_OrthonormalizeKeepRow0_575DF
		pop	cx
		push	57A6h
		mov	bx, [si]
		push	word ptr [bx+2]
		mov	bx, [bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_41EED:
		mov	[bp+var_58], 0

loc_41EF5:
		mov	eax, [bp+var_58]
		mov	bx, [si]

loc_41EFB:
		mov	[bx+8],	eax

loc_41EFF:
		mov	eax, [si+1Ch]

loc_41F03:
		mov	[bx+0Ch], eax

loc_41F07:
		mov	[bp+var_5C], 0
		mov	eax, [bp+var_5C]
		mov	[bx+10h], eax
		push	57A6h
		mov	ax, [si]
		add	ax, 8
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		pop	si
		leave
		retf
GuidedBombBody_SteerToTarget_41BEF	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE (2026-09-24). Tick (slot +0x3C, vtable seg339 tag 0x1F16, via les thunks d'ajusteur
; seg082 loc_3AE8E / loc_3AF25) du CORPS de la bombe guidee, construit par
; JDYN_LoadChunkAndConstruct_3A49C quand le chunk dynamique 'GBMB' est present (0x49 octets).
; Position propre -> dword_7284A.. ; orientation de l'objet ([si]->+2, vtable+0x3C) copiee
; dans 0x57A6 ; +0x20 = objet+0x55 (cible, SetReference16) ; +0x22 = objet->vtable+0x38
; (lanceur) ; si cible : point vise = position +0x12 de la cible -> dword_7283E... Avec cible
; : GuidedBombBody_InheritLaunchSpeed_41B84 puis GuidedBombBody_SteerToTarget_41BEF. Sans
; cible : FlightControl_ComputeAngularAccel (somme des forces / masse : chute libre) puis
; WorldObject_AlignNoseOnVelocity_419E4. Renvoie 1.
; ==============================================================================================
GuidedBombBody_GuidanceTick_41F2B:				; CODE XREF: seg082:0A30J seg082:0ABCJ
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+6]
		mov	bx, [si]
		mov	di, [bx+2]
		add	di, 12h
		mov	eax, [di]
		mov	dword_7284A, eax
		mov	eax, [di+4]
		mov	dword_7284E, eax
		mov	eax, [di+8]
		mov	dword_72852, eax
		push	word ptr [bx+2]
		mov	bx, [bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	57A6h
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	bx, [si]
		mov	bx, [bx+2]
		mov	ax, [bx+55h]
		mov	[bp-2],	ax
		push	ax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax

loc_41F7F:
		call	SetReference16
		add	sp, 4
		mov	bx, [si]
		push	word ptr [bx+2]
		mov	bx, [bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+38h]
		pop	cx
		mov	[bp-4],	ax
		push	ax
		mov	ax, si
		add	ax, 22h	; '"'
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	word ptr [si+20h], 0
		jz	short loc_41FE2
		push	word ptr [si+20h]
		mov	bx, [si+20h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp-6],	dx
		mov	[bp-8],	ax
		cmp	dword ptr [bp-8], 0
		jz	short loc_41FE2
		mov	di, [si+20h]
		add	di, 12h
		mov	eax, [di]
		mov	dword_7283E, eax
		mov	eax, [di+4]
		mov	dword_72842, eax
		mov	eax, [di+8]
		mov	dword_72846, eax

loc_41FE2:				; CODE XREF: seg089:0C9Bj seg089:0CB3j
		cmp	word ptr [si+20h], 0
		jz	short loc_41FF5
		push	si
		push	cs
		call	near ptr GuidedBombBody_InheritLaunchSpeed_41B84
		pop	cx
		push	si
		push	cs
		call	near ptr GuidedBombBody_SteerToTarget_41BEF
		jmp	short loc_42005
; ���������������������������������������������������������������������������

loc_41FF5:				; CODE XREF: seg089:0CD6j
		push	si

loc_41FF6:
		call	FlightControl_ComputeAngularAccel
		pop	cx
		mov	bx, [si]

loc_41FFE:
		push	word ptr [bx+2]
		push	cs
		call	near ptr WorldObject_AlignNoseOnVelocity_419E4

loc_42005:				; CODE XREF: seg089:0CE3j
		pop	cx
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4200C:				; CODE XREF: seg082:0A19J seg082:0AB0J
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 1
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,149L — intègre le temps écoulé (dword_70458, delta-temps physique) dans un timer de vie
; (+0x35 vs seuil +0x31), intègre une vitesse (+0x29) dans une position (+0x3D) : simulation
; physique d'un leurre déployé (chaff) : durée de vie + trajectoire balistique.
; ==============================================================================================
Chaff_PhysicsTick	proc far		; CODE XREF: seg089:111Cp

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
		sub	sp, 30h
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_42021:
		mov	eax, dword_70458

loc_42025:
		add	[si+35h], eax

loc_42029:
		mov	eax, [si+35h]

loc_4202D:
		cmp	eax, [si+31h]

loc_42031:
		jge	short loc_42038

loc_42033:
		mov	ax, 1

loc_42036:
		jmp	short loc_4203A
; ���������������������������������������������������������������������������

loc_42038:				; CODE XREF: Chaff_PhysicsTick:loc_42031j
		xor	ax, ax

loc_4203A:				; CODE XREF: Chaff_PhysicsTick:loc_42036j
		or	al, al
		jnz	short loc_42041
		jmp	loc_4211F
; ���������������������������������������������������������������������������

loc_42041:				; CODE XREF: Chaff_PhysicsTick+26j
		mov	eax, [si+29h]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax
		mov	di, si
		add	di, 3Dh	; '='
		mov	eax, [di]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax

loc_4207E:
		mov	eax, [di+4]

loc_42082:
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax

loc_42092:
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_8]
		add	[si+8],	eax
		mov	eax, [bp+var_4]
		add	[si+0Ch], eax
		mov	eax, [si+10h]
		cmp	eax, [si+23h]
		jle	short loc_420D9
		mov	ax, 1
		jmp	short loc_420DB
; ���������������������������������������������������������������������������

loc_420D9:				; CODE XREF: Chaff_PhysicsTick+BCj
		xor	ax, ax

loc_420DB:				; CODE XREF: Chaff_PhysicsTick+C1j
		or	al, al
		jz	short loc_42123
		mov	eax, [si+2Dh]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8

loc_420F0:
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_2C], eax

loc_420FC:
		add	[si+10h], eax
		mov	eax, [si+10h]
		cmp	eax, [si+23h]
		jge	short loc_4210F
		mov	ax, 1
		jmp	short loc_42111
; ���������������������������������������������������������������������������

loc_4210F:				; CODE XREF: Chaff_PhysicsTick+F2j
		xor	ax, ax

loc_42111:				; CODE XREF: Chaff_PhysicsTick+F7j
		or	al, al
		jz	short loc_42123
		mov	eax, [si+23h]
		mov	[si+10h], eax
		jmp	short loc_42123
; ���������������������������������������������������������������������������

loc_4211F:				; CODE XREF: Chaff_PhysicsTick+28j
		mov	byte ptr [si+27h], 1

loc_42123:				; CODE XREF: Chaff_PhysicsTick+C7j
					; Chaff_PhysicsTick+FDj ...
		pop	di
		pop	si
		leave
		retf
Chaff_PhysicsTick	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,74L — variante de sub_42016 sur des offsets différents (+0x10 vs +0x23, vitesse +0x39) :
; simulation physique d'un second type de leurre déployé (flare) : durée de vie + trajectoire.
; ==============================================================================================
Flare_PhysicsTick	proc far		; CODE XREF: seg089:1115p

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si

loc_4212E:
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+8],	eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+0Ch], eax
		mov	eax, [si+10h]
		cmp	eax, [si+23h]
		jle	short loc_42160
		mov	ax, 1
		jmp	short loc_42162
; ���������������������������������������������������������������������������

loc_42160:				; CODE XREF: Flare_PhysicsTick+32j
		xor	ax, ax

loc_42162:				; CODE XREF: Flare_PhysicsTick+37j
		or	al, al
		jz	short loc_421A4
		mov	eax, [si+39h]
		mov	edx, dword_70458
		imul	edx

loc_42172:
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax

loc_42183:
		add	[si+10h], eax

loc_42187:
		mov	eax, [si+10h]

loc_4218B:
		cmp	eax, [si+23h]
		jge	short loc_42196

loc_42191:
		mov	ax, 1
		jmp	short loc_42198
; ���������������������������������������������������������������������������

loc_42196:				; CODE XREF: Flare_PhysicsTick+68j
		xor	ax, ax

loc_42198:				; CODE XREF: Flare_PhysicsTick+6Dj
		or	al, al
		jz	short loc_421A4
		mov	eax, [si+23h]
		mov	[si+10h], eax

loc_421A4:				; CODE XREF: Flare_PhysicsTick+3Dj
					; Flare_PhysicsTick+73j
		pop	si
		leave
		retf
Flare_PhysicsTick	endp

; ���������������������������������������������������������������������������

loc_421A7:				; DATA XREF: seg339:off_6EEF2o
		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		push	di
		mov	si, [bp+6]
		cmp	byte ptr [si+28h], 0
		jnz	short loc_421BB
		jmp	loc_4241D
; ���������������������������������������������������������������������������

loc_421BB:				; CODE XREF: seg089:0EA6j
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+38h]
		pop	cx
		mov	[bp-2],	ax
		push	ax
		mov	ax, si
		add	ax, 45h	; 'E'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	dword ptr [bp-6], 0
		mov	eax, [si+10h]
		cmp	eax, [bp-6]
		jle	short loc_421F0
		mov	ax, 1
		jmp	short loc_421F2
; ���������������������������������������������������������������������������

loc_421F0:				; CODE XREF: seg089:0ED9j
		xor	ax, ax

loc_421F2:				; CODE XREF: seg089:0EDEj
		or	al, al
		jz	short loc_42206

loc_421F6:
		mov	dword ptr [bp-0Ah], 0
		mov	eax, [bp-0Ah]
		mov	[si+10h], eax

loc_42206:				; CODE XREF: seg089:0EE4j
		mov	eax, [si+8]
		mov	[si+3Dh], eax
		mov	eax, [si+0Ch]
		mov	[si+41h], eax
		mov	ax, si
		add	ax, 3Dh	; '='
		push	ax
		call	UI_ComputeScaledVectorHelper_56215
		pop	cx

loc_42222:
		mov	ax, [si+21h]
		shl	ax, 1
		mov	[bp-0Ch], ax

loc_4222A:
		movsx	eax, word ptr [bp-0Ch]
		shl	eax, 8
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		mov	[si+31h], eax
		push	large dword ptr	[si+10h]
		push	large dword ptr	[si+0Ch]
		push	large dword ptr	[si+8]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-18h], eax
		mov	[bp-14h], eax
		mov	eax, [si+31h]
		mov	edx, eax
		mov	ecx, [bp-14h]
		sar	edx, 18h
		shl	eax, 8

loc_42272:
		idiv	ecx
		mov	[si+31h], eax
		mov	eax, [bp-14h]
		mov	edx, eax
		mov	ecx, [si+31h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+29h], eax
		mov	di, si
		add	di, 29h	; ')'
		mov	ax, si
		add	ax, 29h	; ')'
		mov	[bp-1Ah], ax
		mov	bx, [bp-1Ah]
		mov	eax, [bx]
		neg	eax
		mov	[di], eax
		push	1
		lea	ax, [bp-52h]
		push	ax
		mov	ax, [si+45h]
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp-1Eh]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp-1Eh]
		shl	eax, 2
		mov	[bp-26h], eax
		mov	[bp-22h], eax
		mov	eax, [bp-22h]
		mov	edx, eax
		mov	dword ptr [bp-2Ah], 300h
		mov	ecx, [bp-2Ah]
		sar	edx, 18h

loc_422F1:
		shl	eax, 8
		idiv	ecx

loc_422F8:
		mov	[bp-22h], eax
		mov	eax, [si+31h]

loc_42300:
		mov	edx, [si+31h]

loc_42304:
		imul	edx

loc_42307:
		shrd	eax, edx, 8
		mov	[si+2Dh], eax
		mov	eax, [bp-22h]
		mov	edx, eax
		mov	ecx, [si+2Dh]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+2Dh], eax

loc_4232A:
		mov	di, si
		add	di, 2Dh	; '-'
		mov	ax, si
		add	ax, 2Dh	; '-'
		mov	[bp-2Ch], ax
		mov	bx, [bp-2Ch]
		mov	eax, [bx]
		neg	eax
		mov	[di], eax
		mov	eax, [si+2Dh]
		mov	edx, [si+31h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-30h], eax
		mov	eax, [si+23h]
		cmp	eax, [bp-30h]
		jge	short loc_42366
		mov	ax, 1
		jmp	short loc_42368
; ���������������������������������������������������������������������������

loc_42366:				; CODE XREF: seg089:104Fj
		xor	ax, ax

loc_42368:				; CODE XREF: seg089:1054j
		or	al, al
		jnz	short loc_4236F
		jmp	loc_42409
; ���������������������������������������������������������������������������

loc_4236F:				; CODE XREF: seg089:105Aj
		mov	eax, [bp-1Eh]
		shl	eax, 1
		mov	[bp-3Ch], eax
		mov	[bp-40h], eax
		mov	[bp-22h], eax
		neg	eax
		mov	[bp-22h], eax
		mov	eax, [bp-22h]
		mov	edx, eax

loc_42390:
		mov	dword ptr [bp-44h], 300h
		mov	ecx, [bp-44h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-22h], eax
		mov	di, si
		add	di, 23h	; '#'
		mov	eax, [bp-30h]
		add	eax, [di]
		mov	[bp-38h], eax
		mov	eax, [bp-22h]
		mov	edx, eax
		mov	ecx, [bp-38h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-38h], eax
		mov	di, si
		add	di, 39h	; '9'
		mov	ax, si
		add	ax, 23h	; '#'
		mov	[bp-46h], ax
		mov	bx, [bp-46h]
		mov	eax, [bx]
		sub	eax, [bp-30h]
		mov	[di], eax

loc_423EF:
		mov	eax, [si+39h]
		mov	edx, eax

loc_423F6:
		mov	ecx, [bp-38h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+39h], eax

loc_42409:				; CODE XREF: seg089:105Cj
		mov	byte ptr [si+28h], 0
		mov	dword ptr [bp-34h], 0
		mov	eax, [bp-34h]
		mov	[si+35h], eax

loc_4241D:				; CODE XREF: seg089:0EA8j
		cmp	byte ptr [si+27h], 0
		jz	short loc_4242A
		push	si

loc_42424:
		push	cs
		call	near ptr Flare_PhysicsTick

loc_42428:
		jmp	short loc_4242F
; ���������������������������������������������������������������������������

loc_4242A:				; CODE XREF: seg089:1111j
		push	si
		push	cs
		call	near ptr Chaff_PhysicsTick

loc_4242F:				; CODE XREF: seg089:loc_42428j
		pop	cx
		mov	al, 1

loc_42432:
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_42436:				; DATA XREF: seg339:1E46o
		push	bp

loc_42437:
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_42440:				; DATA XREF: seg339:off_71ED2o
		push	bp
		mov	bp, sp
		push	57A6h
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		pop	bp
		retf
seg089		ends
