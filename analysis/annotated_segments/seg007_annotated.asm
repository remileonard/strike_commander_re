seg007		segment	byte public 'CODE' use16
		assume cs:seg007
		;org 1
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,291L — calcule position/vitesse relatives entre deux objets, utilise sub_464BE (probable
; test d'angle/cône de vision) : test 'objet visible/dans le champ de vision' pour
; l'acquisition de cible.
; ==============================================================================================
AI_VisibilityTest	proc far		; CODE XREF: AI_ScanForNewTarget+A8p seg008:2930P

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
var_56		= word ptr -56h
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
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp

loc_DD22:				; DATA XREF: seg216:00F6o
		mov	bp, sp
		sub	sp, 9Eh
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_1], 0
		mov	[bp+var_6], 400h
		les	bx, [bp+arg_0]
		mov	di, es:[bx+2]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_3E], eax
		mov	eax, [di+4]
		mov	[bp+var_3A], eax
		mov	eax, [di+8]
		mov	[bp+var_36], eax
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_4A], eax
		mov	eax, [di+4]
		mov	[bp+var_46], eax
		mov	eax, [di+8]
		mov	[bp+var_42], eax
		lea	ax, [bp+var_6]
		push	ax
		push	word ptr [si+51h]
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		push	word ptr [bx]
		push	ss
		lea	ax, [bp+var_56]
		push	ax
		call	Physics_ApplyForceAtPoint
		add	sp, 8
		mov	eax, [bp+var_3E]
		sub	eax, [bp+var_4A]
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_3A]
		sub	eax, [bp+var_46]
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_36]
		sub	eax, [bp+var_42]
		mov	[bp+var_66], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_5A], eax
		lea	ax, [bp+var_62]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		push	si
		push	ss
		lea	ax, [bp+var_86]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		push	ss
		lea	ax, [bp+var_92]
		push	ax
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_86]
		sub	eax, [bp+var_92]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_82]
		sub	eax, [bp+var_8E]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_7E]
		sub	eax, [bp+var_8A]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_9E]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_9A]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_72], eax
		lea	ax, [bp+var_62]
		push	ax
		lea	ax, [bp+var_7A]
		push	ax
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		cmp	[bp+var_A], 5000h
		jge	short loc_DE77
		mov	ax, 1
		jmp	short loc_DE79
; ���������������������������������������������������������������������������

loc_DE77:				; CODE XREF: AI_VisibilityTest+14Fj
		xor	ax, ax

loc_DE79:				; CODE XREF: AI_VisibilityTest+154j
		or	al, al
		jz	short loc_DE81
		mov	[bp+var_1], 1

loc_DE81:				; CODE XREF: AI_VisibilityTest+15Aj
		lea	ax, [bp+var_7A]
		push	ax
		push	ss
		lea	ax, [bp+var_12]
		push	ax
		call	Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		cmp	[bp+var_12], 0
		jle	short loc_DE9E
		mov	ax, 1
		jmp	short loc_DEA0
; ���������������������������������������������������������������������������

loc_DE9E:				; CODE XREF: AI_VisibilityTest+176j
		xor	ax, ax

loc_DEA0:				; CODE XREF: AI_VisibilityTest+17Bj
		or	al, al
		jnz	short loc_DEA7
		jmp	loc_DF6F
; ���������������������������������������������������������������������������

loc_DEA7:				; CODE XREF: AI_VisibilityTest+181j
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jz	short loc_DEB3
		jmp	loc_DF6F
; ���������������������������������������������������������������������������

loc_DEB3:				; CODE XREF: AI_VisibilityTest+18Dj
		cmp	[bp+var_E], 5A00h
		jge	short loc_DEC2
		mov	ax, 1
		jmp	short loc_DEC4
; ���������������������������������������������������������������������������

loc_DEC2:				; CODE XREF: AI_VisibilityTest+19Aj
		xor	ax, ax

loc_DEC4:				; CODE XREF: AI_VisibilityTest+19Fj
		or	al, al
		jnz	short loc_DECB
		jmp	loc_DF6F
; ���������������������������������������������������������������������������

loc_DECB:				; CODE XREF: AI_VisibilityTest+1A5j
		lea	ax, [bp+var_E]
		push	ax
		push	ss
		lea	ax, [bp+var_1A]
		push	ax
		call	Math_SinDeg_54876
		add	sp, 6
		mov	eax, [bp+var_A]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_16], eax
		cmp	[bp+var_16], 5000h
		jge	short loc_DF07
		mov	ax, 1
		jmp	short loc_DF09
; ���������������������������������������������������������������������������

loc_DF07:				; CODE XREF: AI_VisibilityTest+1DFj
		xor	ax, ax

loc_DF09:				; CODE XREF: AI_VisibilityTest+1E4j
		or	al, al
		jz	short loc_DF6F
		lea	ax, [bp+var_E]
		push	ax
		push	ss
		lea	ax, [bp+var_26]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		mov	eax, [bp+var_A]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_6]
		mov	edx, [bp+var_12]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_22]
		cmp	eax, [bp+var_2E]
		jg	short loc_DF65
		mov	ax, 1
		jmp	short loc_DF67
; ���������������������������������������������������������������������������

loc_DF65:				; CODE XREF: AI_VisibilityTest+23Dj
		xor	ax, ax

loc_DF67:				; CODE XREF: AI_VisibilityTest+242j
		or	al, al
		jz	short loc_DF6F
		mov	[bp+var_1], 1

loc_DF6F:				; CODE XREF: AI_VisibilityTest+183j
					; AI_VisibilityTest+18Fj ...
		cmp	[bp+var_1], 0
		jz	short loc_DF92
		lea	ax, [bp+var_4A]
		push	ax
		lea	ax, [bp+var_56]
		push	ax
		push	large [bp+arg_0]
		call	AI_ProximityGeometricWarning_315B
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+27Fh], 3

loc_DF92:				; CODE XREF: AI_VisibilityTest+252j
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
AI_VisibilityTest	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,97L — appelé par sub_814C : itère sur la liste des objets du monde (sub_224DA, filtre
; type 0x59C3), ignore soi-même, vérifie état 'détruit' (vtable[8]==6), teste chaque candidat
; via sub_DD21 : boucle de balayage/acquisition de nouvelle cible parmi tous les objets du
; monde.
; ==============================================================================================
AI_ScanForNewTarget	proc far		; CODE XREF: AI_TopLevelThink+270P

var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		mov	[bp+var_1], 0
		mov	[bp+var_6], 400h
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_DFD8
		cmp	byte ptr es:[bx+27Fh], 3
		jnz	short loc_DFD8
		push	large dword ptr	es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	[bp+var_1], 1
		jmp	loc_E066
; ���������������������������������������������������������������������������

loc_DFD8:				; CODE XREF: AI_ScanForNewTarget+1Cj AI_ScanForNewTarget+24j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_DFE6
		jmp	loc_E066
; ���������������������������������������������������������������������������

loc_DFE6:				; CODE XREF: AI_ScanForNewTarget+48j
		cmp	byte ptr es:[bx+27Fh], 3
		jnz	short loc_DFF4
		mov	byte ptr es:[bx+27Fh], 0

loc_DFF4:				; CODE XREF: AI_ScanForNewTarget+53j
		mov	[bp+var_8], 0
		jmp	short loc_E04A
; ���������������������������������������������������������������������������

loc_DFFB:				; CODE XREF: AI_ScanForNewTarget+CBj
		mov	si, [bp+var_8]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_E04A
		les	bx, [bp+var_C]
		cmp	byte ptr es:[bx+11h], 1
		jnz	short loc_E04A
		les	bx, [bp+arg_0]
		cmp	es:[bx+2], si
		jz	short loc_E04A
		push	dx
		push	ax
		les	bx, [bp+var_C]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 6
		jnz	short loc_E04A
		mov	[bp+var_E], si
		push	[bp+var_E]
		push	large [bp+arg_0]
		push	cs
		call	near ptr AI_VisibilityTest
		add	sp, 6
		mov	[bp+var_1], al

loc_E04A:				; CODE XREF: AI_ScanForNewTarget+60j AI_ScanForNewTarget+76j ...
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E066
		lea	ax, [bp+var_8]
		push	ax
		push	59C3h
		call	World_IterateObjects
		add	sp, 4
		or	ax, ax
		jnz	short loc_DFFB

loc_E066:				; CODE XREF: AI_ScanForNewTarget+3Cj AI_ScanForNewTarget+4Aj ...
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
AI_ScanForNewTarget	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Escort_WaitLandingClearance'. far, 96L. REFLEXE D'EVITEMENT DU SOL (niveau de reaction
; entite+0x27F = 4 ; pas une attente de clairance d'atterrissage). Lanceur generique : si le
; comportement en cours a deja ce niveau, le faire avancer ; si un autre comportement tourne,
; 0 ; sinon noter le noeud fixe ID14 (entite+0xC5) avec un contexte (sans cible, minuteur 2 s)
; ; s'il repond > 0 : abandon du comportement en cours, application d'ID14, niveau = 4.
; ==============================================================================================
AI_GroundAvoidReflex_E06C	proc far		; CODE XREF: AI_TopLevelThink+224P

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 12h
		mov	[bp+var_A], 0
		xor	ax, ax
		mov	[bp+var_6], ax
		mov	[bp+var_8], ax
		mov	[bp+var_E], 200h
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_E0B9
		cmp	byte ptr es:[bx+27Fh], 4
		jnz	short loc_E0B9
		push	large dword ptr	es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	al, 1
		jmp	locret_E157
; ���������������������������������������������������������������������������

loc_E0B9:				; CODE XREF: AI_GroundAvoidReflex_E06C+2Cj AI_GroundAvoidReflex_E06C+34j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_E0C9
		mov	al, 0
		jmp	locret_E157
; ���������������������������������������������������������������������������

loc_E0C9:				; CODE XREF: AI_GroundAvoidReflex_E06C+56j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 4
		jnz	short loc_E0DA
		mov	byte ptr es:[bx+27Fh], 0

loc_E0DA:				; CODE XREF: AI_GroundAvoidReflex_E06C+66j
		mov	[bp+var_6], 3748h
		mov	[bp+var_12], 200h
		mov	eax, [bp+var_12]
		mov	[bp+var_4], eax
		mov	[bp+var_A], 0
		lea	ax, [bp+var_A]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0C5h]
		les	bx, es:[bx+0C5h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		or	al, al
		jz	short loc_E153
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_E12B
		push	large dword ptr	es:[bx+0Dh]
		call	VROOMM_StubThunk_6AB54
		add	sp, 4

loc_E12B:				; CODE XREF: AI_GroundAvoidReflex_E06C+B0j
		lea	ax, [bp+var_A]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0C5h]
		les	bx, es:[bx+0C5h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+27Fh], 4
		mov	dl, 1
		jmp	short loc_E155
; ���������������������������������������������������������������������������

loc_E153:				; CODE XREF: AI_GroundAvoidReflex_E06C+A5j
		mov	dl, 0

loc_E155:				; CODE XREF: AI_GroundAvoidReflex_E06C+E5j
		mov	al, dl

locret_E157:				; CODE XREF: AI_GroundAvoidReflex_E06C+4Aj AI_GroundAvoidReflex_E06C+5Aj
		leave
		retf
AI_GroundAvoidReflex_E06C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Escort_WaitTakeoffClearance'. far, 96L. REFLEXE DE RECUPERATION NEZ HAUT / DECROCHAGE
; (niveau entite+0x27F = 5 ; pas une attente de clairance de decollage). Meme lanceur que
; AI_GroundAvoidReflex_E06C avec le noeud fixe ID15 (entite+0xC9).
; ==============================================================================================
AI_StallRecoveryReflex_E159	proc far		; CODE XREF: AI_TopLevelThink+1D8P

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 12h
		mov	[bp+var_A], 0
		xor	ax, ax
		mov	[bp+var_6], ax
		mov	[bp+var_8], ax
		mov	[bp+var_E], 200h
		mov	eax, [bp+var_E]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_E1A6
		cmp	byte ptr es:[bx+27Fh], 5
		jnz	short loc_E1A6
		push	large dword ptr	es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	al, 1
		jmp	locret_E244
; ���������������������������������������������������������������������������

loc_E1A6:				; CODE XREF: AI_StallRecoveryReflex_E159+2Cj AI_StallRecoveryReflex_E159+34j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_E1B6
		mov	al, 0
		jmp	locret_E244
; ���������������������������������������������������������������������������

loc_E1B6:				; CODE XREF: AI_StallRecoveryReflex_E159+56j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 5
		jnz	short loc_E1C7
		mov	byte ptr es:[bx+27Fh], 0

loc_E1C7:				; CODE XREF: AI_StallRecoveryReflex_E159+66j
		mov	[bp+var_6], 3748h
		mov	[bp+var_12], 200h
		mov	eax, [bp+var_12]
		mov	[bp+var_4], eax
		mov	[bp+var_A], 0
		lea	ax, [bp+var_A]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0C9h]
		les	bx, es:[bx+0C9h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		or	al, al
		jz	short loc_E240
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_E218
		push	large dword ptr	es:[bx+0Dh]
		call	VROOMM_StubThunk_6AB54
		add	sp, 4

loc_E218:				; CODE XREF: AI_StallRecoveryReflex_E159+B0j
		lea	ax, [bp+var_A]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0C9h]
		les	bx, es:[bx+0C9h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+27Fh], 5
		mov	dl, 1
		jmp	short loc_E242
; ���������������������������������������������������������������������������

loc_E240:				; CODE XREF: AI_StallRecoveryReflex_E159+A5j
		mov	dl, 0

loc_E242:				; CODE XREF: AI_StallRecoveryReflex_E159+E5j
		mov	al, dl

locret_E244:				; CODE XREF: AI_StallRecoveryReflex_E159+4Aj AI_StallRecoveryReflex_E159+5Aj
		leave
		retf
AI_StallRecoveryReflex_E159	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Formation_DamageReactionHandler' (pas une simple reaction aux degats). far, 381L, LUE
; 2026-09-25. ENTREE EN COMBAT CONTRE UN ATTAQUANT, appelee par AI_TopLevelThink quand rien
; n'a reagi et +0x27F <= 1. (1) Si je viens d'etre touche (bit 7 de +0x28D) ou minuteur +0x174
; echu : Targeting_AcquireBestThreat(nouvelle cible sol 0). (2) Niveau +0x27F = 1 remis a 0.
; (3) Avec une cible aerienne +0x287 et +0x27F == 0 : a = |angle entre mon nez et le sien|, b
; = |angle entre mon nez et la direction vers lui| (Angle_DeltaNormalized_A), d = distance.
; Declenchement si touche, OU si b > 150 (cmp 9600h) ET a < 30 (cmp 1E00h) ET d < dword_7201C
; : IL EST DANS MES SIX HEURES, dans le meme sens que moi. Alors +0x27F = 1. (4a) Ailier en
; suivi (objectif 0xAA, +0x149 == 0) : si mon leader n'est pas le joueur, il faut en plus que
; la cible soit une IA qui me vise (son +0x287 = mon objet) ; puis +0x149 = 3, cible de
; mission +0x137 = +0x285 = l'attaquant, +0x160 = 0, +0x162 = horloge ; si le leader est le
; joueur : radio 0x12 ('This one's all mine.' chez Billy). (4b) Sinon, hors suivi et classe du
; modele (+0x52) >= 9 : abandon d'une navigation ID 21 en cours, combat
; (AI_BehaviorStateMachine_WeightedOptionSelector_9D05), renvoie 1. (4c) Sinon, rien en cours
; et objectif aucun / 0xA5 / 0xA4 : bloc de commandes +0x1A = 1, bit 5 de +0x28B efface,
; Goal_WanderRandom. Renvoie 1 seulement en 4b.
; ==============================================================================================
AI_EngageAttackerReaction_E246	proc far		; CODE XREF: AI_TopLevelThink+2FDP

var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
var_24		= word ptr -24h
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

		push	bp
		mov	bp, sp
		sub	sp, 3Eh
		push	si
		push	di
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Dh]
		shr	ax, 7
		and	ax, 1
		or	al, al
		jnz	short loc_E27A
		mov	ax, word ptr [bp+arg_0]
		add	ax, 174h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Timer_OneShotEvent_A2BD
		add	sp, 4
		or	al, al
		jz	short loc_E288

loc_E27A:				; CODE XREF: AI_EngageAttackerReaction_E246+1Cj
		push	0
		push	large [bp+arg_0]
		call	Targeting_AcquireBestThreat
		add	sp, 6

loc_E288:				; CODE XREF: AI_EngageAttackerReaction_E246+32j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+27Fh], 1
		jnz	short loc_E299
		mov	byte ptr es:[bx+27Fh], 0

loc_E299:				; CODE XREF: AI_EngageAttackerReaction_E246+4Bj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+287h], 0
		jnz	short loc_E2A7
		jmp	loc_E59D
; ���������������������������������������������������������������������������

loc_E2A7:				; CODE XREF: AI_EngageAttackerReaction_E246+5Cj
		cmp	byte ptr es:[bx+27Fh], 0
		jz	short loc_E2B2
		jmp	loc_E59D
; ���������������������������������������������������������������������������

loc_E2B2:				; CODE XREF: AI_EngageAttackerReaction_E246+67j
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_3E], eax
		mov	eax, [si+4]
		mov	[bp+var_3A], eax
		mov	eax, [si+8]
		mov	[bp+var_36], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+287h]
		add	si, 12h
		mov	di, es:[bx+102h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_32], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_2E], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_2A], eax
		push	word ptr es:[bx+287h]
		mov	bx, es:[bx+287h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		push	ss
		lea	ax, [bp+var_12]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		mov	eax, [bp+var_12]
		or	eax, eax
		jge	short loc_E344
		neg	eax

loc_E344:				; CODE XREF: AI_EngageAttackerReaction_E246+F9j
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_A], eax
		lea	ax, [bp+var_32]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		mov	eax, [bp+var_16]
		or	eax, eax
		jge	short loc_E371
		neg	eax

loc_E371:				; CODE XREF: AI_EngageAttackerReaction_E246+126j
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_6], eax
		push	large [bp+var_2A]
		push	large [bp+var_2E]
		push	large [bp+var_32]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], eax
		mov	[bp+var_E], eax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+28Dh]
		shr	ax, 7
		and	ax, 1
		or	al, al
		jnz	short loc_E3FC
		cmp	[bp+var_6], 9600h
		jle	short loc_E3C2
		mov	ax, 1
		jmp	short loc_E3C4
; ���������������������������������������������������������������������������

loc_E3C2:				; CODE XREF: AI_EngageAttackerReaction_E246+175j
		xor	ax, ax

loc_E3C4:				; CODE XREF: AI_EngageAttackerReaction_E246+17Aj
		or	al, al
		jnz	short loc_E3CB
		jmp	loc_E59D
; ���������������������������������������������������������������������������

loc_E3CB:				; CODE XREF: AI_EngageAttackerReaction_E246+180j
		cmp	[bp+var_A], 1E00h
		jge	short loc_E3DA
		mov	ax, 1
		jmp	short loc_E3DC
; ���������������������������������������������������������������������������

loc_E3DA:				; CODE XREF: AI_EngageAttackerReaction_E246+18Dj
		xor	ax, ax

loc_E3DC:				; CODE XREF: AI_EngageAttackerReaction_E246+192j
		or	al, al
		jnz	short loc_E3E3
		jmp	loc_E59D
; ���������������������������������������������������������������������������

loc_E3E3:				; CODE XREF: AI_EngageAttackerReaction_E246+198j
		mov	eax, [bp+var_E]
		cmp	eax, dword_7201C
		jge	short loc_E3F3
		mov	ax, 1
		jmp	short loc_E3F5
; ���������������������������������������������������������������������������

loc_E3F3:				; CODE XREF: AI_EngageAttackerReaction_E246+1A6j
		xor	ax, ax

loc_E3F5:				; CODE XREF: AI_EngageAttackerReaction_E246+1ABj
		or	al, al
		jnz	short loc_E3FC
		jmp	loc_E59D
; ���������������������������������������������������������������������������

loc_E3FC:				; CODE XREF: AI_EngageAttackerReaction_E246+16Bj
					; AI_EngageAttackerReaction_E246+1B1j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+27Fh], 1
		cmp	word ptr es:[bx+11Dh], 0AAh ; '�'
		jz	short loc_E411
		jmp	loc_E4EC
; ���������������������������������������������������������������������������

loc_E411:				; CODE XREF: AI_EngageAttackerReaction_E246+1C6j
		cmp	byte ptr es:[bx+149h], 0
		jz	short loc_E41C
		jmp	loc_E4EC
; ���������������������������������������������������������������������������

loc_E41C:				; CODE XREF: AI_EngageAttackerReaction_E246+1D1j
		mov	bx, es:[bx+287h]
		mov	ax, [bx+57h]
		mov	dx, [bx+55h]
		mov	word ptr [bp+var_22+2],	ax
		mov	word ptr [bp+var_22], dx
		cmp	word_722E6, 0
		jz	short loc_E442
		mov	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+145h]
		cmp	ax, word_722E6
		jnz	short loc_E461

loc_E442:				; CODE XREF: AI_EngageAttackerReaction_E246+1ECj
		les	bx, [bp+var_22]

loc_E445:
		cmp	byte ptr es:[bx+6], 1
		jz	short loc_E44F

loc_E44C:
		jmp	loc_E59D
; ���������������������������������������������������������������������������

loc_E44F:				; CODE XREF: AI_EngageAttackerReaction_E246+204j
		mov	ax, es:[bx+287h]

loc_E454:
		les	bx, [bp+arg_0]

loc_E457:
		cmp	ax, es:[bx+102h]
		jz	short loc_E461
		jmp	loc_E59D
; ���������������������������������������������������������������������������

loc_E461:				; CODE XREF: AI_EngageAttackerReaction_E246+1FAj
					; AI_EngageAttackerReaction_E246+216j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+149h], 3
		mov	ax, es:[bx+287h]
		mov	[bp+var_24], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 137h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+287h]
		mov	[bp+var_26], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 285h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+160h], 0
		mov	eax, es:[bx+175h]
		sar	eax, 8
		mov	es:[bx+162h], eax
		cmp	word_722E6, 0
		jnz	short loc_E4C7
		jmp	loc_E59D
; ���������������������������������������������������������������������������

loc_E4C7:				; CODE XREF: AI_EngageAttackerReaction_E246+27Cj
		mov	ax, es:[bx+145h]
		cmp	ax, word_722E6
		jz	short loc_E4D5
		jmp	loc_E59D
; ���������������������������������������������������������������������������

loc_E4D5:				; CODE XREF: AI_EngageAttackerReaction_E246+28Aj
		push	0
		push	12h
		push	word_722E6
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Radio_PlayMessage
		add	sp, 0Ah
		jmp	loc_E59D
; ���������������������������������������������������������������������������

loc_E4EC:				; CODE XREF: AI_EngageAttackerReaction_E246+1C8j
					; AI_EngageAttackerReaction_E246+1D3j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+11Dh], 0AAh ; '�'
		jz	short loc_E549
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		cmp	byte ptr es:[bx+52h], 9
		jb	short loc_E549
		mov	[bp+var_1], 1
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_E53C
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+21h], 15h
		jnz	short loc_E53C
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+0Dh]
		call	VROOMM_StubThunk_6AB54
		add	sp, 4

loc_E53C:				; CODE XREF: AI_EngageAttackerReaction_E246+2D9j
					; AI_EngageAttackerReaction_E246+2E4j
		push	0
		push	large [bp+arg_0]
		call	AI_BehaviorStateMachine_WeightedOptionSelector_9D05

loc_E547:
		jmp	short loc_E59A
; ���������������������������������������������������������������������������

loc_E549:				; CODE XREF: AI_EngageAttackerReaction_E246+2B0j
					; AI_EngageAttackerReaction_E246+2CAj
		les	bx, [bp+arg_0]

loc_E54C:
		cmp	dword ptr es:[bx+0Dh], 0
		jnz	short loc_E59D
		cmp	word ptr es:[bx+11Dh], 0FFFFh
		jz	short loc_E56E
		cmp	word ptr es:[bx+11Dh], 0A5h ; '�'
		jz	short loc_E56E
		cmp	word ptr es:[bx+11Dh], 0A4h ; '�'
		jnz	short loc_E59D

loc_E56E:				; CODE XREF: AI_EngageAttackerReaction_E246+314j
					; AI_EngageAttackerReaction_E246+31Dj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, 1
		mov	es:[bx+1Ah], al
		and	ax, 1
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+28Bh], 0DFh
		shl	al, 5
		or	es:[bx+28Bh], al
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	Goal_WanderRandom

loc_E59A:				; CODE XREF: AI_EngageAttackerReaction_E246:loc_E547j
		add	sp, 6

loc_E59D:				; CODE XREF: AI_EngageAttackerReaction_E246+5Ej AI_EngageAttackerReaction_E246+69j ...
		mov	al, [bp+var_1]

loc_E5A0:
		pop	di
		pop	si
		leave
		retf
AI_EngageAttackerReaction_E246	endp

seg007		ends
