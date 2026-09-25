seg008		segment	byte public 'CODE' use16
		assume cs:seg008
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Missile_PhysicsTick'. far, 638L, PARTIELLEMENT RELUE 2026-09-25 (pas un tick de
; missile). CONSTRUIT LE CONTEXTE PARTAGE lu par les scores et ticks MVRS : byte_720DF = je
; suis un avion (type 1) ; dword_720B7 = ma vitesse ; dword_720C5 = croisiere JDYN+0x84 ;
; dword_720C9 = minimale JDYN+0x82 ; dword_720CD = ma vitesse indiquee ; dword_72053/57/5B =
; cible - moi ; positions dans 3 s (Physics_ApplyForceAtPoint, 0x300) ; word_72095 = angle
; nez->cible ; dword_720AB.. = vitesse cible, dword_720BB = sa norme ; word_72097 = angle
; entre ligne de visee et vitesse cible, word_72093 = 180 - celui-ci ; dword_7209B = distance
; ; byte_720E0 = cible dans mon arriere (angle nez >= 100 et ...), byte_720E1 = je suis dans
; ses 6 heures proche (angle nez <= 60, word_72093 < 60, distance < 3 x portee).
; ==============================================================================================
MVRS_BuildCombatContext_E5A4	proc far		; CODE XREF: MVRS_SharedContextSyncAndID2Score_EC22+1Ep

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
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= word ptr -3Ch
var_38		= word ptr -38h
var_34		= word ptr -34h
var_30		= word ptr -30h
var_2C		= word ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0ECh
		push	si
		push	di
		mov	[bp+var_4], 0
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		cmp	byte ptr es:[bx+6], 1
		jnz	short loc_E5D6
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+8]
		mov	[bp+var_4], eax
		mov	byte_720DF, 1
		jmp	short loc_E5DB
; ���������������������������������������������������������������������������

loc_E5D6:				; CODE XREF: MVRS_BuildCombatContext_E5A4+1Dj
		mov	byte_720DF, 0

loc_E5DB:				; CODE XREF: MVRS_BuildCombatContext_E5A4+30j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	dword_7205F, eax
		mov	eax, [si+4]
		mov	dword_72063, eax
		mov	eax, [si+8]
		mov	dword_72067, eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		push	ss
		lea	ax, [bp+var_80]
		push	ax
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_80]
		mov	dword_7209F, eax
		mov	eax, [bp+var_7C]
		mov	dword_720A3, eax
		mov	eax, [bp+var_78]
		mov	dword_720A7, eax
		push	eax
		push	large [dword_720A3]

loc_E63F:
		push	large [dword_7209F]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax

loc_E64B:
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	dword_720B7, eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+84h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	dword_720C5, eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+82h]
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	dword_720C9, eax
		cmp	[bp+var_4], 0
		jz	short loc_E6C8
		push	large [bp+var_4]
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	AI_Sensor_IndicatedAirspeed_5861
		add	sp, 8
		mov	eax, [bp+var_1C]
		jmp	short loc_E6CC
; ���������������������������������������������������������������������������

loc_E6C8:				; CODE XREF: MVRS_BuildCombatContext_E5A4+10Bj
		mov	eax, dword_720B7

loc_E6CC:				; CODE XREF: MVRS_BuildCombatContext_E5A4+122j
		mov	dword_720CD, eax
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_E6DD
		jmp	loc_EAD7
; ���������������������������������������������������������������������������

loc_E6DD:				; CODE XREF: MVRS_BuildCombatContext_E5A4+134j
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	di, es:[bx+11h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	dword_72053, eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	dword_7205B, eax
		mov	[bp+var_24], 300h
		lea	ax, [bp+var_24]
		push	ax
		mov	bx, es:[bx+11h]
		push	word ptr [bx+51h]
		push	ss
		lea	ax, [bp+var_8C]
		push	ax
		call	Physics_ApplyForceAtPoint
		add	sp, 8
		mov	eax, [bp+var_8C]
		mov	dword_72077, eax
		mov	eax, [bp+var_88]
		mov	dword_7207B, eax
		mov	eax, [bp+var_84]
		mov	dword_7207F, eax

loc_E749:
		mov	[bp+var_28], 300h
		lea	ax, [bp+var_28]
		push	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+13h]
		push	word ptr [bx+51h]
		push	ss
		lea	ax, [bp+var_98]
		push	ax
		call	Physics_ApplyForceAtPoint
		add	sp, 8
		mov	eax, [bp+var_98]
		mov	dword_72083, eax
		mov	eax, [bp+var_94]
		mov	dword_72087, eax
		mov	eax, [bp+var_90]
		mov	dword_7208B, eax
		mov	eax, dword_72083
		sub	eax, dword_72077
		mov	dword_720D1, eax
		mov	eax, dword_72087
		sub	eax, dword_7207B
		mov	dword_720D5, eax
		mov	eax, dword_7208B
		sub	eax, dword_7207F
		mov	dword_720D9, eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	4FA3h
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	ax, [bp+var_2C+1]
		mov	word_72095, ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	5021h
		push	ss
		lea	ax, [bp+var_30]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	ax, [bp+var_30+1]
		mov	word_720DD, ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+13h]
		push	ss
		lea	ax, [bp+var_A4]
		push	ax
		mov	bx, es:[bx+13h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_A4]
		mov	dword_720AB, eax
		mov	eax, [bp+var_A0]
		mov	dword_720AF, eax
		mov	eax, [bp+var_9C]
		mov	dword_720B3, eax
		push	4FFBh
		push	4FA3h
		push	ss
		lea	ax, [bp+var_34]
		push	ax

loc_E844:
		call	Targeting_ComputeBearingElevation_55B1A

loc_E849:
		add	sp, 8
		mov	ax, [bp+var_34+1]
		mov	word_72097, ax

loc_E852:
		mov	ax, 0B4h ; '�'

loc_E855:
		sub	ax, word_72097
		mov	word_72093, ax
		mov	eax, dword_7209F
		neg	eax
		mov	[bp+var_B0], eax
		mov	eax, dword_720A3
		neg	eax
		mov	[bp+var_AC], eax
		mov	eax, dword_720A7
		neg	eax
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_B0]
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_B4], eax
		lea	ax, [bp+var_BC]
		push	ax
		push	4FA3h
		push	ss
		lea	ax, [bp+var_38]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	ax, [bp+var_38+1]
		mov	word_72099, ax
		mov	eax, dword_7205F
		mov	[bp+var_C8], eax
		mov	eax, dword_72063
		mov	[bp+var_C4], eax
		mov	eax, dword_72067
		mov	[bp+var_C0], eax
		mov	eax, dword_72053
		sub	[bp+var_C8], eax
		mov	eax, dword_72057
		sub	[bp+var_C4], eax
		mov	eax, dword_7205B
		sub	[bp+var_C0], eax
		push	4FFBh
		lea	ax, [bp+var_C8]
		push	ax
		push	ss
		lea	ax, [bp+var_48]
		push	ax
		call	Math_DotProduct3D_5505B
		add	sp, 8
		cmp	[bp+var_48], 0
		jle	short loc_E910
		mov	ax, 1
		jmp	short loc_E912
; ���������������������������������������������������������������������������

loc_E910:				; CODE XREF: MVRS_BuildCombatContext_E5A4+365j
		xor	ax, ax

loc_E912:				; CODE XREF: MVRS_BuildCombatContext_E5A4+36Aj
		or	al, al
		jz	short loc_E91D
		mov	byte_720C4, 1
		jmp	short loc_E922
; ���������������������������������������������������������������������������

loc_E91D:				; CODE XREF: MVRS_BuildCombatContext_E5A4+370j
		mov	byte_720C4, 0

loc_E922:				; CODE XREF: MVRS_BuildCombatContext_E5A4+377j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+13h]
		mov	bx, es:[bx+13h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	dword_7206B, eax

loc_E93F:
		mov	eax, [si+4]
		mov	dword_7206F, eax

loc_E947:
		mov	eax, [si+8]
		mov	dword_72073, eax
		push	4FBBh
		push	4FAFh
		push	ss
		lea	ax, [bp+var_4C]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		mov	ax, word ptr [bp+var_4C+1]
		mov	word_72091, ax
		push	large [dword_720B3]
		push	large [dword_720AF]
		push	large [dword_720AB]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		mov	dword_720BB, eax
		mov	eax, dword_720AB
		mov	[bp+var_D4], eax
		mov	eax, dword_720AF
		mov	[bp+var_D0], eax
		mov	eax, dword_720B3
		mov	[bp+var_CC], eax
		push	4FA3h
		lea	ax, [bp+var_D4]
		push	ax
		push	ss
		lea	ax, [bp+var_E0]
		push	ax
		call	Targeting_ComputeGeometryHelperB_5517F
		add	sp, 8
		mov	eax, [bp+var_E0]
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_DC]
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_D8]
		mov	[bp+var_CC], eax
		push	eax
		push	large [bp+var_D0]
		push	large [bp+var_D4]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_58], eax
		mov	[bp+var_5C], eax
		mov	[bp+var_20], eax
		push	4FA3h
		push	4FEFh
		push	ss
		lea	ax, [bp+var_EC]
		push	ax
		call	Targeting_ComputeGeometryHelperB_5517F
		add	sp, 8
		mov	eax, [bp+var_EC]
		sub	[bp+var_D4], eax
		mov	eax, [bp+var_E8]
		sub	[bp+var_D0], eax
		mov	eax, [bp+var_E4]
		sub	[bp+var_CC], eax
		push	large [bp+var_CC]
		push	large [bp+var_D0]

loc_EA3E:
		push	large [bp+var_D4]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_60], eax
		mov	[bp+var_64], eax
		mov	dword_720BF, eax
		push	4FA3h
		lea	ax, [bp+var_D4]
		push	ax
		push	ss
		lea	ax, [bp+var_68]
		push	ax
		call	Math_DotProduct3D_5505B
		add	sp, 8
		cmp	[bp+var_68], 0
		jle	short loc_EA7C
		mov	ax, 1
		jmp	short loc_EA7E
; ���������������������������������������������������������������������������

loc_EA7C:				; CODE XREF: MVRS_BuildCombatContext_E5A4+4D1j
		xor	ax, ax

loc_EA7E:				; CODE XREF: MVRS_BuildCombatContext_E5A4+4D6j
		or	al, al
		jz	short loc_EA95
		mov	eax, dword_720BF
		neg	eax
		mov	[bp+var_6C], eax
		mov	[bp+var_70], eax
		mov	dword_720BF, eax

loc_EA95:				; CODE XREF: MVRS_BuildCombatContext_E5A4+4DCj
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+13h]
		mov	bx, es:[bx+13h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_74+2],	dx
		mov	word ptr [bp+var_74], ax
		cmp	[bp+var_74], 0
		jnz	short loc_EAB5
		jmp	loc_EB70
; ���������������������������������������������������������������������������

loc_EAB5:				; CODE XREF: MVRS_BuildCombatContext_E5A4+50Cj
		push	dx
		push	ax
		les	bx, [bp+var_74]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 6
		jz	short loc_EACA
		jmp	loc_EB70
; ���������������������������������������������������������������������������

loc_EACA:				; CODE XREF: MVRS_BuildCombatContext_E5A4+521j
		les	bx, [bp+var_74]
		mov	al, es:[bx+52h]
		mov	byte_720C3, al
		jmp	loc_EB70
; ���������������������������������������������������������������������������

loc_EAD7:				; CODE XREF: MVRS_BuildCombatContext_E5A4+136j
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 15h
		mov	word ptr [bp+var_48+2],	ax
		mov	word ptr [bp+var_48], dx
		les	bx, [bp+var_48]
		mov	eax, es:[bx]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_C8], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 19h
		mov	word ptr [bp+var_50+2],	ax
		mov	word ptr [bp+var_50], dx
		les	bx, [bp+var_50]
		mov	eax, es:[bx]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_C4], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 1Dh
		mov	word ptr [bp+var_58+2],	ax
		mov	word ptr [bp+var_58], dx
		les	bx, [bp+var_58]
		mov	eax, es:[bx]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_C0], eax
		les	bx, [bp+arg_0]

loc_EB43:
		mov	si, es:[bx+11h]
		add	si, 12h
		mov	eax, [bp+var_C8]
		sub	eax, [si]

loc_EB52:
		mov	dword_72053, eax
		mov	eax, [bp+var_C4]
		sub	eax, [si+4]
		mov	dword_72057, eax
		mov	eax, [bp+var_C0]
		sub	eax, [si+8]
		mov	dword_7205B, eax

loc_EB70:				; CODE XREF: MVRS_BuildCombatContext_E5A4+50Ej
					; MVRS_BuildCombatContext_E5A4+523j ...
		push	4FA3h
		push	4FAFh
		push	ss
		lea	ax, [bp+var_3C]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		mov	ax, [bp+var_3C+1]
		mov	word_7208F, ax
		push	large [dword_7205B]
		push	large [dword_72057]
		push	large [dword_72053]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		mov	dword_7209B, eax
		mov	byte_720E0, 0
		mov	byte_720E1, 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+13h], 0
		jz	short loc_EC1E
		mov	eax, [bp+var_20]
		imul	eax, 3
		mov	[bp+var_4C], eax
		mov	[bp+var_48], eax
		mov	eax, dword_7209B
		cmp	eax, [bp+var_48]
		jge	short loc_EBE3
		mov	ax, 1
		jmp	short loc_EBE5
; ���������������������������������������������������������������������������

loc_EBE3:				; CODE XREF: MVRS_BuildCombatContext_E5A4+638j
		xor	ax, ax

loc_EBE5:				; CODE XREF: MVRS_BuildCombatContext_E5A4+63Dj
		mov	dl, al
		cmp	word_72095, 64h	; 'd'
		jl	short loc_EC07
		cmp	word_720DD, 50h	; 'P'
		jle	short loc_EC00
		cmp	word_72093, 32h	; '2'
		jge	short loc_EC07
		or	dl, dl
		jz	short loc_EC07

loc_EC00:				; CODE XREF: MVRS_BuildCombatContext_E5A4+64Fj
		mov	byte_720E0, 1
		jmp	short loc_EC1E
; ���������������������������������������������������������������������������

loc_EC07:				; CODE XREF: MVRS_BuildCombatContext_E5A4+648j
					; MVRS_BuildCombatContext_E5A4+656j ...
		cmp	word_72095, 3Ch	; '<'
		jg	short loc_EC1E
		cmp	word_72093, 3Ch	; '<'
		jge	short loc_EC1E
		or	dl, dl
		jz	short loc_EC1E
		mov	byte_720E1, 1

loc_EC1E:				; CODE XREF: MVRS_BuildCombatContext_E5A4+61Ej
					; MVRS_BuildCombatContext_E5A4+661j ...
		pop	di
		pop	si
		leave
		retf
MVRS_BuildCombatContext_E5A4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,103L — garde 'une fois par frame' (byte_72052, même flag que sub_814C) puis appelle
; sub_E5A4 ; met à jour la référence de cible (+0x13 via sub_3A44E) et sa position mémorisée
; (+0x15/0x19/0x1E) : wrapper de mise à jour par frame d'un objet projectile/missile avec
; tracking de cible. DECOUVERTE MAJEURE : cette fonction sert un DOUBLE ROLE. (1) Appelee en
; PREMIERE LIGNE par TOUTES les fonctions de score MVRS (les 8 fixes ET les 13+ extensibles) -
; synchronise le noeud depuis un parametre de CONTEXTE PARTAGE externe (arg_4, structure a 3
; champs : [+0]=identifiant/reference, [+2]=pointeur optionnel vers un vecteur 3D, [+6]=une
; valeur scalaire), copiant ces donnees dans les champs du noeud (+0x13=reference via
; SetReference, +0x15/+0x19/+0x1D=position ou zero, +0xD=scalaire). (2) Lorsqu'elle EST ELLE-
; MEME la fonction de score directement enregistree (cas de MVRS ID=0x2, tag 0x28C), elle
; retourne TOUJOURS 10 - aucune logique de score additionnelle. Le nom
; 'Missile_FrameUpdateWrapper' herite du balayage initial reste approprie au role (1).
; ==============================================================================================
MVRS_SharedContextSyncAndID2Score_EC22	proc far		; CODE XREF: seg002:000DP seg002:0148P ...

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
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	al, byte_72052
		mov	ah, 0
		or	ax, ax
		jnz	short loc_EC46
		mov	byte_72052, 1
		push	large [bp+arg_0]
		push	cs
		call	near ptr MVRS_BuildCombatContext_E5A4

loc_EC43:
		add	sp, 4

loc_EC46:				; CODE XREF: MVRS_SharedContextSyncAndID2Score_EC22+12j
		les	bx, [bp+arg_0]

loc_EC49:
		mov	byte ptr es:[bx+0Ch], 1
		mov	ax, es:[bx+13h]
		cmp	ax, [si]
		jz	short loc_EC6E
		mov	ax, [si]
		mov	[bp+var_2], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 13h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6

loc_EC6E:				; CODE XREF: MVRS_SharedContextSyncAndID2Score_EC22+32j
		cmp	word ptr [si+2], 0
		jz	short loc_ECC1
		mov	di, [si+2]
		mov	eax, [di]
		mov	[bp+var_2A], eax
		mov	eax, [di+4]
		mov	[bp+var_26], eax
		mov	eax, [di+8]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		les	bx, [bp+arg_0]
		mov	es:[bx+15h], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	es:[bx+19h], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		jmp	short loc_ECF2
; ���������������������������������������������������������������������������

loc_ECC1:				; CODE XREF: MVRS_SharedContextSyncAndID2Score_EC22+50j
		mov	[bp+var_6], 0
		mov	eax, [bp+var_6]
		les	bx, [bp+arg_0]
		mov	es:[bx+15h], eax
		mov	[bp+var_A], 0
		mov	eax, [bp+var_A]
		mov	es:[bx+19h], eax
		mov	[bp+var_E], 0
		mov	eax, [bp+var_E]

loc_ECF2:				; CODE XREF: MVRS_SharedContextSyncAndID2Score_EC22+9Dj
		les	bx, [bp+arg_0]
		mov	es:[bx+1Dh], eax
		add	si, 6
		mov	eax, [si]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Dh], eax
		mov	al, 0Ah
		pop	di
		pop	si
		leave
		retf
MVRS_SharedContextSyncAndID2Score_EC22	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 5 lignes - LUE INTEGRALEMENT. Slot [vtable+0x10] PAR DEFAUT, partage par de nombreux
; types MVRS (references depuis seg339 offsets 0x148, 0x15C, et d'autres - voir la table de
; tags/slots de AI_SYSTEM.md §3.7). VERITABLE NO-OP : 'mov ax,[bp+0xA] / pop bp / retf' -
; retourne simplement l'argument recu sans aucun effet de bord. CONFIRME que MVRS_ID7 (tag
; 0x228) n'a PAS de sequence de manoeuvre dediee (contrairement a l'hypothese initiale qui
; supposait une symetrie avec ID=6) - son minuteur, pose par MVRS_ID7_ApplySetTimer_1060A,
; n'est jamais consomme par un vrai tick, le rendant vestigial en pratique pour cet ID.
; ==============================================================================================
MVRS_SharedDefaultTickNoOp_ED16:				; DATA XREF: seg339:0148o seg339:015Co ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+0Ah]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Ex-'Missile_ProximityFuze'. far, 167L. COMMANDE DE VITESSE DES MANOEUVRES (pas une fusee de
; proximite). Sans cible : vitesse de croisiere JDYN+0x84. Avec cible : vitesse demandee
; (argument), multipliee par (3600 - d)/1800 si la distance d < 1800, divisee par 2 si
; Pilot_SkillCheck_B0 reussit et que ma vitesse <= celle de la cible.
; ==============================================================================================
AI_ManeuverSpeedCmd_ED1E	proc far		; CODE XREF: seg008:0AABp seg008:0CD9p ...

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
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_ED36
		jmp	loc_EE8B
; ���������������������������������������������������������������������������

loc_ED36:				; CODE XREF: AI_ManeuverSpeedCmd_ED1E+13j
		mov	di, es:[bx+13h]
		add	di, 12h
		mov	dx, es:[bx+11h]
		add	dx, 12h
		mov	eax, [di]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_24], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_20], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_1C], eax
		mov	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		push	ss
		lea	ax, [bp+var_30]
		push	ax
		call	Targeting_ComputeGeometryHelperB_5517F
		add	sp, 8
		mov	eax, [bp+var_30]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_1C], eax
		push	eax
		push	large [bp+var_20]
		push	large [bp+var_24]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		sar	eax, 8
		mov	[bp+var_4], eax
		mov	eax, dword_7201C
		sar	eax, 8
		cmp	eax, [bp+var_4]
		jg	short loc_EDDD
		jmp	loc_EE9A
; ���������������������������������������������������������������������������

loc_EDDD:				; CODE XREF: AI_ManeuverSpeedCmd_ED1E+BAj
		movsx	eax, si
		mov	edx, dword_7201C
		sar	edx, 8
		shl	edx, 1
		sub	edx, [bp+var_4]
		imul	eax, edx
		mov	si, ax
		movsx	eax, si
		mov	edx, dword_7201C
		sar	edx, 8
		push	edx
		cdq
		pop	ebx
		idiv	ebx
		mov	si, ax
		push	0
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+22h]
		call	Pilot_SkillCheck_B0
		add	sp, 6
		or	al, al
		jz	short loc_EE9A
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	AI_Sensor_OwnSpeed
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+13h]
		push	ss
		lea	ax, [bp+var_3C]
		push	ax
		mov	bx, es:[bx+13h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	large [bp+var_34]
		push	large [bp+var_38]
		push	large [bp+var_3C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_18]
		jg	short loc_EE81
		mov	ax, 1
		jmp	short loc_EE83
; ���������������������������������������������������������������������������

loc_EE81:				; CODE XREF: AI_ManeuverSpeedCmd_ED1E+15Cj
		xor	ax, ax

loc_EE83:				; CODE XREF: AI_ManeuverSpeedCmd_ED1E+161j
		or	al, al
		jz	short loc_EE9A
		sar	si, 1
		jmp	short loc_EE9A
; ���������������������������������������������������������������������������

loc_EE8B:				; CODE XREF: AI_ManeuverSpeedCmd_ED1E+15j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	si, [bx+84h]

loc_EE9A:				; CODE XREF: AI_ManeuverSpeedCmd_ED1E+BCj
					; AI_ManeuverSpeedCmd_ED1E+105j ...
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
AI_ManeuverSpeedCmd_ED1E	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-09-25. Application MVRS ID1 : premiere jambe = noeud ID20 (entite+0xC1) vers
; le nez tourne de +/-30 deg du cote de la cible (Vector2D_CrossSign_526F), minuteur du noeud
; 4, jambes de 1 s.
; ==============================================================================================
MVRS_ID1_ApplyReacquireTurn_EEA0:				; DATA XREF: seg339:02BCo
		push	bp
		mov	bp, sp
		sub	sp, 58h
		push	si
		push	di
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_EEC6
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_EEC6:				; CODE XREF: seg008:0916j
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		les	bx, [bp+6]
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_EEFB
		push	word ptr [bp+8]
		push	bx
		call	VROOMM_StubThunk_6AB45
		add	sp, 4
		jmp	loc_F0BF
; ���������������������������������������������������������������������������

loc_EEFB:				; CODE XREF: seg008:094Aj
		mov	dword ptr [bp-4], 1E00h
		les	bx, [bp+6]
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	di, es:[bx+11h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp-40h], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp-3Ch], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp-38h], eax
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]

loc_EF40:
		call	dword ptr [bx+3Ch]

loc_EF43:
		pop	cx

loc_EF44:
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp-4Ch], eax
		mov	eax, [si+4]
		mov	[bp-48h], eax
		mov	eax, [si+8]
		mov	[bp-44h], eax
		mov	word ptr [bp-0Eh], 0
		xor	ax, ax
		mov	[bp-0Ah], ax
		mov	[bp-0Ch], ax
		mov	dword ptr [bp-12h], 200h
		mov	eax, [bp-12h]
		mov	[bp-8],	eax
		lea	ax, [bp-40h]
		push	ax
		les	bx, [bp+6]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		call	Vector2D_CrossSign_526F
		add	sp, 4
		or	al, al
		jz	short loc_EFBD
		lea	ax, [bp-4]
		push	ax
		lea	ax, [bp-4Ch]
		push	ax
		call	Vector_RotateHeading2D_556D4
		add	sp, 4
		les	bx, [bp+6]
		mov	word ptr es:[bx+26h], 0
		jmp	short loc_EFE5
; ���������������������������������������������������������������������������

loc_EFBD:				; CODE XREF: seg008:0A00j
		mov	eax, [bp-4]
		neg	eax
		mov	[bp-16h], eax
		mov	[bp-1Ah], eax
		lea	ax, [bp-1Ah]
		push	ax
		lea	ax, [bp-4Ch]
		push	ax
		call	Vector_RotateHeading2D_556D4
		add	sp, 4
		les	bx, [bp+6]
		mov	word ptr es:[bx+26h], 1

loc_EFE5:				; CODE XREF: seg008:0A1Bj
		mov	dword ptr [bp-1Eh], 0
		mov	eax, [bp-1Eh]
		mov	[bp-44h], eax
		lea	ax, [bp-4Ch]
		mov	[bp-0Ah], ax
		mov	dword ptr [bp-22h], 100h
		mov	eax, [bp-22h]
		mov	[bp-8],	eax
		les	bx, [bp+6]
		push	word ptr es:[bx+13h]
		push	ss
		lea	ax, [bp-58h]
		push	ax
		mov	bx, es:[bx+13h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	large dword ptr	[bp-50h]
		push	large dword ptr	[bp-54h]
		push	large dword ptr	[bp-58h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-2Ah], eax
		mov	[bp-2Eh], eax
		push	word ptr [bp-2Dh]
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr AI_ManeuverSpeedCmd_ED1E

loc_F04E:
		add	sp, 6

loc_F051:
		mov	[bp-30h], ax

loc_F054:
		movsx	eax, word ptr [bp-30h]
		shl	eax, 8
		mov	[bp-26h], eax
		sar	eax, 8
		push	eax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_ThrottleCmd_HUD
		add	sp, 8
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+0C1h]
		mov	byte ptr es:[bx+0Ch], 0
		lea	ax, [bp-0Eh]
		push	ax
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		push	large dword ptr	es:[bx+0C1h]
		les	bx, es:[bx+0C1h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		mov	dword ptr [bp-34h], 400h
		mov	eax, [bp-34h]
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax
		inc	word ptr es:[bx+2]

loc_F0BF:				; CODE XREF: seg008:0958j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-09-25. Tick MVRS ID1 'virage de reacquisition par jambes' : a chaque fin de
; jambe ID20, nouvelle jambe tournee de -60 deg (le test d'alternance 'test ax,0' est toujours
; faux : toujours du meme cote), minuteur -1 par jambe. Fin quand la cible est a moins de 60
; deg du nez, sans cible, ou apres 4 jambes. Vitesse via AI_ManeuverSpeedCmd_ED1E.
; ==============================================================================================
MVRS_ID1_TickReacquireLegs_F0C3:				; DATA XREF: seg339:02C0o
		push	bp
		mov	bp, sp
		sub	sp, 58h
		push	si
		les	bx, [bp+6]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp-40h], eax
		mov	eax, [si+4]
		mov	[bp-3Ch], eax
		mov	eax, [si+8]
		mov	[bp-38h], eax
		mov	word ptr [bp-0Ah], 0
		xor	ax, ax
		mov	[bp-6],	ax
		mov	[bp-8],	ax
		mov	dword ptr [bp-0Eh], 200h
		mov	eax, [bp-0Eh]
		mov	[bp-4],	eax
		mov	dword ptr [bp-12h], 3C00h
		les	bx, [bp+6]
		cmp	word ptr es:[bx+13h], 0
		jz	short loc_F19B
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp-58h], eax
		mov	eax, [si+4]
		mov	[bp-54h], eax
		mov	eax, [si+8]
		mov	[bp-50h], eax
		mov	si, es:[bx+11h]

loc_F148:
		add	si, 12h

loc_F14B:
		mov	eax, [si]
		sub	[bp-58h], eax

loc_F152:
		mov	eax, [si+4]
		sub	[bp-54h], eax
		mov	eax, [si+8]
		sub	[bp-50h], eax
		lea	ax, [bp-58h]
		push	ax
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp-34h]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		mov	eax, [bp-34h]
		or	eax, eax
		jge	short loc_F191
		neg	eax

loc_F191:				; CODE XREF: seg008:0BECj
		mov	[bp-34h], eax
		mov	ax, [bp-33h]
		mov	[bp-14h], ax

loc_F19B:				; CODE XREF: seg008:0B84j
		mov	dword ptr [bp-18h], 100h
		les	bx, [bp+6]
		mov	eax, [bp-18h]
		sub	es:[bx+0Dh], eax
		mov	eax, es:[bx+0Dh]
		sar	eax, 8
		cmp	eax, 0
		jle	short loc_F1CB
		cmp	word ptr es:[bx+13h], 0
		jz	short loc_F1CB
		cmp	word ptr [bp-14h], 3Ch ; '<'
		jge	short loc_F1DA

loc_F1CB:				; CODE XREF: seg008:0C1Cj seg008:0C23j
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4
		jmp	loc_F2C5
; ���������������������������������������������������������������������������

loc_F1DA:				; CODE XREF: seg008:0C29j
		les	bx, [bp+6]
		inc	word ptr es:[bx+26h]
		mov	ax, es:[bx+26h]
		test	ax, 0
		jz	short loc_F1EF
		lea	ax, [bp-12h]
		jmp	short loc_F201
; ���������������������������������������������������������������������������

loc_F1EF:				; CODE XREF: seg008:0C48j
		mov	eax, [bp-12h]
		neg	eax
		mov	[bp-1Ch], eax
		mov	[bp-20h], eax
		lea	ax, [bp-20h]

loc_F201:				; CODE XREF: seg008:0C4Dj
		push	ax
		lea	ax, [bp-40h]
		push	ax
		call	Vector_RotateHeading2D_556D4
		add	sp, 4
		mov	dword ptr [bp-24h], 0
		mov	eax, [bp-24h]
		mov	[bp-38h], eax
		lea	ax, [bp-40h]
		mov	[bp-6],	ax
		mov	word ptr [bp-0Ah], 0
		mov	dword ptr [bp-28h], 100h
		mov	eax, [bp-28h]
		mov	[bp-4],	eax
		les	bx, [bp+6]
		push	word ptr es:[bx+13h]
		push	ss

loc_F241:
		lea	ax, [bp-4Ch]
		push	ax
		mov	bx, es:[bx+13h]
		mov	bx, [bx]

loc_F24B:
		call	dword ptr [bx+4Ch]

loc_F24E:
		add	sp, 6

loc_F251:
		push	large dword ptr	[bp-44h]
		push	large dword ptr	[bp-48h]
		push	large dword ptr	[bp-4Ch]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-2Ch], eax
		mov	[bp-30h], eax
		push	word ptr [bp-2Fh]
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr AI_ManeuverSpeedCmd_ED1E
		add	sp, 6
		movsx	eax, ax
		push	eax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_ThrottleCmd_HUD
		add	sp, 8
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+0C1h]
		mov	byte ptr es:[bx+0Ch], 0
		lea	ax, [bp-0Ah]
		push	ax
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		push	large dword ptr	es:[bx+0C1h]
		les	bx, es:[bx+0C1h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6

loc_F2C5:				; CODE XREF: seg008:0C37j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID3_ApplyBreakDirection_F2C8'. far - LUE INTEGRALEMENT. Fonction d'APPLICATION pour
; MVRS ID=0x3. Motif standard (reevalue le score si besoin, appelle
; Behavior_PushRunning_756A4, pose entite-lie+0x68=0xFF, incremente node+0x2), PUIS DECISION
; TACTIQUE REELLE : lit une valeur geometrique (offset lateral, echelle ±768) - si > 768 :
; node+0x2E=1 (vire a droite) ; si < -768 : node+0x2E=0 (vire a gauche) ; SINON (dans la zone
; centrale ±768) : PILE OU FACE via CRT_Rand_70D (rand()%2) pour departager ! Termine par un
; appel a [vtable+0xC] (le cinquieme slot, 'demarrer le suivi', confirme une nouvelle fois). |
; IDENTIFIANT CORRIGE 2026-09-25 : methode de l'enregistrement seg339 a 0x6D0B0 + tag (tags
; lus dans le switch de PilotProfile_ResolveNamedPropertyNode_742FC, verifies par le noeud ID
; 19 = GroundAttack_*) ; l'ancien nom portait un identifiant decale.
; ==============================================================================================
MVRS_ID2_ApplyBreakDirection_F2C8:				; DATA XREF: seg339:0294o
		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_F2ED
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_F2ED:				; CODE XREF: seg008:0D3Dj
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	ax, es:[bx+9]
		mov	dx, es:[bx+7]
		add	dx, 23h	; '#'
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	bx, [bp-4]
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		cmp	dword ptr [bp-8], 300h
		jle	short loc_F32C
		mov	ax, 1
		jmp	short loc_F32E
; ���������������������������������������������������������������������������

loc_F32C:				; CODE XREF: seg008:0D85j
		xor	ax, ax

loc_F32E:				; CODE XREF: seg008:0D8Aj
		or	al, al
		jz	short loc_F33C
		les	bx, [bp+6]
		mov	byte ptr es:[bx+2Eh], 1
		jmp	short loc_F390
; ���������������������������������������������������������������������������

loc_F33C:				; CODE XREF: seg008:0D90j
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	ax, es:[bx+9]
		mov	dx, es:[bx+7]
		add	dx, 23h	; '#'
		mov	[bp-0Ah], ax

loc_F351:
		mov	[bp-0Ch], dx
		les	bx, [bp-0Ch]
		mov	eax, es:[bx]
		mov	[bp-10h], eax
		cmp	dword ptr [bp-10h], 0FFFFFD00h
		jge	short loc_F36E
		mov	ax, 1
		jmp	short loc_F370
; ���������������������������������������������������������������������������

loc_F36E:				; CODE XREF: seg008:0DC7j
		xor	ax, ax

loc_F370:				; CODE XREF: seg008:0DCCj
		or	al, al
		jz	short loc_F37E
		les	bx, [bp+6]
		mov	byte ptr es:[bx+2Eh], 0
		jmp	short loc_F390
; ���������������������������������������������������������������������������

loc_F37E:				; CODE XREF: seg008:0DD2j
		call	CRT_Rand
		mov	bx, 2
		cwd
		idiv	bx
		les	bx, [bp+6]
		mov	es:[bx+2Eh], dl

loc_F390:				; CODE XREF: seg008:0D9Aj seg008:0DDCj
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		les	bx, [bp+6]
		inc	word ptr es:[bx+2]
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-09-25. Tick MVRS ID2 'degagement (break)' : axe dominant de (vecteur memorise
; - mon nez) ; manche a fond tire (+16) si mon vecteur haut a le meme signe sur cet axe, sinon
; pousse a moitie (-8) ; manche lateral +/-16 selon le cote choisi a l'application (manche >
; 3/16 -> 1, < -3/16 -> 0, sinon aleatoire). Jusqu'au minuteur ; vitesse via
; AI_ManeuverSpeedCmd_ED1E.
; ==============================================================================================
MVRS_ID2_TickBreak_F3B6:				; DATA XREF: seg339:0298o
		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		les	bx, [bp+6]
		mov	word ptr es:[bx+2Fh], 0
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 26h	; '&'
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	bx, [bp-4]
		mov	eax, es:[bx]
		mov	[bp-5Ch], eax
		mov	eax, es:[bx+4]
		mov	[bp-58h], eax
		mov	dword ptr [bp-54h], 0
		les	bx, [bp+6]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [bp-5Ch]
		sub	eax, [si]
		mov	[bp-50h], eax
		mov	eax, [bp-58h]
		sub	eax, [si+4]
		mov	[bp-4Ch], eax
		mov	eax, [bp-54h]
		sub	eax, [si+8]
		mov	[bp-48h], eax
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		push	word ptr es:[bx+102h]
		mov	bx, es:[bx+102h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		mov	si, ax
		mov	eax, [si]
		mov	[bp-68h], eax
		mov	eax, [si+4]
		mov	[bp-64h], eax
		mov	eax, [si+8]
		mov	[bp-60h], eax
		les	bx, [bp+6]
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax
		mov	eax, es:[bx+0Dh]
		sar	eax, 8
		cmp	eax, 0
		jl	short loc_F480
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_F48F

loc_F480:				; CODE XREF: seg008:0ED7j
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4
		jmp	loc_F6BF
; ���������������������������������������������������������������������������

loc_F48F:				; CODE XREF: seg008:0EDEj
		mov	eax, [bp-50h]
		or	eax, eax
		jge	short loc_F49B
		neg	eax

loc_F49B:				; CODE XREF: seg008:0EF6j
		mov	[bp-74h], eax
		mov	eax, [bp-4Ch]
		or	eax, eax
		jge	short loc_F4AB
		neg	eax

loc_F4AB:				; CODE XREF: seg008:0F06j
		mov	[bp-70h], eax
		mov	eax, [bp-48h]
		or	eax, eax
		jge	short loc_F4BB
		neg	eax

loc_F4BB:				; CODE XREF: seg008:0F16j
		mov	[bp-6Ch], eax
		mov	eax, [bp-74h]
		cmp	eax, [bp-70h]
		jle	short loc_F4CE
		mov	ax, 1
		jmp	short loc_F4D0
; ���������������������������������������������������������������������������

loc_F4CE:				; CODE XREF: seg008:0F27j
		xor	ax, ax

loc_F4D0:				; CODE XREF: seg008:0F2Cj
		or	al, al
		jz	short loc_F4F6
		mov	eax, [bp-74h]
		cmp	eax, [bp-6Ch]
		jle	short loc_F4E3
		mov	ax, 1
		jmp	short loc_F4E5
; ���������������������������������������������������������������������������

loc_F4E3:				; CODE XREF: seg008:0F3Cj
		xor	ax, ax

loc_F4E5:				; CODE XREF: seg008:0F41j
		or	al, al
		jz	short loc_F50B
		les	bx, [bp+6]
		mov	word ptr es:[bx+2Fh], 1
		jmp	short loc_F51F
; ���������������������������������������������������������������������������
		jmp	short loc_F50B
; ���������������������������������������������������������������������������

loc_F4F6:				; CODE XREF: seg008:0F32j
		mov	eax, [bp-6Ch]
		cmp	eax, [bp-70h]
		jle	short loc_F505
		mov	ax, 1
		jmp	short loc_F507
; ���������������������������������������������������������������������������

loc_F505:				; CODE XREF: seg008:0F5Ej
		xor	ax, ax

loc_F507:				; CODE XREF: seg008:0F63j
		or	al, al
		jz	short loc_F516

loc_F50B:				; CODE XREF: seg008:0F47j seg008:0F54j
		les	bx, [bp+6]
		mov	word ptr es:[bx+2Fh], 3
		jmp	short loc_F51F
; ���������������������������������������������������������������������������

loc_F516:				; CODE XREF: seg008:0F69j
		les	bx, [bp+6]
		mov	word ptr es:[bx+2Fh], 2

loc_F51F:				; CODE XREF: seg008:0F52j seg008:0F74j
		les	bx, [bp+6]
		cmp	word ptr es:[bx+2Fh], 1
		jnz	short loc_F566
		mov	ax, [bp-66h]
		sar	ax, 0Fh
		mov	dx, [bp-4Eh]
		sar	dx, 0Fh
		cmp	al, dl
		jnz	short loc_F566
		mov	dword ptr [bp-8], 1000h

loc_F541:
		lea	ax, [bp-8]
		push	ax

loc_F545:
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-0Ch]
		push	ax

loc_F54F:
		call	AI_ClampPitchStick_5305

loc_F554:
		add	sp, 0Ah
		mov	eax, [bp-0Ch]
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		jmp	loc_F61F
; ���������������������������������������������������������������������������

loc_F566:				; CODE XREF: seg008:0F87j seg008:0F97j
		les	bx, [bp+6]
		cmp	word ptr es:[bx+2Fh], 2
		jnz	short loc_F5AC
		mov	ax, [bp-62h]
		sar	ax, 0Fh
		mov	dx, [bp-4Ah]
		sar	dx, 0Fh
		cmp	al, dl
		jnz	short loc_F5AC
		mov	dword ptr [bp-14h], 1000h
		lea	ax, [bp-14h]
		push	ax
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-18h]
		push	ax
		call	AI_ClampPitchStick_5305
		add	sp, 0Ah
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		mov	eax, [bp-1Ch]
		jmp	short loc_F61F
; ���������������������������������������������������������������������������

loc_F5AC:				; CODE XREF: seg008:0FCEj seg008:0FDEj
		les	bx, [bp+6]
		cmp	word ptr es:[bx+2Fh], 3
		jnz	short loc_F5F2
		mov	ax, [bp-5Eh]
		sar	ax, 0Fh
		mov	dx, [bp-46h]
		sar	dx, 0Fh
		cmp	al, dl
		jnz	short loc_F5F2
		mov	dword ptr [bp-20h], 1000h
		lea	ax, [bp-20h]
		push	ax
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-24h]
		push	ax
		call	AI_ClampPitchStick_5305
		add	sp, 0Ah
		mov	eax, [bp-24h]
		mov	[bp-28h], eax
		mov	eax, [bp-28h]
		jmp	short loc_F61F
; ���������������������������������������������������������������������������

loc_F5F2:				; CODE XREF: seg008:1014j seg008:1024j
		mov	dword ptr [bp-2Ch], 0FFFFF800h
		lea	ax, [bp-2Ch]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-30h]
		push	ax
		call	AI_ClampPitchStick_5305
		add	sp, 0Ah
		mov	eax, [bp-30h]
		mov	[bp-34h], eax
		mov	eax, [bp-34h]

loc_F61F:				; CODE XREF: seg008:0FC3j seg008:100Aj ...
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+2Eh], 0
		jz	short loc_F647
		mov	dword ptr [bp-38h], 1000h

loc_F641:
		mov	eax, [bp-38h]
		jmp	short loc_F653
; ���������������������������������������������������������������������������

loc_F647:				; CODE XREF: seg008:1097j
		mov	dword ptr [bp-3Ch], 0FFFFF000h
		mov	eax, [bp-3Ch]

loc_F653:				; CODE XREF: seg008:10A5j
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	es:[bx+23h], eax
		les	bx, [bp+6]
		push	word ptr es:[bx+13h]
		push	ss
		lea	ax, [bp-80h]
		push	ax
		mov	bx, es:[bx+13h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	large dword ptr	[bp-78h]
		push	large dword ptr	[bp-7Ch]
		push	large dword ptr	[bp-80h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-40h], eax
		mov	[bp-44h], eax
		push	word ptr [bp-43h]
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr AI_ManeuverSpeedCmd_ED1E
		add	sp, 6
		movsx	eax, ax
		push	eax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_ThrottleCmd_HUD
		add	sp, 8

loc_F6BF:				; CODE XREF: seg008:0EECj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 40 lignes (31665-31704) - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (tag 0x278
; confirme = ID=3 via ancrage sequentiel - CORRIGE : le nom precedent
; 'ID3_ApplyBreakDirection' appartenait en realite a F2C8/ID=2). Motif standard : reevalue si
; node+0xC==0, pose avion+0x68=0xFF (rafraichissement), timer=0x400, incremente compteur
; node+0x2, demarre le suivi (vtable+0xC). Aucune logique de rupture directionnelle ici -
; c'est un timer generique pur.
; ==============================================================================================
MVRS_ID3_ApplyGenericTimer_F6C2:				; DATA XREF: seg339:0280o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_F6E7
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_F6E7:				; CODE XREF: seg008:1137j
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		mov	dword ptr [bp-4], 400h
		mov	eax, [bp-4]
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax
		inc	word ptr es:[bx+2]
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID3_Tick_F72B'. far, LUE 2026-09-25. Tick MVRS ID3 'manoeuvre d'energie' (phase
; node+0x27, minuteur 4 s -> phase 6). Phase 0 choix : trop lent et pas trop bas -> 2 (piqué),
; trop lent et trop bas -> 1 (jinks), pas trop lent et trop bas -> 4 (chandelle), sinon rand&3
; : 1->2, 2->4, sinon 1. 1 : jambe ID20 de 1 s a +/-32/64 deg en alternant, retour 0. 2 :
; croisiere, roulis 180 puis tire a fond jusqu'a assiette >= -30 (avance immediatement en
; pratique). 3 : si trop bas ou vitesse >= croisiere -> assiette +5 puis 0 ; sinon assiette
; -(40 TH^2/256)-5. 4 : ailes a plat, tire jusqu'a assiette <= 30. 5 : si altitude > plancher
; + 3 x deck ou trop lent -> -5 puis 0 ; sinon +(40 TH^2/256)+5. 6 : croisiere, assiette 0,
; fin.
; ==============================================================================================
MVRS_ID3_TickEnergyManeuver_F72B:				; DATA XREF: seg339:off_6D334o
		push	bp
		mov	bp, sp
		sub	sp, 88h
		push	si
		les	bx, [bp+6]
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax

loc_F73F:
		mov	eax, es:[bx+0Dh]
		sar	eax, 8
		cmp	eax, 0
		jge	short loc_F753
		mov	byte ptr es:[bx+27h], 6

loc_F753:				; CODE XREF: seg008:11ACj
		les	bx, [bp+6]
		mov	al, es:[bx+27h]
		cbw
		mov	bx, ax
		cmp	bx, 6		; switch 7 cases
		jbe	short loc_F765
		jmp	loc_FCD0	; default
; ���������������������������������������������������������������������������

loc_F765:				; CODE XREF: seg008:11C0j
		shl	bx, 1
		jmp	cs:off_FCD3[bx]	; switch jump

loc_F76C:				; DATA XREF: seg008:off_FCD3o
		les	bx, [bp+6]	; case 0x0
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TooSlow_564A
		add	sp, 4
		mov	[bp-1],	al
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TooLow_56E5
		add	sp, 4
		mov	dl, al
		cmp	byte ptr [bp-1], 0
		jz	short loc_F7AA
		mov	ah, 0
		or	ax, ax
		jnz	short loc_F7D4

loc_F79D:				; CODE XREF: seg008:121Ej seg008:1227j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+27h], 2
		jmp	loc_FCD0	; default
; ���������������������������������������������������������������������������
		jmp	short loc_F7D4
; ���������������������������������������������������������������������������

loc_F7AA:				; CODE XREF: seg008:11F5j
		or	dl, dl
		jz	short loc_F7B0
		jmp	short loc_F7C9
; ���������������������������������������������������������������������������

loc_F7B0:				; CODE XREF: seg008:120Cj
		call	CRT_Rand
		and	ax, 3
		mov	[bp-4],	ax
		cmp	ax, 1
		jz	short loc_F79D
		cmp	ax, 2
		jz	short loc_F7C9
		jmp	short loc_F7D4
; ���������������������������������������������������������������������������
		jmp	short loc_F79D
; ���������������������������������������������������������������������������

loc_F7C9:				; CODE XREF: seg008:120Ej seg008:1223j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+27h], 4
		jmp	loc_FCD0	; default
; ���������������������������������������������������������������������������

loc_F7D4:				; CODE XREF: seg008:11FBj seg008:1208j ...
		les	bx, [bp+6]
		mov	byte ptr es:[bx+27h], 1
		jmp	loc_FCD0	; default
; ���������������������������������������������������������������������������

loc_F7DF:				; CODE XREF: seg008:11C7j
					; DATA XREF: seg008:off_FCD3o
		les	bx, [bp+6]	; case 0x1
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp-88h], eax
		mov	eax, [si+4]
		mov	[bp-84h], eax
		mov	eax, [si+8]
		mov	[bp-80h], eax
		mov	dword ptr [bp-6], 0
		mov	eax, [bp-6]
		mov	[bp-80h], eax
		call	CRT_Rand
		and	ax, 20h
		add	ax, 20h	; ' '
		mov	dx, ax
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+26h], 0
		jz	short loc_F83E
		neg	dx
		mov	byte ptr es:[bx+26h], 0
		jmp	short loc_F846
; ���������������������������������������������������������������������������

loc_F83E:				; CODE XREF: seg008:1293j
		les	bx, [bp+6]

loc_F841:
		mov	byte ptr es:[bx+26h], 1

loc_F846:				; CODE XREF: seg008:129Cj
		mov	word ptr [bp-10h], 0
		xor	ax, ax

loc_F84D:
		mov	[bp-0Ch], ax
		mov	[bp-0Eh], ax

loc_F853:
		mov	dword ptr [bp-14h], 200h
		mov	eax, [bp-14h]
		mov	[bp-0Ah], eax
		mov	[bp-16h], dx
		movsx	eax, word ptr [bp-16h]
		shl	eax, 8
		mov	[bp-1Ah], eax
		lea	ax, [bp-1Ah]
		push	ax
		lea	ax, [bp-88h]
		push	ax
		call	Vector_RotateHeading2D_556D4
		add	sp, 4
		lea	ax, [bp-88h]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	dword ptr [bp-1Eh], 100h
		les	bx, [bp+6]
		mov	eax, [bp-1Eh]
		sub	es:[bx+0Dh], eax
		lea	ax, [bp-88h]
		mov	[bp-0Ch], ax
		mov	dword ptr [bp-0Ah], 100h
		les	bx, es:[bx+22h]
		les	bx, es:[bx+0C1h]
		mov	byte ptr es:[bx+0Ch], 0
		lea	ax, [bp-10h]
		push	ax
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		push	large dword ptr	es:[bx+0C1h]
		les	bx, es:[bx+0C1h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		les	bx, [bp+6]
		mov	byte ptr es:[bx+27h], 0
		jmp	loc_FCD0	; default
; ���������������������������������������������������������������������������

loc_F8EA:				; CODE XREF: seg008:11C7j
					; DATA XREF: seg008:off_FCD3o
		les	bx, [bp+6]	; case 0x2
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+84h]
		push	eax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_ThrottleCmd_HUD
		add	sp, 8
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-22h]
		push	ax
		call	AI_Sensor_NosePitch_59A5
		add	sp, 8
		cmp	dword ptr [bp-22h], 0FFFFE200h
		jl	short loc_F931
		mov	ax, 1
		jmp	short loc_F933
; ���������������������������������������������������������������������������

loc_F931:				; CODE XREF: seg008:138Aj
		xor	ax, ax

loc_F933:				; CODE XREF: seg008:138Fj
		or	al, al
		jz	short loc_F93E
		les	bx, [bp+6]
		inc	byte ptr es:[bx+27h]

loc_F93E:				; CODE XREF: seg008:1395j
		push	0Fh
		mov	dword ptr [bp-26h], 0B400h
		lea	ax, [bp-26h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_RollToAngleCmd_8104
		add	sp, 8
		or	al, al
		jnz	short loc_F963
		jmp	loc_FCD0	; default
; ���������������������������������������������������������������������������

loc_F963:				; CODE XREF: seg008:13BEj
		mov	dword ptr [bp-2Ah], 1000h
		lea	ax, [bp-2Ah]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-2Eh]
		push	ax
		call	AI_ClampPitchStick_5305
		add	sp, 0Ah
		mov	eax, [bp-2Eh]
		mov	[bp-32h], eax
		mov	eax, [bp-32h]
		jmp	loc_FB33
; ���������������������������������������������������������������������������

loc_F993:				; CODE XREF: seg008:11C7j
					; DATA XREF: seg008:off_FCD3o
		les	bx, [bp+6]	; case 0x3
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-38h]
		push	ax
		call	AI_Sensor_IndicatedAirspeed_5861
		add	sp, 8
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+84h]
		mov	[bp-3Ah], ax
		movsx	eax, word ptr [bp-3Ah]
		shl	eax, 8
		cmp	eax, [bp-38h]
		jg	short loc_F9CE
		mov	ax, 1
		jmp	short loc_F9D0
; ���������������������������������������������������������������������������

loc_F9CE:				; CODE XREF: seg008:1427j
		xor	ax, ax

loc_F9D0:				; CODE XREF: seg008:142Cj
		mov	[bp-33h], al
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TooLow_56E5
		add	sp, 4
		mov	dl, al
		or	dl, dl
		jnz	short loc_F9EF
		cmp	byte ptr [bp-33h], 0
		jz	short loc_FA1F

loc_F9EF:				; CODE XREF: seg008:1447j
		push	0Ah
		mov	dword ptr [bp-3Eh], 500h
		lea	ax, [bp-3Eh]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		or	al, al
		jnz	short loc_FA14
		jmp	loc_FC5A
; ���������������������������������������������������������������������������

loc_FA14:				; CODE XREF: seg008:146Fj seg008:163Ej
		les	bx, [bp+6]
		mov	byte ptr es:[bx+27h], 0
		jmp	loc_FC5A
; ���������������������������������������������������������������������������

loc_FA1F:				; CODE XREF: seg008:144Dj
		mov	dword ptr [bp-78h], 0FFFFD800h
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	al, es:[bx+0B0h]
		cbw
		mov	[bp-7Ah], ax
		movsx	eax, word ptr [bp-7Ah]
		mov	edx, [bp-78h]
		imul	edx, eax
		mov	[bp-78h], edx
		mov	al, es:[bx+0B0h]
		cbw
		mov	[bp-7Ch], ax

loc_FA51:
		movsx	eax, word ptr [bp-7Ch]
		imul	edx, eax
		mov	[bp-78h], edx
		mov	ebx, 10h
		mov	eax, [bp-78h]
		cdq
		idiv	ebx
		mov	[bp-78h], eax
		cdq
		idiv	ebx
		mov	[bp-78h], eax
		sub	dword ptr [bp-78h], 500h
		push	0Ah
		lea	ax, [bp-78h]
		jmp	loc_FC49
; ���������������������������������������������������������������������������
		jmp	loc_FC5A
; ���������������������������������������������������������������������������

loc_FA8D:				; CODE XREF: seg008:11C7j
					; DATA XREF: seg008:off_FCD3o
		les	bx, [bp+6]	; case 0x4

loc_FA90:
		les	bx, es:[bx+22h]

loc_FA94:
		mov	bx, es:[bx+0Bh]

loc_FA98:
		movsx	eax, word ptr [bx+84h]
		push	eax

loc_FAA0:
		les	bx, [bp+6]

loc_FAA3:
		push	large dword ptr	es:[bx+22h]
		call	AI_ThrottleCmd_HUD
		add	sp, 8
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-42h]
		push	ax
		call	AI_Sensor_NosePitch_59A5
		add	sp, 8
		cmp	dword ptr [bp-42h], 1E00h
		jg	short loc_FAD4
		mov	ax, 1
		jmp	short loc_FAD6
; ���������������������������������������������������������������������������

loc_FAD4:				; CODE XREF: seg008:152Dj
		xor	ax, ax

loc_FAD6:				; CODE XREF: seg008:1532j
		or	al, al
		jz	short loc_FAE1
		les	bx, [bp+6]
		inc	byte ptr es:[bx+27h]

loc_FAE1:				; CODE XREF: seg008:1538j
		push	0Fh
		mov	dword ptr [bp-46h], 0
		lea	ax, [bp-46h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_RollToAngleCmd_8104
		add	sp, 8
		or	al, al
		jnz	short loc_FB06
		jmp	loc_FCD0	; default
; ���������������������������������������������������������������������������

loc_FB06:				; CODE XREF: seg008:1561j
		mov	dword ptr [bp-4Ah], 1000h
		lea	ax, [bp-4Ah]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-4Eh]
		push	ax
		call	AI_ClampPitchStick_5305
		add	sp, 0Ah
		mov	eax, [bp-4Eh]
		mov	[bp-52h], eax
		mov	eax, [bp-52h]

loc_FB33:				; CODE XREF: seg008:13F0j
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax

loc_FB43:				; default
		jmp	loc_FCD0
; ���������������������������������������������������������������������������

loc_FB46:				; CODE XREF: seg008:11C7j
					; DATA XREF: seg008:off_FCD3o
		les	bx, [bp+6]	; case 0x5
		mov	ax, es:[bx+24h]
		mov	dx, es:[bx+22h]
		add	dx, 0E5h ; '�'
		mov	[bp-56h], ax
		mov	[bp-58h], dx
		les	bx, [bp-58h]
		mov	eax, es:[bx]
		mov	[bp-5Ch], eax
		imul	eax, 3
		mov	[bp-60h], eax
		mov	[bp-64h], eax
		mov	eax, dword_7203D
		add	eax, [bp-64h]
		mov	[bp-68h], eax
		mov	[bp-6Ch], eax
		les	bx, [bp+6]
		mov	bx, es:[bx+11h]
		mov	eax, [bx+1Ah]
		cmp	eax, [bp-6Ch]
		jle	short loc_FB98
		mov	ax, 1

loc_FB96:
		jmp	short loc_FB9A
; ���������������������������������������������������������������������������

loc_FB98:				; CODE XREF: seg008:15F1j
		xor	ax, ax

loc_FB9A:				; CODE XREF: seg008:loc_FB96j
		mov	[bp-53h], al

loc_FB9D:
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TooSlow_564A
		add	sp, 4
		mov	[bp-1],	al
		cmp	byte ptr [bp-53h], 0
		jnz	short loc_FBBC
		cmp	byte ptr [bp-1], 0
		jz	short loc_FBE1

loc_FBBC:				; CODE XREF: seg008:1614j
		push	0Ah
		mov	dword ptr [bp-70h], 0FFFFFB00h
		lea	ax, [bp-70h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		or	al, al
		jz	short loc_FC5A
		jmp	loc_FA14
; ���������������������������������������������������������������������������

loc_FBE1:				; CODE XREF: seg008:161Aj
		mov	dword ptr [bp-78h], 2800h
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	al, es:[bx+0B0h]
		cbw
		mov	[bp-7Ah], ax
		movsx	eax, word ptr [bp-7Ah]
		mov	edx, [bp-78h]
		imul	edx, eax
		mov	[bp-78h], edx
		mov	al, es:[bx+0B0h]
		cbw
		mov	[bp-7Ch], ax
		movsx	eax, word ptr [bp-7Ch]
		imul	edx, eax
		mov	[bp-78h], edx
		mov	ebx, 10h
		mov	eax, [bp-78h]
		cdq
		idiv	ebx
		mov	[bp-78h], eax
		cdq
		idiv	ebx
		mov	[bp-78h], eax
		add	dword ptr [bp-78h], 500h

loc_FC44:
		push	0Ah
		lea	ax, [bp-78h]

loc_FC49:				; CODE XREF: seg008:14E7j
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8

loc_FC5A:				; CODE XREF: seg008:1471j seg008:147Cj ...
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+84h]
		push	eax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_ThrottleCmd_HUD
		add	sp, 8
		jmp	short loc_FCD0	; default
; ���������������������������������������������������������������������������

loc_FC7F:				; CODE XREF: seg008:11C7j
					; DATA XREF: seg008:off_FCD3o
		les	bx, [bp+6]	; case 0x6
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+84h]
		push	eax

loc_FC92:
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]

loc_FC9A:
		call	AI_ThrottleCmd_HUD
		add	sp, 8
		push	5
		mov	dword ptr [bp-74h], 0
		lea	ax, [bp-74h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		or	al, al
		jz	short loc_FCD0	; default
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

loc_FCD0:				; CODE XREF: seg008:11C2j seg008:1205j ...
		pop	si		; default
		leave
		retf
; ���������������������������������������������������������������������������
off_FCD3	dw offset loc_F76C	; DATA XREF: seg008:11C7r
		dw offset loc_F7DF	; jump table for switch	statement
		dw offset loc_F8EA
		dw offset loc_F993
		dw offset loc_FA8D
		dw offset loc_FB46
		dw offset loc_FC7F
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 125 lignes (32272-32396) - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (tag 0x264
; confirme = ID=4 via ancrage sequentiel). Motif standard (reevalue, avion+0x68,
; compteur+0x2), PUIS calcul RICHE : resout une position via [entite+0x11->vtable+0x3C]
; (methode virtuelle), calcule un delta de position entre deux objets references
; (entite+0x13/+0x11, sous-champs +0x12), appelle Angle_DeltaNormalized_A_4F95 sur ce delta -
; SI RESULTAT > 0, pose bit0 de entite+0x32 (sinon l'efface). Resout ENSUITE une SECONDE
; position via sub_5593A et ECRIT LE RESULTAT dans node+0x26/0x2A/0x2E (position
; d'interception/anticipation). Demarre le suivi a la fin. Fonction d'application
; substantielle, pas un simple timer - calcule une VRAIE solution d'interception geometrique.
; ==============================================================================================
MVRS_ID4_ApplyInterceptSolution_FCE1:				; DATA XREF: seg339:off_6D31Co
		push	bp
		mov	bp, sp
		sub	sp, 38h
		push	si
		push	di
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_FD07
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_FD07:				; CODE XREF: seg008:1757j
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		les	bx, [bp+6]
		inc	word ptr es:[bx+2]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp-20h], eax
		mov	eax, [si+4]
		mov	[bp-1Ch], eax
		mov	eax, [si+8]
		mov	[bp-18h], eax
		les	bx, [bp+6]
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	di, es:[bx+11h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp-2Ch], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp-28h], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp-24h], eax
		mov	eax, [bp-2Ch]
		mov	[bp-38h], eax
		mov	eax, [bp-28h]
		mov	[bp-34h], eax

loc_FD97:
		mov	eax, [bp-24h]
		mov	[bp-30h], eax
		lea	ax, [bp-38h]
		push	ax
		lea	ax, [bp-20h]
		push	ax
		push	ss
		lea	ax, [bp-4]
		push	ax
		call	Angle_DeltaNormalized_A
		add	sp, 8
		cmp	dword ptr [bp-4], 0
		jle	short loc_FDC0
		mov	ax, 1
		jmp	short loc_FDC2
; ���������������������������������������������������������������������������

loc_FDC0:				; CODE XREF: seg008:1819j
		xor	ax, ax

loc_FDC2:				; CODE XREF: seg008:181Ej
		or	al, al
		jz	short loc_FDD0
		les	bx, [bp+6]
		mov	byte ptr es:[bx+32h], 1
		jmp	short loc_FDD8
; ���������������������������������������������������������������������������

loc_FDD0:				; CODE XREF: seg008:1824j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+32h], 0

loc_FDD8:				; CODE XREF: seg008:182Ej
		mov	dword ptr [bp-8], 0
		mov	eax, [bp-8]
		mov	[bp-18h], eax
		lea	ax, [bp-20h]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [bp-20h]
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		les	bx, [bp+6]
		mov	es:[bx+26h], eax
		mov	eax, [bp-1Ch]
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		mov	es:[bx+2Ah], eax
		mov	eax, [bp-18h]
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		mov	es:[bx+2Eh], eax
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-09-25. Tick MVRS ID4 'virage defensif' (declenche sur alerte de menace) :
; plein gaz (cran 10), inclinaison 90 deg (60 si trop bas) du cote memorise (signe de l'angle
; nez->cible), zone morte 30 puis 5 + tire a fond ; quand le cap a tourne de >= 90 deg ou
; minuteur ecoule : assiette +10 puis fin (fin forcee si minuteur < -2 s).
; ==============================================================================================
MVRS_ID4_TickDefensiveBreakTurn_FE39:				; DATA XREF: seg339:off_6D320o
		push	bp
		mov	bp, sp
		sub	sp, 70h
		push	si
		les	bx, [bp+6]
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 26h	; '&'
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	bx, [bp-4]
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		mov	[bp-64h], eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 2Ah	; '*'
		mov	[bp-0Ah], ax
		mov	[bp-0Ch], dx
		les	bx, [bp-0Ch]
		mov	eax, es:[bx]

loc_FE91:
		mov	[bp-10h], eax

loc_FE95:
		mov	eax, [bp-10h]

loc_FE99:
		mov	[bp-60h], eax
		mov	ax, [bp+8]

loc_FEA0:
		mov	dx, [bp+6]
		add	dx, 2Eh	; '.'

loc_FEA6:
		mov	[bp-12h], ax
		mov	[bp-14h], dx
		les	bx, [bp-14h]
		mov	eax, es:[bx]
		mov	[bp-18h], eax
		mov	eax, [bp-18h]
		mov	[bp-5Ch], eax
		les	bx, [bp+6]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp-70h], eax
		mov	eax, [si+4]
		mov	[bp-6Ch], eax
		mov	eax, [si+8]
		mov	[bp-68h], eax
		mov	dword ptr [bp-1Ch], 0
		mov	eax, [bp-1Ch]
		mov	[bp-68h], eax
		lea	ax, [bp-70h]
		push	ax
		lea	ax, [bp-64h]
		push	ax
		push	ss
		lea	ax, [bp-20h]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TooLow_56E5
		add	sp, 4
		or	al, al
		jz	short loc_FF33
		mov	dword ptr [bp-28h], 3C00h
		mov	eax, [bp-28h]
		jmp	short loc_FF3F
; ���������������������������������������������������������������������������

loc_FF33:				; CODE XREF: seg008:1983j
		mov	dword ptr [bp-2Ch], 5A00h
		mov	eax, [bp-2Ch]

loc_FF3F:				; CODE XREF: seg008:1991j
		mov	[bp-24h], eax
		les	bx, [bp+6]
		mov	eax, es:[bx+0Dh]
		sar	eax, 8
		cmp	eax, 0
		jl	short loc_FF6A
		cmp	dword ptr [bp-20h], 5A00h
		jl	short loc_FF64
		mov	ax, 1
		jmp	short loc_FF66
; ���������������������������������������������������������������������������

loc_FF64:				; CODE XREF: seg008:19BDj
		xor	ax, ax

loc_FF66:				; CODE XREF: seg008:19C2j
		or	al, al
		jz	short loc_FFBF

loc_FF6A:				; CODE XREF: seg008:19B3j
		push	0Ah
		mov	dword ptr [bp-30h], 0A00h
		lea	ax, [bp-30h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		or	al, al
		jz	short loc_FF9B
		push	large dword ptr	[bp+6]

loc_FF90:
		call	VROOMM_StubThunk_6AB45

loc_FF95:
		add	sp, 4
		jmp	loc_100B3
; ���������������������������������������������������������������������������

loc_FF9B:				; CODE XREF: seg008:19EAj
		les	bx, [bp+6]
		mov	eax, es:[bx+0Dh]
		sar	eax, 8
		cmp	eax, 0FFFFFFFEh
		jl	short loc_FFB0
		jmp	loc_100B3
; ���������������������������������������������������������������������������

loc_FFB0:				; CODE XREF: seg008:1A0Bj
		push	word ptr [bp+8]
		push	bx
		call	VROOMM_StubThunk_6AB45
		add	sp, 4
		jmp	loc_100B3
; ���������������������������������������������������������������������������

loc_FFBF:				; CODE XREF: seg008:19C8j
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+32h], 0
		jz	short loc_10028
		push	1Eh
		lea	ax, [bp-24h]
		push	ax
		push	large dword ptr	es:[bx+22h]
		call	AI_RollToAngleCmd_8104
		add	sp, 8
		or	al, al
		jnz	short loc_FFE3
		jmp	loc_100B3
; ���������������������������������������������������������������������������

loc_FFE3:				; CODE XREF: seg008:1A3Ej
		push	5
		lea	ax, [bp-24h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_RollToAngleCmd_8104
		add	sp, 8
		mov	dword ptr [bp-34h], 1000h
		lea	ax, [bp-34h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-38h]
		push	ax
		call	AI_ClampPitchStick_5305
		add	sp, 0Ah
		mov	eax, [bp-38h]
		mov	[bp-3Ch], eax
		mov	eax, [bp-3Ch]
		jmp	short loc_100A3
; ���������������������������������������������������������������������������

loc_10028:				; CODE XREF: seg008:1A27j
		push	1Eh
		mov	eax, [bp-24h]
		neg	eax
		mov	[bp-40h], eax
		mov	[bp-44h], eax
		lea	ax, [bp-44h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_RollToAngleCmd_8104
		add	sp, 8
		or	al, al
		jz	short loc_100B3
		push	5
		mov	eax, [bp-24h]
		neg	eax
		mov	[bp-48h], eax
		mov	[bp-4Ch], eax
		lea	ax, [bp-4Ch]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_RollToAngleCmd_8104
		add	sp, 8
		mov	dword ptr [bp-50h], 1000h
		lea	ax, [bp-50h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-54h]
		push	ax

loc_1008F:
		call	AI_ClampPitchStick_5305
		add	sp, 0Ah
		mov	eax, [bp-54h]
		mov	[bp-58h], eax
		mov	eax, [bp-58h]

loc_100A3:				; CODE XREF: seg008:1A86j
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax

loc_100B3:				; CODE XREF: seg008:19F8j seg008:1A0Dj ...
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID6_ApplySetTimer_100B6'. far - LUE INTEGRALEMENT. Fonction d'APPLICATION pour MVRS
; ID=0x6. Motif standard, initialise un MINUTEUR (node+0xD = 0x500 = 1280), incremente
; node+0x2, appelle [vtable+0xC]. Cette fonction EST COURTE - le vrai travail se passe dans le
; slot suivant (+0x10, voir loc_1011F ci-dessous). | IDENTIFIANT CORRIGE 2026-09-25 : methode
; de l'enregistrement seg339 a 0x6D0B0 + tag (tags lus dans le switch de
; PilotProfile_ResolveNamedPropertyNode_742FC, verifies par le noeud ID 19 = GroundAttack_*) ;
; l'ancien nom portait un identifiant decale.
; ==============================================================================================
MVRS_ID5_ApplySetTimer_100B6:				; DATA XREF: seg339:0258o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_100DB
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_100DB:				; CODE XREF: seg008:1B2Bj
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		mov	dword ptr [bp-4], 500h
		mov	eax, [bp-4]
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax
		inc	word ptr es:[bx+2]
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID5_TickSubmodeSwitch_1011F'. far, LUE 2026-09-25. Tick MVRS ID5 'montee verticale
; + retournement' (type Immelmann ; minuteur 5 s ; phases node+0x26 fixees par le score). 1 :
; au-dessus de ~dword_72034 pique a -30 sinon ->2 ; 2 : reprise de vitesse (plein gaz, -30 ou
; +5 si bas) jusqu'a vitesse >= croisiere ; 3 : ailes et nez a plat ; 4 : assiette +90 ; 5 :
; roulis pour amener la cible dans le plan de portance (AI_ComputeBearingToRef) jusqu'a cible
; dessous ou trop lent ; 6 : tire jusqu'a assiette <= 45 ; 7 : assiette vers l'elevation de la
; cible ; 8 : ailes a plat, fin. Manette croisiere.
; ==============================================================================================
MVRS_ID5_TickVerticalReversal_1011F:				; DATA XREF: seg339:025Co
		push	bp
		mov	bp, sp
		sub	sp, 76h
		push	si
		push	di
		les	bx, [bp+6]
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax
		mov	eax, es:[bx+0Dh]
		sar	eax, 1Fh
		or	al, al
		jz	short loc_1014C
		push	word ptr [bp+8]
		push	bx
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

loc_1014C:				; CODE XREF: seg008:1B9Ej
		les	bx, [bp+6]
		mov	al, es:[bx+26h]
		cbw
		dec	ax
		mov	bx, ax
		cmp	bx, 7		; switch 8 cases
		jbe	short loc_1015F
		jmp	loc_105EA	; default
; ���������������������������������������������������������������������������

loc_1015F:				; CODE XREF: seg008:1BBAj
		shl	bx, 1
		jmp	cs:off_105FA[bx] ; switch jump

loc_10166:				; DATA XREF: seg008:off_105FAo
		mov	eax, dword_72034 ; case	0x0
		add	eax, 0FFFFF63Ch
		mov	[bp-4],	eax
		shl	eax, 8
		les	bx, [bp+6]
		mov	bx, es:[bx+11h]
		cmp	eax, [bx+1Ah]
		jle	short loc_1018A
		mov	ax, 1
		jmp	short loc_1018C
; ���������������������������������������������������������������������������

loc_1018A:				; CODE XREF: seg008:1BE3j
		xor	ax, ax

loc_1018C:				; CODE XREF: seg008:1BE8j
		or	al, al
		jz	short loc_101AB

loc_10190:
		mov	dword ptr [bp-8], 0A00h
		mov	eax, [bp-8]

loc_1019C:				; CODE XREF: seg008:1C79j
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax

loc_101A4:
		inc	byte ptr es:[bx+26h]
		jmp	loc_105F6
; ���������������������������������������������������������������������������

loc_101AB:				; CODE XREF: seg008:1BEEj
		push	0Ah
		mov	dword ptr [bp-0Ch], 0FFFFE200h
		lea	ax, [bp-0Ch]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		jmp	loc_105C5
; ���������������������������������������������������������������������������

loc_101CC:				; CODE XREF: seg008:1BC1j
					; DATA XREF: seg008:off_105FAo
		les	bx, [bp+6]	; case 0x1
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	AI_Sensor_IndicatedAirspeed_5861
		add	sp, 8
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+84h]
		mov	[bp-12h], ax
		movsx	eax, word ptr [bp-12h]
		shl	eax, 8
		cmp	eax, [bp-10h]
		jg	short loc_10207
		mov	ax, 1
		jmp	short loc_10209
; ���������������������������������������������������������������������������

loc_10207:				; CODE XREF: seg008:1C60j
		xor	ax, ax

loc_10209:				; CODE XREF: seg008:1C65j
		or	al, al
		jz	short loc_1021B
		mov	dword ptr [bp-16h], 0A00h
		mov	eax, [bp-16h]
		jmp	short loc_1019C
; ���������������������������������������������������������������������������

loc_1021B:				; CODE XREF: seg008:1C6Bj
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TooLow_56E5
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_10240
		push	5
		mov	dword ptr [bp-1Ah], 0FFFFE200h
		lea	ax, [bp-1Ah]
		jmp	short loc_1024D
; ���������������������������������������������������������������������������

loc_10240:				; CODE XREF: seg008:1C8Fj
		push	2
		mov	dword ptr [bp-1Eh], 500h
		lea	ax, [bp-1Eh]

loc_1024D:				; CODE XREF: seg008:1C9Ej
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8

loc_1025E:				; CODE XREF: seg008:loc_10292j
					; seg008:1D14j	...
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+80h]
		jmp	loc_105D6
; ���������������������������������������������������������������������������

loc_10272:				; CODE XREF: seg008:1BC1j
					; DATA XREF: seg008:off_105FAo
		push	5		; case 0x2
		mov	dword ptr [bp-22h], 0
		lea	ax, [bp-22h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		or	al, al

loc_10292:
		jz	short loc_1025E
		push	5

loc_10296:
		mov	dword ptr [bp-26h], 0
		lea	ax, [bp-26h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_RollToAngleCmd_8104
		add	sp, 8
		or	al, al
		jz	short loc_1025E
		mov	dword ptr [bp-2Ah], 0A00h
		mov	eax, [bp-2Ah]
		jmp	short loc_102F7
; ���������������������������������������������������������������������������
		jmp	short loc_1025E
; ���������������������������������������������������������������������������

loc_102C6:				; CODE XREF: seg008:1BC1j
					; DATA XREF: seg008:off_105FAo
		push	0Ah		; case 0x3
		mov	dword ptr [bp-2Eh], 5A00h
		lea	ax, [bp-2Eh]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		or	al, al
		jnz	short loc_102EB
		jmp	loc_1025E
; ���������������������������������������������������������������������������

loc_102EB:				; CODE XREF: seg008:1D46j
		mov	dword ptr [bp-32h], 0A00h
		mov	eax, [bp-32h]

loc_102F7:				; CODE XREF: seg008:1D22j
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax
		inc	byte ptr es:[bx+26h]
		jmp	loc_1025E
; ���������������������������������������������������������������������������
		jmp	loc_1025E
; ���������������������������������������������������������������������������

loc_10309:				; CODE XREF: seg008:1BC1j
					; DATA XREF: seg008:off_105FAo
		les	bx, [bp+6]	; case 0x4
		cmp	word ptr es:[bx+13h], 0
		jz	short loc_10342
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	di, es:[bx+11h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	dword_72053, eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		jmp	loc_103D3
; ���������������������������������������������������������������������������

loc_10342:				; CODE XREF: seg008:1D71j
		les	bx, [bp+6]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		mov	si, ax
		mov	eax, [si]
		mov	dword_72053, eax
		mov	eax, [si+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		mov	dword_7205B, eax
		mov	dword ptr [bp-36h], 0
		mov	eax, [bp-36h]
		mov	dword_7205B, eax
		mov	eax, dword_72053
		or	eax, dword_72057
		or	eax, dword_7205B
		jnz	short loc_10394
		mov	ax, 1
		jmp	short loc_10396
; ���������������������������������������������������������������������������

loc_10394:				; CODE XREF: seg008:1DEDj
		xor	ax, ax

loc_10396:				; CODE XREF: seg008:1DF2j
		or	al, al
		jz	short loc_103D7
		les	bx, [bp+6]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	dword_72053, eax
		mov	eax, [si+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		mov	dword_7205B, eax
		mov	dword ptr [bp-3Ah], 0
		mov	eax, [bp-3Ah]

loc_103D3:				; CODE XREF: seg008:1D9Fj
		mov	dword_7205B, eax

loc_103D7:				; CODE XREF: seg008:1DF8j
		push	4FA3h
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-3Eh]
		push	ax
		call	AI_ComputeBearingToRef
		add	sp, 0Ah
		push	5
		lea	ax, [bp-3Eh]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_RollController_7E56
		add	sp, 8
		or	al, al
		jnz	short loc_1040C
		jmp	loc_105C5
; ���������������������������������������������������������������������������

loc_1040C:				; CODE XREF: seg008:1E67j
		cmp	dword_7205B, 0
		jge	short loc_10419
		mov	ax, 1
		jmp	short loc_1041B
; ���������������������������������������������������������������������������

loc_10419:				; CODE XREF: seg008:1E72j
		xor	ax, ax

loc_1041B:				; CODE XREF: seg008:1E77j
		or	al, al
		jnz	short loc_10454
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-42h]
		push	ax
		call	AI_Sensor_IndicatedAirspeed_5861
		add	sp, 8
		mov	eax, dword_72039
		mov	[bp-46h], eax
		shl	eax, 8
		cmp	eax, [bp-42h]
		jle	short loc_1044B
		mov	ax, 1
		jmp	short loc_1044D
; ���������������������������������������������������������������������������

loc_1044B:				; CODE XREF: seg008:1EA4j
		xor	ax, ax

loc_1044D:				; CODE XREF: seg008:1EA9j
		or	al, al
		jnz	short loc_10454
		jmp	loc_105C5
; ���������������������������������������������������������������������������

loc_10454:				; CODE XREF: seg008:1E7Dj seg008:1EAFj
		mov	dword ptr [bp-4Ah], 0A00h
		mov	eax, [bp-4Ah]
		jmp	loc_105B9
; ���������������������������������������������������������������������������
		jmp	loc_105C5
; ���������������������������������������������������������������������������

loc_10466:				; CODE XREF: seg008:1BC1j
					; DATA XREF: seg008:off_105FAo
		les	bx, [bp+6]	; case 0x5
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-4Eh]
		push	ax
		call	AI_Sensor_NosePitch_59A5
		add	sp, 8
		cmp	dword ptr [bp-4Eh], 2D00h
		jg	short loc_1048A
		mov	ax, 1
		jmp	short loc_1048C
; ���������������������������������������������������������������������������

loc_1048A:				; CODE XREF: seg008:1EE3j
		xor	ax, ax

loc_1048C:				; CODE XREF: seg008:1EE8j
		or	al, al
		jz	short loc_104A8
		mov	dword ptr [bp-52h], 0A00h
		mov	eax, [bp-52h]
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax
		inc	byte ptr es:[bx+26h]

loc_104A8:				; CODE XREF: seg008:1EEEj
		mov	dword ptr [bp-56h], 1000h
		lea	ax, [bp-56h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-5Ah]
		push	ax
		call	AI_ClampPitchStick_5305
		add	sp, 0Ah
		mov	eax, [bp-5Ah]
		mov	[bp-5Eh], eax
		mov	eax, [bp-5Eh]
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		jmp	loc_105C5
; ���������������������������������������������������������������������������

loc_104E8:				; CODE XREF: seg008:1BC1j
					; DATA XREF: seg008:off_105FAo
		les	bx, [bp+6]	; case 0x6
		cmp	word ptr es:[bx+13h], 0
		jz	short loc_10544
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	di, es:[bx+11h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	dword_72053, eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	dword_7205B, eax
		push	4FA3h
		push	ss
		lea	ax, [bp-62h]
		push	ax
		call	Math_ElevationAngle_552E1
		add	sp, 6
		mov	eax, [bp-62h]
		sar	eax, 8
		les	bx, [bp+6]
		mov	es:[bx+27h], eax
		jmp	short loc_10550
; ���������������������������������������������������������������������������

loc_10544:				; CODE XREF: seg008:1F50j
		les	bx, [bp+6]
		mov	dword ptr es:[bx+27h], 0

loc_10550:				; CODE XREF: seg008:1FA2j
		push	0Ah
		les	bx, [bp+6]
		mov	eax, es:[bx+27h]
		mov	[bp-66h], eax
		shl	eax, 8
		mov	[bp-6Ah], eax
		lea	ax, [bp-6Ah]
		push	ax
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		or	al, al
		jz	short loc_105C5
		mov	dword ptr [bp-6Eh], 0A00h
		mov	eax, [bp-6Eh]
		jmp	short loc_105B9
; ���������������������������������������������������������������������������
		jmp	short loc_105C5
; ���������������������������������������������������������������������������

loc_1058B:				; CODE XREF: seg008:1BC1j
					; DATA XREF: seg008:off_105FAo
		push	0Ah		; case 0x7

loc_1058D:
		mov	dword ptr [bp-72h], 0

loc_10595:
		lea	ax, [bp-72h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_RollToAngleCmd_8104
		add	sp, 8
		or	al, al
		jz	short loc_105C5
		mov	dword ptr [bp-76h], 0A00h
		mov	eax, [bp-76h]

loc_105B9:				; CODE XREF: seg008:1EC0j seg008:1FE7j
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax
		inc	byte ptr es:[bx+26h]

loc_105C5:				; CODE XREF: seg008:1C29j seg008:1E69j ...
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+84h]

loc_105D6:				; CODE XREF: seg008:1CCFj
		push	eax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_ThrottleCmd_HUD
		add	sp, 8
		jmp	short loc_105F6
; ���������������������������������������������������������������������������

loc_105EA:				; CODE XREF: seg008:1BBCj
		push	large dword ptr	[bp+6] ; default
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

loc_105F6:				; CODE XREF: seg008:1C08j seg008:2048j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
off_105FA	dw offset loc_10166	; DATA XREF: seg008:1BC1r
		dw offset loc_101CC	; jump table for switch	statement
		dw offset loc_10272
		dw offset loc_102C6
		dw offset loc_10309
		dw offset loc_10466
		dw offset loc_104E8
		dw offset loc_1058B
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 40 lignes (33193-33232) - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (tag 0x23C
; confirme = ID=6). Motif standard, timer=0x500 (different du 0x400 de ID=3/4/5/13). Aucune
; ecriture de sous-mode ici - le sous-mode a deja ete pose par le SCORE (ID=6 pose node+0x26=2
; ou 3). La fonction de suivi loc_10673 (deja tabulee) lit ce sous-mode pour executer sa
; propre sequence de phases, DISTINCTE de celle de ID=5 (timer different, sous-mode
; different).
; ==============================================================================================
MVRS_ID6_ApplySetTimer_1060A:				; DATA XREF: seg339:0244o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1062F
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_1062F:				; CODE XREF: seg008:207Fj
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		les	bx, [bp+6]
		inc	word ptr es:[bx+2]
		mov	dword ptr [bp-4], 500h
		mov	eax, [bp-4]
		mov	es:[bx+0Dh], eax
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-09-25. Tick MVRS ID6 'Split-S' (minuteur 5 s) : 1 monte a +30 jusqu'a plancher
; + 2000 ; 2 monte a +20 a la vitesse minimale jusqu'a vitesse < croisiere ; 3 a plat puis
; roulis 180 ; 4 assiette -90 ; 5 roulis pour amener la cible dans le plan de portance ; 6
; tire jusqu'a assiette >= -45 ; 7 assiette vers l'elevation de la cible (0 sans cible) ; 8
; ailes a plat, fin.
; ==============================================================================================
MVRS_ID6_TickSplitS_10673:				; DATA XREF: seg339:0248o
		push	bp
		mov	bp, sp
		sub	sp, 6Eh
		push	si
		push	di
		les	bx, [bp+6]
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax
		mov	eax, es:[bx+0Dh]
		sar	eax, 1Fh
		or	al, al
		jz	short loc_106A0
		push	word ptr [bp+8]
		push	bx
		call	VROOMM_StubThunk_6AB45

loc_1069D:
		add	sp, 4

loc_106A0:				; CODE XREF: seg008:20F2j
		les	bx, [bp+6]

loc_106A3:
		mov	al, es:[bx+26h]
		cbw

loc_106A8:
		dec	ax
		mov	bx, ax
		cmp	bx, 7		; switch 8 cases
		jbe	short loc_106B3
		jmp	loc_10AD2	; default
; ���������������������������������������������������������������������������

loc_106B3:				; CODE XREF: seg008:210Ej
		shl	bx, 1
		jmp	cs:off_10AE2[bx] ; switch jump

loc_106BA:				; DATA XREF: seg008:off_10AE2o
		mov	eax, dword_7203D ; case	0x0
		add	eax, 7D000h
		mov	[bp-4],	eax
		mov	[bp-8],	eax
		les	bx, [bp+6]
		mov	bx, es:[bx+11h]
		mov	eax, [bx+1Ah]
		cmp	eax, [bp-8]
		jle	short loc_106E2
		mov	ax, 1
		jmp	short loc_106E4
; ���������������������������������������������������������������������������

loc_106E2:				; CODE XREF: seg008:213Bj
		xor	ax, ax

loc_106E4:				; CODE XREF: seg008:2140j
		or	al, al
		jz	short loc_10703
		mov	dword ptr [bp-0Ch], 0A00h
		mov	eax, [bp-0Ch]

loc_106F4:				; CODE XREF: seg008:21D1j
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax
		inc	byte ptr es:[bx+26h]
		jmp	loc_10ADE
; ���������������������������������������������������������������������������

loc_10703:				; CODE XREF: seg008:2146j
		push	0Ah
		mov	dword ptr [bp-10h], 1E00h
		lea	ax, [bp-10h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		jmp	loc_10AAD
; ���������������������������������������������������������������������������

loc_10724:				; CODE XREF: seg008:2115j
					; DATA XREF: seg008:off_10AE2o
		les	bx, [bp+6]	; case 0x1
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-14h]
		push	ax
		call	AI_Sensor_IndicatedAirspeed_5861
		add	sp, 8
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+84h]
		mov	[bp-16h], ax
		movsx	eax, word ptr [bp-16h]
		shl	eax, 8
		cmp	eax, [bp-14h]
		jle	short loc_1075F
		mov	ax, 1
		jmp	short loc_10761
; ���������������������������������������������������������������������������

loc_1075F:				; CODE XREF: seg008:21B8j
		xor	ax, ax

loc_10761:				; CODE XREF: seg008:21BDj
		or	al, al
		jz	short loc_10773
		mov	dword ptr [bp-1Ah], 0A00h
		mov	eax, [bp-1Ah]
		jmp	short loc_106F4
; ���������������������������������������������������������������������������

loc_10773:				; CODE XREF: seg008:21C3j
		push	5
		mov	dword ptr [bp-1Eh], 1400h
		lea	ax, [bp-1Eh]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		les	bx, [bp+6]
		les	bx, es:[bx+22h]

loc_10798:
		mov	bx, es:[bx+0Bh]

loc_1079C:
		movsx	eax, word ptr [bx+82h]

loc_107A2:
		jmp	loc_10ABE
; ���������������������������������������������������������������������������

loc_107A5:				; CODE XREF: seg008:2115j
					; DATA XREF: seg008:off_10AE2o
		push	5		; case 0x2
		mov	dword ptr [bp-22h], 0
		lea	ax, [bp-22h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		or	al, al
		jnz	short loc_107CA
		jmp	loc_10AAD
; ���������������������������������������������������������������������������

loc_107CA:				; CODE XREF: seg008:2225j
		push	2
		mov	dword ptr [bp-26h], 0B400h
		lea	ax, [bp-26h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_RollToAngleCmd_8104
		add	sp, 8
		or	al, al
		jnz	short loc_107EF
		jmp	loc_10AAD
; ���������������������������������������������������������������������������

loc_107EF:				; CODE XREF: seg008:224Aj
		mov	dword ptr [bp-2Ah], 0A00h
		mov	eax, [bp-2Ah]
		jmp	loc_10AA1
; ���������������������������������������������������������������������������
		jmp	loc_10AAD
; ���������������������������������������������������������������������������

loc_10801:				; CODE XREF: seg008:2115j
					; DATA XREF: seg008:off_10AE2o
		push	0Ah		; case 0x3
		mov	dword ptr [bp-2Eh], 0FFFFA600h
		lea	ax, [bp-2Eh]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		or	al, al
		jnz	short loc_10826
		jmp	loc_10AAD
; ���������������������������������������������������������������������������

loc_10826:				; CODE XREF: seg008:2281j
		mov	dword ptr [bp-32h], 0A00h
		mov	eax, [bp-32h]
		jmp	loc_10AA1
; ���������������������������������������������������������������������������
		jmp	loc_10AAD
; ���������������������������������������������������������������������������

loc_10838:				; CODE XREF: seg008:2115j
					; DATA XREF: seg008:off_10AE2o
		les	bx, [bp+6]	; case 0x4
		cmp	word ptr es:[bx+13h], 0
		jz	short loc_10871
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	di, es:[bx+11h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	dword_72053, eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		jmp	loc_10902
; ���������������������������������������������������������������������������

loc_10871:				; CODE XREF: seg008:22A0j
		les	bx, [bp+6]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		mov	si, ax
		mov	eax, [si]
		mov	dword_72053, eax
		mov	eax, [si+4]

loc_10892:
		mov	dword_72057, eax
		mov	eax, [si+8]

loc_1089A:
		mov	dword_7205B, eax

loc_1089E:
		mov	dword ptr [bp-36h], 0
		mov	eax, [bp-36h]
		mov	dword_7205B, eax
		mov	eax, dword_72053
		or	eax, dword_72057
		or	eax, dword_7205B
		jnz	short loc_108C3
		mov	ax, 1
		jmp	short loc_108C5
; ���������������������������������������������������������������������������

loc_108C3:				; CODE XREF: seg008:231Cj
		xor	ax, ax

loc_108C5:				; CODE XREF: seg008:2321j
		or	al, al
		jz	short loc_10906
		les	bx, [bp+6]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	dword_72053, eax
		mov	eax, [si+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		mov	dword_7205B, eax
		mov	dword ptr [bp-3Ah], 0
		mov	eax, [bp-3Ah]

loc_10902:				; CODE XREF: seg008:22CEj
		mov	dword_7205B, eax

loc_10906:				; CODE XREF: seg008:2327j
		push	4FA3h
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-3Eh]
		push	ax
		call	AI_ComputeBearingToRef
		add	sp, 0Ah
		push	5
		lea	ax, [bp-3Eh]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_RollController_7E56
		add	sp, 8
		or	al, al
		jnz	short loc_1093B
		jmp	loc_10AAD
; ���������������������������������������������������������������������������

loc_1093B:				; CODE XREF: seg008:2396j
		mov	dword ptr [bp-42h], 0A00h
		mov	eax, [bp-42h]
		jmp	loc_10AA1
; ���������������������������������������������������������������������������
		jmp	loc_10AAD
; ���������������������������������������������������������������������������

loc_1094D:				; CODE XREF: seg008:2115j
					; DATA XREF: seg008:off_10AE2o
		les	bx, [bp+6]	; case 0x5
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-46h]
		push	ax
		call	AI_Sensor_NosePitch_59A5
		add	sp, 8
		cmp	dword ptr [bp-46h], 0FFFFD300h
		jl	short loc_10971
		mov	ax, 1
		jmp	short loc_10973
; ���������������������������������������������������������������������������

loc_10971:				; CODE XREF: seg008:23CAj
		xor	ax, ax

loc_10973:				; CODE XREF: seg008:23CFj
		or	al, al
		jz	short loc_1098F
		mov	dword ptr [bp-4Ah], 0A00h
		mov	eax, [bp-4Ah]
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax
		inc	byte ptr es:[bx+26h]

loc_1098F:				; CODE XREF: seg008:23D5j
		mov	dword ptr [bp-4Eh], 1000h
		lea	ax, [bp-4Eh]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]

loc_109A3:
		push	ss
		lea	ax, [bp-52h]
		push	ax
		call	AI_ClampPitchStick_5305
		add	sp, 0Ah
		mov	eax, [bp-52h]
		mov	[bp-56h], eax
		mov	eax, [bp-56h]
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		jmp	loc_10AAD
; ���������������������������������������������������������������������������

loc_109CF:				; CODE XREF: seg008:2115j
					; DATA XREF: seg008:off_10AE2o
		les	bx, [bp+6]	; case 0x6
		cmp	word ptr es:[bx+13h], 0
		jz	short loc_10A41
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	di, es:[bx+11h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	dword_72053, eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	dword_7205B, eax
		push	4FA3h
		push	ss
		lea	ax, [bp-6Ah]
		push	ax
		call	Math_ElevationAngle_552E1
		add	sp, 6
		push	0Ah
		lea	ax, [bp-6Ah]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		or	al, al
		jz	short loc_10AAD
		mov	dword ptr [bp-6Eh], 0A00h
		mov	eax, [bp-6Eh]
		jmp	short loc_10AA1
; ���������������������������������������������������������������������������

loc_10A41:				; CODE XREF: seg008:2437j
		push	0Ah
		mov	dword ptr [bp-5Ah], 0
		lea	ax, [bp-5Ah]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		or	al, al
		jz	short loc_10AAD
		mov	dword ptr [bp-5Eh], 0A00h
		mov	eax, [bp-5Eh]
		jmp	short loc_10AA1
; ���������������������������������������������������������������������������
		jmp	short loc_10AAD
; ���������������������������������������������������������������������������

loc_10A73:				; CODE XREF: seg008:2115j
					; DATA XREF: seg008:off_10AE2o
		push	0Ah		; case 0x7
		mov	dword ptr [bp-62h], 0
		lea	ax, [bp-62h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_RollToAngleCmd_8104
		add	sp, 8
		or	al, al
		jz	short loc_10AAD
		mov	dword ptr [bp-66h], 0A00h
		mov	eax, [bp-66h]

loc_10AA1:				; CODE XREF: seg008:225Bj seg008:2292j ...
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax
		inc	byte ptr es:[bx+26h]

loc_10AAD:				; CODE XREF: seg008:2181j seg008:2227j ...
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+84h]

loc_10ABE:				; CODE XREF: seg008:loc_107A2j
		push	eax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_ThrottleCmd_HUD
		add	sp, 8
		jmp	short loc_10ADE
; ���������������������������������������������������������������������������

loc_10AD2:				; CODE XREF: seg008:2110j
		push	large dword ptr	[bp+6] ; default
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

loc_10ADE:				; CODE XREF: seg008:2160j seg008:2530j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
off_10AE2	dw offset loc_106BA	; DATA XREF: seg008:2115r
		dw offset loc_10724	; jump table for switch	statement
		dw offset loc_107A5
		dw offset loc_10801
		dw offset loc_10838
		dw offset loc_1094D
		dw offset loc_109CF
		dw offset loc_10A73
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 93 lignes (33700-33792) - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (tag 0x228
; confirme = ID=7, coherent avec le score deja documente qui pose les memes bits). Motif
; standard, PUIS efface node+0x2E=0, LIT entite+0x32 bit0 (pose par le SCORE de ID=7) : si
; actif, timer=0x100, sinon timer=0x200. SI bits1 ET bit3 tous deux inactifs : appelle
; sub_56E5 (capteur cache) - si echoue AUSSI, timer=0x400 a la place (troisieme option).
; Efface bits2/4 de entite+0x32 a la fin. Chaine complete et coherente avec le score de ID=7.
; ==============================================================================================
MVRS_ID7_ApplyFuelGatedTimer_10AF2:				; DATA XREF: seg339:0230o
		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_10B17
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_10B17:				; CODE XREF: seg008:2567j
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		les	bx, [bp+6]
		mov	al, es:[bx+32h]
		and	ax, 1
		or	al, al
		jz	short loc_10B4F
		mov	dword ptr [bp-4], 100h
		mov	eax, [bp-4]
		jmp	short loc_10B5B
; ���������������������������������������������������������������������������

loc_10B4F:				; CODE XREF: seg008:259Fj
		mov	dword ptr [bp-8], 200h
		mov	eax, [bp-8]

loc_10B5B:				; CODE XREF: seg008:25ADj
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax
		mov	dword ptr [bp-0Ch], 0
		mov	eax, [bp-0Ch]
		les	bx, [bp+6]
		mov	es:[bx+2Eh], eax
		mov	al, es:[bx+32h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jnz	short loc_10B92
		mov	al, es:[bx+32h]
		shr	ax, 3
		and	ax, 1
		or	al, al

loc_10B90:
		jz	short loc_10BBC

loc_10B92:				; CODE XREF: seg008:25E2j
		les	bx, [bp+6]

loc_10B95:
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TooLow_56E5

loc_10B9F:
		add	sp, 4
		mov	ah, 0

loc_10BA4:
		or	ax, ax
		jnz	short loc_10BBC
		mov	dword ptr [bp-10h], 400h
		mov	eax, [bp-10h]
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax

loc_10BBC:				; CODE XREF: seg008:loc_10B90j
					; seg008:2606j
		les	bx, [bp+6]
		and	byte ptr es:[bx+32h], 0FBh
		and	byte ptr es:[bx+32h], 0EFh
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-09-25. Tick MVRS ID7 'poursuite' (bits de node+0x32). Sans cible : fin. Mode
; bit2 (ou bit1 et aspect >= 80) : guidage vers le point decale memorise (montee 45 deg si pas
; trop lent), vitesse dword_72039. Mode bit4 : vers le point d'anticipation memorise ;
; AI_InterceptDispatcher si cible a moins de 45 deg du nez. Sinon : si
; AI_VisibilityTest(cible) -> retour ; bit3 : si distance <= 2|Vt|^2/9 -> minuteur 4, bit4,
; point = position cible + vitesse x 4 s (Physics_ApplyForceAtPoint) ; sinon interception ;
; sinon si nez <= 60 et word_72093 < 60 -> bit3 ; AI_InterceptDispatcher, fin s'il renvoie non
; nul.
; ==============================================================================================
MVRS_ID7_TickPursuit_10BD9:				; DATA XREF: seg339:0234o
		push	bp
		mov	bp, sp
		sub	sp, 74h
		push	si
		push	di
		les	bx, [bp+6]
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_10BEE
		jmp	loc_1114D
; ���������������������������������������������������������������������������

loc_10BEE:				; CODE XREF: seg008:2649j
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax
		mov	eax, es:[bx+0Dh]
		sar	eax, 1Fh
		or	al, al
		jz	short loc_10C10
		push	word ptr [bp+8]
		push	bx
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

loc_10C10:				; CODE XREF: seg008:2662j
		les	bx, [bp+6]
		mov	al, es:[bx+32h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_10C96
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	di, es:[bx+11h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	dword_72053, eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	dword_7205B, eax
		push	word ptr es:[bx+13h]
		push	ss
		lea	ax, [bp-50h]
		push	ax
		mov	bx, es:[bx+13h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp-50h]
		mov	dword_720AB, eax
		mov	eax, [bp-4Ch]
		mov	dword_720AF, eax
		mov	eax, [bp-48h]
		mov	dword_720B3, eax
		push	4FFBh
		push	4FA3h
		push	ss
		lea	ax, [bp-4]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8

loc_10C90:
		mov	ax, [bp-3]
		mov	word_72097, ax

loc_10C96:				; CODE XREF: seg008:267Ej
		les	bx, [bp+6]
		mov	al, es:[bx+32h]
		shr	ax, 2
		and	ax, 1
		or	al, al
		jnz	short loc_10CC1
		mov	al, es:[bx+32h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jnz	short loc_10CB7
		jmp	loc_10DA9
; ���������������������������������������������������������������������������

loc_10CB7:				; CODE XREF: seg008:2712j
		cmp	word_72097, 50h	; 'P'
		jge	short loc_10CC1
		jmp	loc_10DA9
; ���������������������������������������������������������������������������

loc_10CC1:				; CODE XREF: seg008:2705j seg008:271Cj
		les	bx, [bp+6]
		mov	al, es:[bx+32h]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_10CDD
		and	byte ptr es:[bx+32h], 0FDh
		or	byte ptr es:[bx+32h], 4
		jmp	short loc_10CEC
; ���������������������������������������������������������������������������

loc_10CDD:				; CODE XREF: seg008:272Fj
		cmp	word_72097, 50h	; 'P'
		jge	short loc_10CEC
		les	bx, [bp+6]
		and	byte ptr es:[bx+32h], 0FBh

loc_10CEC:				; CODE XREF: seg008:273Bj seg008:2742j
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 26h	; '&'
		mov	[bp-1Eh], ax
		mov	[bp-20h], dx
		les	bx, [bp-20h]
		mov	eax, es:[bx]
		mov	[bp-24h], eax
		mov	eax, [bp-24h]
		mov	[bp-74h], eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 2Ah	; '*'
		mov	[bp-26h], ax
		mov	[bp-28h], dx
		les	bx, [bp-28h]
		mov	eax, es:[bx]
		mov	[bp-2Ch], eax
		mov	eax, [bp-2Ch]
		mov	[bp-70h], eax
		mov	dword ptr [bp-30h], 0
		mov	eax, [bp-30h]
		mov	[bp-6Ch], eax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TooSlow_564A
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_10D7A
		push	large dword ptr	[bp-6Ch]
		push	large dword ptr	[bp-70h]
		push	large dword ptr	[bp-74h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-34h], eax
		mov	[bp-38h], eax
		mov	[bp-6Ch], eax

loc_10D7A:				; CODE XREF: seg008:27B4j
		push	large 0Ah
		lea	ax, [bp-74h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_GuidanceCmd_FromOwnPos
		add	sp, 0Ah

loc_10D91:
		push	large [dword_72039]
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_ThrottleCmd_HUD

loc_10DA3:
		add	sp, 8
		jmp	loc_11159
; ���������������������������������������������������������������������������

loc_10DA9:				; CODE XREF: seg008:2714j seg008:271Ej
		les	bx, [bp+6]
		mov	al, es:[bx+32h]
		shr	ax, 4
		and	ax, 1
		or	al, al
		jnz	short loc_10DBD
		jmp	loc_10EC4
; ���������������������������������������������������������������������������

loc_10DBD:				; CODE XREF: seg008:2818j
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 26h	; '&'
		mov	[bp-1Eh], ax
		mov	[bp-20h], dx
		les	bx, [bp-20h]
		mov	eax, es:[bx]
		mov	[bp-24h], eax
		mov	eax, [bp-24h]
		mov	[bp-74h], eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 2Ah	; '*'
		mov	[bp-26h], ax
		mov	[bp-28h], dx
		les	bx, [bp-28h]
		mov	eax, es:[bx]
		mov	[bp-2Ch], eax
		mov	eax, [bp-2Ch]
		mov	[bp-70h], eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 2Eh	; '.'
		mov	[bp-2Eh], ax
		mov	[bp-30h], dx
		les	bx, [bp-30h]
		mov	eax, es:[bx]
		mov	[bp-34h], eax
		mov	eax, [bp-34h]
		mov	[bp-6Ch], eax
		les	bx, [bp+6]
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	di, es:[bx+11h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	dword_72053, eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	dword_7205B, eax
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	4FA3h
		push	ss
		lea	ax, [bp-38h]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	ax, [bp-37h]
		mov	word_72095, ax
		cmp	word_72095, 2Dh	; '-'
		jg	short loc_10E9B
		les	bx, [bp+6]
		push	word ptr es:[bx+13h]
		push	large dword ptr	es:[bx+22h]

loc_10E91:
		call	AI_InterceptDispatcher

loc_10E96:
		add	sp, 6
		jmp	short loc_10EB9
; ���������������������������������������������������������������������������

loc_10E9B:				; CODE XREF: seg008:28E3j
		push	large 0Ah

loc_10E9E:
		lea	ax, [bp-74h]
		push	ax

loc_10EA2:
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_GuidanceCmd_FromOwnPos
		add	sp, 0Ah
		or	al, al
		jnz	short loc_10EB9
		jmp	loc_11159
; ���������������������������������������������������������������������������

loc_10EB9:				; CODE XREF: seg008:28F9j seg008:2914j
		les	bx, [bp+6]
		and	byte ptr es:[bx+32h], 0EFh
		jmp	loc_11159
; ���������������������������������������������������������������������������

loc_10EC4:				; CODE XREF: seg008:281Aj
		les	bx, [bp+6]
		push	word ptr es:[bx+13h]
		push	large dword ptr	es:[bx+22h]
		call	AI_VisibilityTest
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jz	short loc_10EE1
		jmp	loc_11159
; ���������������������������������������������������������������������������

loc_10EE1:				; CODE XREF: seg008:293Cj
		les	bx, [bp+6]
		mov	al, es:[bx+32h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jnz	short loc_10EF5
		jmp	loc_1106A
; ���������������������������������������������������������������������������

loc_10EF5:				; CODE XREF: seg008:2950j
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	di, es:[bx+11h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	dword_72053, eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	dword_7205B, eax
		push	word ptr es:[bx+13h]
		push	ss
		lea	ax, [bp-5Ch]
		push	ax
		mov	bx, es:[bx+13h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp-5Ch]
		mov	dword_720AB, eax
		mov	eax, [bp-58h]
		mov	dword_720AF, eax
		mov	eax, [bp-54h]
		mov	dword_720B3, eax
		push	eax
		push	large [dword_720AF]
		push	large [dword_720AB]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-8],	eax
		mov	[bp-0Ch], eax
		mov	dword_720BB, eax
		mov	[bp-20h], eax
		mov	ebx, 9
		mov	eax, [bp-20h]
		cdq
		idiv	ebx
		mov	[bp-20h], eax
		mov	eax, [bp-20h]
		mov	edx, dword_720BB
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-20h], eax
		push	large [dword_7205B]
		push	large [dword_72057]
		push	large [dword_72053]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-24h], eax
		mov	[bp-28h], eax
		mov	dword_7209B, eax
		mov	eax, [bp-20h]
		shl	eax, 1
		mov	[bp-2Ch], eax
		mov	[bp-30h], eax
		mov	eax, dword_7209B
		cmp	eax, [bp-30h]
		jg	short loc_10FE7
		mov	ax, 1
		jmp	short loc_10FE9
; ���������������������������������������������������������������������������

loc_10FE7:				; CODE XREF: seg008:2A40j
		xor	ax, ax

loc_10FE9:				; CODE XREF: seg008:2A45j
		or	al, al
		jnz	short loc_10FF0
		jmp	loc_1111F
; ���������������������������������������������������������������������������

loc_10FF0:				; CODE XREF: seg008:2A4Bj
		mov	dword ptr [bp-34h], 400h
		mov	eax, [bp-34h]
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax
		or	byte ptr es:[bx+32h], 10h
		and	byte ptr es:[bx+32h], 0F7h
		mov	dword ptr [bp-38h], 400h
		lea	ax, [bp-38h]
		push	ax
		mov	bx, es:[bx+13h]
		push	word ptr [bx+51h]
		push	ss
		lea	ax, [bp-74h]
		push	ax
		call	Physics_ApplyForceAtPoint
		add	sp, 8
		mov	eax, [bp-74h]
		mov	[bp-3Ch], eax
		mov	eax, [bp-3Ch]
		les	bx, [bp+6]
		mov	es:[bx+26h], eax
		mov	eax, [bp-70h]
		mov	[bp-40h], eax
		mov	eax, [bp-40h]
		mov	es:[bx+2Ah], eax
		mov	eax, [bp-6Ch]
		mov	[bp-44h], eax
		mov	eax, [bp-44h]
		mov	es:[bx+2Eh], eax
		jmp	loc_11159
; ���������������������������������������������������������������������������
		jmp	loc_1111F
; ���������������������������������������������������������������������������

loc_1106A:				; CODE XREF: seg008:2952j
		les	bx, [bp+6]
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	di, es:[bx+11h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	dword_72053, eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	dword_7205B, eax
		push	word ptr es:[bx+11h]

loc_110A1:
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	4FA3h
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	ax, [bp-0Fh]
		mov	word_72095, ax
		les	bx, [bp+6]
		push	word ptr es:[bx+13h]
		push	ss
		lea	ax, [bp-68h]
		push	ax
		mov	bx, es:[bx+13h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		lea	ax, [bp-68h]
		push	ax
		push	4FA3h
		push	ss
		lea	ax, [bp-14h]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	eax, 0B400h
		sub	eax, [bp-14h]
		mov	[bp-18h], eax
		mov	[bp-1Ch], eax
		mov	ax, [bp-1Bh]
		mov	word_72093, ax
		cmp	word_72095, 3Ch	; '<'
		jg	short loc_11135
		cmp	word_72093, 3Ch	; '<'
		jge	short loc_11135
		les	bx, [bp+6]
		or	byte ptr es:[bx+32h], 8

loc_1111F:				; CODE XREF: seg008:2A4Dj seg008:2AC7j
		les	bx, [bp+6]
		push	word ptr es:[bx+13h]
		push	large dword ptr	es:[bx+22h]
		call	AI_InterceptDispatcher
		add	sp, 6
		jmp	short loc_11159
; ���������������������������������������������������������������������������

loc_11135:				; CODE XREF: seg008:2B6Ej seg008:2B75j
		les	bx, [bp+6]
		push	word ptr es:[bx+13h]
		push	large dword ptr	es:[bx+22h]
		call	AI_InterceptDispatcher
		add	sp, 6
		or	al, al
		jz	short loc_11159

loc_1114D:				; CODE XREF: seg008:264Bj
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

loc_11159:				; CODE XREF: seg008:2806j seg008:2916j ...
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 36 lignes (34304-34339) - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (tag 0x214 =
; ID=8, score toujours 0 - coherent). Reevalue, pose avion+0x68=0xFF, demarre le suivi
; (vtable+0xC) immediatement. Aucun timer pose - delegation triviale.
; ==============================================================================================
MVRS_ID8_ApplyTrivialDelegate_1115D:				; DATA XREF: seg339:021Co
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1117F
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_1117F:				; CODE XREF: seg008:2BCFj
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+22h]

loc_11193:
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		push	large dword ptr	[bp+6]
		les	bx, [bp+6]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far (label, slot +0xC de l'ID 8, tag 0x214), LU 2026-09-25. Si le noeud n'a pas de cible
; (+0x13) ou que son minuteur +0x0D (-= dt, 2 s poses par
; MVRS_SharedContextSyncAndID2Score_EC22) est ecoule : Behavior_PopFinished_75612. Sinon :
; point vise = position de la cible + 100 * direction normalisee de sa vitesse
; (dword_72053..5B) ; AI_InterceptSpeedCmd_HUD(entite, cible, dword_7201C / 2 = 900) ;
; AI_GuidanceCmd_FromOwnPos(entite, &point, 10). Manoeuvre complete 'se placer derriere la
; cible, 100 devant elle dans son axe, a 900 de distance' - jamais choisie car le score de
; l'ID 8 vaut toujours 0.
; ==============================================================================================
MVRS_ID8_TickShadowTarget_111AE:				; DATA XREF: seg339:off_6D2D0o
		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		les	bx, [bp+6]
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_111C3
		jmp	loc_112E7
; ���������������������������������������������������������������������������

loc_111C3:				; CODE XREF: seg008:2C1Ej
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax
		mov	eax, es:[bx+0Dh]
		sar	eax, 1Fh
		or	al, al
		jz	short loc_111DC
		jmp	loc_112E7
; ���������������������������������������������������������������������������

loc_111DC:				; CODE XREF: seg008:2C37j
		les	bx, [bp+6]
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	di, es:[bx+11h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	dword_72053, eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	dword_7205B, eax
		push	word ptr es:[bx+13h]
		push	ss
		lea	ax, [bp-24h]
		push	ax
		mov	bx, es:[bx+13h]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		lea	ax, [bp-24h]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	si, ax
		mov	eax, [si]
		mov	[bp-18h], eax
		mov	eax, [si+4]
		mov	[bp-14h], eax
		mov	eax, [si+8]
		mov	[bp-10h], eax
		mov	dword ptr [bp-4], 6400h
		mov	eax, [bp-18h]
		mov	edx, [bp-4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-18h], eax
		mov	eax, [bp-14h]
		mov	edx, [bp-4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-14h], eax
		mov	eax, [bp-10h]
		mov	edx, [bp-4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-10h], eax
		mov	eax, [bp-18h]
		add	dword_72053, eax

loc_11294:
		mov	eax, [bp-14h]
		add	dword_72057, eax
		mov	eax, [bp-10h]
		add	dword_7205B, eax
		mov	eax, dword_7201C
		sar	eax, 1
		mov	[bp-8],	eax
		mov	[bp-0Ch], eax
		sar	eax, 8
		push	eax
		les	bx, [bp+6]
		push	word ptr es:[bx+13h]
		push	large dword ptr	es:[bx+22h]
		call	AI_InterceptSpeedCmd_HUD
		add	sp, 0Ah
		push	large 0Ah
		push	4FA3h
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_GuidanceCmd_FromOwnPos
		add	sp, 0Ah
		jmp	short loc_112F3
; ���������������������������������������������������������������������������

loc_112E7:				; CODE XREF: seg008:2C20j seg008:2C39j
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

loc_112F3:				; CODE XREF: seg008:2D45j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID9_ApplyTrivialDelegate_112F7'. far, 8 lignes - LUE INTEGRALEMENT ET CORRECTEMENT
; ATTRIBUEE (ID=9 confirme, score toujours 0 - coherent). Appelle directement [vtable+0xC]
; (demarre le suivi), rien d'autre. Delegation triviale pure, authentique emplacement vestige.
; | IDENTIFIANT CORRIGE 2026-09-25 : methode de l'enregistrement seg339 a 0x6D0B0 + tag (tags
; lus dans le switch de PilotProfile_ResolveNamedPropertyNode_742FC, verifies par le noeud ID
; 19 = GroundAttack_*) ; l'ancien nom portait un identifiant decale.
; ==============================================================================================
MVRS_ID9_ApplyEndsAtOnce_112F7:				; DATA XREF: seg339:0208o
		push	bp
		mov	bp, sp
		push	large dword ptr	[bp+6]
		les	bx, [bp+6]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far (label, slot +0xC de l'ID 9). Behavior_PopFinished_75612 seulement : le comportement se
; termine immediatement.
; ==============================================================================================
MVRS_ID9_TickEndsAtOnce_1130C:				; DATA XREF: seg339:020Co
		push	bp
		mov	bp, sp
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID10_ApplyTrivialDelegate_1131D'. far, 8 lignes - LUE INTEGRALEMENT ET CORRECTEMENT
; ATTRIBUEE (ID=10 confirme, score toujours 0 - coherent). Appelle directement [vtable+0xC]
; (demarre le suivi), rien d'autre. Delegation triviale pure, authentique emplacement vestige.
; | IDENTIFIANT CORRIGE 2026-09-25 : methode de l'enregistrement seg339 a 0x6D0B0 + tag (tags
; lus dans le switch de PilotProfile_ResolveNamedPropertyNode_742FC, verifies par le noeud ID
; 19 = GroundAttack_*) ; l'ancien nom portait un identifiant decale.
; ==============================================================================================
MVRS_ID10_ApplyEndsAtOnce_1131D:				; DATA XREF: seg339:01F4o
		push	bp
		mov	bp, sp
		push	large dword ptr	[bp+6]
		les	bx, [bp+6]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far (label, slot +0xC de l'ID 10). Behavior_PopFinished_75612 seulement.
; ==============================================================================================
MVRS_ID10_TickEndsAtOnce_11332:				; DATA XREF: seg339:01F8o
		push	bp
		mov	bp, sp
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID11_ApplyTrivialDelegate_11343'. far, 8 lignes - LUE INTEGRALEMENT ET CORRECTEMENT
; ATTRIBUEE (ID=11 confirme, score toujours 0 - coherent). Appelle directement [vtable+0xC]
; (demarre le suivi), rien d'autre. Delegation triviale pure, authentique emplacement vestige.
; | IDENTIFIANT CORRIGE 2026-09-25 : methode de l'enregistrement seg339 a 0x6D0B0 + tag (tags
; lus dans le switch de PilotProfile_ResolveNamedPropertyNode_742FC, verifies par le noeud ID
; 19 = GroundAttack_*) ; l'ancien nom portait un identifiant decale.
; ==============================================================================================
MVRS_ID11_ApplyEndsAtOnce_11343:				; DATA XREF: seg339:off_6D290o
		push	bp
		mov	bp, sp
		push	large dword ptr	[bp+6]
		les	bx, [bp+6]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far (label, slot +0xC de l'ID 11). Behavior_PopFinished_75612 seulement.
; ==============================================================================================
MVRS_ID11_TickEndsAtOnce_11358:				; DATA XREF: seg339:01E4o
		push	bp
		mov	bp, sp
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID12_ApplyTrivialDelegate_11369'. far, 8 lignes - LUE INTEGRALEMENT ET CORRECTEMENT
; ATTRIBUEE (ID=12 confirme, score toujours 0 - coherent). Appelle directement [vtable+0xC]
; (demarre le suivi), rien d'autre. Delegation triviale pure, authentique emplacement vestige.
; | IDENTIFIANT CORRIGE 2026-09-25 : methode de l'enregistrement seg339 a 0x6D0B0 + tag (tags
; lus dans le switch de PilotProfile_ResolveNamedPropertyNode_742FC, verifies par le noeud ID
; 19 = GroundAttack_*) ; l'ancien nom portait un identifiant decale.
; ==============================================================================================
MVRS_ID12_ApplyEndsAtOnce_11369:				; DATA XREF: seg339:01CCo
		push	bp
		mov	bp, sp
		push	large dword ptr	[bp+6]
		les	bx, [bp+6]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID13_TickTrivialDelegate_1137E'. far, 8 lignes - probable slot [vtable+0x10] de
; MVRS ID=0x13. Tout aussi triviale : appelle uniquement NotifiableRef_AttachTarget_6AB45
; (motif generique) et retourne. Aucune logique de tick/minuteur contrairement a ID=6/ID=7. |
; IDENTIFIANT CORRIGE 2026-09-25 : methode de l'enregistrement seg339 a 0x6D0B0 + tag (tags
; lus dans le switch de PilotProfile_ResolveNamedPropertyNode_742FC, verifies par le noeud ID
; 19 = GroundAttack_*) ; l'ancien nom portait un identifiant decale.
; ==============================================================================================
MVRS_ID12_TickEndsAtOnce_1137E:				; DATA XREF: seg339:01D0o
		push	bp
		mov	bp, sp
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE. Application MVRS ID13 : minuteur 4 s (0x400), phase node+0x26 = 1, puis premier
; tick.
; ==============================================================================================
MVRS_ID13_ApplySetTimer_1138F:				; DATA XREF: seg339:01B8o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_113B4
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_113B4:				; CODE XREF: seg008:2E04j
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		mov	dword ptr [bp-4], 400h
		mov	eax, [bp-4]
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		les	bx, [bp+6]
		inc	word ptr es:[bx+2]
		mov	byte ptr es:[bx+26h], 1
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID13_TickManeuverSequence_113FD'. far, ~335L, RELUE 2026-09-25 (pas
; Scissors/Rollaway). Tick MVRS ID13 'prise d'altitude a longue distance'. Minuteur -= dt
; (dword_70458) ; sans cible : fin. Phase 1 : si distance horizontale a la cible < 17700
; (dword_7202C) -> fin ; sinon AI_GuidanceCmd_FromOwnPos vers la cible (composante verticale
; annulee, vitesse cran 10) et phase suivante une fois aligne. Phase 2 : si trop lent ->
; assiette 0 puis ailes a plat (zone morte 5) ; sinon phase suivante. Phase 3 : chandelle a 30
; + 30 x (vitesse indiquee - croisiere JDYN+0x84)/min JDYN+0x82 deg (borne 60), ailes a plat,
; cran 10 ; phase suivante si minuteur < 0, trop lent ou cible a moins de 17700 (le minuteur
; est decremente 2 fois par tick dans cette phase). Phase 4 : assiette 0 (zone morte 5),
; manette croisiere, puis fin.
; ==============================================================================================
MVRS_ID13_TickZoomClimb_113FD:				; DATA XREF: seg339:01BCo
		push	bp
		mov	bp, sp
		sub	sp, 5Ah
		push	si
		push	di
		les	bx, [bp+6]
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_1141B
		jmp	loc_11749	; case 0x4
; ���������������������������������������������������������������������������

loc_1141B:				; CODE XREF: seg008:2E76j
		mov	al, es:[bx+26h]
		cbw
		dec	ax
		mov	bx, ax
		cmp	bx, 4		; switch 5 cases
		jbe	short loc_1142B
		jmp	loc_11755	; default
; ���������������������������������������������������������������������������

loc_1142B:				; CODE XREF: seg008:2E86j
		shl	bx, 1
		jmp	cs:off_11759[bx] ; switch jump

loc_11432:				; DATA XREF: seg008:off_11759o
		les	bx, [bp+6]	; case 0x0
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	di, es:[bx+11h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	dword_72053, eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	dword_7205B, eax
		mov	dword ptr [bp-4], 0
		mov	eax, [bp-4]
		mov	dword_7205B, eax
		push	eax
		push	large [dword_72057]
		push	large [dword_72053]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-8],	eax
		mov	[bp-0Ch], eax
		mov	eax, dword_7202C
		mov	[bp-10h], eax
		shl	eax, 8
		cmp	eax, [bp-0Ch]
		jle	short loc_114AC
		mov	ax, 1
		jmp	short loc_114AE
; ���������������������������������������������������������������������������

loc_114AC:				; CODE XREF: seg008:2F05j
		xor	ax, ax

loc_114AE:				; CODE XREF: seg008:2F0Aj
		or	al, al
		jz	short loc_114B5
		jmp	loc_11749	; case 0x4
; ���������������������������������������������������������������������������

loc_114B5:				; CODE XREF: seg008:2F10j
		push	large 0Ah
		push	4FA3h
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_GuidanceCmd_FromOwnPos
		add	sp, 0Ah
		or	al, al
		jnz	short loc_114D2
		jmp	loc_11755	; default
; ���������������������������������������������������������������������������

loc_114D2:				; CODE XREF: seg008:2F2Dj
		les	bx, [bp+6]
		inc	byte ptr es:[bx+26h]
		jmp	loc_11755	; default
; ���������������������������������������������������������������������������

loc_114DC:				; CODE XREF: seg008:2E8Dj
					; DATA XREF: seg008:off_11759o
		les	bx, [bp+6]	; case 0x1
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TooSlow_564A
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_114FC
		les	bx, [bp+6]
		inc	byte ptr es:[bx+26h]
		jmp	loc_116E9
; ���������������������������������������������������������������������������

loc_114FC:				; CODE XREF: seg008:2F50j
		push	5
		mov	dword ptr [bp-14h], 0
		lea	ax, [bp-14h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		or	al, al
		jnz	short loc_11521
		jmp	loc_116E9
; ���������������������������������������������������������������������������

loc_11521:				; CODE XREF: seg008:2F7Cj
		push	5
		mov	dword ptr [bp-18h], 0
		lea	ax, [bp-18h]
		jmp	loc_116D8
; ���������������������������������������������������������������������������
		jmp	loc_116E9
; ���������������������������������������������������������������������������

loc_11534:				; CODE XREF: seg008:2E8Dj
					; DATA XREF: seg008:off_11759o
		les	bx, [bp+6]	; case 0x2
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-1Ch]
		push	ax
		call	AI_Sensor_IndicatedAirspeed_5861
		add	sp, 8
		mov	eax, [bp-1Ch]
		mov	dword_720B7, eax
		les	bx, [bp+6]
		mov	si, es:[bx+13h]
		add	si, 12h
		mov	di, es:[bx+11h]
		add	di, 12h
		mov	eax, [si]
		sub	eax, [di]
		mov	dword_72053, eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	dword_72057, eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	dword_7205B, eax
		mov	eax, es:[bx+0Dh]
		sar	eax, 1Fh
		or	al, al
		jnz	short loc_115E2
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TooSlow_564A
		add	sp, 4
		or	al, al
		jnz	short loc_115E2
		push	large [dword_7205B]
		push	large [dword_72057]
		push	large [dword_72053]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-20h], eax
		mov	[bp-24h], eax
		mov	eax, dword_7202C
		mov	[bp-28h], eax
		shl	eax, 8
		cmp	eax, [bp-24h]
		jle	short loc_115DC
		mov	ax, 1
		jmp	short loc_115DE
; ���������������������������������������������������������������������������

loc_115DC:				; CODE XREF: seg008:3035j
		xor	ax, ax

loc_115DE:				; CODE XREF: seg008:303Aj
		or	al, al
		jz	short loc_115E9

loc_115E2:				; CODE XREF: seg008:2FEFj seg008:3000j
		les	bx, [bp+6]
		inc	byte ptr es:[bx+26h]

loc_115E9:				; CODE XREF: seg008:3040j
		les	bx, [bp+6]
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax
		mov	dword ptr [bp-2Ch], 1Eh
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+84h]
		mov	[bp-2Eh], ax
		movsx	eax, word ptr [bp-2Eh]
		shl	eax, 8
		cmp	eax, dword_720B7
		jge	short loc_11621
		mov	ax, 1
		jmp	short loc_11623
; ���������������������������������������������������������������������������

loc_11621:				; CODE XREF: seg008:307Aj
		xor	ax, ax

loc_11623:				; CODE XREF: seg008:307Fj
		or	al, al
		jz	short loc_116A1
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+84h]
		mov	[bp-30h], ax
		movsx	eax, word ptr [bp-30h]
		shl	eax, 8
		mov	edx, dword_720B7
		sub	edx, eax
		mov	[bp-34h], edx
		mov	eax, [bp-34h]
		mov	[bp-38h], eax
		imul	eax, 1Eh
		mov	[bp-3Ch], eax
		mov	[bp-40h], eax
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx+82h]
		mov	[bp-42h], ax
		movsx	ebx, word ptr [bp-42h]
		mov	eax, [bp-40h]
		cdq
		idiv	ebx
		mov	[bp-46h], eax
		mov	[bp-4Ah], eax
		sar	eax, 8
		add	[bp-2Ch], eax
		cmp	dword ptr [bp-2Ch], 3Ch	; '<'
		jle	short loc_116A1
		mov	dword ptr [bp-2Ch], 3Ch	; '<'

loc_116A1:				; CODE XREF: seg008:3085j seg008:30F7j
		push	5
		mov	eax, [bp-2Ch]
		mov	[bp-4Eh], eax
		shl	eax, 8
		mov	[bp-52h], eax
		lea	ax, [bp-52h]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		or	al, al
		jz	short loc_116E9
		push	5
		mov	dword ptr [bp-56h], 0
		lea	ax, [bp-56h]

loc_116D8:				; CODE XREF: seg008:2F8Ej
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_RollToAngleCmd_8104
		add	sp, 8

loc_116E9:				; CODE XREF: seg008:2F59j seg008:2F7Ej ...
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		jmp	short loc_11755	; default
; ���������������������������������������������������������������������������

loc_116FB:				; CODE XREF: seg008:2E8Dj
					; DATA XREF: seg008:off_11759o
		push	5		; case 0x3
		mov	dword ptr [bp-5Ah], 0
		lea	ax, [bp-5Ah]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8
		or	al, al
		jz	short loc_11724
		les	bx, [bp+6]
		inc	byte ptr es:[bx+26h]

loc_11724:				; CODE XREF: seg008:317Bj
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		movsx	eax, word ptr [bx+84h]
		push	eax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_ThrottleCmd_HUD
		add	sp, 8
		jmp	short loc_11755	; default
; ���������������������������������������������������������������������������

loc_11749:				; CODE XREF: seg008:2E78j seg008:2E8Dj ...
		push	large dword ptr	[bp+6] ; case 0x4
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

loc_11755:				; CODE XREF: seg008:2E88j seg008:2F2Fj ...
		pop	di		; default
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
off_11759	dw offset loc_11432	; DATA XREF: seg008:2E8Dr
		dw offset loc_114DC	; jump table for switch	statement
		dw offset loc_11534
		dw offset loc_116FB
		dw offset loc_11749
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID14_Apply_11763'. far, LUE. Application MVRS ID14 (evitement du sol) : minuteur,
; premier tick.
; ==============================================================================================
MVRS_ID14_ApplyGroundAvoid_11763:				; DATA XREF: seg339:01A4o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_11785
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_11785:				; CODE XREF: seg008:31D5j
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		push	large dword ptr	[bp+6]
		les	bx, [bp+6]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-09-25. Tick MVRS ID14 : AI_EjectDecision_50FF(mode 2) ; sinon fin si minuteur
; < 0 ; sinon AI_GroundAvoidPullUp_6616 (fin quand il renvoie 1).
; ==============================================================================================
MVRS_ID14_TickGroundAvoid_117B4:				; DATA XREF: seg339:01A8o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax
		push	2
		push	large dword ptr	es:[bx+22h]
		call	AI_EjectDecision_50FF
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_11807
		les	bx, [bp+6]
		mov	eax, es:[bx+0Dh]
		sar	eax, 8
		cmp	eax, 0
		jl	short loc_117FB
		push	large dword ptr	es:[bx+22h]
		call	AI_GroundAvoidPullUp_6616
		add	sp, 4
		or	al, al
		jz	short loc_11807

loc_117FB:				; CODE XREF: seg008:3248j
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

loc_11807:				; CODE XREF: seg008:3236j seg008:3259j
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID15_Apply_11809'. far, LUE. Application MVRS ID15 : minuteur 2 s, premier tick.
; ==============================================================================================
MVRS_ID15_ApplyStallRecovery_11809:				; DATA XREF: seg339:off_6D240o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1182E
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_1182E:				; CODE XREF: seg008:327Ej
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		mov	dword ptr [bp-4], 200h
		mov	eax, [bp-4]
		les	bx, [bp+6]
		mov	es:[bx+0Dh], eax
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-09-25. Tick MVRS ID15 : fin si minuteur < 0 ; AI_EjectDecision_50FF(mode 1) ;
; sinon AI_NoseHighRecovery_676F (fin quand il renvoie 1).
; ==============================================================================================
MVRS_ID15_TickStallRecovery_1186E:				; DATA XREF: seg339:off_6D244o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax
		mov	eax, es:[bx+0Dh]
		sar	eax, 8
		cmp	eax, 0
		jl	short loc_118B5
		push	1
		push	large dword ptr	es:[bx+22h]
		call	AI_EjectDecision_50FF
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_118C1
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_NoseHighRecovery_676F
		add	sp, 4
		or	al, al
		jz	short loc_118C1

loc_118B5:				; CODE XREF: seg008:32EAj
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

loc_118C1:				; CODE XREF: seg008:32FFj seg008:3313j
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID16_ApplyReturnToBase_118C3'. far, LUE. Application MVRS ID16 : minuteur 1,5 s
; (0x180), premier tick. (Pas un retour a la base.)
; ==============================================================================================
MVRS_ID16_ApplyRegainSpeed_118C3:				; DATA XREF: seg339:017Co
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_118E5
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_118E5:				; CODE XREF: seg008:3335j
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		les	bx, [bp+6]
		mov	dword ptr es:[bx+0Dh], 180h
		push	large dword ptr	es:[bx+22h]
		call	AI_RegainSpeed_68D4
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, LUE 2026-09-25. Tick MVRS ID16 : AI_RegainSpeed_68D4 jusqu'a la fin ou au minuteur.
; ==============================================================================================
MVRS_ID16_TickRegainSpeed_1191D:				; DATA XREF: seg339:off_6D230o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax
		mov	eax, es:[bx+0Dh]
		sar	eax, 8
		cmp	eax, 0
		jl	short loc_1194C
		push	large dword ptr	es:[bx+22h]
		call	AI_RegainSpeed_68D4
		add	sp, 4
		or	al, al
		jz	short loc_11958

loc_1194C:				; CODE XREF: seg008:3399j
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

loc_11958:				; CODE XREF: seg008:33AAj
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID21_ApplyStoreNavCommand_1195A'. far, ~60 lignes - LUE INTEGRALEMENT. Fonction
; d'APPLICATION (vtable+8) du noeud MVRS ID 20 (tag 0x14C, noeud permanent entite+0xC1 ; les
; anciens resumes le disaient ID 21 a tort) (le 'placeholder desactive' pour le tournoi de
; score, mais utilise DIRECTEMENT hors tournoi comme porteur de commande de navigation - voir
; AI_SYSTEM.md §4bis). Recopie le vecteur position+vitesse recu en parametre (calcule par
; AI_NavSolutionToPoint_8548) dans node+0x26/+0x2A/+0x2E, pose entite-avion+0x68=0xFF (timer
; rafraichi), appelle [vtable+0xC] (demarrage du suivi). | IDENTIFIANT CORRIGE 2026-09-25 :
; methode de l'enregistrement seg339 a 0x6D0B0 + tag (tags lus dans le switch de
; PilotProfile_ResolveNamedPropertyNode_742FC, verifies par le noeud ID 19 = GroundAttack_*) ;
; l'ancien nom portait un identifiant decale.
; ==============================================================================================
MVRS_ID20_ApplyStoreNavCommand_1195A:				; DATA XREF: seg339:0154o
		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+0Ah]
		cmp	word ptr [si+4], 0
		jnz	short loc_1196D
		jmp	loc_11A01
; ���������������������������������������������������������������������������

loc_1196D:				; CODE XREF: seg008:33C8j
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_11988
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_11988:				; CODE XREF: seg008:33D8j
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		mov	si, [si+4]
		mov	eax, [si]
		mov	[bp-18h], eax
		mov	eax, [si+4]
		mov	[bp-14h], eax
		mov	eax, [si+8]
		mov	[bp-10h], eax
		mov	eax, [bp-18h]
		mov	[bp-4],	eax
		mov	eax, [bp-4]
		les	bx, [bp+6]
		mov	es:[bx+26h], eax
		mov	eax, [bp-14h]
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		mov	es:[bx+2Ah], eax
		mov	eax, [bp-10h]
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		mov	es:[bx+2Eh], eax
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		push	large dword ptr	[bp+6]
		les	bx, [bp+6]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4

loc_11A01:				; CODE XREF: seg008:33CAj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; Ex-'MVRS_ID21_TickApplyGuidance_11A04'. far, ~55 lignes - LUE INTEGRALEMENT. Methode
; [vtable+0x10] (tick periodique) du noeud MVRS_ID21. Decompte le minuteur (node+0xD -=
; dword_70458), relit le vecteur stocke par MVRS_ID20_ApplyStoreNavCommand_1195A, ecrit une
; valeur fixe (0xA=10) dans entite+7+0x1E (statut sur le sous-objet partage). Si le minuteur
; est epuise : appelle NotifiableRef_AttachTarget (reacquisition). Sinon : appelle
; AI_GuidanceCmd_FromOwnPos_75A9 avec le vecteur stocke - POINT D'ENTREE DE LA CHAINE DE
; GUIDAGE GEOMETRIQUE (voir §4bis). | IDENTIFIANT CORRIGE 2026-09-25 : methode de
; l'enregistrement seg339 a 0x6D0B0 + tag (tags lus dans le switch de
; PilotProfile_ResolveNamedPropertyNode_742FC, verifies par le noeud ID 19 = GroundAttack_*) ;
; l'ancien nom portait un identifiant decale.
; ==============================================================================================
MVRS_ID20_TickApplyGuidance_11A04:				; DATA XREF: seg339:0158o
		push	bp
		mov	bp, sp
		sub	sp, 24h
		les	bx, [bp+6]
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 26h	; '&'
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	bx, [bp-4]
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		mov	[bp-24h], eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 2Ah	; '*'
		mov	[bp-0Ah], ax
		mov	[bp-0Ch], dx
		les	bx, [bp-0Ch]
		mov	eax, es:[bx]
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		mov	[bp-20h], eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 2Eh	; '.'
		mov	[bp-12h], ax
		mov	[bp-14h], dx
		les	bx, [bp-14h]
		mov	eax, es:[bx]
		mov	[bp-18h], eax
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		les	bx, [bp+6]
		mov	eax, es:[bx+0Dh]
		sar	eax, 8
		cmp	eax, 0
		jl	short loc_11AB6
		push	large 0Ah
		lea	ax, [bp-24h]
		push	ax
		push	large dword ptr	es:[bx+22h]
		call	AI_GuidanceCmd_FromOwnPos
		add	sp, 0Ah
		or	al, al
		jz	short locret_11AC2

loc_11AB6:				; CODE XREF: seg008:34FCj
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

locret_11AC2:				; CODE XREF: seg008:3514j
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far (label, slot +8 de l'ID 21), LU 2026-09-25. Reevalue le score si besoin, s'empile comme
; comportement en cours (Behavior_PushRunning_756A4), remet a 0 le drapeau 'point atteint' du
; bloc de commandes (+0x1A), puis appelle son tick. Appele via entite+0xD1 par
; AI_NavSolutionToPoint, Goal_MoraleReaction_878F, Goal_SelectTransition,
; PartEntry_ResolveSpawnPositionAndActivate : le point et la vitesse voulue sont deja dans le
; bloc de commandes (+0x02, +0x0E).
; ==============================================================================================
MVRS_ID21_ApplyAutopilotNav_11AC4:				; DATA XREF: seg339:0140o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_11AE6
		push	si
		push	word ptr [bp+8]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_11AE6:				; CODE XREF: seg008:3536j
		push	si
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Ah], 0
		push	large dword ptr	[bp+6]
		les	bx, [bp+6]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far (label, slot +0xC de l'ID 21), LU 2026-09-25. NAVIGATION AU PILOTE AUTOMATIQUE PHYSIQUE.
; Minuteur +0x0D -= dt. Si le pilote automatique est coupe (JDYN+0x68 == 0xFF) : si |tangage
; du nez| < 15 (AI_Sensor_NosePitch_59A5, cmp 0F00h) -> JDYN+0x68 = 0 (active
; Autopilot_FlyToPointKinematic_49C2E) ; sinon AI_PitchToAngleCmd_7E18(0, zone morte 5)
; (remettre le nez a l'horizontale d'abord). Fin quand le minuteur est ecoule ou que le pilote
; automatique a pose 'point atteint' (bloc +0x1A) : JDYN+0x68 = 0xFF puis
; Behavior_PopFinished_75612.
; ==============================================================================================
MVRS_ID21_TickAutopilotNav_11B16:				; DATA XREF: seg339:0144o
		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+6]
		mov	eax, dword_70458
		sub	es:[bx+0Dh], eax
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		cmp	byte ptr [bx+68h], 0FFh
		jz	short loc_11B3B
		mov	ax, 1
		jmp	short loc_11B3D
; ���������������������������������������������������������������������������

loc_11B3B:				; CODE XREF: seg008:3594j
		xor	ax, ax

loc_11B3D:				; CODE XREF: seg008:3599j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_11BAC
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-4]
		push	ax
		call	AI_Sensor_NosePitch_59A5
		add	sp, 8
		mov	eax, [bp-4]
		or	eax, eax
		jge	short loc_11B64
		neg	eax

loc_11B64:				; CODE XREF: seg008:35BFj
		mov	[bp-4],	eax
		cmp	dword ptr [bp-4], 0F00h
		jge	short loc_11B77
		mov	ax, 1
		jmp	short loc_11B79
; ���������������������������������������������������������������������������

loc_11B77:				; CODE XREF: seg008:35D0j
		xor	ax, ax

loc_11B79:				; CODE XREF: seg008:35D5j
		or	al, al
		jz	short loc_11B8E
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0
		jmp	short loc_11BAC
; ���������������������������������������������������������������������������

loc_11B8E:				; CODE XREF: seg008:35DBj
		mov	dword ptr [bp-8], 0
		push	5
		lea	ax, [bp-8]
		push	ax
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_PitchToAngleCmd_7E18
		add	sp, 8

loc_11BAC:				; CODE XREF: seg008:35A1j seg008:35ECj
		les	bx, [bp+6]
		mov	eax, es:[bx+0Dh]
		sar	eax, 1Fh
		or	al, al
		jnz	short loc_11BCB
		les	bx, es:[bx+22h]
		les	bx, es:[bx+7]
		cmp	byte ptr es:[bx+1Ah], 0
		jz	short locret_11BE6

loc_11BCB:				; CODE XREF: seg008:361Aj
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	byte ptr [bx+68h], 0FFh
		push	large dword ptr	[bp+6]

loc_11BDE:
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

locret_11BE6:				; CODE XREF: seg008:3629j
		leave
		retf
; ���������������������������������������������������������������������������

loc_11BE8:				; DATA XREF: seg339:off_71E4Eo
		push	bp
		mov	bp, sp
		pop	bp
		retf
seg008		ends
