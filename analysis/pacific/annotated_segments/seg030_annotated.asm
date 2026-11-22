seg030		segment	para public 'CODE' use16
		assume cs:seg030
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 1Ah, 0, 0DBh, 21h, 67h, 21h, 0C0h, 21h, 0A5h, 21h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_159CB		proc far

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
		xor	di, di
		mov	[bp+var_4], 0
		jmp	short loc_159F2

loc_159DF:
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	si
		call	GlyphObject_MeasureChar_692A4
		add	sp, 4
		inc	ax
		add	di, ax
		inc	[bp+var_4]

loc_159F2:
		les	bx, [bp+arg_2]
		add	bx, [bp+var_4]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_2], ax
		or	ax, ax
		jnz	short loc_159DF
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_159CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15A09		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_2], di
		mov	ax, [si+17h]
		inc	ax
		mov	[bp+var_4], ax
		mov	[bp+var_8], 0
		jmp	short loc_15A6C

loc_15A28:
		cmp	[bp+var_6], 0Ah
		jnz	short loc_15A39
		mov	di, [bp+var_2]
		mov	ax, [bp+var_4]
		add	[bp+arg_6], ax
		jmp	short loc_15A69

loc_15A39:
		push	[bp+arg_6]
		push	di
		mov	al, byte ptr [bp+var_6]
		push	ax
		push	[bp+arg_2]
		push	si
		call	GlyphObject_ResolveAndCache_69228
		add	sp, 0Ah
		cmp	[bp+var_6], 20h
		jnz	short loc_15A57
		push	41h
		jmp	short loc_15A5B

loc_15A57:
		mov	al, byte ptr [bp+var_6]
		push	ax

loc_15A5B:
		push	si
		call	GlyphObject_MeasureChar_692A4
		add	sp, 4
		add	ax, di
		inc	ax
		mov	di, ax

loc_15A69:
		inc	[bp+var_8]

loc_15A6C:
		les	bx, [bp+arg_8]
		add	bx, [bp+var_8]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_6], ax
		or	ax, ax
		jnz	short loc_15A28
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_15A09		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15A83		proc far

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
		push	cs
		call	near ptr sub_15A09
		add	sp, 0Ch
		pop	bp
		retf
sub_15A83		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_MeasureAndAllocateB_8022A (sub_8022A de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine allocateur typé et Font_ComputeGlyphBoundingBox_5E74E.
; ==============================================================================================
GlyphObject_MeasureAndAllocateB_15AA8		proc far

var_E		= word ptr -0Eh
var_A		= word ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+98h]
		shl	ax, 1
		add	si, ax
		mov	[bp+var_2], 0
		xor	di, di
		mov	[bp+var_4], 0
		jmp	short loc_15B25

loc_15ACD:
		mov	ax, [bp+var_4]
		mov	[bp+var_6], ax
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	large 0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_6]
		call	Font_ComputeGlyphBoundingBox_680A8
		mov	dx, [bp+var_A]
		sub	dx, [bp+var_E]
		inc	dx
		cmp	di, si
		jnb	short loc_15B0E
		cmp	dx, di
		ja	short loc_15B1A

loc_15B0E:
		cmp	di, si
		jbe	short loc_15B22
		cmp	dx, di
		jnb	short loc_15B22
		cmp	dx, si
		jb	short loc_15B22

loc_15B1A:
		mov	ax, [bp+var_4]
		mov	[bp+var_2], ax
		mov	di, dx

loc_15B22:
		inc	[bp+var_4]

loc_15B25:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		cmp	ax, [bp+var_4]
		ja	short loc_15ACD
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
GlyphObject_MeasureAndAllocateB_15AA8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15B38		proc far

var_16		= word ptr -16h
var_14		= word ptr -14h
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
		sub	sp, 16h
		xor	dx, dx
		jmp	short loc_15B62

loc_15B42:
		mov	cx, [bp+var_2]
		mov	bx, cx
		add	bx, 0FFBFh
		cmp	bx, 19h
		ja	short loc_15B56
		mov	cx, bx
		add	cx, 61h
		jmp	short loc_15B56

loc_15B56:
		mov	ax, cx
		les	bx, [bp+arg_0]
		add	bx, dx
		mov	es:[bx+10h], al
		inc	dx

loc_15B62:
		les	bx, [bp+arg_4]
		add	bx, dx
		mov	al, es:[bx]
		cbw
		mov	[bp+var_2], ax
		or	ax, ax
		jz	short loc_15B78
		cmp	dx, 80h
		jl	short loc_15B42

loc_15B78:
		les	bx, [bp+arg_0]
		add	bx, dx
		mov	byte ptr es:[bx+10h], 0
		mov	ax, [bp+arg_0]
		add	ax, 10h
		push	[bp+arg_2]
		push	ax
		mov	bx, [bp+arg_0]
		push	word ptr es:[bx]
		push	cs
		call	near ptr sub_159CB
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+90h], ax
		push	word ptr es:[bx+90h]
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr GlyphObject_MeasureAndAllocateB_15AA8
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+96h], ax
		mov	ax, es:[bx+96h]
		mov	[bp+var_4], ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	large 0
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		call	Font_ComputeGlyphBoundingBox_680A8
		mov	dx, [bp+var_8]
		sub	dx, [bp+var_C]
		inc	dx
		mov	bx, word_7AF7E
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		sub	ax, dx
		sar	ax, 1
		les	bx, [bp+arg_0]
		mov	es:[bx+92h], ax
		mov	ax, es:[bx+9Ch]
		mov	es:[bx+94h], ax
		mov	ax, es:[bx+92h]
		mov	bx, es:[bx+0A9h]
		mov	[bx+4], ax
		mov	bx, [bp+arg_0]
		add	ax, dx
		dec	ax
		mov	bx, es:[bx+0A9h]
		mov	[bx+8], ax
		mov	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ch]
		mov	bx, es:[bx+0A9h]
		mov	[bx+6], ax
		mov	bx, [bp+arg_0]
		mov	ax, es:[bx+96h]
		mov	[bp+var_E], ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		push	large 0
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_E]
		call	Font_ComputeGlyphBoundingBox_680A8
		mov	ax, [bp+var_10]
		sub	ax, [bp+var_14]
		inc	ax
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+9Ch]
		add	dx, ax
		dec	dx
		mov	bx, es:[bx+0A9h]
		mov	[bx+0Ah], dx
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+4]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+4], ax
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+6]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+6], ax
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+8]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+8], ax
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+0Ah]
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+0Ah], ax
		leave
		retf
sub_15B38		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à GlyphObject_Helper9_80467 (sub_80467 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible (36 lignes).
; ==============================================================================================
GlyphObject_Helper9_15CE5		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jz	short loc_15D11
		mov	byte ptr es:[bx+0A0h], 0
		xor	eax, eax
		mov	es:[bx+0A1h], eax
		mov	es:[bx+0A5h], eax
		mov	byte ptr es:[bx+0ADh], 1

loc_15D11:
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_15B38
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+0A0h], 1
		mov	eax, [bp+arg_8]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+0A1h], eax
		leave
		retf
GlyphObject_Helper9_15CE5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15D3D		proc far

var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_12		= word ptr -12h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh
arg_C		= byte ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	di, [bp+arg_6]
		mov	[bp+var_B], 0
		cmp	[bp+arg_E], 0
		jnz	short loc_15D5A
		les	bx, word ptr [bp+arg_0]
		mov	si, es:[bx]
		jmp	short loc_15D65

loc_15D5A:
		les	bx, word ptr [bp+arg_0]
		mov	si, es:[bx+2]
		mov	[bp+var_B], 1

loc_15D65:
		or	si, si
		jnz	short loc_15D6C
		jmp	loc_15F3B

loc_15D6C:
		cmp	[bp+arg_C], 0
		jz	short loc_15DE6
		push	large [bp+arg_8]
		push	si
		push	cs
		call	near ptr sub_159CB
		add	sp, 6
		mov	[bp+var_4], ax
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr GlyphObject_MeasureAndAllocateB_15AA8
		add	sp, 6
		mov	[bp+var_6], ax
		mov	[bp+var_E], ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		push	large 0
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_E]
		call	Font_ComputeGlyphBoundingBox_680A8
		mov	ax, [bp+var_12]
		sub	ax, [bp+var_16]
		inc	ax
		mov	bx, word_7AF7E
		mov	dx, [bx+8]
		sub	dx, [bx+4]
		inc	dx
		sub	dx, ax
		shr	dx, 1
		mov	[bp+var_2], dx
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		sub	ax, [bp+var_4]
		sar	ax, 1
		jmp	short loc_15E16

loc_15DE6:
		mov	bx, word_7AF7E
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		mov	[bp+var_4], ax
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr GlyphObject_MeasureAndAllocateB_15AA8
		add	sp, 6
		mov	[bp+var_6], ax
		mov	[bp+var_2], 0
		les	bx, word ptr [bp+arg_0]
		mov	ax, [bp+var_2]
		add	ax, es:[bx+98h]
		add	ax, 2

loc_15E16:
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_18], ax
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		push	large 0
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_18]
		call	Font_ComputeGlyphBoundingBox_680A8
		mov	cx, [bp+var_1A]
		sub	cx, [bp+var_1E]
		inc	cx
		mov	ax, di
		add	ax, cx
		dec	ax
		mov	bx, word_7AF7E
		cmp	ax, [bx+0Ah]
		jle	short loc_15E66
		mov	di, [bx+0Ah]
		inc	di
		sub	di, cx

loc_15E66:
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+9Ah]
		shl	ax, 1
		mov	dx, cx
		sub	dx, ax
		sub	dx, [si+17h]
		shr	dx, 1
		mov	ax, di
		add	ax, es:[bx+9Ah]
		add	ax, dx
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_22], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_24], ax
		mov	[bp+var_26], di
		mov	ax, [bp+var_6]
		mov	[bp+var_28], ax
		push	ax
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_26]
		push	[bp+var_24]
		push	[bp+var_22]
		call	sub_6A514
		add	sp, 0Ch
		cmp	[bp+var_B], 0
		jz	short loc_15F26
		mov	dx, [bp+var_6]
		cmp	byte_7C99B, 1
		jnz	short loc_15EDA
		mov	dx, 4
		jmp	short loc_15EE4

loc_15EDA:
		cmp	byte_7C99B, 0FFh
		jnz	short loc_15EE4
		mov	dx, 3

loc_15EE4:
		mov	ax, [bp+arg_4]
		mov	[bp+var_2A], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_2C], ax
		mov	[bp+var_2E], di
		mov	[bp+var_30], dx
		push	[bp+var_30]
		push	0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_2E]
		push	[bp+var_2C]
		push	[bp+var_2A]
		call	sub_6A514
		add	sp, 0Ch

loc_15F26:
		push	large [bp+arg_8]
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr sub_15A09
		add	sp, 0Ch

loc_15F3B:
		pop	di
		pop	si
		leave
		retf
sub_15D3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Text_TypewriterTimer
; (sub_146A8 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,25L — timer d'animation : avance un compteur (+0xA5) de dword_70458 (delta-temps)
; ; si dépasse une limite (+0xA1), réinitialise et positionne un flag 'terminé' (+0xAD) :
; minuteur d'effet d'animation de texte (type machine à écrire).
; ==============================================================================================
Text_TypewriterTimer		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jz	short loc_15F80
		mov	eax, dword_7976E
		add	es:[bx+0A5h], eax
		mov	eax, es:[bx+0A5h]
		cmp	eax, es:[bx+0A1h]
		jle	short loc_15F80
		mov	byte ptr es:[bx+0A0h], 0
		xor	eax, eax
		mov	es:[bx+0A1h], eax
		mov	es:[bx+0A5h], eax
		mov	byte ptr es:[bx+0ADh], 1

loc_15F80:
		pop	bp
		retf
Text_TypewriterTimer		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Text_TypewriterDrawChar (sub_146EB de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,70L — met à jour
; la position d'affichage du texte (+0x9C/+0x94), recherche le glyphe via sub_5C832 (police),
; le dessine (sub_5E74E), avance le curseur : rendu caractère par caractère (moteur de texte
; 'machine à écrire').
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
		jnz	short loc_15F9E
		jmp	loc_1602A

loc_15F9E:
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
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_2]
		call	Font_ComputeGlyphBoundingBox_680A8
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

loc_1602A:
		leave
		retf
Text_TypewriterDrawChar		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1602C		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jnz	short loc_16040
		jmp	loc_160E5

loc_16040:
		mov	al, es:[bx+0ADh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_1604E
		jmp	loc_160E5

loc_1604E:
		push	[bp+arg_4]
		push	word ptr es:[bx+0ABh]
		call	TextFormat_ApplyStyleAttributeB_67C9A
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0ABh]
		mov	[bp+var_2], ax
		mov	ax, es:[bx+92h]
		mov	[bp+var_4], ax
		mov	ax, es:[bx+94h]
		mov	[bp+var_6], ax
		mov	ax, es:[bx+96h]
		mov	[bp+var_8], ax
		push	ax
		push	0
		mov	al, es:[bx+0Ah]
		push	ax
		push	large es:[bx+6]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		call	sub_6A514
		add	sp, 0Ch
		mov	bx, word_7AF7E
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		les	bx, [bp+arg_0]
		sub	ax, es:[bx+90h]
		shr	ax, 1
		mov	[bp+var_A], ax
		mov	ax, es:[bx+94h]
		add	ax, es:[bx+9Eh]
		mov	[bp+var_C], ax
		push	ax
		push	[bp+var_A]
		push	word ptr es:[bx+0ABh]
		push	[bp+arg_2]
		push	bx
		push	cs
		call	near ptr sub_15A83
		add	sp, 0Ah

loc_160E5:
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0ADh], 0
		leave
		retf
sub_1602C		endp
seg030		ends
