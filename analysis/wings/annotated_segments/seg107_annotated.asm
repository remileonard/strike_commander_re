seg107		segment	para public 'CODE' use16
		assume cs:seg107
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0D2h

loc_45981:
		db 5Fh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45983		proc far
		push	bp
		mov	bp, sp
		push	si
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_459C7
		or	si, si
		jz	short loc_4599B
		jmp	short loc_459A4

loc_4599B:
		push	8
		push	cs
		call	near ptr sub_45983
		pop	cx
		mov	si, ax

loc_459A4:
		or	ax, ax
		jz	short loc_459C3
		mov	word ptr [si], 401Ah
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si], 401Eh
		mov	word ptr [si+6], 0
		mov	ax, si
		jmp	short loc_459C5

loc_459C3:
		mov	ax, si

loc_459C5:
		jmp	short loc_459C9

loc_459C7:
		mov	ax, si

loc_459C9:
		mov	dx, ax
		or	dx, dx
		mov	ax, dx
		pop	si
		pop	bp
		retf
sub_45983		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_459D2		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	8
		push	cs
		call	near ptr sub_45983
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_45A0C
		mov	word ptr [di], 401Ah
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	word ptr [di], 401Eh
		mov	ax, [bp+var_2]
		mov	[di+6], ax
		mov	ax, di
		jmp	short loc_45A0E

loc_45A0C:
		mov	ax, di

loc_45A0E:
		mov	di, ax
		mov	ax, [bp+arg_2]
		mov	[di+6], ax
		push	di
		push	si
		call	LinkedList_InsertAtTail_4836D
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_459D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45A24		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	8
		push	cs
		call	near ptr sub_45983
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_45A5E
		mov	word ptr [di], 401Ah
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	word ptr [di], 401Eh
		mov	ax, [bp+var_2]
		mov	[di+6], ax
		mov	ax, di
		jmp	short loc_45A60

loc_45A5E:
		mov	ax, di

loc_45A60:
		mov	di, ax
		mov	ax, [bp+arg_2]
		mov	[di+6], ax
		push	di
		push	si
		call	LinkedList_InsertAtHead_4833F
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_45A24		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45A76		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_45ABC

loc_45A88:
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx
		mov	bx, [bp+var_2]
		mov	ax, [bx+6]
		add	ax, 4
		push	ax
		push	cs
		call	near ptr sub_45A76
		pop	cx
		mov	bx, [bp+var_2]
		mov	di, [bx+6]
		or	di, di
		jz	short loc_45ABC
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_45ABC

loc_45ABC:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_45A88
		push	si
		call	sub_4853A
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_45A76		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45AD8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_45B09
		mov	word ptr [si], 1DF3h
		push	si
		push	cs
		call	near ptr sub_45A76
		pop	cx
		mov	word ptr [si], 1DEFh
		push	si
		call	sub_4853A
		pop	cx
		test	di, 1
		jz	short loc_45B09
		push	si
		call	sub_33B
		pop	cx

loc_45B09:
		pop	di
		pop	si
		pop	bp
		retf
sub_45AD8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45B0D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_45B3C
		mov	word ptr [si], 1DF7h
		push	2
		mov	ax, si
		add	ax, 4
		push	ax
		push	cs
		call	near ptr sub_45AD8
		add	sp, 4
		test	di, 1
		jz	short loc_45B3C
		push	si
		call	sub_33B
		pop	cx

loc_45B3C:
		pop	di
		pop	si
		pop	bp
		retf
sub_45B0D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à LayerGroup_Add_6656E
; (sub_6656E de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; LayerGroup_Add_2DB84 (sub_2DB84 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — far, LUE 2026-10-17. Ajoute un calque à la liste +4 d'une scène
; ou d'un calque parent (sub_2DA16), puis le rattache au parent (sub_2DBAB, pas lue). Un
; calque enfant est dessiné par rapport à son parent.
; ==============================================================================================
LayerGroup_Add_45B40		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		mov	ax, si
		add	ax, 4
		push	ax
		push	cs
		call	near ptr sub_459D2
		add	sp, 4
		push	si
		push	di
		nop
		push	cs
		call	near ptr sub_45B67
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
LayerGroup_Add_45B40		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45B67		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_45B7A
		mov	ax, [bp+arg_2]
		mov	[si+2], ax

loc_45B7A:
		pop	si
		pop	bp
		retf
sub_45B67		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45B7D		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_45BC1

loc_45B8E:
		mov	bx, [bp+var_2]
		mov	ax, [bx+6]
		cmp	ax, [bp+arg_2]
		jnz	short loc_45BC1
		push	bx
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Remove_484C7
		add	sp, 4
		cmp	[bp+var_2], 0
		jz	short loc_45BBF
		push	3
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_45BD7

loc_45BBF:
		jmp	short loc_45BD7

loc_45BC1:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_45B8E

loc_45BD7:
		pop	si
		leave
		retf
sub_45B7D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45BDA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+2], 0
		pop	si
		pop	bp
		retf
sub_45BDA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45BE9		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_45C09

loc_45BFA:
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		pop	cx

loc_45C09:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_45BFA
		pop	si
		leave
		retf
sub_45BE9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à LayerGroup_Construct_66650 (sub_66650 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à LayerGroup_Construct_2DC66 (sub_2DC66 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Constructeur de base d'un groupe de calques (31 octets, alloué si nul) : liste de calques en
; +4, position +12/+14 = 0, durée d'image via Scene_SetFps_2DE27(arg_2), +18 = arg_4 (palette
; ou style, 255 = aucun ; sinon appliqué par sub_2EC80), +19 = arg_6 (surface de dessin),
; compteur d'images +29 = 0.
; ==============================================================================================
LayerGroup_Construct_45C22		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_45C3B
		push	1Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_45CB3

loc_45C3B:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si], 3FEAh
		mov	word ptr [si+0Ah], 400Ah
		xor	eax, eax
		mov	[si+19h], eax
		mov	[si+15h], eax
		cmp	[bp+arg_4], 0FFh
		jz	short loc_45C96
		mov	al, [bp+arg_4]
		push	ax
		push	word_5DD42
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4

loc_45C96:
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Scene_SetFps_45DE3
		add	sp, 4
		mov	al, [bp+arg_4]
		mov	[si+12h], al
		mov	ax, [bp+arg_6]
		mov	[si+13h], ax
		mov	word ptr [si+1Dh], 0

loc_45CB3:
		mov	ax, si
		pop	si
		pop	bp
		retf
LayerGroup_Construct_45C22		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_Destruct_666E6 (sub_666E6 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Scene_Destruct_2DCFC (sub_2DCFC de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Destructeur de
; groupe de calques / scène : vide la liste (sub_2DB51), libère l'objet si bit 1 de
; l'argument.
; ==============================================================================================
Scene_Destruct_45CB8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_45CE7
		mov	word ptr [si], 3FEAh
		mov	word ptr [si+0Ah], 400Ah
		push	0
		push	si
		push	cs
		call	near ptr sub_45B0D
		add	sp, 4
		test	di, 1
		jz	short loc_45CE7
		push	si
		call	sub_33B
		pop	cx

loc_45CE7:
		pop	di
		pop	si
		pop	bp
		retf
Scene_Destruct_45CB8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45CEB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_45CEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45CF3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_45CF3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45CFB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_45CFB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45D03		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		pop	si
		pop	bp
		retf
sub_45D03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45D10		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Eh]
		pop	si
		pop	bp
		retf
sub_45D10		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Layer_MoveBy_6674B
; (sub_6674B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; Layer_MoveBy_2E29E (sub_2E29E de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — far, LUE 2026-10-21. Ajoute (arg_2, arg_4) à la position du
; calque (+0Ch, +0Eh). mid3 : replace un décor défilant de 640 pixels quand il sort à gauche
; (x absolu < −319).
; ==============================================================================================
Layer_MoveBy_45D1D		proc far

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
		add	[si+0Ch], ax
		mov	ax, [bp+var_4]
		add	[si+0Eh], ax
		pop	si
		leave
		retf
Layer_MoveBy_45D1D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45D42		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		movzx	eax, word ptr [si+10h]
		mov	[bp+var_6], eax
		mov	[si+19h], eax
		mov	eax, dword_5E7D3
		mov	[si+15h], eax
		cmp	byte ptr [si+12h], 0FFh
		jz	short loc_45D95
		mov	al, [si+12h]
		push	ax
		push	word_5DD42
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		jmp	short loc_45D95

loc_45D7E:
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_45D95:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_45D7E
		push	word_5DD42
		push	word ptr [si+13h]
		call	UI_ApplyEncodingHelper_47B38
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	ax, si
		add	ax, 15h
		push	ax
		call	Stopwatch_WaitElapsed_5637A
		pop	cx
		pop	si
		leave
		retf
sub_45D42		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Scene_AdvanceFrame_667FE (sub_667FE de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Scene_AdvanceFrame_2DE14 (sub_2DE14 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Méthode
; virtuelle +28 de la scène : avance tous les calques (LayerGroup_AdvanceAll_2DC2D) puis
; incrémente le compteur d'images +29 (comparé par les cinématiques pour déclencher sons et
; changements).
; ==============================================================================================
Scene_AdvanceFrame_45DD0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_45BE9
		pop	cx
		inc	word ptr [si+1Dh]
		pop	si
		pop	bp
		retf
Scene_AdvanceFrame_45DD0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Scene_SetFps_66811
; (sub_66811 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; Scene_SetFps_2DE27 (sub_2DE27 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — far, LUE 2026-10-17. Durée d'une image de scène (+16) = 60 /
; arg_2 tics, au moins 1 (tics à 60 Hz). Utilisé avec 10, 15 et 20 images par seconde dans la
; cinématique mid1.
; ==============================================================================================
Scene_SetFps_45DE3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	ax, 3Ch
		xor	dx, dx
		div	bx
		cmp	ax, 1
		jge	short loc_45DFE
		mov	ax, 1
		jmp	short loc_45E05

loc_45DFE:
		mov	ax, 3Ch
		xor	dx, dx
		div	bx

loc_45E05:
		mov	[si+10h], ax
		pop	si
		pop	bp
		retf
Scene_SetFps_45DE3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45E0B		proc far

var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+11h], eax
		mov	al, [bp+var_5]
		mov	[si+15h], al
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	eax, [di+6]
		mov	[si+17h], eax
		mov	word ptr [si+1Bh], 0
		pop	di
		pop	si
		leave
		retf
sub_45E0B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Layer_ConstructAtOrigin_6687F (sub_6687F de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Layer_ConstructAtOrigin_2DE95 (sub_2DE95 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. Calque de base (1Dh octets, alloué si nul), même table de méthodes que
; Layer_Construct_2DF9B (dseg 18DFh = 6367) : ressource arg_2 attachée par sub_2DE4F, position
; +0Ch et +0Eh mises à 0. Équivaut à Layer_Construct_2DF9B(objet, ressource, 0, 0). mid12 :
; mid12 0 et 1.
; ==============================================================================================
Layer_ConstructAtOrigin_45E51		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_45E6A
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_45ECC

loc_45E6A:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_45E0B
		add	sp, 4
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0

loc_45ECC:
		mov	ax, si
		pop	si
		pop	bp
		retf
Layer_ConstructAtOrigin_45E51		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_45ED1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_45EEA
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_45F52

loc_45EEA:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_45E0B
		add	sp, 4
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	ax, [bp+arg_4]
		mov	[si+1Bh], ax

loc_45F52:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_45ED1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Layer_Construct_66985 (sub_66985 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Layer_Construct_2DF9B (sub_2DF9B de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Calque de base
; (29 octets, alloué si nul) : liste d'enfants +4, descripteur de ressource d'images +17 (type
; 2, attaché par sub_2DE4F, pas lue), position x +12 = arg_4, y +14 = arg_6 (pixels, écran 320
; × 200). Table de méthodes dseg 6367.
; ==============================================================================================
Layer_Construct_45F57		proc far

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
		jnz	short loc_45F73
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_45FE3

loc_45F73:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_45E0B
		add	sp, 4
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_4]
		mov	[si+0Eh], ax

loc_45FE3:
		mov	ax, si
		pop	si
		leave
		retf
Layer_Construct_45F57		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ImageLayer_Construct_66A16 (sub_66A16 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à ImageLayer_Construct_2E02C (sub_2E02C de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Comme
; Layer_Construct_2DF9B, avec le numéro d'image affichée +27 = arg_8 : image fixe n de la
; ressource.
; ==============================================================================================
ImageLayer_Construct_45FE8		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_46004
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4607A

loc_46004:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_45E0B
		add	sp, 4
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_4]
		mov	[si+0Eh], ax
		mov	ax, [bp+arg_8]
		mov	[si+1Bh], ax

loc_4607A:
		mov	ax, si
		pop	si
		leave
		retf
ImageLayer_Construct_45FE8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4607F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_460F1
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		push	si
		push	si
		push	cs
		call	near ptr sub_45B7D
		add	sp, 4
		cmp	byte ptr [si+16h], 0
		jz	short loc_460C6
		cmp	dword ptr [si+11h], 0
		jz	short loc_460C6
		push	0
		mov	al, [si+15h]
		push	ax
		mov	ax, si
		add	ax, 11h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_460C6

loc_460C6:
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	0
		push	si
		push	cs
		call	near ptr sub_45B0D
		add	sp, 4
		test	di, 1
		jz	short loc_460F1
		push	si
		call	sub_33B
		pop	cx

loc_460F1:
		pop	di
		pop	si
		pop	bp
		retf
sub_4607F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_460F5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_46113
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		pop	cx
		add	ax, [si+0Ch]
		jmp	short loc_46116

loc_46113:
		mov	ax, [si+0Ch]

loc_46116:
		pop	si
		pop	bp
		retf
sub_460F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46119		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_46137
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		add	ax, [si+0Eh]
		jmp	short loc_4613A

loc_46137:
		mov	ax, [si+0Eh]

loc_4613A:
		pop	si
		pop	bp
		retf
sub_46119		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4613D		proc far

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
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	dx, [si+1Bh]
		cmp	dx, 0FFFFh
		jz	short loc_46196
		push	dx
		cmp	byte ptr [si+15h], 3
		jnz	short loc_4617A
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_46180

loc_4617A:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_46180:
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch
		jmp	short loc_46196

loc_46196:
		mov	[bp+var_6], 0
		jmp	short loc_461B2

loc_4619D:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_6]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_461B2:
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_4619D
		pop	di
		pop	si
		leave
		retf
sub_4613D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Layer_DrawAtOwnPos_624F3 (sub_624F3 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Layer_DrawAtOwnPos_2E202 (sub_2E202 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Dessine le
; calque à sa position absolue (méthodes +4 et +8 = x et y absolus, Layer_GetX_2E139 /
; Layer_GetY_2E15D) par Layer_DrawAt_2E181.
; ==============================================================================================
Layer_DrawAtOwnPos_461CC		proc far

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
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_4613D
		add	sp, 6
		pop	si
		leave
		retf
Layer_DrawAtOwnPos_461CC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_461F9		proc far

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
		push	ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_4613D
		add	sp, 6
		pop	si
		leave
		retf
sub_461F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46224		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+16h], 0
		jz	short loc_46251
		cmp	dword ptr [si+11h], 0
		jz	short loc_46251
		push	0
		mov	al, [si+15h]
		push	ax
		mov	ax, si
		add	ax, 11h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_46251

loc_46251:
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		pop	si
		pop	bp
		retf
sub_46224		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Layer_MoveBy_6674B
; (sub_6674B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de OPTEST.EXE : code identique instruction par instruction à
; Layer_MoveBy_2E29E (sub_2E29E de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et
; contexte à revérifier ici. — far, LUE 2026-10-21. Ajoute (arg_2, arg_4) à la position du
; calque (+0Ch, +0Eh). mid3 : replace un décor défilant de 640 pixels quand il sort à gauche
; (x absolu < −319).
; ==============================================================================================
Layer_MoveBy_46268		proc far

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
		add	[si+0Ch], ax
		mov	ax, [bp+var_4]
		add	[si+0Eh], ax
		pop	si
		leave
		retf
Layer_MoveBy_46268		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4628D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr sub_45BE9
		pop	cx
		pop	bp
		retf
sub_4628D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4629B		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Dh]
		mov	[bp+var_2], ax
		mov	ax, [si+1Fh]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		add	[si+0Ch], ax
		mov	ax, [bp+var_4]
		add	[si+0Eh], ax
		push	si
		push	cs
		call	near ptr sub_45BE9
		pop	cx
		pop	si
		leave
		retf
sub_4629B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_Destruct_666E6 (sub_666E6 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Scene_Destruct_2DCFC (sub_2DCFC de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Destructeur de
; groupe de calques / scène : vide la liste (sub_2DB51), libère l'objet si bit 1 de
; l'argument.
; ==============================================================================================
Scene_Destruct_462C6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_462F5
		mov	word ptr [si], 1EAFh
		mov	word ptr [si+0Ah], 1ECFh
		push	0
		push	si
		push	cs
		call	near ptr sub_4607F
		add	sp, 4
		test	di, 1
		jz	short loc_462F5
		push	si
		call	sub_33B
		pop	cx

loc_462F5:
		pop	di
		pop	si
		pop	bp
		retf
Scene_Destruct_462C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_462F9		proc far

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
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+21h], ax
		mov	ax, [bp+var_4]
		mov	[si+23h], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		mov	[si+25h], ax
		mov	ax, [bp+var_8]
		mov	[si+27h], ax
		mov	ax, [bp+arg_A]
		mov	[si+2Dh], ax
		mov	word ptr [si+2Fh], 0
		mov	word ptr [si+29h], 0
		mov	word ptr [si+2Bh], 0
		pop	si
		leave
		retf
sub_462F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4634B		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		mov	[bp+var_2], ax
		mov	ax, [si+0Eh]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+21h], ax
		mov	ax, [bp+var_4]
		mov	[si+23h], ax
		mov	ax, [si+0Ch]
		add	ax, [bp+arg_2]
		mov	[bp+var_6], ax
		mov	ax, [si+0Eh]
		add	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		mov	[si+25h], ax
		mov	ax, [bp+var_8]
		mov	[si+27h], ax
		mov	ax, [bp+arg_6]
		mov	[si+2Dh], ax
		mov	word ptr [si+2Fh], 0
		mov	word ptr [si+29h], 0
		mov	word ptr [si+2Bh], 0
		pop	si
		leave
		retf
sub_4634B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_463A3		proc far

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
		mov	ax, [si+2Fh]
		cmp	ax, [si+2Dh]
		jbe	short loc_463B8
		jmp	loc_4648E

loc_463B8:
		mov	ax, [si+27h]
		sub	ax, [si+23h]
		xor	dx, dx
		div	word ptr [si+2Dh]
		push	ax
		mov	ax, [si+25h]
		sub	ax, [si+21h]
		xor	dx, dx
		div	word ptr [si+2Dh]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [si+25h]
		sub	ax, [si+21h]
		xor	dx, dx
		div	word ptr [si+2Dh]
		mov	[bp+var_2], dx
		mov	ax, [si+27h]
		sub	ax, [si+23h]
		xor	dx, dx
		div	word ptr [si+2Dh]
		mov	[bp+var_4], dx
		mov	ax, [bp+var_2]
		add	[si+29h], ax
		mov	ax, [bp+var_4]
		add	[si+2Bh], ax
		mov	ax, [si+29h]
		cmp	ax, [si+2Dh]
		jbe	short loc_4640E
		mov	ax, 1
		jmp	short loc_46410

loc_4640E:
		xor	ax, ax

loc_46410:
		mov	[bp+var_6], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		or	ax, ax
		jz	short loc_46446
		cmp	word ptr [si+29h], 0
		jge	short loc_46427
		mov	ax, 0FFFFh
		jmp	short loc_4642A

loc_46427:
		mov	ax, 1

loc_4642A:
		add	[si+0Ch], ax
		cmp	word ptr [si+29h], 0
		jge	short loc_46438
		mov	ax, 0FFFFh
		jmp	short loc_4643B

loc_46438:
		mov	ax, 1

loc_4643B:
		imul	word ptr [si+2Dh]
		mov	dx, [si+29h]
		sub	dx, ax
		mov	[si+29h], dx

loc_46446:
		mov	ax, [si+2Bh]
		cmp	ax, [si+2Dh]
		jbe	short loc_46453
		mov	ax, 1
		jmp	short loc_46455

loc_46453:
		xor	ax, ax

loc_46455:
		mov	[bp+var_8], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		or	ax, ax
		jz	short loc_4648B
		cmp	word ptr [si+2Bh], 0
		jge	short loc_4646C
		mov	ax, 0FFFFh
		jmp	short loc_4646F

loc_4646C:
		mov	ax, 1

loc_4646F:
		add	[si+0Eh], ax
		cmp	word ptr [si+2Bh], 0
		jge	short loc_4647D
		mov	ax, 0FFFFh
		jmp	short loc_46480

loc_4647D:
		mov	ax, 1

loc_46480:
		imul	word ptr [si+2Dh]
		mov	dx, [si+2Bh]
		sub	dx, ax
		mov	[si+2Bh], dx

loc_4648B:
		inc	word ptr [si+2Fh]

loc_4648E:
		pop	si
		leave
		retf
sub_463A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46491		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2Fh]
		cmp	ax, [si+2Dh]
		jnz	short loc_464A5
		mov	ax, 1
		jmp	short loc_464A7

loc_464A5:
		xor	ax, ax

loc_464A7:
		pop	si
		pop	bp
		retf
sub_46491		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_464AA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_463A3
		pop	cx
		push	si
		push	cs
		call	near ptr sub_45BE9
		pop	cx
		pop	si
		pop	bp
		retf
sub_464AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_464C0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_464EF
		mov	word ptr [si], 3FBAh
		mov	word ptr [si+0Ah], 3FDAh
		push	0
		push	si
		push	cs
		call	near ptr Scene_Destruct_462C6
		add	sp, 4
		test	di, 1
		jz	short loc_464EF
		push	si
		call	sub_33B
		pop	cx

loc_464EF:
		pop	di
		pop	si
		pop	bp
		retf
sub_464C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_464F3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_4650C
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_46562

loc_4650C:
		mov	word ptr [si], 1DF7h
		mov	word ptr [si+4], 1DEFh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 1DF3h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1DC3h
		mov	word ptr [si+0Ah], 1DCFh
		mov	word ptr [si+0Ah], 1DDFh
		mov	word ptr [si], 1E17h
		mov	word ptr [si+0Ah], 1E37h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 3F8Ah
		mov	word ptr [si+0Ah], 3FAAh

loc_46562:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_464F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46567		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_46580
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_46594

loc_46580:
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Layer_ConstructAtOrigin_45E51
		add	sp, 4
		mov	word ptr [si], 3F8Ah
		mov	word ptr [si+0Ah], 3FAAh

loc_46594:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_46567		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AnimLayer_Construct_66FB9 (sub_66FB9 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à AnimLayer_Construct_2E5CF (sub_2E5CF de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Calque
; animé : Layer_Construct_2DF9B puis table de méthodes dseg 16248, dont +28 =
; AnimLayer_Advance_2E607. L'image affichée +27 commence à 0.
; ==============================================================================================
AnimLayer_Construct_46599		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_465B2
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_465CC

loc_465B2:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Layer_Construct_45F57
		add	sp, 8
		mov	word ptr [si], 3F8Ah
		mov	word ptr [si+0Ah], 3FAAh

loc_465CC:
		mov	ax, si
		pop	si
		pop	bp
		retf
AnimLayer_Construct_46599		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_465D1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+15h], 3
		jnz	short loc_465F5
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_465FB

loc_465F5:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_465FB:
		or	ax, dx
		jz	short loc_46631
		cmp	byte ptr [si+15h], 3
		jnz	short loc_4661C
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_46622

loc_4661C:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_46622:
		push	dx
		push	ax
		call	sub_4A3E2
		cmp	ax, [si+1Bh]
		jbe	short loc_46631
		inc	word ptr [si+1Bh]

loc_46631:
		push	si
		push	cs
		call	near ptr sub_45BE9
		pop	cx
		pop	si
		pop	bp
		retf
sub_465D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4663A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+15h], 3
		jnz	short loc_4665E
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_46664

loc_4665E:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_46664:
		or	ax, dx
		jz	short loc_466A0
		cmp	byte ptr [si+15h], 3
		jnz	short loc_46685
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_4668B

loc_46685:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_4668B:
		push	dx
		push	ax
		call	sub_4A3E2
		cmp	ax, [si+1Bh]
		jnz	short loc_4669C
		mov	ax, 1
		jmp	short loc_4669E

loc_4669C:
		xor	ax, ax

loc_4669E:
		jmp	short loc_466A2

loc_466A0:
		mov	al, 1

loc_466A2:
		pop	si
		pop	bp
		retf
sub_4663A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_Destruct_666E6 (sub_666E6 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Scene_Destruct_2DCFC (sub_2DCFC de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Destructeur de
; groupe de calques / scène : vide la liste (sub_2DB51), libère l'objet si bit 1 de
; l'argument.
; ==============================================================================================
Scene_Destruct_466A5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_466D4
		mov	word ptr [si], 3F8Ah
		mov	word ptr [si+0Ah], 3FAAh
		push	0
		push	si
		push	cs
		call	near ptr sub_4607F
		add	sp, 4
		test	di, 1
		jz	short loc_466D4
		push	si
		call	sub_33B
		pop	cx

loc_466D4:
		pop	di
		pop	si
		pop	bp
		retf
Scene_Destruct_466A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_466D8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+15h], 3
		jnz	short loc_466FC
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_46702

loc_466FC:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_46702:
		or	ax, dx
		jz	short loc_46779
		cmp	byte ptr [si+15h], 3
		jnz	short loc_46723
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_46729

loc_46723:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_46729:
		or	ax, dx
		jz	short loc_46779
		mov	al, [si+1Dh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_4673D
		cmp	ax, 1
		jz	short loc_46776
		jmp	short loc_46779

loc_4673D:
		inc	word ptr [si+1Bh]
		cmp	byte ptr [si+15h], 3
		jnz	short loc_4675D
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_46763

loc_4675D:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_46763:
		push	dx
		push	ax
		call	sub_4A3E2
		cmp	ax, [si+1Bh]
		jnz	short loc_46779
		mov	word ptr [si+1Bh], 0
		jmp	short loc_46779

loc_46776:
		dec	word ptr [si+1Bh]

loc_46779:
		push	si
		push	cs
		call	near ptr sub_45BE9
		pop	cx
		pop	si
		pop	bp
		retf
sub_466D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_Destruct_666E6 (sub_666E6 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Scene_Destruct_2DCFC (sub_2DCFC de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Destructeur de
; groupe de calques / scène : vide la liste (sub_2DB51), libère l'objet si bit 1 de
; l'argument.
; ==============================================================================================
Scene_Destruct_46782		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_467B1
		mov	word ptr [si], 1666h
		mov	word ptr [si+0Ah], 1686h
		push	0
		push	si
		push	cs
		call	near ptr sub_4607F
		add	sp, 4
		test	di, 1
		jz	short loc_467B1
		push	si
		call	sub_33B
		pop	cx

loc_467B1:
		pop	di
		pop	si
		pop	bp
		retf
Scene_Destruct_46782		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_467B5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Bh], 0
		jnz	short loc_467C7
		mov	ax, 1
		jmp	short loc_467C9

loc_467C7:
		xor	ax, ax

loc_467C9:
		pop	si
		pop	bp
		retf
sub_467B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_467CC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+15h], 3
		jnz	short loc_467F0
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_467F6

loc_467F0:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_467F6:
		or	ax, dx
		jz	short loc_46833
		cmp	byte ptr [si+15h], 3
		jnz	short loc_46817
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_4681D

loc_46817:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_4681D:
		push	dx
		push	ax
		call	sub_4A3E2
		dec	ax
		cmp	ax, [si+1Bh]
		jnz	short loc_4682F
		mov	ax, 1
		jmp	short loc_46831

loc_4682F:
		xor	ax, ax

loc_46831:
		jmp	short loc_46835

loc_46833:
		mov	al, 1

loc_46835:
		pop	si
		pop	bp
		retf
sub_467CC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46838		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+15h], 3
		jnz	short loc_4685C
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_46862

loc_4685C:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_46862:
		or	ax, dx
		jz	short loc_4689A
		mov	al, [si+1Dh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_46876
		cmp	ax, 1
		jz	short loc_46886
		jmp	short loc_46894

loc_46876:
		push	si
		push	cs
		call	near ptr sub_467CC
		pop	cx
		or	al, al
		jz	short loc_46894
		mov	byte ptr [si+1Dh], 1
		jmp	short loc_46894

loc_46886:
		push	si
		push	cs
		call	near ptr sub_467B5
		pop	cx
		or	al, al
		jz	short loc_46894
		mov	byte ptr [si+1Dh], 0

loc_46894:
		push	si
		push	cs
		call	near ptr sub_466D8
		pop	cx

loc_4689A:
		push	si
		push	cs
		call	near ptr sub_45BE9
		pop	cx
		pop	si
		pop	bp
		retf
sub_46838		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_468A3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_468D2
		mov	word ptr [si], 3F5Ah
		mov	word ptr [si+0Ah], 3F7Ah
		push	0
		push	si
		push	cs
		call	near ptr Scene_Destruct_46782
		add	sp, 4
		test	di, 1
		jz	short loc_468D2
		push	si
		call	sub_33B
		pop	cx

loc_468D2:
		pop	di
		pop	si
		pop	bp
		retf
sub_468A3		endp

; ----------------------------------------------------------------------

sub_468D6		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_461F9
sub_468D6		endp

; ----------------------------------------------------------------------

sub_468E2		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_MoveBy_46268
sub_468E2		endp

; ----------------------------------------------------------------------

sub_468EE		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_461CC
sub_468EE		endp

; ----------------------------------------------------------------------

sub_468FA		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_461F9
sub_468FA		endp

; ----------------------------------------------------------------------

sub_46906		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_MoveBy_46268
sub_46906		endp

; ----------------------------------------------------------------------

sub_46912		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_461CC
sub_46912		endp

; ----------------------------------------------------------------------

sub_4691E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_461F9
sub_4691E		endp

; ----------------------------------------------------------------------

sub_4692A		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_MoveBy_46268
sub_4692A		endp

; ----------------------------------------------------------------------

sub_46936		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_461CC
sub_46936		endp

; ----------------------------------------------------------------------

sub_46942		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_45CFB
sub_46942		endp

; ----------------------------------------------------------------------

sub_4694E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_MoveBy_45D1D
sub_4694E		endp

; ----------------------------------------------------------------------

sub_4695A		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_45CF3
sub_4695A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46966		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_46984
		mov	word ptr [si], 401Ah
		test	ax, 1
		jz	short loc_46984
		push	si
		call	sub_33B
		pop	cx

loc_46984:
		pop	si
		pop	bp
		retf
sub_46966		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_46987		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_469A3
		test	dx, 1
		jz	short loc_469A3
		push	ax
		call	sub_33B
sub_46987		endp
seg107		ends
