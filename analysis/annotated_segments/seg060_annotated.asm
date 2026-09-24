seg060		segment	byte public 'CODE' use16
		assume cs:seg060
		;org 0Dh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_2BC9D:				; DATA XREF: seg339:15CCo
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,86L — calcule un seuil de probabilité pondéré par la difficulté (constante 0xB33A,
; échelle dword_72202), recherche dans une table de 8 entrées (+0x64, pas 4 octets) la
; première dont la probabilité dépasse le seuil : sélection pondérée d'un composant/type de
; panne selon un tirage de probabilité (système de dommages structurels).
; ==============================================================================================
Damage_SelectWeightedComponent	proc far		; CODE XREF: Damage_SimulationTick+69Dp

var_22		= dword	ptr -22h
var_1E		= word ptr -1Eh
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
		sub	sp, 22h
		mov	[bp+var_8], 0B33Ah
		mov	eax, [bp+arg_4]
		mov	[bp+var_C], eax
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	edx, eax
		mov	ecx, dword_72202
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		mov	[bp+var_1E], 8
		jmp	short loc_2BD48
; ���������������������������������������������������������������������������

loc_2BD08:				; CODE XREF: Damage_SelectWeightedComponent+A7j
		mov	ax, [bp+var_1E]
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		cmp	dword ptr es:[bx+64h], 0
		jz	short loc_2BD48
		mov	eax, es:[bx+64h]
		mov	[bp+var_22], eax
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jg	short loc_2BD33
		mov	ax, 1
		jmp	short loc_2BD35
; ���������������������������������������������������������������������������

loc_2BD33:				; CODE XREF: Damage_SelectWeightedComponent+88j
		xor	ax, ax

loc_2BD35:				; CODE XREF: Damage_SelectWeightedComponent+8Dj
		or	al, al
		jz	short loc_2BD3E

loc_2BD39:				; CODE XREF: Damage_SelectWeightedComponent+A2j
		mov	al, byte ptr [bp+var_1E]
		jmp	short locret_2BD4F
; ���������������������������������������������������������������������������

loc_2BD3E:				; CODE XREF: Damage_SelectWeightedComponent+93j
		mov	al, byte_6E8CE
		mov	ah, 0
		cmp	ax, [bp+var_1E]
		jge	short loc_2BD39

loc_2BD48:				; CODE XREF: Damage_SelectWeightedComponent+62j
					; Damage_SelectWeightedComponent+75j
		dec	[bp+var_1E]
		jg	short loc_2BD08
		mov	al, 0

locret_2BD4F:				; CODE XREF: Damage_SelectWeightedComponent+98j
		leave
		retf
Damage_SelectWeightedComponent	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,51L — reset du timer de vérification de panne si la difficulté a changé (+0x98 vs
; word_70466) ; sinon décrémente le timer (dword_70458) et déclenche sub_4FBC3 (+0x86) à
; expiration : minuteur de vérification périodique de panne de composant, sensible à la
; difficulté.
; ==============================================================================================
Damage_CheckTimer	proc far		; CODE XREF: seg060:0C64p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+98h]
		cmp	ax, word_70466
		jz	short loc_2BDBD
		mov	ax, word_70466

loc_2BD68:
		mov	es:[bx+98h], ax

loc_2BD6D:
		mov	eax, es:[bx+92h]
		sub	eax, dword_70458
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jg	short loc_2BDA8
		mov	ax, word ptr [bp+arg_0]
		add	ax, 86h	; '�'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Anim_UpdateFrameCycleArray_4FBC3
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+8Eh]
		mov	es:[bx+92h], eax
		mov	al, 1
		jmp	short locret_2BDBF
; ���������������������������������������������������������������������������

loc_2BDA8:				; CODE XREF: Damage_CheckTimer+30j
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		mov	es:[bx+92h], eax

loc_2BDBD:				; CODE XREF: Damage_CheckTimer+12j
		mov	al, 0

locret_2BDBF:				; CODE XREF: Damage_CheckTimer+55j
		leave
		retf
Damage_CheckTimer	endp

; ���������������������������������������������������������������������������

loc_2BDC1:				; DATA XREF: seg339:184Ao
					; seg339:off_7037Eo
		push	bp
		mov	bp, sp
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		add	ax, 2Dh	; '-'
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2BDCF:				; DATA XREF: seg339:183Eo
					; seg339:off_70372o
		push	bp
		mov	bp, sp
		mov	al, [bp+0Ah]
		and	ax, 1
		les	bx, [bp+6]
		and	byte ptr es:[bx+9Fh], 0FEh
		or	es:[bx+9Fh], al
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2BDE8:				; DATA XREF: seg339:1842o seg339:32C6o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	al, es:[bx+9Fh]
		and	ax, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2BDF8:				; DATA XREF: seg339:1846o seg339:32CAo
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	al, es:[bx+9Fh]
		shr	ax, 1
		and	ax, 1
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,26L — récupère une position via vtable[0x3C]+0x12 puis notifie l'affichage (sub_56C6A,
; offset +0x5D) : mise à jour de l'icône de dommage sur le HUD/panneau à une position 3D.
; ==============================================================================================
Damage_UpdateHudIcon	proc far		; CODE XREF: seg060:01B3p
					; AircraftComponent_ConstructAndCalibrate_96917+106P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		add	ax, 12h
		push	ax
		push	word ptr es:[bx+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5Dh	; ']'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	Damage_ComputeHelperC_56C6A
		add	sp, 8
		pop	bp
		retf
Damage_UpdateHudIcon	endp

; ���������������������������������������������������������������������������

loc_2BE3B:				; DATA XREF: seg339:185Ao
					; seg339:off_7038Eo
		push	bp
		mov	bp, sp
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr Damage_UpdateHudIcon
		add	sp, 4
		push	large dword ptr	[bp+6]
		nop
		push	cs
		call	near ptr Damage_ResetComponentFlags
		add	sp, 4
		push	large dword ptr	[bp+6]
		nop
		push	cs
		call	near ptr Damage_ResolveComponentPositions
		add	sp, 4
		pop	bp

locret_2BE62:
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,42L — parcourt un tableau de composants (12 octets/entrée, compteur +9), résout le nom
; (sub_5C832) et efface le bit 0 du flag d'état (+0x11) de chacun : réinitialisation du flag
; 'endommagé' de tous les composants d'un système.
; ==============================================================================================
Damage_ResetComponentFlags	proc far		; CODE XREF: seg060:01BFp
					; AircraftComponent_ConstructAndCalibrate_96917+746P

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	0

loc_2BE6B:
		les	bx, [bp+arg_0]

loc_2BE6E:
		mov	al, es:[bx+0Fh]
		push	ax

loc_2BE73:
		push	large dword ptr	es:[bx+0Bh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		xor	dx, dx
		jmp	short loc_2BE9A
; ���������������������������������������������������������������������������

loc_2BE8D:				; CODE XREF: Damage_ResetComponentFlags+3Ej
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+11h], 0FEh
		inc	dx
		add	word ptr [bp+var_4], 12h

loc_2BE9A:				; CODE XREF: Damage_ResetComponentFlags+28j
		les	bx, [bp+arg_0]
		cmp	es:[bx+9], dx
		jg	short loc_2BE8D
		leave
		retf
Damage_ResetComponentFlags	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — variante de sub_2BE63 effaçant 3 bits de flag (+0x11, bits 1/2/3) :
; réinitialisation complète de l'état de tous les composants (dommage/feu/défaillance).
; ==============================================================================================
Damage_ResetAllFlags	proc far		; CODE XREF: Damage_SimulationTick+93Dp
					; AircraftComponent_ConstructAndCalibrate_96917+73AP

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Fh]
		push	ax
		push	large dword ptr	es:[bx+0Bh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		xor	dx, dx
		jmp	short loc_2BEEC
; ���������������������������������������������������������������������������

loc_2BED5:				; CODE XREF: Damage_ResetAllFlags+4Ej
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+11h], 0FDh
		and	byte ptr es:[bx+11h], 0FBh
		and	byte ptr es:[bx+11h], 0F7h
		inc	dx
		add	word ptr [bp+var_4], 12h

loc_2BEEC:				; CODE XREF: Damage_ResetAllFlags+2Ej
		les	bx, [bp+arg_0]
		cmp	es:[bx+9], dx
		jg	short loc_2BED5
		leave
		retf
Damage_ResetAllFlags	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,64L — résout la position 3D (+0x28/+0x2A via un objet référencé +2) et le nom
; (sub_5C832, +0x17/+0x1B) de chaque composant, calcule sa position projetée : résolution des
; positions d'affichage des composants endommagés (diagramme de dommages du cockpit).
; ==============================================================================================
Damage_ResolveComponentPositions	proc far		; CODE XREF: seg060:01CBp
					; AircraftComponent_ConstructAndCalibrate_96917+752P

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		mov	ax, es:[bx+2Ah]
		mov	dx, es:[bx+28h]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+1Bh]
		push	ax

loc_2BF1D:
		push	large dword ptr	es:[bx+17h]

loc_2BF22:
		push	5C44h

loc_2BF25:
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		xor	si, si
		jmp	short loc_2BF60
; ���������������������������������������������������������������������������

loc_2BF37:				; CODE XREF: Damage_ResolveComponentPositions+70j
		les	bx, [bp+var_4]
		mov	ax, word ptr [bp+var_8]
		add	ax, es:[bx]
		push	word ptr [bp+var_8+2]
		push	ax
		push	es
		les	ax, [bp+var_8]
		mov	dx, es
		pop	es
		add	ax, es:[bx]
		mov	bx, ax
		mov	es, dx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 4
		inc	si
		add	word ptr [bp+var_4], 2

loc_2BF60:				; CODE XREF: Damage_ResolveComponentPositions+3Ej
		les	bx, [bp+arg_0]
		cmp	es:[bx+15h], si
		jg	short loc_2BF37
		pop	si
		leave
		retf
Damage_ResolveComponentPositions	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,1019 lignes. Lit le timer PIT haute précision (sub_27144) en tout début, utilise une
; table indexée (word_72B4C) de vecteurs 3D par composant. Candidat très fort pour la fonction
; principale de simulation de dommages structurels/défaillance de composants (calcul par tick,
; cohérent avec sub_2BCA4/sub_2BD51 qui l'entourent) — bien trop volumineuse pour une passe
; rapide, prioritaire pour une session dédiée.
; ==============================================================================================
Damage_SimulationTick	proc far		; CODE XREF: seg108:041FP
					; DATA XREF: seg339:183Ao

var_14C		= dword	ptr -14Ch
var_148		= dword	ptr -148h
var_144		= dword	ptr -144h
var_140		= dword	ptr -140h
var_13C		= dword	ptr -13Ch
var_138		= dword	ptr -138h
var_134		= dword	ptr -134h
var_130		= dword	ptr -130h
var_12C		= dword	ptr -12Ch
var_128		= dword	ptr -128h
var_124		= dword	ptr -124h
var_120		= dword	ptr -120h
var_11C		= word ptr -11Ch
var_104		= word ptr -104h
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
var_C8		= word ptr -0C8h
var_C6		= word ptr -0C6h
var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= word ptr -0B0h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= dword	ptr -96h
var_92		= word ptr -92h
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
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= word ptr -28h
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_D		= byte ptr -0Dh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14Ch

loc_2BF73:
		push	si
		push	di
		mov	si, [bp+arg_4]
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax
		mov	bx, word_72B4C
		mov	di, [bx+4]
		inc	di
		mov	eax, [di]
		mov	[bp+var_D4], eax
		mov	eax, [di+4]
		mov	[bp+var_D0], eax
		mov	eax, [di+8]
		mov	[bp+var_CC], eax
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+2], 0
		jnz	short loc_2BFBB
		push	600Ch
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_2BFBB:				; CODE XREF: Damage_SimulationTick+44j
		les	bx, [bp+arg_0]
		mov	al, es:[bx+9Fh]
		and	ax, 1
		or	al, al
		jnz	short loc_2BFCD
		jmp	loc_2C8B9
; ���������������������������������������������������������������������������

loc_2BFCD:				; CODE XREF: Damage_SimulationTick+5Cj
		and	byte ptr es:[bx+9Fh], 0FDh
		lea	ax, [bp+var_11C]
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		mov	[bp+var_12], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+8], 0
		mov	bx, es:[bx+6]
		cmp	word ptr [bx+26h], 0
		jz	short loc_2BFFD
		mov	ax, 1
		jmp	short loc_2BFFF
; ���������������������������������������������������������������������������

loc_2BFFD:				; CODE XREF: Damage_SimulationTick+8Aj
		xor	ax, ax

loc_2BFFF:				; CODE XREF: Damage_SimulationTick+8Fj
		mov	[bp+var_D], al
		cmp	[bp+var_D], 0
		jz	short loc_2C043
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_F8], eax
		mov	eax, [di+4]
		mov	[bp+var_F4], eax
		mov	eax, [di+8]

loc_2C02C:
		mov	[bp+var_F0], eax

loc_2C031:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]

loc_2C038:
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+78h]
		jmp	short loc_2C074
; ���������������������������������������������������������������������������

loc_2C043:				; CODE XREF: Damage_SimulationTick+9Aj
		les	bx, [bp+arg_0]
		mov	di, es:[bx+6]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_F8], eax
		mov	eax, [di+4]
		mov	[bp+var_F4], eax
		mov	eax, [di+8]
		mov	[bp+var_F0], eax
		push	word ptr es:[bx+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]

loc_2C074:				; CODE XREF: Damage_SimulationTick+D5j
		pop	cx
		push	ax
		lea	ax, [bp+var_11C]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		cmp	[bp+var_D], 0
		jnz	short loc_2C08C
		jmp	loc_2C111
; ���������������������������������������������������������������������������

loc_2C08C:				; CODE XREF: Damage_SimulationTick+11Bj
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		cmp	dword ptr [bx+1Ah], 0
		jge	short loc_2C111
		mov	eax, [bp+var_F8]
		sub	eax, [si+14h]
		mov	[bp+var_128], eax
		mov	eax, [bp+var_F4]
		sub	eax, [si+18h]
		mov	[bp+var_124], eax
		mov	eax, [bp+var_F0]
		sub	eax, [si+1Ch]
		mov	[bp+var_120], eax
		lea	ax, [bp+var_128]
		push	ax
		lea	ax, [bp+var_104]
		push	ax
		push	ss
		lea	ax, [bp+var_30]
		push	ax
		call	Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp+var_30]
		mov	[bp+var_2C], eax
		mov	[bp+var_34], 0
		cmp	[bp+var_2C], 0
		jge	short loc_2C0FA
		mov	[bp+var_34], 400h

loc_2C0FA:				; CODE XREF: Damage_SimulationTick+184j
		cmp	[bp+var_2C], 0
		jle	short loc_2C109
		mov	[bp+var_34], 0FFFFFC00h

loc_2C109:				; CODE XREF: Damage_SimulationTick+193j
		mov	eax, [bp+var_34]
		add	[bp+var_12], eax

loc_2C111:				; CODE XREF: Damage_SimulationTick+11Dj
					; Damage_SimulationTick+12Cj
		mov	eax, [bp+var_F8]
		sub	eax, [si+14h]
		mov	[bp+var_E0], eax
		mov	[bp+var_EC], eax
		mov	eax, [bp+var_F4]

loc_2C129:
		sub	eax, [si+18h]
		mov	[bp+var_DC], eax

loc_2C132:
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_F0]
		sub	eax, [si+1Ch]
		mov	[bp+var_D8], eax
		mov	[bp+var_E4], eax
		push	5166h
		lea	ax, [bp+var_EC]
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		mov	eax, [bp+var_E8]

loc_2C15F:
		mov	[bp+var_C], eax

loc_2C163:
		les	bx, [bp+arg_0]

loc_2C166:
		mov	di, es:[bx+6]
		add	di, 20h	; ' '

loc_2C16D:
		mov	eax, [di]
		mov	[bp+var_16], eax

loc_2C174:
		push	large [bp+var_E4]
		push	large [bp+var_E8]
		push	large [bp+var_EC]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1E], eax
		mov	[bp+var_1A], eax
		cmp	eax, [bp+var_16]
		jge	short loc_2C1B5
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		mov	al, es:[bx+84h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2C1B2
		jmp	loc_2C8DD
; ���������������������������������������������������������������������������

loc_2C1B2:				; CODE XREF: Damage_SimulationTick+241j
		jmp	loc_2C5F1
; ���������������������������������������������������������������������������

loc_2C1B5:				; CODE XREF: Damage_SimulationTick+22Fj
		mov	eax, dword_72540
		mov	[bp+var_30], eax
		shl	eax, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_2C], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_38+2],	dx
		mov	word ptr [bp+var_38], ax
		cmp	[bp+var_38], 0
		jnz	short loc_2C1ED
		jmp	loc_2C270
; ���������������������������������������������������������������������������

loc_2C1ED:				; CODE XREF: Damage_SimulationTick+27Cj
		les	bx, [bp+var_38]
		cmp	byte ptr es:[bx+11h], 1
		jnz	short loc_2C270
		mov	eax, [bp+var_2C]
		shl	eax, 1
		mov	[bp+var_2C], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_2C270
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6]
		push	ss

loc_2C21F:
		lea	ax, [bp+var_128]

loc_2C223:
		push	ax
		mov	bx, es:[bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]

loc_2C22D:
		add	sp, 6

loc_2C230:
		push	large [bp+var_120]
		push	large [bp+var_124]
		push	large [bp+var_128]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		cmp	[bp+var_40], 0
		jnz	short loc_2C25F
		mov	ax, 1
		jmp	short loc_2C261
; ���������������������������������������������������������������������������

loc_2C25F:				; CODE XREF: Damage_SimulationTick+2ECj
		xor	ax, ax

loc_2C261:				; CODE XREF: Damage_SimulationTick+2F1j
		or	al, al
		jz	short loc_2C270
		mov	eax, [bp+var_2C]
		sar	eax, 1
		mov	[bp+var_2C], eax

loc_2C270:				; CODE XREF: Damage_SimulationTick+27Ej
					; Damage_SimulationTick+289j ...
		mov	eax, [bp+var_2C]
		add	eax, [bp+var_16]
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_48]
		jle	short loc_2C28F
		mov	ax, 1
		jmp	short loc_2C291
; ���������������������������������������������������������������������������

loc_2C28F:				; CODE XREF: Damage_SimulationTick+31Cj
		xor	ax, ax

loc_2C291:				; CODE XREF: Damage_SimulationTick+321j
		or	al, al
		jnz	short loc_2C2BA
		mov	eax, dword_6E9A6
		sub	eax, [bp+var_16]
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_50]
		jge	short loc_2C2B4
		mov	ax, 1
		jmp	short loc_2C2B6
; ���������������������������������������������������������������������������

loc_2C2B4:				; CODE XREF: Damage_SimulationTick+341j
		xor	ax, ax

loc_2C2B6:				; CODE XREF: Damage_SimulationTick+346j
		or	al, al
		jz	short loc_2C2C6

loc_2C2BA:				; CODE XREF: Damage_SimulationTick+327j
					; Damage_SimulationTick:loc_2C332j	...
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+9Fh], 2
		jmp	loc_2C8DD
; ���������������������������������������������������������������������������

loc_2C2C6:				; CODE XREF: Damage_SimulationTick+34Cj
		mov	eax, [bp+var_16]
		mov	[bp+var_54], eax
		mov	di, si
		add	di, 68h	; 'h'
		mov	eax, [bp+var_54]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	di, si
		add	di, 70h	; 'p'
		mov	eax, [bp+var_C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_5C], eax
		add	[bp+var_54], eax
		mov	eax, [bp+var_E4]
		or	eax, eax
		jge	short loc_2C317
		neg	eax

loc_2C317:				; CODE XREF: Damage_SimulationTick+3A6j
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_64], eax
		cmp	eax, [bp+var_54]
		jle	short loc_2C32E
		mov	ax, 1
		jmp	short loc_2C330
; ���������������������������������������������������������������������������

loc_2C32E:				; CODE XREF: Damage_SimulationTick+3BBj
		xor	ax, ax

loc_2C330:				; CODE XREF: Damage_SimulationTick+3C0j
		or	al, al

loc_2C332:
		jnz	short loc_2C2BA
		mov	eax, [bp+var_16]
		mov	[bp+var_7C], eax
		mov	di, si
		add	di, 6Ch	; 'l'
		mov	eax, [bp+var_7C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		add	si, 74h	; 't'
		mov	eax, [bp+var_C]
		mov	edx, [si]
		imul	edx

loc_2C361:
		shrd	eax, edx, 8
		mov	[bp+var_80], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_84], eax

loc_2C373:
		add	[bp+var_7C], eax
		mov	eax, [bp+var_EC]
		or	eax, eax
		jge	short loc_2C384
		neg	eax

loc_2C384:				; CODE XREF: Damage_SimulationTick+413j
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_8C], eax
		cmp	eax, [bp+var_7C]
		jle	short loc_2C39E
		mov	ax, 1
		jmp	short loc_2C3A0
; ���������������������������������������������������������������������������

loc_2C39E:				; CODE XREF: Damage_SimulationTick+42Bj
		xor	ax, ax

loc_2C3A0:				; CODE XREF: Damage_SimulationTick+430j
		or	al, al
		jz	short loc_2C3A7
		jmp	loc_2C2BA
; ���������������������������������������������������������������������������

loc_2C3A7:				; CODE XREF: Damage_SimulationTick+436j
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_16]
		jg	short loc_2C3B4
		jmp	loc_2C598
; ���������������������������������������������������������������������������

loc_2C3B4:				; CODE XREF: Damage_SimulationTick+443j
		push	eax
		push	large [dword_72202]
		push	large [bp+var_16]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_80], eax
		mov	[bp+var_84], eax
		mov	[bp+var_7C], eax
		cmp	[bp+var_7C], 19h
		jg	short loc_2C3E2
		jmp	loc_2C2BA
; ���������������������������������������������������������������������������

loc_2C3E2:				; CODE XREF: Damage_SimulationTick+471j
		cmp	[bp+var_7C], 133h
		jle	short loc_2C3EF
		jmp	loc_2C598
; ���������������������������������������������������������������������������

loc_2C3EF:				; CODE XREF: Damage_SimulationTick+47Ej
		cmp	[bp+var_D], 0
		jz	short loc_2C3F8
		jmp	loc_2C8DD
; ���������������������������������������������������������������������������

loc_2C3F8:				; CODE XREF: Damage_SimulationTick+487j
		mov	eax, [bp+var_C]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		les	bx, [bp+arg_0]
		mov	es:[bx+23h], eax
		mov	eax, [bp+var_EC]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_90], eax
		mov	ax, word_721FE
		mov	[bp+var_92], ax
		push	large [bp+var_90]
		push	large [dword_72202]
		push	large [bp+var_8C]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_96], eax
		mov	[bp+var_9A], eax
		movsx	eax, [bp+var_92]
		shl	eax, 8
		mov	edx, [bp+var_9A]
		add	edx, eax
		mov	[bp+var_9E], edx

loc_2C464:
		mov	eax, [bp+var_9E]
		mov	[bp+var_A2], eax

loc_2C46E:
		sar	eax, 8

loc_2C472:
		mov	[bp+var_A6], eax
		cmp	[bp+var_A6], 7D00h
		jle	short loc_2C48D
		mov	[bp+var_A6], 7D00h
		jmp	short loc_2C4A3
; ���������������������������������������������������������������������������

loc_2C48D:				; CODE XREF: Damage_SimulationTick+514j
		cmp	[bp+var_A6], 0FFFF8300h
		jge	short loc_2C4A3
		mov	[bp+var_A6], 0FFFF8300h
		jmp	short $+2

loc_2C4A3:				; CODE XREF: Damage_SimulationTick+51Fj
					; Damage_SimulationTick+52Aj
		mov	ax, word ptr [bp+var_A6]
		les	bx, [bp+arg_0]
		mov	es:[bx+28h], ax
		mov	eax, [bp+var_E4]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_AE], eax
		mov	ax, word_72200
		mov	[bp+var_B0], ax
		push	large [bp+var_AE]
		push	large [dword_72206]
		push	large [bp+var_AA]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_B4], eax
		mov	[bp+var_B8], eax
		movsx	eax, [bp+var_B0]
		shl	eax, 8
		sub	eax, [bp+var_B8]
		mov	[bp+var_BC], eax
		mov	[bp+var_C0], eax
		sar	eax, 8
		mov	[bp+var_C4], eax
		cmp	[bp+var_C4], 7D00h
		jle	short loc_2C525

loc_2C51A:
		mov	[bp+var_C4], 7D00h

loc_2C523:
		jmp	short loc_2C53B
; ���������������������������������������������������������������������������

loc_2C525:				; CODE XREF: Damage_SimulationTick+5ACj
		cmp	[bp+var_C4], 0FFFF8300h

loc_2C52E:
		jge	short loc_2C53B

loc_2C530:
		mov	[bp+var_C4], 0FFFF8300h
		jmp	short $+2

loc_2C53B:				; CODE XREF: Damage_SimulationTick:loc_2C523j
					; Damage_SimulationTick:loc_2C52Ej
		mov	ax, word ptr [bp+var_C4]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Ah], ax
		les	bx, es:[bx+2]
		mov	al, es:[bx+85h]
		les	bx, [bp+arg_0]
		mov	es:[bx+27h], al
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 21h	; '!'
		mov	[bp+var_C6], ax
		mov	[bp+var_C8], dx
		mov	ax, word_724AC
		cmp	ax, word_724AA
		jge	short loc_2C58D
		mov	ax, word_724AC
		inc	word_724AC
		shl	ax, 2
		les	bx, dword_724AE
		add	bx, ax
		mov	ax, [bp+var_C6]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short $+2

loc_2C58D:				; CODE XREF: Damage_SimulationTick+602j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+8], 1
		jmp	loc_2C2BA
; ���������������������������������������������������������������������������

loc_2C598:				; CODE XREF: Damage_SimulationTick+445j
					; Damage_SimulationTick+480j
		mov	eax, dword_72540
		mov	[bp+var_68], eax
		shl	eax, 8
		sub	eax, [bp+var_16]
		mov	[bp+var_6C], eax
		mov	[bp+var_70], eax
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_70]
		jge	short loc_2C5BF
		mov	ax, 1
		jmp	short loc_2C5C1
; ���������������������������������������������������������������������������

loc_2C5BF:				; CODE XREF: Damage_SimulationTick+64Cj
		xor	ax, ax

loc_2C5C1:				; CODE XREF: Damage_SimulationTick+651j
		or	al, al
		jz	short loc_2C5F1
		mov	eax, dword_6E9A6
		add	eax, [bp+var_16]
		mov	[bp+var_74], eax
		mov	[bp+var_78], eax
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_78]
		jle	short loc_2C5E4
		mov	ax, 1
		jmp	short loc_2C5E6
; ���������������������������������������������������������������������������

loc_2C5E4:				; CODE XREF: Damage_SimulationTick+671j
		xor	ax, ax

loc_2C5E6:				; CODE XREF: Damage_SimulationTick+676j
		or	al, al
		jz	short loc_2C5F1
		mov	byte_6E680, 1
		jmp	short loc_2C5F6
; ���������������������������������������������������������������������������

loc_2C5F1:				; CODE XREF: Damage_SimulationTick:loc_2C1B2j
					; Damage_SimulationTick+657j ...
		mov	byte_6E680, 0

loc_2C5F6:				; CODE XREF: Damage_SimulationTick+683j
		mov	eax, [bp+var_C]
		sar	eax, 8
		push	eax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+2]
		push	cs
		call	near ptr Damage_SelectWeightedComponent
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	es:[bx+2Ch], al
		push	0
		mov	al, es:[bx+1Bh]
		push	ax

loc_2C61D:
		push	large dword ptr	es:[bx+17h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp+var_20], dx
		mov	[bp+var_22], ax
		les	bx, [bp+arg_0]
		mov	al, es:[bx+2Ch]
		mov	ah, 0
		shl	ax, 2
		les	bx, es:[bx+2]
		add	bx, ax
		mov	ax, es:[bx+2Eh]
		mov	dx, es:[bx+2Ch]
		mov	word ptr [bp+var_26+2],	ax
		mov	word ptr [bp+var_26], dx
		les	bx, [bp+arg_0]
		mov	al, es:[bx+2Ch]
		mov	ah, 0
		shl	ax, 1
		les	bx, es:[bx+2]
		add	bx, ax
		mov	ax, es:[bx+4Ch]
		mov	[bp+var_28], ax
		cmp	[bp+var_26], 0
		jnz	short loc_2C675

loc_2C672:
		jmp	loc_2C8C2
; ���������������������������������������������������������������������������

loc_2C675:				; CODE XREF: Damage_SimulationTick+704j
		lea	ax, [bp+var_14C]
		push	ax
		call	Damage_ComputeHelperA_5647A
		pop	cx
		cmp	[bp+var_D], 0
		jz	short loc_2C6C5
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5Dh	; ']'
		push	word ptr [bp+arg_0+2]
		push	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	bx, [bx+24h]
		push	large dword ptr	[bx+0Ah]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	bx, [bx+24h]
		les	bx, [bx+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	Damage_ComputeMainHelper_56559
		add	sp, 0Ah
		jmp	short loc_2C6DF
; ���������������������������������������������������������������������������

loc_2C6C5:				; CODE XREF: Damage_SimulationTick+718j
		lea	ax, [bp+var_E0]
		push	ax
		push	5166h
		lea	ax, [bp+var_11C]
		push	ax
		lea	ax, [bp+var_14C]
		push	ax
		call	Damage_ComputeHelperB_564CE
		add	sp, 8

loc_2C6DF:				; CODE XREF: Damage_SimulationTick+757j
		mov	eax, [bp+var_14C]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Dh], eax
		mov	eax, [bp+var_148]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	es:[bx+31h], eax
		mov	eax, [bp+var_144]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	es:[bx+35h], eax
		mov	eax, [bp+var_140]
		mov	[bp+var_38], eax

loc_2C721:
		mov	eax, [bp+var_38]
		mov	es:[bx+39h], eax
		mov	eax, [bp+var_13C]
		mov	[bp+var_3C], eax

loc_2C733:
		mov	eax, [bp+var_3C]
		mov	es:[bx+3Dh], eax
		mov	eax, [bp+var_138]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	es:[bx+41h], eax
		mov	eax, [bp+var_134]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	es:[bx+45h], eax
		mov	eax, [bp+var_130]

loc_2C765:
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	es:[bx+49h], eax
		mov	eax, [bp+var_12C]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]

loc_2C77F:
		mov	es:[bx+4Dh], eax

loc_2C784:
		mov	eax, [bp+var_128]

loc_2C789:
		mov	[bp+var_50], eax

loc_2C78D:
		mov	eax, [bp+var_50]

loc_2C791:
		mov	es:[bx+51h], eax

loc_2C796:
		mov	eax, [bp+var_124]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	es:[bx+55h], eax
		mov	eax, [bp+var_120]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	es:[bx+59h], eax
		lea	ax, [bp+var_11C]
		push	ax
		lea	ax, [bp+var_E0]
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		push	0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2]
		mov	al, es:[bx+16h]
		push	ax
		push	word ptr es:[bx+14h]
		push	word ptr es:[bx+12h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		lea	ax, [bp+var_11C]
		push	ax
		lea	ax, [bp+var_D4]
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		lea	ax, [bp+var_D4]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		xor	si, si
		jmp	loc_2C89C
; ���������������������������������������������������������������������������

loc_2C80F:				; CODE XREF: Damage_SimulationTick+935j
		les	bx, [bp+var_26]
		mov	ax, [bp+var_20]
		mov	dx, [bp+var_22]
		add	dx, es:[bx]
		mov	word ptr [bp+var_5C+2],	ax
		mov	word ptr [bp+var_5C], dx

loc_2C821:
		cmp	[bp+var_5C], 0

loc_2C826:
		jz	short loc_2C897

loc_2C828:
		lea	ax, [bp+var_E0]
		push	ax

loc_2C82D:
		lea	ax, [bp+var_14C]
		push	ax

loc_2C832:
		push	word ptr [bp+var_5C+2]
		push	dx
		les	bx, [bp+var_5C]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 8
		or	al, al
		jz	short loc_2C897
		lea	ax, [bp+var_D4]
		push	ax
		push	large [bp+var_5C]
		les	bx, [bp+var_5C]
		mov	bx, es:[bx]
		call	dword ptr [bx+20h]
		add	sp, 6
		les	bx, [bp+var_5C]
		mov	eax, [bp+var_12]

loc_2C862:
		add	es:[bx+2], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_60], eax
		mov	ax, word_724AC
		cmp	ax, word_724AA
		jge	short loc_2C897
		mov	ax, word_724AC
		inc	word_724AC
		shl	ax, 2
		les	bx, dword_724AE

loc_2C886:
		add	bx, ax
		mov	ax, word ptr [bp+var_60+2]
		mov	dx, word ptr [bp+var_60]

loc_2C88E:
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short $+2

loc_2C897:				; CODE XREF: Damage_SimulationTick:loc_2C826j
					; Damage_SimulationTick+8D8j ...
		inc	si
		add	word ptr [bp+var_26], 2

loc_2C89C:				; CODE XREF: Damage_SimulationTick+8A0j
		cmp	si, [bp+var_28]
		jge	short loc_2C8A4
		jmp	loc_2C80F
; ���������������������������������������������������������������������������

loc_2C8A4:				; CODE XREF: Damage_SimulationTick+933j
		push	large [bp+arg_0]
		push	cs
		call	near ptr Damage_ResetAllFlags
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+8], 1
		jmp	short loc_2C8C2
; ���������������������������������������������������������������������������

loc_2C8B9:				; CODE XREF: Damage_SimulationTick+5Ej
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+9Fh], 2

loc_2C8C2:				; CODE XREF: Damage_SimulationTick:loc_2C672j
					; Damage_SimulationTick+94Bj
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_8], eax
		sub	eax, [bp+var_4]
		add	dword_704EC, eax
		inc	dword_704E8

loc_2C8DD:				; CODE XREF: Damage_SimulationTick+243j
					; Damage_SimulationTick+357j ...
		pop	di
		pop	si
		leave
		retf
Damage_SimulationTick	endp

; ���������������������������������������������������������������������������

loc_2C8E1:				; DATA XREF: seg339:185Eo
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2C8E8:				; DATA XREF: seg339:1852o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+2]
		push	cs
		call	near ptr Damage_CheckTimer
		add	sp, 4
		or	al, al
		jz	short loc_2C929
		les	bx, [bp+6]
		les	bx, es:[bx+2]
		cmp	word ptr es:[bx+96h], 0
		jz	short loc_2C929
		les	bx, [bp+6]
		inc	word ptr es:[bx+9Dh]
		mov	ax, es:[bx+9Dh]
		les	bx, es:[bx+2]
		cmp	ax, es:[bx+96h]
		jl	short loc_2C929
		mov	al, 0
		jmp	short loc_2C92B
; ���������������������������������������������������������������������������

loc_2C929:				; CODE XREF: seg060:0C6Cj seg060:0C7Bj ...
		mov	al, 1

loc_2C92B:				; CODE XREF: seg060:0C97j
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2C92D:				; DATA XREF: seg339:15C8o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		push	large 0

loc_2C93D:
		call	VROOMM_StubThunk_6BB55
		add	sp, 0Ah
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		leave
		retf
seg060		ends
