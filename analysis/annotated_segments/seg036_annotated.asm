seg036		segment	byte public 'CODE' use16
		assume cs:seg036
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,108L — vérifie la présence EMS (INT15 AH=12h/09h), alloue un handle EMS de 8 pages
; (INT67 AH=43h), le mappe en fenêtre (INT67 AH=44h) : allocation d'un bloc de mémoire étendue
; EMS pour ressource streamée (audio/animation), erreurs 0xEEE1/0xEEE2 si échec.
; ==============================================================================================
EMS_AllocateBlock	proc far		; CODE XREF: TextRenderer_Main+370P

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	bx, 4143h
		mov	ax, 1209h
		int	15h
		or	ax, ax

loc_20692:
		jnz	short loc_2069A

loc_20694:
		cmp	bx, 1209h
		jz	short loc_206A5

loc_2069A:				; CODE XREF: EMS_AllocateBlock:loc_20692j
		push	0EEEEh

loc_2069D:
		call	VROOMM_StubThunk_6B70F

loc_206A2:
		pop	cx

loc_206A3:
		jmp	short $+2

loc_206A5:				; CODE XREF: EMS_AllocateBlock+1Aj
		pushf

loc_206A6:
		mov	bx, 534Dh
		mov	ax, 1209h
		int	15h
		popf
		mov	[bp+var_2], bx
		mov	bx, 8
		mov	ah, 43h	; 'C'
		int	67h		;  - LIM EMS - GET HANDLE AND ALLOCATE MEMORY
					; BX = number of logical pages to allocate
					; Return: AH = status
		or	ah, ah
		jz	short loc_206C8
		push	0EEE1h
		call	VROOMM_StubThunk_6B70F
		pop	cx
		jmp	short $+2

loc_206C8:				; CODE XREF: EMS_AllocateBlock+3Dj
		mov	[si+13h], dx
		mov	ax, [si+13h]
		mov	[bp+var_4], ax
		mov	dx, [bp+var_4]
		xor	bx, bx
		mov	ax, 4400h
		int	67h		;  - LIM EMS - MAP MEMORY
					; AL = physical	page number (0-3)
					; BX = logical page number, DX = handle
					; Return: AH = status
		mov	dx, [si+13h]
		mov	cx, 0FFFFh
		mov	bx, 4D55h
		mov	ax, 1209h
		int	15h
		or	ax, ax
		jz	short loc_206F8
		push	0EEE2h
		call	VROOMM_StubThunk_6B70F
		pop	cx
		jmp	short $+2

loc_206F8:				; CODE XREF: EMS_AllocateBlock+6Dj
		cmp	byte ptr [si+10h], 2
		jnz	short loc_2070B
		push	0
		push	si
		nop
		push	cs
		call	near ptr EMS_MapPage
		add	sp, 4

loc_20709:
		jmp	short $+2

loc_2070B:				; CODE XREF: EMS_AllocateBlock+7Ej
		cmp	[bp+var_2], 0
		jnz	short loc_2071B
		pushf

loc_20712:
		mov	bx, 736Dh
		mov	ax, 1209h
		int	15h
		popf

loc_2071B:				; CODE XREF: EMS_AllocateBlock+91j
		pop	si
		leave
		retf
EMS_AllocateBlock	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,50L — libère le handle EMS (INT67 AH=45h) associé à une ressource si alloué (type
; mémoire +0x10==2) : libération d'un bloc EMS.
; ==============================================================================================
EMS_FreeBlock	proc far		; CODE XREF: seg036:01C7p

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+11h], 0FFFFh
		jz	short loc_20758

loc_2072E:
		cmp	byte ptr [si+10h], 2

loc_20732:
		jnz	short loc_20741
		push	0
		push	si

loc_20737:
		nop
		push	cs

loc_20739:
		call	near ptr EMS_MapPage
		add	sp, 4

loc_2073F:
		jmp	short $+2

loc_20741:				; CODE XREF: EMS_FreeBlock:loc_20732j
		mov	ax, [si+13h]

loc_20744:
		mov	[bp+var_2], ax
		mov	dx, [bp+var_2]
		mov	ah, 45h	; 'E'
		int	67h		;  - LIM EMS - RELEASE HANDLE AND MEMORY
					; DX = EMM handle
					; Return: AH = status
		mov	word ptr [si+11h], 0FFFFh
		mov	word ptr [si+13h], 0FFFFh

loc_20758:				; CODE XREF: EMS_FreeBlock+Ej
		pop	si
		leave
		retf
EMS_FreeBlock	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,38L — mappe une page logique EMS donnée (INT67/INT15 AH=12h fonction 0x4D55h) dans la
; fenêtre physique : changement de page EMS active pour une ressource — utilisé pour le
; streaming audio (référencé par le système de timer radio du seg031, ma lecture initiale
; 'déclenchement son' était en fait un changement de page mémoire EMS).
; ==============================================================================================
EMS_MapPage	proc far		; CODE XREF: RadioQueue_ExpireTimer+52P
					; RadioQueue_ExpireTimer+8DP ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	byte ptr [si+10h], 2
		jnz	short loc_20792
		mov	[bp+var_2], di
		mov	dx, [si+13h]
		mov	cx, [bp+var_2]
		mov	bx, 4D55h
		mov	ax, 1209h
		int	15h
		or	ax, ax
		jz	short loc_2078F
		push	0EEE2h
		call	VROOMM_StubThunk_6B70F
		pop	cx
		jmp	short $+2

loc_2078F:				; CODE XREF: EMS_MapPage+27j
		mov	[si+11h], di

loc_20792:				; CODE XREF: EMS_MapPage+12j
		pop	di
		pop	si
		leave
		retf
EMS_MapPage	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,62L — selon le type de mémoire de la ressource (+0x10 : 1=conventionnelle, 2=EMS),
; notifie l'accès (sub_5E576) ou bascule entre page EMS 1/2 (sub_2075B) selon un flag
; d'alternance (+0x11) : accesseur unifié conventionnelle/EMS avec double-buffering de page
; pour ressource streamée.
; ==============================================================================================
Resource_AccessUnified	proc far		; CODE XREF: seg015:01B6P seg015:01EAP ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp

loc_20797:
		mov	bp, sp
		sub	sp, 2
		push	si

loc_2079D:
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+10h], 1
		jnz	short loc_207B8
		push	word ptr [si]
		mov	ax, si
		add	ax, 2
		push	ax
		call	UI_ApplyEncodingHelper_5E576

loc_207B3:				; CODE XREF: Resource_AccessUnified+55j
		add	sp, 4
		jmp	short loc_207ED
; ���������������������������������������������������������������������������

loc_207B8:				; CODE XREF: Resource_AccessUnified+Ej
		cmp	byte ptr [si+10h], 2
		jnz	short loc_207ED
		cmp	word ptr [si+11h], 0
		jz	short loc_207ED
		mov	ax, [si+11h]
		mov	[bp+var_2], ax
		mov	dx, 1
		mov	cl, byte ptr [bp+var_2]
		mov	ch, 0
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		cmp	word ptr [si+11h], 1
		jnz	short loc_207E4
		push	2
		jmp	short loc_207E6
; ���������������������������������������������������������������������������

loc_207E4:				; CODE XREF: Resource_AccessUnified+48j
		push	1

loc_207E6:				; CODE XREF: Resource_AccessUnified+4Cj
		push	si
		push	cs
		call	near ptr EMS_MapPage
		jmp	short loc_207B3
; ���������������������������������������������������������������������������

loc_207ED:				; CODE XREF: Resource_AccessUnified+20j
					; Resource_AccessUnified+26j ...
		pop	si
		leave
		retf
Resource_AccessUnified	endp

; ���������������������������������������������������������������������������

loc_207F0:				; DATA XREF: seg339:off_71E60o
		push	bp
		mov	bp, sp
		mov	word_721E2, 0
		mov	word_721E4, 0

loc_207FF:
		mov	byte_721EF, 0
		mov	word_721F1, 0

loc_2080A:
		mov	word_721F3, 0FFFFh

loc_20810:
		mov	byte_721F0, 0FFh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_20817:				; DATA XREF: seg339:off_71F80o
		push	bp
		mov	bp, sp
		cmp	byte_721F0, 1
		jnz	short loc_2082C
		push	5132h
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		jmp	short $+2

loc_2082C:				; CODE XREF: seg036:01AFj
		cmp	byte_721F0, 2

loc_20831:
		jnz	short loc_2083D
		push	5130h
		push	cs
		call	near ptr EMS_FreeBlock
		pop	cx
		jmp	short $+2

loc_2083D:				; CODE XREF: seg036:loc_20831j
		push	5132h

loc_20840:
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		pop	bp
		retf
seg036		ends
