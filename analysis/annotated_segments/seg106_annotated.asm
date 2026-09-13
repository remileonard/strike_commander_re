seg106		segment	byte public 'CODE' use16
		assume cs:seg106
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_4C050:				; DATA XREF: seg339:23C0o
		push	bp
		mov	bp, sp
		mov	al, 12h

loc_4C055:				; DATA XREF: seg216:0416o
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4C057:				; DATA XREF: seg339:off_701AEo
		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+5Ah], 0
		jnz	short loc_4C06A
		jmp	loc_4C154
; ���������������������������������������������������������������������������

loc_4C06A:				; CODE XREF: seg106:0015j
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		call	Timer_Tick_4F9E6
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4C08F
		les	bx, [si+0Eh]
		cmp	byte ptr es:[bx+45h], 0
		jz	short loc_4C08B
		mov	al, 0
		jmp	loc_4C15B
; ���������������������������������������������������������������������������

loc_4C08B:				; CODE XREF: seg106:0034j
		mov	byte ptr [si+5Ah], 0

loc_4C08F:				; CODE XREF: seg106:002Aj
		les	bx, [si+0Ah]
		cmp	byte ptr es:[bx+8], 0
		jnz	short loc_4C09C
		jmp	loc_4C154
; ���������������������������������������������������������������������������

loc_4C09C:				; CODE XREF: seg106:0047j
		cmp	word_70483, 0
		jnz	short loc_4C0A6
		jmp	loc_4C154
; ���������������������������������������������������������������������������

loc_4C0A6:				; CODE XREF: seg106:0051j
		mov	eax, dword_70458
		sub	[si+56h], eax
		cmp	dword ptr [si+56h], 0

loc_4C0B3:
		jg	short loc_4C0BA
		mov	ax, 1
		jmp	short loc_4C0BC
; ���������������������������������������������������������������������������

loc_4C0BA:				; CODE XREF: seg106:loc_4C0B3j
		xor	ax, ax

loc_4C0BC:				; CODE XREF: seg106:0068j
		or	al, al
		jnz	short loc_4C0C3
		jmp	loc_4C154
; ���������������������������������������������������������������������������

loc_4C0C3:				; CODE XREF: seg106:006Ej
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 3Fh	; '?'
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	bx, [bp-4]
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		mov	[si+56h], eax
		sub	sp, 4
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 3Bh	; ';'
		mov	[bp-0Ah], ax
		mov	[bp-0Ch], dx
		les	bx, [bp-0Ch]
		mov	eax, es:[bx]
		mov	[bp-26h], eax

loc_4C102:
		sub	sp, 4

loc_4C105:
		mov	dword ptr [bp-10h], 0

loc_4C10D:
		mov	eax, [bp-10h]

loc_4C111:
		mov	[bp-2Ah], eax

loc_4C115:
		sub	sp, 4
		mov	dword ptr [bp-14h], 0
		mov	eax, [bp-14h]
		mov	[bp-2Eh], eax
		lea	ax, [bp-20h]
		push	ax
		call	Utility_Helper_55E65
		add	sp, 0Eh
		lea	ax, [bp-20h]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		les	bx, [si+0Eh]
		mov	al, es:[bx+36h]
		mov	ah, 0
		push	ax
		push	word_70483
		nop
		push	cs
		call	near ptr Particle_SpawnWithColor
		add	sp, 8

loc_4C154:				; CODE XREF: seg106:0017j seg106:0049j ...
		push	si
		call	WorldObject_IsDestroyed
		pop	cx

loc_4C15B:				; CODE XREF: seg106:0038j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4C15E:				; DATA XREF: seg339:off_701D2o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 12h
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,49L — copie des offsets depuis une structure de chunk (+0xD/+5/+0x15) vers des champs de
; rendu (+0x20/+0x24/+0x28), réinitialise l'état d'animation (+0x1A/1C/1E, +0x2C/2D/2E) :
; initialisation d'un émetteur/pool de particules depuis une définition de chunk.
; ==============================================================================================
ParticleEmitter_InitFromChunk	proc far		; CODE XREF: ParticlePool_AllocElement+37p

var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+6], ax
		mov	si, es:[bx+6]
		add	si, 0Dh
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+20h], eax
		mov	si, es:[bx+6]
		add	si, 5
		mov	eax, [si]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]

loc_4C1A2:
		mov	es:[bx+24h], eax
		mov	bx, es:[bx+6]
		mov	ax, [bx+15h]
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+28h], eax
		mov	word ptr es:[bx+1Ah], 0
		mov	word ptr es:[bx+1Ch], 0
		mov	word ptr es:[bx+1Eh], 0
		and	byte ptr es:[bx+2Ch], 0FDh
		mov	byte ptr es:[bx+2Dh], 2
		mov	byte ptr es:[bx+2Eh], 0
		pop	si
		leave
		retf
ParticleEmitter_InitFromChunk	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,241L — compare la position d'un émetteur à la position caméra (dword_7220A/E/212, mêmes
; globals que le pipeline de rendu principal), déclenche un son (0x5166, sub_58768) si en
; portée : test de proximité caméra→émetteur avec déclenchement audio, gestion de flag d'état
; (bit1 du champ +0x2C).
; ==============================================================================================
ParticleEmitter_ProximityTest	proc far		; CODE XREF: seg106:0DBEp

var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	si
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+2Ch], 0FDh
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]

loc_4C207:
		add	dx, 0Ah
		mov	word ptr [bp+var_6+2], ax

loc_4C20D:
		mov	word ptr [bp+var_6], dx
		les	si, [bp+var_6]
		mov	eax, es:[si]
		mov	[bp+var_6A], eax
		mov	eax, es:[si+4]
		mov	[bp+var_66], eax
		mov	eax, es:[si+8]
		mov	[bp+var_62], eax
		mov	eax, dword_7220A
		sub	[bp+var_6A], eax
		mov	eax, dword_7220E
		sub	[bp+var_66], eax
		mov	eax, dword_72212
		sub	[bp+var_62], eax
		push	5166h
		lea	ax, [bp+var_6A]
		push	ax
		call	Math_ApplyRotationHelperA_58768
		add	sp, 4
		mov	eax, [bp+var_66]
		cmp	eax, dword_721F6
		jle	short loc_4C264
		mov	ax, 1
		jmp	short loc_4C266
; ���������������������������������������������������������������������������

loc_4C264:				; CODE XREF: ParticleEmitter_ProximityTest+6Fj
		xor	ax, ax

loc_4C266:				; CODE XREF: ParticleEmitter_ProximityTest+74j
		or	al, al
		jnz	short loc_4C26D
		jmp	loc_4C3F9
; ���������������������������������������������������������������������������

loc_4C26D:				; CODE XREF: ParticleEmitter_ProximityTest+7Aj
		mov	eax, dword_72540
		mov	[bp+var_A], eax
		shl	eax, 8
		cmp	eax, [bp+var_66]
		jl	short loc_4C284
		mov	ax, 1
		jmp	short loc_4C286
; ���������������������������������������������������������������������������

loc_4C284:				; CODE XREF: ParticleEmitter_ProximityTest+8Fj
		xor	ax, ax

loc_4C286:				; CODE XREF: ParticleEmitter_ProximityTest+94j
		or	al, al
		jnz	short loc_4C28D
		jmp	loc_4C3F9
; ���������������������������������������������������������������������������

loc_4C28D:				; CODE XREF: ParticleEmitter_ProximityTest+9Aj
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 20h	; ' '
		mov	word ptr [bp+var_16+2],	ax
		mov	word ptr [bp+var_16], dx
		les	bx, [bp+var_16]
		mov	eax, es:[bx]

loc_4C2A3:
		mov	[bp+var_1A], eax
		push	large [bp+var_66]
		push	eax
		push	large [dword_72202]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_1E], eax
		mov	[bp+var_12], eax
		mov	[bp+var_22], 99h ; '�'
		cmp	eax, [bp+var_22]
		jle	short loc_4C2D9
		mov	ax, 1
		jmp	short loc_4C2DB
; ���������������������������������������������������������������������������

loc_4C2D9:				; CODE XREF: ParticleEmitter_ProximityTest+E4j
		xor	ax, ax

loc_4C2DB:				; CODE XREF: ParticleEmitter_ProximityTest+E9j
		or	al, al
		jnz	short loc_4C2E2
		jmp	loc_4C3F9
; ���������������������������������������������������������������������������

loc_4C2E2:				; CODE XREF: ParticleEmitter_ProximityTest+EFj
		mov	eax, [bp+var_6A]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_2A], eax
		mov	ax, word_721FE
		mov	[bp+var_2C], ax
		push	large [bp+var_2A]
		push	large [dword_72202]

loc_4C301:
		push	large [bp+var_26]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax

loc_4C30C:
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_30], eax
		mov	[bp+var_34], eax
		movsx	eax, [bp+var_2C]
		shl	eax, 8
		mov	edx, [bp+var_34]
		add	edx, eax
		mov	[bp+var_38], edx
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		sar	eax, 8
		mov	[bp+var_40], eax
		cmp	[bp+var_40], 7D00h
		jle	short loc_4C351
		mov	[bp+var_40], 7D00h
		jmp	short loc_4C365
; ���������������������������������������������������������������������������

loc_4C351:				; CODE XREF: ParticleEmitter_ProximityTest+157j
		cmp	[bp+var_40], 0FFFF8300h
		jge	short loc_4C365
		mov	[bp+var_40], 0FFFF8300h
		jmp	short $+2

loc_4C365:				; CODE XREF: ParticleEmitter_ProximityTest+161j
					; ParticleEmitter_ProximityTest+16Bj
		mov	ax, word ptr [bp+var_40]
		les	bx, [bp+arg_0]
		mov	es:[bx+16h], ax
		mov	eax, [bp+var_62]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_48], eax
		mov	ax, word_72200
		mov	[bp+var_4A], ax
		push	large [bp+var_48]
		push	large [dword_72206]
		push	large [bp+var_44]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4E], eax
		mov	[bp+var_52], eax
		movsx	eax, [bp+var_4A]
		shl	eax, 8
		sub	eax, [bp+var_52]
		mov	[bp+var_56], eax
		mov	[bp+var_5A], eax
		sar	eax, 8
		mov	[bp+var_5E], eax
		cmp	[bp+var_5E], 7D00h
		jle	short loc_4C3D7
		mov	[bp+var_5E], 7D00h
		jmp	short loc_4C3EB
; ���������������������������������������������������������������������������

loc_4C3D7:				; CODE XREF: ParticleEmitter_ProximityTest+1DDj
		cmp	[bp+var_5E], 0FFFF8300h
		jge	short loc_4C3EB
		mov	[bp+var_5E], 0FFFF8300h
		jmp	short $+2

loc_4C3EB:				; CODE XREF: ParticleEmitter_ProximityTest+1E7j
					; ParticleEmitter_ProximityTest+1F1j
		mov	ax, word ptr [bp+var_5E]
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], ax
		mov	[bp+var_1], 1

loc_4C3F9:				; CODE XREF: ParticleEmitter_ProximityTest+7Cj
					; ParticleEmitter_ProximityTest+9Cj ...
		mov	eax, [bp+var_66]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		les	bx, [bp+arg_0]

loc_4C408:
		mov	es:[bx+2], eax
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
ParticleEmitter_ProximityTest	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,351L — décrémente un timer (delta-temps physique dword_70458), teste le flag +0x2C bit1
; pour dispatcher un comportement : mise à jour périodique d'un émetteur de particules avec
; minuteur et branchement selon l'état.
; ==============================================================================================
ParticleEmitter_PeriodicUpdate	proc far		; CODE XREF: seg106:0D71p

var_5C		= word ptr -5Ch
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= word ptr -4Ah
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
		sub	sp, 5Ch
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 24h	; '$'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		mov	eax, dword_70458
		sub	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jle	short loc_4C447
		mov	ax, 1
		jmp	short loc_4C449
; ���������������������������������������������������������������������������

loc_4C447:				; CODE XREF: ParticleEmitter_PeriodicUpdate+2Dj
		xor	ax, ax

loc_4C449:				; CODE XREF: ParticleEmitter_PeriodicUpdate+32j
		or	al, al
		jnz	short loc_4C450
		jmp	loc_4C70A
; ���������������������������������������������������������������������������

loc_4C450:				; CODE XREF: ParticleEmitter_PeriodicUpdate+38j
		les	bx, [bp+arg_0]
		mov	al, es:[bx+2Ch]
		shr	ax, 1
		and	ax, 1
		or	al, al
		jz	short loc_4C467
		mov	byte ptr es:[bx+2Dh], 2
		jmp	short loc_4C47D
; ���������������������������������������������������������������������������

loc_4C467:				; CODE XREF: ParticleEmitter_PeriodicUpdate+4Bj
		les	bx, [bp+arg_0]
		mov	al, es:[bx+2Dh]
		add	al, 0FFh
		mov	es:[bx+2Dh], al
		or	al, al
		jnz	short loc_4C47D
		mov	al, 0
		jmp	locret_4C70C
; ���������������������������������������������������������������������������

loc_4C47D:				; CODE XREF: ParticleEmitter_PeriodicUpdate+52j
					; ParticleEmitter_PeriodicUpdate+63j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	al, [bx]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_4C495
		cmp	ax, 2
		jz	short loc_4C495
		jmp	loc_4C636	; default
; ���������������������������������������������������������������������������

loc_4C495:				; CODE XREF: ParticleEmitter_PeriodicUpdate+78j
					; ParticleEmitter_PeriodicUpdate+7Dj
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		cmp	word ptr [bx+23h], 0
		jnz	short loc_4C4A5
		jmp	loc_4C636	; default
; ���������������������������������������������������������������������������

loc_4C4A5:				; CODE XREF: ParticleEmitter_PeriodicUpdate+8Dj
		mov	bx, word ptr [bp+arg_0]
		movzx	eax, byte ptr es:[bx+2Fh]
		mov	[bp+var_48], eax
		mov	bx, es:[bx+6]
		mov	ax, [bx+21h]
		mov	[bp+var_4A], ax
		movsx	eax, [bp+var_4A]
		shl	eax, 8
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_4E]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_52], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_56], eax
		add	[bp+var_48], eax
		mov	bx, word ptr [bp+arg_0]
		mov	al, byte ptr [bp+var_48]
		and	al, 0FFh
		mov	es:[bx+2Fh], al
		mov	[bp+var_5A], 100h
		mov	eax, [bp+var_48]

loc_4C502:
		cmp	eax, [bp+var_5A]
		jle	short loc_4C50D

loc_4C508:
		mov	ax, 1
		jmp	short loc_4C50F
; ���������������������������������������������������������������������������

loc_4C50D:				; CODE XREF: ParticleEmitter_PeriodicUpdate+F3j
		xor	ax, ax

loc_4C50F:				; CODE XREF: ParticleEmitter_PeriodicUpdate+F8j
		or	al, al

loc_4C511:
		jnz	short loc_4C516
		jmp	loc_4C636	; default
; ���������������������������������������������������������������������������

loc_4C516:				; CODE XREF: ParticleEmitter_PeriodicUpdate:loc_4C511j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		cmp	word ptr [bx+25h], 0
		jz	short loc_4C534
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	al, [bx+20h]
		mov	ah, 0
		dec	ax
		mov	cx, ax
		jmp	short loc_4C560
; ���������������������������������������������������������������������������

loc_4C534:				; CODE XREF: ParticleEmitter_PeriodicUpdate+10Ej
		push	0
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+8]
		mov	al, [bx+4]
		push	ax
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+8]
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_625CC
		dec	ax
		mov	cx, ax

loc_4C560:				; CODE XREF: ParticleEmitter_PeriodicUpdate+11Fj
		les	bx, [bp+arg_0]
		mov	al, es:[bx+2Eh]
		mov	ah, 0
		mov	bx, es:[bx+6]
		add	ax, [bx+23h]
		mov	[bp+var_5C], ax
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	al, [bx+1Fh]
		cbw
		sub	ax, 52h	; 'R'
		mov	bx, ax
		cmp	bx, 5		; switch 6 cases
		jbe	short loc_4C58B
		jmp	loc_4C636	; default
; ���������������������������������������������������������������������������

loc_4C58B:				; CODE XREF: ParticleEmitter_PeriodicUpdate+173j
		shl	bx, 1
		jmp	cs:off_4C70E[bx] ; switch jump

loc_4C592:				; DATA XREF: seg106:off_4C70Eo
		cmp	[bp+var_5C], cx	; case 0x2
		jg	short loc_4C59D
		cmp	[bp+var_5C], 0
		jge	short loc_4C5A2

loc_4C59D:				; CODE XREF: ParticleEmitter_PeriodicUpdate+182j
		mov	al, 0
		jmp	locret_4C70C
; ���������������������������������������������������������������������������

loc_4C5A2:				; CODE XREF: ParticleEmitter_PeriodicUpdate+188j
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_5C]
		mov	es:[bx+2Eh], al
		jmp	loc_4C636	; default
; ���������������������������������������������������������������������������

loc_4C5AF:				; CODE XREF: ParticleEmitter_PeriodicUpdate+17Aj
					; DATA XREF: seg106:off_4C70Eo
		les	bx, [bp+arg_0]	; case 0x5
		mov	al, byte ptr [bp+var_5C]
		mov	es:[bx+2Eh], al
		mov	al, es:[bx+2Eh]
		mov	ah, 0
		cmp	ax, cx
		jle	short loc_4C5C8
		mov	byte ptr es:[bx+2Eh], 0

loc_4C5C8:				; CODE XREF: ParticleEmitter_PeriodicUpdate+1AEj
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+2Eh], 0FFh
		jnz	short loc_4C636	; default
		mov	es:[bx+2Eh], cl
		jmp	short loc_4C636	; default
; ���������������������������������������������������������������������������

loc_4C5D8:				; CODE XREF: ParticleEmitter_PeriodicUpdate+17Aj
					; DATA XREF: seg106:off_4C70Eo
		les	bx, [bp+arg_0]	; case 0x0
		mov	al, byte ptr [bp+var_5C]
		mov	es:[bx+2Eh], al
		mov	al, es:[bx+2Eh]
		mov	ah, 0
		cmp	ax, cx
		jl	short loc_4C5FC
		mov	bx, es:[bx+6]
		mov	word ptr [bx+23h], 0FFFFh
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+2Eh], cl

loc_4C5FC:				; CODE XREF: ParticleEmitter_PeriodicUpdate+1D7j
		les	bx, [bp+arg_0]

loc_4C5FF:
		cmp	byte ptr es:[bx+2Eh], 0
		ja	short loc_4C636	; default

loc_4C606:
		mov	bx, es:[bx+6]
		mov	word ptr [bx+23h], 1
		mov	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+2Eh], 0
		jmp	short loc_4C636	; default
; ���������������������������������������������������������������������������

loc_4C619:				; CODE XREF: ParticleEmitter_PeriodicUpdate+17Aj
					; DATA XREF: seg106:off_4C70Eo
		cmp	[bp+var_5C], cx	; case 0x1
		jle	short loc_4C62C
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	word ptr [bx+23h], 0
		jmp	short loc_4C636	; default
; ���������������������������������������������������������������������������

loc_4C62C:				; CODE XREF: ParticleEmitter_PeriodicUpdate+209j
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_5C]
		mov	es:[bx+2Eh], al

loc_4C636:				; CODE XREF: ParticleEmitter_PeriodicUpdate+7Fj
					; ParticleEmitter_PeriodicUpdate+8Fj ...
		mov	eax, [bp+var_4]	; default
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		les	bx, [bp+arg_0]
		mov	es:[bx+24h], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 20h	; ' '
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	eax, [bx+9]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_14]
		add	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+20h], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 28h	; '('
		mov	word ptr [bp+var_2C+2],	ax
		mov	word ptr [bp+var_2C], dx
		les	bx, [bp+var_2C]
		mov	eax, es:[bx]
		mov	[bp+var_30], eax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+6]
		mov	eax, [bx+11h]
		mov	edx, dword_70458
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_30]
		add	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	bx, word ptr [bp+arg_0]

loc_4C701:
		mov	es:[bx+28h], eax
		mov	al, 1
		jmp	short locret_4C70C
; ���������������������������������������������������������������������������

loc_4C70A:				; CODE XREF: ParticleEmitter_PeriodicUpdate+3Aj
		mov	al, 0

locret_4C70C:				; CODE XREF: ParticleEmitter_PeriodicUpdate+67j
					; ParticleEmitter_PeriodicUpdate+18Cj ...
		leave
		retf
ParticleEmitter_PeriodicUpdate	endp

; ���������������������������������������������������������������������������
off_4C70E	dw offset loc_4C5D8	; DATA XREF: ParticleEmitter_PeriodicUpdate+17Ar
		dw offset loc_4C619	; jump table for switch	statement
		dw offset loc_4C592
		dw offset loc_4C636
		dw offset loc_4C636
		dw offset loc_4C5AF

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,75L — si un vecteur de vitesse (+0x1A/1C/1E) est non nul, l'intègre (delta-temps
; dword_7045E) dans la position : intégration de la vitesse d'une particule/débris émis.
; ==============================================================================================
Particle_IntegrateVelocity	proc far		; CODE XREF: seg106:0E2Cp

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
		sub	sp, 30h
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Ah]
		or	ax, es:[bx+1Ch]
		or	ax, es:[bx+1Eh]
		jnz	short loc_4C734
		jmp	locret_4C7EB
; ���������������������������������������������������������������������������

loc_4C734:				; CODE XREF: Particle_IntegrateVelocity+15j
		movsx	eax, word ptr es:[bx+1Ah]
		mov	[bp+var_24], eax
		movsx	eax, word ptr es:[bx+1Ch]
		mov	[bp+var_20], eax
		movsx	eax, word ptr es:[bx+1Eh]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_20]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_1C]
		mov	edx, dword_7045E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_28], eax
		mov	eax, es:[bx+0Ah]
		add	eax, [bp+var_30]
		mov	es:[bx+0Ah], eax
		mov	eax, es:[bx+0Eh]
		add	eax, [bp+var_2C]
		mov	es:[bx+0Eh], eax
		mov	eax, es:[bx+12h]
		add	eax, [bp+var_28]
		mov	es:[bx+12h], eax

locret_4C7EB:				; CODE XREF: Particle_IntegrateVelocity+17j
		leave
		retf
Particle_IntegrateVelocity	endp

; ���������������������������������������������������������������������������

loc_4C7ED:				; DATA XREF: seg339:off_70166o
		push	bp
		mov	bp, sp
		sub	sp, 80h
		push	si
		push	di
		les	bx, [bp+6]
		mov	bx, es:[bx+6]
		mov	al, [bx]
		mov	ah, 0
		or	ax, ax

loc_4C803:
		jz	short loc_4C818
		cmp	ax, 1
		jnz	short loc_4C80D
		jmp	loc_4C946
; ���������������������������������������������������������������������������

loc_4C80D:				; CODE XREF: seg106:07B8j
		cmp	ax, 2
		jnz	short loc_4C815

loc_4C812:
		jmp	loc_4CABA
; ���������������������������������������������������������������������������

loc_4C815:				; CODE XREF: seg106:07C0j
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4C818:				; CODE XREF: seg106:loc_4C803j
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 20h	; ' '
		mov	[bp-6],	ax
		mov	[bp-8],	dx
		les	bx, [bp-8]
		mov	eax, es:[bx]
		mov	[bp-0Ch], eax
		mov	eax, dword_72202
		mov	edx, [bp-0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		mov	[bp-14h], eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 2
		mov	[bp-16h], ax
		mov	[bp-18h], dx
		les	bx, [bp-18h]
		mov	eax, es:[bx]
		mov	[bp-1Ch], eax
		mov	eax, [bp-14h]
		mov	edx, eax
		mov	ecx, [bp-1Ch]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-20h], eax
		mov	eax, [bp-20h]
		mov	[bp-24h], eax
		mov	di, [bp-23h]
		les	bx, [bp+6]
		mov	ax, es:[bx+16h]
		sub	ax, di
		cmp	ax, word_72242
		jle	short loc_4C89F
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4C89F:				; CODE XREF: seg106:084Aj
		mov	ax, es:[bx+16h]
		add	ax, di
		cmp	ax, word_7223E
		jge	short loc_4C8AE
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4C8AE:				; CODE XREF: seg106:0859j
		mov	ax, es:[bx+18h]
		sub	ax, di
		cmp	ax, word_72244
		jle	short loc_4C8BD
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4C8BD:				; CODE XREF: seg106:0868j
		mov	ax, es:[bx+18h]
		add	ax, di
		cmp	ax, word_72240
		jge	short loc_4C8CC
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4C8CC:				; CODE XREF: seg106:0877j
		or	byte ptr es:[bx+2Ch], 2
		mov	eax, es:[bx+28h]
		sar	eax, 8
		mov	si, ax
		or	si, si
		jge	short loc_4C8E6
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_4C903
; ���������������������������������������������������������������������������

loc_4C8E6:				; CODE XREF: seg106:088Ej
		push	0
		mov	al, byte_7252C
		push	ax
		push	large [dword_72528]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 8
		add	ax, bx

loc_4C903:				; CODE XREF: seg106:0894j
		mov	[bp-26h], dx

loc_4C906:
		mov	[bp-28h], ax
		push	dx
		push	ax

loc_4C90B:
		mov	[bp-2Ah], di
		movsx	eax, word ptr [bp-2Ah]
		mov	edx, dword_6E9AA
		imul	edx, eax
		mov	[bp-2Eh], edx
		mov	eax, [bp-2Eh]
		mov	[bp-32h], eax
		push	word ptr [bp-31h]
		push	di
		les	bx, [bp+6]
		push	word ptr es:[bx+18h]
		push	word ptr es:[bx+16h]
		push	word_70E60
		call	Render_PlotPixelClippedColorMap
		add	sp, 0Eh
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4C946:				; CODE XREF: seg106:07BAj
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 20h	; ' '
		mov	[bp-2Ah], ax
		mov	[bp-2Ch], dx
		les	bx, [bp-2Ch]
		mov	eax, es:[bx]
		mov	[bp-30h], eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 2
		mov	[bp-32h], ax
		mov	[bp-34h], dx
		les	bx, [bp-34h]
		mov	eax, es:[bx]
		mov	[bp-38h], eax
		les	bx, [bp+6]
		mov	bx, es:[bx+8]
		mov	ax, [bx+0Ah]
		mov	[bp-3Ah], ax
		movsx	eax, word ptr [bp-3Ah]
		mov	edx, [bp-38h]
		imul	edx, eax
		mov	[bp-3Eh], edx
		mov	eax, [bp-3Eh]
		mov	[bp-42h], eax
		push	eax
		push	large [dword_72202]
		push	large dword ptr	[bp-30h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-46h], eax
		mov	[bp-28h], eax
		mov	si, [bp-28h]
		cmp	si, 4
		jge	short loc_4C9CC
		mov	ax, 4
		jmp	short loc_4C9CE
; ���������������������������������������������������������������������������

loc_4C9CC:				; CODE XREF: seg106:0975j
		mov	ax, si

loc_4C9CE:				; CODE XREF: seg106:097Aj
		mov	si, ax
		cmp	si, 2000h
		jge	short loc_4C9D8
		jmp	short loc_4C9DB
; ���������������������������������������������������������������������������

loc_4C9D8:				; CODE XREF: seg106:0984j
		mov	ax, 2000h

loc_4C9DB:				; CODE XREF: seg106:0986j
		mov	si, ax
		les	bx, [bp+6]
		mov	bx, es:[bx+8]
		mov	ax, [bx+0Ah]
		mov	[bp-48h], ax
		movsx	eax, word ptr [bp-48h]
		mov	edx, [bp-28h]
		imul	edx, eax
		mov	[bp-4Ch], edx
		mov	eax, [bp-4Ch]
		mov	[bp-50h], eax
		mov	di, [bp-4Fh]
		mov	bx, [bp+6]
		mov	ax, es:[bx+16h]
		sub	ax, di
		cmp	ax, word_72242
		jle	short loc_4CA18
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4CA18:				; CODE XREF: seg106:09C3j
		mov	ax, es:[bx+16h]
		add	ax, di
		cmp	ax, word_7223E
		jge	short loc_4CA27
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4CA27:				; CODE XREF: seg106:09D2j
		mov	ax, es:[bx+18h]
		sub	ax, di
		cmp	ax, word_72244
		jle	short loc_4CA36
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4CA36:				; CODE XREF: seg106:09E1j
		mov	ax, es:[bx+18h]
		add	ax, di
		cmp	ax, word_72240
		jge	short loc_4CA45
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4CA45:				; CODE XREF: seg106:09F0j
		or	byte ptr es:[bx+2Ch], 2
		mov	bx, es:[bx+6]
		cmp	word ptr [bx+25h], 0
		jz	short loc_4CA6E
		mov	bx, [bp+6]
		mov	al, es:[bx+2Eh]
		mov	ah, 0
		mov	bx, es:[bx+6]
		mov	bx, [bx+25h]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		mov	bx, ax
		jmp	short loc_4CA79
; ���������������������������������������������������������������������������

loc_4CA6E:				; CODE XREF: seg106:0A02j
		les	bx, [bp+6]
		mov	al, es:[bx+2Eh]
		mov	ah, 0
		mov	bx, ax

loc_4CA79:				; CODE XREF: seg106:0A1Cj
		push	si
		push	si
		push	bx
		push	0
		les	bx, [bp+6]
		mov	bx, es:[bx+8]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+8]
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		les	bx, [bp+6]
		push	word ptr es:[bx+18h]
		push	word ptr es:[bx+16h]
		push	word_70E60
		call	Render_DrawRotatedScaledSprite_62800
		add	sp, 10h
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4CABA:				; CODE XREF: seg106:loc_4C812j
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 20h	; ' '
		mov	[bp-52h], ax
		mov	[bp-54h], dx
		les	bx, [bp-54h]
		mov	eax, es:[bx]
		mov	[bp-58h], eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 2
		mov	[bp-5Ah], ax
		mov	[bp-5Ch], dx
		les	bx, [bp-5Ch]
		mov	eax, es:[bx]
		mov	[bp-60h], eax
		les	bx, [bp+6]
		mov	bx, es:[bx+8]
		mov	ax, [bx+0Ah]
		mov	[bp-62h], ax
		movsx	eax, word ptr [bp-62h]
		mov	edx, [bp-60h]
		imul	edx, eax
		mov	[bp-66h], edx
		mov	eax, [bp-66h]
		mov	[bp-6Ah], eax
		push	eax
		push	large [dword_72202]
		push	large dword ptr	[bp-58h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-6Eh], eax
		mov	[bp-72h], eax
		mov	[bp-28h], eax
		mov	si, [bp-28h]
		cmp	si, 4
		jge	short loc_4CB44
		mov	ax, 4
		jmp	short loc_4CB46
; ���������������������������������������������������������������������������

loc_4CB44:				; CODE XREF: seg106:0AEDj
		mov	ax, si

loc_4CB46:				; CODE XREF: seg106:0AF2j
		mov	si, ax
		cmp	si, 2000h
		jge	short loc_4CB50
		jmp	short loc_4CB53
; ���������������������������������������������������������������������������

loc_4CB50:				; CODE XREF: seg106:0AFCj
		mov	ax, 2000h

loc_4CB53:				; CODE XREF: seg106:0AFEj
		mov	si, ax
		les	bx, [bp+6]
		mov	bx, es:[bx+8]
		mov	ax, [bx+0Ah]
		mov	[bp-74h], ax
		movsx	eax, word ptr [bp-74h]
		mov	edx, [bp-28h]
		imul	edx, eax
		mov	[bp-78h], edx
		mov	eax, [bp-78h]
		mov	[bp-7Ch], eax
		mov	di, [bp-7Bh]
		mov	bx, [bp+6]
		mov	ax, es:[bx+16h]
		sub	ax, di
		cmp	ax, word_72242
		jle	short loc_4CB90
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4CB90:				; CODE XREF: seg106:0B3Bj
		mov	ax, es:[bx+16h]
		add	ax, di
		cmp	ax, word_7223E
		jge	short loc_4CB9F
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4CB9F:				; CODE XREF: seg106:0B4Aj
		mov	ax, es:[bx+18h]
		sub	ax, di
		cmp	ax, word_72244
		jle	short loc_4CBAE
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4CBAE:				; CODE XREF: seg106:0B59j
		mov	ax, es:[bx+18h]
		add	ax, di
		cmp	ax, word_72240
		jge	short loc_4CBBD
		jmp	loc_4CC88
; ���������������������������������������������������������������������������

loc_4CBBD:				; CODE XREF: seg106:0B68j
		or	byte ptr es:[bx+2Ch], 2
		mov	eax, es:[bx+28h]
		sar	eax, 8
		mov	di, ax
		or	di, di
		jge	short loc_4CBD7
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_4CBF4
; ���������������������������������������������������������������������������

loc_4CBD7:				; CODE XREF: seg106:0B7Fj
		push	0
		mov	al, byte_7252C
		push	ax
		push	large [dword_72528]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	bx, di
		shl	bx, 8
		add	ax, bx

loc_4CBF4:				; CODE XREF: seg106:0B85j
		mov	[bp-7Eh], dx
		mov	[bp-80h], ax
		les	bx, [bp+6]
		mov	bx, es:[bx+6]

loc_4CC01:
		cmp	word ptr [bx+25h], 0

loc_4CC05:
		jz	short loc_4CC21
		mov	bx, [bp+6]
		mov	al, es:[bx+2Eh]
		mov	ah, 0
		mov	bx, es:[bx+6]
		mov	bx, [bx+25h]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		mov	di, ax
		jmp	short loc_4CC2C
; ���������������������������������������������������������������������������

loc_4CC21:				; CODE XREF: seg106:loc_4CC05j
		les	bx, [bp+6]
		mov	al, es:[bx+2Eh]
		mov	ah, 0
		mov	di, ax

loc_4CC2C:				; CODE XREF: seg106:0BCFj
		les	bx, [bp+6]
		mov	bx, es:[bx+6]
		mov	al, [bx+1Ah]
		mov	ah, 0
		push	ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+6]
		mov	al, [bx+19h]
		mov	ah, 0
		push	ax
		push	large dword ptr	[bp-80h]
		push	si
		push	si
		push	di
		push	0
		mov	bx, [bp+6]
		mov	bx, es:[bx+8]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+8]
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		les	bx, [bp+6]
		push	word ptr es:[bx+18h]
		push	word ptr es:[bx+16h]
		push	word_70E60
		call	Render_DrawScaledSprite_621A2
		add	sp, 18h

loc_4CC88:				; CODE XREF: seg106:loc_4C815j
					; seg106:084Cj	...
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_4CCA5
		push	33h ; '3'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4CCED

loc_4CCA5:				; CODE XREF: seg106:0C45j
		mov	word ptr [si], 10E4h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 30BAh
		mov	word ptr [si+17h], 0
		mov	word ptr [si+15h], 0
		mov	byte ptr [si+19h], 2
		mov	byte ptr [si+1Ah], 0
		mov	dword ptr [si+1Bh], 0
		mov	byte ptr [si+0Ah], 0
		mov	word ptr [si+0Dh], 0
		mov	dword ptr [si+29h], 0

loc_4CCED:				; CODE XREF: seg106:0C53j
		mov	ax, si
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,41L — si sous la capacité (+0x31 < +0x13), insère un pointeur dans le tableau circulaire
; (+0x2D, pas 4), positionne un flag si un champ (+6) est non nul : insertion d'un élément
; dans le pool circulaire d'émetteur (avec flag de type spécial).
; ==============================================================================================
ParticlePool_InsertElement	proc far		; CODE XREF: Particle_SpawnWithColor+171p
					; Elements_SpawnAlongSegment_4D1C9:loc_4D512p

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+31h]
		cmp	ax, [si+13h]
		jge	short loc_4CD28
		les	bx, [si+2Dh]
		mov	eax, [bp+arg_2]
		mov	es:[bx], eax
		les	bx, [bp+arg_2]

loc_4CD0F:
		cmp	word ptr es:[bx+6], 0
		jz	short loc_4CD1D

loc_4CD16:
		or	byte ptr es:[bx+2Ch], 1
		jmp	short $+2

loc_4CD1D:				; CODE XREF: ParticlePool_InsertElement+22j
		add	word ptr [si+2Dh], 4
		inc	word ptr [si+31h]
		mov	al, 1
		jmp	short loc_4CD2A
; ���������������������������������������������������������������������������

loc_4CD28:				; CODE XREF: ParticlePool_InsertElement+Dj
		mov	al, 0

loc_4CD2A:				; CODE XREF: ParticlePool_InsertElement+34j
		pop	si
		pop	bp
		retf
ParticlePool_InsertElement	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,27L — efface le flag associé (+0x2C bit0), retire l'élément du tableau circulaire
; (+0x2D) en compactant : retrait d'un élément du pool circulaire d'émetteur.
; ==============================================================================================
ParticlePool_RemoveElement	proc far		; CODE XREF: seg106:0D38p seg106:0D83p

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		les	bx, [bp+arg_2]
		les	bx, es:[bx]
		and	byte ptr es:[bx+2Ch], 0FEh
		sub	word ptr [si+2Dh], 4
		dec	word ptr [si+31h]
		mov	eax, [si+2Dh]
		cmp	eax, [bp+arg_2]
		jz	short loc_4CD5E
		les	bx, [si+2Dh]
		mov	eax, es:[bx]
		les	bx, [bp+arg_2]
		mov	es:[bx], eax

loc_4CD5E:				; CODE XREF: ParticlePool_RemoveElement+21j
		pop	si
		pop	bp
		retf
ParticlePool_RemoveElement	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	eax, [si+29h]
		mov	[bp-4],	eax
		jmp	short loc_4CD94
; ���������������������������������������������������������������������������

loc_4CD75:				; CODE XREF: seg106:0D4Aj
		les	bx, [bp-4]
		mov	eax, es:[bx]
		cmp	eax, [bp+8]
		jnz	short loc_4CD90
		push	word ptr [bp-2]
		push	bx
		push	si
		push	cs
		call	near ptr ParticlePool_RemoveElement
		add	sp, 6
		jmp	short loc_4CD9C
; ���������������������������������������������������������������������������

loc_4CD90:				; CODE XREF: seg106:0D30j
		add	word ptr [bp-4], 4

loc_4CD94:				; CODE XREF: seg106:0D23j
		mov	ax, [si+2Dh]
		cmp	ax, [bp-4]
		ja	short loc_4CD75

loc_4CD9C:				; CODE XREF: seg106:0D3Ej
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4CD9F:				; DATA XREF: seg339:off_7017Ao
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+0Ah], 0
		jz	short loc_4CDE7
		mov	eax, [si+29h]
		mov	[bp-4],	eax
		jmp	short loc_4CDDF
; ���������������������������������������������������������������������������

loc_4CDB9:				; CODE XREF: seg106:0D95j
		les	bx, [bp-4]
		push	large dword ptr	es:[bx]
		push	cs
		call	near ptr ParticleEmitter_PeriodicUpdate
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4CDDB
		push	large dword ptr	[bp-4]
		push	si
		push	cs
		call	near ptr ParticlePool_RemoveElement
		add	sp, 6
		jmp	short loc_4CDDF
; ���������������������������������������������������������������������������

loc_4CDDB:				; CODE XREF: seg106:0D7Bj
		add	word ptr [bp-4], 4

loc_4CDDF:				; CODE XREF: seg106:0D67j seg106:0D89j
		mov	ax, [si+2Dh]
		cmp	ax, [bp-4]
		ja	short loc_4CDB9

loc_4CDE7:				; CODE XREF: seg106:0D5Dj
		mov	al, 1
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4CDEC:				; DATA XREF: seg339:off_7016Eo
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+0Ah], 0
		jz	short loc_4CE57
		mov	eax, [si+29h]
		mov	[bp-4],	eax
		jmp	short loc_4CE4F
; ���������������������������������������������������������������������������

loc_4CE06:				; CODE XREF: seg106:0E05j
		les	bx, [bp-4]

loc_4CE09:
		push	large dword ptr	es:[bx]
		push	cs
		call	near ptr ParticleEmitter_ProximityTest

loc_4CE11:
		add	sp, 4
		or	al, al
		jz	short loc_4CE4B
		les	bx, [bp-4]
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		mov	ax, word_724AC
		cmp	ax, word_724AA
		jge	short loc_4CE4B
		mov	ax, word_724AC
		inc	word_724AC
		shl	ax, 2
		les	bx, dword_724AE
		add	bx, ax
		mov	ax, [bp-6]
		mov	dx, [bp-8]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short $+2

loc_4CE4B:				; CODE XREF: seg106:0DC6j seg106:0DDAj
		add	word ptr [bp-4], 4

loc_4CE4F:				; CODE XREF: seg106:0DB4j
		mov	ax, [si+2Dh]
		cmp	ax, [bp-4]
		ja	short loc_4CE06

loc_4CE57:				; CODE XREF: seg106:0DAAj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4CE5A:				; DATA XREF: seg339:off_7017Eo
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+0Ah], 0
		jz	short loc_4CE8E
		mov	eax, [si+29h]
		mov	[bp-4],	eax
		jmp	short loc_4CE86
; ���������������������������������������������������������������������������

loc_4CE74:				; CODE XREF: seg106:0E3Cj
		les	bx, [bp-4]
		push	large dword ptr	es:[bx]
		push	cs
		call	near ptr Particle_IntegrateVelocity
		add	sp, 4
		add	word ptr [bp-4], 4

loc_4CE86:				; CODE XREF: seg106:0E22j
		mov	ax, [si+2Dh]
		cmp	ax, [bp-4]
		ja	short loc_4CE74

loc_4CE8E:				; CODE XREF: seg106:0E18j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4CE91:				; DATA XREF: seg339:off_70182o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jnz	short loc_4CEA6
		jmp	loc_4CF4D
; ���������������������������������������������������������������������������

loc_4CEA6:				; CODE XREF: seg106:0E51j
		mov	word ptr [si], 30BAh
		push	word ptr [si+0Dh]
		call	CRT_FreeNear_Wrap
		pop	cx
		push	seg seg106
		push	offset loc_4D64E
		push	large 190000h
		push	0Ch
		push	word ptr [si+11h]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	0
		push	2
		mov	ax, si
		add	ax, 29h	; ')'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	ax, si
		add	ax, 15h
		mov	dx, ds
		or	ax, dx
		jz	short loc_4CF35
		cmp	byte ptr [si+1Ah], 0
		jz	short loc_4CF1D
		mov	ax, [si+15h]
		or	ax, [si+17h]
		jz	short loc_4CF1D
		push	0
		mov	al, [si+19h]
		push	ax

loc_4CF00:
		mov	ax, [si+17h]

loc_4CF03:
		mov	dx, [si+15h]
		mov	[bp-2],	ax
		mov	[bp-4],	dx

loc_4CF0C:
		lea	ax, [bp-4]
		push	ax

loc_4CF10:
		push	5C44h

loc_4CF13:
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_4CF1D:				; CODE XREF: seg106:0EA0j seg106:0EA8j
		mov	word ptr [si+17h], 0
		mov	word ptr [si+15h], 0
		mov	byte ptr [si+1Ah], 0
		mov	dword ptr [si+1Bh], 0
		jmp	short $+2

loc_4CF35:				; CODE XREF: seg106:0E9Aj
		push	0
		push	si
		call	Handle_Destructor
		add	sp, 4
		test	di, 1
		jz	short loc_4CF4D
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_4CF4D:				; CODE XREF: seg106:0E53j seg106:0EF4j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	eax, [si+29h]
		mov	[si+2Dh], eax
		mov	word ptr [si+31h], 0
		push	0
		mov	al, [si+19h]
		push	ax
		push	large dword ptr	[si+15h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		xor	dx, dx
		jmp	short loc_4CF94
; ���������������������������������������������������������������������������

loc_4CF87:				; CODE XREF: seg106:0F47j
		les	bx, [bp-4]
		and	byte ptr es:[bx+2Ch], 0FEh
		inc	dx
		add	word ptr [bp-4], 30h ; '0'

loc_4CF94:				; CODE XREF: seg106:0F35j
		cmp	[si+13h], dx
		jg	short loc_4CF87
		mov	byte ptr [si+0Ah], 0
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,88L — si sous la capacité (+0x31 < +0x13), initialise un nouvel élément via sub_4C168
; avec un offset de tableau (index×0x2A), avance le curseur d'écriture avec retour au début si
; dépassement (buffer circulaire) : allocation d'un nouvel élément dans le buffer circulaire
; de l'émetteur de particules (wraparound).
; ==============================================================================================
ParticlePool_AllocElement	proc far		; CODE XREF: Particle_SpawnWithColor+1Ap
					; Elements_SpawnAlongSegment_4D1C9+239p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	ax, [di+31h]
		cmp	ax, [di+13h]
		jl	short loc_4CFBE
		jmp	loc_4D044
; ���������������������������������������������������������������������������

loc_4CFBE:				; CODE XREF: ParticlePool_AllocElement+19j
		mov	eax, [di+21h]
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_2]
		imul	ax, 2Ah
		mov	dx, [di+0Dh]
		add	dx, ax
		push	dx
		push	large [bp+var_4]
		push	cs
		call	near ptr ParticleEmitter_InitFromChunk
		add	sp, 6
		add	word ptr [di+21h], 30h ; '0'
		mov	ax, [di+21h]
		cmp	ax, [di+25h]
		jb	short loc_4D004
		push	0
		mov	al, [di+19h]
		push	ax
		push	large dword ptr	[di+15h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[di+23h], dx
		mov	[di+21h], ax

loc_4D004:				; CODE XREF: ParticlePool_AllocElement+47j
		mov	ax, [di+13h]
		dec	ax
		cmp	[di+31h], ax
		jge	short loc_4D044
		jmp	short loc_4D036
; ���������������������������������������������������������������������������

loc_4D00F:				; CODE XREF: ParticlePool_AllocElement+A2j
		add	word ptr [di+21h], 30h ; '0'

loc_4D013:
		mov	ax, [di+21h]
		cmp	ax, [di+25h]
		jbe	short loc_4D036
		push	0
		mov	al, [di+19h]
		push	ax
		push	large dword ptr	[di+15h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	[di+23h], dx
		mov	[di+21h], ax

loc_4D036:				; CODE XREF: ParticlePool_AllocElement+6Dj
					; ParticlePool_AllocElement+79j
		les	bx, [di+21h]
		mov	al, es:[bx+2Ch]
		and	ax, 1
		or	al, al
		jnz	short loc_4D00F

loc_4D044:				; CODE XREF: ParticlePool_AllocElement+1Bj
					; ParticlePool_AllocElement+6Bj
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	di
		pop	si
		leave
		retf
ParticlePool_AllocElement	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,164L — alloue un élément (sub_4CFA0), résout une couleur (sub_54E1C ×3, RGB), configure
; les paramètres de rendu (sub_5525B) : création d'une nouvelle particule dans l'émetteur avec
; couleur résolue.
; ==============================================================================================
Particle_SpawnWithColor	proc far		; CODE XREF: seg106:00FEp

var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= word ptr -1Eh
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
		sub	sp, 36h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	byte ptr [di+0Ah], 0
		jnz	short loc_4D065
		jmp	loc_4D1C5
; ���������������������������������������������������������������������������

loc_4D065:				; CODE XREF: Particle_SpawnWithColor+12j
		push	si
		push	di
		push	cs
		call	near ptr ParticlePool_AllocElement
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_4D07E
		jmp	loc_4D1C5
; ���������������������������������������������������������������������������

loc_4D07E:				; CODE XREF: Particle_SpawnWithColor+2Bj
		mov	ax, si
		imul	ax, 2Ah
		mov	dx, [di+0Dh]
		add	dx, ax
		mov	[bp+var_6], dx
		mov	bx, [bp+var_6]
		mov	ax, [bx+1Bh]
		call	Math_RandomJitter_54E1C
		movsx	eax, ax
		mov	[bp+var_12], eax
		mov	bx, [bp+var_6]
		mov	ax, [bx+1Bh]
		call	Math_RandomJitter_54E1C
		movsx	eax, ax
		mov	[bp+var_E], eax
		mov	bx, [bp+var_6]
		mov	ax, [bx+1Bh]
		call	Math_RandomJitter_54E1C
		movsx	eax, ax
		mov	[bp+var_A], eax
		push	[bp+arg_6]
		lea	ax, [bp+var_12]
		push	ax
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		call	ChaseCamera_ComputeGeometryHelper_5525B
		add	sp, 8
		mov	si, [bp+arg_4]
		mov	eax, [si]
		add	eax, [bp+var_12]
		mov	[bp+var_2A], eax
		mov	eax, [si+4]
		add	eax, [bp+var_E]
		mov	[bp+var_26], eax
		mov	eax, [si+8]
		add	eax, [bp+var_A]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_2E], eax
		les	bx, [bp+var_4]
		mov	eax, [bp+var_36]
		mov	es:[bx+0Ah], eax
		mov	eax, [bp+var_32]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_2E]
		mov	es:[bx+12h], eax
		mov	ax, word ptr [bp+var_4]
		add	ax, 0Ah
		mov	dx, [bp+arg_6]
		mov	si, dx
		mov	ax, [si]
		mov	es:[bx+1Ah], ax
		mov	ax, [si+4]
		mov	es:[bx+1Ch], ax
		mov	ax, [si+8]
		mov	es:[bx+1Eh], ax
		mov	bx, [bp+var_6]
		cmp	byte ptr [bx+27h], 0FFh
		jz	short loc_4D1B9
		cmp	byte ptr [bx+28h], 64h ; 'd'
		jnz	short loc_4D178
		mov	al, [bx+27h]
		mov	ah, 0
		imul	ax, 0Ch
		mov	dx, [di+11h]
		add	dx, ax
		mov	bx, word ptr [bp+var_4]
		mov	es:[bx+8], dx
		jmp	short loc_4D1B9
; ���������������������������������������������������������������������������

loc_4D178:				; CODE XREF: Particle_SpawnWithColor+112j
		mov	bx, [bp+var_6]
		mov	al, [bx+28h]
		mov	ah, 0
		call	Math_RandomChance_54E4F
		or	al, al
		jz	short loc_4D1A2
		mov	bx, [bp+var_6]
		mov	al, [bx+27h]
		mov	ah, 0
		imul	ax, 0Ch
		mov	dx, [di+11h]
		add	dx, ax
		les	bx, [bp+var_4]
		mov	es:[bx+8], dx
		jmp	short loc_4D1B9
; ���������������������������������������������������������������������������

loc_4D1A2:				; CODE XREF: Particle_SpawnWithColor+139j
		mov	bx, [bp+var_6]
		mov	al, [bx+29h]
		mov	ah, 0
		imul	ax, 0Ch
		mov	dx, [di+11h]
		add	dx, ax
		les	bx, [bp+var_4]
		mov	es:[bx+8], dx

loc_4D1B9:				; CODE XREF: Particle_SpawnWithColor+10Cj
					; Particle_SpawnWithColor+128j ...
		push	large [bp+var_4]
		push	di
		push	cs
		call	near ptr ParticlePool_InsertElement
		add	sp, 6

loc_4D1C5:				; CODE XREF: Particle_SpawnWithColor+14j
					; Particle_SpawnWithColor+2Dj
		pop	di
		pop	si
		leave
		retf
Particle_SpawnWithColor	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 450 L. NOM PRÉCÉDENT (ChaseCamera_RenderEffect) FAUX. Relu 2026-09-06 : étant donnés 2
; points monde (arg_4=A, arg_6=B), alloue N éléments de ring buffer (via sub_4CFA0) répartis
; de A vers B, N = (|B-A|<<8) / template[idx*0x2A +1]. Chaque élément (0x30 o) :
; [+0x0A/+0x0E/+0x12]=position (interpolée A->B, jitter sub_54E1C ×3), [+0x24]=durée de vie
; (de arg_8), [+0x08]=index type/couleur (template[+0x27/0x28/0x29] +
; Math_RandomChance_54E4F), [+0x20/+0x28/+0x2E]=params. TYPE D'ÉLÉMENT NON CONFIRMÉ
; (particules ? décalques ? marqueurs ?). Appelée par sub_3D57E et le chargeur IFF seg104. Pas
; de rendu caméra.
; ==============================================================================================
Elements_SpawnAlongSegment_4D1C9	proc far		; CODE XREF: Emitter_UpdateFromEntitySMOKVec_3D57E+42AP
					; seg104:039AP

var_E4		= dword	ptr -0E4h
var_E0		= dword	ptr -0E0h
var_DC		= dword	ptr -0DCh
var_D8		= dword	ptr -0D8h
var_D4		= dword	ptr -0D4h
var_D0		= dword	ptr -0D0h
var_CC		= word ptr -0CCh
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
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
var_72		= word ptr -72h
var_70		= dword	ptr -70h
var_6C		= word ptr -6Ch
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= word ptr -62h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= word ptr -48h
var_46		= dword	ptr -46h
var_42		= word ptr -42h
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
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0E4h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Ah], 0
		jnz	short loc_4D1DE
		jmp	loc_4D628
; ���������������������������������������������������������������������������

loc_4D1DE:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+10j
		mov	di, [bp+arg_6]
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	eax, [di]
		mov	bx, [bp+var_2]
		sub	eax, [bx]
		mov	[bp+var_A8], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]

loc_4D1FD:
		mov	[bp+var_A4], eax

loc_4D202:
		mov	eax, [di+8]

loc_4D206:
		sub	eax, [bx+8]
		mov	[bp+var_A0], eax

loc_4D20F:
		mov	eax, [bp+var_A8]

loc_4D214:
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_A0]
		mov	[bp+var_94], eax
		lea	ax, [bp+var_9C]
		push	ax
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		call	Math_VectorLength3D_Scaled_54F57
		add	sp, 6
		mov	ax, [bp+arg_2]
		imul	ax, 2Ah
		mov	di, [si+0Dh]
		add	di, ax
		mov	ax, di
		inc	ax
		mov	[bp+var_A], ax
		mov	eax, [bp+var_6]
		mov	edx, eax
		mov	bx, [bp+var_A]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		mov	ax, word ptr [bp+var_12+1]
		mov	[bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_4D295
		cmp	[bp+var_6], 0
		jle	short loc_4D28C
		mov	ax, 1
		jmp	short loc_4D28E
; ���������������������������������������������������������������������������

loc_4D28C:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+BCj
		xor	ax, ax

loc_4D28E:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+C1j
		or	al, al
		jz	short loc_4D295
		inc	[bp+var_8]

loc_4D295:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+B5j
					; Elements_SpawnAlongSegment_4D1C9+C7j
		cmp	[bp+var_8], 0
		jg	short loc_4D29E
		jmp	loc_4D628
; ���������������������������������������������������������������������������

loc_4D29E:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+D0j
		mov	ax, [bp+arg_4]
		mov	[bp+var_18], ax
		mov	bx, [bp+var_18]
		mov	eax, [bx]
		mov	[bp+var_C0], eax
		mov	eax, [bx+4]
		mov	[bp+var_BC], eax
		mov	eax, [bx+8]
		mov	[bp+var_B8], eax
		mov	[bp+var_3C], 0
		mov	eax, [bp+var_3C]
		mov	[bp+var_1C], eax
		mov	[bp+var_40], 0
		mov	eax, [bp+var_40]
		mov	[bp+var_28], eax
		mov	eax, [di+0Dh]
		mov	[bp+var_20], eax
		mov	ax, [di+15h]
		mov	[bp+var_42], ax
		movsx	eax, [bp+var_42]
		shl	eax, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]

loc_4D300:
		mov	[bp+var_24], eax
		mov	ax, [bp+var_8]
		mov	[bp+var_48], ax
		movsx	ebx, [bp+var_48]
		mov	eax, [bp+arg_8]
		cdq
		idiv	ebx
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	[bp+var_2C], eax
		mov	eax, [di+9]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	[bp+var_30], eax
		mov	eax, [di+11h]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_60], eax
		mov	[bp+var_34], eax
		mov	ax, [di+21h]
		mov	[bp+var_62], ax
		movsx	eax, [bp+var_62]
		mov	edx, [bp+var_2C]
		imul	edx, eax
		mov	[bp+var_66], edx
		mov	eax, [bp+var_66]
		mov	[bp+var_6A], eax
		mov	[bp+var_38], eax
		mov	ax, [bp+var_8]
		mov	[bp+var_6C], ax
		movsx	eax, [bp+var_6C]
		shl	eax, 8
		mov	[bp+var_70], eax
		mov	eax, [bp+var_9C]
		mov	edx, eax
		mov	ecx, [bp+var_70]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_98]
		mov	edx, eax
		mov	ecx, [bp+var_70]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_98], eax
		mov	eax, [bp+var_94]
		mov	edx, eax
		mov	ecx, [bp+var_70]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_94], eax
		mov	ax, [bp+var_8]
		dec	ax
		mov	[bp+var_74], ax
		mov	[bp+var_72], 0
		jmp	loc_4D61D
; ���������������������������������������������������������������������������

loc_4D3FD:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+45Cj
		push	[bp+arg_2]
		push	si

loc_4D401:
		push	cs
		call	near ptr ParticlePool_AllocElement
		add	sp, 4
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		cmp	[bp+var_16], 0

loc_4D413:
		jnz	short loc_4D418
		jmp	loc_4D628
; ���������������������������������������������������������������������������

loc_4D418:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9:loc_4D413j
		les	bx, [bp+var_16]
		mov	eax, [bp+var_C0]
		mov	es:[bx+0Ah], eax
		mov	eax, [bp+var_BC]
		mov	es:[bx+0Eh], eax
		mov	eax, [bp+var_B8]
		mov	es:[bx+12h], eax
		mov	ax, word ptr [bp+var_16]
		add	ax, 0Ah
		mov	ax, word ptr [bp+var_16+2]
		mov	dx, word ptr [bp+var_16]
		add	dx, 24h	; '$'
		mov	word ptr [bp+var_78+2],	ax
		mov	word ptr [bp+var_78], dx
		les	bx, [bp+var_78]
		mov	eax, es:[bx]
		mov	[bp+var_7C], eax
		sub	eax, [bp+arg_8]
		mov	[bp+var_80], eax
		mov	[bp+var_84], eax
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		les	bx, [bp+var_16]
		mov	es:[bx+24h], eax
		cmp	dword ptr es:[bx+24h], 0
		jg	short loc_4D483
		jmp	loc_4D628
; ���������������������������������������������������������������������������

loc_4D483:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+2B5j
		mov	eax, [bp+var_20]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_8C]
		mov	es:[bx+20h], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_90]
		mov	es:[bx+28h], eax
		mov	eax, [bp+var_28]
		sar	eax, 8
		mov	es:[bx+2Eh], al
		cmp	byte ptr [di+27h], 0FFh
		jz	short loc_4D50C
		cmp	byte ptr [di+28h], 64h ; 'd'
		jnz	short loc_4D4D4
		mov	al, [di+27h]
		mov	ah, 0
		imul	ax, 0Ch
		mov	dx, [si+11h]
		add	dx, ax
		mov	es:[bx+8], dx
		jmp	short loc_4D50C
; ���������������������������������������������������������������������������

loc_4D4D4:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+2F6j
		mov	al, [di+28h]
		mov	ah, 0
		call	Math_RandomChance_54E4F
		or	al, al
		jz	short loc_4D4F8
		mov	al, [di+27h]
		mov	ah, 0
		imul	ax, 0Ch
		mov	dx, [si+11h]
		add	dx, ax
		les	bx, [bp+var_16]
		mov	es:[bx+8], dx
		jmp	short loc_4D50C
; ���������������������������������������������������������������������������

loc_4D4F8:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+317j
		mov	al, [di+29h]
		mov	ah, 0
		imul	ax, 0Ch
		mov	dx, [si+11h]

loc_4D503:
		add	dx, ax

loc_4D505:
		les	bx, [bp+var_16]

loc_4D508:
		mov	es:[bx+8], dx

loc_4D50C:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+2F0j
					; Elements_SpawnAlongSegment_4D1C9+309j ...
		push	large [bp+var_16]
		push	si
		push	cs

loc_4D512:
		call	near ptr ParticlePool_InsertElement
		add	sp, 6
		mov	eax, [bp+var_2C]
		add	[bp+arg_8], eax
		mov	eax, [bp+var_30]
		add	[bp+var_20], eax
		mov	eax, [bp+var_34]
		add	[bp+var_24], eax
		mov	eax, [bp+var_38]
		add	[bp+var_28], eax
		mov	ax, [di+1Bh]
		call	Math_RandomJitter_54E1C
		movsx	eax, ax
		mov	[bp+var_B4], eax
		mov	ax, [di+1Bh]
		call	Math_RandomJitter_54E1C
		movsx	eax, ax
		mov	[bp+var_B0], eax
		mov	ax, [di+1Bh]
		call	Math_RandomJitter_54E1C
		movsx	eax, ax
		mov	[bp+var_AC], eax
		lea	ax, [bp+var_9C]
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		push	ss
		lea	ax, [bp+var_CC]
		push	ax
		call	ChaseCamera_ComputeGeometryHelper_5525B
		add	sp, 8
		cmp	[bp+var_72], 0
		jz	short loc_4D591
		mov	ax, [bp+var_72]
		cmp	ax, [bp+var_74]
		jnz	short loc_4D5B1

loc_4D591:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+3BEj
		mov	eax, [bp+var_9C]
		add	[bp+var_C0], eax
		mov	eax, [bp+var_98]
		add	[bp+var_BC], eax
		mov	eax, [bp+var_94]
		add	[bp+var_B8], eax
		jmp	short loc_4D61A
; ���������������������������������������������������������������������������

loc_4D5B1:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+3C6j
		mov	eax, [bp+var_9C]
		add	eax, [bp+var_B4]
		mov	[bp+var_D8], eax
		mov	eax, [bp+var_98]
		add	eax, [bp+var_B0]
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_94]
		add	eax, [bp+var_AC]
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_D8]
		mov	[bp+var_E4], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_D0]
		mov	[bp+var_DC], eax
		mov	eax, [bp+var_E4]
		add	[bp+var_C0], eax
		mov	eax, [bp+var_E0]
		add	[bp+var_BC], eax
		mov	eax, [bp+var_DC]
		add	[bp+var_B8], eax

loc_4D61A:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+3E6j
		inc	[bp+var_72]

loc_4D61D:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+231j
		mov	ax, [bp+var_72]
		cmp	ax, [bp+var_8]
		jge	short loc_4D628
		jmp	loc_4D3FD
; ���������������������������������������������������������������������������

loc_4D628:				; CODE XREF: Elements_SpawnAlongSegment_4D1C9+12j
					; Elements_SpawnAlongSegment_4D1C9+D2j ...
		pop	di
		pop	si
		leave
		retf
Elements_SpawnAlongSegment_4D1C9	endp

; ���������������������������������������������������������������������������

loc_4D62C:				; DATA XREF: seg339:off_71EFCo
		push	bp
		mov	bp, sp
		mov	word_72A30, 11E8h
		mov	word_72A30, 30B6h
		and	byte_72A5C, 0FEh
		mov	word_72A36, 0
		mov	word_72A38, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4D64E:				; DATA XREF: seg106:0E66o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_4D6A1
		cmp	byte ptr [si+5], 0
		jz	short loc_4D67D
		cmp	dword ptr [si],	0
		jz	short loc_4D67D
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_4D67D:				; CODE XREF: seg106:1611j seg106:1617j
		mov	dword ptr [si],	0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_4D69F
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short loc_4D6A1
; ���������������������������������������������������������������������������

loc_4D69F:				; CODE XREF: seg106:1644j
		jmp	short $+2

loc_4D6A1:				; CODE XREF: seg106:160Bj seg106:164Dj
		pop	di
		pop	si
		pop	bp
		retf
seg106		ends
