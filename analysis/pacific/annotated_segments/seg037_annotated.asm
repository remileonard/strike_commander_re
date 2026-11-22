seg037		segment	para public 'CODE' use16
		assume cs:seg037
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 8Bh, 0ECh, 56h, 8Bh, 76h, 6, 80h, 7Ch, 20h, 0, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Lexer_SkipSeparators (sub_1C8ED de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,43L — avance un
; pointeur de flux de 2 octets tant que le caractère est un séparateur (0xABh ou tab 9),
; s'arrête sur nul : skip des séparateurs dans le lexer du format script IA (PROF/_AI_).
; ==============================================================================================
Lexer_SkipSeparators		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jz	short loc_1A9A6

loc_1A977:
		add	word ptr [bp+arg_0], 2
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx], 0ABh
		jz	short loc_1A98A
		cmp	byte ptr es:[bx], 9
		jnz	short loc_1A98F

loc_1A98A:
		mov	ax, 1
		jmp	short loc_1A991

loc_1A98F:
		xor	ax, ax

loc_1A991:
		or	al, al
		jnz	short loc_1A977
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_1A9A6
		mov	[bp+arg_0], 0

loc_1A9A6:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
Lexer_SkipSeparators		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1A9AE		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	ax, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	bx, ax
		les	bx, [bx]
		cmp	byte ptr es:[bx], 0A5h
		jz	short loc_1A9D3
		mov	bx, ax
		mov	bx, [bx]
		cmp	byte ptr es:[bx], 0A6h
		jnz	short loc_1AA0C

loc_1A9D3:
		mov	bx, ax
		les	bx, [bx]
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	cx, ax
		mov	bx, word_79B8C
		cmp	[bx+1Eh], cx
		jbe	short loc_1A9F7
		mov	dx, [bx+22h]
		mov	ax, [bx+20h]
		mov	bx, cx
		shl	bx, 4
		add	ax, bx
		jmp	short loc_1A9FB

loc_1A9F7:
		xor	dx, dx
		xor	ax, ax

loc_1A9FB:
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax

loc_1AA0C:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_1A9AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Lexer_CountTokensAndFormat (sub_1C994 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,102L — compte
; les tokens d'un flux (boucle sur sub_1C8ED), utilise le moteur printf (sub_1069) avec format
; 0x50000 pour produire une chaîne, message d'erreur 0x700D si échec d'allocation : comptage
; de tokens + génération de message d'erreur formaté (parseur script IA).
; ==============================================================================================
Lexer_CountTokensAndFormat		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+4], ax
		mov	[si+2], ax
		mov	bx, [bp+arg_2]
		les	bx, [bx+65h]
		mov	ax, es:[bx+54h]
		mov	dx, es:[bx+52h]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax

loc_1AA43:
		inc	word ptr [si+2]
		push	large [bp+var_8]
		push	cs
		call	near ptr Lexer_SkipSeparators
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_1AA43
		push	seg seg037
		push	offset sub_1AFBD
		push	1
		push	word ptr [si+2]
		push	large 50000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si], ax
		cmp	word ptr [si], 0
		jnz	short loc_1AA87
		push	700Dh
		call	sub_1DDFE
		pop	cx

loc_1AA87:
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		xor	di, di
		jmp	short loc_1AACE

loc_1AA93:
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	ax, di
		imul	ax, ax, 5
		mov	bx, [si]
		add	bx, ax
		mov	ax, word ptr [bp+var_C+2]
		mov	dx, word ptr [bp+var_C]
		mov	[bx+2], ax
		mov	[bx], dx
		mov	ax, di
		imul	ax, ax, 5
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

loc_1AACE:
		cmp	[si+2], di
		jg	short loc_1AA93
		push	si
		nop
		push	cs
		call	near ptr Lexer_NextToken
		pop	cx
		pop	di
		pop	si
		leave
		retf
Lexer_CountTokensAndFormat		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Lexer_NextToken (sub_1CA5E de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,121L — avance au token
; suivant dans un flux de records de 5 octets, remplit les champs type (+6) et valeur (+7),
; détecte les séparateurs 0xAB : fonction 'next token' du lexer script IA/mission (format
; PROF/_AI_).
; ==============================================================================================
Lexer_NextToken		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jnz	short loc_1AAF0
		jmp	loc_1ABA1

loc_1AAF0:
		mov	ax, [si+4]
		imul	ax, ax, 5
		mov	cx, [si]
		add	cx, ax
		mov	bx, cx
		les	bx, [bx]
		mov	al, es:[bx]
		mov	[si+6], al
		mov	bx, cx
		mov	bx, [bx]
		mov	al, es:[bx+1]
		mov	[si+7], al
		mov	[bp+var_2], 0FFFFh
		mov	dx, 1
		mov	bx, cx
		mov	bx, [bx]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		cmp	byte ptr es:[bx], 0ABh
		jnz	short loc_1AB2A
		inc	dx
		jmp	short loc_1AB2A

loc_1AB2A:
		mov	bx, cx
		les	bx, [bx]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		cmp	byte ptr es:[bx], 9
		jnz	short loc_1AB4F
		mov	bx, cx
		mov	bx, [bx]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	[bp+var_2], ax
		jmp	short loc_1AB4F

loc_1AB4F:
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
		jnz	short loc_1AB72
		inc	dx
		jmp	short loc_1AB72

loc_1AB72:
		mov	bx, cx
		les	bx, [bx]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		cmp	byte ptr es:[bx], 0ABh
		jnz	short loc_1AB97
		mov	bx, cx
		mov	bx, [bx]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	[bp+var_4], ax
		jmp	short loc_1AB97

loc_1AB97:
		mov	al, byte ptr [bp+var_4]
		mov	ah, 0
		mov	[si+8], ax
		jmp	short loc_1ABA5

loc_1ABA1:
		mov	byte ptr [si+6], 0

loc_1ABA5:
		pop	si
		leave
		retf
Lexer_NextToken		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Lexer_Advance
; (sub_1CB28 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,32L — avance la position courante (+4) si < limite (+2) et appelle sub_1CA5E :
; avance d'un token dans le flux (consume/advance).
; ==============================================================================================
Lexer_Advance		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		cmp	word ptr [si], 0
		jz	short loc_1ABD1
		mov	ax, [si+4]
		inc	ax
		cmp	ax, [si+2]
		jge	short loc_1ABD1
		mov	[bp+var_1], 1
		inc	word ptr [si+4]
		push	si
		push	cs
		call	near ptr Lexer_NextToken
		pop	cx

loc_1ABD1:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Lexer_Advance		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Lexer_Rewind (sub_1CB57
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; far,29L — recule la position courante (+4) si > 0 et appelle sub_1CA5E : retour arrière d'un
; token (unget/rewind), lexer script IA.
; ==============================================================================================
Lexer_Rewind		proc far

var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		cmp	word ptr [si], 0
		jz	short loc_1ABFD
		cmp	word ptr [si+4], 0
		jle	short loc_1ABFD
		mov	[bp+var_1], 1
		dec	word ptr [si+4]
		push	si
		push	cs
		call	near ptr Lexer_NextToken
		pop	cx

loc_1ABFD:
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
Lexer_Rewind		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1AC03		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	cl, 0
		cmp	word ptr [si], 0
		jz	short loc_1AC5D
		mov	al, [si+6]
		mov	ah, 0
		mov	dx, ax
		cmp	dx, 0A2h
		jz	short loc_1AC5B
		cmp	dx, 0C1h
		jz	short loc_1AC5B
		cmp	dx, 0A5h
		jz	short loc_1AC30
		cmp	dx, 0A6h
		jnz	short loc_1AC5D

loc_1AC30:
		mov	dx, [si+4]
		inc	dx
		cmp	[si+2], dx
		jle	short loc_1AC5D
		mov	ax, dx
		imul	ax, ax, 5
		mov	bx, [si]
		add	bx, ax
		les	bx, [bx]
		cmp	byte ptr es:[bx], 0A2h
		jz	short loc_1AC5B
		mov	ax, dx
		imul	ax, ax, 5
		mov	bx, [si]
		add	bx, ax
		mov	bx, [bx]
		cmp	byte ptr es:[bx], 0C1h
		jnz	short loc_1AC5D

loc_1AC5B:
		mov	cl, 1

loc_1AC5D:
		mov	al, cl
		pop	si
		pop	bp
		retf
sub_1AC03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Parser_ConsumeRemaining (sub_1CBCB de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,33L — parcourt
; les tokens en marquant chacun (byte à +4 mis à 1) via sub_1CB28 tant que non fin de flux :
; marquage/consommation de tous les tokens restants (fin de section du parseur).
; ==============================================================================================
Parser_ConsumeRemaining		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_1AC87
		mov	ax, [si+4]
		cmp	ax, [si+2]
		jge	short loc_1AC87
		imul	ax, ax, 5
		mov	bx, [si]
		add	bx, ax
		mov	byte ptr [bx+4], 1
		push	si
		push	cs
		call	near ptr Lexer_Advance
		pop	cx

loc_1AC87:
		pop	si
		pop	bp
		retf
Parser_ConsumeRemaining		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1AC8A		proc far

var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, word_79B8C
		mov	eax, [bx+65h]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_1ACAB
		jmp	loc_1AE60

loc_1ACAB:
		mov	[bp+var_5], 0
		mov	al, [si+7]
		mov	ah, 0
		mov	di, ax
		mov	al, [si+6]
		mov	ah, 0
		mov	[bp+var_8], ax
		mov	cx, 0Ah
		mov	bx, offset word_1AE64

loc_1ACC4:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_8]
		jz	short loc_1ACD3
		add	bx, 2
		loop	short loc_1ACC4
		jmp	short loc_1ACD7

loc_1ACD3:
		jmp	word ptr cs:[bx+14h] ; switch jump

loc_1ACD7:
		push	710Dh
		call	sub_1DDFE
		pop	cx
		jmp	loc_1AE54

loc_1ACE3:
		push	large [bp+var_4]
		call	Expr_Node_HasChildError_5457C
		add	sp, 4
		jmp	loc_1AE51

loc_1ACF2:
		push	large [bp+var_4]
		call	Expr_Node_HasChildError_5457C
		add	sp, 4
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		jmp	loc_1AE51

loc_1AD08:
		push	di
		mov	ax, word_79B8C
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	Mission_GetSpotWorldPosition_5493F
		add	sp, 8
		push	large [bp+var_4]
		push	ss
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	sub_544F5
		add	sp, 8
		mov	eax, [bp+var_1C]
		sub	[bp+var_28], eax
		mov	eax, [bp+var_18]
		sub	[bp+var_24], eax
		mov	eax, [bp+var_14]
		sub	[bp+var_20], eax
		mov	[bp+var_20], 0
		push	large [bp+var_20]
		push	large [bp+var_24]
		push	large [bp+var_28]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 6D600h
		jge	short loc_1AD7D
		mov	ax, 1
		jmp	short loc_1AD7F

loc_1AD7D:
		xor	ax, ax

loc_1AD7F:
		mov	[bp+var_5], al
		jmp	loc_1AE54

loc_1AD85:
		mov	bx, word_79B8C
		cmp	[bx+1Eh], di
		jbe	short loc_1AD9D
		mov	dx, [bx+22h]
		mov	ax, [bx+20h]
		mov	bx, di
		shl	bx, 4
		add	ax, bx
		jmp	short loc_1ADA1

loc_1AD9D:
		xor	dx, dx
		xor	ax, ax

loc_1ADA1:
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		les	bx, word ptr [bp+var_C]
		mov	eax, es:[bx]
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 0
		jnz	short loc_1ADBC
		jmp	loc_1AE54

loc_1ADBC:
		push	large [bp+var_4]
		push	ss
		lea	ax, word ptr [bp+var_1C]
		push	ax
		call	sub_544F5
		add	sp, 8
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	large [bp+var_10]
		les	bx, word ptr [bp+var_10]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		jmp	short loc_1AE51

loc_1ADE3:
		push	di
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		call	Expr_LookupNamedValue_546A8
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_1AE54
		les	bx, word ptr [bp+var_C]
		jmp	short loc_1AE47

loc_1AE05:
		push	di
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		call	Expr_LookupNamedValue_546A8
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_1AE54
		les	bx, word ptr [bp+var_C]
		jmp	short loc_1AE47

loc_1AE27:
		push	di
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		call	Expr_LookupNamedValue_546A8
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_1AE54
		les	bx, word ptr [bp+var_C]

loc_1AE47:
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh

loc_1AE51:
		mov	[bp+var_5], al

loc_1AE54:
		cmp	[bp+var_5], 0
		jz	short loc_1AE60
		push	si
		push	cs
		call	near ptr Parser_ConsumeRemaining
		pop	cx

loc_1AE60:
		pop	di
		pop	si
		leave
		retf
sub_1AC8A		endp

; START OF FUNCTION CHUNK FOR sub_1AC8A
word_1AE64	dw 0A1h
		dw 0A2h
		dw 0A5h
		dw 0A6h
		dw 0A7h
		dw 0A8h
		dw 0A9h
		dw 0AAh
		dw 0ADh
		dw 0C1h
off_1AE78	dw offset loc_1ACE3
		dw offset loc_1ACF2
		dw offset loc_1AD08
		dw offset loc_1AD85
		dw offset loc_1ADE3
		dw offset loc_1AE05
		dw offset loc_1AE54
		dw offset loc_1AE27
		dw offset loc_1ADE3
		dw offset loc_1ACF2
; END OF FUNCTION CHUNK FOR sub_1AC8A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Lexer_ResolveSymbol (sub_1CDD4 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,43L — si le token est
; de type 0xA7 (identifiant), résout le symbole via une table de noms (sub_52DDB,
; word_706A0+0x34) et retourne un champ associé (+0x52) : résolution de symbole nommé (table
; de symboles) du parseur script IA.
; ==============================================================================================
Lexer_ResolveSymbol		proc far

var_6		= dword ptr -6
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
		cmp	ax, 0A7h
		jnz	short loc_1AECF
		mov	al, [si+7]
		mov	ah, 0
		mov	[bp+var_2], ax
		push	ax
		mov	ax, word_79B8C
		add	ax, 34h
		push	ax
		call	Expr_LookupNamedValue_546A8
		add	sp, 4
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_1AECF
		les	bx, word ptr [bp+var_6]
		mov	di, es:[bx+56h]

loc_1AECF:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
Lexer_ResolveSymbol		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Lexer_ResolveConstantAlt (sub_1CE1D de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,74L — variante
; de sub_1C92E (résolution de constante numérique via table +0x1E/0x20/0x22) : helper de
; résolution de constante, utilisé aussi par le moteur audio 3D (seg022) et l'UI.
; ==============================================================================================
Lexer_ResolveConstantAlt		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
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
		cmp	ax, 0A5h
		jz	short loc_1AEF9
		mov	al, [si+6]
		mov	ah, 0
		cmp	ax, 0A6h
		jnz	short loc_1AF51

loc_1AEF9:
		mov	al, [si+7]
		mov	ah, 0
		mov	si, ax
		mov	bx, word_79B8C
		cmp	[bx+1Eh], si
		jbe	short loc_1AF18
		mov	dx, [bx+22h]
		mov	ax, [bx+20h]
		mov	bx, si
		shl	bx, 4
		add	ax, bx
		jmp	short loc_1AF1C

loc_1AF18:
		xor	dx, dx
		xor	ax, ax

loc_1AF1C:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_1AF51
		push	dx
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_10]
		push	ax
		call	sub_51C99
		add	sp, 8
		mov	eax, [bp+var_10]
		mov	[di], eax
		mov	eax, [bp+var_C]
		mov	[di+4], eax
		mov	eax, [bp+var_8]
		mov	[di+8], eax
		mov	cl, 1

loc_1AF51:
		mov	al, cl
		pop	di
		pop	si
		leave
		retf
Lexer_ResolveConstantAlt		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Parser_FindDuplicateSymbol (sub_1CE9F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,70L — parcourt une liste chaînée de tokens
; (sub_1C92E) cherchant une valeur correspondant à arg_2 : recherche de doublon/valeur
; existante dans une liste de symboles (détection de redéfinition).
; ==============================================================================================
Parser_FindDuplicateSymbol		proc far

var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		cmp	[bp+arg_2], 0
		jz	short loc_1AFB6
		cmp	word ptr [si], 0
		jz	short loc_1AFB6
		mov	di, [si]
		mov	[bp+var_4], 0
		jmp	short loc_1AFAE

loc_1AF7B:
		push	di
		push	cs
		call	near ptr sub_1A9AE
		pop	cx
		cmp	dx, word ptr [bp+arg_2+2]
		jnz	short loc_1AFA8
		cmp	ax, word ptr [bp+arg_2]
		jnz	short loc_1AFA8
		cmp	[bp+var_1], 0
		jz	short loc_1AF9E
		mov	al, [di+4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1AF9E
		mov	al, 0
		jmp	short loc_1AFB9

loc_1AF9E:
		cmp	byte ptr [di+4], 0
		jz	short loc_1AFA8
		mov	[bp+var_1], 1

loc_1AFA8:
		inc	[bp+var_4]
		add	di, 5

loc_1AFAE:
		mov	ax, [si+2]
		cmp	ax, [bp+var_4]
		jg	short loc_1AF7B

loc_1AFB6:
		mov	al, [bp+var_1]

loc_1AFB9:
		pop	di
		pop	si
		leave
		retf
Parser_FindDuplicateSymbol		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1AFBD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_1AFD3
		push	5
		call	CRT_Malloc16_Retry
		pop	cx
sub_1AFBD		endp

; START OF FUNCTION CHUNK FOR sub_1AFBD
		db 8Bh
; END OF FUNCTION CHUNK FOR sub_1AFBD
seg037		ends
