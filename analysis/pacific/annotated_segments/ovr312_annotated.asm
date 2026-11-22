ovr312		segment	para public 'OVERLAY' use16
		assume cs:ovr312
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à BombModel_LoadDATAChunk_9FAD0 (sub_9FAD0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LU
; 2026-09-28. Ex-'PlayerComponent_LoadFieldsWithRetry_9FAD0'. Chargeur du chunk 'DATA'
; (41544144h) des modeles BOMB, apres le chargeur de base (VROOMM_StubThunk_6C5A5) : octet ->
; +0x5E (bombe guidee : 1 pour la GBU-15, 0 pour MK-20/MK-82), octet -> +0x5F, octet -> +0x60,
; mot -> +0x61 (taux d'ouverture du cone de verrouillage, deg/s, lu par
; BombModel_TestGuidedLockCone_41735). Les lectures (ResourceRecord_ReadFinalField_64B51,
; ResourceRecord_ReadFieldGroupB_64A54 -> StreamReader_ReadTyped_63FA1) se font a une position
; absolue du fichier SANS borne de chunk : le DATA de la GBU-15 ne fait que 3 octets (01 03
; 00), le mot +0x61 est donc lu dans l'octet de bourrage (00) et le 1er octet de l'en-tete
; suivant 'FORM' (0x46) : +0x61 = 0x4600 = 17920. Chunk absent -> erreur fatale 0xC001. |
; COMPLÉMENT 2026-10-12 : octet +0x5F = DÉLAI D'ARMEMENT (s entières,
; Bomb_InitArmingDelay_9FD1C) ; octet +0x60 : rôle non établi.
; ==============================================================================================
BombModel_LoadDATAChunk_AF3F0		proc far

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
		jz	short loc_AF453
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+67h], al
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+68h], al
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+69h], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Ah], ax
		jmp	short loc_AF45C

loc_AF453:
		push	0C001h
		call	sub_1DDFE
		pop	cx

loc_AF45C:
		pop	si
		pop	bp
		retf
BombModel_LoadDATAChunk_AF3F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 14 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponentVariantA_ConstructAndInit_9FB3F
; (sub_9FB3F de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, alloue (sub_658), initialise deux classes de base (sub_3C9BC, sub_3DC27),
; appelle PlayerComponent_SubHelperA_9FD58, enregistre dans un conteneur (sub_6C00E), dispatch
; vtable [bx+8] — constructeur de variante de composant joueur.
; ==============================================================================================
PlayerComponentVariantA_ConstructAndInit_AF45F		proc far

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
		push	64h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_AF4CE
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
		mov	word ptr [si], 248Ah
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+5Fh], eax
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperA_AF650
		add	sp, 6
		mov	ax, si
		jmp	short loc_AF4D0

loc_AF4CE:
		mov	ax, si

loc_AF4D0:
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
PlayerComponentVariantA_ConstructAndInit_AF45F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AF4FE		proc far

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
		push	large 66h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_AF571
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
		mov	word ptr [si], 248Ah
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+5Fh], eax
		mov	word ptr [si], 2362h
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr sub_AF5EE
		add	sp, 6
		mov	ax, si
		jmp	short loc_AF573

loc_AF571:
		mov	ax, si

loc_AF573:
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
sub_AF4FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AF5A1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+6Ch], 0
		push	si
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr BombModel_LoadDATAChunk_AF3F0
		add	sp, 6
		push	0
		push	large 5058454Eh
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_AF5E2
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+6Ch], ax
		jmp	short loc_AF5EB

loc_AF5E2:
		push	0C002h
		call	sub_1DDFE
		pop	cx

loc_AF5EB:
		pop	si
		pop	bp
		retf
sub_AF5A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AF5EE		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+64h], 0
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperA_AF650
		add	sp, 6
		les	bx, word ptr [bp+arg_2]
		mov	ax, es:[bx+6Ch]
		mov	[si+64h], ax
		pop	si
		pop	bp
		retf
sub_AF5EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Bomb_InitArmingDelay_9FD1C (sub_9FD1C de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-12.
; Ex-'PlayerComponent_InitTimerField'. À la création d'une bombe : minuteur +0x5A = DATA champ
; 2 du modèle (+0x5F, uint8 en secondes entières) et +4 bit 1 effacé ; la mise à jour de la
; bombe (loc_41A59) repose ce bit quand le minuteur est échu (bit 1 = l'objet peut entrer en
; collision ; même bit que EXTE).
; ==============================================================================================
Bomb_InitArmingDelay_AF614		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		les	bx, [si+0Eh]
		mov	al, es:[bx+68h]
		mov	ah, 0
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		lea	ax, word ptr [bp+var_6]
		push	ax
		mov	ax, si
		add	ax, 5Fh
		push	ax
		call	Timer_SetAbsolute_50699
		add	sp, 4
		and	byte ptr [si+2], 0FDh
		pop	si
		leave
		retf
Bomb_InitArmingDelay_AF614		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PlayerComponent_SubHelperA_9FD58 (sub_9FD58 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_4338E et
; PlayerComponent_InitTimerField_9FD1C.
; ==============================================================================================
PlayerComponent_SubHelperA_AF650		proc far

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
		call	near ptr Bomb_InitArmingDelay_AF614
		pop	cx
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperA_AF650		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AF66D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_AF696
		push	0
		push	si
		call	sub_3FE92
		add	sp, 4
		test	di, 1
		jz	short loc_AF696
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_AF696

loc_AF696:
		pop	di
		pop	si
		pop	bp
		retf
sub_AF66D		endp
ovr312		ends
