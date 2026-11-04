seg071		segment	para public 'CODE' use16
		assume cs:seg071
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E8h, 1Dh, 0EDh, 83h, 0C4h, 4, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B768		proc far

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
sub_2B768		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_FixedMultiply_58034 (sub_58034 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, multiplication en virgule fixe 24.8 (imul + shrd/shld).
; Référencée depuis seg020 (défilement/cadrage de vue).
; ==============================================================================================
Math_FixedMultiply_2B786		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		enter	0, 0
		mov	eax, [bp+arg_0]
		imul	[bp+arg_4]
		shrd	eax, edx, 8
		shld	edx, eax, 10h
		leave
		retf
Math_FixedMultiply_2B786		endp

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
Math_FixedMulDiv_2B79E		proc far

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
Math_FixedMulDiv_2B79E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B7B5		proc far

arg_0		= dword ptr  6

		enter	0, 0
		xor	cx, cx
		mov	ebx, [bp+arg_0]
		sar	ebx, 6
		jns	short loc_2B7C9
		add	bx, 5A0h

loc_2B7C9:
		mov	ax, 168h
		sub	bx, ax
		jl	short loc_2B7DD
		sub	bx, ax
		jge	short loc_2B7D8
		add	bx, ax
		jmp	short loc_2B7DF

loc_2B7D8:
		inc	cx
		sub	bx, ax
		jge	short loc_2B7DF

loc_2B7DD:
		neg	bx

loc_2B7DF:
		mov	ax, 100h
		or	bx, bx
		jz	short loc_2B7F0
		mov	ax, seg seg181
		mov	es, ax
		xor	ax, ax
		mov	al, es:[bx]

loc_2B7F0:
		or	cx, cx
		jz	short loc_2B7F8
		nop
		nop
		neg	ax

loc_2B7F8:
		cwd
		leave
		retf
sub_2B7B5		endp

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
Math_CosRaw_2B7FB		proc far

arg_0		= dword ptr  6

		enter	0, 0
		xor	cx, cx
		mov	ebx, [bp+arg_0]
		sar	ebx, 6
		jns	short loc_2B80D
		neg	bx

loc_2B80D:
		cmp	bx, 168h
		jb	short loc_2B827
		inc	cx
		sub	bx, 2D0h
		jl	short loc_2B825
		cmp	bx, 168h
		jl	short loc_2B827
		dec	cx
		sub	bx, 2D0h

loc_2B825:
		neg	bx

loc_2B827:
		mov	ax, 100h
		or	bx, bx
		jz	short loc_2B838
		mov	ax, seg seg181
		mov	es, ax
		xor	ax, ax
		mov	al, es:[bx]

loc_2B838:
		or	cx, cx
		jz	short loc_2B83E
		neg	ax

loc_2B83E:
		cwd
		leave
		retf
Math_CosRaw_2B7FB		endp

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
Math_Tan_Raw_2B841		proc far

arg_0		= dword ptr  6

		enter	0, 0
		mov	ebx, [bp+arg_0]
		sar	ebx, 6
		xor	cx, cx
		or	ebx, ebx
		jns	short loc_2B858
		add	bx, 5A0h

loc_2B858:
		cmp	bx, 168h
		jb	short loc_2B87D
		sub	bx, 2D0h
		jl	short loc_2B86E
		cmp	bx, 168h
		jb	short loc_2B87D
		sub	bx, 2D0h

loc_2B86E:
		neg	bx
		inc	cx
		cmp	bx, 167h
		mov	eax, 7FFFFFFFh
		jz	short loc_2B88B

loc_2B87D:
		mov	ax, seg seg181
		mov	es, ax
		shl	bx, 1
		movzx	eax, word ptr es:[bx+36Bh]

loc_2B88B:
		or	cx, cx
		jz	short loc_2B892
		neg	eax

loc_2B892:
		shld	edx, eax, 10h
		leave
		retf
Math_Tan_Raw_2B841		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B899		proc far

arg_0		= dword ptr  6

		enter	0, 0
		push	si
		push	di
		mov	ebx, [bp+arg_0]
		sar	ebx, 6
		xor	cx, cx
		sub	bx, 168h
		jl	short loc_2B8C2
		sub	bx, 168h
		jl	short loc_2B8BB
		sub	bx, 168h
		jl	short loc_2B8C2

loc_2B8BB:
		inc	cx
		add	bx, 168h
		neg	bx

loc_2B8C2:
		neg	bx
		mov	si, bx
		mov	di, 168h
		sub	di, si
		mov	ax, seg seg181
		mov	es, ax
		xor	edx, edx
		movzx	eax, word ptr es:[si]
		shl	eax, 8
		movzx	ebx, word ptr es:[di]
		idiv	ebx
		or	cx, cx
		jz	short loc_2B8EB
		neg	eax

loc_2B8EB:
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
sub_2B899		endp

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
Math_AsinRaw_2B8F4		proc far

arg_0		= dword ptr  6

		enter	0, 0
		mov	ebx, [bp+arg_0]
		or	ebx, ebx
		sets	cl
		jns	short loc_2B907
		neg	ebx

loc_2B907:
		cmp	ebx, 100h
		ja	short loc_2B930
		shl	bx, 1
		mov	ax, seg seg181
		mov	es, ax
		add	bx, 169h
		movzx	eax, word ptr es:[bx]
		neg	eax
		add	eax, 5A00h
		or	cl, cl
		jz	short loc_2B930
		neg	eax

loc_2B930:
		shld	edx, eax, 10h
		leave
		retf
Math_AsinRaw_2B8F4		endp

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
Math_AcosRaw_2B937		proc far

arg_0		= dword ptr  6

		enter	0, 0
		mov	ebx, [bp+arg_0]
		or	ebx, ebx
		sets	cl
		jns	short loc_2B94A
		neg	ebx

loc_2B94A:
		cmp	ebx, 100h
		ja	short loc_2B970
		shl	bx, 1
		mov	ax, seg seg181
		mov	es, ax
		add	bx, 169h
		movzx	eax, word ptr es:[bx]
		or	cl, cl
		jz	short loc_2B970
		neg	eax
		add	eax, 0B400h

loc_2B970:
		shld	edx, eax, 10h
		leave
		retf
Math_AcosRaw_2B937		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B977		proc far

arg_0		= dword ptr  6

		enter	0, 0
		push	di
		push	si
		mov	ax, seg seg181
		mov	es, ax
		xor	cx, cx
		mov	eax, [bp+arg_0]
		or	eax, eax
		jns	short loc_2B991
		neg	eax
		inc	cx

loc_2B991:
		mov	bx, 2D0h
		cmp	eax, 10000h
		jge	short loc_2B9CA
		xor	si, si
		jmp	short loc_2B9C1

loc_2B9A0:
		mov	bx, di
		sub	bx, si
		shr	bx, 1
		and	bx, 0FFFEh
		add	bx, si
		cmp	es:[bx+36Bh], ax
		jz	short loc_2B9CA
		ja	short loc_2B9C1
		mov	si, bx
		add	si, 2
		cmp	si, di
		jl	short loc_2B9A0
		jmp	short loc_2B9CA
		nop

loc_2B9C1:
		mov	di, bx
		sub	di, 2
		cmp	si, di
		jl	short loc_2B9A0

loc_2B9CA:
		shr	bx, 1
		or	cx, cx
		jz	short loc_2B9D2
		neg	bx

loc_2B9D2:
		movsx	eax, bx
		shl	eax, 6
		shld	edx, eax, 10h
		pop	si
		pop	di
		leave
		retf
sub_2B977		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B9E3		proc far

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
sub_2B9E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BA6D		proc far

arg_0		= dword ptr  6

		enter	0, 0
		push	si
		push	di
		xor	eax, eax
		mov	esi, [bp+arg_0]
		or	esi, esi
		js	short loc_2BAAA
		xor	edx, edx
		mov	cx, 14h
		jmp	short loc_2BA8A

loc_2BA87:
		dec	cx
		jz	short loc_2BAAA

loc_2BA8A:
		shld	edx, esi, 2
		shl	esi, 2
		add	eax, eax
		mov	edi, eax
		stc
		adc	edi, edi
		cmp	edi, edx
		ja	short loc_2BA87
		sub	edx, edi
		inc	eax
		dec	cx
		jnz	short loc_2BA8A

loc_2BAAA:
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
sub_2BA6D		endp

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
Math_ComputeSinCosPair_2BAB3		proc far

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
		call	near ptr sub_2B7B5
		mov	[bp+var_2], ax
		push	cs
		call	near ptr Math_CosRaw_2B7FB
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
Math_ComputeSinCosPair_2BAB3		endp

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
Math_Helper_2BB12		proc far

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
Math_Helper_2BB12		endp

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
Math_VectorTransformByMatrix3x3_2BBE5		proc far

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
Math_VectorTransformByMatrix3x3_2BBE5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BE93		proc far

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
sub_2BE93		endp

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
Matrix_WorldToLocal_2BED7		proc far

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
Matrix_WorldToLocal_2BED7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BF97		proc far

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
sub_2BF97		endp

; START OF FUNCTION CHUNK FOR sub_2BF97
		db 66h, 89h
		inc	sp
; END OF FUNCTION CHUNK FOR sub_2BF97
seg071		ends
