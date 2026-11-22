ovr292		segment	para public 'OVERLAY' use16
		assume cs:ovr292
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Terrain_LoadHeightmapFromIFFC_9AC10 (sub_9AC10 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine ReadFieldGroupA_64A19, Stdio_ArgTrampoline5, Terrain_HeightmapAllocate — variante de
; Terrain_LoadHeightmapFromIFF_998C0 (seg292).
; ==============================================================================================
Terrain_LoadHeightmapFromIFFC_A9270		proc far

var_6C		= word ptr -6Ch
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	al, [si]
		mov	ah, 0
		or	ax, ax
		jz	short loc_A9289
		jmp	loc_A9366

loc_A9289:
		push	0
		push	large 534A424Fh
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A92A1
		jmp	loc_A9366

loc_A92A1:
		push	large 1Bh
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_6C]
		push	ax
		push	large 0
		push	0
		lea	ax, [bp+var_E]
		push	ax
		call	sub_233C
		add	sp, 0Ah
		lea	ax, [bp+var_6C]
		push	ax
		push	[bp+var_1C]
		push	[bp+arg_2]
		push	si
		call	sub_322F9
		add	sp, 8
		mov	eax, [bp+var_1A]
		mov	[si+8Ah], eax
		movsx	eax, word ptr [si+7]
		mov	edx, [si+8Ah]
		imul	edx, eax
		mov	[si+82h], edx
		mov	eax, [si+82h]
		sar	eax, 1
		mov	[si+86h], eax
		mov	eax, [bp+var_16]
		mov	[si+8Eh], eax
		mov	eax, [bp+var_12]
		mov	[si+92h], eax
		cmp	dword_77C30, 0
		jnz	short loc_A9366
		push	1
		push	0
		push	2
		mov	ax, [si+7]
		shl	ax, 2
		imul	word ptr [si+7]
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word_77C32, dx
		mov	word ptr dword_77C30, ax
		xor	cx, cx
		jmp	short loc_A935C

loc_A9348:
		mov	ax, cx
		shl	ax, 2
		les	bx, word ptr dword_77C30
		add	bx, ax
		mov	dword ptr es:[bx], 0
		inc	cx

loc_A935C:
		mov	ax, [si+7]
		imul	word ptr [si+7]
		cmp	ax, cx
		jg	short loc_A9348

loc_A9366:
		pop	di
		pop	si
		leave
		retf
Terrain_LoadHeightmapFromIFFC_A9270		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Terrain_Helper5_9AD0A (sub_9AD0A de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible (35 lignes).
; ==============================================================================================
Terrain_Helper5_A936A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_A9389

loc_A9375:
		mov	ax, cx
		shl	ax, 2
		les	bx, word ptr dword_77C30
		add	bx, ax
		mov	dword ptr es:[bx], 0
		inc	cx

loc_A9389:
		mov	ax, [si+7]
		imul	word ptr [si+7]
		cmp	ax, cx
		jg	short loc_A9375
		pop	si
		pop	bp
		retf
Terrain_Helper5_A936A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Terrain_ReleaseTileDescriptorC_9AD36 (sub_9AD36 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6 et TerrainTile_DescriptorDestruct.
; ==============================================================================================
Terrain_ReleaseTileDescriptorC_A9396		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A93D8
		push	0
		push	2
		push	1500h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword_77C30, 0
		push	0
		push	si
		call	TerrainTile_DescriptorDestruct
		add	sp, 4
		test	di, 1
		jz	short loc_A93D8
		push	si
		call	sub_3B2
		pop	cx

loc_A93D8:
		pop	di
		pop	si
		pop	bp
		retf
Terrain_ReleaseTileDescriptorC_A9396		endp
ovr292		ends
