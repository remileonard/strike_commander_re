seg070		segment	byte public 'CODE' use16
		assume cs:seg070
		;org 1
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedFreeVariant_5C643 (sub_5C643 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; dispatch vtable ([bx+0x20]/[bx+0x24]) avec gestion d'erreur (sub_6B70F ×2). Référencée
; directement par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
Memory_TypedFreeVariant_2B731	proc far		; CODE XREF: Memory_AllocatorTableConstructor_2BAC1+5Fp
					; Memory_AllocatorTableConstructor_2BAC1+71p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, [bp+arg_0]

loc_2B739:				; DATA XREF: seg170:02FEo
		mov	si, [bp+arg_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		pop	cx
		mov	ah, 0
		mov	di, ax
		mov	bx, di
		shl	bx, 1
		cmp	word ptr [bx+660Eh], 0
		jz	short loc_2B76E
		or	si, si
		jz	short loc_2B763
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		add	sp, 4
		jmp	short $+2

loc_2B763:				; CODE XREF: Memory_TypedFreeVariant_2B731+23j
		xor	si, si
		push	400h
		call	sub_30D3
		pop	cx

loc_2B76E:				; CODE XREF: Memory_TypedFreeVariant_2B731+1Fj
		or	si, si
		jnz	short loc_2B77B
		push	401h
		call	sub_30D3
		pop	cx

loc_2B77B:				; CODE XREF: Memory_TypedFreeVariant_2B731+3Fj
		mov	bx, di
		shl	bx, 1
		mov	[bx+660Eh], si
		pop	di
		pop	si
		pop	bp
		retf
Memory_TypedFreeVariant_2B731	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	al, [bp+8]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_2BA94
		add	sp, 4
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		cmp	word ptr [bx+660Eh], 0
		jz	short loc_2B7D0
		push	3
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+660Eh]
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+660Eh]
		mov	bx, [bx]
		call	dword ptr [bx+24h]
		add	sp, 4
		jmp	short $+2

loc_2B7D0:				; CODE XREF: seg070:0078j
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	word ptr [bx+660Eh], 0
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedFreeWrapper_5C6F3 (sub_5C6F3 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_ValidateAllocatorIndex_5C9A6 et TextObjectCluster_DestructVariantA_5C42C
; (seg130). Référencée par sub_A8AC.
; ==============================================================================================
Memory_TypedFreeWrapper_2B7E1	proc far		; CODE XREF: sub_449C+1E7P
					; sub_449C+299P ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8
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
		call	near ptr Memory_ValidateAllocatorIndex_2BA94
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
		push	word ptr [bx+660Eh]
		call	TextObjectCluster_DestructVariantA_2B51A
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
Memory_TypedFreeWrapper_2B7E1	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+6]
		mov	al, [bp+0Ch]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_2BA94
		add	sp, 4
		push	word ptr [bp+12h]
		mov	al, [bp+10h]
		push	ax
		mov	al, [bp+0Eh]
		push	ax
		push	large dword ptr	[bp+8]
		mov	al, [bp+0Ch]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+660Eh]
		call	TextObjectCluster_DestructVariantB_2B588
		add	sp, 0Ch
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedFreeWrapperB_5C774 (sub_5C774 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_ValidateAllocatorIndex_5C9A6 et TextObjectCluster_DestructVariantC_5C508
; (seg130). Référencée par sub_2AD9C.
; ==============================================================================================
Memory_TypedFreeWrapperB_2B862	proc far		; CODE XREF: sub_702F+AEP
					; sub_702F+223P ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8
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
		call	near ptr Memory_ValidateAllocatorIndex_2BA94
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
		push	word ptr [bx+660Eh]
		call	TextObjectCluster_DestructVariantC_2B5F6
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
Memory_TypedFreeWrapperB_2B862	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedFree_5C7B6 (sub_5C7B6 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far, désallocateur
; typé central utilisé dans des dizaines de segments à travers toute la base ("operator
; delete" générique) : valide l'index d'allocateur (via une variante inline de
; Memory_ValidateAllocatorIndex), sélectionne l'objet allocateur dans une table indexée par
; tag (cs:5C38h) et dispatche vers sa méthode de libération virtuelle (dword ptr [bx+8]).
; CONFIRMÉ par les chaînes de debug du seg339 : la classe s'appelle littéralement «
; MemoryManager » (« Illegal re-instantiation of MemoryManger », « handler %d attached with
; %ld bytes available », « Current state of EMS heap »/« Current state of heap » avec un
; rapport par bloc alloué/libre) — les 7 allocateurs de la table sont bien des « handlers »
; enregistrés, cohérent avec le système EMS/mémoire paginée (seg127).
; ==============================================================================================
Memory_TypedFree_2B8A4	proc far		; CODE XREF: sub_3166+1D9P
					; sub_3166+211P ...

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
		call	near ptr Memory_ValidateAllocatorIndex_2BA94
		add	sp, 4
		push	[bp+arg_2]
		mov	al, [bp+arg_4]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+660Eh]
		mov	al, [bp+arg_4]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+660Eh]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		pop	bp
		retf
Memory_TypedFree_2B8A4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedAllocDispatch_5C7F0 (sub_5C7F0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_ValidateAllocatorIndex_5C9A6 et dispatch vtable [bx+0Ch]. Référencée par
; sub_96917.
; ==============================================================================================
Memory_TypedAllocDispatch_2B8DE	proc far		; CODE XREF: sub_C658C+2E6P
					; sub_C658C+418P ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= word ptr  10h
arg_E		= byte ptr  14h

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_E]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_2BA94
		add	sp, 4
		push	[bp+arg_A]
		push	large [bp+arg_6]
		push	large [bp+arg_2]
		mov	al, [bp+arg_E]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+660Eh]
		mov	al, [bp+arg_E]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+660Eh]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 0Ch
		pop	bp
		retf
Memory_TypedAllocDispatch_2B8DE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedAllocDispatchB_5C832 (sub_5C832 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_ValidateAllocatorIndex_5C9A6 et dispatch vtable [bx+10h]. Référencée par
; sub_1450B.
; ==============================================================================================
Memory_TypedAllocDispatchB_2B920	proc far		; CODE XREF: sub_449C+224P
					; sub_449C+23FP ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, [bp+arg_6]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_2BA94
		add	sp, 4
		push	large [bp+arg_2]
		mov	al, [bp+arg_6]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+660Eh]
		mov	al, [bp+arg_6]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+660Eh]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6
		pop	bp
		retf
Memory_TypedAllocDispatchB_2B920	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedAllocDispatchC_5C86D (sub_5C86D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_ValidateAllocatorIndex_5C9A6 et dispatch vtable [bx+14h]. Référencée
; directement par PagedMemory_ReadTextResource... (sub_509EE, seg113,
; UIScreen_RenderGraphVGA).
; ==============================================================================================
Memory_TypedAllocDispatchC_2B95B	proc far		; CODE XREF: sub_449C+18BP
					; sub_449C+1A7P ...

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
		call	near ptr Memory_ValidateAllocatorIndex_2BA94
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+660Eh]
		mov	al, [bp+arg_2]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+660Eh]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx
		pop	bp
		retf
Memory_TypedAllocDispatchC_2B95B	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	al, [bp+8]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_2BA94
		add	sp, 4
		cmp	byte ptr [bp+8], 3
		jz	short loc_2B9AD
		xor	ax, ax
		jmp	short loc_2B9CD
; ���������������������������������������������������������������������������

loc_2B9AD:				; CODE XREF: seg070:0277j
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+660Eh]
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+660Eh]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		pop	cx

loc_2B9CD:				; CODE XREF: seg070:027Bj
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	al, [bp+8]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_2BA94
		add	sp, 4
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+660Eh]
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+660Eh]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		pop	cx
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_TypedAllocDispatchE_5C916 (sub_5C916 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle Memory_TypedAllocDispatchC_5C86D et sub_5E7EA ×3.
; ==============================================================================================
Memory_TypedAllocDispatchE_2BA04	proc far		; CODE XREF: TextRenderer_ReleaseCachedGlyph_2BB8C+EP
					; TextRenderer_ReleaseCachedGlyph_2BB8C+42P ...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dl, [bp+arg_2]
		cmp	dl, 6
		jbe	short loc_2BA1D
		push	403h
		call	sub_30D3
		pop	cx
		jmp	short loc_2BA30
; ���������������������������������������������������������������������������

loc_2BA1D:				; CODE XREF: Memory_TypedAllocDispatchE_2BA04+Cj
		mov	al, dl
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		cmp	word ptr [bx+660Eh], 0
		jz	short loc_2BA30
		mov	al, 1
		jmp	short loc_2BA32
; ���������������������������������������������������������������������������

loc_2BA30:				; CODE XREF: Memory_TypedAllocDispatchE_2BA04+17j
					; Memory_TypedAllocDispatchE_2BA04+26j
		mov	al, 0

loc_2BA32:				; CODE XREF: Memory_TypedAllocDispatchE_2BA04+2Aj
		pop	bp
		retf
Memory_TypedAllocDispatchE_2BA04	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		jmp	short loc_2BA82
; ���������������������������������������������������������������������������

loc_2BA45:				; CODE XREF: seg070:0356j
		mov	bx, [bp-2]
		shl	bx, 1
		cmp	word ptr [bx+660Eh], 0
		jz	short loc_2BA71
		push	0
		mov	al, [bp-2]
		push	ax
		push	si
		push	cs
		call	near ptr Memory_TypedAllocDispatchC_2B95B
		add	sp, 6
		push	dx
		push	ax
		push	word ptr [bp-2]
		push	3CADh
		call	Video_SetModeIfChanged_2F05F
		add	sp, 8
		jmp	short loc_2BA7F
; ���������������������������������������������������������������������������

loc_2BA71:				; CODE XREF: seg070:031Fj
		push	word ptr [bp-2]
		push	3CDCh
		call	Video_SetModeIfChanged_2F05F
		add	sp, 4

loc_2BA7F:				; CODE XREF: seg070:033Fj
		inc	word ptr [bp-2]

loc_2BA82:				; CODE XREF: seg070:0313j
		cmp	word ptr [bp-2], 6
		jl	short loc_2BA45
		push	3CDAh
		call	Video_SetModeIfChanged_2F05F
		pop	cx
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_ValidateAllocatorIndex_5C9A6 (sub_5C9A6 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; valide qu'un index d'allocateur (0-6) pointe vers une entrée non nulle dans la table
; cs:5C38h ; sinon lève une erreur (sub_6B70F, codes 0x403/0x404). Fonction de garde utilisée
; par toute la famille Memory_Typed*.
; ==============================================================================================
Memory_ValidateAllocatorIndex_2BA94	proc far		; CODE XREF: seg070:0064p
					; Memory_TypedFreeWrapper_2B7E1+10p ...

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
		cmp	word ptr [bx+660Eh], 0
		jnz	short loc_2BAB1
		push	404h
		jmp	short loc_2BAB9
; ���������������������������������������������������������������������������

loc_2BAB1:				; CODE XREF: Memory_ValidateAllocatorIndex_2BA94+16j
		cmp	dl, 6
		jbe	short loc_2BABF
		push	403h

loc_2BAB9:				; CODE XREF: Memory_ValidateAllocatorIndex_2BA94+1Bj
		call	sub_30D3
		pop	cx

loc_2BABF:				; CODE XREF: Memory_ValidateAllocatorIndex_2BA94+20j
		pop	bp
		retf
Memory_ValidateAllocatorIndex_2BA94	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Memory_AllocatorTableConstructor_5C9D3 (sub_5C9D3 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; construit la table des 7 objets allocateurs (indices 0-6) : alloue (sub_658), appelle
; sub_5CB63/sub_5F700/sub_5CD3A et construit deux instances (Memory_TypedFreeVariant_5C643 ×2,
; PagedResourceB_Construct_5C34F, seg129). Référencée via le thunk loc_5CA80 (tag 5C44h).
; ==============================================================================================
Memory_AllocatorTableConstructor_2BAC1	proc far		; CODE XREF: seg070:0445p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2BADA
		push	1Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2BB38

loc_2BADA:				; CODE XREF: Memory_AllocatorTableConstructor_2BAC1+9j
		push	si
		call	Memory_AllocatorSlotArray_Construct_2BC51
		pop	cx
		mov	word ptr [si+18h], 0
		mov	word ptr [si+1Ah], 0
		cmp	byte_46CCC, 0
		jz	short loc_2BAFB
		push	3CECh
		call	sub_310B
		pop	cx

loc_2BAFB:				; CODE XREF: Memory_AllocatorTableConstructor_2BAC1+2Fj
		mov	byte_46CCC, 1
		xor	ax, ax
		jmp	short loc_2BB0F
; ���������������������������������������������������������������������������

loc_2BB04:				; CODE XREF: Memory_AllocatorTableConstructor_2BAC1+51j
		mov	bx, ax
		shl	bx, 1
		mov	word ptr [bx+660Eh], 0
		inc	ax

loc_2BB0F:				; CODE XREF: Memory_AllocatorTableConstructor_2BAC1+41j
		cmp	ax, 6
		jl	short loc_2BB04
		push	large 0
		call	PagedResourceC_Construct_2BE28
		pop	cx
		push	ax
		push	si
		push	cs
		call	near ptr Memory_TypedFreeVariant_2B731
		add	sp, 6
		push	large 0
		call	PagedResourceB_Construct_2B43D
		pop	cx
		push	ax
		push	si
		push	cs
		call	near ptr Memory_TypedFreeVariant_2B731
		add	sp, 6

loc_2BB38:				; CODE XREF: Memory_AllocatorTableConstructor_2BAC1+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
Memory_AllocatorTableConstructor_2BAC1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Memory_AllocatorTable_ConstructSubobject_5CA4F (sub_5CA4F de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, construit/libère le sous-objet à
; +0x18 de la table d'allocateurs (sub_5EA03/sub_338), réinitialise byte_70BEA.
; ==============================================================================================
Memory_AllocatorTable_ConstructSubobject_2BB3D	proc far		; CODE XREF: seg070:0454p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2BB6A
		mov	byte_46CCC, 0
		mov	ax, si
		add	ax, 18h
		push	ax
		call	Member_ClearAndFree_2F278
		pop	cx
		test	di, 1
		jz	short loc_2BB6A
		push	si
		call	sub_308
		pop	cx

loc_2BB6A:				; CODE XREF: Memory_AllocatorTable_ConstructSubobject_2BB3D+Dj
					; Memory_AllocatorTable_ConstructSubobject_2BB3D+24j
		pop	di
		pop	si
		pop	bp
		retf
Memory_AllocatorTable_ConstructSubobject_2BB3D	endp

; ���������������������������������������������������������������������������

loc_2BB6E:				; DATA XREF: dseg:593Ao
		push	bp
		mov	bp, sp
		push	661Ah
		push	cs
		call	near ptr Memory_AllocatorTableConstructor_2BAC1
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2BB7B:				; DATA XREF: dseg:59D6o
		push	bp
		mov	bp, sp
		push	2
		push	661Ah
		push	cs
		call	near ptr Memory_AllocatorTable_ConstructSubobject_2BB3D
		add	sp, 4
		pop	bp
		retf
seg070		ends
