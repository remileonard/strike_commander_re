seg072		segment	byte public 'CODE' use16
		assume cs:seg072
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,30L — destructeur (type 0x1966) libérant l'objet si demandé : destructeur générique
; simple.
; ==============================================================================================
TerrainTile_DestructSimple	proc far		; CODE XREF: seg070:0A61P
					; Terrain_ReleaseSectorAndTile_99AA0+C6P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_33119:				; DATA XREF: seg216:0306o
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_3311F:
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_33136
		mov	word ptr [si], 1966h
		test	ax, 1
		jz	short loc_33136
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_33136:				; CODE XREF: TerrainTile_DestructSimple+Cj
					; TerrainTile_DestructSimple+15j
		pop	si
		pop	bp
		retf
TerrainTile_DestructSimple	endp

; ���������������������������������������������������������������������������

loc_33139:				; DATA XREF: seg339:off_6EA1Eo
					; seg339:197Eo	...
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 0

loc_33141:
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_33143:				; DATA XREF: seg339:off_6EA22o
					; seg339:1982o	...
		push	bp
		mov	bp, sp

loc_33146:
		mov	ax, [bp+6]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,33L — constructeur d'un objet de type 0x19B3, taille 8 octets, sous-type 4 :
; constructeur de conteneur (liste de tuiles de terrain).
; ==============================================================================================
TerrainTile_ListConstruct	proc far		; CODE XREF: seg072:03C9p

arg_0		= word ptr  6

		push	bp

loc_3314C:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_33164
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_33179

loc_33164:				; CODE XREF: TerrainTile_ListConstruct+9j
		mov	word ptr [si], 75Ch
		xor	ax, ax
		mov	[si+4],	ax
		mov	[si+2],	ax
		mov	word ptr [si], 19B3h
		mov	word ptr [si+6], 4

loc_33179:				; CODE XREF: TerrainTile_ListConstruct+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
TerrainTile_ListConstruct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,55L — vide une liste en notifiant chaque élément (vtable[4] code 3), libère les sous-
; ressources : vidage d'une liste de tuiles avec notification de libération.
; ==============================================================================================
TerrainTile_ListClear	proc far		; CODE XREF: TerrainTile_ListDestruct+15p
					; Picking_ClearSelectableList+9P	...

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si

loc_33185:
		mov	si, [bp+arg_0]
		jmp	short loc_331BE
; ���������������������������������������������������������������������������

loc_3318A:				; CODE XREF: TerrainTile_ListClear+54j
		mov	bx, [bp+var_2]
		cmp	word ptr [bx+4], 0
		jz	short loc_331A5
		push	3
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+4]

loc_331A0:
		add	sp, 4
		jmp	short $+2

loc_331A5:				; CODE XREF: TerrainTile_ListClear+13j
		mov	bx, [bp+var_2]
		les	bx, [bx+6]
		mov	word ptr es:[bx], 0
		push	0

loc_331B2:
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_5F5A4
		add	sp, 6

loc_331BE:				; CODE XREF: TerrainTile_ListClear+Aj
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_3318A
		pop	si
		leave
		retf
TerrainTile_ListClear	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,36L — destructeur : vide la liste (sub_3317E), la libère, libère l'objet si demandé :
; destructeur de conteneur de tuiles.
; ==============================================================================================
TerrainTile_ListDestruct	proc far		; CODE XREF: seg072:03D8p
					; DATA XREF: seg339:19B3o

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_33208
		mov	word ptr [si], 19B3h
		push	si
		push	cs
		call	near ptr TerrainTile_ListClear
		pop	cx
		mov	word ptr [si], 75Ch
		push	si
		call	LinkedListB_Helper_5F66B
		pop	cx
		test	di, 1
		jz	short loc_33208
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_33208:				; CODE XREF: TerrainTile_ListDestruct+Dj
					; TerrainTile_ListDestruct+28j
		pop	di
		pop	si
		pop	bp
		retf
TerrainTile_ListDestruct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,78L — construit une entrée (type 0x19AF) référençant une donnée de tuile terrain,
; l'ajoute compteur (sub_5F6D5) : constructeur d'entrée de cache de tuile de terrain (appelé
; par le rendu de modèle/terrain LOD).
; ==============================================================================================
TerrainTile_CacheEntryConstruct	proc far		; CODE XREF: Model_RenderMain+3F4P
					; Terrain_ComputeLODMesh+37CP ...

var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	LinkedListB_Helper_5F6D5
		pop	cx
		mov	[bp+var_2], ax

loc_33221:
		mov	eax, [bp+arg_2]
		mov	[bp+var_8], eax
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax

loc_33233:
		or	ax, ax
		jz	short loc_33259
		mov	word ptr [di], 8DAh
		mov	word ptr [di+2], 0

loc_33240:
		mov	word ptr [di], 19AFh
		les	bx, [bp+var_8]
		mov	ax, es:[bx]
		mov	[di+4],	ax
		mov	eax, [bp+var_8]

loc_33251:
		mov	[di+6],	eax
		mov	ax, di
		jmp	short loc_3325B
; ���������������������������������������������������������������������������

loc_33259:				; CODE XREF: TerrainTile_CacheEntryConstruct+29j
		mov	ax, di

loc_3325B:				; CODE XREF: TerrainTile_CacheEntryConstruct+4Bj
		mov	[bp+var_4], ax
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
		movsx	edx, [bp+var_2]
		cmp	eax, edx
		jbe	short loc_33282
		mov	ax, 1
		jmp	short loc_33284
; ���������������������������������������������������������������������������

loc_33282:				; CODE XREF: TerrainTile_CacheEntryConstruct+6Fj
		xor	ax, ax

loc_33284:				; CODE XREF: TerrainTile_CacheEntryConstruct+74j
		pop	di
		pop	si
		leave
		retf
TerrainTile_CacheEntryConstruct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,81L — parcourt une liste de tuiles, retire (notifie + libère) celles dont la distance
; dépasse un seuil (+6) : purge des tuiles de terrain hors de portée de vue (éviction du cache
; LOD).
; ==============================================================================================
TerrainTile_EvictOutOfRange	proc far		; CODE XREF: seg077:0234P

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
		jmp	short loc_332F6
; ���������������������������������������������������������������������������

loc_3329F:				; CODE XREF: TerrainTile_EvictOutOfRange+7Dj
		mov	bx, [bp+var_2]

loc_332A2:
		mov	di, [bx+4]

loc_332A5:
		mov	ax, [bp+arg_2]

loc_332A8:
		sub	ax, [di+2]
		cmp	ax, [si+6]

loc_332AE:
		jle	short loc_332E9

loc_332B0:
		cmp	word ptr [bx+4], 0
		jz	short loc_332C8
		push	3
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short $+2

loc_332C8:				; CODE XREF: TerrainTile_EvictOutOfRange+2Cj
		mov	bx, [bp+var_2]
		les	bx, [bx+6]
		mov	word ptr es:[bx], 0
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_5F5A4
		add	sp, 6
		mov	ax, [bp+var_4]
		mov	[bp+var_2], ax
		jmp	short loc_332F6
; ���������������������������������������������������������������������������

loc_332E9:				; CODE XREF: TerrainTile_EvictOutOfRange:loc_332AEj
		push	di
		mov	bx, [di]
		call	dword ptr [bx+0Ch]
		pop	cx
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax

loc_332F6:				; CODE XREF: TerrainTile_EvictOutOfRange+15j
					; TerrainTile_EvictOutOfRange+5Fj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_3329F
		pop	di
		pop	si
		leave
		retf
TerrainTile_EvictOutOfRange	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,44L — constructeur d'un objet (0x82 octets), initialise 3 champs et un sous-composant
; (sub_65A1A) : constructeur d'un descripteur de terrain/tuile complexe.
; ==============================================================================================
TerrainTile_DescriptorConstruct	proc far		; CODE XREF: TerrainTile_ConstructDescriptor_9B451+1BP
					; MissionLoader_LoadFormation_A78F5+CCP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_33325
		push	82h ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax

loc_33323:
		jz	short loc_33341

loc_33325:				; CODE XREF: TerrainTile_DescriptorConstruct+9j
		mov	ax, si

loc_33327:
		add	ax, 0Bh
		push	ax

loc_3332B:
		call	IndexedRecordReader_ConstructVariantA_65A1A
		pop	cx

loc_33331:
		mov	byte ptr [si], 0
		mov	dword ptr [si+3], 0
		mov	word ptr [si+7], 0

loc_33341:				; CODE XREF: TerrainTile_DescriptorConstruct:loc_33323j
		mov	ax, si
		pop	si

loc_33344:
		pop	bp
		retf
TerrainTile_DescriptorConstruct	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,189L — alloue un tableau de coordonnées (taille×taille, mots 16-bit) pour une grille de
; hauteur : allocation d'une grille de hauteur de terrain (heightmap buffer).
; ==============================================================================================
Terrain_HeightmapAllocate	proc far		; CODE XREF: Terrain_LoadATRIChunk_998C0+65P
					; Terrain_LoadHeightmapFromIFFB_99CEF+5DP ...

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp

loc_33347:
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di

loc_3334E:
		mov	si, [bp+arg_0]

loc_33351:
		mov	di, [bp+arg_2]
		mov	al, [si]
		mov	ah, 0
		or	ax, ax
		jz	short loc_3335F
		jmp	loc_33481
; ���������������������������������������������������������������������������

loc_3335F:				; CODE XREF: Terrain_HeightmapAllocate+14j
		mov	[si+1],	di
		mov	ax, [bp+arg_4]
		mov	[si+7],	ax
		mov	ax, [si+7]
		imul	word ptr [si+7]
		mov	[si+9],	ax
		push	1
		push	0
		push	2
		mov	ax, [si+9]
		shl	ax, 1
		movzx	eax, ax
		push	eax

loc_33382:
		push	5C44h

loc_33385:
		call	Memory_TypedFreeWrapper_5C6F3

loc_3338A:
		add	sp, 0Ch

loc_3338D:
		mov	[si+5],	dx

loc_33390:
		mov	[si+3],	ax

loc_33393:
		mov	eax, [si+3]

loc_33397:
		mov	[bp+var_4], eax
		xor	dx, dx
		jmp	short loc_333AC
; ���������������������������������������������������������������������������

loc_3339F:				; CODE XREF: Terrain_HeightmapAllocate+69j
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 0
		inc	dx
		add	word ptr [bp+var_4], 2

loc_333AC:				; CODE XREF: Terrain_HeightmapAllocate+57j
		cmp	[si+9],	dx
		jg	short loc_3339F
		push	1996h
		push	[bp+arg_6]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_333C7
		push	1
		jmp	short loc_3341D
; ���������������������������������������������������������������������������

loc_333C7:				; CODE XREF: Terrain_HeightmapAllocate+7Bj
		push	199Bh
		push	[bp+arg_6]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_333DD
		push	2
		jmp	short loc_3341D
; ���������������������������������������������������������������������������

loc_333DD:				; CODE XREF: Terrain_HeightmapAllocate+91j
		push	19A0h
		push	[bp+arg_6]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_333F3
		push	3
		jmp	short loc_3341D
; ���������������������������������������������������������������������������

loc_333F3:				; CODE XREF: Terrain_HeightmapAllocate+A7j
		push	19A5h
		push	[bp+arg_6]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_33409
		push	4
		jmp	short loc_3341D
; ���������������������������������������������������������������������������

loc_33409:				; CODE XREF: Terrain_HeightmapAllocate+BDj
		push	19AAh
		push	[bp+arg_6]
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jnz	short loc_3342B
		push	5

loc_3341D:				; CODE XREF: Terrain_HeightmapAllocate+7Fj
					; Terrain_HeightmapAllocate+95j ...
		mov	ax, di
		add	ax, 208h
		push	ax
		call	IndexedRecordReader_AdvanceIndex_65E2C
		add	sp, 4

loc_3342B:				; CODE XREF: Terrain_HeightmapAllocate+D3j
		mov	ax, di
		add	ax, 208h
		push	ax
		call	StreamReader_GetPosition_64075
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax

loc_3343F:
		mov	ax, [di+275h]

loc_33443:
		and	ax, 0C0h

loc_33446:
		cmp	ax, 0C0h ; '�'
		jnz	short loc_33452
		mov	eax, [di+269h]
		jmp	short loc_33457
; ���������������������������������������������������������������������������

loc_33452:				; CODE XREF: Terrain_HeightmapAllocate+103j
		mov	eax, [di+279h]

loc_33457:				; CODE XREF: Terrain_HeightmapAllocate+10Aj
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
		call	StreamReader_ConstructAndBind_63B23
		add	sp, 0Eh
		mov	byte ptr [si], 1

loc_33481:				; CODE XREF: Terrain_HeightmapAllocate+16j
		pop	di
		pop	si
		leave
		retf
Terrain_HeightmapAllocate	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,48L — destructeur : libère une chaîne (+3) et un sous-composant (sub_659D0), libère
; l'objet si demandé : destructeur de descripteur de terrain/tuile.
; ==============================================================================================
TerrainTile_DescriptorDestruct	proc far		; CODE XREF: Terrain_ReleaseTileDescriptor_999C1+12P
					; Terrain_ReleaseTileDescriptorB_99E7C+27P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_33486:
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_3348D:
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_334CE
		push	0
		push	2
		mov	ax, si
		add	ax, 3
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword ptr [si+3], 0
		push	2

loc_334B3:
		mov	ax, si
		add	ax, 0Bh
		push	ax
		call	IndexedRecordReader_Destruct_659D0
		add	sp, 4
		test	di, 1
		jz	short loc_334CE
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_334CE:				; CODE XREF: TerrainTile_DescriptorDestruct+Dj
					; TerrainTile_DescriptorDestruct+40j
		pop	di
		pop	si
		pop	bp
		retf
TerrainTile_DescriptorDestruct	endp

; ���������������������������������������������������������������������������

loc_334D2:				; DATA XREF: seg339:4DFEo
		push	bp
		mov	bp, sp
		push	5510h
		push	cs
		call	near ptr TerrainTile_ListConstruct
		pop	cx
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_334DF:				; DATA XREF: seg339:off_71FBCo
		push	bp
		mov	bp, sp
		push	2
		push	5510h
		push	cs
		call	near ptr TerrainTile_ListDestruct
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_334F0:				; DATA XREF: seg339:19AFo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	dx, [bp+8]
		or	ax, ax
		jz	short loc_3350C

loc_334FD:
		test	dx, 1
		jz	short loc_3350C
		push	ax
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_3350C:				; CODE XREF: seg072:03EBj seg072:03F1j
		pop	bp
		retf
seg072		ends
