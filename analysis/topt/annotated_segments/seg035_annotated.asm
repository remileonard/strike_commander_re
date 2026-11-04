seg035		segment	para public 'CODE' use16
		assume cs:seg035
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FFh, 44h, 29h, 8Bh, 44h, 29h, 40h, 89h, 44h, 33h, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_143DD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_4BC8E, 0
		jnz	short loc_143F9
		mov	word_4BC8E, si
		mov	byte_4F77A, 0
		call	TextScrollDisplayB_ApplyHelperD_4555C

loc_143F9:
		pop	si
		pop	bp
		retf
sub_143DD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_143FC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_4BC8E, si
		jnz	short loc_14419
		mov	word_4BC8E, 0
		call	TextScrollDisplayB_ApplyHelperC_45522
		mov	byte_4F77A, 1

loc_14419:
		pop	si
		pop	bp
		retf
sub_143FC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Widget_SetFlagBit0_F898
; (sub_F898 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_SetFlagBit0_A127B (sub_A127B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, pose le bit 0 du champ de flags (+0x10) d'un widget.
; ==============================================================================================
Widget_SetFlagBit0_1441C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	byte ptr [si+10h], 1
		pop	si
		pop	bp
		retf
Widget_SetFlagBit0_1441C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Widget_ClearFlagBit0_F8A6 (sub_F8A6 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Widget_ClearFlagBit0_A1289 (sub_A1289 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, efface le bit 0 du champ de
; flags (+0x10) d'un widget.
; ==============================================================================================
Widget_ClearFlagBit0_1442A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		and	byte ptr [si+10h], 0FEh
		pop	si
		pop	bp
		retf
Widget_ClearFlagBit0_1442A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Widget_TranslateBounds_F8B4 (sub_F8B4 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Widget_TranslateBounds_A1297 (sub_A1297 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, translate les 2 coins d'un
; rectangle de widget (+4/+6/+8/+0xA) par un décalage (dx,cx).
; ==============================================================================================
Widget_TranslateBounds_14438		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		add	[si+4], dx
		add	[si+6], cx
		add	[si+8], dx
		add	[si+0Ah], cx
		pop	si
		pop	bp
		retf
Widget_TranslateBounds_14438		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14454		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_14454		endp

; START OF FUNCTION CHUNK FOR sub_14454
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_14454

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14460		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_14460		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14468		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_14468		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14470		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_14470		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14484		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		pop	bp
		retf
sub_14484		endp

; START OF FUNCTION CHUNK FOR sub_14484
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_14484

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14490		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		pop	bp
		retf
sub_14490		endp

; START OF FUNCTION CHUNK FOR sub_14490
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_14490

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1449C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1449C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_144A4		proc far

var_10		= word ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 10h
		mov	[bp+var_8], 0
		mov	[bp+var_4], 2
		mov	[bp+var_C], 0

loc_144C2:
		push	666Ah
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte_4F04A, 0
		jnz	short loc_144F8
		push	666Ah
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_144F6
		lea	ax, [bp+var_10]
		push	ax
		push	666Ah
		call	sub_A981
		add	sp, 4
		jmp	short loc_144F6

loc_144F6:
		jmp	short loc_144F8

loc_144F8:
		mov	eax, dword_4DE15
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	Stopwatch_WaitElapsed_44E21
		add	sp, 2
		add	[bp+var_C], 2
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_144C2
		mov	eax, [bp+var_C]
		shld	edx, eax, 10h
		leave
		retf
sub_144A4		endp

; START OF FUNCTION CHUNK FOR sub_144A4
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_144A4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; PaletteScreen_DrawCurveShape_F9A4 (sub_F9A4 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à PaletteScreen_DrawCurveShape_A1375 (sub_A1375 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, trace une forme courbe
; en 4 segments via Render_ClipAndDrawLineVariant_62EC8 (seg183) — probable dessin d'un
; graphe/jauge en arc.
; ==============================================================================================
PaletteScreen_DrawCurveShape_14528		proc far

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
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, si
		add	ax, [bp+arg_4]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, di
		add	ax, [bp+arg_6]
		dec	ax
		mov	[bp+var_4], ax
		push	0FFh
		push	di
		mov	ax, [bp+var_2]
		dec	ax
		push	ax
		push	di
		push	si
		push	word_4D36E
		call	sub_396B0
		add	sp, 0Ch
		push	0FFh
		mov	ax, [bp+var_4]
		dec	ax
		push	ax
		push	[bp+var_2]
		push	di
		push	[bp+var_2]
		push	word_4D36E
		call	sub_396B0
		add	sp, 0Ch
		push	0FFh
		push	[bp+var_4]
		push	si
		mov	ax, di
		inc	ax
		push	ax
		push	si
		push	word_4D36E
		call	sub_396B0
		add	sp, 0Ch
		push	0FFh
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		mov	ax, si
		inc	ax
		push	ax
		push	word_4D36E
		call	sub_396B0
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawCurveShape_14528		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Palette_SetDACRegister_A13FF (sub_A13FF de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, écrit un registre DAC de palette VGA (int
; 10h, fonction 1010h — SET INDIVIDUAL DAC REGISTER).
; ==============================================================================================
Palette_SetDACRegister_145B2		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	dh, [bp+arg_2]
		mov	ch, [bp+arg_4]
		mov	cl, [bp+arg_6]
		mov	ax, 1010h
		int	10h
		pop	bp
		retf
Palette_SetDACRegister_145B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Palette_GetDACRegister_A1415 (sub_A1415 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, lit un registre DAC de palette VGA (int 10h,
; fonction 1015h — READ INDIVIDUAL DAC REGISTER).
; ==============================================================================================
Palette_GetDACRegister_145C8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	ax, 1015h
		int	10h
		les	bx, [bp+arg_2]
		mov	es:[bx], dh
		mov	es:[bx+1], ch
		mov	es:[bx+2], cl
		pop	bp
		retf
Palette_GetDACRegister_145C8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_145E3		proc far

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
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 300h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	[bp+var_6], 0
		mov	di, 7FFFh
		xor	cx, cx
		jmp	short loc_1467B

loc_14607:
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, [bp+arg_4]
		sub	dx, ax
		mov	[bp+var_8], dx
		les	bx, [bp+arg_0]
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	dx, [bp+arg_6]
		sub	dx, ax
		mov	[bp+var_A], dx
		les	bx, [bp+arg_0]
		mov	al, es:[bx+2]
		mov	ah, 0
		mov	dx, [bp+arg_8]
		sub	dx, ax
		mov	[bp+var_C], dx
		mov	ax, [bp+var_8]
		mov	[bp+var_E], ax
		mov	ax, [bp+var_E]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	dx, [bp+var_A]
		mov	[bp+var_10], dx
		push	ax
		mov	ax, [bp+var_10]
		cwd
		xor	ax, dx
		sub	ax, dx
		pop	dx
		add	dx, ax
		mov	ax, [bp+var_C]
		mov	[bp+var_12], ax
		mov	ax, [bp+var_12]
		push	dx
		cwd
		xor	ax, dx
		sub	ax, dx
		pop	dx
		add	dx, ax
		mov	si, dx
		cmp	si, di
		jge	short loc_14676
		mov	[bp+var_6], cx
		mov	di, si

loc_14676:
		inc	cx
		add	[bp+arg_0], 3

loc_1467B:
		mov	ax, [bp+arg_0]
		cmp	ax, [bp+var_4]
		jb	short loc_14607
		mov	ax, [bp+var_6]
		pop	di
		pop	si
		leave
		retf
sub_145E3		endp

; START OF FUNCTION CHUNK FOR sub_145E3
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_145E3

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Palette_ReadAllDACRegisters_FB0A (sub_FB0A de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Palette_ReadAllDACRegisters_A14C2 (sub_A14C2 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, lit les 256 registres DAC par
; blocs de 16 (int 10h, fonction 1017h — READ BLOCK OF DAC REGISTERS) dans un tampon fourni.
; ==============================================================================================
Palette_ReadAllDACRegisters_1468E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	dx, [bp+arg_0]
		xor	bx, bx
		mov	cx, 10h

loc_14699:
		mov	ax, 1017h
		int	10h
		add	dx, 30h
		add	bx, cx
		cmp	bx, 100h
		jl	short loc_14699
		pop	bp
		retf
Palette_ReadAllDACRegisters_1468E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Palette_WriteAllDACRegisters_FB27 (sub_FB27 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Palette_WriteAllDACRegisters_A14DF (sub_A14DF de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, écrit les 256
; registres DAC en un seul appel (int 10h, fonction 1012h — SET BLOCK OF DAC REGISTERS).
; ==============================================================================================
Palette_WriteAllDACRegisters_146AB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	dx, [bp+arg_0]
		xor	bx, bx
		mov	cx, 100h
		mov	ax, 1012h
		int	10h
		pop	bp
		retf
Palette_WriteAllDACRegisters_146AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_146BD		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_4]
		mov	ax, dx
		shl	ax, 1
		add	ax, dx
		add	[bp+arg_0], ax
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_6]
		mov	es:[bx], al
		inc	[bp+arg_0]
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_8]
		mov	es:[bx], al
		inc	[bp+arg_0]
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_A]
		mov	es:[bx], al
		pop	bp
		retf
sub_146BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_146EF		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	ax, [bp+arg_0]
		shl	ax, 6
		mov	bx, 64h
		cwd
		idiv	bx
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_2]
		shl	ax, 6
		mov	bx, 64h
		cwd
		idiv	bx
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		shl	ax, 6
		mov	bx, 64h
		cwd
		idiv	bx
		mov	[bp+var_6], ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		nop
		push	cs
		call	near ptr sub_14737
		add	sp, 6
		leave
		retf
sub_146EF		endp

; START OF FUNCTION CHUNK FOR sub_146EF
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_146EF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14737		proc far

var_302		= word ptr -302h
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 302h
		push	ss
		lea	ax, [bp+var_302]
		push	ax
		push	cs
		call	near ptr Palette_ReadAllDACRegisters_1468E
		add	sp, 4
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	ss
		lea	ax, [bp+var_302]
		push	ax
		push	cs
		call	near ptr sub_145E3
		add	sp, 0Ah
		mov	[bp+var_2], ax
		mov	ax, [bp+var_2]
		leave
		retf
sub_14737		endp

; START OF FUNCTION CHUNK FOR sub_14737
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_14737

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1476B		proc far

var_304		= word ptr -304h
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 304h
		mov	[bp+var_4], 0
		cmp	[bp+arg_2], 0
		jz	short loc_1478B
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		jmp	short loc_147A2

loc_1478B:
		lea	ax, [bp+var_304]
		mov	word ptr [bp+var_4+2], ss
		mov	word ptr [bp+var_4], ax
		push	ss
		lea	ax, [bp+var_304]
		push	ax
		push	cs
		call	near ptr Palette_ReadAllDACRegisters_1468E
		add	sp, 4

loc_147A2:
		cmp	[bp+arg_0], 0
		jnz	short loc_147AB
		jmp	loc_149B5

loc_147AB:
		push	0
		push	0
		push	0
		push	word_4BCB0
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	0
		push	0
		push	0
		push	word_4BCB2
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	25h
		push	25h
		push	25h
		push	word_4BCB4
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	29h
		push	2Ch
		push	29h
		push	word_4BCB6
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	31h
		push	31h
		push	31h
		push	word_4BCB8
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	3Fh
		push	3Fh
		push	3Fh
		push	word_4BCBA
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	0
		push	0
		push	0
		push	word_4BC90
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	2Ah
		push	0
		push	0
		push	word_4BC92
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	0
		push	2Ah
		push	0
		push	word_4BC94
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	2Ah
		push	2Ah
		push	0
		push	word_4BC96
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	0
		push	0
		push	2Ah
		push	word_4BC98
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	2Ah
		push	0
		push	2Ah
		push	word_4BC9A
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	0
		push	15h
		push	2Ah
		push	word_4BC9C
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	2Ah
		push	2Ah
		push	2Ah
		push	word_4BC9E
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	15h
		push	15h
		push	15h
		push	word_4BCA0
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	3Fh
		push	15h
		push	15h
		push	word_4BCA2
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	15h
		push	3Fh
		push	15h
		push	word_4BCA4
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	3Fh
		push	3Fh
		push	15h
		push	word_4BCA6
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	15h
		push	15h
		push	3Fh
		push	word_4BCA8
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	3Fh
		push	15h
		push	3Fh
		push	word_4BCAA
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	15h
		push	3Fh
		push	3Fh
		push	word_4BCAC
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	3Fh
		push	3Fh
		push	3Fh
		push	word_4BCAE
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_146BD
		add	sp, 0Ch
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr Palette_WriteAllDACRegisters_146AB
		add	sp, 4
		jmp	loc_14A58

loc_149B5:
		push	0
		push	0
		push	0
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_145E3
		add	sp, 0Ah
		mov	word_4BC90, ax
		mov	word_4BCB2, ax
		mov	word_4BCB0, ax
		push	25h
		push	25h
		push	25h
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_145E3
		add	sp, 0Ah
		mov	word_4BCB4, ax
		push	15h
		push	15h
		push	15h
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_145E3
		add	sp, 0Ah
		mov	word_4BCA0, ax
		push	29h
		push	2Ch
		push	29h
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_145E3
		add	sp, 0Ah
		mov	word_4BCB6, ax
		push	31h
		push	31h
		push	31h
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_145E3
		add	sp, 0Ah
		mov	word_4BCB8, ax
		push	2Ah
		push	2Ah
		push	2Ah
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_145E3
		add	sp, 0Ah
		mov	word_4BC9E, ax
		push	3Fh
		push	3Fh
		push	3Fh
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	cs
		call	near ptr sub_145E3
		add	sp, 0Ah
		mov	word_4BCAE, ax
		mov	word_4BCBA, ax

loc_14A58:
		leave
		retf
sub_1476B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14A5A		proc far

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
		jnz	short loc_14A7B
		push	1Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_14A7B
		jmp	loc_14B04

loc_14A7B:
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+0Dh], 0
		mov	word ptr [si+0Eh], 32DCh
		push	word_4D36E
		push	si
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+4], ax
		mov	ax, [bp+var_4]
		mov	[si+6], ax
		mov	ax, [bp+var_6]
		mov	[si+1Ah], ax
		mov	ax, [bp+var_8]
		mov	[si+1Ch], ax
		mov	ax, [si+4]
		add	ax, [si+1Ah]
		dec	ax
		mov	[si+8], ax
		mov	ax, [si+6]
		add	ax, [si+1Ch]
		dec	ax
		mov	[si+0Ah], ax
		and	byte ptr [si+10h], 0DFh
		or	byte ptr [si+10h], 2
		or	byte ptr [si+10h], 4
		and	byte ptr [si+10h], 0EFh
		and	byte ptr [si+10h], 0FEh
		and	byte ptr [si+10h], 0F7h
		and	byte ptr [si+15h], 0F0h
		mov	word ptr [si+16h], 1
		mov	word ptr [si+18h], 1

loc_14B04:
		mov	ax, si
		pop	si
		leave
		retf
sub_14A5A		endp

; START OF FUNCTION CHUNK FOR sub_14A5A
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_14A5A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_SetFlagBit0_F898 (sub_F898 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à Widget_SetFlagBit0_A127B
; (sub_A127B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, pose le bit 0 du champ de flags (+0x10) d'un widget.
; ==============================================================================================
Widget_SetFlagBit0_14B0C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	byte ptr [si+10h], 8
		pop	si
		pop	bp
		retf
Widget_SetFlagBit0_14B0C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Widget_SetFlagBit4AndOffsets_FF96 (sub_FF96 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Widget_SetFlagBit4AndOffsets_A1ADF (sub_A1ADF de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, pose le bit 4 du champ
; de flags (+0x10) et écrit deux champs d'offset (+0x11/+0x13).
; ==============================================================================================
Widget_SetFlagBit4AndOffsets_14B1A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	byte ptr [si+10h], 10h
		mov	ax, [bp+arg_2]
		mov	[si+13h], ax
		mov	ax, [bp+arg_4]
		mov	[si+11h], ax
		pop	si
		pop	bp
		retf
Widget_SetFlagBit4AndOffsets_14B1A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14B34		proc far

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
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		mov	ax, [bp+arg_2]
		add	ax, [bp+arg_6]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_4], ax
		test	[bp+arg_A], 1
		jnz	short loc_14B65
		jmp	loc_14BF8

loc_14B65:
		mov	ax, [bp+arg_8]
		inc	ax
		shl	ax, 4
		sar	ax, 1
		mov	[bp+var_A], ax
		mov	ax, [bp+var_A]
		cwd
		idiv	[bp+arg_6]
		mov	[bp+var_C], ax
		xor	di, di
		jmp	short loc_14BF0

loc_14B7F:
		test	[bp+arg_A], 2
		jz	short loc_14B90
		mov	ax, [bp+arg_2]
		add	ax, di
		mov	[bp+var_E], ax
		jmp	short loc_14B98

loc_14B90:
		mov	ax, [bp+var_2]
		sub	ax, di
		mov	[bp+var_E], ax

loc_14B98:
		mov	ax, [bp+var_C]
		sub	[bp+var_A], ax
		cmp	[bp+var_A], 10h
		jge	short loc_14BB1
		mov	[bp+var_8], 0
		mov	ax, [bp+arg_8]
		mov	[bp+var_6], ax
		jmp	short loc_14BC7

loc_14BB1:
		mov	ax, [bp+var_A]
		sar	ax, 4
		mov	[bp+var_8], ax
		mov	ax, [bp+var_8]
		shl	ax, 1
		mov	dx, [bp+arg_8]
		sub	dx, ax
		mov	[bp+var_6], dx

loc_14BC7:
		mov	al, byte ptr word_4BCB2
		push	ax
		mov	ax, [bp+arg_4]
		add	ax, [bp+var_8]
		add	ax, [bp+var_6]
		dec	ax
		push	ax
		push	[bp+var_E]
		mov	ax, [bp+arg_4]
		add	ax, [bp+var_8]
		push	ax
		push	[bp+var_E]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		inc	di

loc_14BF0:
		cmp	di, [bp+arg_6]
		jl	short loc_14B7F
		jmp	loc_14C88

loc_14BF8:
		mov	ax, [bp+arg_6]
		inc	ax
		shl	ax, 4
		sar	ax, 1
		mov	[bp+var_A], ax
		mov	ax, [bp+var_A]
		cwd
		idiv	[bp+arg_8]
		mov	[bp+var_C], ax
		xor	di, di
		jmp	short loc_14C83

loc_14C12:
		test	[bp+arg_A], 2
		jz	short loc_14C23
		mov	ax, [bp+var_4]
		sub	ax, di
		mov	[bp+var_E], ax
		jmp	short loc_14C2B

loc_14C23:
		mov	ax, [bp+arg_4]
		add	ax, di
		mov	[bp+var_E], ax

loc_14C2B:
		mov	ax, [bp+var_C]
		sub	[bp+var_A], ax
		cmp	[bp+var_A], 10h
		jge	short loc_14C44
		mov	[bp+var_8], 0
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		jmp	short loc_14C5A

loc_14C44:
		mov	ax, [bp+var_A]
		sar	ax, 4
		mov	[bp+var_8], ax
		mov	ax, [bp+var_8]
		shl	ax, 1
		mov	dx, [bp+arg_6]
		sub	dx, ax
		mov	[bp+var_6], dx

loc_14C5A:
		mov	al, byte ptr word_4BCB2
		push	ax
		push	[bp+var_E]
		mov	ax, [bp+arg_2]
		add	ax, [bp+var_8]
		add	ax, [bp+var_6]
		dec	ax
		push	ax
		push	[bp+var_E]
		mov	ax, [bp+arg_2]
		add	ax, [bp+var_8]
		push	ax
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		inc	di

loc_14C83:
		cmp	di, [bp+arg_8]
		jl	short loc_14C12

loc_14C88:
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_14B34		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14C94		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		add	ax, di
		push	ax
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		add	ax, di
		push	ax
		push	si
		push	cs
		call	near ptr sub_14B34
		add	sp, 0Ch
		pop	di
		pop	si
		pop	bp
		retf
sub_14C94		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14CC6		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	di, ax
		mov	ax, [si+4]
		add	ax, di
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		add	ax, di
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_4], ax
		mov	ax, [si+8]
		sub	ax, di
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		dec	ax
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]
		sub	ax, di
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		dec	ax
		mov	[bp+var_8], ax
		push	[bp+arg_2]
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_4]
		inc	ax
		push	ax
		mov	ax, [bp+var_6]
		sub	ax, [bp+var_2]
		inc	ax
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_14B34
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
sub_14CC6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14D4C		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Ah], 0
		jz	short loc_14D63
		cmp	word ptr [si+1Ch], 0
		jnz	short loc_14D67

loc_14D63:
		pop	di
		pop	si
		leave
		retf

loc_14D67:
		mov	di, [si+4]
		mov	ax, [si+4]
		add	ax, [si+1Ah]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [si+6]
		add	ax, [si+1Ch]
		dec	ax
		mov	[bp+var_6], ax
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		mov	ax, [si+16h]
		mov	[bp+var_8], ax
		jmp	short loc_14DB8

loc_14D94:
		mov	al, byte ptr word_4BCB0
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_4D36E
		call	sub_38150
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]

loc_14DB8:
		mov	ax, [bp+var_8]
		dec	[bp+var_8]
		or	ax, ax
		jnz	short loc_14D94
		mov	al, byte ptr word_4BCB8
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		mov	al, [si+10h]
		shr	ax, 1
		and	ax, 1
		or	ax, ax
		jz	short loc_14E46
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_14E46
		mov	[bp+var_A], 0
		jmp	short loc_14E3B

loc_14DFC:
		mov	al, byte ptr word_4BCB4
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, byte ptr word_4BCB4
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_A]

loc_14E3B:
		mov	ax, [si+18h]
		cmp	ax, [bp+var_A]
		jg	short loc_14DFC
		jmp	loc_14ED1

loc_14E46:
		mov	[bp+var_A], 0
		jmp	short loc_14EC6

loc_14E4D:
		mov	al, byte ptr word_4BCB4
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		mov	ax, [bp+var_4]
		inc	ax
		push	ax
		push	[bp+var_2]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, byte ptr word_4BCB4
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_6]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, byte ptr word_4BCBA
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, byte ptr word_4BCBA
		push	ax
		mov	ax, [bp+var_6]
		dec	ax
		push	ax
		push	di
		push	[bp+var_4]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_A]

loc_14EC6:
		mov	ax, [si+18h]
		cmp	ax, [bp+var_A]
		jle	short loc_14ED1
		jmp	loc_14E4D

loc_14ED1:
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_14D4C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_14EDD		proc far

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

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 0
		jz	short loc_14EF4
		cmp	[bp+arg_8], 0
		jnz	short loc_14EF8

loc_14EF4:
		pop	di
		pop	si
		leave
		retf

loc_14EF8:
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		mov	di, ax
		mov	ax, di
		add	ax, [bp+arg_6]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_4]
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_6], ax
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		jmp	short loc_14F4A

loc_14F26:
		mov	al, byte ptr word_4BCB0
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_4D36E
		call	sub_38150
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]

loc_14F4A:
		mov	ax, [bp+arg_C]
		dec	[bp+arg_C]
		or	ax, ax
		jnz	short loc_14F26
		mov	al, byte ptr word_4BCB8
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		cmp	[bp+arg_A], 0
		jz	short loc_14FC5
		mov	[bp+var_8], 0
		jmp	short loc_14FBA

loc_14F7B:
		mov	al, byte ptr word_4BCB4
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, byte ptr word_4BCB4
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_8]

loc_14FBA:
		mov	ax, [bp+var_8]
		cmp	ax, [bp+arg_E]
		jl	short loc_14F7B
		jmp	loc_15050

loc_14FC5:
		mov	[bp+var_8], 0
		jmp	short loc_15045

loc_14FCC:
		mov	al, byte ptr word_4BCB4
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		mov	ax, [bp+var_4]
		inc	ax
		push	ax
		push	[bp+var_2]
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, byte ptr word_4BCB4
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_6]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, byte ptr word_4BCBA
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		mov	al, byte ptr word_4BCBA
		push	ax
		mov	ax, [bp+var_6]
		dec	ax
		push	ax
		push	di
		push	[bp+var_4]
		push	di
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_8]

loc_15045:
		mov	ax, [bp+var_8]
		cmp	ax, [bp+arg_E]
		jge	short loc_15050
		jmp	loc_14FCC

loc_15050:
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_14EDD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1505C		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+4]
		add	ax, [si+1Ah]
		dec	ax
		mov	[bp+var_4], ax
		mov	ax, [si+6]
		mov	[bp+var_6], ax
		mov	ax, [si+6]
		add	ax, [si+1Ch]
		dec	ax
		mov	[bp+var_8], ax
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+var_8]
		push	[bp+var_4]
		push	[bp+var_6]
		push	[bp+var_2]
		push	word_4D36E
		call	sub_38150
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		pop	si
		leave
		retf
sub_1505C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_150B5		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+4]
		add	ax, [si+1Ah]
		dec	ax
		mov	[bp+var_4], ax
		mov	ax, [si+6]
		mov	[bp+var_6], ax
		mov	ax, [si+6]
		add	ax, [si+1Ch]
		dec	ax
		mov	[bp+var_8], ax
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+var_8]
		push	[bp+var_4]
		push	[bp+var_6]
		push	[bp+var_2]
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		pop	si
		leave
		retf
sub_150B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1510E		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		mov	di, ax
		mov	ax, di
		add	ax, [bp+arg_6]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_4]
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_6], ax
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		mov	al, [bp+arg_A]
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_4D36E
		call	sub_38150
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_1510E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1516B		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		mov	di, ax
		mov	ax, di
		add	ax, [bp+arg_6]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_4]
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_6], ax
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		mov	al, [bp+arg_A]
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_4D36E
		call	sub_37A76
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_1516B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_151C8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		mov	al, [bp+arg_6]
		push	ax
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		push	ax
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		push	ax
		push	word_4D36E
		call	Render_SetPixelClipped_3811A
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_151C8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15200		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		mov	al, [bp+arg_A]
		push	ax
		mov	ax, [si+6]
		add	ax, [bp+arg_8]
		push	ax
		mov	ax, [si+4]
		add	ax, [bp+arg_6]
		push	ax
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		push	ax
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		push	ax
		push	word_4D36E
		call	sub_37F22
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_15200		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15246		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_14D4C
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_15246		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15258		proc far

var_1C		= dword ptr -1Ch
var_18		= byte ptr -18h
var_16		= word ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_4		= word ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	al, [si+10h]
		shr	ax, 2
		and	ax, 1
		or	ax, ax
		jnz	short loc_15284
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_15284
		pop	di
		pop	si
		leave
		retf

loc_15284:
		mov	al, [si+10h]
		shr	ax, 1
		and	ax, 1
		or	ax, ax
		jz	short loc_152BE
		mov	al, [si+10h]
		shr	ax, 3
		and	ax, 1
		or	ax, ax
		jz	short loc_152B8
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		xor	ax, 1
		and	ax, 1
		and	byte ptr [si+10h], 0DFh
		shl	al, 5
		or	[si+10h], al
		jmp	short loc_152BC

loc_152B8:
		or	byte ptr [si+10h], 20h

loc_152BC:
		jmp	short loc_152C2

loc_152BE:
		and	byte ptr [si+10h], 0DFh

loc_152C2:
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_152E6
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2

loc_152E6:
		mov	al, [si+10h]
		shr	ax, 4
		and	ax, 1
		or	ax, ax
		jnz	short loc_152F6
		jmp	loc_153F6

loc_152F6:
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		movsx	eax, word ptr [si+11h]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_A], eax
		mov	eax, dword_4DE15
		mov	[bp+var_E], eax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+2Ch]
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		cmp	[bp+arg_6], 0
		jnz	short loc_1533F
		jmp	loc_153F4

loc_1533F:
		push	666Ah
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte_4F04A, 0
		jnz	short loc_15375
		push	666Ah
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15373
		lea	ax, [bp+var_16]
		push	ax
		push	666Ah
		call	sub_A981
		add	sp, 4
		jmp	short loc_15373

loc_15373:
		jmp	short loc_15375

loc_15375:
		mov	al, byte_4F050
		mov	[bp+var_18], al
		test	[bp+var_18], 3
		jnz	short loc_15383
		jmp	short loc_153F4

loc_15383:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 3
		jnz	short loc_153A0
		mov	ax, word_4F04C
		sar	ax, 1
		sub	ax, [si+4]
		mov	di, ax
		mov	ax, word_4F04E
		sub	ax, [si+6]
		mov	[bp+arg_4], ax

loc_153A0:
		mov	eax, [bp+var_E]
		add	eax, [bp+var_A]
		cmp	eax, dword_4DE15
		ja	short loc_153B4
		mov	ax, 1
		jmp	short loc_153B6

loc_153B4:
		xor	ax, ax

loc_153B6:
		or	al, al
		jz	short loc_153E7
		movsx	eax, word ptr [si+13h]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_A], eax
		mov	eax, dword_4DE15
		mov	[bp+var_E], eax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+2Ch]
		add	sp, 0Ah

loc_153E7:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_153F4
		jmp	loc_1533F

loc_153F4:
		jmp	short loc_15466

loc_153F6:
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		cmp	[bp+arg_6], 0
		jz	short loc_15452

loc_15404:
		push	666Ah
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte_4F04A, 0
		jnz	short loc_1543A
		push	666Ah
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15438
		lea	ax, [bp+var_4]
		push	ax
		push	666Ah
		call	sub_A981
		add	sp, 4
		jmp	short loc_15438

loc_15438:
		jmp	short loc_1543A

loc_1543A:
		mov	al, byte_4F050
		mov	[bp+var_6], al
		test	[bp+var_6], 0
		jz	short loc_15448
		jmp	short loc_15452

loc_15448:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_15404

loc_15452:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	di
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+2Ch]
		add	sp, 0Ah

loc_15466:
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_154AD
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_154AD
		mov	al, [si+10h]
		shr	ax, 2
		and	ax, 1
		or	ax, ax
		jz	short loc_154AD
		mov	al, [si+10h]
		shr	ax, 3
		and	ax, 1
		or	ax, ax
		jnz	short loc_1549B
		and	byte ptr [si+10h], 0DFh

loc_1549B:
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		add	sp, 2

loc_154AD:
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_15258		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_154B9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		push	word_4BD04
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		push	ax
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_154B9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_154F3		proc far

var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]

loc_154FD:
		push	666Ah
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte_4F04A, 0
		jnz	short loc_15533
		push	666Ah
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15531
		lea	ax, [bp+var_4]
		push	ax
		push	666Ah
		call	sub_A981
		add	sp, 4
		jmp	short loc_15531

loc_15531:
		jmp	short loc_15533

loc_15533:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_154FD
		pop	si
		leave
		retf
sub_154F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15540		proc far

var_4		= word ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]

loc_1554E:
		push	666Ah
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte_4F04A, 0
		jnz	short loc_15584
		push	666Ah
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_15582
		lea	ax, [bp+var_4]
		push	ax
		push	666Ah
		call	sub_A981
		add	sp, 4
		jmp	short loc_15582

loc_15582:
		jmp	short loc_15584

loc_15584:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_1559D
		mov	ax, word_4F04C
		sar	ax, 1
		mov	[di], ax
		mov	bx, [bp+arg_4]
		mov	ax, word_4F04E
		mov	[bx], ax

loc_1559D:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_1554E
		pop	di
		pop	si
		leave
		retf
sub_15540		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_155AB		proc far

var_14		= word ptr -14h
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
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	ax, [si+1Ah]
		mov	[bp+var_6], ax
		mov	ax, [si+1Ch]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_C], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_E], ax
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_14528
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_154F3
		add	sp, 2
		mov	[bp+var_10], 0

loc_1560A:
		push	666Ah
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte_4F04A, 0
		jnz	short loc_15640
		push	666Ah
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1563E
		lea	ax, [bp+var_14]
		push	ax
		push	666Ah
		call	sub_A981
		add	sp, 4
		jmp	short loc_1563E

loc_1563E:
		jmp	short loc_15640

loc_15640:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_15655
		mov	al, byte_4F04B
		mov	ah, 0
		and	ax, 2
		mov	[bp+var_10], ax

loc_15655:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_15662
		jmp	loc_1572A

loc_15662:
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_14528
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		mov	ax, word_4F04C
		sar	ax, 1
		mov	di, ax
		mov	ax, word_4F04E
		mov	[bp+var_A], ax
		mov	ax, di
		sub	ax, [bp+arg_6]
		cmp	ax, [bp+var_C]
		jge	short loc_156A4
		mov	ax, di
		sub	ax, [bp+arg_6]
		mov	[bp+var_C], ax

loc_156A4:
		mov	ax, [bp+var_A]
		sub	ax, [bp+arg_8]
		cmp	ax, [bp+var_E]
		jge	short loc_156B8
		mov	ax, [bp+var_A]
		sub	ax, [bp+arg_8]
		mov	[bp+var_E], ax

loc_156B8:
		mov	ax, [bp+arg_A]
		inc	ax
		sub	ax, di
		mov	dx, [bp+var_6]
		sub	dx, [bp+var_C]
		cmp	ax, dx
		jge	short loc_156D6
		mov	ax, [bp+arg_A]
		inc	ax
		sub	ax, di
		mov	dx, [bp+var_6]
		sub	dx, ax
		mov	[bp+var_C], dx

loc_156D6:
		mov	ax, [bp+arg_C]
		inc	ax
		sub	ax, [bp+var_A]
		mov	dx, [bp+var_8]
		sub	dx, [bp+var_E]
		cmp	ax, dx
		jge	short loc_156F6
		mov	ax, [bp+arg_C]
		inc	ax
		sub	ax, [bp+var_A]
		mov	dx, [bp+var_8]
		sub	dx, ax
		mov	[bp+var_E], dx

loc_156F6:
		mov	ax, di
		sub	ax, [bp+var_C]
		mov	[bp+var_2], ax
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_E]
		mov	[bp+var_4], ax
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_14528
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2

loc_1572A:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_15737
		jmp	loc_1560A

loc_15737:
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_14528
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		cmp	[bp+var_10], 0
		jnz	short loc_15778
		mov	ax, [bp+var_4]
		sub	ax, [si+6]
		push	ax
		mov	ax, [bp+var_2]
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6

loc_15778:
		mov	ax, [bp+var_10]
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	di
		pop	si
		leave
		retf
sub_155AB		endp

; START OF FUNCTION CHUNK FOR sub_155AB
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_155AB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15788		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
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

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		mov	di, [si+1Ah]
		mov	ax, [si+1Ch]
		mov	[bp+var_6], ax
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_14528
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		push	si
		push	cs
		call	near ptr sub_154F3
		add	sp, 2
		mov	[bp+var_C], 0

loc_157D6:
		push	666Ah
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte_4F04A, 0
		jnz	short loc_1580C
		push	666Ah
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1580A
		lea	ax, [bp+var_10]
		push	ax
		push	666Ah
		call	sub_A981
		add	sp, 4
		jmp	short loc_1580A

loc_1580A:
		jmp	short loc_1580C

loc_1580C:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_15821
		mov	al, byte_4F04B
		mov	ah, 0
		and	ax, 2
		mov	[bp+var_C], ax

loc_15821:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_1582E
		jmp	loc_158C1

loc_1582E:
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_14528
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		mov	ax, word_4F04C
		sar	ax, 1
		mov	[bp+var_8], ax
		mov	ax, word_4F04E
		mov	[bp+var_A], ax
		mov	ax, [bp+var_8]
		sub	ax, [bp+var_2]
		inc	ax
		mov	di, ax
		cmp	di, [bp+arg_2]
		jge	short loc_15870
		mov	di, [bp+arg_2]
		jmp	short loc_15878

loc_15870:
		cmp	di, [bp+arg_6]
		jle	short loc_15878
		mov	di, [bp+arg_6]

loc_15878:
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_4]
		inc	ax
		mov	[bp+var_6], ax
		mov	ax, [bp+var_6]
		cmp	ax, [bp+arg_4]
		jge	short loc_15892
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		jmp	short loc_158A0

loc_15892:
		mov	ax, [bp+var_6]
		cmp	ax, [bp+arg_8]
		jle	short loc_158A0
		mov	ax, [bp+arg_8]
		mov	[bp+var_6], ax

loc_158A0:
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_14528
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2

loc_158C1:
		mov	al, byte_4F04A
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_158CE
		jmp	loc_157D6

loc_158CE:
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_14528
		add	sp, 8
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		cmp	[bp+var_C], 0
		jnz	short loc_15936
		mov	ax, [si+4]
		mov	[bp+var_12], ax
		mov	ax, [si+6]
		mov	[bp+var_14], ax
		mov	[bp+var_16], di
		mov	ax, [bp+var_6]
		mov	[bp+var_18], ax
		mov	ax, [bp+var_12]
		mov	[si+4], ax
		mov	ax, [bp+var_14]
		mov	[si+6], ax
		mov	ax, [bp+var_16]
		mov	[si+1Ah], ax
		mov	ax, [bp+var_18]
		mov	[si+1Ch], ax
		mov	ax, [si+4]
		add	ax, [si+1Ah]
		dec	ax
		mov	[si+8], ax
		mov	ax, [si+6]
		add	ax, [si+1Ch]
		dec	ax
		mov	[si+0Ah], ax

loc_15936:
		mov	ax, [bp+var_C]
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	di
		pop	si
		leave
		retf
sub_15788		endp

; START OF FUNCTION CHUNK FOR sub_15788
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_15788

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15946		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+24h]
		call	sub_15E48
		add	sp, 2
		mov	di, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[bp+var_2], dx
		mov	word ptr [si+1Eh], 0
		cmp	di, [bp+var_2]
		jge	short loc_15985
		mov	ax, [bp+var_2]
		sub	ax, di
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[si+1Eh], ax

loc_15985:
		pop	di
		pop	si
		leave
		retf
sub_15946		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15989		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+24h]
		call	sub_15E48
		add	sp, 2
		mov	di, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[bp+var_2], dx
		mov	word ptr [si+20h], 0
		jmp	short loc_159D3

loc_159B8:
		mov	ax, [si+20h]
		inc	word ptr [si+20h]
		mov	bx, [si+24h]
		add	bx, ax
		mov	al, [bx]
		push	ax
		call	PaletteScreen_LookupByteTable_15E87
		add	sp, 2
		add	ax, 2
		sub	di, ax

loc_159D3:
		cmp	di, [bp+var_2]
		jg	short loc_159B8
		pop	di
		pop	si
		leave
		retf
sub_15989		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_159DC		proc far

var_14		= word ptr -14h
var_12		= word ptr -12h
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+22h], 0FFFFh
		jnz	short loc_159F7
		push	si
		push	cs
		call	near ptr sub_14D4C
		add	sp, 2
		jmp	short loc_15A02

loc_159F7:
		push	word ptr [si+22h]
		push	si
		push	cs
		call	near ptr sub_150B5
		add	sp, 4

loc_15A02:
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+1Eh]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_2], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_4], ax
		mov	di, [si+28h]
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_15A40
		mov	di, [si+26h]

loc_15A40:
		mov	ax, word_4BD04
		add	ax, 2
		mov	[bp+var_6], ax
		mov	[bp+var_14], 0
		mov	[bp+var_12], 0
		push	[bp+var_6]
		lea	ax, [bp+var_14]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		push	si
		mov	ax, word_4BD04
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		push	word_4BD04
		push	di
		mov	ax, [si+24h]
		add	ax, [si+20h]
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		lea	ax, [bp+var_14]
		push	ax
		mov	ax, word_4BD04
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		lea	ax, [bp+var_14]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_159DC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15ABF		proc far

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
		cmp	word ptr [si+24h], 0
		jz	short loc_15ADE
		push	word ptr [si+24h]
		call	sub_39C
		add	sp, 2

loc_15ADE:
		push	di
		call	CRT_Strlen
		add	sp, 2
		inc	ax
		mov	[bp+var_2], ax
		push	[bp+var_2]
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[si+24h], ax
		cmp	word ptr [si+24h], 0
		jz	short loc_15B0B
		push	di
		push	word ptr [si+24h]
		call	CRT_Strcpy
		add	sp, 4

loc_15B0B:
		pop	di
		pop	si
		leave
		retf
sub_15ABF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15B0F		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_14D4C
		add	sp, 2
		mov	ax, [si+4]
		add	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		add	ax, [si+16h]
		add	ax, [si+18h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_4], ax
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		push	word ptr [si+28h]
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		pop	si
		leave
		retf
sub_15B0F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15B85		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		add	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		add	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp+var_4], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+2Ah]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_6], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_8], ax
		mov	ax, word_4BD04
		add	ax, 2
		mov	[bp+var_A], ax
		mov	[bp+var_18], 0
		mov	[bp+var_16], 0
		push	[bp+var_A]
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		push	si
		mov	ax, word_4BD04
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_143DD
		add	sp, 2
		mov	ax, [si+28h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		push	ax
		push	0
		mov	al, [si+22h]
		push	ax
		push	word ptr [si+20h]
		push	word ptr [si+1Eh]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_4D36E
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	word_4BD04
		push	0FFh
		mov	ax, [si+2Eh]
		add	ax, [si+28h]
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		call	PaletteScreen_DispatchWidgetLayoutB_15EE7
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr sub_143FC
		add	sp, 2
		lea	ax, [bp+var_18]
		push	ax
		mov	ax, word_4BD04
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		pop	si
		leave
		retf
sub_15B85		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15C8C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+2Eh]
		call	sub_15E48
		add	sp, 2
		mov	di, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[bp+var_2], dx
		mov	word ptr [si+2Ah], 0
		cmp	di, [bp+var_2]
		jge	short loc_15CCB
		mov	ax, [bp+var_2]
		sub	ax, di
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[si+2Ah], ax

loc_15CCB:
		pop	di
		pop	si
		leave
		retf
sub_15C8C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15CCF		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+2Eh]
		call	sub_15E48
		add	sp, 2
		mov	di, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[bp+var_2], dx
		mov	word ptr [si+2Ch], 0
		jmp	short loc_15D19

loc_15CFE:
		mov	ax, [si+2Ch]
		inc	word ptr [si+2Ch]
		mov	bx, [si+2Eh]
		add	bx, ax
		mov	al, [bx]
		push	ax
		call	PaletteScreen_LookupByteTable_15E87
		add	sp, 2
		add	ax, 2
		sub	di, ax

loc_15D19:
		cmp	di, [bp+var_2]
		jg	short loc_15CFE
		pop	di
		pop	si
		leave
		retf
sub_15CCF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15D22		proc far

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
		cmp	word ptr [si+2Eh], 0
		jz	short loc_15D41
		push	word ptr [si+2Eh]
		call	sub_39C
		add	sp, 2

loc_15D41:
		push	di
		call	CRT_Strlen
		add	sp, 2
		inc	ax
		mov	[bp+var_2], ax
		push	[bp+var_2]
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[si+2Eh], ax
		cmp	word ptr [si+2Eh], 0
		jz	short loc_15D6E
		push	di
		push	word ptr [si+2Eh]
		call	CRT_Strcpy
		add	sp, 4

loc_15D6E:
		push	si
		push	cs
		call	near ptr sub_15C8C
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_15D22		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15D7A		proc far
		push	bp
		mov	bp, sp
		mov	byte_4F04A, 0
		pop	bp
		retf
sub_15D7A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_15D84		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_15DAF
		push	si
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		test	di, 1
		jz	short loc_15DAD
		push	si
		call	sub_39C
		add	sp, 2
		jmp	short loc_15DAD

loc_15DAD:
		jmp	short loc_15DAF

loc_15DAF:
		pop	di
sub_15D84		endp
seg035		ends
