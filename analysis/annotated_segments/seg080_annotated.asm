seg080		segment	byte public 'CODE' use16
		assume cs:seg080
		;org 9
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,40L — copie position/vitesse (3 composants) et une taille dans une structure de
; particule, marque comme active (+0xE=0) : initialisation d'une particule d'effet visuel
; (fumée/explosion).
; ==============================================================================================
Particle_Init	proc far		; CODE XREF: Explosion_CreateFireball:loc_38E43p
					; Collision_PrepareObjectPair+105P ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], eax
		mov	si, [bp+arg_6]
		mov	eax, [si]
		mov	es:[bx+13h], eax
		mov	eax, [si+4]
		mov	es:[bx+17h], eax
		mov	eax, [si+8]
		mov	es:[bx+1Bh], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_4], eax
		push	8
		push	large [bp+var_4]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 6
		push	word ptr [bp+arg_0+2]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Eh], 0
		pop	si
		leave
		retf
Particle_Init	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,246L — charge le modèle 'BIGSPHER' (sphère d'explosion) via sub_38D89, gère un cache
; global (word_6FBEF/dword_6FBE9) : création de l'effet visuel de boule de feu/explosion
; (sphère de rendu de destruction).
; ==============================================================================================
Explosion_CreateFireball	proc far		; CODE XREF: Collision_PrepareObjectPair+147P

var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= word ptr -3Ch
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= byte ptr -2Eh
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 54h
		push	si
		push	di
		mov	di, [bp+arg_6]
		mov	si, [bp+arg_8]
		or	si, si
		jnz	short loc_38DFB
		jmp	loc_39016
; ���������������������������������������������������������������������������

loc_38DFB:				; CODE XREF: Explosion_CreateFireball+10j
		mov	[bp+var_3C], 1B8Eh
		xor	eax, eax
		mov	[bp+var_32], eax
		mov	[bp+var_36], eax
		mov	[bp+var_2E], al

loc_38E0E:
		mov	[bp+var_3A], 0
		mov	[bp+var_3C], 1BA2h
		cmp	word_6FBEF, 0
		jnz	short loc_38E54
		push	ds

loc_38E23:				; "BIGSPHER"
		push	offset aBigspher
		push	3748h
		mov	eax, dword_6FBE9
		mov	[bp+var_8], eax
		shl	eax, 8
		mov	[bp+var_C], eax
		lea	ax, [bp+var_C]
		push	ax
		push	ss
		lea	ax, [bp+var_3C]
		push	ax
		push	cs

loc_38E43:
		call	near ptr Particle_Init
		add	sp, 0Ch
		lea	ax, [bp+var_3C]
		mov	word ptr [bp+var_4+2], ss
		mov	word ptr [bp+var_4], ax
		jmp	short loc_38E5F
; ���������������������������������������������������������������������������

loc_38E54:				; CODE XREF: Explosion_CreateFireball+3Aj
		les	bx, [si+16h]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax

loc_38E5F:				; CODE XREF: Explosion_CreateFireball+6Cj
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 13h
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		les	dx, [bp+var_10]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[bp+var_48], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_44], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_40], eax
		push	[bp+arg_4]
		push	5722h
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		push	[bp+arg_4]
		lea	ax, [bp+var_48]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		jmp	loc_3900C
; ���������������������������������������������������������������������������

loc_38EAD:				; CODE XREF: Explosion_CreateFireball+22Dj
		mov	eax, dword_728C2
		sub	eax, [di]
		mov	dword_7281A, eax
		mov	eax, dword_728C6
		sub	eax, [di+4]
		mov	dword_7281E, eax
		mov	eax, dword_728CA
		sub	eax, [di+8]
		mov	dword_72822, eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+13h]
		mov	[bp+var_54], eax
		mov	eax, es:[bx+17h]
		mov	[bp+var_50], eax
		mov	eax, es:[bx+1Bh]
		mov	[bp+var_4C], eax
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	5746h
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	eax, [bp+var_54]
		or	eax, [bp+var_50]
		or	eax, [bp+var_4C]

loc_38F12:
		jnz	short loc_38F19
		mov	ax, 1

loc_38F17:
		jmp	short loc_38F1B
; ���������������������������������������������������������������������������

loc_38F19:				; CODE XREF: Explosion_CreateFireball:loc_38F12j
		xor	ax, ax

loc_38F1B:				; CODE XREF: Explosion_CreateFireball:loc_38F17j
		or	al, al

loc_38F1D:
		jz	short loc_38F45
		mov	eax, dword_7281A
		sub	eax, [bp+var_48]
		mov	[bp+var_54], eax
		mov	eax, dword_7281E
		sub	eax, [bp+var_44]
		mov	[bp+var_50], eax
		mov	eax, dword_72822
		sub	eax, [bp+var_40]
		mov	[bp+var_4C], eax
		jmp	short loc_38F84
; ���������������������������������������������������������������������������

loc_38F45:				; CODE XREF: Explosion_CreateFireball:loc_38F1Dj
		push	5746h
		lea	ax, [bp+var_54]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	eax, dword_7281A
		add	[bp+var_54], eax
		mov	eax, dword_7281E
		add	[bp+var_50], eax
		mov	eax, dword_72822
		add	[bp+var_4C], eax
		mov	eax, [bp+var_48]
		sub	[bp+var_54], eax
		mov	eax, [bp+var_44]
		sub	[bp+var_50], eax
		mov	eax, [bp+var_40]
		sub	[bp+var_4C], eax

loc_38F84:				; CODE XREF: Explosion_CreateFireball+15Dj
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Fh]
		les	bx, [bp+var_4]
		add	eax, es:[bx+0Fh]
		mov	[bp+var_14], eax
		push	large [bp+var_4C]
		push	large [bp+var_50]
		push	large [bp+var_54]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		cmp	eax, [bp+var_14]
		jg	short loc_39000
		mov	byte_6EC34, 0
		push	large [bp+var_4]
		push	large [bp+arg_0]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 8
		or	al, al
		jz	short loc_39000
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 6
		mov	[si+6],	ax
		mov	[si+4],	dx
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 6
		mov	[si+0Ah], ax
		mov	[si+8],	dx
		mov	al, 1
		jmp	short loc_39018
; ���������������������������������������������������������������������������

loc_39000:				; CODE XREF: Explosion_CreateFireball+1DAj
					; Explosion_CreateFireball+1F6j
		les	bx, [bp+var_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_4], eax

loc_3900C:				; CODE XREF: Explosion_CreateFireball+C4j
		cmp	[bp+var_4], 0
		jz	short loc_39016
		jmp	loc_38EAD
; ���������������������������������������������������������������������������

loc_39016:				; CODE XREF: Explosion_CreateFireball+12j
					; Explosion_CreateFireball+22Bj
		mov	al, 0

loc_39018:				; CODE XREF: Explosion_CreateFireball+218j
		pop	di
		pop	si
		leave
		retf
Explosion_CreateFireball	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,38L — décrémente un compteur (+0x14), fusionne des liens de liste chaînée (comparaison
; de références) : gestion de liste chaînée de particules (retrait/fusion de nœud).
; ==============================================================================================
Particle_ListMergeNode	proc far		; CODE XREF: seg080:031Dp seg080:038Bp

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		dec	word ptr es:[bx+14h]
		mov	eax, es:[bx]
		cmp	eax, [bp+arg_8]
		jnz	short loc_3903F
		les	bx, [bp+arg_8]
		mov	eax, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx], eax

loc_3903F:				; CODE XREF: Particle_ListMergeNode+12j
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+4]
		cmp	eax, [bp+arg_8]
		jnz	short loc_39056
		mov	eax, [bp+arg_4]
		mov	es:[bx+4], eax

loc_39056:				; CODE XREF: Particle_ListMergeNode+2Fj
		cmp	[bp+arg_4], 0
		jz	short loc_3906D
		les	bx, [bp+arg_8]
		mov	eax, es:[bx+2]
		les	bx, [bp+arg_4]
		mov	es:[bx+2], eax

loc_3906D:				; CODE XREF: Particle_ListMergeNode+3Fj
		pop	bp
		retf
Particle_ListMergeNode	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	dx, [bp+0Ah]
		mov	dword ptr [bp-4], 0
		les	bx, [bp+6]
		mov	eax, es:[bx]
		jmp	short loc_390D0
; ���������������������������������������������������������������������������

loc_39089:				; CODE XREF: seg080:0359j
		mov	ax, dx
		dec	dx
		or	ax, ax
		jnz	short loc_390C0
		push	large dword ptr	[bp-8]
		push	large dword ptr	[bp-4]
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr Particle_ListMergeNode
		add	sp, 0Ch
		mov	eax, [bp-8]
		mov	[bp-0Ch], eax
		push	0
		push	2
		lea	ax, [bp-0Ch]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short locret_390DB
; ���������������������������������������������������������������������������

loc_390C0:				; CODE XREF: seg080:030Ej
		mov	eax, [bp-8]
		mov	[bp-4],	eax
		les	bx, [bp-8]
		mov	eax, es:[bx+2]

loc_390D0:				; CODE XREF: seg080:0307j
		mov	[bp-8],	eax
		cmp	dword ptr [bp-8], 0
		jnz	short loc_39089

locret_390DB:				; CODE XREF: seg080:033Ej
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	dword ptr [bp-4], 0
		les	bx, [bp+6]
		mov	eax, es:[bx]
		jmp	short loc_3913E
; ���������������������������������������������������������������������������

loc_390F4:				; CODE XREF: seg080:03C7j
		mov	eax, [bp+0Ah]
		cmp	eax, [bp-8]
		jnz	short loc_3912E
		push	large dword ptr	[bp-8]
		push	large dword ptr	[bp-4]
		push	large dword ptr	[bp+6]
		push	cs
		call	near ptr Particle_ListMergeNode
		add	sp, 0Ch
		mov	eax, [bp-8]
		mov	[bp-0Ch], eax
		push	0
		push	2
		lea	ax, [bp-0Ch]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short locret_39149
; ���������������������������������������������������������������������������

loc_3912E:				; CODE XREF: seg080:037Cj
		mov	eax, [bp-8]
		mov	[bp-4],	eax
		les	bx, [bp-8]
		mov	eax, es:[bx+2]

loc_3913E:				; CODE XREF: seg080:0372j
		mov	[bp-8],	eax
		cmp	dword ptr [bp-8], 0
		jnz	short loc_390F4

locret_39149:				; CODE XREF: seg080:03ACj
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,83L — parcourt un compteur décroissant appelant potentiellement une résolution (cx
; itérations) : recherche/attente sur un pool d'objets (particules ou débris) avec limite.
; ==============================================================================================
Particle_PoolWait	proc far		; CODE XREF: seg030:19B5P
					; Picking_ComputeDetailed+2C7P ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	cx, [bp+arg_4]
		mov	[bp+var_4], 0
		jmp	short loc_3916E
; ���������������������������������������������������������������������������

loc_3915E:				; CODE XREF: Particle_PoolWait+9Cj
		mov	ax, cx
		dec	cx
		or	ax, ax
		jnz	short loc_3916E
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	locret_391EE
; ���������������������������������������������������������������������������

loc_3916E:				; CODE XREF: Particle_PoolWait+11j
					; Particle_PoolWait+18j
		cmp	[bp+var_4], 0
		jnz	short loc_39187
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		mov	es:[bx+8], eax
		jmp	short $+2

loc_39187:				; CODE XREF: Particle_PoolWait+28j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jnz	short loc_3919D
		mov	eax, es:[bx]
		mov	es:[bx+0Ch], eax
		jmp	short loc_391C1
; ���������������������������������������������������������������������������

loc_3919D:				; CODE XREF: Particle_PoolWait+45j
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Ch]
		mov	es:[bx+8], eax
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx

loc_391C1:				; CODE XREF: Particle_PoolWait+50j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jz	short loc_391D9
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_4], eax
		mov	al, 1
		jmp	short loc_391E3
; ���������������������������������������������������������������������������

loc_391D9:				; CODE XREF: Particle_PoolWait+7Fj
		mov	[bp+var_4], 0
		mov	al, 0

loc_391E3:				; CODE XREF: Particle_PoolWait+8Cj
		or	al, al
		jz	short loc_391EA
		jmp	loc_3915E
; ���������������������������������������������������������������������������

loc_391EA:				; CODE XREF: Particle_PoolWait+9Aj
		xor	dx, dx
		xor	ax, ax

locret_391EE:				; CODE XREF: Particle_PoolWait+20j
		leave
		retf
Particle_PoolWait	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,49L — parcourt une liste chaînée en libérant chaque nœud (sub_5C7B6) : libération
; complète d'une liste chaînée de particules/effets.
; ==============================================================================================
Particle_ListFreeAll	proc far		; CODE XREF: Debris_ReleaseAllParticles_9B7E0+36P

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		jmp	short loc_3922A
; ���������������������������������������������������������������������������

loc_391FF:				; CODE XREF: Particle_ListFreeAll+43j
		les	bx, [bp+var_4]
		mov	eax, es:[bx+2]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]

loc_3920F:
		mov	[bp+var_C], eax

loc_39213:
		push	0

loc_39215:
		push	2
		lea	ax, [bp+var_C]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	eax, [bp+var_8]

loc_3922A:				; CODE XREF: Particle_ListFreeAll+Dj
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_391FF
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+4], eax
		mov	es:[bx], eax
		mov	word ptr es:[bx+14h], 0
		mov	byte ptr es:[bx+16h], 0
		leave
		retf
Particle_ListFreeAll	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,75L — parcourt une liste appelant vtable[0x10] sur chaque élément, réinitialise deux
; champs si liste vide : notification en masse + reset conditionnel d'une liste d'effets.
; ==============================================================================================
Effect_NotifyAndResetList	proc far		; CODE XREF: Collision_PrepareContext+98P
					; Collision_PrepareContext+137P

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_4], 0
		jmp	short loc_39274
; ���������������������������������������������������������������������������

loc_39261:				; CODE XREF: Effect_NotifyAndResetList+9Cj
		push	[bp+arg_4]
		push	large [bp+var_4]
		les	bx, [bp+var_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_39274:				; CODE XREF: Effect_NotifyAndResetList+Ej
		cmp	[bp+var_4], 0
		jnz	short loc_3928D
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+0Ch], eax
		mov	es:[bx+8], eax
		jmp	short $+2

loc_3928D:				; CODE XREF: Effect_NotifyAndResetList+28j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jnz	short loc_392A3
		mov	eax, es:[bx]
		mov	es:[bx+0Ch], eax
		jmp	short loc_392C7
; ���������������������������������������������������������������������������

loc_392A3:				; CODE XREF: Effect_NotifyAndResetList+45j
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+0Ch]
		mov	es:[bx+8], eax
		les	bx, es:[bx+0Ch]
		mov	ax, es:[bx+4]
		mov	dx, es:[bx+2]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx

loc_392C7:				; CODE XREF: Effect_NotifyAndResetList+50j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Ch], 0
		jz	short loc_392DF
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_4], eax
		mov	al, 1
		jmp	short loc_392E9
; ���������������������������������������������������������������������������

loc_392DF:				; CODE XREF: Effect_NotifyAndResetList+7Fj
		mov	[bp+var_4], 0
		mov	al, 0

loc_392E9:				; CODE XREF: Effect_NotifyAndResetList+8Cj
		or	al, al
		jz	short locret_392F0
		jmp	loc_39261
; ���������������������������������������������������������������������������

locret_392F0:				; CODE XREF: Effect_NotifyAndResetList+9Aj
		leave
		retf
Effect_NotifyAndResetList	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,46L — copie 8 octets dans un objet et initialise 3 champs à zéro (position?) :
; initialisation d'un effet visuel/particule avec position nulle.
; ==============================================================================================
Effect_InitZeroPosition	proc far		; CODE XREF: Debris_LoadFieldMixC_9BFB0+44FP

var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		push	8
		push	large [bp+var_4]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 6
		push	word ptr [bp+arg_0+2]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		les	bx, [bp+arg_0]

loc_3931B:
		mov	byte ptr es:[bx+0Eh], 0

loc_39320:
		mov	[bp+var_8], 0

loc_39328:
		mov	eax, [bp+var_8]
		mov	es:[bx+0Fh], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	es:[bx+13h], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	es:[bx+17h], eax
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	es:[bx+1Bh], eax
		leave
		retf
Effect_InitZeroPosition	endp

; ���������������������������������������������������������������������������

loc_39366:				; DATA XREF: seg339:off_6EC66o
		push	bp
		mov	bp, sp
		cmp	dword ptr [bp+0Ah], 0
		jz	short loc_39393
		mov	al, byte_6EC34
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_6EC34, al
		push	large dword ptr	[bp+6]
		push	large dword ptr	[bp+0Ah]
		les	bx, [bp+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		jmp	short loc_39395
; ���������������������������������������������������������������������������

loc_39393:				; CODE XREF: seg080:05EEj
		mov	al, 0

loc_39395:				; CODE XREF: seg080:0611j
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_39397:				; DATA XREF: seg339:off_6EC6Ao
		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	si
		cmp	dword ptr [bp+0Ah], 0
		jnz	short loc_393A8
		jmp	loc_394CA
; ���������������������������������������������������������������������������

loc_393A8:				; CODE XREF: seg080:0623j
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 1Fh
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	si, [bp-4]
		mov	eax, es:[si]
		mov	[bp-38h], eax
		mov	eax, es:[si+4]
		mov	[bp-34h], eax
		mov	eax, es:[si+8]
		mov	[bp-30h], eax
		cmp	byte_6EC34, 0
		jz	short loc_3942F
		mov	eax, dword_7281A
		neg	eax
		mov	[bp-44h], eax
		mov	eax, dword_7281E
		neg	eax
		mov	[bp-40h], eax
		mov	eax, dword_72822
		neg	eax
		mov	[bp-3Ch], eax
		mov	eax, [bp-44h]
		mov	[bp-50h], eax
		mov	eax, [bp-40h]
		mov	[bp-4Ch], eax
		mov	eax, [bp-3Ch]
		mov	[bp-48h], eax
		lea	ax, [bp-50h]
		push	ax

loc_39418:
		lea	ax, [bp-38h]
		push	ax

loc_3941C:
		push	ss
		lea	ax, [bp-0Ch]
		push	ax

loc_39421:
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	eax, [bp-0Ch]
		jmp	short loc_39447
; ���������������������������������������������������������������������������

loc_3942F:				; CODE XREF: seg080:0659j
		push	576Ah
		lea	ax, [bp-38h]
		push	ax
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	eax, [bp-10h]

loc_39447:				; CODE XREF: seg080:06ADj
		mov	[bp-8],	eax
		mov	ax, [bp+0Ch]
		mov	dx, [bp+0Ah]
		add	dx, 0Fh
		mov	[bp-16h], ax
		mov	[bp-18h], dx
		les	bx, [bp-18h]
		mov	eax, es:[bx]
		mov	[bp-14h], eax
		push	large [dword_72822]
		push	large [dword_7281E]
		push	large [dword_7281A]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-20h], eax
		mov	[bp-1Ch], eax
		lea	ax, [bp-8]
		push	ax
		push	ss
		lea	ax, [bp-24h]
		push	ax
		call	Math_SinDeg_54876
		add	sp, 6
		mov	eax, [bp-1Ch]
		mov	edx, [bp-24h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-28h], eax
		mov	eax, [bp-28h]
		mov	[bp-2Ch], eax
		cmp	eax, [bp-14h]
		jge	short loc_394C0
		mov	ax, 1
		jmp	short loc_394C2
; ���������������������������������������������������������������������������

loc_394C0:				; CODE XREF: seg080:0739j
		xor	ax, ax

loc_394C2:				; CODE XREF: seg080:073Ej
		or	al, al
		jz	short loc_394CA
		mov	al, 1
		jmp	short loc_394CC
; ���������������������������������������������������������������������������

loc_394CA:				; CODE XREF: seg080:0625j seg080:0744j
		mov	al, 0

loc_394CC:				; CODE XREF: seg080:0748j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_394CF:				; DATA XREF: seg339:off_6EC6Eo
		push	bp
		mov	bp, sp
		cmp	dword ptr [bp+0Ah], 0
		jz	short loc_394FC
		mov	al, byte_6EC34
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_6EC34, al
		push	large dword ptr	[bp+6]
		push	large dword ptr	[bp+0Ah]
		les	bx, [bp+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		jmp	short loc_394FE
; ���������������������������������������������������������������������������

loc_394FC:				; CODE XREF: seg080:0757j
		mov	al, 0

loc_394FE:				; CODE XREF: seg080:077Aj
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_39500:				; DATA XREF: seg339:off_6EC72o
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_39507:				; DATA XREF: seg339:1BA2o
		push	bp
		mov	bp, sp
		cmp	dword ptr [bp+0Ah], 0
		jz	short loc_39534

loc_39511:
		mov	al, byte_6EC34
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax

loc_3951B:
		mov	byte_6EC34, al

loc_3951E:
		push	large dword ptr	[bp+6]

loc_39522:
		push	large dword ptr	[bp+0Ah]
		les	bx, [bp+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		jmp	short loc_39536
; ���������������������������������������������������������������������������

loc_39534:				; CODE XREF: seg080:078Fj
		mov	al, 0

loc_39536:				; CODE XREF: seg080:07B2j
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_39538:				; DATA XREF: seg339:1BA6o
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3953F:				; DATA XREF: seg339:1BAAo
		push	bp
		mov	bp, sp
		cmp	dword ptr [bp+0Ah], 0
		jz	short loc_3956C
		mov	al, byte_6EC34
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_6EC34, al
		push	large dword ptr	[bp+6]
		push	large dword ptr	[bp+0Ah]
		les	bx, [bp+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		jmp	short loc_3956E
; ���������������������������������������������������������������������������

loc_3956C:				; CODE XREF: seg080:07C7j
		mov	al, 0

loc_3956E:				; CODE XREF: seg080:07EAj
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_39570:				; DATA XREF: seg339:1BAEo
		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		cmp	dword ptr [bp+0Ah], 0
		jnz	short loc_39581
		jmp	loc_39669
; ���������������������������������������������������������������������������

loc_39581:				; CODE XREF: seg080:07FCj
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 13h
		mov	[bp-2],	ax
		mov	[bp-4],	dx
		les	si, [bp-4]
		mov	eax, es:[si]
		mov	[bp-10h], eax
		mov	eax, es:[si+4]
		mov	[bp-0Ch], eax
		mov	eax, es:[si+8]
		mov	[bp-8],	eax
		cmp	byte_6EC34, 0
		jz	short loc_395E0
		push	5746h
		lea	ax, [bp-10h]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	eax, [bp-10h]
		add	dword_7281A, eax
		mov	eax, [bp-0Ch]
		add	dword_7281E, eax
		mov	eax, [bp-8]
		add	dword_72822, eax
		jmp	short loc_39646
; ���������������������������������������������������������������������������

loc_395E0:				; CODE XREF: seg080:0832j
		push	5722h
		lea	ax, [bp-10h]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	eax, [bp-10h]
		sub	eax, dword_7281A
		mov	[bp-1Ch], eax
		mov	eax, [bp-0Ch]
		sub	eax, dword_7281E
		mov	[bp-18h], eax
		mov	eax, [bp-8]
		sub	eax, dword_72822
		mov	[bp-14h], eax
		mov	eax, [bp-1Ch]
		mov	[bp-28h], eax
		mov	eax, [bp-18h]

loc_39622:
		mov	[bp-24h], eax
		mov	eax, [bp-14h]
		mov	[bp-20h], eax
		mov	eax, [bp-28h]
		mov	dword_7281A, eax
		mov	eax, [bp-24h]
		mov	dword_7281E, eax
		mov	eax, [bp-20h]
		mov	dword_72822, eax

loc_39646:				; CODE XREF: seg080:085Ej
		mov	al, byte_6EC34
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_6EC34, al
		push	large dword ptr	[bp+6]
		push	large dword ptr	[bp+0Ah]
		les	bx, [bp+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 8
		jmp	short loc_3966B
; ���������������������������������������������������������������������������

loc_39669:				; CODE XREF: seg080:07FEj
		mov	al, 0

loc_3966B:				; CODE XREF: seg080:08E7j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3966E:				; DATA XREF: seg339:1BCAo
		push	bp
		mov	bp, sp
		cmp	dword ptr [bp+0Ah], 0
		jz	short loc_3969B
		mov	al, byte_6EC34
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_6EC34, al
		push	large dword ptr	[bp+6]
		push	large dword ptr	[bp+0Ah]
		les	bx, [bp+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 8
		jmp	short loc_3969D
; ���������������������������������������������������������������������������

loc_3969B:				; CODE XREF: seg080:08F6j
		mov	al, 0

loc_3969D:				; CODE XREF: seg080:0919j
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3969F:				; DATA XREF: seg339:1BCEo
		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		cmp	dword ptr [bp+0Ah], 0
		jnz	short loc_396B0
		jmp	loc_397DF
; ���������������������������������������������������������������������������

loc_396B0:				; CODE XREF: seg080:092Bj
		les	bx, [bp+0Ah]
		mov	eax, es:[bx+13h]
		mov	[bp-28h], eax
		mov	eax, es:[bx+17h]
		mov	[bp-24h], eax
		mov	eax, es:[bx+1Bh]
		mov	[bp-20h], eax
		cmp	byte_6EC34, 0
		jz	short loc_39701
		push	5722h
		lea	ax, [bp-28h]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	eax, dword_7281A
		sub	[bp-28h], eax
		mov	eax, dword_7281E
		sub	[bp-24h], eax
		mov	eax, dword_72822
		sub	[bp-20h], eax
		push	5746h
		jmp	short loc_3972B
; ���������������������������������������������������������������������������

loc_39701:				; CODE XREF: seg080:0953j
		push	5746h
		lea	ax, [bp-28h]
		push	ax
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	eax, dword_7281A
		add	[bp-28h], eax
		mov	eax, dword_7281E
		add	[bp-24h], eax
		mov	eax, dword_72822
		add	[bp-20h], eax
		push	5722h

loc_3972B:				; CODE XREF: seg080:097Fj
		lea	ax, [bp-28h]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		les	bx, [bp+6]
		mov	eax, es:[bx+23h]
		mov	[bp-4],	eax
		mov	eax, es:[bx+1Fh]
		mov	[bp-8],	eax
		mov	eax, es:[bx+27h]
		mov	[bp-0Ch], eax
		mov	eax, es:[bx+2Bh]
		mov	[bp-10h], eax
		mov	eax, es:[bx+2Fh]
		mov	[bp-14h], eax
		mov	eax, es:[bx+33h]
		mov	[bp-18h], eax
		les	bx, [bp+0Ah]
		mov	eax, es:[bx+0Fh]
		mov	[bp-1Ch], eax
		lea	si, [bp-28h]
		mov	eax, [si]
		sub	eax, [bp-1Ch]
		cmp	eax, [bp-8]
		jg	short loc_397DF
		mov	eax, [si]
		add	eax, [bp-1Ch]
		cmp	eax, [bp-4]
		jl	short loc_397DF
		mov	eax, [bp-24h]
		mov	[si], eax
		mov	eax, [si]
		sub	eax, [bp-1Ch]
		cmp	eax, [bp-0Ch]
		jg	short loc_397DF
		mov	eax, [si]
		add	eax, [bp-1Ch]
		cmp	eax, [bp-10h]
		jl	short loc_397DF
		mov	eax, [bp-20h]
		mov	[si], eax
		mov	eax, [si]
		sub	eax, [bp-1Ch]
		cmp	eax, [bp-14h]
		jg	short loc_397DF
		mov	eax, [si]
		add	eax, [bp-1Ch]
		cmp	eax, [bp-18h]
		jl	short loc_397DF
		mov	al, 1
		jmp	short loc_397E1
; ���������������������������������������������������������������������������

loc_397DF:				; CODE XREF: seg080:092Dj seg080:0A0Aj ...
		mov	al, 0

loc_397E1:				; CODE XREF: seg080:0A5Dj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_397E4:				; DATA XREF: seg339:1BD2o
		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	byte ptr [bp-1], 0
		cmp	dword ptr [bp+0Ah], 0
		jz	short loc_39843
		mov	eax, [bp+0Ah]
		mov	[bp-6],	eax
		push	large dword ptr	[bp-6]
		push	large dword ptr	[bp+6]
		nop
		push	cs
		call	near ptr Effect_GridProjectCorners
		add	sp, 8
		or	al, al
		jz	short loc_39815

loc_39811:
		mov	byte ptr [bp-1], 1

loc_39815:				; CODE XREF: seg080:0A8Fj
		mov	al, [bp-1]

loc_39818:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_39843

loc_3981E:
		mov	al, byte_6EC34
		mov	ah, 0

loc_39823:
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_6EC34, al
		push	large dword ptr	[bp+6]
		push	large dword ptr	[bp-6]
		nop
		push	cs
		call	near ptr Effect_GridProjectCorners
		add	sp, 8
		or	al, al
		jz	short loc_39843
		mov	byte ptr [bp-1], 1

loc_39843:				; CODE XREF: seg080:0A73j seg080:0A9Cj ...
		mov	al, [bp-1]
		leave
		retf
; ���������������������������������������������������������������������������

loc_39848:				; DATA XREF: seg339:1BD6o
		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		cmp	dword ptr [bp+0Ah], 0
		jz	short loc_398C6
		mov	dword ptr [bp-4], 0
		mov	eax, [bp-4]
		mov	dword_72826, eax
		mov	dword ptr [bp-8], 0
		mov	eax, [bp-8]
		mov	dword_7282A, eax
		mov	dword ptr [bp-0Ch], 0
		mov	eax, [bp-0Ch]
		mov	dword_7282E, eax
		mov	ax, [bp+0Ch]
		mov	dx, [bp+0Ah]
		add	dx, 1Fh
		mov	[bp-0Eh], ax
		mov	[bp-10h], dx
		les	si, [bp-10h]
		mov	eax, es:[si]
		mov	dword_72832, eax
		mov	eax, es:[si+4]
		mov	dword_72836, eax
		mov	eax, es:[si+8]
		mov	dword_7283A, eax
		push	large dword ptr	[bp+6]
		nop
		push	cs
		call	near ptr Effect_RenderVolumetric
		add	sp, 4
		or	al, al
		jz	short loc_398C6
		mov	al, 1
		jmp	short loc_398C8
; ���������������������������������������������������������������������������

loc_398C6:				; CODE XREF: seg080:0AD4j seg080:0B40j
		mov	al, 0

loc_398C8:				; CODE XREF: seg080:0B44j
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,47L — calcule un code de sortie combiné (Cohen-Sutherland, 3 axes) pour une bounding box
; vs un point : test de clipping bounding-box pour le rendu de débris/particules.
; ==============================================================================================
Effect_BBoxClipTest	proc far		; CODE XREF: Effect_RenderVolumetric+F5p
					; Effect_RenderVolumetric+106p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		xor	cx, cx
		mov	di, [bp+arg_0]
		mov	es, [bp+arg_2]
		mov	eax, es:[di+1Fh]
		sub	eax, [si]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si]
		sub	eax, es:[di+23h]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, es:[di+27h]
		sub	eax, [si+4]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si+4]
		sub	eax, es:[di+2Bh]
		shl	eax, 1
		rcl	cx, 1

loc_39911:
		mov	eax, es:[di+2Fh]
		sub	eax, [si+8]
		shl	eax, 1
		rcl	cx, 1
		mov	eax, [si+8]
		sub	eax, es:[di+33h]
		shl	eax, 1
		rcl	cx, 1
		mov	al, cl
		pop	di
		pop	si
		pop	bp
		retf
Effect_BBoxClipTest	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,237L — itère une grille (offsets +0x1F/+0x27/+0x2F/+0x33) en projetant les coins vers
; des globals partagés (dword_72826-728...) : préparation géométrique d'une grille de rendu
; (probable overlay/effet de zone).
; ==============================================================================================
Effect_GridProjectCorners	proc far		; CODE XREF: seg080:0A87p seg080:0AB5p

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Fh]
		mov	[bp+var_4], eax
		mov	eax, es:[bx+33h]
		mov	[bp+var_10], eax
		xor	si, si
		jmp	loc_399D7
; ���������������������������������������������������������������������������

loc_39955:				; CODE XREF: Effect_GridProjectCorners+A9j
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_18], eax
		mov	[bp+var_C], eax
		xor	di, di
		jmp	short loc_399D1
; ���������������������������������������������������������������������������

loc_39970:				; CODE XREF: Effect_GridProjectCorners+A1j
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+27h]
		mov	[bp+var_14], eax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_C]
		mov	dword_72826, eax
		mov	eax, [bp+var_8]
		mov	dword_7282A, eax
		mov	eax, [bp+var_4]
		mov	dword_7282E, eax
		mov	eax, [bp+var_18]
		mov	dword_72832, eax
		mov	eax, [bp+var_14]
		mov	dword_72836, eax
		mov	eax, [bp+var_10]
		mov	dword_7283A, eax
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Debug_ToggleWireframeMode
		add	sp, 8
		or	al, al
		jz	short loc_399D0

loc_399CB:				; CODE XREF: Effect_GridProjectCorners+13Cj
					; Effect_GridProjectCorners+1DEj
		mov	al, 1
		jmp	loc_39B25
; ���������������������������������������������������������������������������

loc_399D0:				; CODE XREF: Effect_GridProjectCorners+96j
		inc	di

loc_399D1:				; CODE XREF: Effect_GridProjectCorners+3Bj
		cmp	di, 2
		jl	short loc_39970
		inc	si

loc_399D7:				; CODE XREF: Effect_GridProjectCorners+1Fj
		cmp	si, 2
		jge	short loc_399DF
		jmp	loc_39955
; ���������������������������������������������������������������������������

loc_399DF:				; CODE XREF: Effect_GridProjectCorners+A7j
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+27h]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+2Bh]
		mov	[bp+var_14], eax
		xor	si, si
		jmp	loc_39A79
; ���������������������������������������������������������������������������

loc_399F9:				; CODE XREF: Effect_GridProjectCorners+14Bj
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_18], eax
		mov	[bp+var_C], eax

loc_39A10:
		xor	di, di
		jmp	short loc_39A73
; ���������������������������������������������������������������������������

loc_39A14:				; CODE XREF: Effect_GridProjectCorners+143j
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+2Fh]

loc_39A23:
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		mov	dword_72826, eax
		mov	eax, [bp+var_8]
		mov	dword_7282A, eax
		mov	eax, [bp+var_4]
		mov	dword_7282E, eax
		mov	eax, [bp+var_18]
		mov	dword_72832, eax
		mov	eax, [bp+var_14]
		mov	dword_72836, eax
		mov	eax, [bp+var_10]
		mov	dword_7283A, eax
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Debug_ToggleWireframeMode
		add	sp, 8
		or	al, al
		jz	short loc_39A72
		jmp	loc_399CB
; ���������������������������������������������������������������������������

loc_39A72:				; CODE XREF: Effect_GridProjectCorners+13Aj
		inc	di

loc_39A73:				; CODE XREF: Effect_GridProjectCorners+DFj
		cmp	di, 2
		jl	short loc_39A14
		inc	si

loc_39A79:				; CODE XREF: Effect_GridProjectCorners+C3j
		cmp	si, 2
		jge	short loc_39A81
		jmp	loc_399F9
; ���������������������������������������������������������������������������

loc_39A81:				; CODE XREF: Effect_GridProjectCorners+149j
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+23h]
		mov	[bp+var_18], eax
		xor	si, si
		jmp	loc_39B1B
; ���������������������������������������������������������������������������

loc_39A9B:				; CODE XREF: Effect_GridProjectCorners+1EDj
		mov	ax, si
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+27h]
		mov	[bp+var_14], eax
		mov	[bp+var_8], eax
		xor	di, di
		jmp	short loc_39B15
; ���������������������������������������������������������������������������

loc_39AB6:				; CODE XREF: Effect_GridProjectCorners:loc_39B18j
		mov	ax, di
		shl	ax, 2
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	eax, es:[bx+2Fh]
		mov	[bp+var_10], eax
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		mov	dword_72826, eax
		mov	eax, [bp+var_8]
		mov	dword_7282A, eax
		mov	eax, [bp+var_4]
		mov	dword_7282E, eax
		mov	eax, [bp+var_18]
		mov	dword_72832, eax
		mov	eax, [bp+var_14]
		mov	dword_72836, eax
		mov	eax, [bp+var_10]
		mov	dword_7283A, eax
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Debug_ToggleWireframeMode
		add	sp, 8
		or	al, al
		jz	short loc_39B14
		jmp	loc_399CB
; ���������������������������������������������������������������������������

loc_39B14:				; CODE XREF: Effect_GridProjectCorners+1DCj
		inc	di

loc_39B15:				; CODE XREF: Effect_GridProjectCorners+181j
		cmp	di, 2

loc_39B18:
		jl	short loc_39AB6
		inc	si

loc_39B1B:				; CODE XREF: Effect_GridProjectCorners+165j
		cmp	si, 2

loc_39B1E:
		jge	short loc_39B23
		jmp	loc_39A9B
; ���������������������������������������������������������������������������

loc_39B23:				; CODE XREF: Effect_GridProjectCorners:loc_39B1Ej
		mov	al, 0

loc_39B25:				; CODE XREF: Effect_GridProjectCorners+9Aj
		pop	di
		pop	si
		leave
		retf
Effect_GridProjectCorners	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,589L — grosse fonction du cluster effets/débris (buffer local 0x1A0) appelée par
; sub_3A1C6 : candidat pour le rendu détaillé d'un effet visuel complexe (explosion/fumée
; volumétrique), à approfondir.
; ==============================================================================================
Effect_RenderVolumetric	proc far		; CODE XREF: seg080:0B38p
					; Debug_ToggleWireframeMode+52p

var_1A0		= dword	ptr -1A0h
var_19C		= dword	ptr -19Ch
var_198		= dword	ptr -198h
var_194		= dword	ptr -194h
var_190		= dword	ptr -190h
var_18C		= dword	ptr -18Ch
var_188		= dword	ptr -188h
var_184		= dword	ptr -184h
var_180		= dword	ptr -180h
var_17C		= dword	ptr -17Ch
var_178		= dword	ptr -178h
var_174		= dword	ptr -174h
var_170		= dword	ptr -170h
var_16C		= dword	ptr -16Ch
var_168		= dword	ptr -168h
var_164		= dword	ptr -164h
var_160		= dword	ptr -160h
var_15C		= dword	ptr -15Ch
var_158		= dword	ptr -158h
var_154		= dword	ptr -154h
var_150		= dword	ptr -150h
var_14C		= dword	ptr -14Ch
var_148		= dword	ptr -148h
var_144		= dword	ptr -144h
var_140		= dword	ptr -140h
var_13C		= dword	ptr -13Ch
var_138		= dword	ptr -138h
var_134		= dword	ptr -134h
var_130		= dword	ptr -130h
var_12C		= dword	ptr -12Ch
var_128		= dword	ptr -128h
var_124		= dword	ptr -124h
var_120		= dword	ptr -120h
var_11C		= dword	ptr -11Ch
var_118		= dword	ptr -118h
var_114		= dword	ptr -114h
var_110		= dword	ptr -110h
var_10C		= dword	ptr -10Ch
var_108		= dword	ptr -108h
var_104		= dword	ptr -104h
var_100		= dword	ptr -100h
var_FC		= dword	ptr -0FCh
var_F8		= dword	ptr -0F8h
var_F4		= dword	ptr -0F4h
var_F0		= dword	ptr -0F0h
var_EC		= dword	ptr -0ECh
var_E8		= dword	ptr -0E8h
var_E4		= dword	ptr -0E4h
var_E0		= dword	ptr -0E0h
var_DC		= dword	ptr -0DCh
var_D8		= dword	ptr -0D8h
var_D4		= dword	ptr -0D4h
var_D0		= dword	ptr -0D0h
var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
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
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
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
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1ACh
		mov	[bp+var_2], 0
		mov	[bp+var_3], 0
		cmp	byte_6EC34, 0
		jz	short loc_39B88
		mov	eax, dword_7281A
		sub	dword_72826, eax
		mov	eax, dword_7281E
		sub	dword_7282A, eax
		mov	eax, dword_72822
		sub	dword_7282E, eax
		mov	eax, dword_7281A
		sub	dword_72832, eax
		mov	eax, dword_7281E
		sub	dword_72836, eax
		mov	eax, dword_72822
		sub	dword_7283A, eax
		push	5746h
		push	5776h
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		push	5746h
		jmp	short loc_39BCF
; ���������������������������������������������������������������������������

loc_39B88:				; CODE XREF: Effect_RenderVolumetric+14j
		mov	eax, dword_7281A
		add	dword_72826, eax
		mov	eax, dword_7281E
		add	dword_7282A, eax
		mov	eax, dword_72822
		add	dword_7282E, eax
		mov	eax, dword_7281A
		add	dword_72832, eax
		mov	eax, dword_7281E
		add	dword_72836, eax
		mov	eax, dword_72822
		add	dword_7283A, eax
		push	5722h
		push	5776h
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		push	5722h

loc_39BCF:				; CODE XREF: Effect_RenderVolumetric+5Dj
		push	5782h
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+23h]
		mov	[bp+var_C], eax
		mov	eax, es:[bx+1Fh]
		mov	[bp+var_10], eax
		mov	eax, es:[bx+27h]
		mov	[bp+var_14], eax
		mov	eax, es:[bx+2Bh]
		mov	[bp+var_18], eax
		mov	eax, es:[bx+2Fh]
		mov	[bp+var_1C], eax
		mov	eax, es:[bx+33h]
		mov	[bp+var_20], eax
		jmp	loc_3A1B5
; ���������������������������������������������������������������������������

loc_39C16:				; CODE XREF: Effect_RenderVolumetric+695j
		push	5776h
		push	large [bp+arg_0]
		push	cs
		call	near ptr Effect_BBoxClipTest
		add	sp, 6
		mov	[bp+var_1], al
		push	5782h
		push	large [bp+arg_0]
		push	cs
		call	near ptr Effect_BBoxClipTest
		add	sp, 6
		mov	bl, al
		mov	al, [bp+var_1]
		cbw
		or	ax, ax
		jz	short loc_39C46
		mov	al, bl
		cbw
		or	ax, ax
		jnz	short loc_39C51

loc_39C46:				; CODE XREF: Effect_RenderVolumetric+114j
		mov	[bp+var_2], 1
		mov	[bp+var_3], 1
		jmp	loc_3A1B5
; ���������������������������������������������������������������������������

loc_39C51:				; CODE XREF: Effect_RenderVolumetric+11Bj
		test	[bp+var_1], bl
		jz	short loc_39C61
		mov	[bp+var_2], 1
		mov	[bp+var_3], 0
		jmp	loc_3A1B5
; ���������������������������������������������������������������������������

loc_39C61:				; CODE XREF: Effect_RenderVolumetric+12Bj
		test	[bp+var_1], 20h
		jnz	short loc_39C6A
		jmp	loc_39D33
; ���������������������������������������������������������������������������

loc_39C6A:				; CODE XREF: Effect_RenderVolumetric+13Cj
		mov	eax, [bp+var_10]
		sub	eax, dword_72826
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	[bp+var_8], eax
		mov	eax, dword_72832
		sub	eax, dword_72826
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_30]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_10]
		mov	dword_72826, eax
		mov	eax, dword_72836
		sub	eax, dword_7282A
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_38]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	eax, dword_7282A
		add	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	dword_7282A, eax
		mov	eax, dword_7283A
		sub	eax, dword_7282E
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax

loc_39D20:
		mov	eax, dword_7282E
		add	eax, [bp+var_58]
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		jmp	loc_3A1B1
; ���������������������������������������������������������������������������

loc_39D33:				; CODE XREF: Effect_RenderVolumetric+13Ej
		test	[bp+var_1], 10h
		jnz	short loc_39D3C
		jmp	loc_39E10
; ���������������������������������������������������������������������������

loc_39D3C:				; CODE XREF: Effect_RenderVolumetric+20Ej
		mov	eax, [bp+var_C]
		sub	eax, dword_72826
		mov	[bp+var_64], eax
		mov	[bp+var_68], eax
		mov	[bp+var_8], eax
		mov	eax, dword_72832
		sub	eax, dword_72826
		mov	[bp+var_6C], eax
		mov	[bp+var_70], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_70]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_C]
		mov	dword_72826, eax
		mov	eax, dword_72836
		sub	eax, dword_7282A
		mov	[bp+var_74], eax
		mov	[bp+var_78], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_78]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_80], eax
		mov	eax, dword_7282A
		add	eax, [bp+var_80]
		mov	[bp+var_84], eax
		mov	[bp+var_88], eax
		mov	dword_7282A, eax
		mov	eax, dword_7283A
		sub	eax, dword_7282E
		mov	[bp+var_8C], eax
		mov	[bp+var_90], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_90]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_98], eax
		mov	eax, dword_7282E
		add	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		mov	[bp+var_A0], eax
		jmp	loc_3A1B1
; ���������������������������������������������������������������������������

loc_39E10:				; CODE XREF: Effect_RenderVolumetric+210j
		test	[bp+var_1], 8

loc_39E14:
		jnz	short loc_39E19
		jmp	loc_39EF9
; ���������������������������������������������������������������������������

loc_39E19:				; CODE XREF: Effect_RenderVolumetric:loc_39E14j
		mov	eax, [bp+var_14]
		sub	eax, dword_7282A
		mov	[bp+var_A4], eax
		mov	[bp+var_A8], eax
		mov	[bp+var_8], eax
		mov	eax, dword_72836
		sub	eax, dword_7282A
		mov	[bp+var_AC], eax
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_B0]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_72832
		sub	eax, dword_72826
		mov	[bp+var_B4], eax
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_B8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_C0], eax
		mov	eax, dword_72826
		add	eax, [bp+var_C0]
		mov	[bp+var_C4], eax
		mov	[bp+var_C8], eax
		mov	dword_72826, eax
		mov	eax, [bp+var_14]
		mov	dword_7282A, eax
		mov	eax, dword_7283A
		sub	eax, dword_7282E
		mov	[bp+var_CC], eax
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_D0]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_D8], eax
		mov	eax, dword_7282E
		add	eax, [bp+var_D8]
		mov	[bp+var_DC], eax
		mov	[bp+var_E0], eax
		jmp	loc_3A1B1
; ���������������������������������������������������������������������������

loc_39EF9:				; CODE XREF: Effect_RenderVolumetric+2EDj
		test	[bp+var_1], 4
		jnz	short loc_39F02
		jmp	loc_39FE2
; ���������������������������������������������������������������������������

loc_39F02:				; CODE XREF: Effect_RenderVolumetric+3D4j
		mov	eax, [bp+var_18]
		sub	eax, dword_7282A
		mov	[bp+var_E4], eax

loc_39F10:
		mov	[bp+var_E8], eax
		mov	[bp+var_8], eax
		mov	eax, dword_72836
		sub	eax, dword_7282A
		mov	[bp+var_EC], eax
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_F0]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_72832
		sub	eax, dword_72826
		mov	[bp+var_F4], eax
		mov	[bp+var_F8], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_F8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_FC], eax
		mov	eax, [bp+var_FC]
		mov	[bp+var_100], eax
		mov	eax, dword_72826
		add	eax, [bp+var_100]
		mov	[bp+var_104], eax
		mov	[bp+var_108], eax
		mov	dword_72826, eax
		mov	eax, [bp+var_18]
		mov	dword_7282A, eax
		mov	eax, dword_7283A
		sub	eax, dword_7282E
		mov	[bp+var_10C], eax
		mov	[bp+var_110], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_110]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_114], eax
		mov	eax, [bp+var_114]
		mov	[bp+var_118], eax
		mov	eax, dword_7282E
		add	eax, [bp+var_118]
		mov	[bp+var_11C], eax
		mov	[bp+var_120], eax
		jmp	loc_3A1B1
; ���������������������������������������������������������������������������

loc_39FE2:				; CODE XREF: Effect_RenderVolumetric+3D6j
		test	[bp+var_1], 2
		jnz	short loc_39FEB
		jmp	loc_3A0CB
; ���������������������������������������������������������������������������

loc_39FEB:				; CODE XREF: Effect_RenderVolumetric+4BDj
		mov	eax, [bp+var_1C]
		sub	eax, dword_7282E
		mov	[bp+var_124], eax
		mov	[bp+var_128], eax
		mov	[bp+var_8], eax
		mov	eax, dword_7283A
		sub	eax, dword_7282E
		mov	[bp+var_12C], eax
		mov	[bp+var_130], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_130]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_72832
		sub	eax, dword_72826
		mov	[bp+var_134], eax
		mov	[bp+var_138], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_138]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_13C], eax
		mov	eax, [bp+var_13C]
		mov	[bp+var_140], eax
		mov	eax, dword_72826
		add	eax, [bp+var_140]
		mov	[bp+var_144], eax
		mov	[bp+var_148], eax
		mov	dword_72826, eax
		mov	eax, dword_72836
		sub	eax, dword_7282A
		mov	[bp+var_14C], eax
		mov	[bp+var_150], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_150]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_154], eax
		mov	eax, [bp+var_154]
		mov	[bp+var_158], eax
		mov	eax, dword_7282A
		add	eax, [bp+var_158]
		mov	[bp+var_15C], eax
		mov	[bp+var_160], eax
		mov	dword_7282A, eax
		mov	eax, [bp+var_1C]
		jmp	loc_3A1B1
; ���������������������������������������������������������������������������

loc_3A0CB:				; CODE XREF: Effect_RenderVolumetric+4BFj
		test	[bp+var_1], 1
		jnz	short loc_3A0D4
		jmp	loc_3A1B5
; ���������������������������������������������������������������������������

loc_3A0D4:				; CODE XREF: Effect_RenderVolumetric+5A6j
		mov	eax, [bp+var_20]
		sub	eax, dword_7282E
		mov	[bp+var_164], eax
		mov	[bp+var_168], eax
		mov	[bp+var_8], eax
		mov	eax, dword_7283A
		sub	eax, dword_7282E
		mov	[bp+var_16C], eax
		mov	[bp+var_170], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_170]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, dword_72832
		sub	eax, dword_72826
		mov	[bp+var_174], eax
		mov	[bp+var_178], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_178]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_17C], eax
		mov	eax, [bp+var_17C]
		mov	[bp+var_180], eax
		mov	eax, dword_72826
		add	eax, [bp+var_180]
		mov	[bp+var_184], eax
		mov	[bp+var_188], eax
		mov	dword_72826, eax
		mov	eax, dword_72836
		sub	eax, dword_7282A
		mov	[bp+var_18C], eax
		mov	[bp+var_190], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_190]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_194], eax
		mov	eax, [bp+var_194]
		mov	[bp+var_198], eax
		mov	eax, dword_7282A
		add	eax, [bp+var_198]
		mov	[bp+var_19C], eax
		mov	[bp+var_1A0], eax
		mov	dword_7282A, eax
		mov	eax, [bp+var_20]

loc_3A1B1:				; CODE XREF: Effect_RenderVolumetric+207j
					; Effect_RenderVolumetric+2E4j ...
		mov	dword_7282E, eax

loc_3A1B5:				; CODE XREF: Effect_RenderVolumetric+EAj
					; Effect_RenderVolumetric+125j ...
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3A1C1
		jmp	loc_39C16
; ���������������������������������������������������������������������������

loc_3A1C1:				; CODE XREF: Effect_RenderVolumetric+693j
		mov	al, [bp+var_3]
		leave
		retf
Effect_RenderVolumetric	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,50L — bascule un mode de rendu global (byte_6EC34) entre deux réglages sonores/visuels
; ('WF'/'XX', bip 'Wv'), appelle sub_39B29 : bascule debug entre deux modes de rendu
; (wireframe/solide) avec retour sonore.
; ==============================================================================================
Debug_ToggleWireframeMode	proc far		; CODE XREF: Effect_GridProjectCorners+8Ep
					; Effect_GridProjectCorners+132p ...

arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 0
		jz	short loc_3A220
		cmp	byte_6EC34, 0
		jz	short loc_3A1EA
		push	5746h
		push	5776h
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		push	5746h
		jmp	short loc_3A1FB
; ���������������������������������������������������������������������������

loc_3A1EA:				; CODE XREF: Debug_ToggleWireframeMode+Fj
		push	5722h
		push	5776h
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		push	5722h

loc_3A1FB:				; CODE XREF: Debug_ToggleWireframeMode+22j
		push	5782h
		call	Matrix_LocalToWorld_58828
		add	sp, 4
		mov	al, byte_6EC34
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_6EC34, al
		push	large [bp+arg_4]
		push	cs
		call	near ptr Effect_RenderVolumetric
		add	sp, 4
		jmp	short loc_3A222
; ���������������������������������������������������������������������������

loc_3A220:				; CODE XREF: Debug_ToggleWireframeMode+8j
		mov	al, 0

loc_3A222:				; CODE XREF: Debug_ToggleWireframeMode+58j
		pop	bp
		retf
Debug_ToggleWireframeMode	endp

; ���������������������������������������������������������������������������

loc_3A224:				; DATA XREF: seg339:off_71ECCo
		push	bp
		mov	bp, sp
		push	5722h
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		push	5746h
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3A23B:				; DATA XREF: seg339:off_6EC4Eo
					; seg339:off_6EC62o ...
		push	bp
		mov	bp, sp
		pop	bp
		retf
seg080		ends
