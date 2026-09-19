seg039		segment	byte public 'CODE' use16
		assume cs:seg039
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,28L — constructeur d'une liste chaînée vide (tête/queue à 0, type 0x1104) : constructeur
; de conteneur liste générique (template C++).
; ==============================================================================================
Container_Construct	proc far		; CODE XREF: Container_ConstructAlloc+1Bp
					; MissionLoader_AssignUnitRosterB_A7E3B+53P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_21E94:
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+2],	ax

loc_21E9C:				; DATA XREF: seg216:01F6o
		mov	[si], ax
		push	1104h
		push	si
		nop
		push	cs
		call	near ptr Container_FindOrInsert
		add	sp, 4
		mov	[si+2],	ax
		mov	[si], ax
		pop	si
		pop	bp
		retf
Container_Construct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,24L — variante de sub_21E90 avec type paramétrable : constructeur de conteneur liste
; générique (variante paramétrée).
; ==============================================================================================
Container_ConstructTyped	proc far		; CODE XREF: seg039:0062p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+2],	ax
		mov	[si], ax
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Container_FindOrInsert
		add	sp, 4
		mov	[si+2],	ax
		mov	[si], ax
		pop	si
		pop	bp
		retf
Container_ConstructTyped	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_21EED
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_21EF8

loc_21EED:				; CODE XREF: seg039:004Dj
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr Container_ConstructTyped
		add	sp, 4

loc_21EF8:				; CODE XREF: seg039:005Bj
		mov	ax, si
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,29L — alloue (sub_658) si null puis construit (sub_21E90) : constructeur avec allocation
; dynamique du conteneur liste.
; ==============================================================================================
Container_ConstructAlloc	proc far		; CODE XREF: seg112:0C80P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_21F16
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_21F1C

loc_21F16:				; CODE XREF: Container_ConstructAlloc+9j
		push	si
		push	cs
		call	near ptr Container_Construct
		pop	cx

loc_21F1C:				; CODE XREF: Container_ConstructAlloc+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
Container_ConstructAlloc	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,31L — destructeur : vide la liste (sub_22392) puis libère si demandé (sub_338) :
; destructeur du conteneur liste générique.
; ==============================================================================================
Container_Destruct	proc far		; CODE XREF: seg112:0DF4P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_21F44
		push	si
		nop
		push	cs
		call	near ptr Container_Clear
		pop	cx
		test	di, 1
		jz	short loc_21F44
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_21F44:				; CODE XREF: Container_Destruct+Dj
					; Container_Destruct+1Aj
		pop	di
		pop	si
		pop	bp
		retf
Container_Destruct	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+6]
		xor	si, si
		push	word ptr [bp+8]
		push	ax
		nop
		push	cs
		call	near ptr Container_FindOrInsert
		add	sp, 4
		mov	dx, ax
		or	dx, dx
		jz	short loc_21F80

loc_21F63:
		mov	bx, [bp+0Ah]
		xor	cx, cx
		or	dx, dx
		jz	short loc_21F7E
		or	bx, bx
		jz	short loc_21F7E
		push	bx
		push	dx
		nop
		push	cs
		call	near ptr Container_KeyCompare
		add	sp, 4
		mov	cx, ax
		jmp	short $+2

loc_21F7E:				; CODE XREF: seg039:00DAj seg039:00DEj
		mov	si, cx

loc_21F80:				; CODE XREF: seg039:00D1j
		or	si, si
		jz	short loc_21F88
		mov	al, 1
		jmp	short loc_21F8A
; ���������������������������������������������������������������������������

loc_21F88:				; CODE XREF: seg039:00F2j
		mov	al, 0

loc_21F8A:				; CODE XREF: seg039:00F6j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,45L — compare deux clés non nulles via sub_22C23 (comparaison de chaînes) : prédicat
; d'égalité de clés du conteneur.
; ==============================================================================================
Container_KeyEquals	proc far		; CODE XREF: Debris_SpawnAtAttachPoint+1D1P
					; Debris_SpawnOrchestrator+1C5P ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [si]
		mov	bx, [bp+arg_2]
		xor	cx, cx
		or	dx, dx
		jz	short loc_21FB4
		or	bx, bx
		jz	short loc_21FB4
		push	bx
		push	dx
		nop
		push	cs
		call	near ptr Container_KeyCompare
		add	sp, 4
		mov	cx, ax
		jmp	short $+2

loc_21FB4:				; CODE XREF: Container_KeyEquals+13j
					; Container_KeyEquals+17j
		mov	[bp+var_2], cx
		cmp	[bp+var_2], 0
		jz	short loc_21FC1
		mov	al, 1
		jmp	short loc_21FC3
; ���������������������������������������������������������������������������

loc_21FC1:				; CODE XREF: Container_KeyEquals+2Ej
		mov	al, 0

loc_21FC3:				; CODE XREF: Container_KeyEquals+32j
		pop	si
		leave
		retf
Container_KeyEquals	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,36L — retire un nœud (di) de la liste chaînée (mise à jour tête/queue/liens) : unlink de
; nœud dans le conteneur liste (opération interne).
; ==============================================================================================
Container_UnlinkNode	proc far		; CODE XREF: Container_RemoveEntry+1Dp

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		cmp	[si], di
		jnz	short loc_21FDD
		mov	ax, [di+9]
		mov	[si], ax

loc_21FDD:				; CODE XREF: Container_UnlinkNode+10j
		cmp	[si+2],	di
		jnz	short loc_21FE5
		mov	[si+2],	dx

loc_21FE5:				; CODE XREF: Container_UnlinkNode+1Aj
		or	dx, dx
		jz	short loc_21FF1
		mov	ax, [di+9]
		mov	bx, dx
		mov	[bx+9],	ax

loc_21FF1:				; CODE XREF: Container_UnlinkNode+21j
		pop	di
		pop	si
		pop	bp
		retf
Container_UnlinkNode	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,29L — recherche (sub_22555) puis retire (sub_2235C) une entrée par clé : suppression
; d'une entrée du conteneur par clé (find+remove).
; ==============================================================================================
Container_FindAndRemove	proc far		; CODE XREF: seg039:0197p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Container_FindByKey
		add	sp, 4
		mov	di, ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Container_RemoveEntry
		add	sp, 4
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
Container_FindAndRemove	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+6]
		push	word ptr [bp+8]
		push	ax
		push	cs
		call	near ptr Container_FindAndRemove
		add	sp, 4
		mov	si, ax
		or	si, si
		jz	short loc_2203E

loc_22033:
		push	3
		push	ax
		nop
		push	cs
		call	near ptr Container_Op_22BFC
		add	sp, 4

loc_2203E:				; CODE XREF: seg039:01A1j
		or	si, si
		jz	short loc_22047
		mov	ax, 1
		jmp	short loc_22049
; ���������������������������������������������������������������������������

loc_22047:				; CODE XREF: seg039:01B0j
		xor	ax, ax

loc_22049:				; CODE XREF: seg039:01B5j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,69L — recherche une entrée existante (sub_22555) ; sinon alloue un nœud (sub_658, 15
; octets), copie la clé (jusqu'à 8 car., sub_2AFB5/sub_2B6D) et l'insère : 'find or insert' du
; conteneur associatif clé→valeur (dictionnaire par nom).
; ==============================================================================================
Container_FindOrInsert	proc far		; CODE XREF: Container_Construct+14p
					; Container_ConstructTyped+14p ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Container_FindByKey
		add	sp, 4
		mov	di, ax
		or	di, di
		jnz	short loc_220B9
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	0Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_220A7
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	8
		push	[bp+var_2]
		push	di
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [di+8], 0
		mov	word ptr [di+9], 0
		xor	ax, ax
		mov	[di+0Dh], ax
		mov	[di+0Bh], ax
		mov	ax, di
		jmp	short loc_220A9
; ���������������������������������������������������������������������������

loc_220A7:				; CODE XREF: Container_FindOrInsert+2Fj
		mov	ax, di

loc_220A9:				; CODE XREF: Container_FindOrInsert+59j
		mov	di, ax
		or	di, di
		jz	short loc_220B9
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Container_Append
		add	sp, 4

loc_220B9:				; CODE XREF: Container_FindOrInsert+1Bj
					; Container_FindOrInsert+61j
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
Container_FindOrInsert	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,35L — insère un nœud en fin de liste (chaînage tête/queue) : append au conteneur liste.
; ==============================================================================================
Container_Append	proc far		; CODE XREF: Container_FindOrInsert+67p
					; TerrainSector_LoadIndexedRecord_9A95A+29DP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_220EB
		mov	word ptr [di+9], 0
		cmp	word ptr [si+2], 0
		jnz	short loc_220E2
		mov	ax, di
		mov	[si+2],	ax
		mov	[si], ax
		jmp	short loc_220EB
; ���������������������������������������������������������������������������

loc_220E2:				; CODE XREF: Container_Append+18j
		mov	bx, [si+2]
		mov	[bx+9],	di
		mov	[si+2],	di

loc_220EB:				; CODE XREF: Container_Append+Dj
					; Container_Append+21j
		pop	di
		pop	si
		pop	bp
		retf
Container_Append	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		xor	di, di
		mov	word ptr [bp-2], 0
		jmp	short loc_22104
; ���������������������������������������������������������������������������

loc_22103:				; CODE XREF: seg039:0283j
		inc	di

loc_22104:				; CODE XREF: seg039:0271j
		lea	ax, [bp-2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr World_IterateObjects
		add	sp, 4
		or	ax, ax
		jnz	short loc_22103
		mov	ax, di
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

loc_22123:
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	word ptr [bp-2], 0
		jmp	short loc_22137
; ���������������������������������������������������������������������������

loc_22130:				; CODE XREF: seg039:02B6j
		mov	ax, di
		dec	di
		or	ax, ax
		jge	short loc_22148

loc_22137:				; CODE XREF: seg039:029Ej
		lea	ax, [bp-2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr World_IterateObjects
		add	sp, 4
		or	ax, ax
		jnz	short loc_22130

loc_22148:				; CODE XREF: seg039:02A5j
		mov	ax, [bp-2]
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,33L — recherche une entrée (sub_22D6C) puis appelle sub_503EB : accès à une entrée du
; conteneur avec traitement associé (probable incrément de référence).
; ==============================================================================================
Container_FindAndTouch	proc far		; CODE XREF: seg065:0169P
					; Camera_UpdateAndNotify_7AFCA+40P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_22150:
		mov	bp, sp
		push	si

loc_22153:
		mov	si, [bp+arg_0]

loc_22156:
		push	[bp+arg_2]

loc_22159:
		push	word ptr [si]
		nop
		push	cs

loc_2215D:
		call	near ptr Container_FindByKeyAlt
		add	sp, 4

loc_22163:
		call	UIScreen_ComputeDerivedFields_503EB
		pop	si
		pop	bp
		retf
Container_FindAndTouch	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [si]
		nop
		push	cs
		call	near ptr Container_Op_22D32
		pop	cx
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,46L — parcourt la liste, notifie chaque nœud actif (flag+5==1) via vtable[0x1C] avec un
; paramètre, puis retourne un compteur global (via vtable[0xB]) : notification en masse des
; entrées actives du conteneur.
; ==============================================================================================
Container_NotifyAllActive	proc far		; CODE XREF: UIScreen_RenderGraphVGA_Wrapper_50E44+11P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_221A3
; ���������������������������������������������������������������������������

loc_2218E:				; CODE XREF: Container_NotifyAllActive+40j
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+5], 1
		jnz	short loc_221A3
		push	[bp+arg_2]
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4

loc_221A3:				; CODE XREF: Container_NotifyAllActive+Fj
					; Container_NotifyAllActive+18j
		cmp	[bp+var_2], 0
		jnz	short loc_221B0
		mov	bx, [si]
		mov	ax, [bx+0Bh]
		jmp	short loc_221B6
; ���������������������������������������������������������������������������

loc_221B0:				; CODE XREF: Container_NotifyAllActive+2Aj
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]

loc_221B6:				; CODE XREF: Container_NotifyAllActive+31j
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_2218E
		pop	si
		leave
		retf
Container_NotifyAllActive	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,31L — remet à zéro 8 compteurs globaux (table 0x5B06) puis appelle sub_221F2 :
; réinitialisation périodique + déclenchement du nettoyage du conteneur (garbage collection).
; ==============================================================================================
WorldObjects_PeriodicGC	proc far		; CODE XREF: CombatTarget_WeaponActionSubsystem+43BP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word_6E1BD, 0
		xor	ax, ax
		jmp	short loc_221E2
; ���������������������������������������������������������������������������

loc_221D3:				; CODE XREF: WorldObjects_PeriodicGC+23j
		mov	bx, ax
		shl	bx, 2
		mov	dword ptr [bx+5B06h], 0
		inc	ax

loc_221E2:				; CODE XREF: WorldObjects_PeriodicGC+Fj
		cmp	ax, 8
		jl	short loc_221D3
		push	word ptr [si]
		nop
		push	cs
		call	near ptr WorldObjects_PurgeExpired
		pop	cx
		pop	si
		pop	bp
		retf
WorldObjects_PeriodicGC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,167L — parcourt la liste, teste chaque nœud (vtable[0x10]=expiré?), récupère un enfant
; (vtable[0]) et le valide (vtable[0xC]) avant de le retirer (sub_22C56) et de le libérer
; (vtable[0x18]) : garbage collector du conteneur — purge des entrées expirées/invalides
; (probable nettoyage des objets détruits du monde de jeu, incrémente le compteur word_6E1BD).
; ==============================================================================================
WorldObjects_PurgeExpired	proc far		; CODE XREF: WorldObjects_PeriodicGC+29p
					; seg076:0567P	...

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= byte ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		jmp	loc_222FF
; ���������������������������������������������������������������������������

loc_22207:				; CODE XREF: WorldObjects_PurgeExpired+127j
		inc	word_6E1BD
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_6], eax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		pop	cx

loc_22224:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_22283
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_14+2],	dx
		mov	word ptr [bp+var_14], ax
		cmp	[bp+var_14], 0
		jz	short loc_22283
		push	0
		push	[bp+var_2]
		push	dx
		push	ax
		les	bx, [bp+var_14]
		mov	bx, es:[bx]

loc_2224F:
		call	dword ptr [bx+0Ch]
		add	sp, 8
		or	al, al
		jz	short loc_22283
		push	[bp+var_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		cmp	[bp+var_2], 0
		jz	short loc_2227E
		push	3
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short $+2

loc_2227E:				; CODE XREF: WorldObjects_PurgeExpired+78j
		mov	[bp+var_2], di
		jmp	short loc_222FF
; ���������������������������������������������������������������������������

loc_22283:				; CODE XREF: WorldObjects_PurgeExpired+36j
					; WorldObjects_PurgeExpired+4Ej ...
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_A], eax
		mov	[bp+var_C], 0
		sub	eax, [bp+var_6]
		mov	[bp+var_10], eax
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_222BA
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		mov	[bp+var_C], al

loc_222BA:				; CODE XREF: WorldObjects_PurgeExpired+B7j
		cmp	[bp+var_C], 6
		jnz	short loc_222CB
		mov	eax, [bp+var_10]
		add	dword_72BB6, eax
		jmp	short loc_222FC
; ���������������������������������������������������������������������������

loc_222CB:				; CODE XREF: WorldObjects_PurgeExpired+CCj
		cmp	[bp+var_C], 0Ch
		jz	short loc_222D7
		cmp	[bp+var_C], 12h
		jnz	short loc_222E2

loc_222D7:				; CODE XREF: WorldObjects_PurgeExpired+DDj
		mov	eax, [bp+var_10]
		add	dword_72BBA, eax
		jmp	short loc_222FC
; ���������������������������������������������������������������������������

loc_222E2:				; CODE XREF: WorldObjects_PurgeExpired+E3j
		cmp	[bp+var_C], 0Bh
		jnz	short loc_222F3
		mov	eax, [bp+var_10]
		add	dword_72BBE, eax
		jmp	short loc_222FC
; ���������������������������������������������������������������������������

loc_222F3:				; CODE XREF: WorldObjects_PurgeExpired+F4j
		mov	eax, [bp+var_10]
		add	dword_72BC2, eax

loc_222FC:				; CODE XREF: WorldObjects_PurgeExpired+D7j
					; WorldObjects_PurgeExpired+EEj ...
		mov	di, [bp+var_2]

loc_222FF:				; CODE XREF: WorldObjects_PurgeExpired+12j
					; WorldObjects_PurgeExpired+8Fj
		cmp	[bp+var_2], 0
		jnz	short loc_2230A
		mov	ax, [si+0Bh]
		jmp	short loc_22310
; ���������������������������������������������������������������������������

loc_2230A:				; CODE XREF: WorldObjects_PurgeExpired+111j
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]

loc_22310:				; CODE XREF: WorldObjects_PurgeExpired+116j
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_2231C
		jmp	loc_22207
; ���������������������������������������������������������������������������

loc_2231C:				; CODE XREF: WorldObjects_PurgeExpired+125j
		pop	di
		pop	si
		leave
		retf
WorldObjects_PurgeExpired	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,41L — (cluster conteneur, taille compatible avec un accesseur ou insertion) — même
; famille que sub_2204C, non détaillée.
; ==============================================================================================
Container_Op_22320	proc far		; CODE XREF: CombatTarget_WeaponActionSubsystem+46AP

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_2233D
; ���������������������������������������������������������������������������

loc_22331:				; CODE XREF: Container_Op_22320+37j
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx

loc_2233D:				; CODE XREF: Container_Op_22320+Fj
		cmp	[bp+var_2], 0
		jnz	short loc_2234A
		mov	bx, [si]
		mov	ax, [bx+0Bh]
		jmp	short loc_22350
; ���������������������������������������������������������������������������

loc_2234A:				; CODE XREF: Container_Op_22320+21j
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]

loc_22350:				; CODE XREF: Container_Op_22320+28j
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_22331
		pop	si
		leave
		retf
Container_Op_22320	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,53L — retire une entrée spécifique du conteneur (via unlink sub_21FC6 identifié en
; amont) : suppression ciblée d'un nœud du conteneur.
; ==============================================================================================
Container_RemoveEntry	proc far		; CODE XREF: Container_FindAndRemove+1Ap
					; seg076:050EP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di

loc_22361:
		mov	si, [bp+arg_0]

loc_22364:
		mov	dx, [bp+arg_2]
		or	dx, dx
		jz	short loc_2238C
		mov	di, [si]
		xor	cx, cx
		jmp	short loc_22388
; ���������������������������������������������������������������������������

loc_22371:				; CODE XREF: Container_RemoveEntry+2Ej
		cmp	di, dx
		jnz	short loc_22383
		push	di
		push	cx
		push	si
		push	cs
		call	near ptr Container_UnlinkNode
		add	sp, 6
		mov	al, 1
		jmp	short loc_2238E
; ���������������������������������������������������������������������������

loc_22383:				; CODE XREF: Container_RemoveEntry+17j
		mov	cx, di
		mov	di, [di+9]

loc_22388:				; CODE XREF: Container_RemoveEntry+13j
		or	di, di
		jnz	short loc_22371

loc_2238C:				; CODE XREF: Container_RemoveEntry+Dj
		mov	al, 0

loc_2238E:				; CODE XREF: Container_RemoveEntry+25j
		pop	di
		pop	si
		pop	bp
		retf
Container_RemoveEntry	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,37L — vide entièrement la liste (libère chaque nœud) : clear/destructeur de contenu du
; conteneur liste.
; ==============================================================================================
Container_Clear	proc far		; CODE XREF: Container_Destruct+12p
					; MissionLoader_AssignUnitRoster_A7D46+8EP ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_223B6
; ���������������������������������������������������������������������������

loc_2239E:				; CODE XREF: Container_Clear+27j
		mov	bx, [si]
		mov	ax, [bx+9]
		mov	[bp+var_2], ax
		push	3
		push	bx
		nop
		push	cs
		call	near ptr Container_Op_22BFC
		add	sp, 4
		mov	ax, [bp+var_2]
		mov	[si], ax

loc_223B6:				; CODE XREF: Container_Clear+Aj
		cmp	word ptr [si], 0
		jnz	short loc_2239E
		xor	ax, ax
		mov	[si+2],	ax
		mov	[si], ax
		pop	si
		leave
		retf
Container_Clear	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — (cluster conteneur) — accesseur ou test additionnel, non détaillé.
; ==============================================================================================
Container_Op_223C5	proc far		; CODE XREF: Collision_MainLoop+234P
					; Collision_MainLoop+257P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	si, [si]
		jmp	short loc_223E7
; ���������������������������������������������������������������������������

loc_223D0:				; CODE XREF: Container_Op_223C5+24j
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Container_Op_22DE5
		add	sp, 4
		or	al, al
		jz	short loc_223E4
		mov	al, 1
		jmp	short loc_223ED
; ���������������������������������������������������������������������������

loc_223E4:				; CODE XREF: Container_Op_223C5+19j
		mov	si, [si+9]

loc_223E7:				; CODE XREF: Container_Op_223C5+9j
		or	si, si
		jnz	short loc_223D0
		mov	al, 0

loc_223ED:				; CODE XREF: Container_Op_223C5+1Dj
		pop	si
		pop	bp
		retf
Container_Op_223C5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — (cluster conteneur) — accesseur ou test additionnel, non détaillé.
; ==============================================================================================
Container_Op_223F0	proc far		; CODE XREF: AIManeuver_BuildRotationAndLookup_7A800+1AP
					; TextScroll_DrawTypewriterFrame_87457:loc_874C5P	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	si, [si]
		jmp	short loc_22412
; ���������������������������������������������������������������������������

loc_223FB:				; CODE XREF: Container_Op_223F0+24j
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Container_Op_22EDF
		add	sp, 4
		or	al, al
		jz	short loc_2240F
		mov	al, 1
		jmp	short loc_22418
; ���������������������������������������������������������������������������

loc_2240F:				; CODE XREF: Container_Op_223F0+19j
		mov	si, [si+9]

loc_22412:				; CODE XREF: Container_Op_223F0+9j
		or	si, si
		jnz	short loc_223FB
		mov	al, 0

loc_22418:				; CODE XREF: Container_Op_223F0+1Dj
		pop	si
		pop	bp
		retf
Container_Op_223F0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,81L — (cluster conteneur) — opération de taille moyenne sur le conteneur, non détaillée.
; ==============================================================================================
Container_Op_2241B	proc far		; CODE XREF: seg030:13BEP
					; CameraScript_ExecuteCOMP_781D0+9FDP ...

var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_E], eax
		push	8
		push	large [bp+var_E]
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	[bp+var_2], 0
		mov	[bp+var_10], 0
		jmp	short loc_22478
; ���������������������������������������������������������������������������

loc_2244B:				; CODE XREF: Container_Op_2241B+6Cj
		mov	bx, [bp+var_10]
		mov	eax, [bx+6]

loc_22452:
		mov	[bp+var_14], eax

loc_22456:
		push	8

loc_22458:
		push	large [bp+var_14]
		push	ss

loc_2245D:
		lea	ax, [bp+var_A]
		push	ax

loc_22461:
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_22472
		mov	ax, 1
		jmp	short loc_22474
; ���������������������������������������������������������������������������

loc_22472:				; CODE XREF: Container_Op_2241B+50j
		xor	ax, ax

loc_22474:				; CODE XREF: Container_Op_2241B+55j
		or	al, al
		jnz	short loc_22489

loc_22478:				; CODE XREF: Container_Op_2241B+2Ej
		lea	ax, [bp+var_10]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr World_IterateObjects
		add	sp, 4
		or	ax, ax
		jnz	short loc_2244B

loc_22489:				; CODE XREF: Container_Op_2241B+5Bj
		mov	ax, [bp+var_10]
		pop	si
		leave
		retf
Container_Op_2241B	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		push	word ptr [bp+8]
		push	si
		nop
		push	cs
		call	near ptr Container_FindByKey
		add	sp, 4
		mov	[si+4],	ax
		cmp	word ptr [si+4], 0
		jz	short loc_224CF
		mov	di, [bp+0Ah]
		cmp	word ptr [di], 0
		jnz	short loc_224BC
		mov	bx, [si+4]
		mov	ax, [bx+0Bh]
		jmp	short loc_224C1
; ���������������������������������������������������������������������������

loc_224BC:				; CODE XREF: seg039:0622j
		mov	bx, [di]
		mov	ax, [bx+2]

loc_224C1:				; CODE XREF: seg039:062Aj
		mov	[di], ax
		cmp	word ptr [di], 0
		jz	short loc_224CF
		mov	bx, [bp+0Ah]
		mov	ax, [bx]
		jmp	short loc_224D6
; ���������������������������������������������������������������������������

loc_224CF:				; CODE XREF: seg039:061Aj seg039:0636j
		mov	bx, [bp+0Ah]
		xor	ax, ax
		mov	[bx], ax

loc_224D6:				; CODE XREF: seg039:063Dj
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,73L — itérateur de la liste globale des objets du monde de jeu, filtré par type
; (paramètre) — largement référencé ailleurs (sub_DF99, sub_15FD3, sub_1CBF3...) pour scanner
; tous les avions/missiles/entités actives : fonction centrale d'itération des objets du
; monde.
; ==============================================================================================
World_IterateObjects	proc far		; CODE XREF: Targeting_AcquireBestThreat+A7AP
					; AI_RadarScanTarget+FEP	...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jnz	short loc_224F9
		mov	ax, [si]
		mov	[si+4],	ax
		xor	ax, ax
		mov	[si+8],	ax
		mov	[si+6],	ax
		jmp	short loc_22546
; ���������������������������������������������������������������������������

loc_224F9:				; CODE XREF: World_IterateObjects+Ej
		mov	ax, [di]
		mov	[si+8],	ax
		push	word ptr [si+8]
		push	si
		nop
		push	cs
		call	near ptr Container_Op_2258E
		add	sp, 4
		mov	[si+4],	ax
		cmp	word ptr [si+4], 0
		jnz	short loc_22546
		mov	word ptr [si+8], 0
		jmp	short loc_22546
; ���������������������������������������������������������������������������

loc_2251A:				; CODE XREF: World_IterateObjects+70j
		cmp	word ptr [si+8], 0
		jnz	short loc_22528
		mov	bx, [si+4]
		mov	ax, [bx+0Bh]
		jmp	short loc_22534
; ���������������������������������������������������������������������������

loc_22528:				; CODE XREF: World_IterateObjects+44j
		mov	ax, [si+8]
		mov	[si+6],	ax
		mov	bx, [si+8]
		mov	ax, [bx+2]

loc_22534:				; CODE XREF: World_IterateObjects+4Cj
		mov	[si+8],	ax
		cmp	word ptr [si+8], 0
		jnz	short loc_2254C
		mov	bx, [si+4]
		mov	ax, [bx+9]
		mov	[si+4],	ax

loc_22546:				; CODE XREF: World_IterateObjects+1Dj
					; World_IterateObjects+37j ...
		cmp	word ptr [si+4], 0
		jnz	short loc_2251A

loc_2254C:				; CODE XREF: World_IterateObjects+61j
		mov	ax, [si+8]
		mov	[di], ax
		pop	di
		pop	si
		pop	bp
		retf
World_IterateObjects	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,47L — recherche une entrée du conteneur par clé (comparaison via sub_21F8D) : lookup par
; clé dans le conteneur associatif.
; ==============================================================================================
Container_FindByKey	proc far		; CODE XREF: Container_FindAndRemove+Ep
					; Container_FindOrInsert+11p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	si, [si]
		jmp	short loc_22584
; ���������������������������������������������������������������������������

loc_22564:				; CODE XREF: Container_FindByKey+31j
		mov	eax, [si]
		cmp	eax, [di]
		jnz	short loc_2257B
		mov	eax, [si+4]
		cmp	eax, [di+4]
		jnz	short loc_2257B
		mov	ax, 1
		jmp	short loc_2257D
; ���������������������������������������������������������������������������

loc_2257B:				; CODE XREF: Container_FindByKey+15j
					; Container_FindByKey+1Fj
		xor	ax, ax

loc_2257D:				; CODE XREF: Container_FindByKey+24j
		or	al, al
		jnz	short loc_22588
		mov	si, [si+9]

loc_22584:				; CODE XREF: Container_FindByKey+Dj
		or	si, si
		jnz	short loc_22564

loc_22588:				; CODE XREF: Container_FindByKey+2Aj
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
Container_FindByKey	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,51L — (cluster conteneur) — variante de recherche/insertion, non détaillée.
; ==============================================================================================
Container_Op_2258E	proc far		; CODE XREF: World_IterateObjects+2Ap
					; Debris_SpawnOrchestrator+20EP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		xor	di, di
		mov	si, [si]
		or	dx, dx
		jnz	short loc_225BC

loc_225A1:				; CODE XREF: Container_Op_2258E+22j
		mov	ax, si
		jmp	short loc_225C2
; ���������������������������������������������������������������������������

loc_225A5:				; CODE XREF: Container_Op_2258E+30j
		or	di, di
		jnz	short loc_225AE
		mov	di, [si+0Bh]
		jmp	short loc_225B5
; ���������������������������������������������������������������������������

loc_225AE:				; CODE XREF: Container_Op_2258E+19j
		cmp	di, dx
		jz	short loc_225A1
		mov	di, [di+2]

loc_225B5:				; CODE XREF: Container_Op_2258E+1Ej
		or	di, di
		jnz	short loc_225BC
		mov	si, [si+9]

loc_225BC:				; CODE XREF: Container_Op_2258E+11j
					; Container_Op_2258E+29j
		or	si, si
		jnz	short loc_225A5
		xor	ax, ax

loc_225C2:				; CODE XREF: Container_Op_2258E+15j
		pop	di
		pop	si
		pop	bp
		retf
Container_Op_2258E	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	byte ptr [bp-1], 0
		jmp	short loc_22612
; ���������������������������������������������������������������������������

loc_225DA:				; CODE XREF: seg039:078Dj
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp-4],	dx
		mov	[bp-6],	ax
		cmp	dword ptr [bp-6], 0
		jz	short loc_22612
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 8
		jz	short loc_2260C
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		cmp	al, 6
		jnz	short loc_22612

loc_2260C:				; CODE XREF: seg039:076Cj
		mov	byte ptr [bp-1], 1
		jmp	short loc_2261F
; ���������������������������������������������������������������������������

loc_22612:				; CODE XREF: seg039:0748j seg039:075Ej ...
		push	di
		push	si
		push	cs
		call	near ptr World_IterateObjects
		add	sp, 4
		or	ax, ax
		jnz	short loc_225DA

loc_2261F:				; CODE XREF: seg039:0780j
		mov	al, [bp-1]
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,173L — parcourt une liste en appelant vtable[0] par nœud avec test d'un flag (+0x1?) :
; itération avec filtrage/traitement conditionnel du conteneur, à approfondir si besoin.
; ==============================================================================================
Container_IterateFiltered	proc far		; CODE XREF: HUDSymbol_ProcessJoystickAndFilter_843B5+20FP
					; HUDSymbol_ProcessJoystickAndFilter_843B5+22BP

var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		jmp	loc_226CE
; ���������������������������������������������������������������������������

loc_22640:				; CODE XREF: Container_IterateFiltered+B8j
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_226CE
		les	bx, [bp+var_8]
		mov	al, es:[bx+11h]
		cmp	al, [bp+arg_A]

loc_22662:
		jnz	short loc_226CE
		mov	di, [bp+var_4]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_1C], eax
		mov	eax, [di+4]
		mov	[bp+var_18], eax
		mov	eax, [di+8]
		mov	[bp+var_14], eax
		mov	di, [bp+var_2]
		add	di, 12h
		mov	eax, [di]
		sub	[bp+var_1C], eax
		mov	eax, [di+4]
		sub	[bp+var_18], eax
		mov	eax, [di+8]
		sub	[bp+var_14], eax
		push	large [bp+var_14]
		push	large [bp+var_18]
		push	large [bp+var_1C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		sar	eax, 8
		cmp	eax, [bp+arg_6]
		jge	short loc_226CE

loc_226C8:				; CODE XREF: Container_IterateFiltered+14Bj
		mov	ax, [bp+var_4]
		jmp	loc_22791
; ���������������������������������������������������������������������������

loc_226CE:				; CODE XREF: Container_IterateFiltered+17j
					; Container_IterateFiltered+30j ...
		lea	ax, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr World_IterateObjects
		add	sp, 4
		or	ax, ax
		jz	short loc_226E1
		jmp	loc_22640
; ���������������������������������������������������������������������������

loc_226E1:				; CODE XREF: Container_IterateFiltered+B6j
		mov	[bp+var_4], 0
		jmp	loc_22774
; ���������������������������������������������������������������������������

loc_226E9:				; CODE XREF: Container_IterateFiltered+166j
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_22774
		les	bx, [bp+var_8]
		mov	al, es:[bx+11h]
		cmp	al, [bp+arg_A]
		jnz	short loc_22774
		mov	di, [bp+var_4]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_1C], eax
		mov	eax, [di+4]
		mov	[bp+var_18], eax
		mov	eax, [di+8]
		mov	[bp+var_14], eax
		mov	di, [bp+var_2]
		add	di, 12h
		mov	eax, [di]
		sub	[bp+var_1C], eax
		mov	eax, [di+4]
		sub	[bp+var_18], eax
		mov	eax, [di+8]
		sub	[bp+var_14], eax
		push	large [bp+var_14]
		push	large [bp+var_18]
		push	large [bp+var_1C]

loc_22753:
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		sar	eax, 8
		cmp	eax, [bp+arg_6]
		jge	short loc_22774
		jmp	loc_226C8
; ���������������������������������������������������������������������������

loc_22774:				; CODE XREF: Container_IterateFiltered+C0j
					; Container_IterateFiltered+D9j ...
		lea	ax, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr World_IterateObjects
		add	sp, 4
		or	ax, ax
		jz	short loc_2278F
		mov	ax, [bp+var_4]
		cmp	ax, [bp+arg_4]
		jz	short loc_2278F
		jmp	loc_226E9
; ���������������������������������������������������������������������������

loc_2278F:				; CODE XREF: Container_IterateFiltered+15Cj
					; Container_IterateFiltered+164j
		xor	ax, ax

loc_22791:				; CODE XREF: Container_IterateFiltered+A5j
		pop	di
		pop	si
		leave
		retf
Container_IterateFiltered	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,380L — grosse fonction du cluster conteneur/monde de jeu (buffer local 0x7C) — à
; approfondir en session dédiée.
; ==============================================================================================
WorldObjects_Cluster_22795	proc far		; CODE XREF: HUD_RenderSymbologyAlt+9E7P
					; HUD_RenderSymbologyAlt+A28P ...

var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= word ptr -4Ch
var_4A		= dword	ptr -4Ah
var_46		= word ptr -46h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword	ptr  0Ch
arg_A		= word ptr  10h
arg_C		= byte ptr  12h
arg_E		= byte ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 7Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		mov	eax, [bp+arg_6]
		mov	[bp+var_C], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	[bp+var_E], 0
		mov	[bp+var_12], 0
		mov	ax, [bp+arg_A]
		mov	[bp+var_18], ax
		movsx	eax, [bp+var_18]
		shl	eax, 8
		mov	[bp+var_1C], eax
		lea	ax, [bp+var_1C]
		push	ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		call	Math_Sin_5483F
		add	sp, 6
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	dx, ax
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_70], eax
		mov	eax, [bx+4]
		mov	[bp+var_6C], eax
		mov	eax, [bx+8]
		mov	[bp+var_68], eax
		mov	[bp+var_20], 0
		cmp	[bp+arg_4], 0
		jz	short loc_2286A
		mov	bx, [bp+arg_4]
		mov	eax, [bx+12h]
		sub	eax, [di+12h]
		mov	[bp+var_7C], eax
		mov	eax, [bx+16h]
		sub	eax, [di+16h]
		mov	[bp+var_78], eax
		mov	eax, [bx+1Ah]
		sub	eax, [di+1Ah]
		mov	[bp+var_74], eax
		push	eax
		push	large [bp+var_78]
		push	large [bp+var_7C]

loc_22852:
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	[bp+var_20], eax

loc_2286A:				; CODE XREF: WorldObjects_Cluster_22795+8Aj
		cmp	[bp+arg_E], 0
		jz	short loc_2288A
		mov	eax, [bp+arg_6]
		mov	[bp+var_34], eax
		shl	eax, 8
		sub	eax, [bp+var_20]
		mov	[bp+var_38], eax
		mov	[bp+var_3C], eax
		jmp	short loc_22899
; ���������������������������������������������������������������������������

loc_2288A:				; CODE XREF: WorldObjects_Cluster_22795+D9j
		mov	eax, [bp+var_20]
		neg	eax
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax

loc_22899:				; CODE XREF: WorldObjects_Cluster_22795+F3j
		mov	[bp+var_2C], eax
		mov	[bp+var_46], 0
		jmp	loc_22A2E
; ���������������������������������������������������������������������������

loc_228A5:				; CODE XREF: WorldObjects_Cluster_22795+2A9j
		push	[bp+var_46]
		mov	bx, [bp+var_46]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_4A+2],	dx
		mov	word ptr [bp+var_4A], ax
		cmp	[bp+var_4A], 0
		jnz	short loc_228C0
		jmp	loc_22A2E
; ���������������������������������������������������������������������������

loc_228C0:				; CODE XREF: WorldObjects_Cluster_22795+126j
		mov	ax, [bp+var_46]
		mov	[bp+var_4C], ax
		cmp	[bp+var_46], di
		jnz	short loc_228CE
		jmp	loc_22A2E
; ���������������������������������������������������������������������������

loc_228CE:				; CODE XREF: WorldObjects_Cluster_22795+134j
		cmp	ax, [bp+arg_4]
		jnz	short loc_228D6
		jmp	loc_22A2E
; ���������������������������������������������������������������������������

loc_228D6:				; CODE XREF: WorldObjects_Cluster_22795+13Cj
		les	bx, [bp+var_4A]
		mov	al, es:[bx+11h]
		cmp	al, [bp+arg_C]
		jz	short loc_228E5
		jmp	loc_22A2E
; ���������������������������������������������������������������������������

loc_228E5:				; CODE XREF: WorldObjects_Cluster_22795+14Bj
		mov	bx, [bp+var_4C]
		mov	eax, [bx+12h]
		sub	eax, [di+12h]
		mov	[bp+var_7C], eax
		mov	eax, [bx+16h]
		sub	eax, [di+16h]
		mov	[bp+var_78], eax
		mov	eax, [bx+1Ah]
		sub	eax, [di+1Ah]
		mov	[bp+var_74], eax
		push	eax
		push	large [bp+var_78]
		push	large [bp+var_7C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_54], eax
		mov	[bp+var_50], eax
		mov	eax, [bp+arg_6]
		mov	[bp+var_58], eax
		shl	eax, 8
		cmp	eax, [bp+var_50]
		jle	short loc_22941
		mov	ax, 1
		jmp	short loc_22943
; ���������������������������������������������������������������������������

loc_22941:				; CODE XREF: WorldObjects_Cluster_22795+1A5j
		xor	ax, ax

loc_22943:				; CODE XREF: WorldObjects_Cluster_22795+1AAj
		or	al, al
		jnz	short loc_2294A
		jmp	loc_22A2E
; ���������������������������������������������������������������������������

loc_2294A:				; CODE XREF: WorldObjects_Cluster_22795+1B0j
		lea	ax, [bp+var_7C]
		push	ax
		call	Targeting_LineOfSightCheck_5593A
		pop	cx
		cmp	[bp+arg_A], 0B4h ; '�'
		jz	short loc_22988
		lea	ax, [bp+var_70]
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		push	ss
		lea	ax, [bp+var_5C]
		push	ax
		call	Targeting_ComputeGeometryHelperA_5505B
		add	sp, 8
		mov	eax, [bp+var_5C]
		cmp	eax, [bp+var_16]
		jl	short loc_2297F
		mov	ax, 1
		jmp	short loc_22981
; ���������������������������������������������������������������������������

loc_2297F:				; CODE XREF: WorldObjects_Cluster_22795+1E3j
		xor	ax, ax

loc_22981:				; CODE XREF: WorldObjects_Cluster_22795+1E8j
		or	al, al
		jnz	short loc_22988
		jmp	loc_22A2E
; ���������������������������������������������������������������������������

loc_22988:				; CODE XREF: WorldObjects_Cluster_22795+1C4j
					; WorldObjects_Cluster_22795+1EEj
		mov	eax, [bp+var_50]
		cmp	eax, [bp+var_8]
		jge	short loc_22997
		mov	ax, 1
		jmp	short loc_22999
; ���������������������������������������������������������������������������

loc_22997:				; CODE XREF: WorldObjects_Cluster_22795+1FBj
		xor	ax, ax

loc_22999:				; CODE XREF: WorldObjects_Cluster_22795+200j
		or	al, al
		jz	short loc_229AD
		mov	eax, [bp+var_50]
		mov	[bp+var_8], eax
		mov	ax, [bp+var_4C]
		mov	[bp+var_4], ax
		jmp	short loc_229D0
; ���������������������������������������������������������������������������

loc_229AD:				; CODE XREF: WorldObjects_Cluster_22795+206j
		mov	eax, [bp+var_50]
		cmp	eax, [bp+var_12]
		jle	short loc_229BC
		mov	ax, 1
		jmp	short loc_229BE
; ���������������������������������������������������������������������������

loc_229BC:				; CODE XREF: WorldObjects_Cluster_22795+220j
		xor	ax, ax

loc_229BE:				; CODE XREF: WorldObjects_Cluster_22795+225j
		or	al, al
		jz	short loc_229D0
		mov	eax, [bp+var_50]
		mov	[bp+var_12], eax
		mov	ax, [bp+var_4C]
		mov	[bp+var_E], ax

loc_229D0:				; CODE XREF: WorldObjects_Cluster_22795+216j
					; WorldObjects_Cluster_22795+22Bj
		mov	eax, [bp+var_50]
		sub	eax, [bp+var_20]
		mov	[bp+var_60], eax
		mov	[bp+var_64], eax
		mov	[bp+var_30], eax
		cmp	[bp+arg_E], 0
		jz	short loc_22A04
		cmp	[bp+var_30], 0
		jle	short loc_22A2E
		cmp	eax, [bp+var_2C]
		jge	short loc_229FC
		mov	ax, 1
		jmp	short loc_229FE
; ���������������������������������������������������������������������������

loc_229FC:				; CODE XREF: WorldObjects_Cluster_22795+260j
		xor	ax, ax

loc_229FE:				; CODE XREF: WorldObjects_Cluster_22795+265j
		or	al, al
		jz	short loc_22A2E
		jmp	short loc_22A20
; ���������������������������������������������������������������������������

loc_22A04:				; CODE XREF: WorldObjects_Cluster_22795+253j
		cmp	[bp+var_30], 0
		jge	short loc_22A2E
		mov	eax, [bp+var_30]
		cmp	eax, [bp+var_2C]
		jle	short loc_22A1A
		mov	ax, 1
		jmp	short loc_22A1C
; ���������������������������������������������������������������������������

loc_22A1A:				; CODE XREF: WorldObjects_Cluster_22795+27Ej
		xor	ax, ax

loc_22A1C:				; CODE XREF: WorldObjects_Cluster_22795+283j
		or	al, al
		jz	short loc_22A2E

loc_22A20:				; CODE XREF: WorldObjects_Cluster_22795+26Dj
		mov	eax, [bp+var_30]
		mov	[bp+var_2C], eax
		mov	ax, [bp+var_4C]
		mov	[bp+var_2], ax

loc_22A2E:				; CODE XREF: WorldObjects_Cluster_22795+10Dj
					; WorldObjects_Cluster_22795+128j ...
		lea	ax, [bp+var_46]
		push	ax
		push	si
		push	cs
		call	near ptr World_IterateObjects
		add	sp, 4
		or	ax, ax
		jz	short loc_22A41
		jmp	loc_228A5
; ���������������������������������������������������������������������������

loc_22A41:				; CODE XREF: WorldObjects_Cluster_22795+2A7j
		cmp	[bp+var_2], 0
		jz	short loc_22A4D
		mov	ax, [bp+var_2]
		mov	[bp+arg_4], ax

loc_22A4D:				; CODE XREF: WorldObjects_Cluster_22795+2B0j
		cmp	[bp+arg_E], 0
		jz	short loc_22A64
		cmp	[bp+var_2], 0
		jnz	short loc_22A76
		cmp	[bp+var_4], 0
		jz	short loc_22A76
		mov	ax, [bp+var_4]
		jmp	short loc_22A73
; ���������������������������������������������������������������������������

loc_22A64:				; CODE XREF: WorldObjects_Cluster_22795+2BCj
		cmp	[bp+var_2], 0
		jnz	short loc_22A76
		cmp	[bp+var_E], 0
		jz	short loc_22A76
		mov	ax, [bp+var_E]

loc_22A73:				; CODE XREF: WorldObjects_Cluster_22795+2CDj
		mov	[bp+arg_4], ax

loc_22A76:				; CODE XREF: WorldObjects_Cluster_22795+2C2j
					; WorldObjects_Cluster_22795+2C8j ...
		mov	ax, [bp+arg_4]
		pop	di
		pop	si
		leave
		retf
WorldObjects_Cluster_22795	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,188L — fonction du cluster conteneur avec 5 arguments (buffer local 0x42) — à
; approfondir en session dédiée.
; ==============================================================================================
WorldObjects_Cluster_22A7D	proc far		; CODE XREF: seg092:0109P

var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h
arg_C		= byte ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 42h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	eax, [bp+arg_4]
		inc	eax
		mov	[bp+var_6], eax
		mov	ax, [bp+arg_2]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		lea	ax, [bp+var_12]
		push	ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		call	Math_Sin_5483F
		add	sp, 6
		push	[bp+var_8]
		mov	bx, [bp+var_8]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_36], eax
		mov	eax, [di+4]
		mov	[bp+var_32], eax
		mov	eax, [di+8]
		mov	[bp+var_2E], eax
		mov	[bp+var_14], 0
		jmp	loc_22BE2
; ���������������������������������������������������������������������������

loc_22AF1:				; CODE XREF: WorldObjects_Cluster_22A7D+175j
		push	[bp+var_14]
		mov	bx, [bp+var_14]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_18+2],	dx
		mov	word ptr [bp+var_18], ax
		cmp	[bp+var_18], 0
		jnz	short loc_22B0C
		jmp	loc_22BE2
; ���������������������������������������������������������������������������

loc_22B0C:				; CODE XREF: WorldObjects_Cluster_22A7D+8Aj
		mov	ax, [bp+var_14]
		mov	[bp+var_1A], ax
		mov	di, [bp+var_1A]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_42], eax
		mov	eax, [di+4]
		mov	[bp+var_3E], eax
		mov	eax, [di+8]
		mov	[bp+var_3A], eax
		mov	di, [bp+var_8]
		add	di, 12h
		mov	eax, [di]
		sub	[bp+var_42], eax
		mov	eax, [di+4]
		sub	[bp+var_3E], eax
		mov	eax, [di+8]
		sub	[bp+var_3A], eax
		push	large [bp+var_3A]
		push	large [bp+var_3E]
		push	large [bp+var_42]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_22], eax
		mov	[bp+var_26], eax
		sar	eax, 8

loc_22B70:
		mov	[bp+var_1E], eax

loc_22B74:
		cmp	[bp+arg_A], 0
		jz	short loc_22B86

loc_22B7A:
		les	bx, [bp+var_18]

loc_22B7D:
		mov	al, es:[bx+11h]

loc_22B81:
		cmp	al, [bp+arg_A]

loc_22B84:
		jnz	short loc_22BE2

loc_22B86:				; CODE XREF: WorldObjects_Cluster_22A7D+FBj
		cmp	[bp+arg_C], 17h
		jz	short loc_22BA1
		push	large [bp+var_18]
		les	bx, [bp+var_18]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, [bp+arg_C]
		jnz	short loc_22BE2

loc_22BA1:				; CODE XREF: WorldObjects_Cluster_22A7D+10Dj
		mov	eax, [bp+var_1E]
		cmp	eax, [bp+var_6]
		jge	short loc_22BE2
		lea	ax, [bp+var_42]
		push	ax
		call	Targeting_LineOfSightCheck_5593A
		pop	cx
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		push	ss
		lea	ax, [bp+var_2A]
		push	ax
		call	Targeting_ComputeGeometryHelperA_5505B
		add	sp, 8
		mov	eax, [bp+var_2A]
		cmp	eax, [bp+var_C]
		jl	short loc_22BE2
		mov	ax, [bp+var_1A]
		mov	[bp+var_2], ax
		mov	eax, [bp+var_1E]
		mov	[bp+var_6], eax

loc_22BE2:				; CODE XREF: WorldObjects_Cluster_22A7D+71j
					; WorldObjects_Cluster_22A7D+8Cj ...
		lea	ax, [bp+var_14]
		push	ax
		push	si
		push	cs
		call	near ptr World_IterateObjects
		add	sp, 4
		or	ax, ax
		jz	short loc_22BF5
		jmp	loc_22AF1
; ���������������������������������������������������������������������������

loc_22BF5:				; CODE XREF: WorldObjects_Cluster_22A7D+173j
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
WorldObjects_Cluster_22A7D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,32L — (cluster conteneur) — accesseur/test, non détaillé.
; ==============================================================================================
Container_Op_22BFC	proc far		; CODE XREF: seg039:01A8p
					; Container_Clear+19p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_22C1F
		push	si
		nop
		push	cs
		call	near ptr Container_Op_22DAB
		pop	cx
		test	di, 1
		jz	short loc_22C1F
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_22C1F:				; CODE XREF: Container_Op_22BFC+Dj
					; Container_Op_22BFC+1Aj
		pop	di
		pop	si
		pop	bp
		retf
Container_Op_22BFC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,36L — comparaison de deux clés (chaînes courtes ≤8 car.) : comparateur de clés du
; dictionnaire (utilisé par sub_21F8D).
; ==============================================================================================
Container_KeyCompare	proc far		; CODE XREF: seg039:00E4p
					; Container_KeyEquals+1Dp ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_22C50
		mov	word ptr [di+2], 0
		cmp	word ptr [si+0Dh], 0
		jnz	short loc_22C47
		mov	ax, di
		mov	[si+0Dh], ax
		mov	[si+0Bh], ax
		jmp	short loc_22C50
; ���������������������������������������������������������������������������

loc_22C47:				; CODE XREF: Container_KeyCompare+18j
		mov	bx, [si+0Dh]
		mov	[bx+2],	di
		mov	[si+0Dh], di

loc_22C50:				; CODE XREF: Container_KeyCompare+Dj
					; Container_KeyCompare+22j
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
Container_KeyCompare	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — retire un nœud spécifique par pointeur (unlink direct) : suppression directe d'un
; nœud connu du conteneur.
; ==============================================================================================
Container_RemoveNode	proc far		; CODE XREF: WorldObjects_PurgeExpired+6Ep
					; Container_Op_22DE5+18p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		cmp	[si+0Bh], di
		jnz	short loc_22C6F
		mov	ax, [di+2]
		mov	[si+0Bh], ax

loc_22C6F:				; CODE XREF: Container_RemoveNode+11j
		cmp	[si+0Dh], di
		jnz	short loc_22C77
		mov	[si+0Dh], dx

loc_22C77:				; CODE XREF: Container_RemoveNode+1Cj
		or	dx, dx
		jz	short loc_22C83
		mov	ax, [di+2]

loc_22C7E:
		mov	bx, dx
		mov	[bx+2],	ax

loc_22C83:				; CODE XREF: Container_RemoveNode+23j
		mov	word ptr [di+2], 0
		pop	di
		pop	si
		pop	bp
		retf
Container_RemoveNode	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,41L — (cluster conteneur) — accesseur/test additionnel, non détaillé.
; ==============================================================================================
Container_Op_22C8C	proc far		; CODE XREF: Debris_BodyDetach+34P
					; seg078:01C9P	...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_22CA9
; ���������������������������������������������������������������������������

loc_22C9D:				; CODE XREF: Container_Op_22C8C+35j
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx

loc_22CA9:				; CODE XREF: Container_Op_22C8C+Fj
		cmp	[bp+var_2], 0
		jnz	short loc_22CB4
		mov	ax, [si+0Bh]
		jmp	short loc_22CBA
; ���������������������������������������������������������������������������

loc_22CB4:				; CODE XREF: Container_Op_22C8C+21j
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]

loc_22CBA:				; CODE XREF: Container_Op_22C8C+26j
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_22C9D
		pop	si
		leave
		retf
Container_Op_22C8C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,63L — (cluster conteneur) — opération de taille moyenne, non détaillée.
; ==============================================================================================
Container_Op_22CC6	proc far		; CODE XREF: Debris_ComputeTorque+3BP

var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	[bp+var_6], 0
		jmp	short loc_22D03
; ���������������������������������������������������������������������������

loc_22CDB:				; CODE XREF: Container_Op_22CC6+55j
		push	[bp+var_6]
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	Debris_ComputeNetForce
		add	sp, 6
		mov	eax, [bp+var_A]
		mov	[bp+var_4], eax
		mov	eax, [di]
		cmp	eax, [bp+var_4]
		jge	short loc_22D03
		mov	eax, [bp+var_4]
		mov	[di], eax

loc_22D03:				; CODE XREF: Container_Op_22CC6+13j
					; Container_Op_22CC6+34j
		cmp	[bp+var_6], 0
		jnz	short loc_22D0E
		mov	ax, [si+0Bh]
		jmp	short loc_22D14
; ���������������������������������������������������������������������������

loc_22D0E:				; CODE XREF: Container_Op_22CC6+41j
		mov	bx, [bp+var_6]
		mov	ax, [bx+2]

loc_22D14:				; CODE XREF: Container_Op_22CC6+46j
		mov	[bp+var_6], ax
		cmp	[bp+var_6], 0
		jnz	short loc_22CDB
		mov	si, di
		mov	eax, [si]
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
Container_Op_22CC6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — (cluster conteneur) — accesseur/test additionnel, non détaillé.
; ==============================================================================================
Container_Op_22D32	proc far		; CODE XREF: seg039:02E6p seg078:010BP ...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_22D4F
; ���������������������������������������������������������������������������

loc_22D43:				; CODE XREF: Container_Op_22D32+35j
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx

loc_22D4F:				; CODE XREF: Container_Op_22D32+Fj
		cmp	[bp+var_2], 0
		jnz	short loc_22D5A
		mov	ax, [si+0Bh]
		jmp	short loc_22D60
; ���������������������������������������������������������������������������

loc_22D5A:				; CODE XREF: Container_Op_22D32+21j
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]

loc_22D60:				; CODE XREF: Container_Op_22D32+26j
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_22D43
		pop	si
		leave
		retf
Container_Op_22D32	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,47L — recherche une entrée par clé avec logique légèrement différente (utilisée par
; sub_2214F) : variante de lookup par clé.
; ==============================================================================================
Container_FindByKeyAlt	proc far		; CODE XREF: Container_FindAndTouch:loc_2215Dp
					; Picking_ResolveSymbol+13P ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si

loc_22D73:
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0

loc_22D7B:
		jmp	short loc_22D8E
; ���������������������������������������������������������������������������

loc_22D7D:				; CODE XREF: Container_FindByKeyAlt+3Aj
		push	[bp+arg_2]
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4

loc_22D8E:				; CODE XREF: Container_FindByKeyAlt:loc_22D7Bj
		cmp	[bp+var_2], 0
		jnz	short loc_22D99
		mov	ax, [si+0Bh]
		jmp	short loc_22D9F
; ���������������������������������������������������������������������������

loc_22D99:				; CODE XREF: Container_FindByKeyAlt+26j
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]

loc_22D9F:				; CODE XREF: Container_FindByKeyAlt+2Bj
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_22D7D
		pop	si
		leave
		retf
Container_FindByKeyAlt	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,41L — (cluster conteneur) — accesseur/test additionnel, non détaillé.
; ==============================================================================================
Container_Op_22DAB	proc far		; CODE XREF: Container_Op_22BFC+12p

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+0Bh]
		jmp	short loc_22DD5
; ���������������������������������������������������������������������������

loc_22DBB:				; CODE XREF: Container_Op_22DAB+2Cj
		mov	ax, [di+2]
		mov	[bp+var_2], ax
		or	di, di
		jz	short loc_22DD2
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short $+2

loc_22DD2:				; CODE XREF: Container_Op_22DAB+18j
		mov	di, [bp+var_2]

loc_22DD5:				; CODE XREF: Container_Op_22DAB+Ej
		or	di, di
		jnz	short loc_22DBB
		xor	ax, ax
		mov	[si+0Dh], ax
		mov	[si+0Bh], ax
		pop	di
		pop	si
		leave
		retf
Container_Op_22DAB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,54L — (cluster conteneur) — opération de taille moyenne, non détaillée.
; ==============================================================================================
Container_Op_22DE5	proc far		; CODE XREF: Container_Op_223C5+11p
					; Debris_ContainerOpWrapper_9B62B+13P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	di, [si+0Bh]
		jmp	short loc_22E1D
; ���������������������������������������������������������������������������

loc_22DF4:				; CODE XREF: Container_Op_22DE5+3Aj
		cmp	di, [bp+arg_2]
		jnz	short loc_22E18
		push	di
		push	dx
		push	si
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		or	di, di
		jz	short loc_22E14
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short $+2

loc_22E14:				; CODE XREF: Container_Op_22DE5+20j
		mov	al, 1
		jmp	short loc_22E23
; ���������������������������������������������������������������������������

loc_22E18:				; CODE XREF: Container_Op_22DE5+12j
		mov	dx, di
		mov	di, [di+2]

loc_22E1D:				; CODE XREF: Container_Op_22DE5+Dj
		or	di, di
		jnz	short loc_22DF4
		mov	al, 0

loc_22E23:				; CODE XREF: Container_Op_22DE5+31j
		pop	di
		pop	si
		pop	bp
		retf
Container_Op_22DE5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,44L — (cluster conteneur) — accesseur/test additionnel, non détaillé.
; ==============================================================================================
Container_Op_22E27	proc far		; CODE XREF: seg087:016CP seg109:0212P ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_22E42
; ���������������������������������������������������������������������������

loc_22E3B:				; CODE XREF: Container_Op_22E27+33j
		mov	ax, dx
		dec	dx
		or	ax, ax
		jle	short loc_22E5C

loc_22E42:				; CODE XREF: Container_Op_22E27+12j
		cmp	[bp+var_2], 0
		jnz	short loc_22E4D
		mov	ax, [si+0Bh]
		jmp	short loc_22E53
; ���������������������������������������������������������������������������

loc_22E4D:				; CODE XREF: Container_Op_22E27+1Fj
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]

loc_22E53:				; CODE XREF: Container_Op_22E27+24j
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_22E3B

loc_22E5C:				; CODE XREF: Container_Op_22E27+19j
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
Container_Op_22E27	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+6]
		mov	eax, [bp+8]
		mov	[bp-0Eh], eax
		push	8
		push	large dword ptr	[bp-0Eh]

loc_22E7A:
		push	ss
		lea	ax, [bp-0Ah]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	byte ptr [bp-2], 0
		mov	word ptr [bp-10h], 0
		jmp	short loc_22EBF
; ���������������������������������������������������������������������������

loc_22E92:				; CODE XREF: seg039:1047j
		mov	bx, [bp-10h]
		mov	eax, [bx+6]
		mov	[bp-14h], eax
		push	8
		push	large dword ptr	[bp-14h]
		push	ss
		lea	ax, [bp-0Ah]
		push	ax
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_22EB9
		mov	ax, 1
		jmp	short loc_22EBB
; ���������������������������������������������������������������������������

loc_22EB9:				; CODE XREF: seg039:1022j
		xor	ax, ax

loc_22EBB:				; CODE XREF: seg039:1027j
		or	al, al
		jnz	short loc_22ED9

loc_22EBF:				; CODE XREF: seg039:1000j
		cmp	word ptr [bp-10h], 0
		jnz	short loc_22ECA
		mov	ax, [si+0Bh]
		jmp	short loc_22ED0
; ���������������������������������������������������������������������������

loc_22ECA:				; CODE XREF: seg039:1033j
		mov	bx, [bp-10h]
		mov	ax, [bx+2]

loc_22ED0:				; CODE XREF: seg039:1038j
		mov	[bp-10h], ax
		cmp	word ptr [bp-10h], 0
		jnz	short loc_22E92

loc_22ED9:				; CODE XREF: seg039:102Dj
		mov	ax, [bp-10h]
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,44L — (cluster conteneur) — accesseur/test additionnel, non détaillé.
; ==============================================================================================
Container_Op_22EDF	proc far		; CODE XREF: Container_Op_223F0+11p
					; Debris_ContainerCompareAndOp_9B6C5+28P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	dx, dx
		mov	di, [si+0Bh]
		jmp	short loc_22F06
; ���������������������������������������������������������������������������

loc_22EEE:				; CODE XREF: Container_Op_22EDF+29j
		cmp	di, [bp+arg_2]
		jnz	short loc_22F01
		push	di
		push	dx
		push	si
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		mov	al, 1
		jmp	short loc_22F0C
; ���������������������������������������������������������������������������

loc_22F01:				; CODE XREF: Container_Op_22EDF+12j
		mov	dx, di
		mov	di, [di+2]

loc_22F06:				; CODE XREF: Container_Op_22EDF+Dj
		or	di, di
		jnz	short loc_22EEE
		mov	al, 0

loc_22F0C:				; CODE XREF: Container_Op_22EDF+20j
		pop	di
		pop	si
		pop	bp
		retf
Container_Op_22EDF	endp

seg039		ends
