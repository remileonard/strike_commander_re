seg105		segment	byte public 'CODE' use16
		assume cs:seg105
		;org 5
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LECTEUR DE LA CLASSE EXPL (FORM EXPL d'un OBJECTS\*.IFF ; ex-IFF_RecordSubtype). Lit
; les chunks communs (Object_LoadCommonChunks_9BA85) puis recopie DAMG (+6) en +0x38 (dégâts
; par défaut de l'explosion). Classe : 62 o, vtable 0x23E0, catégorie 15 (loc_4BD81 : mov al,
; 0Fh) ; méthode +4 = Explosion_SpawnInstance_4BCF4.
; ==============================================================================================
Explosion_LoadFromIFF_4BCD5	proc far		; CODE XREF: IFF_LoadModelMain+D07P

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_4BCD8:				; DATA XREF: seg216:040Eo
		push	[bp+arg_4]
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6BFFF
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		mov	es:[bx+38h], ax
		pop	bp
		retf
Explosion_LoadFromIFF_4BCD5	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode +4 de la classe EXPL (vtable 0x23E0, seg339:23E4) : crée l'instance d'explosion
; (CRT_Malloc16_Retry(0x5E), WorldObject_BaseConstruct, vtable 0x302A, +0x5A = 0), l'attache à
; la source (Explosion_AttachToSource_4BDDA), puis copie du modèle : +0x3A (dword) → instance
; +0x51 (rayon), +0x38 (DAMG) → +0x55 (dégâts max), +0x36 → +0x57. Ces valeurs sont ensuite
; remplacées par celles du chunk EXPL de l'objet détruit
; (Explosion_ApplyRadiusAndDamage_4BDFD).
; ==============================================================================================
Explosion_SpawnInstance_4BCF4:				; DATA XREF: seg339:23E4o
		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	5Eh ; '^'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4BD32
		push	ax
		call	WorldObject_BaseConstruct
		pop	cx
		mov	word ptr [si], 302Ah
		mov	word ptr [si+5Ah], 0
		push	large dword ptr	[bp-4]
		push	si
		nop
		push	cs
		call	near ptr Explosion_AttachToSource_4BDDA
		add	sp, 6
		mov	ax, si
		jmp	short loc_4BD34
; ���������������������������������������������������������������������������

loc_4BD32:				; CODE XREF: seg105:003Fj
		mov	ax, si

loc_4BD34:				; CODE XREF: seg105:0060j
		mov	si, ax
		push	ax
		push	large dword ptr	[bp+6]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 3Ah	; ':'
		mov	[bp-0Ah], ax
		mov	[bp-0Ch], dx
		les	bx, [bp-0Ch]
		mov	eax, es:[bx]
		mov	[bp-8],	eax
		mov	[bp-10h], eax
		mov	[si+51h], eax
		les	bx, [bp+6]
		mov	ax, es:[bx+38h]
		mov	[bp-12h], ax
		mov	[si+55h], ax
		mov	ax, es:[bx+36h]
		mov	[bp-14h], ax
		mov	[si+57h], ax
		mov	ax, si
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4BD81:				; DATA XREF: seg339:23E8o
		push	bp
		mov	bp, sp
		mov	al, 0Fh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4BD88:				; DATA XREF: seg339:off_6F490o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_4BDD0
		les	bx, [bp+6]
		mov	word ptr es:[bx], 23E0h

loc_4BDA1:
		push	0
		push	word ptr [bp+8]
		push	bx
		call	VROOMM_StubThunk_6C009
		add	sp, 6
		test	si, 1

loc_4BDB3:
		jz	short loc_4BDD0
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_4BDD0:				; CODE XREF: seg105:00C7j
					; seg105:loc_4BDB3j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4BDD3:				; DATA XREF: seg339:off_6F4A0o
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, ATTACHE UNE EXPLOSION À L'OBJET QUI LA PRODUIT (ex-Camera_InitAttachWithModeFlags,
; aucun rapport avec une caméra) : instance +0x59 = 1, bits 0 et 2 de +4, puis
; Debris_BodyAttachToSubpart(instance, source). Appelée par Explosion_SpawnInstance_4BCF4.
; ==============================================================================================
Explosion_AttachToSource_4BDDA	proc far		; CODE XREF: seg105:0058p

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+59h], 1
		or	byte ptr [si+4], 1
		or	byte ptr [si+4], 4
		push	large [bp+arg_2]
		push	si
		call	Debris_BodyAttachToSubpart
		add	sp, 6
		pop	si
		pop	bp
		retf
Explosion_AttachToSource_4BDDA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, APPLIQUE LE RAYON ET LES DÉGÂTS D'UN CHUNK EXPL À UNE EXPLOSION CRÉÉE (ex-
; Debris_ConfigureByTargetType). Appelée par Object_SpawnDestructionEffects_3863A avec
; (instance, rayon<<8, dégâts, 100). Instance +0x51 = rayon (24.8), +0x55 = dégâts max, +0x57
; = 3e paramètre sauf s'il vaut 100 ; si le sous-objet +0x0A est de type 3 ou 5 (vtable
; +0x24), son +0x0D = rayon entier. Lus par Explosion_DamageAtDistance_4BE51.
; ==============================================================================================
Explosion_ApplyRadiusAndDamage_4BDFD	proc far		; CODE XREF: Object_SpawnDestructionEffects_3863A:loc_3874CP
					; seg107:08B0P

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_3		= word ptr  9
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_8]
		push	large dword ptr	[si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+24h]
		add	sp, 4
		mov	[bp+var_2], al
		cmp	[bp+var_2], 5
		jz	short loc_4BE2A
		cmp	[bp+var_2], 3
		jnz	short loc_4BE37

loc_4BE2A:				; CODE XREF: Explosion_ApplyRadiusAndDamage_4BDFD+25j
		mov	ax, [bp+arg_3]
		mov	[bp+var_4], ax
		les	bx, [si+0Ah]
		mov	es:[bx+0Dh], ax

loc_4BE37:				; CODE XREF: Explosion_ApplyRadiusAndDamage_4BDFD+2Bj
		mov	eax, [bp+8]
		mov	[si+51h], eax
		mov	ax, [bp+arg_6]
		mov	[si+55h], ax
		cmp	di, 64h	; 'd'
		jz	short loc_4BE4D
		mov	[si+57h], di

loc_4BE4D:				; CODE XREF: Explosion_ApplyRadiusAndDamage_4BDFD+4Bj
		pop	di
		pop	si
		leave
		retf
Explosion_ApplyRadiusAndDamage_4BDFD	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode de vtable (seg339:off_7015E) de l'objet explosion (vtable 0x302A). DÉGÂTS
; INFLIGÉS PAR L'EXPLOSION À UNE CIBLE : d = distance 3D (Math_VectorLength3D_Raw_5828E) entre
; l'explosion (+0x12) et la cible (+0x12), moins la taille de la cible (cible vtable[0] → +8 →
; +0x10), bornée à 0 ; si rayon (+0x51) > d : facteur = (rayon − d) / rayon (shl eax, 8 /
; idiv) sinon 0 ; dégâts = facteur × dégâts max (+0x55, <<8 puis imul/shrd 8) ; renvoie la
; partie entière (mov ax, [bp-3]). Décroissance LINÉAIRE avec la distance.
; ==============================================================================================
Explosion_DamageAtDistance_4BE51:				; DATA XREF: seg339:off_7015Eo
		push	bp
		mov	bp, sp
		sub	sp, 58h
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, si
		add	di, 12h
		mov	ax, [bp+8]
		add	ax, 12h
		mov	[bp-6],	ax
		mov	eax, [di]
		mov	bx, [bp-6]
		sub	eax, [bx]
		mov	[bp-58h], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp-54h], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp-50h], eax
		mov	eax, [bp-58h]
		mov	[bp-4Ch], eax
		mov	eax, [bp-54h]
		mov	[bp-48h], eax
		mov	eax, [bp-50h]

loc_4BEA3:
		mov	[bp-44h], eax

loc_4BEA7:
		push	eax
		push	large dword ptr	[bp-48h]

loc_4BEAD:
		push	large dword ptr	[bp-4Ch]

loc_4BEB1:
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-0Eh], eax
		mov	[bp-0Ah], eax
		mov	eax, [bp-0Ah]
		or	eax, eax
		jge	short loc_4BED1
		neg	eax

loc_4BED1:				; CODE XREF: seg105:01FCj
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		mov	[bp-16h], eax
		mov	[bp-0Ah], eax
		push	word ptr [bp+8]
		mov	bx, [bp+8]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp-18h], dx
		mov	[bp-1Ah], ax
		cmp	dword ptr [bp-1Ah], 0
		jz	short loc_4BF1C
		les	bx, [bp-1Ah]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	[bp-1Ch], ax
		mov	[bp-1Eh], dx
		les	bx, [bp-1Eh]
		mov	eax, es:[bx]
		mov	[bp-22h], eax
		sub	[bp-0Ah], eax

loc_4BF1C:				; CODE XREF: seg105:0227j
		cmp	dword ptr [bp-0Ah], 0
		jge	short loc_4BF28
		mov	ax, 1
		jmp	short loc_4BF2A
; ���������������������������������������������������������������������������

loc_4BF28:				; CODE XREF: seg105:0251j
		xor	ax, ax

loc_4BF2A:				; CODE XREF: seg105:0256j
		or	al, al
		jz	short loc_4BF3E
		mov	dword ptr [bp-26h], 0
		mov	eax, [bp-26h]
		mov	[bp-0Ah], eax

loc_4BF3E:				; CODE XREF: seg105:025Cj
		mov	eax, [si+51h]
		cmp	eax, [bp-0Ah]
		jle	short loc_4BF4D
		mov	ax, 1
		jmp	short loc_4BF4F
; ���������������������������������������������������������������������������

loc_4BF4D:				; CODE XREF: seg105:0276j
		xor	ax, ax

loc_4BF4F:				; CODE XREF: seg105:027Bj
		or	al, al
		jz	short loc_4BF8B
		mov	eax, [si+51h]
		sub	eax, [bp-0Ah]
		mov	[bp-2Ah], eax
		mov	[bp-2Eh], eax
		mov	di, si
		add	di, 51h	; 'Q'
		mov	eax, [bp-2Eh]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-32h], eax
		mov	eax, [bp-32h]
		mov	[bp-36h], eax
		jmp	short loc_4BF97
; ���������������������������������������������������������������������������

loc_4BF8B:				; CODE XREF: seg105:0281j
		mov	dword ptr [bp-3Ah], 0
		mov	eax, [bp-3Ah]

loc_4BF97:				; CODE XREF: seg105:02B9j
		mov	[bp-4],	eax
		mov	ax, [si+55h]
		mov	[bp-3Ch], ax
		movsx	eax, word ptr [bp-3Ch]
		shl	eax, 8
		mov	[bp-40h], eax
		mov	eax, [bp-4]
		mov	edx, [bp-40h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-4],	eax
		mov	ax, [bp-3]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4BFC9:				; DATA XREF: seg339:off_700EAo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+59h], 0
		jz	short loc_4BFDC
		mov	byte ptr [si+59h], 0
		jmp	short loc_4BFE0
; ���������������������������������������������������������������������������

loc_4BFDC:				; CODE XREF: seg105:0304j
		and	byte ptr [si+4], 0FDh

loc_4BFE0:				; CODE XREF: seg105:030Aj
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_4BFF9
		push	large dword ptr	[si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_4BFFB
; ���������������������������������������������������������������������������

loc_4BFF9:				; CODE XREF: seg105:0315j
		mov	al, 1

loc_4BFFB:				; CODE XREF: seg105:0327j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4BFFE:				; DATA XREF: seg339:off_70112o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [si+5Ah]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4C00B:				; DATA XREF: seg339:off_7010Eo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 0Fh
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4C015:				; DATA XREF: seg339:off_700F2o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_4C04C
		mov	word ptr [si], 302Ah
		mov	ax, si
		add	ax, 5Ah	; 'Z'
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	WorldObject_BaseDestruct
		add	sp, 4
		test	di, 1
		jz	short loc_4C04C
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_4C04C:				; CODE XREF: seg105:0352j seg105:0373j
		pop	di
		pop	si
		pop	bp
		retf
seg105		ends
