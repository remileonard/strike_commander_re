ovr252		segment	para public 'OVERLAY' use16
		assume cs:ovr252
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; HUDSymbol_Helper14_853B0 (sub_853B0 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, combine thunk voisin et copie de chaîne (42 lignes).
; ==============================================================================================
HUDSymbol_Helper14_93D30		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h
arg_E		= dword ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		sub	sp, 4
		mov	eax, [bp+arg_E]
		mov	[bp+var_8], eax
		sub	sp, 4
		mov	eax, [bp+arg_A]
		mov	[bp+var_C], eax
		push	large [bp+arg_6]
		push	[bp+arg_2]
		push	si
		call	sub_73DE2
		add	sp, 10h
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	8
		push	ax
		mov	ax, si
		add	ax, 80h
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+88h], 0
		pop	si
		leave
		retf
HUDSymbol_Helper14_93D30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructVariantJ_853FF (sub_853FF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantJ_93D7F		proc far

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_93D9C
		push	8Bh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_93DF7

loc_93D9C:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		push	large 24h
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_24]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_93E79
		add	sp, 4

loc_93DF7:
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantJ_93D7F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructVariantK_8547C (sub_8547C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantK_93DFC		proc far

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_93E19
		push	8Bh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_93E74

loc_93E19:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		push	24h
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	sub_37C3
		add	sp, 0Ah
		lea	ax, [bp+var_24]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_93E79
		add	sp, 4

loc_93E74:
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantK_93DFC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_93E79		proc far

var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+1Ch]
		mov	[bp+var_2], ax
		mov	ax, [di+1Eh]
		mov	[bp+var_4], ax
		mov	ax, [di+20h]
		mov	[bp+var_6], ax
		mov	ax, [di+22h]
		mov	[bp+var_8], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_93EEB
		mov	bx, [bp+var_A]
		mov	word ptr [bx], 698h
		mov	word ptr [bx+2], 0
		mov	word ptr [bx+4], 0
		mov	byte ptr [bx+0Fh], 0
		mov	word ptr [bx+10h], 0
		mov	word ptr [bx+12h], 0
		mov	byte ptr [bx+1Dh], 0
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	ax
		call	sub_73DB0
		add	sp, 0Ah
		mov	ax, [bp+var_A]
		jmp	short loc_93EEE

loc_93EEB:
		mov	ax, [bp+var_A]

loc_93EEE:
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	ax, di
		add	ax, 18h
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_1A], eax
		sub	sp, 4
		mov	ax, [di+16h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_1E], eax
		push	large [di+12h]
		mov	ax, di
		add	ax, 0Ah
		push	ax
		push	word ptr [si+5Ch]
		push	si
		push	cs
		call	near ptr HUDSymbol_Helper14_93D30
		add	sp, 12h
		mov	[bp+var_10], di
		push	8
		push	[bp+var_10]
		mov	ax, si
		add	ax, 53h
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		mov	al, [di+8]
		mov	[bp+var_11], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		pop	di
		pop	si
		leave
		retf
sub_93E79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructWithContainerOpB_855E1 (sub_855E1
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine une opération de conteneur et SetReference16.
; ==============================================================================================
HUDSymbol_ConstructWithContainerOpB_93F61		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_93F9E
		mov	ax, si
		add	ax, 80h
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	[bp+var_2]
		push	ax
		push	67ADh
		call	Container_Op_1E66D
		add	sp, 6
		mov	[bp+var_6], ax
		push	ax
		mov	ax, si
		add	ax, 89h
		push	ax
		call	SetReference16
		add	sp, 4

loc_93F9E:
		cmp	word ptr [si+89h], 0
		jz	short loc_93FB4
		cmp	word ptr [si+5Ch], 0
		jz	short loc_93FB4
		push	si
		call	sub_73DF6
		pop	cx
		jmp	short loc_93FB6

loc_93FB4:
		mov	al, 0

loc_93FB6:
		pop	si
		leave
		retf
HUDSymbol_ConstructWithContainerOpB_93F61		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_93FB9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jz	short loc_9400A
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_93FE8
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_93FEA

loc_93FE8:
		mov	al, 1Ch

loc_93FEA:
		cmp	al, 6
		jnz	short loc_9400A
		mov	bx, [si+89h]
		push	large [bx+5Fh]
		call	sub_7456B
		add	sp, 4
		mov	bx, [si+89h]
		les	bx, [bx+5Fh]
		mov	byte ptr es:[bx+55h], 0

loc_9400A:
		push	si
		call	sub_73DFB
		pop	cx
		pop	si
		pop	bp
		retf
sub_93FB9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; HUDSymbol_ReleaseRefConditionalB_85639 (sub_85639 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, invalide une référence faible
; (20 lignes).
; ==============================================================================================
HUDSymbol_ReleaseRefConditionalB_94014		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_73E00
		pop	cx
		mov	ax, si
		add	ax, 89h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseRefConditionalB_94014		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructVariantL_85656 (sub_85656 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantL_94031		proc far

var_30		= word ptr -30h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_9404E
		push	0BBh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_940C9

loc_9404E:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 949h
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	ax, si
		add	ax, 0AFh
		mov	ax, si
		add	ax, 0B3h
		mov	ax, si
		add	ax, 0B7h
		push	large 30h
		push	ss
		lea	ax, [bp+var_30]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_30]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_9416B
		add	sp, 4

loc_940C9:
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantL_94031		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Cinematic_CamEntryConstruct_CHAS_856F3 (sub_856F3 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; CONSTRUCTEUR DE L'ENTRÉE CAMR 'CHAS' (ex-'HUDSymbol_ConstructVariantM' — FAUX). Appelé
; depuis Cinematic_LoadCameraDef_23E7D (case CHAS) via stub 6B116. Alloc 0xBB o -> si ;
; Formation_ComputeGeometryHelper_56D43(si+0x20) (matrice 3x3) ; [si+0x50]=0x484 ->
; String_ConstructEmpty(si+0x53) -> thunk 6BC0D -> [si+0x50]=0x67E ->
; String_ConstructEmpty(si+0x80) -> [si+0x89]=0 -> [si+0x50]=0x79C (VTABLE FINALE, tag encode
; le type de caméra ; CKPT=0x778 cf. sub_859C7) ->
; Formation_ComputeGeometryHelper_56D43(si+0x8B) (2e matrice) ; CRT_MemFamily_Extra1(&buf,
; payload, 0x30) ; HUDSymbol_ConstructAndInitAngleG_85790(si,&buf). Champs de l'entrée :
; +0x14/18/1C position caméra monde 24.8, +0x20 & +0x8B matrices, +0x50 vtable (0x79C :
; [0x14]=Camera_ExternalViewComputeMain_1519E), +0x53 nom caméra, +0x5C sous-objet viewport
; (rect payload[+0x28..0x2F]), +0x60 dword param (seuil chase = queue des params du chunk),
; +0x89 pointeur entité sujet (lié par nom via HUDSymbol_Helper14_853B0 depuis payload+0x16),
; +0x80 string nom sujet. Payload 0x30 o : [0x00]char8 nom, [0x08]14o gap, [0x16]char8 sujet,
; [0x1E]u32 farClip, [0x22]u16 fov, [0x24]u32 nearClip, [0x28]u16x4 rect viewport.
; ==============================================================================================
Cinematic_CamEntryConstruct_CHAS_940CE		proc far

var_30		= word ptr -30h
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_940EB
		push	0BBh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_94166

loc_940EB:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 949h
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	ax, si
		add	ax, 0AFh
		mov	ax, si
		add	ax, 0B3h
		mov	ax, si
		add	ax, 0B7h
		push	30h
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_30]
		push	ax
		call	sub_37C3
		add	sp, 0Ah
		lea	ax, [bp+var_30]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_9416B
		add	sp, 4

loc_94166:
		mov	ax, si
		pop	si
		leave
		retf
Cinematic_CamEntryConstruct_CHAS_940CE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9416B		proc far

var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+28h]
		mov	[bp+var_2], ax
		mov	ax, [di+2Ah]
		mov	[bp+var_4], ax
		mov	ax, [di+2Ch]
		mov	[bp+var_6], ax
		mov	ax, [di+2Eh]
		mov	[bp+var_8], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_941DD
		mov	bx, [bp+var_A]
		mov	word ptr [bx], 698h
		mov	word ptr [bx+2], 0
		mov	word ptr [bx+4], 0
		mov	byte ptr [bx+0Fh], 0
		mov	word ptr [bx+10h], 0
		mov	word ptr [bx+12h], 0
		mov	byte ptr [bx+1Dh], 0
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	ax
		call	sub_73DB0
		add	sp, 0Ah
		mov	ax, [bp+var_A]
		jmp	short loc_941E0

loc_941DD:
		mov	ax, [bp+var_A]

loc_941E0:
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	ax, di
		add	ax, 24h
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_1A], eax
		sub	sp, 4
		mov	ax, [di+22h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_1E], eax
		push	large [di+1Eh]
		mov	ax, di
		add	ax, 16h
		push	ax
		push	word ptr [si+5Ch]
		push	si
		push	cs
		call	near ptr HUDSymbol_Helper14_93D30
		add	sp, 12h
		mov	[bp+var_10], di
		push	8
		push	[bp+var_10]
		mov	ax, si
		add	ax, 53h
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		mov	al, [di+8]
		mov	[bp+var_11], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		pop	di
		pop	si
		leave
		retf
sub_9416B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_OrbitReset_85878 (sub_85878 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 125L
; (ex-'HUDSymbol_ComputeAndClipTest', NON DÉTAILLÉE). RESET/INIT DE LA CAMÉRA ORBITALE
; (CHASE/ROTA/TARGET). Slot [0x1C] de la vtable d'entrée caméra (CODE XREF sub_6B11B). si =
; objet entrée. (1) sub_855E1(si) ; bail si si[+0x89] (sujet) == 0. (2)
; Matrix_BuildFromAngle_56D72(si+0x8B) -> RÉINITIALISE LA MATRICE D'ORBITE à l'identité. (3) R
; = si[+0x89]->vtable[0x3C]() ; AI_ComputeGeometryHelper_56E29(&R, si+0x20) -> sème la matrice
; de visée si[+0x20] depuis l'orientation du sujet. (4) DISTANCES D'ORBITE dérivées de la
; taille du sujet : e = subject[+0x20] (dword) ; si[+0xB7] (min) = e ; si[+0xAF] (recul
; courant) = e*2 ; si[+0xB3] (max) = e*4. (5) lit si[+0x2C]... (suite non détaillée).
; subject[+0x20] = champ dword du WorldObject sujet (= parent[+8][+0x10] via
; Debris_BodyAttachToSubpart_37C89 ; probable rayon englobant / taille caractéristique de
; l'avion, 24.8). => recul chase = taille_avion * 2 ; zoom entre *1 et *4. Consommé par
; Camera_OrbitTrackCompute_1493A (§4bis). Voir CAMERA_SYSTEM.md §4bis.
; ==============================================================================================
Camera_OrbitReset_94253		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr HUDSymbol_ConstructWithContainerOpB_93F61
		pop	cx
		cmp	word ptr [si+89h], 0
		jnz	short loc_9426E
		jmp	loc_94398

loc_9426E:
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	bx, [si+89h]
		mov	eax, [bx+20h]
		mov	[si+0B7h], eax
		mov	eax, [si+0B7h]
		shl	eax, 1
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	[si+0AFh], eax
		mov	eax, [si+0AFh]
		shl	eax, 1
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[si+0B3h], eax
		mov	di, si
		add	di, 2Ch
		mov	eax, [di]
		mov	[bp+var_1C], eax
		mov	eax, [di+4]
		mov	[bp+var_18], eax
		mov	eax, [di+8]
		mov	[bp+var_14], eax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	Utility_Helper_57812
		pop	cx
		mov	di, si
		add	di, 0B3h
		mov	eax, [bp+var_1C]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_18]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	word ptr [si+89h]
		push	si
		call	sub_2CADA
		add	sp, 6
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_1C], eax
		mov	eax, [di+4]
		add	[bp+var_18], eax
		mov	eax, [di+8]
		add	[bp+var_14], eax
		mov	eax, [bp+var_1C]
		mov	[si+14h], eax
		mov	eax, [bp+var_18]
		mov	[si+18h], eax
		mov	eax, [bp+var_14]
		mov	[si+1Ch], eax

loc_94398:
		mov	al, [si+52h]
		and	ax, 1
		pop	di
		pop	si
		leave
		retf
Camera_OrbitReset_94253		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Cinematic_CamEntryConstruct_CKPT_859C7 (sub_859C7 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; CONSTRUCTEUR DE L'ENTRÉE CAMR 'CKPT' (ex-'HUDSymbol_ConstructVariantN' — FAUX). Appelé
; depuis Cinematic_LoadCameraDef_23E7D (case CKPT) via stub 6B120. Même motif que sub_856F3
; mais [si+0x50] FINAL = 0x778 (vtable CKPT, distincte de CHAS 0x79C) ; payload lu sur 0x24 o
; via ResourceRecord_ReadFieldGroupA_64A19 ; finalise par
; TextScrollDisplay_FormatAndCache_85ACB. Vue première personne : pas de rect viewport.
; ==============================================================================================
Cinematic_CamEntryConstruct_CKPT_943A2		proc far

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_943BF
		push	8Bh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9441F

loc_943BF:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 925h
		push	large 24h
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_24]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_944A6
		add	sp, 4

loc_9441F:
		mov	ax, si
		pop	si
		leave
		retf
Cinematic_CamEntryConstruct_CKPT_943A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ConstructVariantO_85A49 (sub_85A49 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que HUDSymbol_ConstructVariantA_804F0.
; ==============================================================================================
HUDSymbol_ConstructVariantO_94424		proc far

var_24		= word ptr -24h
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_94441
		push	8Bh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_944A1

loc_94441:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 925h
		push	24h
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	sub_37C3
		add	sp, 0Ah
		lea	ax, [bp+var_24]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_944A6
		add	sp, 4

loc_944A1:
		mov	ax, si
		pop	si
		leave
		retf
HUDSymbol_ConstructVariantO_94424		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_944A6		proc far

var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_13		= byte ptr -13h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		add	ax, 12h
		mov	[bp+var_C], ax
		push	8
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_2], 0
		mov	[bp+var_E], si
		push	28Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_944E2
		jmp	loc_94631

loc_944E2:
		mov	word ptr [di], 698h
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	byte ptr [di+0Fh], 0
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	byte ptr [di+1Dh], 0
		mov	word ptr [di], 911h
		mov	word ptr [di+22h], 909h
		xor	ax, ax
		mov	[di+26h], ax
		mov	[di+24h], ax
		mov	word ptr [di+22h], 90Dh
		mov	dword ptr [di+28h], 0
		mov	byte ptr [di+2Ch], 2
		mov	byte ptr [di+2Dh], 0
		mov	dword ptr [di+2Eh], 0
		mov	word ptr [di+32h], 8D1h
		mov	word ptr [di+36h], 0
		mov	word ptr [di+38h], 0
		mov	byte ptr [di+43h], 0
		mov	word ptr [di+44h], 0
		mov	word ptr [di+46h], 0
		mov	byte ptr [di+51h], 0
		mov	byte ptr [di+52h], 1
		mov	byte ptr [di+53h], 0
		mov	byte ptr [di+54h], 0
		mov	word ptr [di+32h], 8EDh
		mov	dword ptr [di+0EAh], 0
		mov	byte ptr [di+0EEh], 2
		mov	byte ptr [di+0EFh], 0
		mov	dword ptr [di+0F0h], 0
		mov	dword ptr [di+0F6h], 0
		mov	byte ptr [di+0FAh], 2
		mov	byte ptr [di+0FBh], 0
		mov	dword ptr [di+0FCh], 0
		mov	ax, di
		add	ax, 104h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	dword ptr [di+1C7h], 0
		mov	byte ptr [di+1CBh], 2
		mov	byte ptr [di+1CCh], 0
		mov	dword ptr [di+1CDh], 0
		mov	dword ptr [di+1D1h], 0
		mov	byte ptr [di+1D5h], 2
		mov	byte ptr [di+1D6h], 0
		mov	dword ptr [di+1D7h], 0
		mov	ax, di
		add	ax, 1E4h
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	word ptr [di+1E4h], 508h
		mov	dword ptr [di+245h], 100h
		mov	dword ptr [di+241h], 0
		mov	word ptr [di+1E4h], 520h
		mov	word ptr [di+260h], 0
		xor	ax, ax
		mov	[di+25Eh], ax
		movsx	eax, ax
		mov	[di+249h], eax
		lea	ax, [bp+var_A]
		push	ax
		push	[bp+var_E]
		push	di
		call	sub_735BE
		add	sp, 6
		mov	ax, di
		jmp	short loc_94633

loc_94631:
		mov	ax, di

loc_94633:
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	di, [bp+arg_2]
		add	di, 20h
		mov	eax, [di]
		mov	[bp+var_1C], eax
		sub	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx+1Eh]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_20], eax
		push	large [bx+1Ah]
		mov	ax, [bp+arg_2]
		add	ax, 0Ah
		push	ax
		push	word ptr [si+5Ch]
		push	si
		push	cs
		call	near ptr HUDSymbol_Helper14_93D30
		add	sp, 12h
		mov	byte_7709E, 1
		mov	ax, [bp+arg_2]
		mov	[bp+var_12], ax
		push	8
		push	ax
		mov	ax, si
		add	ax, 53h
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		mov	bx, [bp+arg_2]
		mov	al, [bx+8]
		mov	[bp+var_13], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		pop	di
		pop	si
		leave
		retf
sub_944A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_946AE		proc far

var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_C		= byte ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 80h
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	[bp+var_2]
		push	ax
		push	67ADh
		call	Container_Op_1E66D
		add	sp, 6
		mov	[bp+var_6], ax
		push	ax
		mov	ax, si
		add	ax, 89h
		push	ax
		call	SetReference16
		add	sp, 4
		cmp	byte ptr word_7974E, 0
		jnz	short loc_946EF
		jmp	loc_948D9

loc_946EF:
		push	5
		push	67B7h
		call	sub_73796
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_94725
		cmp	word ptr [di+5Ch], 0
		jz	short loc_94725
		cmp	word ptr [di+5Ch], 0
		jz	short loc_94720
		push	3
		push	word ptr [di+5Ch]
		mov	bx, [di+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_94720

loc_94720:
		mov	word ptr [di+5Ch], 0

loc_94725:
		cmp	word ptr [si+5Ch], 0
		jz	short loc_9472E
		jmp	loc_948D9

loc_9472E:
		mov	bx, [si+89h]
		les	bx, [bx+0Eh]
		mov	ax, es:[bx+8Ah]
		mov	dx, es:[bx+88h]
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		add	dx, 12h
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		push	8
		push	ax
		push	dx
		push	ds
		lea	ax, [bp+var_14]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		mov	[bp+var_C], 0
		mov	[bp+var_1A], si
		push	28Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_94778
		jmp	loc_948C7

loc_94778:
		mov	word ptr [di], 698h
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	byte ptr [di+0Fh], 0
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	byte ptr [di+1Dh], 0
		mov	word ptr [di], 911h
		mov	word ptr [di+22h], 909h
		xor	ax, ax
		mov	[di+26h], ax
		mov	[di+24h], ax
		mov	word ptr [di+22h], 90Dh
		mov	dword ptr [di+28h], 0
		mov	byte ptr [di+2Ch], 2
		mov	byte ptr [di+2Dh], 0
		mov	dword ptr [di+2Eh], 0
		mov	word ptr [di+32h], 8D1h
		mov	word ptr [di+36h], 0
		mov	word ptr [di+38h], 0
		mov	byte ptr [di+43h], 0
		mov	word ptr [di+44h], 0
		mov	word ptr [di+46h], 0
		mov	byte ptr [di+51h], 0
		mov	byte ptr [di+52h], 1
		mov	byte ptr [di+53h], 0
		mov	byte ptr [di+54h], 0
		mov	word ptr [di+32h], 8EDh
		mov	dword ptr [di+0EAh], 0
		mov	byte ptr [di+0EEh], 2
		mov	byte ptr [di+0EFh], 0
		mov	dword ptr [di+0F0h], 0
		mov	dword ptr [di+0F6h], 0
		mov	byte ptr [di+0FAh], 2
		mov	byte ptr [di+0FBh], 0
		mov	dword ptr [di+0FCh], 0
		mov	ax, di
		add	ax, 104h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	dword ptr [di+1C7h], 0
		mov	byte ptr [di+1CBh], 2
		mov	byte ptr [di+1CCh], 0
		mov	dword ptr [di+1CDh], 0
		mov	dword ptr [di+1D1h], 0
		mov	byte ptr [di+1D5h], 2
		mov	byte ptr [di+1D6h], 0
		mov	dword ptr [di+1D7h], 0
		mov	ax, di
		add	ax, 1E4h
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	word ptr [di+1E4h], 508h
		mov	dword ptr [di+245h], 100h
		mov	dword ptr [di+241h], 0
		mov	word ptr [di+1E4h], 520h
		mov	word ptr [di+260h], 0
		xor	ax, ax
		mov	[di+25Eh], ax
		movsx	eax, ax
		mov	[di+249h], eax
		lea	ax, [bp+var_14]
		push	ax
		push	[bp+var_1A]
		push	di
		call	sub_735BE
		add	sp, 6
		mov	ax, di
		jmp	short loc_948C9

loc_948C7:
		mov	ax, di

loc_948C9:
		mov	[si+5Ch], ax
		push	0
		push	word ptr [si+5Ch]
		call	sub_7349A
		add	sp, 4

loc_948D9:
		cmp	word ptr [si+89h], 0
		jz	short loc_94907
		cmp	word ptr [si+5Ch], 0
		jz	short loc_94907
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	byte ptr [si+52h], 1
		push	word_77696
		call	sub_735D2
		pop	cx
		mov	ax, [si+5Ch]
		mov	word_77696, ax
		jmp	short loc_9490B

loc_94907:
		and	byte ptr [si+52h], 0FEh

loc_9490B:
		mov	al, [si+52h]
		and	ax, 1
		pop	di
		pop	si
		leave
		retf
sub_946AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_94915		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		call	sub_16991
		mov	bx, word_77696
		mov	byte ptr [bx+1DFh], 0
		push	si
		call	sub_73DFB
		pop	cx
		push	0
		call	sub_1B9E8
		pop	cx
		pop	si
		pop	bp
		retf
sub_94915		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9493C		proc far

var_34		= word ptr -34h
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_94959
		push	96h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_949C5

loc_94959:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 8ADh
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	large 34h
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_34]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_94A58
		add	sp, 4

loc_949C5:
		mov	ax, si
		pop	si
		leave
		retf
sub_9493C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_949CA		proc far

var_34		= word ptr -34h
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_949E7
		push	96h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_94A53

loc_949E7:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 7EEh
		mov	ax, si
		add	ax, 80h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	word ptr [si+89h], 0
		mov	word ptr [si+50h], 8ADh
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	34h
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		call	sub_37C3
		add	sp, 0Ah
		lea	ax, [bp+var_34]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_94A58
		add	sp, 4

loc_94A53:
		mov	ax, si
		pop	si
		leave
		retf
sub_949CA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_94A58		proc far

var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_15		= byte ptr -15h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		add	ax, 1Ah
		mov	[bp+var_C], ax
		push	8
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_2], 0
		mov	[bp+var_E], si
		push	28Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_94A94
		jmp	loc_94BE3

loc_94A94:
		mov	word ptr [di], 698h
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	byte ptr [di+0Fh], 0
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	byte ptr [di+1Dh], 0
		mov	word ptr [di], 911h
		mov	word ptr [di+22h], 909h
		xor	ax, ax
		mov	[di+26h], ax
		mov	[di+24h], ax
		mov	word ptr [di+22h], 90Dh
		mov	dword ptr [di+28h], 0
		mov	byte ptr [di+2Ch], 2
		mov	byte ptr [di+2Dh], 0
		mov	dword ptr [di+2Eh], 0
		mov	word ptr [di+32h], 8D1h
		mov	word ptr [di+36h], 0
		mov	word ptr [di+38h], 0
		mov	byte ptr [di+43h], 0
		mov	word ptr [di+44h], 0
		mov	word ptr [di+46h], 0
		mov	byte ptr [di+51h], 0
		mov	byte ptr [di+52h], 1
		mov	byte ptr [di+53h], 0
		mov	byte ptr [di+54h], 0
		mov	word ptr [di+32h], 8EDh
		mov	dword ptr [di+0EAh], 0
		mov	byte ptr [di+0EEh], 2
		mov	byte ptr [di+0EFh], 0
		mov	dword ptr [di+0F0h], 0
		mov	dword ptr [di+0F6h], 0
		mov	byte ptr [di+0FAh], 2
		mov	byte ptr [di+0FBh], 0
		mov	dword ptr [di+0FCh], 0
		mov	ax, di
		add	ax, 104h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	dword ptr [di+1C7h], 0
		mov	byte ptr [di+1CBh], 2
		mov	byte ptr [di+1CCh], 0
		mov	dword ptr [di+1CDh], 0
		mov	dword ptr [di+1D1h], 0
		mov	byte ptr [di+1D5h], 2
		mov	byte ptr [di+1D6h], 0
		mov	dword ptr [di+1D7h], 0
		mov	ax, di
		add	ax, 1E4h
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	word ptr [di+1E4h], 508h
		mov	dword ptr [di+245h], 100h
		mov	dword ptr [di+241h], 0
		mov	word ptr [di+1E4h], 520h
		mov	word ptr [di+260h], 0
		xor	ax, ax
		mov	[di+25Eh], ax
		movsx	eax, ax
		mov	[di+249h], eax
		lea	ax, [bp+var_A]
		push	ax
		push	[bp+var_E]
		push	di
		call	sub_735BE
		add	sp, 6
		mov	ax, di
		jmp	short loc_94BE5

loc_94BE3:
		mov	ax, di

loc_94BE5:
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	di, [bp+arg_2]
		add	di, 28h
		mov	eax, [di]
		mov	[bp+var_1E], eax
		sub	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx+26h]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_22], eax
		push	large [bx+22h]
		mov	ax, [bp+arg_2]
		add	ax, 12h
		push	ax
		push	word ptr [si+5Ch]
		push	si
		push	cs
		call	near ptr HUDSymbol_Helper14_93D30
		add	sp, 12h
		mov	ax, [bp+arg_2]
		add	ax, 0Ah
		mov	[bp+var_12], ax
		push	8
		push	ax
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+93h], 0
		mov	ax, [bp+arg_2]
		mov	[bp+var_14], ax
		push	8
		push	ax
		mov	ax, si
		add	ax, 53h
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		mov	bx, [bp+arg_2]
		mov	al, [bx+8]
		mov	[bp+var_15], al
		and	ax, 1
		and	byte ptr [si+52h], 0FDh
		shl	al, 1
		or	[si+52h], al
		cmp	byte ptr word_7974E, 0
		jz	short loc_94C9A
		cmp	word ptr [si+5Ch], 0
		jz	short loc_94C95
		push	3
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_94C95

loc_94C95:
		mov	word ptr [si+5Ch], 0

loc_94C9A:
		pop	di
		pop	si
		leave
		retf
sub_94A58		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_94C9E		proc far

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_10		= byte ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 8Bh
		mov	[bp+var_2], ds
		mov	[bp+var_4], ax
		push	[bp+var_2]
		push	ax
		push	67ADh
		call	Container_Op_1E66D
		add	sp, 6
		mov	[si+94h], ax
		or	ax, ax
		jz	short loc_94D13
		mov	bx, [si+94h]
		cmp	word ptr [bx+1Eh], 0
		jz	short loc_94D03
		mov	ax, si
		add	ax, 80h
		mov	[bp+var_6], ds
		mov	[bp+var_8], ax
		push	[bp+var_6]
		push	ax
		push	word ptr [bx+1Eh]
		call	sub_1F243
		add	sp, 6
		mov	[bp+var_A], ax
		push	ax
		mov	ax, si
		add	ax, 89h
		push	ax
		call	SetReference16
		add	sp, 4
		jmp	short loc_94D13

loc_94D03:
		push	0
		mov	ax, si
		add	ax, 89h
		push	ax
		call	SetReference16
		add	sp, 4

loc_94D13:
		cmp	word ptr [si+89h], 0
		jnz	short loc_94D27
		and	byte ptr [si+52h], 0FEh
		mov	al, [si+52h]
		and	ax, 1
		jmp	loc_94F6E

loc_94D27:
		cmp	byte ptr word_7974E, 0
		jnz	short loc_94D31
		jmp	loc_94F0E

loc_94D31:
		push	4
		push	67B7h
		call	sub_73796
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_94D67
		cmp	word ptr [di+5Ch], 0
		jz	short loc_94D67
		cmp	word ptr [di+5Ch], 0
		jz	short loc_94D62
		push	3
		push	word ptr [di+5Ch]
		mov	bx, [di+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_94D62

loc_94D62:
		mov	word ptr [di+5Ch], 0

loc_94D67:
		cmp	word ptr [si+5Ch], 0
		jz	short loc_94D70
		jmp	loc_94F0E

loc_94D70:
		mov	bx, [si+94h]
		les	bx, [bx+0Eh]
		mov	ax, es:[bx+8Eh]
		mov	dx, es:[bx+8Ch]
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		add	dx, 1Ah
		mov	[bp+var_1A], ax
		mov	[bp+var_1C], dx
		push	8
		push	ax
		push	dx
		push	ds
		lea	ax, [bp+var_18]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		mov	[bp+var_10], 0
		mov	[bp+var_1E], si
		push	28Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_94DBA
		jmp	loc_94F09

loc_94DBA:
		mov	word ptr [di], 698h
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	byte ptr [di+0Fh], 0
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	byte ptr [di+1Dh], 0
		mov	word ptr [di], 911h
		mov	word ptr [di+22h], 909h
		xor	ax, ax
		mov	[di+26h], ax
		mov	[di+24h], ax
		mov	word ptr [di+22h], 90Dh
		mov	dword ptr [di+28h], 0
		mov	byte ptr [di+2Ch], 2
		mov	byte ptr [di+2Dh], 0
		mov	dword ptr [di+2Eh], 0
		mov	word ptr [di+32h], 8D1h
		mov	word ptr [di+36h], 0
		mov	word ptr [di+38h], 0
		mov	byte ptr [di+43h], 0
		mov	word ptr [di+44h], 0
		mov	word ptr [di+46h], 0
		mov	byte ptr [di+51h], 0
		mov	byte ptr [di+52h], 1
		mov	byte ptr [di+53h], 0
		mov	byte ptr [di+54h], 0
		mov	word ptr [di+32h], 8EDh
		mov	dword ptr [di+0EAh], 0
		mov	byte ptr [di+0EEh], 2
		mov	byte ptr [di+0EFh], 0
		mov	dword ptr [di+0F0h], 0
		mov	dword ptr [di+0F6h], 0
		mov	byte ptr [di+0FAh], 2
		mov	byte ptr [di+0FBh], 0
		mov	dword ptr [di+0FCh], 0
		mov	ax, di
		add	ax, 104h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	dword ptr [di+1C7h], 0
		mov	byte ptr [di+1CBh], 2
		mov	byte ptr [di+1CCh], 0
		mov	dword ptr [di+1CDh], 0
		mov	dword ptr [di+1D1h], 0
		mov	byte ptr [di+1D5h], 2
		mov	byte ptr [di+1D6h], 0
		mov	dword ptr [di+1D7h], 0
		mov	ax, di
		add	ax, 1E4h
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	word ptr [di+1E4h], 508h
		mov	dword ptr [di+245h], 100h
		mov	dword ptr [di+241h], 0
		mov	word ptr [di+1E4h], 520h
		mov	word ptr [di+260h], 0
		xor	ax, ax
		mov	[di+25Eh], ax
		movsx	eax, ax
		mov	[di+249h], eax
		lea	ax, [bp+var_18]
		push	ax
		push	[bp+var_1E]
		push	di
		call	sub_735BE
		add	sp, 6
		mov	ax, di
		jmp	short loc_94F0B

loc_94F09:
		mov	ax, di

loc_94F0B:
		mov	[si+5Ch], ax

loc_94F0E:
		cmp	word ptr [si+89h], 0
		jz	short loc_94F50
		cmp	word ptr [si+5Ch], 0
		jz	short loc_94F50
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	byte ptr [si+52h], 1
		push	word ptr [si+5Ch]
		call	sub_735D2
		pop	cx
		push	0
		push	word ptr [si+5Ch]
		call	sub_7349A
		add	sp, 4
		mov	ax, [si+5Ch]
		mov	word_77696, ax
		mov	byte_7769B, 1
		mov	byte_7769C, 1

loc_94F50:
		mov	bx, [si+5Ch]
		push	word ptr [bx+1DCh]
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		push	si
		push	cs
		call	near ptr HUDSymbol_ConstructWithContainerOpB_93F61
		pop	cx
		mov	al, [si+52h]
		and	ax, 1

loc_94F6E:
		pop	di
		pop	si
		leave
		retf
sub_94C9E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_94F72		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+5Ch]
		push	word ptr [bx+1DCh]
		push	67ADh
		call	sub_1E642
		add	sp, 4
		mov	byte_7769B, 0
		mov	byte_7769C, 0
		push	si
		call	sub_73DFB
		pop	cx
		push	0
		call	sub_1B9E8
		pop	cx
		pop	si
		pop	bp
		retf
sub_94F72		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_94FA7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_94FDE
		mov	ax, si
		add	ax, 89h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	sub_73E05
		add	sp, 4
		test	di, 1
		jz	short loc_94FDC
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_94FDE

loc_94FDC:
		jmp	short loc_94FDE

loc_94FDE:
		pop	di
		pop	si
		pop	bp
		retf
sub_94FA7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_94FE2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9501A
		mov	word ptr [si], 8D1h
		mov	ax, si
		add	ax, 12h
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		mov	ax, si
		add	ax, 4
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_9501A
		push	si
		call	sub_3B2
		pop	cx

loc_9501A:
		pop	di
		pop	si
		pop	bp
		retf
sub_94FE2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via vtable
; (DATA XREF seg339) — enveloppe appelant StreamReader_Destruct_638FF. Référencée directement
; par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_9501E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	UI_PositionListLabels
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_9501E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9502D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_9502D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_95035		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9506D
		mov	ax, si
		add	ax, 12h
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		mov	ax, si
		add	ax, 4
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_9506B
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_9506D

loc_9506B:
		jmp	short loc_9506D

loc_9506D:
		pop	di
		pop	si
		pop	bp
		retf
sub_95035		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_95071		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_95071		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ReleaseListEntry_85DCA (sub_85DCA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle LinkedListB_Helper_5F66B (seg159).
; ==============================================================================================
HUDSymbol_ReleaseListEntry_95079		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_950A0
		mov	word ptr [si], 909h
		push	si
		call	sub_68B0D
		pop	cx
		test	di, 1
		jz	short loc_950A0
		push	si
		call	sub_3B2
		pop	cx

loc_950A0:
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseListEntry_95079		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_950A4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_95110
		mov	word ptr [si], 90Dh
		push	si
		call	sub_73678
		pop	cx
		cmp	byte ptr [si+0Bh], 0
		jz	short loc_950E4
		cmp	dword ptr [si+6], 0
		jz	short loc_950E4
		push	0
		mov	al, [si+0Ah]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_950E4

loc_950E4:
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	word ptr [si], 909h
		push	si
		call	sub_68B0D
		pop	cx
		test	di, 1
		jz	short loc_95110
		push	si
		call	sub_3B2
		pop	cx

loc_95110:
		pop	di
		pop	si
		pop	bp
		retf
sub_950A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_95114		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9514B
		mov	ax, si
		add	ax, 89h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	sub_73E05
		add	sp, 4
		test	di, 1
		jz	short loc_95149
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_9514B

loc_95149:
		jmp	short loc_9514B

loc_9514B:
		pop	di
		pop	si
		pop	bp
		retf
sub_95114		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9514F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_95186
		mov	ax, si
		add	ax, 89h
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	sub_73E05
		add	sp, 4
		test	di, 1
		jz	short loc_95184
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_95186

loc_95184:
		jmp	short loc_95186

loc_95186:
		pop	di
		pop	si
		pop	bp
		retf
sub_9514F		endp
ovr252		ends
