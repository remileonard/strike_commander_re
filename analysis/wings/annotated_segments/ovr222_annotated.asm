ovr222		segment	para public 'OVERLAY' use16
		assume cs:ovr222
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_779B0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		add	ax, 10h
		push	[bp+arg_2]
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		les	bx, [bp+arg_0]
		push	word ptr es:[bx]
		call	sub_59542
		add	sp, 0Ch
		pop	bp
		retf
sub_779B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_779D6		proc far

var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_30		= word ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_26		= word ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1C		= word ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_12		= word ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh
arg_C		= byte ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		push	di
		mov	si, [bp+arg_6]
		push	large [bp+arg_8]
		call	CRT_Strlen_Far
		add	sp, 4
		mov	[bp+var_6], 1
		mov	[bp+var_A], 0
		mov	di, 2
		cmp	[bp+arg_E], 0
		jnz	short loc_77A0B
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		mov	[bp+var_C], ax
		jmp	short loc_77A20

loc_77A0B:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		mov	[bp+var_C], ax
		add	[bp+var_6], 3
		add	[bp+var_A], 3
		add	di, 3

loc_77A20:
		cmp	[bp+var_C], 0
		jnz	short loc_77A29
		jmp	loc_77C99

loc_77A29:
		cmp	[bp+arg_C], 0
		jz	short loc_77A96
		push	large [bp+arg_8]
		push	[bp+var_C]
		call	sub_5953D
		add	sp, 6
		mov	[bp+var_4], ax
		mov	bx, word_5DD44
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		sub	ax, [bp+var_4]
		sar	ax, 1
		mov	di, ax
		mov	ax, [bp+var_A]
		mov	[bp+var_E], ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		push	large 0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_E]
		call	sub_47C50
		mov	ax, [bp+var_12]
		sub	ax, [bp+var_16]
		inc	ax
		mov	dx, di
		sub	dx, ax
		mov	[bp+var_2], dx
		jmp	loc_77B58

loc_77A96:
		mov	ax, [bp+var_A]
		mov	[bp+var_18], ax
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		push	large 0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_18]
		call	sub_47C50
		mov	ax, [bp+var_1C]
		sub	ax, [bp+var_20]
		inc	ax
		mov	bx, word_5DD44
		mov	dx, [bx+8]
		sub	dx, [bx+4]
		inc	dx
		sub	dx, ax
		mov	[bp+var_22], di
		push	dx
		push	ss
		lea	ax, [bp+var_2A]
		push	ax
		push	large 0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_22]
		call	sub_47C50
		mov	ax, [bp+var_26]
		sub	ax, [bp+var_2A]
		inc	ax
		pop	dx
		sub	dx, ax
		mov	[bp+var_4], dx
		mov	ax, [bp+var_A]
		mov	[bp+var_2C], ax
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		push	large 0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_2C]
		call	sub_47C50
		mov	di, [bp+var_30]
		sub	di, [bp+var_34]
		inc	di
		dec	di
		mov	[bp+var_2], 0

loc_77B58:
		mov	ax, [bp+var_6]
		mov	[bp+var_36], ax
		push	ss
		lea	ax, [bp+var_3E]
		push	ax
		push	large 0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_36]
		call	sub_47C50
		mov	dx, [bp+var_38]
		sub	dx, [bp+var_3C]
		inc	dx
		mov	ax, si
		add	ax, dx
		dec	ax
		mov	bx, word_5DD44
		cmp	ax, [bx+0Ah]
		jle	short loc_77BA5
		mov	si, [bx+0Ah]
		inc	si
		sub	si, dx

loc_77BA5:
		les	bx, [bp+arg_0]
		mov	ax, si
		add	ax, es:[bx+9Eh]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_40], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_42], ax
		mov	[bp+var_44], si
		push	large 0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_44]
		push	[bp+var_42]
		push	[bp+var_40]
		call	sub_4A194
		add	sp, 0Ch
		mov	[bp+var_46], 0
		jmp	short loc_77C39

loc_77BF3:
		mov	ax, [bp+arg_4]
		mov	[bp+var_48], ax
		mov	ax, di
		add	ax, [bp+var_46]
		mov	[bp+var_4A], ax
		mov	[bp+var_4C], si
		push	large 10000h
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4C]
		push	[bp+var_4A]
		push	[bp+var_48]
		call	sub_4A194
		add	sp, 0Ch
		add	[bp+var_46], 2

loc_77C39:
		mov	ax, [bp+var_46]
		cmp	ax, [bp+var_4]
		jl	short loc_77BF3
		mov	ax, [bp+arg_4]
		mov	[bp+var_4E], ax
		mov	ax, di
		add	ax, [bp+var_46]
		mov	[bp+var_50], ax
		mov	[bp+var_52], si
		push	large 20000h
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_52]
		push	[bp+var_50]
		push	[bp+var_4E]
		call	sub_4A194
		add	sp, 0Ch
		push	large [bp+arg_8]
		push	[bp+var_8]
		push	di
		push	[bp+arg_4]
		push	[bp+var_C]
		call	sub_59542
		add	sp, 0Ch

loc_77C99:
		pop	di
		pop	si
		leave
		retf
sub_779D6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Text_TypewriterTimer
; (sub_15F3F de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Text_TypewriterTimer (sub_146A8 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,25L — timer d'animation : avance un compteur (+0xA5) de
; dword_70458 (delta-temps) ; si dépasse une limite (+0xA1), réinitialise et positionne un
; flag 'terminé' (+0xAD) : minuteur d'effet d'animation de texte (type machine à écrire).
; ==============================================================================================
Text_TypewriterTimer		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jz	short loc_77CDE
		mov	eax, dword_5C59E
		add	es:[bx+0A5h], eax
		mov	eax, es:[bx+0A5h]
		cmp	eax, es:[bx+0A1h]
		jle	short loc_77CDE
		mov	byte ptr es:[bx+0A0h], 0
		xor	eax, eax
		mov	es:[bx+0A1h], eax
		mov	es:[bx+0A5h], eax
		mov	byte ptr es:[bx+0ADh], 1

loc_77CDE:
		pop	bp
		retf
Text_TypewriterTimer		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Text_TypewriterDrawChar (sub_15F82 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Text_TypewriterDrawChar (sub_146EB de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,70L — met à jour la position
; d'affichage du texte (+0x9C/+0x94), recherche le glyphe via sub_5C832 (police), le dessine
; (sub_5E74E), avance le curseur : rendu caractère par caractère (moteur de texte 'machine à
; écrire').
; ==============================================================================================
Text_TypewriterDrawChar		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+9Ch], ax
		cmp	byte ptr es:[bx+0A0h], 0
		jnz	short loc_77CFC
		jmp	loc_77D88

loc_77CFC:
		mov	ax, es:[bx+9Ch]
		mov	es:[bx+94h], ax
		mov	bx, es:[bx+0A9h]
		mov	[bx+6], ax
		mov	bx, [bp+arg_0]
		mov	ax, es:[bx+96h]
		mov	[bp+var_2], ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	large 0
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_2]
		call	sub_47C50
		mov	ax, [bp+var_4]
		sub	ax, [bp+var_8]
		inc	ax
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+9Ch]
		add	dx, ax
		dec	dx
		mov	bx, es:[bx+0A9h]
		mov	[bx+0Ah], dx
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+6]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+6], ax
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+0Ah]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+0Ah], ax

loc_77D88:
		leave
		retf
Text_TypewriterDrawChar		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_77D8A		proc far

var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jnz	short loc_77DA0
		jmp	loc_77F0B

loc_77DA0:
		mov	al, es:[bx+0ADh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_77DAE
		jmp	loc_77F0B

loc_77DAE:
		push	[bp+arg_4]
		push	word ptr es:[bx+0ABh]
		call	TextFormat_ApplyStyleAttributeB_478D0
		add	sp, 4
		mov	bx, word_5DD44
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		les	bx, [bp+arg_0]
		sub	ax, es:[bx+90h]
		shr	ax, 1
		mov	di, ax
		mov	ax, es:[bx+94h]
		add	ax, es:[bx+9Eh]
		mov	[bp+var_2], ax
		mov	ax, es:[bx+0ABh]
		mov	[bp+var_4], ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	large 0
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	sub_47C50
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_C]
		inc	ax
		mov	dx, di
		sub	dx, ax
		mov	[bp+var_E], dx
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+94h]
		mov	[bp+var_10], ax
		push	large 0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_10]
		push	[bp+var_E]
		push	[bp+var_4]
		call	sub_4A194
		add	sp, 0Ch
		xor	si, si
		jmp	short loc_77EA5

loc_77E5A:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0ABh]
		mov	[bp+var_12], ax
		mov	ax, di
		add	ax, si
		mov	[bp+var_14], ax
		mov	ax, es:[bx+94h]
		mov	[bp+var_16], ax
		push	large 10000h
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_16]
		push	[bp+var_14]
		push	[bp+var_12]
		call	sub_4A194
		add	sp, 0Ch
		add	si, 2

loc_77EA5:
		les	bx, [bp+arg_0]
		cmp	es:[bx+90h], si
		ja	short loc_77E5A
		mov	ax, es:[bx+0ABh]
		mov	[bp+var_18], ax
		mov	ax, di
		add	ax, si
		mov	[bp+var_1A], ax
		mov	ax, es:[bx+94h]
		mov	[bp+var_1C], ax
		push	large 20000h
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_1C]
		push	[bp+var_1A]
		push	[bp+var_18]
		call	sub_4A194
		add	sp, 0Ch
		push	[bp+var_2]
		push	di
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0ABh]
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr sub_779B0
		add	sp, 0Ah

loc_77F0B:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0ADh], 0
		pop	di
		pop	si
		leave
		retf
sub_77D8A		endp
ovr222		ends
