seg114		segment	byte public 'CODE' use16
		assume cs:seg114
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, avance un pointeur far dans une table de chaînes empaquetées (séparateur 0) pour
; atteindre la N-ième entrée (scasb). Référencée via vtable (DATA XREF seg216).
; ==============================================================================================
Str_SeekNthEntryByte_50E60	proc far		; CODE XREF: Str_GetNthEntry_50EC8+14p

var_4		= word ptr -4
var_2		= dword	ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	di
		cld
		les	di, [bp+arg_0]
		xor	ax, ax

loc_50E6D:				; DATA XREF: seg216:0456o
		mov	bx, [bp+arg_4]
		or	bx, bx
		jz	short loc_50E84

loc_50E74:				; CODE XREF: Str_SeekNthEntryByte_50E60+1Aj
		mov	cx, 0FFFFh
		repne scasb
		dec	bx
		jnz	short loc_50E74
		or	cx, cx
		jnz	short loc_50E84
		mov	es, cx
		mov	di, cx

loc_50E84:				; CODE XREF: Str_SeekNthEntryByte_50E60+12j
					; Str_SeekNthEntryByte_50E60+1Ej
		mov	[bp+var_4], di
		mov	word ptr [bp+var_2], es
		mov	edx, [bp+var_2]
		mov	ax, [bp+var_4]
		pop	di
		leave
		retf
Str_SeekNthEntryByte_50E60	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 43 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi — REFERME la question
; du decoupage du bloc PROG).   DECOUVERTE : le bloc PROG brut (charge par
; ProgBuffer_LoadRawAndCountMarkers_AA31D) est une SEQUENCE DE MINI-PROGRAMMES CONSECUTIFS,
; chacun termine par un MOT NUL (0x0000, 2 octets — pas juste un octet). Cette fonction,
; donnee un index N, scanne le tampon (instruction x86 'repne scasw', qui cherche un mot egal
; a 0) et saute par-dessus N separateurs consecutifs ; retourne le pointeur juste apres le
; N-ieme separateur trouve = le debut du sous-programme #N.   CONCLUSION : les 4 progs_id
; d'une PartEntry (on_is_activated/on_mission_update/on_is_destroyed/on_missions_init) sont
; des INDEX DANS CETTE SEQUENCE ('le N-ieme mini-programme du bloc'), pas des offsets ni des
; identifiants nommes independants. Le compteur de marqueurs (ProgBuffer+0x00) = nombre total
; de mini-programmes empaquetes dans le bloc PROG d'une mission.
; ==============================================================================================
ProgBuffer_FindSubProgramByIndex_50E94	proc far		; CODE XREF: Expr_LookupNamedValue_51E4A+1Fp

var_4		= word ptr -4
var_2		= dword	ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_50E97:
		sub	sp, 4
		push	di
		cld

loc_50E9C:
		les	di, [bp+arg_0]
		xor	ax, ax

loc_50EA1:
		mov	bx, [bp+arg_4]
		or	bx, bx
		jz	short loc_50EB8

loc_50EA8:				; CODE XREF: ProgBuffer_FindSubProgramByIndex_50E94+1Aj
		mov	cx, 7FFFh
		repne scasw
		dec	bx
		jnz	short loc_50EA8
		or	cx, cx
		jnz	short loc_50EB8
		mov	es, cx
		mov	di, cx

loc_50EB8:				; CODE XREF: ProgBuffer_FindSubProgramByIndex_50E94+12j
					; ProgBuffer_FindSubProgramByIndex_50E94+1Ej
		mov	[bp+var_4], di
		mov	word ptr [bp+var_2], es
		mov	edx, [bp+var_2]
		mov	ax, [bp+var_4]
		pop	di
		leave
		retf
ProgBuffer_FindSubProgramByIndex_50E94	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enveloppe bornée de Str_SeekNthEntryByte : retourne un pointeur nul si l'index dépasse
; le compteur en tête de structure.
; ==============================================================================================
Str_GetNthEntry_50EC8	proc far		; CODE XREF: Expr_ResolveStringEntry_7F5D5:loc_7F61EP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	[si], dx
		jbe	short loc_50EE4
		push	dx
		push	large dword ptr	[si+2]
		push	cs
		call	near ptr Str_SeekNthEntryByte_50E60
		add	sp, 6
		jmp	short loc_50EE8
; ���������������������������������������������������������������������������

loc_50EE4:				; CODE XREF: Str_GetNthEntry_50EC8+Cj
		xor	dx, dx
		xor	ax, ax

loc_50EE8:				; CODE XREF: Str_GetNthEntry_50EC8+1Aj
		pop	si
		pop	bp
		retf
Str_GetNthEntry_50EC8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, cumule 3 champs dword (+0x22/+0x26/+0x2A, probable position X/Y/Z) en remontant une
; chaîne de pointeurs (parents successifs), alloue (sub_658, 0Ch) ou réutilise un buffer
; résultat. Cœur du calcul de position résolue d'un nœud dans sa hiérarchie — utilisé
; largement dans tout le cluster seg109-117.
; ==============================================================================================
GeomNode_SumOffsetsUpChain_50EEB	proc far		; CODE XREF: Lexer_ResolveConstantAlt+5BP
					; PartEntry_ResolveSpawnPositionAndActivate_51EDC+325p ...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 4
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_10], eax
		mov	eax, es:[si+4]

loc_50F11:
		mov	[bp+var_C], eax

loc_50F15:
		mov	eax, es:[si+8]
		mov	[bp+var_8], eax

loc_50F1E:
		les	bx, [bp+arg_4]

loc_50F21:
		cmp	dword ptr es:[bx], 0
		jz	short loc_50F46
		les	bx, es:[bx]
		mov	eax, es:[bx+22h]
		add	[bp+var_10], eax
		mov	eax, es:[bx+26h]
		add	[bp+var_C], eax
		mov	eax, es:[bx+2Ah]
		add	[bp+var_8], eax

loc_50F46:				; CODE XREF: GeomNode_SumOffsetsUpChain_50EEB+3Bj
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_50F51
		mov	ax, si
		jmp	short loc_50F5B
; ���������������������������������������������������������������������������

loc_50F51:				; CODE XREF: GeomNode_SumOffsetsUpChain_50EEB+60j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_50F5B:				; CODE XREF: GeomNode_SumOffsetsUpChain_50EEB+64j
		or	ax, ax
		jz	short loc_50F7A
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	eax, [bp+var_C]
		mov	[si+4],	eax
		mov	eax, [bp+var_8]
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_50F7C
; ���������������������������������������������������������������������������

loc_50F7A:				; CODE XREF: GeomNode_SumOffsetsUpChain_50EEB+72j
		mov	ax, si

loc_50F7C:				; CODE XREF: GeomNode_SumOffsetsUpChain_50EEB+8Dj
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
GeomNode_SumOffsetsUpChain_50EEB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lecteur de flux de bytecode : avance un curseur (di[0]) dans un buffer (di[2]), lit
; opcode+opérande, gère un opérande étendu si opcode==9. Utilisé par l'interpréteur
; Expr_VM_Interpreter_51106.
; ==============================================================================================
Expr_VM_ReadNextToken_50F85	proc far		; CODE XREF: Expr_VM_Interpreter_51106+16p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		les	bx, [di+2]
		mov	ax, [di]

loc_50F92:
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0

loc_50F9B:
		mov	[di+6],	ax

loc_50F9E:
		mov	bx, [di+2]
		mov	ax, [di]

loc_50FA3:
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	[di+8],	ax
		mov	word ptr [di+0Ah], 0FFFFh
		mov	ax, [di+2]
		add	ax, [di]
		mov	bx, ax
		cmp	byte ptr es:[bx], 9
		jnz	short loc_50FD4
		inc	word ptr [di]
		mov	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		add	bx, ax
		mov	al, es:[bx]
		mov	ah, 0
		mov	[di+0Ah], ax

loc_50FD4:				; CODE XREF: Expr_VM_ReadNextToken_50F85+3Aj
		mov	al, [di+6]
		pop	di
		pop	si
		pop	bp
		retf
Expr_VM_ReadNextToken_50F85	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, recherche dans le flux de bytecode un marqueur "case" (opcode 8) dont l'opérande
; correspond à arg_2 ; avance le curseur si trouvé.
; ==============================================================================================
Expr_VM_FindCaseToken_50FDB	proc far		; CODE XREF: Expr_VM_Interpreter_51106+51Ap

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [si]
		xor	cx, cx
		jmp	short loc_51019
; ���������������������������������������������������������������������������

loc_50FEB:				; CODE XREF: Expr_VM_FindCaseToken_50FDB+4Bj
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
		jnz	short loc_51019

loc_51011:
		cmp	ax, [bp+arg_2]
		jnz	short loc_51019
		mov	cx, 1

loc_51019:				; CODE XREF: Expr_VM_FindCaseToken_50FDB+Ej
					; Expr_VM_FindCaseToken_50FDB+34j ...
		or	cx, cx
		jnz	short loc_51028
		les	bx, [si+2]
		add	bx, dx
		cmp	byte ptr es:[bx], 0
		jnz	short loc_50FEB

loc_51028:				; CODE XREF: Expr_VM_FindCaseToken_50FDB+40j
		or	cx, cx
		jz	short loc_5102E
		mov	[si], dx

loc_5102E:				; CODE XREF: Expr_VM_FindCaseToken_50FDB+4Fj
		mov	ax, cx
		pop	si
		leave
		retf
Expr_VM_FindCaseToken_50FDB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, empile une valeur (résolue via Expr_LookupNamedValue_51E4A) sur la pile de la VM
; d'expression (tableaux paralleles +0x1A/+0x1C dword et +0x5A word, index +0x18).
; ==============================================================================================
Expr_VM_PushValue_51033	proc far		; CODE XREF: Expr_VM_Interpreter_51106+32p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	word ptr [di+18h], 10h

loc_51042:
		jge	short loc_51092
		push	[bp+arg_2]
		mov	ax, word_706A0
		add	ax, 40h	; '@'
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_51E4A
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_51092
		mov	ax, [di+4]
		mov	dx, [di+2]
		mov	bx, [di+18h]
		shl	bx, 2
		mov	[bx+di+1Ch], ax
		mov	[bx+di+1Ah], dx
		mov	bx, [di+18h]
		shl	bx, 1
		mov	ax, [di]
		mov	[bx+di+5Ah], ax
		inc	word ptr [di+18h]
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	[di+2],	eax
		mov	word ptr [di], 0

loc_51092:				; CODE XREF: Expr_VM_PushValue_51033:loc_51042j
					; Expr_VM_PushValue_51033+2Ej
		pop	di
		pop	si
		leave
		retf
Expr_VM_PushValue_51033	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, dépile la valeur courante de la pile de la VM d'expression.
; ==============================================================================================
Expr_VM_PopValue_51096	proc far		; CODE XREF: Expr_VM_Interpreter_51106+3Fp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+18h], 0
		jz	short loc_510C4

loc_510A3:
		dec	word ptr [si+18h]
		mov	bx, [si+18h]
		shl	bx, 1
		mov	ax, [bx+si+5Ah]
		mov	[si], ax
		mov	bx, [si+18h]
		shl	bx, 2
		mov	ax, [bx+si+1Ch]
		mov	dx, [bx+si+1Ah]
		mov	[si+4],	ax
		mov	[si+2],	dx
		jmp	short loc_510C9
; ���������������������������������������������������������������������������

loc_510C4:				; CODE XREF: Expr_VM_PopValue_51096+Bj
		mov	word ptr [si+10h], 1

loc_510C9:				; CODE XREF: Expr_VM_PopValue_51096+2Cj
		pop	si
		pop	bp
		retf
Expr_VM_PopValue_51096	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, lit une valeur par défaut (+0x12) sauf si un indicateur (+8 != 0xFF) déclenche une
; résolution via Expr_LookupNamedValue_52DDB (table de substitution).
; ==============================================================================================
Expr_VM_ReadVarOrOverride_510CC	proc far		; CODE XREF: Expr_VM_Interpreter_51106+6E1p
					; Expr_VM_Interpreter_51106+706p ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+12h]
		mov	[bp+var_4], eax
		cmp	word ptr [si+8], 0FFh
		jz	short loc_510FD
		push	[bp+arg_2]
		mov	ax, word_706A0
		add	ax, 34h	; '4'
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_52DDB
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_510FD:				; CODE XREF: Expr_VM_ReadVarOrOverride_510CC+17j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
Expr_VM_ReadVarOrOverride_510CC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 1877 lignes, NON DÉTAILLÉE EN PROFONDEUR — DÉCOUVERTE MAJEURE : machine virtuelle à
; bytecode complète, switch à 209 cas (jump table off_51CA8), lit les instructions via
; Expr_VM_ReadNextToken_50F85. Gère une pile de valeurs (Expr_VM_Push/Pop) et des appels de
; fonctions natives (Expr_VM_CallNativeFunction_52513). Sous-jacente au système de nœuds à
; valeurs calculées utilisé par le HUD (sub_3E744/sub_547B1), l'IA (seg004/seg054274) et l'UI
; (sub_4FBF1 et alentours). PRIORITÉ ABSOLUE pour une session dédiée.
; ==============================================================================================
Expr_VM_Interpreter_51106	proc far		; CODE XREF: Expr_VM_ExecuteSingleInstruction_51E7E+58p

var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	di, [bp+arg_0]

loc_51111:
		mov	ax, word_706A0
		mov	[bp+var_2], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_5111A:				; CODE XREF: Expr_VM_Interpreter_51106+B9Bj
		push	di
		push	cs
		call	near ptr Expr_VM_ReadNextToken_50F85
		pop	cx
		mov	bx, [di+6]

loc_51123:				; switch 209 cases
		cmp	bx, 0D0h ; '�'
		jbe	short loc_5112C
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_5112C:				; CODE XREF: Expr_VM_Interpreter_51106+21j
		shl	bx, 1
		jmp	cs:off_51CA8[bx] ; switch jump

loc_51133:				; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0x2

loc_51136:				; CODE XREF: Expr_VM_Interpreter_51106+3Bj
		push	di
		push	cs
		call	near ptr Expr_VM_PushValue_51033
		jmp	loc_51B41
; ���������������������������������������������������������������������������

loc_5113E:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+0Ch] ; case 0x3
		jmp	short loc_51136
; ���������������������������������������������������������������������������

loc_51143:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	di		; case 0x0
		push	cs
		call	near ptr Expr_VM_PopValue_51096
		pop	cx
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_5114C:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	word ptr [di+10h], 1 ; case 0x4
		mov	word ptr [di+18h], 0
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51159:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	al, [di+8]	; case 0xF
		mov	byte_706AF, al
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51162:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x10

loc_51165:				; CODE XREF: Expr_VM_Interpreter_51106+C8j
					; Expr_VM_Interpreter_51106+131j ...
		jmp	loc_51A91
; ���������������������������������������������������������������������������

loc_51168:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x11
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_5117F
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_51181
; ���������������������������������������������������������������������������

loc_5117F:				; CODE XREF: Expr_VM_Interpreter_51106+6Bj
		xor	ax, ax

loc_51181:				; CODE XREF: Expr_VM_Interpreter_51106+77j
		mov	[di+0Ch], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51187:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x12
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_5119E
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_511A0
; ���������������������������������������������������������������������������

loc_5119E:				; CODE XREF: Expr_VM_Interpreter_51106+8Aj
		xor	ax, ax

loc_511A0:				; CODE XREF: Expr_VM_Interpreter_51106+96j
		mov	word ptr [bp+var_C+2], ax
		mov	dx, [di+8]
		mov	ax, [di+0Ch]
		mov	word ptr [bp+var_C], ax
		mov	bx, [bp+var_2]
		cmp	[bx+48h], dx
		jbe	short loc_511C5
		les	bx, [bx+4Ah]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	ax, word ptr [bp+var_C]
		mov	es:[bx], ax
		jmp	short $+2

loc_511C5:				; CODE XREF: Expr_VM_Interpreter_51106+ACj
		mov	ax, word ptr [bp+var_C+2]
		jmp	loc_51A91
; ���������������������������������������������������������������������������

loc_511CB:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+0Eh]	; case 0x13
		jmp	short loc_51165
; ���������������������������������������������������������������������������

loc_511D0:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	dx, [di+8]	; case 0x51
		mov	ax, [di+0Eh]
		mov	[bp+var_4], ax
		mov	bx, [bp+var_2]
		cmp	[bx+48h], dx
		ja	short loc_511E4
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_511E4:				; CODE XREF: Expr_VM_Interpreter_51106+D9j
		les	bx, [bx+4Ah]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	ax, [bp+var_4]
		jmp	loc_5172A
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_511F6:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		cmp	word ptr [di+8], 8 ; case 0x14
		jl	short loc_511FF
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_511FF:				; CODE XREF: Expr_VM_Interpreter_51106+F4j
		mov	ax, [di+8]
		shl	ax, 1
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	ax, [di+0Ch]
		mov	[bx+0A1h], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51213:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x15

loc_51216:
		inc	ax

loc_51217:
		mov	[bp+var_6], ax

loc_5121A:
		call	CRT_Rand
		movsx	eax, ax

loc_51223:
		movsx	edx, [bp+var_6]
		imul	eax, edx
		mov	ebx, 8000h
		cdq

loc_51234:
		idiv	ebx
		jmp	loc_51165
; ���������������������������������������������������������������������������

loc_5123A:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x20
		add	[di+0Ch], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51243:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x21
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_5125A
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_5125C
; ���������������������������������������������������������������������������

loc_5125A:				; CODE XREF: Expr_VM_Interpreter_51106+146j
		xor	ax, ax

loc_5125C:				; CODE XREF: Expr_VM_Interpreter_51106+152j
		add	[di+0Ch], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51262:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x22
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_51279
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_5127B
; ���������������������������������������������������������������������������

loc_51279:				; CODE XREF: Expr_VM_Interpreter_51106+165j
		xor	ax, ax

loc_5127B:				; CODE XREF: Expr_VM_Interpreter_51106+171j
		add	ax, [di+8]
		mov	word ptr [bp+var_C+2], ax
		mov	dx, [di+8]
		mov	word ptr [bp+var_C], ax
		mov	bx, [bp+var_2]
		cmp	[bx+48h], dx
		ja	short loc_51292

loc_5128F:
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_51292:				; CODE XREF: Expr_VM_Interpreter_51106+187j
		les	bx, [bx+4Ah]
		mov	ax, dx

loc_51297:
		shl	ax, 1

loc_51299:
		add	bx, ax
		mov	ax, word ptr [bp+var_C]

loc_5129E:
		jmp	loc_5172A
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_512A4:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x23
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_512BB
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_512BD
; ���������������������������������������������������������������������������

loc_512BB:				; CODE XREF: Expr_VM_Interpreter_51106+1A7j
		xor	ax, ax

loc_512BD:				; CODE XREF: Expr_VM_Interpreter_51106+1B3j
		add	ax, [di+0Ch]
		mov	word ptr [bp+var_C+2], ax
		mov	dx, [di+8]
		mov	word ptr [bp+var_C], ax
		mov	bx, [bp+var_2]
		cmp	[bx+48h], dx
		ja	short loc_512D4
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_512D4:				; CODE XREF: Expr_VM_Interpreter_51106+1C9j
		les	bx, [bx+4Ah]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	ax, word ptr [bp+var_C]
		jmp	loc_5172A
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_512E6:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x24
		sub	[di+0Ch], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_512EF:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x25
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_51306
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_51308
; ���������������������������������������������������������������������������

loc_51306:				; CODE XREF: Expr_VM_Interpreter_51106+1F2j
		xor	ax, ax

loc_51308:				; CODE XREF: Expr_VM_Interpreter_51106+1FEj
		sub	[di+0Ch], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_5130E:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x26
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_51325
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_51327
; ���������������������������������������������������������������������������

loc_51325:				; CODE XREF: Expr_VM_Interpreter_51106+211j
		xor	ax, ax

loc_51327:				; CODE XREF: Expr_VM_Interpreter_51106+21Dj
		sub	ax, [di+8]
		mov	word ptr [bp+var_C+2], ax
		mov	dx, [di+8]
		mov	word ptr [bp+var_C], ax
		mov	bx, [bp+var_2]
		cmp	[bx+48h], dx
		ja	short loc_5133E
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_5133E:				; CODE XREF: Expr_VM_Interpreter_51106+233j
		les	bx, [bx+4Ah]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	ax, word ptr [bp+var_C]
		jmp	loc_5172A
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_51350:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x27
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_51367
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_51369
; ���������������������������������������������������������������������������

loc_51367:				; CODE XREF: Expr_VM_Interpreter_51106+253j
		xor	ax, ax

loc_51369:				; CODE XREF: Expr_VM_Interpreter_51106+25Fj
		sub	ax, [di+0Ch]
		mov	word ptr [bp+var_C+2], ax
		mov	dx, [di+8]
		mov	word ptr [bp+var_C], ax
		mov	bx, [bp+var_2]
		cmp	[bx+48h], dx
		ja	short loc_51380
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_51380:				; CODE XREF: Expr_VM_Interpreter_51106+275j
		les	bx, [bx+4Ah]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	ax, word ptr [bp+var_C]
		jmp	loc_5172A
; ���������������������������������������������������������������������������

loc_5138F:
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_51392:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x28
		or	[di+0Ch], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_5139B:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x29
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_513B2
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_513B4
; ���������������������������������������������������������������������������

loc_513B2:				; CODE XREF: Expr_VM_Interpreter_51106+29Ej
		xor	ax, ax

loc_513B4:				; CODE XREF: Expr_VM_Interpreter_51106+2AAj
		or	[di+0Ch], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_513BA:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x2A
		and	[di+0Ch], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_513C3:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x2B
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_513DA
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_513DC
; ���������������������������������������������������������������������������

loc_513DA:				; CODE XREF: Expr_VM_Interpreter_51106+2C6j
		xor	ax, ax

loc_513DC:				; CODE XREF: Expr_VM_Interpreter_51106+2D2j
		and	[di+0Ch], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_513E2:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x2C
		xor	[di+0Ch], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_513EB:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x2D
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_51402
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_51404
; ���������������������������������������������������������������������������

loc_51402:				; CODE XREF: Expr_VM_Interpreter_51106+2EEj
		xor	ax, ax

loc_51404:				; CODE XREF: Expr_VM_Interpreter_51106+2FAj
		xor	[di+0Ch], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_5140A:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+0Ch]	; case 0x2E
		imul	word ptr [di+8]
		jmp	short loc_51432
; ���������������������������������������������������������������������������

loc_51412:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x2F
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_51429
		les	bx, [bx+4Ah]
		shl	ax, 1

loc_51422:
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_5142B
; ���������������������������������������������������������������������������

loc_51429:				; CODE XREF: Expr_VM_Interpreter_51106+315j
		xor	ax, ax

loc_5142B:				; CODE XREF: Expr_VM_Interpreter_51106+321j
		push	ax
		mov	ax, [di+0Ch]
		pop	dx
		imul	dx

loc_51432:				; CODE XREF: Expr_VM_Interpreter_51106+30Aj
		mov	[di+0Ch], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51438:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+0Ch]	; case 0x30
		cwd
		idiv	word ptr [di+8]
		jmp	loc_51165
; ���������������������������������������������������������������������������

loc_51442:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x31
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_51459
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_5145B
; ���������������������������������������������������������������������������

loc_51459:				; CODE XREF: Expr_VM_Interpreter_51106+345j
		xor	ax, ax

loc_5145B:				; CODE XREF: Expr_VM_Interpreter_51106+351j
		push	ax
		mov	ax, [di+0Ch]
		cwd
		pop	bx
		idiv	bx
		jmp	loc_51165
; ���������������������������������������������������������������������������

loc_51466:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	dx, [di+0Ch]	; case 0x40
		mov	cx, [di+8]
		mov	word ptr [di+16h], 0
		cmp	dx, cx
		jle	short loc_5147B
		or	word ptr [di+16h], 4
		jmp	short $+2

loc_5147B:				; CODE XREF: Expr_VM_Interpreter_51106+36Dj
		cmp	dx, cx
		jnz	short loc_51485
		or	word ptr [di+16h], 2
		jmp	short $+2

loc_51485:				; CODE XREF: Expr_VM_Interpreter_51106+377j
		cmp	dx, cx
		jl	short loc_5148C
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_5148C:				; CODE XREF: Expr_VM_Interpreter_51106+381j
		jmp	loc_515AE
; ���������������������������������������������������������������������������

loc_5148F:
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_51492:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	dx, [di+8]	; case 0x41
		mov	cx, [di+0Ch]
		mov	word ptr [di+16h], 0
		cmp	dx, cx
		jle	short loc_514A7

loc_514A1:
		or	word ptr [di+16h], 4
		jmp	short $+2

loc_514A7:				; CODE XREF: Expr_VM_Interpreter_51106+399j
		cmp	dx, cx
		jnz	short loc_514B1
		or	word ptr [di+16h], 2
		jmp	short $+2

loc_514B1:				; CODE XREF: Expr_VM_Interpreter_51106+3A3j
		cmp	dx, cx
		jl	short loc_514B8
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_514B8:				; CODE XREF: Expr_VM_Interpreter_51106+3ADj
		jmp	loc_515AE
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_514BE:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	dx, [di+0Ch]	; case 0x42
		mov	ax, [di+8]
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_514D8
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_514DA
; ���������������������������������������������������������������������������

loc_514D8:				; CODE XREF: Expr_VM_Interpreter_51106+3C4j
		xor	ax, ax

loc_514DA:				; CODE XREF: Expr_VM_Interpreter_51106+3D0j
		mov	cx, ax
		mov	word ptr [di+16h], 0
		cmp	dx, cx
		jle	short loc_514EB
		or	word ptr [di+16h], 4
		jmp	short $+2

loc_514EB:				; CODE XREF: Expr_VM_Interpreter_51106+3DDj
		cmp	dx, cx
		jnz	short loc_514F5
		or	word ptr [di+16h], 2
		jmp	short $+2

loc_514F5:				; CODE XREF: Expr_VM_Interpreter_51106+3E7j
		cmp	dx, cx
		jl	short loc_514FC
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_514FC:				; CODE XREF: Expr_VM_Interpreter_51106+3F1j
		jmp	loc_515AE
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_51502:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x43
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_51519
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax

loc_51514:
		mov	ax, es:[bx]
		jmp	short loc_5151B
; ���������������������������������������������������������������������������

loc_51519:				; CODE XREF: Expr_VM_Interpreter_51106+405j
		xor	ax, ax

loc_5151B:				; CODE XREF: Expr_VM_Interpreter_51106+411j
		mov	dx, ax
		mov	cx, [di+0Ch]
		mov	word ptr [di+16h], 0
		cmp	dx, cx
		jle	short loc_5152F
		or	word ptr [di+16h], 4
		jmp	short $+2

loc_5152F:				; CODE XREF: Expr_VM_Interpreter_51106+421j
		cmp	dx, cx
		jnz	short loc_51539
		or	word ptr [di+16h], 2
		jmp	short $+2

loc_51539:				; CODE XREF: Expr_VM_Interpreter_51106+42Bj
		cmp	dx, cx
		jl	short loc_51540
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_51540:				; CODE XREF: Expr_VM_Interpreter_51106+435j
		jmp	short loc_515AE
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_51545:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	dx, [di+0Eh]	; case 0x44
		mov	cx, [di+8]
		mov	word ptr [di+16h], 0
		cmp	dx, cx
		jle	short loc_5155A
		or	word ptr [di+16h], 4
		jmp	short $+2

loc_5155A:				; CODE XREF: Expr_VM_Interpreter_51106+44Cj
		cmp	dx, cx
		jnz	short loc_51564
		or	word ptr [di+16h], 2
		jmp	short $+2

loc_51564:				; CODE XREF: Expr_VM_Interpreter_51106+456j
		cmp	dx, cx
		jl	short loc_5156B
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_5156B:				; CODE XREF: Expr_VM_Interpreter_51106+460j
		jmp	short loc_515AE
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_51570:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x45
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_51587
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_51589
; ���������������������������������������������������������������������������

loc_51587:				; CODE XREF: Expr_VM_Interpreter_51106+473j
		xor	ax, ax

loc_51589:				; CODE XREF: Expr_VM_Interpreter_51106+47Fj
		mov	dx, ax
		mov	word ptr [di+16h], 0
		cmp	dx, 1

loc_51593:
		jle	short loc_5159B

loc_51595:
		or	word ptr [di+16h], 4
		jmp	short $+2

loc_5159B:				; CODE XREF: Expr_VM_Interpreter_51106:loc_51593j
		cmp	dx, 1

loc_5159E:
		jnz	short loc_515A6

loc_515A0:
		or	word ptr [di+16h], 2
		jmp	short $+2

loc_515A6:				; CODE XREF: Expr_VM_Interpreter_51106:loc_5159Ej
		cmp	dx, 1
		jl	short loc_515AE
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_515AE:				; CODE XREF: Expr_VM_Interpreter_51106:loc_5148Cj
					; Expr_VM_Interpreter_51106:loc_514B8j	...
		or	word ptr [di+16h], 1
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_515B8:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		cmp	word ptr [di+0Eh], 0 ; case 0x46
		jnz	short loc_515C1
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_515C1:				; CODE XREF: Expr_VM_Interpreter_51106+4B6j
					; Expr_VM_Interpreter_51106:loc_515CFj	...
		push	word ptr [di+8]
		jmp	short loc_5161E
; ���������������������������������������������������������������������������

loc_515C6:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		cmp	word ptr [di+0Eh], 0 ; case 0x47
		jz	short loc_515CF
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_515CF:				; CODE XREF: Expr_VM_Interpreter_51106+4C4j
		jmp	short loc_515C1
; ���������������������������������������������������������������������������

loc_515D1:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		test	word ptr [di+16h], 2 ; case 0x48
		jnz	short loc_515DB
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_515DB:				; CODE XREF: Expr_VM_Interpreter_51106+4D0j
		jmp	short loc_515C1
; ���������������������������������������������������������������������������

loc_515DD:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		test	word ptr [di+16h], 2 ; case 0x49
		jz	short loc_515E7
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_515E7:				; CODE XREF: Expr_VM_Interpreter_51106+4DCj
		jmp	short loc_515C1
; ���������������������������������������������������������������������������

loc_515E9:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		test	word ptr [di+16h], 1 ; case 0x4A
		jnz	short loc_515F3
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_515F3:				; CODE XREF: Expr_VM_Interpreter_51106+4E8j
		jmp	short loc_515C1
; ���������������������������������������������������������������������������

loc_515F5:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		test	word ptr [di+16h], 4 ; case 0x4B
		jnz	short loc_515FF
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_515FF:				; CODE XREF: Expr_VM_Interpreter_51106+4F4j
		jmp	short loc_515C1
; ���������������������������������������������������������������������������

loc_51601:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		test	word ptr [di+16h], 3 ; case 0x4C
		jnz	short loc_5160B
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_5160B:				; CODE XREF: Expr_VM_Interpreter_51106+500j
		jmp	short loc_515C1
; ���������������������������������������������������������������������������

loc_5160D:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		test	word ptr [di+16h], 6 ; case 0x4D
		jnz	short loc_51617

loc_51614:				; default
		jmp	loc_51C94
; ���������������������������������������������������������������������������

loc_51617:				; CODE XREF: Expr_VM_Interpreter_51106+50Cj
		jmp	short loc_515C1
; ���������������������������������������������������������������������������

loc_51619:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		jmp	short loc_515C1	; case 0x4E
; ���������������������������������������������������������������������������

loc_5161B:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+0Ch] ; case 0x4F

loc_5161E:				; CODE XREF: Expr_VM_Interpreter_51106+4BEj
		push	di
		push	cs
		call	near ptr Expr_VM_FindCaseToken_50FDB
		jmp	loc_51B41
; ���������������������������������������������������������������������������

loc_51626:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	dx, [di+8]	; case 0x50
		mov	ax, [di+0Ch]
		mov	[bp+var_8], ax
		mov	bx, [bp+var_2]
		cmp	[bx+48h], dx
		ja	short loc_5163A
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_5163A:				; CODE XREF: Expr_VM_Interpreter_51106+52Fj
		les	bx, [bx+4Ah]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	ax, [bp+var_8]
		jmp	loc_5172A
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_5164C:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	dx, [di+8]	; case 0x52
		mov	bx, [bp+var_2]
		cmp	[bx+48h], dx
		ja	short loc_5165A
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_5165A:				; CODE XREF: Expr_VM_Interpreter_51106+54Fj
		les	bx, [bx+4Ah]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	word ptr es:[bx], 1
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_5166E:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	dx, [di+8]	; case 0x53
		mov	bx, [bp+var_2]
		cmp	[bx+48h], dx
		ja	short loc_5167C
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_5167C:				; CODE XREF: Expr_VM_Interpreter_51106+571j
		les	bx, [bx+4Ah]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	word ptr es:[bx], 0
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_51690:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	dx, [di+8]	; case 0x54
		mov	bx, [bp+var_2]
		cmp	[bx+48h], dx
		ja	short loc_5169E
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_5169E:				; CODE XREF: Expr_VM_Interpreter_51106+593j
		les	bx, [bx+4Ah]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		xor	word ptr es:[bx], 1
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_516B1:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x55
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_516C8
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_516CA
; ���������������������������������������������������������������������������

loc_516C8:				; CODE XREF: Expr_VM_Interpreter_51106+5B4j
		xor	ax, ax

loc_516CA:				; CODE XREF: Expr_VM_Interpreter_51106+5C0j
		mov	word ptr [bp+var_C+2], ax
		mov	dx, [di+8]
		inc	ax
		mov	word ptr [bp+var_C], ax
		mov	bx, [bp+var_2]
		cmp	[bx+48h], dx
		ja	short loc_516DF
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_516DF:				; CODE XREF: Expr_VM_Interpreter_51106+5D4j
		les	bx, [bx+4Ah]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	ax, word ptr [bp+var_C]
		jmp	short loc_5172A
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_516F0:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+8]	; case 0x56
		mov	bx, [bp+var_2]
		cmp	ax, [bx+48h]
		jnb	short loc_51707
		les	bx, [bx+4Ah]
		shl	ax, 1
		add	bx, ax
		mov	ax, es:[bx]
		jmp	short loc_51709
; ���������������������������������������������������������������������������

loc_51707:				; CODE XREF: Expr_VM_Interpreter_51106+5F3j
		xor	ax, ax

loc_51709:				; CODE XREF: Expr_VM_Interpreter_51106+5FFj
		mov	word ptr [bp+var_C+2], ax
		mov	dx, [di+8]
		dec	ax
		mov	word ptr [bp+var_C], ax
		mov	bx, [bp+var_2]
		cmp	[bx+48h], dx
		ja	short loc_5171E
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_5171E:				; CODE XREF: Expr_VM_Interpreter_51106+613j
		les	bx, [bx+4Ah]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	ax, word ptr [bp+var_C]

loc_5172A:				; CODE XREF: Expr_VM_Interpreter_51106+EAj
					; Expr_VM_Interpreter_51106:loc_5129Ej	...
		mov	es:[bx], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������
		jmp	loc_51B2A
; ���������������������������������������������������������������������������

loc_51733:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	ax, [di+16h]	; case 0x82
		and	ax, 2
		sub	[di+16h], ax
		push	word ptr [di+8]
		mov	ax, [bp+var_2]
		add	ax, 1Ah
		push	ax
		nop
		push	cs
		call	near ptr GeomNode_SumAndCount_53034
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		push	dx
		push	ax
		mov	ax, [bp+var_2]
		add	ax, 3Ah	; ':'
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_Accessor_532AD
		add	sp, 6
		mov	si, ax
		cmp	byte ptr [si], 0
		jnz	short loc_5176F
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_5176F:				; CODE XREF: Expr_VM_Interpreter_51106+664j
		jmp	loc_518D2
; ���������������������������������������������������������������������������

loc_51772:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0x80
		mov	ax, [bp+var_2]
		add	ax, 1Ah
		push	ax
		nop
		push	cs
		call	near ptr GeomNode_SumAndCount_53034
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		push	dx
		push	ax
		mov	ax, [bp+var_2]
		add	ax, 3Ah	; ':'
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_Accessor_532AD
		add	sp, 6
		mov	si, ax
		or	si, si
		jnz	short loc_517A4

loc_517A1:				; default
		jmp	loc_51C94
; ���������������������������������������������������������������������������

loc_517A4:				; CODE XREF: Expr_VM_Interpreter_51106+699j
		mov	byte ptr [si], 1
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_517AA:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0x81
		mov	ax, [bp+var_2]
		add	ax, 1Ah
		push	ax
		nop
		push	cs
		call	near ptr GeomNode_SumAndCount_53034
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		push	dx
		push	ax
		mov	ax, [bp+var_2]
		add	ax, 3Ah	; ':'
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_Accessor_532AD
		add	sp, 6
		mov	si, ax
		or	si, si
		jnz	short loc_517DC
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_517DC:				; CODE XREF: Expr_VM_Interpreter_51106+6D1j
		mov	byte ptr [si], 0
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_517E2:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0x90
		push	di

loc_517E6:
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_510CC

loc_517EA:
		add	sp, 4

loc_517ED:
		mov	word ptr [bp+var_C+2], dx

loc_517F0:
		mov	word ptr [bp+var_C], ax

loc_517F3:
		cmp	[bp+var_C], 0
		jnz	short loc_517FD
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_517FD:				; CODE XREF: Expr_VM_Interpreter_51106+6F2j
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr PartEntry_ResolveSpawnPositionAndActivate_51EDC
		jmp	loc_51B41
; ���������������������������������������������������������������������������

loc_51807:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0x91
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_510CC
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_51822
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51822:				; CODE XREF: Expr_VM_Interpreter_51106+717j
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_ClearDirtyAndNotify_5242A
		jmp	loc_51B41
; ���������������������������������������������������������������������������

loc_5182C:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0x94
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_510CC
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_51847
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51847:				; CODE XREF: Expr_VM_Interpreter_51106+73Cj
		push	dx
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_DetachChildAndRecompute_524EB
		jmp	loc_51B41
; ���������������������������������������������������������������������������

loc_51851:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0x92
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_510CC
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		les	bx, [bp+var_C]
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		mov	[bp+var_E], ax
		cmp	[bp+var_E], 0
		jz	short loc_518D9
		jmp	short loc_518D2
; ���������������������������������������������������������������������������
		jmp	short loc_518D9
; ���������������������������������������������������������������������������

loc_5187C:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0x93
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_510CC
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		les	bx, [bp+var_C]
		mov	al, es:[bx+39h]

loc_51894:
		shl	ax, 0Eh
		sar	ax, 0Fh
		mov	[bp+var_E], ax
		cmp	[bp+var_E], 0
		jz	short loc_518D9
		jmp	short loc_518D2
; ���������������������������������������������������������������������������
		jmp	short loc_518D9
; ���������������������������������������������������������������������������

loc_518A7:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0x98
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_510CC
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		les	bx, [bp+var_C]
		cmp	word ptr es:[bx+52h], 0
		jz	short loc_518C7
		mov	ax, 1
		jmp	short loc_518C9
; ���������������������������������������������������������������������������

loc_518C7:				; CODE XREF: Expr_VM_Interpreter_51106+7BAj
		xor	ax, ax

loc_518C9:				; CODE XREF: Expr_VM_Interpreter_51106+7BFj
		mov	[bp+var_E], ax
		cmp	[bp+var_E], 0
		jz	short loc_518D9

loc_518D2:				; CODE XREF: Expr_VM_Interpreter_51106:loc_5176Fj
					; Expr_VM_Interpreter_51106+772j ...
		or	word ptr [di+16h], 2
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_518D9:				; CODE XREF: Expr_VM_Interpreter_51106+770j
					; Expr_VM_Interpreter_51106+774j ...
		and	word ptr [di+16h], 0FFFDh
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_518E0:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	word ptr [di+0Ch], 0 ; case 0x95

loc_518E5:
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_510CC

loc_518ED:
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_51900
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51900:				; CODE XREF: Expr_VM_Interpreter_51106+7F5j
		cmp	dword ptr [di+12h], 0
		jnz	short loc_5190A
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_5190A:				; CODE XREF: Expr_VM_Interpreter_51106+7FFj
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		push	large dword ptr	[di+12h]
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		mov	eax, [bp+var_2C]
		sub	[bp+var_20], eax
		mov	eax, [bp+var_28]
		sub	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		sub	[bp+var_18], eax
		push	large [bp+var_18]
		push	large [bp+var_1C]
		push	large [bp+var_20]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_14], eax
		mov	[bp-10h], eax
		mov	ebx, 3E8h
		cdq
		idiv	ebx
		mov	[bp-10h], eax
		sar	eax, 8
		mov	dx, 0FFh
		mov	[di+0Ch], dx
		movsx	edx, dx
		cmp	eax, edx
		jl	short loc_51987
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51987:				; CODE XREF: Expr_VM_Interpreter_51106+87Cj
		mov	ax, [bp-0Fh]
		jmp	loc_51A91
; ���������������������������������������������������������������������������

loc_5198D:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	word ptr [di+0Ch], 0 ; case 0x97

loc_51992:
		cmp	dword ptr [di+12h], 0
		jnz	short loc_5199C
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_5199C:				; CODE XREF: Expr_VM_Interpreter_51106+891j
		push	word ptr [di+8]
		mov	ax, [bp+var_2]
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		nop
		push	cs
		call	near ptr Player_ResolveAttachPointN_5305A
		add	sp, 8
		push	large dword ptr	[di+12h]
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		mov	eax, [bp+var_20]
		sub	[bp+var_2C], eax
		mov	eax, [bp+var_1C]
		sub	[bp+var_28], eax
		mov	eax, [bp+var_18]
		sub	[bp+var_24], eax
		push	large [bp+var_24]

loc_519E0:
		push	large [bp+var_28]
		push	large [bp+var_2C]

loc_519E8:
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-10h], eax
		mov	[bp+var_C], eax
		mov	ebx, 3E8h
		cdq
		idiv	ebx
		mov	[bp+var_C], eax
		sar	eax, 8
		mov	dx, 0FFh
		mov	[di+0Ch], dx
		movsx	edx, dx
		cmp	eax, edx
		jl	short loc_51A21
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51A21:				; CODE XREF: Expr_VM_Interpreter_51106+916j
		mov	ax, word ptr [bp+var_C+1]
		jmp	short loc_51A91
; ���������������������������������������������������������������������������

loc_51A26:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	word ptr [di+0Ch], 0 ; case 0x96
		push	word ptr [di+8]
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_510CC
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_51A46
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51A46:				; CODE XREF: Expr_VM_Interpreter_51106+93Bj
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		mov	dword ptr [bp-10h], 8CA00h
		mov	eax, [bp-10h]
		sub	[bp+var_18], eax
		mov	ebx, 64h ; 'd'
		mov	eax, [bp+var_18]
		cdq
		idiv	ebx
		mov	[bp+var_18], eax
		sar	eax, 8
		mov	dx, 0FFh
		mov	[di+0Ch], dx
		movsx	edx, dx
		cmp	eax, edx
		jl	short loc_51A8E
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51A8E:				; CODE XREF: Expr_VM_Interpreter_51106+983j
		mov	ax, word ptr [bp+var_18+1]

loc_51A91:				; CODE XREF: Expr_VM_Interpreter_51106:loc_51165j
					; Expr_VM_Interpreter_51106+C2j ...
		mov	[di+0Ch], ax
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51A97:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0xB6
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_510CC
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_51AB2
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51AB2:				; CODE XREF: Expr_VM_Interpreter_51106+9A7j
		les	bx, [bp+var_C]
		or	byte ptr es:[bx+39h], 10h
		jmp	short loc_51B04
; ���������������������������������������������������������������������������

loc_51ABC:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0xB7
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_510CC
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_51AD7
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51AD7:				; CODE XREF: Expr_VM_Interpreter_51106+9CCj
		les	bx, [bp+var_C]
		and	byte ptr es:[bx+39h], 0EFh
		jmp	short loc_51B2A
; ���������������������������������������������������������������������������

loc_51AE1:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0xB8
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_510CC

loc_51AE9:
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_51AFC
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51AFC:				; CODE XREF: Expr_VM_Interpreter_51106+9F1j
		les	bx, [bp+var_C]
		or	byte ptr es:[bx+39h], 20h

loc_51B04:				; CODE XREF: Expr_VM_Interpreter_51106+9B4j
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51B07:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0xB9
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_510CC
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_51B22
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51B22:				; CODE XREF: Expr_VM_Interpreter_51106+A17j
		les	bx, [bp+var_C]
		and	byte ptr es:[bx+39h], 0DFh

loc_51B2A:				; CODE XREF: Expr_VM_Interpreter_51106+DBj
					; Expr_VM_Interpreter_51106+EDj ...
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51B2D:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	al, [di+8]	; case 0xD0
		mov	byte_6D559, al
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51B36:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0xC0
		push	[bp+var_2]
		nop
		push	cs
		call	near ptr Expr_VM_OpcodeHelperA_53504

loc_51B41:				; CODE XREF: Expr_VM_Interpreter_51106+35j
					; Expr_VM_Interpreter_51106+51Dj ...
		add	sp, 4
		jmp	loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51B47:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		cmp	dword ptr [di+12h], 0 ;	case 0xA1
		jnz	short loc_51B51
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51B51:				; CODE XREF: Expr_VM_Interpreter_51106+A46j
		jmp	loc_51C09
; ���������������������������������������������������������������������������
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51B57:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		cmp	dword ptr [di+12h], 0 ;	case 0xA2
		jnz	short loc_51B61
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51B61:				; CODE XREF: Expr_VM_Interpreter_51106+A56j
		jmp	loc_51C09
; ���������������������������������������������������������������������������
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51B67:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		cmp	dword ptr [di+12h], 0 ;	case 0xA3
		jnz	short loc_51B71
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51B71:				; CODE XREF: Expr_VM_Interpreter_51106+A66j
		jmp	loc_51C09
; ���������������������������������������������������������������������������
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51B77:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		cmp	dword ptr [di+12h], 0 ;	case 0xAA
		jnz	short loc_51B81
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51B81:				; CODE XREF: Expr_VM_Interpreter_51106+A76j
		jmp	loc_51C09
; ���������������������������������������������������������������������������
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51B87:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		cmp	dword ptr [di+12h], 0 ;	case 0xA7
		jnz	short loc_51B91
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51B91:				; CODE XREF: Expr_VM_Interpreter_51106+A86j
		jmp	short loc_51C09
; ���������������������������������������������������������������������������
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51B96:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		cmp	dword ptr [di+12h], 0 ;	case 0xB3
		jnz	short loc_51BA0
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51BA0:				; CODE XREF: Expr_VM_Interpreter_51106+A95j
		les	bx, [di+12h]
		mov	al, [di+8]
		mov	es:[bx+32h], al
		jmp	short loc_51C09
; ���������������������������������������������������������������������������
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51BAF:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		cmp	dword ptr [di+12h], 0 ;	case 0xB5
		jnz	short loc_51BB9
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51BB9:				; CODE XREF: Expr_VM_Interpreter_51106+AAEj
		jmp	short loc_51C09
; ���������������������������������������������������������������������������
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51BBE:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		push	word ptr [di+8]	; case 0xBE
		push	di
		push	cs
		call	near ptr Expr_VM_ReadVarOrOverride_510CC
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_51BD9
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51BD9:				; CODE XREF: Expr_VM_Interpreter_51106+ACEj
		les	bx, [bp+var_C]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh

loc_51BE3:
		sar	ax, 0Fh
		mov	ah, 0

loc_51BE8:
		or	ax, ax

loc_51BEA:
		jz	short loc_51BEF
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51BEF:				; CODE XREF: Expr_VM_Interpreter_51106:loc_51BEAj
		push	word ptr [di+0Ah]

loc_51BF2:
		push	word ptr [di+8]

loc_51BF5:
		push	word ptr [di+6]
		push	dx
		push	bx
		jmp	short loc_51C16
; ���������������������������������������������������������������������������
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51BFF:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		cmp	dword ptr [di+12h], 0 ;	case 0xA8
		jnz	short loc_51C09
		jmp	loc_51C8F
; ���������������������������������������������������������������������������

loc_51C09:				; CODE XREF: Expr_VM_Interpreter_51106:loc_51B51j
					; Expr_VM_Interpreter_51106:loc_51B61j	...
		push	word ptr [di+0Ah]
		push	word ptr [di+8]
		push	word ptr [di+6]
		push	large dword ptr	[di+12h]

loc_51C16:				; CODE XREF: Expr_VM_Interpreter_51106+AF4j
		nop
		push	cs
		call	near ptr MissionScript_CallNativeHandler_52513
		add	sp, 0Ah
		mov	[di+0Eh], ax
		jmp	short loc_51C94	; default
; ���������������������������������������������������������������������������
		jmp	short loc_51C8F
; ���������������������������������������������������������������������������

loc_51C25:				; CODE XREF: Expr_VM_Interpreter_51106+28j
					; DATA XREF: seg114:off_51CA8o
		mov	word ptr [di+0Eh], 1 ; case 0xA0
		cmp	byte_706B4, 0
		jnz	short loc_51C3E
		inc	byte_706B4
		mov	dword_706B0, 0

loc_51C3E:				; CODE XREF: Expr_VM_Interpreter_51106+B29j
		mov	word ptr [bp+var_C+2], ds
		mov	word ptr [bp+var_C], 3600h
		cmp	dword ptr [di+12h], 0
		jz	short loc_51C5C
		mov	ax, [di+14h]
		mov	dx, [di+12h]
		add	dx, 3Ah	; ':'
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx

loc_51C5C:				; CODE XREF: Expr_VM_Interpreter_51106+B45j
		les	bx, [bp+var_C]
		cmp	dword ptr es:[bx], 0
		jnz	short loc_51C75
		movsx	eax, word ptr [di+8]
		shl	eax, 8
		mov	es:[bx], eax
		jmp	short loc_51C94	; default
; ���������������������������������������������������������������������������

loc_51C75:				; CODE XREF: Expr_VM_Interpreter_51106+B5Ej
		les	bx, [bp+var_C]
		mov	eax, dword_70458
		sub	es:[bx], eax
		cmp	dword ptr es:[bx], 0
		jg	short loc_51C94	; default
		mov	dword ptr es:[bx], 0

loc_51C8F:				; CODE XREF: Expr_VM_Interpreter_51106+A48j
					; Expr_VM_Interpreter_51106+A4Ej ...
		mov	word ptr [di+0Eh], 0

loc_51C94:				; CODE XREF: Expr_VM_Interpreter_51106+11j
					; Expr_VM_Interpreter_51106+23j ...
		cmp	dword ptr [di+2], 0 ; default
		jz	short loc_51CA4
		cmp	word ptr [di+10h], 0
		jnz	short loc_51CA4
		jmp	loc_5111A
; ���������������������������������������������������������������������������

loc_51CA4:				; CODE XREF: Expr_VM_Interpreter_51106+B93j
					; Expr_VM_Interpreter_51106+B99j
		pop	di
		pop	si
		leave
		retf
Expr_VM_Interpreter_51106	endp

; ���������������������������������������������������������������������������
off_51CA8	dw offset loc_51143, offset loc_51143, offset loc_51133
					; DATA XREF: Expr_VM_Interpreter_51106+28r
		dw offset loc_5113E, offset loc_5114C, offset loc_51C94	; jump table for switch	statement
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51159, offset loc_51162, offset loc_51168
		dw offset loc_51187, offset loc_511CB, offset loc_511F6
		dw offset loc_51213, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_5123A
		dw offset loc_51243, offset loc_51262, offset loc_512A4
		dw offset loc_512E6, offset loc_512EF, offset loc_5130E
		dw offset loc_51350, offset loc_51392, offset loc_5139B
		dw offset loc_513BA, offset loc_513C3, offset loc_513E2
		dw offset loc_513EB, offset loc_5140A, offset loc_51412
		dw offset loc_51438, offset loc_51442, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51466, offset loc_51492
		dw offset loc_514BE, offset loc_51502, offset loc_51545
		dw offset loc_51570, offset loc_515B8, offset loc_515C6
		dw offset loc_515D1, offset loc_515DD, offset loc_515E9
		dw offset loc_515F5, offset loc_51601, offset loc_5160D
		dw offset loc_51619, offset loc_5161B, offset loc_51626
		dw offset loc_511D0, offset loc_5164C, offset loc_5166E
		dw offset loc_51690, offset loc_516B1, offset loc_516F0
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51772
		dw offset loc_517AA, offset loc_51733, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_517E2, offset loc_51807, offset loc_51851
		dw offset loc_5187C, offset loc_5182C, offset loc_518E0
		dw offset loc_51A26, offset loc_5198D, offset loc_518A7
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C25, offset loc_51B47
		dw offset loc_51B57, offset loc_51B67, offset loc_51B67
		dw offset loc_51B67, offset loc_51C94, offset loc_51B87
		dw offset loc_51BFF, offset loc_51BFF, offset loc_51B77
		dw offset loc_51BFF, offset loc_51BFF, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51BFF, offset loc_51BFF, offset loc_51B96
		dw offset loc_51BFF, offset loc_51BAF, offset loc_51A97
		dw offset loc_51ABC, offset loc_51AE1, offset loc_51B07
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51BBE, offset loc_51BFF
		dw offset loc_51B36, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51C94, offset loc_51C94
		dw offset loc_51C94, offset loc_51B2D

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 30 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi). Simple garde de
; bornes : si rawId < buf->markerCount (le compteur pose par
; ProgBuffer_LoadRawAndCountMarkers_AA31D), delegue a ProgBuffer_FindSubProgramByIndex_50E94
; pour trouver le pointeur reel ; sinon retourne NULL. Utilisee pour resoudre les 4 progs_id
; d'une PartEntry (PartEntry_LoadAndResolveNames_A9E3C) et par le mecanisme d'appel de sous-
; routine du script (sub_51033).
; ==============================================================================================
Expr_LookupNamedValue_51E4A	proc far		; CODE XREF: Expr_VM_PushValue_51033+1Dp
					; PartEntry_LoadAndResolveNames_A9E3C+120P ...

var_4		= dword	ptr -4
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
		jbe	short loc_51E75
		push	dx
		push	large dword ptr	[si+2]
		push	cs
		call	near ptr ProgBuffer_FindSubProgramByIndex_50E94
		add	sp, 6
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_51E75:				; CODE XREF: Expr_LookupNamedValue_51E4A+17j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
Expr_LookupNamedValue_51E4A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 48 lignes, LUE INTEGRALEMENT. Adaptateur generique : construit une fausse 'instruction'
; temporaire sur sa PROPRE pile (pas dans un vrai buffer de script persistant) a partir de
; trois parametres (objet de mission, position, donnees d'opcode empaquetees), puis appelle
; directement MissionScript_ExecutePROG_51106 dessus. CONFIRME : l'interprete a 209 cas n'est
; PAS reserve aux scripts de mission stockes — c'est un utilitaire generique 'executer une
; instruction a la demande', appele aussi bien par le systeme de script que par
; GeomNode_BuildOrRefreshCluster_51EDC (gestion de cluster geometrique, sans rapport avec les
; missions).
; ==============================================================================================
Expr_VM_ExecuteSingleInstruction_51E7E	proc far		; CODE XREF: Shared_TriggerExprInstruction_5247D+2Fp
					; Expr_Node_RecomputeIfDirty_524B4+2Fp ...

var_7E		= word ptr -7Eh
var_7C		= dword	ptr -7Ch
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_6C		= dword	ptr -6Ch
var_68		= word ptr -68h
var_66		= word ptr -66h
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 7Eh
		mov	ax, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jz	short locret_51EDA
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	[bp+var_6E], 0
		mov	[bp+var_7C], 0
		xor	ax, ax
		mov	[bp+var_66], ax
		mov	[bp+var_68], ax
		mov	[bp+var_70], ax
		mov	[bp+var_72], ax
		mov	[bp+var_7E], ax
		mov	[bp+var_6C], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_7C], eax
		mov	[bp+var_7E], 0
		mov	eax, [bp+arg_6]
		mov	[bp+var_6C], eax
		lea	ax, [bp+var_7E]
		push	ax
		push	cs
		call	near ptr Expr_VM_Interpreter_51106
		pop	cx

locret_51EDA:				; CODE XREF: Expr_VM_ExecuteSingleInstruction_51E7E+Ej
		leave
		retf
Expr_VM_ExecuteSingleInstruction_51E7E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 547 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi). CORRIGE : nommee a
; tort 'GeomNode_BuildOrRefreshCluster' par une session anterieure (balayage rapide, jamais
; verifie) — aucun contenu ne concerne un cluster geometrique. Appelee directement depuis
; MissionScript_ExecutePROG_51106 (offset +0x6FB). Opere sur la MEME structure MissionObject a
; 85 octets que MissionObject_ResetState/LoadAndResolveNames. CALCULE une position de
; formation en combinant plusieurs points nommes ponderes (+0x21, +0x25, +0x29, mis a
; l'echelle et accumules), via Formation_ComputeGeometryHelper_56D43 et
; AI_ComputeApproachAngles_553CF. PUIS, si le controleur (+0x52) est encore NUL, appelle
; AIAircraft_SpawnAndConditionalLoadProfile_53363 avec cette position, et assigne le resultat
; via SetReference — RESOUT LA QUESTION OUVERTE DU CONTROLEUR : c'est une entite avion/pilote
; IA complete, la meme classe que toute la documentation MVRS/ATRB/GOAL (voir AI_SYSTEM.md).
; ==============================================================================================
PartEntry_ResolveSpawnPositionAndActivate_51EDC	proc far		; CODE XREF: Expr_VM_Interpreter_51106+6FBp
					; Scene_EnsureUnitsSpawned_530FF+6Bp

var_10C		= dword	ptr -10Ch
var_108		= dword	ptr -108h
var_104		= dword	ptr -104h
var_100		= dword	ptr -100h
var_FC		= dword	ptr -0FCh
var_F8		= dword	ptr -0F8h
var_F4		= dword	ptr -0F4h
var_F0		= dword	ptr -0F0h
var_EC		= dword	ptr -0ECh
var_E8		= dword	ptr -0E8h
var_E4		= dword	ptr -0E4h
var_E0		= dword	ptr -0E0h
var_DC		= dword	ptr -0DCh
var_D8		= dword	ptr -0D8h
var_D4		= dword	ptr -0D4h
var_D0		= dword	ptr -0D0h
var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= word ptr -0C4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1E		= dword	ptr -1Eh
var_1A		= byte ptr -1Ah
var_19		= byte ptr -19h
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10Ch

loc_51EE3:
		push	si
		mov	[bp+var_4], 0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+39h]

loc_51EF3:
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_51F42
		cmp	word ptr es:[bx+52h], 0
		jnz	short loc_51F42
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_51F3A
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 9
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		xor	eax, eax
		mov	es:[bx+4Eh], eax
		mov	es:[bx+4Ah], eax
		mov	es:[bx+46h], eax
		mov	es:[bx+42h], eax
		jmp	short loc_51F42
; ���������������������������������������������������������������������������

loc_51F3A:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+34j
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax

loc_51F42:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+1Fj
					; PartEntry_ResolveSpawnPositionAndActivate_51EDC+26j ...
		cmp	[bp+var_4], 0
		jnz	short loc_51F4C
		jmp	loc_52427
; ���������������������������������������������������������������������������

loc_51F4C:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+6Bj
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_51F58
		jmp	loc_52427
; ���������������������������������������������������������������������������

loc_51F58:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+77j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+1Ch], 0
		jnz	short loc_51F65
		jmp	loc_521F0
; ���������������������������������������������������������������������������

loc_51F65:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+84j
		lea	ax, [bp+var_E8]
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		nop
		push	cs
		call	near ptr Expr_Node_GetFocusedNode_543BA
		mov	si, ax
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		lea	ax, [bp+var_DC]
		push	ax
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		call	AI_ComputeApproachAngles_553CF
		add	sp, 6
		les	bx, [bp+arg_0]
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
		call	near ptr Expr_Node_GetFocusedNode_543BA
		add	ax, 12h
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_94], eax
		mov	eax, [si+4]
		mov	[bp+var_90], eax

loc_51FE3:
		mov	eax, [si+8]

loc_51FE7:
		mov	[bp+var_8C], eax

loc_51FEC:
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 21h	; '!'
		mov	word ptr [bp+var_2C+2],	ax
		mov	word ptr [bp+var_2C], dx
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
		add	dx, 25h	; '%'
		mov	word ptr [bp+var_4C+2],	ax
		mov	word ptr [bp+var_4C], dx
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
		add	dx, 29h	; ')'
		mov	word ptr [bp+var_6C+2],	ax
		mov	word ptr [bp+var_6C], dx
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
		jmp	short loc_52244
; ���������������������������������������������������������������������������

loc_521F0:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+86j
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		push	ss
		lea	ax, [bp+var_A0]
		push	ax
		push	cs
		call	near ptr GeomNode_SumOffsetsUpChain_50EEB
		add	sp, 8
		mov	eax, [bp+var_A0]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_8C], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2Dh]
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_8], eax

loc_52244:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+312j
		lea	ax, [bp+var_C4]
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		lea	ax, [bp+var_C4]
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		mov	eax, [bp+var_8]
		neg	eax
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		lea	ax, [bp+var_16]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		call	Matrix_BuildAxisZ_572BC
		add	sp, 4
		lea	ax, [bp+var_C4]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2Fh]
		lea	ax, [bp+var_C4]
		push	ax
		lea	ax, [bp+var_94]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr Expr_LookupBuiltinFuncDesc_52C5F
		add	sp, 4
		push	dx
		push	ax
		push	large [bp+var_4]
		push	word_706A0
		nop
		push	cs
		call	near ptr AIAircraft_SpawnAndConditionalLoadProfile_53363
		add	sp, 10h
		mov	[bp+var_18], ax
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 52h	; 'R'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	SetReference
		add	sp, 6
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+52h], 0
		jnz	short loc_522D7
		jmp	loc_52427
; ���������������������������������������������������������������������������

loc_522D7:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+3F6j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+52h]

loc_522DE:
		mov	bx, es:[bx+52h]

loc_522E2:
		mov	bx, [bx]
		call	dword ptr [bx]

loc_522E6:
		pop	cx
		or	ax, dx
		jz	short loc_522FE
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+52h]
		mov	bx, es:[bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_52300
; ���������������������������������������������������������������������������

loc_522FE:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+40Dj
		mov	al, 17h

loc_52300:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+420j
		cmp	al, 6
		jnz	short loc_5233F
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+2Fh], 0
		jnz	short loc_5233F
		mov	[bp+var_19], 1
		mov	bx, es:[bx+52h]
		mov	bx, [bx+51h]
		mov	al, [bp+var_19]
		mov	[bx+20h], al
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+52h]
		push	word ptr [bx+51h]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+52h]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		or	byte ptr [bx+75h], 4

loc_5233F:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+426j
					; PartEntry_ResolveSpawnPositionAndActivate_51EDC+430j
		les	bx, [bp+arg_0]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_52353
		jmp	loc_5241B
; ���������������������������������������������������������������������������

loc_52353:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+472j
		lea	ax, [bp+var_24+2]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 12h
		mov	word ptr [bp+var_24], ax
		mov	word ptr [bp+var_28+2],	dx
		push	8
		push	ax
		push	dx
		push	ds
		lea	ax, [bp+var_24+2]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	[bp+var_1A], 0
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+12h], 0
		jz	short loc_5239F
		lea	ax, [bp+var_24+2]
		push	ax
		mov	bx, es:[bx+52h]
		push	large dword ptr	[bx+5Ah]
		call	VROOMM_StubThunk_6C3DA
		add	sp, 6

loc_5239F:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+4ADj
		les	bx, [bp+arg_0]
		mov	al, es:[bx+31h]
		mov	byte ptr [bp+var_28], al
		mov	bx, es:[bx+52h]
		mov	[bx+50h], al
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+32h]
		mov	ah, 0
		mov	word ptr [bp+var_30+2],	ax
		push	ax
		mov	ax, word_706A0
		add	ax, 34h	; '4'
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_52DDB
		add	sp, 4
		mov	word ptr [bp+var_2C+2],	dx
		mov	word ptr [bp+var_2C], ax
		cmp	[bp+var_2C], 0
		jz	short loc_523FD
		push	large 0
		push	3748h
		les	bx, [bp+var_2C]
		push	word ptr es:[bx+52h]
		push	0B3h ; '�'
		les	bx, [bp+arg_0]

loc_523EC:
		push	word ptr es:[bx+52h]

loc_523F0:
		mov	bx, es:[bx+52h]
		mov	bx, [bx]

loc_523F6:
		call	dword ptr [bx+88h]
		add	sp, 0Ch

loc_523FD:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+4FBj
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+31h], 0FFh
		jnz	short loc_5240D
		inc	word_706A7
		jmp	short loc_5241B
; ���������������������������������������������������������������������������

loc_5240D:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+529j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+31h], 1
		jnz	short loc_5241B
		inc	word_706A3

loc_5241B:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+474j
					; PartEntry_ResolveSpawnPositionAndActivate_51EDC+52Fj ...
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr Shared_TriggerExprInstruction_5247D
		add	sp, 4

loc_52427:				; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+6Dj
					; PartEntry_ResolveSpawnPositionAndActivate_51EDC+79j ...
		pop	si
		leave
		retf
PartEntry_ResolveSpawnPositionAndActivate_51EDC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, efface le bit dirty d'un nœud (+0x39), décrémente des compteurs globaux
; (word_706A3/706A7) selon son état antérieur, notifie via Expr_Node_NotifyChange_53337.
; ==============================================================================================
Expr_Node_ClearDirtyAndNotify_5242A	proc far		; CODE XREF: Expr_VM_Interpreter_51106+720p
					; Expr_Node_UpdateAndPropagate_52AC6+133p ...

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+52h], 0
		jz	short loc_52473
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_52460
		cmp	byte ptr es:[bx+31h], 0FFh
		jnz	short loc_52452
		dec	word_706A7
		jmp	short loc_52460
; ���������������������������������������������������������������������������

loc_52452:				; CODE XREF: Expr_Node_ClearDirtyAndNotify_5242A+20j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+31h], 1
		jnz	short loc_52460
		dec	word_706A3

loc_52460:				; CODE XREF: Expr_Node_ClearDirtyAndNotify_5242A+19j
					; Expr_Node_ClearDirtyAndNotify_5242A+26j ...
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+52h]
		push	word_706A0
		nop
		push	cs
		call	near ptr Expr_Node_NotifyChange_53337
		add	sp, 4

loc_52473:				; CODE XREF: Expr_Node_ClearDirtyAndNotify_5242A+Bj
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+39h], 0FEh
		pop	bp
		retf
Expr_Node_ClearDirtyAndNotify_5242A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 23 lignes, LUE INTEGRALEMENT. Appelee par MissionFormation_ComputeSlotAndSpawn_51EDC EN
; INTERNE (rappel controle vers l'interprete, pas un appelant externe sans rapport). Manipule
; +0x39/+0x3A/+0x42, les MEMES champs de statut que
; MissionObject_ResetState_A9DFD/MissionObject_LoadAndResolveNames_A9E3C utilisent sur les
; objets de mission — la MEME structure generique a 85 octets, pour une sous-evaluation. Pose
; bit0 de +0x39, efface bits2/3, efface +0x3A, puis appelle
; Expr_VM_ExecuteSingleInstruction_51E7E avec +0x42 (donnees empaquetees) et une position
; depuis word_706A0+0x40.
; ==============================================================================================
Shared_TriggerExprInstruction_5247D	proc far		; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+545p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+39h], 1
		and	byte ptr es:[bx+39h], 0F7h
		and	byte ptr es:[bx+39h], 0FBh
		mov	dword ptr es:[bx+3Ah], 0
		push	word ptr [bp+arg_0+2]
		push	bx
		push	large dword ptr	es:[bx+42h]
		mov	ax, word_706A0
		add	ax, 40h	; '@'
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_51E7E
		add	sp, 0Ah
		pop	bp
		retf
Shared_TriggerExprInstruction_5247D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, réévalue un champ de nœud (bytecode à +0x4A) uniquement si son bit dirty (+0x39) est
; posé.
; ==============================================================================================
Expr_Node_RecomputeIfDirty_524B4	proc far		; CODE XREF: Expr_Node_DetachChildAndRecompute_524EB+20p
					; Expr_Node_UpdateAndPropagate_52AC6:loc_52AF2p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_524E9
		and	byte ptr es:[bx+39h], 0FEh
		or	byte ptr es:[bx+39h], 2
		push	word ptr [bp+arg_0+2]
		push	bx
		push	large dword ptr	es:[bx+4Ah]
		mov	ax, word_706A0
		add	ax, 40h	; '@'
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_51E7E
		add	sp, 0Ah

loc_524E9:				; CODE XREF: Expr_Node_RecomputeIfDirty_524B4+12j
		pop	bp
		retf
Expr_Node_RecomputeIfDirty_524B4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, détache un nœud enfant (+0x52, via sub_6BFBF) puis force la réévaluation via
; Expr_Node_RecomputeIfDirty_524B4.
; ==============================================================================================
Expr_Node_DetachChildAndRecompute_524EB	proc far		; CODE XREF: Expr_VM_Interpreter_51106+745p

arg_0		= dword	ptr  6

		push	bp

loc_524EC:
		mov	bp, sp
		les	bx, [bp+arg_0]

loc_524F1:
		cmp	word ptr es:[bx+52h], 0
		jz	short loc_52511
		push	0
		push	word ptr es:[bx+52h]
		call	VROOMM_StubThunk_6BFBF
		add	sp, 4
		push	large [bp+arg_0]
		push	cs
		call	near ptr Expr_Node_RecomputeIfDirty_524B4
		add	sp, 4

loc_52511:				; CODE XREF: Expr_Node_DetachChildAndRecompute_524EB+Bj
		pop	bp
		retf
Expr_Node_DetachChildAndRecompute_524EB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 685 lignes, LUE EN PROFONDEUR (session dediee aux ordres de mission avec Remi). CORRIGE
; : ce n'est pas une boucle generique de marshalling — c'est le vrai point d'aiguillage par
; ordre, avec une GARDE D'ENTREE qui determine si un ordre execute reellement une commande de
; vol, PUIS un switch a 31 cas reels (indice = opcode-0xA1, cmp bx,0x1E) qui distingue Take
; off, Land, Destroy target, Defend target, Defend area, Follow ally, et 7 ordres non
; identifies par la table externe (0xA3, 0xAB, 0xB1-0xB5) — detail complet dans
; MISSION_SCRIPT_OPCODES.md.   GARDE D'ENTREE (determine si QUOI QUE CE SOIT s'execute, avant
; meme de regarder quel ordre est demande) : verifie [arg_0+0x52] != 0 (l'objet de mission
; reference par le script doit avoir un controleur associe) ET le bit 1 de [arg_0+0x39] doit
; etre CLAIR (probable 'objet non occupe/disponible') — si l'une des deux conditions echoue,
; retourne 0 IMMEDIATEMENT sans executer aucune commande de vol, quel que soit l'opcode
; demande par le script. Si la garde passe : pose [arg_0+0x54]=0xFF (drapeau d'etat) avant le
; switch.  SORTIE COMMUNE (tous les 31 cas convergent ici, loc_52A41) : delegue la VRAIE
; execution tactique a une methode virtuelle UNIQUE et GENERIQUE, [arg_0+0x52 -> vtable+0x88],
; en lui passant la position/reference resolue par le cas specifique, une valeur de
; 'competence' (copiee depuis la cible resolue +0x52 si presente), l'opcode et une duree.
; AUCUN calcul de poursuite, de tir ou de suivi vectoriel continu ne vit dans cette fonction
; elle-meme ni dans aucun de ses 31 cas — c'est une couche de RESOLUTION D'INTENTION (ou
; aller, quoi cibler), pas d'EXECUTION TACTIQUE. Cette derniere vit entierement dans la
; methode virtuelle +0x88, non identifiee a ce stade.  PIEGE NOTE : le champ +0x52 utilise ici
; comme POINTEUR de controleur appartient a un objet DIFFERENT du +0x52 scalaire (performance
; JETP/TOFF, alimentant byte_720C3) trouve ailleurs dans le binaire — meme decalage, deux
; structures distinctes.
; ==============================================================================================
MissionScript_CallNativeHandler_52513	proc far		; CODE XREF: Expr_VM_Interpreter_51106+B12p

var_E6		= dword	ptr -0E6h
var_E2		= dword	ptr -0E2h
var_DE		= dword	ptr -0DEh
var_DA		= dword	ptr -0DAh
var_D6		= dword	ptr -0D6h
var_D2		= dword	ptr -0D2h
var_CE		= dword	ptr -0CEh
var_CA		= dword	ptr -0CAh
var_C6		= dword	ptr -0C6h
var_C2		= dword	ptr -0C2h
var_BE		= dword	ptr -0BEh
var_BA		= dword	ptr -0BAh
var_B6		= dword	ptr -0B6h
var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= dword	ptr -0A6h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0E6h
		push	si
		push	di
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+52h], 0
		jz	short loc_52534
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_52539

loc_52534:				; CODE XREF: MissionScript_CallNativeHandler_52513+11j
					; MissionScript_CallNativeHandler_52513+1F5j ...
		xor	ax, ax
		jmp	loc_52A84
; ���������������������������������������������������������������������������

loc_52539:				; CODE XREF: MissionScript_CallNativeHandler_52513+1Fj
		mov	dx, [bp+arg_4]
		mov	ax, [bp+arg_6]
		mov	[bp+var_2], ax
		mov	[bp+var_4], 0
		mov	[bp+var_8], 0
		mov	[bp+var_C], 0
		mov	si, word_706A0
		mov	di, dx
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+54h], 0FFh
		mov	bx, dx
		sub	bx, 0A1h	; switch 31 cases
		cmp	bx, 1Eh
		jbe	short loc_52573
		jmp	loc_52A41	; default
; ���������������������������������������������������������������������������

loc_52573:				; CODE XREF: MissionScript_CallNativeHandler_52513+5Bj
		shl	bx, 1
		jmp	cs:off_52A88[bx] ; switch jump

loc_5257A:				; DATA XREF: seg114:off_52A88o
		push	[bp+var_2]	; case 0xBF
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_56]
		push	ax
		nop
		push	cs
		call	near ptr Player_ResolveAttachPointN_5305A
		add	sp, 8
		mov	eax, [bp+var_56]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_4E]

loc_525A4:				; CODE XREF: MissionScript_CallNativeHandler_52513+144j
					; MissionScript_CallNativeHandler_52513+1B0j ...
		mov	[bp+var_42], eax
		les	bx, [bp+arg_0]
		mov	al, byte ptr [bp+var_2]

loc_525AE:				; CODE XREF: MissionScript_CallNativeHandler_52513+395j
		mov	es:[bx+54h], al
		jmp	loc_52A41	; default
; ���������������������������������������������������������������������������

loc_525B5:				; CODE XREF: MissionScript_CallNativeHandler_52513+62j
					; DATA XREF: seg114:off_52A88o
		push	[bp+var_2]	; case 0xA1
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_62]
		push	ax
		nop
		push	cs
		call	near ptr Player_ResolveAttachPointN_5305A
		add	sp, 8
		mov	eax, [bp+var_62]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_5A]

loc_525DF:
		mov	[bp+var_42], eax

loc_525E3:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+54h], 0FFh

loc_525EB:				; default
		jmp	loc_52A41
; ���������������������������������������������������������������������������

loc_525EE:				; CODE XREF: MissionScript_CallNativeHandler_52513+62j
					; DATA XREF: seg114:off_52A88o
		push	[bp+arg_8]	; case 0xA2
		mov	ax, si

loc_525F3:
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_DA]
		push	ax
		nop
		push	cs
		call	near ptr Player_ResolveAttachPointN_5305A
		add	sp, 8
		mov	eax, [bp+var_DA]
		mov	[bp+var_CE], eax
		mov	eax, [bp+var_D6]
		mov	[bp+var_CA], eax
		mov	eax, [bp+var_D2]
		mov	[bp+var_C6], eax
		lea	ax, [bp+var_CE]
		mov	word ptr [bp+var_8+2], ss
		mov	word ptr [bp+var_8], ax
		push	[bp+var_2]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_6E]
		push	ax
		nop
		push	cs
		call	near ptr Player_ResolveAttachPointN_5305A
		add	sp, 8
		mov	eax, [bp+var_6E]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_66]
		jmp	loc_525A4
; ���������������������������������������������������������������������������

loc_5265A:				; CODE XREF: MissionScript_CallNativeHandler_52513+62j
					; DATA XREF: seg114:off_52A88o
		push	[bp+arg_8]	; case 0xA4
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_DA]
		push	ax
		nop
		push	cs
		call	near ptr Player_ResolveAttachPointN_5305A
		add	sp, 8
		mov	eax, [bp+var_DA]
		mov	[bp+var_CE], eax
		mov	eax, [bp+var_D6]
		mov	[bp+var_CA], eax
		mov	eax, [bp+var_D2]
		mov	[bp+var_C6], eax
		lea	ax, [bp+var_CE]
		mov	word ptr [bp+var_8+2], ss
		mov	word ptr [bp+var_8], ax
		push	[bp+var_2]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_7A]
		push	ax
		nop
		push	cs
		call	near ptr Player_ResolveAttachPointN_5305A
		add	sp, 8
		mov	eax, [bp+var_7A]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_72]
		jmp	loc_525A4
; ���������������������������������������������������������������������������

loc_526C6:				; CODE XREF: MissionScript_CallNativeHandler_52513+62j
					; DATA XREF: seg114:off_52A88o
		push	large [bp+arg_0] ; case	0xA3
		push	ss
		lea	ax, [bp+var_CE]
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		push	[bp+var_2]
		mov	ax, si
		add	ax, 1Ah
		push	ax
		nop
		push	cs
		call	near ptr GeomNode_SumAndCount_53034
		add	sp, 4
		mov	word ptr [bp+var_3A+2],	dx
		mov	word ptr [bp+var_3A], ax
		lea	ax, [bp+var_CE]

loc_526F3:
		push	ax
		push	dx
		push	word ptr [bp+var_3A]
		les	bx, [bp+var_3A]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		or	ax, ax
		jz	short loc_5270B
		jmp	loc_52534
; ���������������������������������������������������������������������������

loc_5270B:				; CODE XREF: MissionScript_CallNativeHandler_52513+1F3j
		mov	ax, word ptr [bp+var_3A+2]
		mov	dx, word ptr [bp+var_3A]
		add	dx, 22h	; '"'
		mov	word ptr [bp+var_3E+2],	ax
		mov	word ptr [bp+var_3E], dx
		les	di, [bp+var_3E]
		mov	eax, es:[di]
		mov	[bp+var_4A], eax
		mov	eax, es:[di+4]
		mov	[bp+var_46], eax
		mov	eax, es:[di+8]
		mov	[bp+var_42], eax
		mov	di, 0A4h ; '�'
		push	[bp+arg_8]
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_E6]
		push	ax
		nop
		push	cs
		call	near ptr Player_ResolveAttachPointN_5305A
		add	sp, 8
		mov	eax, [bp+var_E6]
		mov	[bp+var_DA], eax
		mov	eax, [bp+var_E2]
		mov	[bp+var_D6], eax
		mov	eax, [bp+var_DE]
		mov	[bp+var_D2], eax
		lea	ax, [bp+var_DA]
		mov	word ptr [bp+var_8+2], ss
		mov	word ptr [bp+var_8], ax
		jmp	loc_52A41	; default
; ���������������������������������������������������������������������������

loc_5277C:				; CODE XREF: MissionScript_CallNativeHandler_52513+62j
					; DATA XREF: seg114:off_52A88o
		cmp	[bp+var_2], 0FFh ; case	0xAA
		jnz	short loc_5278F
		les	bx, [bp+arg_0]
		mov	al, es:[bx+32h]
		mov	ah, 0
		mov	[bp+var_2], ax

loc_5278F:				; CODE XREF: MissionScript_CallNativeHandler_52513+26Ej
		push	[bp+var_2]
		mov	ax, si
		add	ax, 34h	; '4'
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_52DDB
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_527B0
		jmp	loc_529B4
; ���������������������������������������������������������������������������

loc_527B0:				; CODE XREF: MissionScript_CallNativeHandler_52513+298j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+33h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_4A], eax
		mov	ax, es:[bx+35h]
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_46], eax
		mov	ax, es:[bx+37h]
		mov	[bp+var_1A], ax
		movsx	eax, [bp+var_1A]
		shl	eax, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		jmp	loc_5289A
; ���������������������������������������������������������������������������
		jmp	loc_529B4
; ���������������������������������������������������������������������������

loc_52809:				; CODE XREF: MissionScript_CallNativeHandler_52513+62j
					; DATA XREF: seg114:off_52A88o
		push	[bp+var_2]	; case 0xA7
		mov	ax, si
		add	ax, 34h	; '4'
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_52DDB
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_5282A
		jmp	loc_529B4
; ���������������������������������������������������������������������������

loc_5282A:				; CODE XREF: MissionScript_CallNativeHandler_52513+312j
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_86]
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		mov	eax, [bp+var_86]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_7E]
		jmp	short loc_5289A
; ���������������������������������������������������������������������������
		jmp	loc_529B4
; ���������������������������������������������������������������������������

loc_52855:				; CODE XREF: MissionScript_CallNativeHandler_52513+62j
					; DATA XREF: seg114:off_52A88o
		push	[bp+var_2]	; case 0xA8
		mov	ax, si
		add	ax, 34h	; '4'
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_52DDB
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_528AB
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_92]
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		mov	eax, [bp+var_92]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_8A]

loc_5289A:				; CODE XREF: MissionScript_CallNativeHandler_52513+2F0j
					; MissionScript_CallNativeHandler_52513+33Dj
		mov	[bp+var_42], eax
		les	bx, [bp+var_C]
		mov	al, es:[bx+54h]
		les	bx, [bp+arg_0]
		jmp	loc_525AE
; ���������������������������������������������������������������������������

loc_528AB:				; CODE XREF: MissionScript_CallNativeHandler_52513+35Ej
		mov	di, 0FFFFh
		jmp	loc_52A41	; default
; ���������������������������������������������������������������������������

loc_528B1:				; CODE XREF: MissionScript_CallNativeHandler_52513+62j
					; DATA XREF: seg114:off_52A88o
		push	[bp+var_2]	; case 0xA9
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_9E]
		push	ax
		nop
		push	cs
		call	near ptr Player_ResolveAttachPointN_5305A
		add	sp, 8
		mov	eax, [bp+var_9E]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_9A]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_96]

loc_528DF:
		jmp	loc_525A4
; ���������������������������������������������������������������������������

loc_528E2:				; CODE XREF: MissionScript_CallNativeHandler_52513+62j
					; DATA XREF: seg114:off_52A88o
		mov	[bp+var_22], 0	; case 0xB1
		mov	eax, [bp+var_22]

loc_528EE:
		mov	[bp+var_46], eax

loc_528F2:
		mov	[bp+var_4A], eax
		mov	ax, [si+24h]
		cmp	ax, [bp+var_2]
		jbe	short loc_5290E
		mov	ax, [bp+var_2]
		shl	ax, 2
		mov	bx, [si+26h]
		add	bx, ax
		mov	eax, [bx]
		jmp	short loc_52911
; ���������������������������������������������������������������������������

loc_5290E:				; CODE XREF: MissionScript_CallNativeHandler_52513+3E9j
		xor	eax, eax

loc_52911:				; CODE XREF: MissionScript_CallNativeHandler_52513+3F9j
		mov	[bp+var_26], eax
		shl	eax, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		jmp	loc_529E8
; ���������������������������������������������������������������������������

loc_52924:				; CODE XREF: MissionScript_CallNativeHandler_52513+62j
					; DATA XREF: seg114:off_52A88o
		push	[bp+var_2]	; case 0xB3
		mov	ax, si
		add	ax, 34h	; '4'
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_52DDB
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_529B4
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_AA]
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		mov	eax, [bp+var_AA]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_A2]
		jmp	short loc_529E8
; ���������������������������������������������������������������������������
		jmp	short loc_529B4
; ���������������������������������������������������������������������������

loc_5296D:				; CODE XREF: MissionScript_CallNativeHandler_52513+62j
					; DATA XREF: seg114:off_52A88o
		push	[bp+var_2]	; case 0xB5
		mov	ax, si
		add	ax, 34h	; '4'
		push	ax
		nop
		push	cs
		call	near ptr Expr_LookupNamedValue_52DDB
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_529B4
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_B6]
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		mov	eax, [bp+var_B6]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_AE]
		jmp	short loc_529E8
; ���������������������������������������������������������������������������

loc_529B4:				; CODE XREF: MissionScript_CallNativeHandler_52513+29Aj
					; MissionScript_CallNativeHandler_52513+2F3j ...
		mov	di, 0FFFEh
		jmp	loc_52A41	; default
; ���������������������������������������������������������������������������

loc_529BA:				; CODE XREF: MissionScript_CallNativeHandler_52513+62j
					; DATA XREF: seg114:off_52A88o
		push	[bp+var_2]	; case 0xB4
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_C2]
		push	ax
		nop
		push	cs
		call	near ptr Player_ResolveAttachPointN_5305A
		add	sp, 8
		mov	eax, [bp+var_C2]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_BE]

loc_529DF:
		mov	[bp+var_46], eax
		mov	eax, [bp+var_BA]

loc_529E8:				; CODE XREF: MissionScript_CallNativeHandler_52513+40Ej
					; MissionScript_CallNativeHandler_52513+456j ...
		mov	[bp+var_42], eax
		jmp	short loc_52A41	; default
; ���������������������������������������������������������������������������

loc_529EE:				; CODE XREF: MissionScript_CallNativeHandler_52513+62j
					; DATA XREF: seg114:off_52A88o
		mov	[bp+var_2E], 0	; case 0xB2
		mov	eax, [bp+var_2E]
		mov	[bp+var_42], eax
		mov	[bp+var_4A], eax
		mov	ax, [si+24h]
		cmp	ax, [bp+var_2]
		jbe	short loc_52A1A
		mov	ax, [bp+var_2]
		shl	ax, 2
		mov	bx, [si+26h]
		add	bx, ax
		mov	eax, [bx]
		jmp	short loc_52A1D
; ���������������������������������������������������������������������������

loc_52A1A:				; CODE XREF: MissionScript_CallNativeHandler_52513+4F5j
		xor	eax, eax

loc_52A1D:				; CODE XREF: MissionScript_CallNativeHandler_52513+505j
		mov	[bp+var_32], eax
		shl	eax, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_46], eax
		jmp	short loc_52A41	; default
; ���������������������������������������������������������������������������

loc_52A33:				; CODE XREF: MissionScript_CallNativeHandler_52513+62j
					; DATA XREF: seg114:off_52A88o
		mov	ax, [bp+var_2]	; case 0xAB
		mov	word ptr [bp+var_8], ax
		mov	eax, [si+54h]
		mov	[bp+var_C], eax

loc_52A41:				; CODE XREF: MissionScript_CallNativeHandler_52513+5Dj
					; MissionScript_CallNativeHandler_52513+62j ...
		cmp	di, 0FFFEh	; default
		jnz	short loc_52A49
		jmp	loc_52534
; ���������������������������������������������������������������������������

loc_52A49:				; CODE XREF: MissionScript_CallNativeHandler_52513+531j
		cmp	di, 0FFFFh
		jnz	short loc_52A53
		mov	ax, 1
		jmp	short loc_52A84
; ���������������������������������������������������������������������������

loc_52A53:				; CODE XREF: MissionScript_CallNativeHandler_52513+539j
		cmp	[bp+var_C], 0
		jz	short loc_52A64
		les	bx, [bp+var_C]
		mov	ax, es:[bx+52h]
		mov	[bp+var_4], ax

loc_52A64:				; CODE XREF: MissionScript_CallNativeHandler_52513+545j
		push	large [bp+var_8]
		lea	ax, [bp+var_4A]
		push	ax
		push	[bp+var_4]
		push	di
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+52h]
		mov	bx, es:[bx+52h]
		mov	bx, [bx]
		call	dword ptr [bx+88h]
		add	sp, 0Ch

loc_52A84:				; CODE XREF: MissionScript_CallNativeHandler_52513+23j
					; MissionScript_CallNativeHandler_52513+53Ej
		pop	di
		pop	si
		leave
		retf
MissionScript_CallNativeHandler_52513	endp

; ���������������������������������������������������������������������������
off_52A88	dw offset loc_525B5	; DATA XREF: MissionScript_CallNativeHandler_52513+62r
		dw offset loc_525EE	; jump table for switch	statement
		dw offset loc_526C6
		dw offset loc_5265A
		dw offset loc_5265A
		dw offset loc_52A41
		dw offset loc_52809
		dw offset loc_52855
		dw offset loc_528B1
		dw offset loc_5277C
		dw offset loc_52A33
		dw offset loc_5265A
		dw offset loc_52A41
		dw offset loc_52A41
		dw offset loc_52A41
		dw offset loc_52A41
		dw offset loc_528E2
		dw offset loc_529EE
		dw offset loc_52924
		dw offset loc_529BA
		dw offset loc_5296D
		dw offset loc_52A41
		dw offset loc_52A41
		dw offset loc_52A41
		dw offset loc_52A41
		dw offset loc_52A41
		dw offset loc_52A41
		dw offset loc_52A41
		dw offset loc_52A41
		dw offset loc_52A41
		dw offset loc_5257A

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, cycle complet de réévaluation d'un nœud : réévalue (524B4), exécute la VM (51E7E),
; stocke le résultat (52C9C), efface le flag dirty (5242A).
; ==============================================================================================
Expr_Node_UpdateAndPropagate_52AC6	proc far		; CODE XREF: PartEntry_DispatchMissionUpdateTick_52E51+2Dp

var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	si, word_706A0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+52h], 0
		jnz	short loc_52AFB
		mov	al, es:[bx+39h]

loc_52AE0:
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_52AED
		jmp	loc_52C5B
; ���������������������������������������������������������������������������

loc_52AED:				; CODE XREF: Expr_Node_UpdateAndPropagate_52AC6+22j
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs

loc_52AF2:
		call	near ptr Expr_Node_RecomputeIfDirty_524B4

loc_52AF5:				; CODE XREF: Expr_Node_UpdateAndPropagate_52AC6+136j
		add	sp, 4
		jmp	loc_52C5B
; ���������������������������������������������������������������������������

loc_52AFB:				; CODE XREF: Expr_Node_UpdateAndPropagate_52AC6+14j
		les	bx, [bp+arg_0]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		mov	ah, 0
		or	ax, ax
		jz	short loc_52B11
		jmp	loc_52C5B
; ���������������������������������������������������������������������������

loc_52B11:				; CODE XREF: Expr_Node_UpdateAndPropagate_52AC6+46j
		mov	al, es:[bx+39h]
		shl	ax, 0Ch
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_52B22
		jmp	loc_52BFF
; ���������������������������������������������������������������������������

loc_52B22:				; CODE XREF: Expr_Node_UpdateAndPropagate_52AC6+57j
		push	word ptr [bp+arg_0+2]
		push	bx
		push	large dword ptr	es:[bx+4Eh]
		mov	ax, si
		add	ax, 40h	; '@'
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_51E7E
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	di, es:[bx+52h]
		add	di, 12h
		cmp	dword ptr [si+54h], 0
		jz	short loc_52B61
		push	large dword ptr	[si+54h]
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		nop
		push	cs
		call	near ptr Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		mov	dx, ss
		lea	ax, [bp+var_24]
		jmp	short loc_52B7E
; ���������������������������������������������������������������������������

loc_52B61:				; CODE XREF: Expr_Node_UpdateAndPropagate_52AC6+81j
		mov	eax, dword_707F8
		mov	[bp+var_24], eax
		mov	eax, dword_707FC
		mov	[bp+var_20], eax
		mov	eax, dword_70800
		mov	[bp+var_1C], eax
		mov	dx, ss
		lea	ax, [bp+var_24]

loc_52B7E:				; CODE XREF: Expr_Node_UpdateAndPropagate_52AC6+99j
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
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_4], eax
		mov	eax, dword_72540
		mov	[bp+var_C], eax
		shl	eax, 8

loc_52BE3:
		cmp	eax, [bp+var_4]

loc_52BE7:
		jge	short loc_52BEE
		mov	ax, 1
		jmp	short loc_52BF0
; ���������������������������������������������������������������������������

loc_52BEE:				; CODE XREF: Expr_Node_UpdateAndPropagate_52AC6:loc_52BE7j
		xor	ax, ax

loc_52BF0:				; CODE XREF: Expr_Node_UpdateAndPropagate_52AC6+126j
		or	al, al

loc_52BF2:
		jz	short loc_52C5B
		push	large [bp+arg_0]
		push	cs
		call	near ptr Expr_Node_ClearDirtyAndNotify_5242A
		jmp	loc_52AF5
; ���������������������������������������������������������������������������

loc_52BFF:				; CODE XREF: Expr_Node_UpdateAndPropagate_52AC6+59j
		push	large [bp+arg_0]
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+46h]
		mov	ax, si
		add	ax, 40h	; '@'
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_51E7E
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+52h]
		les	bx, [si+54h]
		cmp	ax, es:[bx+52h]
		jnz	short loc_52C5B
		mov	dx, 0FFFFh
		mov	al, [si+6Eh]
		mov	ah, 0
		cmp	ax, 0A5h ; '�'
		jz	short loc_52C49
		mov	al, [si+6Eh]
		mov	ah, 0
		cmp	ax, 0A6h ; '�'
		jz	short loc_52C49
		mov	al, [si+6Eh]
		mov	ah, 0
		cmp	ax, 0A2h ; '�'
		jnz	short loc_52C52

loc_52C49:				; CODE XREF: Expr_Node_UpdateAndPropagate_52AC6+16Dj
					; Expr_Node_UpdateAndPropagate_52AC6+177j
		mov	al, [si+6Fh]
		mov	ah, 0
		mov	dx, ax
		jmp	short $+2

loc_52C52:				; CODE XREF: Expr_Node_UpdateAndPropagate_52AC6+181j
		mov	ax, dx
		les	bx, [bp+arg_0]
		mov	es:[bx+54h], al

loc_52C5B:				; CODE XREF: Expr_Node_UpdateAndPropagate_52AC6+24j
					; Expr_Node_UpdateAndPropagate_52AC6+32j ...
		pop	di
		pop	si
		leave
		retf
Expr_Node_UpdateAndPropagate_52AC6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, table lookup bornée par index (octet +0x1B) dans une table de descripteurs de fonctions
; natives (base word_706A0+0x30, stride 9 octets) — alimente Expr_VM_CallNativeFunction.
; ==============================================================================================
Expr_LookupBuiltinFuncDesc_52C5F	proc far		; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+3C0p
					; Expr_Node_LookupAndConvert_52D69+1Cp ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		mov	dx, ax
		mov	[bp+var_4], 0
		mov	bx, word_706A0
		cmp	[bx+2Eh], dx
		jbe	short loc_52C94
		imul	ax, 9
		mov	dx, [bx+32h]
		mov	bx, [bx+30h]
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		jmp	short $+2

loc_52C94:				; CODE XREF: Expr_LookupBuiltinFuncDesc_52C5F+20j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
Expr_LookupBuiltinFuncDesc_52C5F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658) ou réutilise un buffer, y stocke un vecteur 3D résolu via
; GeomNode_SumOffsetsUpChain_50EEB.
; ==============================================================================================
Expr_Node_StoreResultVector_52C9C	proc far		; CODE XREF: Compiler_EmitByTokenType+90P
					; Compiler_EmitByTokenType+12FP ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		les	bx, [bp+arg_4]
		cmp	word ptr es:[bx+52h], 0
		jz	short loc_52CE9
		mov	si, word ptr [bp+arg_0]
		mov	di, es:[bx+52h]
		add	di, 12h
		or	si, si
		jz	short loc_52CBD
		mov	ax, si
		jmp	short loc_52CC7
; ���������������������������������������������������������������������������

loc_52CBD:				; CODE XREF: Expr_Node_StoreResultVector_52C9C+1Bj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_52CC7:				; CODE XREF: Expr_Node_StoreResultVector_52C9C+1Fj
		or	ax, ax
		jz	short loc_52CE5
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4],	eax
		mov	eax, [di+8]
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_52CE7
; ���������������������������������������������������������������������������

loc_52CE5:				; CODE XREF: Expr_Node_StoreResultVector_52C9C+2Dj
		mov	ax, si

loc_52CE7:				; CODE XREF: Expr_Node_StoreResultVector_52C9C+47j
		jmp	short loc_52CFE
; ���������������������������������������������������������������������������

loc_52CE9:				; CODE XREF: Expr_Node_StoreResultVector_52C9C+Dj
		mov	ax, word ptr [bp+arg_4]
		add	ax, 1Dh
		push	word ptr [bp+arg_4+2]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr GeomNode_SumOffsetsUpChain_50EEB
		add	sp, 8

loc_52CFE:				; CODE XREF: Expr_Node_StoreResultVector_52C9C:loc_52CE7j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
Expr_Node_StoreResultVector_52C9C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enveloppe fine transmettant à sub_6CE24(word_706A0, arg) — variante de résolution de
; valeur nommée.
; ==============================================================================================
Expr_LookupNamedValue_52D08	proc far		; CODE XREF: AI_ResolveNodePosition_54274+45p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	large [bp+arg_0]
		push	word_706A0
		call	VROOMM_StubThunk_6CE24
		add	sp, 6
		pop	bp
		retf
Expr_LookupNamedValue_52D08	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, prédicat booléen : vérifie un indicateur d'erreur (+0x20, signe) sur le petit-enfant
; d'un nœud (+0x52 → +0x51).
; ==============================================================================================
Expr_Node_HasChildError_52D1D	proc far		; CODE XREF: Compiler_EmitByTokenType+51P
					; Compiler_EmitByTokenType+60P

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	dl, 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+52h], 0
		jz	short loc_52D40
		mov	si, es:[bx+52h]
		mov	si, [si+51h]
		mov	al, [si+20h]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	dl, al

loc_52D40:				; CODE XREF: Expr_Node_HasChildError_52D1D+Ej
		mov	al, dl
		pop	si
		pop	bp
		retf
Expr_Node_HasChildError_52D1D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, accesseur de table bornée à stride 85 octets (0x55) — récupère un pointeur
; d'enregistrement par index.
; ==============================================================================================
Expr_LookupTableEntry85B_52D45	proc far		; CODE XREF: Scene_EnsureUnitsSpawned_530FF+26p
					; Expr_Node_GetCachedValueB_5317A+22p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		cmp	[si], cx
		jbe	short loc_52D62
		mov	dx, [si+4]
		mov	ax, [si+2]
		mov	bx, cx
		imul	bx, 55h
		add	ax, bx
		jmp	short loc_52D66
; ���������������������������������������������������������������������������

loc_52D62:				; CODE XREF: Expr_LookupTableEntry85B_52D45+Cj
		xor	dx, dx
		xor	ax, ax

loc_52D66:				; CODE XREF: Expr_LookupTableEntry85B_52D45+1Bj
		pop	si
		pop	bp
		retf
Expr_LookupTableEntry85B_52D45	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Expr_LookupBuiltinFuncDesc_52C5F avec un appel externe (sub_2E3C) —
; conversion/formatage d'une valeur de fonction native.
; ==============================================================================================
Expr_Node_LookupAndConvert_52D69	proc far		; CODE XREF: MissionScenario_ConvertFieldValue_A8B8F+10P
					; MissionScenario_ResolveAndBindExpressions_A8F22+36CP

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+2]
		mov	[bp+var_4], eax
		xor	di, di
		jmp	short loc_52DCF
; ���������������������������������������������������������������������������

loc_52D80:				; CODE XREF: Expr_Node_LookupAndConvert_52D69+68j
		push	large [bp+var_4]
		push	cs
		call	near ptr Expr_LookupBuiltinFuncDesc_52C5F
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
		jnz	short loc_52DBC
		mov	ax, 1
		jmp	short loc_52DBE
; ���������������������������������������������������������������������������

loc_52DBC:				; CODE XREF: Expr_Node_LookupAndConvert_52D69+4Cj
		xor	ax, ax

loc_52DBE:				; CODE XREF: Expr_Node_LookupAndConvert_52D69+51j
		or	al, al
		jz	short loc_52DCA
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_52DD7
; ���������������������������������������������������������������������������

loc_52DCA:				; CODE XREF: Expr_Node_LookupAndConvert_52D69+57j
		inc	di
		add	word ptr [bp+var_4], 55h ; 'U'

loc_52DCF:				; CODE XREF: Expr_Node_LookupAndConvert_52D69+15j
		cmp	[si], di
		jg	short loc_52D80
		xor	dx, dx
		xor	ax, ax

loc_52DD7:				; CODE XREF: Expr_Node_LookupAndConvert_52D69+5Fj
		pop	di
		pop	si
		leave
		retf
Expr_Node_LookupAndConvert_52D69	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, résolution de valeur nommée par recherche indexée bornée (motif identique à
; Expr_LookupNamedValue_51E4A), utilisée notamment par Expr_VM_ReadVarOrOverride_510CC.
; ==============================================================================================
Expr_LookupNamedValue_52DDB	proc far		; CODE XREF: Compiler_EmitByTokenType+155P
					; Compiler_EmitByTokenType+177P ...

var_4		= dword	ptr -4
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
		jmp	short loc_52E0C
; ���������������������������������������������������������������������������

loc_52DF1:				; CODE XREF: Expr_LookupNamedValue_52DDB+33j
		les	bx, [bp+var_4]
		mov	al, es:[bx+1Bh]
		mov	ah, 0
		cmp	ax, [bp+arg_2]
		jnz	short loc_52E07
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_52E14
; ���������������������������������������������������������������������������

loc_52E07:				; CODE XREF: Expr_LookupNamedValue_52DDB+22j
		inc	dx
		add	word ptr [bp+var_4], 55h ; 'U'

loc_52E0C:				; CODE XREF: Expr_LookupNamedValue_52DDB+14j
		cmp	[si], dx
		jg	short loc_52DF1
		xor	dx, dx
		xor	ax, ax

loc_52E14:				; CODE XREF: Expr_LookupNamedValue_52DDB+2Aj
		pop	si
		leave
		retf
Expr_LookupNamedValue_52DDB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, accesseur/mutateur de champ de nœud, utilisé par plusieurs constructeurs d'écran UI
; (sub_53A94/sub_53D92/sub_54274).
; ==============================================================================================
Expr_Node_Accessor_52E17	proc far		; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+98p
					; Combat_TeamOpposedCheckAndDispatch_53A94+F4p ...

var_4		= dword	ptr -4
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
		jmp	short loc_52E46
; ���������������������������������������������������������������������������

loc_52E2D:				; CODE XREF: Expr_Node_Accessor_52E17+31j
		les	bx, [bp+var_4]
		mov	ax, es:[bx+52h]
		cmp	ax, [bp+arg_2]
		jnz	short loc_52E41
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_52E4E
; ���������������������������������������������������������������������������

loc_52E41:				; CODE XREF: Expr_Node_Accessor_52E17+20j
		inc	dx
		add	word ptr [bp+var_4], 55h ; 'U'

loc_52E46:				; CODE XREF: Expr_Node_Accessor_52E17+14j
		cmp	[si], dx
		jg	short loc_52E2D
		xor	dx, dx
		xor	ax, ax

loc_52E4E:				; CODE XREF: Expr_Node_Accessor_52E17+28j
		pop	si
		leave
		retf
Expr_Node_Accessor_52E17	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 37 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi). RENOMMEE (ancien
; nom 'Expr_Node_RefreshField' n'avait plus de sens une fois le type d'objet identifie).
; BOUCLE SUR LE TABLEAU DES PartEntry (participants du chunk PART) : pas de 0x55 (85 octets,
; taille exacte confirmee de PartEntry_AllocateArray_AA23D). Pour chaque entree, teste le bit
; 0 de +0x39 (le meme champ de statut que PartEntry_ResetState_A9DFD manipule) ; si actif,
; appelle Expr_Node_UpdateAndPropagate_52AC6(entree).   ROLE CONFIRME : c'est le vrai
; declencheur, a chaque frame (appelee par MAIN_GAME_TICK_536F7), de l'evenement
; 'on_mission_update' pour chaque participant de mission dont le bit correspondant est actif —
; point d'entree de la chaine Expr_Node_UpdateAndPropagate -> Expr_VM_ExecuteSingleInstruction
; -> MissionScript_ExecutePROG qui execute finalement le script on_mission_update de ce
; participant (PartEntry+0x46/0x48).
; ==============================================================================================
PartEntry_DispatchMissionUpdateTick_52E51	proc far		; CODE XREF: MAIN_GAME_TICK+16Fp

var_4		= dword	ptr -4
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
		jmp	short loc_52E89
; ���������������������������������������������������������������������������

loc_52E68:				; CODE XREF: PartEntry_DispatchMissionUpdateTick_52E51+3Aj
		les	bx, [bp+var_4]
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_52E84
		push	word ptr [bp+var_4+2]
		push	bx
		push	cs
		call	near ptr Expr_Node_UpdateAndPropagate_52AC6
		add	sp, 4

loc_52E84:				; CODE XREF: PartEntry_DispatchMissionUpdateTick_52E51+26j
		inc	di
		add	word ptr [bp+var_4], 55h ; 'U'

loc_52E89:				; CODE XREF: PartEntry_DispatchMissionUpdateTick_52E51+15j
		cmp	[si], di
		jg	short loc_52E68
		pop	di
		pop	si
		leave
		retf
PartEntry_DispatchMissionUpdateTick_52E51	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), test de collision sphérique : distance 3D
; (sub_5828E) entre un point et le centre (+0x22/+0x26/+0x2A) comparée au rayon (+0x2E).
; ==============================================================================================
HitShape_Sphere_ContainsPoint_52E91:				; DATA XREF: seg339:off_707A5o
		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+0Ah]
		mov	eax, [si]
		mov	[bp-14h], eax
		mov	eax, [si+4]
		mov	[bp-10h], eax
		mov	eax, [si+8]
		mov	[bp-0Ch], eax
		les	bx, [bp+6]
		mov	eax, es:[bx+22h]
		sub	[bp-14h], eax
		mov	eax, es:[bx+26h]
		sub	[bp-10h], eax
		mov	eax, es:[bx+2Ah]
		sub	[bp-0Ch], eax

loc_52ED0:
		push	large dword ptr	[bp-0Ch]

loc_52ED4:
		push	large dword ptr	[bp-10h]
		push	large dword ptr	[bp-14h]

loc_52EDC:
		call	Math_VectorLength3D_Raw_5828E
		push	dx

loc_52EE2:
		push	ax

loc_52EE3:
		pop	eax

loc_52EE5:
		add	sp, 0Ch
		mov	[bp-4],	eax
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		les	bx, [bp+6]
		cmp	eax, es:[bx+2Eh]
		jg	short loc_52F03
		mov	ax, 1
		jmp	short loc_52F05
; ���������������������������������������������������������������������������

loc_52F03:				; CODE XREF: seg114:209Cj
		xor	ax, ax

loc_52F05:				; CODE XREF: seg114:20A1j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, stub retournant AL='S' (53h) — tag de classe pour la forme Sphere de la hiérarchie
; HitShape.
; ==============================================================================================
HitShape_ClassStub_ReturnConst53h_52F08:				; DATA XREF: seg339:off_707A1o
		push	bp
		mov	bp, sp
		mov	al, 53h	; 'S'
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable, test de collision boîte (AABB) : 6 comparaisons de bornes le
; long de X/Y/Z (centre +0x22/+0x26/+0x2A, demi-extents +0x2E/+0x32/+0x36/+0x3A/+0x3E).
; ==============================================================================================
HitShape_Box_ContainsPoint_52F0F:				; DATA XREF: seg339:off_7079Do
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	eax, es:[bx+22h]
		add	eax, es:[bx+2Eh]
		cmp	eax, [si]
		jge	short loc_52F2C

loc_52F28:				; CODE XREF: seg114:20DCj seg114:20EFj ...
		xor	ax, ax
		jmp	short loc_52F88
; ���������������������������������������������������������������������������

loc_52F2C:				; CODE XREF: seg114:20C6j
		les	bx, [bp+6]
		mov	eax, es:[bx+22h]
		sub	eax, es:[bx+32h]
		cmp	eax, [si]
		jg	short loc_52F28
		les	bx, [bp+6]
		mov	eax, es:[bx+26h]
		add	eax, es:[bx+36h]
		cmp	eax, [si+4]
		jl	short loc_52F28
		les	bx, [bp+6]
		mov	eax, es:[bx+26h]
		sub	eax, es:[bx+3Ah]
		cmp	eax, [si+4]
		jg	short loc_52F28
		les	bx, [bp+6]
		mov	eax, es:[bx+2Ah]
		add	eax, es:[bx+3Eh]
		cmp	eax, [si+8]
		jl	short loc_52F28
		mov	eax, [si+8]
		les	bx, [bp+6]
		cmp	eax, es:[bx+2Ah]
		jl	short loc_52F28
		mov	ax, 1

loc_52F88:				; CODE XREF: seg114:20CAj
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, stub retournant AL='B' (42h) — tag de classe Box.
; ==============================================================================================
HitShape_ClassStub_ReturnConst42h_52F8B:				; DATA XREF: seg339:off_70799o
		push	bp
		mov	bp, sp
		mov	al, 42h	; 'B'
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, stub retournant AL='C' (43h) — tag de classe (Cylindre/Cercle ?).
; ==============================================================================================
HitShape_ClassStub_ReturnConst43h_52F92:				; DATA XREF: seg339:off_70791o
		push	bp
		mov	bp, sp
		mov	al, 43h	; 'C'
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable, test de collision radial 2D avec plage min/max en Z, distance
; calculée via sub_5828E, comparée au rayon (+0x32).
; ==============================================================================================
HitShape_Radial2D_ContainsPoint_52F99:				; DATA XREF: seg339:off_70795o
		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	eax, es:[bx+2Ah]
		add	eax, es:[bx+2Eh]
		cmp	eax, [si+8]
		jge	short loc_52FBA

loc_52FB6:				; CODE XREF: seg114:2166j
		xor	ax, ax
		jmp	short loc_53031
; ���������������������������������������������������������������������������

loc_52FBA:				; CODE XREF: seg114:2154j
		mov	eax, [si+8]
		les	bx, [bp+6]
		cmp	eax, es:[bx+2Ah]
		jl	short loc_52FB6
		mov	eax, [si]
		mov	[bp-14h], eax
		mov	eax, [si+4]
		mov	[bp-10h], eax

loc_52FD7:
		mov	eax, [si+8]
		mov	[bp-0Ch], eax

loc_52FDF:
		les	bx, [bp+6]

loc_52FE2:
		mov	eax, es:[bx+22h]
		sub	[bp-14h], eax
		mov	eax, es:[bx+26h]
		sub	[bp-10h], eax
		mov	dword ptr [bp-0Ch], 0
		push	large dword ptr	[bp-0Ch]
		push	large dword ptr	[bp-10h]
		push	large dword ptr	[bp-14h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-4],	eax
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		les	bx, [bp+6]
		cmp	eax, es:[bx+32h]
		jg	short loc_5302F
		mov	ax, 1
		jmp	short loc_53031
; ���������������������������������������������������������������������������

loc_5302F:				; CODE XREF: seg114:21C8j
		xor	ax, ax

loc_53031:				; CODE XREF: seg114:2158j seg114:21CDj
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelée par l'opcode VM +0x642 : combine GeomNode_SumOffsetsUpChain_50EEB avec une
; allocation (sub_658).
; ==============================================================================================
GeomNode_SumAndCount_53034	proc far		; CODE XREF: Expr_VM_Interpreter_51106+642p
					; Expr_VM_Interpreter_51106+678p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		cmp	[si], dx
		jbe	short loc_53053
		mov	ax, dx
		shl	ax, 2
		mov	bx, [si+2]
		add	bx, ax
		mov	dx, [bx+2]
		mov	ax, [bx]
		jmp	short loc_53057
; ���������������������������������������������������������������������������

loc_53053:				; CODE XREF: GeomNode_SumAndCount_53034+Cj
		xor	dx, dx
		xor	ax, ax

loc_53057:				; CODE XREF: GeomNode_SumAndCount_53034+1Dj
		pop	si
		pop	bp
		retf
GeomNode_SumAndCount_53034	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, référencée DIRECTEMENT par Player_MainUpdate (sub_13100, deux sites d'appel) —
; récupère la N-ième entrée d'une table (stride 16 octets) puis résout sa position via
; GeomNode_SumOffsetsUpChain_50EEB. Hypothèse : résolution de position d'un point
; d'attache/hardpoint de l'avion du joueur. À approfondir en lien avec la question ouverte de
; la physique du joueur.
; ==============================================================================================
Player_ResolveAttachPointN_5305A	proc far		; CODE XREF: Player_MainUpdate+5FEP
					; Player_MainUpdate+620P ...

var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
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
		jbe	short loc_53089
		mov	dx, [si+4]
		mov	ax, [si+2]
		mov	bx, cx
		shl	bx, 4
		add	ax, bx
		jmp	short loc_5308D
; ���������������������������������������������������������������������������

loc_53089:				; CODE XREF: Player_ResolveAttachPointN_5305A+1Ej
		xor	dx, dx
		xor	ax, ax

loc_5308D:				; CODE XREF: Player_ResolveAttachPointN_5305A+2Dj
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_530C0
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		push	cs
		call	near ptr GeomNode_SumOffsetsUpChain_50EEB
		add	sp, 8
		mov	eax, [bp+var_1C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_8], eax

loc_530C0:				; CODE XREF: Player_ResolveAttachPointN_5305A+3Ej
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_530CB
		mov	ax, si
		jmp	short loc_530D5
; ���������������������������������������������������������������������������

loc_530CB:				; CODE XREF: Player_ResolveAttachPointN_5305A+6Bj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx

loc_530D3:
		mov	si, ax

loc_530D5:				; CODE XREF: Player_ResolveAttachPointN_5305A+6Fj
		or	ax, ax
		jz	short loc_530F4

loc_530D9:
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	eax, [bp+var_C]
		mov	[si+4],	eax
		mov	eax, [bp+var_8]
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_530F6
; ���������������������������������������������������������������������������

loc_530F4:				; CODE XREF: Player_ResolveAttachPointN_5305A+7Dj
		mov	ax, si

loc_530F6:				; CODE XREF: Player_ResolveAttachPointN_5305A+98j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
Player_ResolveAttachPointN_5305A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 73 lignes, LUE INTEGRALEMENT. RENOMMEE (ancien nom
; 'MissionFormation_EnsureAllSlotsFilled' errone). Le parametre 'si' est tres probablement la
; SCENE elle-meme (pas un groupe/escadrille) : si[0x14]/si[0x16] correspondent
; vraisemblablement a la LISTE D'UNITES en queue du chunk SCNE (documentee dans DATA_MODEL.md
; : liste de u16, index dans PART). Pour chaque unite de cette liste : resout la PartEntry
; correspondante (sub_52D45), et si son controleur (+0x52) est encore NUL, appelle
; MissionFormation_ComputeSlotAndSpawn_51EDC pour la faire apparaitre — assure que toutes les
; unites de la scene existent au moment de son activation.
; ==============================================================================================
Scene_EnsureUnitsSpawned_530FF	proc far		; CODE XREF: Scene_TriggerActivation_531CD+9p

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+1], 1
		xor	di, di
		jmp	short loc_53171
; ���������������������������������������������������������������������������

loc_53112:				; CODE XREF: Scene_EnsureUnitsSpawned_530FF+75j
		mov	ax, di
		shl	ax, 1
		mov	bx, [si+16h]
		add	bx, ax
		push	word ptr [bx]
		mov	ax, [si+2]
		add	ax, 34h	; '4'
		push	ax
		push	cs
		call	near ptr Expr_LookupTableEntry85B_52D45
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_53170
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx+52h], 0
		jz	short loc_53147
		mov	ax, 1
		jmp	short loc_53149
; ���������������������������������������������������������������������������

loc_53147:				; CODE XREF: Scene_EnsureUnitsSpawned_530FF+41j
		xor	ax, ax

loc_53149:				; CODE XREF: Scene_EnsureUnitsSpawned_530FF+46j
		or	ax, ax
		jz	short loc_53165
		les	bx, [bp+var_4]
		mov	al, es:[bx+39h]
		shl	ax, 0Ch
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_53170
		and	byte ptr es:[bx+39h], 0F7h
		jmp	short loc_53170
; ���������������������������������������������������������������������������

loc_53165:				; CODE XREF: Scene_EnsureUnitsSpawned_530FF+4Cj
		push	large [bp+var_4]
		push	cs
		call	near ptr PartEntry_ResolveSpawnPositionAndActivate_51EDC
		add	sp, 4

loc_53170:				; CODE XREF: Scene_EnsureUnitsSpawned_530FF+37j
					; Scene_EnsureUnitsSpawned_530FF+5Dj ...
		inc	di

loc_53171:				; CODE XREF: Scene_EnsureUnitsSpawned_530FF+11j
		cmp	[si+14h], di
		jg	short loc_53112
		pop	di
		pop	si
		leave
		retf
Scene_EnsureUnitsSpawned_530FF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, variante d'accesseur de valeur mise en cache (via Expr_LookupTableEntry85B_52D45).
; ==============================================================================================
Expr_Node_GetCachedValueB_5317A	proc far		; CODE XREF: Scene_TriggerMissionUpdateEvent_53211+9p

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		jmp	short loc_531C0
; ���������������������������������������������������������������������������

loc_53189:				; CODE XREF: Expr_Node_GetCachedValueB_5317A+49j
		mov	ax, di
		shl	ax, 1
		mov	bx, [si+16h]
		add	bx, ax
		push	word ptr [bx]
		mov	ax, [si+2]
		add	ax, 34h	; '4'
		push	ax
		push	cs
		call	near ptr Expr_LookupTableEntry85B_52D45
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_531BF
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx+4Eh], 0
		jz	short loc_531BF
		or	byte ptr es:[bx+39h], 8

loc_531BF:				; CODE XREF: Expr_Node_GetCachedValueB_5317A+33j
					; Expr_Node_GetCachedValueB_5317A+3Ej
		inc	di

loc_531C0:				; CODE XREF: Expr_Node_GetCachedValueB_5317A+Dj
		cmp	[si+14h], di
		jg	short loc_53189
		mov	byte ptr [si+1], 0
		pop	di
		pop	si
		leave
		retf
Expr_Node_GetCachedValueB_5317A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 26 lignes, LUE INTEGRALEMENT. RENOMMEE (ancien nom 'MissionFormation_TickGroup'
; errone). Quand une scene devient active : appelle Scene_EnsureUnitsSpawned_530FF (fait
; apparaitre les unites associees non encore presentes), PUIS
; Expr_VM_ExecuteSingleInstruction_51E7E — DECLENCHE L'EXECUTION DU SCRIPT on_is_activated DE
; CETTE SCENE (parametres calcules depuis scene+2+0x40 = reference au champ progs_id resolu de
; la scene, scene+8).
; ==============================================================================================
Scene_TriggerActivation_531CD	proc far		; CODE XREF: Scene_DetectAndActivateChange_532EA+2Cp
					; MissionScenario_LoadMainRecord_A8331+5FEP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Scene_EnsureUnitsSpawned_530FF
		pop	cx

loc_531DA:
		push	large 0
		push	large dword ptr	[si+8]
		mov	ax, [si+2]
		add	ax, 40h	; '@'
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_51E7E
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
Scene_TriggerActivation_531CD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 20 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi). Declenche le champ
; +0xC d'une SceneRecord (on_leaving, confirme via DATA_MODEL.md) via
; Expr_VM_ExecuteSingleInstruction. Appelee directement depuis MAIN_GAME_TICK_536F7 (pas
; depuis Scene_DetectAndActivateChange), sur si->field_4E et si->field_50 -- contexte exact de
; ces deux appels (avant/apres resolution de scene ?) pas encore completement elucide.
; ==============================================================================================
Scene_TriggerLeavingEvent_531F2	proc far		; CODE XREF: MAIN_GAME_TICK+104p
					; MAIN_GAME_TICK+164p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0
		push	large dword ptr	[si+0Ch]
		mov	ax, [si+2]
		add	ax, 40h	; '@'
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_51E7E
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
Scene_TriggerLeavingEvent_531F2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 24 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi). Declenche le champ
; +0x10 d'une SceneRecord (on_mission_update, confirme via DATA_MODEL.md) via
; Expr_VM_ExecuteSingleInstruction — SANS AUCUNE GARDE interne. CORRIGE : appelee a la fois
; depuis Scene_DetectAndActivateChange_532EA (uniquement si la scene active a change --
; garantie supplementaire sur l'ancienne scene) ET depuis
; MissionScenario_RecomputeFields_A9382 (SANS CONDITION, a CHAQUE FRAME, tant que +0x50 reste
; non nul). CONSEQUENCE : 'on_mission_update' d'une scene tourne bien EN CONTINU, une fois par
; frame tant que la scene reste active -- exactement comme celui de PART
; (PartEntry_DispatchMissionUpdateTick_52E51), pas un evenement ponctuel comme initialement
; suppose.
; ==============================================================================================
Scene_TriggerMissionUpdateEvent_53211	proc far		; CODE XREF: Scene_DetectAndActivateChange_532EA+22p
					; MissionScenario_RecomputeFields_A9382+10P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Expr_Node_GetCachedValueB_5317A
		pop	cx
		push	large 0
		push	large dword ptr	[si+10h]
		mov	ax, [si+2]
		add	ax, 40h	; '@'
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_51E7E
		add	sp, 0Ah
		pop	si
		pop	bp
		retf
Scene_TriggerMissionUpdateEvent_53211	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 80 lignes, LUE INTEGRALEMENT (session ordres de mission avec Remi). Itere le tableau
; des enregistrements SCNE (pas de 0x27=39 octets, confirmant la taille de DATA_MODEL.md),
; pour chaque scene active (is_active!=0) dont la zone (area_id resolu, +4) est non nulle,
; teste par appel virtuel ([areaHandle->vtable+4](param)) si le parametre (position/reference)
; est contenu dans cette zone. Retourne la premiere scene active correspondante, ou NULL.
; C'est le vrai SELECTEUR DE SCENE ACTIVE de la mission.
; ==============================================================================================
Scene_FindMatchingByAreaContainment_53236	proc far		; CODE XREF: Scene_DetectAndActivateChange_532EA+10p
					; UIScreen_RenderOrLayoutList_54503+151p ...

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
		jmp	short loc_532A0
; ���������������������������������������������������������������������������

loc_53248:				; CODE XREF: Scene_FindMatchingByAreaContainment_53236+6Fj
		mov	ax, [bp+var_2]
		imul	ax, 27h
		mov	di, [si+2]
		add	di, ax
		cmp	byte ptr [di], 0
		jz	short loc_5329D
		cmp	dword ptr [di+4], 0
		jz	short loc_5329D
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		cmp	dword ptr [di+4], 0
		jnz	short loc_53271
		mov	ax, 1
		jmp	short loc_53273
; ���������������������������������������������������������������������������

loc_53271:				; CODE XREF: Scene_FindMatchingByAreaContainment_53236+34j
		xor	ax, ax

loc_53273:				; CODE XREF: Scene_FindMatchingByAreaContainment_53236+39j
		or	ax, ax
		jnz	short loc_5328E
		push	[bp+var_4]
		push	large dword ptr	[di+4]
		les	bx, [di+4]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		or	ax, ax
		jz	short loc_53293

loc_5328E:				; CODE XREF: Scene_FindMatchingByAreaContainment_53236+3Fj
		mov	ax, 1
		jmp	short loc_53295
; ���������������������������������������������������������������������������

loc_53293:				; CODE XREF: Scene_FindMatchingByAreaContainment_53236+56j
		xor	ax, ax

loc_53295:				; CODE XREF: Scene_FindMatchingByAreaContainment_53236+5Bj
		or	ax, ax
		jz	short loc_5329D
		mov	ax, di
		jmp	short loc_532A9
; ���������������������������������������������������������������������������

loc_5329D:				; CODE XREF: Scene_FindMatchingByAreaContainment_53236+20j
					; Scene_FindMatchingByAreaContainment_53236+27j ...
		inc	[bp+var_2]

loc_532A0:				; CODE XREF: Scene_FindMatchingByAreaContainment_53236+10j
		mov	ax, [si]
		cmp	ax, [bp+var_2]
		jg	short loc_53248
		xor	ax, ax

loc_532A9:				; CODE XREF: Scene_FindMatchingByAreaContainment_53236+65j
		pop	di
		pop	si
		leave
		retf
Scene_FindMatchingByAreaContainment_53236	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, accesseur générique de champ de nœud (rôle exact non détaillé).
; ==============================================================================================
Expr_Node_Accessor_532AD	proc far		; CODE XREF: Expr_VM_Interpreter_51106+659p
					; Expr_VM_Interpreter_51106+68Fp ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_532E1
; ���������������������������������������������������������������������������

loc_532B8:				; CODE XREF: Expr_Node_Accessor_532AD+36j
		mov	ax, cx
		imul	ax, 27h
		mov	bx, [si+2]
		add	bx, ax
		mov	ax, [bx+6]
		mov	dx, [bx+4]
		cmp	ax, [bp+arg_4]
		jnz	short loc_532E0
		cmp	dx, [bp+arg_2]
		jnz	short loc_532E0
		mov	ax, cx

loc_532D4:
		imul	ax, 27h
		push	ax

loc_532D8:
		mov	ax, [si+2]
		pop	dx
		add	ax, dx
		jmp	short loc_532E7
; ���������������������������������������������������������������������������

loc_532E0:				; CODE XREF: Expr_Node_Accessor_532AD+1Ej
					; Expr_Node_Accessor_532AD+23j
		inc	cx

loc_532E1:				; CODE XREF: Expr_Node_Accessor_532AD+9j
		cmp	[si], cx
		jg	short loc_532B8

loc_532E5:
		xor	ax, ax

loc_532E7:				; CODE XREF: Expr_Node_Accessor_532AD+31j
		pop	si
		pop	bp
		retf
Expr_Node_Accessor_532AD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 55 lignes, LUE INTEGRALEMENT. RENOMMEE (ancien nom
; 'MissionFormation_HandleGroupSelectionChange' etait errone — aucun rapport avec une
; formation). Appelle Scene_FindMatchingByAreaContainment_53236 pour resoudre la scene active
; courante ; si elle a change depuis le dernier appel (different du parametre previousScene),
; desactive l'ancienne (sub_53211) et active la nouvelle via Scene_TriggerActivation_531CD, en
; mettant a jour un traqueur global de 'scene courante' (word_706A0+0x52).
; ==============================================================================================
Scene_DetectAndActivateChange_532EA	proc far		; CODE XREF: MAIN_GAME_TICK+151p
					; MissionScenario_LoadMainRecord_A8331+69AP

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
		call	near ptr Scene_FindMatchingByAreaContainment_53236
		add	sp, 4
		mov	si, ax
		cmp	si, di
		jz	short loc_53331
		or	di, di
		jz	short loc_53310
		push	di
		push	cs
		call	near ptr Scene_TriggerMissionUpdateEvent_53211
		pop	cx

loc_53310:				; CODE XREF: Scene_DetectAndActivateChange_532EA+1Ej
		or	si, si
		jz	short loc_5332F
		push	si
		push	cs
		call	near ptr Scene_TriggerActivation_531CD
		pop	cx
		mov	bx, word_706A0
		cmp	[bx+52h], si
		jz	short loc_53328
		nop
		push	cs
		call	near ptr Expr_Node_UpdateSelectionCounters_544DC

loc_53328:				; CODE XREF: Scene_DetectAndActivateChange_532EA+37j
		mov	bx, word_706A0
		mov	[bx+52h], si

loc_5332F:				; CODE XREF: Scene_DetectAndActivateChange_532EA+28j
		mov	di, si

loc_53331:				; CODE XREF: Scene_DetectAndActivateChange_532EA+1Aj
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
Scene_DetectAndActivateChange_532EA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, notifie un changement de valeur de nœud (appel externe sub_223C5).
; ==============================================================================================
Expr_Node_NotifyChange_53337	proc far		; CODE XREF: Expr_Node_ClearDirtyAndNotify_5242A+43p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	59C3h
		call	Container_Op_223C5
		add	sp, 4
		pop	bp
		retf
Expr_Node_NotifyChange_53337	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, ajoute l'objet passé en argument (arg_2) à la liste de tag 0x59C3 via
; List_AppendIfNonNull_21F8D. Appelée par AIAircraft_SpawnAndConditionalLoadProfile_53363 pour
; l'objet qu'elle vient de créer. Anciennement Expr_Node_RegisterListener (aucun rapport avec
; un écouteur Expr_VM dans ce corps).
; ==============================================================================================
WorldObjects_AddToList_5334D	proc far		; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+170p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	59C3h
		call	List_AppendIfNonNull_21F8D
		add	sp, 4
		pop	bp
		retf
WorldObjects_AddToList_5334D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 217 lignes, NON DETAILLEE EN PROFONDEUR - usine de construction d'entite avion/pilote,
; CONFIRME etre le point d'origine du chargement du profil PROF : determine le type de
; controle par comparaison de chaine (sub_2E3C) contre 'PLAYER' (type=2) et 'NETWORK'
; (type=3), sinon type=1 (IA par defaut). Instancie l'entite (sub_38B70, tag 0x571C),
; positionne/oriente via dispatch vtable ([bx+8],[bx+0x40],[bx+0x3C],[bx+0x48]) avec calculs
; en virgule fixe 24.8, enregistre l'entite comme noeud ecouteur du systeme Expr_VM
; (Expr_Node_RegisterListener_5334D). PUIS, uniquement si (octet [entite+4] AND 0x6F) == 0x4E
; ('N') ET type != 2 (pas PLAYER) : appelle la chaine de chargement
; PilotProfile_LoadFromPROF_73B4F via VROOMM_StubThunk_6C23A ->
; AIAircraft_LoadProfileWrapper_9D4D2 -> VROOMM_StubThunk_6AB07 ->
; AIAircraft_LoadProfileGuarded_73940. CONFIRME : le chunk PROF (GOAL/MVRS/ATRB/RADI) n'est
; JAMAIS charge pour l'avion du joueur - c'est exclusivement le profil de comportement des
; avions controles par IA (et network). Le fait que l'entite soit enregistree comme ecouteur
; Expr_VM AVANT le chargement du profil suggere fortement que les node_id de MVRS
; correspondent a des identifiants de noeuds du graphe Expr_VM plutot qu'a de simples champs
; C. Anciennement mal nommee de facon generique (pas de nom specifique attribue avant).
; Candidat prioritaire pour session dediee, lien direct avec Expr_VM_Interpreter_51106 (jamais
; lu en detail).
; ==============================================================================================
AIAircraft_SpawnAndConditionalLoadProfile_53363	proc far		; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+3D2p

var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= byte ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
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
		push	offset aPlayer_0 ; "PLAYER"
		push	large [bp+var_6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_53399
		mov	ax, 1
		jmp	short loc_5339B
; ���������������������������������������������������������������������������

loc_53399:				; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+2Fj
		xor	ax, ax

loc_5339B:				; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+34j
		or	al, al
		jz	short loc_533A3
		mov	[bp+var_2], 2

loc_533A3:				; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+3Aj
		push	8
		push	ds
		push	offset aNetwork	; "NETWORK"
		push	large [bp+var_6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_533BE
		mov	ax, 1
		jmp	short loc_533C0
; ���������������������������������������������������������������������������

loc_533BE:				; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+54j
		xor	ax, ax

loc_533C0:				; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+59j
		or	al, al
		jz	short loc_533C8
		mov	[bp+var_2], 3

loc_533C8:				; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+5Fj
		mov	eax, [bp+arg_2]
		mov	[bp+var_E], eax

loc_533D0:
		mov	al, [bp+var_2]
		mov	[bp+var_10], al

loc_533D6:
		push	1
		push	ax
		push	large [bp+var_E]
		push	571Ch
		call	ObjectPrototype_FindOrLoadAndInstantiate_38B70
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jnz	short loc_533F1
		jmp	loc_534D9
; ���������������������������������������������������������������������������

loc_533F1:				; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+89j
		mov	cx, [bp+arg_A]
		mov	bx, cx

loc_533F6:
		mov	eax, [bx]

loc_533F9:
		mov	[di+12h], eax

loc_533FD:
		mov	eax, [bx+4]

loc_53401:
		mov	[di+16h], eax

loc_53405:
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
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	eax, [bp+arg_6]
		mov	[bp+var_14], eax
		mov	[di+6],	eax
		cmp	[bp+arg_E], 0
		jnz	short loc_5343A
		jmp	loc_534D0
; ���������������������������������������������������������������������������

loc_5343A:				; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+D2j
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
		mov	edx, dword_7045E
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
		lea	ax, [bp+var_26]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+48h]
		add	sp, 4

loc_534D0:				; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+D4j
		push	di

loc_534D1:
		push	si
		push	cs
		call	near ptr WorldObjects_AddToList_5334D
		add	sp, 4

loc_534D9:				; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+8Bj
		mov	al, [di+4]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh	; 'N'
		jnz	short loc_534EB
		mov	ax, 1
		jmp	short loc_534ED
; ���������������������������������������������������������������������������

loc_534EB:				; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+181j
		xor	ax, ax

loc_534ED:				; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+186j
		or	al, al
		jz	short loc_534FE
		cmp	[bp+var_2], 2
		jz	short loc_534FE

loc_534F7:
		push	di
		call	VROOMM_StubThunk_6C23A
		pop	cx

loc_534FE:				; CODE XREF: AIAircraft_SpawnAndConditionalLoadProfile_53363+18Cj
					; AIAircraft_SpawnAndConditionalLoadProfile_53363+192j
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
AIAircraft_SpawnAndConditionalLoadProfile_53363	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelée par l'opcode VM +0xA38 ; appels externes sub_2E74/sub_238CE/sub_23CCC (rôle
; exact non détaillé).
; ==============================================================================================
Expr_VM_OpcodeHelperA_53504	proc far		; CODE XREF: Expr_VM_Interpreter_51106+A38p

var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_A		= byte ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
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
		jbe	short loc_53533
		mov	ax, dx
		imul	ax, 9
		mov	dx, [si+32h]
		mov	bx, [si+30h]
		add	bx, ax
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], bx
		jmp	short $+2

loc_53533:				; CODE XREF: Expr_VM_OpcodeHelperA_53504+18j
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
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	[bp+var_A], 0
		push	ds
		lea	ax, [bp+var_12]
		push	ax
		push	59CDh
		call	EntityTracker_FindByID
		add	sp, 6
		mov	bx, ax
		mov	dx, [bx+0Eh]
		or	dx, dx
		jz	short loc_53583
		push	dx
		push	59CDh
		call	EntityTracker_ApplySelection
		add	sp, 4

loc_53583:				; CODE XREF: Expr_VM_OpcodeHelperA_53504+71j
		pop	si
		leave
		retf
Expr_VM_OpcodeHelperA_53504	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 207 lignes, NON DÉTAILLÉE — combine dispatch vtable [bx+4Ch], distance (sub_5828E),
; exécution VM (Expr_VM_Execute_51E7E) et test de portée (sub_378CA, déjà vu en seg109 pour le
; trigger d'effet).
; ==============================================================================================
Expr_Node_EvaluateVisibility_53586	proc far		; CODE XREF: MAIN_GAME_TICK+18Bp

var_3C		= word ptr -3Ch
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= byte ptr -0Ch
var_B		= byte ptr -0Bh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, word_722E6
		cmp	word_722E6, 0
		jnz	short loc_5359F
		jmp	loc_536F1
; ���������������������������������������������������������������������������

loc_5359F:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+14j
		mov	al, byte_6E4B4
		mov	ah, 0
		or	ax, ax
		jz	short loc_535AB
		jmp	loc_536F1
; ���������������������������������������������������������������������������

loc_535AB:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+20j
		mov	bx, [di+51h]
		mov	al, [bx+20h]
		mov	[bp+var_1], al
		push	di
		push	ss
		lea	ax, [bp+var_30]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	large [bp+var_28]
		push	large [bp+var_2C]
		push	large [bp+var_30]
		call	Math_VectorLength3D_Raw_5828E

loc_535D3:
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	[bp+var_6], eax

loc_535E2:
		cmp	word ptr [si+4Eh], 0
		jz	short loc_53602
		push	large 0
		mov	bx, [si+4Eh]
		push	large dword ptr	[bx+10h]

loc_535F2:
		mov	ax, [bx+2]
		add	ax, 40h	; '@'
		push	ax
		push	cs

loc_535FA:
		call	near ptr Expr_VM_ExecuteSingleInstruction_51E7E
		add	sp, 0Ah
		jmp	short $+2

loc_53602:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+60j
		cmp	word ptr [si+0A1h], 0
		jnz	short loc_53610
		cmp	word ptr [si+0AFh], 0
		jz	short loc_53615

loc_53610:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+81j
		mov	ax, 1
		jmp	short loc_53617
; ���������������������������������������������������������������������������

loc_53615:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+88j
		xor	ax, ax

loc_53617:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+8Dj
		mov	[bp+var_C], al
		mov	[bp+var_B], al
		cmp	byte ptr [di+59h], 0
		jz	short loc_53626
		jmp	loc_536F1
; ���������������������������������������������������������������������������

loc_53626:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+9Bj
		cmp	[bp+var_1], 0
		jz	short loc_53654
		cmp	[bp+var_B], 0
		jz	short loc_53654
		mov	[bp+var_10], 500h
		mov	eax, [bp+var_6]
		cmp	eax, [bp+var_10]
		jge	short loc_53649
		mov	ax, 1
		jmp	short loc_5364B
; ���������������������������������������������������������������������������

loc_53649:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+BCj
		xor	ax, ax

loc_5364B:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+C1j
		or	al, al
		jz	short loc_53654
		mov	al, 1
		jmp	loc_536F3
; ���������������������������������������������������������������������������

loc_53654:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+A4j
					; Expr_Node_EvaluateVisibility_53586+AAj ...
		cmp	word_70466, 6
		jbe	short loc_536BB
		push	1
		lea	ax, [bp+var_3C]
		push	ax
		mov	ax, word_722E6
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	bx, word_722E6
		mov	eax, [bx+1Ah]
		sub	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	[bp+var_18], eax
		mov	al, [si+19h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_536BB
		mov	[bp+var_24], 12C00h
		mov	eax, [bp+var_18]
		cmp	eax, [bp+var_24]
		jle	short loc_536B1
		mov	ax, 1
		jmp	short loc_536B3
; ���������������������������������������������������������������������������

loc_536B1:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+124j
		xor	ax, ax

loc_536B3:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+129j
		or	al, al
		jz	short loc_536BB
		mov	byte ptr [si+19h], 1

loc_536BB:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+D3j
					; Expr_Node_EvaluateVisibility_53586+112j ...
		cmp	[bp+var_1], 0
		jz	short loc_536F1
		mov	[bp+var_14], 500h
		mov	eax, [bp+var_6]
		cmp	eax, [bp+var_14]
		jge	short loc_536D8

loc_536D3:
		mov	ax, 1
		jmp	short loc_536DA
; ���������������������������������������������������������������������������

loc_536D8:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+14Bj
		xor	ax, ax

loc_536DA:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+150j
		or	al, al

loc_536DC:
		jz	short loc_536F1
		cmp	byte ptr [si+19h], 0
		jz	short loc_536F1
		push	3
		push	5240h
		call	VROOMM_StubThunk_6B835
		add	sp, 4

loc_536F1:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+16j
					; Expr_Node_EvaluateVisibility_53586+22j ...
		mov	al, 0

loc_536F3:				; CODE XREF: Expr_Node_EvaluateVisibility_53586+CBj
		pop	di
		pop	si
		leave
		retf
Expr_Node_EvaluateVisibility_53586	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 241 lignes, LUE INTEGRALEMENT (session gestion de mission avec Remi). RENOMMEE (echange
; avec sub_4FBF1) : c'est ELLE le vrai point d'entree par frame — orchestre entree clavier
; joueur (espace/slash), mise a jour de formation/groupe de mission (appelle
; MissionFormation_HandleGroupSelectionChange_532EA directement), rafraichissement du graphe
; d'expression (Expr_Node_RefreshField), ET delegue au sous-systeme combat/cible via l'appel a
; sub_4FBF1 (desormais nommee separement, PAS 'MAIN_GAME_TICK'). Appelee une fois par
; iteration de Simulator_MainLoop, sur un objet FIXE (si, jamais reassigne). C'est la fonction
; qui merite le nom 'tick principal' car elle touche IA/joueur/rendu, meme via des appels
; separes — une fonction qui ne gere pas l'IA ne peut pas etre le tick principal.
; ==============================================================================================
MAIN_GAME_TICK	proc far		; CODE XREF: STRIKE_EXE_MAIN_LOOP+103p

var_12		= dword	ptr -12h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_536FA:
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, word_6E46F
		jz	short loc_53713
		mov	al, byte_722D1
		mov	ah, 0
		jmp	short loc_53715
; ���������������������������������������������������������������������������

loc_53713:				; CODE XREF: MAIN_GAME_TICK+13j
		xor	ax, ax

loc_53715:				; CODE XREF: MAIN_GAME_TICK+1Aj
		cmp	ax, 20h	; ' '
		jz	short loc_53722
		cmp	ax, 2Fh	; '/'
		jz	short loc_53773
		jmp	loc_537D8
; ���������������������������������������������������������������������������

loc_53722:				; CODE XREF: MAIN_GAME_TICK+21j
		cmp	byte_722D0, 1
		jnz	short loc_53739
		test	byte_722D3, 30h
		jz	short loc_53735
		mov	ax, 1
		jmp	short loc_53737
; ���������������������������������������������������������������������������

loc_53735:				; CODE XREF: MAIN_GAME_TICK+37j
		xor	ax, ax

loc_53737:				; CODE XREF: MAIN_GAME_TICK+3Cj
		jmp	short loc_5374E
; ���������������������������������������������������������������������������

loc_53739:				; CODE XREF: MAIN_GAME_TICK+30j
		cmp	byte_72DE5, 1
		jz	short loc_53747
		cmp	byte_72E1D, 1
		jnz	short loc_5374C

loc_53747:				; CODE XREF: MAIN_GAME_TICK+47j
		mov	ax, 1
		jmp	short loc_5374E
; ���������������������������������������������������������������������������

loc_5374C:				; CODE XREF: MAIN_GAME_TICK+4Ej
		xor	ax, ax

loc_5374E:				; CODE XREF: MAIN_GAME_TICK:loc_53737j
					; MAIN_GAME_TICK+53j
		or	al, al
		jnz	short loc_53755
		jmp	loc_537D8
; ���������������������������������������������������������������������������

loc_53755:				; CODE XREF: MAIN_GAME_TICK+59j
		cmp	byte_6E33C, 0
		jz	short loc_537D8
		cmp	word_722E6, 0
		jz	short loc_537D8
		push	0
		push	word_722E6
		call	VROOMM_StubThunk_6BFBF
		add	sp, 4
		jmp	short loc_537D8
; ���������������������������������������������������������������������������

loc_53773:				; CODE XREF: MAIN_GAME_TICK+26j
		cmp	byte_722D0, 1
		jnz	short loc_5378A
		test	byte_722D3, 0C0h
		jz	short loc_53786
		mov	ax, 1
		jmp	short loc_53788
; ���������������������������������������������������������������������������

loc_53786:				; CODE XREF: MAIN_GAME_TICK+88j
		xor	ax, ax

loc_53788:				; CODE XREF: MAIN_GAME_TICK+8Dj
		jmp	short loc_5379F
; ���������������������������������������������������������������������������

loc_5378A:				; CODE XREF: MAIN_GAME_TICK+81j
		cmp	byte_72E00, 1
		jz	short loc_53798
		cmp	byte_72E21, 1
		jnz	short loc_5379D

loc_53798:				; CODE XREF: MAIN_GAME_TICK+98j
		mov	ax, 1
		jmp	short loc_5379F
; ���������������������������������������������������������������������������

loc_5379D:				; CODE XREF: MAIN_GAME_TICK+9Fj
		xor	ax, ax

loc_5379F:				; CODE XREF: MAIN_GAME_TICK:loc_53788j
					; MAIN_GAME_TICK+A4j
		or	al, al
		jz	short loc_537D8
		push	si
		push	3E0h
		push	word_6D48E
		push	word_6D48C
		push	3605h
		push	3E1h
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		sub	sp, 4
		mov	[bp+var_12], 500h
		push	ds
		push	offset unk_6D491
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch

loc_537D8:				; CODE XREF: MAIN_GAME_TICK+28j
					; MAIN_GAME_TICK+5Bj ...
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72BD6, eax
		mov	ax, si
		add	ax, 68h	; 'h'
		push	ax
		call	Compiler_EmitByTokenType
		pop	cx

loc_537F1:
		cmp	word ptr [si+4Eh], 0
		jz	short loc_537FF

loc_537F7:
		push	word ptr [si+4Eh]

loc_537FA:
		push	cs
		call	near ptr Scene_TriggerLeavingEvent_531F2
		pop	cx

loc_537FF:				; CODE XREF: MAIN_GAME_TICK+FEj
		push	word ptr [si+50h]

loc_53802:
		cmp	dword ptr [si+54h], 0

loc_53807:
		jz	short loc_53820
		push	large dword ptr	[si+54h]
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs
		call	near ptr Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		mov	dx, ss
		lea	ax, [bp+var_C]
		jmp	short loc_5383D
; ���������������������������������������������������������������������������

loc_53820:				; CODE XREF: MAIN_GAME_TICK:loc_53807j
		mov	eax, dword_707F8
		mov	[bp+var_C], eax
		mov	eax, dword_707FC
		mov	[bp+var_8], eax
		mov	eax, dword_70800
		mov	[bp+var_4], eax
		mov	dx, ss
		lea	ax, [bp+var_C]

loc_5383D:				; CODE XREF: MAIN_GAME_TICK+127j
		lea	ax, [bp+var_C]
		push	ax
		mov	ax, si
		add	ax, 3Ah	; ':'
		push	ax
		push	cs
		call	near ptr Scene_DetectAndActivateChange_532EA
		add	sp, 6
		mov	[si+50h], ax
		cmp	word ptr [si+50h], 0
		jz	short loc_5385F
		push	word ptr [si+50h]
		push	cs
		call	near ptr Scene_TriggerLeavingEvent_531F2
		pop	cx

loc_5385F:				; CODE XREF: MAIN_GAME_TICK+15Ej
		mov	ax, si
		add	ax, 34h	; '4'
		push	ax
		push	cs
		call	near ptr PartEntry_DispatchMissionUpdateTick_52E51
		pop	cx
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	dword_72BDA, eax
		call	CombatTarget_WeaponActionSubsystem
		or	al, al
		jz	short loc_53891
		push	si
		push	cs
		call	near ptr Expr_Node_EvaluateVisibility_53586
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_53891
		mov	ax, 1
		jmp	short loc_53893
; ���������������������������������������������������������������������������

loc_53891:				; CODE XREF: MAIN_GAME_TICK+187j
					; MAIN_GAME_TICK+193j
		xor	ax, ax

loc_53893:				; CODE XREF: MAIN_GAME_TICK+198j
		pop	si
		leave
		retf
MAIN_GAME_TICK	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, 254 lignes, LUE INTEGRALEMENT (session gestion de mission avec Remi). RENOMMEE TROIS
; FOIS : d'abord 'UIScreen_Construct' (faux), puis 'Simulator_MainLoop', puis
; 'STRIKE_EXE_MAIN_LOOP' (nom final, propose par Remi) — c'est LA BOUCLE PRINCIPALE DE TOUT
; L'EXECUTABLE, confirme par lecture directe : loc_538A1 (debut de boucle) est la cible d'un
; jmp loc_538A1 explicite, avec sortie conditionnelle sur byte_706AF==6. A CHAQUE ITERATION,
; EN SEQUENCE (pas en parallele) : appelle MAIN_GAME_TICK_536F7 (gestion clavier + formation +
; scenes), PUIS MissionScenario_RecomputeFields_A9382 (declenche
; Scene_TriggerMissionUpdateEvent sur +0x4E/+0x50, verifie une condition de fin de mission,
; peut poser byte_706AF=5). Appelee une seule fois depuis Program_InitVideoFontArgs_14279, qui
; lui-meme ne boucle jamais.
; ==============================================================================================
STRIKE_EXE_MAIN_LOOP	proc far		; CODE XREF: Program_InitVideoFontArgs+214P

var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_538A1:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+12Bj
		mov	byte_706AF, 0
		call	VROOMM_StubThunk_6CDD7
		mov	al, byte_706A2
		mov	ah, 0
		push	ax
		call	TextObject_AllocateVariantA_5A984
		pop	cx
		jmp	loc_53997
; ���������������������������������������������������������������������������

loc_538BA:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+112j
		call	Frame_UpdateTimingAndNotifyTrackedObjects_500F6
		cmp	byte_6E4B4, 0
		jz	short loc_53901
		mov	al, byte_6E4B5
		push	ax
		mov	al, byte_6E4B7
		push	ax
		push	word_722E6
		call	VROOMM_StubThunk_6ADC3
		add	sp, 6
		or	al, al
		jz	short loc_538FC
		mov	al, byte_6E345
		mov	ah, 0
		or	ax, ax
		jnz	short loc_53901
		mov	byte_706AF, 3
		push	2
		push	5240h

loc_538F1:
		call	VROOMM_StubThunk_6B835

loc_538F6:
		add	sp, 4
		jmp	loc_539AB
; ���������������������������������������������������������������������������

loc_538FC:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+46j
		mov	byte_6E4B4, 0

loc_53901:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+2Ej
					; STRIKE_EXE_MAIN_LOOP+4Fj
		cmp	byte_6E4B8, 0
		jz	short loc_53966
		mov	byte_6E4B4, 1
		push	word_722E6
		call	VROOMM_StubThunk_6ADFA
		pop	cx
		or	al, al
		jz	short loc_53942
		mov	al, byte_6E345
		mov	ah, 0
		or	ax, ax
		jz	short loc_53927
		jmp	loc_539AB
; ���������������������������������������������������������������������������

loc_53927:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+8Cj
		cmp	byte_706AF, 0
		jnz	short loc_539AB
		mov	byte_706AF, 2
		push	1
		push	5240h
		call	VROOMM_StubThunk_6B835
		add	sp, 4
		jmp	short loc_539AB
; ���������������������������������������������������������������������������

loc_53942:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+83j
		mov	al, byte_6E345
		mov	ah, 0
		or	ax, ax
		jnz	short loc_539AB
		cmp	byte_706AF, 0
		jnz	short loc_539AB
		mov	byte_706AF, 3
		push	2
		push	5240h
		call	VROOMM_StubThunk_6B835
		add	sp, 4
		jmp	short loc_539AB
; ���������������������������������������������������������������������������

loc_53966:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+70j
		cmp	byte_6E4B9, 0
		jz	short loc_53997
		push	1
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_53986
		push	ax
		call	VROOMM_StubThunk_6AC80
		pop	cx
		mov	ax, di
		jmp	short loc_53988
; ���������������������������������������������������������������������������

loc_53986:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+E3j
		mov	ax, di

loc_53988:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+EEj
		mov	[bp+var_E], ax
		push	ax
		call	CRT_FreeNear_Wrap
		pop	cx
		mov	byte_6E4B9, 0

loc_53997:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+21j
					; STRIKE_EXE_MAIN_LOOP+D5j
		push	si
		push	cs
		call	near ptr MAIN_GAME_TICK
		pop	cx
		or	al, al
		jz	short loc_539AB
		cmp	byte_706AF, 0
		jnz	short loc_539AB
		jmp	loc_538BA
; ���������������������������������������������������������������������������

loc_539AB:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+63j
					; STRIKE_EXE_MAIN_LOOP+8Ej ...
		push	0
		call	Video_SetHorizontalShake
		pop	cx
		cmp	byte_706AF, 6
		jnz	short loc_539C4
		push	si
		call	VROOMM_StubThunk_6CE3D
		pop	cx
		jmp	loc_538A1
; ���������������������������������������������������������������������������

loc_539C4:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+122j
		cmp	word ptr [si+4Eh], 0
		jz	short loc_539E4
		push	large 0
		mov	bx, [si+4Eh]

loc_539D0:
		push	large dword ptr	[bx+10h]

loc_539D4:
		mov	ax, [bx+2]
		add	ax, 40h	; '@'
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_51E7E
		add	sp, 0Ah
		jmp	short $+2

loc_539E4:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+132j
		mov	al, [si+0A1h]
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_53A02

loc_539F1:
		mov	[bp+var_6], 15E00h
		mov	eax, [bp+var_6]
		add	dword_706AB, eax

loc_53A02:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+159j
		cmp	word ptr [si+4Eh], 0
		jz	short loc_53A22
		push	large 0
		mov	bx, [si+4Eh]
		push	large dword ptr	[bx+10h]
		mov	ax, [bx+2]
		add	ax, 40h	; '@'
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_51E7E
		add	sp, 0Ah
		jmp	short $+2

loc_53A22:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+170j
		mov	al, [si+0AFh]
		mov	[bp+var_7], al
		cmp	[bp+var_7], 0
		jnz	short loc_53A6D
		cmp	word ptr [si+4Eh], 0
		jz	short loc_53A4F
		push	large 0
		mov	bx, [si+4Eh]
		push	large dword ptr	[bx+10h]
		mov	ax, [bx+2]
		add	ax, 40h	; '@'
		push	ax
		push	cs
		call	near ptr Expr_VM_ExecuteSingleInstruction_51E7E
		add	sp, 0Ah
		jmp	short $+2

loc_53A4F:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+19Dj
		cmp	word ptr [si+0A1h], 0
		jnz	short loc_53A5D
		cmp	word ptr [si+0AFh], 0
		jz	short loc_53A62

loc_53A5D:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+1BEj
		mov	ax, 1
		jmp	short loc_53A64
; ���������������������������������������������������������������������������

loc_53A62:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+1C5j
		xor	ax, ax

loc_53A64:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+1CAj
		mov	[bp+var_8], al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_53A7E

loc_53A6D:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+197j
		mov	[bp+var_C], 6400h
		mov	eax, [bp+var_C]
		sub	dword_706AB, eax

loc_53A7E:				; CODE XREF: STRIKE_EXE_MAIN_LOOP+1D5j
		push	si
		call	VROOMM_StubThunk_6CE5B
		pop	cx
		push	1
		call	Widget_Helper_5A9E6
		pop	cx
		mov	al, byte_706AF
		pop	di
		pop	si
		leave
		retf
STRIKE_EXE_MAIN_LOOP	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 476 lignes, NON DÉTAILLÉE — construit une arborescence de widgets/nœuds (dispatch
; vtable, Expr_Node_Accessor_52E17 ×3, sub_3A40B pour ajout à liste membre, appelle
; UIScreen_SetWidgetValue_50654 en fin). Candidat pour session dédiée. REMONTEE PARTIELLE (476
; lignes, portion pertinente lue completement a la demande de Remi) : LE NOM PRECEDENT
; ('UIScreen_BuildWidgetTree') ETAIT TROMPEUR - la portion lue ne construit aucun widget. Pose
; byte_6E4BF=1 (source du declencheur du message de destruction 0x0D via
; RadioFlags_ShiftHistory) quand deux entites (di, si) ont une valeur a +0x50 (meme champ deja
; vu comme identifiant d'appartenance dans AI_MissileThreatTrigger_A) qui sont l'OPPOSE EXACTE
; l'une de l'autre (var_4 == -var_6) - probable verification 'cible detruite appartient au
; camp oppose', PAS un trait ATRB. Le reste de la fonction (les ~350 lignes precedentes) n'a
; pas ete relu en detail.
; ==============================================================================================
Combat_TeamOpposedCheckAndDispatch_53A94	proc far		; CODE XREF: AI_MissileThreatTrigger_A+13CP
					; Debris_SpawnOrchestrator+7BP ...

var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_7		= byte ptr -7
var_6		= byte ptr -6
var_4		= byte ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	word_706A0
		nop
		push	cs
		call	near ptr UIScreen_BuildWidgetTree_Recurse_53D92
		add	sp, 6
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_53ABF
		push	di
		mov	bx, [di]
		call	dword ptr [bx+38h]
		pop	cx
		mov	di, ax

loc_53ABF:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+20j
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_53AD2
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_53AD4
; ���������������������������������������������������������������������������

loc_53AD2:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+33j
		mov	al, 17h

loc_53AD4:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+3Cj
		mov	[bp+var_2], al
		mov	[bp+var_4], 0
		or	di, di
		jz	short loc_53AEB

loc_53ADF:
		test	byte ptr [di+4], 10h

loc_53AE3:
		jz	short loc_53AEB

loc_53AE5:
		mov	al, [di+50h]

loc_53AE8:
		mov	[bp+var_4], al

loc_53AEB:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+49j
					; Combat_TeamOpposedCheckAndDispatch_53A94:loc_53AE3j
		mov	[bp+var_6], 0

loc_53AEF:
		or	si, si

loc_53AF1:
		jz	short loc_53AFF

loc_53AF3:
		test	byte ptr [si+4], 10h

loc_53AF7:
		jz	short loc_53AFF
		mov	al, [si+50h]
		mov	[bp+var_6], al

loc_53AFF:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94:loc_53AF1j
					; Combat_TeamOpposedCheckAndDispatch_53A94:loc_53AF7j
		mov	[bp+var_7], 0

loc_53B03:
		cmp	[bp+var_2], 6
		jnz	short loc_53B23
		push	word ptr [si+51h]
		mov	bx, [si+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		mov	al, [bx+75h]
		shr	ax, 5
		and	ax, 1
		mov	[bp+var_7], al

loc_53B23:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+73j
		push	si
		mov	ax, word_706A0
		add	ax, 34h	; '4'
		push	ax
		push	cs
		call	near ptr Expr_Node_Accessor_52E17
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_53B73
		les	bx, [bp+var_C]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		mov	ah, 0
		or	ax, ax
		jnz	short loc_53B6B
		cmp	byte ptr es:[bx+31h], 0FFh
		jnz	short loc_53B5D
		inc	word_706A9

loc_53B5D:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+C3j
		les	bx, [bp+var_C]
		cmp	byte ptr es:[bx+31h], 1
		jnz	short loc_53B6B
		inc	word_706A5

loc_53B6B:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+BCj
					; Combat_TeamOpposedCheckAndDispatch_53A94+D1j
		les	bx, [bp+var_C]
		or	byte ptr es:[bx+39h], 2

loc_53B73:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+A9j
		mov	[bp+var_10], 0
		or	di, di
		jz	short loc_53B94
		push	di
		mov	ax, word_706A0
		add	ax, 34h	; '4'
		push	ax
		push	cs
		call	near ptr Expr_Node_Accessor_52E17
		add	sp, 4
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax

loc_53B94:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+E9j
		cmp	[bp+var_10], 0
		jnz	short loc_53BC2
		cmp	[bp+var_2], 6
		jnz	short loc_53BC2
		mov	di, [si+6Fh]
		or	di, di
		jnz	short loc_53BAD
		mov	di, [bp+arg_2]
		jmp	short loc_53BC2
; ���������������������������������������������������������������������������

loc_53BAD:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+112j
		push	di
		mov	ax, word_706A0
		add	ax, 34h	; '4'
		push	ax
		push	cs
		call	near ptr Expr_Node_Accessor_52E17
		add	sp, 4
		mov	word ptr [bp+var_10+2],	dx
		mov	word ptr [bp+var_10], ax

loc_53BC2:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+105j
					; Combat_TeamOpposedCheckAndDispatch_53A94+10Bj ...
		cmp	[bp+var_10], 0
		jz	short loc_53C2B
		mov	al, [bp+var_7]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_53C2B
		mov	al, [bp+var_6]
		cmp	al, [bp+var_4]

loc_53BD8:
		jz	short loc_53C2B

loc_53BDA:
		cmp	[bp+var_2], 6
		jnz	short loc_53BE7

loc_53BE0:
		les	bx, [bp+var_10]
		inc	word ptr es:[bx+3Eh]

loc_53BE7:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+14Aj
		test	byte ptr [si+4], 40h
		jz	short loc_53BFD

loc_53BED:
		mov	al, [si+4]
		and	al, 8

loc_53BF2:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_53BFD

loc_53BF8:
		mov	ax, 1
		jmp	short loc_53BFF
; ���������������������������������������������������������������������������

loc_53BFD:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+157j
					; Combat_TeamOpposedCheckAndDispatch_53A94+162j
		xor	ax, ax

loc_53BFF:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+167j
		or	al, al
		jnz	short loc_53C24
		mov	al, [si+4]
		and	al, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_53C1E
		mov	al, [si+4]
		and	al, 8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_53C1E
		mov	ax, 1
		jmp	short loc_53C20
; ���������������������������������������������������������������������������

loc_53C1E:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+178j
					; Combat_TeamOpposedCheckAndDispatch_53A94+183j
		xor	ax, ax

loc_53C20:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+188j
		or	al, al
		jz	short loc_53C2B

loc_53C24:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+16Dj
		les	bx, [bp+var_10]
		inc	word ptr es:[bx+40h]

loc_53C2B:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+133j
					; Combat_TeamOpposedCheckAndDispatch_53A94+13Cj ...
		cmp	si, word_722E6
		jnz	short loc_53C45
		mov	[bp+var_12], di
		push	[bp+var_12]
		push	5238h
		call	SetReference16
		add	sp, 4
		jmp	loc_53D7A
; ���������������������������������������������������������������������������

loc_53C45:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+19Bj
		mov	al, byte_6E4B4
		mov	ah, 0
		or	ax, ax
		jz	short loc_53C51
		jmp	loc_53D7A
; ���������������������������������������������������������������������������

loc_53C51:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+1B8j
		mov	al, [bp+var_2]
		mov	ah, 0
		mov	[bp+var_16], ax
		mov	cx, 5		; switch 5 cases
		mov	bx, offset word_53D7E

loc_53C5F:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+1D6j
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_16]
		jz	short loc_53C6F
		add	bx, 2
		loop	loc_53C5F
		jmp	loc_53D6E	; default
; ���������������������������������������������������������������������������

loc_53C6F:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+1D1j
		jmp	word ptr cs:[bx+0Ah] ; switch jump

loc_53C73:				; DATA XREF: seg114:2F28o
		mov	al, [bp+var_7]	; case 0x1
		mov	ah, 0
		or	ax, ax
		jz	short loc_53C7F
		jmp	loc_53D6E	; default
; ���������������������������������������������������������������������������

loc_53C7F:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+1E6j
		cmp	[bp+var_6], 0FFh
		jnz	short loc_53CC9
		push	si
		call	Weapon_HUDBox_UpdateAndRenderVariant_5AA49
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_53CF2
		cmp	di, word_722E6
		jnz	short loc_53CF2
		mov	al, [bp+var_2]
		mov	ah, 0
		cmp	ax, 6
		jz	short loc_53CAE
		cmp	ax, 13h
		jz	short loc_53CB3
		cmp	ax, 14h
		jz	short loc_53CB3
		jmp	short loc_53CB8
; ���������������������������������������������������������������������������

loc_53CAE:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+20Cj
		mov	ax, 10h
		jmp	short loc_53CBB
; ���������������������������������������������������������������������������

loc_53CB3:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+211j
					; Combat_TeamOpposedCheckAndDispatch_53A94+216j
		mov	ax, 11h
		jmp	short loc_53CBB
; ���������������������������������������������������������������������������

loc_53CB8:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+218j
		mov	ax, 12h

loc_53CBB:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+21Dj
					; Combat_TeamOpposedCheckAndDispatch_53A94+222j
		cmp	ax, 0FFFFh
		jz	short loc_53CF2
		push	ax

loc_53CC1:
		call	TextObject_AllocateVariantA_5A984

loc_53CC6:
		pop	cx
		jmp	short loc_53CF2
; ���������������������������������������������������������������������������

loc_53CC9:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+1EFj
		cmp	[bp+var_6], 1

loc_53CCD:
		jnz	short loc_53CF2

loc_53CCF:
		push	word_706A0

loc_53CD3:
		call	VROOMM_StubThunk_6CE2E
		pop	cx
		cmp	dx, word ptr [bp+var_C+2]

loc_53CDC:
		jnz	short loc_53CE8

loc_53CDE:
		cmp	ax, word ptr [bp+var_C]
		jnz	short loc_53CE8

loc_53CE3:
		mov	ax, 0Eh
		jmp	short loc_53CEB
; ���������������������������������������������������������������������������

loc_53CE8:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94:loc_53CDCj
					; Combat_TeamOpposedCheckAndDispatch_53A94+24Dj
		mov	ax, 0Fh

loc_53CEB:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+252j
		push	ax

loc_53CEC:
		call	TextObject_AllocateVariantA_5A984
		pop	cx

loc_53CF2:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+1FCj
					; Combat_TeamOpposedCheckAndDispatch_53A94+202j ...
		or	di, di
		jz	short loc_53D6E	; default
		mov	byte_6E4BB, 0
		cmp	di, word_722E6
		jnz	short loc_53D0B
		cmp	di, [bp+arg_2]
		jnz	short loc_53D0B
		mov	byte_6E4C3, 1

loc_53D0B:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+26Bj
					; Combat_TeamOpposedCheckAndDispatch_53A94+270j
		cmp	[bp+arg_2], 0
		jz	short loc_53D39
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_53D2E
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_53D30
; ���������������������������������������������������������������������������

loc_53D2E:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+28Aj
		mov	al, 17h

loc_53D30:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+298j
		cmp	al, 0Dh

loc_53D32:
		jnz	short loc_53D39

loc_53D34:
		mov	byte_6E4C4, 1

loc_53D39:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+27Bj
					; Combat_TeamOpposedCheckAndDispatch_53A94:loc_53D32j
		mov	[bp+var_14], di

loc_53D3C:
		push	[bp+var_14]

loc_53D3F:
		push	5238h

loc_53D42:
		call	SetReference16

loc_53D47:
		add	sp, 4
		mov	al, [bp+var_4]
		cmp	al, [bp+var_6]
		jnz	short loc_53D59
		mov	byte_6E4BE, 1
		jmp	short loc_53D6E	; default
; ���������������������������������������������������������������������������

loc_53D59:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+2BCj
		mov	al, [bp+var_4]
		cbw
		push	ax
		mov	al, [bp+var_6]
		cbw
		neg	ax
		pop	dx
		cmp	dx, ax
		jnz	short loc_53D6E	; default
		mov	byte_6E4BF, 1

loc_53D6E:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+1D8j
					; Combat_TeamOpposedCheckAndDispatch_53A94+1E8j ...
		push	[bp+arg_2]	; default
		push	si
		call	UIScreen_SetWidgetValue_50654
		add	sp, 4

loc_53D7A:				; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+1AEj
					; Combat_TeamOpposedCheckAndDispatch_53A94+1BAj
		pop	di
		pop	si
		leave
		retf
Combat_TeamOpposedCheckAndDispatch_53A94	endp

; ���������������������������������������������������������������������������
word_53D7E	dw	1,     6,   13h,   14h ; DATA XREF: Combat_TeamOpposedCheckAndDispatch_53A94+1C8o
		dw    15h		; value	table for switch statement
		dw offset loc_53C73	; jump table for switch	statement
		dw offset loc_53C73
		dw offset loc_53C73
		dw offset loc_53C73
		dw offset loc_53C73

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 395 lignes, NON DÉTAILLÉE — sous-routine récursive de UIScreen_BuildWidgetTree_53A94
; (mêmes dispatchs vtable et Expr_Node_Accessor_52E17). Candidat pour session dédiée.
; ==============================================================================================
UIScreen_BuildWidgetTree_Recurse_53D92	proc far		; CODE XREF: Combat_TeamOpposedCheckAndDispatch_53A94+15p

var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_E		= byte ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= byte ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	bx, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	[bp+arg_4], 0
		jnz	short loc_53DA9
		jmp	loc_5402F
; ���������������������������������������������������������������������������

loc_53DA9:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+12j
		mov	di, [bp+arg_4]
		or	di, di
		jz	short loc_53DB9
		push	di
		mov	bx, [di]
		call	dword ptr [bx+38h]
		pop	cx
		mov	di, ax

loc_53DB9:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+1Cj
		or	di, di
		jz	short loc_53DD2
		push	di
		mov	ax, word_706A0
		add	ax, 34h	; '4'
		push	ax
		push	cs

loc_53DC6:
		call	near ptr Expr_Node_Accessor_52E17
		add	sp, 4
		mov	word ptr [bp+var_6+2], dx

loc_53DCF:
		mov	word ptr [bp+var_6], ax

loc_53DD2:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+29j
		cmp	[bp+var_6], 0
		jnz	short loc_53E0D
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_53DEC

loc_53DE3:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx

loc_53DEA:
		jmp	short loc_53DEE
; ���������������������������������������������������������������������������

loc_53DEC:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+4Fj
		mov	al, 17h

loc_53DEE:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92:loc_53DEAj
		cmp	al, 6
		jnz	short loc_53E0D
		mov	di, [si+6Fh]
		or	di, di
		jnz	short loc_53DFE
		mov	di, [bp+arg_4]
		jmp	short loc_53E0D
; ���������������������������������������������������������������������������

loc_53DFE:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+65j
		push	di
		mov	ax, word_706A0
		add	ax, 34h	; '4'
		push	ax
		push	cs
		call	near ptr Expr_Node_Accessor_52E17
		add	sp, 4

loc_53E0D:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+45j
					; UIScreen_BuildWidgetTree_Recurse_53D92+5Ej ...
		cmp	di, word_722E6
		jz	short loc_53E16
		jmp	loc_5402F
; ���������������������������������������������������������������������������

loc_53E16:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+7Fj
		push	[bp+arg_4]
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		mov	[bp+var_8], al
		mov	ah, 0
		cmp	ax, 8
		jz	short loc_53E42
		cmp	ax, 9
		jz	short loc_53E4C
		cmp	ax, 0Dh
		jz	short loc_53E38

loc_53E36:
		jmp	short loc_53E56
; ���������������������������������������������������������������������������

loc_53E38:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+A2j
		mov	[bp+var_C], 180h
		jmp	short loc_53E5E
; ���������������������������������������������������������������������������

loc_53E42:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+98j
		mov	[bp+var_C], 100h
		jmp	short loc_53E5E
; ���������������������������������������������������������������������������

loc_53E4C:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+9Dj
		mov	[bp+var_C], 133h
		jmp	short loc_53E5E
; ���������������������������������������������������������������������������

loc_53E56:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92:loc_53E36j
		mov	[bp+var_C], 100h

loc_53E5E:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+AEj
					; UIScreen_BuildWidgetTree_Recurse_53D92+B8j ...
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_53E71
		push	si
		mov	bx, [si]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_53E73
; ���������������������������������������������������������������������������

loc_53E71:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+D4j
		mov	al, 17h

loc_53E73:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+DDj
		mov	[bp+var_E], al
		mov	al, [si+50h]
		mov	[bp+var_10], al
		mov	al, [bp+var_E]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	cx, 4		; switch 4 cases
		mov	bx, offset word_54033

loc_53E8A:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+103j
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_2]
		jz	short loc_53E99
		add	bx, 2
		loop	loc_53E8A
		jmp	short loc_53F12	; default
; ���������������������������������������������������������������������������

loc_53E99:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+FEj
		jmp	word ptr cs:[bx+8] ; switch jump

loc_53E9D:				; DATA XREF: seg114:31DBo
		cmp	[bp+var_10], 1	; case 0x6
		jnz	short loc_53EAA
		mov	[bp+var_12], 0FF6Ah
		jmp	short loc_53F17
; ���������������������������������������������������������������������������

loc_53EAA:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+10Fj
		cmp	[bp+var_10], 0FFh
		jnz	short loc_53EB7
		mov	[bp+var_12], 32h ; '2'
		jmp	short loc_53F17
; ���������������������������������������������������������������������������

loc_53EB7:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+11Cj
		cmp	[bp+var_10], 0
		jnz	short loc_53F17
		mov	[bp+var_12], 0

loc_53EC2:
		jmp	short loc_53F17
; ���������������������������������������������������������������������������

loc_53EC4:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92:loc_53E99j
					; DATA XREF: seg114:31DBo
		cmp	[bp+var_10], 1	; case 0x1
		jnz	short loc_53ED1

loc_53ECA:
		mov	[bp+var_12], 0FF9Ch
		jmp	short loc_53F17
; ���������������������������������������������������������������������������

loc_53ED1:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+136j
		cmp	[bp+var_10], 0FFh
		jnz	short loc_53EDE
		mov	[bp+var_12], 28h ; '('
		jmp	short loc_53F17
; ���������������������������������������������������������������������������

loc_53EDE:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+143j
		cmp	[bp+var_10], 0
		jnz	short loc_53F17

loc_53EE4:
		mov	[bp+var_12], 14h

loc_53EE9:
		jmp	short loc_53F17
; ���������������������������������������������������������������������������

loc_53EEB:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92:loc_53E99j
					; DATA XREF: seg114:31DBo
		cmp	[bp+var_10], 1	; case 0x13
		jnz	short loc_53EF8

loc_53EF1:
		mov	[bp+var_12], 0FF9Ch

loc_53EF6:
		jmp	short loc_53F17
; ���������������������������������������������������������������������������

loc_53EF8:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+15Dj
		cmp	[bp+var_10], 0FFh
		jnz	short loc_53F05
		mov	[bp+var_12], 32h ; '2'
		jmp	short loc_53F17
; ���������������������������������������������������������������������������

loc_53F05:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+16Aj
		cmp	[bp+var_10], 0
		jnz	short loc_53F17
		mov	[bp+var_12], 19h
		jmp	short loc_53F17
; ���������������������������������������������������������������������������

loc_53F12:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+105j
		mov	[bp+var_12], 0	; default

loc_53F17:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+116j
					; UIScreen_BuildWidgetTree_Recurse_53D92+123j ...
		mov	[bp+var_1A], 100h
		mov	eax, [bp+var_1A]
		mov	[bp+var_16], eax
		mov	al, byte_72354
		mov	ah, 0
		or	ax, ax
		jnz	short loc_53F34

loc_53F30:
		dec	[bp+var_16]

loc_53F34:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+19Cj
		cmp	byte_72355, 0
		jz	short loc_53F3F

loc_53F3B:
		dec	[bp+var_16]

loc_53F3F:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+1A7j
		cmp	byte_72356, 0
		jz	short loc_53F4B
		sub	[bp+var_16], 2

loc_53F4B:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+1B2j
		cmp	byte_72358, 0
		jz	short loc_53F57
		sub	[bp+var_16], 33h ; '3'

loc_53F57:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+1BEj
		cmp	byte_72359, 0
		jz	short loc_53F63
		sub	[bp+var_16], 0Ch

loc_53F63:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+1CAj
		cmp	byte_7235A, 0
		jz	short loc_53F6F
		sub	[bp+var_16], 2

loc_53F6F:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+1D6j
		cmp	byte_7235D, 0
		jz	short loc_53F7B
		sub	[bp+var_16], 5

loc_53F7B:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+1E2j
		cmp	byte_7235B, 0
		jz	short loc_53F8A
		sub	[bp+var_16], 200h

loc_53F8A:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+1EEj
		cmp	byte_7235C, 0
		jz	short loc_53F96
		sub	[bp+var_16], 3

loc_53F96:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+1FDj
		cmp	byte_7235E, 0
		jz	short loc_53FA2
		sub	[bp+var_16], 2

loc_53FA2:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+209j
		cmp	word_7235F, 1
		jnz	short loc_53FAE
		sub	[bp+var_16], 0Ch

loc_53FAE:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+215j
		cmp	word_7235F, 2
		jnz	short loc_53FBA
		sub	[bp+var_16], 19h

loc_53FBA:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+221j
		cmp	byte_72363, 0
		jz	short loc_53FC5
		dec	[bp+var_16]

loc_53FC5:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+22Dj
		cmp	byte_72364, 0

loc_53FCA:
		jz	short loc_53FD0
		dec	[bp+var_16]

loc_53FD0:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92:loc_53FCAj
		cmp	byte_72365, 0
		jz	short loc_53FDB

loc_53FD7:
		dec	[bp+var_16]

loc_53FDB:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+243j
		cmp	byte_6E33C, 0

loc_53FE0:
		jnz	short loc_53FE9

loc_53FE2:
		cmp	[bp+var_16], 0

loc_53FE7:
		jge	short loc_53FF1

loc_53FE9:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92:loc_53FE0j
		mov	[bp+var_16], 0

loc_53FF1:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92:loc_53FE7j
		movsx	eax, [bp+var_12]
		shl	eax, 8
		mov	[bp+var_1E], eax

loc_53FFE:
		mov	eax, [bp+var_1E]

loc_54002:
		mov	edx, [bp+var_C]

loc_54006:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	edx, [bp+var_16]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		add	dword_706AB, eax

loc_5402F:				; CODE XREF: UIScreen_BuildWidgetTree_Recurse_53D92+14j
					; UIScreen_BuildWidgetTree_Recurse_53D92+81j
		pop	di
		pop	si
		leave
		retf
UIScreen_BuildWidgetTree_Recurse_53D92	endp

; ���������������������������������������������������������������������������
word_54033	dw	1,     6,   13h,   15h ; DATA XREF: UIScreen_BuildWidgetTree_Recurse_53D92+F5o
					; value	table for switch statement
		dw offset loc_53EC4	; jump table for switch	statement
		dw offset loc_53E9D
		dw offset loc_53EEB
		dw offset loc_53EEB

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, parcourt une table globale (word_706A0+0x34, stride 0x55) et compte les entrées
; répondant à un critère de flags (+0x39 bits 0-2) et sélection (+0x31==1).
; ==============================================================================================
Expr_Node_CountSelectedInTable_54043	proc far		; CODE XREF: Expr_Node_UpdateSelectionCounters_544DC+4p

var_6		= dword	ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 6
		xor	dx, dx
		mov	bx, word_706A0
		mov	ax, [bx+34h]
		mov	[bp+var_2], ax
		mov	eax, [bx+36h]
		mov	[bp+var_6], eax
		xor	cx, cx
		jmp	short loc_540A9
; ���������������������������������������������������������������������������

loc_54061:				; CODE XREF: Expr_Node_CountSelectedInTable_54043+69j
		les	bx, [bp+var_6]
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_540A4
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_54093
		mov	al, es:[bx+39h]
		shl	ax, 0Dh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_54093
		mov	ax, 1
		jmp	short loc_54095
; ���������������������������������������������������������������������������

loc_54093:				; CODE XREF: Expr_Node_CountSelectedInTable_54043+3Bj
					; Expr_Node_CountSelectedInTable_54043+49j
		xor	ax, ax

loc_54095:				; CODE XREF: Expr_Node_CountSelectedInTable_54043+4Ej
		or	al, al
		jz	short loc_540A4
		les	bx, [bp+var_6]
		cmp	byte ptr es:[bx+31h], 1
		jnz	short loc_540A4
		inc	dx

loc_540A4:				; CODE XREF: Expr_Node_CountSelectedInTable_54043+2Dj
					; Expr_Node_CountSelectedInTable_54043+54j ...
		inc	cx
		add	word ptr [bp+var_6], 55h ; 'U'

loc_540A9:				; CODE XREF: Expr_Node_CountSelectedInTable_54043+1Cj
		cmp	cx, [bp+var_2]
		jl	short loc_54061
		mov	ax, dx
		leave
		retf
Expr_Node_CountSelectedInTable_54043	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelée par sub_544DC en complément de Expr_Node_CountSelectedInTable_54043 (rôle exact
; non détaillé).
; ==============================================================================================
Expr_Node_TableOperationB_540B2	proc far		; CODE XREF: Expr_Node_UpdateSelectionCounters_544DC+11p

var_6		= dword	ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 6
		xor	dx, dx
		mov	bx, word_706A0
		mov	ax, [bx+34h]
		mov	[bp+var_2], ax

loc_540C4:
		mov	eax, [bx+36h]

loc_540C8:
		mov	[bp+var_6], eax
		xor	cx, cx
		jmp	short loc_54118
; ���������������������������������������������������������������������������

loc_540D0:				; CODE XREF: Expr_Node_TableOperationB_540B2+69j
		les	bx, [bp+var_6]

loc_540D3:
		mov	al, es:[bx+39h]

loc_540D7:
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_54113

loc_540E1:
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_54102
		mov	al, es:[bx+39h]
		shl	ax, 0Dh
		sar	ax, 0Fh

loc_540F9:
		or	ax, ax

loc_540FB:
		jnz	short loc_54102
		mov	ax, 1
		jmp	short loc_54104
; ���������������������������������������������������������������������������

loc_54102:				; CODE XREF: Expr_Node_TableOperationB_540B2+3Bj
					; Expr_Node_TableOperationB_540B2:loc_540FBj
		xor	ax, ax

loc_54104:				; CODE XREF: Expr_Node_TableOperationB_540B2+4Ej
		or	al, al
		jz	short loc_54113
		les	bx, [bp+var_6]
		cmp	byte ptr es:[bx+31h], 0FFh
		jnz	short loc_54113
		inc	dx

loc_54113:				; CODE XREF: Expr_Node_TableOperationB_540B2+2Dj
					; Expr_Node_TableOperationB_540B2+54j ...
		inc	cx
		add	word ptr [bp+var_6], 55h ; 'U'

loc_54118:				; CODE XREF: Expr_Node_TableOperationB_540B2+1Cj
		cmp	cx, [bp+var_2]
		jl	short loc_540D0
		mov	ax, dx
		leave
		retf
Expr_Node_TableOperationB_540B2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, calcul agrégé utilisant Expr_Node_StoreResultVector_52C9C et une distance (sub_5828E) ;
; appelée par sub_54503.
; ==============================================================================================
Expr_Node_ComputeAggregateField_54121	proc far		; CODE XREF: UIScreen_RenderOrLayoutList_54503+176p

var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	ax, [bp+arg_0]
		xor	si, si
		mov	bx, word_706A0

loc_54132:
		mov	ax, [bx+34h]
		mov	[bp+var_2], ax

loc_54138:
		mov	eax, [bx+36h]
		mov	[bp+var_6], eax

loc_54140:
		mov	[bp+var_8], 0

loc_54145:
		jmp	loc_54263
; ���������������������������������������������������������������������������

loc_54148:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+14Aj
		les	bx, [bp+var_6]
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_5415C
		jmp	loc_5425C
; ���������������������������������������������������������������������������

loc_5415C:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+36j
		mov	al, es:[bx+31h]
		cmp	al, [bp+arg_2]
		jz	short loc_54168
		jmp	loc_5425C
; ���������������������������������������������������������������������������

loc_54168:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+42j
		mov	di, es:[bx+52h]
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_5418D
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_5418D
		mov	ax, 1
		jmp	short loc_5418F
; ���������������������������������������������������������������������������

loc_5418D:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+57j
					; Expr_Node_ComputeAggregateField_54121+65j
		xor	ax, ax

loc_5418F:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+6Aj
		or	al, al
		jz	short loc_541A7
		or	di, di
		jnz	short loc_5419A
		jmp	loc_5425C
; ���������������������������������������������������������������������������

loc_5419A:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+74j
		test	byte ptr [di+4], 8
		jnz	short loc_541A3
		jmp	loc_5425C
; ���������������������������������������������������������������������������

loc_541A3:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+7Dj
		inc	si
		jmp	loc_5425C
; ���������������������������������������������������������������������������

loc_541A7:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+70j
		les	bx, [bp+var_6]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_541CB
		mov	al, es:[bx+39h]
		shl	ax, 0Dh

loc_541BF:
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_541CB

loc_541C6:
		mov	ax, 1
		jmp	short loc_541CD
; ���������������������������������������������������������������������������

loc_541CB:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+95j
					; Expr_Node_ComputeAggregateField_54121+A3j
		xor	ax, ax

loc_541CD:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+A8j
		or	al, al
		jnz	short loc_541D4

loc_541D1:
		jmp	loc_5425C
; ���������������������������������������������������������������������������

loc_541D4:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+AEj
		cmp	[bp+arg_4], 1
		jnz	short loc_541E9
		or	di, di
		jz	short loc_541E9
		mov	al, [di+4]
		and	al, 8

loc_541E3:
		mov	ah, 0
		or	ax, ax
		jz	short loc_5425C

loc_541E9:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+B7j
					; Expr_Node_ComputeAggregateField_54121+BBj
		cmp	[bp+arg_8], 0
		jnz	short loc_541F3
		inc	si

loc_541F1:
		jmp	short loc_5425C
; ���������������������������������������������������������������������������

loc_541F3:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+CDj
		push	large [bp+var_6]
		push	ss
		lea	ax, [bp+var_28]
		push	ax
		push	cs

loc_541FD:
		call	near ptr Expr_Node_StoreResultVector_52C9C

loc_54200:
		add	sp, 8

loc_54203:
		mov	eax, [bp+var_28]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_14], eax
		mov	di, [bp+arg_6]
		mov	eax, [di]
		sub	[bp+var_1C], eax
		mov	eax, [di+4]
		sub	[bp+var_18], eax
		mov	eax, [di+8]

loc_54231:
		sub	[bp+var_14], eax

loc_54235:
		push	large [bp+var_14]
		push	large [bp+var_18]
		push	large [bp+var_1C]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax
		cmp	eax, [bp+arg_8]
		jge	short loc_5425C
		inc	si

loc_5425C:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+38j
					; Expr_Node_ComputeAggregateField_54121+44j ...
		inc	[bp+var_8]
		add	word ptr [bp+var_6], 55h ; 'U'

loc_54263:				; CODE XREF: Expr_Node_ComputeAggregateField_54121:loc_54145j
		mov	ax, [bp+var_8]
		cmp	ax, [bp+var_2]
		jge	short loc_5426E
		jmp	loc_54148
; ���������������������������������������������������������������������������

loc_5426E:				; CODE XREF: Expr_Node_ComputeAggregateField_54121+148j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Expr_Node_ComputeAggregateField_54121	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée depuis seg004 (cœur IA) : combine Expr_Node_Accessor_52E17,
; Expr_LookupNamedValue_52D08 et GeomNode_SumOffsetsUpChain_50EEB — confirme l'usage du
; système GeomNode par l'IA de vol/combat pour résoudre des positions de référence. LUE
; INTEGRALEMENT (verification du lien avec AI_ManeuverSolutionMain_781D0, a la demande de
; Remi). CONCLUSION : CE N'EST PAS LA MEME FAMILLE. AI_ResolveNodePosition_54274 resout une
; POSITION NOMMEE en combinant le systeme d'EXPRESSIONS (Expr_Node_Accessor_52E17 /
; Expr_LookupNamedValue_52D08 - le meme systeme que MissionScript_ExecutePROG) et la
; HIERARCHIE GEOMETRIQUE (GeomNode_SumOffsetsUpChain_50EEB - somme les decalages en remontant
; l'arbre de noeuds d'un modele 3D, typiquement pour resoudre un point d'ancrage nomme comme
; un point de formation ou un point d'attache d'arme). En cas d'echec de resolution, replie
; sur des valeurs GLOBALES fixes (dword_707F8/7FC/800) ou sur les champs d'un objet reference
; alternatif (+0x22). AI_ManeuverSolutionMain_781D0, elle, interprete le bytecode COMP pour
; DEPLACER une entite dans le temps (integrateur cinematique). CE SONT DEUX MECANISMES
; COMPLEMENTAIRES MAIS DISTINCTS : l'un repond a 'ou est ce point', l'autre anime 'comment s'y
; deplacer' - aucun lien de classe/famille commun confirme.
; ==============================================================================================
AI_ResolveNodePosition_54274	proc far		; CODE XREF: seg004:081AP seg004:0942P

var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
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
		mov	ax, word_706A0
		add	ax, 34h	; '4'
		push	ax
		push	cs
		call	near ptr Expr_Node_Accessor_52E17
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_542AE
		jmp	loc_5437B
; ���������������������������������������������������������������������������

loc_542AE:				; CODE XREF: AI_ResolveNodePosition_54274+35j
		les	bx, [bp+var_4]
		or	byte ptr es:[bx+39h], 4
		push	dx
		push	ax
		push	cs
		call	near ptr Expr_LookupNamedValue_52D08
		add	sp, 4
		or	al, al

loc_542C1:
		jz	short loc_542F1
		push	ds
		mov	ax, si
		add	ax, 58h	; 'X'
		push	ax
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		push	cs
		call	near ptr GeomNode_SumOffsetsUpChain_50EEB

loc_542D3:
		add	sp, 8

loc_542D6:
		mov	eax, [bp+var_20]
		mov	[bp+var_14], eax

loc_542DE:
		mov	eax, [bp+var_1C]

loc_542E2:
		mov	[bp+var_10], eax

loc_542E6:
		mov	eax, [bp+var_18]

loc_542EA:
		mov	[bp+var_C], eax
		jmp	loc_5437B
; ���������������������������������������������������������������������������

loc_542F1:				; CODE XREF: AI_ResolveNodePosition_54274:loc_542C1j
		cmp	word ptr [si+50h], 0
		jnz	short loc_542FA
		jmp	loc_5437B
; ���������������������������������������������������������������������������

loc_542FA:				; CODE XREF: AI_ResolveNodePosition_54274+81j
		mov	bx, [si+50h]
		mov	ax, [bx+4]
		or	ax, [bx+6]

loc_54303:
		jnz	short loc_5430A
		mov	ax, 1
		jmp	short loc_5430C
; ���������������������������������������������������������������������������

loc_5430A:				; CODE XREF: AI_ResolveNodePosition_54274:loc_54303j
		xor	ax, ax

loc_5430C:				; CODE XREF: AI_ResolveNodePosition_54274+94j
		or	ax, ax
		jz	short loc_5432F
		mov	eax, dword_707F8
		mov	[bp+var_2C], eax
		mov	eax, dword_707FC
		mov	[bp+var_28], eax
		mov	eax, dword_70800
		mov	[bp+var_24], eax
		mov	dx, ss
		lea	ax, [bp+var_2C]
		jmp	short loc_54363
; ���������������������������������������������������������������������������

loc_5432F:				; CODE XREF: AI_ResolveNodePosition_54274+9Aj
		mov	bx, [si+50h]
		mov	ax, [bx+6]
		mov	dx, [bx+4]
		add	dx, 22h	; '"'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	[bp+var_2C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_28], eax
		mov	eax, es:[si+8]
		mov	[bp+var_24], eax
		mov	dx, ss
		lea	ax, [bp+var_2C]

loc_54363:				; CODE XREF: AI_ResolveNodePosition_54274+B9j
		mov	eax, [bp+var_2C]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_C], eax

loc_5437B:				; CODE XREF: AI_ResolveNodePosition_54274+37j
					; AI_ResolveNodePosition_54274+7Aj ...
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_54386
		mov	ax, si
		jmp	short loc_54390
; ���������������������������������������������������������������������������

loc_54386:				; CODE XREF: AI_ResolveNodePosition_54274+10Cj
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_54390:				; CODE XREF: AI_ResolveNodePosition_54274+110j
		or	ax, ax
		jz	short loc_543AF
		mov	eax, [bp+var_14]
		mov	[si], eax
		mov	eax, [bp+var_10]
		mov	[si+4],	eax
		mov	eax, [bp+var_C]
		mov	[si+8],	eax
		mov	ax, si
		jmp	short loc_543B1
; ���������������������������������������������������������������������������

loc_543AF:				; CODE XREF: AI_ResolveNodePosition_54274+11Ej
		mov	ax, si

loc_543B1:				; CODE XREF: AI_ResolveNodePosition_54274+139j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
AI_ResolveNodePosition_54274	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, accesseur du nœud actuellement sélectionné/en focus (chaîne globale
; word_706A0→+0x54→+0x52).
; ==============================================================================================
Expr_Node_GetFocusedNode_543BA	proc far		; CODE XREF: PartEntry_ResolveSpawnPositionAndActivate_51EDC+96p
					; PartEntry_ResolveSpawnPositionAndActivate_51EDC+EEp
		push	bp
		mov	bp, sp
		mov	bx, word_706A0

loc_543C1:
		les	bx, [bx+54h]
		mov	ax, es:[bx+52h]
		pop	bp
		retf
Expr_Node_GetFocusedNode_543BA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 166 lignes, NON DÉTAILLÉE — trois allocations (sub_658) successives, référencée
; depuis sub_C5CD (hors cluster identifié).
; ==============================================================================================
Expr_Node_AllocateTriple_543CA	proc far		; CODE XREF: AI_MessageDispatcher+36CP

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]

loc_543D4:
		cmp	word ptr [si+3Ah], 1
		jbe	short loc_543E2
		mov	ax, [si+3Ch]
		add	ax, 27h	; '''
		jmp	short loc_543E4
; ���������������������������������������������������������������������������

loc_543E2:				; CODE XREF: Expr_Node_AllocateTriple_543CA+Ej
		xor	ax, ax

loc_543E4:				; CODE XREF: Expr_Node_AllocateTriple_543CA+16j
		mov	si, ax
		or	si, si
		jnz	short loc_543ED
		jmp	loc_5449D
; ���������������������������������������������������������������������������

loc_543ED:				; CODE XREF: Expr_Node_AllocateTriple_543CA+1Ej
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		cmp	dword ptr [si+4], 0
		jnz	short loc_54401
		mov	ax, 1
		jmp	short loc_54403
; ���������������������������������������������������������������������������

loc_54401:				; CODE XREF: Expr_Node_AllocateTriple_543CA+30j
		xor	ax, ax

loc_54403:				; CODE XREF: Expr_Node_AllocateTriple_543CA+35j
		or	ax, ax
		jz	short loc_54445
		cmp	word ptr [bp+var_4], 0
		jz	short loc_54412
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_5441D
; ���������������������������������������������������������������������������

loc_54412:				; CODE XREF: Expr_Node_AllocateTriple_543CA+41j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_5441D:				; CODE XREF: Expr_Node_AllocateTriple_543CA+46j
		or	ax, ax
		jz	short loc_5443D
		mov	bx, word ptr [bp+var_4]
		mov	eax, dword_707F8
		mov	[bx], eax
		mov	eax, dword_707FC
		mov	[bx+4],	eax

loc_54433:
		mov	eax, dword_70800
		mov	[bx+8],	eax
		jmp	short $+2

loc_5443D:				; CODE XREF: Expr_Node_AllocateTriple_543CA+55j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_54443:
		jmp	short loc_54495
; ���������������������������������������������������������������������������

loc_54445:				; CODE XREF: Expr_Node_AllocateTriple_543CA+3Bj
		mov	ax, [si+6]
		mov	dx, [si+4]
		add	dx, 22h	; '"'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		cmp	word ptr [bp+var_4], 0
		jz	short loc_5445F
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_5446A
; ���������������������������������������������������������������������������

loc_5445F:				; CODE XREF: Expr_Node_AllocateTriple_543CA+8Ej
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_5446A:				; CODE XREF: Expr_Node_AllocateTriple_543CA+93j
		or	ax, ax
		jz	short loc_5448F
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	bx, word ptr [bp+var_4]
		mov	[bx], eax
		mov	eax, es:[si+4]
		mov	[bx+4],	eax
		mov	eax, es:[si+8]
		mov	[bx+8],	eax
		jmp	short $+2

loc_5448F:				; CODE XREF: Expr_Node_AllocateTriple_543CA+A2j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_54495:				; CODE XREF: Expr_Node_AllocateTriple_543CA:loc_54443j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		jmp	short loc_544D9
; ���������������������������������������������������������������������������

loc_5449D:				; CODE XREF: Expr_Node_AllocateTriple_543CA+20j
		mov	si, word ptr [bp+arg_0]
		or	si, si
		jz	short loc_544A8
		mov	ax, si
		jmp	short loc_544B2
; ���������������������������������������������������������������������������

loc_544A8:				; CODE XREF: Expr_Node_AllocateTriple_543CA+D8j
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_544B2:				; CODE XREF: Expr_Node_AllocateTriple_543CA+DCj
		or	ax, ax
		jz	short loc_544D1
		mov	eax, dword_707F8
		mov	[si], eax
		mov	eax, dword_707FC

loc_544C1:
		mov	[si+4],	eax

loc_544C5:
		mov	eax, dword_70800
		mov	[si+8],	eax

loc_544CD:
		mov	ax, si
		jmp	short loc_544D3
; ���������������������������������������������������������������������������

loc_544D1:				; CODE XREF: Expr_Node_AllocateTriple_543CA+EAj
		mov	ax, si

loc_544D3:				; CODE XREF: Expr_Node_AllocateTriple_543CA+105j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]

loc_544D9:				; CODE XREF: Expr_Node_AllocateTriple_543CA+D1j
		pop	si
		leave
		retf
Expr_Node_AllocateTriple_543CA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, orchestrateur appelant Expr_Node_CountSelectedInTable_54043 puis
; Expr_Node_TableOperationB_540B2 — appelée par Expr_Node_RecomputeAllFields_532EA.
; ==============================================================================================
Expr_Node_UpdateSelectionCounters_544DC	proc far		; CODE XREF: Scene_DetectAndActivateChange_532EA+3Bp
		push	bp
		mov	bp, sp
		push	cs
		call	near ptr Expr_Node_CountSelectedInTable_54043

loc_544E3:
		mov	word_706A3, ax
		mov	word_706A5, 0
		push	cs
		call	near ptr Expr_Node_TableOperationB_540B2

loc_544F0:
		mov	word_706A7, ax

loc_544F3:
		mov	word_706A9, 0

loc_544F9:
		mov	al, 0
		mov	byte_6E4BB, al

loc_544FE:
		mov	byte_6E4BA, al
		pop	bp
		retf
Expr_Node_UpdateSelectionCounters_544DC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 321 lignes, NON DÉTAILLÉE — combine dispatch vtable [bx+48h],
; Expr_Node_GetOrRecompute_53236, Expr_Node_ComputeAggregateField_54121, distance (sub_5828E).
; Référencée depuis sub_75746. Candidat pour session dédiée.
; ==============================================================================================
UIScreen_RenderOrLayoutList_54503	proc far		; CODE XREF: AITargeting_RenderThreatList_75746+12EP
					; UIScript_ParseAndEvaluate_7A054+9BP

var_60		= dword	ptr -60h
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_21		= byte ptr -21h
var_20		= word ptr -20h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp

loc_54504:
		mov	bp, sp
		sub	sp, 58h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, word_722E6
		or	di, di
		jnz	short loc_5451B
		mov	al, 0
		jmp	loc_547AD
; ���������������������������������������������������������������������������

loc_5451B:				; CODE XREF: UIScreen_RenderOrLayoutList_54503+11j
		mov	al, byte_6D559
		mov	ah, 0
		or	ax, ax
		jnz	short loc_54559
		push	large dword ptr	[di+5Ah]
		call	VROOMM_StubThunk_6C439
		add	sp, 4
		mov	[bp+var_21], al

loc_54533:
		cmp	[bp+var_21], 0

loc_54537:
		jz	short loc_54559
		sub	sp, 4

loc_5453C:
		mov	[bp+var_60], 500h
		push	ds
		push	offset aStayOnTarget ; "STAY ON	TARGET"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		mov	al, 0
		jmp	loc_547AD
; ���������������������������������������������������������������������������

loc_54559:				; CODE XREF: UIScreen_RenderOrLayoutList_54503+1Fj
					; UIScreen_RenderOrLayoutList_54503:loc_54537j
		mov	[bp+var_4], 1F400h
		mov	[bp+var_8], 485800h
		mov	[bp+var_C], 1F400h
		mov	bx, word_706A0
		mov	al, [bx+6Fh]
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
		mov	bx, word_706A0
		mov	ax, [bx+50h]
		mov	[bp+var_E], ax
		cmp	[bx+1Eh], cx
		jbe	short loc_545B8
		mov	dx, [bx+22h]
		mov	ax, [bx+20h]
		mov	bx, cx
		shl	bx, 4
		add	ax, bx
		jmp	short loc_545BC
; ���������������������������������������������������������������������������

loc_545B8:				; CODE XREF: UIScreen_RenderOrLayoutList_54503+A4j
		xor	dx, dx
		xor	ax, ax

loc_545BC:				; CODE XREF: UIScreen_RenderOrLayoutList_54503+B3j
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], ax
		mov	ax, word ptr [bp+var_12+2]
		mov	dx, word ptr [bp+var_12]
		add	dx, 4
		mov	word ptr [bp+var_16+2],	ax
		mov	word ptr [bp+var_16], dx
		les	dx, [bp+var_16]

loc_545D4:
		mov	bx, dx
		mov	eax, es:[bx]
		mov	[bp+var_40], eax

loc_545DE:
		mov	eax, es:[bx+4]

loc_545E3:
		mov	[bp+var_3C], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_38], eax

loc_545F0:
		les	bx, [bp+var_12]
		mov	eax, es:[bx]
		mov	[bp+var_1A], eax
		cmp	[bp+var_1A], 0
		jz	short loc_54648
		mov	ax, word ptr [bp+var_1A+2]
		mov	dx, word ptr [bp+var_1A]
		add	dx, 22h	; '"'
		mov	word ptr [bp+var_1E+2],	ax
		mov	word ptr [bp+var_1E], dx
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

loc_54648:				; CODE XREF: UIScreen_RenderOrLayoutList_54503+FDj
		lea	ax, [bp+var_40]
		push	ax
		mov	ax, word_706A0
		add	ax, 3Ah	; ':'
		push	ax
		push	cs
		call	near ptr Scene_FindMatchingByAreaContainment_53236
		add	sp, 4
		mov	[bp+var_20], ax
		mov	word ptr [bp-22h], 1
		sub	sp, 4
		mov	eax, [bp+var_8]
		mov	[bp+var_60], eax
		lea	ax, [bp+var_34]
		push	ax
		push	word ptr [bp-22h]
		push	0FFh
		push	si
		push	cs
		call	near ptr Expr_Node_ComputeAggregateField_54121
		add	sp, 0Ch
		or	ax, ax
		jz	short loc_546A3
		sub	sp, 4
		mov	[bp+var_60], 500h
		push	ds
		push	offset aEnemiesNear ; "ENEMIES NEAR"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		mov	al, 0
		jmp	loc_547AD
; ���������������������������������������������������������������������������

loc_546A3:				; CODE XREF: UIScreen_RenderOrLayoutList_54503+17Ej
		push	word ptr [di+51h]
		mov	bx, [di+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		add	ax, 6Dh	; 'm'
		mov	si, ax
		cmp	dword ptr [si],	0
		jg	short loc_546BF
		mov	ax, 1
		jmp	short loc_546C1
; ���������������������������������������������������������������������������

loc_546BF:				; CODE XREF: UIScreen_RenderOrLayoutList_54503+1B5j
		xor	ax, ax

loc_546C1:				; CODE XREF: UIScreen_RenderOrLayoutList_54503+1BAj
		or	al, al
		jz	short loc_546E5
		sub	sp, 4
		mov	[bp+var_60], 500h
		push	ds
		push	offset aOutOfFuel ; "OUT OF FUEL"

loc_546D4:
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		mov	al, 0
		jmp	loc_547AD
; ���������������������������������������������������������������������������

loc_546E5:				; CODE XREF: UIScreen_RenderOrLayoutList_54503+1C0j
		push	word ptr [di+51h]
		mov	bx, [di+51h]
		mov	bx, [bx]

loc_546ED:
		call	dword ptr [bx+48h]
		pop	cx

loc_546F1:
		push	ax

loc_546F2:
		call	Physics_TestGlobalWindActive
		pop	cx

loc_546F8:
		or	al, al
		jz	short loc_54725
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax

loc_54703:
		jnz	short loc_54725
		sub	sp, 4
		mov	[bp+var_60], 500h
		push	ds
		push	offset aEngineOut ; "ENGINE OUT"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		mov	al, 0
		jmp	loc_547AD
; ���������������������������������������������������������������������������

loc_54725:				; CODE XREF: UIScreen_RenderOrLayoutList_54503+1F7j
					; UIScreen_RenderOrLayoutList_54503:loc_54703j
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_547AB
		mov	ax, [bp+var_E]
		cmp	ax, [bp+var_20]
		jnz	short loc_547AB
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
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_28], eax
		mov	[bp-24h], eax
		cmp	eax, [bp+var_4]
		jge	short loc_547AB
		sub	sp, 4
		mov	[bp+var_60], 500h
		push	ds
		push	offset aAlreadyNear ; "ALREADY NEAR"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		mov	al, 0
		jmp	short loc_547AD
; ���������������������������������������������������������������������������

loc_547AB:				; CODE XREF: UIScreen_RenderOrLayoutList_54503+229j
					; UIScreen_RenderOrLayoutList_54503+231j ...
		mov	al, 1

loc_547AD:				; CODE XREF: UIScreen_RenderOrLayoutList_54503+15j
					; UIScreen_RenderOrLayoutList_54503+53j ...
		pop	di
		pop	si
		leave
		retf
UIScreen_RenderOrLayoutList_54503	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée DIRECTEMENT par HUD_RenderSymbologyMain (sub_3E744) — confirme l'usage du
; système GeomNode/Expr par le rendu HUD pour positionner des éléments de symbologie.
; ==============================================================================================
HUD_ResolveNodePosition_547B1	proc far		; CODE XREF: HUD_RenderSymbologyMain+165P
					; HUD_RenderSymbologyMain+68CP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		cmp	eax, dword_70718

loc_547C0:
		jnz	short loc_547D2

loc_547C2:
		mov	eax, [si+4]

loc_547C6:
		cmp	eax, dword_7071C
		jnz	short loc_547D2
		mov	ax, 1
		jmp	short loc_547D4
; ���������������������������������������������������������������������������

loc_547D2:				; CODE XREF: HUD_ResolveNodePosition_547B1:loc_547C0j
					; HUD_ResolveNodePosition_547B1+1Aj
		xor	ax, ax

loc_547D4:				; CODE XREF: HUD_ResolveNodePosition_547B1+1Fj
		or	al, al
		jz	short loc_547DC
		mov	al, 1
		jmp	short loc_547DE
; ���������������������������������������������������������������������������

loc_547DC:				; CODE XREF: HUD_ResolveNodePosition_547B1+25j
		mov	al, 0

loc_547DE:				; CODE XREF: HUD_ResolveNodePosition_547B1+29j
		pop	si
		pop	bp

locret_547E0:
		retf
HUD_ResolveNodePosition_547B1	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339), remet à zéro dword_706AB — probable reset du
; sous-système au chargement/changement de contexte.
; ==============================================================================================
GeomNode_ResetGlobalCounter_547E1:				; DATA XREF: seg339:off_71F0Eo
		push	bp
		mov	bp, sp

loc_547E4:
		mov	dword_706AB, 0
		pop	bp
		retf
seg114		ends
