seg154		segment	para public 'CODE' use16
		assume cs:seg154
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_663B1		proc far
		push	bp
		mov	bp, sp
		push	si
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_663F5
		or	si, si
		jz	short loc_663C9
		jmp	short loc_663D2

loc_663C9:
		push	8
		push	cs
		call	near ptr sub_663B1
		pop	cx
		mov	si, ax

loc_663D2:
		or	ax, ax
		jz	short loc_663F1
		mov	word ptr [si], 4844h
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si], 4848h
		mov	word ptr [si+6], 0
		mov	ax, si
		jmp	short loc_663F3

loc_663F1:
		mov	ax, si

loc_663F3:
		jmp	short loc_663F7

loc_663F5:
		mov	ax, si

loc_663F7:
		mov	dx, ax
		or	dx, dx
		mov	ax, dx
		pop	si
		pop	bp
		retf
sub_663B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66400		proc far

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
		call	near ptr sub_663B1
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6643A
		mov	word ptr [di], 4844h
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	word ptr [di], 4848h
		mov	ax, [bp+var_2]
		mov	[di+6], ax
		mov	ax, di
		jmp	short loc_6643C

loc_6643A:
		mov	ax, di

loc_6643C:
		mov	di, ax
		mov	ax, [bp+arg_2]
		mov	[di+6], ax
		push	di
		push	si
		call	LinkedList_InsertAtTail_6876B
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_66400		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66452		proc far

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
		call	near ptr sub_663B1
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_6648C
		mov	word ptr [di], 4844h
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	word ptr [di], 4848h
		mov	ax, [bp+var_2]
		mov	[di+6], ax
		mov	ax, di
		jmp	short loc_6648E

loc_6648C:
		mov	ax, di

loc_6648E:
		mov	di, ax
		mov	ax, [bp+arg_2]
		mov	[di+6], ax
		push	di
		push	si
		call	LinkedList_InsertAtHead_6873D
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_66452		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_664A4		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_664EA

loc_664B6:
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
		call	near ptr sub_664A4
		pop	cx
		mov	bx, [bp+var_2]
		mov	di, [bx+6]
		or	di, di
		jz	short loc_664EA
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_664EA

loc_664EA:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68976
		add	sp, 4
		or	ax, ax
		jnz	short loc_664B6
		push	si
		call	sub_68938
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_664A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66506		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_66537
		mov	word ptr [si], 4031h
		push	si
		push	cs
		call	near ptr sub_664A4
		pop	cx
		mov	word ptr [si], 402Dh
		push	si
		call	sub_68938
		pop	cx
		test	di, 1
		jz	short loc_66537
		push	si
		call	sub_3B2
		pop	cx

loc_66537:
		pop	di
		pop	si
		pop	bp
		retf
sub_66506		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6653B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6656A
		mov	word ptr [si], 4035h
		push	2
		mov	ax, si
		add	ax, 4
		push	ax
		push	cs
		call	near ptr sub_66506
		add	sp, 4
		test	di, 1
		jz	short loc_6656A
		push	si
		call	sub_3B2
		pop	cx

loc_6656A:
		pop	di
		pop	si
		pop	bp
		retf
sub_6653B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à LayerGroup_Add_2DB84
; (sub_2DB84 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-17. Ajoute un calque à la liste +4 d'une scène ou d'un calque parent
; (sub_2DA16), puis le rattache au parent (sub_2DBAB, pas lue). Un calque enfant est dessiné
; par rapport à son parent.
; ==============================================================================================
LayerGroup_Add_6656E		proc far

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
		call	near ptr sub_66400
		add	sp, 4
		push	si
		push	di
		nop
		push	cs
		call	near ptr sub_66595
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
LayerGroup_Add_6656E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66595		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jnz	short loc_665A8
		mov	ax, [bp+arg_2]
		mov	[si+2], ax

loc_665A8:
		pop	si
		pop	bp
		retf
sub_66595		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_665AB		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_665EF

loc_665BC:
		mov	bx, [bp+var_2]
		mov	ax, [bx+6]
		cmp	ax, [bp+arg_2]
		jnz	short loc_665EF
		push	bx
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Remove_688C5
		add	sp, 4
		cmp	[bp+var_2], 0
		jz	short loc_665ED
		push	3
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_66605

loc_665ED:
		jmp	short loc_66605

loc_665EF:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_68976
		add	sp, 4
		or	ax, ax
		jnz	short loc_665BC

loc_66605:
		pop	si
		leave
		retf
sub_665AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66608		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+2], 0
		pop	si
		pop	bp
		retf
sub_66608		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66617		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_66637

loc_66628:
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		pop	cx

loc_66637:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_68976
		add	sp, 4
		or	ax, ax
		jnz	short loc_66628
		pop	si
		leave
		retf
sub_66617		endp

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
LayerGroup_Construct_66650		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_66669
		push	1Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_666E1

loc_66669:
		mov	word ptr [si], 4035h
		mov	word ptr [si+4], 402Dh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 4031h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 168h
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	word ptr [si+0Ah], 174h
		mov	word ptr [si], 4814h
		mov	word ptr [si+0Ah], 4834h
		xor	eax, eax
		mov	[si+19h], eax
		mov	[si+15h], eax
		cmp	[bp+arg_4], 0FFh
		jz	short loc_666C4
		mov	al, [bp+arg_4]
		push	ax
		push	word_7AF7C
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4

loc_666C4:
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr Scene_SetFps_66811
		add	sp, 4
		mov	al, [bp+arg_4]
		mov	[si+12h], al
		mov	ax, [bp+arg_6]
		mov	[si+13h], ax
		mov	word ptr [si+1Dh], 0

loc_666E1:
		mov	ax, si
		pop	si
		pop	bp
		retf
LayerGroup_Construct_66650		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_Destruct_2DCFC (sub_2DCFC de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Destructeur de groupe de calques / scène : vide la liste (sub_2DB51), libère l'objet si bit
; 1 de l'argument.
; ==============================================================================================
Scene_Destruct_666E6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_66715
		mov	word ptr [si], 4814h
		mov	word ptr [si+0Ah], 4834h
		push	0
		push	si
		push	cs
		call	near ptr sub_6653B
		add	sp, 4
		test	di, 1
		jz	short loc_66715
		push	si
		call	sub_3B2
		pop	cx

loc_66715:
		pop	di
		pop	si
		pop	bp
		retf
Scene_Destruct_666E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66719		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_66719		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66721		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_66721		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66729		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_66729		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66731		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		pop	si
		pop	bp
		retf
sub_66731		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6673E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Eh]
		pop	si
		pop	bp
		retf
sub_6673E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Layer_MoveBy_2E29E
; (sub_2E29E de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-21. Ajoute (arg_2, arg_4) à la position du calque (+0Ch, +0Eh). mid3
; : replace un décor défilant de 640 pixels quand il sort à gauche (x absolu < −319).
; ==============================================================================================
Layer_MoveBy_6674B		proc far

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
Layer_MoveBy_6674B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66770		proc far

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
		mov	eax, dword_7B29D
		mov	[si+15h], eax
		cmp	byte ptr [si+12h], 0FFh
		jz	short loc_667C3
		mov	al, [si+12h]
		push	ax
		push	word_7AF7C
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		jmp	short loc_667C3

loc_667AC:
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_2]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_667C3:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_68976
		add	sp, 4
		or	ax, ax
		jnz	short loc_667AC
		push	word_7AF7C
		push	word ptr [si+13h]
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	ax, si
		add	ax, 15h
		push	ax
		call	Stopwatch_WaitElapsed_6F93E
		pop	cx
		pop	si
		leave
		retf
sub_66770		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Scene_AdvanceFrame_2DE14 (sub_2DE14 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-17. Méthode virtuelle +28 de la scène :
; avance tous les calques (LayerGroup_AdvanceAll_2DC2D) puis incrémente le compteur d'images
; +29 (comparé par les cinématiques pour déclencher sons et changements).
; ==============================================================================================
Scene_AdvanceFrame_667FE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_66617
		pop	cx
		inc	word ptr [si+1Dh]
		pop	si
		pop	bp
		retf
Scene_AdvanceFrame_667FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Scene_SetFps_2DE27
; (sub_2DE27 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-17. Durée d'une image de scène (+16) = 60 / arg_2 tics, au moins 1
; (tics à 60 Hz). Utilisé avec 10, 15 et 20 images par seconde dans la cinématique mid1.
; ==============================================================================================
Scene_SetFps_66811		proc far

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
		jge	short loc_6682C
		mov	ax, 1
		jmp	short loc_66833

loc_6682C:
		mov	ax, 3Ch
		xor	dx, dx
		div	bx

loc_66833:
		mov	[si+10h], ax
		pop	si
		pop	bp
		retf
Scene_SetFps_66811		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66839		proc far

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
sub_66839		endp

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
Layer_ConstructAtOrigin_6687F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_66898
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_668FA

loc_66898:
		mov	word ptr [si], 4035h
		mov	word ptr [si+4], 402Dh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 4031h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 168h
		mov	word ptr [si+0Ah], 174h
		mov	word ptr [si+0Ah], 184h
		mov	word ptr [si], 4055h
		mov	word ptr [si+0Ah], 4075h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_66839
		add	sp, 4
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0

loc_668FA:
		mov	ax, si
		pop	si
		pop	bp
		retf
Layer_ConstructAtOrigin_6687F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_668FF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_66918
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_66980

loc_66918:
		mov	word ptr [si], 4035h
		mov	word ptr [si+4], 402Dh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 4031h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 168h
		mov	word ptr [si+0Ah], 174h
		mov	word ptr [si+0Ah], 184h
		mov	word ptr [si], 4055h
		mov	word ptr [si+0Ah], 4075h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_66839
		add	sp, 4
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+0Eh], 0
		mov	ax, [bp+arg_4]
		mov	[si+1Bh], ax

loc_66980:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_668FF		endp

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
Layer_Construct_66985		proc far

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
		jnz	short loc_669A1
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_66A11

loc_669A1:
		mov	word ptr [si], 4035h
		mov	word ptr [si+4], 402Dh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 4031h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 168h
		mov	word ptr [si+0Ah], 174h
		mov	word ptr [si+0Ah], 184h
		mov	word ptr [si], 4055h
		mov	word ptr [si+0Ah], 4075h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_66839
		add	sp, 4
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[si+0Ch], ax
		mov	ax, [bp+var_4]
		mov	[si+0Eh], ax

loc_66A11:
		mov	ax, si
		pop	si
		leave
		retf
Layer_Construct_66985		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ImageLayer_Construct_2E02C (sub_2E02C de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Comme Layer_Construct_2DF9B, avec le numéro d'image affichée +27 = arg_8 : image fixe n de
; la ressource.
; ==============================================================================================
ImageLayer_Construct_66A16		proc far

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
		jnz	short loc_66A32
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_66AA8

loc_66A32:
		mov	word ptr [si], 4035h
		mov	word ptr [si+4], 402Dh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 4031h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 168h
		mov	word ptr [si+0Ah], 174h
		mov	word ptr [si+0Ah], 184h
		mov	word ptr [si], 4055h
		mov	word ptr [si+0Ah], 4075h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_66839
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

loc_66AA8:
		mov	ax, si
		pop	si
		leave
		retf
ImageLayer_Construct_66A16		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66AAD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_66B1F
		mov	word ptr [si], 4055h
		mov	word ptr [si+0Ah], 4075h
		push	si
		push	si
		push	cs
		call	near ptr sub_665AB
		add	sp, 4
		cmp	byte ptr [si+16h], 0
		jz	short loc_66AF4
		cmp	dword ptr [si+11h], 0
		jz	short loc_66AF4
		push	0
		mov	al, [si+15h]
		push	ax
		mov	ax, si
		add	ax, 11h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_66AF4

loc_66AF4:
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	0
		push	si
		push	cs
		call	near ptr sub_6653B
		add	sp, 4
		test	di, 1
		jz	short loc_66B1F
		push	si
		call	sub_3B2
		pop	cx

loc_66B1F:
		pop	di
		pop	si
		pop	bp
		retf
sub_66AAD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66B23		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_66B41
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		pop	cx
		add	ax, [si+0Ch]
		jmp	short loc_66B44

loc_66B41:
		mov	ax, [si+0Ch]

loc_66B44:
		pop	si
		pop	bp
		retf
sub_66B23		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66B47		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_66B65
		push	word ptr [si+2]
		mov	bx, [si+2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx
		add	ax, [si+0Eh]
		jmp	short loc_66B68

loc_66B65:
		mov	ax, [si+0Eh]

loc_66B68:
		pop	si
		pop	bp
		retf
sub_66B47		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66B6B		proc far

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
		jz	short loc_66BB6
		push	dx
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		jmp	short loc_66BB6

loc_66BB6:
		mov	[bp+var_6], 0
		jmp	short loc_66BD2

loc_66BBD:
		push	[bp+arg_4]
		push	di
		mov	bx, [bp+var_6]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_66BD2:
		lea	ax, [bp+var_6]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_68976
		add	sp, 4
		or	ax, ax
		jnz	short loc_66BBD
		pop	di
		pop	si
		leave
		retf
sub_66B6B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Layer_DrawAtOwnPos_2E202 (sub_2E202 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-17. Dessine le calque à sa position absolue
; (méthodes +4 et +8 = x et y absolus, Layer_GetX_2E139 / Layer_GetY_2E15D) par
; Layer_DrawAt_2E181.
; ==============================================================================================
Layer_DrawAtOwnPos_66BEC		proc far

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
		call	near ptr sub_66B6B
		add	sp, 6
		pop	si
		leave
		retf
Layer_DrawAtOwnPos_66BEC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66C19		proc far

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
		call	near ptr sub_66B6B
		add	sp, 6
		pop	si
		leave
		retf
sub_66C19		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66C44		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+16h], 0
		jz	short loc_66C71
		cmp	dword ptr [si+11h], 0
		jz	short loc_66C71
		push	0
		mov	al, [si+15h]
		push	ax
		mov	ax, si
		add	ax, 11h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_66C71

loc_66C71:
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		pop	si
		pop	bp
		retf
sub_66C44		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Layer_MoveBy_2E29E
; (sub_2E29E de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-21. Ajoute (arg_2, arg_4) à la position du calque (+0Ch, +0Eh). mid3
; : replace un décor défilant de 640 pixels quand il sort à gauche (x absolu < −319).
; ==============================================================================================
Layer_MoveBy_66C88		proc far

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
Layer_MoveBy_66C88		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66CAD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr sub_66617
		pop	cx
		pop	bp
		retf
sub_66CAD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66CBB		proc far

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
		call	near ptr sub_66617
		pop	cx
		pop	si
		leave
		retf
sub_66CBB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_Destruct_2DCFC (sub_2DCFC de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Destructeur de groupe de calques / scène : vide la liste (sub_2DB51), libère l'objet si bit
; 1 de l'argument.
; ==============================================================================================
Scene_Destruct_66CE6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_66D15
		mov	word ptr [si], 47E4h
		mov	word ptr [si+0Ah], 4804h
		push	0
		push	si
		push	cs
		call	near ptr sub_66AAD
		add	sp, 4
		test	di, 1
		jz	short loc_66D15
		push	si
		call	sub_3B2
		pop	cx

loc_66D15:
		pop	di
		pop	si
		pop	bp
		retf
Scene_Destruct_66CE6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66D19		proc far

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
sub_66D19		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66D6B		proc far

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
sub_66D6B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66DC3		proc far

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
		jbe	short loc_66DD8
		jmp	loc_66EAE

loc_66DD8:
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
		jbe	short loc_66E2E
		mov	ax, 1
		jmp	short loc_66E30

loc_66E2E:
		xor	ax, ax

loc_66E30:
		mov	[bp+var_6], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		or	ax, ax
		jz	short loc_66E66
		cmp	word ptr [si+29h], 0
		jge	short loc_66E47
		mov	ax, 0FFFFh
		jmp	short loc_66E4A

loc_66E47:
		mov	ax, 1

loc_66E4A:
		add	[si+0Ch], ax
		cmp	word ptr [si+29h], 0
		jge	short loc_66E58
		mov	ax, 0FFFFh
		jmp	short loc_66E5B

loc_66E58:
		mov	ax, 1

loc_66E5B:
		imul	word ptr [si+2Dh]
		mov	dx, [si+29h]
		sub	dx, ax
		mov	[si+29h], dx

loc_66E66:
		mov	ax, [si+2Bh]
		cmp	ax, [si+2Dh]
		jbe	short loc_66E73
		mov	ax, 1
		jmp	short loc_66E75

loc_66E73:
		xor	ax, ax

loc_66E75:
		mov	[bp+var_8], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		or	ax, ax
		jz	short loc_66EAB
		cmp	word ptr [si+2Bh], 0
		jge	short loc_66E8C
		mov	ax, 0FFFFh
		jmp	short loc_66E8F

loc_66E8C:
		mov	ax, 1

loc_66E8F:
		add	[si+0Eh], ax
		cmp	word ptr [si+2Bh], 0
		jge	short loc_66E9D
		mov	ax, 0FFFFh
		jmp	short loc_66EA0

loc_66E9D:
		mov	ax, 1

loc_66EA0:
		imul	word ptr [si+2Dh]
		mov	dx, [si+2Bh]
		sub	dx, ax
		mov	[si+2Bh], dx

loc_66EAB:
		inc	word ptr [si+2Fh]

loc_66EAE:
		pop	si
		leave
		retf
sub_66DC3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66EB1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2Fh]
		cmp	ax, [si+2Dh]
		jnz	short loc_66EC5
		mov	ax, 1
		jmp	short loc_66EC7

loc_66EC5:
		xor	ax, ax

loc_66EC7:
		pop	si
		pop	bp
		retf
sub_66EB1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66ECA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_66DC3
		pop	cx
		push	si
		push	cs
		call	near ptr sub_66617
		pop	cx
		pop	si
		pop	bp
		retf
sub_66ECA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66EE0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_66F0F
		mov	word ptr [si], 47B4h
		mov	word ptr [si+0Ah], 47D4h
		push	0
		push	si
		push	cs
		call	near ptr Scene_Destruct_66CE6
		add	sp, 4
		test	di, 1
		jz	short loc_66F0F
		push	si
		call	sub_3B2
		pop	cx

loc_66F0F:
		pop	di
		pop	si
		pop	bp
		retf
sub_66EE0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66F13		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_66F2C
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_66F82

loc_66F2C:
		mov	word ptr [si], 4035h
		mov	word ptr [si+4], 402Dh
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	word ptr [si+4], 4031h
		mov	word ptr [si+2], 0
		mov	word ptr [si+0Ah], 168h
		mov	word ptr [si+0Ah], 174h
		mov	word ptr [si+0Ah], 184h
		mov	word ptr [si], 4055h
		mov	word ptr [si+0Ah], 4075h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	word ptr [si], 4784h
		mov	word ptr [si+0Ah], 47A4h

loc_66F82:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_66F13		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66F87		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_66FA0
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_66FB4

loc_66FA0:
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Layer_ConstructAtOrigin_6687F
		add	sp, 4
		mov	word ptr [si], 4784h
		mov	word ptr [si+0Ah], 47A4h

loc_66FB4:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_66F87		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AnimLayer_Construct_2E5CF (sub_2E5CF de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Calque animé : Layer_Construct_2DF9B puis table de méthodes dseg 16248, dont +28 =
; AnimLayer_Advance_2E607. L'image affichée +27 commence à 0.
; ==============================================================================================
AnimLayer_Construct_66FB9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_66FD2
		push	1Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_66FEC

loc_66FD2:
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Layer_Construct_66985
		add	sp, 8
		mov	word ptr [si], 4784h
		mov	word ptr [si+0Ah], 47A4h

loc_66FEC:
		mov	ax, si
		pop	si
		pop	bp
		retf
AnimLayer_Construct_66FB9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66FF1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_67035
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_6AB8C
		cmp	ax, [si+1Bh]
		jbe	short loc_67035
		inc	word ptr [si+1Bh]

loc_67035:
		push	si
		push	cs
		call	near ptr sub_66617
		pop	cx
		pop	si
		pop	bp
		retf
sub_66FF1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AnimLayer_IsFinished_2E654 (sub_2E654 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Renvoie 1 si l'image +27 a atteint la dernière image de la ressource
; (Struct_GetElementCountMinusOne_33352), ou si aucune ressource n'est attachée.
; ==============================================================================================
AnimLayer_IsFinished_6703E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_67088
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_6AB8C
		cmp	ax, [si+1Bh]
		jnz	short loc_67084
		mov	ax, 1
		jmp	short loc_67086

loc_67084:
		xor	ax, ax

loc_67086:
		jmp	short loc_6708A

loc_67088:
		mov	al, 1

loc_6708A:
		pop	si
		pop	bp
		retf
AnimLayer_IsFinished_6703E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_Destruct_2DCFC (sub_2DCFC de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Destructeur de groupe de calques / scène : vide la liste (sub_2DB51), libère l'objet si bit
; 1 de l'argument.
; ==============================================================================================
Scene_Destruct_6708D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_670BC
		mov	word ptr [si], 4784h
		mov	word ptr [si+0Ah], 47A4h
		push	0
		push	si
		push	cs
		call	near ptr sub_66AAD
		add	sp, 4
		test	di, 1
		jz	short loc_670BC
		push	si
		call	sub_3B2
		pop	cx

loc_670BC:
		pop	di
		pop	si
		pop	bp
		retf
Scene_Destruct_6708D		endp

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
LoopAnimLayer_Advance_670C0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_67137
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_67137
		mov	al, [si+1Dh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_67109
		cmp	ax, 1
		jz	short loc_67134
		jmp	short loc_67137

loc_67109:
		inc	word ptr [si+1Bh]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_6AB8C
		cmp	ax, [si+1Bh]
		jnz	short loc_67137
		mov	word ptr [si+1Bh], 0
		jmp	short loc_67137

loc_67134:
		dec	word ptr [si+1Bh]

loc_67137:
		push	si
		push	cs
		call	near ptr sub_66617
		pop	cx
		pop	si
		pop	bp
		retf
LoopAnimLayer_Advance_670C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Scene_Destruct_2DCFC (sub_2DCFC de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-17.
; Destructeur de groupe de calques / scène : vide la liste (sub_2DB51), libère l'objet si bit
; 1 de l'argument.
; ==============================================================================================
Scene_Destruct_67140		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_6716F
		mov	word ptr [si], 3750h
		mov	word ptr [si+0Ah], 3770h
		push	0
		push	si
		push	cs
		call	near ptr sub_66AAD
		add	sp, 4
		test	di, 1
		jz	short loc_6716F
		push	si
		call	sub_3B2
		pop	cx

loc_6716F:
		pop	di
		pop	si
		pop	bp
		retf
Scene_Destruct_67140		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67173		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Bh], 0
		jnz	short loc_67185
		mov	ax, 1
		jmp	short loc_67187

loc_67185:
		xor	ax, ax

loc_67187:
		pop	si
		pop	bp
		retf
sub_67173		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6718A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_671D5
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_6AB8C
		dec	ax
		cmp	ax, [si+1Bh]
		jnz	short loc_671D1
		mov	ax, 1
		jmp	short loc_671D3

loc_671D1:
		xor	ax, ax

loc_671D3:
		jmp	short loc_671D7

loc_671D5:
		mov	al, 1

loc_671D7:
		pop	si
		pop	bp
		retf
sub_6718A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_671DA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_6722E
		mov	al, [si+1Dh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_6720A
		cmp	ax, 1
		jz	short loc_6721A
		jmp	short loc_67228

loc_6720A:
		push	si
		push	cs
		call	near ptr sub_6718A
		pop	cx
		or	al, al
		jz	short loc_67228
		mov	byte ptr [si+1Dh], 1
		jmp	short loc_67228

loc_6721A:
		push	si
		push	cs
		call	near ptr sub_67173
		pop	cx
		or	al, al
		jz	short loc_67228
		mov	byte ptr [si+1Dh], 0

loc_67228:
		push	si
		push	cs
		call	near ptr LoopAnimLayer_Advance_670C0
		pop	cx

loc_6722E:
		push	si
		push	cs
		call	near ptr sub_66617
		pop	cx
		pop	si
		pop	bp
		retf
sub_671DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_67237		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_67266
		mov	word ptr [si], 4754h
		mov	word ptr [si+0Ah], 4774h
		push	0
		push	si
		push	cs
		call	near ptr Scene_Destruct_67140
		add	sp, 4
		test	di, 1
		jz	short loc_67266
		push	si
		call	sub_3B2
		pop	cx

loc_67266:
		pop	di
		pop	si
		pop	bp
		retf
sub_67237		endp

; ----------------------------------------------------------------------

sub_6726A		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_66C19
sub_6726A		endp

; ----------------------------------------------------------------------

sub_67276		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_MoveBy_66C88
sub_67276		endp

; ----------------------------------------------------------------------

sub_67282		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_66BEC
sub_67282		endp

; ----------------------------------------------------------------------

sub_6728E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_66C19
sub_6728E		endp

; ----------------------------------------------------------------------

sub_6729A		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_MoveBy_66C88
sub_6729A		endp

; ----------------------------------------------------------------------

sub_672A6		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_66BEC
sub_672A6		endp

; ----------------------------------------------------------------------

sub_672B2		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_66C19
sub_672B2		endp

; ----------------------------------------------------------------------

sub_672BE		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_MoveBy_66C88
sub_672BE		endp

; ----------------------------------------------------------------------

sub_672CA		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_66BEC
sub_672CA		endp

; ----------------------------------------------------------------------

sub_672D6		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_66C19
sub_672D6		endp

; ----------------------------------------------------------------------

sub_672E2		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_MoveBy_66C88
sub_672E2		endp

; ----------------------------------------------------------------------

sub_672EE		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_DrawAtOwnPos_66BEC
sub_672EE		endp

; ----------------------------------------------------------------------

sub_672FA		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_66729
sub_672FA		endp

; ----------------------------------------------------------------------

sub_67306		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	Layer_MoveBy_6674B
sub_67306		endp

; ----------------------------------------------------------------------

sub_67312		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		nop
		nop
		jmp	sub_66721
sub_67312		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6731E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_6733C
		mov	word ptr [si], 4844h
		test	ax, 1
		jz	short loc_6733C
		push	si
		call	sub_3B2
		pop	cx

loc_6733C:
		pop	si
		pop	bp
		retf
sub_6731E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6733F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_6735B
		test	dx, 1
sub_6733F		endp
seg154		ends
