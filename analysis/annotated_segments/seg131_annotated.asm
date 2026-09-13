seg131		segment	byte public 'CODE' use16
		assume cs:seg131
		;org 3
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dispatch vtable ([bx+0x20]/[bx+0x24]) avec gestion d'erreur (sub_6B70F ×2). Référencée
; directement par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
Memory_TypedFreeVariant_5C643	proc far		; CODE XREF: TextRenderer_Main+3CBP
					; Memory_AllocatorTableConstructor_5C9D3:loc_5CA32p	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, [bp+arg_0]

loc_5C64B:				; DATA XREF: seg216:04DEo
		mov	si, [bp+arg_2]
		push	si
		mov	bx, [si]

loc_5C651:
		call	dword ptr [bx+20h]
		pop	cx
		mov	ah, 0

loc_5C657:
		mov	di, ax
		mov	bx, di
		shl	bx, 1
		cmp	word ptr [bx+5C38h], 0
		jz	short loc_5C680
		or	si, si
		jz	short loc_5C675
		push	3
		push	si
		mov	bx, [si]
		call	dword ptr [bx+24h]
		add	sp, 4
		jmp	short $+2

loc_5C675:				; CODE XREF: Memory_TypedFreeVariant_5C643+23j
		xor	si, si
		push	400h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5C680:				; CODE XREF: Memory_TypedFreeVariant_5C643+1Fj
		or	si, si
		jnz	short loc_5C68D
		push	401h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5C68D:				; CODE XREF: Memory_TypedFreeVariant_5C643+3Fj
		mov	bx, di
		shl	bx, 1
		mov	[bx+5C38h], si
		pop	di
		pop	si
		pop	bp
		retf
Memory_TypedFreeVariant_5C643	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	al, [bp+8]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_5C9A6
		add	sp, 4
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		cmp	word ptr [bx+5C38h], 0
		jz	short loc_5C6E2
		push	3
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+5C38h]
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+5C38h]
		mov	bx, [bx]
		call	dword ptr [bx+24h]
		add	sp, 4
		jmp	short $+2

loc_5C6E2:				; CODE XREF: seg131:007Aj
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	word ptr [bx+5C38h], 0
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_ValidateAllocatorIndex_5C9A6 et TextObjectCluster_DestructVariantA_5C42C
; (seg130). Référencée par sub_A8AC.
; ==============================================================================================
Memory_TypedFreeWrapper_5C6F3	proc far		; CODE XREF: Goal_ExecuteAction_A8AC+2D0P
					; Goal_ExecuteAction_A8AC+3B5P ...

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
		call	near ptr Memory_ValidateAllocatorIndex_5C9A6
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
		push	word ptr [bx+5C38h]
		call	TextObjectCluster_DestructVariantA_5C42C
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
Memory_TypedFreeWrapper_5C6F3	endp

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
		call	near ptr Memory_ValidateAllocatorIndex_5C9A6
		add	sp, 4
		push	word ptr [bp+12h]
		mov	al, [bp+10h]
		push	ax

loc_5C74F:
		mov	al, [bp+0Eh]
		push	ax
		push	large dword ptr	[bp+8]
		mov	al, [bp+0Ch]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+5C38h]
		call	TextObjectCluster_DestructVariantB_5C49A
		add	sp, 0Ch
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_ValidateAllocatorIndex_5C9A6 et TextObjectCluster_DestructVariantC_5C508
; (seg130). Référencée par sub_2AD9C.
; ==============================================================================================
Memory_TypedFreeWrapperB_5C774	proc far		; CODE XREF: ListItem_ConstructNumberedLabel+31P
					; ListItem_ConstructNumberedLabel+93P ...

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
		call	near ptr Memory_ValidateAllocatorIndex_5C9A6
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
		push	word ptr [bx+5C38h]
		call	TextObjectCluster_DestructVariantC_5C508
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
Memory_TypedFreeWrapperB_5C774	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, désallocateur typé central utilisé dans des dizaines de segments à travers toute la
; base ("operator delete" générique) : valide l'index d'allocateur (via une variante inline de
; Memory_ValidateAllocatorIndex), sélectionne l'objet allocateur dans une table indexée par
; tag (cs:5C38h) et dispatche vers sa méthode de libération virtuelle (dword ptr [bx+8]).
; CONFIRMÉ par les chaînes de debug du seg339 : la classe s'appelle littéralement «
; MemoryManager » (« Illegal re-instantiation of MemoryManger », « handler %d attached with
; %ld bytes available », « Current state of EMS heap »/« Current state of heap » avec un
; rapport par bloc alloué/libre) — les 7 allocateurs de la table sont bien des « handlers »
; enregistrés, cohérent avec le système EMS/mémoire paginée (seg127).
; ==============================================================================================
Memory_TypedFree_5C7B6	proc far		; CODE XREF: seg005:15FDP seg005:1646P ...

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
		call	near ptr Memory_ValidateAllocatorIndex_5C9A6
		add	sp, 4
		push	[bp+arg_2]
		mov	al, [bp+arg_4]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+5C38h]
		mov	al, [bp+arg_4]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+5C38h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		pop	bp
		retf
Memory_TypedFree_5C7B6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_ValidateAllocatorIndex_5C9A6 et dispatch vtable [bx+0Ch]. Référencée par
; sub_96917.
; ==============================================================================================
Memory_TypedAllocDispatch_5C7F0	proc far		; CODE XREF: AircraftComponent_ConstructAndCalibrate_96917+281P
					; AircraftComponent_ConstructAndCalibrate_96917+383P ...

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
		call	near ptr Memory_ValidateAllocatorIndex_5C9A6
		add	sp, 4
		push	[bp+arg_A]
		push	large [bp+arg_6]
		push	large [bp+arg_2]
		mov	al, [bp+arg_E]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+5C38h]
		mov	al, [bp+arg_E]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+5C38h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 0Ch
		pop	bp
		retf
Memory_TypedAllocDispatch_5C7F0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_ValidateAllocatorIndex_5C9A6 et dispatch vtable [bx+10h]. Référencée par
; sub_1450B.
; ==============================================================================================
Memory_TypedAllocDispatchB_5C832	proc far		; CODE XREF: UI_RenderFormattedText+6AP
					; UI_RenderFormattedText+F7P ...

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
		call	near ptr Memory_ValidateAllocatorIndex_5C9A6
		add	sp, 4
		push	large [bp+arg_2]
		mov	al, [bp+arg_6]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax

loc_5C852:
		push	word ptr [bx+5C38h]
		mov	al, [bp+arg_6]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+5C38h]

loc_5C863:
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6
		pop	bp
		retf
Memory_TypedAllocDispatchB_5C832	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_ValidateAllocatorIndex_5C9A6 et dispatch vtable [bx+14h]. Référencée
; directement par PagedMemory_ReadTextResource... (sub_509EE, seg113,
; UIScreen_RenderGraphVGA).
; ==============================================================================================
Memory_TypedAllocDispatchC_5C86D	proc far		; CODE XREF: UIScreen_RenderGraphVGA_509EE+AEP
					; seg131:032Bp	...

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
		call	near ptr Memory_ValidateAllocatorIndex_5C9A6
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+5C38h]
		mov	al, [bp+arg_2]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+5C38h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx
		pop	bp
		retf
Memory_TypedAllocDispatchC_5C86D	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	al, [bp+8]
		push	ax
		push	dx
		nop
		push	cs
		call	near ptr Memory_ValidateAllocatorIndex_5C9A6
		add	sp, 4
		cmp	byte ptr [bp+8], 3
		jz	short loc_5C8BF
		xor	ax, ax
		jmp	short loc_5C8DF
; ���������������������������������������������������������������������������

loc_5C8BF:				; CODE XREF: seg131:0279j
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+5C38h]
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+5C38h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		pop	cx

loc_5C8DF:				; CODE XREF: seg131:027Dj
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
		call	near ptr Memory_ValidateAllocatorIndex_5C9A6
		add	sp, 4
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+5C38h]
		mov	al, [bp+8]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	bx, [bx+5C38h]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		pop	cx
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedAllocDispatchC_5C86D et sub_5E7EA ×3.
; ==============================================================================================
Memory_TypedAllocDispatchE_5C916	proc far		; CODE XREF: TextRenderer_ReleaseCachedGlyph_5CA9E+EP
					; TextRenderer_ReleaseCachedGlyph_5CA9E+42P ...

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dl, [bp+arg_2]
		cmp	dl, 6
		jbe	short loc_5C92F
		push	403h
		call	VROOMM_StubThunk_6B70F
		pop	cx
		jmp	short loc_5C942
; ���������������������������������������������������������������������������

loc_5C92F:				; CODE XREF: Memory_TypedAllocDispatchE_5C916+Cj
		mov	al, dl
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		cmp	word ptr [bx+5C38h], 0
		jz	short loc_5C942
		mov	al, 1
		jmp	short loc_5C944
; ���������������������������������������������������������������������������

loc_5C942:				; CODE XREF: Memory_TypedAllocDispatchE_5C916+17j
					; Memory_TypedAllocDispatchE_5C916+26j
		mov	al, 0

loc_5C944:				; CODE XREF: Memory_TypedAllocDispatchE_5C916+2Aj
		pop	bp
		retf
Memory_TypedAllocDispatchE_5C916	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+6]

loc_5C950:
		mov	word ptr [bp-2], 0
		jmp	short loc_5C994
; ���������������������������������������������������������������������������

loc_5C957:				; CODE XREF: seg131:0358j
		mov	bx, [bp-2]
		shl	bx, 1

loc_5C95C:
		cmp	word ptr [bx+5C38h], 0
		jz	short loc_5C983
		push	0
		mov	al, [bp-2]
		push	ax
		push	si
		push	cs
		call	near ptr Memory_TypedAllocDispatchC_5C86D
		add	sp, 6
		push	dx
		push	ax
		push	word ptr [bp-2]
		push	3B3Bh
		call	Video_SetModeIfChanged_5E7EA
		add	sp, 8
		jmp	short loc_5C991
; ���������������������������������������������������������������������������

loc_5C983:				; CODE XREF: seg131:0321j
		push	word ptr [bp-2]
		push	3B6Ah
		call	Video_SetModeIfChanged_5E7EA
		add	sp, 4

loc_5C991:				; CODE XREF: seg131:0341j
		inc	word ptr [bp-2]

loc_5C994:				; CODE XREF: seg131:0315j
		cmp	word ptr [bp-2], 6
		jl	short loc_5C957
		push	3B68h
		call	Video_SetModeIfChanged_5E7EA
		pop	cx
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, valide qu'un index d'allocateur (0-6) pointe vers une entrée non nulle dans la table
; cs:5C38h ; sinon lève une erreur (sub_6B70F, codes 0x403/0x404). Fonction de garde utilisée
; par toute la famille Memory_Typed*.
; ==============================================================================================
Memory_ValidateAllocatorIndex_5C9A6	proc far		; CODE XREF: seg131:0066p
					; Memory_TypedFreeWrapper_5C6F3+10p ...

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
		cmp	word ptr [bx+5C38h], 0
		jnz	short loc_5C9C3
		push	404h
		jmp	short loc_5C9CB
; ���������������������������������������������������������������������������

loc_5C9C3:				; CODE XREF: Memory_ValidateAllocatorIndex_5C9A6+16j
		cmp	dl, 6
		jbe	short loc_5C9D1
		push	403h

loc_5C9CB:				; CODE XREF: Memory_ValidateAllocatorIndex_5C9A6+1Bj
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5C9D1:				; CODE XREF: Memory_ValidateAllocatorIndex_5C9A6+20j
		pop	bp
		retf
Memory_ValidateAllocatorIndex_5C9A6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, construit la table des 7 objets allocateurs (indices 0-6) : alloue (sub_658), appelle
; sub_5CB63/sub_5F700/sub_5CD3A et construit deux instances (Memory_TypedFreeVariant_5C643 ×2,
; PagedResourceB_Construct_5C34F, seg129). Référencée via le thunk loc_5CA80 (tag 5C44h).
; ==============================================================================================
Memory_AllocatorTableConstructor_5C9D3	proc far		; CODE XREF: seg131:0447p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_5C9EC
		push	1Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5CA4A

loc_5C9EC:				; CODE XREF: Memory_AllocatorTableConstructor_5C9D3+9j
		push	si
		call	Memory_AllocatorSlotArray_Construct_5CB63
		pop	cx
		mov	word ptr [si+18h], 0
		mov	word ptr [si+1Ah], 0
		cmp	byte_70BEA, 0
		jz	short loc_5CA0D
		push	3B7Ah
		call	Runtime_FatalErrorHandler_5F700
		pop	cx

loc_5CA0D:				; CODE XREF: Memory_AllocatorTableConstructor_5C9D3+2Fj
		mov	byte_70BEA, 1
		xor	ax, ax
		jmp	short loc_5CA21
; ���������������������������������������������������������������������������

loc_5CA16:				; CODE XREF: Memory_AllocatorTableConstructor_5C9D3+51j
		mov	bx, ax
		shl	bx, 1
		mov	word ptr [bx+5C38h], 0
		inc	ax

loc_5CA21:				; CODE XREF: Memory_AllocatorTableConstructor_5C9D3+41j
		cmp	ax, 6
		jl	short loc_5CA16

loc_5CA26:
		push	large 0

loc_5CA29:
		call	PagedResourceC_Construct_5CD3A
		pop	cx
		push	ax

loc_5CA30:
		push	si
		push	cs

loc_5CA32:
		call	near ptr Memory_TypedFreeVariant_5C643

loc_5CA35:
		add	sp, 6
		push	large 0
		call	PagedResourceB_Construct_5C34F
		pop	cx
		push	ax
		push	si
		push	cs
		call	near ptr Memory_TypedFreeVariant_5C643
		add	sp, 6

loc_5CA4A:				; CODE XREF: Memory_AllocatorTableConstructor_5C9D3+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
Memory_AllocatorTableConstructor_5C9D3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, construit/libère le sous-objet à +0x18 de la table d'allocateurs (sub_5EA03/sub_338),
; réinitialise byte_70BEA.
; ==============================================================================================
Memory_AllocatorTable_ConstructSubobject_5CA4F	proc far		; CODE XREF: seg131:0456p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_5CA7C
		mov	byte_70BEA, 0
		mov	ax, si
		add	ax, 18h
		push	ax
		call	Member_ClearAndFree_5EA03
		pop	cx
		test	di, 1
		jz	short loc_5CA7C
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_5CA7C:				; CODE XREF: Memory_AllocatorTable_ConstructSubobject_5CA4F+Dj
					; Memory_AllocatorTable_ConstructSubobject_5CA4F+24j
		pop	di
		pop	si
		pop	bp
		retf
Memory_AllocatorTable_ConstructSubobject_5CA4F	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), thunk appelant
; Memory_AllocatorTableConstructor_5C9D3(tag=5C44h) — construction du gestionnaire de mémoire
; typée global.
; ==============================================================================================
Memory_AllocatorTable_ConstructThunk_5CA80:				; DATA XREF: seg339:4E7Co
		push	bp
		mov	bp, sp
		push	5C44h
		push	cs
		call	near ptr Memory_AllocatorTableConstructor_5C9D3
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), thunk appelant
; Memory_AllocatorTable_ConstructSubobject_5CA4F(tag=5C44h, flag=2) — destruction du
; gestionnaire de mémoire typée global.
; ==============================================================================================
Memory_AllocatorTable_DestructThunk_5CA8D:				; DATA XREF: seg339:off_71FE6o
		push	bp
		mov	bp, sp

loc_5CA90:
		push	2
		push	5C44h
		push	cs
		call	near ptr Memory_AllocatorTable_ConstructSubobject_5CA4F
		add	sp, 4
		pop	bp
		retf
seg131		ends
