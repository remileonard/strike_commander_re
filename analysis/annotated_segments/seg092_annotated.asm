seg092		segment	byte public 'CODE' use16
		assume cs:seg092
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	dword ptr es:[bx+49h], 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4340F:				; DATA XREF: seg339:off_6F4D4o
		push	bp
		mov	bp, sp
		mov	al, 13h
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_43416:				; DATA XREF: seg339:241Co
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+0Ah]

loc_43420:
		cmp	dword ptr [bp+6], 0

loc_43425:
		jz	short loc_43484

loc_43427:
		les	bx, [bp+6]

loc_4342A:
		mov	word ptr es:[bx], 241Ch

loc_4342F:
		cmp	dword ptr es:[bx+49h], 0
		jz	short loc_43455
		mov	eax, es:[bx+49h]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_43455:				; CODE XREF: seg092:0045j
		push	0
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6C009
		add	sp, 6
		test	si, 1
		jz	short loc_43484
		mov	eax, [bp+6]
		mov	[bp-8],	eax
		push	0
		push	2
		lea	ax, [bp-8]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_43484:				; CODE XREF: seg092:loc_43425j
					; seg092:0077j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_43487:				; DATA XREF: seg339:off_6FB84o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 13h

loc_4348F:
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_43491:				; DATA XREF: seg339:off_6FB60o
		push	bp

loc_43492:
		mov	bp, sp
		sub	sp, 4Ah
		push	si

loc_43498:
		push	di
		mov	si, [bp+6]
		mov	ax, si
		add	ax, 5Bh	; '['
		push	ax
		call	Timer_TickWithBlinkPulses_4FB46
		pop	cx
		cmp	dword ptr [si+57h], 0
		jle	short loc_434B2
		jmp	loc_438F2
; ���������������������������������������������������������������������������

loc_434B2:				; CODE XREF: seg092:00BDj
		mov	byte ptr [bp-5], 0
		cmp	byte ptr [si+63h], 0
		jnz	short loc_434BF
		jmp	loc_435B1
; ���������������������������������������������������������������������������

loc_434BF:				; CODE XREF: seg092:00CAj
		mov	al, [si+50h]
		mov	[bp-6],	al
		cmp	byte ptr [bp-6], 0FFh
		jnz	short loc_434D0
		mov	byte_6E4C2, 1

loc_434D0:				; CODE XREF: seg092:00D9j
		push	0
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	byte ptr [bp-7], 0
		xor	di, di
		push	6
		push	1
		push	0B4h ; '�'
		les	bx, [si+0Eh]
		push	large dword ptr	es:[bx+3Ah]
		push	si
		push	59C3h
		call	WorldObjects_Cluster_22A7D
		add	sp, 0Eh

loc_43501:
		mov	[bp-0Ah], ax
		push	ax
		jmp	short loc_43579
; ���������������������������������������������������������������������������

loc_43507:				; CODE XREF: seg092:01A5j
		or	di, di
		jnz	short loc_4350E
		mov	di, [si+51h]

loc_4350E:				; CODE XREF: seg092:0119j
		cmp	word ptr [si+51h], 0
		jz	short loc_4354E
		mov	bx, [si+51h]
		mov	al, [bx+50h]
		cmp	al, [bp-6]
		jz	short loc_4354E
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_4354A
		mov	bx, [si+51h]
		push	word ptr [bx+51h]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 5
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4354E

loc_4354A:				; CODE XREF: seg092:0138j
		mov	byte ptr [bp-7], 1

loc_4354E:				; CODE XREF: seg092:0122j seg092:012Dj ...
		mov	al, [bp-7]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_43587
		push	1
		push	1
		push	0B4h ; '�'
		les	bx, [si+0Eh]
		push	large dword ptr	es:[bx+3Ah]
		push	word ptr [si+51h]
		push	si
		push	59C3h
		call	WorldObjects_Cluster_22795
		add	sp, 10h
		mov	[bp-0Ch], ax
		push	ax

loc_43579:				; CODE XREF: seg092:0115j
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		call	SetReference16
		add	sp, 4

loc_43587:				; CODE XREF: seg092:0165j
		cmp	[si+51h], di
		jz	short loc_43598

loc_4358C:
		mov	al, [bp-7]
		mov	ah, 0

loc_43591:
		or	ax, ax
		jnz	short loc_43598
		jmp	loc_43507
; ���������������������������������������������������������������������������

loc_43598:				; CODE XREF: seg092:019Aj seg092:01A3j
		mov	al, [bp-7]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_435B1
		push	0
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		call	SetReference16
		add	sp, 4

loc_435B1:				; CODE XREF: seg092:00CCj seg092:01AFj
		cmp	word ptr [si+51h], 0
		jnz	short loc_435BA
		jmp	loc_436DC
; ���������������������������������������������������������������������������

loc_435BA:				; CODE XREF: seg092:01C5j
		mov	di, si
		add	di, 12h
		mov	dx, [si+51h]
		add	dx, 12h
		mov	eax, [di]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp-3Eh], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp-3Ah], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp-36h], eax
		push	eax
		push	large dword ptr	[bp-3Ah]
		push	large dword ptr	[bp-3Eh]

loc_435F3:
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-0Eh], eax
		mov	[bp-12h], eax
		mov	[bp-0Ah], eax
		les	bx, [si+0Eh]
		mov	eax, es:[bx+3Eh]
		mov	[bp-16h], eax
		shl	eax, 8
		cmp	eax, [bp-0Ah]
		jle	short loc_43626
		mov	ax, 1
		jmp	short loc_43628
; ���������������������������������������������������������������������������

loc_43626:				; CODE XREF: seg092:022Fj
		xor	ax, ax

loc_43628:				; CODE XREF: seg092:0234j
		or	al, al
		jz	short loc_43632
		mov	byte ptr [bp-5], 1
		jmp	short loc_43642
; ���������������������������������������������������������������������������

loc_43632:				; CODE XREF: seg092:023Aj
		push	0
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		call	SetReference16
		add	sp, 4

loc_43642:				; CODE XREF: seg092:0240j
		cmp	byte ptr [bp-5], 0
		jnz	short loc_4364B
		jmp	loc_436DC
; ���������������������������������������������������������������������������

loc_4364B:				; CODE XREF: seg092:0256j
		lea	ax, [bp-3Eh]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		mov	eax, [bp-3Eh]
		mov	[bp-4Ah], eax
		mov	eax, [bp-3Ah]
		mov	[bp-46h], eax
		mov	eax, [bp-36h]
		mov	[bp-42h], eax
		mov	dword ptr [bp-42h], 0
		mov	dword ptr [bp-1Ah], 0
		lea	ax, [bp-4Ah]
		push	ax

loc_43681:
		lea	ax, [bp-3Eh]
		push	ax
		push	ss
		lea	ax, [bp-1Eh]
		push	ax

loc_4368A:
		call	Math_DotProduct3D_5505B

loc_4368F:
		add	sp, 8

loc_43692:
		mov	eax, [bp-1Eh]
		mov	[bp-1Ah], eax
		mov	dword ptr [bp-22h], 0F00h
		lea	ax, [bp-22h]
		push	ax
		push	ss
		lea	ax, [bp-26h]
		push	ax
		call	Math_Sin_5483F
		add	sp, 6
		mov	eax, [bp-1Ah]
		cmp	eax, [bp-26h]
		jle	short loc_436C2
		mov	ax, 1
		jmp	short loc_436C4
; ���������������������������������������������������������������������������

loc_436C2:				; CODE XREF: seg092:02CBj
		xor	ax, ax

loc_436C4:				; CODE XREF: seg092:02D0j
		or	al, al
		jz	short loc_436DC
		mov	byte ptr [bp-5], 0
		push	0
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		call	SetReference16
		add	sp, 4

loc_436DC:				; CODE XREF: seg092:01C7j seg092:0258j ...
		cmp	byte ptr [bp-5], 0
		jnz	short loc_436E5
		jmp	loc_438FA
; ���������������������������������������������������������������������������

loc_436E5:				; CODE XREF: seg092:02F0j
		cmp	dword ptr [si+53h], 0
		jnz	short loc_436EF
		jmp	loc_438FA
; ���������������������������������������������������������������������������

loc_436EF:				; CODE XREF: seg092:02FAj
		les	bx, [si+0Eh]

loc_436F2:
		cmp	byte ptr es:[bx+48h], 0
		jnz	short loc_436FC
		jmp	loc_438E9
; ���������������������������������������������������������������������������

loc_436FC:				; CODE XREF: seg092:0307j
		mov	di, [si+51h]
		add	di, 1Ah
		push	1
		lea	ax, [bp-3Eh]
		push	ax
		mov	ax, [si+51h]
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp-0Eh]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [di]

loc_43723:
		sub	eax, [bp-0Eh]
		mov	[bp-0Ah], eax
		cmp	dword ptr [bp-0Ah], 13100h
		jle	short loc_4373A
		mov	ax, 1
		jmp	short loc_4373C
; ���������������������������������������������������������������������������

loc_4373A:				; CODE XREF: seg092:0343j
		xor	ax, ax

loc_4373C:				; CODE XREF: seg092:0348j
		or	al, al
		jnz	short loc_43743
		jmp	loc_438FA
; ���������������������������������������������������������������������������

loc_43743:				; CODE XREF: seg092:034Ej
		call	DisplayCache_ComputeChecksum_5D43F
		mov	bx, 3E8h
		xor	dx, dx
		div	bx
		mov	[bp-10h], ax
		mov	ax, word_70479
		cmp	ax, [bp-10h]
		jl	short loc_4375D
		jmp	loc_438FA
; ���������������������������������������������������������������������������

loc_4375D:				; CODE XREF: seg092:0368j
		push	1
		push	1
		les	bx, [si+0Eh]
		mov	ax, es:[bx+49h]
		add	ax, 4
		push	word ptr es:[bx+4Bh]
		push	ax
		push	571Ch
		call	ObjectPrototype_FindOrLoadAndInstantiate_38B70
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jnz	short loc_43784
		jmp	loc_438FA
; ���������������������������������������������������������������������������

loc_43784:				; CODE XREF: seg092:038Fj
		inc	word_70479
		mov	dx, [si+51h]
		add	dx, 12h
		mov	cx, si
		add	cx, 12h

loc_43793:
		mov	bx, dx
		mov	eax, [bx]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp-4Ah], eax
		mov	bx, dx
		mov	eax, [bx+4]
		mov	bx, cx
		sub	eax, [bx+4]
		mov	[bp-46h], eax
		mov	bx, dx
		mov	eax, [bx+8]
		mov	bx, cx
		sub	eax, [bx+8]
		mov	[bp-42h], eax
		lea	ax, [bp-4Ah]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		push	word ptr [si+51h]
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp-14h], dx
		mov	[bp-16h], ax
		les	bx, [bp-16h]
		mov	al, es:[bx+13h]
		mov	[bp-11h], al
		mov	[di+63h], al
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	dx, ax
		mov	bx, dx
		mov	eax, [bp-4Ah]
		mov	[bx], eax
		mov	eax, [bp-46h]
		mov	[bx+4],	eax
		mov	eax, [bp-42h]
		mov	[bx+8],	eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		push	3748h
		push	di
		mov	bx, [di]

loc_43822:
		call	dword ptr [bx+48h]
		add	sp, 4
		mov	ax, [si+51h]
		mov	[bp-18h], ax
		push	ax
		mov	ax, di
		add	ax, 55h	; 'U'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	[bp-1Ah], si
		push	word ptr [bp-1Ah]
		mov	ax, di
		add	ax, 57h	; 'W'
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	word ptr [si+51h], 0
		jz	short loc_43860
		mov	bx, [di+51h]
		mov	byte ptr [bx+39h], 1
		jmp	short loc_43867
; ���������������������������������������������������������������������������

loc_43860:				; CODE XREF: seg092:0465j
		mov	bx, [di+51h]
		mov	byte ptr [bx+39h], 0

loc_43867:				; CODE XREF: seg092:046Ej
		mov	[bp-1Ch], si
		push	word ptr [bp-1Ch]
		mov	ax, [di+51h]
		add	ax, 37h	; '7'
		push	ax
		call	SetReference16
		add	sp, 4
		mov	dx, si
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	[di+12h], eax
		mov	eax, [bx+4]
		mov	[di+16h], eax
		mov	eax, [bx+8]
		mov	[di+1Ah], eax
		les	bx, [si+0Eh]
		mov	eax, es:[bx+4Dh]
		shl	eax, 8
		mov	[bp-20h], eax
		shl	eax, 1
		add	[di+1Ah], eax
		and	byte ptr [di+4], 0FDh
		push	di
		push	59C3h
		call	List_AppendIfNonNull_21F8D
		add	sp, 4
		cmp	dword ptr [di+0Eh], 0
		jz	short loc_438D7
		les	bx, [di+0Eh]
		cmp	byte ptr es:[bx+4Eh], 1
		jnz	short loc_438D7
		mov	byte_6E4C6, 1

loc_438D7:				; CODE XREF: seg092:04D6j seg092:04E0j
		dec	dword ptr [si+53h]
		les	bx, [si+0Eh]
		mov	eax, es:[bx+44h]
		mov	[si+57h], eax
		jmp	short loc_438FA
; ���������������������������������������������������������������������������

loc_438E9:				; CODE XREF: seg092:0309j
		push	si
		nop
		push	cs
		call	near ptr Effect_SpawnPeriodicAtAttach
		pop	cx
		jmp	short loc_438FA
; ���������������������������������������������������������������������������

loc_438F2:				; CODE XREF: seg092:00BFj
		mov	eax, dword_70458
		sub	[si+57h], eax

loc_438FA:				; CODE XREF: seg092:02F2j seg092:02FCj ...
		push	si
		call	WorldObject_IsAlive_3CBB7
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4390B
		mov	al, 0
		jmp	short loc_43932
; ���������������������������������������������������������������������������

loc_4390B:				; CODE XREF: seg092:0515j
		push	1
		lea	ax, [bp-32h]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp-4]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp-4]
		mov	[si+1Ah], eax
		mov	al, 1

loc_43932:				; CODE XREF: seg092:0519j
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,312L — tire un nombre aléatoire (sub_5D43F, modulo 500) comparé à un compteur global
; (word_7047B), instancie un débris à un point d'attache (sub_38B70) : génération probabiliste
; d'un effet visuel périodique attaché à un objet (candidat : fumée/traînée de moteur ou
; étincelle de dommage).
; ==============================================================================================
Effect_SpawnPeriodicAtAttach	proc far		; CODE XREF: seg092:04FCp

var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 90h
		push	si
		push	di
		mov	si, [bp+arg_0]
		call	DisplayCache_ComputeChecksum_5D43F
		mov	bx, 1F4h
		xor	dx, dx
		div	bx
		mov	[bp+var_2], ax
		mov	ax, word_7047B
		cmp	ax, [bp+var_2]
		jl	short loc_4395C
		jmp	loc_43C6C
; ���������������������������������������������������������������������������

loc_4395C:				; CODE XREF: Effect_SpawnPeriodicAtAttach+21j
		push	1
		push	1
		les	bx, [si+0Eh]
		mov	ax, es:[bx+49h]
		add	ax, 4
		push	word ptr es:[bx+4Bh]
		push	ax
		push	571Ch
		call	ObjectPrototype_FindOrLoadAndInstantiate_38B70
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jnz	short loc_43983

loc_43980:
		jmp	loc_43C6C
; ���������������������������������������������������������������������������

loc_43983:				; CODE XREF: Effect_SpawnPeriodicAtAttach+48j
		inc	word_7047B

loc_43987:
		mov	[bp+var_4], si
		push	[bp+var_4]

loc_4398D:
		add	ax, 44h	; 'D'
		push	ax

loc_43991:
		call	SetReference16
		add	sp, 4
		mov	ax, [si+51h]
		add	ax, 12h
		mov	[bp+var_6], ax
		mov	ax, si
		add	ax, 12h
		mov	[bp+var_8], ax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	bx, [bp+var_8]
		sub	eax, [bx]
		mov	[bp+var_54], eax
		mov	bx, [bp+var_6]
		mov	eax, [bx+4]
		mov	bx, [bp+var_8]
		sub	eax, [bx+4]
		mov	[bp+var_50], eax
		mov	bx, [bp+var_6]
		mov	eax, [bx+8]
		mov	bx, [bp+var_8]
		sub	eax, [bx+8]
		mov	[bp+var_4C], eax
		mov	[bp+var_C], eax
		push	eax
		push	large [bp+var_50]
		push	large [bp+var_54]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_14], eax
		mov	[bp+var_10], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_1A]
		mov	dx, [bp+var_1C]
		add	dx, 7Ch	; '|'
		mov	word ptr [bp+var_20+2],	ax
		mov	word ptr [bp+var_20], dx
		les	bx, [bp+var_20]
		mov	eax, es:[bx]
		mov	[bp+var_24], eax
		lea	ax, [bp+var_24]
		mov	word ptr [bp+var_28+2],	ss
		mov	word ptr [bp+var_28], ax
		les	bx, [bp+var_28]
		mov	eax, es:[bx]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_10]
		mov	edx, eax
		mov	ecx, [bp+var_18]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_2C], eax
		push	word ptr [si+51h]
		push	ss
		lea	ax, [bp+var_6C]
		push	ax
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+44h]
		add	sp, 6
		mov	eax, [bp+var_6C]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_60], eax
		mov	eax, [bp+var_68]

loc_43A7F:
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_64]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_58], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_30], eax
		les	bx, [si+0Eh]
		mov	ax, es:[bx+42h]
		call	Math_RandomScale_54DF4
		mov	[bp+var_32], ax
		mov	ax, word ptr [bp+var_C+1]
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		add	[bp+var_32], ax
		movsx	eax, [bp+var_32]
		shl	eax, 8
		mov	edx, [bp+var_30]
		imul	edx, eax
		mov	[bp+var_30], edx
		mov	ebx, 0C800h
		mov	eax, [bp+var_30]
		cdq
		idiv	ebx
		mov	[bp+var_30], eax
		test	[bp+var_32], 1
		jz	short loc_43AFC
		neg	eax
		mov	[bp+var_30], eax

loc_43AFC:				; CODE XREF: Effect_SpawnPeriodicAtAttach+1BDj
		push	word ptr [si+51h]
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_34], ax
		mov	bx, [bp+var_34]
		mov	eax, [bx]
		mov	[bp+var_78], eax
		mov	eax, [bx+4]
		mov	[bp+var_74], eax
		mov	eax, [bx+8]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_78]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_78], eax
		mov	eax, [bp+var_74]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_74], eax
		mov	eax, [bp+var_70]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_70], eax
		mov	eax, [bp+var_60]
		add	eax, [bp+var_78]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_5C]
		add	eax, [bp+var_74]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_58]
		add	eax, [bp+var_70]

loc_43B81:
		mov	[bp+var_58], eax
		mov	eax, [bp+var_54]
		add	eax, [bp+var_60]
		mov	[bp+var_54], eax

loc_43B91:
		mov	eax, [bp+var_50]
		add	eax, [bp+var_5C]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_4C]
		add	eax, [bp+var_58]
		mov	[bp+var_4C], eax
		lea	ax, [bp+var_54]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		mov	eax, [bp+var_54]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_88], eax
		les	bx, [si+0Eh]
		mov	eax, es:[bx+4Dh]
		mov	[bp+var_38], eax
		shl	eax, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_90]
		mov	edx, [bp+var_3C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_90], eax
		mov	eax, [bp+var_8C]
		mov	edx, [bp+var_3C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_88]
		mov	edx, [bp+var_3C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_88], eax
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_90]
		push	ax
		push	si
		push	di
		call	Particle_ComputeSpawnJitter
		add	sp, 8
		push	di
		push	59C3h
		call	List_AppendIfNonNull_21F8D
		add	sp, 4
		dec	dword ptr [si+53h]
		les	bx, [si+0Eh]
		mov	eax, es:[bx+44h]
		mov	[si+57h], eax

loc_43C6C:				; CODE XREF: Effect_SpawnPeriodicAtAttach+23j
					; Effect_SpawnPeriodicAtAttach:loc_43980j
		pop	di
		pop	si
		leave
		retf
Effect_SpawnPeriodicAtAttach	endp

; ���������������������������������������������������������������������������

loc_43C70:				; DATA XREF: seg339:off_6FB68o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_43CB7
		mov	word ptr [si], 2AA0h

loc_43C83:
		push	0

loc_43C85:
		mov	ax, si

loc_43C87:
		add	ax, 51h	; 'Q'
		push	ax

loc_43C8B:
		call	SetReference16
		add	sp, 4

loc_43C93:
		mov	ax, si
		add	ax, 51h	; 'Q'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	WorldObject_BaseDestruct
		add	sp, 4
		test	di, 1
		jz	short loc_43CB7
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_43CB7:				; CODE XREF: seg092:088Dj seg092:08BEj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_43CBB:				; DATA XREF: seg339:2B28o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		xor	dx, dx
		mov	ax, [bp+8]
		cmp	ax, 0BEh ; '�'
		jnz	short loc_43CD7

loc_43CCC:
		mov	dword ptr [si+53h], 0
		mov	dx, 1

loc_43CD7:				; CODE XREF: seg092:08DAj
		mov	ax, dx
		pop	si
		pop	bp
		retf
seg092		ends
