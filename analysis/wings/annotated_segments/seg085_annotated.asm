seg085		segment	para public 'CODE' use16
		assume cs:seg085
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 36h, 83h, 0C4h, 4, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Math_NormalizeAngle180_5661C (sub_5661C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Math_NormalizeAngle180_547EF (sub_547EF de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, normalise un angle fixe (24.8,
; unité 0x16800=360°) dans l'intervalle [-180°,+180°] (0xB400) par additions/soustractions
; successives d'un tour complet.
; ==============================================================================================
Math_NormalizeAngle180_38FA6		proc far

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
		jmp	short loc_38FC1

loc_38FB9:
		add	[bp+var_4], 16800h

loc_38FC1:
		cmp	[bp+var_4], 0FFFF4C00h
		jl	short loc_38FB9
		jmp	short loc_38FD5

loc_38FCD:
		sub	[bp+var_4], 16800h

loc_38FD5:
		cmp	[bp+var_4], 0B400h
		jg	short loc_38FCD
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Math_NormalizeAngle180_38FA6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Math_CosDeg_5666C
; (sub_5666C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Math_CosDeg_5483F (sub_5483F
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE (2026-09-24). Ex-'Math_Sin' : NOM INVERSE, c'est un COSINUS.
; Math_NormalizeAngle180_547EF(angle 24.8 en degres) puis Math_CosRaw_580A7 ; resultat 24.8
; dans *arg_0.
; ==============================================================================================
Math_CosDeg_38FF6		proc far

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
		call	near ptr Math_NormalizeAngle180_38FA6
		add	sp, 6
		push	large [bp+var_8]
		call	Math_CosRaw_3C889
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
Math_CosDeg_38FF6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Math_CosDeg_5666C
; (sub_5666C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Math_CosDeg_5483F (sub_5483F
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE (2026-09-24). Ex-'Math_Sin' : NOM INVERSE, c'est un COSINUS.
; Math_NormalizeAngle180_547EF(angle 24.8 en degres) puis Math_CosRaw_580A7 ; resultat 24.8
; dans *arg_0.
; ==============================================================================================
Math_CosDeg_3902D		proc far

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
		call	near ptr Math_NormalizeAngle180_38FA6
		add	sp, 6
		push	large [bp+var_8]
		call	sub_3C843
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
Math_CosDeg_3902D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39064		proc far

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
		call	near ptr Math_NormalizeAngle180_38FA6
		add	sp, 6
		mov	[bp+var_8], 0
		mov	eax, [bp+var_4]
		or	eax, eax
		jge	short loc_3908D
		neg	eax

loc_3908D:
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 5A00h
		jnz	short loc_390A8
		mov	ax, 1
		jmp	short loc_390AA

loc_390A8:
		xor	ax, ax

loc_390AA:
		or	al, al
		jz	short loc_390B9
		push	9026h
		call	sub_9D47
		pop	cx
		jmp	short loc_390CD

loc_390B9:
		push	large [bp+var_4]
		call	Math_Tan_Raw_3C8CF
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_8], eax

loc_390CD:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_8]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
sub_39064		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Math_AcosDeg_5676B
; (sub_5676B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Math_AcosDeg_5493E
; (sub_5493E de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, LUE (2026-09-24). Ex-'Math_ArcSin' : NOM INVERSE, ARC COSINUS. Si |x| <= 1.0 :
; Math_AcosRaw_581E3(x), sinon 0. Resultat en degres 24.8 dans *arg_0.
; ==============================================================================================
Math_AcosDeg_390DF		proc far

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
		jge	short loc_390FF
		neg	eax

loc_390FF:
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 100h
		jg	short loc_3911A
		mov	ax, 1
		jmp	short loc_3911C

loc_3911A:
		xor	ax, ax

loc_3911C:
		or	al, al
		jz	short loc_39133
		push	large [si]
		call	Math_AcosRaw_3C9C5
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax

loc_39133:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_AcosDeg_390DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Math_AsinDeg_567D3
; (sub_567D3 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Math_AsinDeg_549A6
; (sub_549A6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, LUE (2026-09-24). Ex-'Math_ArcCos' : NOM INVERSE, ARC SINUS. Si |x| <= 1.0 :
; Math_AsinRaw_581A0(x), sinon 0. Resultat en degres 24.8 dans *arg_0.
; ==============================================================================================
Math_AsinDeg_39147		proc far

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
		jge	short loc_39167
		neg	eax

loc_39167:
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 100h
		jg	short loc_39182
		mov	ax, 1
		jmp	short loc_39184

loc_39182:
		xor	ax, ax

loc_39184:
		or	al, al
		jz	short loc_3919B
		push	large [si]
		call	Math_AsinRaw_3C982
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax

loc_3919B:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_AsinDeg_39147		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Math_AcosOfRatio_5683B
; (sub_5683B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Math_AcosOfRatio_54A0E
; (sub_54A0E de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, LUE (2026-09-24). Ex-'Math_ArcSinOfRatio' : NOM INVERSE. Si den != 0 :
; Math_AcosDeg_5493E(num/den) (arc COSINUS), sinon 0.
; ==============================================================================================
Math_AcosOfRatio_391AF		proc far

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
		jz	short loc_39203
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
		call	near ptr Math_AcosDeg_390DF
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax

loc_39203:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_AcosOfRatio_391AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Math_AsinOfRatio_568A3
; (sub_568A3 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Math_AsinOfRatio_54A76
; (sub_54A76 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, LUE (2026-09-24). Ex-'Math_ArcCosOfRatio' : NOM INVERSE. Si den != 0 :
; Math_AsinDeg_549A6(num/den) (arc SINUS), sinon 0.
; ==============================================================================================
Math_AsinOfRatio_39217		proc far

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
		jz	short loc_3926B
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
		call	near ptr Math_AsinDeg_39147
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax

loc_3926B:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_AsinOfRatio_39217		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Math_ArcTan_5690B
; (sub_5690B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Math_ArcTan_54ADE (sub_54ADE
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; arc tangente fixe (délègue à sub_58223).
; ==============================================================================================
Math_ArcTan_3927F		proc far

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
		call	sub_3CA05
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
Math_ArcTan_3927F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Math_ArcTan2_56937
; (sub_56937 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_ArcTan2_54B0A (sub_54B0A de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, arc tangente à deux arguments (dy/dx, delègue à sub_58223)
; — référencée deux fois par sub_4F95.
; ==============================================================================================
Math_ArcTan2_392AB		proc far

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
		jz	short loc_392C8
		mov	ax, 0FFA6h
		jmp	short loc_392CB

loc_392C8:
		mov	ax, 5Ah

loc_392CB:
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
		jnz	short loc_39308
		mov	[bp+var_A], 0

loc_39308:
		cmp	[bp+var_12], 0FFFFFFFFh
		jnz	short loc_39317
		mov	[bp+var_12], 0

loc_39317:
		cmp	[bp+var_A], 0
		jz	short loc_39323
		mov	ax, 1
		jmp	short loc_39325

loc_39323:
		xor	ax, ax

loc_39325:
		or	al, al
		jz	short loc_3933B
		cmp	[bp+var_12], 0
		jnz	short loc_39335
		mov	ax, 1
		jmp	short loc_39337

loc_39335:
		xor	ax, ax

loc_39337:
		or	al, al
		jnz	short loc_3937E

loc_3933B:
		cmp	dword ptr [di], 0
		jz	short loc_39346
		mov	ax, 1
		jmp	short loc_39348

loc_39346:
		xor	ax, ax

loc_39348:
		or	al, al
		jz	short loc_3937E
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
		call	sub_3CA05
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax

loc_3937E:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_ArcTan2_392AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39392		proc far

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
		jge	short loc_393B5
		push	9027h
		call	sub_9D47
		pop	cx
		jmp	short loc_393C8

loc_393B5:
		push	large [si]
		call	Math_Sqrt_Raw_3CAD1
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax

loc_393C8:
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_39392		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Math_Square_56A66
; (sub_56A66 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_Square_54C39 (sub_54C39 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, carré fixe (24.8) : x*x avec décalage 8 bits (imul+shrd).
; Référencée deux fois par AI_ManeuverSolution_Major_6977.
; ==============================================================================================
Math_Square_393DB		proc far

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
Math_Square_393DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Math_VectorLength_Wrapper_56AA4 (sub_56AA4 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 3 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Math_VectorLength_Wrapper_54C77 (sub_54C77 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, enveloppe fine de sub_5828E (longueur de
; vecteur 3D). Référencée par seg020/seg021 (cadrage de vue carte/radar).
; ==============================================================================================
Math_VectorLength_Wrapper_39419		proc far

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
		call	Math_VectorLength3D_Raw_3CA71
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
Math_VectorLength_Wrapper_39419		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39453		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+1]
		push	2F42h
		call	CRT_Msg_NullPtrAssign
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_39453		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UIScreen_BuildFormattedText_56B04 (sub_56B04 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à UIScreen_BuildFormattedText_54CC9 (sub_54CC9 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 170 lignes, NON DÉTAILLÉE — alloue (sub_658), appelle sub_3FD/sub_2945 (formatage ?),
; référencée depuis seg024 (framework UI) et sub_509EE (UIScreen_RenderGraphVGA, seg113) —
; probable construction de texte/étiquette formaté pour affichage.
; ==============================================================================================
UIScreen_BuildFormattedText_3946B		proc far

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
		jnz	short loc_3948B
		push	14h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_3948B
		jmp	loc_39590

loc_3948B:
		mov	di, si
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 0
		jl	short loc_394A6
		mov	eax, [bx]
		sar	eax, 8
		mov	[bp+var_4], eax
		mov	eax, [bx]
		jmp	short loc_394D2

loc_394A6:
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		neg	eax
		sar	eax, 8
		mov	[bp+var_4], eax
		neg	eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_394C9
		mov	byte ptr [di], 2Dh
		inc	di

loc_394C9:
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		neg	eax

loc_394D2:
		and	eax, 0FFh
		mov	[bp+var_8], eax
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		push	ds
		push	offset unk_5CC5A
		mov	cx, 8
		call	CRT_Fmemcpy
		cmp	[bp+arg_4], 3
		jle	short loc_394F8
		mov	[bp+arg_4], 3

loc_394F8:
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
		jmp	short loc_39533

loc_39530:
		dec	[bp+var_14]

loc_39533:
		cmp	[bp+var_14], 0
		jle	short loc_3954A
		mov	bx, dx
		inc	dx
		shl	bx, 1
		lea	ax, [bp+var_12]
		add	bx, ax
		mov	ax, [bx]
		cmp	ax, [bp+var_A]
		jle	short loc_39530

loc_3954A:
		push	large [bp+var_4]
		push	2F45h
		push	di
		call	CRT_Msg_Sprintf1
		add	sp, 8
		cmp	[bp+arg_4], 0
		jz	short loc_39590
		jmp	short loc_39563

loc_39562:
		inc	di

loc_39563:
		cmp	byte ptr [di], 0
		jnz	short loc_39562
		mov	byte ptr [di], 2Eh
		mov	dx, 1
		jmp	short loc_39576

loc_39570:
		mov	bx, dx
		mov	byte ptr [bx+di], 30h
		inc	dx

loc_39576:
		cmp	dx, [bp+var_14]
		jle	short loc_39570
		push	[bp+var_A]
		push	2F49h
		mov	ax, di
		add	ax, [bp+var_14]
		inc	ax
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6

loc_39590:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
UIScreen_BuildFormattedText_3946B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Math_RandomScale_56C2F
; (sub_56C2F de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_RandomScale_54DF4 (sub_54DF4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, multiplie une valeur par un nombre pseudo-aléatoire
; (sub_70D) mis à l'échelle (÷0x8000) — magnitude aléatoire. Référencée deux fois par
; AI_ManeuverSolution_Major_6977.
; ==============================================================================================
Math_RandomScale_39596		proc far

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
Math_RandomScale_39596		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Math_RandomJitter_56C57 (sub_56C57 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Math_RandomJitter_54E1C (sub_54E1C de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, variante de Math_RandomScale centrée :
; retourne une valeur aléatoire dans [-x,+x]. Référencée par sub_3844F.
; ==============================================================================================
Math_RandomJitter_395BE		proc far

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
Math_RandomJitter_395BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Math_RandomChance_56C8A (sub_56C8A de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1
; opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Math_RandomChance_54E4F (sub_54E4F de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, test de probabilité pseudo-aléatoire (échelle ~100) —
; retourne vrai/faux. Référencée par sub_4D04E et ChaseCamera_RenderEffect_4D1C9 (spawn
; probabiliste d'effet).
; ==============================================================================================
Math_RandomChance_395F1		proc far

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
		jge	short loc_39621
		mov	al, 1
		jmp	short loc_39623

loc_39621:
		mov	al, 0

loc_39623:
		leave
		retf
Math_RandomChance_395F1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_39625		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	[bp+var_4], 394Bh
		mov	eax, [bp+var_4]
		mov	dword_5CC4A, eax
		mov	[bp+var_8], 4
		mov	eax, [bp+var_8]
		mov	dword_5CC4E, eax
		mov	[bp+var_C], 1
		mov	eax, [bp+var_C]
		mov	dword_5CC52, eax
sub_39625		endp

; START OF FUNCTION CHUNK FOR sub_39625
		db 66h, 0C7h
		push	es
		das
; END OF FUNCTION CHUNK FOR sub_39625
seg085		ends
