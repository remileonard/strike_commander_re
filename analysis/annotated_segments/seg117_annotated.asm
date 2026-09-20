seg117		segment	byte public 'CODE' use16
		assume cs:seg117
		;org 6
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
		enter	0, 0
		mov	eax, [bp+6]
		cdq
		shld	edx, eax, 8
		shl	eax, 8
		idiv	dword ptr [bp+0Ah]
		shld	edx, eax, 10h
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, multiplication en virgule fixe 24.8 (imul + shrd/shld). Référencée depuis seg020
; (défilement/cadrage de vue).
; ==============================================================================================
Math_FixedMultiply_58034	proc far		; CODE XREF: seg020:0A50P seg020:0A7CP ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		enter	0, 0
		mov	eax, [bp+arg_0]
		imul	[bp+arg_4]
		shrd	eax, edx, 8
		shld	edx, eax, 10h
		leave
		retf
Math_FixedMultiply_58034	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, "MulDiv" en virgule fixe (a*b/c). Référencée par Radar_Project3DToScreen (sub_16988).
; ==============================================================================================
Math_FixedMulDiv_5804C	proc far		; CODE XREF: Radar_Project3DToScreen+FBP
					; Radar_Project3DToScreen+130P ...

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
Math_FixedMulDiv_5804C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, cosinus en virgule fixe (implémentation brute, sans normalisation d'angle — appelée par
; Math_Cos_54876).
; ==============================================================================================
Math_Cos_Raw_58063	proc far		; CODE XREF: seg020:0A10P
					; Camera_ComputeMountedPosition_3D31D+192P ...

arg_0		= dword	ptr  6

		enter	0, 0
		xor	cx, cx
		mov	ebx, [bp+arg_0]
		sar	ebx, 6
		jns	short loc_58077
		add	bx, 5A0h

loc_58077:				; CODE XREF: Math_Cos_Raw_58063+Ej
		mov	ax, 168h
		sub	bx, ax
		jl	short loc_5808B
		sub	bx, ax
		jge	short loc_58086
		add	bx, ax
		jmp	short loc_5808D
; ���������������������������������������������������������������������������

loc_58086:				; CODE XREF: Math_Cos_Raw_58063+1Dj
		inc	cx
		sub	bx, ax
		jge	short loc_5808D

loc_5808B:				; CODE XREF: Math_Cos_Raw_58063+19j
		neg	bx

loc_5808D:				; CODE XREF: Math_Cos_Raw_58063+21j
					; Math_Cos_Raw_58063+26j
		mov	ax, 100h
		or	bx, bx
		jz	short loc_5809E
		mov	ax, seg	seg213
		mov	es, ax
		assume es:seg213
		xor	ax, ax
		mov	al, es:[bx]

loc_5809E:				; CODE XREF: Math_Cos_Raw_58063+2Fj
		or	cx, cx
		jz	short loc_580A4
		neg	ax

loc_580A4:				; CODE XREF: Math_Cos_Raw_58063+3Dj
		cwd
		leave
		retf
Math_Cos_Raw_58063	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, sinus en virgule fixe (implémentation brute — appelée par Math_Sin_5483F).
; ==============================================================================================
Math_Sin_Raw_580A7	proc far		; CODE XREF: seg020:0A24P
					; Camera_ComputeMountedPosition_3D31D+1A6P ...

arg_0		= dword	ptr  6

		enter	0, 0
		xor	cx, cx
		mov	ebx, [bp+arg_0]
		sar	ebx, 6
		jns	short loc_580B9
		neg	bx

loc_580B9:				; CODE XREF: Math_Sin_Raw_580A7+Ej
		cmp	bx, 168h
		jb	short loc_580D3
		inc	cx
		sub	bx, 2D0h
		jl	short loc_580D1
		cmp	bx, 168h
		jl	short loc_580D3
		dec	cx
		sub	bx, 2D0h

loc_580D1:				; CODE XREF: Math_Sin_Raw_580A7+1Dj
		neg	bx

loc_580D3:				; CODE XREF: Math_Sin_Raw_580A7+16j
					; Math_Sin_Raw_580A7+23j
		mov	ax, 100h
		or	bx, bx
		jz	short loc_580E4
		mov	ax, seg	seg213
		mov	es, ax
		xor	ax, ax
		mov	al, es:[bx]

loc_580E4:				; CODE XREF: Math_Sin_Raw_580A7+31j
		or	cx, cx
		jz	short loc_580EA
		neg	ax

loc_580EA:				; CODE XREF: Math_Sin_Raw_580A7+3Fj
		cwd
		leave
		retf
Math_Sin_Raw_580A7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, tangente en virgule fixe (implémentation brute — appelée par Math_Tan_548AD).
; ==============================================================================================
Math_Tan_Raw_580ED	proc far		; CODE XREF: Math_Tan_548AD+6FP

arg_0		= dword	ptr  6

		enter	0, 0
		mov	ebx, [bp+arg_0]
		sar	ebx, 6
		xor	cx, cx
		or	ebx, ebx
		jns	short loc_58104
		add	bx, 5A0h

loc_58104:				; CODE XREF: Math_Tan_Raw_580ED+11j
		cmp	bx, 168h
		jb	short loc_58129
		sub	bx, 2D0h
		jl	short loc_5811A
		cmp	bx, 168h
		jb	short loc_58129
		sub	bx, 2D0h

loc_5811A:				; CODE XREF: Math_Tan_Raw_580ED+21j
		neg	bx
		inc	cx
		cmp	bx, 167h
		mov	eax, 7FFFFFFFh
		jz	short loc_58137

loc_58129:				; CODE XREF: Math_Tan_Raw_580ED+1Bj
					; Math_Tan_Raw_580ED+27j
		mov	ax, seg	seg213
		mov	es, ax
		shl	bx, 1
		movzx	eax, word ptr es:[bx+36Bh]

loc_58137:				; CODE XREF: Math_Tan_Raw_580ED+3Aj
		or	cx, cx
		jz	short loc_5813E
		neg	eax

loc_5813E:				; CODE XREF: Math_Tan_Raw_580ED+4Cj
		shld	edx, eax, 10h
		leave
		retf
Math_Tan_Raw_580ED	endp

; ���������������������������������������������������������������������������
		enter	0, 0
		push	si
		push	di
		mov	ebx, [bp+6]
		sar	ebx, 6
		xor	cx, cx
		sub	bx, 168h
		jl	short loc_5816E
		sub	bx, 168h
		jl	short loc_58167
		sub	bx, 168h
		jl	short loc_5816E

loc_58167:				; CODE XREF: seg117:014Fj
		inc	cx
		add	bx, 168h
		neg	bx

loc_5816E:				; CODE XREF: seg117:0149j seg117:0155j
		neg	bx
		mov	si, bx
		mov	di, 168h
		sub	di, si
		mov	ax, seg	seg213
		mov	es, ax
		xor	edx, edx
		movzx	eax, word ptr es:[si]
		shl	eax, 8
		movzx	ebx, word ptr es:[di]
		idiv	ebx
		or	cx, cx
		jz	short loc_58197
		neg	eax

loc_58197:				; CODE XREF: seg117:0182j
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, arc cosinus en virgule fixe (implémentation brute — appelée par Math_ArcCos_549A6).
; ==============================================================================================
Math_ArcCos_Raw_581A0	proc far		; CODE XREF: Math_ArcCos_549A6+44P

arg_0		= dword	ptr  6

		enter	0, 0
		mov	ebx, [bp+arg_0]
		or	ebx, ebx
		sets	cl
		jns	short loc_581B3
		neg	ebx

loc_581B3:				; CODE XREF: Math_ArcCos_Raw_581A0+Ej
		cmp	ebx, 100h
		ja	short loc_581DC
		shl	bx, 1
		mov	ax, seg	seg213
		mov	es, ax
		add	bx, 169h
		movzx	eax, word ptr es:[bx]
		neg	eax
		add	eax, 5A00h
		or	cl, cl
		jz	short loc_581DC
		neg	eax

loc_581DC:				; CODE XREF: Math_ArcCos_Raw_581A0+1Aj
					; Math_ArcCos_Raw_581A0+37j
		shld	edx, eax, 10h
		leave
		retf
Math_ArcCos_Raw_581A0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, arc sinus en virgule fixe (implémentation brute — appelée par Math_ArcSin_5493E).
; ==============================================================================================
Math_ArcSin_Raw_581E3	proc far		; CODE XREF: Math_ArcSin_5493E+44P

arg_0		= dword	ptr  6

		enter	0, 0
		mov	ebx, [bp+arg_0]
		or	ebx, ebx
		sets	cl
		jns	short loc_581F6
		neg	ebx

loc_581F6:				; CODE XREF: Math_ArcSin_Raw_581E3+Ej
		cmp	ebx, 100h
		ja	short loc_5821C
		shl	bx, 1
		mov	ax, seg	seg213
		mov	es, ax
		add	bx, 169h
		movzx	eax, word ptr es:[bx]
		or	cl, cl
		jz	short loc_5821C
		neg	eax
		add	eax, 0B400h

loc_5821C:				; CODE XREF: Math_ArcSin_Raw_581E3+1Aj
					; Math_ArcSin_Raw_581E3+2Ej
		shld	edx, eax, 10h
		leave
		retf
Math_ArcSin_Raw_581E3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, arc tangente en virgule fixe (implémentation brute — appelée par Math_ArcTan_54ADE et
; Math_ArcTan2_54B0A).
; ==============================================================================================
Math_ArcTan_Raw_58223	proc far		; CODE XREF: Math_ArcTan_54ADE+DP
					; Math_ArcTan2_54B0A+C3P

arg_0		= dword	ptr  6

		enter	0, 0
		push	di
		push	si
		mov	ax, seg	seg213
		mov	es, ax
		xor	cx, cx
		mov	eax, [bp+arg_0]
		or	eax, eax
		jns	short loc_5823D
		neg	eax
		inc	cx

loc_5823D:				; CODE XREF: Math_ArcTan_Raw_58223+14j
		mov	bx, 2D0h
		cmp	eax, 10000h
		jge	short loc_58275
		xor	si, si
		jmp	short loc_5826C
; ���������������������������������������������������������������������������

loc_5824C:				; CODE XREF: Math_ArcTan_Raw_58223+45j
					; Math_ArcTan_Raw_58223+50j
		mov	bx, di
		sub	bx, si
		shr	bx, 1
		and	bx, 0FFFEh
		add	bx, si
		cmp	es:[bx+36Bh], ax
		jz	short loc_58275
		ja	short loc_5826C
		mov	si, bx
		add	si, 2
		cmp	si, di
		jl	short loc_5824C
		jmp	short loc_58275
; ���������������������������������������������������������������������������

loc_5826C:				; CODE XREF: Math_ArcTan_Raw_58223+27j
					; Math_ArcTan_Raw_58223+3Cj
		mov	di, bx
		sub	di, 2
		cmp	si, di
		jl	short loc_5824C

loc_58275:				; CODE XREF: Math_ArcTan_Raw_58223+23j
					; Math_ArcTan_Raw_58223+3Aj ...
		shr	bx, 1
		or	cx, cx
		jz	short loc_5827D
		neg	bx

loc_5827D:				; CODE XREF: Math_ArcTan_Raw_58223+56j
		movsx	eax, bx
		shl	eax, 6
		shld	edx, eax, 10h
		pop	si
		pop	di
		leave
		retf
Math_ArcTan_Raw_58223	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, longueur de vecteur 3D en virgule fixe (implémentation brute, sans mise à l'échelle
; anti-débordement) — utilisée très largement dans tout le moteur (IA, HUD, caméra, armement).
; ==============================================================================================
Math_VectorLength3D_Raw_5828E	proc far		; CODE XREF: AI_ProximityGeometricWarning_315B+150P
					; Targeting_AcquireBestThreat+3B3P ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		enter	0, 0
		mov	eax, [bp+arg_0]
		mov	ebx, [bp+arg_4]
		mov	ecx, [bp+arg_8]
		or	eax, eax
		jns	short loc_582A6
		neg	eax

loc_582A6:				; CODE XREF: Math_VectorLength3D_Raw_5828E+13j
		or	ebx, ebx
		jns	short loc_582AE
		neg	ebx

loc_582AE:				; CODE XREF: Math_VectorLength3D_Raw_5828E+1Bj
		or	ecx, ecx
		jns	short loc_582B6
		neg	ecx

loc_582B6:				; CODE XREF: Math_VectorLength3D_Raw_5828E+23j
		cmp	eax, ebx
		jnb	short loc_582BD
		xchg	eax, ebx

loc_582BD:				; CODE XREF: Math_VectorLength3D_Raw_5828E+2Bj
		cmp	eax, ecx
		jnb	short loc_582C4
		xchg	eax, ecx

loc_582C4:				; CODE XREF: Math_VectorLength3D_Raw_5828E+32j
		cmp	ebx, ecx
		jnb	short loc_582CC
		xchg	ebx, ecx

loc_582CC:				; CODE XREF: Math_VectorLength3D_Raw_5828E+39j
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
Math_VectorLength3D_Raw_5828E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, racine carrée en virgule fixe (implémentation brute — appelée par Math_Sqrt_54BF1).
; ==============================================================================================
Math_Sqrt_Raw_582EE	proc far		; CODE XREF: Math_Sqrt_54BF1+25P

arg_0		= dword	ptr  6

		enter	0, 0
		push	si
		push	di
		xor	eax, eax
		mov	esi, [bp+arg_0]
		or	esi, esi
		js	short loc_5833B
		shld	ebx, esi, 8
		shl	esi, 8
		xor	edx, edx
		mov	cx, 14h
		jmp	short loc_58314
; ���������������������������������������������������������������������������

loc_58311:				; CODE XREF: Math_Sqrt_Raw_582EE+43j
		dec	cx
		jz	short loc_5833B

loc_58314:				; CODE XREF: Math_Sqrt_Raw_582EE+21j
					; Math_Sqrt_Raw_582EE+4Bj
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
		ja	short loc_58311
		sub	edx, edi
		inc	eax
		dec	cx
		jnz	short loc_58314

loc_5833B:				; CODE XREF: Math_Sqrt_Raw_582EE+10j
					; Math_Sqrt_Raw_582EE+24j
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
Math_Sqrt_Raw_582EE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, calcule simultanément sinus et cosinus d'un même angle (Math_Cos_Raw_58063 +
; Math_Sin_Raw_580A7). Référencée par sub_1B23F.
; ==============================================================================================
Math_ComputeSinCosPair_58344	proc far		; CODE XREF: UI_ComputeScaledRect+65P
					; UI_ComputeScaledRect+72P

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
		call	near ptr Math_Cos_Raw_58063
		mov	[bp+var_2], ax
		push	cs
		call	near ptr Math_Sin_Raw_580A7
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
		mov	[si+2],	ax
		pop	si
		leave
		retf
Math_ComputeSinCosPair_58344	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, fonction mathématique sans appel externe (calcul autonome), référencée par seg059 —
; rôle exact non détaillé.
; ==============================================================================================
Math_Helper_583A3	proc far		; CODE XREF: seg059:0162P

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
Math_Helper_583A3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, transformation d'un vecteur 3D par une matrice 3×3 (9 multiplications-accumulations en
; virgule fixe) — implémentation du produit matrice×vecteur utilisé par le cluster de rotation
; (seg116). Référencée par Damage_ComputeHelperB_564CE.
; ==============================================================================================
Math_VectorTransformByMatrix3x3_58476	proc far		; CODE XREF: Damage_ComputeHelperB_564CE+10P

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
Math_VectorTransformByMatrix3x3_58476	endp

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
; far, référencée par sub_5ECE et seg014 (UI cockpit) — utilisée par
; WorldObject_ApplyOrientationVariantA_5776A.
; ==============================================================================================
Math_ApplyRotationHelperA_58768	proc far		; CODE XREF: AI_ComputeBearingToRef+39P seg014:0134P ...

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
Math_ApplyRotationHelperA_58768	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée par sub_5392 — utilisée par WorldObject_ApplyOrientationVariantB_5779A.
; ==============================================================================================
Math_ApplyRotationHelperB_58828	proc far		; CODE XREF: AI_IncomingThreatWarning+187P
					; AI_Sensor_WeaponVelocityCache+113P ...

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

loc_588DE:
		mov	[si+8],	eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Math_ApplyRotationHelperB_58828	endp

seg117		ends
