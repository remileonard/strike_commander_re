ovr317		segment	para public 'OVERLAY' use16
		assume cs:ovr317
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_SubHelperY_A0BE0 (sub_A0BE0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; référencée via jmp depuis un stub VROOMM (sub_6C620) et par
; PlayerComponent_SubHelperZ_A0CE2/PlayerComponentVariantP_A0D23.
; ==============================================================================================
PlayerComponent_SubHelperY_B0BA0		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+1Eh], ax
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+24h], eax
		pop	si
		leave
		retf
PlayerComponent_SubHelperY_B0BA0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B0BC3		proc far

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
		call	near ptr sub_B0BE6
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_B0BC3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B0BE6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0
		push	large 44465253h
		push	di
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_B0C35
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+24h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+28h], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+2Ch], eax
		jmp	short loc_B0C3E

loc_B0C35:
		push	0C026h
		call	sub_1DDFE
		pop	cx

loc_B0C3E:
		pop	di
		pop	si
		pop	bp
		retf
sub_B0BE6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B0C42		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_B0C42		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PlayerComponent_SubHelperCC_A0C80 (sub_A0C80 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_6CAC5 (sous-objet composite) et
; PlayerComponent_SubHelperBB_A0C78.
; ==============================================================================================
PlayerComponent_SubHelperCC_B0C4A		proc far

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
		push	cs
		call	near ptr sub_B0C42
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
PlayerComponent_SubHelperCC_B0C4A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponentVariantQ_ConstructAndInit_A0CA2
; (sub_A0CA2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, alloue (sub_658), initialise sous-objet composite (sub_6CACA) — constructeur de
; variante de composant joueur.
; ==============================================================================================
PlayerComponentVariantQ_ConstructAndInit_B0C6C		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	ax, [bp+arg_0]
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B0CA7
		mov	word ptr [si], 1BAEh
		push	ax
		call	sub_74EBA
		pop	cx
		mov	word ptr [si], 1802h
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[si+24h], eax
		mov	ax, si
		jmp	short loc_B0CA9

loc_B0CA7:
		mov	ax, si

loc_B0CA9:
		pop	si
		leave
		retf
PlayerComponentVariantQ_ConstructAndInit_B0C6C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponent_SubHelperZ_A0CE2 (sub_A0CE2 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (sub_658), initialise sous-objet composite (sub_6CACA), appelle
; PlayerComponent_SubHelperY_A0BE0.
; ==============================================================================================
PlayerComponent_SubHelperZ_B0CAC		proc far

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
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B0CE8
		mov	word ptr [si], 1BAEh
		push	ax
		call	sub_74EBA
		pop	cx
		mov	word ptr [si], 1802h
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr PlayerComponent_SubHelperY_B0BA0
		add	sp, 4
		mov	ax, si
		jmp	short loc_B0CEA

loc_B0CE8:
		mov	ax, si

loc_B0CEA:
		pop	si
		leave
		retf
PlayerComponent_SubHelperZ_B0CAC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PlayerComponentVariantP_ConstructAndInit_A0D23
; (sub_A0D23 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, alloue (sub_658), initialise sous-objet composite (sub_6CACA), combine
; PlayerComponent_SubHelperY_A0BE0 et PlayerComponent_SubHelperCC_A0C80.
; ==============================================================================================
PlayerComponentVariantP_ConstructAndInit_B0CED		proc far

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
		push	30h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_B0D2A
		mov	word ptr [di], 1BAEh
		push	ax
		call	sub_74EBA
		pop	cx
		mov	word ptr [di], 1802h
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr PlayerComponent_SubHelperY_B0BA0
		add	sp, 4
		mov	ax, di
		jmp	short loc_B0D2C

loc_B0D2A:
		mov	ax, di

loc_B0D2C:
		mov	di, ax
		push	si
		push	ax
		push	cs
		call	near ptr PlayerComponent_SubHelperCC_B0C4A
		add	sp, 4
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
PlayerComponentVariantP_ConstructAndInit_B0CED		endp
ovr317		ends
