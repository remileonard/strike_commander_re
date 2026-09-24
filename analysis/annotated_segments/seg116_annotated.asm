seg116		segment	byte public 'CODE' use16
		assume cs:seg116
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg216), génère 3 composantes aléatoires
; (Math_RandomScale_54DF4 ×3) et alloue (sub_658) — vecteur de dispersion/jitter aléatoire,
; cohérent avec le système de particules (seg106/107).
; ==============================================================================================
Effect_RandomJitterVector_54ECF:				; DATA XREF: seg216:0466o
		mov	ax, [di]
		add	ax, [si]
		mov	[si], ax
		mov	ax, [di+2]
		sub	ax, [si+2]
		mov	[si+2],	ax
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_54EE4:
		push	bp

loc_54EE5:
		mov	bp, sp

loc_54EE7:
		sub	sp, 6
		push	si
		push	di

loc_54EEC:
		mov	si, [bp+0Ah]
		mov	di, [bp+6]

loc_54EF2:
		mov	ax, [si]
		shl	ax, 1
		call	Math_RandomScale_54DF4
		sub	ax, [si]
		mov	[bp-2],	ax
		mov	ax, [si+2]
		shl	ax, 1
		call	Math_RandomScale_54DF4
		sub	ax, [si+2]
		mov	[bp-4],	ax
		mov	ax, [si+4]
		shl	ax, 1
		call	Math_RandomScale_54DF4
		sub	ax, [si+4]
		mov	[bp-6],	ax
		or	di, di
		jz	short loc_54F28

loc_54F24:
		mov	ax, di
		jmp	short loc_54F32
; ���������������������������������������������������������������������������

loc_54F28:				; CODE XREF: seg116:0062j
		push	6

loc_54F2A:
		call	CRT_Malloc16_Retry
		pop	cx

loc_54F30:
		mov	di, ax

loc_54F32:				; CODE XREF: seg116:0066j
		or	ax, ax
		jz	short loc_54F4B

loc_54F36:
		mov	ax, [bp-2]
		mov	[di], ax
		mov	ax, [bp-4]
		mov	[di+2],	ax
		mov	ax, [bp-6]
		mov	[di+4],	ax
		mov	ax, di
		jmp	short loc_54F4D
; ���������������������������������������������������������������������������

loc_54F4B:				; CODE XREF: seg116:0074j
		mov	ax, di

loc_54F4D:				; CODE XREF: seg116:0089j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, longueur de vecteur 3D en virgule fixe avec mise à l'échelle anti-débordement : décale
; les composantes (Math_VectorLength_ShiftDownIfLarge_55793 / ShiftUpIfSmall_55868) avant de
; sommer les carrés et appeler Math_Sqrt_54BF1, puis rétablit l'échelle du résultat.
; Référencée par Formation_GuidanceSolution (sub_D081) et sub_DD21.
; ==============================================================================================
Math_VectorLength3D_Scaled_54F57	proc far		; CODE XREF: Formation_GuidanceSolution+E8P AI_VisibilityTest+BBP ...

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_2], 0
		mov	eax, [si]
		or	eax, eax
		jge	short loc_54F70
		neg	eax

loc_54F70:				; CODE XREF: Math_VectorLength3D_Scaled_54F57+14j
		mov	[bp+var_12], eax
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_54F80
		neg	eax

loc_54F80:				; CODE XREF: Math_VectorLength3D_Scaled_54F57+24j
		mov	[bp+var_E], eax
		mov	eax, [si+8]
		or	eax, eax
		jge	short loc_54F90
		neg	eax

loc_54F90:				; CODE XREF: Math_VectorLength3D_Scaled_54F57+34j
		mov	[bp+var_A], eax
		push	1
		push	large 10h
		lea	ax, [bp+var_12]
		push	ax
		nop
		push	cs
		call	near ptr Math_VectorLength_ShiftDownIfLarge_55793

loc_54FA2:
		add	sp, 8

loc_54FA5:
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0

loc_54FAC:
		jnz	short loc_54FC5
		push	1

loc_54FB0:
		push	large 400h

loc_54FB6:
		lea	ax, [bp+var_12]
		push	ax
		nop
		push	cs
		call	near ptr Math_VectorLength_ShiftUpIfSmall_55868

loc_54FBF:
		add	sp, 8
		mov	[bp+var_2], al

loc_54FC5:				; CODE XREF: Math_VectorLength3D_Scaled_54F57:loc_54FACj
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_12]
		imul	edx

loc_54FD0:
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_E]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_A]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_E]
		add	[bp+var_12], eax
		mov	eax, [bp+var_A]
		add	[bp+var_12], eax
		lea	ax, [bp+var_12]
		push	ax
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		call	Math_Sqrt_54BF1

loc_5501F:
		add	sp, 6
		cmp	[bp+var_1], 0

loc_55026:
		jz	short loc_55034
		mov	cl, [bp+var_1]
		mov	eax, [bp+var_6]

loc_5502F:
		sar	eax, cl
		jmp	short loc_55044
; ���������������������������������������������������������������������������

loc_55034:				; CODE XREF: Math_VectorLength3D_Scaled_54F57:loc_55026j
		cmp	[bp+var_2], 0
		jz	short loc_55048
		mov	cl, [bp+var_2]
		mov	eax, [bp+var_6]

loc_55041:
		shl	eax, cl

loc_55044:				; CODE XREF: Math_VectorLength3D_Scaled_54F57+DBj
		mov	[bp+var_6], eax

loc_55048:				; CODE XREF: Math_VectorLength3D_Scaled_54F57+E1j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_6]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Math_VectorLength3D_Scaled_54F57	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 47L, LUE (2026-09-24). PRODUIT SCALAIRE de deux vecteurs 3x i32 24.8 : (a0*b0 + a1*b1 +
; a2*b2) en 64 bits (imul / add / adc), puis shrd 8 -> resultat 24.8 ecrit dans *arg_0.
; Ex-'Targeting_ComputeGeometryHelperA'. Utilise par Targeting_AcquireBestThreat,
; Aircraft_ComputeSeekerSignature_3E2F1 (aspect arriere), Targeting_SelectAndPrioritize et le
; cluster matrice/rotation.
; ==============================================================================================
Math_DotProduct3D_5505B	proc far		; CODE XREF: Targeting_AcquireBestThreat+74AP
					; Targeting_AcquireBestThreat+849P ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [si]
		mov	edx, [di]
		imul	edx
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		mov	edx, [di+4]
		imul	edx
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		mov	edx, [di+8]
		imul	edx
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]

loc_550A6:
		mov	eax, [bp+var_4]
		mov	[bx], eax

loc_550AD:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_DotProduct3D_5505B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, helper vectoriel générique (alloue via sub_658), utilisé massivement par le cluster de
; construction de matrice de rotation (575DF/57660/576E5).
; ==============================================================================================
Vector_TransformHelperA_550B7	proc far		; CODE XREF: AI_ProximityGeometricWarning_315B+A3P Goal_FollowAllyFormation+E7P ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_4]

loc_550C2:
		mov	di, [bp+arg_6]

loc_550C5:
		mov	eax, [si+4]
		mov	edx, [di+8]

loc_550CD:
		imul	edx

loc_550D0:
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [si+8]
		mov	edx, [di+4]
		imul	edx
		shrd	eax, edx, 8
		sub	ecx, eax
		mov	[bp+var_C], ecx
		mov	eax, [si+8]

loc_550F3:
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [si]
		mov	edx, [di+8]
		imul	edx
		shrd	eax, edx, 8
		sub	ecx, eax
		mov	[bp+var_8], ecx
		mov	eax, [si]
		mov	edx, [di+4]
		imul	edx

loc_55121:
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [si+4]
		mov	edx, [di]
		imul	edx

loc_55133:
		shrd	eax, edx, 8

loc_55138:
		sub	ecx, eax

loc_5513B:
		mov	[bp+var_4], ecx
		mov	si, [bp+arg_0]

loc_55142:
		or	si, si
		jz	short loc_5514A
		mov	ax, si
		jmp	short loc_55154
; ���������������������������������������������������������������������������

loc_5514A:				; CODE XREF: Vector_TransformHelperA_550B7+8Dj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_55154:				; CODE XREF: Vector_TransformHelperA_550B7+91j
		or	ax, ax
		jz	short loc_55173
		mov	eax, [bp+var_C]
		mov	[si], eax
		mov	eax, [bp+var_8]
		mov	[si+4],	eax
		mov	eax, [bp+var_4]
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_55175
; ���������������������������������������������������������������������������

loc_55173:				; CODE XREF: Vector_TransformHelperA_550B7+9Fj
		mov	ax, si

loc_55175:				; CODE XREF: Vector_TransformHelperA_550B7+BAj
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Vector_TransformHelperA_550B7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Targeting_ComputeGeometryHelperA_5505B et sub_559BB, référencée par sub_5F9B.
; ==============================================================================================
Targeting_ComputeGeometryHelperB_5517F	proc far		; CODE XREF: AI_InterceptSpeedControlLaw+EDP
					; Missile_PhysicsTick+414P ...

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
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [di]
		mov	[bp+var_2C], eax
		mov	eax, [di+4]
		mov	[bp+var_28], eax
		mov	eax, [di+8]

loc_551A0:
		mov	[bp+var_24], eax
		lea	ax, [bp+var_2C]
		push	ax
		nop
		push	cs

loc_551AA:
		call	near ptr Vector_Normalize3D_559BB
		pop	cx
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		lea	ax, [bp+var_2C]
		push	ax
		push	si
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp+var_2C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax

loc_551E3:
		mov	eax, [bp+var_28]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_24]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		cmp	word ptr [bp+var_4], 0
		jz	short loc_55226

loc_55221:
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_55231
; ���������������������������������������������������������������������������

loc_55226:				; CODE XREF: Targeting_ComputeGeometryHelperB_5517F+A0j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_55231:				; CODE XREF: Targeting_ComputeGeometryHelperB_5517F+A5j
		or	ax, ax

loc_55233:
		jz	short loc_55251
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_10]
		mov	[bx], eax
		mov	eax, [bp+var_18]
		mov	[bx+4],	eax
		mov	eax, [bp+var_20]
		mov	[bx+8],	eax
		jmp	short $+2

loc_55251:				; CODE XREF: Targeting_ComputeGeometryHelperB_5517F:loc_55233j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Targeting_ComputeGeometryHelperB_5517F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_4D04E (proche de ChaseCamera_RenderEffect) — appelle
; Targeting_ComputeGeometryHelperB_5517F.
; ==============================================================================================
ChaseCamera_ComputeGeometryHelper_5525B	proc far		; CODE XREF: Particle_SpawnWithColor+82P
					; Elements_SpawnAlongSegment_4D1C9+3B2P

var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	dx, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		mov	si, dx
		push	[bp+arg_6]
		push	dx
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		push	cs
		call	near ptr Targeting_ComputeGeometryHelperB_5517F
		add	sp, 8
		mov	eax, [si]
		sub	eax, [bp+var_10]
		mov	[bp+var_1C], eax
		mov	eax, [si+4]
		sub	eax, [bp+var_C]
		mov	[bp+var_18], eax
		mov	eax, [si+8]
		sub	eax, [bp+var_8]
		mov	[bp+var_14], eax
		cmp	word ptr [bp+var_4], 0
		jz	short loc_552AD

loc_552A8:
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_552B8
; ���������������������������������������������������������������������������

loc_552AD:				; CODE XREF: ChaseCamera_ComputeGeometryHelper_5525B+4Bj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_552B8:				; CODE XREF: ChaseCamera_ComputeGeometryHelper_5525B+50j
		or	ax, ax
		jz	short loc_552D8
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_1C]
		mov	[bx], eax
		mov	eax, [bp+var_18]
		mov	[bx+4],	eax
		mov	eax, [bp+var_14]

loc_552D2:
		mov	[bx+8],	eax
		jmp	short $+2

loc_552D8:				; CODE XREF: ChaseCamera_ComputeGeometryHelper_5525B+5Fj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
ChaseCamera_ComputeGeometryHelper_5525B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée massivement depuis le cœur IA (seg002/seg003) — combine longueur vectorielle
; (55920/55ED8/54F57) et arccos/arcsin (54A76/54A0E) : calcul d'angle entre deux vecteurs
; (aspect/bearing).
; ==============================================================================================
Math_AngleBetweenVectors_552E1	proc far		; CODE XREF: seg002:0A01P seg003:0375P ...

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

		push	bp
		mov	bp, sp

loc_552E4:
		sub	sp, 30h
		push	si
		mov	dx, [bp+arg_4]
		mov	si, dx
		mov	eax, [si]
		mov	[bp+var_30], eax
		mov	eax, [si+4]
		mov	[bp+var_2C], eax
		mov	eax, [si+8]
		mov	[bp+var_28], eax
		push	large 3E8h
		lea	ax, [bp+var_30]
		push	ax
		nop
		push	cs
		call	near ptr Math_VectorLengthUnscaled_55920
		add	sp, 6
		mov	eax, [bp+var_30]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_2C]

loc_55322:
		mov	[bp+var_8], eax

loc_55326:
		lea	ax, [bp+var_C]
		push	ax
		push	ss

loc_5532B:
		lea	ax, [bp+var_10]
		push	ax
		nop
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_Variant_55ED8
		add	sp, 6
		mov	eax, [bp+var_28]
		or	eax, eax
		jge	short loc_55343
		neg	eax

loc_55343:				; CODE XREF: Math_AngleBetweenVectors_552E1+5Dj
		mov	[bp+var_14], eax
		lea	ax, [bp+var_30]
		push	ax
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		cmp	[bp+var_18], 0
		jnz	short loc_5536C
		mov	[bp+var_1C], 2D000h
		mov	eax, [bp+var_1C]
		jmp	short loc_553B8
; ���������������������������������������������������������������������������

loc_5536C:				; CODE XREF: Math_AngleBetweenVectors_552E1+7Bj
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_14]
		jle	short loc_55391
		lea	ax, [bp+var_18]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	Math_ArcCosOfRatio_54A76
		add	sp, 8
		mov	eax, [bp+var_20]
		jmp	short loc_553B8
; ���������������������������������������������������������������������������

loc_55391:				; CODE XREF: Math_AngleBetweenVectors_552E1+93j
		lea	ax, [bp+var_18]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	Math_ArcSinOfRatio_54A0E

loc_553A3:
		add	sp, 8

loc_553A6:
		mov	eax, [bp+var_24]

loc_553AA:
		mov	[bp+var_4], eax

loc_553AE:
		cmp	[bp+var_28], 0
		jge	short loc_553BC

loc_553B5:
		neg	eax

loc_553B8:				; CODE XREF: Math_AngleBetweenVectors_552E1+89j
					; Math_AngleBetweenVectors_552E1+AEj
		mov	[bp+var_4], eax

loc_553BC:				; CODE XREF: Math_AngleBetweenVectors_552E1+D2j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]

loc_553C3:
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Math_AngleBetweenVectors_552E1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 209 lignes, NON DÉTAILLÉE — référencée par AI_ManeuverSolution_Major_6977 ;
; multiples appels à Math_ArcCosOfRatio_54A76/Math_ArcSinOfRatio_54A0E — probable calcul
; d'angles d'approche/manœuvre. Candidat pour session dédiée.
; ==============================================================================================
AI_ComputeApproachAngles_553CF	proc far		; CODE XREF: AI_ManeuverSolution_Major+F7P
					; AI_ManeuverSolution_Major+109P ...

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
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, si
		mov	eax, [di]
		mov	[bp+var_48], eax
		mov	eax, [di+4]
		mov	[bp+var_44], eax
		mov	eax, [di+8]
		mov	[bp+var_40], eax
		push	large 3E8h
		lea	ax, [bp+var_48]
		push	ax
		nop
		push	cs
		call	near ptr Math_VectorLengthUnscaled_55920
		add	sp, 6
		mov	[bp+var_40], 0
		lea	ax, [bp+var_48]
		push	ax
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		mov	eax, [si]
		or	eax, eax
		jge	short loc_55428
		neg	eax

loc_55428:				; CODE XREF: AI_ComputeApproachAngles_553CF+54j
		mov	[bp+var_C], eax
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_55438

loc_55435:
		neg	eax

loc_55438:				; CODE XREF: AI_ComputeApproachAngles_553CF+64j
		mov	[bp+var_10], eax
		cmp	[bp+var_8], 0
		jnz	short loc_5546C
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_5544E
		mov	ax, si
		jmp	short loc_55458
; ���������������������������������������������������������������������������

loc_5544E:				; CODE XREF: AI_ComputeApproachAngles_553CF+79j
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_55458:				; CODE XREF: AI_ComputeApproachAngles_553CF+7Dj
		or	ax, ax
		jz	short loc_55467
		mov	dword ptr [si],	2D000h
		mov	ax, si
		jmp	short loc_55469
; ���������������������������������������������������������������������������

loc_55467:				; CODE XREF: AI_ComputeApproachAngles_553CF+8Bj
		mov	ax, si

loc_55469:				; CODE XREF: AI_ComputeApproachAngles_553CF+96j
		jmp	loc_55544
; ���������������������������������������������������������������������������

loc_5546C:				; CODE XREF: AI_ComputeApproachAngles_553CF+72j
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_C]
		jl	short loc_554F1
		cmp	dword ptr [si+4], 0
		jl	short loc_55499
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		call	Math_ArcCosOfRatio_54A76
		add	sp, 8
		mov	eax, [bp+var_14]
		jmp	loc_55536
; ���������������������������������������������������������������������������

loc_55499:				; CODE XREF: AI_ComputeApproachAngles_553CF+ACj
		cmp	dword ptr [si],	0
		jl	short loc_554C8

loc_5549F:
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_48]
		push	ax

loc_554A7:
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		call	Math_ArcCosOfRatio_54A76
		add	sp, 8
		mov	eax, 0B400h
		sub	eax, [bp+var_18]
		mov	[bp+var_1C], eax

loc_554C2:
		mov	[bp+var_20], eax
		jmp	short loc_55536
; ���������������������������������������������������������������������������

loc_554C8:				; CODE XREF: AI_ComputeApproachAngles_553CF+CEj
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	Math_ArcCosOfRatio_54A76
		add	sp, 8
		mov	eax, 0FFFF4C00h
		sub	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		jmp	short loc_55536
; ���������������������������������������������������������������������������

loc_554F1:				; CODE XREF: AI_ComputeApproachAngles_553CF+A5j
		cmp	dword ptr [si],	0
		jl	short loc_55512
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		push	ss
		lea	ax, [bp+var_30]
		push	ax
		call	Math_ArcSinOfRatio_54A0E
		add	sp, 8
		mov	eax, [bp+var_30]
		jmp	short loc_55536
; ���������������������������������������������������������������������������

loc_55512:				; CODE XREF: AI_ComputeApproachAngles_553CF+126j
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_44]
		push	ax
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		call	Math_ArcSinOfRatio_54A0E
		add	sp, 8
		mov	eax, [bp+var_34]
		neg	eax
		mov	[bp+var_38], eax

loc_55532:
		mov	[bp+var_3C], eax

loc_55536:				; CODE XREF: AI_ComputeApproachAngles_553CF+C7j
					; AI_ComputeApproachAngles_553CF+F7j ...
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax

loc_55544:				; CODE XREF: AI_ComputeApproachAngles_553CF:loc_55469j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
AI_ComputeApproachAngles_553CF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, construit un vecteur direction 2D à partir d'un angle (cos/sin bruts,
; sub_58063/sub_580A7). Référencée par sub_781D0.
; ==============================================================================================
Missile_ComputeDirectionVector2D_5554E	proc far		; CODE XREF: CameraScript_ExecuteCOMP_781D0+713P
					; PlayerComponent_ComputeImpactResponse_A089D+133P

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, si
		add	ax, 4
		mov	[bp+var_6], ax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_4], eax
		mov	eax, [di]
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		push	eax
		call	Math_Cos_Raw_58063
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_A], eax
		push	large [bp+var_E]
		call	Math_Sin_Raw_580A7
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_E], eax

loc_5559F:
		mov	eax, [si+4]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	eax, [si+8]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		add	[si+4],	eax
		mov	eax, [si+8]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8],	eax
		mov	eax, [bp+var_4]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		sub	[si+8],	eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Missile_ComputeDirectionVector2D_5554E	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+6]

loc_55620:
		mov	di, [bp+8]

loc_55623:
		mov	[bp-6],	si

loc_55626:
		mov	bx, [bp-6]
		mov	eax, [bx]
		mov	[bp-4],	eax
		mov	eax, [di]
		mov	[bp-0Eh], eax
		mov	[bp-0Ah], eax
		push	eax
		call	Math_Cos_Raw_58063
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp-0Ah], eax
		push	large dword ptr	[bp-0Eh]
		call	Math_Sin_Raw_580A7
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp-0Eh], eax
		mov	eax, [si]
		mov	edx, [bp-0Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+8]
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		mov	edx, [bp-0Ah]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		sub	[si], eax
		mov	eax, [si+8]
		mov	edx, [bp-0Eh]
		imul	edx

loc_556A1:
		shrd	eax, edx, 8
		mov	[si+8],	eax
		mov	eax, [bp-4]
		mov	[bp-12h], eax

loc_556B2:
		mov	eax, [bp-12h]
		mov	edx, [bp-0Ah]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		add	[si+8],	eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de Missile_ComputeDirectionVector2D_5554E, référencée par seg008
; (physique/guidage de missile).
; ==============================================================================================
Missile_ComputeDirectionVector2D_556D4	proc far		; CODE XREF: seg008:0A0AP seg008:0A34P ...

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_6], si
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_4], eax
		mov	eax, [di]
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		push	eax
		call	Math_Cos_Raw_58063
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_A], eax
		push	large [bp+var_E]
		call	Math_Sin_Raw_580A7
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_E], eax
		mov	eax, [si]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8

loc_5572F:
		mov	[si], eax

loc_55732:
		mov	eax, [si+4]

loc_55736:
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		add	[si], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	eax, [bp+var_4]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		sub	[si+4],	eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Missile_ComputeDirectionVector2D_556D4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, teste si une composante dépasse un seuil et retourne le nombre de bits à décaler pour
; éviter un débordement — utilisé uniquement par Math_VectorLength3D_Scaled_54F57 et
; apparentés.
; ==============================================================================================
Math_VectorLength_ShiftDownIfLarge_55793	proc far		; CODE XREF: Math_VectorLength3D_Scaled_54F57+48p
					; Vector_Normalize3D_559BB+11p ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		or	eax, eax

loc_557A3:
		jge	short loc_557A8
		neg	eax

loc_557A8:				; CODE XREF: Math_VectorLength_ShiftDownIfLarge_55793:loc_557A3j
		mov	[bp+var_C], eax

loc_557AC:
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_557B8
		neg	eax

loc_557B8:				; CODE XREF: Math_VectorLength_ShiftDownIfLarge_55793+20j
		mov	[bp+var_8], eax
		mov	eax, [si+8]
		or	eax, eax
		jge	short loc_557C8
		neg	eax

loc_557C8:				; CODE XREF: Math_VectorLength_ShiftDownIfLarge_55793+30j
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		or	eax, [bp+var_8]
		or	eax, [bp+var_4]
		jnz	short loc_557DF
		mov	ax, 1
		jmp	short loc_557E1
; ���������������������������������������������������������������������������

loc_557DF:				; CODE XREF: Math_VectorLength_ShiftDownIfLarge_55793+45j
		xor	ax, ax

loc_557E1:				; CODE XREF: Math_VectorLength_ShiftDownIfLarge_55793+4Aj
		or	al, al
		jz	short loc_557E9
		mov	al, 0
		jmp	short loc_55865
; ���������������������������������������������������������������������������

loc_557E9:				; CODE XREF: Math_VectorLength_ShiftDownIfLarge_55793+50j
		mov	dl, 0
		jmp	short loc_55814
; ���������������������������������������������������������������������������

loc_557ED:				; CODE XREF: Math_VectorLength_ShiftDownIfLarge_55793+A9j
		mov	cl, [bp+arg_6]
		mov	eax, [bp+var_C]
		shl	eax, cl
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		shl	eax, cl
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		shl	eax, cl
		mov	[bp+var_4], eax
		add	dl, [bp+arg_6]

loc_55814:				; CODE XREF: Math_VectorLength_ShiftDownIfLarge_55793+58j
		mov	eax, [bp+arg_2]
		shl	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_5583E
		mov	eax, [bp+arg_2]

loc_55826:
		shl	eax, 8

loc_5582A:
		cmp	eax, [bp+var_8]
		jle	short loc_5583E

loc_55830:
		mov	eax, [bp+arg_2]
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jg	short loc_557ED

loc_5583E:				; CODE XREF: Math_VectorLength_ShiftDownIfLarge_55793+8Dj
					; Math_VectorLength_ShiftDownIfLarge_55793+9Bj
		or	dl, dl
		jz	short loc_55863
		mov	eax, [si]
		mov	cl, dl
		shl	eax, cl
		mov	[si], eax
		mov	eax, [si+4]
		shl	eax, cl
		mov	[si+4],	eax
		mov	eax, [si+8]
		shl	eax, cl
		mov	[si+8],	eax

loc_55863:				; CODE XREF: Math_VectorLength_ShiftDownIfLarge_55793+ADj
		mov	al, dl

loc_55865:				; CODE XREF: Math_VectorLength_ShiftDownIfLarge_55793+54j
		pop	si
		leave
		retf
Math_VectorLength_ShiftDownIfLarge_55793	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante symétrique de Math_VectorLength_ShiftDownIfLarge — décalage vers le haut si
; les valeurs sont trop petites (précision).
; ==============================================================================================
Math_VectorLength_ShiftUpIfSmall_55868	proc far		; CODE XREF: Math_VectorLength3D_Scaled_54F57+65p
					; Math_VectorLengthUnscaled_55920:loc_5592Fp	...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		or	eax, eax
		jge	short loc_5587D
		neg	eax

loc_5587D:				; CODE XREF: Math_VectorLength_ShiftUpIfSmall_55868+10j
		mov	[bp+var_4], eax
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_5588D
		neg	eax

loc_5588D:				; CODE XREF: Math_VectorLength_ShiftUpIfSmall_55868+20j
		mov	[bp+var_8], eax
		mov	eax, [si+8]
		or	eax, eax
		jge	short loc_5589D
		neg	eax

loc_5589D:				; CODE XREF: Math_VectorLength_ShiftUpIfSmall_55868+30j
		mov	[bp+var_C], eax
		mov	dl, 0
		jmp	short loc_558CC
; ���������������������������������������������������������������������������

loc_558A5:				; CODE XREF: Math_VectorLength_ShiftUpIfSmall_55868+70j
					; Math_VectorLength_ShiftUpIfSmall_55868+7Ej ...
		mov	cl, [bp+arg_6]
		mov	eax, [bp+var_4]
		sar	eax, cl
		mov	[bp+var_4], eax
		mov	eax, [bp+var_8]
		sar	eax, cl
		mov	[bp+var_8], eax
		mov	eax, [bp+var_C]
		sar	eax, cl
		mov	[bp+var_C], eax
		add	dl, [bp+arg_6]

loc_558CC:				; CODE XREF: Math_VectorLength_ShiftUpIfSmall_55868+3Bj
		mov	eax, [bp+arg_2]
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jl	short loc_558A5
		mov	eax, [bp+arg_2]
		shl	eax, 8
		cmp	eax, [bp+var_8]
		jl	short loc_558A5
		mov	eax, [bp+arg_2]
		shl	eax, 8
		cmp	eax, [bp+var_C]
		jl	short loc_558A5
		or	dl, dl
		jz	short loc_5591B
		mov	eax, [si]
		mov	cl, dl
		sar	eax, cl
		mov	[si], eax
		mov	eax, [si+4]
		sar	eax, cl
		mov	[si+4],	eax
		mov	eax, [si+8]
		sar	eax, cl
		mov	[si+8],	eax

loc_5591B:				; CODE XREF: Math_VectorLength_ShiftUpIfSmall_55868+90j
		mov	al, dl
		pop	si
		leave
		retf
Math_VectorLength_ShiftUpIfSmall_55868	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante simplifiée de calcul de longueur vectorielle (référencée par sub_552E1).
; ==============================================================================================
Math_VectorLengthUnscaled_55920	proc far		; CODE XREF: Math_AngleBetweenVectors_552E1+2Fp
					; AI_ComputeApproachAngles_553CF+30p ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp

loc_55921:
		mov	bp, sp

loc_55923:
		push	si
		mov	si, [bp+arg_0]
		push	3
		push	large [bp+arg_2]

loc_5592D:
		push	si
		push	cs

loc_5592F:
		call	near ptr Math_VectorLength_ShiftUpIfSmall_55868

loc_55932:
		add	sp, 8
		mov	ax, si
		pop	si
		pop	bp
		retf
Math_VectorLengthUnscaled_55920	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par Targeting_AcquireBestThreat (sub_3314) — utilise sub_5828E (longueur
; vectorielle), probable test de ligne de vue/distance vers une cible.
; ==============================================================================================
Targeting_LineOfSightCheck_5593A	proc far		; CODE XREF: Targeting_AcquireBestThreat+722P
					; Targeting_AcquireBestThreat+822P ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	large dword ptr	[si+8]
		push	large dword ptr	[si+4]
		push	large dword ptr	[si]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_559B6
		mov	eax, [si]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+4],	eax
		mov	eax, [si+8]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+8],	eax

loc_559B6:				; CODE XREF: Targeting_LineOfSightCheck_5593A+2Ej
		mov	ax, si
		pop	si
		leave
		retf
Targeting_LineOfSightCheck_5593A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg116 L1587-1640. Nom hérité 'TransformHelperB' FAUX : c'est une NORMALISATION 3D (pas
; une rotation). Math_VectorLength_ShiftDownIfLarge_55793(si,0x10,1) (mise à l'échelle si
; grand) ; Math_VectorLength3D_Scaled_54F57(si) -> longueur ; puis si[0]/=len, si[4]/=len,
; si[8]/=len -> vecteur unitaire (24.8, norme = 0x100). Utilisé par le cluster matrice
; (Matrix_ApplyToVectorX/Y/Z, 3x chacun = orthonormalisation) et par
; Aero_ComputeDragWithFeedback (direction de traînée).
; ==============================================================================================
Vector_Normalize3D_559BB	proc far		; CODE XREF: AI_ManeuverSolution_Major+B3P
					; AI_ManeuverSolution_Major+2D4P ...

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	large 10h
		push	si
		push	cs
		call	near ptr Math_VectorLength_ShiftDownIfLarge_55793
		add	sp, 8
		push	si
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		cmp	[bp+var_4], 0
		jz	short loc_55A32
		mov	eax, [si]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+4],	eax
		mov	eax, [si+8]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+8],	eax

loc_55A32:				; CODE XREF: Vector_Normalize3D_559BB+29j
		mov	ax, si
		pop	si
		leave
		retf
Vector_Normalize3D_559BB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_29A7D (rôle exact non détaillé, hors cluster identifié).
; ==============================================================================================
Utility_Helper_55A37	proc far		; CODE XREF: Mesh_FacePrepareIndirect+D9P
					; Terrain_StreamingMain+709P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		neg	eax
		mov	[si], eax
		mov	eax, [si+4]
		neg	eax
		mov	[si+4],	eax
		mov	eax, [si+8]
		neg	eax
		mov	[si+8],	eax
		mov	ax, si
		pop	si
		pop	bp
		retf
Utility_Helper_55A37	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_3844F (rôle exact non détaillé).
; ==============================================================================================
Utility_Helper_55A62	proc far		; CODE XREF: Debris_SpawnAtAttachPoint+5DP
					; Debris_SpawnOrchestrator+247P

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ecx, [bp+arg_2]
		mov	eax, [si]
		imul	ecx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+4]
		imul	ecx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	eax, [si+8]
		imul	ecx
		shrd	eax, edx, 8
		mov	[si+8],	eax
		pop	si
		pop	bp
		retf
Utility_Helper_55A62	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée depuis seg014/seg015 (UI cockpit), appelle Targeting_LineOfSightCheck_5593A.
; ==============================================================================================
UI_ApplyLineOfSightCheck_55A9E	proc far		; CODE XREF: seg014:0235P seg015:0978P ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_55AA1:
		sub	sp, 4
		push	si
		push	di

loc_55AA6:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr Targeting_LineOfSightCheck_5593A
		pop	cx
		cmp	dword ptr [di],	100h
		jz	short loc_55AFE
		mov	[bp+var_2], di
		mov	eax, [si]
		mov	bx, [bp+var_2]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	[bp+var_4], di
		mov	eax, [si+4]
		mov	bx, [bp+var_4]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	eax, [si+8]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8],	eax

loc_55AFE:				; CODE XREF: UI_ApplyLineOfSightCheck_55A9E+1Bj
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
UI_ApplyLineOfSightCheck_55A9E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée depuis seg015 (UI cockpit), appelle Math_VectorLengthUnscaled_55920.
; ==============================================================================================
UI_ApplyVectorLength_55B04	proc far		; CODE XREF: seg015:03ACP
					; Radar_Project3DToScreen:loc_16A4EP	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	large 100h
		push	ax
		push	cs
		call	near ptr Math_VectorLengthUnscaled_55920
		add	sp, 6
		pop	bp
		retf
UI_ApplyVectorLength_55B04	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 134 lignes, NON DÉTAILLÉE — référencée par Targeting_AcquireBestThreat (sub_3314) ;
; combine Math_VectorLengthUnscaled_55920 ×2, Math_VectorLength3D_Scaled_54F57 ×2,
; Targeting_ComputeGeometryHelperA_5505B, Math_ArcSinOfRatio_54A0E — probable calcul de
; gisement/élévation vers une cible.
; ==============================================================================================
Targeting_ComputeBearingElevation_55B1A	proc far		; CODE XREF: Targeting_AcquireBestThreat+3ECP
					; Targeting_AcquireBestThreat+571P ...

var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		mov	bx, [bp+arg_4]
		mov	si, bx
		mov	eax, [si]
		mov	[bp+var_20], eax
		mov	eax, [si+4]
		mov	[bp+var_1C], eax
		mov	eax, [si+8]
		mov	[bp+var_18], eax
		mov	si, [bp+arg_6]
		mov	eax, [si]
		mov	[bp+var_2C], eax
		mov	eax, [si+4]
		mov	[bp+var_28], eax
		mov	eax, [si+8]
		mov	[bp+var_24], eax
		push	large 3E8h
		lea	ax, [bp+var_20]
		push	ax
		push	cs
		call	near ptr Math_VectorLengthUnscaled_55920
		add	sp, 6
		push	large 3E8h
		lea	ax, [bp+var_2C]
		push	ax
		push	cs
		call	near ptr Math_VectorLengthUnscaled_55920
		add	sp, 6
		lea	ax, [bp+var_20]
		push	ax
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		lea	ax, [bp+var_2C]
		push	ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax

loc_55BAD:
		mov	eax, [bp+var_10]

loc_55BB1:
		mov	[bp+var_4], eax

loc_55BB5:
		cmp	[bp+var_4], 0
		jnz	short loc_55BE4
		mov	si, word ptr [bp+arg_0]
		or	si, si
		jz	short loc_55BC7
		mov	ax, si
		jmp	short loc_55BD1
; ���������������������������������������������������������������������������

loc_55BC7:				; CODE XREF: Targeting_ComputeBearingElevation_55B1A+A7j
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_55BD1:				; CODE XREF: Targeting_ComputeBearingElevation_55B1A+ABj
		or	ax, ax
		jz	short loc_55BE0
		mov	dword ptr [si],	0
		mov	ax, si
		jmp	short loc_55BE2
; ���������������������������������������������������������������������������

loc_55BE0:				; CODE XREF: Targeting_ComputeBearingElevation_55B1A+B9j
		mov	ax, si

loc_55BE2:				; CODE XREF: Targeting_ComputeBearingElevation_55B1A+C4j
		jmp	short loc_55C0C
; ���������������������������������������������������������������������������

loc_55BE4:				; CODE XREF: Targeting_ComputeBearingElevation_55B1A+A0j
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_2C]
		push	ax
		lea	ax, [bp+var_20]
		push	ax
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_5505B
		add	sp, 8
		lea	ax, [bp+var_14]
		push	ax
		push	large [bp+arg_0]
		call	Math_ArcSinOfRatio_54A0E
		add	sp, 8

loc_55C0C:				; CODE XREF: Targeting_ComputeBearingElevation_55B1A:loc_55BE2j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
Targeting_ComputeBearingElevation_55B1A	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	dx, [bp+0Ah]

loc_55C20:
		mov	eax, [bp+6]

loc_55C24:
		mov	[bp-4],	eax

loc_55C28:
		mov	si, dx
		mov	di, [bp+0Ch]

loc_55C2D:
		mov	eax, [si]
		sub	eax, [di]

loc_55C33:
		mov	[bp-14h], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp-10h], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp-0Ch], eax
		mov	eax, [bp-14h]
		mov	[bp-20h], eax
		mov	eax, [bp-10h]
		mov	[bp-1Ch], eax
		mov	eax, [bp-0Ch]
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
		mov	bx, [bp-4]
		mov	[bx], eax
		mov	es, word ptr [bp-2]
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+0Ah]
		cmp	dword ptr [si+4], 0
		jz	short loc_55CF2
		mov	di, si

loc_55CA8:
		add	di, 4

loc_55CAB:
		mov	eax, [si+8]
		mov	edx, eax

loc_55CB2:
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		mov	[bp-0Ch], eax
		neg	eax
		mov	[bp-10h], eax
		mov	[bp-14h], eax
		lea	ax, [bp-14h]
		push	ax
		push	ss
		lea	ax, [bp-18h]
		push	ax
		call	Math_ArcTan_54ADE
		add	sp, 6
		mov	eax, [bp-18h]

loc_55CEC:				; CODE XREF: seg116:0E45j seg116:0E5Aj
		mov	[bp-4],	eax
		jmp	short loc_55D24
; ���������������������������������������������������������������������������

loc_55CF2:				; CODE XREF: seg116:0DE4j
		cmp	dword ptr [si+8], 0
		jle	short loc_55D07
		mov	dword ptr [bp-1Ch], 0FFFFA600h
		mov	eax, [bp-1Ch]
		jmp	short loc_55CEC
; ���������������������������������������������������������������������������

loc_55D07:				; CODE XREF: seg116:0E37j
		cmp	dword ptr [si+8], 0
		jge	short loc_55D1C
		mov	dword ptr [bp-20h], 5A00h
		mov	eax, [bp-20h]
		jmp	short loc_55CEC
; ���������������������������������������������������������������������������

loc_55D1C:				; CODE XREF: seg116:0E4Cj
		mov	dword ptr [bp-4], 0

loc_55D24:				; CODE XREF: seg116:0E30j
		mov	bx, [bp+6]
		mov	eax, [bp-4]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+0Ah]
		push	large dword ptr	[si+8]
		push	large dword ptr	[si+4]
		push	large dword ptr	[si]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-0Ch], eax
		mov	[bp-10h], eax
		mov	[bp-8],	eax
		cmp	dword ptr [bp-8], 0
		jle	short loc_55D99
		lea	ax, [bp-8]
		push	ax
		mov	eax, [si]
		neg	eax
		mov	[bp-14h], eax
		mov	[bp-18h], eax
		lea	ax, [bp-18h]
		push	ax
		push	ss
		lea	ax, [bp-1Ch]
		push	ax
		call	Math_ArcCosOfRatio_54A76
		add	sp, 8
		mov	eax, [bp-1Ch]
		mov	[bp-4],	eax
		jmp	short loc_55DA1
; ���������������������������������������������������������������������������

loc_55D99:				; CODE XREF: seg116:0EAAj
		mov	dword ptr [bp-4], 0

loc_55DA1:				; CODE XREF: seg116:0ED7j
		mov	bx, [bp+6]
		mov	eax, [bp-4]
		mov	[bx], eax

loc_55DAB:
		mov	dx, [bp+8]

loc_55DAE:
		mov	ax, [bp+6]
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_315B (rôle exact non détaillé).
; ==============================================================================================
Utility_Helper_55DB4	proc far		; CODE XREF: AI_ProximityGeometricWarning_315B+185P
					; Terrain_QueryAltitudeAt+19P ...

var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]
		mov	[si], eax
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[si+4],	eax
		mov	ax, [bp+arg_6]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[si+8],	eax
		pop	si
		leave
		retf
Utility_Helper_55DB4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_838BF (rôle exact non détaillé).
; ==============================================================================================
Utility_Helper_55E11	proc far		; CODE XREF: HUDSymbol_ConstructAndInitAngleC_838BF+CBP
					; MissionText_ConstructFullOrientation_97A2D:loc_97AA0P

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]

loc_55E1F:
		mov	[bp+var_4], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si], eax

loc_55E32:
		mov	eax, [bp+arg_6]
		mov	[bp+var_C], eax
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[si+4],	eax
		mov	eax, [bp+arg_A]
		mov	[bp+var_14], eax
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[si+8],	eax
		pop	si
		leave
		retf
Utility_Helper_55E11	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_2B0F2 (rôle exact non détaillé).
; ==============================================================================================
Utility_Helper_55E65	proc far		; CODE XREF: ListItem_ConstructThreeParams+37P
					; Aero_ComputeForcesMain_4791E+4F9P ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[si], eax
		mov	eax, [bp+arg_6]
		mov	[si+4],	eax
		mov	eax, [bp+arg_A]
		mov	[si+8],	eax
		pop	si
		pop	bp
		retf
Utility_Helper_55E65	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		mov	si, [bp+6]
		push	3
		mov	ax, si
		add	ax, 8
		push	ax
		lea	ax, [bp-14h]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 4
		push	ax
		lea	ax, [bp-28h]
		push	ax

loc_55EB1:
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	3
		push	si
		lea	ax, [bp-3Ch]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	3754h
		call	CRT_Msg_NullPtrAssign
		add	sp, 8
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, même triplet d'appels (55793/55868/54BF1) que Math_VectorLength3D_Scaled_54F57 —
; probable duplicat/variante, NON vérifié en détail. Référencée par sub_469FE.
; ==============================================================================================
Math_VectorLength3D_Scaled_Variant_55ED8	proc far		; CODE XREF: Aero_FlowAngle_AoA_469FE+75P
					; Aero_FlowAngle_Sideslip_46AB5+75P ...

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_2], 0
		mov	eax, [si]
		or	eax, eax
		jge	short loc_55EF1
		neg	eax

loc_55EF1:				; CODE XREF: Math_VectorLength3D_Scaled_Variant_55ED8+14j
		mov	[bp+var_12], eax
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_55F01
		neg	eax

loc_55F01:				; CODE XREF: Math_VectorLength3D_Scaled_Variant_55ED8+24j
		mov	[bp+var_E], eax
		mov	[bp+var_A], 0
		push	1
		push	large 10h
		lea	ax, [bp+var_12]
		push	ax
		push	cs
		call	near ptr Math_VectorLength_ShiftDownIfLarge_55793
		add	sp, 8
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0

loc_55F24:
		jnz	short loc_55F3C

loc_55F26:
		push	1

loc_55F28:
		push	large 400h

loc_55F2E:
		lea	ax, [bp+var_12]
		push	ax
		push	cs

loc_55F33:
		call	near ptr Math_VectorLength_ShiftUpIfSmall_55868
		add	sp, 8
		mov	[bp+var_2], al

loc_55F3C:				; CODE XREF: Math_VectorLength3D_Scaled_Variant_55ED8:loc_55F24j
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_12]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_E]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		add	[bp+var_12], eax
		lea	ax, [bp+var_12]
		push	ax
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		cmp	[bp+var_1], 0
		jz	short loc_55F8F
		mov	cl, [bp+var_1]
		mov	eax, [bp+var_6]
		sar	eax, cl
		jmp	short loc_55F9F
; ���������������������������������������������������������������������������

loc_55F8F:				; CODE XREF: Math_VectorLength3D_Scaled_Variant_55ED8+A9j
		cmp	[bp+var_2], 0
		jz	short loc_55FA3
		mov	cl, [bp+var_2]
		mov	eax, [bp+var_6]
		shl	eax, cl

loc_55F9F:				; CODE XREF: Math_VectorLength3D_Scaled_Variant_55ED8+B5j
		mov	[bp+var_6], eax

loc_55FA3:				; CODE XREF: Math_VectorLength3D_Scaled_Variant_55ED8+BBj
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_6]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Math_VectorLength3D_Scaled_Variant_55ED8	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+6]
		mov	dword ptr [bp-4], 100h
		mov	di, si
		mov	eax, [di]
		or	eax, eax
		jge	short loc_55FD6
		neg	eax

loc_55FD6:				; CODE XREF: seg116:1111j
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		mov	[bp-10h], eax
		sar	eax, 8
		mov	[bp-8],	eax
		mov	di, si
		add	di, 4
		mov	eax, [di]
		or	eax, eax
		jge	short loc_55FFA
		neg	eax

loc_55FFA:				; CODE XREF: seg116:1135j
		mov	[bp-18h], eax
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		sar	eax, 8
		mov	[bp-14h], eax
		xor	dx, dx
		jmp	short loc_5602D
; ���������������������������������������������������������������������������

loc_56012:				; CODE XREF: seg116:1175j seg116:117Fj
		mov	eax, [bp-8]
		sar	eax, 3
		mov	[bp-8],	eax
		mov	eax, [bp-14h]
		sar	eax, 3
		mov	[bp-14h], eax
		add	dx, 3

loc_5602D:				; CODE XREF: seg116:1150j
		mov	eax, [bp-8]
		cmp	eax, [bp-4]
		jg	short loc_56012
		mov	eax, [bp-14h]
		cmp	eax, [bp-4]
		jg	short loc_56012
		or	dx, dx
		jz	short loc_5605B
		mov	eax, [si]
		mov	cl, dl
		sar	eax, cl
		mov	[si], eax
		mov	eax, [si+4]
		sar	eax, cl
		mov	[si+4],	eax

loc_5605B:				; CODE XREF: seg116:1183j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée depuis seg027 (UI) et en interne du segment, appelle sub_56215 et alloue
; (sub_658).
; ==============================================================================================
UI_ComputeScaledVector_56061	proc far		; CODE XREF: seg027:03FCP seg116:1293p

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
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [di]
		mov	[bp+var_8], eax
		add	di, 4
		mov	eax, [di]
		mov	[bp+var_4], eax
		lea	ax, [bp+var_8]
		push	ax
		nop
		push	cs
		call	near ptr UI_ComputeScaledVectorHelper_56215
		pop	cx
		mov	eax, [bp+arg_0]
		mov	[bp+var_C], eax
		mov	eax, [si]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8

loc_560A1:
		mov	[bp+var_10], eax

loc_560A5:
		mov	eax, [si+4]

loc_560A9:
		mov	edx, [bp+var_4]

loc_560AD:
		imul	edx

loc_560B0:
		shrd	eax, edx, 8
		add	eax, [bp+var_10]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		cmp	word ptr [bp+var_C], 0
		jz	short loc_56108
		mov	ax, word ptr [bp+var_C]
		jmp	short loc_56113
; ���������������������������������������������������������������������������

loc_56108:				; CODE XREF: UI_ComputeScaledVector_56061+A0j
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_C], ax

loc_56113:				; CODE XREF: UI_ComputeScaledVector_56061+A5j
		or	ax, ax
		jz	short loc_5612B
		mov	bx, word ptr [bp+var_C]
		mov	eax, [bp+var_1C]
		mov	[bx], eax
		mov	eax, [bp+var_24]
		mov	[bx+4],	eax
		jmp	short $+2

loc_5612B:				; CODE XREF: UI_ComputeScaledVector_56061+B4j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si

locret_56133:
		leave
		retf
UI_ComputeScaledVector_56061	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	dx, [bp+0Ah]
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		mov	si, dx
		push	word ptr [bp+0Ch]
		push	dx
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		push	cs
		call	near ptr UI_ComputeScaledVector_56061
		add	sp, 8
		mov	eax, [si]
		sub	eax, [bp-0Ch]
		mov	[bp-10h], eax
		mov	[bp-14h], eax
		mov	eax, [si+4]
		sub	eax, [bp-8]
		mov	[bp-18h], eax
		mov	[bp-1Ch], eax
		cmp	word ptr [bp-4], 0
		jz	short loc_56183
		mov	ax, [bp-4]
		jmp	short loc_5618E
; ���������������������������������������������������������������������������

loc_56183:				; CODE XREF: seg116:12BCj
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp-4],	ax

loc_5618E:				; CODE XREF: seg116:12C1j
		or	ax, ax
		jz	short loc_561A6
		mov	bx, [bp-4]
		mov	eax, [bp-14h]
		mov	[bx], eax
		mov	eax, [bp-1Ch]

loc_561A0:
		mov	[bx+4],	eax
		jmp	short $+2

loc_561A6:				; CODE XREF: seg116:12D0j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée deux fois par sub_526F, utilise sub_5828E (longueur vectorielle).
; ==============================================================================================
Weapon_ComputeVectorLength_561AF	proc far		; CODE XREF: Vec3_Negate+2FP Vec3_Negate+39P ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	large 0
		push	large dword ptr	[si+4]
		push	large dword ptr	[si]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_56210
		mov	eax, [si]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+4],	eax

loc_56210:				; CODE XREF: Weapon_ComputeVectorLength_561AF+2Dj
		mov	ax, si
		pop	si
		leave
		retf
Weapon_ComputeVectorLength_561AF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée depuis seg027/seg089 (audio 3D), combine
; Math_VectorLength_ShiftDownIfLarge_55793 et Math_VectorLength3D_Scaled_Variant_55ED8.
; ==============================================================================================
UI_ComputeScaledVectorHelper_56215	proc far		; CODE XREF: seg027:0393P seg089:009DP ...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]

loc_56222:
		mov	[bp+var_10], eax
		mov	eax, [si+4]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 0
		push	1
		push	large 10h
		lea	ax, [bp+var_10]
		push	ax
		push	cs
		call	near ptr Math_VectorLength_ShiftDownIfLarge_55793
		add	sp, 8
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	eax, [bp+var_C]
		mov	[si+4],	eax
		push	si
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_Variant_55ED8
		add	sp, 6
		cmp	[bp+var_4], 0
		jz	short loc_5629B
		mov	eax, [si]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+4],	eax

loc_5629B:				; CODE XREF: UI_ComputeScaledVectorHelper_56215+52j
		mov	ax, si
		pop	si
		leave
		retf
UI_ComputeScaledVectorHelper_56215	endp

; ���������������������������������������������������������������������������
		push	bp

loc_562A1:
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	eax, [si]
		neg	eax
		mov	[si], eax

loc_562B0:
		mov	eax, [si+4]

loc_562B4:
		neg	eax
		mov	[si+4],	eax
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	si
		push	cs
		call	near ptr Weapon_ComputeVectorLength_561AF
		pop	cx
		mov	[bp-2],	di
		mov	eax, [si]
		mov	bx, [bp-2]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par seg030 (zoom carte/radar) — longueur vectorielle (sub_5828E ×2) +
; Math_ArcSinOfRatio_54A0E : calcul de gisement vers un point de carte.
; ==============================================================================================
Map_ComputeBearingToPoint_56304	proc far		; CODE XREF: seg030:0431P

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
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		push	large 0
		push	large dword ptr	[si+4]
		push	large dword ptr	[si]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax

loc_56323:
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		push	large 0
		push	large dword ptr	[di+4]
		push	large dword ptr	[di]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_14]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_56379
		mov	bx, word ptr [bp+arg_0]
		mov	[bx], eax
		jmp	short loc_563BF
; ���������������������������������������������������������������������������

loc_56379:				; CODE XREF: Map_ComputeBearingToPoint_56304+6Bj
		lea	ax, [bp+var_4]
		push	ax
		mov	eax, [si]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [si+4]
		mov	edx, [di+4]
		imul	edx
		shrd	eax, edx, 8
		add	eax, [bp+var_1C]

loc_563A3:
		mov	[bp+var_1C], eax

loc_563A7:
		mov	eax, [bp+var_1C]

loc_563AB:
		mov	[bp+var_20], eax
		lea	ax, [bp+var_20]
		push	ax

loc_563B3:
		push	large [bp+arg_0]
		call	Math_ArcSinOfRatio_54A0E
		add	sp, 8

loc_563BF:				; CODE XREF: Map_ComputeBearingToPoint_56304+73j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Map_ComputeBearingToPoint_56304	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par seg097 (système de missile) — utilise sub_5828E (longueur vectorielle).
; ==============================================================================================
Missile_ComputeDistanceToTarget_563C9	proc far		; CODE XREF: seg097:00F8P

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
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	dx, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		mov	si, dx
		mov	di, [bp+arg_6]
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		add	di, 4
		mov	eax, [si+4]
		sub	eax, [di]
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		push	large 0
		push	eax
		push	large [bp+var_1C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_20], eax
		mov	bx, word ptr [bp+var_4]
		mov	[bx], eax
		mov	es, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Missile_ComputeDistanceToTarget_563C9	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		mov	si, [bp+6]
		push	3
		mov	ax, si
		add	ax, 4
		push	ax
		lea	ax, [bp-14h]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	3
		push	si
		lea	ax, [bp-28h]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	375Fh
		call	CRT_Msg_NullPtrAssign
		add	sp, 6
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par Damage_SimulationTick (sub_2BF6C, seg060) — helper de calcul de dommages
; (rôle exact non détaillé).
; ==============================================================================================
Damage_ComputeHelperA_5647A	proc far		; CODE XREF: Damage_SimulationTick+70EP

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	[si+28h], eax
		mov	[si+14h], eax
		mov	[si], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+2Ch], eax
		mov	[si+24h], eax
		mov	[si+20h], eax
		mov	[si+1Ch], eax
		mov	[si+18h], eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	[si+4],	eax
		pop	si
		leave
		retf
Damage_ComputeHelperA_5647A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par Damage_SimulationTick (sub_2BF6C) — appelle sub_58476 (fonction
; mathématique externe non identifiée).
; ==============================================================================================
Damage_ComputeHelperB_564CE	proc far		; CODE XREF: Damage_SimulationTick+76BP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	ax
		call	Math_VectorTransformByMatrix3x3_58476
		add	sp, 8
		pop	bp
		retf
Damage_ComputeHelperB_564CE	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	dx, [bp+0Ah]
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+0Ch]
		mov	[si+4],	eax
		mov	eax, [di+18h]
		mov	[si+8],	eax
		mov	bx, dx
		mov	eax, [bx]
		mov	[si+0Ch], eax
		mov	eax, [di+4]
		mov	[si+10h], eax
		mov	eax, [di+10h]
		mov	[si+14h], eax
		mov	eax, [di+1Ch]
		mov	[si+18h], eax
		mov	eax, [bx+4]
		mov	[si+1Ch], eax
		mov	eax, [di+8]
		mov	[si+20h], eax
		mov	eax, [di+14h]
		mov	[si+24h], eax
		mov	eax, [di+20h]
		mov	[si+28h], eax
		mov	eax, [bx+8]
		mov	[si+2Ch], eax
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 288 lignes, NON DÉTAILLÉE — référencée par Damage_SimulationTick (sub_2BF6C).
; Candidat pour session dédiée (probable calcul de propagation/répartition de dommages).
; ==============================================================================================
Damage_ComputeMainHelper_56559	proc far		; CODE XREF: Damage_SimulationTick+74FP

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si], eax

loc_565B2:
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+14h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+24h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+4]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+4],	eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+8]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+18h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+28h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+8],	eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+2Ch]
		imul	edx

loc_566A2:
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_2]
		add	eax, es:[bx+0Ch]
		mov	[si+0Ch], eax
		mov	eax, es:[bx+10h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+14h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+18h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+10h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+10h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+4]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+14h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+14h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+18h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+24h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+14h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+10h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+8]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+14h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+18h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+18h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+28h]

loc_567A2:
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+18h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+10h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+14h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+18h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+2Ch]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_2]
		add	eax, es:[bx+1Ch]
		mov	[si+1Ch], eax
		mov	eax, es:[bx+20h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+24h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+28h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+20h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+20h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+4]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+24h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+14h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+28h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+24h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+24h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+20h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+8]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+24h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+18h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+28h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+28h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+28h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+20h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+24h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+28h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+2Ch]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_2]
		add	eax, es:[bx+2Ch]
		mov	[si+2Ch], eax
		pop	si
		pop	bp
		retf
Damage_ComputeMainHelper_56559	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+0Ah]
		mov	si, [bp+0Ch]
		mov	eax, [di]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+4]
		mov	edx, [si+4]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+8]
		mov	edx, [si+8]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+6]
		mov	es:[bx], eax
		mov	eax, [di]
		mov	edx, [si+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+4]
		mov	edx, [si+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+8]
		mov	edx, [si+14h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	es:[bx+10h], eax
		mov	eax, [di]
		mov	edx, [si+18h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+4]
		mov	edx, [si+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+8]
		mov	edx, [si+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	es:[bx+20h], eax
		mov	eax, [di+0Ch]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+10h]
		mov	edx, [si+4]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+14h]
		mov	edx, [si+8]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	es:[bx+4], eax
		mov	eax, [di+0Ch]
		mov	edx, [si+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+10h]
		mov	edx, [si+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+14h]
		mov	edx, [si+14h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	es:[bx+14h], eax
		mov	eax, [di+0Ch]
		mov	edx, [si+18h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+10h]
		mov	edx, [si+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+14h]
		mov	edx, [si+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	es:[bx+24h], eax
		mov	eax, [di+18h]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+1Ch]
		mov	edx, [si+4]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+20h]
		mov	edx, [si+8]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	es:[bx+8], eax
		mov	eax, [di+18h]
		mov	edx, [si+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+1Ch]
		mov	edx, [si+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+20h]
		mov	edx, [si+14h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	es:[bx+18h], eax
		mov	eax, [di+18h]
		mov	edx, [si+18h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+1Ch]
		mov	edx, [si+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+20h]
		mov	edx, [si+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	es:[bx+28h], eax
		mov	bx, [bp+0Eh]
		mov	eax, [bx]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [bx+4]
		mov	edx, [si+4]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [bx+8]
		mov	edx, [si+8]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	bx, [bp+6]
		mov	es:[bx+0Ch], eax
		mov	bx, [bp+0Eh]
		mov	eax, [bx]
		mov	edx, [si+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [bx+4]
		mov	edx, [si+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [bx+8]
		mov	edx, [si+14h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	bx, [bp+6]
		mov	es:[bx+1Ch], eax
		mov	bx, [bp+0Eh]
		mov	eax, [bx]
		mov	edx, [si+18h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [bx+4]
		mov	edx, [si+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [bx+8]
		mov	edx, [si+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	bx, [bp+6]
		mov	es:[bx+2Ch], eax
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_2BE0A (voisin de Damage_SimulationTick).
; ==============================================================================================
Damage_ComputeHelperC_56C6A	proc far		; CODE XREF: Damage_UpdateHudIcon+27P

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [si]
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		mov	eax, [si+0Ch]
		mov	es:[bx+4], eax
		mov	eax, [si+18h]
		mov	es:[bx+8], eax
		mov	eax, [di]
		mov	es:[bx+0Ch], eax
		mov	eax, [si+4]
		mov	es:[bx+10h], eax
		mov	eax, [si+10h]
		mov	es:[bx+14h], eax
		mov	eax, [si+1Ch]
		mov	es:[bx+18h], eax
		mov	eax, [di+4]
		mov	es:[bx+1Ch], eax
		mov	eax, [si+8]
		mov	es:[bx+20h], eax
		mov	eax, [si+14h]
		mov	es:[bx+24h], eax
		mov	eax, [si+20h]
		mov	es:[bx+28h], eax
		mov	eax, [di+8]
		mov	es:[bx+2Ch], eax
		pop	di
		pop	si
		pop	bp
		retf
Damage_ComputeHelperC_56C6A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par seg108 (détection de changement de calibration) — deux sites d'appel.
; ==============================================================================================
Calibration_ComputeHelper_56CE5	proc far		; CODE XREF: seg108:00A6P seg108:00B8P ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		mov	es:[bx+28h], eax
		mov	es:[bx+14h], eax
		mov	es:[bx], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	es:[bx+2Ch], eax
		mov	es:[bx+24h], eax
		mov	es:[bx+20h], eax
		mov	es:[bx+1Ch], eax
		mov	es:[bx+18h], eax
		mov	es:[bx+10h], eax
		mov	es:[bx+0Ch], eax
		mov	es:[bx+8], eax
		mov	es:[bx+4], eax
		leave
		retf
Calibration_ComputeHelper_56CE5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par Formation_GuidanceSolution (sub_D081), alloue (sub_658) et appelle
; Matrix_BuildFromAngle_56D72.
; ==============================================================================================
Formation_ComputeGeometryHelper_56D43	proc far		; CODE XREF: Formation_GuidanceSolution+423P
					; Audio3D_ComputePan+BP	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_56D5C
		push	24h ; '$'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_56D6D

loc_56D5C:				; CODE XREF: Formation_ComputeGeometryHelper_56D43+9j
		mov	ax, si
		add	ax, 0Ch
		mov	ax, si
		add	ax, 18h
		push	si
		nop
		push	cs
		call	near ptr Matrix_BuildFromAngle_56D72
		pop	cx

loc_56D6D:				; CODE XREF: Formation_ComputeGeometryHelper_56D43+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
Formation_ComputeGeometryHelper_56D43	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par seg015 (UI cockpit) — probable construction de matrice de rotation à
; partir d'un angle.
; ==============================================================================================
Matrix_BuildFromAngle_56D72	proc far		; CODE XREF: seg015:0769P
					; WorldObject_BaseConstruct+53P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, dword_707D4
		mov	[si], eax
		mov	eax, dword_707D8
		mov	[si+4],	eax
		mov	eax, dword_707DC
		mov	[si+8],	eax
		mov	eax, dword_707E0
		mov	[si+0Ch], eax
		mov	eax, dword_707E4
		mov	[si+10h], eax
		mov	eax, dword_707E8
		mov	[si+14h], eax
		mov	eax, dword_707EC
		mov	[si+18h], eax
		mov	eax, dword_707F0
		mov	[si+1Ch], eax
		mov	eax, dword_707F4
		mov	[si+20h], eax
		mov	ax, si
		pop	si
		pop	bp
		retf
Matrix_BuildFromAngle_56D72	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par seg030/seg032 (carte/radar) — alloue (sub_658), appelle
; Matrix_ApplyToVector_57660.
; ==============================================================================================
Map_ApplyRotationTransform_56DC5	proc far		; CODE XREF: seg030:030EP seg032:0334P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_56DDF
		push	24h ; '$'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_56E23

loc_56DDF:				; CODE XREF: Map_ApplyRotationTransform_56DC5+Aj
		mov	ax, si
		add	ax, 0Ch
		mov	ax, si
		add	ax, 18h
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4],	eax
		mov	eax, [di+8]
		mov	[si+8],	eax
		mov	di, [bp+arg_4]
		mov	eax, [di]
		mov	[si+0Ch], eax
		mov	eax, [di+4]
		mov	[si+10h], eax
		mov	eax, [di+8]
		mov	[si+14h], eax
		push	si
		nop
		push	cs
		call	near ptr Matrix_ApplyToVectorY_57660
		pop	cx

loc_56E23:				; CODE XREF: Map_ApplyRotationTransform_56DC5+18j
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
Map_ApplyRotationTransform_56DC5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg116 L3896-3936 (relu intégralement, session 2026-09-05). PAS un calcul - une simple
; COPIE de structure : recopie 36 octets (3 vecteurs de 3 dword, aux offsets +0/+0xC/+0x18,
; même layout que les lignes de matrice de Matrix_BuildAxisX_56EC3) depuis arg_2 (source,
; typiquement la matrice d'orientation persistante de l'objet, obtenue via vtable[0x3C]) vers
; arg_0 (buffer local du buffer). Référencée par AI_ManeuverSolution_Major, et par
; PhysicsTicks (seg103) pour extraire une copie de travail de l'orientation avant les helpers
; géométriques (Targeting_ComputeGeometryHelperB_5517F, AI_ApplyAngleBetweenVectors_57C3A).
; ==============================================================================================
AI_ComputeGeometryHelper_56E29	proc far		; CODE XREF: AI_ManeuverSolution_Major+34AP
					; seg014:003BP	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, dx
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4],	eax
		mov	eax, [di+8]
		mov	[si+8],	eax
		mov	di, dx
		add	di, 0Ch
		mov	eax, [di]
		mov	[si+0Ch], eax
		mov	eax, [di+4]
		mov	[si+10h], eax
		mov	eax, [di+8]
		mov	[si+14h], eax
		mov	di, dx
		add	di, 18h
		mov	eax, [di]
		mov	[si+18h], eax
		mov	eax, [di+4]
		mov	[si+1Ch], eax
		mov	eax, [di+8]
		mov	[si+20h], eax
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
AI_ComputeGeometryHelper_56E29	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg116 L3964-4003 (relu 2026-09-05). Variante 'tableau' de
; Matrix_BuildFullOrientation_575B2 : arg_0 = matrice cible, arg_2 = ptr vers 3 dword angles
; consecutifs. Appelle Matrix_BuildAxisX_ApplyToObject_574B3(m, ptr+0), _AxisY_57508(m,
; ptr+4), _AxisZ_5755D(m, ptr+8) : composition INCREMENTALE des 3 rotations d'axe (seuil
; 0.21875 deg) sur la matrice. Appelee par la methode vtable
; WorldObject_ComposeOrientationAngleArray_3CB0B (matrice a objet+0x2C), par
; Camera_ChaseComputeMain (seg085, angles depuis dword_707F8/FC/70800 ou
; [obj+0x51]->vtable[0x24]), et par le cluster de manoeuvre IA ovr232. C'est le mecanisme
; generique de rotation d'objet.
; ==============================================================================================
WorldObject_BuildOrientationMatrix_56E8A	proc far		; CODE XREF: seg084:01EBP
					; Emitter_UpdateFromEntitySMOKVec_3D57E+2B2P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr Matrix_BuildAxisX_ApplyToObject_574B3
		add	sp, 4
		mov	ax, di
		add	ax, 4
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Matrix_BuildAxisY_ApplyToObject_57508
		add	sp, 4
		mov	ax, di
		add	ax, 8
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Matrix_BuildAxisZ_ApplyToObject_5755D
		add	sp, 4
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
WorldObject_BuildOrientationMatrix_56E8A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg116 L3998-4178 (relu intégralement, session 2026-09-05). Composition INCRÉMENTALE
; d'une rotation d'angle *arg_2 sur la matrice PROPRE et PERSISTANTE de l'objet si (PAS un
; calcul générique sans état) : row1=[si+0Ch/10h/14h], row2=[si+18h/1Ch/20h].
; sin=Math_Sin_5483F(angle), cos=Math_Cos_54876(angle). Formule exacte (row1_old sauvé dans
; var_44/40/3C avant écrasement) : row1_new = row1_old*sin(A) + row2_old*cos(A) ; row2_new =
; row2_old*sin(A) - row1_old*cos(A) (sin et cos inversés par rapport à une composition
; "standard" row*cos+row*sin - vérifié bit à bit, ne pas supposer l'inverse). Seuil de sortie
; anticipée (L4037-4045) : même motif scale-puis-unscale que Aero_ComputeForcesMain_4791E (mov
; 38h/shl8/.../sar8/cmp/jle) -> comparaison réelle contre 56 BRUT face à |angle| en 24.8
; (var_14/var_18=3800h, jamais relues ensuite - même sous-produit probable de macro FIXED que
; dans Aero_ComputeForcesMain_4791E, pas du code mort) (unité degré*256) : si |angle| <
; 56/256=0.21875°, retour immédiat sans toucher la matrice (pas de rotation appliquée -
; optimisation anti-bruit, aucun rapport avec l'aérodynamique). Référencée depuis
; seg014/seg015 (UI cockpit) et, via Matrix_BuildAxisX_ApplyToObject_574B3, par
; WorldObject_BuildOrientationMatrix_56E8A (objets du monde) et Camera_ChaseComputeMain
; (seg085) - usage confirmé pour la caméra et les scripts de manœuvre IA (ovr232), PAS encore
; trouvé pour la physique de l'avion joueur lui-même.
; ==============================================================================================
Matrix_BuildAxisX_56EC3	proc far		; CODE XREF: seg014:05CDP seg015:07B3P ...

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
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		or	eax, eax
		jge	short loc_56EDC
		neg	eax

loc_56EDC:				; CODE XREF: Matrix_BuildAxisX_56EC3+14j
		mov	[bp+var_C], eax
		mov	[bp+var_10], 38h ; '8'
		mov	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		sar	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_56F05
		jmp	loc_570BF
; ���������������������������������������������������������������������������

loc_56F05:				; CODE XREF: Matrix_BuildAxisX_56EC3+3Dj
		push	di
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	Math_Sin_5483F
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		push	di
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	Math_Cos_54876
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[bp+var_8], eax
		mov	di, si
		add	di, 0Ch
		mov	eax, [di]
		mov	[bp+var_44], eax
		mov	eax, [di+4]
		mov	[bp+var_40], eax
		mov	eax, [di+8]
		mov	[bp+var_3C], eax
		mov	eax, [si+0Ch]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+0Ch], eax
		mov	ax, si
		add	ax, 0Ch
		mov	eax, [si+10h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+10h], eax
		mov	ax, si
		add	ax, 10h
		mov	eax, [si+14h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+14h], eax
		mov	ax, si
		add	ax, 14h
		mov	di, si
		add	di, 18h
		mov	eax, [di]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		add	[si+0Ch], eax
		mov	eax, [bp+var_4C]
		add	[si+10h], eax
		mov	eax, [bp+var_48]
		add	[si+14h], eax
		mov	eax, [si+18h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+18h], eax
		mov	ax, si
		add	ax, 18h
		mov	eax, [si+1Ch]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+1Ch], eax
		mov	ax, si
		add	ax, 1Ch
		mov	eax, [si+20h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+20h], eax
		mov	ax, si
		add	ax, 20h	; ' '
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_3C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_44]
		sub	[si+18h], eax
		mov	eax, [bp+var_40]
		sub	[si+1Ch], eax
		mov	eax, [bp+var_3C]
		sub	[si+20h], eax

loc_570BF:				; CODE XREF: Matrix_BuildAxisX_56EC3+3Fj
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_BuildAxisX_56EC3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de construction de matrice de rotation (autre axe), référencée par
; Audio3D_ComputeDistanceParams (sub_41BEF, Doppler).
; ==============================================================================================
Matrix_BuildAxisY_570C5	proc far		; CODE XREF: Audio3D_ComputeDistanceParams+1EDP
					; Sound3D_ComputeSecondChannel+1E7P ...

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
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		or	eax, eax
		jge	short loc_570DE
		neg	eax

loc_570DE:				; CODE XREF: Matrix_BuildAxisY_570C5+14j
		mov	[bp+var_C], eax
		mov	[bp+var_10], 38h ; '8'
		mov	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		sar	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_57107
		jmp	loc_572B6
; ���������������������������������������������������������������������������

loc_57107:				; CODE XREF: Matrix_BuildAxisY_570C5+3Dj
		push	di
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	Math_Sin_5483F
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		push	di
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	Math_Cos_54876
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[bp+var_8], eax
		mov	di, si
		mov	eax, [di]
		mov	[bp+var_44], eax
		mov	eax, [di+4]
		mov	[bp+var_40], eax
		mov	eax, [di+8]
		mov	[bp+var_3C], eax
		mov	eax, [si]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	ax, si
		add	ax, 4
		mov	eax, [si+8]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8],	eax
		mov	ax, si
		add	ax, 8
		mov	di, si
		add	di, 18h
		mov	eax, [di]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		sub	[si], eax
		mov	eax, [bp+var_4C]
		sub	[si+4],	eax
		mov	eax, [bp+var_48]
		sub	[si+8],	eax
		mov	eax, [si+18h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+18h], eax
		mov	ax, si
		add	ax, 18h
		mov	eax, [si+1Ch]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+1Ch], eax
		mov	ax, si
		add	ax, 1Ch
		mov	eax, [si+20h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+20h], eax
		mov	ax, si
		add	ax, 20h	; ' '
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_3C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_44]
		add	[si+18h], eax
		mov	eax, [bp+var_40]
		add	[si+1Ch], eax
		mov	eax, [bp+var_3C]
		add	[si+20h], eax

loc_572B6:				; CODE XREF: Matrix_BuildAxisY_570C5+3Fj
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_BuildAxisY_570C5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de construction de matrice de rotation (troisième axe), référencée depuis
; seg014/seg015.
; ==============================================================================================
Matrix_BuildAxisZ_572BC	proc far		; CODE XREF: seg014:054AP seg015:078DP ...

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
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		or	eax, eax
		jge	short loc_572D5
		neg	eax

loc_572D5:				; CODE XREF: Matrix_BuildAxisZ_572BC+14j
		mov	[bp+var_C], eax
		mov	[bp+var_10], 38h ; '8'
		mov	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		sar	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_572FE
		jmp	loc_574AD
; ���������������������������������������������������������������������������

loc_572FE:				; CODE XREF: Matrix_BuildAxisZ_572BC+3Dj
		push	di
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	Math_Sin_5483F
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		push	di
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	Math_Cos_54876
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[bp+var_8], eax
		mov	di, si
		mov	eax, [di]
		mov	[bp+var_44], eax
		mov	eax, [di+4]
		mov	[bp+var_40], eax
		mov	eax, [di+8]
		mov	[bp+var_3C], eax
		mov	eax, [si]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	ax, si
		add	ax, 4
		mov	eax, [si+8]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8],	eax
		mov	ax, si
		add	ax, 8
		mov	di, si
		add	di, 0Ch
		mov	eax, [di]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		add	[si], eax
		mov	eax, [bp+var_4C]
		add	[si+4],	eax
		mov	eax, [bp+var_48]
		add	[si+8],	eax
		mov	eax, [si+0Ch]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+0Ch], eax
		mov	ax, si
		add	ax, 0Ch
		mov	eax, [si+10h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+10h], eax
		mov	ax, si
		add	ax, 10h
		mov	eax, [si+14h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+14h], eax
		mov	ax, si
		add	ax, 14h
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_3C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_44]
		sub	[si+0Ch], eax
		mov	eax, [bp+var_40]
		sub	[si+10h], eax
		mov	eax, [bp+var_3C]
		sub	[si+14h], eax

loc_574AD:				; CODE XREF: Matrix_BuildAxisZ_572BC+3Fj
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_BuildAxisZ_572BC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée depuis le HUD (seg087) — combine Matrix_BuildAxisX_56EC3 et
; Vector_TransformHelperB variant (575DF).
; ==============================================================================================
Matrix_BuildAxisX_ApplyToObject_574B3	proc far		; CODE XREF: seg087:loc_3E1C1P
					; WorldObject_BuildOrientationMatrix_56E8A+Fp	...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr Matrix_BuildAxisX_56EC3
		add	sp, 4
		mov	eax, [di]
		or	eax, eax
		jge	short loc_574D5
		neg	eax

loc_574D5:				; CODE XREF: Matrix_BuildAxisX_ApplyToObject_574B3+1Dj
		mov	[bp+var_4], eax
		mov	[bp+var_8], 38h	; '8'
		mov	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		sar	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_57502
		push	si
		nop
		push	cs
		call	near ptr Matrix_ApplyToVectorX_575DF
		pop	cx

loc_57502:				; CODE XREF: Matrix_BuildAxisX_ApplyToObject_574B3+46j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_BuildAxisX_ApplyToObject_574B3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par WorldObject_BuildOrientationMatrix_56E8A — combine
; Matrix_BuildAxisY_570C5 et Matrix_ApplyToVector_57660.
; ==============================================================================================
Matrix_BuildAxisY_ApplyToObject_57508	proc far		; CODE XREF: WorldObject_BuildOrientationMatrix_56E8A+1Ep
					; Matrix_BuildFullOrientation_575B2+17p

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr Matrix_BuildAxisY_570C5
		add	sp, 4
		mov	eax, [di]
		or	eax, eax
		jge	short loc_5752A
		neg	eax

loc_5752A:				; CODE XREF: Matrix_BuildAxisY_ApplyToObject_57508+1Dj
		mov	[bp+var_4], eax
		mov	[bp+var_8], 38h	; '8'
		mov	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		sar	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_57557
		push	si
		nop
		push	cs
		call	near ptr Matrix_ApplyToVectorY_57660
		pop	cx

loc_57557:				; CODE XREF: Matrix_BuildAxisY_ApplyToObject_57508+46j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_BuildAxisY_ApplyToObject_57508	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée depuis le HUD (seg087) — combine Matrix_BuildAxisZ_572BC et sub_576E5.
; ==============================================================================================
Matrix_BuildAxisZ_ApplyToObject_5755D	proc far		; CODE XREF: seg087:loc_3E1D3P
					; WorldObject_BuildOrientationMatrix_56E8A+2Dp ...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr Matrix_BuildAxisZ_572BC
		add	sp, 4
		mov	eax, [di]
		or	eax, eax
		jge	short loc_5757F
		neg	eax

loc_5757F:				; CODE XREF: Matrix_BuildAxisZ_ApplyToObject_5755D+1Dj
		mov	[bp+var_4], eax
		mov	[bp+var_8], 38h	; '8'
		mov	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		sar	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_575AC
		push	si
		nop
		push	cs
		call	near ptr Matrix_ApplyToVectorZ_576E5
		pop	cx

loc_575AC:				; CODE XREF: Matrix_BuildAxisZ_ApplyToObject_5755D+46j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_BuildAxisZ_ApplyToObject_5755D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg116 L4776-4807 (relu 2026-09-05). Compose une matrice d'orientation 3D COMPLETE :
; Matrix_BuildAxisX_ApplyToObject_574B3(m, &ax) puis _AxisY_57508(m, &ay) puis _AxisZ_5755D(m,
; &az). Chaque _ApplyToObject lit l'angle en *ptr, et si |angle| >= 0x38 brut (= 56/256 =
; 0.21875 deg) appelle Matrix_BuildAxisX/Y/Z_56EC3 qui applique une rotation INCREMENTALE en
; place sur les lignes de la matrice cible (composition, pas reconstruction from-scratch).
; Utilisee via les methodes vtable WorldObject_ComposeOrientation3Angles_3CAE3 (matrice a
; objet+0x2C). C'est le chemin par lequel les vitesses angulaires de la physique tournent
; l'objet du monde chaque frame. Aussi ref. par Widget_AnchorTo3DPosition, sub_2C9F3, seg084.
; ==============================================================================================
Matrix_BuildFullOrientation_575B2	proc far		; CODE XREF: Widget_AnchorTo3DPosition+57P
					; seg084:01C9P	...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Matrix_BuildAxisX_ApplyToObject_574B3
		add	sp, 4
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr Matrix_BuildAxisY_ApplyToObject_57508
		add	sp, 4
		push	[bp+arg_6]
		push	si
		push	cs
		call	near ptr Matrix_BuildAxisZ_ApplyToObject_5755D
		add	sp, 4
		mov	ax, si
		pop	si
		pop	bp
		retf
Matrix_BuildFullOrientation_575B2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, applique une transformation à un vecteur (3× Vector_TransformHelperA_550B7 + 3×
; Vector_TransformHelperB_559BB). Référencée par Audio3D_ComputeDistanceParams (sub_41BEF).
; ==============================================================================================
Matrix_ApplyToVectorX_575DF	proc far		; CODE XREF: Audio3D_ComputeDistanceParams+2E5P
					; Sound3D_ComputeSecondChannel+2C9P ...

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	si
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs
		call	near ptr Vector_TransformHelperA_550B7
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si+18h], eax
		mov	eax, [bp+var_8]
		mov	[si+1Ch], eax
		mov	eax, [bp+var_4]
		mov	[si+20h], eax
		push	si
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	cs
		call	near ptr Vector_TransformHelperA_550B7
		add	sp, 8
		mov	eax, [bp+var_18]
		mov	[si+0Ch], eax
		mov	eax, [bp+var_14]
		mov	[si+10h], eax
		mov	eax, [bp+var_10]
		mov	[si+14h], eax
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_559BB
		pop	cx
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_559BB
		pop	cx
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_559BB
		pop	cx
		mov	ax, si
		pop	si
		leave
		retf
Matrix_ApplyToVectorX_575DF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de Matrix_ApplyToVectorX pour un autre axe. Référencée par
; AI_ManeuverSolution_Major_6977.
; ==============================================================================================
Matrix_ApplyToVectorY_57660	proc far		; CODE XREF: AI_ManeuverSolution_Major+3EFP
					; Formation_GuidanceSolution+8CDP ...

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	si
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs
		call	near ptr Vector_TransformHelperA_550B7
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si+18h], eax
		mov	eax, [bp+var_8]
		mov	[si+1Ch], eax
		mov	eax, [bp+var_4]
		mov	[si+20h], eax
		mov	ax, si
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	cs
		call	near ptr Vector_TransformHelperA_550B7
		add	sp, 8
		mov	eax, [bp+var_18]
		mov	[si], eax
		mov	eax, [bp+var_14]
		mov	[si+4],	eax
		mov	eax, [bp+var_10]
		mov	[si+8],	eax
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_559BB
		pop	cx
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_559BB
		pop	cx
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_559BB
		pop	cx
		mov	ax, si
		pop	si
		leave
		retf
Matrix_ApplyToVectorY_57660	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de Matrix_ApplyToVector pour le troisième axe. Référencée par seg097
; (missile).
; ==============================================================================================
Matrix_ApplyToVectorZ_576E5	proc far		; CODE XREF: seg097:06BFP
					; Matrix_BuildAxisZ_ApplyToObject_5755D+4Bp ...

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs
		call	near ptr Vector_TransformHelperA_550B7
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si], eax
		mov	eax, [bp+var_8]
		mov	[si+4],	eax
		mov	eax, [bp+var_4]
		mov	[si+8],	eax
		push	si
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	cs
		call	near ptr Vector_TransformHelperA_550B7
		add	sp, 8
		mov	eax, [bp+var_18]
		mov	[si+0Ch], eax
		mov	eax, [bp+var_14]
		mov	[si+10h], eax
		mov	eax, [bp+var_10]
		mov	[si+14h], eax
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_559BB
		pop	cx
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_559BB
		pop	cx
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_559BB
		pop	cx
		mov	ax, si
		pop	si
		leave
		retf
Matrix_ApplyToVectorZ_576E5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par seg084 (constructeurs objets du monde), appelle sub_58768 ×2 et
; Matrix_ApplyToVectorY_57660.
; ==============================================================================================
WorldObject_ApplyOrientationVariantA_5776A	proc far		; CODE XREF: seg084:02FCP
					; WorldObject_ApplyOrientationAndFilter_9D020+44P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		push	si
		push	cs
		call	near ptr Matrix_ApplyToVectorY_57660
		pop	cx
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
WorldObject_ApplyOrientationVariantA_5776A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée depuis seg015/seg084, appelle sub_58828 ×2 et Matrix_ApplyToVectorY_57660.
; ==============================================================================================
WorldObject_ApplyOrientationVariantB_5779A	proc far		; CODE XREF: seg015:09FDP seg084:02D7P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		call	Math_ApplyRotationHelperB_58828
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	Math_ApplyRotationHelperB_58828
		add	sp, 4
		push	si
		push	cs
		call	near ptr Matrix_ApplyToVectorY_57660
		pop	cx
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
WorldObject_ApplyOrientationVariantB_5779A	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0B4h
		push	si
		mov	si, [bp+6]
		push	3
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		lea	ax, [bp-14h]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 1Ch
		push	ax
		lea	ax, [bp-28h]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 18h
		push	ax
		lea	ax, [bp-3Ch]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 14h
		push	ax
		lea	ax, [bp-50h]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 10h
		push	ax
		lea	ax, [bp-64h]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 0Ch
		push	ax
		lea	ax, [bp-78h]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 8
		push	ax
		lea	ax, [bp-8Ch]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 4
		push	ax
		lea	ax, [bp-0A0h]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	3
		push	si
		lea	ax, [bp-0B4h]
		push	ax
		call	UIScreen_BuildFormattedText_54CC9
		add	sp, 6
		push	ax
		push	3767h
		call	CRT_Msg_NullPtrAssign
		add	sp, 14h
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée en interne du segment (probable helper du bloc anonyme géométrique voisin) —
; rôle exact non détaillé.
; ==============================================================================================
GeomHelper_QuadrantCompute_5789E	proc far		; CODE XREF: seg116:2ADDp seg116:2C24p ...

var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_8]
		cmp	dword ptr [si],	0
		jl	short loc_578C4
		mov	eax, 16800h
		sub	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	[bp+arg_4], eax

loc_578C4:				; CODE XREF: GeomHelper_QuadrantCompute_5789E+Ej
		mov	dx, word ptr [bp+arg_4+1]
		cmp	dx, 168h
		jl	short loc_578EB
		mov	ax, dx
		mov	bx, 168h
		cwd
		idiv	bx
		mov	dx, ax
		imul	ax, 168h
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		sub	[bp+arg_4], eax

loc_578EB:				; CODE XREF: GeomHelper_QuadrantCompute_5789E+2Dj
		cmp	[bp+arg_4], 0B400h
		jle	short loc_578FD
		sub	[bp+arg_4], 16800h

loc_578FD:				; CODE XREF: GeomHelper_QuadrantCompute_5789E+55j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
GeomHelper_QuadrantCompute_5789E	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		mov	ax, di
		add	ax, 0Ch
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp-8]
		mov	[bp-20h], eax
		mov	ax, di
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp-0Ch]
		mov	[bp-1Ch], eax
		mov	dword ptr [bp-18h], 0
		lea	ax, [bp-20h]
		push	ax
		push	cs
		call	near ptr Targeting_LineOfSightCheck_5593A
		pop	cx
		lea	ax, [bp-1Ch]
		push	ax
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	Math_ArcSin_5493E
		add	sp, 6
		mov	eax, [bp-10h]
		mov	[bp-4],	eax
		lea	ax, [bp-20h]
		push	ax
		sub	sp, 4
		mov	eax, [bp-4]
		mov	[bp-2Ah], eax
		push	ss
		lea	ax, [bp-14h]
		push	ax
		push	cs
		call	near ptr GeomHelper_QuadrantCompute_5789E
		add	sp, 0Ah
		mov	eax, [bp-14h]
		mov	[bp-4],	eax
		neg	eax
		mov	[bp-4],	eax
		mov	bx, [bp+6]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		push	di
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp-8]
		mov	[bp-1Ch], eax
		mov	ax, di
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp-0Ch]
		mov	[bp-18h], eax
		mov	dword ptr [bp-14h], 0
		lea	ax, [bp-1Ch]
		push	ax
		push	cs
		call	near ptr Targeting_LineOfSightCheck_5593A
		pop	cx
		lea	ax, [bp-18h]
		push	ax
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	Math_ArcSin_5493E
		add	sp, 6
		mov	eax, [bp-10h]
		mov	[bp-4],	eax
		cmp	dword ptr [bp-1Ch], 0
		jge	short loc_57A43
		neg	eax
		mov	[bp-4],	eax

loc_57A43:				; CODE XREF: seg116:2B7Aj
		mov	bx, [bp+6]
		mov	eax, [bp-4]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		mov	ax, di
		add	ax, 0Ch
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp-8]
		mov	[bp-20h], eax
		mov	ax, di
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp-0Ch]
		mov	[bp-1Ch], eax
		mov	dword ptr [bp-18h], 0
		lea	ax, [bp-20h]
		push	ax
		push	cs
		call	near ptr Targeting_LineOfSightCheck_5593A
		pop	cx
		lea	ax, [bp-1Ch]
		push	ax
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	Math_ArcSin_5493E
		add	sp, 6
		mov	eax, [bp-10h]
		mov	[bp-4],	eax
		lea	ax, [bp-20h]
		push	ax
		sub	sp, 4
		mov	eax, [bp-4]
		mov	[bp-2Ah], eax
		push	ss
		lea	ax, [bp-14h]
		push	ax
		push	cs
		call	near ptr GeomHelper_QuadrantCompute_5789E
		add	sp, 0Ah
		mov	eax, [bp-14h]
		mov	[bp-4],	eax
		neg	eax
		mov	[bp-4],	eax
		mov	bx, [bp+6]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		push	di
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp-8]
		mov	[bp-1Ch], eax
		mov	ax, di
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp-0Ch]
		mov	[bp-18h], eax
		mov	dword ptr [bp-14h], 0
		lea	ax, [bp-1Ch]
		push	ax
		push	cs
		call	near ptr Targeting_LineOfSightCheck_5593A
		pop	cx
		lea	ax, [bp-18h]
		push	ax
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	Math_ArcSin_5493E
		add	sp, 6
		mov	eax, [bp-10h]
		mov	[bp-4],	eax
		cmp	dword ptr [bp-1Ch], 0
		jge	short loc_57B8A
		neg	eax
		mov	[bp-4],	eax

loc_57B8A:				; CODE XREF: seg116:2CC1j
		mov	bx, [bp+6]
		mov	eax, [bp-4]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	si
		push	ss
		lea	ax, [bp-8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp-8]
		mov	[bp-20h], eax
		push	di
		push	si
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp-0Ch]
		mov	[bp-1Ch], eax
		mov	dword ptr [bp-18h], 0
		lea	ax, [bp-20h]
		push	ax
		push	cs
		call	near ptr Targeting_LineOfSightCheck_5593A
		pop	cx
		lea	ax, [bp-1Ch]
		push	ax
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	Math_ArcSin_5493E
		add	sp, 6
		mov	eax, [bp-10h]
		mov	[bp-4],	eax
		lea	ax, [bp-20h]
		push	ax
		sub	sp, 4
		mov	eax, [bp-4]
		mov	[bp-2Ah], eax
		push	ss
		lea	ax, [bp-14h]
		push	ax
		push	cs
		call	near ptr GeomHelper_QuadrantCompute_5789E
		add	sp, 0Ah
		mov	eax, [bp-14h]
		mov	[bp-4],	eax
		mov	bx, [bp+6]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_125EC, appelle Math_AngleBetweenVectors_552E1.
; ==============================================================================================
AI_ApplyAngleBetweenVectors_57C3A	proc far		; CODE XREF: FlightState_EnterLevelFlight+83P
					; Altitude_HoldController+31P ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_4]
		mov	ax, dx
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr Math_AngleBetweenVectors_552E1
		add	sp, 6
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
AI_ApplyAngleBetweenVectors_57C3A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 143 lignes, NON DÉTAILLÉE — référencée depuis seg002 (cœur IA) et sub_58F4, combine
; Targeting_ComputeGeometryHelperA_5505B, Math_VectorLength3D_Scaled_54F57,
; Math_ArcSinOfRatio_54A0E.
; ==============================================================================================
AI_ComputeGeometrySolution_57C67	proc far		; CODE XREF: seg002:0EF0P AI_Sensor_HeadingNormalized+52P ...

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

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		mov	si, [bp+arg_4]
		cmp	dword ptr [si+20h], 0
		jnz	short loc_57C7B
		jmp	loc_57D52
; ���������������������������������������������������������������������������

loc_57C7B:				; CODE XREF: AI_ComputeGeometrySolution_57C67+Fj
		mov	eax, [si+10h]
		mov	[bp+var_30], eax
		mov	eax, [si+0Ch]
		neg	eax
		mov	[bp+var_2C], eax
		mov	[bp+var_28], 0
		mov	ax, si
		add	ax, 18h
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_5505B
		add	sp, 8
		lea	ax, [bp+var_30]
		push	ax
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		cmp	[bp+var_8], 0
		jnz	short loc_57CCD
		mov	[bp+var_4], 0
		jmp	short loc_57CF5
; ���������������������������������������������������������������������������

loc_57CCD:				; CODE XREF: AI_ComputeGeometrySolution_57C67+5Aj
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		call	Math_ArcSinOfRatio_54A0E
		add	sp, 8
		mov	eax, [bp+var_C]
		neg	eax
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	[bp+var_4], eax

loc_57CF5:				; CODE XREF: AI_ComputeGeometrySolution_57C67+64j
		add	[bp+var_4], 5A00h
		cmp	dword ptr [si+20h], 0
		jge	short loc_57D40
		cmp	[bp+var_4], 0
		jle	short loc_57D23
		mov	eax, 0B400h
		sub	eax, [bp+var_4]
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	[bp+var_4], eax
		jmp	short loc_57D40
; ���������������������������������������������������������������������������

loc_57D23:				; CODE XREF: AI_ComputeGeometrySolution_57C67+A2j
		cmp	[bp+var_4], 0
		jge	short loc_57D40
		mov	eax, 0FFFF4C00h
		sub	eax, [bp+var_4]
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	[bp+var_4], eax

loc_57D40:				; CODE XREF: AI_ComputeGeometrySolution_57C67+9Bj
					; AI_ComputeGeometrySolution_57C67+BAj ...
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		jmp	short loc_57D7E
; ���������������������������������������������������������������������������

loc_57D52:				; CODE XREF: AI_ComputeGeometrySolution_57C67+11j
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_57D5D
		mov	ax, si
		jmp	short loc_57D67
; ���������������������������������������������������������������������������

loc_57D5D:				; CODE XREF: AI_ComputeGeometrySolution_57C67+F0j
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_57D67:				; CODE XREF: AI_ComputeGeometrySolution_57C67+F4j
		or	ax, ax
		jz	short loc_57D76
		mov	dword ptr [si],	0
		mov	ax, si
		jmp	short loc_57D78
; ���������������������������������������������������������������������������

loc_57D76:				; CODE XREF: AI_ComputeGeometrySolution_57C67+102j
		mov	ax, si

loc_57D78:				; CODE XREF: AI_ComputeGeometrySolution_57C67+10Dj
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]

loc_57D7E:				; CODE XREF: AI_ComputeGeometrySolution_57C67+E9j
		pop	si
		leave
		retf
AI_ComputeGeometrySolution_57C67	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_781D0, appelle AI_ComputeApproachAngles_553CF.
; ==============================================================================================
AI_ApplyApproachAngles_57D81	proc far		; CODE XREF: CameraScript_ExecuteCOMP_781D0+101P
					; CameraScript_ExecuteCOMP_781D0+E38P ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_4]
		mov	ax, dx
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr AI_ComputeApproachAngles_553CF
		add	sp, 6
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
AI_ApplyApproachAngles_57D81	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée depuis seg014/seg015 (UI cockpit) — combine UI_ApplyVectorLength_55B04,
; Targeting_LineOfSightCheck_5593A ×2, Vector_TransformHelperA_550B7.
; ==============================================================================================
UI_ApplyLineOfSightAndTransform_57DAE	proc far		; CODE XREF: seg014:04A2P seg015:09D8P ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	cs
		call	near ptr UI_ApplyVectorLength_55B04
		pop	cx
		push	di
		push	cs
		call	near ptr Vector_Normalize3D_559BB
		pop	cx
		cmp	dword ptr [di],	0
		jnz	short loc_57DD5
		cmp	dword ptr [di+4], 0
		jz	short loc_57E4F

loc_57DD5:				; CODE XREF: UI_ApplyLineOfSightAndTransform_57DAE+1Ej
		mov	dx, di
		mov	bx, dx
		mov	eax, [bx]
		mov	[si+0Ch], eax
		mov	eax, [bx+4]
		mov	[si+10h], eax
		mov	eax, [bx+8]
		mov	[si+14h], eax
		mov	eax, [di+4]
		shl	eax, 5
		mov	[si], eax
		mov	eax, [di]
		neg	eax
		shl	eax, 5
		mov	[si+4],	eax
		mov	dword ptr [si+8], 0
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_559BB
		pop	cx
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	si
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs
		call	near ptr Vector_TransformHelperA_550B7
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si+18h], eax
		mov	eax, [bp+var_8]
		mov	[si+1Ch], eax
		mov	eax, [bp+var_4]
		mov	[si+20h], eax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_559BB
		pop	cx
		jmp	short loc_57E9A
; ���������������������������������������������������������������������������

loc_57E4F:				; CODE XREF: UI_ApplyLineOfSightAndTransform_57DAE+25j
		mov	dword ptr [si],	100h
		xor	eax, eax
		mov	[si+20h], eax
		mov	[si+18h], eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	[si+4],	eax
		cmp	dword ptr [di+8], 0
		jle	short loc_57E8A
		mov	dword ptr [si+14h], 100h
		mov	dword ptr [si+1Ch], 0FFFFFF00h
		jmp	short loc_57E9A
; ���������������������������������������������������������������������������

loc_57E8A:				; CODE XREF: UI_ApplyLineOfSightAndTransform_57DAE+C8j
		mov	dword ptr [si+14h], 0FFFFFF00h
		mov	dword ptr [si+1Ch], 100h

loc_57E9A:				; CODE XREF: UI_ApplyLineOfSightAndTransform_57DAE+9Fj
					; UI_ApplyLineOfSightAndTransform_57DAE+DAj
		pop	di
		pop	si
		leave
		retf
UI_ApplyLineOfSightAndTransform_57DAE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par seg010 (encodage HUD/sous-objets attachés), appelle sub_694 (externe) et
; sub_57EDD.
; ==============================================================================================
HUD_EncodeHelper_57E9E	proc far		; CODE XREF: seg010:0558P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_57EBD
		push	large 24h ; '$'
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_57ED5

loc_57EBD:				; CODE XREF: HUD_EncodeHelper_57E9E+8j
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Ch
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr HUD_EncodeHelperSub_57EDD
		add	sp, 4

loc_57ED5:				; CODE XREF: HUD_EncodeHelper_57E9E+1Dj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
HUD_EncodeHelper_57E9E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelée uniquement par HUD_EncodeHelper_57E9E.
; ==============================================================================================
HUD_EncodeHelperSub_57EDD	proc far		; CODE XREF: HUD_EncodeHelper_57E9E+31p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, dword_707D4
		mov	es:[bx], eax
		mov	eax, dword_707D8
		mov	es:[bx+4], eax
		mov	eax, dword_707DC
		mov	es:[bx+8], eax
		mov	eax, dword_707E0
		mov	es:[bx+0Ch], eax
		mov	eax, dword_707E4
		mov	es:[bx+10h], eax
		mov	eax, dword_707E8
		mov	es:[bx+14h], eax
		mov	eax, dword_707EC
		mov	es:[bx+18h], eax
		mov	eax, dword_707F0
		mov	es:[bx+1Ch], eax
		mov	eax, dword_707F4
		mov	es:[bx+20h], eax
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
HUD_EncodeHelperSub_57EDD	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF, fin de segment), combine
; Formation_ComputeGeometryHelper_56D43 et Calibration_ComputeHelper_56CE5.
; ==============================================================================================
Formation_ApplyGeometryAndCalibration_57F3B:				; DATA XREF: seg339:4E6Ao
		push	bp
		mov	bp, sp
		sub	sp, 30h
		mov	dword ptr [bp-4], 100h
		mov	eax, [bp-4]
		mov	dword_707D4, eax
		mov	dword ptr [bp-8], 0
		mov	eax, [bp-8]
		mov	dword_707D8, eax
		mov	dword ptr [bp-0Ch], 0
		mov	eax, [bp-0Ch]
		mov	dword_707DC, eax
		mov	dword ptr [bp-10h], 0
		mov	eax, [bp-10h]
		mov	dword_707E0, eax
		mov	dword ptr [bp-14h], 100h
		mov	eax, [bp-14h]
		mov	dword_707E4, eax
		mov	dword ptr [bp-18h], 0
		mov	eax, [bp-18h]
		mov	dword_707E8, eax
		mov	dword ptr [bp-1Ch], 0
		mov	eax, [bp-1Ch]
		mov	dword_707EC, eax
		mov	dword ptr [bp-20h], 0
		mov	eax, [bp-20h]
		mov	dword_707F0, eax
		mov	dword ptr [bp-24h], 100h
		mov	eax, [bp-24h]
		mov	dword_707F4, eax
		mov	dword ptr [bp-28h], 0
		mov	eax, [bp-28h]
		mov	dword_707F8, eax
		mov	dword ptr [bp-2Ch], 0
		mov	eax, [bp-2Ch]
		mov	dword_707FC, eax
		mov	dword ptr [bp-30h], 0
		mov	eax, [bp-30h]
		mov	dword_70800, eax
		push	5B8Ch
		push	cs
		call	near ptr Formation_ComputeGeometryHelper_56D43
		pop	cx
		push	ds
		push	offset unk_72C60
		push	cs

loc_5800E:
		call	near ptr Calibration_ComputeHelper_56CE5
		add	sp, 4
		leave
		retf
seg116		ends
