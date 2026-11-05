seg054		segment	para public 'CODE' use16
		assume cs:seg054
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 2, 87h, 47h, 59h, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Keyframe_InitBasic
; (sub_1F99E de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Keyframe_InitBasic
; (sub_24104 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,24L — copie 3 champs (position 32-bit +1, valeur +5, type byte +9) depuis une
; structure d'événement/keyframe vers un objet cible : initialisation d'une entrée de
; trajectoire/animation à partir d'une keyframe.
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
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Descriptor_Construct_1F9C6 (sub_1F9C6 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 4 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Descriptor_Construct (sub_2916B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,20L — initialise un descripteur avec une référence (+2) et
; une valeur (+6), flag à 0 : constructeur d'un descripteur générique (référence + valeur).
; ==============================================================================================
Descriptor_Construct_25F5F		proc far

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
Descriptor_Construct_25F5F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25F7E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		mov	al, es:[bx+29h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_25FAF
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	al, es:[bx+29h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_25FAF
		mov	al, 1
		jmp	short loc_25FB1

loc_25FAF:
		mov	al, 0

loc_25FB1:
		pop	bp
		retf
sub_25F7E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25FB3		proc far

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
		mov	dword_60054, eax
		sar	eax, 8
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
sub_25FB3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26053		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_26053		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2605A		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2605A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2605F		proc far

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
sub_2605F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_260CB		proc far

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
		call	sub_3342B
		add	sp, 4
		les	bx, [bp+arg_0]
		push	large es:[bx+8]
		call	sub_3342B
		add	sp, 4
		mov	dl, 0
		cmp	byte_5C354, 0
		jnz	short loc_260FF
		jmp	loc_26189

loc_260FF:
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
		jmp	loc_26269

loc_26189:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+4]
		mov	al, es:[bx+29h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_261B7
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	al, es:[bx+29h]
		shr	ax, 3
		and	ax, 1
		or	al, al
		jz	short loc_261B7
		mov	al, 1
		jmp	short loc_261B9

loc_261B7:
		mov	al, 0

loc_261B9:
		mov	ah, 0
		or	ax, ax
		jz	short loc_261C2
		jmp	loc_2626F

loc_261C2:
		les	bx, [bp+arg_0]
		push	large es:[bx+4]
		call	sub_33618
		add	sp, 4
		les	bx, [bp+arg_0]
		push	large es:[bx+8]
		call	sub_33618
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

loc_26269:
		mov	dword_60054, eax
		mov	dl, 1

loc_2626F:
		mov	al, dl
		pop	di
		pop	si
		leave
		retf
sub_260CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26275		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_0], 0
		jnz	short loc_26294
		push	34h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_262FA

loc_26294:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 245Eh
		mov	eax, dword_60054
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

loc_262FA:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_26275		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Keyframe_InitWithParam
; (sub_1FD69 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à Keyframe_InitWithParam
; (sub_24AD8 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,23L — appelle sub_24104 (init keyframe) puis copie un champ supplémentaire
; (+3→+0xA) : initialisation d'une keyframe avec un paramètre additionnel (type
; d'interpolation?).
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

sub_2632C		proc far

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
		call	near ptr Descriptor_Construct_25F5F
		add	sp, 10h
		les	bx, word ptr [bp+arg_C]
		mov	al, es:[bx+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Dh], al
		pop	bp
		retf
sub_2632C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26356		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_26376
		mov	al, es:[bx+0Dh]
		push	ax
		push	[bp+arg_2]
		push	bx
		call	sub_30551
		add	sp, 6
		jmp	short loc_2637D

loc_26376:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Dh]

loc_2637D:
		les	bx, [bp+arg_0]
		mov	es:[bx+0Eh], al
		pop	bp
		retf
sub_26356		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26386		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_26386		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2638D		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_263A1
		add	sp, 8
		pop	bp
		retf
sub_2638D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_263A1		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_263BD
		push	34h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_263FA

loc_263BD:
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_26275
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 245Ah
		mov	word ptr es:[bx+6], 17h
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

loc_263FA:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_263A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26402		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_26402		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Keyframe_InitWithEasing (sub_1FEEB de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Keyframe_InitWithEasing (sub_24B8C de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,39L — appelle sub_24104 puis
; convertit un champ via une table (sub_2E8F1, offset 0x541A) en valeur 32-bit stockée
; (+0xA/+0xC) : initialisation de keyframe avec résolution d'une valeur tabulée (probable
; easing/interpolation).
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
		push	63DEh
		call	sub_350A8
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Fh], dx
		mov	es:[bx+0Dh], ax
		pop	bp
		retf
Keyframe_InitWithEasing		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26442		proc far

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
		call	near ptr Descriptor_Construct_25F5F
		add	sp, 10h
		les	bx, word ptr [bp+arg_C]
		mov	al, es:[bx+1]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_350A8
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Fh], dx
		mov	es:[bx+0Dh], ax
		pop	bp
		retf
sub_26442		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2647E		proc far
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
sub_2647E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26485		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_26499
		add	sp, 8
		pop	bp
		retf
sub_26485		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26499		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_264B5
		push	34h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_264DE

loc_264B5:
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_26275
		add	sp, 8
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 2456h
		mov	word ptr es:[bx+6], 18h
		mov	word ptr es:[bx+0Ch], 0
		mov	word ptr es:[bx+22h], 0

loc_264DE:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_26499		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_264E6		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_264E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Keyframe_InitWithTwoParams (sub_2004F de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 6 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Keyframe_InitWithTwoParams (sub_24C0A de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,28L — appelle sub_24104 puis copie 2 champs
; bytes supplémentaires (+3/+4 → +0xA/+0xB) : initialisation de keyframe avec deux paramètres
; additionnels (probable easing in/out).
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

sub_26523		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0Ch], 0
		jz	short loc_2655B
		mov	al, es:[bx+0Dh]
		push	ax
		push	[bp+arg_2]
		push	bx
		call	sub_30551
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], al
		mov	al, es:[bx+0Eh]
		push	ax
		push	[bp+arg_2]
		push	bx
		call	sub_30551
		add	sp, 6
		jmp	short loc_2656A

loc_2655B:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Dh]
		mov	es:[bx+0Fh], al
		mov	al, es:[bx+0Eh]

loc_2656A:
		les	bx, [bp+arg_0]
		mov	es:[bx+10h], al
		pop	bp
		retf
sub_26523		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26573		proc far
		push	bp
		mov	bp, sp
		mov	al, 3
		pop	bp
		retf
sub_26573		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2657A		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2657A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2657F		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	sub_26593
		add	sp, 8
		pop	bp
		retf
sub_2657F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26593		proc near

var_4		= dword ptr -4
arg_2		= dword ptr  6
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_2], 0
		jnz	short loc_265B5
		push	34h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_2+2], dx
		mov	word ptr [bp+arg_2], ax
		or	ax, dx
		jnz	short loc_265B5
		jmp	loc_2664B

loc_265B5:
		les	bx, word ptr [bp+arg_2]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 245Eh
		mov	word ptr es:[bx], 245Ah
		mov	word ptr es:[bx], 2452h
		mov	word ptr es:[bx+6], 19h
		mov	eax, dword_60054
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
		les	bx, [bp+arg_6]
		mov	al, es:[bx+0Fh]
		mov	ah, 0
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+0Ch], ax
		les	bx, [bp+arg_6]
		mov	al, es:[bx+10h]
		mov	ah, 0
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+22h], ax

loc_2664B:
		mov	dx, word ptr [bp+arg_2+2]
sub_26593		endp

; START OF FUNCTION CHUNK FOR sub_26593
		db 8Bh
		inc	si
; END OF FUNCTION CHUNK FOR sub_26593
seg054		ends
