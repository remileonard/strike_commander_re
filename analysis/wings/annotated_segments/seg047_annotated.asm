seg047		segment	para public 'CODE' use16
		assume cs:seg047
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 7Eh, 0F2h, 2, 75h, 4

loc_1FAD5:
		db 0C6h, 46h, 0FFh, 1

loc_1FAD9:
		db 8Ah, 46h, 0FFh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_Construct_A2DF0 (sub_A2DF0 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue
; (sub_658, 0x35 octets) si besoin, initialise via sub_6C76C (stub voisin), pose un tag
; (0x2E82) et remet à zéro plusieurs champs (+0x1E/+0x20/+0x22/+0x34) — constructeur de base
; d'un widget jauge/indicateur.
; ==============================================================================================
GaugeWidget_Construct_1FADE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1FAF7
		push	35h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_1FB22

loc_1FAF7:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	PaletteScreen_FormatValueDisplay_21F9C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 21A7h
		xor	ax, ax
		mov	[si+20h], ax
		mov	[si+1Eh], ax
		mov	word ptr [si+22h], 0
		mov	byte ptr [si+34h], 0

loc_1FB22:
		mov	ax, si
		pop	si
		pop	bp
		retf
GaugeWidget_Construct_1FADE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_Destruct_B529D (sub_B529D de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à GaugeWidget_Destruct_A2E39 (sub_A2E39 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; GaugeWidget_ReleaseListNode_A2ED3, libère un style (TextFormat_ReleaseStyleList_5E526,
; seg143) et l'objet (sub_338).
; ==============================================================================================
GaugeWidget_Destruct_1FB27		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1FB56
		mov	word ptr [si+0Eh], 21A7h
		push	si
		nop
		push	cs
		call	near ptr sub_1FBC1
		pop	cx
		push	si
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_1FB56
		push	si
		call	sub_33B
		pop	cx

loc_1FB56:
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_Destruct_1FB27		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_GetFirstListItem_B52D0 (sub_B52D0 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_GetFirstListItem_A2E6C (sub_A2E6C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle GaugeWidget_GetNthListItem_A2E95 avec index 0.
; ==============================================================================================
GaugeWidget_GetFirstListItem_1FB5A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+34h], 1
		push	0
		jmp	short loc_1FB70

loc_1FB6A:
		and	byte ptr [di+10h], 0FBh
		push	1

loc_1FB70:
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_GetNthListItem_1FB83
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_1FB6A
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_GetFirstListItem_1FB5A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_GetNthListItem_B52F9 (sub_B52F9 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_GetNthListItem_A2E95 (sub_A2E95 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; parcourt une liste chaînée (champ +0x24, next-ptr à +2) N fois et retourne la valeur du nœud
; atteint — accesseur de liste indexée, motif similaire à IndexedRecordReader (seg196).
; ==============================================================================================
GaugeWidget_GetNthListItem_1FB83		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jnz	short loc_1FBA2
		mov	ax, [si+1Eh]
		mov	[si+24h], ax
		jmp	short loc_1FBAF

loc_1FB99:
		mov	bx, [si+24h]
		mov	ax, [bx+2]
		mov	[si+24h], ax

loc_1FBA2:
		cmp	word ptr [si+24h], 0
		jz	short loc_1FBAF
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_1FB99

loc_1FBAF:
		cmp	word ptr [si+24h], 0
		jnz	short loc_1FBB9
		xor	ax, ax
		jmp	short loc_1FBBE

loc_1FBB9:
		mov	bx, [si+24h]
		mov	ax, [bx]

loc_1FBBE:
		pop	si
		pop	bp
		retf
GaugeWidget_GetNthListItem_1FB83		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FBC1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		jmp	short loc_1FC04

loc_1FBCB:
		mov	di, [si+1Eh]
		cmp	word ptr [di], 0
		jz	short loc_1FBE4
		push	3
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short loc_1FBE4

loc_1FBE4:
		mov	ax, [di+2]
		mov	[si+1Eh], ax
		push	di
		call	sub_33B
		pop	cx
		mov	ax, [si+22h]
		dec	word ptr [si+22h]
		or	ax, ax
		jg	short loc_1FC04
		push	210Eh
		call	sub_9D78
		pop	cx

loc_1FC04:
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_1FBCB
		xor	ax, ax
		mov	[si+20h], ax
		mov	[si+1Eh], ax
		mov	word ptr [si+22h], 0
		pop	di
		pop	si
		pop	bp
		retf
sub_1FBC1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_Helper_B5397 (sub_B5397 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_Helper_A2F1A (sub_A2F1A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe visible
; (rôle exact non détaillé, manipulation de champs internes).
; ==============================================================================================
GaugeWidget_Helper_1FC1B		proc far

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
		jmp	short loc_1FC70

loc_1FC2D:
		mov	[bp+var_2], 1
		mov	cx, [si+1Eh]
		mov	bx, cx
		mov	di, [bx+2]
		jmp	short loc_1FC6C

loc_1FC3C:
		mov	bx, cx
		mov	bx, [bx]
		mov	al, [bx+15h]
		and	ax, 0Fh
		mov	bx, [di]
		mov	dl, [bx+15h]
		and	dx, 0Fh
		cmp	ax, dx
		jle	short loc_1FC67
		mov	[bp+var_2], 0
		mov	bx, cx
		mov	ax, [bx]
		mov	[bp+var_4], ax
		mov	ax, [di]
		mov	[bx], ax
		mov	ax, [bp+var_4]
		mov	[di], ax

loc_1FC67:
		mov	cx, di
		mov	di, [di+2]

loc_1FC6C:
		or	di, di
		jnz	short loc_1FC3C

loc_1FC70:
		cmp	[bp+var_2], 0
		jz	short loc_1FC2D
		pop	di
		pop	si
		leave
		retf
GaugeWidget_Helper_1FC1B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_HelperB_B53F6 (sub_B53F6 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_HelperB_A2F79 (sub_A2F79 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe visible
; (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperB_1FC7A		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	si, [si+1Eh]
		jmp	short loc_1FCA9

loc_1FC89:
		mov	bx, [si]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, [bp+arg_2]
		jnz	short loc_1FCA6
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		and	ax, 0Fh
		and	byte ptr [bx+15h], 0F0h
		or	[bx+15h], al

loc_1FCA6:
		mov	si, [si+2]

loc_1FCA9:
		or	si, si
		jnz	short loc_1FC89
		pop	si
		leave
		retf
GaugeWidget_HelperB_1FC7A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_HelperC_B542C (sub_B542C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_HelperC_A2FAF (sub_A2FAF de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe visible
; (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperC_1FCB0		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		mov	si, [si+1Eh]
		jmp	short loc_1FCFA

loc_1FCC5:
		mov	bx, [si]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, dx
		jnz	short loc_1FCD9
		mov	[bp+var_2], cx
		mov	ax, [bp+var_2]
		jmp	short loc_1FCEB

loc_1FCD9:
		mov	bx, [si]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, cx
		jnz	short loc_1FCF7
		mov	[bp+var_4], dx
		mov	ax, [bp+var_4]

loc_1FCEB:
		and	ax, 0Fh
		mov	bx, [si]
		and	byte ptr [bx+15h], 0F0h
		or	[bx+15h], al

loc_1FCF7:
		mov	si, [si+2]

loc_1FCFA:
		or	si, si
		jnz	short loc_1FCC5
		pop	si
		leave
		retf
GaugeWidget_HelperC_1FCB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_AllocateListNode_B547D (sub_B547D de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à GaugeWidget_AllocateListNode_A3000 (sub_A3000 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue un nœud
; de liste (sub_658).
; ==============================================================================================
GaugeWidget_AllocateListNode_1FD01		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	di, di
		jz	short loc_1FD38
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	word ptr [di+2], 0
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_1FD2C
		mov	[si+1Eh], di
		jmp	short loc_1FD32

loc_1FD2C:
		mov	bx, [si+20h]
		mov	[bx+2], di

loc_1FD32:
		mov	[si+20h], di
		inc	word ptr [si+22h]

loc_1FD38:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateListNode_1FD01		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_AllocateListNodeB_B54BA (sub_B54BA de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à GaugeWidget_AllocateListNodeB_A303D (sub_A303D de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, variante
; d'allocation de nœud de liste (sub_658).
; ==============================================================================================
GaugeWidget_AllocateListNodeB_1FD3E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	4
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	di, di
		jz	short loc_1FD65
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [si+1Eh]
		mov	[di+2], ax
		mov	[si+1Eh], di
		inc	word ptr [si+22h]

loc_1FD65:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateListNodeB_1FD3E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_ReleaseListNodeB_B54E7 (sub_B54E7 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à GaugeWidget_ReleaseListNodeB_A306A (sub_A306A de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, libère un nœud
; (sub_338), rôle complémentaire à GaugeWidget_ReleaseListNode_A2ED3.
; ==============================================================================================
GaugeWidget_ReleaseListNodeB_1FD6B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	di, [si+1Eh]
		jmp	short loc_1FDB6

loc_1FD7A:
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jnz	short loc_1FDAF
		or	dx, dx
		jz	short loc_1FD8D
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2], ax

loc_1FD8D:
		cmp	[si+1Eh], di
		jnz	short loc_1FD98
		mov	ax, [di+2]
		mov	[si+1Eh], ax

loc_1FD98:
		cmp	[si+20h], di
		jnz	short loc_1FDA0
		mov	[si+20h], dx

loc_1FDA0:
		push	di
		call	sub_33B
		pop	cx
		dec	word ptr [si+22h]
		mov	ax, 1
		jmp	short loc_1FDBC

loc_1FDAF:
		mov	dx, di
		mov	bx, dx
		mov	di, [bx+2]

loc_1FDB6:
		or	di, di
		jnz	short loc_1FD7A
		xor	ax, ax

loc_1FDBC:
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_ReleaseListNodeB_1FD6B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_RemoveListNode_B553C (sub_B553C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_RemoveListNode_A30BF (sub_A30BF de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, retire un nœud de la liste
; (GaugeWidget_ReleaseListNodeB_A306A).
; ==============================================================================================
GaugeWidget_RemoveListNode_1FDC0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_ReleaseListNodeB_1FD6B
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_RemoveListNode_1FDC0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_HelperD_B555C (sub_B555C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_HelperD_A30DF (sub_A30DF de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe visible
; (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperD_1FDE0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		xor	cx, cx
		or	dx, dx
		jl	short loc_1FE04
		cmp	[si+22h], dx
		jle	short loc_1FE04
		mov	si, [si+1Eh]
		jmp	short loc_1FDFE

loc_1FDFA:
		mov	si, [si+2]
		dec	dx

loc_1FDFE:
		or	dx, dx
		jnz	short loc_1FDFA
		mov	cx, [si]

loc_1FE04:
		mov	ax, cx
		pop	si
		pop	bp
		retf
GaugeWidget_HelperD_1FDE0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_HelperE_B5585 (sub_B5585 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_HelperE_A3108 (sub_A3108 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe visible
; (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperE_1FE09		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	si, [si+1Eh]
		jmp	short loc_1FE26

loc_1FE17:
		mov	ax, [si]
		cmp	ax, [bp+arg_2]
		jnz	short loc_1FE22
		mov	ax, dx
		jmp	short loc_1FE2D

loc_1FE22:
		mov	si, [si+2]
		inc	dx

loc_1FE26:
		or	si, si
		jnz	short loc_1FE17
		mov	ax, 0FFFFh

loc_1FE2D:
		pop	si
		pop	bp
		retf
GaugeWidget_HelperE_1FE09		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 9 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_InsertListNode_B55AC (sub_B55AC de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 9 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_InsertListNode_A312F (sub_A312F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 70 lignes, NON DÉTAILLÉE — combine GaugeWidget_AllocateListNode_A3000 et manipulation de
; champs de liste chaînée — insertion d'un nœud.
; ==============================================================================================
GaugeWidget_InsertListNode_1FE30		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[si+26h], di
		mov	ax, [di+4]
		mov	[si+28h], ax
		mov	ax, [di+6]
		mov	[si+2Ah], ax
		mov	ax, [di+8]
		inc	ax
		mov	[si+2Ch], ax
		mov	ax, [di+0Ah]
		inc	ax
		mov	[si+2Eh], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dx, [si+1Ah]
		sub	dx, ax
		sub	dx, [si+2Ch]
		mov	[si+30h], dx
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dx, [si+1Ch]
		sub	dx, ax
		sub	dx, [si+2Eh]
		mov	[si+32h], dx
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_AllocateListNode_1FD01
		add	sp, 4
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_1FEA5
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		pop	cx

loc_1FEA5:
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_InsertListNode_1FE30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_InsertListNodeAtHead_B5625 (sub_B5625 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à GaugeWidget_InsertListNodeAtHead_A31A8 (sub_A31A8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine GaugeWidget_ReleaseListNodeB_A306A et GaugeWidget_AllocateListNode_A3000.
; ==============================================================================================
GaugeWidget_InsertListNodeAtHead_1FEA9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_ReleaseListNodeB_1FD6B
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_AllocateListNode_1FD01
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_InsertListNodeAtHead_1FEA9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_InsertListNodeAtTail_B5646 (sub_B5646 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à GaugeWidget_InsertListNodeAtTail_A31C9 (sub_A31C9 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine GaugeWidget_ReleaseListNodeB_A306A et GaugeWidget_AllocateListNodeB_A303D.
; ==============================================================================================
GaugeWidget_InsertListNodeAtTail_1FECA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_ReleaseListNodeB_1FD6B
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_AllocateListNodeB_1FD3E
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_InsertListNodeAtTail_1FECA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_Method_SetField_B5667 (sub_B5667 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_Method_SetField_A31EA (sub_A31EA de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, méthode virtuelle écrivant un
; champ (dispatch vtable), référencée via jmp depuis un stub VROOMM (sub_6C749).
; ==============================================================================================
GaugeWidget_Method_SetField_1FEEB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+1Eh]
		jmp	short loc_1FF0E

loc_1FEF8:
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6
		mov	di, [di+2]

loc_1FF0E:
		or	di, di
		jnz	short loc_1FEF8
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Widget_TranslateBounds_219D2
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_Method_SetField_1FEEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_Method_ClearField_B56A1 (sub_B56A1 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à GaugeWidget_Method_ClearField_A3224 (sub_A3224 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, méthode
; virtuelle effaçant un champ, référencée via jmp depuis un stub VROOMM (sub_6C73F).
; ==============================================================================================
GaugeWidget_Method_ClearField_1FF25		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+1Eh]
		jmp	short loc_1FF3F

loc_1FF32:
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		mov	di, [di+2]

loc_1FF3F:
		or	di, di
		jnz	short loc_1FF32
		push	si
		call	Widget_SetFlagBit0_219B6
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_Method_ClearField_1FF25		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_Method_ToggleField_B56CA (sub_B56CA de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à GaugeWidget_Method_ToggleField_A324D (sub_A324D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; méthode virtuelle basculant un champ, référencée via jmp depuis un stub VROOMM (sub_6C744).
; ==============================================================================================
GaugeWidget_Method_ToggleField_1FF4E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+1Eh]
		jmp	short loc_1FF69

loc_1FF5B:
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		mov	di, [di+2]

loc_1FF69:
		or	di, di
		jnz	short loc_1FF5B
		push	si
		call	Widget_ClearFlagBit0_219C4
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_Method_ToggleField_1FF4E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_ComputeLayout_B56F4 (sub_B56F4 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_ComputeLayout_A3277 (sub_A3277 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 96 lignes, NON DÉTAILLÉE —
; calcul de layout du widget jauge (manipulation de champs internes multiples, pas d'appel
; externe).
; ==============================================================================================
GaugeWidget_ComputeLayout_1FF78		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	ax, [bp+arg_2]
		add	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_4], ax
		mov	di, [si+1Eh]
		jmp	short loc_1FFF4

loc_1FF9C:
		mov	si, [di]
		mov	ax, [si+4]
		cmp	ax, [bp+var_2]
		jg	short loc_1FFC3
		mov	ax, [si+6]
		cmp	ax, [bp+var_4]
		jg	short loc_1FFC3
		mov	ax, [si+8]
		cmp	ax, [bp+var_2]
		jl	short loc_1FFC3
		mov	ax, [si+0Ah]
		cmp	ax, [bp+var_4]
		jl	short loc_1FFC3
		mov	ax, 1
		jmp	short loc_1FFC5

loc_1FFC3:
		xor	ax, ax

loc_1FFC5:
		or	ax, ax
		jz	short loc_1FFF1
		mov	ax, [bp+var_2]
		sub	ax, [si+4]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		sub	ax, [si+6]
		mov	[bp+var_8], ax
		push	ax
		push	[bp+var_6]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	dx, ax
		or	dx, dx
		jnz	short loc_1FFF1
		mov	dx, si

loc_1FFF1:
		mov	di, [di+2]

loc_1FFF4:
		or	di, di
		jnz	short loc_1FF9C
		mov	ax, dx
		pop	di
		pop	si
		leave
		retf
GaugeWidget_ComputeLayout_1FF78		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_HelperF_A32FD (sub_A32FD de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non détaillé,
; 60 lignes).
; ==============================================================================================
GaugeWidget_HelperF_1FFFE		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	cx, [bp+arg_2]
		add	cx, [si+4]
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_2], ax
		mov	di, [si+1Eh]
		jmp	short loc_2004B

loc_2001F:
		mov	si, [di]
		cmp	[si+4], cx
		jg	short loc_20040
		mov	ax, [si+6]
		cmp	ax, [bp+var_2]
		jg	short loc_20040
		cmp	[si+8], cx
		jl	short loc_20040
		mov	ax, [si+0Ah]
		cmp	ax, [bp+var_2]
		jl	short loc_20040
		mov	ax, 1
		jmp	short loc_20042

loc_20040:
		xor	ax, ax

loc_20042:
		or	ax, ax
		jz	short loc_20048
		mov	dx, si

loc_20048:
		mov	di, [di+2]

loc_2004B:
		or	di, di
		jnz	short loc_2001F
		mov	ax, dx
		pop	di
		pop	si
		leave
		retf
GaugeWidget_HelperF_1FFFE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_RebuildListFromRange_B57DB (sub_B57DB de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_RebuildListFromRange_A3354 (sub_A3354 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 115 lignes, NON DÉTAILLÉE — combine GaugeWidget_GetNthListItem_A2E95 et manipulation de
; champs — reconstruction de la liste sur une plage d'indices.
; ==============================================================================================
GaugeWidget_RebuildListFromRange_20055		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	[bp+arg_4]
		push	di
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_2007D
		jmp	loc_20102

loc_2007D:
		mov	ax, di
		add	ax, [si+4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_6], ax
		mov	bx, [bp+var_2]
		mov	ax, [bp+var_4]
		sub	ax, [bx+4]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		sub	ax, [bx+6]
		mov	[bp+var_A], ax
		cmp	byte ptr [si+34h], 0
		jz	short loc_200E7
		push	0
		jmp	short loc_200D9

loc_200AD:
		cmp	di, [bp+var_2]
		jz	short loc_200D7
		mov	al, [di+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_200D7
		and	byte ptr [di+10h], 0DFh
		mov	al, [di+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_200D7
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		jmp	short loc_200D7

loc_200D7:
		push	1

loc_200D9:
		push	si
		push	cs
		call	near ptr GaugeWidget_GetNthListItem_1FB83
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_200AD

loc_200E7:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah

loc_20102:
		pop	di
		pop	si
		leave
		retf
GaugeWidget_RebuildListFromRange_20055		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_UpdateWithLock_B588C (sub_B588C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_UpdateWithLock_A3405 (sub_A3405 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, encadré par
; PaletteScreen_AcquireOwnership_A1240/ReleaseOwnership_A125D (seg442, via
; sub_6C7B7/sub_6C7BC) — met à jour un champ sous verrou.
; ==============================================================================================
GaugeWidget_UpdateWithLock_20106		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	di, [si+1Eh]
		jmp	short loc_20128

loc_2011A:
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	di, [di+2]

loc_20128:
		or	di, di
		jnz	short loc_2011A
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_UpdateWithLock_20106		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_ComputeRange_B58BD (sub_B58BD de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_ComputeRange_A3436 (sub_A3436 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, calcul sur deux champs (rôle
; exact non détaillé).
; ==============================================================================================
GaugeWidget_ComputeRange_20137		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	di, ax
		or	di, di
		jz	short loc_2018D
		mov	ax, [bp+arg_2]
		add	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		sub	ax, [di+4]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		sub	ax, [di+6]
		mov	[bp+var_8], ax
		push	[bp+arg_6]
		push	ax
		push	[bp+var_6]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+10h]
		add	sp, 8

loc_2018D:
		pop	di
		pop	si
		leave
		retf
GaugeWidget_ComputeRange_20137		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20191		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+35h], 0
		mov	byte ptr [si+4Fh], 1
		mov	word ptr [si+5Ch], 0FFFFh
		xor	ax, ax
		mov	[si+60h], ax
		mov	[si+5Eh], ax
		xor	ax, ax
		mov	[si+64h], ax
		mov	[si+62h], ax
		push	word_5DD44
		mov	ax, si
		add	ax, 37h
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		xor	ax, ax
		mov	[si+70h], ax
		mov	[si+6Eh], ax
		pop	si
		pop	bp
		retf
sub_20191		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 13 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidgetVariantA_ConstructAndInit_B5951 (sub_B5951
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 13 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidgetVariantA_ConstructAndInit_A34CA (sub_A34CA
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), construit (GaugeWidget_Construct_A2DF0), applique un style
; (GaugeWidget_ApplyTextStyle_A3490).
; ==============================================================================================
GaugeWidgetVariantA_ConstructAndInit_201D3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_201EC
		push	72h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_20243

loc_201EC:
		push	large 0
		push	large 0FFFFFFFFh
		push	si
		push	cs
		call	near ptr GaugeWidget_Construct_1FADE
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 216Bh
		mov	word ptr [si+37h], 0
		mov	word ptr [si+39h], 0
		mov	byte ptr [si+44h], 0
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+54h], 2
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		push	si
		push	cs
		call	near ptr sub_20191
		pop	cx

loc_20243:
		mov	ax, si
		pop	si
		pop	bp
		retf
GaugeWidgetVariantA_ConstructAndInit_201D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 13 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidgetVariantB_ConstructAndInit_B59C6 (sub_B59C6
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 13 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidgetVariantB_ConstructAndInit_A353F (sub_A353F
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que GaugeWidgetVariantA_ConstructAndInit_A34CA (variante de paramètres).
; ==============================================================================================
GaugeWidgetVariantB_ConstructAndInit_20248		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_20261
		push	72h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_202BE

loc_20261:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GaugeWidget_Construct_1FADE
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 216Bh
		mov	word ptr [si+37h], 0
		mov	word ptr [si+39h], 0
		mov	byte ptr [si+44h], 0
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+54h], 2
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		push	si
		push	cs
		call	near ptr sub_20191
		pop	cx

loc_202BE:
		mov	ax, si
		pop	si
		pop	bp
		retf
GaugeWidgetVariantB_ConstructAndInit_20248		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 13 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidgetVariantC_ConstructAndInit_B5A41 (sub_B5A41
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 13 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidgetVariantC_ConstructAndInit_A35BA (sub_A35BA
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que GaugeWidgetVariantA_ConstructAndInit_A34CA (variante de paramètres).
; ==============================================================================================
GaugeWidgetVariantC_ConstructAndInit_202C3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_202E0
		push	72h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_20347

loc_202E0:
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		push	ax
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	si
		push	cs
		call	near ptr GaugeWidget_Construct_1FADE
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 216Bh
		mov	word ptr [si+37h], 0
		mov	word ptr [si+39h], 0
		mov	byte ptr [si+44h], 0
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+54h], 2
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		push	si
		push	cs
		call	near ptr sub_20191
		pop	cx

loc_20347:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidgetVariantC_ConstructAndInit_202C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_ComputeLayoutB_B5ACB (sub_B5ACB de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_ComputeLayoutB_A3644 (sub_A3644 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 68 lignes, NON DÉTAILLÉE —
; calcul de layout (manipulation de champs internes, pas d'appel externe).
; ==============================================================================================
GaugeWidget_ComputeLayoutB_2034D		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		mov	[si+1Ah], dx
		mov	[si+1Ch], cx
		mov	ax, [si+4]
		add	ax, [si+1Ah]
		dec	ax
		mov	[si+8], ax
		mov	ax, [si+6]
		add	ax, [si+1Ch]
		dec	ax
		mov	[si+0Ah], ax
		mov	bx, word_5DD44
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		sub	ax, dx
		sar	ax, 1
		mov	[bp+var_2], ax
		mov	ax, [bx+0Ah]
		sub	ax, [bx+6]
		inc	ax
		sub	ax, cx
		sar	ax, 1
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		sub	ax, [si+4]
		mov	[bp+var_A], ax
		mov	ax, [bp+var_8]
		sub	ax, [si+6]
		mov	[bp+var_C], ax
		push	ax
		push	[bp+var_A]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6
		pop	si
		leave
		retf
GaugeWidget_ComputeLayoutB_2034D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 18 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_RebuildAndRelease_B5B44 (sub_B5B44 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 20 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_RebuildAndRelease_A36BD (sub_A36BD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 91 lignes, NON DÉTAILLÉE — combine sub_A3A86, sub_A3B93, Memory_TypedFree_5C7B6 (×2),
; TextFormat_ReleaseStyleList_5E526, GaugeWidget_Destruct_A2E39, sub_338.
; ==============================================================================================
GaugeWidget_RebuildAndRelease_203C6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_203D8
		jmp	loc_20482

loc_203D8:
		mov	word ptr [si+0Eh], 216Bh
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_ReleaseRenderBuffer_2079D
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_ReleaseExtraB_208AA
		pop	cx
		cmp	byte ptr [si+55h], 0
		jz	short loc_20411
		cmp	dword ptr [si+50h], 0
		jz	short loc_20411
		push	0
		mov	al, [si+54h]
		push	ax
		mov	ax, si
		add	ax, 50h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_20411

loc_20411:
		mov	dword ptr [si+50h], 0
		mov	byte ptr [si+55h], 0
		mov	dword ptr [si+56h], 0
		cmp	byte ptr [si+4Ah], 0
		jz	short loc_2044B
		cmp	dword ptr [si+45h], 0
		jz	short loc_2044B
		push	0
		mov	al, [si+49h]
		push	ax
		mov	ax, si
		add	ax, 45h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_2044B

loc_2044B:
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		mov	ax, si
		add	ax, 37h
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	0
		push	si
		push	cs
		call	near ptr GaugeWidget_Destruct_1FB27
		add	sp, 4
		test	di, 1
		jz	short loc_20482
		push	si
		call	sub_33B
		pop	cx

loc_20482:
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_RebuildAndRelease_203C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20486		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		cmp	word ptr [si+5Ch], 0FFFFh
		jz	short loc_204B6
		mov	al, [si+5Ch]
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_5DD44
		call	sub_493A8
		add	sp, 0Ch

loc_204B6:
		cmp	word ptr [si+5Eh], 0
		jz	short loc_204C3
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_DrawFrameConditional_20757
		pop	cx

loc_204C3:
		cmp	dword ptr [si+50h], 0
		jz	short loc_204CF
		mov	ax, 1
		jmp	short loc_204D1

loc_204CF:
		xor	ax, ax

loc_204D1:
		or	ax, ax
		jz	short loc_2050F
		push	word ptr [si+5Ah]
		cmp	byte ptr [si+54h], 3
		jnz	short loc_204F5
		push	0
		mov	al, [si+54h]
		push	ax
		push	large [si+50h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_204FB

loc_204F5:
		mov	dx, [si+52h]
		mov	ax, [si+50h]

loc_204FB:
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch

loc_2050F:
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		pop	bp
		retf
sub_20486		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_HelperG_B5C89 (sub_B5C89 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_HelperG_A3802 (sub_A3802 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe visible
; (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperG_20519		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jz	short loc_2052E
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		pop	cx

loc_2052E:
		pop	si
		pop	bp
		retf
GaugeWidget_HelperG_20519		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_HelperH_B5CA1 (sub_B5CA1 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à GaugeWidget_HelperH_A381A (sub_A381A de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; StreamReader_ValidateState_63DB5 (seg190, via sub_6C75D).
; ==============================================================================================
GaugeWidget_HelperH_20531		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, 0FFFEh
		jnz	short loc_20555
		push	large 290042h
		push	51h
		call	Palette_ConvertPercentToDAC_21C5B
		add	sp, 6
		mov	[si+5Ch], ax
		jmp	short loc_20558

loc_20555:
		mov	[si+5Ch], dx

loc_20558:
		pop	si
		pop	bp
		retf
GaugeWidget_HelperH_20531		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_HelperI_B5CCB (sub_B5CCB de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_HelperI_A3844 (sub_A3844 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe visible
; (rôle exact non détaillé, 39 lignes).
; ==============================================================================================
GaugeWidget_HelperI_2055B		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		or	si, si
		jz	short loc_20592
		mov	ax, [bp+arg_4]
		sub	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		sub	ax, [si+6]
		mov	[bp+var_4], ax
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	ax
		push	[bp+var_2]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah

loc_20592:
		pop	si
		leave
		retf
GaugeWidget_HelperI_2055B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_DrawFrame_B5D05 (sub_B5D05 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_DrawFrame_A387E (sub_A387E de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 114 lignes, NON DÉTAILLÉE —
; dessine le cadre du widget : Render_DrawHorizontalLineClipped_61B8E,
; Render_FillClippedRect_61960 (×4), Rect_ComputeIntersection_60F02, encadré par le verrou
; d'ownership (seg442).
; ==============================================================================================
GaugeWidget_DrawFrame_20595		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		cmp	[bp+arg_C], 0
		jz	short loc_205D4
		mov	al, byte ptr word_5BF20
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_5DD44
		call	sub_49DD0
		add	sp, 0Ch
		inc	di
		inc	[bp+arg_4]
		dec	[bp+arg_6]
		dec	[bp+arg_8]

loc_205D4:
		mov	[bp+var_2], 0
		jmp	short loc_20654

loc_205DB:
		mov	al, byte ptr word_5BF24
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, [bp+arg_4]
		inc	ax
		push	ax
		push	[bp+arg_6]
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, byte ptr word_5BF24
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_8]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, byte ptr word_5BF2A
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		mov	al, byte ptr word_5BF2A
		push	ax
		mov	ax, [bp+arg_8]
		dec	ax
		push	ax
		push	di
		push	[bp+arg_4]
		push	di
		push	word_5DD44
		call	sub_49BA2
		add	sp, 0Ch
		inc	di
		inc	[bp+arg_4]
		dec	[bp+arg_6]
		dec	[bp+arg_8]
		inc	[bp+var_2]

loc_20654:
		mov	ax, [bp+var_2]
		cmp	ax, [bp+arg_A]
		jge	short loc_2065F
		jmp	loc_205DB

loc_2065F:
		mov	al, byte ptr word_5BF28
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_5DD44
		call	sub_493A8
		add	sp, 0Ch
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	di
		pop	si
		leave
		retf
GaugeWidget_DrawFrame_20595		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_DrawFrameWrapper_B5DF4 (sub_B5DF4 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à GaugeWidget_DrawFrameWrapper_A396D (sub_A396D de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, enveloppe
; appelant GaugeWidget_DrawFrame_A387E.
; ==============================================================================================
GaugeWidget_DrawFrameWrapper_20684		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 10001h
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	si
		push	cs
		call	near ptr GaugeWidget_DrawFrame_20595
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
GaugeWidget_DrawFrameWrapper_20684		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_ApplyUnderLock_B5E18 (sub_B5E18 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_ApplyUnderLock_A3991 (sub_A3991 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; encadré par le verrou d'ownership, appelle sub_6C79E (stub voisin).
; ==============================================================================================
GaugeWidget_ApplyUnderLock_206A8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	word ptr [si+5Ch]
		push	[bp+arg_2]
		call	sub_225AC
		add	sp, 4
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		pop	bp
		retf
GaugeWidget_ApplyUnderLock_206A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_QueryRenderState_B5E3E (sub_B5E3E de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_QueryRenderState_A39B7 (sub_A39B7 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle GaugeWidget_RenderModeDispatch_A3EA5.
; ==============================================================================================
GaugeWidget_QueryRenderState_206CE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+35h], 1
		push	si
		nop
		push	cs
		call	near ptr sub_20C33
		pop	cx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf
GaugeWidget_QueryRenderState_206CE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_DrawByMode_A39DC (sub_A39DC de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle GaugeWidget_RenderModeDispatch_A40B0.
; ==============================================================================================
GaugeWidget_DrawByMode_206F3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr sub_20E7C
		pop	cx
		mov	word ptr [si+35h], 0
		pop	si
		pop	bp
		retf
GaugeWidget_DrawByMode_206F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_AllocateRenderBuffer_B5E88 (sub_B5E88 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_AllocateRenderBuffer_A39FA (sub_A39FA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue un tampon de rendu (sub_658).
; ==============================================================================================
GaugeWidget_AllocateRenderBuffer_20711		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [bp+arg_4]
		mov	[di+2], ax
		mov	ax, [bp+arg_6]
		mov	[di+4], ax
		mov	ax, [bp+arg_8]
		mov	[di+6], ax
		mov	word ptr [di+8], 0
		cmp	word ptr [si+5Eh], 0
		jnz	short loc_2074A
		mov	[si+5Eh], di
		jmp	short loc_20750

loc_2074A:
		mov	bx, [si+60h]
		mov	[bx+8], di

loc_20750:
		mov	[si+60h], di
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateRenderBuffer_20711		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_DrawFrameConditional_B5ECE (sub_B5ECE de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_DrawFrameConditional_A3A40 (sub_A3A40 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle GaugeWidget_DrawFrame_A387E.
; ==============================================================================================
GaugeWidget_DrawFrameConditional_20757		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+5Eh]
		jmp	short loc_20795

loc_20767:
		mov	dx, [di]
		mov	cx, [di+2]
		mov	ax, dx
		add	ax, [di+4]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, cx
		add	ax, [di+6]
		dec	ax
		mov	[bp+var_4], ax
		push	large 10001h
		push	ax
		push	[bp+var_2]
		push	cx
		push	dx
		push	si
		push	cs
		call	near ptr GaugeWidget_DrawFrame_20595
		add	sp, 0Eh
		mov	di, [di+8]

loc_20795:
		or	di, di
		jnz	short loc_20767
		pop	di
		pop	si
		leave
		retf
GaugeWidget_DrawFrameConditional_20757		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_ReleaseRenderBuffer_A3A86 (sub_A3A86 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, libère un tampon de rendu (sub_338).
; ==============================================================================================
GaugeWidget_ReleaseRenderBuffer_2079D		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+5Eh]
		jmp	short loc_207BC

loc_207AD:
		mov	[bp+var_2], di
		mov	di, [di+8]
		push	[bp+var_2]
		call	sub_33B
		pop	cx

loc_207BC:
		or	di, di
		jnz	short loc_207AD
		xor	ax, ax
		mov	[si+60h], ax
		mov	[si+5Eh], ax
		pop	di
		pop	si
		leave
		retf
GaugeWidget_ReleaseRenderBuffer_2079D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_AllocateRenderBufferWrapper_B5F43 (sub_B5F43 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à GaugeWidget_AllocateRenderBufferWrapper_E0B7
; (sub_E0B7 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_AllocateRenderBufferWrapper_A3AB5 (sub_A3AB5 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; GaugeWidget_AllocateRenderBuffer_A39FA.
; ==============================================================================================
GaugeWidget_AllocateRenderBufferWrapper_207CC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ah]
		sub	ax, [si+6]
		inc	ax
		push	ax
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	si
		push	cs
		call	near ptr GaugeWidget_AllocateRenderBuffer_20711
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateRenderBufferWrapper_207CC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_AllocateExtra_B5F6B (sub_B5F6B de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_AllocateExtra_A3ADD (sub_A3ADD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 61 lignes, NON DÉTAILLÉE — alloue (sub_658) des données supplémentaires pour le widget.
; ==============================================================================================
GaugeWidget_AllocateExtra_207F4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+62h]
		jmp	short loc_2080B

loc_20801:
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jz	short loc_2080F
		mov	di, [di+4]

loc_2080B:
		or	di, di
		jnz	short loc_20801

loc_2080F:
		or	di, di
		jnz	short loc_20836
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		mov	word ptr [di+4], 0
		cmp	word ptr [si+62h], 0
		jnz	short loc_2082D
		mov	[si+62h], di
		jmp	short loc_20833

loc_2082D:
		mov	bx, [si+64h]
		mov	[bx+4], di

loc_20833:
		mov	[si+64h], di

loc_20836:
		or	di, di
		jz	short loc_20845
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [bp+arg_4]
		mov	[di+2], ax

loc_20845:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateExtra_207F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_ReleaseExtra_B5FC2 (sub_B5FC2 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_ReleaseExtra_A3B34 (sub_A3B34 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 62 lignes, NON DÉTAILLÉE — libère (sub_338) les données supplémentaires du widget.
; ==============================================================================================
GaugeWidget_ReleaseExtra_2084B		proc far

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
		mov	[bp+var_2], 0
		mov	di, [si+62h]
		jmp	short loc_208A2

loc_20860:
		mov	ax, [di+2]
		cmp	ax, [bp+arg_2]
		jnz	short loc_2089C
		mov	ax, [di+4]
		mov	[bp+var_4], ax
		cmp	[bp+var_2], 0
		jz	short loc_2087A
		mov	bx, [bp+var_2]
		mov	[bx+4], ax

loc_2087A:
		cmp	[si+64h], di
		jnz	short loc_20885
		mov	ax, [bp+var_2]
		mov	[si+64h], ax

loc_20885:
		cmp	[si+62h], di
		jnz	short loc_20890
		mov	ax, [di+4]
		mov	[si+62h], ax

loc_20890:
		push	di
		call	sub_33B
		pop	cx
		mov	di, [bp+var_4]
		jmp	short loc_208A2

loc_2089C:
		mov	[bp+var_2], di
		mov	di, [di+4]

loc_208A2:
		or	di, di
		jnz	short loc_20860
		pop	di
		pop	si
		leave
		retf
GaugeWidget_ReleaseExtra_2084B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_ReleaseExtraB_A3B93 (sub_A3B93 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, variante de libération (sub_338).
; ==============================================================================================
GaugeWidget_ReleaseExtraB_208AA		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+62h]
		jmp	short loc_208C9

loc_208BA:
		mov	[bp+var_2], di
		mov	di, [di+4]
		push	[bp+var_2]
		call	sub_33B
		pop	cx

loc_208C9:
		or	di, di
		jnz	short loc_208BA
		xor	ax, ax
		mov	[si+64h], ax
		mov	[si+62h], ax
		pop	di
		pop	si
		leave
		retf
GaugeWidget_ReleaseExtraB_208AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_HelperJ_B6050 (sub_B6050 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à GaugeWidget_HelperJ_A3BC2 (sub_A3BC2 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe
; visible (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperJ_208D9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	si, [si+62h]
		jmp	short loc_208F4

loc_208E5:
		mov	ax, [si]
		cmp	ax, [bp+arg_2]
		jnz	short loc_208F1
		mov	ax, [si+2]
		jmp	short loc_208FA

loc_208F1:
		mov	si, [si+4]

loc_208F4:
		or	si, si
		jnz	short loc_208E5
		xor	ax, ax

loc_208FA:
		pop	si
		pop	bp
		retf
GaugeWidget_HelperJ_208D9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_208FD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_20929
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_InsertListNode_1FE30
		add	sp, 4
		cmp	[bp+arg_4], 0
		jz	short loc_20932
		push	di
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr GaugeWidget_AllocateExtra_207F4
		add	sp, 6
		jmp	short loc_20932

loc_20929:
		push	2131h
		call	sub_9D78
		pop	cx

loc_20932:
		pop	di
		pop	si
		pop	bp
		retf
sub_208FD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_UpdateWithLockWrapper_B60AD (sub_B60AD de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à GaugeWidget_UpdateWithLockWrapper_A3C14 (sub_A3C14
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle GaugeWidget_UpdateWithLock_A3405.
; ==============================================================================================
GaugeWidget_UpdateWithLockWrapper_20936		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		pop	cx
		push	si
		push	cs
		call	near ptr GaugeWidget_UpdateWithLock_20106
		pop	cx
		pop	si
		pop	bp
		retf
GaugeWidget_UpdateWithLockWrapper_20936		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_QueryAndFormat_B60C5 (sub_B60C5 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_QueryAndFormat_E256 (sub_E256 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à GaugeWidget_QueryAndFormat_A3C2C (sub_A3C2C de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Joystick_LoadCalibrationSample-like accessor (sub_66DA3, seg163) et
; GaugeWidget_FormatDisplayValue_A3CF6.
; ==============================================================================================
GaugeWidget_QueryAndFormat_2094E		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, 0C00h
		int	21h

loc_2095D:
		push	0FFh
		push	612Dh
		call	sub_55996
		add	sp, 4
		cmp	byte_5FE4D, 0
		jnz	short loc_2095D
		push	[bp+arg_2]
		push	0FFFFh
		push	si
		nop
		push	cs
		call	near ptr sub_20A18
		add	sp, 6
		mov	[bp+var_2], ax
		push	word ptr [si+6Ch]
		push	word ptr [si+6Ah]
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
GaugeWidget_QueryAndFormat_2094E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_RebuildDisplay_B611E (sub_B611E de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à GaugeWidget_RebuildDisplay_A3C85 (sub_A3C85 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; GaugeWidget_HelperJ_A3BC2 et GaugeWidget_RebuildListFromRange_A3354.
; ==============================================================================================
GaugeWidget_RebuildDisplay_209A7		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_8]
		push	si
		push	cs
		call	near ptr GaugeWidget_HelperJ_208D9
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_209FA
		mov	ax, [bp+arg_2]
		add	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		add	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		sub	ax, [di+4]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		sub	ax, [di+6]
		mov	[bp+var_8], ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	ax
		push	[bp+var_6]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+28h]
		jmp	short loc_20A11

loc_209FA:
		cmp	[bp+arg_6], 0
		jz	short loc_20A14
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GaugeWidget_RebuildListFromRange_20055

loc_20A11:
		add	sp, 0Ah

loc_20A14:
		pop	di
		pop	si
		leave
		retf
GaugeWidget_RebuildDisplay_209A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20A18		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	word ptr [si+6Ch], 0
		mov	word ptr [si+6Ah], 0
		mov	[bp+var_2], 0
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		jmp	loc_20C20

loc_20A3E:
		push	6126h
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte_5FE46, 0
		jnz	short loc_20A6D
		push	6126h
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_20A6D
		push	612Dh
		push	6126h
		call	sub_19979
		add	sp, 4
		jmp	short loc_20A6D

loc_20A6D:
		mov	al, byte_5FE46
		mov	ah, 0
		or	ax, ax
		jnz	short loc_20A79
		jmp	loc_20B48

loc_20A79:
		mov	ax, [si+68h]
		mov	[bp+var_4], ax
		mov	ax, word_5FE48
		sar	ax, 1
		mov	[si+66h], ax
		mov	ax, word_5FE4A
		mov	[si+68h], ax
		mov	ax, [si+68h]
		sub	[bp+var_4], ax
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_20AA6
		cmp	[bp+var_4], 0
		jnz	short loc_20AA6
		jmp	loc_20B36

loc_20AA6:
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+20h]
		add	sp, 6
		mov	[bp+var_6], ax
		cmp	ax, [bp+var_2]
		jz	short loc_20ACB
		mov	ax, 1
		jmp	short loc_20ACD

loc_20ACB:
		xor	ax, ax

loc_20ACD:
		mov	[bp+var_8], ax
		cmp	[bp+var_2], 0
		jz	short loc_20AE9
		cmp	[bp+var_8], 0
		jz	short loc_20AE9
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+14h]
		pop	cx

loc_20AE9:
		cmp	[bp+var_6], 0
		jz	short loc_20B19
		push	[bp+var_8]
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+10h]
		add	sp, 8
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	ax, [si+6Eh]
		mov	[bp+var_A], ax
		jmp	short loc_20B26

loc_20B19:
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	ax, [si+70h]
		mov	[bp+var_C], ax

loc_20B26:
		mov	word_606D8, ax
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		mov	ax, [bp+var_6]
		mov	[bp+var_2], ax

loc_20B36:
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_20B48
		mov	al, byte_5FE47
		mov	ah, 0
		mov	[si+6Ah], ax

loc_20B48:
		mov	al, byte_5FE4D
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_20B55
		jmp	loc_20BE5

loc_20B55:
		mov	ax, 0C00h
		int	21h
		mov	word ptr [si+6Ah], 0
		test	byte_5FE50, 0Ch
		jz	short loc_20B6B
		mov	ax, 1
		jmp	short loc_20B6D

loc_20B6B:
		xor	ax, ax

loc_20B6D:
		mov	ah, 0
		shl	ax, 0
		push	ax
		test	byte_5FE50, 30h
		jz	short loc_20B7F
		mov	ax, 1
		jmp	short loc_20B81

loc_20B7F:
		xor	ax, ax

loc_20B81:
		mov	ah, 0
		shl	ax, 1
		pop	dx
		or	dx, ax
		push	dx
		test	byte_5FE50, 0C0h
		jz	short loc_20B95
		mov	ax, 1
		jmp	short loc_20B97

loc_20B95:
		xor	ax, ax

loc_20B97:
		mov	ah, 0
		shl	ax, 2
		pop	dx
		or	dx, ax
		mov	word_5BEFC, dx
		mov	al, byte_5FE4E
		mov	ah, 0
		shl	dx, 8
		or	dx, ax
		mov	[si+6Ch], dx
		push	word ptr [si+6Ch]
		push	si
		push	cs
		call	near ptr GaugeWidget_HelperJ_208D9
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_20BE5
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	di, ax
		or	di, di
		jnz	short loc_20BE5
		cmp	[bp+arg_4], 0
		jnz	short loc_20C2D

loc_20BE5:
		or	di, di
		jnz	short loc_20C17
		mov	al, byte_5FE46
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_20C17
		mov	ax, [si+68h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+66h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	di, ax
		or	di, di
		jnz	short loc_20C17
		cmp	[bp+arg_4], 0
		jnz	short loc_20C2D

loc_20C17:
		cmp	[bp+arg_2], 0FFFFh
		jz	short loc_20C20
		dec	[bp+arg_2]

loc_20C20:
		or	di, di
		jnz	short loc_20C2D
		cmp	[bp+arg_2], 0
		jz	short loc_20C2D
		jmp	loc_20A3E

loc_20C2D:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_20A18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20C33		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [si+8]
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+3Bh], ax
		mov	ax, [bp+var_4]
		mov	[si+3Dh], ax
		mov	ax, [bp+var_6]
		mov	[si+3Fh], ax
		mov	ax, [bp+var_8]
		mov	[si+41h], ax
		mov	ax, [si+3Fh]
		sub	ax, [si+3Bh]
		inc	ax
		mov	dx, [si+41h]
		sub	dx, [si+3Dh]
		inc	dx
		imul	dx
		mov	di, ax
		push	0
		push	2
		push	67B0h
		call	Memory_TypedAllocDispatchC_4495C
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_C], eax
		push	0
		push	3
		push	67B0h
		call	Memory_TypedAllocDispatchC_4495C
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_10], eax
		cmp	byte ptr [si+4Fh], 3
		jnz	short loc_20CC9
		movzx	eax, di
		cmp	eax, [bp+var_C]
		jle	short loc_20CC9
		mov	byte ptr [si+4Fh], 2

loc_20CC9:
		cmp	byte ptr [si+4Fh], 4
		jnz	short loc_20CDD
		movzx	eax, di
		cmp	eax, [bp+var_10]
		jle	short loc_20CDD
		mov	byte ptr [si+4Fh], 2

loc_20CDD:
		cmp	byte ptr [si+4Fh], 1
		jnz	short loc_20CF7
		movzx	eax, di
		cmp	eax, [bp+var_10]
		jle	short loc_20CF3
		mov	byte ptr [si+4Fh], 2
		jmp	short loc_20CF7

loc_20CF3:
		mov	byte ptr [si+4Fh], 4

loc_20CF7:
		mov	al, [si+4Fh]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_20D06
		jmp	loc_20E67

loc_20D06:
		shl	bx, 1
		jmp	cs:off_20E72[bx]	; switch jump

loc_20D0D:
		movzx	eax, di
		mov	[bp+var_14], eax
		push	1
		push	0
		push	2
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2], dx
		mov	word ptr [bp+var_18], ax
		mov	eax, [bp+var_18]
		mov	[si+45h], eax
		mov	byte ptr [si+49h], 2
		mov	byte ptr [si+4Ah], 1
		mov	dword ptr [si+4Bh], 0
		mov	eax, [bp+var_14]
		mov	[si+4Bh], eax
		cmp	byte ptr [si+49h], 3
		jnz	short loc_20D6B
		push	0
		mov	al, [si+49h]
		push	ax
		push	large [si+45h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_20D71

loc_20D6B:
		mov	dx, [si+47h]
		mov	ax, [si+45h]

loc_20D71:
		or	ax, dx
		jnz	short loc_20D78
		jmp	loc_20E4F

loc_20D78:
		mov	ax, si
		add	ax, 37h
		jz	short loc_20D86
		mov	ax, si
		add	ax, 3Bh
		jmp	short loc_20D8B

loc_20D86:
		mov	ax, si
		add	ax, 37h

loc_20D8B:
		push	ax
		cmp	byte ptr [si+49h], 3
		jnz	short loc_20D95
		jmp	loc_20E34

loc_20D95:
		mov	dx, [si+47h]
		mov	ax, [si+45h]

loc_20D9B:
		push	dx
		push	ax
		push	word_5DD44
		call	sub_4AB4C
		add	sp, 8
		jmp	loc_20E67
		jmp	loc_20E4F

loc_20DAF:
		movzx	eax, di
		mov	[bp+var_1C], eax
		push	1
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2], dx
		mov	word ptr [bp+var_20], ax
		mov	eax, [bp+var_20]
		mov	[si+45h], eax
		mov	byte ptr [si+49h], 3
		mov	byte ptr [si+4Ah], 1
		mov	dword ptr [si+4Bh], 0
		mov	eax, [bp+var_1C]
		mov	[si+4Bh], eax
		cmp	byte ptr [si+49h], 3
		jnz	short loc_20E0D
		push	0
		mov	al, [si+49h]
		push	ax
		push	large [si+45h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_20E13

loc_20E0D:
		mov	dx, [si+47h]
		mov	ax, [si+45h]

loc_20E13:
		or	ax, dx
		jz	short loc_20E4F
		mov	ax, si
		add	ax, 37h
		jz	short loc_20E25
		mov	ax, si
		add	ax, 3Bh
		jmp	short loc_20E2A

loc_20E25:
		mov	ax, si
		add	ax, 37h

loc_20E2A:
		push	ax
		cmp	byte ptr [si+49h], 3
		jz	short loc_20E34
		jmp	loc_20D95

loc_20E34:
		push	0
		mov	al, [si+49h]
		push	ax
		push	large [si+45h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	loc_20D9B
		jmp	loc_20D95

loc_20E4F:
		mov	byte ptr [si+4Fh], 0
		jmp	short loc_20E67

loc_20E55:
		push	si
		push	2153h
		mov	ax, si
		add	ax, 37h
		push	ax
		call	sub_58CE0
		add	sp, 6

loc_20E67:
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_20C33		endp

; START OF FUNCTION CHUNK FOR sub_20C33
off_20E72	dw offset loc_20E67
		dw offset loc_20E67
		dw offset loc_20E55
		dw offset loc_20D0D
		dw offset loc_20DAF
; END OF FUNCTION CHUNK FOR sub_20C33

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20E7C		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	al, [si+4Fh]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_20E9C
		jmp	loc_20FCA

loc_20E9C:
		shl	bx, 1
		jmp	cs:off_20FE6[bx]	; switch jump

loc_20EA3:
		cmp	byte ptr [si+49h], 3
		jnz	short loc_20EC0
		push	0
		mov	al, [si+49h]
		push	ax
		push	large [si+45h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_20EC6

loc_20EC0:
		mov	dx, [si+47h]
		mov	ax, [si+45h]

loc_20EC6:
		or	ax, dx
		jnz	short loc_20ECD
		jmp	loc_20FDC

loc_20ECD:
		mov	ax, si
		add	ax, 37h
		jz	short loc_20EDB
		mov	ax, si
		add	ax, 3Bh
		jmp	short loc_20EE0

loc_20EDB:
		mov	ax, si
		add	ax, 37h

loc_20EE0:
		push	ax
		cmp	byte ptr [si+49h], 3
		jnz	short loc_20EFE
		push	0
		mov	al, [si+49h]
		push	ax
		push	large [si+45h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_20F04

loc_20EFE:
		mov	dx, [si+47h]
		mov	ax, [si+45h]

loc_20F04:
		push	dx
		push	ax
		push	word_5DD44
		call	sub_4A530
		add	sp, 8
		cmp	byte ptr [si+4Ah], 0
		jz	short loc_20F21
		cmp	dword ptr [si+45h], 0
		jz	short loc_20F21
		jmp	short loc_20F99

loc_20F21:
		mov	dword ptr [si+45h], 0
		mov	byte ptr [si+4Ah], 0
		mov	dword ptr [si+4Bh], 0
		jmp	loc_20FDC

loc_20F38:
		cmp	byte ptr [si+49h], 3
		jnz	short loc_20F55
		push	0
		mov	al, [si+49h]
		push	ax
		push	large [si+45h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_20F5B

loc_20F55:
		mov	dx, [si+47h]
		mov	ax, [si+45h]

loc_20F5B:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_20FDC
		mov	ax, si
		add	ax, 37h
		jz	short loc_20F76
		mov	ax, si
		add	ax, 3Bh
		jmp	short loc_20F7B

loc_20F76:
		mov	ax, si
		add	ax, 37h

loc_20F7B:
		push	ax
		push	large [bp+var_4]
		push	word_5DD44
		call	sub_4A530
		add	sp, 8
		cmp	byte ptr [si+4Ah], 0
		jz	short loc_20F21
		cmp	dword ptr [si+45h], 0
		jz	short loc_20F21

loc_20F99:
		push	0
		mov	al, [si+49h]
		push	ax
		mov	ax, si
		add	ax, 45h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	loc_20F21
		jmp	loc_20F21

loc_20FB6:
		push	si
		push	215Fh
		mov	ax, si
		add	ax, 37h
		push	ax
		call	sub_58CE5
		add	sp, 6
		jmp	short loc_20FDC

loc_20FCA:
		mov	al, [si+5Ch]
		push	ax
		mov	ax, si
		add	ax, 37h
		push	ax
		call	sub_4943A
		add	sp, 4

loc_20FDC:
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		leave
		retf
sub_20E7C		endp

; START OF FUNCTION CHUNK FOR sub_20E7C
off_20FE6	dw offset loc_20FDC
		dw offset loc_20FCA
		dw offset loc_20FB6
		dw offset loc_20EA3
		dw offset loc_20F38
; END OF FUNCTION CHUNK FOR sub_20E7C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; GaugeWidget_ReleaseExtraAndNode_B6693 (sub_B6693 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à GaugeWidget_ReleaseExtraAndNode_A41FA (sub_A41FA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine GaugeWidget_ReleaseExtra_A3B34 et GaugeWidget_RemoveListNode_A30BF.
; ==============================================================================================
GaugeWidget_ReleaseExtraAndNode_20FF0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_ReleaseExtra_2084B
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_RemoveListNode_1FDC0
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_ReleaseExtraAndNode_20FF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_21011		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	[bp+arg_4], 0
		jz	short loc_2103C
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	word ptr [si+5Ch]
		push	di
		call	sub_225AC
		add	sp, 4
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx

loc_2103C:
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_ReleaseExtraAndNode_20FF0
		add	sp, 4
		or	di, di
		jz	short loc_21057
		push	3
		push	di
		mov	bx, [di+0Eh]
sub_21011		endp

; START OF FUNCTION CHUNK FOR sub_21011
		db 0FFh
; END OF FUNCTION CHUNK FOR sub_21011
seg047		ends
