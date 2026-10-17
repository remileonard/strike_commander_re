seg044		segment	byte public 'CODE' use16
		assume cs:seg044
		;org 0Fh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1D67F	proc far		; CODE XREF: sub_1D687+9p sub_1D6E3+Ap

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1D67F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1D687	proc far		; CODE XREF: sub_1D88F+69p

var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= byte ptr  16h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_1D67F
		add	sp, 2
		mov	al, [bp+arg_10]
		mov	[si], al
		sub	sp, 4
		mov	eax, [bp+arg_C]
		mov	[bp+var_6], eax
		sub	sp, 4
		mov	eax, [bp+arg_8]
		mov	[bp+var_A], eax
		sub	sp, 4
		mov	eax, [bp+arg_4]
		mov	[bp+var_E], eax
		mov	ax, si
		inc	ax
		push	ax
		call	Utility_Helper_246F0
		add	sp, 0Eh
		cmp	[bp+arg_10], 0
		jz	short loc_1D6DA
		mov	ax, si
		inc	ax
		push	ax
		call	sub_24127
		add	sp, 2

loc_1D6DA:				; CODE XREF: sub_1D687+45j
		mov	ax, [bp+arg_2]
		mov	[si+0Dh], ax
		pop	si
		pop	bp
		retf
sub_1D687	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1D6E3	proc far		; CODE XREF: seg044:02F7p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_1D67F
		add	sp, 2
		mov	al, [bp+arg_6]
		mov	[si], al
		mov	di, [bp+arg_4]
		mov	eax, [di]
		mov	[si+1],	eax
		mov	eax, [di+4]
		mov	[si+5],	eax
		mov	eax, [di+8]
		mov	[si+9],	eax
		cmp	[bp+arg_6], 0
		jz	short loc_1D724
		mov	ax, si
		inc	ax
		push	ax
		call	sub_24127
		add	sp, 2

loc_1D724:				; CODE XREF: sub_1D6E3+33j
		mov	ax, [bp+arg_2]
		mov	[si+0Dh], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_1D6E3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à LightSet_Init_2B191
; (sub_2B191 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-14. JEU DE LUMIÈRES — initialisation : +6 = 1, poids ambiant 0,
; intensité 100 %. Appelée par seg112. Ex-'ProgressBar_InitFull'.
; ==============================================================================================
LightSet_Init_1D72E	proc far		; CODE XREF: seg055:0893P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+6], 1
		mov	word ptr [si+7], 0
		push	64h ; 'd'
		push	si
		nop
		push	cs
		call	near ptr LightSet_SetIntensityPercent_1D7CD
		add	sp, 4
		pop	si
		pop	bp
		retf
LightSet_Init_1D72E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1D74C	proc far		; CODE XREF: sub_1D792+15p
					; sub_C39F6+2EP

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_1D77E
; ���������������������������������������������������������������������������

loc_1D75D:				; CODE XREF: sub_1D74C+41j
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		call	sub_308
		add	sp, 2
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_2FE19
		add	sp, 6
		mov	[bp+var_2], 0

loc_1D77E:				; CODE XREF: sub_1D74C+Fj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_1D75D
		pop	si
		leave
		retf
sub_1D74C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1D792	proc far		; CODE XREF: seg055:08DEP
					; DATA XREF: dseg:31A0o

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1D7C9
		mov	word ptr [si], 31A0h
		push	si
		push	cs
		call	near ptr sub_1D74C
		add	sp, 2
		mov	word ptr [si], 2BDh
		push	si
		call	sub_2FEE0
		add	sp, 2
		test	di, 1
		jz	short loc_1D7C9
		push	si
		call	sub_308
		add	sp, 2

loc_1D7C9:				; CODE XREF: sub_1D792+Dj
					; sub_1D792+2Cj
		pop	di
		pop	si
		pop	bp
		retf
sub_1D792	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à LightSet_SetIntensityPercent_2B228 (sub_2B228 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-14. JEU DE LUMIÈRES — intensité globale +9 = pourcentage × 256 ÷ 100, ou 256
; (1,0) au-delà de 100. Ex-'ProgressBar_PercentToFixed'.
; ==============================================================================================
LightSet_SetIntensityPercent_1D7CD	proc far		; CODE XREF: LightSet_Init_1D72E+15p
					; sub_C38C3+75P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		cmp	cx, 64h	; 'd'
		jle	short loc_1D7E3
		mov	word ptr [si+9], 100h
		jmp	short loc_1D7F1
; ���������������������������������������������������������������������������

loc_1D7E3:				; CODE XREF: LightSet_SetIntensityPercent_1D7CD+Dj
		mov	ax, cx
		shl	ax, 8
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	[si+9],	ax

loc_1D7F1:				; CODE XREF: LightSet_SetIntensityPercent_1D7CD+14j
		pop	si
		pop	bp
		retf
LightSet_SetIntensityPercent_1D7CD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1D7F4	proc far		; CODE XREF: sub_C38C3+35P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+7],	ax
		push	si
		nop
		push	cs
		call	near ptr sub_1DA70
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_1D7F4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1D80D	proc far		; CODE XREF: sub_1D88F+7Dp
					; seg044:030Dp

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
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	6
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_1D845
		mov	word ptr [di], 5CEh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 319Ch
		mov	ax, [bp+var_4]
		mov	[di+4],	ax
		mov	ax, di
		jmp	short loc_1D847
; ���������������������������������������������������������������������������

loc_1D845:				; CODE XREF: sub_1D80D+1Fj
		mov	ax, di

loc_1D847:				; CODE XREF: sub_1D80D+36j
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_2FDF4
		add	sp, 4
		push	si
		call	LinkedListB_Helper_2FF4A
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		cmp	eax, 1
		ja	short loc_1D87E
		mov	bx, [bp+arg_2]
		mov	al, [bx]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		or	al, al
		jz	short loc_1D882

loc_1D87E:				; CODE XREF: sub_1D80D+5Fj
		mov	byte ptr [si+6], 0

loc_1D882:				; CODE XREF: sub_1D80D+6Fj
		push	si
		nop
		push	cs
		call	near ptr sub_1DA70
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_1D80D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1D88F	proc far		; CODE XREF: sub_C38C3+DCP

var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_11		= byte ptr -11h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= byte ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	eax, [bp+arg_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_C]
		mov	[bp+var_10], eax
		mov	al, [bp+arg_10]
		mov	[bp+var_11], al
		push	11h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_1D902
		mov	al, [bp+var_11]
		push	ax
		sub	sp, 4
		mov	eax, [bp+var_10]
		mov	[bp+var_1C], eax
		sub	sp, 4
		mov	eax, [bp+var_C]
		mov	[bp+var_20], eax
		sub	sp, 4
		mov	eax, [bp+var_8]
		mov	[bp+var_24], eax
		push	[bp+var_4]
		push	di
		push	cs
		call	near ptr sub_1D687
		add	sp, 12h
		mov	ax, di
		jmp	short loc_1D904
; ���������������������������������������������������������������������������

loc_1D902:				; CODE XREF: sub_1D88F+3Dj
		mov	ax, di

loc_1D904:				; CODE XREF: sub_1D88F+71j
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_1D80D
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_1D88F	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[bp-4],	ax
		mov	di, [bp+0Ah]
		mov	eax, [di]
		mov	[bp-14h], eax
		mov	eax, [di+4]
		mov	[bp-10h], eax
		mov	eax, [di+8]
		mov	[bp-0Ch], eax
		mov	al, [bp+0Ch]
		mov	[bp-5],	al
		push	11h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp-8],	ax
		or	ax, ax
		jz	short loc_1D972
		mov	al, [bp-5]
		push	ax
		lea	ax, [bp-14h]
		push	ax
		push	word ptr [bp-4]
		push	word ptr [bp-8]
		push	cs
		call	near ptr sub_1D6E3
		add	sp, 8
		mov	ax, [bp-8]
		jmp	short loc_1D975
; ���������������������������������������������������������������������������

loc_1D972:				; CODE XREF: seg044:02E6j
		mov	ax, [bp-8]

loc_1D975:				; CODE XREF: seg044:0300j
		mov	[bp-2],	ax
		push	word ptr [bp-2]
		push	si
		push	cs
		call	near ptr sub_1D80D
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		xor	di, di
		jmp	short $+2

loc_1D99B:				; CODE XREF: seg044:0342j
		lea	ax, [bp-2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jz	short loc_1D9B4
		mov	ax, di
		inc	di
		cmp	ax, [bp+8]
		jl	short loc_1D99B

loc_1D9B4:				; CODE XREF: seg044:033Aj
		cmp	word ptr [bp-2], 0
		jz	short loc_1D9DC
		mov	bx, [bp-2]
		mov	ax, [bx+4]
		mov	[bp-4],	ax
		push	0
		push	word ptr [bp-2]
		push	si
		call	LinkedListB_FindAndDispatch_2FE19
		add	sp, 6
		push	word ptr [bp-4]
		call	sub_308
		add	sp, 2

loc_1D9DC:				; CODE XREF: seg044:0348j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	word ptr [bp-2], 0
		jmp	short $+2

loc_1D9F5:				; CODE XREF: seg044:039Cj
		lea	ax, [bp-2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jz	short loc_1DA0E
		mov	bx, [bp-2]
		cmp	[bx+4],	di
		jnz	short loc_1D9F5

loc_1DA0E:				; CODE XREF: seg044:0394j
		cmp	word ptr [bp-2], 0
		jz	short loc_1DA2B
		push	0
		push	word ptr [bp-2]
		push	si
		call	LinkedListB_FindAndDispatch_2FE19
		add	sp, 6
		push	di
		call	sub_308
		add	sp, 2

loc_1DA2B:				; CODE XREF: seg044:03A2j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		xor	di, di
		jmp	short loc_1DA55
; ���������������������������������������������������������������������������

loc_1DA43:				; CODE XREF: seg044:03F4j
		mov	ax, di
		inc	di
		cmp	ax, [bp+8]
		jnz	short loc_1DA55
		mov	bx, [bp-2]
		mov	ax, [bx+4]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1DA55:				; CODE XREF: seg044:03D1j seg044:03D9j
		lea	ax, [bp-2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_1DA43
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1DA70	proc far		; CODE XREF: sub_1D7F4+10p
					; sub_1D80D+78p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	ax, [si+7]
		mov	[bp+var_4], ax
		jmp	short loc_1DA94
; ���������������������������������������������������������������������������

loc_1DA88:				; CODE XREF: sub_1DA70+33j
		mov	bx, [bp+var_2]
		mov	bx, [bx+4]
		mov	ax, [bx+0Dh]
		add	[bp+var_4], ax

loc_1DA94:				; CODE XREF: sub_1DA70+16j
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_1DA88
		cmp	[bp+var_4], 0
		jz	short loc_1DAFC
		jmp	short loc_1DACE
; ���������������������������������������������������������������������������

loc_1DAAD:				; CODE XREF: sub_1DA70+6Dj
		mov	bx, [bp+var_2]
		mov	di, [bx+4]
		movsx	eax, word ptr [di+0Dh]
		movsx	edx, word ptr [si+9]
		imul	eax, edx
		movsx	ebx, [bp+var_4]
		cdq
		idiv	ebx
		mov	[di+0Fh], ax

loc_1DACE:				; CODE XREF: sub_1DA70+3Bj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_1DAAD
		movsx	eax, word ptr [si+7]
		movsx	edx, word ptr [si+9]
		imul	eax, edx
		movsx	ebx, [bp+var_4]
		cdq
		idiv	ebx
		mov	[si+0Bh], ax
		jmp	short loc_1DB1F
; ���������������������������������������������������������������������������

loc_1DAFC:				; CODE XREF: sub_1DA70+39j
		jmp	short loc_1DB09
; ���������������������������������������������������������������������������

loc_1DAFE:				; CODE XREF: sub_1DA70+A8j
		mov	bx, [bp+var_2]
		mov	bx, [bx+4]
		mov	word ptr [bx+0Fh], 0

loc_1DB09:				; CODE XREF: sub_1DA70:loc_1DAFCj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_1DAFE
		mov	word ptr [si+0Bh], 0

loc_1DB1F:				; CODE XREF: sub_1DA70+8Aj
		pop	di
		pop	si
		leave
		retf
sub_1DA70	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; LightSet_FaceIntensity_2B54A (sub_2B54A de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-14, corrigé le même jour.
; INTENSITÉ LUMINEUSE D'UNE FACE (ou d'un sommet) de modèle 3D. Args : (jeu de lumières,
; vecteur A, vecteur B) ; appelée par Mesh_FacePrepareIndirect et les méthodes d'éclairage des
; éléments de face (seg055) avec A = vecteur passé par l'appelant de ces méthodes (origine non
; tracée) et B = normale de la face lue dans les données du modèle. intensité = part ambiante
; (+0Bh) + (si A · B > 0) (A · B) × part de la PREMIÈRE lumière de la liste (+0Fh du 1er
; élément) ; bornée à 255. La direction rangée dans les lumières n'est pas lue ici.
; Ex-'Render_FaceDotProductTest'.
; ==============================================================================================
LightSet_FaceIntensity_1DB23	proc far		; CODE XREF: sub_1BED0+102P
					; sub_1BED0+154P ...

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+0Bh]
		mov	[bp+var_2], ax
		mov	bx, [bp+arg_4]
		mov	ax, [di]
		imul	word ptr [bx]
		mov	[bp+var_8], ax
		mov	cx, dx
		mov	ax, [di+4]
		imul	word ptr [bx+4]
		add	[bp+var_8], ax
		adc	cx, dx
		mov	ax, [di+8]
		imul	word ptr [bx+8]
		add	ax, [bp+var_8]
		adc	dx, cx
		shl	edx, 10h
		mov	dx, ax
		sar	edx, 8
		mov	[bp+var_6], edx
		cmp	[bp+var_6], 0
		jle	short loc_1DB9F
		mov	bx, [si+2]
		mov	ax, [bx+4]
		mov	[bp+var_A], ax
		mov	bx, [bp+var_A]
		mov	ax, [bx+0Fh]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		mov	edx, [bp+var_6]
		imul	edx, eax
		mov	[bp+var_10], edx
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	ax, word ptr [bp+var_14+1]
		add	[bp+var_2], ax

loc_1DB9F:				; CODE XREF: LightSet_FaceIntensity_1DB23+49j
		cmp	[bp+var_2], 0FFh
		jle	short loc_1DBAB
		mov	[bp+var_2], 0FFh

loc_1DBAB:				; CODE XREF: LightSet_FaceIntensity_1DB23+81j
		mov	al, byte ptr [bp+var_2]
		pop	di
		pop	si
		leave
		retf
LightSet_FaceIntensity_1DB23	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1DBB6:				; DATA XREF: dseg:319Co
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_1DBD8
		test	di, 1
		jz	short loc_1DBD6
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_1DBD6:				; CODE XREF: seg044:0559j
		jmp	short $+2

loc_1DBD8:				; CODE XREF: seg044:0553j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
seg044		ends
