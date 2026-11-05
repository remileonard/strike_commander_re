seg075		segment	para public 'CODE' use16
		assume cs:seg075
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 0C2h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à VGA_LoadPalette (sub_1EBFF de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à VGA_LoadPalette (sub_2E801 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,54L — programme
; le DAC de palette VGA (port 0x3C8/0x3C9, synchronisation retrace via word_70EA0) avec une
; plage de triplets RGB : chargement de palette couleur VGA (bas niveau matériel).
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

loc_2DD66:
		test	cl, 7Fh
		jnz	short loc_2DD79
		mov	dx, word_7AFA0

loc_2DD6F:
		in	al, dx
		test	al, 8
		jnz	short loc_2DD6F

loc_2DD74:
		in	al, dx
		test	al, 8
		jz	short loc_2DD74

loc_2DD79:
		mov	dx, 3C8h
		mov	al, ah
		inc	ah
		out	dx, al
		jmp	short loc_2DD83

loc_2DD83:
		inc	dx
		mov	al, es:[bx]
		out	dx, al
		jmp	short loc_2DD8A

loc_2DD8A:
		mov	al, es:[bx+1]
		out	dx, al
		jmp	short loc_2DD91

loc_2DD91:
		mov	al, es:[bx+2]
		out	dx, al
		jmp	short loc_2DD98

loc_2DD98:
		add	bx, 3
		dec	dx
		loop	short loc_2DD66
		pop	si
		pop	bp
		retf
VGA_LoadPalette		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_ParseBlock (sub_2E84E de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,44L — lit un type et
; une taille depuis un flux, alloue une chaîne (taille×3, RGB) et la remplit (sub_2D24=memcpy)
; : parseur de bloc palette depuis un fichier (format image LBM/PCX).
; ==============================================================================================
Palette_ParseBlock		proc far

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
		push	1
		push	0
		push	2
		movzx	eax, di
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+5], dx
		mov	[si+3], ax
		push	di
		push	large [bp+arg_2]
		push	large [si+3]
		call	sub_37C3
		add	sp, 0Ah
		pop	di
		pop	si
		pop	bp
		retf
Palette_ParseBlock		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_DestructResource (sub_1ECAB de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Palette_DestructResource (sub_2E8A6 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,21L — libère une chaîne (+3
; via sub_5C7B6) et réinitialise le pointeur : destructeur de ressource palette.
; ==============================================================================================
Palette_DestructResource		proc far

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
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword ptr [si+3], 0
		pop	si
		pop	bp
		retf
Palette_DestructResource		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Palette_ShadeTableFor_1ECD2 (sub_1ECD2 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Palette_ShadeTableFor_2E8CD (sub_2E8CD de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-16 (rendu des
; objets, OBJECT_RENDER.md). TABLE D'OMBRE ET DE BROUILLARD d'une couleur hors gamme (ex-
; Gauge_ResolveAndApplyLabel). Args (541Ah, intensité, profondeur 24.8) →
; Interp_ResolveNormalizedIndex_2F55E puis Text_ResolveTruncated_2E8F1 : pointeur de table de
; 256 o, ou 0 (couleur inchangée).
; ==============================================================================================
Palette_ShadeTableFor_2DE20		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	sub_2E828
		add	sp, 8
		push	ax
		push	si
		nop
		push	cs
		call	near ptr Palette_FadeTablePtr_2DE44
		add	sp, 4
		pop	si
		pop	bp
		retf
Palette_ShadeTableFor_2DE20		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_FadeTablePtr_2E8F1 (sub_2E8F1 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-16
; (rendu des objets, OBJECT_RENDER.md). Adresse d'une table FADE de 256 o (ex-
; Text_ResolveTruncated). n° 0 → 0 ; n° > 0 → base [+5Eh] + (min(n°, N) − 1) × 256 ; n° < 0 →
; base + [+50h] (= N × 256) + (min(|n°|, N) − 1) × 256. Les tables viennent du chunk FADE du
; FORM FTBL du fichier nommé par TABL (Palette_LoadFadeTables_989B8).
; ==============================================================================================
Palette_FadeTablePtr_2DE44		proc far

var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jnz	short loc_2DE60
		mov	[bp+var_4], 0
		jmp	short loc_2DEBE

loc_2DE60:
		or	di, di
		jle	short loc_2DE83
		cmp	[si+52h], di
		jge	short loc_2DE6C
		mov	di, [si+52h]

loc_2DE6C:
		push	0
		mov	al, [si+62h]
		push	ax
		push	large [si+5Eh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		jmp	short loc_2DEB0

loc_2DE83:
		mov	[bp+var_6], di
		mov	ax, [bp+var_6]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	di, ax
		cmp	[si+52h], di
		jge	short loc_2DE98
		mov	di, [si+52h]

loc_2DE98:
		push	0
		mov	al, [si+62h]
		push	ax
		push	large [si+5Eh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		add	ax, [si+50h]

loc_2DEB0:
		mov	bx, di
		dec	bx
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2DEBE:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	di
		pop	si
		leave
		retf
Palette_FadeTablePtr_2DE44		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Table_LookupByRange_2E975 (sub_2E975 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-16
; (rendu des objets, OBJECT_RENDER.md). GAMME RANG D'UNE COULEUR : première entrée (15 o,
; [+5Ah], nombre [+58h]) telle que e+6 ≤ couleur ≤ e+6 + e+0Dh (première teinte + 3e champ de
; RANG, bornes comprises : cmp [bx+6],di / jg, add ax,[bx+0Dh] / cmp ax,di / jl) ; sinon
; FFFFh.
; ==============================================================================================
Table_LookupByRange_2DEC8		proc far

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
		jmp	short loc_2DF23

loc_2DEE3:
		mov	ax, cx
		imul	ax, ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	[bx+6], di
		jg	short loc_2DF15
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
		jl	short loc_2DF15
		mov	ax, 1
		jmp	short loc_2DF17

loc_2DF15:
		xor	ax, ax

loc_2DF17:
		or	al, al
		jz	short loc_2DF22
		mov	[bp+var_2], cx
		mov	[bp+var_3], 1

loc_2DF22:
		inc	cx

loc_2DF23:
		cmp	[si+58h], cx
		jle	short loc_2DF31
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jz	short loc_2DEE3

loc_2DF31:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
Table_LookupByRange_2DEC8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DF38		proc far

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
		jmp	short loc_2DFBE

loc_2DF53:
		mov	ax, cx
		imul	ax, ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	[bx+6], di
		jg	short loc_2DF85
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
		jl	short loc_2DF85
		mov	ax, 1
		jmp	short loc_2DF87

loc_2DF85:
		xor	ax, ax

loc_2DF87:
		or	al, al
		jz	short loc_2DFBD
		mov	ax, cx
		imul	ax, ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	byte ptr [bx+2], 0
		jz	short loc_2DFB0
		mov	ax, cx
		imul	ax, ax, 0Fh
		mov	bx, [si+5Ah]
		add	bx, ax
		cmp	byte ptr [bx+3], 0
		jz	short loc_2DFB0
		mov	ax, 1
		jmp	short loc_2DFB2

loc_2DFB0:
		xor	ax, ax

loc_2DFB2:
		or	al, al
		jz	short loc_2DFBD
		mov	[bp+var_2], cx
		mov	[bp+var_3], 1

loc_2DFBD:
		inc	cx

loc_2DFBE:
		cmp	[si+58h], cx
		jle	short loc_2DFCC
		mov	al, [bp+var_3]
		mov	ah, 0
		or	ax, ax
		jz	short loc_2DF53

loc_2DFCC:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_2DF38		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Palette_SelectFogRow_2EA80 (sub_2EA80 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-14. CHOISIT LA LIGNE DE SEUILS DE
; BROUILLARD de la palette (arg_0 = palette, arg_2 = valeur). Si valeur ≥ [+7Ch] (= lignes
; [+46h] << pas [+7Ah], 10 240) → dernière ligne ; sinon ligne = valeur >> [+7Ah] (÷ 512).
; Ligne = (1 << [+4Eh]) dd dans le tableau [+42h] ; range son adresse dans [+48h], son 1er
; seuil dans [+72h], son dernier dans [+76h], invalide le cache dword_6E9BA. Appelée par
; Terrain_UpdateLODPerFrame. Utilisée ensuite par Palette_ShadeIndexWithFog_2F24E.
; Ex-'Texture_SelectMipLevel'.
; ==============================================================================================
Palette_SelectFogRow_2DFD3		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	eax, [di+7Ch]
		cmp	eax, [bp+arg_2]
		jg	short loc_2E001
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
		jmp	short loc_2E021

loc_2E001:
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

loc_2E021:
		les	bx, [di+48h]
		mov	eax, es:[bx]
		mov	[di+72h], eax
		mov	ax, [di+4Ch]
		shl	ax, 2
		add	bx, ax
		mov	eax, es:[bx-4]
		mov	[di+76h], eax
		mov	dword_77B30, 0FFFFFFFFh
		pop	di
		pop	si
		pop	bp
		retf
Palette_SelectFogRow_2DFD3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E04A		proc far

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
		jle	short loc_2E066
		mov	ax, 1
		jmp	short loc_2E068

loc_2E066:
		xor	ax, ax

loc_2E068:
		or	al, al
		jz	short loc_2E07B
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	[di], eax

loc_2E07B:
		cmp	dword ptr [di], 0
		jz	short loc_2E086
		mov	ax, 1
		jmp	short loc_2E088

loc_2E086:
		xor	ax, ax

loc_2E088:
		or	al, al
		jz	short loc_2E092
		mov	byte ptr [si+3Bh], 1
		jmp	short loc_2E096

loc_2E092:
		mov	byte ptr [si+3Bh], 0

loc_2E096:
		cmp	dword ptr [di], 100h
		jnz	short loc_2E0A4
		mov	ax, 1
		jmp	short loc_2E0A6

loc_2E0A4:
		xor	ax, ax

loc_2E0A6:
		or	al, al
		jz	short loc_2E0B4
		cmp	byte ptr [si+3Eh], 0
		jnz	short loc_2E0B4
		mov	byte ptr [si+3Bh], 0

loc_2E0B4:
		push	1
		sub	sp, 4
		mov	eax, dword_7CA20
		mov	[bp+var_36], eax
		push	si
		nop
		push	cs
		call	near ptr Interp_FractionalCompute
		add	sp, 8
		push	0
		mov	bx, [bp+arg_4]
		mov	al, [bx+4]
		push	ax
		push	large [bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		add	word ptr [bp+var_8], 4
		push	0
		mov	al, [si+21h]
		push	ax
		push	large [si+1Dh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [si+3]
		mov	[bp+var_10], eax
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large [si+9]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
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
		jnz	short loc_2E190
		mov	byte ptr [si+3Ch], 0
		mov	[bp+var_1E], 0
		jmp	short loc_2E184

loc_2E151:
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
		jge	short loc_2E178
		mov	[si+3Ch], cl

loc_2E178:
		inc	[bp+var_1E]
		inc	word ptr [bp+var_1C]
		inc	word ptr [bp+var_18]
		inc	[bp+var_14]

loc_2E184:
		mov	ax, [si+7]
		cmp	ax, [bp+var_1E]
		jg	short loc_2E151
		mov	byte ptr [si+3Dh], 1

loc_2E190:
		cmp	dword ptr [di], 0
		jle	short loc_2E19B
		mov	ax, 1
		jmp	short loc_2E19D

loc_2E19B:
		xor	ax, ax

loc_2E19D:
		or	al, al
		jnz	short loc_2E1A4
		jmp	loc_2E251

loc_2E1A4:
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
		jg	short loc_2E1CF
		mov	ax, 1
		jmp	short loc_2E1D1

loc_2E1CF:
		xor	ax, ax

loc_2E1D1:
		or	al, al
		jz	short loc_2E1DB
		mov	[bp+var_21], 0
		jmp	short loc_2E1F0

loc_2E1DB:
		mov	eax, [bp+var_26]
		sar	eax, 8
		mov	[bp+var_21], al
		cmp	[bp+var_21], 0
		jnz	short loc_2E1F0
		mov	[bp+var_21], 1

loc_2E1F0:
		mov	[bp+var_1E], 0
		jmp	short loc_2E243

loc_2E1F7:
		les	bx, word ptr [bp+var_C]
		mov	cl, es:[bx]
		or	cl, cl
		jle	short loc_2E20F
		cmp	cl, [bp+var_21]
		jle	short loc_2E20B
		sub	cl, [bp+var_21]
		jmp	short loc_2E229

loc_2E20B:
		mov	cl, 0
		jmp	short loc_2E229

loc_2E20F:
		or	cl, cl
		jge	short loc_2E229
		mov	al, cl
		cbw
		neg	ax
		push	ax
		mov	al, [bp+var_21]
		cbw
		pop	dx
		cmp	dx, ax
		jle	short loc_2E227
		add	cl, [bp+var_21]
		jmp	short loc_2E229

loc_2E227:
		mov	cl, 0

loc_2E229:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx]
		sub	al, cl
		les	bx, word ptr [bp+var_10]
		mov	es:[bx], al
		inc	[bp+var_1E]
		inc	word ptr [bp+var_C]
		inc	word ptr [bp+var_8]
		inc	word ptr [bp+var_10]

loc_2E243:
		mov	ax, [si+7]
		cmp	ax, [bp+var_1E]
		jg	short loc_2E1F7
		push	si
		push	cs
		call	near ptr VGA_LoadPalette
		pop	cx

loc_2E251:
		pop	di
		pop	si
		leave
		retf
sub_2E04A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_PanTransitionExtended (sub_2EE4D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; far,319L — variante de sub_2EC42 avec paramètres supplémentaires (3 flags) : contrôleur de
; transition douce avec options étendues (probable easing configurable).
; ==============================================================================================
Camera_PanTransitionExtended		proc far

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
		jle	short loc_2E271
		mov	ax, 1
		jmp	short loc_2E273

loc_2E271:
		xor	ax, ax

loc_2E273:
		or	al, al
		jz	short loc_2E289
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	bx, [bp+arg_2]
		mov	[bx], eax

loc_2E289:
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 0
		jz	short loc_2E297
		mov	ax, 1
		jmp	short loc_2E299

loc_2E297:
		xor	ax, ax

loc_2E299:
		or	al, al
		jz	short loc_2E2A3
		mov	byte ptr [si+3Bh], 1
		jmp	short loc_2E2A7

loc_2E2A3:
		mov	byte ptr [si+3Bh], 0

loc_2E2A7:
		push	1
		sub	sp, 4
		mov	eax, dword_7CA20
		mov	[bp+var_30], eax
		push	si
		nop
		push	cs
		call	near ptr Interp_FractionalCompute
		add	sp, 8
		cmp	byte ptr [si+3Eh], 2
		jnz	short loc_2E2DB
		mov	al, [si+3Fh]
		cmp	al, [bp+arg_4]
		jz	short loc_2E2F5
		mov	al, [si+40h]
		cmp	al, [bp+arg_6]
		jz	short loc_2E2F5
		mov	al, [si+41h]
		cmp	al, [bp+arg_8]
		jz	short loc_2E2F5

loc_2E2DB:
		mov	byte ptr [si+3Eh], 2
		mov	byte ptr [si+3Dh], 0
		mov	al, [bp+arg_4]
		mov	[si+3Fh], al
		mov	al, [bp+arg_6]
		mov	[si+40h], al
		mov	al, [bp+arg_8]
		mov	[si+41h], al

loc_2E2F5:
		push	0
		mov	al, [si+21h]
		push	ax
		push	large [si+1Dh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
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
		jnz	short loc_2E38E
		mov	byte ptr [si+3Ch], 0
		mov	[bp+var_16], 0
		jmp	short loc_2E383

loc_2E341:
		mov	[bp+var_18], 0
		jmp	short loc_2E375

loc_2E348:
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
		jge	short loc_2E36B
		mov	[si+3Ch], cl

loc_2E36B:
		inc	[bp+var_18]
		inc	word ptr [bp+var_10]
		inc	word ptr [bp+var_14]
		inc	di

loc_2E375:
		cmp	[bp+var_18], 3
		jl	short loc_2E348
		mov	di, si
		add	di, 3Fh
		inc	[bp+var_16]

loc_2E383:
		mov	ax, [si]
		cmp	ax, [bp+var_16]
		ja	short loc_2E341
		mov	byte ptr [si+3Dh], 1

loc_2E38E:
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx], 0
		jle	short loc_2E39C
		mov	ax, 1
		jmp	short loc_2E39E

loc_2E39C:
		xor	ax, ax

loc_2E39E:
		or	al, al
		jnz	short loc_2E3A5
		jmp	loc_2E468

loc_2E3A5:
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
		jg	short loc_2E3D3
		mov	ax, 1
		jmp	short loc_2E3D5

loc_2E3D3:
		xor	ax, ax

loc_2E3D5:
		or	al, al
		jz	short loc_2E3DF
		mov	[bp+var_1B], 0
		jmp	short loc_2E3F4

loc_2E3DF:
		mov	eax, [bp+var_20]
		sar	eax, 8
		mov	[bp+var_1B], al
		cmp	[bp+var_1B], 0
		jnz	short loc_2E3F4
		mov	[bp+var_1B], 1

loc_2E3F4:
		mov	di, si
		add	di, 3Fh
		mov	[bp+var_16], 0
		jmp	short loc_2E45B

loc_2E400:
		mov	[bp+var_18], 0
		jmp	short loc_2E44D

loc_2E407:
		les	bx, word ptr [bp+var_8]
		mov	cl, es:[bx]
		or	cl, cl
		jle	short loc_2E41F
		cmp	cl, [bp+var_1B]
		jle	short loc_2E41B
		sub	cl, [bp+var_1B]
		jmp	short loc_2E439

loc_2E41B:
		mov	cl, 0
		jmp	short loc_2E439

loc_2E41F:
		or	cl, cl
		jge	short loc_2E439
		mov	al, cl
		cbw
		neg	ax
		push	ax
		mov	al, [bp+var_1B]
		cbw
		pop	dx
		cmp	dx, ax
		jle	short loc_2E437
		add	cl, [bp+var_1B]
		jmp	short loc_2E439

loc_2E437:
		mov	cl, 0

loc_2E439:
		mov	al, [di]
		sub	al, cl
		les	bx, word ptr [bp+var_C]
		mov	es:[bx], al
		inc	[bp+var_18]
		inc	word ptr [bp+var_8]
		inc	word ptr [bp+var_C]
		inc	di

loc_2E44D:
		cmp	[bp+var_18], 3
		jl	short loc_2E407
		mov	di, si
		add	di, 3Fh
		inc	[bp+var_16]

loc_2E45B:
		mov	ax, [si]
		cmp	ax, [bp+var_16]
		ja	short loc_2E400
		push	si
		push	cs
		call	near ptr VGA_LoadPalette
		pop	cx

loc_2E468:
		pop	di
		pop	si
		leave
		retf
Camera_PanTransitionExtended		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Cockpit_PanAzimuthUpdate (sub_1F54F de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Cockpit_PanAzimuthUpdate (sub_2F064 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,28L — reset optionnel d'état
; (+0x3D/0x3E) puis appelle sub_2EC42 sur le champ +9 : pilotage de la transition d'azimut/pan
; de la caméra du cockpit (appelé par Cockpit_ViewPanTransitionMain_15B67).
; ==============================================================================================
Cockpit_PanAzimuthUpdate_2E46C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+3Eh], 0
		jz	short loc_2E481
		mov	byte ptr [si+3Eh], 0
		mov	byte ptr [si+3Dh], 0

loc_2E481:
		mov	ax, si
		add	ax, 9
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_2E04A
		add	sp, 6
		pop	si
		pop	bp
		retf
Cockpit_PanAzimuthUpdate_2E46C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Cockpit_PanAzimuthUpdate (sub_1F54F de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à Cockpit_PanAzimuthUpdate
; (sub_2F064 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,28L — reset optionnel d'état (+0x3D/0x3E) puis appelle sub_2EC42 sur le champ +9
; : pilotage de la transition d'azimut/pan de la caméra du cockpit (appelé par
; Cockpit_ViewPanTransitionMain_15B67).
; ==============================================================================================
Cockpit_PanAzimuthUpdate_2E495		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+3Eh], 1
		jz	short loc_2E4AA
		mov	byte ptr [si+3Eh], 1
		mov	byte ptr [si+3Dh], 0

loc_2E4AA:
		mov	ax, si
		add	ax, 13h
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_2E04A
		add	sp, 6
		pop	si
		pop	bp
		retf
Cockpit_PanAzimuthUpdate_2E495		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Interp_FractionalCompute (sub_2F0B6 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,123L — division
; fixed-point avec un diviseur situé à +0x37 de l'objet, calcul de partie
; entière/fractionnaire : calcul d'interpolation fractionnaire (utilisé par le contrôleur de
; transition sub_2EC42).
; ==============================================================================================
Interp_FractionalCompute		proc far

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
		jnz	short loc_2E4F9
		mov	di, 1

loc_2E4F9:
		mov	ax, [si+33h]
		sub	ax, di
		mov	di, ax
		or	di, di
		jge	short loc_2E506
		xor	di, di

loc_2E506:
		cmp	[bp+arg_6], 0
		jnz	short loc_2E514
		cmp	[si+31h], di
		jnz	short loc_2E514
		jmp	loc_2E596

loc_2E514:
		mov	al, [bp+arg_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2E527
		mov	eax, [si+3]
		mov	[bp+var_C], eax
		jmp	short loc_2E546

loc_2E527:
		push	0
		mov	al, [si+0Dh]
		push	ax
		push	large [si+9]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		add	word ptr [bp+var_C], 4

loc_2E546:
		push	0
		mov	al, [si+2Bh]
		push	ax
		push	large [si+27h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
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
		call	sub_37C3
		add	sp, 0Ah
		mov	al, [bp+arg_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2E593
		push	si
		push	cs
		call	near ptr VGA_LoadPalette
		pop	cx

loc_2E593:
		mov	[si+31h], di

loc_2E596:
		pop	di
		pop	si
		leave
		retf
Interp_FractionalCompute		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E59A		proc far
		push	bp
		mov	bp, sp
		mov	word_7CC0E, 0
		mov	dword_7CC11, 0
		mov	dword_7CC17, 0
		mov	byte_7CC1B, 2
		mov	byte_7CC1C, 0
		mov	dword_7CC1D, 0
		mov	dword_7CC21, 0
		mov	byte_7CC25, 2
		mov	byte_7CC26, 0
		mov	dword_7CC27, 0
		mov	dword_7CC2B, 0
		mov	byte_7CC2F, 2
		mov	byte_7CC30, 0
		mov	dword_7CC31, 0
		mov	dword_7CC35, 0
		mov	byte_7CC39, 2
		mov	byte_7CC3A, 0
		mov	dword_7CC3B, 0
		mov	dword_7CC6C, 0
		mov	byte_7CC70, 2
		mov	byte_7CC71, 0
		mov	dword_7CC72, 0
		push	64DEh
		call	sub_73E67
		pop	cx
		pop	bp
		retf
sub_2E59A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2E643		proc far
		push	bp
		mov	bp, sp
		push	2
		push	64DEh
		call	sub_73E76
sub_2E643		endp
seg075		ends
