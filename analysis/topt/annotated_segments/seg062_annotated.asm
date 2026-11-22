seg062		segment	para public 'CODE' use16
		assume cs:seg062
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 90h, 0EBh, 7

loc_24A23:
		db 8Bh, 5Ch, 52h, 2Bh, 0D8h, 8Bh, 0C3h

loc_24A2A:
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24A2E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jnz	short loc_24A4B
		push	37E0h
		push	si
		nop
		push	cs
		call	near ptr sub_24C5E
		add	sp, 4
		mov	[si+2], ax
		mov	[si], ax

loc_24A4B:
		pop	si
		pop	bp
		retf
sub_24A2E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Construct (sub_1FDBC de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Container_Construct (sub_21E90 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,28L — constructeur d'une liste chaînée vide
; (tête/queue à 0, type 0x1104) : constructeur de conteneur liste générique (template C++).
; ==============================================================================================
Container_Construct		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+2], ax
		mov	[si], ax
		push	37E0h
		push	si
		nop
		push	cs
		call	near ptr sub_24C5E
		add	sp, 4
		mov	[si+2], ax
		mov	[si], ax
		pop	si
		pop	bp
		retf
Container_Construct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Container_ConstructTyped (sub_1FDDE de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Container_ConstructTyped (sub_21EB2 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far,24L — variante de sub_21E90 avec
; type paramétrable : constructeur de conteneur liste générique (variante paramétrée).
; ==============================================================================================
Container_ConstructTyped		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	ax, ax
		mov	[si+2], ax
		mov	[si], ax
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_24C5E
		add	sp, 4
		mov	[si+2], ax
		mov	[si], ax
		pop	si
		pop	bp
		retf
Container_ConstructTyped		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24A92		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_24AAD
		push	0Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_24AB8

loc_24AAD:
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Container_ConstructTyped
		add	sp, 4

loc_24AB8:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_24A92		endp

; START OF FUNCTION CHUNK FOR sub_24A92
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_24A92

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24AC0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_24ADB
		push	0Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_24AE3

loc_24ADB:
		push	si
		push	cs
		call	near ptr Container_Construct
		add	sp, 2

loc_24AE3:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_24AC0		endp

; START OF FUNCTION CHUNK FOR sub_24AC0
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_24AC0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24AEB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_24B12
		push	si
		nop
		push	cs
		call	near ptr sub_24F65
		add	sp, 2
		test	di, 1
		jz	short loc_24B12
		push	si
		call	sub_39C
		add	sp, 2

loc_24B12:
		pop	di
		pop	si
		pop	bp
		retf
sub_24AEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24B16		proc far

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
		xor	di, di
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_24C5E
		add	sp, 4
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_24B6B
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		mov	[bp+var_8], 0
		cmp	[bp+var_4], 0
		jz	short loc_24B68
		cmp	[bp+var_6], 0
		jz	short loc_24B68
		push	[bp+var_6]
		push	[bp+var_4]
		nop
		push	cs
		call	near ptr List_AppendTail_25970
		add	sp, 4
		mov	[bp+var_8], ax
		jmp	short loc_24B68

loc_24B68:
		mov	di, [bp+var_8]

loc_24B6B:
		or	di, di
		jz	short loc_24B75
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_24B75:
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_24B16		endp

; START OF FUNCTION CHUNK FOR sub_24B16
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_24B16

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24B7F		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	[bp+var_6], 0
		or	di, di
		jz	short loc_24BB2
		cmp	[bp+var_4], 0
		jz	short loc_24BB2
		push	[bp+var_4]
		push	di
		nop
		push	cs
		call	near ptr List_AppendTail_25970
		add	sp, 4
		mov	[bp+var_6], ax
		jmp	short loc_24BB2

loc_24BB2:
		mov	ax, [bp+var_6]
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_24BC4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_24BC4:
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_24B7F		endp

; START OF FUNCTION CHUNK FOR sub_24B7F
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_24B7F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Container_UnlinkNode
; (sub_1FF3C de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Container_UnlinkNode (sub_21FC6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,36L — retire un nœud (di) de la liste chaînée (mise à jour
; tête/queue/liens) : unlink de nœud dans le conteneur liste (opération interne).
; ==============================================================================================
Container_UnlinkNode		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		cmp	[si], di
		jnz	short loc_24BE5
		mov	ax, [di+9]
		mov	[si], ax

loc_24BE5:
		cmp	[si+2], di
		jnz	short loc_24BED
		mov	[si+2], dx

loc_24BED:
		or	dx, dx
		jz	short loc_24BF9
		mov	ax, [di+9]
		mov	bx, dx
		mov	[bx+9], ax

loc_24BF9:
		pop	di
		pop	si
		pop	bp
		retf
Container_UnlinkNode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Container_FindAndRemove
; (sub_1FF6B de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s)
; (adresses de données ou constantes) — à vérifier à Container_FindAndRemove (sub_21FF5 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,29L
; — recherche (sub_22555) puis retire (sub_2235C) une entrée par clé : suppression d'une
; entrée du conteneur par clé (find+remove).
; ==============================================================================================
Container_FindAndRemove		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_2517F
		add	sp, 4
		mov	di, ax
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_24F1E
		add	sp, 4
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
Container_FindAndRemove		endp

; START OF FUNCTION CHUNK FOR Container_FindAndRemove
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR Container_FindAndRemove

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24C27		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Container_FindAndRemove
		add	sp, 4
		mov	di, ax
		or	di, di
		jz	short loc_24C4B
		push	3
		push	di
		nop
		push	cs
		call	near ptr sub_25945
		add	sp, 4

loc_24C4B:
		or	di, di
		jz	short loc_24C54
		mov	ax, 1
		jmp	short loc_24C56

loc_24C54:
		xor	ax, ax

loc_24C56:
		pop	di
		pop	si
		pop	bp
		retf
sub_24C27		endp

; START OF FUNCTION CHUNK FOR sub_24C27
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_24C27

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24C5E		proc far

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
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_2517F
		add	sp, 4
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jnz	short loc_24CD7
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	0Fh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_24CC0
		push	di
		call	sub_1109C
		add	sp, 2
		push	8
		push	[bp+var_4]
		push	di
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [di+8], 0
		mov	word ptr [di+9], 0
		xor	ax, ax
		mov	[di+0Dh], ax
		mov	[di+0Bh], ax
		mov	ax, di
		jmp	short loc_24CC2

loc_24CC0:
		mov	ax, di

loc_24CC2:
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_24CD7
		push	[bp+var_2]
		push	si
		nop
		push	cs
		call	near ptr Container_Append
		add	sp, 4

loc_24CD7:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_24C5E		endp

; START OF FUNCTION CHUNK FOR sub_24C5E
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_24C5E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Container_Append
; (sub_20050 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à Container_Append
; (sub_220BF de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,35L — insère un nœud en fin de liste (chaînage tête/queue) : append au conteneur
; liste.
; ==============================================================================================
Container_Append		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_24D0E
		mov	word ptr [di+9], 0
		cmp	word ptr [si+2], 0
		jnz	short loc_24D05
		mov	ax, di
		mov	[si+2], ax
		mov	[si], ax
		jmp	short loc_24D0E

loc_24D05:
		mov	bx, [si+2]
		mov	[bx+9], di
		mov	[si+2], di

loc_24D0E:
		pop	di
		pop	si
		pop	bp
		retf
Container_Append		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24D12		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		jmp	short loc_24D27

loc_24D26:
		inc	di

loc_24D27:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_250C8
		add	sp, 4
		or	ax, ax
		jnz	short loc_24D26
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_24D12		endp

; START OF FUNCTION CHUNK FOR sub_24D12
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_24D12

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24D42		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_24D60

loc_24D57:
		mov	ax, di
		dec	di
		or	ax, ax
		jl	short loc_24D60
		jmp	short loc_24D71

loc_24D60:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_250C8
		add	sp, 4
		or	ax, ax
		jnz	short loc_24D57

loc_24D71:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_24D42		endp

; START OF FUNCTION CHUNK FOR sub_24D42
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_24D42

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24D7C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	word ptr [si]
		nop
		push	cs
		call	near ptr sub_25AD2
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_24D7C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24D93		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si]
		nop
		push	cs
		call	near ptr sub_25A93
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_24D93		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24DA7		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_24DD4

loc_24DBC:
		mov	bx, [bp+var_2]
		cmp	byte ptr [bx+5], 1
		jnz	short loc_24DD4
		push	di
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4

loc_24DD4:
		cmp	[bp+var_2], 0
		jnz	short loc_24DE4
		mov	bx, [si]
		mov	ax, [bx+0Bh]
		mov	[bp+var_2], ax
		jmp	short loc_24DED

loc_24DE4:
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax

loc_24DED:
		cmp	[bp+var_2], 0
		jnz	short loc_24DBC
		pop	di
		pop	si
		leave
		retf
sub_24DA7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24DF7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	word_4C1C9, 0
		xor	di, di
		jmp	short loc_24E18

loc_24E09:
		mov	bx, di
		shl	bx, 2
		mov	dword ptr [bx+6A5Ch], 0
		inc	di

loc_24E18:
		cmp	di, 8
		jl	short loc_24E09
		push	word ptr [si]
		nop
		push	cs
		call	near ptr sub_24E2B
		add	sp, 2
		pop	di
		pop	si
		pop	bp
		retf
sub_24DF7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24E2B		proc far

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
		mov	[bp+var_2], 0
		jmp	short loc_24EB9

loc_24E3F:
		inc	word_4C1C9
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_24EB6
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_24EB6
		push	0
		push	[bp+var_2]
		push	word ptr [bp+var_6+2]
		push	word ptr [bp+var_6]
		les	bx, word ptr [bp+var_6]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		or	al, al
		jz	short loc_24EB6
		push	[bp+var_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		cmp	[bp+var_2], 0
		jz	short loc_24EB1
		push	3
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_24EB1

loc_24EB1:
		mov	[bp+var_2], di
		jmp	short loc_24EB9

loc_24EB6:
		mov	di, [bp+var_2]

loc_24EB9:
		cmp	[bp+var_2], 0
		jnz	short loc_24EC7
		mov	ax, [si+0Bh]
		mov	[bp+var_2], ax
		jmp	short loc_24ED0

loc_24EC7:
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax

loc_24ED0:
		cmp	[bp+var_2], 0
		jz	short loc_24ED9
		jmp	loc_24E3F

loc_24ED9:
		pop	di
		pop	si
		leave
		retf
sub_24E2B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24EDD		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_24EFC

loc_24EEE:
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 2

loc_24EFC:
		cmp	[bp+var_2], 0
		jnz	short loc_24F0C
		mov	bx, [si]
		mov	ax, [bx+0Bh]
		mov	[bp+var_2], ax
		jmp	short loc_24F15

loc_24F0C:
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax

loc_24F15:
		cmp	[bp+var_2], 0
		jnz	short loc_24EEE
		pop	si
		leave
		retf
sub_24EDD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24F1E		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 0
		jz	short loc_24F5B
		mov	di, [si]
		mov	[bp+var_2], 0
		jmp	short loc_24F57

loc_24F38:
		cmp	di, [bp+arg_2]
		jnz	short loc_24F51
		push	di
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr Container_UnlinkNode
		add	sp, 6
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
		jmp	short loc_24F57

loc_24F51:
		mov	[bp+var_2], di
		mov	di, [di+9]

loc_24F57:
		or	di, di
		jnz	short loc_24F38

loc_24F5B:
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_24F1E		endp

; START OF FUNCTION CHUNK FOR sub_24F1E
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_24F1E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24F65		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		jmp	short loc_24F82

loc_24F6F:
		mov	bx, [si]
		mov	di, [bx+9]
		push	3
		push	word ptr [si]
		nop
		push	cs
		call	near ptr sub_25945
		add	sp, 4
		mov	[si], di

loc_24F82:
		cmp	word ptr [si], 0
		jnz	short loc_24F6F
		xor	ax, ax
		mov	[si+2], ax
		mov	[si], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_24F65		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24F92		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si]
		jmp	short loc_24FB7

loc_24F9E:
		push	[bp+arg_2]
		push	di
		nop
		push	cs
		call	near ptr sub_25B51
		add	sp, 4
		or	al, al
		jz	short loc_24FB4
		mov	al, 1
		pop	di
		pop	si
		pop	bp
		retf

loc_24FB4:
		mov	di, [di+9]

loc_24FB7:
		or	di, di
		jnz	short loc_24F9E
		mov	al, 0
		pop	di
		pop	si
		pop	bp
		retf
sub_24F92		endp

; START OF FUNCTION CHUNK FOR sub_24F92
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_24F92

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24FC5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si]
		jmp	short loc_24FEA

loc_24FD1:
		push	[bp+arg_2]
		push	di
		nop
		push	cs
		call	near ptr sub_25C6E
		add	sp, 4
		or	al, al
		jz	short loc_24FE7
		mov	al, 1
		pop	di
		pop	si
		pop	bp
		retf

loc_24FE7:
		mov	di, [di+9]

loc_24FEA:
		or	di, di
		jnz	short loc_24FD1
		mov	al, 0
		pop	di
		pop	si
		pop	bp
		retf
sub_24FC5		endp

; START OF FUNCTION CHUNK FOR sub_24FC5
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_24FC5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24FF8		proc far

var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_E], eax
		push	8
		push	word ptr [bp+var_E+2]
		push	word ptr [bp+var_E]
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	sub_36A8
		add	sp, 0Ah
		mov	[bp+var_2], 0
		mov	[bp+var_10], 0
		jmp	short loc_2505B

loc_2502A:
		mov	bx, [bp+var_10]
		mov	eax, [bx+6]
		mov	[bp+var_14], eax
		push	8
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_25053
		mov	ax, 1
		jmp	short loc_25055

loc_25053:
		xor	ax, ax

loc_25055:
		or	al, al
		jz	short loc_2505B
		jmp	short loc_2506C

loc_2505B:
		lea	ax, [bp+var_10]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_250C8
		add	sp, 4
		or	ax, ax
		jnz	short loc_2502A

loc_2506C:
		mov	ax, [bp+var_10]
		pop	si
		leave
		retf
sub_24FF8		endp

; START OF FUNCTION CHUNK FOR sub_24FF8
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_24FF8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25075		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_2517F
		add	sp, 4
		mov	[si+4], ax
		cmp	word ptr [si+4], 0
		jz	short loc_250B9
		mov	di, [bp+arg_4]
		cmp	word ptr [di], 0
		jnz	short loc_250A4
		mov	bx, [si+4]
		mov	ax, [bx+0Bh]
		mov	[di], ax
		jmp	short loc_250AB

loc_250A4:
		mov	bx, [di]
		mov	ax, [bx+2]
		mov	[di], ax

loc_250AB:
		cmp	word ptr [di], 0
		jz	short loc_250B9
		mov	bx, [bp+arg_4]
		mov	ax, [bx]
		pop	di
		pop	si
		pop	bp
		retf

loc_250B9:
		mov	bx, [bp+arg_4]
		xor	ax, ax
		mov	[bx], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_25075		endp

; START OF FUNCTION CHUNK FOR sub_25075
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_25075

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_250C8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di]
		mov	[si+6], ax
		cmp	word ptr [di], 0
		jnz	short loc_2510D
		mov	word ptr [si+8], 0
		mov	ax, [si]
		mov	[si+4], ax
		jmp	short loc_25105

loc_250E9:
		mov	bx, [si+4]
		mov	ax, [bx+0Bh]
		mov	[si+8], ax
		cmp	word ptr [si+8], 0
		jz	short loc_250FC
		jmp	short loc_2510B
		jmp	short loc_25105

loc_250FC:
		mov	bx, [si+4]
		mov	ax, [bx+9]
		mov	[si+4], ax

loc_25105:
		cmp	word ptr [si+4], 0
		jnz	short loc_250E9

loc_2510B:
		jmp	short loc_25172

loc_2510D:
		mov	bx, [di]
		mov	ax, [bx+2]
		mov	[si+8], ax
		cmp	word ptr [si+8], 0
		jnz	short loc_25172
		mov	ax, [si]
		mov	[si+4], ax
		jmp	short loc_2516C

loc_25122:
		mov	bx, [si+4]
		mov	ax, [bx+0Dh]
		cmp	ax, [di]
		jnz	short loc_2515B
		mov	bx, [si+4]
		mov	ax, [bx+9]
		mov	[si+4], ax
		jmp	short loc_25153

loc_25137:
		mov	bx, [si+4]
		mov	ax, [bx+0Bh]
		mov	[si+8], ax
		cmp	word ptr [si+8], 0
		jz	short loc_2514A
		jmp	short loc_25159
		jmp	short loc_25153

loc_2514A:
		mov	bx, [si+4]
		mov	ax, [bx+9]
		mov	[si+4], ax

loc_25153:
		cmp	word ptr [si+4], 0
		jnz	short loc_25137

loc_25159:
		jmp	short loc_25164

loc_2515B:
		mov	bx, [si+4]
		mov	ax, [bx+9]
		mov	[si+4], ax

loc_25164:
		cmp	word ptr [si+8], 0
		jz	short loc_2516C
		jmp	short loc_25172

loc_2516C:
		cmp	word ptr [si+4], 0
		jnz	short loc_25122

loc_25172:
		mov	ax, [si+8]
		mov	[di], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_250C8		endp

; START OF FUNCTION CHUNK FOR sub_250C8
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_250C8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2517F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [si]
		jmp	short loc_251B4

loc_2518E:
		mov	eax, [di]
		mov	bx, dx
		cmp	eax, [bx]
		jnz	short loc_251A9
		mov	eax, [di+4]
		mov	bx, dx
		cmp	eax, [bx+4]
		jnz	short loc_251A9
		mov	ax, 1
		jmp	short loc_251AB

loc_251A9:
		xor	ax, ax

loc_251AB:
		or	al, al
		jz	short loc_251B1
		jmp	short loc_251B8

loc_251B1:
		mov	di, [di+9]

loc_251B4:
		or	di, di
		jnz	short loc_2518E

loc_251B8:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
sub_2517F		endp

; START OF FUNCTION CHUNK FOR sub_2517F
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_2517F

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_251C2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		xor	di, di
		mov	dx, [si]
		or	cx, cx
		jnz	short loc_251DB
		mov	ax, dx
		pop	di
		pop	si
		pop	bp
		retf

loc_251DB:
		jmp	short loc_25200

loc_251DD:
		or	di, di
		jnz	short loc_251E8
		mov	bx, dx
		mov	di, [bx+0Bh]
		jmp	short loc_251F7

loc_251E8:
		cmp	di, cx
		jnz	short loc_251F4
		mov	ax, dx
		pop	di
		pop	si
		pop	bp
		retf
		jmp	short loc_251F7

loc_251F4:
		mov	di, [di+2]

loc_251F7:
		or	di, di
		jnz	short loc_25200
		mov	bx, dx
		mov	dx, [bx+9]

loc_25200:
		or	dx, dx
		jnz	short loc_251DD
		xor	ax, ax
		pop	di
		pop	si
		pop	bp
		retf
sub_251C2		endp

; START OF FUNCTION CHUNK FOR sub_251C2
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_251C2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2520E		proc far

var_6		= dword ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_1], 0
		jmp	short loc_25260

loc_25222:
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_25260
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		add	sp, 2
		cmp	al, 8
		jz	short loc_2525A
		push	word ptr [di]
		mov	bx, [di]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		add	sp, 2
		cmp	al, 6
		jnz	short loc_25260

loc_2525A:
		mov	[bp+var_1], 1
		jmp	short loc_2526D

loc_25260:
		push	di
		push	si
		push	cs
		call	near ptr sub_250C8
		add	sp, 4
		or	ax, ax
		jnz	short loc_25222

loc_2526D:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_2520E		endp

; START OF FUNCTION CHUNK FOR sub_2520E
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_2520E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25278		proc far

var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		jmp	loc_25344

loc_25292:
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_252AF
		jmp	loc_25344

loc_252AF:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+11h]
		cmp	al, [bp+arg_A]
		jz	short loc_252BE
		jmp	loc_25344

loc_252BE:
		mov	ax, [bp+var_4]
		add	ax, 12h
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_1E], eax
		mov	eax, [di+4]
		mov	[bp+var_1A], eax
		mov	eax, [di+8]
		mov	[bp+var_16], eax
		mov	ax, [bp+var_2]
		add	ax, 12h
		mov	[bp+var_A], ax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		sub	[bp+var_1E], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx+4]
		sub	[bp+var_1A], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx+8]
		sub	[bp+var_16], eax
		push	large [bp+var_16]
		push	large [bp+var_1A]
		push	large [bp+var_1E]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		sar	eax, 8
		cmp	eax, [bp+arg_6]
		jge	short loc_25344
		mov	ax, [bp+var_4]
		pop	di
		pop	si
		leave
		retf

loc_25344:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr sub_250C8
		add	sp, 4
		or	ax, ax
		jz	short loc_25357
		jmp	loc_25292

loc_25357:
		mov	[bp+var_4], 0
		jmp	loc_25411

loc_2535F:
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_2537C
		jmp	loc_25411

loc_2537C:
		les	bx, word ptr [bp+var_8]
		mov	al, es:[bx+11h]
		cmp	al, [bp+arg_A]
		jz	short loc_2538B
		jmp	loc_25411

loc_2538B:
		mov	ax, [bp+var_4]
		add	ax, 12h
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_1E], eax
		mov	eax, [di+4]
		mov	[bp+var_1A], eax
		mov	eax, [di+8]
		mov	[bp+var_16], eax
		mov	ax, [bp+var_2]
		add	ax, 12h
		mov	[bp+var_A], ax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		sub	[bp+var_1E], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx+4]
		sub	[bp+var_1A], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx+8]
		sub	[bp+var_16], eax
		push	large [bp+var_16]
		push	large [bp+var_1A]
		push	large [bp+var_1E]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		sar	eax, 8
		cmp	eax, [bp+arg_6]
		jge	short loc_25411
		mov	ax, [bp+var_4]
		pop	di
		pop	si
		leave
		retf

loc_25411:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr sub_250C8
		add	sp, 4
		or	ax, ax
		jz	short loc_2542C
		mov	ax, [bp+var_4]
		cmp	ax, [bp+arg_4]
		jz	short loc_2542C
		jmp	loc_2535F

loc_2542C:
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_25278		endp

; START OF FUNCTION CHUNK FOR sub_25278
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_25278

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25436		proc far

var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= word ptr -48h
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= dword ptr  0Ch
arg_A		= word ptr  10h
arg_C		= byte ptr  12h
arg_E		= byte ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 7Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		mov	eax, [bp+arg_6]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	[bp+var_E], 0
		mov	[bp+var_12], 0
		mov	ax, [bp+arg_A]
		mov	[bp+var_18], ax
		movsx	eax, [bp+var_18]
		shl	eax, 8
		mov	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_16]
		push	ax
		call	sub_27C36
		add	sp, 6
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		add	ax, 0Ch
		mov	[bp+var_1E], ax
		mov	bx, [bp+var_1E]
		mov	eax, [bx]
		mov	[bp+var_70], eax
		mov	bx, [bp+var_1E]
		mov	eax, [bx+4]
		mov	[bp+var_6C], eax
		mov	bx, [bp+var_1E]
		mov	eax, [bx+8]
		mov	[bp+var_68], eax
		mov	[bp+var_22], 0
		cmp	[bp+arg_4], 0
		jz	short loc_25539
		mov	bx, [bp+arg_4]
		mov	eax, [bx+12h]
		mov	bx, [bp+arg_2]
		sub	eax, [bx+12h]
		mov	[bp+var_7C], eax
		mov	bx, [bp+arg_4]
		mov	eax, [bx+16h]
		mov	bx, [bp+arg_2]
		sub	eax, [bx+16h]
		mov	[bp+var_78], eax
		mov	bx, [bp+arg_4]
		mov	eax, [bx+1Ah]
		mov	bx, [bp+arg_2]
		sub	eax, [bx+1Ah]
		mov	[bp+var_74], eax
		push	large [bp+var_74]
		push	large [bp+var_78]
		push	large [bp+var_7C]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_22], eax

loc_25539:
		cmp	[bp+arg_E], 0
		jz	short loc_25569
		mov	eax, [bp+arg_6]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		shl	eax, 8
		sub	eax, [bp+var_22]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_2E], eax
		jmp	short loc_25584

loc_25569:
		mov	eax, [bp+var_22]
		neg	eax
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_2E], eax

loc_25584:
		mov	[bp+var_48], 0
		jmp	loc_2573F

loc_2558C:
		push	[bp+var_48]
		mov	bx, [bp+var_48]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	word ptr [bp+var_4C+2], dx
		mov	word ptr [bp+var_4C], ax
		cmp	[bp+var_4C], 0
		jnz	short loc_255A9
		jmp	loc_2573F

loc_255A9:
		mov	di, [bp+var_48]
		mov	ax, [bp+var_48]
		cmp	ax, [bp+arg_2]
		jnz	short loc_255B7
		jmp	loc_2573F

loc_255B7:
		mov	ax, [bp+var_48]
		cmp	ax, [bp+arg_4]
		jnz	short loc_255C2
		jmp	loc_2573F

loc_255C2:
		les	bx, word ptr [bp+var_4C]
		mov	al, es:[bx+11h]
		cmp	al, [bp+arg_C]
		jz	short loc_255D1
		jmp	loc_2573F

loc_255D1:
		mov	eax, [di+12h]
		mov	bx, [bp+arg_2]
		sub	eax, [bx+12h]
		mov	[bp+var_7C], eax
		mov	eax, [di+16h]
		mov	bx, [bp+arg_2]
		sub	eax, [bx+16h]
		mov	[bp+var_78], eax
		mov	eax, [di+1Ah]
		mov	bx, [bp+arg_2]
		sub	eax, [bx+1Ah]
		mov	[bp+var_74], eax
		push	large [bp+var_74]
		push	large [bp+var_78]
		push	large [bp+var_7C]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_50], eax
		mov	eax, [bp+arg_6]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		shl	eax, 8
		cmp	eax, [bp+var_50]
		jle	short loc_25642
		mov	ax, 1
		jmp	short loc_25644

loc_25642:
		xor	ax, ax

loc_25644:
		or	al, al
		jnz	short loc_2564B
		jmp	loc_2573F

loc_2564B:
		lea	ax, word ptr [bp+var_7C]
		push	ax
		call	sub_28F25
		add	sp, 2
		cmp	[bp+arg_A], 0B4h
		jz	short loc_2568B
		lea	ax, word ptr [bp+var_70]
		push	ax
		lea	ax, word ptr [bp+var_7C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_5C]
		push	ax
		call	Math_DotProduct3D_285C4
		add	sp, 8
		mov	eax, [bp+var_5C]
		cmp	eax, [bp+var_16]
		jl	short loc_25682
		mov	ax, 1
		jmp	short loc_25684

loc_25682:
		xor	ax, ax

loc_25684:
		or	al, al
		jnz	short loc_2568B
		jmp	loc_2573F

loc_2568B:
		mov	eax, [bp+var_50]
		cmp	eax, [bp+var_8]
		jge	short loc_2569A
		mov	ax, 1
		jmp	short loc_2569C

loc_2569A:
		xor	ax, ax

loc_2569C:
		or	al, al
		jz	short loc_256AD
		mov	eax, [bp+var_50]
		mov	[bp+var_8], eax
		mov	[bp+var_4], di
		jmp	short loc_256CD

loc_256AD:
		mov	eax, [bp+var_50]
		cmp	eax, [bp+var_12]
		jle	short loc_256BC
		mov	ax, 1
		jmp	short loc_256BE

loc_256BC:
		xor	ax, ax

loc_256BE:
		or	al, al
		jz	short loc_256CD
		mov	eax, [bp+var_50]
		mov	[bp+var_12], eax
		mov	[bp+var_E], di

loc_256CD:
		mov	eax, [bp+var_50]
		sub	eax, [bp+var_22]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_32], eax
		cmp	[bp+arg_E], 0
		jz	short loc_25718
		cmp	[bp+var_32], 0
		jle	short loc_25716
		mov	eax, [bp+var_32]
		cmp	eax, [bp+var_2E]
		jge	short loc_25705
		mov	ax, 1
		jmp	short loc_25707

loc_25705:
		xor	ax, ax

loc_25707:
		or	al, al
		jz	short loc_25716
		mov	eax, [bp+var_32]
		mov	[bp+var_2E], eax
		mov	[bp+var_2], di

loc_25716:
		jmp	short loc_2573F

loc_25718:
		cmp	[bp+var_32], 0
		jge	short loc_2573F
		mov	eax, [bp+var_32]
		cmp	eax, [bp+var_2E]
		jle	short loc_2572E
		mov	ax, 1
		jmp	short loc_25730

loc_2572E:
		xor	ax, ax

loc_25730:
		or	al, al
		jz	short loc_2573F
		mov	eax, [bp+var_32]
		mov	[bp+var_2E], eax
		mov	[bp+var_2], di

loc_2573F:
		lea	ax, [bp+var_48]
		push	ax
		push	si
		push	cs
		call	near ptr sub_250C8
		add	sp, 4
		or	ax, ax
		jz	short loc_25752
		jmp	loc_2558C

loc_25752:
		cmp	[bp+var_2], 0
		jz	short loc_2575E
		mov	ax, [bp+var_2]
		mov	[bp+arg_4], ax

loc_2575E:
		cmp	[bp+arg_E], 0
		jz	short loc_25778
		cmp	[bp+var_2], 0
		jnz	short loc_25776
		cmp	[bp+var_4], 0
		jz	short loc_25776
		mov	ax, [bp+var_4]
		mov	[bp+arg_4], ax

loc_25776:
		jmp	short loc_2578A

loc_25778:
		cmp	[bp+var_2], 0
		jnz	short loc_2578A
		cmp	[bp+var_E], 0
		jz	short loc_2578A
		mov	ax, [bp+var_E]
		mov	[bp+arg_4], ax

loc_2578A:
		mov	ax, [bp+arg_4]
		pop	di
		pop	si
		leave
		retf
sub_25436		endp

; START OF FUNCTION CHUNK FOR sub_25436
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_25436

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25795		proc far

var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h
arg_C		= byte ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 46h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	eax, [bp+arg_4]
		inc	eax
		mov	[bp+var_6], eax
		mov	ax, [bp+arg_2]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	sub_27C36
		add	sp, 6
		push	[bp+var_8]
		mov	bx, [bp+var_8]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		add	ax, 0Ch
		mov	[bp+var_14], ax
		mov	bx, [bp+var_14]
		mov	eax, [bx]
		mov	[bp+var_3A], eax
		mov	bx, [bp+var_14]
		mov	eax, [bx+4]
		mov	[bp+var_36], eax
		mov	bx, [bp+var_14]
		mov	eax, [bx+8]
		mov	[bp+var_32], eax
		mov	[bp+var_16], 0
		jmp	loc_25927

loc_25815:
		push	[bp+var_16]
		mov	bx, [bp+var_16]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 2
		mov	word ptr [bp+var_1A+2], dx
		mov	word ptr [bp+var_1A], ax
		cmp	[bp+var_1A], 0
		jnz	short loc_25832
		jmp	loc_25927

loc_25832:
		mov	ax, [bp+var_16]
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_1C]
		add	ax, 12h
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_46], eax
		mov	eax, [di+4]
		mov	[bp+var_42], eax
		mov	eax, [di+8]
		mov	[bp+var_3E], eax
		mov	ax, [bp+var_8]
		add	ax, 12h
		mov	[bp+var_1E], ax
		mov	bx, [bp+var_1E]
		mov	eax, [bx]
		sub	[bp+var_46], eax
		mov	bx, [bp+var_1E]
		mov	eax, [bx+4]
		sub	[bp+var_42], eax
		mov	bx, [bp+var_1E]
		mov	eax, [bx+8]
		sub	[bp+var_3E], eax
		push	large [bp+var_3E]
		push	large [bp+var_42]
		push	large [bp+var_46]
		call	sub_2B9E3
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		sar	eax, 8
		mov	[bp+var_22], eax
		cmp	[bp+arg_A], 0
		jz	short loc_258C7
		les	bx, word ptr [bp+var_1A]
		mov	al, es:[bx+11h]
		cmp	al, [bp+arg_A]
		jnz	short loc_25927

loc_258C7:
		cmp	[bp+arg_C], 17h
		jz	short loc_258E4
		push	word ptr [bp+var_1A+2]
		push	word ptr [bp+var_1A]
		les	bx, word ptr [bp+var_1A]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, [bp+arg_C]
		jnz	short loc_25927

loc_258E4:
		mov	eax, [bp+var_22]
		cmp	eax, [bp+var_6]
		jge	short loc_25927
		lea	ax, word ptr [bp+var_46]
		push	ax
		call	sub_28F25
		add	sp, 2
		lea	ax, word ptr [bp+var_3A]
		push	ax
		lea	ax, word ptr [bp+var_46]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_2E]
		push	ax
		call	Math_DotProduct3D_285C4
		add	sp, 8
		mov	eax, [bp+var_2E]
		cmp	eax, [bp+var_C]
		jl	short loc_25927
		mov	ax, [bp+var_1C]
		mov	[bp+var_2], ax
		mov	eax, [bp+var_22]
		mov	[bp+var_6], eax

loc_25927:
		lea	ax, [bp+var_16]
		push	ax
		push	si
		push	cs
		call	near ptr sub_250C8
		add	sp, 4
		or	ax, ax
		jz	short loc_2593A
		jmp	loc_25815

loc_2593A:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_25795		endp

; START OF FUNCTION CHUNK FOR sub_25795
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_25795

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25945		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_2596C
		push	si
		nop
		push	cs
		call	near ptr Container_Op_25B17
		add	sp, 2
		test	di, 1
		jz	short loc_2596C
		push	si
		call	sub_39C
		add	sp, 2

loc_2596C:
		pop	di
		pop	si
		pop	bp
		retf
sub_25945		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à List_AppendTail_20D45
; (sub_20D45 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; List_AppendTail_22C23 (sub_22C23 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, ajoute un nœud en fin de liste chaînée : met le suivant du
; nœud (+2) à 0, met à jour la queue (+0xD) et la tête (+0xB) de l'en-tête, chaîne l'ancien
; dernier nœud. Même disposition que WorldObjects_CallSlot1COnActive_2217D /
; WorldObjects_UpdateAllAndRemoveDead_221F2. Anciennement Container_KeyCompare (ne compare
; rien).
; ==============================================================================================
List_AppendTail_25970		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	di, di
		jz	short loc_2599D
		mov	word ptr [di+2], 0
		cmp	word ptr [si+0Dh], 0
		jnz	short loc_25994
		mov	ax, di
		mov	[si+0Dh], ax
		mov	[si+0Bh], ax
		jmp	short loc_2599D

loc_25994:
		mov	bx, [si+0Dh]
		mov	[bx+2], di
		mov	[si+0Dh], di

loc_2599D:
		mov	ax, di
		pop	di
		pop	si
		pop	bp
		retf
List_AppendTail_25970		endp

; START OF FUNCTION CHUNK FOR List_AppendTail_25970
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR List_AppendTail_25970

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Container_RemoveNode
; (sub_20D7C de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Container_RemoveNode (sub_22C56 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,40L — retire un nœud spécifique par pointeur (unlink
; direct) : suppression directe d'un nœud connu du conteneur.
; ==============================================================================================
Container_RemoveNode		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, [bp+arg_4]
		cmp	[si+0Bh], di
		jnz	short loc_259C0
		mov	ax, [di+2]
		mov	[si+0Bh], ax

loc_259C0:
		cmp	[si+0Dh], di
		jnz	short loc_259C8
		mov	[si+0Dh], dx

loc_259C8:
		or	dx, dx
		jz	short loc_259D4
		mov	ax, [di+2]
		mov	bx, dx
		mov	[bx+2], ax

loc_259D4:
		mov	word ptr [di+2], 0
		pop	di
		pop	si
		pop	bp
		retf
Container_RemoveNode		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_259DD		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_259FC

loc_259EE:
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2

loc_259FC:
		cmp	[bp+var_2], 0
		jnz	short loc_25A0A
		mov	ax, [si+0Bh]
		mov	[bp+var_2], ax
		jmp	short loc_25A13

loc_25A0A:
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax

loc_25A13:
		cmp	[bp+var_2], 0
		jnz	short loc_259EE
		pop	si
		leave
		retf
sub_259DD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25A1C		proc far

var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	[bp+var_6], 0
		jmp	short loc_25A59

loc_25A31:
		push	[bp+var_6]
		push	ss
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	sub_25F43
		add	sp, 6
		mov	eax, [bp+var_A]
		mov	[bp+var_4], eax
		mov	eax, [di]
		cmp	eax, [bp+var_4]
		jge	short loc_25A59
		mov	eax, [bp+var_4]
		mov	[di], eax

loc_25A59:
		cmp	[bp+var_6], 0
		jnz	short loc_25A67
		mov	ax, [si+0Bh]
		mov	[bp+var_6], ax
		jmp	short loc_25A70

loc_25A67:
		mov	bx, [bp+var_6]
		mov	ax, [bx+2]
		mov	[bp+var_6], ax

loc_25A70:
		cmp	[bp+var_6], 0
		jnz	short loc_25A31
		mov	[bp+var_C], di
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	bx, [bp+arg_0]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_25A1C		endp

; START OF FUNCTION CHUNK FOR sub_25A1C
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_25A1C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25A93		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_25AB2

loc_25AA4:
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 2

loc_25AB2:
		cmp	[bp+var_2], 0
		jnz	short loc_25AC0
		mov	ax, [si+0Bh]
		mov	[bp+var_2], ax
		jmp	short loc_25AC9

loc_25AC0:
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax

loc_25AC9:
		cmp	[bp+var_2], 0
		jnz	short loc_25AA4
		pop	si
		leave
		retf
sub_25A93		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25AD2		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_25AF6

loc_25AE7:
		push	di
		push	[bp+var_2]
		mov	bx, [bp+var_2]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4

loc_25AF6:
		cmp	[bp+var_2], 0
		jnz	short loc_25B04
		mov	ax, [si+0Bh]
		mov	[bp+var_2], ax
		jmp	short loc_25B0D

loc_25B04:
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax

loc_25B0D:
		cmp	[bp+var_2], 0
		jnz	short loc_25AE7
		pop	di
		pop	si
		leave
		retf
sub_25AD2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Container_Op_20EEC (sub_20EEC de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; code identique instruction par instruction à Container_Op_22DAB (sub_22DAB de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,41L — (cluster
; conteneur) — accesseur/test additionnel, non détaillé.
; ==============================================================================================
Container_Op_25B17		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+0Bh]
		jmp	short loc_25B41

loc_25B27:
		mov	ax, [di+2]
		mov	[bp+var_2], ax
		or	di, di
		jz	short loc_25B3E
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_25B3E

loc_25B3E:
		mov	di, [bp+var_2]

loc_25B41:
		or	di, di
		jnz	short loc_25B27
		xor	ax, ax
		mov	[si+0Dh], ax
		mov	[si+0Bh], ax
		pop	di
		pop	si
		leave
		retf
Container_Op_25B17		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25B51		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	di, [si+0Bh]
		jmp	short loc_25B94

loc_25B66:
		cmp	di, [bp+arg_2]
		jnz	short loc_25B8E
		push	di
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		or	di, di
		jz	short loc_25B88
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_25B88

loc_25B88:
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_25B8E:
		mov	[bp+var_2], di
		mov	di, [di+2]

loc_25B94:
		or	di, di
		jnz	short loc_25B66
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
sub_25B51		endp

; START OF FUNCTION CHUNK FOR sub_25B51
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_25B51

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25BA2		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_25BBF

loc_25BB6:
		mov	ax, dx
		dec	dx
		or	ax, ax
		jg	short loc_25BBF
		jmp	short loc_25BDC

loc_25BBF:
		cmp	[bp+var_2], 0
		jnz	short loc_25BCD
		mov	ax, [si+0Bh]
		mov	[bp+var_2], ax
		jmp	short loc_25BD6

loc_25BCD:
		mov	bx, [bp+var_2]
		mov	ax, [bx+2]
		mov	[bp+var_2], ax

loc_25BD6:
		cmp	[bp+var_2], 0
		jnz	short loc_25BB6

loc_25BDC:
		mov	ax, [bp+var_2]
		pop	si
		leave
		retf
sub_25BA2		endp

; START OF FUNCTION CHUNK FOR sub_25BA2
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_25BA2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25BE5		proc far

var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_E], eax
		push	8
		push	word ptr [bp+var_E+2]
		push	word ptr [bp+var_E]
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	sub_36A8
		add	sp, 0Ah
		mov	[bp+var_2], 0
		mov	[bp+var_10], 0
		jmp	short loc_25C48

loc_25C17:
		mov	bx, [bp+var_10]
		mov	eax, [bx+6]
		mov	[bp+var_14], eax
		push	8
		push	word ptr [bp+var_14+2]
		push	word ptr [bp+var_14]
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_25C40
		mov	ax, 1
		jmp	short loc_25C42

loc_25C40:
		xor	ax, ax

loc_25C42:
		or	al, al
		jz	short loc_25C48
		jmp	short loc_25C65

loc_25C48:
		cmp	[bp+var_10], 0
		jnz	short loc_25C56
		mov	ax, [si+0Bh]
		mov	[bp+var_10], ax
		jmp	short loc_25C5F

loc_25C56:
		mov	bx, [bp+var_10]
		mov	ax, [bx+2]
		mov	[bp+var_10], ax

loc_25C5F:
		cmp	[bp+var_10], 0
		jnz	short loc_25C17

loc_25C65:
		mov	ax, [bp+var_10]
		pop	si
		leave
		retf
sub_25BE5		endp

; START OF FUNCTION CHUNK FOR sub_25BE5
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_25BE5

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25C6E		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	di, [si+0Bh]
		jmp	short loc_25CA0
sub_25C6E		endp

; START OF FUNCTION CHUNK FOR sub_25C6E
		cmp	di, [bp+arg_2]
		jnz	short loc_25C9A
		push	di
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr Container_RemoveNode
		add	sp, 6
		mov	al, 1
		pop	di
		pop	si
		leave
		retf

loc_25C9A:
		mov	[bp+var_2], di
		mov	di, [di+2]
; END OF FUNCTION CHUNK FOR sub_25C6E
seg062		ends
