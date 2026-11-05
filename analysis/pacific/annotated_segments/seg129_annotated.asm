seg129		segment	para public 'CODE' use16
		assume cs:seg129
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0Eh, 0E8h, 0CAh, 0ECh, 83h, 0C4h, 4, 0C9h, 0CBh, 0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59DEA		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		mov	eax, [bp+arg_0]
		cdq
		shld	edx, eax, 8
		shl	eax, 8
		idiv	[bp+arg_4]
		shld	edx, eax, 10h
		leave
		retf
sub_59DEA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_FixedMultiply_58034 (sub_58034 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, multiplication en virgule fixe 24.8 (imul + shrd/shld).
; Référencée depuis seg020 (défilement/cadrage de vue).
; ==============================================================================================
Math_FixedMultiply_59E08		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		mov	eax, [bp+arg_0]
		imul	[bp+arg_4]
		shrd	eax, edx, 8
		shld	edx, eax, 10h
		leave
		retf
Math_FixedMultiply_59E08		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Math_FixedMulDiv_26BB4
; (sub_26BB4 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_FixedMulDiv_5804C (sub_5804C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, "MulDiv" en virgule fixe (a*b/c). Référencée par
; Radar_Project3DToScreen (sub_16988).
; ==============================================================================================
Math_FixedMulDiv_59E20		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		enter	0, 0
		mov	eax, [bp+arg_0]
		imul	[bp+arg_4]
		idiv	[bp+arg_8]
		shld	edx, eax, 10h
		leave
		retf
Math_FixedMulDiv_59E20		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59E37		proc far

arg_0		= dword ptr  6

		enter	0, 0
		xor	cx, cx
		mov	ebx, [bp+arg_0]
		sar	ebx, 6
		jns	short loc_59E4B
		add	bx, 5A0h

loc_59E4B:
		mov	ax, 168h
		sub	bx, ax
		jl	short loc_59E5F
		sub	bx, ax
		jge	short loc_59E5A
		add	bx, ax
		jmp	short loc_59E61

loc_59E5A:
		inc	cx
		sub	bx, ax
		jge	short loc_59E61

loc_59E5F:
		neg	bx

loc_59E61:
		mov	ax, 100h
		or	bx, bx
		jz	short loc_59E72
		mov	ax, seg seg221
		mov	es, ax
		xor	ax, ax
		mov	al, es:[bx]

loc_59E72:
		or	cx, cx
		jz	short loc_59E7A
		nop
		nop
		neg	ax

loc_59E7A:
		cwd
		leave
		retf
sub_59E37		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Math_CosRaw_26C11
; (sub_26C11 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_CosRaw_580A7 (sub_580A7 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, LUE (2026-09-24). Ex-'Math_Sin_Raw' : NOM INVERSE, c'est
; un COSINUS. i = |angle 24.8| >> 6 (quarts de degre) ; ramene dans [0, 90 deg] avec signe
; (cx) ; 1.0 (0x100) si i == 0, sinon table d'octets seg213 (unk_68B90) : table[i] = cos(i/4
; deg) en 24.8 (1.0 = 256) (verifie : 221 a 30 deg, 181 a 45 deg, 127 a 60 deg, 0 a 90 deg).
; Fonction paire (utilise |angle|) : cos(0) = 1, cos(180) = -1.
; ==============================================================================================
Math_CosRaw_59E7D		proc far

arg_0		= dword ptr  6

		enter	0, 0
		xor	cx, cx
		mov	ebx, [bp+arg_0]
		sar	ebx, 6
		jns	short loc_59E8F
		neg	bx

loc_59E8F:
		cmp	bx, 168h
		jb	short loc_59EA9
		inc	cx
		sub	bx, 2D0h
		jl	short loc_59EA7
		cmp	bx, 168h
		jl	short loc_59EA9
		dec	cx
		sub	bx, 2D0h

loc_59EA7:
		neg	bx

loc_59EA9:
		mov	ax, 100h
		or	bx, bx
		jz	short loc_59EBA
		mov	ax, seg seg221
		mov	es, ax
		xor	ax, ax
		mov	al, es:[bx]

loc_59EBA:
		or	cx, cx
		jz	short loc_59EC0
		neg	ax

loc_59EC0:
		cwd
		leave
		retf
Math_CosRaw_59E7D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Math_Tan_Raw_26C57
; (sub_26C57 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_Tan_Raw_580ED (sub_580ED de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, tangente en virgule fixe (implémentation brute — appelée
; par Math_Tan_548AD).
; ==============================================================================================
Math_Tan_Raw_59EC3		proc far

arg_0		= dword ptr  6

		enter	0, 0
		mov	ebx, [bp+arg_0]
		sar	ebx, 6
		xor	cx, cx
		or	ebx, ebx
		jns	short loc_59EDA
		add	bx, 5A0h

loc_59EDA:
		cmp	bx, 168h
		jb	short loc_59EFF
		sub	bx, 2D0h
		jl	short loc_59EF0
		cmp	bx, 168h
		jb	short loc_59EFF
		sub	bx, 2D0h

loc_59EF0:
		neg	bx
		inc	cx
		cmp	bx, 167h
		mov	eax, 7FFFFFFFh
		jz	short loc_59F0D

loc_59EFF:
		mov	ax, seg seg221
		mov	es, ax
		shl	bx, 1
		movzx	eax, word ptr es:[bx+36Bh]

loc_59F0D:
		or	cx, cx
		jz	short loc_59F14
		neg	eax

loc_59F14:
		shld	edx, eax, 10h
		leave
		retf
Math_Tan_Raw_59EC3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59F1B		proc far

arg_0		= dword ptr  6

		enter	0, 0
		push	si
		push	di
		mov	ebx, [bp+arg_0]
		sar	ebx, 6
		xor	cx, cx
		sub	bx, 168h
		jl	short loc_59F44
		sub	bx, 168h
		jl	short loc_59F3D
		sub	bx, 168h
		jl	short loc_59F44

loc_59F3D:
		inc	cx
		add	bx, 168h
		neg	bx

loc_59F44:
		neg	bx
		mov	si, bx
		mov	di, 168h
		sub	di, si
		mov	ax, seg seg221
		mov	es, ax
		xor	edx, edx
		movzx	eax, word ptr es:[si]
		shl	eax, 8
		movzx	ebx, word ptr es:[di]
		idiv	ebx
		or	cx, cx
		jz	short loc_59F6D
		neg	eax

loc_59F6D:
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
sub_59F1B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Math_AsinRaw_26D0A
; (sub_26D0A de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_AsinRaw_581A0 (sub_581A0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, LUE (2026-09-24). Ex-'Math_ArcCos_Raw_581A0' : NOM
; INVERSE, c'est un ARC SINUS. 90 deg - table_acos(|x|), puis negation si x < 0 (asin(-x) =
; -asin(x)).
; ==============================================================================================
Math_AsinRaw_59F76		proc far

arg_0		= dword ptr  6

		enter	0, 0
		mov	ebx, [bp+arg_0]
		or	ebx, ebx
		sets	cl
		jns	short loc_59F89
		neg	ebx

loc_59F89:
		cmp	ebx, 100h
		ja	short loc_59FB2
		shl	bx, 1
		mov	ax, seg seg221
		mov	es, ax
		add	bx, 169h
		movzx	eax, word ptr es:[bx]
		neg	eax
		add	eax, 5A00h
		or	cl, cl
		jz	short loc_59FB2
		neg	eax

loc_59FB2:
		shld	edx, eax, 10h
		leave
		retf
Math_AsinRaw_59F76		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Math_AcosRaw_26D4D
; (sub_26D4D de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_AcosRaw_581E3 (sub_581E3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, LUE (2026-09-24). Ex-'Math_ArcSin_Raw_581E3' : NOM
; INVERSE, c'est un ARC COSINUS. x 24.8, |x| <= 1.0 : table de mots seg213+0x169 indexee par
; |x| (table[x] = acos(x/256) en degres 24.8, verifie : 90 deg a 0, 60 deg a 0,5, 45 deg a
; 181/256, 0 deg a 1) ; x < 0 : 180 deg - table (symetrie acos(-x) = 180 - acos(x)). |x| > 1.0
; : eax non defini (pas de branche).
; ==============================================================================================
Math_AcosRaw_59FB9		proc far

arg_0		= dword ptr  6

		enter	0, 0
		mov	ebx, [bp+arg_0]
		or	ebx, ebx
		sets	cl
		jns	short loc_59FCC
		neg	ebx

loc_59FCC:
		cmp	ebx, 100h
		ja	short loc_59FF2
		shl	bx, 1
		mov	ax, seg seg221
		mov	es, ax
		add	bx, 169h
		movzx	eax, word ptr es:[bx]
		or	cl, cl
		jz	short loc_59FF2
		neg	eax
		add	eax, 0B400h

loc_59FF2:
		shld	edx, eax, 10h
		leave
		retf
Math_AcosRaw_59FB9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_59FF9		proc far

arg_0		= dword ptr  6

		enter	0, 0
		push	di
		push	si
		mov	ax, seg seg221
		mov	es, ax
		xor	cx, cx
		mov	eax, [bp+arg_0]
		or	eax, eax
		jns	short loc_5A013
		neg	eax
		inc	cx

loc_5A013:
		mov	bx, 2D0h
		cmp	eax, 10000h
		jge	short loc_5A04C
		xor	si, si
		jmp	short loc_5A043

loc_5A022:
		mov	bx, di
		sub	bx, si
		shr	bx, 1
		and	bx, 0FFFEh
		add	bx, si
		cmp	es:[bx+36Bh], ax
		jz	short loc_5A04C
		ja	short loc_5A043
		mov	si, bx
		add	si, 2
		cmp	si, di
		jl	short loc_5A022
		jmp	short loc_5A04C
		nop

loc_5A043:
		mov	di, bx
		sub	di, 2
		cmp	si, di
		jl	short loc_5A022

loc_5A04C:
		shr	bx, 1
		or	cx, cx
		jz	short loc_5A054
		neg	bx

loc_5A054:
		movsx	eax, bx
		shl	eax, 6
		shld	edx, eax, 10h
		pop	si
		pop	di
		leave
		retf
sub_59FF9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5A065		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		enter	0, 0
		push	esi
		mov	eax, [bp+arg_8]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	ecx, eax
		mov	eax, [bp+arg_4]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	ebx, eax
		mov	eax, [bp+arg_0]
		cdq
		xor	eax, edx
		sub	eax, edx
		mov	edx, eax
		sub	edx, ebx
		sbb	esi, esi
		and	edx, esi
		sub	eax, edx
		add	ebx, edx
		mov	edx, eax
		sub	edx, ecx
		sbb	esi, esi
		and	edx, esi
		sub	eax, edx
		add	ecx, edx
		mov	edx, ebx
		sub	edx, ecx
		sbb	esi, esi
		and	edx, esi
		sub	ebx, edx
		add	ecx, edx
		pop	esi
		shr	ecx, 2
		add	eax, ecx
		shr	ebx, 2
		add	eax, ebx
		shr	ebx, 1
		add	eax, ebx
		shr	ebx, 2
		sub	eax, ebx
		shld	edx, eax, 10h
		leave
		retf
sub_5A065		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Math_Sqrt_Raw_26E59
; (sub_26E59 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_Sqrt_Raw_582EE (sub_582EE de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, racine carrée en virgule fixe (implémentation brute —
; appelée par Math_Sqrt_54BF1).
; ==============================================================================================
Math_Sqrt_Raw_5A0EF		proc far

arg_0		= dword ptr  6

		enter	0, 0
		push	si
		push	di
		xor	eax, eax
		mov	esi, [bp+arg_0]
		or	esi, esi
		js	short loc_5A13C
		shld	ebx, esi, 8
		shl	esi, 8
		xor	edx, edx
		mov	cx, 14h
		jmp	short loc_5A115

loc_5A112:
		dec	cx
		jz	short loc_5A13C

loc_5A115:
		shl	esi, 1
		rcl	bl, 1
		rcl	edx, 1
		shl	esi, 1
		rcl	bl, 1
		rcl	edx, 1
		shl	eax, 1
		mov	edi, eax
		stc
		rcl	edi, 1
		cmp	edi, edx
		ja	short loc_5A112
		sub	edx, edi
		inc	eax
		dec	cx
		jnz	short loc_5A115

loc_5A13C:
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
Math_Sqrt_Raw_5A0EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_ComputeSinCosPair_58344 (sub_58344 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, calcule simultanément sinus et cosinus d'un
; même angle (Math_SinRaw_58063 + Math_CosRaw_580A7). Référencée par sub_1B23F. ⚠️
; (2026-09-24) Math_Sin_5483F / Math_Cos_54876 et leurs versions brutes sont INVERSEES (voir
; Math_CosDeg_5483F) : toute mention de sinus/cosinus tiree de ces noms dans ce resume est a
; relire.
; ==============================================================================================
Math_ComputeSinCosPair_5A145		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	6, 0
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		cwd
		mov	dl, ah
		mov	ah, al
		xor	al, al
		push	dx
		push	ax
		push	cs
		call	near ptr sub_59E37
		mov	[bp+var_2], ax
		push	cs
		call	near ptr Math_CosRaw_59E7D
		add	sp, 4
		mov	[bp+var_4], ax
		mov	ax, [si]
		mov	[bp+var_6], ax
		imul	[bp+var_4]
		mov	bx, ax
		mov	cx, dx
		mov	ax, [si+2]
		imul	[bp+var_2]
		add	ax, bx
		adc	dx, cx
		mov	al, ah
		mov	ah, dl
		mov	[si], ax
		mov	ax, [si+2]
		imul	[bp+var_4]
		mov	bx, ax
		mov	cx, dx
		mov	ax, [bp+var_6]
		imul	[bp+var_2]
		sub	bx, ax
		sbb	cx, dx
		mov	al, bh
		mov	ah, cl
		mov	[si+2], ax
		pop	si
		leave
		retf
Math_ComputeSinCosPair_5A145		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Math_Helper_26F0E
; (sub_26F0E de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_Helper_583A3 (sub_583A3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, fonction mathématique sans appel externe (calcul
; autonome), référencée par seg059 — rôle exact non détaillé.
; ==============================================================================================
Math_Helper_5A1A4		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	eax, [si+4]
		mov	[bp+var_8], eax
		mov	eax, [si+8]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_4]
		imul	dword ptr [di]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [bp+var_8]
		imul	dword ptr [di+4]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [bp+var_C]
		imul	dword ptr [di+8]
		add	ebx, eax
		adc	ecx, edx
		shrd	ebx, ecx, 8
		mov	eax, [di+0Ch]
		add	eax, ebx
		mov	[si], eax
		mov	eax, [bp+var_4]
		imul	dword ptr [di+10h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [bp+var_8]
		imul	dword ptr [di+14h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [bp+var_C]
		imul	dword ptr [di+18h]
		add	ebx, eax
		adc	ecx, edx
		shrd	ebx, ecx, 8
		mov	eax, [di+1Ch]
		add	eax, ebx
		mov	[si+4], eax
		mov	eax, [bp+var_4]
		imul	dword ptr [di+20h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [bp+var_8]
		imul	dword ptr [di+24h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [bp+var_C]
		imul	dword ptr [di+28h]
		add	ebx, eax
		adc	ecx, edx
		shrd	ebx, ecx, 8
		mov	eax, [di+2Ch]
		add	eax, ebx
		mov	[si+8], eax
		pop	di
		pop	si
		leave
		retf
Math_Helper_5A1A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Math_VectorTransformByMatrix3x3_26FE1 (sub_26FE1 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à Math_VectorTransformByMatrix3x3_58476 (sub_58476 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; transformation d'un vecteur 3D par une matrice 3×3 (9 multiplications-accumulations en
; virgule fixe) — implémentation du produit matrice×vecteur utilisé par le cluster de rotation
; (seg116). Référencée par Damage_ComputeHelperB_564CE.
; ==============================================================================================
Math_VectorTransformByMatrix3x3_5A277		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		enter	0, 0
		push	si
		push	di
		mov	si, [bp+arg_2]
		mov	di, [bp+arg_4]
		mov	eax, [si]
		imul	dword ptr [di]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr [di+4]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr [di+8]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	si, [bp+arg_0]
		mov	[si], eax
		mov	si, [bp+arg_2]
		mov	eax, [si]
		imul	dword ptr [di+0Ch]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr [di+10h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr [di+14h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	si, [bp+arg_0]
		mov	[si+10h], eax
		mov	si, [bp+arg_2]
		mov	eax, [si]
		imul	dword ptr [di+18h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr [di+1Ch]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr [di+20h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	si, [bp+arg_0]
		mov	[si+20h], eax
		mov	si, [bp+arg_2]
		mov	eax, [si+0Ch]
		imul	dword ptr [di]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+10h]
		imul	dword ptr [di+4]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+14h]
		imul	dword ptr [di+8]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	si, [bp+arg_0]
		mov	[si+4], eax
		mov	si, [bp+arg_2]
		mov	eax, [si+0Ch]
		imul	dword ptr [di+0Ch]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+10h]
		imul	dword ptr [di+10h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+14h]
		imul	dword ptr [di+14h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	si, [bp+arg_0]
		mov	[si+14h], eax
		mov	si, [bp+arg_2]
		mov	eax, [si+0Ch]
		imul	dword ptr [di+18h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+10h]
		imul	dword ptr [di+1Ch]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+14h]
		imul	dword ptr [di+20h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	si, [bp+arg_0]
		mov	[si+24h], eax
		mov	si, [bp+arg_2]
		mov	eax, [si+18h]
		imul	dword ptr [di]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+1Ch]
		imul	dword ptr [di+4]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+20h]
		imul	dword ptr [di+8]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	si, [bp+arg_0]
		mov	[si+8], eax
		mov	si, [bp+arg_2]
		mov	eax, [si+18h]
		imul	dword ptr [di+0Ch]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+1Ch]
		imul	dword ptr [di+10h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+20h]
		imul	dword ptr [di+14h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	si, [bp+arg_0]
		mov	[si+18h], eax
		mov	si, [bp+arg_2]
		mov	eax, [si+18h]
		imul	dword ptr [di+18h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+1Ch]
		imul	dword ptr [di+1Ch]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+20h]
		imul	dword ptr [di+20h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	si, [bp+arg_0]
		mov	[si+28h], eax
		mov	si, [bp+arg_6]
		mov	eax, [si]
		imul	dword ptr [di]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr [di+4]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr [di+8]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	si, [bp+arg_0]
		mov	[si+0Ch], eax
		mov	si, [bp+arg_6]
		mov	eax, [si]
		imul	dword ptr [di+0Ch]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr [di+10h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr [di+14h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	si, [bp+arg_0]
		mov	[si+1Ch], eax
		mov	si, [bp+arg_6]
		mov	eax, [si]
		imul	dword ptr [di+18h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr [di+1Ch]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr [di+20h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	si, [bp+arg_0]
		mov	[si+2Ch], eax
		pop	di
		pop	si
		leave
		retf
Math_VectorTransformByMatrix3x3_5A277		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5A525		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [si]
		imul	dword ptr [di]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		imul	dword ptr [di+4]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		imul	dword ptr [di+8]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	dx, ax
		shr	eax, 10h
		xchg	dx, ax
		pop	di
		pop	si
		leave
		retf
sub_5A525		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Matrix_WorldToLocal_272D3 (sub_272D3 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Matrix_WorldToLocal_58768 (sub_58768 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE (2026-09-24).
; Ex-'Math_ApplyRotationHelperA'. v = M . v : chaque sortie est le produit scalaire de v avec
; une LIGNE de la matrice 3x3 24.8 (M+0, M+0x0C, M+0x18). Pour une matrice d'orientation
; (lignes = axes de l'objet), passage du repere monde au repere de l'objet. Inverse de
; Matrix_LocalToWorld_58828.
; ==============================================================================================
Matrix_WorldToLocal_5A569		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	eax, [si+4]
		mov	[bp+var_8], eax
		mov	eax, [si+8]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_4]
		imul	dword ptr [di]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [bp+var_8]
		imul	dword ptr [di+4]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [bp+var_C]
		imul	dword ptr [di+8]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [bp+var_4]
		imul	dword ptr [di+0Ch]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [bp+var_8]
		imul	dword ptr [di+10h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [bp+var_C]
		imul	dword ptr [di+14h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	[si+4], eax
		mov	eax, [bp+var_4]
		imul	dword ptr [di+18h]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [bp+var_8]
		imul	dword ptr [di+1Ch]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [bp+var_C]
		imul	dword ptr [di+20h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	[si+8], eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_WorldToLocal_5A569		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5A629		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0Ch, 0
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	eax, [si+4]
		mov	[bp+var_8], eax
		mov	eax, [si+8]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_4]
		imul	dword ptr [di]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [bp+var_8]
		imul	dword ptr [di+0Ch]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [bp+var_C]
		imul	dword ptr [di+18h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [bp+var_4]
		imul	dword ptr [di+4]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [bp+var_8]
		imul	dword ptr [di+10h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [bp+var_C]
		imul	dword ptr [di+1Ch]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
		mov	[si+4], eax
		mov	eax, [bp+var_4]
		imul	dword ptr [di+8]
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [bp+var_8]
		imul	dword ptr [di+14h]
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [bp+var_C]
		imul	dword ptr [di+20h]
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
sub_5A629		endp

; START OF FUNCTION CHUNK FOR sub_5A629
		db 66h
; END OF FUNCTION CHUNK FOR sub_5A629
seg129		ends
