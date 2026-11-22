seg066		segment	byte public 'CODE' use16
		assume cs:seg066
		;org 0Fh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedMemory_DetectDriverSignatureA_5B7F1 (sub_5B7F1 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far, référencée via vtable (DATA
; XREF seg216) — détection matérielle : int 15h fonction 1209h avec signature bx=736Dh ("sm").
; Probable détection du propre pilote de mémoire paginée du jeu (TSR maison, signature liée au
; nom "Strike Commander").
; ==============================================================================================
PagedMemory_DetectDriverSignatureA_2A8DF	proc far		; CODE XREF: PagedMemory_InitDriver_2A98B+7p
					; PagedMemory_InitDriver_2A98B+A2p ...
		push	bp
		mov	bp, sp
		pushf
		mov	ax, 1209h
		mov	bx, 736Dh
		int	15h
		popf
		mov	al, bl
		pop	bp
		retf
PagedMemory_DetectDriverSignatureA_2A8DF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedMemory_DetectDriverSignatureB_5B802 (sub_5B802 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far, variante de
; PagedMemory_DetectDriverSignatureA avec signature bx=534Dh ("SM", casse différente) — int
; 15h fonction 1209h. Référencée par sub_5B89D et sub_5B944.
; ==============================================================================================
PagedMemory_DetectDriverSignatureB_2A8F0	proc far		; CODE XREF: PagedMemory_InitDriver_2A98B+6Ap
					; PagedMemory_CheckDriverPresent_2AA32+Ep	...
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
PagedMemory_DetectDriverSignatureB_2A8F0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedMemory_LoadPage_5B813 (sub_5B813 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, charge une page
; de 16 Ko (probable appel au pilote de mémoire étendue/paginée détecté par les fonctions
; Detect*). Appelée en boucle par PagedMemory_ResolveAddress_5BBCC.
; ==============================================================================================
PagedMemory_LoadPage_2A901	proc far		; CODE XREF: PagedMemory_InitSubsystem_2ABFB+74p
					; PagedMemory_ResolveAddress_2ACBA+5Fp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, dword_46AAE
		cmp	byte ptr es:[bx], 0
		jz	short loc_2A961
		cmp	[bp+arg_0], 18h
		jb	short loc_2A91D
		push	150Eh
		call	sub_30D3
		pop	cx

loc_2A91D:				; CODE XREF: PagedMemory_LoadPage_2A901+11j
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	ax, [bx+65DEh]
		cmp	ax, [bp+arg_2]
		jz	short loc_2A989
		mov	ax, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	dx, word_46AB2
		mov	ah, 44h	; 'D'
		int	67h		;  - LIM EMS - MAP MEMORY
					; AL = physical	page number (0-3)
					; BX = logical page number, DX = handle
					; Return: AH = status
		or	ah, ah
		jnz	short loc_2A942
		mov	ax, 1
		jmp	short loc_2A944
; ���������������������������������������������������������������������������

loc_2A942:				; CODE XREF: PagedMemory_LoadPage_2A901+3Aj
		xor	ax, ax

loc_2A944:				; CODE XREF: PagedMemory_LoadPage_2A901+3Fj
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2A953
		push	150Eh
		call	sub_30D3
		pop	cx

loc_2A953:				; CODE XREF: PagedMemory_LoadPage_2A901+47j
		mov	bx, [bp+arg_0]
		shl	bx, 1
		mov	ax, [bp+arg_2]
		mov	[bx+65DEh], ax
		jmp	short loc_2A989
; ���������������������������������������������������������������������������

loc_2A961:				; CODE XREF: PagedMemory_LoadPage_2A901+Bj
		mov	ax, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	dx, word_46AB2
		mov	ah, 44h	; 'D'
		int	67h		;  - LIM EMS - MAP MEMORY
					; AL = physical	page number (0-3)
					; BX = logical page number, DX = handle
					; Return: AH = status
		or	ah, ah
		jnz	short loc_2A978
		mov	ax, 1
		jmp	short loc_2A97A
; ���������������������������������������������������������������������������

loc_2A978:				; CODE XREF: PagedMemory_LoadPage_2A901+70j
		xor	ax, ax

loc_2A97A:				; CODE XREF: PagedMemory_LoadPage_2A901+75j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2A989
		push	150Eh
		call	sub_30D3
		pop	cx

loc_2A989:				; CODE XREF: PagedMemory_LoadPage_2A901+28j
					; PagedMemory_LoadPage_2A901+5Ej ...
		pop	bp
		retf
PagedMemory_LoadPage_2A901	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedMemory_InitDriver_5B89D (sub_5B89D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, initialise le pilote de mémoire paginée :
; combine PagedMemory_DetectDriverSignatureA_5B7F1 et B_5B802 avec gestion d'erreur (sub_6B70F
; ×2).
; ==============================================================================================
PagedMemory_InitDriver_2A98B	proc far		; CODE XREF: PagedMemory_InitSubsystem_2ABFB+66p

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_2A8DF
		mov	[bp+var_1], al
		mov	ah, 42h	; 'B'
		int	67h		;  - LIM EMS - GET NUMBER OF PAGES
					; Return: AH = 00h function successful,	BX = number of unallocated pages
					; DX = total number of pages
					; AH = error code
		or	ah, ah
		jnz	short loc_2A9A5
		cmp	bx, 18h
		jnb	short loc_2A9AE

loc_2A9A5:				; CODE XREF: PagedMemory_InitDriver_2A98B+13j
		push	150Ch
		call	sub_30D3
		pop	cx

loc_2A9AE:				; CODE XREF: PagedMemory_InitDriver_2A98B+18j
		cmp	bx, 1E0h
		jbe	short loc_2A9B7
		mov	bx, 1E0h

loc_2A9B7:				; CODE XREF: PagedMemory_InitDriver_2A98B+27j
		mov	word_46AB4, bx
		movzx	eax, word_46AB4
		shl	eax, 0Eh
		mov	dword_46AC2, eax
		mov	ah, 43h	; 'C'
		int	67h		;  - LIM EMS - GET HANDLE AND ALLOCATE MEMORY
					; BX = number of logical pages to allocate
					; Return: AH = status
		mov	word_46AB2, dx
		or	ah, ah
		jz	short loc_2A9DE
		push	150Ch
		call	sub_30D3
		pop	cx

loc_2A9DE:				; CODE XREF: PagedMemory_InitDriver_2A98B+48j
		mov	ah, 41h	; 'A'
		int	67h		;  - LIM EMS - GET PAGE	FRAME SEGMENT
					; Return: AH = 00h function successful,	BX = segment of	page frame
					; AH = error code
		mov	word_46AB6, bx
		movzx	eax, word_46AB6
		shl	eax, 4
		mov	dword_46ABA, eax
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_2A8F0
		les	bx, dword_46AAE
		mov	al, es:[bx]
		cbw
		or	ax, ax
		jnz	short loc_2AA0D
		push	150Dh
		call	sub_30D3
		pop	cx

loc_2AA0D:				; CODE XREF: PagedMemory_InitDriver_2A98B+77j
		mov	ah, 41h	; 'A'
		int	67h		;  - LIM EMS - GET PAGE	FRAME SEGMENT
					; Return: AH = 00h function successful,	BX = segment of	page frame
					; AH = error code
		mov	word_46AB8, bx
		movzx	eax, word_46AB8
		shl	eax, 4
		mov	dword_46ABE, eax
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short locret_2AA30
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_2A8DF

locret_2AA30:				; CODE XREF: PagedMemory_InitDriver_2A98B+9Fj
		leave
		retf
PagedMemory_InitDriver_2A98B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedMemory_CheckDriverPresent_5B944 (sub_5B944 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, vérifie la présence du pilote
; (PagedMemory_DetectDriverSignatureB_5B802) avec repli sur
; PagedMemory_DetectDriverSignatureA_5B7F1 en cas d'échec.
; ==============================================================================================
PagedMemory_CheckDriverPresent_2AA32	proc far		; CODE XREF: seg067:00C5P seg067:0164P

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	word_46AB2, 0FFFFh
		jz	short locret_2AA73
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_2A8F0
		mov	[bp+var_1], al
		mov	byte_46AA0, 1
		mov	dx, word_46AB2
		mov	ah, 45h	; 'E'
		int	67h		;  - LIM EMS - RELEASE HANDLE AND MEMORY
					; DX = EMM handle
					; Return: AH = status
		or	ah, ah
		jz	short loc_2AA60
		push	1512h
		call	sub_30D3
		pop	cx

loc_2AA60:				; CODE XREF: PagedMemory_CheckDriverPresent_2AA32+23j
		mov	word_46AB2, 0FFFFh
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short locret_2AA73
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_2A8DF

locret_2AA73:				; CODE XREF: PagedMemory_CheckDriverPresent_2AA32+Bj
					; PagedMemory_CheckDriverPresent_2AA32+3Bj
		leave
		retf
PagedMemory_CheckDriverPresent_2AA32	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedMemory_ReadByte_5B987 (sub_5B987 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, lit un octet à une adresse paginée : résout
; l'adresse (PagedMemory_ResolveAddress_5BBCC) puis le nœud correspondant
; (Registry_ResolveOrInsertNode_5AE5F, seg126).
; ==============================================================================================
PagedMemory_ReadByte_2AA75	proc far		; CODE XREF: PagedMemory_ReadStruct_2AADF+51p
					; PagedMemory_ReadStruct_2AADF+6Ap ...

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
		call	near ptr PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_4]
		mov	es:[bx], eax
		mov	dword ptr es:[bx+4], 0
		push	large [bp+arg_0]
		call	Registry_ResolveOrInsertNode_29F4D
		add	sp, 4
		push	1
		mov	eax, [bp+arg_0]
		add	eax, [bp+arg_4]
		push	eax
		nop
		push	cs
		call	near ptr PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	dword ptr es:[bx], 11h
		mov	eax, [bp+arg_0]
		mov	es:[bx+4], eax
		leave
		retf
PagedMemory_ReadByte_2AA75	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedMemory_ReadStruct_5B9F1 (sub_5B9F1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 92 lignes, NON DÉTAILLÉE — lit une
; structure multi-champs depuis la mémoire paginée (PagedMemory_ReadByte_5B987 ×6).
; ==============================================================================================
PagedMemory_ReadStruct_2AADF	proc far		; CODE XREF: PagedMemory_InitSubsystem_2ABFB+6Ap

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
		call	near ptr PagedMemory_ResolveAddress_2ACBA
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
		jmp	short loc_2AB57
; ���������������������������������������������������������������������������

loc_2AB25:				; CODE XREF: PagedMemory_ReadStruct_2AADF+87j
		push	large 0FFD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr PagedMemory_ReadByte_2AA75
		add	sp, 8
		add	[bp+var_4], 0FFE0h
		push	large 10010h
		push	large [bp+var_4]
		push	cs
		call	near ptr PagedMemory_ReadByte_2AA75
		add	sp, 8
		add	[bp+var_4], 10020h

loc_2AB57:				; CODE XREF: PagedMemory_ReadStruct_2AADF+44j
		mov	eax, [bp+var_4]
		add	eax, 20000h
		cmp	eax, dword_46AC2
		jb	short loc_2AB25
		mov	eax, dword_46AC2
		sub	eax, [bp+var_4]
		sub	eax, 8000h
		add	eax, 10h
		cmp	eax, 10010h
		jl	short loc_2ABB6
		push	large 3FD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr PagedMemory_ReadByte_2AA75
		add	sp, 8
		add	[bp+var_4], 3FE0h
		push	large 10010h
		push	large [bp+var_4]
		push	cs
		call	near ptr PagedMemory_ReadByte_2AA75
		add	sp, 8
		add	[bp+var_4], 10020h
		jmp	short loc_2ABE0
; ���������������������������������������������������������������������������

loc_2ABB6:				; CODE XREF: PagedMemory_ReadStruct_2AADF+A1j
		mov	eax, [bp+var_4]
		add	eax, 0FFF0h
		cmp	eax, dword_46AC2
		jnb	short loc_2ABE0
		push	large 0FFD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr PagedMemory_ReadByte_2AA75
		add	sp, 8
		add	[bp+var_4], 0FFE0h

loc_2ABE0:				; CODE XREF: PagedMemory_ReadStruct_2AADF+D5j
					; PagedMemory_ReadStruct_2AADF+E6j
		mov	eax, dword_46AC2
		sub	eax, [bp+var_4]
		sub	eax, 10h
		push	eax
		push	large [bp+var_4]
		push	cs
		call	near ptr PagedMemory_ReadByte_2AA75
		add	sp, 8
		leave
		retf
PagedMemory_ReadStruct_2AADF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedMemory_InitSubsystem_5BB0D (sub_5BB0D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 94 lignes, NON DÉTAILLÉE — initialisation complète du sous-système de mémoire paginée :
; détection du pilote, chargement de la première page, appels à 3 fonctions non encore
; documentées (sub_5D482/5EFB4/5E45D). Candidat pour session dédiée si le rôle exact de la
; mémoire paginée doit être confirmé.
; ==============================================================================================
PagedMemory_InitSubsystem_2ABFB	proc far		; CODE XREF: PagedMemory_ReadTextResource_2B23C:loc_2B2A8P
		push	bp
		mov	bp, sp
		push	si
		push	di
		cmp	word_46AB2, 0FFFFh
		jz	short loc_2AC10
		push	150Ah
		call	sub_30D3
		pop	cx

loc_2AC10:				; CODE XREF: PagedMemory_InitSubsystem_2ABFB+Aj
		mov	ax, 1209h
		mov	bx, 4143h
		int	15h
		or	ax, ax
		jnz	short loc_2AC22
		cmp	bx, 1209h
		jz	short loc_2AC2B

loc_2AC22:				; CODE XREF: PagedMemory_InitSubsystem_2ABFB+1Fj
		push	150Bh
		call	sub_30D3
		pop	cx

loc_2AC2B:				; CODE XREF: PagedMemory_InitSubsystem_2ABFB+25j
		xor	si, si
		jmp	short loc_2AC3A
; ���������������������������������������������������������������������������

loc_2AC2F:				; CODE XREF: PagedMemory_InitSubsystem_2ABFB+42j
		mov	bx, si
		shl	bx, 1
		mov	word ptr [bx+65DEh], 0FFFFh
		inc	si

loc_2AC3A:				; CODE XREF: PagedMemory_InitSubsystem_2ABFB+32j
		cmp	si, 18h
		jl	short loc_2AC2F
		mov	ax, 1209h
		mov	bx, 4646h
		int	15h
		mov	word ptr dword_46AAE+2,	es
		mov	word ptr dword_46AAE, di
		or	ax, ax
		jz	short loc_2AC5C
		push	150Dh
		call	sub_30D3
		pop	cx

loc_2AC5C:				; CODE XREF: PagedMemory_InitSubsystem_2ABFB+56j
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_2A8F0
		push	cs
		call	near ptr PagedMemory_InitDriver_2A98B
		push	cs
		call	near ptr PagedMemory_ReadStruct_2AADF
		xor	si, si
		jmp	short loc_2AC76
; ���������������������������������������������������������������������������

loc_2AC6C:				; CODE XREF: PagedMemory_InitSubsystem_2ABFB+7Ej
		push	si
		push	si
		push	cs
		call	near ptr PagedMemory_LoadPage_2A901
		add	sp, 4
		inc	si

loc_2AC76:				; CODE XREF: PagedMemory_InitSubsystem_2ABFB+6Fj
		cmp	si, 14h
		jl	short loc_2AC6C
		push	5000h
		push	word_46AB8
		call	PagedResourceB_TreeSearchRecursive_2C570
		add	sp, 4
		call	PagedMemory_InstallExceptionHandler_2F829
		cmp	word_46AB8, 0B000h
		jnb	short loc_2ACB6
		push	0
		push	0
		push	large 0C7013Fh
		push	large 0
		push	large 10FFFFh
		push	word_46F46
		call	TextFormat_InitAttributeTable_2EB31
		add	sp, 12h

loc_2ACB6:				; CODE XREF: PagedMemory_InitSubsystem_2ABFB+9Aj
		pop	di
		pop	si
		pop	bp
		retf
PagedMemory_InitSubsystem_2ABFB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedMemory_ResolveAddress_5BBCC (sub_5BBCC de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⭐ far, DÉCOUVERTE : traduction d'adresse pour un
; système de mémoire paginée par blocs de 16 Ko (shr 14 / and 0x3FFFh) : calcule quelles pages
; charger (via PagedMemory_LoadPage_5B813) selon un mode « mémoire étendue disponible »
; (dword_709CC) ou repli mémoire conventionnelle (word_709D4). Cœur du système exploité par
; tout le cluster Registry/TextObject (seg124-126) — probable support du stockage des
; dialogues/textes de mission au-delà des 640 Ko conventionnels.
; ==============================================================================================
PagedMemory_ResolveAddress_2ACBA	proc far		; CODE XREF: Registry_ResolveOrInsertNode_29F4D+1AP
					; Registry_ResolveOrInsertNode_29F4D+45P ...

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
		les	bx, dword_46AAE
		cmp	byte ptr es:[bx], 0
		jz	short loc_2AD00
		cmp	di, 4
		jbe	short loc_2ACE8
		push	150Fh
		call	sub_30D3
		pop	cx

loc_2ACE8:				; CODE XREF: PagedMemory_ResolveAddress_2ACBA+23j
		mov	ax, 5
		sub	ax, di
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		xor	dx, dx
		div	[bp+var_4]
		add	dx, 14h
		mov	[bp+var_6], dx
		jmp	short loc_2AD08
; ���������������������������������������������������������������������������

loc_2AD00:				; CODE XREF: PagedMemory_ResolveAddress_2ACBA+1Ej
		mov	[bp+var_6], 0
		mov	di, 4

loc_2AD08:				; CODE XREF: PagedMemory_ResolveAddress_2ACBA+44j
		xor	si, si
		jmp	short loc_2AD20
; ���������������������������������������������������������������������������

loc_2AD0C:				; CODE XREF: PagedMemory_ResolveAddress_2ACBA+73j
		mov	ax, [bp+var_2]
		add	ax, si
		push	ax
		mov	ax, [bp+var_6]
		add	ax, si
		push	ax
		push	cs
		call	near ptr PagedMemory_LoadPage_2A901
		add	sp, 4
		inc	si

loc_2AD20:				; CODE XREF: PagedMemory_ResolveAddress_2ACBA+50j
		cmp	si, di
		jnb	short loc_2AD2F
		mov	ax, [bp+var_2]
		add	ax, si
		cmp	ax, word_46AB4
		jb	short loc_2AD0C

loc_2AD2F:				; CODE XREF: PagedMemory_ResolveAddress_2ACBA+68j
		movzx	eax, [bp+var_6]
		shl	eax, 0Eh
		mov	edx, [bp+arg_0]
		and	edx, 3FFFh
		add	edx, eax
		mov	[bp+var_A], edx
		les	bx, dword_46AAE
		cmp	byte ptr es:[bx], 0
		jz	short loc_2AD6C
		mov	eax, dword_46ABE
		add	[bp+var_A], eax
		mov	eax, [bp+var_A]
		shr	eax, 4
		mov	dx, word ptr [bp+var_A]
		and	dx, 0Fh
		jmp	short loc_2AD72
; ���������������������������������������������������������������������������

loc_2AD6C:				; CODE XREF: PagedMemory_ResolveAddress_2ACBA+98j
		mov	ax, word_46AB6
		mov	dx, word ptr [bp+var_A]

loc_2AD72:				; CODE XREF: PagedMemory_ResolveAddress_2ACBA+B0j
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]
		pop	di
		pop	si
		leave
		retf
PagedMemory_ResolveAddress_2ACBA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedMemory_Helper_5BC94 (sub_5BC94 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, rôle exact non
; détaillé (voisin direct de PagedMemory_ResolveAddress_5BBCC).
; ==============================================================================================
PagedMemory_Helper_2AD82	proc far		; CODE XREF: File_ReadViaPagedMemory_3AB04+29P
					; File_SeekAndWriteViaPagedMemory_3ABD2+29P

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, dword_46AAE
		cmp	byte ptr es:[bx], 0
		jnz	short loc_2AD9C
		push	1510h
		call	sub_30D3
		pop	cx

loc_2AD9C:				; CODE XREF: PagedMemory_Helper_2AD82+Fj
		movzx	eax, [bp+arg_2]
		shl	eax, 4
		movzx	edx, [bp+arg_0]
		add	eax, edx
		mov	[bp+var_4], eax
		mov	eax, dword_46ABE
		sub	[bp+var_4], eax
		mov	eax, [bp+var_4]
		shr	eax, 0Eh
		mov	dx, ax
		mov	bx, dx
		shl	bx, 1
		mov	si, [bx+65DEh]
		cmp	dx, 18h
		jnb	short loc_2ADDB
		cmp	si, 0FFFFh
		jz	short loc_2ADDB
		cmp	si, word_46AB4
		jb	short loc_2ADE4

loc_2ADDB:				; CODE XREF: PagedMemory_Helper_2AD82+4Cj
					; PagedMemory_Helper_2AD82+51j
		push	1510h
		call	sub_30D3
		pop	cx

loc_2ADE4:				; CODE XREF: PagedMemory_Helper_2AD82+57j
		movzx	eax, si
		shl	eax, 0Eh
		mov	edx, [bp+var_4]
		and	edx, 3FFFh
		add	eax, edx
		shld	edx, eax, 10h
		pop	si
		leave
		retf
PagedMemory_Helper_2AD82	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedMemory_WriteByte_5BD14 (sub_5BD14 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, écrit un octet à une adresse paginée
; (PagedMemory_ResolveAddress_5BBCC + gestion d'erreur sub_6B70F).
; ==============================================================================================
PagedMemory_WriteByte_2AE02	proc far		; CODE XREF: seg067:008DP

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0Fh
		cmp	eax, 1
		jnz	short loc_2AE1B
		mov	ax, 1
		jmp	short loc_2AE1D
; ���������������������������������������������������������������������������

loc_2AE1B:				; CODE XREF: PagedMemory_WriteByte_2AE02+12j
		xor	ax, ax

loc_2AE1D:				; CODE XREF: PagedMemory_WriteByte_2AE02+17j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2AE2C
		push	1509h
		call	sub_30D3
		pop	cx

loc_2AE2C:				; CODE XREF: PagedMemory_WriteByte_2AE02+1Fj
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		shr	eax, 18h
		push	ax
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		push	cs
		call	near ptr PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		pop	bp
		retf
PagedMemory_WriteByte_2AE02	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	1
		les	bx, [bp+6]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		push	eax
		push	cs
		call	near ptr PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedMemory_ReleaseRange_5BD80 (sub_5BD80 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, libère/réinitialise une plage d'adresses
; paginées (PagedMemory_ResolveAddress_5BBCC ×3). Référencée par Music_ChannelInit_59F87
; (seg123).
; ==============================================================================================
PagedMemory_ReleaseRange_2AE6E	proc far		; CODE XREF: MusicChannel_RegisterSequence_7918+6AP
					; Registry_MainOperationVariant_2A50F+2AP

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
		jnz	short loc_2AE84
		jmp	loc_2AF12
; ���������������������������������������������������������������������������

loc_2AE84:				; CODE XREF: PagedMemory_ReleaseRange_2AE6E+11j
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		mov	[bp+var_A], eax
		push	1
		push	eax
		push	cs
		call	near ptr PagedMemory_ResolveAddress_2ACBA
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
		call	near ptr PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		les	bx, [bp+var_6]
		mov	eax, es:[bx+4]
		cmp	eax, [bp+var_A]
		jnz	short loc_2AF29
		cmp	[bp+var_12], 0
		jz	short loc_2AF25
		push	1
		push	large [bp+var_12]
		push	cs
		call	near ptr PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		les	bx, [bp+var_6]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		add	eax, [bp+var_12]
		cmp	eax, [bp+var_A]
		jnz	short loc_2AF29
		jmp	short loc_2AF25
; ���������������������������������������������������������������������������

loc_2AF12:				; CODE XREF: PagedMemory_ReleaseRange_2AE6E+13j
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jnz	short loc_2AF29

loc_2AF25:				; CODE XREF: PagedMemory_ReleaseRange_2AE6E+78j
					; PagedMemory_ReleaseRange_2AE6E+A2j
		mov	[bp+var_1], 1

loc_2AF29:				; CODE XREF: PagedMemory_ReleaseRange_2AE6E+71j
					; PagedMemory_ReleaseRange_2AE6E+A0j ...
		mov	al, [bp+var_1]
		leave
		retf
PagedMemory_ReleaseRange_2AE6E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedMemory_ReadFormattedString_5BE40 (sub_5BE40 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 279 lignes, NON DÉTAILLÉE — plus gros consommateur de PagedMemory_ResolveAddress_5BBCC (×5)
; combiné à des fonctions de formatage externes (sub_2945/sub_2070/sub_22FC) — probable
; lecture d'une chaîne de texte formatée depuis la mémoire paginée (dialogue de mission ?).
; Candidat pour session dédiée.
; ==============================================================================================
PagedMemory_ReadFormattedString_2AF2E	proc far		; CODE XREF: seg067:01ABP

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
		jnz	short loc_2AF58
		jmp	loc_2B128
; ���������������������������������������������������������������������������

loc_2AF58:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+25j
		push	3AA6h
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		or	si, si
		jnz	short loc_2AF6E
		jmp	loc_2B11E
; ���������������������������������������������������������������������������

loc_2AF6E:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+3Bj
					; PagedMemory_ReadFormattedString_2AF2E+1EDj
		push	si
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	loc_2B128
; ���������������������������������������������������������������������������
		jmp	loc_2B11E
; ���������������������������������������������������������������������������

loc_2AF81:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+209j
		mov	eax, [bp+var_14]
		add	[bp+var_8], eax
		push	1
		push	large [bp+var_8]
		push	cs
		call	near ptr PagedMemory_ResolveAddress_2ACBA
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
		jnb	short loc_2AFC5
		jmp	loc_2B128
; ���������������������������������������������������������������������������

loc_2AFC5:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+92j
		cmp	[bp+var_25], 0
		jz	short loc_2AFD5
		mov	eax, [bp+var_14]
		add	[bp+var_10], eax
		jmp	short loc_2AFDD
; ���������������������������������������������������������������������������

loc_2AFD5:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+9Bj
		mov	eax, [bp+var_14]
		add	[bp+var_C], eax

loc_2AFDD:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+A5j
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
		call	near ptr PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+4]
		cmp	eax, [bp+var_8]
		jnz	short loc_2B05F
		cmp	[bp+var_1C], 0
		jz	short loc_2B05B
		push	1
		push	large [bp+var_1C]
		push	cs
		call	near ptr PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		add	eax, [bp+var_1C]
		cmp	eax, [bp+var_8]
		jnz	short loc_2B05F

loc_2B05B:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+103j
		mov	[bp+var_26], 1

loc_2B05F:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+FCj
					; PagedMemory_ReadFormattedString_2AF2E+12Bj
		cmp	[bp+var_26], 0
		jz	short loc_2B0CA
		mov	al, [bp+var_25]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2B0CA
		push	1
		push	large [bp+var_24]
		push	cs
		call	near ptr PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		cmp	eax, [bp+var_8]
		jnz	short loc_2B094
		mov	ax, 1
		jmp	short loc_2B096
; ���������������������������������������������������������������������������

loc_2B094:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+15Fj
		xor	ax, ax

loc_2B096:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+164j
		mov	[bp+var_26], al
		cmp	[bp+var_26], 0
		jz	short loc_2B0CA
		push	1
		push	large [bp+var_20]
		push	cs
		call	near ptr PagedMemory_ResolveAddress_2ACBA
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		cmp	eax, [bp+var_8]
		jnz	short loc_2B0C5
		mov	ax, 1
		jmp	short loc_2B0C7
; ���������������������������������������������������������������������������

loc_2B0C5:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+190j
		xor	ax, ax

loc_2B0C7:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+195j
		mov	[bp+var_26], al

loc_2B0CA:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+135j
					; PagedMemory_ReadFormattedString_2AF2E+13Ej ...
		mov	al, [bp+var_26]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2B0DC
		push	1507h
		call	sub_30D3
		pop	cx

loc_2B0DC:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+1A3j
		mov	al, [bp+arg_0]
		mov	ah, 0
		or	ax, ax
		jz	short loc_2B128
		cmp	[bp+var_25], 0
		jz	short loc_2B0F1
		cmp	[bp+arg_2], 0
		jnz	short loc_2B128

loc_2B0F1:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+1BBj
		push	large [bp+var_14]
		push	large [bp+var_8]
		cmp	[bp+var_25], 0
		jz	short loc_2B104
		mov	ax, 3AE2h
		jmp	short loc_2B107
; ���������������������������������������������������������������������������

loc_2B104:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+1CFj
		mov	ax, 3AECh

loc_2B107:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+1D4j
		push	ax
		push	3AC2h
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Eh
		or	si, si
		jz	short loc_2B11E
		jmp	loc_2AF6E
; ���������������������������������������������������������������������������

loc_2B11E:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+3Dj
					; PagedMemory_ReadFormattedString_2AF2E+50j ...
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_2B128:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+27j
					; PagedMemory_ReadFormattedString_2AF2E+4Dj ...
		mov	eax, [bp+var_8]
		add	eax, [bp+var_14]
		cmp	eax, dword_46AC2
		jnb	short loc_2B13A
		jmp	loc_2AF81
; ���������������������������������������������������������������������������

loc_2B13A:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+207j
		cmp	[bp+arg_0], 0
		jz	short loc_2B174
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	3AF1h
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	si, si
		jz	short loc_2B16A
		push	si
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_2B174
; ���������������������������������������������������������������������������

loc_2B16A:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+22Bj
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_2B174:				; CODE XREF: PagedMemory_ReadFormattedString_2AF2E+210j
					; PagedMemory_ReadFormattedString_2AF2E+23Aj
		pop	si
		leave
		retf
PagedMemory_ReadFormattedString_2AF2E	endp

seg066		ends
