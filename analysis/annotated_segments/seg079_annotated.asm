seg079		segment	byte public 'CODE' use16
		assume cs:seg079
		;org 7
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_38377:				; DATA XREF: seg339:off_6EC27o
		push	bp
		mov	bp, sp
		mov	al, 0

loc_3837C:				; DATA XREF: seg216:033Eo
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3837E:				; DATA XREF: seg339:1B73o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	2Ch ; ','
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_383C9
		mov	word ptr [si], 10E4h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 1ADCh
		push	large dword ptr	[bp-4]
		push	ax
		call	Debris_BodyAttachToSubpart
		add	sp, 6
		mov	ax, si
		jmp	short loc_383CB
; ���������������������������������������������������������������������������

loc_383C9:				; CODE XREF: seg079:0029j
		mov	ax, si

loc_383CB:				; CODE XREF: seg079:0057j
		mov	si, ax
		push	ax
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		mov	ax, si
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_383DF:				; DATA XREF: seg339:off_6EC2Fo
					; seg339:off_6F464o ...
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		push	8
		push	ds
		push	offset aTerrain	; "TERRAIN"
		push	large dword ptr	[di+6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_38408
		mov	ax, 1
		jmp	short loc_3840A
; ���������������������������������������������������������������������������

loc_38408:				; CODE XREF: seg079:0091j
		xor	ax, ax

loc_3840A:				; CODE XREF: seg079:0096j
		or	al, al
		jz	short loc_3841C
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+11h], 2
		jz	short loc_38449

loc_38418:				; CODE XREF: seg079:00D7j
		mov	al, 1
		jmp	short loc_3844B
; ���������������������������������������������������������������������������

loc_3841C:				; CODE XREF: seg079:009Cj
		les	bx, [bp+6]
		mov	al, es:[bx+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_38449
		push	si
		push	di
		mov	bx, [di]
		call	dword ptr [bx+84h]
		add	sp, 4
		mov	[bp-2],	ax
		mov	[bp-4],	ax
		add	[si+2Ah], ax
		mov	ax, [si+2Ah]

loc_38440:
		les	bx, [bp+6]

loc_38443:
		cmp	ax, es:[bx+6]
		jnb	short loc_38418

loc_38449:				; CODE XREF: seg079:00A6j seg079:00B7j
		mov	al, 0

loc_3844B:				; CODE XREF: seg079:00AAj
		pop	di
		pop	si

locret_3844D:
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,200L — tire un nombre aléatoire (sub_5D43F) comparé à un seuil (0x1800), résout un point
; d'attache indexé (sub_54DF4, table 0x1A octets/entrée), appelle sub_38B70 avec un
; identifiant fixe (0x571C) : génération probabiliste de débris à un point d'attache lors de
; la destruction d'un composant.
; ==============================================================================================
Debris_SpawnAtAttachPoint	proc far		; CODE XREF: Debris_SpawnOrchestrator+1E2p
					; Debris_SpawnOrchestratorVariant_9D770+191P ...

var_32		= dword	ptr -32h
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp

loc_38450:
		mov	bp, sp

loc_38452:
		sub	sp, 2Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	byte_70447, 0
		call	DisplayCache_ComputeChecksum_5D43F
		movzx	eax, ax
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+21h], 0
		jnz	short loc_3847A
		jmp	loc_38636
; ���������������������������������������������������������������������������

loc_3847A:				; CODE XREF: Debris_SpawnAtAttachPoint+26j
		cmp	[bp+var_4], 1800h
		jg	short loc_38487
		jmp	loc_38636
; ���������������������������������������������������������������������������

loc_38487:				; CODE XREF: Debris_SpawnAtAttachPoint+33j
		push	di
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	[bp+var_8], 99h	; '�'
		sub	sp, 4
		mov	eax, [bp+var_8]
		mov	[bp+var_32], eax
		lea	ax, [bp+var_1E]
		push	ax
		call	Utility_Helper_55A62
		add	sp, 6
		mov	[bp+var_E], 0
		jmp	loc_3862B
; ���������������������������������������������������������������������������

loc_384BC:				; CODE XREF: Debris_SpawnAtAttachPoint+1E4j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Fh]
		call	Math_RandomScale_54DF4
		imul	ax, 1Ah
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+23h]
		mov	bx, es:[bx+21h]
		add	bx, ax
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], bx
		mov	eax, [bp+var_C]
		mov	[bp+var_12], eax
		push	1
		push	1
		push	large [bp+var_12]
		push	571Ch
		nop
		push	cs
		call	near ptr Debris_LoadAndInstantiate
		add	sp, 0Ah
		mov	si, ax
		or	si, si
		jnz	short loc_38502
		jmp	loc_38628
; ���������������������������������������������������������������������������

loc_38502:				; CODE XREF: Debris_SpawnAtAttachPoint+AEj
		les	bx, [bp+var_C]
		mov	ax, es:[bx+8]
		call	Math_RandomJitter_54E1C
		movsx	eax, ax
		shl	eax, 8
		mov	edx, [di+12h]
		add	edx, eax
		mov	[si+12h], edx
		les	bx, [bp+var_C]
		mov	ax, es:[bx+0Ah]
		call	Math_RandomJitter_54E1C
		movsx	eax, ax
		shl	eax, 8
		mov	edx, [di+16h]
		add	edx, eax
		mov	[si+16h], edx
		les	bx, [bp+var_C]
		mov	ax, es:[bx+0Ch]
		call	Math_RandomJitter_54E1C
		movsx	eax, ax

loc_38550:
		shl	eax, 8
		mov	edx, [di+1Ah]
		add	edx, eax
		mov	[si+1Ah], edx
		les	bx, [bp+var_C]

loc_38562:
		movsx	eax, word ptr es:[bx+0Eh]
		shl	eax, 8
		mov	edx, [bp+var_1E]
		add	edx, eax
		push	edx
		mov	ax, es:[bx+14h]
		call	Math_RandomJitter_54E1C
		movsx	eax, ax
		shl	eax, 8
		pop	edx
		add	edx, eax
		mov	[bp+var_2A], edx
		les	bx, [bp+var_C]
		movsx	eax, word ptr es:[bx+10h]
		shl	eax, 8
		mov	edx, [bp+var_1A]
		add	edx, eax
		push	edx
		mov	ax, es:[bx+16h]
		call	Math_RandomJitter_54E1C
		movsx	eax, ax
		shl	eax, 8
		pop	edx
		add	edx, eax
		mov	[bp+var_26], edx
		les	bx, [bp+var_C]
		movsx	eax, word ptr es:[bx+12h]
		shl	eax, 8
		mov	edx, [bp+var_16]
		add	edx, eax
		push	edx
		mov	ax, es:[bx+18h]
		call	Math_RandomJitter_54E1C
		movsx	eax, ax
		shl	eax, 8
		pop	edx
		add	edx, eax
		mov	[bp+var_22], edx
		lea	ax, [bp+var_2A]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 4
		push	large dword ptr	[si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+24h]
		add	sp, 4
		cmp	al, 5
		jnz	short loc_3861C
		push	large dword ptr	[si+0Ah]
		call	Gauge_ResolveInterpolated
		add	sp, 4

loc_3861C:				; CODE XREF: Debris_SpawnAtAttachPoint+1BFj
		push	si
		push	59C3h
		call	Container_KeyEquals
		add	sp, 4

loc_38628:				; CODE XREF: Debris_SpawnAtAttachPoint+B0j
		inc	[bp+var_E]

loc_3862B:				; CODE XREF: Debris_SpawnAtAttachPoint+6Aj
		mov	ax, [bp+var_E]
		cmp	ax, [bp+arg_6]
		jge	short loc_38636
		jmp	loc_384BC
; ���������������������������������������������������������������������������

loc_38636:				; CODE XREF: Debris_SpawnAtAttachPoint+28j
					; Debris_SpawnAtAttachPoint+35j ...
		pop	di
		pop	si
		leave
		retf
Debris_SpawnAtAttachPoint	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,420L — grosse fonction du même cluster (buffer conséquent, appelle sub_3844F) : candidat
; pour l'orchestrateur complet de génération de débris lors de la destruction d'un objet, à
; approfondir.
; ==============================================================================================
Debris_SpawnOrchestrator	proc far		; CODE XREF: Debris_SpawnOrchestratorVariant_9D770+4CP
					; DATA XREF: seg339:off_6EC2Bo	...

var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		mov	ah, 0
		cmp	ax, 8
		jz	short loc_38678

loc_38653:
		cmp	ax, 9

loc_38656:
		jz	short loc_3865F

loc_38658:
		cmp	ax, 0Dh
		jz	short loc_38691

loc_3865D:
		jmp	short loc_386A2
; ���������������������������������������������������������������������������

loc_3865F:				; CODE XREF: Debris_SpawnOrchestrator:loc_38656j
		push	si
		mov	bx, [si]

loc_38662:
		call	dword ptr [bx+38h]
		pop	cx
		cmp	ax, word_722E6
		jnz	short loc_38672
		dec	word_7047F
		jmp	short loc_386A2
; ���������������������������������������������������������������������������

loc_38672:				; CODE XREF: Debris_SpawnOrchestrator+30j
		dec	word_70481
		jmp	short loc_386A2
; ���������������������������������������������������������������������������

loc_38678:				; CODE XREF: Debris_SpawnOrchestrator+17j
		push	si
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		cmp	ax, word_722E6
		jnz	short loc_3868B
		dec	word_7047D
		jmp	short loc_386A2
; ���������������������������������������������������������������������������

loc_3868B:				; CODE XREF: Debris_SpawnOrchestrator+49j
		dec	word_70479
		jmp	short loc_386A2
; ���������������������������������������������������������������������������

loc_38691:				; CODE XREF: Debris_SpawnOrchestrator+21j
		push	si
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		cmp	ax, word_722E6
		jz	short loc_386A2
		dec	word_7047B

loc_386A2:				; CODE XREF: Debris_SpawnOrchestrator:loc_3865Dj
					; Debris_SpawnOrchestrator+36j ...
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+3], 0
		jz	short loc_386B1
		mov	al, 0
		jmp	loc_3896A
; ���������������������������������������������������������������������������

loc_386B1:				; CODE XREF: Debris_SpawnOrchestrator+70j
		push	[bp+arg_6]
		push	si
		call	Combat_TeamOpposedCheckAndDispatch_53A94
		add	sp, 4
		cmp	word_722E6, si
		jnz	short loc_386D1
		mov	al, byte_6E4B6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_386D1
		mov	al, 0
		jmp	loc_3896A
; ���������������������������������������������������������������������������

loc_386D1:				; CODE XREF: Debris_SpawnOrchestrator+87j
					; Debris_SpawnOrchestrator+90j
		mov	byte_70447, 0
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+19h], 0
		jnz	short loc_386E4
		jmp	loc_38807
; ���������������������������������������������������������������������������

loc_386E4:				; CODE XREF: Debris_SpawnOrchestrator+A5j
		mov	eax, es:[bx+19h]
		mov	[bp+var_6+2], eax
		push	1
		push	1
		push	large [bp+var_6+2]
		push	571Ch
		nop
		push	cs
		call	near ptr Debris_LoadAndInstantiate
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jnz	short loc_38709
		jmp	loc_38807
; ���������������������������������������������������������������������������

loc_38709:				; CODE XREF: Debris_SpawnOrchestrator+CAj
		mov	dx, si
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]

loc_38713:
		mov	[di+12h], eax
		mov	eax, [bx+4]

loc_3871B:
		mov	[di+16h], eax

loc_3871F:
		mov	eax, [bx+8]

loc_38723:
		mov	[di+1Ah], eax

loc_38727:
		push	64h ; 'd'
		les	bx, [bp+arg_0]
		les	bx, es:[bx+19h]
		push	word ptr es:[bx+0Ah]
		sub	sp, 4
		mov	ax, es:[bx+8]
		mov	word ptr [bp+var_6], ax

loc_3873E:
		movsx	eax, word ptr [bp+var_6]

loc_38743:
		shl	eax, 8

loc_38747:
		mov	[bp+var_2E], eax
		push	di

loc_3874C:
		call	Debris_ConfigureByTargetType
		add	sp, 0Ah

loc_38754:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+38h]
		pop	cx
		mov	word ptr [bp+var_A+2], ax
		push	ax
		mov	ax, di
		add	ax, 5Ah	; 'Z'
		push	ax
		call	SetReference16
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]
		add	sp, 4
		test	byte ptr [si+4], 20h
		jz	short loc_3879A
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		mov	ax, es:[bx+4Bh]
		mov	word ptr [bp+var_A], ax
		mov	[di+5Ch], ax
		jmp	short loc_3879F
; ���������������������������������������������������������������������������

loc_3879A:				; CODE XREF: Debris_SpawnOrchestrator+148j
		mov	word ptr [di+5Ch], 0

loc_3879F:				; CODE XREF: Debris_SpawnOrchestrator+15Ej
		mov	eax, [di+12h]
		mov	bx, word_72A8F
		sub	eax, [bx+14h]
		mov	[bp+var_22], eax
		mov	eax, [di+16h]
		sub	eax, [bx+18h]
		mov	[bp+var_1E], eax
		mov	eax, [di+1Ah]
		sub	eax, [bx+1Ch]
		mov	[bp+var_1A], eax
		push	eax
		push	large [bp+var_1E]
		push	large [bp+var_22]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		sar	eax, 8
		mov	[bp+var_E], eax
		push	0
		push	eax
		push	3
		call	Weapon_HUDBox_TimerCaseH_5A8DC
		add	sp, 8
		push	di
		push	59C3h
		call	Container_KeyEquals
		add	sp, 4

loc_38807:				; CODE XREF: Debris_SpawnOrchestrator+A7j
					; Debris_SpawnOrchestrator+CCj
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+21h], 0
		jz	short loc_38822
		push	word ptr es:[bx+1Dh]
		push	si

loc_38817:
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr Debris_SpawnAtAttachPoint

loc_3881F:
		add	sp, 8

loc_38822:				; CODE XREF: Debris_SpawnOrchestrator+1D6j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+27h], 0
		jnz	short loc_38830
		jmp	loc_38968
; ���������������������������������������������������������������������������

loc_38830:				; CODE XREF: Debris_SpawnOrchestrator+1F1j
		call	Registry_LookupForTextRenderer_5B5D9
		push	dx
		push	ax
		pop	eax
		cmp	eax, 249F0h
		ja	short loc_38844

loc_38841:
		jmp	loc_38968
; ���������������������������������������������������������������������������

loc_38844:				; CODE XREF: Debris_SpawnOrchestrator+205j
		push	si
		push	59C3h
		call	Container_Op_2258E
		add	sp, 4
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_3885C
		jmp	loc_38968
; ���������������������������������������������������������������������������

loc_3885C:				; CODE XREF: Debris_SpawnOrchestrator+21Dj
		push	si
		push	ss
		lea	ax, [bp+var_22]
		push	ax

loc_38862:
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	[bp+var_6], 99h	; '�'
		sub	sp, 4
		mov	eax, [bp+var_6]
		mov	[bp+var_2A], eax
		lea	ax, [bp+var_22]
		push	ax
		call	Utility_Helper_55A62
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+27h]
		mov	[bp+var_A], eax
		mov	word ptr [bp+var_E+2], 0
		jmp	loc_38959
; ���������������������������������������������������������������������������

loc_3889D:				; CODE XREF: Debris_SpawnOrchestrator+32Bj
		mov	eax, [bp+var_A]
		mov	[bp+var_12+2], eax
		push	1
		push	1
		push	large [bp+var_12+2]
		push	571Ch
		nop
		push	cs
		call	near ptr Debris_LoadAndInstantiate
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jnz	short loc_388C1
		jmp	loc_38952
; ���������������������������������������������������������������������������

loc_388C1:				; CODE XREF: Debris_SpawnOrchestrator+282j
		les	bx, [bp+var_A]
		movsx	eax, word ptr es:[bx+8]
		shl	eax, 8
		mov	edx, [si+12h]
		add	edx, eax
		mov	[di+12h], edx
		movsx	eax, word ptr es:[bx+0Ah]
		shl	eax, 8
		mov	edx, [si+16h]
		add	edx, eax
		mov	[di+16h], edx
		movsx	eax, word ptr es:[bx+0Ch]
		shl	eax, 8
		mov	edx, [si+1Ah]
		add	edx, eax
		mov	[di+1Ah], edx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]

loc_38911:
		add	sp, 4
		lea	ax, [bp+var_22]
		push	ax
		push	di
		mov	bx, [di]

loc_3891B:
		call	dword ptr [bx+50h]
		add	sp, 4
		push	large dword ptr	[di+0Ah]
		les	bx, [di+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+24h]
		add	sp, 4
		cmp	al, 5
		jnz	short loc_38941
		push	large dword ptr	[di+0Ah]
		call	Gauge_ResolveInterpolated
		add	sp, 4

loc_38941:				; CODE XREF: Debris_SpawnOrchestrator+2F9j
		mov	word ptr [bp+var_12], di
		push	word ptr [bp+var_12]
		push	[bp+var_2]
		call	Container_KeyCompare
		add	sp, 4

loc_38952:				; CODE XREF: Debris_SpawnOrchestrator+284j
		inc	word ptr [bp+var_E+2]

loc_38955:
		add	word ptr [bp+var_A], 0Eh

loc_38959:				; CODE XREF: Debris_SpawnOrchestrator+260j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+25h]
		cmp	ax, word ptr [bp+var_E+2]
		jle	short loc_38968
		jmp	loc_3889D
; ���������������������������������������������������������������������������

loc_38968:				; CODE XREF: Debris_SpawnOrchestrator+1F3j
					; Debris_SpawnOrchestrator:loc_38841j	...
		mov	al, 1

loc_3896A:				; CODE XREF: Debris_SpawnOrchestrator+74j
					; Debris_SpawnOrchestrator+94j
		pop	di
		pop	si
		leave
		retf
Debris_SpawnOrchestrator	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,32L — destructeur (type 0x1AD0) libérant la liste des débris associés : destructeur du
; gestionnaire de débris d'un objet.
; ==============================================================================================
Debris_ManagerDestruct	proc far		; CODE XREF: seg078:loc_3836DP
					; DATA XREF: seg339:1AD0o

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_38999
		mov	word ptr [si], 1AD0h
		mov	word ptr [si], 75Ch
		push	si
		call	LinkedListB_Helper_5F66B
		pop	cx
		test	di, 1
		jz	short loc_38999
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_38999:				; CODE XREF: Debris_ManagerDestruct+Dj
					; Debris_ManagerDestruct+22j
		pop	di
		pop	si
		pop	bp
		retf
Debris_ManagerDestruct	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		xor	di, di

loc_389AF:				; CODE XREF: seg079:0656j
		lea	ax, [bp-2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jz	short loc_389C8
		mov	ax, di
		inc	di
		cmp	ax, [bp+8]
		jl	short loc_389AF

loc_389C8:				; CODE XREF: seg079:064Ej
		cmp	word ptr [bp-2], 0
		jz	short loc_389DA
		push	word ptr [bp-2]
		push	si
		nop
		push	cs
		call	near ptr Debris_ReleaseRefCounted
		add	sp, 4

loc_389DA:				; CODE XREF: seg079:065Cj
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,43L — recherche dans une liste un élément dont le champ (+4) correspond à une valeur,
; puis le retire (sub_38A20) : recherche et suppression d'un débris spécifique par
; identifiant.
; ==============================================================================================
Debris_FindAndRemoveByID	proc far		; CODE XREF: Debris_FindAndUnregister_9B700+69P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0

loc_389ED:				; CODE XREF: Debris_FindAndRemoveByID+2Bj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jz	short loc_38A0B
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		cmp	eax, [bp+arg_2]
		jnz	short loc_389ED

loc_38A0B:				; CODE XREF: Debris_FindAndRemoveByID+1Ej
		cmp	[bp+var_2], 0
		jz	short loc_38A1D
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr Debris_ReleaseRefCounted

loc_38A1A:
		add	sp, 4

loc_38A1D:				; CODE XREF: Debris_FindAndRemoveByID+31j
		pop	si
		leave
		retf
Debris_FindAndRemoveByID	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,60L — décrémente un compteur de référence (+4), si nul et flag actif (+2) notifie
; (vtable[0]) et retire de la liste : libération d'un débris quand son compteur de référence
; atteint zéro.
; ==============================================================================================
Debris_ReleaseRefCounted	proc far		; CODE XREF: seg079:0664p
					; Debris_FindAndRemoveByID+39p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_38A75
		mov	eax, [di+4]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		dec	word ptr es:[bx+4]

loc_38A41:
		mov	al, es:[bx+4]

loc_38A45:
		mov	ah, 0

loc_38A47:
		or	ax, ax
		jnz	short loc_38A75

loc_38A4B:
		cmp	byte ptr es:[bx+2], 0
		jz	short loc_38A75

loc_38A52:
		cmp	[bp+var_4], 0
		jz	short loc_38A69
		push	3
		push	word ptr [bp+var_4+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short $+2

loc_38A69:				; CODE XREF: Debris_ReleaseRefCounted+37j
		push	0
		push	di
		push	si
		call	LinkedListB_FindAndDispatch_5F5A4
		add	sp, 6

loc_38A75:				; CODE XREF: Debris_ReleaseRefCounted+10j
					; Debris_ReleaseRefCounted+29j ...
		pop	di
		pop	si
		leave
		retf
Debris_ReleaseRefCounted	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,75L — recherche un modèle de débris par identifiant dans une table globale (offset
; +0x2B) : recherche d'un modèle de débris pré-chargé par identifiant.
; ==============================================================================================
Debris_FindModelByID	proc far		; CODE XREF: Debris_LoadAndInstantiate+10p
					; Debris_LoadAndInstantiateAlt+10p ...

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= byte ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	eax, [bp+arg_2]
		mov	[bp+var_14], eax
		push	8
		push	large [bp+var_14]
		push	ds
		lea	ax, [bp+var_10]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	[bp+var_8], 0
		jmp	short loc_38AE0
; ���������������������������������������������������������������������������

loc_38AA9:				; CODE XREF: Debris_FindModelByID+76j
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[bp+var_6], eax
		les	bx, [bp+var_6]
		mov	eax, es:[bx+2Bh]
		cmp	eax, [bp+var_10]
		jnz	short loc_38AD2
		mov	eax, es:[bx+2Fh]
		cmp	eax, [bp+var_C]
		jnz	short loc_38AD2
		mov	ax, 1
		jmp	short loc_38AD4
; ���������������������������������������������������������������������������

loc_38AD2:				; CODE XREF: Debris_FindModelByID+47j
					; Debris_FindModelByID+52j
		xor	ax, ax

loc_38AD4:				; CODE XREF: Debris_FindModelByID+57j
		or	al, al
		jz	short loc_38AE0
		mov	dx, word ptr [bp+var_6+2]
		mov	ax, word ptr [bp+var_6]
		jmp	short loc_38AF5
; ���������������������������������������������������������������������������

loc_38AE0:				; CODE XREF: Debris_FindModelByID+2Ej
					; Debris_FindModelByID+5Dj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_38AA9
		xor	dx, dx
		xor	ax, ax

loc_38AF5:				; CODE XREF: Debris_FindModelByID+65j
		pop	si
		leave
		retf
Debris_FindModelByID	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		jmp	short loc_38B1A
; ���������������������������������������������������������������������������

loc_38B09:				; CODE XREF: seg079:07B9j
		mov	bx, [bp-2]
		mov	eax, [bx+4]
		cmp	eax, [bp+8]

loc_38B14:
		jnz	short loc_38B1A
		mov	al, 1

loc_38B18:
		jmp	short loc_38B2D
; ���������������������������������������������������������������������������

loc_38B1A:				; CODE XREF: seg079:0797j
					; seg079:loc_38B14j
		lea	ax, [bp-2]
		push	ax
		push	si

loc_38B1F:
		call	LinkedListB_Helper_5F6A9

loc_38B24:
		add	sp, 4

loc_38B27:
		or	ax, ax
		jnz	short loc_38B09
		mov	al, 0

loc_38B2D:				; CODE XREF: seg079:loc_38B18j
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
		jmp	short loc_38B57
; ���������������������������������������������������������������������������

loc_38B44:				; CODE XREF: seg079:07F6j
		mov	ax, di
		inc	di
		cmp	ax, [bp+8]
		jnz	short loc_38B57
		mov	bx, [bp-2]
		mov	dx, [bx+6]
		mov	ax, [bx+4]
		jmp	short loc_38B6C
; ���������������������������������������������������������������������������

loc_38B57:				; CODE XREF: seg079:07D2j seg079:07DAj
		lea	ax, [bp-2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_38B44
		xor	dx, dx
		xor	ax, ax

loc_38B6C:				; CODE XREF: seg079:07E5j
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,81L — recherche un modèle de débris (sub_38A79), le charge si absent (sub_3B876),
; l'attache à un flag et invoque sa création (vtable[4]) : chargement et instanciation d'un
; modèle de débris (avec cache).
; ==============================================================================================
Debris_LoadAndInstantiate	proc far		; CODE XREF: Debris_SpawnAtAttachPoint+A4p
					; Debris_SpawnOrchestrator+C0p ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr Debris_FindModelByID
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_38BAA
		mov	al, [bp+arg_8]
		push	ax
		push	large [bp+arg_2]
		push	si
		call	IFF_LoadModelMain
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_38BAA:				; CODE XREF: Debris_LoadAndInstantiate+21j
		cmp	[bp+var_4], 0
		jz	short loc_38C0D
		les	bx, [bp+var_4]
		mov	al, [bp+arg_6]
		mov	es:[bx+34h], al
		push	word ptr [bp+var_4+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	si, ax
		or	si, si
		jz	short loc_38C09
		mov	[bp+var_8], 0
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx+15h], 0
		jz	short loc_38BFA
		push	ax
		push	large dword ptr	es:[bx+15h]
		les	bx, es:[bx+15h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax

loc_38BFA:				; CODE XREF: Debris_LoadAndInstantiate+6Fj
		mov	eax, [bp+var_8]
		mov	[si+0Ah], eax
		les	bx, [bp+var_4]
		inc	word ptr es:[bx+4]

loc_38C09:				; CODE XREF: Debris_LoadAndInstantiate+5Cj
		mov	ax, si
		jmp	short loc_38C0F
; ���������������������������������������������������������������������������

loc_38C0D:				; CODE XREF: Debris_LoadAndInstantiate+3Fj
		xor	ax, ax

loc_38C0F:				; CODE XREF: Debris_LoadAndInstantiate+9Bj
		pop	si
		leave

locret_38C11:
		retf
Debris_LoadAndInstantiate	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,85L — variante de sub_38B70 utilisant sub_3CA22 pour la résolution finale : chargement
; et instanciation de débris, variante avec résolution alternative.
; ==============================================================================================
Debris_LoadAndInstantiateAlt	proc far		; CODE XREF: PlayerComponent_ComputeComplex_9E812+105P

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp

loc_38C15:
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr Debris_FindModelByID
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_38C4C
		mov	al, [bp+arg_8]
		push	ax
		push	large [bp+arg_2]
		push	si
		call	IFF_LoadModelMain
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_38C4C:				; CODE XREF: Debris_LoadAndInstantiateAlt+21j
		cmp	[bp+var_4], 0
		jz	short loc_38CBD

loc_38C53:
		push	large [bp+var_4]
		push	0
		call	WorldObject_BaseConstructAttached
		add	sp, 6
		mov	si, ax
		or	si, si
		jz	short loc_38CB9
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 2Bh	; '+'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	eax, [bp+var_8]
		mov	[si+6],	eax
		mov	[bp+var_C], 0
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx+15h], 0
		jz	short loc_38CAA
		push	si
		push	large dword ptr	es:[bx+15h]
		les	bx, es:[bx+15h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax

loc_38CAA:				; CODE XREF: Debris_LoadAndInstantiateAlt+7Dj
		mov	eax, [bp+var_C]
		mov	[si+0Ah], eax
		les	bx, [bp+var_4]
		inc	word ptr es:[bx+4]

loc_38CB9:				; CODE XREF: Debris_LoadAndInstantiateAlt+53j
		mov	ax, si
		jmp	short loc_38CBF
; ���������������������������������������������������������������������������

loc_38CBD:				; CODE XREF: Debris_LoadAndInstantiateAlt+3Fj
		xor	ax, ax

loc_38CBF:				; CODE XREF: Debris_LoadAndInstantiateAlt+A9j
		pop	si
		leave
		retf
Debris_LoadAndInstantiateAlt	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,107L — invoque la création (vtable[4]) d'un débris déjà chargé référencé par un objet
; parent (+0xE) : instanciation d'un débris depuis un modèle pré-résolu attaché au parent.
; ==============================================================================================
Debris_InstantiateFromParent	proc far		; CODE XREF: HUD_RenderSymbologyMain+857P
					; TimedTrigger_SpawnAndBindGeometry_9E289:loc_9E362P

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		xor	di, di
		or	si, si
		jnz	short loc_38CD9
		jmp	loc_38D83
; ���������������������������������������������������������������������������

loc_38CD9:				; CODE XREF: Debris_InstantiateFromParent+12j
		mov	eax, [si+0Eh]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_38CEB
		jmp	loc_38D83
; ���������������������������������������������������������������������������

loc_38CEB:				; CODE XREF: Debris_InstantiateFromParent+24j
		les	bx, [bp+var_4]
		mov	al, [bp+arg_4]
		mov	es:[bx+34h], al
		push	word ptr [bp+var_4+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_38D5F
		mov	eax, [si+0Ah]
		mov	[di+0Ah], eax

loc_38D10:
		mov	[bp+var_6], di
		les	bx, [di+0Ah]
		mov	ax, [bp+var_6]
		mov	es:[bx+6], ax
		mov	dword ptr [si+0Ah], 0
		les	bx, [bp+var_4]
		inc	word ptr es:[bx+4]
		push	si
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	dx, ax
		mov	bx, dx
		mov	eax, [bx]
		mov	[di+12h], eax
		mov	eax, [bx+4]

loc_38D42:
		mov	[di+16h], eax
		mov	eax, [bx+8]
		mov	[di+1Ah], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+78h]
		pop	cx
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_38D5F:				; CODE XREF: Debris_InstantiateFromParent+44j
		mov	dx, [si+24h]
		or	dx, dx
		jz	short loc_38D72
		push	si
		push	dx
		call	VROOMM_StubThunk_6BF74
		add	sp, 4
		jmp	short loc_38D83
; ���������������������������������������������������������������������������

loc_38D72:				; CODE XREF: Debris_InstantiateFromParent+A2j
		or	si, si
		jz	short loc_38D83
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]

loc_38D7E:
		add	sp, 4
		jmp	short $+2

loc_38D83:				; CODE XREF: Debris_InstantiateFromParent+14j
					; Debris_InstantiateFromParent+26j ...
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
Debris_InstantiateFromParent	endp

seg079		ends
