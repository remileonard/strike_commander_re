seg102		segment	byte public 'CODE' use16
		assume cs:seg102
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,59L — intègre un vecteur (delta-temps dword_70458) dans une position secondaire
; (+4/8/0xC) : intégrateur d'Euler pour un second point de référence (probable
; rotation/orientation).
; ==============================================================================================
Physics_IntegrateSecondaryPosition	proc far		; CODE XREF: seg102:0F48p seg103:2D13P ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_4696D:				; DATA XREF: seg216:03F6o
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[bp+var_C], eax

loc_46981:
		mov	eax, [di+4]

loc_46985:
		mov	[bp+var_8], eax

loc_46989:
		mov	eax, [di+8]
		mov	[bp+var_4], eax

loc_46991:
		mov	eax, [bp+var_C]

loc_46995:
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		add	[si+4],	eax
		mov	eax, [bp+var_8]
		add	[si+8],	eax
		mov	eax, [bp+var_4]
		add	[si+0Ch], eax
		pop	di
		pop	si
		leave
		retf
Physics_IntegrateSecondaryPosition	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,12L — remet à zéro deux flags de cache (byte_6FFAC/6FFB1) : invalidation du cache de
; moments de contrôle (roulis/tangage).
; ==============================================================================================
FlightControl_InvalidateRollPitchCache	proc far		; CODE XREF: FlightControl_InvalidateAllCaches+Ep FlightControl_InvalidateAllCachesGlobal+DP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_6FFAC, 0
		mov	byte_6FFB1, 0
		pop	bp
		retf
FlightControl_InvalidateRollPitchCache	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg102 L107-197. Cache frame (byte_6FFAC -> dword_6FFA8). PAS un moment de roulis (nom
; hérité faux). Physics_ResolveWindVectorCached([A]) -> vitesse en repère CORPS (c0=envergure,
; c1=nez, c2=normale). Renvoie -dword_707B2 * v_corps.c2 / |(v_corps.c1, v_corps.c2)| =
; -Calpha * sin(INCIDENCE alpha) : l'angle d'écoulement vertical (angle d'attaque).
; dword_707B2 = pente de portance partagée. Utilisé par Aero_ComputeAoAWithTrim (alpha+calage)
; et Aero_ComputeForcesMain (asservissement d'attitude).
; ==============================================================================================
Aero_FlowAngle_AoA_469FE	proc far		; CODE XREF: Aero_ComputeForcesMain_4791E+59p
					; Aero_ComputeAoAWithTrim_480CA+10P ...

var_1C		= word ptr -1Ch
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
		sub	sp, 1Ch
		push	si
		mov	si, [bp+arg_4]
		mov	al, byte_6FFAC
		mov	ah, 0
		or	ax, ax
		jz	short loc_46A14
		jmp	loc_46AA2
; ���������������������������������������������������������������������������

loc_46A14:				; CODE XREF: Aero_FlowAngle_AoA_469FE+11j
		push	word ptr [si]
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	Physics_ResolveWindVectorCached_4643B
		add	sp, 6
		mov	eax, [bp+var_18]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_8], eax
		cmp	[bp+var_C], 0
		jnz	short loc_46A4B
		cmp	[bp+var_8], 0
		jnz	short loc_46A4B
		mov	[bp+var_4], 0
		jmp	short loc_46A95
; ���������������������������������������������������������������������������

loc_46A4B:				; CODE XREF: Aero_FlowAngle_AoA_469FE+3Aj
					; Aero_FlowAngle_AoA_469FE+41j
		mov	eax, dword_707B2
		neg	eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_8]
		imul	edx

loc_46A61:
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		lea	ax, [bp+var_C]
		push	ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	Math_VectorLength3D_Scaled_Variant_55ED8
		add	sp, 6
		mov	eax, [bp+var_4]

loc_46A7F:
		mov	edx, eax
		mov	ecx, [bp+var_10]

loc_46A86:
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4], eax

loc_46A95:				; CODE XREF: Aero_FlowAngle_AoA_469FE+4Bj
		mov	eax, [bp+var_4]
		mov	dword_6FFA8, eax
		mov	byte_6FFAC, 1

loc_46AA2:				; CODE XREF: Aero_FlowAngle_AoA_469FE+13j
		mov	bx, [bp+arg_0]
		mov	eax, dword_6FFA8
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Aero_FlowAngle_AoA_469FE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg102 L208-293. Variante de Aero_FlowAngle_AoA sur le cache byte_6FFB1 -> dword_6FFAD.
; PAS un moment de tangage (nom hérité faux). Renvoie -dword_707B2 * v_corps.c0 /
; |(v_corps.c0, v_corps.c1)| = -Calpha * sin(DÉRAPAGE beta) : angle d'écoulement latéral.
; Alimente la force latérale de virage dans Aero_ComputeLiftAndSideForce et l'asservissement
; de lacet dans Aero_ComputeForcesMain.
; ==============================================================================================
Aero_FlowAngle_Sideslip_46AB5	proc far		; CODE XREF: Aero_ComputeForcesMain_4791E:loc_47984p
					; Aero_ComputeLiftAndSideForce_4812B+2DP ...

var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+arg_4]
		mov	al, byte_6FFB1
		mov	ah, 0
		or	ax, ax
		jz	short loc_46ACB
		jmp	loc_46B59
; ���������������������������������������������������������������������������

loc_46ACB:				; CODE XREF: Aero_FlowAngle_Sideslip_46AB5+11j
		push	word ptr [si]
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	Physics_ResolveWindVectorCached_4643B
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_8], eax
		cmp	[bp+var_C], 0
		jnz	short loc_46B02
		cmp	[bp+var_8], 0
		jnz	short loc_46B02
		mov	[bp+var_4], 0
		jmp	short loc_46B4C
; ���������������������������������������������������������������������������

loc_46B02:				; CODE XREF: Aero_FlowAngle_Sideslip_46AB5+3Aj
					; Aero_FlowAngle_Sideslip_46AB5+41j
		mov	eax, dword_707B2
		neg	eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		lea	ax, [bp+var_C]
		push	ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	Math_VectorLength3D_Scaled_Variant_55ED8
		add	sp, 6
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, [bp+var_10]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4], eax

loc_46B4C:				; CODE XREF: Aero_FlowAngle_Sideslip_46AB5+4Bj
		mov	eax, [bp+var_4]
		mov	dword_6FFAD, eax

loc_46B54:
		mov	byte_6FFB1, 1

loc_46B59:				; CODE XREF: Aero_FlowAngle_Sideslip_46AB5+13j
		mov	bx, [bp+arg_0]
		mov	eax, dword_6FFAD
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Aero_FlowAngle_Sideslip_46AB5	endp

; ���������������������������������������������������������������������������

loc_46B6C:				; CODE XREF: seg082:0D7CJ
					; DATA XREF: seg339:20D6o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_46B74:				; CODE XREF: seg082:0714J seg082:0DC1J ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, [bp+0Ah]
		mov	si, [bp+6]
		mov	di, dx

loc_46B81:
		add	di, 4
		or	si, si
		jz	short loc_46B8C
		mov	ax, si
		jmp	short loc_46B96
; ���������������������������������������������������������������������������

loc_46B8C:				; CODE XREF: seg102:0226j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_46B96:				; CODE XREF: seg102:022Aj
		or	ax, ax
		jz	short loc_46BB4
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4],	eax
		mov	eax, [di+8]
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_46BB6
; ���������������������������������������������������������������������������

loc_46BB4:				; CODE XREF: seg102:0238j
		mov	ax, si

loc_46BB6:				; CODE XREF: seg102:0252j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_46BC0:				; CODE XREF: seg082:06FDJ seg082:0DAAJ ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	eax, [di]
		mov	[si+4],	eax
		mov	eax, [di+4]
		mov	[si+8],	eax
		mov	eax, [di+8]
		mov	[si+0Ch], eax
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_46BE6:				; CODE XREF: seg082:06E6J seg082:0D93J ...
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	ax, dx
		add	ax, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_46BF3:				; CODE XREF: seg082:0742J seg082:0DEFJ ...
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	bx, [bp+0Ah]
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		mov	si, bx
		add	si, 4
		mov	eax, [si]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		mov	[bp-0Ch], eax
		mov	eax, [si+4]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		mov	[bp-14h], eax
		mov	eax, [si+8]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8

loc_46C54:
		mov	[bp-18h], eax
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		cmp	word ptr [bp-4], 0
		jz	short loc_46C6B
		mov	ax, [bp-4]
		jmp	short loc_46C76
; ���������������������������������������������������������������������������

loc_46C6B:				; CODE XREF: seg102:0304j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp-4],	ax

loc_46C76:				; CODE XREF: seg102:0309j
		or	ax, ax
		jz	short loc_46C96
		mov	bx, [bp-4]
		mov	eax, [bp-0Ch]

loc_46C81:
		mov	[bx], eax
		mov	eax, [bp-14h]
		mov	[bx+4],	eax
		mov	eax, [bp-1Ch]
		mov	[bx+8],	eax

loc_46C94:
		jmp	short $+2

loc_46C96:				; CODE XREF: seg102:0318j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_46C9F:				; CODE XREF: seg082:072BJ seg082:0DD8J ...
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	eax, [di]
		mov	[si+4],	eax
		mov	eax, [di+4]
		mov	[si+8],	eax
		mov	eax, [di+8]
		mov	[si+0Ch], eax
		mov	eax, [si+4]
		mov	edx, dword_70454
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	ax, si
		add	ax, 4
		mov	eax, [si+8]
		mov	edx, dword_70454
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8],	eax
		mov	ax, si
		add	ax, 8
		mov	eax, [si+0Ch]
		mov	edx, dword_70454
		imul	edx
		shrd	eax, edx, 8
		mov	[si+0Ch], eax
		mov	ax, si
		add	ax, 0Ch
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg102 L500-570. Cache frame (byte_6FFBB -> dword_6FFB7). |v|^2
; (Math_DotProduct3D_5505B(A.vel,A.vel)) * rho(altitude) (Atmosphere_AirDensityAtAltitude via
; FlightControl_CacheNamedParam) >>8 ; /2 ; borne >=0. Renvoie q = 1/2*rho(h)*v^2 = pression
; dynamique, echelle de force aero maitresse (portance, trainee, forces de controle). Detail:
; DATA_MODEL.md 6.2.
; ==============================================================================================
Aero_DynamicPressure_46D13	proc far		; CODE XREF: FlightControl_ComputeWindComponent+5Ap
					; Aero_ComputeForcesMain_4791E+21p ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_4]
		mov	al, byte_6FFBB
		mov	ah, 0
		or	ax, ax
		jnz	short loc_46D90
		mov	ax, [si]
		add	ax, 8
		push	ax
		mov	ax, [si]
		add	ax, 8
		push	ax
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		call	Math_DotProduct3D_5505B
		add	sp, 8
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		push	si
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		nop
		push	cs
		call	near ptr FlightControl_CacheNamedParam
		add	sp, 6
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		sar	eax, 1
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jge	short loc_46D83
		mov	[bp+var_4], 0

loc_46D83:				; CODE XREF: Aero_DynamicPressure_46D13+66j
		mov	eax, [bp+var_4]

loc_46D87:
		mov	dword_6FFB7, eax

loc_46D8B:
		mov	byte_6FFBB, 1

loc_46D90:				; CODE XREF: Aero_DynamicPressure_46D13+11j
		mov	bx, [bp+arg_0]
		mov	eax, dword_6FFB7
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Aero_DynamicPressure_46D13	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg102 L583-735. rho(ALTITUDE) par interpolation lineaire dans AIRDENS.TBL
; (..\..\DATA\AIRDENS.TBL : 121 x u32 LE, decroissant 1322 -> 28, une entree par bande de 256
; m, 0..~31 km ; colle rho = 1.225*exp(-h/8000)). tab =
; Memory_TypedAllocDispatchB_5C832(0x5C44, dword_72A0A=id atmo, 2) ; h = [[A+2]+0x1A] altitude
; (24.8 m, borne [0,0x77EC00]=30702 m) ; i = h>>16 (= alt_m/256) ; y =
; lerp(tab[i],tab[i+1],frac), tab[k] re-echelonne <<8 >>10 (=/4). Emballe par
; Aero_DynamicPressure : q = 1/2 * rho(h) * (v.v) = VRAIE PRESSION DYNAMIQUE. Detail:
; DATA_MODEL.md 6.2.
; ==============================================================================================
Atmosphere_AirDensityAtAltitude_46DA3	proc far		; CODE XREF: Audio3D_DopplerShift+4FP
					; FlightControl_CacheNamedParam+19p ...

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
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 64h
		push	si
		mov	si, [bp+arg_4]
		push	0
		mov	al, byte_72A0E
		push	ax
		push	large [dword_72A0A]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		mov	bx, [si]
		mov	si, [bx+2]
		add	si, 1Ah
		mov	eax, [si]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0
		jge	short loc_46DE7
		mov	[bp+var_C], 0

loc_46DE7:				; CODE XREF: Atmosphere_AirDensityAtAltitude_46DA3+3Aj
		cmp	[bp+var_C], 77EC00h
		jle	short loc_46DF9
		mov	[bp+var_C], 77EC00h

loc_46DF9:				; CODE XREF: Atmosphere_AirDensityAtAltitude_46DA3+4Cj
		mov	eax, [bp+var_C]
		sar	eax, 8
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		sar	eax, 8
		mov	[bp+var_10], eax
		mov	ax, word ptr [bp+var_10]
		shl	ax, 2
		mov	dx, [bp+var_6]
		mov	bx, [bp+var_8]
		add	bx, ax
		mov	[bp+var_22], dx
		mov	[bp+var_24], bx
		mov	es, [bp+var_22]
		mov	eax, es:[bx]
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		shl	eax, 8
		mov	[bp+var_30], eax
		sar	eax, 0Ah
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	[bp+var_1C], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_28], eax
		mov	[bp+var_3C], eax
		shl	eax, 8
		mov	[bp+var_40], eax
		sar	eax, 0Ah
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	[bp+var_20], eax
		mov	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_54], eax
		shl	eax, 8
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_4C], eax
		add	eax, 10000h
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		mov	[bp+var_50], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_4C]
		sub	[bp+var_64], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_1C]

loc_46EC3:
		sub	[bp+var_64], eax
		mov	eax, [bp+var_4]

loc_46ECB:
		mov	edx, [bp+var_64]

loc_46ECF:
		imul	edx

loc_46ED2:
		shrd	eax, edx, 8

loc_46ED7:
		mov	[bp+var_4], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_4C]
		sub	[bp+var_64], eax
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, [bp+var_64]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4], eax
		mov	eax, [bp+var_1C]
		add	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Atmosphere_AirDensityAtAltitude_46DA3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,35L — cache (byte_6FFB6) le résultat de sub_46DA3 : cache d'un paramètre de contrôle
; aérodynamique.
; ==============================================================================================
FlightControl_CacheNamedParam	proc far		; CODE XREF: Aero_DynamicPressure_46D13+3Cp

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_4]
		mov	al, byte_6FFB6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_46F4C
		push	dx
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr Atmosphere_AirDensityAtAltitude_46DA3
		add	sp, 6
		mov	eax, [bp+var_4]
		mov	dword_6FFB2, eax
		mov	byte_6FFB6, 1

loc_46F4C:				; CODE XREF: FlightControl_CacheNamedParam+10j
		mov	bx, [bp+arg_0]
		mov	eax, dword_6FFB2
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
FlightControl_CacheNamedParam	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,140L — résout un vecteur vent (sub_4643B), le normalise (sub_5593A), calcule sa
; projection sur un axe de référence : calcul de la composante de vent relative dans un axe de
; contrôle donné.
; ==============================================================================================
FlightControl_ComputeWindComponent	proc far		; CODE XREF: FlightControl_ComputeAngularAccel+2Ap
					; FlightControl_ComputeWindComponentWrapper+1Ap ...

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
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	al, byte_6FFBC
		mov	ah, 0
		or	ax, ax
		jz	short loc_46F75
		jmp	loc_47053
; ���������������������������������������������������������������������������

loc_46F75:				; CODE XREF: FlightControl_ComputeWindComponent+12j
		push	word ptr [si]
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		call	Physics_ResolveWindVectorCached_4643B
		add	sp, 6
		lea	ax, [bp+var_14]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [si+10h]
		neg	eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_18], eax
		push	si
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr Aero_DynamicPressure_46D13
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_8]

loc_46FC6:
		imul	edx
		shrd	eax, edx, 8

loc_46FCE:
		mov	[bp+var_20], eax
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_18]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_18]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_20]
		mov	[si+4],	eax
		mov	eax, [bp+var_1C]
		mov	[si+8],	eax
		mov	eax, [bp+var_18]
		mov	[si+0Ch], eax
		mov	byte_6FFBC, 1

loc_47053:				; CODE XREF: FlightControl_ComputeWindComponent+14j
		mov	di, [bp+arg_0]
		add	si, 4
		or	di, di
		jz	short loc_47061
		mov	ax, di
		jmp	short loc_4706B
; ���������������������������������������������������������������������������

loc_47061:				; CODE XREF: FlightControl_ComputeWindComponent+FDj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax

loc_4706B:				; CODE XREF: FlightControl_ComputeWindComponent+101j
		or	ax, ax
		jz	short loc_47089
		mov	eax, [si]
		mov	[di], eax
		mov	eax, [si+4]
		mov	[di+4],	eax
		mov	eax, [si+8]

loc_47081:
		mov	[di+8],	eax

loc_47085:
		mov	ax, di
		jmp	short loc_4708B
; ���������������������������������������������������������������������������

loc_47089:				; CODE XREF: FlightControl_ComputeWindComponent+10Fj
		mov	ax, di

loc_4708B:				; CODE XREF: FlightControl_ComputeWindComponent+129j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
FlightControl_ComputeWindComponent	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,14L — invalide 3 caches (byte_6FFB6/BB/BC) : invalidation groupée du cache des moments
; de contrôle (roulis/tangage/lacet).
; ==============================================================================================
FlightControl_InvalidateMomentCache	proc far		; CODE XREF: FlightControl_InvalidateAllMomentCache+19p
					; FlightControl_InvalidateAllCaches+16p ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_6FFB6, 0
		mov	byte_6FFBB, 0
		mov	byte_6FFBC, 0
		pop	bp
		retf
FlightControl_InvalidateMomentCache	endp

; ���������������������������������������������������������������������������

loc_470AC:				; CODE XREF: seg082:106FJ
					; DATA XREF: seg339:off_6F292o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,15L — invalide deux caches (byte_6FFC9/D6) : invalidation d'un second groupe de cache de
; contrôle.
; ==============================================================================================
FlightControl_InvalidateCacheB	proc far		; CODE XREF: FlightControl_InvalidateAllMomentCache+Ep
					; FlightControl_InvalidateAllCachesGlobal+29P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_6FFC9, 0

loc_470BF:
		mov	byte_6FFD6, 0
		pop	bp
		retf
FlightControl_InvalidateCacheB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg102 L1000-1067. Cache frame (byte_6FFD6). Terme 'grav' de Aero_SumLinearForces. si =
; &jdyn[0x1E] ; pré-remplit le vecteur (0, 0, dword_6FFD7) puis
; [[[jdyn+0x1E]]+2]->[+0x6C](magic 0x2F1A) le tourne MONDE->CORPS. dword_6FFD7 = CONSTANTE DE
; GRAVITÉ = -2508 (24.8) = -9.8 m/s^2 (init loc_47E74, strike.asm:144603, 0xFFFFF634). Donc
; grav = worldToBody((0,0,-9.8)). Confirme unités SI (kg/N/m/s). Ajouté à accel APRÈS division
; par la masse.
; ==============================================================================================
FlightControl_ResolveParamCached	proc far		; CODE XREF: FlightControl_ComputeWeightedCoeff+1Ap
					; Aero_SumLinearForces_48639+92P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si

loc_470CA:
		mov	si, [bp+arg_4]
		mov	al, byte_6FFD6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_47101
		xor	eax, eax
		mov	dword_6FFCE, eax
		mov	dword_6FFCA, eax
		mov	eax, dword_6FFD7
		mov	dword_6FFD2, eax
		push	2F1Ah
		mov	bx, [si]
		push	word ptr [bx+2]
		mov	bx, [bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+6Ch]
		add	sp, 4
		mov	byte_6FFD6, 1

loc_47101:				; CODE XREF: FlightControl_ResolveParamCached+Ej
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_4710C
		mov	ax, si
		jmp	short loc_47116
; ���������������������������������������������������������������������������

loc_4710C:				; CODE XREF: FlightControl_ResolveParamCached+40j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_47116:				; CODE XREF: FlightControl_ResolveParamCached+44j
		or	ax, ax
		jz	short loc_47135
		mov	eax, dword_6FFCA
		mov	[si], eax
		mov	eax, dword_6FFCE
		mov	[si+4],	eax
		mov	eax, dword_6FFD2
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_47137
; ���������������������������������������������������������������������������

loc_47135:				; CODE XREF: FlightControl_ResolveParamCached+52j
		mov	ax, si

loc_47137:				; CODE XREF: FlightControl_ResolveParamCached+6Dj
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
FlightControl_ResolveParamCached	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,101L — combine le résultat de sub_470C6 avec un facteur résolu via vtable[0x10], cache
; (byte_6FFC9) : calcul composite d'un coefficient aérodynamique pondéré par la masse/inertie.
; ==============================================================================================
FlightControl_ComputeWeightedCoeff	proc far		; CODE XREF: FlightControl_ComputeAngularAccel+18p
					; seg109:0255P

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_4]
		mov	al, byte_6FFC9
		mov	ah, 0
		or	ax, ax
		jnz	short loc_471CA
		push	si
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		push	cs
		call	near ptr FlightControl_ResolveParamCached
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	dword_6FFBD, eax
		mov	eax, [bp+var_C]
		mov	dword_6FFC1, eax
		mov	eax, [bp+var_8]
		mov	dword_6FFC5, eax
		push	word ptr [si]
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6
		mov	eax, dword_6FFBD

loc_4718D:
		mov	edx, [bp+var_4]

loc_47191:
		imul	edx

loc_47194:
		shrd	eax, edx, 8
		mov	dword_6FFBD, eax
		mov	eax, dword_6FFC1
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	dword_6FFC1, eax
		mov	eax, dword_6FFC5
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	dword_6FFC5, eax
		mov	byte_6FFC9, 1

loc_471CA:				; CODE XREF: FlightControl_ComputeWeightedCoeff+11j
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_471D5
		mov	ax, si
		jmp	short loc_471DF
; ���������������������������������������������������������������������������

loc_471D5:				; CODE XREF: FlightControl_ComputeWeightedCoeff+8Fj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_471DF:				; CODE XREF: FlightControl_ComputeWeightedCoeff+93j
		or	ax, ax
		jz	short loc_471FE
		mov	eax, dword_6FFBD
		mov	[si], eax
		mov	eax, dword_6FFC1
		mov	[si+4],	eax
		mov	eax, dword_6FFC5
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_47200
; ���������������������������������������������������������������������������

loc_471FE:				; CODE XREF: FlightControl_ComputeWeightedCoeff+A1j
		mov	ax, si

loc_47200:				; CODE XREF: FlightControl_ComputeWeightedCoeff+BCj
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
FlightControl_ComputeWeightedCoeff	endp

; ���������������������������������������������������������������������������

loc_47209:				; CODE XREF: seg082:0D14J
					; DATA XREF: seg339:1D0Eo ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,71L — orchestre sub_47290 (reset), sub_47140 et sub_46F5E, additionne les résultats,
; divise par la masse (sub_46392) : orchestrateur de calcul d'accélération angulaire composite
; (somme de moments / inertie).
; ==============================================================================================
FlightControl_ComputeAngularAccel	proc far		; CODE XREF: seg082:08D7J seg082:0963J ...

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
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr FlightControl_InvalidateAllMomentCache
		pop	cx
		push	si
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs
		call	near ptr FlightControl_ComputeWeightedCoeff
		add	sp, 6
		mov	ax, si
		add	ax, 4
		push	ax
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	cs
		call	near ptr FlightControl_ComputeWindComponent
		add	sp, 6
		mov	eax, [bp+var_C]
		add	eax, [bp+var_18]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_8]
		add	eax, [bp+var_14]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_4]
		add	eax, [bp+var_10]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_28], eax
		lea	ax, [bp+var_30]
		push	ax
		push	word ptr [si]
		call	Physics_ComputeAcceleration

loc_47288:
		add	sp, 4

loc_4728B:
		mov	al, 1
		pop	si
		leave
		retf
FlightControl_ComputeAngularAccel	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,25L — invalide deux groupes de cache (sub_470B4, sub_47095) : invalidation complète du
; cache de moments avant recalcul.
; ==============================================================================================
FlightControl_InvalidateAllMomentCache	proc far		; CODE XREF: FlightControl_ComputeAngularAccel+Dp

arg_0		= word ptr  6

		push	bp

loc_47291:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_6FF9A, 0
		push	si
		push	cs
		call	near ptr FlightControl_InvalidateCacheB
		pop	cx
		mov	ax, si
		add	ax, 4
		push	ax
		push	cs
		call	near ptr FlightControl_InvalidateMomentCache
		pop	cx
		pop	si
		pop	bp
		retf
FlightControl_InvalidateAllMomentCache	endp

; ���������������������������������������������������������������������������

loc_472B0:				; CODE XREF: seg082:08C0J seg082:0957J
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+0Ch]
		pop	cx
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_472C2:				; CODE XREF: seg082:08A9J seg082:094BJ ...
		push	bp

loc_472C3:
		mov	bp, sp
		mov	ax, [bp+6]

loc_472C8:
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_472CA:				; CODE XREF: seg082:0BC6J seg082:0C67J
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si

loc_472D1:
		mov	si, [bp+6]
		push	si
		nop

loc_472D6:
		push	cs

loc_472D7:
		call	near ptr FlightControl_InvalidateWindAndCacheC
		pop	cx
		push	si
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		nop
		push	cs
		call	near ptr FlightControl_CacheTripleParam_477F0
		add	sp, 6
		lea	ax, [bp-0Ch]
		push	ax
		push	word ptr [si+2]
		call	Physics_ComputeAcceleration
		add	sp, 4
		mov	al, 1
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_472FD:				; CODE XREF: seg082:0BAFJ seg082:0C50J
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si+4]
		call	dword ptr [bx+0Ch]
		pop	cx
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg102 L1411-1644 (ex-Aero_ComputeCoeffSaturating). COURBE MANETTE -> POUSSEE. Appelee
; par PhysicsTicks : Aero_ThrottleThrustCurve(&jdyn[0x22], cran) -> jdyn[0x28] (poussee N,
; 24.8). poussee = jdyn[0x2C] * fThrottle(cran) * fLapse(h), borne >=0. fThrottle: cran<=5 ->
; (cran/5)*jdyn[0x30] ; cran>5 -> jdyn[0x30]+(1-jdyn[0x30])*(cran-5)/5 (0 a cran0,
; jdyn[0x30]=fraction MIL a cran5, 1.0 a cran10 pleine PC ; cran=-1 -> 0). fLapse(h): V<=Vref
; -> 1-(V/Vref)*(1-jdyn[0x31]) ; V>Vref -> jdyn[0x31]-jdyn[0x31]*(V-Vref)/(Vcut-Vref)
; (href=11000 m (0x2AF800 24.8) ; hcut=jdyn[0x32]*100 m (defaut 231->23100m) ;
; h=[[[jdyn+0x24]+2]+0x1A]=ALTITUDE). jdyn[0x2C]=poussee AF max ; jdyn[0x30/31/32] = les 3 u8
; du chunk THRS. Detail: DATA_MODEL.md 6.2.
; ==============================================================================================
Aero_ThrottleThrustCurve_4730F	proc far		; CODE XREF: JDYN_JumpToPoint_49242+259P
					; seg103:loc_494C6P ...

var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
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
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 36h
		push	si
		push	di
		mov	si, [bp+arg_4]
		movzx	eax, byte ptr [si+0Eh]
		mov	[bp+var_8], eax
		mov	al, [si+10h]
		mov	ah, 0
		movsx	eax, ax
		shl	eax, 8
		mov	[bp+var_C], eax
		imul	eax, 64h
		mov	[bp+var_C], eax
		mov	[bp+var_10], 2AF800h
		mov	al, [bp+arg_6]
		cbw
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	bx, [si+2]
		mov	di, [bx+2]
		add	di, 1Ah
		mov	eax, [di]
		mov	[bp+var_1A], eax
		cmp	[bp+var_1A], 0
		jge	short loc_47377
		mov	[bp+var_1A], 0

loc_47377:				; CODE XREF: Aero_ThrottleThrustCurve_4730F+5Ej
		cmp	[bp+var_14], 0FFFFFF00h
		jnz	short loc_47386

loc_47381:
		mov	ax, 1
		jmp	short loc_47388
; ���������������������������������������������������������������������������

loc_47386:				; CODE XREF: Aero_ThrottleThrustCurve_4730F+70j
		xor	ax, ax

loc_47388:				; CODE XREF: Aero_ThrottleThrustCurve_4730F+75j
		or	al, al
		jz	short loc_4739C

loc_4738C:
		mov	[bp+var_1E], 0

loc_47394:
		mov	eax, [bp+var_1E]
		mov	[bp+var_14], eax

loc_4739C:				; CODE XREF: Aero_ThrottleThrustCurve_4730F+7Bj
		mov	[bp+var_22], 500h
		mov	[bp+var_26], 0A00h
		mov	eax, [bp+var_14]
		cmp	eax, [bp+var_22]
		jg	short loc_473EA
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	edx, eax

loc_473C1:
		mov	ecx, [bp+var_22]

loc_473C5:
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2A], eax
		jmp	short loc_47458
; ���������������������������������������������������������������������������

loc_473EA:				; CODE XREF: Aero_ThrottleThrustCurve_4730F+A5j
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_8]
		sub	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_22]
		sub	[bp+var_4], eax
		mov	eax, [bp+var_2A]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_22]
		sub	[bp+var_4], eax
		mov	eax, [bp+var_2A]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_8]
		add	[bp+var_2A], eax

loc_47458:				; CODE XREF: Aero_ThrottleThrustCurve_4730F+D9j
		movzx	eax, byte ptr [si+0Fh]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_1A]
		cmp	eax, [bp+var_10]
		jg	short loc_474C2
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	edx, eax
		mov	ecx, [bp+var_10]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		neg	eax

loc_47490:
		mov	[bp+var_2E], eax
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_32]
		sub	[bp+var_4], eax
		mov	eax, [bp+var_2E]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		add	[bp+var_2E], 100h

loc_474C0:
		jmp	short loc_47523
; ���������������������������������������������������������������������������

loc_474C2:				; CODE XREF: Aero_ThrottleThrustCurve_4730F+15Aj
		mov	eax, [bp+var_32]
		neg	eax
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_10]
		sub	[bp+var_4], eax
		mov	eax, [bp+var_2E]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_10]
		sub	[bp+var_4], eax
		mov	eax, [bp+var_2E]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_32]
		add	[bp+var_2E], eax

loc_47523:				; CODE XREF: Aero_ThrottleThrustCurve_4730F:loc_474C0j
		add	si, 0Ah
		mov	eax, [si]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]

loc_47531:
		mov	edx, [bp+var_2E]

loc_47535:
		imul	edx

loc_47538:
		shrd	eax, edx, 8

loc_4753D:
		mov	[bp+var_36], eax

loc_47541:
		mov	eax, [bp+var_36]

loc_47545:
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	edx, [bp+var_2A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 0
		jge	short loc_4756C
		mov	[bp+var_14], 0

loc_4756C:				; CODE XREF: Aero_ThrottleThrustCurve_4730F+253j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_14]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Aero_ThrottleThrustCurve_4730F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,231L — variante de sub_4730F avec un paramètre supplémentaire (+0xA), calcule un flag de
; saturation (0xFF) : calcul de coefficient aérodynamique alternatif avec détection de
; décrochage/saturation.
; ==============================================================================================
Aero_ComputeCoeffAltSaturating	proc far		; CODE XREF: seg103:3616P

var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[bp+var_4], eax
		movzx	eax, byte ptr [si+0Eh]
		mov	[bp+var_A], eax
		mov	di, si
		add	di, 0Ah
		mov	eax, [bp+var_A]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A], eax
		mov	al, [si+10h]
		mov	ah, 0
		movsx	eax, ax
		shl	eax, 8

loc_475C3:
		mov	[bp+var_E], eax
		imul	eax, 64h
		mov	[bp+var_E], eax
		mov	bx, [si+2]

loc_475D2:
		mov	di, [bx+2]
		add	di, 1Ah
		mov	eax, [di]
		mov	[bp+var_12], eax
		mov	eax, [si+0Ah]
		cmp	eax, [bp+var_4]
		jg	short loc_475ED
		mov	[bp+var_4], eax

loc_475ED:				; CODE XREF: Aero_ComputeCoeffAltSaturating+67j
		cmp	[bp+var_12], 0
		jge	short loc_475FC
		mov	[bp+var_12], 0

loc_475FC:				; CODE XREF: Aero_ComputeCoeffAltSaturating+72j
		cmp	[bp+var_4], 0
		jge	short loc_4760A
		mov	[bp+var_6], 0FFh
		jmp	loc_477BF
; ���������������������������������������������������������������������������

loc_4760A:				; CODE XREF: Aero_ComputeCoeffAltSaturating+81j
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_A]
		jle	short loc_47617
		jmp	loc_476C6
; ���������������������������������������������������������������������������

loc_47617:				; CODE XREF: Aero_ComputeCoeffAltSaturating+92j
		mov	eax, [bp+var_12]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	edx, eax
		mov	ecx, [bp+var_E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx

loc_47635:
		mov	[bp+var_16], eax
		mov	eax, [bp+var_4]

loc_4763D:
		mov	[bp+var_1A], eax
		imul	eax, 5
		mov	[bp+var_1A], eax
		cmp	[bp+var_16], 100h
		jl	short loc_47656
		jmp	loc_47779
; ���������������������������������������������������������������������������

loc_47656:				; CODE XREF: Aero_ComputeCoeffAltSaturating+D1j
		mov	eax, [bp+var_1A]
		mov	edx, eax
		mov	ecx, [bp+var_A]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], 100h
		mov	eax, [bp+var_16]
		sub	[bp+var_1E], eax

loc_47680:
		mov	[bp+var_22], 100h

loc_47688:
		mov	eax, [bp+var_22]
		mov	edx, eax

loc_4768F:
		mov	ecx, [bp+var_1E]

loc_47693:
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		cmp	[bp+var_22], 0
		jge	short loc_476C0
		jmp	loc_47779
; ���������������������������������������������������������������������������

loc_476C0:				; CODE XREF: Aero_ComputeCoeffAltSaturating+13Bj
		mov	ax, word ptr [bp+var_1A+1]

loc_476C3:
		jmp	loc_477BC
; ���������������������������������������������������������������������������

loc_476C6:				; CODE XREF: Aero_ComputeCoeffAltSaturating+94j
		mov	eax, [si+0Ah]

loc_476CA:
		cmp	eax, [bp+var_4]
		jge	short loc_476D4
		mov	[bp+var_4], eax

loc_476D4:				; CODE XREF: Aero_ComputeCoeffAltSaturating+14Ej
		mov	eax, [bp+var_12]
		mov	[bp+var_16], eax
		mov	eax, [bp+var_16]
		mov	edx, eax
		mov	ecx, [bp+var_E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_16], eax
		cmp	[bp+var_16], 100h
		jge	short loc_47779
		mov	[bp+var_1A], 100h
		mov	eax, [bp+var_16]
		sub	[bp+var_1A], eax
		mov	[bp+var_1E], 100h
		mov	eax, [bp+var_1E]
		mov	edx, eax
		mov	ecx, [bp+var_1A]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1E], eax

loc_47732:
		mov	eax, [bp+var_1E]
		mov	[bp+var_22], eax

loc_4773A:
		mov	eax, [bp+var_22]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		mov	[bp+var_26], 0A00h
		sub	[bp+var_26], 500h
		mov	eax, [bp+var_22]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		cmp	[bp+var_22], 0
		jge	short loc_4777F

loc_47779:				; CODE XREF: Aero_ComputeCoeffAltSaturating+D3j
					; Aero_ComputeCoeffAltSaturating+13Dj ...
		mov	[bp+var_6], 0Ah
		jmp	short loc_477BF
; ���������������������������������������������������������������������������

loc_4777F:				; CODE XREF: Aero_ComputeCoeffAltSaturating+1F7j
		mov	eax, [bp+var_A]
		sub	[bp+var_22], eax
		mov	eax, [si+0Ah]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_A]
		sub	[bp+var_26], eax
		mov	eax, [bp+var_22]
		mov	edx, eax
		mov	ecx, [bp+var_26]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_22], eax
		add	[bp+var_22], 500h
		mov	ax, word ptr [bp+var_22+1]

loc_477BC:				; CODE XREF: Aero_ComputeCoeffAltSaturating:loc_476C3j
		mov	[bp+var_6], al

loc_477BF:				; CODE XREF: Aero_ComputeCoeffAltSaturating+87j
					; Aero_ComputeCoeffAltSaturating+1FDj
		cmp	[bp+var_6], 0Ah
		jle	short loc_477C9
		mov	[bp+var_6], 0Ah

loc_477C9:				; CODE XREF: Aero_ComputeCoeffAltSaturating+243j
		mov	al, [bp+var_6]
		pop	di
		pop	si
		leave
		retf
Aero_ComputeCoeffAltSaturating	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,12L — invalide un cache (byte_6FFE7) : invalidation d'un cache de coefficient
; additionnel.
; ==============================================================================================
FlightControl_InvalidateCacheC	proc far		; CODE XREF: FlightControl_InvalidateWindAndCacheC+Dp
					; FlightControl_InvalidateAllCachesGlobal+35P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_6FFE7, 0
		pop	bp
		retf
FlightControl_InvalidateCacheC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,15L — invalide deux caches (byte_6FF9A via sub_477D0) : invalidation combinée cache vent
; + coefficient.
; ==============================================================================================
FlightControl_InvalidateWindAndCacheC	proc far		; CODE XREF: seg102:loc_472D7p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_6FF9A, 0
		push	ax
		push	cs
		call	near ptr FlightControl_InvalidateCacheC
		pop	cx
		pop	bp
		retf
FlightControl_InvalidateWindAndCacheC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg102 L1929-1989. Cache frame (byte_6FFE7). Construit le VECTEUR DE POUSSEE :
; dword_6FFDB=0, dword_6FFDF=[arg_4+6], dword_6FFE3=0. Appele par Aero_SumLinearForces_48639
; avec arg_4 = &jdyn[0x22] -> [arg_4+6] = jdyn[0x28] = magnitude de poussee (calculee par
; PhysicsTicks). Sortie = (0, jdyn[0x28], 0) : la poussee agit PUREMENT selon l'axe corps
; longitudinal (composante 1). Detail : analysis/DATA_MODEL.md 6.2.
; ==============================================================================================
FlightControl_CacheTripleParam_477F0	proc far		; CODE XREF: seg102:0983p
					; Aero_SumLinearForces_48639+42P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	al, byte_6FFE7
		mov	ah, 0
		or	ax, ax
		jnz	short loc_47818
		xor	eax, eax
		mov	dword_6FFE3, eax
		mov	dword_6FFDB, eax
		mov	eax, [si+6]
		mov	dword_6FFDF, eax
		mov	byte_6FFE7, 1

loc_47818:				; CODE XREF: FlightControl_CacheTripleParam_477F0+Ej
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_47823
		mov	ax, si
		jmp	short loc_4782D
; ���������������������������������������������������������������������������

loc_47823:				; CODE XREF: FlightControl_CacheTripleParam_477F0+2Dj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_4782D:				; CODE XREF: FlightControl_CacheTripleParam_477F0+31j
		or	ax, ax
		jz	short loc_4784C
		mov	eax, dword_6FFDB
		mov	[si], eax

loc_47838:
		mov	eax, dword_6FFDF
		mov	[si+4],	eax
		mov	eax, dword_6FFE3
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_4784E
; ���������������������������������������������������������������������������

loc_4784C:				; CODE XREF: FlightControl_CacheTripleParam_477F0+3Fj
		mov	ax, si

loc_4784E:				; CODE XREF: FlightControl_CacheTripleParam_477F0+5Aj
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
FlightControl_CacheTripleParam_477F0	endp

; ���������������������������������������������������������������������������

loc_47857:				; CODE XREF: seg082:0B98J seg082:0C39J
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4785F:				; CODE XREF: seg082:0C22J
					; DATA XREF: seg339:1FCEo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_47867:				; CODE XREF: seg082:0EAEJ seg082:0F4FJ
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+6]
		push	si
		nop
		push	cs
		call	near ptr FlightControl_InvalidateAllCaches
		pop	cx
		push	si
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		nop
		push	cs

loc_47880:
		call	near ptr FlightControl_ComputeWindComponentWrapper
		add	sp, 6
		lea	ax, [bp-0Ch]
		push	ax
		push	word ptr [si]
		call	Physics_ComputeAcceleration

loc_47891:
		add	sp, 4

loc_47894:
		push	si
		push	ss
		lea	ax, [bp-18h]
		push	ax
		nop
		push	cs
		call	near ptr Aero_ComputeForcesMain_4791E
		add	sp, 6
		lea	ax, [bp-18h]
		push	ax
		push	si
		push	cs
		call	near ptr Physics_IntegrateSecondaryPosition
		add	sp, 4
		mov	al, 1
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_478B3:				; CODE XREF: seg082:0E97J seg082:0F38J
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si+2]
		call	dword ptr [bx+20h]
		pop	cx
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,12L — invalide un cache (byte_6FFF4) : invalidation du cache principal de calcul de
; forces.
; ==============================================================================================
FlightControl_InvalidateMainCache	proc far		; CODE XREF: FlightControl_InvalidateAllCaches+1Cp
					; FlightControl_InvalidateAllCachesGlobal+14P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_6FFF4, 0
		pop	bp
		retf
FlightControl_InvalidateMainCache	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,25L — invalide plusieurs caches (sub_469EC, sub_47095, sub_478C5) : invalidation globale
; de tous les caches de moments/forces avant un nouveau tick physique.
; ==============================================================================================
FlightControl_InvalidateAllCaches	proc far		; CODE XREF: seg102:0F14p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte_6FF9A, 0
		push	si
		push	cs
		call	near ptr FlightControl_InvalidateRollPitchCache
		pop	cx
		push	word ptr [si+10h]
		push	cs
		call	near ptr FlightControl_InvalidateMomentCache
		pop	cx
		push	si
		push	cs
		call	near ptr FlightControl_InvalidateMainCache
		pop	cx
		pop	si
		pop	bp
		retf
FlightControl_InvalidateAllCaches	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,24L — wrapper vers sub_46F5E : calcul de composante de vent, variante d'appel simplifié.
; ==============================================================================================
FlightControl_ComputeWindComponentWrapper	proc far		; CODE XREF: seg102:loc_47880p

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	word ptr [si+10h]
		push	large [bp+var_4]
		push	cs
		call	near ptr FlightControl_ComputeWindComponent
		add	sp, 6
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
FlightControl_ComputeWindComponentWrapper	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, seg102 L2176-2824. SOLVEUR D'ASSERVISSEMENT D'ATTITUDE (loi de rappel en racine
; carrée), cache frame dword_6FFE8/EC/F0. q' = Aero_DynamicPressure(&si[0x10]) * si[0x12] /
; 100. Angles d'écoulement actuels alpha,beta = Aero_FlowAngle_AoA/Sideslip, bornés +/-0x5A00
; (90 deg, cf. var_8/var_C) quand flux inversé. err_alpha = |si[0x16]-alpha| (var_14),
; err_beta = |si[0x1A]-beta| (var_1C), les DEUX en 24.8 fixe (unité = degré, ex. 0x5A00=90.0).
; moment = +/-2*sqrt(q'*|err|), rate-limité à +/-(err*dword_70454) (amorti critique). SEUIL
; RELU OCTET-PRÈS (session 2026-09-05, L2562-2569 & L2573-2584) : mov var_80,38h(56) / shl
; eax,8 (var_84=var_88=3800h, jamais relue ensuite dans cette fonction - tres probablement le
; sous-produit d'une macro FIXED-point generique (ex. FIXED(56)) qui calcule systematiquement
; la forme mise a l'echelle, meme quand CET appel particulier compare contre la forme brute ;
; pas du code mort au sens propre, juste un intermediaire non consomme ici) / sar eax,8
; (round-trip => eax=56 brut, PAS 0x3800) / cmp eax,[var_14 ou var_1C] / jle. La comparaison
; finale est donc 56 (brut) <= |err| (en 24.8, unité degré*256), PAS |err| >= 0x3800. Le seuil
; réel est 56/256 = 0.21875° et NON 56° (correction du résumé précédent) : si |err| <
; 0.21875°, mov var_20/var_4C,0 (moment mis à 0 - zone morte anti-bruit près de la cible),
; sinon calcul normal. Motif de scale-puis-unscale identique (et confirmant l'interprétation)
; dans Matrix_BuildAxisX_56EC3 (seg116). incr = (moment - si[4])*dt borné +/-3*q' + gardes
; anti-dépassement. Utility_Helper_55E65(tag 0x2F38) stocke le triplet (m_alpha, 0, m_beta).
; Detail : DATA_MODEL.md 6.2 item 2.
; ==============================================================================================
Aero_ComputeForcesMain_4791E	proc far		; CODE XREF: seg102:0F3Cp
					; Aero_ApplyGroundEffect:loc_48BE4P	...

var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B4		= word ptr -0B4h
var_B0		= dword	ptr -0B0h
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
		sub	sp, 0B4h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	al, byte_6FFF4
		mov	ah, 0
		or	ax, ax
		jz	short loc_47936

loc_47933:
		jmp	loc_47E24
; ���������������������������������������������������������������������������

loc_47936:				; CODE XREF: Aero_ComputeForcesMain_4791E+13j
		push	word ptr [si+10h]
		push	ss

loc_4793A:
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr Aero_DynamicPressure_46D13

loc_47942:
		add	sp, 6

loc_47945:
		mov	di, si

loc_47947:
		add	di, 12h
		mov	eax, [bp+var_4]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	ebx, 64h ; 'd'
		mov	eax, [bp+var_4]
		cdq
		idiv	ebx
		mov	[bp+var_4], eax
		push	si
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr Aero_FlowAngle_AoA_469FE
		add	sp, 6
		push	si
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs

loc_47984:
		call	near ptr Aero_FlowAngle_Sideslip_46AB5

loc_47987:
		add	sp, 6
		push	word ptr [si]
		push	ss

loc_4798D:
		lea	ax, [bp+var_B4]
		push	ax

loc_47992:
		call	Physics_ResolveWindVectorCached_4643B
		add	sp, 6
		cmp	[bp+var_B0], 0
		jge	short loc_479D4
		cmp	[bp+var_8], 0
		jle	short loc_479B3
		mov	[bp+var_8], 5A00h
		jmp	short loc_479BB
; ���������������������������������������������������������������������������

loc_479B3:				; CODE XREF: Aero_ComputeForcesMain_4791E+89j
		mov	[bp+var_8], 0FFFFA600h

loc_479BB:				; CODE XREF: Aero_ComputeForcesMain_4791E+93j
		cmp	[bp+var_C], 0

loc_479C0:
		jle	short loc_479CC

loc_479C2:
		mov	[bp+var_C], 5A00h
		jmp	short loc_479D4
; ���������������������������������������������������������������������������

loc_479CC:				; CODE XREF: Aero_ComputeForcesMain_4791E:loc_479C0j
		mov	[bp+var_C], 0FFFFA600h

loc_479D4:				; CODE XREF: Aero_ComputeForcesMain_4791E+82j
					; Aero_ComputeForcesMain_4791E+ACj
		mov	di, si
		add	di, 16h
		mov	eax, [di]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		sub	[bp+var_10], eax
		mov	eax, [bp+var_10]
		or	eax, eax
		jge	short loc_479F4
		neg	eax

loc_479F4:				; CODE XREF: Aero_ComputeForcesMain_4791E+D1j
		mov	[bp+var_14], eax
		mov	di, si
		add	di, 1Ah
		mov	eax, [di]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_C]
		sub	[bp+var_18], eax
		mov	eax, [bp+var_18]
		or	eax, eax
		jge	short loc_47A18
		neg	eax

loc_47A18:				; CODE XREF: Aero_ComputeForcesMain_4791E+F5j
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_20], eax
		cmp	[bp+var_10], 0
		jge	short loc_47A7C
		mov	eax, [bp+var_10]

loc_47A2F:
		neg	eax
		mov	[bp+var_24], eax

loc_47A36:
		mov	[bp+var_28], eax
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_28]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		lea	ax, [bp+var_30]
		push	ax
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		mov	eax, [bp+var_34]
		neg	eax
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		mov	[bp+var_20], eax
		jmp	short loc_47AB1
; ���������������������������������������������������������������������������

loc_47A7C:				; CODE XREF: Aero_ComputeForcesMain_4791E+10Bj
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_44], eax
		lea	ax, [bp+var_44]
		push	ax
		push	ss
		lea	ax, [bp+var_48]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		mov	eax, [bp+var_48]
		mov	[bp+var_20], eax

loc_47AB1:				; CODE XREF: Aero_ComputeForcesMain_4791E+15Cj
		mov	eax, [bp+var_20]
		shl	eax, 1
		mov	[bp+var_20], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_4C], eax
		cmp	[bp+var_18], 0
		jge	short loc_47B11
		mov	eax, [bp+var_18]

loc_47ACF:
		neg	eax

loc_47AD2:
		mov	[bp+var_50], eax

loc_47AD6:
		mov	[bp+var_54], eax
		mov	eax, [bp+var_4C]
		mov	edx, [bp+var_54]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_5C], eax
		lea	ax, [bp+var_5C]
		push	ax
		push	ss
		lea	ax, [bp+var_60]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		mov	eax, [bp+var_60]
		mov	[bp+var_4C], eax
		jmp	short loc_47B51
; ���������������������������������������������������������������������������

loc_47B11:				; CODE XREF: Aero_ComputeForcesMain_4791E+1ABj
		mov	eax, [bp+var_4C]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_64], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_68], eax
		lea	ax, [bp+var_68]
		push	ax

loc_47B31:
		push	ss
		lea	ax, [bp+var_6C]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		mov	eax, [bp+var_6C]
		neg	eax
		mov	[bp+var_70], eax
		mov	[bp+var_74], eax
		mov	[bp+var_4C], eax

loc_47B51:				; CODE XREF: Aero_ComputeForcesMain_4791E+1F1j
		mov	eax, [bp+var_4C]
		shl	eax, 1
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	edx, dword_70454
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_78], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	edx, dword_70454
		imul	edx
		shrd	eax, edx, 8

loc_47B92:
		mov	[bp+var_7C], eax
		cmp	[bp+var_78], 0
		jle	short loc_47BB1
		mov	eax, [bp+var_20]
		cmp	eax, [bp+var_78]
		jle	short loc_47BC3
		mov	eax, [bp+var_78]
		mov	[bp+var_20], eax
		jmp	short loc_47BC3
; ���������������������������������������������������������������������������

loc_47BB1:				; CODE XREF: Aero_ComputeForcesMain_4791E+27Dj
		mov	eax, [bp+var_20]
		cmp	eax, [bp+var_78]
		jge	short loc_47BC3
		mov	eax, [bp+var_78]
		mov	[bp+var_20], eax

loc_47BC3:				; CODE XREF: Aero_ComputeForcesMain_4791E+287j
					; Aero_ComputeForcesMain_4791E+291j ...
		cmp	[bp+var_7C], 0

loc_47BC8:
		jle	short loc_47BE4

loc_47BCA:
		mov	eax, [bp+var_7C]
		neg	eax

loc_47BD1:
		cmp	eax, [bp+var_4C]
		jle	short loc_47BFC
		mov	eax, [bp+var_7C]
		neg	eax
		mov	[bp+var_4C], eax
		jmp	short loc_47BFC
; ���������������������������������������������������������������������������

loc_47BE4:				; CODE XREF: Aero_ComputeForcesMain_4791E:loc_47BC8j
		mov	eax, [bp+var_7C]
		neg	eax
		cmp	eax, [bp+var_4C]
		jge	short loc_47BFC
		mov	eax, [bp+var_7C]
		neg	eax
		mov	[bp+var_4C], eax

loc_47BFC:				; CODE XREF: Aero_ComputeForcesMain_4791E+2B7j
					; Aero_ComputeForcesMain_4791E+2C4j ...
		mov	[bp+var_80], 38h ; '8'
		mov	eax, [bp+var_80]
		shl	eax, 8
		mov	[bp+var_84], eax
		mov	[bp+var_88], eax
		sar	eax, 8
		cmp	eax, [bp+var_14]
		jle	short loc_47C28
		mov	[bp+var_20], 0

loc_47C28:				; CODE XREF: Aero_ComputeForcesMain_4791E+300j
		mov	[bp+var_8C], 38h ; '8'

loc_47C31:
		mov	eax, [bp+var_8C]
		shl	eax, 8
		mov	[bp+var_90], eax
		mov	[bp+var_94], eax

loc_47C44:
		sar	eax, 8
		cmp	eax, [bp+var_1C]
		jle	short loc_47C56
		mov	[bp+var_4C], 0

loc_47C56:				; CODE XREF: Aero_ComputeForcesMain_4791E+32Ej
		mov	eax, [bp+var_20]
		mov	[bp+var_98], eax
		mov	di, si
		add	di, 4
		mov	eax, [di]
		sub	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	edx, dword_70454
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_98], eax

loc_47C83:
		mov	eax, [bp+var_4C]
		mov	[bp+var_9C], eax
		mov	di, si
		add	di, 0Ch
		mov	eax, [di]
		sub	[bp+var_9C], eax
		mov	eax, [bp+var_9C]
		mov	edx, dword_70454
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_A0], eax
		imul	eax, 3
		mov	[bp+var_A0], eax

loc_47CC2:
		mov	eax, [bp+var_98]
		mov	[bp+var_A4], eax

loc_47CCC:
		mov	eax, [bp+var_9C]

loc_47CD1:
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_A4]
		cmp	eax, [bp+var_A0]
		jle	short loc_47CEE
		mov	eax, [bp+var_A0]
		mov	[bp+var_A4], eax
		jmp	short loc_47D0A
; ���������������������������������������������������������������������������

loc_47CEE:				; CODE XREF: Aero_ComputeForcesMain_4791E+3C2j
		mov	eax, [bp+var_A0]
		neg	eax
		cmp	eax, [bp+var_A4]
		jle	short loc_47D0A
		mov	eax, [bp+var_A0]
		neg	eax
		mov	[bp+var_A4], eax

loc_47D0A:				; CODE XREF: Aero_ComputeForcesMain_4791E+3CEj
					; Aero_ComputeForcesMain_4791E+3DDj
		mov	eax, [bp+var_A8]
		cmp	eax, [bp+var_A0]
		jle	short loc_47D22
		mov	eax, [bp+var_A0]
		mov	[bp+var_A8], eax
		jmp	short loc_47D3E
; ���������������������������������������������������������������������������

loc_47D22:				; CODE XREF: Aero_ComputeForcesMain_4791E+3F6j
		mov	eax, [bp+var_A0]
		neg	eax
		cmp	eax, [bp+var_A8]
		jle	short loc_47D3E

loc_47D31:
		mov	eax, [bp+var_A0]

loc_47D36:
		neg	eax

loc_47D39:
		mov	[bp+var_A8], eax

loc_47D3E:				; CODE XREF: Aero_ComputeForcesMain_4791E+402j
					; Aero_ComputeForcesMain_4791E+411j
		cmp	[bp+var_20], 0
		jle	short loc_47D4A
		mov	ax, 1
		jmp	short loc_47D4C
; ���������������������������������������������������������������������������

loc_47D4A:				; CODE XREF: Aero_ComputeForcesMain_4791E+425j
		xor	ax, ax

loc_47D4C:				; CODE XREF: Aero_ComputeForcesMain_4791E+42Aj
		or	al, al
		jz	short loc_47D65
		mov	eax, [si+4]
		cmp	eax, [bp+var_20]
		jle	short loc_47D5F
		mov	ax, 1
		jmp	short loc_47D61
; ���������������������������������������������������������������������������

loc_47D5F:				; CODE XREF: Aero_ComputeForcesMain_4791E+43Aj
		xor	ax, ax

loc_47D61:				; CODE XREF: Aero_ComputeForcesMain_4791E+43Fj
		or	al, al
		jnz	short loc_47D8C

loc_47D65:				; CODE XREF: Aero_ComputeForcesMain_4791E+430j
		cmp	[bp+var_20], 0
		jge	short loc_47D71
		mov	ax, 1
		jmp	short loc_47D73
; ���������������������������������������������������������������������������

loc_47D71:				; CODE XREF: Aero_ComputeForcesMain_4791E+44Cj
		xor	ax, ax

loc_47D73:				; CODE XREF: Aero_ComputeForcesMain_4791E+451j
		or	al, al
		jz	short loc_47D96
		mov	eax, [si+4]
		cmp	eax, [bp+var_20]
		jge	short loc_47D86
		mov	ax, 1

loc_47D84:
		jmp	short loc_47D88
; ���������������������������������������������������������������������������

loc_47D86:				; CODE XREF: Aero_ComputeForcesMain_4791E+461j
		xor	ax, ax

loc_47D88:				; CODE XREF: Aero_ComputeForcesMain_4791E:loc_47D84j
		or	al, al
		jz	short loc_47D96

loc_47D8C:				; CODE XREF: Aero_ComputeForcesMain_4791E+445j
		mov	eax, [bp+var_98]
		mov	[bp+var_A4], eax

loc_47D96:				; CODE XREF: Aero_ComputeForcesMain_4791E+457j
					; Aero_ComputeForcesMain_4791E+46Cj
		cmp	[bp+var_4C], 0
		jle	short loc_47DA2
		mov	ax, 1
		jmp	short loc_47DA4
; ���������������������������������������������������������������������������

loc_47DA2:				; CODE XREF: Aero_ComputeForcesMain_4791E+47Dj
		xor	ax, ax

loc_47DA4:				; CODE XREF: Aero_ComputeForcesMain_4791E+482j
		or	al, al
		jz	short loc_47DBD
		mov	eax, [si+0Ch]
		cmp	eax, [bp+var_4C]
		jle	short loc_47DB7
		mov	ax, 1
		jmp	short loc_47DB9
; ���������������������������������������������������������������������������

loc_47DB7:				; CODE XREF: Aero_ComputeForcesMain_4791E+492j
		xor	ax, ax

loc_47DB9:				; CODE XREF: Aero_ComputeForcesMain_4791E+497j
		or	al, al
		jnz	short loc_47DE4

loc_47DBD:				; CODE XREF: Aero_ComputeForcesMain_4791E+488j
		cmp	[bp+var_4C], 0
		jge	short loc_47DC9
		mov	ax, 1
		jmp	short loc_47DCB
; ���������������������������������������������������������������������������

loc_47DC9:				; CODE XREF: Aero_ComputeForcesMain_4791E+4A4j
		xor	ax, ax

loc_47DCB:				; CODE XREF: Aero_ComputeForcesMain_4791E+4A9j
		or	al, al
		jz	short loc_47DEE
		mov	eax, [si+0Ch]

loc_47DD3:
		cmp	eax, [bp+var_4C]
		jge	short loc_47DDE
		mov	ax, 1
		jmp	short loc_47DE0
; ���������������������������������������������������������������������������

loc_47DDE:				; CODE XREF: Aero_ComputeForcesMain_4791E+4B9j
		xor	ax, ax

loc_47DE0:				; CODE XREF: Aero_ComputeForcesMain_4791E+4BEj
		or	al, al
		jz	short loc_47DEE

loc_47DE4:				; CODE XREF: Aero_ComputeForcesMain_4791E+49Dj
		mov	eax, [bp+var_9C]
		mov	[bp+var_A8], eax

loc_47DEE:				; CODE XREF: Aero_ComputeForcesMain_4791E+4AFj
					; Aero_ComputeForcesMain_4791E+4C4j
		sub	sp, 4
		mov	eax, [bp+var_A8]
		mov	[bp+var_BC], eax
		sub	sp, 4
		mov	[bp+var_C0], 0
		sub	sp, 4
		mov	eax, [bp+var_A4]

loc_47E0F:
		mov	[bp+var_C4], eax

loc_47E14:
		push	2F38h
		call	Utility_Helper_55E65

loc_47E1C:
		add	sp, 0Eh

loc_47E1F:
		mov	byte_6FFF4, 1

loc_47E24:				; CODE XREF: Aero_ComputeForcesMain_4791E:loc_47933j
		mov	si, [bp+arg_0]

loc_47E27:
		or	si, si
		jz	short loc_47E2F
		mov	ax, si
		jmp	short loc_47E39
; ���������������������������������������������������������������������������

loc_47E2F:				; CODE XREF: Aero_ComputeForcesMain_4791E+50Bj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_47E39:				; CODE XREF: Aero_ComputeForcesMain_4791E+50Fj
		or	ax, ax
		jz	short loc_47E58
		mov	eax, dword_6FFE8
		mov	[si], eax
		mov	eax, dword_6FFEC
		mov	[si+4],	eax
		mov	eax, dword_6FFF0
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_47E5A
; ���������������������������������������������������������������������������

loc_47E58:				; CODE XREF: Aero_ComputeForcesMain_4791E+51Dj
		mov	ax, si

loc_47E5A:				; CODE XREF: Aero_ComputeForcesMain_4791E+538j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Aero_ComputeForcesMain_4791E	endp

; ���������������������������������������������������������������������������

loc_47E64:				; CODE XREF: seg082:loc_3AA70J
					; seg082:06A1J	...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_47E6C:				; CODE XREF: seg082:068AJ seg082:0F0AJ
					; DATA XREF: ...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_47E74:				; DATA XREF: seg339:off_71EF0o
		push	bp
		mov	bp, sp
		sub	sp, 34h
		mov	dword_6FFA8, 0
		mov	dword_6FFAD, 0
		mov	dword_6FFB2, 0
		mov	dword_6FFB7, 0
		mov	dword_72A0A, 0
		mov	byte_72A0E, 2
		mov	byte_72A0F, 0
		mov	dword_72A10, 0
		mov	dword ptr [bp-4], 0
		mov	eax, [bp-4]
		mov	dword_6FFBD, eax
		mov	dword ptr [bp-8], 0
		mov	eax, [bp-8]
		mov	dword_6FFC1, eax
		mov	dword ptr [bp-0Ch], 0
		mov	eax, [bp-0Ch]
		mov	dword_6FFC5, eax
		mov	dword ptr [bp-10h], 0
		mov	eax, [bp-10h]
		mov	dword_6FFCA, eax
		mov	dword ptr [bp-14h], 0
		mov	eax, [bp-14h]
		mov	dword_6FFCE, eax
		mov	dword ptr [bp-18h], 0
		mov	eax, [bp-18h]

loc_47F16:
		mov	dword_6FFD2, eax

loc_47F1A:
		mov	dword ptr [bp-1Ch], 0FFFFF634h
		mov	eax, [bp-1Ch]
		mov	dword_6FFD7, eax
		mov	dword ptr [bp-20h], 0
		mov	eax, [bp-20h]
		mov	dword_6FFDB, eax
		mov	dword ptr [bp-24h], 0
		mov	eax, [bp-24h]
		mov	dword_6FFDF, eax
		mov	dword ptr [bp-28h], 0
		mov	eax, [bp-28h]
		mov	dword_6FFE3, eax
		mov	dword ptr [bp-2Ch], 0
		mov	eax, [bp-2Ch]
		mov	dword_6FFE8, eax
		mov	dword ptr [bp-30h], 0
		mov	eax, [bp-30h]
		mov	dword_6FFEC, eax
		mov	dword ptr [bp-34h], 0
		mov	eax, [bp-34h]
		mov	dword_6FFF0, eax
		leave
		retf
; ���������������������������������������������������������������������������

loc_47F8C:				; DATA XREF: seg339:off_71FCEo
		push	bp
		mov	bp, sp
		cmp	byte_72A0F, 0
		jz	short loc_47FB4
		cmp	dword_72A0A, 0
		jz	short loc_47FB4
		push	0
		mov	al, byte_72A0E
		push	ax
		push	595Ah
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_47FB4:				; CODE XREF: seg102:1634j seg102:163Cj
		mov	dword_72A0A, 0

loc_47FBD:
		mov	byte_72A0F, 0

loc_47FC2:
		mov	dword_72A10, 0
		pop	bp
		retf
seg102		ends
