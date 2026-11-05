seg125		segment	para public 'CODE' use16
		assume cs:seg125
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Dh, 46h, 0A4h, 50h, 9Ah, 0A6h, 26h, 0, 0, 83h, 0C4h, 10h

loc_51C0C:
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Str_SeekNthEntryByte_50E60 (sub_50E60 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, avance un pointeur far dans une table de
; chaînes empaquetées (séparateur 0) pour atteindre la N-ième entrée (scasb). Référencée via
; vtable (DATA XREF seg216).
; ==============================================================================================
Str_SeekNthEntryByte_51C0E		proc far

var_4		= word ptr -4
var_2		= dword ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	di
		cld
		les	di, [bp+arg_0]
		xor	ax, ax
		mov	bx, [bp+arg_4]
		or	bx, bx
		jz	short loc_51C32

loc_51C22:
		mov	cx, 0FFFFh
		repne scasb
		dec	bx
		jnz	short loc_51C22
		or	cx, cx
		jnz	short loc_51C32
		mov	es, cx
		mov	di, cx

loc_51C32:
		mov	[bp+var_4], di
		mov	word ptr [bp+var_2], es
		mov	edx, [bp+var_2]
		mov	ax, [bp+var_4]
		pop	di
		leave
		retf
Str_SeekNthEntryByte_51C0E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ProgBuffer_FindSubProgramByIndex_50E94 (sub_50E94 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 43 lignes, LUE INTEGRALEMENT
; (session ordres de mission avec Remi — REFERME la question du decoupage du bloc PROG).
; DECOUVERTE : le bloc PROG brut (charge par ProgBuffer_LoadRawAndCountMarkers_AA31D) est une
; SEQUENCE DE MINI-PROGRAMMES CONSECUTIFS, chacun termine par un MOT NUL (0x0000, 2 octets —
; pas juste un octet). Cette fonction, donnee un index N, scanne le tampon (instruction x86
; 'repne scasw', qui cherche un mot egal a 0) et saute par-dessus N separateurs consecutifs ;
; retourne le pointeur juste apres le N-ieme separateur trouve = le debut du sous-programme
; #N.   CONCLUSION : les 4 progs_id d'une PartEntry
; (on_is_activated/on_mission_update/on_is_destroyed/on_missions_init) sont des INDEX DANS
; CETTE SEQUENCE ('le N-ieme mini-programme du bloc'), pas des offsets ni des identifiants
; nommes independants. Le compteur de marqueurs (ProgBuffer+0x00) = nombre total de mini-
; programmes empaquetes dans le bloc PROG d'une mission.
; ==============================================================================================
ProgBuffer_FindSubProgramByIndex_51C42		proc far

var_4		= word ptr -4
var_2		= dword ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	di
		cld
		les	di, [bp+arg_0]
		xor	ax, ax
		mov	bx, [bp+arg_4]
		or	bx, bx
		jz	short loc_51C66

loc_51C56:
		mov	cx, 7FFFh
		repne scasw
		dec	bx
		jnz	short loc_51C56
		or	cx, cx
		jnz	short loc_51C66
		mov	es, cx
		mov	di, cx

loc_51C66:
		mov	[bp+var_4], di
		mov	word ptr [bp+var_2], es
		mov	edx, [bp+var_2]
		mov	ax, [bp+var_4]
		pop	di
		leave
		retf
ProgBuffer_FindSubProgramByIndex_51C42		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Str_GetNthEntry_50EC8 (sub_50EC8 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, enveloppe
; bornée de Str_SeekNthEntryByte : retourne un pointeur nul si l'index dépasse le compteur en
; tête de structure.
; ==============================================================================================
Str_GetNthEntry_51C76		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	[si], dx
		jbe	short loc_51C92
		push	dx
		push	large [si+2]
		push	cs
		call	near ptr Str_SeekNthEntryByte_51C0E
		add	sp, 6
		jmp	short loc_51C96

loc_51C92:
		xor	dx, dx
		xor	ax, ax

loc_51C96:
		pop	si
		pop	bp
		retf
Str_GetNthEntry_51C76		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51C99		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 4
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_10], eax
		mov	eax, es:[si+4]
		mov	[bp+var_C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_8], eax
		les	bx, [bp+arg_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_51CF4
		les	bx, es:[bx]
		mov	eax, es:[bx+22h]
		add	[bp+var_10], eax
		mov	eax, es:[bx+26h]
		add	[bp+var_C], eax
		mov	eax, es:[bx+2Ah]
		add	[bp+var_8], eax

loc_51CF4:
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_51CFF
		mov	ax, si
		jmp	short loc_51D09

loc_51CFF:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_51D09:
		or	ax, ax
		jz	short loc_51D28
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	eax, [bp+var_C]
		mov	[si+4], eax
		mov	eax, [bp+var_8]
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_51D2A

loc_51D28:
		mov	ax, si

loc_51D2A:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_51C99		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Même lecture qu'Expr_VM_ReadNextToken_50F85 : instruction, argument,
; puis jusqu'à 3 arguments de plus précédés de l'octet 9.
; ==============================================================================================
Expr_VM_ReadNextToken_51D33		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	[di+6], ax
		mov	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	[di+8], ax
		mov	word ptr [di+0Ah], 0FFFFh
		mov	word ptr [di+0Ch], 0FFFFh
		mov	word ptr [di+0Eh], 0FFFFh
		mov	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 9
		jnz	short loc_51DCC
		inc	word ptr [di]
		mov	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	[di+0Ah], ax
		mov	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 9
		jnz	short loc_51DCC
		inc	word ptr [di]
		mov	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	[di+0Ch], ax
		mov	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 9
		jnz	short loc_51DCC
		inc	word ptr [di]
		mov	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	[di+0Eh], ax

loc_51DCC:
		mov	al, [di+6]
		pop	di
		pop	si
		pop	bp
		retf
Expr_VM_ReadNextToken_51D33		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Recherche d'étiquette des sauts (équivalent de la recherche de
; STRIKE.EXE) : depuis la position courante, lit des paires d'octets et s'arrête sur (8 =
; OP_SET_LABEL, n) ou sur un mot nul (fin du programme, test de [dx] et [dx+1]). Trouvée :
; position courante = après l'étiquette. Absente : erreur (push 901Fh / sub_1DDFE). Appelée
; par les sauts conditionnels (argument [di+8]) et par OP_BRANCH (registre de travail
; [di+10h]).
; ==============================================================================================
Expr_VM_SeekLabel_51DD3		proc far

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
		mov	dx, [si]
		xor	di, di
		jmp	short loc_51E12

loc_51DE4:
		les	bx, [si+2]
		mov	ax, dx
		inc	dx
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	bx, [si+2]
		mov	ax, dx
		inc	dx
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	[bp+var_4], ax
		cmp	[bp+var_2], 8
		jnz	short loc_51E12
		cmp	ax, [bp+arg_2]
		jnz	short loc_51E12
		mov	di, 1

loc_51E12:
		or	di, di
		jnz	short loc_51E2F
		les	bx, [si+2]
		add	bx, dx
		cmp	byte ptr es:[bx], 0
		jnz	short loc_51DE4
		mov	ax, dx
		add	ax, [si+2]
		mov	bx, ax
		cmp	byte ptr es:[bx+1], 0
		jnz	short loc_51DE4

loc_51E2F:
		or	di, di
		jz	short loc_51E37
		mov	[si], dx
		jmp	short loc_51E40

loc_51E37:
		push	901Fh
		call	sub_1DDFE
		pop	cx

loc_51E40:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
Expr_VM_SeekLabel_51DD3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_51E46		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	word ptr [di+1Ch], 10h
		jge	short loc_51EA7
		push	[bp+arg_2]
		mov	ax, word_79B8C
		add	ax, 40h
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_530A7
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_51EB0
		mov	ax, [di+4]
		mov	dx, [di+2]
		mov	bx, [di+1Ch]
		shl	bx, 2
		mov	[bx+di+20h], ax
		mov	[bx+di+1Eh], dx
		mov	bx, [di+1Ch]
		shl	bx, 1
		mov	ax, [di]
		mov	[bx+di+5Eh], ax
		inc	word ptr [di+1Ch]
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	[di+2], eax
		mov	word ptr [di], 0
		jmp	short loc_51EB0

loc_51EA7:
		push	9020h
		call	sub_1DDFE
		pop	cx

loc_51EB0:
		pop	di
		pop	si
		leave
		retf
sub_51E46		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Expr_VM_PopValue_51096 (sub_51096 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dépile la
; valeur courante de la pile de la VM d'expression.
; ==============================================================================================
Expr_VM_PopValue_51EB4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Ch], 0
		jz	short loc_51EE2
		dec	word ptr [si+1Ch]
		mov	bx, [si+1Ch]
		shl	bx, 1
		mov	ax, [bx+si+5Eh]
		mov	[si], ax
		mov	bx, [si+1Ch]
		shl	bx, 2
		mov	ax, [bx+si+20h]
		mov	dx, [bx+si+1Eh]
		mov	[si+4], ax
		mov	[si+2], dx
		jmp	short loc_51EE7

loc_51EE2:
		mov	word ptr [si+14h], 1

loc_51EE7:
		pop	si
		pop	bp
		retf
Expr_VM_PopValue_51EB4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Expr_VM_ReadVarOrOverride_510CC (sub_510CC de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; lit une valeur par défaut (+0x12) sauf si un indicateur (+8 != 0xFF) déclenche une
; résolution via Expr_LookupNamedValue_52DDB (table de substitution).
; ==============================================================================================
Expr_VM_ReadVarOrOverride_51EEA		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+16h]
		mov	[bp+var_4], eax
		cmp	word ptr [si+8], 0FFh
		jz	short loc_51F1B
		push	[bp+arg_2]
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_546A8
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_51F1B:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
Expr_VM_ReadVarOrOverride_51EEA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05 (instructions de drapeau). Interpréteur des scripts PROG des missions de
; Pacific Strike (place et instructions de Expr_VM_Interpreter_51106 de STRIKE.EXE ; table
; off_52F05, cmp bx, 0D0h). Les 22 instructions de drapeau (11h, 12h, 21h à 31h, 42h, 43h,
; 45h, 50h à 56h) lisent un numéro de 2 octets (octet d'argument + octet suivant × 256),
; vérifient que l'octet d'après vaut 5, et passent par GameVar_Get_56414 / GameVar_Set_564BB :
; même table que le déroulement et les conversations (analysis/pacific/README.md § 2.1).
; ==============================================================================================
Expr_VM_Interpreter_51F24		proc far

var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	ax, word_79B8C
		mov	[bp+var_2], ax
		jmp	loc_52EF1

loc_51F38:
		push	di
		push	cs
		call	near ptr Expr_VM_ReadNextToken_51D33
		pop	cx
		mov	bx, [di+6]
		cmp	bx, 0D0h
		jbe	short loc_51F4A
		jmp	loc_52EE8

loc_51F4A:
		shl	bx, 1
		jmp	cs:off_52F05[bx]	; switch jump

loc_51F51:
		push	word ptr [di+8]

loc_51F54:
		push	di
		push	cs
		call	near ptr sub_51E46
		jmp	loc_52D83

loc_51F5C:
		push	word ptr [di+10h]
		jmp	short loc_51F54

loc_51F61:
		push	di
		push	cs
		call	near ptr Expr_VM_PopValue_51EB4
		jmp	loc_52EF0

loc_51F69:
		mov	word ptr [di+14h], 1
		mov	word ptr [di+1Ch], 0
		jmp	loc_52EF1

loc_51F76:
		mov	al, [di+8]
		mov	byte_79B9B, al
		jmp	loc_52EF1

loc_51F7F:
		mov	ax, [di+8]

loc_51F82:
		jmp	loc_52CD3

loc_51F85:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	dx
		call	GameVar_Get_56414
		pop	cx
		mov	[di+10h], ax
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_51FBB
		jmp	loc_5275A

loc_51FBB:
		push	0B00Bh
		jmp	loc_52754
		jmp	loc_5275A

loc_51FC4:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	si, ax
		shl	si, 8
		add	si, word ptr [bp+var_8+2]
		push	si
		call	GameVar_Get_56414
		pop	cx
		mov	word ptr [bp+var_8], ax
		push	word ptr [di+10h]
		push	si
		call	GameVar_Set_564BB
		add	sp, 4
		mov	ax, word ptr [bp+var_8]
		mov	[di+10h], ax
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_5200C
		jmp	loc_5275A

loc_5200C:
		push	9040h
		jmp	loc_52754
		jmp	loc_5275A

loc_52015:
		mov	ax, [di+12h]
		jmp	loc_51F82

loc_5201B:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	word ptr [di+12h]
		push	dx
		call	GameVar_Set_564BB
		add	sp, 4
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_52053
		jmp	loc_5275A

loc_52053:
		push	9041h
		jmp	loc_52754
		jmp	loc_5275A

loc_5205C:
		cmp	word ptr [di+8], 8
		jge	short loc_52076
		mov	ax, [di+8]
		shl	ax, 1
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	ax, [di+10h]
		mov	[bx+0BAh], ax
		jmp	loc_52EF1

loc_52076:
		push	9021h
		jmp	loc_52EEB

loc_5207C:
		mov	ax, [di+8]
		inc	ax
		mov	[bp+var_4], ax
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_4]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		jmp	loc_51F82

loc_520A3:
		mov	ax, [di+8]
		add	[di+10h], ax
		jmp	loc_52EF1

loc_520AC:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	dx
		call	GameVar_Get_56414
		pop	cx
		add	[di+10h], ax
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_520E2
		jmp	loc_5275A

loc_520E2:
		push	9042h
		jmp	loc_52754
		jmp	loc_5275A

loc_520EB:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	si, ax
		shl	si, 8
		add	si, word ptr [bp+var_8+2]
		push	si
		call	GameVar_Get_56414
		pop	cx
		add	ax, [di+8]
		mov	word ptr [bp+var_8], ax
		push	ax
		push	si
		call	GameVar_Set_564BB
		add	sp, 4
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_5212E
		jmp	loc_5275A

loc_5212E:
		push	9043h
		jmp	loc_52754
		jmp	loc_5275A

loc_52137:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	si, ax
		shl	si, 8
		add	si, word ptr [bp+var_8+2]
		push	si
		call	GameVar_Get_56414
		pop	cx
		add	ax, [di+10h]
		mov	word ptr [bp+var_8], ax
		push	ax
		push	si
		call	GameVar_Set_564BB
		add	sp, 4
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_5217A
		jmp	loc_5275A

loc_5217A:
		push	9044h
		jmp	loc_52754
		jmp	loc_5275A

loc_52183:
		mov	ax, [di+8]
		sub	[di+10h], ax
		jmp	loc_52EF1

loc_5218C:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	dx
		call	GameVar_Get_56414
		pop	cx
		sub	[di+10h], ax
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_521C2
		jmp	loc_5275A

loc_521C2:
		push	9045h
		jmp	loc_52754
		jmp	loc_5275A

loc_521CB:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	si, ax
		shl	si, 8
		add	si, word ptr [bp+var_8+2]
		push	si
		call	GameVar_Get_56414
		pop	cx
		sub	ax, [di+8]
		mov	word ptr [bp+var_8], ax
		push	ax
		push	si
		call	GameVar_Set_564BB
		add	sp, 4
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_5220E
		jmp	loc_5275A

loc_5220E:
		push	9046h
		jmp	loc_52754
		jmp	loc_5275A

loc_52217:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	si, ax
		shl	si, 8
		add	si, word ptr [bp+var_8+2]
		push	si
		call	GameVar_Get_56414
		pop	cx
		sub	ax, [di+10h]
		mov	word ptr [bp+var_8], ax
		push	ax
		push	si
		call	GameVar_Set_564BB
		add	sp, 4
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_5225A
		jmp	loc_5275A

loc_5225A:
		push	9047h
		jmp	loc_52754
		jmp	loc_5275A

loc_52263:
		mov	ax, [di+8]
		or	[di+10h], ax
		jmp	loc_52EF1

loc_5226C:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	dx
		call	GameVar_Get_56414
		pop	cx
		or	[di+10h], ax
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_522A2
		jmp	loc_5275A

loc_522A2:
		push	9048h
		jmp	loc_52754
		jmp	loc_5275A

loc_522AB:
		mov	ax, [di+8]
		and	[di+10h], ax
		jmp	loc_52EF1

loc_522B4:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	dx
		call	GameVar_Get_56414
		pop	cx
		and	[di+10h], ax
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_522EA
		jmp	loc_5275A

loc_522EA:
		push	9049h
		jmp	loc_52754
		jmp	loc_5275A

loc_522F3:
		mov	ax, [di+8]
		xor	[di+10h], ax
		jmp	loc_52EF1

loc_522FC:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	dx
		call	GameVar_Get_56414
		pop	cx
		xor	[di+10h], ax
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_52332
		jmp	loc_5275A

loc_52332:
		push	904Ah
		jmp	loc_52754
		jmp	loc_5275A

loc_5233B:
		mov	ax, [di+10h]
		imul	word ptr [di+8]
		mov	[di+10h], ax
		jmp	loc_52EF1

loc_52347:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	dx
		call	GameVar_Get_56414
		pop	cx
		push	ax
		mov	ax, [di+10h]
		pop	dx
		imul	dx
		mov	[di+10h], ax
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_52384
		jmp	loc_5275A

loc_52384:
		push	904Bh
		jmp	loc_52754
		jmp	loc_5275A

loc_5238D:
		mov	ax, [di+10h]
		cwd
		idiv	word ptr [di+8]
		jmp	loc_51F82

loc_52397:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	dx
		call	GameVar_Get_56414
		pop	cx
		push	ax
		mov	ax, [di+10h]
		cwd
		pop	bx
		idiv	bx
		mov	[di+10h], ax
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_523D5
		jmp	loc_5275A

loc_523D5:
		push	904Ch
		jmp	loc_52754
		jmp	loc_5275A

loc_523DE:
		mov	dx, [di+10h]
		mov	bx, [di+8]
		cmp	dx, bx
		jle	short loc_523EB
		jmp	loc_524EE

loc_523EB:
		cmp	dx, bx
		jnz	short loc_523F2
		jmp	loc_524FA

loc_523F2:
		cmp	dx, bx
		jl	short loc_523F9
		jmp	loc_52D6C

loc_523F9:
		jmp	loc_52509
		jmp	loc_52D6C

loc_523FF:
		mov	dx, [di+8]
		mov	bx, [di+10h]
		cmp	dx, bx
		jle	short loc_5240C
		jmp	loc_524EE

loc_5240C:
		cmp	dx, bx
		jnz	short loc_52413
		jmp	loc_524FA

loc_52413:
		cmp	dx, bx
		jl	short loc_5241A
		jmp	loc_52D6C

loc_5241A:
		jmp	loc_52509
		jmp	loc_52D6C

loc_52420:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		mov	si, [di+10h]
		push	dx
		call	GameVar_Get_56414
		pop	cx
		mov	dx, ax
		cmp	si, dx
		jle	short loc_52453
		mov	word ptr [di+1Ah], 4
		jmp	short loc_52469

loc_52453:
		cmp	si, dx
		jnz	short loc_5245E
		mov	word ptr [di+1Ah], 2
		jmp	short loc_52469

loc_5245E:
		cmp	si, dx
		jge	short loc_52469
		mov	word ptr [di+1Ah], 1
		jmp	short loc_52469

loc_52469:
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_52479
		jmp	loc_5275A

loc_52479:
		push	904Dh
		jmp	loc_52754
		jmp	loc_5275A

loc_52482:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	dx
		call	GameVar_Get_56414
		pop	cx
		mov	dx, ax
		mov	bx, [di+10h]
		cmp	dx, bx
		jle	short loc_524B5
		mov	word ptr [di+1Ah], 4
		jmp	short loc_524CB

loc_524B5:
		cmp	dx, bx
		jnz	short loc_524C0
		mov	word ptr [di+1Ah], 2
		jmp	short loc_524CB

loc_524C0:
		cmp	dx, bx
		jge	short loc_524CB
		mov	word ptr [di+1Ah], 1
		jmp	short loc_524CB

loc_524CB:
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_524DB
		jmp	loc_5275A

loc_524DB:
		push	904Eh
		jmp	loc_52754
		jmp	loc_5275A

loc_524E4:
		mov	dx, [di+12h]
		mov	bx, [di+8]
		cmp	dx, bx
		jle	short loc_524F6

loc_524EE:
		mov	word ptr [di+1Ah], 4
		jmp	loc_52EF1

loc_524F6:
		cmp	dx, bx
		jnz	short loc_52502

loc_524FA:
		mov	word ptr [di+1Ah], 2
		jmp	loc_52EF1

loc_52502:
		cmp	dx, bx
		jl	short loc_52509
		jmp	loc_52D6C

loc_52509:
		mov	word ptr [di+1Ah], 1
		jmp	loc_52EF1
		jmp	loc_52D6C

loc_52514:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	dx
		call	GameVar_Get_56414
		pop	cx
		mov	word ptr [bp+var_8], ax
		cmp	word ptr [bp+var_8], 0
		jz	short loc_52546
		or	word ptr [di+1Ah], 2
		jmp	short loc_5254A

loc_52546:
		and	word ptr [di+1Ah], 0FFFDh

loc_5254A:
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_5255A
		jmp	loc_5275A

loc_5255A:
		push	904Fh
		jmp	loc_52754
		jmp	loc_5275A

loc_52563:
		cmp	word ptr [di+12h], 0
		jnz	short loc_5256C
		jmp	loc_52EF1

loc_5256C:
		push	word ptr [di+8]
		jmp	short loc_525C9

loc_52571:
		cmp	word ptr [di+12h], 0
		jz	short loc_5257A
		jmp	loc_52EF1

loc_5257A:
		jmp	short loc_5256C

loc_5257C:
		test	word ptr [di+1Ah], 2
		jnz	short loc_52586
		jmp	loc_52EF1

loc_52586:
		jmp	short loc_5256C

loc_52588:
		test	word ptr [di+1Ah], 2
		jz	short loc_52592
		jmp	loc_52EF1

loc_52592:
		jmp	short loc_5256C

loc_52594:
		test	word ptr [di+1Ah], 1
		jnz	short loc_5259E
		jmp	loc_52EF1

loc_5259E:
		jmp	short loc_5256C

loc_525A0:
		test	word ptr [di+1Ah], 4
		jnz	short loc_525AA
		jmp	loc_52EF1

loc_525AA:
		jmp	short loc_5256C

loc_525AC:
		test	word ptr [di+1Ah], 3
		jnz	short loc_525B6
		jmp	loc_52EF1

loc_525B6:
		jmp	short loc_5256C

loc_525B8:
		test	word ptr [di+1Ah], 6
		jnz	short loc_525C2
		jmp	loc_52EF1

loc_525C2:
		jmp	short loc_5256C

loc_525C4:
		jmp	short loc_5256C

loc_525C6:
		push	word ptr [di+10h]

loc_525C9:
		push	di
		push	cs
		call	near ptr Expr_VM_SeekLabel_51DD3
		jmp	loc_52D83

loc_525D1:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	word ptr [di+10h]
		push	dx
		call	GameVar_Set_564BB
		add	sp, 4
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_52609
		jmp	loc_5275A

loc_52609:
		push	9050h
		jmp	loc_52754
		jmp	loc_5275A

loc_52612:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	1
		push	dx
		call	GameVar_Set_564BB
		add	sp, 4
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_52649
		jmp	loc_5275A

loc_52649:
		push	9051h
		jmp	loc_52754
		jmp	loc_5275A

loc_52652:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	0
		push	dx
		call	GameVar_Set_564BB
		add	sp, 4
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_52689
		jmp	loc_5275A

loc_52689:
		push	9052h
		jmp	loc_52754
		jmp	loc_5275A

loc_52692:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, ax
		shl	dx, 8
		add	dx, word ptr [bp+var_8+2]
		push	dx
		call	sub_56570
		pop	cx
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jnz	short loc_526C5
		jmp	loc_5275A

loc_526C5:
		push	9053h
		jmp	loc_52754
		jmp	loc_5275A

loc_526CE:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	si, ax
		shl	si, 8
		add	si, word ptr [bp+var_8+2]
		push	si
		call	GameVar_Get_56414
		pop	cx
		mov	word ptr [bp+var_8], ax
		inc	ax
		push	ax
		push	si
		call	GameVar_Set_564BB
		add	sp, 4
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jz	short loc_5275A
		push	9054h
		jmp	short loc_52754
		jmp	short loc_5275A

loc_52713:
		mov	ax, [di+8]
		mov	word ptr [bp+var_8+2], ax
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	si, ax
		shl	si, 8
		add	si, word ptr [bp+var_8+2]
		push	si
		call	GameVar_Get_56414
		pop	cx
		mov	word ptr [bp+var_8], ax
		dec	ax
		push	ax
		push	si
		call	GameVar_Set_564BB
		add	sp, 4
		les	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 5
		jz	short loc_5275A
		push	9055h

loc_52754:
		call	sub_1DDFE
		pop	cx

loc_5275A:
		inc	word ptr [di]
		jmp	loc_52EF1

loc_5275F:
		mov	ax, [di+1Ah]
		and	ax, 2
		sub	[di+1Ah], ax
		push	word ptr [di+8]
		mov	ax, [bp+var_2]
		add	ax, 1Ah
		push	ax
		nop
		push	cs
		call	near ptr PtrList_GetAt_54919
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		push	dx
		push	ax
		mov	ax, [bp+var_2]
		add	ax, 3Ah
		push	ax
		nop
		push	cs
		call	near ptr Scene_FindByArea_54B92
		add	sp, 6
		mov	si, ax
		cmp	byte ptr [si], 0
		jnz	short loc_5279B
		jmp	loc_52EF1

loc_5279B:
		jmp	loc_52B14

loc_5279E:
		push	word ptr [di+8]
		mov	ax, [bp+var_2]
		add	ax, 1Ah
		push	ax
		nop
		push	cs
		call	near ptr PtrList_GetAt_54919
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		push	dx
		push	ax
		mov	ax, [bp+var_2]
		add	ax, 3Ah
		push	ax
		nop
		push	cs
		call	near ptr Scene_FindByArea_54B92
		add	sp, 6
		mov	si, ax
		or	si, si
		jnz	short loc_527D0
		jmp	loc_52EF1

loc_527D0:
		mov	byte ptr [si], 1
		jmp	loc_52EF1

loc_527D6:
		push	word ptr [di+8]
		mov	ax, [bp+var_2]
		add	ax, 1Ah
		push	ax
		nop
		push	cs
		call	near ptr PtrList_GetAt_54919
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		push	dx
		push	ax
		mov	ax, [bp+var_2]
		add	ax, 3Ah
		push	ax
		nop
		push	cs
		call	near ptr Scene_FindByArea_54B92
		add	sp, 6
		mov	si, ax
		or	si, si
		jnz	short loc_52808
		jmp	loc_52EF1

loc_52808:
		mov	byte ptr [si], 0
		jmp	loc_52EF1

loc_5280E:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_52829
		jmp	loc_52EF1

loc_52829:
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr PartEntry_ResolveSpawnPositionAndActivate_5313D
		jmp	loc_52D83

loc_52833:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_5284E
		jmp	loc_52EF1

loc_5284E:
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr PartEntry_Deactivate_536C9
		jmp	loc_52D83

loc_52858:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_52873
		jmp	loc_52EF1

loc_52873:
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_DetachChildAndRecompute_537B7
		jmp	loc_52D83

loc_5287D:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_52898
		jmp	loc_52EF1

loc_52898:
		push	word ptr [di+0Ch]
		push	word ptr [di+0Ah]
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr MissionScript_SpawnEffectOnObj_537DF
		add	sp, 8
		jmp	loc_52EF1

loc_528AB:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_528C6
		jmp	loc_52EF1

loc_528C6:
		push	word ptr [di+0Eh]
		push	word ptr [di+0Ch]
		push	word ptr [di+0Ah]
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr MissionScript_FireAtSpot_539B4
		add	sp, 0Ah
		jmp	loc_52EF1

loc_528DC:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_528F7
		jmp	loc_52EF1

loc_528F7:
		les	bx, word ptr [bp+var_8]
		mov	ax, es:[bx+56h]
		mov	word ptr [bp+var_C+2], ax
		push	1
		push	1
		push	ax
		mov	bx, word ptr [bp+var_C+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		add	ax, 90h
		mov	word ptr [bp+var_C], dx
		mov	word ptr [bp+var_10+2], ax
		push	dx
		push	ax
		push	65D0h
		call	Debris_LoadAndInstantiateAlt
		add	sp, 0Ah
		mov	si, ax
		push	word ptr [di+0Ah]
		mov	ax, [bp+var_2]
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		mov	eax, [bp+var_1C]
		mov	[si+12h], eax
		mov	eax, [bp+var_18]
		mov	[si+16h], eax
		mov	eax, [bp+var_14]
		mov	[si+1Ah], eax
		push	si
		push	word ptr [bp+var_C+2]
		call	sub_7413F
		add	sp, 4
		mov	bx, word ptr [bp+var_C+2]
		mov	[bx+78h], si
		jmp	loc_52EF1

loc_5296A:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_52985
		jmp	loc_52EF1

loc_52985:
		les	bx, word ptr [bp+var_8]
		mov	si, es:[bx+56h]
		cmp	word ptr [si+78h], 0
		jnz	short loc_52995
		jmp	loc_52EF1

loc_52995:
		push	word ptr [si+78h]
		push	si
		call	sub_74144
		add	sp, 4
		mov	word ptr [si+78h], 0
		jmp	loc_52EF1

loc_529A9:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		push	word ptr [di+0Ah]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_8], 0
		jnz	short loc_529D5
		jmp	loc_52EF1

loc_529D5:
		cmp	[bp+var_C], 0
		jnz	short loc_529DF
		jmp	loc_52EF1

loc_529DF:
		push	large [bp+var_8]
		nop
		push	cs
		call	near ptr PartEntry_ResolveSpawnPositionAndActivate_5313D
		add	sp, 4
		push	word ptr [di+0Ch]
		mov	ax, [bp+var_2]
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		les	bx, word ptr [bp+var_C]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	sub_5A629
		add	sp, 4
		les	bx, word ptr [bp+var_C]
		mov	si, es:[bx+56h]
		add	si, 12h
		mov	eax, [si]
		add	[bp+var_1C], eax
		mov	eax, [si+4]
		add	[bp+var_18], eax
		mov	eax, [si+8]
		add	[bp+var_14], eax
		les	bx, word ptr [bp+var_8]
		mov	bx, es:[bx+56h]
		mov	eax, [bp+var_1C]
		mov	[bx+12h], eax
		mov	bx, word ptr [bp+var_8]
		mov	bx, es:[bx+56h]
		mov	eax, [bp+var_18]
		mov	[bx+16h], eax
		mov	bx, word ptr [bp+var_8]
		mov	bx, es:[bx+56h]
		mov	eax, [bp+var_14]
		mov	[bx+1Ah], eax
		les	bx, word ptr [bp+var_C]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		les	bx, word ptr [bp+var_8]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		jmp	loc_52D83

loc_52A93:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		mov	word ptr [bp+var_C+2], ax
		cmp	word ptr [bp+var_C+2], 0
		jz	short loc_52B1B
		jmp	short loc_52B14
		jmp	short loc_52B1B

loc_52ABE:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		mov	word ptr [bp+var_C+2], ax
		cmp	word ptr [bp+var_C+2], 0
		jz	short loc_52B1B
		jmp	short loc_52B14
		jmp	short loc_52B1B

loc_52AE9:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, word ptr [bp+var_8]
		cmp	word ptr es:[bx+56h], 0
		jz	short loc_52B09
		mov	ax, 1
		jmp	short loc_52B0B

loc_52B09:
		xor	ax, ax

loc_52B0B:
		mov	word ptr [bp+var_C+2], ax
		cmp	word ptr [bp+var_C+2], 0
		jz	short loc_52B1B

loc_52B14:
		or	word ptr [di+1Ah], 2
		jmp	loc_52EF1

loc_52B1B:
		and	word ptr [di+1Ah], 0FFFDh
		jmp	loc_52EF1

loc_52B22:
		mov	word ptr [di+10h], 0
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_52B42
		jmp	loc_52EF1

loc_52B42:
		cmp	dword ptr [di+16h], 0
		jnz	short loc_52B4C
		jmp	loc_52EF1

loc_52B4C:
		push	dx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		nop
		push	cs
		call	near ptr sub_544F5
		add	sp, 8
		push	large [di+16h]
		push	ss
		lea	ax, word ptr [bp+var_28]
		push	ax
		nop
		push	cs
		call	near ptr sub_544F5
		add	sp, 8
		mov	eax, [bp+var_28]
		sub	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		sub	[bp+var_18], eax
		mov	eax, [bp+var_20]
		sub	[bp+var_14], eax
		push	large [bp+var_14]
		push	large [bp+var_18]
		push	large [bp+var_1C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax
		mov	ebx, 3E8h
		cdq
		idiv	ebx
		mov	[bp+var_C], eax
		sar	eax, 8
		mov	dx, 0FFh
		mov	[di+10h], dx
		movsx	edx, dx
		cmp	eax, edx
		jl	short loc_52BC9
		jmp	loc_52EF1

loc_52BC9:
		mov	ax, word ptr [bp+var_C+1]
		jmp	loc_52CD3

loc_52BCF:
		mov	word ptr [di+10h], 0
		cmp	dword ptr [di+16h], 0
		jnz	short loc_52BDE
		jmp	loc_52EF1

loc_52BDE:
		push	word ptr [di+8]
		mov	ax, [bp+var_2]
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		push	large [di+16h]
		push	ss
		lea	ax, word ptr [bp+var_28]
		push	ax
		nop
		push	cs
		call	near ptr sub_544F5
		add	sp, 8
		mov	eax, [bp+var_1C]
		sub	[bp+var_28], eax
		mov	eax, [bp+var_18]
		sub	[bp+var_24], eax
		mov	eax, [bp+var_14]
		sub	[bp+var_20], eax
		push	large [bp+var_20]
		push	large [bp+var_24]
		push	large [bp+var_28]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_8], eax
		mov	ebx, 3E8h
		cdq
		idiv	ebx
		mov	[bp+var_8], eax
		sar	eax, 8
		mov	dx, 0FFh
		mov	[di+10h], dx
		movsx	edx, dx
		cmp	eax, edx
		jl	short loc_52C63
		jmp	loc_52EF1

loc_52C63:
		mov	ax, word ptr [bp+var_8+1]
		jmp	short loc_52CD3

loc_52C68:
		mov	word ptr [di+10h], 0
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_52C88
		jmp	loc_52EF1

loc_52C88:
		push	dx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		nop
		push	cs
		call	near ptr sub_544F5
		add	sp, 8
		mov	[bp+var_C], 8CA00h
		mov	eax, [bp+var_C]
		sub	[bp+var_14], eax
		mov	ebx, 64h
		mov	eax, [bp+var_14]
		cdq
		idiv	ebx
		mov	[bp+var_14], eax
		sar	eax, 8
		mov	dx, 0FFh
		mov	[di+10h], dx
		movsx	edx, dx
		cmp	eax, edx
		jl	short loc_52CD0
		jmp	loc_52EF1

loc_52CD0:
		mov	ax, word ptr [bp+var_14+1]

loc_52CD3:
		mov	[di+10h], ax
		jmp	loc_52EF1

loc_52CD9:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_52CF4
		jmp	loc_52EF1

loc_52CF4:
		les	bx, word ptr [bp+var_8]
		or	byte ptr es:[bx+39h], 10h
		jmp	short loc_52D46

loc_52CFE:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_52D19
		jmp	loc_52EF1

loc_52D19:
		les	bx, word ptr [bp+var_8]
		and	byte ptr es:[bx+39h], 0EFh
		jmp	short loc_52D6C

loc_52D23:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_52D3E
		jmp	loc_52EF1

loc_52D3E:
		les	bx, word ptr [bp+var_8]
		or	byte ptr es:[bx+39h], 20h

loc_52D46:
		jmp	loc_52EF1

loc_52D49:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_52D64
		jmp	loc_52EF1

loc_52D64:
		les	bx, word ptr [bp+var_8]
		and	byte ptr es:[bx+39h], 0DFh

loc_52D6C:
		jmp	loc_52EF1

loc_52D6F:
		mov	al, [di+8]
		mov	byte_76E25, al
		jmp	loc_52EF1

loc_52D78:
		push	word ptr [di+8]
		push	[bp+var_2]
		nop
		push	cs
		call	near ptr Expr_VM_OpcodeHelperA_54DF4

loc_52D83:
		add	sp, 4
		jmp	loc_52EF1

loc_52D89:
		cmp	dword ptr [di+16h], 0
		jnz	short loc_52D93
		jmp	loc_52EE1

loc_52D93:
		jmp	loc_52E5B
		jmp	loc_52EE1

loc_52D99:
		cmp	dword ptr [di+16h], 0
		jnz	short loc_52DA3
		jmp	loc_52EE1

loc_52DA3:
		jmp	loc_52E5B
		jmp	loc_52EE1

loc_52DA9:
		cmp	dword ptr [di+16h], 0
		jnz	short loc_52DB3
		jmp	loc_52EE1

loc_52DB3:
		jmp	loc_52E5B
		jmp	loc_52EE1

loc_52DB9:
		cmp	dword ptr [di+16h], 0
		jnz	short loc_52DC3
		jmp	loc_52EE1

loc_52DC3:
		jmp	loc_52E5B
		jmp	loc_52EE1

loc_52DC9:
		cmp	dword ptr [di+16h], 0
		jnz	short loc_52DD3
		jmp	loc_52EE1

loc_52DD3:
		jmp	loc_52E5B
		jmp	loc_52EE1

loc_52DD9:
		cmp	dword ptr [di+16h], 0
		jnz	short loc_52DE3
		jmp	loc_52EE1

loc_52DE3:
		jmp	short loc_52E5B
		jmp	loc_52EE1

loc_52DE8:
		cmp	dword ptr [di+16h], 0
		jnz	short loc_52DF2
		jmp	loc_52EE1

loc_52DF2:
		les	bx, [di+16h]
		mov	al, [di+8]
		mov	es:[bx+32h], al
		jmp	short loc_52E5B
		jmp	loc_52EE1

loc_52E01:
		cmp	dword ptr [di+16h], 0
		jnz	short loc_52E0B
		jmp	loc_52EE1

loc_52E0B:
		jmp	short loc_52E5B
		jmp	loc_52EE1

loc_52E10:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_51EEA
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_52E2B
		jmp	loc_52EE1

loc_52E2B:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		mov	ah, 0
		or	ax, ax
		jz	short loc_52E41
		jmp	loc_52EE1

loc_52E41:
		push	word ptr [di+0Ah]
		push	word ptr [di+8]
		push	word ptr [di+6]
		push	dx
		push	bx
		jmp	short loc_52E68
		jmp	loc_52EE1

loc_52E51:
		cmp	dword ptr [di+16h], 0
		jnz	short loc_52E5B
		jmp	loc_52EE1

loc_52E5B:
		push	word ptr [di+0Ah]
		push	word ptr [di+8]
		push	word ptr [di+6]
		push	large [di+16h]

loc_52E68:
		nop
		push	cs
		call	near ptr MissionScript_CallNativeHandler_53B0B
		add	sp, 0Ah
		mov	[di+12h], ax
		jmp	short loc_52EF1
		jmp	short loc_52EE1

loc_52E77:
		mov	word ptr [di+12h], 1
		cmp	byte_79BA0, 0
		jnz	short loc_52E90
		inc	byte_79BA0
		mov	dword_79B9C, 0

loc_52E90:
		mov	word ptr [bp+var_8+2], ds
		mov	word ptr [bp+var_8], 346Ch
		cmp	dword ptr [di+16h], 0
		jz	short loc_52EAE
		mov	ax, [di+18h]
		mov	dx, [di+16h]
		add	dx, 3Ah
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx

loc_52EAE:
		les	bx, word ptr [bp+var_8]
		cmp	dword ptr es:[bx], 0
		jnz	short loc_52EC7
		movsx	eax, word ptr [di+8]
		shl	eax, 8
		mov	es:[bx], eax
		jmp	short loc_52EF1

loc_52EC7:
		les	bx, word ptr [bp+var_8]
		mov	eax, dword_7976E
		sub	es:[bx], eax
		cmp	dword ptr es:[bx], 0
		jg	short loc_52EF1
		mov	dword ptr es:[bx], 0

loc_52EE1:
		mov	word ptr [di+12h], 0
		jmp	short loc_52EF1

loc_52EE8:
		push	911Bh

loc_52EEB:
		call	sub_1DDFE

loc_52EF0:
		pop	cx

loc_52EF1:
		cmp	dword ptr [di+2], 0
		jz	short loc_52F01
		cmp	word ptr [di+14h], 0
		jnz	short loc_52F01
		jmp	loc_51F38

loc_52F01:
		pop	di
		pop	si
		leave
		retf
Expr_VM_Interpreter_51F24		endp

; START OF FUNCTION CHUNK FOR Expr_VM_Interpreter_51F24
off_52F05	dw offset loc_51F61
		dw offset loc_51F61
		dw offset loc_51F51
		dw offset loc_51F5C
		dw offset loc_51F69
		dw offset loc_52EF1
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EF1
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_51F76
		dw offset loc_51F7F
		dw offset loc_51F85
		dw offset loc_51FC4
		dw offset loc_52015
		dw offset loc_5205C
		dw offset loc_5207C
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_520A3
		dw offset loc_520AC
		dw offset loc_520EB
		dw offset loc_52137
		dw offset loc_52183
		dw offset loc_5218C
		dw offset loc_521CB
		dw offset loc_52217
		dw offset loc_52263
		dw offset loc_5226C
		dw offset loc_522AB
		dw offset loc_522B4
		dw offset loc_522F3
		dw offset loc_522FC
		dw offset loc_5233B
		dw offset loc_52347
		dw offset loc_5238D
		dw offset loc_52397
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_523DE
		dw offset loc_523FF
		dw offset loc_52420
		dw offset loc_52482
		dw offset loc_524E4
		dw offset loc_52514
		dw offset loc_52563
		dw offset loc_52571
		dw offset loc_5257C
		dw offset loc_52588
		dw offset loc_52594
		dw offset loc_525A0
		dw offset loc_525AC
		dw offset loc_525B8
		dw offset loc_525C4
		dw offset loc_525C6
		dw offset loc_525D1
		dw offset loc_5201B
		dw offset loc_52612
		dw offset loc_52652
		dw offset loc_52692
		dw offset loc_526CE
		dw offset loc_52713
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52E51
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_5279E
		dw offset loc_527D6
		dw offset loc_5275F
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_5280E
		dw offset loc_52833
		dw offset loc_52A93
		dw offset loc_52ABE
		dw offset loc_52858
		dw offset loc_52B22
		dw offset loc_52C68
		dw offset loc_52BCF
		dw offset loc_52AE9
		dw offset loc_5287D
		dw offset loc_528AB
		dw offset loc_528DC
		dw offset loc_5296A
		dw offset loc_529A9
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52E77
		dw offset loc_52D89
		dw offset loc_52D99
		dw offset loc_52DB9
		dw offset loc_52DB9
		dw offset loc_52DB9
		dw offset loc_52EE8
		dw offset loc_52DD9
		dw offset loc_52E51
		dw offset loc_52E51
		dw offset loc_52DC9
		dw offset loc_52E51
		dw offset loc_52E51
		dw offset loc_52DD9
		dw offset loc_52DD9
		dw offset loc_52DD9
		dw offset loc_52EE8
		dw offset loc_52E51
		dw offset loc_52E51
		dw offset loc_52DE8
		dw offset loc_52E51
		dw offset loc_52E01
		dw offset loc_52CD9
		dw offset loc_52CFE
		dw offset loc_52D23
		dw offset loc_52D49
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52E10
		dw offset loc_52E51
		dw offset loc_52D78
		dw offset loc_52DA9
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52EE8
		dw offset loc_52D6F
; END OF FUNCTION CHUNK FOR Expr_VM_Interpreter_51F24

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Expr_LookupNamedValue_51E4A (sub_51E4A de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 30 lignes, LUE
; INTEGRALEMENT (session ordres de mission avec Remi). Simple garde de bornes : si rawId <
; buf->markerCount (le compteur pose par ProgBuffer_LoadRawAndCountMarkers_AA31D), delegue a
; ProgBuffer_FindSubProgramByIndex_50E94 pour trouver le pointeur reel ; sinon retourne NULL.
; Utilisee pour resoudre les 4 progs_id d'une PartEntry (PartEntry_LoadAndResolveNames_A9E3C)
; et par le mecanisme d'appel de sous-routine du script (sub_51033).
; ==============================================================================================
Expr_LookupNamedValue_530A7		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	[bp+var_4], 0
		cmp	[si], dx
		jbe	short loc_530D2
		push	dx
		push	large [si+2]
		push	cs
		call	near ptr ProgBuffer_FindSubProgramByIndex_51C42
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_530D2:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
Expr_LookupNamedValue_530A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Équivalent d'Expr_VM_ExecuteSingleInstruction_51E7E : si le programme
; n'est pas nul, prépare l'état d'exécution (programme, objet) sur la pile et appelle
; Expr_VM_Interpreter_51F24.
; ==============================================================================================
Expr_VM_ExecuteSingleInstruction_530DB		proc far

var_82		= word ptr -82h
var_80		= dword ptr -80h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_6C		= dword ptr -6Ch
var_68		= word ptr -68h
var_66		= word ptr -66h
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 82h
		mov	ax, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jz	short loc_5313B
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	[bp+var_6E], 0
		mov	[bp+var_80], 0
		xor	ax, ax
		mov	[bp+var_66], ax
		mov	[bp+var_68], ax
		mov	[bp+var_70], ax
		mov	[bp+var_72], ax
		mov	[bp+var_82], ax
		mov	[bp+var_6C], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_80], eax
		mov	[bp+var_82], 0
		mov	eax, [bp+arg_6]
		mov	[bp+var_6C], eax
		lea	ax, [bp+var_82]
		push	ax
		push	cs
		call	near ptr Expr_VM_Interpreter_51F24
		pop	cx

loc_5313B:
		leave
		retf
Expr_VM_ExecuteSingleInstruction_530DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. (structure) Équivalent de
; PartEntry_ResolveSpawnPositionAndActivate_51EDC : crée l'objet du monde (+86) seulement si
; le drapeau 260 n'est pas posé (push 104h / GameVar_Get_56414 / jnz).
; ==============================================================================================
PartEntry_ResolveSpawnPositionAndActivate_5313D		proc far

var_10C		= dword ptr -10Ch
var_108		= dword ptr -108h
var_104		= dword ptr -104h
var_100		= dword ptr -100h
var_FC		= dword ptr -0FCh
var_F8		= dword ptr -0F8h
var_F4		= dword ptr -0F4h
var_F0		= dword ptr -0F0h
var_EC		= dword ptr -0ECh
var_E8		= dword ptr -0E8h
var_E4		= dword ptr -0E4h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
var_D4		= dword ptr -0D4h
var_D0		= dword ptr -0D0h
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= word ptr -0C4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= byte ptr -1Ah
var_19		= byte ptr -19h
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10Ch
		push	si
		mov	[bp+var_4], 0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_531A3
		cmp	word ptr es:[bx+56h], 0
		jnz	short loc_531A3
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_5319B
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 9
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		xor	eax, eax
		mov	es:[bx+52h], eax
		mov	es:[bx+4Eh], eax
		mov	es:[bx+4Ah], eax
		mov	es:[bx+46h], eax
		jmp	short loc_531A3

loc_5319B:
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax

loc_531A3:
		cmp	[bp+var_4], 0
		jnz	short loc_531AD
		jmp	loc_536C6

loc_531AD:
		les	bx, word ptr [bp+var_4]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_531B9
		jmp	loc_536C6

loc_531B9:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+1Ch], 0
		jnz	short loc_531C6
		jmp	loc_53451

loc_531C6:
		lea	ax, word ptr [bp+var_E8]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		nop
		push	cs
		call	near ptr sub_55DBA
		mov	si, ax
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_E8]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1E]
		push	ax
		call	sub_5720C
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+2Dh]
		mov	[bp+var_20], ax
		movsx	eax, [bp+var_20]
		shl	eax, 8
		mov	edx, [bp+var_1E]
		add	edx, eax
		mov	[bp+var_24], edx
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	[bp+var_8], eax
		nop
		push	cs
		call	near ptr sub_55DBA
		add	ax, 12h
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_94], eax
		mov	eax, [si+4]
		mov	[bp+var_90], eax
		mov	eax, [si+8]
		mov	[bp+var_8C], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 21h
		mov	word ptr [bp+var_2A], ax
		mov	[bp+var_2C], dx
		les	bx, [bp+var_2C]
		mov	eax, es:[bx]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_E8]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_E4]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_E0]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_F4], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_EC], eax
		mov	eax, [bp+var_F4]
		add	[bp+var_94], eax
		mov	eax, [bp+var_F0]
		add	[bp+var_90], eax
		mov	eax, [bp+var_EC]
		add	[bp+var_8C], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 25h
		mov	[bp+var_4A], ax
		mov	[bp+var_4C], dx
		les	bx, [bp+var_4C]
		mov	eax, es:[bx]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_DC]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_D8]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_D4]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_64], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_100], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_FC], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_F8], eax
		mov	eax, [bp+var_100]
		add	[bp+var_94], eax
		mov	eax, [bp+var_FC]
		add	[bp+var_90], eax
		mov	eax, [bp+var_F8]
		add	[bp+var_8C], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 29h
		mov	[bp+var_6A], ax
		mov	[bp+var_6C], dx
		les	bx, [bp+var_6C]
		mov	eax, es:[bx]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_D0]
		mov	edx, [bp+var_70]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_CC]
		mov	edx, [bp+var_70]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_C8]
		mov	edx, [bp+var_70]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_84], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_10C], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_108], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_104], eax
		mov	eax, [bp+var_10C]
		add	[bp+var_94], eax
		mov	eax, [bp+var_108]
		add	[bp+var_90], eax
		mov	eax, [bp+var_104]
		add	[bp+var_8C], eax
		jmp	short loc_534A5

loc_53451:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A0]
		push	ax
		push	cs
		call	near ptr sub_51C99
		add	sp, 8
		mov	eax, [bp+var_A0]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_8C], eax
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+2Dh]
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_8], eax

loc_534A5:
		lea	ax, [bp+var_C4]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		lea	ax, [bp+var_C4]
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		mov	eax, [bp+var_8]
		neg	eax
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		lea	ax, word ptr [bp+var_16]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		call	Matrix_BuildAxisZ_59085
		add	sp, 4
		lea	ax, [bp+var_C4]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		push	104h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_53538
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+2Fh]
		lea	ax, [bp+var_C4]
		push	ax
		lea	ax, word ptr [bp+var_94]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Mission_GetCastName_544B8
		add	sp, 4
		push	dx
		push	ax
		push	large [bp+var_4]
		push	word_79B8C
		nop
		push	cs
		call	near ptr sub_54C48
		add	sp, 10h
		mov	[bp+var_18], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 56h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6

loc_53538:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+56h], 0
		jnz	short loc_53545
		jmp	loc_536C6

loc_53545:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_5356C
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_5356E

loc_5356C:
		mov	al, 1Ch

loc_5356E:
		cmp	al, 6
		jnz	short loc_535AE
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+2Fh], 0
		jnz	short loc_535AE
		mov	[bp+var_19], 1
		mov	bx, es:[bx+56h]
		mov	bx, [bx+52h]
		mov	al, [bp+var_19]
		mov	[bx+20h], al
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+56h]
		push	word ptr [bx+52h]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+56h]
		mov	bx, [bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		or	byte ptr [bx+92h], 4

loc_535AE:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_535C2
		jmp	loc_536BA

loc_535C2:
		lea	ax, word ptr [bp+var_24+2]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 12h
		mov	word ptr [bp+var_24], ax
		mov	word ptr [bp+var_28+2], dx
		push	8
		push	ax
		push	dx
		push	ds
		lea	ax, word ptr [bp+var_24+2]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		mov	[bp+var_1A], 0
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+12h], 0
		jz	short loc_5360E
		lea	ax, word ptr [bp+var_24+2]
		push	ax
		mov	bx, es:[bx+56h]
		push	large [bx+5Fh]
		call	sub_74525
		add	sp, 6

loc_5360E:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+31h]
		push	ax
		push	word ptr es:[bx+56h]
		call	sub_7434A
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+32h]
		mov	ah, 0
		mov	[bp+var_2C], ax
		push	ax
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_546A8
		add	sp, 4
		mov	word ptr [bp+var_28], dx
		mov	word ptr [bp+var_2A], ax
		cmp	[bp+var_2A], 0
		jz	short loc_5366F
		push	large 0
		push	35BCh
		les	bx, word ptr [bp+var_2A]
		push	word ptr es:[bx+56h]
		push	0B3h
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx+8Ch]
		add	sp, 0Ch

loc_5366F:
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_53696
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_53698

loc_53696:
		mov	al, 1Ch

loc_53698:
		cmp	al, 6
		jnz	short loc_536BA
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+31h], 0FFh
		jnz	short loc_536AC
		inc	word_79B93
		jmp	short loc_536BA

loc_536AC:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+31h], 1
		jnz	short loc_536BA
		inc	word_79B8F

loc_536BA:
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Shared_TriggerExprInstruction_53749
		add	sp, 4

loc_536C6:
		pop	si
		leave
		retf
PartEntry_ResolveSpawnPositionAndActivate_5313D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. (structure) Équivalent de PartEntry_Deactivate_5242A (objet du monde
; +86).
; ==============================================================================================
PartEntry_Deactivate_536C9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+56h], 0
		jz	short loc_5373F
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_5372C
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_53708
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_5370A

loc_53708:
		mov	al, 1Ch

loc_5370A:
		cmp	al, 6
		jnz	short loc_5372C
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+31h], 0FFh
		jnz	short loc_5371E
		dec	word_79B93
		jmp	short loc_5372C

loc_5371E:
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+31h], 1
		jnz	short loc_5372C
		dec	word_79B8F

loc_5372C:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+56h]
		push	word_79B8C
		nop
		push	cs
		call	near ptr sub_54C1C
		add	sp, 4

loc_5373F:
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+39h], 0FEh
		pop	bp
		retf
PartEntry_Deactivate_536C9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Activation d'un objet (même code que
; Shared_TriggerExprInstruction_5247D) : bit 0 de +57 posé, bits 2 et 3 effacés, +58 = 0,
; script +70 (on_is_activated).
; ==============================================================================================
Shared_TriggerExprInstruction_53749		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+39h], 1
		and	byte ptr es:[bx+39h], 0F7h
		and	byte ptr es:[bx+39h], 0FBh
		mov	dword ptr es:[bx+3Ah], 0
		push	[bp+arg_2]
		push	bx
		push	large es:[bx+46h]
		mov	ax, word_79B8C
		add	ax, 40h
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_530DB
		add	sp, 0Ah
		pop	bp
		retf
Shared_TriggerExprInstruction_53749		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Destruction : si le bit 0 de +57 est posé, l'efface, pose le bit 1,
; joue le script +78 (on_is_destroyed).
; ==============================================================================================
Expr_Node_RecomputeIfDirty_53780		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_537B5
		and	byte ptr es:[bx+39h], 0FEh
		or	byte ptr es:[bx+39h], 2
		push	[bp+arg_2]
		push	bx
		push	large es:[bx+4Eh]
		mov	ax, word_79B8C
		add	ax, 40h
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_530DB
		add	sp, 0Ah

loc_537B5:
		pop	bp
		retf
Expr_Node_RecomputeIfDirty_53780		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Expr_Node_DetachChildAndRecompute_524EB (sub_524EB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; détache un nœud enfant (+0x52, via sub_6BFBF) puis force la réévaluation via
; Expr_Node_RecomputeIfDirty_524B4.
; ==============================================================================================
Expr_Node_DetachChildAndRecompute_537B7		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+56h], 0
		jz	short loc_537DD
		push	0
		push	word ptr es:[bx+56h]
		call	sub_7418F
		add	sp, 4
		push	large [bp+arg_0]
		push	cs
		call	near ptr Expr_Node_RecomputeIfDirty_53780
		add	sp, 4

loc_537DD:
		pop	bp
		retf
Expr_Node_DetachChildAndRecompute_537B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Instruction 153 (objet, SPOT, rang LOAD) : LOAD[rang] doit être de
; classe 15 (méthode +8, erreur 9039h) ; position = SPOT tourné par l'orientation de l'objet
; (sub_5A629) + position de l'objet ; [description+67] = 1 ; instance (méthode +4, sous-objet
; +49 si présent), compteur +4 de la description incrémenté, position, sub_4BD5F(instance,
; [description+75], 100, [description+77]), orientation de l'objet (méthode +64), son 2 selon
; la distance à la caméra (sub_5EB62), ajout à la liste des objets du monde
; (List_AppendIfNonNull_1E24C).
; ==============================================================================================
MissionScript_SpawnEffectOnObj_537DF		proc far

var_3C		= dword ptr -3Ch
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	di, [bp+arg_6]
		mov	si, word_79B8C
		cmp	[si+4Ah], di
		jg	short loc_537FC
		push	9037h
		call	sub_1DDFE
		pop	cx

loc_537FC:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+56h], 0
		jnz	short loc_53809
		jmp	loc_539B0

loc_53809:
		mov	ax, di
		shl	ax, 2
		mov	bx, [si+48h]
		add	bx, ax
		mov	ax, [bx+2]
		mov	dx, [bx]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		push	[bp+arg_4]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		push	large [bp+var_4]
		les	bx, word ptr [bp+var_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 0Fh
		jz	short loc_53851
		push	9039h
		call	sub_1DDFE
		pop	cx

loc_53851:
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	sub_5A629
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	si, es:[bx+56h]
		add	si, 12h
		mov	eax, [si]
		add	[bp+var_24], eax
		mov	eax, [si+4]
		add	[bp+var_20], eax
		mov	eax, [si+8]
		add	[bp+var_1C], eax
		les	bx, word ptr [bp+var_4]
		mov	byte ptr es:[bx+43h], 1
		push	word ptr [bp+var_4+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	si, ax
		or	si, si
		jnz	short loc_538AE
		jmp	loc_539B0

loc_538AE:
		mov	[bp+var_8], 0
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+31h], 0
		jz	short loc_538DA
		push	ax
		push	large es:[bx+31h]
		les	bx, es:[bx+31h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax

loc_538DA:
		mov	eax, [bp+var_8]
		mov	[si+0Ah], eax
		les	bx, word ptr [bp+var_4]
		inc	word ptr es:[bx+4]
		mov	eax, [bp+var_24]
		mov	[si+12h], eax
		mov	eax, [bp+var_20]
		mov	[si+16h], eax
		mov	eax, [bp+var_1C]
		mov	[si+1Ah], eax
		push	64h
		push	word ptr es:[bx+4Bh]
		sub	sp, 4
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 4Dh
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	bx, [bp+var_C]
		mov	eax, es:[bx]
		mov	[bp+var_3C], eax
		push	si
		call	sub_4BD5F
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	eax, [si+12h]
		mov	bx, word_7CEF9
		sub	eax, [bx+14h]
		mov	[bp+var_30], eax
		mov	eax, [si+16h]
		sub	eax, [bx+18h]
		mov	[bp+var_2C], eax
		mov	eax, [si+1Ah]
		sub	eax, [bx+1Ch]
		mov	[bp+var_28], eax
		push	eax
		push	large [bp+var_2C]
		push	large [bp+var_30]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		sar	eax, 8
		mov	[bp+var_10], eax
		push	0
		push	eax
		push	2
		call	sub_5EB62
		add	sp, 8
		push	si
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4

loc_539B0:
		pop	di
		pop	si
		leave
		retf
MissionScript_SpawnEffectOnObj_537DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Instruction 154 (objet, SPOT de départ, rang LOAD, SPOT visé) :
; LOAD[rang] de classe 9 (erreur 9038h) ; départ = SPOT tourné par l'orientation de l'objet +
; sa position ; instance créée, placée, méthode +84 avec la position du SPOT visé (monde),
; sub_3FEC1, ajout aux objets du monde.
; ==============================================================================================
MissionScript_FireAtSpot_539B4		proc far

var_20		= word ptr -20h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	di, [bp+arg_6]
		mov	si, word_79B8C
		cmp	[si+4Ah], di
		jg	short loc_539D1
		push	9037h
		call	sub_1DDFE
		pop	cx

loc_539D1:
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+56h], 0
		jnz	short loc_539DE
		jmp	loc_53B07

loc_539DE:
		mov	ax, di
		shl	ax, 2
		mov	bx, [si+48h]
		add	bx, ax
		mov	ax, [bx+2]
		mov	dx, [bx]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	ax
		push	dx
		les	bx, [bp+var_4]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 9
		jz	short loc_53A0E
		push	9038h
		call	sub_1DDFE
		pop	cx

loc_53A0E:
		push	[bp+arg_4]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_14]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		push	[bp+arg_8]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		call	sub_5A629
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	si, es:[bx+56h]
		add	si, 12h
		mov	eax, [si]
		add	[bp+var_14], eax
		mov	eax, [si+4]
		add	[bp+var_10], eax
		mov	eax, [si+8]
		add	[bp+var_C], eax
		les	bx, [bp+var_4]
		mov	byte ptr es:[bx+43h], 1
		push	[bp+var_2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 4
		mov	si, ax
		or	si, si
		jz	short loc_53B07
		mov	[bp+var_8], 0
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx+31h], 0
		jz	short loc_53AC0
		push	ax
		push	large es:[bx+31h]
		les	bx, es:[bx+31h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax

loc_53AC0:
		mov	eax, [bp+var_8]
		mov	[si+0Ah], eax
		les	bx, [bp+var_4]
		inc	word ptr es:[bx+4]
		mov	eax, [bp+var_14]
		mov	[si+12h], eax
		mov	eax, [bp+var_10]
		mov	[si+16h], eax
		mov	eax, [bp+var_C]
		mov	[si+1Ah], eax
		lea	ax, [bp+var_20]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+54h]
		add	sp, 4
		push	si
		call	sub_3FEC1
		pop	cx
		push	si
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4

loc_53B07:
		pop	di
		pop	si
		leave
		retf
MissionScript_FireAtSpot_539B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Ordres de mission : liste de 22 valeurs cherchée une à une (word_542E0
; : 112, 161 à 165, 167 à 175, 177 à 181, 191, 193 ; cibles à +44) au lieu du switch 161 à 191
; de MissionScript_CallNativeHandler_52513. 173 = même cas que 167 ; 174 et 175 : cible tirée
; au hasard dans le camp adverse (sub_545A4), gardée en +68.
; ==============================================================================================
MissionScript_CallNativeHandler_53B0B		proc far

var_F4		= dword ptr -0F4h
var_F0		= dword ptr -0F0h
var_EC		= dword ptr -0ECh
var_E8		= dword ptr -0E8h
var_E4		= dword ptr -0E4h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
var_D4		= dword ptr -0D4h
var_D0		= dword ptr -0D0h
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0F4h
		push	si
		push	di
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+56h], 0
		jz	short loc_53B2C
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_53B31

loc_53B2C:
		xor	ax, ax
		jmp	loc_542DC

loc_53B31:
		mov	dx, [bp+arg_4]
		mov	ax, [bp+arg_6]
		mov	[bp+var_2], ax
		mov	[bp+var_4], 0
		mov	[bp+var_8], 0
		mov	[bp+var_C], 0
		mov	si, word_79B8C
		mov	di, dx
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+58h], 0FFh
		mov	[bp+var_38], dx
		mov	cx, 16h
		mov	bx, offset word_542E0

loc_53B66:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_38]
		jz	short loc_53B76
		add	bx, 2
		loop	short loc_53B66
		jmp	loc_54298

loc_53B76:
		jmp	word ptr cs:[bx+2Ch] ; switch jump
		jmp	loc_54298

loc_53B7D:
		push	[bp+var_2]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_58]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		mov	eax, [bp+var_58]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_44], eax
		les	bx, word ptr [bp+arg_0]
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx+58h], al
		jmp	loc_54298

loc_53BB8:
		push	[bp+var_2]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_64]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		mov	eax, [bp+var_64]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_44], eax
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+58h], 0FFh
		jmp	loc_54298

loc_53BF1:
		cmp	[bp+arg_8], 0FFFFh
		jnz	short loc_53C02
		push	901Ch
		call	sub_1DDFE
		pop	cx
		jmp	short loc_53C41

loc_53C02:
		push	[bp+arg_8]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E8]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		mov	eax, [bp+var_E8]
		mov	[bp+var_DC], eax
		mov	eax, [bp+var_E4]
		mov	[bp+var_D8], eax
		mov	eax, [bp+var_E0]
		mov	[bp+var_D4], eax
		lea	ax, word ptr [bp+var_DC]
		mov	word ptr [bp+var_8+2], ss
		mov	word ptr [bp+var_8], ax

loc_53C41:
		push	[bp+var_2]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_70]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		mov	eax, [bp+var_70]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_44], eax
		les	bx, word ptr [bp+arg_0]
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx+58h], al
		jmp	loc_54298

loc_53C7C:
		cmp	[bp+arg_8], 0FFFFh
		jnz	short loc_53C8D
		push	901Ch
		call	sub_1DDFE
		pop	cx
		jmp	short loc_53CB9

loc_53C8D:
		push	[bp+var_2]
		mov	ax, si
		add	ax, 34h
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_546A8
		add	sp, 4
		add	ax, 56h
		mov	[bp+var_3C], dx
		mov	[bp+var_3E], ax
		les	bx, [bp+var_3E]
		mov	ax, es:[bx]
		mov	[bp+var_3A], ax
		lea	ax, [bp+var_3A]
		mov	word ptr [bp+var_8+2], ss
		mov	word ptr [bp+var_8], ax

loc_53CB9:
		push	[bp+arg_8]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_7C]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		mov	eax, [bp+var_7C]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_44], eax
		jmp	loc_54298

loc_53CEA:
		cmp	[bp+arg_8], 0FFFFh
		jnz	short loc_53CFB
		push	901Dh
		call	sub_1DDFE
		pop	cx
		jmp	short loc_53D3A

loc_53CFB:
		push	[bp+arg_8]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E8]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		mov	eax, [bp+var_E8]
		mov	[bp+var_DC], eax
		mov	eax, [bp+var_E4]
		mov	[bp+var_D8], eax
		mov	eax, [bp+var_E0]
		mov	[bp+var_D4], eax
		lea	ax, word ptr [bp+var_DC]
		mov	word ptr [bp+var_8+2], ss
		mov	word ptr [bp+var_8], ax

loc_53D3A:
		push	[bp+var_2]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_88]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		mov	eax, [bp+var_88]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_44], eax
		les	bx, word ptr [bp+arg_0]
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx+58h], al
		jmp	loc_54298

loc_53D78:
		push	large [bp+arg_0]
		push	ss
		lea	ax, word ptr [bp+var_DC]
		push	ax
		nop
		push	cs
		call	near ptr sub_544F5
		add	sp, 8
		push	[bp+var_2]
		mov	ax, si
		add	ax, 1Ah
		push	ax
		nop
		push	cs
		call	near ptr PtrList_GetAt_54919
		add	sp, 4
		mov	[bp+var_3A], dx
		mov	[bp+var_3C], ax
		lea	ax, word ptr [bp+var_DC]
		push	ax
		push	dx
		push	[bp+var_3C]
		les	bx, [bp+var_3C]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		or	ax, ax
		jz	short loc_53DBF
		xor	ax, ax
		jmp	loc_542DC

loc_53DBF:
		mov	ax, [bp+var_3A]
		mov	dx, [bp+var_3C]
		add	dx, 22h
		mov	[bp+var_3E], ax
		mov	[bp+var_40], dx
		les	di, [bp+var_40]
		mov	eax, es:[di]
		mov	[bp+var_4C], eax
		mov	eax, es:[di+4]
		mov	[bp+var_48], eax
		mov	eax, es:[di+8]
		mov	[bp+var_44], eax
		mov	di, 0A4h
		cmp	[bp+arg_8], 0FFFFh
		jnz	short loc_53E00
		push	901Eh
		call	sub_1DDFE
		pop	cx
		jmp	loc_54298

loc_53E00:
		push	[bp+arg_8]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_F4]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		mov	eax, [bp+var_F4]
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_F0]
		mov	[bp+var_E4], eax
		mov	eax, [bp+var_EC]
		mov	[bp+var_E0], eax
		lea	ax, word ptr [bp+var_E8]
		mov	word ptr [bp+var_8+2], ss
		mov	word ptr [bp+var_8], ax
		jmp	loc_54298

loc_53E42:
		cmp	[bp+var_2], 0FFh
		jnz	short loc_53E55
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+32h]
		mov	ah, 0
		mov	[bp+var_2], ax

loc_53E55:
		push	[bp+var_2]
		mov	ax, si
		add	ax, 34h
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_546A8
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_53EDB
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+33h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_4C], eax
		mov	ax, es:[bx+35h]
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_48], eax
		mov	ax, es:[bx+37h]
		mov	[bp+var_1A], ax
		movsx	eax, [bp+var_1A]
		shl	eax, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_44], eax
		les	bx, word ptr [bp+var_C]
		mov	al, es:[bx+58h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+58h], al
		jmp	loc_54298

loc_53EDB:
		mov	di, 0FFFEh
		jmp	loc_54298

loc_53EE1:
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+44h], 0
		jz	short loc_53EEE
		jmp	loc_53FCA

loc_53EEE:
		mov	bx, es:[bx+56h]
		test	byte ptr [bx+2], 10h
		jnz	short loc_53EFB
		jmp	loc_53F7C

loc_53EFB:
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+56h]
		mov	al, [bx+51h]
		cbw
		cmp	ax, 0FFFFh
		jz	short loc_53F12
		cmp	ax, 1
		jz	short loc_53F3C
		jmp	short loc_53F66

loc_53F12:
		push	1
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr MissionScript_PickRandomObjectOfType_545A4
		add	sp, 8
		mov	[bp+var_3A], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 44h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		jmp	short loc_53F90

loc_53F3C:
		push	0FFFFh
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr MissionScript_PickRandomObjectOfType_545A4
		add	sp, 8
		mov	[bp+var_3C], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 44h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		jmp	short loc_53F90

loc_53F66:
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 44h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6
		jmp	short loc_53F90

loc_53F7C:
		push	0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 44h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39519
		add	sp, 6

loc_53F90:
		mov	[bp+var_C], 0
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+44h], 0
		jz	short loc_53FC7
		mov	si, es:[bx+44h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_4C], eax
		mov	eax, [si+4]
		mov	[bp+var_48], eax
		mov	eax, [si+8]
		mov	[bp+var_44], eax
		mov	byte ptr es:[bx+58h], 0FFh
		jmp	short loc_53FCA

loc_53FC7:
		mov	di, 0FFFEh

loc_53FCA:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+44h]
		mov	[bp+var_4], ax
		jmp	loc_54298

loc_53FD7:
		push	[bp+var_2]
		mov	ax, si
		add	ax, 34h
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_546A8
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_54031
		push	dx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_94]
		push	ax
		nop
		push	cs
		call	near ptr sub_544F5
		add	sp, 8
		mov	eax, [bp+var_94]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_8C]
		mov	[bp+var_44], eax
		les	bx, word ptr [bp+var_C]
		mov	al, es:[bx+58h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+58h], al
		jmp	loc_54298

loc_54031:
		mov	di, 0FFFEh
		jmp	loc_54298

loc_54037:
		les	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+56h]
		test	byte ptr [bx+2], 10h
		jz	short loc_54082
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+56h]
		mov	al, [bx+51h]
		push	ax
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr MissionScript_PickRandomObjectOfType_545A4
		add	sp, 8
		mov	[bp+var_3A], ax
		mov	si, [bp+var_3A]
		add	si, 12h
		mov	eax, [si]
		mov	[bp+var_4C], eax
		mov	eax, [si+4]
		mov	[bp+var_48], eax
		mov	eax, [si+8]
		mov	[bp+var_44], eax
		jmp	loc_54298

loc_54082:
		mov	di, 0FFFFh
		jmp	loc_54298

loc_54088:
		push	[bp+var_2]
		mov	ax, si
		add	ax, 34h
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_546A8
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_540E2
		push	dx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_A0]
		push	ax
		nop
		push	cs
		call	near ptr sub_544F5
		add	sp, 8
		mov	eax, [bp+var_A0]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_44], eax
		les	bx, word ptr [bp+var_C]
		mov	al, es:[bx+58h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+58h], al
		jmp	loc_54298

loc_540E2:
		mov	di, 0FFFFh
		jmp	loc_54298

loc_540E8:
		push	[bp+var_2]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_AC]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		mov	eax, [bp+var_AC]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_44], eax
		les	bx, word ptr [bp+arg_0]
		mov	al, byte ptr [bp+var_2]
		mov	es:[bx+58h], al
		jmp	loc_54298

loc_54127:
		mov	[bp+var_22], 0
		mov	eax, [bp+var_22]
		mov	[bp+var_48], eax
		mov	[bp+var_4C], eax
		mov	ax, [si+24h]
		cmp	ax, [bp+var_2]
		jbe	short loc_54153
		mov	ax, [bp+var_2]
		shl	ax, 2
		mov	bx, [si+26h]
		add	bx, ax
		mov	eax, [bx]
		jmp	short loc_54156

loc_54153:
		xor	eax, eax

loc_54156:
		mov	[bp+var_26], eax
		shl	eax, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_44], eax
		jmp	loc_54298

loc_5416D:
		push	[bp+var_2]
		mov	ax, si
		add	ax, 34h
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_546A8
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_541B9
		push	dx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_B8]
		push	ax
		nop
		push	cs
		call	near ptr sub_544F5
		add	sp, 8
		mov	eax, [bp+var_B8]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_B4]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_B0]
		mov	[bp+var_44], eax
		jmp	loc_54298

loc_541B9:
		mov	di, 0FFFEh
		jmp	loc_54298

loc_541BF:
		push	[bp+var_2]
		mov	ax, si
		add	ax, 34h
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_546A8
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_5420B
		push	dx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C4]
		push	ax
		nop
		push	cs
		call	near ptr sub_544F5
		add	sp, 8
		mov	eax, [bp+var_C4]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_C0]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_44], eax
		jmp	loc_54298

loc_5420B:
		mov	di, 0FFFEh
		jmp	loc_54298

loc_54211:
		push	[bp+var_2]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_D0]
		push	ax
		nop
		push	cs
		call	near ptr Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		mov	eax, [bp+var_D0]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_CC]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_C8]
		mov	[bp+var_44], eax
		jmp	short loc_54298

loc_54245:
		mov	[bp+var_2E], 0
		mov	eax, [bp+var_2E]
		mov	[bp+var_44], eax
		mov	[bp+var_4C], eax
		mov	ax, [si+24h]
		cmp	ax, [bp+var_2]
		jbe	short loc_54271
		mov	ax, [bp+var_2]
		shl	ax, 2
		mov	bx, [si+26h]
		add	bx, ax
		mov	eax, [bx]
		jmp	short loc_54274

loc_54271:
		xor	eax, eax

loc_54274:
		mov	[bp+var_32], eax
		shl	eax, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_48], eax
		jmp	short loc_54298

loc_5428A:
		mov	ax, [bp+var_2]
		mov	word ptr [bp+var_8], ax
		mov	eax, [si+65h]
		mov	[bp+var_C], eax

loc_54298:
		cmp	di, 0FFFEh
		jnz	short loc_542A1
		xor	ax, ax
		jmp	short loc_542DC

loc_542A1:
		cmp	di, 0FFFFh
		jnz	short loc_542AB
		mov	ax, 1
		jmp	short loc_542DC

loc_542AB:
		cmp	[bp+var_C], 0
		jz	short loc_542BC
		les	bx, word ptr [bp+var_C]
		mov	ax, es:[bx+56h]
		mov	[bp+var_4], ax

loc_542BC:
		push	large [bp+var_8]
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	[bp+var_4]
		push	di
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx+8Ch]
		add	sp, 0Ch

loc_542DC:
		pop	di
		pop	si
		leave
		retf
MissionScript_CallNativeHandler_53B0B		endp

; START OF FUNCTION CHUNK FOR MissionScript_CallNativeHandler_53B0B
word_542E0	dw 70h
		dw 0A1h
		dw 0A2h
		dw 0A3h
		dw 0A4h
		dw 0A5h
		dw 0A7h
		dw 0A8h
		dw 0A9h
		dw 0AAh
		dw 0ABh
		dw 0ACh
		dw 0ADh
		dw 0AEh
		dw 0AFh
		dw 0B1h
		dw 0B2h
		dw 0B3h
		dw 0B4h
		dw 0B5h
		dw 0BFh
		dw 0C1h
off_5430C	dw offset loc_54037
		dw offset loc_53BB8
		dw offset loc_53BF1
		dw offset loc_53D78
		dw offset loc_53CEA
		dw offset loc_53CEA
		dw offset loc_53FD7
		dw offset loc_54088
		dw offset loc_540E8
		dw offset loc_53E42
		dw offset loc_5428A
		dw offset loc_53CEA
		dw offset loc_53FD7
		dw offset loc_53EE1
		dw offset loc_53EE1
		dw offset loc_54127
		dw offset loc_54245
		dw offset loc_5416D
		dw offset loc_54211
		dw offset loc_541BF
		dw offset loc_53B7D
		dw offset loc_53C7C
; END OF FUNCTION CHUNK FOR MissionScript_CallNativeHandler_53B0B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Équivalent d'Expr_Node_UpdateAndPropagate_52AC6 : bit 1 de +57 →
; Expr_Node_RecomputeIfDirty_53780 ; sinon bit 3 → script +82 puis, au-delà de dword_7CC84,
; PartEntry_Deactivate_536C9 ; sinon script +74, puis, si l'objet du monde est celui de
; [mission+101], +88 = [mission+128] quand [mission+127] vaut 165, 166 ou 162, sinon 255.
; ==============================================================================================
Expr_Node_UpdateAndPropagate_54338		proc far

var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	si, word_79B8C
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		mov	ah, 0
		or	ax, ax
		jz	short loc_5435A
		jmp	loc_544A9

loc_5435A:
		mov	al, es:[bx+39h]
		shl	ax, 0Ch
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_5436B
		jmp	loc_5444A

loc_5436B:
		push	word ptr [bp+arg_0+2]
		push	bx
		push	large es:[bx+52h]
		mov	ax, si
		add	ax, 40h
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_530DB
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	di, es:[bx+56h]
		add	di, 12h
		cmp	dword ptr [si+65h], 0
		jz	short loc_543AA
		push	large [si+65h]
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		nop
		push	cs
		call	near ptr sub_544F5
		add	sp, 8
		mov	dx, ss
		lea	ax, word ptr [bp+var_24]
		jmp	short loc_543C7

loc_543AA:
		mov	eax, dword_79CEC
		mov	[bp+var_24], eax
		mov	eax, dword_79CF0
		mov	[bp+var_20], eax
		mov	eax, dword_79CF4
		mov	[bp+var_1C], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_24]

loc_543C7:
		mov	eax, [di]
		sub	eax, [bp+var_24]
		mov	[bp+var_30], eax
		mov	eax, [di+4]
		sub	eax, [bp+var_20]
		mov	[bp+var_2C], eax
		mov	eax, [di+8]
		sub	eax, [bp+var_1C]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_10], eax
		push	eax
		push	large [bp+var_14]
		push	large [bp+var_18]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		mov	eax, dword_7CC84
		mov	[bp+var_C], eax
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_54437
		mov	ax, 1
		jmp	short loc_54439

loc_54437:
		xor	ax, ax

loc_54439:
		or	al, al
		jz	short loc_544B4
		push	large [bp+arg_0]
		push	cs
		call	near ptr PartEntry_Deactivate_536C9
		add	sp, 4
		jmp	short loc_544B4

loc_5444A:
		push	large [bp+arg_0]
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+4Ah]
		mov	ax, si
		add	ax, 40h
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_530DB
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+56h]
		les	bx, [si+65h]
		cmp	ax, es:[bx+56h]
		jnz	short loc_544B4
		mov	dx, 0FFFFh
		mov	al, [si+7Fh]
		mov	ah, 0
		cmp	ax, 0A5h
		jz	short loc_54494
		mov	al, [si+7Fh]
		mov	ah, 0
		cmp	ax, 0A6h
		jz	short loc_54494
		mov	al, [si+7Fh]
		mov	ah, 0
		cmp	ax, 0A2h
		jnz	short loc_5449E

loc_54494:
		mov	al, [si+80h]
		mov	ah, 0
		mov	dx, ax
		jmp	short loc_5449E

loc_5449E:
		mov	ax, dx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+58h], al
		jmp	short loc_544B4

loc_544A9:
		push	large [bp+arg_0]
		push	cs
		call	near ptr Expr_Node_RecomputeIfDirty_53780
		add	sp, 4

loc_544B4:
		pop	di
		pop	si
		leave
		retf
Expr_Node_UpdateAndPropagate_54338		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Mission_GetCastName_52C5F (sub_52C5F de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, NOM CAST D'UN
; OBJET DE MISSION (ex-Expr_LookupBuiltinFuncDesc : aucun rapport avec des fonctions natives).
; Arg : far ptr entrée PART (85 o). Renvoie &CAST[entrée+0x1B] (far ptr vers le nom de 9 o) ou
; NULL si l'index ≥ nombre de noms : mov al, es:[bx+1Bh] / cmp [bx+2Eh], dx / jbe → NULL ;
; sinon imul ax, 9 / add bx, [bx+30h] (liste CAST = word_706A0+0x2E : [+0] nombre, [+2] far
; ptr). Appelants : PartEntry_ResolveSpawnPositionAndActivate_51EDC (nom passé à
; AIAircraft_SpawnAndConditionalLoadProfile_53363 → PLAYER / NETWORK / IA + profil
; INTEL\<nom>.IFF), Expr_Node_LookupAndConvert_52D69, écriture du chunk KILL de MISN2OP.IFF.
; Format CAST : DATA_MODEL.md.
; ==============================================================================================
Mission_GetCastName_544B8		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		mov	dx, ax
		mov	[bp+var_4], 0
		mov	bx, word_79B8C
		cmp	[bx+2Eh], dx
		jbe	short loc_544ED
		imul	ax, ax, 9
		mov	dx, [bx+32h]
		mov	bx, [bx+30h]
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		jmp	short loc_544ED

loc_544ED:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
Mission_GetCastName_544B8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_544F5		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		les	bx, [bp+arg_4]
		cmp	word ptr es:[bx+56h], 0
		jz	short loc_54548
		mov	si, word ptr [bp+arg_0]
		mov	di, es:[bx+56h]
		add	di, 12h
		or	si, si
		jz	short loc_54516
		mov	ax, si
		jmp	short loc_54520

loc_54516:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_54520:
		or	ax, ax
		jz	short loc_5453E
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4], eax
		mov	eax, [di+8]
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_54540

loc_5453E:
		mov	ax, si

loc_54540:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		jmp	short loc_54563

loc_54548:
		mov	ax, [bp+arg_4]
		add	ax, 1Dh
		push	[bp+arg_6]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_51C99
		add	sp, 8
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]

loc_54563:
		pop	di
		pop	si
		pop	bp
		retf
sub_544F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_3F737 (sub_3F737 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextScrollDisplayB_TickHelper_67F13 (sub_67F13 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; CachedObject_DestructHelper_5DE34 (seg141, tag 5DFEh). Référencée par sub_8F47A (même
; appelant que Stopwatch_RegisterTickModule_67611, seg207).
; ==============================================================================================
TextScrollDisplayB_TickHelper_54567		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	large [bp+arg_0]
		push	word_79B8C
		call	sub_7528F
		add	sp, 6
		pop	bp
		retf
TextScrollDisplayB_TickHelper_54567		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Expr_Node_HasChildError_52D1D (sub_52D1D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; prédicat booléen : vérifie un indicateur d'erreur (+0x20, signe) sur le petit-enfant d'un
; nœud (+0x52 → +0x51).
; ==============================================================================================
Expr_Node_HasChildError_5457C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	dl, 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+56h], 0
		jz	short loc_5459F
		mov	si, es:[bx+56h]
		mov	si, [si+52h]
		mov	al, [si+20h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	dl, al

loc_5459F:
		mov	al, dl
		pop	si
		pop	bp
		retf
Expr_Node_HasChildError_5457C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. (objet, type, camp) : jusqu'à 6 objets du monde trouvés par sub_1E6E1,
; un tiré au hasard (CRT_Rand) ; 0 si aucun.
; ==============================================================================================
MissionScript_PickRandomObjectOfType_545A4		proc far

var_E		= word ptr -0Eh
var_2		= word ptr -2
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		xor	si, si
		xor	dx, dx
		jmp	short loc_545C2

loc_545B1:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_E]
		add	bx, ax
		mov	[bx], dx
		inc	si
		cmp	si, 6
		jge	short loc_545DC

loc_545C2:
		push	dx
		mov	al, [bp+arg_6]
		push	ax
		mov	al, [bp+arg_4]
		push	ax
		push	67ADh
		call	WorldObjects_FindNextOfType_1E6E1
		add	sp, 8
		mov	dx, ax
		or	ax, ax
		jnz	short loc_545B1

loc_545DC:
		or	si, si
		jle	short loc_5460D
		mov	[bp+var_2], si
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_2]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		shl	ax, 1
		lea	dx, [bp+var_E]
		add	ax, dx
		mov	bx, ax
		mov	ax, [bx]
		jmp	short loc_5460F

loc_5460D:
		xor	ax, ax

loc_5460F:
		pop	si
		leave
		retf
MissionScript_PickRandomObjectOfType_545A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Expr_LookupTableEntry85B_52D45 (sub_52D45 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; accesseur de table bornée à stride 85 octets (0x55) — récupère un pointeur d'enregistrement
; par index.
; ==============================================================================================
Expr_LookupTableEntry85B_54612		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		cmp	[si], cx
		jbe	short loc_5462F
		mov	dx, [si+4]
		mov	ax, [si+2]
		mov	bx, cx
		imul	bx, bx, 59h
		add	ax, bx
		jmp	short loc_54633

loc_5462F:
		xor	dx, dx
		xor	ax, ax

loc_54633:
		pop	si
		pop	bp
		retf
Expr_LookupTableEntry85B_54612		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Expr_Node_LookupAndConvert_52D69 (sub_52D69 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Mission_GetCastName_52C5F avec un appel externe (sub_2E3C) — conversion/formatage
; d'une valeur de fonction native.
; ==============================================================================================
Expr_Node_LookupAndConvert_54636		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+2]
		mov	[bp+var_4], eax
		xor	di, di
		jmp	short loc_5469C

loc_5464D:
		push	large [bp+var_4]
		push	cs
		call	near ptr Mission_GetCastName_544B8
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax
		mov	eax, [bp+arg_2]
		mov	[bp+var_10], eax
		push	8
		push	large [bp+var_10]
		push	large [bp+var_8]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_54689
		mov	ax, 1
		jmp	short loc_5468B

loc_54689:
		xor	ax, ax

loc_5468B:
		or	al, al
		jz	short loc_54697
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_546A4

loc_54697:
		inc	di
		add	word ptr [bp+var_4], 59h

loc_5469C:
		cmp	[si], di
		jg	short loc_5464D
		xor	dx, dx
		xor	ax, ax

loc_546A4:
		pop	di
		pop	si
		leave
		retf
Expr_Node_LookupAndConvert_54636		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Expr_LookupNamedValue_52DDB (sub_52DDB de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, résolution de
; valeur nommée par recherche indexée bornée (motif identique à Expr_LookupNamedValue_51E4A),
; utilisée notamment par Expr_VM_ReadVarOrOverride_510CC.
; ==============================================================================================
Expr_LookupNamedValue_546A8		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+2]
		mov	[bp+var_4], eax
		xor	dx, dx
		jmp	short loc_546D9

loc_546BE:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		cmp	ax, [bp+arg_2]
		jnz	short loc_546D4
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_546E1

loc_546D4:
		inc	dx
		add	word ptr [bp+var_4], 59h

loc_546D9:
		cmp	[si], dx
		jg	short loc_546BE
		xor	dx, dx
		xor	ax, ax

loc_546E1:
		pop	si
		leave
		retf
Expr_LookupNamedValue_546A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Expr_Node_Accessor_52E17 (sub_52E17 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; accesseur/mutateur de champ de nœud, utilisé par plusieurs constructeurs d'écran UI
; (sub_53A94/sub_53D92/sub_54274).
; ==============================================================================================
Expr_Node_Accessor_546E4		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+2]
		mov	[bp+var_4], eax
		xor	dx, dx
		jmp	short loc_54713

loc_546FA:
		les	bx, word ptr [bp+var_4]
		mov	ax, es:[bx+56h]
		cmp	ax, [bp+arg_2]
		jnz	short loc_5470E
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_5471B

loc_5470E:
		inc	dx
		add	word ptr [bp+var_4], 59h

loc_54713:
		cmp	[si], dx
		jg	short loc_546FA
		xor	dx, dx
		xor	ax, ax

loc_5471B:
		pop	si
		leave
		retf
Expr_Node_Accessor_546E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PartEntry_DispatchMissionUpdateTick_52E51 (sub_52E51
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 37 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi). RENOMMEE (ancien nom
; 'Expr_Node_RefreshField' n'avait plus de sens une fois le type d'objet identifie).   BOUCLE
; SUR LE TABLEAU DES PartEntry (participants du chunk PART) : pas de 0x55 (85 octets, taille
; exacte confirmee de PartEntry_AllocateArray_AA23D). Pour chaque entree, teste le bit 0 de
; +0x39 (le meme champ de statut que PartEntry_ResetState_A9DFD manipule) ; si actif, appelle
; Expr_Node_UpdateAndPropagate_52AC6(entree).   ROLE CONFIRME : c'est le vrai declencheur, a
; chaque frame (appelee par MAIN_GAME_TICK_536F7), de l'evenement 'on_mission_update' pour
; chaque participant de mission dont le bit correspondant est actif — point d'entree de la
; chaine Expr_Node_UpdateAndPropagate -> Expr_VM_ExecuteSingleInstruction ->
; MissionScript_ExecutePROG qui execute finalement le script on_mission_update de ce
; participant (PartEntry+0x46/0x48).
; ==============================================================================================
PartEntry_DispatchMissionUpdateTick_5471E		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+2]
		mov	[bp+var_4], eax
		xor	di, di
		jmp	short loc_54756

loc_54735:
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_54751
		push	word ptr [bp+var_4+2]
		push	bx
		push	cs
		call	near ptr Expr_Node_UpdateAndPropagate_54338
		add	sp, 4

loc_54751:
		inc	di
		add	word ptr [bp+var_4], 59h

loc_54756:
		cmp	[si], di
		jg	short loc_54735
		pop	di
		pop	si
		leave
		retf
PartEntry_DispatchMissionUpdateTick_5471E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5475E		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		mov	[bp+var_14], eax
		mov	eax, [si+4]
		mov	[bp+var_10], eax
		mov	eax, [si+8]
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+22h]
		sub	[bp+var_14], eax
		mov	eax, es:[bx+26h]
		sub	[bp+var_10], eax
		mov	eax, es:[bx+2Ah]
		sub	[bp+var_C], eax
		push	large [bp+var_C]
		push	large [bp+var_10]
		push	large [bp+var_14]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		cmp	eax, es:[bx+2Eh]
		jg	short loc_547D0
		mov	ax, 1
		jmp	short loc_547D2

loc_547D0:
		xor	ax, ax

loc_547D2:
		pop	si
		leave
		retf
sub_5475E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_547D5		proc far
		push	bp
		mov	bp, sp
		mov	al, 53h
		pop	bp
		retf
sub_547D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_547DC		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+22h]
		add	eax, es:[bx+2Eh]
		cmp	eax, [si]
		jge	short loc_547F9
		xor	ax, ax
		jmp	short loc_54869

loc_547F9:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+22h]
		sub	eax, es:[bx+32h]
		cmp	eax, [si]
		jle	short loc_5480F
		xor	ax, ax
		jmp	short loc_54869

loc_5480F:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+26h]
		add	eax, es:[bx+36h]
		cmp	eax, [si+4]
		jge	short loc_54826
		xor	ax, ax
		jmp	short loc_54869

loc_54826:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+26h]
		sub	eax, es:[bx+3Ah]
		cmp	eax, [si+4]
		jle	short loc_5483D
		xor	ax, ax
		jmp	short loc_54869

loc_5483D:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Ah]
		add	eax, es:[bx+3Eh]
		cmp	eax, [si+8]
		jge	short loc_54854
		xor	ax, ax
		jmp	short loc_54869

loc_54854:
		mov	eax, [si+8]
		les	bx, [bp+arg_0]
		cmp	eax, es:[bx+2Ah]
		jge	short loc_54866
		xor	ax, ax
		jmp	short loc_54869

loc_54866:
		mov	ax, 1

loc_54869:
		pop	si
		pop	bp
		retf
sub_547DC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5486C		proc far
		push	bp
		mov	bp, sp
		mov	al, 42h
		pop	bp
		retf
sub_5486C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54873		proc far
		push	bp
		mov	bp, sp
		mov	al, 43h
		pop	bp
		retf
sub_54873		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5487A		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+2Ah]
		add	eax, es:[bx+2Eh]
		cmp	eax, [si+8]
		jge	short loc_5489B
		xor	ax, ax
		jmp	short loc_54916

loc_5489B:
		mov	eax, [si+8]
		les	bx, [bp+arg_0]
		cmp	eax, es:[bx+2Ah]
		jge	short loc_548AD
		xor	ax, ax
		jmp	short loc_54916

loc_548AD:
		mov	eax, [si]
		mov	[bp+var_14], eax
		mov	eax, [si+4]
		mov	[bp+var_10], eax
		mov	eax, [si+8]
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+22h]
		sub	[bp+var_14], eax
		mov	eax, es:[bx+26h]
		sub	[bp+var_10], eax
		mov	[bp+var_C], 0
		push	large [bp+var_C]
		push	large [bp+var_10]
		push	large [bp+var_14]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		cmp	eax, es:[bx+32h]
		jg	short loc_54914
		mov	ax, 1
		jmp	short loc_54916

loc_54914:
		xor	ax, ax

loc_54916:
		pop	si
		leave
		retf
sub_5487A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à PtrList_GetAt_53034
; (sub_53034 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, ACCÈS À L'ÉLÉMENT i D'UNE LISTE DE POINTEURS FAR (ex-GeomNode_SumAndCount : ni
; somme ni comptage). Args : (liste, i) ; liste = [+0] u16 nombre, [+2] near ptr tableau de
; far ptr (4 o). Renvoie liste[i], ou NULL si i ≥ nombre (cmp [si],dx / jbe), d'où area_id =
; −1 / 0xFFFF = « pas de zone ». Sert à convertir un index AREA (liste MissionScenario+0x1A)
; en pointeur de zone : SCNE, SPOT, PART, HOME, opcodes VM 0x80/0x81/0x82.
; ==============================================================================================
PtrList_GetAt_54919		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	[si], dx
		jbe	short loc_54938
		mov	ax, dx
		shl	ax, 2
		mov	bx, [si+2]
		add	bx, ax
		mov	dx, [bx+2]
		mov	ax, [bx]
		jmp	short loc_5493C

loc_54938:
		xor	dx, dx
		xor	ax, ax

loc_5493C:
		pop	si
		pop	bp
		retf
PtrList_GetAt_54919		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Mission_GetSpotWorldPosition_5305A (sub_5305A de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; POSITION MONDE DU SPOT n (ex-Player_ResolveAttachPointN : rien à voir avec un point
; d'attache du joueur). Args : (dst, seg dst, liste SPOT, n). Tous les appelants passent la
; liste SPOT du scénario (word_706A0+0x1E ; add ax,1Eh avant l'appel). liste = [+0] u16
; nombre, [+2] far ptr tableau de records de 16 o (shl bx,4). Si n ≥ nombre (cmp [si],cx /
; jbe) : renvoie (0, 0, 0) — un 2e opérande absent (0xFFFF) donne donc l'origine du monde.
; Sinon : AreaRelPos_ToWorld_50EEB(record) = décalage du spot + point de référence de sa zone
; AREA. Appelants : ordres de mission via MissionScript_CallNativeHandler_52513 (0xA1, 0xA2…),
; Player_MainUpdate, seg011, seg029. Format SPOT : DATA_MODEL.md.
; ==============================================================================================
Mission_GetSpotWorldPosition_5493F		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+arg_4]
		mov	cx, [bp+arg_6]
		xor	eax, eax
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		cmp	[si], cx
		jbe	short loc_5496E
		mov	dx, [si+4]
		mov	ax, [si+2]
		mov	bx, cx
		shl	bx, 4
		add	ax, bx
		jmp	short loc_54972

loc_5496E:
		xor	dx, dx
		xor	ax, ax

loc_54972:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_549A5
		push	dx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	cs
		call	near ptr sub_51C99
		add	sp, 8
		mov	eax, [bp+var_1C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_8], eax

loc_549A5:
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_549B0
		mov	ax, si
		jmp	short loc_549BA

loc_549B0:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_549BA:
		or	ax, ax
		jz	short loc_549D9
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	eax, [bp+var_C]
		mov	[si+4], eax
		mov	eax, [bp+var_8]
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_549DB

loc_549D9:
		mov	ax, si

loc_549DB:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Mission_GetSpotWorldPosition_5493F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_EnsureUnitsSpawned_530FF (sub_530FF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 73
; lignes, LUE INTEGRALEMENT. RENOMMEE (ancien nom 'MissionFormation_EnsureAllSlotsFilled'
; errone). Le parametre 'si' est tres probablement la SCENE elle-meme (pas un
; groupe/escadrille) : si[0x14]/si[0x16] correspondent vraisemblablement a la LISTE D'UNITES
; en queue du chunk SCNE (documentee dans DATA_MODEL.md : liste de u16, index dans PART). Pour
; chaque unite de cette liste : resout la PartEntry correspondante (sub_52D45), et si son
; controleur (+0x52) est encore NUL, appelle MissionFormation_ComputeSlotAndSpawn_51EDC pour
; la faire apparaitre — assure que toutes les unites de la scene existent au moment de son
; activation.
; ==============================================================================================
Scene_EnsureUnitsSpawned_549E4		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+1], 1
		xor	di, di
		jmp	short loc_54A56

loc_549F7:
		mov	ax, di
		shl	ax, 1
		mov	bx, [si+16h]
		add	bx, ax
		push	word ptr [bx]
		mov	ax, [si+2]
		add	ax, 34h
		push	ax
		push	cs
		call	near ptr Expr_LookupTableEntry85B_54612
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_54A55
		les	bx, word ptr [bp+var_4]
		cmp	word ptr es:[bx+56h], 0
		jz	short loc_54A2C
		mov	ax, 1
		jmp	short loc_54A2E

loc_54A2C:
		xor	ax, ax

loc_54A2E:
		or	ax, ax
		jz	short loc_54A4A
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+39h]
		shl	ax, 0Ch
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_54A55
		and	byte ptr es:[bx+39h], 0F7h
		jmp	short loc_54A55

loc_54A4A:
		push	large [bp+var_4]
		push	cs
		call	near ptr PartEntry_ResolveSpawnPositionAndActivate_5313D
		add	sp, 4

loc_54A55:
		inc	di

loc_54A56:
		cmp	[si+14h], di
		jg	short loc_549F7
		pop	di
		pop	si
		leave
		retf
Scene_EnsureUnitsSpawned_549E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_LeaveMarkUnits_5317A (sub_5317A de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, lue
; intégralement. Pour chaque objet de la scène (liste du chunk SCNE,
; Expr_LookupTableEntry85B_52D45) dont le 4e script PART (+0x4E) existe : bit 3 de +0x39 posé
; (or byte ptr es:[bx+39h], 8). Puis record+1 = 0 (record+1 = 1 posé par
; Scene_EnsureUnitsSpawned_530FF : la scène est la scène courante). Rôle du bit 3 non établi ;
; Scene_EnsureUnitsSpawned_530FF l'efface sur les objets déjà présents.
; Ex-'Expr_Node_GetCachedValueB' (corrigé 2026-10-30).
; ==============================================================================================
Scene_LeaveMarkUnits_54A5F		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_54AA5

loc_54A6E:
		mov	ax, di
		shl	ax, 1
		mov	bx, [si+16h]
		add	bx, ax
		push	word ptr [bx]
		mov	ax, [si+2]
		add	ax, 34h
		push	ax
		push	cs
		call	near ptr Expr_LookupTableEntry85B_54612
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_54AA4
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+52h], 0
		jz	short loc_54AA4
		or	byte ptr es:[bx+39h], 8

loc_54AA4:
		inc	di

loc_54AA5:
		cmp	[si+14h], di
		jg	short loc_54A6E
		mov	byte ptr [si+1], 0
		pop	di
		pop	si
		leave
		retf
Scene_LeaveMarkUnits_54A5F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_TriggerActivation_531CD (sub_531CD de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 26
; lignes, LUE INTEGRALEMENT. RENOMMEE (ancien nom 'MissionFormation_TickGroup' errone). Quand
; une scene devient active : appelle Scene_EnsureUnitsSpawned_530FF (fait apparaitre les
; unites associees non encore presentes), PUIS Expr_VM_ExecuteSingleInstruction_51E7E —
; DECLENCHE L'EXECUTION DU SCRIPT on_is_activated DE CETTE SCENE (parametres calcules depuis
; scene+2+0x40 = reference au champ progs_id resolu de la scene, scene+8).
; ==============================================================================================
Scene_TriggerActivation_54AB2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Scene_EnsureUnitsSpawned_549E4
		pop	cx
		push	large 0
		push	large [si+8]
		mov	ax, [si+2]
		add	ax, 40h
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_530DB
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
Scene_TriggerActivation_54AB2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_RunUpdateScript_531F2 (sub_531F2 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 20 lignes, lue
; intégralement. Lance le champ +12 d'un record de scène (octets 5 et 6 du chunk SCNE : 2e
; script) par Expr_VM_ExecuteSingleInstruction_51E7E. Appelée deux fois à CHAQUE image par
; MAIN_GAME_TICK : sur la scène globale (MissionScenario+78, avant la détection de scène) puis
; sur la scène courante (MissionScenario+80, après Scene_DetectAndActivateChange_532EA). C'est
; donc le script de mise à jour de la scène. Ex-'Scene_TriggerLeavingEvent' (nom erroné,
; corrigé 2026-10-30 ; IMPL_MISSION_AREAS.md).
; ==============================================================================================
Scene_RunUpdateScript_54AD7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0
		push	large [si+0Ch]
		mov	ax, [si+2]
		add	ax, 40h
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_530DB
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
Scene_RunUpdateScript_54AD7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_RunLeavingScript_53211 (sub_53211 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 24
; lignes, lue intégralement. Appelle Scene_LeaveMarkUnits_5317A (record+1 = 0, drapeau bit 3
; sur les objets de la scène), puis lance le champ +16 du record de scène (octets 7 et 8 du
; chunk SCNE : 3e script) par Expr_VM_ExecuteSingleInstruction_51E7E. Appelée par
; Scene_DetectAndActivateChange_532EA sur l'ANCIENNE scène quand la scène courante change, et
; par MissionScenario_RecomputeFields_A9382 (une seule fois, en fin de mission) sur la scène
; courante puis la scène globale. STRIKE_EXE_MAIN_LOOP lance aussi ce champ de la scène
; globale en sortie de boucle. Dans MISN-1A, ce script de la scène globale écrit les variables
; de résultat (STAT). C'est donc le script de sortie de scène et de fin de mission.
; Ex-'Scene_TriggerMissionUpdateEvent' (nom erroné, corrigé 2026-10-30 ;
; IMPL_MISSION_AREAS.md).
; ==============================================================================================
Scene_RunLeavingScript_54AF6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Scene_LeaveMarkUnits_54A5F
		pop	cx
		push	large 0
		push	large [si+10h]
		mov	ax, [si+2]
		add	ax, 40h
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_530DB
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
Scene_RunLeavingScript_54AF6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_FindMatchingByAreaContainment_53236 (sub_53236
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 80 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi). Itere le tableau des
; enregistrements SCNE (pas de 0x27=39 octets, confirmant la taille de DATA_MODEL.md), pour
; chaque scene active (is_active!=0) dont la zone (area_id resolu, +4) est non nulle, teste
; par appel virtuel ([areaHandle->vtable+4](param)) si le parametre (position/reference) est
; contenu dans cette zone. Retourne la premiere scene active correspondante, ou NULL. C'est le
; vrai SELECTEUR DE SCENE ACTIVE de la mission.
; ==============================================================================================
Scene_FindMatchingByAreaContainment_54B1B		proc far

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
		jmp	short loc_54B85

loc_54B2D:
		mov	ax, [bp+var_2]
		imul	ax, ax, 27h
		mov	di, [si+2]
		add	di, ax
		cmp	byte ptr [di], 0
		jz	short loc_54B82
		cmp	dword ptr [di+4], 0
		jz	short loc_54B82
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		cmp	dword ptr [di+4], 0
		jnz	short loc_54B56
		mov	ax, 1
		jmp	short loc_54B58

loc_54B56:
		xor	ax, ax

loc_54B58:
		or	ax, ax
		jnz	short loc_54B73
		push	[bp+var_4]
		push	large [di+4]
		les	bx, [di+4]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		or	ax, ax
		jz	short loc_54B78

loc_54B73:
		mov	ax, 1
		jmp	short loc_54B7A

loc_54B78:
		xor	ax, ax

loc_54B7A:
		or	ax, ax
		jz	short loc_54B82
		mov	ax, di
		jmp	short loc_54B8E

loc_54B82:
		inc	[bp+var_2]

loc_54B85:
		mov	ax, [si]
		cmp	ax, [bp+var_2]
		jg	short loc_54B2D
		xor	ax, ax

loc_54B8E:
		pop	di
		pop	si
		leave
		retf
Scene_FindMatchingByAreaContainment_54B1B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_FindByArea_532AD (sub_532AD de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, lue
; intégralement. Renvoie le premier record de scène (pas de 39 octets) dont le pointeur de
; zone (+4) est égal à la zone donnée, ou 0. Appelée avec une zone nulle par
; MissionScenario_LoadMainRecord_A8331 pour trouver la scène globale (rangée en
; MissionScenario+78, erreur 36889 si absente), et par les opcodes 0x80, 0x81 et 0x82 avec la
; zone d'un index AREA. Ex-'Expr_Node_Accessor' (corrigé 2026-10-30).
; ==============================================================================================
Scene_FindByArea_54B92		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_54BC6

loc_54B9D:
		mov	ax, cx
		imul	ax, ax, 27h
		mov	bx, [si+2]
		add	bx, ax
		mov	ax, [bx+6]
		mov	dx, [bx+4]
		cmp	ax, [bp+arg_4]
		jnz	short loc_54BC5
		cmp	dx, [bp+arg_2]
		jnz	short loc_54BC5
		mov	ax, cx
		imul	ax, ax, 27h
		push	ax
		mov	ax, [si+2]
		pop	dx
		add	ax, dx
		jmp	short loc_54BCC

loc_54BC5:
		inc	cx

loc_54BC6:
		cmp	[si], cx
		jg	short loc_54B9D
		xor	ax, ax

loc_54BCC:
		pop	si
		pop	bp
		retf
Scene_FindByArea_54B92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_DetectAndActivateChange_532EA (sub_532EA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, 55
; lignes, LUE INTEGRALEMENT. RENOMMEE (ancien nom
; 'MissionFormation_HandleGroupSelectionChange' etait errone — aucun rapport avec une
; formation). Appelle Scene_FindMatchingByAreaContainment_53236 pour resoudre la scene active
; courante ; si elle a change depuis le dernier appel (different du parametre previousScene),
; lance le script de sortie de l'ancienne (Scene_RunLeavingScript_53211) et active la nouvelle
; via Scene_TriggerActivation_531CD, en mettant a jour un traqueur global de 'scene courante'
; (word_706A0+0x52).
; ==============================================================================================
Scene_DetectAndActivateChange_54BCF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	[bp+arg_2]
		push	ax
		push	cs
		call	near ptr Scene_FindMatchingByAreaContainment_54B1B
		add	sp, 4
		mov	si, ax
		cmp	si, di
		jz	short loc_54C16
		or	di, di
		jz	short loc_54BF5
		push	di
		push	cs
		call	near ptr Scene_RunLeavingScript_54AF6
		pop	cx

loc_54BF5:
		or	si, si
		jz	short loc_54C14
		push	si
		push	cs
		call	near ptr Scene_TriggerActivation_54AB2
		pop	cx
		mov	bx, word_79B8C
		cmp	[bx+63h], si
		jz	short loc_54C0D
		nop
		push	cs
		call	near ptr Expr_Node_UpdateSelectionCounters_55EDC

loc_54C0D:
		mov	bx, word_79B8C
		mov	[bx+63h], si

loc_54C14:
		mov	di, si

loc_54C16:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
Scene_DetectAndActivateChange_54BCF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54C1C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	67ADh
		call	sub_1E610
		add	sp, 4
		pop	bp
		retf
sub_54C1C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObjects_AddToList_5334D (sub_5334D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; ajoute l'objet passé en argument (arg_2) à la liste de tag 0x59C3 via
; List_AppendIfNonNull_21F8D. Appelée par AIAircraft_SpawnAndConditionalLoadProfile_53363 pour
; l'objet qu'elle vient de créer. Anciennement Expr_Node_RegisterListener (aucun rapport avec
; un écouteur Expr_VM dans ce corps).
; ==============================================================================================
WorldObjects_AddToList_54C32		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		pop	bp
		retf
WorldObjects_AddToList_54C32		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54C48		proc far

var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= byte ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 1
		mov	eax, [bp+arg_6]
		mov	[bp+var_A], eax
		mov	[bp+var_6], eax
		push	8
		push	ds
		push	offset aPLAYER
		push	large [bp+var_6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_54C7E
		mov	ax, 1
		jmp	short loc_54C80

loc_54C7E:
		xor	ax, ax

loc_54C80:
		or	al, al
		jz	short loc_54C88
		mov	[bp+var_2], 2

loc_54C88:
		push	8
		push	ds
		push	offset aNETWORK
		push	large [bp+var_6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_54CA3
		mov	ax, 1
		jmp	short loc_54CA5

loc_54CA3:
		xor	ax, ax

loc_54CA5:
		or	al, al
		jz	short loc_54CAD
		mov	[bp+var_2], 3

loc_54CAD:
		mov	eax, [bp+arg_2]
		mov	[bp+var_E], eax
		mov	al, [bp+var_2]
		mov	[bp+var_10], al
		push	1
		push	ax
		push	large [bp+var_E]
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jnz	short loc_54CD6
		jmp	loc_54DC0

loc_54CD6:
		mov	cx, [bp+arg_A]
		mov	bx, cx
		mov	eax, [bx]
		mov	[di+12h], eax
		mov	eax, [bx+4]
		mov	[di+16h], eax
		mov	eax, [bx+8]
		mov	[di+1Ah], eax
		mov	ax, di
		add	ax, 12h
		push	di
		mov	bx, [di]
		call	dword ptr [bx+8]
		pop	cx
		push	[bp+arg_C]
		push	di
		mov	bx, [di]
		call	dword ptr [bx+44h]
		add	sp, 4
		mov	eax, [bp+arg_6]
		mov	[bp+var_14], eax
		mov	[di+6], eax
		cmp	[bp+arg_E], 0
		jnz	short loc_54D1F
		jmp	loc_54DB5

loc_54D1F:
		mov	ax, [bp+arg_E]
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_1A], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	cx, ax
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_26], eax
		mov	eax, [bx+4]
		mov	[bp+var_22], eax
		mov	eax, [bx+8]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1A]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_26]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_22]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_22], eax
		mov	eax, [bp+var_1E]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1E], eax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 4

loc_54DB5:
		push	di
		push	si
		push	cs
		call	near ptr WorldObjects_AddToList_54C32
		add	sp, 4
		jmp	short loc_54DC9

loc_54DC0:
		push	9022h
		call	sub_1DDFE
		pop	cx

loc_54DC9:
		mov	al, [di+2]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh
		jnz	short loc_54DDB
		mov	ax, 1
		jmp	short loc_54DDD

loc_54DDB:
		xor	ax, ax

loc_54DDD:
		or	al, al
		jz	short loc_54DEE
		cmp	[bp+var_2], 2
		jz	short loc_54DEE
		push	di
		call	sub_743EA
		pop	cx

loc_54DEE:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_54C48		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Expr_VM_OpcodeHelperA_53504 (sub_53504 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelée par
; l'opcode VM +0xA38 ; appels externes sub_2E74/sub_238CE/sub_23CCC (rôle exact non détaillé).
; ==============================================================================================
Expr_VM_OpcodeHelperA_54DF4		proc far

var_16		= dword ptr -16h
var_12		= word ptr -12h
var_A		= byte ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	[bp+var_8], 0
		cmp	[si+2Eh], dx
		jbe	short loc_54E23
		mov	ax, dx
		imul	ax, ax, 9
		mov	dx, [si+32h]
		mov	bx, [si+30h]
		add	bx, ax
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], bx
		jmp	short loc_54E23

loc_54E23:
		mov	ax, word ptr [bp+var_8+2]
		mov	dx, word ptr [bp+var_8]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	eax, [bp+var_4]
		mov	[bp+var_16], eax
		push	8
		push	large [bp+var_16]
		push	ds
		lea	ax, [bp+var_12]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		mov	[bp+var_A], 0
		push	ds
		lea	ax, [bp+var_12]
		push	ax
		push	67B7h
		call	sub_73791
		add	sp, 6
		mov	bx, ax
		mov	dx, [bx+0Eh]
		or	dx, dx
		jz	short loc_54E73
		push	dx
		push	67B7h
		call	sub_737D2
		add	sp, 4

loc_54E73:
		pop	si
		leave
		retf
Expr_VM_OpcodeHelperA_54DF4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_54E76		proc far

var_38		= word ptr -38h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_B		= byte ptr -0Bh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 38h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, word_7CADA
		cmp	word_7CADA, 0
		jnz	short loc_54E8F
		jmp	loc_54FCC

loc_54E8F:
		mov	al, byte_77698
		mov	ah, 0
		or	ax, ax
		jz	short loc_54E9B
		jmp	loc_54FCC

loc_54E9B:
		mov	bx, [di+52h]
		mov	al, [bx+20h]
		mov	[bp+var_1], al
		push	29Bh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_54EC8
		cmp	[bp+var_1], 0
		jz	short loc_54EC3
		cmp	byte_78EB6, 0
		jz	short loc_54EC3
		mov	ax, 1
		jmp	short loc_54EC5

loc_54EC3:
		xor	ax, ax

loc_54EC5:
		mov	[bp+var_1], al

loc_54EC8:
		push	di
		push	ss
		lea	ax, word ptr [bp+var_2C]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_24]
		push	large [bp+var_28]
		push	large [bp+var_2C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	[bp+var_6], eax
		cmp	word ptr [si+5Fh], 0
		jz	short loc_54F16
		push	large 0
		mov	bx, [si+5Fh]
		push	large [bx+10h]
		mov	ax, [bx+2]
		add	ax, 40h
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_530DB
		add	sp, 0Ah
		jmp	short loc_54F16

loc_54F16:
		push	29Ah
		call	GameVar_Get_56414
		pop	cx
		mov	[bp+var_B], al
		mov	dl, [bp+var_B]
		or	dl, byte_78EBA
		cmp	byte ptr [di+5Eh], 0
		jz	short loc_54F34
		mov	al, 0
		jmp	loc_54FCE

loc_54F34:
		cmp	[bp+var_1], 0
		jz	short loc_54F65
		or	dl, dl
		jz	short loc_54F65
		mov	[bp+var_10], 500h
		mov	eax, [bp+var_6]
		cmp	eax, [bp+var_10]
		jge	short loc_54F55
		mov	ax, 1
		jmp	short loc_54F57

loc_54F55:
		xor	ax, ax

loc_54F57:
		or	al, al
		jz	short loc_54F65
		cmp	byte ptr [si+19h], 0
		jz	short loc_54F65
		mov	al, 1
		jmp	short loc_54FCE

loc_54F65:
		cmp	word_7977C, 6
		jbe	short loc_54FCC
		push	1
		lea	ax, [bp+var_38]
		push	ax
		mov	ax, word_7CADA
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_14]
		push	ax
		call	Ground_HeightUnderPoint_3664D
		add	sp, 0Ch
		mov	bx, word_7CADA
		mov	eax, [bx+1Ah]
		sub	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	[bp+var_14], eax
		mov	al, [si+19h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_54FCC
		mov	[bp+var_20], 6400h
		mov	eax, [bp+var_14]
		cmp	eax, [bp+var_20]
		jle	short loc_54FC2
		mov	ax, 1
		jmp	short loc_54FC4

loc_54FC2:
		xor	ax, ax

loc_54FC4:
		or	al, al
		jz	short loc_54FCC
		mov	byte ptr [si+19h], 1

loc_54FCC:
		mov	al, 0

loc_54FCE:
		pop	di
		pop	si
		leave
		retf
sub_54E76		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. (scripts) Même ordre que MAIN_GAME_TICK de STRIKE.EXE :
; Scene_RunUpdateScript_54AD7 (scène globale [+95]), Scene_DetectAndActivateChange_54BCF,
; Scene_RunUpdateScript_54AD7 (scène courante [+97]),
; PartEntry_DispatchMissionUpdateTick_5471E, puis sub_5093D / sub_54E76.
; ==============================================================================================
MAIN_GAME_TICK_54FD2		proc far

var_12		= dword ptr -12h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, word_775E3
		jz	short loc_54FEE
		mov	al, byte_7CAC3
		mov	ah, 0
		jmp	short loc_54FF0

loc_54FEE:
		xor	ax, ax

loc_54FF0:
		cmp	ax, 2Fh
		jnz	short loc_5505C
		cmp	byte_7CAC2, 1
		jnz	short loc_5500C
		test	byte_7CAC5, 0C0h
		jz	short loc_55008
		mov	ax, 1
		jmp	short loc_5500A

loc_55008:
		xor	ax, ax

loc_5500A:
		jmp	short loc_55021

loc_5500C:
		cmp	byte_7D348, 1
		jz	short loc_5501A
		cmp	byte_7D369, 1
		jnz	short loc_5501F

loc_5501A:
		mov	ax, 1
		jmp	short loc_55021

loc_5501F:
		xor	ax, ax

loc_55021:
		or	al, al
		jz	short loc_5505C
		push	68D0h
		push	5EAh
		push	word_76D18
		push	word_76D16
		push	3471h
		push	5EBh
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		sub	sp, 4
		mov	[bp+var_12], 500h
		push	ds
		push	offset aF118ByeBye
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch

loc_5505C:
		mov	ax, si
		add	ax, 79h
		push	ax
		call	sub_1AC8A
		pop	cx
		cmp	word ptr [si+5Fh], 0
		jz	short loc_55076
		push	word ptr [si+5Fh]
		push	cs
		call	near ptr Scene_RunUpdateScript_54AD7
		pop	cx

loc_55076:
		push	word ptr [si+61h]
		cmp	dword ptr [si+65h], 0
		jz	short loc_55097
		push	large [si+65h]
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	cs
		call	near ptr sub_544F5
		add	sp, 8
		mov	dx, ss
		lea	ax, word ptr [bp+var_C]
		jmp	short loc_550B4

loc_55097:
		mov	eax, dword_79CEC
		mov	[bp+var_C], eax
		mov	eax, dword_79CF0
		mov	[bp+var_8], eax
		mov	eax, dword_79CF4
		mov	[bp+var_4], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_C]

loc_550B4:
		lea	ax, word ptr [bp+var_C]
		push	ax
		mov	ax, si
		add	ax, 3Ah
		push	ax
		push	cs
		call	near ptr Scene_DetectAndActivateChange_54BCF
		add	sp, 6
		mov	[si+61h], ax
		cmp	word ptr [si+61h], 0
		jz	short loc_550D6
		push	word ptr [si+61h]
		push	cs
		call	near ptr Scene_RunUpdateScript_54AD7
		pop	cx

loc_550D6:
		mov	ax, si
		add	ax, 34h
		push	ax
		push	cs
		call	near ptr PartEntry_DispatchMissionUpdateTick_5471E
		pop	cx
		call	Input_AltKeyDetailToggles_5093D
		or	al, al
		jz	short loc_550FB
		push	si
		push	cs
		call	near ptr sub_54E76
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_550FB
		mov	ax, 1
		jmp	short loc_550FD

loc_550FB:
		xor	ax, ax

loc_550FD:
		pop	si
		leave
		retf
MAIN_GAME_TICK_54FD2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55100		proc far

var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_5510B:
		mov	byte_79B9B, 0
		call	sub_7524A
		mov	al, byte_79B8E
		mov	ah, 0
		push	ax
		call	Music_SetPendingTune_5ED30
		pop	cx
		call	sub_23584
		jmp	loc_551EE

loc_55129:
		call	sub_50F18
		cmp	byte_77698, 0
		jz	short loc_5516C
		mov	al, byte_77699
		push	ax
		mov	al, byte_7769D
		push	ax
		push	word_7CADA
		call	sub_731E9
		add	sp, 6
		or	al, al
		jz	short loc_55167
		mov	al, byte_77537
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5516C
		mov	byte_79B9B, 3
		push	258h
		call	GameVar_SetFlag_5646D
		pop	cx
		jmp	loc_55202

loc_55167:
		mov	byte_77698, 0

loc_5516C:
		cmp	byte_7769E, 0
		jz	short loc_551BD
		mov	byte_77698, 1
		sub	dword_79B97, 9600h
		push	word_7CADA
		call	sub_7321A
		pop	cx
		or	al, al
		jz	short loc_551A6
		mov	al, byte_77537
		mov	ah, 0
		or	ax, ax
		jnz	short loc_55202
		cmp	byte_79B9B, 0
		jnz	short loc_55202
		mov	byte_79B9B, 2
		jmp	short loc_55202

loc_551A6:
		mov	al, byte_77537
		mov	ah, 0
		or	ax, ax
		jnz	short loc_55202
		cmp	byte_79B9B, 0
		jnz	short loc_55202
		mov	byte_79B9B, 3
		jmp	short loc_55202

loc_551BD:
		cmp	byte_7769F, 0
		jz	short loc_551EE
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_551DD
		push	ax
		call	sub_730E0
		pop	cx
		mov	ax, di
		jmp	short loc_551DF

loc_551DD:
		mov	ax, di

loc_551DF:
		mov	[bp+var_12], ax
		push	ax
		call	sub_3B2
		pop	cx
		mov	byte_7769F, 0

loc_551EE:
		push	si
		push	cs
		call	near ptr MAIN_GAME_TICK_54FD2
		pop	cx
		or	al, al
		jz	short loc_55202
		cmp	byte_79B9B, 0
		jnz	short loc_55202
		jmp	loc_55129

loc_55202:
		push	0
		call	sub_1B9E8
		pop	cx
		cmp	byte_79B9B, 6
		jnz	short loc_5521B
		push	si
		call	sub_752B7
		pop	cx
		jmp	loc_5510B

loc_5521B:
		cmp	word ptr [si+5Fh], 0
		jz	short loc_5523B
		push	large 0
		mov	bx, [si+5Fh]
		push	large [bx+10h]
		mov	ax, [bx+2]
		add	ax, 40h
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_530DB
		add	sp, 0Ah
		jmp	short loc_5523B

loc_5523B:
		push	0FFh
		call	GameVar_Get_56414
		pop	cx
		add	ax, 100h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_55268
		mov	[bp+var_6], 15E00h
		mov	eax, [bp+var_6]
		add	dword_79B97, eax

loc_55268:
		cmp	word ptr [si+5Fh], 0
		jz	short loc_55288
		push	large 0
		mov	bx, [si+5Fh]
		push	large [bx+10h]
		mov	ax, [bx+2]
		add	ax, 40h
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_530DB
		add	sp, 0Ah
		jmp	short loc_55288

loc_55288:
		mov	al, [si+0C8h]
		mov	[bp+var_7], al
		cmp	[bp+var_7], 0
		jnz	short loc_552C7
		cmp	word ptr [si+5Fh], 0
		jz	short loc_552B5
		push	large 0
		mov	bx, [si+5Fh]
		push	large [bx+10h]
		mov	ax, [bx+2]
		add	ax, 40h
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_530DB
		add	sp, 0Ah
		jmp	short loc_552B5

loc_552B5:
		push	29Ah
		call	GameVar_Get_56414
		pop	cx
		mov	[bp+var_8], al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_552D8

loc_552C7:
		mov	[bp+var_C], 6400h
		mov	eax, [bp+var_C]
		sub	dword_79B97, eax

loc_552D8:
		push	si
		call	sub_752C6
		pop	cx
		call	sub_5EFE1
		cmp	word_79E71, 0
		jz	short loc_5532E
		mov	bx, word_79E71
		cmp	byte ptr [bx+1Dh], 0
		jz	short loc_55316
		cmp	dword ptr [bx+18h], 0
		jz	short loc_55316
		push	0
		mov	al, [bx+1Ch]
		push	ax
		mov	ax, word_79E71
		add	ax, 18h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_55316

loc_55316:
		mov	bx, word_79E71
		mov	dword ptr [bx+18h], 0
		mov	byte ptr [bx+1Dh], 0
		mov	dword ptr [bx+1Eh], 0

loc_5532E:
		cmp	byte_7CE19, 0
		jz	short loc_55353
		cmp	dword_7CE14, 0
		jz	short loc_55353
		push	0
		mov	al, byte_7CE18
		push	ax
		push	66E4h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_55353

loc_55353:
		mov	dword_7CE14, 0
		mov	byte_7CE19, 0
		mov	dword_7CE1A, 0
		cmp	byte_7C9A1, 0
		jz	short loc_55398
		cmp	dword_7C99C, 0
		jz	short loc_55398
		push	0
		mov	al, byte_7C9A0
		push	ax
		mov	eax, dword_7C99C
		mov	[bp+var_10], eax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_55398

loc_55398:
		mov	dword_7C99C, 0
		mov	byte_7C9A1, 0
		mov	dword_7C9A2, 0
		mov	al, byte_79B9B
		pop	di
		pop	si
		leave
		retf
sub_55100		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_553B6		proc far

var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_7		= byte ptr -7
var_6		= byte ptr -6
var_4		= byte ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	word_79B8C
		nop
		push	cs
		call	near ptr sub_55763
		add	sp, 6
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_553EC
		push	di
		mov	bx, [di]
		call	dword ptr [bx+38h]
		pop	cx
		or	ax, ax
		jz	short loc_553EC
		push	di
		mov	bx, [di]
		call	dword ptr [bx+38h]
		pop	cx
		mov	di, ax

loc_553EC:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_553FF
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_55401

loc_553FF:
		mov	al, 1Ch

loc_55401:
		mov	[bp+var_2], al
		mov	[bp+var_4], 0
		or	di, di
		jz	short loc_55418
		test	byte ptr [di+2], 10h
		jz	short loc_55418
		mov	al, [di+51h]
		mov	[bp+var_4], al

loc_55418:
		mov	[bp+var_6], 0
		or	si, si
		jz	short loc_5542C
		test	byte ptr [si+2], 10h
		jz	short loc_5542C
		mov	al, [si+51h]
		mov	[bp+var_6], al

loc_5542C:
		mov	[bp+var_7], 0
		cmp	[bp+var_2], 6
		jnz	short loc_55451
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+92h]
		shr	ax, 5
		and	ax, 1
		mov	[bp+var_7], al

loc_55451:
		push	si
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		push	cs
		call	near ptr Expr_Node_Accessor_546E4
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_554BA
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_55480
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_55482

loc_55480:
		mov	al, 1Ch

loc_55482:
		cmp	al, 6
		jnz	short loc_554B2
		les	bx, word ptr [bp+var_C]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		mov	ah, 0
		or	ax, ax
		jnz	short loc_554B2
		cmp	byte ptr es:[bx+31h], 0FFh
		jnz	short loc_554A4
		inc	word_79B95

loc_554A4:
		les	bx, word ptr [bp+var_C]
		cmp	byte ptr es:[bx+31h], 1
		jnz	short loc_554B2
		inc	word_79B91

loc_554B2:
		les	bx, word ptr [bp+var_C]
		or	byte ptr es:[bx+39h], 2

loc_554BA:
		mov	[bp+var_10], 0
		or	di, di
		jz	short loc_554DB
		push	di
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		push	cs
		call	near ptr Expr_Node_Accessor_546E4
		add	sp, 4
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax

loc_554DB:
		cmp	[bp+var_10], 0
		jnz	short loc_5553E
		cmp	[bp+var_2], 6
		jnz	short loc_5550B
		mov	di, [si+73h]
		or	di, di
		jnz	short loc_554F4
		mov	di, [bp+arg_2]
		jmp	short loc_5553E

loc_554F4:
		push	di
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		push	cs
		call	near ptr Expr_Node_Accessor_546E4
		add	sp, 4
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		jmp	short loc_5553E

loc_5550B:
		cmp	[bp+var_2], 18h
		jz	short loc_55517
		cmp	[bp+var_2], 17h
		jnz	short loc_5553E

loc_55517:
		push	si
		nop
		push	cs
		call	sub_561FC
		pop	cx
		mov	di, ax
		or	di, di
		jnz	short loc_55529
		mov	di, [bp+arg_2]
		jmp	short loc_5553E

loc_55529:
		push	di
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		push	cs
		call	near ptr Expr_Node_Accessor_546E4
		add	sp, 4
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax

loc_5553E:
		cmp	[bp+var_10], 0
		jz	short loc_555BE
		mov	al, [bp+var_7]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_555BE
		mov	al, [bp+var_6]
		cmp	al, [bp+var_4]
		jz	short loc_555BE
		cmp	[bp+var_2], 6
		jnz	short loc_55565
		les	bx, word ptr [bp+var_10]
		inc	word ptr es:[bx+3Eh]
		jmp	short loc_555BE

loc_55565:
		cmp	[bp+var_2], 17h
		jz	short loc_55571
		cmp	[bp+var_2], 18h
		jnz	short loc_5557A

loc_55571:
		les	bx, word ptr [bp+var_10]
		inc	word ptr es:[bx+42h]
		jmp	short loc_555BE

loc_5557A:
		test	byte ptr [si+2], 40h
		jz	short loc_55590
		mov	al, [si+2]
		and	al, 8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_55590
		mov	ax, 1
		jmp	short loc_55592

loc_55590:
		xor	ax, ax

loc_55592:
		or	al, al
		jnz	short loc_555B7
		mov	al, [si+2]
		and	al, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_555B1
		mov	al, [si+2]
		and	al, 8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_555B1
		mov	ax, 1
		jmp	short loc_555B3

loc_555B1:
		xor	ax, ax

loc_555B3:
		or	al, al
		jz	short loc_555BE

loc_555B7:
		les	bx, word ptr [bp+var_10]
		inc	word ptr es:[bx+40h]

loc_555BE:
		cmp	si, word_7CADA
		jnz	short loc_555D8
		mov	[bp+var_12], di
		push	[bp+var_12]
		push	63ACh
		call	SetReference16
		add	sp, 4
		jmp	loc_55733

loc_555D8:
		mov	al, byte_77698
		mov	ah, 0
		or	ax, ax
		jz	short loc_555E4
		jmp	loc_55733

loc_555E4:
		mov	al, [bp+var_2]
		mov	ah, 0
		mov	[bp+var_16], ax
		mov	cx, 7
		mov	bx, offset word_55747

loc_555F2:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_16]
		jz	short loc_55602
		add	bx, 2
		loop	short loc_555F2
		jmp	loc_55729

loc_55602:
		jmp	word ptr cs:[bx+0Eh] ; switch jump

loc_55606:
		mov	al, [bp+var_7]
		mov	ah, 0
		or	ax, ax
		jz	short loc_55612
		jmp	loc_55729

loc_55612:
		cmp	[bp+var_6], 0FFh
		jz	short loc_5561B
		jmp	loc_5569B

loc_5561B:
		push	si
		call	Music_OnObjectDestroyed_5EE68
		pop	cx
		mov	ah, 0
		or	ax, ax
		jz	short loc_5562B
		jmp	loc_556BD

loc_5562B:
		cmp	di, word_7CADA
		jz	short loc_55634
		jmp	loc_556BD

loc_55634:
		mov	al, [bp+var_2]
		mov	ah, 0
		mov	[bp+var_18], ax
		mov	cx, 4
		mov	bx, offset word_55737

loc_55642:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_18]
		jz	short loc_55651
		add	bx, 2
		loop	short loc_55642
		jmp	short loc_55663

loc_55651:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_55655:
		mov	[bp+var_1A], 10h
		jmp	short loc_55668

loc_5565C:
		mov	[bp+var_1A], 0Ch
		jmp	short loc_55668

loc_55663:
		mov	[bp+var_1A], 0Fh

loc_55668:
		cmp	[bp+var_1A], 0FFFFh
		jz	short loc_556BD
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 64h
		mov	ebx, 8000h
		cdq
		idiv	ebx
		cmp	ax, 0Bh
		jge	short loc_55690
		mov	[bp+var_1A], 0Fh

loc_55690:
		push	[bp+var_1A]
		call	Music_SetPendingTune_5ED30
		pop	cx
		jmp	short loc_556BD

loc_5569B:
		cmp	[bp+var_6], 1
		jnz	short loc_556BD
		mov	ax, 2
		call	Math_RandomScale_56C2F
		cmp	ax, 1
		jnz	short loc_556B3
		mov	ax, 13h
		jmp	short loc_556B6

loc_556B3:
		mov	ax, 4

loc_556B6:
		push	ax
		call	Music_SetPendingTune_5ED30
		pop	cx

loc_556BD:
		or	di, di
		jz	short loc_55729
		mov	byte_776A1, 0
		cmp	[bp+arg_2], 0
		jz	short loc_556F4
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_556E9
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_556EB

loc_556E9:
		mov	al, 1Ch

loc_556EB:
		cmp	al, 0Dh
		jnz	short loc_556F4
		mov	byte_776AE, 1

loc_556F4:
		mov	[bp+var_14], di
		push	[bp+var_14]
		push	63ACh
		call	SetReference16
		add	sp, 4
		mov	al, [bp+var_4]
		cmp	al, [bp+var_6]
		jnz	short loc_55714
		mov	byte_776A8, 1
		jmp	short loc_55729

loc_55714:
		mov	al, [bp+var_4]
		cbw
		push	ax
		mov	al, [bp+var_6]
		cbw
		neg	ax
		pop	dx
		cmp	dx, ax
		jnz	short loc_55729
		mov	byte_776A9, 1

loc_55729:
		push	di
		push	si
		call	UIScreen_SetWidgetValue_5160F
		add	sp, 4

loc_55733:
		pop	di
		pop	si
		leave
		retf
sub_553B6		endp

; START OF FUNCTION CHUNK FOR sub_553B6
word_55737	dw 1
		dw 6
		dw 13h
		dw 14h
off_5573F	dw offset loc_5565C
		dw offset loc_55655
		dw offset loc_5565C
		dw offset loc_5565C
word_55747	dw 1
		dw 6
		dw 13h
		dw 14h
		dw 15h
		dw 17h
		dw 18h
off_55755	dw offset loc_55606
		dw offset loc_55606
		dw offset loc_55606
		dw offset loc_55606
		dw offset loc_55606
		dw offset loc_55606
		dw offset loc_55606
; END OF FUNCTION CHUNK FOR sub_553B6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55763		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= byte ptr -0Ch
var_A		= byte ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	[bp+arg_4], 0
		jnz	short loc_5577A
		jmp	loc_559B5

loc_5577A:
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_55793
		push	ax
		mov	bx, [bp+var_4]
		mov	bx, [bx]
		call	dword ptr [bx+38h]
		pop	cx
		mov	[bp+var_4], ax

loc_55793:
		cmp	[bp+var_4], 0
		jz	short loc_557B0
		push	[bp+var_4]
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		push	cs
		call	near ptr Expr_Node_Accessor_546E4
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax

loc_557B0:
		cmp	[bp+var_8], 0
		jnz	short loc_557F5
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_557CA
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_557CC

loc_557CA:
		mov	al, 1Ch

loc_557CC:
		cmp	al, 6
		jnz	short loc_557F5
		mov	ax, [di+73h]
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_557E4
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		jmp	short loc_557F5

loc_557E4:
		push	[bp+var_4]
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		push	cs
		call	near ptr Expr_Node_Accessor_546E4
		add	sp, 4

loc_557F5:
		mov	ax, [bp+var_4]
		cmp	ax, word_7CADA
		jz	short loc_55801
		jmp	loc_559B5

loc_55801:
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_55814
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_55816

loc_55814:
		mov	al, 1Ch

loc_55816:
		mov	[bp+var_A], al
		mov	al, [di+51h]
		mov	[bp+var_C], al
		mov	al, [bp+var_A]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	cx, 6
		mov	bx, offset word_559C5

loc_5582D:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_2]
		jz	short loc_5583D
		add	bx, 2
		loop	short loc_5582D
		jmp	loc_558F9

loc_5583D:
		jmp	word ptr cs:[bx+0Ch] ; switch jump

loc_55841:
		les	bx, [di+0Eh]
		mov	al, es:[bx+35h]
		mov	ah, 0
		sub	ax, 8
		mov	bx, ax
		cmp	bx, 5
		ja	short loc_55879
		shl	bx, 1
		jmp	cs:off_559B9[bx]	; switch jump

loc_5585B:
		mov	si, 3E8h
		jmp	short loc_5587C

loc_55860:
		mov	si, 320h
		jmp	short loc_5587C

loc_55865:
		mov	si, 190h
		jmp	short loc_5587C

loc_5586A:
		mov	si, 0C8h
		jmp	short loc_5587C

loc_5586F:
		mov	si, 258h
		jmp	short loc_5587C

loc_55874:
		mov	si, 32h
		jmp	short loc_5587C

loc_55879:
		mov	si, 32h

loc_5587C:
		cmp	[bp+var_C], 1
		jnz	short loc_5588D
		mov	dx, 0FFFDh
		mov	ax, si
		imul	dx
		mov	si, ax
		jmp	short loc_558FB

loc_5588D:
		cmp	[bp+var_C], 0
		jnz	short loc_558FB
		xor	si, si
		jmp	short loc_558FB

loc_55897:
		cmp	[bp+var_C], 1
		jnz	short loc_558A2
		mov	si, 0FF6Ah
		jmp	short loc_558FB

loc_558A2:
		cmp	[bp+var_C], 0FFh
		jnz	short loc_558AD
		mov	si, 46h
		jmp	short loc_558FB

loc_558AD:
		cmp	[bp+var_C], 0
		jnz	short loc_558FB
		xor	si, si
		jmp	short loc_558FB

loc_558B7:
		cmp	[bp+var_C], 1
		jnz	short loc_558C2
		mov	si, 0FF9Ch
		jmp	short loc_558FB

loc_558C2:
		cmp	[bp+var_C], 0FFh
		jnz	short loc_558CD
		mov	si, 32h
		jmp	short loc_558FB

loc_558CD:
		cmp	[bp+var_C], 0
		jnz	short loc_558FB
		mov	si, 14h
		jmp	short loc_558FB

loc_558D8:
		cmp	[bp+var_C], 1
		jnz	short loc_558E3
		mov	si, 0FF9Ch
		jmp	short loc_558FB

loc_558E3:
		cmp	[bp+var_C], 0FFh
		jnz	short loc_558EE
		mov	si, 32h
		jmp	short loc_558FB

loc_558EE:
		cmp	[bp+var_C], 0
		jnz	short loc_558FB
		mov	si, 19h
		jmp	short loc_558FB

loc_558F9:
		xor	si, si

loc_558FB:
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	[bp+var_10], eax
		mov	al, byte_7CB0A
		mov	ah, 0
		or	ax, ax
		jnz	short loc_55919
		sub	[bp+var_10], 7

loc_55919:
		cmp	byte_7CB0D, 0
		jz	short loc_55925
		sub	[bp+var_10], 4Ch

loc_55925:
		cmp	byte_7CB0E, 0
		jz	short loc_55931
		sub	[bp+var_10], 0Ch

loc_55931:
		cmp	word ptr byte_7CB11, 1
		jnz	short loc_5593D
		sub	[bp+var_10], 19h

loc_5593D:
		cmp	word ptr byte_7CB11, 2
		jnz	short loc_55949
		sub	[bp+var_10], 33h

loc_55949:
		cmp	word_7CB07, 1
		jnz	short loc_55955
		sub	[bp+var_10], 19h

loc_55955:
		cmp	word_7CB07, 2
		jnz	short loc_55961
		sub	[bp+var_10], 33h

loc_55961:
		mov	al, byte_7CB14
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5596F
		sub	[bp+var_10], 5

loc_5596F:
		mov	al, byte_7CB15
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5597D
		sub	[bp+var_10], 2

loc_5597D:
		cmp	[bp+var_10], 0
		jge	short loc_5598C
		mov	[bp+var_10], 0

loc_5598C:
		movsx	eax, si
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		add	dword_79B97, eax

loc_559B5:
		pop	di
		pop	si
		leave
		retf
sub_55763		endp

; START OF FUNCTION CHUNK FOR sub_55763
off_559B9	dw offset loc_5585B
		dw offset loc_55860
		dw offset loc_55865
		dw offset loc_5586A
		dw offset loc_5586F
		dw offset loc_55874
word_559C5	dw 1
		dw 6
		dw 13h
		dw 15h
		dw 17h
		dw 18h
off_559D1	dw offset loc_558B7
		dw offset loc_55897
		dw offset loc_558D8
		dw offset loc_558D8
		dw offset loc_55841
		dw offset loc_55841
; END OF FUNCTION CHUNK FOR sub_55763

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_559DD		proc far

var_6		= dword ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		xor	si, si
		mov	bx, word_79B8C
		mov	ax, [bx+34h]
		mov	[bp+var_2], ax
		mov	eax, [bx+36h]
		mov	[bp+var_6], eax
		xor	di, di
		jmp	short loc_55A6F

loc_559FD:
		les	bx, word ptr [bp+var_6]
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_55A6A
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_55A2F
		mov	al, es:[bx+39h]
		shl	ax, 0Dh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_55A2F
		mov	ax, 1
		jmp	short loc_55A31

loc_55A2F:
		xor	ax, ax

loc_55A31:
		or	al, al
		jz	short loc_55A6A
		les	bx, word ptr [bp+var_6]
		cmp	byte ptr es:[bx+31h], 1
		jnz	short loc_55A6A
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_55A63
		les	bx, word ptr [bp+var_6]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_55A65

loc_55A63:
		mov	al, 1Ch

loc_55A65:
		cmp	al, 6
		jnz	short loc_55A6A
		inc	si

loc_55A6A:
		inc	di
		add	word ptr [bp+var_6], 59h

loc_55A6F:
		cmp	di, [bp+var_2]
		jl	short loc_559FD
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_559DD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55A7A		proc far

var_6		= dword ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		xor	si, si
		mov	bx, word_79B8C
		mov	ax, [bx+34h]
		mov	[bp+var_2], ax
		mov	eax, [bx+36h]
		mov	[bp+var_6], eax
		xor	di, di
		jmp	short loc_55B0C

loc_55A9A:
		les	bx, word ptr [bp+var_6]
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_55B07
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_55ACC
		mov	al, es:[bx+39h]
		shl	ax, 0Dh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_55ACC
		mov	ax, 1
		jmp	short loc_55ACE

loc_55ACC:
		xor	ax, ax

loc_55ACE:
		or	al, al
		jz	short loc_55B07
		les	bx, word ptr [bp+var_6]
		cmp	byte ptr es:[bx+31h], 0FFh
		jnz	short loc_55B07
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_55B00
		les	bx, word ptr [bp+var_6]
		push	word ptr es:[bx+56h]
		mov	bx, es:[bx+56h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_55B02

loc_55B00:
		mov	al, 1Ch

loc_55B02:
		cmp	al, 6
		jnz	short loc_55B07
		inc	si

loc_55B07:
		inc	di
		add	word ptr [bp+var_6], 59h

loc_55B0C:
		cmp	di, [bp+var_2]
		jl	short loc_55A9A
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_55A7A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55B17		proc far

var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	ax, [bp+arg_0]
		xor	di, di
		mov	bx, word_79B8C
		mov	ax, [bx+34h]
		mov	[bp+var_2], ax
		mov	eax, [bx+36h]
		mov	[bp+var_6], eax
		mov	[bp+var_8], 0
		jmp	loc_55C63

loc_55B3E:
		les	bx, word ptr [bp+var_6]
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_55B52
		jmp	loc_55C5C

loc_55B52:
		mov	al, es:[bx+31h]
		cmp	al, [bp+arg_2]
		jz	short loc_55B5E
		jmp	loc_55C5C

loc_55B5E:
		mov	si, es:[bx+56h]
		or	si, si
		jz	short loc_55B7A
		test	byte ptr [si+2], 8
		jz	short loc_55B7A
		mov	al, [si+2]
		and	al, 40h
		mov	ah, 0
		or	ax, ax
		jnz	short loc_55B7A
		jmp	loc_55C5C

loc_55B7A:
		les	bx, word ptr [bp+var_6]
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_55B9E
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_55B9E
		mov	ax, 1
		jmp	short loc_55BA0

loc_55B9E:
		xor	ax, ax

loc_55BA0:
		or	al, al
		jz	short loc_55BA7
		jmp	loc_55C5C

loc_55BA7:
		les	bx, word ptr [bp+var_6]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_55BCB
		mov	al, es:[bx+39h]
		shl	ax, 0Dh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_55BCB
		mov	ax, 1
		jmp	short loc_55BCD

loc_55BCB:
		xor	ax, ax

loc_55BCD:
		or	al, al
		jnz	short loc_55BD4
		jmp	loc_55C5C

loc_55BD4:
		cmp	[bp+arg_4], 1
		jnz	short loc_55BE9
		or	si, si
		jz	short loc_55BE9
		mov	al, [si+2]
		and	al, 8
		mov	ah, 0
		or	ax, ax
		jz	short loc_55C5C

loc_55BE9:
		cmp	[bp+arg_8], 0
		jnz	short loc_55BF3
		inc	di
		jmp	short loc_55C5C

loc_55BF3:
		push	large [bp+var_6]
		push	ss
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	cs
		call	near ptr sub_544F5
		add	sp, 8
		mov	eax, [bp+var_28]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_14], eax
		mov	si, [bp+arg_6]
		mov	eax, [si]
		sub	[bp+var_1C], eax
		mov	eax, [si+4]
		sub	[bp+var_18], eax
		mov	eax, [si+8]
		sub	[bp+var_14], eax
		push	large [bp+var_14]
		push	large [bp+var_18]
		push	large [bp+var_1C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax
		cmp	eax, [bp+arg_8]
		jge	short loc_55C5C
		inc	di

loc_55C5C:
		inc	[bp+var_8]
		add	word ptr [bp+var_6], 59h

loc_55C63:
		mov	ax, [bp+var_8]
		cmp	ax, [bp+var_2]
		jge	short loc_55C6E
		jmp	loc_55B3E

loc_55C6E:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_55B17		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55C74		proc far

var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		mov	si, [bp+arg_4]
		xor	eax, eax
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		push	[bp+arg_6]
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		push	cs
		call	near ptr Expr_Node_Accessor_546E4
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_55CAE
		jmp	loc_55D7B

loc_55CAE:
		les	bx, word ptr [bp+var_4]
		or	byte ptr es:[bx+39h], 4
		push	dx
		push	ax
		push	cs
		call	near ptr TextScrollDisplayB_TickHelper_54567
		add	sp, 4
		or	al, al
		jz	short loc_55CF1
		push	ds
		mov	ax, si
		add	ax, 69h
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	cs
		call	near ptr sub_51C99
		add	sp, 8
		mov	eax, [bp+var_20]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_C], eax
		jmp	loc_55D7B

loc_55CF1:
		cmp	word ptr [si+61h], 0
		jnz	short loc_55CFA
		jmp	loc_55D7B

loc_55CFA:
		mov	bx, [si+61h]
		mov	ax, [bx+4]
		or	ax, [bx+6]
		jnz	short loc_55D0A
		mov	ax, 1
		jmp	short loc_55D0C

loc_55D0A:
		xor	ax, ax

loc_55D0C:
		or	ax, ax
		jz	short loc_55D2F
		mov	eax, dword_79CEC
		mov	[bp+var_2C], eax
		mov	eax, dword_79CF0
		mov	[bp+var_28], eax
		mov	eax, dword_79CF4
		mov	[bp+var_24], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_2C]
		jmp	short loc_55D63

loc_55D2F:
		mov	bx, [si+61h]
		mov	ax, [bx+6]
		mov	dx, [bx+4]
		add	dx, 22h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	[bp+var_2C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_28], eax
		mov	eax, es:[si+8]
		mov	[bp+var_24], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_2C]

loc_55D63:
		mov	eax, [bp+var_2C]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_C], eax

loc_55D7B:
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_55D86
		mov	ax, si
		jmp	short loc_55D90

loc_55D86:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_55D90:
		or	ax, ax
		jz	short loc_55DAF
		mov	eax, [bp+var_14]
		mov	[si], eax
		mov	eax, [bp+var_10]
		mov	[si+4], eax
		mov	eax, [bp+var_C]
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_55DB1

loc_55DAF:
		mov	ax, si

loc_55DB1:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_55C74		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55DBA		proc far
		push	bp
		mov	bp, sp
		mov	bx, word_79B8C
		les	bx, [bx+65h]
		mov	ax, es:[bx+56h]
		pop	bp
		retf
sub_55DBA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55DCA		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		cmp	word ptr [si+3Ah], 1
		jbe	short loc_55DE2
		mov	ax, [si+3Ch]
		add	ax, 27h
		jmp	short loc_55DE4

loc_55DE2:
		xor	ax, ax

loc_55DE4:
		mov	si, ax
		or	si, si
		jnz	short loc_55DED
		jmp	loc_55E9D

loc_55DED:
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		cmp	dword ptr [si+4], 0
		jnz	short loc_55E01
		mov	ax, 1
		jmp	short loc_55E03

loc_55E01:
		xor	ax, ax

loc_55E03:
		or	ax, ax
		jz	short loc_55E45
		cmp	word ptr [bp+var_4], 0
		jz	short loc_55E12
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_55E1D

loc_55E12:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_55E1D:
		or	ax, ax
		jz	short loc_55E3D
		mov	bx, word ptr [bp+var_4]
		mov	eax, dword_79CEC
		mov	[bx], eax
		mov	eax, dword_79CF0
		mov	[bx+4], eax
		mov	eax, dword_79CF4
		mov	[bx+8], eax
		jmp	short loc_55E3D

loc_55E3D:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_55E95

loc_55E45:
		mov	ax, [si+6]
		mov	dx, [si+4]
		add	dx, 22h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		cmp	word ptr [bp+var_4], 0
		jz	short loc_55E5F
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_55E6A

loc_55E5F:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_55E6A:
		or	ax, ax
		jz	short loc_55E8F
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	bx, word ptr [bp+var_4]
		mov	[bx], eax
		mov	eax, es:[si+4]
		mov	[bx+4], eax
		mov	eax, es:[si+8]
		mov	[bx+8], eax
		jmp	short loc_55E8F

loc_55E8F:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_55E95:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		jmp	short loc_55ED9

loc_55E9D:
		mov	si, word ptr [bp+arg_0]
		or	si, si
		jz	short loc_55EA8
		mov	ax, si
		jmp	short loc_55EB2

loc_55EA8:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_55EB2:
		or	ax, ax
		jz	short loc_55ED1
		mov	eax, dword_79CEC
		mov	[si], eax
		mov	eax, dword_79CF0
		mov	[si+4], eax
		mov	eax, dword_79CF4
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_55ED3

loc_55ED1:
		mov	ax, si

loc_55ED3:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]

loc_55ED9:
		pop	si
		leave
		retf
sub_55DCA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Expr_Node_UpdateSelectionCounters_544DC (sub_544DC de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, orchestrateur appelant
; Expr_Node_CountSelectedInTable_54043 puis Expr_Node_TableOperationB_540B2 — appelée par
; Expr_Node_RecomputeAllFields_532EA.
; ==============================================================================================
Expr_Node_UpdateSelectionCounters_55EDC		proc far
		push	bp
		mov	bp, sp
		push	cs
		call	near ptr sub_559DD
		mov	word_79B8F, ax
		mov	word_79B91, 0
		push	cs
		call	near ptr sub_55A7A
		mov	word_79B93, ax
		mov	word_79B95, 0
		mov	al, 0
		mov	byte_776A1, al
		mov	byte_776A0, al
		pop	bp
		retf
Expr_Node_UpdateSelectionCounters_55EDC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55F03		proc far

var_60		= dword ptr -60h
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 58h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, word_7CADA
		or	di, di
		jnz	short loc_55F1B
		mov	al, 0
		jmp	loc_561BA

loc_55F1B:
		mov	al, byte_76E25
		mov	ah, 0
		or	ax, ax
		jnz	short loc_55F59
		push	large [di+5Fh]
		call	sub_74570
		add	sp, 4
		mov	byte ptr [bp+var_24+3], al
		cmp	byte ptr [bp+var_24+3], 0
		jz	short loc_55F59
		sub	sp, 4
		mov	[bp+var_60], 500h
		push	ds
		push	offset aSTAYONTARGET
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		mov	al, 0
		jmp	loc_561BA

loc_55F59:
		mov	[bp+var_4], 1F400h
		mov	[bp+var_8], 3A9800h
		mov	[bp+var_C], 1F400h
		mov	bx, word_79B8C
		mov	al, [bx+80h]
		mov	ah, 0
		mov	cx, ax
		mov	dx, di
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp+var_34], eax
		mov	eax, [bx+4]
		mov	[bp+var_30], eax
		mov	eax, [bx+8]
		mov	[bp+var_2C], eax
		mov	bx, word_79B8C
		mov	ax, [bx+61h]
		mov	[bp+var_E], ax
		cmp	[bx+1Eh], cx
		jbe	short loc_55FB9
		mov	dx, [bx+22h]
		mov	ax, [bx+20h]
		mov	bx, cx
		shl	bx, 4
		add	ax, bx
		jmp	short loc_55FBD

loc_55FB9:
		xor	dx, dx
		xor	ax, ax

loc_55FBD:
		mov	[bp+var_10], dx
		mov	[bp+var_12], ax
		mov	ax, [bp+var_10]
		mov	dx, [bp+var_12]
		add	dx, 4
		mov	[bp+var_14], ax
		mov	[bp+var_16], dx
		les	dx, [bp+var_16]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[bp+var_40], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_3C], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_38], eax
		les	bx, [bp+var_12]
		mov	eax, es:[bx]
		mov	[bp+var_1A], eax
		cmp	[bp+var_1A], 0
		jz	short loc_56049
		mov	ax, word ptr [bp+var_1A+2]
		mov	dx, word ptr [bp+var_1A]
		add	dx, 22h
		mov	[bp+var_1C], ax
		mov	[bp+var_1E], dx
		les	dx, [bp+var_1E]
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[bp+var_4C], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_48], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_4C]
		add	[bp+var_40], eax
		mov	eax, [bp+var_48]
		add	[bp+var_3C], eax
		mov	eax, [bp+var_44]
		add	[bp+var_38], eax

loc_56049:
		lea	ax, word ptr [bp+var_40]
		push	ax
		mov	ax, word_79B8C
		add	ax, 3Ah
		push	ax
		push	cs
		call	near ptr Scene_FindMatchingByAreaContainment_54B1B
		add	sp, 4
		mov	[bp+var_20], ax
		mov	word ptr [bp+var_24+2], 1
		sub	sp, 4
		mov	eax, [bp+var_8]
		mov	[bp+var_60], eax
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	word ptr [bp+var_24+2]
		push	0FFh
		push	si
		push	cs
		call	near ptr sub_55B17
		add	sp, 0Ch
		or	ax, ax
		jz	short loc_560A4
		sub	sp, 4
		mov	[bp+var_60], 500h
		push	ds
		push	offset aENEMIESNEAR
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		mov	al, 0
		jmp	loc_561BA

loc_560A4:
		push	word ptr [di+52h]
		mov	bx, [di+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		add	ax, 8Ah
		mov	si, ax
		cmp	dword ptr [si], 0
		jg	short loc_560C0
		mov	ax, 1
		jmp	short loc_560C2

loc_560C0:
		xor	ax, ax

loc_560C2:
		or	al, al
		jz	short loc_560E6
		sub	sp, 4
		mov	[bp+var_60], 500h
		push	ds
		push	offset aOUTOFFUEL
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		mov	al, 0
		jmp	loc_561BA

loc_560E6:
		les	bx, [di+63h]
		cmp	byte ptr es:[bx+3Bh], 0
		jz	short loc_560F5
		mov	ax, 1
		jmp	short loc_560F7

loc_560F5:
		xor	ax, ax

loc_560F7:
		or	al, al
		jz	short loc_5610C
		les	bx, [di+63h]
		mov	al, es:[bx+3Bh]
		cmp	al, es:[bx]
		jb	short loc_5610C
		mov	ax, 1
		jmp	short loc_5610E

loc_5610C:
		xor	ax, ax

loc_5610E:
		or	al, al
		jz	short loc_56132
		sub	sp, 4
		mov	[bp+var_60], 500h
		push	ds
		push	offset aENGINEOUT
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		mov	al, 0
		jmp	loc_561BA

loc_56132:
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_561B8
		mov	ax, [bp+var_E]
		cmp	ax, [bp+var_20]
		jnz	short loc_561B8
		mov	eax, [bp+var_40]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_34]
		sub	[bp+var_58], eax
		mov	eax, [bp+var_30]
		sub	[bp+var_54], eax
		mov	eax, [bp+var_2C]
		sub	[bp+var_50], eax
		push	large [bp+var_50]
		push	large [bp+var_54]
		push	large [bp+var_58]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_28], eax
		mov	[bp+var_24], eax
		cmp	eax, [bp+var_4]
		jge	short loc_561B8
		sub	sp, 4
		mov	[bp+var_60], 500h
		push	ds
		push	offset aALREADYNEAR
		push	ds
		push	offset unk_7CEFE
		call	GlyphObject_Helper9_15CE5
		add	sp, 0Ch
		mov	al, 0
		jmp	short loc_561BA

loc_561B8:
		mov	al, 1

loc_561BA:
		pop	di
		pop	si
		leave
		retf
sub_55F03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; HUD_ResolveNodePosition_547B1 (sub_547B1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée DIRECTEMENT par
; HUD_RenderSymbologyMain (sub_3E744) — confirme l'usage du système GeomNode/Expr par le rendu
; HUD pour positionner des éléments de symbologie.
; ==============================================================================================
HUD_ResolveNodePosition_561BE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		cmp	eax, dword_79BFE
		jnz	short loc_561DF
		mov	eax, [si+4]
		cmp	eax, dword_79C02
		jnz	short loc_561DF
		mov	ax, 1
		jmp	short loc_561E1

loc_561DF:
		xor	ax, ax

loc_561E1:
		or	al, al
		jz	short loc_561E9
		mov	al, 1
		jmp	short loc_561EB

loc_561E9:
		mov	al, 0

loc_561EB:
		pop	si
		pop	bp
		retf
HUD_ResolveNodePosition_561BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_561EE		proc far
		push	bp
		mov	bp, sp
		mov	dword_79B97, 0
		pop	bp
		retf
sub_561EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_561FC		proc near

arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_2]
		cmp	word ptr [si+11Eh], 0
		jz	short loc_5622C
		push	word ptr [si+11Eh]
		mov	bx, [si+11Eh]
		mov	bx, [bx]
		call	dword ptr [bx+38h]
		pop	cx
		or	ax, ax
		jz	short loc_5622C
		push	word ptr [si+11Eh]
		mov	bx, [si+11Eh]
		mov	bx, [bx]
		call	dword ptr [bx+38h]
		pop	cx
		jmp	short loc_56230

loc_5622C:
		mov	ax, [si+11Eh]
sub_561FC		endp
seg125		ends
