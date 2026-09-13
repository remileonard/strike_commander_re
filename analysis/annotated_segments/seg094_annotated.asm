seg094		segment	byte public 'CODE' use16
		assume cs:seg094
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_43E98:				; DATA XREF: Collision_InstallExceptionHandler+Ao
		push	bp
		mov	bp, sp

loc_43E9B:				; DATA XREF: seg216:03B6o
		mov	dx, [bp+6]
		or	dx, dx
		jnz	short loc_43EB0
		push	1Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_43EB5

loc_43EB0:				; CODE XREF: seg094:0010j
		mov	ax, dx
		add	ax, 0Ch

loc_43EB5:				; CODE XREF: seg094:001Ej
		mov	ax, dx
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [si]
		add	di, 12h
		mov	eax, [di]
		mov	dword_728B6, eax
		mov	eax, [di+4]
		mov	dword_728BA, eax
		mov	eax, [di+8]
		mov	dword_728BE, eax
		push	word ptr [si]
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx+44h]
		add	sp, 6
		mov	eax, [bp-0Ch]
		mov	dword_728CE, eax
		mov	eax, [bp-8]
		mov	dword_728D2, eax
		mov	eax, [bp-4]
		mov	dword_728D6, eax
		mov	eax, dword_728B6
		add	eax, dword_728CE
		mov	dword_728E6, eax
		mov	eax, dword_728BA
		add	eax, dword_728D2
		mov	dword_728EA, eax
		mov	eax, dword_728BE
		add	eax, dword_728D6
		mov	dword_728EE, eax
		mov	di, [si+2]
		add	di, 12h
		mov	eax, [di]
		mov	dword_728C2, eax
		mov	eax, [di+4]
		mov	dword_728C6, eax
		mov	eax, [di+8]
		mov	dword_728CA, eax
		push	word ptr [si+2]
		push	ss
		lea	ax, [bp-18h]
		push	ax
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+44h]
		add	sp, 6
		mov	eax, [bp-18h]
		mov	dword_728DA, eax
		mov	eax, [bp-14h]
		mov	dword_728DE, eax
		mov	eax, [bp-10h]
		mov	dword_728E2, eax
		mov	eax, dword_728C2
		add	eax, dword_728DA
		mov	dword_728F2, eax

loc_43F85:
		mov	eax, dword_728C6
		add	eax, dword_728DE
		mov	dword_728F6, eax
		mov	eax, dword_728CA
		add	eax, dword_728E2
		mov	dword_728FA, eax
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	large dword ptr	[bp+6]
		call	CRT_NormalizeSign32
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+6],	eax
		cmp	eax, [bp+12h]
		jle	short loc_43FC9

loc_43FC3:				; CODE XREF: seg094:0151j seg094:016Bj
		mov	ax, 1
		jmp	locret_4406F
; ���������������������������������������������������������������������������

loc_43FC9:				; CODE XREF: seg094:0131j
		push	large dword ptr	[bp+0Ah]
		call	CRT_NormalizeSign32
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+0Ah], eax
		cmp	eax, [bp+12h]
		jg	short loc_43FC3
		push	large dword ptr	[bp+0Eh]
		call	CRT_NormalizeSign32
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+0Eh], eax
		cmp	eax, [bp+12h]
		jg	short loc_43FC3
		mov	eax, [bp+0Eh]
		cmp	eax, [bp+0Ah]
		jle	short loc_44013
		mov	edx, [bp+0Ah]
		mov	[bp+0Ah], eax
		mov	[bp+0Eh], edx

loc_44013:				; CODE XREF: seg094:0175j
		mov	eax, [bp+0Ah]
		cmp	eax, [bp+6]
		jle	short loc_44029
		mov	edx, [bp+6]
		mov	[bp+6],	eax
		mov	[bp+0Ah], edx

loc_44029:				; CODE XREF: seg094:018Bj
		mov	eax, [bp+0Eh]
		cmp	eax, [bp+0Ah]
		jle	short loc_4403F
		mov	edx, [bp+0Ah]
		mov	[bp+0Ah], eax
		mov	[bp+0Eh], edx

loc_4403F:				; CODE XREF: seg094:01A1j
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		mov	eax, [bp+0Ah]
		sar	eax, 1
		add	[bp-4],	eax
		mov	eax, [bp+0Eh]
		sar	eax, 2
		add	[bp-4],	eax
		mov	eax, [bp-4]
		cmp	eax, [bp+12h]
		jle	short loc_4406D
		mov	ax, 1
		jmp	short locret_4406F
; ���������������������������������������������������������������������������

loc_4406D:				; CODE XREF: seg094:01D6j
		xor	ax, ax

locret_4406F:				; CODE XREF: seg094:0136j seg094:01DBj
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,169L — résout deux objets référencés (structures via double indirection), extrait une
; position/échelle (word_6FBED cache), initialise des paramètres géométriques (magic 0x2B43) :
; préparation de deux objets pour un calcul de connexion/collision (paire d'entités).
; ==============================================================================================
Collision_PrepareObjectPair	proc far		; CODE XREF: Collision_ComputeConnectionVector+175p
					; Collision_ComputeConnectionVector+453p

var_5A		= word ptr -5Ah
var_36		= word ptr -36h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= byte ptr -28h
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 5Ah
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_36], 1B8Eh
		xor	eax, eax

loc_44083:
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax
		mov	[bp+var_28], al
		mov	[bp+var_34], 0
		mov	[bp+var_36], 1BA2h
		push	word ptr [si]
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_8]
		mov	eax, es:[bx+8]
		mov	[si+12h], eax
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_440CD
		mov	word_6FBED, 0
		mov	word ptr [si+6], ds
		mov	word ptr [si+4], 2B43h
		jmp	short loc_440D7
; ���������������������������������������������������������������������������

loc_440CD:				; CODE XREF: Collision_PrepareObjectPair+4Aj
		les	bx, [si+12h]
		mov	ax, es:[bx+14h]
		mov	word_6FBED, ax

loc_440D7:				; CODE XREF: Collision_PrepareObjectPair+5Aj
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_4411E
		les	bx, [bp+var_C]
		mov	eax, es:[bx+8]
		mov	[si+16h], eax
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_44112
		mov	word_6FBEF, 0
		mov	word ptr [si+0Ah], ds
		mov	word ptr [si+8], 2B43h
		jmp	short loc_4412C
; ���������������������������������������������������������������������������

loc_44112:				; CODE XREF: Collision_PrepareObjectPair+8Fj
		les	bx, [si+16h]
		mov	ax, es:[bx+14h]
		mov	word_6FBEF, ax
		jmp	short loc_4412C
; ���������������������������������������������������������������������������

loc_4411E:				; CODE XREF: Collision_PrepareObjectPair+7Cj
		mov	dword ptr [si+16h], 0
		mov	word_6FBEF, 0

loc_4412C:				; CODE XREF: Collision_PrepareObjectPair+9Fj
					; Collision_PrepareObjectPair+ABj
		cmp	word_6FBED, 0
		jnz	short loc_4414F
		cmp	dword_6FBE5, 0
		jle	short loc_4414F
		cmp	word_6FBEF, 0
		jnz	short loc_4414F
		cmp	dword_6FBE9, 0
		jle	short loc_4414F

loc_4414A:				; CODE XREF: Collision_PrepareObjectPair+151j
		mov	al, 1
		jmp	loc_441D9
; ���������������������������������������������������������������������������

loc_4414F:				; CODE XREF: Collision_PrepareObjectPair+C0j
					; Collision_PrepareObjectPair+C8j ...
		cmp	word_6FBED, 0
		jnz	short loc_44189
		push	ds
		push	offset aBigspher_0 ; "BIGSPHER"
		push	3748h
		mov	eax, dword_6FBE5
		mov	[bp+var_10], eax
		shl	eax, 8
		mov	[bp+var_14], eax
		lea	ax, [bp+var_14]
		push	ax
		push	ss
		lea	ax, [bp+var_36]
		push	ax
		call	Particle_Init
		add	sp, 0Ch
		lea	ax, [bp+var_36]
		mov	word ptr [bp+var_4+2], ss
		mov	word ptr [bp+var_4], ax
		jmp	short loc_441D0
; ���������������������������������������������������������������������������

loc_44189:				; CODE XREF: Collision_PrepareObjectPair+E3j
		les	bx, [si+12h]
		mov	eax, es:[bx]
		jmp	short loc_441CC
; ���������������������������������������������������������������������������

loc_44192:				; CODE XREF: Collision_PrepareObjectPair+164j
		push	word ptr [si]
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_16], ax
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		push	si
		push	5806h
		lea	ax, [bp+var_5A]
		push	ax
		push	large [bp+var_4]
		call	Explosion_CreateFireball
		add	sp, 0Ah
		or	al, al
		jnz	short loc_4414A
		les	bx, [bp+var_4]
		mov	eax, es:[bx+2]

loc_441CC:				; CODE XREF: Collision_PrepareObjectPair+11Fj
		mov	[bp+var_4], eax

loc_441D0:				; CODE XREF: Collision_PrepareObjectPair+116j
		cmp	[bp+var_4], 0
		jnz	short loc_44192
		mov	al, 0

loc_441D9:				; CODE XREF: Collision_PrepareObjectPair+DBj
		pop	si
		leave
		retf
Collision_PrepareObjectPair	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,427L — calcule le vecteur direction entre deux points d'attache de deux objets
; référencés (dword_6FBE5/E9, réutilise les globals de cache du seg080/effets), normalise
; (sub_54F57) : candidat pour le calcul de connexion visuelle entre deux objets (câble de
; ravitaillement en vol, ou rayon de liaison), ou traitement de collision entre paires
; d'objets, à approfondir.
; ==============================================================================================
Collision_ComputeConnectionVector	proc far		; CODE XREF: Collision_NarrowPhaseTest+A3p

var_126		= dword	ptr -126h
var_122		= dword	ptr -122h
var_11E		= dword	ptr -11Eh
var_11A		= dword	ptr -11Ah
var_116		= dword	ptr -116h
var_112		= dword	ptr -112h
var_10E		= dword	ptr -10Eh
var_10A		= dword	ptr -10Ah
var_106		= dword	ptr -106h
var_102		= dword	ptr -102h
var_FE		= dword	ptr -0FEh
var_FA		= dword	ptr -0FAh
var_F6		= dword	ptr -0F6h
var_F2		= dword	ptr -0F2h
var_EE		= dword	ptr -0EEh
var_EA		= dword	ptr -0EAh
var_E6		= dword	ptr -0E6h
var_E2		= dword	ptr -0E2h
var_DE		= dword	ptr -0DEh
var_DA		= dword	ptr -0DAh
var_D6		= dword	ptr -0D6h
var_D2		= dword	ptr -0D2h
var_CE		= dword	ptr -0CEh
var_CA		= dword	ptr -0CAh
var_C6		= dword	ptr -0C6h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
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
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 126h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	eax, dword_6FBE5
		add	eax, dword_6FBE9
		mov	[bp+var_6], eax
		mov	di, [si]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_72], eax
		mov	eax, [di+4]
		mov	[bp+var_6E], eax
		mov	eax, [di+8]
		mov	[bp+var_6A], eax
		mov	di, [si+2]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_7E], eax
		mov	eax, [di+4]
		mov	[bp+var_7A], eax
		mov	eax, [di+8]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_72]
		sub	eax, [bp+var_7E]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_6E]
		sub	eax, [bp+var_7A]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_6A]
		sub	eax, [bp+var_76]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_82], eax
		lea	ax, [bp+var_8A]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		push	word ptr [si+2]
		push	ss
		lea	ax, [bp+var_AE]
		push	ax
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	word ptr [si]
		push	ss
		lea	ax, [bp+var_BA]
		push	ax
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_AE]
		sub	eax, [bp+var_BA]
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_AA]
		sub	eax, [bp+var_B6]
		mov	[bp+var_C2], eax
		mov	eax, [bp+var_A6]
		sub	eax, [bp+var_B2]
		mov	[bp+var_BE], eax
		mov	eax, [bp+var_C6]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_C2]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_BE]
		mov	[bp+var_9A], eax
		lea	ax, [bp+var_8A]
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		push	ss
		lea	ax, [bp+var_12]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	eax, [bp+var_A]
		sar	eax, 8
		cmp	eax, [bp+var_6]
		jge	short loc_44358
		mov	eax, [bp+var_72]
		mov	dword_728B6, eax
		mov	eax, [bp+var_6E]
		mov	dword_728BA, eax
		mov	eax, [bp+var_6A]
		mov	dword_728BE, eax
		mov	eax, [bp+var_7E]
		mov	dword_728C2, eax
		mov	eax, [bp+var_7A]
		mov	dword_728C6, eax
		mov	eax, [bp+var_76]
		mov	dword_728CA, eax
		push	si
		push	cs
		call	near ptr Collision_PrepareObjectPair
		pop	cx
		mov	[bp+var_1], al

loc_44358:				; CODE XREF: Collision_ComputeConnectionVector+141j
		lea	ax, [bp+var_A2]
		push	ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		call	Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		cmp	[bp+var_16], 0
		jle	short loc_44376
		mov	ax, 1
		jmp	short loc_44378
; ���������������������������������������������������������������������������

loc_44376:				; CODE XREF: Collision_ComputeConnectionVector+193j
		xor	ax, ax

loc_44378:				; CODE XREF: Collision_ComputeConnectionVector+198j
		or	al, al
		jnz	short loc_4437F
		jmp	loc_44636
; ���������������������������������������������������������������������������

loc_4437F:				; CODE XREF: Collision_ComputeConnectionVector+19Ej
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jz	short loc_4438B
		jmp	loc_44636
; ���������������������������������������������������������������������������

loc_4438B:				; CODE XREF: Collision_ComputeConnectionVector+1AAj
		cmp	[bp+var_12], 5A00h
		jge	short loc_4439A
		mov	ax, 1
		jmp	short loc_4439C
; ���������������������������������������������������������������������������

loc_4439A:				; CODE XREF: Collision_ComputeConnectionVector+1B7j
		xor	ax, ax

loc_4439C:				; CODE XREF: Collision_ComputeConnectionVector+1BCj
		or	al, al
		jnz	short loc_443A3
		jmp	loc_44636
; ���������������������������������������������������������������������������

loc_443A3:				; CODE XREF: Collision_ComputeConnectionVector+1C2j
		lea	ax, [bp+var_12]
		push	ax
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		call	Math_Cos_54876
		add	sp, 6
		mov	eax, [bp+var_A]
		mov	edx, [bp+var_1E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_1A], eax
		sar	eax, 8
		cmp	eax, [bp+var_6]
		jl	short loc_443DD
		jmp	loc_44636
; ���������������������������������������������������������������������������

loc_443DD:				; CODE XREF: Collision_ComputeConnectionVector+1FCj
		lea	ax, [bp+var_12]
		push	ax
		push	ss
		lea	ax, [bp+var_2A]
		push	ax
		call	Math_Sin_5483F
		add	sp, 6
		mov	eax, [bp+var_A]
		mov	edx, [bp+var_2A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_26], eax
		mov	eax, dword_70458
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_26]
		cmp	eax, [bp+var_32]
		jle	short loc_44435
		mov	ax, 1
		jmp	short loc_44437
; ���������������������������������������������������������������������������

loc_44435:				; CODE XREF: Collision_ComputeConnectionVector+252j
		xor	ax, ax

loc_44437:				; CODE XREF: Collision_ComputeConnectionVector+257j
		or	al, al
		jz	short loc_44443
		mov	eax, [bp+var_32]
		mov	[bp+var_26], eax

loc_44443:				; CODE XREF: Collision_ComputeConnectionVector+25Dj
		mov	eax, [bp+var_26]
		mov	edx, eax
		mov	ecx, [bp+var_16]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_26], eax
		push	word ptr [si]
		push	ss
		lea	ax, [bp+var_D2]
		push	ax
		mov	bx, [si]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_D2]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_CE]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_CA]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_DA], eax
		mov	eax, [bp+var_4E]
		mov	[bp+var_D6], eax
		mov	eax, [bp+var_72]
		add	eax, [bp+var_DE]
		mov	[bp+var_EA], eax
		mov	eax, [bp+var_6E]
		add	eax, [bp+var_DA]
		mov	[bp+var_E6], eax
		mov	eax, [bp+var_6A]
		add	eax, [bp+var_D6]
		mov	[bp+var_E2], eax
		mov	eax, [bp+var_EA]
		mov	[bp+var_F6], eax
		mov	eax, [bp+var_E6]
		mov	[bp+var_F2], eax
		mov	eax, [bp+var_E2]
		mov	[bp+var_EE], eax
		mov	eax, [bp+var_F6]
		mov	dword_728B6, eax
		mov	eax, [bp+var_F2]
		mov	dword_728BA, eax
		mov	eax, [bp+var_EE]
		mov	dword_728BE, eax
		push	word ptr [si+2]
		push	ss
		lea	ax, [bp+var_102]
		push	ax
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_102]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_52], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_FE]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_FA]
		mov	edx, [bp+var_26]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_62], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_66], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_10E], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_10A], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_106], eax
		mov	eax, [bp+var_7E]
		add	eax, [bp+var_10E]
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_7A]
		add	eax, [bp+var_10A]
		mov	[bp+var_116], eax
		mov	eax, [bp+var_76]
		add	eax, [bp+var_106]
		mov	[bp+var_112], eax
		mov	eax, [bp+var_11A]
		mov	[bp+var_126], eax
		mov	eax, [bp+var_116]
		mov	[bp+var_122], eax
		mov	eax, [bp+var_112]
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_126]
		mov	dword_728C2, eax
		mov	eax, [bp+var_122]
		mov	dword_728C6, eax
		mov	eax, [bp+var_11E]
		mov	dword_728CA, eax
		push	si
		push	cs
		call	near ptr Collision_PrepareObjectPair
		pop	cx
		mov	[bp+var_1], al

loc_44636:				; CODE XREF: Collision_ComputeConnectionVector+1A0j
					; Collision_ComputeConnectionVector+1ACj ...
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
Collision_ComputeConnectionVector	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,19L — installe un gestionnaire (sub_1069, vecteur 0x1A0000F) avec un pointeur de code
; fixe : installation d'un handler d'exception/interruption spécifique.
; ==============================================================================================
Collision_InstallExceptionHandler	proc far		; CODE XREF: seg112:0C9EP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	seg seg094
		push	offset loc_43E98
		push	large 1000Fh
		push	large 1A0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si], ax
		pop	si
		pop	bp
		retf
Collision_InstallExceptionHandler	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,31L — remet à zéro 15 entrées de 0x1A octets (deux champs 16-bit + deux flags) :
; réinitialisation d'un pool de 15 slots (probable pool de connexions/liaisons entre objets).
; ==============================================================================================
Collision_ResetLinkPool	proc far		; CODE XREF: UIScreen_ReadNumericFields_500A6+6P seg112:0CA7P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+2], 0
		mov	si, [si]
		xor	dx, dx
		jmp	short loc_44688
; ���������������������������������������������������������������������������

loc_44675:				; CODE XREF: Collision_ResetLinkPool+28j
		xor	ax, ax
		mov	[si+2],	ax
		mov	[si], ax
		mov	al, 0
		mov	[si+11h], al
		mov	[si+10h], al
		inc	dx
		add	si, 1Ah

loc_44688:				; CODE XREF: Collision_ResetLinkPool+10j
		cmp	dx, 0Fh
		jl	short loc_44675
		pop	si
		pop	bp
		retf
Collision_ResetLinkPool	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,21L — construit une chaîne (sub_5C6F3, longueur 2) : initialisation d'un petit
; descripteur texte.
; ==============================================================================================
Collision_InitDescriptorText	proc far		; CODE XREF: World_ParseWrldForm_A767F+21FP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	0
		push	2
		push	large 81Ah
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+6],	dx
		mov	[si+4],	ax
		pop	si
		pop	bp
		retf
Collision_InitDescriptorText	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,25L — libère une ressource (sub_338) et une chaîne (sub_5C7B6) : destructeur d'un
; descripteur avec ressource et texte.
; ==============================================================================================
Collision_DestructDescriptor	proc far		; CODE XREF: seg112:0D8BP
					; MissionLoader_AssignUnitRoster_A7D46+E8P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si]
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si], 0
		push	0
		push	2
		mov	ax, si
		add	ax, 4
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		pop	si
		pop	bp
		retf
Collision_DestructDescriptor	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,27L — remet à zéro une grille 8×8 de cellules (2 mots par cellule) : réinitialisation
; d'une grille spatiale de collision à 64 cellules.
; ==============================================================================================
CollisionGrid_ResetCells	proc far		; CODE XREF: CollisionGrid_InitAroundPlayer+21p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+104h], 0
		xor	dx, dx
		jmp	short loc_4470A
; ���������������������������������������������������������������������������

loc_446F3:				; CODE XREF: CollisionGrid_ResetCells+2Bj
		mov	ax, dx
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	word ptr es:[bx+6], 0
		mov	word ptr es:[bx+4], 0
		inc	dx

loc_4470A:				; CODE XREF: CollisionGrid_ResetCells+Fj
		cmp	dx, 40h	; '@'
		jl	short loc_446F3
		pop	bp
		retf
CollisionGrid_ResetCells	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,62L — insère un élément en tête d'une des 64 cellules de la grille spatiale (indexée
; si), avec garde-fou de dépassement de capacité (>0x12C, déclenche sub_6B70F, probable
; assertion) : insertion d'un élément dans une cellule de la grille spatiale de collision.
; ==============================================================================================
CollisionGrid_InsertElement	proc far		; CODE XREF: CollisionGrid_InsertByPosition+170p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+104h], 12Ch
		jl	short loc_44730
		push	0FACEh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_44730:				; CODE XREF: CollisionGrid_InsertElement+14j
		or	si, si
		jl	short loc_4479A
		cmp	si, 40h	; '@'
		jge	short loc_4479A
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+104h]
		inc	word ptr es:[bx+104h]
		imul	ax, 6
		mov	dx, word ptr [bp+arg_0+2]
		add	bx, ax
		add	bx, 106h
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], bx
		mov	ax, si
		shl	ax, 2
		mov	bx, word ptr [bp+arg_0]
		add	bx, ax
		mov	ax, word ptr [bp+var_8+2]
		mov	dx, word ptr [bp+var_8]
		mov	es:[bx+6], ax
		mov	es:[bx+4], dx
		les	bx, [bp+var_8]
		mov	ax, [bp+arg_6]
		mov	es:[bx], ax
		mov	eax, [bp+var_4]
		mov	es:[bx+2], eax

loc_4479A:				; CODE XREF: CollisionGrid_InsertElement+21j
					; CollisionGrid_InsertElement+26j
		pop	si
		leave
		retf
CollisionGrid_InsertElement	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,143L — variante de sub_44711 gérant l'insertion avec calcul d'index par décalage (>>8)
; et test de capacité : insertion d'un élément dans la grille spatiale avec résolution d'index
; par position.
; ==============================================================================================
CollisionGrid_InsertByPosition	proc far		; CODE XREF: CollisionGrid_InitAroundPlayer+69p

var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		test	byte ptr [si+4], 2
		jnz	short loc_447B1
		jmp	loc_44913
; ���������������������������������������������������������������������������

loc_447B1:				; CODE XREF: CollisionGrid_InsertByPosition+Fj
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+104h], 12Ch
		jl	short loc_447C6
		push	0FACEh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_447C6:				; CODE XREF: CollisionGrid_InsertByPosition+1Ej
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_8]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		les	bx, [bp+var_C]
		mov	eax, es:[bx]
		sar	eax, 8
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 100h
		jle	short loc_44841
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+104h]
		inc	word ptr es:[bx+104h]
		imul	ax, 6
		mov	dx, word ptr [bp+arg_0+2]
		add	bx, ax
		add	bx, 106h
		mov	word ptr [bp+var_1E+2],	dx
		mov	word ptr [bp+var_1E], bx
		mov	es, word ptr [bp+var_1E+2]
		mov	es:[bx], si
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		les	bx, [bp+var_1E]
		mov	es:[bx+2], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_1E]
		mov	es:[bx], eax
		jmp	loc_44913
; ���������������������������������������������������������������������������

loc_44841:				; CODE XREF: CollisionGrid_InsertByPosition+60j
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 80Eh
		mov	word ptr [bp+var_18+2],	ax
		mov	word ptr [bp+var_18], dx
		les	di, [bp+var_18]
		mov	eax, es:[di]
		mov	[bp+var_2A], eax
		mov	eax, es:[di+4]
		mov	[bp+var_26], eax
		mov	eax, es:[di+8]
		mov	[bp+var_22], eax
		mov	eax, [si+12h]
		sub	eax, [bp+var_2A]
		sar	eax, 8
		mov	[bp+var_10], eax
		add	[bp+var_10], 480h
		cmp	[bp+var_10], 0
		jge	short loc_44895
		mov	[bp+var_10], 0

loc_44895:				; CODE XREF: CollisionGrid_InsertByPosition+EEj
		cmp	[bp+var_10], 800h
		jl	short loc_448A7
		mov	[bp+var_10], 7FFh

loc_448A7:				; CODE XREF: CollisionGrid_InsertByPosition+100j
		mov	eax, [bp+var_10]
		sar	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [si+16h]
		sub	eax, [bp+var_26]
		sar	eax, 8
		mov	[bp+var_14], eax
		add	[bp+var_14], 480h
		cmp	[bp+var_14], 0
		jge	short loc_448DA
		mov	[bp+var_14], 0

loc_448DA:				; CODE XREF: CollisionGrid_InsertByPosition+133j
		cmp	[bp+var_14], 800h
		jl	short loc_448EC
		mov	[bp+var_14], 7FFh

loc_448EC:				; CODE XREF: CollisionGrid_InsertByPosition+145j
		mov	eax, [bp+var_14]
		sar	eax, 8
		mov	[bp+var_14], eax
		mov	ax, word ptr [bp+var_14]
		shl	ax, 3
		mov	dx, word ptr [bp+var_10]
		add	dx, ax
		mov	[bp+var_1A], dx
		push	si
		push	dx
		push	large [bp+arg_0]
		push	cs
		call	near ptr CollisionGrid_InsertElement
		add	sp, 8

loc_44913:				; CODE XREF: CollisionGrid_InsertByPosition+11j
					; CollisionGrid_InsertByPosition+A1j
		pop	di
		pop	si
		leave
		retf
CollisionGrid_InsertByPosition	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,175L — parcourt une sous-grille locale (8×8, décalage bit à bit), teste chaque cellule
; et appelle sub_44A70 pour chaque paire candidate : parcours de la grille spatiale de
; collision pour détecter les paires d'objets proches (broad-phase).
; ==============================================================================================
CollisionGrid_BroadPhaseScan	proc far		; CODE XREF: CollisionGrid_InitAroundPlayer+92p

var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		xor	si, si
		jmp	loc_44A64
; ���������������������������������������������������������������������������

loc_44924:				; CODE XREF: CollisionGrid_BroadPhaseScan+152j
		xor	di, di
		jmp	loc_44A5B
; ���������������������������������������������������������������������������

loc_44929:				; CODE XREF: CollisionGrid_BroadPhaseScan+149j
		mov	ax, si
		shl	ax, 3
		mov	dx, di
		add	dx, ax
		mov	[bp+var_2], dx
		mov	ax, [bp+var_2]
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		jmp	loc_44A50
; ���������������������������������������������������������������������������

loc_44951:				; CODE XREF: CollisionGrid_BroadPhaseScan+140j
		les	bx, [bp+var_6]
		mov	ax, es:[bx]
		mov	[bp+var_8], ax
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx], 0
		jz	short loc_44975
		push	large dword ptr	es:[bx]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Collision_NarrowPhaseTest
		add	sp, 0Ah

loc_44975:				; CODE XREF: CollisionGrid_BroadPhaseScan+4Bj
		les	bx, [bp+var_6]
		mov	eax, es:[bx+2]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0
		jz	short loc_4499B
		push	large [bp+var_C]
		push	[bp+var_8]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Collision_NarrowPhaseTest
		add	sp, 0Ah

loc_4499B:				; CODE XREF: CollisionGrid_BroadPhaseScan+6Fj
		cmp	di, 7
		jge	short loc_44A0B
		mov	ax, [bp+var_2]
		inc	ax
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		cmp	[bp+var_C], 0
		jz	short loc_449D2
		push	ax
		push	dx
		push	[bp+var_8]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Collision_NarrowPhaseTest
		add	sp, 0Ah

loc_449D2:				; CODE XREF: CollisionGrid_BroadPhaseScan+A8j
		cmp	si, 7
		jge	short loc_44A0B
		mov	ax, [bp+var_2]
		add	ax, 9
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		cmp	[bp+var_C], 0
		jz	short loc_44A0B
		push	ax
		push	dx
		push	[bp+var_8]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Collision_NarrowPhaseTest
		add	sp, 0Ah

loc_44A0B:				; CODE XREF: CollisionGrid_BroadPhaseScan+87j
					; CollisionGrid_BroadPhaseScan+BEj ...
		cmp	si, 7
		jge	short loc_44A44
		mov	ax, [bp+var_2]
		add	ax, 8
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		cmp	[bp+var_C], 0
		jz	short loc_44A44
		push	ax
		push	dx
		push	[bp+var_8]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Collision_NarrowPhaseTest
		add	sp, 0Ah

loc_44A44:				; CODE XREF: CollisionGrid_BroadPhaseScan+F7j
					; CollisionGrid_BroadPhaseScan+11Aj
		les	bx, [bp+var_6]
		mov	eax, es:[bx+2]
		mov	[bp+var_6], eax

loc_44A50:				; CODE XREF: CollisionGrid_BroadPhaseScan+37j
		cmp	[bp+var_6], 0
		jz	short loc_44A5A
		jmp	loc_44951
; ���������������������������������������������������������������������������

loc_44A5A:				; CODE XREF: CollisionGrid_BroadPhaseScan+13Ej
		inc	di

loc_44A5B:				; CODE XREF: CollisionGrid_BroadPhaseScan+Fj
		cmp	di, 8
		jge	short loc_44A63
		jmp	loc_44929
; ���������������������������������������������������������������������������

loc_44A63:				; CODE XREF: CollisionGrid_BroadPhaseScan+147j
		inc	si

loc_44A64:				; CODE XREF: CollisionGrid_BroadPhaseScan+Aj
		cmp	si, 8
		jge	short loc_44A6C
		jmp	loc_44924
; ���������������������������������������������������������������������������

loc_44A6C:				; CODE XREF: CollisionGrid_BroadPhaseScan+150j
		pop	di
		pop	si
		leave
		retf
CollisionGrid_BroadPhaseScan	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,123L — teste une limite de concurrence (word_72B44 < 15), compare des flags de catégorie
; (bits 0x20/0x4) entre deux objets, filtre par type (masque 0x6F) : test de collision
; détaillé (narrow-phase) entre deux objets de la grille spatiale, filtré par catégorie.
; ==============================================================================================
Collision_NarrowPhaseTest	proc far		; CODE XREF: CollisionGrid_BroadPhaseScan+58p
					; CollisionGrid_BroadPhaseScan+7Ep ...

var_2		= word ptr -2
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_4]
		jmp	loc_44B2B
; ���������������������������������������������������������������������������

loc_44A7E:				; CODE XREF: Collision_NarrowPhaseTest+C2j
		cmp	word_72B44, 0Fh
		jl	short loc_44A88
		jmp	loc_44B35
; ���������������������������������������������������������������������������

loc_44A88:				; CODE XREF: Collision_NarrowPhaseTest+13j
		les	bx, [bp+arg_6]
		mov	di, es:[bx]
		mov	al, [si+4]
		and	al, 20h
		mov	ah, 0
		or	ax, ax
		jz	short loc_44AA4
		mov	al, [di+4]
		and	al, 20h
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44B1F

loc_44AA4:				; CODE XREF: Collision_NarrowPhaseTest+27j
		test	byte ptr [si+4], 4
		jnz	short loc_44AB0
		test	byte ptr [di+4], 4
		jz	short loc_44B1F

loc_44AB0:				; CODE XREF: Collision_NarrowPhaseTest+38j
		mov	al, byte_72356
		mov	ah, 0
		or	ax, ax
		jnz	short loc_44AF5
		mov	al, [si+4]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh	; 'N'
		jnz	short loc_44ACB
		mov	ax, 1
		jmp	short loc_44ACD
; ���������������������������������������������������������������������������

loc_44ACB:				; CODE XREF: Collision_NarrowPhaseTest+54j
		xor	ax, ax

loc_44ACD:				; CODE XREF: Collision_NarrowPhaseTest+59j
		or	al, al
		jz	short loc_44AF5
		mov	al, [di+4]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh	; 'N'
		jnz	short loc_44AE3
		mov	ax, 1
		jmp	short loc_44AE5
; ���������������������������������������������������������������������������

loc_44AE3:				; CODE XREF: Collision_NarrowPhaseTest+6Cj
		xor	ax, ax

loc_44AE5:				; CODE XREF: Collision_NarrowPhaseTest+71j
		or	al, al
		jz	short loc_44AF5
		cmp	si, word_722E6
		jz	short loc_44B1F
		cmp	di, word_722E6
		jz	short loc_44B1F

loc_44AF5:				; CODE XREF: Collision_NarrowPhaseTest+47j
					; Collision_NarrowPhaseTest+5Fj ...
		mov	ax, word_72B44
		imul	ax, 1Ah
		mov	dx, word_72B42
		add	dx, ax
		mov	[bp+var_2], dx
		push	di
		push	si
		push	dx
		nop
		push	cs
		call	near ptr Collision_PrepareContext
		add	sp, 6
		push	[bp+var_2]
		push	cs
		call	near ptr Collision_ComputeConnectionVector
		pop	cx
		or	al, al
		jz	short loc_44B1F
		inc	word_72B44

loc_44B1F:				; CODE XREF: Collision_NarrowPhaseTest+32j
					; Collision_NarrowPhaseTest+3Ej ...
		les	bx, [bp+arg_6]
		mov	eax, es:[bx+2]
		mov	[bp+arg_6], eax

loc_44B2B:				; CODE XREF: Collision_NarrowPhaseTest+Bj
		cmp	[bp+arg_6], 0
		jz	short loc_44B35
		jmp	loc_44A7E
; ���������������������������������������������������������������������������

loc_44B35:				; CODE XREF: Collision_NarrowPhaseTest+15j
					; Collision_NarrowPhaseTest+C0j
		pop	di
		pop	si
		leave
		retf
Collision_NarrowPhaseTest	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,77L — insère le joueur (word_722E6) dans la grille spatiale (sub_446E2 reset, sub_4479D
; insert), parcourt une liste liée pour chaque cellule concernée : initialisation de la grille
; spatiale de collision centrée sur le joueur, insertion de tous les objets pertinents à
; chaque frame.
; ==============================================================================================
CollisionGrid_InitAroundPlayer	proc far		; CODE XREF: UIScreen_ReadNumericFields_500A6+32P

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word_722E6, 0
		jnz	short loc_44B4E
		jmp	loc_44BD1
; ���������������������������������������������������������������������������

loc_44B4E:				; CODE XREF: CollisionGrid_InitAroundPlayer+10j
		mov	di, word_722E6
		add	di, 12h
		push	large dword ptr	[si+4]
		push	cs
		call	near ptr CollisionGrid_ResetCells
		add	sp, 4
		mov	eax, [di]
		les	bx, [si+4]
		mov	es:[bx+80Eh], eax
		mov	eax, [di+4]
		mov	es:[bx+812h], eax
		mov	eax, [di+8]
		mov	es:[bx+816h], eax
		mov	ax, [si+4]
		add	ax, 80Eh
		mov	dword ptr es:[bx], 0
		mov	ax, word_72A73
		mov	[bp+var_2], ax
		xor	di, di
		jmp	short loc_44BC0
; ���������������������������������������������������������������������������

loc_44B98:				; CODE XREF: CollisionGrid_InitAroundPlayer+8Bj
		or	di, di
		jz	short loc_44BAD
		push	di
		push	large dword ptr	[si+4]
		push	cs
		call	near ptr CollisionGrid_InsertByPosition
		add	sp, 6
		mov	di, [di+2]
		jmp	short loc_44BB3
; ���������������������������������������������������������������������������

loc_44BAD:				; CODE XREF: CollisionGrid_InitAroundPlayer+61j
		mov	bx, [bp+var_2]
		mov	di, [bx+0Bh]

loc_44BB3:				; CODE XREF: CollisionGrid_InitAroundPlayer+72j
		or	di, di
		jnz	short loc_44BC0
		mov	bx, [bp+var_2]
		mov	ax, [bx+9]
		mov	[bp+var_2], ax

loc_44BC0:				; CODE XREF: CollisionGrid_InitAroundPlayer+5Dj
					; CollisionGrid_InitAroundPlayer+7Cj
		cmp	[bp+var_2], 0
		jnz	short loc_44B98
		push	large dword ptr	[si+4]
		push	cs
		call	near ptr CollisionGrid_BroadPhaseScan
		add	sp, 4

loc_44BD1:				; CODE XREF: CollisionGrid_InitAroundPlayer+12j
		pop	di
		pop	si
		leave
		retf
CollisionGrid_InitAroundPlayer	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,187L — parcourt jusqu'à 15 candidats (limite word_70474/word_72A73), teste un flag de
; type (+4 bit2) puis calcule le contexte de collision (sub_44DB9) : orchestrateur secondaire
; du système de collision, sélection des candidats prioritaires avant test détaillé.
; ==============================================================================================
Collision_SelectCandidates	proc far		; CODE XREF: UIScreen_ReadNumericFields_500A6+1CP

var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_17		= byte ptr -17h
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0Fh
		jl	short loc_44BE9
		jmp	loc_44D2E
; ���������������������������������������������������������������������������

loc_44BE9:				; CODE XREF: Collision_SelectCandidates+Fj
		mov	[bp+var_2], 0
		mov	ax, word_70474
		mov	[bp+var_4], ax
		mov	ax, word_72A73
		mov	[bp+var_6], ax
		jmp	loc_44D25
; ���������������������������������������������������������������������������

loc_44BFD:				; CODE XREF: Collision_SelectCandidates+156j
		cmp	[bp+var_2], 0
		jnz	short loc_44C06
		jmp	loc_44D11
; ���������������������������������������������������������������������������

loc_44C06:				; CODE XREF: Collision_SelectCandidates+2Cj
		mov	di, [bp+var_2]
		test	byte ptr [di+4], 4
		jnz	short loc_44C12
		jmp	loc_44D09
; ���������������������������������������������������������������������������

loc_44C12:				; CODE XREF: Collision_SelectCandidates+38j
		push	0
		mov	[bp+var_E], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_32], eax
		mov	[bp+var_12], 0
		mov	eax, [bp+var_12]
		mov	[bp+var_2E], eax
		mov	[bp+var_16], 100h
		mov	eax, [bp+var_16]
		mov	[bp+var_2A], eax
		lea	ax, [bp+var_32]
		push	ax
		mov	ax, di
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	bx, word_70474
		mov	al, [bx+207h]
		mov	[bp+var_17], al
		mov	al, [di+4]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh	; 'N'
		jnz	short loc_44C7C
		mov	ax, 1
		jmp	short loc_44C7E
; ���������������������������������������������������������������������������

loc_44C7C:				; CODE XREF: Collision_SelectCandidates+A0j
		xor	ax, ax

loc_44C7E:				; CODE XREF: Collision_SelectCandidates+A5j
		or	al, al
		jz	short loc_44CD1
		cmp	[bp+var_17], 0
		jz	short loc_44CA0
		push	di
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	Gauge_ComputeNeedlePosition
		add	sp, 6
		mov	eax, [bp+var_A]
		add	eax, [bp+var_1C]
		jmp	short loc_44CCD
; ���������������������������������������������������������������������������

loc_44CA0:				; CODE XREF: Collision_SelectCandidates+B1j
		push	word ptr [di+51h]
		mov	bx, [di+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 5
		and	ax, 1
		or	al, al
		jnz	short loc_44CD1
		mov	eax, [di+1Ah]
		add	eax, 0FFFFDD00h
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax

loc_44CCD:				; CODE XREF: Collision_SelectCandidates+C9j
		mov	[bp+var_A], eax

loc_44CD1:				; CODE XREF: Collision_SelectCandidates+ABj
					; Collision_SelectCandidates+E4j
		mov	eax, [di+1Ah]
		cmp	eax, [bp+var_A]
		jge	short loc_44CE0
		mov	ax, 1
		jmp	short loc_44CE2
; ���������������������������������������������������������������������������

loc_44CE0:				; CODE XREF: Collision_SelectCandidates+104j
		xor	ax, ax

loc_44CE2:				; CODE XREF: Collision_SelectCandidates+109j
		or	al, al
		jz	short loc_44D09
		cmp	word ptr [si+2], 0Fh
		jge	short loc_44D2E
		mov	ax, [si+2]
		imul	ax, 1Ah
		mov	dx, [si]
		add	dx, ax
		mov	[bp+var_26], dx
		push	[bp+var_4]
		push	di
		push	dx
		nop
		push	cs
		call	near ptr Collision_PrepareContext
		add	sp, 6
		inc	word ptr [si+2]

loc_44D09:				; CODE XREF: Collision_SelectCandidates+3Aj
					; Collision_SelectCandidates+10Fj
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		jmp	short loc_44D17
; ���������������������������������������������������������������������������

loc_44D11:				; CODE XREF: Collision_SelectCandidates+2Ej
		mov	bx, [bp+var_6]
		mov	ax, [bx+0Bh]

loc_44D17:				; CODE XREF: Collision_SelectCandidates+13Aj
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_44D25
		mov	[bp+var_6], 0

loc_44D25:				; CODE XREF: Collision_SelectCandidates+25j
					; Collision_SelectCandidates+149j
		cmp	[bp+var_6], 0
		jz	short loc_44D2E
		jmp	loc_44BFD
; ���������������������������������������������������������������������������

loc_44D2E:				; CODE XREF: Collision_SelectCandidates+11j
					; Collision_SelectCandidates+115j ...
		pop	di
		pop	si
		leave
		retf
Collision_SelectCandidates	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,52L — parcourt une table (pas 0x1A octets) et retire les entrées correspondant à une
; valeur donnée : retrait sélectif d'entrées d'une table de liaisons/connexions par
; identifiant.
; ==============================================================================================
CollisionLink_RemoveByID	proc far		; CODE XREF: Collision_MainLoop+E9p
					; Collision_MainLoop+13Dp

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		inc	cx
		mov	ax, cx
		imul	ax, 1Ah
		mov	di, [si]
		add	di, ax
		jmp	short loc_44D74
; ���������������������������������������������������������������������������

loc_44D4C:				; CODE XREF: CollisionLink_RemoveByID+45j
		mov	ax, [di]
		mov	[bp+var_2], ax
		mov	ax, [di+2]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		cmp	ax, [bp+arg_4]
		jz	short loc_44D67
		mov	ax, [bp+var_4]
		cmp	ax, [bp+arg_4]
		jnz	short loc_44D70

loc_44D67:				; CODE XREF: CollisionLink_RemoveByID+2Bj
		mov	word ptr [di], 0
		mov	word ptr [di+2], 0

loc_44D70:				; CODE XREF: CollisionLink_RemoveByID+33j
		inc	cx
		add	di, 1Ah

loc_44D74:				; CODE XREF: CollisionLink_RemoveByID+18j
		cmp	[si+2],	cx
		jg	short loc_44D4C
		pop	di
		pop	si
		leave
		retf
CollisionLink_RemoveByID	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		mov	cx, [bp+8]
		mov	di, [si]
		xor	dx, dx
		jmp	short loc_44DAE
; ���������������������������������������������������������������������������

loc_44D91:				; CODE XREF: seg094:0F21j
		mov	ax, [di]
		mov	[bp-2],	ax
		mov	ax, [di+2]
		mov	[bp-4],	ax
		cmp	[bp-2],	cx
		jz	short loc_44DA6
		cmp	[bp-4],	cx
		jnz	short loc_44DAA

loc_44DA6:				; CODE XREF: seg094:0F0Fj
		mov	al, 1
		jmp	short loc_44DB5
; ���������������������������������������������������������������������������

loc_44DAA:				; CODE XREF: seg094:0F14j
		inc	dx
		add	di, 1Ah

loc_44DAE:				; CODE XREF: seg094:0EFFj
		cmp	[si+2],	dx
		jg	short loc_44D91
		mov	al, 0

loc_44DB5:				; CODE XREF: seg094:0F18j
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,132L — met en cache une position de référence (dword_728B6/BA/BE) et une échelle
; (dword_6FBE5), résout une transformation (vtable[0x44]) : préparation d'un contexte de
; collision/rendu pour une paire d'objets détectée.
; ==============================================================================================
Collision_PrepareContext	proc far		; CODE XREF: Collision_NarrowPhaseTest+99p
					; Collision_SelectCandidates+12Bp

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
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	[si+0Ch], eax
		mov	[si], di
		mov	dx, di
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	dword_728B6, eax
		mov	eax, [bx+4]
		mov	dword_728BA, eax
		mov	eax, [bx+8]
		mov	dword_728BE, eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		les	bx, [bp+var_C]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx+10h]
		sar	eax, 8
		mov	dword_6FBE5, eax
		push	di
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+44h]
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	dword_728CE, eax
		mov	eax, [bp+var_18]
		mov	dword_728D2, eax
		mov	eax, [bp+var_14]
		mov	dword_728D6, eax
		push	581Eh
		push	large [bp+var_8]
		call	Effect_NotifyAndResetList
		add	sp, 6
		mov	word ptr [si+6], ds
		mov	word ptr [si+4], 341Dh
		mov	byte ptr [si+10h], 0
		mov	ax, [bp+arg_4]
		mov	[si+2],	ax
		cmp	ax, word_70474
		jnz	short loc_44E74
		jmp	loc_44EF8
; ���������������������������������������������������������������������������

loc_44E74:				; CODE XREF: Collision_PrepareContext+B6j
		push	ax
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax
		les	bx, [bp+var_10]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	dx, [bp+arg_4]
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	dword_728C2, eax
		mov	eax, [bx+4]
		mov	dword_728C6, eax
		mov	eax, [bx+8]
		mov	dword_728CA, eax
		les	bx, [bp+var_8]
		mov	eax, es:[bx+10h]
		sar	eax, 8
		mov	dword_6FBE9, eax
		push	di
		push	ss
		lea	ax, [bp+var_28]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+44h]
		add	sp, 6
		mov	eax, [bp+var_28]
		mov	dword_728DA, eax
		mov	eax, [bp+var_24]
		mov	dword_728DE, eax
		mov	eax, [bp+var_20]
		mov	dword_728E2, eax
		push	582Ah
		push	large [bp+var_8]
		call	Effect_NotifyAndResetList
		add	sp, 6

loc_44EF8:				; CODE XREF: Collision_PrepareContext+B8j
		mov	word ptr [si+0Ah], ds
		mov	word ptr [si+8], 341Dh
		mov	byte ptr [si+11h], 0
		pop	di
		pop	si
		leave
		retf
Collision_PrepareContext	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,309L — parcourt une liste liée, teste la collision (vtable[0x10]) entre chaque paire,
; filtre par type de cible (word_70474) : boucle principale de test de collision détaillée sur
; les paires détectées par la grille spatiale — orchestrateur du système de collision.
; ==============================================================================================
Collision_MainLoop	proc far		; CODE XREF: UIScreen_ReadNumericFields_500A6+48P

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 1
		mov	di, [si]
		mov	[bp+var_4], 0
		jmp	loc_45051
; ���������������������������������������������������������������������������

loc_44F21:				; CODE XREF: Collision_MainLoop+151j
		mov	ax, [di]
		mov	[bp+var_6], ax
		mov	ax, [di+2]
		mov	[bp+var_8], ax
		cmp	[bp+var_6], 0
		jnz	short loc_44F35
		jmp	loc_4504B
; ���������������������������������������������������������������������������

loc_44F35:				; CODE XREF: Collision_MainLoop+28j
		cmp	[bp+var_8], 0
		jnz	short loc_44F3E
		jmp	loc_4504B
; ���������������������������������������������������������������������������

loc_44F3E:				; CODE XREF: Collision_MainLoop+31j
		push	[bp+var_6]
		mov	bx, [bp+var_6]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [di+4]
		mov	[bp+var_10], eax
		mov	ax, [bp+var_8]
		cmp	ax, word_70474
		jnz	short loc_44F8A
		push	large [bp+var_10]
		push	ax
		push	[bp+var_6]
		push	dx
		push	word ptr [bp+var_C]
		les	bx, [bp+var_C]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 0Ch
		mov	[di+10h], al
		cmp	byte ptr [di+10h], 0
		jnz	short loc_44F84
		jmp	loc_4504B
; ���������������������������������������������������������������������������

loc_44F84:				; CODE XREF: Collision_MainLoop+77j
		push	[bp+var_6]
		jmp	loc_45040
; ���������������������������������������������������������������������������

loc_44F8A:				; CODE XREF: Collision_MainLoop+56j
		push	[bp+var_8]
		mov	bx, [bp+var_8]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_14+2],	dx
		mov	word ptr [bp+var_14], ax
		mov	eax, [di+8]
		mov	[bp+var_18], eax
		push	dx
		push	word ptr [bp+var_14]
		les	bx, [bp+var_14]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 11h
		jnz	short loc_44FC6
		mov	ax, [bp+var_6]
		cmp	ax, word_722E6
		jnz	short loc_44FF7
		mov	[bp+var_1], 0
		jmp	short loc_44FF7
; ���������������������������������������������������������������������������

loc_44FC6:				; CODE XREF: Collision_MainLoop+ADj
		push	large [bp+var_10]
		push	[bp+var_8]
		push	[bp+var_6]
		push	large [bp+var_C]
		les	bx, [bp+var_C]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 0Ch
		mov	[di+10h], al
		cmp	byte ptr [di+10h], 0
		jz	short loc_44FF7
		push	[bp+var_6]
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr CollisionLink_RemoveByID
		add	sp, 6

loc_44FF7:				; CODE XREF: Collision_MainLoop+B6j
					; Collision_MainLoop+BCj ...
		push	large [bp+var_C]
		les	bx, [bp+var_C]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 11h
		jnz	short loc_4501A
		mov	ax, [bp+var_8]
		cmp	ax, word_722E6
		jnz	short loc_4504B
		mov	[bp+var_1], 0
		jmp	short loc_4504B
; ���������������������������������������������������������������������������

loc_4501A:				; CODE XREF: Collision_MainLoop+101j
		push	large [bp+var_18]
		push	[bp+var_6]
		push	[bp+var_8]
		push	large [bp+var_14]
		les	bx, [bp+var_14]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 0Ch
		mov	[di+11h], al
		cmp	byte ptr [di+11h], 0
		jz	short loc_4504B
		push	[bp+var_8]

loc_45040:				; CODE XREF: Collision_MainLoop+7Fj
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr CollisionLink_RemoveByID
		add	sp, 6

loc_4504B:				; CODE XREF: Collision_MainLoop+2Aj
					; Collision_MainLoop+33j ...
		inc	[bp+var_4]
		add	di, 1Ah

loc_45051:				; CODE XREF: Collision_MainLoop+16j
		mov	ax, [si+2]
		cmp	ax, [bp+var_4]
		jle	short loc_4505C
		jmp	loc_44F21
; ���������������������������������������������������������������������������

loc_4505C:				; CODE XREF: Collision_MainLoop+14Fj
		cmp	[bp+var_1], 0
		jz	short loc_4506D
		cmp	word ptr [si+2], 0Fh
		jge	short loc_4506D
		mov	byte_6E4D0, 0

loc_4506D:				; CODE XREF: Collision_MainLoop+158j
					; Collision_MainLoop+15Ej
		mov	di, [si]
		mov	[bp+var_4], 0
		jmp	loc_4517C
; ���������������������������������������������������������������������������

loc_45077:				; CODE XREF: Collision_MainLoop+27Cj
		mov	ax, [di]
		mov	[bp+var_6], ax
		mov	ax, [di+2]
		mov	[bp+var_8], ax
		cmp	[bp+var_6], 0
		jnz	short loc_4508B
		jmp	loc_45176
; ���������������������������������������������������������������������������

loc_4508B:				; CODE XREF: Collision_MainLoop+17Ej
		cmp	[bp+var_8], 0
		jnz	short loc_45094
		jmp	loc_45176
; ���������������������������������������������������������������������������

loc_45094:				; CODE XREF: Collision_MainLoop+187j
		mov	byte ptr [bp+var_C+3], 0
		mov	byte ptr [bp+var_C+2], 0
		cmp	ax, word_70474
		jnz	short loc_450D4
		cmp	byte ptr [di+10h], 0
		jnz	short loc_450AB
		jmp	loc_45130
; ���������������������������������������������������������������������������

loc_450AB:				; CODE XREF: Collision_MainLoop+19Ej
		push	[bp+var_6]
		mov	bx, [bp+var_6]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_C], dx
		mov	word ptr [bp+var_10+2],	ax
		push	0
		push	[bp+var_6]
		push	dx
		push	ax
		les	bx, [bp+var_10+2]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		mov	byte ptr [bp+var_C+3], al
		jmp	short loc_45130
; ���������������������������������������������������������������������������

loc_450D4:				; CODE XREF: Collision_MainLoop+198j
		cmp	byte ptr [di+10h], 0
		jz	short loc_45102
		push	[bp+var_6]
		mov	bx, [bp+var_6]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_10], dx
		mov	word ptr [bp+var_14+2],	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	dx
		push	ax
		les	bx, [bp+var_14+2]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		mov	byte ptr [bp+var_C+3], al

loc_45102:				; CODE XREF: Collision_MainLoop+1D0j
		cmp	byte ptr [di+11h], 0
		jz	short loc_45130
		push	[bp+var_8]
		mov	bx, [bp+var_8]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_14], dx
		mov	word ptr [bp+var_18+2],	ax
		push	[bp+var_6]
		push	[bp+var_8]
		push	dx
		push	ax
		les	bx, [bp+var_18+2]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		mov	byte ptr [bp+var_C+2], al

loc_45130:				; CODE XREF: Collision_MainLoop+1A0j
					; Collision_MainLoop+1CAj ...
		cmp	byte ptr [bp+var_C+3], 0
		jz	short loc_45153
		push	[bp+var_6]
		push	59C3h
		call	Container_Op_223C5
		add	sp, 4
		push	[bp+var_6]
		push	word_70474
		call	Picking_FindSelectableTyped
		add	sp, 4

loc_45153:				; CODE XREF: Collision_MainLoop+22Cj
		cmp	byte ptr [bp+var_C+2], 0
		jz	short loc_45176
		push	[bp+var_8]
		push	59C3h
		call	Container_Op_223C5
		add	sp, 4
		push	[bp+var_8]
		push	word_70474
		call	Picking_FindSelectableTyped
		add	sp, 4

loc_45176:				; CODE XREF: Collision_MainLoop+180j
					; Collision_MainLoop+189j ...
		inc	[bp+var_4]
		add	di, 1Ah

loc_4517C:				; CODE XREF: Collision_MainLoop+16Cj
		mov	ax, [si+2]
		cmp	ax, [bp+var_4]
		jle	short loc_45187
		jmp	loc_45077
; ���������������������������������������������������������������������������

loc_45187:				; CODE XREF: Collision_MainLoop+27Aj
		pop	di
		pop	si
		leave
		retf
Collision_MainLoop	endp

; ���������������������������������������������������������������������������

loc_4518B:				; DATA XREF: seg339:off_71EDEo
		push	bp
		mov	bp, sp
		pop	bp
		retf
seg094		ends
