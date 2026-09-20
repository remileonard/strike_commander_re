seg081		segment	byte public 'CODE' use16
		assume cs:seg081
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,30L — alloue une table de 200 slots ×4 octets (constructeur String de type mémoire) :
; allocation de la table de résolution de pointeurs faibles (WeakRef).
; ==============================================================================================
WeakRef_TableConstruct	proc far		; CODE XREF: World_ParseWrldForm_A767F+FCP

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si

loc_3A247:				; DATA XREF: seg216:034Eo
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		shl	ax, 2
		mov	[bp+var_2], ax
		push	1
		push	0
		push	2
		movzx	eax, [bp+var_2]
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+4],	dx
		mov	[si+2],	ax
		pop	si
		leave
		retf
WeakRef_TableConstruct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,26L — vide la table (sub_3A3B0) puis libère la mémoire : destructeur du registre de
; pointeurs faibles.
; ==============================================================================================
WeakRef_TableDestruct	proc far		; CODE XREF: MissionLoader_AssignUnitRoster_A7D46+13P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr WeakRef_InvalidateAll
		pop	cx
		push	0
		push	2
		mov	ax, si
		add	ax, 2
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword ptr [si+2], 0
		pop	si
		pop	bp
		retf
WeakRef_TableDestruct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,30L — ajoute un pointeur vers un champ dans le prochain slot libre de la table (max 200
; entrées) : enregistrement d'une référence faible dans le registre global (utilisé par la
; fonction SetReference).
; ==============================================================================================
WeakRef_Register	proc far		; CODE XREF: SetReference16+1Dp
					; SetReference+24p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	word ptr [di], 0C8h ; '�'
		jge	short loc_3A2C9
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		mov	es:[bx+2], ax
		mov	es:[bx], dx

loc_3A2C9:				; CODE XREF: WeakRef_Register+Cj
		pop	di
		pop	si
		pop	bp
		retf
WeakRef_Register	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,66L — retire une entrée du registre correspondant à une valeur donnée (recherche +
; suppression avec compactage) : désenregistrement de toutes les références faibles pointant
; vers une valeur.
; ==============================================================================================
WeakRef_UnregisterByValue	proc far		; CODE XREF: Debris_FindAndUnregister_9B700+5AP

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	[bp+arg_2], 0
		jz	short loc_3A33C
		xor	cx, cx
		jmp	short loc_3A338
; ���������������������������������������������������������������������������

loc_3A2E7:				; CODE XREF: WeakRef_UnregisterByValue+6Dj
		les	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	ax, es:[bx]
		cmp	ax, [bp+arg_2]
		jnz	short loc_3A337
		les	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0
		les	bx, [di+2]
		dec	word ptr [di]
		mov	ax, [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	bx, [di+2]
		mov	si, cx
		shl	si, 2
		add	bx, si
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		inc	[bp+var_2]
		jmp	short loc_3A338
; ���������������������������������������������������������������������������

loc_3A337:				; CODE XREF: WeakRef_UnregisterByValue+2Dj
		inc	cx

loc_3A338:				; CODE XREF: WeakRef_UnregisterByValue+18j
					; WeakRef_UnregisterByValue+68j
		cmp	[di], cx
		jg	short loc_3A2E7

loc_3A33C:				; CODE XREF: WeakRef_UnregisterByValue+14j
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
WeakRef_UnregisterByValue	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,65L — retire une entrée du registre par correspondance exacte (pointeur + segment), met
; le champ cible à zéro : invalidation d'une référence faible spécifique (nullification +
; désenregistrement).
; ==============================================================================================
WeakRef_Invalidate	proc far		; CODE XREF: WeakRef_InvalidateIfSet+12p
					; WeakRef_InvalidateFar+14p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_3A3A6
; ���������������������������������������������������������������������������

loc_3A34F:				; CODE XREF: WeakRef_Invalidate+65j
		les	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		cmp	ax, [bp+arg_4]
		jnz	short loc_3A3A5
		cmp	dx, [bp+arg_2]
		jnz	short loc_3A3A5
		mov	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0
		les	bx, [di+2]
		dec	word ptr [di]
		mov	ax, [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	bx, [di+2]
		mov	si, cx
		shl	si, 2
		add	bx, si
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		mov	ax, 1
		jmp	short loc_3A3AC
; ���������������������������������������������������������������������������

loc_3A3A5:				; CODE XREF: WeakRef_Invalidate+20j
					; WeakRef_Invalidate+25j
		inc	cx

loc_3A3A6:				; CODE XREF: WeakRef_Invalidate+Aj
		cmp	[di], cx
		jg	short loc_3A34F
		xor	ax, ax

loc_3A3AC:				; CODE XREF: WeakRef_Invalidate+60j
		pop	di
		pop	si
		pop	bp
		retf
WeakRef_Invalidate	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,39L — parcourt tout le registre, met à zéro chaque champ cible référencé, vide la table
; : invalidation en masse de toutes les références faibles (reset complet du registre).
; ==============================================================================================
WeakRef_InvalidateAll	proc far		; CODE XREF: WeakRef_TableDestruct+Ap
					; MissionLoader_AssignUnitRosterB_A7E3B+10P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_3A3E1
; ���������������������������������������������������������������������������

loc_3A3BB:				; CODE XREF: WeakRef_InvalidateAll+33j
		les	bx, [si+2]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_3A3E0
		mov	bx, [si+2]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0

loc_3A3E0:				; CODE XREF: WeakRef_InvalidateAll+1Cj
		inc	dx

loc_3A3E1:				; CODE XREF: WeakRef_InvalidateAll+9j
		cmp	[si], dx
		jg	short loc_3A3BB
		mov	word ptr [si], 0
		pop	si
		pop	bp
		retf
WeakRef_InvalidateAll	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,23L — si le champ référencé est non nul, l'invalide via sub_3A343 : wrapper
; d'invalidation conditionnelle d'une référence faible.
; ==============================================================================================
WeakRef_InvalidateIfSet	proc far		; CODE XREF: seg051:015AP seg051:0163P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_3A408
		push	ds
		push	si
		push	59BDh
		push	cs
		call	near ptr WeakRef_Invalidate
		add	sp, 6
		mov	word ptr [si], 0

loc_3A408:				; CODE XREF: WeakRef_InvalidateIfSet+Aj
		pop	si
		pop	bp
		retf
WeakRef_InvalidateIfSet	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,32L — invalide l'ancienne référence (sub_3A3EC) puis assigne et enregistre la nouvelle
; (sub_3A2A2) : variante de SetReference pour un champ 16-bit simple (near pointer).
; ==============================================================================================
SetReference16	proc far		; CODE XREF: AI_SelectWeaponMask_9665+188P
					; Radar_Project3DToScreen+289P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr WeakRef_InvalidateIfSet
		pop	cx
		mov	[si], di
		or	di, di
		jz	short loc_3A42E
		push	ds
		push	si
		push	59BDh
		push	cs
		call	near ptr WeakRef_Register
		add	sp, 6

loc_3A42E:				; CODE XREF: SetReference16+15j
		pop	di
		pop	si
		pop	bp
		retf
SetReference16	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,20L — invalide une référence 32-bit existante si non nulle (appelle sub_3A343) :
; désenregistrement d'une référence faible far avant réassignation (utilisé par SetReference).
; ==============================================================================================
WeakRef_InvalidateFar	proc far		; CODE XREF: seg005:15DCP seg005:1625P ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 0
		jz	short loc_3A44C
		push	word ptr [bp+arg_0+2]
		push	bx
		push	59BDh
		push	cs
		call	near ptr WeakRef_Invalidate
		add	sp, 6

loc_3A44C:				; CODE XREF: WeakRef_InvalidateFar+Aj
		pop	bp
		retf
WeakRef_InvalidateFar	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,31L — fonction 'SetReference' centrale du moteur : invalide l'ancienne référence
; (sub_3A432), assigne la nouvelle valeur au champ cible, puis l'enregistre dans le registre
; global de pointeurs faibles (sub_3A2A2) si non nulle. Référencée des centaines de fois dans
; tout le code IA/GOAL/UI pour assigner en toute sécurité des pointeurs vers des objets
; pouvant être détruits (nettoyés automatiquement par le garbage collector du seg039 via ce
; registre) — pièce manquante centrale du mécanisme de pointeurs faibles du moteur, jamais
; documentée jusqu'ici malgré son usage massif.
; ==============================================================================================
SetReference	proc far		; CODE XREF: Targeting_AcquireBestThreat+48P Targeting_AcquireBestThreat+5CP ...

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr WeakRef_InvalidateFar
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	es:[bx], si
		or	si, si
		jz	short loc_3A478
		push	word ptr [bp+arg_0+2]
		push	bx

loc_3A46E:
		push	59BDh
		push	cs
		call	near ptr WeakRef_Register
		add	sp, 6

loc_3A478:				; CODE XREF: SetReference+1Aj
		pop	si
		pop	bp
		retf
SetReference	endp

seg081		ends
