ovr313		segment	para public 'OVERLAY' use16
		assume cs:ovr313
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AF6A0		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	sub_746D5
		add	sp, 6
		push	0
		push	large 41544144h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AF6FA
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+67h], eax
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Bh], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Ch], ax
		jmp	short loc_AF703

loc_AF6FA:
		push	0C00Ah
		call	sub_1DDFE
		pop	cx

loc_AF703:
		pop	si
		pop	bp
		retf
sub_AF6A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 14 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponentVariantJ_ConstructAndInit_A03B6
; (sub_A03B6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, alloue (sub_658), initialise deux classes de base (sub_3C9BC, sub_3DC27),
; appelle PlayerComponent_SubHelperP_A0488, enregistre dans un conteneur (sub_6C00E), dispatch
; vtable [bx+8].
; ==============================================================================================
PlayerComponentVariantJ_ConstructAndInit_AF706		proc far

var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	69h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_AF775
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si+52h], 0
		mov	word ptr [si], 2058h
		push	si
		call	sub_3C494
		pop	cx
		mov	word ptr [si], 23F6h
		mov	word ptr [si+5Ah], 0
		mov	word ptr [si+5Ch], 0
		mov	byte ptr [si+5Eh], 1
		or	byte ptr [si+2], 20h
		mov	word ptr [si], 251Eh
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+5Fh], eax
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperP_AF7D8
		add	sp, 6
		mov	ax, si
		jmp	short loc_AF777

loc_AF775:
		mov	ax, si

loc_AF777:
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		push	si
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+49h]
		mov	bx, es:[bx+49h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_A], ax
		mov	[si+52h], ax
		mov	ax, si
		pop	si
		leave
		retf
PlayerComponentVariantJ_ConstructAndInit_AF706		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Missile_InitFlightTimer_A0455 (sub_A0455 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-12, CORRIGEE 2026-10-15. A la creation d'un missile :
; Timer_SetAbsoluteAndResetPulses_4FAFC(instance+0x5A, DATA champ 1 du modele (+0x5E, int32
; secondes entieres) << 8) : minuteur en mode 0 (decremente de dt chaque tick par
; Timer_Tick_4F9E6), compteurs de pulsation remis a 0. C'est la DUREE DE VOL : quand le
; minuteur atteint 0, Missile_UpdateSeekerAndFuse_42458 renvoie 0 et le missile est retire et
; explose. (L'ancien resume 'delai du chercheur' etait faux : le test porte sur la valeur de
; retour du minuteur, vraie tant qu'il reste du temps.) Ex-'Missile_InitSeekerDelay_A0455'.
; ==============================================================================================
Missile_InitFlightTimer_AF7A5		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	dx, [bp+arg_0]
		mov	bx, dx
		les	bx, [bx+0Eh]
		mov	eax, es:[bx+67h]
		mov	[bp+var_4], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		mov	ax, dx
		add	ax, 5Fh
		push	ax
		call	Timer_SetAbsoluteAndResetPulses_507F3
		add	sp, 4
		leave
		retf
Missile_InitFlightTimer_AF7A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PlayerComponent_SubHelperP_A0488 (sub_A0488 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_4338E,
; PlayerComponent_InitPulseTimer_A0455, sub_3D566.
; ==============================================================================================
PlayerComponent_SubHelperP_AF7D8		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	Targeting_InitWithFlags
		add	sp, 6
		push	si
		push	cs
		call	near ptr Missile_InitFlightTimer_AF7A5
		pop	cx
		push	si
		call	SmokeTrail_EnableIfModelHasSmok_3BD75
		pop	cx
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperP_AF7D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AF7FC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	ax
		nop
		push	cs
		call	near ptr sub_AF810
		add	sp, 4
		pop	bp
		retf
sub_AF7FC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AF810		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		call	sub_74EB0
		add	sp, 4
		push	di
		push	si
		nop
		push	cs
		call	near ptr DynMissile_LoadMISSChunk_AF833
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_AF810		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à DynMissile_LoadMISSChunk_A04E3 (sub_A04E3 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE (2026-09-24). Ex-'PlayerComponent_LoadFieldGroupC'. Chargeur du chunk dynamique 'MISS'
; (5353494Dh) du corps physique du missile (appele via PlayerComponent_SubHelperR_A04C0 depuis
; JDYN_LoadChunkAndConstruct_3A49C) : 5 dwords (ResourceRecord_ReadFieldGroupC_64A7E) -> +0x21
; vitesse angulaire maximale de guidage (MissileBody_SteerToTarget_42738), +0x25 vitesse
; maximale / de croisiere, +0x29 acceleration de propulsion, +0x2D et +0x31 composantes
; laterale et normale de la vitesse de croisiere (MissileBody_SetCruiseVelocity_42A1B). Chunk
; absent : erreur 0xC00B.
; ==============================================================================================
DynMissile_LoadMISSChunk_AF833		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		push	large 5353494Dh
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AF8B7
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		mov	[si+24h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		mov	[si+28h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_C], eax
		mov	[si+2Ch], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_10], eax
		mov	[si+30h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_14], eax
		mov	[si+34h], eax
		jmp	short loc_AF8C0

loc_AF8B7:
		push	0C00Bh
		call	sub_1DDFE
		pop	cx

loc_AF8C0:
		pop	di
		pop	si
		leave
		retf
DynMissile_LoadMISSChunk_AF833		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AF8C4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+3Eh], 0
		mov	byte ptr [si+3Dh], 0
		mov	bx, [si+1Eh]
		and	byte ptr [bx+2], 0FDh
		pop	si
		pop	bp
		retf
sub_AF8C4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponentVariantK_ConstructAndInit_A058D
; (sub_A058D de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, alloue (sub_658), initialise sous-objet composite (sub_6CACA), appelle
; PlayerComponent_SubHelperT_A0673.
; ==============================================================================================
PlayerComponentVariantK_ConstructAndInit_AF8DD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		push	3Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_AF916
		mov	word ptr [si], 1BAEh
		push	ax
		call	sub_74EBA
		pop	cx
		mov	word ptr [si], 18DAh
		mov	word ptr [si+38h], 0
		mov	word ptr [si+3Ah], 0
		push	si
		nop
		push	cs
		call	near ptr sub_AF9C3
		pop	cx
		mov	ax, si
		jmp	short loc_AF918

loc_AF916:
		mov	ax, si

loc_AF918:
		pop	si
		pop	bp
		retf
PlayerComponentVariantK_ConstructAndInit_AF8DD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponentVariantL_ConstructAndInit_A05CB
; (sub_A05CB de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, alloue (sub_658), initialise sous-objet composite (sub_6CACA), appelle
; PlayerComponent_SubHelperU_A0681.
; ==============================================================================================
PlayerComponentVariantL_ConstructAndInit_AF91B		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	ax, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	3Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_AF962
		mov	word ptr [si], 1BAEh
		push	ax
		call	sub_74EBA
		pop	cx
		mov	word ptr [si], 18DAh
		mov	word ptr [si+38h], 0
		mov	word ptr [si+3Ah], 0
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr sub_AF9D1
		add	sp, 4
		mov	ax, si
		jmp	short loc_AF964

loc_AF962:
		mov	ax, si

loc_AF964:
		pop	si
		leave
		retf
PlayerComponentVariantL_ConstructAndInit_AF91B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponentVariantM_ConstructAndInit_A0617
; (sub_A0617 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, alloue (sub_658), initialise sous-objet composite (sub_6CACA), combine
; PlayerComponent_SubHelperU_A0681 et PlayerComponent_SubHelperV_A0697.
; ==============================================================================================
PlayerComponentVariantM_ConstructAndInit_AF967		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	3Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_AF9AF
		mov	word ptr [di], 1BAEh
		push	ax
		call	sub_74EBA
		pop	cx
		mov	word ptr [di], 18DAh
		mov	word ptr [di+38h], 0
		mov	word ptr [di+3Ah], 0
		push	[bp+var_2]
		push	di
		nop
		push	cs
		call	near ptr sub_AF9D1
		add	sp, 4
		mov	ax, di
		jmp	short loc_AF9B1

loc_AF9AF:
		mov	ax, di

loc_AF9B1:
		mov	di, ax
		push	si
		push	ax
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperV_AF9E7
		add	sp, 4
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
PlayerComponentVariantM_ConstructAndInit_AF967		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AF9C3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr sub_AF8C4
		pop	cx
		pop	bp
		retf
sub_AF9C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AF9D1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+1Eh], ax
		push	si
		push	cs
		call	near ptr sub_AF9C3
		pop	cx
		pop	si
		pop	bp
		retf
sub_AF9D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PlayerComponent_SubHelperV_A0697 (sub_A0697 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_6CAC5 (sous-objet composite) et
; PlayerComponent_SubHelperW_A06BA.
; ==============================================================================================
PlayerComponent_SubHelperV_AF9E7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		call	sub_74EB5
		add	sp, 4
		push	di
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperW_AFA0A
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperV_AF9E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_SubHelperW_A06BA (sub_A06BA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; référencée via jmp depuis un stub VROOMM (sub_6C562) et par
; PlayerComponent_SubHelperV_A0697.
; ==============================================================================================
PlayerComponent_SubHelperW_AFA0A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di+24h]
		mov	[si+24h], eax
		mov	eax, [di+28h]
		mov	[si+28h], eax
		mov	eax, [di+2Ch]
		mov	[si+2Ch], eax
		mov	eax, [di+30h]
		mov	[si+30h], eax
		mov	eax, [di+34h]
		mov	[si+34h], eax
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperW_AFA0A		endp
ovr313		ends
