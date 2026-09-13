seg127		segment	byte public 'CODE' use16
		assume cs:seg127
		;org 1
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, référencée via vtable (DATA XREF seg216) — détection matérielle : int 15h fonction
; 1209h avec signature bx=736Dh ("sm"). Probable détection du propre pilote de mémoire paginée
; du jeu (TSR maison, signature liée au nom "Strike Commander").
; ==============================================================================================
PagedMemory_DetectDriverSignatureA_5B7F1	proc far		; CODE XREF: PagedMemory_InitDriver_5B89D+7p
					; PagedMemory_InitDriver_5B89D+A2p ...
		push	bp
		mov	bp, sp
		pushf
		mov	ax, 1209h
		mov	bx, 736Dh
		int	15h
		popf

loc_5B7FE:				; DATA XREF: seg216:04BEo
		mov	al, bl
		pop	bp
		retf
PagedMemory_DetectDriverSignatureA_5B7F1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, variante de PagedMemory_DetectDriverSignatureA avec signature bx=534Dh ("SM", casse
; différente) — int 15h fonction 1209h. Référencée par sub_5B89D et sub_5B944.
; ==============================================================================================
PagedMemory_DetectDriverSignatureB_5B802	proc far		; CODE XREF: PagedMemory_InitDriver_5B89D+6Ap
					; PagedMemory_CheckDriverPresent_5B944+Ep	...
		push	bp
		mov	bp, sp
		pushf
		mov	ax, 1209h
		mov	bx, 534Dh
		int	15h
		popf
		mov	al, bl
		pop	bp
		retf
PagedMemory_DetectDriverSignatureB_5B802	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, charge une page de 16 Ko (probable appel au pilote de mémoire étendue/paginée détecté
; par les fonctions Detect*). Appelée en boucle par PagedMemory_ResolveAddress_5BBCC.
; ==============================================================================================
PagedMemory_LoadPage_5B813	proc far		; CODE XREF: PagedMemory_InitSubsystem_5BB0D+74p
					; PagedMemory_ResolveAddress_5BBCC+5Fp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, dword_709CC
		cmp	byte ptr es:[bx], 0
		jz	short loc_5B873
		cmp	[bp+arg_0], 18h
		jb	short loc_5B82F
		push	150Eh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5B82F:				; CODE XREF: PagedMemory_LoadPage_5B813+11j
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	ax, [bx+5C08h]
		cmp	ax, [bp+arg_2]
		jz	short loc_5B89B
		mov	ax, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	dx, word_709D0
		mov	ah, 44h	; 'D'
		int	67h		;  - LIM EMS - MAP MEMORY
					; AL = physical	page number (0-3)
					; BX = logical page number, DX = handle
					; Return: AH = status
		or	ah, ah
		jnz	short loc_5B854
		mov	ax, 1
		jmp	short loc_5B856
; ���������������������������������������������������������������������������

loc_5B854:				; CODE XREF: PagedMemory_LoadPage_5B813+3Aj
		xor	ax, ax

loc_5B856:				; CODE XREF: PagedMemory_LoadPage_5B813+3Fj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B865
		push	150Eh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5B865:				; CODE XREF: PagedMemory_LoadPage_5B813+47j
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	ax, [bp+arg_2]
		mov	[bx+5C08h], ax
		jmp	short loc_5B89B
; ���������������������������������������������������������������������������

loc_5B873:				; CODE XREF: PagedMemory_LoadPage_5B813+Bj
		mov	ax, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	dx, word_709D0
		mov	ah, 44h	; 'D'
		int	67h		;  - LIM EMS - MAP MEMORY
					; AL = physical	page number (0-3)
					; BX = logical page number, DX = handle
					; Return: AH = status
		or	ah, ah
		jnz	short loc_5B88A
		mov	ax, 1
		jmp	short loc_5B88C
; ���������������������������������������������������������������������������

loc_5B88A:				; CODE XREF: PagedMemory_LoadPage_5B813+70j
		xor	ax, ax

loc_5B88C:				; CODE XREF: PagedMemory_LoadPage_5B813+75j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B89B
		push	150Eh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5B89B:				; CODE XREF: PagedMemory_LoadPage_5B813+28j
					; PagedMemory_LoadPage_5B813+5Ej ...
		pop	bp
		retf
PagedMemory_LoadPage_5B813	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, initialise le pilote de mémoire paginée : combine
; PagedMemory_DetectDriverSignatureA_5B7F1 et B_5B802 avec gestion d'erreur (sub_6B70F ×2).
; ==============================================================================================
PagedMemory_InitDriver_5B89D	proc far		; CODE XREF: PagedMemory_InitSubsystem_5BB0D+66p

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_5B7F1
		mov	[bp+var_1], al
		mov	ah, 42h	; 'B'
		int	67h		;  - LIM EMS - GET NUMBER OF PAGES
					; Return: AH = 00h function successful,	BX = number of unallocated pages
					; DX = total number of pages
					; AH = error code
		or	ah, ah
		jnz	short loc_5B8B7
		cmp	bx, 18h
		jnb	short loc_5B8C0

loc_5B8B7:				; CODE XREF: PagedMemory_InitDriver_5B89D+13j
		push	150Ch
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5B8C0:				; CODE XREF: PagedMemory_InitDriver_5B89D+18j
		cmp	bx, 1E0h
		jbe	short loc_5B8C9
		mov	bx, 1E0h

loc_5B8C9:				; CODE XREF: PagedMemory_InitDriver_5B89D+27j
		mov	word_709D2, bx
		movzx	eax, word_709D2
		shl	eax, 0Eh
		mov	dword_709E0, eax
		mov	ah, 43h	; 'C'
		int	67h		;  - LIM EMS - GET HANDLE AND ALLOCATE MEMORY
					; BX = number of logical pages to allocate
					; Return: AH = status
		mov	word_709D0, dx
		or	ah, ah
		jz	short loc_5B8F0
		push	150Ch
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5B8F0:				; CODE XREF: PagedMemory_InitDriver_5B89D+48j
		mov	ah, 41h	; 'A'
		int	67h		;  - LIM EMS - GET PAGE	FRAME SEGMENT
					; Return: AH = 00h function successful,	BX = segment of	page frame
					; AH = error code
		mov	word_709D4, bx
		movzx	eax, word_709D4
		shl	eax, 4
		mov	dword_709D8, eax
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_5B802
		les	bx, dword_709CC
		mov	al, es:[bx]
		cbw
		or	ax, ax
		jnz	short loc_5B91F
		push	150Dh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5B91F:				; CODE XREF: PagedMemory_InitDriver_5B89D+77j
		mov	ah, 41h	; 'A'
		int	67h		;  - LIM EMS - GET PAGE	FRAME SEGMENT
					; Return: AH = 00h function successful,	BX = segment of	page frame
					; AH = error code
		mov	word_709D6, bx
		movzx	eax, word_709D6
		shl	eax, 4
		mov	dword_709DC, eax
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short locret_5B942
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_5B7F1

locret_5B942:				; CODE XREF: PagedMemory_InitDriver_5B89D+9Fj
		leave
		retf
PagedMemory_InitDriver_5B89D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, vérifie la présence du pilote (PagedMemory_DetectDriverSignatureB_5B802) avec repli sur
; PagedMemory_DetectDriverSignatureA_5B7F1 en cas d'échec.
; ==============================================================================================
PagedMemory_CheckDriverPresent_5B944	proc far		; CODE XREF: seg128:00C7P seg128:0166P

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	word_709D0, 0FFFFh
		jz	short locret_5B985
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_5B802
		mov	[bp+var_1], al
		mov	byte_709BE, 1
		mov	dx, word_709D0
		mov	ah, 45h	; 'E'
		int	67h		;  - LIM EMS - RELEASE HANDLE AND MEMORY
					; DX = EMM handle
					; Return: AH = status
		or	ah, ah
		jz	short loc_5B972
		push	1512h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5B972:				; CODE XREF: PagedMemory_CheckDriverPresent_5B944+23j
		mov	word_709D0, 0FFFFh
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short locret_5B985
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_5B7F1

locret_5B985:				; CODE XREF: PagedMemory_CheckDriverPresent_5B944+Bj
					; PagedMemory_CheckDriverPresent_5B944+3Bj
		leave
		retf
PagedMemory_CheckDriverPresent_5B944	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit un octet à une adresse paginée : résout l'adresse
; (PagedMemory_ResolveAddress_5BBCC) puis le nœud correspondant
; (Registry_ResolveOrInsertNode_5AE5F, seg126).
; ==============================================================================================
PagedMemory_ReadByte_5B987	proc far		; CODE XREF: PagedMemory_ReadStruct_5B9F1+51p
					; PagedMemory_ReadStruct_5B9F1+6Ap ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	1
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_4]
		mov	es:[bx], eax
		mov	dword ptr es:[bx+4], 0
		push	large [bp+arg_0]
		call	Registry_ResolveOrInsertNode_5AE5F
		add	sp, 4
		push	1
		mov	eax, [bp+arg_0]
		add	eax, [bp+arg_4]
		push	eax
		nop
		push	cs
		call	near ptr PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	dword ptr es:[bx], 11h
		mov	eax, [bp+arg_0]
		mov	es:[bx+4], eax
		leave
		retf
PagedMemory_ReadByte_5B987	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 92 lignes, NON DÉTAILLÉE — lit une structure multi-champs depuis la mémoire paginée
; (PagedMemory_ReadByte_5B987 ×6).
; ==============================================================================================
PagedMemory_ReadStruct_5B9F1	proc far		; CODE XREF: PagedMemory_InitSubsystem_5BB0D+6Ap

var_8		= dword	ptr -8
var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	[bp+var_4], 50000h
		push	1
		push	large [bp+var_4]
		nop
		push	cs
		call	near ptr PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_8]
		mov	dword ptr es:[bx], 11h
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	es:[bx+0Ch], eax
		mov	es:[bx+4], eax
		add	[bp+var_4], 10h
		jmp	short loc_5BA69
; ���������������������������������������������������������������������������

loc_5BA37:				; CODE XREF: PagedMemory_ReadStruct_5B9F1+87j
		push	large 0FFD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr PagedMemory_ReadByte_5B987
		add	sp, 8
		add	[bp+var_4], 0FFE0h
		push	large 10010h
		push	large [bp+var_4]
		push	cs
		call	near ptr PagedMemory_ReadByte_5B987
		add	sp, 8
		add	[bp+var_4], 10020h

loc_5BA69:				; CODE XREF: PagedMemory_ReadStruct_5B9F1+44j
		mov	eax, [bp+var_4]
		add	eax, 20000h
		cmp	eax, dword_709E0
		jb	short loc_5BA37
		mov	eax, dword_709E0
		sub	eax, [bp+var_4]
		sub	eax, 8000h
		add	eax, 10h
		cmp	eax, 10010h
		jl	short loc_5BAC8
		push	large 3FD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr PagedMemory_ReadByte_5B987
		add	sp, 8
		add	[bp+var_4], 3FE0h
		push	large 10010h
		push	large [bp+var_4]
		push	cs
		call	near ptr PagedMemory_ReadByte_5B987
		add	sp, 8
		add	[bp+var_4], 10020h
		jmp	short loc_5BAF2
; ���������������������������������������������������������������������������

loc_5BAC8:				; CODE XREF: PagedMemory_ReadStruct_5B9F1+A1j
		mov	eax, [bp+var_4]
		add	eax, 0FFF0h
		cmp	eax, dword_709E0
		jnb	short loc_5BAF2
		push	large 0FFD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr PagedMemory_ReadByte_5B987
		add	sp, 8
		add	[bp+var_4], 0FFE0h

loc_5BAF2:				; CODE XREF: PagedMemory_ReadStruct_5B9F1+D5j
					; PagedMemory_ReadStruct_5B9F1+E6j
		mov	eax, dword_709E0
		sub	eax, [bp+var_4]
		sub	eax, 10h
		push	eax
		push	large [bp+var_4]
		push	cs
		call	near ptr PagedMemory_ReadByte_5B987
		add	sp, 8
		leave
		retf
PagedMemory_ReadStruct_5B9F1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 94 lignes, NON DÉTAILLÉE — initialisation complète du sous-système de mémoire
; paginée : détection du pilote, chargement de la première page, appels à 3 fonctions non
; encore documentées (sub_5D482/5EFB4/5E45D). Candidat pour session dédiée si le rôle exact de
; la mémoire paginée doit être confirmé.
; ==============================================================================================
PagedMemory_InitSubsystem_5BB0D	proc far		; CODE XREF: PagedMemory_ReadTextResource_5C14E:loc_5C1BAP
		push	bp
		mov	bp, sp
		push	si
		push	di
		cmp	word_709D0, 0FFFFh
		jz	short loc_5BB22
		push	150Ah
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5BB22:				; CODE XREF: PagedMemory_InitSubsystem_5BB0D+Aj
		mov	ax, 1209h
		mov	bx, 4143h
		int	15h
		or	ax, ax
		jnz	short loc_5BB34
		cmp	bx, 1209h
		jz	short loc_5BB3D

loc_5BB34:				; CODE XREF: PagedMemory_InitSubsystem_5BB0D+1Fj
		push	150Bh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5BB3D:				; CODE XREF: PagedMemory_InitSubsystem_5BB0D+25j
		xor	si, si
		jmp	short loc_5BB4C
; ���������������������������������������������������������������������������

loc_5BB41:				; CODE XREF: PagedMemory_InitSubsystem_5BB0D+42j
		mov	bx, si
		shl	bx, 1
		mov	word ptr [bx+5C08h], 0FFFFh
		inc	si

loc_5BB4C:				; CODE XREF: PagedMemory_InitSubsystem_5BB0D+32j
		cmp	si, 18h
		jl	short loc_5BB41
		mov	ax, 1209h
		mov	bx, 4646h
		int	15h
		mov	word ptr dword_709CC+2,	es
		mov	word ptr dword_709CC, di
		or	ax, ax
		jz	short loc_5BB6E
		push	150Dh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5BB6E:				; CODE XREF: PagedMemory_InitSubsystem_5BB0D+56j
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_5B802
		push	cs
		call	near ptr PagedMemory_InitDriver_5B89D
		push	cs
		call	near ptr PagedMemory_ReadStruct_5B9F1
		xor	si, si
		jmp	short loc_5BB88
; ���������������������������������������������������������������������������

loc_5BB7E:				; CODE XREF: PagedMemory_InitSubsystem_5BB0D+7Ej
		push	si
		push	si
		push	cs
		call	near ptr PagedMemory_LoadPage_5B813
		add	sp, 4
		inc	si

loc_5BB88:				; CODE XREF: PagedMemory_InitSubsystem_5BB0D+6Fj
		cmp	si, 14h
		jl	short loc_5BB7E
		push	5000h
		push	word_709D6
		call	PagedResourceB_TreeSearchRecursive_5D482
		add	sp, 4
		call	PagedMemory_InstallExceptionHandler_5EFB4
		cmp	word_709D6, 0B000h
		jnb	short loc_5BBC8
		push	0
		push	0
		push	large 0C7013Fh
		push	large 0
		push	large 10FFFFh
		push	word_70E62
		call	TextFormat_InitAttributeTable_5E45D
		add	sp, 12h

loc_5BBC8:				; CODE XREF: PagedMemory_InitSubsystem_5BB0D+9Aj
		pop	di
		pop	si
		pop	bp
		retf
PagedMemory_InitSubsystem_5BB0D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐ far, DÉCOUVERTE : traduction d'adresse pour un système de mémoire paginée par blocs de 16
; Ko (shr 14 / and 0x3FFFh) : calcule quelles pages charger (via PagedMemory_LoadPage_5B813)
; selon un mode « mémoire étendue disponible » (dword_709CC) ou repli mémoire conventionnelle
; (word_709D4). Cœur du système exploité par tout le cluster Registry/TextObject (seg124-126)
; — probable support du stockage des dialogues/textes de mission au-delà des 640 Ko
; conventionnels.
; ==============================================================================================
PagedMemory_ResolveAddress_5BBCC	proc far		; CODE XREF: Registry_ResolveOrInsertNode_5AE5F+1AP
					; Registry_ResolveOrInsertNode_5AE5F+45P ...

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	eax, [bp+arg_0]
		shr	eax, 0Eh
		mov	[bp+var_2], ax
		les	bx, dword_709CC
		cmp	byte ptr es:[bx], 0
		jz	short loc_5BC12
		cmp	di, 4
		jbe	short loc_5BBFA
		push	150Fh
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5BBFA:				; CODE XREF: PagedMemory_ResolveAddress_5BBCC+23j
		mov	ax, 5
		sub	ax, di
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		xor	dx, dx
		div	[bp+var_4]
		add	dx, 14h
		mov	[bp+var_6], dx
		jmp	short loc_5BC1A
; ���������������������������������������������������������������������������

loc_5BC12:				; CODE XREF: PagedMemory_ResolveAddress_5BBCC+1Ej
		mov	[bp+var_6], 0
		mov	di, 4

loc_5BC1A:				; CODE XREF: PagedMemory_ResolveAddress_5BBCC+44j
		xor	si, si
		jmp	short loc_5BC32
; ���������������������������������������������������������������������������

loc_5BC1E:				; CODE XREF: PagedMemory_ResolveAddress_5BBCC+73j
		mov	ax, [bp+var_2]
		add	ax, si
		push	ax
		mov	ax, [bp+var_6]
		add	ax, si
		push	ax
		push	cs
		call	near ptr PagedMemory_LoadPage_5B813
		add	sp, 4
		inc	si

loc_5BC32:				; CODE XREF: PagedMemory_ResolveAddress_5BBCC+50j
		cmp	si, di
		jnb	short loc_5BC41
		mov	ax, [bp+var_2]
		add	ax, si
		cmp	ax, word_709D2
		jb	short loc_5BC1E

loc_5BC41:				; CODE XREF: PagedMemory_ResolveAddress_5BBCC+68j
		movzx	eax, [bp+var_6]
		shl	eax, 0Eh
		mov	edx, [bp+arg_0]
		and	edx, 3FFFh
		add	edx, eax
		mov	[bp+var_A], edx
		les	bx, dword_709CC
		cmp	byte ptr es:[bx], 0
		jz	short loc_5BC7E
		mov	eax, dword_709DC
		add	[bp+var_A], eax
		mov	eax, [bp+var_A]
		shr	eax, 4
		mov	dx, word ptr [bp+var_A]
		and	dx, 0Fh
		jmp	short loc_5BC84
; ���������������������������������������������������������������������������

loc_5BC7E:				; CODE XREF: PagedMemory_ResolveAddress_5BBCC+98j
		mov	ax, word_709D4
		mov	dx, word ptr [bp+var_A]

loc_5BC84:				; CODE XREF: PagedMemory_ResolveAddress_5BBCC+B0j
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]
		pop	di
		pop	si
		leave
		retf
PagedMemory_ResolveAddress_5BBCC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, rôle exact non détaillé (voisin direct de PagedMemory_ResolveAddress_5BBCC).
; ==============================================================================================
PagedMemory_Helper_5BC94	proc far		; CODE XREF: File_ReadViaPagedMemory_63294+29P
					; File_SeekAndWriteViaPagedMemory_63362+29P

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, dword_709CC
		cmp	byte ptr es:[bx], 0
		jnz	short loc_5BCAE
		push	1510h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5BCAE:				; CODE XREF: PagedMemory_Helper_5BC94+Fj
		movzx	eax, [bp+arg_2]
		shl	eax, 4
		movzx	edx, [bp+arg_0]
		add	eax, edx
		mov	[bp+var_4], eax
		mov	eax, dword_709DC
		sub	[bp+var_4], eax
		mov	eax, [bp+var_4]
		shr	eax, 0Eh
		mov	dx, ax
		mov	bx, dx
		shl	bx, 1
		mov	si, [bx+5C08h]
		cmp	dx, 18h
		jnb	short loc_5BCED
		cmp	si, 0FFFFh
		jz	short loc_5BCED
		cmp	si, word_709D2
		jb	short loc_5BCF6

loc_5BCED:				; CODE XREF: PagedMemory_Helper_5BC94+4Cj
					; PagedMemory_Helper_5BC94+51j
		push	1510h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5BCF6:				; CODE XREF: PagedMemory_Helper_5BC94+57j
		movzx	eax, si
		shl	eax, 0Eh
		mov	edx, [bp+var_4]
		and	edx, 3FFFh
		add	eax, edx
		shld	edx, eax, 10h
		pop	si
		leave
		retf
PagedMemory_Helper_5BC94	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, écrit un octet à une adresse paginée (PagedMemory_ResolveAddress_5BBCC + gestion
; d'erreur sub_6B70F).
; ==============================================================================================
PagedMemory_WriteByte_5BD14	proc far		; CODE XREF: seg128:008FP

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0Fh
		cmp	eax, 1
		jnz	short loc_5BD2D
		mov	ax, 1
		jmp	short loc_5BD2F
; ���������������������������������������������������������������������������

loc_5BD2D:				; CODE XREF: PagedMemory_WriteByte_5BD14+12j
		xor	ax, ax

loc_5BD2F:				; CODE XREF: PagedMemory_WriteByte_5BD14+17j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BD3E
		push	1509h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5BD3E:				; CODE XREF: PagedMemory_WriteByte_5BD14+1Fj
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		shr	eax, 18h
		push	ax
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		push	cs
		call	near ptr PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		pop	bp
		retf
PagedMemory_WriteByte_5BD14	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	1
		les	bx, [bp+6]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		push	eax
		push	cs
		call	near ptr PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère/réinitialise une plage d'adresses paginées (PagedMemory_ResolveAddress_5BBCC
; ×3). Référencée par Sequencer_ReleaseSlot_59F87 (seg123).
; ==============================================================================================
PagedMemory_ReleaseRange_5BD80	proc far		; CODE XREF: Sequencer_ProcessQueue_59FF5+62P
					; Registry_MainOperationVariant_5B421+2AP

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 12h
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		test	byte ptr es:[bx], 1
		jnz	short loc_5BD96
		jmp	loc_5BE24
; ���������������������������������������������������������������������������

loc_5BD96:				; CODE XREF: PagedMemory_ReleaseRange_5BD80+11j
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		mov	[bp+var_A], eax
		push	1
		push	eax
		push	cs
		call	near ptr PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		les	bx, [bp+var_6]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		mov	edx, [bp+var_A]
		add	edx, eax
		mov	[bp+var_E], edx
		mov	eax, es:[bx+4]
		mov	[bp+var_12], eax
		push	1
		push	edx
		push	cs
		call	near ptr PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		les	bx, [bp+var_6]
		mov	eax, es:[bx+4]
		cmp	eax, [bp+var_A]
		jnz	short loc_5BE3B
		cmp	[bp+var_12], 0
		jz	short loc_5BE37
		push	1
		push	large [bp+var_12]
		push	cs
		call	near ptr PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		les	bx, [bp+var_6]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		add	eax, [bp+var_12]
		cmp	eax, [bp+var_A]
		jnz	short loc_5BE3B
		jmp	short loc_5BE37
; ���������������������������������������������������������������������������

loc_5BE24:				; CODE XREF: PagedMemory_ReleaseRange_5BD80+13j
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jnz	short loc_5BE3B

loc_5BE37:				; CODE XREF: PagedMemory_ReleaseRange_5BD80+78j
					; PagedMemory_ReleaseRange_5BD80+A2j
		mov	[bp+var_1], 1

loc_5BE3B:				; CODE XREF: PagedMemory_ReleaseRange_5BD80+71j
					; PagedMemory_ReleaseRange_5BD80+A0j ...
		mov	al, [bp+var_1]
		leave
		retf
PagedMemory_ReleaseRange_5BD80	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 279 lignes, NON DÉTAILLÉE — plus gros consommateur de
; PagedMemory_ResolveAddress_5BBCC (×5) combiné à des fonctions de formatage externes
; (sub_2945/sub_2070/sub_22FC) — probable lecture d'une chaîne de texte formatée depuis la
; mémoire paginée (dialogue de mission ?). Candidat pour session dédiée.
; ==============================================================================================
PagedMemory_ReadFormattedString_5BE40	proc far		; CODE XREF: seg128:01ADP

var_76		= word ptr -76h
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= byte ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 76h
		push	si
		mov	si, [bp+arg_4]
		xor	eax, eax
		mov	[bp+var_14], eax
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax
		mov	[bp+var_8], 50000h
		cmp	[bp+arg_0], 0
		jnz	short loc_5BE6A
		jmp	loc_5C03A
; ���������������������������������������������������������������������������

loc_5BE6A:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+25j
		push	3934h
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		or	si, si
		jnz	short loc_5BE80
		jmp	loc_5C030
; ���������������������������������������������������������������������������

loc_5BE80:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+3Bj
					; PagedMemory_ReadFormattedString_5BE40+1EDj
		push	si
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	loc_5C03A
; ���������������������������������������������������������������������������
		jmp	loc_5C030
; ���������������������������������������������������������������������������

loc_5BE93:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+209j
		mov	eax, [bp+var_14]
		add	[bp+var_8], eax
		push	1
		push	large [bp+var_8]
		push	cs
		call	near ptr PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		mov	al, byte ptr [bp+var_14]
		and	al, 1
		mov	[bp+var_25], al
		and	[bp+var_14], 0FFFFFFFEh
		mov	eax, [bp+var_14]
		shr	eax, 4
		cmp	eax, 2
		jnb	short loc_5BED7
		jmp	loc_5C03A
; ���������������������������������������������������������������������������

loc_5BED7:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+92j
		cmp	[bp+var_25], 0
		jz	short loc_5BEE7
		mov	eax, [bp+var_14]
		add	[bp+var_10], eax
		jmp	short loc_5BEEF
; ���������������������������������������������������������������������������

loc_5BEE7:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+9Bj
		mov	eax, [bp+var_14]
		add	[bp+var_C], eax

loc_5BEEF:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+A5j
		mov	[bp+var_26], 0
		mov	eax, [bp+var_8]
		add	eax, [bp+var_14]
		mov	[bp+var_18], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+4]
		mov	[bp+var_1C], eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_20], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_24], eax
		push	1
		push	large [bp+var_18]
		push	cs
		call	near ptr PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+4]
		cmp	eax, [bp+var_8]
		jnz	short loc_5BF71
		cmp	[bp+var_1C], 0
		jz	short loc_5BF6D
		push	1
		push	large [bp+var_1C]
		push	cs
		call	near ptr PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		add	eax, [bp+var_1C]
		cmp	eax, [bp+var_8]
		jnz	short loc_5BF71

loc_5BF6D:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+103j
		mov	[bp+var_26], 1

loc_5BF71:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+FCj
					; PagedMemory_ReadFormattedString_5BE40+12Bj
		cmp	[bp+var_26], 0
		jz	short loc_5BFDC
		mov	al, [bp+var_25]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BFDC
		push	1
		push	large [bp+var_24]
		push	cs
		call	near ptr PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		cmp	eax, [bp+var_8]
		jnz	short loc_5BFA6
		mov	ax, 1
		jmp	short loc_5BFA8
; ���������������������������������������������������������������������������

loc_5BFA6:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+15Fj
		xor	ax, ax

loc_5BFA8:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+164j
		mov	[bp+var_26], al
		cmp	[bp+var_26], 0
		jz	short loc_5BFDC
		push	1
		push	large [bp+var_20]
		push	cs
		call	near ptr PagedMemory_ResolveAddress_5BBCC
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		cmp	eax, [bp+var_8]
		jnz	short loc_5BFD7
		mov	ax, 1
		jmp	short loc_5BFD9
; ���������������������������������������������������������������������������

loc_5BFD7:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+190j
		xor	ax, ax

loc_5BFD9:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+195j
		mov	[bp+var_26], al

loc_5BFDC:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+135j
					; PagedMemory_ReadFormattedString_5BE40+13Ej ...
		mov	al, [bp+var_26]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5BFEE
		push	1507h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_5BFEE:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+1A3j
		mov	al, [bp+arg_0]
		mov	ah, 0
		or	ax, ax
		jz	short loc_5C03A
		cmp	[bp+var_25], 0
		jz	short loc_5C003
		cmp	[bp+arg_2], 0
		jnz	short loc_5C03A

loc_5C003:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+1BBj
		push	large [bp+var_14]
		push	large [bp+var_8]
		cmp	[bp+var_25], 0
		jz	short loc_5C016
		mov	ax, 3970h
		jmp	short loc_5C019
; ���������������������������������������������������������������������������

loc_5C016:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+1CFj
		mov	ax, 397Ah

loc_5C019:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+1D4j
		push	ax
		push	3950h
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Eh
		or	si, si
		jz	short loc_5C030
		jmp	loc_5BE80
; ���������������������������������������������������������������������������

loc_5C030:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+3Dj
					; PagedMemory_ReadFormattedString_5BE40+50j ...
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_5C03A:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+27j
					; PagedMemory_ReadFormattedString_5BE40+4Dj ...
		mov	eax, [bp+var_8]
		add	eax, [bp+var_14]
		cmp	eax, dword_709E0
		jnb	short loc_5C04C
		jmp	loc_5BE93
; ���������������������������������������������������������������������������

loc_5C04C:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+207j
		cmp	[bp+arg_0], 0
		jz	short loc_5C086
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	397Fh
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	si, si
		jz	short loc_5C07C
		push	si
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_5C086
; ���������������������������������������������������������������������������

loc_5C07C:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+22Bj
		lea	ax, [bp+var_76]
		push	ax

loc_5C080:
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_5C086:				; CODE XREF: PagedMemory_ReadFormattedString_5BE40+210j
					; PagedMemory_ReadFormattedString_5BE40+23Aj
		pop	si
		leave
		retf
PagedMemory_ReadFormattedString_5BE40	endp

seg127		ends
