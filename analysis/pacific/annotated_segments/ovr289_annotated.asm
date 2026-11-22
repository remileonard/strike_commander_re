ovr289		segment	para public 'OVERLAY' use16
		assume cs:ovr289
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A80F0		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_A8105
		jmp	loc_A81CB

loc_A8105:
		mov	word ptr [si], 148Eh
		cmp	byte_77BFD, 0
		jz	short loc_A8179
		push	0
		mov	al, [si+8]
		push	ax
		push	large [si+4]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	eax, [si+0Ah]
		mov	ebx, 6
		cdq
		idiv	ebx
		mov	[bp+var_6], ax
		mov	[bp+var_8], 0
		jmp	short loc_A8171

loc_A8144:
		les	bx, [bp+var_4]
		mov	dl, es:[bx+4]
		cmp	dl, 0FFh
		jz	short loc_A8157
		push	dx
		call	sub_326CB
		pop	cx

loc_A8157:
		les	bx, [bp+var_4]
		mov	dl, es:[bx+5]
		cmp	dl, 0FFh
		jz	short loc_A816A
		push	dx
		call	sub_326CB
		pop	cx

loc_A816A:
		inc	[bp+var_8]
		add	[bp+var_4], 6

loc_A8171:
		mov	ax, [bp+var_8]
		cmp	ax, [bp+var_6]
		jl	short loc_A8144

loc_A8179:
		cmp	byte ptr [si+9], 0
		jz	short loc_A819F
		cmp	dword ptr [si+4], 0
		jz	short loc_A819F
		push	0
		mov	al, [si+8]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A819F

loc_A819F:
		mov	dword ptr [si+4], 0
		mov	byte ptr [si+9], 0
		mov	dword ptr [si+0Ah], 0
		push	0
		push	si
		call	sub_320B9
		add	sp, 4
		test	di, 1
		jz	short loc_A81CB
		push	si
		call	sub_3B2
		pop	cx

loc_A81CB:
		pop	di
		pop	si
		leave
		retf
sub_A80F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A81CF		proc far

var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	dword ptr [si+4], 0
		jz	short loc_A81E7
		jmp	loc_A832B

loc_A81E7:
		push	[bp+arg_4]
		push	di
		call	sub_7844
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_A8204
		mov	eax, [di+61h]
		jmp	short loc_A8208

loc_A8204:
		mov	eax, [di+71h]

loc_A8208:
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		push	1
		push	0
		push	2
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+4], eax
		mov	byte ptr [si+8], 2
		mov	byte ptr [si+9], 1
		mov	dword ptr [si+0Ah], 0
		mov	eax, [bp+var_8]
		mov	[si+0Ah], eax
		push	0
		mov	al, [si+8]
		push	ax
		push	large [si+4]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	di
		call	sub_75C8
		add	sp, 8
		mov	word ptr [si+10h], 0
		mov	word ptr [si+0Eh], 7FFFh
		mov	[bp+var_10], 0
		push	0
		mov	al, [si+8]
		push	ax
		push	large [si+4]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_12], dx
		mov	[bp+var_14], ax
		mov	eax, [bp+var_4]
		mov	ebx, 6
		cdq
		idiv	ebx
		mov	[bp+var_16], ax
		xor	di, di
		jmp	short loc_A830F

loc_A82AF:
		cmp	byte_77BFD, 0
		jz	short loc_A82DC
		les	bx, [bp+var_14]
		mov	dl, es:[bx+4]
		cmp	dl, 0FFh
		jz	short loc_A82C9
		push	dx
		call	sub_326A1
		pop	cx

loc_A82C9:
		les	bx, [bp+var_14]
		mov	dl, es:[bx+5]
		cmp	dl, 0FFh
		jz	short loc_A82DC
		push	dx
		call	sub_326A1
		pop	cx

loc_A82DC:
		mov	ax, [si+10h]
		les	bx, [bp+var_14]
		cmp	ax, es:[bx]
		jge	short loc_A82ED
		mov	ax, es:[bx]
		mov	[si+10h], ax

loc_A82ED:
		mov	ax, [si+0Eh]
		les	bx, [bp+var_14]
		cmp	ax, es:[bx]
		jle	short loc_A82FE
		mov	ax, es:[bx]
		mov	[si+0Eh], ax

loc_A82FE:
		les	bx, [bp+var_14]
		movsx	eax, word ptr es:[bx]
		add	[bp+var_10], eax
		add	[bp+var_14], 6
		inc	di

loc_A830F:
		cmp	di, [bp+var_16]
		jl	short loc_A82AF
		movsx	ebx, [bp+var_16]
		mov	eax, [bp+var_10]
		cdq
		idiv	ebx
		mov	[si+12h], ax
		mov	ax, [bp+arg_6]
		mov	[si+2], ax

loc_A832B:
		pop	di
		pop	si
		leave
		retf
sub_A81CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A832F		proc far

var_EC		= word ptr -0ECh
var_8F		= dword ptr -8Fh
var_8B		= dword ptr -8Bh
var_86		= word ptr -86h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0ECh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	al, [si]
		mov	ah, 0
		or	ax, ax
		jz	short loc_A8349
		jmp	loc_A84B9

loc_A8349:
		push	large 2Eh
		push	ss
		lea	ax, [bp+var_36]
		push	ax
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_86]
		push	ax
		push	large 0
		push	0
		lea	ax, [bp+var_22]
		push	ax
		call	sub_233C
		add	sp, 0Ah
		lea	ax, [bp+var_86]
		push	ax
		push	[bp+var_2A]
		push	di
		push	si
		call	sub_322F9
		add	sp, 8
		mov	eax, [bp+var_26]
		mov	[si+82h], eax
		mov	ax, [bp+var_28]
		mov	[si+86h], ax
		mov	ax, [si+86h]
		imul	word ptr [si+7]
		mov	[si+88h], ax
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
		mov	[si+8Ch], dx
		mov	[si+8Ah], ax
		cmp	dword ptr [si+8Ah], 0
		jnz	short loc_A83D4
		push	0E003h
		call	sub_1DDFE
		pop	cx

loc_A83D4:
		lea	ax, [bp+var_EC]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_EC], 508h
		mov	[bp+var_8B], 100h
		mov	[bp+var_8F], 0
		mov	[bp+var_EC], 0E61h
		push	6
		mov	ax, di
		add	ax, 208h
		push	ax
		call	sub_7844
		add	sp, 4
		mov	ax, di
		add	ax, 208h
		push	ax
		call	StreamReader_GetCapacity_6C5C7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		mov	ax, [di+275h]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_A8434
		mov	eax, [di+269h]
		jmp	short loc_A8439

loc_A8434:
		mov	eax, [di+279h]

loc_A8439:
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		push	0
		push	edx
		push	large [bp+var_4]
		mov	ax, di
		add	ax, 208h
		push	ax
		lea	ax, [bp+var_EC]
		push	ax
		call	sub_6C024
		add	sp, 0Eh
		push	large 0FFFFFFFFh
		mov	ax, [si+9]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	large [si+8Ah]
		lea	ax, [bp+var_EC]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_EC]
		push	ax
		call	sub_6C2A4
		pop	cx
		mov	ax, [bp+var_36]
		mov	[si+8Eh], ax
		mov	ax, [bp+var_34]
		mov	[si+90h], ax
		mov	eax, [bp+var_32]
		mov	[si+96h], eax
		mov	eax, [bp+var_2E]
		mov	[si+92h], eax
		push	0
		lea	ax, [bp+var_EC]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4

loc_A84B9:
		pop	di
		pop	si
		leave
		retf
sub_A832F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Terrain_ReleaseTileDescriptorB_99E7C (sub_99E7C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Memory_TypedFree_5C7B6 et TerrainTile_DescriptorDestruct.
; ==============================================================================================
Terrain_ReleaseTileDescriptorB_A84BD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A84F9
		push	0
		push	2
		mov	ax, si
		add	ax, 8Ah
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	si
		call	TerrainTile_DescriptorDestruct
		add	sp, 4
		test	di, 1
		jz	short loc_A84F9
		push	si
		call	sub_3B2
		pop	cx

loc_A84F9:
		pop	di
		pop	si
		pop	bp
		retf
Terrain_ReleaseTileDescriptorB_A84BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Terrain_Helper2_99EBC
; (sub_99EBC de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, aucun appel externe visible (22 lignes).
; ==============================================================================================
Terrain_Helper2_A84FD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	word ptr [si+1]
		push	[bp+arg_2]
		nop
		push	cs
		call	near ptr Terrain_Helper3_A8516
		add	sp, 6
		pop	si
		pop	bp
		retf
Terrain_Helper2_A84FD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Terrain_Helper3_99ED5 (sub_99ED5 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, thunk voisin
; uniquement (41 lignes).
; ==============================================================================================
Terrain_Helper3_A8516		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	ax, [bp+arg_2]
		mov	[si+43h], ax
		mov	[si+45h], di
		mov	ax, [di+7]
		mov	[si+47h], ax
		mov	ax, [di+86h]
		mov	[si+49h], ax
		push	large [di+92h]
		push	large [di+96h]
		movsx	eax, word ptr [di+90h]
		push	eax
		mov	bx, [si+43h]
		push	word ptr [bx+290h]
		push	si
		call	sub_73FF4
		add	sp, 10h
		pop	di
		pop	si
		pop	bp
		retf
Terrain_Helper3_A8516		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Terrain_Helper4_99F1C
; (sub_99F1C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, thunk voisin uniquement (48 lignes).
; ==============================================================================================
Terrain_Helper4_A855D		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[si+45h], di
		mov	ax, [di+7]
		mov	[si+47h], ax
		mov	ax, [di+86h]
		mov	[si+49h], ax
		movsx	eax, word ptr [di+90h]
		mov	[si+9], eax
		mov	eax, [di+92h]
		mov	[bp+var_4], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si+1], eax
		push	word ptr [di+8Eh]
		push	si
		call	sub_74003
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Terrain_Helper4_A855D		endp
ovr289		ends
