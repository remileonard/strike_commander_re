seg076		segment	byte public 'CODE' use16
		assume cs:seg076
		;org 4
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,50L — parcourt une liste d'objets (table 0x5510), pour chacun de type 3 (vtable[8])
; teste une condition via sub_37010 (test de sélection) : recherche d'un objet sélectionnable
; dans le monde (probable ciblage/sélection à la souris).
; ==============================================================================================
Picking_FindSelectableObject	proc far		; CODE XREF: Picking_FindSelectableTyped+FP

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	ax, [bp+arg_0]

loc_36AAE:				; DATA XREF: seg216:0326o
		mov	[bp+var_2], 0
		jmp	short loc_36AD6
; ���������������������������������������������������������������������������

loc_36AB5:				; CODE XREF: Picking_FindSelectableObject+43j
		mov	bx, [bp+var_2]
		mov	si, [bx+4]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		cmp	al, 3
		jnz	short loc_36AD6
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Picking_TestAndMarkBitfield
		add	sp, 4
		or	al, al
		jnz	short loc_36AE9

loc_36AD6:				; CODE XREF: Picking_FindSelectableObject+Fj
					; Picking_FindSelectableObject+20j
		lea	ax, [bp+var_2]
		push	ax
		push	5510h
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_36AB5

loc_36AE9:				; CODE XREF: Picking_FindSelectableObject+30j
		pop	si
		leave
		retf
Picking_FindSelectableObject	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,455L — grosse fonction géométrique (buffer local 0xA8, nombreux arguments) appelée par
; sub_36EA5/sub_36F47 : candidat pour le calcul de sélection/surbrillance d'une pièce de
; modèle 3D (picking géométrique), à approfondir.
; ==============================================================================================
Picking_ComputeMain	proc far		; CODE XREF: Picking_ComputeWrapper+9Ap
					; Picking_ComputeScaled+47p

var_BE		= dword	ptr -0BEh
var_B8		= dword	ptr -0B8h
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= word ptr -96h
var_94		= word ptr -94h
var_92		= word ptr -92h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
var_8A		= word ptr -8Ah
var_88		= word ptr -88h
var_86		= word ptr -86h
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
var_48		= dword	ptr -48h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
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
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= word ptr  16h
arg_12		= word ptr  18h
arg_14		= byte ptr  1Ah
arg_18		= word ptr  1Eh

		push	bp
		mov	bp, sp

loc_36AEF:
		sub	sp, 0A8h

loc_36AF3:
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jnz	short loc_36B00

loc_36AFD:
		jmp	loc_36EA1
; ���������������������������������������������������������������������������

loc_36B00:				; CODE XREF: Picking_ComputeMain+Fj
		cmp	[bp+arg_2], 0

loc_36B04:
		jz	short loc_36B2D
		mov	di, [bp+arg_2]
		add	di, 14h
		mov	eax, [di]
		mov	[bp+var_14], eax
		mov	eax, [di+4]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_8], eax
		jmp	short loc_36B4F
; ���������������������������������������������������������������������������

loc_36B2D:				; CODE XREF: Picking_ComputeMain:loc_36B04j
		mov	di, [bp+arg_8]
		mov	eax, [di]
		mov	[bp+var_1C], eax
		mov	eax, [di+4]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_8], eax

loc_36B4F:				; CODE XREF: Picking_ComputeMain+3Fj
		mov	eax, [si+0Dh]
		mov	[bp+var_20], eax
		shl	eax, 8
		sub	[bp+var_C], eax
		mov	eax, [si+0Dh]

loc_36B63:
		mov	[bp+var_24], eax

loc_36B67:
		shl	eax, 8
		add	[bp+var_8], eax

loc_36B6F:
		mov	eax, [bp+var_C]

loc_36B73:
		mov	[si+15h], eax

loc_36B77:
		mov	eax, [bp+var_8]
		mov	[si+19h], eax
		mov	eax, [si+9]
		mov	[bp+var_28], eax
		shl	eax, 8
		add	[bp+var_C], eax
		mov	eax, [si+9]
		mov	[bp+var_2C], eax
		shl	eax, 8
		sub	[bp+var_8], eax
		mov	eax, [bp+var_C]
		mov	[si+1Dh], eax
		mov	eax, [bp+var_8]
		mov	[si+21h], eax
		mov	ax, word_70466
		mov	[bp+var_44], ax
		mov	di, si
		add	di, 15h
		mov	eax, [di]
		mov	[bp+var_34], eax
		mov	eax, [di+4]
		mov	[bp+var_30], eax
		mov	bx, [si+1]
		mov	eax, [bx+86h]
		mov	[bp+var_48], eax
		shl	eax, 8
		add	[bp+var_34], eax
		mov	eax, [bx+86h]
		mov	[bp+var_4C], eax
		shl	eax, 8
		sub	eax, [bp+var_30]
		mov	[bp+var_50], eax
		mov	[bp+var_54], eax
		mov	[bp+var_30], eax
		mov	di, si
		add	di, 1Dh
		mov	eax, [di]

loc_36C02:
		mov	[bp+var_3C], eax
		mov	eax, [di+4]
		mov	[bp+var_38], eax
		mov	eax, [bx+86h]
		mov	[bp+var_58], eax
		shl	eax, 8
		add	[bp+var_3C], eax
		mov	eax, [bx+86h]
		mov	[bp+var_5C], eax
		shl	eax, 8
		sub	eax, [bp+var_38]
		mov	[bp+var_60], eax
		mov	[bp+var_64], eax
		mov	[bp+var_38], eax
		mov	eax, [si+5]
		mov	[bp+var_68], eax
		shl	eax, 8
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_34]
		mov	edx, eax
		mov	ecx, [bp+var_6C]
		sar	edx, 18h
		shl	eax, 8

loc_36C5F:
		idiv	ecx
		mov	[bp+var_34], eax

loc_36C66:
		mov	eax, [bp+var_30]
		mov	edx, eax
		mov	ecx, [bp+var_6C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_30], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_70], eax
		mov	eax, [si+5]
		mov	[bp+var_78], eax
		shl	eax, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_3C]
		mov	edx, eax
		mov	ecx, [bp+var_7C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_38]
		mov	edx, eax
		mov	ecx, [bp+var_7C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_38], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_80], eax
		mov	ax, word ptr [bp+var_34+1]
		mov	[bp+var_8A], ax
		mov	ax, word ptr [bp+var_30+1]
		mov	[bp+var_8C], ax
		mov	ax, [bp+var_8A]
		mov	[bp+var_88], ax
		mov	ax, [bp+var_8C]
		mov	[bp+var_86], ax
		mov	ax, word ptr [bp+var_3C+1]
		mov	[bp+var_92], ax
		mov	ax, word ptr [bp+var_38+1]
		mov	[bp+var_94], ax
		mov	ax, [bp+var_92]
		mov	[bp+var_90], ax
		mov	ax, [bp+var_94]
		mov	[bp+var_8E], ax
		mov	ax, [bp+var_86]
		mov	[bp+var_40], ax
		jmp	loc_36E95
; ���������������������������������������������������������������������������

loc_36D2B:				; CODE XREF: Picking_ComputeMain+3B2j
		mov	ax, [bp+var_88]
		mov	[bp+var_3E], ax
		jmp	loc_36E86
; ���������������������������������������������������������������������������

loc_36D35:				; CODE XREF: Picking_ComputeMain+3A3j
		cmp	[bp+var_3E], 0
		jge	short loc_36D3F
		xor	di, di
		jmp	short loc_36D50
; ���������������������������������������������������������������������������

loc_36D3F:				; CODE XREF: Picking_ComputeMain+24Dj
		mov	ax, [si+3]
		cmp	ax, [bp+var_3E]
		jg	short loc_36D4D
		mov	di, [si+3]
		dec	di
		jmp	short loc_36D50
; ���������������������������������������������������������������������������

loc_36D4D:				; CODE XREF: Picking_ComputeMain+259j
		mov	di, [bp+var_3E]

loc_36D50:				; CODE XREF: Picking_ComputeMain+251j
					; Picking_ComputeMain+25Fj
		cmp	[bp+var_40], 0
		jge	short loc_36D5D
		mov	[bp+var_42], 0
		jmp	short loc_36D71
; ���������������������������������������������������������������������������

loc_36D5D:				; CODE XREF: Picking_ComputeMain+268j
		mov	ax, [si+3]

loc_36D60:
		cmp	ax, [bp+var_40]
		jg	short loc_36D6B
		dec	ax
		mov	[bp+var_42], ax
		jmp	short loc_36D71
; ���������������������������������������������������������������������������

loc_36D6B:				; CODE XREF: Picking_ComputeMain+277j
		mov	ax, [bp+var_40]
		mov	[bp+var_42], ax

loc_36D71:				; CODE XREF: Picking_ComputeMain+26Fj
					; Picking_ComputeMain+27Dj
		mov	bx, [si+1]
		mov	ax, [bx+5]
		mov	dx, [bx+3]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	ax, [bp+var_42]
		imul	word ptr [si+3]
		add	ax, di
		shl	ax, 1
		add	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx], 0
		jz	short loc_36DA5
		mov	ax, [bp+var_44]
		mov	[bp+var_96], ax
		mov	bx, es:[bx]
		mov	[bx+2],	ax
		jmp	short loc_36E08
; ���������������������������������������������������������������������������

loc_36DA5:				; CODE XREF: Picking_ComputeMain+2A8j
		mov	ax, [si+1]
		add	ax, 0Bh
		mov	[bp+var_98], ax
		mov	ax, [bp+var_42]
		imul	word ptr [si+3]
		add	ax, di
		mov	[bp+var_9A], ax
		mov	ax, [bp+var_44]
		mov	[bp+var_9C], ax
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_36DF1
		mov	word ptr [di], 1966h
		mov	word ptr [di], 1A7Eh
		push	[bp+var_9C]
		push	[bp+var_9A]
		push	[bp+var_98]
		push	ax
		call	VROOMM_StubThunk_6BE75
		add	sp, 8
		mov	ax, di
		jmp	short loc_36DF3
; ���������������������������������������������������������������������������

loc_36DF1:				; CODE XREF: Picking_ComputeMain+2E2j
		mov	ax, di

loc_36DF3:				; CODE XREF: Picking_ComputeMain+303j
		les	bx, [bp+var_4]

loc_36DF6:
		mov	es:[bx], ax

loc_36DF9:
		push	word ptr [bp+var_4+2]
		push	bx

loc_36DFD:
		push	5510h

loc_36E00:
		call	TerrainTile_CacheEntryConstruct
		add	sp, 6

loc_36E08:				; CODE XREF: Picking_ComputeMain+2B7j
		mov	ax, [bp+arg_18]
		or	ax, ax
		jz	short loc_36E16
		cmp	ax, 1
		jz	short loc_36E29
		jmp	short loc_36E83
; ���������������������������������������������������������������������������

loc_36E16:				; CODE XREF: Picking_ComputeMain+321j
		push	[bp+arg_2]
		les	bx, [bp+var_4]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr Picking_ResolveSymbol
		add	sp, 4
		jmp	short loc_36E83
; ���������������������������������������������������������������������������

loc_36E29:				; CODE XREF: Picking_ComputeMain+326j
		push	large [bp+arg_C]
		mov	al, [bp+arg_14]
		push	ax
		push	[bp+arg_10]
		sub	sp, 4
		mov	bx, [bp+arg_12]
		mov	eax, [bx]
		mov	[bp+var_A0], eax
		shl	eax, 8
		mov	[bp+var_B8], eax
		mov	di, [bp+arg_8]
		mov	eax, [di]
		mov	[bp+var_A8], eax
		mov	eax, [di+4]
		mov	[bp+var_A4], eax
		lea	ax, [bp+var_A8]

loc_36E63:
		push	ax
		sub	sp, 4
		mov	di, [bp+arg_6]
		mov	eax, [di]
		mov	[bp+var_BE], eax

loc_36E72:
		push	[bp+arg_4]
		les	bx, [bp+var_4]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr Picking_ComputeDetailed
		add	sp, 16h

loc_36E83:				; CODE XREF: Picking_ComputeMain+328j
					; Picking_ComputeMain+33Bj
		inc	[bp+var_3E]

loc_36E86:				; CODE XREF: Picking_ComputeMain+246j
		mov	ax, [bp+var_3E]
		cmp	ax, [bp+var_90]
		jg	short loc_36E92
		jmp	loc_36D35
; ���������������������������������������������������������������������������

loc_36E92:				; CODE XREF: Picking_ComputeMain+3A1j
		inc	[bp+var_40]

loc_36E95:				; CODE XREF: Picking_ComputeMain+23Cj
		mov	ax, [bp+var_40]
		cmp	ax, [bp+var_8E]
		jg	short loc_36EA1
		jmp	loc_36D2B
; ���������������������������������������������������������������������������

loc_36EA1:				; CODE XREF: Picking_ComputeMain:loc_36AFDj
					; Picking_ComputeMain+3B0j
		pop	di
		pop	si
		leave
		retf
Picking_ComputeMain	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,68L — initialise des accumulateurs à zéro puis appelle sub_36AEC : wrapper
; d'initialisation du calcul de sélection/picking.
; ==============================================================================================
Picking_ComputeWrapper	proc far		; CODE XREF: Terrain_UpdateLODPerFrame+208P

var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 32h
		mov	dx, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_32], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_2E], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_2A], eax
		mov	[bp+var_10], 0
		mov	[bp+var_12], 0

loc_36EEB:
		mov	[bp+var_16], 0
		mov	[bp+var_18], 0
		mov	[bp+var_1C], 0
		mov	[bp+var_1A], 0
		mov	ax, [bp+arg_2]
		mov	[bp+var_1E], ax
		push	0
		push	[bp+var_12]
		push	0
		mov	[bp+var_22], 0
		lea	ax, [bp+var_22]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	large [bp+var_16]
		mov	[bp+var_26], 0
		lea	ax, [bp+var_26]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		push	[bp+var_18]
		push	[bp+var_1E]
		push	dx
		push	cs
		call	near ptr Picking_ComputeMain
		add	sp, 1Ah
		leave
		retf
Picking_ComputeWrapper	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,53L — wrapper vers sub_36AEC avec conversion d'échelle (sar 8) d'un paramètre : wrapper
; de picking avec normalisation d'échelle.
; ==============================================================================================
Picking_ComputeScaled	proc far		; CODE XREF: Terrain_ProcessAdjacentPatches+87P

var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= byte ptr  14h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	dx, [bp+arg_0]
		mov	si, [bp+arg_C]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		push	1
		push	[bp+var_4]

loc_36F63:
		mov	al, [bp+arg_E]
		push	ax

loc_36F67:
		mov	eax, [si]

loc_36F6A:
		sar	eax, 8
		mov	[bp+var_8], eax
		lea	ax, [bp+var_8]
		push	ax
		push	[bp+arg_A]
		push	large [bp+arg_10]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+var_2]
		push	dx
		push	cs
		call	near ptr Picking_ComputeMain
		add	sp, 1Ah
		pop	si
		leave
		retf
Picking_ComputeScaled	endp

; ���������������������������������������������������������������������������

loc_36F97:				; DATA XREF: seg339:off_6EB36o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 3
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_36FA1:				; DATA XREF: seg339:off_6EB2Eo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [si+6]
		push	59C3h
		call	Container_RemoveEntry
		add	sp, 4
		push	3
		push	word ptr [si+6]
		call	Container_Op_22BFC
		add	sp, 4
		mov	word ptr [si+6], 0
		push	word ptr [si+0Ah]
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	word ptr [si+0Ah], 0
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,23L — recherche une clé (sub_22D6C) si un pointeur (+4) est valide : résolution
; conditionnelle d'un symbole associé à un objet sélectionné.
; ==============================================================================================
Picking_ResolveSymbol	proc far		; CODE XREF: Picking_ComputeMain+335p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+4], 0
		jz	short loc_36FF4
		push	[bp+arg_2]
		push	word ptr [si+6]
		call	WorldObjects_CallSlot4OnAll_22D6C

loc_36FF1:
		add	sp, 4

loc_36FF4:				; CODE XREF: Picking_ResolveSymbol+Bj
		pop	si
		pop	bp
		retf
Picking_ResolveSymbol	endp

; ���������������������������������������������������������������������������

loc_36FF7:				; DATA XREF: seg339:1A8Ao
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+4], 0

loc_37002:
		jz	short loc_3700D

loc_37004:
		push	word ptr [si+6]
		call	WorldObjects_UpdateAllAndRemoveDead_221F2
		pop	cx

loc_3700D:				; CODE XREF: seg076:loc_37002j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,54L — parcourt une table d'indices (+0xA, 16 bits), teste la correspondance avec un
; critère, positionne un bit dans un tableau de bits global (dword_6EB2A) avec poids binaire
; croissant : test et marquage de sélection d'une pièce de modèle (bitfield de surbrillance
; par partie).
; ==============================================================================================
Picking_TestAndMarkBitfield	proc far		; CODE XREF: Picking_FindSelectableObject+28p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+4], 0
		jz	short loc_37063
		mov	[bp+var_4], 1
		mov	di, [si+0Ah]
		xor	dx, dx
		jmp	short loc_3705E
; ���������������������������������������������������������������������������

loc_37030:				; CODE XREF: Picking_TestAndMarkBitfield+51j
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jnz	short loc_3704F
		mov	ax, [si+8]
		shl	ax, 2
		les	bx, dword_6EB2A
		add	bx, ax
		mov	eax, [bp+var_4]
		or	es:[bx], eax
		mov	al, 1
		jmp	short loc_37065
; ���������������������������������������������������������������������������

loc_3704F:				; CODE XREF: Picking_TestAndMarkBitfield+25j
		mov	eax, [bp+var_4]
		shl	eax, 1
		mov	[bp+var_4], eax
		inc	dx
		add	di, 2

loc_3705E:				; CODE XREF: Picking_TestAndMarkBitfield+1Ej
		cmp	[si+4],	dx
		jg	short loc_37030

loc_37063:				; CODE XREF: Picking_TestAndMarkBitfield+Fj
		mov	al, 0

loc_37065:				; CODE XREF: Picking_TestAndMarkBitfield+3Dj
		pop	di
		pop	si
		leave
		retf
Picking_TestAndMarkBitfield	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,557L — grosse fonction géométrique du même cluster que sub_36AEC (buffer local 0xCE) :
; candidat pour le calcul détaillé de picking/surbrillance d'une pièce de modèle 3D avec
; géométrie complète, à approfondir.
; ==============================================================================================
Picking_ComputeDetailed	proc far		; CODE XREF: Picking_ComputeMain+391p

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
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= word ptr -38h
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= word ptr -1Eh
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h
arg_E		= word ptr  14h
arg_10		= byte ptr  16h
arg_12		= dword	ptr  18h

		push	bp
		mov	bp, sp
		sub	sp, 0CEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+4], 0
		jnz	short loc_3707E
		jmp	loc_37560
; ���������������������������������������������������������������������������

loc_3707E:				; CODE XREF: Picking_ComputeDetailed+10j
		mov	[bp+var_2], 0
		jmp	loc_3753D
; ���������������������������������������������������������������������������

loc_37086:				; CODE XREF: Picking_ComputeDetailed+4F4j
		mov	di, [bp+var_2]
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_A], eax
		mov	eax, [bx+4]
		mov	[bp+var_6], eax
		mov	eax, [bp+var_A]
		sar	eax, 8
		mov	[bp+var_1C], eax
		mov	ax, [bp+arg_8]
		mov	[bp+var_1E], ax
		mov	eax, [bp+var_1C]
		shl	eax, 8
		mov	bx, [bp+var_1E]
		sub	eax, [bx]
		mov	[bp+var_22], eax
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	edx, eax
		mov	ecx, [bp+arg_A]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_2E], eax
		sar	eax, 8

loc_370F1:
		mov	[bp+var_18], eax

loc_370F5:
		mov	eax, [bp+var_6]
		sar	eax, 8

loc_370FD:
		mov	[bp+var_36], eax

loc_37101:
		mov	ax, [bp+arg_8]
		add	ax, 4
		mov	[bp+var_38], ax
		mov	eax, [bp+var_36]
		shl	eax, 8
		mov	bx, [bp+var_38]
		sub	eax, [bx]
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	edx, eax
		mov	ecx, [bp+arg_A]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_48], eax
		sar	eax, 8
		mov	[bp+var_32], eax
		cmp	[bp+var_18], 0
		jnz	short loc_3715B
		cmp	[bp+var_32], 0
		jnz	short loc_3715B
		jmp	loc_372C5
; ���������������������������������������������������������������������������

loc_3715B:				; CODE XREF: Picking_ComputeDetailed+E6j
					; Picking_ComputeDetailed+EDj
		mov	eax, [bp+var_18]
		mov	[bp+var_6C], eax
		shl	eax, 8
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_74], eax
		shl	eax, 8
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_64], eax
		push	large 0
		push	eax
		push	large [bp+var_68]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_7C], eax
		mov	[bp+var_80], eax
		mov	[bp+var_10], eax
		lea	ax, [bp+var_68]
		push	ax
		call	Weapon_ComputeVectorLength_561AF
		pop	cx
		mov	eax, [bp+var_68]
		mov	[bp+var_84], eax
		cmp	[bp+var_84], 100h
		jle	short loc_371CF
		mov	ax, 1
		jmp	short loc_371D1
; ���������������������������������������������������������������������������

loc_371CF:				; CODE XREF: Picking_ComputeDetailed+15Fj
		xor	ax, ax

loc_371D1:				; CODE XREF: Picking_ComputeDetailed+164j
		or	al, al
		jz	short loc_371E8
		mov	[bp+var_88], 100h
		mov	eax, [bp+var_88]
		mov	[bp+var_84], eax

loc_371E8:				; CODE XREF: Picking_ComputeDetailed+16Aj
		cmp	[bp+var_84], 0FFFFFF00h
		jge	short loc_371F8
		mov	ax, 1
		jmp	short loc_371FA
; ���������������������������������������������������������������������������

loc_371F8:				; CODE XREF: Picking_ComputeDetailed+188j
		xor	ax, ax

loc_371FA:				; CODE XREF: Picking_ComputeDetailed+18Dj
		or	al, al
		jz	short loc_37211
		mov	[bp+var_8C], 0FFFFFF00h
		mov	eax, [bp+var_8C]
		mov	[bp+var_84], eax

loc_37211:				; CODE XREF: Picking_ComputeDetailed+193j
		mov	[bp+var_90], 100h
		lea	ax, [bp+var_90]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		push	ss
		lea	ax, [bp+var_94]
		push	ax
		call	Math_ArcSinOfRatio_54A0E
		add	sp, 8
		mov	eax, [bp+var_94]
		mov	[bp+var_14], eax
		cmp	[bp+var_32], 0
		jge	short loc_37253
		neg	eax
		mov	[bp+var_98], eax
		mov	[bp+var_9C], eax
		mov	[bp+var_14], eax

loc_37253:				; CODE XREF: Picking_ComputeDetailed+1D7j
		mov	eax, [bp+arg_4]
		add	[bp+var_14], eax

loc_3725B:
		lea	ax, [bp+var_14]
		push	ax
		push	ss

loc_37260:
		lea	ax, [bp+var_4C]

loc_37263:
		push	ax

loc_37264:
		call	Math_CosDeg_5483F
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_4C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_50], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_54], eax
		sar	eax, 8
		mov	[bp+var_18], eax
		lea	ax, [bp+var_14]
		push	ax
		push	ss
		lea	ax, [bp+var_58]
		push	ax
		call	Math_SinDeg_54876
		add	sp, 6
		mov	eax, [bp+var_10]
		mov	edx, [bp+var_58]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_60], eax
		sar	eax, 8
		mov	[bp+var_32], eax

loc_372C5:				; CODE XREF: Picking_ComputeDetailed+EFj
		mov	bx, [bp+arg_E]
		movsx	eax, word ptr [bx]
		add	eax, [bp+var_18]
		mov	[bp+var_18], eax
		movsx	eax, word ptr [bx+2]
		sub	eax, [bp+var_32]
		mov	[bp+var_32], eax
		mov	al, byte_7235C
		mov	ah, 0
		or	ax, ax
		jz	short loc_372ED
		jmp	loc_374F7
; ���������������������������������������������������������������������������

loc_372ED:				; CODE XREF: Picking_ComputeDetailed+27Fj
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_64], dx
		mov	word ptr [bp+var_68+2],	ax
		les	bx, [bp+var_68+2]

loc_37301:
		les	bx, es:[bx+8]
		mov	ax, es:[bx+14h]
		mov	word ptr [bp+var_64+2],	ax
		cmp	word ptr [bp+var_64+2],	0
		jnz	short loc_37315
		jmp	loc_37450
; ���������������������������������������������������������������������������

loc_37315:				; CODE XREF: Picking_ComputeDetailed+2A7j
		push	0
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_74], dx
		mov	word ptr [bp+var_78+2],	ax
		les	bx, [bp+var_78+2]
		push	large dword ptr	es:[bx+8]
		call	Particle_PoolWait
		add	sp, 6
		mov	word ptr [bp+var_68], dx
		mov	word ptr [bp+var_6C+2],	ax
		mov	ax, word ptr [bp+var_68]
		mov	dx, word ptr [bp+var_6C+2]
		add	dx, 1Fh
		mov	word ptr [bp+var_90], ax
		mov	word ptr [bp+var_94+2],	dx
		les	bx, [bp+var_94+2]
		mov	eax, es:[bx]

loc_37357:
		mov	[bp+var_98+2], eax

loc_3735C:
		mov	eax, [bp+var_98+2]
		mov	[bp+var_84+2], eax
		mov	ax, word ptr [bp+var_68]
		mov	dx, word ptr [bp+var_6C+2]
		add	dx, 23h	; '#'

loc_3736F:
		mov	word ptr [bp+var_98], ax

loc_37373:
		mov	word ptr [bp+var_9C+2],	dx

loc_37377:
		les	bx, [bp+var_9C+2]
		mov	eax, es:[bx]
		mov	[bp-9Eh], eax
		mov	eax, [bp-9Eh]
		mov	[bp+var_88+2], eax
		mov	ax, word ptr [bp+var_68]
		mov	dx, word ptr [bp+var_6C+2]
		add	dx, 27h	; '''
		mov	word ptr [bp+var_A2+2],	ax
		mov	word ptr [bp+var_A2], dx
		les	bx, [bp+var_A2]
		mov	eax, es:[bx]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_8C+2], eax
		mov	ax, word ptr [bp+var_68]
		mov	dx, word ptr [bp+var_6C+2]
		add	dx, 2Bh	; '+'
		mov	word ptr [bp+var_AA+2],	ax
		mov	word ptr [bp+var_AA], dx
		les	bx, [bp+var_AA]
		mov	eax, es:[bx]
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_90+2], eax
		mov	eax, [bp+var_84+2]
		sub	eax, [bp+var_88+2]
		mov	[bp+var_B2], eax
		mov	[bp+var_B6], eax

loc_373F2:
		mov	eax, [bp+var_B6]
		or	eax, eax
		jge	short loc_373FF
		neg	eax

loc_373FF:				; CODE XREF: Picking_ComputeDetailed+391j
		mov	[bp+var_BA], eax
		mov	eax, [bp+var_BA]
		mov	[bp+var_BE], eax
		sar	eax, 8
		mov	[bp+var_70+2], eax
		mov	eax, [bp+var_8C+2]
		sub	eax, [bp+var_90+2]
		mov	[bp+var_C2], eax
		mov	[bp+var_C6], eax
		mov	eax, [bp+var_C6]
		or	eax, eax
		jge	short loc_37437
		neg	eax

loc_37437:				; CODE XREF: Picking_ComputeDetailed+3C9j
		mov	[bp+var_CA], eax
		mov	eax, [bp+var_CA]
		mov	[bp+var_CE], eax
		sar	eax, 8
		mov	[bp+var_74+2], eax
		jmp	short loc_3748C
; ���������������������������������������������������������������������������

loc_37450:				; CODE XREF: Picking_ComputeDetailed+2A9j
		push	[bp+var_2]

loc_37453:
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx

loc_3745B:
		mov	word ptr [bp+var_78], dx
		mov	word ptr [bp+var_7C+2],	ax
		les	bx, [bp+var_7C+2]
		mov	ax, es:[bx+0Ah]

loc_37468:
		mov	dx, es:[bx+8]

loc_3746C:
		add	dx, 10h
		mov	word ptr [bp+var_7C], ax

loc_37472:
		mov	word ptr [bp+var_80+2],	dx
		les	bx, [bp+var_80+2]
		mov	eax, es:[bx]
		sar	eax, 8
		mov	[bp+var_70+2], eax
		mov	[bp+var_74+2], 0

loc_3748C:				; CODE XREF: Picking_ComputeDetailed+3E5j
		cmp	[bp+var_70+2], 28h ; '('
		jg	short loc_3749A
		cmp	[bp+var_74+2], 28h ; '('
		jle	short loc_374DA

loc_3749A:				; CODE XREF: Picking_ComputeDetailed+428j
		mov	al, [bp+arg_10]
		push	ax
		mov	ax, word ptr [bp+var_32]
		inc	ax
		push	ax
		mov	ax, word ptr [bp+var_18]
		inc	ax
		push	ax
		push	word ptr [bp+var_32]
		push	word ptr [bp+var_18]
		push	[bp+arg_2]
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		mov	al, [bp+arg_10]
		push	ax
		mov	ax, word ptr [bp+var_32]
		inc	ax
		push	ax
		push	word ptr [bp+var_18]
		push	word ptr [bp+var_32]
		mov	ax, word ptr [bp+var_18]
		inc	ax
		push	ax
		push	[bp+arg_2]
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		jmp	short loc_3753D
; ���������������������������������������������������������������������������

loc_374DA:				; CODE XREF: Picking_ComputeDetailed+42Fj
		mov	al, [bp+arg_10]
		push	ax
		push	word ptr [bp+var_32]
		push	word ptr [bp+var_18]
		push	word ptr [bp+var_32]
		push	word ptr [bp+var_18]
		push	[bp+arg_2]
		call	Render_FillClippedRect_61960

loc_374F2:
		add	sp, 0Ch
		jmp	short loc_3753D
; ���������������������������������������������������������������������������

loc_374F7:				; CODE XREF: Picking_ComputeDetailed+281j
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 14h
		jnz	short loc_3751B
		push	2
		push	large [bp+arg_12]
		push	word ptr [bp+var_32]
		push	word ptr [bp+var_18]
		push	[bp+arg_2]
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		jmp	short loc_3753D
; ���������������������������������������������������������������������������

loc_3751B:				; CODE XREF: Picking_ComputeDetailed+497j
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 14h
		jz	short loc_3753D
		push	3
		push	large [bp+arg_12]
		push	word ptr [bp+var_32]
		push	word ptr [bp+var_18]
		push	[bp+arg_2]
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_3753D:				; CODE XREF: Picking_ComputeDetailed+1Aj
					; Picking_ComputeDetailed+46Fj ...
		cmp	[bp+var_2], 0
		jnz	short loc_3754E
		mov	bx, [si+6]
		mov	ax, [bx+0Bh]
		mov	[bp+var_2], ax
		jmp	short loc_37557
; ���������������������������������������������������������������������������

loc_3754E:				; CODE XREF: Picking_ComputeDetailed+4D8j
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax

loc_37557:				; CODE XREF: Picking_ComputeDetailed+4E3j
		cmp	[bp+var_2], 0
		jz	short loc_37560
		jmp	loc_37086
; ���������������������������������������������������������������������������

loc_37560:				; CODE XREF: Picking_ComputeDetailed+12j
					; Picking_ComputeDetailed+4F2j
		pop	di
		pop	si

locret_37562:
		leave

locret_37563:
		retf
Picking_ComputeDetailed	endp

seg076		ends
