seg081		segment	para public 'CODE' use16
		assume cs:seg081
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 56h, 8, 8Bh, 46h, 6

loc_320B5:
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_320B9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_320D7
		mov	word ptr [si], 145Ch
		test	ax, 1
		jz	short loc_320D7
		push	si
		call	sub_3B2
		pop	cx

loc_320D7:
		pop	si
		pop	bp
		retf
sub_320B9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_320DA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 0
		pop	bp
		retf
sub_320DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_320E4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_320E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TerrainTile_ListConstruct (sub_3314B de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,33L —
; constructeur d'un objet de type 0x19B3, taille 8 octets, sous-type 4 : constructeur de
; conteneur (liste de tuiles de terrain).
; ==============================================================================================
TerrainTile_ListConstruct		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_32105
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3211A

loc_32105:
		mov	word ptr [si], 909h
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax
		mov	word ptr [si], 14BBh
		mov	word ptr [si+6], 4

loc_3211A:
		mov	ax, si
		pop	si
		pop	bp
		retf
TerrainTile_ListConstruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TerrainTile_ListClear (sub_3317E de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,55L — vide une
; liste en notifiant chaque élément (vtable[4] code 3), libère les sous-ressources : vidage
; d'une liste de tuiles avec notification de libération.
; ==============================================================================================
TerrainTile_ListClear		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_3215F

loc_3212B:
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+4], 0
		jz	short loc_32146
		push	3
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short loc_32146

loc_32146:
		mov	bx, [bp+var_2]
		les	bx, [bx+6]
		mov	word ptr es:[bx], 0
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6

loc_3215F:
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_3212B
		pop	si
		leave
		retf
TerrainTile_ListClear		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TerrainTile_ListDestruct (sub_331D7 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,36L —
; destructeur : vide la liste (sub_3317E), la libère, libère l'objet si demandé : destructeur
; de conteneur de tuiles.
; ==============================================================================================
TerrainTile_ListDestruct		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_321A9
		mov	word ptr [si], 14BBh
		push	si
		push	cs
		call	near ptr TerrainTile_ListClear
		pop	cx
		mov	word ptr [si], 909h
		push	si
		call	sub_68B0D
		pop	cx
		test	di, 1
		jz	short loc_321A9
		push	si
		call	sub_3B2
		pop	cx

loc_321A9:
		pop	di
		pop	si
		pop	bp
		retf
TerrainTile_ListDestruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_321AD		proc far

var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_68B77
		pop	cx
		mov	[bp+var_2], ax
		mov	eax, [bp+arg_2]
		mov	[bp+var_8], eax
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_321FA
		mov	word ptr [di], 9B2h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 14B7h
		les	bx, word ptr [bp+var_8]
		mov	ax, es:[bx]
		mov	[di+4], ax
		mov	eax, [bp+var_8]
		mov	[di+6], eax
		mov	ax, di
		jmp	short loc_321FC

loc_321FA:
		mov	ax, di

loc_321FC:
		mov	[bp+var_4], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_68A21
		add	sp, 4
		les	bx, word ptr [bp+arg_2]
		cmp	word ptr es:[bx], 0
		jnz	short loc_3221B
		push	0E004h
		call	sub_1DDFE
		pop	cx

loc_3221B:
		push	si
		call	sub_68B77
		push	dx
		push	ax
		pop	eax
		pop	cx
		movsx	edx, [bp+var_2]
		cmp	eax, edx
		jbe	short loc_32235
		mov	ax, 1
		jmp	short loc_32237

loc_32235:
		xor	ax, ax

loc_32237:
		pop	di
		pop	si
		leave
		retf
sub_321AD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TerrainTile_EvictOutOfRange (sub_33288 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,81L — parcourt
; une liste de tuiles, retire (notifie + libère) celles dont la distance dépasse un seuil (+6)
; : purge des tuiles de terrain hors de portée de vue (éviction du cache LOD).
; ==============================================================================================
TerrainTile_EvictOutOfRange		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		jmp	short loc_322A9

loc_32252:
		mov	bx, [bp+var_2]
		mov	di, [bx+4]
		mov	ax, [bp+arg_2]
		sub	ax, [di+2]
		cmp	ax, [si+6]
		jle	short loc_3229C
		cmp	word ptr [bx+4], 0
		jz	short loc_3227B
		push	3
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short loc_3227B

loc_3227B:
		mov	bx, [bp+var_2]
		les	bx, [bx+6]
		mov	word ptr es:[bx], 0
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6
		mov	ax, [bp+var_4]
		mov	[bp+var_2], ax
		jmp	short loc_322A9

loc_3229C:
		push	di
		mov	bx, [di]
		call	dword ptr [bx+0Ch]
		pop	cx
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax

loc_322A9:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_32252
		pop	di
		pop	si
		leave
		retf
TerrainTile_EvictOutOfRange		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TerrainTile_DescriptorConstruct (sub_3330B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,44L — constructeur d'un objet (0x82 octets),
; initialise 3 champs et un sous-composant (sub_65A1A) : constructeur d'un descripteur de
; terrain/tuile complexe.
; ==============================================================================================
TerrainTile_DescriptorConstruct		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_322D8
		push	82h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_322F4

loc_322D8:
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	IndexedRecordReader_ConstructVariantA_7407
		pop	cx
		mov	byte ptr [si], 0
		mov	dword ptr [si+3], 0
		mov	word ptr [si+7], 0

loc_322F4:
		mov	ax, si
		pop	si
		pop	bp
		retf
TerrainTile_DescriptorConstruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_322F9		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	al, [si]
		mov	ah, 0
		or	ax, ax
		jz	short loc_32312
		jmp	loc_32444

loc_32312:
		mov	[si+1], di
		mov	ax, [bp+arg_4]
		mov	[si+7], ax
		mov	ax, [si+7]
		imul	word ptr [si+7]
		mov	[si+9], ax
		push	1
		push	0
		push	2
		mov	ax, [si+9]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+5], dx
		mov	[si+3], ax
		cmp	dword ptr [si+3], 0
		jnz	short loc_32356
		push	0E005h
		call	sub_1DDFE
		pop	cx

loc_32356:
		mov	eax, [si+3]
		mov	[bp+var_4], eax
		xor	dx, dx
		jmp	short loc_3236F

loc_32362:
		les	bx, word ptr [bp+var_4]
		mov	word ptr es:[bx], 0
		inc	dx
		add	word ptr [bp+var_4], 2

loc_3236F:
		cmp	[si+9], dx
		jg	short loc_32362
		push	149Eh
		push	[bp+arg_6]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_3238A
		push	1
		jmp	short loc_323E0

loc_3238A:
		push	14A3h
		push	[bp+arg_6]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_323A0
		push	2
		jmp	short loc_323E0

loc_323A0:
		push	14A8h
		push	[bp+arg_6]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_323B6
		push	3
		jmp	short loc_323E0

loc_323B6:
		push	14ADh
		push	[bp+arg_6]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_323CC
		push	4
		jmp	short loc_323E0

loc_323CC:
		push	14B2h
		push	[bp+arg_6]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_323EE
		push	5

loc_323E0:
		mov	ax, di
		add	ax, 208h
		push	ax
		call	sub_7844
		add	sp, 4

loc_323EE:
		mov	ax, di
		add	ax, 208h
		push	ax
		call	StreamReader_GetCapacity_6C5C7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		mov	ax, [di+275h]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_32415
		mov	eax, [di+269h]
		jmp	short loc_3241A

loc_32415:
		mov	eax, [di+279h]

loc_3241A:
		mov	edx, [bp+var_8]
		add	edx, eax
		mov	[bp+var_C], edx
		push	0
		push	edx
		push	large [bp+var_8]
		mov	ax, di
		add	ax, 208h
		push	ax
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	sub_6C024
		add	sp, 0Eh
		mov	byte ptr [si], 1

loc_32444:
		pop	di
		pop	si
		leave
		retf
sub_322F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TerrainTile_DescriptorDestruct (sub_33485 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,48L
; — destructeur : libère une chaîne (+3) et un sous-composant (sub_659D0), libère l'objet si
; demandé : destructeur de descripteur de terrain/tuile.
; ==============================================================================================
TerrainTile_DescriptorDestruct		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_32491
		push	0
		push	2
		mov	ax, si
		add	ax, 3
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword ptr [si+3], 0
		push	2
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	IndexedRecordReader_Destruct_73BD
		add	sp, 4
		test	di, 1
		jz	short loc_32491
		push	si
		call	sub_3B2
		pop	cx

loc_32491:
		pop	di
		pop	si
		pop	bp
		retf
TerrainTile_DescriptorDestruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32495		proc far
		push	bp
		mov	bp, sp
		push	658Ch
		push	cs
		call	near ptr TerrainTile_ListConstruct
		pop	cx
		pop	bp
		retf
sub_32495		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_324A2		proc far
		push	bp
		mov	bp, sp
		push	2
		push	658Ch
		push	cs
		call	near ptr TerrainTile_ListDestruct
		add	sp, 4
		pop	bp
		retf
sub_324A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_324B3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_324CF
		test	dx, 1
		jz	short loc_324CF
		push	ax
		call	sub_3B2
		pop	cx
		jmp	short loc_324CF

loc_324CF:
		pop	bp
sub_324B3		endp
seg081		ends
