seg025		segment	para public 'CODE' use16
		assume cs:seg025
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 2, 93h, 5, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ScaledImageLayer_Construct_9391 (sub_9391 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. Calque image tourné et mis à l'échelle (taille 23h, tables 19A7h / 19CBh) :
; ImageLayer_Construct_2E02C(ressource arg_2, x arg_4, y arg_6, image arg_E), puis +1Dh =
; arg_8 (angle), +1Fh = arg_A (échelle, 256 = taille d'origine), +21h = arg_C (octet passé
; comme dernier argument du dessin, rôle non établi). Dessin : ScaledImageLayer_Draw_93E4.
; mid12 : angle 0, échelle 200 ou 160, dernier argument 0.
; ==============================================================================================
ScaledImageLayer_Construct_DBA8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_DBC3
		push	23h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_DBF3

loc_DBC3:
		push	[bp+arg_E]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [si], 2109h
		mov	word ptr [si+0Ah], 212Dh
		mov	ax, [bp+arg_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+arg_A]
		mov	[si+1Fh], ax
		mov	ax, [bp+arg_C]
		mov	[si+21h], ax

loc_DBF3:
		mov	ax, si
		pop	si
		pop	bp
		retf
ScaledImageLayer_Construct_DBA8		endp

; START OF FUNCTION CHUNK FOR ScaledImageLayer_Construct_DBA8
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR ScaledImageLayer_Construct_DBA8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DBFB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		cmp	di, 0FFFFh
		jz	short loc_DC40
		push	word ptr [si+21h]
		push	word ptr [si+1Fh]
		push	word ptr [si+1Dh]
		push	di
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word_4D36C
		call	sub_3F2B2
		add	sp, 12h

loc_DC40:
		pop	di
		pop	si
		pop	bp
		retf
sub_DBFB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DC44		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word ptr [si+1Bh]
		push	[bp+arg_4]
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 8
		mov	[bp+var_2], 0
		jmp	short loc_DC81

loc_DC69:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bp+var_2]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_DC81:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_DC69
		pop	di
		pop	si
		leave
		retf
sub_DC44		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DC9B		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_DC44
		add	sp, 6
		pop	si
		leave
		retf
sub_DC9B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DCCE		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_DC44
		add	sp, 6
		pop	si
		leave
		retf
sub_DCCE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DCFB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+1Dh], ax
		pop	si
		pop	bp
		retf
sub_DCFB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ScaledImageLayer_SetScale_94F4 (sub_94F4 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-21. Pose l'échelle d'un
; ScaledImageLayer : [arg_0 + 1Fh] = arg_2 (1/256, 256 = taille d'origine). mid15 : zoom des
; deux avions du premier plan, de 32 à 255.
; ==============================================================================================
ScaledImageLayer_SetScale_DD0B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+1Fh], ax
		pop	si
		pop	bp
		retf
ScaledImageLayer_SetScale_DD0B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; MovingMaskLayer_SetTable_BA1C (sub_BA1C de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-21. +21h = arg_2 (table de 256
; couleurs du calque masque).
; ==============================================================================================
MovingMaskLayer_SetTable_DD1B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+21h], ax
		pop	si
		pop	bp
		retf
MovingMaskLayer_SetTable_DD1B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DD2B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Dh]
		pop	si
		pop	bp
		retf
sub_DD2B		endp

; START OF FUNCTION CHUNK FOR sub_DD2B
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_DD2B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DD3B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Fh]
		pop	si
		pop	bp
		retf
sub_DD3B		endp

; START OF FUNCTION CHUNK FOR sub_DD3B
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_DD3B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DD4B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+21h]
		pop	si
		pop	bp
		retf
sub_DD4B		endp

; START OF FUNCTION CHUNK FOR sub_DD4B
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_DD4B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ScaledMovingLayer_Construct_9544 (sub_9544 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. Calque mobile à l'échelle (taille 25h, tables 1943h / 1967h) :
; ImageLayer_Construct_2E02C(ressource arg_2, x arg_4, y arg_6, image arg_10), vitesse +1Dh =
; arg_C, +1Fh = arg_E, échelles +21h = arg_8 (largeur) et +23h = arg_A (hauteur), en 1/256
; (256 = taille d'origine). Dessin : ScaledMovingLayer_DrawImage_C056 par sub_95D7. mid5 :
; mid5 5, échelle 300.
; ==============================================================================================
ScaledMovingLayer_Construct_DD5B		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_DD79
		push	25h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_DDE6

loc_DD79:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_C]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_E]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_10]
		mov	[bp+var_C], ax
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp+var_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_A]
		mov	[si+1Fh], ax
		mov	word ptr [si], 20A5h
		mov	word ptr [si+0Ah], 20C9h
		mov	ax, [bp+arg_8]
		mov	[si+21h], ax
		mov	ax, [bp+arg_A]
		mov	[si+23h], ax

loc_DDE6:
		mov	ax, si
		pop	si
		leave
		retf
ScaledMovingLayer_Construct_DD5B		endp

; START OF FUNCTION CHUNK FOR ScaledMovingLayer_Construct_DD5B
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR ScaledMovingLayer_Construct_DD5B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DDEE		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word ptr [si+1Bh]
		push	[bp+arg_4]
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 8
		mov	[bp+var_2], 0
		jmp	short loc_DE2B

loc_DE13:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bp+var_2]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_DE2B:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_DE13
		pop	di
		pop	si
		leave
		retf
sub_DDEE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DE45		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_DDEE
		add	sp, 6
		pop	si
		leave
		retf
sub_DE45		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DE78		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_DDEE
		add	sp, 6
		pop	si
		leave
		retf
sub_DE78		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; MovingMaskLayer_SetTable_BA1C (sub_BA1C de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-21. +21h = arg_2 (table de 256
; couleurs du calque masque).
; ==============================================================================================
MovingMaskLayer_SetTable_DEA5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+21h], ax
		pop	si
		pop	bp
		retf
MovingMaskLayer_SetTable_DEA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DEB5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+23h], ax
		pop	si
		pop	bp
		retf
sub_DEB5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DEC5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_DEE0
		push	25h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_DF10

loc_DEE0:
		push	[bp+arg_10]
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_F088
		add	sp, 0Eh
		mov	word ptr [si], 2071h
		mov	word ptr [si+0Ah], 2095h
		mov	ax, [bp+arg_8]
		mov	[si+21h], ax
		mov	ax, [bp+arg_A]
		mov	[si+23h], ax

loc_DF10:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_DEC5		endp

; START OF FUNCTION CHUNK FOR sub_DEC5
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_DEC5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF18		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word ptr [si+1Bh]
		push	[bp+arg_4]
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 8
		mov	[bp+var_2], 0
		jmp	short loc_DF55

loc_DF3D:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bp+var_2]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_DF55:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_DF3D
		pop	di
		pop	si
		leave
		retf
sub_DF18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DF6F		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_DF18
		add	sp, 6
		pop	si
		leave
		retf
sub_DF6F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DFA2		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_DF18
		add	sp, 6
		pop	si
		leave
		retf
sub_DFA2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; MovingMaskLayer_SetTable_BA1C (sub_BA1C de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-21. +21h = arg_2 (table de 256
; couleurs du calque masque).
; ==============================================================================================
MovingMaskLayer_SetTable_DFCF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+21h], ax
		pop	si
		pop	bp
		retf
MovingMaskLayer_SetTable_DFCF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_DFDF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+23h], ax
		pop	si
		pop	bp
		retf
sub_DFDF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TalkingHead_CopyLipText_97D8 (sub_97D8 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Libère le texte précédent
; (+29), copie le nouveau (sub_26D7), le passe en minuscules (CRT_Strlwr_2769) et place le
; curseur +31 au début.
; ==============================================================================================
TalkingHead_CopyLipText_DFEF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+1Dh]
		call	sub_330E8
		add	sp, 2
		mov	word ptr [si+1Dh], 0
		push	[bp+arg_2]
		call	CRT_Strdup
		add	sp, 2
		mov	[si+1Dh], ax
		push	word ptr [si+1Dh]
		call	CRT_Strupr_2CA5
		add	sp, 2
		mov	ax, [si+1Dh]
		mov	[si+1Fh], ax
		pop	si
		pop	bp
		retf
TalkingHead_CopyLipText_DFEF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E028		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_E047
		push	855h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_E047
		jmp	loc_E100

loc_E047:
		mov	word ptr [si], 2021h
		mov	word ptr [si+4], 2019h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 201Dh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1FEDh
		mov	word ptr [si+0Ah], 1FF9h
		mov	word ptr [si+0Ah], 2009h
		mov	word ptr [si], 2041h
		mov	word ptr [si+0Ah], 2061h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1FB9h
		mov	word ptr [si+0Ah], 1FDDh
		mov	word ptr [si+30h], 129Fh
		mov	dword ptr [si+40h], 0
		mov	byte ptr [si+44h], 2
		mov	byte ptr [si+45h], 0
		mov	dword ptr [si+46h], 0
		mov	word ptr [si+32h], 0
		mov	word ptr [si+30h], 1FA5h
		xor	eax, eax
		mov	[si+84Dh], eax
		mov	[si+851h], eax
		xor	ax, ax
		mov	[si+1Dh], ax
		mov	[si+1Fh], ax
		mov	ax, 0FFFFh
		mov	[si+21h], ax
		mov	[si+29h], ax
		mov	[si+25h], ax
		mov	word ptr [si+2Bh], 0
		mov	word ptr [si+23h], 22h
		mov	byte ptr [si+2Dh], 0
		mov	byte ptr [si+2Eh], 0
		mov	byte ptr [si+2Fh], 1
		mov	word ptr [si+27h], 0FFFFh

loc_E100:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_E028		endp

; START OF FUNCTION CHUNK FOR sub_E028
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_E028

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (21 sur
; 21), à TalkingHead_Construct_98F4 (sub_98F4 de OPTEST.EXE). Code non comparé instruction par
; instruction. — far, LUE 2026-10-17. Tête parlante synchronisée sur les lèvres (2131 octets,
; vtable dseg 6275) : Layer_Construct_2DF9B ; lecteur de voix intégré en +33 (vtables dseg
; 6239/6255, comme le lecteur de voix des cinématiques) ; texte de lèvres +29 (copie) et
; curseur +31 = 0 ; image de base +2118 = image affichée +2124 = -1 ; bouche +2122 = -1 ;
; +2120 = 34 ; +2126 = 0 ; mode voix +2129 = 0 ; clignement permis +2130 = 1.
; ==============================================================================================
TalkingHead_Construct_E108		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_E124
		push	855h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_E1A2

loc_E124:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [si], 1FB9h
		mov	word ptr [si+0Ah], 1FDDh
		mov	word ptr [si+30h], 129Fh
		mov	dword ptr [si+40h], 0
		mov	byte ptr [si+44h], 2
		mov	byte ptr [si+45h], 0
		mov	dword ptr [si+46h], 0
		mov	word ptr [si+32h], 0
		mov	word ptr [si+30h], 1FA5h
		xor	eax, eax
		mov	[si+84Dh], eax
		mov	[si+851h], eax
		xor	ax, ax
		mov	[si+1Dh], ax
		mov	[si+1Fh], ax
		mov	ax, 0FFFFh
		mov	[si+21h], ax
		mov	[si+29h], ax
		mov	[si+25h], ax
		mov	word ptr [si+2Bh], 0
		mov	word ptr [si+23h], 22h
		mov	byte ptr [si+2Dh], 0
		mov	byte ptr [si+2Eh], 0
		mov	byte ptr [si+2Fh], 1
		mov	word ptr [si+27h], 0FFFFh

loc_E1A2:
		mov	ax, si
		pop	si
		pop	bp
		retf
TalkingHead_Construct_E108		endp

; START OF FUNCTION CHUNK FOR TalkingHead_Construct_E108
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR TalkingHead_Construct_E108

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E1AA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_E1C9
		push	855h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_E1C9
		jmp	loc_E28E

loc_E1C9:
		mov	word ptr [si], 2021h
		mov	word ptr [si+4], 2019h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 201Dh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1FEDh
		mov	word ptr [si+0Ah], 1FF9h
		mov	word ptr [si+0Ah], 2009h
		mov	word ptr [si], 2041h
		mov	word ptr [si+0Ah], 2061h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1FB9h
		mov	word ptr [si+0Ah], 1FDDh
		mov	word ptr [si+30h], 129Fh
		mov	dword ptr [si+40h], 0
		mov	byte ptr [si+44h], 2
		mov	byte ptr [si+45h], 0
		mov	dword ptr [si+46h], 0
		mov	word ptr [si+32h], 0
		mov	word ptr [si+30h], 1FA5h
		xor	eax, eax
		mov	[si+84Dh], eax
		mov	[si+851h], eax
		xor	ax, ax
		mov	[si+1Dh], ax
		mov	[si+1Fh], ax
		mov	ax, 0FFFFh
		mov	[si+21h], ax
		mov	[si+29h], ax
		mov	[si+25h], ax
		mov	word ptr [si+2Bh], 0
		mov	word ptr [si+23h], 22h
		mov	byte ptr [si+2Dh], 0
		mov	byte ptr [si+2Eh], 0
		mov	byte ptr [si+2Fh], 1
		mov	word ptr [si+27h], 0FFFFh
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_E314
		add	sp, 4

loc_E28E:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_E1AA		endp

; START OF FUNCTION CHUNK FOR sub_E1AA
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_E1AA

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E296		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_E2B2
		push	855h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_E30C

loc_E2B2:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [si], 1FB9h
		mov	word ptr [si+0Ah], 1FDDh
		mov	word ptr [si+30h], 129Fh
		mov	dword ptr [si+40h], 0
		mov	byte ptr [si+44h], 2
		mov	byte ptr [si+45h], 0
		mov	dword ptr [si+46h], 0
		mov	word ptr [si+32h], 0
		mov	word ptr [si+30h], 1FA5h
		xor	eax, eax
		mov	[si+84Dh], eax
		mov	[si+851h], eax
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr TalkingHead_CopyLipText_DFEF
		add	sp, 4

loc_E30C:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_E296		endp

; START OF FUNCTION CHUNK FOR sub_E296
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_E296

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E314		proc far

var_BA		= word ptr -0BAh
var_5D		= dword ptr -5Dh
var_59		= dword ptr -59h
var_55		= dword ptr -55h
var_4D		= dword ptr -4Dh
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_12		= word ptr -12h
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0BAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		lea	ax, [bp+var_BA]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_BA], 480h
		mov	[bp+var_59], 100h
		mov	[bp+var_5D], 0
		mov	[bp+var_BA], 498h
		push	1
		push	1D12h
		lea	ax, [bp+var_BA]
		push	ax
		mov	bx, [bp+var_BA]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_BA]
		push	ax
		call	sub_42C34
		add	sp, 2
		push	0
		push	large dword_4A6FC
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		jmp	short loc_E3C0

loc_E383:
		lea	ax, [bp+var_BA]
		push	ax
		lea	ax, [bp+var_12]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	di
		lea	ax, [bp+var_12]
		push	ax
		call	CRT_Strncmp_Like
		add	sp, 4
		or	ax, ax
		jz	short loc_E3BE
		mov	eax, [bp+var_44]
		mov	[bp+var_55], eax
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_ComputeAlignedBounds_42BD4
		add	sp, 2
		jmp	short loc_E3C0
		jmp	short loc_E3C0

loc_E3BE:
		jmp	short loc_E3CB

loc_E3C0:
		mov	eax, [bp+var_4D]
		cmp	eax, dword_4A701
		jz	short loc_E383

loc_E3CB:
		mov	eax, [bp+var_48]
		mov	[bp+var_4], eax
		push	1
		push	0
		push	2
		push	large [bp+var_4]
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	[si+11h], eax
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 1
		mov	dword ptr [si+17h], 0
		mov	eax, [bp+var_4]
		mov	[si+17h], eax
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_42B12
		add	sp, 6
		mov	[bp+var_BA], 498h
		lea	ax, [bp+var_BA]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_BA]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_E314		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TalkingHead_SetLipText_9C4F (sub_9C4F de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Donne le texte de lèvres :
; TalkingHead_CopyLipText_97D8. mid1 lui passe « Back off, almost got tone. Blah blah blah »
; (dseg 7904 et 7946).
; ==============================================================================================
TalkingHead_SetLipText_E45A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr TalkingHead_CopyLipText_DFEF
		add	sp, 4
		pop	si
		pop	bp
		retf
TalkingHead_SetLipText_E45A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E46F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 30h
		push	ax
		call	VoicePlayer_GetLipFrame_C7A2
		add	sp, 2
		mov	[si+25h], ax
		cmp	word ptr [si+25h], 0Bh
		jz	short loc_E493
		cmp	word ptr [si+25h], 0Ah
		jnz	short loc_E4A4

loc_E493:
		cmp	word ptr [si+27h], 0Bh
		jz	short loc_E49F
		cmp	word ptr [si+27h], 0Ah
		jnz	short loc_E4A4

loc_E49F:
		mov	word ptr [si+25h], 0FFFFh

loc_E4A4:
		mov	ax, [si+25h]
		mov	[si+27h], ax
		pop	si
		pop	bp
		retf
sub_E46F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (28 sur
; 28), à TalkingHead_StartVoiceAndIsSpeaking_9C64 (sub_9C64 de OPTEST.EXE). Code non comparé
; instruction par instruction. — far, LUE 2026-10-21. Appelée à chaque tour de la boucle
; d'attente (« tant que la tête parle »). Au premier appel (compteur +84Eh = 0, réplique prête
; +850h, pas encore partie +851h) : bouche +84Ah = VoicePlayer_GetLipFrame_8466, lance la
; réplique (méthode +10h du lecteur, −1), +851h = 1. Puis compteur + 1 ; renvoie +851h (1 tant
; que la tête parle). +851h est remis à 0 par TalkingHead_Advance_9F5A quand la réplique ne
; joue plus ou que la table renvoie −2.
; ==============================================================================================
TalkingHead_StartVoiceAndIsSpeaking_E4AD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2Bh], 0
		jnz	short loc_E4EC
		cmp	byte ptr [si+2Dh], 0
		jz	short loc_E4EC
		mov	al, [si+2Eh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_E4EC
		push	si
		push	cs
		call	near ptr sub_E46F
		add	sp, 2
		mov	ax, [si+25h]
		mov	[si+27h], ax
		push	0FFFFh
		mov	ax, si
		add	ax, 30h
		push	ax
		mov	bx, [si+30h]
		call	dword ptr [bx+10h]
		add	sp, 4
		mov	byte ptr [si+2Eh], 1

loc_E4EC:
		inc	word ptr [si+2Bh]
		cmp	byte ptr [si+2Eh], 0
		jz	short loc_E4FC
		mov	al, 1
		pop	si
		pop	bp
		retf
		jmp	short loc_E501

loc_E4FC:
		mov	al, 0
		pop	si
		pop	bp
		retf
TalkingHead_StartVoiceAndIsSpeaking_E4AD		endp

; START OF FUNCTION CHUNK FOR TalkingHead_StartVoiceAndIsSpeaking_E4AD

loc_E501:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR TalkingHead_StartVoiceAndIsSpeaking_E4AD

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E504		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word_4CA5B
		mov	ax, si
		add	ax, 30h
		push	ax
		call	VoicePlayer_SetDriver_B978
		add	sp, 4
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 30h
		push	ax
		call	sub_C296
		add	sp, 4
		mov	byte ptr [si+2Dh], 1
		pop	si
		pop	bp
		retf
sub_E504		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TalkingHead_AttachVoice_9CF7 (sub_9CF7 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-21.
; Met la tête parlante en mode voix : pilote du lecteur intégré (+21h,
; VoicePlayer_SetDriver_7A3D), charge la réplique arg_2 avec sa table de bouches pour la
; cadence arg_4 (VoicePlayer_LoadWithLipSync_7D52), +850h = 1 (réplique prête), compteur +84Eh
; = 0.
; ==============================================================================================
TalkingHead_AttachVoice_E535		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word_4CA5B
		mov	ax, si
		add	ax, 30h
		push	ax
		call	VoicePlayer_SetDriver_B978
		add	sp, 4
		push	[bp+arg_4]
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 30h
		push	ax
		call	sub_BD2F
		add	sp, 6
		mov	byte ptr [si+2Dh], 1
		mov	word ptr [si+2Bh], 0
		pop	si
		pop	bp
		retf
TalkingHead_AttachVoice_E535		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TalkingHead_SetBaseFrame_9D32 (sub_9D32 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-17. Image de base +2118 et image affichée +2124 = arg_2.
; ==============================================================================================
TalkingHead_SetBaseFrame_E56E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+21h], ax
		mov	[si+29h], ax
		pop	si
		pop	bp
		retf
TalkingHead_SetBaseFrame_E56E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E581		proc far

var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
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
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		cmp	word ptr [si+29h], 0FFFFh
		jz	short loc_E610
		mov	[bp+var_6], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		mov	ax, [si+29h]
		mov	[bp+var_A], ax
		cmp	[bp+var_A], 0FFFFh
		jz	short loc_E610
		push	[bp+var_A]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		jmp	short loc_E610

loc_E610:
		cmp	word ptr [si+25h], 0FFFFh
		jz	short loc_E65B
		mov	[bp+var_C], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_E], ax
		mov	ax, [si+25h]
		mov	[bp+var_10], ax
		cmp	[bp+var_10], 0FFFFh
		jz	short loc_E65B
		push	[bp+var_10]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_E]
		push	[bp+var_C]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		jmp	short loc_E65B

loc_E65B:
		mov	[bp+var_12], 0
		jmp	short loc_E67A

loc_E662:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_12]
		push	word ptr [bx+6]
		mov	bx, [bp+var_12]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_E67A:
		lea	ax, [bp+var_12]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_E662
		pop	di
		pop	si
		leave
		retf
sub_E581		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E694		proc far

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
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	[bp+arg_4]
		push	di
		push	si
		push	cs
		call	near ptr sub_E581
		add	sp, 6
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	1
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		mov	[bp+var_6], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		mov	ax, [si+23h]
		mov	[bp+var_A], ax
		cmp	[bp+var_A], 0FFFFh
		jz	short loc_E729
		push	[bp+var_A]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		jmp	short loc_E729

loc_E729:
		pop	di
		pop	si
		leave
		retf
sub_E694		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E72D		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 6
		pop	si
		leave
		retf
sub_E72D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E761		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+20h]
		add	sp, 6
		pop	si
		leave
		retf
sub_E761		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E78F		proc far

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	ax, word_4A6B6
		mov	[bp+var_4], ax
		mov	al, byte_4A6B8
		mov	[bp+var_2], al
		mov	word ptr [di+25h], 0FFFFh
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, eax, 1Eh
		mov	ebx, 8000h
		cdq
		idiv	ebx
		or	ax, ax
		jnz	short loc_E7D4
		cmp	byte ptr [di+2Fh], 0
		jz	short loc_E7D4
		mov	word ptr [di+29h], 0Ch
		jmp	short loc_E7DA

loc_E7D4:
		mov	ax, [di+21h]
		mov	[di+29h], ax

loc_E7DA:
		cmp	word ptr [di+21h], 14h
		jle	short loc_E7E6
		mov	ax, [di+21h]
		mov	[di+29h], ax

loc_E7E6:
		cmp	byte ptr [di+2Eh], 0
		jz	short loc_E82C
		mov	ax, di
		add	ax, 30h
		push	ax
		mov	bx, [di+30h]
		call	dword ptr [bx+4]
		add	sp, 2
		or	al, al
		jz	short loc_E809
		push	di
		push	cs
		call	near ptr sub_E46F
		add	sp, 2
		jmp	short loc_E816

loc_E809:
		mov	ax, 0FFFFh
		mov	[di+27h], ax
		mov	[di+25h], ax
		mov	byte ptr [di+2Eh], 0

loc_E816:
		cmp	word ptr [di+25h], 0FFFEh
		jnz	short loc_E829
		mov	byte ptr [di+2Eh], 0
		mov	ax, 0FFFFh
		mov	[di+27h], ax
		mov	[di+25h], ax

loc_E829:
		jmp	loc_E8E7

loc_E82C:
		cmp	word ptr [di+1Dh], 0
		jnz	short loc_E835
		jmp	loc_E8E7

loc_E835:
		mov	bx, [di+1Fh]
		mov	al, [bx]
		mov	byte ptr [bp+var_4], al
		or	al, al
		jnz	short loc_E844
		jmp	loc_E8E7

loc_E844:
		inc	word ptr [di+1Fh]
		mov	al, byte ptr [bp+var_4]
		cbw
		cmp	ax, 68h
		jz	short loc_E894
		jg	short loc_E85E
		cmp	ax, 63h
		jz	short loc_E8AB
		cmp	ax, 65h
		jz	short loc_E865
		jmp	short loc_E8BD

loc_E85E:
		cmp	ax, 74h
		jz	short loc_E899
		jmp	short loc_E8BD

loc_E865:
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 7Ah
		jg	short loc_E875
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 61h
		jge	short loc_E882

loc_E875:
		mov	bx, [di+1Fh]
		inc	word ptr [di+1Fh]
		mov	al, [bx]
		mov	byte ptr [bp+var_4], al
		jmp	short loc_E892

loc_E882:
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 72h
		jnz	short loc_E892
		mov	word ptr [di+25h], 6
		inc	word ptr [di+1Fh]

loc_E892:
		jmp	short loc_E8BD

loc_E894:
		inc	word ptr [di+1Fh]
		jmp	short loc_E8BD

loc_E899:
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 68h
		jnz	short loc_E8A9
		mov	word ptr [di+25h], 9
		inc	word ptr [di+1Fh]

loc_E8A9:
		jmp	short loc_E8BD

loc_E8AB:
		mov	bx, [di+1Fh]
		cmp	byte ptr [bx], 68h
		jnz	short loc_E8BB
		mov	word ptr [di+25h], 6
		inc	word ptr [di+1Fh]

loc_E8BB:
		jmp	short loc_E8BD

loc_E8BD:
		cmp	word ptr [di+25h], 0FFFFh
		jnz	short loc_E8E7
		cmp	byte ptr [bp+var_4], 61h
		jl	short loc_E8E7
		cmp	byte ptr [bp+var_4], 7Ah
		jg	short loc_E8E7
		mov	al, byte ptr [bp+var_4]
		cbw
		add	ax, word_4A6B2
		mov	bx, ax
		mov	al, [bx-61h]
		cbw
		add	ax, 0FFD0h
		mov	[di+25h], ax
		add	word ptr [di+25h], 2

loc_E8E7:
		push	di
		call	sub_33C79
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_E78F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E8F4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Dh], 0
		jz	short loc_E90E
		mov	bx, [si+1Fh]
		cmp	byte ptr [bx], 0
		jz	short loc_E90E
		mov	al, 0
		pop	si
		pop	bp
		retf

loc_E90E:
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_E8F4		endp

; START OF FUNCTION CHUNK FOR sub_E8F4
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_E8F4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E916		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_E928
		jmp	loc_E9A8

loc_E928:
		mov	word ptr [si], 1FB9h
		mov	word ptr [si+0Ah], 1FDDh
		push	word ptr [si+1Dh]
		call	sub_330E8
		add	sp, 2
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+30h], 129Fh
		mov	ax, si
		add	ax, 30h
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	byte ptr [si+45h], 0
		jz	short loc_E97A
		cmp	dword ptr [si+40h], 0
		jz	short loc_E97A
		push	0
		mov	al, [si+44h]
		push	ax
		mov	ax, si
		add	ax, 40h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_E97A

loc_E97A:
		mov	dword ptr [si+40h], 0
		mov	byte ptr [si+45h], 0
		mov	dword ptr [si+46h], 0
		push	0
		push	si
		call	sub_3410F
		add	sp, 4
		test	di, 1
		jz	short loc_E9A8
		push	si
		call	sub_39C
		add	sp, 2

loc_E9A8:
		pop	di
		pop	si
		pop	bp
		retf
sub_E916		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E9AC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_E9C8
		push	857h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_E9D9

loc_E9C8:
		push	si
		push	cs
		call	near ptr sub_E028
		add	sp, 2
		mov	word ptr [si], 1F71h
		mov	word ptr [si+0Ah], 1F95h

loc_E9D9:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_E9AC		endp

; START OF FUNCTION CHUNK FOR sub_E9AC
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_E9AC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E9E1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_E9FD
		push	857h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_EA15

loc_E9FD:
		push	0
		push	0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [si], 1F71h
		mov	word ptr [si+0Ah], 1F95h

loc_EA15:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_E9E1		endp

; START OF FUNCTION CHUNK FOR sub_E9E1
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_E9E1

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EA1D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_EA39
		push	857h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_EA53

loc_EA39:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [si], 1F71h
		mov	word ptr [si+0Ah], 1F95h

loc_EA53:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_EA1D		endp

; START OF FUNCTION CHUNK FOR sub_EA1D
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_EA1D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EA5B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_EA77
		push	857h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_EAC2

loc_EA77:
		push	si
		push	cs
		call	near ptr sub_E028
		add	sp, 2
		mov	word ptr [si], 1F71h
		mov	word ptr [si+0Ah], 1F95h
		xor	ax, ax
		mov	[si+1Dh], ax
		mov	[si+1Fh], ax
		mov	ax, 0FFFFh
		mov	[si+21h], ax
		mov	[si+29h], ax
		mov	[si+25h], ax
		mov	word ptr [si+2Bh], 0
		mov	word ptr [si+23h], 22h
		mov	byte ptr [si+2Dh], 0
		mov	byte ptr [si+2Eh], 0
		mov	byte ptr [si+2Fh], 1
		mov	word ptr [si+27h], 0FFFFh
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_E314
		add	sp, 4

loc_EAC2:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_EA5B		endp

; START OF FUNCTION CHUNK FOR sub_EA5B
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_EA5B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EACA		proc far

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
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		cmp	word ptr [si+25h], 0FFFFh
		jz	short loc_EB59
		mov	[bp+var_6], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		mov	ax, [si+25h]
		mov	[bp+var_A], ax
		cmp	[bp+var_A], 0FFFFh
		jz	short loc_EB59
		push	[bp+var_A]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		jmp	short loc_EB59

loc_EB59:
		mov	[bp+var_C], 0
		jmp	short loc_EB78

loc_EB60:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_C]
		push	word ptr [bx+6]
		mov	bx, [bp+var_C]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_EB78:
		lea	ax, [bp+var_C]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_EB60
		pop	di
		pop	si
		leave
		retf
sub_EACA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EB92		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_EACA
		add	sp, 6
		pop	si
		leave
		retf
sub_EB92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EBC5		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_EACA
		add	sp, 6
		pop	si
		leave
		retf
sub_EBC5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EBF2		proc far

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, word_4A6B9
		mov	[bp+var_4], ax
		mov	al, byte_4A6BB
		mov	[bp+var_2], al
		mov	word ptr [si+25h], 0FFFFh
		cmp	byte ptr [si+2Eh], 0
		jz	short loc_EC53
		mov	ax, si
		add	ax, 30h
		push	ax
		mov	bx, [si+30h]
		call	dword ptr [bx+4]
		add	sp, 2
		or	al, al
		jz	short loc_EC39
		mov	ax, si
		add	ax, 30h
		push	ax
		call	VoicePlayer_GetLipFrame_C7A2
		add	sp, 2
		mov	[si+25h], ax
		jmp	short loc_EC42

loc_EC39:
		mov	word ptr [si+25h], 0FFFFh
		mov	byte ptr [si+2Eh], 0

loc_EC42:
		cmp	word ptr [si+25h], 0FFFEh
		jnz	short loc_EC51
		mov	byte ptr [si+2Eh], 0
		mov	word ptr [si+25h], 0FFFFh

loc_EC51:
		jmp	short loc_EC8F

loc_EC53:
		cmp	word ptr [si+1Dh], 0
		jz	short loc_EC8F
		mov	bx, [si+1Fh]
		mov	al, [bx]
		cmp	al, byte ptr [bp+var_4]
		jnz	short loc_EC8F
		inc	word ptr [si+1Fh]
		cmp	word ptr [si+25h], 0FFFFh
		jnz	short loc_EC8F
		cmp	byte ptr [bp+var_4], 61h
		jl	short loc_EC8F
		cmp	byte ptr [bp+var_4], 7Ah
		jg	short loc_EC8F
		mov	al, byte ptr [bp+var_4]
		cbw
		add	ax, word_4A6B4
		mov	bx, ax
		mov	al, [bx-61h]
		cbw
		add	ax, 0FFD0h
		mov	[si+25h], ax
		inc	word ptr [si+25h]

loc_EC8F:
		push	si
		call	sub_33C79
		add	sp, 2
		pop	si
		leave
		retf
sub_EBF2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EC9B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_ECB6
		push	1Dh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_ED11

loc_ECB6:
		mov	word ptr [si], 2021h
		mov	word ptr [si+4], 2019h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 201Dh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1FEDh
		mov	word ptr [si+0Ah], 1FF9h
		mov	word ptr [si+0Ah], 2009h
		mov	word ptr [si], 2041h
		mov	word ptr [si+0Ah], 2061h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1F41h
		mov	word ptr [si+0Ah], 1F61h
		mov	word ptr [si+1Bh], 1

loc_ED11:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_EC9B		endp

; START OF FUNCTION CHUNK FOR sub_EC9B
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_EC9B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ED19		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_ED34
		push	1Dh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_ED4E

loc_ED34:
		push	[bp+arg_2]
		push	si
		call	Layer_ConstructAtOrigin_33EE1
		add	sp, 4
		mov	word ptr [si], 1F41h
		mov	word ptr [si+0Ah], 1F61h
		mov	word ptr [si+1Bh], 1

loc_ED4E:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_ED19		endp

; START OF FUNCTION CHUNK FOR sub_ED19
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_ED19

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à OverlayAnimLayer_Construct_A505 (sub_A505 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-17. Animation jouée par-dessus l'image 0 de sa ressource :
; Layer_Construct_2DF9B, vtable dseg 6139, image +27 = 1 au départ.
; ==============================================================================================
OverlayAnimLayer_Construct_ED56		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_ED71
		push	1Dh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_ED91

loc_ED71:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [si], 1F41h
		mov	word ptr [si+0Ah], 1F61h
		mov	word ptr [si+1Bh], 1

loc_ED91:
		mov	ax, si
		pop	si
		pop	bp
		retf
OverlayAnimLayer_Construct_ED56		endp

; START OF FUNCTION CHUNK FOR OverlayAnimLayer_Construct_ED56
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR OverlayAnimLayer_Construct_ED56

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ED99		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		push	si
		call	Layer_DrawAtOwnPos_3424E
		add	sp, 2
		pop	si
		leave
		retf
sub_ED99		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EE00		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_EE49
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_38B8C
		dec	ax
		cmp	ax, [si+1Bh]
		jbe	short loc_EE49
		inc	word ptr [si+1Bh]

loc_EE49:
		push	si
		call	sub_33C79
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_EE00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EE55		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_EE70
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_EED9

loc_EE70:
		mov	word ptr [si], 2021h
		mov	word ptr [si+4], 2019h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 201Dh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1FEDh
		mov	word ptr [si+0Ah], 1FF9h
		mov	word ptr [si+0Ah], 2009h
		mov	word ptr [si], 2041h
		mov	word ptr [si+0Ah], 2061h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1F11h
		mov	word ptr [si+0Ah], 1F31h

loc_EED9:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_EE55		endp

; START OF FUNCTION CHUNK FOR sub_EE55
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_EE55

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_EEE1		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_EEFF
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_EF2D

loc_EEFF:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	Layer_ConstructAtOrigin_33EE1
		add	sp, 4
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1F11h
		mov	word ptr [si+0Ah], 1F31h

loc_EF2D:
		mov	ax, si
		pop	si
		leave
		retf
sub_EEE1		endp

; START OF FUNCTION CHUNK FOR sub_EEE1
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_EEE1

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ClippedMovingLayer_Construct_B3F8 (sub_B3F8 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-17. Calque mobile (vitesse +29/+31 = 0) dessiné dans un rectangle de découpe (41
; octets ; vtable dseg 5703). Le rectangle +33 gauche, +35 haut, +37 droite, +39 bas est écrit
; par l'appelant après création (mid1 : 131, 9, 190, 67). Dessin : ClippedLayer_Draw_B563 ;
; avance : MovingLayer_Advance_2E2D1.
; ==============================================================================================
ClippedMovingLayer_Construct_EF35		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_EF53
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_EF93

loc_EF53:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1F11h
		mov	word ptr [si+0Ah], 1F31h

loc_EF93:
		mov	ax, si
		pop	si
		leave
		retf
ClippedMovingLayer_Construct_EF35		endp

; START OF FUNCTION CHUNK FOR ClippedMovingLayer_Construct_EF35
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR ClippedMovingLayer_Construct_EF35

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ClippedMovingImageLayer_Construct_B45E (sub_B45E de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-17. Comme ClippedMovingLayer_Construct_B3F8, mais sur ImageLayer_Construct_2E02C
; (numéro d'image arg_8).
; ==============================================================================================
ClippedMovingImageLayer_Construct_EF9B		proc far

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
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_EFB9
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F002

loc_EFB9:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1F11h
		mov	word ptr [si+0Ah], 1F31h

loc_F002:
		mov	ax, si
		pop	si
		leave
		retf
ClippedMovingImageLayer_Construct_EF9B		endp

; START OF FUNCTION CHUNK FOR ClippedMovingImageLayer_Construct_EF9B
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR ClippedMovingImageLayer_Construct_EF9B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F00A		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F028
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F080

loc_F028:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_A], ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp+var_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_A]
		mov	[si+1Fh], ax
		mov	word ptr [si], 1F11h
		mov	word ptr [si+0Ah], 1F31h

loc_F080:
		mov	ax, si
		pop	si
		leave
		retf
sub_F00A		endp

; START OF FUNCTION CHUNK FOR sub_F00A
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_F00A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F088		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F0A6
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F107

loc_F0A6:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_C]
		mov	[bp+var_C], ax
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp+var_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_A]
		mov	[si+1Fh], ax
		mov	word ptr [si], 1F11h
		mov	word ptr [si+0Ah], 1F31h

loc_F107:
		mov	ax, si
		pop	si
		leave
		retf
sub_F088		endp

; START OF FUNCTION CHUNK FOR sub_F088
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_F088

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F10F		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		push	si
		call	Layer_DrawAtOwnPos_3424E
		add	sp, 2
		pop	si
		leave
		retf
sub_F10F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F176		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F191
		push	1Dh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F1E7

loc_F191:
		mov	word ptr [si], 2021h
		mov	word ptr [si+4], 2019h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 201Dh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1FEDh
		mov	word ptr [si+0Ah], 1FF9h
		mov	word ptr [si+0Ah], 2009h
		mov	word ptr [si], 2041h
		mov	word ptr [si+0Ah], 2061h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1EE1h
		mov	word ptr [si+0Ah], 1F01h

loc_F1E7:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_F176		endp

; START OF FUNCTION CHUNK FOR sub_F176
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_F176

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F1EF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F20A
		push	1Dh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F21F

loc_F20A:
		push	[bp+arg_2]
		push	si
		call	Layer_ConstructAtOrigin_33EE1
		add	sp, 4
		mov	word ptr [si], 1EE1h
		mov	word ptr [si+0Ah], 1F01h

loc_F21F:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_F1EF		endp

; START OF FUNCTION CHUNK FOR sub_F1EF
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_F1EF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (18 sur
; 18), à OverlayImageLayer_Construct_A9D6 (sub_A9D6 de OPTEST.EXE). Code non comparé
; instruction par instruction. — far, LUE 2026-10-17. Image fixe posée sur l'image 0 de sa
; propre ressource : ImageLayer_Construct_2E02C, vtable dseg 6043, dessin
; OverlayLayer_Draw_AA17, avance de base Layer_Advance_2E2C3.
; ==============================================================================================
OverlayImageLayer_Construct_F227		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F242
		push	1Dh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F260

loc_F242:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [si], 1EE1h
		mov	word ptr [si+0Ah], 1F01h

loc_F260:
		mov	ax, si
		pop	si
		pop	bp
		retf
OverlayImageLayer_Construct_F227		endp

; START OF FUNCTION CHUNK FOR OverlayImageLayer_Construct_F227
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR OverlayImageLayer_Construct_F227

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F268		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		push	si
		call	Layer_DrawAtOwnPos_3424E
		add	sp, 2
		pop	si
		leave
		retf
sub_F268		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F2CF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F2EA
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F340

loc_F2EA:
		mov	word ptr [si], 2021h
		mov	word ptr [si+4], 2019h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 201Dh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1FEDh
		mov	word ptr [si+0Ah], 1FF9h
		mov	word ptr [si+0Ah], 2009h
		mov	word ptr [si], 2041h
		mov	word ptr [si+0Ah], 2061h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1EB1h
		mov	word ptr [si+0Ah], 1ED1h

loc_F340:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_F2CF		endp

; START OF FUNCTION CHUNK FOR sub_F2CF
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_F2CF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F348		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F363
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F3B4

loc_F363:
		push	[bp+arg_2]
		push	si
		call	Layer_ConstructAtOrigin_33EE1
		add	sp, 4
		mov	word ptr [si], 1EB1h
		mov	word ptr [si+0Ah], 1ED1h
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_38B8C
		mov	[si+1Eh], ax
		cmp	word ptr [si+1Eh], 1
		jle	short loc_F3B0
		cmp	byte ptr [si+20h], 33h
		jle	short loc_F3B0
		mov	byte ptr [si+1Dh], 1
		mov	word ptr [si+1Bh], 1
		jmp	short loc_F3B4

loc_F3B0:
		mov	byte ptr [si+1Dh], 0

loc_F3B4:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_F348		endp

; START OF FUNCTION CHUNK FOR sub_F348
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_F348

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ConvFigure_ConstructExtra_AB6B (sub_AB6B de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-22. Figurant d'une scène de groupe (commande 01h) : Layer_Construct_2DF9B (21h
; octets), tables 176Bh / 178Bh ; [+20h] = dernier caractère du nom de figure. Si la forme a
; plus d'une image et que ce caractère est > « 3 », mode animé ([+1Dh] = 1, image [+1Bh] = 1).
; Dessin loc_ABEB : image 0, puis en mode animé l'image courante ; avance loc_AC58 : image 1 à
; n − 1 en boucle.
; ==============================================================================================
ConvFigure_ConstructExtra_F3BC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F3D7
		push	21h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F434

loc_F3D7:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [si], 1EB1h
		mov	word ptr [si+0Ah], 1ED1h
		mov	al, [bp+arg_8]
		mov	[si+20h], al
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_38B8C
		mov	[si+1Eh], ax
		cmp	word ptr [si+1Eh], 1
		jle	short loc_F430
		cmp	byte ptr [si+20h], 33h
		jle	short loc_F430
		mov	byte ptr [si+1Dh], 1
		mov	word ptr [si+1Bh], 1
		jmp	short loc_F434

loc_F430:
		mov	byte ptr [si+1Dh], 0

loc_F434:
		mov	ax, si
		pop	si
		pop	bp
		retf
ConvFigure_ConstructExtra_F3BC		endp

; START OF FUNCTION CHUNK FOR ConvFigure_ConstructExtra_F3BC
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR ConvFigure_ConstructExtra_F3BC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F43C		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_F4A6
		push	si
		call	Layer_DrawAtOwnPos_3424E
		add	sp, 2

loc_F4A6:
		pop	si
		leave
		retf
sub_F43C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F4A9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_F4C9
		mov	ax, [si+1Eh]
		dec	ax
		cmp	ax, [si+1Bh]
		jbe	short loc_F4C4
		inc	word ptr [si+1Bh]
		jmp	short loc_F4C9

loc_F4C4:
		mov	word ptr [si+1Bh], 1

loc_F4C9:
		push	si
		call	sub_33C79
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_F4A9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F4D5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F4F0
		push	15h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F53A

loc_F4F0:
		mov	word ptr [si], 2021h
		mov	word ptr [si+4], 2019h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 201Dh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1FEDh
		mov	word ptr [si+0Ah], 1FF9h
		mov	word ptr [si+0Ah], 2009h
		mov	word ptr [si], 1E81h
		mov	word ptr [si+0Ah], 1EA1h
		mov	ax, [bp+arg_2]
		mov	[si+11h], ax
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	word ptr [si+13h], 0

loc_F53A:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_F4D5		endp

; START OF FUNCTION CHUNK FOR sub_F4D5
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_F4D5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextLayer_Construct_ACF1 (sub_ACF1 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-21.
; Calque de texte (15h octets, alloué si nul, tables 173Bh / 175Bh) : zone de texte +11h =
; arg_2, x +0Ch = arg_4, y +0Eh = arg_6, chaîne +13h = 0. Dessin sub_ADC7 : si la chaîne ≠ 0,
; Widget_RenderComplexLayoutWrapper_31A3B(zone, format dseg 15E0h « X%Y%S », x, y, chaîne),
; puis les enfants. mid33 : inscriptions de la pierre tombale (noms du joueur).
; ==============================================================================================
TextLayer_Construct_F542		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F560
		push	15h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F5B8

loc_F560:
		mov	word ptr [si], 2021h
		mov	word ptr [si+4], 2019h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 201Dh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1FEDh
		mov	word ptr [si+0Ah], 1FF9h
		mov	word ptr [si+0Ah], 2009h
		mov	word ptr [si], 1E81h
		mov	word ptr [si+0Ah], 1EA1h
		mov	ax, [bp+arg_2]
		mov	[si+11h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_4]
		mov	[si+0Eh], ax
		mov	word ptr [si+13h], 0

loc_F5B8:
		mov	ax, si
		pop	si
		leave
		retf
TextLayer_Construct_F542		endp

; START OF FUNCTION CHUNK FOR TextLayer_Construct_F542
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR TextLayer_Construct_F542

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F5C0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_F5FC
		mov	word ptr [si], 1E81h
		mov	word ptr [si+0Ah], 1EA1h
		push	si
		push	si
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		push	0
		push	si
		call	sub_33B9D
		add	sp, 4
		test	di, 1
		jz	short loc_F5FC
		push	si
		call	sub_39C
		add	sp, 2

loc_F5FC:
		pop	di
		pop	si
		pop	bp
		retf
sub_F5C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F600		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_F600		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à TextLayer_SetText_ADB7
; (sub_ADB7 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-21. Pose la chaîne d'un TextLayer : [arg_0 + 13h] = arg_2 (pointeur
; proche).
; ==============================================================================================
TextLayer_SetText_F608		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+13h], ax
		pop	si
		pop	bp
		retf
TextLayer_SetText_F608		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F618		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+13h], 0
		jz	short loc_F641
		push	word ptr [si+13h]
		push	[bp+arg_4]
		push	di
		push	1D26h
		push	word ptr [si+11h]
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah

loc_F641:
		mov	[bp+var_2], 0
		jmp	short loc_F660

loc_F648:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bp+var_2]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_F660:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_F648
		pop	di
		pop	si
		leave
		retf
sub_F618		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F67A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_F69D
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 2
		add	ax, [si+0Ch]
		pop	si
		pop	bp
		retf
		jmp	short loc_F6A3

loc_F69D:
		mov	ax, [si+0Ch]
		pop	si
		pop	bp
		retf
sub_F67A		endp

; START OF FUNCTION CHUNK FOR sub_F67A

loc_F6A3:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_F67A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F6A6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_F6C9
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2
		add	ax, [si+0Eh]
		pop	si
		pop	bp
		retf
		jmp	short loc_F6CF

loc_F6C9:
		mov	ax, [si+0Eh]
		pop	si
		pop	bp
		retf
sub_F6A6		endp

; START OF FUNCTION CHUNK FOR sub_F6A6

loc_F6CF:
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_F6A6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F6D2		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_F618
		add	sp, 6
		pop	si
		leave
		retf
sub_F6D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F705		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_F618
		add	sp, 6
		pop	si
		leave
		retf
sub_F705		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F732		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_33C79
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_F732		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F745		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F760
		push	17h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F77A

loc_F760:
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_F4D5
		add	sp, 4
		mov	word ptr [si], 1E51h
		mov	word ptr [si+0Ah], 1E71h
		mov	ax, [bp+arg_4]
		mov	[si+15h], ax

loc_F77A:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_F745		endp

; START OF FUNCTION CHUNK FOR sub_F745
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_F745

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F782		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+15h]
		mov	[bp+var_2], ax
		mov	bx, [si+11h]
		mov	ax, [bp+var_2]
		mov	[bx+14h], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp+var_4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp+var_6], ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr sub_F618
		add	sp, 6
		pop	si
		leave
		retf
sub_F782		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F7C4		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+15h]
		mov	[bp+var_2], ax
		mov	bx, [si+11h]
		mov	ax, [bp+var_2]
		mov	[bx+14h], ax
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	si
		push	cs
		call	near ptr sub_F618
		add	sp, 6
		pop	si
		leave
		retf
sub_F7C4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F800		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F81B
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F875

loc_F81B:
		mov	word ptr [si], 2021h
		mov	word ptr [si+4], 2019h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 201Dh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1FEDh
		mov	word ptr [si+0Ah], 1FF9h
		mov	word ptr [si+0Ah], 2009h
		mov	word ptr [si], 2041h
		mov	word ptr [si+0Ah], 2061h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 1E21h
		mov	word ptr [si+0Ah], 1E41h
		mov	byte ptr [si+1Dh], 0

loc_F875:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_F800		endp

; START OF FUNCTION CHUNK FOR sub_F800
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_F800

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F87D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F898
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F8B1

loc_F898:
		push	[bp+arg_2]
		push	si
		call	Layer_ConstructAtOrigin_33EE1
		add	sp, 4
		mov	word ptr [si], 1E21h
		mov	word ptr [si+0Ah], 1E41h
		mov	byte ptr [si+1Dh], 0

loc_F8B1:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_F87D		endp

; START OF FUNCTION CHUNK FOR sub_F87D
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_F87D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TriggeredAnimLayer_Construct_B068 (sub_B068 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-17. Animation à déclenchement : ImageLayer_Construct_2E02C (image de départ
; arg_8), vtable dseg 5851, drapeau de lecture +29 = 0. L'appelant pose +29 pour lancer
; l'animation.
; ==============================================================================================
TriggeredAnimLayer_Construct_F8B9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F8D4
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F8F6

loc_F8D4:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [si], 1E21h
		mov	word ptr [si+0Ah], 1E41h
		mov	byte ptr [si+1Dh], 0

loc_F8F6:
		mov	ax, si
		pop	si
		pop	bp
		retf
TriggeredAnimLayer_Construct_F8B9		endp

; START OF FUNCTION CHUNK FOR TriggeredAnimLayer_Construct_F8B9
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR TriggeredAnimLayer_Construct_F8B9

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F8FE		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_F93B
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_38B8C
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		dec	ax
		cmp	[si+1Bh], ax
		jnb	short loc_F93B
		inc	word ptr [si+1Bh]

loc_F93B:
		push	si
		call	sub_3430F
		add	sp, 2
		pop	si
		leave
		retf
sub_F8FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F947		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_38B8C
		dec	ax
		cmp	ax, [si+1Bh]
		jnz	short loc_F977
		mov	ax, 1
		jmp	short loc_F979

loc_F977:
		xor	ax, ax

loc_F979:
		pop	si
		pop	bp
		retf
sub_F947		endp

; START OF FUNCTION CHUNK FOR sub_F947
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_F947

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (8 sur
; 8), à JitterImageLayer_Construct_B12E (sub_B12E de OPTEST.EXE). Code non comparé instruction
; par instruction. — far, LUE 2026-10-17. Image fixe (ImageLayer_Construct_2E02C) qui tremble
; : vtable dseg 5803, avance = JitterImageLayer_Advance_B16F.
; ==============================================================================================
JitterImageLayer_Construct_F97F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_F99A
		push	1Dh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_F9B8

loc_F99A:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [si], 1DF1h
		mov	word ptr [si+0Ah], 1E11h

loc_F9B8:
		mov	ax, si
		pop	si
		pop	bp
		retf
JitterImageLayer_Construct_F97F		endp

; START OF FUNCTION CHUNK FOR JitterImageLayer_Construct_F97F
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR JitterImageLayer_Construct_F97F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_F9C0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		call	CRT_Rand
		test	ax, 1
		jz	short loc_F9F3
		call	CRT_Rand
		test	ax, 1
		jz	short loc_F9E8
		call	CRT_Rand
		and	ax, 1
		add	[si+0Eh], ax
		jmp	short loc_F9F3

loc_F9E8:
		call	CRT_Rand
		and	ax, 1
		sub	[si+0Eh], ax

loc_F9F3:
		call	CRT_Rand
		test	ax, 1
		jz	short loc_FA1F
		call	CRT_Rand
		test	ax, 1
		jz	short loc_FA14
		call	CRT_Rand
		and	ax, 1
		add	[si+0Ch], ax
		jmp	short loc_FA1F

loc_FA14:
		call	CRT_Rand
		and	ax, 1
		sub	[si+0Ch], ax

loc_FA1F:
		push	si
		call	sub_3430F
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_F9C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_FA2B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_FA47
		push	855h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_FA58

loc_FA47:
		push	si
		push	cs
		call	near ptr sub_E028
		add	sp, 2
		mov	word ptr [si], 1DBDh
		mov	word ptr [si+0Ah], 1DE1h

loc_FA58:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_FA2B		endp

; START OF FUNCTION CHUNK FOR sub_FA2B
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_FA2B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (15 sur
; 15), à TalkingHeadOverlay_Construct_B20F (sub_B20F de OPTEST.EXE). Code non comparé
; instruction par instruction. — far, LUE 2026-10-17. Tête parlante
; (TalkingHead_Construct_98F4) dont le dessin ajoute deux images fixes : vtable dseg 5751,
; dessin TalkingHeadOverlay_DrawAt_B28E. mid1 : ressource chargée par sub_C38E sous le nom «
; air » (« pri » dans optest.asm : octets modifiés par Rémi, « air » à l'origine), position
; (160, 128), image de base 31 ou 27 (TalkingHead_SetBaseFrame_9D32).
; ==============================================================================================
TalkingHeadOverlay_Construct_FA60		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_FA7C
		push	855h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_FA96

loc_FA7C:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr TalkingHead_Construct_E108
		add	sp, 8
		mov	word ptr [si], 1DBDh
		mov	word ptr [si+0Ah], 1DE1h

loc_FA96:
		mov	ax, si
		pop	si
		pop	bp
		retf
TalkingHeadOverlay_Construct_FA60		endp

; START OF FUNCTION CHUNK FOR TalkingHeadOverlay_Construct_FA60
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR TalkingHeadOverlay_Construct_FA60

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_FA9E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_FABA
		push	855h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_FAD7

loc_FABA:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_E296
		add	sp, 0Ah
		mov	word ptr [si], 1DBDh
		mov	word ptr [si+0Ah], 1DE1h

loc_FAD7:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_FA9E		endp

; START OF FUNCTION CHUNK FOR sub_FA9E
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_FA9E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_FADF		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	[bp+arg_4]
		push	di
		push	si
		push	cs
		call	near ptr sub_E581
		add	sp, 6
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	23h
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		mov	[bp+var_6], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		push	26h
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_FADF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_FB69		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_FB84
		push	29h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_FBED

loc_FB84:
		mov	word ptr [si], 2021h
		mov	word ptr [si+4], 2019h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 201Dh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1FEDh
		mov	word ptr [si+0Ah], 1FF9h
		mov	word ptr [si+0Ah], 2009h
		mov	word ptr [si], 2041h
		mov	word ptr [si+0Ah], 2061h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1D8Dh
		mov	word ptr [si+0Ah], 1DADh

loc_FBED:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_FB69		endp

; START OF FUNCTION CHUNK FOR sub_FB69
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_FB69

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_FBF5		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_FC13
		push	29h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_FC41

loc_FC13:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	Layer_ConstructAtOrigin_33EE1
		add	sp, 4
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1D8Dh
		mov	word ptr [si+0Ah], 1DADh

loc_FC41:
		mov	ax, si
		pop	si
		leave
		retf
sub_FBF5		endp

; START OF FUNCTION CHUNK FOR sub_FBF5
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_FBF5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ClippedMovingLayer_Construct_B3F8 (sub_B3F8 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-17. Calque mobile (vitesse +29/+31 = 0) dessiné dans un rectangle de découpe (41
; octets ; vtable dseg 5703). Le rectangle +33 gauche, +35 haut, +37 droite, +39 bas est écrit
; par l'appelant après création (mid1 : 131, 9, 190, 67). Dessin : ClippedLayer_Draw_B563 ;
; avance : MovingLayer_Advance_2E2D1.
; ==============================================================================================
ClippedMovingLayer_Construct_FC49		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_FC67
		push	29h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_FCA7

loc_FC67:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1D8Dh
		mov	word ptr [si+0Ah], 1DADh

loc_FCA7:
		mov	ax, si
		pop	si
		leave
		retf
ClippedMovingLayer_Construct_FC49		endp

; START OF FUNCTION CHUNK FOR ClippedMovingLayer_Construct_FC49
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR ClippedMovingLayer_Construct_FC49

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ClippedMovingImageLayer_Construct_B45E (sub_B45E de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-17. Comme ClippedMovingLayer_Construct_B3F8, mais sur ImageLayer_Construct_2E02C
; (numéro d'image arg_8).
; ==============================================================================================
ClippedMovingImageLayer_Construct_FCAF		proc far

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
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_FCCD
		push	29h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_FD16

loc_FCCD:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1D8Dh
		mov	word ptr [si+0Ah], 1DADh

loc_FD16:
		mov	ax, si
		pop	si
		leave
		retf
ClippedMovingImageLayer_Construct_FCAF		endp

; START OF FUNCTION CHUNK FOR ClippedMovingImageLayer_Construct_FCAF
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR ClippedMovingImageLayer_Construct_FCAF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ClippedLayer_DrawAt_B4CD (sub_B4CD de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Crée un contexte de dessin temporaire sur la surface word_46F44 (sub_2E9A4) limité au
; rectangle +33/+35/+37/+39, y dessine l'image +27 de la ressource en (x, y) (sub_32CD8), puis
; libère le contexte (TextFormat_ReleaseStyleList_2EBFA). Les enfants ne sont pas dessinés.
; ==============================================================================================
ClippedLayer_DrawAt_FD1E		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
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
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, word_4D36C
		mov	[bp+var_2], ax
		mov	[bp+var_18], 0
		mov	[bp+var_16], 0
		push	[bp+var_2]
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	ax, [si+21h]
		mov	[bp+var_4], ax
		mov	ax, [si+23h]
		mov	[bp+var_6], ax
		mov	ax, [si+25h]
		mov	[bp+var_8], ax
		mov	ax, [si+27h]
		mov	[bp+var_A], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_14], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_12], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_A]
		mov	[bp+var_E], ax
		push	word ptr [si+1Bh]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		lea	ax, [bp+var_18]
		push	ax
		call	sub_38514
		add	sp, 0Ch
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	si
		leave
		retf
ClippedLayer_DrawAt_FD1E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_FDB4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		push	si
		push	cs
		call	near ptr ClippedLayer_DrawAt_FD1E
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_FDB4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ToggleLayer_Construct_B57B (sub_B57B de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Transition à deux sens sur 14 étapes (30 octets, vtable dseg 5655) : Layer_Construct_2DF9B,
; sens +29 = arg_8 ; étape +27 = 0 si le sens est posé, 13 sinon.
; ==============================================================================================
ToggleLayer_Construct_FDCC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_FDE7
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_FE1A

loc_FDE7:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [si], 1D5Dh
		mov	word ptr [si+0Ah], 1D7Dh
		mov	al, [bp+arg_8]
		mov	[si+1Dh], al
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_FE15
		mov	word ptr [si+1Bh], 0
		jmp	short loc_FE1A

loc_FE15:
		mov	word ptr [si+1Bh], 0Dh

loc_FE1A:
		mov	ax, si
		pop	si
		pop	bp
		retf
ToggleLayer_Construct_FDCC		endp

; START OF FUNCTION CHUNK FOR ToggleLayer_Construct_FDCC
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR ToggleLayer_Construct_FDCC

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ToggleLayer_DrawAt_B5D1 (sub_B5D1 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Dessin selon l'étape t (+27) : t < 4 : image 0 ; t > 8 : image 13 ; puis t = 12 : image 1,
; sinon image t. Les enfants ne sont pas dessinés.
; ==============================================================================================
ToggleLayer_DrawAt_FE22		proc far

var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
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
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+1Bh], 4
		jnb	short loc_FE6C
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch

loc_FE6C:
		cmp	word ptr [si+1Bh], 8
		jbe	short loc_FEA8
		mov	[bp+var_6], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		push	0Dh
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch

loc_FEA8:
		cmp	word ptr [si+1Bh], 0Ch
		jnz	short loc_FEE6
		mov	[bp+var_A], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		push	1
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_C]
		push	[bp+var_A]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		jmp	short loc_FF2B

loc_FEE6:
		mov	[bp+var_E], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_10], ax
		mov	ax, [si+1Bh]
		mov	[bp+var_12], ax
		cmp	[bp+var_12], 0FFFFh
		jz	short loc_FF2B
		push	[bp+var_12]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_10]
		push	[bp+var_E]
		push	word_4D36C
		call	sub_38514
		add	sp, 0Ch
		jmp	short loc_FF2B

loc_FF2B:
		pop	di
		pop	si
		leave
		retf
ToggleLayer_DrawAt_FE22		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_FF2F		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr ToggleLayer_DrawAt_FE22
		add	sp, 6
		pop	si
		leave
		retf
sub_FF2F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_FF62		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr ToggleLayer_DrawAt_FE22
		add	sp, 6
		pop	si
		leave
		retf
sub_FF62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_FF8F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_FFA7
		cmp	word ptr [si+1Bh], 0Dh
		jnb	short loc_FFA5
		inc	word ptr [si+1Bh]

loc_FFA5:
		jmp	short loc_FFB0

loc_FFA7:
		cmp	word ptr [si+1Bh], 0
		jbe	short loc_FFB0
		dec	word ptr [si+1Bh]

loc_FFB0:
		pop	si
		pop	bp
		retf
sub_FF8F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_FFB3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_FFCE
		push	23h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_10037

loc_FFCE:
		mov	word ptr [si], 2021h
		mov	word ptr [si+4], 2019h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 201Dh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1FEDh
		mov	word ptr [si+0Ah], 1FF9h
		mov	word ptr [si+0Ah], 2009h
		mov	word ptr [si], 2041h
		mov	word ptr [si+0Ah], 2061h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1D2Dh
		mov	word ptr [si+0Ah], 1D4Dh

loc_10037:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_FFB3		endp

; START OF FUNCTION CHUNK FOR sub_FFB3
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_FFB3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1003F		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_1005D
		push	23h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_1008B

loc_1005D:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	Layer_ConstructAtOrigin_33EE1
		add	sp, 4
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1D2Dh
		mov	word ptr [si+0Ah], 1D4Dh

loc_1008B:
		mov	ax, si
		pop	si
		leave
		retf
sub_1003F		endp

; START OF FUNCTION CHUNK FOR sub_1003F
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_1003F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ClippedMovingLayer_Construct_B3F8 (sub_B3F8 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-17. Calque mobile (vitesse +29/+31 = 0) dessiné dans un rectangle de découpe (41
; octets ; vtable dseg 5703). Le rectangle +33 gauche, +35 haut, +37 droite, +39 bas est écrit
; par l'appelant après création (mid1 : 131, 9, 190, 67). Dessin : ClippedLayer_Draw_B563 ;
; avance : MovingLayer_Advance_2E2D1.
; ==============================================================================================
ClippedMovingLayer_Construct_10093		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_100B1
		push	23h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_100F1

loc_100B1:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1D2Dh
		mov	word ptr [si+0Ah], 1D4Dh

loc_100F1:
		mov	ax, si
		pop	si
		leave
		retf
ClippedMovingLayer_Construct_10093		endp

; START OF FUNCTION CHUNK FOR ClippedMovingLayer_Construct_10093
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR ClippedMovingLayer_Construct_10093

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ClippedMovingImageLayer_Construct_B45E (sub_B45E de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-17. Comme ClippedMovingLayer_Construct_B3F8, mais sur ImageLayer_Construct_2E02C
; (numéro d'image arg_8).
; ==============================================================================================
ClippedMovingImageLayer_Construct_100F9		proc far

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
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_10117
		push	23h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_10160

loc_10117:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si], 1D2Dh
		mov	word ptr [si+0Ah], 1D4Dh

loc_10160:
		mov	ax, si
		pop	si
		leave
		retf
ClippedMovingImageLayer_Construct_100F9		endp

; START OF FUNCTION CHUNK FOR ClippedMovingImageLayer_Construct_100F9
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR ClippedMovingImageLayer_Construct_100F9

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10168		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_10186
		push	23h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_101DE

loc_10186:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_A], ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp+var_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_A]
		mov	[si+1Fh], ax
		mov	word ptr [si], 1D2Dh
		mov	word ptr [si+0Ah], 1D4Dh

loc_101DE:
		mov	ax, si
		pop	si
		leave
		retf
sub_10168		endp

; START OF FUNCTION CHUNK FOR sub_10168
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_10168

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_101E6		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_10204
		push	23h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_10265

loc_10204:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_C]
		mov	[bp+var_C], ax
		push	[bp+var_C]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		mov	word ptr [si+1Dh], 0
		mov	word ptr [si+1Fh], 0
		mov	ax, [bp+var_8]
		mov	[si+1Dh], ax
		mov	ax, [bp+var_A]
		mov	[si+1Fh], ax
		mov	word ptr [si], 1D2Dh
		mov	word ptr [si+0Ah], 1D4Dh

loc_10265:
		mov	ax, si
		pop	si
		leave
		retf
sub_101E6		endp

; START OF FUNCTION CHUNK FOR sub_101E6
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_101E6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; MovingMaskLayer_SetTable_BA1C (sub_BA1C de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-21. +21h = arg_2 (table de 256
; couleurs du calque masque).
; ==============================================================================================
MovingMaskLayer_SetTable_1026D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+21h], ax
		pop	si
		pop	bp
		retf
MovingMaskLayer_SetTable_1026D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1027D		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	di, ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp+var_2], ax
		push	word ptr [si+21h]
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_2]
		push	di
		push	word_4D36C
		call	sub_393D4
		add	sp, 0Eh
		push	word ptr [si+21h]
		push	word ptr [si+1Bh]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_2]
		push	di
		push	word_4D36C
		call	sub_393D4
		add	sp, 0Eh
		pop	di
		pop	si
		leave
		retf
sub_1027D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10300		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1032D
		push	0
		push	si
		call	Scene_Destruct_34348
		add	sp, 4
		test	di, 1
		jz	short loc_1032B
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_1032B

loc_1032B:
		jmp	short loc_1032D

loc_1032D:
		pop	di
		pop	si
		pop	bp
		retf
sub_10300		endp

; START OF FUNCTION CHUNK FOR sub_10300
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_10300

; ----------------------------------------------------------------------

sub_10335		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1027D
sub_10335		endp

; ----------------------------------------------------------------------

sub_10341		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_10341		endp

; ----------------------------------------------------------------------

sub_1034D		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_3424E
sub_1034D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10359		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1038B
		mov	word ptr [si], 1D5Dh
		mov	word ptr [si+0Ah], 1D7Dh
		push	0
		push	si
		call	sub_3410F
		add	sp, 4
		test	di, 1
		jz	short loc_1038B
		push	si
		call	sub_39C
		add	sp, 2

loc_1038B:
		pop	di
		pop	si
		pop	bp
		retf
sub_10359		endp

; ----------------------------------------------------------------------

sub_1038F		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_FF62
sub_1038F		endp

; ----------------------------------------------------------------------

sub_1039B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_1039B		endp

; ----------------------------------------------------------------------

sub_103A7		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_FF2F
sub_103A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_103B3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_103E0
		push	0
		push	si
		call	Scene_Destruct_34348
		add	sp, 4
		test	di, 1
		jz	short loc_103DE
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_103DE

loc_103DE:
		jmp	short loc_103E0

loc_103E0:
		pop	di
		pop	si
		pop	bp
		retf
sub_103B3		endp

; START OF FUNCTION CHUNK FOR sub_103B3
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_103B3

; ----------------------------------------------------------------------

sub_103E8		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_FDB4
sub_103E8		endp

; ----------------------------------------------------------------------

sub_103F4		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_103F4		endp

; ----------------------------------------------------------------------

sub_10400		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_3424E
sub_10400		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1040C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_10439
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_E916
		add	sp, 4
		test	di, 1
		jz	short loc_10437
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_10437

loc_10437:
		jmp	short loc_10439

loc_10439:
		pop	di
		pop	si
		pop	bp
		retf
sub_1040C		endp

; START OF FUNCTION CHUNK FOR sub_1040C
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_1040C

; ----------------------------------------------------------------------

sub_10441		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_E761
sub_10441		endp

; ----------------------------------------------------------------------

sub_1044D		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_1044D		endp

; ----------------------------------------------------------------------

sub_10459		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_E72D
sub_10459		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10465		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_10497
		mov	word ptr [si], 1DF1h
		mov	word ptr [si+0Ah], 1E11h
		push	0
		push	si
		call	sub_3410F
		add	sp, 4
		test	di, 1
		jz	short loc_10497
		push	si
		call	sub_39C
		add	sp, 2

loc_10497:
		pop	di
		pop	si
		pop	bp
		retf
sub_10465		endp

; ----------------------------------------------------------------------

sub_1049B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_3427B
sub_1049B		endp

; ----------------------------------------------------------------------

sub_104A7		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_104A7		endp

; ----------------------------------------------------------------------

sub_104B3		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_3424E
sub_104B3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_104BF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_104EC
		push	0
		push	si
		call	sub_3410F
		add	sp, 4
		test	di, 1
		jz	short loc_104EA
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_104EA

loc_104EA:
		jmp	short loc_104EC

loc_104EC:
		pop	di
		pop	si
		pop	bp
		retf
sub_104BF		endp

; START OF FUNCTION CHUNK FOR sub_104BF
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_104BF

; ----------------------------------------------------------------------

sub_104F4		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_3427B
sub_104F4		endp

; ----------------------------------------------------------------------

sub_10500		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_10500		endp

; ----------------------------------------------------------------------

sub_1050C		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_3424E
sub_1050C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10518		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_10545
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_F5C0
		add	sp, 4
		test	di, 1
		jz	short loc_10543
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_10543

loc_10543:
		jmp	short loc_10545

loc_10545:
		pop	di
		pop	si
		pop	bp
		retf
sub_10518		endp

; START OF FUNCTION CHUNK FOR sub_10518
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_10518

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1054D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1054D		endp

; ----------------------------------------------------------------------

sub_10555		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_F7C4
sub_10555		endp

; ----------------------------------------------------------------------

sub_10561		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1054D
sub_10561		endp

; ----------------------------------------------------------------------

sub_1056D		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_F782
sub_1056D		endp

; ----------------------------------------------------------------------

sub_10579		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_F705
sub_10579		endp

; ----------------------------------------------------------------------

sub_10585		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_1054D
sub_10585		endp

; ----------------------------------------------------------------------

sub_10591		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_F6D2
sub_10591		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1059D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_105CF
		mov	word ptr [si], 1EB1h
		mov	word ptr [si+0Ah], 1ED1h
		push	0
		push	si
		call	sub_3410F
		add	sp, 4
		test	di, 1
		jz	short loc_105CF
		push	si
		call	sub_39C
		add	sp, 2

loc_105CF:
		pop	di
		pop	si
		pop	bp
		retf
sub_1059D		endp

; ----------------------------------------------------------------------

sub_105D3		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_F43C
sub_105D3		endp

; ----------------------------------------------------------------------

sub_105DF		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_105DF		endp

; ----------------------------------------------------------------------

sub_105EB		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_3424E
sub_105EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_105F7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_10624
		push	0
		push	si
		call	sub_3410F
		add	sp, 4
		test	di, 1
		jz	short loc_10622
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_10622

loc_10622:
		jmp	short loc_10624

loc_10624:
		pop	di
		pop	si
		pop	bp
		retf
sub_105F7		endp

; START OF FUNCTION CHUNK FOR sub_105F7
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_105F7

; ----------------------------------------------------------------------

sub_1062C		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_F268
sub_1062C		endp

; ----------------------------------------------------------------------

sub_10638		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_10638		endp

; ----------------------------------------------------------------------

sub_10644		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_3424E
sub_10644		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10650		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1067D
		push	0
		push	si
		call	Scene_Destruct_34348
		add	sp, 4
		test	di, 1
		jz	short loc_1067B
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_1067B

loc_1067B:
		jmp	short loc_1067D

loc_1067D:
		pop	di
		pop	si
		pop	bp
		retf
sub_10650		endp

; START OF FUNCTION CHUNK FOR sub_10650
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_10650

; ----------------------------------------------------------------------

sub_10685		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_F10F
sub_10685		endp

; ----------------------------------------------------------------------

sub_10691		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_10691		endp

; ----------------------------------------------------------------------

sub_1069D		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_3424E
sub_1069D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_106A9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_106DB
		mov	word ptr [si], 1F41h
		mov	word ptr [si+0Ah], 1F61h
		push	0
		push	si
		call	sub_3410F
		add	sp, 4
		test	di, 1
		jz	short loc_106DB
		push	si
		call	sub_39C
		add	sp, 2

loc_106DB:
		pop	di
		pop	si
		pop	bp
		retf
sub_106A9		endp

; ----------------------------------------------------------------------

sub_106DF		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_ED99
sub_106DF		endp

; ----------------------------------------------------------------------

sub_106EB		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_106EB		endp

; ----------------------------------------------------------------------

sub_106F7		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_3424E
sub_106F7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10703		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_10730
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_E916
		add	sp, 4
		test	di, 1
		jz	short loc_1072E
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_1072E

loc_1072E:
		jmp	short loc_10730

loc_10730:
		pop	di
		pop	si
		pop	bp
		retf
sub_10703		endp

; START OF FUNCTION CHUNK FOR sub_10703
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_10703

; ----------------------------------------------------------------------

sub_10738		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_EBC5
sub_10738		endp

; ----------------------------------------------------------------------

sub_10744		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_10744		endp

; ----------------------------------------------------------------------

sub_10750		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_EB92
sub_10750		endp

; ----------------------------------------------------------------------

sub_1075C		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_E761
sub_1075C		endp

; ----------------------------------------------------------------------

sub_10768		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_10768		endp

; ----------------------------------------------------------------------

sub_10774		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_E72D
sub_10774		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10780		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_10780		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10788		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		add	sp, 2
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		add	[si+2], ax
		mov	ax, [bp+var_4]
		add	[si+4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 2
		pop	si
		leave
		retf
sub_10788		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_107BE		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+2], ax
		mov	ax, [bp+var_4]
		mov	[si+4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		add	sp, 2
		pop	si
		leave
		retf
sub_107BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_107EB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_107EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_107F3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_1081E
		mov	word ptr [si], 2019h
		push	si
		call	sub_3652D
		add	sp, 2
		test	di, 1
		jz	short loc_1081E
		push	si
		call	sub_39C
		add	sp, 2

loc_1081E:
		pop	di
		pop	si
		pop	bp
		retf
sub_107F3		endp

; ----------------------------------------------------------------------

sub_10822		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_3427B
sub_10822		endp

; ----------------------------------------------------------------------

sub_1082E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_1082E		endp

; ----------------------------------------------------------------------

sub_1083A		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_3424E
sub_1083A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_10846		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_10873
		push	0
		push	si
		call	Scene_Destruct_34348
		add	sp, 4
		test	di, 1
		jz	short loc_10871
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_10871

loc_10871:
		jmp	short loc_10873

loc_10873:
		pop	di
		pop	si
		pop	bp
		retf
sub_10846		endp

; START OF FUNCTION CHUNK FOR sub_10846
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_10846

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1087B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		cmp	di, 0FFFFh
		jz	short loc_108BD
		push	word ptr [si+23h]
		push	word ptr [si+21h]
		push	di
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word_4D36C
		call	sub_38DC0
		add	sp, 10h

loc_108BD:
		pop	di
		pop	si
		pop	bp
		retf
sub_1087B		endp

; ----------------------------------------------------------------------

sub_108C1		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_DFA2
sub_108C1		endp

; ----------------------------------------------------------------------

sub_108CD		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_108CD		endp

; ----------------------------------------------------------------------

sub_108D9		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_DF6F
sub_108D9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_108E5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_10912
		push	0
		push	si
		call	Scene_Destruct_34348
		add	sp, 4
		test	di, 1
		jz	short loc_10910
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_10910

loc_10910:
		jmp	short loc_10912

loc_10912:
		pop	di
		pop	si
		pop	bp
		retf
sub_108E5		endp

; START OF FUNCTION CHUNK FOR sub_108E5
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_108E5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1091A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		cmp	di, 0FFFFh
		jz	short loc_1095C
		push	word ptr [si+23h]
		push	word ptr [si+21h]
		push	di
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word_4D36C
		call	sub_38DC0
		add	sp, 10h

loc_1095C:
		pop	di
		pop	si
		pop	bp
		retf
sub_1091A		endp

; ----------------------------------------------------------------------

sub_10960		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_DE78
sub_10960		endp

; ----------------------------------------------------------------------

sub_1096C		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_1096C		endp

; ----------------------------------------------------------------------

sub_10978		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_DE45
sub_10978		endp

; ----------------------------------------------------------------------

sub_10984		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_3427B
sub_10984		endp

; ----------------------------------------------------------------------

sub_10990		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_10990		endp

; ----------------------------------------------------------------------

sub_1099C		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_DrawAtOwnPos_3424E
sub_1099C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_109A8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_109D5
		push	0
		push	si
		call	sub_3410F
		add	sp, 4
		test	di, 1
		jz	short loc_109D3
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_109D3

loc_109D3:
		jmp	short loc_109D5

loc_109D5:
		pop	di
		pop	si
		pop	bp
		retf
sub_109A8		endp

; START OF FUNCTION CHUNK FOR sub_109A8
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_109A8

; ----------------------------------------------------------------------

sub_109DD		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_DCCE
sub_109DD		endp

; ----------------------------------------------------------------------

sub_109E9		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_342EA
sub_109E9		endp

; ----------------------------------------------------------------------

sub_109F5		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
sub_109F5		endp

; START OF FUNCTION CHUNK FOR sub_109F5
		db 0E9h, 9Ah
; END OF FUNCTION CHUNK FOR sub_109F5
seg025		ends
