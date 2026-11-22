seg105		segment	para public 'CODE' use16
		assume cs:seg105
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0D2h

loc_33A11:
		db 5Fh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33A13		proc far
		push	bp
		mov	bp, sp
		push	si
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_33A57
		or	si, si
		jz	short loc_33A2B
		jmp	short loc_33A34

loc_33A2B:
		push	8
		push	cs
		call	near ptr sub_33A13
		pop	cx
		mov	si, ax

loc_33A34:
		or	ax, ax
		jz	short loc_33A53
		mov	word ptr [si], 4984h
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si], 4988h
		mov	word ptr [si+6], 0
		mov	ax, si
		jmp	short loc_33A55

loc_33A53:
		mov	ax, si

loc_33A55:
		jmp	short loc_33A59

loc_33A57:
		mov	ax, si

loc_33A59:
		mov	dx, ax
		or	dx, dx
		mov	ax, dx
		pop	si
		pop	bp
		retf
sub_33A13		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33A62		proc far

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
		call	near ptr sub_33A13
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_33A9C
		mov	word ptr [di], 4984h
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	word ptr [di], 4988h
		mov	ax, [bp+var_2]
		mov	[di+6], ax
		mov	ax, di
		jmp	short loc_33A9E

loc_33A9C:
		mov	ax, di

loc_33A9E:
		mov	di, ax
		mov	ax, [bp+arg_2]
		mov	[di+6], ax
		push	di
		push	si
		call	LinkedList_InsertAtTail_36360
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_33A62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33AB4		proc far

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
		call	near ptr sub_33A13
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_33AEE
		mov	word ptr [di], 4984h
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	word ptr [di], 4988h
		mov	ax, [bp+var_2]
		mov	[di+6], ax
		mov	ax, di
		jmp	short loc_33AF0

loc_33AEE:
		mov	ax, di

loc_33AF0:
		mov	di, ax
		mov	ax, [bp+arg_2]
		mov	[di+6], ax
		push	di
		push	si
		call	LinkedList_InsertAtHead_36332
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_33AB4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33B06		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_33B4C

loc_33B18:
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
		call	near ptr sub_33B06
		pop	cx
		mov	bx, [bp+var_2]
		mov	di, [bx+6]
		or	di, di
		jz	short loc_33B4C
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_33B4C

loc_33B4C:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_33B18
		push	si
		call	sub_3652D
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_33B06		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33B68		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_33B99
		mov	word ptr [si], 201Dh
		push	si
		push	cs
		call	near ptr sub_33B06
		pop	cx
		mov	word ptr [si], 2019h
		push	si
		call	sub_3652D
		pop	cx
		test	di, 1
		jz	short loc_33B99
		push	si
		call	sub_39C
		pop	cx

loc_33B99:
		pop	di
		pop	si
		pop	bp
		retf
sub_33B68		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33B9D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_33BCC
		mov	word ptr [si], 2021h
		push	2
		mov	ax, si
		add	ax, 4
		push	ax
		push	cs
		call	near ptr sub_33B68
		add	sp, 4
		test	di, 1
		jz	short loc_33BCC
		push	si
		call	sub_39C
		pop	cx

loc_33BCC:
		pop	di
		pop	si
		pop	bp
		retf
sub_33B9D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à LayerGroup_Add_2DB84
; (sub_2DB84 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-17. Ajoute un calque à la liste +4 d'une scène ou d'un calque parent
; (sub_2DA16), puis le rattache au parent (sub_2DBAB, pas lue). Un calque enfant est dessiné
; par rapport à son parent.
; ==============================================================================================
LayerGroup_Add_33BD0		proc far

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
		call	near ptr sub_33A62
		add	sp, 4
		push	si
		push	di
		nop
		push	cs
		call	near ptr sub_33BF7
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
LayerGroup_Add_33BD0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33BF7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_33C0A
		mov	ax, [bp+arg_2]
		mov	[si+2], ax

loc_33C0A:
		pop	si
		pop	bp
		retf
sub_33BF7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (22 sur
; 22), à LayerGroup_Remove_2DBC1 (sub_2DBC1 de OPTEST.EXE). Code non comparé instruction par
; instruction. — far, LUE 2026-10-17. Cherche le calque dans la liste +4, le retire
; (sub_2FB99) et le détruit (destructeur virtuel, argument 3).
; ==============================================================================================
LayerGroup_Remove_33C0D		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_33C51

loc_33C1E:
		mov	bx, [bp+var_2]
		mov	ax, [bx+6]
		cmp	ax, [bp+arg_2]
		jnz	short loc_33C51
		push	bx
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Remove_364BA
		add	sp, 4
		cmp	[bp+var_2], 0
		jz	short loc_33C4F
		push	3
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_33C67

loc_33C4F:
		jmp	short loc_33C67

loc_33C51:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_33C1E

loc_33C67:
		pop	si
		leave
		retf
LayerGroup_Remove_33C0D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33C6A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+2], 0
		pop	si
		pop	bp
		retf
sub_33C6A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33C79		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_33C99

loc_33C8A:
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		pop	cx

loc_33C99:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_33C8A
		pop	si
		leave
		retf
sub_33C79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à LayerGroup_Construct_2DC66 (sub_2DC66 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Constructeur de base d'un groupe de calques (31 octets, alloué si nul) : liste de calques en
; +4, position +12/+14 = 0, durée d'image via Scene_SetFps_2DE27(arg_2), +18 = arg_4 (palette
; ou style, 255 = aucun ; sinon appliqué par sub_2EC80), +19 = arg_6 (surface de dessin),
; compteur d'images +29 = 0.
; ==============================================================================================
LayerGroup_Construct_33CB2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_33CCB
		push	1Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_33D43

loc_33CCB:
		mov	word ptr [si], 2021h
		mov	word ptr [si+4], 2019h
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 201Dh
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 1FEDh
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	word ptr [si+0Ah], 1FF9h
		mov	word ptr [si], 4954h
		mov	word ptr [si+0Ah], 4974h
		xor	eax, eax
		mov	[si+19h], eax
		mov	[si+15h], eax
		cmp	[bp+arg_4], 0FFh
		jz	short loc_33D26
		mov	al, [bp+arg_4]
		push	ax
		push	word_4D36C
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4

loc_33D26:
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Scene_SetFps_33E73
		add	sp, 4
		mov	al, [bp+arg_4]
		mov	[si+12h], al
		mov	ax, [bp+arg_6]
		mov	[si+13h], ax
		mov	word ptr [si+1Dh], 0

loc_33D43:
		mov	ax, si
		pop	si
		pop	bp
		retf
LayerGroup_Construct_33CB2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_Destruct_2DCFC (sub_2DCFC de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Destructeur de groupe de calques / scène : vide la liste (sub_2DB51), libère l'objet si bit
; 1 de l'argument.
; ==============================================================================================
Scene_Destruct_33D48		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_33D77
		mov	word ptr [si], 4954h
		mov	word ptr [si+0Ah], 4974h
		push	0
		push	si
		push	cs
		call	near ptr sub_33B9D
		add	sp, 4
		test	di, 1
		jz	short loc_33D77
		push	si
		call	sub_39C
		pop	cx

loc_33D77:
		pop	di
		pop	si
		pop	bp
		retf
Scene_Destruct_33D48		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33D7B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_33D7B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33D83		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_33D83		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33D8B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_33D8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33D93		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		pop	si
		pop	bp
		retf
sub_33D93		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33DA0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Eh]
		pop	si
		pop	bp
		retf
sub_33DA0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Layer_MoveBy_2E29E
; (sub_2E29E de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-21. Ajoute (arg_2, arg_4) à la position du calque (+0Ch, +0Eh). mid3
; : replace un décor défilant de 640 pixels quand il sort à gauche (x absolu < −319).
; ==============================================================================================
Layer_MoveBy_33DAD		proc far

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
Layer_MoveBy_33DAD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33DD2		proc far

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
		mov	eax, dword_4DE15
		mov	[si+15h], eax
		cmp	byte ptr [si+12h], 0FFh
		jz	short loc_33E25
		mov	al, [si+12h]
		push	ax
		push	word_4D36C
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		jmp	short loc_33E25

loc_33E0E:
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_33E25:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_33E0E
		push	word_4D36C
		push	word ptr [si+13h]
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	ax, si
		add	ax, 15h
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		pop	cx
		pop	si
		leave
		retf
sub_33DD2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Scene_AdvanceFrame_2DE14 (sub_2DE14 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-17. Méthode virtuelle +28 de la scène :
; avance tous les calques (LayerGroup_AdvanceAll_2DC2D) puis incrémente le compteur d'images
; +29 (comparé par les cinématiques pour déclencher sons et changements).
; ==============================================================================================
Scene_AdvanceFrame_33E60		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_33C79
		pop	cx
		inc	word ptr [si+1Dh]
		pop	si
		pop	bp
		retf
Scene_AdvanceFrame_33E60		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Scene_SetFps_2DE27
; (sub_2DE27 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-17. Durée d'une image de scène (+16) = 60 / arg_2 tics, au moins 1
; (tics à 60 Hz). Utilisé avec 10, 15 et 20 images par seconde dans la cinématique mid1.
; ==============================================================================================
Scene_SetFps_33E73		proc far

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
		jge	short loc_33E8E
		mov	ax, 1
		jmp	short loc_33E95

loc_33E8E:
		mov	ax, 3Ch
		xor	dx, dx
		div	bx

loc_33E95:
		mov	[si+10h], ax
		pop	si
		pop	bp
		retf
Scene_SetFps_33E73		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33E9B		proc far

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
sub_33E9B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Layer_ConstructAtOrigin_2DE95 (sub_2DE95 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-21. Calque de base (1Dh octets, alloué si nul), même table de méthodes que
; Layer_Construct_2DF9B (dseg 18DFh = 6367) : ressource arg_2 attachée par sub_2DE4F, position
; +0Ch et +0Eh mises à 0. Équivaut à Layer_Construct_2DF9B(objet, ressource, 0, 0). mid12 :
; mid12 0 et 1.
; ==============================================================================================
Layer_ConstructAtOrigin_33EE1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_33EFA
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_33F5C

loc_33EFA:
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
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_33E9B
		add	sp, 4
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0

loc_33F5C:
		mov	ax, si
		pop	si
		pop	bp
		retf
Layer_ConstructAtOrigin_33EE1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_33F61		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_33F7A
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_33FE2

loc_33F7A:
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
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_33E9B
		add	sp, 4
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	ax, [bp+arg_4]
		mov	[si+1Bh], ax

loc_33FE2:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_33F61		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Layer_Construct_2DF9B (sub_2DF9B de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Calque de base (29 octets, alloué si nul) : liste d'enfants +4, descripteur de ressource
; d'images +17 (type 2, attaché par sub_2DE4F, pas lue), position x +12 = arg_4, y +14 = arg_6
; (pixels, écran 320 × 200). Table de méthodes dseg 6367.
; ==============================================================================================
Layer_Construct_33FE7		proc far

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
		jnz	short loc_34003
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_34073

loc_34003:
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
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_33E9B
		add	sp, 4
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_4]
		mov	[si+0Eh], ax

loc_34073:
		mov	ax, si
		pop	si
		leave
		retf
Layer_Construct_33FE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ImageLayer_Construct_2E02C (sub_2E02C de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Comme Layer_Construct_2DF9B, avec le numéro d'image affichée +27 = arg_8 : image fixe n de
; la ressource.
; ==============================================================================================
ImageLayer_Construct_34078		proc far

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
		jnz	short loc_34094
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3410A

loc_34094:
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
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_33E9B
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

loc_3410A:
		mov	ax, si
		pop	si
		leave
		retf
ImageLayer_Construct_34078		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3410F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_34181
		mov	word ptr [si], 2041h
		mov	word ptr [si+0Ah], 2061h
		push	si
		push	si
		push	cs
		call	near ptr LayerGroup_Remove_33C0D
		add	sp, 4
		cmp	byte ptr [si+16h], 0
		jz	short loc_34156
		cmp	dword ptr [si+11h], 0
		jz	short loc_34156
		push	0
		mov	al, [si+15h]
		push	ax
		mov	ax, si
		add	ax, 11h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_34156

loc_34156:
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	0
		push	si
		push	cs
		call	near ptr sub_33B9D
		add	sp, 4
		test	di, 1
		jz	short loc_34181
		push	si
		call	sub_39C
		pop	cx

loc_34181:
		pop	di
		pop	si
		pop	bp
		retf
sub_3410F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34185		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_341A3
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		pop	cx
		add	ax, [si+0Ch]
		jmp	short loc_341A6

loc_341A3:
		mov	ax, [si+0Ch]

loc_341A6:
		pop	si
		pop	bp
		retf
sub_34185		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_341A9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_341C7
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		add	ax, [si+0Eh]
		jmp	short loc_341CA

loc_341C7:
		mov	ax, [si+0Eh]

loc_341CA:
		pop	si
		pop	bp
		retf
sub_341A9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_341CD		proc far

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
		jz	short loc_34218
		push	dx
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_4D36C
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		jmp	short loc_34218

loc_34218:
		mov	[bp+var_6], 0
		jmp	short loc_34234

loc_3421F:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_6]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_34234:
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_3421F
		pop	di
		pop	si
		leave
		retf
sub_341CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Layer_DrawAtOwnPos_2E202 (sub_2E202 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-17. Dessine le calque à sa position absolue
; (méthodes +4 et +8 = x et y absolus, Layer_GetX_2E139 / Layer_GetY_2E15D) par
; Layer_DrawAt_2E181.
; ==============================================================================================
Layer_DrawAtOwnPos_3424E		proc far

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
		call	near ptr sub_341CD
		add	sp, 6
		pop	si
		leave
		retf
Layer_DrawAtOwnPos_3424E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3427B		proc far

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
		call	near ptr sub_341CD
		add	sp, 6
		pop	si
		leave
		retf
sub_3427B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_342A6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+16h], 0
		jz	short loc_342D3
		cmp	dword ptr [si+11h], 0
		jz	short loc_342D3
		push	0
		mov	al, [si+15h]
		push	ax
		mov	ax, si
		add	ax, 11h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_342D3

loc_342D3:
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		pop	si
		pop	bp
		retf
sub_342A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Layer_MoveBy_2E29E
; (sub_2E29E de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-21. Ajoute (arg_2, arg_4) à la position du calque (+0Ch, +0Eh). mid3
; : replace un décor défilant de 640 pixels quand il sort à gauche (x absolu < −319).
; ==============================================================================================
Layer_MoveBy_342EA		proc far

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
Layer_MoveBy_342EA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3430F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr sub_33C79
		pop	cx
		pop	bp
		retf
sub_3430F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3431D		proc far

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
		call	near ptr sub_33C79
		pop	cx
		pop	si
		leave
		retf
sub_3431D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_Destruct_2DCFC (sub_2DCFC de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Destructeur de groupe de calques / scène : vide la liste (sub_2DB51), libère l'objet si bit
; 1 de l'argument.
; ==============================================================================================
Scene_Destruct_34348		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_34377
		mov	word ptr [si], 20D9h
		mov	word ptr [si+0Ah], 20F9h
		push	0
		push	si
		push	cs
		call	near ptr sub_3410F
		add	sp, 4
		test	di, 1
		jz	short loc_34377
		push	si
		call	sub_39C
		pop	cx

loc_34377:
		pop	di
		pop	si
		pop	bp
		retf
Scene_Destruct_34348		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3437B		proc far

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
sub_3437B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_343CD		proc far

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
sub_343CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34425		proc far

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
		jbe	short loc_3443A
		jmp	loc_34510

loc_3443A:
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
		jbe	short loc_34490
		mov	ax, 1
		jmp	short loc_34492

loc_34490:
		xor	ax, ax

loc_34492:
		mov	[bp+var_6], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		or	ax, ax
		jz	short loc_344C8
		cmp	word ptr [si+29h], 0
		jge	short loc_344A9
		mov	ax, 0FFFFh
		jmp	short loc_344AC

loc_344A9:
		mov	ax, 1

loc_344AC:
		add	[si+0Ch], ax
		cmp	word ptr [si+29h], 0
		jge	short loc_344BA
		mov	ax, 0FFFFh
		jmp	short loc_344BD

loc_344BA:
		mov	ax, 1

loc_344BD:
		imul	word ptr [si+2Dh]
		mov	dx, [si+29h]
		sub	dx, ax
		mov	[si+29h], dx

loc_344C8:
		mov	ax, [si+2Bh]
		cmp	ax, [si+2Dh]
		jbe	short loc_344D5
		mov	ax, 1
		jmp	short loc_344D7

loc_344D5:
		xor	ax, ax

loc_344D7:
		mov	[bp+var_8], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		or	ax, ax
		jz	short loc_3450D
		cmp	word ptr [si+2Bh], 0
		jge	short loc_344EE
		mov	ax, 0FFFFh
		jmp	short loc_344F1

loc_344EE:
		mov	ax, 1

loc_344F1:
		add	[si+0Eh], ax
		cmp	word ptr [si+2Bh], 0
		jge	short loc_344FF
		mov	ax, 0FFFFh
		jmp	short loc_34502

loc_344FF:
		mov	ax, 1

loc_34502:
		imul	word ptr [si+2Dh]
		mov	dx, [si+2Bh]
		sub	dx, ax
		mov	[si+2Bh], dx

loc_3450D:
		inc	word ptr [si+2Fh]

loc_34510:
		pop	si
		leave
		retf
sub_34425		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34513		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2Fh]
		cmp	ax, [si+2Dh]
		jnz	short loc_34527
		mov	ax, 1
		jmp	short loc_34529

loc_34527:
		xor	ax, ax

loc_34529:
		pop	si
		pop	bp
		retf
sub_34513		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3452C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_34425
		pop	cx
		push	si
		push	cs
		call	near ptr sub_33C79
		pop	cx
		pop	si
		pop	bp
		retf
sub_3452C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34542		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_34571
		mov	word ptr [si], 4924h
		mov	word ptr [si+0Ah], 4944h
		push	0
		push	si
		push	cs
		call	near ptr Scene_Destruct_34348
		add	sp, 4
		test	di, 1
		jz	short loc_34571
		push	si
		call	sub_39C
		pop	cx

loc_34571:
		pop	di
		pop	si
		pop	bp
		retf
sub_34542		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34575		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_3458E
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_345E4

loc_3458E:
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
		mov	word ptr [si], 48F4h
		mov	word ptr [si+0Ah], 4914h

loc_345E4:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_34575		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_345E9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_34602
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_34616

loc_34602:
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Layer_ConstructAtOrigin_33EE1
		add	sp, 4
		mov	word ptr [si], 48F4h
		mov	word ptr [si+0Ah], 4914h

loc_34616:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_345E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AnimLayer_Construct_2E5CF (sub_2E5CF de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Calque animé : Layer_Construct_2DF9B puis table de méthodes dseg 16248, dont +28 =
; AnimLayer_Advance_2E607. L'image affichée +27 commence à 0.
; ==============================================================================================
AnimLayer_Construct_3461B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_34634
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3464E

loc_34634:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Layer_Construct_33FE7
		add	sp, 8
		mov	word ptr [si], 48F4h
		mov	word ptr [si+0Ah], 4914h

loc_3464E:
		mov	ax, si
		pop	si
		pop	bp
		retf
AnimLayer_Construct_3461B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34653		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_34697
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_38B8C
		cmp	ax, [si+1Bh]
		jbe	short loc_34697
		inc	word ptr [si+1Bh]

loc_34697:
		push	si
		push	cs
		call	near ptr sub_33C79
		pop	cx
		pop	si
		pop	bp
		retf
sub_34653		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AnimLayer_IsFinished_2E654 (sub_2E654 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Renvoie 1 si l'image +27 a atteint la dernière image de la ressource
; (Struct_GetElementCountMinusOne_33352), ou si aucune ressource n'est attachée.
; ==============================================================================================
AnimLayer_IsFinished_346A0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_346EA
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_38B8C
		cmp	ax, [si+1Bh]
		jnz	short loc_346E6
		mov	ax, 1
		jmp	short loc_346E8

loc_346E6:
		xor	ax, ax

loc_346E8:
		jmp	short loc_346EC

loc_346EA:
		mov	al, 1

loc_346EC:
		pop	si
		pop	bp
		retf
AnimLayer_IsFinished_346A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_Destruct_2DCFC (sub_2DCFC de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Destructeur de groupe de calques / scène : vide la liste (sub_2DB51), libère l'objet si bit
; 1 de l'argument.
; ==============================================================================================
Scene_Destruct_346EF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3471E
		mov	word ptr [si], 48F4h
		mov	word ptr [si+0Ah], 4914h
		push	0
		push	si
		push	cs
		call	near ptr sub_3410F
		add	sp, 4
		test	di, 1
		jz	short loc_3471E
		push	si
		call	sub_39C
		pop	cx

loc_3471E:
		pop	di
		pop	si
		pop	bp
		retf
Scene_Destruct_346EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à LoopAnimLayer_Advance_2E6D6 (sub_2E6D6 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Méthode +28 de l'animation en boucle (table de méthodes dseg 4958, calque fabriqué
; directement dans les cinématiques : Layer_Construct_2DF9B puis table, mode +29). Mode 0 :
; image +27 + 1, remise à 0 quand elle atteint Struct_GetElementCountMinusOne_33352 ; mode 1 :
; image − 1, sans borne. Puis avance les enfants. mid1 : mid1 20 (scènes 4 et 10), mid1 23
; (scène 7).
; ==============================================================================================
LoopAnimLayer_Advance_34722		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_34799
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_34799
		mov	al, [si+1Dh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_3476B
		cmp	ax, 1
		jz	short loc_34796
		jmp	short loc_34799

loc_3476B:
		inc	word ptr [si+1Bh]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_38B8C
		cmp	ax, [si+1Bh]
		jnz	short loc_34799
		mov	word ptr [si+1Bh], 0
		jmp	short loc_34799

loc_34796:
		dec	word ptr [si+1Bh]

loc_34799:
		push	si
		push	cs
		call	near ptr sub_33C79
		pop	cx
		pop	si
		pop	bp
		retf
LoopAnimLayer_Advance_34722		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_Destruct_2DCFC (sub_2DCFC de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Destructeur de groupe de calques / scène : vide la liste (sub_2DB51), libère l'objet si bit
; 1 de l'argument.
; ==============================================================================================
Scene_Destruct_347A2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_347D1
		mov	word ptr [si], 13DCh
		mov	word ptr [si+0Ah], 13FCh
		push	0
		push	si
		push	cs
		call	near ptr sub_3410F
		add	sp, 4
		test	di, 1
		jz	short loc_347D1
		push	si
		call	sub_39C
		pop	cx

loc_347D1:
		pop	di
		pop	si
		pop	bp
		retf
Scene_Destruct_347A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_347D5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Bh], 0
		jnz	short loc_347E7
		mov	ax, 1
		jmp	short loc_347E9

loc_347E7:
		xor	ax, ax

loc_347E9:
		pop	si
		pop	bp
		retf
sub_347D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_347EC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_34837
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_38B8C
		dec	ax
		cmp	ax, [si+1Bh]
		jnz	short loc_34833
		mov	ax, 1
		jmp	short loc_34835

loc_34833:
		xor	ax, ax

loc_34835:
		jmp	short loc_34839

loc_34837:
		mov	al, 1

loc_34839:
		pop	si
		pop	bp
		retf
sub_347EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3483C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_34890
		mov	al, [si+1Dh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_3486C
		cmp	ax, 1
		jz	short loc_3487C
		jmp	short loc_3488A

loc_3486C:
		push	si
		push	cs
		call	near ptr sub_347EC
		pop	cx
		or	al, al
		jz	short loc_3488A
		mov	byte ptr [si+1Dh], 1
		jmp	short loc_3488A

loc_3487C:
		push	si
		push	cs
		call	near ptr sub_347D5
		pop	cx
		or	al, al
		jz	short loc_3488A
		mov	byte ptr [si+1Dh], 0

loc_3488A:
		push	si
		push	cs
		call	near ptr LoopAnimLayer_Advance_34722
		pop	cx

loc_34890:
		push	si
		push	cs
		call	near ptr sub_33C79
		pop	cx
		pop	si
		pop	bp
		retf
sub_3483C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_34899		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_348C8
		mov	word ptr [si], 48C4h
		mov	word ptr [si+0Ah], 48E4h
		push	0
		push	si
		push	cs
		call	near ptr Scene_Destruct_347A2
		add	sp, 4
		test	di, 1
		jz	short loc_348C8
		push	si
		call	sub_39C
		pop	cx

loc_348C8:
		pop	di
		pop	si
		pop	bp
		retf
sub_34899		endp

; ----------------------------------------------------------------------

sub_348CC		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_3427B
sub_348CC		endp

; ----------------------------------------------------------------------

sub_348D8		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_MoveBy_342EA
sub_348D8		endp

; ----------------------------------------------------------------------

sub_348E4		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_3424E
sub_348E4		endp

; ----------------------------------------------------------------------

sub_348F0		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_3427B
sub_348F0		endp

; ----------------------------------------------------------------------

sub_348FC		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_MoveBy_342EA
sub_348FC		endp

; ----------------------------------------------------------------------

sub_34908		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_3424E
sub_34908		endp

; ----------------------------------------------------------------------

sub_34914		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_3427B
sub_34914		endp

; ----------------------------------------------------------------------

sub_34920		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_MoveBy_342EA
sub_34920		endp

; ----------------------------------------------------------------------

sub_3492C		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_3424E
sub_3492C		endp

; ----------------------------------------------------------------------

sub_34938		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_33D8B
sub_34938		endp

; ----------------------------------------------------------------------

sub_34944		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_MoveBy_33DAD
sub_34944		endp

; ----------------------------------------------------------------------

sub_34950		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_33D83
sub_34950		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3495C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_3497A
		mov	word ptr [si], 4984h
		test	ax, 1
		jz	short loc_3497A
		push	si
		call	sub_39C
		pop	cx

loc_3497A:
		pop	si
		pop	bp
		retf
sub_3495C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3497D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_34999
		test	dx, 1
		jz	short loc_34999
sub_3497D		endp
seg105		ends
