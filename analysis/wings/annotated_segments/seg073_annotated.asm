seg073		segment	para public 'CODE' use16
		assume cs:seg073
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33FB1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_33FB1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Light_Construct_295C6
; (sub_295C6 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Light_Construct_2B0F2 (sub_2B0F2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, LUE 2026-10-14. CONSTRUIT UNE LUMIÈRE (17 o) : +0 drapeau
; normaliser, +1 vecteur direction (3 dd, normalisé par Vector_NormalizeInPlace_5593A si
; drapeau ≠ 0), +0Dh poids. Ex-'ListItem_ConstructThreeParams'.
; ==============================================================================================
Light_Construct_33FB9		proc far

var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= byte ptr  16h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_33FB1
		pop	cx
		mov	al, [bp+arg_10]
		mov	[si], al
		sub	sp, 4
		mov	eax, [bp+arg_C]
		mov	[bp+var_6], eax
		sub	sp, 4
		mov	eax, [bp+arg_8]
		mov	[bp+var_A], eax
		sub	sp, 4
		mov	eax, [bp+arg_4]
		mov	[bp+var_E], eax
		mov	ax, si
		inc	ax
		push	ax
		call	Utility_Helper_3A644
		add	sp, 0Eh
		cmp	[bp+arg_10], 0
		jz	short loc_34008
		mov	ax, si
		inc	ax
		push	ax
		call	Vector_NormalizeInPlace_3A0DC
		pop	cx

loc_34008:
		mov	ax, [bp+arg_2]
		mov	[si+0Dh], ax
		pop	si
		pop	bp
		retf
Light_Construct_33FB9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ListItem_ConstructVector3D (sub_2961E de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à ListItem_ConstructVector3D (sub_2B14A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,45L — copie 3 champs 32-bit
; consécutifs (12 octets) et un flag depuis un vecteur source ; conditionnellement normalise
; via sub_5593A : construction d'élément avec copie de vecteur 3D et normalisation
; optionnelle.
; ==============================================================================================
ListItem_ConstructVector3D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_33FB1
		pop	cx
		mov	al, [bp+arg_6]
		mov	[si], al
		mov	di, [bp+arg_4]
		mov	eax, [di]
		mov	[si+1], eax
		mov	eax, [di+4]
		mov	[si+5], eax
		mov	eax, [di+8]
		mov	[si+9], eax
		cmp	[bp+arg_6], 0
		jz	short loc_3404E
		mov	ax, si
		inc	ax
		push	ax
		call	Vector_NormalizeInPlace_3A0DC
		pop	cx

loc_3404E:
		mov	ax, [bp+arg_2]
		mov	[si+0Dh], ax
		pop	di
		pop	si
		pop	bp
		retf
ListItem_ConstructVector3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à LightSet_Init_29665
; (sub_29665 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; LightSet_Init_1D72E (sub_1D72E de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à LightSet_Init_2B191 (sub_2B191 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-14. JEU DE LUMIÈRES —
; initialisation : +6 = 1, poids ambiant 0, intensité 100 %. Appelée par seg112.
; Ex-'ProgressBar_InitFull'.
; ==============================================================================================
LightSet_Init_34058		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+6], 1
		mov	word ptr [si+7], 0
		push	64h
		push	si
		nop
		push	cs
		call	near ptr LightSet_SetIntensityPercent_340EF
		add	sp, 4
		pop	si
		pop	bp
		retf
LightSet_Init_34058		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Collection_ClearAndFree
; (sub_2B1AF de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,40L — parcourt une liste, libère chaque élément (+4 via sub_338) et le retire
; (sub_5F5A4) : vidage complet d'une liste avec libération mémoire.
; ==============================================================================================
Collection_ClearAndFree		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_340A6

loc_34087:
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		call	sub_33B
		pop	cx
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_48648
		add	sp, 6
		mov	[bp+var_2], 0

loc_340A6:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_34087
		pop	si
		leave
		retf
Collection_ClearAndFree		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Collection_Destruct (sub_2B1F3 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,36L — destructeur :
; vide la liste (sub_2B1AF), la libère (sub_5F66B), libère l'objet si demandé (sub_338) :
; destructeur de conteneur de liste.
; ==============================================================================================
Collection_Destruct		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_340EB
		mov	word ptr [si], 265Eh
		push	si
		push	cs
		call	near ptr Collection_ClearAndFree
		pop	cx
		mov	word ptr [si], 492h
		push	si
		call	sub_4870F
		pop	cx
		test	di, 1
		jz	short loc_340EB
		push	si
		call	sub_33B
		pop	cx

loc_340EB:
		pop	di
		pop	si
		pop	bp
		retf
Collection_Destruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; LightSet_SetIntensityPercent_296FC (sub_296FC de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite
; d'instructions, 3 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à LightSet_SetIntensityPercent_1D7CD (sub_1D7CD de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite
; d'instructions, 3 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à LightSet_SetIntensityPercent_2B228 (sub_2B228 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, LUE 2026-10-14. JEU DE LUMIÈRES — intensité
; globale +9 = pourcentage × 256 ÷ 100, ou 256 (1,0) au-delà de 100.
; Ex-'ProgressBar_PercentToFixed'.
; ==============================================================================================
LightSet_SetIntensityPercent_340EF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, 64h
		jle	short loc_34105
		mov	word ptr [si+9], 100h
		jmp	short loc_34113

loc_34105:
		mov	ax, dx
		shl	ax, 8
		mov	bx, 64h
		cwd
		idiv	bx
		mov	[si+9], ax

loc_34113:
		pop	si
		pop	bp
		retf
LightSet_SetIntensityPercent_340EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; LightSet_SetAmbientWeight_29723 (sub_29723 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à LightSet_SetAmbientWeight_2B24F (sub_2B24F de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-14. JEU DE
; LUMIÈRES — fixe le poids ambiant (+7) puis recalcule les parts
; (LightSet_RecomputeShares_2B49F). Ex-'ProgressBar_UpdateValue'.
; ==============================================================================================
LightSet_SetAmbientWeight_34116		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+7], ax
		push	si
		nop
		push	cs
		call	near ptr LightSet_RecomputeShares_34366
		pop	cx
		pop	si
		pop	bp
		retf
LightSet_SetAmbientWeight_34116		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à LightSet_InsertLight_2973A (sub_2973A de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à LightSet_InsertLight_2B266 (sub_2B266 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-14. AJOUTE
; la lumière à la liste du jeu de lumières (nœud 6 o), met +6 à 0 si la liste a plus d'une
; lumière ou si le drapeau de la lumière est nul, puis recalcule les parts
; (LightSet_RecomputeShares_2B49F). Ex-'ListItem_AddNumberedLimited'.
; ==============================================================================================
LightSet_InsertLight_3412D		proc far

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
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_34163
		mov	word ptr [di], 0A2Dh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 265Ah
		mov	ax, [bp+var_4]
		mov	[di+4], ax
		mov	ax, di
		jmp	short loc_34165

loc_34163:
		mov	ax, di

loc_34165:
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_48623
		add	sp, 4
		push	si
		call	sub_48779
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, 1
		ja	short loc_34193
		mov	bx, [bp+arg_2]
		mov	al, [bx]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		or	al, al
		jz	short loc_34197

loc_34193:
		mov	byte ptr [si+6], 0

loc_34197:
		push	si
		nop
		push	cs
		call	near ptr LightSet_RecomputeShares_34366
		pop	cx
		pop	di
		pop	si
		leave
		retf
LightSet_InsertLight_3412D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; LightSet_AddLight_297AF (sub_297AF de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à LightSet_AddLight_2B2DB (sub_2B2DB de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, LUE 2026-10-14. AJOUTE UNE LUMIÈRE au jeu
; de lumières (objet de 17 o via Light_Construct_2B0F2, puis LightSet_InsertLight_2B266).
; Ex-'ListItem_ConstructComplex'.
; ==============================================================================================
LightSet_AddLight_341A2		proc far

var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= byte ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	eax, [bp+arg_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_C]
		mov	[bp+var_10], eax
		mov	al, [bp+arg_10]
		mov	[bp+var_11], al
		push	11h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_34213
		mov	al, [bp+var_11]
		push	ax
		sub	sp, 4
		mov	eax, [bp+var_10]
		mov	[bp+var_1C], eax
		sub	sp, 4
		mov	eax, [bp+var_C]
		mov	[bp+var_20], eax
		sub	sp, 4
		mov	eax, [bp+var_8]
		mov	[bp+var_24], eax
		push	[bp+var_4]
		push	di
		push	cs
		call	near ptr Light_Construct_33FB9
		add	sp, 12h
		mov	ax, di
		jmp	short loc_34215

loc_34213:
		mov	ax, di

loc_34215:
		mov	[bp+var_2], ax
		push	ax
		push	si
		push	cs
		call	near ptr LightSet_InsertLight_3412D
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
LightSet_AddLight_341A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34225		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	di, [bp+arg_4]
		mov	eax, [di]
		mov	[bp+var_12], eax
		mov	eax, [di+4]
		mov	[bp+var_E], eax
		mov	eax, [di+8]
		mov	[bp+var_A], eax
		mov	al, [bp+arg_6]
		mov	[bp+var_5], al
		push	11h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_3427B
		mov	al, [bp+var_5]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	[bp+var_4]
		push	di
		push	cs
		call	near ptr ListItem_ConstructVector3D
		add	sp, 8
		mov	ax, di
		jmp	short loc_3427D

loc_3427B:
		mov	ax, di

loc_3427D:
		mov	[bp+var_2], ax
		push	ax
		push	si
		push	cs
		call	near ptr LightSet_InsertLight_3412D
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_34225		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3428D		proc far

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
		xor	di, di

loc_3429F:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jz	short loc_342B8
		mov	ax, di
		inc	di
		cmp	ax, [bp+arg_2]
		jl	short loc_3429F

loc_342B8:
		cmp	[bp+var_2], 0
		jz	short loc_342DC
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		mov	[bp+var_4], ax
		push	0
		push	bx
		push	si
		call	LinkedListB_FindAndDispatch_48648
		add	sp, 6
		push	[bp+var_4]
		call	sub_33B
		pop	cx

loc_342DC:
		pop	di
		pop	si
		leave
		retf
sub_3428D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_342E0		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0

loc_342F3:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jz	short loc_3430C
		mov	bx, [bp+var_2]
		cmp	[bx+4], di
		jnz	short loc_342F3

loc_3430C:
		cmp	[bp+var_2], 0
		jz	short loc_34327
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_48648
		add	sp, 6
		push	di
		call	sub_33B
		pop	cx

loc_34327:
		pop	di
		pop	si
		leave
		retf
sub_342E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3432B		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		xor	di, di
		jmp	short loc_3434F

loc_3433F:
		mov	ax, di
		inc	di
		cmp	ax, [bp+arg_2]
		jnz	short loc_3434F
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		jmp	short loc_34362

loc_3434F:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_3433F
		xor	ax, ax

loc_34362:
		pop	di
		pop	si
		leave
		retf
sub_3432B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; LightSet_RecomputeShares_2B49F (sub_2B49F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-14. JEU DE LUMIÈRES — total =
; poids ambiant (+7) + somme des poids des lumières (+0Dh) ; part de chaque lumière (+0Fh) =
; poids × intensité (+9) ÷ total ; part ambiante (+0Bh) = poids ambiant × intensité ÷ total ;
; total nul → parts à 0. Ex-'ProgressBar_WeightedSum'.
; ==============================================================================================
LightSet_RecomputeShares_34366		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	di, [si+7]
		jmp	short loc_34384

loc_3437B:
		mov	bx, [bp+var_2]
		mov	bx, [bx+4]
		add	di, [bx+0Dh]

loc_34384:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_3437B
		or	di, di
		jz	short loc_343F7
		jmp	short loc_343BF

loc_3439B:
		mov	bx, [bp+var_2]
		mov	cx, [bx+4]
		mov	bx, cx
		movsx	eax, word ptr [bx+0Dh]
		movsx	edx, word ptr [si+9]
		imul	eax, edx
		movsx	ebx, di
		cdq
		idiv	ebx
		mov	bx, cx
		mov	[bx+0Fh], ax

loc_343BF:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_3439B
		movsx	eax, word ptr [si+7]
		movsx	edx, word ptr [si+9]
		imul	eax, edx
		movsx	ebx, di
		cdq
		idiv	ebx
		mov	[si+0Bh], ax
		jmp	short loc_3440D

loc_343EC:
		mov	bx, [bp+var_2]
		mov	bx, [bx+4]
		mov	word ptr [bx+0Fh], 0

loc_343F7:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_343EC
		mov	word ptr [si+0Bh], 0

loc_3440D:
		pop	di
		pop	si
		leave
		retf
LightSet_RecomputeShares_34366		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; LightSet_FaceIntensity_29A1E (sub_29A1E de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à LightSet_FaceIntensity_1DB23 (sub_1DB23 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à LightSet_FaceIntensity_2B54A (sub_2B54A de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-14, corrigé le même jour. INTENSITÉ LUMINEUSE D'UNE FACE (ou d'un sommet) de
; modèle 3D. Args : (jeu de lumières, vecteur A, vecteur B) ; appelée par
; Mesh_FacePrepareIndirect et les méthodes d'éclairage des éléments de face (seg055) avec A =
; vecteur passé par l'appelant de ces méthodes (origine non tracée) et B = normale de la face
; lue dans les données du modèle. intensité = part ambiante (+0Bh) + (si A · B > 0) (A · B) ×
; part de la PREMIÈRE lumière de la liste (+0Fh du 1er élément) ; bornée à 255. La direction
; rangée dans les lumières n'est pas lue ici. Ex-'Render_FaceDotProductTest'.
; ==============================================================================================
LightSet_FaceIntensity_34411		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+0Bh]
		mov	[bp+var_2], ax
		mov	bx, [bp+arg_4]
		mov	ax, [di]
		imul	word ptr [bx]
		mov	[bp+var_8], ax
		mov	cx, dx
		mov	ax, [di+4]
		imul	word ptr [bx+4]
		add	[bp+var_8], ax
		adc	cx, dx
		mov	ax, [di+8]
		imul	word ptr [bx+8]
		add	ax, [bp+var_8]
		adc	dx, cx
		shl	edx, 10h
		mov	dx, ax
		sar	edx, 8
		mov	[bp+var_6], edx
		cmp	[bp+var_6], 0
		jle	short loc_3448D
		mov	bx, [si+2]
		mov	ax, [bx+4]
		mov	[bp+var_A], ax
		mov	bx, [bp+var_A]
		mov	ax, [bx+0Fh]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		mov	edx, [bp+var_6]
		imul	edx, eax
		mov	[bp+var_10], edx
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	ax, word ptr [bp+var_14+1]
		add	[bp+var_2], ax

loc_3448D:
		cmp	[bp+var_2], 0FFh
		jle	short loc_34499
		mov	[bp+var_2], 0FFh

loc_34499:
		mov	al, byte ptr [bp+var_2]
		pop	di
		pop	si
		leave
		retf
LightSet_FaceIntensity_34411		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_344A0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_344BE
		test	dx, 1
		jz	short loc_344BC
		push	ax
		call	sub_33B
		pop	cx
		jmp	short loc_344BE

loc_344BC:
		jmp	short loc_344BE

loc_344BE:
		pop	bp
		retf
sub_344A0		endp
seg073		ends
