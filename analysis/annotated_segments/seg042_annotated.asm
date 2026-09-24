seg042		segment	byte public 'CODE' use16
		assume cs:seg042
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,24L — copie 3 champs (position 32-bit +1, valeur +5, type byte +9) depuis une structure
; d'événement/keyframe vers un objet cible : initialisation d'une entrée de
; trajectoire/animation à partir d'une keyframe.
; ==============================================================================================
Keyframe_InitBasic	proc far		; CODE XREF: Keyframe_InitWithParam+14p
					; Keyframe_InitWithEasing+14p ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]

loc_2410E:				; DATA XREF: seg216:020Eo
		mov	es:[bx+1], eax
		mov	eax, [bp+arg_8]
		mov	es:[bx+5], eax
		les	bx, [bp+arg_C]
		mov	al, es:[bx+6]
		les	bx, [bp+arg_0]
		mov	es:[bx+9], al
		pop	bp
		retf
Keyframe_InitBasic	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,20L — copie 3 champs (vecteur/vitesse +6, +0xA, +0xE) : initialisation d'un vecteur de
; mouvement depuis une keyframe.
; ==============================================================================================
Keyframe_InitVector	proc far		; CODE XREF: Keyframe_VectorInitWithParam+17p
					; ParticleEmitter_ConstructFull+129P ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_8]
		mov	es:[bx+0Ah], eax
		mov	eax, [bp+arg_C]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+arg_4]
		mov	es:[bx+6], eax
		pop	bp
		retf
Keyframe_InitVector	endp

; ���������������������������������������������������������������������������

loc_2414F:				; DATA XREF: seg339:11A8o seg339:11CCo ...
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_24180
		les	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_24180
		mov	al, 1
		jmp	short loc_24182
; ���������������������������������������������������������������������������

loc_24180:				; CODE XREF: seg042:0065j seg042:007Aj
		mov	al, 0

loc_24182:				; CODE XREF: seg042:007Ej
		pop	bp

locret_24183:
		retf
; ���������������������������������������������������������������������������

loc_24184:				; DATA XREF: seg339:11ACo seg339:11D0o ...
		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		push	di
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	si, [bp-4]
		mov	eax, es:[si]
		mov	[bp-28h], eax
		mov	eax, es:[si+4]
		mov	[bp-24h], eax
		mov	eax, es:[si+8]
		mov	[bp-20h], eax
		lea	di, [bp-28h]
		add	di, 4

loc_241C3:
		mov	es, word ptr [bp+8]

loc_241C6:
		mov	ax, es:[bx+10h]

loc_241CA:
		mov	dx, es:[bx+0Eh]
		add	dx, 5

loc_241D1:
		mov	[bp-6],	ax

loc_241D4:
		mov	[bp-8],	dx

loc_241D7:
		les	si, [bp-8]
		mov	eax, es:[si]

loc_241DE:
		mov	[bp-34h], eax
		mov	eax, es:[si+4]
		mov	[bp-30h], eax
		mov	eax, es:[si+8]
		mov	[bp-2Ch], eax
		lea	si, [bp-34h]
		add	si, 4
		mov	eax, [di]

loc_241FD:
		add	eax, [si]

loc_24200:
		mov	[bp-0Ch], eax
		mov	[bp-10h], eax

loc_24208:
		sar	eax, 1
		mov	[bp-14h], eax
		mov	[bp-18h], eax
		mov	[bp-1Ch], eax
		mov	eax, [bp-1Ch]
		mov	es, word ptr [bp+8]
		mov	es:[bx+2], eax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_24227:				; DATA XREF: seg339:11B0o seg339:11D4o ...
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2422E:				; DATA XREF: seg339:11E4o
					; seg339:off_6E2E0o
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_24233:				; DATA XREF: seg339:11BCo seg339:11E0o ...
		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+6]
		mov	ax, es:[bx+0Ah]
		xor	dx, dx
		sub	ax, [bp+0Ah]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 12h
		cdq
		idiv	ebx
		imul	ax, 12h
		mov	dx, [bp+10h]
		mov	bx, [bp+0Eh]
		add	bx, ax
		mov	si, [bp+6]
		mov	es:[si+0Ch], dx
		mov	es:[si+0Ah], bx
		mov	bx, [bp+6]
		mov	ax, es:[bx+0Eh]
		xor	dx, dx

loc_24274:
		sub	ax, [bp+0Ah]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 12h
		cdq
		idiv	ebx
		imul	ax, 12h
		mov	dx, [bp+10h]
		mov	bx, [bp+0Eh]
		add	bx, ax
		mov	es:[si+10h], dx
		mov	es:[si+0Eh], bx
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2429F:				; DATA XREF: seg339:11B8o seg339:11DCo ...
		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	byte ptr [bp-1], 0
		mov	al, [bp-1]
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,940 lignes — la plus grosse fonction de la base à ce jour. Buffer local énorme (0x158),
; initialisée à partir de +6 de l'objet. Structure et taille compatibles avec un calcul de
; trajectoire/interpolation de spline pour une séquence d'animation ou de caméra scriptée
; (cohérent avec sub_23E7D du seg041 qui chargeait des tags CAMR/ATCH). Bien trop volumineuse
; pour une passe rapide — prioritaire pour une session dédiée.
; ==============================================================================================
Cinematic_SplineCompute	proc far		; CODE XREF: seg107:14F9P

var_158		= dword	ptr -158h
var_154		= dword	ptr -154h
var_150		= dword	ptr -150h
var_14C		= dword	ptr -14Ch
var_148		= dword	ptr -148h
var_144		= dword	ptr -144h
var_140		= dword	ptr -140h
var_13C		= dword	ptr -13Ch
var_138		= dword	ptr -138h
var_134		= dword	ptr -134h
var_130		= dword	ptr -130h
var_12C		= dword	ptr -12Ch
var_128		= dword	ptr -128h
var_124		= dword	ptr -124h
var_120		= dword	ptr -120h
var_11C		= dword	ptr -11Ch
var_118		= dword	ptr -118h
var_114		= dword	ptr -114h
var_110		= dword	ptr -110h
var_10C		= dword	ptr -10Ch
var_108		= dword	ptr -108h
var_104		= dword	ptr -104h
var_100		= dword	ptr -100h
var_FC		= dword	ptr -0FCh
var_F8		= dword	ptr -0F8h
var_F4		= dword	ptr -0F4h
var_F0		= dword	ptr -0F0h
var_EC		= dword	ptr -0ECh
var_E8		= dword	ptr -0E8h
var_E4		= dword	ptr -0E4h
var_E0		= dword	ptr -0E0h
var_DC		= dword	ptr -0DCh
var_D8		= dword	ptr -0D8h
var_D4		= dword	ptr -0D4h
var_D0		= dword	ptr -0D0h
var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= word ptr -0C4h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= word ptr -0A6h
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
var_74		= word ptr -74h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= word ptr -56h
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
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 158h
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+6]

loc_242BF:
		mov	[bp+var_4], eax
		xor	si, si

loc_242C5:
		jmp	loc_24525
; ���������������������������������������������������������������������������

loc_242C8:				; CODE XREF: Cinematic_SplineCompute+27Cj
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+var_4]
		add	bx, ax

loc_242D2:
		mov	ax, es:[bx+3]
		mov	dx, es:[bx+1]

loc_242DA:
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0

loc_242F9:
		or	ax, ax

loc_242FB:
		jz	short loc_24300
		jmp	loc_24524
; ���������������������������������������������������������������������������

loc_24300:				; CODE XREF: Cinematic_SplineCompute:loc_242FBj
		les	di, [bp+var_8]
		mov	eax, es:[di]
		mov	[bp+var_110], eax
		mov	eax, es:[di+4]
		mov	[bp+var_10C], eax
		mov	eax, es:[di+8]
		mov	[bp+var_108], eax
		mov	eax, dword_7220A
		sub	[bp+var_110], eax
		mov	eax, dword_7220E
		sub	[bp+var_10C], eax
		mov	eax, dword_72212
		sub	[bp+var_108], eax
		push	5166h
		lea	ax, [bp+var_110]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		mov	eax, [bp+var_110]
		mov	es:[bx+5], eax
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		les	bx, es:[bx+0Ah]

loc_24371:
		mov	eax, [bp+var_10C]
		mov	es:[bx+9], eax
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		mov	eax, [bp+var_108]
		mov	es:[bx+0Dh], eax
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 2
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0

loc_243C0:
		or	ax, ax
		jz	short loc_243C7
		jmp	loc_24524
; ���������������������������������������������������������������������������

loc_243C7:				; CODE XREF: Cinematic_SplineCompute+114j
		cmp	byte_6E680, 0
		jnz	short loc_243D1
		jmp	loc_24470
; ���������������������������������������������������������������������������

loc_243D1:				; CODE XREF: Cinematic_SplineCompute+11Ej
		push	large [bp+var_10C]

loc_243D6:
		push	large [dword_72202]
		push	large [bp+var_110]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax

loc_243F0:
		mov	[bp+var_10], eax
		mov	ax, word_721FE
		add	ax, word ptr [bp+var_10+1]
		mov	dx, si

loc_243FC:
		shl	dx, 2

loc_243FF:
		les	bx, [bp+arg_0]
		add	bx, dx

loc_24404:
		les	bx, es:[bx+0Ah]
		mov	es:[bx+1], ax
		push	large [bp+var_10C]
		push	large [dword_72206]
		push	large [bp+var_108]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	ax, word_72200
		sub	ax, word ptr [bp+var_18+1]

loc_24435:				; CODE XREF: Cinematic_SplineCompute+25Ej
		mov	dx, si
		shl	dx, 2
		les	bx, [bp+arg_0]
		add	bx, dx
		les	bx, es:[bx+0Ah]
		mov	es:[bx+3], ax
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 4
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		and	byte ptr es:[bx+11h], 0F7h
		jmp	loc_24524
; ���������������������������������������������������������������������������

loc_24470:				; CODE XREF: Cinematic_SplineCompute+120j
		mov	eax, [bp+var_10C]
		cmp	eax, dword_6E9A6
		jl	short loc_24481
		mov	ax, 1
		jmp	short loc_24483
; ���������������������������������������������������������������������������

loc_24481:				; CODE XREF: Cinematic_SplineCompute+1CCj
		xor	ax, ax

loc_24483:				; CODE XREF: Cinematic_SplineCompute+1D1j
		or	al, al
		jnz	short loc_2448A
		jmp	loc_2450F
; ���������������������������������������������������������������������������

loc_2448A:				; CODE XREF: Cinematic_SplineCompute+1D7j
		mov	eax, dword_72540
		mov	[bp+var_1C], eax
		shl	eax, 8
		cmp	eax, [bp+var_10C]
		jl	short loc_244A2
		mov	ax, 1
		jmp	short loc_244A4
; ���������������������������������������������������������������������������

loc_244A2:				; CODE XREF: Cinematic_SplineCompute+1EDj
		xor	ax, ax

loc_244A4:				; CODE XREF: Cinematic_SplineCompute+1F2j
		or	al, al
		jz	short loc_2450F
		push	large [bp+var_10C]
		push	large [dword_72202]
		push	large [bp+var_110]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch

loc_244C3:
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	ax, word_721FE
		add	ax, word ptr [bp+var_24+1]
		mov	dx, si

loc_244D3:
		shl	dx, 2

loc_244D6:
		les	bx, [bp+arg_0]

loc_244D9:
		add	bx, dx
		les	bx, es:[bx+0Ah]

loc_244DF:
		mov	es:[bx+1], ax

loc_244E3:
		push	large [bp+var_10C]
		push	large [dword_72206]
		push	large [bp+var_108]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_28], eax

loc_24502:
		mov	[bp+var_2C], eax
		mov	ax, word_72200
		sub	ax, word ptr [bp+var_2C+1]
		jmp	loc_24435
; ���������������������������������������������������������������������������

loc_2450F:				; CODE XREF: Cinematic_SplineCompute+1D9j
					; Cinematic_SplineCompute+1F8j
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		les	bx, es:[bx+0Ah]
		or	byte ptr es:[bx+11h], 8
		jmp	short $+2

loc_24524:				; CODE XREF: Cinematic_SplineCompute+4Fj
					; Cinematic_SplineCompute+116j ...
		inc	si

loc_24525:				; CODE XREF: Cinematic_SplineCompute:loc_242C5j
		cmp	si, 2
		jge	short loc_2452D
		jmp	loc_242C8
; ���������������������������������������������������������������������������

loc_2452D:				; CODE XREF: Cinematic_SplineCompute+27Aj
		mov	dl, 0
		cmp	byte_6E680, 0
		jnz	short loc_24539
		jmp	loc_245D3
; ���������������������������������������������������������������������������

loc_24539:				; CODE XREF: Cinematic_SplineCompute+286j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	word ptr [bp+var_30+2],	ax
		mov	word ptr [bp+var_30], dx
		les	si, [bp+var_30]
		mov	eax, es:[si]
		mov	[bp+var_11C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_118], eax
		mov	eax, es:[si+8]
		mov	[bp+var_114], eax
		lea	di, [bp+var_11C]
		add	di, 4
		mov	es, word ptr [bp+arg_0+2]
		mov	ax, es:[bx+10h]
		mov	dx, es:[bx+0Eh]
		add	dx, 5
		mov	word ptr [bp+var_34+2],	ax
		mov	word ptr [bp+var_34], dx
		les	si, [bp+var_34]
		mov	eax, es:[si]
		mov	[bp+var_128], eax
		mov	eax, es:[si+4]
		mov	[bp+var_124], eax
		mov	eax, es:[si+8]
		mov	[bp+var_120], eax
		lea	si, [bp+var_128]
		add	si, 4
		mov	eax, [di]
		add	eax, [si]
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		sar	eax, 1

loc_245C0:
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax

loc_245C8:
		mov	[bp+var_48], eax

loc_245CC:
		mov	eax, [bp+var_48]

loc_245D0:
		jmp	loc_24AC8
; ���������������������������������������������������������������������������

loc_245D3:				; CODE XREF: Cinematic_SplineCompute+288j
		les	bx, [bp+arg_0]

loc_245D6:
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_24601
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx+11h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_24601
		mov	al, 1
		jmp	short loc_24603
; ���������������������������������������������������������������������������

loc_24601:				; CODE XREF: Cinematic_SplineCompute+338j
					; Cinematic_SplineCompute+34Dj
		mov	al, 0

loc_24603:				; CODE XREF: Cinematic_SplineCompute+351j
		mov	ah, 0
		or	ax, ax
		jz	short loc_2460C
		jmp	loc_24AD2
; ���������������������������������������������������������������������������

loc_2460C:				; CODE XREF: Cinematic_SplineCompute+359j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Ah]
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_24626
		jmp	loc_24809
; ���������������������������������������������������������������������������

loc_24626:				; CODE XREF: Cinematic_SplineCompute+373j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	word ptr [bp+var_4C+2],	ax
		mov	word ptr [bp+var_4C], dx
		les	si, [bp+var_4C]
		mov	eax, es:[si]
		mov	[bp+var_134], eax
		mov	eax, es:[si+4]
		mov	[bp+var_130], eax
		mov	eax, es:[si+8]
		mov	[bp+var_12C], eax
		mov	eax, [bp+var_130]
		cmp	eax, dword_6E9A6
		jge	short loc_2466B
		mov	ax, 1
		jmp	short loc_2466D
; ���������������������������������������������������������������������������

loc_2466B:				; CODE XREF: Cinematic_SplineCompute+3B6j
		xor	ax, ax

loc_2466D:				; CODE XREF: Cinematic_SplineCompute+3BBj
		or	al, al
		jnz	short loc_24674
		jmp	loc_247A4
; ���������������������������������������������������������������������������

loc_24674:				; CODE XREF: Cinematic_SplineCompute+3C1j
		mov	eax, [bp+var_134]
		mov	[bp+var_50], eax
		mov	eax, dword_6E9A6
		mov	[bp+var_54], eax
		mov	ax, word_721FE
		mov	[bp+var_56], ax
		push	large [bp+var_54]
		push	large [dword_72202]
		push	large [bp+var_50]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_5A], eax
		mov	[bp+var_5E], eax
		movsx	eax, [bp+var_56]
		shl	eax, 8
		mov	edx, [bp+var_5E]
		add	edx, eax
		mov	[bp+var_62], edx
		mov	eax, [bp+var_62]
		mov	[bp+var_66], eax
		sar	eax, 8
		mov	[bp+var_6A], eax

loc_246D0:
		cmp	[bp+var_6A], 7D00h
		jle	short loc_246E4
		mov	[bp+var_6A], 7D00h
		jmp	short loc_246F8
; ���������������������������������������������������������������������������

loc_246E4:				; CODE XREF: Cinematic_SplineCompute+42Aj
		cmp	[bp+var_6A], 0FFFF8300h
		jge	short loc_246F8

loc_246EE:
		mov	[bp+var_6A], 0FFFF8300h

loc_246F6:
		jmp	short $+2

loc_246F8:				; CODE XREF: Cinematic_SplineCompute+434j
					; Cinematic_SplineCompute+43Ej
		mov	ax, word ptr [bp+var_6A]
		les	bx, [bp+arg_0]

loc_246FE:
		les	bx, es:[bx+0Ah]

loc_24702:
		mov	es:[bx+1], ax
		mov	eax, [bp+var_12C]
		mov	[bp+var_6E], eax
		mov	eax, dword_6E9A6
		mov	[bp+var_72], eax
		mov	ax, word_72200
		mov	[bp+var_74], ax
		push	large [bp+var_72]
		push	large [dword_72206]
		push	large [bp+var_6E]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_78], eax
		mov	[bp+var_7C], eax
		movsx	eax, [bp+var_74]
		shl	eax, 8
		sub	eax, [bp+var_7C]
		mov	[bp+var_80], eax

loc_2474F:
		mov	[bp+var_84], eax

loc_24754:
		sar	eax, 8

loc_24758:
		mov	[bp+var_88], eax

loc_2475D:
		cmp	[bp+var_88], 7D00h

loc_24766:
		jle	short loc_24773
		mov	[bp+var_88], 7D00h
		jmp	short loc_24789
; ���������������������������������������������������������������������������

loc_24773:				; CODE XREF: Cinematic_SplineCompute:loc_24766j
		cmp	[bp+var_88], 0FFFF8300h
		jge	short loc_24789
		mov	[bp+var_88], 0FFFF8300h
		jmp	short $+2

loc_24789:				; CODE XREF: Cinematic_SplineCompute+4C3j
					; Cinematic_SplineCompute+4CEj
		mov	ax, word ptr [bp+var_88]

loc_2478D:				; CODE XREF: Cinematic_SplineCompute+559j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Ah]
		mov	es:[bx+3], ax
		or	byte ptr es:[bx+11h], 4
		or	byte ptr es:[bx+11h], 8
		jmp	short loc_24809
; ���������������������������������������������������������������������������

loc_247A4:				; CODE XREF: Cinematic_SplineCompute+3C3j
		push	large [bp+var_130]
		push	large [dword_72202]
		push	large [bp+var_134]

loc_247B3:
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax

loc_247BC:
		add	sp, 0Ch

loc_247BF:
		mov	[bp+var_8C], eax

loc_247C4:
		mov	[bp+var_90], eax
		mov	ax, word_721FE
		add	ax, word ptr [bp+var_90+1]
		les	bx, [bp+arg_0]

loc_247D3:
		les	bx, es:[bx+0Ah]
		mov	es:[bx+1], ax
		push	large [bp+var_130]

loc_247E0:
		push	large [dword_72206]
		push	large [bp+var_12C]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax

loc_247F1:
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_94], eax
		mov	[bp+var_98], eax
		mov	ax, word_72200
		sub	ax, word ptr [bp+var_98+1]
		jmp	short loc_2478D
; ���������������������������������������������������������������������������

loc_24809:				; CODE XREF: Cinematic_SplineCompute+375j
					; Cinematic_SplineCompute+4F4j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Eh]
		mov	al, es:[bx+11h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_24823
		jmp	loc_24A25
; ���������������������������������������������������������������������������

loc_24823:				; CODE XREF: Cinematic_SplineCompute+570j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+10h]
		mov	dx, es:[bx+0Eh]
		add	dx, 5
		mov	word ptr [bp+var_9C+2],	ax
		mov	word ptr [bp+var_9C], dx
		les	si, [bp+var_9C]
		mov	eax, es:[si]
		mov	[bp+var_140], eax
		mov	eax, es:[si+4]
		mov	[bp+var_13C], eax
		mov	eax, es:[si+8]

loc_24855:
		mov	[bp+var_138], eax
		mov	eax, [bp+var_13C]

loc_2485F:
		cmp	eax, dword_6E9A6
		jge	short loc_2486B
		mov	ax, 1
		jmp	short loc_2486D
; ���������������������������������������������������������������������������

loc_2486B:				; CODE XREF: Cinematic_SplineCompute+5B6j
		xor	ax, ax

loc_2486D:				; CODE XREF: Cinematic_SplineCompute+5BBj
		or	al, al
		jnz	short loc_24874
		jmp	loc_249C0
; ���������������������������������������������������������������������������

loc_24874:				; CODE XREF: Cinematic_SplineCompute+5C1j
		mov	eax, [bp+var_140]
		mov	[bp+var_A0], eax
		mov	eax, dword_6E9A6
		mov	[bp+var_A4], eax
		mov	ax, word_721FE
		mov	[bp+var_A6], ax
		push	large [bp+var_A4]
		push	large [dword_72202]
		push	large [bp+var_A0]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_AA], eax
		mov	[bp+var_AE], eax

loc_248B3:
		movsx	eax, [bp+var_A6]
		shl	eax, 8

loc_248BD:
		mov	edx, [bp+var_AE]

loc_248C2:
		add	edx, eax

loc_248C5:
		mov	[bp+var_B2], edx
		mov	eax, [bp+var_B2]

loc_248CF:
		mov	[bp+var_B6], eax
		sar	eax, 8

loc_248D8:
		mov	[bp+var_BA], eax

loc_248DD:
		cmp	[bp+var_BA], 7D00h
		jle	short loc_248F3
		mov	[bp+var_BA], 7D00h

loc_248F1:
		jmp	short loc_24909
; ���������������������������������������������������������������������������

loc_248F3:				; CODE XREF: Cinematic_SplineCompute+638j
		cmp	[bp+var_BA], 0FFFF8300h
		jge	short loc_24909

loc_248FE:
		mov	[bp+var_BA], 0FFFF8300h
		jmp	short $+2

loc_24909:				; CODE XREF: Cinematic_SplineCompute:loc_248F1j
					; Cinematic_SplineCompute+64Ej
		mov	ax, word ptr [bp+var_BA]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Eh]
		mov	es:[bx+1], ax
		mov	eax, [bp+var_138]
		mov	[bp+var_BE], eax
		mov	eax, dword_6E9A6
		mov	[bp+var_C2], eax
		mov	ax, word_72200
		mov	[bp+var_C4], ax
		push	large [bp+var_C2]
		push	large [dword_72206]
		push	large [bp+var_BE]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C8], eax

loc_24952:
		mov	[bp+var_CC], eax

loc_24957:
		movsx	eax, [bp+var_C4]
		shl	eax, 8
		sub	eax, [bp+var_CC]
		mov	[bp+var_D0], eax
		mov	[bp+var_D4], eax
		sar	eax, 8
		mov	[bp+var_D8], eax
		cmp	[bp+var_D8], 7D00h

loc_24982:
		jle	short loc_2498F

loc_24984:
		mov	[bp+var_D8], 7D00h

loc_2498D:
		jmp	short loc_249A5
; ���������������������������������������������������������������������������

loc_2498F:				; CODE XREF: Cinematic_SplineCompute:loc_24982j
		cmp	[bp+var_D8], 0FFFF8300h
		jge	short loc_249A5
		mov	[bp+var_D8], 0FFFF8300h
		jmp	short $+2

loc_249A5:				; CODE XREF: Cinematic_SplineCompute:loc_2498Dj
					; Cinematic_SplineCompute+6EAj
		mov	ax, word ptr [bp+var_D8]

loc_249A9:				; CODE XREF: Cinematic_SplineCompute+775j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Eh]

loc_249B0:
		mov	es:[bx+3], ax
		or	byte ptr es:[bx+11h], 4

loc_249B9:
		or	byte ptr es:[bx+11h], 8
		jmp	short loc_24A25
; ���������������������������������������������������������������������������

loc_249C0:				; CODE XREF: Cinematic_SplineCompute+5C3j
		push	large [bp+var_13C]
		push	large [dword_72202]
		push	large [bp+var_140]

loc_249CF:
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax

loc_249D8:
		add	sp, 0Ch
		mov	[bp+var_DC], eax
		mov	[bp+var_E0], eax
		mov	ax, word_721FE
		add	ax, word ptr [bp+var_E0+1]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+0Eh]

loc_249F3:
		mov	es:[bx+1], ax

loc_249F7:
		push	large [bp+var_13C]

loc_249FC:
		push	large [dword_72206]

loc_24A01:
		push	large [bp+var_138]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_E4], eax
		mov	[bp+var_E8], eax
		mov	ax, word_72200
		sub	ax, word ptr [bp+var_E8+1]
		jmp	short loc_249A9
; ���������������������������������������������������������������������������

loc_24A25:				; CODE XREF: Cinematic_SplineCompute+572j
					; Cinematic_SplineCompute+710j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Ch]
		mov	dx, es:[bx+0Ah]
		add	dx, 5
		mov	word ptr [bp+var_EC+2],	ax
		mov	word ptr [bp+var_EC], dx
		les	si, [bp+var_EC]
		mov	eax, es:[si]
		mov	[bp+var_14C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_148], eax
		mov	eax, es:[si+8]

loc_24A57:
		mov	[bp+var_144], eax
		lea	di, [bp+var_14C]
		add	di, 4
		mov	es, word ptr [bp+arg_0+2]
		mov	ax, es:[bx+10h]
		mov	dx, es:[bx+0Eh]
		add	dx, 5
		mov	word ptr [bp+var_F0+2],	ax
		mov	word ptr [bp+var_F0], dx
		les	si, [bp+var_F0]
		mov	eax, es:[si]
		mov	[bp+var_158], eax

loc_24A86:
		mov	eax, es:[si+4]

loc_24A8B:
		mov	[bp+var_154], eax
		mov	eax, es:[si+8]
		mov	[bp+var_150], eax
		lea	si, [bp+var_158]
		add	si, 4
		mov	eax, [di]
		add	eax, [si]
		mov	[bp+var_F4], eax
		mov	[bp+var_F8], eax
		sar	eax, 1
		mov	[bp+var_FC], eax

loc_24AB9:
		mov	[bp+var_100], eax
		mov	[bp+var_104], eax
		mov	eax, [bp+var_104]

loc_24AC8:				; CODE XREF: Cinematic_SplineCompute:loc_245D0j
		les	bx, [bp+arg_0]

loc_24ACB:
		mov	es:[bx+2], eax
		mov	dl, 1

loc_24AD2:				; CODE XREF: Cinematic_SplineCompute+35Bj
		mov	al, dl
		pop	di
		pop	si
		leave
		retf
Cinematic_SplineCompute	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,23L — appelle sub_24104 (init keyframe) puis copie un champ supplémentaire (+3→+0xA) :
; initialisation d'une keyframe avec un paramètre additionnel (type d'interpolation?).
; ==============================================================================================
Keyframe_InitWithParam	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFieldsB_952D0+196P

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Keyframe_InitBasic
		add	sp, 10h
		les	bx, [bp+arg_C]
		mov	al, es:[bx+3]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], al
		pop	bp
		retf
Keyframe_InitWithParam	endp

; ���������������������������������������������������������������������������

loc_24B02:				; DATA XREF: seg339:1254o
		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+6]
		mov	eax, es:[bx+6]
		mov	[bp-4],	eax
		les	bx, [bp-4]
		cmp	byte ptr es:[bx+9], 0
		jz	short loc_24B31
		mov	al, es:[bx+0Ah]
		push	ax
		push	large dword ptr	[bp+6]
		call	Keyframe_ResolveEasingValue
		add	sp, 6
		jmp	short loc_24B38
; ���������������������������������������������������������������������������

loc_24B31:				; CODE XREF: seg042:0A1Cj
		les	bx, [bp-4]
		mov	al, es:[bx+0Ah]

loc_24B38:				; CODE XREF: seg042:0A2Fj
		les	bx, [bp+6]
		mov	es:[bx+12h], al
		leave
		retf
; ���������������������������������������������������������������������������

loc_24B41:				; DATA XREF: seg339:1234o
		push	bp
		mov	bp, sp
		sub	sp, 8
		les	bx, [bp+6]
		mov	eax, es:[bx+0Ah]
		mov	[bp-4],	eax

loc_24B53:
		mov	eax, es:[bx+0Eh]

loc_24B58:
		mov	[bp-8],	eax
		mov	al, es:[bx+12h]
		push	ax

loc_24B61:
		les	bx, [bp-8]

loc_24B64:
		push	word ptr es:[bx+3]
		push	word ptr es:[bx+1]
		les	bx, [bp-4]
		push	word ptr es:[bx+3]
		push	word ptr es:[bx+1]
		push	word_70E60
		call	Render_FillClippedRect_61960
		add	sp, 0Ch

locret_24B83:
		leave
		retf
; ���������������������������������������������������������������������������

loc_24B85:				; DATA XREF: seg339:1248o
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,39L — appelle sub_24104 puis convertit un champ via une table (sub_2E8F1, offset 0x541A)
; en valeur 32-bit stockée (+0xA/+0xC) : initialisation de keyframe avec résolution d'une
; valeur tabulée (probable easing/interpolation).
; ==============================================================================================
Keyframe_InitWithEasing	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFieldsB_952D0+1E9P

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Keyframe_InitBasic
		add	sp, 10h
		les	bx, [bp+arg_C]
		mov	al, es:[bx+3]
		cbw
		push	ax
		push	541Ah

loc_24BB2:
		call	Text_ResolveTruncated

loc_24BB7:
		add	sp, 4

loc_24BBA:
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], dx

loc_24BC1:
		mov	es:[bx+0Ah], ax
		pop	bp

locret_24BC6:
		retf
Keyframe_InitWithEasing	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,33L — appelle sub_2412C (init vecteur) puis copie un champ (+0xA→+0x12) : initialisation
; de vecteur de mouvement avec copie d'un paramètre additionnel.
; ==============================================================================================
Keyframe_VectorInitWithParam	proc far		; CODE XREF: AircraftComponent_LoadWithDwordFieldsB_952D0+216P

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 4

loc_24BCD:
		push	large [bp+arg_C]

loc_24BD1:
		push	large [bp+arg_8]

loc_24BD5:
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Keyframe_InitVector
		add	sp, 10h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ah]
		les	bx, [bp+arg_0]
		mov	es:[bx+12h], eax
		leave
		retf
Keyframe_VectorInitWithParam	endp

; ���������������������������������������������������������������������������

loc_24BFE:				; DATA XREF: seg339:11C4o
		push	bp
		mov	bp, sp
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_24C03:				; DATA XREF: seg339:11D8o
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,28L — appelle sub_24104 puis copie 2 champs bytes supplémentaires (+3/+4 → +0xA/+0xB) :
; initialisation de keyframe avec deux paramètres additionnels (probable easing in/out).
; ==============================================================================================
Keyframe_InitWithTwoParams	proc far		; CODE XREF: ParticleEmitter_ConstructFull+F9P
					; AircraftComponent_LoadWithDwordFieldsB_952D0+23BP

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Keyframe_InitBasic
		add	sp, 10h
		les	bx, [bp+arg_C]
		mov	al, es:[bx+3]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], al
		les	bx, [bp+arg_C]
		mov	al, es:[bx+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Bh], al
		pop	bp
		retf
Keyframe_InitWithTwoParams	endp

; ���������������������������������������������������������������������������

loc_24C42:				; DATA XREF: seg339:11C0o
		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+6]
		mov	eax, es:[bx+6]

loc_24C50:
		mov	[bp-4],	eax
		les	bx, [bp-4]

loc_24C57:
		cmp	byte ptr es:[bx+9], 0
		jz	short loc_24C8C
		mov	al, es:[bx+0Ah]
		push	ax
		push	large dword ptr	[bp+6]
		call	Keyframe_ResolveEasingValue
		add	sp, 6
		les	bx, [bp+6]
		mov	es:[bx+12h], al
		les	bx, [bp-4]
		mov	al, es:[bx+0Bh]
		push	ax
		push	large dword ptr	[bp+6]
		call	Keyframe_ResolveEasingValue
		add	sp, 6

loc_24C8A:
		jmp	short loc_24CA1
; ���������������������������������������������������������������������������

loc_24C8C:				; CODE XREF: seg042:0B5Cj
		les	bx, [bp-4]
		mov	al, es:[bx+0Ah]
		les	bx, [bp+6]
		mov	es:[bx+12h], al
		les	bx, [bp-4]
		mov	al, es:[bx+0Bh]

loc_24CA1:				; CODE XREF: seg042:loc_24C8Aj
		les	bx, [bp+6]
		mov	es:[bx+13h], al
		leave
		retf
; ���������������������������������������������������������������������������

loc_24CAA:				; DATA XREF: seg339:11A0o
		push	bp
		mov	bp, sp
		sub	sp, 8Eh

loc_24CB1:
		push	si
		mov	eax, dword_721F6

loc_24CB6:
		mov	[bp-4],	eax
		shl	eax, 1
		mov	[bp-4],	eax
		les	bx, [bp+6]
		mov	eax, es:[bx+0Ah]
		mov	[bp-8],	eax
		mov	eax, es:[bx+0Eh]

loc_24CD2:
		mov	[bp-0Ch], eax
		mov	ax, [bp-6]
		mov	dx, [bp-8]
		add	dx, 5

loc_24CDF:
		mov	[bp-12h], ax

loc_24CE2:
		mov	[bp-14h], dx
		les	si, [bp-14h]

loc_24CE8:
		mov	eax, es:[si]
		mov	[bp-40h], eax
		mov	eax, es:[si+4]

loc_24CF5:
		mov	[bp-3Ch], eax
		mov	eax, es:[si+8]
		mov	[bp-38h], eax
		mov	eax, [bp-3Ch]
		mov	[bp-10h], eax
		mov	ax, [bp-0Ah]
		mov	dx, [bp-0Ch]
		add	dx, 5
		mov	[bp-1Ah], ax
		mov	[bp-1Ch], dx
		les	si, [bp-1Ch]
		mov	eax, es:[si]
		mov	[bp-4Ch], eax
		mov	eax, es:[si+4]
		mov	[bp-48h], eax
		mov	eax, es:[si+8]
		mov	[bp-44h], eax
		mov	eax, [bp-48h]
		mov	[bp-18h], eax
		mov	eax, [bp-10h]
		or	eax, eax
		jge	short loc_24D4A
		neg	eax

loc_24D4A:				; CODE XREF: seg042:0C45j
		mov	[bp-28h], eax

loc_24D4E:
		mov	eax, [bp-28h]
		mov	[bp-2Ch], eax
		mov	[bp-20h], eax
		mov	eax, [bp-18h]
		or	eax, eax
		jge	short loc_24D66
		neg	eax

loc_24D66:				; CODE XREF: seg042:0C61j
		mov	[bp-30h], eax
		mov	eax, [bp-30h]
		mov	[bp-34h], eax
		mov	[bp-24h], eax
		mov	eax, [bp-20h]
		cmp	eax, [bp-4]
		jge	short loc_24D85
		mov	ax, 1

loc_24D83:
		jmp	short loc_24D87
; ���������������������������������������������������������������������������

loc_24D85:				; CODE XREF: seg042:0C7Ej
		xor	ax, ax

loc_24D87:				; CODE XREF: seg042:loc_24D83j
		or	al, al

loc_24D89:
		jnz	short loc_24DA3
		mov	eax, [bp-24h]

loc_24D8F:
		cmp	eax, [bp-4]
		jge	short loc_24D9A

loc_24D95:
		mov	ax, 1
		jmp	short loc_24D9C
; ���������������������������������������������������������������������������

loc_24D9A:				; CODE XREF: seg042:0C93j
		xor	ax, ax

loc_24D9C:				; CODE XREF: seg042:0C98j
		or	al, al
		jnz	short loc_24DA3
		jmp	loc_24E57
; ���������������������������������������������������������������������������

loc_24DA3:				; CODE XREF: seg042:loc_24D89j
					; seg042:0C9Ej
		les	bx, [bp-8]
		mov	ax, es:[bx+1]
		mov	[bp-8Eh], ax

loc_24DAE:
		mov	ax, es:[bx+3]
		mov	[bp-8Ch], ax
		les	bx, [bp+6]
		mov	al, es:[bx+12h]
		mov	ah, 0
		shl	ax, 8
		mov	[bp-8Ah], ax
		les	bx, [bp-0Ch]
		mov	ax, es:[bx+1]
		mov	[bp-78h], ax
		mov	ax, es:[bx+3]
		mov	[bp-76h], ax

loc_24DD7:
		les	bx, [bp+6]

loc_24DDA:
		mov	al, es:[bx+13h]
		mov	ah, 0

loc_24DE0:
		shl	ax, 8
		mov	[bp-74h], ax
		mov	eax, [bp-10h]
		cmp	eax, [bp-18h]
		jge	short loc_24DF5
		mov	ax, 1

loc_24DF3:
		jmp	short loc_24DF7
; ���������������������������������������������������������������������������

loc_24DF5:				; CODE XREF: seg042:0CEEj
		xor	ax, ax

loc_24DF7:				; CODE XREF: seg042:loc_24DF3j
		or	al, al
		jz	short loc_24E1B
		les	bx, [bp-8]
		mov	ax, es:[bx+1]
		add	ax, 0FFFCh
		mov	[bp-62h], ax
		mov	ax, es:[bx+3]
		add	ax, 0FFFCh
		mov	[bp-60h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+12h]
		jmp	short loc_24E39
; ���������������������������������������������������������������������������

loc_24E1B:				; CODE XREF: seg042:0CF9j
		les	bx, [bp-0Ch]
		mov	ax, es:[bx+1]
		add	ax, 0FFFCh
		mov	[bp-62h], ax
		mov	ax, es:[bx+3]
		add	ax, 0FFFCh
		mov	[bp-60h], ax
		les	bx, [bp+6]
		mov	al, es:[bx+13h]

loc_24E39:				; CODE XREF: seg042:0D19j
		mov	ah, 0
		shl	ax, 8
		mov	[bp-5Eh], ax
		push	ss
		lea	ax, [bp-8Eh]
		push	ax
		push	3
		push	word_70E60
		call	Render_MeshPrimitive_21085

loc_24E52:
		add	sp, 8
		jmp	short loc_24E8A
; ���������������������������������������������������������������������������

loc_24E57:				; CODE XREF: seg042:0CA0j
		les	bx, [bp+6]
		mov	al, es:[bx+13h]
		mov	ah, 0
		push	ax

loc_24E61:
		mov	al, es:[bx+12h]
		mov	ah, 0
		push	ax
		les	bx, [bp-0Ch]
		push	word ptr es:[bx+3]
		push	word ptr es:[bx+1]
		les	bx, [bp-8]
		push	word ptr es:[bx+3]
		push	word ptr es:[bx+1]

loc_24E7E:
		push	word_70E60
		call	Render_LineClipped

loc_24E87:
		add	sp, 0Eh

loc_24E8A:				; CODE XREF: seg042:0D55j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_24E8D:				; DATA XREF: seg339:11B4o
		push	bp
		mov	bp, sp
		mov	al, 3
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_24E94:				; DATA XREF: seg339:4DBCo
		push	bp
		mov	bp, sp
		mov	word_72254, 11E8h
		mov	word_72254, 11ECh
		mov	word_72254, 1210h
		mov	word_72254, 1234h

loc_24EAF:
		mov	word_72267, 11E8h
		mov	word_72267, 11ECh
		mov	word_72267, 1210h

loc_24EC1:
		mov	word_72267, 11C4h

loc_24EC7:
		mov	word_7227D, 11E8h

loc_24ECD:
		mov	word_7227D, 11ECh

loc_24ED3:
		mov	word_7227D, 1210h

loc_24ED9:
		mov	word_7227D, 11A0h
		pop	bp

locret_24EE0:
		retf
seg042		ends
