ovr287		segment	para public 'OVERLAY' use16
		assume cs:ovr287
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A7C90		proc far

var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		push	147Ch
		push	1
		push	0
		push	2
		push	large 0A00h
		push	6B04h
		call	Memory_TypedFreeWrapperB_65290
		add	sp, 0Eh
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		mov	eax, [bp+var_4]
		mov	dword_7CC9E, eax
		mov	byte_7CCA2, 2
		mov	byte_7CCA3, 1
		mov	dword_7CCA4, 0
		mov	dword_7CCA4, 0A00h
		push	0
		mov	al, byte_7CCA2
		push	ax
		push	large dword_7CC9E
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	0
		mov	al, byte_7CCA2
		push	ax
		push	large dword_7CC9E
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		push	0
		mov	al, byte_7CCA2
		push	ax
		push	large dword_7CC9E
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		mov	ax, [bp+var_8]
		mov	[bp+var_A], ax
		mov	word_7CC9A, ax
		add	ax, 2F8h
		mov	[bp+var_C], ax
		mov	word_7CC9C, ax
		mov	ax, word_77BF2
		mov	dx, word_7CC9A
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		mov	dx, word_7CC9C
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		mov	si, [bp+var_8]
		xor	cx, cx
		jmp	loc_A7E62

loc_A7D5B:
		mov	ax, cx
		imul	ax, ax, 26h
		les	bx, [bp+var_10]
		add	bx, ax
		mov	byte ptr es:[bx], 0FFh
		mov	ax, cx
		imul	ax, ax, 3
		imul	ax, ax, 1Eh
		mov	dx, si
		add	dx, ax
		mov	[bp+var_12], dx
		mov	ax, cx
		imul	ax, ax, 26h
		mov	bx, [bp+var_10]
		add	bx, ax
		mov	ax, [bp+var_12]
		mov	es:[bx+1], ax
		mov	ax, cx
		imul	ax, ax, 3
		inc	ax
		imul	ax, ax, 1Eh
		mov	dx, si
		add	dx, ax
		mov	[bp+var_14], dx
		mov	ax, cx
		imul	ax, ax, 26h
		mov	bx, [bp+var_10]
		add	bx, ax
		mov	ax, [bp+var_14]
		mov	es:[bx+3], ax
		mov	ax, cx
		imul	ax, ax, 3
		add	ax, 2
		imul	ax, ax, 1Eh
		mov	dx, si
		add	dx, ax
		mov	[bp+var_16], dx
		mov	ax, cx
		imul	ax, ax, 26h
		mov	bx, [bp+var_10]
		add	bx, ax
		mov	ax, [bp+var_16]
		mov	es:[bx+5], ax
		mov	ax, cx
		imul	ax, ax, 26h
		mov	bx, [bp+var_10]
		add	bx, ax
		mov	word ptr es:[bx+7], 0
		mov	ax, cx
		imul	ax, ax, 26h
		mov	bx, [bp+var_10]
		add	bx, ax
		mov	word ptr es:[bx+9], 0
		mov	ax, cx
		imul	ax, ax, 26h
		mov	bx, [bp+var_10]
		add	bx, ax
		mov	word ptr es:[bx+0Bh], 0
		mov	ax, cx
		imul	ax, ax, 26h
		mov	bx, [bp+var_10]
		add	bx, ax
		mov	word ptr es:[bx+0Dh], 0
		mov	ax, cx
		imul	ax, ax, 26h
		mov	bx, [bp+var_10]
		add	bx, ax
		mov	word ptr es:[bx+0Fh], 0
		mov	ax, cx
		imul	ax, ax, 26h
		mov	bx, [bp+var_10]
		add	bx, ax
		mov	word ptr es:[bx+11h], 0
		mov	ax, cx
		imul	ax, ax, 26h
		mov	bx, [bp+var_10]
		add	bx, ax
		mov	byte ptr es:[bx+13h], 0
		mov	ax, cx
		imul	ax, ax, 26h
		mov	bx, [bp+var_10]
		add	bx, ax
		mov	word ptr es:[bx+16h], 0
		mov	word ptr es:[bx+14h], 0
		mov	ax, cx
		imul	ax, ax, 26h
		mov	bx, [bp+var_10]
		add	bx, ax
		mov	byte ptr es:[bx+24h], 0
		inc	cx

loc_A7E62:
		cmp	cx, 14h
		jge	short loc_A7E6A
		jmp	loc_A7D5B

loc_A7E6A:
		mov	ax, word_77BF2
		mov	dx, word_7CC9C
		mov	[bp+var_18], ax
		mov	[bp+var_1A], dx
		xor	cx, cx
		jmp	short loc_A7EF9

loc_A7E7B:
		mov	[bp+var_1E], 0
		mov	eax, [bp+var_1E]
		les	bx, [bp+var_1A]
		mov	es:[bx+11h], eax
		mov	[bp+var_22], 0
		mov	eax, [bp+var_22]
		mov	es:[bx+15h], eax
		mov	[bp+var_26], 0
		mov	eax, [bp+var_26]
		mov	es:[bx+19h], eax
		mov	byte ptr es:[bx+1Dh], 0
		mov	[bp+var_2A], 0
		mov	eax, [bp+var_2A]
		mov	es:[bx], eax
		mov	[bp+var_2E], 0
		mov	eax, [bp+var_2E]
		mov	es:[bx+4], eax
		mov	[bp+var_32], 0
		mov	eax, [bp+var_32]
		mov	es:[bx+8], eax
		mov	word ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx+0Eh], 0
		add	[bp+var_1A], 1Eh
		inc	cx

loc_A7EF9:
		cmp	cx, 3Ch
		jge	short loc_A7F01
		jmp	loc_A7E7B

loc_A7F01:
		mov	byte_77B8B, 0
		pop	si
		leave
		retf
sub_A7C90		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Terrain_LoadATRIChunk_998C0 (sub_998C0 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,152L — LECTEUR
; DU CHUNK 'ATRI' du FORM TERA (dans <nom>.PAK). seek_chunk('ATRI') (tag 0x49525441) ;
; ReadFieldGroupA(rr, hdr, 0x35) -> en-tete 53 o : +0x00 u16 dim ; +0x02 u32 -> terrain+0x8A ;
; +0x06 u16 count ; +0x08 count x u32 -> terrain+0x90 ; +0x18 count x u32 -> terrain+0xA0 ;
; +0x28 char[13] nom du blob ('MAURITAN.TRI'). sprintf(nameBuf, hdr+0x28) via
; Stdio_ArgTrampoline5 ; Terrain_HeightmapAllocate_33346(terrain, rr, dim, nameBuf) qui alloue
; la grille dim x dim u16 (terrain+0x03), resout l'extension (.ELV->1 .MED->2 .LOW->3 .AVG->4
; .TRI->5), positionne l'IndexedRecordReader rr+0x208 sur le blob et bind un sous-flux
; terrain+0x0B dessus. Le blob .TRI est un PAK imbrique de 324 cellules (grille 18x18) ;
; cellules non vides = u16 count + count x record 70 o de placement d'objet d'aerodrome (nom
; modele + variante detail + X/Z/Y + flags). Detail : analysis/DATA_MODEL.md §6.8 / §6.8bis.
; Nom IDA 'Heightmap' trompeur. | PRÉCISÉ 2026-10-12 : en-tête ATRI 53 o = u16 dimension de la
; grille, u32 taille d'une cellule (m, → +0x8A), u16 nombre de groupes de détail (→ +0x8E, 4
; au plus), 4 u32 rayon de chaque groupe (m, → +0x90), 4 u32 hauteur de visibilité de chaque
; groupe (m, → +0xA0), string[13] nom du .TRI. Un triangle .TRI de groupe g n'est dessiné que
; si l'observateur est plus bas que la hauteur du groupe et que le triangle est à moins du
; rayon du groupe (TriOverlay_RenderRegion_31BFF).
; ==============================================================================================
Terrain_LoadATRIChunk_A7F09		proc far

var_86		= word ptr -86h
var_36		= word ptr -36h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_1E		= word ptr -1Eh
var_E		= word ptr -0Eh
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 86h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	al, [si]
		mov	ah, 0
		or	ax, ax
		jz	short loc_A7F23
		jmp	loc_A7FFD

loc_A7F23:
		push	0
		push	large 49525441h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A7F3B
		jmp	loc_A7FFD

loc_A7F3B:
		push	large 35h
		push	ss
		lea	ax, [bp+var_36]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_86]
		push	ax
		push	large 0
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_233C
		add	sp, 0Ah
		lea	ax, [bp+var_86]
		push	ax
		push	[bp+var_36]
		push	[bp+arg_2]
		push	si
		call	sub_322F9
		add	sp, 8
		mov	eax, [bp+var_34]
		mov	[si+8Ah], eax
		movsx	eax, word ptr [si+7]
		mov	edx, [si+8Ah]
		imul	edx, eax
		mov	[si+82h], edx
		mov	eax, [si+82h]
		sar	eax, 1
		mov	[si+86h], eax
		mov	ax, [bp+var_30]
		mov	[si+8Eh], ax
		xor	cx, cx
		jmp	short loc_A7FD9

loc_A7FAA:
		mov	bx, cx
		shl	bx, 2
		lea	ax, [bp+var_2E]
		add	bx, ax
		mov	eax, [bx]
		mov	bx, cx
		shl	bx, 2
		mov	[bx+si+90h], eax
		mov	bx, cx
		shl	bx, 2
		lea	ax, [bp+var_1E]
		add	bx, ax
		mov	eax, [bx]
		mov	bx, cx
		shl	bx, 2
		mov	[bx+si+0A0h], eax
		inc	cx

loc_A7FD9:
		cmp	[si+8Eh], cx
		jg	short loc_A7FAA
		push	0
		mov	al, byte_7CCA2
		push	ax
		push	large dword_7CC9E
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jnz	short loc_A7FFD
		push	cs
		call	near ptr sub_A7C90

loc_A7FFD:
		mov	dword_77BF0, 0
		pop	di
		pop	si
		leave
		retf
Terrain_LoadATRIChunk_A7F09		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Terrain_ReleaseTileDescriptor_999C1 (sub_999C1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle TerrainTile_DescriptorDestruct.
; ==============================================================================================
Terrain_ReleaseTileDescriptor_A800A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A8031
		push	0
		push	si
		call	TerrainTile_DescriptorDestruct
		add	sp, 4
		test	di, 1
		jz	short loc_A8031
		push	si
		call	sub_3B2
		pop	cx

loc_A8031:
		pop	di
		pop	si
		pop	bp
		retf
Terrain_ReleaseTileDescriptor_A800A		endp
ovr287		ends
