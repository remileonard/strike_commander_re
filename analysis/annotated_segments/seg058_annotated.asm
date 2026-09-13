seg058		segment	byte public 'CODE' use16
		assume cs:seg058
		;org 0Ah
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,12L — accesseur identité (retourne arg_0) : getter trivial (probable accès direct à une
; valeur wrapper).
; ==============================================================================================
Value_IdAccessor	proc far		; CODE XREF: ListItem_ConstructThreeParams+9p ListItem_ConstructVector3D+Ap

arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_2B0ED:
		mov	ax, [bp+arg_0]
		pop	bp
		retf
Value_IdAccessor	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,55L — construit un élément avec 3 valeurs 32-bit (arg_4/8/C) et un flag, appelle
; sub_55E65 (probable formatage type sprintf) : construction d'un élément de liste avec 3
; paramètres numériques formatés.
; ==============================================================================================
ListItem_ConstructThreeParams	proc far		; CODE XREF: ListItem_ConstructComplex:loc_2B342p

var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= byte ptr  16h

		push	bp

loc_2B0F3:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Value_IdAccessor
		pop	cx
		mov	al, [bp+arg_10]
		mov	[si], al
		sub	sp, 4
		mov	eax, [bp+arg_C]
		mov	[bp+var_6], eax
		sub	sp, 4
		mov	eax, [bp+arg_8]
		mov	[bp+var_A], eax
		sub	sp, 4
		mov	eax, [bp+arg_4]
		mov	[bp+var_E], eax
		mov	ax, si
		inc	ax
		push	ax
		call	Utility_Helper_55E65
		add	sp, 0Eh

loc_2B131:
		cmp	[bp+arg_10], 0
		jz	short loc_2B141
		mov	ax, si
		inc	ax
		push	ax
		call	Targeting_LineOfSightCheck_5593A
		pop	cx

loc_2B141:				; CODE XREF: ListItem_ConstructThreeParams+43j
		mov	ax, [bp+arg_2]
		mov	[si+0Dh], ax
		pop	si
		pop	bp
		retf
ListItem_ConstructThreeParams	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,45L — copie 3 champs 32-bit consécutifs (12 octets) et un flag depuis un vecteur source
; ; conditionnellement normalise via sub_5593A : construction d'élément avec copie de vecteur
; 3D et normalisation optionnelle.
; ==============================================================================================
ListItem_ConstructVector3D	proc far		; CODE XREF: seg058:02CAp

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Value_IdAccessor
		pop	cx
		mov	al, [bp+arg_6]
		mov	[si], al
		mov	di, [bp+arg_4]
		mov	eax, [di]
		mov	[si+1],	eax

loc_2B167:
		mov	eax, [di+4]
		mov	[si+5],	eax

loc_2B16F:
		mov	eax, [di+8]
		mov	[si+9],	eax
		cmp	[bp+arg_6], 0
		jz	short loc_2B187
		mov	ax, si
		inc	ax
		push	ax
		call	Targeting_LineOfSightCheck_5593A
		pop	cx

loc_2B187:				; CODE XREF: ListItem_ConstructVector3D+31j
		mov	ax, [bp+arg_2]
		mov	[si+0Dh], ax
		pop	di
		pop	si
		pop	bp
		retf
ListItem_ConstructVector3D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,20L — initialise un champ (+6=1, +7=0) puis appelle sub_2B228(100) : initialisation
; d'une barre de progression à 100%.
; ==============================================================================================
ProgressBar_InitFull	proc far		; CODE XREF: seg112:0CC4P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+6], 1
		mov	word ptr [si+7], 0
		push	64h ; 'd'
		push	si
		nop
		push	cs
		call	near ptr ProgressBar_PercentToFixed
		add	sp, 4
		pop	si
		pop	bp
		retf
ProgressBar_InitFull	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — parcourt une liste, libère chaque élément (+4 via sub_338) et le retire
; (sub_5F5A4) : vidage complet d'une liste avec libération mémoire.
; ==============================================================================================
Collection_ClearAndFree	proc far		; CODE XREF: Collection_Destruct+15p

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_2B1DF
; ���������������������������������������������������������������������������

loc_2B1C0:				; CODE XREF: Collection_ClearAndFree+3Fj
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		call	CRT_FreeNear_Wrap
		pop	cx
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_5F5A4
		add	sp, 6
		mov	[bp+var_2], 0

loc_2B1DF:				; CODE XREF: Collection_ClearAndFree+Fj
		lea	ax, [bp+var_2]
		push	ax
		push	si

loc_2B1E4:
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_2B1C0
		pop	si
		leave
		retf
Collection_ClearAndFree	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,36L — destructeur : vide la liste (sub_2B1AF), la libère (sub_5F66B), libère l'objet si
; demandé (sub_338) : destructeur de conteneur de liste.
; ==============================================================================================
Collection_Destruct	proc far		; CODE XREF: seg112:0D80P
					; DATA XREF: seg339:178Ao

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2B224
		mov	word ptr [si], 178Ah
		push	si
		push	cs
		call	near ptr Collection_ClearAndFree
		pop	cx
		mov	word ptr [si], 75Ch
		push	si
		call	LinkedListB_Helper_5F66B
		pop	cx
		test	di, 1
		jz	short loc_2B224
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_2B224:				; CODE XREF: Collection_Destruct+Dj
					; Collection_Destruct+28j
		pop	di
		pop	si
		pop	bp
		retf
Collection_Destruct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,34L — convertit un pourcentage (borné à 100) en valeur fixed-point 8-bit (×256/100),
; stockée à +9 : calcul de remplissage d'une barre de progression (%→pixels).
; ==============================================================================================
ProgressBar_PercentToFixed	proc far		; CODE XREF: ProgressBar_InitFull+15p
					; MissionLoader_LoadPosition_A7A10:loc_A7A78P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_2B22F:
		mov	dx, [bp+arg_2]
		cmp	dx, 64h	; 'd'
		jle	short loc_2B23E
		mov	word ptr [si+9], 100h
		jmp	short loc_2B24C
; ���������������������������������������������������������������������������

loc_2B23E:				; CODE XREF: ProgressBar_PercentToFixed+Dj
		mov	ax, dx
		shl	ax, 8

loc_2B243:
		mov	bx, 64h	; 'd'
		cwd
		idiv	bx
		mov	[si+9],	ax

loc_2B24C:				; CODE XREF: ProgressBar_PercentToFixed+14j
		pop	si
		pop	bp
		retf
ProgressBar_PercentToFixed	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,22L — stocke une valeur (+7) puis appelle sub_2B49F (recalcul) : mise à jour de la
; valeur affichée d'une barre de progression.
; ==============================================================================================
ProgressBar_UpdateValue	proc far		; CODE XREF: MissionLoader_LoadPosition_A7A10+31P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+7],	ax
		push	si
		nop
		push	cs
		call	near ptr ProgressBar_WeightedSum
		pop	cx

loc_2B263:
		pop	si
		pop	bp
		retf
ProgressBar_UpdateValue	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,73L — construit un élément numérique (type 0x1786, valeur arg_2), l'ajoute à la liste
; (sub_5F57F) ; compte les éléments (sub_5F6D5) et court-circuite si ≤1 : ajout d'un élément
; numéroté à une liste avec limite.
; ==============================================================================================
ListItem_AddNumberedLimited	proc far		; CODE XREF: ListItem_ConstructComplex+79p
					; seg058:02DCp

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4

loc_2B26C:
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2B29C
		mov	word ptr [di], 8DAh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 1786h
		mov	ax, [bp+var_4]
		mov	[di+4],	ax
		mov	ax, di
		jmp	short loc_2B29E
; ���������������������������������������������������������������������������

loc_2B29C:				; CODE XREF: ListItem_AddNumberedLimited+1Dj
		mov	ax, di

loc_2B29E:				; CODE XREF: ListItem_AddNumberedLimited+34j
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_5F57F
		add	sp, 4
		push	si
		call	LinkedListB_Helper_5F6D5
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, 1
		ja	short loc_2B2CC
		mov	bx, [bp+arg_2]
		mov	al, [bx]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		or	al, al
		jz	short loc_2B2D0

loc_2B2CC:				; CODE XREF: ListItem_AddNumberedLimited+54j
		mov	byte ptr [si+6], 0

loc_2B2D0:				; CODE XREF: ListItem_AddNumberedLimited+64j
		push	si
		nop
		push	cs
		call	near ptr ProgressBar_WeightedSum
		pop	cx
		pop	di
		pop	si
		leave
		retf
ListItem_AddNumberedLimited	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,85L — construit un élément complexe (17 octets : 3 valeurs 32-bit + 1 flag) :
; construction d'un élément de liste multi-paramètres (probable ligne de
; statistiques/résultats de mission).
; ==============================================================================================
ListItem_ConstructComplex	proc far		; CODE XREF: MissionLoader_LoadPosition_A7A10+CFP

var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_11		= byte ptr -11h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= dword	ptr  12h
arg_10		= byte ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	eax, [bp+arg_4]

loc_2B2F0:
		mov	[bp+var_8], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_C]
		mov	[bp+var_10], eax
		mov	al, [bp+arg_10]
		mov	[bp+var_11], al
		push	11h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2B34C
		mov	al, [bp+var_11]
		push	ax
		sub	sp, 4
		mov	eax, [bp+var_10]
		mov	[bp+var_1C], eax
		sub	sp, 4
		mov	eax, [bp+var_C]
		mov	[bp+var_20], eax

loc_2B332:
		sub	sp, 4

loc_2B335:
		mov	eax, [bp+var_8]
		mov	[bp+var_24], eax

loc_2B33D:
		push	[bp+var_4]
		push	di
		push	cs

loc_2B342:
		call	near ptr ListItem_ConstructThreeParams
		add	sp, 12h
		mov	ax, di
		jmp	short loc_2B34E
; ���������������������������������������������������������������������������

loc_2B34C:				; CODE XREF: ListItem_ConstructComplex+3Bj
		mov	ax, di

loc_2B34E:				; CODE XREF: ListItem_ConstructComplex+6Fj
		mov	[bp+var_2], ax
		push	ax
		push	si
		push	cs
		call	near ptr ListItem_AddNumberedLimited
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
ListItem_ConstructComplex	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+6]

loc_2B369:
		mov	ax, [bp+8]
		mov	[bp-4],	ax
		mov	di, [bp+0Ah]
		mov	eax, [di]
		mov	[bp-12h], eax
		mov	eax, [di+4]
		mov	[bp-0Eh], eax
		mov	eax, [di+8]
		mov	[bp-0Ah], eax
		mov	al, [bp+0Ch]
		mov	[bp-5],	al
		push	11h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_2B3B4
		mov	al, [bp-5]
		push	ax
		lea	ax, [bp-12h]
		push	ax
		push	word ptr [bp-4]
		push	di
		push	cs
		call	near ptr ListItem_ConstructVector3D
		add	sp, 8
		mov	ax, di
		jmp	short loc_2B3B6
; ���������������������������������������������������������������������������

loc_2B3B4:				; CODE XREF: seg058:02BBj
		mov	ax, di

loc_2B3B6:				; CODE XREF: seg058:02D2j
		mov	[bp-2],	ax
		push	ax
		push	si
		push	cs
		call	near ptr ListItem_AddNumberedLimited
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		mov	word ptr [bp-2], 0
		xor	di, di

loc_2B3D8:				; CODE XREF: seg058:030Fj
		lea	ax, [bp-2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4

loc_2B3E5:
		or	ax, ax
		jz	short loc_2B3F1
		mov	ax, di
		inc	di
		cmp	ax, [bp+8]
		jl	short loc_2B3D8

loc_2B3F1:				; CODE XREF: seg058:0307j
		cmp	word ptr [bp-2], 0
		jz	short loc_2B415
		mov	bx, [bp-2]
		mov	ax, [bx+4]
		mov	[bp-4],	ax
		push	0
		push	bx
		push	si
		call	LinkedListB_FindAndDispatch_5F5A4
		add	sp, 6
		push	word ptr [bp-4]
		call	CRT_FreeNear_Wrap
		pop	cx

loc_2B415:				; CODE XREF: seg058:0315j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di

loc_2B421:
		mov	si, [bp+6]

loc_2B424:
		mov	di, [bp+8]
		mov	word ptr [bp-2], 0

loc_2B42C:				; CODE XREF: seg058:0363j
		lea	ax, [bp-2]
		push	ax

loc_2B430:
		push	si

loc_2B431:
		call	LinkedListB_Helper_5F6A9

loc_2B436:
		add	sp, 4
		or	ax, ax
		jz	short loc_2B445
		mov	bx, [bp-2]
		cmp	[bx+4],	di
		jnz	short loc_2B42C

loc_2B445:				; CODE XREF: seg058:035Bj
		cmp	word ptr [bp-2], 0
		jz	short loc_2B460
		push	0
		push	word ptr [bp-2]
		push	si
		call	LinkedListB_FindAndDispatch_5F5A4
		add	sp, 6
		push	di
		call	CRT_FreeNear_Wrap
		pop	cx

loc_2B460:				; CODE XREF: seg058:0369j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_2B464:
		push	bp
		mov	bp, sp

loc_2B467:
		sub	sp, 2

loc_2B46A:
		push	si
		push	di
		mov	si, [bp+6]

loc_2B46F:
		mov	word ptr [bp-2], 0
		xor	di, di

loc_2B476:
		jmp	short loc_2B488
; ���������������������������������������������������������������������������

loc_2B478:				; CODE XREF: seg058:03B7j
		mov	ax, di
		inc	di
		cmp	ax, [bp+8]
		jnz	short loc_2B488
		mov	bx, [bp-2]
		mov	ax, [bx+4]
		jmp	short loc_2B49B
; ���������������������������������������������������������������������������

loc_2B488:				; CODE XREF: seg058:loc_2B476j
					; seg058:039Ej
		lea	ax, [bp-2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_2B478
		xor	ax, ax

loc_2B49B:				; CODE XREF: seg058:03A6j
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,93L — parcourt une liste, accumule une somme pondérée (poids ×valeur par élément, +9
; comme diviseur commun) : calcul de moyenne/somme pondérée sur une liste (barre de
; progression agrégée, ex: chargement multi-fichiers).
; ==============================================================================================
ProgressBar_WeightedSum	proc far		; CODE XREF: ProgressBar_UpdateValue+10p
					; ListItem_AddNumberedLimited+6Dp

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	di, [si+7]
		jmp	short loc_2B4BD
; ���������������������������������������������������������������������������

loc_2B4B4:				; CODE XREF: ProgressBar_WeightedSum+2Dj
		mov	bx, [bp+var_2]
		mov	bx, [bx+4]
		add	di, [bx+0Dh]

loc_2B4BD:				; CODE XREF: ProgressBar_WeightedSum+13j
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_2B4B4
		or	di, di
		jz	short loc_2B530
		jmp	short loc_2B4F8
; ���������������������������������������������������������������������������

loc_2B4D4:				; CODE XREF: ProgressBar_WeightedSum+68j
		mov	bx, [bp+var_2]
		mov	cx, [bx+4]
		mov	bx, cx
		movsx	eax, word ptr [bx+0Dh]

loc_2B4E1:
		movsx	edx, word ptr [si+9]
		imul	eax, edx
		movsx	ebx, di
		cdq
		idiv	ebx
		mov	bx, cx
		mov	[bx+0Fh], ax

loc_2B4F8:				; CODE XREF: ProgressBar_WeightedSum+33j
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_2B4D4
		movsx	eax, word ptr [si+7]
		movsx	edx, word ptr [si+9]
		imul	eax, edx
		movsx	ebx, di
		cdq
		idiv	ebx
		mov	[si+0Bh], ax
		jmp	short loc_2B546
; ���������������������������������������������������������������������������

loc_2B525:				; CODE XREF: ProgressBar_WeightedSum+A0j
		mov	bx, [bp+var_2]
		mov	bx, [bx+4]

loc_2B52B:
		mov	word ptr [bx+0Fh], 0

loc_2B530:				; CODE XREF: ProgressBar_WeightedSum+31j
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_2B525

loc_2B541:
		mov	word ptr [si+0Bh], 0

loc_2B546:				; CODE XREF: ProgressBar_WeightedSum+84j
		pop	di
		pop	si
		leave
		retf
ProgressBar_WeightedSum	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,73L — calcule le produit scalaire de deux vecteurs 3D (di·bx), le compare à 0 : test
; d'orientation de face (dot product normale·direction) pour éclairage ou backface culling —
; utilisé par sub_29A7D (préparation de face triangulaire).
; ==============================================================================================
Render_FaceDotProductTest	proc far		; CODE XREF: Mesh_FacePrepareIndirect+E7P
					; Mesh_FacePrepareIndirect+146P ...

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+0Bh]
		mov	[bp+var_2], ax
		mov	bx, [bp+arg_4]

loc_2B561:
		mov	ax, [di]
		imul	word ptr [bx]

loc_2B565:
		mov	[bp+var_8], ax
		mov	cx, dx
		mov	ax, [di+4]
		imul	word ptr [bx+4]
		add	[bp+var_8], ax
		adc	cx, dx
		mov	ax, [di+8]
		imul	word ptr [bx+8]
		add	ax, [bp+var_8]
		adc	dx, cx
		shl	edx, 10h
		mov	dx, ax
		sar	edx, 8
		mov	[bp+var_6], edx
		cmp	[bp+var_6], 0
		jle	short loc_2B5C6
		mov	bx, [si+2]
		mov	ax, [bx+4]
		mov	[bp+var_A], ax
		mov	bx, [bp+var_A]
		mov	ax, [bx+0Fh]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		mov	edx, [bp+var_6]
		imul	edx, eax
		mov	[bp+var_10], edx
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	ax, word ptr [bp+var_14+1]
		add	[bp+var_2], ax

loc_2B5C6:				; CODE XREF: Render_FaceDotProductTest+49j
		cmp	[bp+var_2], 0FFh
		jle	short loc_2B5D2
		mov	[bp+var_2], 0FFh

loc_2B5D2:				; CODE XREF: Render_FaceDotProductTest+81j
		mov	al, byte ptr [bp+var_2]
		pop	di
		pop	si
		leave
		retf
Render_FaceDotProductTest	endp

; ���������������������������������������������������������������������������

loc_2B5D9:				; DATA XREF: seg339:1786o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	dx, [bp+8]
		or	ax, ax
		jz	short loc_2B5F7
		test	dx, 1
		jz	short loc_2B5F5
		push	ax

loc_2B5ED:
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short loc_2B5F7
; ���������������������������������������������������������������������������

loc_2B5F5:				; CODE XREF: seg058:050Aj
		jmp	short $+2

loc_2B5F7:				; CODE XREF: seg058:0504j seg058:0513j
		pop	bp
		retf
seg058		ends
