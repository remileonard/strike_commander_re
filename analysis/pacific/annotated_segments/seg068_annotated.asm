seg068		segment	para public 'CODE' use16
		assume cs:seg068
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 46h, 0BEh, 50h, 56h, 0Eh, 0E8h, 4Dh, 0FFh, 83h, 0C4h, 0Eh

loc_295BB:
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_295BE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_295BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Light_Construct_2B0F2
; (sub_2B0F2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-14. CONSTRUIT UNE LUMIÈRE (17 o) : +0 drapeau normaliser, +1 vecteur
; direction (3 dd, normalisé par Vector_NormalizeInPlace_5593A si drapeau ≠ 0), +0Dh poids.
; Ex-'ListItem_ConstructThreeParams'.
; ==============================================================================================
Light_Construct_295C6		proc far

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
		call	near ptr sub_295BE
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
		call	Utility_Helper_57C2E
		add	sp, 0Eh
		cmp	[bp+arg_10], 0
		jz	short loc_29615
		mov	ax, si
		inc	ax
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx

loc_29615:
		mov	ax, [bp+arg_2]
		mov	[si+0Dh], ax
		pop	si
		pop	bp
		retf
Light_Construct_295C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ListItem_ConstructVector3D (sub_2B14A de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,45L — copie 3 champs 32-bit consécutifs (12
; octets) et un flag depuis un vecteur source ; conditionnellement normalise via sub_5593A :
; construction d'élément avec copie de vecteur 3D et normalisation optionnelle.
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
		call	near ptr sub_295BE
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
		jz	short loc_2965B
		mov	ax, si
		inc	ax
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx

loc_2965B:
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
; Reprise de OPTEST.EXE : code identique instruction par instruction à LightSet_Init_1D72E
; (sub_1D72E de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; LightSet_Init_2B191 (sub_2B191 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, LUE 2026-10-14. JEU DE LUMIÈRES — initialisation : +6 = 1,
; poids ambiant 0, intensité 100 %. Appelée par seg112. Ex-'ProgressBar_InitFull'.
; ==============================================================================================
LightSet_Init_29665		proc far

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
		call	near ptr LightSet_SetIntensityPercent_296FC
		add	sp, 4
		pop	si
		pop	bp
		retf
LightSet_Init_29665		endp

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
		jmp	short loc_296B3

loc_29694:
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		call	sub_3B2
		pop	cx
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6
		mov	[bp+var_2], 0

loc_296B3:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_29694
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
		jz	short loc_296F8
		mov	word ptr [si], 1222h
		push	si
		push	cs
		call	near ptr Collection_ClearAndFree
		pop	cx
		mov	word ptr [si], 909h
		push	si
		call	sub_68B0D
		pop	cx
		test	di, 1
		jz	short loc_296F8
		push	si
		call	sub_3B2
		pop	cx

loc_296F8:
		pop	di
		pop	si
		pop	bp
		retf
Collection_Destruct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à LightSet_SetIntensityPercent_1D7CD (sub_1D7CD de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à LightSet_SetIntensityPercent_2B228 (sub_2B228 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-14.
; JEU DE LUMIÈRES — intensité globale +9 = pourcentage × 256 ÷ 100, ou 256 (1,0) au-delà de
; 100. Ex-'ProgressBar_PercentToFixed'.
; ==============================================================================================
LightSet_SetIntensityPercent_296FC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	dx, 64h
		jle	short loc_29712
		mov	word ptr [si+9], 100h
		jmp	short loc_29720

loc_29712:
		mov	ax, dx
		shl	ax, 8
		mov	bx, 64h
		cwd
		idiv	bx
		mov	[si+9], ax

loc_29720:
		pop	si
		pop	bp
		retf
LightSet_SetIntensityPercent_296FC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; LightSet_SetAmbientWeight_2B24F (sub_2B24F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-14. JEU DE LUMIÈRES — fixe le
; poids ambiant (+7) puis recalcule les parts (LightSet_RecomputeShares_2B49F).
; Ex-'ProgressBar_UpdateValue'.
; ==============================================================================================
LightSet_SetAmbientWeight_29723		proc far

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
		call	near ptr LightSet_RecomputeShares_29973
		pop	cx
		pop	si
		pop	bp
		retf
LightSet_SetAmbientWeight_29723		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à LightSet_InsertLight_2B266 (sub_2B266 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-14.
; AJOUTE la lumière à la liste du jeu de lumières (nœud 6 o), met +6 à 0 si la liste a plus
; d'une lumière ou si le drapeau de la lumière est nul, puis recalcule les parts
; (LightSet_RecomputeShares_2B49F). Ex-'ListItem_AddNumberedLimited'.
; ==============================================================================================
LightSet_InsertLight_2973A		proc far

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
		jz	short loc_29770
		mov	word ptr [di], 9B2h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 121Eh
		mov	ax, [bp+var_4]
		mov	[di+4], ax
		mov	ax, di
		jmp	short loc_29772

loc_29770:
		mov	ax, di

loc_29772:
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_68A21
		add	sp, 4
		push	si
		call	sub_68B77
		push	dx
		push	ax
		pop	eax
		pop	cx
		cmp	eax, 1
		ja	short loc_297A0
		mov	bx, [bp+arg_2]
		mov	al, [bx]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		or	al, al
		jz	short loc_297A4

loc_297A0:
		mov	byte ptr [si+6], 0

loc_297A4:
		push	si
		nop
		push	cs
		call	near ptr LightSet_RecomputeShares_29973
		pop	cx
		pop	di
		pop	si
		leave
		retf
LightSet_InsertLight_2973A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à LightSet_AddLight_2B2DB
; (sub_2B2DB de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-14. AJOUTE UNE LUMIÈRE au jeu de lumières (objet de 17 o via
; Light_Construct_2B0F2, puis LightSet_InsertLight_2B266). Ex-'ListItem_ConstructComplex'.
; ==============================================================================================
LightSet_AddLight_297AF		proc far

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
		jz	short loc_29820
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
		call	near ptr Light_Construct_295C6
		add	sp, 12h
		mov	ax, di
		jmp	short loc_29822

loc_29820:
		mov	ax, di

loc_29822:
		mov	[bp+var_2], ax
		push	ax
		push	si
		push	cs
		call	near ptr LightSet_InsertLight_2973A
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
LightSet_AddLight_297AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29832		proc far

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
		jz	short loc_29888
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
		jmp	short loc_2988A

loc_29888:
		mov	ax, di

loc_2988A:
		mov	[bp+var_2], ax
		push	ax
		push	si
		push	cs
		call	near ptr LightSet_InsertLight_2973A
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_29832		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2989A		proc far

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

loc_298AC:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jz	short loc_298C5
		mov	ax, di
		inc	di
		cmp	ax, [bp+arg_2]
		jl	short loc_298AC

loc_298C5:
		cmp	[bp+var_2], 0
		jz	short loc_298E9
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		mov	[bp+var_4], ax
		push	0
		push	bx
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6
		push	[bp+var_4]
		call	sub_3B2
		pop	cx

loc_298E9:
		pop	di
		pop	si
		leave
		retf
sub_2989A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_298ED		proc far

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

loc_29900:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jz	short loc_29919
		mov	bx, [bp+var_2]
		cmp	[bx+4], di
		jnz	short loc_29900

loc_29919:
		cmp	[bp+var_2], 0
		jz	short loc_29934
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6
		push	di
		call	sub_3B2
		pop	cx

loc_29934:
		pop	di
		pop	si
		leave
		retf
sub_298ED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29938		proc far

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
		jmp	short loc_2995C

loc_2994C:
		mov	ax, di
		inc	di
		cmp	ax, [bp+arg_2]
		jnz	short loc_2995C
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		jmp	short loc_2996F

loc_2995C:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_2994C
		xor	ax, ax

loc_2996F:
		pop	di
		pop	si
		leave
		retf
sub_29938		endp

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
LightSet_RecomputeShares_29973		proc far

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
		jmp	short loc_29991

loc_29988:
		mov	bx, [bp+var_2]
		mov	bx, [bx+4]
		add	di, [bx+0Dh]

loc_29991:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_29988
		or	di, di
		jz	short loc_29A04
		jmp	short loc_299CC

loc_299A8:
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

loc_299CC:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_299A8
		movsx	eax, word ptr [si+7]
		movsx	edx, word ptr [si+9]
		imul	eax, edx
		movsx	ebx, di
		cdq
		idiv	ebx
		mov	[si+0Bh], ax
		jmp	short loc_29A1A

loc_299F9:
		mov	bx, [bp+var_2]
		mov	bx, [bx+4]
		mov	word ptr [bx+0Fh], 0

loc_29A04:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_299F9
		mov	word ptr [si+0Bh], 0

loc_29A1A:
		pop	di
		pop	si
		leave
		retf
LightSet_RecomputeShares_29973		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; LightSet_FaceIntensity_1DB23 (sub_1DB23 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à LightSet_FaceIntensity_2B54A (sub_2B54A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-14, corrigé le même
; jour. INTENSITÉ LUMINEUSE D'UNE FACE (ou d'un sommet) de modèle 3D. Args : (jeu de lumières,
; vecteur A, vecteur B) ; appelée par Mesh_FacePrepareIndirect et les méthodes d'éclairage des
; éléments de face (seg055) avec A = vecteur passé par l'appelant de ces méthodes (origine non
; tracée) et B = normale de la face lue dans les données du modèle. intensité = part ambiante
; (+0Bh) + (si A · B > 0) (A · B) × part de la PREMIÈRE lumière de la liste (+0Fh du 1er
; élément) ; bornée à 255. La direction rangée dans les lumières n'est pas lue ici.
; Ex-'Render_FaceDotProductTest'.
; ==============================================================================================
LightSet_FaceIntensity_29A1E		proc far

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
		jle	short loc_29A9A
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

loc_29A9A:
		cmp	[bp+var_2], 0FFh
		jle	short loc_29AA6
		mov	[bp+var_2], 0FFh

loc_29AA6:
		mov	al, byte ptr [bp+var_2]
		pop	di
		pop	si
		leave
		retf
LightSet_FaceIntensity_29A1E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_29AAD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_29ACB
		test	dx, 1
		jz	short loc_29AC9
sub_29AAD		endp
seg068		ends
