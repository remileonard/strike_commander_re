seg029		segment	byte public 'CODE' use16
		assume cs:seg029
		;org 0Dh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,43L — avance un pointeur de flux de 2 octets tant que le caractère est un séparateur
; (0xABh ou tab 9), s'arrête sur nul : skip des séparateurs dans le lexer du format script IA
; (PROF/_AI_).
; ==============================================================================================
Lexer_SkipSeparators	proc far		; CODE XREF: Lexer_CountTokensAndFormat+37p
					; Lexer_CountTokensAndFormat+ADp

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_1C8F0:
		cmp	[bp+arg_0], 0
		jz	short loc_1C926

loc_1C8F7:				; CODE XREF: Lexer_SkipSeparators+26j
		add	word ptr [bp+arg_0], 2
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx], 0ABh ; '�'
		jz	short loc_1C90A
		cmp	byte ptr es:[bx], 9
		jnz	short loc_1C90F

loc_1C90A:				; CODE XREF: Lexer_SkipSeparators+15j
		mov	ax, 1
		jmp	short loc_1C911
; ���������������������������������������������������������������������������

loc_1C90F:				; CODE XREF: Lexer_SkipSeparators+1Bj
		xor	ax, ax

loc_1C911:				; CODE XREF: Lexer_SkipSeparators+20j
		or	al, al
		jnz	short loc_1C8F7
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_1C926
		mov	[bp+arg_0], 0

loc_1C926:				; CODE XREF: Lexer_SkipSeparators+8j
					; Lexer_SkipSeparators+2Fj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
Lexer_SkipSeparators	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,56L — si le token courant est de type 0xA5/0xA6 (constante numérique), résout sa valeur
; via une table indexée (word_706A0+0x1E/0x20/0x22, pas de 16 octets/entrée) : résolution de
; la valeur d'une constante numérique du lexer script IA.
; ==============================================================================================
Lexer_ResolveConstant	proc far		; CODE XREF: Parser_FindDuplicateSymbol+26p

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	ax, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	bx, ax
		les	bx, [bx]
		cmp	byte ptr es:[bx], 0A5h ; '�'
		jz	short loc_1C953
		mov	bx, ax
		mov	bx, [bx]
		cmp	byte ptr es:[bx], 0A6h ; '�'
		jnz	short loc_1C98C

loc_1C953:				; CODE XREF: Lexer_ResolveConstant+19j
		mov	bx, ax
		les	bx, [bx]
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	cx, ax
		mov	bx, word_706A0
		cmp	[bx+1Eh], cx
		jbe	short loc_1C977
		mov	dx, [bx+22h]
		mov	ax, [bx+20h]
		mov	bx, cx
		shl	bx, 4
		add	ax, bx
		jmp	short loc_1C97B
; ���������������������������������������������������������������������������

loc_1C977:				; CODE XREF: Lexer_ResolveConstant+38j
		xor	dx, dx
		xor	ax, ax

loc_1C97B:				; CODE XREF: Lexer_ResolveConstant+47j
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax

loc_1C98C:				; CODE XREF: Lexer_ResolveConstant+23j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave

locret_1C993:
		retf
Lexer_ResolveConstant	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,102L — compte les tokens d'un flux (boucle sur sub_1C8ED), utilise le moteur printf
; (sub_1069) avec format 0x50000 pour produire une chaîne, message d'erreur 0x700D si échec
; d'allocation : comptage de tokens + génération de message d'erreur formaté (parseur script
; IA).
; ==============================================================================================
Lexer_CountTokensAndFormat	proc far		; CODE XREF: MissionScenario_LoadMainRecord_A8331+6E3P

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+4],	ax
		mov	[si+2],	ax
		mov	bx, [bp+arg_2]
		les	bx, [bx+54h]
		mov	ax, es:[bx+50h]
		mov	dx, es:[bx+4Eh]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax

loc_1C9C3:				; CODE XREF: Lexer_CountTokensAndFormat+48j
		inc	word ptr [si+2]
		push	large [bp+var_8]
		push	cs
		call	near ptr Lexer_SkipSeparators
		add	sp, 4

loc_1C9D1:
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax

loc_1C9D7:
		cmp	[bp+var_8], 0
		jnz	short loc_1C9C3
		push	seg seg029
		push	offset loc_1CF05
		push	1
		push	word ptr [si+2]
		push	large 50000h

loc_1C9EF:
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si], ax
		cmp	word ptr [si], 0
		jnz	short loc_1CA07
		push	700Dh

loc_1CA01:
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_1CA07:				; CODE XREF: Lexer_CountTokensAndFormat+68j
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		xor	di, di
		jmp	short loc_1CA4E
; ���������������������������������������������������������������������������

loc_1CA13:				; CODE XREF: Lexer_CountTokensAndFormat+BDj
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	ax, di
		imul	ax, 5
		mov	bx, [si]
		add	bx, ax
		mov	ax, word ptr [bp+var_C+2]
		mov	dx, word ptr [bp+var_C]
		mov	[bx+2],	ax
		mov	[bx], dx
		mov	ax, di
		imul	ax, 5
		mov	bx, [si]
		add	bx, ax
		mov	byte ptr [bx+4], 0
		push	large [bp+var_8]
		push	cs
		call	near ptr Lexer_SkipSeparators
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		inc	di

loc_1CA4E:				; CODE XREF: Lexer_CountTokensAndFormat+7Dj
		cmp	[si+2],	di
		jg	short loc_1CA13
		push	si
		nop
		push	cs
		call	near ptr Lexer_NextToken
		pop	cx
		pop	di
		pop	si
		leave
		retf
Lexer_CountTokensAndFormat	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,121L — avance au token suivant dans un flux de records de 5 octets, remplit les champs
; type (+6) et valeur (+7), détecte les séparateurs 0xAB : fonction 'next token' du lexer
; script IA/mission (format PROF/_AI_).
; ==============================================================================================
Lexer_NextToken	proc far		; CODE XREF: Lexer_CountTokensAndFormat+C2p
					; Lexer_Advance+25p ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jnz	short loc_1CA70
		jmp	loc_1CB21
; ���������������������������������������������������������������������������

loc_1CA70:				; CODE XREF: Lexer_NextToken+Dj
		mov	ax, [si+4]
		imul	ax, 5
		mov	cx, [si]
		add	cx, ax
		mov	bx, cx
		les	bx, [bx]
		mov	al, es:[bx]
		mov	[si+6],	al

loc_1CA84:
		mov	bx, cx
		mov	bx, [bx]
		mov	al, es:[bx+1]
		mov	[si+7],	al
		mov	[bp+var_2], 0FFFFh
		mov	dx, 1
		mov	bx, cx
		mov	bx, [bx]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		cmp	byte ptr es:[bx], 0ABh ; '�'
		jnz	short loc_1CAAA
		inc	dx
		jmp	short $+2

loc_1CAAA:				; CODE XREF: Lexer_NextToken+47j
		mov	bx, cx
		les	bx, [bx]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		cmp	byte ptr es:[bx], 9
		jnz	short loc_1CACF
		mov	bx, cx
		mov	bx, [bx]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	[bp+var_2], ax
		jmp	short $+2

loc_1CACF:				; CODE XREF: Lexer_NextToken+5Aj
		mov	al, byte ptr [bp+var_2]
		mov	ah, 0
		mov	[si+0Ah], ax
		mov	[bp+var_4], 0FFFFh
		mov	dx, 1
		mov	bx, cx
		les	bx, [bx]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		cmp	byte ptr es:[bx], 9
		jnz	short loc_1CAF2
		inc	dx
		jmp	short $+2

loc_1CAF2:				; CODE XREF: Lexer_NextToken+8Fj
		mov	bx, cx

loc_1CAF4:
		les	bx, [bx]

loc_1CAF6:
		mov	ax, dx

loc_1CAF8:
		shl	ax, 1
		add	bx, ax

loc_1CAFC:
		cmp	byte ptr es:[bx], 0ABh ; '�'
		jnz	short loc_1CB17

loc_1CB02:
		mov	bx, cx
		mov	bx, [bx]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	[bp+var_4], ax
		jmp	short $+2

loc_1CB17:				; CODE XREF: Lexer_NextToken+A2j
		mov	al, byte ptr [bp+var_4]
		mov	ah, 0
		mov	[si+8],	ax
		jmp	short loc_1CB25
; ���������������������������������������������������������������������������

loc_1CB21:				; CODE XREF: Lexer_NextToken+Fj
		mov	byte ptr [si+6], 0

loc_1CB25:				; CODE XREF: Lexer_NextToken+C1j
		pop	si
		leave
		retf
Lexer_NextToken	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,32L — avance la position courante (+4) si < limite (+2) et appelle sub_1CA5E : avance
; d'un token dans le flux (consume/advance).
; ==============================================================================================
Lexer_Advance	proc far		; CODE XREF: Parser_ConsumeRemaining+21p
					; Lexer_AdvanceWrapper_7F69C+EP

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		cmp	word ptr [si], 0
		jz	short loc_1CB51
		mov	ax, [si+4]
		inc	ax
		cmp	ax, [si+2]
		jge	short loc_1CB51
		mov	[bp+var_1], 1
		inc	word ptr [si+4]
		push	si
		push	cs
		call	near ptr Lexer_NextToken
		pop	cx

loc_1CB51:				; CODE XREF: Lexer_Advance+11j
					; Lexer_Advance+1Aj
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Lexer_Advance	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,29L — recule la position courante (+4) si > 0 et appelle sub_1CA5E : retour arrière d'un
; token (unget/rewind), lexer script IA.
; ==============================================================================================
Lexer_Rewind	proc far		; CODE XREF: Lexer_RewindWrapper_7F6C5+EP

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		cmp	word ptr [si], 0
		jz	short loc_1CB7D
		cmp	word ptr [si+4], 0
		jle	short loc_1CB7D
		mov	[bp+var_1], 1
		dec	word ptr [si+4]
		push	si
		push	cs
		call	near ptr Lexer_NextToken
		pop	cx

loc_1CB7D:				; CODE XREF: Lexer_Rewind+11j
					; Lexer_Rewind+17j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Lexer_Rewind	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,47L — teste si le token courant est de type 0xA2 (mot-clé?), ou 0xA5/0xA6 (constante)
; suivi lui-même d'un token 0xA2 : prédicat de lookahead du parseur (reconnaissance de motif
; de token).
; ==============================================================================================
Parser_LookaheadPattern	proc far		; CODE XREF: Weapon_HUDBox_UpdateAndRender_5923A+96P
					; UIScript_ParseAndEvaluate_7A054+EBP

arg_0		= word ptr  6

		push	bp

loc_1CB84:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dl, 0
		cmp	word ptr [si], 0
		jz	short loc_1CBC6
		mov	al, [si+6]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 0A2h ; '�'
		jz	short loc_1CBC4
		cmp	bx, 0A5h ; '�'
		jz	short loc_1CBAA
		cmp	bx, 0A6h ; '�'
		jnz	short loc_1CBC6

loc_1CBAA:				; CODE XREF: Parser_LookaheadPattern+1Fj
		mov	cx, [si+4]
		inc	cx
		cmp	[si+2],	cx
		jle	short loc_1CBC6
		mov	ax, cx
		imul	ax, 5
		mov	bx, [si]
		add	bx, ax
		les	bx, [bx]
		cmp	byte ptr es:[bx], 0A2h ; '�'
		jnz	short loc_1CBC6

loc_1CBC4:				; CODE XREF: Parser_LookaheadPattern+19j
		mov	dl, 1

loc_1CBC6:				; CODE XREF: Parser_LookaheadPattern+Cj
					; Parser_LookaheadPattern+25j ...
		mov	al, dl
		pop	si
		pop	bp
		retf
Parser_LookaheadPattern	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,33L — parcourt les tokens en marquant chacun (byte à +4 mis à 1) via sub_1CB28 tant que
; non fin de flux : marquage/consommation de tous les tokens restants (fin de section du
; parseur).
; ==============================================================================================
Parser_ConsumeRemaining	proc far		; CODE XREF: Compiler_EmitByTokenType+1C6p
					; UIScript_ParseAndEvaluate_7A054+740P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_1CBD2:
		cmp	word ptr [si], 0
		jz	short loc_1CBF0
		mov	ax, [si+4]
		cmp	ax, [si+2]
		jge	short loc_1CBF0
		imul	ax, 5
		mov	bx, [si]

loc_1CBE4:
		add	bx, ax
		mov	byte ptr [bx+4], 1
		push	si
		push	cs
		call	near ptr Lexer_Advance
		pop	cx

loc_1CBF0:				; CODE XREF: Parser_ConsumeRemaining+Aj
					; Parser_ConsumeRemaining+12j
		pop	si
		pop	bp
		retf
Parser_ConsumeRemaining	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,239L — switch à 10 cas sur le type de token (0xA1-0xAA), chaque cas appelle sub_52D1D
; (émission de valeur/bytecode) selon le type ; message d'erreur 0x710D pour token invalide :
; cœur du compilateur du format script IA (PROF/_AI_) — émission de bytecode par type de
; token. Corrèle directement avec la hiérarchie de parsing PROF→_AI_→ATRB/MVRS/GOAL déjà
; documentée.
; ==============================================================================================
Compiler_EmitByTokenType	proc far		; CODE XREF: UIScreen_ConstructWidgetBinding_536F7+F4P

var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		mov	si, [bp+arg_0]
		mov	bx, word_706A0
		mov	eax, [bx+54h]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_1CC13
		jmp	loc_1CDBD
; ���������������������������������������������������������������������������

loc_1CC13:				; CODE XREF: Compiler_EmitByTokenType+1Bj
		mov	[bp+var_5], 0
		mov	al, [si+7]
		mov	ah, 0
		mov	cx, ax
		mov	al, [si+6]
		mov	ah, 0
		sub	ax, 0A1h ; '�'
		mov	bx, ax
		cmp	bx, 9		; switch 10 cases
		ja	short loc_1CC34	; default
		shl	bx, 1
		jmp	cs:off_1CDC0[bx] ; switch jump

loc_1CC34:				; CODE XREF: Compiler_EmitByTokenType+38j
					; DATA XREF: seg029:off_1CDC0o
		push	710Dh		; default
		call	VROOMM_StubThunk_6B70F
		pop	cx
		jmp	loc_1CDB1	; case 0x8
; ���������������������������������������������������������������������������

loc_1CC40:				; CODE XREF: Compiler_EmitByTokenType+3Cj
					; DATA XREF: seg029:off_1CDC0o
		push	large [bp+var_4] ; case	0x0
		call	Expr_Node_HasChildError_52D1D
		add	sp, 4
		jmp	loc_1CDAE
; ���������������������������������������������������������������������������

loc_1CC4F:				; CODE XREF: Compiler_EmitByTokenType+3Cj
					; DATA XREF: seg029:off_1CDC0o
		push	large [bp+var_4] ; case	0x1
		call	Expr_Node_HasChildError_52D1D
		add	sp, 4
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		jmp	loc_1CDAE
; ���������������������������������������������������������������������������

loc_1CC65:				; CODE XREF: Compiler_EmitByTokenType+3Cj
					; DATA XREF: seg029:off_1CDC0o
		push	cx		; case 0x4
		mov	ax, word_706A0
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_1A]
		push	ax
		call	Player_ResolveAttachPointN_5305A
		add	sp, 8
		push	large [bp+var_4]
		push	ss
		lea	ax, [bp+var_26]
		push	ax
		call	Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		mov	eax, [bp+var_1A]
		sub	[bp+var_26], eax
		mov	eax, [bp+var_16]
		sub	[bp+var_22], eax
		mov	eax, [bp+var_12]
		sub	[bp+var_1E], eax
		mov	[bp+var_1E], 0
		push	large [bp+var_1E]
		push	large [bp+var_22]
		push	large [bp+var_26]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		cmp	[bp+var_A], 6D600h

loc_1CCD3:
		jge	short loc_1CCDA
		mov	ax, 1

loc_1CCD8:
		jmp	short loc_1CCDC
; ���������������������������������������������������������������������������

loc_1CCDA:				; CODE XREF: Compiler_EmitByTokenType:loc_1CCD3j
		xor	ax, ax

loc_1CCDC:				; CODE XREF: Compiler_EmitByTokenType:loc_1CCD8j
		mov	[bp+var_5], al
		jmp	loc_1CDB1	; case 0x8
; ���������������������������������������������������������������������������

loc_1CCE2:				; CODE XREF: Compiler_EmitByTokenType+3Cj
					; DATA XREF: seg029:off_1CDC0o
		mov	bx, word_706A0	; case 0x5
		cmp	[bx+1Eh], cx
		jbe	short loc_1CCFA
		mov	dx, [bx+22h]
		mov	ax, [bx+20h]
		mov	bx, cx
		shl	bx, 4
		add	ax, bx
		jmp	short loc_1CCFE
; ���������������������������������������������������������������������������

loc_1CCFA:				; CODE XREF: Compiler_EmitByTokenType+F6j
		xor	dx, dx
		xor	ax, ax

loc_1CCFE:				; CODE XREF: Compiler_EmitByTokenType+105j
		mov	word ptr [bp+var_A+2], dx

loc_1CD01:
		mov	word ptr [bp+var_A], ax
		les	bx, [bp+var_A]
		mov	eax, es:[bx]
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 0
		jnz	short loc_1CD19
		jmp	loc_1CDB1	; case 0x8
; ���������������������������������������������������������������������������

loc_1CD19:				; CODE XREF: Compiler_EmitByTokenType+121j
		push	large [bp+var_4]
		push	ss
		lea	ax, [bp+var_1A]
		push	ax
		call	Expr_Node_StoreResultVector_52C9C
		add	sp, 8
		lea	ax, [bp+var_1A]
		push	ax
		push	large [bp+var_E]
		les	bx, [bp+var_E]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		jmp	short loc_1CDAE
; ���������������������������������������������������������������������������

loc_1CD40:				; CODE XREF: Compiler_EmitByTokenType+3Cj
					; DATA XREF: seg029:off_1CDC0o
		push	cx		; case 0x6
		mov	ax, word_706A0
		add	ax, 34h	; '4'
		push	ax
		call	Expr_LookupNamedValue_52DDB
		add	sp, 4
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jz	short loc_1CDB1	; case 0x8
		les	bx, [bp+var_A]
		jmp	short loc_1CDA4
; ���������������������������������������������������������������������������

loc_1CD62:				; CODE XREF: Compiler_EmitByTokenType+3Cj
					; DATA XREF: seg029:off_1CDC0o
		push	cx		; case 0x7
		mov	ax, word_706A0
		add	ax, 34h	; '4'
		push	ax
		call	Expr_LookupNamedValue_52DDB
		add	sp, 4
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jz	short loc_1CDB1	; case 0x8
		les	bx, [bp+var_A]
		jmp	short loc_1CDA4
; ���������������������������������������������������������������������������

loc_1CD84:				; CODE XREF: Compiler_EmitByTokenType+3Cj
					; DATA XREF: seg029:off_1CDC0o
		push	cx		; case 0x9
		mov	ax, word_706A0
		add	ax, 34h	; '4'
		push	ax
		call	Expr_LookupNamedValue_52DDB
		add	sp, 4
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jz	short loc_1CDB1	; case 0x8
		les	bx, [bp+var_A]

loc_1CDA4:				; CODE XREF: Compiler_EmitByTokenType+16Dj
					; Compiler_EmitByTokenType+18Fj
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh

loc_1CDAE:				; CODE XREF: Compiler_EmitByTokenType+59j
					; Compiler_EmitByTokenType+6Fj ...
		mov	[bp+var_5], al

loc_1CDB1:				; CODE XREF: Compiler_EmitByTokenType+3Cj
					; Compiler_EmitByTokenType+4Aj ...
		cmp	[bp+var_5], 0	; case 0x8
		jz	short loc_1CDBD
		push	si
		push	cs
		call	near ptr Parser_ConsumeRemaining
		pop	cx

loc_1CDBD:				; CODE XREF: Compiler_EmitByTokenType+1Dj
					; Compiler_EmitByTokenType+1C2j
		pop	si
		leave
		retf
Compiler_EmitByTokenType	endp

; ���������������������������������������������������������������������������
off_1CDC0	dw offset loc_1CC40	; DATA XREF: Compiler_EmitByTokenType+3Cr
		dw offset loc_1CC4F	; jump table for switch	statement
		dw offset loc_1CC34
		dw offset loc_1CC34
		dw offset loc_1CC65
		dw offset loc_1CCE2
		dw offset loc_1CD40
		dw offset loc_1CD62
		dw offset loc_1CDB1
		dw offset loc_1CD84

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,43L — si le token est de type 0xA7 (identifiant), résout le symbole via une table de
; noms (sub_52DDB, word_706A0+0x34) et retourne un champ associé (+0x52) : résolution de
; symbole nommé (table de symboles) du parseur script IA.
; ==============================================================================================
Lexer_ResolveSymbol	proc far		; CODE XREF: Radio_SelectContextMessage+16DP

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	al, [si+6]
		mov	ah, 0
		cmp	ax, 0A7h ; '�'
		jnz	short loc_1CE17
		mov	al, [si+7]
		mov	ah, 0
		mov	[bp+var_2], ax
		push	ax

loc_1CDF4:
		mov	ax, word_706A0
		add	ax, 34h	; '4'
		push	ax
		call	Expr_LookupNamedValue_52DDB
		add	sp, 4
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_1CE17
		les	bx, [bp+var_6]
		mov	di, es:[bx+52h]

loc_1CE17:				; CODE XREF: Lexer_ResolveSymbol+15j
					; Lexer_ResolveSymbol+3Aj
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
Lexer_ResolveSymbol	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,74L — variante de sub_1C92E (résolution de constante numérique via table
; +0x1E/0x20/0x22) : helper de résolution de constante, utilisé aussi par le moteur audio 3D
; (seg022) et l'UI.
; ==============================================================================================
Lexer_ResolveConstantAlt	proc far		; CODE XREF: Audio3D_ComputePan+67P
					; seg024:048CP	...

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	cl, 0
		mov	al, [si+6]
		mov	ah, 0
		cmp	ax, 0A5h ; '�'
		jz	short loc_1CE41
		mov	al, [si+6]
		mov	ah, 0
		cmp	ax, 0A6h ; '�'
		jnz	short loc_1CE99

loc_1CE41:				; CODE XREF: Lexer_ResolveConstantAlt+18j
		mov	al, [si+7]
		mov	ah, 0
		mov	si, ax
		mov	bx, word_706A0
		cmp	[bx+1Eh], si
		jbe	short loc_1CE60
		mov	dx, [bx+22h]
		mov	ax, [bx+20h]
		mov	bx, si
		shl	bx, 4
		add	ax, bx
		jmp	short loc_1CE64
; ���������������������������������������������������������������������������

loc_1CE60:				; CODE XREF: Lexer_ResolveConstantAlt+32j
		xor	dx, dx
		xor	ax, ax

loc_1CE64:				; CODE XREF: Lexer_ResolveConstantAlt+41j
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_1CE99
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	GeomNode_SumOffsetsUpChain_50EEB
		add	sp, 8
		mov	eax, [bp+var_10]
		mov	[di], eax
		mov	eax, [bp+var_C]
		mov	[di+4],	eax
		mov	eax, [bp+var_8]
		mov	[di+8],	eax
		mov	cl, 1

loc_1CE99:				; CODE XREF: Lexer_ResolveConstantAlt+22j
					; Lexer_ResolveConstantAlt+52j
		mov	al, cl
		pop	di
		pop	si
		leave
		retf
Lexer_ResolveConstantAlt	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,70L — parcourt une liste chaînée de tokens (sub_1C92E) cherchant une valeur
; correspondant à arg_2 : recherche de doublon/valeur existante dans une liste de symboles
; (détection de redéfinition).
; ==============================================================================================
Parser_FindDuplicateSymbol	proc far		; CODE XREF: Render_DrawComplexShape_7EDCA+68DP

var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		cmp	[bp+arg_2], 0
		jz	short loc_1CEFE
		cmp	word ptr [si], 0
		jz	short loc_1CEFE
		mov	di, [si]
		mov	[bp+var_4], 0
		jmp	short loc_1CEF6
; ���������������������������������������������������������������������������

loc_1CEC3:				; CODE XREF: Parser_FindDuplicateSymbol+5Dj
		push	di
		push	cs
		call	near ptr Lexer_ResolveConstant
		pop	cx
		cmp	dx, word ptr [bp+arg_2+2]
		jnz	short loc_1CEF0
		cmp	ax, word ptr [bp+arg_2]
		jnz	short loc_1CEF0
		cmp	[bp+var_1], 0
		jz	short loc_1CEE6
		mov	al, [di+4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1CEE6
		mov	al, 0
		jmp	short loc_1CF01
; ���������������������������������������������������������������������������

loc_1CEE6:				; CODE XREF: Parser_FindDuplicateSymbol+38j
					; Parser_FindDuplicateSymbol+41j
		cmp	byte ptr [di+4], 0
		jz	short loc_1CEF0
		mov	[bp+var_1], 1

loc_1CEF0:				; CODE XREF: Parser_FindDuplicateSymbol+2Dj
					; Parser_FindDuplicateSymbol+32j ...
		inc	[bp+var_4]

loc_1CEF3:
		add	di, 5

loc_1CEF6:				; CODE XREF: Parser_FindDuplicateSymbol+22j
		mov	ax, [si+2]
		cmp	ax, [bp+var_4]
		jg	short loc_1CEC3

loc_1CEFE:				; CODE XREF: Parser_FindDuplicateSymbol+14j
					; Parser_FindDuplicateSymbol+19j
		mov	al, [bp+var_1]

loc_1CF01:				; CODE XREF: Parser_FindDuplicateSymbol+45j
		pop	di
		pop	si
		leave
		retf
Parser_FindDuplicateSymbol	endp

; ���������������������������������������������������������������������������

loc_1CF05:				; DATA XREF: Lexer_CountTokensAndFormat+4Do
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		or	dx, dx
		jnz	short loc_1CF1B

loc_1CF0F:
		push	5
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax

loc_1CF1B:				; CODE XREF: seg029:062Dj
		mov	ax, dx
		pop	bp
		retf
seg029		ends
