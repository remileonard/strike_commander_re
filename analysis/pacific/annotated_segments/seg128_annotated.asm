seg128		segment	para public 'CODE' use16
		assume cs:seg128
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 66h, 0A3h, 7Eh, 35h, 66h, 0C7h, 6, 82h, 35h, 0, 0FFh, 0FFh, 7Fh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56CFF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di]
		add	ax, [si]
		mov	[si], ax
		mov	ax, [di+2]
		sub	ax, [si+2]
		mov	[si+2], ax
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_56CFF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56D1F		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_0]
		mov	ax, [si]
		shl	ax, 1
		call	Math_RandomScale_56C2F
		sub	ax, [si]
		mov	[bp+var_2], ax
		mov	ax, [si+2]
		shl	ax, 1
		call	Math_RandomScale_56C2F
		sub	ax, [si+2]
		mov	[bp+var_4], ax
		mov	ax, [si+4]
		shl	ax, 1
		call	Math_RandomScale_56C2F
		sub	ax, [si+4]
		mov	[bp+var_6], ax
		or	di, di
		jz	short loc_56D63
		mov	ax, di
		jmp	short loc_56D6D

loc_56D63:
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax

loc_56D6D:
		or	ax, ax
		jz	short loc_56D86
		mov	ax, [bp+var_2]
		mov	[di], ax
		mov	ax, [bp+var_4]
		mov	[di+2], ax
		mov	ax, [bp+var_6]
		mov	[di+4], ax
		mov	ax, di
		jmp	short loc_56D88

loc_56D86:
		mov	ax, di

loc_56D88:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_56D1F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Math_VectorLength3D_Scaled_54F57 (sub_54F57 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; longueur de vecteur 3D en virgule fixe avec mise à l'échelle anti-débordement : décale les
; composantes (Math_VectorLength_ShiftDownIfLarge_55793 / ShiftUpIfSmall_55868) avant de
; sommer les carrés et appeler Math_Sqrt_54BF1, puis rétablit l'échelle du résultat.
; Référencée par Formation_GuidanceSolution (sub_D081) et sub_DD21.
; ==============================================================================================
Math_VectorLength3D_Scaled_56D92		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
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
		jge	short loc_56DAB
		neg	eax

loc_56DAB:
		mov	[bp+var_12], eax
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_56DBB
		neg	eax

loc_56DBB:
		mov	[bp+var_E], eax
		mov	eax, [si+8]
		or	eax, eax
		jge	short loc_56DCB
		neg	eax

loc_56DCB:
		mov	[bp+var_A], eax
		push	1
		push	large 10h
		lea	ax, word ptr [bp+var_12]
		push	ax
		nop
		push	cs
		call	near ptr sub_575D2
		add	sp, 8
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_56E00
		push	1
		push	large 400h
		lea	ax, word ptr [bp+var_12]
		push	ax
		nop
		push	cs
		call	near ptr sub_57677
		add	sp, 8
		mov	[bp+var_2], al

loc_56E00:
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
		mov	eax, [bp+var_A]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_E]
		add	[bp+var_12], eax
		mov	eax, [bp+var_A]
		add	[bp+var_12], eax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_6]
		push	ax
		call	Math_Sqrt_56A1E
		add	sp, 6
		cmp	[bp+var_1], 0
		jz	short loc_56E6F
		mov	cl, [bp+var_1]
		mov	eax, [bp+var_6]
		sar	eax, cl
		jmp	short loc_56E7F

loc_56E6F:
		cmp	[bp+var_2], 0
		jz	short loc_56E83
		mov	cl, [bp+var_2]
		mov	eax, [bp+var_6]
		shl	eax, cl

loc_56E7F:
		mov	[bp+var_6], eax

loc_56E83:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_6]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Math_VectorLength3D_Scaled_56D92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Math_DotProduct3D_2375C
; (sub_2375C de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_DotProduct3D_5505B (sub_5505B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, 47L, LUE (2026-09-24). PRODUIT SCALAIRE de deux
; vecteurs 3x i32 24.8 : (a0*b0 + a1*b1 + a2*b2) en 64 bits (imul / add / adc), puis shrd 8 ->
; resultat 24.8 ecrit dans *arg_0. Ex-'Targeting_ComputeGeometryHelperA'. Utilise par
; Targeting_AcquireBestThreat, Aircraft_ComputeSeekerSignature_3E2F1 (aspect arriere),
; Targeting_SelectAndPrioritize et le cluster matrice/rotation.
; ==============================================================================================
Math_DotProduct3D_56E96		proc far

var_4		= dword ptr -4
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
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_DotProduct3D_56E96		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Vector_CrossProduct3D_550B7 (sub_550B7 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE (2026-09-24).
; Ex-'Vector_TransformHelperA'. PRODUIT VECTORIEL a x b en 24.8 (a = arg_4, b = arg_6) :
; (a1*b2 - a2*b1, a2*b0 - a0*b2, a0*b1 - a1*b0), chaque produit imul / shrd 8. Resultat ecrit
; dans arg_0 (alloue 12 octets si nul).
; ==============================================================================================
Vector_CrossProduct3D_56EF2		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		mov	di, [bp+arg_6]
		mov	eax, [si+4]
		mov	edx, [di+8]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [si+8]
		mov	edx, [di+4]
		imul	edx
		shrd	eax, edx, 8
		sub	ecx, eax
		mov	[bp+var_C], ecx
		mov	eax, [si+8]
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
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [si+4]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		sub	ecx, eax
		mov	[bp+var_4], ecx
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_56F85
		mov	ax, si
		jmp	short loc_56F8F

loc_56F85:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_56F8F:
		or	ax, ax
		jz	short loc_56FAE
		mov	eax, [bp+var_C]
		mov	[si], eax
		mov	eax, [bp+var_8]
		mov	[si+4], eax
		mov	eax, [bp+var_4]
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_56FB0

loc_56FAE:
		mov	ax, si

loc_56FB0:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Vector_CrossProduct3D_56EF2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Targeting_ComputeGeometryHelperB_5517F (sub_5517F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-02. (sortie, v, axe) : projection de v sur l'axe normalise : axe_n x dot(v,
; axe_n).
; ==============================================================================================
Targeting_ComputeGeometryHelperB_56FBA		proc far

var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
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
		mov	[bp+var_24], eax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		nop
		push	cs
		call	near ptr Vector_Normalize3D_57796
		pop	cx
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_2C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
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
		jz	short loc_57061
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_5706C

loc_57061:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_5706C:
		or	ax, ax
		jz	short loc_5708C
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_10]
		mov	[bx], eax
		mov	eax, [bp+var_18]
		mov	[bx+4], eax
		mov	eax, [bp+var_20]
		mov	[bx+8], eax
		jmp	short loc_5708C

loc_5708C:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Targeting_ComputeGeometryHelperB_56FBA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ChaseCamera_ComputeGeometryHelper_5525B (sub_5525B de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; référencée par sub_4D04E (proche de ChaseCamera_RenderEffect) — appelle
; Targeting_ComputeGeometryHelperB_5517F.
; ==============================================================================================
ChaseCamera_ComputeGeometryHelper_57096		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
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
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	cs
		call	near ptr Targeting_ComputeGeometryHelperB_56FBA
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
		jz	short loc_570E8
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_570F3

loc_570E8:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_570F3:
		or	ax, ax
		jz	short loc_57113
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_1C]
		mov	[bx], eax
		mov	eax, [bp+var_18]
		mov	[bx+4], eax
		mov	eax, [bp+var_14]
		mov	[bx+8], eax
		jmp	short loc_57113

loc_57113:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
ChaseCamera_ComputeGeometryHelper_57096		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5711C		proc far

var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
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
		push	3
		push	large 3E8h
		lea	ax, word ptr [bp+var_30]
		push	ax
		nop
		push	cs
		call	near ptr sub_57677
		add	sp, 8
		mov	eax, [bp+var_30]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		nop
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_Variant_57CA1
		add	sp, 6
		mov	eax, [bp+var_28]
		or	eax, eax
		jge	short loc_57180
		neg	eax

loc_57180:
		mov	[bp+var_14], eax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		cmp	[bp+var_18], 0
		jnz	short loc_571A9
		mov	[bp+var_1C], 2D000h
		mov	eax, [bp+var_1C]
		jmp	short loc_571F5

loc_571A9:
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_14]
		jle	short loc_571CE
		lea	ax, word ptr [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	Math_AsinOfRatio_568A3
		add	sp, 8
		mov	eax, [bp+var_20]
		jmp	short loc_571F5

loc_571CE:
		lea	ax, word ptr [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Math_AcosOfRatio_5683B
		add	sp, 8
		mov	eax, [bp+var_24]
		mov	[bp+var_4], eax
		cmp	[bp+var_28], 0
		jge	short loc_571F9
		neg	eax

loc_571F5:
		mov	[bp+var_4], eax

loc_571F9:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_5711C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5720C		proc far

var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		push	3
		push	large 3E8h
		lea	ax, word ptr [bp+var_48]
		push	ax
		nop
		push	cs
		call	near ptr sub_57677
		add	sp, 8
		mov	[bp+var_40], 0
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		mov	eax, [si]
		or	eax, eax
		jge	short loc_57267
		neg	eax

loc_57267:
		mov	[bp+var_C], eax
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_57277
		neg	eax

loc_57277:
		mov	[bp+var_10], eax
		cmp	[bp+var_8], 0
		jnz	short loc_572AB
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_5728D
		mov	ax, si
		jmp	short loc_57297

loc_5728D:
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_57297:
		or	ax, ax
		jz	short loc_572A6
		mov	dword ptr [si], 2D000h
		mov	ax, si
		jmp	short loc_572A8

loc_572A6:
		mov	ax, si

loc_572A8:
		jmp	loc_57383

loc_572AB:
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_C]
		jl	short loc_57330
		cmp	dword ptr [si+4], 0
		jl	short loc_572D8
		lea	ax, word ptr [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_14]
		push	ax
		call	Math_AsinOfRatio_568A3
		add	sp, 8
		mov	eax, [bp+var_14]
		jmp	loc_57375

loc_572D8:
		cmp	dword ptr [si], 0
		jl	short loc_57307
		lea	ax, word ptr [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		call	Math_AsinOfRatio_568A3
		add	sp, 8
		mov	eax, 0B400h
		sub	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		jmp	short loc_57375

loc_57307:
		lea	ax, word ptr [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Math_AsinOfRatio_568A3
		add	sp, 8
		mov	eax, 0FFFF4C00h
		sub	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	[bp+var_2C], eax
		jmp	short loc_57375

loc_57330:
		cmp	dword ptr [si], 0
		jl	short loc_57351
		lea	ax, word ptr [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_30]
		push	ax
		call	Math_AcosOfRatio_5683B
		add	sp, 8
		mov	eax, [bp+var_30]
		jmp	short loc_57375

loc_57351:
		lea	ax, word ptr [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_34]
		push	ax
		call	Math_AcosOfRatio_5683B
		add	sp, 8
		mov	eax, [bp+var_34]
		neg	eax
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax

loc_57375:
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax

loc_57383:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_5720C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Missile_ComputeDirectionVector2D_5554E (sub_5554E de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, construit un vecteur direction
; 2D à partir d'un angle (cos/sin bruts, sub_58063/sub_580A7). Référencée par sub_781D0.
; ==============================================================================================
Missile_ComputeDirectionVector2D_5738D		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
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
		call	sub_59E37
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_A], eax
		push	large [bp+var_E]
		call	Math_CosRaw_59E7D
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_E], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4], eax
		mov	eax, [si+8]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		add	[si+4], eax
		mov	eax, [si+8]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		sub	[si+8], eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Missile_ComputeDirectionVector2D_5738D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57454		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
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
		call	sub_59E37
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_A], eax
		push	large [bp+var_E]
		call	Math_CosRaw_59E7D
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_E], eax
		mov	eax, [si]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+8]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		sub	[si], eax
		mov	eax, [si+8]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		add	[si+8], eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_57454		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Vector_RotateHeading2D_556D4 (sub_556D4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE (2026-09-25).
; Ex-'Missile_ComputeDirectionVector2D'. Tourne en place la partie horizontale d'un vecteur de
; theta (degres 24.8) : c0' = c0 cos + c1 sin, c1' = c1 cos - c0 sin (Math_CosRaw_580A7 /
; Math_SinRaw_58063), c2 inchange. Le cap atan2(c0, c1) augmente de theta.
; ==============================================================================================
Vector_RotateHeading2D_57513		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
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
		call	sub_59E37
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_A], eax
		push	large [bp+var_E]
		call	Math_CosRaw_59E7D
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_E], eax
		mov	eax, [si]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+4]
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
		mov	[si+4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		sub	[si+4], eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Vector_RotateHeading2D_57513		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_575D2		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		or	eax, eax
		jge	short loc_575E7
		neg	eax

loc_575E7:
		mov	[bp+var_10], eax
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_575F7
		neg	eax

loc_575F7:
		mov	[bp+var_C], eax
		mov	eax, [si+8]
		or	eax, eax
		jge	short loc_57607
		neg	eax

loc_57607:
		mov	[bp+var_8], eax
		mov	dl, 0
		mov	eax, [bp+var_10]
		or	eax, [bp+var_C]
		or	eax, [bp+var_8]
		mov	[bp+var_4], eax
		mov	eax, [bp+arg_2]
		shl	eax, 8
		mov	[bp+arg_2], eax
		cmp	[bp+var_4], 0
		jz	short loc_5764D
		jmp	short loc_57643

loc_57632:
		mov	cl, [bp+arg_6]
		mov	eax, [bp+var_4]
		shl	eax, cl
		mov	[bp+var_4], eax
		add	dl, [bp+arg_6]

loc_57643:
		mov	eax, [bp+var_4]
		cmp	eax, [bp+arg_2]
		jl	short loc_57632

loc_5764D:
		or	dl, dl
		jz	short loc_57672
		mov	eax, [si]
		mov	cl, dl
		shl	eax, cl
		mov	[si], eax
		mov	eax, [si+4]
		shl	eax, cl
		mov	[si+4], eax
		mov	eax, [si+8]
		shl	eax, cl
		mov	[si+8], eax

loc_57672:
		mov	al, dl
		pop	si
		leave
		retf
sub_575D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57677		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		mov	dl, 0
		mov	eax, [si]
		or	eax, eax
		jge	short loc_5768E
		neg	eax

loc_5768E:
		mov	[bp+var_10], eax
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_5769E
		neg	eax

loc_5769E:
		mov	[bp+var_C], eax
		mov	eax, [si+8]
		or	eax, eax
		jge	short loc_576AE
		neg	eax

loc_576AE:
		mov	[bp+var_8], eax
		mov	eax, [bp+var_10]
		or	eax, [bp+var_C]
		or	eax, [bp+var_8]
		mov	[bp+var_4], eax
		mov	eax, [bp+arg_2]
		shl	eax, 8
		mov	[bp+arg_2], eax
		jmp	short loc_576E1

loc_576D0:
		mov	cl, [bp+arg_6]
		mov	eax, [bp+var_4]
		sar	eax, cl
		mov	[bp+var_4], eax
		add	dl, [bp+arg_6]

loc_576E1:
		mov	eax, [bp+var_4]
		cmp	eax, [bp+arg_2]
		jg	short loc_576D0
		or	dl, dl
		jz	short loc_57710
		mov	eax, [si]
		mov	cl, dl
		sar	eax, cl
		mov	[si], eax
		mov	eax, [si+4]
		sar	eax, cl
		mov	[si+4], eax
		mov	eax, [si+8]
		sar	eax, cl
		mov	[si+8], eax

loc_57710:
		mov	al, dl
		pop	si
		leave
		retf
sub_57677		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Vector_NormalizeInPlace_5593A (sub_5593A de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE (2026-09-24). Ex-'Targeting_LineOfSightCheck' (FAUX). NORMALISATION en place d'un
; vecteur 3x i32 24.8 : n = Math_VectorLength3D_Raw_5828E(v) ; si n != 0, chaque composante =
; (c << 8) / n (shl eax,8 / idiv ecx) ; n nul : vecteur inchange. Renvoie le pointeur.
; ==============================================================================================
Vector_NormalizeInPlace_57715		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	large [si+8]
		push	large [si+4]
		push	large [si]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_57791
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
		mov	[si+4], eax
		mov	eax, [si+8]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+8], eax

loc_57791:
		mov	ax, si
		pop	si
		leave
		retf
Vector_NormalizeInPlace_57715		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Vector_Normalize3D_241B4 (sub_241B4 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à Vector_Normalize3D_559BB
; (sub_559BB de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, seg116 L1587-1640. Nom hérité 'TransformHelperB' FAUX : c'est une NORMALISATION
; 3D (pas une rotation). Math_VectorLength_ShiftDownIfLarge_55793(si,0x10,1) (mise à l'échelle
; si grand) ; Math_VectorLength3D_Scaled_54F57(si) -> longueur ; puis si[0]/=len, si[4]/=len,
; si[8]/=len -> vecteur unitaire (24.8, norme = 0x100). Utilisé par le cluster matrice
; (Matrix_ApplyToVectorX/Y/Z, 3x chacun = orthonormalisation) et par
; Aero_ComputeDragWithFeedback (direction de traînée).
; ==============================================================================================
Vector_Normalize3D_57796		proc far

var_4		= dword ptr -4
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
		call	near ptr sub_575D2
		add	sp, 8
		push	si
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		cmp	[bp+var_4], 0
		jz	short loc_5780D
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
		mov	[si+4], eax
		mov	eax, [si+8]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+8], eax

loc_5780D:
		mov	ax, si
		pop	si
		leave
		retf
Vector_Normalize3D_57796		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Utility_Helper_24233
; (sub_24233 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Utility_Helper_55A37 (sub_55A37 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, référencée par sub_29A7D (rôle exact non détaillé, hors
; cluster identifié).
; ==============================================================================================
Utility_Helper_57812		proc far

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
		mov	[si+4], eax
		mov	eax, [si+8]
		neg	eax
		mov	[si+8], eax
		mov	ax, si
		pop	si
		pop	bp
		retf
Utility_Helper_57812		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Utility_Helper_55A62
; (sub_55A62 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée par sub_3844F (rôle exact non détaillé).
; ==============================================================================================
Utility_Helper_5783D		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

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
		mov	[si+4], eax
		mov	eax, [si+8]
		imul	ecx
		shrd	eax, edx, 8
		mov	[si+8], eax
		pop	si
		pop	bp
		retf
Utility_Helper_5783D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Vector_SetLength_55A9E
; (sub_55A9E de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-15. Vector_NormalizeInPlace_5593A(v) puis v *= *longueur (24.8 ;
; saute si longueur = 1,0) : met le vecteur a la longueur donnee. Renvoie v.
; Ex-'Vector_SetLength_55A9E'.
; ==============================================================================================
Vector_SetLength_57879		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr Vector_NormalizeInPlace_57715
		pop	cx
		cmp	dword ptr [di], 100h
		jz	short loc_578D9
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
		mov	[si+4], eax
		mov	eax, [si+8]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8], eax

loc_578D9:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Vector_SetLength_57879		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_578DF		proc far

var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
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
		push	3
		push	large 3E8h
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	cs
		call	near ptr sub_57677
		add	sp, 8
		push	3
		push	large 3E8h
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	cs
		call	near ptr sub_57677
		add	sp, 8
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_579AD
		mov	si, word ptr [bp+arg_0]
		or	si, si
		jz	short loc_57990
		mov	ax, si
		jmp	short loc_5799A

loc_57990:
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_5799A:
		or	ax, ax
		jz	short loc_579A9
		mov	dword ptr [si], 0
		mov	ax, si
		jmp	short loc_579AB

loc_579A9:
		mov	ax, si

loc_579AB:
		jmp	short loc_579D5

loc_579AD:
		lea	ax, word ptr [bp+var_4]
		push	ax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_56E96
		add	sp, 8
		lea	ax, [bp+var_14]
		push	ax
		push	large [bp+arg_0]
		call	Math_AcosOfRatio_5683B
		add	sp, 8

loc_579D5:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_578DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_579DE		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
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
		mov	[bp+var_14], eax
		mov	eax, [si+4]
		sub	eax, [di+4]
		mov	[bp+var_10], eax
		mov	eax, [si+8]
		sub	eax, [di+8]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_18], eax
		push	eax
		push	large [bp+var_1C]
		push	large [bp+var_20]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	bx, word ptr [bp+var_4]
		mov	[bx], eax
		mov	es, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_579DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57A5D		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_4]
		cmp	dword ptr [si+4], 0
		jz	short loc_57ABB
		mov	di, si
		add	di, 4
		mov	eax, [si+8]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		neg	eax
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		call	Math_ArcTan_5690B
		add	sp, 6
		mov	eax, [bp+var_18]

loc_57AB5:
		mov	[bp+var_4], eax
		jmp	short loc_57AED

loc_57ABB:
		cmp	dword ptr [si+8], 0
		jle	short loc_57AD0
		mov	[bp+var_1C], 0FFFFA600h
		mov	eax, [bp+var_1C]
		jmp	short loc_57AB5

loc_57AD0:
		cmp	dword ptr [si+8], 0
		jge	short loc_57AE5
		mov	[bp+var_20], 5A00h
		mov	eax, [bp+var_20]
		jmp	short loc_57AB5

loc_57AE5:
		mov	[bp+var_4], 0

loc_57AED:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_57A5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57B01		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+arg_4]
		push	large [si+8]
		push	large [si+4]
		push	large [si]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jle	short loc_57B62
		lea	ax, word ptr [bp+var_8]
		push	ax
		mov	eax, [si]
		neg	eax
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	Math_AsinOfRatio_568A3
		add	sp, 8
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		jmp	short loc_57B6A

loc_57B62:
		mov	[bp+var_4], 0

loc_57B6A:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_57B01		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Utility_Helper_55DB4
; (sub_55DB4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée par sub_315B (rôle exact non détaillé).
; ==============================================================================================
Utility_Helper_57B7D		proc far

var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
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
		mov	[si+4], eax
		mov	ax, [bp+arg_6]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[si+8], eax
		pop	si
		leave
		retf
Utility_Helper_57B7D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Utility_Helper_55E11
; (sub_55E11 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée par sub_838BF (rôle exact non détaillé).
; ==============================================================================================
Utility_Helper_57BDA		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si], eax
		mov	eax, [bp+arg_6]
		mov	[bp+var_C], eax
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[si+4], eax
		mov	eax, [bp+arg_A]
		mov	[bp+var_14], eax
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[si+8], eax
		pop	si
		leave
		retf
Utility_Helper_57BDA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Utility_Helper_246F0
; (sub_246F0 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Utility_Helper_55E65 (sub_55E65 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, référencée par sub_2B0F2 (rôle exact non détaillé).
; ==============================================================================================
Utility_Helper_57C2E		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[si], eax
		mov	eax, [bp+arg_6]
		mov	[si+4], eax
		mov	eax, [bp+arg_A]
		mov	[si+8], eax
		pop	si
		pop	bp
		retf
Utility_Helper_57C2E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57C4F		proc far

var_3C		= word ptr -3Ch
var_28		= word ptr -28h
var_14		= word ptr -14h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		mov	si, [bp+arg_0]
		push	3
		mov	ax, si
		add	ax, 8
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 4
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	3
		push	si
		lea	ax, [bp+var_3C]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	35C8h
		call	CRT_Msg_NullPtrAssign
		add	sp, 8
		pop	si
		leave
		retf
sub_57C4F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Math_VectorLength3D_Scaled_Variant_55ED8 (sub_55ED8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même triplet d'appels (55793/55868/54BF1) que Math_VectorLength3D_Scaled_54F57 — probable
; duplicat/variante, NON vérifié en détail. Référencée par sub_469FE.
; ==============================================================================================
Math_VectorLength3D_Scaled_Variant_57CA1		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
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
		jge	short loc_57CBA
		neg	eax

loc_57CBA:
		mov	[bp+var_12], eax
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_57CCA
		neg	eax

loc_57CCA:
		mov	[bp+var_E], eax
		mov	[bp+var_A], 0
		push	1
		push	large 10h
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	cs
		call	near ptr sub_575D2
		add	sp, 8
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_57D05
		push	1
		push	large 400h
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	cs
		call	near ptr sub_57677
		add	sp, 8
		mov	[bp+var_2], al

loc_57D05:
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
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_6]
		push	ax
		call	Math_Sqrt_56A1E
		add	sp, 6
		cmp	[bp+var_1], 0
		jz	short loc_57D58
		mov	cl, [bp+var_1]
		mov	eax, [bp+var_6]
		sar	eax, cl
		jmp	short loc_57D68

loc_57D58:
		cmp	[bp+var_2], 0
		jz	short loc_57D6C
		mov	cl, [bp+var_2]
		mov	eax, [bp+var_6]
		shl	eax, cl

loc_57D68:
		mov	[bp+var_6], eax

loc_57D6C:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_6]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Math_VectorLength3D_Scaled_Variant_57CA1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57D7F		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 100h
		mov	di, si
		mov	eax, [di]
		or	eax, eax
		jge	short loc_57D9F
		neg	eax

loc_57D9F:
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		sar	eax, 8
		mov	[bp+var_8], eax
		mov	di, si
		add	di, 4
		mov	eax, [di]
		or	eax, eax
		jge	short loc_57DC3
		neg	eax

loc_57DC3:
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		sar	eax, 8
		mov	[bp+var_14], eax
		xor	dx, dx
		jmp	short loc_57DF6

loc_57DDB:
		mov	eax, [bp+var_8]
		sar	eax, 3
		mov	[bp+var_8], eax
		mov	eax, [bp+var_14]
		sar	eax, 3
		mov	[bp+var_14], eax
		add	dx, 3

loc_57DF6:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_4]
		jg	short loc_57DDB
		mov	eax, [bp+var_14]
		cmp	eax, [bp+var_4]
		jg	short loc_57DDB
		or	dx, dx
		jz	short loc_57E24
		mov	eax, [si]
		mov	cl, dl
		sar	eax, cl
		mov	[si], eax
		mov	eax, [si+4]
		sar	eax, cl
		mov	[si+4], eax

loc_57E24:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_57D7F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UI_ComputeScaledVector_56061 (sub_56061 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; référencée depuis seg027 (UI) et en interne du segment, appelle sub_56215 et alloue
; (sub_658).
; ==============================================================================================
UI_ComputeScaledVector_57E2A		proc far

var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
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
		lea	ax, word ptr [bp+var_8]
		push	ax
		nop
		push	cs
		call	near ptr UI_ComputeScaledVectorHelper_57FDE
		pop	cx
		mov	eax, [bp+arg_0]
		mov	[bp+var_C], eax
		mov	eax, [si]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_4]
		imul	edx
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
		jz	short loc_57ED1
		mov	ax, word ptr [bp+var_C]
		jmp	short loc_57EDC

loc_57ED1:
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_C], ax

loc_57EDC:
		or	ax, ax
		jz	short loc_57EF4
		mov	bx, word ptr [bp+var_C]
		mov	eax, [bp+var_1C]
		mov	[bx], eax
		mov	eax, [bp+var_24]
		mov	[bx+4], eax
		jmp	short loc_57EF4

loc_57EF4:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
UI_ComputeScaledVector_57E2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57EFE		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
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
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr UI_ComputeScaledVector_57E2A
		add	sp, 8
		mov	eax, [si]
		sub	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	eax, [si+4]
		sub	eax, [bp+var_8]
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		cmp	word ptr [bp+var_4], 0
		jz	short loc_57F4C
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_57F57

loc_57F4C:
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_57F57:
		or	ax, ax
		jz	short loc_57F6F
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_14]
		mov	[bx], eax
		mov	eax, [bp+var_1C]
		mov	[bx+4], eax
		jmp	short loc_57F6F

loc_57F6F:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_57EFE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Weapon_ComputeVectorLength_561AF (sub_561AF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; référencée deux fois par sub_526F, utilise sub_5828E (longueur vectorielle).
; ==============================================================================================
Weapon_ComputeVectorLength_57F78		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	large 0
		push	large [si+4]
		push	large [si]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_57FD9
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
		mov	[si+4], eax

loc_57FD9:
		mov	ax, si
		pop	si
		leave
		retf
Weapon_ComputeVectorLength_57F78		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UI_ComputeScaledVectorHelper_24AFE (sub_24AFE de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; UI_ComputeScaledVectorHelper_56215 (sub_56215 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée depuis seg027/seg089 (audio 3D),
; combine Math_VectorLength_ShiftDownIfLarge_55793 et
; Math_VectorLength3D_Scaled_Variant_55ED8.
; ==============================================================================================
UI_ComputeScaledVectorHelper_57FDE		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		mov	[bp+var_10], eax
		mov	eax, [si+4]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 0
		push	1
		push	large 10h
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	cs
		call	near ptr sub_575D2
		add	sp, 8
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	eax, [bp+var_C]
		mov	[si+4], eax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_Variant_57CA1
		add	sp, 6
		cmp	[bp+var_4], 0
		jz	short loc_58064
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
		mov	[si+4], eax

loc_58064:
		mov	ax, si
		pop	si
		leave
		retf
UI_ComputeScaledVectorHelper_57FDE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_58069		proc far

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
		mov	[si+4], eax
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_58069		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_58089		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr Weapon_ComputeVectorLength_57F78
		pop	cx
		mov	[bp+var_2], di
		mov	eax, [si]
		mov	bx, [bp+var_2]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4], eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_58089		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Map_ComputeBearingToPoint_56304 (sub_56304 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; référencée par seg030 (zoom carte/radar) — longueur vectorielle (sub_5828E ×2) +
; Math_AcosOfRatio_54A0E : calcul de gisement vers un point de carte.
; ==============================================================================================
Map_ComputeBearingToPoint_580CD		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
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
		push	large [si+4]
		push	large [si]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		push	large 0
		push	large [di+4]
		push	large [di]
		call	sub_5A065
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
		jnz	short loc_58142
		mov	bx, word ptr [bp+arg_0]
		mov	[bx], eax
		jmp	short loc_58188

loc_58142:
		lea	ax, word ptr [bp+var_4]
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
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	large [bp+arg_0]
		call	Math_AcosOfRatio_5683B
		add	sp, 8

loc_58188:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Map_ComputeBearingToPoint_580CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Math_Distance2D_563C9
; (sub_563C9 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, LUE (debut) 2026-10-15. Distance entre deux points 2D (deux dd par point : c0,
; c1, c'est-a-dire le plan horizontal), resultat 24.8 dans *arg_0. Appelee par
; GroundObj_OnScriptOpcode_453E3. Ex-'Math_Distance2D_563C9'.
; ==============================================================================================
Math_Distance2D_58192		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
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
		call	sub_5A065
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
Math_Distance2D_58192		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_58206		proc far

var_28		= word ptr -28h
var_14		= word ptr -14h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		mov	si, [bp+arg_0]
		push	3
		mov	ax, si
		add	ax, 4
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	3
		push	si
		lea	ax, [bp+var_28]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	35D3h
		call	CRT_Msg_NullPtrAssign
		add	sp, 6
		pop	si
		leave
		retf
sub_58206		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Damage_ComputeHelperA_24DD7 (sub_24DD7 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Damage_ComputeHelperA_5647A (sub_5647A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée par
; Damage_SimulationTick (sub_2BF6C, seg060) — helper de calcul de dommages (rôle exact non
; détaillé).
; ==============================================================================================
Damage_ComputeHelperA_58243		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
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
		mov	[si+8], eax
		mov	[si+4], eax
		pop	si
		leave
		retf
Damage_ComputeHelperA_58243		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Damage_ComputeHelperB_564CE (sub_564CE de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée par Damage_SimulationTick
; (sub_2BF6C) — appelle sub_58476 (fonction mathématique externe non identifiée).
; ==============================================================================================
Damage_ComputeHelperB_58297		proc far

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
		call	Math_VectorTransformByMatrix3x3_5A277
		add	sp, 8
		pop	bp
		retf
Damage_ComputeHelperB_58297		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_582B1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	dx, [bp+arg_4]
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+0Ch]
		mov	[si+4], eax
		mov	eax, [di+18h]
		mov	[si+8], eax
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
sub_582B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Damage_ComputeMainHelper_56559 (sub_56559 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 288 lignes, NON DÉTAILLÉE — référencée par
; Damage_SimulationTick (sub_2BF6C). Candidat pour session dédiée (probable calcul de
; propagation/répartition de dommages).
; ==============================================================================================
Damage_ComputeMainHelper_58322		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_6		= word ptr  0Ch

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
		mov	[si+4], eax
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
		mov	[si+8], eax
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
Damage_ComputeMainHelper_58322		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_58732		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_6]
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
		les	bx, [bp+arg_0]
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
		mov	bx, [bp+arg_8]
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
		mov	bx, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		mov	bx, [bp+arg_8]
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
		mov	bx, [bp+arg_0]
		mov	es:[bx+1Ch], eax
		mov	bx, [bp+arg_8]
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
		mov	bx, [bp+arg_0]
		mov	es:[bx+2Ch], eax
		pop	di
		pop	si
		pop	bp
		retf
sub_58732		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Damage_ComputeHelperC_56C6A (sub_56C6A de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée par sub_2BE0A (voisin de
; Damage_SimulationTick).
; ==============================================================================================
Damage_ComputeHelperC_58A33		proc far

arg_0		= word ptr  6
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
Damage_ComputeHelperC_58A33		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Calibration_ComputeHelper_56CE5 (sub_56CE5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée par seg108 (détection de
; changement de calibration) — deux sites d'appel.
; ==============================================================================================
Calibration_ComputeHelper_58AAE		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

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
Calibration_ComputeHelper_58AAE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Formation_ComputeGeometryHelper_56D43 (sub_56D43 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, référencée par Formation_GuidanceSolution
; (sub_D081), alloue (sub_658) et appelle Matrix_BuildFromAngle_56D72.
; ==============================================================================================
Formation_ComputeGeometryHelper_58B0C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_58B25
		push	24h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_58B36

loc_58B25:
		mov	ax, si
		add	ax, 0Ch
		mov	ax, si
		add	ax, 18h
		push	si
		nop
		push	cs
		call	near ptr Matrix_BuildFromAngle_58B3B
		pop	cx

loc_58B36:
		mov	ax, si
		pop	si
		pop	bp
		retf
Formation_ComputeGeometryHelper_58B0C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Matrix_BuildFromAngle_2574E (sub_2574E de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Matrix_BuildFromAngle_56D72 (sub_56D72 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée par seg015 (UI
; cockpit) — probable construction de matrice de rotation à partir d'un angle.
; ==============================================================================================
Matrix_BuildFromAngle_58B3B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, dword_79CC8
		mov	[si], eax
		mov	eax, dword_79CCC
		mov	[si+4], eax
		mov	eax, dword_79CD0
		mov	[si+8], eax
		mov	eax, dword_79CD4
		mov	[si+0Ch], eax
		mov	eax, dword_79CD8
		mov	[si+10h], eax
		mov	eax, dword_79CDC
		mov	[si+14h], eax
		mov	eax, dword_79CE0
		mov	[si+18h], eax
		mov	eax, dword_79CE4
		mov	[si+1Ch], eax
		mov	eax, dword_79CE8
		mov	[si+20h], eax
		mov	ax, si
		pop	si
		pop	bp
		retf
Matrix_BuildFromAngle_58B3B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Map_ApplyRotationTransform_56DC5 (sub_56DC5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée par seg030/seg032 (carte/radar) —
; alloue (sub_658), appelle Matrix_ApplyToVector_57660.
; ==============================================================================================
Map_ApplyRotationTransform_58B8E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_58BA8
		push	24h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_58BEC

loc_58BA8:
		mov	ax, si
		add	ax, 0Ch
		mov	ax, si
		add	ax, 18h
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4], eax
		mov	eax, [di+8]
		mov	[si+8], eax
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
		call	near ptr Matrix_OrthonormalizeKeepRow1_59429
		pop	cx

loc_58BEC:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
Map_ApplyRotationTransform_58B8E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AI_ComputeGeometryHelper_56E29 (sub_56E29 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, seg116 L3896-3936 (relu intégralement,
; session 2026-09-05). PAS un calcul - une simple COPIE de structure : recopie 36 octets (3
; vecteurs de 3 dword, aux offsets +0/+0xC/+0x18, même layout que les lignes de matrice de
; Matrix_BuildAxisX_56EC3) depuis arg_2 (source, typiquement la matrice d'orientation
; persistante de l'objet, obtenue via vtable[0x3C]) vers arg_0 (buffer local du buffer).
; Référencée par AI_ManeuverSolution_Major, et par PhysicsTicks (seg103) pour extraire une
; copie de travail de l'orientation avant les helpers géométriques
; (Targeting_ComputeGeometryHelperB_5517F, Matrix_NosePitchAngle_57C3A).
; ==============================================================================================
AI_ComputeGeometryHelper_58BF2		proc far

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
		mov	[si+4], eax
		mov	eax, [di+8]
		mov	[si+8], eax
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
AI_ComputeGeometryHelper_58BF2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; WorldObject_BuildOrientationMatrix_2589B (sub_2589B de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à WorldObject_BuildOrientationMatrix_56E8A (sub_56E8A
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; seg116 L3964-4003 (relu 2026-09-05). Variante 'tableau' de Matrix_BuildFullOrientation_575B2
; : arg_0 = matrice cible, arg_2 = ptr vers 3 dword angles consecutifs. Appelle
; Matrix_BuildAxisX_ApplyToObject_574B3(m, ptr+0), _AxisY_57508(m, ptr+4), _AxisZ_5755D(m,
; ptr+8) : composition INCREMENTALE des 3 rotations d'axe (seuil 0.21875 deg) sur la matrice.
; Appelee par la methode vtable WorldObject_ComposeOrientationAngleArray_3CB0B (matrice a
; objet+0x2C), par Camera_ChaseComputeMain (seg085, angles depuis dword_707F8/FC/70800 ou
; [obj+0x51]->vtable[0x24]), et par le cluster de manoeuvre IA ovr232. C'est le mecanisme
; generique de rotation d'objet.
; ==============================================================================================
WorldObject_BuildOrientationMatrix_58C53		proc far

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
		call	near ptr Matrix_BuildAxisX_ApplyToObject_5927C
		add	sp, 4
		mov	ax, di
		add	ax, 4
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Matrix_BuildAxisY_ApplyToObject_592D1
		add	sp, 4
		mov	ax, di
		add	ax, 8
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Matrix_BuildAxisZ_ApplyToObject_59326
		add	sp, 4
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
WorldObject_BuildOrientationMatrix_58C53		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Matrix_BuildAxisX_56EC3 (sub_56EC3 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, seg116
; L3998-4178 (relu intégralement, session 2026-09-05). Composition INCRÉMENTALE d'une rotation
; d'angle *arg_2 sur la matrice PROPRE et PERSISTANTE de l'objet si (PAS un calcul générique
; sans état) : row1=[si+0Ch/10h/14h], row2=[si+18h/1Ch/20h]. sin=Math_CosDeg_5483F(angle),
; cos=Math_SinDeg_54876(angle). Formule exacte (row1_old sauvé dans var_44/40/3C avant
; écrasement) : row1_new = row1_old*sin(A) + row2_old*cos(A) ; row2_new = row2_old*sin(A) -
; row1_old*cos(A) (sin et cos inversés par rapport à une composition "standard"
; row*cos+row*sin - vérifié bit à bit, ne pas supposer l'inverse). Seuil de sortie anticipée
; (L4037-4045) : même motif scale-puis-unscale que Aero_ComputeForcesMain_4791E (mov
; 38h/shl8/.../sar8/cmp/jle) -> comparaison réelle contre 56 BRUT face à |angle| en 24.8
; (var_14/var_18=3800h, jamais relues ensuite - même sous-produit probable de macro FIXED que
; dans Aero_ComputeForcesMain_4791E, pas du code mort) (unité degré*256) : si |angle| <
; 56/256=0.21875°, retour immédiat sans toucher la matrice (pas de rotation appliquée -
; optimisation anti-bruit, aucun rapport avec l'aérodynamique). Référencée depuis
; seg014/seg015 (UI cockpit) et, via Matrix_BuildAxisX_ApplyToObject_574B3, par
; WorldObject_BuildOrientationMatrix_56E8A (objets du monde) et Camera_ChaseComputeMain
; (seg085) - usage confirmé pour la caméra et les scripts de manœuvre IA (ovr232), PAS encore
; trouvé pour la physique de l'avion joueur lui-même. [2026-09-24 : l'inversion sin/cos notee
; ci-dessus vient des NOMS : Math_CosDeg_5483F est un cosinus et Math_SinDeg_54876 un sinus.
; Avec les vraies fonctions, c'est une rotation standard autour de la ligne 0 (lignes 1 et 2
; modifiees).]
; ==============================================================================================
Matrix_BuildAxisX_58C8C		proc far

var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		jge	short loc_58CA5
		neg	eax

loc_58CA5:
		mov	[bp+var_C], eax
		mov	[bp+var_10], 38h
		mov	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		sar	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_58CCE
		jmp	loc_58E88

loc_58CCE:
		push	di
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		push	di
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	sub_566A3
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
		add	ax, 20h
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

loc_58E88:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_BuildAxisX_58C8C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Matrix_BuildAxisY_570C5 (sub_570C5 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE
; (2026-09-24). ROTATION d'angle theta (24.8 degres, *arg_2) de la matrice arg_0 AUTOUR DE SA
; LIGNE 1 : la ligne 1 n'est pas modifiee ; c = Math_CosDeg_5483F(theta), s =
; Math_SinDeg_54876(theta) ; ligne0' = c*ligne0 - s*ligne2 ; ligne2' = c*ligne2 + s*ligne0. Ne
; fait rien si |theta| < 0x38 (0,22 deg). Suivie de Matrix_OrthonormalizeKeepRow1_57660.
; Utilisee pour le roulis du missile et de la bombe guidee.
; ==============================================================================================
Matrix_BuildAxisY_58E8E		proc far

var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		jge	short loc_58EA7
		neg	eax

loc_58EA7:
		mov	[bp+var_C], eax
		mov	[bp+var_10], 38h
		mov	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		sar	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_58ED0
		jmp	loc_5907F

loc_58ED0:
		push	di
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		push	di
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	sub_566A3
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
		mov	[si+4], eax
		mov	ax, si
		add	ax, 4
		mov	eax, [si+8]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8], eax
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
		sub	[si+4], eax
		mov	eax, [bp+var_48]
		sub	[si+8], eax
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
		add	ax, 20h
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

loc_5907F:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_BuildAxisY_58E8E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Matrix_BuildAxisZ_572BC (sub_572BC de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, variante de
; construction de matrice de rotation (troisième axe), référencée depuis seg014/seg015.
; ==============================================================================================
Matrix_BuildAxisZ_59085		proc far

var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		jge	short loc_5909E
		neg	eax

loc_5909E:
		mov	[bp+var_C], eax
		mov	[bp+var_10], 38h
		mov	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		sar	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_590C7
		jmp	loc_59276

loc_590C7:
		push	di
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		push	di
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		call	sub_566A3
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
		mov	[si+4], eax
		mov	ax, si
		add	ax, 4
		mov	eax, [si+8]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8], eax
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
		add	[si+4], eax
		mov	eax, [bp+var_48]
		add	[si+8], eax
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

loc_59276:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_BuildAxisZ_59085		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Matrix_BuildAxisX_ApplyToObject_574B3 (sub_574B3 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, référencée depuis le HUD (seg087) — combine
; Matrix_BuildAxisX_56EC3 et Vector_TransformHelperB variant (575DF).
; ==============================================================================================
Matrix_BuildAxisX_ApplyToObject_5927C		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		call	near ptr Matrix_BuildAxisX_58C8C
		add	sp, 4
		mov	eax, [di]
		or	eax, eax
		jge	short loc_5929E
		neg	eax

loc_5929E:
		mov	[bp+var_4], eax
		mov	[bp+var_8], 38h
		mov	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		sar	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_592CB
		push	si
		nop
		push	cs
		call	near ptr Matrix_OrthonormalizeKeepRow0_593A8
		pop	cx

loc_592CB:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_BuildAxisX_ApplyToObject_5927C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Matrix_BuildAxisY_ApplyToObject_57508 (sub_57508 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, référencée par
; WorldObject_BuildOrientationMatrix_56E8A — combine Matrix_BuildAxisY_570C5 et
; Matrix_ApplyToVector_57660.
; ==============================================================================================
Matrix_BuildAxisY_ApplyToObject_592D1		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		call	near ptr Matrix_BuildAxisY_58E8E
		add	sp, 4
		mov	eax, [di]
		or	eax, eax
		jge	short loc_592F3
		neg	eax

loc_592F3:
		mov	[bp+var_4], eax
		mov	[bp+var_8], 38h
		mov	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		sar	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_59320
		push	si
		nop
		push	cs
		call	near ptr Matrix_OrthonormalizeKeepRow1_59429
		pop	cx

loc_59320:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_BuildAxisY_ApplyToObject_592D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Matrix_BuildAxisZ_ApplyToObject_5755D (sub_5755D de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, référencée depuis le HUD (seg087) — combine
; Matrix_BuildAxisZ_572BC et sub_576E5.
; ==============================================================================================
Matrix_BuildAxisZ_ApplyToObject_59326		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		call	near ptr Matrix_BuildAxisZ_59085
		add	sp, 4
		mov	eax, [di]
		or	eax, eax
		jge	short loc_59348
		neg	eax

loc_59348:
		mov	[bp+var_4], eax
		mov	[bp+var_8], 38h
		mov	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		sar	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_59375
		push	si
		nop
		push	cs
		call	near ptr Matrix_ApplyToVectorZ_594AE
		pop	cx

loc_59375:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_BuildAxisZ_ApplyToObject_59326		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Matrix_BuildFullOrientation_26047 (sub_26047 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Matrix_BuildFullOrientation_575B2 (sub_575B2 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, seg116 L4776-4807 (relu
; 2026-09-05). Compose une matrice d'orientation 3D COMPLETE :
; Matrix_BuildAxisX_ApplyToObject_574B3(m, &ax) puis _AxisY_57508(m, &ay) puis _AxisZ_5755D(m,
; &az). Chaque _ApplyToObject lit l'angle en *ptr, et si |angle| >= 0x38 brut (= 56/256 =
; 0.21875 deg) appelle Matrix_BuildAxisX/Y/Z_56EC3 qui applique une rotation INCREMENTALE en
; place sur les lignes de la matrice cible (composition, pas reconstruction from-scratch).
; Utilisee via les methodes vtable WorldObject_ComposeOrientation3Angles_3CAE3 (matrice a
; objet+0x2C). C'est le chemin par lequel les vitesses angulaires de la physique tournent
; l'objet du monde chaque frame. Aussi ref. par Widget_AnchorTo3DPosition, sub_2C9F3, seg084.
; ==============================================================================================
Matrix_BuildFullOrientation_5937B		proc far

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
		call	near ptr Matrix_BuildAxisX_ApplyToObject_5927C
		add	sp, 4
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr Matrix_BuildAxisY_ApplyToObject_592D1
		add	sp, 4
		push	[bp+arg_6]
		push	si
		push	cs
		call	near ptr Matrix_BuildAxisZ_ApplyToObject_59326
		add	sp, 4
		mov	ax, si
		pop	si
		pop	bp
		retf
Matrix_BuildFullOrientation_5937B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Matrix_OrthonormalizeKeepRow0_575DF (sub_575DF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE (2026-09-24). Ex-'Matrix_ApplyToVectorX'. Re-orthonormalise une matrice 3x3 en GARDANT
; la ligne 0 (+0x00) : ligne 2 = Vector_CrossProduct3D_550B7(ligne 0, ligne 1), ligne 1 =
; Vector_CrossProduct3D_550B7(ligne 2, ligne 0), puis Vector_Normalize3D_559BB sur les trois
; lignes. Appelee apres Matrix_BuildAxisX_56EC3 (rotation autour de la ligne 0).
; ==============================================================================================
Matrix_OrthonormalizeKeepRow0_593A8		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr Vector_CrossProduct3D_56EF2
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
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	cs
		call	near ptr Vector_CrossProduct3D_56EF2
		add	sp, 8
		mov	eax, [bp+var_18]
		mov	[si+0Ch], eax
		mov	eax, [bp+var_14]
		mov	[si+10h], eax
		mov	eax, [bp+var_10]
		mov	[si+14h], eax
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_57796
		pop	cx
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_57796
		pop	cx
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_57796
		pop	cx
		mov	ax, si
		pop	si
		leave
		retf
Matrix_OrthonormalizeKeepRow0_593A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Matrix_OrthonormalizeKeepRow1_57660 (sub_57660 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE (2026-09-24). Ex-'Matrix_ApplyToVectorY'. Re-orthonormalise une matrice 3x3 en GARDANT
; la ligne 1 (+0x0C) : ligne 2 = Vector_CrossProduct3D_550B7(ligne 0, ligne 1), ligne 0 =
; Vector_CrossProduct3D_550B7(ligne 1, ligne 2), puis Vector_Normalize3D_559BB sur les trois
; lignes.
; ==============================================================================================
Matrix_OrthonormalizeKeepRow1_59429		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr Vector_CrossProduct3D_56EF2
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
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	cs
		call	near ptr Vector_CrossProduct3D_56EF2
		add	sp, 8
		mov	eax, [bp+var_18]
		mov	[si], eax
		mov	eax, [bp+var_14]
		mov	[si+4], eax
		mov	eax, [bp+var_10]
		mov	[si+8], eax
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_57796
		pop	cx
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_57796
		pop	cx
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_57796
		pop	cx
		mov	ax, si
		pop	si
		leave
		retf
Matrix_OrthonormalizeKeepRow1_59429		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Matrix_ApplyToVectorZ_576E5 (sub_576E5 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, variante de
; Matrix_ApplyToVector pour le troisième axe. Référencée par seg097 (missile).
; ==============================================================================================
Matrix_ApplyToVectorZ_594AE		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr Vector_CrossProduct3D_56EF2
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si], eax
		mov	eax, [bp+var_8]
		mov	[si+4], eax
		mov	eax, [bp+var_4]
		mov	[si+8], eax
		push	si
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	cs
		call	near ptr Vector_CrossProduct3D_56EF2
		add	sp, 8
		mov	eax, [bp+var_18]
		mov	[si+0Ch], eax
		mov	eax, [bp+var_14]
		mov	[si+10h], eax
		mov	eax, [bp+var_10]
		mov	[si+14h], eax
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_57796
		pop	cx
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_57796
		pop	cx
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_57796
		pop	cx
		mov	ax, si
		pop	si
		leave
		retf
Matrix_ApplyToVectorZ_594AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; WorldObject_ApplyOrientationVariantA_5776A (sub_5776A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée par seg084
; (constructeurs objets du monde), appelle sub_58768 ×2 et
; Matrix_OrthonormalizeKeepRow1_57660.
; ==============================================================================================
WorldObject_ApplyOrientationVariantA_59533		proc far

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
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		push	si
		push	cs
		call	near ptr Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
WorldObject_ApplyOrientationVariantA_59533		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59563		proc far

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
		call	sub_5A629
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	sub_5A629
		add	sp, 4
		push	si
		push	cs
		call	near ptr Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_59563		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59593		proc far

var_B4		= word ptr -0B4h
var_A0		= word ptr -0A0h
var_8C		= word ptr -8Ch
var_78		= word ptr -78h
var_64		= word ptr -64h
var_50		= word ptr -50h
var_3C		= word ptr -3Ch
var_28		= word ptr -28h
var_14		= word ptr -14h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B4h
		push	si
		mov	si, [bp+arg_0]
		push	3
		mov	ax, si
		add	ax, 20h
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 1Ch
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 18h
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 14h
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 10h
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 0Ch
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 8
		push	ax
		lea	ax, [bp+var_8C]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 4
		push	ax
		lea	ax, [bp+var_A0]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	3
		push	si
		lea	ax, [bp+var_B4]
		push	ax
		call	UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	35DBh
		call	CRT_Msg_NullPtrAssign
		add	sp, 14h
		pop	si
		leave
		retf
sub_59593		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GeomHelper_QuadrantCompute_5789E (sub_5789E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; référencée en interne du segment (probable helper du bloc anonyme géométrique voisin) — rôle
; exact non détaillé.
; ==============================================================================================
GeomHelper_QuadrantCompute_59667		proc far

var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_8]
		cmp	dword ptr [si], 0
		jl	short loc_5968D
		mov	eax, 16800h
		sub	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	[bp+arg_4], eax

loc_5968D:
		mov	dx, word ptr [bp+arg_4+1]
		cmp	dx, 168h
		jl	short loc_596B4
		mov	ax, dx
		mov	bx, 168h
		cwd
		idiv	bx
		mov	dx, ax
		imul	ax, ax, 168h
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		sub	[bp+arg_4], eax

loc_596B4:
		cmp	[bp+arg_4], 0B400h
		jle	short loc_596C6
		sub	[bp+arg_4], 16800h

loc_596C6:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
GeomHelper_QuadrantCompute_59667		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_596D9		proc far

var_2A		= dword ptr -2Ah
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	ax, di
		add	ax, 0Ch
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_8]
		mov	[bp+var_20], eax
		mov	ax, di
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		mov	[bp+var_18], 0
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	cs
		call	near ptr Vector_NormalizeInPlace_57715
		pop	cx
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Math_AcosDeg_5676B
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_20]
		push	ax
		sub	sp, 4
		mov	eax, [bp+var_4]
		mov	[bp+var_2A], eax
		push	ss
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	cs
		call	near ptr GeomHelper_QuadrantCompute_59667
		add	sp, 0Ah
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax
		neg	eax
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_596D9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5978B		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		push	di
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_8]
		mov	[bp+var_1C], eax
		mov	ax, di
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[bp+var_18], eax
		mov	[bp+var_14], 0
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	cs
		call	near ptr Vector_NormalizeInPlace_57715
		pop	cx
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Math_AcosDeg_5676B
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		cmp	[bp+var_1C], 0
		jge	short loc_5980C
		neg	eax
		mov	[bp+var_4], eax

loc_5980C:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_5978B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59820		proc far

var_2A		= dword ptr -2Ah
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	ax, di
		add	ax, 0Ch
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_8]
		mov	[bp+var_20], eax
		mov	ax, di
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		mov	[bp+var_18], 0
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	cs
		call	near ptr Vector_NormalizeInPlace_57715
		pop	cx
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Math_AcosDeg_5676B
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_20]
		push	ax
		sub	sp, 4
		mov	eax, [bp+var_4]
		mov	[bp+var_2A], eax
		push	ss
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	cs
		call	near ptr GeomHelper_QuadrantCompute_59667
		add	sp, 0Ah
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax
		neg	eax
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_59820		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_598D2		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		push	di
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_8]
		mov	[bp+var_1C], eax
		mov	ax, di
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[bp+var_18], eax
		mov	[bp+var_14], 0
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	cs
		call	near ptr Vector_NormalizeInPlace_57715
		pop	cx
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Math_AcosDeg_5676B
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		cmp	[bp+var_1C], 0
		jge	short loc_59953
		neg	eax
		mov	[bp+var_4], eax

loc_59953:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_598D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59967		proc far

var_2A		= dword ptr -2Ah
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_8]
		mov	[bp+var_20], eax
		push	di
		push	si
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		mov	[bp+var_18], 0
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	cs
		call	near ptr Vector_NormalizeInPlace_57715
		pop	cx
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	Math_AcosDeg_5676B
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_20]
		push	ax
		sub	sp, 4
		mov	eax, [bp+var_4]
		mov	[bp+var_2A], eax
		push	ss
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	cs
		call	near ptr GeomHelper_QuadrantCompute_59667
		add	sp, 0Ah
		mov	eax, [bp+var_14]
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_59967		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59A03		proc far

var_4		= dword ptr -4
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
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_5711C
		add	sp, 6
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
sub_59A03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Matrix_RollAngle_57C67 (sub_57C67 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE
; (2026-09-24). Ex-'AI_ComputeGeometrySolution'. ANGLE DE ROULIS de la matrice d'orientation
; arg_4 (ligne 1 = nez, ligne 2 = normale), degres 24.8. Si normale.c2 ([+0x20]) == 0 -> 0.
; Sinon : h = (nez.c1, -nez.c0, 0) (horizontale perpendiculaire au nez) ; r =
; Math_DotProduct3D_5505B(h, normale) / |h| ; |h| == 0 (nez vertical) -> 90 deg ; sinon roulis
; = 90 - Math_AcosOfRatio_54A0E(r) = asin(r). Si la normale pointe vers le bas (c2 < 0, dos) :
; roulis = 180 - roulis (s'il est > 0) ou -180 - roulis (s'il est < 0) : roulis complet dans
; ]-180, 180]. | MESURE DOSBox 2026-09-26 (F-16 joueur, seul avion) : a 90 deg de roulis pile,
; la fonction renvoie 0 (cas normale.c2 == 0 en 24.8, c.-a-d. |c2| < 1/256) -> dans
; Aero_ComputeAoACommand_48862 |cos| = 1,0, la consigne garde alpha (-2,98 deg), servo
; inactif, 0,0 G au HUD ; a ~60 deg elle renvoie le vrai angle (|cos| = 0x79 = 0,47). Ce cas
; particulier est ce qui fait que l'avion sur la tranche ne tourne pas.
; ==============================================================================================
Matrix_RollAngle_59A30		proc far

var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		mov	si, [bp+arg_4]
		cmp	dword ptr [si+20h], 0
		jnz	short loc_59A44
		jmp	loc_59B1B

loc_59A44:
		mov	eax, [si+10h]
		mov	[bp+var_30], eax
		mov	eax, [si+0Ch]
		neg	eax
		mov	[bp+var_2C], eax
		mov	[bp+var_28], 0
		mov	ax, si
		add	ax, 18h
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_56E96
		add	sp, 8
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_VectorLength3D_Scaled_56D92
		add	sp, 6
		cmp	[bp+var_8], 0
		jnz	short loc_59A96
		mov	[bp+var_4], 0
		jmp	short loc_59ABE

loc_59A96:
		lea	ax, word ptr [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	Math_AcosOfRatio_5683B
		add	sp, 8
		mov	eax, [bp+var_C]
		neg	eax
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	[bp+var_4], eax

loc_59ABE:
		add	[bp+var_4], 5A00h
		cmp	dword ptr [si+20h], 0
		jge	short loc_59B09
		cmp	[bp+var_4], 0
		jle	short loc_59AEC
		mov	eax, 0B400h
		sub	eax, [bp+var_4]
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	[bp+var_4], eax
		jmp	short loc_59B09

loc_59AEC:
		cmp	[bp+var_4], 0
		jge	short loc_59B09
		mov	eax, 0FFFF4C00h
		sub	eax, [bp+var_4]
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	[bp+var_4], eax

loc_59B09:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		jmp	short loc_59B47

loc_59B1B:
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_59B26
		mov	ax, si
		jmp	short loc_59B30

loc_59B26:
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_59B30:
		or	ax, ax
		jz	short loc_59B3F
		mov	dword ptr [si], 0
		mov	ax, si
		jmp	short loc_59B41

loc_59B3F:
		mov	ax, si

loc_59B41:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]

loc_59B47:
		pop	si
		leave
		retf
Matrix_RollAngle_59A30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59B4A		proc far

var_4		= dword ptr -4
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
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_5720C
		add	sp, 6
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
sub_59B4A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59B77		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	3
		push	large 100h
		push	di
		push	cs
		call	near ptr sub_57677
		add	sp, 8
		push	di
		push	cs
		call	near ptr Vector_Normalize3D_57796
		pop	cx
		cmp	dword ptr [di], 0
		jnz	short loc_59BA8
		cmp	dword ptr [di+4], 0
		jz	short loc_59C22

loc_59BA8:
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
		mov	[si+4], eax
		mov	dword ptr [si+8], 0
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_57796
		pop	cx
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr Vector_CrossProduct3D_56EF2
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
		call	near ptr Vector_Normalize3D_57796
		pop	cx
		jmp	short loc_59C6D

loc_59C22:
		mov	dword ptr [si], 100h
		xor	eax, eax
		mov	[si+20h], eax
		mov	[si+18h], eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8], eax
		mov	[si+4], eax
		cmp	dword ptr [di+8], 0
		jle	short loc_59C5D
		mov	dword ptr [si+14h], 100h
		mov	dword ptr [si+1Ch], 0FFFFFF00h
		jmp	short loc_59C6D

loc_59C5D:
		mov	dword ptr [si+14h], 0FFFFFF00h
		mov	dword ptr [si+1Ch], 100h

loc_59C6D:
		pop	di
		pop	si
		leave
		retf
sub_59B77		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à HUD_EncodeHelper_57E9E
; (sub_57E9E de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée par seg010 (encodage HUD/sous-objets attachés), appelle sub_694
; (externe) et sub_57EDD.
; ==============================================================================================
HUD_EncodeHelper_59C71		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_59C90
		push	large 24h
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_59CA8

loc_59C90:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Ch
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_59CB0
		add	sp, 4

loc_59CA8:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
HUD_EncodeHelper_59C71		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59CB0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, dword_79CC8
		mov	es:[bx], eax
		mov	eax, dword_79CCC
		mov	es:[bx+4], eax
		mov	eax, dword_79CD0
		mov	es:[bx+8], eax
		mov	eax, dword_79CD4
		mov	es:[bx+0Ch], eax
		mov	eax, dword_79CD8
		mov	es:[bx+10h], eax
		mov	eax, dword_79CDC
		mov	es:[bx+14h], eax
		mov	eax, dword_79CE0
		mov	es:[bx+18h], eax
		mov	eax, dword_79CE4
		mov	es:[bx+1Ch], eax
		mov	eax, dword_79CE8
		mov	es:[bx+20h], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_59CB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59D0E		proc far

var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 30h
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	dword_79CC8, eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	dword_79CCC, eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	dword_79CD0, eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	dword_79CD4, eax
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	dword_79CD8, eax
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	dword_79CDC, eax
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		mov	dword_79CE0, eax
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	dword_79CE4, eax
		mov	[bp+var_24], 100h
		mov	eax, [bp+var_24]
		mov	dword_79CE8, eax
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		mov	dword_79CEC, eax
		mov	[bp+var_2C], 0
		mov	eax, [bp+var_2C]
		mov	dword_79CF0, eax
		mov	[bp+var_30], 0
		mov	eax, [bp+var_30]
		mov	dword_79CF4, eax
		push	68E2h
		push	cs
		call	near ptr Formation_ComputeGeometryHelper_58B0C
		pop	cx
		push	ds
		push	offset unk_7D036
sub_59D0E		endp
seg128		ends
