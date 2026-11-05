seg052		segment	para public 'CODE' use16
		assume cs:seg052
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F990		proc far
		push	bp
		mov	bp, sp
		push	6324h
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		pop	bp
		retf
sub_1F990		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyframe_InitBasic (sub_24104 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,24L — copie 3 champs
; (position 32-bit +1, valeur +5, type byte +9) depuis une structure d'événement/keyframe vers
; un objet cible : initialisation d'une entrée de trajectoire/animation à partir d'une
; keyframe.
; ==============================================================================================
Keyframe_InitBasic		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+4], eax
		mov	eax, [bp+arg_8]
		mov	es:[bx+8], eax
		les	bx, [bp+arg_C]
		mov	al, es:[bx+6]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], al
		pop	bp
		retf
Keyframe_InitBasic		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Descriptor_Construct (sub_2916B de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,20L — initialise un
; descripteur avec une référence (+2) et une valeur (+6), flag à 0 : constructeur d'un
; descripteur générique (référence + valeur).
; ==============================================================================================
Descriptor_Construct_1F9C6		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+4], eax
		mov	eax, [bp+arg_8]
		mov	es:[bx+8], eax
		mov	byte ptr es:[bx+0Ch], 0
		pop	bp
		retf
Descriptor_Construct_1F9C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1F9E5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		mov	al, es:[bx+29h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_1FA16
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	al, es:[bx+29h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_1FA16
		mov	al, 1
		jmp	short loc_1FA18

loc_1FA16:
		mov	al, 0

loc_1FA18:
		pop	bp
		retf
sub_1F9E5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FA1A		proc far

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
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		add	dx, 1Ch
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_24], eax
		mov	eax, es:[si+4]
		mov	[bp+var_20], eax
		mov	eax, es:[si+8]
		mov	[bp+var_1C], eax
		lea	di, word ptr [bp+var_24]
		add	di, 4
		mov	es, [bp+arg_2]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 1Ch
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	[bp+var_30], eax
		mov	eax, es:[si+4]
		mov	[bp+var_2C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_28], eax
		lea	si, word ptr [bp+var_30]
		add	si, 4
		mov	eax, [di]
		add	eax, [si]
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		sar	eax, 1
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	dword_7CB28, eax
		sar	eax, 8
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
sub_1FA1A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FABA		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_1FABA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FAC1		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_1FAC1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FAC6		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		xor	dx, dx
		sub	ax, [bp+arg_4]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 2Ah
		cdq
		idiv	ebx
		imul	ax, ax, 2Ah
		mov	dx, [bp+arg_A]
		mov	bx, [bp+arg_8]
		add	bx, ax
		mov	si, [bp+arg_0]
		mov	es:[si+6], dx
		mov	es:[si+4], bx
		mov	bx, [bp+arg_0]
		mov	ax, es:[bx+8]
		xor	dx, dx
		sub	ax, [bp+arg_4]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 2Ah
		cdq
		idiv	ebx
		imul	ax, ax, 2Ah
		mov	dx, [bp+arg_A]
		mov	bx, [bp+arg_8]
		add	bx, ax
		mov	es:[si+0Ah], dx
		mov	es:[si+8], bx
		pop	si
		pop	bp
		retf
sub_1FAC6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FB32		proc far

var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
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
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 60h
		push	si
		push	di
		les	bx, [bp+arg_0]
		push	large es:[bx+4]
		call	sub_288FB
		add	sp, 4
		les	bx, [bp+arg_0]
		push	large es:[bx+8]
		call	sub_288FB
		add	sp, 4
		mov	dl, 0
		cmp	byte_778FC, 0
		jnz	short loc_1FB66
		jmp	loc_1FBF0

loc_1FB66:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		add	dx, 1Ch
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_3C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_38], eax
		mov	eax, es:[si+8]
		mov	[bp+var_34], eax
		lea	di, word ptr [bp+var_3C]
		add	di, 4
		mov	es, [bp+arg_2]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 1Ch
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	[bp+var_48], eax
		mov	eax, es:[si+4]
		mov	[bp+var_44], eax
		mov	eax, es:[si+8]
		mov	[bp+var_40], eax
		lea	si, word ptr [bp+var_48]
		add	si, 4
		mov	eax, [di]
		add	eax, [si]
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		sar	eax, 1
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		jmp	loc_1FCD0

loc_1FBF0:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		mov	al, es:[bx+29h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_1FC1E
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	al, es:[bx+29h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_1FC1E
		mov	al, 1
		jmp	short loc_1FC20

loc_1FC1E:
		mov	al, 0

loc_1FC20:
		mov	ah, 0
		or	ax, ax
		jz	short loc_1FC29
		jmp	loc_1FCD6

loc_1FC29:
		les	bx, [bp+arg_0]
		push	large es:[bx+4]
		call	sub_28AE8
		add	sp, 4
		les	bx, [bp+arg_0]
		push	large es:[bx+8]
		call	sub_28AE8
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6]
		mov	dx, es:[bx+4]
		add	dx, 1Ch
		mov	[bp+var_1A], ax
		mov	[bp+var_1C], dx
		les	si, [bp+var_1C]
		mov	eax, es:[si]
		mov	[bp+var_54], eax
		mov	eax, es:[si+4]
		mov	[bp+var_50], eax
		mov	eax, es:[si+8]
		mov	[bp+var_4C], eax
		lea	di, word ptr [bp+var_54]
		add	di, 4
		mov	es, [bp+arg_2]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 1Ch
		mov	[bp+var_1E], ax
		mov	[bp+var_20], dx
		les	si, [bp+var_20]
		mov	eax, es:[si]
		mov	[bp+var_60], eax
		mov	eax, es:[si+4]
		mov	[bp+var_5C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_58], eax
		lea	si, word ptr [bp+var_60]
		add	si, 4
		mov	eax, [di]
		add	eax, [si]
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		sar	eax, 1
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax

loc_1FCD0:
		mov	dword_7CB28, eax
		mov	dl, 1

loc_1FCD6:
		mov	al, dl
		pop	di
		pop	si
		leave
		retf
sub_1FB32		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FCDC		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_0], 0
		jnz	short loc_1FCFB
		push	34h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_1FD61

loc_1FCFB:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 0DF6h
		mov	eax, dword_7CB28
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+2], eax
		les	bx, [bp+arg_4]
		les	bx, es:[bx+4]
		mov	ax, es:[bx+18h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], ax
		les	bx, [bp+arg_4]
		les	bx, es:[bx+4]
		mov	ax, es:[bx+1Ah]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ah], ax
		les	bx, [bp+arg_4]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+18h]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], ax
		les	bx, [bp+arg_4]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+1Ah]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+20h], ax

loc_1FD61:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_1FCDC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyframe_InitWithParam (sub_24AD8 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,23L — appelle
; sub_24104 (init keyframe) puis copie un champ supplémentaire (+3→+0xA) : initialisation
; d'une keyframe avec un paramètre additionnel (type d'interpolation?).
; ==============================================================================================
Keyframe_InitWithParam		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Keyframe_InitBasic
		add	sp, 10h
		les	bx, word ptr [bp+arg_C]
		mov	al, es:[bx+3]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Dh], al
		pop	bp
		retf
Keyframe_InitWithParam		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FD93		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Descriptor_Construct_1F9C6
		add	sp, 10h
		les	bx, word ptr [bp+arg_C]
		mov	al, es:[bx+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Dh], al
		pop	bp
		retf
sub_1FD93		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FDBD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_1FDDD
		mov	al, es:[bx+0Dh]
		push	ax
		push	[bp+arg_2]
		push	bx
		call	sub_23EDF
		add	sp, 6
		jmp	short loc_1FDE4

loc_1FDDD:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Dh]

loc_1FDE4:
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], al
		pop	bp
		retf
sub_1FDBD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FDED		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_1FDED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FDF4		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_1FE29
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_1FE23
		cmp	[bp+var_4], 0
		jnz	short loc_1FE27

loc_1FE23:
		xor	dx, dx
		xor	ax, ax

loc_1FE27:
		leave
		retf
sub_1FDF4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FE29		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_1FE48
		push	34h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_1FE48
		jmp	loc_1FEDE

loc_1FE48:
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_1FCDC
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 0DF2h
		mov	word ptr es:[bx+6], 17h
		mov	dx, es:[bx+8]
		or	dx, dx
		jl	short loc_1FE73
		cmp	dx, 13Fh
		jle	short loc_1FE79

loc_1FE73:
		mov	word_77921, 1

loc_1FE79:
		les	bx, word ptr [bp+arg_0]
		mov	dx, es:[bx+1Eh]
		or	dx, dx
		jl	short loc_1FE8A
		cmp	dx, 13Fh
		jle	short loc_1FE90

loc_1FE8A:
		mov	word_77921, 1

loc_1FE90:
		les	bx, word ptr [bp+arg_0]
		mov	dx, es:[bx+0Ah]
		or	dx, dx
		jl	short loc_1FEA1
		cmp	dx, 0C7h
		jle	short loc_1FEA7

loc_1FEA1:
		mov	word_77921, 1

loc_1FEA7:
		les	bx, word ptr [bp+arg_0]
		mov	dx, es:[bx+20h]
		or	dx, dx
		jl	short loc_1FEB8
		cmp	dx, 0C7h
		jle	short loc_1FEBE

loc_1FEB8:
		mov	word_77921, 1

loc_1FEBE:
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+0Eh]
		mov	ah, 0
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], ax
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+0Eh]
		mov	ah, 0
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+22h], ax

loc_1FEDE:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_1FE29		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FEE6		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_1FEE6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyframe_InitWithEasing (sub_24B8C de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,39L — appelle
; sub_24104 puis convertit un champ via une table (sub_2E8F1, offset 0x541A) en valeur 32-bit
; stockée (+0xA/+0xC) : initialisation de keyframe avec résolution d'une valeur tabulée
; (probable easing/interpolation).
; ==============================================================================================
Keyframe_InitWithEasing		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Keyframe_InitBasic
		add	sp, 10h
		les	bx, word ptr [bp+arg_C]
		mov	al, es:[bx+3]
		cbw
		push	ax
		push	64DEh
		call	Palette_FadeTablePtr_2DE44
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Fh], dx
		mov	es:[bx+0Dh], ax
		pop	bp
		retf
Keyframe_InitWithEasing		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FF26		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Descriptor_Construct_1F9C6
		add	sp, 10h
		les	bx, word ptr [bp+arg_C]
		mov	al, es:[bx+1]
		mov	ah, 0
		push	ax
		push	64DEh
		call	Palette_FadeTablePtr_2DE44
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Fh], dx
		mov	es:[bx+0Dh], ax
		pop	bp
		retf
sub_1FF26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FF62		proc far
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
sub_1FF62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FF69		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_1FF9E
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_1FF98
		cmp	[bp+var_4], 0
		jnz	short loc_1FF9C

loc_1FF98:
		xor	dx, dx
		xor	ax, ax

loc_1FF9C:
		leave
		retf
sub_1FF69		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1FF9E		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_1FFBD
		push	34h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_1FFBD
		jmp	loc_20042

loc_1FFBD:
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_1FCDC
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 0DEEh
		mov	word ptr es:[bx+6], 18h
		mov	dx, es:[bx+8]
		or	dx, dx
		jl	short loc_1FFE8
		cmp	dx, 13Fh
		jle	short loc_1FFEE

loc_1FFE8:
		mov	word_77921, 1

loc_1FFEE:
		les	bx, word ptr [bp+arg_0]
		mov	dx, es:[bx+1Eh]
		or	dx, dx
		jl	short loc_1FFFF
		cmp	dx, 13Fh
		jle	short loc_20005

loc_1FFFF:
		mov	word_77921, 1

loc_20005:
		les	bx, word ptr [bp+arg_0]
		mov	dx, es:[bx+0Ah]
		or	dx, dx
		jl	short loc_20016
		cmp	dx, 0C7h
		jle	short loc_2001C

loc_20016:
		mov	word_77921, 1

loc_2001C:
		les	bx, word ptr [bp+arg_0]
		mov	dx, es:[bx+20h]
		or	dx, dx
		jl	short loc_2002D
		cmp	dx, 0C7h
		jle	short loc_20033

loc_2002D:
		mov	word_77921, 1

loc_20033:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx+22h], 0

loc_20042:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_1FF9E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2004A		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2004A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyframe_InitWithTwoParams (sub_24C0A de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,28L — appelle
; sub_24104 puis copie 2 champs bytes supplémentaires (+3/+4 → +0xA/+0xB) : initialisation de
; keyframe avec deux paramètres additionnels (probable easing in/out).
; ==============================================================================================
Keyframe_InitWithTwoParams		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr Keyframe_InitBasic
		add	sp, 10h
		les	bx, word ptr [bp+arg_C]
		mov	al, es:[bx+3]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Dh], al
		les	bx, word ptr [bp+arg_C]
		mov	al, es:[bx+4]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Eh], al
		pop	bp
		retf
Keyframe_InitWithTwoParams		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20087		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_200BF
		mov	al, es:[bx+0Dh]
		push	ax
		push	[bp+arg_2]
		push	bx
		call	sub_23EDF
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], al
		mov	al, es:[bx+0Eh]
		push	ax
		push	[bp+arg_2]
		push	bx
		call	sub_23EDF
		add	sp, 6
		jmp	short loc_200CE

loc_200BF:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Dh]
		mov	es:[bx+0Fh], al
		mov	al, es:[bx+0Eh]

loc_200CE:
		les	bx, [bp+arg_0]
		mov	es:[bx+10h], al
		pop	bp
		retf
sub_20087		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_200D7		proc far
		push	bp
		mov	bp, sp
		mov	al, 3
		pop	bp
		retf
sub_200D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_200DE		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_200DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_200E3		proc far

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
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 54h
		push	si
		mov	eax, dword_7CA04
		mov	[bp+var_4], eax
		shl	eax, 1
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+4]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_C], eax
		mov	ax, word ptr [bp+var_8+2]
		mov	dx, word ptr [bp+var_8]
		add	dx, 1Ch
		mov	[bp+var_12], ax
		mov	[bp+var_14], dx
		les	si, [bp+var_14]
		mov	eax, es:[si]
		mov	[bp+var_48], eax
		mov	eax, es:[si+4]
		mov	[bp+var_44], eax
		mov	eax, es:[si+8]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_10], eax
		mov	ax, word ptr [bp+var_C+2]
		mov	dx, word ptr [bp+var_C]
		add	dx, 1Ch
		mov	[bp+var_1A], ax
		mov	[bp+var_1C], dx
		les	si, [bp+var_1C]
		mov	eax, es:[si]
		mov	[bp+var_54], eax
		mov	eax, es:[si+4]
		mov	[bp+var_50], eax
		mov	eax, es:[si+8]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_10]
		or	eax, eax
		jge	short loc_20182
		neg	eax

loc_20182:
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	[bp+var_20], eax
		mov	eax, [bp+var_18]
		or	eax, eax
		jge	short loc_2019E
		neg	eax

loc_2019E:
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	[bp+var_24], eax
		mov	eax, [bp+var_20]
		cmp	eax, [bp+var_4]
		jge	short loc_201BD
		mov	ax, 1
		jmp	short loc_201BF

loc_201BD:
		xor	ax, ax

loc_201BF:
		or	al, al
		jnz	short loc_201DB
		mov	eax, [bp+var_24]
		cmp	eax, [bp+var_4]
		jge	short loc_201D2
		mov	ax, 1
		jmp	short loc_201D4

loc_201D2:
		xor	ax, ax

loc_201D4:
		or	al, al
		jnz	short loc_201DB
		jmp	loc_20421

loc_201DB:
		les	bx, word ptr [bp+var_8]
		movsx	eax, word ptr es:[bx+18h]
		mov	dword_7C432, eax
		movsx	eax, word ptr es:[bx+1Ah]
		mov	dword_7C436, eax
		les	bx, word ptr [bp+arg_0]
		movzx	eax, byte ptr es:[bx+0Fh]
		mov	dword_7C43A, eax
		mov	eax, dword_7C432
		shl	eax, 10h
		mov	dword_7C432, eax
		mov	eax, dword_7C436
		shl	eax, 10h
		mov	dword_7C436, eax
		mov	eax, dword_7C43A
		shl	eax, 10h
		mov	dword_7C43A, eax
		mov	dword_7C44A, 0A00h
		mov	dword_7C44E, 0A00h
		mov	dword_7C452, 0A00h
		mov	eax, dword_7C44A
		shl	eax, 8
		mov	dword_7C44A, eax
		mov	eax, dword_7C44E
		shl	eax, 8
		mov	dword_7C44E, eax
		mov	eax, dword_7C452
		shl	eax, 8
		mov	dword_7C452, eax
		les	bx, word ptr [bp+var_C]
		movsx	eax, word ptr es:[bx+18h]
		mov	dword_7C456, eax
		movsx	eax, word ptr es:[bx+1Ah]
		mov	dword_7C45A, eax
		les	bx, word ptr [bp+arg_0]
		movzx	eax, byte ptr es:[bx+10h]
		mov	dword_7C45E, eax
		mov	eax, dword_7C456
		shl	eax, 10h
		mov	dword_7C456, eax
		mov	eax, dword_7C45A
		shl	eax, 10h
		mov	dword_7C45A, eax
		mov	eax, dword_7C45E
		shl	eax, 10h
		mov	dword_7C45E, eax
		mov	dword_7C46E, 0A00h
		mov	dword_7C472, 0A00h
		mov	dword_7C476, 0A00h
		mov	eax, dword_7C46E
		shl	eax, 8
		mov	dword_7C46E, eax
		mov	eax, dword_7C472
		shl	eax, 8
		mov	dword_7C472, eax
		mov	eax, dword_7C476
		shl	eax, 8
		mov	dword_7C476, eax
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_18]
		jge	short loc_202F8
		mov	ax, 1
		jmp	short loc_202FA

loc_202F8:
		xor	ax, ax

loc_202FA:
		or	al, al
		jz	short loc_2032A
		les	bx, word ptr [bp+var_8]
		mov	ax, es:[bx+18h]
		add	ax, 0FFF2h
		movsx	eax, ax
		mov	dword_7C47A, eax
		mov	ax, es:[bx+1Ah]
		add	ax, 0FFF2h
		movsx	eax, ax
		mov	dword_7C47E, eax
		les	bx, word ptr [bp+arg_0]
		movzx	eax, byte ptr es:[bx+0Fh]
		jmp	short loc_20354

loc_2032A:
		les	bx, word ptr [bp+var_C]
		mov	ax, es:[bx+18h]
		add	ax, 0FFF2h
		movsx	eax, ax
		mov	dword_7C47A, eax
		mov	ax, es:[bx+1Ah]
		add	ax, 0FFF2h
		movsx	eax, ax
		mov	dword_7C47E, eax
		les	bx, word ptr [bp+arg_0]
		movzx	eax, byte ptr es:[bx+10h]

loc_20354:
		mov	dword_7C482, eax
		mov	eax, dword_7C47A
		shl	eax, 10h
		mov	dword_7C47A, eax
		mov	eax, dword_7C47E
		shl	eax, 10h
		mov	dword_7C47E, eax
		mov	eax, dword_7C482
		shl	eax, 10h
		mov	dword_7C482, eax
		mov	dword_7C492, 0A00h
		mov	dword_7C496, 0A00h
		mov	dword_7C49A, 0A00h
		mov	eax, dword_7C492
		shl	eax, 8
		mov	dword_7C492, eax
		mov	eax, dword_7C496
		shl	eax, 8
		mov	dword_7C496, eax
		mov	eax, dword_7C49A
		shl	eax, 8
		mov	dword_7C49A, eax
		push	large 600003h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_38+2], dx
		mov	word ptr [bp+var_38], ax
		cmp	[bp+var_38], 0
		jz	short loc_2044A
		les	bx, word ptr [bp+var_38]
		mov	word ptr es:[bx+6], 2
		mov	eax, dword_7CB28
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	es:[bx+2], eax
		mov	dword ptr es:[bx+10h], 1
		push	2
		mov	ax, word ptr [bp+var_38]
		add	ax, 18h
		push	word ptr [bp+var_38+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_38]
		mov	es:[bx+8], eax
		mov	dx, word ptr [bp+var_38+2]
		mov	ax, word ptr [bp+var_38]
		jmp	short loc_2044E

loc_20421:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	sub_20451
		add	sp, 8
		mov	word ptr [bp+var_38+2], dx
		mov	word ptr [bp+var_38], ax
		cmp	word_77921, 0
		jnz	short loc_2044A
		cmp	[bp+var_38], 0
		jnz	short loc_2044E

loc_2044A:
		xor	dx, dx
		xor	ax, ax

loc_2044E:
		pop	si
		leave
		retf
sub_200E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_20451		proc near

var_4		= dword ptr -4
arg_2		= dword ptr  6
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_2], 0
		jnz	short loc_20473
		push	34h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_2+2], dx
		mov	word ptr [bp+arg_2], ax
		or	ax, dx
		jnz	short loc_20473
		jmp	loc_20562

loc_20473:
		les	bx, word ptr [bp+arg_2]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 0DF6h
		mov	word ptr es:[bx], 0DF2h
		mov	word ptr es:[bx], 0DEAh
		mov	word ptr es:[bx+6], 19h
		mov	eax, dword_7CB28
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+2], eax
		les	bx, [bp+arg_6]
		les	bx, es:[bx+4]
		mov	ax, es:[bx+18h]
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+8], ax
		les	bx, [bp+arg_6]
		les	bx, es:[bx+4]
		mov	ax, es:[bx+1Ah]
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+0Ah], ax
		les	bx, [bp+arg_6]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+18h]
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+1Eh], ax
		les	bx, [bp+arg_6]
		les	bx, es:[bx+8]
		mov	ax, es:[bx+1Ah]
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+20h], ax
		mov	dx, es:[bx+8]
		or	dx, dx
		jl	short loc_204F7
		cmp	dx, 13Fh
		jle	short loc_204FD

loc_204F7:
		mov	word_77921, 1

loc_204FD:
		les	bx, word ptr [bp+arg_2]
		mov	dx, es:[bx+1Eh]
		or	dx, dx
		jl	short loc_2050E
		cmp	dx, 13Fh
		jle	short loc_20514

loc_2050E:
		mov	word_77921, 1

loc_20514:
		les	bx, word ptr [bp+arg_2]
		mov	dx, es:[bx+0Ah]
		or	dx, dx
		jl	short loc_20525
		cmp	dx, 0C7h
		jle	short loc_2052B

loc_20525:
		mov	word_77921, 1

loc_2052B:
		les	bx, word ptr [bp+arg_2]
		mov	dx, es:[bx+20h]
		or	dx, dx
		jl	short loc_2053C
		cmp	dx, 0C7h
		jle	short loc_20542

loc_2053C:
		mov	word_77921, 1

loc_20542:
		les	bx, [bp+arg_6]
		mov	al, es:[bx+0Fh]
		mov	ah, 0
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+0Ch], ax
		les	bx, [bp+arg_6]
		mov	al, es:[bx+10h]
		mov	ah, 0
		les	bx, word ptr [bp+arg_2]
sub_20451		endp

; START OF FUNCTION CHUNK FOR sub_20451
		db 26h, 89h
; END OF FUNCTION CHUNK FOR sub_20451
seg052		ends
