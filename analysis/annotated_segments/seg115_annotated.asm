seg115		segment	byte public 'CODE' use16
		assume cs:seg115
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, normalise un angle fixe (24.8, unité 0x16800=360°) dans l'intervalle [-180°,+180°]
; (0xB400) par additions/soustractions successives d'un tour complet.
; ==============================================================================================
Math_NormalizeAngle180_547EF	proc far		; CODE XREF: Math_CosDeg_5483F+Fp Math_SinDeg_54876+Fp ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_547F2:
		sub	sp, 8
		push	si

loc_547F6:
		mov	si, [bp+arg_4]
		mov	eax, [si]

loc_547FC:
		mov	[bp+var_4], eax
		jmp	short loc_5480A
; ���������������������������������������������������������������������������

loc_54802:				; CODE XREF: Math_NormalizeAngle180_547EF+23j
		add	[bp+var_4], 16800h

loc_5480A:				; CODE XREF: Math_NormalizeAngle180_547EF+11j
		cmp	[bp+var_4], 0FFFF4C00h
		jl	short loc_54802
		jmp	short loc_5481E
; ���������������������������������������������������������������������������

loc_54816:				; CODE XREF: Math_NormalizeAngle180_547EF+37j
		sub	[bp+var_4], 16800h

loc_5481E:				; CODE XREF: Math_NormalizeAngle180_547EF+25j
		cmp	[bp+var_4], 0B400h
		jg	short loc_54816
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax

loc_54830:
		mov	bx, [bp+arg_0]

loc_54833:
		mov	[bx], eax

loc_54836:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Math_NormalizeAngle180_547EF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE (2026-09-24). Ex-'Math_Sin' : NOM INVERSE, c'est un COSINUS.
; Math_NormalizeAngle180_547EF(angle 24.8 en degres) puis Math_CosRaw_580A7 ; resultat 24.8
; dans *arg_0.
; ==============================================================================================
Math_CosDeg_5483F	proc far		; CODE XREF: AI_ManeuverSolution_Major+214P
					; AI_VisibilityTest+1F5P ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	[bp+arg_4]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_NormalizeAngle180_547EF
		add	sp, 6
		push	large [bp+var_8]
		call	Math_CosRaw_580A7
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
Math_CosDeg_5483F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE (2026-09-24). Ex-'Math_Cos' : NOM INVERSE, c'est un SINUS.
; Math_NormalizeAngle180_547EF(angle 24.8 en degres) puis Math_SinRaw_58063 ; resultat 24.8
; dans *arg_0.
; ==============================================================================================
Math_SinDeg_54876	proc far		; CODE XREF: seg002:0F18P seg003:0CD3P ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	[bp+arg_4]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_NormalizeAngle180_547EF
		add	sp, 6
		push	large [bp+var_8]
		call	Math_SinRaw_58063
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
Math_SinDeg_54876	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, normalise l'angle, gère le cas singulier ±90° (0x5A00) en retournant ±dword_707BE
; (sentinelle "infini"), sinon appelle sub_580ED (tangente fixe).
; ==============================================================================================
Math_Tan_548AD	proc far		; CODE XREF: Physics_AllocGroundConstraintVector+A9P
					; HUDSymbol_ConstructAndInitAngle_80701+1C1P ...

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
		push	[bp+arg_4]
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr Math_NormalizeAngle180_547EF
		add	sp, 6
		mov	[bp+var_8], 0
		mov	eax, [bp+var_4]

loc_548CE:
		or	eax, eax
		jge	short loc_548D6

loc_548D3:
		neg	eax

loc_548D6:				; CODE XREF: Math_Tan_548AD+24j
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax

loc_548E2:
		cmp	[bp+var_10], 5A00h
		jnz	short loc_548F1

loc_548EC:
		mov	ax, 1

loc_548EF:
		jmp	short loc_548F3
; ���������������������������������������������������������������������������

loc_548F1:				; CODE XREF: Math_Tan_548AD+3Dj
		xor	ax, ax

loc_548F3:				; CODE XREF: Math_Tan_548AD:loc_548EFj
		or	al, al
		jz	short loc_54918
		cmp	[bp+var_4], 0
		jle	short loc_54903
		mov	ax, 1
		jmp	short loc_54905
; ���������������������������������������������������������������������������

loc_54903:				; CODE XREF: Math_Tan_548AD+4Fj
		xor	ax, ax

loc_54905:				; CODE XREF: Math_Tan_548AD+54j
		or	al, al
		jz	short loc_5490F
		mov	eax, dword_707BE
		jmp	short loc_54928
; ���������������������������������������������������������������������������

loc_5490F:				; CODE XREF: Math_Tan_548AD+5Aj
		mov	eax, dword_707BE
		neg	eax
		jmp	short loc_54928
; ���������������������������������������������������������������������������

loc_54918:				; CODE XREF: Math_Tan_548AD+48j
		push	large [bp+var_4]
		call	Math_Tan_Raw_580ED
		push	dx
		push	ax
		pop	eax
		add	sp, 4

loc_54928:				; CODE XREF: Math_Tan_548AD+60j
					; Math_Tan_548AD+69j
		mov	[bp+var_8], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_8]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
Math_Tan_548AD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE (2026-09-24). Ex-'Math_ArcSin' : NOM INVERSE, ARC COSINUS. Si |x| <= 1.0 :
; Math_AcosRaw_581E3(x), sinon 0. Resultat en degres 24.8 dans *arg_0.
; ==============================================================================================
Math_AcosDeg_5493E	proc far		; CODE XREF: AI_GuidanceSolution_Major+2EFP
					; seg015:042BP	...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp

loc_5493F:
		mov	bp, sp

loc_54941:
		sub	sp, 0Ch
		push	si
		push	di

loc_54946:
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		mov	di, si
		mov	eax, [di]
		or	eax, eax
		jge	short loc_5495E
		neg	eax

loc_5495E:				; CODE XREF: Math_AcosDeg_5493E+1Bj
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 100h
		jg	short loc_54979
		mov	ax, 1
		jmp	short loc_5497B
; ���������������������������������������������������������������������������

loc_54979:				; CODE XREF: Math_AcosDeg_5493E+34j
		xor	ax, ax

loc_5497B:				; CODE XREF: Math_AcosDeg_5493E+39j
		or	al, al
		jz	short loc_54992
		push	large dword ptr	[si]
		call	Math_AcosRaw_581E3
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax

loc_54992:				; CODE XREF: Math_AcosDeg_5493E+3Fj
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_AcosDeg_5493E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE (2026-09-24). Ex-'Math_ArcCos' : NOM INVERSE, ARC SINUS. Si |x| <= 1.0 :
; Math_AsinRaw_581A0(x), sinon 0. Resultat en degres 24.8 dans *arg_0.
; ==============================================================================================
Math_AsinDeg_549A6	proc far		; CODE XREF: AI_ComputeBearingToRef+64P
					; Math_AsinOfRatio_54A76+46p

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
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		mov	di, si
		mov	eax, [di]
		or	eax, eax
		jge	short loc_549C6
		neg	eax

loc_549C6:				; CODE XREF: Math_AsinDeg_549A6+1Bj
		mov	[bp+var_8], eax

loc_549CA:
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax

loc_549D2:
		cmp	[bp+var_C], 100h
		jg	short loc_549E1
		mov	ax, 1
		jmp	short loc_549E3
; ���������������������������������������������������������������������������

loc_549E1:				; CODE XREF: Math_AsinDeg_549A6+34j
		xor	ax, ax

loc_549E3:				; CODE XREF: Math_AsinDeg_549A6+39j
		or	al, al
		jz	short loc_549FA
		push	large dword ptr	[si]
		call	Math_AsinRaw_581A0
		push	dx
		push	ax
		pop	eax

loc_549F3:
		add	sp, 4
		mov	[bp+var_4], eax

loc_549FA:				; CODE XREF: Math_AsinDeg_549A6+3Fj
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]

loc_54A01:
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_AsinDeg_549A6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE (2026-09-24). Ex-'Math_ArcSinOfRatio' : NOM INVERSE. Si den != 0 :
; Math_AcosDeg_5493E(num/den) (arc COSINUS), sinon 0.
; ==============================================================================================
Math_AcosOfRatio_54A0E	proc far		; CODE XREF: seg030:18C0P
					; Render_PolygonProjectVertices:loc_2FDCFP	...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
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
		cmp	dword ptr [si],	0
		jz	short loc_54A62
		mov	eax, [di]
		mov	edx, eax
		mov	ecx, [si]
		sar	edx, 18h

loc_54A37:
		shl	eax, 8

loc_54A3B:
		idiv	ecx
		mov	[bp+var_8], eax

loc_54A42:
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]
		push	ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		push	cs
		call	near ptr Math_AcosDeg_5493E
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax

loc_54A62:				; CODE XREF: Math_AcosOfRatio_54A0E+1Aj
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_AcosOfRatio_54A0E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE (2026-09-24). Ex-'Math_ArcCosOfRatio' : NOM INVERSE. Si den != 0 :
; Math_AsinDeg_549A6(num/den) (arc SINUS), sinon 0.
; ==============================================================================================
Math_AsinOfRatio_54A76	proc far		; CODE XREF: Guidance_HomingVelocityUpdate+6D9P
					; Guidance_HomingVelocityUpdate+765P ...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
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
		cmp	dword ptr [si],	0
		jz	short loc_54ACA
		mov	eax, [di]
		mov	edx, eax
		mov	ecx, [si]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]
		push	ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		push	cs
		call	near ptr Math_AsinDeg_549A6
		add	sp, 6

loc_54AC2:
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax

loc_54ACA:				; CODE XREF: Math_AsinOfRatio_54A76+1Aj
		mov	bx, [bp+arg_0]

loc_54ACD:
		mov	eax, [bp+var_4]
		mov	[bx], eax

loc_54AD4:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Math_AsinOfRatio_54A76	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, arc tangente fixe (délègue à sub_58223).
; ==============================================================================================
Math_ArcTan_54ADE	proc far		; CODE XREF: AI_IncomingThreatWarning+25AP
					; AI_ManeuverSolution_Major+59FP ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		push	large dword ptr	[si]
		call	Math_ArcTan_Raw_58223
		push	dx
		push	ax
		pop	eax

loc_54AF4:
		add	sp, 4
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Math_ArcTan_54ADE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, arc tangente à deux arguments (dy/dx, delègue à sub_58223) — référencée deux fois par
; sub_4F95.
; ==============================================================================================
Math_ArcTan2_54B0A	proc far		; CODE XREF: Angle_DeltaNormalized_A+30P Angle_DeltaNormalized_A+8CP ...

var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
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
		jz	short loc_54B27

loc_54B22:
		mov	ax, 0FFA6h

loc_54B25:
		jmp	short loc_54B2A
; ���������������������������������������������������������������������������

loc_54B27:				; CODE XREF: Math_ArcTan2_54B0A+16j
		mov	ax, 5Ah	; 'Z'

loc_54B2A:				; CODE XREF: Math_ArcTan2_54B0A:loc_54B25j
		mov	[bp+var_6], ax

loc_54B2D:
		movsx	eax, [bp+var_6]

loc_54B32:
		shl	eax, 8

loc_54B36:
		mov	[bp+var_4], eax
		mov	eax, [si]

loc_54B3D:
		sar	eax, 10h

loc_54B41:
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		mov	eax, [di]
		sar	eax, 10h
		mov	[bp+var_16], eax
		mov	[bp+var_12], eax
		cmp	[bp+var_A], 0FFFFFFFFh
		jnz	short loc_54B67
		mov	[bp+var_A], 0

loc_54B67:				; CODE XREF: Math_ArcTan2_54B0A+53j
		cmp	[bp+var_12], 0FFFFFFFFh
		jnz	short loc_54B76
		mov	[bp+var_12], 0

loc_54B76:				; CODE XREF: Math_ArcTan2_54B0A+62j
		cmp	[bp+var_A], 0
		jz	short loc_54B82
		mov	ax, 1
		jmp	short loc_54B84
; ���������������������������������������������������������������������������

loc_54B82:				; CODE XREF: Math_ArcTan2_54B0A+71j
		xor	ax, ax

loc_54B84:				; CODE XREF: Math_ArcTan2_54B0A+76j
		or	al, al
		jz	short loc_54B9A
		cmp	[bp+var_12], 0
		jnz	short loc_54B94
		mov	ax, 1
		jmp	short loc_54B96
; ���������������������������������������������������������������������������

loc_54B94:				; CODE XREF: Math_ArcTan2_54B0A+83j
		xor	ax, ax

loc_54B96:				; CODE XREF: Math_ArcTan2_54B0A+88j
		or	al, al
		jnz	short loc_54BDD

loc_54B9A:				; CODE XREF: Math_ArcTan2_54B0A+7Cj
		cmp	dword ptr [di],	0
		jz	short loc_54BA5
		mov	ax, 1
		jmp	short loc_54BA7
; ���������������������������������������������������������������������������

loc_54BA5:				; CODE XREF: Math_ArcTan2_54B0A+94j
		xor	ax, ax

loc_54BA7:				; CODE XREF: Math_ArcTan2_54B0A+99j
		or	al, al
		jz	short loc_54BDD
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
		call	Math_ArcTan_Raw_58223
		push	dx

loc_54BD3:
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax

loc_54BDD:				; CODE XREF: Math_ArcTan2_54B0A+8Ej
					; Math_ArcTan2_54B0A+9Fj
		mov	bx, [bp+arg_0]

loc_54BE0:
		mov	eax, [bp+var_4]
		mov	[bx], eax

loc_54BE7:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si

locret_54BEF:
		leave
		retf
Math_ArcTan2_54B0A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, racine carrée fixe (délègue à sub_582EE), retourne une constante (0xB505 ≈ √2·0x8000
; mise à l'échelle) si l'entrée est négative. Référencée par AI_ManeuverSolution_Major_6977 et
; AI_CombatDecision_Major_75F8.
; ==============================================================================================
Math_Sqrt_54BF1	proc far		; CODE XREF: AI_ManeuverSolution_Major+15CP
					; AI_CombatDecision_Major+171P ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_54BF4:
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		cmp	dword ptr [si],	0
		jge	short loc_54C13
		mov	[bp+var_4], 0B505h
		jmp	short loc_54C26
; ���������������������������������������������������������������������������

loc_54C13:				; CODE XREF: Math_Sqrt_54BF1+16j
		push	large dword ptr	[si]
		call	Math_Sqrt_Raw_582EE
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_4], eax

loc_54C26:				; CODE XREF: Math_Sqrt_54BF1+20j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]

loc_54C2D:
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Math_Sqrt_54BF1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, carré fixe (24.8) : x*x avec décalage 8 bits (imul+shrd). Référencée deux fois par
; AI_ManeuverSolution_Major_6977.
; ==============================================================================================
Math_Square_54C39	proc far		; CODE XREF: AI_ManeuverSolution_Major+12AP
					; AI_ManeuverSolution_Major+13BP ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di

loc_54C41:
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
Math_Square_54C39	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enveloppe fine de sub_5828E (longueur de vecteur 3D). Référencée par seg020/seg021
; (cadrage de vue carte/radar).
; ==============================================================================================
Math_VectorLength_Wrapper_54C77	proc far		; CODE XREF: seg020:06AAP seg021:0CD6P

var_4		= dword	ptr -4
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
		push	large dword ptr	[bx]
		push	large dword ptr	[di]
		push	large dword ptr	[si]
		call	Math_VectorLength3D_Raw_5828E
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
Math_VectorLength_Wrapper_54C77	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [si+1]
		push	371Ah
		call	CRT_Msg_NullPtrAssign
		add	sp, 4
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 170 lignes, NON DÉTAILLÉE — alloue (sub_658), appelle sub_3FD/sub_2945 (formatage
; ?), référencée depuis seg024 (framework UI) et sub_509EE (UIScreen_RenderGraphVGA, seg113) —
; probable construction de texte/étiquette formaté pour affichage.
; ==============================================================================================
UIScreen_BuildFormattedText_54CC9	proc far		; CODE XREF: seg024:00E7P seg024:03B2P ...

var_14		= word ptr -14h
var_12		= word ptr -12h
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
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
		jnz	short loc_54CE9
		push	14h
		call	CRT_Malloc16_Retry
		pop	cx

loc_54CE0:
		mov	si, ax
		or	ax, ax
		jnz	short loc_54CE9
		jmp	loc_54DEE
; ���������������������������������������������������������������������������

loc_54CE9:				; CODE XREF: UIScreen_BuildFormattedText_54CC9+Dj
					; UIScreen_BuildFormattedText_54CC9+1Bj
		mov	di, si
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx],	0
		jl	short loc_54D04
		mov	eax, [bx]
		sar	eax, 8
		mov	[bp+var_4], eax
		mov	eax, [bx]
		jmp	short loc_54D30
; ���������������������������������������������������������������������������

loc_54D04:				; CODE XREF: UIScreen_BuildFormattedText_54CC9+29j
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		neg	eax
		sar	eax, 8
		mov	[bp+var_4], eax
		neg	eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_54D27

loc_54D23:
		mov	byte ptr [di], 2Dh ; '-'
		inc	di

loc_54D27:				; CODE XREF: UIScreen_BuildFormattedText_54CC9+58j
		mov	bx, [bp+arg_2]

loc_54D2A:
		mov	eax, [bx]
		neg	eax

loc_54D30:				; CODE XREF: UIScreen_BuildFormattedText_54CC9+39j
		and	eax, 0FFh
		mov	[bp+var_8], eax
		lea	ax, [bp+var_12]
		push	ss
		push	ax
		push	ds
		push	offset unk_707C2
		mov	cx, 8
		call	CRT_Fmemcpy
		cmp	[bp+arg_4], 3
		jle	short loc_54D56
		mov	[bp+arg_4], 3

loc_54D56:				; CODE XREF: UIScreen_BuildFormattedText_54CC9+86j
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
		jmp	short loc_54D91
; ���������������������������������������������������������������������������

loc_54D8E:				; CODE XREF: UIScreen_BuildFormattedText_54CC9+DDj
		dec	[bp+var_14]

loc_54D91:				; CODE XREF: UIScreen_BuildFormattedText_54CC9+C3j
		cmp	[bp+var_14], 0
		jle	short loc_54DA8
		mov	bx, dx
		inc	dx
		shl	bx, 1
		lea	ax, [bp+var_12]
		add	bx, ax
		mov	ax, [bx]
		cmp	ax, [bp+var_A]
		jle	short loc_54D8E

loc_54DA8:				; CODE XREF: UIScreen_BuildFormattedText_54CC9+CCj
		push	large [bp+var_4]
		push	371Dh
		push	di
		call	CRT_Msg_Sprintf1
		add	sp, 8
		cmp	[bp+arg_4], 0
		jz	short loc_54DEE
		jmp	short loc_54DC1
; ���������������������������������������������������������������������������

loc_54DC0:				; CODE XREF: UIScreen_BuildFormattedText_54CC9+FBj
		inc	di

loc_54DC1:				; CODE XREF: UIScreen_BuildFormattedText_54CC9+F5j
		cmp	byte ptr [di], 0
		jnz	short loc_54DC0

loc_54DC6:
		mov	byte ptr [di], 2Eh ; '.'

loc_54DC9:
		mov	dx, 1
		jmp	short loc_54DD4
; ���������������������������������������������������������������������������

loc_54DCE:				; CODE XREF: UIScreen_BuildFormattedText_54CC9+10Ej
		mov	bx, dx
		mov	byte ptr [bx+di], 30h ;	'0'
		inc	dx

loc_54DD4:				; CODE XREF: UIScreen_BuildFormattedText_54CC9+103j
		cmp	dx, [bp+var_14]
		jle	short loc_54DCE
		push	[bp+var_A]
		push	3721h
		mov	ax, di

loc_54DE1:
		add	ax, [bp+var_14]
		inc	ax
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6

loc_54DEE:				; CODE XREF: UIScreen_BuildFormattedText_54CC9+1Dj
					; UIScreen_BuildFormattedText_54CC9+F3j
		mov	ax, si
		pop	di
		pop	si
		leave

locret_54DF3:
		retf
UIScreen_BuildFormattedText_54CC9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, multiplie une valeur par un nombre pseudo-aléatoire (sub_70D) mis à l'échelle (÷0x8000)
; — magnitude aléatoire. Référencée deux fois par AI_ManeuverSolution_Major_6977.
; ==============================================================================================
Math_RandomScale_54DF4	proc far		; CODE XREF: AI_ManeuverSolution_Major+16BP
					; AI_ManeuverSolution_Major+174P ...

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
Math_RandomScale_54DF4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante de Math_RandomScale centrée : retourne une valeur aléatoire dans [-x,+x].
; Référencée par sub_3844F.
; ==============================================================================================
Math_RandomJitter_54E1C	proc far		; CODE XREF: Debris_SpawnAtAttachPoint+BAP
					; Debris_SpawnAtAttachPoint+D9P ...

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_2], ax
		mov	dx, [bp+var_2]
		shl	dx, 1

loc_54E2A:
		mov	[bp+var_4], dx

loc_54E2D:
		call	CRT_Rand

loc_54E32:
		movsx	eax, ax

loc_54E36:
		movsx	edx, [bp+var_4]
		imul	eax, edx

loc_54E3F:
		mov	ebx, 8000h
		cdq
		idiv	ebx
		sub	ax, [bp+var_2]
		leave
		retf
Math_RandomJitter_54E1C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, test de probabilité pseudo-aléatoire (échelle ~100) — retourne vrai/faux. Référencée
; par sub_4D04E et ChaseCamera_RenderEffect_4D1C9 (spawn probabiliste d'effet).
; ==============================================================================================
Math_RandomChance_54E4F	proc far		; CODE XREF: Particle_SpawnWithColor+132P
					; Elements_SpawnAlongSegment_4D1C9+310P ...

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_2], ax
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 64h
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp+var_4], ax
		mov	dx, [bp+var_4]
		cmp	dx, [bp+var_2]
		jge	short loc_54E7F
		mov	al, 1
		jmp	short locret_54E81
; ���������������������������������������������������������������������������

loc_54E7F:				; CODE XREF: Math_RandomChance_54E4F+2Aj
		mov	al, 0

locret_54E81:				; CODE XREF: Math_RandomChance_54E4F+2Ej
		leave
		retf
Math_RandomChance_54E4F	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), initialise les constantes globales du module
; trigonométrique (dword_707B2/B6/BA/BE, dont la sentinelle "infini" 0x7FFFFF00 utilisée par
; Math_Tan_548AD).
; ==============================================================================================
Math_InitConstants_54E83:				; DATA XREF: seg339:off_71F14o
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	dword ptr [bp-4], 394Bh
		mov	eax, [bp-4]
		mov	dword_707B2, eax
		mov	dword ptr [bp-8], 4
		mov	eax, [bp-8]
		mov	dword_707B6, eax
		mov	dword ptr [bp-0Ch], 1
		mov	eax, [bp-0Ch]
		mov	dword_707BA, eax

loc_54EB9:
		mov	dword_707BE, 7FFFFF00h
		leave
		retf
seg115		ends
