seg058		segment	byte public 'CODE' use16
		assume cs:seg058
		;org 0Eh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
		enter	0, 0
		mov	eax, [bp+6]
		cdq
		shld	edx, eax, 8
		shl	eax, 8
		idiv	dword ptr [bp+0Ah]
		shld	edx, eax, 10h
		leave
		retf
; ���������������������������������������������������������������������������
		enter	0, 0
		mov	eax, [bp+6]
		imul	dword ptr [bp+0Ah]
		shrd	eax, edx, 8
		shld	edx, eax, 10h
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Math_FixedMulDiv_5804C
; (sub_5804C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, "MulDiv" en virgule fixe (a*b/c). Référencée par Radar_Project3DToScreen
; (sub_16988).
; ==============================================================================================
Math_FixedMulDiv_26BB4	proc far		; CODE XREF: seg028:031AP seg028:035EP ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		enter	0, 0
		mov	eax, [bp+arg_0]
		imul	[bp+arg_4]
		idiv	[bp+arg_8]
		shld	edx, eax, 10h
		leave
		retf
Math_FixedMulDiv_26BB4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_26BCB	proc far		; CODE XREF: sub_22E6C+19P
					; sub_23CDD+2FP ...

arg_0		= dword	ptr  6

		enter	0, 0
		xor	cx, cx
		mov	ebx, [bp+arg_0]
		sar	ebx, 6
		jns	short loc_26BDF
		add	bx, 5A0h

loc_26BDF:				; CODE XREF: sub_26BCB+Ej
		mov	ax, 168h
		sub	bx, ax
		jl	short loc_26BF3
		sub	bx, ax
		jge	short loc_26BEE
		add	bx, ax
		jmp	short loc_26BF5
; ���������������������������������������������������������������������������

loc_26BEE:				; CODE XREF: sub_26BCB+1Dj
		inc	cx
		sub	bx, ax
		jge	short loc_26BF5

loc_26BF3:				; CODE XREF: sub_26BCB+19j
		neg	bx

loc_26BF5:				; CODE XREF: sub_26BCB+21j
					; sub_26BCB+26j
		mov	ax, 100h
		or	bx, bx
		jz	short loc_26C06
		mov	ax, seg	seg167
		mov	es, ax
		assume es:seg167
		xor	ax, ax
		mov	al, es:[bx]

loc_26C06:				; CODE XREF: sub_26BCB+2Fj
		or	cx, cx
		jz	short loc_26C0E
		nop
		nop
		neg	ax

loc_26C0E:				; CODE XREF: sub_26BCB+3Dj
		cwd
		leave
		retf
sub_26BCB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Math_CosRaw_580A7
; (sub_580A7 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, LUE (2026-09-24). Ex-'Math_Sin_Raw' : NOM INVERSE, c'est un COSINUS. i = |angle
; 24.8| >> 6 (quarts de degre) ; ramene dans [0, 90 deg] avec signe (cx) ; 1.0 (0x100) si i ==
; 0, sinon table d'octets seg213 (unk_68B90) : table[i] = cos(i/4 deg) en 24.8 (1.0 = 256)
; (verifie : 221 a 30 deg, 181 a 45 deg, 127 a 60 deg, 0 a 90 deg). Fonction paire (utilise
; |angle|) : cos(0) = 1, cos(180) = -1.
; ==============================================================================================
Math_CosRaw_26C11	proc far		; CODE XREF: sub_22E2A+19P
					; sub_23CDD+48P ...

arg_0		= dword	ptr  6

		enter	0, 0
		xor	cx, cx
		mov	ebx, [bp+arg_0]
		sar	ebx, 6
		jns	short loc_26C23
		neg	bx

loc_26C23:				; CODE XREF: Math_CosRaw_26C11+Ej
		cmp	bx, 168h
		jb	short loc_26C3D
		inc	cx
		sub	bx, 2D0h
		jl	short loc_26C3B
		cmp	bx, 168h
		jl	short loc_26C3D
		dec	cx
		sub	bx, 2D0h

loc_26C3B:				; CODE XREF: Math_CosRaw_26C11+1Dj
		neg	bx

loc_26C3D:				; CODE XREF: Math_CosRaw_26C11+16j
					; Math_CosRaw_26C11+23j
		mov	ax, 100h
		or	bx, bx
		jz	short loc_26C4E
		mov	ax, seg	seg167
		mov	es, ax
		xor	ax, ax
		mov	al, es:[bx]

loc_26C4E:				; CODE XREF: Math_CosRaw_26C11+31j
		or	cx, cx
		jz	short loc_26C54
		neg	ax

loc_26C54:				; CODE XREF: Math_CosRaw_26C11+3Fj
		cwd
		leave
		retf
Math_CosRaw_26C11	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Math_Tan_Raw_580ED
; (sub_580ED de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, tangente en virgule fixe (implémentation brute — appelée par Math_Tan_548AD).
; ==============================================================================================
Math_Tan_Raw_26C57	proc far		; CODE XREF: sub_22EAE+77P

arg_0		= dword	ptr  6

		enter	0, 0
		mov	ebx, [bp+arg_0]
		sar	ebx, 6
		xor	cx, cx
		or	ebx, ebx
		jns	short loc_26C6E
		add	bx, 5A0h

loc_26C6E:				; CODE XREF: Math_Tan_Raw_26C57+11j
		cmp	bx, 168h
		jb	short loc_26C93
		sub	bx, 2D0h
		jl	short loc_26C84
		cmp	bx, 168h
		jb	short loc_26C93
		sub	bx, 2D0h

loc_26C84:				; CODE XREF: Math_Tan_Raw_26C57+21j
		neg	bx
		inc	cx
		cmp	bx, 167h
		mov	eax, 7FFFFFFFh
		jz	short loc_26CA1

loc_26C93:				; CODE XREF: Math_Tan_Raw_26C57+1Bj
					; Math_Tan_Raw_26C57+27j
		mov	ax, seg	seg167
		mov	es, ax
		shl	bx, 1
		movzx	eax, word ptr es:[bx+36Bh]

loc_26CA1:				; CODE XREF: Math_Tan_Raw_26C57+3Aj
		or	cx, cx
		jz	short loc_26CA8
		neg	eax

loc_26CA8:				; CODE XREF: Math_Tan_Raw_26C57+4Cj
		shld	edx, eax, 10h
		leave
		retf
Math_Tan_Raw_26C57	endp

; ���������������������������������������������������������������������������
		enter	0, 0
		push	si
		push	di
		mov	ebx, [bp+6]
		sar	ebx, 6
		xor	cx, cx
		sub	bx, 168h
		jl	short loc_26CD8
		sub	bx, 168h
		jl	short loc_26CD1
		sub	bx, 168h
		jl	short loc_26CD8

loc_26CD1:				; CODE XREF: seg058:0159j
		inc	cx
		add	bx, 168h
		neg	bx

loc_26CD8:				; CODE XREF: seg058:0153j seg058:015Fj
		neg	bx
		mov	si, bx
		mov	di, 168h
		sub	di, si
		mov	ax, seg	seg167
		mov	es, ax
		xor	edx, edx
		movzx	eax, word ptr es:[si]
		shl	eax, 8
		movzx	ebx, word ptr es:[di]
		idiv	ebx
		or	cx, cx
		jz	short loc_26D01
		neg	eax

loc_26D01:				; CODE XREF: seg058:018Cj
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Math_AsinRaw_581A0
; (sub_581A0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, LUE (2026-09-24). Ex-'Math_ArcCos_Raw_581A0' : NOM INVERSE, c'est un ARC SINUS.
; 90 deg - table_acos(|x|), puis negation si x < 0 (asin(-x) = -asin(x)).
; ==============================================================================================
Math_AsinRaw_26D0A	proc far		; CODE XREF: sub_22FBF+44P

arg_0		= dword	ptr  6

		enter	0, 0
		mov	ebx, [bp+arg_0]
		or	ebx, ebx
		sets	cl
		jns	short loc_26D1D
		neg	ebx

loc_26D1D:				; CODE XREF: Math_AsinRaw_26D0A+Ej
		cmp	ebx, 100h
		ja	short loc_26D46
		shl	bx, 1
		mov	ax, seg	seg167
		mov	es, ax
		add	bx, 169h
		movzx	eax, word ptr es:[bx]
		neg	eax
		add	eax, 5A00h
		or	cl, cl
		jz	short loc_26D46
		neg	eax

loc_26D46:				; CODE XREF: Math_AsinRaw_26D0A+1Aj
					; Math_AsinRaw_26D0A+37j
		shld	edx, eax, 10h
		leave
		retf
Math_AsinRaw_26D0A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Math_AcosRaw_581E3
; (sub_581E3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, LUE (2026-09-24). Ex-'Math_ArcSin_Raw_581E3' : NOM INVERSE, c'est un ARC
; COSINUS. x 24.8, |x| <= 1.0 : table de mots seg213+0x169 indexee par |x| (table[x] =
; acos(x/256) en degres 24.8, verifie : 90 deg a 0, 60 deg a 0,5, 45 deg a 181/256, 0 deg a 1)
; ; x < 0 : 180 deg - table (symetrie acos(-x) = 180 - acos(x)). |x| > 1.0 : eax non defini
; (pas de branche).
; ==============================================================================================
Math_AcosRaw_26D4D	proc far		; CODE XREF: sub_22F4E+44P

arg_0		= dword	ptr  6

		enter	0, 0
		mov	ebx, [bp+arg_0]
		or	ebx, ebx
		sets	cl
		jns	short loc_26D60
		neg	ebx

loc_26D60:				; CODE XREF: Math_AcosRaw_26D4D+Ej
		cmp	ebx, 100h
		ja	short loc_26D86
		shl	bx, 1
		mov	ax, seg	seg167
		mov	es, ax
		add	bx, 169h
		movzx	eax, word ptr es:[bx]
		or	cl, cl
		jz	short loc_26D86
		neg	eax
		add	eax, 0B400h

loc_26D86:				; CODE XREF: Math_AcosRaw_26D4D+1Aj
					; Math_AcosRaw_26D4D+2Ej
		shld	edx, eax, 10h
		leave
		retf
Math_AcosRaw_26D4D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_26D8D	proc far		; CODE XREF: sub_2313C+DP seg056:048BP

arg_0		= dword	ptr  6

		enter	0, 0
		push	di
		push	si
		mov	ax, seg	seg167
		mov	es, ax
		xor	cx, cx
		mov	eax, [bp+arg_0]
		or	eax, eax
		jns	short loc_26DA7
		neg	eax
		inc	cx

loc_26DA7:				; CODE XREF: sub_26D8D+14j
		mov	bx, 2D0h
		cmp	eax, 10000h
		jge	short loc_26DE0
		xor	si, si
		jmp	short loc_26DD7
; ���������������������������������������������������������������������������

loc_26DB6:				; CODE XREF: sub_26D8D+45j
					; sub_26D8D+51j
		mov	bx, di
		sub	bx, si
		shr	bx, 1
		and	bx, 0FFFEh
		add	bx, si
		cmp	es:[bx+36Bh], ax
		jz	short loc_26DE0
		ja	short loc_26DD7
		mov	si, bx
		add	si, 2
		cmp	si, di
		jl	short loc_26DB6
		jmp	short loc_26DE0
; ���������������������������������������������������������������������������
		db 90h
; ���������������������������������������������������������������������������

loc_26DD7:				; CODE XREF: sub_26D8D+27j
					; sub_26D8D+3Cj
		mov	di, bx
		sub	di, 2
		cmp	si, di
		jl	short loc_26DB6

loc_26DE0:				; CODE XREF: sub_26D8D+23j
					; sub_26D8D+3Aj ...
		shr	bx, 1
		or	cx, cx
		jz	short loc_26DE8
		neg	bx

loc_26DE8:				; CODE XREF: sub_26D8D+57j
		movsx	eax, bx
		shl	eax, 6
		shld	edx, eax, 10h
		pop	si
		pop	di
		leave
		retf
sub_26D8D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_VectorLength3D_Raw_5828E (sub_5828E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, longueur de vecteur 3D en virgule fixe
; (implémentation brute, sans mise à l'échelle anti-débordement) — utilisée très largement
; dans tout le moteur (IA, HUD, caméra, armement).
; ==============================================================================================
Math_VectorLength3D_Raw_26DF9	proc far		; CODE XREF: sub_8867+118P
					; seg029:0533P	...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		enter	0, 0
		mov	eax, [bp+arg_0]
		mov	ebx, [bp+arg_4]
		mov	ecx, [bp+arg_8]
		or	eax, eax
		jns	short loc_26E11
		neg	eax

loc_26E11:				; CODE XREF: Math_VectorLength3D_Raw_26DF9+13j
		or	ebx, ebx
		jns	short loc_26E19
		neg	ebx

loc_26E19:				; CODE XREF: Math_VectorLength3D_Raw_26DF9+1Bj
		or	ecx, ecx
		jns	short loc_26E21
		neg	ecx

loc_26E21:				; CODE XREF: Math_VectorLength3D_Raw_26DF9+23j
		cmp	eax, ebx
		jnb	short loc_26E28
		xchg	eax, ebx

loc_26E28:				; CODE XREF: Math_VectorLength3D_Raw_26DF9+2Bj
		cmp	eax, ecx
		jnb	short loc_26E2F
		xchg	eax, ecx

loc_26E2F:				; CODE XREF: Math_VectorLength3D_Raw_26DF9+32j
		cmp	ebx, ecx
		jnb	short loc_26E37
		xchg	ebx, ecx

loc_26E37:				; CODE XREF: Math_VectorLength3D_Raw_26DF9+39j
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
Math_VectorLength3D_Raw_26DF9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Math_Sqrt_Raw_582EE
; (sub_582EE de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, racine carrée en virgule fixe (implémentation brute — appelée par
; Math_Sqrt_54BF1).
; ==============================================================================================
Math_Sqrt_Raw_26E59	proc far		; CODE XREF: sub_23288+25P

arg_0		= dword	ptr  6

		enter	0, 0
		push	si
		push	di
		xor	eax, eax
		mov	esi, [bp+arg_0]
		or	esi, esi
		js	short loc_26EA6
		shld	ebx, esi, 8
		shl	esi, 8
		xor	edx, edx
		mov	cx, 14h
		jmp	short loc_26E7F
; ���������������������������������������������������������������������������

loc_26E7C:				; CODE XREF: Math_Sqrt_Raw_26E59+43j
		dec	cx
		jz	short loc_26EA6

loc_26E7F:				; CODE XREF: Math_Sqrt_Raw_26E59+21j
					; Math_Sqrt_Raw_26E59+4Bj
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
		ja	short loc_26E7C
		sub	edx, edi
		inc	eax
		dec	cx
		jnz	short loc_26E7F

loc_26EA6:				; CODE XREF: Math_Sqrt_Raw_26E59+10j
					; Math_Sqrt_Raw_26E59+24j
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
Math_Sqrt_Raw_26E59	endp

; ���������������������������������������������������������������������������
		enter	6, 0
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		cwd
		mov	dl, ah
		mov	ah, al
		xor	al, al
		push	dx
		push	ax
		push	cs
		call	near ptr sub_26BCB
		mov	[bp-2],	ax
		push	cs
		call	near ptr Math_CosRaw_26C11
		add	sp, 4
		mov	[bp-4],	ax
		mov	ax, [si]
		mov	[bp-6],	ax
		imul	word ptr [bp-4]
		mov	bx, ax
		mov	cx, dx
		mov	ax, [si+2]
		imul	word ptr [bp-2]
		add	ax, bx
		adc	dx, cx
		mov	al, ah
		mov	ah, dl
		mov	[si], ax
		mov	ax, [si+2]
		imul	word ptr [bp-4]
		mov	bx, ax
		mov	cx, dx
		mov	ax, [bp-6]
		imul	word ptr [bp-2]
		sub	bx, ax
		sbb	cx, dx
		mov	al, bh
		mov	ah, cl
		mov	[si+2],	ax
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Math_Helper_583A3
; (sub_583A3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, fonction mathématique sans appel externe (calcul autonome), référencée par
; seg059 — rôle exact non détaillé.
; ==============================================================================================
Math_Helper_26F0E	proc far		; CODE XREF: seg045:016EP

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
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
		mov	[si+4],	eax
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
		mov	[si+8],	eax
		pop	di
		pop	si
		leave
		retf
Math_Helper_26F0E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_VectorTransformByMatrix3x3_58476 (sub_58476 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, transformation d'un vecteur 3D par une
; matrice 3×3 (9 multiplications-accumulations en virgule fixe) — implémentation du produit
; matrice×vecteur utilisé par le cluster de rotation (seg116). Référencée par
; Damage_ComputeHelperB_564CE.
; ==============================================================================================
Math_VectorTransformByMatrix3x3_26FE1	proc far		; CODE XREF: sub_24E2B+11P

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
		mov	[si+4],	eax
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
		mov	[si+8],	eax
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
Math_VectorTransformByMatrix3x3_26FE1	endp

; ���������������������������������������������������������������������������
		enter	0, 0
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
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
		xchg	ax, dx
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Matrix_WorldToLocal_58768 (sub_58768 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, LUE (2026-09-24). Ex-'Math_ApplyRotationHelperA'. v = M
; . v : chaque sortie est le produit scalaire de v avec une LIGNE de la matrice 3x3 24.8 (M+0,
; M+0x0C, M+0x18). Pour une matrice d'orientation (lignes = axes de l'objet), passage du
; repere monde au repere de l'objet. Inverse de Matrix_LocalToWorld_58828.
; ==============================================================================================
Matrix_WorldToLocal_272D3	proc far		; CODE XREF: seg028:027DP seg029:0807P ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
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
		mov	[si+4],	eax
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
		mov	[si+8],	eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_WorldToLocal_272D3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Matrix_LocalToWorld_58828 (sub_58828 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, LUE (2026-09-24). Ex-'Math_ApplyRotationHelperB'. v =
; transposee(M) . v : chaque sortie combine une COLONNE de la matrice ([di],[di+0Ch],[di+18h]
; pour la 1re, etc.). Pour une matrice orthonormee, inverse de Matrix_WorldToLocal_58768 :
; passage du repere de l'objet au repere monde.
; ==============================================================================================
Matrix_LocalToWorld_27393	proc far		; CODE XREF: seg029:06A7P seg029:06D3P ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
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
		mov	[si+4],	eax
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
		mov	[si+8],	eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Matrix_LocalToWorld_27393	endp

seg058		ends
