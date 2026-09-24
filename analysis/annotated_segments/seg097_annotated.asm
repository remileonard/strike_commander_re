seg097		segment	byte public 'CODE' use16
		assume cs:seg097
		;org 7
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_45387:				; DATA XREF: seg339:off_6F4C0o
		push	bp
		mov	bp, sp
		mov	al, 14h

loc_4538C:				; DATA XREF: seg216:03CEo
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4538E:				; DATA XREF: seg339:2408o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_453D6
		les	bx, [bp+6]
		mov	word ptr es:[bx], 2408h
		push	0
		push	word ptr [bp+8]
		push	bx
		call	Camera_DestructTypeB
		add	sp, 6
		test	si, 1
		jz	short loc_453D6
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_453D6:				; CODE XREF: seg097:001Dj seg097:0039j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_453D9:				; DATA XREF: seg339:off_6FC3Ao
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 14h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_453E3:				; DATA XREF: seg339:off_6FC8Eo
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+6]
		mov	word ptr [bp-2], 1
		mov	ax, [bp+8]
		mov	[si+55h], ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		push	ax
		mov	ax, si
		add	ax, 57h	; 'W'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	di, [bp+0Ch]
		mov	eax, [di]
		mov	[si+59h], eax
		mov	eax, [di+4]
		mov	[si+5Dh], eax
		mov	eax, [di+8]
		mov	[si+61h], eax
		cmp	word ptr [si+55h], 0A5h	; '�'
		jnz	short loc_4549F
		mov	di, si
		add	di, 12h
		mov	ax, si
		add	ax, 16h
		mov	[bp-0Eh], ax
		mov	eax, [di]
		mov	[bp-0Ch], eax
		mov	bx, [bp-0Eh]
		mov	eax, [bx]
		mov	[bp-8],	eax
		mov	di, si
		add	di, 59h	; 'Y'

loc_45452:
		mov	ax, si

loc_45454:
		add	ax, 5Dh	; ']'
		mov	[bp-18h], ax

loc_4545A:
		mov	eax, [di]

loc_4545D:
		mov	[bp-16h], eax

loc_45461:
		mov	bx, [bp-18h]

loc_45464:
		mov	eax, [bx]

loc_45467:
		mov	[bp-12h], eax
		lea	ax, [bp-16h]
		push	ax
		lea	ax, [bp-0Ch]
		push	ax
		push	ss
		lea	ax, [bp-1Ch]
		push	ax
		call	Missile_ComputeDistanceToTarget_563C9
		add	sp, 8
		cmp	dword ptr [bp-1Ch], 6400h
		jge	short loc_4548F
		mov	ax, 1
		jmp	short loc_45491
; ���������������������������������������������������������������������������

loc_4548F:				; CODE XREF: seg097:0108j
		xor	ax, ax

loc_45491:				; CODE XREF: seg097:010Dj
		or	al, al
		jz	short loc_4549F
		mov	word ptr [si+55h], 0
		mov	word ptr [bp-2], 0

loc_4549F:				; CODE XREF: seg097:00ADj seg097:0113j
		mov	ax, [bp-2]
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,214L — calcule la distance à un point d'aiguisage (offset+0x59 vs +0x12) puis résout un
; plan de collision (sub_54B0A, deux fois) : calcul du point d'impact/plan de collision entre
; un missile et sa cible verrouillée (guidage terminal).
; ==============================================================================================
Missile_ComputeImpactPlane	proc far		; CODE XREF: seg097:052Ap

var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	ss
		lea	ax, [bp+var_3E]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	large [bp+var_36]
		push	large [bp+var_3A]
		push	large [bp+var_3E]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_454EB
		mov	ax, 1
		jmp	short loc_454ED
; ���������������������������������������������������������������������������

loc_454EB:				; CODE XREF: Missile_ComputeImpactPlane+3Ej
		xor	ax, ax

loc_454ED:				; CODE XREF: Missile_ComputeImpactPlane+43j
		or	al, al
		jz	short loc_454F4
		jmp	loc_45671
; ���������������������������������������������������������������������������

loc_454F4:				; CODE XREF: Missile_ComputeImpactPlane+49j
		mov	di, si
		add	di, 59h	; 'Y'
		mov	cx, si
		add	cx, 12h
		mov	eax, [di]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp+var_4A], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_46], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_42], eax
		lea	ax, [bp+var_4A]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		lea	ax, [bp+var_3A]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		call	Math_ArcTan2_54B0A
		add	sp, 8
		lea	ax, [bp+var_46]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	Math_ArcTan2_54B0A
		add	sp, 8

loc_45556:
		mov	eax, [bp+var_C]
		sub	eax, [bp+var_10]

loc_4555E:
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	bx, word ptr [bp+var_18+1]
		cmp	bx, 0B4h ; '�'
		jle	short loc_45575
		sub	bx, 168h
		jmp	short loc_4557F
; ���������������������������������������������������������������������������

loc_45575:				; CODE XREF: Missile_ComputeImpactPlane+C7j
		cmp	bx, 0FF4Ch
		jge	short loc_4557F
		add	bx, 168h

loc_4557F:				; CODE XREF: Missile_ComputeImpactPlane+CDj
					; Missile_ComputeImpactPlane+D3j
		mov	eax, [bp+var_3E]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_1C], eax
		or	bx, bx
		jnz	short loc_45596
		jmp	loc_45671
; ���������������������������������������������������������������������������

loc_45596:				; CODE XREF: Missile_ComputeImpactPlane+EBj
		mov	cx, 1
		or	bx, bx
		jle	short loc_455A0
		mov	cx, 0FFFFh

loc_455A0:				; CODE XREF: Missile_ComputeImpactPlane+F5j
		mov	[bp+var_22], cx
		movsx	eax, [bp+var_22]
		shl	eax, 8
		mov	[bp+var_26], eax
		lea	di, [bp+var_20]
		mov	eax, [di]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2E], eax
		mov	[bp+var_32], eax
		push	eax
		call	Math_SinRaw_58063
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_32], eax
		push	large [bp+var_2E]
		call	Math_CosRaw_580A7
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		push	large [bp+var_32]
		push	large [bp+var_1C]
		call	Math_FixedMultiply_58034
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		add	[bp+var_20], eax
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		push	large [bp+var_32]
		push	large [bp+var_2A]
		call	Math_FixedMultiply_58034
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		sub	[bp+var_1C], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_1C]

loc_45650:
		mov	[bp+var_3A], eax
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_3E]
		push	ax

loc_4565C:
		call	UI_ApplyLineOfSightCheck_55A9E
		add	sp, 4
		lea	ax, [bp+var_3E]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 4

loc_45671:				; CODE XREF: Missile_ComputeImpactPlane+4Bj
					; Missile_ComputeImpactPlane+EDj
		pop	di
		pop	si
		leave
		retf
Missile_ComputeImpactPlane	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,144L — calcule la distance à la cible, la compare à un seuil de 0xC80 (3200, probable
; rayon de recherche en unités du jeu) : test de portée de recherche/acquisition pour le
; guidage de missile.
; ==============================================================================================
Missile_TestSearchRange	proc far		; CODE XREF: seg097:051Ep

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
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 38h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_2C]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_30], eax
		push	eax
		push	large [bp+var_28]
		push	large [bp+var_2C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		mov	[bp+var_10], 0C80h
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_C]
		jge	short loc_456E3
		mov	ax, 1
		jmp	short loc_456E5
; ���������������������������������������������������������������������������

loc_456E3:				; CODE XREF: Missile_TestSearchRange+67j
		xor	ax, ax

loc_456E5:				; CODE XREF: Missile_TestSearchRange+6Cj
		or	al, al
		jnz	short loc_456EC
		jmp	loc_45793
; ���������������������������������������������������������������������������

loc_456EC:				; CODE XREF: Missile_TestSearchRange+72j
		cmp	[bp+var_4], 0
		jnz	short loc_456F8
		mov	ax, 1
		jmp	short loc_456FA
; ���������������������������������������������������������������������������

loc_456F8:				; CODE XREF: Missile_TestSearchRange+7Cj
		xor	ax, ax

loc_456FA:				; CODE XREF: Missile_TestSearchRange+81j
		or	al, al
		jz	short loc_45721
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_38], eax
		mov	eax, [di+4]
		mov	[bp+var_34], eax
		mov	eax, [di+8]
		mov	[bp+var_30], eax

loc_45721:				; CODE XREF: Missile_TestSearchRange+87j
		mov	[bp+var_18], 40h ; '@'
		mov	eax, [bp+var_18]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_C]
		sub	eax, [bp+var_4]
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		cmp	eax, [bp+var_14]
		jge	short loc_4574C
		mov	ax, 1
		jmp	short loc_4574E
; ���������������������������������������������������������������������������

loc_4574C:				; CODE XREF: Missile_TestSearchRange+D0j
		xor	ax, ax

loc_4574E:				; CODE XREF: Missile_TestSearchRange+D5j
		or	al, al
		jz	short loc_4575E
		mov	eax, [bp+var_C]
		sub	eax, [bp+var_4]

loc_4575A:
		mov	[bp+var_14], eax

loc_4575E:				; CODE XREF: Missile_TestSearchRange+DBj
		lea	ax, [bp+var_14]
		push	ax
		lea	ax, [bp+var_38]
		push	ax
		call	UI_ApplyLineOfSightCheck_55A9E
		add	sp, 4
		mov	eax, [bp+var_38]
		add	[bp+var_2C], eax
		mov	eax, [bp+var_34]
		add	[bp+var_28], eax
		mov	eax, [bp+var_30]
		add	[bp+var_24], eax
		lea	ax, [bp+var_2C]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 4

loc_45793:				; CODE XREF: Missile_TestSearchRange+74j
		pop	di
		pop	si
		leave
		retf
Missile_TestSearchRange	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,127L — calcule la distance à la cible, compare à un seuil de 0x40 (64, probable rayon de
; fuze de proximité) : test de déclenchement de la fuze de proximité du missile (distance
; critique de détonation).
; ==============================================================================================
Missile_TestProximityFuze	proc far		; CODE XREF: seg097:0534p

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
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 40h
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_20], eax
		push	eax
		push	large [bp+var_18]
		push	large [bp+var_1C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jle	short loc_457F1
		mov	ax, 1
		jmp	short loc_457F3
; ���������������������������������������������������������������������������

loc_457F1:				; CODE XREF: Missile_TestProximityFuze+53j
		xor	ax, ax

loc_457F3:				; CODE XREF: Missile_TestProximityFuze+58j
		or	al, al
		jnz	short loc_457FA
		jmp	loc_45880
; ���������������������������������������������������������������������������

loc_457FA:				; CODE XREF: Missile_TestProximityFuze+5Ej
		mov	[bp+var_10], 40h ; '@'
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_C]
		jge	short loc_45819
		mov	ax, 1
		jmp	short loc_4581B
; ���������������������������������������������������������������������������

loc_45819:				; CODE XREF: Missile_TestProximityFuze+7Bj
		xor	ax, ax

loc_4581B:				; CODE XREF: Missile_TestProximityFuze+80j
		or	al, al
		jz	short loc_45827
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax

loc_45827:				; CODE XREF: Missile_TestProximityFuze+86j
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	UI_ApplyLineOfSightCheck_55A9E
		add	sp, 4
		mov	eax, [bp+var_28]
		sub	eax, [bp+var_1C]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_24]
		sub	eax, [bp+var_18]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_20]

loc_45853:
		sub	eax, [bp+var_14]

loc_45857:
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_34]

loc_4585F:
		mov	[bp+var_40], eax

loc_45863:
		mov	eax, [bp+var_30]

loc_45867:
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_38], eax
		lea	ax, [bp+var_40]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 4

loc_45880:				; CODE XREF: Missile_TestProximityFuze+60j
		pop	si
		leave
		retf
Missile_TestProximityFuze	endp

; ���������������������������������������������������������������������������

loc_45883:				; DATA XREF: seg339:off_6FC16o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		call	WorldObject_IsAlive_3CBB7
		pop	cx
		or	al, al
		jz	short loc_458C3
		cmp	word ptr [si+55h], 0A5h	; '�'
		jnz	short loc_458B2
		push	si
		push	cs
		call	near ptr Missile_TestSearchRange
		pop	cx
		mov	ax, si
		add	ax, 59h	; 'Y'
		push	ax
		push	si
		push	cs
		call	near ptr Missile_ComputeImpactPlane
		add	sp, 4
		jmp	short loc_458B8
; ���������������������������������������������������������������������������

loc_458B2:				; CODE XREF: seg097:051Aj
		push	si
		push	cs
		call	near ptr Missile_TestProximityFuze
		pop	cx

loc_458B8:				; CODE XREF: seg097:0530j
		push	si
		call	Emitter_UpdateFromEntitySMOKVec_3D57E
		pop	cx
		mov	al, 1
		jmp	short loc_458C5
; ���������������������������������������������������������������������������

loc_458C3:				; CODE XREF: seg097:0513j
		mov	al, 0

loc_458C5:				; CODE XREF: seg097:0541j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_458C8:				; DATA XREF: seg339:off_6FC1Ao
		push	bp
		mov	bp, sp
		sub	sp, 48h
		push	si
		push	di
		mov	si, [bp+6]
		cmp	word ptr [si+51h], 0
		jz	short loc_45954
		mov	di, [si+51h]
		add	di, 8
		mov	eax, [di]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-4],	eax
		mov	eax, [bp-4]
		mov	[bp-8],	eax
		mov	eax, [di+4]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		mov	[bp-10h], eax
		mov	eax, [di+8]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		mov	[bp-18h], eax
		mov	eax, [bp-8]
		mov	[bp-3Ch], eax
		mov	eax, [bp-10h]
		mov	[bp-38h], eax
		mov	eax, [bp-18h]
		mov	[bp-34h], eax
		mov	dx, ss

loc_4594F:
		lea	ax, [bp-3Ch]
		jmp	short loc_45971
; ���������������������������������������������������������������������������

loc_45954:				; CODE XREF: seg097:0557j
		mov	eax, dword_707F8
		mov	[bp-3Ch], eax
		mov	eax, dword_707FC
		mov	[bp-38h], eax
		mov	eax, dword_70800
		mov	[bp-34h], eax
		mov	dx, ss
		lea	ax, [bp-3Ch]

loc_45971:				; CODE XREF: seg097:05D2j
		push	large dword ptr	[bp-34h]
		push	large dword ptr	[bp-38h]
		push	large dword ptr	[bp-3Ch]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-20h], eax
		mov	[bp-1Ch], eax
		lea	ax, [bp-34h]
		push	ax
		lea	ax, [bp-38h]
		push	ax
		lea	ax, [bp-3Ch]
		push	ax
		push	si
		call	Debris_BodyIntegrateForces
		add	sp, 8
		push	1
		lea	ax, [bp-30h]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp-24h]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp-24h]
		mov	[si+1Ah], eax
		cmp	dword ptr [bp-1Ch], 0
		jle	short loc_459D7
		mov	ax, 1
		jmp	short loc_459D9
; ���������������������������������������������������������������������������

loc_459D7:				; CODE XREF: seg097:0650j
		xor	ax, ax

loc_459D9:				; CODE XREF: seg097:0655j
		or	al, al
		jz	short loc_45A45
		mov	eax, [bp-3Ch]
		mov	[bp-48h], eax
		mov	eax, [bp-38h]
		mov	[bp-44h], eax
		mov	eax, [bp-34h]
		mov	[bp-40h], eax
		lea	ax, [bp-48h]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [bp-48h]
		mov	[si+38h], eax
		mov	eax, [bp-44h]
		mov	[si+3Ch], eax
		mov	eax, [bp-40h]
		mov	[si+40h], eax
		mov	ax, si
		add	ax, 38h	; '8'
		mov	eax, [bp-30h]
		mov	[si+44h], eax
		mov	eax, [bp-2Ch]
		mov	[si+48h], eax
		mov	eax, [bp-28h]
		mov	[si+4Ch], eax
		mov	ax, si
		add	ax, 44h	; 'D'
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Matrix_ApplyToVectorZ_576E5
		pop	cx

loc_45A45:				; CODE XREF: seg097:065Bj
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,15L — positionne un flag (+4 bit6) : marqueur 'verrouillage de guidage actif'.
; ==============================================================================================
Missile_MarkGuidanceActive	proc far		; CODE XREF: Missile_InitGuidanceLock+16p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_45A50:
		or	byte ptr [si+4], 40h
		pop	si
		pop	bp
		retf
Missile_MarkGuidanceActive	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,21L — attache une cible (sub_3DC3D) puis active le flag de guidage (sub_45A49) :
; initialisation du guidage de missile avec verrouillage sur une cible.
; ==============================================================================================
Missile_InitGuidanceLock	proc far		; CODE XREF: PlayerComponentVariantR_ConstructAndInit_A0DBA:loc_A0DFCP

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	Camera_InitAttachedWithTarget_3DC3D
		add	sp, 6
		push	si
		push	cs
		call	near ptr Missile_MarkGuidanceActive
		pop	cx
		pop	si
		pop	bp
		retf
Missile_InitGuidanceLock	endp

; ���������������������������������������������������������������������������

loc_45A74:				; DATA XREF: seg339:off_6FC1Eo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_45AAB
		mov	word ptr [si], 2B56h
		mov	ax, si
		add	ax, 57h	; 'W'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	Camera_DestructWithMount
		add	sp, 4

loc_45A9E:
		test	di, 1
		jz	short loc_45AAB
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_45AAB:				; CODE XREF: seg097:0701j seg097:0722j
		pop	di
		pop	si
		pop	bp
		retf
seg097		ends
