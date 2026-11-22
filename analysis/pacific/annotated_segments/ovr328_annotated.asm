ovr328		segment	para public 'OVERLAY' use16
		assume cs:ovr328
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_AcquireOwnership_A1240 (sub_A1240 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, verrou d'exclusion mutuelle pour ce module
; d'écran : si aucun propriétaire (word_6FE72==0), prend possession (dx) et désactive
; l'animation de défilement de texte (byte_72E70=0, TextScrollDisplayB_ApplyHelperD_67F60,
; seg209). Appelée par la quasi-totalité des fonctions de dessin de ce segment.
; ==============================================================================================
PaletteScreen_AcquireOwnership_B3610		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	word_791F6, 0
		jnz	short loc_B362B
		mov	word_791F6, dx
		mov	byte_7D3BC, 0
		call	TextScrollDisplayB_ApplyHelperD_6FAF5

loc_B362B:
		pop	bp
		retf
PaletteScreen_AcquireOwnership_B3610		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_ReleaseOwnership_A125D (sub_A125D de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, symétrique de
; PaletteScreen_AcquireOwnership_A1240 : libère si possédant (dx), réactive l'animation de
; défilement (TextScrollDisplayB_ApplyHelperC_67F26, byte_72E70=1).
; ==============================================================================================
PaletteScreen_ReleaseOwnership_B362D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	word_791F6, dx
		jnz	short loc_B3649
		mov	word_791F6, 0
		call	TextScrollDisplayB_ApplyHelperC_6FABB
		mov	byte_7D3BC, 1

loc_B3649:
		pop	bp
		retf
PaletteScreen_ReleaseOwnership_B362D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à Widget_SetFlagBit0_F898
; (sub_F898 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_SetFlagBit0_A127B (sub_A127B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, pose le bit 0 du champ de flags (+0x10) d'un widget.
; ==============================================================================================
Widget_SetFlagBit0_B364B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	byte ptr [si+10h], 1
		pop	si
		pop	bp
		retf
Widget_SetFlagBit0_B364B		endp

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
Widget_ClearFlagBit0_B3659		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		and	byte ptr [si+10h], 0FEh
		pop	si
		pop	bp
		retf
Widget_ClearFlagBit0_B3659		endp

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
Widget_TranslateBounds_B3667		proc far

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
Widget_TranslateBounds_B3667		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B3683		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_B3683		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B368D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_B368D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B3695		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_B3695		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_Method_Dispatch18_A12CD (sub_A12CD de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0x18] (champ +0x0E).
; ==============================================================================================
Widget_Method_Dispatch18_B369D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		pop	si
		pop	bp
		retf
Widget_Method_Dispatch18_B369D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B36AF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		pop	bp
		retf
sub_B36AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B36B9		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		pop	bp
		retf
sub_B36B9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B36C3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_B36C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ComputeCurvePointA_A12FB (sub_A12FB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 61 lignes, NON DÉTAILLÉE — appelle un ensemble de points de contrôle pour l'interpolation de
; courbe (motif partagé avec PaletteScreen_ComputeCurvePoint_A1430).
; ==============================================================================================
PaletteScreen_ComputeCurvePointA_B36CB		proc far

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

loc_B36E9:
		push	66D8h
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte_7CE08, 0
		jnz	short loc_B3719
		push	66D8h
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B3719
		lea	ax, [bp+var_10]
		push	ax
		push	66D8h
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_B3719

loc_B3719:
		mov	eax, dword_7B29D
		mov	[bp+var_8], eax
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	Stopwatch_WaitElapsed_6F93E
		pop	cx
		add	[bp+var_C], 2
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_B36E9
		mov	eax, [bp+var_C]
		shld	edx, eax, 10h
		leave
		retf
PaletteScreen_ComputeCurvePointA_B36CB		endp

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
PaletteScreen_DrawCurveShape_B3745		proc far

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
		push	word_7AF7E
		call	sub_6AFD6
		add	sp, 0Ch
		push	0FFh
		mov	ax, [bp+var_4]
		dec	ax
		push	ax
		push	[bp+var_2]
		push	di
		push	[bp+var_2]
		push	word_7AF7E
		call	sub_6AFD6
		add	sp, 0Ch
		push	0FFh
		push	[bp+var_4]
		push	si
		mov	ax, di
		inc	ax
		push	ax
		push	si
		push	word_7AF7E
		call	sub_6AFD6
		add	sp, 0Ch
		push	0FFh
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		mov	ax, si
		inc	ax
		push	ax
		push	word_7AF7E
		call	sub_6AFD6
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawCurveShape_B3745		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Palette_SetDACRegister_A13FF (sub_A13FF de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, écrit un registre DAC de palette VGA (int
; 10h, fonction 1010h — SET INDIVIDUAL DAC REGISTER).
; ==============================================================================================
Palette_SetDACRegister_B37CF		proc far

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
Palette_SetDACRegister_B37CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Palette_GetDACRegister_A1415 (sub_A1415 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, lit un registre DAC de palette VGA (int 10h,
; fonction 1015h — READ INDIVIDUAL DAC REGISTER).
; ==============================================================================================
Palette_GetDACRegister_B37E5		proc far

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
Palette_GetDACRegister_B37E5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B3800		proc far

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
		sub	sp, 10h
		push	si
		push	di
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 300h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		xor	si, si
		mov	di, 7FFFh
		xor	cx, cx
		jmp	short loc_B3884

loc_B3821:
		les	bx, [bp+arg_0]
		mov	al, es:[bx]
		mov	ah, 0
		mov	dx, [bp+arg_4]
		sub	dx, ax
		mov	[bp+var_6], dx
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	dx, [bp+arg_6]
		sub	dx, ax
		mov	[bp+var_8], dx
		mov	al, es:[bx+2]
		mov	ah, 0
		mov	dx, [bp+arg_8]
		sub	dx, ax
		mov	[bp+var_A], dx
		mov	ax, [bp+var_6]
		mov	[bp+var_C], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	dx, [bp+var_8]
		mov	[bp+var_E], dx
		push	ax
		mov	ax, [bp+var_E]
		cwd
		xor	ax, dx
		sub	ax, dx
		pop	bx
		add	bx, ax
		mov	ax, [bp+var_A]
		mov	[bp+var_10], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		add	bx, ax
		cmp	bx, di
		jge	short loc_B387F
		mov	si, cx
		mov	di, bx

loc_B387F:
		inc	cx
		add	[bp+arg_0], 3

loc_B3884:
		mov	ax, [bp+arg_0]
		cmp	ax, [bp+var_4]
		jb	short loc_B3821
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_B3800		endp

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
Palette_ReadAllDACRegisters_B3892		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	dx, [bp+arg_0]
		xor	bx, bx
		mov	cx, 10h

loc_B389D:
		mov	ax, 1017h
		int	10h
		add	dx, 30h
		add	bx, cx
		cmp	bx, 100h
		jl	short loc_B389D
		pop	bp
		retf
Palette_ReadAllDACRegisters_B3892		endp

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
Palette_WriteAllDACRegisters_B38AF		proc far

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
Palette_WriteAllDACRegisters_B38AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_WriteSingleEntry_A14F1 (sub_A14F1 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; écrit une entrée RGB (3 octets) à un index donné dans le tampon de palette de travail.
; Fonction très référencée (22 appels) pour construire un dégradé personnalisé.
; ==============================================================================================
Palette_WriteSingleEntry_B38C1		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_4]
		imul	ax, ax, 3
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
Palette_WriteSingleEntry_B38C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_ReleaseBuffer_A1520 (sub_A1520 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, libère le
; tampon de palette global (dword_6FEA2, sub_346) et réinitialise son état.
; ==============================================================================================
Palette_ReleaseBuffer_B38F0		proc far
		push	bp
		mov	bp, sp
		cmp	dword_79226, 0
		jz	short loc_B391E
		cmp	word_79224, 0
		jz	short loc_B391E
		mov	word_79224, 0
		push	large dword_79226
		call	sub_3C0
		add	sp, 4
		mov	dword_79226, 0

loc_B391E:
		pop	bp
		retf
Palette_ReleaseBuffer_B38F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Palette_GetOrLoadWorkingBuffer_A1550 (sub_A1550 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; initialisation paresseuse du tampon de palette de travail (768 octets) : alloue si besoin
; (sub_658), charge la palette matérielle courante (Palette_ReadAllDACRegisters_A14C2).
; ==============================================================================================
Palette_GetOrLoadWorkingBuffer_B3920		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jz	short loc_B3939
		mov	eax, [bp+arg_0]
		cmp	eax, dword_79226
		jz	short loc_B3939
		push	cs
		call	near ptr Palette_ReleaseBuffer_B38F0

loc_B3939:
		cmp	dword_79226, 0
		jnz	short loc_B3982
		cmp	[bp+arg_0], 0
		jz	short loc_B3958
		mov	eax, [bp+arg_0]
		mov	dword_79226, eax
		mov	word_79224, 0
		jmp	short loc_B3982

loc_B3958:
		push	300h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word_79228, ds
		mov	word ptr dword_79226, ax
		cmp	dword_79226, 0
		jz	short loc_B3982
		mov	word_79224, 1
		push	word_79228
		push	ax
		push	cs
		call	near ptr Palette_ReadAllDACRegisters_B3892
		add	sp, 4

loc_B3982:
		mov	dx, word_79228
		mov	ax, word ptr dword_79226
		pop	bp
		retf
Palette_GetOrLoadWorkingBuffer_B3920		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Palette_ConvertPercentToDAC_A15BB (sub_A15BB de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, convertit 3 composantes de couleur (échelle
; 0-100) vers l'échelle DAC VGA (0-63, ×64/100) et appelle Palette_WriteSingleEntry_A15F9.
; ==============================================================================================
Palette_ConvertPercentToDAC_B398B		proc far

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
		cwd
		idiv	bx
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		shl	ax, 6
		cwd
		idiv	bx
		mov	[bp+var_6], ax
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		nop
		push	cs
		call	near ptr Palette_WriteEntryAndCommit_B39C9
		add	sp, 6
		leave
		retf
Palette_ConvertPercentToDAC_B398B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Palette_WriteEntryAndCommit_A15F9 (sub_A15F9 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine Palette_GetOrLoadWorkingBuffer_A1550
; et PaletteScreen_ComputeCurvePoint_A1430 — écrit une entrée de palette calculée et
; l'applique.
; ==============================================================================================
Palette_WriteEntryAndCommit_B39C9		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	large 0
		push	cs
		call	near ptr Palette_GetOrLoadWorkingBuffer_B3920
		add	sp, 4
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	dx
		push	ax
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	[bp+var_6], ax
		leave
		retf
Palette_WriteEntryAndCommit_B39C9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_BuildCustomGradient_A1626 (sub_A1626 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 537 lignes, NON DÉTAILLÉE —
; la plus grosse fonction du segment : charge la palette de travail
; (Palette_GetOrLoadWorkingBuffer_A1550), écrit 22 entrées de couleur explicites
; (Palette_WriteSingleEntry_A14F1) puis calcule 23 points de courbe
; (PaletteScreen_ComputeCurvePoint_A1430) et applique le tout
; (Palette_WriteAllDACRegisters_A14DF) — construction d'un dégradé de couleur personnalisé
; (jauge, effet de fondu). Candidat prioritaire pour session dédiée si le motif exact du
; dégradé doit être confirmé.
; ==============================================================================================
PaletteScreen_BuildCustomGradient_B39F6		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_4], 0
		cmp	[bp+arg_2], 0
		jz	short loc_B3A11
		push	large [bp+arg_2]
		jmp	short loc_B3A14

loc_B3A11:
		push	large 0

loc_B3A14:
		push	cs
		call	near ptr Palette_GetOrLoadWorkingBuffer_B3920
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+arg_0], 0
		jnz	short loc_B3A2A
		jmp	loc_B3C20

loc_B3A2A:
		push	large 0
		push	0
		push	word_79218
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 0
		push	0
		push	word_7921A
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 250025h
		push	25h
		push	word_7921C
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 29002Ch
		push	29h
		push	word_7921E
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 310031h
		push	31h
		push	word_79220
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 3F003Fh
		push	3Fh
		push	word_79222
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 0
		push	0
		push	word_791F8
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 2A0000h
		push	0
		push	word_791FA
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 2Ah
		push	0
		push	word_791FC
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 2A002Ah
		push	0
		push	word_791FE
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 0
		push	2Ah
		push	word_79200
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 2A0000h
		push	2Ah
		push	word_79202
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 15h
		push	2Ah
		push	word_79204
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 2A002Ah
		push	2Ah
		push	word_79206
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 150015h
		push	15h
		push	word_79208
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 3F0015h
		push	15h
		push	word_7920A
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 15003Fh
		push	15h
		push	word_7920C
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 3F003Fh
		push	15h
		push	word_7920E
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 150015h
		push	3Fh
		push	word_79210
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 3F0015h
		push	3Fh
		push	word_79212
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 15003Fh
		push	3Fh
		push	word_79214
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large 3F003Fh
		push	3Fh
		push	word_79216
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteSingleEntry_B38C1
		add	sp, 0Ch
		push	large [bp+var_4]
		push	cs
		call	near ptr Palette_WriteAllDACRegisters_B38AF
		add	sp, 4
		jmp	loc_B3DF2

loc_B3C20:
		push	large 0
		push	0
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_79218, ax
		push	large 0
		push	0
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_7921A, ax
		push	large 250025h
		push	25h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_7921C, ax
		push	large 29002Ch
		push	29h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_7921E, ax
		push	large 310031h
		push	31h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_79220, ax
		push	large 3F003Fh
		push	3Fh
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_79222, ax
		push	large 0
		push	0
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_791F8, ax
		push	large 2A0000h
		push	0
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_791FA, ax
		push	large 2Ah
		push	0
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_791FC, ax
		push	large 2A002Ah
		push	0
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_791FE, ax
		push	large 0
		push	2Ah
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_79200, ax
		push	large 2A0000h
		push	2Ah
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_79202, ax
		push	large 15h
		push	2Ah
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_79204, ax
		push	large 2A002Ah
		push	2Ah
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_79206, ax
		push	large 150015h
		push	15h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_79208, ax
		push	large 3F0015h
		push	15h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_7920A, ax
		push	large 15003Fh
		push	15h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_7920C, ax
		push	large 3F003Fh
		push	15h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_7920E, ax
		push	large 150015h
		push	3Fh
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_79210, ax
		push	large 3F0015h
		push	3Fh
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_79212, ax
		push	large 15003Fh
		push	3Fh
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_79214, ax
		push	large 3F003Fh
		push	3Fh
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_B3800
		add	sp, 0Ah
		mov	word_79216, ax

loc_B3DF2:
		leave
		retf
PaletteScreen_BuildCustomGradient_B39F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_FormatValueDisplay_A1A24 (sub_A1A24 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 112 lignes, NON DÉTAILLÉE — alloue (sub_658) et applique un style de texte
; (TextFormat_ApplyStyleAttribute_5E2D0, seg143).
; ==============================================================================================
PaletteScreen_FormatValueDisplay_B3DF4		proc far

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
		jnz	short loc_B3E13
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_B3E13
		jmp	loc_B3E9C

loc_B3E13:
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+0Dh], 0
		mov	word ptr [si+0Eh], 2AFAh
		push	word_7AF7E
		push	si
		call	TextFormat_ApplyStyleAttribute_67C41
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

loc_B3E9C:
		mov	ax, si
		pop	si
		leave
		retf
PaletteScreen_FormatValueDisplay_B3DF4		endp

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
Widget_SetFlagBit0_B3EA1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	byte ptr [si+10h], 8
		pop	si
		pop	bp
		retf
Widget_SetFlagBit0_B3EA1		endp

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
Widget_SetFlagBit4AndOffsets_B3EAF		proc far

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
Widget_SetFlagBit4AndOffsets_B3EAF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetBackground_A1AF9 (sub_A1AF9 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 239 lignes, NON DÉTAILLÉE —
; dessine le fond d'un widget selon ses flags (Render_FillClippedRect_61960, seg170), encadré
; par PaletteScreen_AcquireOwnership_A1240/ReleaseOwnership_A125D. Candidat pour session
; dédiée.
; ==============================================================================================
PaletteScreen_DrawWidgetBackground_B3EC9		proc far

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
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		mov	ax, [bp+arg_2]
		add	ax, di
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_4], ax
		test	[bp+arg_A], 1
		jnz	short loc_B3EFA
		jmp	loc_B3F7D

loc_B3EFA:
		mov	ax, [bp+arg_8]
		inc	ax
		shl	ax, 4
		sar	ax, 1
		mov	[bp+var_8], ax
		cwd
		idiv	di
		mov	[bp+var_A], ax
		mov	[bp+var_C], 0
		jmp	short loc_B3F75

loc_B3F13:
		test	[bp+arg_A], 2
		jz	short loc_B3F22
		mov	cx, [bp+arg_2]
		add	cx, [bp+var_C]
		jmp	short loc_B3F28

loc_B3F22:
		mov	cx, [bp+var_2]
		sub	cx, [bp+var_C]

loc_B3F28:
		mov	ax, [bp+var_A]
		sub	[bp+var_8], ax
		cmp	[bp+var_8], 10h
		jge	short loc_B3F3E
		xor	bx, bx
		mov	ax, [bp+arg_8]
		mov	[bp+var_6], ax
		jmp	short loc_B3F50

loc_B3F3E:
		mov	bx, [bp+var_8]
		sar	bx, 4
		mov	ax, bx
		shl	ax, 1
		mov	dx, [bp+arg_8]
		sub	dx, ax
		mov	[bp+var_6], dx

loc_B3F50:
		mov	al, byte ptr word_7921A
		push	ax
		mov	ax, [bp+arg_4]
		add	ax, bx
		add	ax, [bp+var_6]
		dec	ax
		push	ax
		push	cx
		mov	ax, [bp+arg_4]
		add	ax, bx
		push	ax
		push	cx
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		inc	[bp+var_C]

loc_B3F75:
		cmp	[bp+var_C], di
		jl	short loc_B3F13
		jmp	loc_B3FFC

loc_B3F7D:
		mov	ax, di
		inc	ax
		shl	ax, 4
		sar	ax, 1
		mov	[bp+var_8], ax
		cwd
		idiv	[bp+arg_8]
		mov	[bp+var_A], ax
		mov	[bp+var_C], 0
		jmp	short loc_B3FF4

loc_B3F96:
		test	[bp+arg_A], 2
		jz	short loc_B3FA5
		mov	cx, [bp+var_4]
		sub	cx, [bp+var_C]
		jmp	short loc_B3FAB

loc_B3FA5:
		mov	cx, [bp+arg_4]
		add	cx, [bp+var_C]

loc_B3FAB:
		mov	ax, [bp+var_A]
		sub	[bp+var_8], ax
		cmp	[bp+var_8], 10h
		jge	short loc_B3FBE
		xor	bx, bx
		mov	[bp+var_6], di
		jmp	short loc_B3FCF

loc_B3FBE:
		mov	bx, [bp+var_8]
		sar	bx, 4
		mov	ax, bx
		shl	ax, 1
		mov	dx, di
		sub	dx, ax
		mov	[bp+var_6], dx

loc_B3FCF:
		mov	al, byte ptr word_7921A
		push	ax
		push	cx
		mov	ax, [bp+arg_2]
		add	ax, bx
		add	ax, [bp+var_6]
		dec	ax
		push	ax
		push	cx
		mov	ax, [bp+arg_2]
		add	ax, bx
		push	ax
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		inc	[bp+var_C]

loc_B3FF4:
		mov	ax, [bp+var_C]
		cmp	ax, [bp+arg_8]
		jl	short loc_B3F96

loc_B3FFC:
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawWidgetBackground_B3EC9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetVariantA_A1C36 (sub_A1C36 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; PaletteScreen_DrawWidgetBackground_A1AF9 (variante d'appel).
; ==============================================================================================
PaletteScreen_DrawWidgetVariantA_B4006		proc far

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
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		add	ax, dx
		push	ax
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		add	ax, dx
		push	ax
		push	si
		push	cs
		call	near ptr PaletteScreen_DrawWidgetBackground_B3EC9
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
PaletteScreen_DrawWidgetVariantA_B4006		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetVariantB_A1C66 (sub_A1C66 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; PaletteScreen_DrawWidgetBackground_A1AF9 (autre variante d'appel).
; ==============================================================================================
PaletteScreen_DrawWidgetVariantB_B4036		proc far

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
		mov	cx, [si+16h]
		add	cx, [si+18h]
		mov	di, [si+4]
		add	di, cx
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		add	di, ax
		mov	ax, [si+6]
		add	ax, cx
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_2], ax
		mov	ax, [si+8]
		sub	ax, cx
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		dec	ax
		mov	[bp+var_4], ax
		mov	ax, [si+0Ah]
		sub	ax, cx
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		dec	ax
		mov	[bp+var_6], ax
		push	[bp+arg_2]
		sub	ax, [bp+var_2]
		inc	ax
		push	ax
		mov	ax, [bp+var_4]
		sub	ax, di
		inc	ax
		push	ax
		push	[bp+var_2]
		push	di
		push	si
		push	cs
		call	near ptr PaletteScreen_DrawWidgetBackground_B3EC9
		add	sp, 0Ch
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawWidgetVariantB_B4036		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetBorderA_A1CE1 (sub_A1CE1 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — ⚠️ far, 273 lignes, NON DÉTAILLÉE — dessine les
; bordures d'un widget (Render_DrawHorizontalLineClipped_61B8E,
; Rect_ComputeIntersection_60F02, Render_FillClippedRect_61960 ×6), encadré par le verrou
; d'ownership. Candidat pour session dédiée.
; ==============================================================================================
PaletteScreen_DrawWidgetBorderA_B40B1		proc far

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
		jnz	short loc_B40C5
		jmp	loc_B4239

loc_B40C5:
		cmp	word ptr [si+1Ch], 0
		jnz	short loc_B40CE
		jmp	loc_B4239

loc_B40CE:
		mov	di, [si+4]
		mov	ax, [si+4]
		add	ax, [si+1Ah]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		mov	[bp+var_4], ax
		add	ax, [si+1Ch]
		dec	ax
		mov	[bp+var_6], ax
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		mov	ax, [si+16h]
		mov	[bp+var_8], ax
		jmp	short loc_B411A

loc_B40F6:
		mov	al, byte ptr word_79218
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_7AF7E
		call	sub_6A150
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]

loc_B411A:
		mov	ax, [bp+var_8]
		dec	[bp+var_8]
		or	ax, ax
		jnz	short loc_B40F6
		mov	al, byte ptr word_79220
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		mov	al, [si+10h]
		shr	ax, 1
		and	ax, 1
		or	ax, ax
		jz	short loc_B41A8
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_B41A8
		mov	[bp+var_A], 0
		jmp	short loc_B419D

loc_B415E:
		mov	al, byte ptr word_7921C
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr word_7921C
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_A]

loc_B419D:
		mov	ax, [si+18h]
		cmp	ax, [bp+var_A]
		jg	short loc_B415E
		jmp	loc_B4233

loc_B41A8:
		mov	[bp+var_A], 0
		jmp	short loc_B4228

loc_B41AF:
		mov	al, byte ptr word_7921C
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		mov	ax, [bp+var_4]
		inc	ax
		push	ax
		push	[bp+var_2]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr word_7921C
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_6]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr word_79222
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr word_79222
		push	ax
		mov	ax, [bp+var_6]
		dec	ax
		push	ax
		push	di
		push	[bp+var_4]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_A]

loc_B4228:
		mov	ax, [si+18h]
		cmp	ax, [bp+var_A]
		jle	short loc_B4233
		jmp	loc_B41AF

loc_B4233:
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx

loc_B4239:
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawWidgetBorderA_B40B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetBorderB_A1E6D (sub_A1E6D de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — ⚠️ far, 268 lignes, NON DÉTAILLÉE — variante de
; PaletteScreen_DrawWidgetBorderA_A1CE1 (mêmes appels), probable style de bordure différent.
; Candidat pour session dédiée.
; ==============================================================================================
PaletteScreen_DrawWidgetBorderB_B423D		proc far

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
		mov	dx, [bp+arg_6]
		mov	cx, [bp+arg_8]
		or	dx, dx
		jnz	short loc_B4255
		jmp	loc_B43B1

loc_B4255:
		or	cx, cx
		jnz	short loc_B425C
		jmp	loc_B43B1

loc_B425C:
		mov	di, [si+4]
		add	di, [bp+arg_2]
		mov	ax, di
		add	ax, dx
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		add	ax, cx
		dec	ax
		mov	[bp+var_6], ax
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		jmp	short loc_B42A5

loc_B4281:
		mov	al, byte ptr word_79218
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_7AF7E
		call	sub_6A150
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]

loc_B42A5:
		mov	ax, [bp+arg_C]
		dec	[bp+arg_C]
		or	ax, ax
		jnz	short loc_B4281
		mov	al, byte ptr word_79220
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		cmp	[bp+arg_A], 0
		jz	short loc_B4320
		mov	[bp+var_8], 0
		jmp	short loc_B4315

loc_B42D6:
		mov	al, byte ptr word_7921C
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr word_7921C
		push	ax
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_8]

loc_B4315:
		mov	ax, [bp+var_8]
		cmp	ax, [bp+arg_E]
		jl	short loc_B42D6
		jmp	loc_B43AB

loc_B4320:
		mov	[bp+var_8], 0
		jmp	short loc_B43A0

loc_B4327:
		mov	al, byte ptr word_7921C
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		mov	ax, [bp+var_4]
		inc	ax
		push	ax
		push	[bp+var_2]
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr word_7921C
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_6]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr word_79222
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		mov	al, byte ptr word_79222
		push	ax
		mov	ax, [bp+var_6]
		dec	ax
		push	ax
		push	di
		push	[bp+var_4]
		push	di
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		inc	di
		inc	[bp+var_4]
		dec	[bp+var_2]
		dec	[bp+var_6]
		inc	[bp+var_8]

loc_B43A0:
		mov	ax, [bp+var_8]
		cmp	ax, [bp+arg_E]
		jge	short loc_B43AB
		jmp	loc_B4327

loc_B43AB:
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx

loc_B43B1:
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawWidgetBorderB_B423D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B43B5		proc far

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
		add	ax, [si+1Ah]
		dec	ax
		mov	[bp+var_4], ax
		mov	ax, [si+6]
		mov	[bp+var_6], ax
		add	ax, [si+1Ch]
		dec	ax
		mov	[bp+var_8], ax
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+var_8]
		push	[bp+var_4]
		push	[bp+var_6]
		push	[bp+var_2]
		push	word_7AF7E
		call	sub_6A150
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		pop	si
		leave
		retf
sub_B43B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B4404		proc far

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
		add	ax, [si+1Ah]
		dec	ax
		mov	[bp+var_4], ax
		mov	ax, [si+6]
		mov	[bp+var_6], ax
		add	ax, [si+1Ch]
		dec	ax
		mov	[bp+var_8], ax
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+var_8]
		push	[bp+var_4]
		push	[bp+var_6]
		push	[bp+var_2]
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		pop	si
		leave
		retf
sub_B4404		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B4453		proc far

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
		mov	di, [si+4]
		add	di, [bp+arg_2]
		mov	ax, di
		add	ax, [bp+arg_6]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_6], ax
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		mov	al, [bp+arg_A]
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_7AF7E
		call	sub_6A150
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_B4453		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B44A7		proc far

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
		mov	di, [si+4]
		add	di, [bp+arg_2]
		mov	ax, di
		add	ax, [bp+arg_6]
		dec	ax
		mov	[bp+var_2], ax
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_6], ax
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		mov	al, [bp+arg_A]
		push	ax
		push	[bp+var_6]
		push	[bp+var_2]
		push	[bp+var_4]
		push	di
		push	word_7AF7E
		call	sub_69728
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_B44A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetPixel_A212B (sub_A212B de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, trace un pixel (Render_SetPixelClipped_61B58,
; seg171), encadré par le verrou d'ownership.
; ==============================================================================================
PaletteScreen_DrawWidgetPixel_B44FB		proc far

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
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		mov	al, [bp+arg_6]
		push	ax
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		push	ax
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		push	ax
		push	word_7AF7E
		call	Render_SetPixelClipped_6A11A
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		pop	si
		pop	bp
		retf
PaletteScreen_DrawWidgetPixel_B44FB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetFillC_A215F (sub_A215F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, remplit une zone
; (Render_FillClippedRect_61960), encadrée par le verrou d'ownership.
; ==============================================================================================
PaletteScreen_DrawWidgetFillC_B452F		proc far

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
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
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
		push	word_7AF7E
		call	sub_69F22
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		pop	si
		pop	bp
		retf
PaletteScreen_DrawWidgetFillC_B452F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetBorderWrapper_A21A1 (sub_A21A1 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, enveloppe appelant
; PaletteScreen_DrawWidgetBorderA_A1CE1.
; ==============================================================================================
PaletteScreen_DrawWidgetBorderWrapper_B4571		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr PaletteScreen_DrawWidgetBorderA_B40B1
		pop	cx
		pop	bp
		retf
PaletteScreen_DrawWidgetBorderWrapper_B4571		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_UpdateWidgetMain_A21AF (sub_A21AF de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 419 lignes, NON DÉTAILLÉE — la plus grosse fonction de logique métier du segment : dispatch
; vtable ([bx+0x18], [bx+0x2C] ×2), application de style de texte
; (TextScroll_FormatAndApply_67204, seg204, sub_28A63/sub_288A6 externes), encadrée par le
; verrou d'ownership. Probable point d'entrée principal de mise à jour/rendu du widget.
; Candidat prioritaire pour session dédiée.
; ==============================================================================================
PaletteScreen_UpdateWidgetMain_B457F		proc far

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
		mov	di, [bp+arg_6]
		mov	al, [si+10h]
		shr	ax, 2
		and	ax, 1
		or	ax, ax
		jnz	short loc_B45AA
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_B45AA
		jmp	loc_B47B3

loc_B45AA:
		mov	al, [si+10h]
		shr	ax, 1
		and	ax, 1
		or	ax, ax
		jz	short loc_B45E4
		mov	al, [si+10h]
		shr	ax, 3
		and	ax, 1
		or	ax, ax
		jz	short loc_B45DE
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		xor	ax, 1
		and	ax, 1
		and	byte ptr [si+10h], 0DFh
		shl	al, 5
		or	[si+10h], al
		jmp	short loc_B45E8

loc_B45DE:
		or	byte ptr [si+10h], 20h
		jmp	short loc_B45E8

loc_B45E4:
		and	byte ptr [si+10h], 0DFh

loc_B45E8:
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_B4606
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx

loc_B4606:
		mov	al, [si+10h]
		shr	ax, 4
		and	ax, 1
		or	ax, ax
		jnz	short loc_B4616
		jmp	loc_B4706

loc_B4616:
		xor	eax, eax
		mov	[bp+var_A], eax
		mov	[bp+var_E], eax
		movsx	eax, word ptr [si+11h]
		mov	[bp+var_12], eax
		mov	[bp+var_A], eax
		mov	eax, dword_7B29D
		mov	[bp+var_E], eax
		push	[bp+arg_8]
		push	di
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+2Ch]
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		or	di, di
		jnz	short loc_B4657
		jmp	loc_B476A

loc_B4657:
		push	66D8h
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte_7CE08, 0
		jnz	short loc_B4687
		push	66D8h
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B4687
		lea	ax, [bp+var_16]
		push	ax
		push	66D8h
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_B4687

loc_B4687:
		mov	al, byte_7CE0E
		mov	[bp+var_18], al
		test	[bp+var_18], 3
		jnz	short loc_B4696
		jmp	loc_B476A

loc_B4696:
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 3
		jnz	short loc_B46B4
		mov	ax, word_7CE0A
		sar	ax, 1
		sub	ax, [si+4]
		mov	[bp+arg_2], ax
		mov	ax, word_7CE0C
		sub	ax, [si+6]
		mov	[bp+arg_4], ax

loc_B46B4:
		mov	eax, [bp+var_E]
		add	eax, [bp+var_A]
		cmp	eax, dword_7B29D
		ja	short loc_B46C8
		mov	ax, 1
		jmp	short loc_B46CA

loc_B46C8:
		xor	ax, ax

loc_B46CA:
		or	al, al
		jz	short loc_B46F7
		movsx	eax, word ptr [si+13h]
		mov	[bp+var_1C], eax
		mov	[bp+var_A], eax
		mov	eax, dword_7B29D
		mov	[bp+var_E], eax
		push	[bp+arg_8]
		push	di
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+2Ch]
		add	sp, 0Ah

loc_B46F7:
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_B4704
		jmp	loc_B4657

loc_B4704:
		jmp	short loc_B476A

loc_B4706:
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		or	di, di
		jz	short loc_B4756

loc_B4710:
		push	66D8h
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte_7CE08, 0
		jnz	short loc_B4740
		push	66D8h
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B4740
		lea	ax, [bp+var_4]
		push	ax
		push	66D8h
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_B4740

loc_B4740:
		mov	al, byte_7CE0E
		mov	[bp+var_6], al
		test	[bp+var_6], 0
		jnz	short loc_B4756
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_B4710

loc_B4756:
		push	[bp+arg_8]
		push	di
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+2Ch]
		add	sp, 0Ah

loc_B476A:
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_B47AD
		mov	al, [si+10h]
		and	ax, 1
		or	ax, ax
		jz	short loc_B47AD
		mov	al, [si+10h]
		shr	ax, 2
		and	ax, 1
		or	ax, ax
		jz	short loc_B47AD
		mov	al, [si+10h]
		shr	ax, 3
		and	ax, 1
		or	ax, ax
		jnz	short loc_B479F
		and	byte ptr [si+10h], 0DFh

loc_B479F:
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx

loc_B47AD:
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx

loc_B47B3:
		pop	di
		pop	si
		leave
		retf
PaletteScreen_UpdateWidgetMain_B457F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_DrawWidgetVariantC_A23E7 (sub_A23E7 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle sub_6C875 (stub voisin),
; encadré par le verrou d'ownership.
; ==============================================================================================
PaletteScreen_DrawWidgetVariantC_B47B7		proc far

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
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		push	word_79260
		push	[bp+arg_8]
		push	[bp+arg_6]
		mov	ax, [si+6]
		add	ax, [bp+arg_4]
		push	ax
		mov	ax, [si+4]
		add	ax, [bp+arg_2]
		push	ax
		call	sub_74BA9
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		pop	si
		pop	bp
		retf
PaletteScreen_DrawWidgetVariantC_B47B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ApplyTextStyle_A241D (sub_A241D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; applique un style de texte (TextScroll_FormatAndApply_67204, sub_28A63/sub_288A6 externes).
; ==============================================================================================
PaletteScreen_ApplyTextStyle_B47ED		proc far

var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_0]

loc_B47F6:
		push	66D8h
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte_7CE08, 0
		jnz	short loc_B4826
		push	66D8h
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B4826
		lea	ax, [bp+var_4]
		push	ax
		push	66D8h
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_B4826

loc_B4826:
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_B47F6
		leave
		retf
PaletteScreen_ApplyTextStyle_B47ED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ApplyTextStyleB_A2462 (sub_A2462 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; variante de PaletteScreen_ApplyTextStyle_A241D.
; ==============================================================================================
PaletteScreen_ApplyTextStyleB_B4832		proc far

var_4		= word ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	di, [bp+arg_4]

loc_B4843:
		push	66D8h
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte_7CE08, 0
		jnz	short loc_B4873
		push	66D8h
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B4873
		lea	ax, [bp+var_4]
		push	ax
		push	66D8h
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_B4873

loc_B4873:
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_B4889
		mov	ax, word_7CE0A
		sar	ax, 1
		mov	[si], ax
		mov	ax, word_7CE0C
		mov	[di], ax

loc_B4889:
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_B4843
		pop	di
		pop	si
		leave
		retf
PaletteScreen_ApplyTextStyleB_B4832		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_DrawCurveWithLabel_A24C7 (sub_A24C7 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 294 lignes, NON DÉTAILLÉE — combine PaletteScreen_DrawCurveShape_A1375 (×4),
; PaletteScreen_ApplyTextStyle_A241D, TextScroll_FormatAndApply_67204 — dessin d'une forme
; courbe avec étiquette de texte. Candidat pour session dédiée.
; ==============================================================================================
PaletteScreen_DrawCurveWithLabel_B4897		proc far

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
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+4]
		mov	ax, [si+6]
		mov	[bp+var_2], ax
		mov	ax, [si+1Ah]
		mov	[bp+var_4], ax
		mov	ax, [si+1Ch]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_A], ax
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_B3745
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		push	si
		push	cs
		call	near ptr PaletteScreen_ApplyTextStyle_B47ED
		pop	cx
		mov	[bp+var_C], 0

loc_B48EB:
		push	66D8h
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte_7CE08, 0
		jnz	short loc_B491B
		push	66D8h
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B491B
		lea	ax, [bp+var_10]
		push	ax
		push	66D8h
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_B491B

loc_B491B:
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_B4930
		mov	al, byte_7CE09
		mov	ah, 0
		and	ax, 2
		mov	[bp+var_C], ax

loc_B4930:
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_B493D
		jmp	loc_B49EE

loc_B493D:
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_B3745
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		mov	bx, word_7CE0A
		sar	bx, 1
		mov	cx, word_7CE0C
		mov	ax, bx
		sub	ax, [bp+arg_6]
		cmp	ax, [bp+var_8]
		jge	short loc_B4976
		mov	ax, bx
		sub	ax, [bp+arg_6]
		mov	[bp+var_8], ax

loc_B4976:
		mov	ax, cx
		sub	ax, [bp+arg_8]
		cmp	ax, [bp+var_A]
		jge	short loc_B4988
		mov	ax, cx
		sub	ax, [bp+arg_8]
		mov	[bp+var_A], ax

loc_B4988:
		mov	ax, [bp+arg_A]
		inc	ax
		sub	ax, bx
		mov	dx, [bp+var_4]
		sub	dx, [bp+var_8]
		cmp	ax, dx
		jge	short loc_B49A6
		mov	ax, [bp+arg_A]
		inc	ax
		sub	ax, bx
		mov	dx, [bp+var_4]
		sub	dx, ax
		mov	[bp+var_8], dx

loc_B49A6:
		mov	ax, [bp+arg_C]
		inc	ax
		sub	ax, cx
		mov	dx, [bp+var_6]
		sub	dx, [bp+var_A]
		cmp	ax, dx
		jge	short loc_B49C4
		mov	ax, [bp+arg_C]
		inc	ax
		sub	ax, cx
		mov	dx, [bp+var_6]
		sub	dx, ax
		mov	[bp+var_A], dx

loc_B49C4:
		mov	di, bx
		sub	di, [bp+var_8]
		mov	ax, cx
		sub	ax, [bp+var_A]
		mov	[bp+var_2], ax
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_B3745
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx

loc_B49EE:
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_B49FB
		jmp	loc_B48EB

loc_B49FB:
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	di
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_B3745
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		cmp	[bp+var_C], 0
		jnz	short loc_B4A35
		mov	ax, [bp+var_2]
		sub	ax, [si+6]
		push	ax
		mov	ax, di
		sub	ax, [si+4]
		push	ax
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+8]
		add	sp, 6

loc_B4A35:
		mov	ax, [bp+var_C]
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawCurveWithLabel_B4897		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_DrawCurveWithLabelB_A2671 (sub_A2671 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 298 lignes, NON DÉTAILLÉE — variante de PaletteScreen_DrawCurveWithLabel_A24C7 (mêmes
; appels). Candidat pour session dédiée.
; ==============================================================================================
PaletteScreen_DrawCurveWithLabelB_B4A41		proc far

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
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_B3745
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		push	si
		push	cs
		call	near ptr PaletteScreen_ApplyTextStyle_B47ED
		pop	cx
		mov	[bp+var_C], 0

loc_B4A89:
		push	66D8h
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte_7CE08, 0
		jnz	short loc_B4AB9
		push	66D8h
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B4AB9
		lea	ax, [bp+var_10]
		push	ax
		push	66D8h
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_B4AB9

loc_B4AB9:
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_B4ACE
		mov	al, byte_7CE09
		mov	ah, 0
		and	ax, 2
		mov	[bp+var_C], ax

loc_B4ACE:
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 3
		jz	short loc_B4ADB
		jmp	loc_B4B5E

loc_B4ADB:
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_B3745
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		mov	ax, word_7CE0A
		sar	ax, 1
		mov	[bp+var_8], ax
		mov	ax, word_7CE0C
		mov	[bp+var_A], ax
		mov	di, [bp+var_8]
		sub	di, [bp+var_2]
		inc	di
		cmp	di, [bp+arg_2]
		jge	short loc_B4B17
		mov	di, [bp+arg_2]
		jmp	short loc_B4B1F

loc_B4B17:
		cmp	di, [bp+arg_6]
		jle	short loc_B4B1F
		mov	di, [bp+arg_6]

loc_B4B1F:
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_4]
		inc	ax
		mov	[bp+var_6], ax
		cmp	ax, [bp+arg_4]
		jge	short loc_B4B33
		mov	ax, [bp+arg_4]
		jmp	short loc_B4B3E

loc_B4B33:
		mov	ax, [bp+var_6]
		cmp	ax, [bp+arg_8]
		jle	short loc_B4B41
		mov	ax, [bp+arg_8]

loc_B4B3E:
		mov	[bp+var_6], ax

loc_B4B41:
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_B3745
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx

loc_B4B5E:
		mov	al, byte_7CE08
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_B4B6B
		jmp	loc_B4A89

loc_B4B6B:
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		push	[bp+var_6]
		push	di
		push	[bp+var_4]
		push	[bp+var_2]
		push	cs
		call	near ptr PaletteScreen_DrawCurveShape_B3745
		add	sp, 8
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		cmp	[bp+var_C], 0
		jnz	short loc_B4BCF
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

loc_B4BCF:
		mov	ax, [bp+var_C]
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	di
		pop	si
		leave
		retf
PaletteScreen_DrawCurveWithLabelB_B4A41		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B4BDB		proc far

var_64		= word ptr -64h
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 64h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	large [si+24h]
		push	ss
		lea	ax, [bp+var_64]
		push	ax
		call	sub_38D6
		add	sp, 8
		lea	ax, [bp+var_64]
		push	ax
		call	sub_74B9A
		pop	cx
		mov	cx, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	di, [si+1Ah]
		sub	di, ax
		mov	word ptr [si+1Eh], 0
		cmp	cx, di
		jge	short loc_B4C25
		mov	ax, di
		sub	ax, cx
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[si+1Eh], ax

loc_B4C25:
		pop	di
		pop	si
		leave
		retf
sub_B4BDB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B4C29		proc far

var_68		= word ptr -68h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	large [di+24h]
		push	ss
		lea	ax, [bp+var_68]
		push	ax
		call	sub_38D6
		add	sp, 8
		lea	ax, [bp+var_68]
		push	ax
		call	sub_74B9A
		pop	cx
		mov	[bp+var_2], ax
		mov	ax, [di+16h]
		add	ax, [di+18h]
		shl	ax, 1
		mov	dx, [di+1Ah]
		sub	dx, ax
		mov	[bp+var_4], dx
		mov	word ptr [di+20h], 0
		jmp	short loc_B4C83

loc_B4C69:
		mov	bx, [di+20h]
		inc	word ptr [di+20h]
		lea	ax, [bp+var_68]
		add	bx, ax
		mov	al, [bx]
		push	ax
		call	sub_74B9F
		pop	cx
		add	ax, 2
		sub	[bp+var_2], ax

loc_B4C83:
		mov	ax, [bp+var_2]
		cmp	ax, [bp+var_4]
		jg	short loc_B4C69
		pop	di
		pop	si
		leave
		retf
sub_B4C29		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B4C8F		proc far

var_78		= word ptr -78h
var_76		= word ptr -76h
var_6A		= word ptr -6Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	large [si+24h]
		push	ss
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_38D6
		add	sp, 8
		mov	ax, [si+22h]
		cmp	ax, 0FFFEh
		jz	short loc_B4CCB
		cmp	ax, 0FFFFh
		jnz	short loc_B4CC0
		push	si
		push	cs
		call	near ptr PaletteScreen_DrawWidgetBorderA_B40B1
		pop	cx
		jmp	short loc_B4CCB

loc_B4CC0:
		push	word ptr [si+22h]
		push	si
		push	cs
		call	near ptr sub_B4404
		add	sp, 4

loc_B4CCB:
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
		mov	di, [si+2Ah]
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_B4D09
		mov	di, [si+28h]

loc_B4D09:
		mov	ax, word_79260
		add	ax, 2
		mov	[bp+var_6], ax
		mov	[bp+var_78], 0
		mov	[bp+var_76], 0
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	si
		mov	ax, word_79260
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		push	word_79260
		push	di
		mov	ax, [si+20h]
		lea	dx, [bp+var_6A]
		add	ax, dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		call	sub_74BA9
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		lea	ax, [bp+var_78]
		push	ax
		mov	ax, word_79260
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		lea	ax, [bp+var_78]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_B4C8F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B4D82		proc far

var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+24h], 0
		jz	short loc_B4DAE
		push	0
		push	2
		mov	eax, [si+24h]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_B4DAE:
		push	large [bp+arg_2]
		call	sub_398A
		add	sp, 4
		inc	ax
		mov	[bp+var_6], ax
		push	1
		push	0
		push	2
		movsx	eax, [bp+var_6]
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+26h], dx
		mov	[si+24h], ax
		cmp	dword ptr [si+24h], 0
		jz	short loc_B4DF3
		push	large [bp+arg_2]
		push	large [si+24h]
		call	sub_38D6
		add	sp, 8

loc_B4DF3:
		pop	si
		leave
		retf
sub_B4D82		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_MeasureAndDrawBorder_A29B4 (sub_A29B4 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine PaletteScreen_DrawWidgetBorderWrapper_A21A1, Memory_TypedAllocDispatchB_5C832,
; Shape_DrawSpans_61F52 (seg174).
; ==============================================================================================
PaletteScreen_MeasureAndDrawBorder_B4DF6		proc far

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
		call	near ptr PaletteScreen_DrawWidgetBorderA_B40B1
		pop	cx
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
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		push	word ptr [si+28h]
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		pop	si
		leave
		retf
PaletteScreen_MeasureAndDrawBorder_B4DF6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_MeasureAndDrawBorderB_A2A22 (sub_A2A22
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️
; far, 143 lignes, NON DÉTAILLÉE — variante de PaletteScreen_MeasureAndDrawBorder_A29B4,
; ajoute TextFormat_ApplyStyleAttribute_5E2D0 (×2), TextFormat_ReleaseStyleList_5E526.
; ==============================================================================================
PaletteScreen_MeasureAndDrawBorderB_B4E64		proc far

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
		mov	ax, word_79260
		add	ax, 2
		mov	[bp+var_A], ax
		mov	[bp+var_18], 0
		mov	[bp+var_16], 0
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	si
		mov	ax, word_79260
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	si
		push	cs
		call	near ptr PaletteScreen_AcquireOwnership_B3610
		pop	cx
		mov	ax, [si+28h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		push	ax
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	word_79260
		push	0FFh
		mov	ax, [si+2Eh]
		add	ax, [si+28h]
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		call	sub_74BA9
		add	sp, 0Ah
		push	si
		push	cs
		call	near ptr PaletteScreen_ReleaseOwnership_B362D
		pop	cx
		lea	ax, [bp+var_18]
		push	ax
		mov	ax, word_79260
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		lea	ax, [bp+var_18]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		pop	si
		leave
		retf
PaletteScreen_MeasureAndDrawBorderB_B4E64		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_HelperC_A2B1F (sub_A2B1F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle sub_6C875 (stub voisin).
; ==============================================================================================
PaletteScreen_HelperC_B4F61		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+2Eh]
		call	sub_74B9A
		pop	cx
		mov	cx, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	di, [si+1Ah]
		sub	di, ax
		mov	word ptr [si+2Ah], 0
		cmp	cx, di
		jge	short loc_B4F96
		mov	ax, di
		sub	ax, cx
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[si+2Ah], ax

loc_B4F96:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_HelperC_B4F61		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_HelperD_A2B58 (sub_A2B58 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_6C875 et sub_6C87A (stubs
; voisins).
; ==============================================================================================
PaletteScreen_HelperD_B4F9A		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word ptr [si+2Eh]
		call	sub_74B9A
		pop	cx
		mov	di, ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		shl	ax, 1
		mov	dx, [si+1Ah]
		sub	dx, ax
		mov	[bp+var_2], dx
		mov	word ptr [si+2Ch], 0
		jmp	short loc_B4FE0

loc_B4FC7:
		mov	ax, [si+2Ch]
		inc	word ptr [si+2Ch]
		mov	bx, [si+2Eh]
		add	bx, ax
		mov	al, [bx]
		push	ax
		call	sub_74B9F
		pop	cx
		add	ax, 2
		sub	di, ax

loc_B4FE0:
		cmp	di, [bp+var_2]
		jg	short loc_B4FC7
		pop	di
		pop	si
		leave
		retf
PaletteScreen_HelperD_B4F9A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_ReleaseResourcesB_A2BA7 (sub_A2BA7 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_338, sub_2B1C, sub_658,
; sub_2A82, PaletteScreen_HelperC_A2B1F.
; ==============================================================================================
PaletteScreen_ReleaseResourcesB_B4FE9		proc far

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
		jz	short loc_B5006
		push	word ptr [si+2Eh]
		call	sub_3B2
		pop	cx

loc_B5006:
		push	di
		call	CRT_Strlen
		pop	cx
		inc	ax
		mov	[bp+var_2], ax
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+2Eh], ax
		cmp	word ptr [si+2Eh], 0
		jz	short loc_B502D
		push	di
		push	word ptr [si+2Eh]
		call	CRT_Strcpy
		add	sp, 4

loc_B502D:
		push	si
		push	cs
		call	near ptr PaletteScreen_HelperC_B4F61
		pop	cx
		pop	di
		pop	si
		leave
		retf
PaletteScreen_ReleaseResourcesB_B4FE9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PaletteScreen_ResetGlobalFlag_A2BF5 (sub_A2BF5 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, réinitialise un indicateur global
; (byte_728FE).
; ==============================================================================================
PaletteScreen_ResetGlobalFlag_B5037		proc far
		push	bp
		mov	bp, sp
		mov	byte_7CE08, 0
		pop	bp
		retf
PaletteScreen_ResetGlobalFlag_B5037		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PaletteScreen_ReleaseStyleAndObject_A2BFF (sub_A2BFF
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine TextFormat_ReleaseStyleList_5E526 et libération d'objet (sub_338).
; ==============================================================================================
PaletteScreen_ReleaseStyleAndObject_B5041		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B5066
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_B5066
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_B5066

loc_B5066:
		pop	di
		pop	si
		pop	bp
		retf
PaletteScreen_ReleaseStyleAndObject_B5041		endp
ovr328		ends
