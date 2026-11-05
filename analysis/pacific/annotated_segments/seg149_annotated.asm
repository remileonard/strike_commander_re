seg149		segment	para public 'CODE' use16
		assume cs:seg149
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedFreeVariant_2B731 (sub_2B731 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Memory_TypedFreeVariant_5C643 (sub_5C643 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable
; ([bx+0x20]/[bx+0x24]) avec gestion d'erreur (sub_6B70F ×2). Référencée directement par
; TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
Memory_TypedFreeVariant_65161		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		pop	cx
		mov	ah, 0
		mov	di, ax
		mov	bx, di
		shl	bx, 1
		cmp	word ptr [bx+6AF8h], 0
		jz	short loc_6519D
		or	si, si
		jz	short loc_65192
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_65192

loc_65192:
		xor	si, si
		push	400h
		call	sub_1DDFE
		pop	cx

loc_6519D:
		or	si, si
		jnz	short loc_651AA
		push	401h
		call	sub_1DDFE
		pop	cx

loc_651AA:
		mov	bx, di
		shl	bx, 1
		mov	[bx+6AF8h], si
		pop	di
		pop	si
		pop	bp
		retf
Memory_TypedFreeVariant_65161		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_651B6		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_2]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_654C3
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		cmp	word ptr [bx+6AF8h], 0
		jz	short loc_651FE
		push	3
		mov	al, [bp+arg_2]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+6AF8h]
		mov	al, [bp+arg_2]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+6AF8h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_651FE

loc_651FE:
		mov	al, [bp+arg_2]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	word ptr [bx+6AF8h], 0
		pop	bp
		retf
sub_651B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedFreeWrapper_2B7E1 (sub_2B7E1 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Memory_TypedFreeWrapper_5C6F3 (sub_5C6F3 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Memory_ValidateAllocatorIndex_5C9A6 et TextObjectCluster_DestructVariantA_5C42C (seg130).
; Référencée par sub_A8AC.
; ==============================================================================================
Memory_TypedFreeWrapper_6520F		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_654C3
		add	sp, 4
		mov	al, [bp+arg_A]
		push	ax
		mov	al, [bp+arg_8]
		push	ax
		push	large [bp+arg_2]
		mov	al, [bp+arg_6]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+6AF8h]
		call	sub_64EB1
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
Memory_TypedFreeWrapper_6520F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedFreeWrapperB_2B862 (sub_2B862 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Memory_TypedFreeWrapperB_5C774 (sub_5C774 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Memory_ValidateAllocatorIndex_5C9A6 et TextObjectCluster_DestructVariantC_5C508 (seg130).
; Référencée par sub_2AD9C.
; ==============================================================================================
Memory_TypedFreeWrapperB_6524E		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= byte ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_654C3
		add	sp, 4
		push	[bp+arg_C]
		mov	al, [bp+arg_A]
		push	ax
		mov	al, [bp+arg_8]
		push	ax
		push	large [bp+arg_2]
		mov	al, [bp+arg_6]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+6AF8h]
		call	sub_64F52
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
Memory_TypedFreeWrapperB_6524E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedFreeWrapperB_2B862 (sub_2B862 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Memory_TypedFreeWrapperB_5C774 (sub_5C774 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Memory_ValidateAllocatorIndex_5C9A6 et TextObjectCluster_DestructVariantC_5C508 (seg130).
; Référencée par sub_2AD9C.
; ==============================================================================================
Memory_TypedFreeWrapperB_65290		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= byte ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_654C3
		add	sp, 4
		push	[bp+arg_C]
		mov	al, [bp+arg_A]
		push	ax
		mov	al, [bp+arg_8]
		push	ax
		push	large [bp+arg_2]
		mov	al, [bp+arg_6]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+6AF8h]
		call	sub_64FF3
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
Memory_TypedFreeWrapperB_65290		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedFree_2B8A4 (sub_2B8A4 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Memory_TypedFree_5C7B6 (sub_5C7B6 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far, désallocateur typé central
; utilisé dans des dizaines de segments à travers toute la base ("operator delete" générique)
; : valide l'index d'allocateur (via une variante inline de Memory_ValidateAllocatorIndex),
; sélectionne l'objet allocateur dans une table indexée par tag (cs:5C38h) et dispatche vers
; sa méthode de libération virtuelle (dword ptr [bx+8]). CONFIRMÉ par les chaînes de debug du
; seg339 : la classe s'appelle littéralement « MemoryManager » (« Illegal re-instantiation of
; MemoryManger », « handler %d attached with %ld bytes available », « Current state of EMS
; heap »/« Current state of heap » avec un rapport par bloc alloué/libre) — les 7 allocateurs
; de la table sont bien des « handlers » enregistrés, cohérent avec le système EMS/mémoire
; paginée (seg127).
; ==============================================================================================
Memory_TypedFree_652D2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_4]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_654C3
		add	sp, 4
		push	[bp+arg_2]
		mov	al, [bp+arg_4]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+6AF8h]
		mov	al, [bp+arg_4]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+6AF8h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		pop	bp
		retf
Memory_TypedFree_652D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedAllocDispatch_2B8DE (sub_2B8DE de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Memory_TypedAllocDispatch_5C7F0 (sub_5C7F0 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Memory_ValidateAllocatorIndex_5C9A6 et dispatch vtable [bx+0Ch]. Référencée par sub_96917.
; ==============================================================================================
Memory_TypedAllocDispatch_6530C		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h
arg_E		= byte ptr  14h

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_E]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_654C3
		add	sp, 4
		push	large [bp+arg_A]
		push	large [bp+arg_6]
		push	large [bp+arg_2]
		mov	al, [bp+arg_E]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+6AF8h]
		mov	al, [bp+arg_E]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+6AF8h]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 0Eh
		pop	bp
		retf
Memory_TypedAllocDispatch_6530C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedAllocDispatchB_2B920 (sub_2B920 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Memory_TypedAllocDispatchB_5C832 (sub_5C832 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Memory_ValidateAllocatorIndex_5C9A6 et dispatch vtable [bx+10h]. Référencée par sub_1450B.
; ==============================================================================================
Memory_TypedAllocDispatchB_6534F		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_654C3
		add	sp, 4
		push	large [bp+arg_2]
		mov	al, [bp+arg_6]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+6AF8h]
		mov	al, [bp+arg_6]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+6AF8h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 6
		pop	bp
		retf
Memory_TypedAllocDispatchB_6534F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedAllocDispatchC_2B95B (sub_2B95B de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Memory_TypedAllocDispatchC_5C86D (sub_5C86D de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Memory_ValidateAllocatorIndex_5C9A6 et dispatch vtable [bx+14h]. Référencée directement par
; PagedMemory_ReadTextResource... (sub_509EE, seg113, UIScreen_RenderGraphVGA).
; ==============================================================================================
Memory_TypedAllocDispatchC_6538A		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_2]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_654C3
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+6AF8h]
		mov	al, [bp+arg_2]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+6AF8h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		pop	cx
		pop	bp
		retf
Memory_TypedAllocDispatchC_6538A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_653BF		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_2]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_654C3
		add	sp, 4
		cmp	[bp+arg_2], 3
		jz	short loc_653DC
		xor	ax, ax
		jmp	short loc_653FC

loc_653DC:
		mov	al, [bp+arg_2]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+6AF8h]
		mov	al, [bp+arg_2]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+6AF8h]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		pop	cx

loc_653FC:
		pop	bp
		retf
sub_653BF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedAllocDispatchC_2B95B (sub_2B95B de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Memory_TypedAllocDispatchC_5C86D (sub_5C86D de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; Memory_ValidateAllocatorIndex_5C9A6 et dispatch vtable [bx+14h]. Référencée directement par
; PagedMemory_ReadTextResource... (sub_509EE, seg113, UIScreen_RenderGraphVGA).
; ==============================================================================================
Memory_TypedAllocDispatchC_653FE		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_2]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_654C3
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+6AF8h]
		mov	al, [bp+arg_2]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+6AF8h]
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		pop	cx
		pop	bp
		retf
Memory_TypedAllocDispatchC_653FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedAllocDispatchE_2BA04 (sub_2BA04 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Memory_TypedAllocDispatchE_5C916 (sub_5C916 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; Memory_TypedAllocDispatchC_5C86D et sub_5E7EA ×3.
; ==============================================================================================
Memory_TypedAllocDispatchE_65433		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dl, [bp+arg_2]
		cmp	dl, 6
		jbe	short loc_6544C
		push	403h
		call	sub_1DDFE
		pop	cx
		jmp	short loc_6545F

loc_6544C:
		mov	al, dl
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		cmp	word ptr [bx+6AF8h], 0
		jz	short loc_6545F
		mov	al, 1
		jmp	short loc_65461

loc_6545F:
		mov	al, 0

loc_65461:
		pop	bp
		retf
Memory_TypedAllocDispatchE_65433		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65463		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_654B1

loc_65474:
		mov	bx, [bp+var_2]
		shl	bx, 1
		cmp	word ptr [bx+6AF8h], 0
		jz	short loc_654A0
		push	0
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	si
		push	cs
		call	near ptr Memory_TypedAllocDispatchC_6538A
		add	sp, 6
		push	dx
		push	ax
		push	[bp+var_2]
		push	464Bh
		call	sub_76570
		add	sp, 8
		jmp	short loc_654AE

loc_654A0:
		push	[bp+var_2]
		push	467Ah
		call	sub_76570
		add	sp, 4

loc_654AE:
		inc	[bp+var_2]

loc_654B1:
		cmp	[bp+var_2], 6
		jl	short loc_65474
		push	4678h
		call	sub_76570
		pop	cx
		pop	si
		leave
		retf
sub_65463		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_ValidateAllocatorIndex_2BA94 (sub_2BA94 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Memory_ValidateAllocatorIndex_5C9A6 (sub_5C9A6 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, valide qu'un
; index d'allocateur (0-6) pointe vers une entrée non nulle dans la table cs:5C38h ; sinon
; lève une erreur (sub_6B70F, codes 0x403/0x404). Fonction de garde utilisée par toute la
; famille Memory_Typed*.
; ==============================================================================================
Memory_ValidateAllocatorIndex_654C3		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dl, [bp+arg_2]
		mov	al, dl
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		cmp	word ptr [bx+6AF8h], 0
		jnz	short loc_654E0
		push	404h
		jmp	short loc_654E8

loc_654E0:
		cmp	dl, 6
		jbe	short loc_654EE
		push	403h

loc_654E8:
		call	sub_1DDFE
		pop	cx

loc_654EE:
		pop	bp
		retf
Memory_ValidateAllocatorIndex_654C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_AllocatorTableConstructor_5C9D3 (sub_5C9D3 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; construit la table des 7 objets allocateurs (indices 0-6) : alloue (sub_658), appelle
; sub_5CB63/sub_5F700/sub_5CD3A et construit deux instances (Memory_TypedFreeVariant_5C643 ×2,
; PagedResourceB_Construct_5C34F, seg129). Référencée via le thunk loc_5CA80 (tag 5C44h).
; ==============================================================================================
Memory_AllocatorTableConstructor_654F0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_65509
		push	1Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_65567

loc_65509:
		push	si
		call	sub_7640A
		pop	cx
		mov	word ptr [si+18h], 0
		mov	word ptr [si+1Ah], 0
		cmp	byte_7AD7A, 0
		jz	short loc_6552A
		push	468Ah
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx

loc_6552A:
		mov	byte_7AD7A, 1
		xor	ax, ax
		jmp	short loc_6553E

loc_65533:
		mov	bx, ax
		shl	bx, 1
		mov	word ptr [bx+6AF8h], 0
		inc	ax

loc_6553E:
		cmp	ax, 6
		jl	short loc_65533
		push	large 0
		call	PagedResourceC_Construct_65643
		pop	cx
		push	ax
		push	si
		push	cs
		call	near ptr Memory_TypedFreeVariant_65161
		add	sp, 6
		push	large 0
		call	sub_64DC3
		pop	cx
		push	ax
		push	si
		push	cs
		call	near ptr Memory_TypedFreeVariant_65161
		add	sp, 6

loc_65567:
		mov	ax, si
		pop	si
		pop	bp
		retf
Memory_AllocatorTableConstructor_654F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Memory_AllocatorTable_ConstructSubobject_2BB3D (sub_2BB3D de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Memory_AllocatorTable_ConstructSubobject_5CA4F
; (sub_5CA4F de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, construit/libère le sous-objet à +0x18 de la table d'allocateurs
; (sub_5EA03/sub_338), réinitialise byte_70BEA.
; ==============================================================================================
Memory_AllocatorTable_ConstructSubobject_6556C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_65599
		mov	byte_7AD7A, 0
		mov	ax, si
		add	ax, 18h
		push	ax
		call	sub_765E5
		pop	cx
		test	di, 1
		jz	short loc_65599
		push	si
		call	sub_3B2
		pop	cx

loc_65599:
		pop	di
		pop	si
		pop	bp
		retf
Memory_AllocatorTable_ConstructSubobject_6556C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6559D		proc far
		push	bp
		mov	bp, sp
		push	6B04h
		push	cs
		call	near ptr Memory_AllocatorTableConstructor_654F0
		pop	cx
		pop	bp
		retf
sub_6559D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_655AA		proc far
		push	bp
		mov	bp, sp
		push	2
sub_655AA		endp

; START OF FUNCTION CHUNK FOR sub_655AA
		db 68h
; END OF FUNCTION CHUNK FOR sub_655AA
seg149		ends
