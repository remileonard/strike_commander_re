seg201		segment	para public 'CODE' use16
		assume cs:seg201
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6BB12		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	large 80h
		push	0
		call	FileStream_Construct_6B56D
		add	sp, 6
		pop	bp
		retf
sub_6BB12		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_RegistryAdd_3B920 (sub_3B920 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à StreamReader_RegistryAdd_640B0 (sub_640B0 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, ajoute un
; handle à une table globale de 8 flux ouverts (word_7107C = compteur). Référencée par
; sub_64321.
; ==============================================================================================
StreamReader_RegistryAdd_6BB2A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	word_7B172, 8
		jge	short loc_6BB4A
		mov	bx, word_7B172
		shl	bx, 1
		mov	ax, [bp+arg_0]
		mov	[bx+6B9Ah], ax
		inc	word_7B172
		mov	ax, 1
		jmp	short loc_6BB4C

loc_6BB4A:
		xor	ax, ax

loc_6BB4C:
		pop	bp
		retf
StreamReader_RegistryAdd_6BB2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_RegistryRemove_3B944 (sub_3B944 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à StreamReader_RegistryRemove_640D4 (sub_640D4 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, retire un
; handle de la table globale des flux ouverts (recherche linéaire + compactage). Référencée
; par sub_642FF.
; ==============================================================================================
StreamReader_RegistryRemove_6BB4E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	dx, dx
		jmp	short loc_6BB7E

loc_6BB55:
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+6B9Ah]
		cmp	ax, [bp+arg_0]
		jnz	short loc_6BB7D
		dec	word_7B172
		mov	bx, word_7B172
		shl	bx, 1
		mov	ax, [bx+6B9Ah]
		mov	bx, dx
		shl	bx, 1
		mov	[bx+6B9Ah], ax
		mov	ax, 1
		jmp	short loc_6BB86

loc_6BB7D:
		inc	dx

loc_6BB7E:
		cmp	dx, word_7B172
		jl	short loc_6BB55
		xor	ax, ax

loc_6BB86:
		pop	bp
		retf
StreamReader_RegistryRemove_6BB4E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6BB88		proc far

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
		jz	short loc_6BBA2
		push	di
		call	CRT_Strlen
		pop	cx
		mov	dx, ax

loc_6BBA2:
		cmp	dx, 3
		jle	short loc_6BC1C
		push	4A44h
		mov	ax, di
		add	ax, dx
		add	ax, 0FFFDh
		push	ax
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jz	short loc_6BC1C
		mov	[bp+var_2], 0
		jmp	short loc_6BC13

loc_6BBC5:
		mov	bx, [bp+var_2]
		shl	bx, 1
		mov	si, [bx+6B9Ah]
		push	si
		call	StreamReader_ValidateState_6C307
		pop	cx
		or	al, al
		jz	short loc_6BC10
		push	di
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ParseFormattedString_6BCC4
		add	sp, 4
		or	ax, ax
		jz	short loc_6BC10
		mov	eax, [si+127h]
		mov	[bp+var_6], eax
		add	eax, [si+12Bh]
		mov	[bp+var_A], eax
		push	di
		push	eax
		push	large [bp+var_6]
		push	si
		push	[bp+arg_0]
		call	sub_6C024
		add	sp, 0Eh
		mov	al, 1
		jmp	short loc_6BC1E

loc_6BC10:
		inc	[bp+var_2]

loc_6BC13:
		mov	ax, [bp+var_2]
		cmp	ax, word_7B172
		jl	short loc_6BBC5

loc_6BC1C:
		mov	al, 0

loc_6BC1E:
		pop	di
		pop	si
		leave
		retf
sub_6BB88		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_DispatchWrite_3B9E5 (sub_3B9E5 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à StreamReader_DispatchWrite_64175 (sub_64175 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable
; [bx+4] (écriture).
; ==============================================================================================
StreamReader_DispatchWrite_6BC22		proc far
		push	bp
		mov	bp, sp
		push	si
		push	di
		xor	si, si
		jmp	short loc_6BC4F

loc_6BC2B:
		mov	bx, si
		shl	bx, 1
		mov	di, [bx+6B9Ah]
		or	di, di
		jz	short loc_6BC44
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short loc_6BC44

loc_6BC44:
		mov	bx, si
		shl	bx, 1
		mov	word ptr [bx+6B9Ah], 0
		inc	si

loc_6BC4F:
		cmp	si, word_7B172
		jl	short loc_6BC2B
		mov	word_7B172, 0
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_DispatchWrite_6BC22		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ParseFormattedValueB_3BA22 (sub_3BA22 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à StreamReader_ParseFormattedValueB_641B2 (sub_641B2 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle sub_64217 (parseur) — variante d'appel.
; ==============================================================================================
StreamReader_ParseFormattedValueB_6BC5F		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		xor	di, di
		xor	si, si
		jmp	short loc_6BC8C

loc_6BC6D:
		mov	bx, si
		shl	bx, 1
		mov	ax, [bx+6B9Ah]
		mov	[bp+var_2], ax
		push	[bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr StreamReader_ParseFormattedString_6BCC4
		add	sp, 4
		or	ax, ax
		jz	short loc_6BC8B
		inc	di
		jmp	short loc_6BC92

loc_6BC8B:
		inc	si

loc_6BC8C:
		cmp	si, word_7B172
		jl	short loc_6BC6D

loc_6BC92:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
StreamReader_ParseFormattedValueB_6BC5F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_PrepareParse_3BA5B (sub_3BA5B de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_PrepareParse_641EB (sub_641EB de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; StreamReader_SeekVariant_63DF6 et StreamReader_ReadTyped_63FA1 (seg190) — prépare le flux
; avant analyse formatée. Appelée par sub_64217.
; ==============================================================================================
StreamReader_PrepareParse_6BC98		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0
		push	si
		call	StreamReader_SeekVariant_6C348
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 8
		push	ds
		mov	ax, si
		add	ax, 0DDh
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
StreamReader_PrepareParse_6BC98		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ParseFormattedString_3BA87 (sub_3BA87 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_ParseFormattedString_64217 (sub_64217 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 148 lignes, NON DÉTAILLÉE —
; la plus grosse fonction du segment : combine StreamReader_ValidateState_63DB5,
; StreamReader_PrepareParse_641EB, sub_2B99 (formatage externe) et
; StreamReader_SeekVariant_63DF6 — parseur de valeur/chaîne formatée à travers le flux
; tamponné (proche d'un sscanf typé). Candidat pour session dédiée si le format exact doit
; être élucidé.
; ==============================================================================================
StreamReader_ParseFormattedString_6BCC4		proc far

var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		push	si
		call	StreamReader_ValidateState_6C307
		pop	cx
		or	al, al
		jnz	short loc_6BCE2
		jmp	loc_6BDA5

loc_6BCE2:
		push	si
		push	cs
		call	near ptr StreamReader_PrepareParse_6BC98
		pop	cx
		push	[bp+arg_2]
		call	CRT_Strupr_30EF
		pop	cx
		mov	di, [si+0DDh]
		mov	eax, [si+4Dh]
		mov	[bp+var_6], eax
		jmp	loc_6BD87

loc_6BD00:
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		push	eax
		push	si
		call	StreamReader_SeekVariant_6C348
		add	sp, 6
		mov	ax, si
		add	ax, 0E5h
		mov	[bp+var_10], ax
		push	large 0FFFFFFFFh
		push	large 4Ah
		push	ds
		push	ax
		push	si
		call	StreamReader_ReadTyped_6C4F3
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 4Ah
		jz	short loc_6BD45
		mov	bx, [bp+var_10]
		mov	byte ptr [bx], 0
		mov	byte ptr [bx+1], 0

loc_6BD45:
		mov	ax, [bp+arg_2]
		mov	[bp+var_16], ax
		mov	ax, si
		add	ax, 0E6h
		push	ax
		push	[bp+var_16]
		call	CRT_Stricmp
		add	sp, 4
		mov	dx, ax
		or	dx, dx
		jnz	short loc_6BD69
		mov	[bp+var_2], 1
		jmp	short loc_6BDA5

loc_6BD69:
		or	dx, dx
		jge	short loc_6BD74
		mov	ax, di
		inc	ax
		sar	ax, 1
		jmp	short loc_6BD85

loc_6BD74:
		mov	eax, [bp+var_A]
		add	eax, 4Ah
		mov	[bp+var_6], eax
		mov	ax, di
		sar	ax, 1
		inc	ax

loc_6BD85:
		sub	di, ax

loc_6BD87:
		mov	ax, di
		sar	ax, 1
		movsx	eax, ax
		imul	eax, eax, 4Ah
		mov	edx, [bp+var_6]
		add	edx, eax
		mov	[bp+var_A], edx
		or	di, di
		jle	short loc_6BDA5
		jmp	loc_6BD00

loc_6BDA5:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
StreamReader_ParseFormattedString_6BCC4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_CloseAndUnregister_3BB6F (sub_3BB6F de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à StreamReader_CloseAndUnregister_642FF (sub_642FF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; ferme le flux (StreamReader_ValidateState_63DB5, StreamReader_CloseHook_63D6E) puis le
; retire de la table globale (StreamReader_RegistryRemove_640D4).
; ==============================================================================================
StreamReader_CloseAndUnregister_6BDAC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_ValidateState_6C307
		pop	cx
		or	al, al
		jz	short loc_6BDCB
		push	si
		call	sub_6C2A4
		pop	cx
		push	si
		push	cs
		call	near ptr StreamReader_RegistryRemove_6BB4E
		pop	cx

loc_6BDCB:
		pop	si
		pop	bp
		retf
StreamReader_CloseAndUnregister_6BDAC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_OpenAndRegister_3BB91 (sub_3BB91 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_OpenAndRegister_64321 (sub_64321 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, ouvre un flux
; (StreamReader_ReadDispatch_63D0E, StreamReader_ValidateState_63DB5) puis l'ajoute à la table
; globale (StreamReader_RegistryAdd_640B0).
; ==============================================================================================
StreamReader_OpenAndRegister_6BDCE		proc far

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
		call	StreamReader_ReadDispatch_6C244
		add	sp, 6
		mov	[bp+var_2], al
		push	si
		call	StreamReader_ValidateState_6C307
		pop	cx
		or	al, al
		jz	short loc_6BDFA
		push	si
		push	cs
		call	near ptr StreamReader_RegistryAdd_6BB2A
		pop	cx

loc_6BDFA:
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
StreamReader_OpenAndRegister_6BDCE		endp
seg201		ends
