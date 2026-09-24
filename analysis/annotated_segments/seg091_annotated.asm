seg091		segment	byte public 'CODE' use16
		assume cs:seg091
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,153L — calcule la distance entre un point de proximité (arg_0+0x12) et un point de
; référence (arg_2), la compare à un seuil : test de proximité (rayon de fuze) entre deux
; points, utilisé pour la détection de leurre/verrouillage.
; ==============================================================================================
Proximity_TestPoints	proc far		; CODE XREF: HUD_RenderSymbologyAlt+F25P
					; Proximity_TestOriented+2Cp

var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= word ptr  10h

		push	bp

loc_42D8D:				; DATA XREF: seg216:039Eo
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_42D9E
		jmp	loc_42E7A
; ���������������������������������������������������������������������������

loc_42D9E:				; CODE XREF: Proximity_TestPoints+Dj
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
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jle	short loc_42DF2
		mov	ax, 1
		jmp	short loc_42DF4
; ���������������������������������������������������������������������������

loc_42DF2:				; CODE XREF: Proximity_TestPoints+5Fj
		xor	ax, ax

loc_42DF4:				; CODE XREF: Proximity_TestPoints+64j
		or	al, al
		jnz	short loc_42DFB
		jmp	loc_42E7A
; ���������������������������������������������������������������������������

loc_42DFB:				; CODE XREF: Proximity_TestPoints+6Aj
		mov	eax, [bp+arg_6]
		mov	[bp+var_C], eax

loc_42E03:
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jl	short loc_42E12
		mov	ax, 1
		jmp	short loc_42E14
; ���������������������������������������������������������������������������

loc_42E12:				; CODE XREF: Proximity_TestPoints+7Fj
		xor	ax, ax

loc_42E14:				; CODE XREF: Proximity_TestPoints+84j
		or	al, al
		jz	short loc_42E7A
		cmp	byte_7235D, 0
		jz	short loc_42E23

loc_42E1F:				; CODE XREF: Proximity_TestPoints+ECj
		mov	al, 1

loc_42E21:
		jmp	short loc_42E7C
; ���������������������������������������������������������������������������

loc_42E23:				; CODE XREF: Proximity_TestPoints+91j
		lea	ax, [bp+var_26]
		push	ax
		call	Targeting_LineOfSightCheck_5593A
		pop	cx

loc_42E2D:
		push	[bp+arg_4]

loc_42E30:
		lea	ax, [bp+var_26]
		push	ax

loc_42E34:
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	Math_DotProduct3D_5505B
		add	sp, 8
		mov	ax, [bp+arg_A]
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_1A], eax
		lea	ax, [bp+var_1A]
		push	ax
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		call	Math_Sin_5483F
		add	sp, 6
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_14]
		jl	short loc_42E74
		mov	ax, 1
		jmp	short loc_42E76
; ���������������������������������������������������������������������������

loc_42E74:				; CODE XREF: Proximity_TestPoints+E1j
		xor	ax, ax

loc_42E76:				; CODE XREF: Proximity_TestPoints+E6j
		or	al, al
		jnz	short loc_42E1F

loc_42E7A:				; CODE XREF: Proximity_TestPoints+Fj
					; Proximity_TestPoints+6Cj ...
		mov	al, 0

loc_42E7C:				; CODE XREF: Proximity_TestPoints:loc_42E21j
		pop	di
		pop	si
		leave
		retf
Proximity_TestPoints	endp

; ���������������������������������������������������������������������������

loc_42E80:				; DATA XREF: seg339:off_6F560o
					; seg339:off_6F608o
		push	bp

loc_42E81:
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jz	short loc_42E8F
		mov	ax, si
		jmp	short loc_42E99
; ���������������������������������������������������������������������������

loc_42E8F:				; CODE XREF: seg091:0109j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_42E99:				; CODE XREF: seg091:010Dj
		or	ax, ax
		jz	short loc_42EB8
		mov	eax, dword_707F8
		mov	[si], eax
		mov	eax, dword_707FC
		mov	[si+4],	eax
		mov	eax, dword_70800
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_42EBA
; ���������������������������������������������������������������������������

loc_42EB8:				; CODE XREF: seg091:011Bj
		mov	ax, si

loc_42EBA:				; CODE XREF: seg091:0136j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,39L — appelle vtable[0x3C] pour résoudre l'orientation puis sub_42D8C avec un rayon
; décalé (+0xC) : test de proximité orientée pour la détection de cible potentielle.
; ==============================================================================================
Proximity_TestOriented	proc far		; CODE XREF: seg088:1131P seg090:01E8P ...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_6]
		or	si, si
		jz	short loc_42EF7
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+54h]
		push	large dword ptr	es:[bx+50h]
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
		jmp	short loc_42EF9
; ���������������������������������������������������������������������������

loc_42EF7:				; CODE XREF: Proximity_TestOriented+9j
		mov	al, 0

loc_42EF9:				; CODE XREF: Proximity_TestOriented+32j
		pop	si
		pop	bp
		retf
Proximity_TestOriented	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,69L — teste la proximité (sub_42EC3) puis vérifie que l'angle projeté (vtable[0x7C]) est
; dans une fenêtre de ±0x19 (25) autour d'une valeur cible : test 'cible dans le réticule du
; viseur' (fenêtre angulaire de verrouillage).
; ==============================================================================================
Targeting_ReticleWindowTest	proc far		; CODE XREF: Targeting_SelectAndPrioritize+18Cp

var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
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
		jz	short loc_42F6A
		push	di
		push	si
		push	large [bp+arg_0]
		push	cs

loc_42F31:
		call	near ptr Proximity_TestOriented
		add	sp, 8
		or	al, al
		jz	short loc_42F6A
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx+7Ch]
		add	sp, 4
		mov	ah, 0
		mov	dx, [bp+var_2]
		add	dx, 19h
		cmp	ax, dx
		jg	short loc_42F6A
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx+7Ch]
		add	sp, 4
		mov	ah, 0
		mov	dx, [bp+var_2]
		add	dx, 0FFE7h
		cmp	ax, dx
		jl	short loc_42F6A
		mov	[bp+var_4], si

loc_42F6A:				; CODE XREF: Targeting_ReticleWindowTest+2Cj
					; Targeting_ReticleWindowTest+3Dj ...
		mov	ax, [bp+var_4]
		pop	di
		pop	si
		leave
		retf
Targeting_ReticleWindowTest	endp

; ���������������������������������������������������������������������������

loc_42F71:				; DATA XREF: seg339:off_6F540o
					; seg339:24ACo	...
		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	dx, [bp+0Ah]
		mov	bx, [bp+0Ch]
		or	dx, dx
		jnz	short loc_42F86

loc_42F83:
		jmp	loc_4300D
; ���������������������������������������������������������������������������

loc_42F86:				; CODE XREF: seg091:0201j
		or	bx, bx
		jnz	short loc_42F8D
		jmp	loc_4300D
; ���������������������������������������������������������������������������

loc_42F8D:				; CODE XREF: seg091:0208j
		mov	si, dx
		add	si, 12h
		mov	di, bx

loc_42F94:
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp-20h], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp-1Ch], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp-18h], eax
		push	eax
		push	large dword ptr	[bp-1Ch]
		push	large dword ptr	[bp-20h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-8],	eax
		mov	[bp-4],	eax
		les	bx, [bp+6]
		mov	eax, es:[bx+56h]
		mov	[bp-10h], eax
		shl	eax, 8
		mov	[bp-0Ch], eax
		mov	eax, es:[bx+56h]

loc_42FF0:
		mov	[bp-14h], eax

loc_42FF4:
		shl	eax, 8

loc_42FF8:
		cmp	eax, [bp-4]
		jle	short loc_43003

loc_42FFE:
		mov	ax, 1
		jmp	short loc_43005
; ���������������������������������������������������������������������������

loc_43003:				; CODE XREF: seg091:027Cj
		xor	ax, ax

loc_43005:				; CODE XREF: seg091:0281j
		or	al, al
		jz	short loc_4300D
		mov	al, 1
		jmp	short loc_4300F
; ���������������������������������������������������������������������������

loc_4300D:				; CODE XREF: seg091:loc_42F83j
					; seg091:020Aj	...
		mov	al, 0

loc_4300F:				; CODE XREF: seg091:028Bj
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,141L — filtre par type d'arme (+0x4F ∈ {1..5}), parcourt la liste des objets candidats,
; teste la compatibilité de type (+0x11) : filtrage des cibles compatibles avec le type d'arme
; sélectionné pour l'acquisition.
; ==============================================================================================
Targeting_FilterByWeaponType	proc far		; CODE XREF: Targeting_SelectAndPrioritize+30p
					; Targeting_SelectAndPrioritize+108p ...

var_D		= byte ptr -0Dh
var_C		= byte ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	[bp+var_1], 0
		mov	[bp+var_4], 0
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+4Fh], 1
		jz	short loc_43050
		cmp	byte ptr es:[bx+4Fh], 2
		jz	short loc_43050
		cmp	byte ptr es:[bx+4Fh], 5
		jz	short loc_43050
		cmp	byte ptr es:[bx+4Fh], 3
		jz	short loc_43050
		cmp	byte ptr es:[bx+4Fh], 4
		jz	short loc_43050
		jmp	loc_430F6
; ���������������������������������������������������������������������������

loc_43050:				; CODE XREF: Targeting_FilterByWeaponType+1Cj
					; Targeting_FilterByWeaponType+23j ...
		mov	[bp+var_6], 0
		jmp	loc_430E0
; ���������������������������������������������������������������������������

loc_43058:				; CODE XREF: Targeting_FilterByWeaponType+E0j
		mov	si, [bp+var_6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jz	short loc_430E0
		les	bx, [bp+var_A]
		mov	al, es:[bx+11h]
		mov	[bp+var_C], al
		mov	[bp+var_D], 0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+4Fh]

loc_43083:
		mov	ah, 0
		dec	ax
		mov	bx, ax

loc_43088:				; switch 5 cases
		cmp	bx, 4
		ja	short loc_430B2	; default

loc_4308D:
		shl	bx, 1
		jmp	cs:off_430FD[bx] ; switch jump

loc_43094:				; DATA XREF: seg091:off_430FDo
		push	di		; case 0x0
		push	si
		mov	bx, [si]
		call	dword ptr [bx+7Ch]
		add	sp, 4
		jmp	short loc_430AF
; ���������������������������������������������������������������������������

loc_430A0:				; CODE XREF: Targeting_FilterByWeaponType+7Cj
					; DATA XREF: seg091:off_430FDo
		push	si		; case 0x2
		call	Debris_GetStateFlag
		jmp	short loc_430AE
; ���������������������������������������������������������������������������

loc_430A8:				; CODE XREF: Targeting_FilterByWeaponType+7Cj
					; DATA XREF: seg091:off_430FDo
		push	si		; case 0x3
		call	Debris_GetSubpartAttrib

loc_430AE:				; CODE XREF: Targeting_FilterByWeaponType+93j
		pop	cx

loc_430AF:				; CODE XREF: Targeting_FilterByWeaponType+8Bj
		mov	[bp+var_D], al

loc_430B2:				; CODE XREF: Targeting_FilterByWeaponType+78j
		cmp	[bp+var_C], 1	; default
		jz	short loc_430BE
		cmp	[bp+var_C], 4
		jnz	short loc_430E0

loc_430BE:				; CODE XREF: Targeting_FilterByWeaponType+A3j
		mov	al, [bp+var_D]
		cmp	al, [bp+var_1]
		jbe	short loc_430E0
		push	di
		push	si
		push	large [bp+arg_0]
		push	cs
		call	near ptr Proximity_TestOriented
		add	sp, 8
		or	al, al
		jz	short loc_430E0
		mov	al, [bp+var_D]
		mov	[bp+var_1], al
		mov	[bp+var_4], si

loc_430E0:				; CODE XREF: Targeting_FilterByWeaponType+42j
					; Targeting_FilterByWeaponType+59j ...
		lea	ax, [bp+var_6]
		push	ax
		push	59C3h
		call	World_IterateObjects
		add	sp, 4
		or	ax, ax

loc_430F1:
		jz	short loc_430F6
		jmp	loc_43058
; ���������������������������������������������������������������������������

loc_430F6:				; CODE XREF: Targeting_FilterByWeaponType+3Aj
					; Targeting_FilterByWeaponType:loc_430F1j
		mov	ax, [bp+var_4]
		pop	di
		pop	si
		leave
		retf
Targeting_FilterByWeaponType	endp

; ���������������������������������������������������������������������������
off_430FD	dw offset loc_43094	; DATA XREF: Targeting_FilterByWeaponType+7Cr
		dw offset loc_43094	; jump table for switch	statement
		dw offset loc_430A0
		dw offset loc_430A8
		dw offset loc_43094

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 327L, LUE (2026-09-20, table de sauts corrigée 2026-09-24). MODELE DE CHERCHEUR :
; decide si le chercheur GARDE sa cible (arg_4) ou la PERD au profit d'un autre candidat
; (leurre, autre avion). Arguments : (arme [modele WDAT], cible actuelle di, objet de
; reference du chercheur arg_6, octet arg_8). Appelants : WeaponStation_TestTargetLock avant
; tir (cible voulue, objet +0x0D du point d'emport) et le guidage du missile en vol (seg090 :
; cible = missile+0x55, reference = le missile lui-meme, resultat re-range dans missile+0x55).
; Aiguillage dec ax sur weapon_aspec (+0x4F) : index = aspec-1 (off_43319). ASPEC 1 (AIM-9J) :
; candidat c = Targeting_FilterByWeaponType(arme, reference) ; c nul -> 0 ; c = di -> test
; d'aspect ; sinon poids w = 3 (5 si c->vtable+0x38 == word_722E6), s =
; c->vtable+0x7C(reference) : s > 0xD2 (210) et Math_RandomScale_54DF4(10) < w -> bascule sur
; c ; s == 210 -> bascule ; sinon reste sur di. Si on reste sur di : ASPECT ARRIERE
; OBLIGATOIRE, Math_DotProduct3D_5505B(vitesse reference, vitesse di) >= Math_Sin_5483F(0x5A00
; = 90.0) sinon renvoie 0 (piste perdue). ASPEC 2 (AIM-9M) : meme candidat, bascule si s >=
; 0xF5 (245) et tirage < w, sinon reste sur di ; PAS de test d'aspect (tous secteurs). ASPEC 3
; (aucune arme des fichiers WDAT) : di nul -> FilterByWeaponType ; sinon
; Targeting_ReticleWindowTest(arme, di, reference, arg_8). ASPEC 4 (AIM-120, SA-2, SA-6) :
; bascule si Debris_GetSubpartAttrib(c) (2e octet SIGN du modele, non virtuel) >= 245 et
; tirage < w, sinon reste sur di. ASPEC 5/6 (AGM-65D, GBU-15) : Proximity_TestOriented(arme,
; di, reference) non nul -> di, sinon 0. Aucun test du nombre de missiles en l'air. NB :
; l'ancien resume decalait les aspecs 2 a 4 d'un cran.
; ==============================================================================================
Targeting_SelectAndPrioritize	proc far		; CODE XREF: WeaponStation_TestTargetLock+78P
					; seg090:006AP

var_24		= word ptr -24h
var_18		= word ptr -18h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	di, [bp+arg_4]
		xor	si, si
		les	bx, [bp+arg_0]
		mov	al, es:[bx+4Fh]
		mov	ah, 0
		dec	ax
		mov	bx, ax

loc_43120:				; switch 6 cases
		cmp	bx, 5

loc_43123:
		jbe	short loc_43128

loc_43125:				; default
		jmp	loc_43313
; ���������������������������������������������������������������������������

loc_43128:				; CODE XREF: Targeting_SelectAndPrioritize:loc_43123j
		shl	bx, 1
		jmp	cs:off_43319[bx] ; switch jump

loc_4312F:				; DATA XREF: seg091:off_43319o
		push	[bp+arg_6]	; case 0x0

loc_43132:
		push	large [bp+arg_0]
		push	cs
		call	near ptr Targeting_FilterByWeaponType
		add	sp, 6
		mov	si, ax
		or	si, si
		jz	short loc_4318D
		cmp	si, di
		jz	short loc_4318D
		mov	word ptr [bp+var_4+2], 3
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		cmp	ax, word_722E6
		jnz	short loc_4315E
		mov	word ptr [bp+var_4+2], 5

loc_4315E:				; CODE XREF: Targeting_SelectAndPrioritize+50j
		push	[bp+arg_6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+7Ch]
		add	sp, 4
		cmp	al, 0D2h ; '�'
		jbe	short loc_4317B
		mov	ax, 0Ah
		call	Math_RandomScale_54DF4
		cmp	ax, word ptr [bp+var_4+2]
		jge	short loc_4318B

loc_4317B:				; CODE XREF: Targeting_SelectAndPrioritize+65j
		push	[bp+arg_6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+7Ch]
		add	sp, 4
		cmp	al, 0D2h ; '�'
		jnb	short loc_4318D

loc_4318B:				; CODE XREF: Targeting_SelectAndPrioritize+72j
		mov	si, di

loc_4318D:				; CODE XREF: Targeting_SelectAndPrioritize+3Aj
					; Targeting_SelectAndPrioritize+3Ej ...
		or	si, si
		jnz	short loc_43194
		jmp	loc_43313	; default
; ���������������������������������������������������������������������������

loc_43194:				; CODE XREF: Targeting_SelectAndPrioritize+88j
		cmp	si, di
		jz	short loc_4319B
		jmp	loc_43313	; default
; ���������������������������������������������������������������������������

loc_4319B:				; CODE XREF: Targeting_SelectAndPrioritize+8Fj
		push	[bp+arg_6]
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		mov	bx, [bp+arg_6]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	di
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		lea	ax, [bp+var_24]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	Math_DotProduct3D_5505B
		add	sp, 8
		mov	[bp+var_C], 5A00h
		lea	ax, [bp+var_C]
		push	ax
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		call	Math_Sin_5483F
		add	sp, 6
		mov	eax, [bp+var_4]

loc_431EE:
		cmp	eax, [bp+var_8]
		jge	short loc_431F9
		mov	ax, 1
		jmp	short loc_431FB
; ���������������������������������������������������������������������������

loc_431F9:				; CODE XREF: Targeting_SelectAndPrioritize+EBj
		xor	ax, ax

loc_431FB:				; CODE XREF: Targeting_SelectAndPrioritize+F0j
		or	al, al
		jnz	short loc_43202
		jmp	loc_43313	; default
; ���������������������������������������������������������������������������

loc_43202:				; CODE XREF: Targeting_SelectAndPrioritize+F6j
					; Targeting_SelectAndPrioritize+202j ...
		xor	si, si

loc_43204:				; default
		jmp	loc_43313
; ���������������������������������������������������������������������������

loc_43207:				; CODE XREF: Targeting_SelectAndPrioritize+23j
					; DATA XREF: seg091:off_43319o
		push	[bp+arg_6]	; case 0x1
		push	large [bp+arg_0]
		push	cs
		call	near ptr Targeting_FilterByWeaponType
		add	sp, 6
		mov	si, ax
		or	si, si
		jnz	short loc_4321E
		jmp	loc_43313	; default
; ���������������������������������������������������������������������������

loc_4321E:				; CODE XREF: Targeting_SelectAndPrioritize+112j
		cmp	si, di

loc_43220:
		jnz	short loc_43225
		jmp	loc_43313	; default
; ���������������������������������������������������������������������������

loc_43225:				; CODE XREF: Targeting_SelectAndPrioritize:loc_43220j
		mov	word ptr [bp+var_4+2], 3
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		cmp	ax, word_722E6
		jnz	short loc_4323C
		mov	word ptr [bp+var_4+2], 5

loc_4323C:				; CODE XREF: Targeting_SelectAndPrioritize+12Ej
		push	[bp+arg_6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+7Ch]
		add	sp, 4
		cmp	al, 0F5h ; '�'
		jb	short loc_4325C
		mov	ax, 0Ah
		call	Math_RandomScale_54DF4
		cmp	ax, word ptr [bp+var_4+2]
		jl	short loc_4325C
		jmp	loc_4330C
; ���������������������������������������������������������������������������

loc_4325C:				; CODE XREF: Targeting_SelectAndPrioritize+143j
					; Targeting_SelectAndPrioritize+150j
		push	[bp+arg_6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+7Ch]
		add	sp, 4
		cmp	al, 0F5h ; '�'
		jb	short loc_4326F
		jmp	loc_43313	; default
; ���������������������������������������������������������������������������

loc_4326F:				; CODE XREF: Targeting_SelectAndPrioritize+163j
		jmp	loc_4330C
; ���������������������������������������������������������������������������

loc_43272:				; CODE XREF: Targeting_SelectAndPrioritize+23j
					; DATA XREF: seg091:off_43319o
		or	di, di		; case 0x2
		jnz	short loc_43286
		push	[bp+arg_6]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Targeting_FilterByWeaponType
		add	sp, 6
		jmp	short loc_43299
; ���������������������������������������������������������������������������

loc_43286:				; CODE XREF: Targeting_SelectAndPrioritize+16Dj
		mov	al, [bp+arg_8]
		push	ax
		push	[bp+arg_6]
		push	di
		push	large [bp+arg_0]
		push	cs
		call	near ptr Targeting_ReticleWindowTest
		add	sp, 0Ah

loc_43299:				; CODE XREF: Targeting_SelectAndPrioritize+17Dj
		mov	si, ax
		jmp	short loc_43313	; default
; ���������������������������������������������������������������������������

loc_4329D:				; CODE XREF: Targeting_SelectAndPrioritize+23j
					; DATA XREF: seg091:off_43319o
		push	[bp+arg_6]	; case 0x3
		push	large [bp+arg_0]
		push	cs
		call	near ptr Targeting_FilterByWeaponType
		add	sp, 6
		mov	si, ax
		or	si, si
		jz	short loc_43313	; default
		cmp	si, di
		jz	short loc_43313	; default
		mov	word ptr [bp+var_4+2], 3
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		cmp	ax, word_722E6
		jnz	short loc_432CC
		mov	word ptr [bp+var_4+2], 5

loc_432CC:				; CODE XREF: Targeting_SelectAndPrioritize+1BEj
		push	si
		call	Debris_GetSubpartAttrib
		pop	cx
		cmp	al, 0F5h ; '�'
		jb	short loc_432E4
		mov	ax, 0Ah
		call	Math_RandomScale_54DF4
		cmp	ax, word ptr [bp+var_4+2]
		jge	short loc_4330C

loc_432E4:				; CODE XREF: Targeting_SelectAndPrioritize+1CEj
		push	si
		call	Debris_GetSubpartAttrib
		pop	cx
		cmp	al, 0F5h ; '�'
		jnb	short loc_43313	; default
		jmp	short loc_4330C
; ���������������������������������������������������������������������������

loc_432F1:				; CODE XREF: Targeting_SelectAndPrioritize+23j
					; DATA XREF: seg091:off_43319o
		push	[bp+arg_6]	; case 0x4

loc_432F4:
		push	di

loc_432F5:
		push	large [bp+arg_0]
		push	cs
		call	near ptr Proximity_TestOriented

loc_432FD:
		add	sp, 8
		mov	byte ptr [bp+var_4+3], al

loc_43303:
		cmp	byte ptr [bp+var_4+3], 0
		jnz	short loc_4330C
		jmp	loc_43202
; ���������������������������������������������������������������������������

loc_4330C:				; CODE XREF: Targeting_SelectAndPrioritize+152j
					; Targeting_SelectAndPrioritize:loc_4326Fj	...
		mov	si, di
		jmp	short loc_43313	; default
; ���������������������������������������������������������������������������
		jmp	loc_43202
; ���������������������������������������������������������������������������

loc_43313:				; CODE XREF: Targeting_SelectAndPrioritize:loc_43125j
					; Targeting_SelectAndPrioritize+8Aj ...
		mov	ax, si		; default
		pop	di
		pop	si
		leave
		retf
Targeting_SelectAndPrioritize	endp

; ���������������������������������������������������������������������������
off_43319	dw offset loc_4312F	; DATA XREF: Targeting_SelectAndPrioritize+23r
		dw offset loc_43207	; jump table for switch	statement
		dw offset loc_43272
		dw offset loc_4329D
		dw offset loc_432F1
		dw offset loc_432F1
; ���������������������������������������������������������������������������

loc_43325:				; DATA XREF: seg339:off_6F958o
					; seg339:off_6F9E4o ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+57h]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_43332:				; DATA XREF: seg339:290Co
		push	bp

loc_43333:
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4333C:				; DATA XREF: seg339:off_6F5F8o
		push	bp
		mov	bp, sp
		mov	al, 7
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,43L — destructeur (type 0x2540) délégant à sub_3DBC1 : destructeur d'un composant du
; système de verrouillage/leurre.
; ==============================================================================================
Targeting_DestructComponent	proc far		; CODE XREF: Countermeasure_DestructA+1FP
					; seg090:08E3P	...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_4338B
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 2540h
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Camera_DestructTypeB
		add	sp, 6
		test	si, 1
		jz	short loc_4338B
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax

loc_43380:
		push	5C44h

loc_43383:
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_4338B:				; CODE XREF: Targeting_DestructComponent+Fj
					; Targeting_DestructComponent+2Bj
		pop	si
		leave
		retf
Targeting_DestructComponent	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,19L — attache (sub_3DC3D) puis positionne 2 flags (+0x59=1, +4 bit5) : initialisation
; d'un composant de verrouillage avec flags spécifiques.
; ==============================================================================================
Targeting_InitWithFlags	proc far		; CODE XREF: PlayerComponent_SubHelperA_9FD58+CP PlayerComponent_SubHelperP_A0488+CP ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	Camera_InitAttachedWithTarget_3DC3D
		add	sp, 6
		mov	byte ptr [si+59h], 1
		or	byte ptr [si+4], 20h
		pop	si
		pop	bp
		retf
Targeting_InitWithFlags	endp

; ���������������������������������������������������������������������������

loc_433AD:				; DATA XREF: seg339:off_6F9E0o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 7
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,45L — destructeur (type 0x28FC) invalidant deux références faibles (+0x57/+0x55 via
; WeakRef_InvalidateIfSet) puis destructeur parent (sub_3DC8D) : destructeur composé du
; système de verrouillage de cible (avec références faibles).
; ==============================================================================================
Targeting_DestructWithWeakRefs	proc far		; CODE XREF: Countermeasure_DestructB:loc_41982P
					; seg090:0925P
					; DATA XREF: ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_433FA
		mov	word ptr [si], 28FCh
		mov	ax, si
		add	ax, 57h	; 'W'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		mov	ax, si
		add	ax, 55h	; 'U'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	Camera_DestructWithMount
		add	sp, 4

loc_433ED:
		test	di, 1
		jz	short loc_433FA
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_433FA:				; CODE XREF: Targeting_DestructWithWeakRefs+Dj
					; Targeting_DestructWithWeakRefs+3Aj
		pop	di
		pop	si
		pop	bp
		retf
Targeting_DestructWithWeakRefs	endp

seg091		ends
