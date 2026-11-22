seg085		segment	para public 'CODE' use16
		assume cs:seg085
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 6, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TerrainCells_MarkPlacedObjectGone_36AA4 (sub_36AA4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 50L, LUE 2026-10-15. Parcourt la liste arg_0 (secteurs de terrain, categorie vtable+8 = 3)
; et appelle TerrainCell_MarkPlacedObjectGone_37010(secteur, objet arg_2) jusqu'au premier qui
; reconnait l'objet. Ex-'TerrainCells_MarkPlacedObjectGone_36AA4'.
; ==============================================================================================
TerrainCells_MarkPlacedObjectGone_35913		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	ax, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_35945

loc_35924:
		mov	bx, [bp+var_2]
		mov	si, [bx+4]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		cmp	al, 3
		jnz	short loc_35945
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr TerrainCell_MarkPlacedObjectGone_35E1C
		add	sp, 4
		or	al, al
		jnz	short loc_35958

loc_35945:
		lea	ax, [bp+var_2]
		push	ax
		push	658Ch
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_35924

loc_35958:
		pop	si
		leave
		retf
TerrainCells_MarkPlacedObjectGone_35913		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3595B		proc far

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
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_8		= word ptr  0Eh
arg_18		= word ptr  1Eh

		push	bp
		mov	bp, sp
		sub	sp, 9Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jnz	short loc_3596F
		jmp	loc_35CAD

loc_3596F:
		cmp	[bp+arg_2], 0
		jz	short loc_35998
		mov	di, [bp+arg_2]
		add	di, 14h
		mov	eax, [di]
		mov	[bp+var_14], eax
		mov	eax, [di+4]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_10]
		jmp	short loc_359B6

loc_35998:
		mov	di, [bp+arg_8]
		mov	eax, [di]
		mov	[bp+var_1C], eax
		mov	eax, [di+4]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_18]

loc_359B6:
		mov	[bp+var_8], eax
		mov	eax, [si+0Dh]
		mov	[bp+var_20], eax
		shl	eax, 8
		sub	[bp+var_C], eax
		mov	eax, [si+0Dh]
		mov	[bp+var_24], eax
		shl	eax, 8
		add	[bp+var_8], eax
		mov	eax, [bp+var_C]
		mov	[si+15h], eax
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
		mov	ax, word_7977C
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
		idiv	ecx
		mov	[bp+var_34], eax
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
		jmp	loc_35CA1

loc_35B96:
		mov	ax, [bp+var_88]
		mov	[bp+var_3E], ax
		jmp	loc_35C92

loc_35BA0:
		cmp	[bp+var_3E], 0
		jge	short loc_35BAA
		xor	di, di
		jmp	short loc_35BBB

loc_35BAA:
		mov	ax, [si+3]
		cmp	ax, [bp+var_3E]
		jg	short loc_35BB8
		mov	di, [si+3]
		dec	di
		jmp	short loc_35BBB

loc_35BB8:
		mov	di, [bp+var_3E]

loc_35BBB:
		cmp	[bp+var_40], 0
		jge	short loc_35BC8
		mov	[bp+var_42], 0
		jmp	short loc_35BD9

loc_35BC8:
		mov	ax, [si+3]
		cmp	ax, [bp+var_40]
		jg	short loc_35BD3
		dec	ax
		jmp	short loc_35BD6

loc_35BD3:
		mov	ax, [bp+var_40]

loc_35BD6:
		mov	[bp+var_42], ax

loc_35BD9:
		mov	bx, [si+1]
		mov	ax, [bx+5]
		mov	dx, [bx+3]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	ax, [bp+var_42]
		imul	word ptr [si+3]
		add	ax, di
		shl	ax, 1
		add	[bp+var_4], ax
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx], 0
		jz	short loc_35C0D
		mov	ax, [bp+var_44]
		mov	[bp+var_96], ax
		mov	bx, es:[bx]
		mov	[bx+2], ax
		jmp	short loc_35C70

loc_35C0D:
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
		jz	short loc_35C59
		mov	word ptr [di], 145Ch
		mov	word ptr [di], 1504h
		push	[bp+var_9C]
		push	[bp+var_9A]
		push	[bp+var_98]
		push	ax
		call	sub_74045
		add	sp, 8
		mov	ax, di
		jmp	short loc_35C5B

loc_35C59:
		mov	ax, di

loc_35C5B:
		les	bx, [bp+var_4]
		mov	es:[bx], ax
		push	[bp+var_2]
		push	bx
		push	658Ch
		call	sub_321AD
		add	sp, 6

loc_35C70:
		mov	ax, [bp+arg_18]
		or	ax, ax
		jz	short loc_35C7E
		cmp	ax, 1
		jz	short loc_35C8F
		jmp	short loc_35C8F

loc_35C7E:
		push	[bp+arg_2]
		les	bx, [bp+var_4]
		push	word ptr es:[bx]
		nop
		push	cs
		call	near ptr Picking_ResolveSymbol
		add	sp, 4

loc_35C8F:
		inc	[bp+var_3E]

loc_35C92:
		mov	ax, [bp+var_3E]
		cmp	ax, [bp+var_90]
		jg	short loc_35C9E
		jmp	loc_35BA0

loc_35C9E:
		inc	[bp+var_40]

loc_35CA1:
		mov	ax, [bp+var_40]
		cmp	ax, [bp+var_8E]
		jg	short loc_35CAD
		jmp	loc_35B96

loc_35CAD:
		pop	di
		pop	si
		leave
		retf
sub_3595B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Picking_ComputeWrapper (sub_36EA5 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,68L — initialise
; des accumulateurs à zéro puis appelle sub_36AEC : wrapper d'initialisation du calcul de
; sélection/picking.
; ==============================================================================================
Picking_ComputeWrapper		proc far

var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		lea	ax, word ptr [bp+var_22]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		push	large [bp+var_16]
		mov	[bp+var_26], 0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	[bp+var_18]
		push	[bp+var_1E]
		push	dx
		push	cs
		call	near ptr sub_3595B
		add	sp, 1Ah
		leave
		retf
Picking_ComputeWrapper		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Picking_ComputeScaled (sub_36F47 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,53L — wrapper
; vers sub_36AEC avec conversion d'échelle (sar 8) d'un paramètre : wrapper de picking avec
; normalisation d'échelle.
; ==============================================================================================
Picking_ComputeScaled		proc far

var_8		= dword ptr -8
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
arg_10		= dword ptr  16h

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
		mov	al, [bp+arg_E]
		push	ax
		mov	eax, [si]
		sar	eax, 8
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
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
		call	near ptr sub_3595B
		add	sp, 1Ah
		pop	si
		leave
		retf
Picking_ComputeScaled		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35DA3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 3
		pop	bp
		retf
sub_35DA3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35DAD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+6]
		push	67ADh
		call	Container_RemoveEntry
		add	sp, 4
		push	3
		push	word ptr [si+6]
		call	Container_Op_1EFD2
		add	sp, 4
		mov	word ptr [si+6], 0
		push	word ptr [si+0Ah]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+0Ah], 0
		pop	si
		pop	bp
		retf
sub_35DAD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Picking_ResolveSymbol
; (sub_36FD9 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,23L — recherche une clé (sub_22D6C) si un pointeur (+4) est valide : résolution
; conditionnelle d'un symbole associé à un objet sélectionné.
; ==============================================================================================
Picking_ResolveSymbol		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+4], 0
		jz	short loc_35E00
		push	[bp+arg_2]
		push	word ptr [si+6]
		call	WorldObjects_CallSlot4OnAll_1F14D
		add	sp, 4

loc_35E00:
		pop	si
		pop	bp
		retf
Picking_ResolveSymbol		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35E03		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+4], 0
		jz	short loc_35E19
		push	word ptr [si+6]
		call	sub_1E4C4
		pop	cx

loc_35E19:
		pop	si
		pop	bp
		retf
sub_35E03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TerrainCell_MarkPlacedObjectGone_37010 (sub_37010 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 54L, LUE 2026-10-15. Pour un secteur de terrain (arg_0) et un objet (arg_2) : cherche
; l'objet dans la table des objets poses du secteur (+0x0A, +4 entrees) ; trouve a l'indice k
; -> pose le bit k de dword_6EB2A[cellule +8] et renvoie 1, sinon 0. Au prochain chargement de
; la cellule, TerrainCell_LoadPlacedObjects_9A95A instancie alors le 2e nom de
; l'enregistrement. Ex-'TerrainCell_MarkPlacedObjectGone_37010'.
; ==============================================================================================
TerrainCell_MarkPlacedObjectGone_35E1C		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+4], 0
		jz	short loc_35E6F
		mov	[bp+var_4], 1
		mov	di, [si+0Ah]
		xor	dx, dx
		jmp	short loc_35E6A

loc_35E3C:
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jnz	short loc_35E5B
		mov	ax, [si+8]
		shl	ax, 2
		les	bx, word ptr dword_77C30
		add	bx, ax
		mov	eax, [bp+var_4]
		or	es:[bx], eax
		mov	al, 1
		jmp	short loc_35E71

loc_35E5B:
		mov	eax, [bp+var_4]
		shl	eax, 1
		mov	[bp+var_4], eax
		inc	dx
		add	di, 2

loc_35E6A:
		cmp	[si+4], dx
		jg	short loc_35E3C

loc_35E6F:
		mov	al, 0

loc_35E71:
		pop	di
		pop	si
		leave
		retf
TerrainCell_MarkPlacedObjectGone_35E1C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35E75		proc far

var_D0		= dword ptr -0D0h
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= word ptr -0ACh
var_AA		= word ptr -0AAh
var_A8		= dword ptr -0A8h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_A0		= dword ptr -0A0h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_98		= dword ptr -98h
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_90		= dword ptr -90h
var_8E		= dword ptr -8Eh
var_8C		= dword ptr -8Ch
var_8A		= dword ptr -8Ah
var_88		= dword ptr -88h
var_86		= dword ptr -86h
var_84		= dword ptr -84h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_74		= dword ptr -74h
var_72		= dword ptr -72h
var_70		= dword ptr -70h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= dword ptr  10h
arg_E		= word ptr  14h
arg_10		= byte ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 0D0h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_E]
		cmp	word ptr [si+4], 0
		jnz	short loc_35E8D
		jmp	loc_3630C

loc_35E8D:
		mov	[bp+var_2], 0
		jmp	loc_362EC

loc_35E95:
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		add	ax, 12h
		mov	[bp+var_E], ax
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_C], eax
		mov	eax, [bx+4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_C]
		sar	eax, 8
		mov	[bp+var_1E], eax
		mov	ax, [bp+arg_8]
		mov	[bp+var_20], ax
		mov	eax, [bp+var_1E]
		shl	eax, 8
		mov	bx, [bp+var_20]
		sub	eax, [bx]
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	edx, eax
		mov	ecx, [bp+arg_A]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		sar	eax, 8
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_8]
		sar	eax, 8
		mov	[bp+var_38], eax
		mov	ax, [bp+arg_8]
		add	ax, 4
		mov	[bp+var_3A], ax
		mov	eax, [bp+var_38]
		shl	eax, 8
		mov	bx, [bp+var_3A]
		sub	eax, [bx]
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		mov	edx, eax
		mov	ecx, [bp+arg_A]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_4A], eax
		sar	eax, 8
		mov	[bp+var_34], eax
		cmp	[bp+var_1A], 0
		jnz	short loc_35F6B
		cmp	[bp+var_34], 0
		jnz	short loc_35F6B
		jmp	loc_360D6

loc_35F6B:
		mov	eax, [bp+var_1A]
		mov	[bp+var_6E], eax
		shl	eax, 8
		mov	[bp+var_72], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_76], eax
		shl	eax, 8
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_66], eax
		push	large 0
		push	eax
		push	large [bp+var_6A]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_7E], eax
		mov	[bp+var_82], eax
		mov	[bp+var_12], eax
		lea	ax, word ptr [bp+var_6A]
		push	ax
		call	Weapon_ComputeVectorLength_57F78
		pop	cx
		mov	eax, [bp+var_6A]
		mov	[bp+var_86], eax
		cmp	[bp+var_86], 100h
		jle	short loc_35FE0
		mov	ax, 1
		jmp	short loc_35FE2

loc_35FE0:
		xor	ax, ax

loc_35FE2:
		or	al, al
		jz	short loc_35FF9
		mov	[bp+var_8A], 100h
		mov	eax, [bp+var_8A]
		mov	[bp+var_86], eax

loc_35FF9:
		cmp	[bp+var_86], 0FFFFFF00h
		jge	short loc_36009
		mov	ax, 1
		jmp	short loc_3600B

loc_36009:
		xor	ax, ax

loc_3600B:
		or	al, al
		jz	short loc_36022
		mov	[bp+var_8E], 0FFFFFF00h
		mov	eax, [bp+var_8E]
		mov	[bp+var_86], eax

loc_36022:
		mov	[bp+var_92], 100h
		lea	ax, word ptr [bp+var_92]
		push	ax
		lea	ax, word ptr [bp+var_86]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_96]
		push	ax
		call	Math_AcosOfRatio_5683B
		add	sp, 8
		mov	eax, [bp+var_96]
		mov	[bp+var_16], eax
		cmp	[bp+var_34], 0
		jge	short loc_36064
		neg	eax
		mov	[bp+var_9A], eax
		mov	[bp+var_9E], eax
		mov	[bp+var_16], eax

loc_36064:
		mov	eax, [bp+arg_4]
		add	[bp+var_16], eax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4E]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_4E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_52], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_56], eax
		sar	eax, 8
		mov	[bp+var_1A], eax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_5A]
		push	ax
		call	sub_566A3
		add	sp, 6
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_5A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_62], eax
		sar	eax, 8
		mov	[bp+var_34], eax

loc_360D6:
		movsx	eax, word ptr [di]
		add	eax, [bp+var_1A]
		mov	[bp+var_1A], eax
		movsx	eax, word ptr [di+2]
		sub	eax, [bp+var_34]
		mov	[bp+var_34], eax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_66], dx
		mov	word ptr [bp+var_6A+2], ax
		les	bx, word ptr [bp+var_6A+2]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+14h]
		mov	word ptr [bp+var_66+2], ax
		cmp	word ptr [bp+var_66+2], 0
		jnz	short loc_36117
		jmp	loc_36252

loc_36117:
		push	0
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_76], dx
		mov	word ptr [bp+var_7A+2], ax
		les	bx, word ptr [bp+var_7A+2]
		push	large es:[bx+8]
		call	Particle_PoolWait
		add	sp, 6
		mov	word ptr [bp+var_6A], dx
		mov	word ptr [bp+var_6E+2], ax
		mov	ax, word ptr [bp+var_6A]
		mov	dx, word ptr [bp+var_6E+2]
		add	dx, 17h
		mov	word ptr [bp+var_92], ax
		mov	word ptr [bp+var_96+2], dx
		les	bx, word ptr [bp+var_96+2]
		mov	eax, es:[bx]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_84], eax
		mov	ax, word ptr [bp+var_6A]
		mov	dx, word ptr [bp+var_6E+2]
		add	dx, 1Bh
		mov	word ptr [bp+var_9A], ax
		mov	word ptr [bp+var_9E+2], dx
		les	bx, word ptr [bp+var_9E+2]
		mov	eax, es:[bx]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_A0]
		mov	[bp+var_88], eax
		mov	ax, word ptr [bp+var_6A]
		mov	dx, word ptr [bp+var_6E+2]
		add	dx, 1Fh
		mov	[bp+var_A2], ax
		mov	[bp+var_A4], dx
		les	bx, [bp+var_A4]
		mov	eax, es:[bx]
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_8C], eax
		mov	ax, word ptr [bp+var_6A]
		mov	dx, word ptr [bp+var_6E+2]
		add	dx, 23h
		mov	[bp+var_AA], ax
		mov	[bp+var_AC], dx
		les	bx, [bp+var_AC]
		mov	eax, es:[bx]
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_B0]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_84]
		sub	eax, [bp+var_88]
		mov	[bp+var_B4], eax
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_B8]
		or	eax, eax
		jge	short loc_36201
		neg	eax

loc_36201:
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_C0], eax
		sar	eax, 8
		mov	[bp+var_70], eax
		mov	eax, [bp+var_8C]
		sub	eax, [bp+var_90]
		mov	[bp+var_C4], eax
		mov	[bp+var_C8], eax
		mov	eax, [bp+var_C8]
		or	eax, eax
		jge	short loc_36239
		neg	eax

loc_36239:
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_CC]
		mov	[bp+var_D0], eax
		sar	eax, 8
		mov	[bp+var_74], eax
		jmp	short loc_3628E

loc_36252:
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_7A], dx
		mov	word ptr [bp+var_7E+2], ax
		les	bx, word ptr [bp+var_7E+2]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	word ptr [bp+var_7E], ax
		mov	word ptr [bp+var_82+2], dx
		les	bx, word ptr [bp+var_82+2]
		mov	eax, es:[bx]
		sar	eax, 8
		mov	[bp+var_70], eax
		mov	[bp+var_74], 0

loc_3628E:
		cmp	[bp+var_70], 28h
		jg	short loc_3629C
		cmp	[bp+var_74], 28h
		jle	short loc_362D1

loc_3629C:
		mov	al, [bp+arg_10]
		push	ax
		mov	ax, word ptr [bp+var_34]
		inc	ax
		push	ax
		mov	ax, word ptr [bp+var_1A]
		inc	ax
		push	ax
		push	word ptr [bp+var_34]
		push	word ptr [bp+var_1A]
		push	[bp+arg_2]
		call	sub_69F22
		add	sp, 0Ch
		mov	al, [bp+arg_10]
		push	ax
		mov	ax, word ptr [bp+var_34]
		inc	ax
		push	ax
		push	word ptr [bp+var_1A]
		push	word ptr [bp+var_34]
		mov	ax, word ptr [bp+var_1A]
		inc	ax
		push	ax
		jmp	short loc_362E1

loc_362D1:
		mov	al, [bp+arg_10]
		push	ax
		push	word ptr [bp+var_34]
		push	word ptr [bp+var_1A]
		push	word ptr [bp+var_34]
		push	word ptr [bp+var_1A]

loc_362E1:
		push	[bp+arg_2]
		call	sub_69F22
		add	sp, 0Ch

loc_362EC:
		cmp	[bp+var_2], 0
		jnz	short loc_362FA
		mov	bx, [si+6]
		mov	ax, [bx+0Bh]
		jmp	short loc_36300

loc_362FA:
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]

loc_36300:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_3630C
		jmp	loc_35E95

loc_3630C:
		pop	di
		pop	si
		leave
		retf
sub_35E75		endp
seg085		ends
