ovr330		segment	para public 'OVERLAY' use16
		assume cs:ovr330
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B5250		proc far

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
		jnz	short loc_B5269
		push	36h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B5298

loc_B5269:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2B88h
		mov	byte ptr [si+24h], 1
		xor	ax, ax
		mov	[si+20h], ax
		mov	[si+1Eh], ax
		mov	word ptr [si+22h], 0
		mov	byte ptr [si+35h], 0

loc_B5298:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_B5250		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_Destruct_A2E39 (sub_A2E39 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; GaugeWidget_ReleaseListNode_A2ED3, libère un style (TextFormat_ReleaseStyleList_5E526,
; seg143) et l'objet (sub_338).
; ==============================================================================================
GaugeWidget_Destruct_B529D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B52CC
		mov	word ptr [si+0Eh], 2B88h
		push	si
		nop
		push	cs
		call	near ptr sub_B5337
		pop	cx
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_B52CC
		push	si
		call	sub_3B2
		pop	cx

loc_B52CC:
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_Destruct_B529D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_GetFirstListItem_A2E6C (sub_A2E6C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle GaugeWidget_GetNthListItem_A2E95 avec index 0.
; ==============================================================================================
GaugeWidget_GetFirstListItem_B52D0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+35h], 1
		push	0
		jmp	short loc_B52E6

loc_B52E0:
		and	byte ptr [di+10h], 0FBh
		push	1

loc_B52E6:
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_GetNthListItem_B52F9
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_B52E0
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_GetFirstListItem_B52D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_GetNthListItem_A2E95 (sub_A2E95 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; parcourt une liste chaînée (champ +0x24, next-ptr à +2) N fois et retourne la valeur du nœud
; atteint — accesseur de liste indexée, motif similaire à IndexedRecordReader (seg196).
; ==============================================================================================
GaugeWidget_GetNthListItem_B52F9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jnz	short loc_B5318
		mov	ax, [si+1Eh]
		mov	[si+25h], ax
		jmp	short loc_B5325

loc_B530F:
		mov	bx, [si+25h]
		mov	ax, [bx+2]
		mov	[si+25h], ax

loc_B5318:
		cmp	word ptr [si+25h], 0
		jz	short loc_B5325
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_B530F

loc_B5325:
		cmp	word ptr [si+25h], 0
		jnz	short loc_B532F
		xor	ax, ax
		jmp	short loc_B5334

loc_B532F:
		mov	bx, [si+25h]
		mov	ax, [bx]

loc_B5334:
		pop	si
		pop	bp
		retf
GaugeWidget_GetNthListItem_B52F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B5337		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		jmp	short loc_B5380

loc_B5341:
		mov	di, [si+1Eh]
		cmp	byte ptr [si+24h], 0
		jz	short loc_B5360
		cmp	word ptr [di], 0
		jz	short loc_B5360
		push	3
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short loc_B5360

loc_B5360:
		mov	ax, [di+2]
		mov	[si+1Eh], ax
		push	di
		call	sub_3B2
		pop	cx
		mov	ax, [si+22h]
		dec	word ptr [si+22h]
		or	ax, ax
		jg	short loc_B5380
		push	0E001h
		call	sub_1DDFE
		pop	cx

loc_B5380:
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_B5341
		xor	ax, ax
		mov	[si+20h], ax
		mov	[si+1Eh], ax
		mov	word ptr [si+22h], 0
		pop	di
		pop	si
		pop	bp
		retf
sub_B5337		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_Helper_A2F1A (sub_A2F1A de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non détaillé,
; manipulation de champs internes).
; ==============================================================================================
GaugeWidget_Helper_B5397		proc far

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
		jmp	short loc_B53EC

loc_B53A9:
		mov	[bp+var_2], 1
		mov	cx, [si+1Eh]
		mov	bx, cx
		mov	di, [bx+2]
		jmp	short loc_B53E8

loc_B53B8:
		mov	bx, cx
		mov	bx, [bx]
		mov	al, [bx+15h]
		and	ax, 0Fh
		mov	bx, [di]
		mov	dl, [bx+15h]
		and	dx, 0Fh
		cmp	ax, dx
		jle	short loc_B53E3
		mov	[bp+var_2], 0
		mov	bx, cx
		mov	ax, [bx]
		mov	[bp+var_4], ax
		mov	ax, [di]
		mov	[bx], ax
		mov	ax, [bp+var_4]
		mov	[di], ax

loc_B53E3:
		mov	cx, di
		mov	di, [di+2]

loc_B53E8:
		or	di, di
		jnz	short loc_B53B8

loc_B53EC:
		cmp	[bp+var_2], 0
		jz	short loc_B53A9
		pop	di
		pop	si
		leave
		retf
GaugeWidget_Helper_B5397		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_HelperB_A2F79 (sub_A2F79 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperB_B53F6		proc far

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
		jmp	short loc_B5425

loc_B5405:
		mov	bx, [si]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, [bp+arg_2]
		jnz	short loc_B5422
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		and	ax, 0Fh
		and	byte ptr [bx+15h], 0F0h
		or	[bx+15h], al

loc_B5422:
		mov	si, [si+2]

loc_B5425:
		or	si, si
		jnz	short loc_B5405
		pop	si
		leave
		retf
GaugeWidget_HelperB_B53F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_HelperC_A2FAF (sub_A2FAF de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperC_B542C		proc far

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
		jmp	short loc_B5476

loc_B5441:
		mov	bx, [si]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, dx
		jnz	short loc_B5455
		mov	[bp+var_2], cx
		mov	ax, [bp+var_2]
		jmp	short loc_B5467

loc_B5455:
		mov	bx, [si]
		mov	al, [bx+15h]
		and	ax, 0Fh
		cmp	ax, cx
		jnz	short loc_B5473
		mov	[bp+var_4], dx
		mov	ax, [bp+var_4]

loc_B5467:
		and	ax, 0Fh
		mov	bx, [si]
		and	byte ptr [bx+15h], 0F0h
		or	[bx+15h], al

loc_B5473:
		mov	si, [si+2]

loc_B5476:
		or	si, si
		jnz	short loc_B5441
		pop	si
		leave
		retf
GaugeWidget_HelperC_B542C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_AllocateListNode_A3000 (sub_A3000 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, alloue un nœud de liste (sub_658).
; ==============================================================================================
GaugeWidget_AllocateListNode_B547D		proc far

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
		jz	short loc_B54B4
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	word ptr [di+2], 0
		cmp	word ptr [si+1Eh], 0
		jnz	short loc_B54A8
		mov	[si+1Eh], di
		jmp	short loc_B54AE

loc_B54A8:
		mov	bx, [si+20h]
		mov	[bx+2], di

loc_B54AE:
		mov	[si+20h], di
		inc	word ptr [si+22h]

loc_B54B4:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateListNode_B547D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_AllocateListNodeB_A303D (sub_A303D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, variante d'allocation de nœud de liste
; (sub_658).
; ==============================================================================================
GaugeWidget_AllocateListNodeB_B54BA		proc far

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
		jz	short loc_B54E1
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [si+1Eh]
		mov	[di+2], ax
		mov	[si+1Eh], di
		inc	word ptr [si+22h]

loc_B54E1:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateListNodeB_B54BA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_ReleaseListNodeB_A306A (sub_A306A de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, libère un nœud (sub_338), rôle complémentaire
; à GaugeWidget_ReleaseListNode_A2ED3.
; ==============================================================================================
GaugeWidget_ReleaseListNodeB_B54E7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	di, [si+1Eh]
		jmp	short loc_B5532

loc_B54F6:
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jnz	short loc_B552B
		or	dx, dx
		jz	short loc_B5509
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2], ax

loc_B5509:
		cmp	[si+1Eh], di
		jnz	short loc_B5514
		mov	ax, [di+2]
		mov	[si+1Eh], ax

loc_B5514:
		cmp	[si+20h], di
		jnz	short loc_B551C
		mov	[si+20h], dx

loc_B551C:
		push	di
		call	sub_3B2
		pop	cx
		dec	word ptr [si+22h]
		mov	ax, 1
		jmp	short loc_B5538

loc_B552B:
		mov	dx, di
		mov	bx, dx
		mov	di, [bx+2]

loc_B5532:
		or	di, di
		jnz	short loc_B54F6
		xor	ax, ax

loc_B5538:
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_ReleaseListNodeB_B54E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_RemoveListNode_A30BF (sub_A30BF de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, retire un nœud de la liste
; (GaugeWidget_ReleaseListNodeB_A306A).
; ==============================================================================================
GaugeWidget_RemoveListNode_B553C		proc far

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
		call	near ptr GaugeWidget_ReleaseListNodeB_B54E7
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_RemoveListNode_B553C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_HelperD_A30DF (sub_A30DF de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperD_B555C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		xor	cx, cx
		or	dx, dx
		jl	short loc_B5580
		cmp	[si+22h], dx
		jle	short loc_B5580
		mov	si, [si+1Eh]
		jmp	short loc_B557A

loc_B5576:
		mov	si, [si+2]
		dec	dx

loc_B557A:
		or	dx, dx
		jnz	short loc_B5576
		mov	cx, [si]

loc_B5580:
		mov	ax, cx
		pop	si
		pop	bp
		retf
GaugeWidget_HelperD_B555C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_HelperE_A3108 (sub_A3108 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperE_B5585		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	si, [si+1Eh]
		jmp	short loc_B55A2

loc_B5593:
		mov	ax, [si]
		cmp	ax, [bp+arg_2]
		jnz	short loc_B559E
		mov	ax, dx
		jmp	short loc_B55A9

loc_B559E:
		mov	si, [si+2]
		inc	dx

loc_B55A2:
		or	si, si
		jnz	short loc_B5593
		mov	ax, 0FFFFh

loc_B55A9:
		pop	si
		pop	bp
		retf
GaugeWidget_HelperE_B5585		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 9 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_InsertListNode_A312F (sub_A312F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 70 lignes, NON DÉTAILLÉE — combine GaugeWidget_AllocateListNode_A3000 et manipulation de
; champs de liste chaînée — insertion d'un nœud.
; ==============================================================================================
GaugeWidget_InsertListNode_B55AC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[si+27h], di
		mov	ax, [di+4]
		mov	[si+29h], ax
		mov	ax, [di+6]
		mov	[si+2Bh], ax
		mov	ax, [di+8]
		inc	ax
		mov	[si+2Dh], ax
		mov	ax, [di+0Ah]
		inc	ax
		mov	[si+2Fh], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dx, [si+1Ah]
		sub	dx, ax
		sub	dx, [si+2Dh]
		mov	[si+31h], dx
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dx, [si+1Ch]
		sub	dx, ax
		sub	dx, [si+2Fh]
		mov	[si+33h], dx
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_AllocateListNode_B547D
		add	sp, 4
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_B5621
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		pop	cx

loc_B5621:
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_InsertListNode_B55AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_InsertListNodeAtHead_A31A8 (sub_A31A8 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; GaugeWidget_ReleaseListNodeB_A306A et GaugeWidget_AllocateListNode_A3000.
; ==============================================================================================
GaugeWidget_InsertListNodeAtHead_B5625		proc far

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
		call	near ptr GaugeWidget_ReleaseListNodeB_B54E7
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_AllocateListNode_B547D
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_InsertListNodeAtHead_B5625		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_InsertListNodeAtTail_A31C9 (sub_A31C9 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; GaugeWidget_ReleaseListNodeB_A306A et GaugeWidget_AllocateListNodeB_A303D.
; ==============================================================================================
GaugeWidget_InsertListNodeAtTail_B5646		proc far

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
		call	near ptr GaugeWidget_ReleaseListNodeB_B54E7
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_AllocateListNodeB_B54BA
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_InsertListNodeAtTail_B5646		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_Method_SetField_A31EA (sub_A31EA de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, méthode virtuelle écrivant un champ (dispatch
; vtable), référencée via jmp depuis un stub VROOMM (sub_6C749).
; ==============================================================================================
GaugeWidget_Method_SetField_B5667		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+1Eh]
		jmp	short loc_B568A

loc_B5674:
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6
		mov	di, [di+2]

loc_B568A:
		or	di, di
		jnz	short loc_B5674
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_74A69
		add	sp, 6
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_Method_SetField_B5667		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_Method_ClearField_A3224 (sub_A3224 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, méthode virtuelle effaçant un champ,
; référencée via jmp depuis un stub VROOMM (sub_6C73F).
; ==============================================================================================
GaugeWidget_Method_ClearField_B56A1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+1Eh]
		jmp	short loc_B56BB

loc_B56AE:
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx]
		pop	cx
		mov	di, [di+2]

loc_B56BB:
		or	di, di
		jnz	short loc_B56AE
		push	si
		call	sub_74A5F
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_Method_ClearField_B56A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_Method_ToggleField_A324D (sub_A324D de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, méthode virtuelle basculant un champ,
; référencée via jmp depuis un stub VROOMM (sub_6C744).
; ==============================================================================================
GaugeWidget_Method_ToggleField_B56CA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+1Eh]
		jmp	short loc_B56E5

loc_B56D7:
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		mov	di, [di+2]

loc_B56E5:
		or	di, di
		jnz	short loc_B56D7
		push	si
		call	sub_74A64
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_Method_ToggleField_B56CA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_ComputeLayout_A3277 (sub_A3277 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 96 lignes, NON DÉTAILLÉE — calcul de
; layout du widget jauge (manipulation de champs internes multiples, pas d'appel externe).
; ==============================================================================================
GaugeWidget_ComputeLayout_B56F4		proc far

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
		jmp	short loc_B5770

loc_B5718:
		mov	si, [di]
		mov	ax, [si+4]
		cmp	ax, [bp+var_2]
		jg	short loc_B573F
		mov	ax, [si+6]
		cmp	ax, [bp+var_4]
		jg	short loc_B573F
		mov	ax, [si+8]
		cmp	ax, [bp+var_2]
		jl	short loc_B573F
		mov	ax, [si+0Ah]
		cmp	ax, [bp+var_4]
		jl	short loc_B573F
		mov	ax, 1
		jmp	short loc_B5741

loc_B573F:
		xor	ax, ax

loc_B5741:
		or	ax, ax
		jz	short loc_B576D
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
		jnz	short loc_B576D
		mov	dx, si

loc_B576D:
		mov	di, [di+2]

loc_B5770:
		or	di, di
		jnz	short loc_B5718
		mov	ax, dx
		pop	di
		pop	si
		leave
		retf
GaugeWidget_ComputeLayout_B56F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B577A		proc far

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
		jmp	short loc_B57D1

loc_B579B:
		mov	si, [di]
		cmp	[si+4], cx
		jg	short loc_B57BC
		mov	ax, [si+6]
		cmp	ax, [bp+var_2]
		jg	short loc_B57BC
		cmp	[si+8], cx
		jl	short loc_B57BC
		mov	ax, [si+0Ah]
		cmp	ax, [bp+var_2]
		jl	short loc_B57BC
		mov	ax, 1
		jmp	short loc_B57BE

loc_B57BC:
		xor	ax, ax

loc_B57BE:
		or	ax, ax
		jz	short loc_B57CE
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_B57CE
		mov	dx, si

loc_B57CE:
		mov	di, [di+2]

loc_B57D1:
		or	di, di
		jnz	short loc_B579B
		mov	ax, dx
		pop	di
		pop	si
		leave
		retf
sub_B577A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_RebuildListFromRange_A3354 (sub_A3354 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 115 lignes, NON DÉTAILLÉE — combine GaugeWidget_GetNthListItem_A2E95 et manipulation de
; champs — reconstruction de la liste sur une plage d'indices.
; ==============================================================================================
GaugeWidget_RebuildListFromRange_B57DB		proc far

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
		jnz	short loc_B5803
		jmp	loc_B5888

loc_B5803:
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
		cmp	byte ptr [si+35h], 0
		jz	short loc_B586D
		push	0
		jmp	short loc_B585F

loc_B5833:
		cmp	di, [bp+var_2]
		jz	short loc_B585D
		mov	al, [di+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_B585D
		and	byte ptr [di+10h], 0DFh
		mov	al, [di+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_B585D
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		jmp	short loc_B585D

loc_B585D:
		push	1

loc_B585F:
		push	si
		push	cs
		call	near ptr GaugeWidget_GetNthListItem_B52F9
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_B5833

loc_B586D:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+28h]
		add	sp, 0Ah

loc_B5888:
		pop	di
		pop	si
		leave
		retf
GaugeWidget_RebuildListFromRange_B57DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_UpdateWithLock_A3405 (sub_A3405 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, encadré par
; PaletteScreen_AcquireOwnership_A1240/ReleaseOwnership_A125D (seg442, via
; sub_6C7B7/sub_6C7BC) — met à jour un champ sous verrou.
; ==============================================================================================
GaugeWidget_UpdateWithLock_B588C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_74AD7
		pop	cx
		mov	di, [si+1Eh]
		jmp	short loc_B58AE

loc_B58A0:
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	di, [di+2]

loc_B58AE:
		or	di, di
		jnz	short loc_B58A0
		push	si
		call	sub_74ADC
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_UpdateWithLock_B588C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_ComputeRange_A3436 (sub_A3436 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, calcul sur deux champs (rôle exact non
; détaillé).
; ==============================================================================================
GaugeWidget_ComputeRange_B58BD		proc far

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
		jz	short loc_B5913
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

loc_B5913:
		pop	di
		pop	si
		leave
		retf
GaugeWidget_ComputeRange_B58BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_ApplyTextStyle_A3490 (sub_A3490 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; applique un style de texte (TextFormat_ApplyStyleAttribute_5E2D0, seg143).
; ==============================================================================================
GaugeWidget_ApplyTextStyle_B5917		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+36h], 0
		mov	byte ptr [si+50h], 1
		mov	word ptr [si+5Dh], 0FFFFh
		xor	ax, ax
		mov	[si+61h], ax
		mov	[si+5Fh], ax
		xor	ax, ax
		mov	[si+65h], ax
		mov	[si+63h], ax
		push	word_7AF7E
		mov	ax, si
		add	ax, 38h
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		pop	si
		pop	bp
		retf
GaugeWidget_ApplyTextStyle_B5917		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 13 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidgetVariantA_ConstructAndInit_A34CA (sub_A34CA
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), construit (GaugeWidget_Construct_A2DF0), applique un style
; (GaugeWidget_ApplyTextStyle_A3490).
; ==============================================================================================
GaugeWidgetVariantA_ConstructAndInit_B5951		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_B596A
		push	73h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B59C1

loc_B596A:
		push	large 0
		push	large 0FFFFFFFFh
		push	si
		push	cs
		call	near ptr sub_B5250
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2B4Ch
		mov	word ptr [si+38h], 0
		mov	word ptr [si+3Ah], 0
		mov	byte ptr [si+45h], 0
		mov	dword ptr [si+46h], 0
		mov	byte ptr [si+4Ah], 2
		mov	byte ptr [si+4Bh], 0
		mov	dword ptr [si+4Ch], 0
		mov	dword ptr [si+51h], 0
		mov	byte ptr [si+55h], 2
		mov	byte ptr [si+56h], 0
		mov	dword ptr [si+57h], 0
		push	si
		push	cs
		call	near ptr GaugeWidget_ApplyTextStyle_B5917
		pop	cx

loc_B59C1:
		mov	ax, si
		pop	si
		pop	bp
		retf
GaugeWidgetVariantA_ConstructAndInit_B5951		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 13 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidgetVariantB_ConstructAndInit_A353F (sub_A353F
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que GaugeWidgetVariantA_ConstructAndInit_A34CA (variante de paramètres).
; ==============================================================================================
GaugeWidgetVariantB_ConstructAndInit_B59C6		proc far

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
		jnz	short loc_B59DF
		push	73h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B5A3C

loc_B59DF:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_B5250
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2B4Ch
		mov	word ptr [si+38h], 0
		mov	word ptr [si+3Ah], 0
		mov	byte ptr [si+45h], 0
		mov	dword ptr [si+46h], 0
		mov	byte ptr [si+4Ah], 2
		mov	byte ptr [si+4Bh], 0
		mov	dword ptr [si+4Ch], 0
		mov	dword ptr [si+51h], 0
		mov	byte ptr [si+55h], 2
		mov	byte ptr [si+56h], 0
		mov	dword ptr [si+57h], 0
		push	si
		push	cs
		call	near ptr GaugeWidget_ApplyTextStyle_B5917
		pop	cx

loc_B5A3C:
		mov	ax, si
		pop	si
		pop	bp
		retf
GaugeWidgetVariantB_ConstructAndInit_B59C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 13 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidgetVariantC_ConstructAndInit_A35BA (sub_A35BA
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que GaugeWidgetVariantA_ConstructAndInit_A34CA (variante de paramètres).
; ==============================================================================================
GaugeWidgetVariantC_ConstructAndInit_B5A41		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_B5A5E
		push	73h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B5AC5

loc_B5A5E:
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
		call	near ptr sub_B5250
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 2B4Ch
		mov	word ptr [si+38h], 0
		mov	word ptr [si+3Ah], 0
		mov	byte ptr [si+45h], 0
		mov	dword ptr [si+46h], 0
		mov	byte ptr [si+4Ah], 2
		mov	byte ptr [si+4Bh], 0
		mov	dword ptr [si+4Ch], 0
		mov	dword ptr [si+51h], 0
		mov	byte ptr [si+55h], 2
		mov	byte ptr [si+56h], 0
		mov	dword ptr [si+57h], 0
		push	si
		push	cs
		call	near ptr GaugeWidget_ApplyTextStyle_B5917
		pop	cx

loc_B5AC5:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidgetVariantC_ConstructAndInit_B5A41		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_ComputeLayoutB_A3644 (sub_A3644 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 68 lignes, NON DÉTAILLÉE — calcul de
; layout (manipulation de champs internes, pas d'appel externe).
; ==============================================================================================
GaugeWidget_ComputeLayoutB_B5ACB		proc far

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
		mov	bx, word_7AF7E
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
GaugeWidget_ComputeLayoutB_B5ACB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 20 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_RebuildAndRelease_A36BD (sub_A36BD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 91 lignes, NON DÉTAILLÉE — combine sub_A3A86, sub_A3B93, Memory_TypedFree_5C7B6 (×2),
; TextFormat_ReleaseStyleList_5E526, GaugeWidget_Destruct_A2E39, sub_338.
; ==============================================================================================
GaugeWidget_RebuildAndRelease_B5B44		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_B5B56
		jmp	loc_B5C00

loc_B5B56:
		mov	word ptr [si+0Eh], 2B4Ch
		push	si
		nop
		push	cs
		call	near ptr sub_B5F14
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr sub_B6021
		pop	cx
		cmp	byte ptr [si+56h], 0
		jz	short loc_B5B8F
		cmp	dword ptr [si+51h], 0
		jz	short loc_B5B8F
		push	0
		mov	al, [si+55h]
		push	ax
		mov	ax, si
		add	ax, 51h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_B5B8F

loc_B5B8F:
		mov	dword ptr [si+51h], 0
		mov	byte ptr [si+56h], 0
		mov	dword ptr [si+57h], 0
		cmp	byte ptr [si+4Bh], 0
		jz	short loc_B5BC9
		cmp	dword ptr [si+46h], 0
		jz	short loc_B5BC9
		push	0
		mov	al, [si+4Ah]
		push	ax
		mov	ax, si
		add	ax, 46h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_B5BC9

loc_B5BC9:
		mov	dword ptr [si+46h], 0
		mov	byte ptr [si+4Bh], 0
		mov	dword ptr [si+4Ch], 0
		mov	ax, si
		add	ax, 38h
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	0
		push	si
		push	cs
		call	near ptr GaugeWidget_Destruct_B529D
		add	sp, 4
		test	di, 1
		jz	short loc_B5C00
		push	si
		call	sub_3B2
		pop	cx

loc_B5C00:
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_RebuildAndRelease_B5B44		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_MeasureAndDraw_A377D (sub_A377D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; encadré par le verrou d'ownership (seg442), combine Rect_ComputeIntersection_60F02 (seg164),
; sub_A3A40, Memory_TypedAllocDispatchB_5C832, Shape_DrawSpans_61F52 (seg174).
; ==============================================================================================
GaugeWidget_MeasureAndDraw_B5C04		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_74AD7
		pop	cx
		cmp	word ptr [si+5Dh], 0FFFFh
		jz	short loc_B5C34
		mov	al, [si+5Dh]
		push	ax
		push	word ptr [si+0Ah]
		push	word ptr [si+8]
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch

loc_B5C34:
		cmp	word ptr [si+5Fh], 0
		jz	short loc_B5C41
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_DrawFrameConditional_B5ECE
		pop	cx

loc_B5C41:
		cmp	dword ptr [si+51h], 0
		jz	short loc_B5C4D
		mov	ax, 1
		jmp	short loc_B5C4F

loc_B5C4D:
		xor	ax, ax

loc_B5C4F:
		or	ax, ax
		jz	short loc_B5C7F
		push	word ptr [si+5Bh]
		push	0
		mov	al, [si+55h]
		push	ax
		push	large [si+51h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch

loc_B5C7F:
		push	si
		call	sub_74ADC
		pop	cx
		pop	si
		pop	bp
		retf
GaugeWidget_MeasureAndDraw_B5C04		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_HelperG_A3802 (sub_A3802 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperG_B5C89		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jz	short loc_B5C9E
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+34h]
		pop	cx

loc_B5C9E:
		pop	si
		pop	bp
		retf
GaugeWidget_HelperG_B5C89		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_HelperH_A381A (sub_A381A de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; StreamReader_ValidateState_63DB5 (seg190, via sub_6C75D).
; ==============================================================================================
GaugeWidget_HelperH_B5CA1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, 0FFFEh
		jnz	short loc_B5CC5
		push	large 290042h
		push	51h
		call	sub_74A7D
		add	sp, 6
		mov	[si+5Dh], ax
		jmp	short loc_B5CC8

loc_B5CC5:
		mov	[si+5Dh], dx

loc_B5CC8:
		pop	si
		pop	bp
		retf
GaugeWidget_HelperH_B5CA1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_HelperI_A3844 (sub_A3844 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (rôle exact non détaillé,
; 39 lignes).
; ==============================================================================================
GaugeWidget_HelperI_B5CCB		proc far

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
		jz	short loc_B5D02
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

loc_B5D02:
		pop	si
		leave
		retf
GaugeWidget_HelperI_B5CCB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_DrawFrame_A387E (sub_A387E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 114 lignes, NON DÉTAILLÉE — dessine le
; cadre du widget : Render_DrawHorizontalLineClipped_61B8E, Render_FillClippedRect_61960 (×4),
; Rect_ComputeIntersection_60F02, encadré par le verrou d'ownership (seg442).
; ==============================================================================================
GaugeWidget_DrawFrame_B5D05		proc far

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
		call	sub_74AD7
		pop	cx
		cmp	[bp+arg_C], 0
		jz	short loc_B5D44
		mov	al, byte ptr word_79218
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_7AF7E
		call	sub_6A150
		add	sp, 0Ch
		inc	di
		inc	[bp+arg_4]
		dec	[bp+arg_6]
		dec	[bp+arg_8]

loc_B5D44:
		mov	[bp+var_2], 0
		jmp	short loc_B5DC4

loc_B5D4B:
		mov	al, byte ptr word_7921C
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, [bp+arg_4]
		inc	ax
		push	ax
		push	[bp+arg_6]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr word_7921C
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_8]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr word_79222
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr word_79222
		push	ax
		mov	ax, [bp+arg_8]
		dec	ax
		push	ax
		push	di
		push	[bp+arg_4]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		inc	di
		inc	[bp+arg_4]
		dec	[bp+arg_6]
		dec	[bp+arg_8]
		inc	[bp+var_2]

loc_B5DC4:
		mov	ax, [bp+var_2]
		cmp	ax, [bp+arg_A]
		jge	short loc_B5DCF
		jmp	loc_B5D4B

loc_B5DCF:
		mov	al, byte ptr word_79220
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		push	si
		call	sub_74ADC
		pop	cx
		pop	di
		pop	si
		leave
		retf
GaugeWidget_DrawFrame_B5D05		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_DrawFrameWrapper_A396D (sub_A396D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, enveloppe appelant
; GaugeWidget_DrawFrame_A387E.
; ==============================================================================================
GaugeWidget_DrawFrameWrapper_B5DF4		proc far

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
		call	near ptr GaugeWidget_DrawFrame_B5D05
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
GaugeWidget_DrawFrameWrapper_B5DF4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_ApplyUnderLock_A3991 (sub_A3991 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; encadré par le verrou d'ownership, appelle sub_6C79E (stub voisin).
; ==============================================================================================
GaugeWidget_ApplyUnderLock_B5E18		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_74AD7
		pop	cx
		push	word ptr [si+5Dh]
		push	[bp+arg_2]
		call	sub_74ABE
		add	sp, 4
		push	si
		call	sub_74ADC
		pop	cx
		pop	si
		pop	bp
		retf
GaugeWidget_ApplyUnderLock_B5E18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_QueryRenderState_A39B7 (sub_A39B7 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle GaugeWidget_RenderModeDispatch_A3EA5.
; ==============================================================================================
GaugeWidget_QueryRenderState_B5E3E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+36h], 1
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_RenderModeDispatch_B633E
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
GaugeWidget_QueryRenderState_B5E3E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B5E63		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_74AD7
		pop	cx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+4]
		pop	cx
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_RenderModeDispatch_B6549
		pop	cx
		mov	word ptr [si+36h], 0
		pop	si
		pop	bp
		retf
sub_B5E63		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_AllocateRenderBuffer_A39FA (sub_A39FA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue un tampon de rendu (sub_658).
; ==============================================================================================
GaugeWidget_AllocateRenderBuffer_B5E88		proc far

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
		cmp	word ptr [si+5Fh], 0
		jnz	short loc_B5EC1
		mov	[si+5Fh], di
		jmp	short loc_B5EC7

loc_B5EC1:
		mov	bx, [si+61h]
		mov	[bx+8], di

loc_B5EC7:
		mov	[si+61h], di
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateRenderBuffer_B5E88		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_DrawFrameConditional_A3A40 (sub_A3A40 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle GaugeWidget_DrawFrame_A387E.
; ==============================================================================================
GaugeWidget_DrawFrameConditional_B5ECE		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+5Fh]
		jmp	short loc_B5F0C

loc_B5EDE:
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
		call	near ptr GaugeWidget_DrawFrame_B5D05
		add	sp, 0Eh
		mov	di, [di+8]

loc_B5F0C:
		or	di, di
		jnz	short loc_B5EDE
		pop	di
		pop	si
		leave
		retf
GaugeWidget_DrawFrameConditional_B5ECE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B5F14		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+5Fh]
		jmp	short loc_B5F33

loc_B5F24:
		mov	[bp+var_2], di
		mov	di, [di+8]
		push	[bp+var_2]
		call	sub_3B2
		pop	cx

loc_B5F33:
		or	di, di
		jnz	short loc_B5F24
		xor	ax, ax
		mov	[si+61h], ax
		mov	[si+5Fh], ax
		pop	di
		pop	si
		leave
		retf
sub_B5F14		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; GaugeWidget_AllocateRenderBufferWrapper_E0B7 (sub_E0B7 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à GaugeWidget_AllocateRenderBufferWrapper_A3AB5
; (sub_A3AB5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, appelle GaugeWidget_AllocateRenderBuffer_A39FA.
; ==============================================================================================
GaugeWidget_AllocateRenderBufferWrapper_B5F43		proc far

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
		call	near ptr GaugeWidget_AllocateRenderBuffer_B5E88
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateRenderBufferWrapper_B5F43		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_AllocateExtra_A3ADD (sub_A3ADD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 61 lignes, NON DÉTAILLÉE — alloue (sub_658) des données supplémentaires pour le widget.
; ==============================================================================================
GaugeWidget_AllocateExtra_B5F6B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+63h]
		jmp	short loc_B5F82

loc_B5F78:
		mov	ax, [di]
		cmp	ax, [bp+arg_2]
		jz	short loc_B5F86
		mov	di, [di+4]

loc_B5F82:
		or	di, di
		jnz	short loc_B5F78

loc_B5F86:
		or	di, di
		jnz	short loc_B5FAD
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		mov	word ptr [di+4], 0
		cmp	word ptr [si+63h], 0
		jnz	short loc_B5FA4
		mov	[si+63h], di
		jmp	short loc_B5FAA

loc_B5FA4:
		mov	bx, [si+65h]
		mov	[bx+4], di

loc_B5FAA:
		mov	[si+65h], di

loc_B5FAD:
		or	di, di
		jz	short loc_B5FBC
		mov	ax, [bp+arg_2]
		mov	[di], ax
		mov	ax, [bp+arg_4]
		mov	[di+2], ax

loc_B5FBC:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_AllocateExtra_B5F6B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_ReleaseExtra_A3B34 (sub_A3B34 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 62 lignes, NON DÉTAILLÉE — libère (sub_338) les données supplémentaires du widget.
; ==============================================================================================
GaugeWidget_ReleaseExtra_B5FC2		proc far

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
		mov	di, [si+63h]
		jmp	short loc_B6019

loc_B5FD7:
		mov	ax, [di+2]
		cmp	ax, [bp+arg_2]
		jnz	short loc_B6013
		mov	ax, [di+4]
		mov	[bp+var_4], ax
		cmp	[bp+var_2], 0
		jz	short loc_B5FF1
		mov	bx, [bp+var_2]
		mov	[bx+4], ax

loc_B5FF1:
		cmp	[si+65h], di
		jnz	short loc_B5FFC
		mov	ax, [bp+var_2]
		mov	[si+65h], ax

loc_B5FFC:
		cmp	[si+63h], di
		jnz	short loc_B6007
		mov	ax, [di+4]
		mov	[si+63h], ax

loc_B6007:
		push	di
		call	sub_3B2
		pop	cx
		mov	di, [bp+var_4]
		jmp	short loc_B6019

loc_B6013:
		mov	[bp+var_2], di
		mov	di, [di+4]

loc_B6019:
		or	di, di
		jnz	short loc_B5FD7
		pop	di
		pop	si
		leave
		retf
GaugeWidget_ReleaseExtra_B5FC2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6021		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+63h]
		jmp	short loc_B6040

loc_B6031:
		mov	[bp+var_2], di
		mov	di, [di+4]
		push	[bp+var_2]
		call	sub_3B2
		pop	cx

loc_B6040:
		or	di, di
		jnz	short loc_B6031
		xor	ax, ax
		mov	[si+65h], ax
		mov	[si+63h], ax
		pop	di
		pop	si
		leave
		retf
sub_B6021		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_HelperJ_A3BC2 (sub_A3BC2 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible (rôle exact non détaillé).
; ==============================================================================================
GaugeWidget_HelperJ_B6050		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	si, [si+63h]
		jmp	short loc_B606B

loc_B605C:
		mov	ax, [si]
		cmp	ax, [bp+arg_2]
		jnz	short loc_B6068
		mov	ax, [si+2]
		jmp	short loc_B6071

loc_B6068:
		mov	si, [si+4]

loc_B606B:
		or	si, si
		jnz	short loc_B605C
		xor	ax, ax

loc_B6071:
		pop	si
		pop	bp
		retf
GaugeWidget_HelperJ_B6050		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6074		proc far

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
		jz	short loc_B60A0
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_InsertListNode_B55AC
		add	sp, 4
		cmp	[bp+arg_4], 0
		jz	short loc_B60A9
		push	di
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr GaugeWidget_AllocateExtra_B5F6B
		add	sp, 6
		jmp	short loc_B60A9

loc_B60A0:
		push	0E002h
		call	sub_1DDFE
		pop	cx

loc_B60A9:
		pop	di
		pop	si
		pop	bp
		retf
sub_B6074		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_UpdateWithLockWrapper_A3C14 (sub_A3C14 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; GaugeWidget_UpdateWithLock_A3405.
; ==============================================================================================
GaugeWidget_UpdateWithLockWrapper_B60AD		proc far

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
		call	near ptr GaugeWidget_UpdateWithLock_B588C
		pop	cx
		pop	si
		pop	bp
		retf
GaugeWidget_UpdateWithLockWrapper_B60AD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_QueryAndFormat_E256 (sub_E256 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à GaugeWidget_QueryAndFormat_A3C2C (sub_A3C2C de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Joystick_LoadCalibrationSample-like accessor (sub_66DA3, seg163) et
; GaugeWidget_FormatDisplayValue_A3CF6.
; ==============================================================================================
GaugeWidget_QueryAndFormat_B60C5		proc far

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

loc_B60D4:
		push	0FFh
		push	66DFh
		call	sub_6EF5A
		add	sp, 4
		cmp	byte_7CE0F, 0
		jnz	short loc_B60D4
		push	[bp+arg_2]
		push	0FFFFh
		push	si
		nop
		push	cs
		call	near ptr GaugeWidget_FormatDisplayValue_B618F
		add	sp, 6
		mov	[bp+var_2], ax
		push	word ptr [si+6Dh]
		push	word ptr [si+6Bh]
		mov	ax, [si+69h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+67h]
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
GaugeWidget_QueryAndFormat_B60C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_RebuildDisplay_A3C85 (sub_A3C85 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine GaugeWidget_HelperJ_A3BC2 et
; GaugeWidget_RebuildListFromRange_A3354.
; ==============================================================================================
GaugeWidget_RebuildDisplay_B611E		proc far

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
		call	near ptr GaugeWidget_HelperJ_B6050
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_B6171
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
		jmp	short loc_B6188

loc_B6171:
		cmp	[bp+arg_6], 0
		jz	short loc_B618B
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr GaugeWidget_RebuildListFromRange_B57DB

loc_B6188:
		add	sp, 0Ah

loc_B618B:
		pop	di
		pop	si
		leave
		retf
GaugeWidget_RebuildDisplay_B611E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 23 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_FormatDisplayValue_A3CF6 (sub_A3CF6 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 227 lignes, NON DÉTAILLÉE — combine le verrou d'ownership (seg442),
; TextScroll_FormatAndApply_67204 (seg204), sub_28A63/sub_288A6 (externes),
; GaugeWidget_HelperJ_A3BC2 — formatage/affichage de la valeur du widget jauge. Candidat pour
; session dédiée.
; ==============================================================================================
GaugeWidget_FormatDisplayValue_B618F		proc far

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
		xor	di, di
		mov	word ptr [si+6Dh], 0
		mov	word ptr [si+6Bh], 0
		mov	[bp+var_2], 0
		push	si
		call	sub_74ADC
		pop	cx
		jmp	loc_B632B

loc_B61B5:
		push	66D8h
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte_7CE08, 0
		jnz	short loc_B61E4
		push	66D8h
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B61E4
		push	66DFh
		push	66D8h
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_B61E4

loc_B61E4:
		mov	al, byte_7CE08
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B61F0
		jmp	loc_B6296

loc_B61F0:
		mov	ax, [si+69h]
		mov	[bp+var_4], ax
		mov	ax, word_7CE0A
		sar	ax, 1
		mov	[si+67h], ax
		mov	ax, word_7CE0C
		mov	[si+69h], ax
		mov	ax, [si+69h]
		sub	[bp+var_4], ax
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_B621A
		cmp	[bp+var_4], 0
		jz	short loc_B6284

loc_B621A:
		mov	ax, [si+69h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+67h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+20h]
		add	sp, 6
		mov	[bp+var_6], ax
		cmp	ax, [bp+var_2]
		jz	short loc_B623F
		mov	ax, 1
		jmp	short loc_B6241

loc_B623F:
		xor	ax, ax

loc_B6241:
		mov	[bp+var_8], ax
		cmp	[bp+var_2], 0
		jz	short loc_B625D
		cmp	[bp+var_8], 0
		jz	short loc_B625D
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+14h]
		pop	cx

loc_B625D:
		cmp	[bp+var_6], 0
		jz	short loc_B627E
		push	[bp+var_8]
		mov	ax, [si+69h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+67h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+10h]
		add	sp, 8

loc_B627E:
		mov	ax, [bp+var_6]
		mov	[bp+var_2], ax

loc_B6284:
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_B6296
		mov	al, byte_7CE09
		mov	ah, 0
		mov	[si+6Bh], ax

loc_B6296:
		mov	al, byte_7CE0F
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_B62F0
		mov	ax, 0C00h
		int	21h
		mov	word ptr [si+6Bh], 0
		mov	al, byte_7CE10
		mov	ah, 0
		mov	dx, word_791F4
		shl	dx, 8
		or	dx, ax
		mov	[si+6Dh], dx
		push	word ptr [si+6Dh]
		push	si
		push	cs
		call	near ptr GaugeWidget_HelperJ_B6050
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_B62F0
		mov	ax, [si+69h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+67h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	di, ax
		or	di, di
		jnz	short loc_B62F0
		cmp	[bp+arg_4], 0
		jnz	short loc_B6338

loc_B62F0:
		or	di, di
		jnz	short loc_B6322
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_B6322
		mov	ax, [si+69h]
		sub	ax, [si+6]
		push	ax
		mov	ax, [si+67h]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	di, ax
		or	di, di
		jnz	short loc_B6322
		cmp	[bp+arg_4], 0
		jnz	short loc_B6338

loc_B6322:
		cmp	[bp+arg_2], 0FFFFh
		jz	short loc_B632B
		dec	[bp+arg_2]

loc_B632B:
		or	di, di
		jnz	short loc_B6338
		cmp	[bp+arg_2], 0
		jz	short loc_B6338
		jmp	loc_B61B5

loc_B6338:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
GaugeWidget_FormatDisplayValue_B618F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 46 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_RenderModeDispatch_A3EA5 (sub_A3EA5 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 251 lignes, NON DÉTAILLÉE — dispatch de rendu selon le mode :
; Memory_TypedAllocDispatchC_5C86D (×2), Memory_TypedFreeWrapperC_5C6F3 (×2),
; Memory_TypedAllocDispatchB_5C832 (×3), Render_BlitClippedRegionVariant_62D36 (seg181),
; encadré par le verrou d'ownership. Candidat pour session dédiée.
; ==============================================================================================
GaugeWidget_RenderModeDispatch_B633E		proc far

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
		call	sub_74AD7
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
		mov	[si+3Ch], ax
		mov	ax, [bp+var_4]
		mov	[si+3Eh], ax
		mov	ax, [bp+var_6]
		mov	[si+40h], ax
		mov	ax, [bp+var_8]
		mov	[si+42h], ax
		mov	ax, [si+40h]
		sub	ax, [si+3Ch]
		inc	ax
		mov	dx, [si+42h]
		sub	dx, [si+3Eh]
		inc	dx
		imul	dx
		mov	di, ax
		push	0
		push	2
		push	6B04h
		call	Memory_TypedAllocDispatchC_6538A
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_C], eax
		push	0
		push	3
		push	6B04h
		call	Memory_TypedAllocDispatchC_6538A
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_10], eax
		cmp	byte ptr [si+50h], 3
		jnz	short loc_B63D4
		movzx	eax, di
		cmp	eax, [bp+var_C]
		jle	short loc_B63D4
		mov	byte ptr [si+50h], 2

loc_B63D4:
		cmp	byte ptr [si+50h], 4
		jnz	short loc_B63E8
		movzx	eax, di
		cmp	eax, [bp+var_10]
		jle	short loc_B63E8
		mov	byte ptr [si+50h], 2

loc_B63E8:
		cmp	byte ptr [si+50h], 1
		jnz	short loc_B6402
		movzx	eax, di
		cmp	eax, [bp+var_10]
		jle	short loc_B63FE
		mov	byte ptr [si+50h], 2
		jmp	short loc_B6402

loc_B63FE:
		mov	byte ptr [si+50h], 4

loc_B6402:
		mov	al, [si+50h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_B6411
		jmp	loc_B6534

loc_B6411:
		shl	bx, 1
		jmp	cs:off_B653F[bx]	; switch jump

loc_B6418:
		movzx	eax, di
		mov	[bp+var_14], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_18+2], dx
		mov	word ptr [bp+var_18], ax
		mov	eax, [bp+var_18]
		mov	[si+46h], eax
		mov	byte ptr [si+4Ah], 2
		mov	byte ptr [si+4Bh], 1
		mov	dword ptr [si+4Ch], 0
		mov	eax, [bp+var_14]
		mov	[si+4Ch], eax
		push	0
		mov	al, [si+4Ah]
		push	ax
		push	large [si+46h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_B6475
		jmp	loc_B651C

loc_B6475:
		mov	ax, si
		add	ax, 38h
		jz	short loc_B647F
		jmp	loc_B6511

loc_B647F:
		mov	ax, si
		add	ax, 38h

loc_B6484:
		push	ax
		push	0
		mov	al, [si+4Ah]
		push	ax
		push	large [si+46h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6AEF8
		add	sp, 8
		jmp	loc_B6534
		jmp	short loc_B651C

loc_B64AD:
		movzx	eax, di
		mov	[bp+var_1C], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_20+2], dx
		mov	word ptr [bp+var_20], ax
		mov	eax, [bp+var_20]
		mov	[si+46h], eax
		mov	byte ptr [si+4Ah], 3
		mov	byte ptr [si+4Bh], 1
		mov	dword ptr [si+4Ch], 0
		mov	eax, [bp+var_1C]
		mov	[si+4Ch], eax
		push	0
		mov	al, [si+4Ah]
		push	ax
		push	large [si+46h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_B651C
		mov	ax, si
		add	ax, 38h
		jnz	short loc_B6511
		jmp	loc_B647F

loc_B6511:
		mov	ax, si
		add	ax, 3Ch
		jmp	loc_B6484
		jmp	loc_B647F

loc_B651C:
		mov	byte ptr [si+50h], 0
		jmp	short loc_B6534

loc_B6522:
		push	si
		push	2B34h
		mov	ax, si
		add	ax, 38h
		push	ax
		call	sub_74A20
		add	sp, 6

loc_B6534:
		push	si
		call	sub_74ADC
		pop	cx
		pop	di
		pop	si
		leave
		retf
GaugeWidget_RenderModeDispatch_B633E		endp

; START OF FUNCTION CHUNK FOR GaugeWidget_RenderModeDispatch_B633E
off_B653F	dw offset loc_B6534
		dw offset loc_B6534
		dw offset loc_B6522
		dw offset loc_B6418
		dw offset loc_B64AD
; END OF FUNCTION CHUNK FOR GaugeWidget_RenderModeDispatch_B633E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 30 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_RenderModeDispatch_A40B0 (sub_A40B0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 167 lignes, NON DÉTAILLÉE — switch à 5 cas de rendu (tag mémoire 5C44h) combinant
; Memory_TypedAllocDispatchB_5C832 (×3), Render_BlitClippedRegion_6271A (seg178, ×2),
; Memory_TypedFree_5C7B6, Rect_FillRegion_60F94 (seg165), encadré par le verrou d'ownership —
; probable jauge/indicateur graphique multi-mode (aiguille, barre, digital...). Candidat
; prioritaire pour session dédiée.
; ==============================================================================================
GaugeWidget_RenderModeDispatch_B6549		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_74AD7
		pop	cx
		mov	al, [si+50h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_B6569
		jmp	loc_B666D

loc_B6569:
		shl	bx, 1
		jmp	cs:off_B6689[bx]	; switch jump

loc_B6570:
		push	0
		mov	al, [si+4Ah]
		push	ax
		push	large [si+46h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_B658C
		jmp	loc_B667F

loc_B658C:
		mov	ax, si
		add	ax, 38h
		jz	short loc_B659A
		mov	ax, si
		add	ax, 3Ch
		jmp	short loc_B659F

loc_B659A:
		mov	ax, si
		add	ax, 38h

loc_B659F:
		push	ax
		push	0
		mov	al, [si+4Ah]
		push	ax
		push	large [si+46h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6ACDA
		add	sp, 8
		cmp	byte ptr [si+4Bh], 0
		jz	short loc_B65D2
		cmp	dword ptr [si+46h], 0
		jz	short loc_B65D2
		jmp	short loc_B663C

loc_B65D2:
		mov	dword ptr [si+46h], 0
		mov	byte ptr [si+4Bh], 0
		mov	dword ptr [si+4Ch], 0
		jmp	loc_B667F

loc_B65E9:
		push	0
		mov	al, [si+4Ah]
		push	ax
		push	large [si+46h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_B667F
		mov	ax, si
		add	ax, 38h
		jz	short loc_B6619
		mov	ax, si
		add	ax, 3Ch
		jmp	short loc_B661E

loc_B6619:
		mov	ax, si
		add	ax, 38h

loc_B661E:
		push	ax
		push	large [bp+var_4]
		push	word_7AF7E
		call	sub_6ACDA
		add	sp, 8
		cmp	byte ptr [si+4Bh], 0
		jz	short loc_B65D2
		cmp	dword ptr [si+46h], 0
		jz	short loc_B65D2

loc_B663C:
		push	0
		mov	al, [si+4Ah]
		push	ax
		mov	ax, si
		add	ax, 46h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	loc_B65D2
		jmp	loc_B65D2

loc_B6659:
		push	si
		push	2B40h
		mov	ax, si
		add	ax, 38h
		push	ax
		call	sub_74A25
		add	sp, 6
		jmp	short loc_B667F

loc_B666D:
		mov	al, [si+5Dh]
		push	ax
		mov	ax, si
		add	ax, 38h
		push	ax
		call	sub_697BA
		add	sp, 4

loc_B667F:
		push	si
		call	sub_74ADC
		pop	cx
		pop	si
		leave
		retf
GaugeWidget_RenderModeDispatch_B6549		endp

; START OF FUNCTION CHUNK FOR GaugeWidget_RenderModeDispatch_B6549
off_B6689	dw offset loc_B667F
		dw offset loc_B666D
		dw offset loc_B6659
		dw offset loc_B6570
		dw offset loc_B65E9
; END OF FUNCTION CHUNK FOR GaugeWidget_RenderModeDispatch_B6549

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GaugeWidget_ReleaseExtraAndNode_A41FA (sub_A41FA de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine GaugeWidget_ReleaseExtra_A3B34 et
; GaugeWidget_RemoveListNode_A30BF.
; ==============================================================================================
GaugeWidget_ReleaseExtraAndNode_B6693		proc far

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
		call	near ptr GaugeWidget_ReleaseExtra_B5FC2
		add	sp, 4
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_RemoveListNode_B553C
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_ReleaseExtraAndNode_B6693		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GaugeWidget_UpdateAndReleaseUnderLock_A421B (sub_A421B
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; encadré par le verrou d'ownership, appelle sub_6C79E (stub voisin) et
; GaugeWidget_ReleaseExtraAndNode_A41FA.
; ==============================================================================================
GaugeWidget_UpdateAndReleaseUnderLock_B66B4		proc far

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
		jz	short loc_B66DF
		push	si
		call	sub_74AD7
		pop	cx
		push	word ptr [si+5Dh]
		push	di
		call	sub_74ABE
		add	sp, 4
		push	si
		call	sub_74ADC
		pop	cx

loc_B66DF:
		push	di
		push	si
		push	cs
		call	near ptr GaugeWidget_ReleaseExtraAndNode_B6693
		add	sp, 4
		or	di, di
		jz	short loc_B66FA
		push	3
		push	di
		mov	bx, [di+0Eh]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short loc_B66FA

loc_B66FA:
		pop	di
		pop	si
		pop	bp
		retf
GaugeWidget_UpdateAndReleaseUnderLock_B66B4		endp
ovr330		ends
