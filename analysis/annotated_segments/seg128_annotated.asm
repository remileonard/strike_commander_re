seg128		segment	byte public 'CODE' use16
		assume cs:seg128
		;org 9
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far, méthode virtuelle (DATA XREF seg339) appelant Registry_MainOperation_5B26B — lecture
; d'une valeur 32 bits paginée.
; ==============================================================================================
PagedMemory_Method_ReadDword_5C089:				; DATA XREF: seg339:off_70A67o
		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+6]
		push	0
		push	large dword ptr	[bp+8]
		push	ss
		lea	ax, [bp-4]
		push	ax
		call	Registry_MainOperation_5B26B
		add	sp, 0Ah
		mov	eax, [bp-4]
		shld	edx, eax, 10h
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle appelant Registry_MainOperationVariant_5B421 si le champ source est
; non nul, puis le remet à zéro.
; ==============================================================================================
PagedMemory_Method_WriteDwordIfSet_5C0B0:				; DATA XREF: seg339:off_70A6Bo
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	ax, [bp+6]
		mov	si, [bp+8]
		cmp	dword ptr [si],	0
		jz	short loc_5C0EA
		mov	eax, [si]
		mov	[bp-4],	eax
		mov	dword ptr [bp-8], 0
		mov	[bp-8],	eax
		push	ss
		lea	ax, [bp-8]
		push	ax
		call	Registry_MainOperationVariant_5B421
		add	sp, 4
		mov	dword ptr [si],	0

loc_5C0EA:				; CODE XREF: seg128:0041j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle appelant PagedMemory_WriteByte_5BD14.
; ==============================================================================================
PagedMemory_Method_WriteByte_5C0ED:				; DATA XREF: seg339:off_70A73o
		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	ax, [bp+6]
		mov	eax, [bp+8]
		mov	[bp-4],	eax
		mov	dword ptr [bp-8], 0
		mov	[bp-8],	eax
		push	ss
		lea	ax, [bp-8]
		push	ax
		call	PagedMemory_WriteByte_5BD14
		add	sp, 4
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle appelant Registry_LookupVariant_5B68A.
; ==============================================================================================
PagedMemory_Method_Query_5C119:				; DATA XREF: seg339:39C7o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		call	Registry_LookupVariant_5B68A
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle stub retournant toujours 1 (probable "IsValid"/"IsPaged").
; ==============================================================================================
PagedMemory_Method_ReturnTrue_5C126:				; DATA XREF: seg339:off_70A7Bo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	ax, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, byte_70A62
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle « constructeur/init » : réinitialise byte_70A62 puis appelle
; PagedMemory_CheckDriverPresent_5B944.
; ==============================================================================================
PagedMemory_Method_Init_5C13C:				; DATA XREF: seg339:off_70A63o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	byte_70A62, 0
		call	PagedMemory_CheckDriverPresent_5B944
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 66 lignes, NON DÉTAILLÉE — alloue (sub_658), combine sub_5F4A9 et
; PagedMemory_InitSubsystem_5BB0D. Référencée directement par TextRenderer_Main (sub_27477,
; seg048) — probable point d'entrée « charger une ressource texte depuis la mémoire paginée ».
; ==============================================================================================
PagedMemory_ReadTextResource_5C14E	proc far		; CODE XREF: TextRenderer_Main+3C1P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_5C152:
		mov	si, [bp+arg_0]

loc_5C155:
		or	si, si
		jnz	short loc_5C167
		push	0Eh

loc_5C15B:
		call	CRT_Malloc16_Retry

loc_5C160:
		pop	cx

loc_5C161:
		mov	si, ax

loc_5C163:
		or	ax, ax
		jz	short loc_5C1C4

loc_5C167:				; CODE XREF: PagedMemory_ReadTextResource_5C14E+9j
		mov	word ptr [si], 129Eh
		mov	ax, word_70EA8
		mov	[si+2],	ax
		mov	word_70EA8, si
		mov	word ptr [si+4], 39E3h
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+8], seg seg160
		mov	word ptr [si+6], 0
		mov	word ptr [si], 39EBh
		mov	word ptr [si+4], 3A13h
		mov	word ptr [si], 39B3h
		mov	word ptr [si+4], 39DBh
		cmp	byte_70A62, 0
		jz	short loc_5C1BA
		push	300h
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4
		jmp	short loc_5C1BF
; ���������������������������������������������������������������������������

loc_5C1BA:				; CODE XREF: PagedMemory_ReadTextResource_5C14E+57j
		call	PagedMemory_InitSubsystem_5BB0D

loc_5C1BF:				; CODE XREF: PagedMemory_ReadTextResource_5C14E+6Aj
		mov	byte_70A62, 1

loc_5C1C4:				; CODE XREF: PagedMemory_ReadTextResource_5C14E+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
PagedMemory_ReadTextResource_5C14E	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable et en interne (loc_5C244) — constructeur d'objet texte paginé :
; pose deux tags vtable (39B3h/39DBh), initialise le pilote
; (PagedMemory_CheckDriverPresent_5B944), construit un sous-objet (sub_5EA03), libère l'objet
; si demandé (sub_338).
; ==============================================================================================
PagedTextObject_Construct_5C1C9:				; CODE XREF: seg128:01CDj
					; DATA XREF: seg339:off_70A87o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_5C204
		mov	word ptr [si], 39B3h
		mov	word ptr [si+4], 39DBh
		mov	byte_70A62, 0
		call	PagedMemory_CheckDriverPresent_5B944
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Member_ClearAndFree_5EA03
		pop	cx
		test	di, 1
		jz	short loc_5C204
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_5C204:				; CODE XREF: seg128:0156j seg128:017Bj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle appelant sub_5F4A9 avec un tag 1514h.
; ==============================================================================================
PagedTextObject_Method_5C208:				; DATA XREF: seg339:off_70A6Fo
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		push	1514h
		mov	ax, dx
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle appelant PagedMemory_ReadFormattedString_5BE40 avec des arguments
; nuls — lecture par défaut.
; ==============================================================================================
PagedTextObject_Method_ReadDefault_5C221:				; DATA XREF: seg339:off_70A7Fo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	0
		push	0
		push	0
		call	PagedMemory_ReadFormattedString_5BE40
		add	sp, 6
		mov	ax, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle stub retournant AL=3 (tag de type).
; ==============================================================================================
PagedTextObject_Method_ReturnType3_5C23A:				; DATA XREF: seg339:off_70A83o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 3
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, thunk d'ajustement de pile (adjustor thunk, motif classique d'héritage multiple C++
; Borland) redirigeant vers PagedTextObject_Construct_5C1C9.
; ==============================================================================================
PagedTextObject_DtorThunkA_5C244:				; DATA XREF: seg339:off_70A8Fo
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	PagedTextObject_Construct_5C1C9
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable — variante de construction plus légère (sub_5EA03, libération
; conditionnelle via sub_338, sans les tags vtable).
; ==============================================================================================
PagedTextObject_ConstructVariant_5C250:				; DATA XREF: seg339:off_70A97o
		push	bp
		mov	bp, sp
		push	si
		push	di

loc_5C255:
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_5C27A

loc_5C25F:
		mov	ax, si
		add	ax, 6
		push	ax
		call	Member_ClearAndFree_5EA03
		pop	cx
		test	di, 1
		jz	short loc_5C27A
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_5C27A:				; CODE XREF: seg128:01DDj seg128:01EFj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable et en interne (loc_5C2B3) — même motif que
; PagedTextObject_Construct_5C1C9 avec d'autres tags vtable (39EBh/3A13h) : probable classe
; sœur/dérivée.
; ==============================================================================================
PagedTextObjectB_Construct_5C27E:				; CODE XREF: seg128:023Cj
					; DATA XREF: seg339:off_70ABFo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_5C2AF
		mov	word ptr [si], 39EBh
		mov	word ptr [si+4], 3A13h
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Member_ClearAndFree_5EA03
		pop	cx
		test	di, 1
		jz	short loc_5C2AF
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_5C2AF:				; CODE XREF: seg128:020Bj seg128:0226j
		pop	di

loc_5C2B0:
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, thunk d'ajustement de pile redirigeant vers PagedTextObjectB_Construct_5C27E.
; ==============================================================================================
PagedTextObjectB_DtorThunk_5C2B3:				; DATA XREF: seg339:off_70AC7o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	PagedTextObjectB_Construct_5C27E
seg128		ends
