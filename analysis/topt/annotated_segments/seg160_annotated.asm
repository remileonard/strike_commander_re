seg160		segment	para public 'CODE' use16
		assume cs:seg160
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 2Dh, 0, 0, 83h, 0C4h, 6, 8Bh, 0C7h, 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40AAC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	large 80h
		push	0
		call	FileStream_Construct_40507
		add	sp, 6
		pop	bp
		retf
sub_40AAC		endp

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
StreamReader_RegistryAdd_40AC4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	word_4DC72, 8
		jge	short loc_40AE4
		mov	bx, word_4DC72
		shl	bx, 1
		mov	ax, [bp+arg_0]
		mov	[bx+6CAAh], ax
		inc	word_4DC72
		mov	ax, 1
		jmp	short loc_40AE6

loc_40AE4:
		xor	ax, ax

loc_40AE6:
		pop	bp
		retf
StreamReader_RegistryAdd_40AC4		endp

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
StreamReader_RegistryRemove_40AE8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	dx, dx
		jmp	short loc_40B18

loc_40AEF:
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+6CAAh]
		cmp	ax, [bp+arg_0]
		jnz	short loc_40B17
		dec	word_4DC72
		mov	bx, word_4DC72
		shl	bx, 1
		mov	ax, [bx+6CAAh]
		mov	bx, dx
		shl	bx, 1
		mov	[bx+6CAAh], ax
		mov	ax, 1
		jmp	short loc_40B20

loc_40B17:
		inc	dx

loc_40B18:
		cmp	dx, word_4DC72
		jl	short loc_40AEF
		xor	ax, ax

loc_40B20:
		pop	bp
		retf
StreamReader_RegistryRemove_40AE8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40B22		proc far

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
		jz	short loc_40B3C
		push	di
		call	CRT_Strlen
		pop	cx
		mov	dx, ax

loc_40B3C:
		cmp	dx, 3
		jle	short loc_40BB6
		push	5294h
		mov	ax, di
		add	ax, dx
		add	ax, 0FFFDh
		push	ax
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jz	short loc_40BB6
		mov	[bp+var_2], 0
		jmp	short loc_40BAD

loc_40B5F:
		mov	bx, [bp+var_2]
		shl	bx, 1
		mov	si, [bx+6CAAh]
		push	si
		call	StreamReader_ValidateState_412A1
		pop	cx
		or	al, al
		jz	short loc_40BAA
		push	di
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ParseFormattedString_40C5E
		add	sp, 4
		or	ax, ax
		jz	short loc_40BAA
		mov	eax, [si+127h]
		mov	[bp+var_6], eax
		add	eax, [si+12Bh]
		mov	[bp+var_A], eax
		push	di
		push	eax
		push	large [bp+var_6]
		push	si
		push	[bp+arg_0]
		call	sub_40FBE
		add	sp, 0Eh
		mov	al, 1
		jmp	short loc_40BB8

loc_40BAA:
		inc	[bp+var_2]

loc_40BAD:
		mov	ax, [bp+var_2]
		cmp	ax, word_4DC72
		jl	short loc_40B5F

loc_40BB6:
		mov	al, 0

loc_40BB8:
		pop	di
		pop	si
		leave
		retf
sub_40B22		endp

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
StreamReader_DispatchWrite_40BBC		proc far
		push	bp
		mov	bp, sp
		push	si
		push	di
		xor	si, si
		jmp	short loc_40BE9

loc_40BC5:
		mov	bx, si
		shl	bx, 1
		mov	di, [bx+6CAAh]
		or	di, di
		jz	short loc_40BDE
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short loc_40BDE

loc_40BDE:
		mov	bx, si
		shl	bx, 1
		mov	word ptr [bx+6CAAh], 0
		inc	si

loc_40BE9:
		cmp	si, word_4DC72
		jl	short loc_40BC5
		mov	word_4DC72, 0
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_DispatchWrite_40BBC		endp

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
StreamReader_ParseFormattedValueB_40BF9		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		xor	di, di
		xor	si, si
		jmp	short loc_40C26

loc_40C07:
		mov	bx, si
		shl	bx, 1
		mov	ax, [bx+6CAAh]
		mov	[bp+var_2], ax
		push	[bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr StreamReader_ParseFormattedString_40C5E
		add	sp, 4
		or	ax, ax
		jz	short loc_40C25
		inc	di
		jmp	short loc_40C2C

loc_40C25:
		inc	si

loc_40C26:
		cmp	si, word_4DC72
		jl	short loc_40C07

loc_40C2C:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
StreamReader_ParseFormattedValueB_40BF9		endp

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
StreamReader_PrepareParse_40C32		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0
		push	si
		call	StreamReader_SeekVariant_412E2
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 8
		push	ds
		mov	ax, si
		add	ax, 0DDh
		push	ax
		push	si
		call	StreamReader_ReadTyped_4148D
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
StreamReader_PrepareParse_40C32		endp

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
StreamReader_ParseFormattedString_40C5E		proc far

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
		call	StreamReader_ValidateState_412A1
		pop	cx
		or	al, al
		jnz	short loc_40C7C
		jmp	loc_40D3F

loc_40C7C:
		push	si
		push	cs
		call	near ptr StreamReader_PrepareParse_40C32
		pop	cx
		push	[bp+arg_2]
		call	CRT_Strupr_2E71
		pop	cx
		mov	di, [si+0DDh]
		mov	eax, [si+4Dh]
		mov	[bp+var_6], eax
		jmp	loc_40D21

loc_40C9A:
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		push	eax
		push	si
		call	StreamReader_SeekVariant_412E2
		add	sp, 6
		mov	ax, si
		add	ax, 0E5h
		mov	[bp+var_10], ax
		push	large 0FFFFFFFFh
		push	large 4Ah
		push	ds
		push	ax
		push	si
		call	StreamReader_ReadTyped_4148D
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 4Ah
		jz	short loc_40CDF
		mov	bx, [bp+var_10]
		mov	byte ptr [bx], 0
		mov	byte ptr [bx+1], 0

loc_40CDF:
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
		jnz	short loc_40D03
		mov	[bp+var_2], 1
		jmp	short loc_40D3F

loc_40D03:
		or	dx, dx
		jge	short loc_40D0E
		mov	ax, di
		inc	ax
		sar	ax, 1
		jmp	short loc_40D1F

loc_40D0E:
		mov	eax, [bp+var_A]
		add	eax, 4Ah
		mov	[bp+var_6], eax
		mov	ax, di
		sar	ax, 1
		inc	ax

loc_40D1F:
		sub	di, ax

loc_40D21:
		mov	ax, di
		sar	ax, 1
		movsx	eax, ax
		imul	eax, eax, 4Ah
		mov	edx, [bp+var_6]
		add	edx, eax
		mov	[bp+var_A], edx
		or	di, di
		jle	short loc_40D3F
		jmp	loc_40C9A

loc_40D3F:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
StreamReader_ParseFormattedString_40C5E		endp

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
StreamReader_CloseAndUnregister_40D46		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_ValidateState_412A1
		pop	cx
		or	al, al
		jz	short loc_40D65
		push	si
		call	sub_4123E
		pop	cx
		push	si
		push	cs
		call	near ptr StreamReader_RegistryRemove_40AE8
		pop	cx

loc_40D65:
		pop	si
		pop	bp
		retf
StreamReader_CloseAndUnregister_40D46		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_40D68		proc far

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
		call	StreamReader_ReadDispatch_411DE
		add	sp, 6
		mov	[bp+var_2], al
		push	si
		call	StreamReader_ValidateState_412A1
		pop	cx
		or	al, al
		jz	short loc_40D94
		push	si
		push	cs
sub_40D68		endp
seg160		ends
