seg004		segment	para public 'CODE' use16
		assume cs:seg004
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 10h, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_RegistryAdd_6BB2A (sub_6BB2A de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_RegistryAdd_3B920 (sub_3B920 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à StreamReader_RegistryAdd_640B0 (sub_640B0 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, ajoute un
; handle à une table globale de 8 flux ouverts (word_7107C = compteur). Référencée par
; sub_64321.
; ==============================================================================================
StreamReader_RegistryAdd_4863		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	word_59E58, 8
		jge	short loc_4883
		mov	bx, word_59E58
		shl	bx, 1
		mov	ax, [bp+arg_0]
		mov	[bx+5298h], ax
		inc	word_59E58
		mov	ax, 1
		jmp	short loc_4885

loc_4883:
		xor	ax, ax

loc_4885:
		pop	bp
		retf
StreamReader_RegistryAdd_4863		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_RegistryRemove_6BB4E (sub_6BB4E de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_RegistryRemove_3B944 (sub_3B944 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à StreamReader_RegistryRemove_640D4 (sub_640D4 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, retire un
; handle de la table globale des flux ouverts (recherche linéaire + compactage). Référencée
; par sub_642FF.
; ==============================================================================================
StreamReader_RegistryRemove_4887		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	dx, dx
		jmp	short loc_48B7

loc_488E:
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+5298h]
		cmp	ax, [bp+arg_0]
		jnz	short loc_48B6
		dec	word_59E58
		mov	bx, word_59E58
		shl	bx, 1
		mov	ax, [bx+5298h]
		mov	bx, dx
		shl	bx, 1
		mov	[bx+5298h], ax
		mov	ax, 1
		jmp	short loc_48BF

loc_48B6:
		inc	dx

loc_48B7:
		cmp	dx, word_59E58
		jl	short loc_488E
		xor	ax, ax

loc_48BF:
		pop	bp
		retf
StreamReader_RegistryRemove_4887		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48C1		proc far

var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	di, [bp+arg_2]
		xor	dx, dx
		or	di, di
		jz	short loc_48DB
		push	di
		call	CRT_Strlen
		pop	cx
		mov	dx, ax

loc_48DB:
		cmp	dx, 3
		jle	short loc_4955
		push	13Ah
		mov	ax, di
		add	ax, dx
		add	ax, 0FFFDh
		push	ax
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jz	short loc_4955
		mov	[bp+var_2], 0
		jmp	short loc_494C

loc_48FE:
		mov	bx, [bp+var_2]
		shl	bx, 1
		mov	si, [bx+5298h]
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		or	al, al
		jz	short loc_4949
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_49FD
		add	sp, 4
		or	ax, ax
		jz	short loc_4949
		mov	eax, [si+0ABh]
		mov	[bp+var_6], eax
		add	eax, [si+0AFh]
		mov	[bp+var_A], eax
		push	di
		push	eax
		push	large [bp+var_6]
		push	si
		push	[bp+arg_0]
		call	sub_5252A
		add	sp, 0Eh
		mov	al, 1
		jmp	short loc_4957

loc_4949:
		inc	[bp+var_2]

loc_494C:
		mov	ax, [bp+var_2]
		cmp	ax, word_59E58
		jl	short loc_48FE

loc_4955:
		mov	al, 0

loc_4957:
		pop	di
		pop	si
		leave
		retf
sub_48C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_DispatchWrite_6BC22 (sub_6BC22 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_DispatchWrite_3B9E5 (sub_3B9E5 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à StreamReader_DispatchWrite_64175 (sub_64175 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable
; [bx+4] (écriture).
; ==============================================================================================
StreamReader_DispatchWrite_495B		proc far
		push	bp
		mov	bp, sp
		push	si
		push	di
		xor	si, si
		jmp	short loc_4988

loc_4964:
		mov	bx, si
		shl	bx, 1
		mov	di, [bx+5298h]
		or	di, di
		jz	short loc_497D
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short loc_497D

loc_497D:
		mov	bx, si
		shl	bx, 1
		mov	word ptr [bx+5298h], 0
		inc	si

loc_4988:
		cmp	si, word_59E58
		jl	short loc_4964
		mov	word_59E58, 0
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_DispatchWrite_495B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ParseFormattedValueB_6BC5F (sub_6BC5F de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ParseFormattedValueB_3BA22 (sub_3BA22 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à StreamReader_ParseFormattedValueB_641B2 (sub_641B2 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle sub_64217 (parseur) — variante d'appel.
; ==============================================================================================
StreamReader_ParseFormattedValueB_4998		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		xor	di, di
		xor	si, si
		jmp	short loc_49C5

loc_49A6:
		mov	bx, si
		shl	bx, 1
		mov	ax, [bx+5298h]
		mov	[bp+var_2], ax
		push	[bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr sub_49FD
		add	sp, 4
		or	ax, ax
		jz	short loc_49C4
		inc	di
		jmp	short loc_49CB

loc_49C4:
		inc	si

loc_49C5:
		cmp	si, word_59E58
		jl	short loc_49A6

loc_49CB:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
StreamReader_ParseFormattedValueB_4998		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_PrepareParse_6BC98 (sub_6BC98 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_PrepareParse_3BA5B (sub_3BA5B de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_PrepareParse_641EB (sub_641EB de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; StreamReader_SeekVariant_63DF6 et StreamReader_ReadTyped_63FA1 (seg190) — prépare le flux
; avant analyse formatée. Appelée par sub_64217.
; ==============================================================================================
StreamReader_PrepareParse_49D1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0
		push	si
		call	StreamReader_SeekVariant_5284E
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 8
		push	ds
		mov	ax, si
		add	ax, 61h
		push	ax
		push	si
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
StreamReader_PrepareParse_49D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_49FD		proc far

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
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		or	al, al
		jnz	short loc_4A20
		jmp	loc_4AD1

loc_4A20:
		push	[bp+arg_2]
		call	CRT_Strupr_2F35
		pop	cx
		mov	di, [si+61h]
		mov	ax, [bp+var_4]
		mov	[bp+var_6], ax
		mov	ax, di
		sar	ax, 1
		imul	ax, ax, 4Ah
		jmp	loc_4AC2

loc_4A3C:
		mov	ax, [bp+var_8]
		mov	[bp+var_4], ax
		mov	ax, si
		add	ax, 69h
		mov	[bp+var_A], ax
		mov	cx, [bp+var_4]
		movsx	eax, cx
		mov	edx, [si+61h]
		imul	edx, edx, 4Ah
		cmp	eax, edx
		jge	short loc_4A77
		push	4Ah
		mov	ax, [si+5Dh]
		add	ax, cx
		push	word ptr [si+5Fh]
		push	ax
		push	ds
		push	[bp+var_A]
		call	sub_3609
		add	sp, 0Ah
		jmp	short loc_4A77

loc_4A77:
		mov	ax, [bp+arg_2]
		mov	[bp+var_C], ax
		mov	ax, si
		add	ax, 6Ah
		push	ax
		push	[bp+var_C]
		call	CRT_Stricmp
		add	sp, 4
		mov	dx, ax
		or	dx, dx
		jnz	short loc_4A9B
		mov	[bp+var_2], 1
		jmp	short loc_4AD1

loc_4A9B:
		or	dx, dx
		jge	short loc_4AA6
		mov	ax, di
		inc	ax
		sar	ax, 1
		jmp	short loc_4AB4

loc_4AA6:
		mov	ax, [bp+var_8]
		add	ax, 4Ah
		mov	[bp+var_6], ax
		mov	ax, di
		sar	ax, 1
		inc	ax

loc_4AB4:
		sub	di, ax
		mov	ax, di
		sar	ax, 1
		movsx	eax, ax
		imul	eax, eax, 4Ah

loc_4AC2:
		mov	dx, [bp+var_6]
		add	dx, ax
		mov	[bp+var_8], dx
		or	di, di
		jle	short loc_4AD1
		jmp	loc_4A3C

loc_4AD1:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_49FD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4AD8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		or	al, al
		jz	short loc_4AF7
		push	si
		call	sub_527AA
		pop	cx
		push	si
		push	cs
		call	near ptr StreamReader_RegistryRemove_4887
		pop	cx

loc_4AF7:
		push	si
		nop
		push	cs
		call	near ptr Palette_DestructResource_4B8B
		pop	cx
		pop	si
		pop	bp
		retf
sub_4AD8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4B01		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+5Dh], 0
		jnz	short loc_4B82
		push	1
		push	0
		push	2
		mov	eax, [si+61h]
		imul	eax, eax, 4Ah
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[si+5Fh], dx
		mov	[si+5Dh], ax
		cmp	dword ptr [si+5Dh], 0
		jnz	short loc_4B46
		push	13Eh
		push	si
		call	sub_59C00
		add	sp, 4

loc_4B46:
		push	large 0FFFFFFFFh
		mov	eax, [si+61h]
		imul	eax, eax, 4Ah
		push	eax
		push	large [si+5Dh]
		push	si
		call	StreamReader_ReadTyped_529F9
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_4], eax
		mov	eax, [si+61h]
		imul	eax, eax, 4Ah
		cmp	eax, [bp+var_4]
		jz	short loc_4B82
		push	155h
		push	si
		call	sub_59C00
		add	sp, 4

loc_4B82:
		mov	dx, [si+5Fh]
		mov	ax, [si+5Dh]
		pop	si
		leave
		retf
sub_4B01		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
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
Palette_DestructResource_4B8B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	2
		mov	ax, si
		add	ax, 5Dh
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		mov	dword ptr [si+5Dh], 0
		pop	si
		pop	bp
		retf
Palette_DestructResource_4B8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4BB2		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	[bp+arg_2]
		push	si
		call	StreamReader_ReadDispatch_5274A
		add	sp, 6
		mov	[bp+var_2], al
		push	si
		call	StreamReader_ValidateState_5280D
		pop	cx
		or	al, al
		jz	short loc_4BEA
		push	si
		push	cs
		call	near ptr StreamReader_RegistryAdd_4863
		pop	cx
		push	si
		push	cs
		call	near ptr StreamReader_PrepareParse_49D1
		pop	cx
		push	si
		push	cs
		call	near ptr sub_4B01
		pop	cx

loc_4BEA:
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
sub_4BB2		endp
seg004		ends
