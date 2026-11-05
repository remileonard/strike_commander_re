seg127		segment	para public 'CODE' use16
		assume cs:seg127
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 35h, 0, 74h, 4, 0B0h, 1, 0EBh, 2, 0B0h, 0, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_NormalizeAngle180_547EF (sub_547EF de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, normalise un angle fixe (24.8, unité
; 0x16800=360°) dans l'intervalle [-180°,+180°] (0xB400) par additions/soustractions
; successives d'un tour complet.
; ==============================================================================================
Math_NormalizeAngle180_5661C		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		mov	[bp+var_4], eax
		jmp	short loc_56637

loc_5662F:
		add	[bp+var_4], 16800h

loc_56637:
		cmp	[bp+var_4], 0FFFF4C00h
		jl	short loc_5662F
		jmp	short loc_5664B

loc_56643:
		sub	[bp+var_4], 16800h

loc_5664B:
		cmp	[bp+var_4], 0B400h
		jg	short loc_56643
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Math_NormalizeAngle180_5661C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Math_CosDeg_5483F (sub_5483F de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE (2026-09-24).
; Ex-'Math_Sin' : NOM INVERSE, c'est un COSINUS. Math_NormalizeAngle180_547EF(angle 24.8 en
; degres) puis Math_CosRaw_580A7 ; resultat 24.8 dans *arg_0.
; ==============================================================================================
Math_CosDeg_5666C		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	[bp+arg_4]
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_NormalizeAngle180_5661C
		add	sp, 6
		push	large [bp+var_8]
		call	Math_CosRaw_59E7D
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
Math_CosDeg_5666C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_566A3		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	[bp+arg_4]
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_NormalizeAngle180_5661C
		add	sp, 6
		push	large [bp+var_8]
		call	sub_59E37
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
sub_566A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Math_Tan_548AD (sub_548AD de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, normalise l'angle,
; gère le cas singulier ±90° (0x5A00) en retournant ±dword_707BE (sentinelle "infini"), sinon
; appelle sub_580ED (tangente fixe).
; ==============================================================================================
Math_Tan_566DA		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	[bp+arg_4]
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	cs
		call	near ptr Math_NormalizeAngle180_5661C
		add	sp, 6
		mov	[bp+var_8], 0
		mov	eax, [bp+var_4]
		or	eax, eax
		jge	short loc_56703
		neg	eax

loc_56703:
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 5A00h
		jnz	short loc_5671E
		mov	ax, 1
		jmp	short loc_56720

loc_5671E:
		xor	ax, ax

loc_56720:
		or	al, al
		jz	short loc_56745
		cmp	[bp+var_4], 0
		jle	short loc_56730
		mov	ax, 1
		jmp	short loc_56732

loc_56730:
		xor	ax, ax

loc_56732:
		or	al, al
		jz	short loc_5673C
		mov	eax, dword_79CB2
		jmp	short loc_56755

loc_5673C:
		mov	eax, dword_79CB2
		neg	eax
		jmp	short loc_56755

loc_56745:
		push	large [bp+var_4]
		call	Math_Tan_Raw_59EC3
		push	dx
		push	ax
		pop	eax
		add	sp, 4

loc_56755:
		mov	[bp+var_8], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_8]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
Math_Tan_566DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Math_AcosDeg_5493E (sub_5493E de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE (2026-09-24).
; Ex-'Math_ArcSin' : NOM INVERSE, ARC COSINUS. Si |x| <= 1.0 : Math_AcosRaw_581E3(x), sinon 0.
; Resultat en degres 24.8 dans *arg_0.
; ==============================================================================================
Math_AcosDeg_5676B		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		mov	di, si
		mov	eax, [di]
		or	eax, eax
		jge	short loc_5678B
		neg	eax

loc_5678B:
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 100h
		jg	short loc_567A6
		mov	ax, 1
		jmp	short loc_567A8

loc_567A6:
		xor	ax, ax

loc_567A8:
		or	al, al
		jz	short loc_567BF
		push	large [si]
		call	Math_AcosRaw_59FB9
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax

loc_567BF:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_AcosDeg_5676B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Math_AsinDeg_549A6 (sub_549A6 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE (2026-09-24).
; Ex-'Math_ArcCos' : NOM INVERSE, ARC SINUS. Si |x| <= 1.0 : Math_AsinRaw_581A0(x), sinon 0.
; Resultat en degres 24.8 dans *arg_0.
; ==============================================================================================
Math_AsinDeg_567D3		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		mov	di, si
		mov	eax, [di]
		or	eax, eax
		jge	short loc_567F3
		neg	eax

loc_567F3:
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 100h
		jg	short loc_5680E
		mov	ax, 1
		jmp	short loc_56810

loc_5680E:
		xor	ax, ax

loc_56810:
		or	al, al
		jz	short loc_56827
		push	large [si]
		call	Math_AsinRaw_59F76
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax

loc_56827:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_AsinDeg_567D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Math_AcosOfRatio_54A0E (sub_54A0E de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE
; (2026-09-24). Ex-'Math_ArcSinOfRatio' : NOM INVERSE. Si den != 0 :
; Math_AcosDeg_5493E(num/den) (arc COSINUS), sinon 0.
; ==============================================================================================
Math_AcosOfRatio_5683B		proc far

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
		sub	sp, 10h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_6]
		mov	[bp+var_4], 0
		cmp	dword ptr [si], 0
		jz	short loc_5688F
		mov	eax, [di]
		mov	edx, eax
		mov	ecx, [si]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	cs
		call	near ptr Math_AcosDeg_5676B
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax

loc_5688F:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_AcosOfRatio_5683B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Math_AsinOfRatio_54A76 (sub_54A76 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE
; (2026-09-24). Ex-'Math_ArcCosOfRatio' : NOM INVERSE. Si den != 0 :
; Math_AsinDeg_549A6(num/den) (arc SINUS), sinon 0.
; ==============================================================================================
Math_AsinOfRatio_568A3		proc far

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
		sub	sp, 10h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_6]
		mov	[bp+var_4], 0
		cmp	dword ptr [si], 0
		jz	short loc_568F7
		mov	eax, [di]
		mov	edx, eax
		mov	ecx, [si]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	cs
		call	near ptr Math_AsinDeg_567D3
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax

loc_568F7:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_AsinOfRatio_568A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Math_ArcTan_54ADE (sub_54ADE de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, arc tangente fixe
; (délègue à sub_58223).
; ==============================================================================================
Math_ArcTan_5690B		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		push	large [si]
		call	sub_59FF9
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Math_ArcTan_5690B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Math_ArcTan2_54B0A
; (sub_54B0A de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, arc tangente à deux arguments (dy/dx, delègue à sub_58223) — référencée deux
; fois par sub_4F95.
; ==============================================================================================
Math_ArcTan2_56937		proc far

var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	ax, [si+2]
		sar	ax, 0Fh
		or	al, al
		jz	short loc_56954
		mov	ax, 0FFA6h
		jmp	short loc_56957

loc_56954:
		mov	ax, 5Ah

loc_56957:
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_4], eax
		mov	eax, [si]
		sar	eax, 10h
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		mov	eax, [di]
		sar	eax, 10h
		mov	[bp+var_16], eax
		mov	[bp+var_12], eax
		cmp	[bp+var_A], 0FFFFFFFFh
		jnz	short loc_56994
		mov	[bp+var_A], 0

loc_56994:
		cmp	[bp+var_12], 0FFFFFFFFh
		jnz	short loc_569A3
		mov	[bp+var_12], 0

loc_569A3:
		cmp	[bp+var_A], 0
		jz	short loc_569AF
		mov	ax, 1
		jmp	short loc_569B1

loc_569AF:
		xor	ax, ax

loc_569B1:
		or	al, al
		jz	short loc_569C7
		cmp	[bp+var_12], 0
		jnz	short loc_569C1
		mov	ax, 1
		jmp	short loc_569C3

loc_569C1:
		xor	ax, ax

loc_569C3:
		or	al, al
		jnz	short loc_56A0A

loc_569C7:
		cmp	dword ptr [di], 0
		jz	short loc_569D2
		mov	ax, 1
		jmp	short loc_569D4

loc_569D2:
		xor	ax, ax

loc_569D4:
		or	al, al
		jz	short loc_56A0A
		mov	eax, [si]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_1A], eax
		push	eax
		call	sub_59FF9
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax

loc_56A0A:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_ArcTan2_56937		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Math_Sqrt_54BF1 (sub_54BF1 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, racine carrée fixe
; (délègue à sub_582EE), retourne une constante (0xB505 ≈ √2·0x8000 mise à l'échelle) si
; l'entrée est négative. Référencée par AI_ManeuverSolution_Major_6977 et
; AI_CombatDecision_Major_75F8.
; ==============================================================================================
Math_Sqrt_56A1E		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		cmp	dword ptr [si], 0
		jge	short loc_56A40
		mov	[bp+var_4], 0B505h
		jmp	short loc_56A53

loc_56A40:
		push	large [si]
		call	Math_Sqrt_Raw_5A0EF
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax

loc_56A53:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Math_Sqrt_56A1E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Math_Square_54C39
; (sub_54C39 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, carré fixe (24.8) : x*x avec décalage 8 bits (imul+shrd). Référencée deux fois
; par AI_ManeuverSolution_Major_6977.
; ==============================================================================================
Math_Square_56A66		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		mov	di, si
		mov	eax, [si]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_8]
		mov	[bx], eax
		mov	es, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_Square_56A66		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Math_VectorLength_Wrapper_54C77 (sub_54C77 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe fine de sub_5828E (longueur de vecteur 3D). Référencée par seg020/seg021 (cadrage
; de vue carte/radar).
; ==============================================================================================
Math_VectorLength_Wrapper_56AA4		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	bx, [bp+arg_8]
		push	large [bx]
		push	large [di]
		push	large [si]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_VectorLength_Wrapper_56AA4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56ADE		proc far

var_14		= word ptr -14h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		mov	ax, [bp+arg_0]
		push	3
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		nop
		push	cs
		call	near ptr UIScreen_BuildFormattedText_56B04
		add	sp, 6
		push	ax
		push	358Eh
		call	CRT_Msg_NullPtrAssign
		add	sp, 4
		leave
		retf
sub_56ADE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UIScreen_BuildFormattedText_54CC9 (sub_54CC9 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 170 lignes, NON DÉTAILLÉE — alloue (sub_658), appelle sub_3FD/sub_2945 (formatage ?),
; référencée depuis seg024 (framework UI) et sub_509EE (UIScreen_RenderGraphVGA, seg113) —
; probable construction de texte/étiquette formaté pour affichage.
; ==============================================================================================
UIScreen_BuildFormattedText_56B04		proc far

var_14		= word ptr -14h
var_12		= word ptr -12h
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_56B24
		push	14h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_56B24
		jmp	loc_56C29

loc_56B24:
		mov	di, si
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 0
		jl	short loc_56B3F
		mov	eax, [bx]
		sar	eax, 8
		mov	[bp+var_4], eax
		mov	eax, [bx]
		jmp	short loc_56B6B

loc_56B3F:
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		neg	eax
		sar	eax, 8
		mov	[bp+var_4], eax
		neg	eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_56B62
		mov	byte ptr [di], 2Dh
		inc	di

loc_56B62:
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		neg	eax

loc_56B6B:
		and	eax, 0FFh
		mov	[bp+var_8], eax
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		push	ds
		push	offset unk_79CB6
		mov	cx, 8
		call	CRT_Fmemcpy
		cmp	[bp+arg_4], 3
		jle	short loc_56B91
		mov	[bp+arg_4], 3

loc_56B91:
		mov	bx, [bp+arg_4]
		shl	bx, 1
		lea	ax, [bp+var_12]
		add	bx, ax
		movsx	eax, word ptr [bx]
		mov	edx, [bp+var_8]
		imul	edx, eax
		mov	[bp+var_8], edx
		mov	eax, [bp+var_8]
		sar	eax, 8
		mov	[bp+var_8], eax
		mov	ax, word ptr [bp+var_8]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_4]
		dec	ax
		mov	[bp+var_14], ax
		mov	dx, 1
		jmp	short loc_56BCC

loc_56BC9:
		dec	[bp+var_14]

loc_56BCC:
		cmp	[bp+var_14], 0
		jle	short loc_56BE3
		mov	bx, dx
		inc	dx
		shl	bx, 1
		lea	ax, [bp+var_12]
		add	bx, ax
		mov	ax, [bx]
		cmp	ax, [bp+var_A]
		jle	short loc_56BC9

loc_56BE3:
		push	large [bp+var_4]
		push	3591h
		push	di
		call	CRT_Msg_Sprintf1
		add	sp, 8
		cmp	[bp+arg_4], 0
		jz	short loc_56C29
		jmp	short loc_56BFC

loc_56BFB:
		inc	di

loc_56BFC:
		cmp	byte ptr [di], 0
		jnz	short loc_56BFB
		mov	byte ptr [di], 2Eh
		mov	dx, 1
		jmp	short loc_56C0F

loc_56C09:
		mov	bx, dx
		mov	byte ptr [bx+di], 30h
		inc	dx

loc_56C0F:
		cmp	dx, [bp+var_14]
		jle	short loc_56C09
		push	[bp+var_A]
		push	3595h
		mov	ax, di
		add	ax, [bp+var_14]
		inc	ax
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6

loc_56C29:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
UIScreen_BuildFormattedText_56B04		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Math_RandomScale_54DF4
; (sub_54DF4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, multiplie une valeur par un nombre pseudo-aléatoire (sub_70D) mis à l'échelle
; (÷0x8000) — magnitude aléatoire. Référencée deux fois par AI_ManeuverSolution_Major_6977.
; ==============================================================================================
Math_RandomScale_56C2F		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_2], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_2]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		leave
		retf
Math_RandomScale_56C2F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Math_RandomJitter_54E1C
; (sub_54E1C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, variante de Math_RandomScale centrée : retourne une valeur aléatoire dans
; [-x,+x]. Référencée par sub_3844F.
; ==============================================================================================
Math_RandomJitter_56C57		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_2], ax
		mov	dx, [bp+var_2]
		shl	dx, 1
		mov	[bp+var_4], dx
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_4]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		sub	ax, [bp+var_2]
		leave
		retf
Math_RandomJitter_56C57		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Math_RandomChance_54E4F (sub_54E4F de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, test de
; probabilité pseudo-aléatoire (échelle ~100) — retourne vrai/faux. Référencée par sub_4D04E
; et ChaseCamera_RenderEffect_4D1C9 (spawn probabiliste d'effet).
; ==============================================================================================
Math_RandomChance_56C8A		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_2], ax
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 64h
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_4], ax
		mov	dx, [bp+var_4]
		cmp	dx, [bp+var_2]
		jge	short loc_56CBA
		mov	al, 1
		jmp	short loc_56CBC

loc_56CBA:
		mov	al, 0

loc_56CBC:
		leave
		retf
Math_RandomChance_56C8A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_56CBE		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	[bp+var_4], 394Bh
		mov	eax, [bp+var_4]
		mov	dword_79CA6, eax
		mov	[bp+var_8], 4
		mov	eax, [bp+var_8]
		mov	dword_79CAA, eax
		mov	[bp+var_C], 1
		mov	eax, [bp+var_C]
sub_56CBE		endp
seg127		ends
