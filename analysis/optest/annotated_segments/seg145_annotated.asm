seg145		segment	byte public 'CODE' use16
		assume cs:seg145
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_RegistryAdd_640B0 (sub_640B0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; ajoute un handle à une table globale de 8 flux ouverts (word_7107C = compteur). Référencée
; par sub_64321.
; ==============================================================================================
StreamReader_RegistryAdd_3B920	proc far		; CODE XREF: StreamReader_OpenAndRegister_3BB91+28p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	word_47972, 8
		jge	short loc_3B940
		mov	bx, word_47972

loc_3B92E:				; DATA XREF: seg170:055Eo
		shl	bx, 1
		mov	ax, [bp+arg_0]
		mov	[bx+66BAh], ax
		inc	word_47972
		mov	ax, 1
		jmp	short loc_3B942
; ���������������������������������������������������������������������������

loc_3B940:				; CODE XREF: StreamReader_RegistryAdd_3B920+8j
		xor	ax, ax

loc_3B942:				; CODE XREF: StreamReader_RegistryAdd_3B920+1Ej
		pop	bp
		retf
StreamReader_RegistryAdd_3B920	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_RegistryRemove_640D4 (sub_640D4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; retire un handle de la table globale des flux ouverts (recherche linéaire + compactage).
; Référencée par sub_642FF.
; ==============================================================================================
StreamReader_RegistryRemove_3B944	proc far		; CODE XREF: StreamReader_CloseAndUnregister_3BB6F+1Bp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	dx, dx
		jmp	short loc_3B974
; ���������������������������������������������������������������������������

loc_3B94B:				; CODE XREF: StreamReader_RegistryRemove_3B944+34j
		mov	bx, dx
		shl	bx, 1
		mov	ax, [bx+66BAh]
		cmp	ax, [bp+arg_0]
		jnz	short loc_3B973
		dec	word_47972
		mov	bx, word_47972
		shl	bx, 1
		mov	ax, [bx+66BAh]
		mov	bx, dx
		shl	bx, 1
		mov	[bx+66BAh], ax
		mov	ax, 1
		jmp	short loc_3B97C
; ���������������������������������������������������������������������������

loc_3B973:				; CODE XREF: StreamReader_RegistryRemove_3B944+12j
		inc	dx

loc_3B974:				; CODE XREF: StreamReader_RegistryRemove_3B944+5j
		cmp	dx, word_47972
		jl	short loc_3B94B
		xor	ax, ax

loc_3B97C:				; CODE XREF: StreamReader_RegistryRemove_3B944+2Dj
		pop	bp
		retf
StreamReader_RegistryRemove_3B944	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ParseFormattedValue_6410E (sub_6410E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 79 lignes, NON DÉTAILLÉE — combine StreamReader_ValidateState_63DB5, sub_64217 (parseur),
; sub_63B23 (construction de flux). Appelée par StreamReader_ReadBlock_63C61 (seg190) —
; probable lecture/analyse d'une valeur formatée depuis le flux.
; ==============================================================================================
StreamReader_ParseFormattedValue_3B97E	proc far		; CODE XREF: StreamReader_ReadBlock_3B4D1+1BP

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		xor	di, di
		jmp	short loc_3B9D9
; ���������������������������������������������������������������������������

loc_3B98A:				; CODE XREF: StreamReader_ParseFormattedValue_3B97E+5Fj
		mov	bx, di
		shl	bx, 1
		mov	si, [bx+66BAh]
		push	si
		call	StreamReader_ValidateState_3B625
		pop	cx
		or	al, al
		jz	short loc_3B9D8
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr StreamReader_ParseFormattedString_3BA87
		add	sp, 4
		or	ax, ax
		jz	short loc_3B9D8
		mov	eax, [si+127h]
		mov	[bp+var_4], eax
		add	eax, [si+12Bh]
		mov	[bp+var_8], eax
		push	[bp+arg_2]
		push	eax
		push	large [bp+var_4]
		push	si
		push	[bp+arg_0]
		call	StreamReader_ConstructAndBind_3B393
		add	sp, 0Eh
		mov	al, 1
		jmp	short loc_3B9E1
; ���������������������������������������������������������������������������

loc_3B9D8:				; CODE XREF: StreamReader_ParseFormattedValue_3B97E+1Dj
					; StreamReader_ParseFormattedValue_3B97E+2Dj
		inc	di

loc_3B9D9:				; CODE XREF: StreamReader_ParseFormattedValue_3B97E+Aj
		cmp	di, word_47972
		jl	short loc_3B98A
		mov	al, 0

loc_3B9E1:				; CODE XREF: StreamReader_ParseFormattedValue_3B97E+58j
		pop	di
		pop	si
		leave
		retf
StreamReader_ParseFormattedValue_3B97E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_DispatchWrite_64175 (sub_64175 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; dispatch vtable [bx+4] (écriture).
; ==============================================================================================
StreamReader_DispatchWrite_3B9E5	proc far		; CODE XREF: sub_5DC96+7BP
		push	bp
		mov	bp, sp
		push	si
		push	di
		xor	si, si
		jmp	short loc_3BA12
; ���������������������������������������������������������������������������

loc_3B9EE:				; CODE XREF: StreamReader_DispatchWrite_3B9E5+31j
		mov	bx, si
		shl	bx, 1
		mov	di, [bx+66BAh]
		or	di, di
		jz	short loc_3BA07
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short $+2

loc_3BA07:				; CODE XREF: StreamReader_DispatchWrite_3B9E5+13j
		mov	bx, si
		shl	bx, 1
		mov	word ptr [bx+66BAh], 0
		inc	si

loc_3BA12:				; CODE XREF: StreamReader_DispatchWrite_3B9E5+7j
		cmp	si, word_47972
		jl	short loc_3B9EE
		mov	word_47972, 0
		pop	di
		pop	si
		pop	bp
		retf
StreamReader_DispatchWrite_3B9E5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_ParseFormattedValueB_641B2 (sub_641B2 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle sub_64217 (parseur) — variante d'appel.
; ==============================================================================================
StreamReader_ParseFormattedValueB_3BA22	proc far		; CODE XREF: sub_6734+1DP

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		xor	di, di
		xor	si, si
		jmp	short loc_3BA4F
; ���������������������������������������������������������������������������

loc_3BA30:				; CODE XREF: StreamReader_ParseFormattedValueB_3BA22+31j
		mov	bx, si
		shl	bx, 1
		mov	ax, [bx+66BAh]
		mov	[bp+var_2], ax
		push	[bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr StreamReader_ParseFormattedString_3BA87
		add	sp, 4
		or	ax, ax
		jz	short loc_3BA4E
		inc	di
		jmp	short loc_3BA55
; ���������������������������������������������������������������������������

loc_3BA4E:				; CODE XREF: StreamReader_ParseFormattedValueB_3BA22+27j
		inc	si

loc_3BA4F:				; CODE XREF: StreamReader_ParseFormattedValueB_3BA22+Cj
		cmp	si, word_47972
		jl	short loc_3BA30

loc_3BA55:				; CODE XREF: StreamReader_ParseFormattedValueB_3BA22+2Aj
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
StreamReader_ParseFormattedValueB_3BA22	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_PrepareParse_641EB (sub_641EB de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine StreamReader_SeekVariant_63DF6 et
; StreamReader_ReadTyped_63FA1 (seg190) — prépare le flux avant analyse formatée. Appelée par
; sub_64217.
; ==============================================================================================
StreamReader_PrepareParse_3BA5B	proc far		; CODE XREF: StreamReader_ParseFormattedString_3BA87+20p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0
		push	si
		call	StreamReader_SeekVariant_3B666
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 8
		push	ds
		mov	ax, si
		add	ax, 0DDh ; '�'
		push	ax
		push	si
		call	StreamReader_ReadTyped_3B811
		add	sp, 0Eh
		pop	si
		pop	bp
		retf
StreamReader_PrepareParse_3BA5B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_ParseFormattedString_64217 (sub_64217 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 148 lignes, NON DÉTAILLÉE —
; la plus grosse fonction du segment : combine StreamReader_ValidateState_63DB5,
; StreamReader_PrepareParse_641EB, sub_2B99 (formatage externe) et
; StreamReader_SeekVariant_63DF6 — parseur de valeur/chaîne formatée à travers le flux
; tamponné (proche d'un sscanf typé). Candidat pour session dédiée si le format exact doit
; être élucidé.
; ==============================================================================================
StreamReader_ParseFormattedString_3BA87	proc far		; CODE XREF: StreamReader_ParseFormattedValue_3B97E+25p
					; StreamReader_ParseFormattedValueB_3BA22+1Fp

var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
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
		call	StreamReader_ValidateState_3B625
		pop	cx
		or	al, al
		jnz	short loc_3BAA5
		jmp	loc_3BB68
; ���������������������������������������������������������������������������

loc_3BAA5:				; CODE XREF: StreamReader_ParseFormattedString_3BA87+19j
		push	si
		push	cs
		call	near ptr StreamReader_PrepareParse_3BA5B
		pop	cx
		push	[bp+arg_2]
		call	CRT_Strupr
		pop	cx
		mov	di, [si+0DDh]
		mov	eax, [si+4Dh]
		mov	[bp+var_6], eax
		jmp	loc_3BB4A
; ���������������������������������������������������������������������������

loc_3BAC3:				; CODE XREF: StreamReader_ParseFormattedString_3BA87+DEj
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		push	eax
		push	si
		call	StreamReader_SeekVariant_3B666
		add	sp, 6
		mov	ax, si
		add	ax, 0E5h ; '�'
		mov	[bp+var_10], ax
		push	large 0FFFFFFFFh
		push	large 4Ah ; 'J'
		push	ds
		push	ax
		push	si
		call	StreamReader_ReadTyped_3B811
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_14], eax
		cmp	[bp+var_14], 4Ah ; 'J'
		jz	short loc_3BB08
		mov	bx, [bp+var_10]
		mov	byte ptr [bx], 0
		mov	byte ptr [bx+1], 0

loc_3BB08:				; CODE XREF: StreamReader_ParseFormattedString_3BA87+75j
		mov	ax, [bp+arg_2]
		mov	[bp+var_16], ax
		mov	ax, si
		add	ax, 0E6h ; '�'
		push	ax
		push	[bp+var_16]
		call	CRT_Stricmp
		add	sp, 4
		mov	dx, ax
		or	dx, dx
		jnz	short loc_3BB2C
		mov	[bp+var_2], 1
		jmp	short loc_3BB68
; ���������������������������������������������������������������������������

loc_3BB2C:				; CODE XREF: StreamReader_ParseFormattedString_3BA87+9Cj
		or	dx, dx
		jge	short loc_3BB37
		mov	ax, di
		inc	ax
		sar	ax, 1
		jmp	short loc_3BB48
; ���������������������������������������������������������������������������

loc_3BB37:				; CODE XREF: StreamReader_ParseFormattedString_3BA87+A7j
		mov	eax, [bp+var_A]
		add	eax, 4Ah ; 'J'
		mov	[bp+var_6], eax
		mov	ax, di
		sar	ax, 1
		inc	ax

loc_3BB48:				; CODE XREF: StreamReader_ParseFormattedString_3BA87+AEj
		sub	di, ax

loc_3BB4A:				; CODE XREF: StreamReader_ParseFormattedString_3BA87+39j
		mov	ax, di
		sar	ax, 1
		movsx	eax, ax
		imul	eax, 4Ah
		mov	edx, [bp+var_6]
		add	edx, eax
		mov	[bp+var_A], edx
		or	di, di
		jle	short loc_3BB68
		jmp	loc_3BAC3
; ���������������������������������������������������������������������������

loc_3BB68:				; CODE XREF: StreamReader_ParseFormattedString_3BA87+1Bj
					; StreamReader_ParseFormattedString_3BA87+A3j ...
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
StreamReader_ParseFormattedString_3BA87	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_CloseAndUnregister_642FF (sub_642FF de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, ferme le flux
; (StreamReader_ValidateState_63DB5, StreamReader_CloseHook_63D6E) puis le retire de la table
; globale (StreamReader_RegistryRemove_640D4).
; ==============================================================================================
StreamReader_CloseAndUnregister_3BB6F	proc far		; CODE XREF: sub_5E144+14P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_ValidateState_3B625
		pop	cx
		or	al, al
		jz	short loc_3BB8E
		push	si
		call	StreamReader_CloseHook_3B5DE
		pop	cx
		push	si
		push	cs
		call	near ptr StreamReader_RegistryRemove_3B944
		pop	cx

loc_3BB8E:				; CODE XREF: StreamReader_CloseAndUnregister_3BB6F+10j
		pop	si
		pop	bp
		retf
StreamReader_CloseAndUnregister_3BB6F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_OpenAndRegister_64321 (sub_64321 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, ouvre un flux
; (StreamReader_ReadDispatch_63D0E, StreamReader_ValidateState_63DB5) puis l'ajoute à la table
; globale (StreamReader_RegistryAdd_640B0).
; ==============================================================================================
StreamReader_OpenAndRegister_3BB91	proc far		; CODE XREF: sub_5D287+2AAP

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
		call	StreamReader_ReadDispatch_3B57E
		add	sp, 6
		mov	[bp+var_2], al
		push	si
		call	StreamReader_ValidateState_3B625
		pop	cx
		or	al, al
		jz	short loc_3BBBD
		push	si
		push	cs
		call	near ptr StreamReader_RegistryAdd_3B920
		pop	cx

loc_3BBBD:				; CODE XREF: StreamReader_OpenAndRegister_3BB91+24j
		mov	al, [bp+var_2]
		pop	si
		leave
		retf
StreamReader_OpenAndRegister_3BB91	endp

seg145		ends
