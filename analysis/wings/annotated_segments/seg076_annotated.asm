seg076		segment	para public 'CODE' use16
		assume cs:seg076
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0DFh, 33h, 59h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à VGA_LoadPalette
; (sub_2DD54 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à VGA_LoadPalette (sub_1EBFF
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à VGA_LoadPalette
; (sub_2E801 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,54L — programme le DAC de palette VGA (port 0x3C8/0x3C9, synchronisation retrace
; via word_70EA0) avec une plage de triplets RGB : chargement de palette couleur VGA (bas
; niveau matériel).
; ==============================================================================================
VGA_LoadPalette		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		les	bx, [si+3]
		mov	ah, [si+2]
		mov	cx, [si]
		mov	dx, 3C8h

loc_34FE7:
		test	cl, 7Fh
		jnz	short loc_34FFA
		mov	dx, word_5DD66

loc_34FF0:
		in	al, dx
		test	al, 8
		jnz	short loc_34FF0

loc_34FF5:
		in	al, dx
		test	al, 8
		jz	short loc_34FF5

loc_34FFA:
		mov	dx, 3C8h
		mov	al, ah
		inc	ah
		out	dx, al
		jmp	short loc_35004

loc_35004:
		inc	dx
		mov	al, es:[bx]
		out	dx, al
		jmp	short loc_3500B

loc_3500B:
		mov	al, es:[bx+1]
		out	dx, al
		jmp	short loc_35012

loc_35012:
		mov	al, es:[bx+2]
		out	dx, al
		jmp	short loc_35019

loc_35019:
		add	bx, 3
		dec	dx
		loop	short loc_34FE7
		pop	si
		pop	bp
		retf
VGA_LoadPalette		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35022		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		les	bx, word ptr [bp+arg_2]
		mov	al, es:[bx]
		mov	[si+2], al
		add	word ptr [bp+arg_2], 2
		les	bx, word ptr [bp+arg_2]
		mov	ax, es:[bx]
		mov	[si], ax
		add	word ptr [bp+arg_2], 2
		mov	di, [si]
		imul	di, di, 3
		cmp	dword ptr [si+3], 0
		jnz	short loc_3506C
		push	1
		push	0
		push	2
		movzx	eax, di
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[si+5], dx
		mov	[si+3], ax

loc_3506C:
		push	di
		push	large [bp+arg_2]
		push	large [si+3]
		call	sub_3609
		add	sp, 0Ah
		pop	di
		pop	si
		pop	bp
		retf
sub_35022		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_DestructResource (sub_2DDF9 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Palette_DestructResource (sub_1ECAB de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à Palette_DestructResource (sub_2E8A6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,21L — libère une chaîne (+3 via sub_5C7B6) et
; réinitialise le pointeur : destructeur de ressource palette.
; ==============================================================================================
Palette_DestructResource_35081		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	2
		mov	ax, si
		add	ax, 3
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	dword ptr [si+3], 0
		pop	si
		pop	bp
		retf
Palette_DestructResource_35081		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_350A8		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		or	cx, cx
		jnz	short loc_350E9
		cmp	byte ptr [si+84h], 3
		jnz	short loc_350D9
		push	0
		mov	al, [si+84h]
		push	ax
		push	large [si+80h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_350E1

loc_350D9:
		mov	dx, [si+82h]
		mov	ax, [si+80h]

loc_350E1:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		jmp	short loc_35131

loc_350E9:
		or	cx, cx
		jle	short loc_35107
		cmp	[si+52h], cx
		jge	short loc_350F5
		mov	cx, [si+52h]

loc_350F5:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		mov	bx, cx
		dec	bx
		shl	bx, 8
		add	dx, bx
		jmp	short loc_3512B

loc_35107:
		mov	[bp+var_6], cx
		mov	ax, [bp+var_6]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	cx, ax
		cmp	[si+52h], cx
		jge	short loc_3511C
		mov	cx, [si+52h]

loc_3511C:
		mov	ax, [si+8Ch]
		mov	dx, [si+8Ah]
		mov	bx, cx
		shl	bx, 8
		sub	dx, bx

loc_3512B:
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx

loc_35131:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		pop	si
		leave
		retf
sub_350A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Table_LookupByRange_2DEC8 (sub_2DEC8 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 3 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Table_LookupByRange_2E975 (sub_2E975 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-16 (rendu des objets, OBJECT_RENDER.md).
; GAMME RANG D'UNE COULEUR : première entrée (15 o, [+5Ah], nombre [+58h]) telle que e+6 ≤
; couleur ≤ e+6 + e+0Dh (première teinte + 3e champ de RANG, bornes comprises : cmp [bx+6],di
; / jg, add ax,[bx+0Dh] / cmp ax,di / jl) ; sinon FFFFh.
; ==============================================================================================
Table_LookupByRange_3513A		proc far

var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0FFFFh
		mov	[bp+var_3], 0
		xor	cx, cx
		jmp	short loc_35195

loc_35155:
		mov	ax, cx
		imul	ax, ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	[bx+6], di
		jg	short loc_35187
		mov	ax, cx
		imul	ax, ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		mov	ax, [bx+6]
		mov	dx, cx
		imul	dx, dx, 0Fh
		mov	bx, [si+5Ah]
		add	bx, dx
		add	ax, [bx+0Dh]
		cmp	ax, di
		jl	short loc_35187
		mov	ax, 1
		jmp	short loc_35189

loc_35187:
		xor	ax, ax

loc_35189:
		or	al, al
		jz	short loc_35194
		mov	[bp+var_2], cx
		mov	[bp+var_3], 1

loc_35194:
		inc	cx

loc_35195:
		cmp	[si+58h], cx
		jle	short loc_351A3
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jz	short loc_35155

loc_351A3:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
Table_LookupByRange_3513A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_351AA		proc far

var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0FFFFh
		mov	[bp+var_3], 0
		xor	cx, cx
		jmp	short loc_35230

loc_351C5:
		mov	ax, cx
		imul	ax, ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	[bx+6], di
		jg	short loc_351F7
		mov	ax, cx
		imul	ax, ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		mov	ax, [bx+6]
		mov	dx, cx
		imul	dx, dx, 0Fh
		mov	bx, [si+5Ah]
		add	bx, dx
		add	ax, [bx+0Dh]
		cmp	ax, di
		jl	short loc_351F7
		mov	ax, 1
		jmp	short loc_351F9

loc_351F7:
		xor	ax, ax

loc_351F9:
		or	al, al
		jz	short loc_3522F
		mov	ax, cx
		imul	ax, ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	byte ptr [bx+2], 0
		jz	short loc_35222
		mov	ax, cx
		imul	ax, ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	byte ptr [bx+3], 0
		jz	short loc_35222
		mov	ax, 1
		jmp	short loc_35224

loc_35222:
		xor	ax, ax

loc_35224:
		or	al, al
		jz	short loc_3522F
		mov	[bp+var_2], cx
		mov	[bp+var_3], 1

loc_3522F:
		inc	cx

loc_35230:
		cmp	[si+58h], cx
		jle	short loc_3523E
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jz	short loc_351C5

loc_3523E:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_351AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Palette_SelectFogRow_2DFD3 (sub_2DFD3 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Palette_SelectFogRow_2EA80 (sub_2EA80 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-14. CHOISIT LA LIGNE
; DE SEUILS DE BROUILLARD de la palette (arg_0 = palette, arg_2 = valeur). Si valeur ≥ [+7Ch]
; (= lignes [+46h] << pas [+7Ah], 10 240) → dernière ligne ; sinon ligne = valeur >> [+7Ah] (÷
; 512). Ligne = (1 << [+4Eh]) dd dans le tableau [+42h] ; range son adresse dans [+48h], son
; 1er seuil dans [+72h], son dernier dans [+76h], invalide le cache dword_6E9BA. Appelée par
; Terrain_UpdateLODPerFrame. Utilisée ensuite par Palette_ShadeIndexWithFog_2F24E.
; Ex-'Texture_SelectMipLevel'.
; ==============================================================================================
Palette_SelectFogRow_35245		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	eax, [di+7Ch]
		cmp	eax, [bp+arg_2]
		jg	short loc_35273
		mov	ax, [di+44h]
		mov	dx, [di+42h]
		mov	bx, [di+46h]
		dec	bx
		mov	cl, [di+4Eh]
		shl	bx, cl
		shl	bx, 2
		add	dx, bx
		mov	[di+4Ah], ax
		mov	[di+48h], dx
		jmp	short loc_35293

loc_35273:
		mov	cl, [di+7Ah]
		mov	eax, [bp+arg_2]
		sar	eax, cl
		mov	cl, [di+4Eh]
		shl	ax, cl
		shl	ax, 2
		mov	dx, [di+44h]
		mov	bx, [di+42h]
		add	bx, ax
		mov	[di+4Ah], dx
		mov	[di+48h], bx

loc_35293:
		les	bx, [di+48h]
		mov	eax, es:[bx]
		mov	[di+72h], eax
		mov	ax, [di+4Ch]
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx-4]
		mov	[di+76h], eax
		mov	dword_5C3BA, 0FFFFFFFFh
		pop	di
		pop	si
		pop	bp
		retf
Palette_SelectFogRow_35245		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Texture_ResolveMipCached (sub_2EAF7 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far,164L — variante avec cache (dword_6E9BA/BE/C2) de la
; sélection de mip-level selon la distance/échelle : résolution de mipmap avec cache d'état
; (optimisation du texture mapping).
; ==============================================================================================
Texture_ResolveMipCached		proc far

var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		sar	eax, 8
		mov	[bp+arg_2], eax
		cmp	dword_5C3BA, 0FFFFFFFFh
		jz	short loc_352FD
		cmp	eax, dword_5C3BA
		jl	short loc_352FD
		mov	eax, [si+76h]
		cmp	eax, dword_5C3BA
		jg	short loc_352EF
		jmp	loc_353FB

loc_352EF:
		mov	eax, [bp+arg_2]
		cmp	eax, dword_5C3BE
		jge	short loc_352FD
		jmp	loc_353FB

loc_352FD:
		mov	eax, [si+72h]
		cmp	eax, [bp+arg_2]
		jle	short loc_3531E
		mov	dword_5C3BA, 0
		mov	dword_5C3BE, eax
		xor	eax, eax

loc_35317:
		mov	dword_5C3C2, eax
		jmp	loc_353FF

loc_3531E:
		mov	eax, [si+76h]
		cmp	eax, [bp+arg_2]
		jg	short loc_35336
		mov	dword_5C3BA, eax
		mov	dword_5C3BE, eax
		mov	eax, [si+6Ah]
		jmp	short loc_35317

loc_35336:
		mov	dx, [si+4Ch]
		sar	dx, 1
		dec	dx
		mov	ax, [si+4Eh]
		dec	ax
		mov	[bp+var_2], ax
		mov	[bp+var_B], 0
		jmp	loc_353DC

loc_3534A:
		dec	[bp+var_2]
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx]
		mov	[bp+var_6], eax
		mov	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]
		mov	[bp+var_A], eax
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_6]
		jl	short loc_35390
		cmp	eax, [bp+var_A]
		jge	short loc_35390
		mov	eax, [bp+var_6]
		mov	dword_5C3BA, eax
		mov	eax, [bp+var_A]
		jmp	short loc_353B2

loc_35390:
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_A]
		jnz	short loc_353BC
		inc	dx
		mov	eax, [bp+var_A]
		mov	dword_5C3BA, eax
		les	bx, [si+48h]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx+4]

loc_353B2:
		mov	dword_5C3BE, eax
		mov	[bp+var_B], 1
		jmp	short loc_353DC

loc_353BC:
		mov	eax, [bp+arg_2]
		cmp	eax, [bp+var_6]
		jge	short loc_353D2
		mov	ax, 1
		mov	cl, byte ptr [bp+var_2]
		shl	ax, cl
		sub	dx, ax
		jmp	short loc_353DC

loc_353D2:
		mov	ax, 1
		mov	cl, byte ptr [bp+var_2]
		shl	ax, cl
		add	dx, ax

loc_353DC:
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_353E8
		jmp	loc_3534A

loc_353E8:
		mov	ax, dx
		inc	ax
		movsx	eax, ax
		mov	cl, [si+68h]
		sub	cl, [si+4Eh]
		shl	eax, cl
		jmp	loc_35317

loc_353FB:
		mov	eax, dword_5C3C2

loc_353FF:
		shld	edx, eax, 10h
		pop	si
		leave
		retf
Texture_ResolveMipCached		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35407		proc far

var_36		= dword ptr -36h
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= dword ptr -26h
var_21		= byte ptr -21h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	dword ptr [di], 100h
		jle	short loc_35423
		mov	ax, 1
		jmp	short loc_35425

loc_35423:
		xor	ax, ax

loc_35425:
		or	al, al
		jz	short loc_35438
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	[di], eax

loc_35438:
		cmp	dword ptr [di], 0
		jz	short loc_35443
		mov	ax, 1
		jmp	short loc_35445

loc_35443:
		xor	ax, ax

loc_35445:
		or	al, al
		jz	short loc_3544F
		mov	byte ptr [si+3Bh], 1
		jmp	short loc_35453

loc_3544F:
		mov	byte ptr [si+3Bh], 0

loc_35453:
		cmp	dword ptr [di], 100h
		jnz	short loc_35461
		mov	ax, 1
		jmp	short loc_35463

loc_35461:
		xor	ax, ax

loc_35463:
		or	al, al
		jz	short loc_35471
		cmp	byte ptr [si+3Eh], 0
		jnz	short loc_35471
		mov	byte ptr [si+3Bh], 0

loc_35471:
		push	1
		sub	sp, 4
		mov	eax, dword_5FF72
		mov	[bp+var_36], eax
		push	si
		nop
		push	cs
		call	near ptr sub_358B5
		add	sp, 8
		mov	bx, [bp+arg_4]
		cmp	byte ptr [bx+4], 3
		jnz	short loc_354A6
		push	0
		mov	al, [bx+4]
		push	ax
		push	large [bx]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_354AE

loc_354A6:
		mov	bx, [bp+arg_4]
		mov	dx, [bx+2]
		mov	ax, [bx]

loc_354AE:
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		add	word ptr [bp+var_8], 4
		cmp	byte ptr [si+21h], 3
		jnz	short loc_354D5
		push	0
		mov	al, [si+21h]
		push	ax
		push	large [si+1Dh]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_354DB

loc_354D5:
		mov	dx, [si+1Fh]
		mov	ax, [si+1Dh]

loc_354DB:
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [si+3]
		mov	[bp+var_10], eax
		cmp	byte ptr [si+0Dh], 3
		jnz	short loc_35506
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large [si+9]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_3550C

loc_35506:
		mov	dx, [si+0Bh]
		mov	ax, [si+9]

loc_3550C:
		mov	[bp+var_12], dx
		mov	[bp+var_14], ax
		add	[bp+var_14], 4
		mov	eax, [bp+var_8]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_1C], eax
		mov	al, [si+3Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_35579
		mov	byte ptr [si+3Ch], 0
		mov	[bp+var_1E], 0
		jmp	short loc_3556D

loc_3553A:
		les	bx, word ptr [bp+var_18]
		mov	cl, es:[bx]
		les	bx, [bp+var_14]
		sub	cl, es:[bx]
		les	bx, word ptr [bp+var_1C]
		mov	es:[bx], cl
		mov	al, cl
		cbw
		mov	[bp+var_20], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	cl, al
		cmp	[si+3Ch], cl
		jge	short loc_35561
		mov	[si+3Ch], cl

loc_35561:
		inc	[bp+var_1E]
		inc	word ptr [bp+var_1C]
		inc	word ptr [bp+var_18]
		inc	[bp+var_14]

loc_3556D:
		mov	ax, [si+7]
		cmp	ax, [bp+var_1E]
		jg	short loc_3553A
		mov	byte ptr [si+3Dh], 1

loc_35579:
		cmp	dword ptr [di], 0
		jle	short loc_35584
		mov	ax, 1
		jmp	short loc_35586

loc_35584:
		xor	ax, ax

loc_35586:
		or	al, al
		jnz	short loc_3558D
		jmp	loc_3563A

loc_3558D:
		mov	al, [si+3Ch]
		cbw
		mov	[bp+var_28], ax
		movsx	eax, [bp+var_28]
		mov	edx, [di]
		imul	edx, eax
		mov	[bp+var_2C], edx
		mov	eax, [bp+var_2C]
		mov	[bp+var_26], eax
		cmp	[bp+var_26], 0
		jg	short loc_355B8
		mov	ax, 1
		jmp	short loc_355BA

loc_355B8:
		xor	ax, ax

loc_355BA:
		or	al, al
		jz	short loc_355C4
		mov	[bp+var_21], 0
		jmp	short loc_355D9

loc_355C4:
		mov	eax, [bp+var_26]
		sar	eax, 8
		mov	[bp+var_21], al
		cmp	[bp+var_21], 0
		jnz	short loc_355D9
		mov	[bp+var_21], 1

loc_355D9:
		mov	[bp+var_1E], 0
		jmp	short loc_3562C

loc_355E0:
		les	bx, word ptr [bp+var_C]
		mov	cl, es:[bx]
		or	cl, cl
		jle	short loc_355F8
		cmp	cl, [bp+var_21]
		jle	short loc_355F4
		sub	cl, [bp+var_21]
		jmp	short loc_35612

loc_355F4:
		mov	cl, 0
		jmp	short loc_35612

loc_355F8:
		or	cl, cl
		jge	short loc_35612
		mov	al, cl
		cbw
		neg	ax
		push	ax
		mov	al, [bp+var_21]
		cbw
		pop	dx
		cmp	dx, ax
		jle	short loc_35610
		add	cl, [bp+var_21]
		jmp	short loc_35612

loc_35610:
		mov	cl, 0

loc_35612:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx]
		sub	al, cl
		les	bx, word ptr [bp+var_10]
		mov	es:[bx], al
		inc	[bp+var_1E]
		inc	word ptr [bp+var_C]
		inc	word ptr [bp+var_8]
		inc	word ptr [bp+var_10]

loc_3562C:
		mov	ax, [si+7]
		cmp	ax, [bp+var_1E]
		jg	short loc_355E0
		push	si
		push	cs
		call	near ptr VGA_LoadPalette
		pop	cx

loc_3563A:
		pop	di
		pop	si
		leave
		retf
sub_35407		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3563E		proc far

var_30		= dword ptr -30h
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1B		= byte ptr -1Bh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 100h
		jle	short loc_3565A
		mov	ax, 1
		jmp	short loc_3565C

loc_3565A:
		xor	ax, ax

loc_3565C:
		or	al, al
		jz	short loc_35672
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	bx, [bp+arg_2]
		mov	[bx], eax

loc_35672:
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 0
		jz	short loc_35680
		mov	ax, 1
		jmp	short loc_35682

loc_35680:
		xor	ax, ax

loc_35682:
		or	al, al
		jz	short loc_3568C
		mov	byte ptr [si+3Bh], 1
		jmp	short loc_35690

loc_3568C:
		mov	byte ptr [si+3Bh], 0

loc_35690:
		push	1
		sub	sp, 4
		mov	eax, dword_5FF72
		mov	[bp+var_30], eax
		push	si
		nop
		push	cs
		call	near ptr sub_358B5
		add	sp, 8
		cmp	byte ptr [si+3Eh], 2
		jnz	short loc_356C4
		mov	al, [si+3Fh]
		cmp	al, [bp+arg_4]
		jz	short loc_356DE
		mov	al, [si+40h]
		cmp	al, [bp+arg_6]
		jz	short loc_356DE
		mov	al, [si+41h]
		cmp	al, [bp+arg_8]
		jz	short loc_356DE

loc_356C4:
		mov	byte ptr [si+3Eh], 2
		mov	byte ptr [si+3Dh], 0
		mov	al, [bp+arg_4]
		mov	[si+3Fh], al
		mov	al, [bp+arg_6]
		mov	[si+40h], al
		mov	al, [bp+arg_8]
		mov	[si+41h], al

loc_356DE:
		cmp	byte ptr [si+21h], 3
		jnz	short loc_356FB
		push	0
		mov	al, [si+21h]
		push	ax
		push	large [si+1Dh]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_35701

loc_356FB:
		mov	dx, [si+1Fh]
		mov	ax, [si+1Dh]

loc_35701:
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [si+3]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_14], eax
		mov	di, si
		add	di, 3Fh
		mov	al, [si+3Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_35785
		mov	byte ptr [si+3Ch], 0
		mov	[bp+var_16], 0
		jmp	short loc_3577A

loc_35738:
		mov	[bp+var_18], 0
		jmp	short loc_3576C

loc_3573F:
		mov	cl, [di]
		les	bx, word ptr [bp+var_14]
		sub	cl, es:[bx]
		les	bx, word ptr [bp+var_10]
		mov	es:[bx], cl
		mov	al, cl
		cbw
		mov	[bp+var_1A], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	cl, al
		cmp	[si+3Ch], cl
		jge	short loc_35762
		mov	[si+3Ch], cl

loc_35762:
		inc	[bp+var_18]
		inc	word ptr [bp+var_10]
		inc	word ptr [bp+var_14]
		inc	di

loc_3576C:
		cmp	[bp+var_18], 3
		jl	short loc_3573F
		mov	di, si
		add	di, 3Fh
		inc	[bp+var_16]

loc_3577A:
		mov	ax, [si]
		cmp	ax, [bp+var_16]
		ja	short loc_35738
		mov	byte ptr [si+3Dh], 1

loc_35785:
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 0
		jle	short loc_35793
		mov	ax, 1
		jmp	short loc_35795

loc_35793:
		xor	ax, ax

loc_35795:
		or	al, al
		jnz	short loc_3579C
		jmp	loc_3585F

loc_3579C:
		mov	al, [si+3Ch]
		cbw
		mov	[bp+var_22], ax
		movsx	eax, [bp+var_22]
		mov	bx, [bp+arg_2]
		mov	edx, [bx]
		imul	edx, eax
		mov	[bp+var_26], edx
		mov	eax, [bp+var_26]
		mov	[bp+var_20], eax
		cmp	[bp+var_20], 0
		jg	short loc_357CA
		mov	ax, 1
		jmp	short loc_357CC

loc_357CA:
		xor	ax, ax

loc_357CC:
		or	al, al
		jz	short loc_357D6
		mov	[bp+var_1B], 0
		jmp	short loc_357EB

loc_357D6:
		mov	eax, [bp+var_20]
		sar	eax, 8
		mov	[bp+var_1B], al
		cmp	[bp+var_1B], 0
		jnz	short loc_357EB
		mov	[bp+var_1B], 1

loc_357EB:
		mov	di, si
		add	di, 3Fh
		mov	[bp+var_16], 0
		jmp	short loc_35852

loc_357F7:
		mov	[bp+var_18], 0
		jmp	short loc_35844

loc_357FE:
		les	bx, word ptr [bp+var_8]
		mov	cl, es:[bx]
		or	cl, cl
		jle	short loc_35816
		cmp	cl, [bp+var_1B]
		jle	short loc_35812
		sub	cl, [bp+var_1B]
		jmp	short loc_35830

loc_35812:
		mov	cl, 0
		jmp	short loc_35830

loc_35816:
		or	cl, cl
		jge	short loc_35830
		mov	al, cl
		cbw
		neg	ax
		push	ax
		mov	al, [bp+var_1B]
		cbw
		pop	dx
		cmp	dx, ax
		jle	short loc_3582E
		add	cl, [bp+var_1B]
		jmp	short loc_35830

loc_3582E:
		mov	cl, 0

loc_35830:
		mov	al, [di]
		sub	al, cl
		les	bx, word ptr [bp+var_C]
		mov	es:[bx], al
		inc	[bp+var_18]
		inc	word ptr [bp+var_8]
		inc	word ptr [bp+var_C]
		inc	di

loc_35844:
		cmp	[bp+var_18], 3
		jl	short loc_357FE
		mov	di, si
		add	di, 3Fh
		inc	[bp+var_16]

loc_35852:
		mov	ax, [si]
		cmp	ax, [bp+var_16]
		ja	short loc_357F7
		push	si
		push	cs
		call	near ptr VGA_LoadPalette
		pop	cx

loc_3585F:
		pop	di
		pop	si
		leave
		retf
sub_3563E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Cockpit_PanAzimuthUpdate_2E46C (sub_2E46C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Cockpit_PanAzimuthUpdate (sub_1F54F de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Cockpit_PanAzimuthUpdate (sub_2F064 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,28L — reset
; optionnel d'état (+0x3D/0x3E) puis appelle sub_2EC42 sur le champ +9 : pilotage de la
; transition d'azimut/pan de la caméra du cockpit (appelé par
; Cockpit_ViewPanTransitionMain_15B67).
; ==============================================================================================
Cockpit_PanAzimuthUpdate_35863		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+3Eh], 0
		jz	short loc_35878
		mov	byte ptr [si+3Eh], 0
		mov	byte ptr [si+3Dh], 0

loc_35878:
		mov	ax, si
		add	ax, 9
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_35407
		add	sp, 6
		pop	si
		pop	bp
		retf
Cockpit_PanAzimuthUpdate_35863		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Cockpit_PanAzimuthUpdate_2E495 (sub_2E495 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions,
; 3 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Cockpit_PanAzimuthUpdate (sub_1F54F de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Cockpit_PanAzimuthUpdate (sub_2F064 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,28L — reset optionnel d'état
; (+0x3D/0x3E) puis appelle sub_2EC42 sur le champ +9 : pilotage de la transition d'azimut/pan
; de la caméra du cockpit (appelé par Cockpit_ViewPanTransitionMain_15B67).
; ==============================================================================================
Cockpit_PanAzimuthUpdate_3588C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+3Eh], 1
		jz	short loc_358A1
		mov	byte ptr [si+3Eh], 1
		mov	byte ptr [si+3Dh], 0

loc_358A1:
		mov	ax, si
		add	ax, 13h
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_35407
		add	sp, 6
		pop	si
		pop	bp
		retf
Cockpit_PanAzimuthUpdate_3588C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_358B5		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 37h
		mov	eax, [bp+arg_2]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		mov	di, word ptr [bp+var_4+1]
		or	di, di
		jnz	short loc_358F0
		mov	di, 1

loc_358F0:
		mov	ax, [si+33h]
		sub	ax, di
		mov	di, ax
		or	di, di
		jge	short loc_358FD
		xor	di, di

loc_358FD:
		cmp	[bp+arg_6], 0
		jnz	short loc_3590B
		cmp	[si+31h], di
		jnz	short loc_3590B
		jmp	loc_359A9

loc_3590B:
		mov	al, [bp+arg_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3591E
		mov	eax, [si+3]
		mov	[bp+var_C], eax
		jmp	short loc_3594B

loc_3591E:
		cmp	byte ptr [si+0Dh], 3
		jnz	short loc_3593B
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large [si+9]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_35941

loc_3593B:
		mov	dx, [si+0Bh]
		mov	ax, [si+9]

loc_35941:
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		add	word ptr [bp+var_C], 4

loc_3594B:
		cmp	byte ptr [si+2Bh], 3
		jnz	short loc_35968
		push	0
		mov	al, [si+2Bh]
		push	ax
		push	large [si+27h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_3596E

loc_35968:
		mov	dx, [si+29h]
		mov	ax, [si+27h]

loc_3596E:
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		add	word ptr [bp+var_C], 2D0h
		mov	bx, [si+35h]
		imul	bx, bx, 3
		mov	ax, di
		imul	bx
		add	word ptr [bp+var_10], ax
		push	bx
		push	large [bp+var_10]
		push	large [bp+var_C]
		call	sub_3609
		add	sp, 0Ah
		mov	al, [bp+arg_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_359A6
		push	si
		push	cs
		call	near ptr VGA_LoadPalette
		pop	cx

loc_359A6:
		mov	[si+31h], di

loc_359A9:
		pop	di
		pop	si
		leave
		retf
sub_358B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_359AD		proc far
		push	bp
		mov	bp, sp
		mov	word_600FE, 0
		mov	dword_60101, 0
		mov	dword_60107, 0
		mov	byte_6010B, 2
		mov	byte_6010C, 0
		mov	dword_6010D, 0
		mov	dword_60111, 0
		mov	byte_60115, 2
		mov	byte_60116, 0
		mov	dword_60117, 0
		mov	dword_6011B, 0
		mov	byte_6011F, 2
		mov	byte_60120, 0
		mov	dword_60121, 0
		mov	dword_60125, 0
		mov	byte_60129, 2
		mov	byte_6012A, 0
		mov	dword_6012B, 0
		mov	dword_6015C, 0
		mov	byte_60160, 2
		mov	byte_60161, 0
		mov	dword_60162, 0
		mov	dword_6017E, 0
		mov	byte_60182, 2
		mov	byte_60183, 0
		mov	dword_60184, 0
		push	63DEh
		call	sub_58F27
		pop	cx
		pop	bp
		retf
sub_359AD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35A72		proc far
		push	bp
		mov	bp, sp
		push	2
		push	63DEh
		call	sub_58F36
sub_35A72		endp

; START OF FUNCTION CHUNK FOR sub_35A72
		db 83h
; END OF FUNCTION CHUNK FOR sub_35A72
seg076		ends
